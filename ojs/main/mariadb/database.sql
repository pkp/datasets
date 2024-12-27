/*M!999999\- enable the sandbox mode */ 
-- MariaDB dump 10.19  Distrib 10.11.10-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: ojs-ci
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
  CONSTRAINT `announcement_types_context_id_foreign` FOREIGN KEY (`context_id`) REFERENCES `journals` (`journal_id`) ON DELETE CASCADE
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
) ENGINE=InnoDB AUTO_INCREMENT=124 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='More data about authors, including localized properties such as their name and affiliation.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `author_settings`
--

LOCK TABLES `author_settings` WRITE;
/*!40000 ALTER TABLE `author_settings` DISABLE KEYS */;
INSERT INTO `author_settings` VALUES
(1,1,'en','affiliation','University of Cape Town'),
(2,1,'','country','ZA'),
(3,1,'en','familyName','Mwandenga'),
(4,1,'en','givenName','Alan'),
(5,2,'en','affiliation',NULL),
(6,2,'fr_CA','affiliation',NULL),
(7,2,'en','biography',NULL),
(8,2,'fr_CA','biography',NULL),
(9,2,'','country','BB'),
(10,2,'en','familyName','Mansour'),
(11,2,'fr_CA','familyName',NULL),
(12,2,'en','givenName','Amina'),
(13,2,'fr_CA','givenName',NULL),
(14,2,'en','preferredPublicName',NULL),
(15,2,'fr_CA','preferredPublicName',NULL),
(27,4,'','country','ZA'),
(28,4,'en','familyName','Riouf'),
(29,4,'en','givenName','Nicolas'),
(30,5,'en','affiliation','University of Cape Town'),
(31,5,'','country','ZA'),
(32,5,'en','familyName','Mwandenga Version 2'),
(33,5,'en','givenName','Alan'),
(34,6,'','country','BB'),
(35,6,'en','familyName','Mansour'),
(36,6,'en','givenName','Amina'),
(37,7,'','country','ZA'),
(38,7,'en','familyName','Riouf'),
(39,7,'en','givenName','Nicolas'),
(40,8,'en','affiliation','University of Bologna'),
(41,8,'','country','IT'),
(42,8,'en','familyName','Corino'),
(43,8,'en','givenName','Carlo'),
(44,9,'en','affiliation','University of Windsor'),
(45,9,'','country','CA'),
(46,9,'en','familyName','Kwantes'),
(47,9,'en','givenName','Catherine'),
(48,10,'en','affiliation','University of Alberta'),
(49,10,'','country','CA'),
(50,10,'en','familyName','Montgomerie'),
(51,10,'en','givenName','Craig'),
(52,11,'en','affiliation','University of Victoria'),
(53,11,'','country','CA'),
(54,11,'en','familyName','Irvine'),
(55,11,'en','givenName','Mark'),
(56,12,'en','affiliation','Alexandria University'),
(57,12,'','country','EG'),
(58,12,'en','familyName','Diouf'),
(59,12,'en','givenName','Diaga'),
(60,13,'en','affiliation','University of Toronto'),
(61,13,'','country','CA'),
(62,13,'en','familyName','Phillips'),
(63,13,'en','givenName','Dana'),
(64,14,'en','affiliation','University College Cork'),
(65,14,'','country','IE'),
(66,14,'en','familyName','Sokoloff'),
(67,14,'en','givenName','Domatilia'),
(68,15,'en','affiliation','Indiana University'),
(69,15,'','country','US'),
(70,15,'en','familyName','Ostrom'),
(71,15,'en','givenName','Elinor'),
(72,16,'en','affiliation','Indiana University'),
(73,16,'','country','US'),
(74,16,'en','familyName','van Laerhoven'),
(75,16,'en','givenName','Frank'),
(76,17,'en','affiliation','University of Rome'),
(77,17,'','country','IT'),
(78,17,'en','familyName','Paglieri'),
(79,17,'en','givenName','Fabio'),
(80,18,'en','affiliation','Aalborg University'),
(81,18,'','country','DK'),
(82,18,'en','familyName','Novak'),
(83,18,'en','givenName','John'),
(84,19,'en','affiliation','Stanford University'),
(85,19,'','country','US'),
(86,19,'en','familyName','Al-Khafaji'),
(87,19,'en','givenName','Karim'),
(88,20,'en','affiliation','Stanford University'),
(89,20,'','country','US'),
(90,20,'en','familyName','Morse'),
(91,20,'en','givenName','Margaret'),
(92,21,'en','affiliation','Australian National University'),
(93,21,'','country','AU'),
(94,21,'en','familyName','Christopher'),
(95,21,'en','givenName','Leo'),
(96,22,'en','affiliation','University of Cape Town'),
(97,22,'','country','ZA'),
(98,22,'en','familyName','Kumiega'),
(99,22,'en','givenName','Lise'),
(100,23,'en','affiliation','University of Wolverhampton'),
(101,23,'','country','GB'),
(102,23,'en','familyName','Daniel'),
(103,23,'en','givenName','Patricia'),
(104,24,'en','affiliation','University of Nairobi'),
(105,24,'','country','KE'),
(106,24,'en','familyName','Baiyewu'),
(107,24,'en','givenName','Rana'),
(108,25,'en','affiliation','Barcelona University'),
(109,25,'','country','ES'),
(110,25,'en','familyName','Rossi'),
(111,25,'en','givenName','Rosanna'),
(112,26,'en','affiliation','University of Tehran'),
(113,26,'','country','IR'),
(114,26,'en','familyName','Karbasizaed'),
(115,26,'en','givenName','Vajiheh'),
(116,27,'en','affiliation','University of Windsor'),
(117,27,'','country','CA'),
(118,27,'en','familyName','Williamson'),
(119,27,'en','givenName','Valerie'),
(120,28,'en','affiliation','CUNY'),
(121,28,'','country','US'),
(122,28,'en','familyName','Woods'),
(123,28,'en','givenName','Zita');
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
  CONSTRAINT `authors_publication_id_foreign` FOREIGN KEY (`publication_id`) REFERENCES `publications` (`publication_id`) ON DELETE CASCADE,
  CONSTRAINT `authors_user_group_id_foreign` FOREIGN KEY (`user_group_id`) REFERENCES `user_groups` (`user_group_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='The authors of a publication.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `authors`
--

LOCK TABLES `authors` WRITE;
/*!40000 ALTER TABLE `authors` DISABLE KEYS */;
INSERT INTO `authors` VALUES
(1,'amwandenga@mailinator.com',1,1,0,14),
(2,'notanemailamansour@mailinator.com',1,1,1,14),
(4,'nriouf@mailinator.com',1,1,2,14),
(5,'amwandenga@mailinator.com',1,2,0,14),
(6,'notanemailamansour@mailinator.com',1,2,1,14),
(7,'nriouf@mailinator.com',1,2,2,14),
(8,'ccorino@mailinator.com',1,3,0,14),
(9,'ckwantes@mailinator.com',1,4,0,14),
(10,'cmontgomerie@mailinator.com',1,5,0,14),
(11,'mirvine@mailinator.com',1,5,0,14),
(12,'ddiouf@mailinator.com',1,6,0,14),
(13,'dphillips@mailinator.com',1,7,0,14),
(14,'dsokoloff@mailinator.com',1,8,0,14),
(15,'eostrom@mailinator.com',1,9,0,14),
(16,'fvanlaerhoven@mailinator.com',1,9,0,14),
(17,'fpaglieri@mailinator.com',1,10,0,14),
(18,'jnovak@mailinator.com',1,11,0,14),
(19,'kalkhafaji@mailinator.com',1,12,0,14),
(20,'mmorse@mailinator.com',1,12,0,14),
(21,'lchristopher@mailinator.com',1,13,0,14),
(22,'lkumiega@mailinator.com',1,14,0,14),
(23,'pdaniel@mailinator.com',1,15,0,14),
(24,'rbaiyewu@mailinator.com',1,16,0,14),
(25,'rrossi@mailinator.com',1,17,0,14),
(26,'vkarbasizaed@mailinator.com',1,18,0,14),
(27,'vwilliamson@mailinator.com',1,19,0,14),
(28,'zwoods@mailinator.com',1,20,0,14);
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
  CONSTRAINT `categories_context_id_foreign` FOREIGN KEY (`context_id`) REFERENCES `journals` (`journal_id`) ON DELETE CASCADE,
  CONSTRAINT `categories_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `categories` (`category_id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='Categories permit the organization of submissions into a heirarchical structure.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES
(1,1,NULL,1,'applied-science',NULL),
(2,1,1,2,'comp-sci',NULL),
(3,1,1,3,'eng',NULL),
(4,1,NULL,4,'social-sciences',NULL),
(5,1,4,5,'sociology',NULL),
(6,1,4,10000,'anthropology',NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='More data about categories, including localized properties such as names.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category_settings`
--

LOCK TABLES `category_settings` WRITE;
/*!40000 ALTER TABLE `category_settings` DISABLE KEYS */;
INSERT INTO `category_settings` VALUES
(1,1,'','sortOption','title-ASC'),
(2,1,'en','title','Applied Science'),
(3,1,'fr_CA','title',''),
(4,1,'en','description',''),
(5,1,'fr_CA','description',''),
(6,2,'','sortOption','title-ASC'),
(7,2,'en','title','Computer Science'),
(8,2,'fr_CA','title',''),
(9,2,'en','description',''),
(10,2,'fr_CA','description',''),
(11,3,'','sortOption','title-ASC'),
(12,3,'en','title','Engineering'),
(13,3,'fr_CA','title',''),
(14,3,'en','description',''),
(15,3,'fr_CA','description',''),
(16,4,'','sortOption','title-ASC'),
(17,4,'en','title','Social Sciences'),
(18,4,'fr_CA','title',''),
(19,4,'en','description',''),
(20,4,'fr_CA','description',''),
(21,5,'','sortOption','title-ASC'),
(22,5,'en','title','Sociology'),
(23,5,'fr_CA','title',''),
(24,5,'en','description',''),
(25,5,'fr_CA','description',''),
(26,6,'','sortOption','title-ASC'),
(27,6,'en','title','Anthropology'),
(28,6,'fr_CA','title',''),
(29,6,'en','description',''),
(30,6,'fr_CA','description','');
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
  `amount` decimal(8,2) unsigned NOT NULL,
  `currency_code_alpha` varchar(3) DEFAULT NULL,
  `payment_method_plugin_name` varchar(80) DEFAULT NULL,
  PRIMARY KEY (`completed_payment_id`),
  KEY `completed_payments_context_id` (`context_id`),
  KEY `completed_payments_user_id` (`user_id`),
  CONSTRAINT `completed_payments_context_id` FOREIGN KEY (`context_id`) REFERENCES `journals` (`journal_id`) ON DELETE CASCADE,
  CONSTRAINT `completed_payments_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='A list of completed (fulfilled) payments relating to a payment type such as a subscription payment.';
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
  `seq` double DEFAULT NULL,
  PRIMARY KEY (`controlled_vocab_entry_id`),
  KEY `controlled_vocab_entries_controlled_vocab_id` (`controlled_vocab_id`),
  KEY `controlled_vocab_entries_cv_id` (`controlled_vocab_id`,`seq`),
  CONSTRAINT `controlled_vocab_entries_controlled_vocab_id_foreign` FOREIGN KEY (`controlled_vocab_id`) REFERENCES `controlled_vocabs` (`controlled_vocab_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=72 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='The order that a word or phrase used in a controlled vocabulary should appear. For example, the order of keywords in a publication.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `controlled_vocab_entries`
--

LOCK TABLES `controlled_vocab_entries` WRITE;
/*!40000 ALTER TABLE `controlled_vocab_entries` DISABLE KEYS */;
INSERT INTO `controlled_vocab_entries` VALUES
(15,2,1),
(16,2,2),
(27,6,1),
(28,6,2),
(31,10,1),
(32,10,2),
(33,10,3),
(34,10,4),
(35,14,1),
(36,14,2),
(37,18,1),
(38,18,2),
(39,18,3),
(40,18,4),
(41,18,5),
(42,18,6),
(43,18,7),
(44,30,1),
(45,30,2),
(46,34,1),
(47,34,2),
(48,34,3),
(49,42,1),
(50,46,1),
(51,46,2),
(52,46,3),
(53,46,4),
(54,50,1),
(55,50,2),
(56,54,1),
(57,58,1),
(58,58,2),
(59,58,3),
(60,58,4),
(61,58,5),
(62,58,6),
(63,58,7),
(64,58,8),
(65,58,9),
(66,58,10),
(67,66,1),
(68,66,2),
(69,74,1),
(70,74,2),
(71,74,3);
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
  `setting_type` varchar(6) NOT NULL,
  PRIMARY KEY (`controlled_vocab_entry_setting_id`),
  UNIQUE KEY `c_v_e_s_pkey` (`controlled_vocab_entry_id`,`locale`,`setting_name`),
  KEY `c_v_e_s_entry_id` (`controlled_vocab_entry_id`),
  CONSTRAINT `c_v_e_s_entry_id` FOREIGN KEY (`controlled_vocab_entry_id`) REFERENCES `controlled_vocab_entries` (`controlled_vocab_entry_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=72 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='More data about a controlled vocabulary entry, including localized properties such as the actual word or phrase.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `controlled_vocab_entry_settings`
--

LOCK TABLES `controlled_vocab_entry_settings` WRITE;
/*!40000 ALTER TABLE `controlled_vocab_entry_settings` DISABLE KEYS */;
INSERT INTO `controlled_vocab_entry_settings` VALUES
(15,15,'en','submissionKeyword','Professional Development','string'),
(16,16,'en','submissionKeyword','Social Transformation','string'),
(27,27,'en','submissionKeyword','Professional Development','string'),
(28,28,'en','submissionKeyword','Social Transformation','string'),
(31,31,'en','submissionKeyword','pigs','string'),
(32,32,'en','submissionKeyword','food security','string'),
(33,33,'en','submissionKeyword','Professional Development','string'),
(34,34,'en','submissionKeyword','Social Transformation','string'),
(35,35,'en','submissionKeyword','employees','string'),
(36,36,'en','submissionKeyword','survey','string'),
(37,37,'en','submissionKeyword','Integrating Technology','string'),
(38,38,'en','submissionKeyword','Computer Skills','string'),
(39,39,'en','submissionKeyword','Survey','string'),
(40,40,'en','submissionKeyword','Alberta','string'),
(41,41,'en','submissionKeyword','National','string'),
(42,42,'en','submissionKeyword','Provincial','string'),
(43,43,'en','submissionKeyword','Professional Development','string'),
(44,44,'en','submissionKeyword','education','string'),
(45,45,'en','submissionKeyword','citizenship','string'),
(46,46,'en','submissionKeyword','Common pool resource','string'),
(47,47,'en','submissionKeyword','common property','string'),
(48,48,'en','submissionKeyword','intellectual developments','string'),
(49,49,'en','submissionKeyword','water','string'),
(50,50,'en','submissionKeyword','Development','string'),
(51,51,'en','submissionKeyword','engineering education','string'),
(52,52,'en','submissionKeyword','service learning','string'),
(53,53,'en','submissionKeyword','sustainability','string'),
(54,54,'en','submissionKeyword','pigs','string'),
(55,55,'en','submissionKeyword','food security','string'),
(56,56,'en','submissionKeyword','water','string'),
(57,57,'en','submissionKeyword','21st Century','string'),
(58,58,'en','submissionKeyword','Diversity','string'),
(59,59,'en','submissionKeyword','Multilingual','string'),
(60,60,'en','submissionKeyword','Multiethnic','string'),
(61,61,'en','submissionKeyword','Participatory Pedagogy','string'),
(62,62,'en','submissionKeyword','Language','string'),
(63,63,'en','submissionKeyword','Culture','string'),
(64,64,'en','submissionKeyword','Gender','string'),
(65,65,'en','submissionKeyword','Egalitarianism','string'),
(66,66,'en','submissionKeyword','Social Transformation','string'),
(67,67,'en','submissionKeyword','cattle','string'),
(68,68,'en','submissionKeyword','food security','string'),
(69,69,'en','submissionKeyword','Self-Organization','string'),
(70,70,'en','submissionKeyword','Multi-Level Institutions','string'),
(71,71,'en','submissionKeyword','Goverance','string');
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
  `assoc_id` bigint(20) NOT NULL DEFAULT 0,
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
(1,'interest',0,0),
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
-- Table structure for table `custom_issue_orders`
--

DROP TABLE IF EXISTS `custom_issue_orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `custom_issue_orders` (
  `custom_issue_order_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `issue_id` bigint(20) NOT NULL,
  `journal_id` bigint(20) NOT NULL,
  `seq` double NOT NULL DEFAULT 0,
  PRIMARY KEY (`custom_issue_order_id`),
  UNIQUE KEY `custom_issue_orders_unique` (`issue_id`),
  KEY `custom_issue_orders_issue_id` (`issue_id`),
  KEY `custom_issue_orders_journal_id` (`journal_id`),
  CONSTRAINT `custom_issue_orders_issue_id` FOREIGN KEY (`issue_id`) REFERENCES `issues` (`issue_id`) ON DELETE CASCADE,
  CONSTRAINT `custom_issue_orders_journal_id` FOREIGN KEY (`journal_id`) REFERENCES `journals` (`journal_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='Ordering information for the issue list, when custom issue ordering is specified.';
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
  `custom_section_order_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `issue_id` bigint(20) NOT NULL,
  `section_id` bigint(20) NOT NULL,
  `seq` double NOT NULL DEFAULT 0,
  PRIMARY KEY (`custom_section_order_id`),
  UNIQUE KEY `custom_section_orders_unique` (`issue_id`,`section_id`),
  KEY `custom_section_orders_issue_id` (`issue_id`),
  KEY `custom_section_orders_section_id` (`section_id`),
  CONSTRAINT `custom_section_orders_issue_id` FOREIGN KEY (`issue_id`) REFERENCES `issues` (`issue_id`) ON DELETE CASCADE,
  CONSTRAINT `custom_section_orders_section_id` FOREIGN KEY (`section_id`) REFERENCES `sections` (`section_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='Ordering information for sections within issues, when issue-specific section ordering is specified.';
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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='Relationships between tombstones and other data that can be collected in OAI sets, e.g. sections.';
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='Entries for published data that has been removed. Usually used in the OAI endpoint.';
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
  CONSTRAINT `dois_context_id_foreign` FOREIGN KEY (`context_id`) REFERENCES `journals` (`journal_id`) ON DELETE CASCADE
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
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='Editorial decisions recorded on a submission, such as decisions to accept or decline the submission, as well as decisions to send for review, send to copyediting, request revisions, and more.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `edit_decisions`
--

LOCK TABLES `edit_decisions` WRITE;
/*!40000 ALTER TABLE `edit_decisions` DISABLE KEYS */;
INSERT INTO `edit_decisions` VALUES
(1,1,NULL,1,NULL,3,3,'2024-12-27 05:25:18'),
(2,1,1,3,1,3,2,'2024-12-27 05:25:30'),
(3,1,NULL,4,NULL,3,7,'2024-12-27 05:25:39'),
(4,2,NULL,1,NULL,3,3,'2024-12-27 05:29:00'),
(5,2,2,3,1,6,9,'2024-12-27 05:29:13'),
(6,3,NULL,1,NULL,3,3,'2024-12-27 05:29:34'),
(7,3,3,3,1,3,2,'2024-12-27 05:29:43'),
(8,5,NULL,1,NULL,3,3,'2024-12-27 05:30:13'),
(9,5,4,3,1,3,2,'2024-12-27 05:30:23'),
(10,5,NULL,4,NULL,3,7,'2024-12-27 05:30:31'),
(11,6,NULL,1,NULL,3,3,'2024-12-27 05:30:55'),
(12,6,5,3,1,3,2,'2024-12-27 05:31:05'),
(13,6,NULL,4,NULL,3,7,'2024-12-27 05:31:13'),
(14,7,NULL,1,NULL,3,3,'2024-12-27 05:31:34'),
(15,9,NULL,1,NULL,3,3,'2024-12-27 05:32:18'),
(16,9,7,3,1,3,2,'2024-12-27 05:32:28'),
(17,9,NULL,4,NULL,3,7,'2024-12-27 05:32:37'),
(18,10,NULL,1,NULL,3,3,'2024-12-27 05:33:01'),
(19,12,NULL,1,NULL,3,3,'2024-12-27 05:33:51'),
(20,13,NULL,1,NULL,3,3,'2024-12-27 05:34:16'),
(21,13,10,3,1,3,4,'2024-12-27 05:35:01'),
(22,15,NULL,1,NULL,3,3,'2024-12-27 05:35:31'),
(23,15,11,3,1,3,2,'2024-12-27 05:35:42'),
(24,15,NULL,4,NULL,3,7,'2024-12-27 05:35:52'),
(25,17,NULL,1,NULL,3,3,'2024-12-27 05:36:24'),
(26,17,12,3,1,3,2,'2024-12-27 05:36:36'),
(27,17,NULL,4,NULL,3,7,'2024-12-27 05:36:46'),
(28,18,NULL,1,NULL,3,8,'2024-12-27 05:38:10'),
(29,19,NULL,1,NULL,3,3,'2024-12-27 05:38:31'),
(30,19,13,3,1,3,2,'2024-12-27 05:38:42');
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
) ENGINE=InnoDB AUTO_INCREMENT=162 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='A record of email messages that are sent in relation to an associated entity, such as a submission.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `email_log`
--

LOCK TABLES `email_log` WRITE;
/*!40000 ALTER TABLE `email_log` DISABLE KEYS */;
INSERT INTO `email_log` VALUES
(1,1048585,1,NULL,'2024-12-27 05:25:07',805306370,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Daniel Barnes\" <dbarnes@mailinator.com>','','','You have been assigned as an editor on a submission to Journal of Public Knowledge','<p>Dear Daniel Barnes,</p><p>The following submission has been assigned to you to see through the editorial process.</p><p><a href=\"http://localhost/index.php/publicknowledge/en/workflow/access/1\">Signalling Theory Dividends: A Review Of The Literature And Empirical Evidence</a><br />Alan Mwandenga, Amina Mansour</p><p><b>Abstract</b></p><p>The signaling theory suggests that dividends signal future prospects of a firm. However, recent empirical evidence from the US and the Uk does not offer a conclusive evidence on this issue. There are conflicting policy implications among financial economists so much that there is no practical dividend policy guidance to management, existing and potential investors in shareholding. Since corporate investment, financing and distribution decisions are a continuous function of management, the dividend decisions seem to rely on intuitive evaluation.</p><p>If you find the submission to be relevant for Journal of Public Knowledge, please forward the submission to the review stage by selecting \"Send to Review\" and then assign reviewers by clicking \"Add Reviewer\".</p><p>If the submission is not appropriate for this journal, please decline the submission.</p><p>Thank you in advance.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Journal of Public Knowledge</a>.</p>'),
(2,1048585,1,NULL,'2024-12-27 05:25:07',805306370,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"David Buskins\" <dbuskins@mailinator.com>','','','You have been assigned as an editor on a submission to Journal of Public Knowledge','<p>Dear David Buskins,</p><p>The following submission has been assigned to you to see through the editorial process.</p><p><a href=\"http://localhost/index.php/publicknowledge/en/workflow/access/1\">Signalling Theory Dividends: A Review Of The Literature And Empirical Evidence</a><br />Alan Mwandenga, Amina Mansour</p><p><b>Abstract</b></p><p>The signaling theory suggests that dividends signal future prospects of a firm. However, recent empirical evidence from the US and the Uk does not offer a conclusive evidence on this issue. There are conflicting policy implications among financial economists so much that there is no practical dividend policy guidance to management, existing and potential investors in shareholding. Since corporate investment, financing and distribution decisions are a continuous function of management, the dividend decisions seem to rely on intuitive evaluation.</p><p>If you find the submission to be relevant for Journal of Public Knowledge, please forward the submission to the review stage by selecting \"Send to Review\" and then assign reviewers by clicking \"Add Reviewer\".</p><p>If the submission is not appropriate for this journal, please decline the submission.</p><p>Thank you in advance.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Journal of Public Knowledge</a>.</p>'),
(3,1048585,1,NULL,'2024-12-27 05:25:07',805306370,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Stephanie Berardo\" <sberardo@mailinator.com>','','','You have been assigned as an editor on a submission to Journal of Public Knowledge','<p>Dear Stephanie Berardo,</p><p>The following submission has been assigned to you to see through the editorial process.</p><p><a href=\"http://localhost/index.php/publicknowledge/en/workflow/access/1\">Signalling Theory Dividends: A Review Of The Literature And Empirical Evidence</a><br />Alan Mwandenga, Amina Mansour</p><p><b>Abstract</b></p><p>The signaling theory suggests that dividends signal future prospects of a firm. However, recent empirical evidence from the US and the Uk does not offer a conclusive evidence on this issue. There are conflicting policy implications among financial economists so much that there is no practical dividend policy guidance to management, existing and potential investors in shareholding. Since corporate investment, financing and distribution decisions are a continuous function of management, the dividend decisions seem to rely on intuitive evaluation.</p><p>If you find the submission to be relevant for Journal of Public Knowledge, please forward the submission to the review stage by selecting \"Send to Review\" and then assign reviewers by clicking \"Add Reviewer\".</p><p>If the submission is not appropriate for this journal, please decline the submission.</p><p>Thank you in advance.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Journal of Public Knowledge</a>.</p>'),
(4,1048585,1,NULL,'2024-12-27 05:25:07',536870914,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Alan Mwandenga\" <amwandenga@mailinator.com>','','','Thank you for your submission to Journal of Public Knowledge','<p>Dear Alan Mwandenga,</p><p>Thank you for your submission to Journal of Public Knowledge. We have received your submission, Signalling Theory Dividends: A Review Of The Literature And Empirical Evidence, and a member of our editorial team will see it soon. You will be sent an email when an initial decision is made, and we may contact you for further information.</p><p>You can view your submission and track its progress through the editorial process at the following location:</p><p>Submission URL: http://localhost/index.php/publicknowledge/en/authorDashboard/submission/1</p><p>If you have been logged out, you can login again with the username amwandenga.</p><p>If you have any questions, please contact me from your <a href=\"http://localhost/index.php/publicknowledge/en/authorDashboard/submission/1\">submission dashboard</a>.</p><p>Thank you for considering Journal of Public Knowledge as a venue for your work.</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Journal of Public Knowledge</a>.</p>'),
(5,1048585,1,NULL,'2024-12-27 05:25:07',536870914,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Amina Mansour\" <notanemailamansour@mailinator.com>','','','Submission confirmation','<p>Dear Amina Mansour,</p><p>You have been named as a co-author on a submission to Journal of Public Knowledge. The submitter, Alan Mwandenga, provided the following details:</p><p>Signalling Theory Dividends: A Review Of The Literature And Empirical Evidence<br></p><p>If any of these details are incorrect, or you do not wish to be named on this submission, please contact me.</p><p>Thank you for considering Journal of Public Knowledge as a venue for your work.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Journal of Public Knowledge</a>.</p>'),
(6,1048585,1,3,'2024-12-27 05:25:18',805306369,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Alan Mwandenga\" <amwandenga@mailinator.com>','','','Your submission has been sent for review','<p>Dear Alan Mwandenga,</p><p>I am pleased to inform you that an editor has reviewed your submission, Signalling Theory Dividends: A Review Of The Literature And Empirical Evidence, and has decided to send it for peer review. An editor will identify qualified reviewers who will provide feedback on your submission.</p><p>This journal conducts double-anonymous peer review. The reviewers will not see any identifying information about you or your co-authors. Similarly, you will not know who reviewed your submission, and you will not hear from the reviewers directly. You will hear from us with feedback from the reviewers and information about the next steps.</p><p>Please note that sending the submission to peer review does not guarantee that it will be published. We will consider the reviewers\' recommendations before deciding to accept the submission for publication. You may be asked to make revisions and respond to the reviewers\' comments before a final decision is made.</p><p>If you have any questions, please contact me from your submission dashboard.</p><p><p>Daniel Barnes</p></p>'),
(7,1048585,1,3,'2024-12-27 05:25:22',1073741833,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Julie Janssen\" <jjanssen@mailinator.com>','','','Invitation to review','<p>Dear Julie Janssen,</p>\r\n<p>I believe that you would serve as an excellent reviewer for a submission to Journal of Public Knowledge. The submission\'s title and abstract are below, and I hope that you will consider undertaking this important task for us.</p>\r\n<p>If you are able to review this submission, your review is due by 2025-01-24. You can view the submission, upload review files, and submit your review by logging into the journal site and following the steps at the link below.</p>\r\n<p><a href=\"http://localhost/index.php/publicknowledge/en/reviewer/submission?submissionId=1\">Signalling Theory Dividends: A Review Of The Literature And Empirical Evidence</a></p>\r\n<p><strong>Abstract</strong></p>\r\n<p>The signaling theory suggests that dividends signal future prospects of a firm. However, recent empirical evidence from the US and the Uk does not offer a conclusive evidence on this issue. There are conflicting policy implications among financial economists so much that there is no practical dividend policy guidance to management, existing and potential investors in shareholding. Since corporate investment, financing and distribution decisions are a continuous function of management, the dividend decisions seem to rely on intuitive evaluation.</p>\r\n<p>Please <a href=\"http://localhost/index.php/publicknowledge/en/reviewer/submission?submissionId=1\">accept or decline</a> the review by <strong>2025-01-24</strong>.</p>\r\n<p>You may contact me with any questions about the submission or the review process.</p>\r\n<p>Thank you for considering this request. Your help is much appreciated.</p>\r\n<p>Kind regards,</p>\r\n<p>Daniel Barnes</p>'),
(8,1048585,1,3,'2024-12-27 05:25:24',1073741833,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Aisla McCrae\" <amccrae@mailinator.com>','','','Invitation to review','<p>Dear Aisla McCrae,</p>\r\n<p>I believe that you would serve as an excellent reviewer for a submission to Journal of Public Knowledge. The submission\'s title and abstract are below, and I hope that you will consider undertaking this important task for us.</p>\r\n<p>If you are able to review this submission, your review is due by 2025-01-24. You can view the submission, upload review files, and submit your review by logging into the journal site and following the steps at the link below.</p>\r\n<p><a href=\"http://localhost/index.php/publicknowledge/en/reviewer/submission?submissionId=1\">Signalling Theory Dividends: A Review Of The Literature And Empirical Evidence</a></p>\r\n<p><strong>Abstract</strong></p>\r\n<p>The signaling theory suggests that dividends signal future prospects of a firm. However, recent empirical evidence from the US and the Uk does not offer a conclusive evidence on this issue. There are conflicting policy implications among financial economists so much that there is no practical dividend policy guidance to management, existing and potential investors in shareholding. Since corporate investment, financing and distribution decisions are a continuous function of management, the dividend decisions seem to rely on intuitive evaluation.</p>\r\n<p>Please <a href=\"http://localhost/index.php/publicknowledge/en/reviewer/submission?submissionId=1\">accept or decline</a> the review by <strong>2025-01-24</strong>.</p>\r\n<p>You may contact me with any questions about the submission or the review process.</p>\r\n<p>Thank you for considering this request. Your help is much appreciated.</p>\r\n<p>Kind regards,</p>\r\n<p>Daniel Barnes</p>'),
(9,1048585,1,3,'2024-12-27 05:25:27',1073741833,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Adela Gallego\" <agallego@mailinator.com>','','','Invitation to review','<p>Dear Adela Gallego,</p>\r\n<p>I believe that you would serve as an excellent reviewer for a submission to Journal of Public Knowledge. The submission\'s title and abstract are below, and I hope that you will consider undertaking this important task for us.</p>\r\n<p>If you are able to review this submission, your review is due by 2025-01-24. You can view the submission, upload review files, and submit your review by logging into the journal site and following the steps at the link below.</p>\r\n<p><a href=\"http://localhost/index.php/publicknowledge/en/reviewer/submission?submissionId=1\">Signalling Theory Dividends: A Review Of The Literature And Empirical Evidence</a></p>\r\n<p><strong>Abstract</strong></p>\r\n<p>The signaling theory suggests that dividends signal future prospects of a firm. However, recent empirical evidence from the US and the Uk does not offer a conclusive evidence on this issue. There are conflicting policy implications among financial economists so much that there is no practical dividend policy guidance to management, existing and potential investors in shareholding. Since corporate investment, financing and distribution decisions are a continuous function of management, the dividend decisions seem to rely on intuitive evaluation.</p>\r\n<p>Please <a href=\"http://localhost/index.php/publicknowledge/en/reviewer/submission?submissionId=1\">accept or decline</a> the review by <strong>2025-01-24</strong>.</p>\r\n<p>You may contact me with any questions about the submission or the review process.</p>\r\n<p>Thank you for considering this request. Your help is much appreciated.</p>\r\n<p>Kind regards,</p>\r\n<p>Daniel Barnes</p>'),
(10,1048585,1,3,'2024-12-27 05:25:31',805306369,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Alan Mwandenga\" <amwandenga@mailinator.com>','','','Your submission has been accepted to Journal of Public Knowledge','<p>Dear Alan Mwandenga,</p><p>I am pleased to inform you that we have decided to accept your submission without further revision. After careful review, we found your submission, Signalling Theory Dividends: A Review Of The Literature And Empirical Evidence, to meet or exceed our expectations. We are excited to publish your piece in Journal of Public Knowledge and we thank you for choosing our journal as a venue for your work.</p><p>Your submission is now forthcoming in a future issue of Journal of Public Knowledge and you are welcome to include it in your list of publications. We recognize the hard work that goes into every successful submission and we want to congratulate you on reaching this stage.</p><p>Your submission will now undergo copy editing and formatting to prepare it for publication.</p><p>You will shortly receive further instructions.</p><p>If you have any questions, please contact me from your <a href=\"http://localhost/index.php/publicknowledge/en/authorDashboard/submission/1\">submission dashboard</a>.</p><p>Kind regards,</p><p>Daniel Barnes</p>'),
(11,1048585,1,3,'2024-12-27 05:25:39',805306369,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Alan Mwandenga\" <amwandenga@mailinator.com>','','','Next steps for publishing your submission','<p>Dear Alan Mwandenga,</p><p>I am writing from Journal of Public Knowledge to let you know that the editing of your submission, Signalling Theory Dividends: A Review Of The Literature And Empirical Evidence, is complete. Your submission will now advance to the production stage, where the final galleys will be prepared for publication. We will contact you if we need any further assistance.</p><p>If you have any questions, please contact me from your <a href=\"http://localhost/index.php/publicknowledge/en/authorDashboard/submission/1\">submission dashboard</a>.</p><p>Kind regards,</p><p>Daniel Barnes</p>'),
(12,1048585,2,NULL,'2024-12-27 05:28:54',805306370,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Daniel Barnes\" <dbarnes@mailinator.com>','','','You have been assigned as an editor on a submission to Journal of Public Knowledge','<p>Dear Daniel Barnes,</p><p>The following submission has been assigned to you to see through the editorial process.</p><p><a href=\"http://localhost/index.php/publicknowledge/en/workflow/access/2\">The influence of lactation on the quantity and quality of cashmere production</a><br />Carlo Corino</p><p><b>Abstract</b></p>The effects of pressed beet pulp silage (PBPS) replacing barley for 10% and 20% (DM basis) were studied on heavy pigs fed dairy whey-diluted diets. 60 Hypor pigs (average initial weight of 28 kg), 30 barrows and 30 gilts, were homogeneously allocated to three exper- imental groups: T1 (control) in which pigs were fed a traditional sweet whey- diluted diet (the ratio between whey and dry matter was 4.5/1); T2 in which PBPS replaced barley for 10% (DM basis) during a first period (from the beginning to the 133rd day of trial) and thereafter for 20% (DM basis); T3 in which PBPS replaced barley for 20% (DM basis) throughout the experimental period. In diets T2 and T3 feed was dairy whey-diluted as in group T1. No significant (P&gt;0.05) differences were observed concerning growth parameters (ADG and FCR). Pigs on diets contain- ing PBPS showed significantly higher (P&lt;0.05) percentages of lean cuts and lower percentages of fat cuts. On the whole, ham weight losses during seasoning were moderate but significantly (P&lt;0.05) more marked for PBPS-fed pigs as a prob- able consequence of their lower adiposity degree. Fatty acid composition of ham fat was unaffected by diets. With regard to m. Semimembranosus colour, pigs receiving PBPS showed lower (P&lt;0.05) \"L\", \"a\" and \"Chroma\" values. From an economical point of view it can be concluded that the use of PBPS (partially replacing barley) and dairy whey in heavy pig production could be of particular interest in areas where both these by products are readily available.<p>If you find the submission to be relevant for Journal of Public Knowledge, please forward the submission to the review stage by selecting \"Send to Review\" and then assign reviewers by clicking \"Add Reviewer\".</p><p>If the submission is not appropriate for this journal, please decline the submission.</p><p>Thank you in advance.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Journal of Public Knowledge</a>.</p>'),
(13,1048585,2,NULL,'2024-12-27 05:28:54',805306370,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"David Buskins\" <dbuskins@mailinator.com>','','','You have been assigned as an editor on a submission to Journal of Public Knowledge','<p>Dear David Buskins,</p><p>The following submission has been assigned to you to see through the editorial process.</p><p><a href=\"http://localhost/index.php/publicknowledge/en/workflow/access/2\">The influence of lactation on the quantity and quality of cashmere production</a><br />Carlo Corino</p><p><b>Abstract</b></p>The effects of pressed beet pulp silage (PBPS) replacing barley for 10% and 20% (DM basis) were studied on heavy pigs fed dairy whey-diluted diets. 60 Hypor pigs (average initial weight of 28 kg), 30 barrows and 30 gilts, were homogeneously allocated to three exper- imental groups: T1 (control) in which pigs were fed a traditional sweet whey- diluted diet (the ratio between whey and dry matter was 4.5/1); T2 in which PBPS replaced barley for 10% (DM basis) during a first period (from the beginning to the 133rd day of trial) and thereafter for 20% (DM basis); T3 in which PBPS replaced barley for 20% (DM basis) throughout the experimental period. In diets T2 and T3 feed was dairy whey-diluted as in group T1. No significant (P&gt;0.05) differences were observed concerning growth parameters (ADG and FCR). Pigs on diets contain- ing PBPS showed significantly higher (P&lt;0.05) percentages of lean cuts and lower percentages of fat cuts. On the whole, ham weight losses during seasoning were moderate but significantly (P&lt;0.05) more marked for PBPS-fed pigs as a prob- able consequence of their lower adiposity degree. Fatty acid composition of ham fat was unaffected by diets. With regard to m. Semimembranosus colour, pigs receiving PBPS showed lower (P&lt;0.05) \"L\", \"a\" and \"Chroma\" values. From an economical point of view it can be concluded that the use of PBPS (partially replacing barley) and dairy whey in heavy pig production could be of particular interest in areas where both these by products are readily available.<p>If you find the submission to be relevant for Journal of Public Knowledge, please forward the submission to the review stage by selecting \"Send to Review\" and then assign reviewers by clicking \"Add Reviewer\".</p><p>If the submission is not appropriate for this journal, please decline the submission.</p><p>Thank you in advance.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Journal of Public Knowledge</a>.</p>'),
(14,1048585,2,NULL,'2024-12-27 05:28:54',805306370,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Stephanie Berardo\" <sberardo@mailinator.com>','','','You have been assigned as an editor on a submission to Journal of Public Knowledge','<p>Dear Stephanie Berardo,</p><p>The following submission has been assigned to you to see through the editorial process.</p><p><a href=\"http://localhost/index.php/publicknowledge/en/workflow/access/2\">The influence of lactation on the quantity and quality of cashmere production</a><br />Carlo Corino</p><p><b>Abstract</b></p>The effects of pressed beet pulp silage (PBPS) replacing barley for 10% and 20% (DM basis) were studied on heavy pigs fed dairy whey-diluted diets. 60 Hypor pigs (average initial weight of 28 kg), 30 barrows and 30 gilts, were homogeneously allocated to three exper- imental groups: T1 (control) in which pigs were fed a traditional sweet whey- diluted diet (the ratio between whey and dry matter was 4.5/1); T2 in which PBPS replaced barley for 10% (DM basis) during a first period (from the beginning to the 133rd day of trial) and thereafter for 20% (DM basis); T3 in which PBPS replaced barley for 20% (DM basis) throughout the experimental period. In diets T2 and T3 feed was dairy whey-diluted as in group T1. No significant (P&gt;0.05) differences were observed concerning growth parameters (ADG and FCR). Pigs on diets contain- ing PBPS showed significantly higher (P&lt;0.05) percentages of lean cuts and lower percentages of fat cuts. On the whole, ham weight losses during seasoning were moderate but significantly (P&lt;0.05) more marked for PBPS-fed pigs as a prob- able consequence of their lower adiposity degree. Fatty acid composition of ham fat was unaffected by diets. With regard to m. Semimembranosus colour, pigs receiving PBPS showed lower (P&lt;0.05) \"L\", \"a\" and \"Chroma\" values. From an economical point of view it can be concluded that the use of PBPS (partially replacing barley) and dairy whey in heavy pig production could be of particular interest in areas where both these by products are readily available.<p>If you find the submission to be relevant for Journal of Public Knowledge, please forward the submission to the review stage by selecting \"Send to Review\" and then assign reviewers by clicking \"Add Reviewer\".</p><p>If the submission is not appropriate for this journal, please decline the submission.</p><p>Thank you in advance.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Journal of Public Knowledge</a>.</p>'),
(15,1048585,2,NULL,'2024-12-27 05:28:54',536870914,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Carlo Corino\" <ccorino@mailinator.com>','','','Thank you for your submission to Journal of Public Knowledge','<p>Dear Carlo Corino,</p><p>Thank you for your submission to Journal of Public Knowledge. We have received your submission, The influence of lactation on the quantity and quality of cashmere production, and a member of our editorial team will see it soon. You will be sent an email when an initial decision is made, and we may contact you for further information.</p><p>You can view your submission and track its progress through the editorial process at the following location:</p><p>Submission URL: http://localhost/index.php/publicknowledge/en/authorDashboard/submission/2</p><p>If you have been logged out, you can login again with the username ccorino.</p><p>If you have any questions, please contact me from your <a href=\"http://localhost/index.php/publicknowledge/en/authorDashboard/submission/2\">submission dashboard</a>.</p><p>Thank you for considering Journal of Public Knowledge as a venue for your work.</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Journal of Public Knowledge</a>.</p>'),
(16,1048585,2,3,'2024-12-27 05:29:00',805306369,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Carlo Corino\" <ccorino@mailinator.com>','','','Your submission has been sent for review','<p>Dear Carlo Corino,</p><p>I am pleased to inform you that an editor has reviewed your submission, The influence of lactation on the quantity and quality of cashmere production, and has decided to send it for peer review. An editor will identify qualified reviewers who will provide feedback on your submission.</p><p>This journal conducts double-anonymous peer review. The reviewers will not see any identifying information about you or your co-authors. Similarly, you will not know who reviewed your submission, and you will not hear from the reviewers directly. You will hear from us with feedback from the reviewers and information about the next steps.</p><p>Please note that sending the submission to peer review does not guarantee that it will be published. We will consider the reviewers\' recommendations before deciding to accept the submission for publication. You may be asked to make revisions and respond to the reviewers\' comments before a final decision is made.</p><p>If you have any questions, please contact me from your submission dashboard.</p><p><p>Daniel Barnes</p></p>'),
(17,1048585,3,NULL,'2024-12-27 05:29:28',805306370,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Daniel Barnes\" <dbarnes@mailinator.com>','','','You have been assigned as an editor on a submission to Journal of Public Knowledge','<p>Dear Daniel Barnes,</p><p>The following submission has been assigned to you to see through the editorial process.</p><p><a href=\"http://localhost/index.php/publicknowledge/en/workflow/access/3\">The Facets Of Job Satisfaction: A Nine-Nation Comparative Study Of Construct Equivalence</a><br />Catherine Kwantes</p><p><b>Abstract</b></p>Archival data from an attitude survey of employees in a single multinational organization were used to examine the degree to which national culture affects the nature of job satisfaction. Responses from nine countries were compiled to create a benchmark against which nations could be individually compared. Factor analysis revealed four factors: Organizational Communication, Organizational Efficiency/Effectiveness, Organizational Support, and Personal Benefit. Comparisons of factor structures indicated that Organizational Communication exhibited the most construct equivalence, and Personal Benefit the least. The most satisfied employees were those from China, and the least satisfied from Brazil, consistent with previous findings that individuals in collectivistic nations report higher satisfaction. The research findings suggest that national cultural context exerts an effect on the nature of job satisfaction.<p>If you find the submission to be relevant for Journal of Public Knowledge, please forward the submission to the review stage by selecting \"Send to Review\" and then assign reviewers by clicking \"Add Reviewer\".</p><p>If the submission is not appropriate for this journal, please decline the submission.</p><p>Thank you in advance.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Journal of Public Knowledge</a>.</p>'),
(18,1048585,3,NULL,'2024-12-27 05:29:28',805306370,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"David Buskins\" <dbuskins@mailinator.com>','','','You have been assigned as an editor on a submission to Journal of Public Knowledge','<p>Dear David Buskins,</p><p>The following submission has been assigned to you to see through the editorial process.</p><p><a href=\"http://localhost/index.php/publicknowledge/en/workflow/access/3\">The Facets Of Job Satisfaction: A Nine-Nation Comparative Study Of Construct Equivalence</a><br />Catherine Kwantes</p><p><b>Abstract</b></p>Archival data from an attitude survey of employees in a single multinational organization were used to examine the degree to which national culture affects the nature of job satisfaction. Responses from nine countries were compiled to create a benchmark against which nations could be individually compared. Factor analysis revealed four factors: Organizational Communication, Organizational Efficiency/Effectiveness, Organizational Support, and Personal Benefit. Comparisons of factor structures indicated that Organizational Communication exhibited the most construct equivalence, and Personal Benefit the least. The most satisfied employees were those from China, and the least satisfied from Brazil, consistent with previous findings that individuals in collectivistic nations report higher satisfaction. The research findings suggest that national cultural context exerts an effect on the nature of job satisfaction.<p>If you find the submission to be relevant for Journal of Public Knowledge, please forward the submission to the review stage by selecting \"Send to Review\" and then assign reviewers by clicking \"Add Reviewer\".</p><p>If the submission is not appropriate for this journal, please decline the submission.</p><p>Thank you in advance.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Journal of Public Knowledge</a>.</p>'),
(19,1048585,3,NULL,'2024-12-27 05:29:28',805306370,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Stephanie Berardo\" <sberardo@mailinator.com>','','','You have been assigned as an editor on a submission to Journal of Public Knowledge','<p>Dear Stephanie Berardo,</p><p>The following submission has been assigned to you to see through the editorial process.</p><p><a href=\"http://localhost/index.php/publicknowledge/en/workflow/access/3\">The Facets Of Job Satisfaction: A Nine-Nation Comparative Study Of Construct Equivalence</a><br />Catherine Kwantes</p><p><b>Abstract</b></p>Archival data from an attitude survey of employees in a single multinational organization were used to examine the degree to which national culture affects the nature of job satisfaction. Responses from nine countries were compiled to create a benchmark against which nations could be individually compared. Factor analysis revealed four factors: Organizational Communication, Organizational Efficiency/Effectiveness, Organizational Support, and Personal Benefit. Comparisons of factor structures indicated that Organizational Communication exhibited the most construct equivalence, and Personal Benefit the least. The most satisfied employees were those from China, and the least satisfied from Brazil, consistent with previous findings that individuals in collectivistic nations report higher satisfaction. The research findings suggest that national cultural context exerts an effect on the nature of job satisfaction.<p>If you find the submission to be relevant for Journal of Public Knowledge, please forward the submission to the review stage by selecting \"Send to Review\" and then assign reviewers by clicking \"Add Reviewer\".</p><p>If the submission is not appropriate for this journal, please decline the submission.</p><p>Thank you in advance.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Journal of Public Knowledge</a>.</p>'),
(20,1048585,3,NULL,'2024-12-27 05:29:28',536870914,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Catherine Kwantes\" <ckwantes@mailinator.com>','','','Thank you for your submission to Journal of Public Knowledge','<p>Dear Catherine Kwantes,</p><p>Thank you for your submission to Journal of Public Knowledge. We have received your submission, The Facets Of Job Satisfaction: A Nine-Nation Comparative Study Of Construct Equivalence, and a member of our editorial team will see it soon. You will be sent an email when an initial decision is made, and we may contact you for further information.</p><p>You can view your submission and track its progress through the editorial process at the following location:</p><p>Submission URL: http://localhost/index.php/publicknowledge/en/authorDashboard/submission/3</p><p>If you have been logged out, you can login again with the username ckwantes.</p><p>If you have any questions, please contact me from your <a href=\"http://localhost/index.php/publicknowledge/en/authorDashboard/submission/3\">submission dashboard</a>.</p><p>Thank you for considering Journal of Public Knowledge as a venue for your work.</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Journal of Public Knowledge</a>.</p>'),
(21,1048585,3,3,'2024-12-27 05:29:34',805306369,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Catherine Kwantes\" <ckwantes@mailinator.com>','','','Your submission has been sent for review','<p>Dear Catherine Kwantes,</p><p>I am pleased to inform you that an editor has reviewed your submission, The Facets Of Job Satisfaction: A Nine-Nation Comparative Study Of Construct Equivalence, and has decided to send it for peer review. An editor will identify qualified reviewers who will provide feedback on your submission.</p><p>This journal conducts double-anonymous peer review. The reviewers will not see any identifying information about you or your co-authors. Similarly, you will not know who reviewed your submission, and you will not hear from the reviewers directly. You will hear from us with feedback from the reviewers and information about the next steps.</p><p>Please note that sending the submission to peer review does not guarantee that it will be published. We will consider the reviewers\' recommendations before deciding to accept the submission for publication. You may be asked to make revisions and respond to the reviewers\' comments before a final decision is made.</p><p>If you have any questions, please contact me from your submission dashboard.</p><p><p>Daniel Barnes</p></p>'),
(22,1048585,3,3,'2024-12-27 05:29:37',1073741833,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Aisla McCrae\" <amccrae@mailinator.com>','','','Invitation to review','<p>Dear Aisla McCrae,</p>\r\n<p>I believe that you would serve as an excellent reviewer for a submission to Journal of Public Knowledge. The submission\'s title and abstract are below, and I hope that you will consider undertaking this important task for us.</p>\r\n<p>If you are able to review this submission, your review is due by 2025-01-24. You can view the submission, upload review files, and submit your review by logging into the journal site and following the steps at the link below.</p>\r\n<p><a href=\"http://localhost/index.php/publicknowledge/en/reviewer/submission?submissionId=3\">The Facets Of Job Satisfaction: A Nine-Nation Comparative Study Of Construct Equivalence</a></p>\r\n<p><strong>Abstract</strong></p>\r\n<p>Archival data from an attitude survey of employees in a single multinational organization were used to examine the degree to which national culture affects the nature of job satisfaction. Responses from nine countries were compiled to create a benchmark against which nations could be individually compared. Factor analysis revealed four factors: Organizational Communication, Organizational Efficiency/Effectiveness, Organizational Support, and Personal Benefit. Comparisons of factor structures indicated that Organizational Communication exhibited the most construct equivalence, and Personal Benefit the least. The most satisfied employees were those from China, and the least satisfied from Brazil, consistent with previous findings that individuals in collectivistic nations report higher satisfaction. The research findings suggest that national cultural context exerts an effect on the nature of job satisfaction.</p>\r\n<p>Please <a href=\"http://localhost/index.php/publicknowledge/en/reviewer/submission?submissionId=3\">accept or decline</a> the review by <strong>2025-01-24</strong>.</p>\r\n<p>You may contact me with any questions about the submission or the review process.</p>\r\n<p>Thank you for considering this request. Your help is much appreciated.</p>\r\n<p>Kind regards,</p>\r\n<p>Daniel Barnes</p>'),
(23,1048585,3,3,'2024-12-27 05:29:39',1073741833,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Adela Gallego\" <agallego@mailinator.com>','','','Invitation to review','<p>Dear Adela Gallego,</p>\r\n<p>I believe that you would serve as an excellent reviewer for a submission to Journal of Public Knowledge. The submission\'s title and abstract are below, and I hope that you will consider undertaking this important task for us.</p>\r\n<p>If you are able to review this submission, your review is due by 2025-01-24. You can view the submission, upload review files, and submit your review by logging into the journal site and following the steps at the link below.</p>\r\n<p><a href=\"http://localhost/index.php/publicknowledge/en/reviewer/submission?submissionId=3\">The Facets Of Job Satisfaction: A Nine-Nation Comparative Study Of Construct Equivalence</a></p>\r\n<p><strong>Abstract</strong></p>\r\n<p>Archival data from an attitude survey of employees in a single multinational organization were used to examine the degree to which national culture affects the nature of job satisfaction. Responses from nine countries were compiled to create a benchmark against which nations could be individually compared. Factor analysis revealed four factors: Organizational Communication, Organizational Efficiency/Effectiveness, Organizational Support, and Personal Benefit. Comparisons of factor structures indicated that Organizational Communication exhibited the most construct equivalence, and Personal Benefit the least. The most satisfied employees were those from China, and the least satisfied from Brazil, consistent with previous findings that individuals in collectivistic nations report higher satisfaction. The research findings suggest that national cultural context exerts an effect on the nature of job satisfaction.</p>\r\n<p>Please <a href=\"http://localhost/index.php/publicknowledge/en/reviewer/submission?submissionId=3\">accept or decline</a> the review by <strong>2025-01-24</strong>.</p>\r\n<p>You may contact me with any questions about the submission or the review process.</p>\r\n<p>Thank you for considering this request. Your help is much appreciated.</p>\r\n<p>Kind regards,</p>\r\n<p>Daniel Barnes</p>'),
(24,1048585,3,3,'2024-12-27 05:29:43',805306369,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Catherine Kwantes\" <ckwantes@mailinator.com>','','','Your submission has been accepted to Journal of Public Knowledge','<p>Dear Catherine Kwantes,</p><p>I am pleased to inform you that we have decided to accept your submission without further revision. After careful review, we found your submission, The Facets Of Job Satisfaction: A Nine-Nation Comparative Study Of Construct Equivalence, to meet or exceed our expectations. We are excited to publish your piece in Journal of Public Knowledge and we thank you for choosing our journal as a venue for your work.</p><p>Your submission is now forthcoming in a future issue of Journal of Public Knowledge and you are welcome to include it in your list of publications. We recognize the hard work that goes into every successful submission and we want to congratulate you on reaching this stage.</p><p>Your submission will now undergo copy editing and formatting to prepare it for publication.</p><p>You will shortly receive further instructions.</p><p>If you have any questions, please contact me from your <a href=\"http://localhost/index.php/publicknowledge/en/authorDashboard/submission/3\">submission dashboard</a>.</p><p>Kind regards,</p><p>Daniel Barnes</p>'),
(25,1048585,4,NULL,'2024-12-27 05:29:58',805306370,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Daniel Barnes\" <dbarnes@mailinator.com>','','','You have been assigned as an editor on a submission to Journal of Public Knowledge','<p>Dear Daniel Barnes,</p><p>The following submission has been assigned to you to see through the editorial process.</p><p><a href=\"http://localhost/index.php/publicknowledge/en/workflow/access/4\">Computer Skill Requirements for New and Existing Teachers: Implications for Policy and Practice</a><br />Craig Montgomerie, Mark Irvine</p><p><b>Abstract</b></p>The integration of technology into the classroom is a major issue in education today. Many national and provincial initiatives specify the technology skills that students must demonstrate at each grade level. The Government of the Province of Alberta in Canada, has mandated the implementation of a new curriculum which began in September of 2000, called Information and Communication Technology. This curriculum is infused within core courses and specifies what students are “expected to know, be able to do, and be like with respect to technology” (Alberta Learning, 2000). Since teachers are required to implement this new curriculum, school jurisdictions are turning to professional development strategies and hiring standards to upgrade teachers’ computer skills to meet this goal. This paper summarizes the results of a telephone survey administered to all public school jurisdictions in the Province of Alberta with a 100% response rate. We examined the computer skills that school jurisdictions require of newly hired teachers, and the support strategies employed for currently employed teachers.<p>If you find the submission to be relevant for Journal of Public Knowledge, please forward the submission to the review stage by selecting \"Send to Review\" and then assign reviewers by clicking \"Add Reviewer\".</p><p>If the submission is not appropriate for this journal, please decline the submission.</p><p>Thank you in advance.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Journal of Public Knowledge</a>.</p>'),
(26,1048585,4,NULL,'2024-12-27 05:29:58',805306370,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"David Buskins\" <dbuskins@mailinator.com>','','','You have been assigned as an editor on a submission to Journal of Public Knowledge','<p>Dear David Buskins,</p><p>The following submission has been assigned to you to see through the editorial process.</p><p><a href=\"http://localhost/index.php/publicknowledge/en/workflow/access/4\">Computer Skill Requirements for New and Existing Teachers: Implications for Policy and Practice</a><br />Craig Montgomerie, Mark Irvine</p><p><b>Abstract</b></p>The integration of technology into the classroom is a major issue in education today. Many national and provincial initiatives specify the technology skills that students must demonstrate at each grade level. The Government of the Province of Alberta in Canada, has mandated the implementation of a new curriculum which began in September of 2000, called Information and Communication Technology. This curriculum is infused within core courses and specifies what students are “expected to know, be able to do, and be like with respect to technology” (Alberta Learning, 2000). Since teachers are required to implement this new curriculum, school jurisdictions are turning to professional development strategies and hiring standards to upgrade teachers’ computer skills to meet this goal. This paper summarizes the results of a telephone survey administered to all public school jurisdictions in the Province of Alberta with a 100% response rate. We examined the computer skills that school jurisdictions require of newly hired teachers, and the support strategies employed for currently employed teachers.<p>If you find the submission to be relevant for Journal of Public Knowledge, please forward the submission to the review stage by selecting \"Send to Review\" and then assign reviewers by clicking \"Add Reviewer\".</p><p>If the submission is not appropriate for this journal, please decline the submission.</p><p>Thank you in advance.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Journal of Public Knowledge</a>.</p>'),
(27,1048585,4,NULL,'2024-12-27 05:29:58',805306370,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Stephanie Berardo\" <sberardo@mailinator.com>','','','You have been assigned as an editor on a submission to Journal of Public Knowledge','<p>Dear Stephanie Berardo,</p><p>The following submission has been assigned to you to see through the editorial process.</p><p><a href=\"http://localhost/index.php/publicknowledge/en/workflow/access/4\">Computer Skill Requirements for New and Existing Teachers: Implications for Policy and Practice</a><br />Craig Montgomerie, Mark Irvine</p><p><b>Abstract</b></p>The integration of technology into the classroom is a major issue in education today. Many national and provincial initiatives specify the technology skills that students must demonstrate at each grade level. The Government of the Province of Alberta in Canada, has mandated the implementation of a new curriculum which began in September of 2000, called Information and Communication Technology. This curriculum is infused within core courses and specifies what students are “expected to know, be able to do, and be like with respect to technology” (Alberta Learning, 2000). Since teachers are required to implement this new curriculum, school jurisdictions are turning to professional development strategies and hiring standards to upgrade teachers’ computer skills to meet this goal. This paper summarizes the results of a telephone survey administered to all public school jurisdictions in the Province of Alberta with a 100% response rate. We examined the computer skills that school jurisdictions require of newly hired teachers, and the support strategies employed for currently employed teachers.<p>If you find the submission to be relevant for Journal of Public Knowledge, please forward the submission to the review stage by selecting \"Send to Review\" and then assign reviewers by clicking \"Add Reviewer\".</p><p>If the submission is not appropriate for this journal, please decline the submission.</p><p>Thank you in advance.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Journal of Public Knowledge</a>.</p>'),
(28,1048585,4,NULL,'2024-12-27 05:29:58',536870914,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Craig Montgomerie\" <cmontgomerie@mailinator.com>','','','Thank you for your submission to Journal of Public Knowledge','<p>Dear Craig Montgomerie,</p><p>Thank you for your submission to Journal of Public Knowledge. We have received your submission, Computer Skill Requirements for New and Existing Teachers: Implications for Policy and Practice, and a member of our editorial team will see it soon. You will be sent an email when an initial decision is made, and we may contact you for further information.</p><p>You can view your submission and track its progress through the editorial process at the following location:</p><p>Submission URL: http://localhost/index.php/publicknowledge/en/authorDashboard/submission/4</p><p>If you have been logged out, you can login again with the username cmontgomerie.</p><p>If you have any questions, please contact me from your <a href=\"http://localhost/index.php/publicknowledge/en/authorDashboard/submission/4\">submission dashboard</a>.</p><p>Thank you for considering Journal of Public Knowledge as a venue for your work.</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Journal of Public Knowledge</a>.</p>'),
(29,1048585,4,NULL,'2024-12-27 05:29:58',536870914,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Mark Irvine\" <mirvine@mailinator.com>','','','Submission confirmation','<p>Dear Mark Irvine,</p><p>You have been named as a co-author on a submission to Journal of Public Knowledge. The submitter, Craig Montgomerie, provided the following details:</p><p>Computer Skill Requirements for New and Existing Teachers: Implications for Policy and Practice<br></p><p>If any of these details are incorrect, or you do not wish to be named on this submission, please contact me.</p><p>Thank you for considering Journal of Public Knowledge as a venue for your work.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Journal of Public Knowledge</a>.</p>'),
(30,1048585,5,NULL,'2024-12-27 05:30:07',805306370,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Daniel Barnes\" <dbarnes@mailinator.com>','','','You have been assigned as an editor on a submission to Journal of Public Knowledge','<p>Dear Daniel Barnes,</p><p>The following submission has been assigned to you to see through the editorial process.</p><p><a href=\"http://localhost/index.php/publicknowledge/en/workflow/access/5\">Genetic transformation of forest trees</a><br />Diaga Diouf</p><p><b>Abstract</b></p>In this review, the recent progress on genetic transformation of forest trees were discussed. Its described also, different applications of genetic engineering for improving forest trees or understanding the mechanisms governing genes expression in woody plants.<p>If you find the submission to be relevant for Journal of Public Knowledge, please forward the submission to the review stage by selecting \"Send to Review\" and then assign reviewers by clicking \"Add Reviewer\".</p><p>If the submission is not appropriate for this journal, please decline the submission.</p><p>Thank you in advance.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Journal of Public Knowledge</a>.</p>'),
(31,1048585,5,NULL,'2024-12-27 05:30:07',805306370,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"David Buskins\" <dbuskins@mailinator.com>','','','You have been assigned as an editor on a submission to Journal of Public Knowledge','<p>Dear David Buskins,</p><p>The following submission has been assigned to you to see through the editorial process.</p><p><a href=\"http://localhost/index.php/publicknowledge/en/workflow/access/5\">Genetic transformation of forest trees</a><br />Diaga Diouf</p><p><b>Abstract</b></p>In this review, the recent progress on genetic transformation of forest trees were discussed. Its described also, different applications of genetic engineering for improving forest trees or understanding the mechanisms governing genes expression in woody plants.<p>If you find the submission to be relevant for Journal of Public Knowledge, please forward the submission to the review stage by selecting \"Send to Review\" and then assign reviewers by clicking \"Add Reviewer\".</p><p>If the submission is not appropriate for this journal, please decline the submission.</p><p>Thank you in advance.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Journal of Public Knowledge</a>.</p>'),
(32,1048585,5,NULL,'2024-12-27 05:30:07',805306370,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Stephanie Berardo\" <sberardo@mailinator.com>','','','You have been assigned as an editor on a submission to Journal of Public Knowledge','<p>Dear Stephanie Berardo,</p><p>The following submission has been assigned to you to see through the editorial process.</p><p><a href=\"http://localhost/index.php/publicknowledge/en/workflow/access/5\">Genetic transformation of forest trees</a><br />Diaga Diouf</p><p><b>Abstract</b></p>In this review, the recent progress on genetic transformation of forest trees were discussed. Its described also, different applications of genetic engineering for improving forest trees or understanding the mechanisms governing genes expression in woody plants.<p>If you find the submission to be relevant for Journal of Public Knowledge, please forward the submission to the review stage by selecting \"Send to Review\" and then assign reviewers by clicking \"Add Reviewer\".</p><p>If the submission is not appropriate for this journal, please decline the submission.</p><p>Thank you in advance.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Journal of Public Knowledge</a>.</p>'),
(33,1048585,5,NULL,'2024-12-27 05:30:07',536870914,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Diaga Diouf\" <ddiouf@mailinator.com>','','','Thank you for your submission to Journal of Public Knowledge','<p>Dear Diaga Diouf,</p><p>Thank you for your submission to Journal of Public Knowledge. We have received your submission, Genetic transformation of forest trees, and a member of our editorial team will see it soon. You will be sent an email when an initial decision is made, and we may contact you for further information.</p><p>You can view your submission and track its progress through the editorial process at the following location:</p><p>Submission URL: http://localhost/index.php/publicknowledge/en/authorDashboard/submission/5</p><p>If you have been logged out, you can login again with the username ddiouf.</p><p>If you have any questions, please contact me from your <a href=\"http://localhost/index.php/publicknowledge/en/authorDashboard/submission/5\">submission dashboard</a>.</p><p>Thank you for considering Journal of Public Knowledge as a venue for your work.</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Journal of Public Knowledge</a>.</p>'),
(34,1048585,5,3,'2024-12-27 05:30:13',805306369,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Diaga Diouf\" <ddiouf@mailinator.com>','','','Your submission has been sent for review','<p>Dear Diaga Diouf,</p><p>I am pleased to inform you that an editor has reviewed your submission, Genetic transformation of forest trees, and has decided to send it for peer review. An editor will identify qualified reviewers who will provide feedback on your submission.</p><p>This journal conducts double-anonymous peer review. The reviewers will not see any identifying information about you or your co-authors. Similarly, you will not know who reviewed your submission, and you will not hear from the reviewers directly. You will hear from us with feedback from the reviewers and information about the next steps.</p><p>Please note that sending the submission to peer review does not guarantee that it will be published. We will consider the reviewers\' recommendations before deciding to accept the submission for publication. You may be asked to make revisions and respond to the reviewers\' comments before a final decision is made.</p><p>If you have any questions, please contact me from your submission dashboard.</p><p><p>Daniel Barnes</p></p>'),
(35,1048585,5,3,'2024-12-27 05:30:17',1073741833,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Paul Hudson\" <phudson@mailinator.com>','','','Invitation to review','<p>Dear Paul Hudson,</p>\r\n<p>I believe that you would serve as an excellent reviewer for a submission to Journal of Public Knowledge. The submission\'s title and abstract are below, and I hope that you will consider undertaking this important task for us.</p>\r\n<p>If you are able to review this submission, your review is due by 2025-01-24. You can view the submission, upload review files, and submit your review by logging into the journal site and following the steps at the link below.</p>\r\n<p><a href=\"http://localhost/index.php/publicknowledge/en/reviewer/submission?submissionId=5\">Genetic transformation of forest trees</a></p>\r\n<p><strong>Abstract</strong></p>\r\n<p>In this review, the recent progress on genetic transformation of forest trees were discussed. Its described also, different applications of genetic engineering for improving forest trees or understanding the mechanisms governing genes expression in woody plants.</p>\r\n<p>Please <a href=\"http://localhost/index.php/publicknowledge/en/reviewer/submission?submissionId=5\">accept or decline</a> the review by <strong>2025-01-24</strong>.</p>\r\n<p>You may contact me with any questions about the submission or the review process.</p>\r\n<p>Thank you for considering this request. Your help is much appreciated.</p>\r\n<p>Kind regards,</p>\r\n<p>Daniel Barnes</p>'),
(36,1048585,5,3,'2024-12-27 05:30:19',1073741833,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Adela Gallego\" <agallego@mailinator.com>','','','Invitation to review','<p>Dear Adela Gallego,</p>\r\n<p>I believe that you would serve as an excellent reviewer for a submission to Journal of Public Knowledge. The submission\'s title and abstract are below, and I hope that you will consider undertaking this important task for us.</p>\r\n<p>If you are able to review this submission, your review is due by 2025-01-24. You can view the submission, upload review files, and submit your review by logging into the journal site and following the steps at the link below.</p>\r\n<p><a href=\"http://localhost/index.php/publicknowledge/en/reviewer/submission?submissionId=5\">Genetic transformation of forest trees</a></p>\r\n<p><strong>Abstract</strong></p>\r\n<p>In this review, the recent progress on genetic transformation of forest trees were discussed. Its described also, different applications of genetic engineering for improving forest trees or understanding the mechanisms governing genes expression in woody plants.</p>\r\n<p>Please <a href=\"http://localhost/index.php/publicknowledge/en/reviewer/submission?submissionId=5\">accept or decline</a> the review by <strong>2025-01-24</strong>.</p>\r\n<p>You may contact me with any questions about the submission or the review process.</p>\r\n<p>Thank you for considering this request. Your help is much appreciated.</p>\r\n<p>Kind regards,</p>\r\n<p>Daniel Barnes</p>'),
(37,1048585,5,3,'2024-12-27 05:30:23',805306369,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Diaga Diouf\" <ddiouf@mailinator.com>','','','Your submission has been accepted to Journal of Public Knowledge','<p>Dear Diaga Diouf,</p><p>I am pleased to inform you that we have decided to accept your submission without further revision. After careful review, we found your submission, Genetic transformation of forest trees, to meet or exceed our expectations. We are excited to publish your piece in Journal of Public Knowledge and we thank you for choosing our journal as a venue for your work.</p><p>Your submission is now forthcoming in a future issue of Journal of Public Knowledge and you are welcome to include it in your list of publications. We recognize the hard work that goes into every successful submission and we want to congratulate you on reaching this stage.</p><p>Your submission will now undergo copy editing and formatting to prepare it for publication.</p><p>You will shortly receive further instructions.</p><p>If you have any questions, please contact me from your <a href=\"http://localhost/index.php/publicknowledge/en/authorDashboard/submission/5\">submission dashboard</a>.</p><p>Kind regards,</p><p>Daniel Barnes</p>'),
(38,1048585,5,3,'2024-12-27 05:30:31',805306369,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Diaga Diouf\" <ddiouf@mailinator.com>','','','Next steps for publishing your submission','<p>Dear Diaga Diouf,</p><p>I am writing from Journal of Public Knowledge to let you know that the editing of your submission, Genetic transformation of forest trees, is complete. Your submission will now advance to the production stage, where the final galleys will be prepared for publication. We will contact you if we need any further assistance.</p><p>If you have any questions, please contact me from your <a href=\"http://localhost/index.php/publicknowledge/en/authorDashboard/submission/5\">submission dashboard</a>.</p><p>Kind regards,</p><p>Daniel Barnes</p>'),
(39,1048585,6,NULL,'2024-12-27 05:30:48',805306370,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Daniel Barnes\" <dbarnes@mailinator.com>','','','You have been assigned as an editor on a submission to Journal of Public Knowledge','<p>Dear Daniel Barnes,</p><p>The following submission has been assigned to you to see through the editorial process.</p><p><a href=\"http://localhost/index.php/publicknowledge/en/workflow/access/6\">Investigating the Shared Background Required for Argument: A Critique of Fogelin\'s Thesis on Deep Disagreement</a><br />Dana Phillips</p><p><b>Abstract</b></p>Robert Fogelin claims that interlocutors must share a framework of background beliefs and commitments in order to fruitfully pursue argument. I refute Fogelin’s claim by investigating more thoroughly the shared background required for productive argument. I find that this background consists not in any common beliefs regarding the topic at hand, but rather in certain shared pro-cedural commitments and competencies. I suggest that Fogelin and his supporters mistakenly view shared beliefs as part of the required background for productive argument because these procedural com-mitments become more difficult to uphold when people’s beliefs diverge widely regarding the topic at hand.<p>If you find the submission to be relevant for Journal of Public Knowledge, please forward the submission to the review stage by selecting \"Send to Review\" and then assign reviewers by clicking \"Add Reviewer\".</p><p>If the submission is not appropriate for this journal, please decline the submission.</p><p>Thank you in advance.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Journal of Public Knowledge</a>.</p>'),
(40,1048585,6,NULL,'2024-12-27 05:30:48',805306370,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"David Buskins\" <dbuskins@mailinator.com>','','','You have been assigned as an editor on a submission to Journal of Public Knowledge','<p>Dear David Buskins,</p><p>The following submission has been assigned to you to see through the editorial process.</p><p><a href=\"http://localhost/index.php/publicknowledge/en/workflow/access/6\">Investigating the Shared Background Required for Argument: A Critique of Fogelin\'s Thesis on Deep Disagreement</a><br />Dana Phillips</p><p><b>Abstract</b></p>Robert Fogelin claims that interlocutors must share a framework of background beliefs and commitments in order to fruitfully pursue argument. I refute Fogelin’s claim by investigating more thoroughly the shared background required for productive argument. I find that this background consists not in any common beliefs regarding the topic at hand, but rather in certain shared pro-cedural commitments and competencies. I suggest that Fogelin and his supporters mistakenly view shared beliefs as part of the required background for productive argument because these procedural com-mitments become more difficult to uphold when people’s beliefs diverge widely regarding the topic at hand.<p>If you find the submission to be relevant for Journal of Public Knowledge, please forward the submission to the review stage by selecting \"Send to Review\" and then assign reviewers by clicking \"Add Reviewer\".</p><p>If the submission is not appropriate for this journal, please decline the submission.</p><p>Thank you in advance.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Journal of Public Knowledge</a>.</p>'),
(41,1048585,6,NULL,'2024-12-27 05:30:48',805306370,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Stephanie Berardo\" <sberardo@mailinator.com>','','','You have been assigned as an editor on a submission to Journal of Public Knowledge','<p>Dear Stephanie Berardo,</p><p>The following submission has been assigned to you to see through the editorial process.</p><p><a href=\"http://localhost/index.php/publicknowledge/en/workflow/access/6\">Investigating the Shared Background Required for Argument: A Critique of Fogelin\'s Thesis on Deep Disagreement</a><br />Dana Phillips</p><p><b>Abstract</b></p>Robert Fogelin claims that interlocutors must share a framework of background beliefs and commitments in order to fruitfully pursue argument. I refute Fogelin’s claim by investigating more thoroughly the shared background required for productive argument. I find that this background consists not in any common beliefs regarding the topic at hand, but rather in certain shared pro-cedural commitments and competencies. I suggest that Fogelin and his supporters mistakenly view shared beliefs as part of the required background for productive argument because these procedural com-mitments become more difficult to uphold when people’s beliefs diverge widely regarding the topic at hand.<p>If you find the submission to be relevant for Journal of Public Knowledge, please forward the submission to the review stage by selecting \"Send to Review\" and then assign reviewers by clicking \"Add Reviewer\".</p><p>If the submission is not appropriate for this journal, please decline the submission.</p><p>Thank you in advance.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Journal of Public Knowledge</a>.</p>'),
(42,1048585,6,NULL,'2024-12-27 05:30:49',536870914,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Dana Phillips\" <dphillips@mailinator.com>','','','Thank you for your submission to Journal of Public Knowledge','<p>Dear Dana Phillips,</p><p>Thank you for your submission to Journal of Public Knowledge. We have received your submission, Investigating the Shared Background Required for Argument: A Critique of Fogelin\'s Thesis on Deep Disagreement, and a member of our editorial team will see it soon. You will be sent an email when an initial decision is made, and we may contact you for further information.</p><p>You can view your submission and track its progress through the editorial process at the following location:</p><p>Submission URL: http://localhost/index.php/publicknowledge/en/authorDashboard/submission/6</p><p>If you have been logged out, you can login again with the username dphillips.</p><p>If you have any questions, please contact me from your <a href=\"http://localhost/index.php/publicknowledge/en/authorDashboard/submission/6\">submission dashboard</a>.</p><p>Thank you for considering Journal of Public Knowledge as a venue for your work.</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Journal of Public Knowledge</a>.</p>'),
(43,1048585,6,3,'2024-12-27 05:30:55',805306369,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Dana Phillips\" <dphillips@mailinator.com>','','','Your submission has been sent for review','<p>Dear Dana Phillips,</p><p>I am pleased to inform you that an editor has reviewed your submission, Investigating the Shared Background Required for Argument: A Critique of Fogelin\'s Thesis on Deep Disagreement, and has decided to send it for peer review. An editor will identify qualified reviewers who will provide feedback on your submission.</p><p>This journal conducts double-anonymous peer review. The reviewers will not see any identifying information about you or your co-authors. Similarly, you will not know who reviewed your submission, and you will not hear from the reviewers directly. You will hear from us with feedback from the reviewers and information about the next steps.</p><p>Please note that sending the submission to peer review does not guarantee that it will be published. We will consider the reviewers\' recommendations before deciding to accept the submission for publication. You may be asked to make revisions and respond to the reviewers\' comments before a final decision is made.</p><p>If you have any questions, please contact me from your submission dashboard.</p><p><p>Daniel Barnes</p></p>'),
(44,1048585,6,3,'2024-12-27 05:30:59',1073741833,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Julie Janssen\" <jjanssen@mailinator.com>','','','Invitation to review','<p>Dear Julie Janssen,</p>\r\n<p>I believe that you would serve as an excellent reviewer for a submission to Journal of Public Knowledge. The submission\'s title and abstract are below, and I hope that you will consider undertaking this important task for us.</p>\r\n<p>If you are able to review this submission, your review is due by 2025-01-24. You can view the submission, upload review files, and submit your review by logging into the journal site and following the steps at the link below.</p>\r\n<p><a href=\"http://localhost/index.php/publicknowledge/en/reviewer/submission?submissionId=6\">Investigating the Shared Background Required for Argument: A Critique of Fogelin\'s Thesis on Deep Disagreement</a></p>\r\n<p><strong>Abstract</strong></p>\r\n<p>Robert Fogelin claims that interlocutors must share a framework of background beliefs and commitments in order to fruitfully pursue argument. I refute Fogelin’s claim by investigating more thoroughly the shared background required for productive argument. I find that this background consists not in any common beliefs regarding the topic at hand, but rather in certain shared pro-cedural commitments and competencies. I suggest that Fogelin and his supporters mistakenly view shared beliefs as part of the required background for productive argument because these procedural com-mitments become more difficult to uphold when people’s beliefs diverge widely regarding the topic at hand.</p>\r\n<p>Please <a href=\"http://localhost/index.php/publicknowledge/en/reviewer/submission?submissionId=6\">accept or decline</a> the review by <strong>2025-01-24</strong>.</p>\r\n<p>You may contact me with any questions about the submission or the review process.</p>\r\n<p>Thank you for considering this request. Your help is much appreciated.</p>\r\n<p>Kind regards,</p>\r\n<p>Daniel Barnes</p>'),
(45,1048585,6,3,'2024-12-27 05:31:01',1073741833,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Adela Gallego\" <agallego@mailinator.com>','','','Invitation to review','<p>Dear Adela Gallego,</p>\r\n<p>I believe that you would serve as an excellent reviewer for a submission to Journal of Public Knowledge. The submission\'s title and abstract are below, and I hope that you will consider undertaking this important task for us.</p>\r\n<p>If you are able to review this submission, your review is due by 2025-01-24. You can view the submission, upload review files, and submit your review by logging into the journal site and following the steps at the link below.</p>\r\n<p><a href=\"http://localhost/index.php/publicknowledge/en/reviewer/submission?submissionId=6\">Investigating the Shared Background Required for Argument: A Critique of Fogelin\'s Thesis on Deep Disagreement</a></p>\r\n<p><strong>Abstract</strong></p>\r\n<p>Robert Fogelin claims that interlocutors must share a framework of background beliefs and commitments in order to fruitfully pursue argument. I refute Fogelin’s claim by investigating more thoroughly the shared background required for productive argument. I find that this background consists not in any common beliefs regarding the topic at hand, but rather in certain shared pro-cedural commitments and competencies. I suggest that Fogelin and his supporters mistakenly view shared beliefs as part of the required background for productive argument because these procedural com-mitments become more difficult to uphold when people’s beliefs diverge widely regarding the topic at hand.</p>\r\n<p>Please <a href=\"http://localhost/index.php/publicknowledge/en/reviewer/submission?submissionId=6\">accept or decline</a> the review by <strong>2025-01-24</strong>.</p>\r\n<p>You may contact me with any questions about the submission or the review process.</p>\r\n<p>Thank you for considering this request. Your help is much appreciated.</p>\r\n<p>Kind regards,</p>\r\n<p>Daniel Barnes</p>'),
(46,1048585,6,3,'2024-12-27 05:31:05',805306369,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Dana Phillips\" <dphillips@mailinator.com>','','','Your submission has been accepted to Journal of Public Knowledge','<p>Dear Dana Phillips,</p><p>I am pleased to inform you that we have decided to accept your submission without further revision. After careful review, we found your submission, Investigating the Shared Background Required for Argument: A Critique of Fogelin\'s Thesis on Deep Disagreement, to meet or exceed our expectations. We are excited to publish your piece in Journal of Public Knowledge and we thank you for choosing our journal as a venue for your work.</p><p>Your submission is now forthcoming in a future issue of Journal of Public Knowledge and you are welcome to include it in your list of publications. We recognize the hard work that goes into every successful submission and we want to congratulate you on reaching this stage.</p><p>Your submission will now undergo copy editing and formatting to prepare it for publication.</p><p>You will shortly receive further instructions.</p><p>If you have any questions, please contact me from your <a href=\"http://localhost/index.php/publicknowledge/en/authorDashboard/submission/6\">submission dashboard</a>.</p><p>Kind regards,</p><p>Daniel Barnes</p>'),
(47,1048585,6,3,'2024-12-27 05:31:13',805306369,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Dana Phillips\" <dphillips@mailinator.com>','','','Next steps for publishing your submission','<p>Dear Dana Phillips,</p><p>I am writing from Journal of Public Knowledge to let you know that the editing of your submission, Investigating the Shared Background Required for Argument: A Critique of Fogelin\'s Thesis on Deep Disagreement, is complete. Your submission will now advance to the production stage, where the final galleys will be prepared for publication. We will contact you if we need any further assistance.</p><p>If you have any questions, please contact me from your <a href=\"http://localhost/index.php/publicknowledge/en/authorDashboard/submission/6\">submission dashboard</a>.</p><p>Kind regards,</p><p>Daniel Barnes</p>'),
(48,1048585,7,NULL,'2024-12-27 05:31:27',805306370,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Daniel Barnes\" <dbarnes@mailinator.com>','','','You have been assigned as an editor on a submission to Journal of Public Knowledge','<p>Dear Daniel Barnes,</p><p>The following submission has been assigned to you to see through the editorial process.</p><p><a href=\"http://localhost/index.php/publicknowledge/en/workflow/access/7\">Developing efficacy beliefs in the classroom</a><br />Domatilia Sokoloff</p><p><b>Abstract</b></p>A major goal of education is to equip children with the knowledge, skills and self-belief to be confident and informed citizens - citizens who continue to see themselves as learners beyond graduation. This paper looks at the key role of nurturing efficacy beliefs in order to learn and participate in school and society. Research findings conducted within a social studies context are presented, showing how strategy instruction can enhance self-efficacy for learning. As part of this research, Creative Problem Solving (CPS) was taught to children as a means to motivate and support learning. It is shown that the use of CPS can have positive effects on self-efficacy for learning, and be a valuable framework to involve children in decision-making that leads to social action. Implications for enhancing self-efficacy and motivation to learn in the classroom are discussed.<p>If you find the submission to be relevant for Journal of Public Knowledge, please forward the submission to the review stage by selecting \"Send to Review\" and then assign reviewers by clicking \"Add Reviewer\".</p><p>If the submission is not appropriate for this journal, please decline the submission.</p><p>Thank you in advance.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Journal of Public Knowledge</a>.</p>'),
(49,1048585,7,NULL,'2024-12-27 05:31:27',805306370,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"David Buskins\" <dbuskins@mailinator.com>','','','You have been assigned as an editor on a submission to Journal of Public Knowledge','<p>Dear David Buskins,</p><p>The following submission has been assigned to you to see through the editorial process.</p><p><a href=\"http://localhost/index.php/publicknowledge/en/workflow/access/7\">Developing efficacy beliefs in the classroom</a><br />Domatilia Sokoloff</p><p><b>Abstract</b></p>A major goal of education is to equip children with the knowledge, skills and self-belief to be confident and informed citizens - citizens who continue to see themselves as learners beyond graduation. This paper looks at the key role of nurturing efficacy beliefs in order to learn and participate in school and society. Research findings conducted within a social studies context are presented, showing how strategy instruction can enhance self-efficacy for learning. As part of this research, Creative Problem Solving (CPS) was taught to children as a means to motivate and support learning. It is shown that the use of CPS can have positive effects on self-efficacy for learning, and be a valuable framework to involve children in decision-making that leads to social action. Implications for enhancing self-efficacy and motivation to learn in the classroom are discussed.<p>If you find the submission to be relevant for Journal of Public Knowledge, please forward the submission to the review stage by selecting \"Send to Review\" and then assign reviewers by clicking \"Add Reviewer\".</p><p>If the submission is not appropriate for this journal, please decline the submission.</p><p>Thank you in advance.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Journal of Public Knowledge</a>.</p>'),
(50,1048585,7,NULL,'2024-12-27 05:31:27',805306370,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Stephanie Berardo\" <sberardo@mailinator.com>','','','You have been assigned as an editor on a submission to Journal of Public Knowledge','<p>Dear Stephanie Berardo,</p><p>The following submission has been assigned to you to see through the editorial process.</p><p><a href=\"http://localhost/index.php/publicknowledge/en/workflow/access/7\">Developing efficacy beliefs in the classroom</a><br />Domatilia Sokoloff</p><p><b>Abstract</b></p>A major goal of education is to equip children with the knowledge, skills and self-belief to be confident and informed citizens - citizens who continue to see themselves as learners beyond graduation. This paper looks at the key role of nurturing efficacy beliefs in order to learn and participate in school and society. Research findings conducted within a social studies context are presented, showing how strategy instruction can enhance self-efficacy for learning. As part of this research, Creative Problem Solving (CPS) was taught to children as a means to motivate and support learning. It is shown that the use of CPS can have positive effects on self-efficacy for learning, and be a valuable framework to involve children in decision-making that leads to social action. Implications for enhancing self-efficacy and motivation to learn in the classroom are discussed.<p>If you find the submission to be relevant for Journal of Public Knowledge, please forward the submission to the review stage by selecting \"Send to Review\" and then assign reviewers by clicking \"Add Reviewer\".</p><p>If the submission is not appropriate for this journal, please decline the submission.</p><p>Thank you in advance.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Journal of Public Knowledge</a>.</p>'),
(51,1048585,7,NULL,'2024-12-27 05:31:28',536870914,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Domatilia Sokoloff\" <dsokoloff@mailinator.com>','','','Thank you for your submission to Journal of Public Knowledge','<p>Dear Domatilia Sokoloff,</p><p>Thank you for your submission to Journal of Public Knowledge. We have received your submission, Developing efficacy beliefs in the classroom, and a member of our editorial team will see it soon. You will be sent an email when an initial decision is made, and we may contact you for further information.</p><p>You can view your submission and track its progress through the editorial process at the following location:</p><p>Submission URL: http://localhost/index.php/publicknowledge/en/authorDashboard/submission/7</p><p>If you have been logged out, you can login again with the username dsokoloff.</p><p>If you have any questions, please contact me from your <a href=\"http://localhost/index.php/publicknowledge/en/authorDashboard/submission/7\">submission dashboard</a>.</p><p>Thank you for considering Journal of Public Knowledge as a venue for your work.</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Journal of Public Knowledge</a>.</p>'),
(52,1048585,7,3,'2024-12-27 05:31:34',805306369,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Domatilia Sokoloff\" <dsokoloff@mailinator.com>','','','Your submission has been sent for review','<p>Dear Domatilia Sokoloff,</p><p>I am pleased to inform you that an editor has reviewed your submission, Developing efficacy beliefs in the classroom, and has decided to send it for peer review. An editor will identify qualified reviewers who will provide feedback on your submission.</p><p>This journal conducts double-anonymous peer review. The reviewers will not see any identifying information about you or your co-authors. Similarly, you will not know who reviewed your submission, and you will not hear from the reviewers directly. You will hear from us with feedback from the reviewers and information about the next steps.</p><p>Please note that sending the submission to peer review does not guarantee that it will be published. We will consider the reviewers\' recommendations before deciding to accept the submission for publication. You may be asked to make revisions and respond to the reviewers\' comments before a final decision is made.</p><p>If you have any questions, please contact me from your submission dashboard.</p><p><p>Daniel Barnes</p></p>'),
(53,1048585,7,3,'2024-12-27 05:31:38',1073741833,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Paul Hudson\" <phudson@mailinator.com>','','','Invitation to review','<p>Dear Paul Hudson,</p>\r\n<p>I believe that you would serve as an excellent reviewer for a submission to Journal of Public Knowledge. The submission\'s title and abstract are below, and I hope that you will consider undertaking this important task for us.</p>\r\n<p>If you are able to review this submission, your review is due by 2025-01-24. You can view the submission, upload review files, and submit your review by logging into the journal site and following the steps at the link below.</p>\r\n<p><a href=\"http://localhost/index.php/publicknowledge/en/reviewer/submission?submissionId=7\">Developing efficacy beliefs in the classroom</a></p>\r\n<p><strong>Abstract</strong></p>\r\n<p>A major goal of education is to equip children with the knowledge, skills and self-belief to be confident and informed citizens - citizens who continue to see themselves as learners beyond graduation. This paper looks at the key role of nurturing efficacy beliefs in order to learn and participate in school and society. Research findings conducted within a social studies context are presented, showing how strategy instruction can enhance self-efficacy for learning. As part of this research, Creative Problem Solving (CPS) was taught to children as a means to motivate and support learning. It is shown that the use of CPS can have positive effects on self-efficacy for learning, and be a valuable framework to involve children in decision-making that leads to social action. Implications for enhancing self-efficacy and motivation to learn in the classroom are discussed.</p>\r\n<p>Please <a href=\"http://localhost/index.php/publicknowledge/en/reviewer/submission?submissionId=7\">accept or decline</a> the review by <strong>2025-01-24</strong>.</p>\r\n<p>You may contact me with any questions about the submission or the review process.</p>\r\n<p>Thank you for considering this request. Your help is much appreciated.</p>\r\n<p>Kind regards,</p>\r\n<p>Daniel Barnes</p>'),
(54,1048585,7,3,'2024-12-27 05:31:40',1073741833,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Aisla McCrae\" <amccrae@mailinator.com>','','','Invitation to review','<p>Dear Aisla McCrae,</p>\r\n<p>I believe that you would serve as an excellent reviewer for a submission to Journal of Public Knowledge. The submission\'s title and abstract are below, and I hope that you will consider undertaking this important task for us.</p>\r\n<p>If you are able to review this submission, your review is due by 2025-01-24. You can view the submission, upload review files, and submit your review by logging into the journal site and following the steps at the link below.</p>\r\n<p><a href=\"http://localhost/index.php/publicknowledge/en/reviewer/submission?submissionId=7\">Developing efficacy beliefs in the classroom</a></p>\r\n<p><strong>Abstract</strong></p>\r\n<p>A major goal of education is to equip children with the knowledge, skills and self-belief to be confident and informed citizens - citizens who continue to see themselves as learners beyond graduation. This paper looks at the key role of nurturing efficacy beliefs in order to learn and participate in school and society. Research findings conducted within a social studies context are presented, showing how strategy instruction can enhance self-efficacy for learning. As part of this research, Creative Problem Solving (CPS) was taught to children as a means to motivate and support learning. It is shown that the use of CPS can have positive effects on self-efficacy for learning, and be a valuable framework to involve children in decision-making that leads to social action. Implications for enhancing self-efficacy and motivation to learn in the classroom are discussed.</p>\r\n<p>Please <a href=\"http://localhost/index.php/publicknowledge/en/reviewer/submission?submissionId=7\">accept or decline</a> the review by <strong>2025-01-24</strong>.</p>\r\n<p>You may contact me with any questions about the submission or the review process.</p>\r\n<p>Thank you for considering this request. Your help is much appreciated.</p>\r\n<p>Kind regards,</p>\r\n<p>Daniel Barnes</p>'),
(55,1048585,7,3,'2024-12-27 05:31:43',1073741833,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Adela Gallego\" <agallego@mailinator.com>','','','Invitation to review','<p>Dear Adela Gallego,</p>\r\n<p>I believe that you would serve as an excellent reviewer for a submission to Journal of Public Knowledge. The submission\'s title and abstract are below, and I hope that you will consider undertaking this important task for us.</p>\r\n<p>If you are able to review this submission, your review is due by 2025-01-24. You can view the submission, upload review files, and submit your review by logging into the journal site and following the steps at the link below.</p>\r\n<p><a href=\"http://localhost/index.php/publicknowledge/en/reviewer/submission?submissionId=7\">Developing efficacy beliefs in the classroom</a></p>\r\n<p><strong>Abstract</strong></p>\r\n<p>A major goal of education is to equip children with the knowledge, skills and self-belief to be confident and informed citizens - citizens who continue to see themselves as learners beyond graduation. This paper looks at the key role of nurturing efficacy beliefs in order to learn and participate in school and society. Research findings conducted within a social studies context are presented, showing how strategy instruction can enhance self-efficacy for learning. As part of this research, Creative Problem Solving (CPS) was taught to children as a means to motivate and support learning. It is shown that the use of CPS can have positive effects on self-efficacy for learning, and be a valuable framework to involve children in decision-making that leads to social action. Implications for enhancing self-efficacy and motivation to learn in the classroom are discussed.</p>\r\n<p>Please <a href=\"http://localhost/index.php/publicknowledge/en/reviewer/submission?submissionId=7\">accept or decline</a> the review by <strong>2025-01-24</strong>.</p>\r\n<p>You may contact me with any questions about the submission or the review process.</p>\r\n<p>Thank you for considering this request. Your help is much appreciated.</p>\r\n<p>Kind regards,</p>\r\n<p>Daniel Barnes</p>'),
(56,1048585,7,8,'2024-12-27 05:31:48',1073741829,'\"Paul Hudson\" <phudson@mailinator.com>','\"Daniel Barnes\" <dbarnes@mailinator.com>, \"David Buskins\" <dbuskins@mailinator.com>, \"Stephanie Berardo\" <sberardo@mailinator.com>','','','Review accepted: Paul Hudson accepted review assignment for #7 Sokoloff — Developing efficacy beliefs in the classroom','<p>Dear Daniel Barnes, David Buskins, Stephanie Berardo,</p><p>Paul Hudson has accepted the following review:</p><p><a href=\"http://localhost/index.php/publicknowledge/en/workflow/access/7\">#7 Sokoloff — Developing efficacy beliefs in the classroom</a><br /><b>Type:</b> Anonymous Reviewer/Anonymous Author</p><p><b>Review Due:</b> 2025-01-24</p><p>Login to <a href=\"http://localhost/index.php/publicknowledge/en/workflow/access/7\">view all reviewer assignments</a> for this submission.</p><br><br>—<br>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge/en\">Journal of Public Knowledge</a>.'),
(57,1048585,7,3,'2024-12-27 05:31:51',1073741836,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Daniel Barnes\" <dbarnes@mailinator.com>','','','Review complete: Paul Hudson recommends Choose One for #7 Sokoloff — Developing efficacy beliefs in the classroom','<p>Dear Daniel Barnes,</p><p>Paul Hudson completed the following review:</p><p><a href=\"http://localhost/index.php/publicknowledge/en/workflow/access/7\">#7 Sokoloff — Developing efficacy beliefs in the classroom</a><br /><b>Recommendation:</b> Choose One<br /><b>Type:</b> Anonymous Reviewer/Anonymous Author</p><p>Login to <a href=\"http://localhost/index.php/publicknowledge/en/workflow/access/7\">view all files and comments</a> provided by this reviewer.</p>'),
(58,1048585,7,4,'2024-12-27 05:31:51',1073741836,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"David Buskins\" <dbuskins@mailinator.com>','','','Review complete: Paul Hudson recommends Choose One for #7 Sokoloff — Developing efficacy beliefs in the classroom','<p>Dear David Buskins,</p><p>Paul Hudson completed the following review:</p><p><a href=\"http://localhost/index.php/publicknowledge/en/workflow/access/7\">#7 Sokoloff — Developing efficacy beliefs in the classroom</a><br /><b>Recommendation:</b> Choose One<br /><b>Type:</b> Anonymous Reviewer/Anonymous Author</p><p>Login to <a href=\"http://localhost/index.php/publicknowledge/en/workflow/access/7\">view all files and comments</a> provided by this reviewer.</p>'),
(59,1048585,7,5,'2024-12-27 05:31:51',1073741836,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Stephanie Berardo\" <sberardo@mailinator.com>','','','Review complete: Paul Hudson recommends Choose One for #7 Sokoloff — Developing efficacy beliefs in the classroom','<p>Dear Stephanie Berardo,</p><p>Paul Hudson completed the following review:</p><p><a href=\"http://localhost/index.php/publicknowledge/en/workflow/access/7\">#7 Sokoloff — Developing efficacy beliefs in the classroom</a><br /><b>Recommendation:</b> Choose One<br /><b>Type:</b> Anonymous Reviewer/Anonymous Author</p><p>Login to <a href=\"http://localhost/index.php/publicknowledge/en/workflow/access/7\">view all files and comments</a> provided by this reviewer.</p>'),
(60,1048585,8,NULL,'2024-12-27 05:32:01',805306370,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Daniel Barnes\" <dbarnes@mailinator.com>','','','You have been assigned as an editor on a submission to Journal of Public Knowledge','<p>Dear Daniel Barnes,</p><p>The following submission has been assigned to you to see through the editorial process.</p><p><a href=\"http://localhost/index.php/publicknowledge/en/workflow/access/8\">Traditions and Trends in the Study of the Commons</a><br />Elinor Ostrom, Frank van Laerhoven</p><p><b>Abstract</b></p>The study of the commons has expe- rienced substantial growth and development over the past decades.1 Distinguished scholars in many disciplines had long studied how specific resources were managed or mismanaged at particular times and places (Coward 1980; De los Reyes 1980; MacKenzie 1979; Wittfogel 1957), but researchers who studied specific commons before the mid-1980s were, however, less likely than their contemporary colleagues to be well informed about the work of scholars in other disciplines, about other sec- tors in their own region of interest, or in other regions of the world.<p>If you find the submission to be relevant for Journal of Public Knowledge, please forward the submission to the review stage by selecting \"Send to Review\" and then assign reviewers by clicking \"Add Reviewer\".</p><p>If the submission is not appropriate for this journal, please decline the submission.</p><p>Thank you in advance.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Journal of Public Knowledge</a>.</p>'),
(61,1048585,8,NULL,'2024-12-27 05:32:02',805306370,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"David Buskins\" <dbuskins@mailinator.com>','','','You have been assigned as an editor on a submission to Journal of Public Knowledge','<p>Dear David Buskins,</p><p>The following submission has been assigned to you to see through the editorial process.</p><p><a href=\"http://localhost/index.php/publicknowledge/en/workflow/access/8\">Traditions and Trends in the Study of the Commons</a><br />Elinor Ostrom, Frank van Laerhoven</p><p><b>Abstract</b></p>The study of the commons has expe- rienced substantial growth and development over the past decades.1 Distinguished scholars in many disciplines had long studied how specific resources were managed or mismanaged at particular times and places (Coward 1980; De los Reyes 1980; MacKenzie 1979; Wittfogel 1957), but researchers who studied specific commons before the mid-1980s were, however, less likely than their contemporary colleagues to be well informed about the work of scholars in other disciplines, about other sec- tors in their own region of interest, or in other regions of the world.<p>If you find the submission to be relevant for Journal of Public Knowledge, please forward the submission to the review stage by selecting \"Send to Review\" and then assign reviewers by clicking \"Add Reviewer\".</p><p>If the submission is not appropriate for this journal, please decline the submission.</p><p>Thank you in advance.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Journal of Public Knowledge</a>.</p>'),
(62,1048585,8,NULL,'2024-12-27 05:32:02',805306370,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Stephanie Berardo\" <sberardo@mailinator.com>','','','You have been assigned as an editor on a submission to Journal of Public Knowledge','<p>Dear Stephanie Berardo,</p><p>The following submission has been assigned to you to see through the editorial process.</p><p><a href=\"http://localhost/index.php/publicknowledge/en/workflow/access/8\">Traditions and Trends in the Study of the Commons</a><br />Elinor Ostrom, Frank van Laerhoven</p><p><b>Abstract</b></p>The study of the commons has expe- rienced substantial growth and development over the past decades.1 Distinguished scholars in many disciplines had long studied how specific resources were managed or mismanaged at particular times and places (Coward 1980; De los Reyes 1980; MacKenzie 1979; Wittfogel 1957), but researchers who studied specific commons before the mid-1980s were, however, less likely than their contemporary colleagues to be well informed about the work of scholars in other disciplines, about other sec- tors in their own region of interest, or in other regions of the world.<p>If you find the submission to be relevant for Journal of Public Knowledge, please forward the submission to the review stage by selecting \"Send to Review\" and then assign reviewers by clicking \"Add Reviewer\".</p><p>If the submission is not appropriate for this journal, please decline the submission.</p><p>Thank you in advance.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Journal of Public Knowledge</a>.</p>'),
(63,1048585,8,NULL,'2024-12-27 05:32:02',536870914,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Elinor Ostrom\" <eostrom@mailinator.com>','','','Thank you for your submission to Journal of Public Knowledge','<p>Dear Elinor Ostrom,</p><p>Thank you for your submission to Journal of Public Knowledge. We have received your submission, Traditions and Trends in the Study of the Commons, and a member of our editorial team will see it soon. You will be sent an email when an initial decision is made, and we may contact you for further information.</p><p>You can view your submission and track its progress through the editorial process at the following location:</p><p>Submission URL: http://localhost/index.php/publicknowledge/en/authorDashboard/submission/8</p><p>If you have been logged out, you can login again with the username eostrom.</p><p>If you have any questions, please contact me from your <a href=\"http://localhost/index.php/publicknowledge/en/authorDashboard/submission/8\">submission dashboard</a>.</p><p>Thank you for considering Journal of Public Knowledge as a venue for your work.</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Journal of Public Knowledge</a>.</p>'),
(64,1048585,8,NULL,'2024-12-27 05:32:02',536870914,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Frank van Laerhoven\" <fvanlaerhoven@mailinator.com>','','','Submission confirmation','<p>Dear Frank van Laerhoven,</p><p>You have been named as a co-author on a submission to Journal of Public Knowledge. The submitter, Elinor Ostrom, provided the following details:</p><p>Traditions and Trends in the Study of the Commons<br></p><p>If any of these details are incorrect, or you do not wish to be named on this submission, please contact me.</p><p>Thank you for considering Journal of Public Knowledge as a venue for your work.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Journal of Public Knowledge</a>.</p>'),
(65,1048585,9,NULL,'2024-12-27 05:32:11',805306370,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Daniel Barnes\" <dbarnes@mailinator.com>','','','You have been assigned as an editor on a submission to Journal of Public Knowledge','<p>Dear Daniel Barnes,</p><p>The following submission has been assigned to you to see through the editorial process.</p><p><a href=\"http://localhost/index.php/publicknowledge/en/workflow/access/9\">Hansen & Pinto: Reason Reclaimed</a><br />Fabio Paglieri</p><p><b>Abstract</b></p>None.<p>If you find the submission to be relevant for Journal of Public Knowledge, please forward the submission to the review stage by selecting \"Send to Review\" and then assign reviewers by clicking \"Add Reviewer\".</p><p>If the submission is not appropriate for this journal, please decline the submission.</p><p>Thank you in advance.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Journal of Public Knowledge</a>.</p>'),
(66,1048585,9,NULL,'2024-12-27 05:32:11',805306370,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Minoti Inoue\" <minoue@mailinator.com>','','','You have been assigned as an editor on a submission to Journal of Public Knowledge','<p>Dear Minoti Inoue,</p><p>The following submission has been assigned to you to see through the editorial process.</p><p><a href=\"http://localhost/index.php/publicknowledge/en/workflow/access/9\">Hansen & Pinto: Reason Reclaimed</a><br />Fabio Paglieri</p><p><b>Abstract</b></p>None.<p>If you find the submission to be relevant for Journal of Public Knowledge, please forward the submission to the review stage by selecting \"Send to Review\" and then assign reviewers by clicking \"Add Reviewer\".</p><p>If the submission is not appropriate for this journal, please decline the submission.</p><p>Thank you in advance.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Journal of Public Knowledge</a>.</p>'),
(67,1048585,9,NULL,'2024-12-27 05:32:11',536870914,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Fabio Paglieri\" <fpaglieri@mailinator.com>','','','Thank you for your submission to Journal of Public Knowledge','<p>Dear Fabio Paglieri,</p><p>Thank you for your submission to Journal of Public Knowledge. We have received your submission, Hansen & Pinto: Reason Reclaimed, and a member of our editorial team will see it soon. You will be sent an email when an initial decision is made, and we may contact you for further information.</p><p>You can view your submission and track its progress through the editorial process at the following location:</p><p>Submission URL: http://localhost/index.php/publicknowledge/en/authorDashboard/submission/9</p><p>If you have been logged out, you can login again with the username fpaglieri.</p><p>If you have any questions, please contact me from your <a href=\"http://localhost/index.php/publicknowledge/en/authorDashboard/submission/9\">submission dashboard</a>.</p><p>Thank you for considering Journal of Public Knowledge as a venue for your work.</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Journal of Public Knowledge</a>.</p>'),
(68,1048585,9,3,'2024-12-27 05:32:18',805306369,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Fabio Paglieri\" <fpaglieri@mailinator.com>','','','Your submission has been sent for review','<p>Dear Fabio Paglieri,</p><p>I am pleased to inform you that an editor has reviewed your submission, Hansen & Pinto: Reason Reclaimed, and has decided to send it for peer review. An editor will identify qualified reviewers who will provide feedback on your submission.</p><p>This journal conducts double-anonymous peer review. The reviewers will not see any identifying information about you or your co-authors. Similarly, you will not know who reviewed your submission, and you will not hear from the reviewers directly. You will hear from us with feedback from the reviewers and information about the next steps.</p><p>Please note that sending the submission to peer review does not guarantee that it will be published. We will consider the reviewers\' recommendations before deciding to accept the submission for publication. You may be asked to make revisions and respond to the reviewers\' comments before a final decision is made.</p><p>If you have any questions, please contact me from your submission dashboard.</p><p><p>Daniel Barnes</p></p>'),
(69,1048585,9,3,'2024-12-27 05:32:22',1073741833,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Julie Janssen\" <jjanssen@mailinator.com>','','','Invitation to review','<p>Dear Julie Janssen,</p>\r\n<p>I believe that you would serve as an excellent reviewer for a submission to Journal of Public Knowledge. The submission\'s title and abstract are below, and I hope that you will consider undertaking this important task for us.</p>\r\n<p>If you are able to review this submission, your review is due by 2025-01-24. You can view the submission, upload review files, and submit your review by logging into the journal site and following the steps at the link below.</p>\r\n<p><a href=\"http://localhost/index.php/publicknowledge/en/reviewer/submission?submissionId=9\">Hansen &amp; Pinto: Reason Reclaimed</a></p>\r\n<p><strong>Abstract</strong></p>\r\n<p>None.</p>\r\n<p>Please <a href=\"http://localhost/index.php/publicknowledge/en/reviewer/submission?submissionId=9\">accept or decline</a> the review by <strong>2025-01-24</strong>.</p>\r\n<p>You may contact me with any questions about the submission or the review process.</p>\r\n<p>Thank you for considering this request. Your help is much appreciated.</p>\r\n<p>Kind regards,</p>\r\n<p>Daniel Barnes</p>'),
(70,1048585,9,3,'2024-12-27 05:32:24',1073741833,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Adela Gallego\" <agallego@mailinator.com>','','','Invitation to review','<p>Dear Adela Gallego,</p>\r\n<p>I believe that you would serve as an excellent reviewer for a submission to Journal of Public Knowledge. The submission\'s title and abstract are below, and I hope that you will consider undertaking this important task for us.</p>\r\n<p>If you are able to review this submission, your review is due by 2025-01-24. You can view the submission, upload review files, and submit your review by logging into the journal site and following the steps at the link below.</p>\r\n<p><a href=\"http://localhost/index.php/publicknowledge/en/reviewer/submission?submissionId=9\">Hansen &amp; Pinto: Reason Reclaimed</a></p>\r\n<p><strong>Abstract</strong></p>\r\n<p>None.</p>\r\n<p>Please <a href=\"http://localhost/index.php/publicknowledge/en/reviewer/submission?submissionId=9\">accept or decline</a> the review by <strong>2025-01-24</strong>.</p>\r\n<p>You may contact me with any questions about the submission or the review process.</p>\r\n<p>Thank you for considering this request. Your help is much appreciated.</p>\r\n<p>Kind regards,</p>\r\n<p>Daniel Barnes</p>'),
(71,1048585,9,3,'2024-12-27 05:32:28',805306369,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Fabio Paglieri\" <fpaglieri@mailinator.com>','','','Your submission has been accepted to Journal of Public Knowledge','<p>Dear Fabio Paglieri,</p><p>I am pleased to inform you that we have decided to accept your submission without further revision. After careful review, we found your submission, Hansen & Pinto: Reason Reclaimed, to meet or exceed our expectations. We are excited to publish your piece in Journal of Public Knowledge and we thank you for choosing our journal as a venue for your work.</p><p>Your submission is now forthcoming in a future issue of Journal of Public Knowledge and you are welcome to include it in your list of publications. We recognize the hard work that goes into every successful submission and we want to congratulate you on reaching this stage.</p><p>Your submission will now undergo copy editing and formatting to prepare it for publication.</p><p>You will shortly receive further instructions.</p><p>If you have any questions, please contact me from your <a href=\"http://localhost/index.php/publicknowledge/en/authorDashboard/submission/9\">submission dashboard</a>.</p><p>Kind regards,</p><p>Daniel Barnes</p>'),
(72,1048585,9,3,'2024-12-27 05:32:37',805306369,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Fabio Paglieri\" <fpaglieri@mailinator.com>','','','Next steps for publishing your submission','<p>Dear Fabio Paglieri,</p><p>I am writing from Journal of Public Knowledge to let you know that the editing of your submission, Hansen & Pinto: Reason Reclaimed, is complete. Your submission will now advance to the production stage, where the final galleys will be prepared for publication. We will contact you if we need any further assistance.</p><p>If you have any questions, please contact me from your <a href=\"http://localhost/index.php/publicknowledge/en/authorDashboard/submission/9\">submission dashboard</a>.</p><p>Kind regards,</p><p>Daniel Barnes</p>'),
(73,1048585,10,NULL,'2024-12-27 05:32:54',805306370,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Daniel Barnes\" <dbarnes@mailinator.com>','','','You have been assigned as an editor on a submission to Journal of Public Knowledge','<p>Dear Daniel Barnes,</p><p>The following submission has been assigned to you to see through the editorial process.</p><p><a href=\"http://localhost/index.php/publicknowledge/en/workflow/access/10\">Condensing Water Availability Models to Focus on Specific Water Management Systems</a><br />John Novak</p><p><b>Abstract</b></p>The Texas Water Availability Modeling System is routinely applied in administration of the water rights permit system, regional and statewide planning, and an expanding variety of other endeavors. Modeling water management in the 23 river basins of the state reflects about 8,000 water right permits and 3,400 reservoirs. Datasets are necessarily large and complex to provide the decision-support capabilities for which the modeling system was developed. New modeling features are being added, and the different types of applications are growing. Certain applications are enhanced by simplifying the simulation input datasets to focus on particular water management systems. A methodology is presented for developing a condensed dataset for a selected reservoir system that reflects the impacts of all the water rights and accompanying reservoirs removed from the original complete dataset. A set of streamflows is developed that represents flows available to the selected system considering the effects of all the other water rights in the river basin contained in the original complete model input dataset that are not included in the condensed dataset. The methodology is applied to develop a condensed model of the Brazos River Authority reservoir system based on modifying the Texas Water Availability Modeling System dataset for the Brazos River Basin.<p>If you find the submission to be relevant for Journal of Public Knowledge, please forward the submission to the review stage by selecting \"Send to Review\" and then assign reviewers by clicking \"Add Reviewer\".</p><p>If the submission is not appropriate for this journal, please decline the submission.</p><p>Thank you in advance.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Journal of Public Knowledge</a>.</p>'),
(74,1048585,10,NULL,'2024-12-27 05:32:54',805306370,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"David Buskins\" <dbuskins@mailinator.com>','','','You have been assigned as an editor on a submission to Journal of Public Knowledge','<p>Dear David Buskins,</p><p>The following submission has been assigned to you to see through the editorial process.</p><p><a href=\"http://localhost/index.php/publicknowledge/en/workflow/access/10\">Condensing Water Availability Models to Focus on Specific Water Management Systems</a><br />John Novak</p><p><b>Abstract</b></p>The Texas Water Availability Modeling System is routinely applied in administration of the water rights permit system, regional and statewide planning, and an expanding variety of other endeavors. Modeling water management in the 23 river basins of the state reflects about 8,000 water right permits and 3,400 reservoirs. Datasets are necessarily large and complex to provide the decision-support capabilities for which the modeling system was developed. New modeling features are being added, and the different types of applications are growing. Certain applications are enhanced by simplifying the simulation input datasets to focus on particular water management systems. A methodology is presented for developing a condensed dataset for a selected reservoir system that reflects the impacts of all the water rights and accompanying reservoirs removed from the original complete dataset. A set of streamflows is developed that represents flows available to the selected system considering the effects of all the other water rights in the river basin contained in the original complete model input dataset that are not included in the condensed dataset. The methodology is applied to develop a condensed model of the Brazos River Authority reservoir system based on modifying the Texas Water Availability Modeling System dataset for the Brazos River Basin.<p>If you find the submission to be relevant for Journal of Public Knowledge, please forward the submission to the review stage by selecting \"Send to Review\" and then assign reviewers by clicking \"Add Reviewer\".</p><p>If the submission is not appropriate for this journal, please decline the submission.</p><p>Thank you in advance.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Journal of Public Knowledge</a>.</p>'),
(75,1048585,10,NULL,'2024-12-27 05:32:55',805306370,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Stephanie Berardo\" <sberardo@mailinator.com>','','','You have been assigned as an editor on a submission to Journal of Public Knowledge','<p>Dear Stephanie Berardo,</p><p>The following submission has been assigned to you to see through the editorial process.</p><p><a href=\"http://localhost/index.php/publicknowledge/en/workflow/access/10\">Condensing Water Availability Models to Focus on Specific Water Management Systems</a><br />John Novak</p><p><b>Abstract</b></p>The Texas Water Availability Modeling System is routinely applied in administration of the water rights permit system, regional and statewide planning, and an expanding variety of other endeavors. Modeling water management in the 23 river basins of the state reflects about 8,000 water right permits and 3,400 reservoirs. Datasets are necessarily large and complex to provide the decision-support capabilities for which the modeling system was developed. New modeling features are being added, and the different types of applications are growing. Certain applications are enhanced by simplifying the simulation input datasets to focus on particular water management systems. A methodology is presented for developing a condensed dataset for a selected reservoir system that reflects the impacts of all the water rights and accompanying reservoirs removed from the original complete dataset. A set of streamflows is developed that represents flows available to the selected system considering the effects of all the other water rights in the river basin contained in the original complete model input dataset that are not included in the condensed dataset. The methodology is applied to develop a condensed model of the Brazos River Authority reservoir system based on modifying the Texas Water Availability Modeling System dataset for the Brazos River Basin.<p>If you find the submission to be relevant for Journal of Public Knowledge, please forward the submission to the review stage by selecting \"Send to Review\" and then assign reviewers by clicking \"Add Reviewer\".</p><p>If the submission is not appropriate for this journal, please decline the submission.</p><p>Thank you in advance.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Journal of Public Knowledge</a>.</p>'),
(76,1048585,10,NULL,'2024-12-27 05:32:55',536870914,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"John Novak\" <jnovak@mailinator.com>','','','Thank you for your submission to Journal of Public Knowledge','<p>Dear John Novak,</p><p>Thank you for your submission to Journal of Public Knowledge. We have received your submission, Condensing Water Availability Models to Focus on Specific Water Management Systems, and a member of our editorial team will see it soon. You will be sent an email when an initial decision is made, and we may contact you for further information.</p><p>You can view your submission and track its progress through the editorial process at the following location:</p><p>Submission URL: http://localhost/index.php/publicknowledge/en/authorDashboard/submission/10</p><p>If you have been logged out, you can login again with the username jnovak.</p><p>If you have any questions, please contact me from your <a href=\"http://localhost/index.php/publicknowledge/en/authorDashboard/submission/10\">submission dashboard</a>.</p><p>Thank you for considering Journal of Public Knowledge as a venue for your work.</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Journal of Public Knowledge</a>.</p>'),
(77,1048585,10,3,'2024-12-27 05:33:01',805306369,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"John Novak\" <jnovak@mailinator.com>','','','Your submission has been sent for review','<p>Dear John Novak,</p><p>I am pleased to inform you that an editor has reviewed your submission, Condensing Water Availability Models to Focus on Specific Water Management Systems, and has decided to send it for peer review. An editor will identify qualified reviewers who will provide feedback on your submission.</p><p>This journal conducts double-anonymous peer review. The reviewers will not see any identifying information about you or your co-authors. Similarly, you will not know who reviewed your submission, and you will not hear from the reviewers directly. You will hear from us with feedback from the reviewers and information about the next steps.</p><p>Please note that sending the submission to peer review does not guarantee that it will be published. We will consider the reviewers\' recommendations before deciding to accept the submission for publication. You may be asked to make revisions and respond to the reviewers\' comments before a final decision is made.</p><p>If you have any questions, please contact me from your submission dashboard.</p><p><p>Daniel Barnes</p></p>'),
(78,1048585,10,3,'2024-12-27 05:33:06',1073741833,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Aisla McCrae\" <amccrae@mailinator.com>','','','Invitation to review','<p>Dear Aisla McCrae,</p>\r\n<p>I believe that you would serve as an excellent reviewer for a submission to Journal of Public Knowledge. The submission\'s title and abstract are below, and I hope that you will consider undertaking this important task for us.</p>\r\n<p>If you are able to review this submission, your review is due by 2025-01-24. You can view the submission, upload review files, and submit your review by logging into the journal site and following the steps at the link below.</p>\r\n<p><a href=\"http://localhost/index.php/publicknowledge/en/reviewer/submission?submissionId=10\">Condensing Water Availability Models to Focus on Specific Water Management Systems</a></p>\r\n<p><strong>Abstract</strong></p>\r\n<p>The Texas Water Availability Modeling System is routinely applied in administration of the water rights permit system, regional and statewide planning, and an expanding variety of other endeavors. Modeling water management in the 23 river basins of the state reflects about 8,000 water right permits and 3,400 reservoirs. Datasets are necessarily large and complex to provide the decision-support capabilities for which the modeling system was developed. New modeling features are being added, and the different types of applications are growing. Certain applications are enhanced by simplifying the simulation input datasets to focus on particular water management systems. A methodology is presented for developing a condensed dataset for a selected reservoir system that reflects the impacts of all the water rights and accompanying reservoirs removed from the original complete dataset. A set of streamflows is developed that represents flows available to the selected system considering the effects of all the other water rights in the river basin contained in the original complete model input dataset that are not included in the condensed dataset. The methodology is applied to develop a condensed model of the Brazos River Authority reservoir system based on modifying the Texas Water Availability Modeling System dataset for the Brazos River Basin.</p>\r\n<p>Please <a href=\"http://localhost/index.php/publicknowledge/en/reviewer/submission?submissionId=10\">accept or decline</a> the review by <strong>2025-01-24</strong>.</p>\r\n<p>You may contact me with any questions about the submission or the review process.</p>\r\n<p>Thank you for considering this request. Your help is much appreciated.</p>\r\n<p>Kind regards,</p>\r\n<p>Daniel Barnes</p>'),
(79,1048585,10,3,'2024-12-27 05:33:08',1073741833,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Adela Gallego\" <agallego@mailinator.com>','','','Invitation to review','<p>Dear Adela Gallego,</p>\r\n<p>I believe that you would serve as an excellent reviewer for a submission to Journal of Public Knowledge. The submission\'s title and abstract are below, and I hope that you will consider undertaking this important task for us.</p>\r\n<p>If you are able to review this submission, your review is due by 2025-01-24. You can view the submission, upload review files, and submit your review by logging into the journal site and following the steps at the link below.</p>\r\n<p><a href=\"http://localhost/index.php/publicknowledge/en/reviewer/submission?submissionId=10\">Condensing Water Availability Models to Focus on Specific Water Management Systems</a></p>\r\n<p><strong>Abstract</strong></p>\r\n<p>The Texas Water Availability Modeling System is routinely applied in administration of the water rights permit system, regional and statewide planning, and an expanding variety of other endeavors. Modeling water management in the 23 river basins of the state reflects about 8,000 water right permits and 3,400 reservoirs. Datasets are necessarily large and complex to provide the decision-support capabilities for which the modeling system was developed. New modeling features are being added, and the different types of applications are growing. Certain applications are enhanced by simplifying the simulation input datasets to focus on particular water management systems. A methodology is presented for developing a condensed dataset for a selected reservoir system that reflects the impacts of all the water rights and accompanying reservoirs removed from the original complete dataset. A set of streamflows is developed that represents flows available to the selected system considering the effects of all the other water rights in the river basin contained in the original complete model input dataset that are not included in the condensed dataset. The methodology is applied to develop a condensed model of the Brazos River Authority reservoir system based on modifying the Texas Water Availability Modeling System dataset for the Brazos River Basin.</p>\r\n<p>Please <a href=\"http://localhost/index.php/publicknowledge/en/reviewer/submission?submissionId=10\">accept or decline</a> the review by <strong>2025-01-24</strong>.</p>\r\n<p>You may contact me with any questions about the submission or the review process.</p>\r\n<p>Thank you for considering this request. Your help is much appreciated.</p>\r\n<p>Kind regards,</p>\r\n<p>Daniel Barnes</p>'),
(80,1048585,10,9,'2024-12-27 05:33:13',1073741829,'\"Aisla McCrae\" <amccrae@mailinator.com>','\"Daniel Barnes\" <dbarnes@mailinator.com>, \"David Buskins\" <dbuskins@mailinator.com>, \"Stephanie Berardo\" <sberardo@mailinator.com>','','','Review accepted: Aisla McCrae accepted review assignment for #10 Novak — Condensing Water Availability Models to Focus on Specific Water Management Systems','<p>Dear Daniel Barnes, David Buskins, Stephanie Berardo,</p><p>Aisla McCrae has accepted the following review:</p><p><a href=\"http://localhost/index.php/publicknowledge/en/workflow/access/10\">#10 Novak — Condensing Water Availability Models to Focus on Specific Water Management Systems</a><br /><b>Type:</b> Anonymous Reviewer/Anonymous Author</p><p><b>Review Due:</b> 2025-01-24</p><p>Login to <a href=\"http://localhost/index.php/publicknowledge/en/workflow/access/10\">view all reviewer assignments</a> for this submission.</p><br><br>—<br>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge/en\">Journal of Public Knowledge</a>.'),
(81,1048585,10,3,'2024-12-27 05:33:16',1073741836,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Daniel Barnes\" <dbarnes@mailinator.com>','','','Review complete: Aisla McCrae recommends Choose One for #10 Novak — Condensing Water Availability Models to Focus on Specific Water Management Systems','<p>Dear Daniel Barnes,</p><p>Aisla McCrae completed the following review:</p><p><a href=\"http://localhost/index.php/publicknowledge/en/workflow/access/10\">#10 Novak — Condensing Water Availability Models to Focus on Specific Water Management Systems</a><br /><b>Recommendation:</b> Choose One<br /><b>Type:</b> Anonymous Reviewer/Anonymous Author</p><p>Login to <a href=\"http://localhost/index.php/publicknowledge/en/workflow/access/10\">view all files and comments</a> provided by this reviewer.</p>'),
(82,1048585,10,4,'2024-12-27 05:33:16',1073741836,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"David Buskins\" <dbuskins@mailinator.com>','','','Review complete: Aisla McCrae recommends Choose One for #10 Novak — Condensing Water Availability Models to Focus on Specific Water Management Systems','<p>Dear David Buskins,</p><p>Aisla McCrae completed the following review:</p><p><a href=\"http://localhost/index.php/publicknowledge/en/workflow/access/10\">#10 Novak — Condensing Water Availability Models to Focus on Specific Water Management Systems</a><br /><b>Recommendation:</b> Choose One<br /><b>Type:</b> Anonymous Reviewer/Anonymous Author</p><p>Login to <a href=\"http://localhost/index.php/publicknowledge/en/workflow/access/10\">view all files and comments</a> provided by this reviewer.</p>'),
(83,1048585,10,5,'2024-12-27 05:33:16',1073741836,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Stephanie Berardo\" <sberardo@mailinator.com>','','','Review complete: Aisla McCrae recommends Choose One for #10 Novak — Condensing Water Availability Models to Focus on Specific Water Management Systems','<p>Dear Stephanie Berardo,</p><p>Aisla McCrae completed the following review:</p><p><a href=\"http://localhost/index.php/publicknowledge/en/workflow/access/10\">#10 Novak — Condensing Water Availability Models to Focus on Specific Water Management Systems</a><br /><b>Recommendation:</b> Choose One<br /><b>Type:</b> Anonymous Reviewer/Anonymous Author</p><p>Login to <a href=\"http://localhost/index.php/publicknowledge/en/workflow/access/10\">view all files and comments</a> provided by this reviewer.</p>'),
(84,1048585,10,10,'2024-12-27 05:33:21',1073741829,'\"Adela Gallego\" <agallego@mailinator.com>','\"Daniel Barnes\" <dbarnes@mailinator.com>, \"David Buskins\" <dbuskins@mailinator.com>, \"Stephanie Berardo\" <sberardo@mailinator.com>','','','Review accepted: Adela Gallego accepted review assignment for #10 Novak — Condensing Water Availability Models to Focus on Specific Water Management Systems','<p>Dear Daniel Barnes, David Buskins, Stephanie Berardo,</p><p>Adela Gallego has accepted the following review:</p><p><a href=\"http://localhost/index.php/publicknowledge/en/workflow/access/10\">#10 Novak — Condensing Water Availability Models to Focus on Specific Water Management Systems</a><br /><b>Type:</b> Anonymous Reviewer/Anonymous Author</p><p><b>Review Due:</b> 2025-01-24</p><p>Login to <a href=\"http://localhost/index.php/publicknowledge/en/workflow/access/10\">view all reviewer assignments</a> for this submission.</p><br><br>—<br>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge/en\">Journal of Public Knowledge</a>.'),
(85,1048585,10,3,'2024-12-27 05:33:24',1073741836,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Daniel Barnes\" <dbarnes@mailinator.com>','','','Review complete: Adela Gallego recommends Choose One for #10 Novak — Condensing Water Availability Models to Focus on Specific Water Management Systems','<p>Dear Daniel Barnes,</p><p>Adela Gallego completed the following review:</p><p><a href=\"http://localhost/index.php/publicknowledge/en/workflow/access/10\">#10 Novak — Condensing Water Availability Models to Focus on Specific Water Management Systems</a><br /><b>Recommendation:</b> Choose One<br /><b>Type:</b> Anonymous Reviewer/Anonymous Author</p><p>Login to <a href=\"http://localhost/index.php/publicknowledge/en/workflow/access/10\">view all files and comments</a> provided by this reviewer.</p>'),
(86,1048585,10,4,'2024-12-27 05:33:24',1073741836,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"David Buskins\" <dbuskins@mailinator.com>','','','Review complete: Adela Gallego recommends Choose One for #10 Novak — Condensing Water Availability Models to Focus on Specific Water Management Systems','<p>Dear David Buskins,</p><p>Adela Gallego completed the following review:</p><p><a href=\"http://localhost/index.php/publicknowledge/en/workflow/access/10\">#10 Novak — Condensing Water Availability Models to Focus on Specific Water Management Systems</a><br /><b>Recommendation:</b> Choose One<br /><b>Type:</b> Anonymous Reviewer/Anonymous Author</p><p>Login to <a href=\"http://localhost/index.php/publicknowledge/en/workflow/access/10\">view all files and comments</a> provided by this reviewer.</p>'),
(87,1048585,10,5,'2024-12-27 05:33:24',1073741836,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Stephanie Berardo\" <sberardo@mailinator.com>','','','Review complete: Adela Gallego recommends Choose One for #10 Novak — Condensing Water Availability Models to Focus on Specific Water Management Systems','<p>Dear Stephanie Berardo,</p><p>Adela Gallego completed the following review:</p><p><a href=\"http://localhost/index.php/publicknowledge/en/workflow/access/10\">#10 Novak — Condensing Water Availability Models to Focus on Specific Water Management Systems</a><br /><b>Recommendation:</b> Choose One<br /><b>Type:</b> Anonymous Reviewer/Anonymous Author</p><p>Login to <a href=\"http://localhost/index.php/publicknowledge/en/workflow/access/10\">view all files and comments</a> provided by this reviewer.</p>'),
(88,1048585,11,NULL,'2024-12-27 05:33:34',805306370,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Daniel Barnes\" <dbarnes@mailinator.com>','','','You have been assigned as an editor on a submission to Journal of Public Knowledge','<p>Dear Daniel Barnes,</p><p>The following submission has been assigned to you to see through the editorial process.</p><p><a href=\"http://localhost/index.php/publicknowledge/en/workflow/access/11\">Learning Sustainable Design through Service</a><br />Karim Al-Khafaji, Margaret Morse</p><p><b>Abstract</b></p>Environmental sustainability and sustainable development principles are vital topics that engineering education has largely failed to address. Service-learning, which integrates social service into an academic setting, is an emerging tool that can be leveraged to teach sustainable design to future engineers. We present a model of using service-learning to teach sustainable design based on the experiences of the Stanford chapter of Engineers for a Sustainable World. The model involves the identification of projects and partner organizations, a student led, project-based design course, and internships coordinated with partner organizations. The model has been very successful, although limitations and challenges exist. These are discussed along with future directions for expanding the model.<p>If you find the submission to be relevant for Journal of Public Knowledge, please forward the submission to the review stage by selecting \"Send to Review\" and then assign reviewers by clicking \"Add Reviewer\".</p><p>If the submission is not appropriate for this journal, please decline the submission.</p><p>Thank you in advance.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Journal of Public Knowledge</a>.</p>'),
(89,1048585,11,NULL,'2024-12-27 05:33:35',805306370,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"David Buskins\" <dbuskins@mailinator.com>','','','You have been assigned as an editor on a submission to Journal of Public Knowledge','<p>Dear David Buskins,</p><p>The following submission has been assigned to you to see through the editorial process.</p><p><a href=\"http://localhost/index.php/publicknowledge/en/workflow/access/11\">Learning Sustainable Design through Service</a><br />Karim Al-Khafaji, Margaret Morse</p><p><b>Abstract</b></p>Environmental sustainability and sustainable development principles are vital topics that engineering education has largely failed to address. Service-learning, which integrates social service into an academic setting, is an emerging tool that can be leveraged to teach sustainable design to future engineers. We present a model of using service-learning to teach sustainable design based on the experiences of the Stanford chapter of Engineers for a Sustainable World. The model involves the identification of projects and partner organizations, a student led, project-based design course, and internships coordinated with partner organizations. The model has been very successful, although limitations and challenges exist. These are discussed along with future directions for expanding the model.<p>If you find the submission to be relevant for Journal of Public Knowledge, please forward the submission to the review stage by selecting \"Send to Review\" and then assign reviewers by clicking \"Add Reviewer\".</p><p>If the submission is not appropriate for this journal, please decline the submission.</p><p>Thank you in advance.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Journal of Public Knowledge</a>.</p>'),
(90,1048585,11,NULL,'2024-12-27 05:33:35',805306370,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Stephanie Berardo\" <sberardo@mailinator.com>','','','You have been assigned as an editor on a submission to Journal of Public Knowledge','<p>Dear Stephanie Berardo,</p><p>The following submission has been assigned to you to see through the editorial process.</p><p><a href=\"http://localhost/index.php/publicknowledge/en/workflow/access/11\">Learning Sustainable Design through Service</a><br />Karim Al-Khafaji, Margaret Morse</p><p><b>Abstract</b></p>Environmental sustainability and sustainable development principles are vital topics that engineering education has largely failed to address. Service-learning, which integrates social service into an academic setting, is an emerging tool that can be leveraged to teach sustainable design to future engineers. We present a model of using service-learning to teach sustainable design based on the experiences of the Stanford chapter of Engineers for a Sustainable World. The model involves the identification of projects and partner organizations, a student led, project-based design course, and internships coordinated with partner organizations. The model has been very successful, although limitations and challenges exist. These are discussed along with future directions for expanding the model.<p>If you find the submission to be relevant for Journal of Public Knowledge, please forward the submission to the review stage by selecting \"Send to Review\" and then assign reviewers by clicking \"Add Reviewer\".</p><p>If the submission is not appropriate for this journal, please decline the submission.</p><p>Thank you in advance.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Journal of Public Knowledge</a>.</p>'),
(91,1048585,11,NULL,'2024-12-27 05:33:35',536870914,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Karim Al-Khafaji\" <kalkhafaji@mailinator.com>','','','Thank you for your submission to Journal of Public Knowledge','<p>Dear Karim Al-Khafaji,</p><p>Thank you for your submission to Journal of Public Knowledge. We have received your submission, Learning Sustainable Design through Service, and a member of our editorial team will see it soon. You will be sent an email when an initial decision is made, and we may contact you for further information.</p><p>You can view your submission and track its progress through the editorial process at the following location:</p><p>Submission URL: http://localhost/index.php/publicknowledge/en/authorDashboard/submission/11</p><p>If you have been logged out, you can login again with the username kalkhafaji.</p><p>If you have any questions, please contact me from your <a href=\"http://localhost/index.php/publicknowledge/en/authorDashboard/submission/11\">submission dashboard</a>.</p><p>Thank you for considering Journal of Public Knowledge as a venue for your work.</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Journal of Public Knowledge</a>.</p>'),
(92,1048585,11,NULL,'2024-12-27 05:33:35',536870914,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Margaret Morse\" <mmorse@mailinator.com>','','','Submission confirmation','<p>Dear Margaret Morse,</p><p>You have been named as a co-author on a submission to Journal of Public Knowledge. The submitter, Karim Al-Khafaji, provided the following details:</p><p>Learning Sustainable Design through Service<br></p><p>If any of these details are incorrect, or you do not wish to be named on this submission, please contact me.</p><p>Thank you for considering Journal of Public Knowledge as a venue for your work.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Journal of Public Knowledge</a>.</p>'),
(93,1048585,12,NULL,'2024-12-27 05:33:44',805306370,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Daniel Barnes\" <dbarnes@mailinator.com>','','','You have been assigned as an editor on a submission to Journal of Public Knowledge','<p>Dear Daniel Barnes,</p><p>The following submission has been assigned to you to see through the editorial process.</p><p><a href=\"http://localhost/index.php/publicknowledge/en/workflow/access/12\">Sodium butyrate improves growth performance of weaned piglets during the first period after weaning</a><br />Leo Christopher</p><p><b>Abstract</b></p>The aim of this study was to assess the influence of long-term fat supplementation on the fatty acid profile of heavy pig adipose tissue. Fifty-four Large White barrows, averaging 25 kg LW, were randomized (matched weights) to one of three isoenergetic diets supplemented with either tallow (TA), maize oil (MO), or rapeseed oil (RO). The fats were supplement- ed at 3% as fed from 25 to 110 kg LW, and at 2.5 % from 110 kg to slaughtering. Following slaughter at about 160 kg LW, backfat samples were collected from ten animals per treatment and analyzed. Fatty acid composition of backfat close- ly reflected the fatty acid composition of the supplemented fats. The backfat of pigs fed TA had the highest saturated fatty acid content (SFA) (P&lt;0.01); those fed MO had the highest content in polyunsaturated fatty acid (PUFA) and the lowest in monounsaturated fatty acid (MUFA) content; those fed RO had the highest content of linolenic acid (C18:3) and cis 11- ecosenoic acid (C20:1). Only MO treatment had an effect on linoleic acid levels and the iodine value (IV) of backfat, result- ing in levels higher than those (IV = 70; C18:2 = 15%) accepted by the Parma Consortium for dry-cured ham. The IV and unsaturation index in both layers of subcutaneous backfat tissue differed significantly between treatments. These results show that long-term dietary supplementation with different fats changes the fatty acid profile of heavy pig adipose tissue. Supplementation with rapeseed oil increases the proportion of “healthy” fatty acids in pig fat, thereby improving the nutritional quality, however the effects on the technological quality of the fat must be carefully assessed.<p>If you find the submission to be relevant for Journal of Public Knowledge, please forward the submission to the review stage by selecting \"Send to Review\" and then assign reviewers by clicking \"Add Reviewer\".</p><p>If the submission is not appropriate for this journal, please decline the submission.</p><p>Thank you in advance.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Journal of Public Knowledge</a>.</p>'),
(94,1048585,12,NULL,'2024-12-27 05:33:44',805306370,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"David Buskins\" <dbuskins@mailinator.com>','','','You have been assigned as an editor on a submission to Journal of Public Knowledge','<p>Dear David Buskins,</p><p>The following submission has been assigned to you to see through the editorial process.</p><p><a href=\"http://localhost/index.php/publicknowledge/en/workflow/access/12\">Sodium butyrate improves growth performance of weaned piglets during the first period after weaning</a><br />Leo Christopher</p><p><b>Abstract</b></p>The aim of this study was to assess the influence of long-term fat supplementation on the fatty acid profile of heavy pig adipose tissue. Fifty-four Large White barrows, averaging 25 kg LW, were randomized (matched weights) to one of three isoenergetic diets supplemented with either tallow (TA), maize oil (MO), or rapeseed oil (RO). The fats were supplement- ed at 3% as fed from 25 to 110 kg LW, and at 2.5 % from 110 kg to slaughtering. Following slaughter at about 160 kg LW, backfat samples were collected from ten animals per treatment and analyzed. Fatty acid composition of backfat close- ly reflected the fatty acid composition of the supplemented fats. The backfat of pigs fed TA had the highest saturated fatty acid content (SFA) (P&lt;0.01); those fed MO had the highest content in polyunsaturated fatty acid (PUFA) and the lowest in monounsaturated fatty acid (MUFA) content; those fed RO had the highest content of linolenic acid (C18:3) and cis 11- ecosenoic acid (C20:1). Only MO treatment had an effect on linoleic acid levels and the iodine value (IV) of backfat, result- ing in levels higher than those (IV = 70; C18:2 = 15%) accepted by the Parma Consortium for dry-cured ham. The IV and unsaturation index in both layers of subcutaneous backfat tissue differed significantly between treatments. These results show that long-term dietary supplementation with different fats changes the fatty acid profile of heavy pig adipose tissue. Supplementation with rapeseed oil increases the proportion of “healthy” fatty acids in pig fat, thereby improving the nutritional quality, however the effects on the technological quality of the fat must be carefully assessed.<p>If you find the submission to be relevant for Journal of Public Knowledge, please forward the submission to the review stage by selecting \"Send to Review\" and then assign reviewers by clicking \"Add Reviewer\".</p><p>If the submission is not appropriate for this journal, please decline the submission.</p><p>Thank you in advance.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Journal of Public Knowledge</a>.</p>'),
(95,1048585,12,NULL,'2024-12-27 05:33:44',805306370,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Stephanie Berardo\" <sberardo@mailinator.com>','','','You have been assigned as an editor on a submission to Journal of Public Knowledge','<p>Dear Stephanie Berardo,</p><p>The following submission has been assigned to you to see through the editorial process.</p><p><a href=\"http://localhost/index.php/publicknowledge/en/workflow/access/12\">Sodium butyrate improves growth performance of weaned piglets during the first period after weaning</a><br />Leo Christopher</p><p><b>Abstract</b></p>The aim of this study was to assess the influence of long-term fat supplementation on the fatty acid profile of heavy pig adipose tissue. Fifty-four Large White barrows, averaging 25 kg LW, were randomized (matched weights) to one of three isoenergetic diets supplemented with either tallow (TA), maize oil (MO), or rapeseed oil (RO). The fats were supplement- ed at 3% as fed from 25 to 110 kg LW, and at 2.5 % from 110 kg to slaughtering. Following slaughter at about 160 kg LW, backfat samples were collected from ten animals per treatment and analyzed. Fatty acid composition of backfat close- ly reflected the fatty acid composition of the supplemented fats. The backfat of pigs fed TA had the highest saturated fatty acid content (SFA) (P&lt;0.01); those fed MO had the highest content in polyunsaturated fatty acid (PUFA) and the lowest in monounsaturated fatty acid (MUFA) content; those fed RO had the highest content of linolenic acid (C18:3) and cis 11- ecosenoic acid (C20:1). Only MO treatment had an effect on linoleic acid levels and the iodine value (IV) of backfat, result- ing in levels higher than those (IV = 70; C18:2 = 15%) accepted by the Parma Consortium for dry-cured ham. The IV and unsaturation index in both layers of subcutaneous backfat tissue differed significantly between treatments. These results show that long-term dietary supplementation with different fats changes the fatty acid profile of heavy pig adipose tissue. Supplementation with rapeseed oil increases the proportion of “healthy” fatty acids in pig fat, thereby improving the nutritional quality, however the effects on the technological quality of the fat must be carefully assessed.<p>If you find the submission to be relevant for Journal of Public Knowledge, please forward the submission to the review stage by selecting \"Send to Review\" and then assign reviewers by clicking \"Add Reviewer\".</p><p>If the submission is not appropriate for this journal, please decline the submission.</p><p>Thank you in advance.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Journal of Public Knowledge</a>.</p>'),
(96,1048585,12,NULL,'2024-12-27 05:33:44',536870914,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Leo Christopher\" <lchristopher@mailinator.com>','','','Thank you for your submission to Journal of Public Knowledge','<p>Dear Leo Christopher,</p><p>Thank you for your submission to Journal of Public Knowledge. We have received your submission, Sodium butyrate improves growth performance of weaned piglets during the first period after weaning, and a member of our editorial team will see it soon. You will be sent an email when an initial decision is made, and we may contact you for further information.</p><p>You can view your submission and track its progress through the editorial process at the following location:</p><p>Submission URL: http://localhost/index.php/publicknowledge/en/authorDashboard/submission/12</p><p>If you have been logged out, you can login again with the username lchristopher.</p><p>If you have any questions, please contact me from your <a href=\"http://localhost/index.php/publicknowledge/en/authorDashboard/submission/12\">submission dashboard</a>.</p><p>Thank you for considering Journal of Public Knowledge as a venue for your work.</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Journal of Public Knowledge</a>.</p>'),
(97,1048585,12,3,'2024-12-27 05:33:51',805306369,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Leo Christopher\" <lchristopher@mailinator.com>','','','Your submission has been sent for review','<p>Dear Leo Christopher,</p><p>I am pleased to inform you that an editor has reviewed your submission, Sodium butyrate improves growth performance of weaned piglets during the first period after weaning, and has decided to send it for peer review. An editor will identify qualified reviewers who will provide feedback on your submission.</p><p>This journal conducts double-anonymous peer review. The reviewers will not see any identifying information about you or your co-authors. Similarly, you will not know who reviewed your submission, and you will not hear from the reviewers directly. You will hear from us with feedback from the reviewers and information about the next steps.</p><p>Please note that sending the submission to peer review does not guarantee that it will be published. We will consider the reviewers\' recommendations before deciding to accept the submission for publication. You may be asked to make revisions and respond to the reviewers\' comments before a final decision is made.</p><p>If you have any questions, please contact me from your submission dashboard.</p><p><p>Daniel Barnes</p></p>'),
(98,1048585,12,3,'2024-12-27 05:33:56',1073741833,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Julie Janssen\" <jjanssen@mailinator.com>','','','Invitation to review','<p>Dear Julie Janssen,</p>\r\n<p>I believe that you would serve as an excellent reviewer for a submission to Journal of Public Knowledge. The submission\'s title and abstract are below, and I hope that you will consider undertaking this important task for us.</p>\r\n<p>If you are able to review this submission, your review is due by 2025-01-24. You can view the submission, upload review files, and submit your review by logging into the journal site and following the steps at the link below.</p>\r\n<p><a href=\"http://localhost/index.php/publicknowledge/en/reviewer/submission?submissionId=12\">Sodium butyrate improves growth performance of weaned piglets during the first period after weaning</a></p>\r\n<p><strong>Abstract</strong></p>\r\n<p>The aim of this study was to assess the influence of long-term fat supplementation on the fatty acid profile of heavy pig adipose tissue. Fifty-four Large White barrows, averaging 25 kg LW, were randomized (matched weights) to one of three isoenergetic diets supplemented with either tallow (TA), maize oil (MO), or rapeseed oil (RO). The fats were supplement- ed at 3% as fed from 25 to 110 kg LW, and at 2.5 % from 110 kg to slaughtering. Following slaughter at about 160 kg LW, backfat samples were collected from ten animals per treatment and analyzed. Fatty acid composition of backfat close- ly reflected the fatty acid composition of the supplemented fats. The backfat of pigs fed TA had the highest saturated fatty acid content (SFA) (P&lt;0.01); those fed MO had the highest content in polyunsaturated fatty acid (PUFA) and the lowest in monounsaturated fatty acid (MUFA) content; those fed RO had the highest content of linolenic acid (C18:3) and cis 11- ecosenoic acid (C20:1). Only MO treatment had an effect on linoleic acid levels and the iodine value (IV) of backfat, result- ing in levels higher than those (IV = 70; C18:2 = 15%) accepted by the Parma Consortium for dry-cured ham. The IV and unsaturation index in both layers of subcutaneous backfat tissue differed significantly between treatments. These results show that long-term dietary supplementation with different fats changes the fatty acid profile of heavy pig adipose tissue. Supplementation with rapeseed oil increases the proportion of “healthy” fatty acids in pig fat, thereby improving the nutritional quality, however the effects on the technological quality of the fat must be carefully assessed.</p>\r\n<p>Please <a href=\"http://localhost/index.php/publicknowledge/en/reviewer/submission?submissionId=12\">accept or decline</a> the review by <strong>2025-01-24</strong>.</p>\r\n<p>You may contact me with any questions about the submission or the review process.</p>\r\n<p>Thank you for considering this request. Your help is much appreciated.</p>\r\n<p>Kind regards,</p>\r\n<p>Daniel Barnes</p>'),
(99,1048585,12,3,'2024-12-27 05:33:58',1073741833,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Paul Hudson\" <phudson@mailinator.com>','','','Invitation to review','<p>Dear Paul Hudson,</p>\r\n<p>I believe that you would serve as an excellent reviewer for a submission to Journal of Public Knowledge. The submission\'s title and abstract are below, and I hope that you will consider undertaking this important task for us.</p>\r\n<p>If you are able to review this submission, your review is due by 2025-01-24. You can view the submission, upload review files, and submit your review by logging into the journal site and following the steps at the link below.</p>\r\n<p><a href=\"http://localhost/index.php/publicknowledge/en/reviewer/submission?submissionId=12\">Sodium butyrate improves growth performance of weaned piglets during the first period after weaning</a></p>\r\n<p><strong>Abstract</strong></p>\r\n<p>The aim of this study was to assess the influence of long-term fat supplementation on the fatty acid profile of heavy pig adipose tissue. Fifty-four Large White barrows, averaging 25 kg LW, were randomized (matched weights) to one of three isoenergetic diets supplemented with either tallow (TA), maize oil (MO), or rapeseed oil (RO). The fats were supplement- ed at 3% as fed from 25 to 110 kg LW, and at 2.5 % from 110 kg to slaughtering. Following slaughter at about 160 kg LW, backfat samples were collected from ten animals per treatment and analyzed. Fatty acid composition of backfat close- ly reflected the fatty acid composition of the supplemented fats. The backfat of pigs fed TA had the highest saturated fatty acid content (SFA) (P&lt;0.01); those fed MO had the highest content in polyunsaturated fatty acid (PUFA) and the lowest in monounsaturated fatty acid (MUFA) content; those fed RO had the highest content of linolenic acid (C18:3) and cis 11- ecosenoic acid (C20:1). Only MO treatment had an effect on linoleic acid levels and the iodine value (IV) of backfat, result- ing in levels higher than those (IV = 70; C18:2 = 15%) accepted by the Parma Consortium for dry-cured ham. The IV and unsaturation index in both layers of subcutaneous backfat tissue differed significantly between treatments. These results show that long-term dietary supplementation with different fats changes the fatty acid profile of heavy pig adipose tissue. Supplementation with rapeseed oil increases the proportion of “healthy” fatty acids in pig fat, thereby improving the nutritional quality, however the effects on the technological quality of the fat must be carefully assessed.</p>\r\n<p>Please <a href=\"http://localhost/index.php/publicknowledge/en/reviewer/submission?submissionId=12\">accept or decline</a> the review by <strong>2025-01-24</strong>.</p>\r\n<p>You may contact me with any questions about the submission or the review process.</p>\r\n<p>Thank you for considering this request. Your help is much appreciated.</p>\r\n<p>Kind regards,</p>\r\n<p>Daniel Barnes</p>'),
(100,1048585,13,NULL,'2024-12-27 05:34:08',805306370,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Daniel Barnes\" <dbarnes@mailinator.com>','','','You have been assigned as an editor on a submission to Journal of Public Knowledge','<p>Dear Daniel Barnes,</p><p>The following submission has been assigned to you to see through the editorial process.</p><p><a href=\"http://localhost/index.php/publicknowledge/en/workflow/access/13\">Hydrologic Connectivity in the Edwards Aquifer between San Marcos Springs and Barton Springs during 2009 Drought Conditions</a><br />Lise Kumiega</p><p><b>Abstract</b></p>The Edwards Aquifer serves as the primary water supply in South-Central Texas and is the source for several major springs. In developing a plan to protect endangered species immediately downstream of San Marcos Springs, questions have been raised regarding the established concept of a hydrologic divide between the San Antonio and Barton Springs segments of the Edwards Aquifer during drought conditions. To address these questions, a water-level data collection program and a hydrogeologic study was conducted. An analysis of groundwater-level data indicate that a groundwater divide exists in the vicinity of the surface drainage divide between Onion Creek and Blanco River during wet and normal hydrologic conditions. However, analysis of data collected during the 2009 drought suggests that the groundwater divide dissipated and no longer hydrologically separated the two segments. As a result, there is potential for groundwater to flow past San Marcos Springs toward Barton Springs during major droughts. The implications for this have bearings on the management and availability of groundwater in the Edwards Aquifer. Assessments of simulations from a numerical model suggest 5 cfs could be flowing past San Marcos toward Barton springs under drought conditions. The groundwater divide appears to be influenced by recharge along Onion Creek and Blanco River and appears to be vulnerable to extended periods of little or no recharge and extensive pumping in the vicinity of Kyle and Buda. The 2009 data set shows a very low gradient in the potentiometric surface between San Marcos Springs and Kyle with very little variation in levels between drought and non-drought periods. From Kyle toward Barton Springs, the potentiometric surface slopes significantly to the north and has dramatic changes in levels between drought and non-drought periods. The source and nature of the discontinuity of the change in potentiometric gradients and dynamic water level response at Kyle is unknown. Structural influences or hydraulic properties inherent in the aquifer could be the cause of this discontinuity and may also influence the degree of hydrologic connection between San Marcos and Barton Springs. Rapid population growth and increased water demands in the Kyle and Buda areas necessitates a continual groundwater level monitoring program between San Marcos Springs and Buda to provide data for future hydrogeologic and trend analyses.<p>If you find the submission to be relevant for Journal of Public Knowledge, please forward the submission to the review stage by selecting \"Send to Review\" and then assign reviewers by clicking \"Add Reviewer\".</p><p>If the submission is not appropriate for this journal, please decline the submission.</p><p>Thank you in advance.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Journal of Public Knowledge</a>.</p>'),
(101,1048585,13,NULL,'2024-12-27 05:34:08',805306370,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"David Buskins\" <dbuskins@mailinator.com>','','','You have been assigned as an editor on a submission to Journal of Public Knowledge','<p>Dear David Buskins,</p><p>The following submission has been assigned to you to see through the editorial process.</p><p><a href=\"http://localhost/index.php/publicknowledge/en/workflow/access/13\">Hydrologic Connectivity in the Edwards Aquifer between San Marcos Springs and Barton Springs during 2009 Drought Conditions</a><br />Lise Kumiega</p><p><b>Abstract</b></p>The Edwards Aquifer serves as the primary water supply in South-Central Texas and is the source for several major springs. In developing a plan to protect endangered species immediately downstream of San Marcos Springs, questions have been raised regarding the established concept of a hydrologic divide between the San Antonio and Barton Springs segments of the Edwards Aquifer during drought conditions. To address these questions, a water-level data collection program and a hydrogeologic study was conducted. An analysis of groundwater-level data indicate that a groundwater divide exists in the vicinity of the surface drainage divide between Onion Creek and Blanco River during wet and normal hydrologic conditions. However, analysis of data collected during the 2009 drought suggests that the groundwater divide dissipated and no longer hydrologically separated the two segments. As a result, there is potential for groundwater to flow past San Marcos Springs toward Barton Springs during major droughts. The implications for this have bearings on the management and availability of groundwater in the Edwards Aquifer. Assessments of simulations from a numerical model suggest 5 cfs could be flowing past San Marcos toward Barton springs under drought conditions. The groundwater divide appears to be influenced by recharge along Onion Creek and Blanco River and appears to be vulnerable to extended periods of little or no recharge and extensive pumping in the vicinity of Kyle and Buda. The 2009 data set shows a very low gradient in the potentiometric surface between San Marcos Springs and Kyle with very little variation in levels between drought and non-drought periods. From Kyle toward Barton Springs, the potentiometric surface slopes significantly to the north and has dramatic changes in levels between drought and non-drought periods. The source and nature of the discontinuity of the change in potentiometric gradients and dynamic water level response at Kyle is unknown. Structural influences or hydraulic properties inherent in the aquifer could be the cause of this discontinuity and may also influence the degree of hydrologic connection between San Marcos and Barton Springs. Rapid population growth and increased water demands in the Kyle and Buda areas necessitates a continual groundwater level monitoring program between San Marcos Springs and Buda to provide data for future hydrogeologic and trend analyses.<p>If you find the submission to be relevant for Journal of Public Knowledge, please forward the submission to the review stage by selecting \"Send to Review\" and then assign reviewers by clicking \"Add Reviewer\".</p><p>If the submission is not appropriate for this journal, please decline the submission.</p><p>Thank you in advance.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Journal of Public Knowledge</a>.</p>'),
(102,1048585,13,NULL,'2024-12-27 05:34:08',805306370,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Stephanie Berardo\" <sberardo@mailinator.com>','','','You have been assigned as an editor on a submission to Journal of Public Knowledge','<p>Dear Stephanie Berardo,</p><p>The following submission has been assigned to you to see through the editorial process.</p><p><a href=\"http://localhost/index.php/publicknowledge/en/workflow/access/13\">Hydrologic Connectivity in the Edwards Aquifer between San Marcos Springs and Barton Springs during 2009 Drought Conditions</a><br />Lise Kumiega</p><p><b>Abstract</b></p>The Edwards Aquifer serves as the primary water supply in South-Central Texas and is the source for several major springs. In developing a plan to protect endangered species immediately downstream of San Marcos Springs, questions have been raised regarding the established concept of a hydrologic divide between the San Antonio and Barton Springs segments of the Edwards Aquifer during drought conditions. To address these questions, a water-level data collection program and a hydrogeologic study was conducted. An analysis of groundwater-level data indicate that a groundwater divide exists in the vicinity of the surface drainage divide between Onion Creek and Blanco River during wet and normal hydrologic conditions. However, analysis of data collected during the 2009 drought suggests that the groundwater divide dissipated and no longer hydrologically separated the two segments. As a result, there is potential for groundwater to flow past San Marcos Springs toward Barton Springs during major droughts. The implications for this have bearings on the management and availability of groundwater in the Edwards Aquifer. Assessments of simulations from a numerical model suggest 5 cfs could be flowing past San Marcos toward Barton springs under drought conditions. The groundwater divide appears to be influenced by recharge along Onion Creek and Blanco River and appears to be vulnerable to extended periods of little or no recharge and extensive pumping in the vicinity of Kyle and Buda. The 2009 data set shows a very low gradient in the potentiometric surface between San Marcos Springs and Kyle with very little variation in levels between drought and non-drought periods. From Kyle toward Barton Springs, the potentiometric surface slopes significantly to the north and has dramatic changes in levels between drought and non-drought periods. The source and nature of the discontinuity of the change in potentiometric gradients and dynamic water level response at Kyle is unknown. Structural influences or hydraulic properties inherent in the aquifer could be the cause of this discontinuity and may also influence the degree of hydrologic connection between San Marcos and Barton Springs. Rapid population growth and increased water demands in the Kyle and Buda areas necessitates a continual groundwater level monitoring program between San Marcos Springs and Buda to provide data for future hydrogeologic and trend analyses.<p>If you find the submission to be relevant for Journal of Public Knowledge, please forward the submission to the review stage by selecting \"Send to Review\" and then assign reviewers by clicking \"Add Reviewer\".</p><p>If the submission is not appropriate for this journal, please decline the submission.</p><p>Thank you in advance.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Journal of Public Knowledge</a>.</p>'),
(103,1048585,13,NULL,'2024-12-27 05:34:09',536870914,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Lise Kumiega\" <lkumiega@mailinator.com>','','','Thank you for your submission to Journal of Public Knowledge','<p>Dear Lise Kumiega,</p><p>Thank you for your submission to Journal of Public Knowledge. We have received your submission, Hydrologic Connectivity in the Edwards Aquifer between San Marcos Springs and Barton Springs during 2009 Drought Conditions, and a member of our editorial team will see it soon. You will be sent an email when an initial decision is made, and we may contact you for further information.</p><p>You can view your submission and track its progress through the editorial process at the following location:</p><p>Submission URL: http://localhost/index.php/publicknowledge/en/authorDashboard/submission/13</p><p>If you have been logged out, you can login again with the username lkumiega.</p><p>If you have any questions, please contact me from your <a href=\"http://localhost/index.php/publicknowledge/en/authorDashboard/submission/13\">submission dashboard</a>.</p><p>Thank you for considering Journal of Public Knowledge as a venue for your work.</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Journal of Public Knowledge</a>.</p>'),
(104,1048585,13,3,'2024-12-27 05:34:16',805306369,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Lise Kumiega\" <lkumiega@mailinator.com>','','','Your submission has been sent for review','<p>Dear Lise Kumiega,</p><p>I am pleased to inform you that an editor has reviewed your submission, Hydrologic Connectivity in the Edwards Aquifer between San Marcos Springs and Barton Springs during 2009 Drought Conditions, and has decided to send it for peer review. An editor will identify qualified reviewers who will provide feedback on your submission.</p><p>This journal conducts double-anonymous peer review. The reviewers will not see any identifying information about you or your co-authors. Similarly, you will not know who reviewed your submission, and you will not hear from the reviewers directly. You will hear from us with feedback from the reviewers and information about the next steps.</p><p>Please note that sending the submission to peer review does not guarantee that it will be published. We will consider the reviewers\' recommendations before deciding to accept the submission for publication. You may be asked to make revisions and respond to the reviewers\' comments before a final decision is made.</p><p>If you have any questions, please contact me from your submission dashboard.</p><p><p>Daniel Barnes</p></p>'),
(105,1048585,13,3,'2024-12-27 05:34:21',1073741833,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Julie Janssen\" <jjanssen@mailinator.com>','','','Invitation to review','<p>Dear Julie Janssen,</p>\r\n<p>I believe that you would serve as an excellent reviewer for a submission to Journal of Public Knowledge. The submission\'s title and abstract are below, and I hope that you will consider undertaking this important task for us.</p>\r\n<p>If you are able to review this submission, your review is due by 2025-01-24. You can view the submission, upload review files, and submit your review by logging into the journal site and following the steps at the link below.</p>\r\n<p><a href=\"http://localhost/index.php/publicknowledge/en/reviewer/submission?submissionId=13\">Hydrologic Connectivity in the Edwards Aquifer between San Marcos Springs and Barton Springs during 2009 Drought Conditions</a></p>\r\n<p><strong>Abstract</strong></p>\r\n<p>The Edwards Aquifer serves as the primary water supply in South-Central Texas and is the source for several major springs. In developing a plan to protect endangered species immediately downstream of San Marcos Springs, questions have been raised regarding the established concept of a hydrologic divide between the San Antonio and Barton Springs segments of the Edwards Aquifer during drought conditions. To address these questions, a water-level data collection program and a hydrogeologic study was conducted. An analysis of groundwater-level data indicate that a groundwater divide exists in the vicinity of the surface drainage divide between Onion Creek and Blanco River during wet and normal hydrologic conditions. However, analysis of data collected during the 2009 drought suggests that the groundwater divide dissipated and no longer hydrologically separated the two segments. As a result, there is potential for groundwater to flow past San Marcos Springs toward Barton Springs during major droughts. The implications for this have bearings on the management and availability of groundwater in the Edwards Aquifer. Assessments of simulations from a numerical model suggest 5 cfs could be flowing past San Marcos toward Barton springs under drought conditions. The groundwater divide appears to be influenced by recharge along Onion Creek and Blanco River and appears to be vulnerable to extended periods of little or no recharge and extensive pumping in the vicinity of Kyle and Buda. The 2009 data set shows a very low gradient in the potentiometric surface between San Marcos Springs and Kyle with very little variation in levels between drought and non-drought periods. From Kyle toward Barton Springs, the potentiometric surface slopes significantly to the north and has dramatic changes in levels between drought and non-drought periods. The source and nature of the discontinuity of the change in potentiometric gradients and dynamic water level response at Kyle is unknown. Structural influences or hydraulic properties inherent in the aquifer could be the cause of this discontinuity and may also influence the degree of hydrologic connection between San Marcos and Barton Springs. Rapid population growth and increased water demands in the Kyle and Buda areas necessitates a continual groundwater level monitoring program between San Marcos Springs and Buda to provide data for future hydrogeologic and trend analyses.</p>\r\n<p>Please <a href=\"http://localhost/index.php/publicknowledge/en/reviewer/submission?submissionId=13\">accept or decline</a> the review by <strong>2025-01-24</strong>.</p>\r\n<p>You may contact me with any questions about the submission or the review process.</p>\r\n<p>Thank you for considering this request. Your help is much appreciated.</p>\r\n<p>Kind regards,</p>\r\n<p>Daniel Barnes</p>'),
(106,1048585,13,3,'2024-12-27 05:34:23',1073741833,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Aisla McCrae\" <amccrae@mailinator.com>','','','Invitation to review','<p>Dear Aisla McCrae,</p>\r\n<p>I believe that you would serve as an excellent reviewer for a submission to Journal of Public Knowledge. The submission\'s title and abstract are below, and I hope that you will consider undertaking this important task for us.</p>\r\n<p>If you are able to review this submission, your review is due by 2025-01-24. You can view the submission, upload review files, and submit your review by logging into the journal site and following the steps at the link below.</p>\r\n<p><a href=\"http://localhost/index.php/publicknowledge/en/reviewer/submission?submissionId=13\">Hydrologic Connectivity in the Edwards Aquifer between San Marcos Springs and Barton Springs during 2009 Drought Conditions</a></p>\r\n<p><strong>Abstract</strong></p>\r\n<p>The Edwards Aquifer serves as the primary water supply in South-Central Texas and is the source for several major springs. In developing a plan to protect endangered species immediately downstream of San Marcos Springs, questions have been raised regarding the established concept of a hydrologic divide between the San Antonio and Barton Springs segments of the Edwards Aquifer during drought conditions. To address these questions, a water-level data collection program and a hydrogeologic study was conducted. An analysis of groundwater-level data indicate that a groundwater divide exists in the vicinity of the surface drainage divide between Onion Creek and Blanco River during wet and normal hydrologic conditions. However, analysis of data collected during the 2009 drought suggests that the groundwater divide dissipated and no longer hydrologically separated the two segments. As a result, there is potential for groundwater to flow past San Marcos Springs toward Barton Springs during major droughts. The implications for this have bearings on the management and availability of groundwater in the Edwards Aquifer. Assessments of simulations from a numerical model suggest 5 cfs could be flowing past San Marcos toward Barton springs under drought conditions. The groundwater divide appears to be influenced by recharge along Onion Creek and Blanco River and appears to be vulnerable to extended periods of little or no recharge and extensive pumping in the vicinity of Kyle and Buda. The 2009 data set shows a very low gradient in the potentiometric surface between San Marcos Springs and Kyle with very little variation in levels between drought and non-drought periods. From Kyle toward Barton Springs, the potentiometric surface slopes significantly to the north and has dramatic changes in levels between drought and non-drought periods. The source and nature of the discontinuity of the change in potentiometric gradients and dynamic water level response at Kyle is unknown. Structural influences or hydraulic properties inherent in the aquifer could be the cause of this discontinuity and may also influence the degree of hydrologic connection between San Marcos and Barton Springs. Rapid population growth and increased water demands in the Kyle and Buda areas necessitates a continual groundwater level monitoring program between San Marcos Springs and Buda to provide data for future hydrogeologic and trend analyses.</p>\r\n<p>Please <a href=\"http://localhost/index.php/publicknowledge/en/reviewer/submission?submissionId=13\">accept or decline</a> the review by <strong>2025-01-24</strong>.</p>\r\n<p>You may contact me with any questions about the submission or the review process.</p>\r\n<p>Thank you for considering this request. Your help is much appreciated.</p>\r\n<p>Kind regards,</p>\r\n<p>Daniel Barnes</p>'),
(107,1048585,13,3,'2024-12-27 05:34:25',1073741833,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Adela Gallego\" <agallego@mailinator.com>','','','Invitation to review','<p>Dear Adela Gallego,</p>\r\n<p>I believe that you would serve as an excellent reviewer for a submission to Journal of Public Knowledge. The submission\'s title and abstract are below, and I hope that you will consider undertaking this important task for us.</p>\r\n<p>If you are able to review this submission, your review is due by 2025-01-24. You can view the submission, upload review files, and submit your review by logging into the journal site and following the steps at the link below.</p>\r\n<p><a href=\"http://localhost/index.php/publicknowledge/en/reviewer/submission?submissionId=13\">Hydrologic Connectivity in the Edwards Aquifer between San Marcos Springs and Barton Springs during 2009 Drought Conditions</a></p>\r\n<p><strong>Abstract</strong></p>\r\n<p>The Edwards Aquifer serves as the primary water supply in South-Central Texas and is the source for several major springs. In developing a plan to protect endangered species immediately downstream of San Marcos Springs, questions have been raised regarding the established concept of a hydrologic divide between the San Antonio and Barton Springs segments of the Edwards Aquifer during drought conditions. To address these questions, a water-level data collection program and a hydrogeologic study was conducted. An analysis of groundwater-level data indicate that a groundwater divide exists in the vicinity of the surface drainage divide between Onion Creek and Blanco River during wet and normal hydrologic conditions. However, analysis of data collected during the 2009 drought suggests that the groundwater divide dissipated and no longer hydrologically separated the two segments. As a result, there is potential for groundwater to flow past San Marcos Springs toward Barton Springs during major droughts. The implications for this have bearings on the management and availability of groundwater in the Edwards Aquifer. Assessments of simulations from a numerical model suggest 5 cfs could be flowing past San Marcos toward Barton springs under drought conditions. The groundwater divide appears to be influenced by recharge along Onion Creek and Blanco River and appears to be vulnerable to extended periods of little or no recharge and extensive pumping in the vicinity of Kyle and Buda. The 2009 data set shows a very low gradient in the potentiometric surface between San Marcos Springs and Kyle with very little variation in levels between drought and non-drought periods. From Kyle toward Barton Springs, the potentiometric surface slopes significantly to the north and has dramatic changes in levels between drought and non-drought periods. The source and nature of the discontinuity of the change in potentiometric gradients and dynamic water level response at Kyle is unknown. Structural influences or hydraulic properties inherent in the aquifer could be the cause of this discontinuity and may also influence the degree of hydrologic connection between San Marcos and Barton Springs. Rapid population growth and increased water demands in the Kyle and Buda areas necessitates a continual groundwater level monitoring program between San Marcos Springs and Buda to provide data for future hydrogeologic and trend analyses.</p>\r\n<p>Please <a href=\"http://localhost/index.php/publicknowledge/en/reviewer/submission?submissionId=13\">accept or decline</a> the review by <strong>2025-01-24</strong>.</p>\r\n<p>You may contact me with any questions about the submission or the review process.</p>\r\n<p>Thank you for considering this request. Your help is much appreciated.</p>\r\n<p>Kind regards,</p>\r\n<p>Daniel Barnes</p>'),
(108,1048585,13,7,'2024-12-27 05:34:30',1073741829,'\"Julie Janssen\" <jjanssen@mailinator.com>','\"Daniel Barnes\" <dbarnes@mailinator.com>, \"David Buskins\" <dbuskins@mailinator.com>, \"Stephanie Berardo\" <sberardo@mailinator.com>','','','Review accepted: Julie Janssen accepted review assignment for #13 Kumiega — Hydrologic Connectivity in the Edwards Aquifer between San Marcos Springs and Barton Springs during 2009 Drought Conditions','<p>Dear Daniel Barnes, David Buskins, Stephanie Berardo,</p><p>Julie Janssen has accepted the following review:</p><p><a href=\"http://localhost/index.php/publicknowledge/en/workflow/access/13\">#13 Kumiega — Hydrologic Connectivity in the Edwards Aquifer between San Marcos Springs and Barton Springs during 2009 Drought Conditions</a><br /><b>Type:</b> Anonymous Reviewer/Anonymous Author</p><p><b>Review Due:</b> 2025-01-24</p><p>Login to <a href=\"http://localhost/index.php/publicknowledge/en/workflow/access/13\">view all reviewer assignments</a> for this submission.</p><br><br>—<br>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge/en\">Journal of Public Knowledge</a>.'),
(109,1048585,13,3,'2024-12-27 05:34:34',1073741836,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Daniel Barnes\" <dbarnes@mailinator.com>','','','Review complete: Julie Janssen recommends Choose One for #13 Kumiega — Hydrologic Connectivity in the Edwards Aquifer between San Marcos Springs and Barton Springs during 2009 Drought Conditions','<p>Dear Daniel Barnes,</p><p>Julie Janssen completed the following review:</p><p><a href=\"http://localhost/index.php/publicknowledge/en/workflow/access/13\">#13 Kumiega — Hydrologic Connectivity in the Edwards Aquifer between San Marcos Springs and Barton Springs during 2009 Drought Conditions</a><br /><b>Recommendation:</b> Choose One<br /><b>Type:</b> Anonymous Reviewer/Anonymous Author</p><p>Login to <a href=\"http://localhost/index.php/publicknowledge/en/workflow/access/13\">view all files and comments</a> provided by this reviewer.</p>'),
(110,1048585,13,4,'2024-12-27 05:34:34',1073741836,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"David Buskins\" <dbuskins@mailinator.com>','','','Review complete: Julie Janssen recommends Choose One for #13 Kumiega — Hydrologic Connectivity in the Edwards Aquifer between San Marcos Springs and Barton Springs during 2009 Drought Conditions','<p>Dear David Buskins,</p><p>Julie Janssen completed the following review:</p><p><a href=\"http://localhost/index.php/publicknowledge/en/workflow/access/13\">#13 Kumiega — Hydrologic Connectivity in the Edwards Aquifer between San Marcos Springs and Barton Springs during 2009 Drought Conditions</a><br /><b>Recommendation:</b> Choose One<br /><b>Type:</b> Anonymous Reviewer/Anonymous Author</p><p>Login to <a href=\"http://localhost/index.php/publicknowledge/en/workflow/access/13\">view all files and comments</a> provided by this reviewer.</p>'),
(111,1048585,13,5,'2024-12-27 05:34:34',1073741836,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Stephanie Berardo\" <sberardo@mailinator.com>','','','Review complete: Julie Janssen recommends Choose One for #13 Kumiega — Hydrologic Connectivity in the Edwards Aquifer between San Marcos Springs and Barton Springs during 2009 Drought Conditions','<p>Dear Stephanie Berardo,</p><p>Julie Janssen completed the following review:</p><p><a href=\"http://localhost/index.php/publicknowledge/en/workflow/access/13\">#13 Kumiega — Hydrologic Connectivity in the Edwards Aquifer between San Marcos Springs and Barton Springs during 2009 Drought Conditions</a><br /><b>Recommendation:</b> Choose One<br /><b>Type:</b> Anonymous Reviewer/Anonymous Author</p><p>Login to <a href=\"http://localhost/index.php/publicknowledge/en/workflow/access/13\">view all files and comments</a> provided by this reviewer.</p>'),
(112,1048585,13,9,'2024-12-27 05:34:38',1073741829,'\"Aisla McCrae\" <amccrae@mailinator.com>','\"Daniel Barnes\" <dbarnes@mailinator.com>, \"David Buskins\" <dbuskins@mailinator.com>, \"Stephanie Berardo\" <sberardo@mailinator.com>','','','Review accepted: Aisla McCrae accepted review assignment for #13 Kumiega — Hydrologic Connectivity in the Edwards Aquifer between San Marcos Springs and Barton Springs during 2009 Drought Conditions','<p>Dear Daniel Barnes, David Buskins, Stephanie Berardo,</p><p>Aisla McCrae has accepted the following review:</p><p><a href=\"http://localhost/index.php/publicknowledge/en/workflow/access/13\">#13 Kumiega — Hydrologic Connectivity in the Edwards Aquifer between San Marcos Springs and Barton Springs during 2009 Drought Conditions</a><br /><b>Type:</b> Anonymous Reviewer/Anonymous Author</p><p><b>Review Due:</b> 2025-01-24</p><p>Login to <a href=\"http://localhost/index.php/publicknowledge/en/workflow/access/13\">view all reviewer assignments</a> for this submission.</p><br><br>—<br>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge/en\">Journal of Public Knowledge</a>.'),
(113,1048585,13,3,'2024-12-27 05:34:41',1073741836,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Daniel Barnes\" <dbarnes@mailinator.com>','','','Review complete: Aisla McCrae recommends Choose One for #13 Kumiega — Hydrologic Connectivity in the Edwards Aquifer between San Marcos Springs and Barton Springs during 2009 Drought Conditions','<p>Dear Daniel Barnes,</p><p>Aisla McCrae completed the following review:</p><p><a href=\"http://localhost/index.php/publicknowledge/en/workflow/access/13\">#13 Kumiega — Hydrologic Connectivity in the Edwards Aquifer between San Marcos Springs and Barton Springs during 2009 Drought Conditions</a><br /><b>Recommendation:</b> Choose One<br /><b>Type:</b> Anonymous Reviewer/Anonymous Author</p><p>Login to <a href=\"http://localhost/index.php/publicknowledge/en/workflow/access/13\">view all files and comments</a> provided by this reviewer.</p>'),
(114,1048585,13,4,'2024-12-27 05:34:42',1073741836,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"David Buskins\" <dbuskins@mailinator.com>','','','Review complete: Aisla McCrae recommends Choose One for #13 Kumiega — Hydrologic Connectivity in the Edwards Aquifer between San Marcos Springs and Barton Springs during 2009 Drought Conditions','<p>Dear David Buskins,</p><p>Aisla McCrae completed the following review:</p><p><a href=\"http://localhost/index.php/publicknowledge/en/workflow/access/13\">#13 Kumiega — Hydrologic Connectivity in the Edwards Aquifer between San Marcos Springs and Barton Springs during 2009 Drought Conditions</a><br /><b>Recommendation:</b> Choose One<br /><b>Type:</b> Anonymous Reviewer/Anonymous Author</p><p>Login to <a href=\"http://localhost/index.php/publicknowledge/en/workflow/access/13\">view all files and comments</a> provided by this reviewer.</p>'),
(115,1048585,13,5,'2024-12-27 05:34:42',1073741836,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Stephanie Berardo\" <sberardo@mailinator.com>','','','Review complete: Aisla McCrae recommends Choose One for #13 Kumiega — Hydrologic Connectivity in the Edwards Aquifer between San Marcos Springs and Barton Springs during 2009 Drought Conditions','<p>Dear Stephanie Berardo,</p><p>Aisla McCrae completed the following review:</p><p><a href=\"http://localhost/index.php/publicknowledge/en/workflow/access/13\">#13 Kumiega — Hydrologic Connectivity in the Edwards Aquifer between San Marcos Springs and Barton Springs during 2009 Drought Conditions</a><br /><b>Recommendation:</b> Choose One<br /><b>Type:</b> Anonymous Reviewer/Anonymous Author</p><p>Login to <a href=\"http://localhost/index.php/publicknowledge/en/workflow/access/13\">view all files and comments</a> provided by this reviewer.</p>'),
(116,1048585,13,10,'2024-12-27 05:34:46',1073741829,'\"Adela Gallego\" <agallego@mailinator.com>','\"Daniel Barnes\" <dbarnes@mailinator.com>, \"David Buskins\" <dbuskins@mailinator.com>, \"Stephanie Berardo\" <sberardo@mailinator.com>','','','Review accepted: Adela Gallego accepted review assignment for #13 Kumiega — Hydrologic Connectivity in the Edwards Aquifer between San Marcos Springs and Barton Springs during 2009 Drought Conditions','<p>Dear Daniel Barnes, David Buskins, Stephanie Berardo,</p><p>Adela Gallego has accepted the following review:</p><p><a href=\"http://localhost/index.php/publicknowledge/en/workflow/access/13\">#13 Kumiega — Hydrologic Connectivity in the Edwards Aquifer between San Marcos Springs and Barton Springs during 2009 Drought Conditions</a><br /><b>Type:</b> Anonymous Reviewer/Anonymous Author</p><p><b>Review Due:</b> 2025-01-24</p><p>Login to <a href=\"http://localhost/index.php/publicknowledge/en/workflow/access/13\">view all reviewer assignments</a> for this submission.</p><br><br>—<br>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge/en\">Journal of Public Knowledge</a>.'),
(117,1048585,13,3,'2024-12-27 05:34:50',1073741836,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Daniel Barnes\" <dbarnes@mailinator.com>','','','Review complete: Adela Gallego recommends Choose One for #13 Kumiega — Hydrologic Connectivity in the Edwards Aquifer between San Marcos Springs and Barton Springs during 2009 Drought Conditions','<p>Dear Daniel Barnes,</p><p>Adela Gallego completed the following review:</p><p><a href=\"http://localhost/index.php/publicknowledge/en/workflow/access/13\">#13 Kumiega — Hydrologic Connectivity in the Edwards Aquifer between San Marcos Springs and Barton Springs during 2009 Drought Conditions</a><br /><b>Recommendation:</b> Choose One<br /><b>Type:</b> Anonymous Reviewer/Anonymous Author</p><p>Login to <a href=\"http://localhost/index.php/publicknowledge/en/workflow/access/13\">view all files and comments</a> provided by this reviewer.</p>'),
(118,1048585,13,4,'2024-12-27 05:34:50',1073741836,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"David Buskins\" <dbuskins@mailinator.com>','','','Review complete: Adela Gallego recommends Choose One for #13 Kumiega — Hydrologic Connectivity in the Edwards Aquifer between San Marcos Springs and Barton Springs during 2009 Drought Conditions','<p>Dear David Buskins,</p><p>Adela Gallego completed the following review:</p><p><a href=\"http://localhost/index.php/publicknowledge/en/workflow/access/13\">#13 Kumiega — Hydrologic Connectivity in the Edwards Aquifer between San Marcos Springs and Barton Springs during 2009 Drought Conditions</a><br /><b>Recommendation:</b> Choose One<br /><b>Type:</b> Anonymous Reviewer/Anonymous Author</p><p>Login to <a href=\"http://localhost/index.php/publicknowledge/en/workflow/access/13\">view all files and comments</a> provided by this reviewer.</p>'),
(119,1048585,13,5,'2024-12-27 05:34:50',1073741836,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Stephanie Berardo\" <sberardo@mailinator.com>','','','Review complete: Adela Gallego recommends Choose One for #13 Kumiega — Hydrologic Connectivity in the Edwards Aquifer between San Marcos Springs and Barton Springs during 2009 Drought Conditions','<p>Dear Stephanie Berardo,</p><p>Adela Gallego completed the following review:</p><p><a href=\"http://localhost/index.php/publicknowledge/en/workflow/access/13\">#13 Kumiega — Hydrologic Connectivity in the Edwards Aquifer between San Marcos Springs and Barton Springs during 2009 Drought Conditions</a><br /><b>Recommendation:</b> Choose One<br /><b>Type:</b> Anonymous Reviewer/Anonymous Author</p><p>Login to <a href=\"http://localhost/index.php/publicknowledge/en/workflow/access/13\">view all files and comments</a> provided by this reviewer.</p>'),
(120,1048585,13,3,'2024-12-27 05:35:01',805306369,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Lise Kumiega\" <lkumiega@mailinator.com>','','','Your submission has been reviewed and we encourage you to submit revisions','<p>Dear Lise Kumiega,</p><p>Your submission Hydrologic Connectivity in the Edwards Aquifer between San Marcos Springs and Barton Springs during 2009 Drought Conditions has been reviewed and we would like to encourage you to submit revisions that address the reviewers\' comments. An editor will review these revisions and if they address the concerns adequately, your submission may be accepted for publication.</p><p>The reviewers\' comments are included at the bottom of this email. Please respond to each point in the reviewers\' comments and identify what changes you have made. If you find any of the reviewer\'s comments to be unjustified or inappropriate, please explain your perspective.</p><p>When you have completed your revisions, you can upload revised documents along with your response to the reviewers\' comments at your <a href=\"http://localhost/index.php/publicknowledge/en/authorDashboard/submission/13\">submission dashboard</a>. If you have been logged out, you can login again with the username lkumiega.</p><p>If you have any questions, please contact me from your <a href=\"http://localhost/index.php/publicknowledge/en/authorDashboard/submission/13\">submission dashboard</a>.</p><p>We look forward to receiving your revised submission.</p><p>Kind regards,</p><p>Daniel Barnes</p><hr><p>The following comments were received from reviewers.</p><p><strong>Reviewer 1:</strong><br>Recommendation: Revisions Required</p><p>Here are my review comments</p><p><strong>Reviewer 2:</strong><br>Recommendation: Revisions Required</p><p>Here are my review comments</p><p><strong>Reviewer 3:</strong><br>Recommendation: Resubmit for Review</p><p>Here are my review comments</p>'),
(121,1048585,13,3,'2024-12-27 05:35:01',1073741825,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Julie Janssen\" <jjanssen@mailinator.com>','','','Thank you for your review','<p>Dear Julie Janssen,</p>\n<p>Thank you for completing your review of the submission, Hydrologic Connectivity in the Edwards Aquifer between San Marcos Springs and Barton Springs during 2009 Drought Conditions, for Journal of Public Knowledge. We appreciate your time and expertise in contributing to the quality of the work that we publish. We have shared your comments with the authors, along with our other reviewers\' comments and the editor\'s decision.</p>\n<p>Based on the feedback we received, we have notified the authors of the following:</p>\n<p>We have invited the authors to submit revisions.</p>\n<p>Your recommendation was considered alongside the recommendations of other reviewers before coming to a decision. Occasionally the editor\'s decision may differ from the recommendation made by one or more reviewers. The editor considers many factors, and does not take these decisions lightly. We are grateful for our reviewers\' expertise and suggestions.</p>\n<p>It has been a pleasure to work with you as a reviewer for Journal of Public Knowledge, and we hope to have the opportunity to work with you again in the future.</p>\n<p>Kind regards,</p>\n<p><p>Daniel Barnes</p></p>'),
(122,1048585,13,3,'2024-12-27 05:35:01',1073741825,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Aisla McCrae\" <amccrae@mailinator.com>','','','Thank you for your review','<p>Dear Aisla McCrae,</p>\n<p>Thank you for completing your review of the submission, Hydrologic Connectivity in the Edwards Aquifer between San Marcos Springs and Barton Springs during 2009 Drought Conditions, for Journal of Public Knowledge. We appreciate your time and expertise in contributing to the quality of the work that we publish. We have shared your comments with the authors, along with our other reviewers\' comments and the editor\'s decision.</p>\n<p>Based on the feedback we received, we have notified the authors of the following:</p>\n<p>We have invited the authors to submit revisions.</p>\n<p>Your recommendation was considered alongside the recommendations of other reviewers before coming to a decision. Occasionally the editor\'s decision may differ from the recommendation made by one or more reviewers. The editor considers many factors, and does not take these decisions lightly. We are grateful for our reviewers\' expertise and suggestions.</p>\n<p>It has been a pleasure to work with you as a reviewer for Journal of Public Knowledge, and we hope to have the opportunity to work with you again in the future.</p>\n<p>Kind regards,</p>\n<p><p>Daniel Barnes</p></p>'),
(123,1048585,13,3,'2024-12-27 05:35:01',1073741825,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Adela Gallego\" <agallego@mailinator.com>','','','Thank you for your review','<p>Dear Adela Gallego,</p>\n<p>Thank you for completing your review of the submission, Hydrologic Connectivity in the Edwards Aquifer between San Marcos Springs and Barton Springs during 2009 Drought Conditions, for Journal of Public Knowledge. We appreciate your time and expertise in contributing to the quality of the work that we publish. We have shared your comments with the authors, along with our other reviewers\' comments and the editor\'s decision.</p>\n<p>Based on the feedback we received, we have notified the authors of the following:</p>\n<p>We have invited the authors to submit revisions.</p>\n<p>Your recommendation was considered alongside the recommendations of other reviewers before coming to a decision. Occasionally the editor\'s decision may differ from the recommendation made by one or more reviewers. The editor considers many factors, and does not take these decisions lightly. We are grateful for our reviewers\' expertise and suggestions.</p>\n<p>It has been a pleasure to work with you as a reviewer for Journal of Public Knowledge, and we hope to have the opportunity to work with you again in the future.</p>\n<p>Kind regards,</p>\n<p><p>Daniel Barnes</p></p>'),
(124,1048585,14,NULL,'2024-12-27 05:35:14',805306370,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Daniel Barnes\" <dbarnes@mailinator.com>','','','You have been assigned as an editor on a submission to Journal of Public Knowledge','<p>Dear Daniel Barnes,</p><p>The following submission has been assigned to you to see through the editorial process.</p><p><a href=\"http://localhost/index.php/publicknowledge/en/workflow/access/14\">Towards Designing an Intercultural Curriculum: A Case Study from the Atlantic Coast of Nicaragua</a><br />Patricia Daniel</p><p><b>Abstract</b></p>One of the challenges still to be met in the 21st century is that of genuinely embracing diversity. How can education help to overcome the barriers that continue to exist between people on the basis of language, culture and gender? This case study takes the Atlantic Coast of Nicaragua as an example of a multilingual/multiethnic region and examines how the community university URACCAN is contributing to the development of interculturality. It describes participatory research that was carried out with university staff and students with the intention of defining an intercultural curriculum and appropriate strategies for delivering such. One model used as a basis for discussions was the Model for Community Understanding from the Wales Curriculum Council, which emphasises the belonging of the individual to different communities or cultures at the same time. Factors supporting the development of an intercultural curriculum include the university’s close involvement with the ethnic communities it serves. However, ethno-linguistic power relations within the region and the country as a whole, still militate against egalitarianism within the university. The research highlights the importance of participatory pedagogy as the basis for promoting interculturality and achieving lasting social transformation.<p>If you find the submission to be relevant for Journal of Public Knowledge, please forward the submission to the review stage by selecting \"Send to Review\" and then assign reviewers by clicking \"Add Reviewer\".</p><p>If the submission is not appropriate for this journal, please decline the submission.</p><p>Thank you in advance.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Journal of Public Knowledge</a>.</p>'),
(125,1048585,14,NULL,'2024-12-27 05:35:14',805306370,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"David Buskins\" <dbuskins@mailinator.com>','','','You have been assigned as an editor on a submission to Journal of Public Knowledge','<p>Dear David Buskins,</p><p>The following submission has been assigned to you to see through the editorial process.</p><p><a href=\"http://localhost/index.php/publicknowledge/en/workflow/access/14\">Towards Designing an Intercultural Curriculum: A Case Study from the Atlantic Coast of Nicaragua</a><br />Patricia Daniel</p><p><b>Abstract</b></p>One of the challenges still to be met in the 21st century is that of genuinely embracing diversity. How can education help to overcome the barriers that continue to exist between people on the basis of language, culture and gender? This case study takes the Atlantic Coast of Nicaragua as an example of a multilingual/multiethnic region and examines how the community university URACCAN is contributing to the development of interculturality. It describes participatory research that was carried out with university staff and students with the intention of defining an intercultural curriculum and appropriate strategies for delivering such. One model used as a basis for discussions was the Model for Community Understanding from the Wales Curriculum Council, which emphasises the belonging of the individual to different communities or cultures at the same time. Factors supporting the development of an intercultural curriculum include the university’s close involvement with the ethnic communities it serves. However, ethno-linguistic power relations within the region and the country as a whole, still militate against egalitarianism within the university. The research highlights the importance of participatory pedagogy as the basis for promoting interculturality and achieving lasting social transformation.<p>If you find the submission to be relevant for Journal of Public Knowledge, please forward the submission to the review stage by selecting \"Send to Review\" and then assign reviewers by clicking \"Add Reviewer\".</p><p>If the submission is not appropriate for this journal, please decline the submission.</p><p>Thank you in advance.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Journal of Public Knowledge</a>.</p>'),
(126,1048585,14,NULL,'2024-12-27 05:35:14',805306370,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Stephanie Berardo\" <sberardo@mailinator.com>','','','You have been assigned as an editor on a submission to Journal of Public Knowledge','<p>Dear Stephanie Berardo,</p><p>The following submission has been assigned to you to see through the editorial process.</p><p><a href=\"http://localhost/index.php/publicknowledge/en/workflow/access/14\">Towards Designing an Intercultural Curriculum: A Case Study from the Atlantic Coast of Nicaragua</a><br />Patricia Daniel</p><p><b>Abstract</b></p>One of the challenges still to be met in the 21st century is that of genuinely embracing diversity. How can education help to overcome the barriers that continue to exist between people on the basis of language, culture and gender? This case study takes the Atlantic Coast of Nicaragua as an example of a multilingual/multiethnic region and examines how the community university URACCAN is contributing to the development of interculturality. It describes participatory research that was carried out with university staff and students with the intention of defining an intercultural curriculum and appropriate strategies for delivering such. One model used as a basis for discussions was the Model for Community Understanding from the Wales Curriculum Council, which emphasises the belonging of the individual to different communities or cultures at the same time. Factors supporting the development of an intercultural curriculum include the university’s close involvement with the ethnic communities it serves. However, ethno-linguistic power relations within the region and the country as a whole, still militate against egalitarianism within the university. The research highlights the importance of participatory pedagogy as the basis for promoting interculturality and achieving lasting social transformation.<p>If you find the submission to be relevant for Journal of Public Knowledge, please forward the submission to the review stage by selecting \"Send to Review\" and then assign reviewers by clicking \"Add Reviewer\".</p><p>If the submission is not appropriate for this journal, please decline the submission.</p><p>Thank you in advance.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Journal of Public Knowledge</a>.</p>'),
(127,1048585,14,NULL,'2024-12-27 05:35:14',536870914,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Patricia Daniel\" <pdaniel@mailinator.com>','','','Thank you for your submission to Journal of Public Knowledge','<p>Dear Patricia Daniel,</p><p>Thank you for your submission to Journal of Public Knowledge. We have received your submission, Towards Designing an Intercultural Curriculum: A Case Study from the Atlantic Coast of Nicaragua, and a member of our editorial team will see it soon. You will be sent an email when an initial decision is made, and we may contact you for further information.</p><p>You can view your submission and track its progress through the editorial process at the following location:</p><p>Submission URL: http://localhost/index.php/publicknowledge/en/authorDashboard/submission/14</p><p>If you have been logged out, you can login again with the username pdaniel.</p><p>If you have any questions, please contact me from your <a href=\"http://localhost/index.php/publicknowledge/en/authorDashboard/submission/14\">submission dashboard</a>.</p><p>Thank you for considering Journal of Public Knowledge as a venue for your work.</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Journal of Public Knowledge</a>.</p>'),
(128,1048585,15,NULL,'2024-12-27 05:35:23',805306370,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Daniel Barnes\" <dbarnes@mailinator.com>','','','You have been assigned as an editor on a submission to Journal of Public Knowledge','<p>Dear Daniel Barnes,</p><p>The following submission has been assigned to you to see through the editorial process.</p><p><a href=\"http://localhost/index.php/publicknowledge/en/workflow/access/15\">Yam diseases and its management in Nigeria</a><br />Rana Baiyewu</p><p><b>Abstract</b></p>This review presents different diseases associated with yam and the management strategies employed in combating its menace in Nigeria. The field and storage diseases are presented, anthracnose is regarded as the most widely spread of all the field diseases, while yam mosaic virus disease is considered to cause the most severe losses in yams. Dry rot is considered as the most devastating of all the storage diseases of yam. Dry rot of yams alone causes a marked reduction in the quantity, marketable value and edible portions of tubers and those reductions are more severe in stored yams. The management strategies adopted and advocated for combating the field diseases includes the use of crop rotation, fallowing, planting of healthy material, the destruction of infected crop cultivars and the use of resistant cultivars. With regards to the storage diseases, the use of Tecto (Thiabendazole), locally made dry gins or wood ash before storage has been found to protect yam tubers against fungal infection in storage. Finally, processing of yam tubers into chips or cubes increases its shelf live for a period of between 6 months and one year.<p>If you find the submission to be relevant for Journal of Public Knowledge, please forward the submission to the review stage by selecting \"Send to Review\" and then assign reviewers by clicking \"Add Reviewer\".</p><p>If the submission is not appropriate for this journal, please decline the submission.</p><p>Thank you in advance.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Journal of Public Knowledge</a>.</p>'),
(129,1048585,15,NULL,'2024-12-27 05:35:24',805306370,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"David Buskins\" <dbuskins@mailinator.com>','','','You have been assigned as an editor on a submission to Journal of Public Knowledge','<p>Dear David Buskins,</p><p>The following submission has been assigned to you to see through the editorial process.</p><p><a href=\"http://localhost/index.php/publicknowledge/en/workflow/access/15\">Yam diseases and its management in Nigeria</a><br />Rana Baiyewu</p><p><b>Abstract</b></p>This review presents different diseases associated with yam and the management strategies employed in combating its menace in Nigeria. The field and storage diseases are presented, anthracnose is regarded as the most widely spread of all the field diseases, while yam mosaic virus disease is considered to cause the most severe losses in yams. Dry rot is considered as the most devastating of all the storage diseases of yam. Dry rot of yams alone causes a marked reduction in the quantity, marketable value and edible portions of tubers and those reductions are more severe in stored yams. The management strategies adopted and advocated for combating the field diseases includes the use of crop rotation, fallowing, planting of healthy material, the destruction of infected crop cultivars and the use of resistant cultivars. With regards to the storage diseases, the use of Tecto (Thiabendazole), locally made dry gins or wood ash before storage has been found to protect yam tubers against fungal infection in storage. Finally, processing of yam tubers into chips or cubes increases its shelf live for a period of between 6 months and one year.<p>If you find the submission to be relevant for Journal of Public Knowledge, please forward the submission to the review stage by selecting \"Send to Review\" and then assign reviewers by clicking \"Add Reviewer\".</p><p>If the submission is not appropriate for this journal, please decline the submission.</p><p>Thank you in advance.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Journal of Public Knowledge</a>.</p>'),
(130,1048585,15,NULL,'2024-12-27 05:35:24',805306370,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Stephanie Berardo\" <sberardo@mailinator.com>','','','You have been assigned as an editor on a submission to Journal of Public Knowledge','<p>Dear Stephanie Berardo,</p><p>The following submission has been assigned to you to see through the editorial process.</p><p><a href=\"http://localhost/index.php/publicknowledge/en/workflow/access/15\">Yam diseases and its management in Nigeria</a><br />Rana Baiyewu</p><p><b>Abstract</b></p>This review presents different diseases associated with yam and the management strategies employed in combating its menace in Nigeria. The field and storage diseases are presented, anthracnose is regarded as the most widely spread of all the field diseases, while yam mosaic virus disease is considered to cause the most severe losses in yams. Dry rot is considered as the most devastating of all the storage diseases of yam. Dry rot of yams alone causes a marked reduction in the quantity, marketable value and edible portions of tubers and those reductions are more severe in stored yams. The management strategies adopted and advocated for combating the field diseases includes the use of crop rotation, fallowing, planting of healthy material, the destruction of infected crop cultivars and the use of resistant cultivars. With regards to the storage diseases, the use of Tecto (Thiabendazole), locally made dry gins or wood ash before storage has been found to protect yam tubers against fungal infection in storage. Finally, processing of yam tubers into chips or cubes increases its shelf live for a period of between 6 months and one year.<p>If you find the submission to be relevant for Journal of Public Knowledge, please forward the submission to the review stage by selecting \"Send to Review\" and then assign reviewers by clicking \"Add Reviewer\".</p><p>If the submission is not appropriate for this journal, please decline the submission.</p><p>Thank you in advance.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Journal of Public Knowledge</a>.</p>'),
(131,1048585,15,NULL,'2024-12-27 05:35:24',536870914,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Rana Baiyewu\" <rbaiyewu@mailinator.com>','','','Thank you for your submission to Journal of Public Knowledge','<p>Dear Rana Baiyewu,</p><p>Thank you for your submission to Journal of Public Knowledge. We have received your submission, Yam diseases and its management in Nigeria, and a member of our editorial team will see it soon. You will be sent an email when an initial decision is made, and we may contact you for further information.</p><p>You can view your submission and track its progress through the editorial process at the following location:</p><p>Submission URL: http://localhost/index.php/publicknowledge/en/authorDashboard/submission/15</p><p>If you have been logged out, you can login again with the username rbaiyewu.</p><p>If you have any questions, please contact me from your <a href=\"http://localhost/index.php/publicknowledge/en/authorDashboard/submission/15\">submission dashboard</a>.</p><p>Thank you for considering Journal of Public Knowledge as a venue for your work.</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Journal of Public Knowledge</a>.</p>'),
(132,1048585,15,3,'2024-12-27 05:35:31',805306369,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Rana Baiyewu\" <rbaiyewu@mailinator.com>','','','Your submission has been sent for review','<p>Dear Rana Baiyewu,</p><p>I am pleased to inform you that an editor has reviewed your submission, Yam diseases and its management in Nigeria, and has decided to send it for peer review. An editor will identify qualified reviewers who will provide feedback on your submission.</p><p>This journal conducts double-anonymous peer review. The reviewers will not see any identifying information about you or your co-authors. Similarly, you will not know who reviewed your submission, and you will not hear from the reviewers directly. You will hear from us with feedback from the reviewers and information about the next steps.</p><p>Please note that sending the submission to peer review does not guarantee that it will be published. We will consider the reviewers\' recommendations before deciding to accept the submission for publication. You may be asked to make revisions and respond to the reviewers\' comments before a final decision is made.</p><p>If you have any questions, please contact me from your submission dashboard.</p><p><p>Daniel Barnes</p></p>'),
(133,1048585,15,3,'2024-12-27 05:35:36',1073741833,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Paul Hudson\" <phudson@mailinator.com>','','','Invitation to review','<p>Dear Paul Hudson,</p>\r\n<p>I believe that you would serve as an excellent reviewer for a submission to Journal of Public Knowledge. The submission\'s title and abstract are below, and I hope that you will consider undertaking this important task for us.</p>\r\n<p>If you are able to review this submission, your review is due by 2025-01-24. You can view the submission, upload review files, and submit your review by logging into the journal site and following the steps at the link below.</p>\r\n<p><a href=\"http://localhost/index.php/publicknowledge/en/reviewer/submission?submissionId=15\">Yam diseases and its management in Nigeria</a></p>\r\n<p><strong>Abstract</strong></p>\r\n<p>This review presents different diseases associated with yam and the management strategies employed in combating its menace in Nigeria. The field and storage diseases are presented, anthracnose is regarded as the most widely spread of all the field diseases, while yam mosaic virus disease is considered to cause the most severe losses in yams. Dry rot is considered as the most devastating of all the storage diseases of yam. Dry rot of yams alone causes a marked reduction in the quantity, marketable value and edible portions of tubers and those reductions are more severe in stored yams. The management strategies adopted and advocated for combating the field diseases includes the use of crop rotation, fallowing, planting of healthy material, the destruction of infected crop cultivars and the use of resistant cultivars. With regards to the storage diseases, the use of Tecto (Thiabendazole), locally made dry gins or wood ash before storage has been found to protect yam tubers against fungal infection in storage. Finally, processing of yam tubers into chips or cubes increases its shelf live for a period of between 6 months and one year.</p>\r\n<p>Please <a href=\"http://localhost/index.php/publicknowledge/en/reviewer/submission?submissionId=15\">accept or decline</a> the review by <strong>2025-01-24</strong>.</p>\r\n<p>You may contact me with any questions about the submission or the review process.</p>\r\n<p>Thank you for considering this request. Your help is much appreciated.</p>\r\n<p>Kind regards,</p>\r\n<p>Daniel Barnes</p>'),
(134,1048585,15,3,'2024-12-27 05:35:38',1073741833,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Aisla McCrae\" <amccrae@mailinator.com>','','','Invitation to review','<p>Dear Aisla McCrae,</p>\r\n<p>I believe that you would serve as an excellent reviewer for a submission to Journal of Public Knowledge. The submission\'s title and abstract are below, and I hope that you will consider undertaking this important task for us.</p>\r\n<p>If you are able to review this submission, your review is due by 2025-01-24. You can view the submission, upload review files, and submit your review by logging into the journal site and following the steps at the link below.</p>\r\n<p><a href=\"http://localhost/index.php/publicknowledge/en/reviewer/submission?submissionId=15\">Yam diseases and its management in Nigeria</a></p>\r\n<p><strong>Abstract</strong></p>\r\n<p>This review presents different diseases associated with yam and the management strategies employed in combating its menace in Nigeria. The field and storage diseases are presented, anthracnose is regarded as the most widely spread of all the field diseases, while yam mosaic virus disease is considered to cause the most severe losses in yams. Dry rot is considered as the most devastating of all the storage diseases of yam. Dry rot of yams alone causes a marked reduction in the quantity, marketable value and edible portions of tubers and those reductions are more severe in stored yams. The management strategies adopted and advocated for combating the field diseases includes the use of crop rotation, fallowing, planting of healthy material, the destruction of infected crop cultivars and the use of resistant cultivars. With regards to the storage diseases, the use of Tecto (Thiabendazole), locally made dry gins or wood ash before storage has been found to protect yam tubers against fungal infection in storage. Finally, processing of yam tubers into chips or cubes increases its shelf live for a period of between 6 months and one year.</p>\r\n<p>Please <a href=\"http://localhost/index.php/publicknowledge/en/reviewer/submission?submissionId=15\">accept or decline</a> the review by <strong>2025-01-24</strong>.</p>\r\n<p>You may contact me with any questions about the submission or the review process.</p>\r\n<p>Thank you for considering this request. Your help is much appreciated.</p>\r\n<p>Kind regards,</p>\r\n<p>Daniel Barnes</p>'),
(135,1048585,15,3,'2024-12-27 05:35:42',805306369,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Rana Baiyewu\" <rbaiyewu@mailinator.com>','','','Your submission has been accepted to Journal of Public Knowledge','<p>Dear Rana Baiyewu,</p><p>I am pleased to inform you that we have decided to accept your submission without further revision. After careful review, we found your submission, Yam diseases and its management in Nigeria, to meet or exceed our expectations. We are excited to publish your piece in Journal of Public Knowledge and we thank you for choosing our journal as a venue for your work.</p><p>Your submission is now forthcoming in a future issue of Journal of Public Knowledge and you are welcome to include it in your list of publications. We recognize the hard work that goes into every successful submission and we want to congratulate you on reaching this stage.</p><p>Your submission will now undergo copy editing and formatting to prepare it for publication.</p><p>You will shortly receive further instructions.</p><p>If you have any questions, please contact me from your <a href=\"http://localhost/index.php/publicknowledge/en/authorDashboard/submission/15\">submission dashboard</a>.</p><p>Kind regards,</p><p>Daniel Barnes</p>'),
(136,1048585,15,3,'2024-12-27 05:35:52',805306369,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Rana Baiyewu\" <rbaiyewu@mailinator.com>','','','Next steps for publishing your submission','<p>Dear Rana Baiyewu,</p><p>I am writing from Journal of Public Knowledge to let you know that the editing of your submission, Yam diseases and its management in Nigeria, is complete. Your submission will now advance to the production stage, where the final galleys will be prepared for publication. We will contact you if we need any further assistance.</p><p>If you have any questions, please contact me from your <a href=\"http://localhost/index.php/publicknowledge/en/authorDashboard/submission/15\">submission dashboard</a>.</p><p>Kind regards,</p><p>Daniel Barnes</p>'),
(137,1048585,16,NULL,'2024-12-27 05:36:07',805306370,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Daniel Barnes\" <dbarnes@mailinator.com>','','','You have been assigned as an editor on a submission to Journal of Public Knowledge','<p>Dear Daniel Barnes,</p><p>The following submission has been assigned to you to see through the editorial process.</p><p><a href=\"http://localhost/index.php/publicknowledge/en/workflow/access/16\">Influence of long-term nutrition with different dietary fats on fatty acid composition of heavy pigs backfat</a><br />Rosanna Rossi</p><p><b>Abstract</b></p>Aim of this research is to provide a general situation of cattle slaughtered in Cameroon, as a representative example for the Central African Sub-region. The quality and safety of beef from the abattoir of Yaoundé, the largest in Cameroon, were considered. From January 2009 to March 2012, the pre-slaughter conditions and characteristics of 1953 cattle carcasses were recorded, as well as the pH of m. longissimus thoracis 24 h after slaughter. From these carcasses, 60 were selected to represent the bulls slaughtered. The quality parameters and composition of m. longissimus thoracis were carried out. The origin of most of the cattle was the Guinea High Savannah (74.6%), and transhumance was the common production system (75.5%). Gudali (45.6%), White Fulani (33.3%) and Red Mbororo (20.3%) breeds were predominant. Carcass weight was affected by rearing system and cattle category, and it markedly varied during year. Considering meat quality, the fat content was low (1.2%) and similar between breeds, moreover Gudali showed the toughest meat. Of the cows slaughtered, 27% were pregnant and the most common abnormal conditions encountered were ectoparasites, fatigue, lameness, fungal-like skin lesions, enlarged lymph nodes, respiratory distress, nodular lesions. More than 20% of the carcasses had some organs condemned, mainly for liver flukes (5.17%), and 1.0% of them were completely condemned due to tuberculosis, that also affected 3.28% of lungs. These data could aid authorities draw up programmes with the aim to strengthen cattle production, improve beef supply, control and prevent the observed diseases, and promote the regional trade.<p>If you find the submission to be relevant for Journal of Public Knowledge, please forward the submission to the review stage by selecting \"Send to Review\" and then assign reviewers by clicking \"Add Reviewer\".</p><p>If the submission is not appropriate for this journal, please decline the submission.</p><p>Thank you in advance.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Journal of Public Knowledge</a>.</p>'),
(138,1048585,16,NULL,'2024-12-27 05:36:07',805306370,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"David Buskins\" <dbuskins@mailinator.com>','','','You have been assigned as an editor on a submission to Journal of Public Knowledge','<p>Dear David Buskins,</p><p>The following submission has been assigned to you to see through the editorial process.</p><p><a href=\"http://localhost/index.php/publicknowledge/en/workflow/access/16\">Influence of long-term nutrition with different dietary fats on fatty acid composition of heavy pigs backfat</a><br />Rosanna Rossi</p><p><b>Abstract</b></p>Aim of this research is to provide a general situation of cattle slaughtered in Cameroon, as a representative example for the Central African Sub-region. The quality and safety of beef from the abattoir of Yaoundé, the largest in Cameroon, were considered. From January 2009 to March 2012, the pre-slaughter conditions and characteristics of 1953 cattle carcasses were recorded, as well as the pH of m. longissimus thoracis 24 h after slaughter. From these carcasses, 60 were selected to represent the bulls slaughtered. The quality parameters and composition of m. longissimus thoracis were carried out. The origin of most of the cattle was the Guinea High Savannah (74.6%), and transhumance was the common production system (75.5%). Gudali (45.6%), White Fulani (33.3%) and Red Mbororo (20.3%) breeds were predominant. Carcass weight was affected by rearing system and cattle category, and it markedly varied during year. Considering meat quality, the fat content was low (1.2%) and similar between breeds, moreover Gudali showed the toughest meat. Of the cows slaughtered, 27% were pregnant and the most common abnormal conditions encountered were ectoparasites, fatigue, lameness, fungal-like skin lesions, enlarged lymph nodes, respiratory distress, nodular lesions. More than 20% of the carcasses had some organs condemned, mainly for liver flukes (5.17%), and 1.0% of them were completely condemned due to tuberculosis, that also affected 3.28% of lungs. These data could aid authorities draw up programmes with the aim to strengthen cattle production, improve beef supply, control and prevent the observed diseases, and promote the regional trade.<p>If you find the submission to be relevant for Journal of Public Knowledge, please forward the submission to the review stage by selecting \"Send to Review\" and then assign reviewers by clicking \"Add Reviewer\".</p><p>If the submission is not appropriate for this journal, please decline the submission.</p><p>Thank you in advance.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Journal of Public Knowledge</a>.</p>'),
(139,1048585,16,NULL,'2024-12-27 05:36:07',805306370,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Stephanie Berardo\" <sberardo@mailinator.com>','','','You have been assigned as an editor on a submission to Journal of Public Knowledge','<p>Dear Stephanie Berardo,</p><p>The following submission has been assigned to you to see through the editorial process.</p><p><a href=\"http://localhost/index.php/publicknowledge/en/workflow/access/16\">Influence of long-term nutrition with different dietary fats on fatty acid composition of heavy pigs backfat</a><br />Rosanna Rossi</p><p><b>Abstract</b></p>Aim of this research is to provide a general situation of cattle slaughtered in Cameroon, as a representative example for the Central African Sub-region. The quality and safety of beef from the abattoir of Yaoundé, the largest in Cameroon, were considered. From January 2009 to March 2012, the pre-slaughter conditions and characteristics of 1953 cattle carcasses were recorded, as well as the pH of m. longissimus thoracis 24 h after slaughter. From these carcasses, 60 were selected to represent the bulls slaughtered. The quality parameters and composition of m. longissimus thoracis were carried out. The origin of most of the cattle was the Guinea High Savannah (74.6%), and transhumance was the common production system (75.5%). Gudali (45.6%), White Fulani (33.3%) and Red Mbororo (20.3%) breeds were predominant. Carcass weight was affected by rearing system and cattle category, and it markedly varied during year. Considering meat quality, the fat content was low (1.2%) and similar between breeds, moreover Gudali showed the toughest meat. Of the cows slaughtered, 27% were pregnant and the most common abnormal conditions encountered were ectoparasites, fatigue, lameness, fungal-like skin lesions, enlarged lymph nodes, respiratory distress, nodular lesions. More than 20% of the carcasses had some organs condemned, mainly for liver flukes (5.17%), and 1.0% of them were completely condemned due to tuberculosis, that also affected 3.28% of lungs. These data could aid authorities draw up programmes with the aim to strengthen cattle production, improve beef supply, control and prevent the observed diseases, and promote the regional trade.<p>If you find the submission to be relevant for Journal of Public Knowledge, please forward the submission to the review stage by selecting \"Send to Review\" and then assign reviewers by clicking \"Add Reviewer\".</p><p>If the submission is not appropriate for this journal, please decline the submission.</p><p>Thank you in advance.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Journal of Public Knowledge</a>.</p>'),
(140,1048585,16,NULL,'2024-12-27 05:36:07',536870914,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Rosanna Rossi\" <rrossi@mailinator.com>','','','Thank you for your submission to Journal of Public Knowledge','<p>Dear Rosanna Rossi,</p><p>Thank you for your submission to Journal of Public Knowledge. We have received your submission, Influence of long-term nutrition with different dietary fats on fatty acid composition of heavy pigs backfat, and a member of our editorial team will see it soon. You will be sent an email when an initial decision is made, and we may contact you for further information.</p><p>You can view your submission and track its progress through the editorial process at the following location:</p><p>Submission URL: http://localhost/index.php/publicknowledge/en/authorDashboard/submission/16</p><p>If you have been logged out, you can login again with the username rrossi.</p><p>If you have any questions, please contact me from your <a href=\"http://localhost/index.php/publicknowledge/en/authorDashboard/submission/16\">submission dashboard</a>.</p><p>Thank you for considering Journal of Public Knowledge as a venue for your work.</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Journal of Public Knowledge</a>.</p>'),
(141,1048585,17,NULL,'2024-12-27 05:36:17',805306370,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Daniel Barnes\" <dbarnes@mailinator.com>','','','You have been assigned as an editor on a submission to Journal of Public Knowledge','<p>Dear Daniel Barnes,</p><p>The following submission has been assigned to you to see through the editorial process.</p><p><a href=\"http://localhost/index.php/publicknowledge/en/workflow/access/17\">Antimicrobial, heavy metal resistance and plasmid profile of coliforms isolated from nosocomial infections in a hospital in Isfahan, Iran</a><br />Vajiheh Karbasizaed</p><p><b>Abstract</b></p>The antimicrobial, heavy metal resistance patterns and plasmid profiles of Coliforms (Enterobacteriacea) isolated from nosocomial infections and healthy human faeces were compared. Fifteen of the 25 isolates from nosocomial infections were identified as Escherichia coli, and remaining as Kelebsiella pneumoniae. Seventy two percent of the strains isolated from nosocomial infections possess multiple resistance to antibiotics compared to 45% of strains from healthy human faeces. The difference between minimal inhibitory concentration (MIC) values of strains from clinical cases and from faeces for four heavy metals (Hg, Cu, Pb, Cd) was not significant. However most strains isolated from hospital were more tolerant to heavy metal than those from healthy persons. There was no consistent relationship between plasmid profile group and antimicrobial resistance pattern, although a conjugative plasmid (&gt;56.4 kb) encoding resistance to heavy metals and antibiotics was recovered from eight of the strains isolated from nosocomial infections. The results indicate multidrug-resistance coliforms as a potential cause of nosocomial infection in this region.<p>If you find the submission to be relevant for Journal of Public Knowledge, please forward the submission to the review stage by selecting \"Send to Review\" and then assign reviewers by clicking \"Add Reviewer\".</p><p>If the submission is not appropriate for this journal, please decline the submission.</p><p>Thank you in advance.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Journal of Public Knowledge</a>.</p>'),
(142,1048585,17,NULL,'2024-12-27 05:36:17',805306370,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"David Buskins\" <dbuskins@mailinator.com>','','','You have been assigned as an editor on a submission to Journal of Public Knowledge','<p>Dear David Buskins,</p><p>The following submission has been assigned to you to see through the editorial process.</p><p><a href=\"http://localhost/index.php/publicknowledge/en/workflow/access/17\">Antimicrobial, heavy metal resistance and plasmid profile of coliforms isolated from nosocomial infections in a hospital in Isfahan, Iran</a><br />Vajiheh Karbasizaed</p><p><b>Abstract</b></p>The antimicrobial, heavy metal resistance patterns and plasmid profiles of Coliforms (Enterobacteriacea) isolated from nosocomial infections and healthy human faeces were compared. Fifteen of the 25 isolates from nosocomial infections were identified as Escherichia coli, and remaining as Kelebsiella pneumoniae. Seventy two percent of the strains isolated from nosocomial infections possess multiple resistance to antibiotics compared to 45% of strains from healthy human faeces. The difference between minimal inhibitory concentration (MIC) values of strains from clinical cases and from faeces for four heavy metals (Hg, Cu, Pb, Cd) was not significant. However most strains isolated from hospital were more tolerant to heavy metal than those from healthy persons. There was no consistent relationship between plasmid profile group and antimicrobial resistance pattern, although a conjugative plasmid (&gt;56.4 kb) encoding resistance to heavy metals and antibiotics was recovered from eight of the strains isolated from nosocomial infections. The results indicate multidrug-resistance coliforms as a potential cause of nosocomial infection in this region.<p>If you find the submission to be relevant for Journal of Public Knowledge, please forward the submission to the review stage by selecting \"Send to Review\" and then assign reviewers by clicking \"Add Reviewer\".</p><p>If the submission is not appropriate for this journal, please decline the submission.</p><p>Thank you in advance.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Journal of Public Knowledge</a>.</p>'),
(143,1048585,17,NULL,'2024-12-27 05:36:17',805306370,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Stephanie Berardo\" <sberardo@mailinator.com>','','','You have been assigned as an editor on a submission to Journal of Public Knowledge','<p>Dear Stephanie Berardo,</p><p>The following submission has been assigned to you to see through the editorial process.</p><p><a href=\"http://localhost/index.php/publicknowledge/en/workflow/access/17\">Antimicrobial, heavy metal resistance and plasmid profile of coliforms isolated from nosocomial infections in a hospital in Isfahan, Iran</a><br />Vajiheh Karbasizaed</p><p><b>Abstract</b></p>The antimicrobial, heavy metal resistance patterns and plasmid profiles of Coliforms (Enterobacteriacea) isolated from nosocomial infections and healthy human faeces were compared. Fifteen of the 25 isolates from nosocomial infections were identified as Escherichia coli, and remaining as Kelebsiella pneumoniae. Seventy two percent of the strains isolated from nosocomial infections possess multiple resistance to antibiotics compared to 45% of strains from healthy human faeces. The difference between minimal inhibitory concentration (MIC) values of strains from clinical cases and from faeces for four heavy metals (Hg, Cu, Pb, Cd) was not significant. However most strains isolated from hospital were more tolerant to heavy metal than those from healthy persons. There was no consistent relationship between plasmid profile group and antimicrobial resistance pattern, although a conjugative plasmid (&gt;56.4 kb) encoding resistance to heavy metals and antibiotics was recovered from eight of the strains isolated from nosocomial infections. The results indicate multidrug-resistance coliforms as a potential cause of nosocomial infection in this region.<p>If you find the submission to be relevant for Journal of Public Knowledge, please forward the submission to the review stage by selecting \"Send to Review\" and then assign reviewers by clicking \"Add Reviewer\".</p><p>If the submission is not appropriate for this journal, please decline the submission.</p><p>Thank you in advance.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Journal of Public Knowledge</a>.</p>'),
(144,1048585,17,NULL,'2024-12-27 05:36:17',536870914,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Vajiheh Karbasizaed\" <vkarbasizaed@mailinator.com>','','','Thank you for your submission to Journal of Public Knowledge','<p>Dear Vajiheh Karbasizaed,</p><p>Thank you for your submission to Journal of Public Knowledge. We have received your submission, Antimicrobial, heavy metal resistance and plasmid profile of coliforms isolated from nosocomial infections in a hospital in Isfahan, Iran, and a member of our editorial team will see it soon. You will be sent an email when an initial decision is made, and we may contact you for further information.</p><p>You can view your submission and track its progress through the editorial process at the following location:</p><p>Submission URL: http://localhost/index.php/publicknowledge/en/authorDashboard/submission/17</p><p>If you have been logged out, you can login again with the username vkarbasizaed.</p><p>If you have any questions, please contact me from your <a href=\"http://localhost/index.php/publicknowledge/en/authorDashboard/submission/17\">submission dashboard</a>.</p><p>Thank you for considering Journal of Public Knowledge as a venue for your work.</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Journal of Public Knowledge</a>.</p>'),
(145,1048585,17,3,'2024-12-27 05:36:24',805306369,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Vajiheh Karbasizaed\" <vkarbasizaed@mailinator.com>','','','Your submission has been sent for review','<p>Dear Vajiheh Karbasizaed,</p><p>I am pleased to inform you that an editor has reviewed your submission, Antimicrobial, heavy metal resistance and plasmid profile of coliforms isolated from nosocomial infections in a hospital in Isfahan, Iran, and has decided to send it for peer review. An editor will identify qualified reviewers who will provide feedback on your submission.</p><p>This journal conducts double-anonymous peer review. The reviewers will not see any identifying information about you or your co-authors. Similarly, you will not know who reviewed your submission, and you will not hear from the reviewers directly. You will hear from us with feedback from the reviewers and information about the next steps.</p><p>Please note that sending the submission to peer review does not guarantee that it will be published. We will consider the reviewers\' recommendations before deciding to accept the submission for publication. You may be asked to make revisions and respond to the reviewers\' comments before a final decision is made.</p><p>If you have any questions, please contact me from your submission dashboard.</p><p><p>Daniel Barnes</p></p>'),
(146,1048585,17,3,'2024-12-27 05:36:30',1073741833,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Julie Janssen\" <jjanssen@mailinator.com>','','','Invitation to review','<p>Dear Julie Janssen,</p>\r\n<p>I believe that you would serve as an excellent reviewer for a submission to Journal of Public Knowledge. The submission\'s title and abstract are below, and I hope that you will consider undertaking this important task for us.</p>\r\n<p>If you are able to review this submission, your review is due by 2025-01-24. You can view the submission, upload review files, and submit your review by logging into the journal site and following the steps at the link below.</p>\r\n<p><a href=\"http://localhost/index.php/publicknowledge/en/reviewer/submission?submissionId=17\">Antimicrobial, heavy metal resistance and plasmid profile of coliforms isolated from nosocomial infections in a hospital in Isfahan, Iran</a></p>\r\n<p><strong>Abstract</strong></p>\r\n<p>The antimicrobial, heavy metal resistance patterns and plasmid profiles of Coliforms (Enterobacteriacea) isolated from nosocomial infections and healthy human faeces were compared. Fifteen of the 25 isolates from nosocomial infections were identified as Escherichia coli, and remaining as Kelebsiella pneumoniae. Seventy two percent of the strains isolated from nosocomial infections possess multiple resistance to antibiotics compared to 45% of strains from healthy human faeces. The difference between minimal inhibitory concentration (MIC) values of strains from clinical cases and from faeces for four heavy metals (Hg, Cu, Pb, Cd) was not significant. However most strains isolated from hospital were more tolerant to heavy metal than those from healthy persons. There was no consistent relationship between plasmid profile group and antimicrobial resistance pattern, although a conjugative plasmid (&gt;56.4 kb) encoding resistance to heavy metals and antibiotics was recovered from eight of the strains isolated from nosocomial infections. The results indicate multidrug-resistance coliforms as a potential cause of nosocomial infection in this region.</p>\r\n<p>Please <a href=\"http://localhost/index.php/publicknowledge/en/reviewer/submission?submissionId=17\">accept or decline</a> the review by <strong>2025-01-24</strong>.</p>\r\n<p>You may contact me with any questions about the submission or the review process.</p>\r\n<p>Thank you for considering this request. Your help is much appreciated.</p>\r\n<p>Kind regards,</p>\r\n<p>Daniel Barnes</p>'),
(147,1048585,17,3,'2024-12-27 05:36:32',1073741833,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Paul Hudson\" <phudson@mailinator.com>','','','Invitation to review','<p>Dear Paul Hudson,</p>\r\n<p>I believe that you would serve as an excellent reviewer for a submission to Journal of Public Knowledge. The submission\'s title and abstract are below, and I hope that you will consider undertaking this important task for us.</p>\r\n<p>If you are able to review this submission, your review is due by 2025-01-24. You can view the submission, upload review files, and submit your review by logging into the journal site and following the steps at the link below.</p>\r\n<p><a href=\"http://localhost/index.php/publicknowledge/en/reviewer/submission?submissionId=17\">Antimicrobial, heavy metal resistance and plasmid profile of coliforms isolated from nosocomial infections in a hospital in Isfahan, Iran</a></p>\r\n<p><strong>Abstract</strong></p>\r\n<p>The antimicrobial, heavy metal resistance patterns and plasmid profiles of Coliforms (Enterobacteriacea) isolated from nosocomial infections and healthy human faeces were compared. Fifteen of the 25 isolates from nosocomial infections were identified as Escherichia coli, and remaining as Kelebsiella pneumoniae. Seventy two percent of the strains isolated from nosocomial infections possess multiple resistance to antibiotics compared to 45% of strains from healthy human faeces. The difference between minimal inhibitory concentration (MIC) values of strains from clinical cases and from faeces for four heavy metals (Hg, Cu, Pb, Cd) was not significant. However most strains isolated from hospital were more tolerant to heavy metal than those from healthy persons. There was no consistent relationship between plasmid profile group and antimicrobial resistance pattern, although a conjugative plasmid (&gt;56.4 kb) encoding resistance to heavy metals and antibiotics was recovered from eight of the strains isolated from nosocomial infections. The results indicate multidrug-resistance coliforms as a potential cause of nosocomial infection in this region.</p>\r\n<p>Please <a href=\"http://localhost/index.php/publicknowledge/en/reviewer/submission?submissionId=17\">accept or decline</a> the review by <strong>2025-01-24</strong>.</p>\r\n<p>You may contact me with any questions about the submission or the review process.</p>\r\n<p>Thank you for considering this request. Your help is much appreciated.</p>\r\n<p>Kind regards,</p>\r\n<p>Daniel Barnes</p>'),
(148,1048585,17,3,'2024-12-27 05:36:36',805306369,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Vajiheh Karbasizaed\" <vkarbasizaed@mailinator.com>','','','Your submission has been accepted to Journal of Public Knowledge','<p>Dear Vajiheh Karbasizaed,</p><p>I am pleased to inform you that we have decided to accept your submission without further revision. After careful review, we found your submission, Antimicrobial, heavy metal resistance and plasmid profile of coliforms isolated from nosocomial infections in a hospital in Isfahan, Iran, to meet or exceed our expectations. We are excited to publish your piece in Journal of Public Knowledge and we thank you for choosing our journal as a venue for your work.</p><p>Your submission is now forthcoming in a future issue of Journal of Public Knowledge and you are welcome to include it in your list of publications. We recognize the hard work that goes into every successful submission and we want to congratulate you on reaching this stage.</p><p>Your submission will now undergo copy editing and formatting to prepare it for publication.</p><p>You will shortly receive further instructions.</p><p>If you have any questions, please contact me from your <a href=\"http://localhost/index.php/publicknowledge/en/authorDashboard/submission/17\">submission dashboard</a>.</p><p>Kind regards,</p><p>Daniel Barnes</p>'),
(149,1048585,17,3,'2024-12-27 05:36:46',805306369,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Vajiheh Karbasizaed\" <vkarbasizaed@mailinator.com>','','','Next steps for publishing your submission','<p>Dear Vajiheh Karbasizaed,</p><p>I am writing from Journal of Public Knowledge to let you know that the editing of your submission, Antimicrobial, heavy metal resistance and plasmid profile of coliforms isolated from nosocomial infections in a hospital in Isfahan, Iran, is complete. Your submission will now advance to the production stage, where the final galleys will be prepared for publication. We will contact you if we need any further assistance.</p><p>If you have any questions, please contact me from your <a href=\"http://localhost/index.php/publicknowledge/en/authorDashboard/submission/17\">submission dashboard</a>.</p><p>Kind regards,</p><p>Daniel Barnes</p>'),
(150,1048585,18,NULL,'2024-12-27 05:38:03',805306370,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Daniel Barnes\" <dbarnes@mailinator.com>','','','You have been assigned as an editor on a submission to Journal of Public Knowledge','<p>Dear Daniel Barnes,</p><p>The following submission has been assigned to you to see through the editorial process.</p><p><a href=\"http://localhost/index.php/publicknowledge/en/workflow/access/18\">Self-Organization in Multi-Level Institutions in Networked Environments</a><br />Valerie Williamson</p><p><b>Abstract</b></p>We compare a setting where actors individually decide whom to sanction with a setting where sanctions are only implemented when actors collectively agree that a certain actor should be sanctioned. Collective sanctioning decisions are problematic due to the difficulty of reaching consensus. However, when a decision is made collectively, perverse sanctioning (e.g. punishing high contributors) by individual actors is ruled out. Therefore, collective sanctioning decisions are likely to be in the interest of the whole group.<p>If you find the submission to be relevant for Journal of Public Knowledge, please forward the submission to the review stage by selecting \"Send to Review\" and then assign reviewers by clicking \"Add Reviewer\".</p><p>If the submission is not appropriate for this journal, please decline the submission.</p><p>Thank you in advance.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Journal of Public Knowledge</a>.</p>'),
(151,1048585,18,NULL,'2024-12-27 05:38:03',805306370,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"David Buskins\" <dbuskins@mailinator.com>','','','You have been assigned as an editor on a submission to Journal of Public Knowledge','<p>Dear David Buskins,</p><p>The following submission has been assigned to you to see through the editorial process.</p><p><a href=\"http://localhost/index.php/publicknowledge/en/workflow/access/18\">Self-Organization in Multi-Level Institutions in Networked Environments</a><br />Valerie Williamson</p><p><b>Abstract</b></p>We compare a setting where actors individually decide whom to sanction with a setting where sanctions are only implemented when actors collectively agree that a certain actor should be sanctioned. Collective sanctioning decisions are problematic due to the difficulty of reaching consensus. However, when a decision is made collectively, perverse sanctioning (e.g. punishing high contributors) by individual actors is ruled out. Therefore, collective sanctioning decisions are likely to be in the interest of the whole group.<p>If you find the submission to be relevant for Journal of Public Knowledge, please forward the submission to the review stage by selecting \"Send to Review\" and then assign reviewers by clicking \"Add Reviewer\".</p><p>If the submission is not appropriate for this journal, please decline the submission.</p><p>Thank you in advance.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Journal of Public Knowledge</a>.</p>'),
(152,1048585,18,NULL,'2024-12-27 05:38:03',805306370,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Stephanie Berardo\" <sberardo@mailinator.com>','','','You have been assigned as an editor on a submission to Journal of Public Knowledge','<p>Dear Stephanie Berardo,</p><p>The following submission has been assigned to you to see through the editorial process.</p><p><a href=\"http://localhost/index.php/publicknowledge/en/workflow/access/18\">Self-Organization in Multi-Level Institutions in Networked Environments</a><br />Valerie Williamson</p><p><b>Abstract</b></p>We compare a setting where actors individually decide whom to sanction with a setting where sanctions are only implemented when actors collectively agree that a certain actor should be sanctioned. Collective sanctioning decisions are problematic due to the difficulty of reaching consensus. However, when a decision is made collectively, perverse sanctioning (e.g. punishing high contributors) by individual actors is ruled out. Therefore, collective sanctioning decisions are likely to be in the interest of the whole group.<p>If you find the submission to be relevant for Journal of Public Knowledge, please forward the submission to the review stage by selecting \"Send to Review\" and then assign reviewers by clicking \"Add Reviewer\".</p><p>If the submission is not appropriate for this journal, please decline the submission.</p><p>Thank you in advance.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Journal of Public Knowledge</a>.</p>'),
(153,1048585,18,NULL,'2024-12-27 05:38:03',536870914,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Valerie Williamson\" <vwilliamson@mailinator.com>','','','Thank you for your submission to Journal of Public Knowledge','<p>Dear Valerie Williamson,</p><p>Thank you for your submission to Journal of Public Knowledge. We have received your submission, Self-Organization in Multi-Level Institutions in Networked Environments, and a member of our editorial team will see it soon. You will be sent an email when an initial decision is made, and we may contact you for further information.</p><p>You can view your submission and track its progress through the editorial process at the following location:</p><p>Submission URL: http://localhost/index.php/publicknowledge/en/authorDashboard/submission/18</p><p>If you have been logged out, you can login again with the username vwilliamson.</p><p>If you have any questions, please contact me from your <a href=\"http://localhost/index.php/publicknowledge/en/authorDashboard/submission/18\">submission dashboard</a>.</p><p>Thank you for considering Journal of Public Knowledge as a venue for your work.</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Journal of Public Knowledge</a>.</p>'),
(154,1048585,18,3,'2024-12-27 05:38:11',805306369,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Valerie Williamson\" <vwilliamson@mailinator.com>','','','Your submission has been declined','<p>Dear Valerie Williamson,</p><p>I’m sorry to inform you that, after reviewing your submission, Self-Organization in Multi-Level Institutions in Networked Environments, the editor has found that it does not meet our requirements for publication in Journal of Public Knowledge.</p><p>I wish you success if you consider submitting your work elsewhere.</p><p>Kind regards,</p><p>Daniel Barnes</p>'),
(155,1048585,19,NULL,'2024-12-27 05:38:23',805306370,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Daniel Barnes\" <dbarnes@mailinator.com>','','','You have been assigned as an editor on a submission to Journal of Public Knowledge','<p>Dear Daniel Barnes,</p><p>The following submission has been assigned to you to see through the editorial process.</p><p><a href=\"http://localhost/index.php/publicknowledge/en/workflow/access/19\">Finocchiaro: Arguments About Arguments</a><br />Zita Woods</p><p><b>Abstract</b></p>None.<p>If you find the submission to be relevant for Journal of Public Knowledge, please forward the submission to the review stage by selecting \"Send to Review\" and then assign reviewers by clicking \"Add Reviewer\".</p><p>If the submission is not appropriate for this journal, please decline the submission.</p><p>Thank you in advance.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Journal of Public Knowledge</a>.</p>'),
(156,1048585,19,NULL,'2024-12-27 05:38:23',805306370,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Minoti Inoue\" <minoue@mailinator.com>','','','You have been assigned as an editor on a submission to Journal of Public Knowledge','<p>Dear Minoti Inoue,</p><p>The following submission has been assigned to you to see through the editorial process.</p><p><a href=\"http://localhost/index.php/publicknowledge/en/workflow/access/19\">Finocchiaro: Arguments About Arguments</a><br />Zita Woods</p><p><b>Abstract</b></p>None.<p>If you find the submission to be relevant for Journal of Public Knowledge, please forward the submission to the review stage by selecting \"Send to Review\" and then assign reviewers by clicking \"Add Reviewer\".</p><p>If the submission is not appropriate for this journal, please decline the submission.</p><p>Thank you in advance.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Journal of Public Knowledge</a>.</p>'),
(157,1048585,19,NULL,'2024-12-27 05:38:23',536870914,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Zita Woods\" <zwoods@mailinator.com>','','','Thank you for your submission to Journal of Public Knowledge','<p>Dear Zita Woods,</p><p>Thank you for your submission to Journal of Public Knowledge. We have received your submission, Finocchiaro: Arguments About Arguments, and a member of our editorial team will see it soon. You will be sent an email when an initial decision is made, and we may contact you for further information.</p><p>You can view your submission and track its progress through the editorial process at the following location:</p><p>Submission URL: http://localhost/index.php/publicknowledge/en/authorDashboard/submission/19</p><p>If you have been logged out, you can login again with the username zwoods.</p><p>If you have any questions, please contact me from your <a href=\"http://localhost/index.php/publicknowledge/en/authorDashboard/submission/19\">submission dashboard</a>.</p><p>Thank you for considering Journal of Public Knowledge as a venue for your work.</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Journal of Public Knowledge</a>.</p>'),
(158,1048585,19,3,'2024-12-27 05:38:31',805306369,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Zita Woods\" <zwoods@mailinator.com>','','','Your submission has been sent for review','<p>Dear Zita Woods,</p><p>I am pleased to inform you that an editor has reviewed your submission, Finocchiaro: Arguments About Arguments, and has decided to send it for peer review. An editor will identify qualified reviewers who will provide feedback on your submission.</p><p>This journal conducts double-anonymous peer review. The reviewers will not see any identifying information about you or your co-authors. Similarly, you will not know who reviewed your submission, and you will not hear from the reviewers directly. You will hear from us with feedback from the reviewers and information about the next steps.</p><p>Please note that sending the submission to peer review does not guarantee that it will be published. We will consider the reviewers\' recommendations before deciding to accept the submission for publication. You may be asked to make revisions and respond to the reviewers\' comments before a final decision is made.</p><p>If you have any questions, please contact me from your submission dashboard.</p><p><p>Daniel Barnes</p></p>'),
(159,1048585,19,3,'2024-12-27 05:38:36',1073741833,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Paul Hudson\" <phudson@mailinator.com>','','','Invitation to review','<p>Dear Paul Hudson,</p>\r\n<p>I believe that you would serve as an excellent reviewer for a submission to Journal of Public Knowledge. The submission\'s title and abstract are below, and I hope that you will consider undertaking this important task for us.</p>\r\n<p>If you are able to review this submission, your review is due by 2025-01-24. You can view the submission, upload review files, and submit your review by logging into the journal site and following the steps at the link below.</p>\r\n<p><a href=\"http://localhost/index.php/publicknowledge/en/reviewer/submission?submissionId=19\">Finocchiaro: Arguments About Arguments</a></p>\r\n<p><strong>Abstract</strong></p>\r\n<p>None.</p>\r\n<p>Please <a href=\"http://localhost/index.php/publicknowledge/en/reviewer/submission?submissionId=19\">accept or decline</a> the review by <strong>2025-01-24</strong>.</p>\r\n<p>You may contact me with any questions about the submission or the review process.</p>\r\n<p>Thank you for considering this request. Your help is much appreciated.</p>\r\n<p>Kind regards,</p>\r\n<p>Daniel Barnes</p>'),
(160,1048585,19,3,'2024-12-27 05:38:38',1073741833,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Aisla McCrae\" <amccrae@mailinator.com>','','','Invitation to review','<p>Dear Aisla McCrae,</p>\r\n<p>I believe that you would serve as an excellent reviewer for a submission to Journal of Public Knowledge. The submission\'s title and abstract are below, and I hope that you will consider undertaking this important task for us.</p>\r\n<p>If you are able to review this submission, your review is due by 2025-01-24. You can view the submission, upload review files, and submit your review by logging into the journal site and following the steps at the link below.</p>\r\n<p><a href=\"http://localhost/index.php/publicknowledge/en/reviewer/submission?submissionId=19\">Finocchiaro: Arguments About Arguments</a></p>\r\n<p><strong>Abstract</strong></p>\r\n<p>None.</p>\r\n<p>Please <a href=\"http://localhost/index.php/publicknowledge/en/reviewer/submission?submissionId=19\">accept or decline</a> the review by <strong>2025-01-24</strong>.</p>\r\n<p>You may contact me with any questions about the submission or the review process.</p>\r\n<p>Thank you for considering this request. Your help is much appreciated.</p>\r\n<p>Kind regards,</p>\r\n<p>Daniel Barnes</p>'),
(161,1048585,19,3,'2024-12-27 05:38:42',805306369,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Zita Woods\" <zwoods@mailinator.com>','','','Your submission has been accepted to Journal of Public Knowledge','<p>Dear Zita Woods,</p><p>I am pleased to inform you that we have decided to accept your submission without further revision. After careful review, we found your submission, Finocchiaro: Arguments About Arguments, to meet or exceed our expectations. We are excited to publish your piece in Journal of Public Knowledge and we thank you for choosing our journal as a venue for your work.</p><p>Your submission is now forthcoming in a future issue of Journal of Public Knowledge and you are welcome to include it in your list of publications. We recognize the hard work that goes into every successful submission and we want to congratulate you on reaching this stage.</p><p>Your submission will now undergo copy editing and formatting to prepare it for publication.</p><p>You will shortly receive further instructions.</p><p>If you have any questions, please contact me from your <a href=\"http://localhost/index.php/publicknowledge/en/authorDashboard/submission/19\">submission dashboard</a>.</p><p>Kind regards,</p><p>Daniel Barnes</p>');
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
) ENGINE=InnoDB AUTO_INCREMENT=170 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='A record of users associated with an email log entry.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `email_log_users`
--

LOCK TABLES `email_log_users` WRITE;
/*!40000 ALTER TABLE `email_log_users` DISABLE KEYS */;
INSERT INTO `email_log_users` VALUES
(1,1,3),
(2,2,4),
(3,3,5),
(4,4,17),
(5,6,17),
(6,7,7),
(7,8,9),
(8,9,10),
(9,10,17),
(10,11,17),
(11,12,3),
(12,13,4),
(13,14,5),
(14,15,18),
(15,16,18),
(16,17,3),
(17,18,4),
(18,19,5),
(19,20,19),
(20,21,19),
(21,22,9),
(22,23,10),
(23,24,19),
(24,25,3),
(25,26,4),
(26,27,5),
(27,28,20),
(28,30,3),
(29,31,4),
(30,32,5),
(31,33,21),
(32,34,21),
(33,35,8),
(34,36,10),
(35,37,21),
(36,38,21),
(37,39,3),
(38,40,4),
(39,41,5),
(40,42,22),
(41,43,22),
(42,44,7),
(43,45,10),
(44,46,22),
(45,47,22),
(46,48,3),
(47,49,4),
(48,50,5),
(49,51,23),
(50,52,23),
(51,53,8),
(52,54,9),
(53,55,10),
(54,56,3),
(55,56,4),
(56,56,5),
(57,57,3),
(58,58,4),
(59,59,5),
(60,60,3),
(61,61,4),
(62,62,5),
(63,63,24),
(64,65,3),
(65,66,6),
(66,67,25),
(67,68,25),
(68,69,7),
(69,70,10),
(70,71,25),
(71,72,25),
(72,73,3),
(73,74,4),
(74,75,5),
(75,76,26),
(76,77,26),
(77,78,9),
(78,79,10),
(79,80,3),
(80,80,4),
(81,80,5),
(82,81,3),
(83,82,4),
(84,83,5),
(85,84,3),
(86,84,4),
(87,84,5),
(88,85,3),
(89,86,4),
(90,87,5),
(91,88,3),
(92,89,4),
(93,90,5),
(94,91,27),
(95,93,3),
(96,94,4),
(97,95,5),
(98,96,28),
(99,97,28),
(100,98,7),
(101,99,8),
(102,100,3),
(103,101,4),
(104,102,5),
(105,103,29),
(106,104,29),
(107,105,7),
(108,106,9),
(109,107,10),
(110,108,3),
(111,108,4),
(112,108,5),
(113,109,3),
(114,110,4),
(115,111,5),
(116,112,3),
(117,112,4),
(118,112,5),
(119,113,3),
(120,114,4),
(121,115,5),
(122,116,3),
(123,116,4),
(124,116,5),
(125,117,3),
(126,118,4),
(127,119,5),
(128,120,29),
(129,121,7),
(130,122,9),
(131,123,10),
(132,124,3),
(133,125,4),
(134,126,5),
(135,127,30),
(136,128,3),
(137,129,4),
(138,130,5),
(139,131,31),
(140,132,31),
(141,133,8),
(142,134,9),
(143,135,31),
(144,136,31),
(145,137,3),
(146,138,4),
(147,139,5),
(148,140,32),
(149,141,3),
(150,142,4),
(151,143,5),
(152,144,33),
(153,145,33),
(154,146,7),
(155,147,8),
(156,148,33),
(157,149,33),
(158,150,3),
(159,151,4),
(160,152,5),
(161,153,34),
(162,154,34),
(163,155,3),
(164,156,6),
(165,157,35),
(166,158,35),
(167,159,8),
(168,160,9),
(169,161,35);
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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='Custom email templates created by each context, and overrides of the default templates.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `email_templates`
--

LOCK TABLES `email_templates` WRITE;
/*!40000 ALTER TABLE `email_templates` DISABLE KEYS */;
INSERT INTO `email_templates` VALUES
(1,'COPYEDIT_REQUEST',1,'DISCUSSION_NOTIFICATION_COPYEDITING'),
(2,'EDITOR_ASSIGN_SUBMISSION',1,'DISCUSSION_NOTIFICATION_SUBMISSION'),
(3,'EDITOR_ASSIGN_REVIEW',1,'DISCUSSION_NOTIFICATION_REVIEW'),
(4,'EDITOR_ASSIGN_PRODUCTION',1,'DISCUSSION_NOTIFICATION_PRODUCTION'),
(5,'LAYOUT_REQUEST',1,'DISCUSSION_NOTIFICATION_PRODUCTION'),
(6,'LAYOUT_COMPLETE',1,'DISCUSSION_NOTIFICATION_PRODUCTION');
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
) ENGINE=InnoDB AUTO_INCREMENT=289 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='Default email templates created for every installed locale.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `email_templates_default_data`
--

LOCK TABLES `email_templates_default_data` WRITE;
/*!40000 ALTER TABLE `email_templates_default_data` DISABLE KEYS */;
INSERT INTO `email_templates_default_data` VALUES
(1,'PASSWORD_RESET_CONFIRM','en','Password Reset Confirm','Password Reset Confirmation','We have received a request to reset your password for the {$siteTitle} web site.<br />\n<br />\nIf you did not make this request, please ignore this email and your password will not be changed. If you wish to reset your password, click on the below URL.<br />\n<br />\nReset my password: {$passwordResetUrl}<br />\n<br />\n{$siteContactName}'),
(3,'USER_REGISTER','en','User Created','Journal Registration','{$recipientName}<br />\n<br />\nYou have now been registered as a user with {$journalName}. We have included your username and password in this email, which are needed for all work with this journal through its website. At any point, you can ask to be removed from the journal\'s list of users by contacting me.<br />\n<br />\nUsername: {$recipientUsername}<br />\nPassword: {$password}<br />\n<br />\nThank you,<br />\n{$signature}'),
(5,'USER_VALIDATE_CONTEXT','en','Validate Email (Journal Registration)','Validate Your Account','{$recipientName}<br />\n<br />\nYou have created an account with {$journalName}, but before you can start using it, you need to validate your email account. To do this, simply follow the link below:<br />\n<br />\n{$activateUrl}<br />\n<br />\nThank you,<br />\n{$journalSignature}'),
(7,'USER_VALIDATE_SITE','en','Validate Email (Site)','Validate Your Account','{$recipientName}<br />\n<br />\nYou have created an account with {$siteTitle}, but before you can start using it, you need to validate your email account. To do this, simply follow the link below:<br />\n<br />\n{$activateUrl}<br />\n<br />\nThank you,<br />\n{$siteSignature}'),
(9,'REVIEWER_REGISTER','en','Reviewer Register','Registration as Reviewer with {$journalName}','<p>Dear {$recipientName},</p><p>In light of your expertise, we have registered your name in the reviewer database for {$journalName}. This does not entail any form of commitment on your part, but simply enables us to approach you with a submission to possibly review. On being invited to review, you will have an opportunity to see the title and abstract of the paper in question, and you\'ll always be in a position to accept or decline the invitation. You can also ask at any point to have your name removed from this reviewer list.</p><p>We are providing you with a username and password, which is used in all interactions with the journal through its website. You may wish, for example, to update your profile, including your reviewing interests.</p><p>Username: {$recipientUsername}<br />Password: {$password}</p><p>Thank you,</p>{$signature}'),
(11,'ISSUE_PUBLISH_NOTIFY','en','Issue Published Notify','Just published: {$issueIdentification} of {$journalName}','<p>Dear {$recipientName},</p><p>We are pleased to announce the publication of <a href=\"{$issueUrl}\">{$issueIdentification}</a> of {$journalName}.  We invite you to read and share this work with your scholarly community.</p><p>Many thanks to our authors, reviewers, and editors for their valuable contributions, and to our readers for your continued interest.</p><div>{$issueToc}</div><p>Thank you,</p>{$signature}'),
(13,'SUBMISSION_ACK','en','Submission Confirmation','Thank you for your submission to {$journalName}','<p>Dear {$recipientName},</p><p>Thank you for your submission to {$journalName}. We have received your submission, {$submissionTitle}, and a member of our editorial team will see it soon. You will be sent an email when an initial decision is made, and we may contact you for further information.</p><p>You can view your submission and track its progress through the editorial process at the following location:</p><p>Submission URL: {$authorSubmissionUrl}</p><p>If you have been logged out, you can login again with the username {$recipientUsername}.</p><p>If you have any questions, please contact me from your <a href=\"{$authorSubmissionUrl}\">submission dashboard</a>.</p><p>Thank you for considering {$journalName} as a venue for your work.</p>{$journalSignature}'),
(15,'SUBMISSION_ACK_NOT_USER','en','Submission Confirmation (Other Authors)','Submission confirmation','<p>Dear {$recipientName},</p><p>You have been named as a co-author on a submission to {$journalName}. The submitter, {$submitterName}, provided the following details:</p><p>{$submissionTitle}<br>{$authorsWithAffiliation}</p><p>If any of these details are incorrect, or you do not wish to be named on this submission, please contact me.</p><p>Thank you for considering {$journalName} as a venue for your work.</p><p>Kind regards,</p>{$journalSignature}'),
(17,'EDITOR_ASSIGN','en','Editor Assigned','You have been assigned as an editor on a submission to {$journalName}','<p>Dear {$recipientName},</p><p>The following submission has been assigned to you to see through the editorial process.</p><p><a href=\"{$submissionUrl}\">{$submissionTitle}</a><br />{$authors}</p><p><b>Abstract</b></p>{$submissionAbstract}<p>If you find the submission to be relevant for {$journalName}, please forward the submission to the review stage by selecting \"Send to Review\" and then assign reviewers by clicking \"Add Reviewer\".</p><p>If the submission is not appropriate for this journal, please decline the submission.</p><p>Thank you in advance.</p><p>Kind regards,</p>{$journalSignature}'),
(19,'REVIEW_CANCEL','en','Reviewer Unassign','Request for Review Cancelled','<p>Dear {$recipientName},</p><p>Recently, we asked you to review a submission to {$journalName}. We have decided to cancel the request for you to reivew the submission, {$submissionTitle}.</p><p>We apologize any inconvenience this may cause you and hope that we will be able to call on you to assist with this journal\'s review process in the future.</p><p>If you have any questions, please contact me.</p>{$signature}'),
(21,'REVIEW_REINSTATE','en','Reviewer Reinstate','Can you still review something for {$journalName}?','<p>Dear {$recipientName},</p><p>We recently cancelled our request for you to review a submission, {$submissionTitle}, for {$journalName}. We\'ve reversed that decision and we hope that you are still able to conduct the review.</p><p>If you are able to assist with this submission\'s review, you can <a href=\"{$reviewAssignmentUrl}\">login to the journal</a> to view the submission, upload review files, and submit your review request.</p><p>If you have any questions, please contact me.</p><p>Kind regards,</p>{$signature}'),
(23,'REVIEW_RESEND_REQUEST','en','Resend Review Request to Reviewer','Requesting your review again for {$journalName}','<p>Dear {$recipientName},</p><p>Recently, you declined our request to review a submission, {$submissionTitle}, for {$journalName}. I\'m writing to see if you are able to conduct the review after all.</p><p>We would be grateful if you\'re able to perform this review, but we understand if that is not possible at this time. Either way, please <a href=\"{$reviewAssignmentUrl}\">accept or decline the request</a> by {$responseDueDate}, so that we can find an alternate reviewer.</p><p>If you have any questions, please contact me.</p><p>Kind regards,</p>{$signature}'),
(25,'REVIEW_REQUEST','en','Review Request','Invitation to review','<p>Dear {$recipientName},</p><p>I believe that you would serve as an excellent reviewer for a submission  to {$journalName}. The submission\'s title and abstract are below, and I hope that you will consider undertaking this important task for us.</p><p>If you are able to review this submission, your review is due by {$reviewDueDate}. You can view the submission, upload review files, and submit your review by logging into the journal site and following the steps at the link below.</p><p><a href=\"{$reviewAssignmentUrl}\">{$submissionTitle}</a></p><p><b>Abstract</b></p>{$submissionAbstract}<p>Please <a href=\"{$reviewAssignmentUrl}\">accept or decline</a> the review by <b>{$responseDueDate}</b>.</p><p>You may contact me with any questions about the submission or the review process.</p><p>Thank you for considering this request. Your help is much appreciated.</p><p>Kind regards,</p>{$signature}'),
(27,'REVIEW_REQUEST_SUBSEQUENT','en','Review Request Subsequent','Request to review a revised submission','<p>Dear {$recipientName},</p><p>Thank you for your review of <a href=\"{$reviewAssignmentUrl}\">{$submissionTitle}</a>. The authors have considered the reviewers\' feedback and have now submitted a revised version of their work. I\'m writing to ask if you would conduct a second round of peer review for this submission.</p><p>If you are able to review this submission, your review is due by {$reviewDueDate}. You can <a href=\"{$reviewAssignmentUrl}\">follow the review steps</a> to view the submission, upload review files, and submit your review comments.<p><p><a href=\"{$reviewAssignmentUrl}\">{$submissionTitle}</a></p><p><b>Abstract</b></p>{$submissionAbstract}<p>Please <a href=\"{$reviewAssignmentUrl}\">accept or decline</a> the review by <b>{$responseDueDate}</b>.</p><p>Please feel free to contact me with any questions about the submission or the review process.</p><p>Thank you for considering this request. Your help is much appreciated.</p><p>Kind regards,</p>{$signature}'),
(29,'REVIEW_RESPONSE_OVERDUE_AUTO','en','Review Response Overdue (Automated)','Will you be able to review this for us?','<p>Dear {$recipientName},</p><p>This email is an automated reminder from {$journalName} in regards to our request for your review of the submission, \"{$submissionTitle}.\"</p><p>You are receiving this email because we have not yet received a confirmation from you indicating whether or not you are able to undertake the review of this submission.</p><p>Please let us know whether or not you are able to undertake this review by using our submission management software to accept or decline this request.</p><p>If you are able to review this submission, your review is due by {$reviewDueDate}. You can follow the review steps to view the submission, upload review files, and submit your review comments.</p><p><a href=\"{$reviewAssignmentUrl}\">{$submissionTitle}</a></p><p><b>Abstract</b></p>{$submissionAbstract}<p>Please feel free to contact me with any questions about the submission or the review process.</p><p>Thank you for considering this request. Your help is much appreciated.</p><p>Kind regards,</p>{$journalSignature}'),
(31,'REVIEW_CONFIRM','en','Review Confirm','Review accepted: {$reviewerName} accepted review assignment for #{$submissionId} {$authorsShort} — {$submissionTitle}','<p>Dear {$recipientName},</p><p>{$reviewerName} has accepted the following review:</p><p><a href=\"{$submissionUrl}\">#{$submissionId} {$authorsShort} — {$submissionTitle}</a><br /><b>Type:</b> {$reviewMethod}</p><p><b>Review Due:</b> {$reviewDueDate}</p><p>Login to <a href=\"{$submissionUrl}\">view all reviewer assignments</a> for this submission.</p><br><br>—<br>This is an automated message from <a href=\"{$journalUrl}\">{$journalName}</a>.'),
(33,'REVIEW_DECLINE','en','Review Decline','Unable to Review','Editors:<br />\n<br />\nI am afraid that at this time I am unable to review the submission, &quot;{$submissionTitle},&quot; for {$journalName}. Thank you for thinking of me, and another time feel free to call on me.<br />\n<br />\n{$senderName}'),
(35,'REVIEW_ACK','en','Review Acknowledgement','Thank you for your review','<p>Dear {$recipientName},</p>\n<p>Thank you for completing your review of the submission, {$submissionTitle}, for {$journalName}. We appreciate your time and expertise in contributing to the quality of the work that we publish.</p>\n<p>It has been a pleasure to work with you as a reviewer for {$journalName}, and we hope to have the opportunity to work with you again in the future.</p>\n<p>Kind regards,</p>\n<p>{$signature}</p>'),
(37,'REVIEW_REMIND','en','Review Reminder','A reminder to please complete your review','<p>Dear {$recipientName},</p><p>Just a gentle reminder of our request for your review of the submission, \"{$submissionTitle},\" for {$journalName}. We were expecting to have this review by {$reviewDueDate} and we would be pleased to receive it as soon as you are able to prepare it.</p><p>You can <a href=\"{$reviewAssignmentUrl}\">login to the journal</a> and follow the review steps to view the submission, upload review files, and submit your review comments.</p><p>If you need an extension of the deadline, please contact me. I look forward to hearing from you.</p><p>Thank you in advance and kind regards,</p>{$signature}'),
(39,'REVIEW_REMIND_AUTO','en','Review Reminder (Automated)','A reminder to please complete your review','<p>Dear {$recipientName}:</p><p>This email is an automated reminder from {$journalName} in regards to our request for your review of the submission, \"{$submissionTitle}.\"</p><p>We were expecting to have this review by {$reviewDueDate} and we would be pleased to receive it as soon as you are able to prepare it.</p><p>Please <a href=\"{$reviewAssignmentUrl}\">login to the journal</a> and follow the review steps to view the submission, upload review files, and submit your review comments.</p><p>If you need an extension of the deadline, please contact me. I look forward to hearing from you.</p><p>Thank you in advance and kind regards,</p>{$journalSignature}'),
(41,'REVIEW_COMPLETE','en','Review Completed','Review complete: {$reviewerName} recommends {$reviewRecommendation} for #{$submissionId} {$authorsShort} — {$submissionTitle}','<p>Dear {$recipientName},</p><p>{$reviewerName} completed the following review:</p><p><a href=\"{$submissionUrl}\">#{$submissionId} {$authorsShort} — {$submissionTitle}</a><br /><b>Recommendation:</b> {$reviewRecommendation}<br /><b>Type:</b> {$reviewMethod}</p><p>Login to <a href=\"{$submissionUrl}\">view all files and comments</a> provided by this reviewer.</p>'),
(43,'REVIEW_EDIT','en','Review Edited','Your review assignment has been changed for {$journalName}','<p>Dear {$recipientName},</p><p>An editor has made changes to your review assignment for {$journalName}. Please review the details below and let us know if you have any questions.</p><p><a href=\"{$reviewAssignmentUrl}\">{$submissionTitle}</a><br /><b>Type:</b> {$reviewMethod}<br /><b>Accept or Decline By:</b> {$responseDueDate}<br /><b>Submit Review By:</b> {$reviewDueDate}</p><p>You can login to <a href=\"{$reviewAssignmentUrl}\">complete this review</a> at any time.</p>'),
(45,'EDITOR_DECISION_ACCEPT','en','Submission Accepted','Your submission has been accepted to {$journalName}','<p>Dear {$recipientName},</p><p>I am pleased to inform you that we have decided to accept your submission without further revision. After careful review, we found your submission, {$submissionTitle}, to meet or exceed our expectations. We are excited to publish your piece in {$journalName} and we thank you for choosing our journal as a venue for your work.</p><p>Your submission is now forthcoming in a future issue of {$journalName} and you are welcome to include it in your list of publications. We recognize the hard work that goes into every successful submission and we want to congratulate you on reaching this stage.</p><p>Your submission will now undergo copy editing and formatting to prepare it for publication.</p><p>You will shortly receive further instructions.</p><p>If you have any questions, please contact me from your <a href=\"{$authorSubmissionUrl}\">submission dashboard</a>.</p><p>Kind regards,</p>{$signature}'),
(47,'EDITOR_DECISION_SEND_TO_EXTERNAL','en','Sent to Review','Your submission has been sent for review','<p>Dear {$recipientName},</p><p>I am pleased to inform you that an editor has reviewed your submission, {$submissionTitle}, and has decided to send it for peer review. An editor will identify qualified reviewers who will provide feedback on your submission.</p><p>{$reviewTypeDescription} You will hear from us with feedback from the reviewers and information about the next steps.</p><p>Please note that sending the submission to peer review does not guarantee that it will be published. We will consider the reviewers\' recommendations before deciding to accept the submission for publication. You may be asked to make revisions and respond to the reviewers\' comments before a final decision is made.</p><p>If you have any questions, please contact me from your submission dashboard.</p><p>{$signature}</p>'),
(49,'EDITOR_DECISION_SEND_TO_PRODUCTION','en','Sent to Production','Next steps for publishing your submission','<p>Dear {$recipientName},</p><p>I am writing from {$journalName} to let you know that the editing of your submission, {$submissionTitle}, is complete. Your submission will now advance to the production stage, where the final galleys will be prepared for publication. We will contact you if we need any further assistance.</p><p>If you have any questions, please contact me from your <a href=\"{$authorSubmissionUrl}\">submission dashboard</a>.</p><p>Kind regards,</p>{$signature}'),
(51,'EDITOR_DECISION_REVISIONS','en','Revisions Requested','Your submission has been reviewed and we encourage you to submit revisions','<p>Dear {$recipientName},</p><p>Your submission {$submissionTitle} has been reviewed and we would like to encourage you to submit revisions that address the reviewers\' comments. An editor will review these revisions and if they address the concerns adequately, your submission may be accepted for publication.</p><p>The reviewers\' comments are included at the bottom of this email. Please respond to each point in the reviewers\' comments and identify what changes you have made. If you find any of the reviewer\'s comments to be unjustified or inappropriate, please explain your perspective.</p><p>When you have completed your revisions, you can upload revised documents along with your response to the reviewers\' comments at your <a href=\"{$authorSubmissionUrl}\">submission dashboard</a>. If you have been logged out, you can login again with the username {$recipientUsername}.</p><p>If you have any questions, please contact me from your <a href=\"{$authorSubmissionUrl}\">submission dashboard</a>.</p><p>We look forward to receiving your revised submission.</p><p>Kind regards,</p>{$signature}<hr><p>The following comments were received from reviewers.</p>{$allReviewerComments}'),
(53,'EDITOR_DECISION_RESUBMIT','en','Resubmit for Review','Your submission has been reviewed - please revise and resubmit','<p>Dear {$recipientName},</p><p>After reviewing your submission, {$submissionTitle}, the reviewers have recommended that your submission cannot be accepted for publication in its current form. However, we would like to encourage you to submit a revised version that addresses the reviewers\' comments. Your revisions will be reviewed by an editor and may be sent out for another round of peer review.</p><p>Please note that resubmitting your work does not guarantee that it will be accepted.</p><p>The reviewers\' comments are included at the bottom of this email. Please respond to each point and identify what changes you have made. If you find any of the reviewer\'s comments inappropriate, please explain your perspective. If you have questions about the recommendations in your review, please include these in your response.</p><p>When you have completed your revisions, you can upload revised documents along with your response to the reviewers\' comments <a href=\"{$authorSubmissionUrl}\">at your submission dashboard</a>. If you have been logged out, you can login again with the username {$recipientUsername}.</p><p>If you have any questions, please contact me from your <a href=\"{$authorSubmissionUrl}\">submission dashboard</a>.</p><p>We look forward to receiving your revised submission.</p><p>Kind regards,</p>{$signature}<hr><p>The following comments were received from reviewers.</p>{$allReviewerComments}'),
(55,'EDITOR_DECISION_DECLINE','en','Submission Declined','Your submission has been declined','<p>Dear {$recipientName},</p><p>While we appreciate receiving your submission, we are unable to accept {$submissionTitle} for publication on the basis of the comments from reviewers.</p><p>The reviewers\' comments are included at the bottom of this email.</p><p>Thank you for submitting to {$journalName}. Although it is disappointing to have a submission declined, I hope you find the reviewers\' comments to be constructive and helpful.</p><p>You are now free to submit the work elsewhere if you choose to do so.</p><p>Kind regards,</p>{$signature}<hr><p>The following comments were received from reviewers.</p>{$allReviewerComments}'),
(57,'EDITOR_DECISION_INITIAL_DECLINE','en','Submission Declined (Pre-Review)','Your submission has been declined','<p>Dear {$recipientName},</p><p>I’m sorry to inform you that, after reviewing your submission, {$submissionTitle}, the editor has found that it does not meet our requirements for publication in {$journalName}.</p><p>I wish you success if you consider submitting your work elsewhere.</p><p>Kind regards,</p>{$signature}'),
(59,'EDITOR_RECOMMENDATION','en','Recommendation Made','Editor Recommendation','<p>Dear {$recipientName},</p><p>After considering the reviewers\' feedback, I would like to make the following recommendation regarding the submission {$submissionTitle}.</p><p>My recommendation is: {$recommendation}.</p><p>Please visit the submission\'s <a href=\"{$submissionUrl}\">editorial workflow</a> to act on this recommendation.</p><p>Please feel free to contact me with any questions.</p><p>Kind regards,</p><p>{$senderName}</p>'),
(61,'EDITOR_DECISION_NOTIFY_OTHER_AUTHORS','en','Notify Other Authors','An update regarding your submission','<p>The following email was sent to {$submittingAuthorName} from {$journalName} regarding {$submissionTitle}.</p>\n<p>You are receiving a copy of this notification because you are identified as an author of the submission. Any instructions in the message below are intended for the submitting author, {$submittingAuthorName}, and no action is required of you at this time.</p>\n\n{$messageToSubmittingAuthor}'),
(63,'EDITOR_DECISION_NOTIFY_REVIEWERS','en','Notify Reviewers of Decision','Thank you for your review','<p>Dear {$recipientName},</p>\n<p>Thank you for completing your review of the submission, {$submissionTitle}, for {$journalName}. We appreciate your time and expertise in contributing to the quality of the work that we publish. We have shared your comments with the authors, along with our other reviewers\' comments and the editor\'s decision.</p>\n<p>Based on the feedback we received, we have notified the authors of the following:</p>\n<p>{$decisionDescription}</p>\n<p>Your recommendation was considered alongside the recommendations of other reviewers before coming to a decision. Occasionally the editor\'s decision may differ from the recommendation made by one or more reviewers. The editor considers many factors, and does not take these decisions lightly. We are grateful for our reviewers\' expertise and suggestions.</p>\n<p>It has been a pleasure to work with you as a reviewer for {$journalName}, and we hope to have the opportunity to work with you again in the future.</p>\n<p>Kind regards,</p>\n<p>{$signature}</p>'),
(65,'EDITOR_DECISION_NEW_ROUND','en','New Review Round Initiated','Your submission has been sent for another round of review','<p>Dear {$recipientName},</p>\n<p>Your revised submission, {$submissionTitle}, has been sent for a new round of peer review. \nYou will hear from us with feedback from the reviewers and information about the next steps.</p>\n<p>If you have any questions, please contact me from your <a href=\"{$authorSubmissionUrl}\">submission dashboard</a>.</p>\n<p>Kind regards,</p>\n<p>{$signature}</p>\n'),
(67,'EDITOR_DECISION_REVERT_DECLINE','en','Reinstate Declined Submission','We have reversed the decision to decline your submission','<p>Dear {$recipientName},</p>\n<p>The decision to decline your submission, {$submissionTitle}, has been reversed. \nAn editor will complete the round of review and you will be notified when a \ndecision is made.</p>\n<p>Occasionally, a decision to decline a submission will be recorded accidentally in \nour system and must be reverted. I apologize for any confusion this may have caused.</p>\n<p>We will contact you if we need any further assistance.</p>\n<p>If you have any questions, please contact me from your <a href=\"{$authorSubmissionUrl}\">submission dashboard</a>.</p>\n<p>Kind regards,</p>\n<p>{$signature}</p>\n'),
(69,'EDITOR_DECISION_REVERT_INITIAL_DECLINE','en','Reinstate Submission Declined Without Review','We have reversed the decision to decline your submission','<p>Dear {$recipientName},</p>\n<p>The decision to decline your submission, {$submissionTitle}, has been reversed. \nAn editor will look further at your submission before deciding whether to decline \nthe submission or send it for review.</p>\n<p>Occasionally, a decision to decline a submission will be recorded accidentally in \nour system and must be reverted. I apologize for any confusion this may have caused.</p>\n<p>We will contact you if we need any further assistance.</p>\n<p>If you have any questions, please contact me from your <a href=\"{$authorSubmissionUrl}\">submission dashboard</a>.</p>\n<p>Kind regards,</p>\n<p>{$signature}</p>\n'),
(71,'EDITOR_DECISION_SKIP_REVIEW','en','Submission Accepted (Without Review)','Your submission has been sent for copyediting','<p>Dear {$recipientName},</p>\n<p>I am pleased to inform you that we have decided to accept your submission without peer review. We found your submission, {$submissionTitle}, to meet our expectations, and we do not require that work of this type undergo peer review. We are excited to publish your piece in {$journalName} and we thank you for choosing our journal as a venue for your work.</p>\nYour submission is now forthcoming in a future issue of {$journalName} and you are welcome to include it in your list of publications. We recognize the hard work that goes into every successful submission and we want to congratulate you on your efforts.</p>\n<p>Your submission will now undergo copy editing and formatting to prepare it for publication. </p>\n<p>You will shortly receive further instructions.</p>\n<p>If you have any questions, please contact me from your <a href=\"{$authorSubmissionUrl}\">submission dashboard</a>.</p>\n<p>Kind regards,</p>\n<p>{$signature}</p>\n'),
(73,'EDITOR_DECISION_BACK_FROM_PRODUCTION','en','Submission Sent Back to Copyediting','Your submission has been sent back to copyediting','<p>Dear {$recipientName},</p><p>Your submission, {$submissionTitle}, has been sent back to the copyediting stage, where it will undergo further copyediting and formatting to prepare it for publication.</p><p>Occasionally, a submission is sent to the production stage before it is ready for the final galleys to be prepared for publication. Your submission is still forthcoming. I apologize for any confusion.</p><p>If you have any questions, please contact me from your <a href=\"{$authorSubmissionUrl}\">submission dashboard</a>.</p><p>We will contact you if we need any further assistance.</p><p>Kind regards,</p><p>{$signature}</p>'),
(75,'EDITOR_DECISION_BACK_FROM_COPYEDITING','en','Submission Sent Back from Copyediting','Your submission has been sent back to review','<p>Dear {$recipientName},</p><p>Your submission, {$submissionTitle}, has been sent back to the review stage. It will undergo further review before it can be accepted for publication.</p><p>Occasionally, a decision to accept a submission will be recorded accidentally in our system and we must send it back to review. I apologize for any confusion this has caused. We will work to complete any further review quickly so that you have a final decision as soon as possible.</p><p>We will contact you if we need any further assistance.</p><p>If you have any questions, please contact me from your <a href=\"{$authorSubmissionUrl}\">submission dashboard</a>.</p><p>Kind regards,</p><p>{$signature}</p>'),
(77,'EDITOR_DECISION_CANCEL_REVIEW_ROUND','en','Review Round Cancelled','A review round for your submission has been cancelled','<p>Dear {$recipientName},</p><p>We recently opened a new review round for your submission, {$submissionTitle}. We are closing this review round now.</p><p>Occasionally, a decision to open a round of review will be recorded accidentally in our system and we must cancel this review round. I apologize for any confusion this may have caused.</p><p>We will contact you if we need any further assistance.</p><p>If you have any questions, please contact me from your <a href=\"{$authorSubmissionUrl}\">submission dashboard</a>.</p><p>Kind regards,</p><p>{$signature}</p>'),
(79,'SUBSCRIPTION_NOTIFY','en','Subscription Notify','Subscription Notification','{$recipientName}:<br />\n<br />\nYou have now been registered as a subscriber in our online journal management system for {$journalName}, with the following subscription:<br />\n<br />\n{$subscriptionType}<br />\n<br />\nTo access content that is available only to subscribers, simply log in to the system with your username, &quot;{$recipientUsername}&quot;.<br />\n<br />\nOnce you have logged in to the system you can change your profile details and password at any point.<br />\n<br />\nPlease note that if you have an institutional subscription, there is no need for users at your institution to log in, since requests for subscription content will be automatically authenticated by the system.<br />\n<br />\nIf you have any questions, please feel free to contact me.<br />\n<br />\n{$subscriptionSignature}'),
(81,'OPEN_ACCESS_NOTIFY','en','Open Access Notify','Free to read: {$issueIdentification} of {$journalName} is now open access','<p>Dear {$recipientName},</p><p>We are pleased to inform you that <a href=\"{$issueUrl}\">{$issueIdentification}</a> of {$journalName} is now available under open access.  A subscription is no longer required to read this issue.</p><p>Thank you for your continuing interest in our work.</p>{$journalSignature}'),
(83,'SUBSCRIPTION_BEFORE_EXPIRY','en','Subscription Expires Soon','Notice of Subscription Expiry','{$recipientName}:<br />\n<br />\nYour {$journalName} subscription is about to expire.<br />\n<br />\n{$subscriptionType}<br />\nExpiry date: {$expiryDate}<br />\n<br />\nTo ensure the continuity of your access to this journal, please go to the journal website and renew your subscription. You are able to log in to the system with your username, &quot;{$recipientUsername}&quot;.<br />\n<br />\nIf you have any questions, please feel free to contact me.<br />\n<br />\n{$subscriptionSignature}'),
(85,'SUBSCRIPTION_AFTER_EXPIRY','en','Subscription Expired','Subscription Expired','{$recipientName}:<br />\n<br />\nYour {$journalName} subscription has expired.<br />\n<br />\n{$subscriptionType}<br />\nExpiry date: {$expiryDate}<br />\n<br />\nTo renew your subscription, please go to the journal website. You are able to log in to the system with your username, &quot;{$recipientUsername}&quot;.<br />\n<br />\nIf you have any questions, please feel free to contact me.<br />\n<br />\n{$subscriptionSignature}'),
(87,'SUBSCRIPTION_AFTER_EXPIRY_LAST','en','Subscription Expired Last','Subscription Expired - Final Reminder','{$recipientName}:<br />\n<br />\nYour {$journalName} subscription has expired.<br />\nPlease note that this is the final reminder that will be emailed to you.<br />\n<br />\n{$subscriptionType}<br />\nExpiry date: {$expiryDate}<br />\n<br />\nTo renew your subscription, please go to the journal website. You are able to log in to the system with your username, &quot;{$recipientUsername}&quot;.<br />\n<br />\nIf you have any questions, please feel free to contact me.<br />\n<br />\n{$subscriptionSignature}'),
(89,'SUBSCRIPTION_PURCHASE_INDL','en','Purchase Individual Subscription','Subscription Purchase: Individual','An individual subscription has been purchased online for {$journalName} with the following details.<br />\n<br />\nSubscription Type:<br />\n{$subscriptionType}<br />\n<br />\nUser:<br />\n{$subscriberDetails}<br />\n<br />\nMembership Information (if provided):<br />\n{$membership}<br />\n<br />\nTo view or edit this subscription, please use the following URL.<br />\n<br />\nSubscription URL: {$subscriptionUrl}<br />\n'),
(91,'SUBSCRIPTION_PURCHASE_INSTL','en','Purchase Institutional Subscription','Subscription Purchase: Institutional','An institutional subscription has been purchased online for {$journalName} with the following details. To activate this subscription, please use the provided Subscription URL and set the subscription status to \'Active\'.<br />\n<br />\nSubscription Type:<br />\n{$subscriptionType}<br />\n<br />\nInstitution:<br />\n{$institutionName}<br />\n{$institutionMailingAddress}<br />\n<br />\nDomain (if provided):<br />\n{$domain}<br />\n<br />\nIP Ranges (if provided):<br />\n{$ipRanges}<br />\n<br />\nContact Person:<br />\n{$subscriberDetails}<br />\n<br />\nMembership Information (if provided):<br />\n{$membership}<br />\n<br />\nTo view or edit this subscription, please use the following URL.<br />\n<br />\nSubscription URL: {$subscriptionUrl}<br />\n'),
(93,'SUBSCRIPTION_RENEW_INDL','en','Renew Individual Subscription','Subscription Renewal: Individual','An individual subscription has been renewed online for {$journalName} with the following details.<br />\n<br />\nSubscription Type:<br />\n{$subscriptionType}<br />\n<br />\nUser:<br />\n{$subscriberDetails}<br />\n<br />\nMembership Information (if provided):<br />\n{$membership}<br />\n<br />\nTo view or edit this subscription, please use the following URL.<br />\n<br />\nSubscription URL: {$subscriptionUrl}<br />\n'),
(95,'SUBSCRIPTION_RENEW_INSTL','en','Renew Institutional Subscription','Subscription Renewal: Institutional','An institutional subscription has been renewed online for {$journalName} with the following details.<br />\n<br />\nSubscription Type:<br />\n{$subscriptionType}<br />\n<br />\nInstitution:<br />\n{$institutionName}<br />\n{$institutionMailingAddress}<br />\n<br />\nDomain (if provided):<br />\n{$domain}<br />\n<br />\nIP Ranges (if provided):<br />\n{$ipRanges}<br />\n<br />\nContact Person:<br />\n{$subscriberDetails}<br />\n<br />\nMembership Information (if provided):<br />\n{$membership}<br />\n<br />\nTo view or edit this subscription, please use the following URL.<br />\n<br />\nSubscription URL: {$subscriptionUrl}<br />\n'),
(97,'REVISED_VERSION_NOTIFY','en','Revised Version Notification','Revised Version Uploaded','<p>Dear {$recipientName},</p><p>The author has uploaded revisions for the submission, <b>{$authorsShort} — {$submissionTitle}</b>. <p>As an assigned editor, we ask that you login and <a href=\"{$submissionUrl}\">view the revisions</a> and make a decision to accept, decline or send the submission for further review.</p><br><br>—<br>This is an automated message from <a href=\"{$journalUrl}\">{$journalName}</a>.'),
(99,'STATISTICS_REPORT_NOTIFICATION','en','Statistics Report Notification','Editorial activity for {$month}, {$year}','\n{$recipientName}, <br />\n<br />\nYour journal health report for {$month}, {$year} is now available. Your key stats for this month are below.<br />\n<ul>\n	<li>New submissions this month: {$newSubmissions}</li>\n	<li>Declined submissions this month: {$declinedSubmissions}</li>\n	<li>Accepted submissions this month: {$acceptedSubmissions}</li>\n	<li>Total submissions in the system: {$totalSubmissions}</li>\n</ul>\nLogin to the journal to view more detailed <a href=\"{$editorialStatsLink}\">editorial trends</a> and <a href=\"{$publicationStatsLink}\">published article stats</a>. A full copy of this month\'s editorial trends is attached.<br />\n<br />\nSincerely,<br />\n{$journalSignature}'),
(101,'ANNOUNCEMENT','en','New Announcement','{$announcementTitle}','<b>{$announcementTitle}</b><br />\n<br />\n{$announcementSummary}<br />\n<br />\nVisit our website to read the <a href=\"{$announcementUrl}\">full announcement</a>.'),
(103,'DISCUSSION_NOTIFICATION_SUBMISSION','en','Discussion (Submission)','A message regarding {$journalName}','Please enter your message.'),
(105,'DISCUSSION_NOTIFICATION_REVIEW','en','Discussion (Review)','A message regarding {$journalName}','Please enter your message.'),
(107,'DISCUSSION_NOTIFICATION_COPYEDITING','en','Discussion (Copyediting)','A message regarding {$journalName}','Please enter your message.'),
(109,'DISCUSSION_NOTIFICATION_PRODUCTION','en','Discussion (Production)','A message regarding {$journalName}','Please enter your message.'),
(111,'COPYEDIT_REQUEST','en','Request Copyedit','Submission {$submissionId} is ready to be copyedited for {$contextAcronym}','<p>Dear {$recipientName},</p><p>A new submission is ready to be copyedited:</p><p><a href\"{$submissionUrl}\">{$submissionId} — {$submissionTitle}</a><br />{$journalName}</p><p>Please follow these steps to complete this task:</p><ol><li>Click on the Submission URL below.</li><li>Open any files available under Draft Files and edit the files. Use the Copyediting Discussions area if you need to contact the editor(s) or author(s).</li><li>Save the copyedited file(s) and upload them to the Copyedited panel.</li><li>Use the Copyediting Discussions to notify the editor(s) that all files have been prepared, and that the Production process may begin.</li></ol><p>If you are unable to undertake this work at this time or have any questions, please contact me. Thank you for your contribution to {$journalName}.</p><p>Kind regards,</p>{$signature}'),
(113,'EDITOR_ASSIGN_SUBMISSION','en','Assign Editor','You have been assigned as an editor on a submission to {$journalName}','<p>Dear {$recipientName},</p><p>The following submission has been assigned to you to see through the editorial process.</p><p><a href=\"{$submissionUrl}\">{$submissionTitle}</a><br />{$authors}</p><p><b>Abstract</b></p>{$submissionAbstract}<p>If you find the submission to be relevant for {$journalName}, please forward the submission to the review stage by selecting \"Send to Review\" and then assign reviewers by clicking \"Add Reviewer\".</p><p>If the submission is not appropriate for this journal, please decline the submission.</p><p>Thank you in advance.</p><p>Kind regards,</p>{$journalSignature}'),
(115,'EDITOR_ASSIGN_REVIEW','en','Assign Editor','You have been assigned as an editor on a submission to {$journalName}','<p>Dear {$recipientName},</p><p>The following submission has been assigned to you to see through the peer review process.</p><p><a href=\"{$submissionUrl}\">{$submissionTitle}</a><br />{$authors}</p><p><b>Abstract</b></p>{$submissionAbstract}<p>Please login to <a href=\"{$submissionUrl}\">view the submission</a> and assign qualified reviewers. You can assign a reviewer by clicking \"Add Reviewer\".</p><p>Thank you in advance.</p><p>Kind regards,</p>{$signature}'),
(117,'EDITOR_ASSIGN_PRODUCTION','en','Assign Editor','You have been assigned as an editor on a submission to {$journalName}','<p>Dear {$recipientName},</p><p>The following submission has been assigned to you to see through the production stage.</p><p><a href=\"{$submissionUrl}\">{$submissionTitle}</a><br />{$authors}</p><p><b>Abstract</b></p>{$submissionAbstract}<p>Please login to <a href=\"{$submissionUrl}\">view the submission</a>. Once production-ready files are available, upload them under the <strong>Publication > Galleys</strong> section. Then schedule the work for publication by clicking the <strong>Schedule for Publication</strong> button.</p><p>Thank you in advance.</p><p>Kind regards,</p>{$signature}'),
(119,'LAYOUT_REQUEST','en','Ready for Production','Submission {$submissionId} is ready for production at {$contextAcronym}','<p>Dear {$recipientName},</p><p>A new submission is ready for layout editing:</p><p><a href=\"{$submissionUrl}\">{$submissionId} — {$submissionTitle}</a><br />{$journalName}</p><ol><li>Click on the Submission URL above.</li><li>Download the Production Ready files and use them to create the galleys according to the journal\'s standards.</li><li>Upload the galleys to the Publication section of the submission.</li><li>Use the  Production Discussions to notify the editor that the galleys are ready.</li></ol><p>If you are unable to undertake this work at this time or have any questions, please contact me. Thank you for your contribution to this journal.</p><p>Kind regards,</p>{$signature}'),
(121,'LAYOUT_COMPLETE','en','Galleys Complete','Galleys Complete','<p>Dear {$recipientName},</p><p>Galleys have now been prepared for the following submission and are ready for final review.</p><p><a href=\"{$submissionUrl}\">{$submissionTitle}</a><br />{$journalName}</p><p>If you have any questions, please contact me.</p><p>Kind regards,</p><p>{$signature}</p>'),
(123,'VERSION_CREATED','en','Version Created','A new version was created for {$submissionTitle}','<p>Dear {$recipientName}, </p><p>This is an automated message to inform you that a new version of your submission, {$submissionTitle}, was created. You can view this version from your submission dashboard at the following link:</p><p><a href=\"{$submissionUrl}\">{$submissionTitle}</a></p><hr><p>This is an automatic email sent from <a href=\"{$journalUrl}\">{$journalName}</a>.</p>'),
(125,'EDITORIAL_REMINDER','en','Editorial Reminder','Outstanding editorial tasks for {$journalName}','<p>Dear {$recipientName},</p><p>You are currently assigned to {$numberOfSubmissions} submissions in <a href=\"{$journalUrl}\">{$journalName}</a>. The following submissions are <b>waiting for your response</b>.</p>{$outstandingTasks}<p>View all of your assignments in your <a href=\"{$submissionsUrl}\">submission dashboard</a>.</p><p>If you have any questions about your assignments, please contact {$contactName} at {$contactEmail}.</p>'),
(127,'SUBMISSION_SAVED_FOR_LATER','en','Submission Saved for Later','Resume your submission to {$journalName}','<p>Dear {$recipientName},</p><p>Your submission details have been saved in our system, but it has not yet been submitted for consideration. You can return to complete your submission at any time by following the link below.</p><p><a href=\"{$submissionWizardUrl}\">{$authorsShort} — {$submissionTitle}</a></p><hr><p>This is an automated email from <a href=\"{$journalUrl}\">{$journalName}</a>.</p>'),
(129,'SUBMISSION_NEEDS_EDITOR','en','Submission Needs Editor','A new submission needs an editor to be assigned: {$submissionTitle}','<p>Dear {$recipientName},</p><p>The following submission has been submitted and there is no editor assigned.</p><p><a href=\"{$submissionUrl}\">{$submissionTitle}</a><br />{$authors}</p><p><b>Abstract</b></p>{$submissionAbstract}<p>Please assign an editor who will be responsible for the submission by clicking the title above and assigning an editor under the Participants section.</p><hr><p>This is an automated email from <a href=\"{$journalUrl}\">{$journalName}</a>.</p>'),
(131,'PAYMENT_REQUEST_NOTIFICATION','en','Payment Request','Payment Request Notification','<p>Dear {$recipientName},</p><p>Congratulations on the acceptance of your submission, {$submissionTitle}, to {$journalName}. Now that your submission has been accepted, we would like to request payment of the publication fee.</p><p>This fee covers the production costs of bringing your submission to publication. To make the payment, please visit <a href=\"{$queuedPaymentUrl}\">{$queuedPaymentUrl}</a>.</p><p>If you have any questions, please see our <a href=\"{$submissionGuidelinesUrl}\">Submission Guidelines</a></p>'),
(133,'CHANGE_EMAIL','en','Change Email Address Invitation','Confirm account contact email change request','<p>Dear {$recipientName},</p><p>You are receiving this email because someone has requested a change of your email to {$newEmail}.</p><p>If you have made this request please <a href=\"{$acceptInvitationUrl}\">confirm</a> the email change.</p><p>You can always <a href=\"{$declineInvitationUrl}\">reject</a> this email change.</p><p>Please feel free to contact me with any questions about the submission or the review process.</p><p>Kind regards,</p>{$siteContactName}'),
(135,'ORCID_COLLECT_AUTHOR_ID','en','','Submission ORCID','Dear {$recipientName},<br/>\n<br/>\nYou have been listed as an author on a manuscript submission to {$journalName}.<br/>\nTo confirm your authorship, please add your ORCID id to this submission by visiting the link provided below.<br/>\n<br/>\n<a href=\"{$authorOrcidUrl}\"><img id=\"orcid-id-logo\" src=\"https://info.orcid.org/wp-content/uploads/2020/12/ORCIDiD_icon16x16.png\" width=\'16\' height=\'16\' alt=\"ORCID iD icon\" style=\"display: block; margin: 0 .5em 0 0; padding: 0; float: left;\"/>Register or connect your ORCID iD</a><br/>\n<br/>\n<br>\n<a href=\"{$orcidAboutUrl}\">More information about ORCID at {$journalName}</a><br/>\n<br/>\nIf you have any questions, please contact me.<br/>\n<br/>\n{$principalContactSignature}<br/>\n'),
(137,'ORCID_REQUEST_AUTHOR_AUTHORIZATION','en','','Requesting ORCID record access','Dear {$recipientName},<br>\n<br>\nYou have been listed as an author on the manuscript submission \"{$submissionTitle}\" to {$journalName}.\n<br>\n<br>\nPlease allow us to add your ORCID id to this submission and also to add the submission to your ORCID profile on publication.<br>\nVisit the link to the official ORCID website, login with your profile and authorize the access by following the instructions.<br>\n<br>\n<a href=\"{$authorOrcidUrl}\" style=\"display: inline-flex; align-items: center; background-color: white; text-align: center; padding: 10px 20px; text-decoration: none; border-radius: 5px; border: 2px solid #d7d4d4;\"><img id=\"orcid-id-logo\" src=\"https://info.orcid.org/wp-content/uploads/2020/12/ORCIDiD_icon16x16.png\" width=\'16\' height=\'16\' alt=\"ORCID iD icon\" style=\"display: block; margin: 0 .5em 0 0; padding: 0; float: left;\"/>Register or Connect your ORCID iD</a><br/>\n<br>\n<br>\nClick here to verify your account with ORCID: <a href=\"{$authorOrcidUrl}\">{$authorOrcidUrl}.</a>\n<br>\n<br>\n<a href=\"{$orcidAboutUrl}\">More about ORCID at {$journalName}</a><br/>\n<br>\n<br>\nIf you have any questions, please contact me.<br>\n<br>\n{$principalContactSignature}<br>\n'),
(139,'USER_ROLE_ASSIGNMENT_INVITATION','en','','You are invited to new roles','<div class=\'email-container\'>    <div class=\'email-header\'>        <h2>Invitation to New Role</h2>    </div>    <div class=\'email-content\'>        <p>Dear {$recipientName},</p>        <p>In light of your expertise, you have been invited by {$inviterName} to take on new roles at {$journalName}</p>        <p>At {$journalName}, we value your privacy. As such, we have taken steps to ensure that we are fully GDPR compliant. These steps include you being accountable to enter your own data and choosing who can see what information. For additional information on how we handled your data, please refer to our Privacy Policy.</p>        <div>{$existingRoles}</div>        <div>{$rolesAdded}</div>        <p>On accepting the invite, you will be redirected to {$journalName}</p>        <p>Feel free to contact me with any questions about the process.</p>        <p><a href=\'{$acceptUrl}\' class=\'btn btn-accept\'>Accept Invitation</a></p>        <p><a href=\'{$declineUrl}\' class=\'btn btn-decline\'>Decline Invitation</a></p>        <p>Kind regards,</p>        <p>{$journalName}</p>    </div></div><style>{$emailTemplateStyle}</style>'),
(141,'USER_ROLE_END','en','User Role Ended Notification','You have been removed from a role','<div class=\'email-container\'>    <div class=\'email-header\'>        <h2>Removed from a Role</h2>    </div>    <div class=\'email-content\'>        <p>Dear {$recipientName},</p>        <p>Thank you very much for your participation in the role of {$roleRemoved} at {$journalName}.</p>        <p>This is a notice to let you know that you have been removed from the following role at {$journalName}: <b>{$roleRemoved}</b>.</p>        <p>Your account with {$journalName} is still active and any other roles you previously held are still active.</p>        <p>Feel free to contact me with any questions about the process.</p>        <p>Kind regards,</p>        <p>{$journalName}</p>    </div></div><style>{$emailTemplateStyle}</style>'),
(143,'MANUAL_PAYMENT_NOTIFICATION','en','Manual Payment Notify','Manual Payment Notification','A manual payment needs to be processed for the journal {$journalName} and the user {senderName} (username &quot;{$senderUsername}&quot;).<br />\n<br />\nThe item being paid for is &quot;{$paymentName}&quot;.<br />\nThe cost is {$paymentAmount} ({$paymentCurrencyCode}).<br />\n<br />\nThis email was generated by Open Journal Systems\' Manual Payment plugin.'),
(217,'PASSWORD_RESET_CONFIRM','fr_CA','Confirmation de la réinitialisation du mot de passe','Confirmation de la réinitialisation du mot de passe','Nous avons reçu une demande concernant la réinitialisation de votre mot de passe pour le site Web {$siteTitle}.<br />\n<br />\nSi vous n\'avez pas fait cette demande, veuillez ne pas tenir compte du présent message, votre mot de passe restera le même. Si vous souhaitez réinitialiser votre mot de passe, cliquer sur l\'URL ci-dessous.<br />\n<br />\nRéinitialisation de mon mot de passe : {$passwordResetUrl}<br />\n<br />\n{$siteContactName}'),
(218,'USER_REGISTER','fr_CA','Création de l\'utilisateur-trice','Inscription à la revue','{$recipientName},<br />\n<br />\nVous êtes désormais inscrit-e en tant qu\'utilisateur-trice pour la revue {$journalName}. Votre nom d\'utilisateur-trice et votre mot de passe figurent dans ce courriel, lesquels sont requis pour toute interaction avec la revue via son site Web. À n\'importe quel moment, vous pouvez demander à être retiré-e de la liste des utilisateurs-trices de la revue en nous contactant.<br />\n<br />\nNom d\'utilisateur-trice : {$recipientUsername}<br />\nMot de passe : {$password}<br />\n<br />\nMerci,<br />\n{$signature}'),
(219,'USER_VALIDATE_CONTEXT','fr_CA','Validez l\'adresse courriel (enregistrement de la revue)','Valider votre compte','{$recipientName},<br />\n<br />\nVous avez créé un compte pour la revue {$journalName}. Pour pouvoir commencer à l\'utiliser il nous faut d\'abord valider votre adresse de courriel. Pour ce faire, vous n\'avez qu\'à suivre le lien ci-dessous :<br />\n<br />\n{$activateUrl}<br />\n<br />\nMerci,<br />\n{$journalSignature}'),
(220,'USER_VALIDATE_SITE','fr_CA','Valider le courriel (site)','Valider votre compte','{$recipientName},<br />\n<br />\nVous avez créé un compte dans {$siteTitle}. Avant de pouvoir commencer à l\'utiliser, il nous faut d\'abord valider votre adresse de courriel. Pour ce faire, vous n\'avez qu\'à suivre le lien ci-dessous :<br />\n<br />\n{$activateUrl}<br />\n<br />\nMerci,<br />\n{$siteSignature}'),
(221,'REVIEWER_REGISTER','fr_CA','Inscription d\'une évaluateur-trice','Inscription en tant qu\'évaluateur-trice pour la revue {$journalName}','<p>Bonjour {$recipientName},</p><p>Compte tenu de votre expertise, nous avons pris l\'initiative d\'inscrire votre nom dans la base de données des évaluateurs-trices de la revue {$journalName}. Cela ne vous engage d\'aucune façon, mais nous permet simplement de solliciter vos services pour l\'évaluation d\'une soumission. Si vous êtes invité-e à effectuer une évaluation, vous recevrez le titre et le résumé de l\'article en question, et serez toujours libre d\'accepter ou de refuser une telle invitation. À tout moment, il vous est également possible de demander à ce que votre nom soit retiré de la liste des évaluateurs-trices.</p>\n<p>Nous vous acheminons un nom d\'utilisateur-trice et un mot de passe, car tous deux sont requis pour tout échange avec la revue via son site Web. Vous pouvez, par exemple, si vous le souhaitez, effectuer la mise à jour de votre profil, y compris vos domaines d\'intérêt en matière d\'évaluation.</p>\n<p>Nom d\'utilisateur-trice : {$recipientUsername}<br />\nMot de passe : {$password}</p>\n<p>Merci,</p>{$signature}'),
(222,'ISSUE_PUBLISH_NOTIFY','fr_CA','Notification de numéro paru','Parution du dernier numéro : {$issueIdentification} de la revue {$journalName}','<p>Chers-ères lecteurs-trices,</p><p>La revue {$journalName} a le plaisir de vous annoncer la publication de son dernier numéro :  <a href=\"{$issueUrl}\">{$issueIdentification}</a>. Nous vous invitons à consulter le sommaire, puis à visiter notre site Web pour y lire les articles qui vous intéressent. Nous remercions vivement nos auteurs-trices, réviseurs-es et rédacteurs-trices pour leurs précieuses contributions à cet ouvrage, ainsi que nos lecteurs-trices pour leur intérêt constant.</p><p>Cordialement,</p>{$signature}'),
(223,'SUBMISSION_ACK','fr_CA','Confirmation de soumission','Accusé de réception de la soumission','{$recipientName},<br />\n<br />\nNous vous remercions d\'avoir soumis le manuscrit intitulé « {$submissionTitle} » à la revue {$journalName}. Grâce à notre système de gestion en ligne, vous pourrez suivre votre soumission tout au long du processus d\'édition en accédant au site Web de la revue :<br />\n<br />\nURL de la soumission : {$submissionUrl}<br />\nNom d\'utilisateur-trice : {$recipientUsername}<br />\n<br />\nSi vous avez des questions, n\'hésitez pas à communiquer avec nous. Nous vous remercions d\'avoir pensé à notre revue pour la publication de vos travaux.<br />\n<br />\n{$journalSignature}'),
(224,'SUBMISSION_ACK_NOT_USER','fr_CA','Confirmation de soumission (autres auteur-es)','Accusé de réception de la soumission','<p>Bonjour,</p><p>Le manuscrit intitulé , « {$submissionTitle} » , a été soumis par {$submitterName} à la revue {$journalName}.</p><p>Si vous avez des questions, n\'hésitez pas à communiquer avec nous. Nous vous remercions d\'avoir pensé à la revue {$journalName} pour la publication de vos travaux.</p><p>Cordialement,</p>{$journalSignature}'),
(225,'EDITOR_ASSIGN','fr_CA','Rédacteur-trice assigné','Vous avez été assigné.e en tant que rédacteur.trice d\'une soumission de la revue {$journalName}','<p>{$recipientName},</p><p>La soumission suivante vous a été assignée pour le suivi du processus éditorial.</p><p><a href=\"{$submissionUrl}\">{$submissionTitle}</a><br />{$authors}</p><p><b>Résumé</b></p>{$submissionAbstract}</p><p>Si vous jugez la soumission pertinente pour la revue {$journalName}, veuillez la transmettre à l\'étape d\'évaluation en sélectionnant \"Envoyer en évaluation\" et en désignant des évaluateur.trice.s en cliquant sur « Ajouter un.e évaluateur.trice ».</p><p>Si la soumission n\'est pas appropriée pour cette revue, veuillez la décliner.</p><p>Je vous remercie d\'avance.</p><p>Cordialement,</p>{$journalSignature}'),
(226,'REVIEW_CANCEL','fr_CA','Évaluateur.trice non assigné.e','Annulation de la demande d\'évaluation','<p>Bonjour {$recipientName},</p><p>Nous avons décidé d\'annuler notre demande concernant l\'évaluation du manuscrit intitulé « {$submissionTitle} » pour la revue {$journalName}. Nous sommes désolés des inconvénients que cela pourrait vous causer et espérons que nous pourrons de nouveau faire appel à vous pour contribuer au processus de révision par les pairs de cette revue dans le futur.</p><p>Si vous avez des questions, n\'hésitez pas à communiquer avec nous.</p>{$signature}'),
(227,'REVIEW_REINSTATE','fr_CA','Évaluateur.trice réintégré.e','Êtes-vous encore en mesure d\'évaluer des travaux pour la revue {$journalName} ?','<p>{$recipientName},</p><p>Nous avons récemment annulé notre demande vous demandant d\'évaluer la soumission, {$submissionTitle}, pour la revue {$journalName}. Nous sommes revenus sur cette décision et nous espérons que vous êtes toujours en mesure d\'effectuer l\'évaluation.</p><p>Si vous êtes en mesure d\'aider au processus d\'évaluation de cette revue, vous pouvez vous <a href=\"{$reviewAssignmentUrl}\">connecter au site de la revue</a> pour voir la soumission, téléverser les fichiers d\'évaluation ainsi que soumettre votre évaluation.</p><p>Si vous avez des questions, n\'hésitez pas à communiquer avec moi,</p><p>Cordialement,</p>{$signature}'),
(228,'REVIEW_RESEND_REQUEST','fr_CA','Envoyer de nouveau la demande d\'évaluation à l\'évaluateur-trice','Demande d\'évaluation réitérée pour {$journalName}','<p>{$recipientName},</p><p>Vous avez décliné récemment notre invitation à évaluer la soumission, {$submissionTitle}, pour {$journalName}. Je vous écris afin de vous demander si vous accepteriez de reconsidérer votre décision et d\'accepter de l\'évaluer.</p><p>Nous vous en serions très reconnaissant, mais nous comprenons également que vous soyez dans l\'impossibilité de le faire en ce moment. Quoi qu\'il en soit, pouvez-vous s\'il vous plait <a href=\"{$reviewAssignmentUrl}\">accepter ou approuver notre demande</a> avant le {$responseDueDate}.</p><p>Si vous avez des questions, n\'hésitez pas nous contacter.</p><p>Cordialement,</p>{$signature}'),
(229,'REVIEW_REQUEST','fr_CA','Demande d\'évaluation','Demande d\'évaluation d\'un article','<p>Bonjour {$recipientName},</p><p>Nous croyons que vous feriez un-e excellent-e évaluateur-trice pour le manuscrit intitulé « {$submissionTitle} » qui a été soumis à la revue {$journalName}. Vous trouverez un résumé de la soumission ci-dessous. Nous espérons que vous accepterez ce travail essentiel à la publication de la revue.</p><p>Veuillez accéder au site Web de la revue avant le {$responseDueDate} pour nous laisser savoir  <a href=\"{$reviewAssignmentUrl}\">si vous acceptez de faire l\'évaluation ou non</a>.</p><p>« {$submissionTitle} »</p><p>{$submissionAbstract}</p><p>La date d\'échéance de l\'évaluation a été fixée au {$reviewDueDate}.</p><p>Si vous n\'avez pas de nom d\'utilisateur-trice et de mot de passe pour le site Web de la revue, cliquez sur le lien ci-dessous pour réinitialiser votre mot de passe (lequel vous sera envoyé par courriel avec votre nom d\'utilisateur-trice). {$passwordLostUrl}</p><p>URL de la soumission : {$reviewAssignmentUrl}</p><p>Nous vous remercions de l\'attention que vous porterez à notre demande.</p>{$signature}'),
(230,'REVIEW_REQUEST_SUBSEQUENT','fr_CA','Demande d\'évaluation (nouveau cycle)','Demande d\'évaluation d\'un article révisé','<p>{$recipientName},</p><p>Nous vous remercions d\'avoir effectué l\'évaluation du manuscrit intitulé <a href=\"{$reviewAssignmentUrl}\">{$submissionTitle}</a>.</p><p><br/>{$submissionAbstract}</p>\n<p>Suivant les commentaire de l\'évaluation de la dernière version du manuscrit, l\'auteur-trice a soumis une version révisée de son document. Nous apprécierions que vous évaluiez cette nouvelle version dans le cadre d\'un second cycle d\'évaluation.</p><p>Si vous êtes en mesure d\'effectuer cette évaluation, veuillez vous authentifier sur la page de la revue avant le {$responseDueDate} pour y indiquer si vous participerez à cette évaluation ou non, ou encore pour accéder à la soumission et y enregistrer votre évaluation et vos recommandations. Le site Web est {$journalUrl}</p>\n<p>L\'évaluation est due pour le {$reviewDueDate}.</p><p>Si vous n\'avez pas vos nom d\'utilisateur-trice et mot de passe pour le site de la revue, vous pouvez utiliser le lien suivant pour réinitialiser votre mot de passe (lequel vous sera envoyé par courriel avec votre nom d\'utilisateur-trice). {$passwordLostUrl}</p><p>URL de la soumission : {$reviewAssignmentUrl}</p><p>Nous vous remercions de l\'attention que vous porterez à notre demande.</p>{$signature}'),
(231,'REVIEW_RESPONSE_OVERDUE_AUTO','fr_CA','Rappel automatique pour une invitation à évaluer','Seriez-vous en mesure d\'évaluer ce manuscrit pour nous ?','<p>Bonjour {$recipientName},</p><p>Ceci est un petit rappel concernant notre demande d\'évaluation de « {$submissionTitle} » pour la revue {$journalName}. Puisque nous n\'avons pas reçu, comme nous l\'espérions, une réponse avant le {$responseDueDate}, ce courriel a été généré et envoyé automatiquement après l\'échéance du délai.</p><p>Nous pensons que vous seriez un-e excellent-e évaluateur-trice pour le manuscrit. Vous trouverez un résumé de la soumission ci-dessous. Nous espérons que vous envisagerez d\'entreprendre cette tâche essentielle à la publication de la revue.</p>\n<p>Veuillez vous authentifier sur la page de la revue pour y indiquer si vous participerez à cette évaluation ou non, ou encore pour accéder à la soumission et y enregistrer votre évaluation et vos recommandations. Le site Web est {$journalUrl}</p><p>L\'évaluation est dû pour le {$reviewDueDate}.</p><p>Si vous n\'avez pas vos nom d\'utilisateur-trice et mot de passe pour le site de la revue, vous pouvez utiliser le lien suivant pour réinitialiser votre mot de passe (lequel vous sera envoyé par courriel avec votre nom d\'utilisateur-trice). {$passwordLostUrl}</p><p>URL de la soumission : {$reviewAssignmentUrl}</p><p>Nous vous remercions de l\'attention que vous porterez à notre demande.</p><p>« {$submissionTitle} »</p><p>{$submissionAbstract}</p>{$journalSignature}'),
(232,'REVIEW_CONFIRM','fr_CA','Évaluation confirmée','Acceptation d\'évaluation','Rédacteurs-trices,<br />\n<br />\nJe suis en mesure d\'évaluer la soumission intitulée « {$submissionTitle} » pour la revue {$journalName}. Je vous remercie d\'avoir pensé à moi. Je devrais être en mesure de compléter l\'évaluation pour la date du {$reviewDueDate}, voire avant.<br />\n<br />\n{$senderName}'),
(233,'REVIEW_DECLINE','fr_CA','Évaluation refusée','Refus d\'évaluation','Rédacteurs-trices,<br />\n<br />\nPour le moment, il m\'est impossible d\'évaluer la soumission intitulée « {$submissionTitle} » pour la revue {$journalName}. Je vous remercie d\'avoir pensé à moi. N\'hésitez pas à communiquer avec moi pour un autre projet.<br />\n<br />\n{$senderName}'),
(234,'REVIEW_ACK','fr_CA','Accusé de réception de l\'évaluation','Accusé de réception de l\'évaluation d\'une soumission','{$recipientName},<br />\n<br />\nNous vous remercions d\'avoir évalué la soumission intitulée « {$submissionTitle} » pour la revue {$journalName}. Nous vous sommes reconnaissants de votre contribution à la qualité des travaux que nous publions.'),
(235,'REVIEW_REMIND','fr_CA','Rappel d\'évaluation','Un rappel pour vous demander de bien vouloir terminer votre évaluation','<p>Bonjour {$recipientName},</p><p>Ceci est un petit rappel concernant notre demande d\'évaluation de la soumission « {$submissionTitle} » pour la revue {$journalName}. Nous espérions recevoir votre évaluation avant le {$reviewDueDate}. Nous serions heureux de la recevoir dès que possible.</p><p>Vous pouvez vous <a href=\"{$reviewAssignmentUrl}\">connecter au site de la revue</a> et suivre les étapes d\'évaluation afin de consulter le texte, soumettre votre fichier d\'évaluation ainsi que vos commentaires. </p><p>Si vous avez besoin de plus de temps, contactez moi. Je vous remercie.</p>\n<p>Cordialement</p>{$signature}'),
(236,'REVIEW_REMIND_AUTO','fr_CA','Rappel automatique d\'évaluation','Un rappel automatique pour vous demander de bien vouloir terminer votre évaluation','<p>{$recipientName},</p><p>Ceci est un rappel automatisé concernant notre demande d\'évaluation de la soumission « {$submissionTitle} » pour la revue {$journalName}. Puisque nous n\'avons pas reçu, comme nous l\'espérions, votre évaluation avant le {$reviewDueDate}, ce courriel a été généré et envoyé automatiquement après l\'échéance du délai. Nous serions toutefois heureux de recevoir votre évaluation dès que possible.</p><p>S\'il vous plait, <a href=\"{$reviewAssignmentUrl}\">connectez-vous à la revue</a> et suivez les étapes d\'évaluation afin de consulter le texte et soumettre votre fichier d\'évaluation ainsi que vos commentaires.</p><p>Si vous avez besoin d\'un délai supplémentaire, n\'hésitez pas à me contacter.</p><p>Je vous remercie. <br/>Cordialement, </p>{$journalSignature}'),
(237,'REVIEW_COMPLETE','fr_CA','Évaluation terminée','',''),
(238,'REVIEW_EDIT','fr_CA','','',''),
(239,'EDITOR_DECISION_ACCEPT','fr_CA','Soumission acceptée','Votre soumission a été acceptée dans la revue {$journalName}','<p>Bonjour {$authors},</p><p>Nous avons pris une décision concernant votre soumission « {$submissionTitle} » à la revue {$journalName}.</p><p>Notre décision est d\'accepter votre soumission.</p><p>Cordialement,</p>{$signature}'),
(240,'EDITOR_DECISION_SEND_TO_EXTERNAL','fr_CA','Envoyé à l\'évaluation','Décision du rédacteur','{$authors},<br />\n<br />\nNous avons pris une décision concernant votre soumission « {$submissionTitle} » à la revue {$journalName}.<br />\n<br />\nNotre décision est d\'envoyer votre soumission en évaluation.<br />\n<br />\nURL de la soumission : {$submissionUrl}'),
(241,'EDITOR_DECISION_SEND_TO_PRODUCTION','fr_CA','Envoyé en production','Décision du rédacteur','{$authors},<br />\n<br />\nL\'édition de votre soumission « {$submissionTitle} » est complétée. Nous l\'envoyons maintenant en production.<br />\n<br />\nURL de la soumission : {$submissionUrl}'),
(242,'EDITOR_DECISION_REVISIONS','fr_CA','Révisions demandées','Décision du rédacteur','{$authors},<br />\n<br />\nNous avons pris une décision concernant votre soumission « {$submissionTitle} » à la revue {$journalName}.<br />\n<br />\nNotre décision est de vous demander d\'apporter des révisions à votre soumission.'),
(243,'EDITOR_DECISION_RESUBMIT','fr_CA','Soumettez à nouveau pour évaluation','Décision du rédacteur','{$authors},<br />\n<br />\nNous avons pris une décision concernant votre soumission « {$submissionTitle} » à la revue {$journalName}.<br />\n<br />\nNotre décision est de vous demander d\'apporter des révisions à votre soumission et de la soumettre à nouveau.'),
(244,'EDITOR_DECISION_DECLINE','fr_CA','Soumission refusée','Décision du rédacteur','{$authors}:<br />\n<br />\nNous avons pris une décision concernant votre soumission « {$submissionTitle} » à la revue {$journalName}.<br />\n<br />\nNotre décision est de refuser votre soumission.'),
(245,'EDITOR_DECISION_INITIAL_DECLINE','fr_CA','Soumission refusée avant évaluation','Décision du rédacteur','\n			{$authors},<br />\n<br />\nNous avons pris une décision concernant votre soumission « {$submissionTitle} » à  la revue {$journalName}.<br />\n<br />\nNotre décision est de refuser votre soumission.'),
(246,'EDITOR_RECOMMENDATION','fr_CA','Recommandation émise','Recommandation du rédacteur','{$editors},<br />\n<br />\nLa recommandation concernant la soumission « {$submissionTitle} » à la revue {$journalName} est de : {$recommendation}'),
(247,'EDITOR_DECISION_NOTIFY_OTHER_AUTHORS','fr_CA','Envoyer une notification aux autres auteur-es','Mise à jour concernant votre soumission','<p>Ce courriel a été envoyé à {$submittingAuthorName} par {$journalName} concernant {$submissionTitle}.</p>\n<p>Vous recevez une copie de cet avis car vous êtes identifié comme auteur-e de cette soumission. Toutes les instructions dans le message ci-dessous sont à l\'intention de l\'auteur-e de correspondance, {$submittingAuthorName}. </p><p>Aucune action n\'est attendue de votre part.</p>\n\n{$messageToSubmittingAuthor}'),
(248,'EDITOR_DECISION_NOTIFY_REVIEWERS','fr_CA','Notifier les évaluateurs-trices de la décision','Décision éditoriale suite à votre évaluation','<p>{$recipientName},</p>\n<p>Nous vous remercions d\'avoir complété votre évaluation de la soumission, {$submissionTitle}, pour {$journalName}. Nous vous sommes reconnaissant pour votre temps et votre expertise qui contribue à la qualité des travaux que nous publions. Nous avons partagé vos commentaires avec l\'auteur-e, ainsi que ceux des autres évaluateurs-trices. </p>\n<p>En fonction des recommandations reçues, nous avons informé l\'auteur-e de notre décision qui est la suivante: </p>\n<p>{$decisionDescription}</p>\n<p>Votre recommandation a été prise en considération conjointement avec celles des autres évaluateurs-trices avant d\'en arriver à cette décision.</p>\n<p>Ce fut un plaisir de travailler avec vous à cette évaluation pour {$journalName}. Nous espérons avoir l\'opportunité de renouveler cette expérience avec vous à l\'avenir.</p>\n<p>Cordialement,</p>\n<p>{$signature}</p>'),
(249,'EDITOR_DECISION_NEW_ROUND','fr_CA','Un nouveau cycle d\'évaluation a été lancé','Votre soumission fera l\'objet d\'un nouveau cycle d\'évaluation','<p>{$recipientName},</p>\n<p>Votre soumission révisée, {$submissionTitle}, fera l\'objet d\'un nouveau cycle d\'évaluation par les pairs. \nNous vous contacterons afin de vous faire part des commentaires des évaluateurs et vous fournir des informations sur les prochaines étapes.</p>\n<p>Si vous avec des questions, vous pouvez nous contacter à partir de votre <a href=\"{$authorSubmissionUrl}\">tableau de bord de soumission</a>.</p>\n<p>Cordialement,</p>\n<p>{$signature}</p>\n'),
(250,'EDITOR_DECISION_REVERT_DECLINE','fr_CA','Rétablir une soumission refusée','Nous avons renversé la décision de rejeter votre soumission','<p>{$recipientName},</p>\n<p>La décision de rejeter votre soumission, {$submissionTitle}, a été renversée. Un-e rédacteur-trice complétera le cycle d\'évaluation et vous serez informé-e lorsqu\'une décision éditoriale sera prise.</p>\n<p>Si vous avez des questions, vous pouvez nous contacter sur votre <a href=\"{$authorSubmissionUrl}\">tableau de bord de soumissions</a>.</p>\n<p>Cordialement,</p>\n<p>{$signature}</p>\n'),
(251,'EDITOR_DECISION_REVERT_INITIAL_DECLINE','fr_CA','Rétablir une soumission refusée sans évaluation','Nous avons renversé la décision de rejeter votre soumission','<p>{$recipientName},</p>\n<p>La décision de rejeter votre soumission, {$submissionTitle}, a été renversée. Un-e rédacteur-trice consultera en détail votre soumission avant de décider de la rejeter ou de l\'envoyer en évaluation.</p>\n<p>Si vous avez des questions, vous pouvez nous contacter à partir de votre <a href=\"{$authorSubmissionUrl}\">tableau de bord de soumission</a>.</p>\n<p>Cordialement,</p>\n<p>{$signature}</p>\n'),
(252,'EDITOR_DECISION_SKIP_REVIEW','fr_CA','Soumission acceptée (sans évaluation)','Votre soumission a été envoyée à la révision linguistique','<p>{$recipientName},</p>\n<p>Nous avons le plaisir de vous informer que nous avons décidé d\'accepter votre soumission sans processus d\'évaluation par les pairs. Nous trouvons que votre soumission, {$submissionTitle}, répond à nos exigences et ne requerrons pas une évaluation par les pairs. Nous sommes enthousiastes à l\'idée de publier votre texte dans la revue {$journalName} et voulons vous remercier d\'avoir choisi notre revue pour diffuser vos travaux. </p>\nVotre texte sera publié dans un prochain numéro de la revue {$journalName} et vous pouvez l\'inclure dès à présent dans votre liste de publications. Nous reconnaissons les efforts nécessaire à toute publication et vous en félicitons. </p>\n<p>Votre texte va faire l\'objet d\'une révision linguistique et être mise en page avant publication.</p>\n<p>Vous recevrez des instructions sous peu.</p>\n<p>Si vous avez des questions, n\'hésitez pas à me contacter à partir de votre <a href=\"{$authorSubmissionUrl}\">tableau de bord de soumission</a>.</p>\n<p>Cordialement,</p>\n<p>{$signature}</p>\n'),
(253,'EDITOR_DECISION_BACK_FROM_PRODUCTION','fr_CA','Soumission renvoyée à la révision','Votre soumission a été renvoyée à l\'étape de révision','<p>{$recipientName},</p><p>Votre soumission, {$submissionTitle}, a été renvoyée à l\'étape de révision, où nous procéderons à des révisions supplémentaires ainsi qu\'à la mise en page en prévision de la publication.</p><p>Nous nous excusons pour la confusion que cette opération peut occasionner.</p><p>Si vous avez des questions, vous pouvez nous contacter à partir de votre <a href=\"{$authorSubmissionUrl}\">tableau de bord de soumission</a>.</p><p>Cordialement,</p><p>{$signature}</p>'),
(254,'EDITOR_DECISION_BACK_FROM_COPYEDITING','fr_CA','Soumission renvoyée de l\'étape de révision','',''),
(255,'EDITOR_DECISION_CANCEL_REVIEW_ROUND','fr_CA','Cycle d\'évaluation annulé','Un cycle d\'évaluation de votre soumission a été annulé','<p>{$recipientName},</p><p>Nous avions déclenché un nouveau cycle d\'évaluation pour votre soumission, {$submissionTitle}. Nous fermons désormais ce cycle.</p><p>Nous nous excusons pour la confusion que cette action peut occasionner. </p><p>Nous vous contacterons si nous avons besoin d\'une aide supplémentaire de votre part.</p><p>Si vous avez des questions, vous pouvez nous contacter à partir de votre <a href=\"{$authorSubmissionUrl}\">tableau de bord de soumissions</a></p>.<p>Kind regards,</p><p>{$signature}</p>'),
(256,'SUBSCRIPTION_NOTIFY','fr_CA','Notification d\'abonnement','Avis d\'abonnement','{$recipientName},<br />\n<br />\nVous êtes maintenant abonné-e à notre système de gestion de revue en ligne pour la revue {$journalName}, avec le type d\'abonnement suivant  :<br />\n<br />\n{$subscriptionType}<br />\n<br />\nPour accéder au contenu destiné seulement aux abonnés, connectez-vous au système à l\'aide de votre nom d\'utilisateur-trice : {$recipientUsername}.<br />\n<br />\nUne fois connecté-e dans le système, vous pouvez, en tout temps, modifier les renseignements de votre profil et votre mot de passe.<br />\n<br />\nVeuillez prendre note que si vous disposez d\'un abonnement institutionnel, les utilisateurs-trices n\'ont pas à entrer de nom d\'utilisateur-trice puisque le système authentifiera automatiquement les demandes.<br />\n<br />\nSi vous avez des questions, n\'hésitez pas à communiquer avec nous.<br />\n<br />\n{$subscriptionSignature}'),
(257,'OPEN_ACCESS_NOTIFY','fr_CA','Notification de diffusion en libre accès','Gratuitement accessible : le numéro {$issueIdentification} de la revue {$journalName} est maintenant en accès libre','<p>Chers lecteurs et lectrices,</p><p>La revue {$journalName} vient de rendre disponible en libre accès le numéro suivant. Nous vous invitons à lire ici le sommaire puis visiter notre site Web ({$journalUrl}) pour lire les articles et autres textes qui pourraient vous intéresser.</p><p>Merci de votre intérêt continu pour notre travail.</p>{$journalSignature}'),
(258,'SUBSCRIPTION_BEFORE_EXPIRY','fr_CA','L\'abonnement arrive bientôt à échéance','Avis d\'expiration de l\'abonnement','{$recipientName},<br />\n<br />\nVotre abonnement à la revue {$journalName} expirera bientôt.<br />\n<br />\n{$subscriptionType}<br />\nDate d\'expiration : {$expiryDate}<br />\n<br />\nAfin d\'assurer la continuité de votre accès à cette revue, nous vous invitons à aller sur le site Web de la revue et à renouveler votre abonnement. Vous pouvez vous y ouvrir une session avec votre nom d\'utilisateur-trice, soit « {$recipientUsername} ».<br />\n<br />\nSi vous avez des questions, ne pas hésiter à communiquer avec nous.<br />\n<br />\n{$subscriptionSignature}'),
(259,'SUBSCRIPTION_AFTER_EXPIRY','fr_CA','Abonnement échu','Abonnement expiré','{$recipientName},<br />\n<br />\nVotre abonnement à la revue {$journalName} est expiré.<br />\n<br />\n{$subscriptionType}<br />\nDate d\'expiration : {$expiryDate}<br />\n<br />\nPour renouveler votre abonnement, veuillez vous rendre sur le site Web de la revue. Vous pouvez y ouvrir une session en utilisant votre nom d\'utilisateur-trice, soit « {$recipientUsername} ».<br />\n<br />\nSi vous avez des questions, n\'hésitez pas à communiquer avec nous.<br />\n<br />\n{$subscriptionSignature}'),
(260,'SUBSCRIPTION_AFTER_EXPIRY_LAST','fr_CA','Abonnement échu en dernier','Abonnement expiré - Dernier rappel','<p>Bonjour {$recipientName},</p><p>Votre abonnement à la revue {$journalName} est expiré. Veuillez prendre note que ceci est le dernier rappel qui vous sera envoyé.</p><p>{$subscriptionType}</p>\n<p>Date d\'expiration : {$expiryDate}</p><p>Pour renouveler votre abonnement, veuillez vous rendre sur le site Web de la revue. Vous pouvez y ouvrir une session avec votre nom d\'utilisateur-trice, soit « {$recipientUsername} ».</p><p>Si vous avez des questions, ne hésitez pas à communiquer avec nous.</p>{$subscriptionSignature}'),
(261,'SUBSCRIPTION_PURCHASE_INDL','fr_CA','Acheter un abonnement individuel','Souscription à un abonnement individuel','Une souscription en ligne à un abonnement individuel pour la revue {$journalName} avec les renseignements suivants :<br />\n<br />\nType d\'abonnement :<br />\n{$subscriptionType}<br />\n<br />\nUtilisateur-trice :<br />\n{$subscriberDetails}<br />\n<br />\nInformation d\'adhésion (si fournie) :<br />\n{$membership}<br />\n<br />\nPour afficher ou modifier cet abonnement, veuillez utiliser l\'URL suivante.<br />\n<br />\nURL d\'abonnement : {$subscriptionUrl}<br/>\n'),
(262,'SUBSCRIPTION_PURCHASE_INSTL','fr_CA','Acheter un abonnement institutionnel','Souscription à un abonnement institutionnel','Souscription en ligne à un abonnement institutionnel pour la revue {$journalName} avec les renseignements suivants. Pour activer cet abonnement, veuillez utiliser l\'URL d\'abonnement fourni et fixer le statut de l\'abonnement à « actif ».<br />\n<br />\nType d\'abonnement :<br />\n{$subscriptionType}<br />\n<br />\nÉtablissement :<br />\n{$institutionName}<br />\n{$institutionMailingAddress}<br />\n<br />\nDomaine (si fourni) :<br />\n{$domain}<br />\n<br />\nPlage d\'adresses IP (si fournie) :<br />\n{$ipRanges}<br />\n<br />\nPersonne-ressource :<br />\n{$subscriberDetails}<br />\n<br />\nRenseignements d\'adhésion (si fournis) :<br />\n{$membership}<br />\n<br />\nPour afficher ou modifier cet abonnement, veuillez utiliser l\'URL suivant :<br />\n<br />\nURL de l\'abonnement : {$subscriptionUrl}<br />\n'),
(263,'SUBSCRIPTION_RENEW_INDL','fr_CA','Renouveler l\'abonnement individuel','Renouvellement d\'abonnement individuel','Un abonnement individuel a été renouvelé en ligne pour la revue {$journalName} avec les renseignements suivants.<br />\n<br />\nType d\'abonnement :<br />\n{$subscriptionType}<br />\n<br />\nUtilisateur-trice :<br />\n{$subscriberDetails}<br />\n<br />\nRenseignements d\'adhésion (si fournis) :<br />\n{$membership}<br />\n<br />\nPour afficher ou modifier cet abonnement, veuillez utiliser l\'URL suivant.<br />\n<br />\nURL de l\'abonnement : {$subscriptionUrl}<br />\n'),
(264,'SUBSCRIPTION_RENEW_INSTL','fr_CA','Renouveler l\'abonnement institutionnel','Renouvellement d\'abonnement institutionnel','Un abonnement institutionnel a été renouvelé en ligne pour la revue {$journalName} avec les renseignements suivants.<br />\n<br />\nType d\'abonnement :<br />\n{$subscriptionType}<br />\n<br />\nÉtablissement :<br />\n{$institutionName}<br />\n{$institutionMailingAddress}<br />\n<br />\nDomaine (si fourni) :<br />\n{$domain}<br />\n<br />\nPlage d\'adresses IP (si fournie) :<br />\n{$ipRanges}<br />\n<br />\nPersonne-ressource :<br />\n{$subscriberDetails}<br />\n<br />\nRenseignements d\'adhésion (si fournis) :<br />\n{$membership}<br />\n<br />\nPour afficher ou modifier cet abonnement, veuillez utiliser l\'URL suivant.<br />\n<br />\nURL de l\'abonnement : {$subscriptionUrl}<br />\n'),
(265,'REVISED_VERSION_NOTIFY','fr_CA','Notification de la version révisée','Version révisée téléversée','<p>Bonjour {$recipientName},</p><p>Une version révisée de « {$submissionTitle} » a été téléversée par l\'auteur-e {$submitterName}.</p><p>URL de la soumission : {$submissionUrl}</p>. <p>Ceci est un message automatique de <a href=\"{$journalUrl}\">{$journalName}</a>.</p>'),
(266,'STATISTICS_REPORT_NOTIFICATION','fr_CA','Notification sur les rapports statistiques','Activité éditoriale pour {$month} {$year}','\n{$recipientName}, <br />\n<br />\nLe rapport d\'activité éditoriale de votre revue pour {$month} {$year} est maintenant disponible. Les principales statistiques pour ce mois sont affichées ci-dessous.<br />\n<ul>\n	<li> Nouvelles soumissions pour ce mois : {$newSubmissions} </li>\n	<li> Soumissions refusées pour ce mois : {$declinedSubmissions} </li>\n	<li> Soumissions acceptées pour ce mois : {$acceptedSubmissions} </li>\n	<li> Nombre total de soumissions dans la plateforme : {$totalSubmissions} </li>\n</ul>\nConnectez-vous au site de la revue pour voir davantage de <a href=\"{$editorialStatsLink}\">tendances dans l\'activité éditoriale</a> ainsi que des <a href=\"{$publicationStatsLink}\">statistiques relatives aux articles publiés</a>. Le rapport complet des tendances de l\'activité éditoriale de ce mois-ci est joint au présent envoi.<br />\n<br />\nCordialement,<br />\n{$journalSignature}'),
(267,'ANNOUNCEMENT','fr_CA','Nouvelle annonce','{$announcementTitle}','<b>{$announcementTitle}</b><br />\n<br />\n{$announcementSummary}<br />\n<br />\nVisiter notre site Web pour consulter <a href=\"{$announcementUrl}\">l\'annonce complète</a>.'),
(268,'DISCUSSION_NOTIFICATION_SUBMISSION','fr_CA','Discussion (soumission)','Un message à propos de la revue {$journalName}','Prière de saisir votre message.'),
(269,'DISCUSSION_NOTIFICATION_REVIEW','fr_CA','Discussion (évaluation)','Un message à propos de la revue {$journalName}','Prière de saisir votre message.'),
(270,'DISCUSSION_NOTIFICATION_COPYEDITING','fr_CA','Discussion (révision)','Un message à propos de la revue {$journalName}','Prière de saisir votre message.'),
(271,'DISCUSSION_NOTIFICATION_PRODUCTION','fr_CA','Discussion (production)','Un message à propos de la revue {$journalName}','Prière de saisir votre message.'),
(272,'COPYEDIT_REQUEST','fr_CA','Demande de révision','Demande de révision d\'une soumission','{$recipientName},<br />\n<br />\nJ\'aimerais que vous effectuiez la révision du manuscrit intitulé « {$submissionTitle} » pour la revue {$journalName} à l\'aide des étapes suivantes.<br />\n1. Cliquer sur l\'URL de la soumission ci-dessous.<br />\n2. Ouvrir le(s) fichier(s) disponible(s) sous Fichiers des ébauches finales et effectuer votre révision, tout en ajoutant des discussions sur la révision, le cas échéant.<br />\n3. Enregistrer le(s) fichier(s) révisé(s) et le(s) téléverser dans la section Version(s) révisée(s).<br />\n4. Informer le,la rédacteur-trice que tous les fichiers ont été révisés et que l\'étape de production peut débuter.<br />\n<br />\nURL de la revue {$journalName} : {$journalUrl}<br />\nURL de la soumission : {$submissionUrl}<br />\nNom d\'utilisateur-trice : {$recipientUsername}'),
(273,'EDITOR_ASSIGN_SUBMISSION','fr_CA','Assigner un-e rédacteur-trice','Vous avez été assigné.e en tant que rédacteur.trice d\'une soumission de la revue {$journalName}','<p>{$recipientName},</p><p>La soumission suivante vous a été assignée pour le suivi du processus éditorial.</p><p><a href=\"{$submissionUrl}\">{$submissionTitle}</a><br />{$authors}</p><p><b>Résumé</b></p>{$submissionAbstract}</p><p>Si vous jugez la soumission pertinente pour la revue {$journalName}, veuillez la transmettre à l\'étape d\'évaluation en sélectionnant \"Envoyer en évaluation\" et en désignant des évaluateur.trice.s en cliquant sur « Ajouter un.e évaluateur.trice ».</p><p>Si la soumission n\'est pas appropriée pour cette revue, veuillez la décliner.</p><p>Je vous remercie d\'avance.</p><p>Cordialement,</p>{$journalSignature}'),
(274,'EDITOR_ASSIGN_REVIEW','fr_CA','Assigner un-e rédacteur-trice','Vous avez été assigné.e en tant que rédacteur.trice d\'une soumission de la revue {$journalName}','<p>{$recipientName},</p><p>La soumission suivante vous a été assignée pour le processus d\'évaluation par les pairs.</p><p><a href=\"{$submissionUrl}\">{$submissionTitle}</a><br />{$authors}</p><p><b>Résumé</b></p>{$submissionAbstract}<p>Veuillez vous connecter pour <a href=\"{$submissionUrl}\">voir la soumission</a> et désigner des évaluateur.trice.s qualifié.es. Vous pouvez désigner un.e évaluateur.trice en cliquant sur « Ajouter un.e évaluateur.trice ».</p><p>Je vous remercie d\'avance.</p><p>Cordialement,</p>{$signature}'),
(275,'EDITOR_ASSIGN_PRODUCTION','fr_CA','Assigner un-e rédacteur-trice','Vous avez été assigné.e en tant que rédacteur.trice d\'une soumission de la revue {$journalName}','<p>{$recipientName},</p><p>La soumission suivante vous a été assignée pour suivre le processus de production.</p><p><a href=\"{$submissionUrl}\">{$submissionTitle}</a><br />{$authors}</p><p><b>Résumé</b></p>{$submissionAbstract}<p>Veuillez vous connecter pour <a href=\"{$submissionUrl}\">afficher la soumission</a>. Une fois les fichiers prêts pour la production disponibles, les téléverser sous la section <strong>Publication &gt; Épreuves</strong>. Ensuite, planifier la publication en cliquant sur le bouton <strong>Planifier la publication</strong>.</p><p>Merci d\'avance.</p><p>Cordialement,</p>{$signature}'),
(276,'LAYOUT_REQUEST','fr_CA','Prêt pour production','La soumission {$submissionId} est prête pour production à la revue {$contextAcronym}','<p>Bonjour {$recipientName},</p><p>J\'aimerais que vous prépariez les épreuves du manuscrit intitulé « {$submissionTitle} » pour la revue {$journalName} à l\'aide des étapes suivantes.</p>\n<ol><li>Cliquer sur l\'URL de la soumission ci-dessous.</li><li>Se connecter au site Web de la revue et utiliser les fichiers disponibles sous Fichiers prêts pour la production pour créer les épreuves en fonction des normes de la revue.</li><li>Téléverser les épreuves dans la section Épreuves.</li><li>Informer le-la rédacteur-trice, via une discussion sur la production, que les épreuves ont été téléversées et qu\'elles sont prêtes.</li></ol><p>URL de la revue {$journalName} : {$journalUrl}</p><p>URL du manuscrit : {$submissionUrl}</p><p>Nom d\'utilisateur-trice : {$recipientUsername}</p><p>Si vous ne pouvez pas effectuer ce travail pour le moment ou si vous avez des questions, veuillez communiquer avec moi. Je vous remercie de votre collaboration.</p>{$signature}'),
(277,'LAYOUT_COMPLETE','fr_CA','Épreuves complétées','Mise en page des épreuves terminée','<p>Bonjour {$recipientName},</p><p>Les épreuves du manuscrit intitulé « <a href=\"{$submissionUrl}\">{$submissionTitle}</a> » pour la revue {$journalName} sont maintenant prêtes pour la relecture.</p><p>Si vous avez des questions, n\'hésitez pas à communiquer avec moi.</p><p>{$signature}</p>'),
(278,'VERSION_CREATED','fr_CA','Version créée','Une nouvelle version a été créée pour {$submissionTitle}','<p>{$recipientName}, </p><p>Ceci est un courriel automatique de <a href=\"{$journalUrl}\">{$journalName}</a> pour vous informer qu\'une nouvelle version de votre soumission, {$submissionTitle}, a été créée. Vous pouvez consulter cette version à partir de votre tableau de bord de soumission:</p><p><a href=\"{$submissionUrl}\">{$submissionTitle}</a></p><hr>'),
(279,'EDITORIAL_REMINDER','fr_CA','Rappel éditorial','Tâches éditoriales en attente pour {$journalName}','<p>$recipientName}, </p><p>Vous êtes présentement assigné-e à {$numberOfSubmissions} soumissions dans <a href=\"{$journalUrl}\">{$journalName}</a>. Des actions sont <b>attendues de votre part pour ces soumissions</b>.</p>{$outstandingTasks}<p>Vous pouvez consulter toutes vos soumissions dans votre <a href=\"{$submissionsUrl}\">tableau de bord des soumissions</a>.</p><p>Si vous avez des questions, contactez {$contactName} par courriel à l’adresse: {$contactEmail}. </p>'),
(280,'SUBMISSION_SAVED_FOR_LATER','fr_CA','Soumission incomplète sauvegardée','','<p>{$recipientName},</p><p>Les détails de votre soumission ont été enregistrés, mais vous ne l\'avez pas encore finalisée. Vous pouvez le faire en cliquant sur le lien ci-dessous: </p><p><a href=\"{$submissionWizardUrl}\">{$authorsShort} — {$submissionTitle}</a></p><hr><p>Ceci est un message automatique de <a href=\"{$journalUrl}\">{$journalName}</a>.</p>'),
(281,'SUBMISSION_NEEDS_EDITOR','fr_CA','Soumission en attente de rédacteur-trice','Un-e rédacteur-trice doit être assigné-e à la nouvelle soumission : {$submissionTitle}','<p>{$recipientName},</p><p>La soumission suivante a été soumise et aucun-e rédacteur-trice ne lui est assigné-e.</p><p><a href=\"{$submissionUrl}\">{$submissionTitle}</a><br />{$authors}</p><p><b>Abstract</b></p>{$submissionAbstract}<p>S\'il vous plait, assignez un-e rédacteur-trice qui sera responsable de la soumission. </p><hr><p>Ceci est un courriel automatique de <a href=\"{$journalUrl}\">{$journalName}</a>.</p>'),
(282,'PAYMENT_REQUEST_NOTIFICATION','fr_CA','Demande de paiement','Avis de demande de paiement','<p>Bonjour {$recipientName},</p><p>Félicitations pour l\'acceptation de votre texte, {$submissionTitle}, dans {$journalName}. Maintenant que votre texte a été accepté, il est nécessaire de payer les frais de publication afin de compléter le processus.</p><p>Ces frais couvrent les coûts de production permettant d\'assurer la publication de votre texte. Pour effectuer le paiement, rendez-vous sur <a href=\"{$queuedPaymentUrl}\">{$queuedPaymentUrl}</a>.</p><p> Si vous avez des questions, référez-vous à nos <a href=\"{$submissionGuidelinesUrl}\">directives de soumissions</a>.</p>'),
(283,'CHANGE_EMAIL','fr_CA','','',''),
(284,'ORCID_COLLECT_AUTHOR_ID','fr_CA','','Soumission ORCID','{$recipientName},<br/>\n<br/>\nVous avez été inscrit ou inscrite en tant qu\'auteur ou auteure pour un manuscrit soumis à {$journalName}.<br/>\nPour confirmer votre statut d\'auteur ou d\'auteure, veuillez ajouter votre identifiant ORCID à cette soumission en cliquant sur le lien ci-dessous.<br/>\n<br/>\n<a href=\"{$authorOrcidUrl}\"><img id=\"orcid-id-logo\" src=\"https://info.orcid.org/wp-content/uploads/2020/12/ORCIDiD_icon16x16.png\" width=\'16\' height=\'16\' alt=\"icône identifiant ORCID\" style=\"display: block; margin: 0 .5em 0 0; padding: 0; float: left;\"/>Se connecter avec votre identifiant ORCID ou s\'inscrire</a><br/>\n<br/>\n<br/>\n<a href=\"{$orcidAboutUrl}\">Plus de renseignements sur votre identifiant ORCID dans {$journalName}</a><br/>\n<br/>\nSi vous avez des questions, veuillez communiquer avec nous.<br/>\n<br/>\n{$principalContactSignature}<br/>\n'),
(285,'ORCID_REQUEST_AUTHOR_AUTHORIZATION','fr_CA','','Demande d\'accès au dossier ORCID','{$recipientName},<br/>\n<br/>\nVous avez été inscrit ou inscrite en tant qu\'auteur ou auteure pour le manuscrit « {$submissionTitle} » soumis à {$journalName}.\n<br/>\n<br/>\nVeuillez nous autoriser à ajouter votre identifiant ORCID à cette soumission et à ajouter également la soumission à votre dossier ORCID suite à sa publication.\n<br/>\nSuivre le lien vers le site officiel ORCID, vous connecter avec votre profil et autoriser l\'accès en suivant les instructions.<br/>\n<a href=\"{$authorOrcidUrl}\"><img id=\"orcid-id-logo\" src=\"https://info.orcid.org/wp-content/uploads/2020/12/ORCIDiD_icon16x16.png\" width=\'16\' height=\'16\' alt=\"icône identifiant ORCID\" style=\"display: block; margin: 0 .5em 0 0; padding: 0; float: left;\"/>Se connecter avec votre identifiant ORCID ou s\'inscrire</a><br/>\n<br/>\n<br/>\n<a href=\"{$orcidAboutUrl}\">Plus de renseignements sur votre identifiant ORCID dans {$journalName}</a><br/>\n<br/>\nSi vous avez des questions, veuillez communiquer avec nous.<br/>\n<br/>\n{$principalContactSignature}<br/>\n'),
(286,'USER_ROLE_ASSIGNMENT_INVITATION','fr_CA','','',''),
(287,'USER_ROLE_END','fr_CA','','',''),
(288,'MANUAL_PAYMENT_NOTIFICATION','fr_CA','Avis de paiement manuel','Avis de paiement manuel','Un paiement manuel doit être traité pour la revue {$journalName} et l\'utilisateur {$senderName} (nom d\'utilisateur &quot;{$senderUsername}&quot;).<br />\n<br />\nL\'élément facturé est &quot;{$paymentName}&quot;.<br />\nLe coût est de {$paymentAmount} ({$paymentCurrencyCode}).<br />\n<br />\nCe courriel a été généré par le plugiciel de paiement manuel du Open Journal Systems.');
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
) ENGINE=InnoDB AUTO_INCREMENT=290 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='A log of all events related to an object like a submission.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `event_log`
--

LOCK TABLES `event_log` WRITE;
/*!40000 ALTER TABLE `event_log` DISABLE KEYS */;
INSERT INTO `event_log` VALUES
(1,1048585,1,17,'2024-12-27 05:24:24',268435458,'submission.event.general.metadataUpdated',0),
(2,1048585,1,17,'2024-12-27 05:24:25',268435458,'submission.event.general.metadataUpdated',0),
(3,1048585,1,17,'2024-12-27 05:24:34',268435458,'submission.event.general.metadataUpdated',0),
(4,515,1,17,'2024-12-27 05:24:34',1342177281,'submission.event.fileUploaded',0),
(5,1048585,1,17,'2024-12-27 05:24:34',1342177288,'submission.event.fileRevised',0),
(6,515,1,17,'2024-12-27 05:24:34',1342177296,'submission.event.fileEdited',0),
(7,515,2,17,'2024-12-27 05:24:35',1342177281,'submission.event.fileUploaded',0),
(8,1048585,1,17,'2024-12-27 05:24:35',1342177288,'submission.event.fileRevised',0),
(9,515,2,17,'2024-12-27 05:24:36',1342177296,'submission.event.fileEdited',0),
(10,515,3,17,'2024-12-27 05:24:36',1342177281,'submission.event.fileUploaded',0),
(11,1048585,1,17,'2024-12-27 05:24:36',1342177288,'submission.event.fileRevised',0),
(12,515,3,17,'2024-12-27 05:24:37',1342177296,'submission.event.fileEdited',0),
(13,515,4,17,'2024-12-27 05:24:37',1342177281,'submission.event.fileUploaded',0),
(14,1048585,1,17,'2024-12-27 05:24:37',1342177288,'submission.event.fileRevised',0),
(15,515,4,17,'2024-12-27 05:24:38',1342177296,'submission.event.fileEdited',0),
(16,515,5,17,'2024-12-27 05:24:38',1342177281,'submission.event.fileUploaded',0),
(17,1048585,1,17,'2024-12-27 05:24:39',1342177288,'submission.event.fileRevised',0),
(18,515,5,17,'2024-12-27 05:24:40',1342177296,'submission.event.fileEdited',0),
(19,515,6,17,'2024-12-27 05:24:40',1342177281,'submission.event.fileUploaded',0),
(20,1048585,1,17,'2024-12-27 05:24:40',1342177288,'submission.event.fileRevised',0),
(21,515,6,17,'2024-12-27 05:24:40',1342177296,'submission.event.fileEdited',0),
(22,515,6,17,'2024-12-27 05:24:41',1342177282,'submission.event.fileDeleted',0),
(23,1048585,1,17,'2024-12-27 05:25:07',268435457,'submission.event.submissionSubmitted',0),
(24,1048585,1,3,'2024-12-27 05:25:18',805306371,'editor.submission.decision.sendExternalReview.log',0),
(25,515,7,3,'2024-12-27 05:25:18',1342177281,'submission.event.fileUploaded',0),
(26,1048585,1,3,'2024-12-27 05:25:18',1342177288,'submission.event.fileRevised',0),
(27,515,8,3,'2024-12-27 05:25:18',1342177281,'submission.event.fileUploaded',0),
(28,1048585,1,3,'2024-12-27 05:25:18',1342177288,'submission.event.fileRevised',0),
(29,515,9,3,'2024-12-27 05:25:18',1342177281,'submission.event.fileUploaded',0),
(30,1048585,1,3,'2024-12-27 05:25:18',1342177288,'submission.event.fileRevised',0),
(31,515,10,3,'2024-12-27 05:25:18',1342177281,'submission.event.fileUploaded',0),
(32,1048585,1,3,'2024-12-27 05:25:18',1342177288,'submission.event.fileRevised',0),
(33,515,11,3,'2024-12-27 05:25:18',1342177281,'submission.event.fileUploaded',0),
(34,1048585,1,3,'2024-12-27 05:25:18',1342177288,'submission.event.fileRevised',0),
(35,1048585,1,3,'2024-12-27 05:25:22',1073741825,'log.review.reviewerAssigned',0),
(36,1048585,1,3,'2024-12-27 05:25:24',1073741825,'log.review.reviewerAssigned',0),
(37,1048585,1,3,'2024-12-27 05:25:27',1073741825,'log.review.reviewerAssigned',0),
(38,1048585,1,3,'2024-12-27 05:25:30',805306371,'editor.submission.decision.accept.log',0),
(39,1048585,1,3,'2024-12-27 05:25:35',268435459,'submission.event.participantAdded',0),
(40,1048585,1,3,'2024-12-27 05:25:39',805306371,'editor.submission.decision.sendToProduction.log',0),
(41,1048585,1,3,'2024-12-27 05:25:43',268435459,'submission.event.participantAdded',0),
(42,1048585,1,3,'2024-12-27 05:25:46',268435459,'submission.event.participantAdded',0),
(43,1048585,1,3,'2024-12-27 05:27:09',268435458,'submission.event.general.metadataUpdated',0),
(44,1048585,1,3,'2024-12-27 05:27:10',268435458,'submission.event.general.metadataUpdated',0),
(45,1048585,1,3,'2024-12-27 05:27:11',268435458,'submission.event.general.metadataUpdated',0),
(46,1048585,1,3,'2024-12-27 05:27:14',268435458,'submission.event.general.metadataUpdated',0),
(47,515,12,3,'2024-12-27 05:27:19',1342177281,'submission.event.fileUploaded',0),
(48,1048585,1,3,'2024-12-27 05:27:19',1342177288,'submission.event.fileRevised',0),
(49,515,12,3,'2024-12-27 05:27:19',1342177296,'submission.event.fileEdited',0),
(50,1048585,1,3,'2024-12-27 05:27:28',268435459,'submission.event.participantAdded',0),
(51,1048585,1,17,'2024-12-27 05:27:34',268435458,'submission.event.general.metadataUpdated',0),
(52,1048585,1,3,'2024-12-27 05:27:39',268435458,'submission.event.general.metadataUpdated',0),
(53,1048585,1,3,'2024-12-27 05:27:41',268435462,'publication.event.published',0),
(54,1048585,1,3,'2024-12-27 05:27:48',268435463,'publication.event.unpublished',0),
(55,1048585,1,3,'2024-12-27 05:27:53',268435462,'publication.event.published',0),
(56,1048585,1,3,'2024-12-27 05:27:57',268435458,'submission.event.general.metadataUpdated',0),
(57,1048585,1,3,'2024-12-27 05:27:57',268435464,'publication.event.versionCreated',0),
(58,1048585,1,3,'2024-12-27 05:28:09',268435458,'submission.event.general.metadataUpdated',0),
(59,1048585,1,3,'2024-12-27 05:28:17',268435458,'submission.event.general.metadataUpdated',0),
(60,1048585,1,3,'2024-12-27 05:28:18',268435462,'publication.event.versionPublished',0),
(61,1048585,1,3,'2024-12-27 05:28:26',268435463,'publication.event.versionUnpublished',0),
(62,1048585,1,3,'2024-12-27 05:28:33',268435459,'submission.event.participantAdded',0),
(63,1048585,1,3,'2024-12-27 05:28:41',268435459,'submission.event.participantAdded',0),
(64,1048585,2,18,'2024-12-27 05:28:51',268435458,'submission.event.general.metadataUpdated',0),
(65,1048585,2,18,'2024-12-27 05:28:51',268435458,'submission.event.general.metadataUpdated',0),
(66,515,13,18,'2024-12-27 05:28:53',1342177281,'submission.event.fileUploaded',0),
(67,1048585,2,18,'2024-12-27 05:28:53',1342177288,'submission.event.fileRevised',0),
(68,515,13,18,'2024-12-27 05:28:53',1342177296,'submission.event.fileEdited',0),
(69,1048585,2,18,'2024-12-27 05:28:54',268435457,'submission.event.submissionSubmitted',0),
(70,1048585,2,3,'2024-12-27 05:29:00',805306371,'editor.submission.decision.sendExternalReview.log',0),
(71,515,14,3,'2024-12-27 05:29:00',1342177281,'submission.event.fileUploaded',0),
(72,1048585,2,3,'2024-12-27 05:29:00',1342177288,'submission.event.fileRevised',0),
(73,1048585,2,3,'2024-12-27 05:29:04',268435459,'submission.event.participantAdded',0),
(74,1048585,2,3,'2024-12-27 05:29:07',268435458,'submission.event.general.metadataUpdated',0),
(75,1048585,2,6,'2024-12-27 05:29:13',805306372,'editor.submission.recommend.accept.log',0),
(76,1048585,3,19,'2024-12-27 05:29:24',268435458,'submission.event.general.metadataUpdated',0),
(77,1048585,3,19,'2024-12-27 05:29:25',268435458,'submission.event.general.metadataUpdated',0),
(78,515,15,19,'2024-12-27 05:29:27',1342177281,'submission.event.fileUploaded',0),
(79,1048585,3,19,'2024-12-27 05:29:27',1342177288,'submission.event.fileRevised',0),
(80,515,15,19,'2024-12-27 05:29:27',1342177296,'submission.event.fileEdited',0),
(81,1048585,3,19,'2024-12-27 05:29:28',268435457,'submission.event.submissionSubmitted',0),
(82,1048585,3,3,'2024-12-27 05:29:34',805306371,'editor.submission.decision.sendExternalReview.log',0),
(83,515,16,3,'2024-12-27 05:29:34',1342177281,'submission.event.fileUploaded',0),
(84,1048585,3,3,'2024-12-27 05:29:34',1342177288,'submission.event.fileRevised',0),
(85,1048585,3,3,'2024-12-27 05:29:37',1073741825,'log.review.reviewerAssigned',0),
(86,1048585,3,3,'2024-12-27 05:29:39',1073741825,'log.review.reviewerAssigned',0),
(87,1048585,3,3,'2024-12-27 05:29:43',805306371,'editor.submission.decision.accept.log',0),
(88,1048585,3,3,'2024-12-27 05:29:47',268435459,'submission.event.participantAdded',0),
(89,1048585,4,20,'2024-12-27 05:29:54',268435458,'submission.event.general.metadataUpdated',0),
(90,1048585,4,20,'2024-12-27 05:29:54',268435458,'submission.event.general.metadataUpdated',0),
(91,515,17,20,'2024-12-27 05:29:56',1342177281,'submission.event.fileUploaded',0),
(92,1048585,4,20,'2024-12-27 05:29:56',1342177288,'submission.event.fileRevised',0),
(93,515,17,20,'2024-12-27 05:29:56',1342177296,'submission.event.fileEdited',0),
(94,1048585,4,20,'2024-12-27 05:29:58',268435457,'submission.event.submissionSubmitted',0),
(95,1048585,5,21,'2024-12-27 05:30:04',268435458,'submission.event.general.metadataUpdated',0),
(96,1048585,5,21,'2024-12-27 05:30:04',268435458,'submission.event.general.metadataUpdated',0),
(97,515,18,21,'2024-12-27 05:30:06',1342177281,'submission.event.fileUploaded',0),
(98,1048585,5,21,'2024-12-27 05:30:06',1342177288,'submission.event.fileRevised',0),
(99,515,18,21,'2024-12-27 05:30:06',1342177296,'submission.event.fileEdited',0),
(100,1048585,5,21,'2024-12-27 05:30:07',268435457,'submission.event.submissionSubmitted',0),
(101,1048585,5,3,'2024-12-27 05:30:13',805306371,'editor.submission.decision.sendExternalReview.log',0),
(102,515,19,3,'2024-12-27 05:30:13',1342177281,'submission.event.fileUploaded',0),
(103,1048585,5,3,'2024-12-27 05:30:13',1342177288,'submission.event.fileRevised',0),
(104,1048585,5,3,'2024-12-27 05:30:17',1073741825,'log.review.reviewerAssigned',0),
(105,1048585,5,3,'2024-12-27 05:30:19',1073741825,'log.review.reviewerAssigned',0),
(106,1048585,5,3,'2024-12-27 05:30:23',805306371,'editor.submission.decision.accept.log',0),
(107,1048585,5,3,'2024-12-27 05:30:27',268435459,'submission.event.participantAdded',0),
(108,1048585,5,3,'2024-12-27 05:30:31',805306371,'editor.submission.decision.sendToProduction.log',0),
(109,1048585,5,3,'2024-12-27 05:30:36',268435459,'submission.event.participantAdded',0),
(110,1048585,5,3,'2024-12-27 05:30:38',268435459,'submission.event.participantAdded',0),
(111,1048585,6,22,'2024-12-27 05:30:45',268435458,'submission.event.general.metadataUpdated',0),
(112,1048585,6,22,'2024-12-27 05:30:45',268435458,'submission.event.general.metadataUpdated',0),
(113,515,20,22,'2024-12-27 05:30:47',1342177281,'submission.event.fileUploaded',0),
(114,1048585,6,22,'2024-12-27 05:30:47',1342177288,'submission.event.fileRevised',0),
(115,515,20,22,'2024-12-27 05:30:48',1342177296,'submission.event.fileEdited',0),
(116,1048585,6,22,'2024-12-27 05:30:48',268435457,'submission.event.submissionSubmitted',0),
(117,1048585,6,3,'2024-12-27 05:30:55',805306371,'editor.submission.decision.sendExternalReview.log',0),
(118,515,21,3,'2024-12-27 05:30:55',1342177281,'submission.event.fileUploaded',0),
(119,1048585,6,3,'2024-12-27 05:30:55',1342177288,'submission.event.fileRevised',0),
(120,1048585,6,3,'2024-12-27 05:30:59',1073741825,'log.review.reviewerAssigned',0),
(121,1048585,6,3,'2024-12-27 05:31:01',1073741825,'log.review.reviewerAssigned',0),
(122,1048585,6,3,'2024-12-27 05:31:05',805306371,'editor.submission.decision.accept.log',0),
(123,1048585,6,3,'2024-12-27 05:31:09',268435459,'submission.event.participantAdded',0),
(124,1048585,6,3,'2024-12-27 05:31:13',805306371,'editor.submission.decision.sendToProduction.log',0),
(125,1048585,6,3,'2024-12-27 05:31:18',268435459,'submission.event.participantAdded',0),
(126,1048585,7,23,'2024-12-27 05:31:24',268435458,'submission.event.general.metadataUpdated',0),
(127,1048585,7,23,'2024-12-27 05:31:24',268435458,'submission.event.general.metadataUpdated',0),
(128,515,22,23,'2024-12-27 05:31:26',1342177281,'submission.event.fileUploaded',0),
(129,1048585,7,23,'2024-12-27 05:31:26',1342177288,'submission.event.fileRevised',0),
(130,515,22,23,'2024-12-27 05:31:27',1342177296,'submission.event.fileEdited',0),
(131,1048585,7,23,'2024-12-27 05:31:28',268435457,'submission.event.submissionSubmitted',0),
(132,1048585,7,3,'2024-12-27 05:31:34',805306371,'editor.submission.decision.sendExternalReview.log',0),
(133,515,23,3,'2024-12-27 05:31:34',1342177281,'submission.event.fileUploaded',0),
(134,1048585,7,3,'2024-12-27 05:31:34',1342177288,'submission.event.fileRevised',0),
(135,1048585,7,3,'2024-12-27 05:31:38',1073741825,'log.review.reviewerAssigned',0),
(136,1048585,7,3,'2024-12-27 05:31:40',1073741825,'log.review.reviewerAssigned',0),
(137,1048585,7,3,'2024-12-27 05:31:43',1073741825,'log.review.reviewerAssigned',0),
(138,1048585,7,8,'2024-12-27 05:31:48',1073741830,'log.review.reviewAccepted',NULL),
(139,1048585,7,8,'2024-12-27 05:31:51',1073741848,'log.review.reviewReady',0),
(140,1048585,8,24,'2024-12-27 05:31:58',268435458,'submission.event.general.metadataUpdated',0),
(141,1048585,8,24,'2024-12-27 05:31:58',268435458,'submission.event.general.metadataUpdated',0),
(142,515,24,24,'2024-12-27 05:32:00',1342177281,'submission.event.fileUploaded',0),
(143,1048585,8,24,'2024-12-27 05:32:00',1342177288,'submission.event.fileRevised',0),
(144,515,24,24,'2024-12-27 05:32:00',1342177296,'submission.event.fileEdited',0),
(145,1048585,8,24,'2024-12-27 05:32:02',268435457,'submission.event.submissionSubmitted',0),
(146,1048585,9,25,'2024-12-27 05:32:08',268435458,'submission.event.general.metadataUpdated',0),
(147,1048585,9,25,'2024-12-27 05:32:08',268435458,'submission.event.general.metadataUpdated',0),
(148,515,25,25,'2024-12-27 05:32:10',1342177281,'submission.event.fileUploaded',0),
(149,1048585,9,25,'2024-12-27 05:32:10',1342177288,'submission.event.fileRevised',0),
(150,515,25,25,'2024-12-27 05:32:10',1342177296,'submission.event.fileEdited',0),
(151,1048585,9,25,'2024-12-27 05:32:11',268435457,'submission.event.submissionSubmitted',0),
(152,1048585,9,3,'2024-12-27 05:32:18',805306371,'editor.submission.decision.sendExternalReview.log',0),
(153,515,26,3,'2024-12-27 05:32:18',1342177281,'submission.event.fileUploaded',0),
(154,1048585,9,3,'2024-12-27 05:32:18',1342177288,'submission.event.fileRevised',0),
(155,1048585,9,3,'2024-12-27 05:32:22',1073741825,'log.review.reviewerAssigned',0),
(156,1048585,9,3,'2024-12-27 05:32:24',1073741825,'log.review.reviewerAssigned',0),
(157,1048585,9,3,'2024-12-27 05:32:28',805306371,'editor.submission.decision.accept.log',0),
(158,1048585,9,3,'2024-12-27 05:32:33',268435459,'submission.event.participantAdded',0),
(159,1048585,9,3,'2024-12-27 05:32:37',805306371,'editor.submission.decision.sendToProduction.log',0),
(160,1048585,9,3,'2024-12-27 05:32:42',268435459,'submission.event.participantAdded',0),
(161,1048585,9,3,'2024-12-27 05:32:45',268435459,'submission.event.participantAdded',0),
(162,1048585,10,26,'2024-12-27 05:32:51',268435458,'submission.event.general.metadataUpdated',0),
(163,1048585,10,26,'2024-12-27 05:32:51',268435458,'submission.event.general.metadataUpdated',0),
(164,515,27,26,'2024-12-27 05:32:53',1342177281,'submission.event.fileUploaded',0),
(165,1048585,10,26,'2024-12-27 05:32:53',1342177288,'submission.event.fileRevised',0),
(166,515,27,26,'2024-12-27 05:32:54',1342177296,'submission.event.fileEdited',0),
(167,1048585,10,26,'2024-12-27 05:32:55',268435457,'submission.event.submissionSubmitted',0),
(168,1048585,10,3,'2024-12-27 05:33:01',805306371,'editor.submission.decision.sendExternalReview.log',0),
(169,515,28,3,'2024-12-27 05:33:01',1342177281,'submission.event.fileUploaded',0),
(170,1048585,10,3,'2024-12-27 05:33:01',1342177288,'submission.event.fileRevised',0),
(171,1048585,10,3,'2024-12-27 05:33:06',1073741825,'log.review.reviewerAssigned',0),
(172,1048585,10,3,'2024-12-27 05:33:08',1073741825,'log.review.reviewerAssigned',0),
(173,1048585,10,9,'2024-12-27 05:33:13',1073741830,'log.review.reviewAccepted',NULL),
(174,1048585,10,9,'2024-12-27 05:33:16',1073741848,'log.review.reviewReady',0),
(175,1048585,10,10,'2024-12-27 05:33:21',1073741830,'log.review.reviewAccepted',NULL),
(176,1048585,10,10,'2024-12-27 05:33:24',1073741848,'log.review.reviewReady',0),
(177,1048585,11,27,'2024-12-27 05:33:31',268435458,'submission.event.general.metadataUpdated',0),
(178,1048585,11,27,'2024-12-27 05:33:31',268435458,'submission.event.general.metadataUpdated',0),
(179,515,29,27,'2024-12-27 05:33:33',1342177281,'submission.event.fileUploaded',0),
(180,1048585,11,27,'2024-12-27 05:33:33',1342177288,'submission.event.fileRevised',0),
(181,515,29,27,'2024-12-27 05:33:33',1342177296,'submission.event.fileEdited',0),
(182,1048585,11,27,'2024-12-27 05:33:35',268435457,'submission.event.submissionSubmitted',0),
(183,1048585,12,28,'2024-12-27 05:33:41',268435458,'submission.event.general.metadataUpdated',0),
(184,1048585,12,28,'2024-12-27 05:33:41',268435458,'submission.event.general.metadataUpdated',0),
(185,515,30,28,'2024-12-27 05:33:43',1342177281,'submission.event.fileUploaded',0),
(186,1048585,12,28,'2024-12-27 05:33:43',1342177288,'submission.event.fileRevised',0),
(187,515,30,28,'2024-12-27 05:33:43',1342177296,'submission.event.fileEdited',0),
(188,1048585,12,28,'2024-12-27 05:33:44',268435457,'submission.event.submissionSubmitted',0),
(189,1048585,12,3,'2024-12-27 05:33:51',805306371,'editor.submission.decision.sendExternalReview.log',0),
(190,515,31,3,'2024-12-27 05:33:51',1342177281,'submission.event.fileUploaded',0),
(191,1048585,12,3,'2024-12-27 05:33:51',1342177288,'submission.event.fileRevised',0),
(192,1048585,12,3,'2024-12-27 05:33:56',1073741825,'log.review.reviewerAssigned',0),
(193,1048585,12,3,'2024-12-27 05:33:58',1073741825,'log.review.reviewerAssigned',0),
(194,1048585,13,29,'2024-12-27 05:34:05',268435458,'submission.event.general.metadataUpdated',0),
(195,1048585,13,29,'2024-12-27 05:34:05',268435458,'submission.event.general.metadataUpdated',0),
(196,515,32,29,'2024-12-27 05:34:07',1342177281,'submission.event.fileUploaded',0),
(197,1048585,13,29,'2024-12-27 05:34:07',1342177288,'submission.event.fileRevised',0),
(198,515,32,29,'2024-12-27 05:34:08',1342177296,'submission.event.fileEdited',0),
(199,1048585,13,29,'2024-12-27 05:34:09',268435457,'submission.event.submissionSubmitted',0),
(200,1048585,13,3,'2024-12-27 05:34:16',805306371,'editor.submission.decision.sendExternalReview.log',0),
(201,515,33,3,'2024-12-27 05:34:16',1342177281,'submission.event.fileUploaded',0),
(202,1048585,13,3,'2024-12-27 05:34:16',1342177288,'submission.event.fileRevised',0),
(203,1048585,13,3,'2024-12-27 05:34:20',1073741825,'log.review.reviewerAssigned',0),
(204,1048585,13,3,'2024-12-27 05:34:23',1073741825,'log.review.reviewerAssigned',0),
(205,1048585,13,3,'2024-12-27 05:34:25',1073741825,'log.review.reviewerAssigned',0),
(206,1048585,13,7,'2024-12-27 05:34:30',1073741830,'log.review.reviewAccepted',NULL),
(207,1048585,13,7,'2024-12-27 05:34:34',1073741848,'log.review.reviewReady',0),
(208,1048585,13,9,'2024-12-27 05:34:38',1073741830,'log.review.reviewAccepted',NULL),
(209,1048585,13,9,'2024-12-27 05:34:42',1073741848,'log.review.reviewReady',0),
(210,1048585,13,10,'2024-12-27 05:34:46',1073741830,'log.review.reviewAccepted',NULL),
(211,1048585,13,10,'2024-12-27 05:34:50',1073741848,'log.review.reviewReady',0),
(212,1048585,13,3,'2024-12-27 05:35:01',805306371,'editor.submission.decision.requestRevisions.log',0),
(213,1048585,13,3,'2024-12-27 05:35:01',805306375,'submission.event.decisionReviewerEmailSent',0),
(214,1048585,14,30,'2024-12-27 05:35:11',268435458,'submission.event.general.metadataUpdated',0),
(215,1048585,14,30,'2024-12-27 05:35:11',268435458,'submission.event.general.metadataUpdated',0),
(216,515,34,30,'2024-12-27 05:35:13',1342177281,'submission.event.fileUploaded',0),
(217,1048585,14,30,'2024-12-27 05:35:13',1342177288,'submission.event.fileRevised',0),
(218,515,34,30,'2024-12-27 05:35:13',1342177296,'submission.event.fileEdited',0),
(219,1048585,14,30,'2024-12-27 05:35:14',268435457,'submission.event.submissionSubmitted',0),
(220,1048585,15,31,'2024-12-27 05:35:20',268435458,'submission.event.general.metadataUpdated',0),
(221,1048585,15,31,'2024-12-27 05:35:20',268435458,'submission.event.general.metadataUpdated',0),
(222,515,35,31,'2024-12-27 05:35:22',1342177281,'submission.event.fileUploaded',0),
(223,1048585,15,31,'2024-12-27 05:35:22',1342177288,'submission.event.fileRevised',0),
(224,515,35,31,'2024-12-27 05:35:23',1342177296,'submission.event.fileEdited',0),
(225,1048585,15,31,'2024-12-27 05:35:24',268435457,'submission.event.submissionSubmitted',0),
(226,1048585,15,3,'2024-12-27 05:35:31',805306371,'editor.submission.decision.sendExternalReview.log',0),
(227,515,36,3,'2024-12-27 05:35:31',1342177281,'submission.event.fileUploaded',0),
(228,1048585,15,3,'2024-12-27 05:35:31',1342177288,'submission.event.fileRevised',0),
(229,1048585,15,3,'2024-12-27 05:35:36',1073741825,'log.review.reviewerAssigned',0),
(230,1048585,15,3,'2024-12-27 05:35:38',1073741825,'log.review.reviewerAssigned',0),
(231,1048585,15,3,'2024-12-27 05:35:42',805306371,'editor.submission.decision.accept.log',0),
(232,1048585,15,3,'2024-12-27 05:35:48',268435459,'submission.event.participantAdded',0),
(233,1048585,15,3,'2024-12-27 05:35:52',805306371,'editor.submission.decision.sendToProduction.log',0),
(234,1048585,15,3,'2024-12-27 05:35:57',268435459,'submission.event.participantAdded',0),
(235,1048585,16,32,'2024-12-27 05:36:04',268435458,'submission.event.general.metadataUpdated',0),
(236,1048585,16,32,'2024-12-27 05:36:04',268435458,'submission.event.general.metadataUpdated',0),
(237,515,37,32,'2024-12-27 05:36:06',1342177281,'submission.event.fileUploaded',0),
(238,1048585,16,32,'2024-12-27 05:36:06',1342177288,'submission.event.fileRevised',0),
(239,515,37,32,'2024-12-27 05:36:06',1342177296,'submission.event.fileEdited',0),
(240,1048585,16,32,'2024-12-27 05:36:07',268435457,'submission.event.submissionSubmitted',0),
(241,1048585,17,33,'2024-12-27 05:36:13',268435458,'submission.event.general.metadataUpdated',0),
(242,1048585,17,33,'2024-12-27 05:36:14',268435458,'submission.event.general.metadataUpdated',0),
(243,515,38,33,'2024-12-27 05:36:16',1342177281,'submission.event.fileUploaded',0),
(244,1048585,17,33,'2024-12-27 05:36:16',1342177288,'submission.event.fileRevised',0),
(245,515,38,33,'2024-12-27 05:36:16',1342177296,'submission.event.fileEdited',0),
(246,1048585,17,33,'2024-12-27 05:36:17',268435457,'submission.event.submissionSubmitted',0),
(247,1048585,17,3,'2024-12-27 05:36:24',805306371,'editor.submission.decision.sendExternalReview.log',0),
(248,515,39,3,'2024-12-27 05:36:24',1342177281,'submission.event.fileUploaded',0),
(249,1048585,17,3,'2024-12-27 05:36:24',1342177288,'submission.event.fileRevised',0),
(250,1048585,17,3,'2024-12-27 05:36:30',1073741825,'log.review.reviewerAssigned',0),
(251,1048585,17,3,'2024-12-27 05:36:32',1073741825,'log.review.reviewerAssigned',0),
(252,1048585,17,3,'2024-12-27 05:36:36',805306371,'editor.submission.decision.accept.log',0),
(253,1048585,17,3,'2024-12-27 05:36:42',268435459,'submission.event.participantAdded',0),
(254,1048585,17,3,'2024-12-27 05:36:46',805306371,'editor.submission.decision.sendToProduction.log',0),
(255,1048585,17,3,'2024-12-27 05:36:52',268435459,'submission.event.participantAdded',0),
(256,1048585,17,3,'2024-12-27 05:36:55',268435459,'submission.event.participantAdded',0),
(257,515,40,3,'2024-12-27 05:36:59',1342177281,'submission.event.fileUploaded',0),
(258,1048585,17,3,'2024-12-27 05:36:59',1342177288,'submission.event.fileRevised',0),
(259,515,40,3,'2024-12-27 05:37:00',1342177296,'submission.event.fileEdited',0),
(260,1048585,17,3,'2024-12-27 05:37:08',268435458,'submission.event.general.metadataUpdated',0),
(261,1048585,17,3,'2024-12-27 05:37:10',268435462,'publication.event.scheduled',0),
(262,1048585,17,3,'2024-12-27 05:37:17',268435462,'publication.event.published',0),
(263,1048585,17,3,'2024-12-27 05:37:22',268435463,'publication.event.unpublished',0),
(264,1048585,17,3,'2024-12-27 05:37:22',268435462,'publication.event.scheduled',0),
(265,1048585,17,3,'2024-12-27 05:37:28',268435462,'publication.event.published',0),
(266,1048585,17,3,'2024-12-27 05:37:34',268435463,'publication.event.unpublished',0),
(267,1048585,17,3,'2024-12-27 05:37:34',268435458,'submission.event.general.metadataUpdated',0),
(268,1048585,17,3,'2024-12-27 05:37:45',268435458,'submission.event.general.metadataUpdated',0),
(269,1048585,17,3,'2024-12-27 05:37:47',268435462,'publication.event.published',0),
(270,1048585,18,34,'2024-12-27 05:38:00',268435458,'submission.event.general.metadataUpdated',0),
(271,1048585,18,34,'2024-12-27 05:38:00',268435458,'submission.event.general.metadataUpdated',0),
(272,515,41,34,'2024-12-27 05:38:02',1342177281,'submission.event.fileUploaded',0),
(273,1048585,18,34,'2024-12-27 05:38:02',1342177288,'submission.event.fileRevised',0),
(274,515,41,34,'2024-12-27 05:38:02',1342177296,'submission.event.fileEdited',0),
(275,1048585,18,34,'2024-12-27 05:38:03',268435457,'submission.event.submissionSubmitted',0),
(276,1048585,18,3,'2024-12-27 05:38:11',805306371,'editor.submission.decision.decline.log',0),
(277,1048585,19,35,'2024-12-27 05:38:20',268435458,'submission.event.general.metadataUpdated',0),
(278,1048585,19,35,'2024-12-27 05:38:20',268435458,'submission.event.general.metadataUpdated',0),
(279,515,42,35,'2024-12-27 05:38:22',1342177281,'submission.event.fileUploaded',0),
(280,1048585,19,35,'2024-12-27 05:38:22',1342177288,'submission.event.fileRevised',0),
(281,515,42,35,'2024-12-27 05:38:22',1342177296,'submission.event.fileEdited',0),
(282,1048585,19,35,'2024-12-27 05:38:23',268435457,'submission.event.submissionSubmitted',0),
(283,1048585,19,3,'2024-12-27 05:38:31',805306371,'editor.submission.decision.sendExternalReview.log',0),
(284,515,43,3,'2024-12-27 05:38:31',1342177281,'submission.event.fileUploaded',0),
(285,1048585,19,3,'2024-12-27 05:38:31',1342177288,'submission.event.fileRevised',0),
(286,1048585,19,3,'2024-12-27 05:38:36',1073741825,'log.review.reviewerAssigned',0),
(287,1048585,19,3,'2024-12-27 05:38:38',1073741825,'log.review.reviewerAssigned',0),
(288,1048585,19,3,'2024-12-27 05:38:42',805306371,'editor.submission.decision.accept.log',0),
(289,1048585,19,3,'2024-12-27 05:38:48',268435459,'submission.event.participantAdded',0);
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
) ENGINE=InnoDB AUTO_INCREMENT=989 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='Data about an event log entry. This data is commonly used to display information about an event to a user.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `event_log_settings`
--

LOCK TABLES `event_log_settings` WRITE;
/*!40000 ALTER TABLE `event_log_settings` DISABLE KEYS */;
INSERT INTO `event_log_settings` VALUES
(1,4,'','fileId','1'),
(2,4,'en','filename','Signalling Theory Dividends: A Review Of The Literature And Empirical Evidence.pdf'),
(3,4,'','fileStage','2'),
(4,4,'','submissionFileId','1'),
(5,4,'','submissionId','1'),
(6,4,'','username','amwandenga'),
(7,5,'','fileId','1'),
(8,5,'en','filename','Signalling Theory Dividends: A Review Of The Literature And Empirical Evidence.pdf'),
(9,5,'','fileStage','2'),
(10,5,'','submissionFileId','1'),
(11,5,'','submissionId','1'),
(12,5,'','username','amwandenga'),
(13,6,'','fileId','1'),
(14,6,'en','filename','Signalling Theory Dividends: A Review Of The Literature And Empirical Evidence.pdf'),
(15,6,'','fileStage','2'),
(16,6,'','submissionFileId','1'),
(17,6,'','submissionId','1'),
(18,6,'','username','amwandenga'),
(19,7,'','fileId','2'),
(20,7,'en','filename','structured-interview-guide.odt'),
(21,7,'','fileStage','2'),
(22,7,'','submissionFileId','2'),
(23,7,'','submissionId','1'),
(24,7,'','username','amwandenga'),
(25,8,'','fileId','2'),
(26,8,'en','filename','structured-interview-guide.odt'),
(27,8,'','fileStage','2'),
(28,8,'','submissionFileId','2'),
(29,8,'','submissionId','1'),
(30,8,'','username','amwandenga'),
(31,9,'','fileId','2'),
(32,9,'en','filename','structured-interview-guide.odt'),
(33,9,'','fileStage','2'),
(34,9,'','submissionFileId','2'),
(35,9,'','submissionId','1'),
(36,9,'','username','amwandenga'),
(37,10,'','fileId','3'),
(38,10,'en','filename','response-evaluation-all-team-members-draft-after-edits-final-version-final.ods'),
(39,10,'','fileStage','2'),
(40,10,'','submissionFileId','3'),
(41,10,'','submissionId','1'),
(42,10,'','username','amwandenga'),
(43,11,'','fileId','3'),
(44,11,'en','filename','response-evaluation-all-team-members-draft-after-edits-final-version-final.ods'),
(45,11,'','fileStage','2'),
(46,11,'','submissionFileId','3'),
(47,11,'','submissionId','1'),
(48,11,'','username','amwandenga'),
(49,12,'','fileId','3'),
(50,12,'en','filename','response-evaluation-all-team-members-draft-after-edits-final-version-final.ods'),
(51,12,'','fileStage','2'),
(52,12,'','submissionFileId','3'),
(53,12,'','submissionId','1'),
(54,12,'','username','amwandenga'),
(55,13,'','fileId','4'),
(56,13,'en','filename','signalling-theory-dataset.pdf'),
(57,13,'','fileStage','2'),
(58,13,'','submissionFileId','4'),
(59,13,'','submissionId','1'),
(60,13,'','username','amwandenga'),
(61,14,'','fileId','4'),
(62,14,'en','filename','signalling-theory-dataset.pdf'),
(63,14,'','fileStage','2'),
(64,14,'','submissionFileId','4'),
(65,14,'','submissionId','1'),
(66,14,'','username','amwandenga'),
(67,15,'','fileId','4'),
(68,15,'en','filename','signalling-theory-dataset.pdf'),
(69,15,'','fileStage','2'),
(70,15,'','submissionFileId','4'),
(71,15,'','submissionId','1'),
(72,15,'','username','amwandenga'),
(73,16,'','fileId','5'),
(74,16,'en','filename','author-disclosure-form.docx'),
(75,16,'','fileStage','2'),
(76,16,'','submissionFileId','5'),
(77,16,'','submissionId','1'),
(78,16,'','username','amwandenga'),
(79,17,'','fileId','5'),
(80,17,'en','filename','author-disclosure-form.docx'),
(81,17,'','fileStage','2'),
(82,17,'','submissionFileId','5'),
(83,17,'','submissionId','1'),
(84,17,'','username','amwandenga'),
(85,18,'','fileId','5'),
(86,18,'en','filename','author-disclosure-form.docx'),
(87,18,'','fileStage','2'),
(88,18,'','submissionFileId','5'),
(89,18,'','submissionId','1'),
(90,18,'','username','amwandenga'),
(91,19,'','fileId','6'),
(92,19,'en','filename','delete-this-file.pdf'),
(93,19,'','fileStage','2'),
(94,19,'','submissionFileId','6'),
(95,19,'','submissionId','1'),
(96,19,'','username','amwandenga'),
(97,20,'','fileId','6'),
(98,20,'en','filename','delete-this-file.pdf'),
(99,20,'','fileStage','2'),
(100,20,'','submissionFileId','6'),
(101,20,'','submissionId','1'),
(102,20,'','username','amwandenga'),
(103,21,'','fileId','6'),
(104,21,'en','filename','delete-this-file.pdf'),
(105,21,'','fileStage','2'),
(106,21,'','submissionFileId','6'),
(107,21,'','submissionId','1'),
(108,21,'','username','amwandenga'),
(109,22,'','fileId','6'),
(110,22,'en','filename','delete-this-file.pdf'),
(111,22,'','fileStage','2'),
(112,22,'','submissionFileId','6'),
(113,22,'','submissionId','1'),
(114,22,'','username','amwandenga'),
(115,24,'','editorName','Daniel Barnes'),
(116,25,'','fileId','5'),
(117,25,'en','filename','author-disclosure-form.docx'),
(118,25,'','fileStage','4'),
(119,25,'','sourceSubmissionFileId','5'),
(120,25,'','submissionFileId','7'),
(121,25,'','submissionId','1'),
(122,25,'','username','dbarnes'),
(123,26,'','fileId','5'),
(124,26,'en','filename','author-disclosure-form.docx'),
(125,26,'','fileStage','4'),
(126,26,'','sourceSubmissionFileId','5'),
(127,26,'','submissionFileId','7'),
(128,26,'','submissionId','1'),
(129,26,'','username','dbarnes'),
(130,27,'','fileId','4'),
(131,27,'en','filename','signalling-theory-dataset.pdf'),
(132,27,'','fileStage','4'),
(133,27,'','sourceSubmissionFileId','4'),
(134,27,'','submissionFileId','8'),
(135,27,'','submissionId','1'),
(136,27,'','username','dbarnes'),
(137,28,'','fileId','4'),
(138,28,'en','filename','signalling-theory-dataset.pdf'),
(139,28,'','fileStage','4'),
(140,28,'','sourceSubmissionFileId','4'),
(141,28,'','submissionFileId','8'),
(142,28,'','submissionId','1'),
(143,28,'','username','dbarnes'),
(144,29,'','fileId','3'),
(145,29,'en','filename','response-evaluation-all-team-members-draft-after-edits-final-version-final.ods'),
(146,29,'','fileStage','4'),
(147,29,'','sourceSubmissionFileId','3'),
(148,29,'','submissionFileId','9'),
(149,29,'','submissionId','1'),
(150,29,'','username','dbarnes'),
(151,30,'','fileId','3'),
(152,30,'en','filename','response-evaluation-all-team-members-draft-after-edits-final-version-final.ods'),
(153,30,'','fileStage','4'),
(154,30,'','sourceSubmissionFileId','3'),
(155,30,'','submissionFileId','9'),
(156,30,'','submissionId','1'),
(157,30,'','username','dbarnes'),
(158,31,'','fileId','2'),
(159,31,'en','filename','structured-interview-guide.odt'),
(160,31,'','fileStage','4'),
(161,31,'','sourceSubmissionFileId','2'),
(162,31,'','submissionFileId','10'),
(163,31,'','submissionId','1'),
(164,31,'','username','dbarnes'),
(165,32,'','fileId','2'),
(166,32,'en','filename','structured-interview-guide.odt'),
(167,32,'','fileStage','4'),
(168,32,'','sourceSubmissionFileId','2'),
(169,32,'','submissionFileId','10'),
(170,32,'','submissionId','1'),
(171,32,'','username','dbarnes'),
(172,33,'','fileId','1'),
(173,33,'en','filename','Signalling Theory Dividends: A Review Of The Literature And Empirical Evidence.pdf'),
(174,33,'','fileStage','4'),
(175,33,'','sourceSubmissionFileId','1'),
(176,33,'','submissionFileId','11'),
(177,33,'','submissionId','1'),
(178,33,'','username','dbarnes'),
(179,34,'','fileId','1'),
(180,34,'en','filename','Signalling Theory Dividends: A Review Of The Literature And Empirical Evidence.pdf'),
(181,34,'','fileStage','4'),
(182,34,'','sourceSubmissionFileId','1'),
(183,34,'','submissionFileId','11'),
(184,34,'','submissionId','1'),
(185,34,'','username','dbarnes'),
(186,35,'','reviewerName','Julie Janssen'),
(187,35,'','round','1'),
(188,35,'','stageId','3'),
(189,35,'','submissionId','1'),
(190,36,'','reviewerName','Aisla McCrae'),
(191,36,'','round','1'),
(192,36,'','stageId','3'),
(193,36,'','submissionId','1'),
(194,37,'','reviewerName','Adela Gallego'),
(195,37,'','round','1'),
(196,37,'','stageId','3'),
(197,37,'','submissionId','1'),
(198,38,'','editorName','Daniel Barnes'),
(199,39,'','userFullName','Sarah Vogt'),
(200,39,'en','userGroupName','Copyeditor'),
(201,39,'fr_CA','userGroupName','Réviseur-e'),
(202,39,'','username','svogt'),
(203,40,'','editorName','Daniel Barnes'),
(204,41,'','userFullName','Stephen Hellier'),
(205,41,'en','userGroupName','Layout Editor'),
(206,41,'fr_CA','userGroupName','Responsable de la mise en page'),
(207,41,'','username','shellier'),
(208,42,'','userFullName','Sabine Kumar'),
(209,42,'en','userGroupName','Proofreader'),
(210,42,'fr_CA','userGroupName','Correcteur-trice d\'épreuves'),
(211,42,'','username','skumar'),
(212,47,'','fileId','7'),
(213,47,'en','filename','article.pdf'),
(214,47,'','fileStage','10'),
(215,47,'','submissionFileId','12'),
(216,47,'','submissionId','1'),
(217,47,'','username','dbarnes'),
(218,48,'','fileId','7'),
(219,48,'en','filename','article.pdf'),
(220,48,'','fileStage','10'),
(221,48,'','submissionFileId','12'),
(222,48,'','submissionId','1'),
(223,48,'','username','dbarnes'),
(224,49,'','fileId','7'),
(225,49,'en','filename','article.pdf'),
(226,49,'','fileStage','10'),
(227,49,'','submissionFileId','12'),
(228,49,'','submissionId','1'),
(229,49,'','username','dbarnes'),
(230,50,'','userFullName','Alan Mwandenga'),
(231,50,'en','userGroupName','Author'),
(232,50,'fr_CA','userGroupName','Auteur-e'),
(233,50,'','username','amwandenga'),
(234,62,'','userFullName','Stephanie Berardo'),
(235,62,'en','userGroupName','Section editor'),
(236,62,'fr_CA','userGroupName','Rédacteur-trice de rubrique'),
(237,62,'','username','sberardo'),
(238,63,'','userFullName','Stephanie Berardo'),
(239,63,'en','userGroupName','Section editor'),
(240,63,'fr_CA','userGroupName','Rédacteur-trice de rubrique'),
(241,63,'','username','sberardo'),
(242,66,'','fileId','8'),
(243,66,'en','filename','The influence of lactation on the quantity and quality of cashmere production.pdf'),
(244,66,'','fileStage','2'),
(245,66,'','submissionFileId','13'),
(246,66,'','submissionId','2'),
(247,66,'','username','ccorino'),
(248,67,'','fileId','8'),
(249,67,'en','filename','The influence of lactation on the quantity and quality of cashmere production.pdf'),
(250,67,'','fileStage','2'),
(251,67,'','submissionFileId','13'),
(252,67,'','submissionId','2'),
(253,67,'','username','ccorino'),
(254,68,'','fileId','8'),
(255,68,'en','filename','The influence of lactation on the quantity and quality of cashmere production.pdf'),
(256,68,'','fileStage','2'),
(257,68,'','submissionFileId','13'),
(258,68,'','submissionId','2'),
(259,68,'','username','ccorino'),
(260,70,'','editorName','Daniel Barnes'),
(261,71,'','fileId','8'),
(262,71,'en','filename','The influence of lactation on the quantity and quality of cashmere production.pdf'),
(263,71,'','fileStage','4'),
(264,71,'','sourceSubmissionFileId','13'),
(265,71,'','submissionFileId','14'),
(266,71,'','submissionId','2'),
(267,71,'','username','dbarnes'),
(268,72,'','fileId','8'),
(269,72,'en','filename','The influence of lactation on the quantity and quality of cashmere production.pdf'),
(270,72,'','fileStage','4'),
(271,72,'','sourceSubmissionFileId','13'),
(272,72,'','submissionFileId','14'),
(273,72,'','submissionId','2'),
(274,72,'','username','dbarnes'),
(275,73,'','userFullName','Minoti Inoue'),
(276,73,'en','userGroupName','Section editor'),
(277,73,'fr_CA','userGroupName','Rédacteur-trice de rubrique'),
(278,73,'','username','minoue'),
(279,75,'','editorName','Minoti Inoue'),
(280,78,'','fileId','9'),
(281,78,'en','filename','The Facets Of Job Satisfaction: A Nine-Nation Comparative Study Of Construct Equivalence.pdf'),
(282,78,'','fileStage','2'),
(283,78,'','submissionFileId','15'),
(284,78,'','submissionId','3'),
(285,78,'','username','ckwantes'),
(286,79,'','fileId','9'),
(287,79,'en','filename','The Facets Of Job Satisfaction: A Nine-Nation Comparative Study Of Construct Equivalence.pdf'),
(288,79,'','fileStage','2'),
(289,79,'','submissionFileId','15'),
(290,79,'','submissionId','3'),
(291,79,'','username','ckwantes'),
(292,80,'','fileId','9'),
(293,80,'en','filename','The Facets Of Job Satisfaction: A Nine-Nation Comparative Study Of Construct Equivalence.pdf'),
(294,80,'','fileStage','2'),
(295,80,'','submissionFileId','15'),
(296,80,'','submissionId','3'),
(297,80,'','username','ckwantes'),
(298,82,'','editorName','Daniel Barnes'),
(299,83,'','fileId','9'),
(300,83,'en','filename','The Facets Of Job Satisfaction: A Nine-Nation Comparative Study Of Construct Equivalence.pdf'),
(301,83,'','fileStage','4'),
(302,83,'','sourceSubmissionFileId','15'),
(303,83,'','submissionFileId','16'),
(304,83,'','submissionId','3'),
(305,83,'','username','dbarnes'),
(306,84,'','fileId','9'),
(307,84,'en','filename','The Facets Of Job Satisfaction: A Nine-Nation Comparative Study Of Construct Equivalence.pdf'),
(308,84,'','fileStage','4'),
(309,84,'','sourceSubmissionFileId','15'),
(310,84,'','submissionFileId','16'),
(311,84,'','submissionId','3'),
(312,84,'','username','dbarnes'),
(313,85,'','reviewerName','Aisla McCrae'),
(314,85,'','round','1'),
(315,85,'','stageId','3'),
(316,85,'','submissionId','3'),
(317,86,'','reviewerName','Adela Gallego'),
(318,86,'','round','1'),
(319,86,'','stageId','3'),
(320,86,'','submissionId','3'),
(321,87,'','editorName','Daniel Barnes'),
(322,88,'','userFullName','Maria Fritz'),
(323,88,'en','userGroupName','Copyeditor'),
(324,88,'fr_CA','userGroupName','Réviseur-e'),
(325,88,'','username','mfritz'),
(326,91,'','fileId','10'),
(327,91,'en','filename','Computer Skill Requirements for New and Existing Teachers: Implications for Policy and Practice.pdf'),
(328,91,'','fileStage','2'),
(329,91,'','submissionFileId','17'),
(330,91,'','submissionId','4'),
(331,91,'','username','cmontgomerie'),
(332,92,'','fileId','10'),
(333,92,'en','filename','Computer Skill Requirements for New and Existing Teachers: Implications for Policy and Practice.pdf'),
(334,92,'','fileStage','2'),
(335,92,'','submissionFileId','17'),
(336,92,'','submissionId','4'),
(337,92,'','username','cmontgomerie'),
(338,93,'','fileId','10'),
(339,93,'en','filename','Computer Skill Requirements for New and Existing Teachers: Implications for Policy and Practice.pdf'),
(340,93,'','fileStage','2'),
(341,93,'','submissionFileId','17'),
(342,93,'','submissionId','4'),
(343,93,'','username','cmontgomerie'),
(344,97,'','fileId','11'),
(345,97,'en','filename','Genetic transformation of forest trees.pdf'),
(346,97,'','fileStage','2'),
(347,97,'','submissionFileId','18'),
(348,97,'','submissionId','5'),
(349,97,'','username','ddiouf'),
(350,98,'','fileId','11'),
(351,98,'en','filename','Genetic transformation of forest trees.pdf'),
(352,98,'','fileStage','2'),
(353,98,'','submissionFileId','18'),
(354,98,'','submissionId','5'),
(355,98,'','username','ddiouf'),
(356,99,'','fileId','11'),
(357,99,'en','filename','Genetic transformation of forest trees.pdf'),
(358,99,'','fileStage','2'),
(359,99,'','submissionFileId','18'),
(360,99,'','submissionId','5'),
(361,99,'','username','ddiouf'),
(362,101,'','editorName','Daniel Barnes'),
(363,102,'','fileId','11'),
(364,102,'en','filename','Genetic transformation of forest trees.pdf'),
(365,102,'','fileStage','4'),
(366,102,'','sourceSubmissionFileId','18'),
(367,102,'','submissionFileId','19'),
(368,102,'','submissionId','5'),
(369,102,'','username','dbarnes'),
(370,103,'','fileId','11'),
(371,103,'en','filename','Genetic transformation of forest trees.pdf'),
(372,103,'','fileStage','4'),
(373,103,'','sourceSubmissionFileId','18'),
(374,103,'','submissionFileId','19'),
(375,103,'','submissionId','5'),
(376,103,'','username','dbarnes'),
(377,104,'','reviewerName','Paul Hudson'),
(378,104,'','round','1'),
(379,104,'','stageId','3'),
(380,104,'','submissionId','5'),
(381,105,'','reviewerName','Adela Gallego'),
(382,105,'','round','1'),
(383,105,'','stageId','3'),
(384,105,'','submissionId','5'),
(385,106,'','editorName','Daniel Barnes'),
(386,107,'','userFullName','Maria Fritz'),
(387,107,'en','userGroupName','Copyeditor'),
(388,107,'fr_CA','userGroupName','Réviseur-e'),
(389,107,'','username','mfritz'),
(390,108,'','editorName','Daniel Barnes'),
(391,109,'','userFullName','Graham Cox'),
(392,109,'en','userGroupName','Layout Editor'),
(393,109,'fr_CA','userGroupName','Responsable de la mise en page'),
(394,109,'','username','gcox'),
(395,110,'','userFullName','Catherine Turner'),
(396,110,'en','userGroupName','Proofreader'),
(397,110,'fr_CA','userGroupName','Correcteur-trice d\'épreuves'),
(398,110,'','username','cturner'),
(399,113,'','fileId','12'),
(400,113,'en','filename','Investigating the Shared Background Required for Argument: A Critique of Fogelin\'s Thesis on Deep Disagreement.pdf'),
(401,113,'','fileStage','2'),
(402,113,'','submissionFileId','20'),
(403,113,'','submissionId','6'),
(404,113,'','username','dphillips'),
(405,114,'','fileId','12'),
(406,114,'en','filename','Investigating the Shared Background Required for Argument: A Critique of Fogelin\'s Thesis on Deep Disagreement.pdf'),
(407,114,'','fileStage','2'),
(408,114,'','submissionFileId','20'),
(409,114,'','submissionId','6'),
(410,114,'','username','dphillips'),
(411,115,'','fileId','12'),
(412,115,'en','filename','Investigating the Shared Background Required for Argument: A Critique of Fogelin\'s Thesis on Deep Disagreement.pdf'),
(413,115,'','fileStage','2'),
(414,115,'','submissionFileId','20'),
(415,115,'','submissionId','6'),
(416,115,'','username','dphillips'),
(417,117,'','editorName','Daniel Barnes'),
(418,118,'','fileId','12'),
(419,118,'en','filename','Investigating the Shared Background Required for Argument: A Critique of Fogelin\'s Thesis on Deep Disagreement.pdf'),
(420,118,'','fileStage','4'),
(421,118,'','sourceSubmissionFileId','20'),
(422,118,'','submissionFileId','21'),
(423,118,'','submissionId','6'),
(424,118,'','username','dbarnes'),
(425,119,'','fileId','12'),
(426,119,'en','filename','Investigating the Shared Background Required for Argument: A Critique of Fogelin\'s Thesis on Deep Disagreement.pdf'),
(427,119,'','fileStage','4'),
(428,119,'','sourceSubmissionFileId','20'),
(429,119,'','submissionFileId','21'),
(430,119,'','submissionId','6'),
(431,119,'','username','dbarnes'),
(432,120,'','reviewerName','Julie Janssen'),
(433,120,'','round','1'),
(434,120,'','stageId','3'),
(435,120,'','submissionId','6'),
(436,121,'','reviewerName','Adela Gallego'),
(437,121,'','round','1'),
(438,121,'','stageId','3'),
(439,121,'','submissionId','6'),
(440,122,'','editorName','Daniel Barnes'),
(441,123,'','userFullName','Maria Fritz'),
(442,123,'en','userGroupName','Copyeditor'),
(443,123,'fr_CA','userGroupName','Réviseur-e'),
(444,123,'','username','mfritz'),
(445,124,'','editorName','Daniel Barnes'),
(446,125,'','userFullName','Graham Cox'),
(447,125,'en','userGroupName','Layout Editor'),
(448,125,'fr_CA','userGroupName','Responsable de la mise en page'),
(449,125,'','username','gcox'),
(450,128,'','fileId','13'),
(451,128,'en','filename','Developing efficacy beliefs in the classroom.pdf'),
(452,128,'','fileStage','2'),
(453,128,'','submissionFileId','22'),
(454,128,'','submissionId','7'),
(455,128,'','username','dsokoloff'),
(456,129,'','fileId','13'),
(457,129,'en','filename','Developing efficacy beliefs in the classroom.pdf'),
(458,129,'','fileStage','2'),
(459,129,'','submissionFileId','22'),
(460,129,'','submissionId','7'),
(461,129,'','username','dsokoloff'),
(462,130,'','fileId','13'),
(463,130,'en','filename','Developing efficacy beliefs in the classroom.pdf'),
(464,130,'','fileStage','2'),
(465,130,'','submissionFileId','22'),
(466,130,'','submissionId','7'),
(467,130,'','username','dsokoloff'),
(468,132,'','editorName','Daniel Barnes'),
(469,133,'','fileId','13'),
(470,133,'en','filename','Developing efficacy beliefs in the classroom.pdf'),
(471,133,'','fileStage','4'),
(472,133,'','sourceSubmissionFileId','22'),
(473,133,'','submissionFileId','23'),
(474,133,'','submissionId','7'),
(475,133,'','username','dbarnes'),
(476,134,'','fileId','13'),
(477,134,'en','filename','Developing efficacy beliefs in the classroom.pdf'),
(478,134,'','fileStage','4'),
(479,134,'','sourceSubmissionFileId','22'),
(480,134,'','submissionFileId','23'),
(481,134,'','submissionId','7'),
(482,134,'','username','dbarnes'),
(483,135,'','reviewerName','Paul Hudson'),
(484,135,'','round','1'),
(485,135,'','stageId','3'),
(486,135,'','submissionId','7'),
(487,136,'','reviewerName','Aisla McCrae'),
(488,136,'','round','1'),
(489,136,'','stageId','3'),
(490,136,'','submissionId','7'),
(491,137,'','reviewerName','Adela Gallego'),
(492,137,'','round','1'),
(493,137,'','stageId','3'),
(494,137,'','submissionId','7'),
(495,138,'','reviewAssignmentId','10'),
(496,138,'','reviewerName','Paul Hudson'),
(497,138,'','round','1'),
(498,138,'','submissionId','7'),
(499,139,'','reviewAssignmentId','10'),
(500,139,'','reviewerName','Paul Hudson'),
(501,139,'','round','1'),
(502,139,'','submissionId','7'),
(503,142,'','fileId','14'),
(504,142,'en','filename','Traditions and Trends in the Study of the Commons.pdf'),
(505,142,'','fileStage','2'),
(506,142,'','submissionFileId','24'),
(507,142,'','submissionId','8'),
(508,142,'','username','eostrom'),
(509,143,'','fileId','14'),
(510,143,'en','filename','Traditions and Trends in the Study of the Commons.pdf'),
(511,143,'','fileStage','2'),
(512,143,'','submissionFileId','24'),
(513,143,'','submissionId','8'),
(514,143,'','username','eostrom'),
(515,144,'','fileId','14'),
(516,144,'en','filename','Traditions and Trends in the Study of the Commons.pdf'),
(517,144,'','fileStage','2'),
(518,144,'','submissionFileId','24'),
(519,144,'','submissionId','8'),
(520,144,'','username','eostrom'),
(521,148,'','fileId','15'),
(522,148,'en','filename','Hansen & Pinto: Reason Reclaimed.pdf'),
(523,148,'','fileStage','2'),
(524,148,'','submissionFileId','25'),
(525,148,'','submissionId','9'),
(526,148,'','username','fpaglieri'),
(527,149,'','fileId','15'),
(528,149,'en','filename','Hansen & Pinto: Reason Reclaimed.pdf'),
(529,149,'','fileStage','2'),
(530,149,'','submissionFileId','25'),
(531,149,'','submissionId','9'),
(532,149,'','username','fpaglieri'),
(533,150,'','fileId','15'),
(534,150,'en','filename','Hansen & Pinto: Reason Reclaimed.pdf'),
(535,150,'','fileStage','2'),
(536,150,'','submissionFileId','25'),
(537,150,'','submissionId','9'),
(538,150,'','username','fpaglieri'),
(539,152,'','editorName','Daniel Barnes'),
(540,153,'','fileId','15'),
(541,153,'en','filename','Hansen & Pinto: Reason Reclaimed.pdf'),
(542,153,'','fileStage','4'),
(543,153,'','sourceSubmissionFileId','25'),
(544,153,'','submissionFileId','26'),
(545,153,'','submissionId','9'),
(546,153,'','username','dbarnes'),
(547,154,'','fileId','15'),
(548,154,'en','filename','Hansen & Pinto: Reason Reclaimed.pdf'),
(549,154,'','fileStage','4'),
(550,154,'','sourceSubmissionFileId','25'),
(551,154,'','submissionFileId','26'),
(552,154,'','submissionId','9'),
(553,154,'','username','dbarnes'),
(554,155,'','reviewerName','Julie Janssen'),
(555,155,'','round','1'),
(556,155,'','stageId','3'),
(557,155,'','submissionId','9'),
(558,156,'','reviewerName','Adela Gallego'),
(559,156,'','round','1'),
(560,156,'','stageId','3'),
(561,156,'','submissionId','9'),
(562,157,'','editorName','Daniel Barnes'),
(563,158,'','userFullName','Sarah Vogt'),
(564,158,'en','userGroupName','Copyeditor'),
(565,158,'fr_CA','userGroupName','Réviseur-e'),
(566,158,'','username','svogt'),
(567,159,'','editorName','Daniel Barnes'),
(568,160,'','userFullName','Stephen Hellier'),
(569,160,'en','userGroupName','Layout Editor'),
(570,160,'fr_CA','userGroupName','Responsable de la mise en page'),
(571,160,'','username','shellier'),
(572,161,'','userFullName','Sabine Kumar'),
(573,161,'en','userGroupName','Proofreader'),
(574,161,'fr_CA','userGroupName','Correcteur-trice d\'épreuves'),
(575,161,'','username','skumar'),
(576,164,'','fileId','16'),
(577,164,'en','filename','Condensing Water Availability Models to Focus on Specific Water Management Systems.pdf'),
(578,164,'','fileStage','2'),
(579,164,'','submissionFileId','27'),
(580,164,'','submissionId','10'),
(581,164,'','username','jnovak'),
(582,165,'','fileId','16'),
(583,165,'en','filename','Condensing Water Availability Models to Focus on Specific Water Management Systems.pdf'),
(584,165,'','fileStage','2'),
(585,165,'','submissionFileId','27'),
(586,165,'','submissionId','10'),
(587,165,'','username','jnovak'),
(588,166,'','fileId','16'),
(589,166,'en','filename','Condensing Water Availability Models to Focus on Specific Water Management Systems.pdf'),
(590,166,'','fileStage','2'),
(591,166,'','submissionFileId','27'),
(592,166,'','submissionId','10'),
(593,166,'','username','jnovak'),
(594,168,'','editorName','Daniel Barnes'),
(595,169,'','fileId','16'),
(596,169,'en','filename','Condensing Water Availability Models to Focus on Specific Water Management Systems.pdf'),
(597,169,'','fileStage','4'),
(598,169,'','sourceSubmissionFileId','27'),
(599,169,'','submissionFileId','28'),
(600,169,'','submissionId','10'),
(601,169,'','username','dbarnes'),
(602,170,'','fileId','16'),
(603,170,'en','filename','Condensing Water Availability Models to Focus on Specific Water Management Systems.pdf'),
(604,170,'','fileStage','4'),
(605,170,'','sourceSubmissionFileId','27'),
(606,170,'','submissionFileId','28'),
(607,170,'','submissionId','10'),
(608,170,'','username','dbarnes'),
(609,171,'','reviewerName','Aisla McCrae'),
(610,171,'','round','1'),
(611,171,'','stageId','3'),
(612,171,'','submissionId','10'),
(613,172,'','reviewerName','Adela Gallego'),
(614,172,'','round','1'),
(615,172,'','stageId','3'),
(616,172,'','submissionId','10'),
(617,173,'','reviewAssignmentId','15'),
(618,173,'','reviewerName','Aisla McCrae'),
(619,173,'','round','1'),
(620,173,'','submissionId','10'),
(621,174,'','reviewAssignmentId','15'),
(622,174,'','reviewerName','Aisla McCrae'),
(623,174,'','round','1'),
(624,174,'','submissionId','10'),
(625,175,'','reviewAssignmentId','16'),
(626,175,'','reviewerName','Adela Gallego'),
(627,175,'','round','1'),
(628,175,'','submissionId','10'),
(629,176,'','reviewAssignmentId','16'),
(630,176,'','reviewerName','Adela Gallego'),
(631,176,'','round','1'),
(632,176,'','submissionId','10'),
(633,179,'','fileId','17'),
(634,179,'en','filename','Learning Sustainable Design through Service.pdf'),
(635,179,'','fileStage','2'),
(636,179,'','submissionFileId','29'),
(637,179,'','submissionId','11'),
(638,179,'','username','kalkhafaji'),
(639,180,'','fileId','17'),
(640,180,'en','filename','Learning Sustainable Design through Service.pdf'),
(641,180,'','fileStage','2'),
(642,180,'','submissionFileId','29'),
(643,180,'','submissionId','11'),
(644,180,'','username','kalkhafaji'),
(645,181,'','fileId','17'),
(646,181,'en','filename','Learning Sustainable Design through Service.pdf'),
(647,181,'','fileStage','2'),
(648,181,'','submissionFileId','29'),
(649,181,'','submissionId','11'),
(650,181,'','username','kalkhafaji'),
(651,185,'','fileId','18'),
(652,185,'en','filename','Sodium butyrate improves growth performance of weaned piglets during the first period after weaning.pdf'),
(653,185,'','fileStage','2'),
(654,185,'','submissionFileId','30'),
(655,185,'','submissionId','12'),
(656,185,'','username','lchristopher'),
(657,186,'','fileId','18'),
(658,186,'en','filename','Sodium butyrate improves growth performance of weaned piglets during the first period after weaning.pdf'),
(659,186,'','fileStage','2'),
(660,186,'','submissionFileId','30'),
(661,186,'','submissionId','12'),
(662,186,'','username','lchristopher'),
(663,187,'','fileId','18'),
(664,187,'en','filename','Sodium butyrate improves growth performance of weaned piglets during the first period after weaning.pdf'),
(665,187,'','fileStage','2'),
(666,187,'','submissionFileId','30'),
(667,187,'','submissionId','12'),
(668,187,'','username','lchristopher'),
(669,189,'','editorName','Daniel Barnes'),
(670,190,'','fileId','18'),
(671,190,'en','filename','Sodium butyrate improves growth performance of weaned piglets during the first period after weaning.pdf'),
(672,190,'','fileStage','4'),
(673,190,'','sourceSubmissionFileId','30'),
(674,190,'','submissionFileId','31'),
(675,190,'','submissionId','12'),
(676,190,'','username','dbarnes'),
(677,191,'','fileId','18'),
(678,191,'en','filename','Sodium butyrate improves growth performance of weaned piglets during the first period after weaning.pdf'),
(679,191,'','fileStage','4'),
(680,191,'','sourceSubmissionFileId','30'),
(681,191,'','submissionFileId','31'),
(682,191,'','submissionId','12'),
(683,191,'','username','dbarnes'),
(684,192,'','reviewerName','Julie Janssen'),
(685,192,'','round','1'),
(686,192,'','stageId','3'),
(687,192,'','submissionId','12'),
(688,193,'','reviewerName','Paul Hudson'),
(689,193,'','round','1'),
(690,193,'','stageId','3'),
(691,193,'','submissionId','12'),
(692,196,'','fileId','19'),
(693,196,'en','filename','Hydrologic Connectivity in the Edwards Aquifer between San Marcos Springs and Barton Springs during 2009 Drought Conditions.pdf'),
(694,196,'','fileStage','2'),
(695,196,'','submissionFileId','32'),
(696,196,'','submissionId','13'),
(697,196,'','username','lkumiega'),
(698,197,'','fileId','19'),
(699,197,'en','filename','Hydrologic Connectivity in the Edwards Aquifer between San Marcos Springs and Barton Springs during 2009 Drought Conditions.pdf'),
(700,197,'','fileStage','2'),
(701,197,'','submissionFileId','32'),
(702,197,'','submissionId','13'),
(703,197,'','username','lkumiega'),
(704,198,'','fileId','19'),
(705,198,'en','filename','Hydrologic Connectivity in the Edwards Aquifer between San Marcos Springs and Barton Springs during 2009 Drought Conditions.pdf'),
(706,198,'','fileStage','2'),
(707,198,'','submissionFileId','32'),
(708,198,'','submissionId','13'),
(709,198,'','username','lkumiega'),
(710,200,'','editorName','Daniel Barnes'),
(711,201,'','fileId','19'),
(712,201,'en','filename','Hydrologic Connectivity in the Edwards Aquifer between San Marcos Springs and Barton Springs during 2009 Drought Conditions.pdf'),
(713,201,'','fileStage','4'),
(714,201,'','sourceSubmissionFileId','32'),
(715,201,'','submissionFileId','33'),
(716,201,'','submissionId','13'),
(717,201,'','username','dbarnes'),
(718,202,'','fileId','19'),
(719,202,'en','filename','Hydrologic Connectivity in the Edwards Aquifer between San Marcos Springs and Barton Springs during 2009 Drought Conditions.pdf'),
(720,202,'','fileStage','4'),
(721,202,'','sourceSubmissionFileId','32'),
(722,202,'','submissionFileId','33'),
(723,202,'','submissionId','13'),
(724,202,'','username','dbarnes'),
(725,203,'','reviewerName','Julie Janssen'),
(726,203,'','round','1'),
(727,203,'','stageId','3'),
(728,203,'','submissionId','13'),
(729,204,'','reviewerName','Aisla McCrae'),
(730,204,'','round','1'),
(731,204,'','stageId','3'),
(732,204,'','submissionId','13'),
(733,205,'','reviewerName','Adela Gallego'),
(734,205,'','round','1'),
(735,205,'','stageId','3'),
(736,205,'','submissionId','13'),
(737,206,'','reviewAssignmentId','19'),
(738,206,'','reviewerName','Julie Janssen'),
(739,206,'','round','1'),
(740,206,'','submissionId','13'),
(741,207,'','reviewAssignmentId','19'),
(742,207,'','reviewerName','Julie Janssen'),
(743,207,'','round','1'),
(744,207,'','submissionId','13'),
(745,208,'','reviewAssignmentId','20'),
(746,208,'','reviewerName','Aisla McCrae'),
(747,208,'','round','1'),
(748,208,'','submissionId','13'),
(749,209,'','reviewAssignmentId','20'),
(750,209,'','reviewerName','Aisla McCrae'),
(751,209,'','round','1'),
(752,209,'','submissionId','13'),
(753,210,'','reviewAssignmentId','21'),
(754,210,'','reviewerName','Adela Gallego'),
(755,210,'','round','1'),
(756,210,'','submissionId','13'),
(757,211,'','reviewAssignmentId','21'),
(758,211,'','reviewerName','Adela Gallego'),
(759,211,'','round','1'),
(760,211,'','submissionId','13'),
(761,212,'','editorName','Daniel Barnes'),
(762,213,'','recipientCount','3'),
(763,213,'','subject','Thank you for your review'),
(764,216,'','fileId','20'),
(765,216,'en','filename','Towards Designing an Intercultural Curriculum: A Case Study from the Atlantic Coast of Nicaragua.pdf'),
(766,216,'','fileStage','2'),
(767,216,'','submissionFileId','34'),
(768,216,'','submissionId','14'),
(769,216,'','username','pdaniel'),
(770,217,'','fileId','20'),
(771,217,'en','filename','Towards Designing an Intercultural Curriculum: A Case Study from the Atlantic Coast of Nicaragua.pdf'),
(772,217,'','fileStage','2'),
(773,217,'','submissionFileId','34'),
(774,217,'','submissionId','14'),
(775,217,'','username','pdaniel'),
(776,218,'','fileId','20'),
(777,218,'en','filename','Towards Designing an Intercultural Curriculum: A Case Study from the Atlantic Coast of Nicaragua.pdf'),
(778,218,'','fileStage','2'),
(779,218,'','submissionFileId','34'),
(780,218,'','submissionId','14'),
(781,218,'','username','pdaniel'),
(782,222,'','fileId','21'),
(783,222,'en','filename','Yam diseases and its management in Nigeria.pdf'),
(784,222,'','fileStage','2'),
(785,222,'','submissionFileId','35'),
(786,222,'','submissionId','15'),
(787,222,'','username','rbaiyewu'),
(788,223,'','fileId','21'),
(789,223,'en','filename','Yam diseases and its management in Nigeria.pdf'),
(790,223,'','fileStage','2'),
(791,223,'','submissionFileId','35'),
(792,223,'','submissionId','15'),
(793,223,'','username','rbaiyewu'),
(794,224,'','fileId','21'),
(795,224,'en','filename','Yam diseases and its management in Nigeria.pdf'),
(796,224,'','fileStage','2'),
(797,224,'','submissionFileId','35'),
(798,224,'','submissionId','15'),
(799,224,'','username','rbaiyewu'),
(800,226,'','editorName','Daniel Barnes'),
(801,227,'','fileId','21'),
(802,227,'en','filename','Yam diseases and its management in Nigeria.pdf'),
(803,227,'','fileStage','4'),
(804,227,'','sourceSubmissionFileId','35'),
(805,227,'','submissionFileId','36'),
(806,227,'','submissionId','15'),
(807,227,'','username','dbarnes'),
(808,228,'','fileId','21'),
(809,228,'en','filename','Yam diseases and its management in Nigeria.pdf'),
(810,228,'','fileStage','4'),
(811,228,'','sourceSubmissionFileId','35'),
(812,228,'','submissionFileId','36'),
(813,228,'','submissionId','15'),
(814,228,'','username','dbarnes'),
(815,229,'','reviewerName','Paul Hudson'),
(816,229,'','round','1'),
(817,229,'','stageId','3'),
(818,229,'','submissionId','15'),
(819,230,'','reviewerName','Aisla McCrae'),
(820,230,'','round','1'),
(821,230,'','stageId','3'),
(822,230,'','submissionId','15'),
(823,231,'','editorName','Daniel Barnes'),
(824,232,'','userFullName','Sarah Vogt'),
(825,232,'en','userGroupName','Copyeditor'),
(826,232,'fr_CA','userGroupName','Réviseur-e'),
(827,232,'','username','svogt'),
(828,233,'','editorName','Daniel Barnes'),
(829,234,'','userFullName','Stephen Hellier'),
(830,234,'en','userGroupName','Layout Editor'),
(831,234,'fr_CA','userGroupName','Responsable de la mise en page'),
(832,234,'','username','shellier'),
(833,237,'','fileId','22'),
(834,237,'en','filename','Influence of long-term nutrition with different dietary fats on fatty acid composition of heavy pigs backfat.pdf'),
(835,237,'','fileStage','2'),
(836,237,'','submissionFileId','37'),
(837,237,'','submissionId','16'),
(838,237,'','username','rrossi'),
(839,238,'','fileId','22'),
(840,238,'en','filename','Influence of long-term nutrition with different dietary fats on fatty acid composition of heavy pigs backfat.pdf'),
(841,238,'','fileStage','2'),
(842,238,'','submissionFileId','37'),
(843,238,'','submissionId','16'),
(844,238,'','username','rrossi'),
(845,239,'','fileId','22'),
(846,239,'en','filename','Influence of long-term nutrition with different dietary fats on fatty acid composition of heavy pigs backfat.pdf'),
(847,239,'','fileStage','2'),
(848,239,'','submissionFileId','37'),
(849,239,'','submissionId','16'),
(850,239,'','username','rrossi'),
(851,243,'','fileId','23'),
(852,243,'en','filename','Antimicrobial, heavy metal resistance and plasmid profile of coliforms isolated from nosocomial infections in a hospital in Isfahan, Iran.pdf'),
(853,243,'','fileStage','2'),
(854,243,'','submissionFileId','38'),
(855,243,'','submissionId','17'),
(856,243,'','username','vkarbasizaed'),
(857,244,'','fileId','23'),
(858,244,'en','filename','Antimicrobial, heavy metal resistance and plasmid profile of coliforms isolated from nosocomial infections in a hospital in Isfahan, Iran.pdf'),
(859,244,'','fileStage','2'),
(860,244,'','submissionFileId','38'),
(861,244,'','submissionId','17'),
(862,244,'','username','vkarbasizaed'),
(863,245,'','fileId','23'),
(864,245,'en','filename','Antimicrobial, heavy metal resistance and plasmid profile of coliforms isolated from nosocomial infections in a hospital in Isfahan, Iran.pdf'),
(865,245,'','fileStage','2'),
(866,245,'','submissionFileId','38'),
(867,245,'','submissionId','17'),
(868,245,'','username','vkarbasizaed'),
(869,247,'','editorName','Daniel Barnes'),
(870,248,'','fileId','23'),
(871,248,'en','filename','Antimicrobial, heavy metal resistance and plasmid profile of coliforms isolated from nosocomial infections in a hospital in Isfahan, Iran.pdf'),
(872,248,'','fileStage','4'),
(873,248,'','sourceSubmissionFileId','38'),
(874,248,'','submissionFileId','39'),
(875,248,'','submissionId','17'),
(876,248,'','username','dbarnes'),
(877,249,'','fileId','23'),
(878,249,'en','filename','Antimicrobial, heavy metal resistance and plasmid profile of coliforms isolated from nosocomial infections in a hospital in Isfahan, Iran.pdf'),
(879,249,'','fileStage','4'),
(880,249,'','sourceSubmissionFileId','38'),
(881,249,'','submissionFileId','39'),
(882,249,'','submissionId','17'),
(883,249,'','username','dbarnes'),
(884,250,'','reviewerName','Julie Janssen'),
(885,250,'','round','1'),
(886,250,'','stageId','3'),
(887,250,'','submissionId','17'),
(888,251,'','reviewerName','Paul Hudson'),
(889,251,'','round','1'),
(890,251,'','stageId','3'),
(891,251,'','submissionId','17'),
(892,252,'','editorName','Daniel Barnes'),
(893,253,'','userFullName','Maria Fritz'),
(894,253,'en','userGroupName','Copyeditor'),
(895,253,'fr_CA','userGroupName','Réviseur-e'),
(896,253,'','username','mfritz'),
(897,254,'','editorName','Daniel Barnes'),
(898,255,'','userFullName','Graham Cox'),
(899,255,'en','userGroupName','Layout Editor'),
(900,255,'fr_CA','userGroupName','Responsable de la mise en page'),
(901,255,'','username','gcox'),
(902,256,'','userFullName','Catherine Turner'),
(903,256,'en','userGroupName','Proofreader'),
(904,256,'fr_CA','userGroupName','Correcteur-trice d\'épreuves'),
(905,256,'','username','cturner'),
(906,257,'','fileId','24'),
(907,257,'en','filename','article.pdf'),
(908,257,'','fileStage','10'),
(909,257,'','submissionFileId','40'),
(910,257,'','submissionId','17'),
(911,257,'','username','dbarnes'),
(912,258,'','fileId','24'),
(913,258,'en','filename','article.pdf'),
(914,258,'','fileStage','10'),
(915,258,'','submissionFileId','40'),
(916,258,'','submissionId','17'),
(917,258,'','username','dbarnes'),
(918,259,'','fileId','24'),
(919,259,'en','filename','article.pdf'),
(920,259,'','fileStage','10'),
(921,259,'','submissionFileId','40'),
(922,259,'','submissionId','17'),
(923,259,'','username','dbarnes'),
(924,272,'','fileId','25'),
(925,272,'en','filename','Self-Organization in Multi-Level Institutions in Networked Environments.pdf'),
(926,272,'','fileStage','2'),
(927,272,'','submissionFileId','41'),
(928,272,'','submissionId','18'),
(929,272,'','username','vwilliamson'),
(930,273,'','fileId','25'),
(931,273,'en','filename','Self-Organization in Multi-Level Institutions in Networked Environments.pdf'),
(932,273,'','fileStage','2'),
(933,273,'','submissionFileId','41'),
(934,273,'','submissionId','18'),
(935,273,'','username','vwilliamson'),
(936,274,'','fileId','25'),
(937,274,'en','filename','Self-Organization in Multi-Level Institutions in Networked Environments.pdf'),
(938,274,'','fileStage','2'),
(939,274,'','submissionFileId','41'),
(940,274,'','submissionId','18'),
(941,274,'','username','vwilliamson'),
(942,276,'','editorName','Daniel Barnes'),
(943,279,'','fileId','26'),
(944,279,'en','filename','Finocchiaro: Arguments About Arguments.pdf'),
(945,279,'','fileStage','2'),
(946,279,'','submissionFileId','42'),
(947,279,'','submissionId','19'),
(948,279,'','username','zwoods'),
(949,280,'','fileId','26'),
(950,280,'en','filename','Finocchiaro: Arguments About Arguments.pdf'),
(951,280,'','fileStage','2'),
(952,280,'','submissionFileId','42'),
(953,280,'','submissionId','19'),
(954,280,'','username','zwoods'),
(955,281,'','fileId','26'),
(956,281,'en','filename','Finocchiaro: Arguments About Arguments.pdf'),
(957,281,'','fileStage','2'),
(958,281,'','submissionFileId','42'),
(959,281,'','submissionId','19'),
(960,281,'','username','zwoods'),
(961,283,'','editorName','Daniel Barnes'),
(962,284,'','fileId','26'),
(963,284,'en','filename','Finocchiaro: Arguments About Arguments.pdf'),
(964,284,'','fileStage','4'),
(965,284,'','sourceSubmissionFileId','42'),
(966,284,'','submissionFileId','43'),
(967,284,'','submissionId','19'),
(968,284,'','username','dbarnes'),
(969,285,'','fileId','26'),
(970,285,'en','filename','Finocchiaro: Arguments About Arguments.pdf'),
(971,285,'','fileStage','4'),
(972,285,'','sourceSubmissionFileId','42'),
(973,285,'','submissionFileId','43'),
(974,285,'','submissionId','19'),
(975,285,'','username','dbarnes'),
(976,286,'','reviewerName','Paul Hudson'),
(977,286,'','round','1'),
(978,286,'','stageId','3'),
(979,286,'','submissionId','19'),
(980,287,'','reviewerName','Aisla McCrae'),
(981,287,'','round','1'),
(982,287,'','stageId','3'),
(983,287,'','submissionId','19'),
(984,288,'','editorName','Daniel Barnes'),
(985,289,'','userFullName','Sarah Vogt'),
(986,289,'en','userGroupName','Copyeditor'),
(987,289,'fr_CA','userGroupName','Réviseur-e'),
(988,289,'','username','svogt');
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='A log of all failed jobs.';
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
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='Records information in the database about files tracked by the system, linking them to the local filesystem.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `files`
--

LOCK TABLES `files` WRITE;
/*!40000 ALTER TABLE `files` DISABLE KEYS */;
INSERT INTO `files` VALUES
(1,'journals/1/articles/1/676e3a128b8e3.pdf','application/pdf'),
(2,'journals/1/articles/1/676e3a137f1e0.odt','application/vnd.oasis.opendocument.text'),
(3,'journals/1/articles/1/676e3a149eab8.ods','application/vnd.oasis.opendocument.spreadsheet'),
(4,'journals/1/articles/1/676e3a15cf9e6.pdf','application/vnd.openxmlformats-officedocument.spreadsheetml.sheet'),
(5,'journals/1/articles/1/676e3a16f05f2.docx','application/vnd.openxmlformats-officedocument.wordprocessingml.document'),
(7,'journals/1/articles/1/676e3ab73ccf4.pdf','application/pdf'),
(8,'journals/1/articles/2/676e3b157a21c.pdf','application/pdf'),
(9,'journals/1/articles/3/676e3b370f6e7.pdf','application/pdf'),
(10,'journals/1/articles/4/676e3b54c10dd.pdf','application/pdf'),
(11,'journals/1/articles/5/676e3b5e71e8f.pdf','application/pdf'),
(12,'journals/1/articles/6/676e3b87c1bba.pdf','application/pdf'),
(13,'journals/1/articles/7/676e3baec70d7.pdf','application/pdf'),
(14,'journals/1/articles/8/676e3bd0a7454.pdf','application/pdf'),
(15,'journals/1/articles/9/676e3bda8c186.pdf','application/pdf'),
(16,'journals/1/articles/10/676e3c05db1ea.pdf','application/pdf'),
(17,'journals/1/articles/11/676e3c2da3639.pdf','application/pdf'),
(18,'journals/1/articles/12/676e3c3775f22.pdf','application/pdf'),
(19,'journals/1/articles/13/676e3c4fd0b5d.pdf','application/pdf'),
(20,'journals/1/articles/14/676e3c918bca0.pdf','application/pdf'),
(21,'journals/1/articles/15/676e3c9ae8d6b.pdf','application/pdf'),
(22,'journals/1/articles/16/676e3cc6a4741.pdf','application/pdf'),
(23,'journals/1/articles/17/676e3cd013289.pdf','application/pdf'),
(24,'journals/1/articles/17/676e3cfb9964c.pdf','application/pdf'),
(25,'journals/1/articles/18/676e3d3a61737.pdf','application/pdf'),
(26,'journals/1/articles/19/676e3d4e7b289.pdf','application/pdf');
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
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='Filter groups are used to organized filters into named sets, which can be retrieved by the application for invocation.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `filter_groups`
--

LOCK TABLES `filter_groups` WRITE;
/*!40000 ALTER TABLE `filter_groups` DISABLE KEYS */;
INSERT INTO `filter_groups` VALUES
(1,'issue=>datacite-xml','plugins.importexport.datacite.displayName','plugins.importexport.datacite.description','class::classes.issue.Issue','xml::schema(http://schema.datacite.org/meta/kernel-4/metadata.xsd)'),
(2,'article=>datacite-xml','plugins.importexport.datacite.displayName','plugins.importexport.datacite.description','class::classes.submission.Submission','xml::schema(http://schema.datacite.org/meta/kernel-4/metadata.xsd)'),
(3,'galley=>datacite-xml','plugins.importexport.datacite.displayName','plugins.importexport.datacite.description','class::lib.pkp.classes.galley.Galley','xml::schema(http://schema.datacite.org/meta/kernel-4/metadata.xsd)'),
(4,'issue=>crossref-xml','plugins.importexport.crossref.displayName','plugins.importexport.crossref.description','class::classes.issue.Issue[]','xml::schema(https://www.crossref.org/schemas/crossref5.3.1.xsd)'),
(5,'article=>crossref-xml','plugins.importexport.crossref.displayName','plugins.importexport.crossref.description','class::classes.submission.Submission[]','xml::schema(https://www.crossref.org/schemas/crossref5.3.1.xsd)'),
(6,'article=>dc11','plugins.metadata.dc11.articleAdapter.displayName','plugins.metadata.dc11.articleAdapter.description','class::classes.submission.Submission','metadata::APP\\plugins\\metadata\\dc11\\schema\\Dc11Schema(ARTICLE)'),
(7,'article=>doaj-xml','plugins.importexport.doaj.displayName','plugins.importexport.doaj.description','class::classes.submission.Submission[]','xml::schema(plugins/importexport/doaj/doajArticles.xsd)'),
(8,'article=>doaj-json','plugins.importexport.doaj.displayName','plugins.importexport.doaj.description','class::classes.submission.Submission','primitive::string'),
(9,'article=>pubmed-xml','plugins.importexport.pubmed.displayName','plugins.importexport.pubmed.description','class::classes.submission.Submission[]','xml::dtd'),
(10,'article=>native-xml','plugins.importexport.native.displayName','plugins.importexport.native.description','class::classes.submission.Submission[]','xml::schema(plugins/importexport/native/native.xsd)'),
(11,'native-xml=>article','plugins.importexport.native.displayName','plugins.importexport.native.description','xml::schema(plugins/importexport/native/native.xsd)','class::classes.submission.Submission[]'),
(12,'issue=>native-xml','plugins.importexport.native.displayName','plugins.importexport.native.description','class::classes.issue.Issue[]','xml::schema(plugins/importexport/native/native.xsd)'),
(13,'native-xml=>issue','plugins.importexport.native.displayName','plugins.importexport.native.description','xml::schema(plugins/importexport/native/native.xsd)','class::classes.issue.Issue[]'),
(14,'issuegalley=>native-xml','plugins.importexport.native.displayName','plugins.importexport.native.description','class::classes.issue.IssueGalley[]','xml::schema(plugins/importexport/native/native.xsd)'),
(15,'native-xml=>issuegalley','plugins.importexport.native.displayName','plugins.importexport.native.description','xml::schema(plugins/importexport/native/native.xsd)','class::classes.issue.IssueGalley[]'),
(16,'author=>native-xml','plugins.importexport.native.displayName','plugins.importexport.native.description','class::classes.author.Author[]','xml::schema(plugins/importexport/native/native.xsd)'),
(17,'native-xml=>author','plugins.importexport.native.displayName','plugins.importexport.native.description','xml::schema(plugins/importexport/native/native.xsd)','class::classes.author.Author[]'),
(18,'SubmissionFile=>native-xml','plugins.importexport.native.displayName','plugins.importexport.native.description','class::lib.pkp.classes.submissionFile.SubmissionFile','xml::schema(plugins/importexport/native/native.xsd)'),
(19,'native-xml=>SubmissionFile','plugins.importexport.native.displayName','plugins.importexport.native.description','xml::schema(plugins/importexport/native/native.xsd)','class::lib.pkp.classes.submissionFile.SubmissionFile[]'),
(20,'article-galley=>native-xml','plugins.importexport.native.displayName','plugins.importexport.native.description','class::lib.pkp.classes.galley.Galley','xml::schema(plugins/importexport/native/native.xsd)'),
(21,'native-xml=>ArticleGalley','plugins.importexport.native.displayName','plugins.importexport.native.description','xml::schema(plugins/importexport/native/native.xsd)','class::lib.pkp.classes.galley.Galley[]'),
(22,'publication=>native-xml','plugins.importexport.native.displayName','plugins.importexport.native.description','class::classes.publication.Publication','xml::schema(plugins/importexport/native/native.xsd)'),
(23,'native-xml=>Publication','plugins.importexport.native.displayName','plugins.importexport.native.description','xml::schema(plugins/importexport/native/native.xsd)','class::classes.publication.Publication[]'),
(24,'user=>user-xml','plugins.importexport.users.displayName','plugins.importexport.users.description','class::lib.pkp.classes.user.User[]','xml::schema(lib/pkp/plugins/importexport/users/pkp-users.xsd)'),
(25,'user-xml=>user','plugins.importexport.users.displayName','plugins.importexport.users.description','xml::schema(lib/pkp/plugins/importexport/users/pkp-users.xsd)','class::classes.users.User[]'),
(26,'usergroup=>user-xml','plugins.importexport.users.displayName','plugins.importexport.users.description','class::lib.pkp.classes.security.UserGroup[]','xml::schema(lib/pkp/plugins/importexport/users/pkp-users.xsd)'),
(27,'user-xml=>usergroup','plugins.importexport.native.displayName','plugins.importexport.native.description','xml::schema(lib/pkp/plugins/importexport/users/pkp-users.xsd)','class::lib.pkp.classes.security.UserGroup[]');
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
  CONSTRAINT `filters_context_id` FOREIGN KEY (`context_id`) REFERENCES `journals` (`journal_id`) ON DELETE CASCADE,
  CONSTRAINT `filters_filter_group_id_foreign` FOREIGN KEY (`filter_group_id`) REFERENCES `filter_groups` (`filter_group_id`) ON DELETE CASCADE,
  CONSTRAINT `filters_parent_filter_id_foreign` FOREIGN KEY (`parent_filter_id`) REFERENCES `filters` (`filter_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='Filters represent a transformation of a supported piece of data from one form to another, such as a PHP object into an XML document.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `filters`
--

LOCK TABLES `filters` WRITE;
/*!40000 ALTER TABLE `filters` DISABLE KEYS */;
INSERT INTO `filters` VALUES
(1,1,NULL,'DataCite XML export','APP\\plugins\\generic\\datacite\\filter\\DataciteXmlFilter',0,NULL,0),
(2,2,NULL,'DataCite XML export','APP\\plugins\\generic\\datacite\\filter\\DataciteXmlFilter',0,NULL,0),
(3,3,NULL,'DataCite XML export','APP\\plugins\\generic\\datacite\\filter\\DataciteXmlFilter',0,NULL,0),
(4,4,NULL,'Crossref XML issue export','APP\\plugins\\generic\\crossref\\filter\\IssueCrossrefXmlFilter',0,NULL,0),
(5,5,NULL,'Crossref XML article export','APP\\plugins\\generic\\crossref\\filter\\ArticleCrossrefXmlFilter',0,NULL,0),
(6,6,NULL,'Extract metadata from a(n) Submission','APP\\plugins\\metadata\\dc11\\filter\\Dc11SchemaArticleAdapter',0,NULL,0),
(7,7,NULL,'DOAJ XML export','APP\\plugins\\importexport\\doaj\\filter\\DOAJXmlFilter',0,NULL,0),
(8,8,NULL,'DOAJ JSON export','APP\\plugins\\importexport\\doaj\\filter\\DOAJJsonFilter',0,NULL,0),
(9,9,NULL,'APP\\plugins\\importexport\\pubmed\\filter\\ArticlePubMedXmlFilter','APP\\plugins\\importexport\\pubmed\\filter\\ArticlePubMedXmlFilter',0,NULL,0),
(10,10,NULL,'Native XML submission export','APP\\plugins\\importexport\\native\\filter\\ArticleNativeXmlFilter',0,NULL,0),
(11,11,NULL,'Native XML submission import','APP\\plugins\\importexport\\native\\filter\\NativeXmlArticleFilter',0,NULL,0),
(12,12,NULL,'Native XML issue export','APP\\plugins\\importexport\\native\\filter\\IssueNativeXmlFilter',0,NULL,0),
(13,13,NULL,'Native XML issue import','APP\\plugins\\importexport\\native\\filter\\NativeXmlIssueFilter',0,NULL,0),
(14,14,NULL,'Native XML issue galley export','APP\\plugins\\importexport\\native\\filter\\IssueGalleyNativeXmlFilter',0,NULL,0),
(15,15,NULL,'Native XML issue galley import','APP\\plugins\\importexport\\native\\filter\\NativeXmlIssueGalleyFilter',0,NULL,0),
(16,16,NULL,'Native XML author export','APP\\plugins\\importexport\\native\\filter\\AuthorNativeXmlFilter',0,NULL,0),
(17,17,NULL,'Native XML author import','APP\\plugins\\importexport\\native\\filter\\NativeXmlAuthorFilter',0,NULL,0),
(18,19,NULL,'Native XML submission file import','APP\\plugins\\importexport\\native\\filter\\NativeXmlArticleFileFilter',0,NULL,0),
(19,18,NULL,'Native XML submission file export','PKP\\plugins\\importexport\\native\\filter\\SubmissionFileNativeXmlFilter',0,NULL,0),
(20,20,NULL,'Native XML representation export','APP\\plugins\\importexport\\native\\filter\\ArticleGalleyNativeXmlFilter',0,NULL,0),
(21,21,NULL,'Native XML representation import','APP\\plugins\\importexport\\native\\filter\\NativeXmlArticleGalleyFilter',0,NULL,0),
(22,22,NULL,'Native XML Publication export','APP\\plugins\\importexport\\native\\filter\\PublicationNativeXmlFilter',0,NULL,0),
(23,23,NULL,'Native XML publication import','APP\\plugins\\importexport\\native\\filter\\NativeXmlPublicationFilter',0,NULL,0),
(24,24,NULL,'User XML user export','PKP\\plugins\\importexport\\users\\filter\\PKPUserUserXmlFilter',0,NULL,0),
(25,25,NULL,'User XML user import','PKP\\plugins\\importexport\\users\\filter\\UserXmlPKPUserFilter',0,NULL,0),
(26,26,NULL,'Native XML user group export','PKP\\plugins\\importexport\\users\\filter\\UserGroupNativeXmlFilter',0,NULL,0),
(27,27,NULL,'Native XML user group import','PKP\\plugins\\importexport\\users\\filter\\NativeXmlUserGroupFilter',0,NULL,0);
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
(1,1,'en','name','Article Text','string'),
(2,1,'fr_CA','name','Texte de l\'article','string'),
(3,2,'en','name','Research Instrument','string'),
(4,2,'fr_CA','name','Instruments de recherche','string'),
(5,3,'en','name','Research Materials','string'),
(6,3,'fr_CA','name','Documents de recherche','string'),
(7,4,'en','name','Research Results','string'),
(8,4,'fr_CA','name','Résultats de recherche','string'),
(9,5,'en','name','Transcripts','string'),
(10,5,'fr_CA','name','Transcriptions','string'),
(11,6,'en','name','Data Analysis','string'),
(12,6,'fr_CA','name','Analyse de données','string'),
(13,7,'en','name','Data Set','string'),
(14,7,'fr_CA','name','Ensemble de données','string'),
(15,8,'en','name','Source Texts','string'),
(16,8,'fr_CA','name','Textes source','string'),
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
  CONSTRAINT `genres_context_id_foreign` FOREIGN KEY (`context_id`) REFERENCES `journals` (`journal_id`) ON DELETE CASCADE
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
  CONSTRAINT `highlights_context_id_foreign` FOREIGN KEY (`context_id`) REFERENCES `journals` (`journal_id`) ON DELETE CASCADE
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='A list of institutional subscriptions, linking a subscription with an institution.';
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
  CONSTRAINT `invitations_context_id` FOREIGN KEY (`context_id`) REFERENCES `journals` (`journal_id`) ON DELETE CASCADE,
  CONSTRAINT `invitations_inviter_id_foreign` FOREIGN KEY (`inviter_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE,
  CONSTRAINT `invitations_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='Invitations are sent to request a person (by email) to allow them to accept or reject an operation or position, such as a board membership or a submission peer review.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `invitations`
--

LOCK TABLES `invitations` WRITE;
/*!40000 ALTER TABLE `invitations` DISABLE KEYS */;
INSERT INTO `invitations` VALUES
(2,'$2y$10$jFEz6.SwoBD4FjHp8OQuMu0asJE1uGWLLluaMn35V4FzqSMpXYSBK','userRoleAssignment',NULL,1,'2024-12-30 05:16:20','{\"userOrcid\":null,\"givenName\":{\"en\":\"Ramiro\",\"fr_CA\":\"Ramiro\"},\"familyName\":{\"en\":\"Vaca\",\"fr_CA\":\"Vaca\"},\"affiliation\":{\"en\":\"Universidad Nacional Aut\\u00f3noma de M\\u00e9xico\",\"fr_CA\":\"Mexico\"},\"userCountry\":\"MX\",\"username\":\"rvaca\",\"password\":\"$2y$10$2Y4.QpQnN3LNP86ONN2Rg.IH0PU4qG0OgFr.npsD\\/zuAG5..znjJ.\",\"emailSubject\":null,\"emailBody\":null,\"userGroupsToAdd\":[{\"userGroupId\":2,\"dateStart\":\"2024-12-27\",\"dateEnd\":null,\"masthead\":true}],\"passwordHashed\":true,\"sendEmailAddress\":\"rvaca@mailinator.com\"}','ACCEPTED','rvaca@mailinator.com',1,'2024-12-27 05:16:19','2024-12-27 05:16:29'),
(4,'$2y$10$otPPMvvR8sEVrzKOzB1gZ.gKxmZ6XXVQG7hyCRT8sD5mV9G2I6hou','userRoleAssignment',NULL,1,'2024-12-30 05:16:40','{\"userOrcid\":null,\"givenName\":{\"en\":\"Daniel\",\"fr_CA\":\"Daniel\"},\"familyName\":{\"en\":\"Barnes\",\"fr_CA\":\"Barnes\"},\"affiliation\":{\"en\":\"University of Melbourne\",\"fr_CA\":\"Australia\"},\"userCountry\":\"AU\",\"username\":\"dbarnes\",\"password\":\"$2y$10$FI.73VMB2lX8NwfD.PeVNe0vc2uhG769JK7slDiMHJD3qePIB4GZO\",\"emailSubject\":null,\"emailBody\":null,\"userGroupsToAdd\":[{\"userGroupId\":3,\"dateStart\":\"2024-12-27\",\"dateEnd\":null,\"masthead\":true}],\"passwordHashed\":true,\"sendEmailAddress\":\"dbarnes@mailinator.com\"}','ACCEPTED','dbarnes@mailinator.com',1,'2024-12-27 05:16:40','2024-12-27 05:16:49'),
(6,'$2y$10$on.IGzHcQCL/Cs9iNvMM2eKaXPFt6/WVFvhAshL5UdmA.rl06JAC.','userRoleAssignment',NULL,1,'2024-12-30 05:17:00','{\"userOrcid\":null,\"givenName\":{\"en\":\"David\",\"fr_CA\":\"David\"},\"familyName\":{\"en\":\"Buskins\",\"fr_CA\":\"Buskins\"},\"affiliation\":{\"en\":\"University of Chicago\",\"fr_CA\":\"United States\"},\"userCountry\":\"US\",\"username\":\"dbuskins\",\"password\":\"$2y$10$dsgAAltouwzcYTj5ft4aZO3zBE1wlOemUkXK0gMp81\\/Z.vdoGNfx2\",\"emailSubject\":null,\"emailBody\":null,\"userGroupsToAdd\":[{\"userGroupId\":5,\"dateStart\":\"2024-12-27\",\"dateEnd\":null,\"masthead\":true}],\"passwordHashed\":true,\"sendEmailAddress\":\"dbuskins@mailinator.com\"}','ACCEPTED','dbuskins@mailinator.com',1,'2024-12-27 05:17:00','2024-12-27 05:17:10'),
(8,'$2y$10$.GgYtsipg8F03JVuZcuAO.zYQf2ruzwkYoBPc4ZTYr/qrJfIyY6si','userRoleAssignment',NULL,1,'2024-12-30 05:17:22','{\"userOrcid\":null,\"givenName\":{\"en\":\"Stephanie\",\"fr_CA\":\"Stephanie\"},\"familyName\":{\"en\":\"Berardo\",\"fr_CA\":\"Berardo\"},\"affiliation\":{\"en\":\"University of Toronto\",\"fr_CA\":\"Canada\"},\"userCountry\":\"CA\",\"username\":\"sberardo\",\"password\":\"$2y$10$BjNNJ2mq9QlveJ4sVF1\\/.OoqJIn5tXwG3WOmGOwOEvzpiW22EGBCS\",\"emailSubject\":null,\"emailBody\":null,\"userGroupsToAdd\":[{\"userGroupId\":5,\"dateStart\":\"2024-12-27\",\"dateEnd\":null,\"masthead\":true}],\"passwordHashed\":true,\"sendEmailAddress\":\"sberardo@mailinator.com\"}','ACCEPTED','sberardo@mailinator.com',1,'2024-12-27 05:17:22','2024-12-27 05:17:33'),
(10,'$2y$10$h/GZQ7WQStoH1FVnelbLv.3Uwoq9Io1LUewWHRni3bhMLbfXVjVk.','userRoleAssignment',NULL,1,'2024-12-30 05:17:45','{\"userOrcid\":null,\"givenName\":{\"en\":\"Minoti\",\"fr_CA\":\"Minoti\"},\"familyName\":{\"en\":\"Inoue\",\"fr_CA\":\"Inoue\"},\"affiliation\":{\"en\":\"Kyoto University\",\"fr_CA\":\"Japan\"},\"userCountry\":\"JP\",\"username\":\"minoue\",\"password\":\"$2y$10$XuqXf42DfMMAmTSof5QaHuYfIXd163d36LQaRkqj.T\\/VFSp3CikzG\",\"emailSubject\":null,\"emailBody\":null,\"userGroupsToAdd\":[{\"userGroupId\":5,\"dateStart\":\"2024-12-27\",\"dateEnd\":null,\"masthead\":true}],\"passwordHashed\":true,\"sendEmailAddress\":\"minoue@mailinator.com\"}','ACCEPTED','minoue@mailinator.com',1,'2024-12-27 05:17:45','2024-12-27 05:17:57'),
(12,'$2y$10$eI30agXCMbZWec6CZLqmReAWQSwOAqfO/uYPJ5ltkdpKyJEuDFQxS','userRoleAssignment',NULL,1,'2024-12-30 05:18:10','{\"userOrcid\":null,\"givenName\":{\"en\":\"Julie\",\"fr_CA\":\"Julie\"},\"familyName\":{\"en\":\"Janssen\",\"fr_CA\":\"Janssen\"},\"affiliation\":{\"en\":\"Utrecht University\",\"fr_CA\":\"Netherlands\"},\"userCountry\":\"NL\",\"username\":\"jjanssen\",\"password\":\"$2y$10$\\/cNVXL3zbpkf6N8SNgwf9uBIqTgf.6fJJ4PMrHXKsttj2Pd06ddNe\",\"emailSubject\":null,\"emailBody\":null,\"userGroupsToAdd\":[{\"userGroupId\":16,\"dateStart\":\"2024-12-27\",\"dateEnd\":null,\"masthead\":true}],\"passwordHashed\":true,\"sendEmailAddress\":\"jjanssen@mailinator.com\"}','ACCEPTED','jjanssen@mailinator.com',1,'2024-12-27 05:18:09','2024-12-27 05:18:21'),
(14,'$2y$10$b6k5EjSiOrcpw6hNkCgD0ev0tJPYK6fOdmcQ5xUuokpT9Ir8S/3X2','userRoleAssignment',NULL,1,'2024-12-30 05:18:35','{\"userOrcid\":null,\"givenName\":{\"en\":\"Paul\",\"fr_CA\":\"Paul\"},\"familyName\":{\"en\":\"Hudson\",\"fr_CA\":\"Hudson\"},\"affiliation\":{\"en\":\"McGill University\",\"fr_CA\":\"Canada\"},\"userCountry\":\"CA\",\"username\":\"phudson\",\"password\":\"$2y$10$gV2wpPedY5OmXl7rPyK3eeoYeFOvGjoJRFtamfWcRikK4Ldjzzv3G\",\"emailSubject\":null,\"emailBody\":null,\"userGroupsToAdd\":[{\"userGroupId\":16,\"dateStart\":\"2024-12-27\",\"dateEnd\":null,\"masthead\":true}],\"passwordHashed\":true,\"sendEmailAddress\":\"phudson@mailinator.com\"}','ACCEPTED','phudson@mailinator.com',1,'2024-12-27 05:18:35','2024-12-27 05:18:48'),
(16,'$2y$10$F2e9nV24UCNqbHWzvlEXJ.lYXeb2DB.eFZqAfP/OPh/y8BXaXtHPa','userRoleAssignment',NULL,1,'2024-12-30 05:19:03','{\"userOrcid\":null,\"givenName\":{\"en\":\"Aisla\",\"fr_CA\":\"Aisla\"},\"familyName\":{\"en\":\"McCrae\",\"fr_CA\":\"McCrae\"},\"affiliation\":{\"en\":\"University of Manitoba\",\"fr_CA\":\"Canada\"},\"userCountry\":\"CA\",\"username\":\"amccrae\",\"password\":\"$2y$10$M.PhkXvPsULYNRUFDOn8lOAFhGEyDP6S0CAM2uAQN3nScBlnrWfVi\",\"emailSubject\":null,\"emailBody\":null,\"userGroupsToAdd\":[{\"userGroupId\":16,\"dateStart\":\"2024-12-27\",\"dateEnd\":null,\"masthead\":true}],\"passwordHashed\":true,\"sendEmailAddress\":\"amccrae@mailinator.com\"}','ACCEPTED','amccrae@mailinator.com',1,'2024-12-27 05:19:02','2024-12-27 05:19:17'),
(18,'$2y$10$zU2Z9D8u60ffy8BBddEgHO2Kk7oydLqNDYETJ0FgTCVsm0z/ez0M.','userRoleAssignment',NULL,1,'2024-12-30 05:19:32','{\"userOrcid\":null,\"givenName\":{\"en\":\"Adela\",\"fr_CA\":\"Adela\"},\"familyName\":{\"en\":\"Gallego\",\"fr_CA\":\"Gallego\"},\"affiliation\":{\"en\":\"State University of New York\",\"fr_CA\":\"United States\"},\"userCountry\":\"US\",\"username\":\"agallego\",\"password\":\"$2y$10$Cus0T5P.UnFkcbqGa3VAUunr0mauXzMW2V5e7ja7OC.QdY99Ni.xu\",\"emailSubject\":null,\"emailBody\":null,\"userGroupsToAdd\":[{\"userGroupId\":16,\"dateStart\":\"2024-12-27\",\"dateEnd\":null,\"masthead\":true}],\"passwordHashed\":true,\"sendEmailAddress\":\"agallego@mailinator.com\"}','ACCEPTED','agallego@mailinator.com',1,'2024-12-27 05:19:31','2024-12-27 05:19:46'),
(20,'$2y$10$iWAEQTFgZ0jabGaElM6j6.bRHt3qn.eAwaSweWdwD0McCBeWACNYu','userRoleAssignment',NULL,1,'2024-12-30 05:20:03','{\"userOrcid\":null,\"givenName\":{\"en\":\"Maria\",\"fr_CA\":\"Maria\"},\"familyName\":{\"en\":\"Fritz\",\"fr_CA\":\"Fritz\"},\"affiliation\":{\"en\":\"Ghent University\",\"fr_CA\":\"Belgium\"},\"userCountry\":\"BE\",\"username\":\"mfritz\",\"password\":\"$2y$10$EdftwhUqzx\\/cAi.HE8eV4umHgv6QotmRTngmtFOww3A7EooiQRXoq\",\"emailSubject\":null,\"emailBody\":null,\"userGroupsToAdd\":[{\"userGroupId\":7,\"dateStart\":\"2024-12-27\",\"dateEnd\":null,\"masthead\":true}],\"passwordHashed\":true,\"sendEmailAddress\":\"mfritz@mailinator.com\"}','ACCEPTED','mfritz@mailinator.com',1,'2024-12-27 05:20:02','2024-12-27 05:20:18'),
(22,'$2y$10$TTc9ekGRh90CkUhWYojC2.SgSW1aCCNGamndkUWT3udqTArmuciKi','userRoleAssignment',NULL,1,'2024-12-30 05:20:35','{\"userOrcid\":null,\"givenName\":{\"en\":\"Sarah\",\"fr_CA\":\"Sarah\"},\"familyName\":{\"en\":\"Vogt\",\"fr_CA\":\"Vogt\"},\"affiliation\":{\"en\":\"Universidad de Chile\",\"fr_CA\":\"Chile\"},\"userCountry\":\"CL\",\"username\":\"svogt\",\"password\":\"$2y$10$VhtahI\\/lLdmkuc5iF5YB\\/OCjXDfv\\/wq7mDayI220lZv56bqP9vV9G\",\"emailSubject\":null,\"emailBody\":null,\"userGroupsToAdd\":[{\"userGroupId\":7,\"dateStart\":\"2024-12-27\",\"dateEnd\":null,\"masthead\":true}],\"passwordHashed\":true,\"sendEmailAddress\":\"svogt@mailinator.com\"}','ACCEPTED','svogt@mailinator.com',1,'2024-12-27 05:20:34','2024-12-27 05:20:52'),
(24,'$2y$10$DwgrxSSaBV8D5ZG4j4CG0emifnaG6OV74CUu1udiT5JKFKiJu7xtm','userRoleAssignment',NULL,1,'2024-12-30 05:21:10','{\"userOrcid\":null,\"givenName\":{\"en\":\"Graham\",\"fr_CA\":\"Graham\"},\"familyName\":{\"en\":\"Cox\",\"fr_CA\":\"Cox\"},\"affiliation\":{\"en\":\"Duke University\",\"fr_CA\":\"United States\"},\"userCountry\":\"US\",\"username\":\"gcox\",\"password\":\"$2y$10$5e28vXkEircPNUx5VmQFyetfWnBXFZxL\\/xc1kfVLKnUr83XVnQ6gS\",\"emailSubject\":null,\"emailBody\":null,\"userGroupsToAdd\":[{\"userGroupId\":11,\"dateStart\":\"2024-12-27\",\"dateEnd\":null,\"masthead\":true}],\"passwordHashed\":true,\"sendEmailAddress\":\"gcox@mailinator.com\"}','ACCEPTED','gcox@mailinator.com',1,'2024-12-27 05:21:09','2024-12-27 05:21:28'),
(26,'$2y$10$3dd2R5oSmCKJnSXwfI2t9ubZcbAysJL9Yzn4nxRrAndrHe.6NNbUa','userRoleAssignment',NULL,1,'2024-12-30 05:21:47','{\"userOrcid\":null,\"givenName\":{\"en\":\"Stephen\",\"fr_CA\":\"Stephen\"},\"familyName\":{\"en\":\"Hellier\",\"fr_CA\":\"Hellier\"},\"affiliation\":{\"en\":\"University of Cape Town\",\"fr_CA\":\"South Africa\"},\"userCountry\":\"ZA\",\"username\":\"shellier\",\"password\":\"$2y$10$vrkh8H3lZv3SScxM2.N38edotjk92LRHaXkl8cdVdbc8w52c8KAQy\",\"emailSubject\":null,\"emailBody\":null,\"userGroupsToAdd\":[{\"userGroupId\":11,\"dateStart\":\"2024-12-27\",\"dateEnd\":null,\"masthead\":true}],\"passwordHashed\":true,\"sendEmailAddress\":\"shellier@mailinator.com\"}','ACCEPTED','shellier@mailinator.com',1,'2024-12-27 05:21:46','2024-12-27 05:22:06'),
(28,'$2y$10$XZ/XdY09hJj4IxBCudryjeqCovjaa1SaUUhTsdnqnMKxKyIIaU6wi','userRoleAssignment',NULL,1,'2024-12-30 05:22:26','{\"userOrcid\":null,\"givenName\":{\"en\":\"Catherine\",\"fr_CA\":\"Catherine\"},\"familyName\":{\"en\":\"Turner\",\"fr_CA\":\"Turner\"},\"affiliation\":{\"en\":\"Imperial College London\",\"fr_CA\":\"United Kingdom\"},\"userCountry\":\"GB\",\"username\":\"cturner\",\"password\":\"$2y$10$oWHJmZfY60.122Qikw61Ceck7ZNYxf99GKTnCJD5ECGNr6jq.0HeO\",\"emailSubject\":null,\"emailBody\":null,\"userGroupsToAdd\":[{\"userGroupId\":13,\"dateStart\":\"2024-12-27\",\"dateEnd\":null,\"masthead\":true}],\"passwordHashed\":true,\"sendEmailAddress\":\"cturner@mailinator.com\"}','ACCEPTED','cturner@mailinator.com',1,'2024-12-27 05:22:25','2024-12-27 05:22:46'),
(30,'$2y$10$KKtysUCL20UZ87Iz73bAnO6PGfsnHOy3064G8FnS3WSty3yqeEeUC','userRoleAssignment',NULL,1,'2024-12-30 05:23:08','{\"userOrcid\":null,\"givenName\":{\"en\":\"Sabine\",\"fr_CA\":\"Sabine\"},\"familyName\":{\"en\":\"Kumar\",\"fr_CA\":\"Kumar\"},\"affiliation\":{\"en\":\"National University of Singapore\",\"fr_CA\":\"Singapore\"},\"userCountry\":\"SG\",\"username\":\"skumar\",\"password\":\"$2y$10$W3Qd2o82ObcOvagfu2ylpeaqUEYZHS7GEH0CzwzJkNmyw2ZYD.PK6\",\"emailSubject\":null,\"emailBody\":null,\"userGroupsToAdd\":[{\"userGroupId\":13,\"dateStart\":\"2024-12-27\",\"dateEnd\":null,\"masthead\":true}],\"passwordHashed\":true,\"sendEmailAddress\":\"skumar@mailinator.com\"}','ACCEPTED','skumar@mailinator.com',1,'2024-12-27 05:23:07','2024-12-27 05:23:30');
/*!40000 ALTER TABLE `invitations` ENABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='Relationships between issues and issue files, such as cover images.';
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
  `issue_galley_setting_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `galley_id` bigint(20) NOT NULL,
  `locale` varchar(28) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` mediumtext DEFAULT NULL,
  `setting_type` varchar(6) NOT NULL COMMENT '(bool|int|float|string|object)',
  PRIMARY KEY (`issue_galley_setting_id`),
  UNIQUE KEY `issue_galley_settings_unique` (`galley_id`,`locale`,`setting_name`),
  KEY `issue_galley_settings_galley_id` (`galley_id`),
  CONSTRAINT `issue_galleys_settings_galley_id` FOREIGN KEY (`galley_id`) REFERENCES `issue_galleys` (`galley_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='More data about issue galleys, including localized content such as labels.';
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
  `locale` varchar(28) DEFAULT NULL,
  `issue_id` bigint(20) NOT NULL,
  `file_id` bigint(20) NOT NULL,
  `label` varchar(255) DEFAULT NULL,
  `seq` double NOT NULL DEFAULT 0,
  `url_path` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`galley_id`),
  KEY `issue_galleys_issue_id` (`issue_id`),
  KEY `issue_galleys_file_id` (`file_id`),
  KEY `issue_galleys_url_path` (`url_path`),
  CONSTRAINT `issue_galleys_file_id` FOREIGN KEY (`file_id`) REFERENCES `issue_files` (`file_id`) ON DELETE CASCADE,
  CONSTRAINT `issue_galleys_issue_id` FOREIGN KEY (`issue_id`) REFERENCES `issues` (`issue_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='Issue galleys are representations of the entire issue in a single file, such as a complete issue PDF.';
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
  `issue_setting_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `issue_id` bigint(20) NOT NULL,
  `locale` varchar(28) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` mediumtext DEFAULT NULL,
  PRIMARY KEY (`issue_setting_id`),
  UNIQUE KEY `issue_settings_unique` (`issue_id`,`locale`,`setting_name`),
  KEY `issue_settings_issue_id` (`issue_id`),
  KEY `issue_settings_name_value` (`setting_name`(50),`setting_value`(150)),
  CONSTRAINT `issue_settings_issue_id` FOREIGN KEY (`issue_id`) REFERENCES `issues` (`issue_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='More data about issues, including localized properties such as issue titles.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `issue_settings`
--

LOCK TABLES `issue_settings` WRITE;
/*!40000 ALTER TABLE `issue_settings` DISABLE KEYS */;
INSERT INTO `issue_settings` VALUES
(1,1,'en','description',''),
(2,1,'fr_CA','description',''),
(3,1,'en','title',''),
(4,1,'fr_CA','title',''),
(5,2,'en','description',''),
(6,2,'fr_CA','description',''),
(7,2,'en','title',''),
(8,2,'fr_CA','title','');
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
  `published` smallint(6) NOT NULL DEFAULT 0,
  `date_published` datetime DEFAULT NULL,
  `date_notified` datetime DEFAULT NULL,
  `last_modified` datetime DEFAULT NULL,
  `access_status` smallint(6) NOT NULL DEFAULT 1,
  `open_access_date` datetime DEFAULT NULL,
  `show_volume` smallint(6) NOT NULL DEFAULT 0,
  `show_number` smallint(6) NOT NULL DEFAULT 0,
  `show_year` smallint(6) NOT NULL DEFAULT 0,
  `show_title` smallint(6) NOT NULL DEFAULT 0,
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='A list of all journal issues, with identifying information like year, number, volume, etc.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `issues`
--

LOCK TABLES `issues` WRITE;
/*!40000 ALTER TABLE `issues` DISABLE KEYS */;
INSERT INTO `issues` VALUES
(1,1,1,'2',2014,1,'2024-12-27 05:24:02',NULL,'2024-12-27 05:37:53',1,NULL,1,1,1,0,NULL,NULL,NULL,NULL),
(2,1,2,'1',2015,0,NULL,NULL,'2024-12-27 05:37:50',1,NULL,1,1,1,0,NULL,NULL,NULL,NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='All pending or in-progress jobs.';
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
  `journal_setting_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `journal_id` bigint(20) NOT NULL,
  `locale` varchar(28) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` mediumtext DEFAULT NULL,
  PRIMARY KEY (`journal_setting_id`),
  UNIQUE KEY `journal_settings_unique` (`journal_id`,`locale`,`setting_name`),
  KEY `journal_settings_journal_id` (`journal_id`),
  CONSTRAINT `journal_settings_journal_id` FOREIGN KEY (`journal_id`) REFERENCES `journals` (`journal_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=93 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='More data about journals, including localized properties like policies.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `journal_settings`
--

LOCK TABLES `journal_settings` WRITE;
/*!40000 ALTER TABLE `journal_settings` DISABLE KEYS */;
INSERT INTO `journal_settings` VALUES
(1,1,'en','acronym','JPKJPK'),
(3,1,'en','authorGuidelines','<p>Authors are invited to make a submission to this journal. All submissions will be assessed by an editor to determine whether they meet the aims and scope of this journal. Those considered to be a good fit will be sent for peer review before determining whether they will be accepted or rejected.</p><p>Before making a submission, authors are responsible for obtaining permission to publish any material included with the submission, such as photos, documents and datasets. All authors identified on the submission must consent to be identified as an author. Where appropriate, research should be approved by an appropriate ethics committee in accordance with the legal requirements of the study\'s country.</p><p>An editor may desk reject a submission if it does not meet minimum standards of quality. Before submitting, please ensure that the study design and research argument are structured and articulated properly. The title should be concise and the abstract should be able to stand on its own. This will increase the likelihood of reviewers agreeing to review the paper. When you\'re satisfied that your submission meets this standard, please follow the checklist below to prepare your submission.</p>'),
(4,1,'fr_CA','authorGuidelines','<p>Les auteur.e.s sont invité.e.s à soumettre un article à cette revue. Toutes les soumissions seront évaluées par un.e rédacteur.trice afin de déterminer si elles correspondent aux objectifs et au champ d\'application de cette revue. Ceux considérés comme étant appropriés seront envoyés à des pairs pour examen avant de décider s\'ils seront acceptés ou rejetés.</p><p>Avant de soumettre leur article, les auteur.e.s sont responsables d\'obtenir l\'autorisation de publier tout matériel inclus dans la soumission, tels que des photos, des documents et des ensembles de données. Tous les auteur.e.s identifié.e.s dans la soumission doivent consentir à être identifié.e.s comme auteur.e.s. Lorsque cela est approprié, la recherche doit être approuvée par un comité d\'éthique approprié conformément aux exigences légales du pays de l\'étude.</p><p>Un.e rédacteur.trice peut rejeter une soumission sans examen approfondi s\'il ne répond pas aux normes minimales de qualité. Avant de soumettre votre article, veuillez vous assurer que la conception de l\'étude et l\'argument de recherche sont structurés et articulés correctement. Le titre doit être concis et le résumé doit pouvoir être compris indépendamment du reste du texte. Cela augmentera la probabilité que les évaluateur.trice.s acceptent d\'examiner l\'article. Lorsque vous êtes confiant.e que votre article répond à ces exigences, vous pouvez suivre la liste de contrôle ci-dessous pour préparer votre soumission.</p>'),
(5,1,'en','authorInformation','Interested in submitting to this journal? We recommend that you review the <a href=\"http://localhost/index.php/publicknowledge/about\">About the Journal</a> page for the journal\'s section policies, as well as the <a href=\"http://localhost/index.php/publicknowledge/about/submissions#authorGuidelines\">Author Guidelines</a>. Authors need to <a href=\"http://localhost/index.php/publicknowledge/user/register\">register</a> with the journal prior to submitting or, if already registered, can simply <a href=\"http://localhost/index.php/index/login\">log in</a> and begin the five-step process.'),
(6,1,'fr_CA','authorInformation','Intéressé-e à soumettre à cette revue ? Nous vous recommandons de consulter les politiques de rubrique de la revue à la page <a href=\"http://localhost/index.php/publicknowledge/about\">À propos de la revue</a> ainsi que les <a href=\"http://localhost/index.php/publicknowledge/about/submissions#authorGuidelines\">Directives aux auteurs</a>. Les auteurs-es doivent <a href=\"http://localhost/index.php/publicknowledge/user/register\">s\'inscrire</a> auprès de la revue avant de présenter une soumission, ou s\'ils et elles sont déjà inscrits-es, simplement <a href=\"http://localhost/index.php/publicknowledge/login\">ouvrir une session</a> et accéder au tableau de bord pour commencer les 5 étapes du processus.'),
(7,1,'en','beginSubmissionHelp','<p>Thank you for submitting to the Journal of Public Knowledge. You will be asked to upload files, identify co-authors, and provide information such as the title and abstract.<p><p>Please read our <a href=\"http://localhost/index.php/publicknowledge/about/submissions\" target=\"_blank\">Submission Guidelines</a> if you have not done so already. When filling out the forms, provide as many details as possible in order to help our editors evaluate your work.</p><p>Once you begin, you can save your submission and come back to it later. You will be able to review and correct any information before you submit.</p>'),
(8,1,'fr_CA','beginSubmissionHelp','<p>Merci de votre soumission à la revue Journal of Public Knowledge. Il vous sera demandé de téléverser des fichiers, identifier des co-auteur.trice.s et fournir des informations comme le titre et le résumé.<p><p>Si vous ne l\'avez pas encore fait, merci de consulter nos <a href=\"http://localhost/index.php/publicknowledge/about/submissions\" target=\"_blank\">Recommandations pour la soumission</a>. Lorsque vous remplissez les formulaires, merci de fournir autant de détails que possible pour aider nos éditeur.trice.s à évaluer votre travail. </p><p>Une fois que vous avez commencé, vous pouvez enregistrer votre soumission et y revenir plus tard. Vous pourrez alors réviser et modifier toutes les informations voulues avant de soumettre le tout.</p>'),
(9,1,'','contactEmail','rvaca@mailinator.com'),
(10,1,'','contactName','Ramiro Vaca'),
(11,1,'en','contributorsHelp','<p>Add details for all of the contributors to this submission. Contributors added here will be sent an email confirmation of the submission, as well as a copy of all editorial decisions recorded against this submission.</p><p>If a contributor can not be contacted by email, because they must remain anonymous or do not have an email account, please do not enter a fake email address. You can add information about this contributor in a message to the editor at a later step in the submission process.</p>'),
(12,1,'fr_CA','contributorsHelp','<p>Ajouter des informations relatives à tous les contributeurs.trices à cette soumission. Les contributeurs.trices ajouté.e.s ici se verront envoyer un courriel de confirmation de la soumission ainsi qu\'une copie de toutes les décisions éditoriales enregistrées pour cette soumission.</p><p>Si un.e contributeur.trice ne peut être contacté.e par courriel parce qu\'il ou elle doit demeurer anonyme ou n\'a pas de compte de messagerie, veuillez ne pas entrer de courriel fictif. Vous pouvez ajouter des informations sur ce ou cette contributeur.trice à une étape ultérieure du processus de soumission.</p>'),
(13,1,'','country','IS'),
(14,1,'','defaultReviewMode','2'),
(15,1,'en','description','<p>The Journal of Public Knowledge is a peer-reviewed quarterly publication on the subject of public access to science.</p>'),
(16,1,'fr_CA','description','<p>Le Journal de Public Knowledge est une publication trimestrielle évaluée par les pairs sur le thème de l\'accès du public à la science.</p>'),
(17,1,'en','detailsHelp','<p>Please provide the following details to help us manage your submission in our system.</p>'),
(18,1,'fr_CA','detailsHelp','<p>Veuillez fournir les informations suivantes afin de nous aider à gérer votre soumission dans notre système.</p>'),
(19,1,'','copySubmissionAckPrimaryContact','0'),
(20,1,'','copySubmissionAckAddress',''),
(21,1,'','emailSignature','<br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Journal of Public Knowledge</a>.</p>'),
(22,1,'','enableDois','1'),
(23,1,'','doiSuffixType','default'),
(24,1,'','registrationAgency',''),
(25,1,'','disableSubmissions','0'),
(26,1,'','editorialStatsEmail','1'),
(27,1,'en','forTheEditorsHelp','<p>Please provide the following details in order to help our editorial team manage your submission.</p><p>When entering metadata, provide entries that you think would be most helpful to the person managing your submission. This information can be changed before publication.</p>'),
(28,1,'fr_CA','forTheEditorsHelp','<p>S\'il vous plaît, fournissez les détails suivants afin d\'aider l\'équipe éditoriale à gérer votre soumission.</p><p>Dans vos métadonnées, assurez vous de fournir des informations que vous pensez pouvoir être utile à la personne qui gérera votre soumission. Cette information peut être changée avant publication.</p>'),
(29,1,'','itemsPerPage','25'),
(30,1,'','keywords','request'),
(31,1,'en','librarianInformation','We encourage research librarians to list this journal among their library\'s electronic journal holdings. As well, it may be worth noting that this journal\'s open source publishing system is suitable for libraries to host for their faculty members to use with journals they are involved in editing (see <a href=\"https://pkp.sfu.ca/ojs\">Open Journal Systems</a>).'),
(32,1,'fr_CA','librarianInformation','Nous incitons les bibliothécaires à lister cette revue dans leur fonds de revues numériques. Aussi, il peut être pertinent de mentionner que ce système de publication en libre accès est conçu pour être hébergé par les bibliothèques de recherche pour que les membres de leurs facultés l\'utilisent avec les revues dans lesquelles elles ou ils sont impliqués (voir <a href=\"https://pkp.sfu.ca/ojs\">Open Journal Systems</a>).'),
(33,1,'en','name','Journal of Public Knowledge'),
(34,1,'fr_CA','name','Journal de la connaissance du public'),
(35,1,'','notifyAllAuthors','1'),
(36,1,'','numPageLinks','10'),
(37,1,'','numWeeksPerResponse','4'),
(38,1,'','numWeeksPerReview','4'),
(39,1,'','numReviewersPerSubmission','0'),
(40,1,'en','openAccessPolicy','This journal provides immediate open access to its content on the principle that making research freely available to the public supports a greater global exchange of knowledge.'),
(41,1,'fr_CA','openAccessPolicy','Cette revue fournit le libre accès immédiat à son contenu se basant sur le principe que rendre la recherche disponible au public gratuitement facilite un plus grand échange du savoir, à l\'échelle de la planète.'),
(42,1,'','orcidCity',''),
(43,1,'','orcidClientId',''),
(44,1,'','orcidClientSecret',''),
(45,1,'','orcidEnabled','0'),
(46,1,'','orcidLogLevel','ERROR'),
(47,1,'','orcidSendMailToAuthorsOnPublication','0'),
(48,1,'en','privacyStatement','<p>The names and email addresses entered in this journal site will be used exclusively for the stated purposes of this journal and will not be made available for any other purpose or to any other party.</p>'),
(49,1,'fr_CA','privacyStatement','<p>Les noms et courriels saisis dans le site de cette revue seront utilisés exclusivement aux fins indiquées par cette revue et ne serviront à aucune autre fin, ni à toute autre partie.</p>'),
(50,1,'en','readerInformation','We encourage readers to sign up for the publishing notification service for this journal. Use the <a href=\"http://localhost/index.php/publicknowledge/user/register\">Register</a> link at the top of the home page for the journal. This registration will result in the reader receiving the Table of Contents by email for each new issue of the journal. This list also allows the journal to claim a certain level of support or readership. See the journal\'s <a href=\"http://localhost/index.php/publicknowledge/about/submissions#privacyStatement\">Privacy Statement</a>, which assures readers that their name and email address will not be used for other purposes.'),
(51,1,'fr_CA','readerInformation','Nous invitons les lecteurs-trices à s\'inscrire pour recevoir les avis de publication de cette revue. Utiliser le lien <a href=\"http://localhost/index.php/publicknowledge/user/register\">S\'inscrire</a> en haut de la page d\'accueil de la revue. Cette inscription permettra au,à la lecteur-trice de recevoir par courriel le sommaire de chaque nouveau numéro de la revue. Cette liste permet aussi à la revue de revendiquer un certain niveau de soutien ou de lectorat. Voir la <a href=\"http://localhost/index.php/publicknowledge/about/submissions#privacyStatement\">Déclaration de confidentialité</a> de la revue qui certifie aux lecteurs-trices que leur nom et leur courriel ne seront pas utilisés à d\'autres fins.'),
(52,1,'en','reviewHelp','<p>Review the information you have entered before you complete your submission. You can change any of the details displayed here by clicking the edit button at the top of each section.</p><p>Once you complete your submission, a member of our editorial team will be assigned to review it. Please ensure the details you have entered here are as accurate as possible.</p>'),
(53,1,'fr_CA','reviewHelp','<p>Révisez l\'information que vous avez fourni avant de finaliser votre soumission. Vous pouvez modifier chaque détails affichés en cliquant sur le bouton d\'édition en haut de chaque section.</p><p>Une fois votre soumission transmise, un membre de l\'équipe éditoriale lui sera assigné afin de l\'évaluer. S\'il vous plaît, assurez vous que les détails fournis sont le plus exactes possibles.</p>'),
(54,1,'','submissionAcknowledgement','allAuthors'),
(55,1,'en','submissionChecklist','<p>All submissions must meet the following requirements.</p><ul><li>This submission meets the requirements outlined in the <a href=\"http://localhost/index.php/publicknowledge/about/submissions\">Author Guidelines</a>.</li><li>This submission has not been previously published, nor is it before another journal for consideration.</li><li>All references have been checked for accuracy and completeness.</li><li>All tables and figures have been numbered and labeled.</li><li>Permission has been obtained to publish all photos, datasets and other material provided with this submission.</li></ul>'),
(56,1,'fr_CA','submissionChecklist','<p>Toutes les soumissions doivent répondre aux exigences suivantes : </p><ul><li>Cette soumission répond aux exigences définies dans les <a href=\"http://localhost/index.php/publicknowledge/about/submissions\">directives aux auteur.e.s</a>.</li><li>Cette soumission n\'a ni été publiée précédemment, ni été soumise à une autre revue.</li><li>Toutes les références ont été vérifiées et sont exactes.</li><li>Tous les tableaux et figures sont numérotés et définis.</li><li>L\'autorisation de publier toutes les photos, tous les ensembles de données et tout autre matériel fourni avec cette soumission a été obtenue.</li></ul>'),
(57,1,'','submitWithCategories','0'),
(58,1,'','supportedAddedSubmissionLocales','[\"en\",\"fr_CA\"]'),
(59,1,'','supportedDefaultSubmissionLocale','en'),
(60,1,'','supportedFormLocales','[\"en\",\"fr_CA\"]'),
(61,1,'','supportedLocales','[\"en\",\"fr_CA\"]'),
(62,1,'','supportedSubmissionLocales','[\"en\",\"fr_CA\"]'),
(63,1,'','supportedSubmissionMetadataLocales','[\"en\",\"fr_CA\"]'),
(64,1,'','themePluginPath','default'),
(65,1,'en','uploadFilesHelp','<p>Provide any files our editorial team may need to evaluate your submission. In addition to the main work, you may wish to submit data sets, conflict of interest statements, or other supplementary files if these will be helpful for our editors.</p>'),
(66,1,'fr_CA','uploadFilesHelp','<p> Fournir tous les fichiers dont notre équipe éditoriale pourrait avoir besoin pour évaluer votre soumission. En plus du fichier principal, vous pouvez soumettre des ensembles de données, une déclaration relative au conflit d\'intérêt ou tout autre fichier potentiellement utile pour nos éditeur.trice.s.</p>'),
(67,1,'','enableGeoUsageStats','disabled'),
(68,1,'','enableInstitutionUsageStats','0'),
(69,1,'','isSushiApiPublic','1'),
(72,1,'en','clockssLicense','This journal utilizes the CLOCKSS system to create a distributed archiving system among participating libraries and permits those libraries to create permanent archives of the journal for purposes of preservation and restoration. <a href=\"https://clockss.org\">More...</a>'),
(73,1,'fr_CA','clockssLicense','Cette revue utilise le système CLOCKSS pour créer un système d\'archivage distribué parmi les bibliothèques participantes et permet à ces bibliothèques de créer des archives permanentes de la revue à des fins de conservation et de reconstitution. <a href=\"https://clockss.org\">En apprendre davantage... </a>'),
(74,1,'','copyrightYearBasis','issue'),
(75,1,'','enabledDoiTypes','[\"publication\"]'),
(76,1,'','doiCreationTime','copyEditCreationTime'),
(77,1,'','enableOai','1'),
(78,1,'en','lockssLicense','This journal utilizes the LOCKSS system to create a distributed archiving system among participating libraries and permits those libraries to create permanent archives of the journal for purposes of preservation and restoration. <a href=\"https://www.lockss.org\">More...</a>'),
(79,1,'fr_CA','lockssLicense','Cette revue utilise le système LOCKSS pour créer un système de distribution des archives parmi les bibliothèques participantes et afin de permettre à ces bibliothèques de créer des archives permanentes pour fins de préservation et de restauration. <a href=\"https://lockss.org\">En apprendre davantage...</a>'),
(80,1,'','membershipFee','0'),
(81,1,'','publicationFee','0'),
(82,1,'','purchaseArticleFee','0'),
(83,1,'','doiVersioning','0'),
(84,1,'en','customHeaders','<meta name=\"pkp\" content=\"Test metatag.\">'),
(85,1,'en','searchDescription','The Journal of Public Knowledge is a peer-reviewed quarterly publication on the subject of public access to science.'),
(86,1,'en','abbreviation','publicknowledgeJ Pub Know'),
(87,1,'','onlineIssn','0378-5955'),
(88,1,'','printIssn','0378-5955'),
(89,1,'','publisherInstitution','Public Knowledge Project'),
(90,1,'','mailingAddress','123 456th Street\nBurnaby, British Columbia\nCanada'),
(91,1,'','supportEmail','rvaca@mailinator.com'),
(92,1,'','supportName','Ramiro Vaca');
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
  `seq` double NOT NULL DEFAULT 0 COMMENT 'Used to order lists of journals',
  `primary_locale` varchar(28) NOT NULL,
  `enabled` smallint(6) NOT NULL DEFAULT 1 COMMENT 'Controls whether or not the journal is considered "live" and will appear on the website. (Note that disabled journals may still be accessible, but only if the user knows the URL.)',
  `current_issue_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`journal_id`),
  UNIQUE KEY `journals_path` (`path`),
  KEY `journals_issue_id` (`current_issue_id`),
  CONSTRAINT `journals_current_issue_id_foreign` FOREIGN KEY (`current_issue_id`) REFERENCES `issues` (`issue_id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='A list of all journals in the installation of OJS.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `journals`
--

LOCK TABLES `journals` WRITE;
/*!40000 ALTER TABLE `journals` DISABLE KEYS */;
INSERT INTO `journals` VALUES
(1,'publicknowledge',1,'en',1,1);
/*!40000 ALTER TABLE `journals` ENABLE KEYS */;
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
  CONSTRAINT `library_files_context_id` FOREIGN KEY (`context_id`) REFERENCES `journals` (`journal_id`) ON DELETE CASCADE,
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
  CONSTRAINT `metrics_context_context_id_foreign` FOREIGN KEY (`context_id`) REFERENCES `journals` (`journal_id`) ON DELETE CASCADE
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
  CONSTRAINT `msd_context_id_foreign` FOREIGN KEY (`context_id`) REFERENCES `journals` (`journal_id`) ON DELETE CASCADE,
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
  KEY `metrics_counter_submission_institution_daily_context_id` (`context_id`),
  KEY `metrics_counter_submission_institution_daily_submission_id` (`submission_id`),
  KEY `metrics_counter_submission_institution_daily_institution_id` (`institution_id`),
  KEY `msid_context_id_submission_id` (`context_id`,`submission_id`),
  CONSTRAINT `msid_context_id_foreign` FOREIGN KEY (`context_id`) REFERENCES `journals` (`journal_id`) ON DELETE CASCADE,
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
  KEY `metrics_counter_submission_institution_monthly_context_id` (`context_id`),
  KEY `metrics_counter_submission_institution_monthly_submission_id` (`submission_id`),
  KEY `metrics_counter_submission_institution_monthly_institution_id` (`institution_id`),
  KEY `msim_context_id_submission_id` (`context_id`,`submission_id`),
  CONSTRAINT `msim_context_id_foreign` FOREIGN KEY (`context_id`) REFERENCES `journals` (`journal_id`) ON DELETE CASCADE,
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
  CONSTRAINT `msm_context_id_foreign` FOREIGN KEY (`context_id`) REFERENCES `journals` (`journal_id`) ON DELETE CASCADE,
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
-- Table structure for table `metrics_issue`
--

DROP TABLE IF EXISTS `metrics_issue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `metrics_issue` (
  `metrics_issue_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `load_id` varchar(50) NOT NULL,
  `context_id` bigint(20) NOT NULL,
  `issue_id` bigint(20) NOT NULL,
  `issue_galley_id` bigint(20) DEFAULT NULL,
  `date` date NOT NULL,
  `metric` int(11) NOT NULL,
  PRIMARY KEY (`metrics_issue_id`),
  KEY `metrics_issue_load_id` (`load_id`),
  KEY `metrics_issue_context_id` (`context_id`),
  KEY `metrics_issue_issue_id` (`issue_id`),
  KEY `metrics_issue_issue_galley_id` (`issue_galley_id`),
  KEY `metrics_issue_context_id_issue_id` (`context_id`,`issue_id`),
  CONSTRAINT `metrics_issue_context_id_foreign` FOREIGN KEY (`context_id`) REFERENCES `journals` (`journal_id`) ON DELETE CASCADE,
  CONSTRAINT `metrics_issue_issue_galley_id_foreign` FOREIGN KEY (`issue_galley_id`) REFERENCES `issue_galleys` (`galley_id`) ON DELETE CASCADE,
  CONSTRAINT `metrics_issue_issue_id_foreign` FOREIGN KEY (`issue_id`) REFERENCES `issues` (`issue_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='Daily statistics for views and downloads of published issues.';
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
  CONSTRAINT `metrics_submission_context_id_foreign` FOREIGN KEY (`context_id`) REFERENCES `journals` (`journal_id`) ON DELETE CASCADE,
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
  KEY `metrics_submission_geo_daily_context_id` (`context_id`),
  KEY `metrics_submission_geo_daily_submission_id` (`submission_id`),
  KEY `msgd_context_id_submission_id` (`context_id`,`submission_id`),
  CONSTRAINT `msgd_context_id_foreign` FOREIGN KEY (`context_id`) REFERENCES `journals` (`journal_id`) ON DELETE CASCADE,
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
  KEY `metrics_submission_geo_monthly_context_id` (`context_id`),
  KEY `metrics_submission_geo_monthly_submission_id` (`submission_id`),
  KEY `msgm_context_id_submission_id` (`context_id`,`submission_id`),
  CONSTRAINT `msgm_context_id_foreign` FOREIGN KEY (`context_id`) REFERENCES `journals` (`journal_id`) ON DELETE CASCADE,
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
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='Links navigation menu items to navigation menus.';
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
(18,3,18,NULL,3),
(19,3,19,18,0),
(20,3,20,18,1),
(21,3,21,18,2),
(22,3,22,18,3),
(23,3,23,18,4);
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
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='More data about navigation menu items, including localized content such as names.';
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
(15,15,'','titleLocaleKey','navigation.current','string'),
(16,16,'','titleLocaleKey','navigation.archives','string'),
(17,17,'','titleLocaleKey','manager.announcements','string'),
(18,18,'','titleLocaleKey','navigation.about','string'),
(19,19,'','titleLocaleKey','about.aboutContext','string'),
(20,20,'','titleLocaleKey','about.submissions','string'),
(21,21,'','titleLocaleKey','common.editorialMasthead','string'),
(22,22,'','titleLocaleKey','manager.setup.privacyStatement','string'),
(23,23,'','titleLocaleKey','about.contact','string'),
(24,24,'','titleLocaleKey','common.search','string');
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
  CONSTRAINT `navigation_menu_items_context_id` FOREIGN KEY (`context_id`) REFERENCES `journals` (`journal_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='Navigation menu items are single elements within a navigation menu.';
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
(15,1,NULL,'NMI_TYPE_CURRENT'),
(16,1,NULL,'NMI_TYPE_ARCHIVES'),
(17,1,NULL,'NMI_TYPE_ANNOUNCEMENTS'),
(18,1,NULL,'NMI_TYPE_ABOUT'),
(19,1,NULL,'NMI_TYPE_ABOUT'),
(20,1,NULL,'NMI_TYPE_SUBMISSIONS'),
(21,1,NULL,'NMI_TYPE_MASTHEAD'),
(22,1,NULL,'NMI_TYPE_PRIVACY'),
(23,1,NULL,'NMI_TYPE_CONTACT'),
(24,1,NULL,'NMI_TYPE_SEARCH');
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
  CONSTRAINT `navigation_menus_context_id` FOREIGN KEY (`context_id`) REFERENCES `journals` (`journal_id`) ON DELETE CASCADE
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='Notes allow users to annotate associated entities, such as submissions.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notes`
--

LOCK TABLES `notes` WRITE;
/*!40000 ALTER TABLE `notes` DISABLE KEYS */;
INSERT INTO `notes` VALUES
(1,1048586,1,6,'2024-12-27 05:29:13','2024-12-27 05:29:13','Editor Recommendation','<p>Dear Daniel Barnes, David Buskins, Stephanie Berardo,</p><p>After considering the reviewers\' feedback, I would like to make the following recommendation regarding the submission The influence of lactation on the quantity and quality of cashmere production.</p><p>My recommendation is: Accept Submission.</p><p>Please visit the submission\'s <a href=\"http://localhost/index.php/publicknowledge/en/workflow/access/2\">editorial workflow</a> to act on this recommendation.</p><p>Please feel free to contact me with any questions.</p><p>Kind regards,</p><p>Minoti Inoue</p>');
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
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='More data about notifications, including localized properties.';
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
  CONSTRAINT `notification_subscription_settings_context_id_foreign` FOREIGN KEY (`context_id`) REFERENCES `journals` (`journal_id`) ON DELETE CASCADE,
  CONSTRAINT `notification_subscription_settings_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='Which email notifications a user has chosen to unsubscribe from.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notification_subscription_settings`
--

LOCK TABLES `notification_subscription_settings` WRITE;
/*!40000 ALTER TABLE `notification_subscription_settings` DISABLE KEYS */;
INSERT INTO `notification_subscription_settings` VALUES
(1,'blocked_emailed_notification','8',17,1,'int'),
(2,'blocked_emailed_notification','268435477',17,1,'int'),
(3,'blocked_emailed_notification','50331659',17,1,'int'),
(4,'blocked_emailed_notification','8',18,1,'int'),
(5,'blocked_emailed_notification','268435477',18,1,'int'),
(6,'blocked_emailed_notification','50331659',18,1,'int'),
(7,'blocked_emailed_notification','8',19,1,'int'),
(8,'blocked_emailed_notification','268435477',19,1,'int'),
(9,'blocked_emailed_notification','50331659',19,1,'int'),
(10,'blocked_emailed_notification','8',20,1,'int'),
(11,'blocked_emailed_notification','268435477',20,1,'int'),
(12,'blocked_emailed_notification','50331659',20,1,'int'),
(13,'blocked_emailed_notification','8',21,1,'int'),
(14,'blocked_emailed_notification','268435477',21,1,'int'),
(15,'blocked_emailed_notification','50331659',21,1,'int'),
(16,'blocked_emailed_notification','8',22,1,'int'),
(17,'blocked_emailed_notification','268435477',22,1,'int'),
(18,'blocked_emailed_notification','50331659',22,1,'int'),
(19,'blocked_emailed_notification','8',23,1,'int'),
(20,'blocked_emailed_notification','268435477',23,1,'int'),
(21,'blocked_emailed_notification','50331659',23,1,'int'),
(22,'blocked_emailed_notification','8',24,1,'int'),
(23,'blocked_emailed_notification','268435477',24,1,'int'),
(24,'blocked_emailed_notification','50331659',24,1,'int'),
(25,'blocked_emailed_notification','8',25,1,'int'),
(26,'blocked_emailed_notification','268435477',25,1,'int'),
(27,'blocked_emailed_notification','50331659',25,1,'int'),
(28,'blocked_emailed_notification','8',26,1,'int'),
(29,'blocked_emailed_notification','268435477',26,1,'int'),
(30,'blocked_emailed_notification','50331659',26,1,'int'),
(31,'blocked_emailed_notification','8',27,1,'int'),
(32,'blocked_emailed_notification','268435477',27,1,'int'),
(33,'blocked_emailed_notification','50331659',27,1,'int'),
(34,'blocked_emailed_notification','8',28,1,'int'),
(35,'blocked_emailed_notification','268435477',28,1,'int'),
(36,'blocked_emailed_notification','50331659',28,1,'int'),
(37,'blocked_emailed_notification','8',29,1,'int'),
(38,'blocked_emailed_notification','268435477',29,1,'int'),
(39,'blocked_emailed_notification','50331659',29,1,'int'),
(40,'blocked_emailed_notification','8',30,1,'int'),
(41,'blocked_emailed_notification','268435477',30,1,'int'),
(42,'blocked_emailed_notification','50331659',30,1,'int'),
(43,'blocked_emailed_notification','8',31,1,'int'),
(44,'blocked_emailed_notification','268435477',31,1,'int'),
(45,'blocked_emailed_notification','50331659',31,1,'int'),
(46,'blocked_emailed_notification','8',32,1,'int'),
(47,'blocked_emailed_notification','268435477',32,1,'int'),
(48,'blocked_emailed_notification','50331659',32,1,'int'),
(49,'blocked_emailed_notification','8',33,1,'int'),
(50,'blocked_emailed_notification','268435477',33,1,'int'),
(51,'blocked_emailed_notification','50331659',33,1,'int'),
(52,'blocked_emailed_notification','8',34,1,'int'),
(53,'blocked_emailed_notification','268435477',34,1,'int'),
(54,'blocked_emailed_notification','50331659',34,1,'int'),
(55,'blocked_emailed_notification','8',35,1,'int'),
(56,'blocked_emailed_notification','268435477',35,1,'int'),
(57,'blocked_emailed_notification','50331659',35,1,'int');
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
) ENGINE=InnoDB AUTO_INCREMENT=286 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='User notifications created during certain operations.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notifications`
--

LOCK TABLES `notifications` WRITE;
/*!40000 ALTER TABLE `notifications` DISABLE KEYS */;
INSERT INTO `notifications` VALUES
(8,1,3,2,16777217,'2024-12-27 05:25:07',NULL,1048585,1),
(9,1,4,2,16777217,'2024-12-27 05:25:07',NULL,1048585,1),
(10,1,5,2,16777217,'2024-12-27 05:25:07',NULL,1048585,1),
(11,1,NULL,2,16777243,'2024-12-27 05:25:07',NULL,1048585,1),
(12,1,NULL,2,16777245,'2024-12-27 05:25:08',NULL,1048585,1),
(13,1,NULL,2,16777236,'2024-12-27 05:25:18',NULL,523,1),
(15,1,7,3,16777227,'2024-12-27 05:25:22',NULL,517,1),
(17,1,9,3,16777227,'2024-12-27 05:25:24',NULL,517,2),
(19,1,10,3,16777227,'2024-12-27 05:25:27',NULL,517,3),
(26,1,17,2,16777235,'2024-12-27 05:25:39',NULL,1048585,1),
(33,1,3,3,16777259,'2024-12-27 05:27:57',NULL,1048585,1),
(34,1,4,3,16777259,'2024-12-27 05:27:57',NULL,1048585,1),
(35,1,5,3,16777259,'2024-12-27 05:27:57',NULL,1048585,1),
(36,1,12,3,16777259,'2024-12-27 05:27:57',NULL,1048585,1),
(37,1,14,3,16777259,'2024-12-27 05:27:57',NULL,1048585,1),
(38,1,16,3,16777259,'2024-12-27 05:27:57',NULL,1048585,1),
(39,1,17,3,16777259,'2024-12-27 05:27:57',NULL,1048585,1),
(42,1,3,2,16777217,'2024-12-27 05:28:54',NULL,1048585,2),
(43,1,4,2,16777217,'2024-12-27 05:28:54',NULL,1048585,2),
(44,1,5,2,16777217,'2024-12-27 05:28:54',NULL,1048585,2),
(45,1,NULL,2,16777243,'2024-12-27 05:28:54',NULL,1048585,2),
(46,1,NULL,2,16777245,'2024-12-27 05:28:54',NULL,1048585,2),
(47,1,NULL,2,16777236,'2024-12-27 05:29:00',NULL,523,2),
(48,1,18,2,16777231,'2024-12-27 05:29:00',NULL,1048585,2),
(50,1,3,3,16777249,'2024-12-27 05:29:13',NULL,1048586,1),
(51,1,4,3,16777249,'2024-12-27 05:29:13',NULL,1048586,1),
(52,1,5,3,16777249,'2024-12-27 05:29:13',NULL,1048586,1),
(53,1,3,2,16777217,'2024-12-27 05:29:27',NULL,1048585,3),
(54,1,4,2,16777217,'2024-12-27 05:29:27',NULL,1048585,3),
(55,1,5,2,16777217,'2024-12-27 05:29:27',NULL,1048585,3),
(56,1,NULL,2,16777243,'2024-12-27 05:29:28',NULL,1048585,3),
(57,1,NULL,2,16777245,'2024-12-27 05:29:28',NULL,1048585,3),
(58,1,NULL,2,16777236,'2024-12-27 05:29:34',NULL,523,3),
(60,1,9,3,16777227,'2024-12-27 05:29:37',NULL,517,4),
(62,1,10,3,16777227,'2024-12-27 05:29:39',NULL,517,5),
(64,1,19,2,16777230,'2024-12-27 05:29:43',NULL,1048585,3),
(65,1,3,2,16777251,'2024-12-27 05:29:43','2024-12-27 05:29:46',1048585,3),
(66,1,4,2,16777251,'2024-12-27 05:29:43',NULL,1048585,3),
(67,1,5,2,16777251,'2024-12-27 05:29:43',NULL,1048585,3),
(69,1,3,2,16777217,'2024-12-27 05:29:57',NULL,1048585,4),
(70,1,4,2,16777217,'2024-12-27 05:29:57',NULL,1048585,4),
(71,1,5,2,16777217,'2024-12-27 05:29:58',NULL,1048585,4),
(72,1,NULL,2,16777243,'2024-12-27 05:29:58',NULL,1048585,4),
(73,1,NULL,2,16777245,'2024-12-27 05:29:58',NULL,1048585,4),
(74,1,3,2,16777217,'2024-12-27 05:30:07',NULL,1048585,5),
(75,1,4,2,16777217,'2024-12-27 05:30:07',NULL,1048585,5),
(76,1,5,2,16777217,'2024-12-27 05:30:07',NULL,1048585,5),
(77,1,NULL,2,16777243,'2024-12-27 05:30:07',NULL,1048585,5),
(78,1,NULL,2,16777245,'2024-12-27 05:30:07',NULL,1048585,5),
(79,1,NULL,2,16777236,'2024-12-27 05:30:13',NULL,523,4),
(81,1,8,3,16777227,'2024-12-27 05:30:17',NULL,517,6),
(83,1,10,3,16777227,'2024-12-27 05:30:19',NULL,517,7),
(90,1,21,2,16777235,'2024-12-27 05:30:31',NULL,1048585,5),
(91,1,3,2,16777254,'2024-12-27 05:30:31','2024-12-27 05:30:34',1048585,5),
(92,1,4,2,16777254,'2024-12-27 05:30:31',NULL,1048585,5),
(93,1,5,2,16777254,'2024-12-27 05:30:31',NULL,1048585,5),
(96,1,3,2,16777217,'2024-12-27 05:30:48',NULL,1048585,6),
(97,1,4,2,16777217,'2024-12-27 05:30:48',NULL,1048585,6),
(98,1,5,2,16777217,'2024-12-27 05:30:48',NULL,1048585,6),
(99,1,NULL,2,16777243,'2024-12-27 05:30:49',NULL,1048585,6),
(100,1,NULL,2,16777245,'2024-12-27 05:30:49',NULL,1048585,6),
(101,1,NULL,2,16777236,'2024-12-27 05:30:55',NULL,523,5),
(103,1,7,3,16777227,'2024-12-27 05:30:59',NULL,517,8),
(105,1,10,3,16777227,'2024-12-27 05:31:01',NULL,517,9),
(112,1,22,2,16777235,'2024-12-27 05:31:13',NULL,1048585,6),
(113,1,3,2,16777254,'2024-12-27 05:31:13','2024-12-27 05:31:16',1048585,6),
(114,1,4,2,16777254,'2024-12-27 05:31:13',NULL,1048585,6),
(115,1,5,2,16777254,'2024-12-27 05:31:13',NULL,1048585,6),
(117,1,3,2,16777217,'2024-12-27 05:31:27',NULL,1048585,7),
(118,1,4,2,16777217,'2024-12-27 05:31:27',NULL,1048585,7),
(119,1,5,2,16777217,'2024-12-27 05:31:27',NULL,1048585,7),
(120,1,NULL,2,16777243,'2024-12-27 05:31:28',NULL,1048585,7),
(121,1,NULL,2,16777245,'2024-12-27 05:31:28',NULL,1048585,7),
(122,1,NULL,2,16777236,'2024-12-27 05:31:34',NULL,523,6),
(123,1,23,2,16777231,'2024-12-27 05:31:34',NULL,1048585,7),
(126,1,9,3,16777227,'2024-12-27 05:31:40',NULL,517,11),
(128,1,10,3,16777227,'2024-12-27 05:31:43',NULL,517,12),
(130,1,3,2,16777219,'2024-12-27 05:31:51',NULL,517,10),
(131,1,4,2,16777219,'2024-12-27 05:31:51',NULL,517,10),
(132,1,5,2,16777219,'2024-12-27 05:31:51',NULL,517,10),
(133,1,3,2,16777217,'2024-12-27 05:32:01',NULL,1048585,8),
(134,1,4,2,16777217,'2024-12-27 05:32:01',NULL,1048585,8),
(135,1,5,2,16777217,'2024-12-27 05:32:01',NULL,1048585,8),
(136,1,NULL,2,16777243,'2024-12-27 05:32:02',NULL,1048585,8),
(137,1,NULL,2,16777245,'2024-12-27 05:32:02',NULL,1048585,8),
(138,1,3,2,16777217,'2024-12-27 05:32:11',NULL,1048585,9),
(139,1,6,2,16777217,'2024-12-27 05:32:11',NULL,1048585,9),
(140,1,NULL,2,16777243,'2024-12-27 05:32:11',NULL,1048585,9),
(141,1,NULL,2,16777245,'2024-12-27 05:32:11',NULL,1048585,9),
(142,1,NULL,2,16777236,'2024-12-27 05:32:18',NULL,523,7),
(144,1,7,3,16777227,'2024-12-27 05:32:22',NULL,517,13),
(146,1,10,3,16777227,'2024-12-27 05:32:24',NULL,517,14),
(152,1,25,2,16777235,'2024-12-27 05:32:37',NULL,1048585,9),
(153,1,3,2,16777254,'2024-12-27 05:32:37','2024-12-27 05:32:40',1048585,9),
(154,1,6,2,16777254,'2024-12-27 05:32:37',NULL,1048585,9),
(157,1,3,2,16777217,'2024-12-27 05:32:54',NULL,1048585,10),
(158,1,4,2,16777217,'2024-12-27 05:32:54',NULL,1048585,10),
(159,1,5,2,16777217,'2024-12-27 05:32:54',NULL,1048585,10),
(160,1,NULL,2,16777243,'2024-12-27 05:32:55',NULL,1048585,10),
(161,1,NULL,2,16777245,'2024-12-27 05:32:55',NULL,1048585,10),
(162,1,NULL,2,16777236,'2024-12-27 05:33:01',NULL,523,8),
(163,1,26,2,16777231,'2024-12-27 05:33:01',NULL,1048585,10),
(168,1,3,2,16777219,'2024-12-27 05:33:16',NULL,517,15),
(169,1,4,2,16777219,'2024-12-27 05:33:16',NULL,517,15),
(170,1,5,2,16777219,'2024-12-27 05:33:16',NULL,517,15),
(171,1,3,2,16777219,'2024-12-27 05:33:24',NULL,517,16),
(172,1,4,2,16777219,'2024-12-27 05:33:24',NULL,517,16),
(173,1,5,2,16777219,'2024-12-27 05:33:24',NULL,517,16),
(174,1,3,2,16777217,'2024-12-27 05:33:34',NULL,1048585,11),
(175,1,4,2,16777217,'2024-12-27 05:33:34',NULL,1048585,11),
(176,1,5,2,16777217,'2024-12-27 05:33:34',NULL,1048585,11),
(177,1,NULL,2,16777243,'2024-12-27 05:33:35',NULL,1048585,11),
(178,1,NULL,2,16777245,'2024-12-27 05:33:35',NULL,1048585,11),
(179,1,3,2,16777217,'2024-12-27 05:33:44',NULL,1048585,12),
(180,1,4,2,16777217,'2024-12-27 05:33:44',NULL,1048585,12),
(181,1,5,2,16777217,'2024-12-27 05:33:44',NULL,1048585,12),
(182,1,NULL,2,16777243,'2024-12-27 05:33:44',NULL,1048585,12),
(183,1,NULL,2,16777245,'2024-12-27 05:33:44',NULL,1048585,12),
(184,1,NULL,2,16777236,'2024-12-27 05:33:51',NULL,523,9),
(185,1,28,2,16777231,'2024-12-27 05:33:51',NULL,1048585,12),
(186,1,7,3,16777227,'2024-12-27 05:33:56',NULL,517,17),
(188,1,8,3,16777227,'2024-12-27 05:33:58',NULL,517,18),
(190,1,3,2,16777217,'2024-12-27 05:34:08',NULL,1048585,13),
(191,1,4,2,16777217,'2024-12-27 05:34:08',NULL,1048585,13),
(192,1,5,2,16777217,'2024-12-27 05:34:08',NULL,1048585,13),
(193,1,NULL,2,16777243,'2024-12-27 05:34:09',NULL,1048585,13),
(194,1,NULL,2,16777245,'2024-12-27 05:34:09',NULL,1048585,13),
(195,1,NULL,2,16777236,'2024-12-27 05:34:16',NULL,523,10),
(203,1,3,2,16777219,'2024-12-27 05:34:33',NULL,517,19),
(204,1,4,2,16777219,'2024-12-27 05:34:34',NULL,517,19),
(205,1,5,2,16777219,'2024-12-27 05:34:34',NULL,517,19),
(206,1,3,2,16777219,'2024-12-27 05:34:41',NULL,517,20),
(207,1,4,2,16777219,'2024-12-27 05:34:41',NULL,517,20),
(208,1,5,2,16777219,'2024-12-27 05:34:42',NULL,517,20),
(209,1,3,2,16777219,'2024-12-27 05:34:50',NULL,517,21),
(210,1,4,2,16777219,'2024-12-27 05:34:50',NULL,517,21),
(211,1,5,2,16777219,'2024-12-27 05:34:50',NULL,517,21),
(212,1,29,3,16777232,'2024-12-27 05:35:01',NULL,1048585,13),
(213,1,3,2,16777217,'2024-12-27 05:35:14',NULL,1048585,14),
(214,1,4,2,16777217,'2024-12-27 05:35:14',NULL,1048585,14),
(215,1,5,2,16777217,'2024-12-27 05:35:14',NULL,1048585,14),
(216,1,NULL,2,16777243,'2024-12-27 05:35:14',NULL,1048585,14),
(217,1,NULL,2,16777245,'2024-12-27 05:35:14',NULL,1048585,14),
(218,1,3,2,16777217,'2024-12-27 05:35:23',NULL,1048585,15),
(219,1,4,2,16777217,'2024-12-27 05:35:23',NULL,1048585,15),
(220,1,5,2,16777217,'2024-12-27 05:35:23',NULL,1048585,15),
(221,1,NULL,2,16777243,'2024-12-27 05:35:24',NULL,1048585,15),
(222,1,NULL,2,16777245,'2024-12-27 05:35:24',NULL,1048585,15),
(223,1,NULL,2,16777236,'2024-12-27 05:35:31',NULL,523,11),
(225,1,8,3,16777227,'2024-12-27 05:35:36',NULL,517,22),
(227,1,9,3,16777227,'2024-12-27 05:35:38',NULL,517,23),
(234,1,31,2,16777235,'2024-12-27 05:35:52',NULL,1048585,15),
(235,1,3,2,16777254,'2024-12-27 05:35:52','2024-12-27 05:35:55',1048585,15),
(236,1,4,2,16777254,'2024-12-27 05:35:52',NULL,1048585,15),
(237,1,5,2,16777254,'2024-12-27 05:35:52',NULL,1048585,15),
(239,1,3,2,16777217,'2024-12-27 05:36:07',NULL,1048585,16),
(240,1,4,2,16777217,'2024-12-27 05:36:07',NULL,1048585,16),
(241,1,5,2,16777217,'2024-12-27 05:36:07',NULL,1048585,16),
(242,1,NULL,2,16777243,'2024-12-27 05:36:07',NULL,1048585,16),
(243,1,NULL,2,16777245,'2024-12-27 05:36:07',NULL,1048585,16),
(244,1,3,2,16777217,'2024-12-27 05:36:16',NULL,1048585,17),
(245,1,4,2,16777217,'2024-12-27 05:36:16',NULL,1048585,17),
(246,1,5,2,16777217,'2024-12-27 05:36:16',NULL,1048585,17),
(247,1,NULL,2,16777243,'2024-12-27 05:36:17',NULL,1048585,17),
(248,1,NULL,2,16777245,'2024-12-27 05:36:17',NULL,1048585,17),
(249,1,NULL,2,16777236,'2024-12-27 05:36:24',NULL,523,12),
(251,1,7,3,16777227,'2024-12-27 05:36:30',NULL,517,24),
(253,1,8,3,16777227,'2024-12-27 05:36:32',NULL,517,25),
(260,1,33,2,16777235,'2024-12-27 05:36:46',NULL,1048585,17),
(266,1,3,2,16777217,'2024-12-27 05:38:03',NULL,1048585,18),
(267,1,4,2,16777217,'2024-12-27 05:38:03',NULL,1048585,18),
(268,1,5,2,16777217,'2024-12-27 05:38:03',NULL,1048585,18),
(269,1,NULL,2,16777243,'2024-12-27 05:38:03',NULL,1048585,18),
(270,1,NULL,2,16777245,'2024-12-27 05:38:03',NULL,1048585,18),
(271,1,34,2,16777234,'2024-12-27 05:38:11',NULL,1048585,18),
(272,1,3,2,16777217,'2024-12-27 05:38:23',NULL,1048585,19),
(273,1,6,2,16777217,'2024-12-27 05:38:23',NULL,1048585,19),
(274,1,NULL,2,16777243,'2024-12-27 05:38:23',NULL,1048585,19),
(275,1,NULL,2,16777245,'2024-12-27 05:38:23',NULL,1048585,19),
(276,1,NULL,2,16777236,'2024-12-27 05:38:31',NULL,523,13),
(278,1,8,3,16777227,'2024-12-27 05:38:36',NULL,517,26),
(280,1,9,3,16777227,'2024-12-27 05:38:38',NULL,517,27),
(282,1,35,2,16777230,'2024-12-27 05:38:42',NULL,1048585,19),
(283,1,3,2,16777251,'2024-12-27 05:38:42','2024-12-27 05:38:46',1048585,19),
(284,1,6,2,16777251,'2024-12-27 05:38:42',NULL,1048585,19);
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
  CONSTRAINT `plugin_settings_context_id` FOREIGN KEY (`context_id`) REFERENCES `journals` (`journal_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='More data about plugins, including localized properties. This table is frequently used to store plugin-specific configuration.';
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
(8,'defaultthemeplugin',1,'enabled','1','bool'),
(9,'tinymceplugin',1,'enabled','1','bool'),
(10,'languagetoggleblockplugin',1,'enabled','1','bool'),
(11,'languagetoggleblockplugin',1,'seq','4','int'),
(12,'developedbyblockplugin',1,'enabled','0','bool'),
(13,'developedbyblockplugin',1,'seq','0','int'),
(14,'subscriptionblockplugin',1,'enabled','1','bool'),
(15,'subscriptionblockplugin',1,'seq','2','int'),
(16,'informationblockplugin',1,'enabled','1','bool'),
(17,'informationblockplugin',1,'seq','7','int'),
(18,'resolverplugin',1,'enabled','1','bool'),
(19,'dublincoremetaplugin',1,'enabled','1','bool'),
(20,'pdfjsviewerplugin',1,'enabled','1','bool'),
(21,'lensgalleyplugin',1,'enabled','1','bool'),
(22,'googlescholarplugin',1,'enabled','1','bool'),
(23,'webfeedplugin',1,'enabled','1','bool'),
(24,'webfeedplugin',1,'displayPage','homepage','string'),
(25,'webfeedplugin',1,'displayItems','1','bool'),
(26,'webfeedplugin',1,'recentItems','30','int'),
(27,'webfeedplugin',1,'includeIdentifiers','0','bool'),
(28,'htmlarticlegalleyplugin',1,'enabled','1','bool'),
(29,'defaultthemeplugin',1,'typography','notoSans','string'),
(30,'defaultthemeplugin',1,'baseColour','#1E6292','string'),
(31,'defaultthemeplugin',1,'showDescriptionInJournalIndex','false','string'),
(32,'defaultthemeplugin',1,'useHomepageImageAsHeader','false','string'),
(33,'defaultthemeplugin',1,'displayStats','none','string');
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
  `setting_value` mediumtext DEFAULT NULL,
  PRIMARY KEY (`publication_galley_setting_id`),
  UNIQUE KEY `publication_galley_settings_unique` (`galley_id`,`locale`,`setting_name`),
  KEY `publication_galley_settings_galley_id` (`galley_id`),
  KEY `publication_galley_settings_name_value` (`setting_name`(50),`setting_value`(150)),
  CONSTRAINT `publication_galley_settings_galley_id` FOREIGN KEY (`galley_id`) REFERENCES `publication_galleys` (`galley_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='More data about publication galleys, including localized content such as labels.';
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
  `is_approved` smallint(6) NOT NULL DEFAULT 0,
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='Publication galleys are representations of a publication in a specific format, e.g. a PDF.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `publication_galleys`
--

LOCK TABLES `publication_galleys` WRITE;
/*!40000 ALTER TABLE `publication_galleys` DISABLE KEYS */;
INSERT INTO `publication_galleys` VALUES
(1,'en',1,'PDF',12,0,NULL,0,NULL,NULL),
(2,'en',2,'PDF Version 2',12,0,NULL,0,'pdf',NULL),
(3,'en',18,'PDF',40,0,NULL,0,NULL,NULL);
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
  KEY `publication_settings_publication_id` (`publication_id`),
  CONSTRAINT `publication_settings_publication_id` FOREIGN KEY (`publication_id`) REFERENCES `publications` (`publication_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=59 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='More data about publications, including localized properties such as the title and abstract.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `publication_settings`
--

LOCK TABLES `publication_settings` WRITE;
/*!40000 ALTER TABLE `publication_settings` DISABLE KEYS */;
INSERT INTO `publication_settings` VALUES
(1,1,'en','title','Signalling Theory Dividends'),
(2,1,'en','abstract','<p>The signaling theory suggests that dividends signal future prospects of a firm. However, recent empirical evidence from the US and the Uk does not offer a conclusive evidence on this issue. There are conflicting policy implications among financial economists so much that there is no practical dividend policy guidance to management, existing and potential investors in shareholding. Since corporate investment, financing and distribution decisions are a continuous function of management, the dividend decisions seem to rely on intuitive evaluation.</p>'),
(3,1,'en','prefix','The'),
(4,1,'en','subtitle','A Review Of The Literature And Empirical Evidence'),
(5,1,'','pages','71-98'),
(6,1,'','issueId','1'),
(7,1,'en','copyrightHolder','Journal of Public Knowledge'),
(8,1,'fr_CA','copyrightHolder','Journal de la connaissance du public'),
(9,1,'','copyrightYear','2024'),
(10,2,'en','abstract','<p>The signaling theory suggests that dividends signal future prospects of a firm. However, recent empirical evidence from the US and the Uk does not offer a conclusive evidence on this issue. There are conflicting policy implications among financial economists so much that there is no practical dividend policy guidance to management, existing and potential investors in shareholding. Since corporate investment, financing and distribution decisions are a continuous function of management, the dividend decisions seem to rely on intuitive evaluation.</p>'),
(11,2,'en','copyrightHolder','Journal of Public Knowledge'),
(12,2,'fr_CA','copyrightHolder','Journal de la connaissance du public'),
(13,2,'','copyrightYear','2024'),
(14,2,'en','prefix','The'),
(15,2,'en','subtitle','A Review Of The Literature And Empirical Evidence'),
(16,2,'en','title','The Signalling Theory Dividends Version 2'),
(17,2,'','issueId','1'),
(18,2,'','pages','71-98'),
(19,3,'en','abstract','The effects of pressed beet pulp silage (PBPS) replacing barley for 10% and 20% (DM basis) were studied on heavy pigs fed dairy whey-diluted diets. 60 Hypor pigs (average initial weight of 28 kg), 30 barrows and 30 gilts, were homogeneously allocated to three exper- imental groups: T1 (control) in which pigs were fed a traditional sweet whey- diluted diet (the ratio between whey and dry matter was 4.5/1); T2 in which PBPS replaced barley for 10% (DM basis) during a first period (from the beginning to the 133rd day of trial) and thereafter for 20% (DM basis); T3 in which PBPS replaced barley for 20% (DM basis) throughout the experimental period. In diets T2 and T3 feed was dairy whey-diluted as in group T1. No significant (P>0.05) differences were observed concerning growth parameters (ADG and FCR). Pigs on diets contain- ing PBPS showed significantly higher (P<0.05) percentages of lean cuts and lower percentages of fat cuts. On the whole, ham weight losses during seasoning were moderate but significantly (P<0.05) more marked for PBPS-fed pigs as a prob- able consequence of their lower adiposity degree. Fatty acid composition of ham fat was unaffected by diets. With regard to m. Semimembranosus colour, pigs receiving PBPS showed lower (P<0.05) \"L\", \"a\" and \"Chroma\" values. From an economical point of view it can be concluded that the use of PBPS (partially replacing barley) and dairy whey in heavy pig production could be of particular interest in areas where both these by products are readily available.'),
(20,3,'en','title','The influence of lactation on the quantity and quality of cashmere production'),
(21,4,'en','abstract','Archival data from an attitude survey of employees in a single multinational organization were used to examine the degree to which national culture affects the nature of job satisfaction. Responses from nine countries were compiled to create a benchmark against which nations could be individually compared. Factor analysis revealed four factors: Organizational Communication, Organizational Efficiency/Effectiveness, Organizational Support, and Personal Benefit. Comparisons of factor structures indicated that Organizational Communication exhibited the most construct equivalence, and Personal Benefit the least. The most satisfied employees were those from China, and the least satisfied from Brazil, consistent with previous findings that individuals in collectivistic nations report higher satisfaction. The research findings suggest that national cultural context exerts an effect on the nature of job satisfaction.'),
(22,4,'en','title','The Facets Of Job Satisfaction: A Nine-Nation Comparative Study Of Construct Equivalence'),
(23,5,'en','abstract','The integration of technology into the classroom is a major issue in education today. Many national and provincial initiatives specify the technology skills that students must demonstrate at each grade level. The Government of the Province of Alberta in Canada, has mandated the implementation of a new curriculum which began in September of 2000, called Information and Communication Technology. This curriculum is infused within core courses and specifies what students are “expected to know, be able to do, and be like with respect to technology” (Alberta Learning, 2000). Since teachers are required to implement this new curriculum, school jurisdictions are turning to professional development strategies and hiring standards to upgrade teachers’ computer skills to meet this goal. This paper summarizes the results of a telephone survey administered to all public school jurisdictions in the Province of Alberta with a 100% response rate. We examined the computer skills that school jurisdictions require of newly hired teachers, and the support strategies employed for currently employed teachers.'),
(24,5,'en','title','Computer Skill Requirements for New and Existing Teachers: Implications for Policy and Practice'),
(25,6,'en','abstract','In this review, the recent progress on genetic transformation of forest trees were discussed. Its described also, different applications of genetic engineering for improving forest trees or understanding the mechanisms governing genes expression in woody plants.'),
(26,6,'en','title','Genetic transformation of forest trees'),
(27,7,'en','abstract','Robert Fogelin claims that interlocutors must share a framework of background beliefs and commitments in order to fruitfully pursue argument. I refute Fogelin’s claim by investigating more thoroughly the shared background required for productive argument. I find that this background consists not in any common beliefs regarding the topic at hand, but rather in certain shared pro-cedural commitments and competencies. I suggest that Fogelin and his supporters mistakenly view shared beliefs as part of the required background for productive argument because these procedural com-mitments become more difficult to uphold when people’s beliefs diverge widely regarding the topic at hand.'),
(28,7,'en','title','Investigating the Shared Background Required for Argument: A Critique of Fogelin\'s Thesis on Deep Disagreement'),
(29,8,'en','abstract','A major goal of education is to equip children with the knowledge, skills and self-belief to be confident and informed citizens - citizens who continue to see themselves as learners beyond graduation. This paper looks at the key role of nurturing efficacy beliefs in order to learn and participate in school and society. Research findings conducted within a social studies context are presented, showing how strategy instruction can enhance self-efficacy for learning. As part of this research, Creative Problem Solving (CPS) was taught to children as a means to motivate and support learning. It is shown that the use of CPS can have positive effects on self-efficacy for learning, and be a valuable framework to involve children in decision-making that leads to social action. Implications for enhancing self-efficacy and motivation to learn in the classroom are discussed.'),
(30,8,'en','title','Developing efficacy beliefs in the classroom'),
(31,9,'en','abstract','The study of the commons has expe- rienced substantial growth and development over the past decades.1 Distinguished scholars in many disciplines had long studied how specific resources were managed or mismanaged at particular times and places (Coward 1980; De los Reyes 1980; MacKenzie 1979; Wittfogel 1957), but researchers who studied specific commons before the mid-1980s were, however, less likely than their contemporary colleagues to be well informed about the work of scholars in other disciplines, about other sec- tors in their own region of interest, or in other regions of the world.'),
(32,9,'en','title','Traditions and Trends in the Study of the Commons'),
(33,10,'en','abstract','None.'),
(34,10,'en','title','Hansen & Pinto: Reason Reclaimed'),
(35,11,'en','abstract','The Texas Water Availability Modeling System is routinely applied in administration of the water rights permit system, regional and statewide planning, and an expanding variety of other endeavors. Modeling water management in the 23 river basins of the state reflects about 8,000 water right permits and 3,400 reservoirs. Datasets are necessarily large and complex to provide the decision-support capabilities for which the modeling system was developed. New modeling features are being added, and the different types of applications are growing. Certain applications are enhanced by simplifying the simulation input datasets to focus on particular water management systems. A methodology is presented for developing a condensed dataset for a selected reservoir system that reflects the impacts of all the water rights and accompanying reservoirs removed from the original complete dataset. A set of streamflows is developed that represents flows available to the selected system considering the effects of all the other water rights in the river basin contained in the original complete model input dataset that are not included in the condensed dataset. The methodology is applied to develop a condensed model of the Brazos River Authority reservoir system based on modifying the Texas Water Availability Modeling System dataset for the Brazos River Basin.'),
(36,11,'en','title','Condensing Water Availability Models to Focus on Specific Water Management Systems'),
(37,12,'en','abstract','Environmental sustainability and sustainable development principles are vital topics that engineering education has largely failed to address. Service-learning, which integrates social service into an academic setting, is an emerging tool that can be leveraged to teach sustainable design to future engineers. We present a model of using service-learning to teach sustainable design based on the experiences of the Stanford chapter of Engineers for a Sustainable World. The model involves the identification of projects and partner organizations, a student led, project-based design course, and internships coordinated with partner organizations. The model has been very successful, although limitations and challenges exist. These are discussed along with future directions for expanding the model.'),
(38,12,'en','title','Learning Sustainable Design through Service'),
(39,13,'en','abstract','The aim of this study was to assess the influence of long-term fat supplementation on the fatty acid profile of heavy pig adipose tissue. Fifty-four Large White barrows, averaging 25 kg LW, were randomized (matched weights) to one of three isoenergetic diets supplemented with either tallow (TA), maize oil (MO), or rapeseed oil (RO). The fats were supplement- ed at 3% as fed from 25 to 110 kg LW, and at 2.5 % from 110 kg to slaughtering. Following slaughter at about 160 kg LW, backfat samples were collected from ten animals per treatment and analyzed. Fatty acid composition of backfat close- ly reflected the fatty acid composition of the supplemented fats. The backfat of pigs fed TA had the highest saturated fatty acid content (SFA) (P&lt;0.01); those fed MO had the highest content in polyunsaturated fatty acid (PUFA) and the lowest in monounsaturated fatty acid (MUFA) content; those fed RO had the highest content of linolenic acid (C18:3) and cis 11- ecosenoic acid (C20:1). Only MO treatment had an effect on linoleic acid levels and the iodine value (IV) of backfat, result- ing in levels higher than those (IV = 70; C18:2 = 15%) accepted by the Parma Consortium for dry-cured ham. The IV and unsaturation index in both layers of subcutaneous backfat tissue differed significantly between treatments. These results show that long-term dietary supplementation with different fats changes the fatty acid profile of heavy pig adipose tissue. Supplementation with rapeseed oil increases the proportion of “healthy” fatty acids in pig fat, thereby improving the nutritional quality, however the effects on the technological quality of the fat must be carefully assessed.'),
(40,13,'en','title','Sodium butyrate improves growth performance of weaned piglets during the first period after weaning'),
(41,14,'en','abstract','The Edwards Aquifer serves as the primary water supply in South-Central Texas and is the source for several major springs. In developing a plan to protect endangered species immediately downstream of San Marcos Springs, questions have been raised regarding the established concept of a hydrologic divide between the San Antonio and Barton Springs segments of the Edwards Aquifer during drought conditions. To address these questions, a water-level data collection program and a hydrogeologic study was conducted. An analysis of groundwater-level data indicate that a groundwater divide exists in the vicinity of the surface drainage divide between Onion Creek and Blanco River during wet and normal hydrologic conditions. However, analysis of data collected during the 2009 drought suggests that the groundwater divide dissipated and no longer hydrologically separated the two segments. As a result, there is potential for groundwater to flow past San Marcos Springs toward Barton Springs during major droughts. The implications for this have bearings on the management and availability of groundwater in the Edwards Aquifer. Assessments of simulations from a numerical model suggest 5 cfs could be flowing past San Marcos toward Barton springs under drought conditions. The groundwater divide appears to be influenced by recharge along Onion Creek and Blanco River and appears to be vulnerable to extended periods of little or no recharge and extensive pumping in the vicinity of Kyle and Buda. The 2009 data set shows a very low gradient in the potentiometric surface between San Marcos Springs and Kyle with very little variation in levels between drought and non-drought periods. From Kyle toward Barton Springs, the potentiometric surface slopes significantly to the north and has dramatic changes in levels between drought and non-drought periods. The source and nature of the discontinuity of the change in potentiometric gradients and dynamic water level response at Kyle is unknown. Structural influences or hydraulic properties inherent in the aquifer could be the cause of this discontinuity and may also influence the degree of hydrologic connection between San Marcos and Barton Springs. Rapid population growth and increased water demands in the Kyle and Buda areas necessitates a continual groundwater level monitoring program between San Marcos Springs and Buda to provide data for future hydrogeologic and trend analyses.'),
(42,14,'en','title','Hydrologic Connectivity in the Edwards Aquifer between San Marcos Springs and Barton Springs during 2009 Drought Conditions'),
(43,15,'en','abstract','One of the challenges still to be met in the 21st century is that of genuinely embracing diversity. How can education help to overcome the barriers that continue to exist between people on the basis of language, culture and gender? This case study takes the Atlantic Coast of Nicaragua as an example of a multilingual/multiethnic region and examines how the community university URACCAN is contributing to the development of interculturality. It describes participatory research that was carried out with university staff and students with the intention of defining an intercultural curriculum and appropriate strategies for delivering such. One model used as a basis for discussions was the Model for Community Understanding from the Wales Curriculum Council, which emphasises the belonging of the individual to different communities or cultures at the same time. Factors supporting the development of an intercultural curriculum include the university’s close involvement with the ethnic communities it serves. However, ethno-linguistic power relations within the region and the country as a whole, still militate against egalitarianism within the university. The research highlights the importance of participatory pedagogy as the basis for promoting interculturality and achieving lasting social transformation.'),
(44,15,'en','title','Towards Designing an Intercultural Curriculum: A Case Study from the Atlantic Coast of Nicaragua'),
(45,16,'en','abstract','This review presents different diseases associated with yam and the management strategies employed in combating its menace in Nigeria. The field and storage diseases are presented, anthracnose is regarded as the most widely spread of all the field diseases, while yam mosaic virus disease is considered to cause the most severe losses in yams. Dry rot is considered as the most devastating of all the storage diseases of yam. Dry rot of yams alone causes a marked reduction in the quantity, marketable value and edible portions of tubers and those reductions are more severe in stored yams. The management strategies adopted and advocated for combating the field diseases includes the use of crop rotation, fallowing, planting of healthy material, the destruction of infected crop cultivars and the use of resistant cultivars. With regards to the storage diseases, the use of Tecto (Thiabendazole), locally made dry gins or wood ash before storage has been found to protect yam tubers against fungal infection in storage. Finally, processing of yam tubers into chips or cubes increases its shelf live for a period of between 6 months and one year.'),
(46,16,'en','title','Yam diseases and its management in Nigeria'),
(47,17,'en','abstract','Aim of this research is to provide a general situation of cattle slaughtered in Cameroon, as a representative example for the Central African Sub-region. The quality and safety of beef from the abattoir of Yaoundé, the largest in Cameroon, were considered. From January 2009 to March 2012, the pre-slaughter conditions and characteristics of 1953 cattle carcasses were recorded, as well as the pH of m. longissimus thoracis 24 h after slaughter. From these carcasses, 60 were selected to represent the bulls slaughtered. The quality parameters and composition of m. longissimus thoracis were carried out. The origin of most of the cattle was the Guinea High Savannah (74.6%), and transhumance was the common production system (75.5%). Gudali (45.6%), White Fulani (33.3%) and Red Mbororo (20.3%) breeds were predominant. Carcass weight was affected by rearing system and cattle category, and it markedly varied during year. Considering meat quality, the fat content was low (1.2%) and similar between breeds, moreover Gudali showed the toughest meat. Of the cows slaughtered, 27% were pregnant and the most common abnormal conditions encountered were ectoparasites, fatigue, lameness, fungal-like skin lesions, enlarged lymph nodes, respiratory distress, nodular lesions. More than 20% of the carcasses had some organs condemned, mainly for liver flukes (5.17%), and 1.0% of them were completely condemned due to tuberculosis, that also affected 3.28% of lungs. These data could aid authorities draw up programmes with the aim to strengthen cattle production, improve beef supply, control and prevent the observed diseases, and promote the regional trade.'),
(48,17,'en','title','Influence of long-term nutrition with different dietary fats on fatty acid composition of heavy pigs backfat'),
(49,18,'en','abstract','The antimicrobial, heavy metal resistance patterns and plasmid profiles of Coliforms (Enterobacteriacea) isolated from nosocomial infections and healthy human faeces were compared. Fifteen of the 25 isolates from nosocomial infections were identified as Escherichia coli, and remaining as Kelebsiella pneumoniae. Seventy two percent of the strains isolated from nosocomial infections possess multiple resistance to antibiotics compared to 45% of strains from healthy human faeces. The difference between minimal inhibitory concentration (MIC) values of strains from clinical cases and from faeces for four heavy metals (Hg, Cu, Pb, Cd) was not significant. However most strains isolated from hospital were more tolerant to heavy metal than those from healthy persons. There was no consistent relationship between plasmid profile group and antimicrobial resistance pattern, although a conjugative plasmid (>56.4 kb) encoding resistance to heavy metals and antibiotics was recovered from eight of the strains isolated from nosocomial infections. The results indicate multidrug-resistance coliforms as a potential cause of nosocomial infection in this region.'),
(50,18,'en','title','Antimicrobial, heavy metal resistance and plasmid profile of coliforms isolated from nosocomial infections in a hospital in Isfahan, Iran'),
(51,18,'','issueId','1'),
(52,18,'en','copyrightHolder','Journal of Public Knowledge'),
(53,18,'fr_CA','copyrightHolder','Journal de la connaissance du public'),
(54,18,'','copyrightYear','2024'),
(55,19,'en','abstract','We compare a setting where actors individually decide whom to sanction with a setting where sanctions are only implemented when actors collectively agree that a certain actor should be sanctioned. Collective sanctioning decisions are problematic due to the difficulty of reaching consensus. However, when a decision is made collectively, perverse sanctioning (e.g. punishing high contributors) by individual actors is ruled out. Therefore, collective sanctioning decisions are likely to be in the interest of the whole group.'),
(56,19,'en','title','Self-Organization in Multi-Level Institutions in Networked Environments'),
(57,20,'en','abstract','None.'),
(58,20,'en','title','Finocchiaro: Arguments About Arguments');
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
  `seq` double NOT NULL DEFAULT 0,
  `submission_id` bigint(20) NOT NULL,
  `status` smallint(6) NOT NULL DEFAULT 1,
  `url_path` varchar(64) DEFAULT NULL,
  `version` bigint(20) DEFAULT NULL,
  `doi_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`publication_id`),
  KEY `publications_primary_contact_id` (`primary_contact_id`),
  KEY `publications_section_id` (`section_id`),
  KEY `publications_submission_id` (`submission_id`),
  KEY `publications_doi_id` (`doi_id`),
  KEY `publications_url_path` (`url_path`),
  CONSTRAINT `publications_doi_id_foreign` FOREIGN KEY (`doi_id`) REFERENCES `dois` (`doi_id`) ON DELETE SET NULL,
  CONSTRAINT `publications_primary_contact_id` FOREIGN KEY (`primary_contact_id`) REFERENCES `authors` (`author_id`) ON DELETE SET NULL,
  CONSTRAINT `publications_section_id` FOREIGN KEY (`section_id`) REFERENCES `sections` (`section_id`) ON DELETE SET NULL,
  CONSTRAINT `publications_submission_id` FOREIGN KEY (`submission_id`) REFERENCES `submissions` (`submission_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='Each publication is one version of a submission.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `publications`
--

LOCK TABLES `publications` WRITE;
/*!40000 ALTER TABLE `publications` DISABLE KEYS */;
INSERT INTO `publications` VALUES
(1,0,'2024-12-27','2024-12-27 05:27:53',1,1,0,1,3,'mwandenga-signalling-theory',1,NULL),
(2,0,'2024-12-27','2024-12-27 05:28:26',5,1,0,1,1,'mwandenga',2,NULL),
(3,0,NULL,'2024-12-27 05:29:07',8,1,0,2,1,NULL,1,NULL),
(4,0,NULL,'2024-12-27 05:29:25',9,1,0,3,1,NULL,1,NULL),
(5,0,NULL,'2024-12-27 05:29:54',10,1,0,4,1,NULL,1,NULL),
(6,0,NULL,'2024-12-27 05:30:04',12,1,0,5,1,NULL,1,NULL),
(7,0,NULL,'2024-12-27 05:30:45',13,1,0,6,1,NULL,1,NULL),
(8,0,NULL,'2024-12-27 05:31:24',14,1,0,7,1,NULL,1,NULL),
(9,0,NULL,'2024-12-27 05:31:58',15,1,0,8,1,NULL,1,NULL),
(10,0,NULL,'2024-12-27 05:32:08',17,2,0,9,1,NULL,1,NULL),
(11,0,NULL,'2024-12-27 05:32:51',18,1,0,10,1,NULL,1,NULL),
(12,0,NULL,'2024-12-27 05:33:31',19,1,0,11,1,NULL,1,NULL),
(13,0,NULL,'2024-12-27 05:33:41',21,1,0,12,1,NULL,1,NULL),
(14,0,NULL,'2024-12-27 05:34:05',22,1,0,13,1,NULL,1,NULL),
(15,0,NULL,'2024-12-27 05:35:11',23,1,0,14,1,NULL,1,NULL),
(16,0,NULL,'2024-12-27 05:35:20',24,1,0,15,1,NULL,1,NULL),
(17,0,NULL,'2024-12-27 05:36:04',25,1,0,16,1,NULL,1,NULL),
(18,0,'2024-12-27','2024-12-27 05:37:47',26,1,0,17,3,NULL,1,NULL),
(19,0,NULL,'2024-12-27 05:38:00',27,1,0,18,1,NULL,1,NULL),
(20,0,NULL,'2024-12-27 05:38:20',28,2,0,19,1,NULL,1,NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='Discussions, usually related to a submission, created by editors, authors and other editorial staff.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `queries`
--

LOCK TABLES `queries` WRITE;
/*!40000 ALTER TABLE `queries` DISABLE KEYS */;
INSERT INTO `queries` VALUES
(1,1048585,2,3,1,'2024-12-27 05:29:13','2024-12-27 05:29:13',0);
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='The users assigned to a discussion.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `query_participants`
--

LOCK TABLES `query_participants` WRITE;
/*!40000 ALTER TABLE `query_participants` DISABLE KEYS */;
INSERT INTO `query_participants` VALUES
(1,1,3),
(2,1,4),
(3,1,5);
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
  `payment_data` text DEFAULT NULL,
  PRIMARY KEY (`queued_payment_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='Unfulfilled (queued) payments, i.e. payments that have not yet been completed via an online payment system.';
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
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='Data about peer review assignments for all submissions.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `review_assignments`
--

LOCK TABLES `review_assignments` WRITE;
/*!40000 ALTER TABLE `review_assignments` DISABLE KEYS */;
INSERT INTO `review_assignments` VALUES
(1,1,7,NULL,NULL,'2024-12-27 05:25:22','2024-12-27 05:25:22',NULL,NULL,NULL,'2025-01-24 00:00:00','2025-01-24 00:00:00','2024-12-27 05:25:22',0,0,0,NULL,NULL,NULL,NULL,1,3,2,1,1,NULL,NULL,0),
(2,1,9,NULL,NULL,'2024-12-27 05:25:24','2024-12-27 05:25:24',NULL,NULL,NULL,'2025-01-24 00:00:00','2025-01-24 00:00:00','2024-12-27 05:25:24',0,0,0,NULL,NULL,NULL,NULL,1,3,2,1,1,NULL,NULL,0),
(3,1,10,NULL,NULL,'2024-12-27 05:25:27','2024-12-27 05:25:27',NULL,NULL,NULL,'2025-01-24 00:00:00','2025-01-24 00:00:00','2024-12-27 05:25:27',0,0,0,NULL,NULL,NULL,NULL,1,3,2,1,1,NULL,NULL,0),
(4,3,9,NULL,NULL,'2024-12-27 05:29:37','2024-12-27 05:29:37',NULL,NULL,NULL,'2025-01-24 00:00:00','2025-01-24 00:00:00','2024-12-27 05:29:37',0,0,0,NULL,NULL,NULL,NULL,3,3,2,1,1,NULL,NULL,0),
(5,3,10,NULL,NULL,'2024-12-27 05:29:39','2024-12-27 05:29:39',NULL,NULL,NULL,'2025-01-24 00:00:00','2025-01-24 00:00:00','2024-12-27 05:29:39',0,0,0,NULL,NULL,NULL,NULL,3,3,2,1,1,NULL,NULL,0),
(6,5,8,NULL,NULL,'2024-12-27 05:30:17','2024-12-27 05:30:17',NULL,NULL,NULL,'2025-01-24 00:00:00','2025-01-24 00:00:00','2024-12-27 05:30:17',0,0,0,NULL,NULL,NULL,NULL,4,3,2,1,1,NULL,NULL,0),
(7,5,10,NULL,NULL,'2024-12-27 05:30:19','2024-12-27 05:30:19',NULL,NULL,NULL,'2025-01-24 00:00:00','2025-01-24 00:00:00','2024-12-27 05:30:19',0,0,0,NULL,NULL,NULL,NULL,4,3,2,1,1,NULL,NULL,0),
(8,6,7,NULL,NULL,'2024-12-27 05:30:59','2024-12-27 05:30:59',NULL,NULL,NULL,'2025-01-24 00:00:00','2025-01-24 00:00:00','2024-12-27 05:30:59',0,0,0,NULL,NULL,NULL,NULL,5,3,2,1,1,NULL,NULL,0),
(9,6,10,NULL,NULL,'2024-12-27 05:31:01','2024-12-27 05:31:01',NULL,NULL,NULL,'2025-01-24 00:00:00','2025-01-24 00:00:00','2024-12-27 05:31:01',0,0,0,NULL,NULL,NULL,NULL,5,3,2,1,1,NULL,NULL,0),
(10,7,8,NULL,5,'2024-12-27 05:31:38','2024-12-27 05:31:38','2024-12-27 05:31:48','2024-12-27 05:31:51',NULL,'2025-01-24 00:00:00','2025-01-24 00:00:00','2024-12-27 05:31:51',0,0,0,NULL,NULL,NULL,NULL,6,3,2,1,4,NULL,NULL,0),
(11,7,9,NULL,NULL,'2024-12-27 05:31:40','2024-12-27 05:31:40',NULL,NULL,NULL,'2025-01-24 00:00:00','2025-01-24 00:00:00','2024-12-27 05:31:40',0,0,0,NULL,NULL,NULL,NULL,6,3,2,1,1,NULL,NULL,0),
(12,7,10,NULL,NULL,'2024-12-27 05:31:43','2024-12-27 05:31:43',NULL,NULL,NULL,'2025-01-24 00:00:00','2025-01-24 00:00:00','2024-12-27 05:31:43',0,0,0,NULL,NULL,NULL,NULL,6,3,2,1,1,NULL,NULL,0),
(13,9,7,NULL,NULL,'2024-12-27 05:32:22','2024-12-27 05:32:22',NULL,NULL,NULL,'2025-01-24 00:00:00','2025-01-24 00:00:00','2024-12-27 05:32:22',0,0,0,NULL,NULL,NULL,NULL,7,3,2,1,1,NULL,NULL,0),
(14,9,10,NULL,NULL,'2024-12-27 05:32:24','2024-12-27 05:32:24',NULL,NULL,NULL,'2025-01-24 00:00:00','2025-01-24 00:00:00','2024-12-27 05:32:24',0,0,0,NULL,NULL,NULL,NULL,7,3,2,1,1,NULL,NULL,0),
(15,10,9,NULL,2,'2024-12-27 05:33:06','2024-12-27 05:33:06','2024-12-27 05:33:13','2024-12-27 05:33:16',NULL,'2025-01-24 00:00:00','2025-01-24 00:00:00','2024-12-27 05:33:16',0,0,0,NULL,NULL,NULL,NULL,8,3,2,1,4,NULL,NULL,0),
(16,10,10,NULL,3,'2024-12-27 05:33:08','2024-12-27 05:33:08','2024-12-27 05:33:21','2024-12-27 05:33:24',NULL,'2025-01-24 00:00:00','2025-01-24 00:00:00','2024-12-27 05:33:24',0,0,0,NULL,NULL,NULL,NULL,8,3,2,1,4,NULL,NULL,0),
(17,12,7,NULL,NULL,'2024-12-27 05:33:56','2024-12-27 05:33:56',NULL,NULL,NULL,'2025-01-24 00:00:00','2025-01-24 00:00:00','2024-12-27 05:33:56',0,0,0,NULL,NULL,NULL,NULL,9,3,1,1,1,NULL,NULL,0),
(18,12,8,NULL,NULL,'2024-12-27 05:33:58','2024-12-27 05:33:58',NULL,NULL,NULL,'2025-01-24 00:00:00','2025-01-24 00:00:00','2024-12-27 05:33:58',0,0,0,NULL,NULL,NULL,NULL,9,3,2,1,1,NULL,NULL,0),
(19,13,7,NULL,2,'2024-12-27 05:34:20','2024-12-27 05:34:21','2024-12-27 05:34:30','2024-12-27 05:34:33','2024-12-27 05:35:01','2025-01-24 00:00:00','2025-01-24 00:00:00','2024-12-27 05:35:01',0,0,0,NULL,NULL,NULL,NULL,10,3,2,1,4,NULL,NULL,0),
(20,13,9,NULL,2,'2024-12-27 05:34:23','2024-12-27 05:34:23','2024-12-27 05:34:38','2024-12-27 05:34:41','2024-12-27 05:35:01','2025-01-24 00:00:00','2025-01-24 00:00:00','2024-12-27 05:35:01',0,0,0,NULL,NULL,NULL,NULL,10,3,2,1,4,NULL,NULL,0),
(21,13,10,NULL,3,'2024-12-27 05:34:25','2024-12-27 05:34:25','2024-12-27 05:34:46','2024-12-27 05:34:50','2024-12-27 05:35:01','2025-01-24 00:00:00','2025-01-24 00:00:00','2024-12-27 05:35:01',0,0,0,NULL,NULL,NULL,NULL,10,3,2,1,4,NULL,NULL,0),
(22,15,8,NULL,NULL,'2024-12-27 05:35:36','2024-12-27 05:35:36',NULL,NULL,NULL,'2025-01-24 00:00:00','2025-01-24 00:00:00','2024-12-27 05:35:36',0,0,0,NULL,NULL,NULL,NULL,11,3,2,1,1,NULL,NULL,0),
(23,15,9,NULL,NULL,'2024-12-27 05:35:38','2024-12-27 05:35:38',NULL,NULL,NULL,'2025-01-24 00:00:00','2025-01-24 00:00:00','2024-12-27 05:35:38',0,0,0,NULL,NULL,NULL,NULL,11,3,2,1,1,NULL,NULL,0),
(24,17,7,NULL,NULL,'2024-12-27 05:36:30','2024-12-27 05:36:30',NULL,NULL,NULL,'2025-01-24 00:00:00','2025-01-24 00:00:00','2024-12-27 05:36:30',0,0,0,NULL,NULL,NULL,NULL,12,3,2,1,1,NULL,NULL,0),
(25,17,8,NULL,NULL,'2024-12-27 05:36:32','2024-12-27 05:36:32',NULL,NULL,NULL,'2025-01-24 00:00:00','2025-01-24 00:00:00','2024-12-27 05:36:32',0,0,0,NULL,NULL,NULL,NULL,12,3,2,1,1,NULL,NULL,0),
(26,19,8,NULL,NULL,'2024-12-27 05:38:36','2024-12-27 05:38:36',NULL,NULL,NULL,'2025-01-24 00:00:00','2025-01-24 00:00:00','2024-12-27 05:38:36',0,0,0,NULL,NULL,NULL,NULL,13,3,2,1,1,NULL,NULL,0),
(27,19,9,NULL,NULL,'2024-12-27 05:38:38','2024-12-27 05:38:38',NULL,NULL,NULL,'2025-01-24 00:00:00','2025-01-24 00:00:00','2024-12-27 05:38:38',0,0,0,NULL,NULL,NULL,NULL,13,3,2,1,1,NULL,NULL,0);
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
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='A list of the submission files made available to each assigned reviewer.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `review_files`
--

LOCK TABLES `review_files` WRITE;
/*!40000 ALTER TABLE `review_files` DISABLE KEYS */;
INSERT INTO `review_files` VALUES
(3,1,7),
(5,1,8),
(2,1,9),
(4,1,10),
(1,1,11),
(8,2,7),
(10,2,8),
(7,2,9),
(9,2,10),
(6,2,11),
(13,3,7),
(15,3,8),
(12,3,9),
(14,3,10),
(11,3,11),
(16,4,16),
(17,5,16),
(18,6,19),
(19,7,19),
(20,8,21),
(21,9,21),
(22,10,23),
(23,11,23),
(24,12,23),
(25,13,26),
(26,14,26),
(27,15,28),
(28,16,28),
(29,17,31),
(30,18,31),
(31,19,33),
(32,20,33),
(33,21,33),
(34,22,36),
(35,23,36),
(36,24,39),
(37,25,39),
(38,26,43),
(39,27,43);
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
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='Records the files made available to reviewers for a round of reviews. These can be further customized on a per review basis with review_files.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `review_round_files`
--

LOCK TABLES `review_round_files` WRITE;
/*!40000 ALTER TABLE `review_round_files` DISABLE KEYS */;
INSERT INTO `review_round_files` VALUES
(1,1,1,3,7),
(2,1,1,3,8),
(3,1,1,3,9),
(4,1,1,3,10),
(5,1,1,3,11),
(6,2,2,3,14),
(7,3,3,3,16),
(8,5,4,3,19),
(9,6,5,3,21),
(10,7,6,3,23),
(11,9,7,3,26),
(12,10,8,3,28),
(13,12,9,3,31),
(14,13,10,3,33),
(15,15,11,3,36),
(16,17,12,3,39),
(17,19,13,3,43);
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
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='Peer review assignments are organized into multiple rounds on a submission.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `review_rounds`
--

LOCK TABLES `review_rounds` WRITE;
/*!40000 ALTER TABLE `review_rounds` DISABLE KEYS */;
INSERT INTO `review_rounds` VALUES
(1,1,3,1,NULL,4),
(2,2,3,1,NULL,14),
(3,3,3,1,NULL,4),
(4,5,3,1,NULL,4),
(5,6,3,1,NULL,4),
(6,7,3,1,NULL,8),
(7,9,3,1,NULL,4),
(8,10,3,1,NULL,8),
(9,12,3,1,NULL,7),
(10,13,3,1,NULL,1),
(11,15,3,1,NULL,4),
(12,17,3,1,NULL,4),
(13,19,3,1,NULL,4);
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
  `setting_value` mediumtext DEFAULT NULL,
  PRIMARY KEY (`section_setting_id`),
  UNIQUE KEY `section_settings_unique` (`section_id`,`locale`,`setting_name`),
  KEY `section_settings_section_id` (`section_id`),
  CONSTRAINT `section_settings_section_id` FOREIGN KEY (`section_id`) REFERENCES `sections` (`section_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='More data about sections, including localized properties like section titles.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `section_settings`
--

LOCK TABLES `section_settings` WRITE;
/*!40000 ALTER TABLE `section_settings` DISABLE KEYS */;
INSERT INTO `section_settings` VALUES
(1,1,'en','title','Articles'),
(2,1,'en','abbrev','ART'),
(3,1,'en','policy','<p>Section default policy</p>'),
(4,1,'fr_CA','title',''),
(5,1,'fr_CA','abbrev',''),
(6,1,'en','identifyType',''),
(7,1,'fr_CA','identifyType',''),
(8,1,'fr_CA','policy',''),
(9,2,'en','title','Reviews'),
(10,2,'fr_CA','title',''),
(11,2,'en','abbrev','REV'),
(12,2,'fr_CA','abbrev',''),
(13,2,'en','identifyType','Review Article'),
(14,2,'fr_CA','identifyType',''),
(15,2,'en','policy',''),
(16,2,'fr_CA','policy','');
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
  `seq` double NOT NULL DEFAULT 0,
  `editor_restricted` smallint(6) NOT NULL DEFAULT 0,
  `meta_indexed` smallint(6) NOT NULL DEFAULT 0,
  `meta_reviewed` smallint(6) NOT NULL DEFAULT 1,
  `abstracts_not_required` smallint(6) NOT NULL DEFAULT 0,
  `hide_title` smallint(6) NOT NULL DEFAULT 0,
  `hide_author` smallint(6) NOT NULL DEFAULT 0,
  `is_inactive` smallint(6) NOT NULL DEFAULT 0,
  `abstract_word_count` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`section_id`),
  KEY `sections_journal_id` (`journal_id`),
  KEY `sections_review_form_id` (`review_form_id`),
  CONSTRAINT `sections_journal_id` FOREIGN KEY (`journal_id`) REFERENCES `journals` (`journal_id`) ON DELETE CASCADE,
  CONSTRAINT `sections_review_form_id` FOREIGN KEY (`review_form_id`) REFERENCES `review_forms` (`review_form_id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='A list of all sections into which submissions can be organized, forming the table of contents.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sections`
--

LOCK TABLES `sections` WRITE;
/*!40000 ALTER TABLE `sections` DISABLE KEYS */;
INSERT INTO `sections` VALUES
(1,1,NULL,0,0,1,1,0,0,0,0,500),
(2,1,NULL,1,0,1,1,1,0,0,0,0);
/*!40000 ALTER TABLE `sections` ENABLE KEYS */;
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
('0Jm6iwPJfhWhzJuUFHa34mlHXq0AKlNFawYjD15b',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/131.0.0.0 Safari/537.36',1735276692,'YTo1OntzOjY6Il90b2tlbiI7czo0MDoiSmJ3NTNDYWFCR21wRGl3VXk0OWc5ZlpTMXVQWlRPMmF5RlJZMzdOdSI7czo4OiJ1c2VybmFtZSI7czo1OiJhZG1pbiI7czo1OiJlbWFpbCI7czoyMzoicGtwYWRtaW5AbWFpbGluYXRvci5jb20iO3M6NTA6ImxvZ2luX3dlYl9jMWEyNmJjMDAyNDlkYzYyMWYwM2M0MTc3OGQ1NWZlMzMxZTdlOTEyIjtOO3M6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0='),
('0XFSOZ93JjBLBZmUoNDgosWxRPTy0HS0G5fOyXdu',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/131.0.0.0 Safari/537.36',1735276872,'YTo1OntzOjY6Il90b2tlbiI7czo0MDoieDM1OGhhOU5BSjdCR0p1WW1URDY3T3MyT2JweHdyV2l4Q2ZidDFiciI7czo4OiJ1c2VybmFtZSI7czo1OiJhZG1pbiI7czo1OiJlbWFpbCI7czoyMzoicGtwYWRtaW5AbWFpbGluYXRvci5jb20iO3M6NTA6ImxvZ2luX3dlYl9jMWEyNmJjMDAyNDlkYzYyMWYwM2M0MTc3OGQ1NWZlMzMxZTdlOTEyIjtOO3M6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0='),
('1w0mj93mfpvq16196cQ1J6i9EuhyHYkzrqQLYto3',23,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/131.0.0.0 Safari/537.36',1735277488,'YTo4OntzOjY6Il90b2tlbiI7czo0MDoiNUhoS215ZVZwRktwUGJWenhxanNla3FZeWU2SGp1Wk5TRW5BbzYzOSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czoxMzoiY3VycmVudExvY2FsZSI7czoyOiJlbiI7czo4OiJ1c2VybmFtZSI7czo5OiJkc29rb2xvZmYiO3M6NTA6ImxvZ2luX3dlYl9jMWEyNmJjMDAyNDlkYzYyMWYwM2M0MTc3OGQ1NWZlMzMxZTdlOTEyIjtpOjIzO3M6NjoidXNlcklkIjtpOjIzO3M6NToiZW1haWwiO3M6MjQ6ImRzb2tvbG9mZkBtYWlsaW5hdG9yLmNvbSI7czoxNzoicGFzc3dvcmRfaGFzaF93ZWIiO3M6NjA6IiQyeSQxMCRKTU1HejVXWEM5MFFMNkEzNnBxRjQuQ2Q2S24zRjRUTDN3LmFYWWtkcThPNU9vSnJCZmxuTyI7fQ=='),
('3ivHBHOUEmrXwrNWoTRJn38yXTvbYiCVj9azyM1N',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/131.0.0.0 Safari/537.36',1735277356,'YTo1OntzOjY6Il90b2tlbiI7czo0MDoiOXVGbU81VVNWdUVGRmUwOVJIbVIxMnk3MGE3OHBrNGlMTEpBU1JIaiI7czo4OiJ1c2VybmFtZSI7czo2OiJtaW5vdWUiO3M6NToiZW1haWwiO3M6MjE6Im1pbm91ZUBtYWlsaW5hdG9yLmNvbSI7czo1MDoibG9naW5fd2ViX2MxYTI2YmMwMDI0OWRjNjIxZjAzYzQxNzc4ZDU1ZmUzMzFlN2U5MTIiO047czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ=='),
('3SzaOYAozbF5VpeLBKt6PNSRWLIqXGWNXeMU5HHO',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/131.0.0.0 Safari/537.36',1735277478,'YTo3OntzOjY6Il90b2tlbiI7czo0MDoiZjBpRVBNa21XWHJHclVtM2gwOGNhRHM4ZFBzV0xsT1FUY0llNWpJciI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo1MDoibG9naW5fd2ViX2MxYTI2YmMwMDI0OWRjNjIxZjAzYzQxNzc4ZDU1ZmUzMzFlN2U5MTIiO2k6MztzOjY6InVzZXJJZCI7aTozO3M6ODoidXNlcm5hbWUiO3M6NzoiZGJhcm5lcyI7czo1OiJlbWFpbCI7czoyMjoiZGJhcm5lc0BtYWlsaW5hdG9yLmNvbSI7czoxNzoicGFzc3dvcmRfaGFzaF93ZWIiO3M6NjA6IiQyeSQxMCR0ZHIxNE9GczBWc0s2NDBiaFNRaWZPU0E5U1VrSFVGUEdSLnpsYVdiclJzNXFjT2JNNHNnMiI7fQ=='),
('3UJadO5bTCGTfY2iAcmWrvTtYuMFWUeLnDONiSdb',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/131.0.0.0 Safari/537.36',1735277250,'YTo1OntzOjY6Il90b2tlbiI7czo0MDoiZTFzbUxEWUZpZmJvOGdJSHVsSTFoNmJZeFFBNWFqVWsyOHJRd1E0WCI7czo4OiJ1c2VybmFtZSI7czo3OiJkYmFybmVzIjtzOjU6ImVtYWlsIjtzOjIyOiJkYmFybmVzQG1haWxpbmF0b3IuY29tIjtzOjUwOiJsb2dpbl93ZWJfYzFhMjZiYzAwMjQ5ZGM2MjFmMDNjNDE3NzhkNTVmZTMzMWU3ZTkxMiI7TjtzOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19'),
('3uNUoyuc9cGgdtSr65Fvgvr4E3RcwTptWIXOqQbp',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/131.0.0.0 Safari/537.36',1735277439,'YTo3OntzOjY6Il90b2tlbiI7czo0MDoiSVpRV1IwcjJDc3hMQm5vMkhxdzNiUlM5Z000Vm1aQlJGeXlaUmRiaiI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo1MDoibG9naW5fd2ViX2MxYTI2YmMwMDI0OWRjNjIxZjAzYzQxNzc4ZDU1ZmUzMzFlN2U5MTIiO2k6MztzOjY6InVzZXJJZCI7aTozO3M6ODoidXNlcm5hbWUiO3M6NzoiZGJhcm5lcyI7czo1OiJlbWFpbCI7czoyMjoiZGJhcm5lc0BtYWlsaW5hdG9yLmNvbSI7czoxNzoicGFzc3dvcmRfaGFzaF93ZWIiO3M6NjA6IiQyeSQxMCRHdUw5SlFBck4wYU14RXJwM2NPYkplNmN5UmhrUG9mV0U1dnRVUVgxWTF3MEhKUUtCMlR4MiI7fQ=='),
('4aiRetHmpngDBu2LDAnagV9mXvEypQX58yKbDuqx',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/131.0.0.0 Safari/537.36',1735277682,'YTo1OntzOjY6Il90b2tlbiI7czo0MDoibHRSMUZWZ3Bxb0hSWnZzN09GbU1LVkFqeU1aZDhMRGxXTXk5SFRhbCI7czo4OiJ1c2VybmFtZSI7czo3OiJhbWNjcmFlIjtzOjU6ImVtYWlsIjtzOjIyOiJhbWNjcmFlQG1haWxpbmF0b3IuY29tIjtzOjUwOiJsb2dpbl93ZWJfYzFhMjZiYzAwMjQ5ZGM2MjFmMDNjNDE3NzhkNTVmZTMzMWU3ZTkxMiI7TjtzOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19'),
('5nu21xOheFgkPF7B3hLPz9U1lHH6QFPrRBWAEchM',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/131.0.0.0 Safari/537.36',1735276718,'YTo1OntzOjY6Il90b2tlbiI7czo0MDoiRG0yWmhpZUxERzdyTWlEV3IxVWNhVEtCTURLdkF3ZzdYMmc0dEoxUiI7czo4OiJ1c2VybmFtZSI7czo1OiJhZG1pbiI7czo1OiJlbWFpbCI7czoyMzoicGtwYWRtaW5AbWFpbGluYXRvci5jb20iO3M6NTA6ImxvZ2luX3dlYl9jMWEyNmJjMDAyNDlkYzYyMWYwM2M0MTc3OGQ1NWZlMzMxZTdlOTEyIjtOO3M6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0='),
('66ZErrtGqTJ1mN4LhO40z35jGtxYMcxyZP21Ev33',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/131.0.0.0 Safari/537.36',1735277565,'YTo3OntzOjY6Il90b2tlbiI7czo0MDoibzVCb0VacnpwSnlybGFJdm1xVXljcERyMXhxblNFVEVnYm11TlVYTCI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo1MDoibG9naW5fd2ViX2MxYTI2YmMwMDI0OWRjNjIxZjAzYzQxNzc4ZDU1ZmUzMzFlN2U5MTIiO2k6MztzOjY6InVzZXJJZCI7aTozO3M6ODoidXNlcm5hbWUiO3M6NzoiZGJhcm5lcyI7czo1OiJlbWFpbCI7czoyMjoiZGJhcm5lc0BtYWlsaW5hdG9yLmNvbSI7czoxNzoicGFzc3dvcmRfaGFzaF93ZWIiO3M6NjA6IiQyeSQxMCQ0bGJuSnlkZUpVeHhKUHdmU3Jlc0suVEx0OWlkYU9UN3hnYzRkbGpML0ZSTXZuWlRhZjZBSyI7fQ=='),
('6Uvi1BhI21TaLo3XqM01vihw6zHAZV9F7805DOQe',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/131.0.0.0 Safari/537.36',1735277605,'YTo1OntzOjY6Il90b2tlbiI7czo0MDoibW96enRUZ2Z4ZzdKa00zMDc0cGhnVkRZN2E2T2VBRTFxMDMyaEl1YyI7czo4OiJ1c2VybmFtZSI7czo4OiJhZ2FsbGVnbyI7czo1OiJlbWFpbCI7czoyMzoiYWdhbGxlZ29AbWFpbGluYXRvci5jb20iO3M6NTA6ImxvZ2luX3dlYl9jMWEyNmJjMDAyNDlkYzYyMWYwM2M0MTc3OGQ1NWZlMzMxZTdlOTEyIjtOO3M6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0='),
('6XLtWm4fPmuFL9LIk7Qc0t7fiWmjn45tNQy67OAt',1,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/131.0.0.0 Safari/537.36',1735276557,'YTo3OntzOjY6Il90b2tlbiI7czo0MDoiT2U3NjJMdWRDZDBWSVlJTzI4alNRZXFhMHM5ckVSU1dGSmlveXA5MSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo1MDoibG9naW5fd2ViX2MxYTI2YmMwMDI0OWRjNjIxZjAzYzQxNzc4ZDU1ZmUzMzFlN2U5MTIiO2k6MTtzOjY6InVzZXJJZCI7aToxO3M6ODoidXNlcm5hbWUiO3M6NToiYWRtaW4iO3M6NToiZW1haWwiO3M6MjM6InBrcGFkbWluQG1haWxpbmF0b3IuY29tIjtzOjE3OiJwYXNzd29yZF9oYXNoX3dlYiI7czo2MDoiJDJ5JDEwJGVkajhlZVovRGUyUmRVRHNtdlkuQS44OW1oTUo4V0p2SGNKQXVkbDBtWk9saDM1ZmxhOEx5Ijt9'),
('7blgvtA7PlKnQUNV6a9VwNeDUmOiPsFMJgkzPMIl',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/131.0.0.0 Safari/537.36',1735276820,'YTozOntzOjY6Il90b2tlbiI7czo0MDoiQk1UcEJ4Qnd4UGVYbzhDYlJFMmhvRnUxRmZITUs0dVYwY1M0N2dVYSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czoxMzoiY3VycmVudExvY2FsZSI7czoyOiJlbiI7fQ=='),
('7MN8iuLf6Mh8Bu7xuIMTnhNugzowo49ixDnRUY9M',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/131.0.0.0 Safari/537.36',1735276745,'YTo1OntzOjY6Il90b2tlbiI7czo0MDoiZW9XSVdKYWxVWTJ5NlJnRVcwZElwdldHOW9rSEV0R1dEMVlzZXY4ZiI7czo4OiJ1c2VybmFtZSI7czo1OiJhZG1pbiI7czo1OiJlbWFpbCI7czoyMzoicGtwYWRtaW5AbWFpbGluYXRvci5jb20iO3M6NTA6ImxvZ2luX3dlYl9jMWEyNmJjMDAyNDlkYzYyMWYwM2M0MTc3OGQ1NWZlMzMxZTdlOTEyIjtOO3M6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0='),
('7ncTNkBwztEH6oc3QzyqGX0SdKNrGxrHgmJ05XUa',1,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/131.0.0.0 Safari/537.36',1735276549,'YTo3OntzOjY6Il90b2tlbiI7czo0MDoic09TUEJVa0ZXZXlZVEphYWFqMzFOTG5ZMldZb1NMVktFM1huV2hjbyI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo1MDoibG9naW5fd2ViX2MxYTI2YmMwMDI0OWRjNjIxZjAzYzQxNzc4ZDU1ZmUzMzFlN2U5MTIiO2k6MTtzOjY6InVzZXJJZCI7aToxO3M6ODoidXNlcm5hbWUiO3M6NToiYWRtaW4iO3M6NToiZW1haWwiO3M6MjM6InBrcGFkbWluQG1haWxpbmF0b3IuY29tIjtzOjE3OiJwYXNzd29yZF9oYXNoX3dlYiI7czo2MDoiJDJ5JDEwJFF0VXRWUnhDVnk3OXBmNHZjbmtYNS5oREF2V3NpY2pIZlJnUzhOWmp0Q3J4ckFucEs0djEyIjt9'),
('7w75OUVHa10T9QjmppByuQZyq1To2vb6peCnetYN',17,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/131.0.0.0 Safari/537.36',1735277112,'YTo4OntzOjY6Il90b2tlbiI7czo0MDoiMVBmaThUYnJpWGw5c3ozOU52alRuTTZTVW0yQVZ1c0gyWWJ4VjlnWSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czoxMzoiY3VycmVudExvY2FsZSI7czoyOiJlbiI7czo4OiJ1c2VybmFtZSI7czoxMDoiYW13YW5kZW5nYSI7czo1MDoibG9naW5fd2ViX2MxYTI2YmMwMDI0OWRjNjIxZjAzYzQxNzc4ZDU1ZmUzMzFlN2U5MTIiO2k6MTc7czo2OiJ1c2VySWQiO2k6MTc7czo1OiJlbWFpbCI7czoyNToiYW13YW5kZW5nYUBtYWlsaW5hdG9yLmNvbSI7czoxNzoicGFzc3dvcmRfaGFzaF93ZWIiO3M6NjA6IiQyeSQxMCR0ZkdITkVMcUplMmJDSWllenVvZkVPZmFTN0x5Ym5GYTh2cW1LSGxMMUVuVUFyU2dSVEcxVyI7fQ=='),
('96dV1aemOKuN7fUkVDSmA9aNKO3tyz4LzV4ek0c7',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/131.0.0.0 Safari/537.36',1735276758,'YTozOntzOjY6Il90b2tlbiI7czo0MDoiRkF4eWpZa2tlMW1LcjZGQ0pNT0gwSFhjdjNUdU1CaGdNSVBoWklJdCI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czoxMzoiY3VycmVudExvY2FsZSI7czoyOiJlbiI7fQ=='),
('9FjlHDy50Ix1hw6MUTOAnEXRchT3kIWRbLhVN76v',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/131.0.0.0 Safari/537.36',1735277013,'YTozOntzOjY6Il90b2tlbiI7czo0MDoiRUNUbnpKYTBDcmtxdG1kWjVhWjF1bnJLMU1JMlJMZFRpaGk1QmI5bCI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czoxMzoiY3VycmVudExvY2FsZSI7czoyOiJlbiI7fQ=='),
('9GvExFZ3jEbMuQBneKT92cTrspEc9H9UeFT5XBF3',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/131.0.0.0 Safari/537.36',1735276582,'YTo1OntzOjY6Il90b2tlbiI7czo0MDoiSUJXazJMVXRGM2ZHd2o0a2ozQ0JYMlRvTTZHVGpOQ2RvWlRxWGh6byI7czo4OiJ1c2VybmFtZSI7czo1OiJhZG1pbiI7czo1OiJlbWFpbCI7czoyMzoicGtwYWRtaW5AbWFpbGluYXRvci5jb20iO3M6NTA6ImxvZ2luX3dlYl9jMWEyNmJjMDAyNDlkYzYyMWYwM2M0MTc3OGQ1NWZlMzMxZTdlOTEyIjtOO3M6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0='),
('9YvBlmVhvB4vM3wlYzgvkMSUPmo6QHX4xYAD9Q2O',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/131.0.0.0 Safari/537.36',1735277859,'YTo4OntzOjY6Il90b2tlbiI7czo0MDoiSWxFRVFuampNYmJISUtPdUNOY1psc1BBUjlJbGlicEZac1pxWkJpTSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo1MDoibG9naW5fd2ViX2MxYTI2YmMwMDI0OWRjNjIxZjAzYzQxNzc4ZDU1ZmUzMzFlN2U5MTIiO2k6MztzOjY6InVzZXJJZCI7aTozO3M6ODoidXNlcm5hbWUiO3M6NzoiZGJhcm5lcyI7czo1OiJlbWFpbCI7czoyMjoiZGJhcm5lc0BtYWlsaW5hdG9yLmNvbSI7czoxNzoicGFzc3dvcmRfaGFzaF93ZWIiO3M6NjA6IiQyeSQxMCQyYVJOTzBSWVV0UXlTRFIyZHp5eVR1cjF3djNNaU9wY01HUUZlTkF5NEliaEt6V0hkOWRSRyI7czoxMzoiY3VycmVudExvY2FsZSI7czoyOiJlbiI7fQ=='),
('A0gYrNhdjf0BpTKCH9S1C1UbNP6lYPRNdh2Q92ZK',32,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/131.0.0.0 Safari/537.36',1735277768,'YTo4OntzOjY6Il90b2tlbiI7czo0MDoiTlh0OThnREM5ZlFHZWd5M3U0RFFvSkV1emd4Vk1Lc3RCSlF6T0NIYSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czoxMzoiY3VycmVudExvY2FsZSI7czoyOiJlbiI7czo4OiJ1c2VybmFtZSI7czo2OiJycm9zc2kiO3M6NTA6ImxvZ2luX3dlYl9jMWEyNmJjMDAyNDlkYzYyMWYwM2M0MTc3OGQ1NWZlMzMxZTdlOTEyIjtpOjMyO3M6NjoidXNlcklkIjtpOjMyO3M6NToiZW1haWwiO3M6MjE6InJyb3NzaUBtYWlsaW5hdG9yLmNvbSI7czoxNzoicGFzc3dvcmRfaGFzaF93ZWIiO3M6NjA6IiQyeSQxMCRlaWxsakh6blBVSXdWRGZQUVNsT3p1M0FLeDhucDVpd3RhUW8xVjZ1TzBqSVJLR3RBTEZqSyI7fQ=='),
('AtuPrmqOpEjKOG2lu2YDb42Q4qUW1DpFR6rJZE0I',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/131.0.0.0 Safari/537.36',1735277690,'YTo1OntzOjY6Il90b2tlbiI7czo0MDoicVI1TDUwUW4wMUtDaGJRUG5XbnpyWnMyRmZzZjZlWjRxU2tnODVnMSI7czo4OiJ1c2VybmFtZSI7czo4OiJhZ2FsbGVnbyI7czo1OiJlbWFpbCI7czoyMzoiYWdhbGxlZ29AbWFpbGluYXRvci5jb20iO3M6NTA6ImxvZ2luX3dlYl9jMWEyNmJjMDAyNDlkYzYyMWYwM2M0MTc3OGQ1NWZlMzMxZTdlOTEyIjtOO3M6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0='),
('b8wv6BjsjT1qk4BUu37s6gIyYLFtFNqfSsRWgYZN',1,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/131.0.0.0 Safari/537.36',1735276534,'YTo3OntzOjY6Il90b2tlbiI7czo0MDoibHFaZnZJNVNSN2E1cWw3ZVRhUkZBWTRuS0lrUnN5S2xSbHo4ZmtFdiI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo1MDoibG9naW5fd2ViX2MxYTI2YmMwMDI0OWRjNjIxZjAzYzQxNzc4ZDU1ZmUzMzFlN2U5MTIiO2k6MTtzOjY6InVzZXJJZCI7aToxO3M6ODoidXNlcm5hbWUiO3M6NToiYWRtaW4iO3M6NToiZW1haWwiO3M6MjM6InBrcGFkbWluQG1haWxpbmF0b3IuY29tIjtzOjE3OiJwYXNzd29yZF9oYXNoX3dlYiI7czo2MDoiJDJ5JDEwJHZoVll1bE12RlU4TDJ3TFVCYTBCd3VMRTNXZVlxWTB2Sy45UmhLZE5POThhSWVJSzZEVC5hIjt9'),
('cMIXxiQC3MIMkQvdQIq1xy6gaglfGm9PqihK4myL',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/131.0.0.0 Safari/537.36',1735276668,'YTo1OntzOjY6Il90b2tlbiI7czo0MDoic3NZMGhoOG5JS2hJcDlMUTFmbnREaFByNkpxZERxNm81UTZNZVlpcyI7czo4OiJ1c2VybmFtZSI7czo1OiJhZG1pbiI7czo1OiJlbWFpbCI7czoyMzoicGtwYWRtaW5AbWFpbGluYXRvci5jb20iO3M6NTA6ImxvZ2luX3dlYl9jMWEyNmJjMDAyNDlkYzYyMWYwM2M0MTc3OGQ1NWZlMzMxZTdlOTEyIjtOO3M6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0='),
('DyNpDmJeJ9yGdZtTPZx5HDgqb7oUtbSp2pUU5sBL',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/131.0.0.0 Safari/537.36',1735276703,'YTozOntzOjY6Il90b2tlbiI7czo0MDoiM3o4Wm5mbUp3MGcxbVQ5R3d3dlJiRXhWdlhIdDBmREFFZjFndGkzbyI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czoxMzoiY3VycmVudExvY2FsZSI7czoyOiJlbiI7fQ=='),
('e9ALpC758jKaLg5RvJmG6UtUfmYwNclAfVne22vT',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/131.0.0.0 Safari/537.36',1735277388,'YTo3OntzOjY6Il90b2tlbiI7czo0MDoid3ptZTA2TEl3TUZRY2ZHRmViaHp4b2NLVmVqSVR1aklRQktXT00zdCI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo1MDoibG9naW5fd2ViX2MxYTI2YmMwMDI0OWRjNjIxZjAzYzQxNzc4ZDU1ZmUzMzFlN2U5MTIiO2k6MztzOjY6InVzZXJJZCI7aTozO3M6ODoidXNlcm5hbWUiO3M6NzoiZGJhcm5lcyI7czo1OiJlbWFpbCI7czoyMjoiZGJhcm5lc0BtYWlsaW5hdG9yLmNvbSI7czoxNzoicGFzc3dvcmRfaGFzaF93ZWIiO3M6NjA6IiQyeSQxMCRNbE9oL3NxUHY2Q1pYWEhabXk1RzVlYm9WQXNCTXEyNzY5eHB6bU0uTHFmeVhhZUdLOUtFaSI7fQ=='),
('esNZRXdcjfjiPMyGjhDwZC9NMdi11yCArKrzndur',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/131.0.0.0 Safari/537.36',1735277273,'YTo4OntzOjY6Il90b2tlbiI7czo0MDoiVVhSRWN4UkFKYVk3WlhVQndVV3J2REpuczh2dWd5c2V5SEEyWDlBdSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czoxMzoiY3VycmVudExvY2FsZSI7czoyOiJlbiI7czo1MDoibG9naW5fd2ViX2MxYTI2YmMwMDI0OWRjNjIxZjAzYzQxNzc4ZDU1ZmUzMzFlN2U5MTIiO2k6MztzOjY6InVzZXJJZCI7aTozO3M6ODoidXNlcm5hbWUiO3M6NzoiZGJhcm5lcyI7czo1OiJlbWFpbCI7czoyMjoiZGJhcm5lc0BtYWlsaW5hdG9yLmNvbSI7czoxNzoicGFzc3dvcmRfaGFzaF93ZWIiO3M6NjA6IiQyeSQxMCRIeGVqSTRLTnF2V1VPcWtVRldzUURPRzFuMXFmN0wuMG1uU0xxQ21EZkhGdmRCbFJNeEFLZSI7fQ=='),
('fKbHPSAEzGBuPlgHzRTPTCy818cEEUPpkDebFkge',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/131.0.0.0 Safari/537.36',1735277666,'YTo1OntzOjY6Il90b2tlbiI7czo0MDoiTGFZREhKU3JzU3JYZ3k3a2tUNzVUTUdvM0hmdXVFZTNhMUYycHk2RSI7czo4OiJ1c2VybmFtZSI7czo3OiJkYmFybmVzIjtzOjU6ImVtYWlsIjtzOjIyOiJkYmFybmVzQG1haWxpbmF0b3IuY29tIjtzOjUwOiJsb2dpbl93ZWJfYzFhMjZiYzAwMjQ5ZGM2MjFmMDNjNDE3NzhkNTVmZTMzMWU3ZTkxMiI7TjtzOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19'),
('flkFDFjhf6M4Ecpx80HvjzpiJOBVA68uaczSA6lF',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/131.0.0.0 Safari/537.36',1735277894,'YTo3OntzOjY6Il90b2tlbiI7czo0MDoieHlaemJ2aENVNzFiWkNVZlFiTmZrTUx5ajdXcGJzMXo0Sk55U1hkcyI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo1MDoibG9naW5fd2ViX2MxYTI2YmMwMDI0OWRjNjIxZjAzYzQxNzc4ZDU1ZmUzMzFlN2U5MTIiO2k6MztzOjY6InVzZXJJZCI7aTozO3M6ODoidXNlcm5hbWUiO3M6NzoiZGJhcm5lcyI7czo1OiJlbWFpbCI7czoyMjoiZGJhcm5lc0BtYWlsaW5hdG9yLmNvbSI7czoxNzoicGFzc3dvcmRfaGFzaF93ZWIiO3M6NjA6IiQyeSQxMCRKWUJLYlB3NTdnWXQwcnZjRmVmeGkubGhBWElGZFdlMTFIRTl3NVJ6bVVoVlA2OWZkZkV0NiI7fQ=='),
('fOzgNycqw1bgWSDpLsHceGlEqS7AEKWOuvObQfMa',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/131.0.0.0 Safari/537.36',1735276729,'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZVlSOWRTcUJjQmlrU0xqSzhYaHcyVmlmN05Ga0tSVVVYWUdXR1JIMiI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czoxMzoiY3VycmVudExvY2FsZSI7czoyOiJlbiI7fQ=='),
('FpmgZHEdEpriU3H1vla3HNoBDgjM9EE6L5nuB2jd',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/131.0.0.0 Safari/537.36',1735277597,'YTo1OntzOjY6Il90b2tlbiI7czo0MDoiWnJFQjR1T1J3eGladzhSVXpJVVB2bGhhNlhsWGYwYUpOWWxPSEtGbiI7czo4OiJ1c2VybmFtZSI7czo3OiJhbWNjcmFlIjtzOjU6ImVtYWlsIjtzOjIyOiJhbWNjcmFlQG1haWxpbmF0b3IuY29tIjtzOjUwOiJsb2dpbl93ZWJfYzFhMjZiYzAwMjQ5ZGM2MjFmMDNjNDE3NzhkNTVmZTMzMWU3ZTkxMiI7TjtzOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19'),
('g2dB6rjytB1w0DkXpX0QIh4hB7tpLx2qkcD3zYg5',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/131.0.0.0 Safari/537.36',1735277758,'YTo3OntzOjY6Il90b2tlbiI7czo0MDoiTm10cWxFS2xUUDd0dEJKOXJ6VWl2TGRtVnViZDR3MXV0aTJ1Z3BkTyI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo1MDoibG9naW5fd2ViX2MxYTI2YmMwMDI0OWRjNjIxZjAzYzQxNzc4ZDU1ZmUzMzFlN2U5MTIiO2k6MztzOjY6InVzZXJJZCI7aTozO3M6ODoidXNlcm5hbWUiO3M6NzoiZGJhcm5lcyI7czo1OiJlbWFpbCI7czoyMjoiZGJhcm5lc0BtYWlsaW5hdG9yLmNvbSI7czoxNzoicGFzc3dvcmRfaGFzaF93ZWIiO3M6NjA6IiQyeSQxMCROcUVGNE9QTHp3TVd4TldVNjlxSGZPSjdZNE4vREllSWFvV24uNlRXSjNDbzQ5b1ZaSW9PTyI7fQ=='),
('gD33weQl31iLJgscX22z3WZe8rJH1sMyxxq9SHaN',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/131.0.0.0 Safari/537.36',1735277589,'YTo1OntzOjY6Il90b2tlbiI7czo0MDoiVjZYczFGVEhOR25DTGt3WHBRVGI0R0ZjQWQ4MHV2VUdDcWtHTldOVSI7czo4OiJ1c2VybmFtZSI7czo3OiJkYmFybmVzIjtzOjU6ImVtYWlsIjtzOjIyOiJkYmFybmVzQG1haWxpbmF0b3IuY29tIjtzOjUwOiJsb2dpbl93ZWJfYzFhMjZiYzAwMjQ5ZGM2MjFmMDNjNDE3NzhkNTVmZTMzMWU3ZTkxMiI7TjtzOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19'),
('GGENFhtArQdmnRwpmeLnmcBw2S4LxesruvL0Tash',28,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/131.0.0.0 Safari/537.36',1735277624,'YTo4OntzOjY6Il90b2tlbiI7czo0MDoiQ05uS2NpTzlvU3dHMmxKNkNNTzRFSXhLS1c4Vk81dzhndUx0N1VDVCI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czoxMzoiY3VycmVudExvY2FsZSI7czoyOiJlbiI7czo4OiJ1c2VybmFtZSI7czoxMjoibGNocmlzdG9waGVyIjtzOjUwOiJsb2dpbl93ZWJfYzFhMjZiYzAwMjQ5ZGM2MjFmMDNjNDE3NzhkNTVmZTMzMWU3ZTkxMiI7aToyODtzOjY6InVzZXJJZCI7aToyODtzOjU6ImVtYWlsIjtzOjI3OiJsY2hyaXN0b3BoZXJAbWFpbGluYXRvci5jb20iO3M6MTc6InBhc3N3b3JkX2hhc2hfd2ViIjtzOjYwOiIkMnkkMTAkRWl1NHp2TVdsRnBCZ053cHJoMm9EdXNONmpDaW03b3gvUmo5dmM2YW5NVU5WY2N3dEZlNi4iO30='),
('GOkiPJ5bpg8sx21oQPtNLB8EPpByHhddVkRbGLzJ',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/131.0.0.0 Safari/537.36',1735277705,'YTo3OntzOjY6Il90b2tlbiI7czo0MDoicWREOUoxR2ZrcmkwZjZqYjFrTVlvQUZxNmdycTlORVBmWnVQWUtkViI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo1MDoibG9naW5fd2ViX2MxYTI2YmMwMDI0OWRjNjIxZjAzYzQxNzc4ZDU1ZmUzMzFlN2U5MTIiO2k6MztzOjY6InVzZXJJZCI7aTozO3M6ODoidXNlcm5hbWUiO3M6NzoiZGJhcm5lcyI7czo1OiJlbWFpbCI7czoyMjoiZGJhcm5lc0BtYWlsaW5hdG9yLmNvbSI7czoxNzoicGFzc3dvcmRfaGFzaF93ZWIiO3M6NjA6IiQyeSQxMCRibnRITkpPT0hrdi9PbHB1QUd0SmlPLnpJTEJXL0txZmIwbjdBbEdrUGtXc3NPS0d3d2dwRyI7fQ=='),
('gsDLVemvKNpCt7zYJWdbGZe3zSd3cM3LfYaY2Eba',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/131.0.0.0 Safari/537.36',1735276513,'YToyOntzOjY6Il90b2tlbiI7czo0MDoiMW10U1p2Z3l1Rk5meVZpR0U5b29Jb3NSbDhoTTBBM3phNUVpZWJaNiI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ=='),
('gvX1CqgtkgfqzJ4OXDhvGFrqlC6w8vecWU0KxkWi',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/131.0.0.0 Safari/537.36',1735277012,'YTozOntzOjY6Il90b2tlbiI7czo0MDoiWVFUZkwyUEg0OXppVHk3M1FxNDZzYlc5SFVlRDRTeTNlRG82VUlBUSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czoxMzoiY3VycmVudExvY2FsZSI7czoyOiJlbiI7fQ=='),
('H1R92qJvBFn9GPSptwprTVaQ9UWoi7pqxashSgy2',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/131.0.0.0 Safari/537.36',1735276645,'YTo1OntzOjY6Il90b2tlbiI7czo0MDoiNTlGNlg0SXQ2bTB6TXQyb1FXZWJocXZHYVlXNUhsZjBidHhnSFdUdyI7czo4OiJ1c2VybmFtZSI7czo1OiJhZG1pbiI7czo1OiJlbWFpbCI7czoyMzoicGtwYWRtaW5AbWFpbGluYXRvci5jb20iO3M6NTA6ImxvZ2luX3dlYl9jMWEyNmJjMDAyNDlkYzYyMWYwM2M0MTc3OGQ1NWZlMzMxZTdlOTEyIjtOO3M6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0='),
('IFDXy6wLBpWVbD7PRUuS0ivF5SRrWYWF9V3WAEV2',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/131.0.0.0 Safari/537.36',1735277264,'YTo4OntzOjY6Il90b2tlbiI7czo0MDoiT1BXdWx4Z0VJTGFDU3VNN2R3Yk9uUDZOZ3JBMWlmVXFXUmZxOHNWTSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo1MDoibG9naW5fd2ViX2MxYTI2YmMwMDI0OWRjNjIxZjAzYzQxNzc4ZDU1ZmUzMzFlN2U5MTIiO2k6MztzOjY6InVzZXJJZCI7aTozO3M6ODoidXNlcm5hbWUiO3M6NzoiZGJhcm5lcyI7czo1OiJlbWFpbCI7czoyMjoiZGJhcm5lc0BtYWlsaW5hdG9yLmNvbSI7czoxNzoicGFzc3dvcmRfaGFzaF93ZWIiO3M6NjA6IiQyeSQxMCQubXZKbVVYcWE4RUx4UDlsaDNtT3NPWjlFQ3BQNFFkYUlvYzhMWlI2RTh0anZ3Tjh6MUcybSI7czoxMzoiY3VycmVudExvY2FsZSI7czoyOiJlbiI7fQ=='),
('Ii25DVzWbueX71A6TM1HpuWTwKPk9ZFTrVGbm5Qp',31,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/131.0.0.0 Safari/537.36',1735277724,'YTo4OntzOjY6Il90b2tlbiI7czo0MDoiM0hIdkkyWGJtVU9QZURjdmlnUXFoMkZqVVBBNGRtMUpPNHRUMUQ1YiI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czoxMzoiY3VycmVudExvY2FsZSI7czoyOiJlbiI7czo4OiJ1c2VybmFtZSI7czo4OiJyYmFpeWV3dSI7czo1MDoibG9naW5fd2ViX2MxYTI2YmMwMDI0OWRjNjIxZjAzYzQxNzc4ZDU1ZmUzMzFlN2U5MTIiO2k6MzE7czo2OiJ1c2VySWQiO2k6MzE7czo1OiJlbWFpbCI7czoyMzoicmJhaXlld3VAbWFpbGluYXRvci5jb20iO3M6MTc6InBhc3N3b3JkX2hhc2hfd2ViIjtzOjYwOiIkMnkkMTAkdmV4WXFJdTR5ZkJhempOZ01oaFl1ZXBDYS8veGIxcy44WkxQb3RwZDlZODRzQnRjL2xqSlMiO30='),
('iI6D5wvQdh67gEsga3r0L5gPXtOpGWLIbVNxANsQ',26,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/131.0.0.0 Safari/537.36',1735277575,'YTo4OntzOjY6Il90b2tlbiI7czo0MDoiOGs2U29lcEFBME5vM0J3RjBsbUdScVcxdGxoNWNvd0FIa0U0TFFHZSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czoxMzoiY3VycmVudExvY2FsZSI7czoyOiJlbiI7czo4OiJ1c2VybmFtZSI7czo2OiJqbm92YWsiO3M6NTA6ImxvZ2luX3dlYl9jMWEyNmJjMDAyNDlkYzYyMWYwM2M0MTc3OGQ1NWZlMzMxZTdlOTEyIjtpOjI2O3M6NjoidXNlcklkIjtpOjI2O3M6NToiZW1haWwiO3M6MjE6Impub3Zha0BtYWlsaW5hdG9yLmNvbSI7czoxNzoicGFzc3dvcmRfaGFzaF93ZWIiO3M6NjA6IiQyeSQxMCRVMEdnTDlUYmprSzQwS0ZPMkdYS3RPSkp4akZFdDl0Z2xNbXVFYnAzY2U3a1A3dmZoeC9KSyI7fQ=='),
('iqThZVPeYNDMHSl6csyuIqWKh3Dt4WzHYiRcW4Pl',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/131.0.0.0 Safari/537.36',1735277504,'YTo1OntzOjY6Il90b2tlbiI7czo0MDoibEJrM0RzUk5DNDdlanh4eWlSOG5IemhPM3p0WHh1c1QwWmxpcVpVdCI7czo4OiJ1c2VybmFtZSI7czo3OiJkYmFybmVzIjtzOjU6ImVtYWlsIjtzOjIyOiJkYmFybmVzQG1haWxpbmF0b3IuY29tIjtzOjUwOiJsb2dpbl93ZWJfYzFhMjZiYzAwMjQ5ZGM2MjFmMDNjNDE3NzhkNTVmZTMzMWU3ZTkxMiI7TjtzOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19'),
('IRZWm1Q5wAGkWxN0YzC33gvfDYEaHJzCqi7gy1yX',17,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/131.0.0.0 Safari/537.36',1735277255,'YTo4OntzOjY6Il90b2tlbiI7czo0MDoibFhnckVRS2R4VzdTT2NoQ21Kek44d3IxVG50OHc4NWF0VWpQa3RraSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo1MDoibG9naW5fd2ViX2MxYTI2YmMwMDI0OWRjNjIxZjAzYzQxNzc4ZDU1ZmUzMzFlN2U5MTIiO2k6MTc7czo2OiJ1c2VySWQiO2k6MTc7czo4OiJ1c2VybmFtZSI7czoxMDoiYW13YW5kZW5nYSI7czo1OiJlbWFpbCI7czoyNToiYW13YW5kZW5nYUBtYWlsaW5hdG9yLmNvbSI7czoxNzoicGFzc3dvcmRfaGFzaF93ZWIiO3M6NjA6IiQyeSQxMCQ2OXc5YWhHRkl1QzZ6YVMuS3I5SDV1U2NjVDdhU2dmSHdENEJHVUtoZVZ2QWh1bjVXOGVnbSI7czoxMzoiY3VycmVudExvY2FsZSI7czoyOiJlbiI7fQ=='),
('JfJGZ8OBfvA3D0vcaLvLgQ1O45LCU1LRAIIMwsGz',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/131.0.0.0 Safari/537.36',1735277504,'YToyOntzOjY6Il90b2tlbiI7czo0MDoiaXBLTk5zalFVNXFHYmVEOXNkUkkwV1pZZ0N3bTFPRnNiZmJ0WldsciI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ=='),
('jLiwgeLDxKgU6GyC6VghYzJwVsbHTx8ZjxeTPsml',24,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/131.0.0.0 Safari/537.36',1735277522,'YTo4OntzOjY6Il90b2tlbiI7czo0MDoibEg5TGRCOUtDSUpOTTdBMDNsS3V4bEg2Rnh1NU90TkE1WHh2NVc2byI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czoxMzoiY3VycmVudExvY2FsZSI7czoyOiJlbiI7czo4OiJ1c2VybmFtZSI7czo3OiJlb3N0cm9tIjtzOjUwOiJsb2dpbl93ZWJfYzFhMjZiYzAwMjQ5ZGM2MjFmMDNjNDE3NzhkNTVmZTMzMWU3ZTkxMiI7aToyNDtzOjY6InVzZXJJZCI7aToyNDtzOjU6ImVtYWlsIjtzOjIyOiJlb3N0cm9tQG1haWxpbmF0b3IuY29tIjtzOjE3OiJwYXNzd29yZF9oYXNoX3dlYiI7czo2MDoiJDJ5JDEwJHQ1RG8uNzJOOTNWZXpISmppN3pJYi5nNUtxRjdjRHpYblMvTHNtTGVvMk9xQ0UvVFNiMENDIjt9'),
('JPRapdQpfBv51HwbNqH6rAKsBMeAa2nwAv34L7Tx',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/131.0.0.0 Safari/537.36',1735277303,'YTozOntzOjY6Il90b2tlbiI7czo0MDoiWkR6UTlOOWxCeVNseGg1czNpc1dnZVFOR0pvdmJrbmkwNXlQMU0zQiI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czoxMzoiY3VycmVudExvY2FsZSI7czoyOiJlbiI7fQ=='),
('jSaErJt4cpSe2fpxSmkaTj12lBSv6TmUxsnjfgFy',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/131.0.0.0 Safari/537.36',1735277308,'YTo4OntzOjY6Il90b2tlbiI7czo0MDoiR3VhWmtxaW9scEdLck9QT0NLSVllZUlhSElackt0ODlKS0pEdUFxcyI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo1MDoibG9naW5fd2ViX2MxYTI2YmMwMDI0OWRjNjIxZjAzYzQxNzc4ZDU1ZmUzMzFlN2U5MTIiO2k6MztzOjY6InVzZXJJZCI7aTozO3M6ODoidXNlcm5hbWUiO3M6NzoiZGJhcm5lcyI7czo1OiJlbWFpbCI7czoyMjoiZGJhcm5lc0BtYWlsaW5hdG9yLmNvbSI7czoxNzoicGFzc3dvcmRfaGFzaF93ZWIiO3M6NjA6IiQyeSQxMCRORVQ5d1dNeWpoN3BYQ2s0S1pZcHcuY2N4NHJaYTVuaFVZb2pTVDlUV1RvdmlEWVJ0UmRNQyI7czoxMzoiY3VycmVudExvY2FsZSI7czoyOiJlbiI7fQ=='),
('K58sz4AYSSBZI3cnB7e1feZaqfUjo86ngv1xLRU0',5,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/131.0.0.0 Safari/537.36',1735277317,'YTo5OntzOjY6Il90b2tlbiI7czo0MDoiWVhadmNWRlQzQ1pmQWhDYUNlWjBYMGN6WjU4U0hud3NCb3JFRzVGcyI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo1MDoibG9naW5fd2ViX2MxYTI2YmMwMDI0OWRjNjIxZjAzYzQxNzc4ZDU1ZmUzMzFlN2U5MTIiO2k6NTtzOjY6InVzZXJJZCI7aTo1O3M6ODoidXNlcm5hbWUiO3M6ODoic2JlcmFyZG8iO3M6NToiZW1haWwiO3M6MjM6InNiZXJhcmRvQG1haWxpbmF0b3IuY29tIjtzOjE3OiJwYXNzd29yZF9oYXNoX3dlYiI7czo2MDoiJDJ5JDEwJEJqTk5KMm1xOVFsdmVKNHNWRjEvLk9vcUpJbjV0WHdHM1dPbUdPd09FdnpwaVcyMkVHQkNTIjtzOjEzOiJjdXJyZW50TG9jYWxlIjtzOjI6ImVuIjtzOjEwOiJzaWduZWRJbkFzIjtpOjM7fQ=='),
('KcGZjKtDjSXSRTguaZS1EKOrf4qdTQeqK8ZClBcP',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/131.0.0.0 Safari/537.36',1735276610,'YTozOntzOjY6Il90b2tlbiI7czo0MDoid3hGZWxRNTNlTzBOalBYY1VzdXQ1OVdEeTBMTGJzVHNES1NUa25rZCI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czoxMzoiY3VycmVudExvY2FsZSI7czoyOiJlbiI7fQ=='),
('lpnegmuUCy8lwEC8LagAWO5iwhIYyggJxA3OYoGk',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/131.0.0.0 Safari/537.36',1735276968,'YTozOntzOjY6Il90b2tlbiI7czo0MDoibnVPcU5ZckxlQ0E0WmhSOHBJd0lKTDRpOHBCZ3Z1cVRyZkRxVml6ViI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czoxMzoiY3VycmVudExvY2FsZSI7czoyOiJlbiI7fQ=='),
('lTaN6okLGo07A4evMOyMpWTT2HvYWOB2rT5VpgRw',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/131.0.0.0 Safari/537.36',1735276928,'YTozOntzOjY6Il90b2tlbiI7czo0MDoiU1hWaEtDdnMxMXVWQlBkMElOWGlSVGx3cWk1TlRzcm0zVnJPYmlzViI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czoxMzoiY3VycmVudExvY2FsZSI7czoyOiJlbiI7fQ=='),
('MkzsSK3Nl9E0nxCvsFefrIH64OqGClNcGjYlYBE2',34,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/131.0.0.0 Safari/537.36',1735277883,'YTo4OntzOjY6Il90b2tlbiI7czo0MDoiNDM0TE9nYjZoTU85ckFFclZiZ01waXMxTWw1bXMxVWd6dDBIVFJEcyI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czoxMzoiY3VycmVudExvY2FsZSI7czoyOiJlbiI7czo4OiJ1c2VybmFtZSI7czoxMToidndpbGxpYW1zb24iO3M6NTA6ImxvZ2luX3dlYl9jMWEyNmJjMDAyNDlkYzYyMWYwM2M0MTc3OGQ1NWZlMzMxZTdlOTEyIjtpOjM0O3M6NjoidXNlcklkIjtpOjM0O3M6NToiZW1haWwiO3M6MjY6InZ3aWxsaWFtc29uQG1haWxpbmF0b3IuY29tIjtzOjE3OiJwYXNzd29yZF9oYXNoX3dlYiI7czo2MDoiJDJ5JDEwJFVGRkQwS3BIZFU4eWkvN0FrVEQvLk9EaDJ6aGM2VDVnUWkzVnhsc0d5RzFJS0dOR1A1SnhlIjt9'),
('MMGcdLerFKscHDZY46ulsn08UNvPbpUgAj6LS3AT',1,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/131.0.0.0 Safari/537.36',1735277034,'YTo3OntzOjY6Il90b2tlbiI7czo0MDoiMkxhd1FZeDhCN3NGVW1VeUtURm9JUXRaZTg1S0lvbFVPdXo5WkhXWiI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo1MDoibG9naW5fd2ViX2MxYTI2YmMwMDI0OWRjNjIxZjAzYzQxNzc4ZDU1ZmUzMzFlN2U5MTIiO2k6MTtzOjY6InVzZXJJZCI7aToxO3M6ODoidXNlcm5hbWUiO3M6NToiYWRtaW4iO3M6NToiZW1haWwiO3M6MjM6InBrcGFkbWluQG1haWxpbmF0b3IuY29tIjtzOjE3OiJwYXNzd29yZF9oYXNoX3dlYiI7czo2MDoiJDJ5JDEwJGtFYlpzY1hpRnlzNWN1blFPeU1neU9EVS5rbzZYVEt2dEw4QjV4YWdTN2JpdFNrY0RSejZtIjt9'),
('MxpfTdTy3KRqRLi31rRKE9ydjjn1M85yFN6wKNQD',21,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/131.0.0.0 Safari/537.36',1735277407,'YTo4OntzOjY6Il90b2tlbiI7czo0MDoid0E1QUdqaFBYalNZWlR0YmpRVWg5amExbjlOWjBVUkxHbUhlbGU1bCI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czoxMzoiY3VycmVudExvY2FsZSI7czoyOiJlbiI7czo4OiJ1c2VybmFtZSI7czo2OiJkZGlvdWYiO3M6NTA6ImxvZ2luX3dlYl9jMWEyNmJjMDAyNDlkYzYyMWYwM2M0MTc3OGQ1NWZlMzMxZTdlOTEyIjtpOjIxO3M6NjoidXNlcklkIjtpOjIxO3M6NToiZW1haWwiO3M6MjE6ImRkaW91ZkBtYWlsaW5hdG9yLmNvbSI7czoxNzoicGFzc3dvcmRfaGFzaF93ZWIiO3M6NjA6IiQyeSQxMCRFY2RyVnoxOC9VYTBsamdsWDhjaHV1OWFhNXdUMGFObFFGaVJSOVd3ZDEweTJtV21RZU4xSyI7fQ=='),
('n6yIK6bqVOQnYKwvekb5fUrpk76QRI4Y2JAabcWr',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/131.0.0.0 Safari/537.36',1735276909,'YTo1OntzOjY6Il90b2tlbiI7czo0MDoiMlJIa2dRUjF2YVVqTmlnRHFQTnBTMUJVRTZxdjk5RVU2T01mNkl2ViI7czo4OiJ1c2VybmFtZSI7czo1OiJhZG1pbiI7czo1OiJlbWFpbCI7czoyMzoicGtwYWRtaW5AbWFpbGluYXRvci5jb20iO3M6NTA6ImxvZ2luX3dlYl9jMWEyNmJjMDAyNDlkYzYyMWYwM2M0MTc3OGQ1NWZlMzMxZTdlOTEyIjtOO3M6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0='),
('nACIxUrLk5yK63BElbnIifhsKCgoCVqaRwelSg7B',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/131.0.0.0 Safari/537.36',1735277928,'YTo3OntzOjY6Il90b2tlbiI7czo0MDoiYWc0Z3czZ25KSVEyWDFMbm5hbmhFdVRPQW5WWDdPeXlvZ0VMeFpVYSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo1MDoibG9naW5fd2ViX2MxYTI2YmMwMDI0OWRjNjIxZjAzYzQxNzc4ZDU1ZmUzMzFlN2U5MTIiO2k6MztzOjY6InVzZXJJZCI7aTozO3M6ODoidXNlcm5hbWUiO3M6NzoiZGJhcm5lcyI7czo1OiJlbWFpbCI7czoyMjoiZGJhcm5lc0BtYWlsaW5hdG9yLmNvbSI7czoxNzoicGFzc3dvcmRfaGFzaF93ZWIiO3M6NjA6IiQyeSQxMCRXUnlsdWlRaFkydHNtOTB3ZlhEUWouL1czeHhJYjhBRFMyemdrVDdOeUMzLmFNVEZhUGtIZSI7fQ=='),
('nkSBqU1CdRgSW1bHJXeXOxa5g8mXUW9SnwZaDVA8',1,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/131.0.0.0 Safari/537.36',1735277057,'YTo3OntzOjY6Il90b2tlbiI7czo0MDoid3MzcmVRWUVZUENWaGs2UWpyWkY4QUhxZTFON0NoN2kyS1ZNZk14dCI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo1MDoibG9naW5fd2ViX2MxYTI2YmMwMDI0OWRjNjIxZjAzYzQxNzc4ZDU1ZmUzMzFlN2U5MTIiO2k6MTtzOjY6InVzZXJJZCI7aToxO3M6ODoidXNlcm5hbWUiO3M6NToiYWRtaW4iO3M6NToiZW1haWwiO3M6MjM6InBrcGFkbWluQG1haWxpbmF0b3IuY29tIjtzOjE3OiJwYXNzd29yZF9oYXNoX3dlYiI7czo2MDoiJDJ5JDEwJFlFYlJOYjZUZGxDTUFKaUNFRm54LmUyZDAuZkFOWWVlTmdQNVRXNHowZWZ3anZXa29SOTc2Ijt9'),
('NT0G1wBUDH4cKkV1xIPTviIanOEMCLaEFrGovn4r',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/131.0.0.0 Safari/537.36',1735276692,'YToyOntzOjY6Il90b2tlbiI7czo0MDoiZERBcjJNdmdCVzl2ZmN5VWtMTDB5cDgwR3BodXFLYnJkblZPZmtscSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ=='),
('O9YsSjtMUBhy7TB7MTW7g0JUVS8t6w5YkLTdfUes',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/131.0.0.0 Safari/537.36',1735277639,'YTo3OntzOjY6Il90b2tlbiI7czo0MDoiOFZwTHVZcTZFaWU2VWRrazk0U2JpQW1lMUVXdzRFdElIQnMyRTU5aCI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo1MDoibG9naW5fd2ViX2MxYTI2YmMwMDI0OWRjNjIxZjAzYzQxNzc4ZDU1ZmUzMzFlN2U5MTIiO2k6MztzOjY6InVzZXJJZCI7aTozO3M6ODoidXNlcm5hbWUiO3M6NzoiZGJhcm5lcyI7czo1OiJlbWFpbCI7czoyMjoiZGJhcm5lc0BtYWlsaW5hdG9yLmNvbSI7czoxNzoicGFzc3dvcmRfaGFzaF93ZWIiO3M6NjA6IiQyeSQxMCRiWVpsV0ZWbDZjakhmSDdKcWF6a3hlWW1YZm1WRktrcjVYQ2s3QzRnMm9yajFaZkZZSGhTLiI7fQ=='),
('oML9P11FbYjRerjPhHxi0ZnZrP6IzbKIPMpbX9QN',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/131.0.0.0 Safari/537.36',1735276805,'YTo1OntzOjY6Il90b2tlbiI7czo0MDoiRnNnaFB1NXVSU3llSTBqVkVQSDBJcjdCMm5hT2JuanBQb05ZNlpVdCI7czo4OiJ1c2VybmFtZSI7czo1OiJhZG1pbiI7czo1OiJlbWFpbCI7czoyMzoicGtwYWRtaW5AbWFpbGluYXRvci5jb20iO3M6NTA6ImxvZ2luX3dlYl9jMWEyNmJjMDAyNDlkYzYyMWYwM2M0MTc3OGQ1NWZlMzMxZTdlOTEyIjtOO3M6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0='),
('oRV1o0RtAr6lw66WRroLIhW3CWfx5blXrJUW20Bw',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/131.0.0.0 Safari/537.36',1735277674,'YTo1OntzOjY6Il90b2tlbiI7czo0MDoieGswaW5XaFVwY2dmVk1WM1owR1A0bk5FQmRBZUpxSndGZFNra2k3TyI7czo4OiJ1c2VybmFtZSI7czo4OiJqamFuc3NlbiI7czo1OiJlbWFpbCI7czoyMzoiamphbnNzZW5AbWFpbGluYXRvci5jb20iO3M6NTA6ImxvZ2luX3dlYl9jMWEyNmJjMDAyNDlkYzYyMWYwM2M0MTc3OGQ1NWZlMzMxZTdlOTEyIjtOO3M6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0='),
('ox3MvvEtiVD6iOBTW1qK6e6epfZY66C6e5GUVtrj',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/131.0.0.0 Safari/537.36',1735276631,'YTozOntzOjY6Il90b2tlbiI7czo0MDoiMXZYQ3h3Y3FzRVNWUEE3bGhrdGhQNFJadU9iS1VVZ3Fnend3ejdFciI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czoxMzoiY3VycmVudExvY2FsZSI7czoyOiJlbiI7fQ=='),
('p9QquUyyGhsHUwjpQ2eOvhO4BZB3MBTYv6i7pITI',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/131.0.0.0 Safari/537.36',1735277833,'YTo4OntzOjY6Il90b2tlbiI7czo0MDoid1Y1OEZqTGhjY0pRU0JESkJoN1hFZlp1MUdreDBOSkIxZ2hndHdRUSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo1MDoibG9naW5fd2ViX2MxYTI2YmMwMDI0OWRjNjIxZjAzYzQxNzc4ZDU1ZmUzMzFlN2U5MTIiO2k6MztzOjY6InVzZXJJZCI7aTozO3M6ODoidXNlcm5hbWUiO3M6NzoiZGJhcm5lcyI7czo1OiJlbWFpbCI7czoyMjoiZGJhcm5lc0BtYWlsaW5hdG9yLmNvbSI7czoxNzoicGFzc3dvcmRfaGFzaF93ZWIiO3M6NjA6IiQyeSQxMCROUTZ3dnZ3WjIwaHNsMWxnN0U4dmNlMzBVZUJINzRIOWJuZ2Z3aGhvUVZJb2x0ZU53Y2NqcSI7czoxMzoiY3VycmVudExvY2FsZSI7czoyOiJlbiI7fQ=='),
('pGyvW4evRzz9XrJJV1xr3Pk99q25UzeALvKapVZQ',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/131.0.0.0 Safari/537.36',1735277821,'YTo3OntzOjY6Il90b2tlbiI7czo0MDoiY1RqcngxeXVadG1FcXdQalJwbmNBbEJTSXFEaTV1bXFRY0xoRm1LciI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo1MDoibG9naW5fd2ViX2MxYTI2YmMwMDI0OWRjNjIxZjAzYzQxNzc4ZDU1ZmUzMzFlN2U5MTIiO2k6MztzOjY6InVzZXJJZCI7aTozO3M6ODoidXNlcm5hbWUiO3M6NzoiZGJhcm5lcyI7czo1OiJlbWFpbCI7czoyMjoiZGJhcm5lc0BtYWlsaW5hdG9yLmNvbSI7czoxNzoicGFzc3dvcmRfaGFzaF93ZWIiO3M6NjA6IiQyeSQxMCRsTmZFUDk0VVZVWXluckU2R0hQSnl1RnpmUk9adDN1Q013ckVueTJYMXBvNWg1RFBzTmFucSI7fQ=='),
('Pwa0wpg68xPgbiWW39142h5agCaDV08twvO6ZGYa',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/131.0.0.0 Safari/537.36',1735277874,'YTo4OntzOjY6Il90b2tlbiI7czo0MDoiYXNSeFhQNDVkdW13VVR5SEVlRUJ2dlF2WXo1YTEyM2ZjanFveUd4ayI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo1MDoibG9naW5fd2ViX2MxYTI2YmMwMDI0OWRjNjIxZjAzYzQxNzc4ZDU1ZmUzMzFlN2U5MTIiO2k6MztzOjY6InVzZXJJZCI7aTozO3M6ODoidXNlcm5hbWUiO3M6NzoiZGJhcm5lcyI7czo1OiJlbWFpbCI7czoyMjoiZGJhcm5lc0BtYWlsaW5hdG9yLmNvbSI7czoxNzoicGFzc3dvcmRfaGFzaF93ZWIiO3M6NjA6IiQyeSQxMCRRLzJMMm11aGxlVlJwSkluNmwuQ2xPM29ya1V6OVIxaS5ycUwvUWNoV1pRYXl4M210MXl2dSI7czoxMzoiY3VycmVudExvY2FsZSI7czoyOiJlbiI7fQ=='),
('R9TfDyp1JpFwrHHKBH2vgxEylKIQHjp3i0BtR7hR',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/131.0.0.0 Safari/537.36',1735276678,'YTozOntzOjY6Il90b2tlbiI7czo0MDoicHQyVEpYQWFKRDNDbTJuS3UwVGR1Y1RoRDRpdU1JVTE1ZnI5cElhTSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czoxMzoiY3VycmVudExvY2FsZSI7czoyOiJlbiI7fQ=='),
('ReSE62A3qzozPzi2n0wTPLa8pvUlBoS3edzkvstZ',25,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/131.0.0.0 Safari/537.36',1735277531,'YTo4OntzOjY6Il90b2tlbiI7czo0MDoibGhiSDNVRE0wUjI1U0hSa2VIa2Fzb0VjMkZkeVdwMlM4bHJzR2c5RiI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czoxMzoiY3VycmVudExvY2FsZSI7czoyOiJlbiI7czo4OiJ1c2VybmFtZSI7czo5OiJmcGFnbGllcmkiO3M6NTA6ImxvZ2luX3dlYl9jMWEyNmJjMDAyNDlkYzYyMWYwM2M0MTc3OGQ1NWZlMzMxZTdlOTEyIjtpOjI1O3M6NjoidXNlcklkIjtpOjI1O3M6NToiZW1haWwiO3M6MjQ6ImZwYWdsaWVyaUBtYWlsaW5hdG9yLmNvbSI7czoxNzoicGFzc3dvcmRfaGFzaF93ZWIiO3M6NjA6IiQyeSQxMCRPSlpiT05GYUxRWE1ac3RlczEuM0hlMjdOdzVWeHp3VUp1ZUNKTlo5TmpQZURSTmtpL0ZBVyI7fQ=='),
('RHNSdTvZt0GR1zqv4B5WxvWAiJs9rXYD5Al7aKE2',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/131.0.0.0 Safari/537.36',1735276949,'YTo1OntzOjY6Il90b2tlbiI7czo0MDoiR1BvdWZ2ZFF6S2hhTndqa0tlTFI0NjdxNFpOM25hWnFOVUtNVzh4SSI7czo4OiJ1c2VybmFtZSI7czo1OiJhZG1pbiI7czo1OiJlbWFpbCI7czoyMzoicGtwYWRtaW5AbWFpbGluYXRvci5jb20iO3M6NTA6ImxvZ2luX3dlYl9jMWEyNmJjMDAyNDlkYzYyMWYwM2M0MTc3OGQ1NWZlMzMxZTdlOTEyIjtOO3M6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0='),
('rI6NvykGyBQma5j5kvbsjaVrGXqUwQPftsmqkA0a',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/131.0.0.0 Safari/537.36',1735277269,'YTo1OntzOjY6Il90b2tlbiI7czo0MDoiakUxQkc1SXZYQWdEdnRQUEdoYXRYU1ZzT3ZqM09KZXhOUHlTSXhoVSI7czo4OiJ1c2VybmFtZSI7czo3OiJkYmFybmVzIjtzOjU6ImVtYWlsIjtzOjIyOiJkYmFybmVzQG1haWxpbmF0b3IuY29tIjtzOjUwOiJsb2dpbl93ZWJfYzFhMjZiYzAwMjQ5ZGM2MjFmMDNjNDE3NzhkNTVmZTMzMWU3ZTkxMiI7TjtzOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19'),
('s82oOyetrorKxmZ6y50OmcW9mK4ulPPUjrLO5IqQ',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/131.0.0.0 Safari/537.36',1735276623,'YTo1OntzOjY6Il90b2tlbiI7czo0MDoiS0pKYlhBRWNkVFhyZnV4bk1zckNzVlEwQXpxN3pRdk5HTDFlWTdqZSI7czo4OiJ1c2VybmFtZSI7czo1OiJhZG1pbiI7czo1OiJlbWFpbCI7czoyMzoicGtwYWRtaW5AbWFpbGluYXRvci5jb20iO3M6NTA6ImxvZ2luX3dlYl9jMWEyNmJjMDAyNDlkYzYyMWYwM2M0MTc3OGQ1NWZlMzMxZTdlOTEyIjtOO3M6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0='),
('SDMVdUZOTzxsmvK6xnfftOJGSD3ttwnXGXPNNvI6',1,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/131.0.0.0 Safari/537.36',1735277046,'YTo3OntzOjY6Il90b2tlbiI7czo0MDoiV29iYzJDRnlGeVhjYkNrSU1mSHhqS0t0eExXNG9pRXg3TG5WdWk3SCI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo1MDoibG9naW5fd2ViX2MxYTI2YmMwMDI0OWRjNjIxZjAzYzQxNzc4ZDU1ZmUzMzFlN2U5MTIiO2k6MTtzOjY6InVzZXJJZCI7aToxO3M6ODoidXNlcm5hbWUiO3M6NToiYWRtaW4iO3M6NToiZW1haWwiO3M6MjM6InBrcGFkbWluQG1haWxpbmF0b3IuY29tIjtzOjE3OiJwYXNzd29yZF9oYXNoX3dlYiI7czo2MDoiJDJ5JDEwJGdOYUNUZzdJR2oxVVowcktESmdhcnUuSktHN1c4RVlTQmxtOUVEb3NQMTV1d3FGTVRjWVlLIjt9'),
('SjiDka4pyq8vPKtLsSj8zxys1xaekTkGEyPfptJ1',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/131.0.0.0 Safari/537.36',1735276654,'YTozOntzOjY6Il90b2tlbiI7czo0MDoiSHZYdzNteWJ1S01MTHBQSjRaWEJGeUVlTWJjMk9YRkZHYkhTc056NiI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czoxMzoiY3VycmVudExvY2FsZSI7czoyOiJlbiI7fQ=='),
('sVhNecluUK9S9jZdRjNPuAd1HUDUJVcK7CXRnYrt',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/131.0.0.0 Safari/537.36',1735277359,'YTo3OntzOjY6Il90b2tlbiI7czo0MDoiRHhkQ05RMFhtcXNlR2V0ajFmUW01UEZoM2lwZjhXZzlUQXhLNFQ2aiI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo1MDoibG9naW5fd2ViX2MxYTI2YmMwMDI0OWRjNjIxZjAzYzQxNzc4ZDU1ZmUzMzFlN2U5MTIiO2k6MztzOjY6InVzZXJJZCI7aTozO3M6ODoidXNlcm5hbWUiO3M6NzoiZGJhcm5lcyI7czo1OiJlbWFpbCI7czoyMjoiZGJhcm5lc0BtYWlsaW5hdG9yLmNvbSI7czoxNzoicGFzc3dvcmRfaGFzaF93ZWIiO3M6NjA6IiQyeSQxMCRxT2VQcEVuV2FaTTd6N3VOclcxQ2EuMm9NeEpoQkdYQ3lrZkZ0emFRTGEuaXA2c21UWXRIcSI7fQ=='),
('t40Zt5G6K0wHOd8Ya0EBbbIjtjLTL240DGLjdrJv',33,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/131.0.0.0 Safari/537.36',1735277777,'YTo4OntzOjY6Il90b2tlbiI7czo0MDoiaEpKcTNQZHlQTVJiN29qTHpaTk80WEZpS05ZbDFXaDV0TG1TNmRQZyI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czoxMzoiY3VycmVudExvY2FsZSI7czoyOiJlbiI7czo4OiJ1c2VybmFtZSI7czoxMjoidmthcmJhc2l6YWVkIjtzOjUwOiJsb2dpbl93ZWJfYzFhMjZiYzAwMjQ5ZGM2MjFmMDNjNDE3NzhkNTVmZTMzMWU3ZTkxMiI7aTozMztzOjY6InVzZXJJZCI7aTozMztzOjU6ImVtYWlsIjtzOjI3OiJ2a2FyYmFzaXphZWRAbWFpbGluYXRvci5jb20iO3M6MTc6InBhc3N3b3JkX2hhc2hfd2ViIjtzOjYwOiIkMnkkMTAkY3dnRHBlazZUekdsdjZPam9PNm9aT2xtZEdNeFhja2c0TGdtSUlZSGxRcFg4OVUzTi9FNUciO30='),
('TaLRewcDmawhRvjkcfQtAcAwukV25AnFkFBu06Tx',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/131.0.0.0 Safari/537.36',1735277347,'YTo3OntzOjY6Il90b2tlbiI7czo0MDoicEt3NkRlYzZEeFc2WmhvWkxNMXFLUUdvRnFJb0NYS09TUWZtR0QzaiI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo1MDoibG9naW5fd2ViX2MxYTI2YmMwMDI0OWRjNjIxZjAzYzQxNzc4ZDU1ZmUzMzFlN2U5MTIiO2k6MztzOjY6InVzZXJJZCI7aTozO3M6ODoidXNlcm5hbWUiO3M6NzoiZGJhcm5lcyI7czo1OiJlbWFpbCI7czoyMjoiZGJhcm5lc0BtYWlsaW5hdG9yLmNvbSI7czoxNzoicGFzc3dvcmRfaGFzaF93ZWIiO3M6NjA6IiQyeSQxMCQzUGF6aEx2NjdvSFBtSXBlNE1XQzR1Z3RYc004eUNnU1BYMUZrUG5kOGMzSzViL0dsdVNKSyI7fQ=='),
('ThhdqgAX846QG7RDiLNoqeHhYXH3uRlWkjPMPC5p',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/131.0.0.0 Safari/537.36',1735276602,'YTo1OntzOjY6Il90b2tlbiI7czo0MDoibkNxQzlic0Z2WGJNQldFN1VIbGRBMFVXSTJpMFdZNTZ2SGVpcEVScCI7czo4OiJ1c2VybmFtZSI7czo1OiJhZG1pbiI7czo1OiJlbWFpbCI7czoyMzoicGtwYWRtaW5AbWFpbGluYXRvci5jb20iO3M6NTA6ImxvZ2luX3dlYl9jMWEyNmJjMDAyNDlkYzYyMWYwM2M0MTc3OGQ1NWZlMzMxZTdlOTEyIjtOO3M6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0='),
('TKmVThby5yGI79d0aKsufBlgpnofENLeLUqggH7e',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/131.0.0.0 Safari/537.36',1735277299,'YTo4OntzOjY6Il90b2tlbiI7czo0MDoiSTRtZjJiRVBXTUxvNFhZRlVEekFUZ1U1T3VwSUpld3JGS3ltYXYzTiI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo1MDoibG9naW5fd2ViX2MxYTI2YmMwMDI0OWRjNjIxZjAzYzQxNzc4ZDU1ZmUzMzFlN2U5MTIiO2k6MztzOjY6InVzZXJJZCI7aTozO3M6ODoidXNlcm5hbWUiO3M6NzoiZGJhcm5lcyI7czo1OiJlbWFpbCI7czoyMjoiZGJhcm5lc0BtYWlsaW5hdG9yLmNvbSI7czoxNzoicGFzc3dvcmRfaGFzaF93ZWIiO3M6NjA6IiQyeSQxMCRDZjVqY2FOL1lWZFVxbXJLSTNQZUIuTHBJMS9KS0kxQ0J5VjZhUkZlNFUydkplNXFDc2lPaSI7czoxMzoiY3VycmVudExvY2FsZSI7czoyOiJlbiI7fQ=='),
('TZ4VvdqqZOjbgUQ9HkAGiObQqyJPXbPB6UwEHtDF',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/131.0.0.0 Safari/537.36',1735277240,'YTo4OntzOjY6Il90b2tlbiI7czo0MDoicXcweXUwR052M1NnQ3dxSTJDQ3c2UUJwYzFLUm5mZ1FIclIwWnEwbSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo1MDoibG9naW5fd2ViX2MxYTI2YmMwMDI0OWRjNjIxZjAzYzQxNzc4ZDU1ZmUzMzFlN2U5MTIiO2k6MztzOjY6InVzZXJJZCI7aTozO3M6ODoidXNlcm5hbWUiO3M6NzoiZGJhcm5lcyI7czo1OiJlbWFpbCI7czoyMjoiZGJhcm5lc0BtYWlsaW5hdG9yLmNvbSI7czoxNzoicGFzc3dvcmRfaGFzaF93ZWIiO3M6NjA6IiQyeSQxMCRhZ1ZsQS5XL3pZRVQ0QzJKUlJzTkllSFcwZGxJOGduWWw4SFVwUHIwZ3ZWdDBKOVV3L0dDVyI7czoxMzoiY3VycmVudExvY2FsZSI7czoyOiJlbiI7fQ=='),
('UKpGKjf6Ie49XkTUrIxmTXXtjIOUE4nmTiIVaJQn',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/131.0.0.0 Safari/537.36',1735277839,'YTo4OntzOjY6Il90b2tlbiI7czo0MDoiNUNMUDZVM1FJNkR5WTJFamhRdGVmR2RGZzM4eHVEbWdyamV3QmluZiI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo1MDoibG9naW5fd2ViX2MxYTI2YmMwMDI0OWRjNjIxZjAzYzQxNzc4ZDU1ZmUzMzFlN2U5MTIiO2k6MztzOjY6InVzZXJJZCI7aTozO3M6ODoidXNlcm5hbWUiO3M6NzoiZGJhcm5lcyI7czo1OiJlbWFpbCI7czoyMjoiZGJhcm5lc0BtYWlsaW5hdG9yLmNvbSI7czoxNzoicGFzc3dvcmRfaGFzaF93ZWIiO3M6NjA6IiQyeSQxMCQxV3dFUTZSN3pKak5CQlkvckRRWE8uNEZXcVF4R1FsOHVUSGFOUEZFcnJkTlVBOEZWSS9DbSI7czoxMzoiY3VycmVudExvY2FsZSI7czoyOiJlbiI7fQ=='),
('upQXjRkSwz2BYZ1hIUwngyamegL4phPr5AI7IGZB',27,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/131.0.0.0 Safari/537.36',1735277615,'YTo4OntzOjY6Il90b2tlbiI7czo0MDoiZGp3YXNCcUxpZmkyRjU4QkNmTHhCdkpZVXIxWGNPV2hqQk93UlllRyI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czoxMzoiY3VycmVudExvY2FsZSI7czoyOiJlbiI7czo4OiJ1c2VybmFtZSI7czoxMDoia2Fsa2hhZmFqaSI7czo1MDoibG9naW5fd2ViX2MxYTI2YmMwMDI0OWRjNjIxZjAzYzQxNzc4ZDU1ZmUzMzFlN2U5MTIiO2k6Mjc7czo2OiJ1c2VySWQiO2k6Mjc7czo1OiJlbWFpbCI7czoyNToia2Fsa2hhZmFqaUBtYWlsaW5hdG9yLmNvbSI7czoxNzoicGFzc3dvcmRfaGFzaF93ZWIiO3M6NjA6IiQyeSQxMCR3akZPbHUuRmo4bnNSbG5Md1Q2d0pPVE9kcEtleEtzc0IyeEgvaWNJcC9YQnFCRGtieDBlbSI7fQ=='),
('usszpYT258SdlPmAcKqZ6yje0VhgHDCUj0aKJ8IS',22,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/131.0.0.0 Safari/537.36',1735277449,'YTo4OntzOjY6Il90b2tlbiI7czo0MDoiZmVheUJvcVNpUjN6SGRTN1lyQWV6ellMVkprc3VvWUhidXI2M0R2dyI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czoxMzoiY3VycmVudExvY2FsZSI7czoyOiJlbiI7czo4OiJ1c2VybmFtZSI7czo5OiJkcGhpbGxpcHMiO3M6NTA6ImxvZ2luX3dlYl9jMWEyNmJjMDAyNDlkYzYyMWYwM2M0MTc3OGQ1NWZlMzMxZTdlOTEyIjtpOjIyO3M6NjoidXNlcklkIjtpOjIyO3M6NToiZW1haWwiO3M6MjQ6ImRwaGlsbGlwc0BtYWlsaW5hdG9yLmNvbSI7czoxNzoicGFzc3dvcmRfaGFzaF93ZWIiO3M6NjA6IiQyeSQxMCQ2NzJadEJFdWN5VjNlazhPamQ1NEtPYzdMUW5zZWJhRFR0THVKSlVvQXp4QXp4STdwL2VVdSI7fQ=='),
('W17iyFYssQf1k4N7gYTQkQ3aGRkZkwBsonBJ2tdW',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/131.0.0.0 Safari/537.36',1735277845,'YTo4OntzOjY6Il90b2tlbiI7czo0MDoiYTd0U3kyZ2g3Zm5XSWpYTWZXeDZsRDlNQ055U0NwcmZMY2NiMUVJbCI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo1MDoibG9naW5fd2ViX2MxYTI2YmMwMDI0OWRjNjIxZjAzYzQxNzc4ZDU1ZmUzMzFlN2U5MTIiO2k6MztzOjY6InVzZXJJZCI7aTozO3M6ODoidXNlcm5hbWUiO3M6NzoiZGJhcm5lcyI7czo1OiJlbWFpbCI7czoyMjoiZGJhcm5lc0BtYWlsaW5hdG9yLmNvbSI7czoxNzoicGFzc3dvcmRfaGFzaF93ZWIiO3M6NjA6IiQyeSQxMCRaTmpmNk1sc25hYUNTcDc3ZzF4ZkJ1L0dSV2x1Ymw0Z1h3TG43WjNoT0xOYXBPdUR3Z2UvNiI7czoxMzoiY3VycmVudExvY2FsZSI7czoyOiJlbiI7fQ=='),
('w2LRyDtDuXRB1YeIHSG2MP9KNHtZa2TKEJUaZ66b',30,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/131.0.0.0 Safari/537.36',1735277714,'YTo4OntzOjY6Il90b2tlbiI7czo0MDoiWmh4SFVPZk56RDk3NHhZSVNCZ1BTSnVkbXM0MmJncDdtemJNWXoxNyI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czoxMzoiY3VycmVudExvY2FsZSI7czoyOiJlbiI7czo4OiJ1c2VybmFtZSI7czo3OiJwZGFuaWVsIjtzOjUwOiJsb2dpbl93ZWJfYzFhMjZiYzAwMjQ5ZGM2MjFmMDNjNDE3NzhkNTVmZTMzMWU3ZTkxMiI7aTozMDtzOjY6InVzZXJJZCI7aTozMDtzOjU6ImVtYWlsIjtzOjIyOiJwZGFuaWVsQG1haWxpbmF0b3IuY29tIjtzOjE3OiJwYXNzd29yZF9oYXNoX3dlYiI7czo2MDoiJDJ5JDEwJGZRemxaLmFULjVsS0pPVHJOTnpsb2VwM1NQU1oxZm93eldnTnpEdHhia3ZpRkttdzJTZHJxIjt9'),
('wBmWvFBlwcj3kiFRzPDmn7kzdc9tJMN9UpI4qf0Z',5,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/131.0.0.0 Safari/537.36',1735277325,'YTo5OntzOjY6Il90b2tlbiI7czo0MDoiU3JTdndEd3ZVV295eThXTTByVUNUZ1pkMWZmelVkMUpxbWUwVG5KbSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo1MDoibG9naW5fd2ViX2MxYTI2YmMwMDI0OWRjNjIxZjAzYzQxNzc4ZDU1ZmUzMzFlN2U5MTIiO2k6NTtzOjY6InVzZXJJZCI7aTo1O3M6ODoidXNlcm5hbWUiO3M6ODoic2JlcmFyZG8iO3M6NToiZW1haWwiO3M6MjM6InNiZXJhcmRvQG1haWxpbmF0b3IuY29tIjtzOjE3OiJwYXNzd29yZF9oYXNoX3dlYiI7czo2MDoiJDJ5JDEwJEJqTk5KMm1xOVFsdmVKNHNWRjEvLk9vcUpJbjV0WHdHM1dPbUdPd09FdnpwaVcyMkVHQkNTIjtzOjEzOiJjdXJyZW50TG9jYWxlIjtzOjI6ImVuIjtzOjEwOiJzaWduZWRJbkFzIjtpOjM7fQ=='),
('wv0Inhh5gsJZnelofzJyduZl4aQl2RuZrnnEbT0K',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/131.0.0.0 Safari/537.36',1735276788,'YTozOntzOjY6Il90b2tlbiI7czo0MDoiV04zc1VvOWJVWWRhMGZQZjlJQmQ4Z2szUFNnZmRPcmsyU1BuQlpyYyI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czoxMzoiY3VycmVudExvY2FsZSI7czoyOiJlbiI7fQ=='),
('WvG9jkR2Ol5HPwmxSdk4gShsmw888SJMjXD26Lmm',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/131.0.0.0 Safari/537.36',1735277851,'YTo4OntzOjY6Il90b2tlbiI7czo0MDoic2lxcTFmOE9LSWZndnc2R3ZnZkRJNGtlYmg4cVdNSEswNzhHRmp0TSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo1MDoibG9naW5fd2ViX2MxYTI2YmMwMDI0OWRjNjIxZjAzYzQxNzc4ZDU1ZmUzMzFlN2U5MTIiO2k6MztzOjY6InVzZXJJZCI7aTozO3M6ODoidXNlcm5hbWUiO3M6NzoiZGJhcm5lcyI7czo1OiJlbWFpbCI7czoyMjoiZGJhcm5lc0BtYWlsaW5hdG9yLmNvbSI7czoxNzoicGFzc3dvcmRfaGFzaF93ZWIiO3M6NjA6IiQyeSQxMCRscElXdGpBM1l2SGRFYk1NMks1UXJPVk1XWnpaUzR6emo5OVRSN3U4UlZGdGVRZ3NQQzlWQyI7czoxMzoiY3VycmVudExvY2FsZSI7czoyOiJlbiI7fQ=='),
('XCRBYvUJ0glziYqXjrRoXtd0DVzTmbbdVLhBKZHn',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/131.0.0.0 Safari/537.36',1735276513,'YToyOntzOjY6Il90b2tlbiI7czo0MDoiM0hxdVhING16NDlQSEFSVnBzSVkwM2l2ZHdGSjg5b2R4NlF0aFJ5WiI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ=='),
('XlOPR8r7R5JLKGs01ww42Id6eFW24EglOBG2xmM8',17,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/131.0.0.0 Safari/537.36',1735277243,'YTo4OntzOjY6Il90b2tlbiI7czo0MDoiR044MG5YY2hsNVdHbVk2c2dkaldKRU5rYkJoZ0I3aUVuOTh5cm1TUyI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo1MDoibG9naW5fd2ViX2MxYTI2YmMwMDI0OWRjNjIxZjAzYzQxNzc4ZDU1ZmUzMzFlN2U5MTIiO2k6MTc7czo2OiJ1c2VySWQiO2k6MTc7czo4OiJ1c2VybmFtZSI7czoxMDoiYW13YW5kZW5nYSI7czo1OiJlbWFpbCI7czoyNToiYW13YW5kZW5nYUBtYWlsaW5hdG9yLmNvbSI7czoxNzoicGFzc3dvcmRfaGFzaF93ZWIiO3M6NjA6IiQyeSQxMCQxWlZQbGx3SHQxbEpmMGwuU0JncUZPLzFYM3FmM1ZEZW41YmRVdXlFUElYTDdGejdkdG16bSI7czoxMzoiY3VycmVudExvY2FsZSI7czoyOiJlbiI7fQ=='),
('xMiTDep1wqe2gSjMG2c31X3Xaef1GVlvNyIRa8cU',19,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/131.0.0.0 Safari/537.36',1735277368,'YTo4OntzOjY6Il90b2tlbiI7czo0MDoiZVRoRkZsejgyZUY2em1ockkwb1NNZXFzSTZjRTRISXQ1TXFOQWd1UyI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czoxMzoiY3VycmVudExvY2FsZSI7czoyOiJlbiI7czo4OiJ1c2VybmFtZSI7czo4OiJja3dhbnRlcyI7czo1MDoibG9naW5fd2ViX2MxYTI2YmMwMDI0OWRjNjIxZjAzYzQxNzc4ZDU1ZmUzMzFlN2U5MTIiO2k6MTk7czo2OiJ1c2VySWQiO2k6MTk7czo1OiJlbWFpbCI7czoyMzoiY2t3YW50ZXNAbWFpbGluYXRvci5jb20iO3M6MTc6InBhc3N3b3JkX2hhc2hfd2ViIjtzOjYwOiIkMnkkMTAkRjV2TFdCQXhGZHlrcFdQVmpTNEozdWt6eGdZQlZKVUIyZkMxdUdnQXI4Tkp1TFQ2SWtHUjYiO30='),
('XNVZjQzvQCr6G8LX7pdah8iIHbv9hWuJK0TylnEm',1,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/131.0.0.0 Safari/537.36',1735276563,'YTo3OntzOjY6Il90b2tlbiI7czo0MDoiR3MzektIeXZLVk40WUtOWkNndVJBQndzNWJJb0lBTjROZnlOUXBNQiI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo1MDoibG9naW5fd2ViX2MxYTI2YmMwMDI0OWRjNjIxZjAzYzQxNzc4ZDU1ZmUzMzFlN2U5MTIiO2k6MTtzOjY6InVzZXJJZCI7aToxO3M6ODoidXNlcm5hbWUiO3M6NToiYWRtaW4iO3M6NToiZW1haWwiO3M6MjM6InBrcGFkbWluQG1haWxpbmF0b3IuY29tIjtzOjE3OiJwYXNzd29yZF9oYXNoX3dlYiI7czo2MDoiJDJ5JDEwJDhLdmxzVk9qbHJRQkpPUjJNMUk1cnVEOXFpYzBGOHRzdWh4TG5tQVZXN2tCc2VmOExwWUZpIjt9'),
('xQXM7I9kUNu4pJbWU6vF95kPVHoxPrvIiqFWNS5o',18,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/131.0.0.0 Safari/537.36',1735277334,'YTo4OntzOjY6Il90b2tlbiI7czo0MDoiWllyVHRzSmVLNzV4ZnhKcmtzUTIyZkhnTkV5b2pPWVprbXZMemdGayI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czoxMzoiY3VycmVudExvY2FsZSI7czoyOiJlbiI7czo4OiJ1c2VybmFtZSI7czo3OiJjY29yaW5vIjtzOjUwOiJsb2dpbl93ZWJfYzFhMjZiYzAwMjQ5ZGM2MjFmMDNjNDE3NzhkNTVmZTMzMWU3ZTkxMiI7aToxODtzOjY6InVzZXJJZCI7aToxODtzOjU6ImVtYWlsIjtzOjIyOiJjY29yaW5vQG1haWxpbmF0b3IuY29tIjtzOjE3OiJwYXNzd29yZF9oYXNoX3dlYiI7czo2MDoiJDJ5JDEwJHJIb05rLnB0SERPTWdYS25CekltVnVTSHZKb3lZQkJXRnpRT3Z0all1aE5WcUVqam40UmdlIjt9'),
('XuLAEGPTbCWJWBw4fFK6HVqZ41y1Ir7iuou4qynJ',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/131.0.0.0 Safari/537.36',1735276590,'YTozOntzOjY6Il90b2tlbiI7czo0MDoiMjdNYnpoazRpWElva0trdjE0UHdMOGE0RExhZjR4dXdzZDg3bUFEdSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czoxMzoiY3VycmVudExvY2FsZSI7czoyOiJlbiI7fQ=='),
('yczLDDHarnfnVeRq9y26cdq998dNR0GDAf1WSVIj',29,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/131.0.0.0 Safari/537.36',1735277649,'YTo4OntzOjY6Il90b2tlbiI7czo0MDoiUzR6ZkV5bmpEOGx1em5hTldMcFQyMlYwRGl3djFTazBCRktQSzI3YiI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czoxMzoiY3VycmVudExvY2FsZSI7czoyOiJlbiI7czo4OiJ1c2VybmFtZSI7czo4OiJsa3VtaWVnYSI7czo1MDoibG9naW5fd2ViX2MxYTI2YmMwMDI0OWRjNjIxZjAzYzQxNzc4ZDU1ZmUzMzFlN2U5MTIiO2k6Mjk7czo2OiJ1c2VySWQiO2k6Mjk7czo1OiJlbWFpbCI7czoyMzoibGt1bWllZ2FAbWFpbGluYXRvci5jb20iO3M6MTc6InBhc3N3b3JkX2hhc2hfd2ViIjtzOjYwOiIkMnkkMTAkREZjcC9IMmtoelIyL3U4QmEwd2hIZUtZY2h1VUdGeEs0Ui5DLkR6WDc2Z3FGTHJ6VERaT1MiO30='),
('YGzO0Oci2N4T63OGIphz91AnKnuViGXfQQnmG6jd',35,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/131.0.0.0 Safari/537.36',1735277903,'YTo4OntzOjY6Il90b2tlbiI7czo0MDoiVWV6SGZYZE1nUkYyUlZpVWI2SVVtRzA0NWE3bVNBdWY3bW9ZYXNwNCI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czoxMzoiY3VycmVudExvY2FsZSI7czoyOiJlbiI7czo4OiJ1c2VybmFtZSI7czo2OiJ6d29vZHMiO3M6NTA6ImxvZ2luX3dlYl9jMWEyNmJjMDAyNDlkYzYyMWYwM2M0MTc3OGQ1NWZlMzMxZTdlOTEyIjtpOjM1O3M6NjoidXNlcklkIjtpOjM1O3M6NToiZW1haWwiO3M6MjE6Inp3b29kc0BtYWlsaW5hdG9yLmNvbSI7czoxNzoicGFzc3dvcmRfaGFzaF93ZWIiO3M6NjA6IiQyeSQxMCQvOGxycUZDUTJpbXlsRHNEZk5vQ0RlYVNUSUhrVTU2WnlCSmtUeWU5Y3JQeGtWRTk0b0RVRyI7fQ=='),
('yJ0KdHxflMAy06d9GOatWJZdm4eq8fXRlI50UyBU',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/131.0.0.0 Safari/537.36',1735276774,'YTo1OntzOjY6Il90b2tlbiI7czo0MDoiZWxWaVJYRDdFRlRhMmYzb1BvWm1rMjZJQnk0d25yY25zVWNiUzZFWSI7czo4OiJ1c2VybmFtZSI7czo1OiJhZG1pbiI7czo1OiJlbWFpbCI7czoyMzoicGtwYWRtaW5AbWFpbGluYXRvci5jb20iO3M6NTA6ImxvZ2luX3dlYl9jMWEyNmJjMDAyNDlkYzYyMWYwM2M0MTc3OGQ1NWZlMzMxZTdlOTEyIjtOO3M6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0='),
('yjtnLe5hbIVXPUETcHUH3tSR1KYN6nWlEzWybsM8',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/131.0.0.0 Safari/537.36',1735276991,'YTo1OntzOjY6Il90b2tlbiI7czo0MDoiV2VNS2Z0NEZKbGg5UmNSS2gxeklFdTl5ZWJEZ3VOekxRM3hIelBpayI7czo4OiJ1c2VybmFtZSI7czo1OiJhZG1pbiI7czo1OiJlbWFpbCI7czoyMzoicGtwYWRtaW5AbWFpbGluYXRvci5jb20iO3M6NTA6ImxvZ2luX3dlYl9jMWEyNmJjMDAyNDlkYzYyMWYwM2M0MTc3OGQ1NWZlMzMxZTdlOTEyIjtOO3M6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0='),
('yN7SjWcHziqpBm8u4CNmzsrgXCO5VkkFGOLf1smx',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/131.0.0.0 Safari/537.36',1735276838,'YTo1OntzOjY6Il90b2tlbiI7czo0MDoiQVJSTEZzS3pWN0duZDNUU0h5R0N0Zms3dXlJT1pHNnpQckFIMUVBcyI7czo4OiJ1c2VybmFtZSI7czo1OiJhZG1pbiI7czo1OiJlbWFpbCI7czoyMzoicGtwYWRtaW5AbWFpbGluYXRvci5jb20iO3M6NTA6ImxvZ2luX3dlYl9jMWEyNmJjMDAyNDlkYzYyMWYwM2M0MTc3OGQ1NWZlMzMxZTdlOTEyIjtOO3M6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0='),
('Z7oEbExAhjweCSxs1jhlf49fjYyOiYwGjcFXnhid',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/131.0.0.0 Safari/537.36',1735277512,'YTo1OntzOjY6Il90b2tlbiI7czo0MDoiM0ZKYW1DOVRkdEFMZkNsanhGenJLZWJ2S2dzVmNMMEpFVkNKWlNQNSI7czo4OiJ1c2VybmFtZSI7czo3OiJwaHVkc29uIjtzOjU6ImVtYWlsIjtzOjIyOiJwaHVkc29uQG1haWxpbmF0b3IuY29tIjtzOjUwOiJsb2dpbl93ZWJfYzFhMjZiYzAwMjQ5ZGM2MjFmMDNjNDE3NzhkNTVmZTMzMWU3ZTkxMiI7TjtzOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19'),
('Z8A9KgArH9JKPZNFruy4OdY7ufZMzHSdISLzFfUo',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/131.0.0.0 Safari/537.36',1735277147,'YTo3OntzOjY6Il90b2tlbiI7czo0MDoiVE9tU3U5OElkUUxndWlxT3BjTFhHWW9XV0c3UmRzcmh5OGNDb1diSSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo1MDoibG9naW5fd2ViX2MxYTI2YmMwMDI0OWRjNjIxZjAzYzQxNzc4ZDU1ZmUzMzFlN2U5MTIiO2k6MztzOjY6InVzZXJJZCI7aTozO3M6ODoidXNlcm5hbWUiO3M6NzoiZGJhcm5lcyI7czo1OiJlbWFpbCI7czoyMjoiZGJhcm5lc0BtYWlsaW5hdG9yLmNvbSI7czoxNzoicGFzc3dvcmRfaGFzaF93ZWIiO3M6NjA6IiQyeSQxMCRjNE1XYnhtUTBnRFZNTDBXNHFxYzUuUEQuWXpvZ0s3YWlGTjBTWjA3bGxMeDlJYTB6eGhGMiI7fQ=='),
('ZpbVtqj8oHV7tCXimNO85rctLPEPQ6UvZ4EjUjWN',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/131.0.0.0 Safari/537.36',1735276889,'YTozOntzOjY6Il90b2tlbiI7czo0MDoiNTZoZGZYUWpodlFrRGgwdjlHU2lMUzExa1g5TDQzNGNTckZQdzRUcCI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czoxMzoiY3VycmVudExvY2FsZSI7czoyOiJlbiI7fQ=='),
('zRe67k6UVQmFGXgb109lX15eEV50MYEcdPLHuJEl',20,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/131.0.0.0 Safari/537.36',1735277398,'YTo4OntzOjY6Il90b2tlbiI7czo0MDoidDJPVkRRQkJxeGVCc2JERTNnR29Ja2lwTW43aXRvOGVvaUN6aU5DYSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czoxMzoiY3VycmVudExvY2FsZSI7czoyOiJlbiI7czo4OiJ1c2VybmFtZSI7czoxMjoiY21vbnRnb21lcmllIjtzOjUwOiJsb2dpbl93ZWJfYzFhMjZiYzAwMjQ5ZGM2MjFmMDNjNDE3NzhkNTVmZTMzMWU3ZTkxMiI7aToyMDtzOjY6InVzZXJJZCI7aToyMDtzOjU6ImVtYWlsIjtzOjI3OiJjbW9udGdvbWVyaWVAbWFpbGluYXRvci5jb20iO3M6MTc6InBhc3N3b3JkX2hhc2hfd2ViIjtzOjYwOiIkMnkkMTAkN3dmUzYyc0JWRXp2WE1NanVGR1MvLm9aN3BoQVNNSkJ3c0lkQ1IxYjhvdGhFTDBSMTI4dDIiO30='),
('zUAWpjKJNGKvUj8Hu1UWAKe2GOka3gcU847W4Bpo',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/131.0.0.0 Safari/537.36',1735276853,'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZUZlTklPZ09TWlJDT0pXck1PV2J1dGo0d2FnenBmWDVOTDNuYzRLayI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czoxMzoiY3VycmVudExvY2FsZSI7czoyOiJlbiI7fQ==');
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
  CONSTRAINT `site_redirect_context_id_foreign` FOREIGN KEY (`redirect_context_id`) REFERENCES `journals` (`journal_id`) ON DELETE SET NULL
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
(2,'contactName','en','Open Journal Systems'),
(3,'contactName','fr_CA','Open Journal Systems'),
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
(15,'uniqueSiteId','','D9D6DD04-5768-4A9A-8D43-7A82CBBE55DB');
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
) ENGINE=InnoDB AUTO_INCREMENT=94 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='Who can access a submission while it is in the editorial workflow. Includes all editorial and author assignments. For reviewers, see review_assignments.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stage_assignments`
--

LOCK TABLES `stage_assignments` WRITE;
/*!40000 ALTER TABLE `stage_assignments` DISABLE KEYS */;
INSERT INTO `stage_assignments` VALUES
(1,1,14,17,'2024-12-27 05:24:24',0,1),
(2,1,3,3,'2024-12-27 05:25:07',0,1),
(3,1,5,4,'2024-12-27 05:25:07',0,1),
(4,1,5,5,'2024-12-27 05:25:07',1,0),
(5,1,7,12,'2024-12-27 05:25:35',0,0),
(6,1,11,14,'2024-12-27 05:25:43',0,0),
(7,1,13,16,'2024-12-27 05:25:46',0,0),
(8,2,14,18,'2024-12-27 05:28:51',0,0),
(9,2,3,3,'2024-12-27 05:28:54',0,1),
(10,2,5,4,'2024-12-27 05:28:54',0,1),
(11,2,5,5,'2024-12-27 05:28:54',0,1),
(12,2,5,6,'2024-12-27 05:29:04',1,1),
(13,3,14,19,'2024-12-27 05:29:24',0,0),
(14,3,3,3,'2024-12-27 05:29:27',0,1),
(15,3,5,4,'2024-12-27 05:29:27',0,1),
(16,3,5,5,'2024-12-27 05:29:27',0,1),
(17,3,7,11,'2024-12-27 05:29:47',0,0),
(18,4,14,20,'2024-12-27 05:29:54',0,0),
(19,4,3,3,'2024-12-27 05:29:57',0,1),
(20,4,5,4,'2024-12-27 05:29:57',0,1),
(21,4,5,5,'2024-12-27 05:29:57',0,1),
(22,5,14,21,'2024-12-27 05:30:04',0,0),
(23,5,3,3,'2024-12-27 05:30:07',0,1),
(24,5,5,4,'2024-12-27 05:30:07',0,1),
(25,5,5,5,'2024-12-27 05:30:07',0,1),
(26,5,7,11,'2024-12-27 05:30:27',0,0),
(27,5,11,13,'2024-12-27 05:30:36',0,0),
(28,5,13,15,'2024-12-27 05:30:38',0,0),
(29,6,14,22,'2024-12-27 05:30:45',0,0),
(30,6,3,3,'2024-12-27 05:30:48',0,1),
(31,6,5,4,'2024-12-27 05:30:48',0,1),
(32,6,5,5,'2024-12-27 05:30:48',0,1),
(33,6,7,11,'2024-12-27 05:31:09',0,0),
(34,6,11,13,'2024-12-27 05:31:17',0,0),
(35,7,14,23,'2024-12-27 05:31:24',0,0),
(36,7,3,3,'2024-12-27 05:31:27',0,1),
(37,7,5,4,'2024-12-27 05:31:27',0,1),
(38,7,5,5,'2024-12-27 05:31:27',0,1),
(39,8,14,24,'2024-12-27 05:31:58',0,0),
(40,8,3,3,'2024-12-27 05:32:01',0,1),
(41,8,5,4,'2024-12-27 05:32:01',0,1),
(42,8,5,5,'2024-12-27 05:32:01',0,1),
(43,9,14,25,'2024-12-27 05:32:08',0,0),
(44,9,3,3,'2024-12-27 05:32:11',0,1),
(45,9,5,6,'2024-12-27 05:32:11',0,1),
(46,9,7,12,'2024-12-27 05:32:33',0,0),
(47,9,11,14,'2024-12-27 05:32:42',0,0),
(48,9,13,16,'2024-12-27 05:32:44',0,0),
(49,10,14,26,'2024-12-27 05:32:51',0,0),
(50,10,3,3,'2024-12-27 05:32:54',0,1),
(51,10,5,4,'2024-12-27 05:32:54',0,1),
(52,10,5,5,'2024-12-27 05:32:54',0,1),
(53,11,14,27,'2024-12-27 05:33:31',0,0),
(54,11,3,3,'2024-12-27 05:33:34',0,1),
(55,11,5,4,'2024-12-27 05:33:34',0,1),
(56,11,5,5,'2024-12-27 05:33:34',0,1),
(57,12,14,28,'2024-12-27 05:33:41',0,0),
(58,12,3,3,'2024-12-27 05:33:44',0,1),
(59,12,5,4,'2024-12-27 05:33:44',0,1),
(60,12,5,5,'2024-12-27 05:33:44',0,1),
(61,13,14,29,'2024-12-27 05:34:05',0,0),
(62,13,3,3,'2024-12-27 05:34:08',0,1),
(63,13,5,4,'2024-12-27 05:34:08',0,1),
(64,13,5,5,'2024-12-27 05:34:08',0,1),
(65,14,14,30,'2024-12-27 05:35:11',0,0),
(66,14,3,3,'2024-12-27 05:35:14',0,1),
(67,14,5,4,'2024-12-27 05:35:14',0,1),
(68,14,5,5,'2024-12-27 05:35:14',0,1),
(69,15,14,31,'2024-12-27 05:35:20',0,0),
(70,15,3,3,'2024-12-27 05:35:23',0,1),
(71,15,5,4,'2024-12-27 05:35:23',0,1),
(72,15,5,5,'2024-12-27 05:35:23',0,1),
(73,15,7,12,'2024-12-27 05:35:48',0,0),
(74,15,11,14,'2024-12-27 05:35:57',0,0),
(75,16,14,32,'2024-12-27 05:36:04',0,0),
(76,16,3,3,'2024-12-27 05:36:07',0,1),
(77,16,5,4,'2024-12-27 05:36:07',0,1),
(78,16,5,5,'2024-12-27 05:36:07',0,1),
(79,17,14,33,'2024-12-27 05:36:13',0,0),
(80,17,3,3,'2024-12-27 05:36:16',0,1),
(81,17,5,4,'2024-12-27 05:36:16',0,1),
(82,17,5,5,'2024-12-27 05:36:16',0,1),
(83,17,7,11,'2024-12-27 05:36:42',0,0),
(84,17,11,13,'2024-12-27 05:36:52',0,0),
(85,17,13,15,'2024-12-27 05:36:55',0,0),
(86,18,14,34,'2024-12-27 05:38:00',0,0),
(87,18,3,3,'2024-12-27 05:38:03',0,1),
(88,18,5,4,'2024-12-27 05:38:03',0,1),
(89,18,5,5,'2024-12-27 05:38:03',0,1),
(90,19,14,35,'2024-12-27 05:38:20',0,0),
(91,19,3,3,'2024-12-27 05:38:23',0,1),
(92,19,5,6,'2024-12-27 05:38:23',0,1),
(93,19,7,12,'2024-12-27 05:38:48',0,0);
/*!40000 ALTER TABLE `stage_assignments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `static_page_settings`
--

DROP TABLE IF EXISTS `static_page_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `static_page_settings` (
  `static_page_setting_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `static_page_id` bigint(20) NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` longtext DEFAULT NULL,
  `setting_type` varchar(6) NOT NULL COMMENT '(bool|int|float|string|object)',
  PRIMARY KEY (`static_page_setting_id`),
  UNIQUE KEY `static_page_settings_unique` (`static_page_id`,`locale`,`setting_name`),
  KEY `static_page_settings_static_page_id` (`static_page_id`),
  CONSTRAINT `static_page_settings_static_page_id` FOREIGN KEY (`static_page_id`) REFERENCES `static_pages` (`static_page_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
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
  PRIMARY KEY (`static_page_id`),
  KEY `static_pages_context_id` (`context_id`),
  CONSTRAINT `static_pages_context_id` FOREIGN KEY (`context_id`) REFERENCES `journals` (`journal_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
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
  CONSTRAINT `section_editors_context_id` FOREIGN KEY (`context_id`) REFERENCES `journals` (`journal_id`) ON DELETE CASCADE,
  CONSTRAINT `subeditor_submission_group_user_group_id_foreign` FOREIGN KEY (`user_group_id`) REFERENCES `user_groups` (`user_group_id`) ON DELETE CASCADE,
  CONSTRAINT `subeditor_submission_group_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='Subeditor assignments to e.g. sections and categories';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subeditor_submission_group`
--

LOCK TABLES `subeditor_submission_group` WRITE;
/*!40000 ALTER TABLE `subeditor_submission_group` DISABLE KEYS */;
INSERT INTO `subeditor_submission_group` VALUES
(1,1,1,530,3,3),
(2,1,1,530,4,5),
(3,1,1,530,5,5),
(4,1,2,530,3,3),
(5,1,2,530,6,5);
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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='Comments on a submission, e.g. peer review comments';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `submission_comments`
--

LOCK TABLES `submission_comments` WRITE;
/*!40000 ALTER TABLE `submission_comments` DISABLE KEYS */;
INSERT INTO `submission_comments` VALUES
(1,1,4096,7,10,8,'','<p>Here are my review comments</p>','2024-12-27 05:31:51',NULL,1),
(2,1,4096,10,15,9,'','<p>Here are my review comments</p>','2024-12-27 05:33:16',NULL,1),
(3,1,4096,10,16,10,'','<p>Here are my review comments</p>','2024-12-27 05:33:24',NULL,1),
(4,1,4096,13,19,7,'','<p>Here are my review comments</p>','2024-12-27 05:34:33',NULL,1),
(5,1,4096,13,20,9,'','<p>Here are my review comments</p>','2024-12-27 05:34:41',NULL,1),
(6,1,4096,13,21,10,'','<p>Here are my review comments</p>','2024-12-27 05:34:50',NULL,1);
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
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='Revisions map submission_file entries to files on the data store.';
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
(7,7,5),
(8,8,4),
(9,9,3),
(10,10,2),
(11,11,1),
(12,12,7),
(13,13,8),
(14,14,8),
(15,15,9),
(16,16,9),
(17,17,10),
(18,18,11),
(19,19,11),
(20,20,12),
(21,21,12),
(22,22,13),
(23,23,13),
(24,24,14),
(25,25,15),
(26,26,15),
(27,27,16),
(28,28,16),
(29,29,17),
(30,30,18),
(31,31,18),
(32,32,19),
(33,33,19),
(34,34,20),
(35,35,21),
(36,36,21),
(37,37,22),
(38,38,23),
(39,39,23),
(40,40,24),
(41,41,25),
(42,42,26),
(43,43,26);
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
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='Localized data about submission files like published metadata.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `submission_file_settings`
--

LOCK TABLES `submission_file_settings` WRITE;
/*!40000 ALTER TABLE `submission_file_settings` DISABLE KEYS */;
INSERT INTO `submission_file_settings` VALUES
(1,1,'en','name','Signalling Theory Dividends: A Review Of The Literature And Empirical Evidence.pdf'),
(2,2,'en','name','structured-interview-guide.odt'),
(3,3,'en','name','response-evaluation-all-team-members-draft-after-edits-final-version-final.ods'),
(4,4,'en','name','signalling-theory-dataset.pdf'),
(5,5,'en','name','author-disclosure-form.docx'),
(7,7,'en','name','author-disclosure-form.docx'),
(8,8,'en','name','signalling-theory-dataset.pdf'),
(9,9,'en','name','response-evaluation-all-team-members-draft-after-edits-final-version-final.ods'),
(10,10,'en','name','structured-interview-guide.odt'),
(11,11,'en','name','Signalling Theory Dividends: A Review Of The Literature And Empirical Evidence.pdf'),
(12,12,'en','name','article.pdf'),
(13,12,'fr_CA','name',''),
(14,13,'en','name','The influence of lactation on the quantity and quality of cashmere production.pdf'),
(15,14,'en','name','The influence of lactation on the quantity and quality of cashmere production.pdf'),
(16,15,'en','name','The Facets Of Job Satisfaction: A Nine-Nation Comparative Study Of Construct Equivalence.pdf'),
(17,16,'en','name','The Facets Of Job Satisfaction: A Nine-Nation Comparative Study Of Construct Equivalence.pdf'),
(18,17,'en','name','Computer Skill Requirements for New and Existing Teachers: Implications for Policy and Practice.pdf'),
(19,18,'en','name','Genetic transformation of forest trees.pdf'),
(20,19,'en','name','Genetic transformation of forest trees.pdf'),
(21,20,'en','name','Investigating the Shared Background Required for Argument: A Critique of Fogelin\'s Thesis on Deep Disagreement.pdf'),
(22,21,'en','name','Investigating the Shared Background Required for Argument: A Critique of Fogelin\'s Thesis on Deep Disagreement.pdf'),
(23,22,'en','name','Developing efficacy beliefs in the classroom.pdf'),
(24,23,'en','name','Developing efficacy beliefs in the classroom.pdf'),
(25,24,'en','name','Traditions and Trends in the Study of the Commons.pdf'),
(26,25,'en','name','Hansen & Pinto: Reason Reclaimed.pdf'),
(27,26,'en','name','Hansen & Pinto: Reason Reclaimed.pdf'),
(28,27,'en','name','Condensing Water Availability Models to Focus on Specific Water Management Systems.pdf'),
(29,28,'en','name','Condensing Water Availability Models to Focus on Specific Water Management Systems.pdf'),
(30,29,'en','name','Learning Sustainable Design through Service.pdf'),
(31,30,'en','name','Sodium butyrate improves growth performance of weaned piglets during the first period after weaning.pdf'),
(32,31,'en','name','Sodium butyrate improves growth performance of weaned piglets during the first period after weaning.pdf'),
(33,32,'en','name','Hydrologic Connectivity in the Edwards Aquifer between San Marcos Springs and Barton Springs during 2009 Drought Conditions.pdf'),
(34,33,'en','name','Hydrologic Connectivity in the Edwards Aquifer between San Marcos Springs and Barton Springs during 2009 Drought Conditions.pdf'),
(35,34,'en','name','Towards Designing an Intercultural Curriculum: A Case Study from the Atlantic Coast of Nicaragua.pdf'),
(36,35,'en','name','Yam diseases and its management in Nigeria.pdf'),
(37,36,'en','name','Yam diseases and its management in Nigeria.pdf'),
(38,37,'en','name','Influence of long-term nutrition with different dietary fats on fatty acid composition of heavy pigs backfat.pdf'),
(39,38,'en','name','Antimicrobial, heavy metal resistance and plasmid profile of coliforms isolated from nosocomial infections in a hospital in Isfahan, Iran.pdf'),
(40,39,'en','name','Antimicrobial, heavy metal resistance and plasmid profile of coliforms isolated from nosocomial infections in a hospital in Isfahan, Iran.pdf'),
(41,40,'en','name','article.pdf'),
(42,40,'fr_CA','name',''),
(43,41,'en','name','Self-Organization in Multi-Level Institutions in Networked Environments.pdf'),
(44,42,'en','name','Finocchiaro: Arguments About Arguments.pdf'),
(45,43,'en','name','Finocchiaro: Arguments About Arguments.pdf');
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
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='All files associated with a submission, such as those uploaded during submission, as revisions, or by copyeditors or layout editors for production.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `submission_files`
--

LOCK TABLES `submission_files` WRITE;
/*!40000 ALTER TABLE `submission_files` DISABLE KEYS */;
INSERT INTO `submission_files` VALUES
(1,1,1,NULL,1,2,NULL,NULL,NULL,'2024-12-27 05:24:34','2024-12-27 05:24:34',17,NULL,NULL),
(2,1,2,NULL,12,2,NULL,NULL,NULL,'2024-12-27 05:24:35','2024-12-27 05:24:36',17,NULL,NULL),
(3,1,3,NULL,7,2,NULL,NULL,NULL,'2024-12-27 05:24:36','2024-12-27 05:24:37',17,NULL,NULL),
(4,1,4,NULL,7,2,NULL,NULL,NULL,'2024-12-27 05:24:37','2024-12-27 05:24:38',17,NULL,NULL),
(5,1,5,NULL,12,2,NULL,NULL,NULL,'2024-12-27 05:24:38','2024-12-27 05:24:39',17,NULL,NULL),
(7,1,5,5,12,4,NULL,NULL,NULL,'2024-12-27 05:25:18','2024-12-27 05:25:18',17,523,1),
(8,1,4,4,7,4,NULL,NULL,NULL,'2024-12-27 05:25:18','2024-12-27 05:25:18',17,523,1),
(9,1,3,3,7,4,NULL,NULL,NULL,'2024-12-27 05:25:18','2024-12-27 05:25:18',17,523,1),
(10,1,2,2,12,4,NULL,NULL,NULL,'2024-12-27 05:25:18','2024-12-27 05:25:18',17,523,1),
(11,1,1,1,1,4,NULL,NULL,NULL,'2024-12-27 05:25:18','2024-12-27 05:25:18',17,523,1),
(12,1,7,NULL,1,10,NULL,NULL,NULL,'2024-12-27 05:27:19','2024-12-27 05:27:19',3,521,1),
(13,2,8,NULL,1,2,NULL,NULL,NULL,'2024-12-27 05:28:53','2024-12-27 05:28:53',18,NULL,NULL),
(14,2,8,13,1,4,NULL,NULL,NULL,'2024-12-27 05:29:00','2024-12-27 05:29:00',18,523,2),
(15,3,9,NULL,1,2,NULL,NULL,NULL,'2024-12-27 05:29:27','2024-12-27 05:29:27',19,NULL,NULL),
(16,3,9,15,1,4,NULL,NULL,NULL,'2024-12-27 05:29:34','2024-12-27 05:29:34',19,523,3),
(17,4,10,NULL,1,2,NULL,NULL,NULL,'2024-12-27 05:29:56','2024-12-27 05:29:56',20,NULL,NULL),
(18,5,11,NULL,1,2,NULL,NULL,NULL,'2024-12-27 05:30:06','2024-12-27 05:30:06',21,NULL,NULL),
(19,5,11,18,1,4,NULL,NULL,NULL,'2024-12-27 05:30:13','2024-12-27 05:30:13',21,523,4),
(20,6,12,NULL,1,2,NULL,NULL,NULL,'2024-12-27 05:30:47','2024-12-27 05:30:48',22,NULL,NULL),
(21,6,12,20,1,4,NULL,NULL,NULL,'2024-12-27 05:30:55','2024-12-27 05:30:55',22,523,5),
(22,7,13,NULL,1,2,NULL,NULL,NULL,'2024-12-27 05:31:26','2024-12-27 05:31:27',23,NULL,NULL),
(23,7,13,22,1,4,NULL,NULL,NULL,'2024-12-27 05:31:34','2024-12-27 05:31:34',23,523,6),
(24,8,14,NULL,1,2,NULL,NULL,NULL,'2024-12-27 05:32:00','2024-12-27 05:32:00',24,NULL,NULL),
(25,9,15,NULL,1,2,NULL,NULL,NULL,'2024-12-27 05:32:10','2024-12-27 05:32:10',25,NULL,NULL),
(26,9,15,25,1,4,NULL,NULL,NULL,'2024-12-27 05:32:18','2024-12-27 05:32:18',25,523,7),
(27,10,16,NULL,1,2,NULL,NULL,NULL,'2024-12-27 05:32:53','2024-12-27 05:32:54',26,NULL,NULL),
(28,10,16,27,1,4,NULL,NULL,NULL,'2024-12-27 05:33:01','2024-12-27 05:33:01',26,523,8),
(29,11,17,NULL,1,2,NULL,NULL,NULL,'2024-12-27 05:33:33','2024-12-27 05:33:33',27,NULL,NULL),
(30,12,18,NULL,1,2,NULL,NULL,NULL,'2024-12-27 05:33:43','2024-12-27 05:33:43',28,NULL,NULL),
(31,12,18,30,1,4,NULL,NULL,NULL,'2024-12-27 05:33:51','2024-12-27 05:33:51',28,523,9),
(32,13,19,NULL,1,2,NULL,NULL,NULL,'2024-12-27 05:34:07','2024-12-27 05:34:08',29,NULL,NULL),
(33,13,19,32,1,4,NULL,NULL,NULL,'2024-12-27 05:34:16','2024-12-27 05:34:16',29,523,10),
(34,14,20,NULL,1,2,NULL,NULL,NULL,'2024-12-27 05:35:13','2024-12-27 05:35:13',30,NULL,NULL),
(35,15,21,NULL,1,2,NULL,NULL,NULL,'2024-12-27 05:35:22','2024-12-27 05:35:23',31,NULL,NULL),
(36,15,21,35,1,4,NULL,NULL,NULL,'2024-12-27 05:35:31','2024-12-27 05:35:31',31,523,11),
(37,16,22,NULL,1,2,NULL,NULL,NULL,'2024-12-27 05:36:06','2024-12-27 05:36:06',32,NULL,NULL),
(38,17,23,NULL,1,2,NULL,NULL,NULL,'2024-12-27 05:36:16','2024-12-27 05:36:16',33,NULL,NULL),
(39,17,23,38,1,4,NULL,NULL,NULL,'2024-12-27 05:36:24','2024-12-27 05:36:24',33,523,12),
(40,17,24,NULL,1,10,NULL,NULL,NULL,'2024-12-27 05:36:59','2024-12-27 05:37:00',3,521,3),
(41,18,25,NULL,1,2,NULL,NULL,NULL,'2024-12-27 05:38:02','2024-12-27 05:38:02',34,NULL,NULL),
(42,19,26,NULL,1,2,NULL,NULL,NULL,'2024-12-27 05:38:22','2024-12-27 05:38:22',35,NULL,NULL),
(43,19,26,42,1,4,NULL,NULL,NULL,'2024-12-27 05:38:31','2024-12-27 05:38:31',35,523,13);
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
) ENGINE=InnoDB AUTO_INCREMENT=115 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='A list of all keywords used in the search index';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `submission_search_keyword_list`
--

LOCK TABLES `submission_search_keyword_list` WRITE;
/*!40000 ALTER TABLE `submission_search_keyword_list` DISABLE KEYS */;
INSERT INTO `submission_search_keyword_list` VALUES
(1,'alan'),
(6,'amina'),
(91,'antibiotics'),
(58,'antimicrobial'),
(4,'cape'),
(99,'cases'),
(98,'clinical'),
(82,'coli'),
(64,'coliforms'),
(77,'compared'),
(95,'concentration'),
(25,'conclusive'),
(27,'conflicting'),
(108,'conjugative'),
(104,'consistent'),
(45,'continuous'),
(40,'corporate'),
(44,'decisions'),
(51,'development'),
(92,'difference'),
(43,'distribution'),
(33,'dividend'),
(12,'dividends'),
(31,'economists'),
(15,'empirical'),
(109,'encoding'),
(73,'enterobacteriacea'),
(81,'escherichia'),
(49,'evaluation'),
(16,'evidence'),
(36,'existing'),
(76,'faeces'),
(78,'fifteen'),
(30,'financial'),
(42,'financing'),
(22,'firm'),
(46,'function'),
(20,'future'),
(106,'group'),
(34,'guidance'),
(74,'healthy'),
(59,'heavy'),
(68,'hospital'),
(75,'human'),
(80,'identified'),
(29,'implications'),
(113,'infection'),
(67,'infections'),
(94,'inhibitory'),
(48,'intuitive'),
(41,'investment'),
(38,'investors'),
(70,'iran'),
(69,'isfahan'),
(65,'isolated'),
(79,'isolates'),
(26,'issue'),
(56,'karbasizaed'),
(84,'kelebsiella'),
(14,'literature'),
(35,'management'),
(7,'mansour'),
(60,'metal'),
(100,'metals'),
(96,'mic'),
(93,'minimal'),
(112,'multidrug'),
(90,'multiple'),
(2,'mwandenga'),
(8,'nicolas'),
(66,'nosocomial'),
(24,'offer'),
(107,'pattern'),
(71,'patterns'),
(87,'percent'),
(103,'persons'),
(62,'plasmid'),
(85,'pneumoniae'),
(28,'policy'),
(89,'possess'),
(37,'potential'),
(32,'practical'),
(50,'professional'),
(63,'profile'),
(72,'profiles'),
(21,'prospects'),
(23,'recent'),
(110,'recovered'),
(114,'region'),
(105,'relationship'),
(47,'rely'),
(83,'remaining'),
(61,'resistance'),
(111,'results'),
(13,'review'),
(9,'riouf'),
(86,'seventy'),
(39,'shareholding'),
(19,'signal'),
(17,'signaling'),
(10,'signalling'),
(101,'significant'),
(52,'social'),
(88,'strains'),
(18,'suggests'),
(57,'tehran'),
(11,'theory'),
(102,'tolerant'),
(5,'town'),
(53,'transformation'),
(3,'university'),
(55,'vajiheh'),
(97,'values'),
(54,'version');
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
) ENGINE=InnoDB AUTO_INCREMENT=741 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='Relationships between search objects and keywords in the search index';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `submission_search_object_keywords`
--

LOCK TABLES `submission_search_object_keywords` WRITE;
/*!40000 ALTER TABLE `submission_search_object_keywords` DISABLE KEYS */;
INSERT INTO `submission_search_object_keywords` VALUES
(251,9,1,0),
(252,9,2,1),
(253,9,3,2),
(254,9,4,3),
(255,9,5,4),
(256,9,6,5),
(257,9,7,6),
(258,9,8,7),
(259,9,9,8),
(260,10,10,0),
(261,10,11,1),
(262,10,12,2),
(263,10,13,3),
(264,10,14,4),
(265,10,15,5),
(266,10,16,6),
(267,11,17,0),
(268,11,11,1),
(269,11,18,2),
(270,11,12,3),
(271,11,19,4),
(272,11,20,5),
(273,11,21,6),
(274,11,22,7),
(275,11,23,8),
(276,11,15,9),
(277,11,16,10),
(278,11,24,11),
(279,11,25,12),
(280,11,16,13),
(281,11,26,14),
(282,11,27,15),
(283,11,28,16),
(284,11,29,17),
(285,11,30,18),
(286,11,31,19),
(287,11,32,20),
(288,11,33,21),
(289,11,28,22),
(290,11,34,23),
(291,11,35,24),
(292,11,36,25),
(293,11,37,26),
(294,11,38,27),
(295,11,39,28),
(296,11,40,29),
(297,11,41,30),
(298,11,42,31),
(299,11,43,32),
(300,11,44,33),
(301,11,45,34),
(302,11,46,35),
(303,11,35,36),
(304,11,33,37),
(305,11,44,38),
(306,11,47,39),
(307,11,48,40),
(308,11,49,41),
(309,13,50,0),
(310,13,51,1),
(311,13,52,2),
(312,13,53,3),
(634,41,55,0),
(635,41,56,1),
(636,41,3,2),
(637,41,57,3),
(638,42,58,0),
(639,42,59,1),
(640,42,60,2),
(641,42,61,3),
(642,42,62,4),
(643,42,63,5),
(644,42,64,6),
(645,42,65,7),
(646,42,66,8),
(647,42,67,9),
(648,42,68,10),
(649,42,69,11),
(650,42,70,12),
(651,43,58,0),
(652,43,59,1),
(653,43,60,2),
(654,43,61,3),
(655,43,71,4),
(656,43,62,5),
(657,43,72,6),
(658,43,64,7),
(659,43,73,8),
(660,43,65,9),
(661,43,66,10),
(662,43,67,11),
(663,43,74,12),
(664,43,75,13),
(665,43,76,14),
(666,43,77,15),
(667,43,78,16),
(668,43,79,17),
(669,43,66,18),
(670,43,67,19),
(671,43,80,20),
(672,43,81,21),
(673,43,82,22),
(674,43,83,23),
(675,43,84,24),
(676,43,85,25),
(677,43,86,26),
(678,43,87,27),
(679,43,88,28),
(680,43,65,29),
(681,43,66,30),
(682,43,67,31),
(683,43,89,32),
(684,43,90,33),
(685,43,61,34),
(686,43,91,35),
(687,43,77,36),
(688,43,88,37),
(689,43,74,38),
(690,43,75,39),
(691,43,76,40),
(692,43,92,41),
(693,43,93,42),
(694,43,94,43),
(695,43,95,44),
(696,43,96,45),
(697,43,97,46),
(698,43,88,47),
(699,43,98,48),
(700,43,99,49),
(701,43,76,50),
(702,43,59,51),
(703,43,100,52),
(704,43,101,53),
(705,43,88,54),
(706,43,65,55),
(707,43,68,56),
(708,43,102,57),
(709,43,59,58),
(710,43,60,59),
(711,43,74,60),
(712,43,103,61),
(713,43,104,62),
(714,43,105,63),
(715,43,62,64),
(716,43,63,65),
(717,43,106,66),
(718,43,58,67),
(719,43,61,68),
(720,43,107,69),
(721,43,108,70),
(722,43,62,71),
(723,43,109,72),
(724,43,61,73),
(725,43,59,74),
(726,43,100,75),
(727,43,91,76),
(728,43,110,77),
(729,43,88,78),
(730,43,65,79),
(731,43,66,80),
(732,43,67,81),
(733,43,111,82),
(734,43,112,83),
(735,43,61,84),
(736,43,64,85),
(737,43,37,86),
(738,43,66,87),
(739,43,113,88),
(740,43,114,89);
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
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='A list of all search objects indexed in the search index';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `submission_search_objects`
--

LOCK TABLES `submission_search_objects` WRITE;
/*!40000 ALTER TABLE `submission_search_objects` DISABLE KEYS */;
INSERT INTO `submission_search_objects` VALUES
(9,1,1,NULL),
(10,1,2,NULL),
(11,1,4,NULL),
(12,1,16,NULL),
(13,1,17,NULL),
(14,1,8,NULL),
(15,1,32,NULL),
(16,1,64,NULL),
(41,17,1,NULL),
(42,17,2,NULL),
(43,17,4,NULL),
(44,17,16,NULL),
(45,17,17,NULL),
(46,17,8,NULL),
(47,17,32,NULL),
(48,17,64,NULL);
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
  `stage_id` bigint(20) NOT NULL DEFAULT 1,
  `locale` varchar(28) DEFAULT NULL,
  `status` smallint(6) NOT NULL DEFAULT 1,
  `submission_progress` varchar(50) NOT NULL DEFAULT 'start',
  `work_type` smallint(6) DEFAULT 0,
  PRIMARY KEY (`submission_id`),
  KEY `submissions_context_id` (`context_id`),
  KEY `submissions_publication_id` (`current_publication_id`),
  CONSTRAINT `submissions_context_id` FOREIGN KEY (`context_id`) REFERENCES `journals` (`journal_id`) ON DELETE CASCADE,
  CONSTRAINT `submissions_publication_id` FOREIGN KEY (`current_publication_id`) REFERENCES `publications` (`publication_id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='All submissions submitted to the context, including incomplete, declined and unpublished submissions.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `submissions`
--

LOCK TABLES `submissions` WRITE;
/*!40000 ALTER TABLE `submissions` DISABLE KEYS */;
INSERT INTO `submissions` VALUES
(1,1,1,'2024-12-27 05:28:41','2024-12-27 05:25:07','2024-12-27 05:25:07',5,'en',3,'',0),
(2,1,3,'2024-12-27 05:29:13','2024-12-27 05:28:54','2024-12-27 05:28:54',3,'en',1,'',0),
(3,1,4,'2024-12-27 05:29:47','2024-12-27 05:29:27','2024-12-27 05:29:27',4,'en',1,'',0),
(4,1,5,'2024-12-27 05:29:58','2024-12-27 05:29:57','2024-12-27 05:29:57',1,'en',1,'',0),
(5,1,6,'2024-12-27 05:30:39','2024-12-27 05:30:07','2024-12-27 05:30:07',5,'en',1,'',0),
(6,1,7,'2024-12-27 05:31:18','2024-12-27 05:30:48','2024-12-27 05:30:48',5,'en',1,'',0),
(7,1,8,'2024-12-27 05:31:51','2024-12-27 05:31:27','2024-12-27 05:31:27',3,'en',1,'',0),
(8,1,9,'2024-12-27 05:32:02','2024-12-27 05:32:01','2024-12-27 05:32:01',1,'en',1,'',0),
(9,1,10,'2024-12-27 05:32:45','2024-12-27 05:32:11','2024-12-27 05:32:11',5,'en',1,'',0),
(10,1,11,'2024-12-27 05:33:24','2024-12-27 05:32:54','2024-12-27 05:32:54',3,'en',1,'',0),
(11,1,12,'2024-12-27 05:33:35','2024-12-27 05:33:34','2024-12-27 05:33:34',1,'en',1,'',0),
(12,1,13,'2024-12-27 05:33:58','2024-12-27 05:33:44','2024-12-27 05:33:44',3,'en',1,'',0),
(13,1,14,'2024-12-27 05:35:01','2024-12-27 05:34:08','2024-12-27 05:34:08',3,'en',1,'',0),
(14,1,15,'2024-12-27 05:35:14','2024-12-27 05:35:14','2024-12-27 05:35:14',1,'en',1,'',0),
(15,1,16,'2024-12-27 05:35:57','2024-12-27 05:35:23','2024-12-27 05:35:23',5,'en',1,'',0),
(16,1,17,'2024-12-27 05:36:07','2024-12-27 05:36:07','2024-12-27 05:36:07',1,'en',1,'',0),
(17,1,18,'2024-12-27 05:37:47','2024-12-27 05:36:16','2024-12-27 05:36:16',5,'en',3,'',0),
(18,1,19,'2024-12-27 05:38:03','2024-12-27 05:38:03','2024-12-27 05:38:03',1,'en',4,'',0),
(19,1,20,'2024-12-27 05:38:48','2024-12-27 05:38:23','2024-12-27 05:38:23',4,'en',1,'',0);
/*!40000 ALTER TABLE `submissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subscription_type_settings`
--

DROP TABLE IF EXISTS `subscription_type_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `subscription_type_settings` (
  `subscription_type_setting_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `type_id` bigint(20) NOT NULL,
  `locale` varchar(28) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` mediumtext DEFAULT NULL,
  `setting_type` varchar(6) NOT NULL,
  PRIMARY KEY (`subscription_type_setting_id`),
  UNIQUE KEY `subscription_type_settings_unique` (`type_id`,`locale`,`setting_name`),
  KEY `subscription_type_settings_type_id` (`type_id`),
  CONSTRAINT `subscription_type_settings_type_id` FOREIGN KEY (`type_id`) REFERENCES `subscription_types` (`type_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='More data about subscription types, including localized properties such as names.';
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
  `cost` decimal(8,2) unsigned NOT NULL,
  `currency_code_alpha` varchar(3) NOT NULL,
  `duration` smallint(6) DEFAULT NULL,
  `format` smallint(6) NOT NULL,
  `institutional` smallint(6) NOT NULL DEFAULT 0,
  `membership` smallint(6) NOT NULL DEFAULT 0,
  `disable_public_display` smallint(6) NOT NULL,
  `seq` double NOT NULL,
  PRIMARY KEY (`type_id`),
  KEY `subscription_types_journal_id` (`journal_id`),
  CONSTRAINT `subscription_types_journal_id` FOREIGN KEY (`journal_id`) REFERENCES `journals` (`journal_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='Subscription types represent the kinds of subscriptions that a user or institution may have, such as an annual subscription or a discounted subscription.';
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
  `status` smallint(6) NOT NULL DEFAULT 1,
  `membership` varchar(40) DEFAULT NULL,
  `reference_number` varchar(40) DEFAULT NULL,
  `notes` text DEFAULT NULL,
  PRIMARY KEY (`subscription_id`),
  KEY `subscriptions_journal_id` (`journal_id`),
  KEY `subscriptions_user_id` (`user_id`),
  KEY `subscriptions_type_id` (`type_id`),
  CONSTRAINT `subscriptions_journal_id` FOREIGN KEY (`journal_id`) REFERENCES `journals` (`journal_id`) ON DELETE CASCADE,
  CONSTRAINT `subscriptions_type_id` FOREIGN KEY (`type_id`) REFERENCES `subscription_types` (`type_id`) ON DELETE CASCADE,
  CONSTRAINT `subscriptions_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='A list of subscriptions, both institutional and individual, for journals that use subscription-based publishing.';
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
  `load_id` varchar(50) NOT NULL,
  PRIMARY KEY (`usage_stats_temp_total_id`),
  KEY `usage_stats_total_temporary_records_issue_id` (`issue_id`),
  KEY `usage_stats_total_temporary_records_issue_galley_id` (`issue_galley_id`),
  KEY `usage_stats_total_temporary_records_context_id` (`context_id`),
  KEY `usage_stats_total_temporary_records_submission_id` (`submission_id`),
  KEY `usage_stats_total_temporary_records_representation_id` (`representation_id`),
  KEY `usage_stats_total_temporary_records_submission_file_id` (`submission_file_id`),
  KEY `ust_load_id_context_id_ip` (`load_id`,`context_id`,`ip`),
  CONSTRAINT `ust_context_id_foreign` FOREIGN KEY (`context_id`) REFERENCES `journals` (`journal_id`) ON DELETE CASCADE,
  CONSTRAINT `ust_issue_galley_id_foreign` FOREIGN KEY (`issue_galley_id`) REFERENCES `issue_galleys` (`galley_id`) ON DELETE CASCADE,
  CONSTRAINT `ust_issue_id_foreign` FOREIGN KEY (`issue_id`) REFERENCES `issues` (`issue_id`) ON DELETE CASCADE,
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
  CONSTRAINT `usii_context_id_foreign` FOREIGN KEY (`context_id`) REFERENCES `journals` (`journal_id`) ON DELETE CASCADE,
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
  CONSTRAINT `usir_context_id_foreign` FOREIGN KEY (`context_id`) REFERENCES `journals` (`journal_id`) ON DELETE CASCADE,
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
) ENGINE=InnoDB AUTO_INCREMENT=103 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='More data about user groups, including localized properties such as the name.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_group_settings`
--

LOCK TABLES `user_group_settings` WRITE;
/*!40000 ALTER TABLE `user_group_settings` DISABLE KEYS */;
INSERT INTO `user_group_settings` VALUES
(1,2,'','nameLocaleKey','default.groups.name.manager'),
(2,2,'','abbrevLocaleKey','default.groups.abbrev.manager'),
(3,2,'en','name','Journal manager'),
(4,2,'en','abbrev','JM'),
(5,2,'fr_CA','name','Directeur-trice de la revue'),
(6,2,'fr_CA','abbrev','DIR'),
(7,3,'','nameLocaleKey','default.groups.name.editor'),
(8,3,'','abbrevLocaleKey','default.groups.abbrev.editor'),
(9,3,'en','name','Journal editor'),
(10,3,'en','abbrev','JE'),
(11,3,'fr_CA','name','Rédacteur-trice'),
(12,3,'fr_CA','abbrev','RÉD'),
(13,4,'','nameLocaleKey','default.groups.name.productionEditor'),
(14,4,'','abbrevLocaleKey','default.groups.abbrev.productionEditor'),
(15,4,'en','name','Production editor'),
(16,4,'en','abbrev','ProdE'),
(17,4,'fr_CA','name','Directeur-trice de production'),
(18,4,'fr_CA','abbrev','DirProd'),
(19,5,'','nameLocaleKey','default.groups.name.sectionEditor'),
(20,5,'','abbrevLocaleKey','default.groups.abbrev.sectionEditor'),
(21,5,'en','name','Section editor'),
(22,5,'en','abbrev','SecE'),
(23,5,'fr_CA','name','Rédacteur-trice de rubrique'),
(24,5,'fr_CA','abbrev','RÉDRUB'),
(25,6,'','nameLocaleKey','default.groups.name.guestEditor'),
(26,6,'','abbrevLocaleKey','default.groups.abbrev.guestEditor'),
(27,6,'en','name','Guest editor'),
(28,6,'en','abbrev','GE'),
(29,6,'fr_CA','name','Rédacteur-trice invité-e'),
(30,6,'fr_CA','abbrev','RÉDINV'),
(31,7,'','nameLocaleKey','default.groups.name.copyeditor'),
(32,7,'','abbrevLocaleKey','default.groups.abbrev.copyeditor'),
(33,7,'en','name','Copyeditor'),
(34,7,'en','abbrev','CE'),
(35,7,'fr_CA','name','Réviseur-e'),
(36,7,'fr_CA','abbrev','RÉV'),
(37,8,'','nameLocaleKey','default.groups.name.designer'),
(38,8,'','abbrevLocaleKey','default.groups.abbrev.designer'),
(39,8,'en','name','Designer'),
(40,8,'en','abbrev','Design'),
(41,8,'fr_CA','name','Designer'),
(42,8,'fr_CA','abbrev','Design'),
(43,9,'','nameLocaleKey','default.groups.name.funding'),
(44,9,'','abbrevLocaleKey','default.groups.abbrev.funding'),
(45,9,'en','name','Funding coordinator'),
(46,9,'en','abbrev','FC'),
(47,9,'fr_CA','name','Coordonnateur-trice du financement'),
(48,9,'fr_CA','abbrev','CF'),
(49,10,'','nameLocaleKey','default.groups.name.indexer'),
(50,10,'','abbrevLocaleKey','default.groups.abbrev.indexer'),
(51,10,'en','name','Indexer'),
(52,10,'en','abbrev','IND'),
(53,10,'fr_CA','name','Indexeur-e'),
(54,10,'fr_CA','abbrev','Indx'),
(55,11,'','nameLocaleKey','default.groups.name.layoutEditor'),
(56,11,'','abbrevLocaleKey','default.groups.abbrev.layoutEditor'),
(57,11,'en','name','Layout Editor'),
(58,11,'en','abbrev','LE'),
(59,11,'fr_CA','name','Responsable de la mise en page'),
(60,11,'fr_CA','abbrev','RespMP'),
(61,12,'','nameLocaleKey','default.groups.name.marketing'),
(62,12,'','abbrevLocaleKey','default.groups.abbrev.marketing'),
(63,12,'en','name','Marketing and sales coordinator'),
(64,12,'en','abbrev','MS'),
(65,12,'fr_CA','name','Coordonnateur-trice des ventes et du marketing'),
(66,12,'fr_CA','abbrev','CVM'),
(67,13,'','nameLocaleKey','default.groups.name.proofreader'),
(68,13,'','abbrevLocaleKey','default.groups.abbrev.proofreader'),
(69,13,'en','name','Proofreader'),
(70,13,'en','abbrev','PR'),
(71,13,'fr_CA','name','Correcteur-trice d\'épreuves'),
(72,13,'fr_CA','abbrev','CorEp'),
(73,14,'','nameLocaleKey','default.groups.name.author'),
(74,14,'','abbrevLocaleKey','default.groups.abbrev.author'),
(75,14,'en','name','Author'),
(76,14,'en','abbrev','AU'),
(77,14,'fr_CA','name','Auteur-e'),
(78,14,'fr_CA','abbrev','AU'),
(79,15,'','nameLocaleKey','default.groups.name.translator'),
(80,15,'','abbrevLocaleKey','default.groups.abbrev.translator'),
(81,15,'en','name','Translator'),
(82,15,'en','abbrev','Trans'),
(83,15,'fr_CA','name','Traducteur-trice'),
(84,15,'fr_CA','abbrev','Trad'),
(85,16,'','nameLocaleKey','default.groups.name.externalReviewer'),
(86,16,'','abbrevLocaleKey','default.groups.abbrev.externalReviewer'),
(87,16,'en','name','Reviewer'),
(88,16,'en','abbrev','R'),
(89,16,'fr_CA','name','Évaluateur-trice'),
(90,16,'fr_CA','abbrev','ÉVAL'),
(91,17,'','nameLocaleKey','default.groups.name.reader'),
(92,17,'','abbrevLocaleKey','default.groups.abbrev.reader'),
(93,17,'en','name','Reader'),
(94,17,'en','abbrev','Read'),
(95,17,'fr_CA','name','Lecteur-trice'),
(96,17,'fr_CA','abbrev','Lect'),
(97,18,'','nameLocaleKey','default.groups.name.subscriptionManager'),
(98,18,'','abbrevLocaleKey','default.groups.abbrev.subscriptionManager'),
(99,18,'en','name','Subscription Manager'),
(100,18,'en','abbrev','SubM'),
(101,18,'fr_CA','name','Responsable des abonnements'),
(102,18,'fr_CA','abbrev','RespAB');
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
  CONSTRAINT `user_group_stage_context_id` FOREIGN KEY (`context_id`) REFERENCES `journals` (`journal_id`) ON DELETE CASCADE,
  CONSTRAINT `user_group_stage_user_group_id` FOREIGN KEY (`user_group_id`) REFERENCES `user_groups` (`user_group_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='Which stages of the editorial workflow the user_groups can access.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_group_stage`
--

LOCK TABLES `user_group_stage` WRITE;
/*!40000 ALTER TABLE `user_group_stage` DISABLE KEYS */;
INSERT INTO `user_group_stage` VALUES
(1,1,3,1),
(2,1,3,3),
(3,1,3,4),
(4,1,3,5),
(5,1,4,4),
(6,1,4,5),
(7,1,5,1),
(8,1,5,3),
(9,1,5,4),
(10,1,5,5),
(11,1,6,1),
(12,1,6,3),
(13,1,6,4),
(14,1,6,5),
(15,1,7,4),
(16,1,8,5),
(17,1,9,1),
(18,1,9,3),
(19,1,10,5),
(20,1,11,5),
(21,1,12,4),
(22,1,13,5),
(23,1,14,1),
(24,1,14,3),
(25,1,14,4),
(26,1,14,5),
(27,1,15,1),
(28,1,15,3),
(29,1,15,4),
(30,1,15,5),
(31,1,16,3);
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
  CONSTRAINT `user_groups_context_id` FOREIGN KEY (`context_id`) REFERENCES `journals` (`journal_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='All defined user roles in a context, such as Author, Reviewer, Section Editor and Journal Manager.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_groups`
--

LOCK TABLES `user_groups` WRITE;
/*!40000 ALTER TABLE `user_groups` DISABLE KEYS */;
INSERT INTO `user_groups` VALUES
(1,NULL,1,1,1,0,0,1,0),
(2,1,16,1,1,0,1,1,0),
(3,1,16,1,1,0,1,1,1),
(4,1,16,1,1,0,1,1,0),
(5,1,17,1,1,0,1,0,1),
(6,1,17,1,1,0,0,0,0),
(7,1,4097,1,1,0,0,0,0),
(8,1,4097,1,1,0,0,0,0),
(9,1,4097,1,1,0,0,0,0),
(10,1,4097,1,1,0,0,0,0),
(11,1,4097,1,1,0,0,0,0),
(12,1,4097,1,1,0,0,0,0),
(13,1,4097,1,1,0,0,0,0),
(14,1,65536,1,1,1,0,0,0),
(15,1,65536,1,1,0,0,0,0),
(16,1,4096,1,1,1,0,0,1),
(17,1,1048576,1,1,1,0,0,0),
(18,1,2097152,1,1,0,0,0,0);
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
) ENGINE=InnoDB AUTO_INCREMENT=150 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='More data about users, including localized properties like their name and affiliation.';
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
(33,7,'en','affiliation','Utrecht University'),
(34,7,'fr_CA','affiliation','Netherlands'),
(35,7,'en','familyName','Janssen'),
(36,7,'fr_CA','familyName','Janssen'),
(37,7,'en','givenName','Julie'),
(38,7,'fr_CA','givenName','Julie'),
(39,8,'en','affiliation','McGill University'),
(40,8,'fr_CA','affiliation','Canada'),
(41,8,'en','familyName','Hudson'),
(42,8,'fr_CA','familyName','Hudson'),
(43,8,'en','givenName','Paul'),
(44,8,'fr_CA','givenName','Paul'),
(45,9,'en','affiliation','University of Manitoba'),
(46,9,'fr_CA','affiliation','Canada'),
(47,9,'en','familyName','McCrae'),
(48,9,'fr_CA','familyName','McCrae'),
(49,9,'en','givenName','Aisla'),
(50,9,'fr_CA','givenName','Aisla'),
(51,10,'en','affiliation','State University of New York'),
(52,10,'fr_CA','affiliation','United States'),
(53,10,'en','familyName','Gallego'),
(54,10,'fr_CA','familyName','Gallego'),
(55,10,'en','givenName','Adela'),
(56,10,'fr_CA','givenName','Adela'),
(57,11,'en','affiliation','Ghent University'),
(58,11,'fr_CA','affiliation','Belgium'),
(59,11,'en','familyName','Fritz'),
(60,11,'fr_CA','familyName','Fritz'),
(61,11,'en','givenName','Maria'),
(62,11,'fr_CA','givenName','Maria'),
(63,12,'en','affiliation','Universidad de Chile'),
(64,12,'fr_CA','affiliation','Chile'),
(65,12,'en','familyName','Vogt'),
(66,12,'fr_CA','familyName','Vogt'),
(67,12,'en','givenName','Sarah'),
(68,12,'fr_CA','givenName','Sarah'),
(69,13,'en','affiliation','Duke University'),
(70,13,'fr_CA','affiliation','United States'),
(71,13,'en','familyName','Cox'),
(72,13,'fr_CA','familyName','Cox'),
(73,13,'en','givenName','Graham'),
(74,13,'fr_CA','givenName','Graham'),
(75,14,'en','affiliation','University of Cape Town'),
(76,14,'fr_CA','affiliation','South Africa'),
(77,14,'en','familyName','Hellier'),
(78,14,'fr_CA','familyName','Hellier'),
(79,14,'en','givenName','Stephen'),
(80,14,'fr_CA','givenName','Stephen'),
(81,15,'en','affiliation','Imperial College London'),
(82,15,'fr_CA','affiliation','United Kingdom'),
(83,15,'en','familyName','Turner'),
(84,15,'fr_CA','familyName','Turner'),
(85,15,'en','givenName','Catherine'),
(86,15,'fr_CA','givenName','Catherine'),
(87,16,'en','affiliation','National University of Singapore'),
(88,16,'fr_CA','affiliation','Singapore'),
(89,16,'en','familyName','Kumar'),
(90,16,'fr_CA','familyName','Kumar'),
(91,16,'en','givenName','Sabine'),
(92,16,'fr_CA','givenName','Sabine'),
(93,17,'en','affiliation','University of Cape Town'),
(94,17,'en','familyName','Mwandenga'),
(95,17,'en','givenName','Alan'),
(96,18,'en','affiliation','University of Bologna'),
(97,18,'en','familyName','Corino'),
(98,18,'en','givenName','Carlo'),
(99,19,'en','affiliation','University of Windsor'),
(100,19,'en','familyName','Kwantes'),
(101,19,'en','givenName','Catherine'),
(102,20,'en','affiliation','University of Alberta'),
(103,20,'en','familyName','Montgomerie'),
(104,20,'en','givenName','Craig'),
(105,21,'en','affiliation','Alexandria University'),
(106,21,'en','familyName','Diouf'),
(107,21,'en','givenName','Diaga'),
(108,22,'en','affiliation','University of Toronto'),
(109,22,'en','familyName','Phillips'),
(110,22,'en','givenName','Dana'),
(111,23,'en','affiliation','University College Cork'),
(112,23,'en','familyName','Sokoloff'),
(113,23,'en','givenName','Domatilia'),
(114,24,'en','affiliation','Indiana University'),
(115,24,'en','familyName','Ostrom'),
(116,24,'en','givenName','Elinor'),
(117,25,'en','affiliation','University of Rome'),
(118,25,'en','familyName','Paglieri'),
(119,25,'en','givenName','Fabio'),
(120,26,'en','affiliation','Aalborg University'),
(121,26,'en','familyName','Novak'),
(122,26,'en','givenName','John'),
(123,27,'en','affiliation','Stanford University'),
(124,27,'en','familyName','Al-Khafaji'),
(125,27,'en','givenName','Karim'),
(126,28,'en','affiliation','Australian National University'),
(127,28,'en','familyName','Christopher'),
(128,28,'en','givenName','Leo'),
(129,29,'en','affiliation','University of Cape Town'),
(130,29,'en','familyName','Kumiega'),
(131,29,'en','givenName','Lise'),
(132,30,'en','affiliation','University of Wolverhampton'),
(133,30,'en','familyName','Daniel'),
(134,30,'en','givenName','Patricia'),
(135,31,'en','affiliation','University of Nairobi'),
(136,31,'en','familyName','Baiyewu'),
(137,31,'en','givenName','Rana'),
(138,32,'en','affiliation','Barcelona University'),
(139,32,'en','familyName','Rossi'),
(140,32,'en','givenName','Rosanna'),
(141,33,'en','affiliation','University of Tehran'),
(142,33,'en','familyName','Karbasizaed'),
(143,33,'en','givenName','Vajiheh'),
(144,34,'en','affiliation','University of Windsor'),
(145,34,'en','familyName','Williamson'),
(146,34,'en','givenName','Valerie'),
(147,35,'en','affiliation','CUNY'),
(148,35,'en','familyName','Woods'),
(149,35,'en','givenName','Zita');
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
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='Maps users to their assigned user_groups.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_user_groups`
--

LOCK TABLES `user_user_groups` WRITE;
/*!40000 ALTER TABLE `user_user_groups` DISABLE KEYS */;
INSERT INTO `user_user_groups` VALUES
(1,1,1,'2024-12-27 05:15:13',NULL,NULL),
(2,2,1,NULL,NULL,NULL),
(3,2,2,'2024-12-27 00:00:00',NULL,1),
(4,3,3,'2024-12-27 00:00:00',NULL,1),
(5,5,4,'2024-12-27 00:00:00',NULL,1),
(6,5,5,'2024-12-27 00:00:00',NULL,1),
(7,5,6,'2024-12-27 00:00:00',NULL,1),
(8,16,7,'2024-12-27 00:00:00',NULL,1),
(9,16,8,'2024-12-27 00:00:00',NULL,1),
(10,16,9,'2024-12-27 00:00:00',NULL,1),
(11,16,10,'2024-12-27 00:00:00',NULL,1),
(12,7,11,'2024-12-27 00:00:00',NULL,1),
(13,7,12,'2024-12-27 00:00:00',NULL,1),
(14,11,13,'2024-12-27 00:00:00',NULL,1),
(15,11,14,'2024-12-27 00:00:00',NULL,1),
(16,13,15,'2024-12-27 00:00:00',NULL,1),
(17,13,16,'2024-12-27 00:00:00',NULL,1),
(18,17,17,'2024-12-27 05:24:20',NULL,NULL),
(19,14,17,'2024-12-27 05:24:24',NULL,NULL),
(20,17,18,'2024-12-27 05:28:49',NULL,NULL),
(21,14,18,'2024-12-27 05:28:51',NULL,NULL),
(22,17,19,'2024-12-27 05:29:22',NULL,NULL),
(23,14,19,'2024-12-27 05:29:24',NULL,NULL),
(24,17,20,'2024-12-27 05:29:52',NULL,NULL),
(25,14,20,'2024-12-27 05:29:54',NULL,NULL),
(26,17,21,'2024-12-27 05:30:02',NULL,NULL),
(27,14,21,'2024-12-27 05:30:04',NULL,NULL),
(28,17,22,'2024-12-27 05:30:43',NULL,NULL),
(29,14,22,'2024-12-27 05:30:45',NULL,NULL),
(30,17,23,'2024-12-27 05:31:22',NULL,NULL),
(31,14,23,'2024-12-27 05:31:24',NULL,NULL),
(32,17,24,'2024-12-27 05:31:56',NULL,NULL),
(33,14,24,'2024-12-27 05:31:58',NULL,NULL),
(34,17,25,'2024-12-27 05:32:06',NULL,NULL),
(35,14,25,'2024-12-27 05:32:08',NULL,NULL),
(36,17,26,'2024-12-27 05:32:49',NULL,NULL),
(37,14,26,'2024-12-27 05:32:51',NULL,NULL),
(38,17,27,'2024-12-27 05:33:29',NULL,NULL),
(39,14,27,'2024-12-27 05:33:31',NULL,NULL),
(40,17,28,'2024-12-27 05:33:39',NULL,NULL),
(41,14,28,'2024-12-27 05:33:41',NULL,NULL),
(42,17,29,'2024-12-27 05:34:03',NULL,NULL),
(43,14,29,'2024-12-27 05:34:05',NULL,NULL),
(44,17,30,'2024-12-27 05:35:09',NULL,NULL),
(45,14,30,'2024-12-27 05:35:11',NULL,NULL),
(46,17,31,'2024-12-27 05:35:18',NULL,NULL),
(47,14,31,'2024-12-27 05:35:20',NULL,NULL),
(48,17,32,'2024-12-27 05:36:02',NULL,NULL),
(49,14,32,'2024-12-27 05:36:04',NULL,NULL),
(50,17,33,'2024-12-27 05:36:11',NULL,NULL),
(51,14,33,'2024-12-27 05:36:13',NULL,NULL),
(52,17,34,'2024-12-27 05:37:58',NULL,NULL),
(53,14,34,'2024-12-27 05:38:00',NULL,NULL),
(54,17,35,'2024-12-27 05:38:18',NULL,NULL),
(55,14,35,'2024-12-27 05:38:20',NULL,NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='All registered users, including authentication data and profile data.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES
(1,'admin','$2y$10$YEbRNb6TdlCMAJiCEFnx.e2d0.fANYeeNgP5TW4z0efwjvWkoR976','pkpadmin@mailinator.com',NULL,NULL,NULL,NULL,NULL,'[]',NULL,NULL,'2024-12-27 05:15:13',NULL,'2024-12-27 05:24:07',NULL,NULL,NULL,0,NULL,1,NULL),
(2,'rvaca','$2y$10$2Y4.QpQnN3LNP86ONN2Rg.IH0PU4qG0OgFr.npsD/zuAG5..znjJ.','rvaca@mailinator.com',NULL,NULL,NULL,NULL,'MX','[]',NULL,NULL,'2024-12-27 05:16:29',NULL,NULL,NULL,NULL,NULL,0,NULL,1,NULL),
(3,'dbarnes','$2y$10$WRyluiQhY2tsm90wfXDQj./W3xxIb8ADS2zgkT7NyC3.aMTFaPkHe','dbarnes@mailinator.com',NULL,NULL,NULL,NULL,'AU','[]',NULL,NULL,'2024-12-27 05:16:49',NULL,'2024-12-27 05:38:24',NULL,NULL,NULL,0,NULL,1,NULL),
(4,'dbuskins','$2y$10$dsgAAltouwzcYTj5ft4aZO3zBE1wlOemUkXK0gMp81/Z.vdoGNfx2','dbuskins@mailinator.com',NULL,NULL,NULL,NULL,'US','[]',NULL,NULL,'2024-12-27 05:17:10',NULL,NULL,NULL,NULL,NULL,0,NULL,1,NULL),
(5,'sberardo','$2y$10$BjNNJ2mq9QlveJ4sVF1/.OoqJIn5tXwG3WOmGOwOEvzpiW22EGBCS','sberardo@mailinator.com',NULL,NULL,NULL,NULL,'CA','[]',NULL,NULL,'2024-12-27 05:17:33',NULL,NULL,NULL,NULL,NULL,0,NULL,1,NULL),
(6,'minoue','$2y$10$GY.pkjXh0.bY8mvgTxAlA.EXftUkL1NA4RzKfxWQi8bUNPYmQn7O2','minoue@mailinator.com',NULL,NULL,NULL,NULL,'JP','[]',NULL,NULL,'2024-12-27 05:17:57',NULL,'2024-12-27 05:29:08',NULL,NULL,NULL,0,NULL,1,NULL),
(7,'jjanssen','$2y$10$YXq/hAdBvPzkny6NiNyyxOj8IGP0dKwCZi2K21WHgzmqWxgiGiSn6','jjanssen@mailinator.com',NULL,NULL,NULL,NULL,'NL','[]',NULL,NULL,'2024-12-27 05:18:21',NULL,'2024-12-27 05:34:26',NULL,NULL,NULL,0,NULL,1,NULL),
(8,'phudson','$2y$10$yfSaUeRukxupOGr3uGL53e1kpiR3jP/o8W.vAIboMN3QvxZVtjX2q','phudson@mailinator.com',NULL,NULL,NULL,NULL,'CA','[]',NULL,NULL,'2024-12-27 05:18:48',NULL,'2024-12-27 05:31:44',NULL,NULL,NULL,0,NULL,1,NULL),
(9,'amccrae','$2y$10$cRMjFYXAvaQgHNOY65qol.1qR2YUagwEktUYVlN1cMiRXRAvkuMci','amccrae@mailinator.com',NULL,NULL,NULL,NULL,'CA','[]',NULL,NULL,'2024-12-27 05:19:16',NULL,'2024-12-27 05:34:34',NULL,NULL,NULL,0,NULL,1,NULL),
(10,'agallego','$2y$10$EVgBNMBAoVPM1UXKqpQgIuUa4PXnMR3s7aJ7BqO9uyfi5KxRNvIKW','agallego@mailinator.com',NULL,NULL,NULL,NULL,'US','[]',NULL,NULL,'2024-12-27 05:19:46',NULL,'2024-12-27 05:34:42',NULL,NULL,NULL,0,NULL,1,NULL),
(11,'mfritz','$2y$10$EdftwhUqzx/cAi.HE8eV4umHgv6QotmRTngmtFOww3A7EooiQRXoq','mfritz@mailinator.com',NULL,NULL,NULL,NULL,'BE','[]',NULL,NULL,'2024-12-27 05:20:18',NULL,NULL,NULL,NULL,NULL,0,NULL,1,NULL),
(12,'svogt','$2y$10$VhtahI/lLdmkuc5iF5YB/OCjXDfv/wq7mDayI220lZv56bqP9vV9G','svogt@mailinator.com',NULL,NULL,NULL,NULL,'CL','[]',NULL,NULL,'2024-12-27 05:20:52',NULL,NULL,NULL,NULL,NULL,0,NULL,1,NULL),
(13,'gcox','$2y$10$5e28vXkEircPNUx5VmQFyetfWnBXFZxL/xc1kfVLKnUr83XVnQ6gS','gcox@mailinator.com',NULL,NULL,NULL,NULL,'US','[]',NULL,NULL,'2024-12-27 05:21:28',NULL,NULL,NULL,NULL,NULL,0,NULL,1,NULL),
(14,'shellier','$2y$10$vrkh8H3lZv3SScxM2.N38edotjk92LRHaXkl8cdVdbc8w52c8KAQy','shellier@mailinator.com',NULL,NULL,NULL,NULL,'ZA','[]',NULL,NULL,'2024-12-27 05:22:06',NULL,NULL,NULL,NULL,NULL,0,NULL,1,NULL),
(15,'cturner','$2y$10$oWHJmZfY60.122Qikw61Ceck7ZNYxf99GKTnCJD5ECGNr6jq.0HeO','cturner@mailinator.com',NULL,NULL,NULL,NULL,'GB','[]',NULL,NULL,'2024-12-27 05:22:46',NULL,NULL,NULL,NULL,NULL,0,NULL,1,NULL),
(16,'skumar','$2y$10$W3Qd2o82ObcOvagfu2ylpeaqUEYZHS7GEH0CzwzJkNmyw2ZYD.PK6','skumar@mailinator.com',NULL,NULL,NULL,NULL,'SG','[]',NULL,NULL,'2024-12-27 05:23:30',NULL,NULL,NULL,NULL,NULL,0,NULL,1,NULL),
(17,'amwandenga','$2y$10$69w9ahGFIuC6zaS.Kr9H5uSccT7aSgfHwD4BGUKheVvAhun5W8egm','amwandenga@mailinator.com',NULL,NULL,NULL,NULL,'ZA','[]',NULL,NULL,'2024-12-27 05:24:20',NULL,'2024-12-27 05:27:31',NULL,NULL,NULL,0,NULL,1,NULL),
(18,'ccorino','$2y$10$rHoNk.ptHDOMgXKnBzImVuSHvJoyYBBWFzQOvtjYuhNVqEjjn4Rge','ccorino@mailinator.com',NULL,NULL,NULL,NULL,'IT','[]',NULL,NULL,'2024-12-27 05:28:48',NULL,'2024-12-27 05:28:49',NULL,NULL,NULL,0,NULL,1,NULL),
(19,'ckwantes','$2y$10$F5vLWBAxFdykpWPVjS4J3ukzxgYBVJUB2fC1uGgAr8NJuLT6IkGR6','ckwantes@mailinator.com',NULL,NULL,NULL,NULL,'CA','[]',NULL,NULL,'2024-12-27 05:29:22',NULL,'2024-12-27 05:29:22',NULL,NULL,NULL,0,NULL,1,NULL),
(20,'cmontgomerie','$2y$10$7wfS62sBVEzvXMMjuFGS/.oZ7phASMJBwsIdCR1b8othEL0R128t2','cmontgomerie@mailinator.com',NULL,NULL,NULL,NULL,'CA','[]',NULL,NULL,'2024-12-27 05:29:52',NULL,'2024-12-27 05:29:52',NULL,NULL,NULL,0,NULL,1,NULL),
(21,'ddiouf','$2y$10$EcdrVz18/Ua0ljglX8chuu9aa5wT0aNlQFiRR9Wwd10y2mWmQeN1K','ddiouf@mailinator.com',NULL,NULL,NULL,NULL,'EG','[]',NULL,NULL,'2024-12-27 05:30:02',NULL,'2024-12-27 05:30:02',NULL,NULL,NULL,0,NULL,1,NULL),
(22,'dphillips','$2y$10$672ZtBEucyV3ek8Ojd54KOc7LQnsebaDTtLuJJUoAzxAzxI7p/eUu','dphillips@mailinator.com',NULL,NULL,NULL,NULL,'CA','[]',NULL,NULL,'2024-12-27 05:30:43',NULL,'2024-12-27 05:30:43',NULL,NULL,NULL,0,NULL,1,NULL),
(23,'dsokoloff','$2y$10$JMMGz5WXC90QL6A36pqF4.Cd6Kn3F4TL3w.aXYkdq8O5OoJrBflnO','dsokoloff@mailinator.com',NULL,NULL,NULL,NULL,'IE','[]',NULL,NULL,'2024-12-27 05:31:22',NULL,'2024-12-27 05:31:22',NULL,NULL,NULL,0,NULL,1,NULL),
(24,'eostrom','$2y$10$t5Do.72N93VezHJji7zIb.g5KqF7cDzXnS/LsmLeo2OqCE/TSb0CC','eostrom@mailinator.com',NULL,NULL,NULL,NULL,'US','[]',NULL,NULL,'2024-12-27 05:31:56',NULL,'2024-12-27 05:31:56',NULL,NULL,NULL,0,NULL,1,NULL),
(25,'fpaglieri','$2y$10$OJZbONFaLQXMZstes1.3He27Nw5VxzwUJueCJNZ9NjPeDRNki/FAW','fpaglieri@mailinator.com',NULL,NULL,NULL,NULL,'IT','[]',NULL,NULL,'2024-12-27 05:32:06',NULL,'2024-12-27 05:32:06',NULL,NULL,NULL,0,NULL,1,NULL),
(26,'jnovak','$2y$10$U0GgL9TbjkK40KFO2GXKtOJJxjFEt9tglMmuEbp3ce7kP7vfhx/JK','jnovak@mailinator.com',NULL,NULL,NULL,NULL,'DK','[]',NULL,NULL,'2024-12-27 05:32:49',NULL,'2024-12-27 05:32:49',NULL,NULL,NULL,0,NULL,1,NULL),
(27,'kalkhafaji','$2y$10$wjFOlu.Fj8nsRlnLwT6wJOTOdpKexKssB2xH/icIp/XBqBDkbx0em','kalkhafaji@mailinator.com',NULL,NULL,NULL,NULL,'US','[]',NULL,NULL,'2024-12-27 05:33:29',NULL,'2024-12-27 05:33:29',NULL,NULL,NULL,0,NULL,1,NULL),
(28,'lchristopher','$2y$10$Eiu4zvMWlFpBgNwprh2oDusN6jCim7ox/Rj9vc6anMUNVccwtFe6.','lchristopher@mailinator.com',NULL,NULL,NULL,NULL,'AU','[]',NULL,NULL,'2024-12-27 05:33:39',NULL,'2024-12-27 05:33:39',NULL,NULL,NULL,0,NULL,1,NULL),
(29,'lkumiega','$2y$10$DFcp/H2khzR2/u8Ba0whHeKYchuUGFxK4R.C.DzX76gqFLrzTDZOS','lkumiega@mailinator.com',NULL,NULL,NULL,NULL,'ZA','[]',NULL,NULL,'2024-12-27 05:34:03',NULL,'2024-12-27 05:34:03',NULL,NULL,NULL,0,NULL,1,NULL),
(30,'pdaniel','$2y$10$fQzlZ.aT.5lKJOTrNNzloep3SPSZ1fowzWgNzDtxbkviFKmw2Sdrq','pdaniel@mailinator.com',NULL,NULL,NULL,NULL,'GB','[]',NULL,NULL,'2024-12-27 05:35:08',NULL,'2024-12-27 05:35:09',NULL,NULL,NULL,0,NULL,1,NULL),
(31,'rbaiyewu','$2y$10$vexYqIu4yfBazjNgMhhYuepCa//xb1s.8ZLPotpd9Y84sBtc/ljJS','rbaiyewu@mailinator.com',NULL,NULL,NULL,NULL,'KE','[]',NULL,NULL,'2024-12-27 05:35:18',NULL,'2024-12-27 05:35:18',NULL,NULL,NULL,0,NULL,1,NULL),
(32,'rrossi','$2y$10$eilljHznPUIwVDfPQSlOzu3AKx8np5iwtaQo1V6uO0jIRKGtALFjK','rrossi@mailinator.com',NULL,NULL,NULL,NULL,'ES','[]',NULL,NULL,'2024-12-27 05:36:02',NULL,'2024-12-27 05:36:02',NULL,NULL,NULL,0,NULL,1,NULL),
(33,'vkarbasizaed','$2y$10$cwgDpek6TzGlv6OjoO6oZOlmdGMxXckg4LgmIIYHlQpX89U3N/E5G','vkarbasizaed@mailinator.com',NULL,NULL,NULL,NULL,'IR','[]',NULL,NULL,'2024-12-27 05:36:11',NULL,'2024-12-27 05:36:11',NULL,NULL,NULL,0,NULL,1,NULL),
(34,'vwilliamson','$2y$10$UFFD0KpHdU8yi/7AkTD/.ODh2zhc6T5gQi3VxlsGyG1IKGNGP5Jxe','vwilliamson@mailinator.com',NULL,NULL,NULL,NULL,'CA','[]',NULL,NULL,'2024-12-27 05:37:57',NULL,'2024-12-27 05:37:58',NULL,NULL,NULL,0,NULL,1,NULL),
(35,'zwoods','$2y$10$/8lrqFCQ2imylDsDfNoCDeaSTIHkU56ZyBJkTye9crPxkVE94oDUG','zwoods@mailinator.com',NULL,NULL,NULL,NULL,'US','[]',NULL,NULL,'2024-12-27 05:38:18',NULL,'2024-12-27 05:38:18',NULL,NULL,NULL,0,NULL,1,NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='Describes the installation and upgrade version history for the application and all installed plugins.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `versions`
--

LOCK TABLES `versions` WRITE;
/*!40000 ALTER TABLE `versions` DISABLE KEYS */;
INSERT INTO `versions` VALUES
(1,1,0,0,0,'2024-12-27 05:15:13',1,'plugins.metadata','dc11','',0,0),
(2,1,0,0,0,'2024-12-27 05:15:13',1,'plugins.blocks','languageToggle','LanguageToggleBlockPlugin',1,0),
(3,1,0,1,0,'2024-12-27 05:15:13',1,'plugins.blocks','browse','BrowseBlockPlugin',1,0),
(4,1,0,0,0,'2024-12-27 05:15:13',1,'plugins.blocks','makeSubmission','MakeSubmissionBlockPlugin',1,0),
(5,1,0,0,0,'2024-12-27 05:15:13',1,'plugins.blocks','developedBy','DevelopedByBlockPlugin',1,0),
(6,1,1,0,0,'2024-12-27 05:15:13',1,'plugins.blocks','subscription','SubscriptionBlockPlugin',1,0),
(7,1,0,0,0,'2024-12-27 05:15:13',1,'plugins.blocks','information','InformationBlockPlugin',1,0),
(8,1,0,0,0,'2024-12-27 05:15:13',1,'plugins.gateways','resolver','',0,0),
(9,1,0,0,0,'2024-12-27 05:15:13',1,'plugins.generic','dublinCoreMeta','DublinCoreMetaPlugin',1,0),
(10,0,1,0,0,'2024-12-27 05:15:13',1,'plugins.generic','citationStyleLanguage','CitationStyleLanguagePlugin',1,0),
(11,1,0,1,0,'2024-12-27 05:15:13',1,'plugins.generic','pdfJsViewer','PdfJsViewerPlugin',1,0),
(12,1,0,0,0,'2024-12-27 05:15:13',1,'plugins.generic','googleAnalytics','GoogleAnalyticsPlugin',1,0),
(13,1,2,0,0,'2024-12-27 05:15:13',1,'plugins.generic','staticPages','StaticPagesPlugin',1,0),
(14,1,0,1,0,'2024-12-27 05:15:13',1,'plugins.generic','lensGalley','LensGalleyPlugin',1,0),
(15,1,0,7,2,'2024-12-27 05:15:13',1,'plugins.generic','jatsTemplate','JatsTemplatePlugin',1,0),
(16,1,2,0,0,'2024-12-27 05:15:13',1,'plugins.generic','customBlockManager','CustomBlockManagerPlugin',1,0),
(17,1,0,0,0,'2024-12-27 05:15:13',1,'plugins.generic','announcementFeed','AnnouncementFeedPlugin',1,0),
(18,1,1,0,0,'2024-12-27 05:15:13',1,'plugins.generic','googleScholar','GoogleScholarPlugin',1,0),
(19,2,0,0,0,'2024-12-27 05:15:13',1,'plugins.generic','datacite','',0,0),
(20,1,0,0,0,'2024-12-27 05:15:13',1,'plugins.generic','usageEvent','',0,0),
(21,1,0,0,0,'2024-12-27 05:15:13',1,'plugins.generic','tinymce','TinyMCEPlugin',1,0),
(22,3,0,0,0,'2024-12-27 05:15:13',1,'plugins.generic','crossref','',0,0),
(23,1,0,0,0,'2024-12-27 05:15:13',1,'plugins.generic','driver','DRIVERPlugin',1,0),
(24,1,0,0,0,'2024-12-27 05:15:13',1,'plugins.generic','webFeed','WebFeedPlugin',1,0),
(25,1,0,0,0,'2024-12-27 05:15:13',1,'plugins.generic','htmlArticleGalley','HtmlArticleGalleyPlugin',1,0),
(26,1,0,0,0,'2024-12-27 05:15:13',1,'plugins.generic','recommendBySimilarity','RecommendBySimilarityPlugin',1,1),
(27,1,0,0,1,'2024-12-27 05:15:13',1,'plugins.generic','recommendByAuthor','RecommendByAuthorPlugin',1,1),
(28,1,1,0,0,'2024-12-27 05:15:13',1,'plugins.importexport','doaj','',0,0),
(29,1,0,0,0,'2024-12-27 05:15:13',1,'plugins.importexport','pubmed','',0,0),
(30,1,0,0,0,'2024-12-27 05:15:13',1,'plugins.importexport','native','',0,0),
(31,1,0,0,0,'2024-12-27 05:15:13',1,'plugins.importexport','users','',0,0),
(32,1,0,0,0,'2024-12-27 05:15:13',1,'plugins.oaiMetadataFormats','dc','',0,0),
(33,1,0,0,0,'2024-12-27 05:15:13',1,'plugins.oaiMetadataFormats','marcxml','',0,0),
(34,1,0,5,1,'2024-12-27 05:15:13',1,'plugins.oaiMetadataFormats','oaiJats','',0,0),
(35,1,0,0,0,'2024-12-27 05:15:13',1,'plugins.oaiMetadataFormats','rfc1807','',0,0),
(36,1,0,0,0,'2024-12-27 05:15:13',1,'plugins.oaiMetadataFormats','marc','',0,0),
(37,1,0,0,0,'2024-12-27 05:15:13',1,'plugins.paymethod','manual','',0,0),
(38,1,0,0,0,'2024-12-27 05:15:13',1,'plugins.paymethod','paypal','',0,0),
(39,1,0,0,0,'2024-12-27 05:15:13',1,'plugins.pubIds','urn','URNPubIdPlugin',1,0),
(40,1,0,0,0,'2024-12-27 05:15:13',1,'plugins.reports','articles','',0,0),
(41,2,0,1,0,'2024-12-27 05:15:13',1,'plugins.reports','reviewReport','',0,0),
(42,1,1,0,0,'2024-12-27 05:15:13',1,'plugins.reports','counterReport','',0,0),
(43,1,0,0,0,'2024-12-27 05:15:13',1,'plugins.reports','subscriptions','',0,0),
(44,1,0,0,0,'2024-12-27 05:15:13',1,'plugins.themes','default','DefaultThemePlugin',1,0),
(45,3,5,0,0,'2024-12-27 05:15:08',1,'core','ojs2','',0,1);
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

-- Dump completed on 2024-12-27  5:38:49
