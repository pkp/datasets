/*M!999999\- enable the sandbox mode */ 
-- MariaDB dump 10.19  Distrib 10.11.13-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: ojs-ci
-- ------------------------------------------------------
-- Server version	10.11.13-MariaDB-ubu2404

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
/*!40101 SET character_set_client = utf8mb4 */;
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
/*!40101 SET character_set_client = utf8mb4 */;
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
/*!40101 SET character_set_client = utf8mb4 */;
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
/*!40101 SET character_set_client = utf8mb4 */;
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
-- Table structure for table `author_affiliation_settings`
--

DROP TABLE IF EXISTS `author_affiliation_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `author_affiliation_settings` (
  `author_affiliation_setting_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `author_affiliation_id` bigint(20) NOT NULL,
  `locale` varchar(28) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` mediumtext DEFAULT NULL,
  PRIMARY KEY (`author_affiliation_setting_id`),
  UNIQUE KEY `author_affiliation_settings_unique` (`author_affiliation_id`,`locale`,`setting_name`),
  CONSTRAINT `author_affiliation_settings_author_affiliation_id_foreign` FOREIGN KEY (`author_affiliation_id`) REFERENCES `author_affiliations` (`author_affiliation_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='More data about author affiliations';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `author_affiliation_settings`
--

LOCK TABLES `author_affiliation_settings` WRITE;
/*!40000 ALTER TABLE `author_affiliation_settings` DISABLE KEYS */;
INSERT INTO `author_affiliation_settings` VALUES
(1,1,'en','name','University of Cape Town'),
(2,2,'en','name','University of Cape Town'),
(3,3,'en','name','University of Bologna'),
(4,4,'en','name','University of Windsor'),
(5,5,'en','name','University of Alberta'),
(6,6,'en','name','University of Victoria'),
(7,7,'en','name','Alexandria University'),
(8,8,'en','name','University of Toronto'),
(9,9,'en','name','University College Cork'),
(10,10,'en','name','Indiana University'),
(11,11,'en','name','Indiana University'),
(12,12,'en','name','University of Rome'),
(13,13,'en','name','Aalborg University'),
(14,14,'en','name','Stanford University'),
(15,15,'en','name','Stanford University'),
(16,16,'en','name','Australian National University'),
(17,17,'en','name','University of Cape Town'),
(18,18,'en','name','University of Wolverhampton'),
(19,19,'en','name','University of Nairobi'),
(20,20,'en','name','Barcelona University'),
(21,21,'en','name','University of Tehran'),
(22,22,'en','name','University of Windsor'),
(23,23,'en','name','CUNY'),
(24,24,'en','name','Rajshahi University of Engineering and Technology');
/*!40000 ALTER TABLE `author_affiliation_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `author_affiliations`
--

DROP TABLE IF EXISTS `author_affiliations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `author_affiliations` (
  `author_affiliation_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `author_id` bigint(20) NOT NULL,
  `ror` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`author_affiliation_id`),
  KEY `author_affiliations_ror` (`ror`),
  KEY `author_affiliations_author_id_foreign` (`author_id`),
  CONSTRAINT `author_affiliations_author_id_foreign` FOREIGN KEY (`author_id`) REFERENCES `authors` (`author_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='Author affiliations';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `author_affiliations`
--

LOCK TABLES `author_affiliations` WRITE;
/*!40000 ALTER TABLE `author_affiliations` DISABLE KEYS */;
INSERT INTO `author_affiliations` VALUES
(1,1,NULL),
(2,5,NULL),
(3,8,NULL),
(4,9,NULL),
(5,10,NULL),
(6,11,NULL),
(7,12,NULL),
(8,13,NULL),
(9,14,NULL),
(10,15,NULL),
(11,16,NULL),
(12,17,NULL),
(13,18,NULL),
(14,19,NULL),
(15,20,NULL),
(16,21,NULL),
(17,22,NULL),
(18,23,NULL),
(19,24,NULL),
(20,25,NULL),
(21,26,NULL),
(22,27,NULL),
(23,28,NULL),
(24,29,NULL);
/*!40000 ALTER TABLE `author_affiliations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `author_settings`
--

DROP TABLE IF EXISTS `author_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
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
) ENGINE=InnoDB AUTO_INCREMENT=109 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='More data about authors, including localized properties such as their name and affiliation.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `author_settings`
--

LOCK TABLES `author_settings` WRITE;
/*!40000 ALTER TABLE `author_settings` DISABLE KEYS */;
INSERT INTO `author_settings` VALUES
(1,1,'','country','ZA'),
(2,1,'en','familyName','Mwandenga'),
(3,1,'en','givenName','Alan'),
(6,2,'','country','BB'),
(7,2,'en','familyName','Mansour'),
(8,2,'fr_CA','familyName',NULL),
(9,2,'en','givenName','Amina'),
(10,2,'fr_CA','givenName',NULL),
(22,4,'','country','ZA'),
(23,4,'en','familyName','Riouf'),
(24,4,'en','givenName','Nicolas'),
(25,5,'','country','ZA'),
(26,5,'en','familyName','Mwandenga Version 2'),
(27,5,'en','givenName','Alan'),
(28,6,'','country','BB'),
(29,6,'en','familyName','Mansour'),
(30,6,'en','givenName','Amina'),
(31,7,'','country','ZA'),
(32,7,'en','familyName','Riouf'),
(33,7,'en','givenName','Nicolas'),
(34,8,'','country','IT'),
(35,8,'en','familyName','Corino'),
(36,8,'en','givenName','Carlo'),
(37,9,'','country','CA'),
(38,9,'en','familyName','Kwantes'),
(39,9,'en','givenName','Catherine'),
(40,10,'','country','CA'),
(41,10,'en','familyName','Montgomerie'),
(42,10,'en','givenName','Craig'),
(43,11,'','country','CA'),
(44,11,'en','familyName','Irvine'),
(45,11,'en','givenName','Mark'),
(46,12,'','country','EG'),
(47,12,'en','familyName','Diouf'),
(48,12,'en','givenName','Diaga'),
(49,13,'','country','CA'),
(50,13,'en','familyName','Phillips'),
(51,13,'en','givenName','Dana'),
(52,14,'','country','IE'),
(53,14,'en','familyName','Sokoloff'),
(54,14,'en','givenName','Domatilia'),
(55,15,'','country','US'),
(56,15,'en','familyName','Ostrom'),
(57,15,'en','givenName','Elinor'),
(58,16,'','country','US'),
(59,16,'en','familyName','van Laerhoven'),
(60,16,'en','givenName','Frank'),
(61,17,'','country','IT'),
(62,17,'en','familyName','Paglieri'),
(63,17,'en','givenName','Fabio'),
(64,18,'','country','DK'),
(65,18,'en','familyName','Novak'),
(66,18,'en','givenName','John'),
(67,19,'','country','US'),
(68,19,'en','familyName','Al-Khafaji'),
(69,19,'en','givenName','Karim'),
(70,20,'','country','US'),
(71,20,'en','familyName','Morse'),
(72,20,'en','givenName','Margaret'),
(73,21,'','country','AU'),
(74,21,'en','familyName','Christopher'),
(75,21,'en','givenName','Leo'),
(76,22,'','country','ZA'),
(77,22,'en','familyName','Kumiega'),
(78,22,'en','givenName','Lise'),
(79,23,'','country','GB'),
(80,23,'en','familyName','Daniel'),
(81,23,'en','givenName','Patricia'),
(82,24,'','country','KE'),
(83,24,'en','familyName','Baiyewu'),
(84,24,'en','givenName','Rana'),
(85,25,'','country','ES'),
(86,25,'en','familyName','Rossi'),
(87,25,'en','givenName','Rosanna'),
(88,26,'','country','IR'),
(89,26,'en','familyName','Karbasizaed'),
(90,26,'en','givenName','Vajiheh'),
(91,27,'','country','CA'),
(92,27,'en','familyName','Williamson'),
(93,27,'en','givenName','Valerie'),
(94,28,'','country','US'),
(95,28,'en','familyName','Woods'),
(96,28,'en','givenName','Zita'),
(97,29,'','country','BD'),
(98,29,'en','familyName','Zedd'),
(99,29,'en','givenName','Zayan'),
(100,30,'en','biography',NULL),
(101,30,'fr_CA','biography',NULL),
(102,30,'','country','BD'),
(103,30,'en','familyName','Parvin'),
(104,30,'fr_CA','familyName',NULL),
(105,30,'en','givenName','Nargis'),
(106,30,'fr_CA','givenName',NULL),
(107,30,'en','preferredPublicName',NULL),
(108,30,'fr_CA','preferredPublicName',NULL);
/*!40000 ALTER TABLE `author_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `authors`
--

DROP TABLE IF EXISTS `authors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
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
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='The authors of a publication.';
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
(28,'zwoods@mailinator.com',1,20,0,14),
(29,'zzedd@mailinator.com',1,21,0,14),
(30,'nparvin@mailinator.com',1,21,0,14);
/*!40000 ALTER TABLE `authors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
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
/*!40101 SET character_set_client = utf8mb4 */;
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
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `citation_settings` (
  `citation_setting_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `citation_id` bigint(20) NOT NULL,
  `locale` varchar(28) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` mediumtext DEFAULT NULL,
  `setting_type` varchar(6) DEFAULT NULL,
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
/*!40101 SET character_set_client = utf8mb4 */;
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
/*!40101 SET character_set_client = utf8mb4 */;
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
/*!40101 SET character_set_client = utf8mb4 */;
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
/*!40101 SET character_set_client = utf8mb4 */;
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
) ENGINE=InnoDB AUTO_INCREMENT=72 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='More data about a controlled vocabulary entry, including localized properties such as the actual word or phrase.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `controlled_vocab_entry_settings`
--

LOCK TABLES `controlled_vocab_entry_settings` WRITE;
/*!40000 ALTER TABLE `controlled_vocab_entry_settings` DISABLE KEYS */;
INSERT INTO `controlled_vocab_entry_settings` VALUES
(15,15,'en','name','Professional Development'),
(16,16,'en','name','Social Transformation'),
(27,27,'en','name','Professional Development'),
(28,28,'en','name','Social Transformation'),
(31,31,'en','name','pigs'),
(32,32,'en','name','food security'),
(33,33,'en','name','Professional Development'),
(34,34,'en','name','Social Transformation'),
(35,35,'en','name','employees'),
(36,36,'en','name','survey'),
(37,37,'en','name','Integrating Technology'),
(38,38,'en','name','Computer Skills'),
(39,39,'en','name','Survey'),
(40,40,'en','name','Alberta'),
(41,41,'en','name','National'),
(42,42,'en','name','Provincial'),
(43,43,'en','name','Professional Development'),
(44,44,'en','name','education'),
(45,45,'en','name','citizenship'),
(46,46,'en','name','Common pool resource'),
(47,47,'en','name','common property'),
(48,48,'en','name','intellectual developments'),
(49,49,'en','name','water'),
(50,50,'en','name','Development'),
(51,51,'en','name','engineering education'),
(52,52,'en','name','service learning'),
(53,53,'en','name','sustainability'),
(54,54,'en','name','pigs'),
(55,55,'en','name','food security'),
(56,56,'en','name','water'),
(57,57,'en','name','21st Century'),
(58,58,'en','name','Diversity'),
(59,59,'en','name','Multilingual'),
(60,60,'en','name','Multiethnic'),
(61,61,'en','name','Participatory Pedagogy'),
(62,62,'en','name','Language'),
(63,63,'en','name','Culture'),
(64,64,'en','name','Gender'),
(65,65,'en','name','Egalitarianism'),
(66,66,'en','name','Social Transformation'),
(67,67,'en','name','cattle'),
(68,68,'en','name','food security'),
(69,69,'en','name','Self-Organization'),
(70,70,'en','name','Multi-Level Institutions'),
(71,71,'en','name','Goverance');
/*!40000 ALTER TABLE `controlled_vocab_entry_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `controlled_vocabs`
--

DROP TABLE IF EXISTS `controlled_vocabs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `controlled_vocabs` (
  `controlled_vocab_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `symbolic` varchar(64) NOT NULL,
  `assoc_type` bigint(20) NOT NULL DEFAULT 0,
  `assoc_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`controlled_vocab_id`),
  UNIQUE KEY `controlled_vocab_symbolic` (`symbolic`,`assoc_type`,`assoc_id`)
) ENGINE=InnoDB AUTO_INCREMENT=86 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='Every word or phrase used in a controlled vocabulary. Controlled vocabularies are used for submission metadata like keywords and subjects, reviewer interests, and wherever a similar dictionary of words or phrases is required. Each entry corresponds to a word or phrase like "cellular reproduction" and a type like "submissionKeyword".';
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
(85,'submissionAgency',1048588,21),
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
(84,'submissionDiscipline',1048588,21),
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
(82,'submissionKeyword',1048588,21),
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
(79,'submissionSubject',1048588,20),
(83,'submissionSubject',1048588,21);
/*!40000 ALTER TABLE `controlled_vocabs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `custom_issue_orders`
--

DROP TABLE IF EXISTS `custom_issue_orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
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
/*!40101 SET character_set_client = utf8mb4 */;
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
/*!40101 SET character_set_client = utf8mb4 */;
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
/*!40101 SET character_set_client = utf8mb4 */;
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
/*!40101 SET character_set_client = utf8mb4 */;
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
/*!40101 SET character_set_client = utf8mb4 */;
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
/*!40101 SET character_set_client = utf8mb4 */;
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
/*!40101 SET character_set_client = utf8mb4 */;
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
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='Editorial decisions recorded on a submission, such as decisions to accept or decline the submission, as well as decisions to send for review, send to copyediting, request revisions, and more.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `edit_decisions`
--

LOCK TABLES `edit_decisions` WRITE;
/*!40000 ALTER TABLE `edit_decisions` DISABLE KEYS */;
INSERT INTO `edit_decisions` VALUES
(1,1,NULL,1,NULL,3,3,'2025-08-02 05:50:18'),
(2,1,1,3,1,3,2,'2025-08-02 05:50:29'),
(3,1,NULL,4,NULL,3,7,'2025-08-02 05:50:36'),
(4,2,NULL,1,NULL,3,3,'2025-08-02 05:54:06'),
(5,2,2,3,1,6,9,'2025-08-02 05:54:18'),
(6,3,NULL,1,NULL,3,3,'2025-08-02 05:54:35'),
(7,3,3,3,1,3,2,'2025-08-02 05:54:44'),
(8,5,NULL,1,NULL,3,3,'2025-08-02 05:55:11'),
(9,5,4,3,1,3,2,'2025-08-02 05:55:20'),
(10,5,NULL,4,NULL,3,7,'2025-08-02 05:55:27'),
(11,6,NULL,1,NULL,3,3,'2025-08-02 05:55:49'),
(12,6,5,3,1,3,2,'2025-08-02 05:55:58'),
(13,6,NULL,4,NULL,3,7,'2025-08-02 05:56:05'),
(14,7,NULL,1,NULL,3,3,'2025-08-02 05:56:24'),
(15,9,NULL,1,NULL,3,3,'2025-08-02 05:57:05'),
(16,9,7,3,1,3,2,'2025-08-02 05:57:14'),
(17,9,NULL,4,NULL,3,7,'2025-08-02 05:57:22'),
(18,10,NULL,1,NULL,3,3,'2025-08-02 05:57:44'),
(19,12,NULL,1,NULL,3,3,'2025-08-02 05:58:29'),
(20,13,NULL,1,NULL,3,3,'2025-08-02 05:58:52'),
(21,13,10,3,1,3,4,'2025-08-02 05:59:29'),
(22,15,NULL,1,NULL,3,3,'2025-08-02 05:59:57'),
(23,15,11,3,1,3,2,'2025-08-02 06:00:07'),
(24,15,NULL,4,NULL,3,7,'2025-08-02 06:00:15'),
(25,17,NULL,1,NULL,3,3,'2025-08-02 06:00:46'),
(26,17,12,3,1,3,2,'2025-08-02 06:00:56'),
(27,17,NULL,4,NULL,3,7,'2025-08-02 06:01:04'),
(28,18,NULL,1,NULL,3,8,'2025-08-02 06:02:29'),
(29,19,NULL,1,NULL,3,3,'2025-08-02 06:02:48'),
(30,19,13,3,1,3,2,'2025-08-02 06:02:59'),
(31,20,NULL,1,NULL,3,3,'2025-08-02 06:05:29');
/*!40000 ALTER TABLE `edit_decisions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `email_log`
--

DROP TABLE IF EXISTS `email_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
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
) ENGINE=InnoDB AUTO_INCREMENT=177 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='A record of email messages that are sent in relation to an associated entity, such as a submission.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `email_log`
--

LOCK TABLES `email_log` WRITE;
/*!40000 ALTER TABLE `email_log` DISABLE KEYS */;
INSERT INTO `email_log` VALUES
(1,1048585,1,NULL,'2025-08-02 05:50:10',805306370,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Daniel Barnes\" <dbarnes@mailinator.com>','','','You have been assigned as an editor on a submission to Journal of Public Knowledge','<p>Dear Daniel Barnes,</p><p>The following submission has been assigned to you to see through the editorial process.</p><p><a href=\"http://localhost/index.php/publicknowledge/en/dashboard/editorial?workflowSubmissionId=1\">Signalling Theory Dividends: A Review Of The Literature And Empirical Evidence</a><br />Alan Mwandenga, Amina Mansour</p><p><b>Abstract</b></p><p>The signaling theory suggests that dividends signal future prospects of a firm. However, recent empirical evidence from the US and the Uk does not offer a conclusive evidence on this issue. There are conflicting policy implications among financial economists so much that there is no practical dividend policy guidance to management, existing and potential investors in shareholding. Since corporate investment, financing and distribution decisions are a continuous function of management, the dividend decisions seem to rely on intuitive evaluation.</p><p>If you find the submission to be relevant for Journal of Public Knowledge, please forward the submission to the review stage by selecting \"Send to Review\" and then assign reviewers by clicking \"Add Reviewer\".</p><p>If the submission is not appropriate for this journal, please decline the submission.</p><p>Thank you in advance.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Journal of Public Knowledge</a>.</p>'),
(2,1048585,1,NULL,'2025-08-02 05:50:11',805306370,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"David Buskins\" <dbuskins@mailinator.com>','','','You have been assigned as an editor on a submission to Journal of Public Knowledge','<p>Dear David Buskins,</p><p>The following submission has been assigned to you to see through the editorial process.</p><p><a href=\"http://localhost/index.php/publicknowledge/en/dashboard/editorial?workflowSubmissionId=1\">Signalling Theory Dividends: A Review Of The Literature And Empirical Evidence</a><br />Alan Mwandenga, Amina Mansour</p><p><b>Abstract</b></p><p>The signaling theory suggests that dividends signal future prospects of a firm. However, recent empirical evidence from the US and the Uk does not offer a conclusive evidence on this issue. There are conflicting policy implications among financial economists so much that there is no practical dividend policy guidance to management, existing and potential investors in shareholding. Since corporate investment, financing and distribution decisions are a continuous function of management, the dividend decisions seem to rely on intuitive evaluation.</p><p>If you find the submission to be relevant for Journal of Public Knowledge, please forward the submission to the review stage by selecting \"Send to Review\" and then assign reviewers by clicking \"Add Reviewer\".</p><p>If the submission is not appropriate for this journal, please decline the submission.</p><p>Thank you in advance.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Journal of Public Knowledge</a>.</p>'),
(3,1048585,1,NULL,'2025-08-02 05:50:11',805306370,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Stephanie Berardo\" <sberardo@mailinator.com>','','','You have been assigned as an editor on a submission to Journal of Public Knowledge','<p>Dear Stephanie Berardo,</p><p>The following submission has been assigned to you to see through the editorial process.</p><p><a href=\"http://localhost/index.php/publicknowledge/en/dashboard/editorial?workflowSubmissionId=1\">Signalling Theory Dividends: A Review Of The Literature And Empirical Evidence</a><br />Alan Mwandenga, Amina Mansour</p><p><b>Abstract</b></p><p>The signaling theory suggests that dividends signal future prospects of a firm. However, recent empirical evidence from the US and the Uk does not offer a conclusive evidence on this issue. There are conflicting policy implications among financial economists so much that there is no practical dividend policy guidance to management, existing and potential investors in shareholding. Since corporate investment, financing and distribution decisions are a continuous function of management, the dividend decisions seem to rely on intuitive evaluation.</p><p>If you find the submission to be relevant for Journal of Public Knowledge, please forward the submission to the review stage by selecting \"Send to Review\" and then assign reviewers by clicking \"Add Reviewer\".</p><p>If the submission is not appropriate for this journal, please decline the submission.</p><p>Thank you in advance.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Journal of Public Knowledge</a>.</p>'),
(4,1048585,1,NULL,'2025-08-02 05:50:11',536870914,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Alan Mwandenga\" <amwandenga@mailinator.com>','','','Thank you for your submission to Journal of Public Knowledge','<p>Dear Alan Mwandenga,</p><p>Thank you for your submission to Journal of Public Knowledge. We have received your submission, \"Signalling Theory Dividends: A Review Of The Literature And Empirical Evidence\", and a member of our editorial team will see it soon. You will be sent an email when an initial decision is made, and we may contact you for further information.</p><p>You can view your submission and track its progress through the editorial process at the following location:</p><p>Submission URL: http://localhost/index.php/publicknowledge/en/dashboard/mySubmissions?workflowSubmissionId=1</p><p>If you have been logged out, you can login again with the username amwandenga.</p><p>If you have any questions, please contact me from your <a href=\"http://localhost/index.php/publicknowledge/en/dashboard/mySubmissions?workflowSubmissionId=1\">submission dashboard</a>.</p><p>Thank you for considering Journal of Public Knowledge as a venue for your work.</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Journal of Public Knowledge</a>.</p>'),
(5,1048585,1,NULL,'2025-08-02 05:50:11',536870914,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Amina Mansour\" <notanemailamansour@mailinator.com>','','','Submission confirmation','<p>Dear Amina Mansour,</p><p>You have been named as a co-author on a submission to Journal of Public Knowledge. The submitter, Alan Mwandenga, provided the following details:</p><p>\"Signalling Theory Dividends: A Review Of The Literature And Empirical Evidence\"<br></p><p>If any of these details are incorrect, or you do not wish to be named on this submission, please contact me.</p><p>Thank you for considering Journal of Public Knowledge as a venue for your work.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Journal of Public Knowledge</a>.</p>'),
(6,1048585,1,3,'2025-08-02 05:50:18',805306369,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Alan Mwandenga\" <amwandenga@mailinator.com>','','','Your submission has been sent for review','<p>Dear Alan Mwandenga,</p><p>I am pleased to inform you that an editor has reviewed your submission, \"Signalling Theory Dividends: A Review Of The Literature And Empirical Evidence\", and has decided to send it for peer review. An editor will identify qualified reviewers who will provide feedback on your submission.</p><p>This journal conducts double-anonymous peer review. The reviewers will not see any identifying information about you or your co-authors. Similarly, you will not know who reviewed your submission, and you will not hear from the reviewers directly. You will hear from us with feedback from the reviewers and information about the next steps.</p><p>Please note that sending the submission to peer review does not guarantee that it will be published. We will consider the reviewers\' recommendations before deciding to accept the submission for publication. You may be asked to make revisions and respond to the reviewers\' comments before a final decision is made.</p><p>If you have any questions, please contact me from your submission dashboard.</p><p><p>Daniel Barnes</p></p>'),
(7,1048585,1,3,'2025-08-02 05:50:21',1073741833,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Julie Janssen\" <jjanssen@mailinator.com>','','','Invitation to review','<p>Dear Julie Janssen,</p>\r\n<p>I believe that you would serve as an excellent reviewer for a submission to Journal of Public Knowledge. The submission\'s title and abstract are below, and I hope that you will consider undertaking this important task for us.</p>\r\n<p>If you are able to review this submission, your review is due by 2025-08-30. You can view the submission, upload review files, and submit your review by logging into the journal site and following the steps at the link below.</p>\r\n<p><a href=\"http://localhost/index.php/publicknowledge/en/reviewer/submission?submissionId=1\">Signalling Theory Dividends: A Review Of The Literature And Empirical Evidence</a></p>\r\n<p><strong>Abstract</strong></p>\r\n<p>The signaling theory suggests that dividends signal future prospects of a firm. However, recent empirical evidence from the US and the Uk does not offer a conclusive evidence on this issue. There are conflicting policy implications among financial economists so much that there is no practical dividend policy guidance to management, existing and potential investors in shareholding. Since corporate investment, financing and distribution decisions are a continuous function of management, the dividend decisions seem to rely on intuitive evaluation.</p>\r\n<p>Please <a href=\"http://localhost/index.php/publicknowledge/en/reviewer/submission?submissionId=1\">accept or decline</a> the review by <strong>2025-08-30</strong>.</p>\r\n<p>You may contact me with any questions about the submission or the review process.</p>\r\n<p>Thank you for considering this request. Your help is much appreciated.</p>\r\n<p>Kind regards,</p>\r\n<p>Daniel Barnes</p>'),
(8,1048585,1,3,'2025-08-02 05:50:24',1073741833,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Aisla McCrae\" <amccrae@mailinator.com>','','','Invitation to review','<p>Dear Aisla McCrae,</p>\r\n<p>I believe that you would serve as an excellent reviewer for a submission to Journal of Public Knowledge. The submission\'s title and abstract are below, and I hope that you will consider undertaking this important task for us.</p>\r\n<p>If you are able to review this submission, your review is due by 2025-08-30. You can view the submission, upload review files, and submit your review by logging into the journal site and following the steps at the link below.</p>\r\n<p><a href=\"http://localhost/index.php/publicknowledge/en/reviewer/submission?submissionId=1\">Signalling Theory Dividends: A Review Of The Literature And Empirical Evidence</a></p>\r\n<p><strong>Abstract</strong></p>\r\n<p>The signaling theory suggests that dividends signal future prospects of a firm. However, recent empirical evidence from the US and the Uk does not offer a conclusive evidence on this issue. There are conflicting policy implications among financial economists so much that there is no practical dividend policy guidance to management, existing and potential investors in shareholding. Since corporate investment, financing and distribution decisions are a continuous function of management, the dividend decisions seem to rely on intuitive evaluation.</p>\r\n<p>Please <a href=\"http://localhost/index.php/publicknowledge/en/reviewer/submission?submissionId=1\">accept or decline</a> the review by <strong>2025-08-30</strong>.</p>\r\n<p>You may contact me with any questions about the submission or the review process.</p>\r\n<p>Thank you for considering this request. Your help is much appreciated.</p>\r\n<p>Kind regards,</p>\r\n<p>Daniel Barnes</p>'),
(9,1048585,1,3,'2025-08-02 05:50:26',1073741833,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Adela Gallego\" <agallego@mailinator.com>','','','Invitation to review','<p>Dear Adela Gallego,</p>\r\n<p>I believe that you would serve as an excellent reviewer for a submission to Journal of Public Knowledge. The submission\'s title and abstract are below, and I hope that you will consider undertaking this important task for us.</p>\r\n<p>If you are able to review this submission, your review is due by 2025-08-30. You can view the submission, upload review files, and submit your review by logging into the journal site and following the steps at the link below.</p>\r\n<p><a href=\"http://localhost/index.php/publicknowledge/en/reviewer/submission?submissionId=1\">Signalling Theory Dividends: A Review Of The Literature And Empirical Evidence</a></p>\r\n<p><strong>Abstract</strong></p>\r\n<p>The signaling theory suggests that dividends signal future prospects of a firm. However, recent empirical evidence from the US and the Uk does not offer a conclusive evidence on this issue. There are conflicting policy implications among financial economists so much that there is no practical dividend policy guidance to management, existing and potential investors in shareholding. Since corporate investment, financing and distribution decisions are a continuous function of management, the dividend decisions seem to rely on intuitive evaluation.</p>\r\n<p>Please <a href=\"http://localhost/index.php/publicknowledge/en/reviewer/submission?submissionId=1\">accept or decline</a> the review by <strong>2025-08-30</strong>.</p>\r\n<p>You may contact me with any questions about the submission or the review process.</p>\r\n<p>Thank you for considering this request. Your help is much appreciated.</p>\r\n<p>Kind regards,</p>\r\n<p>Daniel Barnes</p>'),
(10,1048585,1,3,'2025-08-02 05:50:29',805306369,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Alan Mwandenga\" <amwandenga@mailinator.com>','','','Your submission has been accepted to Journal of Public Knowledge','<p>Dear Alan Mwandenga,</p><p>I am pleased to inform you that we have decided to accept your submission without further revision. After careful review, we found your submission, Signalling Theory Dividends: A Review Of The Literature And Empirical Evidence, to meet or exceed our expectations. We are excited to publish your piece in Journal of Public Knowledge and we thank you for choosing our journal as a venue for your work.</p><p>Your submission is now forthcoming in a future issue of Journal of Public Knowledge and you are welcome to include it in your list of publications. We recognize the hard work that goes into every successful submission and we want to congratulate you on reaching this stage.</p><p>Your submission will now undergo copy editing and formatting to prepare it for publication.</p><p>You will shortly receive further instructions.</p><p>If you have any questions, please contact me from your <a href=\"http://localhost/index.php/publicknowledge/en/dashboard/mySubmissions?workflowSubmissionId=1\">submission dashboard</a>.</p><p>Kind regards,</p><p>Daniel Barnes</p>'),
(11,1048585,1,3,'2025-08-02 05:50:37',805306369,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Alan Mwandenga\" <amwandenga@mailinator.com>','','','Next steps for publishing your submission','<p>Dear Alan Mwandenga,</p><p>I am writing from Journal of Public Knowledge to let you know that the editing of your submission, \"Signalling Theory Dividends: A Review Of The Literature And Empirical Evidence\", is complete. Your submission will now advance to the production stage, where the final galleys will be prepared for publication. We will contact you if we need any further assistance.</p><p>If you have any questions, please contact me from your <a href=\"http://localhost/index.php/publicknowledge/en/dashboard/mySubmissions?workflowSubmissionId=1\">submission dashboard</a>.</p><p>Kind regards,</p><p>Daniel Barnes</p>'),
(12,1048585,2,NULL,'2025-08-02 05:54:02',805306370,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Daniel Barnes\" <dbarnes@mailinator.com>','','','You have been assigned as an editor on a submission to Journal of Public Knowledge','<p>Dear Daniel Barnes,</p><p>The following submission has been assigned to you to see through the editorial process.</p><p><a href=\"http://localhost/index.php/publicknowledge/en/dashboard/editorial?workflowSubmissionId=2\">The influence of lactation on the quantity and quality of cashmere production</a><br />Carlo Corino</p><p><b>Abstract</b></p>The effects of pressed beet pulp silage (PBPS) replacing barley for 10% and 20% (DM basis) were studied on heavy pigs fed dairy whey-diluted diets. 60 Hypor pigs (average initial weight of 28 kg), 30 barrows and 30 gilts, were homogeneously allocated to three exper- imental groups: T1 (control) in which pigs were fed a traditional sweet whey- diluted diet (the ratio between whey and dry matter was 4.5/1); T2 in which PBPS replaced barley for 10% (DM basis) during a first period (from the beginning to the 133rd day of trial) and thereafter for 20% (DM basis); T3 in which PBPS replaced barley for 20% (DM basis) throughout the experimental period. In diets T2 and T3 feed was dairy whey-diluted as in group T1. No significant (P&gt;0.05) differences were observed concerning growth parameters (ADG and FCR). Pigs on diets contain- ing PBPS showed significantly higher (P&lt;0.05) percentages of lean cuts and lower percentages of fat cuts. On the whole, ham weight losses during seasoning were moderate but significantly (P&lt;0.05) more marked for PBPS-fed pigs as a prob- able consequence of their lower adiposity degree. Fatty acid composition of ham fat was unaffected by diets. With regard to m. Semimembranosus colour, pigs receiving PBPS showed lower (P&lt;0.05) \"L\", \"a\" and \"Chroma\" values. From an economical point of view it can be concluded that the use of PBPS (partially replacing barley) and dairy whey in heavy pig production could be of particular interest in areas where both these by products are readily available.<p>If you find the submission to be relevant for Journal of Public Knowledge, please forward the submission to the review stage by selecting \"Send to Review\" and then assign reviewers by clicking \"Add Reviewer\".</p><p>If the submission is not appropriate for this journal, please decline the submission.</p><p>Thank you in advance.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Journal of Public Knowledge</a>.</p>'),
(13,1048585,2,NULL,'2025-08-02 05:54:02',805306370,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"David Buskins\" <dbuskins@mailinator.com>','','','You have been assigned as an editor on a submission to Journal of Public Knowledge','<p>Dear David Buskins,</p><p>The following submission has been assigned to you to see through the editorial process.</p><p><a href=\"http://localhost/index.php/publicknowledge/en/dashboard/editorial?workflowSubmissionId=2\">The influence of lactation on the quantity and quality of cashmere production</a><br />Carlo Corino</p><p><b>Abstract</b></p>The effects of pressed beet pulp silage (PBPS) replacing barley for 10% and 20% (DM basis) were studied on heavy pigs fed dairy whey-diluted diets. 60 Hypor pigs (average initial weight of 28 kg), 30 barrows and 30 gilts, were homogeneously allocated to three exper- imental groups: T1 (control) in which pigs were fed a traditional sweet whey- diluted diet (the ratio between whey and dry matter was 4.5/1); T2 in which PBPS replaced barley for 10% (DM basis) during a first period (from the beginning to the 133rd day of trial) and thereafter for 20% (DM basis); T3 in which PBPS replaced barley for 20% (DM basis) throughout the experimental period. In diets T2 and T3 feed was dairy whey-diluted as in group T1. No significant (P&gt;0.05) differences were observed concerning growth parameters (ADG and FCR). Pigs on diets contain- ing PBPS showed significantly higher (P&lt;0.05) percentages of lean cuts and lower percentages of fat cuts. On the whole, ham weight losses during seasoning were moderate but significantly (P&lt;0.05) more marked for PBPS-fed pigs as a prob- able consequence of their lower adiposity degree. Fatty acid composition of ham fat was unaffected by diets. With regard to m. Semimembranosus colour, pigs receiving PBPS showed lower (P&lt;0.05) \"L\", \"a\" and \"Chroma\" values. From an economical point of view it can be concluded that the use of PBPS (partially replacing barley) and dairy whey in heavy pig production could be of particular interest in areas where both these by products are readily available.<p>If you find the submission to be relevant for Journal of Public Knowledge, please forward the submission to the review stage by selecting \"Send to Review\" and then assign reviewers by clicking \"Add Reviewer\".</p><p>If the submission is not appropriate for this journal, please decline the submission.</p><p>Thank you in advance.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Journal of Public Knowledge</a>.</p>'),
(14,1048585,2,NULL,'2025-08-02 05:54:02',805306370,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Stephanie Berardo\" <sberardo@mailinator.com>','','','You have been assigned as an editor on a submission to Journal of Public Knowledge','<p>Dear Stephanie Berardo,</p><p>The following submission has been assigned to you to see through the editorial process.</p><p><a href=\"http://localhost/index.php/publicknowledge/en/dashboard/editorial?workflowSubmissionId=2\">The influence of lactation on the quantity and quality of cashmere production</a><br />Carlo Corino</p><p><b>Abstract</b></p>The effects of pressed beet pulp silage (PBPS) replacing barley for 10% and 20% (DM basis) were studied on heavy pigs fed dairy whey-diluted diets. 60 Hypor pigs (average initial weight of 28 kg), 30 barrows and 30 gilts, were homogeneously allocated to three exper- imental groups: T1 (control) in which pigs were fed a traditional sweet whey- diluted diet (the ratio between whey and dry matter was 4.5/1); T2 in which PBPS replaced barley for 10% (DM basis) during a first period (from the beginning to the 133rd day of trial) and thereafter for 20% (DM basis); T3 in which PBPS replaced barley for 20% (DM basis) throughout the experimental period. In diets T2 and T3 feed was dairy whey-diluted as in group T1. No significant (P&gt;0.05) differences were observed concerning growth parameters (ADG and FCR). Pigs on diets contain- ing PBPS showed significantly higher (P&lt;0.05) percentages of lean cuts and lower percentages of fat cuts. On the whole, ham weight losses during seasoning were moderate but significantly (P&lt;0.05) more marked for PBPS-fed pigs as a prob- able consequence of their lower adiposity degree. Fatty acid composition of ham fat was unaffected by diets. With regard to m. Semimembranosus colour, pigs receiving PBPS showed lower (P&lt;0.05) \"L\", \"a\" and \"Chroma\" values. From an economical point of view it can be concluded that the use of PBPS (partially replacing barley) and dairy whey in heavy pig production could be of particular interest in areas where both these by products are readily available.<p>If you find the submission to be relevant for Journal of Public Knowledge, please forward the submission to the review stage by selecting \"Send to Review\" and then assign reviewers by clicking \"Add Reviewer\".</p><p>If the submission is not appropriate for this journal, please decline the submission.</p><p>Thank you in advance.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Journal of Public Knowledge</a>.</p>'),
(15,1048585,2,NULL,'2025-08-02 05:54:02',536870914,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Carlo Corino\" <ccorino@mailinator.com>','','','Thank you for your submission to Journal of Public Knowledge','<p>Dear Carlo Corino,</p><p>Thank you for your submission to Journal of Public Knowledge. We have received your submission, \"The influence of lactation on the quantity and quality of cashmere production\", and a member of our editorial team will see it soon. You will be sent an email when an initial decision is made, and we may contact you for further information.</p><p>You can view your submission and track its progress through the editorial process at the following location:</p><p>Submission URL: http://localhost/index.php/publicknowledge/en/dashboard/mySubmissions?workflowSubmissionId=2</p><p>If you have been logged out, you can login again with the username ccorino.</p><p>If you have any questions, please contact me from your <a href=\"http://localhost/index.php/publicknowledge/en/dashboard/mySubmissions?workflowSubmissionId=2\">submission dashboard</a>.</p><p>Thank you for considering Journal of Public Knowledge as a venue for your work.</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Journal of Public Knowledge</a>.</p>'),
(16,1048585,2,3,'2025-08-02 05:54:07',805306369,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Carlo Corino\" <ccorino@mailinator.com>','','','Your submission has been sent for review','<p>Dear Carlo Corino,</p><p>I am pleased to inform you that an editor has reviewed your submission, \"The influence of lactation on the quantity and quality of cashmere production\", and has decided to send it for peer review. An editor will identify qualified reviewers who will provide feedback on your submission.</p><p>This journal conducts double-anonymous peer review. The reviewers will not see any identifying information about you or your co-authors. Similarly, you will not know who reviewed your submission, and you will not hear from the reviewers directly. You will hear from us with feedback from the reviewers and information about the next steps.</p><p>Please note that sending the submission to peer review does not guarantee that it will be published. We will consider the reviewers\' recommendations before deciding to accept the submission for publication. You may be asked to make revisions and respond to the reviewers\' comments before a final decision is made.</p><p>If you have any questions, please contact me from your submission dashboard.</p><p><p>Daniel Barnes</p></p>'),
(17,1048585,3,NULL,'2025-08-02 05:54:30',805306370,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Daniel Barnes\" <dbarnes@mailinator.com>','','','You have been assigned as an editor on a submission to Journal of Public Knowledge','<p>Dear Daniel Barnes,</p><p>The following submission has been assigned to you to see through the editorial process.</p><p><a href=\"http://localhost/index.php/publicknowledge/en/dashboard/editorial?workflowSubmissionId=3\">The Facets Of Job Satisfaction: A Nine-Nation Comparative Study Of Construct Equivalence</a><br />Catherine Kwantes</p><p><b>Abstract</b></p>Archival data from an attitude survey of employees in a single multinational organization were used to examine the degree to which national culture affects the nature of job satisfaction. Responses from nine countries were compiled to create a benchmark against which nations could be individually compared. Factor analysis revealed four factors: Organizational Communication, Organizational Efficiency/Effectiveness, Organizational Support, and Personal Benefit. Comparisons of factor structures indicated that Organizational Communication exhibited the most construct equivalence, and Personal Benefit the least. The most satisfied employees were those from China, and the least satisfied from Brazil, consistent with previous findings that individuals in collectivistic nations report higher satisfaction. The research findings suggest that national cultural context exerts an effect on the nature of job satisfaction.<p>If you find the submission to be relevant for Journal of Public Knowledge, please forward the submission to the review stage by selecting \"Send to Review\" and then assign reviewers by clicking \"Add Reviewer\".</p><p>If the submission is not appropriate for this journal, please decline the submission.</p><p>Thank you in advance.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Journal of Public Knowledge</a>.</p>'),
(18,1048585,3,NULL,'2025-08-02 05:54:30',805306370,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"David Buskins\" <dbuskins@mailinator.com>','','','You have been assigned as an editor on a submission to Journal of Public Knowledge','<p>Dear David Buskins,</p><p>The following submission has been assigned to you to see through the editorial process.</p><p><a href=\"http://localhost/index.php/publicknowledge/en/dashboard/editorial?workflowSubmissionId=3\">The Facets Of Job Satisfaction: A Nine-Nation Comparative Study Of Construct Equivalence</a><br />Catherine Kwantes</p><p><b>Abstract</b></p>Archival data from an attitude survey of employees in a single multinational organization were used to examine the degree to which national culture affects the nature of job satisfaction. Responses from nine countries were compiled to create a benchmark against which nations could be individually compared. Factor analysis revealed four factors: Organizational Communication, Organizational Efficiency/Effectiveness, Organizational Support, and Personal Benefit. Comparisons of factor structures indicated that Organizational Communication exhibited the most construct equivalence, and Personal Benefit the least. The most satisfied employees were those from China, and the least satisfied from Brazil, consistent with previous findings that individuals in collectivistic nations report higher satisfaction. The research findings suggest that national cultural context exerts an effect on the nature of job satisfaction.<p>If you find the submission to be relevant for Journal of Public Knowledge, please forward the submission to the review stage by selecting \"Send to Review\" and then assign reviewers by clicking \"Add Reviewer\".</p><p>If the submission is not appropriate for this journal, please decline the submission.</p><p>Thank you in advance.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Journal of Public Knowledge</a>.</p>'),
(19,1048585,3,NULL,'2025-08-02 05:54:31',805306370,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Stephanie Berardo\" <sberardo@mailinator.com>','','','You have been assigned as an editor on a submission to Journal of Public Knowledge','<p>Dear Stephanie Berardo,</p><p>The following submission has been assigned to you to see through the editorial process.</p><p><a href=\"http://localhost/index.php/publicknowledge/en/dashboard/editorial?workflowSubmissionId=3\">The Facets Of Job Satisfaction: A Nine-Nation Comparative Study Of Construct Equivalence</a><br />Catherine Kwantes</p><p><b>Abstract</b></p>Archival data from an attitude survey of employees in a single multinational organization were used to examine the degree to which national culture affects the nature of job satisfaction. Responses from nine countries were compiled to create a benchmark against which nations could be individually compared. Factor analysis revealed four factors: Organizational Communication, Organizational Efficiency/Effectiveness, Organizational Support, and Personal Benefit. Comparisons of factor structures indicated that Organizational Communication exhibited the most construct equivalence, and Personal Benefit the least. The most satisfied employees were those from China, and the least satisfied from Brazil, consistent with previous findings that individuals in collectivistic nations report higher satisfaction. The research findings suggest that national cultural context exerts an effect on the nature of job satisfaction.<p>If you find the submission to be relevant for Journal of Public Knowledge, please forward the submission to the review stage by selecting \"Send to Review\" and then assign reviewers by clicking \"Add Reviewer\".</p><p>If the submission is not appropriate for this journal, please decline the submission.</p><p>Thank you in advance.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Journal of Public Knowledge</a>.</p>'),
(20,1048585,3,NULL,'2025-08-02 05:54:31',536870914,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Catherine Kwantes\" <ckwantes@mailinator.com>','','','Thank you for your submission to Journal of Public Knowledge','<p>Dear Catherine Kwantes,</p><p>Thank you for your submission to Journal of Public Knowledge. We have received your submission, \"The Facets Of Job Satisfaction: A Nine-Nation Comparative Study Of Construct Equivalence\", and a member of our editorial team will see it soon. You will be sent an email when an initial decision is made, and we may contact you for further information.</p><p>You can view your submission and track its progress through the editorial process at the following location:</p><p>Submission URL: http://localhost/index.php/publicknowledge/en/dashboard/mySubmissions?workflowSubmissionId=3</p><p>If you have been logged out, you can login again with the username ckwantes.</p><p>If you have any questions, please contact me from your <a href=\"http://localhost/index.php/publicknowledge/en/dashboard/mySubmissions?workflowSubmissionId=3\">submission dashboard</a>.</p><p>Thank you for considering Journal of Public Knowledge as a venue for your work.</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Journal of Public Knowledge</a>.</p>'),
(21,1048585,3,3,'2025-08-02 05:54:35',805306369,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Catherine Kwantes\" <ckwantes@mailinator.com>','','','Your submission has been sent for review','<p>Dear Catherine Kwantes,</p><p>I am pleased to inform you that an editor has reviewed your submission, \"The Facets Of Job Satisfaction: A Nine-Nation Comparative Study Of Construct Equivalence\", and has decided to send it for peer review. An editor will identify qualified reviewers who will provide feedback on your submission.</p><p>This journal conducts double-anonymous peer review. The reviewers will not see any identifying information about you or your co-authors. Similarly, you will not know who reviewed your submission, and you will not hear from the reviewers directly. You will hear from us with feedback from the reviewers and information about the next steps.</p><p>Please note that sending the submission to peer review does not guarantee that it will be published. We will consider the reviewers\' recommendations before deciding to accept the submission for publication. You may be asked to make revisions and respond to the reviewers\' comments before a final decision is made.</p><p>If you have any questions, please contact me from your submission dashboard.</p><p><p>Daniel Barnes</p></p>'),
(22,1048585,3,3,'2025-08-02 05:54:38',1073741833,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Aisla McCrae\" <amccrae@mailinator.com>','','','Invitation to review','<p>Dear Aisla McCrae,</p>\r\n<p>I believe that you would serve as an excellent reviewer for a submission to Journal of Public Knowledge. The submission\'s title and abstract are below, and I hope that you will consider undertaking this important task for us.</p>\r\n<p>If you are able to review this submission, your review is due by 2025-08-30. You can view the submission, upload review files, and submit your review by logging into the journal site and following the steps at the link below.</p>\r\n<p><a href=\"http://localhost/index.php/publicknowledge/en/reviewer/submission?submissionId=3\">The Facets Of Job Satisfaction: A Nine-Nation Comparative Study Of Construct Equivalence</a></p>\r\n<p><strong>Abstract</strong></p>\r\n<p>Archival data from an attitude survey of employees in a single multinational organization were used to examine the degree to which national culture affects the nature of job satisfaction. Responses from nine countries were compiled to create a benchmark against which nations could be individually compared. Factor analysis revealed four factors: Organizational Communication, Organizational Efficiency/Effectiveness, Organizational Support, and Personal Benefit. Comparisons of factor structures indicated that Organizational Communication exhibited the most construct equivalence, and Personal Benefit the least. The most satisfied employees were those from China, and the least satisfied from Brazil, consistent with previous findings that individuals in collectivistic nations report higher satisfaction. The research findings suggest that national cultural context exerts an effect on the nature of job satisfaction.</p>\r\n<p>Please <a href=\"http://localhost/index.php/publicknowledge/en/reviewer/submission?submissionId=3\">accept or decline</a> the review by <strong>2025-08-30</strong>.</p>\r\n<p>You may contact me with any questions about the submission or the review process.</p>\r\n<p>Thank you for considering this request. Your help is much appreciated.</p>\r\n<p>Kind regards,</p>\r\n<p>Daniel Barnes</p>'),
(23,1048585,3,3,'2025-08-02 05:54:41',1073741833,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Adela Gallego\" <agallego@mailinator.com>','','','Invitation to review','<p>Dear Adela Gallego,</p>\r\n<p>I believe that you would serve as an excellent reviewer for a submission to Journal of Public Knowledge. The submission\'s title and abstract are below, and I hope that you will consider undertaking this important task for us.</p>\r\n<p>If you are able to review this submission, your review is due by 2025-08-30. You can view the submission, upload review files, and submit your review by logging into the journal site and following the steps at the link below.</p>\r\n<p><a href=\"http://localhost/index.php/publicknowledge/en/reviewer/submission?submissionId=3\">The Facets Of Job Satisfaction: A Nine-Nation Comparative Study Of Construct Equivalence</a></p>\r\n<p><strong>Abstract</strong></p>\r\n<p>Archival data from an attitude survey of employees in a single multinational organization were used to examine the degree to which national culture affects the nature of job satisfaction. Responses from nine countries were compiled to create a benchmark against which nations could be individually compared. Factor analysis revealed four factors: Organizational Communication, Organizational Efficiency/Effectiveness, Organizational Support, and Personal Benefit. Comparisons of factor structures indicated that Organizational Communication exhibited the most construct equivalence, and Personal Benefit the least. The most satisfied employees were those from China, and the least satisfied from Brazil, consistent with previous findings that individuals in collectivistic nations report higher satisfaction. The research findings suggest that national cultural context exerts an effect on the nature of job satisfaction.</p>\r\n<p>Please <a href=\"http://localhost/index.php/publicknowledge/en/reviewer/submission?submissionId=3\">accept or decline</a> the review by <strong>2025-08-30</strong>.</p>\r\n<p>You may contact me with any questions about the submission or the review process.</p>\r\n<p>Thank you for considering this request. Your help is much appreciated.</p>\r\n<p>Kind regards,</p>\r\n<p>Daniel Barnes</p>'),
(24,1048585,3,3,'2025-08-02 05:54:44',805306369,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Catherine Kwantes\" <ckwantes@mailinator.com>','','','Your submission has been accepted to Journal of Public Knowledge','<p>Dear Catherine Kwantes,</p><p>I am pleased to inform you that we have decided to accept your submission without further revision. After careful review, we found your submission, The Facets Of Job Satisfaction: A Nine-Nation Comparative Study Of Construct Equivalence, to meet or exceed our expectations. We are excited to publish your piece in Journal of Public Knowledge and we thank you for choosing our journal as a venue for your work.</p><p>Your submission is now forthcoming in a future issue of Journal of Public Knowledge and you are welcome to include it in your list of publications. We recognize the hard work that goes into every successful submission and we want to congratulate you on reaching this stage.</p><p>Your submission will now undergo copy editing and formatting to prepare it for publication.</p><p>You will shortly receive further instructions.</p><p>If you have any questions, please contact me from your <a href=\"http://localhost/index.php/publicknowledge/en/dashboard/mySubmissions?workflowSubmissionId=3\">submission dashboard</a>.</p><p>Kind regards,</p><p>Daniel Barnes</p>'),
(25,1048585,4,NULL,'2025-08-02 05:54:57',805306370,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Daniel Barnes\" <dbarnes@mailinator.com>','','','You have been assigned as an editor on a submission to Journal of Public Knowledge','<p>Dear Daniel Barnes,</p><p>The following submission has been assigned to you to see through the editorial process.</p><p><a href=\"http://localhost/index.php/publicknowledge/en/dashboard/editorial?workflowSubmissionId=4\">Computer Skill Requirements for New and Existing Teachers: Implications for Policy and Practice</a><br />Craig Montgomerie, Mark Irvine</p><p><b>Abstract</b></p>The integration of technology into the classroom is a major issue in education today. Many national and provincial initiatives specify the technology skills that students must demonstrate at each grade level. The Government of the Province of Alberta in Canada, has mandated the implementation of a new curriculum which began in September of 2000, called Information and Communication Technology. This curriculum is infused within core courses and specifies what students are “expected to know, be able to do, and be like with respect to technology” (Alberta Learning, 2000). Since teachers are required to implement this new curriculum, school jurisdictions are turning to professional development strategies and hiring standards to upgrade teachers’ computer skills to meet this goal. This paper summarizes the results of a telephone survey administered to all public school jurisdictions in the Province of Alberta with a 100% response rate. We examined the computer skills that school jurisdictions require of newly hired teachers, and the support strategies employed for currently employed teachers.<p>If you find the submission to be relevant for Journal of Public Knowledge, please forward the submission to the review stage by selecting \"Send to Review\" and then assign reviewers by clicking \"Add Reviewer\".</p><p>If the submission is not appropriate for this journal, please decline the submission.</p><p>Thank you in advance.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Journal of Public Knowledge</a>.</p>'),
(26,1048585,4,NULL,'2025-08-02 05:54:58',805306370,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"David Buskins\" <dbuskins@mailinator.com>','','','You have been assigned as an editor on a submission to Journal of Public Knowledge','<p>Dear David Buskins,</p><p>The following submission has been assigned to you to see through the editorial process.</p><p><a href=\"http://localhost/index.php/publicknowledge/en/dashboard/editorial?workflowSubmissionId=4\">Computer Skill Requirements for New and Existing Teachers: Implications for Policy and Practice</a><br />Craig Montgomerie, Mark Irvine</p><p><b>Abstract</b></p>The integration of technology into the classroom is a major issue in education today. Many national and provincial initiatives specify the technology skills that students must demonstrate at each grade level. The Government of the Province of Alberta in Canada, has mandated the implementation of a new curriculum which began in September of 2000, called Information and Communication Technology. This curriculum is infused within core courses and specifies what students are “expected to know, be able to do, and be like with respect to technology” (Alberta Learning, 2000). Since teachers are required to implement this new curriculum, school jurisdictions are turning to professional development strategies and hiring standards to upgrade teachers’ computer skills to meet this goal. This paper summarizes the results of a telephone survey administered to all public school jurisdictions in the Province of Alberta with a 100% response rate. We examined the computer skills that school jurisdictions require of newly hired teachers, and the support strategies employed for currently employed teachers.<p>If you find the submission to be relevant for Journal of Public Knowledge, please forward the submission to the review stage by selecting \"Send to Review\" and then assign reviewers by clicking \"Add Reviewer\".</p><p>If the submission is not appropriate for this journal, please decline the submission.</p><p>Thank you in advance.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Journal of Public Knowledge</a>.</p>'),
(27,1048585,4,NULL,'2025-08-02 05:54:58',805306370,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Stephanie Berardo\" <sberardo@mailinator.com>','','','You have been assigned as an editor on a submission to Journal of Public Knowledge','<p>Dear Stephanie Berardo,</p><p>The following submission has been assigned to you to see through the editorial process.</p><p><a href=\"http://localhost/index.php/publicknowledge/en/dashboard/editorial?workflowSubmissionId=4\">Computer Skill Requirements for New and Existing Teachers: Implications for Policy and Practice</a><br />Craig Montgomerie, Mark Irvine</p><p><b>Abstract</b></p>The integration of technology into the classroom is a major issue in education today. Many national and provincial initiatives specify the technology skills that students must demonstrate at each grade level. The Government of the Province of Alberta in Canada, has mandated the implementation of a new curriculum which began in September of 2000, called Information and Communication Technology. This curriculum is infused within core courses and specifies what students are “expected to know, be able to do, and be like with respect to technology” (Alberta Learning, 2000). Since teachers are required to implement this new curriculum, school jurisdictions are turning to professional development strategies and hiring standards to upgrade teachers’ computer skills to meet this goal. This paper summarizes the results of a telephone survey administered to all public school jurisdictions in the Province of Alberta with a 100% response rate. We examined the computer skills that school jurisdictions require of newly hired teachers, and the support strategies employed for currently employed teachers.<p>If you find the submission to be relevant for Journal of Public Knowledge, please forward the submission to the review stage by selecting \"Send to Review\" and then assign reviewers by clicking \"Add Reviewer\".</p><p>If the submission is not appropriate for this journal, please decline the submission.</p><p>Thank you in advance.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Journal of Public Knowledge</a>.</p>'),
(28,1048585,4,NULL,'2025-08-02 05:54:58',536870914,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Craig Montgomerie\" <cmontgomerie@mailinator.com>','','','Thank you for your submission to Journal of Public Knowledge','<p>Dear Craig Montgomerie,</p><p>Thank you for your submission to Journal of Public Knowledge. We have received your submission, \"Computer Skill Requirements for New and Existing Teachers: Implications for Policy and Practice\", and a member of our editorial team will see it soon. You will be sent an email when an initial decision is made, and we may contact you for further information.</p><p>You can view your submission and track its progress through the editorial process at the following location:</p><p>Submission URL: http://localhost/index.php/publicknowledge/en/dashboard/mySubmissions?workflowSubmissionId=4</p><p>If you have been logged out, you can login again with the username cmontgomerie.</p><p>If you have any questions, please contact me from your <a href=\"http://localhost/index.php/publicknowledge/en/dashboard/mySubmissions?workflowSubmissionId=4\">submission dashboard</a>.</p><p>Thank you for considering Journal of Public Knowledge as a venue for your work.</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Journal of Public Knowledge</a>.</p>'),
(29,1048585,4,NULL,'2025-08-02 05:54:58',536870914,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Mark Irvine\" <mirvine@mailinator.com>','','','Submission confirmation','<p>Dear Mark Irvine,</p><p>You have been named as a co-author on a submission to Journal of Public Knowledge. The submitter, Craig Montgomerie, provided the following details:</p><p>\"Computer Skill Requirements for New and Existing Teachers: Implications for Policy and Practice\"<br></p><p>If any of these details are incorrect, or you do not wish to be named on this submission, please contact me.</p><p>Thank you for considering Journal of Public Knowledge as a venue for your work.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Journal of Public Knowledge</a>.</p>'),
(30,1048585,5,NULL,'2025-08-02 05:55:06',805306370,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Daniel Barnes\" <dbarnes@mailinator.com>','','','You have been assigned as an editor on a submission to Journal of Public Knowledge','<p>Dear Daniel Barnes,</p><p>The following submission has been assigned to you to see through the editorial process.</p><p><a href=\"http://localhost/index.php/publicknowledge/en/dashboard/editorial?workflowSubmissionId=5\">Genetic transformation of forest trees</a><br />Diaga Diouf</p><p><b>Abstract</b></p>In this review, the recent progress on genetic transformation of forest trees were discussed. Its described also, different applications of genetic engineering for improving forest trees or understanding the mechanisms governing genes expression in woody plants.<p>If you find the submission to be relevant for Journal of Public Knowledge, please forward the submission to the review stage by selecting \"Send to Review\" and then assign reviewers by clicking \"Add Reviewer\".</p><p>If the submission is not appropriate for this journal, please decline the submission.</p><p>Thank you in advance.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Journal of Public Knowledge</a>.</p>'),
(31,1048585,5,NULL,'2025-08-02 05:55:06',805306370,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"David Buskins\" <dbuskins@mailinator.com>','','','You have been assigned as an editor on a submission to Journal of Public Knowledge','<p>Dear David Buskins,</p><p>The following submission has been assigned to you to see through the editorial process.</p><p><a href=\"http://localhost/index.php/publicknowledge/en/dashboard/editorial?workflowSubmissionId=5\">Genetic transformation of forest trees</a><br />Diaga Diouf</p><p><b>Abstract</b></p>In this review, the recent progress on genetic transformation of forest trees were discussed. Its described also, different applications of genetic engineering for improving forest trees or understanding the mechanisms governing genes expression in woody plants.<p>If you find the submission to be relevant for Journal of Public Knowledge, please forward the submission to the review stage by selecting \"Send to Review\" and then assign reviewers by clicking \"Add Reviewer\".</p><p>If the submission is not appropriate for this journal, please decline the submission.</p><p>Thank you in advance.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Journal of Public Knowledge</a>.</p>'),
(32,1048585,5,NULL,'2025-08-02 05:55:06',805306370,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Stephanie Berardo\" <sberardo@mailinator.com>','','','You have been assigned as an editor on a submission to Journal of Public Knowledge','<p>Dear Stephanie Berardo,</p><p>The following submission has been assigned to you to see through the editorial process.</p><p><a href=\"http://localhost/index.php/publicknowledge/en/dashboard/editorial?workflowSubmissionId=5\">Genetic transformation of forest trees</a><br />Diaga Diouf</p><p><b>Abstract</b></p>In this review, the recent progress on genetic transformation of forest trees were discussed. Its described also, different applications of genetic engineering for improving forest trees or understanding the mechanisms governing genes expression in woody plants.<p>If you find the submission to be relevant for Journal of Public Knowledge, please forward the submission to the review stage by selecting \"Send to Review\" and then assign reviewers by clicking \"Add Reviewer\".</p><p>If the submission is not appropriate for this journal, please decline the submission.</p><p>Thank you in advance.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Journal of Public Knowledge</a>.</p>'),
(33,1048585,5,NULL,'2025-08-02 05:55:06',536870914,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Diaga Diouf\" <ddiouf@mailinator.com>','','','Thank you for your submission to Journal of Public Knowledge','<p>Dear Diaga Diouf,</p><p>Thank you for your submission to Journal of Public Knowledge. We have received your submission, \"Genetic transformation of forest trees\", and a member of our editorial team will see it soon. You will be sent an email when an initial decision is made, and we may contact you for further information.</p><p>You can view your submission and track its progress through the editorial process at the following location:</p><p>Submission URL: http://localhost/index.php/publicknowledge/en/dashboard/mySubmissions?workflowSubmissionId=5</p><p>If you have been logged out, you can login again with the username ddiouf.</p><p>If you have any questions, please contact me from your <a href=\"http://localhost/index.php/publicknowledge/en/dashboard/mySubmissions?workflowSubmissionId=5\">submission dashboard</a>.</p><p>Thank you for considering Journal of Public Knowledge as a venue for your work.</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Journal of Public Knowledge</a>.</p>'),
(34,1048585,5,3,'2025-08-02 05:55:12',805306369,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Diaga Diouf\" <ddiouf@mailinator.com>','','','Your submission has been sent for review','<p>Dear Diaga Diouf,</p><p>I am pleased to inform you that an editor has reviewed your submission, \"Genetic transformation of forest trees\", and has decided to send it for peer review. An editor will identify qualified reviewers who will provide feedback on your submission.</p><p>This journal conducts double-anonymous peer review. The reviewers will not see any identifying information about you or your co-authors. Similarly, you will not know who reviewed your submission, and you will not hear from the reviewers directly. You will hear from us with feedback from the reviewers and information about the next steps.</p><p>Please note that sending the submission to peer review does not guarantee that it will be published. We will consider the reviewers\' recommendations before deciding to accept the submission for publication. You may be asked to make revisions and respond to the reviewers\' comments before a final decision is made.</p><p>If you have any questions, please contact me from your submission dashboard.</p><p><p>Daniel Barnes</p></p>'),
(35,1048585,5,3,'2025-08-02 05:55:15',1073741833,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Paul Hudson\" <phudson@mailinator.com>','','','Invitation to review','<p>Dear Paul Hudson,</p>\r\n<p>I believe that you would serve as an excellent reviewer for a submission to Journal of Public Knowledge. The submission\'s title and abstract are below, and I hope that you will consider undertaking this important task for us.</p>\r\n<p>If you are able to review this submission, your review is due by 2025-08-30. You can view the submission, upload review files, and submit your review by logging into the journal site and following the steps at the link below.</p>\r\n<p><a href=\"http://localhost/index.php/publicknowledge/en/reviewer/submission?submissionId=5\">Genetic transformation of forest trees</a></p>\r\n<p><strong>Abstract</strong></p>\r\n<p>In this review, the recent progress on genetic transformation of forest trees were discussed. Its described also, different applications of genetic engineering for improving forest trees or understanding the mechanisms governing genes expression in woody plants.</p>\r\n<p>Please <a href=\"http://localhost/index.php/publicknowledge/en/reviewer/submission?submissionId=5\">accept or decline</a> the review by <strong>2025-08-30</strong>.</p>\r\n<p>You may contact me with any questions about the submission or the review process.</p>\r\n<p>Thank you for considering this request. Your help is much appreciated.</p>\r\n<p>Kind regards,</p>\r\n<p>Daniel Barnes</p>'),
(36,1048585,5,3,'2025-08-02 05:55:17',1073741833,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Adela Gallego\" <agallego@mailinator.com>','','','Invitation to review','<p>Dear Adela Gallego,</p>\r\n<p>I believe that you would serve as an excellent reviewer for a submission to Journal of Public Knowledge. The submission\'s title and abstract are below, and I hope that you will consider undertaking this important task for us.</p>\r\n<p>If you are able to review this submission, your review is due by 2025-08-30. You can view the submission, upload review files, and submit your review by logging into the journal site and following the steps at the link below.</p>\r\n<p><a href=\"http://localhost/index.php/publicknowledge/en/reviewer/submission?submissionId=5\">Genetic transformation of forest trees</a></p>\r\n<p><strong>Abstract</strong></p>\r\n<p>In this review, the recent progress on genetic transformation of forest trees were discussed. Its described also, different applications of genetic engineering for improving forest trees or understanding the mechanisms governing genes expression in woody plants.</p>\r\n<p>Please <a href=\"http://localhost/index.php/publicknowledge/en/reviewer/submission?submissionId=5\">accept or decline</a> the review by <strong>2025-08-30</strong>.</p>\r\n<p>You may contact me with any questions about the submission or the review process.</p>\r\n<p>Thank you for considering this request. Your help is much appreciated.</p>\r\n<p>Kind regards,</p>\r\n<p>Daniel Barnes</p>'),
(37,1048585,5,3,'2025-08-02 05:55:20',805306369,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Diaga Diouf\" <ddiouf@mailinator.com>','','','Your submission has been accepted to Journal of Public Knowledge','<p>Dear Diaga Diouf,</p><p>I am pleased to inform you that we have decided to accept your submission without further revision. After careful review, we found your submission, Genetic transformation of forest trees, to meet or exceed our expectations. We are excited to publish your piece in Journal of Public Knowledge and we thank you for choosing our journal as a venue for your work.</p><p>Your submission is now forthcoming in a future issue of Journal of Public Knowledge and you are welcome to include it in your list of publications. We recognize the hard work that goes into every successful submission and we want to congratulate you on reaching this stage.</p><p>Your submission will now undergo copy editing and formatting to prepare it for publication.</p><p>You will shortly receive further instructions.</p><p>If you have any questions, please contact me from your <a href=\"http://localhost/index.php/publicknowledge/en/dashboard/mySubmissions?workflowSubmissionId=5\">submission dashboard</a>.</p><p>Kind regards,</p><p>Daniel Barnes</p>'),
(38,1048585,5,3,'2025-08-02 05:55:28',805306369,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Diaga Diouf\" <ddiouf@mailinator.com>','','','Next steps for publishing your submission','<p>Dear Diaga Diouf,</p><p>I am writing from Journal of Public Knowledge to let you know that the editing of your submission, \"Genetic transformation of forest trees\", is complete. Your submission will now advance to the production stage, where the final galleys will be prepared for publication. We will contact you if we need any further assistance.</p><p>If you have any questions, please contact me from your <a href=\"http://localhost/index.php/publicknowledge/en/dashboard/mySubmissions?workflowSubmissionId=5\">submission dashboard</a>.</p><p>Kind regards,</p><p>Daniel Barnes</p>'),
(39,1048585,6,NULL,'2025-08-02 05:55:43',805306370,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Daniel Barnes\" <dbarnes@mailinator.com>','','','You have been assigned as an editor on a submission to Journal of Public Knowledge','<p>Dear Daniel Barnes,</p><p>The following submission has been assigned to you to see through the editorial process.</p><p><a href=\"http://localhost/index.php/publicknowledge/en/dashboard/editorial?workflowSubmissionId=6\">Investigating the Shared Background Required for Argument: A Critique of Fogelin\'s Thesis on Deep Disagreement</a><br />Dana Phillips</p><p><b>Abstract</b></p>Robert Fogelin claims that interlocutors must share a framework of background beliefs and commitments in order to fruitfully pursue argument. I refute Fogelin’s claim by investigating more thoroughly the shared background required for productive argument. I find that this background consists not in any common beliefs regarding the topic at hand, but rather in certain shared pro-cedural commitments and competencies. I suggest that Fogelin and his supporters mistakenly view shared beliefs as part of the required background for productive argument because these procedural com-mitments become more difficult to uphold when people’s beliefs diverge widely regarding the topic at hand.<p>If you find the submission to be relevant for Journal of Public Knowledge, please forward the submission to the review stage by selecting \"Send to Review\" and then assign reviewers by clicking \"Add Reviewer\".</p><p>If the submission is not appropriate for this journal, please decline the submission.</p><p>Thank you in advance.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Journal of Public Knowledge</a>.</p>'),
(40,1048585,6,NULL,'2025-08-02 05:55:44',805306370,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"David Buskins\" <dbuskins@mailinator.com>','','','You have been assigned as an editor on a submission to Journal of Public Knowledge','<p>Dear David Buskins,</p><p>The following submission has been assigned to you to see through the editorial process.</p><p><a href=\"http://localhost/index.php/publicknowledge/en/dashboard/editorial?workflowSubmissionId=6\">Investigating the Shared Background Required for Argument: A Critique of Fogelin\'s Thesis on Deep Disagreement</a><br />Dana Phillips</p><p><b>Abstract</b></p>Robert Fogelin claims that interlocutors must share a framework of background beliefs and commitments in order to fruitfully pursue argument. I refute Fogelin’s claim by investigating more thoroughly the shared background required for productive argument. I find that this background consists not in any common beliefs regarding the topic at hand, but rather in certain shared pro-cedural commitments and competencies. I suggest that Fogelin and his supporters mistakenly view shared beliefs as part of the required background for productive argument because these procedural com-mitments become more difficult to uphold when people’s beliefs diverge widely regarding the topic at hand.<p>If you find the submission to be relevant for Journal of Public Knowledge, please forward the submission to the review stage by selecting \"Send to Review\" and then assign reviewers by clicking \"Add Reviewer\".</p><p>If the submission is not appropriate for this journal, please decline the submission.</p><p>Thank you in advance.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Journal of Public Knowledge</a>.</p>'),
(41,1048585,6,NULL,'2025-08-02 05:55:44',805306370,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Stephanie Berardo\" <sberardo@mailinator.com>','','','You have been assigned as an editor on a submission to Journal of Public Knowledge','<p>Dear Stephanie Berardo,</p><p>The following submission has been assigned to you to see through the editorial process.</p><p><a href=\"http://localhost/index.php/publicknowledge/en/dashboard/editorial?workflowSubmissionId=6\">Investigating the Shared Background Required for Argument: A Critique of Fogelin\'s Thesis on Deep Disagreement</a><br />Dana Phillips</p><p><b>Abstract</b></p>Robert Fogelin claims that interlocutors must share a framework of background beliefs and commitments in order to fruitfully pursue argument. I refute Fogelin’s claim by investigating more thoroughly the shared background required for productive argument. I find that this background consists not in any common beliefs regarding the topic at hand, but rather in certain shared pro-cedural commitments and competencies. I suggest that Fogelin and his supporters mistakenly view shared beliefs as part of the required background for productive argument because these procedural com-mitments become more difficult to uphold when people’s beliefs diverge widely regarding the topic at hand.<p>If you find the submission to be relevant for Journal of Public Knowledge, please forward the submission to the review stage by selecting \"Send to Review\" and then assign reviewers by clicking \"Add Reviewer\".</p><p>If the submission is not appropriate for this journal, please decline the submission.</p><p>Thank you in advance.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Journal of Public Knowledge</a>.</p>'),
(42,1048585,6,NULL,'2025-08-02 05:55:44',536870914,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Dana Phillips\" <dphillips@mailinator.com>','','','Thank you for your submission to Journal of Public Knowledge','<p>Dear Dana Phillips,</p><p>Thank you for your submission to Journal of Public Knowledge. We have received your submission, \"Investigating the Shared Background Required for Argument: A Critique of Fogelin\'s Thesis on Deep Disagreement\", and a member of our editorial team will see it soon. You will be sent an email when an initial decision is made, and we may contact you for further information.</p><p>You can view your submission and track its progress through the editorial process at the following location:</p><p>Submission URL: http://localhost/index.php/publicknowledge/en/dashboard/mySubmissions?workflowSubmissionId=6</p><p>If you have been logged out, you can login again with the username dphillips.</p><p>If you have any questions, please contact me from your <a href=\"http://localhost/index.php/publicknowledge/en/dashboard/mySubmissions?workflowSubmissionId=6\">submission dashboard</a>.</p><p>Thank you for considering Journal of Public Knowledge as a venue for your work.</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Journal of Public Knowledge</a>.</p>'),
(43,1048585,6,3,'2025-08-02 05:55:49',805306369,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Dana Phillips\" <dphillips@mailinator.com>','','','Your submission has been sent for review','<p>Dear Dana Phillips,</p><p>I am pleased to inform you that an editor has reviewed your submission, \"Investigating the Shared Background Required for Argument: A Critique of Fogelin\'s Thesis on Deep Disagreement\", and has decided to send it for peer review. An editor will identify qualified reviewers who will provide feedback on your submission.</p><p>This journal conducts double-anonymous peer review. The reviewers will not see any identifying information about you or your co-authors. Similarly, you will not know who reviewed your submission, and you will not hear from the reviewers directly. You will hear from us with feedback from the reviewers and information about the next steps.</p><p>Please note that sending the submission to peer review does not guarantee that it will be published. We will consider the reviewers\' recommendations before deciding to accept the submission for publication. You may be asked to make revisions and respond to the reviewers\' comments before a final decision is made.</p><p>If you have any questions, please contact me from your submission dashboard.</p><p><p>Daniel Barnes</p></p>'),
(44,1048585,6,3,'2025-08-02 05:55:53',1073741833,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Julie Janssen\" <jjanssen@mailinator.com>','','','Invitation to review','<p>Dear Julie Janssen,</p>\r\n<p>I believe that you would serve as an excellent reviewer for a submission to Journal of Public Knowledge. The submission\'s title and abstract are below, and I hope that you will consider undertaking this important task for us.</p>\r\n<p>If you are able to review this submission, your review is due by 2025-08-30. You can view the submission, upload review files, and submit your review by logging into the journal site and following the steps at the link below.</p>\r\n<p><a href=\"http://localhost/index.php/publicknowledge/en/reviewer/submission?submissionId=6\">Investigating the Shared Background Required for Argument: A Critique of Fogelin\'s Thesis on Deep Disagreement</a></p>\r\n<p><strong>Abstract</strong></p>\r\n<p>Robert Fogelin claims that interlocutors must share a framework of background beliefs and commitments in order to fruitfully pursue argument. I refute Fogelin’s claim by investigating more thoroughly the shared background required for productive argument. I find that this background consists not in any common beliefs regarding the topic at hand, but rather in certain shared pro-cedural commitments and competencies. I suggest that Fogelin and his supporters mistakenly view shared beliefs as part of the required background for productive argument because these procedural com-mitments become more difficult to uphold when people’s beliefs diverge widely regarding the topic at hand.</p>\r\n<p>Please <a href=\"http://localhost/index.php/publicknowledge/en/reviewer/submission?submissionId=6\">accept or decline</a> the review by <strong>2025-08-30</strong>.</p>\r\n<p>You may contact me with any questions about the submission or the review process.</p>\r\n<p>Thank you for considering this request. Your help is much appreciated.</p>\r\n<p>Kind regards,</p>\r\n<p>Daniel Barnes</p>'),
(45,1048585,6,3,'2025-08-02 05:55:55',1073741833,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Adela Gallego\" <agallego@mailinator.com>','','','Invitation to review','<p>Dear Adela Gallego,</p>\r\n<p>I believe that you would serve as an excellent reviewer for a submission to Journal of Public Knowledge. The submission\'s title and abstract are below, and I hope that you will consider undertaking this important task for us.</p>\r\n<p>If you are able to review this submission, your review is due by 2025-08-30. You can view the submission, upload review files, and submit your review by logging into the journal site and following the steps at the link below.</p>\r\n<p><a href=\"http://localhost/index.php/publicknowledge/en/reviewer/submission?submissionId=6\">Investigating the Shared Background Required for Argument: A Critique of Fogelin\'s Thesis on Deep Disagreement</a></p>\r\n<p><strong>Abstract</strong></p>\r\n<p>Robert Fogelin claims that interlocutors must share a framework of background beliefs and commitments in order to fruitfully pursue argument. I refute Fogelin’s claim by investigating more thoroughly the shared background required for productive argument. I find that this background consists not in any common beliefs regarding the topic at hand, but rather in certain shared pro-cedural commitments and competencies. I suggest that Fogelin and his supporters mistakenly view shared beliefs as part of the required background for productive argument because these procedural com-mitments become more difficult to uphold when people’s beliefs diverge widely regarding the topic at hand.</p>\r\n<p>Please <a href=\"http://localhost/index.php/publicknowledge/en/reviewer/submission?submissionId=6\">accept or decline</a> the review by <strong>2025-08-30</strong>.</p>\r\n<p>You may contact me with any questions about the submission or the review process.</p>\r\n<p>Thank you for considering this request. Your help is much appreciated.</p>\r\n<p>Kind regards,</p>\r\n<p>Daniel Barnes</p>'),
(46,1048585,6,3,'2025-08-02 05:55:58',805306369,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Dana Phillips\" <dphillips@mailinator.com>','','','Your submission has been accepted to Journal of Public Knowledge','<p>Dear Dana Phillips,</p><p>I am pleased to inform you that we have decided to accept your submission without further revision. After careful review, we found your submission, Investigating the Shared Background Required for Argument: A Critique of Fogelin\'s Thesis on Deep Disagreement, to meet or exceed our expectations. We are excited to publish your piece in Journal of Public Knowledge and we thank you for choosing our journal as a venue for your work.</p><p>Your submission is now forthcoming in a future issue of Journal of Public Knowledge and you are welcome to include it in your list of publications. We recognize the hard work that goes into every successful submission and we want to congratulate you on reaching this stage.</p><p>Your submission will now undergo copy editing and formatting to prepare it for publication.</p><p>You will shortly receive further instructions.</p><p>If you have any questions, please contact me from your <a href=\"http://localhost/index.php/publicknowledge/en/dashboard/mySubmissions?workflowSubmissionId=6\">submission dashboard</a>.</p><p>Kind regards,</p><p>Daniel Barnes</p>'),
(47,1048585,6,3,'2025-08-02 05:56:05',805306369,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Dana Phillips\" <dphillips@mailinator.com>','','','Next steps for publishing your submission','<p>Dear Dana Phillips,</p><p>I am writing from Journal of Public Knowledge to let you know that the editing of your submission, \"Investigating the Shared Background Required for Argument: A Critique of Fogelin\'s Thesis on Deep Disagreement\", is complete. Your submission will now advance to the production stage, where the final galleys will be prepared for publication. We will contact you if we need any further assistance.</p><p>If you have any questions, please contact me from your <a href=\"http://localhost/index.php/publicknowledge/en/dashboard/mySubmissions?workflowSubmissionId=6\">submission dashboard</a>.</p><p>Kind regards,</p><p>Daniel Barnes</p>'),
(48,1048585,7,NULL,'2025-08-02 05:56:19',805306370,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Daniel Barnes\" <dbarnes@mailinator.com>','','','You have been assigned as an editor on a submission to Journal of Public Knowledge','<p>Dear Daniel Barnes,</p><p>The following submission has been assigned to you to see through the editorial process.</p><p><a href=\"http://localhost/index.php/publicknowledge/en/dashboard/editorial?workflowSubmissionId=7\">Developing efficacy beliefs in the classroom</a><br />Domatilia Sokoloff</p><p><b>Abstract</b></p>A major goal of education is to equip children with the knowledge, skills and self-belief to be confident and informed citizens - citizens who continue to see themselves as learners beyond graduation. This paper looks at the key role of nurturing efficacy beliefs in order to learn and participate in school and society. Research findings conducted within a social studies context are presented, showing how strategy instruction can enhance self-efficacy for learning. As part of this research, Creative Problem Solving (CPS) was taught to children as a means to motivate and support learning. It is shown that the use of CPS can have positive effects on self-efficacy for learning, and be a valuable framework to involve children in decision-making that leads to social action. Implications for enhancing self-efficacy and motivation to learn in the classroom are discussed.<p>If you find the submission to be relevant for Journal of Public Knowledge, please forward the submission to the review stage by selecting \"Send to Review\" and then assign reviewers by clicking \"Add Reviewer\".</p><p>If the submission is not appropriate for this journal, please decline the submission.</p><p>Thank you in advance.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Journal of Public Knowledge</a>.</p>'),
(49,1048585,7,NULL,'2025-08-02 05:56:19',805306370,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"David Buskins\" <dbuskins@mailinator.com>','','','You have been assigned as an editor on a submission to Journal of Public Knowledge','<p>Dear David Buskins,</p><p>The following submission has been assigned to you to see through the editorial process.</p><p><a href=\"http://localhost/index.php/publicknowledge/en/dashboard/editorial?workflowSubmissionId=7\">Developing efficacy beliefs in the classroom</a><br />Domatilia Sokoloff</p><p><b>Abstract</b></p>A major goal of education is to equip children with the knowledge, skills and self-belief to be confident and informed citizens - citizens who continue to see themselves as learners beyond graduation. This paper looks at the key role of nurturing efficacy beliefs in order to learn and participate in school and society. Research findings conducted within a social studies context are presented, showing how strategy instruction can enhance self-efficacy for learning. As part of this research, Creative Problem Solving (CPS) was taught to children as a means to motivate and support learning. It is shown that the use of CPS can have positive effects on self-efficacy for learning, and be a valuable framework to involve children in decision-making that leads to social action. Implications for enhancing self-efficacy and motivation to learn in the classroom are discussed.<p>If you find the submission to be relevant for Journal of Public Knowledge, please forward the submission to the review stage by selecting \"Send to Review\" and then assign reviewers by clicking \"Add Reviewer\".</p><p>If the submission is not appropriate for this journal, please decline the submission.</p><p>Thank you in advance.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Journal of Public Knowledge</a>.</p>'),
(50,1048585,7,NULL,'2025-08-02 05:56:19',805306370,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Stephanie Berardo\" <sberardo@mailinator.com>','','','You have been assigned as an editor on a submission to Journal of Public Knowledge','<p>Dear Stephanie Berardo,</p><p>The following submission has been assigned to you to see through the editorial process.</p><p><a href=\"http://localhost/index.php/publicknowledge/en/dashboard/editorial?workflowSubmissionId=7\">Developing efficacy beliefs in the classroom</a><br />Domatilia Sokoloff</p><p><b>Abstract</b></p>A major goal of education is to equip children with the knowledge, skills and self-belief to be confident and informed citizens - citizens who continue to see themselves as learners beyond graduation. This paper looks at the key role of nurturing efficacy beliefs in order to learn and participate in school and society. Research findings conducted within a social studies context are presented, showing how strategy instruction can enhance self-efficacy for learning. As part of this research, Creative Problem Solving (CPS) was taught to children as a means to motivate and support learning. It is shown that the use of CPS can have positive effects on self-efficacy for learning, and be a valuable framework to involve children in decision-making that leads to social action. Implications for enhancing self-efficacy and motivation to learn in the classroom are discussed.<p>If you find the submission to be relevant for Journal of Public Knowledge, please forward the submission to the review stage by selecting \"Send to Review\" and then assign reviewers by clicking \"Add Reviewer\".</p><p>If the submission is not appropriate for this journal, please decline the submission.</p><p>Thank you in advance.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Journal of Public Knowledge</a>.</p>'),
(51,1048585,7,NULL,'2025-08-02 05:56:19',536870914,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Domatilia Sokoloff\" <dsokoloff@mailinator.com>','','','Thank you for your submission to Journal of Public Knowledge','<p>Dear Domatilia Sokoloff,</p><p>Thank you for your submission to Journal of Public Knowledge. We have received your submission, \"Developing efficacy beliefs in the classroom\", and a member of our editorial team will see it soon. You will be sent an email when an initial decision is made, and we may contact you for further information.</p><p>You can view your submission and track its progress through the editorial process at the following location:</p><p>Submission URL: http://localhost/index.php/publicknowledge/en/dashboard/mySubmissions?workflowSubmissionId=7</p><p>If you have been logged out, you can login again with the username dsokoloff.</p><p>If you have any questions, please contact me from your <a href=\"http://localhost/index.php/publicknowledge/en/dashboard/mySubmissions?workflowSubmissionId=7\">submission dashboard</a>.</p><p>Thank you for considering Journal of Public Knowledge as a venue for your work.</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Journal of Public Knowledge</a>.</p>'),
(52,1048585,7,3,'2025-08-02 05:56:24',805306369,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Domatilia Sokoloff\" <dsokoloff@mailinator.com>','','','Your submission has been sent for review','<p>Dear Domatilia Sokoloff,</p><p>I am pleased to inform you that an editor has reviewed your submission, \"Developing efficacy beliefs in the classroom\", and has decided to send it for peer review. An editor will identify qualified reviewers who will provide feedback on your submission.</p><p>This journal conducts double-anonymous peer review. The reviewers will not see any identifying information about you or your co-authors. Similarly, you will not know who reviewed your submission, and you will not hear from the reviewers directly. You will hear from us with feedback from the reviewers and information about the next steps.</p><p>Please note that sending the submission to peer review does not guarantee that it will be published. We will consider the reviewers\' recommendations before deciding to accept the submission for publication. You may be asked to make revisions and respond to the reviewers\' comments before a final decision is made.</p><p>If you have any questions, please contact me from your submission dashboard.</p><p><p>Daniel Barnes</p></p>'),
(53,1048585,7,3,'2025-08-02 05:56:28',1073741833,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Paul Hudson\" <phudson@mailinator.com>','','','Invitation to review','<p>Dear Paul Hudson,</p>\r\n<p>I believe that you would serve as an excellent reviewer for a submission to Journal of Public Knowledge. The submission\'s title and abstract are below, and I hope that you will consider undertaking this important task for us.</p>\r\n<p>If you are able to review this submission, your review is due by 2025-08-30. You can view the submission, upload review files, and submit your review by logging into the journal site and following the steps at the link below.</p>\r\n<p><a href=\"http://localhost/index.php/publicknowledge/en/reviewer/submission?submissionId=7\">Developing efficacy beliefs in the classroom</a></p>\r\n<p><strong>Abstract</strong></p>\r\n<p>A major goal of education is to equip children with the knowledge, skills and self-belief to be confident and informed citizens - citizens who continue to see themselves as learners beyond graduation. This paper looks at the key role of nurturing efficacy beliefs in order to learn and participate in school and society. Research findings conducted within a social studies context are presented, showing how strategy instruction can enhance self-efficacy for learning. As part of this research, Creative Problem Solving (CPS) was taught to children as a means to motivate and support learning. It is shown that the use of CPS can have positive effects on self-efficacy for learning, and be a valuable framework to involve children in decision-making that leads to social action. Implications for enhancing self-efficacy and motivation to learn in the classroom are discussed.</p>\r\n<p>Please <a href=\"http://localhost/index.php/publicknowledge/en/reviewer/submission?submissionId=7\">accept or decline</a> the review by <strong>2025-08-30</strong>.</p>\r\n<p>You may contact me with any questions about the submission or the review process.</p>\r\n<p>Thank you for considering this request. Your help is much appreciated.</p>\r\n<p>Kind regards,</p>\r\n<p>Daniel Barnes</p>'),
(54,1048585,7,3,'2025-08-02 05:56:30',1073741833,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Aisla McCrae\" <amccrae@mailinator.com>','','','Invitation to review','<p>Dear Aisla McCrae,</p>\r\n<p>I believe that you would serve as an excellent reviewer for a submission to Journal of Public Knowledge. The submission\'s title and abstract are below, and I hope that you will consider undertaking this important task for us.</p>\r\n<p>If you are able to review this submission, your review is due by 2025-08-30. You can view the submission, upload review files, and submit your review by logging into the journal site and following the steps at the link below.</p>\r\n<p><a href=\"http://localhost/index.php/publicknowledge/en/reviewer/submission?submissionId=7\">Developing efficacy beliefs in the classroom</a></p>\r\n<p><strong>Abstract</strong></p>\r\n<p>A major goal of education is to equip children with the knowledge, skills and self-belief to be confident and informed citizens - citizens who continue to see themselves as learners beyond graduation. This paper looks at the key role of nurturing efficacy beliefs in order to learn and participate in school and society. Research findings conducted within a social studies context are presented, showing how strategy instruction can enhance self-efficacy for learning. As part of this research, Creative Problem Solving (CPS) was taught to children as a means to motivate and support learning. It is shown that the use of CPS can have positive effects on self-efficacy for learning, and be a valuable framework to involve children in decision-making that leads to social action. Implications for enhancing self-efficacy and motivation to learn in the classroom are discussed.</p>\r\n<p>Please <a href=\"http://localhost/index.php/publicknowledge/en/reviewer/submission?submissionId=7\">accept or decline</a> the review by <strong>2025-08-30</strong>.</p>\r\n<p>You may contact me with any questions about the submission or the review process.</p>\r\n<p>Thank you for considering this request. Your help is much appreciated.</p>\r\n<p>Kind regards,</p>\r\n<p>Daniel Barnes</p>'),
(55,1048585,7,3,'2025-08-02 05:56:33',1073741833,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Adela Gallego\" <agallego@mailinator.com>','','','Invitation to review','<p>Dear Adela Gallego,</p>\r\n<p>I believe that you would serve as an excellent reviewer for a submission to Journal of Public Knowledge. The submission\'s title and abstract are below, and I hope that you will consider undertaking this important task for us.</p>\r\n<p>If you are able to review this submission, your review is due by 2025-08-30. You can view the submission, upload review files, and submit your review by logging into the journal site and following the steps at the link below.</p>\r\n<p><a href=\"http://localhost/index.php/publicknowledge/en/reviewer/submission?submissionId=7\">Developing efficacy beliefs in the classroom</a></p>\r\n<p><strong>Abstract</strong></p>\r\n<p>A major goal of education is to equip children with the knowledge, skills and self-belief to be confident and informed citizens - citizens who continue to see themselves as learners beyond graduation. This paper looks at the key role of nurturing efficacy beliefs in order to learn and participate in school and society. Research findings conducted within a social studies context are presented, showing how strategy instruction can enhance self-efficacy for learning. As part of this research, Creative Problem Solving (CPS) was taught to children as a means to motivate and support learning. It is shown that the use of CPS can have positive effects on self-efficacy for learning, and be a valuable framework to involve children in decision-making that leads to social action. Implications for enhancing self-efficacy and motivation to learn in the classroom are discussed.</p>\r\n<p>Please <a href=\"http://localhost/index.php/publicknowledge/en/reviewer/submission?submissionId=7\">accept or decline</a> the review by <strong>2025-08-30</strong>.</p>\r\n<p>You may contact me with any questions about the submission or the review process.</p>\r\n<p>Thank you for considering this request. Your help is much appreciated.</p>\r\n<p>Kind regards,</p>\r\n<p>Daniel Barnes</p>'),
(56,1048585,7,8,'2025-08-02 05:56:37',1073741829,'\"Paul Hudson\" <phudson@mailinator.com>','\"Daniel Barnes\" <dbarnes@mailinator.com>, \"David Buskins\" <dbuskins@mailinator.com>, \"Stephanie Berardo\" <sberardo@mailinator.com>','','','Review accepted: Paul Hudson accepted review assignment for #7 Sokoloff — \"Developing efficacy beliefs in the classroom\"','<p>Dear Daniel Barnes, David Buskins, Stephanie Berardo,</p><p>Paul Hudson has accepted the following review:</p><p><a href=\"http://localhost/index.php/publicknowledge/en/dashboard/editorial?workflowSubmissionId=7\">#7 Sokoloff — \"Developing efficacy beliefs in the classroom\"</a><br /><b>Type:</b> Anonymous Reviewer/Anonymous Author</p><p><b>Review Due:</b> 2025-08-30</p><p>Login to <a href=\"http://localhost/index.php/publicknowledge/en/dashboard/editorial?workflowSubmissionId=7\">view all reviewer assignments</a> for this submission.</p><br><br>—<br>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge/en\">Journal of Public Knowledge</a>.'),
(57,1048585,7,3,'2025-08-02 05:56:40',1073741836,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Daniel Barnes\" <dbarnes@mailinator.com>','','','Review complete: Paul Hudson recommends Choose One for #7 Sokoloff — \"Developing efficacy beliefs in the classroom\"','<p>Dear Daniel Barnes,</p><p>Paul Hudson completed the following review:</p><p><a href=\"http://localhost/index.php/publicknowledge/en/dashboard/editorial?workflowSubmissionId=7\">#7 Sokoloff — \"Developing efficacy beliefs in the classroom\"</a><br /><b>Recommendation:</b> Choose One<br /><b>Type:</b> Anonymous Reviewer/Anonymous Author</p><p>Login to <a href=\"http://localhost/index.php/publicknowledge/en/dashboard/editorial?workflowSubmissionId=7\">view all files and comments</a> provided by this reviewer.</p>'),
(58,1048585,7,4,'2025-08-02 05:56:40',1073741836,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"David Buskins\" <dbuskins@mailinator.com>','','','Review complete: Paul Hudson recommends Choose One for #7 Sokoloff — \"Developing efficacy beliefs in the classroom\"','<p>Dear David Buskins,</p><p>Paul Hudson completed the following review:</p><p><a href=\"http://localhost/index.php/publicknowledge/en/dashboard/editorial?workflowSubmissionId=7\">#7 Sokoloff — \"Developing efficacy beliefs in the classroom\"</a><br /><b>Recommendation:</b> Choose One<br /><b>Type:</b> Anonymous Reviewer/Anonymous Author</p><p>Login to <a href=\"http://localhost/index.php/publicknowledge/en/dashboard/editorial?workflowSubmissionId=7\">view all files and comments</a> provided by this reviewer.</p>'),
(59,1048585,7,5,'2025-08-02 05:56:40',1073741836,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Stephanie Berardo\" <sberardo@mailinator.com>','','','Review complete: Paul Hudson recommends Choose One for #7 Sokoloff — \"Developing efficacy beliefs in the classroom\"','<p>Dear Stephanie Berardo,</p><p>Paul Hudson completed the following review:</p><p><a href=\"http://localhost/index.php/publicknowledge/en/dashboard/editorial?workflowSubmissionId=7\">#7 Sokoloff — \"Developing efficacy beliefs in the classroom\"</a><br /><b>Recommendation:</b> Choose One<br /><b>Type:</b> Anonymous Reviewer/Anonymous Author</p><p>Login to <a href=\"http://localhost/index.php/publicknowledge/en/dashboard/editorial?workflowSubmissionId=7\">view all files and comments</a> provided by this reviewer.</p>'),
(60,1048585,8,NULL,'2025-08-02 05:56:50',805306370,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Daniel Barnes\" <dbarnes@mailinator.com>','','','You have been assigned as an editor on a submission to Journal of Public Knowledge','<p>Dear Daniel Barnes,</p><p>The following submission has been assigned to you to see through the editorial process.</p><p><a href=\"http://localhost/index.php/publicknowledge/en/dashboard/editorial?workflowSubmissionId=8\">Traditions and Trends in the Study of the Commons</a><br />Elinor Ostrom, Frank van Laerhoven</p><p><b>Abstract</b></p>The study of the commons has expe- rienced substantial growth and development over the past decades.1 Distinguished scholars in many disciplines had long studied how specific resources were managed or mismanaged at particular times and places (Coward 1980; De los Reyes 1980; MacKenzie 1979; Wittfogel 1957), but researchers who studied specific commons before the mid-1980s were, however, less likely than their contemporary colleagues to be well informed about the work of scholars in other disciplines, about other sec- tors in their own region of interest, or in other regions of the world.<p>If you find the submission to be relevant for Journal of Public Knowledge, please forward the submission to the review stage by selecting \"Send to Review\" and then assign reviewers by clicking \"Add Reviewer\".</p><p>If the submission is not appropriate for this journal, please decline the submission.</p><p>Thank you in advance.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Journal of Public Knowledge</a>.</p>'),
(61,1048585,8,NULL,'2025-08-02 05:56:50',805306370,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"David Buskins\" <dbuskins@mailinator.com>','','','You have been assigned as an editor on a submission to Journal of Public Knowledge','<p>Dear David Buskins,</p><p>The following submission has been assigned to you to see through the editorial process.</p><p><a href=\"http://localhost/index.php/publicknowledge/en/dashboard/editorial?workflowSubmissionId=8\">Traditions and Trends in the Study of the Commons</a><br />Elinor Ostrom, Frank van Laerhoven</p><p><b>Abstract</b></p>The study of the commons has expe- rienced substantial growth and development over the past decades.1 Distinguished scholars in many disciplines had long studied how specific resources were managed or mismanaged at particular times and places (Coward 1980; De los Reyes 1980; MacKenzie 1979; Wittfogel 1957), but researchers who studied specific commons before the mid-1980s were, however, less likely than their contemporary colleagues to be well informed about the work of scholars in other disciplines, about other sec- tors in their own region of interest, or in other regions of the world.<p>If you find the submission to be relevant for Journal of Public Knowledge, please forward the submission to the review stage by selecting \"Send to Review\" and then assign reviewers by clicking \"Add Reviewer\".</p><p>If the submission is not appropriate for this journal, please decline the submission.</p><p>Thank you in advance.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Journal of Public Knowledge</a>.</p>'),
(62,1048585,8,NULL,'2025-08-02 05:56:50',805306370,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Stephanie Berardo\" <sberardo@mailinator.com>','','','You have been assigned as an editor on a submission to Journal of Public Knowledge','<p>Dear Stephanie Berardo,</p><p>The following submission has been assigned to you to see through the editorial process.</p><p><a href=\"http://localhost/index.php/publicknowledge/en/dashboard/editorial?workflowSubmissionId=8\">Traditions and Trends in the Study of the Commons</a><br />Elinor Ostrom, Frank van Laerhoven</p><p><b>Abstract</b></p>The study of the commons has expe- rienced substantial growth and development over the past decades.1 Distinguished scholars in many disciplines had long studied how specific resources were managed or mismanaged at particular times and places (Coward 1980; De los Reyes 1980; MacKenzie 1979; Wittfogel 1957), but researchers who studied specific commons before the mid-1980s were, however, less likely than their contemporary colleagues to be well informed about the work of scholars in other disciplines, about other sec- tors in their own region of interest, or in other regions of the world.<p>If you find the submission to be relevant for Journal of Public Knowledge, please forward the submission to the review stage by selecting \"Send to Review\" and then assign reviewers by clicking \"Add Reviewer\".</p><p>If the submission is not appropriate for this journal, please decline the submission.</p><p>Thank you in advance.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Journal of Public Knowledge</a>.</p>'),
(63,1048585,8,NULL,'2025-08-02 05:56:50',536870914,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Elinor Ostrom\" <eostrom@mailinator.com>','','','Thank you for your submission to Journal of Public Knowledge','<p>Dear Elinor Ostrom,</p><p>Thank you for your submission to Journal of Public Knowledge. We have received your submission, \"Traditions and Trends in the Study of the Commons\", and a member of our editorial team will see it soon. You will be sent an email when an initial decision is made, and we may contact you for further information.</p><p>You can view your submission and track its progress through the editorial process at the following location:</p><p>Submission URL: http://localhost/index.php/publicknowledge/en/dashboard/mySubmissions?workflowSubmissionId=8</p><p>If you have been logged out, you can login again with the username eostrom.</p><p>If you have any questions, please contact me from your <a href=\"http://localhost/index.php/publicknowledge/en/dashboard/mySubmissions?workflowSubmissionId=8\">submission dashboard</a>.</p><p>Thank you for considering Journal of Public Knowledge as a venue for your work.</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Journal of Public Knowledge</a>.</p>'),
(64,1048585,8,NULL,'2025-08-02 05:56:50',536870914,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Frank van Laerhoven\" <fvanlaerhoven@mailinator.com>','','','Submission confirmation','<p>Dear Frank van Laerhoven,</p><p>You have been named as a co-author on a submission to Journal of Public Knowledge. The submitter, Elinor Ostrom, provided the following details:</p><p>\"Traditions and Trends in the Study of the Commons\"<br></p><p>If any of these details are incorrect, or you do not wish to be named on this submission, please contact me.</p><p>Thank you for considering Journal of Public Knowledge as a venue for your work.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Journal of Public Knowledge</a>.</p>'),
(65,1048585,9,NULL,'2025-08-02 05:56:59',805306370,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Daniel Barnes\" <dbarnes@mailinator.com>','','','You have been assigned as an editor on a submission to Journal of Public Knowledge','<p>Dear Daniel Barnes,</p><p>The following submission has been assigned to you to see through the editorial process.</p><p><a href=\"http://localhost/index.php/publicknowledge/en/dashboard/editorial?workflowSubmissionId=9\">Hansen & Pinto: Reason Reclaimed</a><br />Fabio Paglieri</p><p><b>Abstract</b></p>None.<p>If you find the submission to be relevant for Journal of Public Knowledge, please forward the submission to the review stage by selecting \"Send to Review\" and then assign reviewers by clicking \"Add Reviewer\".</p><p>If the submission is not appropriate for this journal, please decline the submission.</p><p>Thank you in advance.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Journal of Public Knowledge</a>.</p>'),
(66,1048585,9,NULL,'2025-08-02 05:56:59',805306370,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Minoti Inoue\" <minoue@mailinator.com>','','','You have been assigned as an editor on a submission to Journal of Public Knowledge','<p>Dear Minoti Inoue,</p><p>The following submission has been assigned to you to see through the editorial process.</p><p><a href=\"http://localhost/index.php/publicknowledge/en/dashboard/editorial?workflowSubmissionId=9\">Hansen & Pinto: Reason Reclaimed</a><br />Fabio Paglieri</p><p><b>Abstract</b></p>None.<p>If you find the submission to be relevant for Journal of Public Knowledge, please forward the submission to the review stage by selecting \"Send to Review\" and then assign reviewers by clicking \"Add Reviewer\".</p><p>If the submission is not appropriate for this journal, please decline the submission.</p><p>Thank you in advance.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Journal of Public Knowledge</a>.</p>'),
(67,1048585,9,NULL,'2025-08-02 05:56:59',536870914,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Fabio Paglieri\" <fpaglieri@mailinator.com>','','','Thank you for your submission to Journal of Public Knowledge','<p>Dear Fabio Paglieri,</p><p>Thank you for your submission to Journal of Public Knowledge. We have received your submission, \"Hansen & Pinto: Reason Reclaimed\", and a member of our editorial team will see it soon. You will be sent an email when an initial decision is made, and we may contact you for further information.</p><p>You can view your submission and track its progress through the editorial process at the following location:</p><p>Submission URL: http://localhost/index.php/publicknowledge/en/dashboard/mySubmissions?workflowSubmissionId=9</p><p>If you have been logged out, you can login again with the username fpaglieri.</p><p>If you have any questions, please contact me from your <a href=\"http://localhost/index.php/publicknowledge/en/dashboard/mySubmissions?workflowSubmissionId=9\">submission dashboard</a>.</p><p>Thank you for considering Journal of Public Knowledge as a venue for your work.</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Journal of Public Knowledge</a>.</p>'),
(68,1048585,9,3,'2025-08-02 05:57:05',805306369,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Fabio Paglieri\" <fpaglieri@mailinator.com>','','','Your submission has been sent for review','<p>Dear Fabio Paglieri,</p><p>I am pleased to inform you that an editor has reviewed your submission, \"Hansen & Pinto: Reason Reclaimed\", and has decided to send it for peer review. An editor will identify qualified reviewers who will provide feedback on your submission.</p><p>This journal conducts double-anonymous peer review. The reviewers will not see any identifying information about you or your co-authors. Similarly, you will not know who reviewed your submission, and you will not hear from the reviewers directly. You will hear from us with feedback from the reviewers and information about the next steps.</p><p>Please note that sending the submission to peer review does not guarantee that it will be published. We will consider the reviewers\' recommendations before deciding to accept the submission for publication. You may be asked to make revisions and respond to the reviewers\' comments before a final decision is made.</p><p>If you have any questions, please contact me from your submission dashboard.</p><p><p>Daniel Barnes</p></p>'),
(69,1048585,9,3,'2025-08-02 05:57:09',1073741833,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Julie Janssen\" <jjanssen@mailinator.com>','','','Invitation to review','<p>Dear Julie Janssen,</p>\r\n<p>I believe that you would serve as an excellent reviewer for a submission to Journal of Public Knowledge. The submission\'s title and abstract are below, and I hope that you will consider undertaking this important task for us.</p>\r\n<p>If you are able to review this submission, your review is due by 2025-08-30. You can view the submission, upload review files, and submit your review by logging into the journal site and following the steps at the link below.</p>\r\n<p><a href=\"http://localhost/index.php/publicknowledge/en/reviewer/submission?submissionId=9\">Hansen &amp; Pinto: Reason Reclaimed</a></p>\r\n<p><strong>Abstract</strong></p>\r\n<p>None.</p>\r\n<p>Please <a href=\"http://localhost/index.php/publicknowledge/en/reviewer/submission?submissionId=9\">accept or decline</a> the review by <strong>2025-08-30</strong>.</p>\r\n<p>You may contact me with any questions about the submission or the review process.</p>\r\n<p>Thank you for considering this request. Your help is much appreciated.</p>\r\n<p>Kind regards,</p>\r\n<p>Daniel Barnes</p>'),
(70,1048585,9,3,'2025-08-02 05:57:11',1073741833,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Adela Gallego\" <agallego@mailinator.com>','','','Invitation to review','<p>Dear Adela Gallego,</p>\r\n<p>I believe that you would serve as an excellent reviewer for a submission to Journal of Public Knowledge. The submission\'s title and abstract are below, and I hope that you will consider undertaking this important task for us.</p>\r\n<p>If you are able to review this submission, your review is due by 2025-08-30. You can view the submission, upload review files, and submit your review by logging into the journal site and following the steps at the link below.</p>\r\n<p><a href=\"http://localhost/index.php/publicknowledge/en/reviewer/submission?submissionId=9\">Hansen &amp; Pinto: Reason Reclaimed</a></p>\r\n<p><strong>Abstract</strong></p>\r\n<p>None.</p>\r\n<p>Please <a href=\"http://localhost/index.php/publicknowledge/en/reviewer/submission?submissionId=9\">accept or decline</a> the review by <strong>2025-08-30</strong>.</p>\r\n<p>You may contact me with any questions about the submission or the review process.</p>\r\n<p>Thank you for considering this request. Your help is much appreciated.</p>\r\n<p>Kind regards,</p>\r\n<p>Daniel Barnes</p>'),
(71,1048585,9,3,'2025-08-02 05:57:14',805306369,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Fabio Paglieri\" <fpaglieri@mailinator.com>','','','Your submission has been accepted to Journal of Public Knowledge','<p>Dear Fabio Paglieri,</p><p>I am pleased to inform you that we have decided to accept your submission without further revision. After careful review, we found your submission, Hansen & Pinto: Reason Reclaimed, to meet or exceed our expectations. We are excited to publish your piece in Journal of Public Knowledge and we thank you for choosing our journal as a venue for your work.</p><p>Your submission is now forthcoming in a future issue of Journal of Public Knowledge and you are welcome to include it in your list of publications. We recognize the hard work that goes into every successful submission and we want to congratulate you on reaching this stage.</p><p>Your submission will now undergo copy editing and formatting to prepare it for publication.</p><p>You will shortly receive further instructions.</p><p>If you have any questions, please contact me from your <a href=\"http://localhost/index.php/publicknowledge/en/dashboard/mySubmissions?workflowSubmissionId=9\">submission dashboard</a>.</p><p>Kind regards,</p><p>Daniel Barnes</p>'),
(72,1048585,9,3,'2025-08-02 05:57:22',805306369,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Fabio Paglieri\" <fpaglieri@mailinator.com>','','','Next steps for publishing your submission','<p>Dear Fabio Paglieri,</p><p>I am writing from Journal of Public Knowledge to let you know that the editing of your submission, \"Hansen & Pinto: Reason Reclaimed\", is complete. Your submission will now advance to the production stage, where the final galleys will be prepared for publication. We will contact you if we need any further assistance.</p><p>If you have any questions, please contact me from your <a href=\"http://localhost/index.php/publicknowledge/en/dashboard/mySubmissions?workflowSubmissionId=9\">submission dashboard</a>.</p><p>Kind regards,</p><p>Daniel Barnes</p>'),
(73,1048585,10,NULL,'2025-08-02 05:57:38',805306370,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Daniel Barnes\" <dbarnes@mailinator.com>','','','You have been assigned as an editor on a submission to Journal of Public Knowledge','<p>Dear Daniel Barnes,</p><p>The following submission has been assigned to you to see through the editorial process.</p><p><a href=\"http://localhost/index.php/publicknowledge/en/dashboard/editorial?workflowSubmissionId=10\">Condensing Water Availability Models to Focus on Specific Water Management Systems</a><br />John Novak</p><p><b>Abstract</b></p>The Texas Water Availability Modeling System is routinely applied in administration of the water rights permit system, regional and statewide planning, and an expanding variety of other endeavors. Modeling water management in the 23 river basins of the state reflects about 8,000 water right permits and 3,400 reservoirs. Datasets are necessarily large and complex to provide the decision-support capabilities for which the modeling system was developed. New modeling features are being added, and the different types of applications are growing. Certain applications are enhanced by simplifying the simulation input datasets to focus on particular water management systems. A methodology is presented for developing a condensed dataset for a selected reservoir system that reflects the impacts of all the water rights and accompanying reservoirs removed from the original complete dataset. A set of streamflows is developed that represents flows available to the selected system considering the effects of all the other water rights in the river basin contained in the original complete model input dataset that are not included in the condensed dataset. The methodology is applied to develop a condensed model of the Brazos River Authority reservoir system based on modifying the Texas Water Availability Modeling System dataset for the Brazos River Basin.<p>If you find the submission to be relevant for Journal of Public Knowledge, please forward the submission to the review stage by selecting \"Send to Review\" and then assign reviewers by clicking \"Add Reviewer\".</p><p>If the submission is not appropriate for this journal, please decline the submission.</p><p>Thank you in advance.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Journal of Public Knowledge</a>.</p>'),
(74,1048585,10,NULL,'2025-08-02 05:57:38',805306370,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"David Buskins\" <dbuskins@mailinator.com>','','','You have been assigned as an editor on a submission to Journal of Public Knowledge','<p>Dear David Buskins,</p><p>The following submission has been assigned to you to see through the editorial process.</p><p><a href=\"http://localhost/index.php/publicknowledge/en/dashboard/editorial?workflowSubmissionId=10\">Condensing Water Availability Models to Focus on Specific Water Management Systems</a><br />John Novak</p><p><b>Abstract</b></p>The Texas Water Availability Modeling System is routinely applied in administration of the water rights permit system, regional and statewide planning, and an expanding variety of other endeavors. Modeling water management in the 23 river basins of the state reflects about 8,000 water right permits and 3,400 reservoirs. Datasets are necessarily large and complex to provide the decision-support capabilities for which the modeling system was developed. New modeling features are being added, and the different types of applications are growing. Certain applications are enhanced by simplifying the simulation input datasets to focus on particular water management systems. A methodology is presented for developing a condensed dataset for a selected reservoir system that reflects the impacts of all the water rights and accompanying reservoirs removed from the original complete dataset. A set of streamflows is developed that represents flows available to the selected system considering the effects of all the other water rights in the river basin contained in the original complete model input dataset that are not included in the condensed dataset. The methodology is applied to develop a condensed model of the Brazos River Authority reservoir system based on modifying the Texas Water Availability Modeling System dataset for the Brazos River Basin.<p>If you find the submission to be relevant for Journal of Public Knowledge, please forward the submission to the review stage by selecting \"Send to Review\" and then assign reviewers by clicking \"Add Reviewer\".</p><p>If the submission is not appropriate for this journal, please decline the submission.</p><p>Thank you in advance.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Journal of Public Knowledge</a>.</p>'),
(75,1048585,10,NULL,'2025-08-02 05:57:38',805306370,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Stephanie Berardo\" <sberardo@mailinator.com>','','','You have been assigned as an editor on a submission to Journal of Public Knowledge','<p>Dear Stephanie Berardo,</p><p>The following submission has been assigned to you to see through the editorial process.</p><p><a href=\"http://localhost/index.php/publicknowledge/en/dashboard/editorial?workflowSubmissionId=10\">Condensing Water Availability Models to Focus on Specific Water Management Systems</a><br />John Novak</p><p><b>Abstract</b></p>The Texas Water Availability Modeling System is routinely applied in administration of the water rights permit system, regional and statewide planning, and an expanding variety of other endeavors. Modeling water management in the 23 river basins of the state reflects about 8,000 water right permits and 3,400 reservoirs. Datasets are necessarily large and complex to provide the decision-support capabilities for which the modeling system was developed. New modeling features are being added, and the different types of applications are growing. Certain applications are enhanced by simplifying the simulation input datasets to focus on particular water management systems. A methodology is presented for developing a condensed dataset for a selected reservoir system that reflects the impacts of all the water rights and accompanying reservoirs removed from the original complete dataset. A set of streamflows is developed that represents flows available to the selected system considering the effects of all the other water rights in the river basin contained in the original complete model input dataset that are not included in the condensed dataset. The methodology is applied to develop a condensed model of the Brazos River Authority reservoir system based on modifying the Texas Water Availability Modeling System dataset for the Brazos River Basin.<p>If you find the submission to be relevant for Journal of Public Knowledge, please forward the submission to the review stage by selecting \"Send to Review\" and then assign reviewers by clicking \"Add Reviewer\".</p><p>If the submission is not appropriate for this journal, please decline the submission.</p><p>Thank you in advance.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Journal of Public Knowledge</a>.</p>'),
(76,1048585,10,NULL,'2025-08-02 05:57:38',536870914,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"John Novak\" <jnovak@mailinator.com>','','','Thank you for your submission to Journal of Public Knowledge','<p>Dear John Novak,</p><p>Thank you for your submission to Journal of Public Knowledge. We have received your submission, \"Condensing Water Availability Models to Focus on Specific Water Management Systems\", and a member of our editorial team will see it soon. You will be sent an email when an initial decision is made, and we may contact you for further information.</p><p>You can view your submission and track its progress through the editorial process at the following location:</p><p>Submission URL: http://localhost/index.php/publicknowledge/en/dashboard/mySubmissions?workflowSubmissionId=10</p><p>If you have been logged out, you can login again with the username jnovak.</p><p>If you have any questions, please contact me from your <a href=\"http://localhost/index.php/publicknowledge/en/dashboard/mySubmissions?workflowSubmissionId=10\">submission dashboard</a>.</p><p>Thank you for considering Journal of Public Knowledge as a venue for your work.</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Journal of Public Knowledge</a>.</p>'),
(77,1048585,10,3,'2025-08-02 05:57:45',805306369,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"John Novak\" <jnovak@mailinator.com>','','','Your submission has been sent for review','<p>Dear John Novak,</p><p>I am pleased to inform you that an editor has reviewed your submission, \"Condensing Water Availability Models to Focus on Specific Water Management Systems\", and has decided to send it for peer review. An editor will identify qualified reviewers who will provide feedback on your submission.</p><p>This journal conducts double-anonymous peer review. The reviewers will not see any identifying information about you or your co-authors. Similarly, you will not know who reviewed your submission, and you will not hear from the reviewers directly. You will hear from us with feedback from the reviewers and information about the next steps.</p><p>Please note that sending the submission to peer review does not guarantee that it will be published. We will consider the reviewers\' recommendations before deciding to accept the submission for publication. You may be asked to make revisions and respond to the reviewers\' comments before a final decision is made.</p><p>If you have any questions, please contact me from your submission dashboard.</p><p><p>Daniel Barnes</p></p>'),
(78,1048585,10,3,'2025-08-02 05:57:49',1073741833,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Aisla McCrae\" <amccrae@mailinator.com>','','','Invitation to review','<p>Dear Aisla McCrae,</p>\r\n<p>I believe that you would serve as an excellent reviewer for a submission to Journal of Public Knowledge. The submission\'s title and abstract are below, and I hope that you will consider undertaking this important task for us.</p>\r\n<p>If you are able to review this submission, your review is due by 2025-08-30. You can view the submission, upload review files, and submit your review by logging into the journal site and following the steps at the link below.</p>\r\n<p><a href=\"http://localhost/index.php/publicknowledge/en/reviewer/submission?submissionId=10\">Condensing Water Availability Models to Focus on Specific Water Management Systems</a></p>\r\n<p><strong>Abstract</strong></p>\r\n<p>The Texas Water Availability Modeling System is routinely applied in administration of the water rights permit system, regional and statewide planning, and an expanding variety of other endeavors. Modeling water management in the 23 river basins of the state reflects about 8,000 water right permits and 3,400 reservoirs. Datasets are necessarily large and complex to provide the decision-support capabilities for which the modeling system was developed. New modeling features are being added, and the different types of applications are growing. Certain applications are enhanced by simplifying the simulation input datasets to focus on particular water management systems. A methodology is presented for developing a condensed dataset for a selected reservoir system that reflects the impacts of all the water rights and accompanying reservoirs removed from the original complete dataset. A set of streamflows is developed that represents flows available to the selected system considering the effects of all the other water rights in the river basin contained in the original complete model input dataset that are not included in the condensed dataset. The methodology is applied to develop a condensed model of the Brazos River Authority reservoir system based on modifying the Texas Water Availability Modeling System dataset for the Brazos River Basin.</p>\r\n<p>Please <a href=\"http://localhost/index.php/publicknowledge/en/reviewer/submission?submissionId=10\">accept or decline</a> the review by <strong>2025-08-30</strong>.</p>\r\n<p>You may contact me with any questions about the submission or the review process.</p>\r\n<p>Thank you for considering this request. Your help is much appreciated.</p>\r\n<p>Kind regards,</p>\r\n<p>Daniel Barnes</p>'),
(79,1048585,10,3,'2025-08-02 05:57:51',1073741833,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Adela Gallego\" <agallego@mailinator.com>','','','Invitation to review','<p>Dear Adela Gallego,</p>\r\n<p>I believe that you would serve as an excellent reviewer for a submission to Journal of Public Knowledge. The submission\'s title and abstract are below, and I hope that you will consider undertaking this important task for us.</p>\r\n<p>If you are able to review this submission, your review is due by 2025-08-30. You can view the submission, upload review files, and submit your review by logging into the journal site and following the steps at the link below.</p>\r\n<p><a href=\"http://localhost/index.php/publicknowledge/en/reviewer/submission?submissionId=10\">Condensing Water Availability Models to Focus on Specific Water Management Systems</a></p>\r\n<p><strong>Abstract</strong></p>\r\n<p>The Texas Water Availability Modeling System is routinely applied in administration of the water rights permit system, regional and statewide planning, and an expanding variety of other endeavors. Modeling water management in the 23 river basins of the state reflects about 8,000 water right permits and 3,400 reservoirs. Datasets are necessarily large and complex to provide the decision-support capabilities for which the modeling system was developed. New modeling features are being added, and the different types of applications are growing. Certain applications are enhanced by simplifying the simulation input datasets to focus on particular water management systems. A methodology is presented for developing a condensed dataset for a selected reservoir system that reflects the impacts of all the water rights and accompanying reservoirs removed from the original complete dataset. A set of streamflows is developed that represents flows available to the selected system considering the effects of all the other water rights in the river basin contained in the original complete model input dataset that are not included in the condensed dataset. The methodology is applied to develop a condensed model of the Brazos River Authority reservoir system based on modifying the Texas Water Availability Modeling System dataset for the Brazos River Basin.</p>\r\n<p>Please <a href=\"http://localhost/index.php/publicknowledge/en/reviewer/submission?submissionId=10\">accept or decline</a> the review by <strong>2025-08-30</strong>.</p>\r\n<p>You may contact me with any questions about the submission or the review process.</p>\r\n<p>Thank you for considering this request. Your help is much appreciated.</p>\r\n<p>Kind regards,</p>\r\n<p>Daniel Barnes</p>'),
(80,1048585,10,9,'2025-08-02 05:57:54',1073741829,'\"Aisla McCrae\" <amccrae@mailinator.com>','\"Daniel Barnes\" <dbarnes@mailinator.com>, \"David Buskins\" <dbuskins@mailinator.com>, \"Stephanie Berardo\" <sberardo@mailinator.com>','','','Review accepted: Aisla McCrae accepted review assignment for #10 Novak — \"Condensing Water Availability Models to Focus on Specific Water Management Systems\"','<p>Dear Daniel Barnes, David Buskins, Stephanie Berardo,</p><p>Aisla McCrae has accepted the following review:</p><p><a href=\"http://localhost/index.php/publicknowledge/en/dashboard/editorial?workflowSubmissionId=10\">#10 Novak — \"Condensing Water Availability Models to Focus on Specific Water Management Systems\"</a><br /><b>Type:</b> Anonymous Reviewer/Anonymous Author</p><p><b>Review Due:</b> 2025-08-30</p><p>Login to <a href=\"http://localhost/index.php/publicknowledge/en/dashboard/editorial?workflowSubmissionId=10\">view all reviewer assignments</a> for this submission.</p><br><br>—<br>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge/en\">Journal of Public Knowledge</a>.'),
(81,1048585,10,3,'2025-08-02 05:57:58',1073741836,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Daniel Barnes\" <dbarnes@mailinator.com>','','','Review complete: Aisla McCrae recommends Choose One for #10 Novak — \"Condensing Water Availability Models to Focus on Specific Water Management Systems\"','<p>Dear Daniel Barnes,</p><p>Aisla McCrae completed the following review:</p><p><a href=\"http://localhost/index.php/publicknowledge/en/dashboard/editorial?workflowSubmissionId=10\">#10 Novak — \"Condensing Water Availability Models to Focus on Specific Water Management Systems\"</a><br /><b>Recommendation:</b> Choose One<br /><b>Type:</b> Anonymous Reviewer/Anonymous Author</p><p>Login to <a href=\"http://localhost/index.php/publicknowledge/en/dashboard/editorial?workflowSubmissionId=10\">view all files and comments</a> provided by this reviewer.</p>'),
(82,1048585,10,4,'2025-08-02 05:57:58',1073741836,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"David Buskins\" <dbuskins@mailinator.com>','','','Review complete: Aisla McCrae recommends Choose One for #10 Novak — \"Condensing Water Availability Models to Focus on Specific Water Management Systems\"','<p>Dear David Buskins,</p><p>Aisla McCrae completed the following review:</p><p><a href=\"http://localhost/index.php/publicknowledge/en/dashboard/editorial?workflowSubmissionId=10\">#10 Novak — \"Condensing Water Availability Models to Focus on Specific Water Management Systems\"</a><br /><b>Recommendation:</b> Choose One<br /><b>Type:</b> Anonymous Reviewer/Anonymous Author</p><p>Login to <a href=\"http://localhost/index.php/publicknowledge/en/dashboard/editorial?workflowSubmissionId=10\">view all files and comments</a> provided by this reviewer.</p>'),
(83,1048585,10,5,'2025-08-02 05:57:58',1073741836,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Stephanie Berardo\" <sberardo@mailinator.com>','','','Review complete: Aisla McCrae recommends Choose One for #10 Novak — \"Condensing Water Availability Models to Focus on Specific Water Management Systems\"','<p>Dear Stephanie Berardo,</p><p>Aisla McCrae completed the following review:</p><p><a href=\"http://localhost/index.php/publicknowledge/en/dashboard/editorial?workflowSubmissionId=10\">#10 Novak — \"Condensing Water Availability Models to Focus on Specific Water Management Systems\"</a><br /><b>Recommendation:</b> Choose One<br /><b>Type:</b> Anonymous Reviewer/Anonymous Author</p><p>Login to <a href=\"http://localhost/index.php/publicknowledge/en/dashboard/editorial?workflowSubmissionId=10\">view all files and comments</a> provided by this reviewer.</p>'),
(84,1048585,10,10,'2025-08-02 05:58:01',1073741829,'\"Adela Gallego\" <agallego@mailinator.com>','\"Daniel Barnes\" <dbarnes@mailinator.com>, \"David Buskins\" <dbuskins@mailinator.com>, \"Stephanie Berardo\" <sberardo@mailinator.com>','','','Review accepted: Adela Gallego accepted review assignment for #10 Novak — \"Condensing Water Availability Models to Focus on Specific Water Management Systems\"','<p>Dear Daniel Barnes, David Buskins, Stephanie Berardo,</p><p>Adela Gallego has accepted the following review:</p><p><a href=\"http://localhost/index.php/publicknowledge/en/dashboard/editorial?workflowSubmissionId=10\">#10 Novak — \"Condensing Water Availability Models to Focus on Specific Water Management Systems\"</a><br /><b>Type:</b> Anonymous Reviewer/Anonymous Author</p><p><b>Review Due:</b> 2025-08-30</p><p>Login to <a href=\"http://localhost/index.php/publicknowledge/en/dashboard/editorial?workflowSubmissionId=10\">view all reviewer assignments</a> for this submission.</p><br><br>—<br>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge/en\">Journal of Public Knowledge</a>.'),
(85,1048585,10,3,'2025-08-02 05:58:04',1073741836,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Daniel Barnes\" <dbarnes@mailinator.com>','','','Review complete: Adela Gallego recommends Choose One for #10 Novak — \"Condensing Water Availability Models to Focus on Specific Water Management Systems\"','<p>Dear Daniel Barnes,</p><p>Adela Gallego completed the following review:</p><p><a href=\"http://localhost/index.php/publicknowledge/en/dashboard/editorial?workflowSubmissionId=10\">#10 Novak — \"Condensing Water Availability Models to Focus on Specific Water Management Systems\"</a><br /><b>Recommendation:</b> Choose One<br /><b>Type:</b> Anonymous Reviewer/Anonymous Author</p><p>Login to <a href=\"http://localhost/index.php/publicknowledge/en/dashboard/editorial?workflowSubmissionId=10\">view all files and comments</a> provided by this reviewer.</p>'),
(86,1048585,10,4,'2025-08-02 05:58:04',1073741836,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"David Buskins\" <dbuskins@mailinator.com>','','','Review complete: Adela Gallego recommends Choose One for #10 Novak — \"Condensing Water Availability Models to Focus on Specific Water Management Systems\"','<p>Dear David Buskins,</p><p>Adela Gallego completed the following review:</p><p><a href=\"http://localhost/index.php/publicknowledge/en/dashboard/editorial?workflowSubmissionId=10\">#10 Novak — \"Condensing Water Availability Models to Focus on Specific Water Management Systems\"</a><br /><b>Recommendation:</b> Choose One<br /><b>Type:</b> Anonymous Reviewer/Anonymous Author</p><p>Login to <a href=\"http://localhost/index.php/publicknowledge/en/dashboard/editorial?workflowSubmissionId=10\">view all files and comments</a> provided by this reviewer.</p>'),
(87,1048585,10,5,'2025-08-02 05:58:04',1073741836,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Stephanie Berardo\" <sberardo@mailinator.com>','','','Review complete: Adela Gallego recommends Choose One for #10 Novak — \"Condensing Water Availability Models to Focus on Specific Water Management Systems\"','<p>Dear Stephanie Berardo,</p><p>Adela Gallego completed the following review:</p><p><a href=\"http://localhost/index.php/publicknowledge/en/dashboard/editorial?workflowSubmissionId=10\">#10 Novak — \"Condensing Water Availability Models to Focus on Specific Water Management Systems\"</a><br /><b>Recommendation:</b> Choose One<br /><b>Type:</b> Anonymous Reviewer/Anonymous Author</p><p>Login to <a href=\"http://localhost/index.php/publicknowledge/en/dashboard/editorial?workflowSubmissionId=10\">view all files and comments</a> provided by this reviewer.</p>'),
(88,1048585,11,NULL,'2025-08-02 05:58:13',805306370,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Daniel Barnes\" <dbarnes@mailinator.com>','','','You have been assigned as an editor on a submission to Journal of Public Knowledge','<p>Dear Daniel Barnes,</p><p>The following submission has been assigned to you to see through the editorial process.</p><p><a href=\"http://localhost/index.php/publicknowledge/en/dashboard/editorial?workflowSubmissionId=11\">Learning Sustainable Design through Service</a><br />Karim Al-Khafaji, Margaret Morse</p><p><b>Abstract</b></p>Environmental sustainability and sustainable development principles are vital topics that engineering education has largely failed to address. Service-learning, which integrates social service into an academic setting, is an emerging tool that can be leveraged to teach sustainable design to future engineers. We present a model of using service-learning to teach sustainable design based on the experiences of the Stanford chapter of Engineers for a Sustainable World. The model involves the identification of projects and partner organizations, a student led, project-based design course, and internships coordinated with partner organizations. The model has been very successful, although limitations and challenges exist. These are discussed along with future directions for expanding the model.<p>If you find the submission to be relevant for Journal of Public Knowledge, please forward the submission to the review stage by selecting \"Send to Review\" and then assign reviewers by clicking \"Add Reviewer\".</p><p>If the submission is not appropriate for this journal, please decline the submission.</p><p>Thank you in advance.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Journal of Public Knowledge</a>.</p>'),
(89,1048585,11,NULL,'2025-08-02 05:58:13',805306370,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"David Buskins\" <dbuskins@mailinator.com>','','','You have been assigned as an editor on a submission to Journal of Public Knowledge','<p>Dear David Buskins,</p><p>The following submission has been assigned to you to see through the editorial process.</p><p><a href=\"http://localhost/index.php/publicknowledge/en/dashboard/editorial?workflowSubmissionId=11\">Learning Sustainable Design through Service</a><br />Karim Al-Khafaji, Margaret Morse</p><p><b>Abstract</b></p>Environmental sustainability and sustainable development principles are vital topics that engineering education has largely failed to address. Service-learning, which integrates social service into an academic setting, is an emerging tool that can be leveraged to teach sustainable design to future engineers. We present a model of using service-learning to teach sustainable design based on the experiences of the Stanford chapter of Engineers for a Sustainable World. The model involves the identification of projects and partner organizations, a student led, project-based design course, and internships coordinated with partner organizations. The model has been very successful, although limitations and challenges exist. These are discussed along with future directions for expanding the model.<p>If you find the submission to be relevant for Journal of Public Knowledge, please forward the submission to the review stage by selecting \"Send to Review\" and then assign reviewers by clicking \"Add Reviewer\".</p><p>If the submission is not appropriate for this journal, please decline the submission.</p><p>Thank you in advance.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Journal of Public Knowledge</a>.</p>'),
(90,1048585,11,NULL,'2025-08-02 05:58:13',805306370,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Stephanie Berardo\" <sberardo@mailinator.com>','','','You have been assigned as an editor on a submission to Journal of Public Knowledge','<p>Dear Stephanie Berardo,</p><p>The following submission has been assigned to you to see through the editorial process.</p><p><a href=\"http://localhost/index.php/publicknowledge/en/dashboard/editorial?workflowSubmissionId=11\">Learning Sustainable Design through Service</a><br />Karim Al-Khafaji, Margaret Morse</p><p><b>Abstract</b></p>Environmental sustainability and sustainable development principles are vital topics that engineering education has largely failed to address. Service-learning, which integrates social service into an academic setting, is an emerging tool that can be leveraged to teach sustainable design to future engineers. We present a model of using service-learning to teach sustainable design based on the experiences of the Stanford chapter of Engineers for a Sustainable World. The model involves the identification of projects and partner organizations, a student led, project-based design course, and internships coordinated with partner organizations. The model has been very successful, although limitations and challenges exist. These are discussed along with future directions for expanding the model.<p>If you find the submission to be relevant for Journal of Public Knowledge, please forward the submission to the review stage by selecting \"Send to Review\" and then assign reviewers by clicking \"Add Reviewer\".</p><p>If the submission is not appropriate for this journal, please decline the submission.</p><p>Thank you in advance.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Journal of Public Knowledge</a>.</p>'),
(91,1048585,11,NULL,'2025-08-02 05:58:14',536870914,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Karim Al-Khafaji\" <kalkhafaji@mailinator.com>','','','Thank you for your submission to Journal of Public Knowledge','<p>Dear Karim Al-Khafaji,</p><p>Thank you for your submission to Journal of Public Knowledge. We have received your submission, \"Learning Sustainable Design through Service\", and a member of our editorial team will see it soon. You will be sent an email when an initial decision is made, and we may contact you for further information.</p><p>You can view your submission and track its progress through the editorial process at the following location:</p><p>Submission URL: http://localhost/index.php/publicknowledge/en/dashboard/mySubmissions?workflowSubmissionId=11</p><p>If you have been logged out, you can login again with the username kalkhafaji.</p><p>If you have any questions, please contact me from your <a href=\"http://localhost/index.php/publicknowledge/en/dashboard/mySubmissions?workflowSubmissionId=11\">submission dashboard</a>.</p><p>Thank you for considering Journal of Public Knowledge as a venue for your work.</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Journal of Public Knowledge</a>.</p>'),
(92,1048585,11,NULL,'2025-08-02 05:58:14',536870914,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Margaret Morse\" <mmorse@mailinator.com>','','','Submission confirmation','<p>Dear Margaret Morse,</p><p>You have been named as a co-author on a submission to Journal of Public Knowledge. The submitter, Karim Al-Khafaji, provided the following details:</p><p>\"Learning Sustainable Design through Service\"<br></p><p>If any of these details are incorrect, or you do not wish to be named on this submission, please contact me.</p><p>Thank you for considering Journal of Public Knowledge as a venue for your work.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Journal of Public Knowledge</a>.</p>'),
(93,1048585,12,NULL,'2025-08-02 05:58:22',805306370,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Daniel Barnes\" <dbarnes@mailinator.com>','','','You have been assigned as an editor on a submission to Journal of Public Knowledge','<p>Dear Daniel Barnes,</p><p>The following submission has been assigned to you to see through the editorial process.</p><p><a href=\"http://localhost/index.php/publicknowledge/en/dashboard/editorial?workflowSubmissionId=12\">Sodium butyrate improves growth performance of weaned piglets during the first period after weaning</a><br />Leo Christopher</p><p><b>Abstract</b></p>The aim of this study was to assess the influence of long-term fat supplementation on the fatty acid profile of heavy pig adipose tissue. Fifty-four Large White barrows, averaging 25 kg LW, were randomized (matched weights) to one of three isoenergetic diets supplemented with either tallow (TA), maize oil (MO), or rapeseed oil (RO). The fats were supplement- ed at 3% as fed from 25 to 110 kg LW, and at 2.5 % from 110 kg to slaughtering. Following slaughter at about 160 kg LW, backfat samples were collected from ten animals per treatment and analyzed. Fatty acid composition of backfat close- ly reflected the fatty acid composition of the supplemented fats. The backfat of pigs fed TA had the highest saturated fatty acid content (SFA) (P&lt;0.01); those fed MO had the highest content in polyunsaturated fatty acid (PUFA) and the lowest in monounsaturated fatty acid (MUFA) content; those fed RO had the highest content of linolenic acid (C18:3) and cis 11- ecosenoic acid (C20:1). Only MO treatment had an effect on linoleic acid levels and the iodine value (IV) of backfat, result- ing in levels higher than those (IV = 70; C18:2 = 15%) accepted by the Parma Consortium for dry-cured ham. The IV and unsaturation index in both layers of subcutaneous backfat tissue differed significantly between treatments. These results show that long-term dietary supplementation with different fats changes the fatty acid profile of heavy pig adipose tissue. Supplementation with rapeseed oil increases the proportion of “healthy” fatty acids in pig fat, thereby improving the nutritional quality, however the effects on the technological quality of the fat must be carefully assessed.<p>If you find the submission to be relevant for Journal of Public Knowledge, please forward the submission to the review stage by selecting \"Send to Review\" and then assign reviewers by clicking \"Add Reviewer\".</p><p>If the submission is not appropriate for this journal, please decline the submission.</p><p>Thank you in advance.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Journal of Public Knowledge</a>.</p>'),
(94,1048585,12,NULL,'2025-08-02 05:58:22',805306370,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"David Buskins\" <dbuskins@mailinator.com>','','','You have been assigned as an editor on a submission to Journal of Public Knowledge','<p>Dear David Buskins,</p><p>The following submission has been assigned to you to see through the editorial process.</p><p><a href=\"http://localhost/index.php/publicknowledge/en/dashboard/editorial?workflowSubmissionId=12\">Sodium butyrate improves growth performance of weaned piglets during the first period after weaning</a><br />Leo Christopher</p><p><b>Abstract</b></p>The aim of this study was to assess the influence of long-term fat supplementation on the fatty acid profile of heavy pig adipose tissue. Fifty-four Large White barrows, averaging 25 kg LW, were randomized (matched weights) to one of three isoenergetic diets supplemented with either tallow (TA), maize oil (MO), or rapeseed oil (RO). The fats were supplement- ed at 3% as fed from 25 to 110 kg LW, and at 2.5 % from 110 kg to slaughtering. Following slaughter at about 160 kg LW, backfat samples were collected from ten animals per treatment and analyzed. Fatty acid composition of backfat close- ly reflected the fatty acid composition of the supplemented fats. The backfat of pigs fed TA had the highest saturated fatty acid content (SFA) (P&lt;0.01); those fed MO had the highest content in polyunsaturated fatty acid (PUFA) and the lowest in monounsaturated fatty acid (MUFA) content; those fed RO had the highest content of linolenic acid (C18:3) and cis 11- ecosenoic acid (C20:1). Only MO treatment had an effect on linoleic acid levels and the iodine value (IV) of backfat, result- ing in levels higher than those (IV = 70; C18:2 = 15%) accepted by the Parma Consortium for dry-cured ham. The IV and unsaturation index in both layers of subcutaneous backfat tissue differed significantly between treatments. These results show that long-term dietary supplementation with different fats changes the fatty acid profile of heavy pig adipose tissue. Supplementation with rapeseed oil increases the proportion of “healthy” fatty acids in pig fat, thereby improving the nutritional quality, however the effects on the technological quality of the fat must be carefully assessed.<p>If you find the submission to be relevant for Journal of Public Knowledge, please forward the submission to the review stage by selecting \"Send to Review\" and then assign reviewers by clicking \"Add Reviewer\".</p><p>If the submission is not appropriate for this journal, please decline the submission.</p><p>Thank you in advance.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Journal of Public Knowledge</a>.</p>'),
(95,1048585,12,NULL,'2025-08-02 05:58:22',805306370,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Stephanie Berardo\" <sberardo@mailinator.com>','','','You have been assigned as an editor on a submission to Journal of Public Knowledge','<p>Dear Stephanie Berardo,</p><p>The following submission has been assigned to you to see through the editorial process.</p><p><a href=\"http://localhost/index.php/publicknowledge/en/dashboard/editorial?workflowSubmissionId=12\">Sodium butyrate improves growth performance of weaned piglets during the first period after weaning</a><br />Leo Christopher</p><p><b>Abstract</b></p>The aim of this study was to assess the influence of long-term fat supplementation on the fatty acid profile of heavy pig adipose tissue. Fifty-four Large White barrows, averaging 25 kg LW, were randomized (matched weights) to one of three isoenergetic diets supplemented with either tallow (TA), maize oil (MO), or rapeseed oil (RO). The fats were supplement- ed at 3% as fed from 25 to 110 kg LW, and at 2.5 % from 110 kg to slaughtering. Following slaughter at about 160 kg LW, backfat samples were collected from ten animals per treatment and analyzed. Fatty acid composition of backfat close- ly reflected the fatty acid composition of the supplemented fats. The backfat of pigs fed TA had the highest saturated fatty acid content (SFA) (P&lt;0.01); those fed MO had the highest content in polyunsaturated fatty acid (PUFA) and the lowest in monounsaturated fatty acid (MUFA) content; those fed RO had the highest content of linolenic acid (C18:3) and cis 11- ecosenoic acid (C20:1). Only MO treatment had an effect on linoleic acid levels and the iodine value (IV) of backfat, result- ing in levels higher than those (IV = 70; C18:2 = 15%) accepted by the Parma Consortium for dry-cured ham. The IV and unsaturation index in both layers of subcutaneous backfat tissue differed significantly between treatments. These results show that long-term dietary supplementation with different fats changes the fatty acid profile of heavy pig adipose tissue. Supplementation with rapeseed oil increases the proportion of “healthy” fatty acids in pig fat, thereby improving the nutritional quality, however the effects on the technological quality of the fat must be carefully assessed.<p>If you find the submission to be relevant for Journal of Public Knowledge, please forward the submission to the review stage by selecting \"Send to Review\" and then assign reviewers by clicking \"Add Reviewer\".</p><p>If the submission is not appropriate for this journal, please decline the submission.</p><p>Thank you in advance.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Journal of Public Knowledge</a>.</p>'),
(96,1048585,12,NULL,'2025-08-02 05:58:22',536870914,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Leo Christopher\" <lchristopher@mailinator.com>','','','Thank you for your submission to Journal of Public Knowledge','<p>Dear Leo Christopher,</p><p>Thank you for your submission to Journal of Public Knowledge. We have received your submission, \"Sodium butyrate improves growth performance of weaned piglets during the first period after weaning\", and a member of our editorial team will see it soon. You will be sent an email when an initial decision is made, and we may contact you for further information.</p><p>You can view your submission and track its progress through the editorial process at the following location:</p><p>Submission URL: http://localhost/index.php/publicknowledge/en/dashboard/mySubmissions?workflowSubmissionId=12</p><p>If you have been logged out, you can login again with the username lchristopher.</p><p>If you have any questions, please contact me from your <a href=\"http://localhost/index.php/publicknowledge/en/dashboard/mySubmissions?workflowSubmissionId=12\">submission dashboard</a>.</p><p>Thank you for considering Journal of Public Knowledge as a venue for your work.</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Journal of Public Knowledge</a>.</p>'),
(97,1048585,12,3,'2025-08-02 05:58:29',805306369,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Leo Christopher\" <lchristopher@mailinator.com>','','','Your submission has been sent for review','<p>Dear Leo Christopher,</p><p>I am pleased to inform you that an editor has reviewed your submission, \"Sodium butyrate improves growth performance of weaned piglets during the first period after weaning\", and has decided to send it for peer review. An editor will identify qualified reviewers who will provide feedback on your submission.</p><p>This journal conducts double-anonymous peer review. The reviewers will not see any identifying information about you or your co-authors. Similarly, you will not know who reviewed your submission, and you will not hear from the reviewers directly. You will hear from us with feedback from the reviewers and information about the next steps.</p><p>Please note that sending the submission to peer review does not guarantee that it will be published. We will consider the reviewers\' recommendations before deciding to accept the submission for publication. You may be asked to make revisions and respond to the reviewers\' comments before a final decision is made.</p><p>If you have any questions, please contact me from your submission dashboard.</p><p><p>Daniel Barnes</p></p>'),
(98,1048585,12,3,'2025-08-02 05:58:33',1073741833,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Julie Janssen\" <jjanssen@mailinator.com>','','','Invitation to review','<p>Dear Julie Janssen,</p>\r\n<p>I believe that you would serve as an excellent reviewer for a submission to Journal of Public Knowledge. The submission\'s title and abstract are below, and I hope that you will consider undertaking this important task for us.</p>\r\n<p>If you are able to review this submission, your review is due by 2025-08-30. You can view the submission, upload review files, and submit your review by logging into the journal site and following the steps at the link below.</p>\r\n<p><a href=\"http://localhost/index.php/publicknowledge/en/reviewer/submission?submissionId=12\">Sodium butyrate improves growth performance of weaned piglets during the first period after weaning</a></p>\r\n<p><strong>Abstract</strong></p>\r\n<p>The aim of this study was to assess the influence of long-term fat supplementation on the fatty acid profile of heavy pig adipose tissue. Fifty-four Large White barrows, averaging 25 kg LW, were randomized (matched weights) to one of three isoenergetic diets supplemented with either tallow (TA), maize oil (MO), or rapeseed oil (RO). The fats were supplement- ed at 3% as fed from 25 to 110 kg LW, and at 2.5 % from 110 kg to slaughtering. Following slaughter at about 160 kg LW, backfat samples were collected from ten animals per treatment and analyzed. Fatty acid composition of backfat close- ly reflected the fatty acid composition of the supplemented fats. The backfat of pigs fed TA had the highest saturated fatty acid content (SFA) (P&lt;0.01); those fed MO had the highest content in polyunsaturated fatty acid (PUFA) and the lowest in monounsaturated fatty acid (MUFA) content; those fed RO had the highest content of linolenic acid (C18:3) and cis 11- ecosenoic acid (C20:1). Only MO treatment had an effect on linoleic acid levels and the iodine value (IV) of backfat, result- ing in levels higher than those (IV = 70; C18:2 = 15%) accepted by the Parma Consortium for dry-cured ham. The IV and unsaturation index in both layers of subcutaneous backfat tissue differed significantly between treatments. These results show that long-term dietary supplementation with different fats changes the fatty acid profile of heavy pig adipose tissue. Supplementation with rapeseed oil increases the proportion of “healthy” fatty acids in pig fat, thereby improving the nutritional quality, however the effects on the technological quality of the fat must be carefully assessed.</p>\r\n<p>Please <a href=\"http://localhost/index.php/publicknowledge/en/reviewer/submission?submissionId=12\">accept or decline</a> the review by <strong>2025-08-30</strong>.</p>\r\n<p>You may contact me with any questions about the submission or the review process.</p>\r\n<p>Thank you for considering this request. Your help is much appreciated.</p>\r\n<p>Kind regards,</p>\r\n<p>Daniel Barnes</p>'),
(99,1048585,12,3,'2025-08-02 05:58:36',1073741833,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Paul Hudson\" <phudson@mailinator.com>','','','Invitation to review','<p>Dear Paul Hudson,</p>\r\n<p>I believe that you would serve as an excellent reviewer for a submission to Journal of Public Knowledge. The submission\'s title and abstract are below, and I hope that you will consider undertaking this important task for us.</p>\r\n<p>If you are able to review this submission, your review is due by 2025-08-30. You can view the submission, upload review files, and submit your review by logging into the journal site and following the steps at the link below.</p>\r\n<p><a href=\"http://localhost/index.php/publicknowledge/en/reviewer/submission?submissionId=12\">Sodium butyrate improves growth performance of weaned piglets during the first period after weaning</a></p>\r\n<p><strong>Abstract</strong></p>\r\n<p>The aim of this study was to assess the influence of long-term fat supplementation on the fatty acid profile of heavy pig adipose tissue. Fifty-four Large White barrows, averaging 25 kg LW, were randomized (matched weights) to one of three isoenergetic diets supplemented with either tallow (TA), maize oil (MO), or rapeseed oil (RO). The fats were supplement- ed at 3% as fed from 25 to 110 kg LW, and at 2.5 % from 110 kg to slaughtering. Following slaughter at about 160 kg LW, backfat samples were collected from ten animals per treatment and analyzed. Fatty acid composition of backfat close- ly reflected the fatty acid composition of the supplemented fats. The backfat of pigs fed TA had the highest saturated fatty acid content (SFA) (P&lt;0.01); those fed MO had the highest content in polyunsaturated fatty acid (PUFA) and the lowest in monounsaturated fatty acid (MUFA) content; those fed RO had the highest content of linolenic acid (C18:3) and cis 11- ecosenoic acid (C20:1). Only MO treatment had an effect on linoleic acid levels and the iodine value (IV) of backfat, result- ing in levels higher than those (IV = 70; C18:2 = 15%) accepted by the Parma Consortium for dry-cured ham. The IV and unsaturation index in both layers of subcutaneous backfat tissue differed significantly between treatments. These results show that long-term dietary supplementation with different fats changes the fatty acid profile of heavy pig adipose tissue. Supplementation with rapeseed oil increases the proportion of “healthy” fatty acids in pig fat, thereby improving the nutritional quality, however the effects on the technological quality of the fat must be carefully assessed.</p>\r\n<p>Please <a href=\"http://localhost/index.php/publicknowledge/en/reviewer/submission?submissionId=12\">accept or decline</a> the review by <strong>2025-08-30</strong>.</p>\r\n<p>You may contact me with any questions about the submission or the review process.</p>\r\n<p>Thank you for considering this request. Your help is much appreciated.</p>\r\n<p>Kind regards,</p>\r\n<p>Daniel Barnes</p>'),
(100,1048585,13,NULL,'2025-08-02 05:58:45',805306370,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Daniel Barnes\" <dbarnes@mailinator.com>','','','You have been assigned as an editor on a submission to Journal of Public Knowledge','<p>Dear Daniel Barnes,</p><p>The following submission has been assigned to you to see through the editorial process.</p><p><a href=\"http://localhost/index.php/publicknowledge/en/dashboard/editorial?workflowSubmissionId=13\">Hydrologic Connectivity in the Edwards Aquifer between San Marcos Springs and Barton Springs during 2009 Drought Conditions</a><br />Lise Kumiega</p><p><b>Abstract</b></p>The Edwards Aquifer serves as the primary water supply in South-Central Texas and is the source for several major springs. In developing a plan to protect endangered species immediately downstream of San Marcos Springs, questions have been raised regarding the established concept of a hydrologic divide between the San Antonio and Barton Springs segments of the Edwards Aquifer during drought conditions. To address these questions, a water-level data collection program and a hydrogeologic study was conducted. An analysis of groundwater-level data indicate that a groundwater divide exists in the vicinity of the surface drainage divide between Onion Creek and Blanco River during wet and normal hydrologic conditions. However, analysis of data collected during the 2009 drought suggests that the groundwater divide dissipated and no longer hydrologically separated the two segments. As a result, there is potential for groundwater to flow past San Marcos Springs toward Barton Springs during major droughts. The implications for this have bearings on the management and availability of groundwater in the Edwards Aquifer. Assessments of simulations from a numerical model suggest 5 cfs could be flowing past San Marcos toward Barton springs under drought conditions. The groundwater divide appears to be influenced by recharge along Onion Creek and Blanco River and appears to be vulnerable to extended periods of little or no recharge and extensive pumping in the vicinity of Kyle and Buda. The 2009 data set shows a very low gradient in the potentiometric surface between San Marcos Springs and Kyle with very little variation in levels between drought and non-drought periods. From Kyle toward Barton Springs, the potentiometric surface slopes significantly to the north and has dramatic changes in levels between drought and non-drought periods. The source and nature of the discontinuity of the change in potentiometric gradients and dynamic water level response at Kyle is unknown. Structural influences or hydraulic properties inherent in the aquifer could be the cause of this discontinuity and may also influence the degree of hydrologic connection between San Marcos and Barton Springs. Rapid population growth and increased water demands in the Kyle and Buda areas necessitates a continual groundwater level monitoring program between San Marcos Springs and Buda to provide data for future hydrogeologic and trend analyses.<p>If you find the submission to be relevant for Journal of Public Knowledge, please forward the submission to the review stage by selecting \"Send to Review\" and then assign reviewers by clicking \"Add Reviewer\".</p><p>If the submission is not appropriate for this journal, please decline the submission.</p><p>Thank you in advance.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Journal of Public Knowledge</a>.</p>'),
(101,1048585,13,NULL,'2025-08-02 05:58:45',805306370,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"David Buskins\" <dbuskins@mailinator.com>','','','You have been assigned as an editor on a submission to Journal of Public Knowledge','<p>Dear David Buskins,</p><p>The following submission has been assigned to you to see through the editorial process.</p><p><a href=\"http://localhost/index.php/publicknowledge/en/dashboard/editorial?workflowSubmissionId=13\">Hydrologic Connectivity in the Edwards Aquifer between San Marcos Springs and Barton Springs during 2009 Drought Conditions</a><br />Lise Kumiega</p><p><b>Abstract</b></p>The Edwards Aquifer serves as the primary water supply in South-Central Texas and is the source for several major springs. In developing a plan to protect endangered species immediately downstream of San Marcos Springs, questions have been raised regarding the established concept of a hydrologic divide between the San Antonio and Barton Springs segments of the Edwards Aquifer during drought conditions. To address these questions, a water-level data collection program and a hydrogeologic study was conducted. An analysis of groundwater-level data indicate that a groundwater divide exists in the vicinity of the surface drainage divide between Onion Creek and Blanco River during wet and normal hydrologic conditions. However, analysis of data collected during the 2009 drought suggests that the groundwater divide dissipated and no longer hydrologically separated the two segments. As a result, there is potential for groundwater to flow past San Marcos Springs toward Barton Springs during major droughts. The implications for this have bearings on the management and availability of groundwater in the Edwards Aquifer. Assessments of simulations from a numerical model suggest 5 cfs could be flowing past San Marcos toward Barton springs under drought conditions. The groundwater divide appears to be influenced by recharge along Onion Creek and Blanco River and appears to be vulnerable to extended periods of little or no recharge and extensive pumping in the vicinity of Kyle and Buda. The 2009 data set shows a very low gradient in the potentiometric surface between San Marcos Springs and Kyle with very little variation in levels between drought and non-drought periods. From Kyle toward Barton Springs, the potentiometric surface slopes significantly to the north and has dramatic changes in levels between drought and non-drought periods. The source and nature of the discontinuity of the change in potentiometric gradients and dynamic water level response at Kyle is unknown. Structural influences or hydraulic properties inherent in the aquifer could be the cause of this discontinuity and may also influence the degree of hydrologic connection between San Marcos and Barton Springs. Rapid population growth and increased water demands in the Kyle and Buda areas necessitates a continual groundwater level monitoring program between San Marcos Springs and Buda to provide data for future hydrogeologic and trend analyses.<p>If you find the submission to be relevant for Journal of Public Knowledge, please forward the submission to the review stage by selecting \"Send to Review\" and then assign reviewers by clicking \"Add Reviewer\".</p><p>If the submission is not appropriate for this journal, please decline the submission.</p><p>Thank you in advance.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Journal of Public Knowledge</a>.</p>'),
(102,1048585,13,NULL,'2025-08-02 05:58:45',805306370,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Stephanie Berardo\" <sberardo@mailinator.com>','','','You have been assigned as an editor on a submission to Journal of Public Knowledge','<p>Dear Stephanie Berardo,</p><p>The following submission has been assigned to you to see through the editorial process.</p><p><a href=\"http://localhost/index.php/publicknowledge/en/dashboard/editorial?workflowSubmissionId=13\">Hydrologic Connectivity in the Edwards Aquifer between San Marcos Springs and Barton Springs during 2009 Drought Conditions</a><br />Lise Kumiega</p><p><b>Abstract</b></p>The Edwards Aquifer serves as the primary water supply in South-Central Texas and is the source for several major springs. In developing a plan to protect endangered species immediately downstream of San Marcos Springs, questions have been raised regarding the established concept of a hydrologic divide between the San Antonio and Barton Springs segments of the Edwards Aquifer during drought conditions. To address these questions, a water-level data collection program and a hydrogeologic study was conducted. An analysis of groundwater-level data indicate that a groundwater divide exists in the vicinity of the surface drainage divide between Onion Creek and Blanco River during wet and normal hydrologic conditions. However, analysis of data collected during the 2009 drought suggests that the groundwater divide dissipated and no longer hydrologically separated the two segments. As a result, there is potential for groundwater to flow past San Marcos Springs toward Barton Springs during major droughts. The implications for this have bearings on the management and availability of groundwater in the Edwards Aquifer. Assessments of simulations from a numerical model suggest 5 cfs could be flowing past San Marcos toward Barton springs under drought conditions. The groundwater divide appears to be influenced by recharge along Onion Creek and Blanco River and appears to be vulnerable to extended periods of little or no recharge and extensive pumping in the vicinity of Kyle and Buda. The 2009 data set shows a very low gradient in the potentiometric surface between San Marcos Springs and Kyle with very little variation in levels between drought and non-drought periods. From Kyle toward Barton Springs, the potentiometric surface slopes significantly to the north and has dramatic changes in levels between drought and non-drought periods. The source and nature of the discontinuity of the change in potentiometric gradients and dynamic water level response at Kyle is unknown. Structural influences or hydraulic properties inherent in the aquifer could be the cause of this discontinuity and may also influence the degree of hydrologic connection between San Marcos and Barton Springs. Rapid population growth and increased water demands in the Kyle and Buda areas necessitates a continual groundwater level monitoring program between San Marcos Springs and Buda to provide data for future hydrogeologic and trend analyses.<p>If you find the submission to be relevant for Journal of Public Knowledge, please forward the submission to the review stage by selecting \"Send to Review\" and then assign reviewers by clicking \"Add Reviewer\".</p><p>If the submission is not appropriate for this journal, please decline the submission.</p><p>Thank you in advance.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Journal of Public Knowledge</a>.</p>'),
(103,1048585,13,NULL,'2025-08-02 05:58:45',536870914,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Lise Kumiega\" <lkumiega@mailinator.com>','','','Thank you for your submission to Journal of Public Knowledge','<p>Dear Lise Kumiega,</p><p>Thank you for your submission to Journal of Public Knowledge. We have received your submission, \"Hydrologic Connectivity in the Edwards Aquifer between San Marcos Springs and Barton Springs during 2009 Drought Conditions\", and a member of our editorial team will see it soon. You will be sent an email when an initial decision is made, and we may contact you for further information.</p><p>You can view your submission and track its progress through the editorial process at the following location:</p><p>Submission URL: http://localhost/index.php/publicknowledge/en/dashboard/mySubmissions?workflowSubmissionId=13</p><p>If you have been logged out, you can login again with the username lkumiega.</p><p>If you have any questions, please contact me from your <a href=\"http://localhost/index.php/publicknowledge/en/dashboard/mySubmissions?workflowSubmissionId=13\">submission dashboard</a>.</p><p>Thank you for considering Journal of Public Knowledge as a venue for your work.</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Journal of Public Knowledge</a>.</p>'),
(104,1048585,13,3,'2025-08-02 05:58:52',805306369,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Lise Kumiega\" <lkumiega@mailinator.com>','','','Your submission has been sent for review','<p>Dear Lise Kumiega,</p><p>I am pleased to inform you that an editor has reviewed your submission, \"Hydrologic Connectivity in the Edwards Aquifer between San Marcos Springs and Barton Springs during 2009 Drought Conditions\", and has decided to send it for peer review. An editor will identify qualified reviewers who will provide feedback on your submission.</p><p>This journal conducts double-anonymous peer review. The reviewers will not see any identifying information about you or your co-authors. Similarly, you will not know who reviewed your submission, and you will not hear from the reviewers directly. You will hear from us with feedback from the reviewers and information about the next steps.</p><p>Please note that sending the submission to peer review does not guarantee that it will be published. We will consider the reviewers\' recommendations before deciding to accept the submission for publication. You may be asked to make revisions and respond to the reviewers\' comments before a final decision is made.</p><p>If you have any questions, please contact me from your submission dashboard.</p><p><p>Daniel Barnes</p></p>'),
(105,1048585,13,3,'2025-08-02 05:58:56',1073741833,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Julie Janssen\" <jjanssen@mailinator.com>','','','Invitation to review','<p>Dear Julie Janssen,</p>\r\n<p>I believe that you would serve as an excellent reviewer for a submission to Journal of Public Knowledge. The submission\'s title and abstract are below, and I hope that you will consider undertaking this important task for us.</p>\r\n<p>If you are able to review this submission, your review is due by 2025-08-30. You can view the submission, upload review files, and submit your review by logging into the journal site and following the steps at the link below.</p>\r\n<p><a href=\"http://localhost/index.php/publicknowledge/en/reviewer/submission?submissionId=13\">Hydrologic Connectivity in the Edwards Aquifer between San Marcos Springs and Barton Springs during 2009 Drought Conditions</a></p>\r\n<p><strong>Abstract</strong></p>\r\n<p>The Edwards Aquifer serves as the primary water supply in South-Central Texas and is the source for several major springs. In developing a plan to protect endangered species immediately downstream of San Marcos Springs, questions have been raised regarding the established concept of a hydrologic divide between the San Antonio and Barton Springs segments of the Edwards Aquifer during drought conditions. To address these questions, a water-level data collection program and a hydrogeologic study was conducted. An analysis of groundwater-level data indicate that a groundwater divide exists in the vicinity of the surface drainage divide between Onion Creek and Blanco River during wet and normal hydrologic conditions. However, analysis of data collected during the 2009 drought suggests that the groundwater divide dissipated and no longer hydrologically separated the two segments. As a result, there is potential for groundwater to flow past San Marcos Springs toward Barton Springs during major droughts. The implications for this have bearings on the management and availability of groundwater in the Edwards Aquifer. Assessments of simulations from a numerical model suggest 5 cfs could be flowing past San Marcos toward Barton springs under drought conditions. The groundwater divide appears to be influenced by recharge along Onion Creek and Blanco River and appears to be vulnerable to extended periods of little or no recharge and extensive pumping in the vicinity of Kyle and Buda. The 2009 data set shows a very low gradient in the potentiometric surface between San Marcos Springs and Kyle with very little variation in levels between drought and non-drought periods. From Kyle toward Barton Springs, the potentiometric surface slopes significantly to the north and has dramatic changes in levels between drought and non-drought periods. The source and nature of the discontinuity of the change in potentiometric gradients and dynamic water level response at Kyle is unknown. Structural influences or hydraulic properties inherent in the aquifer could be the cause of this discontinuity and may also influence the degree of hydrologic connection between San Marcos and Barton Springs. Rapid population growth and increased water demands in the Kyle and Buda areas necessitates a continual groundwater level monitoring program between San Marcos Springs and Buda to provide data for future hydrogeologic and trend analyses.</p>\r\n<p>Please <a href=\"http://localhost/index.php/publicknowledge/en/reviewer/submission?submissionId=13\">accept or decline</a> the review by <strong>2025-08-30</strong>.</p>\r\n<p>You may contact me with any questions about the submission or the review process.</p>\r\n<p>Thank you for considering this request. Your help is much appreciated.</p>\r\n<p>Kind regards,</p>\r\n<p>Daniel Barnes</p>'),
(106,1048585,13,3,'2025-08-02 05:58:58',1073741833,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Aisla McCrae\" <amccrae@mailinator.com>','','','Invitation to review','<p>Dear Aisla McCrae,</p>\r\n<p>I believe that you would serve as an excellent reviewer for a submission to Journal of Public Knowledge. The submission\'s title and abstract are below, and I hope that you will consider undertaking this important task for us.</p>\r\n<p>If you are able to review this submission, your review is due by 2025-08-30. You can view the submission, upload review files, and submit your review by logging into the journal site and following the steps at the link below.</p>\r\n<p><a href=\"http://localhost/index.php/publicknowledge/en/reviewer/submission?submissionId=13\">Hydrologic Connectivity in the Edwards Aquifer between San Marcos Springs and Barton Springs during 2009 Drought Conditions</a></p>\r\n<p><strong>Abstract</strong></p>\r\n<p>The Edwards Aquifer serves as the primary water supply in South-Central Texas and is the source for several major springs. In developing a plan to protect endangered species immediately downstream of San Marcos Springs, questions have been raised regarding the established concept of a hydrologic divide between the San Antonio and Barton Springs segments of the Edwards Aquifer during drought conditions. To address these questions, a water-level data collection program and a hydrogeologic study was conducted. An analysis of groundwater-level data indicate that a groundwater divide exists in the vicinity of the surface drainage divide between Onion Creek and Blanco River during wet and normal hydrologic conditions. However, analysis of data collected during the 2009 drought suggests that the groundwater divide dissipated and no longer hydrologically separated the two segments. As a result, there is potential for groundwater to flow past San Marcos Springs toward Barton Springs during major droughts. The implications for this have bearings on the management and availability of groundwater in the Edwards Aquifer. Assessments of simulations from a numerical model suggest 5 cfs could be flowing past San Marcos toward Barton springs under drought conditions. The groundwater divide appears to be influenced by recharge along Onion Creek and Blanco River and appears to be vulnerable to extended periods of little or no recharge and extensive pumping in the vicinity of Kyle and Buda. The 2009 data set shows a very low gradient in the potentiometric surface between San Marcos Springs and Kyle with very little variation in levels between drought and non-drought periods. From Kyle toward Barton Springs, the potentiometric surface slopes significantly to the north and has dramatic changes in levels between drought and non-drought periods. The source and nature of the discontinuity of the change in potentiometric gradients and dynamic water level response at Kyle is unknown. Structural influences or hydraulic properties inherent in the aquifer could be the cause of this discontinuity and may also influence the degree of hydrologic connection between San Marcos and Barton Springs. Rapid population growth and increased water demands in the Kyle and Buda areas necessitates a continual groundwater level monitoring program between San Marcos Springs and Buda to provide data for future hydrogeologic and trend analyses.</p>\r\n<p>Please <a href=\"http://localhost/index.php/publicknowledge/en/reviewer/submission?submissionId=13\">accept or decline</a> the review by <strong>2025-08-30</strong>.</p>\r\n<p>You may contact me with any questions about the submission or the review process.</p>\r\n<p>Thank you for considering this request. Your help is much appreciated.</p>\r\n<p>Kind regards,</p>\r\n<p>Daniel Barnes</p>'),
(107,1048585,13,3,'2025-08-02 05:59:01',1073741833,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Adela Gallego\" <agallego@mailinator.com>','','','Invitation to review','<p>Dear Adela Gallego,</p>\r\n<p>I believe that you would serve as an excellent reviewer for a submission to Journal of Public Knowledge. The submission\'s title and abstract are below, and I hope that you will consider undertaking this important task for us.</p>\r\n<p>If you are able to review this submission, your review is due by 2025-08-30. You can view the submission, upload review files, and submit your review by logging into the journal site and following the steps at the link below.</p>\r\n<p><a href=\"http://localhost/index.php/publicknowledge/en/reviewer/submission?submissionId=13\">Hydrologic Connectivity in the Edwards Aquifer between San Marcos Springs and Barton Springs during 2009 Drought Conditions</a></p>\r\n<p><strong>Abstract</strong></p>\r\n<p>The Edwards Aquifer serves as the primary water supply in South-Central Texas and is the source for several major springs. In developing a plan to protect endangered species immediately downstream of San Marcos Springs, questions have been raised regarding the established concept of a hydrologic divide between the San Antonio and Barton Springs segments of the Edwards Aquifer during drought conditions. To address these questions, a water-level data collection program and a hydrogeologic study was conducted. An analysis of groundwater-level data indicate that a groundwater divide exists in the vicinity of the surface drainage divide between Onion Creek and Blanco River during wet and normal hydrologic conditions. However, analysis of data collected during the 2009 drought suggests that the groundwater divide dissipated and no longer hydrologically separated the two segments. As a result, there is potential for groundwater to flow past San Marcos Springs toward Barton Springs during major droughts. The implications for this have bearings on the management and availability of groundwater in the Edwards Aquifer. Assessments of simulations from a numerical model suggest 5 cfs could be flowing past San Marcos toward Barton springs under drought conditions. The groundwater divide appears to be influenced by recharge along Onion Creek and Blanco River and appears to be vulnerable to extended periods of little or no recharge and extensive pumping in the vicinity of Kyle and Buda. The 2009 data set shows a very low gradient in the potentiometric surface between San Marcos Springs and Kyle with very little variation in levels between drought and non-drought periods. From Kyle toward Barton Springs, the potentiometric surface slopes significantly to the north and has dramatic changes in levels between drought and non-drought periods. The source and nature of the discontinuity of the change in potentiometric gradients and dynamic water level response at Kyle is unknown. Structural influences or hydraulic properties inherent in the aquifer could be the cause of this discontinuity and may also influence the degree of hydrologic connection between San Marcos and Barton Springs. Rapid population growth and increased water demands in the Kyle and Buda areas necessitates a continual groundwater level monitoring program between San Marcos Springs and Buda to provide data for future hydrogeologic and trend analyses.</p>\r\n<p>Please <a href=\"http://localhost/index.php/publicknowledge/en/reviewer/submission?submissionId=13\">accept or decline</a> the review by <strong>2025-08-30</strong>.</p>\r\n<p>You may contact me with any questions about the submission or the review process.</p>\r\n<p>Thank you for considering this request. Your help is much appreciated.</p>\r\n<p>Kind regards,</p>\r\n<p>Daniel Barnes</p>'),
(108,1048585,13,7,'2025-08-02 05:59:04',1073741829,'\"Julie Janssen\" <jjanssen@mailinator.com>','\"Daniel Barnes\" <dbarnes@mailinator.com>, \"David Buskins\" <dbuskins@mailinator.com>, \"Stephanie Berardo\" <sberardo@mailinator.com>','','','Review accepted: Julie Janssen accepted review assignment for #13 Kumiega — \"Hydrologic Connectivity in the Edwards Aquifer between San Marcos Springs and Barton Springs during 2009 Drought Conditions\"','<p>Dear Daniel Barnes, David Buskins, Stephanie Berardo,</p><p>Julie Janssen has accepted the following review:</p><p><a href=\"http://localhost/index.php/publicknowledge/en/dashboard/editorial?workflowSubmissionId=13\">#13 Kumiega — \"Hydrologic Connectivity in the Edwards Aquifer between San Marcos Springs and Barton Springs during 2009 Drought Conditions\"</a><br /><b>Type:</b> Anonymous Reviewer/Anonymous Author</p><p><b>Review Due:</b> 2025-08-30</p><p>Login to <a href=\"http://localhost/index.php/publicknowledge/en/dashboard/editorial?workflowSubmissionId=13\">view all reviewer assignments</a> for this submission.</p><br><br>—<br>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge/en\">Journal of Public Knowledge</a>.'),
(109,1048585,13,3,'2025-08-02 05:59:08',1073741836,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Daniel Barnes\" <dbarnes@mailinator.com>','','','Review complete: Julie Janssen recommends Choose One for #13 Kumiega — \"Hydrologic Connectivity in the Edwards Aquifer between San Marcos Springs and Barton Springs during 2009 Drought Conditions\"','<p>Dear Daniel Barnes,</p><p>Julie Janssen completed the following review:</p><p><a href=\"http://localhost/index.php/publicknowledge/en/dashboard/editorial?workflowSubmissionId=13\">#13 Kumiega — \"Hydrologic Connectivity in the Edwards Aquifer between San Marcos Springs and Barton Springs during 2009 Drought Conditions\"</a><br /><b>Recommendation:</b> Choose One<br /><b>Type:</b> Anonymous Reviewer/Anonymous Author</p><p>Login to <a href=\"http://localhost/index.php/publicknowledge/en/dashboard/editorial?workflowSubmissionId=13\">view all files and comments</a> provided by this reviewer.</p>'),
(110,1048585,13,4,'2025-08-02 05:59:08',1073741836,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"David Buskins\" <dbuskins@mailinator.com>','','','Review complete: Julie Janssen recommends Choose One for #13 Kumiega — \"Hydrologic Connectivity in the Edwards Aquifer between San Marcos Springs and Barton Springs during 2009 Drought Conditions\"','<p>Dear David Buskins,</p><p>Julie Janssen completed the following review:</p><p><a href=\"http://localhost/index.php/publicknowledge/en/dashboard/editorial?workflowSubmissionId=13\">#13 Kumiega — \"Hydrologic Connectivity in the Edwards Aquifer between San Marcos Springs and Barton Springs during 2009 Drought Conditions\"</a><br /><b>Recommendation:</b> Choose One<br /><b>Type:</b> Anonymous Reviewer/Anonymous Author</p><p>Login to <a href=\"http://localhost/index.php/publicknowledge/en/dashboard/editorial?workflowSubmissionId=13\">view all files and comments</a> provided by this reviewer.</p>'),
(111,1048585,13,5,'2025-08-02 05:59:08',1073741836,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Stephanie Berardo\" <sberardo@mailinator.com>','','','Review complete: Julie Janssen recommends Choose One for #13 Kumiega — \"Hydrologic Connectivity in the Edwards Aquifer between San Marcos Springs and Barton Springs during 2009 Drought Conditions\"','<p>Dear Stephanie Berardo,</p><p>Julie Janssen completed the following review:</p><p><a href=\"http://localhost/index.php/publicknowledge/en/dashboard/editorial?workflowSubmissionId=13\">#13 Kumiega — \"Hydrologic Connectivity in the Edwards Aquifer between San Marcos Springs and Barton Springs during 2009 Drought Conditions\"</a><br /><b>Recommendation:</b> Choose One<br /><b>Type:</b> Anonymous Reviewer/Anonymous Author</p><p>Login to <a href=\"http://localhost/index.php/publicknowledge/en/dashboard/editorial?workflowSubmissionId=13\">view all files and comments</a> provided by this reviewer.</p>'),
(112,1048585,13,9,'2025-08-02 05:59:10',1073741829,'\"Aisla McCrae\" <amccrae@mailinator.com>','\"Daniel Barnes\" <dbarnes@mailinator.com>, \"David Buskins\" <dbuskins@mailinator.com>, \"Stephanie Berardo\" <sberardo@mailinator.com>','','','Review accepted: Aisla McCrae accepted review assignment for #13 Kumiega — \"Hydrologic Connectivity in the Edwards Aquifer between San Marcos Springs and Barton Springs during 2009 Drought Conditions\"','<p>Dear Daniel Barnes, David Buskins, Stephanie Berardo,</p><p>Aisla McCrae has accepted the following review:</p><p><a href=\"http://localhost/index.php/publicknowledge/en/dashboard/editorial?workflowSubmissionId=13\">#13 Kumiega — \"Hydrologic Connectivity in the Edwards Aquifer between San Marcos Springs and Barton Springs during 2009 Drought Conditions\"</a><br /><b>Type:</b> Anonymous Reviewer/Anonymous Author</p><p><b>Review Due:</b> 2025-08-30</p><p>Login to <a href=\"http://localhost/index.php/publicknowledge/en/dashboard/editorial?workflowSubmissionId=13\">view all reviewer assignments</a> for this submission.</p><br><br>—<br>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge/en\">Journal of Public Knowledge</a>.'),
(113,1048585,13,3,'2025-08-02 05:59:14',1073741836,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Daniel Barnes\" <dbarnes@mailinator.com>','','','Review complete: Aisla McCrae recommends Choose One for #13 Kumiega — \"Hydrologic Connectivity in the Edwards Aquifer between San Marcos Springs and Barton Springs during 2009 Drought Conditions\"','<p>Dear Daniel Barnes,</p><p>Aisla McCrae completed the following review:</p><p><a href=\"http://localhost/index.php/publicknowledge/en/dashboard/editorial?workflowSubmissionId=13\">#13 Kumiega — \"Hydrologic Connectivity in the Edwards Aquifer between San Marcos Springs and Barton Springs during 2009 Drought Conditions\"</a><br /><b>Recommendation:</b> Choose One<br /><b>Type:</b> Anonymous Reviewer/Anonymous Author</p><p>Login to <a href=\"http://localhost/index.php/publicknowledge/en/dashboard/editorial?workflowSubmissionId=13\">view all files and comments</a> provided by this reviewer.</p>'),
(114,1048585,13,4,'2025-08-02 05:59:14',1073741836,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"David Buskins\" <dbuskins@mailinator.com>','','','Review complete: Aisla McCrae recommends Choose One for #13 Kumiega — \"Hydrologic Connectivity in the Edwards Aquifer between San Marcos Springs and Barton Springs during 2009 Drought Conditions\"','<p>Dear David Buskins,</p><p>Aisla McCrae completed the following review:</p><p><a href=\"http://localhost/index.php/publicknowledge/en/dashboard/editorial?workflowSubmissionId=13\">#13 Kumiega — \"Hydrologic Connectivity in the Edwards Aquifer between San Marcos Springs and Barton Springs during 2009 Drought Conditions\"</a><br /><b>Recommendation:</b> Choose One<br /><b>Type:</b> Anonymous Reviewer/Anonymous Author</p><p>Login to <a href=\"http://localhost/index.php/publicknowledge/en/dashboard/editorial?workflowSubmissionId=13\">view all files and comments</a> provided by this reviewer.</p>'),
(115,1048585,13,5,'2025-08-02 05:59:14',1073741836,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Stephanie Berardo\" <sberardo@mailinator.com>','','','Review complete: Aisla McCrae recommends Choose One for #13 Kumiega — \"Hydrologic Connectivity in the Edwards Aquifer between San Marcos Springs and Barton Springs during 2009 Drought Conditions\"','<p>Dear Stephanie Berardo,</p><p>Aisla McCrae completed the following review:</p><p><a href=\"http://localhost/index.php/publicknowledge/en/dashboard/editorial?workflowSubmissionId=13\">#13 Kumiega — \"Hydrologic Connectivity in the Edwards Aquifer between San Marcos Springs and Barton Springs during 2009 Drought Conditions\"</a><br /><b>Recommendation:</b> Choose One<br /><b>Type:</b> Anonymous Reviewer/Anonymous Author</p><p>Login to <a href=\"http://localhost/index.php/publicknowledge/en/dashboard/editorial?workflowSubmissionId=13\">view all files and comments</a> provided by this reviewer.</p>'),
(116,1048585,13,10,'2025-08-02 05:59:17',1073741829,'\"Adela Gallego\" <agallego@mailinator.com>','\"Daniel Barnes\" <dbarnes@mailinator.com>, \"David Buskins\" <dbuskins@mailinator.com>, \"Stephanie Berardo\" <sberardo@mailinator.com>','','','Review accepted: Adela Gallego accepted review assignment for #13 Kumiega — \"Hydrologic Connectivity in the Edwards Aquifer between San Marcos Springs and Barton Springs during 2009 Drought Conditions\"','<p>Dear Daniel Barnes, David Buskins, Stephanie Berardo,</p><p>Adela Gallego has accepted the following review:</p><p><a href=\"http://localhost/index.php/publicknowledge/en/dashboard/editorial?workflowSubmissionId=13\">#13 Kumiega — \"Hydrologic Connectivity in the Edwards Aquifer between San Marcos Springs and Barton Springs during 2009 Drought Conditions\"</a><br /><b>Type:</b> Anonymous Reviewer/Anonymous Author</p><p><b>Review Due:</b> 2025-08-30</p><p>Login to <a href=\"http://localhost/index.php/publicknowledge/en/dashboard/editorial?workflowSubmissionId=13\">view all reviewer assignments</a> for this submission.</p><br><br>—<br>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge/en\">Journal of Public Knowledge</a>.'),
(117,1048585,13,3,'2025-08-02 05:59:21',1073741836,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Daniel Barnes\" <dbarnes@mailinator.com>','','','Review complete: Adela Gallego recommends Choose One for #13 Kumiega — \"Hydrologic Connectivity in the Edwards Aquifer between San Marcos Springs and Barton Springs during 2009 Drought Conditions\"','<p>Dear Daniel Barnes,</p><p>Adela Gallego completed the following review:</p><p><a href=\"http://localhost/index.php/publicknowledge/en/dashboard/editorial?workflowSubmissionId=13\">#13 Kumiega — \"Hydrologic Connectivity in the Edwards Aquifer between San Marcos Springs and Barton Springs during 2009 Drought Conditions\"</a><br /><b>Recommendation:</b> Choose One<br /><b>Type:</b> Anonymous Reviewer/Anonymous Author</p><p>Login to <a href=\"http://localhost/index.php/publicknowledge/en/dashboard/editorial?workflowSubmissionId=13\">view all files and comments</a> provided by this reviewer.</p>'),
(118,1048585,13,4,'2025-08-02 05:59:21',1073741836,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"David Buskins\" <dbuskins@mailinator.com>','','','Review complete: Adela Gallego recommends Choose One for #13 Kumiega — \"Hydrologic Connectivity in the Edwards Aquifer between San Marcos Springs and Barton Springs during 2009 Drought Conditions\"','<p>Dear David Buskins,</p><p>Adela Gallego completed the following review:</p><p><a href=\"http://localhost/index.php/publicknowledge/en/dashboard/editorial?workflowSubmissionId=13\">#13 Kumiega — \"Hydrologic Connectivity in the Edwards Aquifer between San Marcos Springs and Barton Springs during 2009 Drought Conditions\"</a><br /><b>Recommendation:</b> Choose One<br /><b>Type:</b> Anonymous Reviewer/Anonymous Author</p><p>Login to <a href=\"http://localhost/index.php/publicknowledge/en/dashboard/editorial?workflowSubmissionId=13\">view all files and comments</a> provided by this reviewer.</p>'),
(119,1048585,13,5,'2025-08-02 05:59:21',1073741836,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Stephanie Berardo\" <sberardo@mailinator.com>','','','Review complete: Adela Gallego recommends Choose One for #13 Kumiega — \"Hydrologic Connectivity in the Edwards Aquifer between San Marcos Springs and Barton Springs during 2009 Drought Conditions\"','<p>Dear Stephanie Berardo,</p><p>Adela Gallego completed the following review:</p><p><a href=\"http://localhost/index.php/publicknowledge/en/dashboard/editorial?workflowSubmissionId=13\">#13 Kumiega — \"Hydrologic Connectivity in the Edwards Aquifer between San Marcos Springs and Barton Springs during 2009 Drought Conditions\"</a><br /><b>Recommendation:</b> Choose One<br /><b>Type:</b> Anonymous Reviewer/Anonymous Author</p><p>Login to <a href=\"http://localhost/index.php/publicknowledge/en/dashboard/editorial?workflowSubmissionId=13\">view all files and comments</a> provided by this reviewer.</p>'),
(120,1048585,13,3,'2025-08-02 05:59:29',805306369,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Lise Kumiega\" <lkumiega@mailinator.com>','','','Your submission has been reviewed and we encourage you to submit revisions','<p>Dear Lise Kumiega,</p><p>Your submission \"Hydrologic Connectivity in the Edwards Aquifer between San Marcos Springs and Barton Springs during 2009 Drought Conditions\" has been reviewed and we would like to encourage you to submit revisions that address the reviewers\' comments. An editor will review these revisions and if they address the concerns adequately, your submission may be accepted for publication.</p><p>The reviewers\' comments are included at the bottom of this email. Please respond to each point in the reviewers\' comments and identify what changes you have made. If you find any of the reviewer\'s comments to be unjustified or inappropriate, please explain your perspective.</p><p>When you have completed your revisions, you can upload revised documents along with your response to the reviewers\' comments at your <a href=\"http://localhost/index.php/publicknowledge/en/dashboard/mySubmissions?workflowSubmissionId=13\">submission dashboard</a>. If you have been logged out, you can login again with the username lkumiega.</p><p>If you have any questions, please contact me from your <a href=\"http://localhost/index.php/publicknowledge/en/dashboard/mySubmissions?workflowSubmissionId=13\">submission dashboard</a>.</p><p>We look forward to receiving your revised submission.</p><p>Kind regards,</p><p>Daniel Barnes</p><hr><p>The following comments were received from reviewers.</p><p><strong>Reviewer 1:</strong><br>Recommendation: Revisions Required</p><p>Here are my review comments</p><p><strong>Reviewer 2:</strong><br>Recommendation: Revisions Required</p><p>Here are my review comments</p><p><strong>Reviewer 3:</strong><br>Recommendation: Resubmit for Review</p><p>Here are my review comments</p>'),
(121,1048585,13,3,'2025-08-02 05:59:30',1073741825,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Julie Janssen\" <jjanssen@mailinator.com>','','','Thank you for your review','<p>Dear Julie Janssen,</p>\n<p>Thank you for completing your review of the submission, \"Hydrologic Connectivity in the Edwards Aquifer between San Marcos Springs and Barton Springs during 2009 Drought Conditions\", for Journal of Public Knowledge. We appreciate your time and expertise in contributing to the quality of the work that we publish. We have shared your comments with the authors, along with our other reviewers\' comments and the editor\'s decision.</p>\n<p>Based on the feedback we received, we have notified the authors of the following:</p>\n<p>We have invited the authors to submit revisions.</p>\n<p>Your recommendation was considered alongside the recommendations of other reviewers before coming to a decision. Occasionally the editor\'s decision may differ from the recommendation made by one or more reviewers. The editor considers many factors, and does not take these decisions lightly. We are grateful for our reviewers\' expertise and suggestions.</p>\n<p>It has been a pleasure to work with you as a reviewer for Journal of Public Knowledge, and we hope to have the opportunity to work with you again in the future.</p>\n<p>Kind regards,</p>\n<p><p>Daniel Barnes</p></p>'),
(122,1048585,13,3,'2025-08-02 05:59:30',1073741825,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Aisla McCrae\" <amccrae@mailinator.com>','','','Thank you for your review','<p>Dear Aisla McCrae,</p>\n<p>Thank you for completing your review of the submission, \"Hydrologic Connectivity in the Edwards Aquifer between San Marcos Springs and Barton Springs during 2009 Drought Conditions\", for Journal of Public Knowledge. We appreciate your time and expertise in contributing to the quality of the work that we publish. We have shared your comments with the authors, along with our other reviewers\' comments and the editor\'s decision.</p>\n<p>Based on the feedback we received, we have notified the authors of the following:</p>\n<p>We have invited the authors to submit revisions.</p>\n<p>Your recommendation was considered alongside the recommendations of other reviewers before coming to a decision. Occasionally the editor\'s decision may differ from the recommendation made by one or more reviewers. The editor considers many factors, and does not take these decisions lightly. We are grateful for our reviewers\' expertise and suggestions.</p>\n<p>It has been a pleasure to work with you as a reviewer for Journal of Public Knowledge, and we hope to have the opportunity to work with you again in the future.</p>\n<p>Kind regards,</p>\n<p><p>Daniel Barnes</p></p>'),
(123,1048585,13,3,'2025-08-02 05:59:30',1073741825,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Adela Gallego\" <agallego@mailinator.com>','','','Thank you for your review','<p>Dear Adela Gallego,</p>\n<p>Thank you for completing your review of the submission, \"Hydrologic Connectivity in the Edwards Aquifer between San Marcos Springs and Barton Springs during 2009 Drought Conditions\", for Journal of Public Knowledge. We appreciate your time and expertise in contributing to the quality of the work that we publish. We have shared your comments with the authors, along with our other reviewers\' comments and the editor\'s decision.</p>\n<p>Based on the feedback we received, we have notified the authors of the following:</p>\n<p>We have invited the authors to submit revisions.</p>\n<p>Your recommendation was considered alongside the recommendations of other reviewers before coming to a decision. Occasionally the editor\'s decision may differ from the recommendation made by one or more reviewers. The editor considers many factors, and does not take these decisions lightly. We are grateful for our reviewers\' expertise and suggestions.</p>\n<p>It has been a pleasure to work with you as a reviewer for Journal of Public Knowledge, and we hope to have the opportunity to work with you again in the future.</p>\n<p>Kind regards,</p>\n<p><p>Daniel Barnes</p></p>'),
(124,1048585,14,NULL,'2025-08-02 05:59:41',805306370,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Daniel Barnes\" <dbarnes@mailinator.com>','','','You have been assigned as an editor on a submission to Journal of Public Knowledge','<p>Dear Daniel Barnes,</p><p>The following submission has been assigned to you to see through the editorial process.</p><p><a href=\"http://localhost/index.php/publicknowledge/en/dashboard/editorial?workflowSubmissionId=14\">Towards Designing an Intercultural Curriculum: A Case Study from the Atlantic Coast of Nicaragua</a><br />Patricia Daniel</p><p><b>Abstract</b></p>One of the challenges still to be met in the 21st century is that of genuinely embracing diversity. How can education help to overcome the barriers that continue to exist between people on the basis of language, culture and gender? This case study takes the Atlantic Coast of Nicaragua as an example of a multilingual/multiethnic region and examines how the community university URACCAN is contributing to the development of interculturality. It describes participatory research that was carried out with university staff and students with the intention of defining an intercultural curriculum and appropriate strategies for delivering such. One model used as a basis for discussions was the Model for Community Understanding from the Wales Curriculum Council, which emphasises the belonging of the individual to different communities or cultures at the same time. Factors supporting the development of an intercultural curriculum include the university’s close involvement with the ethnic communities it serves. However, ethno-linguistic power relations within the region and the country as a whole, still militate against egalitarianism within the university. The research highlights the importance of participatory pedagogy as the basis for promoting interculturality and achieving lasting social transformation.<p>If you find the submission to be relevant for Journal of Public Knowledge, please forward the submission to the review stage by selecting \"Send to Review\" and then assign reviewers by clicking \"Add Reviewer\".</p><p>If the submission is not appropriate for this journal, please decline the submission.</p><p>Thank you in advance.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Journal of Public Knowledge</a>.</p>'),
(125,1048585,14,NULL,'2025-08-02 05:59:41',805306370,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"David Buskins\" <dbuskins@mailinator.com>','','','You have been assigned as an editor on a submission to Journal of Public Knowledge','<p>Dear David Buskins,</p><p>The following submission has been assigned to you to see through the editorial process.</p><p><a href=\"http://localhost/index.php/publicknowledge/en/dashboard/editorial?workflowSubmissionId=14\">Towards Designing an Intercultural Curriculum: A Case Study from the Atlantic Coast of Nicaragua</a><br />Patricia Daniel</p><p><b>Abstract</b></p>One of the challenges still to be met in the 21st century is that of genuinely embracing diversity. How can education help to overcome the barriers that continue to exist between people on the basis of language, culture and gender? This case study takes the Atlantic Coast of Nicaragua as an example of a multilingual/multiethnic region and examines how the community university URACCAN is contributing to the development of interculturality. It describes participatory research that was carried out with university staff and students with the intention of defining an intercultural curriculum and appropriate strategies for delivering such. One model used as a basis for discussions was the Model for Community Understanding from the Wales Curriculum Council, which emphasises the belonging of the individual to different communities or cultures at the same time. Factors supporting the development of an intercultural curriculum include the university’s close involvement with the ethnic communities it serves. However, ethno-linguistic power relations within the region and the country as a whole, still militate against egalitarianism within the university. The research highlights the importance of participatory pedagogy as the basis for promoting interculturality and achieving lasting social transformation.<p>If you find the submission to be relevant for Journal of Public Knowledge, please forward the submission to the review stage by selecting \"Send to Review\" and then assign reviewers by clicking \"Add Reviewer\".</p><p>If the submission is not appropriate for this journal, please decline the submission.</p><p>Thank you in advance.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Journal of Public Knowledge</a>.</p>'),
(126,1048585,14,NULL,'2025-08-02 05:59:41',805306370,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Stephanie Berardo\" <sberardo@mailinator.com>','','','You have been assigned as an editor on a submission to Journal of Public Knowledge','<p>Dear Stephanie Berardo,</p><p>The following submission has been assigned to you to see through the editorial process.</p><p><a href=\"http://localhost/index.php/publicknowledge/en/dashboard/editorial?workflowSubmissionId=14\">Towards Designing an Intercultural Curriculum: A Case Study from the Atlantic Coast of Nicaragua</a><br />Patricia Daniel</p><p><b>Abstract</b></p>One of the challenges still to be met in the 21st century is that of genuinely embracing diversity. How can education help to overcome the barriers that continue to exist between people on the basis of language, culture and gender? This case study takes the Atlantic Coast of Nicaragua as an example of a multilingual/multiethnic region and examines how the community university URACCAN is contributing to the development of interculturality. It describes participatory research that was carried out with university staff and students with the intention of defining an intercultural curriculum and appropriate strategies for delivering such. One model used as a basis for discussions was the Model for Community Understanding from the Wales Curriculum Council, which emphasises the belonging of the individual to different communities or cultures at the same time. Factors supporting the development of an intercultural curriculum include the university’s close involvement with the ethnic communities it serves. However, ethno-linguistic power relations within the region and the country as a whole, still militate against egalitarianism within the university. The research highlights the importance of participatory pedagogy as the basis for promoting interculturality and achieving lasting social transformation.<p>If you find the submission to be relevant for Journal of Public Knowledge, please forward the submission to the review stage by selecting \"Send to Review\" and then assign reviewers by clicking \"Add Reviewer\".</p><p>If the submission is not appropriate for this journal, please decline the submission.</p><p>Thank you in advance.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Journal of Public Knowledge</a>.</p>'),
(127,1048585,14,NULL,'2025-08-02 05:59:41',536870914,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Patricia Daniel\" <pdaniel@mailinator.com>','','','Thank you for your submission to Journal of Public Knowledge','<p>Dear Patricia Daniel,</p><p>Thank you for your submission to Journal of Public Knowledge. We have received your submission, \"Towards Designing an Intercultural Curriculum: A Case Study from the Atlantic Coast of Nicaragua\", and a member of our editorial team will see it soon. You will be sent an email when an initial decision is made, and we may contact you for further information.</p><p>You can view your submission and track its progress through the editorial process at the following location:</p><p>Submission URL: http://localhost/index.php/publicknowledge/en/dashboard/mySubmissions?workflowSubmissionId=14</p><p>If you have been logged out, you can login again with the username pdaniel.</p><p>If you have any questions, please contact me from your <a href=\"http://localhost/index.php/publicknowledge/en/dashboard/mySubmissions?workflowSubmissionId=14\">submission dashboard</a>.</p><p>Thank you for considering Journal of Public Knowledge as a venue for your work.</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Journal of Public Knowledge</a>.</p>'),
(128,1048585,15,NULL,'2025-08-02 05:59:49',805306370,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Daniel Barnes\" <dbarnes@mailinator.com>','','','You have been assigned as an editor on a submission to Journal of Public Knowledge','<p>Dear Daniel Barnes,</p><p>The following submission has been assigned to you to see through the editorial process.</p><p><a href=\"http://localhost/index.php/publicknowledge/en/dashboard/editorial?workflowSubmissionId=15\">Yam diseases and its management in Nigeria</a><br />Rana Baiyewu</p><p><b>Abstract</b></p>This review presents different diseases associated with yam and the management strategies employed in combating its menace in Nigeria. The field and storage diseases are presented, anthracnose is regarded as the most widely spread of all the field diseases, while yam mosaic virus disease is considered to cause the most severe losses in yams. Dry rot is considered as the most devastating of all the storage diseases of yam. Dry rot of yams alone causes a marked reduction in the quantity, marketable value and edible portions of tubers and those reductions are more severe in stored yams. The management strategies adopted and advocated for combating the field diseases includes the use of crop rotation, fallowing, planting of healthy material, the destruction of infected crop cultivars and the use of resistant cultivars. With regards to the storage diseases, the use of Tecto (Thiabendazole), locally made dry gins or wood ash before storage has been found to protect yam tubers against fungal infection in storage. Finally, processing of yam tubers into chips or cubes increases its shelf live for a period of between 6 months and one year.<p>If you find the submission to be relevant for Journal of Public Knowledge, please forward the submission to the review stage by selecting \"Send to Review\" and then assign reviewers by clicking \"Add Reviewer\".</p><p>If the submission is not appropriate for this journal, please decline the submission.</p><p>Thank you in advance.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Journal of Public Knowledge</a>.</p>'),
(129,1048585,15,NULL,'2025-08-02 05:59:49',805306370,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"David Buskins\" <dbuskins@mailinator.com>','','','You have been assigned as an editor on a submission to Journal of Public Knowledge','<p>Dear David Buskins,</p><p>The following submission has been assigned to you to see through the editorial process.</p><p><a href=\"http://localhost/index.php/publicknowledge/en/dashboard/editorial?workflowSubmissionId=15\">Yam diseases and its management in Nigeria</a><br />Rana Baiyewu</p><p><b>Abstract</b></p>This review presents different diseases associated with yam and the management strategies employed in combating its menace in Nigeria. The field and storage diseases are presented, anthracnose is regarded as the most widely spread of all the field diseases, while yam mosaic virus disease is considered to cause the most severe losses in yams. Dry rot is considered as the most devastating of all the storage diseases of yam. Dry rot of yams alone causes a marked reduction in the quantity, marketable value and edible portions of tubers and those reductions are more severe in stored yams. The management strategies adopted and advocated for combating the field diseases includes the use of crop rotation, fallowing, planting of healthy material, the destruction of infected crop cultivars and the use of resistant cultivars. With regards to the storage diseases, the use of Tecto (Thiabendazole), locally made dry gins or wood ash before storage has been found to protect yam tubers against fungal infection in storage. Finally, processing of yam tubers into chips or cubes increases its shelf live for a period of between 6 months and one year.<p>If you find the submission to be relevant for Journal of Public Knowledge, please forward the submission to the review stage by selecting \"Send to Review\" and then assign reviewers by clicking \"Add Reviewer\".</p><p>If the submission is not appropriate for this journal, please decline the submission.</p><p>Thank you in advance.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Journal of Public Knowledge</a>.</p>'),
(130,1048585,15,NULL,'2025-08-02 05:59:49',805306370,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Stephanie Berardo\" <sberardo@mailinator.com>','','','You have been assigned as an editor on a submission to Journal of Public Knowledge','<p>Dear Stephanie Berardo,</p><p>The following submission has been assigned to you to see through the editorial process.</p><p><a href=\"http://localhost/index.php/publicknowledge/en/dashboard/editorial?workflowSubmissionId=15\">Yam diseases and its management in Nigeria</a><br />Rana Baiyewu</p><p><b>Abstract</b></p>This review presents different diseases associated with yam and the management strategies employed in combating its menace in Nigeria. The field and storage diseases are presented, anthracnose is regarded as the most widely spread of all the field diseases, while yam mosaic virus disease is considered to cause the most severe losses in yams. Dry rot is considered as the most devastating of all the storage diseases of yam. Dry rot of yams alone causes a marked reduction in the quantity, marketable value and edible portions of tubers and those reductions are more severe in stored yams. The management strategies adopted and advocated for combating the field diseases includes the use of crop rotation, fallowing, planting of healthy material, the destruction of infected crop cultivars and the use of resistant cultivars. With regards to the storage diseases, the use of Tecto (Thiabendazole), locally made dry gins or wood ash before storage has been found to protect yam tubers against fungal infection in storage. Finally, processing of yam tubers into chips or cubes increases its shelf live for a period of between 6 months and one year.<p>If you find the submission to be relevant for Journal of Public Knowledge, please forward the submission to the review stage by selecting \"Send to Review\" and then assign reviewers by clicking \"Add Reviewer\".</p><p>If the submission is not appropriate for this journal, please decline the submission.</p><p>Thank you in advance.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Journal of Public Knowledge</a>.</p>'),
(131,1048585,15,NULL,'2025-08-02 05:59:50',536870914,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Rana Baiyewu\" <rbaiyewu@mailinator.com>','','','Thank you for your submission to Journal of Public Knowledge','<p>Dear Rana Baiyewu,</p><p>Thank you for your submission to Journal of Public Knowledge. We have received your submission, \"Yam diseases and its management in Nigeria\", and a member of our editorial team will see it soon. You will be sent an email when an initial decision is made, and we may contact you for further information.</p><p>You can view your submission and track its progress through the editorial process at the following location:</p><p>Submission URL: http://localhost/index.php/publicknowledge/en/dashboard/mySubmissions?workflowSubmissionId=15</p><p>If you have been logged out, you can login again with the username rbaiyewu.</p><p>If you have any questions, please contact me from your <a href=\"http://localhost/index.php/publicknowledge/en/dashboard/mySubmissions?workflowSubmissionId=15\">submission dashboard</a>.</p><p>Thank you for considering Journal of Public Knowledge as a venue for your work.</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Journal of Public Knowledge</a>.</p>'),
(132,1048585,15,3,'2025-08-02 05:59:57',805306369,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Rana Baiyewu\" <rbaiyewu@mailinator.com>','','','Your submission has been sent for review','<p>Dear Rana Baiyewu,</p><p>I am pleased to inform you that an editor has reviewed your submission, \"Yam diseases and its management in Nigeria\", and has decided to send it for peer review. An editor will identify qualified reviewers who will provide feedback on your submission.</p><p>This journal conducts double-anonymous peer review. The reviewers will not see any identifying information about you or your co-authors. Similarly, you will not know who reviewed your submission, and you will not hear from the reviewers directly. You will hear from us with feedback from the reviewers and information about the next steps.</p><p>Please note that sending the submission to peer review does not guarantee that it will be published. We will consider the reviewers\' recommendations before deciding to accept the submission for publication. You may be asked to make revisions and respond to the reviewers\' comments before a final decision is made.</p><p>If you have any questions, please contact me from your submission dashboard.</p><p><p>Daniel Barnes</p></p>'),
(133,1048585,15,3,'2025-08-02 06:00:02',1073741833,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Paul Hudson\" <phudson@mailinator.com>','','','Invitation to review','<p>Dear Paul Hudson,</p>\r\n<p>I believe that you would serve as an excellent reviewer for a submission to Journal of Public Knowledge. The submission\'s title and abstract are below, and I hope that you will consider undertaking this important task for us.</p>\r\n<p>If you are able to review this submission, your review is due by 2025-08-30. You can view the submission, upload review files, and submit your review by logging into the journal site and following the steps at the link below.</p>\r\n<p><a href=\"http://localhost/index.php/publicknowledge/en/reviewer/submission?submissionId=15\">Yam diseases and its management in Nigeria</a></p>\r\n<p><strong>Abstract</strong></p>\r\n<p>This review presents different diseases associated with yam and the management strategies employed in combating its menace in Nigeria. The field and storage diseases are presented, anthracnose is regarded as the most widely spread of all the field diseases, while yam mosaic virus disease is considered to cause the most severe losses in yams. Dry rot is considered as the most devastating of all the storage diseases of yam. Dry rot of yams alone causes a marked reduction in the quantity, marketable value and edible portions of tubers and those reductions are more severe in stored yams. The management strategies adopted and advocated for combating the field diseases includes the use of crop rotation, fallowing, planting of healthy material, the destruction of infected crop cultivars and the use of resistant cultivars. With regards to the storage diseases, the use of Tecto (Thiabendazole), locally made dry gins or wood ash before storage has been found to protect yam tubers against fungal infection in storage. Finally, processing of yam tubers into chips or cubes increases its shelf live for a period of between 6 months and one year.</p>\r\n<p>Please <a href=\"http://localhost/index.php/publicknowledge/en/reviewer/submission?submissionId=15\">accept or decline</a> the review by <strong>2025-08-30</strong>.</p>\r\n<p>You may contact me with any questions about the submission or the review process.</p>\r\n<p>Thank you for considering this request. Your help is much appreciated.</p>\r\n<p>Kind regards,</p>\r\n<p>Daniel Barnes</p>'),
(134,1048585,15,3,'2025-08-02 06:00:04',1073741833,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Aisla McCrae\" <amccrae@mailinator.com>','','','Invitation to review','<p>Dear Aisla McCrae,</p>\r\n<p>I believe that you would serve as an excellent reviewer for a submission to Journal of Public Knowledge. The submission\'s title and abstract are below, and I hope that you will consider undertaking this important task for us.</p>\r\n<p>If you are able to review this submission, your review is due by 2025-08-30. You can view the submission, upload review files, and submit your review by logging into the journal site and following the steps at the link below.</p>\r\n<p><a href=\"http://localhost/index.php/publicknowledge/en/reviewer/submission?submissionId=15\">Yam diseases and its management in Nigeria</a></p>\r\n<p><strong>Abstract</strong></p>\r\n<p>This review presents different diseases associated with yam and the management strategies employed in combating its menace in Nigeria. The field and storage diseases are presented, anthracnose is regarded as the most widely spread of all the field diseases, while yam mosaic virus disease is considered to cause the most severe losses in yams. Dry rot is considered as the most devastating of all the storage diseases of yam. Dry rot of yams alone causes a marked reduction in the quantity, marketable value and edible portions of tubers and those reductions are more severe in stored yams. The management strategies adopted and advocated for combating the field diseases includes the use of crop rotation, fallowing, planting of healthy material, the destruction of infected crop cultivars and the use of resistant cultivars. With regards to the storage diseases, the use of Tecto (Thiabendazole), locally made dry gins or wood ash before storage has been found to protect yam tubers against fungal infection in storage. Finally, processing of yam tubers into chips or cubes increases its shelf live for a period of between 6 months and one year.</p>\r\n<p>Please <a href=\"http://localhost/index.php/publicknowledge/en/reviewer/submission?submissionId=15\">accept or decline</a> the review by <strong>2025-08-30</strong>.</p>\r\n<p>You may contact me with any questions about the submission or the review process.</p>\r\n<p>Thank you for considering this request. Your help is much appreciated.</p>\r\n<p>Kind regards,</p>\r\n<p>Daniel Barnes</p>'),
(135,1048585,15,3,'2025-08-02 06:00:07',805306369,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Rana Baiyewu\" <rbaiyewu@mailinator.com>','','','Your submission has been accepted to Journal of Public Knowledge','<p>Dear Rana Baiyewu,</p><p>I am pleased to inform you that we have decided to accept your submission without further revision. After careful review, we found your submission, Yam diseases and its management in Nigeria, to meet or exceed our expectations. We are excited to publish your piece in Journal of Public Knowledge and we thank you for choosing our journal as a venue for your work.</p><p>Your submission is now forthcoming in a future issue of Journal of Public Knowledge and you are welcome to include it in your list of publications. We recognize the hard work that goes into every successful submission and we want to congratulate you on reaching this stage.</p><p>Your submission will now undergo copy editing and formatting to prepare it for publication.</p><p>You will shortly receive further instructions.</p><p>If you have any questions, please contact me from your <a href=\"http://localhost/index.php/publicknowledge/en/dashboard/mySubmissions?workflowSubmissionId=15\">submission dashboard</a>.</p><p>Kind regards,</p><p>Daniel Barnes</p>'),
(136,1048585,15,3,'2025-08-02 06:00:15',805306369,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Rana Baiyewu\" <rbaiyewu@mailinator.com>','','','Next steps for publishing your submission','<p>Dear Rana Baiyewu,</p><p>I am writing from Journal of Public Knowledge to let you know that the editing of your submission, \"Yam diseases and its management in Nigeria\", is complete. Your submission will now advance to the production stage, where the final galleys will be prepared for publication. We will contact you if we need any further assistance.</p><p>If you have any questions, please contact me from your <a href=\"http://localhost/index.php/publicknowledge/en/dashboard/mySubmissions?workflowSubmissionId=15\">submission dashboard</a>.</p><p>Kind regards,</p><p>Daniel Barnes</p>'),
(137,1048585,16,NULL,'2025-08-02 06:00:29',805306370,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Daniel Barnes\" <dbarnes@mailinator.com>','','','You have been assigned as an editor on a submission to Journal of Public Knowledge','<p>Dear Daniel Barnes,</p><p>The following submission has been assigned to you to see through the editorial process.</p><p><a href=\"http://localhost/index.php/publicknowledge/en/dashboard/editorial?workflowSubmissionId=16\">Influence of long-term nutrition with different dietary fats on fatty acid composition of heavy pigs backfat</a><br />Rosanna Rossi</p><p><b>Abstract</b></p>Aim of this research is to provide a general situation of cattle slaughtered in Cameroon, as a representative example for the Central African Sub-region. The quality and safety of beef from the abattoir of Yaoundé, the largest in Cameroon, were considered. From January 2009 to March 2012, the pre-slaughter conditions and characteristics of 1953 cattle carcasses were recorded, as well as the pH of m. longissimus thoracis 24 h after slaughter. From these carcasses, 60 were selected to represent the bulls slaughtered. The quality parameters and composition of m. longissimus thoracis were carried out. The origin of most of the cattle was the Guinea High Savannah (74.6%), and transhumance was the common production system (75.5%). Gudali (45.6%), White Fulani (33.3%) and Red Mbororo (20.3%) breeds were predominant. Carcass weight was affected by rearing system and cattle category, and it markedly varied during year. Considering meat quality, the fat content was low (1.2%) and similar between breeds, moreover Gudali showed the toughest meat. Of the cows slaughtered, 27% were pregnant and the most common abnormal conditions encountered were ectoparasites, fatigue, lameness, fungal-like skin lesions, enlarged lymph nodes, respiratory distress, nodular lesions. More than 20% of the carcasses had some organs condemned, mainly for liver flukes (5.17%), and 1.0% of them were completely condemned due to tuberculosis, that also affected 3.28% of lungs. These data could aid authorities draw up programmes with the aim to strengthen cattle production, improve beef supply, control and prevent the observed diseases, and promote the regional trade.<p>If you find the submission to be relevant for Journal of Public Knowledge, please forward the submission to the review stage by selecting \"Send to Review\" and then assign reviewers by clicking \"Add Reviewer\".</p><p>If the submission is not appropriate for this journal, please decline the submission.</p><p>Thank you in advance.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Journal of Public Knowledge</a>.</p>'),
(138,1048585,16,NULL,'2025-08-02 06:00:29',805306370,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"David Buskins\" <dbuskins@mailinator.com>','','','You have been assigned as an editor on a submission to Journal of Public Knowledge','<p>Dear David Buskins,</p><p>The following submission has been assigned to you to see through the editorial process.</p><p><a href=\"http://localhost/index.php/publicknowledge/en/dashboard/editorial?workflowSubmissionId=16\">Influence of long-term nutrition with different dietary fats on fatty acid composition of heavy pigs backfat</a><br />Rosanna Rossi</p><p><b>Abstract</b></p>Aim of this research is to provide a general situation of cattle slaughtered in Cameroon, as a representative example for the Central African Sub-region. The quality and safety of beef from the abattoir of Yaoundé, the largest in Cameroon, were considered. From January 2009 to March 2012, the pre-slaughter conditions and characteristics of 1953 cattle carcasses were recorded, as well as the pH of m. longissimus thoracis 24 h after slaughter. From these carcasses, 60 were selected to represent the bulls slaughtered. The quality parameters and composition of m. longissimus thoracis were carried out. The origin of most of the cattle was the Guinea High Savannah (74.6%), and transhumance was the common production system (75.5%). Gudali (45.6%), White Fulani (33.3%) and Red Mbororo (20.3%) breeds were predominant. Carcass weight was affected by rearing system and cattle category, and it markedly varied during year. Considering meat quality, the fat content was low (1.2%) and similar between breeds, moreover Gudali showed the toughest meat. Of the cows slaughtered, 27% were pregnant and the most common abnormal conditions encountered were ectoparasites, fatigue, lameness, fungal-like skin lesions, enlarged lymph nodes, respiratory distress, nodular lesions. More than 20% of the carcasses had some organs condemned, mainly for liver flukes (5.17%), and 1.0% of them were completely condemned due to tuberculosis, that also affected 3.28% of lungs. These data could aid authorities draw up programmes with the aim to strengthen cattle production, improve beef supply, control and prevent the observed diseases, and promote the regional trade.<p>If you find the submission to be relevant for Journal of Public Knowledge, please forward the submission to the review stage by selecting \"Send to Review\" and then assign reviewers by clicking \"Add Reviewer\".</p><p>If the submission is not appropriate for this journal, please decline the submission.</p><p>Thank you in advance.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Journal of Public Knowledge</a>.</p>'),
(139,1048585,16,NULL,'2025-08-02 06:00:29',805306370,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Stephanie Berardo\" <sberardo@mailinator.com>','','','You have been assigned as an editor on a submission to Journal of Public Knowledge','<p>Dear Stephanie Berardo,</p><p>The following submission has been assigned to you to see through the editorial process.</p><p><a href=\"http://localhost/index.php/publicknowledge/en/dashboard/editorial?workflowSubmissionId=16\">Influence of long-term nutrition with different dietary fats on fatty acid composition of heavy pigs backfat</a><br />Rosanna Rossi</p><p><b>Abstract</b></p>Aim of this research is to provide a general situation of cattle slaughtered in Cameroon, as a representative example for the Central African Sub-region. The quality and safety of beef from the abattoir of Yaoundé, the largest in Cameroon, were considered. From January 2009 to March 2012, the pre-slaughter conditions and characteristics of 1953 cattle carcasses were recorded, as well as the pH of m. longissimus thoracis 24 h after slaughter. From these carcasses, 60 were selected to represent the bulls slaughtered. The quality parameters and composition of m. longissimus thoracis were carried out. The origin of most of the cattle was the Guinea High Savannah (74.6%), and transhumance was the common production system (75.5%). Gudali (45.6%), White Fulani (33.3%) and Red Mbororo (20.3%) breeds were predominant. Carcass weight was affected by rearing system and cattle category, and it markedly varied during year. Considering meat quality, the fat content was low (1.2%) and similar between breeds, moreover Gudali showed the toughest meat. Of the cows slaughtered, 27% were pregnant and the most common abnormal conditions encountered were ectoparasites, fatigue, lameness, fungal-like skin lesions, enlarged lymph nodes, respiratory distress, nodular lesions. More than 20% of the carcasses had some organs condemned, mainly for liver flukes (5.17%), and 1.0% of them were completely condemned due to tuberculosis, that also affected 3.28% of lungs. These data could aid authorities draw up programmes with the aim to strengthen cattle production, improve beef supply, control and prevent the observed diseases, and promote the regional trade.<p>If you find the submission to be relevant for Journal of Public Knowledge, please forward the submission to the review stage by selecting \"Send to Review\" and then assign reviewers by clicking \"Add Reviewer\".</p><p>If the submission is not appropriate for this journal, please decline the submission.</p><p>Thank you in advance.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Journal of Public Knowledge</a>.</p>'),
(140,1048585,16,NULL,'2025-08-02 06:00:30',536870914,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Rosanna Rossi\" <rrossi@mailinator.com>','','','Thank you for your submission to Journal of Public Knowledge','<p>Dear Rosanna Rossi,</p><p>Thank you for your submission to Journal of Public Knowledge. We have received your submission, \"Influence of long-term nutrition with different dietary fats on fatty acid composition of heavy pigs backfat\", and a member of our editorial team will see it soon. You will be sent an email when an initial decision is made, and we may contact you for further information.</p><p>You can view your submission and track its progress through the editorial process at the following location:</p><p>Submission URL: http://localhost/index.php/publicknowledge/en/dashboard/mySubmissions?workflowSubmissionId=16</p><p>If you have been logged out, you can login again with the username rrossi.</p><p>If you have any questions, please contact me from your <a href=\"http://localhost/index.php/publicknowledge/en/dashboard/mySubmissions?workflowSubmissionId=16\">submission dashboard</a>.</p><p>Thank you for considering Journal of Public Knowledge as a venue for your work.</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Journal of Public Knowledge</a>.</p>'),
(141,1048585,17,NULL,'2025-08-02 06:00:38',805306370,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Daniel Barnes\" <dbarnes@mailinator.com>','','','You have been assigned as an editor on a submission to Journal of Public Knowledge','<p>Dear Daniel Barnes,</p><p>The following submission has been assigned to you to see through the editorial process.</p><p><a href=\"http://localhost/index.php/publicknowledge/en/dashboard/editorial?workflowSubmissionId=17\">Antimicrobial, heavy metal resistance and plasmid profile of coliforms isolated from nosocomial infections in a hospital in Isfahan, Iran</a><br />Vajiheh Karbasizaed</p><p><b>Abstract</b></p>The antimicrobial, heavy metal resistance patterns and plasmid profiles of Coliforms (Enterobacteriacea) isolated from nosocomial infections and healthy human faeces were compared. Fifteen of the 25 isolates from nosocomial infections were identified as Escherichia coli, and remaining as Kelebsiella pneumoniae. Seventy two percent of the strains isolated from nosocomial infections possess multiple resistance to antibiotics compared to 45% of strains from healthy human faeces. The difference between minimal inhibitory concentration (MIC) values of strains from clinical cases and from faeces for four heavy metals (Hg, Cu, Pb, Cd) was not significant. However most strains isolated from hospital were more tolerant to heavy metal than those from healthy persons. There was no consistent relationship between plasmid profile group and antimicrobial resistance pattern, although a conjugative plasmid (&gt;56.4 kb) encoding resistance to heavy metals and antibiotics was recovered from eight of the strains isolated from nosocomial infections. The results indicate multidrug-resistance coliforms as a potential cause of nosocomial infection in this region.<p>If you find the submission to be relevant for Journal of Public Knowledge, please forward the submission to the review stage by selecting \"Send to Review\" and then assign reviewers by clicking \"Add Reviewer\".</p><p>If the submission is not appropriate for this journal, please decline the submission.</p><p>Thank you in advance.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Journal of Public Knowledge</a>.</p>'),
(142,1048585,17,NULL,'2025-08-02 06:00:38',805306370,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"David Buskins\" <dbuskins@mailinator.com>','','','You have been assigned as an editor on a submission to Journal of Public Knowledge','<p>Dear David Buskins,</p><p>The following submission has been assigned to you to see through the editorial process.</p><p><a href=\"http://localhost/index.php/publicknowledge/en/dashboard/editorial?workflowSubmissionId=17\">Antimicrobial, heavy metal resistance and plasmid profile of coliforms isolated from nosocomial infections in a hospital in Isfahan, Iran</a><br />Vajiheh Karbasizaed</p><p><b>Abstract</b></p>The antimicrobial, heavy metal resistance patterns and plasmid profiles of Coliforms (Enterobacteriacea) isolated from nosocomial infections and healthy human faeces were compared. Fifteen of the 25 isolates from nosocomial infections were identified as Escherichia coli, and remaining as Kelebsiella pneumoniae. Seventy two percent of the strains isolated from nosocomial infections possess multiple resistance to antibiotics compared to 45% of strains from healthy human faeces. The difference between minimal inhibitory concentration (MIC) values of strains from clinical cases and from faeces for four heavy metals (Hg, Cu, Pb, Cd) was not significant. However most strains isolated from hospital were more tolerant to heavy metal than those from healthy persons. There was no consistent relationship between plasmid profile group and antimicrobial resistance pattern, although a conjugative plasmid (&gt;56.4 kb) encoding resistance to heavy metals and antibiotics was recovered from eight of the strains isolated from nosocomial infections. The results indicate multidrug-resistance coliforms as a potential cause of nosocomial infection in this region.<p>If you find the submission to be relevant for Journal of Public Knowledge, please forward the submission to the review stage by selecting \"Send to Review\" and then assign reviewers by clicking \"Add Reviewer\".</p><p>If the submission is not appropriate for this journal, please decline the submission.</p><p>Thank you in advance.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Journal of Public Knowledge</a>.</p>'),
(143,1048585,17,NULL,'2025-08-02 06:00:38',805306370,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Stephanie Berardo\" <sberardo@mailinator.com>','','','You have been assigned as an editor on a submission to Journal of Public Knowledge','<p>Dear Stephanie Berardo,</p><p>The following submission has been assigned to you to see through the editorial process.</p><p><a href=\"http://localhost/index.php/publicknowledge/en/dashboard/editorial?workflowSubmissionId=17\">Antimicrobial, heavy metal resistance and plasmid profile of coliforms isolated from nosocomial infections in a hospital in Isfahan, Iran</a><br />Vajiheh Karbasizaed</p><p><b>Abstract</b></p>The antimicrobial, heavy metal resistance patterns and plasmid profiles of Coliforms (Enterobacteriacea) isolated from nosocomial infections and healthy human faeces were compared. Fifteen of the 25 isolates from nosocomial infections were identified as Escherichia coli, and remaining as Kelebsiella pneumoniae. Seventy two percent of the strains isolated from nosocomial infections possess multiple resistance to antibiotics compared to 45% of strains from healthy human faeces. The difference between minimal inhibitory concentration (MIC) values of strains from clinical cases and from faeces for four heavy metals (Hg, Cu, Pb, Cd) was not significant. However most strains isolated from hospital were more tolerant to heavy metal than those from healthy persons. There was no consistent relationship between plasmid profile group and antimicrobial resistance pattern, although a conjugative plasmid (&gt;56.4 kb) encoding resistance to heavy metals and antibiotics was recovered from eight of the strains isolated from nosocomial infections. The results indicate multidrug-resistance coliforms as a potential cause of nosocomial infection in this region.<p>If you find the submission to be relevant for Journal of Public Knowledge, please forward the submission to the review stage by selecting \"Send to Review\" and then assign reviewers by clicking \"Add Reviewer\".</p><p>If the submission is not appropriate for this journal, please decline the submission.</p><p>Thank you in advance.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Journal of Public Knowledge</a>.</p>'),
(144,1048585,17,NULL,'2025-08-02 06:00:38',536870914,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Vajiheh Karbasizaed\" <vkarbasizaed@mailinator.com>','','','Thank you for your submission to Journal of Public Knowledge','<p>Dear Vajiheh Karbasizaed,</p><p>Thank you for your submission to Journal of Public Knowledge. We have received your submission, \"Antimicrobial, heavy metal resistance and plasmid profile of coliforms isolated from nosocomial infections in a hospital in Isfahan, Iran\", and a member of our editorial team will see it soon. You will be sent an email when an initial decision is made, and we may contact you for further information.</p><p>You can view your submission and track its progress through the editorial process at the following location:</p><p>Submission URL: http://localhost/index.php/publicknowledge/en/dashboard/mySubmissions?workflowSubmissionId=17</p><p>If you have been logged out, you can login again with the username vkarbasizaed.</p><p>If you have any questions, please contact me from your <a href=\"http://localhost/index.php/publicknowledge/en/dashboard/mySubmissions?workflowSubmissionId=17\">submission dashboard</a>.</p><p>Thank you for considering Journal of Public Knowledge as a venue for your work.</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Journal of Public Knowledge</a>.</p>'),
(145,1048585,17,3,'2025-08-02 06:00:46',805306369,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Vajiheh Karbasizaed\" <vkarbasizaed@mailinator.com>','','','Your submission has been sent for review','<p>Dear Vajiheh Karbasizaed,</p><p>I am pleased to inform you that an editor has reviewed your submission, \"Antimicrobial, heavy metal resistance and plasmid profile of coliforms isolated from nosocomial infections in a hospital in Isfahan, Iran\", and has decided to send it for peer review. An editor will identify qualified reviewers who will provide feedback on your submission.</p><p>This journal conducts double-anonymous peer review. The reviewers will not see any identifying information about you or your co-authors. Similarly, you will not know who reviewed your submission, and you will not hear from the reviewers directly. You will hear from us with feedback from the reviewers and information about the next steps.</p><p>Please note that sending the submission to peer review does not guarantee that it will be published. We will consider the reviewers\' recommendations before deciding to accept the submission for publication. You may be asked to make revisions and respond to the reviewers\' comments before a final decision is made.</p><p>If you have any questions, please contact me from your submission dashboard.</p><p><p>Daniel Barnes</p></p>'),
(146,1048585,17,3,'2025-08-02 06:00:51',1073741833,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Julie Janssen\" <jjanssen@mailinator.com>','','','Invitation to review','<p>Dear Julie Janssen,</p>\r\n<p>I believe that you would serve as an excellent reviewer for a submission to Journal of Public Knowledge. The submission\'s title and abstract are below, and I hope that you will consider undertaking this important task for us.</p>\r\n<p>If you are able to review this submission, your review is due by 2025-08-30. You can view the submission, upload review files, and submit your review by logging into the journal site and following the steps at the link below.</p>\r\n<p><a href=\"http://localhost/index.php/publicknowledge/en/reviewer/submission?submissionId=17\">Antimicrobial, heavy metal resistance and plasmid profile of coliforms isolated from nosocomial infections in a hospital in Isfahan, Iran</a></p>\r\n<p><strong>Abstract</strong></p>\r\n<p>The antimicrobial, heavy metal resistance patterns and plasmid profiles of Coliforms (Enterobacteriacea) isolated from nosocomial infections and healthy human faeces were compared. Fifteen of the 25 isolates from nosocomial infections were identified as Escherichia coli, and remaining as Kelebsiella pneumoniae. Seventy two percent of the strains isolated from nosocomial infections possess multiple resistance to antibiotics compared to 45% of strains from healthy human faeces. The difference between minimal inhibitory concentration (MIC) values of strains from clinical cases and from faeces for four heavy metals (Hg, Cu, Pb, Cd) was not significant. However most strains isolated from hospital were more tolerant to heavy metal than those from healthy persons. There was no consistent relationship between plasmid profile group and antimicrobial resistance pattern, although a conjugative plasmid (&gt;56.4 kb) encoding resistance to heavy metals and antibiotics was recovered from eight of the strains isolated from nosocomial infections. The results indicate multidrug-resistance coliforms as a potential cause of nosocomial infection in this region.</p>\r\n<p>Please <a href=\"http://localhost/index.php/publicknowledge/en/reviewer/submission?submissionId=17\">accept or decline</a> the review by <strong>2025-08-30</strong>.</p>\r\n<p>You may contact me with any questions about the submission or the review process.</p>\r\n<p>Thank you for considering this request. Your help is much appreciated.</p>\r\n<p>Kind regards,</p>\r\n<p>Daniel Barnes</p>'),
(147,1048585,17,3,'2025-08-02 06:00:53',1073741833,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Paul Hudson\" <phudson@mailinator.com>','','','Invitation to review','<p>Dear Paul Hudson,</p>\r\n<p>I believe that you would serve as an excellent reviewer for a submission to Journal of Public Knowledge. The submission\'s title and abstract are below, and I hope that you will consider undertaking this important task for us.</p>\r\n<p>If you are able to review this submission, your review is due by 2025-08-30. You can view the submission, upload review files, and submit your review by logging into the journal site and following the steps at the link below.</p>\r\n<p><a href=\"http://localhost/index.php/publicknowledge/en/reviewer/submission?submissionId=17\">Antimicrobial, heavy metal resistance and plasmid profile of coliforms isolated from nosocomial infections in a hospital in Isfahan, Iran</a></p>\r\n<p><strong>Abstract</strong></p>\r\n<p>The antimicrobial, heavy metal resistance patterns and plasmid profiles of Coliforms (Enterobacteriacea) isolated from nosocomial infections and healthy human faeces were compared. Fifteen of the 25 isolates from nosocomial infections were identified as Escherichia coli, and remaining as Kelebsiella pneumoniae. Seventy two percent of the strains isolated from nosocomial infections possess multiple resistance to antibiotics compared to 45% of strains from healthy human faeces. The difference between minimal inhibitory concentration (MIC) values of strains from clinical cases and from faeces for four heavy metals (Hg, Cu, Pb, Cd) was not significant. However most strains isolated from hospital were more tolerant to heavy metal than those from healthy persons. There was no consistent relationship between plasmid profile group and antimicrobial resistance pattern, although a conjugative plasmid (&gt;56.4 kb) encoding resistance to heavy metals and antibiotics was recovered from eight of the strains isolated from nosocomial infections. The results indicate multidrug-resistance coliforms as a potential cause of nosocomial infection in this region.</p>\r\n<p>Please <a href=\"http://localhost/index.php/publicknowledge/en/reviewer/submission?submissionId=17\">accept or decline</a> the review by <strong>2025-08-30</strong>.</p>\r\n<p>You may contact me with any questions about the submission or the review process.</p>\r\n<p>Thank you for considering this request. Your help is much appreciated.</p>\r\n<p>Kind regards,</p>\r\n<p>Daniel Barnes</p>'),
(148,1048585,17,3,'2025-08-02 06:00:56',805306369,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Vajiheh Karbasizaed\" <vkarbasizaed@mailinator.com>','','','Your submission has been accepted to Journal of Public Knowledge','<p>Dear Vajiheh Karbasizaed,</p><p>I am pleased to inform you that we have decided to accept your submission without further revision. After careful review, we found your submission, Antimicrobial, heavy metal resistance and plasmid profile of coliforms isolated from nosocomial infections in a hospital in Isfahan, Iran, to meet or exceed our expectations. We are excited to publish your piece in Journal of Public Knowledge and we thank you for choosing our journal as a venue for your work.</p><p>Your submission is now forthcoming in a future issue of Journal of Public Knowledge and you are welcome to include it in your list of publications. We recognize the hard work that goes into every successful submission and we want to congratulate you on reaching this stage.</p><p>Your submission will now undergo copy editing and formatting to prepare it for publication.</p><p>You will shortly receive further instructions.</p><p>If you have any questions, please contact me from your <a href=\"http://localhost/index.php/publicknowledge/en/dashboard/mySubmissions?workflowSubmissionId=17\">submission dashboard</a>.</p><p>Kind regards,</p><p>Daniel Barnes</p>'),
(149,1048585,17,3,'2025-08-02 06:01:05',805306369,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Vajiheh Karbasizaed\" <vkarbasizaed@mailinator.com>','','','Next steps for publishing your submission','<p>Dear Vajiheh Karbasizaed,</p><p>I am writing from Journal of Public Knowledge to let you know that the editing of your submission, \"Antimicrobial, heavy metal resistance and plasmid profile of coliforms isolated from nosocomial infections in a hospital in Isfahan, Iran\", is complete. Your submission will now advance to the production stage, where the final galleys will be prepared for publication. We will contact you if we need any further assistance.</p><p>If you have any questions, please contact me from your <a href=\"http://localhost/index.php/publicknowledge/en/dashboard/mySubmissions?workflowSubmissionId=17\">submission dashboard</a>.</p><p>Kind regards,</p><p>Daniel Barnes</p>'),
(150,1048585,18,NULL,'2025-08-02 06:02:21',805306370,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Daniel Barnes\" <dbarnes@mailinator.com>','','','You have been assigned as an editor on a submission to Journal of Public Knowledge','<p>Dear Daniel Barnes,</p><p>The following submission has been assigned to you to see through the editorial process.</p><p><a href=\"http://localhost/index.php/publicknowledge/en/dashboard/editorial?workflowSubmissionId=18\">Self-Organization in Multi-Level Institutions in Networked Environments</a><br />Valerie Williamson</p><p><b>Abstract</b></p>We compare a setting where actors individually decide whom to sanction with a setting where sanctions are only implemented when actors collectively agree that a certain actor should be sanctioned. Collective sanctioning decisions are problematic due to the difficulty of reaching consensus. However, when a decision is made collectively, perverse sanctioning (e.g. punishing high contributors) by individual actors is ruled out. Therefore, collective sanctioning decisions are likely to be in the interest of the whole group.<p>If you find the submission to be relevant for Journal of Public Knowledge, please forward the submission to the review stage by selecting \"Send to Review\" and then assign reviewers by clicking \"Add Reviewer\".</p><p>If the submission is not appropriate for this journal, please decline the submission.</p><p>Thank you in advance.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Journal of Public Knowledge</a>.</p>'),
(151,1048585,18,NULL,'2025-08-02 06:02:21',805306370,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"David Buskins\" <dbuskins@mailinator.com>','','','You have been assigned as an editor on a submission to Journal of Public Knowledge','<p>Dear David Buskins,</p><p>The following submission has been assigned to you to see through the editorial process.</p><p><a href=\"http://localhost/index.php/publicknowledge/en/dashboard/editorial?workflowSubmissionId=18\">Self-Organization in Multi-Level Institutions in Networked Environments</a><br />Valerie Williamson</p><p><b>Abstract</b></p>We compare a setting where actors individually decide whom to sanction with a setting where sanctions are only implemented when actors collectively agree that a certain actor should be sanctioned. Collective sanctioning decisions are problematic due to the difficulty of reaching consensus. However, when a decision is made collectively, perverse sanctioning (e.g. punishing high contributors) by individual actors is ruled out. Therefore, collective sanctioning decisions are likely to be in the interest of the whole group.<p>If you find the submission to be relevant for Journal of Public Knowledge, please forward the submission to the review stage by selecting \"Send to Review\" and then assign reviewers by clicking \"Add Reviewer\".</p><p>If the submission is not appropriate for this journal, please decline the submission.</p><p>Thank you in advance.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Journal of Public Knowledge</a>.</p>'),
(152,1048585,18,NULL,'2025-08-02 06:02:21',805306370,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Stephanie Berardo\" <sberardo@mailinator.com>','','','You have been assigned as an editor on a submission to Journal of Public Knowledge','<p>Dear Stephanie Berardo,</p><p>The following submission has been assigned to you to see through the editorial process.</p><p><a href=\"http://localhost/index.php/publicknowledge/en/dashboard/editorial?workflowSubmissionId=18\">Self-Organization in Multi-Level Institutions in Networked Environments</a><br />Valerie Williamson</p><p><b>Abstract</b></p>We compare a setting where actors individually decide whom to sanction with a setting where sanctions are only implemented when actors collectively agree that a certain actor should be sanctioned. Collective sanctioning decisions are problematic due to the difficulty of reaching consensus. However, when a decision is made collectively, perverse sanctioning (e.g. punishing high contributors) by individual actors is ruled out. Therefore, collective sanctioning decisions are likely to be in the interest of the whole group.<p>If you find the submission to be relevant for Journal of Public Knowledge, please forward the submission to the review stage by selecting \"Send to Review\" and then assign reviewers by clicking \"Add Reviewer\".</p><p>If the submission is not appropriate for this journal, please decline the submission.</p><p>Thank you in advance.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Journal of Public Knowledge</a>.</p>'),
(153,1048585,18,NULL,'2025-08-02 06:02:21',536870914,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Valerie Williamson\" <vwilliamson@mailinator.com>','','','Thank you for your submission to Journal of Public Knowledge','<p>Dear Valerie Williamson,</p><p>Thank you for your submission to Journal of Public Knowledge. We have received your submission, \"Self-Organization in Multi-Level Institutions in Networked Environments\", and a member of our editorial team will see it soon. You will be sent an email when an initial decision is made, and we may contact you for further information.</p><p>You can view your submission and track its progress through the editorial process at the following location:</p><p>Submission URL: http://localhost/index.php/publicknowledge/en/dashboard/mySubmissions?workflowSubmissionId=18</p><p>If you have been logged out, you can login again with the username vwilliamson.</p><p>If you have any questions, please contact me from your <a href=\"http://localhost/index.php/publicknowledge/en/dashboard/mySubmissions?workflowSubmissionId=18\">submission dashboard</a>.</p><p>Thank you for considering Journal of Public Knowledge as a venue for your work.</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Journal of Public Knowledge</a>.</p>'),
(154,1048585,18,3,'2025-08-02 06:02:29',805306369,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Valerie Williamson\" <vwilliamson@mailinator.com>','','','Your submission has been declined','<p>Dear Valerie Williamson,</p><p>I’m sorry to inform you that, after reviewing your submission, \"Self-Organization in Multi-Level Institutions in Networked Environments\", the editor has found that it does not meet our requirements for publication in Journal of Public Knowledge.</p><p>I wish you success if you consider submitting your work elsewhere.</p><p>Kind regards,</p><p>Daniel Barnes</p>'),
(155,1048585,19,NULL,'2025-08-02 06:02:40',805306370,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Daniel Barnes\" <dbarnes@mailinator.com>','','','You have been assigned as an editor on a submission to Journal of Public Knowledge','<p>Dear Daniel Barnes,</p><p>The following submission has been assigned to you to see through the editorial process.</p><p><a href=\"http://localhost/index.php/publicknowledge/en/dashboard/editorial?workflowSubmissionId=19\">Finocchiaro: Arguments About Arguments</a><br />Zita Woods</p><p><b>Abstract</b></p>None.<p>If you find the submission to be relevant for Journal of Public Knowledge, please forward the submission to the review stage by selecting \"Send to Review\" and then assign reviewers by clicking \"Add Reviewer\".</p><p>If the submission is not appropriate for this journal, please decline the submission.</p><p>Thank you in advance.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Journal of Public Knowledge</a>.</p>'),
(156,1048585,19,NULL,'2025-08-02 06:02:40',805306370,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Minoti Inoue\" <minoue@mailinator.com>','','','You have been assigned as an editor on a submission to Journal of Public Knowledge','<p>Dear Minoti Inoue,</p><p>The following submission has been assigned to you to see through the editorial process.</p><p><a href=\"http://localhost/index.php/publicknowledge/en/dashboard/editorial?workflowSubmissionId=19\">Finocchiaro: Arguments About Arguments</a><br />Zita Woods</p><p><b>Abstract</b></p>None.<p>If you find the submission to be relevant for Journal of Public Knowledge, please forward the submission to the review stage by selecting \"Send to Review\" and then assign reviewers by clicking \"Add Reviewer\".</p><p>If the submission is not appropriate for this journal, please decline the submission.</p><p>Thank you in advance.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Journal of Public Knowledge</a>.</p>'),
(157,1048585,19,NULL,'2025-08-02 06:02:40',536870914,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Zita Woods\" <zwoods@mailinator.com>','','','Thank you for your submission to Journal of Public Knowledge','<p>Dear Zita Woods,</p><p>Thank you for your submission to Journal of Public Knowledge. We have received your submission, \"Finocchiaro: Arguments About Arguments\", and a member of our editorial team will see it soon. You will be sent an email when an initial decision is made, and we may contact you for further information.</p><p>You can view your submission and track its progress through the editorial process at the following location:</p><p>Submission URL: http://localhost/index.php/publicknowledge/en/dashboard/mySubmissions?workflowSubmissionId=19</p><p>If you have been logged out, you can login again with the username zwoods.</p><p>If you have any questions, please contact me from your <a href=\"http://localhost/index.php/publicknowledge/en/dashboard/mySubmissions?workflowSubmissionId=19\">submission dashboard</a>.</p><p>Thank you for considering Journal of Public Knowledge as a venue for your work.</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Journal of Public Knowledge</a>.</p>'),
(158,1048585,19,3,'2025-08-02 06:02:49',805306369,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Zita Woods\" <zwoods@mailinator.com>','','','Your submission has been sent for review','<p>Dear Zita Woods,</p><p>I am pleased to inform you that an editor has reviewed your submission, \"Finocchiaro: Arguments About Arguments\", and has decided to send it for peer review. An editor will identify qualified reviewers who will provide feedback on your submission.</p><p>This journal conducts double-anonymous peer review. The reviewers will not see any identifying information about you or your co-authors. Similarly, you will not know who reviewed your submission, and you will not hear from the reviewers directly. You will hear from us with feedback from the reviewers and information about the next steps.</p><p>Please note that sending the submission to peer review does not guarantee that it will be published. We will consider the reviewers\' recommendations before deciding to accept the submission for publication. You may be asked to make revisions and respond to the reviewers\' comments before a final decision is made.</p><p>If you have any questions, please contact me from your submission dashboard.</p><p><p>Daniel Barnes</p></p>'),
(159,1048585,19,3,'2025-08-02 06:02:53',1073741833,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Paul Hudson\" <phudson@mailinator.com>','','','Invitation to review','<p>Dear Paul Hudson,</p>\r\n<p>I believe that you would serve as an excellent reviewer for a submission to Journal of Public Knowledge. The submission\'s title and abstract are below, and I hope that you will consider undertaking this important task for us.</p>\r\n<p>If you are able to review this submission, your review is due by 2025-08-30. You can view the submission, upload review files, and submit your review by logging into the journal site and following the steps at the link below.</p>\r\n<p><a href=\"http://localhost/index.php/publicknowledge/en/reviewer/submission?submissionId=19\">Finocchiaro: Arguments About Arguments</a></p>\r\n<p><strong>Abstract</strong></p>\r\n<p>None.</p>\r\n<p>Please <a href=\"http://localhost/index.php/publicknowledge/en/reviewer/submission?submissionId=19\">accept or decline</a> the review by <strong>2025-08-30</strong>.</p>\r\n<p>You may contact me with any questions about the submission or the review process.</p>\r\n<p>Thank you for considering this request. Your help is much appreciated.</p>\r\n<p>Kind regards,</p>\r\n<p>Daniel Barnes</p>'),
(160,1048585,19,3,'2025-08-02 06:02:56',1073741833,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Aisla McCrae\" <amccrae@mailinator.com>','','','Invitation to review','<p>Dear Aisla McCrae,</p>\r\n<p>I believe that you would serve as an excellent reviewer for a submission to Journal of Public Knowledge. The submission\'s title and abstract are below, and I hope that you will consider undertaking this important task for us.</p>\r\n<p>If you are able to review this submission, your review is due by 2025-08-30. You can view the submission, upload review files, and submit your review by logging into the journal site and following the steps at the link below.</p>\r\n<p><a href=\"http://localhost/index.php/publicknowledge/en/reviewer/submission?submissionId=19\">Finocchiaro: Arguments About Arguments</a></p>\r\n<p><strong>Abstract</strong></p>\r\n<p>None.</p>\r\n<p>Please <a href=\"http://localhost/index.php/publicknowledge/en/reviewer/submission?submissionId=19\">accept or decline</a> the review by <strong>2025-08-30</strong>.</p>\r\n<p>You may contact me with any questions about the submission or the review process.</p>\r\n<p>Thank you for considering this request. Your help is much appreciated.</p>\r\n<p>Kind regards,</p>\r\n<p>Daniel Barnes</p>'),
(161,1048585,19,3,'2025-08-02 06:02:59',805306369,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Zita Woods\" <zwoods@mailinator.com>','','','Your submission has been accepted to Journal of Public Knowledge','<p>Dear Zita Woods,</p><p>I am pleased to inform you that we have decided to accept your submission without further revision. After careful review, we found your submission, Finocchiaro: Arguments About Arguments, to meet or exceed our expectations. We are excited to publish your piece in Journal of Public Knowledge and we thank you for choosing our journal as a venue for your work.</p><p>Your submission is now forthcoming in a future issue of Journal of Public Knowledge and you are welcome to include it in your list of publications. We recognize the hard work that goes into every successful submission and we want to congratulate you on reaching this stage.</p><p>Your submission will now undergo copy editing and formatting to prepare it for publication.</p><p>You will shortly receive further instructions.</p><p>If you have any questions, please contact me from your <a href=\"http://localhost/index.php/publicknowledge/en/dashboard/mySubmissions?workflowSubmissionId=19\">submission dashboard</a>.</p><p>Kind regards,</p><p>Daniel Barnes</p>'),
(162,1048585,20,NULL,'2025-08-02 06:04:52',805306370,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Daniel Barnes\" <dbarnes@mailinator.com>','','','You have been assigned as an editor on a submission to Journal of Public Knowledge','<p>Dear Daniel Barnes,</p><p>The following submission has been assigned to you to see through the editorial process.</p><p><a href=\"http://localhost/index.php/publicknowledge/en/dashboard/editorial?workflowSubmissionId=20\">Transformative Impact of AI Tools on Modern Education: Opportunities, Challenges, and Future Directions</a><br />Zayan Zedd, Nargis Parvin</p><p><b>Abstract</b></p><p>The integration of artificial intelligence (AI) tools into educational systems is reshaping pedagogical practices, offering unprecedented opportunities for personalized learning, administrative efficiency, and scalable access to quality education. This study examines the multifaceted impact of AI technologies—such as adaptive learning platforms, automated grading systems, and natural language processing (NLP)-driven tutoring tools—on students, educators, and institutions. By analyzing current applications and case studies, we highlight AI’s capacity to tailor instruction to individual learner needs, reduce educators’ administrative burdens, and provide real-time feedback. Emerging evidence suggests that AI-enhanced tools like virtual tutors and chatbots can bridge gaps in resource-limited settings, fostering inclusivity and engagement.</p><p>If you find the submission to be relevant for Journal of Public Knowledge, please forward the submission to the review stage by selecting \"Send to Review\" and then assign reviewers by clicking \"Add Reviewer\".</p><p>If the submission is not appropriate for this journal, please decline the submission.</p><p>Thank you in advance.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Journal of Public Knowledge</a>.</p>'),
(163,1048585,20,NULL,'2025-08-02 06:04:52',805306370,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"David Buskins\" <dbuskins@mailinator.com>','','','You have been assigned as an editor on a submission to Journal of Public Knowledge','<p>Dear David Buskins,</p><p>The following submission has been assigned to you to see through the editorial process.</p><p><a href=\"http://localhost/index.php/publicknowledge/en/dashboard/editorial?workflowSubmissionId=20\">Transformative Impact of AI Tools on Modern Education: Opportunities, Challenges, and Future Directions</a><br />Zayan Zedd, Nargis Parvin</p><p><b>Abstract</b></p><p>The integration of artificial intelligence (AI) tools into educational systems is reshaping pedagogical practices, offering unprecedented opportunities for personalized learning, administrative efficiency, and scalable access to quality education. This study examines the multifaceted impact of AI technologies—such as adaptive learning platforms, automated grading systems, and natural language processing (NLP)-driven tutoring tools—on students, educators, and institutions. By analyzing current applications and case studies, we highlight AI’s capacity to tailor instruction to individual learner needs, reduce educators’ administrative burdens, and provide real-time feedback. Emerging evidence suggests that AI-enhanced tools like virtual tutors and chatbots can bridge gaps in resource-limited settings, fostering inclusivity and engagement.</p><p>If you find the submission to be relevant for Journal of Public Knowledge, please forward the submission to the review stage by selecting \"Send to Review\" and then assign reviewers by clicking \"Add Reviewer\".</p><p>If the submission is not appropriate for this journal, please decline the submission.</p><p>Thank you in advance.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Journal of Public Knowledge</a>.</p>'),
(164,1048585,20,NULL,'2025-08-02 06:04:52',805306370,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Stephanie Berardo\" <sberardo@mailinator.com>','','','You have been assigned as an editor on a submission to Journal of Public Knowledge','<p>Dear Stephanie Berardo,</p><p>The following submission has been assigned to you to see through the editorial process.</p><p><a href=\"http://localhost/index.php/publicknowledge/en/dashboard/editorial?workflowSubmissionId=20\">Transformative Impact of AI Tools on Modern Education: Opportunities, Challenges, and Future Directions</a><br />Zayan Zedd, Nargis Parvin</p><p><b>Abstract</b></p><p>The integration of artificial intelligence (AI) tools into educational systems is reshaping pedagogical practices, offering unprecedented opportunities for personalized learning, administrative efficiency, and scalable access to quality education. This study examines the multifaceted impact of AI technologies—such as adaptive learning platforms, automated grading systems, and natural language processing (NLP)-driven tutoring tools—on students, educators, and institutions. By analyzing current applications and case studies, we highlight AI’s capacity to tailor instruction to individual learner needs, reduce educators’ administrative burdens, and provide real-time feedback. Emerging evidence suggests that AI-enhanced tools like virtual tutors and chatbots can bridge gaps in resource-limited settings, fostering inclusivity and engagement.</p><p>If you find the submission to be relevant for Journal of Public Knowledge, please forward the submission to the review stage by selecting \"Send to Review\" and then assign reviewers by clicking \"Add Reviewer\".</p><p>If the submission is not appropriate for this journal, please decline the submission.</p><p>Thank you in advance.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Journal of Public Knowledge</a>.</p>'),
(165,1048585,20,NULL,'2025-08-02 06:04:52',536870914,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Zayan Zedd\" <zzedd@mailinator.com>','','','Thank you for your submission to Journal of Public Knowledge','<p>Dear Zayan Zedd,</p><p>Thank you for your submission to Journal of Public Knowledge. We have received your submission, \"Transformative Impact of AI Tools on Modern Education: Opportunities, Challenges, and Future Directions\", and a member of our editorial team will see it soon. You will be sent an email when an initial decision is made, and we may contact you for further information.</p><p>You can view your submission and track its progress through the editorial process at the following location:</p><p>Submission URL: http://localhost/index.php/publicknowledge/en/dashboard/mySubmissions?workflowSubmissionId=20</p><p>If you have been logged out, you can login again with the username zzedd.</p><p>If you have any questions, please contact me from your <a href=\"http://localhost/index.php/publicknowledge/en/dashboard/mySubmissions?workflowSubmissionId=20\">submission dashboard</a>.</p><p>Thank you for considering Journal of Public Knowledge as a venue for your work.</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Journal of Public Knowledge</a>.</p>'),
(166,1048585,20,NULL,'2025-08-02 06:04:52',536870914,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Nargis Parvin\" <nparvin@mailinator.com>','','','Submission confirmation','<p>Dear Nargis Parvin,</p><p>You have been named as a co-author on a submission to Journal of Public Knowledge. The submitter, Zayan Zedd, provided the following details:</p><p>\"Transformative Impact of AI Tools on Modern Education: Opportunities, Challenges, and Future Directions\"<br></p><p>If any of these details are incorrect, or you do not wish to be named on this submission, please contact me.</p><p>Thank you for considering Journal of Public Knowledge as a venue for your work.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Journal of Public Knowledge</a>.</p>'),
(167,1048585,20,3,'2025-08-02 06:05:29',805306369,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Zayan Zedd\" <zzedd@mailinator.com>','','','Your submission has been sent for review','<p>Dear Zayan Zedd,</p><p>I am pleased to inform you that an editor has reviewed your submission, \"Transformative Impact of AI Tools on Modern Education: Opportunities, Challenges, and Future Directions\", and has decided to send it for peer review. An editor will identify qualified reviewers who will provide feedback on your submission.</p><p>This journal conducts double-anonymous peer review. The reviewers will not see any identifying information about you or your co-authors. Similarly, you will not know who reviewed your submission, and you will not hear from the reviewers directly. You will hear from us with feedback from the reviewers and information about the next steps.</p><p>Please note that sending the submission to peer review does not guarantee that it will be published. We will consider the reviewers\' recommendations before deciding to accept the submission for publication. You may be asked to make revisions and respond to the reviewers\' comments before a final decision is made.</p><p>If you have any questions, please contact me from your submission dashboard.</p><p><p>Daniel Barnes</p></p>'),
(168,1048585,20,3,'2025-08-02 06:05:42',1073741833,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Jhon Doe\" <jdoe@mailinator.com>','','','Invitation to review','<p>Dear Jhon Doe,</p>\r\n<p>I believe that you would serve as an excellent reviewer for a submission to Journal of Public Knowledge. The submission\'s title and abstract are below, and I hope that you will consider undertaking this important task for us.</p>\r\n<p>If you are able to review this submission, your review is due by 2025-08-30. You can view the submission, upload review files, and submit your review by logging into the journal site and following the steps at the link below.</p>\r\n<p><a href=\"http://localhost/index.php/publicknowledge/en/reviewer/submission?submissionId=20\">Transformative Impact of AI Tools on Modern Education: Opportunities, Challenges, and Future Directions</a></p>\r\n<p><strong>Abstract</strong></p>\r\n<p>The integration of artificial intelligence (AI) tools into educational systems is reshaping pedagogical practices, offering unprecedented opportunities for personalized learning, administrative efficiency, and scalable access to quality education. This study examines the multifaceted impact of AI technologies—such as adaptive learning platforms, automated grading systems, and natural language processing (NLP)-driven tutoring tools—on students, educators, and institutions. By analyzing current applications and case studies, we highlight AI’s capacity to tailor instruction to individual learner needs, reduce educators’ administrative burdens, and provide real-time feedback. Emerging evidence suggests that AI-enhanced tools like virtual tutors and chatbots can bridge gaps in resource-limited settings, fostering inclusivity and engagement.</p>\r\n<p>Please <a href=\"http://localhost/index.php/publicknowledge/en/reviewer/submission?submissionId=20\">accept or decline</a> the review by <strong>2025-08-30</strong>.</p>\r\n<p>You may contact me with any questions about the submission or the review process.</p>\r\n<p>Thank you for considering this request. Your help is much appreciated.</p>\r\n<p>Kind regards,</p>\r\n<p>Daniel Barnes</p>'),
(169,1048585,20,3,'2025-08-02 06:05:54',1073741833,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Lisset Von\" <lvon@mailinator.com>','','','Invitation to review','<p>Dear Lisset Von,</p>\r\n<p>I believe that you would serve as an excellent reviewer for a submission to Journal of Public Knowledge. The submission\'s title and abstract are below, and I hope that you will consider undertaking this important task for us.</p>\r\n<p>If you are able to review this submission, your review is due by 2025-08-30. You can view the submission, upload review files, and submit your review by logging into the journal site and following the steps at the link below.</p>\r\n<p><a href=\"http://localhost/index.php/publicknowledge/en/reviewer/submission?submissionId=20\">Transformative Impact of AI Tools on Modern Education: Opportunities, Challenges, and Future Directions</a></p>\r\n<p><strong>Abstract</strong></p>\r\n<p>The integration of artificial intelligence (AI) tools into educational systems is reshaping pedagogical practices, offering unprecedented opportunities for personalized learning, administrative efficiency, and scalable access to quality education. This study examines the multifaceted impact of AI technologies—such as adaptive learning platforms, automated grading systems, and natural language processing (NLP)-driven tutoring tools—on students, educators, and institutions. By analyzing current applications and case studies, we highlight AI’s capacity to tailor instruction to individual learner needs, reduce educators’ administrative burdens, and provide real-time feedback. Emerging evidence suggests that AI-enhanced tools like virtual tutors and chatbots can bridge gaps in resource-limited settings, fostering inclusivity and engagement.</p>\r\n<p>Please <a href=\"http://localhost/index.php/publicknowledge/en/reviewer/submission?submissionId=20\">accept or decline</a> the review by <strong>2025-08-30</strong>.</p>\r\n<p>You may contact me with any questions about the submission or the review process.</p>\r\n<p>Thank you for considering this request. Your help is much appreciated.</p>\r\n<p>Kind regards,</p>\r\n<p>Daniel Barnes</p>'),
(170,1048585,20,3,'2025-08-02 06:06:06',1073741833,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Julie Janssen\" <jjanssen@mailinator.com>','','','Invitation to review','<p>Dear Julie Janssen,</p>\r\n<p>I believe that you would serve as an excellent reviewer for a submission to Journal of Public Knowledge. The submission\'s title and abstract are below, and I hope that you will consider undertaking this important task for us.</p>\r\n<p>If you are able to review this submission, your review is due by 2025-08-30. You can view the submission, upload review files, and submit your review by logging into the journal site and following the steps at the link below.</p>\r\n<p><a href=\"http://localhost/index.php/publicknowledge/en/reviewer/submission?submissionId=20\">Transformative Impact of AI Tools on Modern Education: Opportunities, Challenges, and Future Directions</a></p>\r\n<p><strong>Abstract</strong></p>\r\n<p>The integration of artificial intelligence (AI) tools into educational systems is reshaping pedagogical practices, offering unprecedented opportunities for personalized learning, administrative efficiency, and scalable access to quality education. This study examines the multifaceted impact of AI technologies—such as adaptive learning platforms, automated grading systems, and natural language processing (NLP)-driven tutoring tools—on students, educators, and institutions. By analyzing current applications and case studies, we highlight AI’s capacity to tailor instruction to individual learner needs, reduce educators’ administrative burdens, and provide real-time feedback. Emerging evidence suggests that AI-enhanced tools like virtual tutors and chatbots can bridge gaps in resource-limited settings, fostering inclusivity and engagement.</p>\r\n<p>Please <a href=\"http://localhost/index.php/publicknowledge/en/reviewer/submission?submissionId=20\">accept or decline</a> the review by <strong>2025-08-30</strong>.</p>\r\n<p>You may contact me with any questions about the submission or the review process.</p>\r\n<p>Thank you for considering this request. Your help is much appreciated.</p>\r\n<p>Kind regards,</p>\r\n<p>Daniel Barnes</p>'),
(171,1048585,20,3,'2025-08-02 06:06:20',1073741833,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Paul Hudson\" <phudson@mailinator.com>','','','Invitation to review','<p>Dear Paul Hudson,</p>\r\n<p>I believe that you would serve as an excellent reviewer for a submission to Journal of Public Knowledge. The submission\'s title and abstract are below, and I hope that you will consider undertaking this important task for us.</p>\r\n<p>If you are able to review this submission, your review is due by 2025-08-30. You can view the submission, upload review files, and submit your review by logging into the journal site and following the steps at the link below.</p>\r\n<p><a href=\"http://localhost/index.php/publicknowledge/en/reviewer/submission?submissionId=20\">Transformative Impact of AI Tools on Modern Education: Opportunities, Challenges, and Future Directions</a></p>\r\n<p><strong>Abstract</strong></p>\r\n<p>The integration of artificial intelligence (AI) tools into educational systems is reshaping pedagogical practices, offering unprecedented opportunities for personalized learning, administrative efficiency, and scalable access to quality education. This study examines the multifaceted impact of AI technologies—such as adaptive learning platforms, automated grading systems, and natural language processing (NLP)-driven tutoring tools—on students, educators, and institutions. By analyzing current applications and case studies, we highlight AI’s capacity to tailor instruction to individual learner needs, reduce educators’ administrative burdens, and provide real-time feedback. Emerging evidence suggests that AI-enhanced tools like virtual tutors and chatbots can bridge gaps in resource-limited settings, fostering inclusivity and engagement.</p>\r\n<p>Please <a href=\"http://localhost/index.php/publicknowledge/en/reviewer/submission?submissionId=20\">accept or decline</a> the review by <strong>2025-08-30</strong>.</p>\r\n<p>You may contact me with any questions about the submission or the review process.</p>\r\n<p>Thank you for considering this request. Your help is much appreciated.</p>\r\n<p>Kind regards,</p>\r\n<p>Daniel Barnes</p>'),
(172,1048585,20,3,'2025-08-02 06:06:31',1073741833,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Sabine Kumar\" <skumar@mailinator.com>','','','Invitation to review','<p>Dear Sabine Kumar,</p>\r\n<p>I believe that you would serve as an excellent reviewer for a submission to Journal of Public Knowledge. The submission\'s title and abstract are below, and I hope that you will consider undertaking this important task for us.</p>\r\n<p>If you are able to review this submission, your review is due by 2025-08-30. You can view the submission, upload review files, and submit your review by logging into the journal site and following the steps at the link below.</p>\r\n<p><a href=\"http://localhost/index.php/publicknowledge/en/reviewer/submission?submissionId=20\">Transformative Impact of AI Tools on Modern Education: Opportunities, Challenges, and Future Directions</a></p>\r\n<p><strong>Abstract</strong></p>\r\n<p>The integration of artificial intelligence (AI) tools into educational systems is reshaping pedagogical practices, offering unprecedented opportunities for personalized learning, administrative efficiency, and scalable access to quality education. This study examines the multifaceted impact of AI technologies—such as adaptive learning platforms, automated grading systems, and natural language processing (NLP)-driven tutoring tools—on students, educators, and institutions. By analyzing current applications and case studies, we highlight AI’s capacity to tailor instruction to individual learner needs, reduce educators’ administrative burdens, and provide real-time feedback. Emerging evidence suggests that AI-enhanced tools like virtual tutors and chatbots can bridge gaps in resource-limited settings, fostering inclusivity and engagement.</p>\r\n<p>Please <a href=\"http://localhost/index.php/publicknowledge/en/reviewer/submission?submissionId=20\">accept or decline</a> the review by <strong>2025-08-30</strong>.</p>\r\n<p>You may contact me with any questions about the submission or the review process.</p>\r\n<p>Thank you for considering this request. Your help is much appreciated.</p>\r\n<p>Kind regards,</p>\r\n<p>Daniel Barnes</p>'),
(173,1048585,20,3,'2025-08-02 06:06:44',1073741833,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Stephen Hellier\" <shellier@mailinator.com>','','','Invitation to review','<p>Dear Stephen Hellier,</p>\r\n<p>I believe that you would serve as an excellent reviewer for a submission to Journal of Public Knowledge. The submission\'s title and abstract are below, and I hope that you will consider undertaking this important task for us.</p>\r\n<p>If you are able to review this submission, your review is due by 2025-08-30. You can view the submission, upload review files, and submit your review by logging into the journal site and following the steps at the link below.</p>\r\n<p><a href=\"http://localhost/index.php/publicknowledge/en/reviewer/submission?submissionId=20\">Transformative Impact of AI Tools on Modern Education: Opportunities, Challenges, and Future Directions</a></p>\r\n<p><strong>Abstract</strong></p>\r\n<p>The integration of artificial intelligence (AI) tools into educational systems is reshaping pedagogical practices, offering unprecedented opportunities for personalized learning, administrative efficiency, and scalable access to quality education. This study examines the multifaceted impact of AI technologies—such as adaptive learning platforms, automated grading systems, and natural language processing (NLP)-driven tutoring tools—on students, educators, and institutions. By analyzing current applications and case studies, we highlight AI’s capacity to tailor instruction to individual learner needs, reduce educators’ administrative burdens, and provide real-time feedback. Emerging evidence suggests that AI-enhanced tools like virtual tutors and chatbots can bridge gaps in resource-limited settings, fostering inclusivity and engagement.</p>\r\n<p>Please <a href=\"http://localhost/index.php/publicknowledge/en/reviewer/submission?submissionId=20\">accept or decline</a> the review by <strong>2025-08-30</strong>.</p>\r\n<p>You may contact me with any questions about the submission or the review process.</p>\r\n<p>Thank you for considering this request. Your help is much appreciated.</p>\r\n<p>Kind regards,</p>\r\n<p>Daniel Barnes</p>'),
(174,1048585,20,3,'2025-08-02 06:06:58',1073741833,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Rajek Sharif\" <rsharif@mailinator.com>','','','Invitation to review','<p>Dear Rajek Sharif,</p>\r\n<p>I believe that you would serve as an excellent reviewer for a submission to Journal of Public Knowledge. The submission\'s title and abstract are below, and I hope that you will consider undertaking this important task for us.</p>\r\n<p>If you are able to review this submission, your review is due by 2025-08-30. You can view the submission, upload review files, and submit your review by logging into the journal site and following the steps at the link below.</p>\r\n<p><a href=\"http://localhost/index.php/publicknowledge/en/reviewer/submission?submissionId=20\">Transformative Impact of AI Tools on Modern Education: Opportunities, Challenges, and Future Directions</a></p>\r\n<p><strong>Abstract</strong></p>\r\n<p>The integration of artificial intelligence (AI) tools into educational systems is reshaping pedagogical practices, offering unprecedented opportunities for personalized learning, administrative efficiency, and scalable access to quality education. This study examines the multifaceted impact of AI technologies—such as adaptive learning platforms, automated grading systems, and natural language processing (NLP)-driven tutoring tools—on students, educators, and institutions. By analyzing current applications and case studies, we highlight AI’s capacity to tailor instruction to individual learner needs, reduce educators’ administrative burdens, and provide real-time feedback. Emerging evidence suggests that AI-enhanced tools like virtual tutors and chatbots can bridge gaps in resource-limited settings, fostering inclusivity and engagement.</p>\r\n<p>Please <a href=\"http://localhost/index.php/publicknowledge/en/reviewer/submission?submissionId=20\">accept or decline</a> the review by <strong>2025-08-30</strong>.</p>\r\n<p>You may contact me with any questions about the submission or the review process.</p>\r\n<p>Thank you for considering this request. Your help is much appreciated.</p>\r\n<p>Kind regards,</p>\r\n<p>Daniel Barnes</p>'),
(175,1048585,20,3,'2025-08-02 06:07:10',1073741833,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Catherine Turner\" <cturner@mailinator.com>','','','Invitation to review','<p>Dear Catherine Turner,</p>\r\n<p>I believe that you would serve as an excellent reviewer for a submission to Journal of Public Knowledge. The submission\'s title and abstract are below, and I hope that you will consider undertaking this important task for us.</p>\r\n<p>If you are able to review this submission, your review is due by 2025-08-30. You can view the submission, upload review files, and submit your review by logging into the journal site and following the steps at the link below.</p>\r\n<p><a href=\"http://localhost/index.php/publicknowledge/en/reviewer/submission?submissionId=20\">Transformative Impact of AI Tools on Modern Education: Opportunities, Challenges, and Future Directions</a></p>\r\n<p><strong>Abstract</strong></p>\r\n<p>The integration of artificial intelligence (AI) tools into educational systems is reshaping pedagogical practices, offering unprecedented opportunities for personalized learning, administrative efficiency, and scalable access to quality education. This study examines the multifaceted impact of AI technologies—such as adaptive learning platforms, automated grading systems, and natural language processing (NLP)-driven tutoring tools—on students, educators, and institutions. By analyzing current applications and case studies, we highlight AI’s capacity to tailor instruction to individual learner needs, reduce educators’ administrative burdens, and provide real-time feedback. Emerging evidence suggests that AI-enhanced tools like virtual tutors and chatbots can bridge gaps in resource-limited settings, fostering inclusivity and engagement.</p>\r\n<p>Please <a href=\"http://localhost/index.php/publicknowledge/en/reviewer/submission?submissionId=20\">accept or decline</a> the review by <strong>2025-08-30</strong>.</p>\r\n<p>You may contact me with any questions about the submission or the review process.</p>\r\n<p>Thank you for considering this request. Your help is much appreciated.</p>\r\n<p>Kind regards,</p>\r\n<p>Daniel Barnes</p>'),
(176,1048585,20,3,'2025-08-02 06:07:23',1073741833,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Aisla McCrae\" <amccrae@mailinator.com>','','','Invitation to review','<p>Dear Aisla McCrae,</p>\r\n<p>I believe that you would serve as an excellent reviewer for a submission to Journal of Public Knowledge. The submission\'s title and abstract are below, and I hope that you will consider undertaking this important task for us.</p>\r\n<p>If you are able to review this submission, your review is due by 2025-08-30. You can view the submission, upload review files, and submit your review by logging into the journal site and following the steps at the link below.</p>\r\n<p><a href=\"http://localhost/index.php/publicknowledge/en/reviewer/submission?submissionId=20\">Transformative Impact of AI Tools on Modern Education: Opportunities, Challenges, and Future Directions</a></p>\r\n<p><strong>Abstract</strong></p>\r\n<p>The integration of artificial intelligence (AI) tools into educational systems is reshaping pedagogical practices, offering unprecedented opportunities for personalized learning, administrative efficiency, and scalable access to quality education. This study examines the multifaceted impact of AI technologies—such as adaptive learning platforms, automated grading systems, and natural language processing (NLP)-driven tutoring tools—on students, educators, and institutions. By analyzing current applications and case studies, we highlight AI’s capacity to tailor instruction to individual learner needs, reduce educators’ administrative burdens, and provide real-time feedback. Emerging evidence suggests that AI-enhanced tools like virtual tutors and chatbots can bridge gaps in resource-limited settings, fostering inclusivity and engagement.</p>\r\n<p>Please <a href=\"http://localhost/index.php/publicknowledge/en/reviewer/submission?submissionId=20\">accept or decline</a> the review by <strong>2025-08-30</strong>.</p>\r\n<p>You may contact me with any questions about the submission or the review process.</p>\r\n<p>Thank you for considering this request. Your help is much appreciated.</p>\r\n<p>Kind regards,</p>\r\n<p>Daniel Barnes</p>');
/*!40000 ALTER TABLE `email_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `email_log_users`
--

DROP TABLE IF EXISTS `email_log_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
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
) ENGINE=InnoDB AUTO_INCREMENT=184 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='A record of users associated with an email log entry.';
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
(169,161,35),
(170,162,3),
(171,163,4),
(172,164,5),
(173,165,36),
(174,167,36),
(175,168,37),
(176,169,38),
(177,170,7),
(178,171,8),
(179,172,16),
(180,173,14),
(181,174,39),
(182,175,15),
(183,176,9);
/*!40000 ALTER TABLE `email_log_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `email_templates`
--

DROP TABLE IF EXISTS `email_templates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
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
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `email_templates_default_data` (
  `email_templates_default_data_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `email_key` varchar(255) NOT NULL COMMENT 'Unique identifier for this email.',
  `locale` varchar(28) NOT NULL DEFAULT 'en',
  `name` varchar(255) NOT NULL,
  `subject` varchar(255) NOT NULL,
  `body` text DEFAULT NULL,
  PRIMARY KEY (`email_templates_default_data_id`),
  UNIQUE KEY `email_templates_default_data_unique` (`email_key`,`locale`)
) ENGINE=InnoDB AUTO_INCREMENT=293 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='Default email templates created for every installed locale.';
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
(13,'SUBMISSION_ACK','en','Submission Confirmation','Thank you for your submission to {$journalName}','<p>Dear {$recipientName},</p><p>Thank you for your submission to {$journalName}. We have received your submission, \"{$submissionTitle}\", and a member of our editorial team will see it soon. You will be sent an email when an initial decision is made, and we may contact you for further information.</p><p>You can view your submission and track its progress through the editorial process at the following location:</p><p>Submission URL: {$authorSubmissionUrl}</p><p>If you have been logged out, you can login again with the username {$recipientUsername}.</p><p>If you have any questions, please contact me from your <a href=\"{$authorSubmissionUrl}\">submission dashboard</a>.</p><p>Thank you for considering {$journalName} as a venue for your work.</p>{$journalSignature}'),
(15,'SUBMISSION_ACK_NOT_USER','en','Submission Confirmation (Other Authors)','Submission confirmation','<p>Dear {$recipientName},</p><p>You have been named as a co-author on a submission to {$journalName}. The submitter, {$submitterName}, provided the following details:</p><p>\"{$submissionTitle}\"<br>{$authorsWithAffiliation}</p><p>If any of these details are incorrect, or you do not wish to be named on this submission, please contact me.</p><p>Thank you for considering {$journalName} as a venue for your work.</p><p>Kind regards,</p>{$journalSignature}'),
(17,'EDITOR_ASSIGN','en','Editor Assigned','You have been assigned as an editor on a submission to {$journalName}','<p>Dear {$recipientName},</p><p>The following submission has been assigned to you to see through the editorial process.</p><p><a href=\"{$submissionUrl}\">{$submissionTitle}</a><br />{$authors}</p><p><b>Abstract</b></p>{$submissionAbstract}<p>If you find the submission to be relevant for {$journalName}, please forward the submission to the review stage by selecting \"Send to Review\" and then assign reviewers by clicking \"Add Reviewer\".</p><p>If the submission is not appropriate for this journal, please decline the submission.</p><p>Thank you in advance.</p><p>Kind regards,</p>{$journalSignature}'),
(19,'REVIEW_CANCEL','en','Reviewer Unassign','Request for Review Cancelled','<p>Dear {$recipientName},</p><p>Recently, we asked you to review a submission to {$journalName}. We have decided to cancel the request for you to reivew the submission, {$submissionTitle}.</p><p>We apologize any inconvenience this may cause you and hope that we will be able to call on you to assist with this journal\'s review process in the future.</p><p>If you have any questions, please contact me.</p>{$signature}'),
(21,'REVIEW_REINSTATE','en','Reviewer Reinstate','Can you still review something for {$journalName}?','<p>Dear {$recipientName},</p><p>We recently cancelled our request for you to review a submission, {$submissionTitle}, for {$journalName}. We\'ve reversed that decision and we hope that you are still able to conduct the review.</p><p>If you are able to assist with this submission\'s review, you can <a href=\"{$reviewAssignmentUrl}\">login to the journal</a> to view the submission, upload review files, and submit your review request.</p><p>If you have any questions, please contact me.</p><p>Kind regards,</p>{$signature}'),
(23,'REVIEW_RESEND_REQUEST','en','Resend Review Request to Reviewer','Requesting your review again for {$journalName}','<p>Dear {$recipientName},</p><p>Recently, you declined our request to review a submission, \"{$submissionTitle}\", for {$journalName}. I\'m writing to see if you are able to conduct the review after all.</p><p>We would be grateful if you\'re able to perform this review, but we understand if that is not possible at this time. Either way, please <a href=\"{$reviewAssignmentUrl}\">accept or decline the request</a> by {$responseDueDate}, so that we can find an alternate reviewer.</p><p>If you have any questions, please contact me.</p><p>Kind regards,</p>{$signature}'),
(25,'REVIEW_REQUEST','en','Review Request','Invitation to review','<p>Dear {$recipientName},</p><p>I believe that you would serve as an excellent reviewer for a submission  to {$journalName}. The submission\'s title and abstract are below, and I hope that you will consider undertaking this important task for us.</p><p>If you are able to review this submission, your review is due by {$reviewDueDate}. You can view the submission, upload review files, and submit your review by logging into the journal site and following the steps at the link below.</p><p><a href=\"{$reviewAssignmentUrl}\">{$submissionTitle}</a></p><p><b>Abstract</b></p>{$submissionAbstract}<p>Please <a href=\"{$reviewAssignmentUrl}\">accept or decline</a> the review by <b>{$responseDueDate}</b>.</p><p>You may contact me with any questions about the submission or the review process.</p><p>Thank you for considering this request. Your help is much appreciated.</p><p>Kind regards,</p>{$signature}'),
(27,'REVIEW_REQUEST_SUBSEQUENT','en','Review Request Subsequent','Request to review a revised submission','<p>Dear {$recipientName},</p><p>Thank you for your review of <a href=\"{$reviewAssignmentUrl}\">{$submissionTitle}</a>. The authors have considered the reviewers\' feedback and have now submitted a revised version of their work. I\'m writing to ask if you would conduct a second round of peer review for this submission.</p><p>If you are able to review this submission, your review is due by {$reviewDueDate}. You can <a href=\"{$reviewAssignmentUrl}\">follow the review steps</a> to view the submission, upload review files, and submit your review comments.<p><p><a href=\"{$reviewAssignmentUrl}\">{$submissionTitle}</a></p><p><b>Abstract</b></p>{$submissionAbstract}<p>Please <a href=\"{$reviewAssignmentUrl}\">accept or decline</a> the review by <b>{$responseDueDate}</b>.</p><p>Please feel free to contact me with any questions about the submission or the review process.</p><p>Thank you for considering this request. Your help is much appreciated.</p><p>Kind regards,</p>{$signature}'),
(29,'REVIEW_RESPONSE_OVERDUE_AUTO','en','Review Response Overdue (Automated)','Will you be able to review this for us?','<p>Dear {$recipientName},</p><p>This email is an automated reminder from {$journalName} in regards to our request for your review of the submission, \"{$submissionTitle}.\"</p><p>You are receiving this email because we have not yet received a confirmation from you indicating whether or not you are able to undertake the review of this submission.</p><p>Please let us know whether or not you are able to undertake this review by using our submission management software to accept or decline this request.</p><p>If you are able to review this submission, your review is due by {$reviewDueDate}. You can follow the review steps to view the submission, upload review files, and submit your review comments.</p><p><a href=\"{$reviewAssignmentUrl}\">{$submissionTitle}</a></p><p><b>Abstract</b></p>{$submissionAbstract}<p>Please feel free to contact me with any questions about the submission or the review process.</p><p>Thank you for considering this request. Your help is much appreciated.</p><p>Kind regards,</p>{$journalSignature}'),
(31,'REVIEW_CONFIRM','en','Review Confirm','Review accepted: {$reviewerName} accepted review assignment for #{$submissionId} {$authorsShort} — \"{$submissionTitle}\"','<p>Dear {$recipientName},</p><p>{$reviewerName} has accepted the following review:</p><p><a href=\"{$submissionUrl}\">#{$submissionId} {$authorsShort} — \"{$submissionTitle}\"</a><br /><b>Type:</b> {$reviewMethod}</p><p><b>Review Due:</b> {$reviewDueDate}</p><p>Login to <a href=\"{$submissionUrl}\">view all reviewer assignments</a> for this submission.</p><br><br>—<br>This is an automated message from <a href=\"{$journalUrl}\">{$journalName}</a>.'),
(33,'REVIEW_DECLINE','en','Review Decline','Unable to Review','Editors:<br />\n<br />\nI am afraid that at this time I am unable to review the submission, &quot;{$submissionTitle},&quot; for {$journalName}. Thank you for thinking of me, and another time feel free to call on me.<br />\n<br />\n{$senderName}'),
(35,'REVIEW_ACK','en','Review Acknowledgement','Thank you for your review','<p>Dear {$recipientName},</p>\n<p>Thank you for completing your review of the submission, \"{$submissionTitle}\", for {$journalName}. We appreciate your time and expertise in contributing to the quality of the work that we publish.</p>\n<p>It has been a pleasure to work with you as a reviewer for {$journalName}, and we hope to have the opportunity to work with you again in the future.</p>\n<p>Kind regards,</p>\n<p>{$signature}</p>'),
(37,'REVIEW_REMIND','en','Review Reminder','A reminder to please complete your review','<p>Dear {$recipientName},</p><p>Just a gentle reminder of our request for your review of the submission, \"{$submissionTitle},\" for {$journalName}. We were expecting to have this review by {$reviewDueDate} and we would be pleased to receive it as soon as you are able to prepare it.</p><p>You can <a href=\"{$reviewAssignmentUrl}\">login to the journal</a> and follow the review steps to view the submission, upload review files, and submit your review comments.</p><p>If you need an extension of the deadline, please contact me. I look forward to hearing from you.</p><p>Thank you in advance and kind regards,</p>{$signature}'),
(39,'REVIEW_REMIND_AUTO','en','Review Reminder (Automated)','A reminder to please complete your review','<p>Dear {$recipientName}:</p><p>This email is an automated reminder from {$journalName} in regards to our request for your review of the submission, \"{$submissionTitle}.\"</p><p>We were expecting to have this review by {$reviewDueDate} and we would be pleased to receive it as soon as you are able to prepare it.</p><p>Please <a href=\"{$reviewAssignmentUrl}\">login to the journal</a> and follow the review steps to view the submission, upload review files, and submit your review comments.</p><p>If you need an extension of the deadline, please contact me. I look forward to hearing from you.</p><p>Thank you in advance and kind regards,</p>{$journalSignature}'),
(41,'REVIEW_COMPLETE','en','Review Completed','Review complete: {$reviewerName} recommends {$reviewRecommendation} for #{$submissionId} {$authorsShort} — \"{$submissionTitle}\"','<p>Dear {$recipientName},</p><p>{$reviewerName} completed the following review:</p><p><a href=\"{$submissionUrl}\">#{$submissionId} {$authorsShort} — \"{$submissionTitle}\"</a><br /><b>Recommendation:</b> {$reviewRecommendation}<br /><b>Type:</b> {$reviewMethod}</p><p>Login to <a href=\"{$submissionUrl}\">view all files and comments</a> provided by this reviewer.</p>'),
(43,'REVIEW_EDIT','en','Review Edited','Your review assignment has been changed for {$journalName}','<p>Dear {$recipientName},</p><p>An editor has made changes to your review assignment for {$journalName}. Please review the details below and let us know if you have any questions.</p><p><a href=\"{$reviewAssignmentUrl}\">\"{$submissionTitle}\"</a><br /><b>Type:</b> {$reviewMethod}<br /><b>Accept or Decline By:</b> {$responseDueDate}<br /><b>Submit Review By:</b> {$reviewDueDate}</p><p>You can login to <a href=\"{$reviewAssignmentUrl}\">complete this review</a> at any time.</p>'),
(45,'EDITOR_DECISION_ACCEPT','en','Submission Accepted','Your submission has been accepted to {$journalName}','<p>Dear {$recipientName},</p><p>I am pleased to inform you that we have decided to accept your submission without further revision. After careful review, we found your submission, {$submissionTitle}, to meet or exceed our expectations. We are excited to publish your piece in {$journalName} and we thank you for choosing our journal as a venue for your work.</p><p>Your submission is now forthcoming in a future issue of {$journalName} and you are welcome to include it in your list of publications. We recognize the hard work that goes into every successful submission and we want to congratulate you on reaching this stage.</p><p>Your submission will now undergo copy editing and formatting to prepare it for publication.</p><p>You will shortly receive further instructions.</p><p>If you have any questions, please contact me from your <a href=\"{$authorSubmissionUrl}\">submission dashboard</a>.</p><p>Kind regards,</p>{$signature}'),
(47,'EDITOR_DECISION_SEND_TO_EXTERNAL','en','Sent to Review','Your submission has been sent for review','<p>Dear {$recipientName},</p><p>I am pleased to inform you that an editor has reviewed your submission, \"{$submissionTitle}\", and has decided to send it for peer review. An editor will identify qualified reviewers who will provide feedback on your submission.</p><p>{$reviewTypeDescription} You will hear from us with feedback from the reviewers and information about the next steps.</p><p>Please note that sending the submission to peer review does not guarantee that it will be published. We will consider the reviewers\' recommendations before deciding to accept the submission for publication. You may be asked to make revisions and respond to the reviewers\' comments before a final decision is made.</p><p>If you have any questions, please contact me from your submission dashboard.</p><p>{$signature}</p>'),
(49,'EDITOR_DECISION_SEND_TO_PRODUCTION','en','Sent to Production','Next steps for publishing your submission','<p>Dear {$recipientName},</p><p>I am writing from {$journalName} to let you know that the editing of your submission, \"{$submissionTitle}\", is complete. Your submission will now advance to the production stage, where the final galleys will be prepared for publication. We will contact you if we need any further assistance.</p><p>If you have any questions, please contact me from your <a href=\"{$authorSubmissionUrl}\">submission dashboard</a>.</p><p>Kind regards,</p>{$signature}'),
(51,'EDITOR_DECISION_REVISIONS','en','Revisions Requested','Your submission has been reviewed and we encourage you to submit revisions','<p>Dear {$recipientName},</p><p>Your submission \"{$submissionTitle}\" has been reviewed and we would like to encourage you to submit revisions that address the reviewers\' comments. An editor will review these revisions and if they address the concerns adequately, your submission may be accepted for publication.</p><p>The reviewers\' comments are included at the bottom of this email. Please respond to each point in the reviewers\' comments and identify what changes you have made. If you find any of the reviewer\'s comments to be unjustified or inappropriate, please explain your perspective.</p><p>When you have completed your revisions, you can upload revised documents along with your response to the reviewers\' comments at your <a href=\"{$authorSubmissionUrl}\">submission dashboard</a>. If you have been logged out, you can login again with the username {$recipientUsername}.</p><p>If you have any questions, please contact me from your <a href=\"{$authorSubmissionUrl}\">submission dashboard</a>.</p><p>We look forward to receiving your revised submission.</p><p>Kind regards,</p>{$signature}<hr><p>The following comments were received from reviewers.</p>{$allReviewerComments}'),
(53,'EDITOR_DECISION_RESUBMIT','en','Resubmit for Review','Your submission has been reviewed - please revise and resubmit','<p>Dear {$recipientName},</p><p>After reviewing your submission, \"{$submissionTitle}\", the reviewers have recommended that your submission cannot be accepted for publication in its current form. However, we would like to encourage you to submit a revised version that addresses the reviewers\' comments. Your revisions will be reviewed by an editor and may be sent out for another round of peer review.</p><p>Please note that resubmitting your work does not guarantee that it will be accepted.</p><p>The reviewers\' comments are included at the bottom of this email. Please respond to each point and identify what changes you have made. If you find any of the reviewer\'s comments inappropriate, please explain your perspective. If you have questions about the recommendations in your review, please include these in your response.</p><p>When you have completed your revisions, you can upload revised documents along with your response to the reviewers\' comments <a href=\"{$authorSubmissionUrl}\">at your submission dashboard</a>. If you have been logged out, you can login again with the username {$recipientUsername}.</p><p>If you have any questions, please contact me from your <a href=\"{$authorSubmissionUrl}\">submission dashboard</a>.</p><p>We look forward to receiving your revised submission.</p><p>Kind regards,</p>{$signature}<hr><p>The following comments were received from reviewers.</p>{$allReviewerComments}'),
(55,'EDITOR_DECISION_DECLINE','en','Submission Declined','Your submission has been declined','<p>Dear {$recipientName},</p><p>While we appreciate receiving your submission, we are unable to accept \"{$submissionTitle}\" for publication on the basis of the comments from reviewers.</p><p>The reviewers\' comments are included at the bottom of this email.</p><p>Thank you for submitting to {$journalName}. Although it is disappointing to have a submission declined, I hope you find the reviewers\' comments to be constructive and helpful.</p><p>You are now free to submit the work elsewhere if you choose to do so.</p><p>Kind regards,</p>{$signature}<hr><p>The following comments were received from reviewers.</p>{$allReviewerComments}'),
(57,'EDITOR_DECISION_INITIAL_DECLINE','en','Submission Declined (Pre-Review)','Your submission has been declined','<p>Dear {$recipientName},</p><p>I’m sorry to inform you that, after reviewing your submission, \"{$submissionTitle}\", the editor has found that it does not meet our requirements for publication in {$journalName}.</p><p>I wish you success if you consider submitting your work elsewhere.</p><p>Kind regards,</p>{$signature}'),
(59,'EDITOR_RECOMMENDATION','en','Recommendation Made','Editor Recommendation','<p>Dear {$recipientName},</p><p>After considering the reviewers\' feedback, I would like to make the following recommendation regarding the submission \"{$submissionTitle}\".</p><p>My recommendation is: {$recommendation}.</p><p>Please visit the submission\'s <a href=\"{$submissionUrl}\">editorial workflow</a> to act on this recommendation.</p><p>Please feel free to contact me with any questions.</p><p>Kind regards,</p><p>{$senderName}</p>'),
(61,'EDITOR_DECISION_NOTIFY_OTHER_AUTHORS','en','Notify Other Authors','An update regarding your submission','<p>The following email was sent to {$submittingAuthorName} from {$journalName} regarding \"{$submissionTitle}\".</p>\n<p>You are receiving a copy of this notification because you are identified as an author of the submission. Any instructions in the message below are intended for the submitting author, {$submittingAuthorName}, and no action is required of you at this time.</p>\n\n{$messageToSubmittingAuthor}'),
(63,'EDITOR_DECISION_NOTIFY_REVIEWERS','en','Notify Reviewers of Decision','Thank you for your review','<p>Dear {$recipientName},</p>\n<p>Thank you for completing your review of the submission, \"{$submissionTitle}\", for {$journalName}. We appreciate your time and expertise in contributing to the quality of the work that we publish. We have shared your comments with the authors, along with our other reviewers\' comments and the editor\'s decision.</p>\n<p>Based on the feedback we received, we have notified the authors of the following:</p>\n<p>{$decisionDescription}</p>\n<p>Your recommendation was considered alongside the recommendations of other reviewers before coming to a decision. Occasionally the editor\'s decision may differ from the recommendation made by one or more reviewers. The editor considers many factors, and does not take these decisions lightly. We are grateful for our reviewers\' expertise and suggestions.</p>\n<p>It has been a pleasure to work with you as a reviewer for {$journalName}, and we hope to have the opportunity to work with you again in the future.</p>\n<p>Kind regards,</p>\n<p>{$signature}</p>'),
(65,'EDITOR_DECISION_NEW_ROUND','en','New Review Round Initiated','Your submission has been sent for another round of review','<p>Dear {$recipientName},</p>\n<p>Your revised submission, \"{$submissionTitle}\", has been sent for a new round of peer review. \nYou will hear from us with feedback from the reviewers and information about the next steps.</p>\n<p>If you have any questions, please contact me from your <a href=\"{$authorSubmissionUrl}\">submission dashboard</a>.</p>\n<p>Kind regards,</p>\n<p>{$signature}</p>\n'),
(67,'EDITOR_DECISION_REVERT_DECLINE','en','Reinstate Declined Submission','We have reversed the decision to decline your submission','<p>Dear {$recipientName},</p>\n<p>The decision to decline your submission, \"{$submissionTitle}\", has been reversed. \nAn editor will complete the round of review and you will be notified when a \ndecision is made.</p>\n<p>Occasionally, a decision to decline a submission will be recorded accidentally in \nour system and must be reverted. I apologize for any confusion this may have caused.</p>\n<p>We will contact you if we need any further assistance.</p>\n<p>If you have any questions, please contact me from your <a href=\"{$authorSubmissionUrl}\">submission dashboard</a>.</p>\n<p>Kind regards,</p>\n<p>{$signature}</p>\n'),
(69,'EDITOR_DECISION_REVERT_INITIAL_DECLINE','en','Reinstate Submission Declined Without Review','We have reversed the decision to decline your submission','<p>Dear {$recipientName},</p>\n<p>The decision to decline your submission, \"{$submissionTitle}\", has been reversed. \nAn editor will look further at your submission before deciding whether to decline \nthe submission or send it for review.</p>\n<p>Occasionally, a decision to decline a submission will be recorded accidentally in \nour system and must be reverted. I apologize for any confusion this may have caused.</p>\n<p>We will contact you if we need any further assistance.</p>\n<p>If you have any questions, please contact me from your <a href=\"{$authorSubmissionUrl}\">submission dashboard</a>.</p>\n<p>Kind regards,</p>\n<p>{$signature}</p>\n'),
(71,'EDITOR_DECISION_SKIP_REVIEW','en','Submission Accepted (Without Review)','Your submission has been sent for copyediting','<p>Dear {$recipientName},</p>\n<p>I am pleased to inform you that we have decided to accept your submission without peer review. We found your submission, {$submissionTitle}, to meet our expectations, and we do not require that work of this type undergo peer review. We are excited to publish your piece in {$journalName} and we thank you for choosing our journal as a venue for your work.</p>\nYour submission is now forthcoming in a future issue of {$journalName} and you are welcome to include it in your list of publications. We recognize the hard work that goes into every successful submission and we want to congratulate you on your efforts.</p>\n<p>Your submission will now undergo copy editing and formatting to prepare it for publication. </p>\n<p>You will shortly receive further instructions.</p>\n<p>If you have any questions, please contact me from your <a href=\"{$authorSubmissionUrl}\">submission dashboard</a>.</p>\n<p>Kind regards,</p>\n<p>{$signature}</p>\n'),
(73,'EDITOR_DECISION_BACK_FROM_PRODUCTION','en','Submission Sent Back to Copyediting','Your submission has been sent back to copyediting','<p>Dear {$recipientName},</p><p>Your submission, \"{$submissionTitle}\", has been sent back to the copyediting stage, where it will undergo further copyediting and formatting to prepare it for publication.</p><p>Occasionally, a submission is sent to the production stage before it is ready for the final galleys to be prepared for publication. Your submission is still forthcoming. I apologize for any confusion.</p><p>If you have any questions, please contact me from your <a href=\"{$authorSubmissionUrl}\">submission dashboard</a>.</p><p>We will contact you if we need any further assistance.</p><p>Kind regards,</p><p>{$signature}</p>'),
(75,'EDITOR_DECISION_BACK_FROM_COPYEDITING','en','Submission Sent Back from Copyediting','Your submission has been sent back to review','<p>Dear {$recipientName},</p><p>Your submission, \"{$submissionTitle}\", has been sent back to the review stage. It will undergo further review before it can be accepted for publication.</p><p>Occasionally, a decision to accept a submission will be recorded accidentally in our system and we must send it back to review. I apologize for any confusion this has caused. We will work to complete any further review quickly so that you have a final decision as soon as possible.</p><p>We will contact you if we need any further assistance.</p><p>If you have any questions, please contact me from your <a href=\"{$authorSubmissionUrl}\">submission dashboard</a>.</p><p>Kind regards,</p><p>{$signature}</p>'),
(77,'EDITOR_DECISION_CANCEL_REVIEW_ROUND','en','Review Round Cancelled','A review round for your submission has been cancelled','<p>Dear {$recipientName},</p><p>We recently opened a new review round for your submission, \"{$submissionTitle}\". We are closing this review round now.</p><p>Occasionally, a decision to open a round of review will be recorded accidentally in our system and we must cancel this review round. I apologize for any confusion this may have caused.</p><p>We will contact you if we need any further assistance.</p><p>If you have any questions, please contact me from your <a href=\"{$authorSubmissionUrl}\">submission dashboard</a>.</p><p>Kind regards,</p><p>{$signature}</p>'),
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
(111,'COPYEDIT_REQUEST','en','Request Copyedit','Submission {$submissionId} is ready to be copyedited for {$contextAcronym}','<p>Dear {$recipientName},</p><p>A new submission is ready to be copyedited:</p><p><a href\"{$submissionUrl}\">{$submissionId} — \"{$submissionTitle}\"</a><br />{$journalName}</p><p>Please follow these steps to complete this task:</p><ol><li>Click on the Submission URL below.</li><li>Open any files available under Draft Files and edit the files. Use the Copyediting Discussions area if you need to contact the editor(s) or author(s).</li><li>Save the copyedited file(s) and upload them to the Copyedited panel.</li><li>Use the Copyediting Discussions to notify the editor(s) that all files have been prepared, and that the Production process may begin.</li></ol><p>If you are unable to undertake this work at this time or have any questions, please contact me. Thank you for your contribution to {$journalName}.</p><p>Kind regards,</p>{$signature}'),
(113,'EDITOR_ASSIGN_SUBMISSION','en','Assign Editor','You have been assigned as an editor on a submission to {$journalName}','<p>Dear {$recipientName},</p><p>The following submission has been assigned to you to see through the editorial process.</p><p><a href=\"{$submissionUrl}\">{$submissionTitle}</a><br />{$authors}</p><p><b>Abstract</b></p>{$submissionAbstract}<p>If you find the submission to be relevant for {$journalName}, please forward the submission to the review stage by selecting \"Send to Review\" and then assign reviewers by clicking \"Add Reviewer\".</p><p>If the submission is not appropriate for this journal, please decline the submission.</p><p>Thank you in advance.</p><p>Kind regards,</p>{$journalSignature}'),
(115,'EDITOR_ASSIGN_REVIEW','en','Assign Editor','You have been assigned as an editor on a submission to {$journalName}','<p>Dear {$recipientName},</p><p>The following submission has been assigned to you to see through the peer review process.</p><p><a href=\"{$submissionUrl}\">{$submissionTitle}</a><br />{$authors}</p><p><b>Abstract</b></p>{$submissionAbstract}<p>Please login to <a href=\"{$submissionUrl}\">view the submission</a> and assign qualified reviewers. You can assign a reviewer by clicking \"Add Reviewer\".</p><p>Thank you in advance.</p><p>Kind regards,</p>{$signature}'),
(117,'EDITOR_ASSIGN_PRODUCTION','en','Assign Editor','You have been assigned as an editor on a submission to {$journalName}','<p>Dear {$recipientName},</p><p>The following submission has been assigned to you to see through the production stage.</p><p><a href=\"{$submissionUrl}\">{$submissionTitle}</a><br />{$authors}</p><p><b>Abstract</b></p>{$submissionAbstract}<p>Please login to <a href=\"{$submissionUrl}\">view the submission</a>. Once production-ready files are available, upload them under the <strong>Publication > Galleys</strong> section. Then schedule the work for publication by clicking the <strong>Schedule for Publication</strong> button.</p><p>Thank you in advance.</p><p>Kind regards,</p>{$signature}'),
(119,'LAYOUT_REQUEST','en','Ready for Production','Submission {$submissionId} is ready for production at {$contextAcronym}','<p>Dear {$recipientName},</p><p>A new submission is ready for layout editing:</p><p><a href=\"{$submissionUrl}\">{$submissionId} — {$submissionTitle}</a><br />{$journalName}</p><ol><li>Click on the Submission URL above.</li><li>Download the Production Ready files and use them to create the galleys according to the journal\'s standards.</li><li>Upload the galleys to the Publication section of the submission.</li><li>Use the  Production Discussions to notify the editor that the galleys are ready.</li></ol><p>If you are unable to undertake this work at this time or have any questions, please contact me. Thank you for your contribution to this journal.</p><p>Kind regards,</p>{$signature}'),
(121,'LAYOUT_COMPLETE','en','Galleys Complete','Galleys Complete','<p>Dear {$recipientName},</p><p>Galleys have now been prepared for the following submission and are ready for final review.</p><p><a href=\"{$submissionUrl}\">{$submissionTitle}</a><br />{$journalName}</p><p>If you have any questions, please contact me.</p><p>Kind regards,</p><p>{$signature}</p>'),
(123,'VERSION_CREATED','en','Version Created','A new version was created for \"{$submissionTitle}\"','<p>Dear {$recipientName}, </p><p>This is an automated message to inform you that a new version of your submission, \"{$submissionTitle}\", was created. You can view this version from your submission dashboard at the following link:</p><p><a href=\"{$submissionUrl}\">\"{$submissionTitle}\"</a></p><hr><p>This is an automatic email sent from <a href=\"{$journalUrl}\">{$journalName}</a>.</p>'),
(125,'EDITORIAL_REMINDER','en','Editorial Reminder','Outstanding editorial tasks for {$journalName}','<p>Dear {$recipientName},</p><p>You are currently assigned to {$numberOfSubmissions} submissions in <a href=\"{$journalUrl}\">{$journalName}</a>. The following submissions are <b>waiting for your response</b>.</p>{$outstandingTasks}<p>View all of your assignments in your <a href=\"{$submissionsUrl}\">submission dashboard</a>.</p><p>If you have any questions about your assignments, please contact {$contactName} at {$contactEmail}.</p>'),
(127,'SUBMISSION_SAVED_FOR_LATER','en','Submission Saved for Later','Resume your submission to {$journalName}','<p>Dear {$recipientName},</p><p>Your submission details have been saved in our system, but it has not yet been submitted for consideration. You can return to complete your submission at any time by following the link below.</p><p><a href=\"{$submissionWizardUrl}\">{$authorsShort} — \"{$submissionTitle}\"</a></p><hr><p>This is an automated email from <a href=\"{$journalUrl}\">{$journalName}</a>.</p>'),
(129,'SUBMISSION_NEEDS_EDITOR','en','Submission Needs Editor','A new submission needs an editor to be assigned: \"{$submissionTitle}\"','<p>Dear {$recipientName},</p><p>The following submission has been submitted and there is no editor assigned.</p><p><a href=\"{$submissionUrl}\">\"{$submissionTitle}\"</a><br />{$authors}</p><p><b>Abstract</b></p>{$submissionAbstract}<p>Please assign an editor who will be responsible for the submission by clicking the title above and assigning an editor under the Participants section.</p><hr><p>This is an automated email from <a href=\"{$journalUrl}\">{$journalName}</a>.</p>'),
(131,'PAYMENT_REQUEST_NOTIFICATION','en','Payment Request','Payment Request Notification','<p>Dear {$recipientName},</p><p>Congratulations on the acceptance of your submission, {$submissionTitle}, to {$journalName}. Now that your submission has been accepted, we would like to request payment of the publication fee.</p><p>This fee covers the production costs of bringing your submission to publication. To make the payment, please visit <a href=\"{$queuedPaymentUrl}\">{$queuedPaymentUrl}</a>.</p><p>If you have any questions, please see our <a href=\"{$submissionGuidelinesUrl}\">Submission Guidelines</a></p>'),
(133,'CHANGE_EMAIL','en','Change Email Address Invitation','Confirm account contact email change request','<p>Dear {$recipientName},</p><p>You are receiving this email because someone has requested a change of your email to {$newEmail}.</p><p>If you have made this request please <a href=\"{$acceptInvitationUrl}\">confirm</a> the email change.</p><p>You can always <a href=\"{$declineInvitationUrl}\">reject</a> this email change.</p><p>Please feel free to contact me with any questions about the submission or the review process.</p><p>Kind regards,</p>{$siteContactName}'),
(135,'ORCID_COLLECT_AUTHOR_ID','en','orcidCollectAuthorId','Submission ORCID','Dear {$recipientName},<br/>\n<br/>\nYou have been listed as an author on a manuscript submission to {$journalName}.<br/>\nTo confirm your authorship, please add your ORCID id to this submission by visiting the link provided below.<br/>\n<br/>\n<a href=\"{$authorOrcidUrl}\"><img id=\"orcid-id-logo\" src=\"https://info.orcid.org/wp-content/uploads/2020/12/ORCIDiD_icon16x16.png\" width=\'16\' height=\'16\' alt=\"ORCID iD icon\" style=\"display: block; margin: 0 .5em 0 0; padding: 0; float: left;\"/>Register or connect your ORCID iD</a><br/>\n<br/>\n<br>\n<a href=\"{$orcidAboutUrl}\">More information about ORCID at {$journalName}</a><br/>\n<br/>\nIf you have any questions, please contact me.<br/>\n<br/>\n{$principalContactSignature}<br/>\n'),
(137,'ORCID_REQUEST_AUTHOR_AUTHORIZATION','en','orcidRequestAuthorAuthorization','Requesting ORCID record access','Dear {$recipientName},<br>\n<br>\nYou have been listed as an author on the manuscript submission \"{$submissionTitle}\" to {$journalName}.\n<br>\n<br>\nPlease allow us to add your ORCID id to this submission and also to add the submission to your ORCID profile on publication.<br>\nVisit the link to the official ORCID website, login with your profile and authorize the access by following the instructions.<br>\n<br>\n<a href=\"{$authorOrcidUrl}\" style=\"display: inline-flex; align-items: center; background-color: white; text-align: center; padding: 10px 20px; text-decoration: none; border-radius: 5px; border: 2px solid #d7d4d4;\"><img id=\"orcid-id-logo\" src=\"https://info.orcid.org/wp-content/uploads/2020/12/ORCIDiD_icon16x16.png\" width=\'16\' height=\'16\' alt=\"ORCID iD icon\" style=\"display: block; margin: 0 .5em 0 0; padding: 0; float: left;\"/>Register or Connect your ORCID iD</a><br/>\n<br>\n<br>\nClick here to verify your account with ORCID: <a href=\"{$authorOrcidUrl}\">{$authorOrcidUrl}.</a>\n<br>\n<br>\n<a href=\"{$orcidAboutUrl}\">More about ORCID at {$journalName}</a><br/>\n<br>\n<br>\nIf you have any questions, please contact me.<br>\n<br>\n{$principalContactSignature}<br>\n'),
(139,'USER_ROLE_ASSIGNMENT_INVITATION','en','User Invited to Role Notification','You are invited to new roles','<div class=\'email-container\'>    <div class=\'email-header\'>        <h2>Invitation to New Role</h2>    </div>    <div class=\'email-content\'>        <p>Dear {$recipientName},</p>        <p>In light of your expertise, you have been invited by {$inviterName} to take on new roles at {$journalName}</p>        <p>At {$journalName}, we value your privacy. As such, we have taken steps to ensure that we are fully GDPR compliant. These steps include you being accountable to enter your own data and choosing who can see what information. For additional information on how we handled your data, please refer to our Privacy Policy.</p>        <div>{$existingRoles}</div>        <div>{$rolesAdded}</div>        <p>On accepting the invite, you will be redirected to {$journalName}.</p>        <p>Feel free to contact me with any questions about the process.</p>        <p><a href=\'{$acceptUrl}\' class=\'btn btn-accept\'>Accept Invitation</a></p>        <p><a href=\'{$declineUrl}\' class=\'btn btn-decline\'>Decline Invitation</a></p>        <p>Kind regards,</p>        <p>{$journalName}</p>    </div></div><style>{$emailTemplateStyle}</style>'),
(141,'USER_ROLE_END','en','User Role Ended Notification','You have been removed from a role','<div class=\'email-container\'>    <div class=\'email-header\'>        <h2>Removed from a Role</h2>    </div>    <div class=\'email-content\'>        <p>Dear {$recipientName},</p>        <p>Thank you very much for your participation in the role of {$roleRemoved} at {$journalName}.</p>        <p>This is a notice to let you know that you have been removed from the following role at {$journalName}: <b>{$roleRemoved}</b>.</p>        <p>Your account with {$journalName} is still active and any other roles you previously held are still active.</p>        <p>Feel free to contact me with any questions about the process.</p>        <p>Kind regards,</p>        <p>{$journalName}</p>    </div></div><style>{$emailTemplateStyle}</style>'),
(143,'ORCID_REQUEST_UPDATE_SCOPE','en','orcidRequestUpdateScope','Requesting updated ORCID record access','Dear {$recipientName},<br>\n<br>\nYou are listed as a contributor (author or reviewer) on the manuscript submission \"{$submissionTitle}\" to {$journalName}.\n<br>\n<br>\nYou have previously authorized {$journalName} to list your ORCID id on the site, and we require updateded permissions to add your contribution to your ORCID profile.<br>\nVisit the link to the official ORCID website, login with your profile and authorize the access by following the instructions.<br>\n<br>\n<a href=\"{$authorOrcidUrl}\" style=\"display: inline-flex; align-items: center; background-color: white; text-align: center; padding: 10px 20px; text-decoration: none; border-radius: 5px; border: 2px solid #d7d4d4;\"><img id=\"orcid-id-logo\" src=\"https://info.orcid.org/wp-content/uploads/2020/12/ORCIDiD_icon16x16.png\" width=\'16\' height=\'16\' alt=\"ORCID iD icon\" style=\"display: block; margin: 0 .5em 0 0; padding: 0; float: left;\"/>Register or Connect your ORCID iD</a><br/>\n<br>\n<br>\nClick here to update your account with ORCID: <a href=\"{$authorOrcidUrl}\">{$authorOrcidUrl}.</a>\n<br>\n<br>\n<a href=\"{$orcidAboutUrl}\">More about ORCID at {$journalName}</a><br/>\n<br>\n<br>\nIf you have any questions, please contact me.<br>\n<br>\n{$principalContactSignature}<br>\n'),
(145,'MANUAL_PAYMENT_NOTIFICATION','en','Manual Payment Notify','Manual Payment Notification','A manual payment needs to be processed for the journal {$journalName} and the user &quot;{$senderUsername}&quot;.<br />\n<br />\nThe item being paid for is &quot;{$paymentName}&quot;.<br />\nThe cost is {$paymentAmount} ({$paymentCurrencyCode}).<br />\n<br />\nThis email was generated by Open Journal Systems\' Manual Payment plugin.'),
(220,'PASSWORD_RESET_CONFIRM','fr_CA','Confirmation de la réinitialisation du mot de passe','Confirmation de la réinitialisation du mot de passe','Nous avons reçu une demande concernant la réinitialisation de votre mot de passe pour le site Web {$siteTitle}.<br />\n<br />\nSi vous n\'avez pas fait cette demande, veuillez ne pas tenir compte du présent message, votre mot de passe restera le même. Si vous souhaitez réinitialiser votre mot de passe, cliquer sur l\'URL ci-dessous.<br />\n<br />\nRéinitialisation de mon mot de passe : {$passwordResetUrl}<br />\n<br />\n{$siteContactName}'),
(221,'USER_REGISTER','fr_CA','Création de l\'utilisateur-trice','Inscription à la revue','{$recipientName},<br />\n<br />\nVous êtes désormais inscrit-e en tant qu\'utilisateur-trice pour la revue {$journalName}. Votre nom d\'utilisateur-trice et votre mot de passe figurent dans ce courriel, lesquels sont requis pour toute interaction avec la revue via son site Web. À n\'importe quel moment, vous pouvez demander à être retiré-e de la liste des utilisateurs-trices de la revue en nous contactant.<br />\n<br />\nNom d\'utilisateur-trice : {$recipientUsername}<br />\nMot de passe : {$password}<br />\n<br />\nMerci,<br />\n{$signature}'),
(222,'USER_VALIDATE_CONTEXT','fr_CA','Validez l\'adresse courriel (enregistrement de la revue)','Valider votre compte','{$recipientName},<br />\n<br />\nVous avez créé un compte pour la revue {$journalName}. Pour pouvoir commencer à l\'utiliser il nous faut d\'abord valider votre adresse de courriel. Pour ce faire, vous n\'avez qu\'à suivre le lien ci-dessous :<br />\n<br />\n{$activateUrl}<br />\n<br />\nMerci,<br />\n{$journalSignature}'),
(223,'USER_VALIDATE_SITE','fr_CA','Valider le courriel (site)','Valider votre compte','{$recipientName},<br />\n<br />\nVous avez créé un compte dans {$siteTitle}. Avant de pouvoir commencer à l\'utiliser, il nous faut d\'abord valider votre adresse de courriel. Pour ce faire, vous n\'avez qu\'à suivre le lien ci-dessous :<br />\n<br />\n{$activateUrl}<br />\n<br />\nMerci,<br />\n{$siteSignature}'),
(224,'REVIEWER_REGISTER','fr_CA','Inscription d\'une évaluateur-trice','Inscription en tant qu\'évaluateur-trice pour la revue {$journalName}','<p>Bonjour {$recipientName},</p><p>Compte tenu de votre expertise, nous avons pris l\'initiative d\'inscrire votre nom dans la base de données des évaluateurs-trices de la revue {$journalName}. Cela ne vous engage d\'aucune façon, mais nous permet simplement de solliciter vos services pour l\'évaluation d\'une soumission. Si vous êtes invité-e à effectuer une évaluation, vous recevrez le titre et le résumé de l\'article en question, et serez toujours libre d\'accepter ou de refuser une telle invitation. À tout moment, il vous est également possible de demander à ce que votre nom soit retiré de la liste des évaluateurs-trices.</p>\n<p>Nous vous acheminons un nom d\'utilisateur-trice et un mot de passe, car tous deux sont requis pour tout échange avec la revue via son site Web. Vous pouvez, par exemple, si vous le souhaitez, effectuer la mise à jour de votre profil, y compris vos domaines d\'intérêt en matière d\'évaluation.</p>\n<p>Nom d\'utilisateur-trice : {$recipientUsername}<br />\nMot de passe : {$password}</p>\n<p>Merci,</p>{$signature}'),
(225,'ISSUE_PUBLISH_NOTIFY','fr_CA','Notification de numéro paru','Parution du dernier numéro : {$issueIdentification} de la revue {$journalName}','<p>Chers-ères lecteurs-trices,</p><p>La revue {$journalName} a le plaisir de vous annoncer la publication de son dernier numéro :  <a href=\"{$issueUrl}\">{$issueIdentification}</a>. Nous vous invitons à consulter le sommaire, puis à visiter notre site Web pour y lire les articles qui vous intéressent. Nous remercions vivement nos auteurs-trices, réviseurs-es et rédacteurs-trices pour leurs précieuses contributions à cet ouvrage, ainsi que nos lecteurs-trices pour leur intérêt constant.</p><div>{$issueToc}</div><p>Cordialement,</p>{$signature}'),
(226,'SUBMISSION_ACK','fr_CA','Confirmation de soumission','Accusé de réception de la soumission à {$journalName}','<p>{$recipientName},</p><p>Nous vous remercions d\'avoir soumis le manuscrit intitulé « {$submissionTitle} » à la revue {$journalName}. Nous l\'avons bien reçu et un membre de notre équipe éditorial le prendre en charge sous peu. Grâce à notre système de gestion en ligne, vous pourrez suivre votre soumission tout au long du processus d\'édition en accédant au site Web de la revue :</p>\n<br />\nURL de la soumission : {$submissionUrl}<br />\nNom d\'utilisateur-trice : {$recipientUsername}<br />\n<br />\nSi vous avez des questions, n\'hésitez pas à communiquer avec nous. Nous vous remercions d\'avoir pensé à notre revue pour la publication de vos travaux.<br />\n<br />\n{$journalSignature}'),
(227,'SUBMISSION_ACK_NOT_USER','fr_CA','Confirmation de soumission (autres auteur-es)','Accusé de réception de la soumission','<p>Bonjour,</p><p>Le manuscrit intitulé , « {$submissionTitle} » , a été soumis par {$submitterName} à la revue {$journalName}.</p><p>Si vous avez des questions, n\'hésitez pas à communiquer avec nous. Nous vous remercions d\'avoir pensé à la revue {$journalName} pour la publication de vos travaux.</p><p>Cordialement,</p>{$journalSignature}'),
(228,'EDITOR_ASSIGN','fr_CA','Rédacteur-trice assigné','Vous avez été assigné.e en tant que rédacteur.trice d\'une soumission de la revue {$journalName}','<p>{$recipientName},</p><p>La soumission suivante vous a été assignée pour le suivi du processus éditorial.</p><p><a href=\"{$submissionUrl}\">{$submissionTitle}</a><br />{$authors}</p><p><b>Résumé</b></p>{$submissionAbstract}</p><p>Si vous jugez la soumission pertinente pour la revue {$journalName}, veuillez la transmettre à l\'étape d\'évaluation en sélectionnant \"Envoyer en évaluation\" et en désignant des évaluateur.trice.s en cliquant sur « Ajouter un.e évaluateur.trice ».</p><p>Si la soumission n\'est pas appropriée pour cette revue, veuillez la décliner.</p><p>Je vous remercie d\'avance.</p><p>Cordialement,</p>{$journalSignature}'),
(229,'REVIEW_CANCEL','fr_CA','Évaluateur.trice non assigné.e','Annulation de la demande d\'évaluation','<p>Bonjour {$recipientName},</p><p>Nous avons décidé d\'annuler notre demande concernant l\'évaluation du manuscrit intitulé « {$submissionTitle} » pour la revue {$journalName}. Nous sommes désolés des inconvénients que cela pourrait vous causer et espérons que nous pourrons de nouveau faire appel à vous pour contribuer au processus de révision par les pairs de cette revue dans le futur.</p><p>Si vous avez des questions, n\'hésitez pas à communiquer avec nous.</p>{$signature}'),
(230,'REVIEW_REINSTATE','fr_CA','Évaluateur.trice réintégré.e','Êtes-vous encore en mesure d\'évaluer des travaux pour la revue {$journalName} ?','<p>{$recipientName},</p><p>Nous avons récemment annulé notre demande vous demandant d\'évaluer la soumission, {$submissionTitle}, pour la revue {$journalName}. Nous sommes revenus sur cette décision et nous espérons que vous êtes toujours en mesure d\'effectuer l\'évaluation.</p><p>Si vous êtes en mesure d\'aider au processus d\'évaluation de cette revue, vous pouvez vous <a href=\"{$reviewAssignmentUrl}\">connecter au site de la revue</a> pour voir la soumission, téléverser les fichiers d\'évaluation ainsi que soumettre votre évaluation.</p><p>Si vous avez des questions, n\'hésitez pas à communiquer avec moi,</p><p>Cordialement,</p>{$signature}'),
(231,'REVIEW_RESEND_REQUEST','fr_CA','Envoyer de nouveau la demande d\'évaluation à l\'évaluateur-trice','Demande d\'évaluation réitérée pour {$journalName}','<p>{$recipientName},</p><p>Vous avez décliné récemment notre invitation à évaluer la soumission, {$submissionTitle}, pour {$journalName}. Je vous écris afin de vous demander si vous accepteriez de reconsidérer votre décision et d\'accepter de l\'évaluer.</p><p>Nous vous en serions très reconnaissant, mais nous comprenons également que vous soyez dans l\'impossibilité de le faire en ce moment. Quoi qu\'il en soit, pouvez-vous s\'il vous plait <a href=\"{$reviewAssignmentUrl}\">accepter ou approuver notre demande</a> avant le {$responseDueDate}.</p><p>Si vous avez des questions, n\'hésitez pas nous contacter.</p><p>Cordialement,</p>{$signature}'),
(232,'REVIEW_REQUEST','fr_CA','Demande d\'évaluation','Demande d\'évaluation d\'un article','<p>Bonjour {$recipientName},</p><p>Nous croyons que vous feriez un-e excellent-e évaluateur-trice pour le manuscrit intitulé « {$submissionTitle} » qui a été soumis à la revue {$journalName}. Vous trouverez un résumé de la soumission ci-dessous. Nous espérons que vous accepterez ce travail essentiel à la publication de la revue.</p><p>Veuillez accéder au site Web de la revue avant le {$responseDueDate} pour nous laisser savoir  <a href=\"{$reviewAssignmentUrl}\">si vous acceptez de faire l\'évaluation ou non</a>.</p><p>« {$submissionTitle} »</p><p>{$submissionAbstract}</p><p>La date d\'échéance de l\'évaluation a été fixée au {$reviewDueDate}.</p><p>Si vous n\'avez pas de nom d\'utilisateur-trice et de mot de passe pour le site Web de la revue, cliquez sur le lien ci-dessous pour réinitialiser votre mot de passe (lequel vous sera envoyé par courriel avec votre nom d\'utilisateur-trice). {$passwordLostUrl}</p><p>URL de la soumission : {$reviewAssignmentUrl}</p><p>Nous vous remercions de l\'attention que vous porterez à notre demande.</p>{$signature}'),
(233,'REVIEW_REQUEST_SUBSEQUENT','fr_CA','Demande d\'évaluation (nouveau cycle)','Demande d\'évaluation d\'un article révisé','<p>{$recipientName},</p><p>Nous vous remercions d\'avoir effectué l\'évaluation du manuscrit intitulé <a href=\"{$reviewAssignmentUrl}\">{$submissionTitle}</a>.</p><p><br/>{$submissionAbstract}</p>\n<p>Suivant les commentaire de l\'évaluation de la dernière version du manuscrit, l\'auteur-trice a soumis une version révisée de son document. Nous apprécierions que vous évaluiez cette nouvelle version dans le cadre d\'un second cycle d\'évaluation.</p><p>Si vous êtes en mesure d\'effectuer cette évaluation, veuillez vous authentifier sur la page de la revue avant le {$responseDueDate} pour y indiquer si vous participerez à cette évaluation ou non, ou encore pour accéder à la soumission et y enregistrer votre évaluation et vos recommandations. Le site Web est {$journalUrl}</p>\n<p>L\'évaluation est due pour le {$reviewDueDate}.</p><p>Si vous n\'avez pas vos nom d\'utilisateur-trice et mot de passe pour le site de la revue, vous pouvez utiliser le lien suivant pour réinitialiser votre mot de passe (lequel vous sera envoyé par courriel avec votre nom d\'utilisateur-trice). {$passwordLostUrl}</p><p>URL de la soumission : {$reviewAssignmentUrl}</p><p>Nous vous remercions de l\'attention que vous porterez à notre demande.</p>{$signature}'),
(234,'REVIEW_RESPONSE_OVERDUE_AUTO','fr_CA','Rappel automatique pour une invitation à évaluer','Seriez-vous en mesure d\'évaluer ce manuscrit pour nous ?','<p>Bonjour {$recipientName},</p><p>Ceci est un petit rappel concernant notre demande d\'évaluation de « {$submissionTitle} » pour la revue {$journalName}. Puisque nous n\'avons pas reçu, comme nous l\'espérions, une réponse avant le {$responseDueDate}, ce courriel a été généré et envoyé automatiquement après l\'échéance du délai.</p><p>Nous pensons que vous seriez un-e excellent-e évaluateur-trice pour le manuscrit. Vous trouverez un résumé de la soumission ci-dessous. Nous espérons que vous envisagerez d\'entreprendre cette tâche essentielle à la publication de la revue.</p>\n<p>Veuillez vous authentifier sur la page de la revue pour y indiquer si vous participerez à cette évaluation ou non, ou encore pour accéder à la soumission et y enregistrer votre évaluation et vos recommandations. Le site Web est {$journalUrl}</p><p>L\'évaluation est dû pour le {$reviewDueDate}.</p><p>Si vous n\'avez pas vos nom d\'utilisateur-trice et mot de passe pour le site de la revue, vous pouvez utiliser le lien suivant pour réinitialiser votre mot de passe (lequel vous sera envoyé par courriel avec votre nom d\'utilisateur-trice). {$passwordLostUrl}</p><p>URL de la soumission : {$reviewAssignmentUrl}</p><p>Nous vous remercions de l\'attention que vous porterez à notre demande.</p><p>« {$submissionTitle} »</p><p>{$submissionAbstract}</p>{$journalSignature}'),
(235,'REVIEW_CONFIRM','fr_CA','Évaluation confirmée','Acceptation d\'évaluation','Rédacteurs-trices,<br />\n<br />\nJe suis en mesure d\'évaluer la soumission intitulée « {$submissionTitle} » pour la revue {$journalName}. Je vous remercie d\'avoir pensé à moi. Je devrais être en mesure de compléter l\'évaluation pour la date du {$reviewDueDate}, voire avant.<br />\n<br />\n{$senderName}'),
(236,'REVIEW_DECLINE','fr_CA','Évaluation refusée','Refus d\'évaluation','Rédacteurs-trices,<br />\n<br />\nPour le moment, il m\'est impossible d\'évaluer la soumission intitulée « {$submissionTitle} » pour la revue {$journalName}. Je vous remercie d\'avoir pensé à moi. N\'hésitez pas à communiquer avec moi pour un autre projet.<br />\n<br />\n{$senderName}'),
(237,'REVIEW_ACK','fr_CA','Accusé de réception de l\'évaluation','Accusé de réception de l\'évaluation d\'une soumission','<p>{$recipientName},</p>\n<p>Nous vous remercions d\'avoir évaluer la soumission, {$submissionTitle}, pour {$journalName}. Nous apprécions l\'expertise et le temps que vous y avez consacrés et qui contribuent à la qualité des travaux que nous publions.</p>\n<p>Ce fut un plaisir de travailler avec vous et nous espérons avoir opportunité de le faire encore à l\'avenir.</p>\n<p>Cordialement,</p>\n<p>{$signature}</p>'),
(238,'REVIEW_REMIND','fr_CA','Rappel d\'évaluation','Un rappel pour vous demander de bien vouloir terminer votre évaluation','<p>Bonjour {$recipientName},</p><p>Ceci est un petit rappel concernant notre demande d\'évaluation de la soumission « {$submissionTitle} » pour la revue {$journalName}. Nous espérions recevoir votre évaluation avant le {$reviewDueDate}. Nous serions heureux de la recevoir dès que possible.</p><p>Vous pouvez vous <a href=\"{$reviewAssignmentUrl}\">connecter au site de la revue</a> et suivre les étapes d\'évaluation afin de consulter le texte, soumettre votre fichier d\'évaluation ainsi que vos commentaires. </p><p>Si vous avez besoin de plus de temps, contactez moi. Je vous remercie.</p>\n<p>Cordialement</p>{$signature}'),
(239,'REVIEW_REMIND_AUTO','fr_CA','Rappel automatique d\'évaluation','Un rappel automatique pour vous demander de bien vouloir terminer votre évaluation','<p>{$recipientName},</p><p>Ceci est un rappel automatisé concernant notre demande d\'évaluation de la soumission « {$submissionTitle} » pour la revue {$journalName}. Puisque nous n\'avons pas reçu, comme nous l\'espérions, votre évaluation avant le {$reviewDueDate}, ce courriel a été généré et envoyé automatiquement après l\'échéance du délai. Nous serions toutefois heureux de recevoir votre évaluation dès que possible.</p><p>S\'il vous plait, <a href=\"{$reviewAssignmentUrl}\">connectez-vous à la revue</a> et suivez les étapes d\'évaluation afin de consulter le texte et soumettre votre fichier d\'évaluation ainsi que vos commentaires.</p><p>Si vous avez besoin d\'un délai supplémentaire, n\'hésitez pas à me contacter.</p><p>Je vous remercie. <br/>Cordialement, </p>{$journalSignature}'),
(240,'REVIEW_COMPLETE','fr_CA','Évaluation terminée','Évaluation terminée: {$reviewerName} recommande {$reviewRecommendation} pour #{$submissionId} {$authorsShort} — {$submissionTitle}','<p>{$recipientName},</p><p>{$reviewerName} a terminé son évaluation :</p><p><a href=\"{$submissionUrl}\">#{$submissionId} {$authorsShort} — {$submissionTitle}</a><br /><b>Recommandation :</b> {$reviewRecommendation}<br /><b>Type :</b> {$reviewMethod}</p><p>Connectez-vous <a href=\"{$submissionUrl}\">afin de consulter les commentaires</a> de l\'évaluateur-trice.</p>'),
(241,'REVIEW_EDIT','fr_CA','','','<p>{$recipientName},</p><p>Un-e rédacteur-trice a modifié l\'assignation de votre évaluation pour {$journalName}. S\'il vous plaît, consulter les détails ci-dessous et n\'hésitez pas à nous contacter si vous avez des questions.</p><p><a href=\"{$reviewAssignmentUrl}\">{$submissionTitle}</a><br /><b>Type :</b> {$reviewMethod}<br /><b>Accepté ou rejeté avant le :</b> {$responseDueDate}<br /><b>Évaluation soumise avant le :</b> {$reviewDueDate}</p><p>Vous pouvez vous connectez afin de <a href=\"{$reviewAssignmentUrl}\">terminer cette évaluation</a>.</p>'),
(242,'EDITOR_DECISION_ACCEPT','fr_CA','Soumission acceptée','Votre soumission a été acceptée dans la revue {$journalName}','<p>Bonjour {$authors},</p><p>Nous avons pris une décision concernant votre soumission « {$submissionTitle} » à la revue {$journalName}.</p><p>Notre décision est d\'accepter votre soumission.</p><p>Cordialement,</p>{$signature}'),
(243,'EDITOR_DECISION_SEND_TO_EXTERNAL','fr_CA','Envoyé à l\'évaluation','Votre manuscrit a été envoyé en évaluation','<p>{$recipientName},</p><p>Nous sommes heureux de vous annoncer qu\'un-e redacteur-trice à évaluer votre manuscrit, {$submissionTitle}, et a décidé de l\'envoyer en évaluation. Un-e redacteur-trice identifiera des évaluateurs-trices qui feront des commentaires sur votre manuscrit.</p><p>{$reviewTypeDescription} Nous vous ferons part de leurs commentaires et vous informerons des prochaines étapes par la suite.</p><p>S\'il vous plait, prenez en considération que le fait d\'envoyer votre manuscrit en évaluation ne garantit en rien le fait d\'être publié. Nous prendrons en considération les recommandations des évaluateurs avant de décider de publier votre manuscrit.</p><p>Si vous avez des questions, vous pouvez nous contacter à partir de votre <a href=\"{$authorSubmissionUrl}\">tableau de bord de soumission</a>.</p><p>{$signature}</p>'),
(244,'EDITOR_DECISION_SEND_TO_PRODUCTION','fr_CA','Envoyé en production','Décision du rédacteur','<p>{$recipientName},</p><p>Je vous écris de la part de {$journalName} afin de vous confirmer que la révision de votre soumission, {$submissionTitle}, est terminée. Votre soumission sera envoyée à l\'étape de production, nous procéderons à la mise en page avant publication. Nous vous contacterons au besoin.</p><p>Si vous avez des questions, vous pouvez nous rejoindre à partir du <a href=\"{$authorSubmissionUrl}\">tableau de bord de votre soumission</a>.</p><p>Cordialement,</p>{$signature}'),
(245,'EDITOR_DECISION_REVISIONS','fr_CA','Révisions demandées','Décision du rédacteur','{$authors},<br />\n<br />\nNous avons pris une décision concernant votre soumission « {$submissionTitle} » à la revue {$journalName}.<br />\n<br />\nNotre décision est de vous demander d\'apporter des révisions à votre soumission.'),
(246,'EDITOR_DECISION_RESUBMIT','fr_CA','Soumettez à nouveau pour évaluation','Décision du rédacteur','{$authors},<br />\n<br />\nNous avons pris une décision concernant votre soumission « {$submissionTitle} » à la revue {$journalName}.<br />\n<br />\nNotre décision est de vous demander d\'apporter des révisions à votre soumission et de la soumettre à nouveau.'),
(247,'EDITOR_DECISION_DECLINE','fr_CA','Soumission refusée','Décision du rédacteur','{$authors}:<br />\n<br />\nNous avons pris une décision concernant votre soumission « {$submissionTitle} » à la revue {$journalName}.<br />\n<br />\nNotre décision est de refuser votre soumission.'),
(248,'EDITOR_DECISION_INITIAL_DECLINE','fr_CA','Soumission refusée avant évaluation','Décision du rédacteur','<p>{$recipientName},</p><p>Nous avons le regret de vous informer qu\'après avoir évaluer votre manuscrit, {$submissionTitle}, le-la rédacteur-trice en a conclue qu\'il ne rencontre pas les exigences nécessaires pour être publier dans {$journalName}.</p><p>Cordialement,</p>{$signature}'),
(249,'EDITOR_RECOMMENDATION','fr_CA','Recommandation émise','Recommandation du rédacteur','<p>{$recipientName},</p><p>Ma recommandation concernant la soumission « {$submissionTitle} » à la revue {$journalName} est de : {$recommendation}</p><p>S\'il vous plait, consulter la <a href=\"{$submissionUrl}\">page de la soumission</a> afin de donner suite à cette recommandation.</p><p>Cordialement,</p><p>{$senderName}</p>'),
(250,'EDITOR_DECISION_NOTIFY_OTHER_AUTHORS','fr_CA','Envoyer une notification aux autres auteur-es','Mise à jour concernant votre soumission','<p>Ce courriel a été envoyé à {$submittingAuthorName} par {$journalName} concernant {$submissionTitle}.</p>\n<p>Vous recevez une copie de cet avis car vous êtes identifié comme auteur-e de cette soumission. Toutes les instructions dans le message ci-dessous sont à l\'intention de l\'auteur-e de correspondance, {$submittingAuthorName}. </p><p>Aucune action n\'est attendue de votre part.</p>\n\n{$messageToSubmittingAuthor}'),
(251,'EDITOR_DECISION_NOTIFY_REVIEWERS','fr_CA','Notifier les évaluateurs-trices de la décision','Décision éditoriale suite à votre évaluation','<p>{$recipientName},</p>\n<p>Nous vous remercions d\'avoir complété votre évaluation de la soumission, {$submissionTitle}, pour {$journalName}. Nous vous sommes reconnaissant pour votre temps et votre expertise qui contribue à la qualité des travaux que nous publions. Nous avons partagé vos commentaires avec l\'auteur-e, ainsi que ceux des autres évaluateurs-trices. </p>\n<p>En fonction des recommandations reçues, nous avons informé l\'auteur-e de notre décision qui est la suivante: </p>\n<p>{$decisionDescription}</p>\n<p>Votre recommandation a été prise en considération conjointement avec celles des autres évaluateurs-trices avant d\'en arriver à cette décision.</p>\n<p>Ce fut un plaisir de travailler avec vous à cette évaluation pour {$journalName}. Nous espérons avoir l\'opportunité de renouveler cette expérience avec vous à l\'avenir.</p>\n<p>Cordialement,</p>\n<p>{$signature}</p>'),
(252,'EDITOR_DECISION_NEW_ROUND','fr_CA','Un nouveau cycle d\'évaluation a été lancé','Votre soumission fera l\'objet d\'un nouveau cycle d\'évaluation','<p>{$recipientName},</p>\n<p>Votre soumission révisée, {$submissionTitle}, fera l\'objet d\'un nouveau cycle d\'évaluation par les pairs. \nNous vous contacterons afin de vous faire part des commentaires des évaluateurs et vous fournir des informations sur les prochaines étapes.</p>\n<p>Si vous avec des questions, vous pouvez nous contacter à partir de votre <a href=\"{$authorSubmissionUrl}\">tableau de bord de soumission</a>.</p>\n<p>Cordialement,</p>\n<p>{$signature}</p>\n'),
(253,'EDITOR_DECISION_REVERT_DECLINE','fr_CA','Rétablir une soumission refusée','Nous avons renversé la décision de rejeter votre soumission','<p>{$recipientName},</p>\n<p>La décision de rejeter votre soumission, {$submissionTitle}, a été renversée. Un-e rédacteur-trice complétera le cycle d\'évaluation et vous serez informé-e lorsqu\'une décision éditoriale sera prise.</p>\n<p>Si vous avez des questions, vous pouvez nous contacter sur votre <a href=\"{$authorSubmissionUrl}\">tableau de bord de soumissions</a>.</p>\n<p>Cordialement,</p>\n<p>{$signature}</p>\n'),
(254,'EDITOR_DECISION_REVERT_INITIAL_DECLINE','fr_CA','Rétablir une soumission refusée sans évaluation','Nous avons renversé la décision de rejeter votre soumission','<p>{$recipientName},</p>\n<p>La décision de rejeter votre soumission, {$submissionTitle}, a été renversée. Un-e rédacteur-trice consultera en détail votre soumission avant de décider de la rejeter ou de l\'envoyer en évaluation.</p>\n<p>Si vous avez des questions, vous pouvez nous contacter à partir de votre <a href=\"{$authorSubmissionUrl}\">tableau de bord de soumission</a>.</p>\n<p>Cordialement,</p>\n<p>{$signature}</p>\n'),
(255,'EDITOR_DECISION_SKIP_REVIEW','fr_CA','Soumission acceptée (sans évaluation)','Votre soumission a été envoyée à la révision linguistique','<p>{$recipientName},</p>\n<p>Nous avons le plaisir de vous informer que nous avons décidé d\'accepter votre soumission sans processus d\'évaluation par les pairs. Nous trouvons que votre soumission, {$submissionTitle}, répond à nos exigences et ne requerrons pas une évaluation par les pairs. Nous sommes enthousiastes à l\'idée de publier votre texte dans la revue {$journalName} et voulons vous remercier d\'avoir choisi notre revue pour diffuser vos travaux. </p>\nVotre texte sera publié dans un prochain numéro de la revue {$journalName} et vous pouvez l\'inclure dès à présent dans votre liste de publications. Nous reconnaissons les efforts nécessaire à toute publication et vous en félicitons. </p>\n<p>Votre texte va faire l\'objet d\'une révision linguistique et être mise en page avant publication.</p>\n<p>Vous recevrez des instructions sous peu.</p>\n<p>Si vous avez des questions, n\'hésitez pas à me contacter à partir de votre <a href=\"{$authorSubmissionUrl}\">tableau de bord de soumission</a>.</p>\n<p>Cordialement,</p>\n<p>{$signature}</p>\n'),
(256,'EDITOR_DECISION_BACK_FROM_PRODUCTION','fr_CA','Soumission renvoyée à la révision','Votre soumission a été renvoyée à l\'étape de révision','<p>{$recipientName},</p><p>Votre soumission, {$submissionTitle}, a été renvoyée à l\'étape de révision, où nous procéderons à des révisions supplémentaires ainsi qu\'à la mise en page en prévision de la publication.</p><p>Nous nous excusons pour la confusion que cette opération peut occasionner.</p><p>Si vous avez des questions, vous pouvez nous contacter à partir de votre <a href=\"{$authorSubmissionUrl}\">tableau de bord de soumission</a>.</p><p>Cordialement,</p><p>{$signature}</p>'),
(257,'EDITOR_DECISION_BACK_FROM_COPYEDITING','fr_CA','Soumission renvoyée de l\'étape de révision','Votre soumission a été renvoyée à l\'étape d\'évaluation.','<p>{$recipientName},</p><p>Votre soumission, {$submissionTitle}, a été renvoyée à l\'étape d\'évaluation. Elle sera réévaluée avant de pouvoir être acceptée.</p><p>Il peut arriver qu\'une décision d\'accepter une soumission soit prise par erreur dans notre système et qu\'elle doive être renvoyée à l\'étape d\'évaluation. Nous nous excusons cette la confusion. Nous allons faire en sorte de compléter le processus d\'évaluation rapidement afin de vous communiquer notre décision finale le plus tôt possible.</p><p>Nous vous contacterons au besoin.</p><p>Si vous avez des questions, n\'hésitez pas à nous contacter à partir de votre <a href=\"{$authorSubmissionUrl}\">tableau de bord de soumission</a>.</p><p>Cordialement,</p><p>{$signature}</p>'),
(258,'EDITOR_DECISION_CANCEL_REVIEW_ROUND','fr_CA','Cycle d\'évaluation annulé','Un cycle d\'évaluation de votre soumission a été annulé','<p>{$recipientName},</p><p>Nous avions déclenché un nouveau cycle d\'évaluation pour votre soumission, {$submissionTitle}. Nous fermons désormais ce cycle.</p><p>Nous nous excusons pour la confusion que cette action peut occasionner. </p><p>Nous vous contacterons si nous avons besoin d\'une aide supplémentaire de votre part.</p><p>Si vous avez des questions, vous pouvez nous contacter à partir de votre <a href=\"{$authorSubmissionUrl}\">tableau de bord de soumissions</a></p>.<p>Kind regards,</p><p>{$signature}</p>'),
(259,'SUBSCRIPTION_NOTIFY','fr_CA','Notification d\'abonnement','Avis d\'abonnement','{$recipientName},<br />\n<br />\nVous êtes maintenant abonné-e à notre système de gestion de revue en ligne pour la revue {$journalName}, avec le type d\'abonnement suivant  :<br />\n<br />\n{$subscriptionType}<br />\n<br />\nPour accéder au contenu destiné seulement aux abonnés, connectez-vous au système à l\'aide de votre nom d\'utilisateur-trice : {$recipientUsername}.<br />\n<br />\nUne fois connecté-e dans le système, vous pouvez, en tout temps, modifier les renseignements de votre profil et votre mot de passe.<br />\n<br />\nVeuillez prendre note que si vous disposez d\'un abonnement institutionnel, les utilisateurs-trices n\'ont pas à entrer de nom d\'utilisateur-trice puisque le système authentifiera automatiquement les demandes.<br />\n<br />\nSi vous avez des questions, n\'hésitez pas à communiquer avec nous.<br />\n<br />\n{$subscriptionSignature}'),
(260,'OPEN_ACCESS_NOTIFY','fr_CA','Notification de diffusion en libre accès','Gratuitement accessible : le numéro {$issueIdentification} de la revue {$journalName} est maintenant en accès libre','<p>Chers lecteurs et lectrices,</p><p>La revue {$journalName} vient de rendre disponible en libre accès le numéro suivant. Nous vous invitons à lire ici le sommaire puis visiter notre site Web ({$journalUrl}) pour lire les articles et autres textes qui pourraient vous intéresser.</p><p>Merci de votre intérêt continu pour notre travail.</p>{$journalSignature}'),
(261,'SUBSCRIPTION_BEFORE_EXPIRY','fr_CA','L\'abonnement arrive bientôt à échéance','Avis d\'expiration de l\'abonnement','{$recipientName},<br />\n<br />\nVotre abonnement à la revue {$journalName} expirera bientôt.<br />\n<br />\n{$subscriptionType}<br />\nDate d\'expiration : {$expiryDate}<br />\n<br />\nAfin d\'assurer la continuité de votre accès à cette revue, nous vous invitons à aller sur le site Web de la revue et à renouveler votre abonnement. Vous pouvez vous y ouvrir une session avec votre nom d\'utilisateur-trice, soit « {$recipientUsername} ».<br />\n<br />\nSi vous avez des questions, ne pas hésiter à communiquer avec nous.<br />\n<br />\n{$subscriptionSignature}'),
(262,'SUBSCRIPTION_AFTER_EXPIRY','fr_CA','Abonnement échu','Abonnement expiré','{$recipientName},<br />\n<br />\nVotre abonnement à la revue {$journalName} est expiré.<br />\n<br />\n{$subscriptionType}<br />\nDate d\'expiration : {$expiryDate}<br />\n<br />\nPour renouveler votre abonnement, veuillez vous rendre sur le site Web de la revue. Vous pouvez y ouvrir une session en utilisant votre nom d\'utilisateur-trice, soit « {$recipientUsername} ».<br />\n<br />\nSi vous avez des questions, n\'hésitez pas à communiquer avec nous.<br />\n<br />\n{$subscriptionSignature}'),
(263,'SUBSCRIPTION_AFTER_EXPIRY_LAST','fr_CA','Abonnement échu en dernier','Abonnement expiré - Dernier rappel','<p>Bonjour {$recipientName},</p><p>Votre abonnement à la revue {$journalName} est expiré. Veuillez prendre note que ceci est le dernier rappel qui vous sera envoyé.</p><p>{$subscriptionType}</p>\n<p>Date d\'expiration : {$expiryDate}</p><p>Pour renouveler votre abonnement, veuillez vous rendre sur le site Web de la revue. Vous pouvez y ouvrir une session avec votre nom d\'utilisateur-trice, soit « {$recipientUsername} ».</p><p>Si vous avez des questions, ne hésitez pas à communiquer avec nous.</p>{$subscriptionSignature}'),
(264,'SUBSCRIPTION_PURCHASE_INDL','fr_CA','Acheter un abonnement individuel','Souscription à un abonnement individuel','Une souscription en ligne à un abonnement individuel pour la revue {$journalName} avec les renseignements suivants :<br />\n<br />\nType d\'abonnement :<br />\n{$subscriptionType}<br />\n<br />\nUtilisateur-trice :<br />\n{$subscriberDetails}<br />\n<br />\nInformation d\'adhésion (si fournie) :<br />\n{$membership}<br />\n<br />\nPour afficher ou modifier cet abonnement, veuillez utiliser l\'URL suivante.<br />\n<br />\nURL d\'abonnement : {$subscriptionUrl}<br/>\n'),
(265,'SUBSCRIPTION_PURCHASE_INSTL','fr_CA','Acheter un abonnement institutionnel','Souscription à un abonnement institutionnel','Souscription en ligne à un abonnement institutionnel pour la revue {$journalName} avec les renseignements suivants. Pour activer cet abonnement, veuillez utiliser l\'URL d\'abonnement fourni et fixer le statut de l\'abonnement à « actif ».<br />\n<br />\nType d\'abonnement :<br />\n{$subscriptionType}<br />\n<br />\nÉtablissement :<br />\n{$institutionName}<br />\n{$institutionMailingAddress}<br />\n<br />\nDomaine (si fourni) :<br />\n{$domain}<br />\n<br />\nPlage d\'adresses IP (si fournie) :<br />\n{$ipRanges}<br />\n<br />\nPersonne-ressource :<br />\n{$subscriberDetails}<br />\n<br />\nRenseignements d\'adhésion (si fournis) :<br />\n{$membership}<br />\n<br />\nPour afficher ou modifier cet abonnement, veuillez utiliser l\'URL suivant :<br />\n<br />\nURL de l\'abonnement : {$subscriptionUrl}<br />\n'),
(266,'SUBSCRIPTION_RENEW_INDL','fr_CA','Renouveler l\'abonnement individuel','Renouvellement d\'abonnement individuel','Un abonnement individuel a été renouvelé en ligne pour la revue {$journalName} avec les renseignements suivants.<br />\n<br />\nType d\'abonnement :<br />\n{$subscriptionType}<br />\n<br />\nUtilisateur-trice :<br />\n{$subscriberDetails}<br />\n<br />\nRenseignements d\'adhésion (si fournis) :<br />\n{$membership}<br />\n<br />\nPour afficher ou modifier cet abonnement, veuillez utiliser l\'URL suivant.<br />\n<br />\nURL de l\'abonnement : {$subscriptionUrl}<br />\n'),
(267,'SUBSCRIPTION_RENEW_INSTL','fr_CA','Renouveler l\'abonnement institutionnel','Renouvellement d\'abonnement institutionnel','Un abonnement institutionnel a été renouvelé en ligne pour la revue {$journalName} avec les renseignements suivants.<br />\n<br />\nType d\'abonnement :<br />\n{$subscriptionType}<br />\n<br />\nÉtablissement :<br />\n{$institutionName}<br />\n{$institutionMailingAddress}<br />\n<br />\nDomaine (si fourni) :<br />\n{$domain}<br />\n<br />\nPlage d\'adresses IP (si fournie) :<br />\n{$ipRanges}<br />\n<br />\nPersonne-ressource :<br />\n{$subscriberDetails}<br />\n<br />\nRenseignements d\'adhésion (si fournis) :<br />\n{$membership}<br />\n<br />\nPour afficher ou modifier cet abonnement, veuillez utiliser l\'URL suivant.<br />\n<br />\nURL de l\'abonnement : {$subscriptionUrl}<br />\n'),
(268,'REVISED_VERSION_NOTIFY','fr_CA','Notification de la version révisée','Version révisée téléversée','<p>Bonjour {$recipientName},</p><p>Une version révisée de « {$submissionTitle} » a été téléversée par l\'auteur-e {$submitterName}.</p><p>URL de la soumission : {$submissionUrl}</p>. <p>Ceci est un message automatique de <a href=\"{$journalUrl}\">{$journalName}</a>.</p>'),
(269,'STATISTICS_REPORT_NOTIFICATION','fr_CA','Notification sur les rapports statistiques','Activité éditoriale pour {$month} {$year}','\n{$recipientName}, <br />\n<br />\nLe rapport d\'activité éditoriale de votre revue pour {$month} {$year} est maintenant disponible. Les principales statistiques pour ce mois sont affichées ci-dessous.<br />\n<ul>\n	<li> Nouvelles soumissions pour ce mois : {$newSubmissions} </li>\n	<li> Soumissions refusées pour ce mois : {$declinedSubmissions} </li>\n	<li> Soumissions acceptées pour ce mois : {$acceptedSubmissions} </li>\n	<li> Nombre total de soumissions dans la plateforme : {$totalSubmissions} </li>\n</ul>\nConnectez-vous au site de la revue pour voir davantage de <a href=\"{$editorialStatsLink}\">tendances dans l\'activité éditoriale</a> ainsi que des <a href=\"{$publicationStatsLink}\">statistiques relatives aux articles publiés</a>. Le rapport complet des tendances de l\'activité éditoriale de ce mois-ci est joint au présent envoi.<br />\n<br />\nCordialement,<br />\n{$journalSignature}'),
(270,'ANNOUNCEMENT','fr_CA','Nouvelle annonce','{$announcementTitle}','<b>{$announcementTitle}</b><br />\n<br />\n{$announcementSummary}<br />\n<br />\nVisiter notre site Web pour consulter <a href=\"{$announcementUrl}\">l\'annonce complète</a>.'),
(271,'DISCUSSION_NOTIFICATION_SUBMISSION','fr_CA','Discussion (soumission)','Un message à propos de la revue {$journalName}','Prière de saisir votre message.'),
(272,'DISCUSSION_NOTIFICATION_REVIEW','fr_CA','Discussion (évaluation)','Un message à propos de la revue {$journalName}','Prière de saisir votre message.'),
(273,'DISCUSSION_NOTIFICATION_COPYEDITING','fr_CA','Discussion (révision)','Un message à propos de la revue {$journalName}','Prière de saisir votre message.'),
(274,'DISCUSSION_NOTIFICATION_PRODUCTION','fr_CA','Discussion (production)','Un message à propos de la revue {$journalName}','Prière de saisir votre message.'),
(275,'COPYEDIT_REQUEST','fr_CA','Demande de révision','Demande de révision d\'une soumission','{$recipientName},<br />\n<br />\nJ\'aimerais que vous effectuiez la révision du manuscrit intitulé « {$submissionTitle} » pour la revue {$journalName} à l\'aide des étapes suivantes.<br />\n1. Cliquer sur l\'URL de la soumission ci-dessous.<br />\n2. Ouvrir le(s) fichier(s) disponible(s) sous Fichiers des ébauches finales et effectuer votre révision, tout en ajoutant des discussions sur la révision, le cas échéant.<br />\n3. Enregistrer le(s) fichier(s) révisé(s) et le(s) téléverser dans la section Version(s) révisée(s).<br />\n4. Informer le,la rédacteur-trice que tous les fichiers ont été révisés et que l\'étape de production peut débuter.<br />\n<br />\nURL de la revue {$journalName} : {$journalUrl}<br />\nURL de la soumission : {$submissionUrl}<br />\nNom d\'utilisateur-trice : {$recipientUsername}'),
(276,'EDITOR_ASSIGN_SUBMISSION','fr_CA','Assigner un-e rédacteur-trice','Vous avez été assigné.e en tant que rédacteur.trice d\'une soumission de la revue {$journalName}','<p>{$recipientName},</p><p>La soumission suivante vous a été assignée pour le suivi du processus éditorial.</p><p><a href=\"{$submissionUrl}\">{$submissionTitle}</a><br />{$authors}</p><p><b>Résumé</b></p>{$submissionAbstract}</p><p>Si vous jugez la soumission pertinente pour la revue {$journalName}, veuillez la transmettre à l\'étape d\'évaluation en sélectionnant \"Envoyer en évaluation\" et en désignant des évaluateur.trice.s en cliquant sur « Ajouter un.e évaluateur.trice ».</p><p>Si la soumission n\'est pas appropriée pour cette revue, veuillez la décliner.</p><p>Je vous remercie d\'avance.</p><p>Cordialement,</p>{$journalSignature}'),
(277,'EDITOR_ASSIGN_REVIEW','fr_CA','Assigner un-e rédacteur-trice','Vous avez été assigné.e en tant que rédacteur.trice d\'une soumission de la revue {$journalName}','<p>{$recipientName},</p><p>La soumission suivante vous a été assignée pour le processus d\'évaluation par les pairs.</p><p><a href=\"{$submissionUrl}\">{$submissionTitle}</a><br />{$authors}</p><p><b>Résumé</b></p>{$submissionAbstract}<p>Veuillez vous connecter pour <a href=\"{$submissionUrl}\">voir la soumission</a> et désigner des évaluateur.trice.s qualifié.es. Vous pouvez désigner un.e évaluateur.trice en cliquant sur « Ajouter un.e évaluateur.trice ».</p><p>Je vous remercie d\'avance.</p><p>Cordialement,</p>{$signature}'),
(278,'EDITOR_ASSIGN_PRODUCTION','fr_CA','Assigner un-e rédacteur-trice','Vous avez été assigné.e en tant que rédacteur.trice d\'une soumission de la revue {$journalName}','<p>{$recipientName},</p><p>La soumission suivante vous a été assignée pour suivre le processus de production.</p><p><a href=\"{$submissionUrl}\">{$submissionTitle}</a><br />{$authors}</p><p><b>Résumé</b></p>{$submissionAbstract}<p>Veuillez vous connecter pour <a href=\"{$submissionUrl}\">afficher la soumission</a>. Une fois les fichiers prêts pour la production disponibles, les téléverser sous la section <strong>Publication &gt; Épreuves</strong>. Ensuite, planifier la publication en cliquant sur le bouton <strong>Planifier la publication</strong>.</p><p>Merci d\'avance.</p><p>Cordialement,</p>{$signature}'),
(279,'LAYOUT_REQUEST','fr_CA','Prêt pour production','La soumission {$submissionId} est prête pour production à la revue {$contextAcronym}','<p>Bonjour {$recipientName},</p><p>J\'aimerais que vous prépariez les épreuves du manuscrit intitulé « {$submissionTitle} » pour la revue {$journalName} à l\'aide des étapes suivantes.</p>\n<ol><li>Cliquer sur l\'URL de la soumission ci-dessous.</li><li>Se connecter au site Web de la revue et utiliser les fichiers disponibles sous Fichiers prêts pour la production pour créer les épreuves en fonction des normes de la revue.</li><li>Téléverser les épreuves dans la section Épreuves.</li><li>Informer le-la rédacteur-trice, via une discussion sur la production, que les épreuves ont été téléversées et qu\'elles sont prêtes.</li></ol><p>URL de la revue {$journalName} : {$journalUrl}</p><p>URL du manuscrit : {$submissionUrl}</p><p>Nom d\'utilisateur-trice : {$recipientUsername}</p><p>Si vous ne pouvez pas effectuer ce travail pour le moment ou si vous avez des questions, veuillez communiquer avec moi. Je vous remercie de votre collaboration.</p>{$signature}'),
(280,'LAYOUT_COMPLETE','fr_CA','Épreuves complétées','Mise en page des épreuves terminée','<p>Bonjour {$recipientName},</p><p>Les épreuves du manuscrit intitulé « <a href=\"{$submissionUrl}\">{$submissionTitle}</a> » pour la revue {$journalName} sont maintenant prêtes pour la relecture.</p><p>Si vous avez des questions, n\'hésitez pas à communiquer avec moi.</p><p>{$signature}</p>'),
(281,'VERSION_CREATED','fr_CA','Version créée','Une nouvelle version a été créée pour {$submissionTitle}','<p>{$recipientName}, </p><p>Ceci est un courriel automatique de <a href=\"{$journalUrl}\">{$journalName}</a> pour vous informer qu\'une nouvelle version de votre soumission, {$submissionTitle}, a été créée. Vous pouvez consulter cette version à partir de votre tableau de bord de soumission:</p><p><a href=\"{$submissionUrl}\">{$submissionTitle}</a></p><hr>'),
(282,'EDITORIAL_REMINDER','fr_CA','Rappel éditorial','Tâches éditoriales en attente pour {$journalName}','<p>$recipientName}, </p><p>Vous êtes présentement assigné-e à {$numberOfSubmissions} soumissions dans <a href=\"{$journalUrl}\">{$journalName}</a>. Des actions sont <b>attendues de votre part pour ces soumissions</b>.</p>{$outstandingTasks}<p>Vous pouvez consulter toutes vos soumissions dans votre <a href=\"{$submissionsUrl}\">tableau de bord des soumissions</a>.</p><p>Si vous avez des questions, contactez {$contactName} par courriel à l’adresse: {$contactEmail}. </p>'),
(283,'SUBMISSION_SAVED_FOR_LATER','fr_CA','Soumission incomplète sauvegardée','Reprendre votre soumission à {$journalName}','<p>{$recipientName},</p><p>Les détails de votre soumission ont été enregistrés, mais vous ne l\'avez pas encore finalisée. Vous pouvez le faire en cliquant sur le lien ci-dessous: </p><p><a href=\"{$submissionWizardUrl}\">{$authorsShort} — {$submissionTitle}</a></p><hr><p>Ceci est un message automatique de <a href=\"{$journalUrl}\">{$journalName}</a>.</p>'),
(284,'SUBMISSION_NEEDS_EDITOR','fr_CA','Soumission en attente de rédacteur-trice','Un-e rédacteur-trice doit être assigné-e à la nouvelle soumission : {$submissionTitle}','<p>{$recipientName},</p><p>La soumission suivante a été soumise et aucun-e rédacteur-trice ne lui est assigné-e.</p><p><a href=\"{$submissionUrl}\">{$submissionTitle}</a><br />{$authors}</p><p><b>Abstract</b></p>{$submissionAbstract}<p>S\'il vous plait, assignez un-e rédacteur-trice qui sera responsable de la soumission. </p><hr><p>Ceci est un courriel automatique de <a href=\"{$journalUrl}\">{$journalName}</a>.</p>'),
(285,'PAYMENT_REQUEST_NOTIFICATION','fr_CA','Demande de paiement','Avis de demande de paiement','<p>Bonjour {$recipientName},</p><p>Félicitations pour l\'acceptation de votre texte, {$submissionTitle}, dans {$journalName}. Maintenant que votre texte a été accepté, il est nécessaire de payer les frais de publication afin de compléter le processus.</p><p>Ces frais couvrent les coûts de production permettant d\'assurer la publication de votre texte. Pour effectuer le paiement, rendez-vous sur <a href=\"{$queuedPaymentUrl}\">{$queuedPaymentUrl}</a>.</p><p> Si vous avez des questions, référez-vous à nos <a href=\"{$submissionGuidelinesUrl}\">directives de soumissions</a>.</p>'),
(286,'CHANGE_EMAIL','fr_CA','Changer l\'adresse courriel d\'invitation','',''),
(287,'ORCID_COLLECT_AUTHOR_ID','fr_CA','orcidCollectAuthorId','Soumission ORCID','{$recipientName},<br/>\n<br/>\nVous avez été inscrit ou inscrite en tant qu\'auteur ou auteure pour un manuscrit soumis à {$journalName}.<br/>\nPour confirmer votre statut d\'auteur ou d\'auteure, veuillez ajouter votre identifiant ORCID à cette soumission en cliquant sur le lien ci-dessous.<br/>\n<br/>\n<a href=\"{$authorOrcidUrl}\"><img id=\"orcid-id-logo\" src=\"https://info.orcid.org/wp-content/uploads/2020/12/ORCIDiD_icon16x16.png\" width=\'16\' height=\'16\' alt=\"icône identifiant ORCID\" style=\"display: block; margin: 0 .5em 0 0; padding: 0; float: left;\"/>Se connecter avec votre identifiant ORCID ou s\'inscrire</a><br/>\n<br/>\n<br/>\n<a href=\"{$orcidAboutUrl}\">Plus de renseignements sur votre identifiant ORCID dans {$journalName}</a><br/>\n<br/>\nSi vous avez des questions, veuillez communiquer avec nous.<br/>\n<br/>\n{$principalContactSignature}<br/>\n'),
(288,'ORCID_REQUEST_AUTHOR_AUTHORIZATION','fr_CA','orcidRequestAuthorAuthorization','Demande d\'accès au dossier ORCID','{$recipientName},<br/>\n<br/>\nVous avez été inscrit ou inscrite en tant qu\'auteur ou auteure pour le manuscrit « {$submissionTitle} » soumis à {$journalName}.\n<br/>\n<br/>\nVeuillez nous autoriser à ajouter votre identifiant ORCID à cette soumission et à ajouter également la soumission à votre dossier ORCID suite à sa publication.\n<br/>\nSuivre le lien vers le site officiel ORCID, vous connecter avec votre profil et autoriser l\'accès en suivant les instructions.<br/>\n<a href=\"{$authorOrcidUrl}\"><img id=\"orcid-id-logo\" src=\"https://info.orcid.org/wp-content/uploads/2020/12/ORCIDiD_icon16x16.png\" width=\'16\' height=\'16\' alt=\"icône identifiant ORCID\" style=\"display: block; margin: 0 .5em 0 0; padding: 0; float: left;\"/>Se connecter avec votre identifiant ORCID ou s\'inscrire</a><br/>\n<br/>\n<br/>\n<a href=\"{$orcidAboutUrl}\">Plus de renseignements sur votre identifiant ORCID dans {$journalName}</a><br/>\n<br/>\nSi vous avez des questions, veuillez communiquer avec nous.<br/>\n<br/>\n{$principalContactSignature}<br/>\n'),
(289,'USER_ROLE_ASSIGNMENT_INVITATION','fr_CA','','',''),
(290,'USER_ROLE_END','fr_CA','','',''),
(291,'ORCID_REQUEST_UPDATE_SCOPE','fr_CA','','',''),
(292,'MANUAL_PAYMENT_NOTIFICATION','fr_CA','Avis de paiement manuel','Avis de paiement manuel','Un paiement manuel doit être traité pour la revue {$journalName} et l\'utilisateur &quot;{$senderUsername}&quot;.<br />\n<br />\nL\'élément facturé est &quot;{$paymentName}&quot;.<br />\nLe coût est de {$paymentAmount} ({$paymentCurrencyCode}).<br />\n<br />\nCe courriel a été généré par le plugiciel de paiement manuel du Open Journal Systems.');
/*!40000 ALTER TABLE `email_templates_default_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `email_templates_settings`
--

DROP TABLE IF EXISTS `email_templates_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
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
/*!40101 SET character_set_client = utf8mb4 */;
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
) ENGINE=InnoDB AUTO_INCREMENT=310 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='A log of all events related to an object like a submission.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `event_log`
--

LOCK TABLES `event_log` WRITE;
/*!40000 ALTER TABLE `event_log` DISABLE KEYS */;
INSERT INTO `event_log` VALUES
(1,1048585,1,17,'2025-08-02 05:49:30',268435458,'submission.event.general.metadataUpdated',0),
(2,1048585,1,17,'2025-08-02 05:49:30',268435458,'submission.event.general.metadataUpdated',0),
(3,515,1,17,'2025-08-02 05:49:39',1342177281,'submission.event.fileUploaded',0),
(4,1048585,1,17,'2025-08-02 05:49:39',1342177288,'submission.event.fileRevised',0),
(5,1048585,1,17,'2025-08-02 05:49:40',268435458,'submission.event.general.metadataUpdated',0),
(6,515,1,17,'2025-08-02 05:49:40',1342177296,'submission.event.fileEdited',0),
(7,515,2,17,'2025-08-02 05:49:41',1342177281,'submission.event.fileUploaded',0),
(8,1048585,1,17,'2025-08-02 05:49:41',1342177288,'submission.event.fileRevised',0),
(9,515,2,17,'2025-08-02 05:49:41',1342177296,'submission.event.fileEdited',0),
(10,515,3,17,'2025-08-02 05:49:42',1342177281,'submission.event.fileUploaded',0),
(11,1048585,1,17,'2025-08-02 05:49:42',1342177288,'submission.event.fileRevised',0),
(12,515,3,17,'2025-08-02 05:49:43',1342177296,'submission.event.fileEdited',0),
(13,515,4,17,'2025-08-02 05:49:43',1342177281,'submission.event.fileUploaded',0),
(14,1048585,1,17,'2025-08-02 05:49:43',1342177288,'submission.event.fileRevised',0),
(15,515,4,17,'2025-08-02 05:49:44',1342177296,'submission.event.fileEdited',0),
(16,515,5,17,'2025-08-02 05:49:44',1342177281,'submission.event.fileUploaded',0),
(17,1048585,1,17,'2025-08-02 05:49:44',1342177288,'submission.event.fileRevised',0),
(18,515,5,17,'2025-08-02 05:49:45',1342177296,'submission.event.fileEdited',0),
(19,515,6,17,'2025-08-02 05:49:45',1342177281,'submission.event.fileUploaded',0),
(20,1048585,1,17,'2025-08-02 05:49:45',1342177288,'submission.event.fileRevised',0),
(21,515,6,17,'2025-08-02 05:49:45',1342177296,'submission.event.fileEdited',0),
(22,515,6,17,'2025-08-02 05:49:46',1342177282,'submission.event.fileDeleted',0),
(23,1048585,1,17,'2025-08-02 05:49:46',1342177282,'submission.event.fileDeleted',0),
(24,1048585,1,17,'2025-08-02 05:50:11',268435457,'submission.event.submissionSubmitted',0),
(25,1048585,1,3,'2025-08-02 05:50:18',805306371,'editor.submission.decision.sendExternalReview.log',0),
(26,515,7,3,'2025-08-02 05:50:18',1342177281,'submission.event.fileUploaded',0),
(27,1048585,1,3,'2025-08-02 05:50:18',1342177288,'submission.event.fileRevised',0),
(28,515,8,3,'2025-08-02 05:50:18',1342177281,'submission.event.fileUploaded',0),
(29,1048585,1,3,'2025-08-02 05:50:18',1342177288,'submission.event.fileRevised',0),
(30,515,9,3,'2025-08-02 05:50:18',1342177281,'submission.event.fileUploaded',0),
(31,1048585,1,3,'2025-08-02 05:50:18',1342177288,'submission.event.fileRevised',0),
(32,515,10,3,'2025-08-02 05:50:18',1342177281,'submission.event.fileUploaded',0),
(33,1048585,1,3,'2025-08-02 05:50:18',1342177288,'submission.event.fileRevised',0),
(34,515,11,3,'2025-08-02 05:50:19',1342177281,'submission.event.fileUploaded',0),
(35,1048585,1,3,'2025-08-02 05:50:19',1342177288,'submission.event.fileRevised',0),
(36,1048585,1,3,'2025-08-02 05:50:21',1073741825,'log.review.reviewerAssigned',0),
(37,1048585,1,3,'2025-08-02 05:50:24',1073741825,'log.review.reviewerAssigned',0),
(38,1048585,1,3,'2025-08-02 05:50:26',1073741825,'log.review.reviewerAssigned',0),
(39,1048585,1,3,'2025-08-02 05:50:29',805306371,'editor.submission.decision.accept.log',0),
(40,1048585,1,3,'2025-08-02 05:50:33',268435459,'submission.event.participantAdded',0),
(41,1048585,1,3,'2025-08-02 05:50:36',805306371,'editor.submission.decision.sendToProduction.log',0),
(42,1048585,1,3,'2025-08-02 05:50:40',268435459,'submission.event.participantAdded',0),
(43,1048585,1,3,'2025-08-02 05:50:43',268435459,'submission.event.participantAdded',0),
(44,1048585,1,3,'2025-08-02 05:52:08',268435458,'submission.event.general.metadataUpdated',0),
(45,1048585,1,3,'2025-08-02 05:52:10',268435458,'submission.event.general.metadataUpdated',0),
(46,1048585,1,3,'2025-08-02 05:52:11',268435458,'submission.event.general.metadataUpdated',0),
(47,1048585,1,3,'2025-08-02 05:52:14',268435458,'submission.event.general.metadataUpdated',0),
(48,515,12,3,'2025-08-02 05:52:20',1342177281,'submission.event.fileUploaded',0),
(49,1048585,1,3,'2025-08-02 05:52:20',1342177288,'submission.event.fileRevised',0),
(50,515,12,3,'2025-08-02 05:52:21',1342177296,'submission.event.fileEdited',0),
(51,1048585,1,3,'2025-08-02 05:52:28',268435459,'submission.event.participantAdded',0),
(52,1048585,1,17,'2025-08-02 05:52:34',268435458,'submission.event.general.metadataUpdated',0),
(53,1048585,1,3,'2025-08-02 05:52:39',268435458,'submission.event.general.metadataUpdated',0),
(54,1048585,1,3,'2025-08-02 05:52:41',268435462,'publication.event.published',0),
(55,1048585,1,3,'2025-08-02 05:52:49',268435463,'publication.event.unpublished',0),
(56,1048585,1,3,'2025-08-02 05:52:53',268435462,'publication.event.published',0),
(57,1048585,1,3,'2025-08-02 05:52:57',268435458,'submission.event.general.metadataUpdated',0),
(58,1048585,1,3,'2025-08-02 05:52:57',268435464,'publication.event.versionCreated',0),
(59,1048585,1,3,'2025-08-02 05:53:02',268435458,'submission.event.general.metadataUpdated',0),
(60,1048585,1,3,'2025-08-02 05:53:11',268435458,'submission.event.general.metadataUpdated',0),
(61,1048585,1,3,'2025-08-02 05:53:13',268435462,'publication.event.versionPublished',0),
(62,1048585,1,3,'2025-08-02 05:53:21',268435463,'publication.event.versionUnpublished',0),
(63,1048585,1,3,'2025-08-02 05:53:28',268435459,'submission.event.participantAdded',0),
(64,1048585,1,3,'2025-08-02 05:53:37',268435459,'submission.event.participantAdded',0),
(65,1048585,2,18,'2025-08-02 05:53:59',268435458,'submission.event.general.metadataUpdated',0),
(66,1048585,2,18,'2025-08-02 05:53:59',268435458,'submission.event.general.metadataUpdated',0),
(67,515,13,18,'2025-08-02 05:54:01',1342177281,'submission.event.fileUploaded',0),
(68,1048585,2,18,'2025-08-02 05:54:01',1342177288,'submission.event.fileRevised',0),
(69,515,13,18,'2025-08-02 05:54:01',1342177296,'submission.event.fileEdited',0),
(70,1048585,2,18,'2025-08-02 05:54:02',268435457,'submission.event.submissionSubmitted',0),
(71,1048585,2,3,'2025-08-02 05:54:06',805306371,'editor.submission.decision.sendExternalReview.log',0),
(72,515,14,3,'2025-08-02 05:54:07',1342177281,'submission.event.fileUploaded',0),
(73,1048585,2,3,'2025-08-02 05:54:07',1342177288,'submission.event.fileRevised',0),
(74,1048585,2,3,'2025-08-02 05:54:10',268435459,'submission.event.participantAdded',0),
(75,1048585,2,3,'2025-08-02 05:54:14',268435458,'submission.event.general.metadataUpdated',0),
(76,1048585,2,6,'2025-08-02 05:54:18',805306372,'editor.submission.recommend.accept.log',0),
(77,1048585,3,19,'2025-08-02 05:54:28',268435458,'submission.event.general.metadataUpdated',0),
(78,1048585,3,19,'2025-08-02 05:54:28',268435458,'submission.event.general.metadataUpdated',0),
(79,515,15,19,'2025-08-02 05:54:29',1342177281,'submission.event.fileUploaded',0),
(80,1048585,3,19,'2025-08-02 05:54:29',1342177288,'submission.event.fileRevised',0),
(81,515,15,19,'2025-08-02 05:54:30',1342177296,'submission.event.fileEdited',0),
(82,1048585,3,19,'2025-08-02 05:54:31',268435457,'submission.event.submissionSubmitted',0),
(83,1048585,3,3,'2025-08-02 05:54:35',805306371,'editor.submission.decision.sendExternalReview.log',0),
(84,515,16,3,'2025-08-02 05:54:35',1342177281,'submission.event.fileUploaded',0),
(85,1048585,3,3,'2025-08-02 05:54:35',1342177288,'submission.event.fileRevised',0),
(86,1048585,3,3,'2025-08-02 05:54:38',1073741825,'log.review.reviewerAssigned',0),
(87,1048585,3,3,'2025-08-02 05:54:41',1073741825,'log.review.reviewerAssigned',0),
(88,1048585,3,3,'2025-08-02 05:54:44',805306371,'editor.submission.decision.accept.log',0),
(89,1048585,3,3,'2025-08-02 05:54:48',268435459,'submission.event.participantAdded',0),
(90,1048585,4,20,'2025-08-02 05:54:54',268435458,'submission.event.general.metadataUpdated',0),
(91,1048585,4,20,'2025-08-02 05:54:55',268435458,'submission.event.general.metadataUpdated',0),
(92,515,17,20,'2025-08-02 05:54:56',1342177281,'submission.event.fileUploaded',0),
(93,1048585,4,20,'2025-08-02 05:54:56',1342177288,'submission.event.fileRevised',0),
(94,515,17,20,'2025-08-02 05:54:56',1342177296,'submission.event.fileEdited',0),
(95,1048585,4,20,'2025-08-02 05:54:58',268435457,'submission.event.submissionSubmitted',0),
(96,1048585,5,21,'2025-08-02 05:55:03',268435458,'submission.event.general.metadataUpdated',0),
(97,1048585,5,21,'2025-08-02 05:55:04',268435458,'submission.event.general.metadataUpdated',0),
(98,515,18,21,'2025-08-02 05:55:05',1342177281,'submission.event.fileUploaded',0),
(99,1048585,5,21,'2025-08-02 05:55:05',1342177288,'submission.event.fileRevised',0),
(100,515,18,21,'2025-08-02 05:55:05',1342177296,'submission.event.fileEdited',0),
(101,1048585,5,21,'2025-08-02 05:55:06',268435457,'submission.event.submissionSubmitted',0),
(102,1048585,5,3,'2025-08-02 05:55:11',805306371,'editor.submission.decision.sendExternalReview.log',0),
(103,515,19,3,'2025-08-02 05:55:12',1342177281,'submission.event.fileUploaded',0),
(104,1048585,5,3,'2025-08-02 05:55:12',1342177288,'submission.event.fileRevised',0),
(105,1048585,5,3,'2025-08-02 05:55:15',1073741825,'log.review.reviewerAssigned',0),
(106,1048585,5,3,'2025-08-02 05:55:17',1073741825,'log.review.reviewerAssigned',0),
(107,1048585,5,3,'2025-08-02 05:55:20',805306371,'editor.submission.decision.accept.log',0),
(108,1048585,5,3,'2025-08-02 05:55:24',268435459,'submission.event.participantAdded',0),
(109,1048585,5,3,'2025-08-02 05:55:27',805306371,'editor.submission.decision.sendToProduction.log',0),
(110,1048585,5,3,'2025-08-02 05:55:32',268435459,'submission.event.participantAdded',0),
(111,1048585,5,3,'2025-08-02 05:55:35',268435459,'submission.event.participantAdded',0),
(112,1048585,6,22,'2025-08-02 05:55:41',268435458,'submission.event.general.metadataUpdated',0),
(113,1048585,6,22,'2025-08-02 05:55:41',268435458,'submission.event.general.metadataUpdated',0),
(114,515,20,22,'2025-08-02 05:55:43',1342177281,'submission.event.fileUploaded',0),
(115,1048585,6,22,'2025-08-02 05:55:43',1342177288,'submission.event.fileRevised',0),
(116,515,20,22,'2025-08-02 05:55:43',1342177296,'submission.event.fileEdited',0),
(117,1048585,6,22,'2025-08-02 05:55:44',268435457,'submission.event.submissionSubmitted',0),
(118,1048585,6,3,'2025-08-02 05:55:49',805306371,'editor.submission.decision.sendExternalReview.log',0),
(119,515,21,3,'2025-08-02 05:55:49',1342177281,'submission.event.fileUploaded',0),
(120,1048585,6,3,'2025-08-02 05:55:49',1342177288,'submission.event.fileRevised',0),
(121,1048585,6,3,'2025-08-02 05:55:52',1073741825,'log.review.reviewerAssigned',0),
(122,1048585,6,3,'2025-08-02 05:55:55',1073741825,'log.review.reviewerAssigned',0),
(123,1048585,6,3,'2025-08-02 05:55:58',805306371,'editor.submission.decision.accept.log',0),
(124,1048585,6,3,'2025-08-02 05:56:02',268435459,'submission.event.participantAdded',0),
(125,1048585,6,3,'2025-08-02 05:56:05',805306371,'editor.submission.decision.sendToProduction.log',0),
(126,1048585,6,3,'2025-08-02 05:56:10',268435459,'submission.event.participantAdded',0),
(127,1048585,7,23,'2025-08-02 05:56:16',268435458,'submission.event.general.metadataUpdated',0),
(128,1048585,7,23,'2025-08-02 05:56:16',268435458,'submission.event.general.metadataUpdated',0),
(129,515,22,23,'2025-08-02 05:56:18',1342177281,'submission.event.fileUploaded',0),
(130,1048585,7,23,'2025-08-02 05:56:18',1342177288,'submission.event.fileRevised',0),
(131,515,22,23,'2025-08-02 05:56:18',1342177296,'submission.event.fileEdited',0),
(132,1048585,7,23,'2025-08-02 05:56:19',268435457,'submission.event.submissionSubmitted',0),
(133,1048585,7,3,'2025-08-02 05:56:24',805306371,'editor.submission.decision.sendExternalReview.log',0),
(134,515,23,3,'2025-08-02 05:56:25',1342177281,'submission.event.fileUploaded',0),
(135,1048585,7,3,'2025-08-02 05:56:25',1342177288,'submission.event.fileRevised',0),
(136,1048585,7,3,'2025-08-02 05:56:28',1073741825,'log.review.reviewerAssigned',0),
(137,1048585,7,3,'2025-08-02 05:56:30',1073741825,'log.review.reviewerAssigned',0),
(138,1048585,7,3,'2025-08-02 05:56:33',1073741825,'log.review.reviewerAssigned',0),
(139,1048585,7,8,'2025-08-02 05:56:37',1073741830,'log.review.reviewAccepted',NULL),
(140,1048585,7,8,'2025-08-02 05:56:40',1073741848,'log.review.reviewReady',0),
(141,1048585,8,24,'2025-08-02 05:56:47',268435458,'submission.event.general.metadataUpdated',0),
(142,1048585,8,24,'2025-08-02 05:56:47',268435458,'submission.event.general.metadataUpdated',0),
(143,515,24,24,'2025-08-02 05:56:48',1342177281,'submission.event.fileUploaded',0),
(144,1048585,8,24,'2025-08-02 05:56:48',1342177288,'submission.event.fileRevised',0),
(145,515,24,24,'2025-08-02 05:56:49',1342177296,'submission.event.fileEdited',0),
(146,1048585,8,24,'2025-08-02 05:56:50',268435457,'submission.event.submissionSubmitted',0),
(147,1048585,9,25,'2025-08-02 05:56:56',268435458,'submission.event.general.metadataUpdated',0),
(148,1048585,9,25,'2025-08-02 05:56:56',268435458,'submission.event.general.metadataUpdated',0),
(149,515,25,25,'2025-08-02 05:56:58',1342177281,'submission.event.fileUploaded',0),
(150,1048585,9,25,'2025-08-02 05:56:58',1342177288,'submission.event.fileRevised',0),
(151,515,25,25,'2025-08-02 05:56:58',1342177296,'submission.event.fileEdited',0),
(152,1048585,9,25,'2025-08-02 05:56:59',268435457,'submission.event.submissionSubmitted',0),
(153,1048585,9,3,'2025-08-02 05:57:05',805306371,'editor.submission.decision.sendExternalReview.log',0),
(154,515,26,3,'2025-08-02 05:57:05',1342177281,'submission.event.fileUploaded',0),
(155,1048585,9,3,'2025-08-02 05:57:05',1342177288,'submission.event.fileRevised',0),
(156,1048585,9,3,'2025-08-02 05:57:09',1073741825,'log.review.reviewerAssigned',0),
(157,1048585,9,3,'2025-08-02 05:57:11',1073741825,'log.review.reviewerAssigned',0),
(158,1048585,9,3,'2025-08-02 05:57:14',805306371,'editor.submission.decision.accept.log',0),
(159,1048585,9,3,'2025-08-02 05:57:18',268435459,'submission.event.participantAdded',0),
(160,1048585,9,3,'2025-08-02 05:57:22',805306371,'editor.submission.decision.sendToProduction.log',0),
(161,1048585,9,3,'2025-08-02 05:57:26',268435459,'submission.event.participantAdded',0),
(162,1048585,9,3,'2025-08-02 05:57:29',268435459,'submission.event.participantAdded',0),
(163,1048585,10,26,'2025-08-02 05:57:35',268435458,'submission.event.general.metadataUpdated',0),
(164,1048585,10,26,'2025-08-02 05:57:36',268435458,'submission.event.general.metadataUpdated',0),
(165,515,27,26,'2025-08-02 05:57:37',1342177281,'submission.event.fileUploaded',0),
(166,1048585,10,26,'2025-08-02 05:57:37',1342177288,'submission.event.fileRevised',0),
(167,515,27,26,'2025-08-02 05:57:37',1342177296,'submission.event.fileEdited',0),
(168,1048585,10,26,'2025-08-02 05:57:38',268435457,'submission.event.submissionSubmitted',0),
(169,1048585,10,3,'2025-08-02 05:57:44',805306371,'editor.submission.decision.sendExternalReview.log',0),
(170,515,28,3,'2025-08-02 05:57:45',1342177281,'submission.event.fileUploaded',0),
(171,1048585,10,3,'2025-08-02 05:57:45',1342177288,'submission.event.fileRevised',0),
(172,1048585,10,3,'2025-08-02 05:57:48',1073741825,'log.review.reviewerAssigned',0),
(173,1048585,10,3,'2025-08-02 05:57:51',1073741825,'log.review.reviewerAssigned',0),
(174,1048585,10,9,'2025-08-02 05:57:54',1073741830,'log.review.reviewAccepted',NULL),
(175,1048585,10,9,'2025-08-02 05:57:58',1073741848,'log.review.reviewReady',0),
(176,1048585,10,10,'2025-08-02 05:58:01',1073741830,'log.review.reviewAccepted',NULL),
(177,1048585,10,10,'2025-08-02 05:58:04',1073741848,'log.review.reviewReady',0),
(178,1048585,11,27,'2025-08-02 05:58:10',268435458,'submission.event.general.metadataUpdated',0),
(179,1048585,11,27,'2025-08-02 05:58:10',268435458,'submission.event.general.metadataUpdated',0),
(180,515,29,27,'2025-08-02 05:58:12',1342177281,'submission.event.fileUploaded',0),
(181,1048585,11,27,'2025-08-02 05:58:12',1342177288,'submission.event.fileRevised',0),
(182,515,29,27,'2025-08-02 05:58:12',1342177296,'submission.event.fileEdited',0),
(183,1048585,11,27,'2025-08-02 05:58:13',268435457,'submission.event.submissionSubmitted',0),
(184,1048585,12,28,'2025-08-02 05:58:19',268435458,'submission.event.general.metadataUpdated',0),
(185,1048585,12,28,'2025-08-02 05:58:20',268435458,'submission.event.general.metadataUpdated',0),
(186,515,30,28,'2025-08-02 05:58:21',1342177281,'submission.event.fileUploaded',0),
(187,1048585,12,28,'2025-08-02 05:58:21',1342177288,'submission.event.fileRevised',0),
(188,515,30,28,'2025-08-02 05:58:21',1342177296,'submission.event.fileEdited',0),
(189,1048585,12,28,'2025-08-02 05:58:22',268435457,'submission.event.submissionSubmitted',0),
(190,1048585,12,3,'2025-08-02 05:58:29',805306371,'editor.submission.decision.sendExternalReview.log',0),
(191,515,31,3,'2025-08-02 05:58:29',1342177281,'submission.event.fileUploaded',0),
(192,1048585,12,3,'2025-08-02 05:58:29',1342177288,'submission.event.fileRevised',0),
(193,1048585,12,3,'2025-08-02 05:58:33',1073741825,'log.review.reviewerAssigned',0),
(194,1048585,12,3,'2025-08-02 05:58:35',1073741825,'log.review.reviewerAssigned',0),
(195,1048585,13,29,'2025-08-02 05:58:42',268435458,'submission.event.general.metadataUpdated',0),
(196,1048585,13,29,'2025-08-02 05:58:42',268435458,'submission.event.general.metadataUpdated',0),
(197,515,32,29,'2025-08-02 05:58:44',1342177281,'submission.event.fileUploaded',0),
(198,1048585,13,29,'2025-08-02 05:58:44',1342177288,'submission.event.fileRevised',0),
(199,515,32,29,'2025-08-02 05:58:44',1342177296,'submission.event.fileEdited',0),
(200,1048585,13,29,'2025-08-02 05:58:45',268435457,'submission.event.submissionSubmitted',0),
(201,1048585,13,3,'2025-08-02 05:58:52',805306371,'editor.submission.decision.sendExternalReview.log',0),
(202,515,33,3,'2025-08-02 05:58:52',1342177281,'submission.event.fileUploaded',0),
(203,1048585,13,3,'2025-08-02 05:58:52',1342177288,'submission.event.fileRevised',0),
(204,1048585,13,3,'2025-08-02 05:58:56',1073741825,'log.review.reviewerAssigned',0),
(205,1048585,13,3,'2025-08-02 05:58:58',1073741825,'log.review.reviewerAssigned',0),
(206,1048585,13,3,'2025-08-02 05:59:01',1073741825,'log.review.reviewerAssigned',0),
(207,1048585,13,7,'2025-08-02 05:59:04',1073741830,'log.review.reviewAccepted',NULL),
(208,1048585,13,7,'2025-08-02 05:59:08',1073741848,'log.review.reviewReady',0),
(209,1048585,13,9,'2025-08-02 05:59:10',1073741830,'log.review.reviewAccepted',NULL),
(210,1048585,13,9,'2025-08-02 05:59:14',1073741848,'log.review.reviewReady',0),
(211,1048585,13,10,'2025-08-02 05:59:17',1073741830,'log.review.reviewAccepted',NULL),
(212,1048585,13,10,'2025-08-02 05:59:21',1073741848,'log.review.reviewReady',0),
(213,1048585,13,3,'2025-08-02 05:59:29',805306371,'editor.submission.decision.requestRevisions.log',0),
(214,1048585,13,3,'2025-08-02 05:59:30',805306375,'submission.event.decisionReviewerEmailSent',0),
(215,1048585,14,30,'2025-08-02 05:59:38',268435458,'submission.event.general.metadataUpdated',0),
(216,1048585,14,30,'2025-08-02 05:59:38',268435458,'submission.event.general.metadataUpdated',0),
(217,515,34,30,'2025-08-02 05:59:40',1342177281,'submission.event.fileUploaded',0),
(218,1048585,14,30,'2025-08-02 05:59:40',1342177288,'submission.event.fileRevised',0),
(219,515,34,30,'2025-08-02 05:59:40',1342177296,'submission.event.fileEdited',0),
(220,1048585,14,30,'2025-08-02 05:59:41',268435457,'submission.event.submissionSubmitted',0),
(221,1048585,15,31,'2025-08-02 05:59:47',268435458,'submission.event.general.metadataUpdated',0),
(222,1048585,15,31,'2025-08-02 05:59:47',268435458,'submission.event.general.metadataUpdated',0),
(223,515,35,31,'2025-08-02 05:59:48',1342177281,'submission.event.fileUploaded',0),
(224,1048585,15,31,'2025-08-02 05:59:48',1342177288,'submission.event.fileRevised',0),
(225,515,35,31,'2025-08-02 05:59:49',1342177296,'submission.event.fileEdited',0),
(226,1048585,15,31,'2025-08-02 05:59:49',268435457,'submission.event.submissionSubmitted',0),
(227,1048585,15,3,'2025-08-02 05:59:57',805306371,'editor.submission.decision.sendExternalReview.log',0),
(228,515,36,3,'2025-08-02 05:59:57',1342177281,'submission.event.fileUploaded',0),
(229,1048585,15,3,'2025-08-02 05:59:57',1342177288,'submission.event.fileRevised',0),
(230,1048585,15,3,'2025-08-02 06:00:01',1073741825,'log.review.reviewerAssigned',0),
(231,1048585,15,3,'2025-08-02 06:00:04',1073741825,'log.review.reviewerAssigned',0),
(232,1048585,15,3,'2025-08-02 06:00:07',805306371,'editor.submission.decision.accept.log',0),
(233,1048585,15,3,'2025-08-02 06:00:12',268435459,'submission.event.participantAdded',0),
(234,1048585,15,3,'2025-08-02 06:00:15',805306371,'editor.submission.decision.sendToProduction.log',0),
(235,1048585,15,3,'2025-08-02 06:00:20',268435459,'submission.event.participantAdded',0),
(236,1048585,16,32,'2025-08-02 06:00:27',268435458,'submission.event.general.metadataUpdated',0),
(237,1048585,16,32,'2025-08-02 06:00:27',268435458,'submission.event.general.metadataUpdated',0),
(238,515,37,32,'2025-08-02 06:00:28',1342177281,'submission.event.fileUploaded',0),
(239,1048585,16,32,'2025-08-02 06:00:28',1342177288,'submission.event.fileRevised',0),
(240,515,37,32,'2025-08-02 06:00:29',1342177296,'submission.event.fileEdited',0),
(241,1048585,16,32,'2025-08-02 06:00:29',268435457,'submission.event.submissionSubmitted',0),
(242,1048585,17,33,'2025-08-02 06:00:35',268435458,'submission.event.general.metadataUpdated',0),
(243,1048585,17,33,'2025-08-02 06:00:35',268435458,'submission.event.general.metadataUpdated',0),
(244,515,38,33,'2025-08-02 06:00:37',1342177281,'submission.event.fileUploaded',0),
(245,1048585,17,33,'2025-08-02 06:00:37',1342177288,'submission.event.fileRevised',0),
(246,515,38,33,'2025-08-02 06:00:37',1342177296,'submission.event.fileEdited',0),
(247,1048585,17,33,'2025-08-02 06:00:38',268435457,'submission.event.submissionSubmitted',0),
(248,1048585,17,3,'2025-08-02 06:00:46',805306371,'editor.submission.decision.sendExternalReview.log',0),
(249,515,39,3,'2025-08-02 06:00:46',1342177281,'submission.event.fileUploaded',0),
(250,1048585,17,3,'2025-08-02 06:00:46',1342177288,'submission.event.fileRevised',0),
(251,1048585,17,3,'2025-08-02 06:00:51',1073741825,'log.review.reviewerAssigned',0),
(252,1048585,17,3,'2025-08-02 06:00:53',1073741825,'log.review.reviewerAssigned',0),
(253,1048585,17,3,'2025-08-02 06:00:56',805306371,'editor.submission.decision.accept.log',0),
(254,1048585,17,3,'2025-08-02 06:01:01',268435459,'submission.event.participantAdded',0),
(255,1048585,17,3,'2025-08-02 06:01:04',805306371,'editor.submission.decision.sendToProduction.log',0),
(256,1048585,17,3,'2025-08-02 06:01:10',268435459,'submission.event.participantAdded',0),
(257,1048585,17,3,'2025-08-02 06:01:13',268435459,'submission.event.participantAdded',0),
(258,515,40,3,'2025-08-02 06:01:17',1342177281,'submission.event.fileUploaded',0),
(259,1048585,17,3,'2025-08-02 06:01:17',1342177288,'submission.event.fileRevised',0),
(260,515,40,3,'2025-08-02 06:01:18',1342177296,'submission.event.fileEdited',0),
(261,1048585,17,3,'2025-08-02 06:01:26',268435458,'submission.event.general.metadataUpdated',0),
(262,1048585,17,3,'2025-08-02 06:01:28',268435462,'publication.event.scheduled',0),
(263,1048585,17,3,'2025-08-02 06:01:33',268435462,'publication.event.published',0),
(264,1048585,17,3,'2025-08-02 06:01:39',268435463,'publication.event.unpublished',0),
(265,1048585,17,3,'2025-08-02 06:01:39',268435462,'publication.event.scheduled',0),
(266,1048585,17,3,'2025-08-02 06:01:45',268435462,'publication.event.published',0),
(267,1048585,17,3,'2025-08-02 06:01:52',268435463,'publication.event.unpublished',0),
(268,1048585,17,3,'2025-08-02 06:01:52',268435458,'submission.event.general.metadataUpdated',0),
(269,1048585,17,3,'2025-08-02 06:02:05',268435458,'submission.event.general.metadataUpdated',0),
(270,1048585,17,3,'2025-08-02 06:02:08',268435462,'publication.event.published',0),
(271,1048585,18,34,'2025-08-02 06:02:18',268435458,'submission.event.general.metadataUpdated',0),
(272,1048585,18,34,'2025-08-02 06:02:18',268435458,'submission.event.general.metadataUpdated',0),
(273,515,41,34,'2025-08-02 06:02:20',1342177281,'submission.event.fileUploaded',0),
(274,1048585,18,34,'2025-08-02 06:02:20',1342177288,'submission.event.fileRevised',0),
(275,515,41,34,'2025-08-02 06:02:20',1342177296,'submission.event.fileEdited',0),
(276,1048585,18,34,'2025-08-02 06:02:21',268435457,'submission.event.submissionSubmitted',0),
(277,1048585,18,3,'2025-08-02 06:02:29',805306371,'editor.submission.decision.decline.log',0),
(278,1048585,19,35,'2025-08-02 06:02:37',268435458,'submission.event.general.metadataUpdated',0),
(279,1048585,19,35,'2025-08-02 06:02:38',268435458,'submission.event.general.metadataUpdated',0),
(280,515,42,35,'2025-08-02 06:02:39',1342177281,'submission.event.fileUploaded',0),
(281,1048585,19,35,'2025-08-02 06:02:39',1342177288,'submission.event.fileRevised',0),
(282,515,42,35,'2025-08-02 06:02:39',1342177296,'submission.event.fileEdited',0),
(283,1048585,19,35,'2025-08-02 06:02:40',268435457,'submission.event.submissionSubmitted',0),
(284,1048585,19,3,'2025-08-02 06:02:48',805306371,'editor.submission.decision.sendExternalReview.log',0),
(285,515,43,3,'2025-08-02 06:02:49',1342177281,'submission.event.fileUploaded',0),
(286,1048585,19,3,'2025-08-02 06:02:49',1342177288,'submission.event.fileRevised',0),
(287,1048585,19,3,'2025-08-02 06:02:53',1073741825,'log.review.reviewerAssigned',0),
(288,1048585,19,3,'2025-08-02 06:02:56',1073741825,'log.review.reviewerAssigned',0),
(289,1048585,19,3,'2025-08-02 06:02:59',805306371,'editor.submission.decision.accept.log',0),
(290,1048585,19,3,'2025-08-02 06:03:04',268435459,'submission.event.participantAdded',0),
(291,1048585,20,36,'2025-08-02 06:03:20',268435458,'submission.event.general.metadataUpdated',0),
(292,1048585,20,36,'2025-08-02 06:03:20',268435458,'submission.event.general.metadataUpdated',0),
(293,515,44,36,'2025-08-02 06:03:33',1342177281,'submission.event.fileUploaded',0),
(294,1048585,20,36,'2025-08-02 06:03:33',1342177288,'submission.event.fileRevised',0),
(295,515,44,36,'2025-08-02 06:03:34',1342177296,'submission.event.fileEdited',0),
(296,1048585,20,36,'2025-08-02 06:03:34',268435458,'submission.event.general.metadataUpdated',0),
(297,1048585,20,36,'2025-08-02 06:04:52',268435457,'submission.event.submissionSubmitted',0),
(298,1048585,20,3,'2025-08-02 06:05:29',805306371,'editor.submission.decision.sendExternalReview.log',0),
(299,515,45,3,'2025-08-02 06:05:29',1342177281,'submission.event.fileUploaded',0),
(300,1048585,20,3,'2025-08-02 06:05:29',1342177288,'submission.event.fileRevised',0),
(301,1048585,20,3,'2025-08-02 06:05:42',1073741825,'log.review.reviewerAssigned',0),
(302,1048585,20,3,'2025-08-02 06:05:54',1073741825,'log.review.reviewerAssigned',0),
(303,1048585,20,3,'2025-08-02 06:06:06',1073741825,'log.review.reviewerAssigned',0),
(304,1048585,20,3,'2025-08-02 06:06:20',1073741825,'log.review.reviewerAssigned',0),
(305,1048585,20,3,'2025-08-02 06:06:31',1073741825,'log.review.reviewerAssigned',0),
(306,1048585,20,3,'2025-08-02 06:06:44',1073741825,'log.review.reviewerAssigned',0),
(307,1048585,20,3,'2025-08-02 06:06:58',1073741825,'log.review.reviewerAssigned',0),
(308,1048585,20,3,'2025-08-02 06:07:10',1073741825,'log.review.reviewerAssigned',0),
(309,1048585,20,3,'2025-08-02 06:07:23',1073741825,'log.review.reviewerAssigned',0);
/*!40000 ALTER TABLE `event_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `event_log_settings`
--

DROP TABLE IF EXISTS `event_log_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
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
) ENGINE=InnoDB AUTO_INCREMENT=1064 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='Data about an event log entry. This data is commonly used to display information about an event to a user.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `event_log_settings`
--

LOCK TABLES `event_log_settings` WRITE;
/*!40000 ALTER TABLE `event_log_settings` DISABLE KEYS */;
INSERT INTO `event_log_settings` VALUES
(1,3,'','fileId','1'),
(2,3,'en','filename','Signalling Theory Dividends: A Review Of The Literature And Empirical Evidence.pdf'),
(3,3,'','fileStage','2'),
(4,3,'','submissionFileId','1'),
(5,3,'','submissionId','1'),
(6,3,'','username','amwandenga'),
(7,4,'','fileId','1'),
(8,4,'en','filename','Signalling Theory Dividends: A Review Of The Literature And Empirical Evidence.pdf'),
(9,4,'','fileStage','2'),
(10,4,'','submissionFileId','1'),
(11,4,'','submissionId','1'),
(12,4,'','username','amwandenga'),
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
(115,23,'','fileId','6'),
(116,23,'en','filename','delete-this-file.pdf'),
(117,23,'','fileStage','2'),
(118,23,'','submissionFileId','6'),
(119,23,'','submissionId','1'),
(120,23,'','username','amwandenga'),
(121,25,'','editorName','Daniel Barnes'),
(122,26,'','fileId','5'),
(123,26,'en','filename','author-disclosure-form.docx'),
(124,26,'','fileStage','4'),
(125,26,'','sourceSubmissionFileId','5'),
(126,26,'','submissionFileId','7'),
(127,26,'','submissionId','1'),
(128,26,'','username','dbarnes'),
(129,27,'','fileId','5'),
(130,27,'en','filename','author-disclosure-form.docx'),
(131,27,'','fileStage','4'),
(132,27,'','sourceSubmissionFileId','5'),
(133,27,'','submissionFileId','7'),
(134,27,'','submissionId','1'),
(135,27,'','username','dbarnes'),
(136,28,'','fileId','4'),
(137,28,'en','filename','signalling-theory-dataset.pdf'),
(138,28,'','fileStage','4'),
(139,28,'','sourceSubmissionFileId','4'),
(140,28,'','submissionFileId','8'),
(141,28,'','submissionId','1'),
(142,28,'','username','dbarnes'),
(143,29,'','fileId','4'),
(144,29,'en','filename','signalling-theory-dataset.pdf'),
(145,29,'','fileStage','4'),
(146,29,'','sourceSubmissionFileId','4'),
(147,29,'','submissionFileId','8'),
(148,29,'','submissionId','1'),
(149,29,'','username','dbarnes'),
(150,30,'','fileId','3'),
(151,30,'en','filename','response-evaluation-all-team-members-draft-after-edits-final-version-final.ods'),
(152,30,'','fileStage','4'),
(153,30,'','sourceSubmissionFileId','3'),
(154,30,'','submissionFileId','9'),
(155,30,'','submissionId','1'),
(156,30,'','username','dbarnes'),
(157,31,'','fileId','3'),
(158,31,'en','filename','response-evaluation-all-team-members-draft-after-edits-final-version-final.ods'),
(159,31,'','fileStage','4'),
(160,31,'','sourceSubmissionFileId','3'),
(161,31,'','submissionFileId','9'),
(162,31,'','submissionId','1'),
(163,31,'','username','dbarnes'),
(164,32,'','fileId','2'),
(165,32,'en','filename','structured-interview-guide.odt'),
(166,32,'','fileStage','4'),
(167,32,'','sourceSubmissionFileId','2'),
(168,32,'','submissionFileId','10'),
(169,32,'','submissionId','1'),
(170,32,'','username','dbarnes'),
(171,33,'','fileId','2'),
(172,33,'en','filename','structured-interview-guide.odt'),
(173,33,'','fileStage','4'),
(174,33,'','sourceSubmissionFileId','2'),
(175,33,'','submissionFileId','10'),
(176,33,'','submissionId','1'),
(177,33,'','username','dbarnes'),
(178,34,'','fileId','1'),
(179,34,'en','filename','Signalling Theory Dividends: A Review Of The Literature And Empirical Evidence.pdf'),
(180,34,'','fileStage','4'),
(181,34,'','sourceSubmissionFileId','1'),
(182,34,'','submissionFileId','11'),
(183,34,'','submissionId','1'),
(184,34,'','username','dbarnes'),
(185,35,'','fileId','1'),
(186,35,'en','filename','Signalling Theory Dividends: A Review Of The Literature And Empirical Evidence.pdf'),
(187,35,'','fileStage','4'),
(188,35,'','sourceSubmissionFileId','1'),
(189,35,'','submissionFileId','11'),
(190,35,'','submissionId','1'),
(191,35,'','username','dbarnes'),
(192,36,'','reviewerName','Julie Janssen'),
(193,36,'','round','1'),
(194,36,'','stageId','3'),
(195,36,'','submissionId','1'),
(196,37,'','reviewerName','Aisla McCrae'),
(197,37,'','round','1'),
(198,37,'','stageId','3'),
(199,37,'','submissionId','1'),
(200,38,'','reviewerName','Adela Gallego'),
(201,38,'','round','1'),
(202,38,'','stageId','3'),
(203,38,'','submissionId','1'),
(204,39,'','editorName','Daniel Barnes'),
(205,40,'','userFullName','Sarah Vogt'),
(206,40,'en','userGroupName','Copyeditor'),
(207,40,'fr_CA','userGroupName','Réviseur-e'),
(208,40,'','username','svogt'),
(209,41,'','editorName','Daniel Barnes'),
(210,42,'','userFullName','Stephen Hellier'),
(211,42,'en','userGroupName','Layout Editor'),
(212,42,'fr_CA','userGroupName','Responsable de la mise en page'),
(213,42,'','username','shellier'),
(214,43,'','userFullName','Sabine Kumar'),
(215,43,'en','userGroupName','Proofreader'),
(216,43,'fr_CA','userGroupName','Correcteur-trice d\'épreuves'),
(217,43,'','username','skumar'),
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
(230,50,'','fileId','7'),
(231,50,'en','filename','article.pdf'),
(232,50,'','fileStage','10'),
(233,50,'','submissionFileId','12'),
(234,50,'','submissionId','1'),
(235,50,'','username','dbarnes'),
(236,51,'','userFullName','Alan Mwandenga'),
(237,51,'en','userGroupName','Author'),
(238,51,'fr_CA','userGroupName','Auteur-e'),
(239,51,'','username','amwandenga'),
(240,63,'','userFullName','Stephanie Berardo'),
(241,63,'en','userGroupName','Section editor'),
(242,63,'fr_CA','userGroupName','Rédacteur-trice de rubrique'),
(243,63,'','username','sberardo'),
(244,64,'','userFullName','Stephanie Berardo'),
(245,64,'en','userGroupName','Section editor'),
(246,64,'fr_CA','userGroupName','Rédacteur-trice de rubrique'),
(247,64,'','username','sberardo'),
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
(260,69,'','fileId','8'),
(261,69,'en','filename','The influence of lactation on the quantity and quality of cashmere production.pdf'),
(262,69,'','fileStage','2'),
(263,69,'','submissionFileId','13'),
(264,69,'','submissionId','2'),
(265,69,'','username','ccorino'),
(266,71,'','editorName','Daniel Barnes'),
(267,72,'','fileId','8'),
(268,72,'en','filename','The influence of lactation on the quantity and quality of cashmere production.pdf'),
(269,72,'','fileStage','4'),
(270,72,'','sourceSubmissionFileId','13'),
(271,72,'','submissionFileId','14'),
(272,72,'','submissionId','2'),
(273,72,'','username','dbarnes'),
(274,73,'','fileId','8'),
(275,73,'en','filename','The influence of lactation on the quantity and quality of cashmere production.pdf'),
(276,73,'','fileStage','4'),
(277,73,'','sourceSubmissionFileId','13'),
(278,73,'','submissionFileId','14'),
(279,73,'','submissionId','2'),
(280,73,'','username','dbarnes'),
(281,74,'','userFullName','Minoti Inoue'),
(282,74,'en','userGroupName','Section editor'),
(283,74,'fr_CA','userGroupName','Rédacteur-trice de rubrique'),
(284,74,'','username','minoue'),
(285,76,'','editorName','Minoti Inoue'),
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
(298,81,'','fileId','9'),
(299,81,'en','filename','The Facets Of Job Satisfaction: A Nine-Nation Comparative Study Of Construct Equivalence.pdf'),
(300,81,'','fileStage','2'),
(301,81,'','submissionFileId','15'),
(302,81,'','submissionId','3'),
(303,81,'','username','ckwantes'),
(304,83,'','editorName','Daniel Barnes'),
(305,84,'','fileId','9'),
(306,84,'en','filename','The Facets Of Job Satisfaction: A Nine-Nation Comparative Study Of Construct Equivalence.pdf'),
(307,84,'','fileStage','4'),
(308,84,'','sourceSubmissionFileId','15'),
(309,84,'','submissionFileId','16'),
(310,84,'','submissionId','3'),
(311,84,'','username','dbarnes'),
(312,85,'','fileId','9'),
(313,85,'en','filename','The Facets Of Job Satisfaction: A Nine-Nation Comparative Study Of Construct Equivalence.pdf'),
(314,85,'','fileStage','4'),
(315,85,'','sourceSubmissionFileId','15'),
(316,85,'','submissionFileId','16'),
(317,85,'','submissionId','3'),
(318,85,'','username','dbarnes'),
(319,86,'','reviewerName','Aisla McCrae'),
(320,86,'','round','1'),
(321,86,'','stageId','3'),
(322,86,'','submissionId','3'),
(323,87,'','reviewerName','Adela Gallego'),
(324,87,'','round','1'),
(325,87,'','stageId','3'),
(326,87,'','submissionId','3'),
(327,88,'','editorName','Daniel Barnes'),
(328,89,'','userFullName','Maria Fritz'),
(329,89,'en','userGroupName','Copyeditor'),
(330,89,'fr_CA','userGroupName','Réviseur-e'),
(331,89,'','username','mfritz'),
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
(344,94,'','fileId','10'),
(345,94,'en','filename','Computer Skill Requirements for New and Existing Teachers: Implications for Policy and Practice.pdf'),
(346,94,'','fileStage','2'),
(347,94,'','submissionFileId','17'),
(348,94,'','submissionId','4'),
(349,94,'','username','cmontgomerie'),
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
(362,100,'','fileId','11'),
(363,100,'en','filename','Genetic transformation of forest trees.pdf'),
(364,100,'','fileStage','2'),
(365,100,'','submissionFileId','18'),
(366,100,'','submissionId','5'),
(367,100,'','username','ddiouf'),
(368,102,'','editorName','Daniel Barnes'),
(369,103,'','fileId','11'),
(370,103,'en','filename','Genetic transformation of forest trees.pdf'),
(371,103,'','fileStage','4'),
(372,103,'','sourceSubmissionFileId','18'),
(373,103,'','submissionFileId','19'),
(374,103,'','submissionId','5'),
(375,103,'','username','dbarnes'),
(376,104,'','fileId','11'),
(377,104,'en','filename','Genetic transformation of forest trees.pdf'),
(378,104,'','fileStage','4'),
(379,104,'','sourceSubmissionFileId','18'),
(380,104,'','submissionFileId','19'),
(381,104,'','submissionId','5'),
(382,104,'','username','dbarnes'),
(383,105,'','reviewerName','Paul Hudson'),
(384,105,'','round','1'),
(385,105,'','stageId','3'),
(386,105,'','submissionId','5'),
(387,106,'','reviewerName','Adela Gallego'),
(388,106,'','round','1'),
(389,106,'','stageId','3'),
(390,106,'','submissionId','5'),
(391,107,'','editorName','Daniel Barnes'),
(392,108,'','userFullName','Maria Fritz'),
(393,108,'en','userGroupName','Copyeditor'),
(394,108,'fr_CA','userGroupName','Réviseur-e'),
(395,108,'','username','mfritz'),
(396,109,'','editorName','Daniel Barnes'),
(397,110,'','userFullName','Graham Cox'),
(398,110,'en','userGroupName','Layout Editor'),
(399,110,'fr_CA','userGroupName','Responsable de la mise en page'),
(400,110,'','username','gcox'),
(401,111,'','userFullName','Catherine Turner'),
(402,111,'en','userGroupName','Proofreader'),
(403,111,'fr_CA','userGroupName','Correcteur-trice d\'épreuves'),
(404,111,'','username','cturner'),
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
(417,116,'','fileId','12'),
(418,116,'en','filename','Investigating the Shared Background Required for Argument: A Critique of Fogelin\'s Thesis on Deep Disagreement.pdf'),
(419,116,'','fileStage','2'),
(420,116,'','submissionFileId','20'),
(421,116,'','submissionId','6'),
(422,116,'','username','dphillips'),
(423,118,'','editorName','Daniel Barnes'),
(424,119,'','fileId','12'),
(425,119,'en','filename','Investigating the Shared Background Required for Argument: A Critique of Fogelin\'s Thesis on Deep Disagreement.pdf'),
(426,119,'','fileStage','4'),
(427,119,'','sourceSubmissionFileId','20'),
(428,119,'','submissionFileId','21'),
(429,119,'','submissionId','6'),
(430,119,'','username','dbarnes'),
(431,120,'','fileId','12'),
(432,120,'en','filename','Investigating the Shared Background Required for Argument: A Critique of Fogelin\'s Thesis on Deep Disagreement.pdf'),
(433,120,'','fileStage','4'),
(434,120,'','sourceSubmissionFileId','20'),
(435,120,'','submissionFileId','21'),
(436,120,'','submissionId','6'),
(437,120,'','username','dbarnes'),
(438,121,'','reviewerName','Julie Janssen'),
(439,121,'','round','1'),
(440,121,'','stageId','3'),
(441,121,'','submissionId','6'),
(442,122,'','reviewerName','Adela Gallego'),
(443,122,'','round','1'),
(444,122,'','stageId','3'),
(445,122,'','submissionId','6'),
(446,123,'','editorName','Daniel Barnes'),
(447,124,'','userFullName','Maria Fritz'),
(448,124,'en','userGroupName','Copyeditor'),
(449,124,'fr_CA','userGroupName','Réviseur-e'),
(450,124,'','username','mfritz'),
(451,125,'','editorName','Daniel Barnes'),
(452,126,'','userFullName','Graham Cox'),
(453,126,'en','userGroupName','Layout Editor'),
(454,126,'fr_CA','userGroupName','Responsable de la mise en page'),
(455,126,'','username','gcox'),
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
(468,131,'','fileId','13'),
(469,131,'en','filename','Developing efficacy beliefs in the classroom.pdf'),
(470,131,'','fileStage','2'),
(471,131,'','submissionFileId','22'),
(472,131,'','submissionId','7'),
(473,131,'','username','dsokoloff'),
(474,133,'','editorName','Daniel Barnes'),
(475,134,'','fileId','13'),
(476,134,'en','filename','Developing efficacy beliefs in the classroom.pdf'),
(477,134,'','fileStage','4'),
(478,134,'','sourceSubmissionFileId','22'),
(479,134,'','submissionFileId','23'),
(480,134,'','submissionId','7'),
(481,134,'','username','dbarnes'),
(482,135,'','fileId','13'),
(483,135,'en','filename','Developing efficacy beliefs in the classroom.pdf'),
(484,135,'','fileStage','4'),
(485,135,'','sourceSubmissionFileId','22'),
(486,135,'','submissionFileId','23'),
(487,135,'','submissionId','7'),
(488,135,'','username','dbarnes'),
(489,136,'','reviewerName','Paul Hudson'),
(490,136,'','round','1'),
(491,136,'','stageId','3'),
(492,136,'','submissionId','7'),
(493,137,'','reviewerName','Aisla McCrae'),
(494,137,'','round','1'),
(495,137,'','stageId','3'),
(496,137,'','submissionId','7'),
(497,138,'','reviewerName','Adela Gallego'),
(498,138,'','round','1'),
(499,138,'','stageId','3'),
(500,138,'','submissionId','7'),
(501,139,'','reviewAssignmentId','10'),
(502,139,'','reviewerName','Paul Hudson'),
(503,139,'','round','1'),
(504,139,'','submissionId','7'),
(505,140,'','reviewAssignmentId','10'),
(506,140,'','reviewerName','Paul Hudson'),
(507,140,'','round','1'),
(508,140,'','submissionId','7'),
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
(521,145,'','fileId','14'),
(522,145,'en','filename','Traditions and Trends in the Study of the Commons.pdf'),
(523,145,'','fileStage','2'),
(524,145,'','submissionFileId','24'),
(525,145,'','submissionId','8'),
(526,145,'','username','eostrom'),
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
(539,151,'','fileId','15'),
(540,151,'en','filename','Hansen & Pinto: Reason Reclaimed.pdf'),
(541,151,'','fileStage','2'),
(542,151,'','submissionFileId','25'),
(543,151,'','submissionId','9'),
(544,151,'','username','fpaglieri'),
(545,153,'','editorName','Daniel Barnes'),
(546,154,'','fileId','15'),
(547,154,'en','filename','Hansen & Pinto: Reason Reclaimed.pdf'),
(548,154,'','fileStage','4'),
(549,154,'','sourceSubmissionFileId','25'),
(550,154,'','submissionFileId','26'),
(551,154,'','submissionId','9'),
(552,154,'','username','dbarnes'),
(553,155,'','fileId','15'),
(554,155,'en','filename','Hansen & Pinto: Reason Reclaimed.pdf'),
(555,155,'','fileStage','4'),
(556,155,'','sourceSubmissionFileId','25'),
(557,155,'','submissionFileId','26'),
(558,155,'','submissionId','9'),
(559,155,'','username','dbarnes'),
(560,156,'','reviewerName','Julie Janssen'),
(561,156,'','round','1'),
(562,156,'','stageId','3'),
(563,156,'','submissionId','9'),
(564,157,'','reviewerName','Adela Gallego'),
(565,157,'','round','1'),
(566,157,'','stageId','3'),
(567,157,'','submissionId','9'),
(568,158,'','editorName','Daniel Barnes'),
(569,159,'','userFullName','Sarah Vogt'),
(570,159,'en','userGroupName','Copyeditor'),
(571,159,'fr_CA','userGroupName','Réviseur-e'),
(572,159,'','username','svogt'),
(573,160,'','editorName','Daniel Barnes'),
(574,161,'','userFullName','Stephen Hellier'),
(575,161,'en','userGroupName','Layout Editor'),
(576,161,'fr_CA','userGroupName','Responsable de la mise en page'),
(577,161,'','username','shellier'),
(578,162,'','userFullName','Sabine Kumar'),
(579,162,'en','userGroupName','Proofreader'),
(580,162,'fr_CA','userGroupName','Correcteur-trice d\'épreuves'),
(581,162,'','username','skumar'),
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
(594,167,'','fileId','16'),
(595,167,'en','filename','Condensing Water Availability Models to Focus on Specific Water Management Systems.pdf'),
(596,167,'','fileStage','2'),
(597,167,'','submissionFileId','27'),
(598,167,'','submissionId','10'),
(599,167,'','username','jnovak'),
(600,169,'','editorName','Daniel Barnes'),
(601,170,'','fileId','16'),
(602,170,'en','filename','Condensing Water Availability Models to Focus on Specific Water Management Systems.pdf'),
(603,170,'','fileStage','4'),
(604,170,'','sourceSubmissionFileId','27'),
(605,170,'','submissionFileId','28'),
(606,170,'','submissionId','10'),
(607,170,'','username','dbarnes'),
(608,171,'','fileId','16'),
(609,171,'en','filename','Condensing Water Availability Models to Focus on Specific Water Management Systems.pdf'),
(610,171,'','fileStage','4'),
(611,171,'','sourceSubmissionFileId','27'),
(612,171,'','submissionFileId','28'),
(613,171,'','submissionId','10'),
(614,171,'','username','dbarnes'),
(615,172,'','reviewerName','Aisla McCrae'),
(616,172,'','round','1'),
(617,172,'','stageId','3'),
(618,172,'','submissionId','10'),
(619,173,'','reviewerName','Adela Gallego'),
(620,173,'','round','1'),
(621,173,'','stageId','3'),
(622,173,'','submissionId','10'),
(623,174,'','reviewAssignmentId','15'),
(624,174,'','reviewerName','Aisla McCrae'),
(625,174,'','round','1'),
(626,174,'','submissionId','10'),
(627,175,'','reviewAssignmentId','15'),
(628,175,'','reviewerName','Aisla McCrae'),
(629,175,'','round','1'),
(630,175,'','submissionId','10'),
(631,176,'','reviewAssignmentId','16'),
(632,176,'','reviewerName','Adela Gallego'),
(633,176,'','round','1'),
(634,176,'','submissionId','10'),
(635,177,'','reviewAssignmentId','16'),
(636,177,'','reviewerName','Adela Gallego'),
(637,177,'','round','1'),
(638,177,'','submissionId','10'),
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
(651,182,'','fileId','17'),
(652,182,'en','filename','Learning Sustainable Design through Service.pdf'),
(653,182,'','fileStage','2'),
(654,182,'','submissionFileId','29'),
(655,182,'','submissionId','11'),
(656,182,'','username','kalkhafaji'),
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
(669,188,'','fileId','18'),
(670,188,'en','filename','Sodium butyrate improves growth performance of weaned piglets during the first period after weaning.pdf'),
(671,188,'','fileStage','2'),
(672,188,'','submissionFileId','30'),
(673,188,'','submissionId','12'),
(674,188,'','username','lchristopher'),
(675,190,'','editorName','Daniel Barnes'),
(676,191,'','fileId','18'),
(677,191,'en','filename','Sodium butyrate improves growth performance of weaned piglets during the first period after weaning.pdf'),
(678,191,'','fileStage','4'),
(679,191,'','sourceSubmissionFileId','30'),
(680,191,'','submissionFileId','31'),
(681,191,'','submissionId','12'),
(682,191,'','username','dbarnes'),
(683,192,'','fileId','18'),
(684,192,'en','filename','Sodium butyrate improves growth performance of weaned piglets during the first period after weaning.pdf'),
(685,192,'','fileStage','4'),
(686,192,'','sourceSubmissionFileId','30'),
(687,192,'','submissionFileId','31'),
(688,192,'','submissionId','12'),
(689,192,'','username','dbarnes'),
(690,193,'','reviewerName','Julie Janssen'),
(691,193,'','round','1'),
(692,193,'','stageId','3'),
(693,193,'','submissionId','12'),
(694,194,'','reviewerName','Paul Hudson'),
(695,194,'','round','1'),
(696,194,'','stageId','3'),
(697,194,'','submissionId','12'),
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
(710,199,'','fileId','19'),
(711,199,'en','filename','Hydrologic Connectivity in the Edwards Aquifer between San Marcos Springs and Barton Springs during 2009 Drought Conditions.pdf'),
(712,199,'','fileStage','2'),
(713,199,'','submissionFileId','32'),
(714,199,'','submissionId','13'),
(715,199,'','username','lkumiega'),
(716,201,'','editorName','Daniel Barnes'),
(717,202,'','fileId','19'),
(718,202,'en','filename','Hydrologic Connectivity in the Edwards Aquifer between San Marcos Springs and Barton Springs during 2009 Drought Conditions.pdf'),
(719,202,'','fileStage','4'),
(720,202,'','sourceSubmissionFileId','32'),
(721,202,'','submissionFileId','33'),
(722,202,'','submissionId','13'),
(723,202,'','username','dbarnes'),
(724,203,'','fileId','19'),
(725,203,'en','filename','Hydrologic Connectivity in the Edwards Aquifer between San Marcos Springs and Barton Springs during 2009 Drought Conditions.pdf'),
(726,203,'','fileStage','4'),
(727,203,'','sourceSubmissionFileId','32'),
(728,203,'','submissionFileId','33'),
(729,203,'','submissionId','13'),
(730,203,'','username','dbarnes'),
(731,204,'','reviewerName','Julie Janssen'),
(732,204,'','round','1'),
(733,204,'','stageId','3'),
(734,204,'','submissionId','13'),
(735,205,'','reviewerName','Aisla McCrae'),
(736,205,'','round','1'),
(737,205,'','stageId','3'),
(738,205,'','submissionId','13'),
(739,206,'','reviewerName','Adela Gallego'),
(740,206,'','round','1'),
(741,206,'','stageId','3'),
(742,206,'','submissionId','13'),
(743,207,'','reviewAssignmentId','19'),
(744,207,'','reviewerName','Julie Janssen'),
(745,207,'','round','1'),
(746,207,'','submissionId','13'),
(747,208,'','reviewAssignmentId','19'),
(748,208,'','reviewerName','Julie Janssen'),
(749,208,'','round','1'),
(750,208,'','submissionId','13'),
(751,209,'','reviewAssignmentId','20'),
(752,209,'','reviewerName','Aisla McCrae'),
(753,209,'','round','1'),
(754,209,'','submissionId','13'),
(755,210,'','reviewAssignmentId','20'),
(756,210,'','reviewerName','Aisla McCrae'),
(757,210,'','round','1'),
(758,210,'','submissionId','13'),
(759,211,'','reviewAssignmentId','21'),
(760,211,'','reviewerName','Adela Gallego'),
(761,211,'','round','1'),
(762,211,'','submissionId','13'),
(763,212,'','reviewAssignmentId','21'),
(764,212,'','reviewerName','Adela Gallego'),
(765,212,'','round','1'),
(766,212,'','submissionId','13'),
(767,213,'','editorName','Daniel Barnes'),
(768,214,'','recipientCount','3'),
(769,214,'','subject','Thank you for your review'),
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
(782,219,'','fileId','20'),
(783,219,'en','filename','Towards Designing an Intercultural Curriculum: A Case Study from the Atlantic Coast of Nicaragua.pdf'),
(784,219,'','fileStage','2'),
(785,219,'','submissionFileId','34'),
(786,219,'','submissionId','14'),
(787,219,'','username','pdaniel'),
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
(800,225,'','fileId','21'),
(801,225,'en','filename','Yam diseases and its management in Nigeria.pdf'),
(802,225,'','fileStage','2'),
(803,225,'','submissionFileId','35'),
(804,225,'','submissionId','15'),
(805,225,'','username','rbaiyewu'),
(806,227,'','editorName','Daniel Barnes'),
(807,228,'','fileId','21'),
(808,228,'en','filename','Yam diseases and its management in Nigeria.pdf'),
(809,228,'','fileStage','4'),
(810,228,'','sourceSubmissionFileId','35'),
(811,228,'','submissionFileId','36'),
(812,228,'','submissionId','15'),
(813,228,'','username','dbarnes'),
(814,229,'','fileId','21'),
(815,229,'en','filename','Yam diseases and its management in Nigeria.pdf'),
(816,229,'','fileStage','4'),
(817,229,'','sourceSubmissionFileId','35'),
(818,229,'','submissionFileId','36'),
(819,229,'','submissionId','15'),
(820,229,'','username','dbarnes'),
(821,230,'','reviewerName','Paul Hudson'),
(822,230,'','round','1'),
(823,230,'','stageId','3'),
(824,230,'','submissionId','15'),
(825,231,'','reviewerName','Aisla McCrae'),
(826,231,'','round','1'),
(827,231,'','stageId','3'),
(828,231,'','submissionId','15'),
(829,232,'','editorName','Daniel Barnes'),
(830,233,'','userFullName','Sarah Vogt'),
(831,233,'en','userGroupName','Copyeditor'),
(832,233,'fr_CA','userGroupName','Réviseur-e'),
(833,233,'','username','svogt'),
(834,234,'','editorName','Daniel Barnes'),
(835,235,'','userFullName','Stephen Hellier'),
(836,235,'en','userGroupName','Layout Editor'),
(837,235,'fr_CA','userGroupName','Responsable de la mise en page'),
(838,235,'','username','shellier'),
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
(851,240,'','fileId','22'),
(852,240,'en','filename','Influence of long-term nutrition with different dietary fats on fatty acid composition of heavy pigs backfat.pdf'),
(853,240,'','fileStage','2'),
(854,240,'','submissionFileId','37'),
(855,240,'','submissionId','16'),
(856,240,'','username','rrossi'),
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
(869,246,'','fileId','23'),
(870,246,'en','filename','Antimicrobial, heavy metal resistance and plasmid profile of coliforms isolated from nosocomial infections in a hospital in Isfahan, Iran.pdf'),
(871,246,'','fileStage','2'),
(872,246,'','submissionFileId','38'),
(873,246,'','submissionId','17'),
(874,246,'','username','vkarbasizaed'),
(875,248,'','editorName','Daniel Barnes'),
(876,249,'','fileId','23'),
(877,249,'en','filename','Antimicrobial, heavy metal resistance and plasmid profile of coliforms isolated from nosocomial infections in a hospital in Isfahan, Iran.pdf'),
(878,249,'','fileStage','4'),
(879,249,'','sourceSubmissionFileId','38'),
(880,249,'','submissionFileId','39'),
(881,249,'','submissionId','17'),
(882,249,'','username','dbarnes'),
(883,250,'','fileId','23'),
(884,250,'en','filename','Antimicrobial, heavy metal resistance and plasmid profile of coliforms isolated from nosocomial infections in a hospital in Isfahan, Iran.pdf'),
(885,250,'','fileStage','4'),
(886,250,'','sourceSubmissionFileId','38'),
(887,250,'','submissionFileId','39'),
(888,250,'','submissionId','17'),
(889,250,'','username','dbarnes'),
(890,251,'','reviewerName','Julie Janssen'),
(891,251,'','round','1'),
(892,251,'','stageId','3'),
(893,251,'','submissionId','17'),
(894,252,'','reviewerName','Paul Hudson'),
(895,252,'','round','1'),
(896,252,'','stageId','3'),
(897,252,'','submissionId','17'),
(898,253,'','editorName','Daniel Barnes'),
(899,254,'','userFullName','Maria Fritz'),
(900,254,'en','userGroupName','Copyeditor'),
(901,254,'fr_CA','userGroupName','Réviseur-e'),
(902,254,'','username','mfritz'),
(903,255,'','editorName','Daniel Barnes'),
(904,256,'','userFullName','Graham Cox'),
(905,256,'en','userGroupName','Layout Editor'),
(906,256,'fr_CA','userGroupName','Responsable de la mise en page'),
(907,256,'','username','gcox'),
(908,257,'','userFullName','Catherine Turner'),
(909,257,'en','userGroupName','Proofreader'),
(910,257,'fr_CA','userGroupName','Correcteur-trice d\'épreuves'),
(911,257,'','username','cturner'),
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
(924,260,'','fileId','24'),
(925,260,'en','filename','article.pdf'),
(926,260,'','fileStage','10'),
(927,260,'','submissionFileId','40'),
(928,260,'','submissionId','17'),
(929,260,'','username','dbarnes'),
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
(942,275,'','fileId','25'),
(943,275,'en','filename','Self-Organization in Multi-Level Institutions in Networked Environments.pdf'),
(944,275,'','fileStage','2'),
(945,275,'','submissionFileId','41'),
(946,275,'','submissionId','18'),
(947,275,'','username','vwilliamson'),
(948,277,'','editorName','Daniel Barnes'),
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
(961,282,'','fileId','26'),
(962,282,'en','filename','Finocchiaro: Arguments About Arguments.pdf'),
(963,282,'','fileStage','2'),
(964,282,'','submissionFileId','42'),
(965,282,'','submissionId','19'),
(966,282,'','username','zwoods'),
(967,284,'','editorName','Daniel Barnes'),
(968,285,'','fileId','26'),
(969,285,'en','filename','Finocchiaro: Arguments About Arguments.pdf'),
(970,285,'','fileStage','4'),
(971,285,'','sourceSubmissionFileId','42'),
(972,285,'','submissionFileId','43'),
(973,285,'','submissionId','19'),
(974,285,'','username','dbarnes'),
(975,286,'','fileId','26'),
(976,286,'en','filename','Finocchiaro: Arguments About Arguments.pdf'),
(977,286,'','fileStage','4'),
(978,286,'','sourceSubmissionFileId','42'),
(979,286,'','submissionFileId','43'),
(980,286,'','submissionId','19'),
(981,286,'','username','dbarnes'),
(982,287,'','reviewerName','Paul Hudson'),
(983,287,'','round','1'),
(984,287,'','stageId','3'),
(985,287,'','submissionId','19'),
(986,288,'','reviewerName','Aisla McCrae'),
(987,288,'','round','1'),
(988,288,'','stageId','3'),
(989,288,'','submissionId','19'),
(990,289,'','editorName','Daniel Barnes'),
(991,290,'','userFullName','Sarah Vogt'),
(992,290,'en','userGroupName','Copyeditor'),
(993,290,'fr_CA','userGroupName','Réviseur-e'),
(994,290,'','username','svogt'),
(995,293,'','fileId','27'),
(996,293,'en','filename','Transformative Impact of AI Tools on Modern Education: Opportunities, Challenges, and Future Directions.pdf'),
(997,293,'','fileStage','2'),
(998,293,'','submissionFileId','44'),
(999,293,'','submissionId','20'),
(1000,293,'','username','zzedd'),
(1001,294,'','fileId','27'),
(1002,294,'en','filename','Transformative Impact of AI Tools on Modern Education: Opportunities, Challenges, and Future Directions.pdf'),
(1003,294,'','fileStage','2'),
(1004,294,'','submissionFileId','44'),
(1005,294,'','submissionId','20'),
(1006,294,'','username','zzedd'),
(1007,295,'','fileId','27'),
(1008,295,'en','filename','Transformative Impact of AI Tools on Modern Education: Opportunities, Challenges, and Future Directions.pdf'),
(1009,295,'','fileStage','2'),
(1010,295,'','submissionFileId','44'),
(1011,295,'','submissionId','20'),
(1012,295,'','username','zzedd'),
(1013,298,'','editorName','Daniel Barnes'),
(1014,299,'','fileId','27'),
(1015,299,'en','filename','Transformative Impact of AI Tools on Modern Education: Opportunities, Challenges, and Future Directions.pdf'),
(1016,299,'','fileStage','4'),
(1017,299,'','sourceSubmissionFileId','44'),
(1018,299,'','submissionFileId','45'),
(1019,299,'','submissionId','20'),
(1020,299,'','username','dbarnes'),
(1021,300,'','fileId','27'),
(1022,300,'en','filename','Transformative Impact of AI Tools on Modern Education: Opportunities, Challenges, and Future Directions.pdf'),
(1023,300,'','fileStage','4'),
(1024,300,'','sourceSubmissionFileId','44'),
(1025,300,'','submissionFileId','45'),
(1026,300,'','submissionId','20'),
(1027,300,'','username','dbarnes'),
(1028,301,'','reviewerName','Jhon Doe'),
(1029,301,'','round','1'),
(1030,301,'','stageId','3'),
(1031,301,'','submissionId','20'),
(1032,302,'','reviewerName','Lisset Von'),
(1033,302,'','round','1'),
(1034,302,'','stageId','3'),
(1035,302,'','submissionId','20'),
(1036,303,'','reviewerName','Julie Janssen'),
(1037,303,'','round','1'),
(1038,303,'','stageId','3'),
(1039,303,'','submissionId','20'),
(1040,304,'','reviewerName','Paul Hudson'),
(1041,304,'','round','1'),
(1042,304,'','stageId','3'),
(1043,304,'','submissionId','20'),
(1044,305,'','reviewerName','Sabine Kumar'),
(1045,305,'','round','1'),
(1046,305,'','stageId','3'),
(1047,305,'','submissionId','20'),
(1048,306,'','reviewerName','Stephen Hellier'),
(1049,306,'','round','1'),
(1050,306,'','stageId','3'),
(1051,306,'','submissionId','20'),
(1052,307,'','reviewerName','Rajek Sharif'),
(1053,307,'','round','1'),
(1054,307,'','stageId','3'),
(1055,307,'','submissionId','20'),
(1056,308,'','reviewerName','Catherine Turner'),
(1057,308,'','round','1'),
(1058,308,'','stageId','3'),
(1059,308,'','submissionId','20'),
(1060,309,'','reviewerName','Aisla McCrae'),
(1061,309,'','round','1'),
(1062,309,'','stageId','3'),
(1063,309,'','submissionId','20');
/*!40000 ALTER TABLE `event_log_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
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
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `files` (
  `file_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `path` varchar(255) NOT NULL,
  `mimetype` varchar(255) NOT NULL,
  PRIMARY KEY (`file_id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='Records information in the database about files tracked by the system, linking them to the local filesystem.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `files`
--

LOCK TABLES `files` WRITE;
/*!40000 ALTER TABLE `files` DISABLE KEYS */;
INSERT INTO `files` VALUES
(1,'journals/1/articles/1/688da6f3d763a.pdf','application/pdf'),
(2,'journals/1/articles/1/688da6f50e6e1.odt','application/vnd.oasis.opendocument.text'),
(3,'journals/1/articles/1/688da6f624281.ods','application/vnd.oasis.opendocument.spreadsheet'),
(4,'journals/1/articles/1/688da6f73ed42.pdf','application/vnd.openxmlformats-officedocument.spreadsheetml.sheet'),
(5,'journals/1/articles/1/688da6f86b523.docx','application/vnd.openxmlformats-officedocument.wordprocessingml.document'),
(7,'journals/1/articles/1/688da794898af.pdf','application/pdf'),
(8,'journals/1/articles/2/688da7f9251aa.pdf','application/pdf'),
(9,'journals/1/articles/3/688da815e6099.pdf','application/pdf'),
(10,'journals/1/articles/4/688da8307a317.pdf','application/pdf'),
(11,'journals/1/articles/5/688da839b3d33.pdf','application/pdf'),
(12,'journals/1/articles/6/688da85f039f7.pdf','application/pdf'),
(13,'journals/1/articles/7/688da882327bc.pdf','application/pdf'),
(14,'journals/1/articles/8/688da8a0d42da.pdf','application/pdf'),
(15,'journals/1/articles/9/688da8aa12b28.pdf','application/pdf'),
(16,'journals/1/articles/10/688da8d179d6e.pdf','application/pdf'),
(17,'journals/1/articles/11/688da8f45f497.pdf','application/pdf'),
(18,'journals/1/articles/12/688da8fd649cd.pdf','application/pdf'),
(19,'journals/1/articles/13/688da914105eb.pdf','application/pdf'),
(20,'journals/1/articles/14/688da94c6675e.pdf','application/pdf'),
(21,'journals/1/articles/15/688da954ca45b.pdf','application/pdf'),
(22,'journals/1/articles/16/688da97ccabae.pdf','application/pdf'),
(23,'journals/1/articles/17/688da98533828.pdf','application/pdf'),
(24,'journals/1/articles/17/688da9adb7948.pdf','application/pdf'),
(25,'journals/1/articles/18/688da9ec3f9bf.pdf','application/pdf'),
(26,'journals/1/articles/19/688da9ffaa590.pdf','application/pdf'),
(27,'journals/1/articles/20/688daa35beef4.pdf','application/pdf');
/*!40000 ALTER TABLE `files` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `filter_groups`
--

DROP TABLE IF EXISTS `filter_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
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
(1,'issue=>crossref-xml','plugins.importexport.crossref.displayName','plugins.importexport.crossref.description','class::classes.issue.Issue[]','xml::schema(https://www.crossref.org/schemas/crossref5.4.0.xsd)'),
(2,'article=>crossref-xml','plugins.importexport.crossref.displayName','plugins.importexport.crossref.description','class::classes.submission.Submission[]','xml::schema(https://www.crossref.org/schemas/crossref5.4.0.xsd)'),
(3,'issue=>datacite-xml','plugins.importexport.datacite.displayName','plugins.importexport.datacite.description','class::classes.issue.Issue','xml::schema(http://schema.datacite.org/meta/kernel-4/metadata.xsd)'),
(4,'article=>datacite-xml','plugins.importexport.datacite.displayName','plugins.importexport.datacite.description','class::classes.submission.Submission','xml::schema(http://schema.datacite.org/meta/kernel-4/metadata.xsd)'),
(5,'galley=>datacite-xml','plugins.importexport.datacite.displayName','plugins.importexport.datacite.description','class::lib.pkp.classes.galley.Galley','xml::schema(http://schema.datacite.org/meta/kernel-4/metadata.xsd)'),
(6,'article=>dc11','plugins.metadata.dc11.articleAdapter.displayName','plugins.metadata.dc11.articleAdapter.description','class::classes.submission.Submission','metadata::APP\\plugins\\metadata\\dc11\\schema\\Dc11Schema(ARTICLE)'),
(7,'article=>native-xml','plugins.importexport.native.displayName','plugins.importexport.native.description','class::classes.submission.Submission[]','xml::schema(plugins/importexport/native/native.xsd)'),
(8,'native-xml=>article','plugins.importexport.native.displayName','plugins.importexport.native.description','xml::schema(plugins/importexport/native/native.xsd)','class::classes.submission.Submission[]'),
(9,'issue=>native-xml','plugins.importexport.native.displayName','plugins.importexport.native.description','class::classes.issue.Issue[]','xml::schema(plugins/importexport/native/native.xsd)'),
(10,'native-xml=>issue','plugins.importexport.native.displayName','plugins.importexport.native.description','xml::schema(plugins/importexport/native/native.xsd)','class::classes.issue.Issue[]'),
(11,'issuegalley=>native-xml','plugins.importexport.native.displayName','plugins.importexport.native.description','class::classes.issue.IssueGalley[]','xml::schema(plugins/importexport/native/native.xsd)'),
(12,'native-xml=>issuegalley','plugins.importexport.native.displayName','plugins.importexport.native.description','xml::schema(plugins/importexport/native/native.xsd)','class::classes.issue.IssueGalley[]'),
(13,'author=>native-xml','plugins.importexport.native.displayName','plugins.importexport.native.description','class::classes.author.Author[]','xml::schema(plugins/importexport/native/native.xsd)'),
(14,'native-xml=>author','plugins.importexport.native.displayName','plugins.importexport.native.description','xml::schema(plugins/importexport/native/native.xsd)','class::classes.author.Author[]'),
(15,'SubmissionFile=>native-xml','plugins.importexport.native.displayName','plugins.importexport.native.description','class::lib.pkp.classes.submissionFile.SubmissionFile','xml::schema(plugins/importexport/native/native.xsd)'),
(16,'native-xml=>SubmissionFile','plugins.importexport.native.displayName','plugins.importexport.native.description','xml::schema(plugins/importexport/native/native.xsd)','class::lib.pkp.classes.submissionFile.SubmissionFile[]'),
(17,'article-galley=>native-xml','plugins.importexport.native.displayName','plugins.importexport.native.description','class::lib.pkp.classes.galley.Galley','xml::schema(plugins/importexport/native/native.xsd)'),
(18,'native-xml=>ArticleGalley','plugins.importexport.native.displayName','plugins.importexport.native.description','xml::schema(plugins/importexport/native/native.xsd)','class::lib.pkp.classes.galley.Galley[]'),
(19,'publication=>native-xml','plugins.importexport.native.displayName','plugins.importexport.native.description','class::classes.publication.Publication','xml::schema(plugins/importexport/native/native.xsd)'),
(20,'native-xml=>Publication','plugins.importexport.native.displayName','plugins.importexport.native.description','xml::schema(plugins/importexport/native/native.xsd)','class::classes.publication.Publication[]'),
(21,'article=>pubmed-xml','plugins.importexport.pubmed.displayName','plugins.importexport.pubmed.description','class::classes.submission.Submission[]','xml::dtd'),
(22,'article=>doaj-xml','plugins.importexport.doaj.displayName','plugins.importexport.doaj.description','class::classes.submission.Submission[]','xml::schema(plugins/importexport/doaj/doajArticles.xsd)'),
(23,'article=>doaj-json','plugins.importexport.doaj.displayName','plugins.importexport.doaj.description','class::classes.submission.Submission','primitive::string'),
(24,'user=>user-xml','plugins.importexport.users.displayName','plugins.importexport.users.description','class::PKP\\user\\User[]','xml::schema(lib/pkp/plugins/importexport/users/pkp-users.xsd)'),
(25,'user-xml=>user','plugins.importexport.users.displayName','plugins.importexport.users.description','xml::schema(lib/pkp/plugins/importexport/users/pkp-users.xsd)','class::PKP\\user\\User[]'),
(26,'usergroup=>user-xml','plugins.importexport.users.displayName','plugins.importexport.users.description','class::PKP\\userGroup\\UserGroup[]','xml::schema(lib/pkp/plugins/importexport/users/pkp-users.xsd)'),
(27,'user-xml=>usergroup','plugins.importexport.native.displayName','plugins.importexport.native.description','xml::schema(lib/pkp/plugins/importexport/users/pkp-users.xsd)','class::PKP\\userGroup\\UserGroup[]');
/*!40000 ALTER TABLE `filter_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `filter_settings`
--

DROP TABLE IF EXISTS `filter_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
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
/*!40101 SET character_set_client = utf8mb4 */;
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
(1,1,NULL,'Crossref XML issue export','APP\\plugins\\generic\\crossref\\filter\\IssueCrossrefXmlFilter',0,NULL,0),
(2,2,NULL,'Crossref XML article export','APP\\plugins\\generic\\crossref\\filter\\ArticleCrossrefXmlFilter',0,NULL,0),
(3,3,NULL,'DataCite XML export','APP\\plugins\\generic\\datacite\\filter\\DataciteXmlFilter',0,NULL,0),
(4,4,NULL,'DataCite XML export','APP\\plugins\\generic\\datacite\\filter\\DataciteXmlFilter',0,NULL,0),
(5,5,NULL,'DataCite XML export','APP\\plugins\\generic\\datacite\\filter\\DataciteXmlFilter',0,NULL,0),
(6,6,NULL,'Extract metadata from a(n) Submission','APP\\plugins\\metadata\\dc11\\filter\\Dc11SchemaArticleAdapter',0,NULL,0),
(7,7,NULL,'Native XML submission export','APP\\plugins\\importexport\\native\\filter\\ArticleNativeXmlFilter',0,NULL,0),
(8,8,NULL,'Native XML submission import','APP\\plugins\\importexport\\native\\filter\\NativeXmlArticleFilter',0,NULL,0),
(9,9,NULL,'Native XML issue export','APP\\plugins\\importexport\\native\\filter\\IssueNativeXmlFilter',0,NULL,0),
(10,10,NULL,'Native XML issue import','APP\\plugins\\importexport\\native\\filter\\NativeXmlIssueFilter',0,NULL,0),
(11,11,NULL,'Native XML issue galley export','APP\\plugins\\importexport\\native\\filter\\IssueGalleyNativeXmlFilter',0,NULL,0),
(12,12,NULL,'Native XML issue galley import','APP\\plugins\\importexport\\native\\filter\\NativeXmlIssueGalleyFilter',0,NULL,0),
(13,13,NULL,'Native XML author export','APP\\plugins\\importexport\\native\\filter\\AuthorNativeXmlFilter',0,NULL,0),
(14,14,NULL,'Native XML author import','APP\\plugins\\importexport\\native\\filter\\NativeXmlAuthorFilter',0,NULL,0),
(15,16,NULL,'Native XML submission file import','APP\\plugins\\importexport\\native\\filter\\NativeXmlArticleFileFilter',0,NULL,0),
(16,15,NULL,'Native XML submission file export','PKP\\plugins\\importexport\\native\\filter\\SubmissionFileNativeXmlFilter',0,NULL,0),
(17,17,NULL,'Native XML representation export','APP\\plugins\\importexport\\native\\filter\\ArticleGalleyNativeXmlFilter',0,NULL,0),
(18,18,NULL,'Native XML representation import','APP\\plugins\\importexport\\native\\filter\\NativeXmlArticleGalleyFilter',0,NULL,0),
(19,19,NULL,'Native XML Publication export','APP\\plugins\\importexport\\native\\filter\\PublicationNativeXmlFilter',0,NULL,0),
(20,20,NULL,'Native XML publication import','APP\\plugins\\importexport\\native\\filter\\NativeXmlPublicationFilter',0,NULL,0),
(21,21,NULL,'APP\\plugins\\importexport\\pubmed\\filter\\ArticlePubMedXmlFilter','APP\\plugins\\importexport\\pubmed\\filter\\ArticlePubMedXmlFilter',0,NULL,0),
(22,22,NULL,'DOAJ XML export','APP\\plugins\\importexport\\doaj\\filter\\DOAJXmlFilter',0,NULL,0),
(23,23,NULL,'DOAJ JSON export','APP\\plugins\\importexport\\doaj\\filter\\DOAJJsonFilter',0,NULL,0),
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
/*!40101 SET character_set_client = utf8mb4 */;
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
/*!40101 SET character_set_client = utf8mb4 */;
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
/*!40101 SET character_set_client = utf8mb4 */;
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
/*!40101 SET character_set_client = utf8mb4 */;
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
/*!40101 SET character_set_client = utf8mb4 */;
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
/*!40101 SET character_set_client = utf8mb4 */;
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
/*!40101 SET character_set_client = utf8mb4 */;
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
/*!40101 SET character_set_client = utf8mb4 */;
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
/*!40101 SET character_set_client = utf8mb4 */;
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
(2,'$2y$10$Axfn2.y0Lt4UDpgaWc1K5.28ziVZyVErY32i32dnbYjAUI0y67YWK','userRoleAssignment',NULL,1,'2025-08-05 05:42:57','{\"orcid\":null,\"orcidAccessDenied\":null,\"orcidAccessExpiresOn\":null,\"orcidAccessScope\":null,\"orcidAccessToken\":null,\"orcidIsVerified\":null,\"orcidRefreshToken\":null,\"givenName\":{\"en\":\"Ramiro\",\"fr_CA\":\"Ramiro\"},\"familyName\":{\"en\":\"Vaca\",\"fr_CA\":\"Vaca\"},\"affiliation\":{\"en\":\"Universidad Nacional Aut\\u00f3noma de M\\u00e9xico\",\"fr_CA\":\"Mexico\"},\"userCountry\":\"MX\",\"username\":\"rvaca\",\"password\":\"$2y$10$.V2gg4p.EXa8LHQSXDse8uU7DlzEczrQdbJMqpSlEG\\/uGHSvQ6ZkG\",\"emailSubject\":null,\"emailBody\":null,\"userGroupsToAdd\":[{\"userGroupId\":2,\"dateStart\":\"2025-08-02\",\"dateEnd\":null,\"masthead\":true}],\"passwordHashed\":true,\"sendEmailAddress\":\"rvaca@mailinator.com\",\"inviteStagePayload\":{\"orcid\":null,\"orcidAccessDenied\":null,\"orcidAccessExpiresOn\":null,\"orcidAccessScope\":null,\"orcidAccessToken\":null,\"orcidIsVerified\":null,\"orcidRefreshToken\":null,\"givenName\":null,\"familyName\":null,\"affiliation\":null,\"userCountry\":null,\"username\":null,\"password\":null,\"emailSubject\":null,\"emailBody\":null,\"userGroupsToAdd\":[{\"userGroupId\":2,\"dateStart\":\"2025-08-02\",\"dateEnd\":null,\"masthead\":true}],\"passwordHashed\":null,\"sendEmailAddress\":\"rvaca@mailinator.com\",\"inviteStagePayload\":null,\"shouldUseInviteData\":null},\"shouldUseInviteData\":null}','ACCEPTED','rvaca@mailinator.com',1,'2025-08-02 05:42:56','2025-08-02 05:43:04'),
(4,'$2y$10$eV95o15y8mv7MfQiNelpQeL4JQy2/axIgfI.QxqB3j9oGu.rGS0NO','userRoleAssignment',NULL,1,'2025-08-05 05:43:13','{\"orcid\":null,\"orcidAccessDenied\":null,\"orcidAccessExpiresOn\":null,\"orcidAccessScope\":null,\"orcidAccessToken\":null,\"orcidIsVerified\":null,\"orcidRefreshToken\":null,\"givenName\":{\"en\":\"Daniel\",\"fr_CA\":\"Daniel\"},\"familyName\":{\"en\":\"Barnes\",\"fr_CA\":\"Barnes\"},\"affiliation\":{\"en\":\"University of Melbourne\",\"fr_CA\":\"Australia\"},\"userCountry\":\"AU\",\"username\":\"dbarnes\",\"password\":\"$2y$10$vpANb5s3mmLE.VncRDtPYuyWmx1YnGXI6yCxIV75y4Nsj2i8RWRvO\",\"emailSubject\":null,\"emailBody\":null,\"userGroupsToAdd\":[{\"userGroupId\":3,\"dateStart\":\"2025-08-02\",\"dateEnd\":null,\"masthead\":true}],\"passwordHashed\":true,\"sendEmailAddress\":\"dbarnes@mailinator.com\",\"inviteStagePayload\":{\"orcid\":null,\"orcidAccessDenied\":null,\"orcidAccessExpiresOn\":null,\"orcidAccessScope\":null,\"orcidAccessToken\":null,\"orcidIsVerified\":null,\"orcidRefreshToken\":null,\"givenName\":null,\"familyName\":null,\"affiliation\":null,\"userCountry\":null,\"username\":null,\"password\":null,\"emailSubject\":null,\"emailBody\":null,\"userGroupsToAdd\":[{\"userGroupId\":3,\"dateStart\":\"2025-08-02\",\"dateEnd\":null,\"masthead\":true}],\"passwordHashed\":null,\"sendEmailAddress\":\"dbarnes@mailinator.com\",\"inviteStagePayload\":null,\"shouldUseInviteData\":null},\"shouldUseInviteData\":null}','ACCEPTED','dbarnes@mailinator.com',1,'2025-08-02 05:43:13','2025-08-02 05:43:21'),
(6,'$2y$10$1TUcxJBOmFoH.gMfoXON0eOiMvocQKnAzuzbjsIiNVl84I.F8o0WS','userRoleAssignment',NULL,1,'2025-08-05 05:43:30','{\"orcid\":null,\"orcidAccessDenied\":null,\"orcidAccessExpiresOn\":null,\"orcidAccessScope\":null,\"orcidAccessToken\":null,\"orcidIsVerified\":null,\"orcidRefreshToken\":null,\"givenName\":{\"en\":\"David\",\"fr_CA\":\"David\"},\"familyName\":{\"en\":\"Buskins\",\"fr_CA\":\"Buskins\"},\"affiliation\":{\"en\":\"University of Chicago\",\"fr_CA\":\"United States\"},\"userCountry\":\"US\",\"username\":\"dbuskins\",\"password\":\"$2y$10$rp3LFC4xsocRdUaUyB.S2.06u16bBfubSRTgI2NBsMl4peu0OjYGC\",\"emailSubject\":null,\"emailBody\":null,\"userGroupsToAdd\":[{\"userGroupId\":5,\"dateStart\":\"2025-08-02\",\"dateEnd\":null,\"masthead\":true}],\"passwordHashed\":true,\"sendEmailAddress\":\"dbuskins@mailinator.com\",\"inviteStagePayload\":{\"orcid\":null,\"orcidAccessDenied\":null,\"orcidAccessExpiresOn\":null,\"orcidAccessScope\":null,\"orcidAccessToken\":null,\"orcidIsVerified\":null,\"orcidRefreshToken\":null,\"givenName\":null,\"familyName\":null,\"affiliation\":null,\"userCountry\":null,\"username\":null,\"password\":null,\"emailSubject\":null,\"emailBody\":null,\"userGroupsToAdd\":[{\"userGroupId\":5,\"dateStart\":\"2025-08-02\",\"dateEnd\":null,\"masthead\":true}],\"passwordHashed\":null,\"sendEmailAddress\":\"dbuskins@mailinator.com\",\"inviteStagePayload\":null,\"shouldUseInviteData\":null},\"shouldUseInviteData\":null}','ACCEPTED','dbuskins@mailinator.com',1,'2025-08-02 05:43:29','2025-08-02 05:43:38'),
(8,'$2y$10$5v69eA4aZ7zwq9iXjQXz3eiaT0tgd62Jo5pmT5TRIb94.4VXjKA.u','userRoleAssignment',NULL,1,'2025-08-05 05:43:47','{\"orcid\":null,\"orcidAccessDenied\":null,\"orcidAccessExpiresOn\":null,\"orcidAccessScope\":null,\"orcidAccessToken\":null,\"orcidIsVerified\":null,\"orcidRefreshToken\":null,\"givenName\":{\"en\":\"Stephanie\",\"fr_CA\":\"Stephanie\"},\"familyName\":{\"en\":\"Berardo\",\"fr_CA\":\"Berardo\"},\"affiliation\":{\"en\":\"University of Toronto\",\"fr_CA\":\"Canada\"},\"userCountry\":\"CA\",\"username\":\"sberardo\",\"password\":\"$2y$10$eb8C2JNR9fxSdyJqRoksxeqrNCnS03R7u24bz18gWiVscRgLJ538K\",\"emailSubject\":null,\"emailBody\":null,\"userGroupsToAdd\":[{\"userGroupId\":5,\"dateStart\":\"2025-08-02\",\"dateEnd\":null,\"masthead\":true}],\"passwordHashed\":true,\"sendEmailAddress\":\"sberardo@mailinator.com\",\"inviteStagePayload\":{\"orcid\":null,\"orcidAccessDenied\":null,\"orcidAccessExpiresOn\":null,\"orcidAccessScope\":null,\"orcidAccessToken\":null,\"orcidIsVerified\":null,\"orcidRefreshToken\":null,\"givenName\":null,\"familyName\":null,\"affiliation\":null,\"userCountry\":null,\"username\":null,\"password\":null,\"emailSubject\":null,\"emailBody\":null,\"userGroupsToAdd\":[{\"userGroupId\":5,\"dateStart\":\"2025-08-02\",\"dateEnd\":null,\"masthead\":true}],\"passwordHashed\":null,\"sendEmailAddress\":\"sberardo@mailinator.com\",\"inviteStagePayload\":null,\"shouldUseInviteData\":null},\"shouldUseInviteData\":null}','ACCEPTED','sberardo@mailinator.com',1,'2025-08-02 05:43:47','2025-08-02 05:43:56'),
(10,'$2y$10$fGgJJbhta4kKgkwPE8bajOZKbLHLRsT4YyK94Khb4hTbRBimCywDW','userRoleAssignment',NULL,1,'2025-08-05 05:44:06','{\"orcid\":null,\"orcidAccessDenied\":null,\"orcidAccessExpiresOn\":null,\"orcidAccessScope\":null,\"orcidAccessToken\":null,\"orcidIsVerified\":null,\"orcidRefreshToken\":null,\"givenName\":{\"en\":\"Minoti\",\"fr_CA\":\"Minoti\"},\"familyName\":{\"en\":\"Inoue\",\"fr_CA\":\"Inoue\"},\"affiliation\":{\"en\":\"Kyoto University\",\"fr_CA\":\"Japan\"},\"userCountry\":\"JP\",\"username\":\"minoue\",\"password\":\"$2y$10$qt.Uaqlc\\/vlY4MP4vWD7r.Ri.XHgwm9ENZu121usK8mYl0cjeeeI6\",\"emailSubject\":null,\"emailBody\":null,\"userGroupsToAdd\":[{\"userGroupId\":5,\"dateStart\":\"2025-08-02\",\"dateEnd\":null,\"masthead\":true}],\"passwordHashed\":true,\"sendEmailAddress\":\"minoue@mailinator.com\",\"inviteStagePayload\":{\"orcid\":null,\"orcidAccessDenied\":null,\"orcidAccessExpiresOn\":null,\"orcidAccessScope\":null,\"orcidAccessToken\":null,\"orcidIsVerified\":null,\"orcidRefreshToken\":null,\"givenName\":null,\"familyName\":null,\"affiliation\":null,\"userCountry\":null,\"username\":null,\"password\":null,\"emailSubject\":null,\"emailBody\":null,\"userGroupsToAdd\":[{\"userGroupId\":5,\"dateStart\":\"2025-08-02\",\"dateEnd\":null,\"masthead\":true}],\"passwordHashed\":null,\"sendEmailAddress\":\"minoue@mailinator.com\",\"inviteStagePayload\":null,\"shouldUseInviteData\":null},\"shouldUseInviteData\":null}','ACCEPTED','minoue@mailinator.com',1,'2025-08-02 05:44:05','2025-08-02 05:44:15'),
(12,'$2y$10$e2e82KPB2J.8MmcjatzIdurrQpuIn7MDtjzTScSaeDxiZAzTT05a6','userRoleAssignment',NULL,1,'2025-08-05 05:44:25','{\"orcid\":null,\"orcidAccessDenied\":null,\"orcidAccessExpiresOn\":null,\"orcidAccessScope\":null,\"orcidAccessToken\":null,\"orcidIsVerified\":null,\"orcidRefreshToken\":null,\"givenName\":{\"en\":\"Julie\",\"fr_CA\":\"Julie\"},\"familyName\":{\"en\":\"Janssen\",\"fr_CA\":\"Janssen\"},\"affiliation\":{\"en\":\"Utrecht University\",\"fr_CA\":\"Netherlands\"},\"userCountry\":\"NL\",\"username\":\"jjanssen\",\"password\":\"$2y$10$tP42K0ybYC6054C.TYGZ0O7uct9yDwUp1WYbUNFKLC4xWB84dN.zK\",\"emailSubject\":null,\"emailBody\":null,\"userGroupsToAdd\":[{\"userGroupId\":16,\"dateStart\":\"2025-08-02\",\"dateEnd\":null,\"masthead\":true}],\"passwordHashed\":true,\"sendEmailAddress\":\"jjanssen@mailinator.com\",\"inviteStagePayload\":{\"orcid\":null,\"orcidAccessDenied\":null,\"orcidAccessExpiresOn\":null,\"orcidAccessScope\":null,\"orcidAccessToken\":null,\"orcidIsVerified\":null,\"orcidRefreshToken\":null,\"givenName\":null,\"familyName\":null,\"affiliation\":null,\"userCountry\":null,\"username\":null,\"password\":null,\"emailSubject\":null,\"emailBody\":null,\"userGroupsToAdd\":[{\"userGroupId\":16,\"dateStart\":\"2025-08-02\",\"dateEnd\":null,\"masthead\":true}],\"passwordHashed\":null,\"sendEmailAddress\":\"jjanssen@mailinator.com\",\"inviteStagePayload\":null,\"shouldUseInviteData\":null},\"shouldUseInviteData\":null}','ACCEPTED','jjanssen@mailinator.com',1,'2025-08-02 05:44:25','2025-08-02 05:44:35'),
(14,'$2y$10$W/JXyQR4UZZRUmxrtAEoduPtzJ/o84XUSPuwkD2YwPjTX0MOAm1Aq','userRoleAssignment',NULL,1,'2025-08-05 05:44:46','{\"orcid\":null,\"orcidAccessDenied\":null,\"orcidAccessExpiresOn\":null,\"orcidAccessScope\":null,\"orcidAccessToken\":null,\"orcidIsVerified\":null,\"orcidRefreshToken\":null,\"givenName\":{\"en\":\"Paul\",\"fr_CA\":\"Paul\"},\"familyName\":{\"en\":\"Hudson\",\"fr_CA\":\"Hudson\"},\"affiliation\":{\"en\":\"McGill University\",\"fr_CA\":\"Canada\"},\"userCountry\":\"CA\",\"username\":\"phudson\",\"password\":\"$2y$10$a243TPXJ3cisWYy.3BjUe.Q40FWbi8vI\\/kewG3xkFn.fsPZKXwsry\",\"emailSubject\":null,\"emailBody\":null,\"userGroupsToAdd\":[{\"userGroupId\":16,\"dateStart\":\"2025-08-02\",\"dateEnd\":null,\"masthead\":true}],\"passwordHashed\":true,\"sendEmailAddress\":\"phudson@mailinator.com\",\"inviteStagePayload\":{\"orcid\":null,\"orcidAccessDenied\":null,\"orcidAccessExpiresOn\":null,\"orcidAccessScope\":null,\"orcidAccessToken\":null,\"orcidIsVerified\":null,\"orcidRefreshToken\":null,\"givenName\":null,\"familyName\":null,\"affiliation\":null,\"userCountry\":null,\"username\":null,\"password\":null,\"emailSubject\":null,\"emailBody\":null,\"userGroupsToAdd\":[{\"userGroupId\":16,\"dateStart\":\"2025-08-02\",\"dateEnd\":null,\"masthead\":true}],\"passwordHashed\":null,\"sendEmailAddress\":\"phudson@mailinator.com\",\"inviteStagePayload\":null,\"shouldUseInviteData\":null},\"shouldUseInviteData\":null}','ACCEPTED','phudson@mailinator.com',1,'2025-08-02 05:44:46','2025-08-02 05:44:56'),
(16,'$2y$10$tfFb7WRrHpDB/HbrCS9EIu7stwgliwAg9onEoN8Z./xpb/y2XQ3Jm','userRoleAssignment',NULL,1,'2025-08-05 05:45:08','{\"orcid\":null,\"orcidAccessDenied\":null,\"orcidAccessExpiresOn\":null,\"orcidAccessScope\":null,\"orcidAccessToken\":null,\"orcidIsVerified\":null,\"orcidRefreshToken\":null,\"givenName\":{\"en\":\"Aisla\",\"fr_CA\":\"Aisla\"},\"familyName\":{\"en\":\"McCrae\",\"fr_CA\":\"McCrae\"},\"affiliation\":{\"en\":\"University of Manitoba\",\"fr_CA\":\"Canada\"},\"userCountry\":\"CA\",\"username\":\"amccrae\",\"password\":\"$2y$10$tgpq9KhN3ChFJqc52\\/i\\/mOlON9qnDt5Xh6R9HP1C0ULK8LXgsCxN2\",\"emailSubject\":null,\"emailBody\":null,\"userGroupsToAdd\":[{\"userGroupId\":16,\"dateStart\":\"2025-08-02\",\"dateEnd\":null,\"masthead\":true}],\"passwordHashed\":true,\"sendEmailAddress\":\"amccrae@mailinator.com\",\"inviteStagePayload\":{\"orcid\":null,\"orcidAccessDenied\":null,\"orcidAccessExpiresOn\":null,\"orcidAccessScope\":null,\"orcidAccessToken\":null,\"orcidIsVerified\":null,\"orcidRefreshToken\":null,\"givenName\":null,\"familyName\":null,\"affiliation\":null,\"userCountry\":null,\"username\":null,\"password\":null,\"emailSubject\":null,\"emailBody\":null,\"userGroupsToAdd\":[{\"userGroupId\":16,\"dateStart\":\"2025-08-02\",\"dateEnd\":null,\"masthead\":true}],\"passwordHashed\":null,\"sendEmailAddress\":\"amccrae@mailinator.com\",\"inviteStagePayload\":null,\"shouldUseInviteData\":null},\"shouldUseInviteData\":null}','ACCEPTED','amccrae@mailinator.com',1,'2025-08-02 05:45:07','2025-08-02 05:45:19'),
(18,'$2y$10$cUrCkjha3ArNES9tWwmQueaf6yyA9QcOnmgeCa/9gp3QxASNwP6yW','userRoleAssignment',NULL,1,'2025-08-05 05:45:31','{\"orcid\":null,\"orcidAccessDenied\":null,\"orcidAccessExpiresOn\":null,\"orcidAccessScope\":null,\"orcidAccessToken\":null,\"orcidIsVerified\":null,\"orcidRefreshToken\":null,\"givenName\":{\"en\":\"Adela\",\"fr_CA\":\"Adela\"},\"familyName\":{\"en\":\"Gallego\",\"fr_CA\":\"Gallego\"},\"affiliation\":{\"en\":\"State University of New York\",\"fr_CA\":\"United States\"},\"userCountry\":\"US\",\"username\":\"agallego\",\"password\":\"$2y$10$ArBIu8GBScW5jRi2fa8iNuBlv.PmoFzxVNpmeLMZC4LYm70UCz85O\",\"emailSubject\":null,\"emailBody\":null,\"userGroupsToAdd\":[{\"userGroupId\":16,\"dateStart\":\"2025-08-02\",\"dateEnd\":null,\"masthead\":true}],\"passwordHashed\":true,\"sendEmailAddress\":\"agallego@mailinator.com\",\"inviteStagePayload\":{\"orcid\":null,\"orcidAccessDenied\":null,\"orcidAccessExpiresOn\":null,\"orcidAccessScope\":null,\"orcidAccessToken\":null,\"orcidIsVerified\":null,\"orcidRefreshToken\":null,\"givenName\":null,\"familyName\":null,\"affiliation\":null,\"userCountry\":null,\"username\":null,\"password\":null,\"emailSubject\":null,\"emailBody\":null,\"userGroupsToAdd\":[{\"userGroupId\":16,\"dateStart\":\"2025-08-02\",\"dateEnd\":null,\"masthead\":true}],\"passwordHashed\":null,\"sendEmailAddress\":\"agallego@mailinator.com\",\"inviteStagePayload\":null,\"shouldUseInviteData\":null},\"shouldUseInviteData\":null}','ACCEPTED','agallego@mailinator.com',1,'2025-08-02 05:45:30','2025-08-02 05:45:42'),
(20,'$2y$10$j1HWlRKS9GOHzrgnEbWSoOO0CW6ioGBvKOQffGsJMK6a05vOKqVPW','userRoleAssignment',NULL,1,'2025-08-05 05:45:55','{\"orcid\":null,\"orcidAccessDenied\":null,\"orcidAccessExpiresOn\":null,\"orcidAccessScope\":null,\"orcidAccessToken\":null,\"orcidIsVerified\":null,\"orcidRefreshToken\":null,\"givenName\":{\"en\":\"Maria\",\"fr_CA\":\"Maria\"},\"familyName\":{\"en\":\"Fritz\",\"fr_CA\":\"Fritz\"},\"affiliation\":{\"en\":\"Ghent University\",\"fr_CA\":\"Belgium\"},\"userCountry\":\"BE\",\"username\":\"mfritz\",\"password\":\"$2y$10$efGuQouYXxmTSNET9oUvtuSQhH7iI66AXjy8u7FBdrvxXijPixwyy\",\"emailSubject\":null,\"emailBody\":null,\"userGroupsToAdd\":[{\"userGroupId\":7,\"dateStart\":\"2025-08-02\",\"dateEnd\":null,\"masthead\":true}],\"passwordHashed\":true,\"sendEmailAddress\":\"mfritz@mailinator.com\",\"inviteStagePayload\":{\"orcid\":null,\"orcidAccessDenied\":null,\"orcidAccessExpiresOn\":null,\"orcidAccessScope\":null,\"orcidAccessToken\":null,\"orcidIsVerified\":null,\"orcidRefreshToken\":null,\"givenName\":null,\"familyName\":null,\"affiliation\":null,\"userCountry\":null,\"username\":null,\"password\":null,\"emailSubject\":null,\"emailBody\":null,\"userGroupsToAdd\":[{\"userGroupId\":7,\"dateStart\":\"2025-08-02\",\"dateEnd\":null,\"masthead\":true}],\"passwordHashed\":null,\"sendEmailAddress\":\"mfritz@mailinator.com\",\"inviteStagePayload\":null,\"shouldUseInviteData\":null},\"shouldUseInviteData\":null}','ACCEPTED','mfritz@mailinator.com',1,'2025-08-02 05:45:54','2025-08-02 05:46:07'),
(22,'$2y$10$tE32k23THsAOBc1DbpVa4.57eyzpI7ya/YcO3CP6pXUdQZtx4UJKq','userRoleAssignment',NULL,1,'2025-08-05 05:46:21','{\"orcid\":null,\"orcidAccessDenied\":null,\"orcidAccessExpiresOn\":null,\"orcidAccessScope\":null,\"orcidAccessToken\":null,\"orcidIsVerified\":null,\"orcidRefreshToken\":null,\"givenName\":{\"en\":\"Sarah\",\"fr_CA\":\"Sarah\"},\"familyName\":{\"en\":\"Vogt\",\"fr_CA\":\"Vogt\"},\"affiliation\":{\"en\":\"Universidad de Chile\",\"fr_CA\":\"Chile\"},\"userCountry\":\"CL\",\"username\":\"svogt\",\"password\":\"$2y$10$TVNN33oZYgTqMnogBPVxyeb2opiZB51k7AbMMMvUa6cEGmLe5RZZG\",\"emailSubject\":null,\"emailBody\":null,\"userGroupsToAdd\":[{\"userGroupId\":7,\"dateStart\":\"2025-08-02\",\"dateEnd\":null,\"masthead\":true}],\"passwordHashed\":true,\"sendEmailAddress\":\"svogt@mailinator.com\",\"inviteStagePayload\":{\"orcid\":null,\"orcidAccessDenied\":null,\"orcidAccessExpiresOn\":null,\"orcidAccessScope\":null,\"orcidAccessToken\":null,\"orcidIsVerified\":null,\"orcidRefreshToken\":null,\"givenName\":null,\"familyName\":null,\"affiliation\":null,\"userCountry\":null,\"username\":null,\"password\":null,\"emailSubject\":null,\"emailBody\":null,\"userGroupsToAdd\":[{\"userGroupId\":7,\"dateStart\":\"2025-08-02\",\"dateEnd\":null,\"masthead\":true}],\"passwordHashed\":null,\"sendEmailAddress\":\"svogt@mailinator.com\",\"inviteStagePayload\":null,\"shouldUseInviteData\":null},\"shouldUseInviteData\":null}','ACCEPTED','svogt@mailinator.com',1,'2025-08-02 05:46:20','2025-08-02 05:46:34'),
(24,'$2y$10$t6RztepPOekJ9Ima9zG8WeWUveD8V5NxfiPQPuK0TB2y3i6uJmESa','userRoleAssignment',NULL,1,'2025-08-05 05:46:49','{\"orcid\":null,\"orcidAccessDenied\":null,\"orcidAccessExpiresOn\":null,\"orcidAccessScope\":null,\"orcidAccessToken\":null,\"orcidIsVerified\":null,\"orcidRefreshToken\":null,\"givenName\":{\"en\":\"Graham\",\"fr_CA\":\"Graham\"},\"familyName\":{\"en\":\"Cox\",\"fr_CA\":\"Cox\"},\"affiliation\":{\"en\":\"Duke University\",\"fr_CA\":\"United States\"},\"userCountry\":\"US\",\"username\":\"gcox\",\"password\":\"$2y$10$UusTgXvCYWKEwvHdu7f7c.mmWvqUGonQJG\\/56qmIru91krtzKVvUW\",\"emailSubject\":null,\"emailBody\":null,\"userGroupsToAdd\":[{\"userGroupId\":11,\"dateStart\":\"2025-08-02\",\"dateEnd\":null,\"masthead\":true}],\"passwordHashed\":true,\"sendEmailAddress\":\"gcox@mailinator.com\",\"inviteStagePayload\":{\"orcid\":null,\"orcidAccessDenied\":null,\"orcidAccessExpiresOn\":null,\"orcidAccessScope\":null,\"orcidAccessToken\":null,\"orcidIsVerified\":null,\"orcidRefreshToken\":null,\"givenName\":null,\"familyName\":null,\"affiliation\":null,\"userCountry\":null,\"username\":null,\"password\":null,\"emailSubject\":null,\"emailBody\":null,\"userGroupsToAdd\":[{\"userGroupId\":11,\"dateStart\":\"2025-08-02\",\"dateEnd\":null,\"masthead\":true}],\"passwordHashed\":null,\"sendEmailAddress\":\"gcox@mailinator.com\",\"inviteStagePayload\":null,\"shouldUseInviteData\":null},\"shouldUseInviteData\":null}','ACCEPTED','gcox@mailinator.com',1,'2025-08-02 05:46:48','2025-08-02 05:47:03'),
(26,'$2y$10$VdqXBmc3tJe22q03QUcdFOfH00y0P5xcX/oXtpieK7aJx/M6ZjywS','userRoleAssignment',NULL,1,'2025-08-05 05:47:18','{\"orcid\":null,\"orcidAccessDenied\":null,\"orcidAccessExpiresOn\":null,\"orcidAccessScope\":null,\"orcidAccessToken\":null,\"orcidIsVerified\":null,\"orcidRefreshToken\":null,\"givenName\":{\"en\":\"Stephen\",\"fr_CA\":\"Stephen\"},\"familyName\":{\"en\":\"Hellier\",\"fr_CA\":\"Hellier\"},\"affiliation\":{\"en\":\"University of Cape Town\",\"fr_CA\":\"South Africa\"},\"userCountry\":\"ZA\",\"username\":\"shellier\",\"password\":\"$2y$10$EXeI4AF4O2LVGGddVG4cCuRB.nFzWJ3syPKF71kT76OWsVoDQYRHa\",\"emailSubject\":null,\"emailBody\":null,\"userGroupsToAdd\":[{\"userGroupId\":11,\"dateStart\":\"2025-08-02\",\"dateEnd\":null,\"masthead\":true}],\"passwordHashed\":true,\"sendEmailAddress\":\"shellier@mailinator.com\",\"inviteStagePayload\":{\"orcid\":null,\"orcidAccessDenied\":null,\"orcidAccessExpiresOn\":null,\"orcidAccessScope\":null,\"orcidAccessToken\":null,\"orcidIsVerified\":null,\"orcidRefreshToken\":null,\"givenName\":null,\"familyName\":null,\"affiliation\":null,\"userCountry\":null,\"username\":null,\"password\":null,\"emailSubject\":null,\"emailBody\":null,\"userGroupsToAdd\":[{\"userGroupId\":11,\"dateStart\":\"2025-08-02\",\"dateEnd\":null,\"masthead\":true}],\"passwordHashed\":null,\"sendEmailAddress\":\"shellier@mailinator.com\",\"inviteStagePayload\":null,\"shouldUseInviteData\":null},\"shouldUseInviteData\":null}','ACCEPTED','shellier@mailinator.com',1,'2025-08-02 05:47:17','2025-08-02 05:47:33'),
(28,'$2y$10$KxKYZal2uooePO/kOHTPieKCgd4foBmbARoHXz.btap8Hstb4r8vS','userRoleAssignment',NULL,1,'2025-08-05 05:47:49','{\"orcid\":null,\"orcidAccessDenied\":null,\"orcidAccessExpiresOn\":null,\"orcidAccessScope\":null,\"orcidAccessToken\":null,\"orcidIsVerified\":null,\"orcidRefreshToken\":null,\"givenName\":{\"en\":\"Catherine\",\"fr_CA\":\"Catherine\"},\"familyName\":{\"en\":\"Turner\",\"fr_CA\":\"Turner\"},\"affiliation\":{\"en\":\"Imperial College London\",\"fr_CA\":\"United Kingdom\"},\"userCountry\":\"GB\",\"username\":\"cturner\",\"password\":\"$2y$10$3Ni4NHd92EerO4CggH1rr.ygiHy6f2xBm0iwbz\\/KsXWHLgB3JDVau\",\"emailSubject\":null,\"emailBody\":null,\"userGroupsToAdd\":[{\"userGroupId\":13,\"dateStart\":\"2025-08-02\",\"dateEnd\":null,\"masthead\":true}],\"passwordHashed\":true,\"sendEmailAddress\":\"cturner@mailinator.com\",\"inviteStagePayload\":{\"orcid\":null,\"orcidAccessDenied\":null,\"orcidAccessExpiresOn\":null,\"orcidAccessScope\":null,\"orcidAccessToken\":null,\"orcidIsVerified\":null,\"orcidRefreshToken\":null,\"givenName\":null,\"familyName\":null,\"affiliation\":null,\"userCountry\":null,\"username\":null,\"password\":null,\"emailSubject\":null,\"emailBody\":null,\"userGroupsToAdd\":[{\"userGroupId\":13,\"dateStart\":\"2025-08-02\",\"dateEnd\":null,\"masthead\":true}],\"passwordHashed\":null,\"sendEmailAddress\":\"cturner@mailinator.com\",\"inviteStagePayload\":null,\"shouldUseInviteData\":null},\"shouldUseInviteData\":null}','ACCEPTED','cturner@mailinator.com',1,'2025-08-02 05:47:48','2025-08-02 05:48:05'),
(30,'$2y$10$cLTXZ8.Y/7rMS4DEKZXDfOTcl2OjfnhCM3O9PjDk6oSu0Ppa77Z86','userRoleAssignment',NULL,1,'2025-08-05 05:48:22','{\"orcid\":null,\"orcidAccessDenied\":null,\"orcidAccessExpiresOn\":null,\"orcidAccessScope\":null,\"orcidAccessToken\":null,\"orcidIsVerified\":null,\"orcidRefreshToken\":null,\"givenName\":{\"en\":\"Sabine\",\"fr_CA\":\"Sabine\"},\"familyName\":{\"en\":\"Kumar\",\"fr_CA\":\"Kumar\"},\"affiliation\":{\"en\":\"National University of Singapore\",\"fr_CA\":\"Singapore\"},\"userCountry\":\"SG\",\"username\":\"skumar\",\"password\":\"$2y$10$hj2xGMICWpnd4DG6.0kZMeEsa8SJ3ihszLg\\/MxjXGyDeOR1R0P7XG\",\"emailSubject\":null,\"emailBody\":null,\"userGroupsToAdd\":[{\"userGroupId\":13,\"dateStart\":\"2025-08-02\",\"dateEnd\":null,\"masthead\":true}],\"passwordHashed\":true,\"sendEmailAddress\":\"skumar@mailinator.com\",\"inviteStagePayload\":{\"orcid\":null,\"orcidAccessDenied\":null,\"orcidAccessExpiresOn\":null,\"orcidAccessScope\":null,\"orcidAccessToken\":null,\"orcidIsVerified\":null,\"orcidRefreshToken\":null,\"givenName\":null,\"familyName\":null,\"affiliation\":null,\"userCountry\":null,\"username\":null,\"password\":null,\"emailSubject\":null,\"emailBody\":null,\"userGroupsToAdd\":[{\"userGroupId\":13,\"dateStart\":\"2025-08-02\",\"dateEnd\":null,\"masthead\":true}],\"passwordHashed\":null,\"sendEmailAddress\":\"skumar@mailinator.com\",\"inviteStagePayload\":null,\"shouldUseInviteData\":null},\"shouldUseInviteData\":null}','ACCEPTED','skumar@mailinator.com',1,'2025-08-02 05:48:21','2025-08-02 05:48:40');
/*!40000 ALTER TABLE `invitations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `issue_files`
--

DROP TABLE IF EXISTS `issue_files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
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
/*!40101 SET character_set_client = utf8mb4 */;
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
/*!40101 SET character_set_client = utf8mb4 */;
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
/*!40101 SET character_set_client = utf8mb4 */;
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
/*!40101 SET character_set_client = utf8mb4 */;
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
(1,1,1,'2',2014,1,'2025-08-02 05:49:10',NULL,'2025-08-02 06:02:12',1,NULL,1,1,1,0,NULL,NULL,NULL,NULL),
(2,1,2,'1',2015,0,'2025-08-02 06:01:33',NULL,'2025-08-02 06:02:10',1,NULL,1,1,1,0,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `issues` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `job_batches`
--

DROP TABLE IF EXISTS `job_batches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
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
/*!40101 SET character_set_client = utf8mb4 */;
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
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='All pending or in-progress jobs.';
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
/*!40101 SET character_set_client = utf8mb4 */;
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
) ENGINE=InnoDB AUTO_INCREMENT=96 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='More data about journals, including localized properties like policies.';
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
(39,1,'','numReviewsPerSubmission','0'),
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
(84,1,'en','reviewerSuggestionsHelp','<p>When submitting, you have the option to suggest several potential reviewers. This can help streamline the review process and provide valueable input for the editorial team. Please choose reviewers who are expert in your field and have no conflict of interest with your work. This feature aims to enhance the review process and support a more efficient experience for both authors and editorial team.</p>'),
(85,1,'fr_CA','reviewerSuggestionsHelp','##default.submission.step.reviewerSuggestions##'),
(86,1,'en','customHeaders','<meta name=\"pkp\" content=\"Test metatag.\">'),
(87,1,'en','searchDescription','The Journal of Public Knowledge is a peer-reviewed quarterly publication on the subject of public access to science.'),
(88,1,'en','abbreviation','publicknowledgeJ Pub Know'),
(89,1,'','onlineIssn','0378-5955'),
(90,1,'','printIssn','0378-5955'),
(91,1,'','publisherInstitution','Public Knowledge Project'),
(92,1,'','mailingAddress','123 456th Street\nBurnaby, British Columbia\nCanada'),
(93,1,'','supportEmail','rvaca@mailinator.com'),
(94,1,'','supportName','Ramiro Vaca'),
(95,1,'','reviewerSuggestionEnabled','0');
/*!40000 ALTER TABLE `journal_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `journals`
--

DROP TABLE IF EXISTS `journals`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
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
/*!40101 SET character_set_client = utf8mb4 */;
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
/*!40101 SET character_set_client = utf8mb4 */;
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
/*!40101 SET character_set_client = utf8mb4 */;
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
/*!40101 SET character_set_client = utf8mb4 */;
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
/*!40101 SET character_set_client = utf8mb4 */;
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
/*!40101 SET character_set_client = utf8mb4 */;
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
/*!40101 SET character_set_client = utf8mb4 */;
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
/*!40101 SET character_set_client = utf8mb4 */;
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
/*!40101 SET character_set_client = utf8mb4 */;
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
/*!40101 SET character_set_client = utf8mb4 */;
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
/*!40101 SET character_set_client = utf8mb4 */;
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
/*!40101 SET character_set_client = utf8mb4 */;
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
/*!40101 SET character_set_client = utf8mb4 */;
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
/*!40101 SET character_set_client = utf8mb4 */;
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
/*!40101 SET character_set_client = utf8mb4 */;
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
/*!40101 SET character_set_client = utf8mb4 */;
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
/*!40101 SET character_set_client = utf8mb4 */;
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
(1,1048586,1,6,'2025-08-02 05:54:18','2025-08-02 05:54:18','Editor Recommendation','<p>Dear Daniel Barnes, David Buskins, Stephanie Berardo,</p><p>After considering the reviewers\' feedback, I would like to make the following recommendation regarding the submission \"The influence of lactation on the quantity and quality of cashmere production\".</p><p>My recommendation is: Accept Submission.</p><p>Please visit the submission\'s <a href=\"http://localhost/index.php/publicknowledge/en/dashboard/editorial?workflowSubmissionId=2\">editorial workflow</a> to act on this recommendation.</p><p>Please feel free to contact me with any questions.</p><p>Kind regards,</p><p>Minoti Inoue</p>');
/*!40000 ALTER TABLE `notes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notification_settings`
--

DROP TABLE IF EXISTS `notification_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
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
) ENGINE=InnoDB AUTO_INCREMENT=62 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='More data about notifications, including localized properties.';
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
/*!40101 SET character_set_client = utf8mb4 */;
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
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='Which email notifications a user has chosen to unsubscribe from.';
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
(57,'blocked_emailed_notification','50331659',35,1,'int'),
(58,'blocked_emailed_notification','8',36,1,'int'),
(59,'blocked_emailed_notification','268435477',36,1,'int'),
(60,'blocked_emailed_notification','50331659',36,1,'int');
/*!40000 ALTER TABLE `notification_subscription_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notifications`
--

DROP TABLE IF EXISTS `notifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
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
) ENGINE=InnoDB AUTO_INCREMENT=311 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='User notifications created during certain operations.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notifications`
--

LOCK TABLES `notifications` WRITE;
/*!40000 ALTER TABLE `notifications` DISABLE KEYS */;
INSERT INTO `notifications` VALUES
(8,1,3,2,16777217,'2025-08-02 05:50:10',NULL,1048585,1),
(9,1,4,2,16777217,'2025-08-02 05:50:10',NULL,1048585,1),
(10,1,5,2,16777217,'2025-08-02 05:50:10',NULL,1048585,1),
(11,1,NULL,2,16777243,'2025-08-02 05:50:11',NULL,1048585,1),
(12,1,NULL,2,16777245,'2025-08-02 05:50:11',NULL,1048585,1),
(13,1,NULL,2,16777236,'2025-08-02 05:50:18',NULL,523,1),
(15,1,7,3,16777227,'2025-08-02 05:50:21',NULL,517,1),
(17,1,9,3,16777227,'2025-08-02 05:50:24',NULL,517,2),
(19,1,10,3,16777227,'2025-08-02 05:50:26',NULL,517,3),
(26,1,17,2,16777235,'2025-08-02 05:50:37',NULL,1048585,1),
(33,1,3,3,16777259,'2025-08-02 05:52:57',NULL,1048585,1),
(34,1,4,3,16777259,'2025-08-02 05:52:57',NULL,1048585,1),
(35,1,5,3,16777259,'2025-08-02 05:52:57',NULL,1048585,1),
(36,1,12,3,16777259,'2025-08-02 05:52:57',NULL,1048585,1),
(37,1,14,3,16777259,'2025-08-02 05:52:57',NULL,1048585,1),
(38,1,16,3,16777259,'2025-08-02 05:52:57',NULL,1048585,1),
(39,1,17,3,16777259,'2025-08-02 05:52:57',NULL,1048585,1),
(42,1,3,2,16777217,'2025-08-02 05:54:02',NULL,1048585,2),
(43,1,4,2,16777217,'2025-08-02 05:54:02',NULL,1048585,2),
(44,1,5,2,16777217,'2025-08-02 05:54:02',NULL,1048585,2),
(45,1,NULL,2,16777243,'2025-08-02 05:54:02',NULL,1048585,2),
(46,1,NULL,2,16777245,'2025-08-02 05:54:02',NULL,1048585,2),
(47,1,NULL,2,16777236,'2025-08-02 05:54:06',NULL,523,2),
(48,1,18,2,16777231,'2025-08-02 05:54:07',NULL,1048585,2),
(50,1,3,3,16777249,'2025-08-02 05:54:18',NULL,1048586,1),
(51,1,4,3,16777249,'2025-08-02 05:54:18',NULL,1048586,1),
(52,1,5,3,16777249,'2025-08-02 05:54:18',NULL,1048586,1),
(53,1,3,2,16777217,'2025-08-02 05:54:30',NULL,1048585,3),
(54,1,4,2,16777217,'2025-08-02 05:54:30',NULL,1048585,3),
(55,1,5,2,16777217,'2025-08-02 05:54:30',NULL,1048585,3),
(56,1,NULL,2,16777243,'2025-08-02 05:54:31',NULL,1048585,3),
(57,1,NULL,2,16777245,'2025-08-02 05:54:31',NULL,1048585,3),
(58,1,NULL,2,16777236,'2025-08-02 05:54:35',NULL,523,3),
(60,1,9,3,16777227,'2025-08-02 05:54:38',NULL,517,4),
(62,1,10,3,16777227,'2025-08-02 05:54:41',NULL,517,5),
(64,1,19,2,16777230,'2025-08-02 05:54:44',NULL,1048585,3),
(65,1,3,2,16777251,'2025-08-02 05:54:44','2025-08-02 05:54:46',1048585,3),
(66,1,4,2,16777251,'2025-08-02 05:54:44',NULL,1048585,3),
(67,1,5,2,16777251,'2025-08-02 05:54:44',NULL,1048585,3),
(69,1,3,2,16777217,'2025-08-02 05:54:57',NULL,1048585,4),
(70,1,4,2,16777217,'2025-08-02 05:54:57',NULL,1048585,4),
(71,1,5,2,16777217,'2025-08-02 05:54:57',NULL,1048585,4),
(72,1,NULL,2,16777243,'2025-08-02 05:54:58',NULL,1048585,4),
(73,1,NULL,2,16777245,'2025-08-02 05:54:58',NULL,1048585,4),
(74,1,3,2,16777217,'2025-08-02 05:55:06',NULL,1048585,5),
(75,1,4,2,16777217,'2025-08-02 05:55:06',NULL,1048585,5),
(76,1,5,2,16777217,'2025-08-02 05:55:06',NULL,1048585,5),
(77,1,NULL,2,16777243,'2025-08-02 05:55:07',NULL,1048585,5),
(78,1,NULL,2,16777245,'2025-08-02 05:55:07',NULL,1048585,5),
(79,1,NULL,2,16777236,'2025-08-02 05:55:12',NULL,523,4),
(81,1,8,3,16777227,'2025-08-02 05:55:15',NULL,517,6),
(83,1,10,3,16777227,'2025-08-02 05:55:17',NULL,517,7),
(90,1,21,2,16777235,'2025-08-02 05:55:28',NULL,1048585,5),
(91,1,3,2,16777254,'2025-08-02 05:55:28','2025-08-02 05:55:29',1048585,5),
(92,1,4,2,16777254,'2025-08-02 05:55:28',NULL,1048585,5),
(93,1,5,2,16777254,'2025-08-02 05:55:28',NULL,1048585,5),
(96,1,3,2,16777217,'2025-08-02 05:55:43',NULL,1048585,6),
(97,1,4,2,16777217,'2025-08-02 05:55:43',NULL,1048585,6),
(98,1,5,2,16777217,'2025-08-02 05:55:43',NULL,1048585,6),
(99,1,NULL,2,16777243,'2025-08-02 05:55:44',NULL,1048585,6),
(100,1,NULL,2,16777245,'2025-08-02 05:55:44',NULL,1048585,6),
(101,1,NULL,2,16777236,'2025-08-02 05:55:49',NULL,523,5),
(103,1,7,3,16777227,'2025-08-02 05:55:52',NULL,517,8),
(105,1,10,3,16777227,'2025-08-02 05:55:55',NULL,517,9),
(112,1,22,2,16777235,'2025-08-02 05:56:05',NULL,1048585,6),
(113,1,3,2,16777254,'2025-08-02 05:56:05','2025-08-02 05:56:08',1048585,6),
(114,1,4,2,16777254,'2025-08-02 05:56:05',NULL,1048585,6),
(115,1,5,2,16777254,'2025-08-02 05:56:05',NULL,1048585,6),
(117,1,3,2,16777217,'2025-08-02 05:56:19',NULL,1048585,7),
(118,1,4,2,16777217,'2025-08-02 05:56:19',NULL,1048585,7),
(119,1,5,2,16777217,'2025-08-02 05:56:19',NULL,1048585,7),
(120,1,NULL,2,16777243,'2025-08-02 05:56:19',NULL,1048585,7),
(121,1,NULL,2,16777245,'2025-08-02 05:56:19',NULL,1048585,7),
(122,1,NULL,2,16777236,'2025-08-02 05:56:24',NULL,523,6),
(123,1,23,2,16777231,'2025-08-02 05:56:24',NULL,1048585,7),
(126,1,9,3,16777227,'2025-08-02 05:56:30',NULL,517,11),
(128,1,10,3,16777227,'2025-08-02 05:56:33',NULL,517,12),
(130,1,3,2,16777219,'2025-08-02 05:56:40',NULL,517,10),
(131,1,4,2,16777219,'2025-08-02 05:56:40',NULL,517,10),
(132,1,5,2,16777219,'2025-08-02 05:56:40',NULL,517,10),
(133,1,3,2,16777217,'2025-08-02 05:56:50',NULL,1048585,8),
(134,1,4,2,16777217,'2025-08-02 05:56:50',NULL,1048585,8),
(135,1,5,2,16777217,'2025-08-02 05:56:50',NULL,1048585,8),
(136,1,NULL,2,16777243,'2025-08-02 05:56:50',NULL,1048585,8),
(137,1,NULL,2,16777245,'2025-08-02 05:56:50',NULL,1048585,8),
(138,1,3,2,16777217,'2025-08-02 05:56:58',NULL,1048585,9),
(139,1,6,2,16777217,'2025-08-02 05:56:58',NULL,1048585,9),
(140,1,NULL,2,16777243,'2025-08-02 05:56:59',NULL,1048585,9),
(141,1,NULL,2,16777245,'2025-08-02 05:56:59',NULL,1048585,9),
(142,1,NULL,2,16777236,'2025-08-02 05:57:05',NULL,523,7),
(144,1,7,3,16777227,'2025-08-02 05:57:09',NULL,517,13),
(146,1,10,3,16777227,'2025-08-02 05:57:11',NULL,517,14),
(152,1,25,2,16777235,'2025-08-02 05:57:22',NULL,1048585,9),
(153,1,3,2,16777254,'2025-08-02 05:57:22','2025-08-02 05:57:24',1048585,9),
(154,1,6,2,16777254,'2025-08-02 05:57:22',NULL,1048585,9),
(157,1,3,2,16777217,'2025-08-02 05:57:38',NULL,1048585,10),
(158,1,4,2,16777217,'2025-08-02 05:57:38',NULL,1048585,10),
(159,1,5,2,16777217,'2025-08-02 05:57:38',NULL,1048585,10),
(160,1,NULL,2,16777243,'2025-08-02 05:57:38',NULL,1048585,10),
(161,1,NULL,2,16777245,'2025-08-02 05:57:38',NULL,1048585,10),
(162,1,NULL,2,16777236,'2025-08-02 05:57:44',NULL,523,8),
(163,1,26,2,16777231,'2025-08-02 05:57:45',NULL,1048585,10),
(168,1,3,2,16777219,'2025-08-02 05:57:58',NULL,517,15),
(169,1,4,2,16777219,'2025-08-02 05:57:58',NULL,517,15),
(170,1,5,2,16777219,'2025-08-02 05:57:58',NULL,517,15),
(171,1,3,2,16777219,'2025-08-02 05:58:04',NULL,517,16),
(172,1,4,2,16777219,'2025-08-02 05:58:04',NULL,517,16),
(173,1,5,2,16777219,'2025-08-02 05:58:04',NULL,517,16),
(174,1,3,2,16777217,'2025-08-02 05:58:13',NULL,1048585,11),
(175,1,4,2,16777217,'2025-08-02 05:58:13',NULL,1048585,11),
(176,1,5,2,16777217,'2025-08-02 05:58:13',NULL,1048585,11),
(177,1,NULL,2,16777243,'2025-08-02 05:58:14',NULL,1048585,11),
(178,1,NULL,2,16777245,'2025-08-02 05:58:14',NULL,1048585,11),
(179,1,3,2,16777217,'2025-08-02 05:58:22',NULL,1048585,12),
(180,1,4,2,16777217,'2025-08-02 05:58:22',NULL,1048585,12),
(181,1,5,2,16777217,'2025-08-02 05:58:22',NULL,1048585,12),
(182,1,NULL,2,16777243,'2025-08-02 05:58:22',NULL,1048585,12),
(183,1,NULL,2,16777245,'2025-08-02 05:58:22',NULL,1048585,12),
(184,1,NULL,2,16777236,'2025-08-02 05:58:29',NULL,523,9),
(185,1,28,2,16777231,'2025-08-02 05:58:29',NULL,1048585,12),
(186,1,7,3,16777227,'2025-08-02 05:58:33',NULL,517,17),
(188,1,8,3,16777227,'2025-08-02 05:58:35',NULL,517,18),
(190,1,3,2,16777217,'2025-08-02 05:58:44',NULL,1048585,13),
(191,1,4,2,16777217,'2025-08-02 05:58:44',NULL,1048585,13),
(192,1,5,2,16777217,'2025-08-02 05:58:44',NULL,1048585,13),
(193,1,NULL,2,16777243,'2025-08-02 05:58:45',NULL,1048585,13),
(194,1,NULL,2,16777245,'2025-08-02 05:58:45',NULL,1048585,13),
(195,1,NULL,2,16777236,'2025-08-02 05:58:52',NULL,523,10),
(203,1,3,2,16777219,'2025-08-02 05:59:07',NULL,517,19),
(204,1,4,2,16777219,'2025-08-02 05:59:08',NULL,517,19),
(205,1,5,2,16777219,'2025-08-02 05:59:08',NULL,517,19),
(206,1,3,2,16777219,'2025-08-02 05:59:14',NULL,517,20),
(207,1,4,2,16777219,'2025-08-02 05:59:14',NULL,517,20),
(208,1,5,2,16777219,'2025-08-02 05:59:14',NULL,517,20),
(209,1,3,2,16777219,'2025-08-02 05:59:20',NULL,517,21),
(210,1,4,2,16777219,'2025-08-02 05:59:21',NULL,517,21),
(211,1,5,2,16777219,'2025-08-02 05:59:21',NULL,517,21),
(212,1,29,3,16777232,'2025-08-02 05:59:30',NULL,1048585,13),
(213,1,3,2,16777217,'2025-08-02 05:59:41',NULL,1048585,14),
(214,1,4,2,16777217,'2025-08-02 05:59:41',NULL,1048585,14),
(215,1,5,2,16777217,'2025-08-02 05:59:41',NULL,1048585,14),
(216,1,NULL,2,16777243,'2025-08-02 05:59:41',NULL,1048585,14),
(217,1,NULL,2,16777245,'2025-08-02 05:59:41',NULL,1048585,14),
(218,1,3,2,16777217,'2025-08-02 05:59:49',NULL,1048585,15),
(219,1,4,2,16777217,'2025-08-02 05:59:49',NULL,1048585,15),
(220,1,5,2,16777217,'2025-08-02 05:59:49',NULL,1048585,15),
(221,1,NULL,2,16777243,'2025-08-02 05:59:50',NULL,1048585,15),
(222,1,NULL,2,16777245,'2025-08-02 05:59:50',NULL,1048585,15),
(223,1,NULL,2,16777236,'2025-08-02 05:59:57',NULL,523,11),
(225,1,8,3,16777227,'2025-08-02 06:00:01',NULL,517,22),
(227,1,9,3,16777227,'2025-08-02 06:00:04',NULL,517,23),
(234,1,31,2,16777235,'2025-08-02 06:00:15',NULL,1048585,15),
(235,1,3,2,16777254,'2025-08-02 06:00:15','2025-08-02 06:00:18',1048585,15),
(236,1,4,2,16777254,'2025-08-02 06:00:15',NULL,1048585,15),
(237,1,5,2,16777254,'2025-08-02 06:00:15',NULL,1048585,15),
(239,1,3,2,16777217,'2025-08-02 06:00:29',NULL,1048585,16),
(240,1,4,2,16777217,'2025-08-02 06:00:29',NULL,1048585,16),
(241,1,5,2,16777217,'2025-08-02 06:00:29',NULL,1048585,16),
(242,1,NULL,2,16777243,'2025-08-02 06:00:30',NULL,1048585,16),
(243,1,NULL,2,16777245,'2025-08-02 06:00:30',NULL,1048585,16),
(244,1,3,2,16777217,'2025-08-02 06:00:38',NULL,1048585,17),
(245,1,4,2,16777217,'2025-08-02 06:00:38',NULL,1048585,17),
(246,1,5,2,16777217,'2025-08-02 06:00:38',NULL,1048585,17),
(247,1,NULL,2,16777243,'2025-08-02 06:00:38',NULL,1048585,17),
(248,1,NULL,2,16777245,'2025-08-02 06:00:38',NULL,1048585,17),
(249,1,NULL,2,16777236,'2025-08-02 06:00:46',NULL,523,12),
(251,1,7,3,16777227,'2025-08-02 06:00:51',NULL,517,24),
(253,1,8,3,16777227,'2025-08-02 06:00:53',NULL,517,25),
(260,1,33,2,16777235,'2025-08-02 06:01:05',NULL,1048585,17),
(266,1,3,2,16777217,'2025-08-02 06:02:21',NULL,1048585,18),
(267,1,4,2,16777217,'2025-08-02 06:02:21',NULL,1048585,18),
(268,1,5,2,16777217,'2025-08-02 06:02:21',NULL,1048585,18),
(269,1,NULL,2,16777243,'2025-08-02 06:02:21',NULL,1048585,18),
(270,1,NULL,2,16777245,'2025-08-02 06:02:21',NULL,1048585,18),
(271,1,34,2,16777234,'2025-08-02 06:02:29',NULL,1048585,18),
(272,1,3,2,16777217,'2025-08-02 06:02:40',NULL,1048585,19),
(273,1,6,2,16777217,'2025-08-02 06:02:40',NULL,1048585,19),
(274,1,NULL,2,16777243,'2025-08-02 06:02:40',NULL,1048585,19),
(275,1,NULL,2,16777245,'2025-08-02 06:02:40',NULL,1048585,19),
(276,1,NULL,2,16777236,'2025-08-02 06:02:48',NULL,523,13),
(278,1,8,3,16777227,'2025-08-02 06:02:53',NULL,517,26),
(280,1,9,3,16777227,'2025-08-02 06:02:56',NULL,517,27),
(282,1,35,2,16777230,'2025-08-02 06:02:59',NULL,1048585,19),
(283,1,3,2,16777251,'2025-08-02 06:02:59','2025-08-02 06:03:02',1048585,19),
(284,1,6,2,16777251,'2025-08-02 06:02:59',NULL,1048585,19),
(286,1,3,2,16777217,'2025-08-02 06:04:52',NULL,1048585,20),
(287,1,4,2,16777217,'2025-08-02 06:04:52',NULL,1048585,20),
(288,1,5,2,16777217,'2025-08-02 06:04:52',NULL,1048585,20),
(289,1,NULL,2,16777243,'2025-08-02 06:04:52',NULL,1048585,20),
(290,1,NULL,2,16777245,'2025-08-02 06:04:52',NULL,1048585,20),
(291,1,NULL,2,16777236,'2025-08-02 06:05:29',NULL,523,14),
(292,1,36,2,16777231,'2025-08-02 06:05:29',NULL,1048585,20),
(293,1,37,3,16777227,'2025-08-02 06:05:42',NULL,517,28),
(295,1,38,3,16777227,'2025-08-02 06:05:54',NULL,517,29),
(297,1,7,3,16777227,'2025-08-02 06:06:06',NULL,517,30),
(299,1,8,3,16777227,'2025-08-02 06:06:20',NULL,517,31),
(301,1,16,3,16777227,'2025-08-02 06:06:31',NULL,517,32),
(303,1,14,3,16777227,'2025-08-02 06:06:44',NULL,517,33),
(305,1,39,3,16777227,'2025-08-02 06:06:58',NULL,517,34),
(307,1,15,3,16777227,'2025-08-02 06:07:10',NULL,517,35),
(309,1,9,3,16777227,'2025-08-02 06:07:23',NULL,517,36);
/*!40000 ALTER TABLE `notifications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oai_resumption_tokens`
--

DROP TABLE IF EXISTS `oai_resumption_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
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
/*!40101 SET character_set_client = utf8mb4 */;
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
(10,'subscriptionblockplugin',1,'enabled','1','bool'),
(11,'subscriptionblockplugin',1,'seq','2','int'),
(12,'languagetoggleblockplugin',1,'enabled','1','bool'),
(13,'languagetoggleblockplugin',1,'seq','4','int'),
(14,'informationblockplugin',1,'enabled','1','bool'),
(15,'informationblockplugin',1,'seq','7','int'),
(16,'developedbyblockplugin',1,'enabled','0','bool'),
(17,'developedbyblockplugin',1,'seq','0','int'),
(18,'dublincoremetaplugin',1,'enabled','1','bool'),
(19,'pdfjsviewerplugin',1,'enabled','1','bool'),
(20,'lensgalleyplugin',1,'enabled','1','bool'),
(21,'jatstemplateplugin',1,'enabled','1','bool'),
(22,'webfeedplugin',1,'enabled','1','bool'),
(23,'webfeedplugin',1,'displayPage','homepage','string'),
(24,'webfeedplugin',1,'displayItems','1','bool'),
(25,'webfeedplugin',1,'recentItems','30','int'),
(26,'webfeedplugin',1,'includeIdentifiers','0','bool'),
(27,'htmlarticlegalleyplugin',1,'enabled','1','bool'),
(28,'googlescholarplugin',1,'enabled','1','bool'),
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
/*!40101 SET character_set_client = utf8mb4 */;
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
/*!40101 SET character_set_client = utf8mb4 */;
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
/*!40101 SET character_set_client = utf8mb4 */;
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
/*!40101 SET character_set_client = utf8mb4 */;
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
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='More data about publications, including localized properties such as the title and abstract.';
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
(6,1,'en','copyrightHolder','Journal of Public Knowledge'),
(7,1,'fr_CA','copyrightHolder','Journal de la connaissance du public'),
(8,1,'','copyrightYear','2025'),
(9,2,'en','abstract','<p>The signaling theory suggests that dividends signal future prospects of a firm. However, recent empirical evidence from the US and the Uk does not offer a conclusive evidence on this issue. There are conflicting policy implications among financial economists so much that there is no practical dividend policy guidance to management, existing and potential investors in shareholding. Since corporate investment, financing and distribution decisions are a continuous function of management, the dividend decisions seem to rely on intuitive evaluation.</p>'),
(10,2,'en','copyrightHolder','Journal of Public Knowledge'),
(11,2,'fr_CA','copyrightHolder','Journal de la connaissance du public'),
(12,2,'','copyrightYear','2025'),
(13,2,'en','prefix','The'),
(14,2,'en','subtitle','A Review Of The Literature And Empirical Evidence'),
(15,2,'en','title','The Signalling Theory Dividends Version 2'),
(16,2,'','pages','71-98'),
(17,3,'en','abstract','The effects of pressed beet pulp silage (PBPS) replacing barley for 10% and 20% (DM basis) were studied on heavy pigs fed dairy whey-diluted diets. 60 Hypor pigs (average initial weight of 28 kg), 30 barrows and 30 gilts, were homogeneously allocated to three exper- imental groups: T1 (control) in which pigs were fed a traditional sweet whey- diluted diet (the ratio between whey and dry matter was 4.5/1); T2 in which PBPS replaced barley for 10% (DM basis) during a first period (from the beginning to the 133rd day of trial) and thereafter for 20% (DM basis); T3 in which PBPS replaced barley for 20% (DM basis) throughout the experimental period. In diets T2 and T3 feed was dairy whey-diluted as in group T1. No significant (P>0.05) differences were observed concerning growth parameters (ADG and FCR). Pigs on diets contain- ing PBPS showed significantly higher (P<0.05) percentages of lean cuts and lower percentages of fat cuts. On the whole, ham weight losses during seasoning were moderate but significantly (P<0.05) more marked for PBPS-fed pigs as a prob- able consequence of their lower adiposity degree. Fatty acid composition of ham fat was unaffected by diets. With regard to m. Semimembranosus colour, pigs receiving PBPS showed lower (P<0.05) \"L\", \"a\" and \"Chroma\" values. From an economical point of view it can be concluded that the use of PBPS (partially replacing barley) and dairy whey in heavy pig production could be of particular interest in areas where both these by products are readily available.'),
(18,3,'en','title','The influence of lactation on the quantity and quality of cashmere production'),
(19,4,'en','abstract','Archival data from an attitude survey of employees in a single multinational organization were used to examine the degree to which national culture affects the nature of job satisfaction. Responses from nine countries were compiled to create a benchmark against which nations could be individually compared. Factor analysis revealed four factors: Organizational Communication, Organizational Efficiency/Effectiveness, Organizational Support, and Personal Benefit. Comparisons of factor structures indicated that Organizational Communication exhibited the most construct equivalence, and Personal Benefit the least. The most satisfied employees were those from China, and the least satisfied from Brazil, consistent with previous findings that individuals in collectivistic nations report higher satisfaction. The research findings suggest that national cultural context exerts an effect on the nature of job satisfaction.'),
(20,4,'en','title','The Facets Of Job Satisfaction: A Nine-Nation Comparative Study Of Construct Equivalence'),
(21,5,'en','abstract','The integration of technology into the classroom is a major issue in education today. Many national and provincial initiatives specify the technology skills that students must demonstrate at each grade level. The Government of the Province of Alberta in Canada, has mandated the implementation of a new curriculum which began in September of 2000, called Information and Communication Technology. This curriculum is infused within core courses and specifies what students are “expected to know, be able to do, and be like with respect to technology” (Alberta Learning, 2000). Since teachers are required to implement this new curriculum, school jurisdictions are turning to professional development strategies and hiring standards to upgrade teachers’ computer skills to meet this goal. This paper summarizes the results of a telephone survey administered to all public school jurisdictions in the Province of Alberta with a 100% response rate. We examined the computer skills that school jurisdictions require of newly hired teachers, and the support strategies employed for currently employed teachers.'),
(22,5,'en','title','Computer Skill Requirements for New and Existing Teachers: Implications for Policy and Practice'),
(23,6,'en','abstract','In this review, the recent progress on genetic transformation of forest trees were discussed. Its described also, different applications of genetic engineering for improving forest trees or understanding the mechanisms governing genes expression in woody plants.'),
(24,6,'en','title','Genetic transformation of forest trees'),
(25,7,'en','abstract','Robert Fogelin claims that interlocutors must share a framework of background beliefs and commitments in order to fruitfully pursue argument. I refute Fogelin’s claim by investigating more thoroughly the shared background required for productive argument. I find that this background consists not in any common beliefs regarding the topic at hand, but rather in certain shared pro-cedural commitments and competencies. I suggest that Fogelin and his supporters mistakenly view shared beliefs as part of the required background for productive argument because these procedural com-mitments become more difficult to uphold when people’s beliefs diverge widely regarding the topic at hand.'),
(26,7,'en','title','Investigating the Shared Background Required for Argument: A Critique of Fogelin\'s Thesis on Deep Disagreement'),
(27,8,'en','abstract','A major goal of education is to equip children with the knowledge, skills and self-belief to be confident and informed citizens - citizens who continue to see themselves as learners beyond graduation. This paper looks at the key role of nurturing efficacy beliefs in order to learn and participate in school and society. Research findings conducted within a social studies context are presented, showing how strategy instruction can enhance self-efficacy for learning. As part of this research, Creative Problem Solving (CPS) was taught to children as a means to motivate and support learning. It is shown that the use of CPS can have positive effects on self-efficacy for learning, and be a valuable framework to involve children in decision-making that leads to social action. Implications for enhancing self-efficacy and motivation to learn in the classroom are discussed.'),
(28,8,'en','title','Developing efficacy beliefs in the classroom'),
(29,9,'en','abstract','The study of the commons has expe- rienced substantial growth and development over the past decades.1 Distinguished scholars in many disciplines had long studied how specific resources were managed or mismanaged at particular times and places (Coward 1980; De los Reyes 1980; MacKenzie 1979; Wittfogel 1957), but researchers who studied specific commons before the mid-1980s were, however, less likely than their contemporary colleagues to be well informed about the work of scholars in other disciplines, about other sec- tors in their own region of interest, or in other regions of the world.'),
(30,9,'en','title','Traditions and Trends in the Study of the Commons'),
(31,10,'en','abstract','None.'),
(32,10,'en','title','Hansen & Pinto: Reason Reclaimed'),
(33,11,'en','abstract','The Texas Water Availability Modeling System is routinely applied in administration of the water rights permit system, regional and statewide planning, and an expanding variety of other endeavors. Modeling water management in the 23 river basins of the state reflects about 8,000 water right permits and 3,400 reservoirs. Datasets are necessarily large and complex to provide the decision-support capabilities for which the modeling system was developed. New modeling features are being added, and the different types of applications are growing. Certain applications are enhanced by simplifying the simulation input datasets to focus on particular water management systems. A methodology is presented for developing a condensed dataset for a selected reservoir system that reflects the impacts of all the water rights and accompanying reservoirs removed from the original complete dataset. A set of streamflows is developed that represents flows available to the selected system considering the effects of all the other water rights in the river basin contained in the original complete model input dataset that are not included in the condensed dataset. The methodology is applied to develop a condensed model of the Brazos River Authority reservoir system based on modifying the Texas Water Availability Modeling System dataset for the Brazos River Basin.'),
(34,11,'en','title','Condensing Water Availability Models to Focus on Specific Water Management Systems'),
(35,12,'en','abstract','Environmental sustainability and sustainable development principles are vital topics that engineering education has largely failed to address. Service-learning, which integrates social service into an academic setting, is an emerging tool that can be leveraged to teach sustainable design to future engineers. We present a model of using service-learning to teach sustainable design based on the experiences of the Stanford chapter of Engineers for a Sustainable World. The model involves the identification of projects and partner organizations, a student led, project-based design course, and internships coordinated with partner organizations. The model has been very successful, although limitations and challenges exist. These are discussed along with future directions for expanding the model.'),
(36,12,'en','title','Learning Sustainable Design through Service'),
(37,13,'en','abstract','The aim of this study was to assess the influence of long-term fat supplementation on the fatty acid profile of heavy pig adipose tissue. Fifty-four Large White barrows, averaging 25 kg LW, were randomized (matched weights) to one of three isoenergetic diets supplemented with either tallow (TA), maize oil (MO), or rapeseed oil (RO). The fats were supplement- ed at 3% as fed from 25 to 110 kg LW, and at 2.5 % from 110 kg to slaughtering. Following slaughter at about 160 kg LW, backfat samples were collected from ten animals per treatment and analyzed. Fatty acid composition of backfat close- ly reflected the fatty acid composition of the supplemented fats. The backfat of pigs fed TA had the highest saturated fatty acid content (SFA) (P&lt;0.01); those fed MO had the highest content in polyunsaturated fatty acid (PUFA) and the lowest in monounsaturated fatty acid (MUFA) content; those fed RO had the highest content of linolenic acid (C18:3) and cis 11- ecosenoic acid (C20:1). Only MO treatment had an effect on linoleic acid levels and the iodine value (IV) of backfat, result- ing in levels higher than those (IV = 70; C18:2 = 15%) accepted by the Parma Consortium for dry-cured ham. The IV and unsaturation index in both layers of subcutaneous backfat tissue differed significantly between treatments. These results show that long-term dietary supplementation with different fats changes the fatty acid profile of heavy pig adipose tissue. Supplementation with rapeseed oil increases the proportion of “healthy” fatty acids in pig fat, thereby improving the nutritional quality, however the effects on the technological quality of the fat must be carefully assessed.'),
(38,13,'en','title','Sodium butyrate improves growth performance of weaned piglets during the first period after weaning'),
(39,14,'en','abstract','The Edwards Aquifer serves as the primary water supply in South-Central Texas and is the source for several major springs. In developing a plan to protect endangered species immediately downstream of San Marcos Springs, questions have been raised regarding the established concept of a hydrologic divide between the San Antonio and Barton Springs segments of the Edwards Aquifer during drought conditions. To address these questions, a water-level data collection program and a hydrogeologic study was conducted. An analysis of groundwater-level data indicate that a groundwater divide exists in the vicinity of the surface drainage divide between Onion Creek and Blanco River during wet and normal hydrologic conditions. However, analysis of data collected during the 2009 drought suggests that the groundwater divide dissipated and no longer hydrologically separated the two segments. As a result, there is potential for groundwater to flow past San Marcos Springs toward Barton Springs during major droughts. The implications for this have bearings on the management and availability of groundwater in the Edwards Aquifer. Assessments of simulations from a numerical model suggest 5 cfs could be flowing past San Marcos toward Barton springs under drought conditions. The groundwater divide appears to be influenced by recharge along Onion Creek and Blanco River and appears to be vulnerable to extended periods of little or no recharge and extensive pumping in the vicinity of Kyle and Buda. The 2009 data set shows a very low gradient in the potentiometric surface between San Marcos Springs and Kyle with very little variation in levels between drought and non-drought periods. From Kyle toward Barton Springs, the potentiometric surface slopes significantly to the north and has dramatic changes in levels between drought and non-drought periods. The source and nature of the discontinuity of the change in potentiometric gradients and dynamic water level response at Kyle is unknown. Structural influences or hydraulic properties inherent in the aquifer could be the cause of this discontinuity and may also influence the degree of hydrologic connection between San Marcos and Barton Springs. Rapid population growth and increased water demands in the Kyle and Buda areas necessitates a continual groundwater level monitoring program between San Marcos Springs and Buda to provide data for future hydrogeologic and trend analyses.'),
(40,14,'en','title','Hydrologic Connectivity in the Edwards Aquifer between San Marcos Springs and Barton Springs during 2009 Drought Conditions'),
(41,15,'en','abstract','One of the challenges still to be met in the 21st century is that of genuinely embracing diversity. How can education help to overcome the barriers that continue to exist between people on the basis of language, culture and gender? This case study takes the Atlantic Coast of Nicaragua as an example of a multilingual/multiethnic region and examines how the community university URACCAN is contributing to the development of interculturality. It describes participatory research that was carried out with university staff and students with the intention of defining an intercultural curriculum and appropriate strategies for delivering such. One model used as a basis for discussions was the Model for Community Understanding from the Wales Curriculum Council, which emphasises the belonging of the individual to different communities or cultures at the same time. Factors supporting the development of an intercultural curriculum include the university’s close involvement with the ethnic communities it serves. However, ethno-linguistic power relations within the region and the country as a whole, still militate against egalitarianism within the university. The research highlights the importance of participatory pedagogy as the basis for promoting interculturality and achieving lasting social transformation.'),
(42,15,'en','title','Towards Designing an Intercultural Curriculum: A Case Study from the Atlantic Coast of Nicaragua'),
(43,16,'en','abstract','This review presents different diseases associated with yam and the management strategies employed in combating its menace in Nigeria. The field and storage diseases are presented, anthracnose is regarded as the most widely spread of all the field diseases, while yam mosaic virus disease is considered to cause the most severe losses in yams. Dry rot is considered as the most devastating of all the storage diseases of yam. Dry rot of yams alone causes a marked reduction in the quantity, marketable value and edible portions of tubers and those reductions are more severe in stored yams. The management strategies adopted and advocated for combating the field diseases includes the use of crop rotation, fallowing, planting of healthy material, the destruction of infected crop cultivars and the use of resistant cultivars. With regards to the storage diseases, the use of Tecto (Thiabendazole), locally made dry gins or wood ash before storage has been found to protect yam tubers against fungal infection in storage. Finally, processing of yam tubers into chips or cubes increases its shelf live for a period of between 6 months and one year.'),
(44,16,'en','title','Yam diseases and its management in Nigeria'),
(45,17,'en','abstract','Aim of this research is to provide a general situation of cattle slaughtered in Cameroon, as a representative example for the Central African Sub-region. The quality and safety of beef from the abattoir of Yaoundé, the largest in Cameroon, were considered. From January 2009 to March 2012, the pre-slaughter conditions and characteristics of 1953 cattle carcasses were recorded, as well as the pH of m. longissimus thoracis 24 h after slaughter. From these carcasses, 60 were selected to represent the bulls slaughtered. The quality parameters and composition of m. longissimus thoracis were carried out. The origin of most of the cattle was the Guinea High Savannah (74.6%), and transhumance was the common production system (75.5%). Gudali (45.6%), White Fulani (33.3%) and Red Mbororo (20.3%) breeds were predominant. Carcass weight was affected by rearing system and cattle category, and it markedly varied during year. Considering meat quality, the fat content was low (1.2%) and similar between breeds, moreover Gudali showed the toughest meat. Of the cows slaughtered, 27% were pregnant and the most common abnormal conditions encountered were ectoparasites, fatigue, lameness, fungal-like skin lesions, enlarged lymph nodes, respiratory distress, nodular lesions. More than 20% of the carcasses had some organs condemned, mainly for liver flukes (5.17%), and 1.0% of them were completely condemned due to tuberculosis, that also affected 3.28% of lungs. These data could aid authorities draw up programmes with the aim to strengthen cattle production, improve beef supply, control and prevent the observed diseases, and promote the regional trade.'),
(46,17,'en','title','Influence of long-term nutrition with different dietary fats on fatty acid composition of heavy pigs backfat'),
(47,18,'en','abstract','The antimicrobial, heavy metal resistance patterns and plasmid profiles of Coliforms (Enterobacteriacea) isolated from nosocomial infections and healthy human faeces were compared. Fifteen of the 25 isolates from nosocomial infections were identified as Escherichia coli, and remaining as Kelebsiella pneumoniae. Seventy two percent of the strains isolated from nosocomial infections possess multiple resistance to antibiotics compared to 45% of strains from healthy human faeces. The difference between minimal inhibitory concentration (MIC) values of strains from clinical cases and from faeces for four heavy metals (Hg, Cu, Pb, Cd) was not significant. However most strains isolated from hospital were more tolerant to heavy metal than those from healthy persons. There was no consistent relationship between plasmid profile group and antimicrobial resistance pattern, although a conjugative plasmid (>56.4 kb) encoding resistance to heavy metals and antibiotics was recovered from eight of the strains isolated from nosocomial infections. The results indicate multidrug-resistance coliforms as a potential cause of nosocomial infection in this region.'),
(48,18,'en','title','Antimicrobial, heavy metal resistance and plasmid profile of coliforms isolated from nosocomial infections in a hospital in Isfahan, Iran'),
(49,18,'en','copyrightHolder','Journal of Public Knowledge'),
(50,18,'fr_CA','copyrightHolder','Journal de la connaissance du public'),
(51,18,'','copyrightYear','2025'),
(52,19,'en','abstract','We compare a setting where actors individually decide whom to sanction with a setting where sanctions are only implemented when actors collectively agree that a certain actor should be sanctioned. Collective sanctioning decisions are problematic due to the difficulty of reaching consensus. However, when a decision is made collectively, perverse sanctioning (e.g. punishing high contributors) by individual actors is ruled out. Therefore, collective sanctioning decisions are likely to be in the interest of the whole group.'),
(53,19,'en','title','Self-Organization in Multi-Level Institutions in Networked Environments'),
(54,20,'en','abstract','None.'),
(55,20,'en','title','Finocchiaro: Arguments About Arguments'),
(56,21,'en','title','Transformative Impact of AI Tools on Modern Education: Opportunities, Challenges, and Future Directions'),
(57,21,'en','abstract','<p>The integration of artificial intelligence (AI) tools into educational systems is reshaping pedagogical practices, offering unprecedented opportunities for personalized learning, administrative efficiency, and scalable access to quality education. This study examines the multifaceted impact of AI technologies—such as adaptive learning platforms, automated grading systems, and natural language processing (NLP)-driven tutoring tools—on students, educators, and institutions. By analyzing current applications and case studies, we highlight AI’s capacity to tailor instruction to individual learner needs, reduce educators’ administrative burdens, and provide real-time feedback. Emerging evidence suggests that AI-enhanced tools like virtual tutors and chatbots can bridge gaps in resource-limited settings, fostering inclusivity and engagement.</p>');
/*!40000 ALTER TABLE `publication_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `publications`
--

DROP TABLE IF EXISTS `publications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
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
  `issue_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`publication_id`),
  KEY `publications_primary_contact_id` (`primary_contact_id`),
  KEY `publications_section_id` (`section_id`),
  KEY `publications_submission_id` (`submission_id`),
  KEY `publications_doi_id` (`doi_id`),
  KEY `publications_issue_id_index` (`issue_id`),
  KEY `publications_url_path` (`url_path`),
  CONSTRAINT `publications_doi_id_foreign` FOREIGN KEY (`doi_id`) REFERENCES `dois` (`doi_id`) ON DELETE SET NULL,
  CONSTRAINT `publications_issue_id_foreign` FOREIGN KEY (`issue_id`) REFERENCES `issues` (`issue_id`) ON DELETE SET NULL,
  CONSTRAINT `publications_primary_contact_id` FOREIGN KEY (`primary_contact_id`) REFERENCES `authors` (`author_id`) ON DELETE SET NULL,
  CONSTRAINT `publications_section_id` FOREIGN KEY (`section_id`) REFERENCES `sections` (`section_id`) ON DELETE SET NULL,
  CONSTRAINT `publications_submission_id` FOREIGN KEY (`submission_id`) REFERENCES `submissions` (`submission_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='Each publication is one version of a submission.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `publications`
--

LOCK TABLES `publications` WRITE;
/*!40000 ALTER TABLE `publications` DISABLE KEYS */;
INSERT INTO `publications` VALUES
(1,0,'2025-08-02','2025-08-02 05:52:53',1,1,0,1,3,'mwandenga-signalling-theory',1,NULL,1),
(2,0,'2025-08-02','2025-08-02 05:53:21',5,1,0,1,1,'mwandenga',2,NULL,1),
(3,0,NULL,'2025-08-02 05:54:13',8,1,0,2,1,NULL,1,NULL,NULL),
(4,0,NULL,'2025-08-02 05:54:28',9,1,0,3,1,NULL,1,NULL,NULL),
(5,0,NULL,'2025-08-02 05:54:54',10,1,0,4,1,NULL,1,NULL,NULL),
(6,0,NULL,'2025-08-02 05:55:04',12,1,0,5,1,NULL,1,NULL,NULL),
(7,0,NULL,'2025-08-02 05:55:41',13,1,0,6,1,NULL,1,NULL,NULL),
(8,0,NULL,'2025-08-02 05:56:16',14,1,0,7,1,NULL,1,NULL,NULL),
(9,0,NULL,'2025-08-02 05:56:47',15,1,0,8,1,NULL,1,NULL,NULL),
(10,0,NULL,'2025-08-02 05:56:56',17,2,0,9,1,NULL,1,NULL,NULL),
(11,0,NULL,'2025-08-02 05:57:36',18,1,0,10,1,NULL,1,NULL,NULL),
(12,0,NULL,'2025-08-02 05:58:10',19,1,0,11,1,NULL,1,NULL,NULL),
(13,0,NULL,'2025-08-02 05:58:19',21,1,0,12,1,NULL,1,NULL,NULL),
(14,0,NULL,'2025-08-02 05:58:42',22,1,0,13,1,NULL,1,NULL,NULL),
(15,0,NULL,'2025-08-02 05:59:38',23,1,0,14,1,NULL,1,NULL,NULL),
(16,0,NULL,'2025-08-02 05:59:47',24,1,0,15,1,NULL,1,NULL,NULL),
(17,0,NULL,'2025-08-02 06:00:27',25,1,0,16,1,NULL,1,NULL,NULL),
(18,0,'2025-08-02','2025-08-02 06:02:08',26,1,0,17,3,NULL,1,NULL,1),
(19,0,NULL,'2025-08-02 06:02:18',27,1,0,18,1,NULL,1,NULL,NULL),
(20,0,NULL,'2025-08-02 06:02:38',28,2,0,19,1,NULL,1,NULL,NULL),
(21,0,NULL,'2025-08-02 06:03:34',29,1,0,20,1,NULL,1,NULL,NULL);
/*!40000 ALTER TABLE `publications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `queries`
--

DROP TABLE IF EXISTS `queries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
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
(1,1048585,2,3,1,'2025-08-02 05:54:18','2025-08-02 05:54:18',0);
/*!40000 ALTER TABLE `queries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `query_participants`
--

DROP TABLE IF EXISTS `query_participants`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
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
/*!40101 SET character_set_client = utf8mb4 */;
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
-- Table structure for table `review_assignment_settings`
--

DROP TABLE IF EXISTS `review_assignment_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `review_assignment_settings` (
  `review_assignment_settings_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Primary key.',
  `review_id` bigint(20) NOT NULL COMMENT 'Foreign key referencing record in review_assignments table',
  `locale` varchar(28) DEFAULT NULL COMMENT 'Locale key.',
  `setting_name` varchar(255) NOT NULL COMMENT 'Name of settings record.',
  `setting_value` mediumtext DEFAULT NULL COMMENT 'Settings value.',
  PRIMARY KEY (`review_assignment_settings_id`),
  UNIQUE KEY `review_assignment_settings_unique` (`review_id`,`locale`,`setting_name`),
  KEY `review_assignment_settings_review_id` (`review_id`),
  CONSTRAINT `review_assignment_settings_review_id_foreign` FOREIGN KEY (`review_id`) REFERENCES `review_assignments` (`review_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `review_assignment_settings`
--

LOCK TABLES `review_assignment_settings` WRITE;
/*!40000 ALTER TABLE `review_assignment_settings` DISABLE KEYS */;
/*!40000 ALTER TABLE `review_assignment_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `review_assignments`
--

DROP TABLE IF EXISTS `review_assignments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
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
  `date_considered` datetime DEFAULT NULL,
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
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='Data about peer review assignments for all submissions.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `review_assignments`
--

LOCK TABLES `review_assignments` WRITE;
/*!40000 ALTER TABLE `review_assignments` DISABLE KEYS */;
INSERT INTO `review_assignments` VALUES
(1,1,7,NULL,NULL,'2025-08-02 05:50:21','2025-08-02 05:50:21',NULL,NULL,NULL,NULL,'2025-08-30 00:00:00','2025-08-30 00:00:00','2025-08-02 05:50:21',0,0,0,NULL,NULL,NULL,NULL,1,3,2,1,1,NULL,0,0),
(2,1,9,NULL,NULL,'2025-08-02 05:50:24','2025-08-02 05:50:24',NULL,NULL,NULL,NULL,'2025-08-30 00:00:00','2025-08-30 00:00:00','2025-08-02 05:50:24',0,0,0,NULL,NULL,NULL,NULL,1,3,2,1,1,NULL,0,0),
(3,1,10,NULL,NULL,'2025-08-02 05:50:26','2025-08-02 05:50:26',NULL,NULL,NULL,NULL,'2025-08-30 00:00:00','2025-08-30 00:00:00','2025-08-02 05:50:26',0,0,0,NULL,NULL,NULL,NULL,1,3,2,1,1,NULL,0,0),
(4,3,9,NULL,NULL,'2025-08-02 05:54:38','2025-08-02 05:54:38',NULL,NULL,NULL,NULL,'2025-08-30 00:00:00','2025-08-30 00:00:00','2025-08-02 05:54:38',0,0,0,NULL,NULL,NULL,NULL,3,3,2,1,1,NULL,0,0),
(5,3,10,NULL,NULL,'2025-08-02 05:54:41','2025-08-02 05:54:41',NULL,NULL,NULL,NULL,'2025-08-30 00:00:00','2025-08-30 00:00:00','2025-08-02 05:54:41',0,0,0,NULL,NULL,NULL,NULL,3,3,2,1,1,NULL,0,0),
(6,5,8,NULL,NULL,'2025-08-02 05:55:15','2025-08-02 05:55:15',NULL,NULL,NULL,NULL,'2025-08-30 00:00:00','2025-08-30 00:00:00','2025-08-02 05:55:15',0,0,0,NULL,NULL,NULL,NULL,4,3,2,1,1,NULL,0,0),
(7,5,10,NULL,NULL,'2025-08-02 05:55:17','2025-08-02 05:55:17',NULL,NULL,NULL,NULL,'2025-08-30 00:00:00','2025-08-30 00:00:00','2025-08-02 05:55:17',0,0,0,NULL,NULL,NULL,NULL,4,3,2,1,1,NULL,0,0),
(8,6,7,NULL,NULL,'2025-08-02 05:55:52','2025-08-02 05:55:53',NULL,NULL,NULL,NULL,'2025-08-30 00:00:00','2025-08-30 00:00:00','2025-08-02 05:55:53',0,0,0,NULL,NULL,NULL,NULL,5,3,2,1,1,NULL,0,0),
(9,6,10,NULL,NULL,'2025-08-02 05:55:55','2025-08-02 05:55:55',NULL,NULL,NULL,NULL,'2025-08-30 00:00:00','2025-08-30 00:00:00','2025-08-02 05:55:55',0,0,0,NULL,NULL,NULL,NULL,5,3,2,1,1,NULL,0,0),
(10,7,8,NULL,5,'2025-08-02 05:56:28','2025-08-02 05:56:28','2025-08-02 05:56:37','2025-08-02 05:56:40',NULL,NULL,'2025-08-30 00:00:00','2025-08-30 00:00:00','2025-08-02 05:56:40',0,0,0,NULL,NULL,NULL,NULL,6,3,2,1,4,NULL,0,0),
(11,7,9,NULL,NULL,'2025-08-02 05:56:30','2025-08-02 05:56:30',NULL,NULL,NULL,NULL,'2025-08-30 00:00:00','2025-08-30 00:00:00','2025-08-02 05:56:30',0,0,0,NULL,NULL,NULL,NULL,6,3,2,1,1,NULL,0,0),
(12,7,10,NULL,NULL,'2025-08-02 05:56:33','2025-08-02 05:56:33',NULL,NULL,NULL,NULL,'2025-08-30 00:00:00','2025-08-30 00:00:00','2025-08-02 05:56:33',0,0,0,NULL,NULL,NULL,NULL,6,3,2,1,1,NULL,0,0),
(13,9,7,NULL,NULL,'2025-08-02 05:57:08','2025-08-02 05:57:09',NULL,NULL,NULL,NULL,'2025-08-30 00:00:00','2025-08-30 00:00:00','2025-08-02 05:57:09',0,0,0,NULL,NULL,NULL,NULL,7,3,2,1,1,NULL,0,0),
(14,9,10,NULL,NULL,'2025-08-02 05:57:11','2025-08-02 05:57:11',NULL,NULL,NULL,NULL,'2025-08-30 00:00:00','2025-08-30 00:00:00','2025-08-02 05:57:11',0,0,0,NULL,NULL,NULL,NULL,7,3,2,1,1,NULL,0,0),
(15,10,9,NULL,2,'2025-08-02 05:57:48','2025-08-02 05:57:49','2025-08-02 05:57:54','2025-08-02 05:57:57',NULL,NULL,'2025-08-30 00:00:00','2025-08-30 00:00:00','2025-08-02 05:57:57',0,0,0,NULL,NULL,NULL,NULL,8,3,2,1,4,NULL,0,0),
(16,10,10,NULL,3,'2025-08-02 05:57:51','2025-08-02 05:57:51','2025-08-02 05:58:01','2025-08-02 05:58:04',NULL,NULL,'2025-08-30 00:00:00','2025-08-30 00:00:00','2025-08-02 05:58:04',0,0,0,NULL,NULL,NULL,NULL,8,3,2,1,4,NULL,0,0),
(17,12,7,NULL,NULL,'2025-08-02 05:58:33','2025-08-02 05:58:33',NULL,NULL,NULL,NULL,'2025-08-30 00:00:00','2025-08-30 00:00:00','2025-08-02 05:58:33',0,0,0,NULL,NULL,NULL,NULL,9,3,1,1,1,NULL,0,0),
(18,12,8,NULL,NULL,'2025-08-02 05:58:35','2025-08-02 05:58:36',NULL,NULL,NULL,NULL,'2025-08-30 00:00:00','2025-08-30 00:00:00','2025-08-02 05:58:36',0,0,0,NULL,NULL,NULL,NULL,9,3,2,1,1,NULL,0,0),
(19,13,7,NULL,2,'2025-08-02 05:58:56','2025-08-02 05:58:56','2025-08-02 05:59:04','2025-08-02 05:59:07','2025-08-02 05:59:30','2025-08-02 05:59:30','2025-08-30 00:00:00','2025-08-30 00:00:00','2025-08-02 05:59:30',0,0,0,NULL,NULL,NULL,NULL,10,3,2,1,4,NULL,3,0),
(20,13,9,NULL,2,'2025-08-02 05:58:58','2025-08-02 05:58:58','2025-08-02 05:59:10','2025-08-02 05:59:14','2025-08-02 05:59:30','2025-08-02 05:59:30','2025-08-30 00:00:00','2025-08-30 00:00:00','2025-08-02 05:59:30',0,0,0,NULL,NULL,NULL,NULL,10,3,2,1,4,NULL,3,0),
(21,13,10,NULL,3,'2025-08-02 05:59:00','2025-08-02 05:59:01','2025-08-02 05:59:17','2025-08-02 05:59:20','2025-08-02 05:59:30','2025-08-02 05:59:30','2025-08-30 00:00:00','2025-08-30 00:00:00','2025-08-02 05:59:30',0,0,0,NULL,NULL,NULL,NULL,10,3,2,1,4,NULL,3,0),
(22,15,8,NULL,NULL,'2025-08-02 06:00:01','2025-08-02 06:00:02',NULL,NULL,NULL,NULL,'2025-08-30 00:00:00','2025-08-30 00:00:00','2025-08-02 06:00:02',0,0,0,NULL,NULL,NULL,NULL,11,3,2,1,1,NULL,0,0),
(23,15,9,NULL,NULL,'2025-08-02 06:00:04','2025-08-02 06:00:04',NULL,NULL,NULL,NULL,'2025-08-30 00:00:00','2025-08-30 00:00:00','2025-08-02 06:00:04',0,0,0,NULL,NULL,NULL,NULL,11,3,2,1,1,NULL,0,0),
(24,17,7,NULL,NULL,'2025-08-02 06:00:50','2025-08-02 06:00:51',NULL,NULL,NULL,NULL,'2025-08-30 00:00:00','2025-08-30 00:00:00','2025-08-02 06:00:51',0,0,0,NULL,NULL,NULL,NULL,12,3,2,1,1,NULL,0,0),
(25,17,8,NULL,NULL,'2025-08-02 06:00:53','2025-08-02 06:00:53',NULL,NULL,NULL,NULL,'2025-08-30 00:00:00','2025-08-30 00:00:00','2025-08-02 06:00:53',0,0,0,NULL,NULL,NULL,NULL,12,3,2,1,1,NULL,0,0),
(26,19,8,NULL,NULL,'2025-08-02 06:02:53','2025-08-02 06:02:53',NULL,NULL,NULL,NULL,'2025-08-30 00:00:00','2025-08-30 00:00:00','2025-08-02 06:02:53',0,0,0,NULL,NULL,NULL,NULL,13,3,2,1,1,NULL,0,0),
(27,19,9,NULL,NULL,'2025-08-02 06:02:56','2025-08-02 06:02:56',NULL,NULL,NULL,NULL,'2025-08-30 00:00:00','2025-08-30 00:00:00','2025-08-02 06:02:56',0,0,0,NULL,NULL,NULL,NULL,13,3,2,1,1,NULL,0,0),
(28,20,37,NULL,NULL,'2025-08-02 06:05:42','2025-08-02 06:05:42',NULL,NULL,NULL,NULL,'2025-08-30 00:00:00','2025-08-30 00:00:00','2025-08-02 06:05:42',0,0,0,NULL,NULL,NULL,NULL,14,3,2,1,1,NULL,0,0),
(29,20,38,NULL,NULL,'2025-08-02 06:05:54','2025-08-02 06:05:54',NULL,NULL,NULL,NULL,'2025-08-30 00:00:00','2025-08-30 00:00:00','2025-08-02 06:05:54',0,0,0,NULL,NULL,NULL,NULL,14,3,2,1,1,NULL,0,0),
(30,20,7,NULL,NULL,'2025-08-02 06:06:06','2025-08-02 06:06:06',NULL,NULL,NULL,NULL,'2025-08-30 00:00:00','2025-08-30 00:00:00','2025-08-02 06:06:06',0,0,0,NULL,NULL,NULL,NULL,14,3,2,1,1,NULL,0,0),
(31,20,8,NULL,NULL,'2025-08-02 06:06:20','2025-08-02 06:06:20',NULL,NULL,NULL,NULL,'2025-08-30 00:00:00','2025-08-30 00:00:00','2025-08-02 06:06:20',0,0,0,NULL,NULL,NULL,NULL,14,3,2,1,1,NULL,0,0),
(32,20,16,NULL,NULL,'2025-08-02 06:06:31','2025-08-02 06:06:31',NULL,NULL,NULL,NULL,'2025-08-30 00:00:00','2025-08-30 00:00:00','2025-08-02 06:06:31',0,0,0,NULL,NULL,NULL,NULL,14,3,2,1,1,NULL,0,0),
(33,20,14,NULL,NULL,'2025-08-02 06:06:44','2025-08-02 06:06:44',NULL,NULL,NULL,NULL,'2025-08-30 00:00:00','2025-08-30 00:00:00','2025-08-02 06:06:44',0,0,0,NULL,NULL,NULL,NULL,14,3,2,1,1,NULL,0,0),
(34,20,39,NULL,NULL,'2025-08-02 06:06:58','2025-08-02 06:06:58',NULL,NULL,NULL,NULL,'2025-08-30 00:00:00','2025-08-30 00:00:00','2025-08-02 06:06:58',0,0,0,NULL,NULL,NULL,NULL,14,3,2,1,1,NULL,0,0),
(35,20,15,NULL,NULL,'2025-08-02 06:07:10','2025-08-02 06:07:10',NULL,NULL,NULL,NULL,'2025-08-30 00:00:00','2025-08-30 00:00:00','2025-08-02 06:07:10',0,0,0,NULL,NULL,NULL,NULL,14,3,2,1,1,NULL,0,0),
(36,20,9,NULL,NULL,'2025-08-02 06:07:23','2025-08-02 06:07:23',NULL,NULL,NULL,NULL,'2025-08-30 00:00:00','2025-08-30 00:00:00','2025-08-02 06:07:23',0,0,0,NULL,NULL,NULL,NULL,14,3,2,1,1,NULL,0,0);
/*!40000 ALTER TABLE `review_assignments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `review_files`
--

DROP TABLE IF EXISTS `review_files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
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
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='A list of the submission files made available to each assigned reviewer.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `review_files`
--

LOCK TABLES `review_files` WRITE;
/*!40000 ALTER TABLE `review_files` DISABLE KEYS */;
INSERT INTO `review_files` VALUES
(2,1,7),
(4,1,8),
(5,1,9),
(3,1,10),
(1,1,11),
(7,2,7),
(9,2,8),
(10,2,9),
(8,2,10),
(6,2,11),
(12,3,7),
(14,3,8),
(15,3,9),
(13,3,10),
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
(39,27,43),
(40,28,45),
(41,29,45),
(42,30,45),
(43,31,45),
(44,32,45),
(45,33,45),
(46,34,45),
(47,35,45),
(48,36,45);
/*!40000 ALTER TABLE `review_files` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `review_form_element_settings`
--

DROP TABLE IF EXISTS `review_form_element_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
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
/*!40101 SET character_set_client = utf8mb4 */;
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
/*!40101 SET character_set_client = utf8mb4 */;
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
/*!40101 SET character_set_client = utf8mb4 */;
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
/*!40101 SET character_set_client = utf8mb4 */;
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
/*!40101 SET character_set_client = utf8mb4 */;
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
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='Records the files made available to reviewers for a round of reviews. These can be further customized on a per review basis with review_files.';
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
(17,19,13,3,43),
(18,20,14,3,45);
/*!40000 ALTER TABLE `review_round_files` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `review_rounds`
--

DROP TABLE IF EXISTS `review_rounds`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
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
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='Peer review assignments are organized into multiple rounds on a submission.';
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
(13,19,3,1,NULL,4),
(14,20,3,1,NULL,7);
/*!40000 ALTER TABLE `review_rounds` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reviewer_suggestion_settings`
--

DROP TABLE IF EXISTS `reviewer_suggestion_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `reviewer_suggestion_settings` (
  `reviewer_suggestion_id` bigint(20) NOT NULL COMMENT 'The foreign key mapping of this setting to reviewer_suggestions table',
  `locale` varchar(28) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` mediumtext DEFAULT NULL,
  UNIQUE KEY `reviewer_suggestion_settings_unique` (`reviewer_suggestion_id`,`locale`,`setting_name`),
  KEY `reviewer_suggestion_settings_reviewer_suggestion_id` (`reviewer_suggestion_id`),
  KEY `reviewer_suggestion_settings_locale_setting_name_index` (`setting_name`,`locale`),
  CONSTRAINT `reviewer_suggestion_settings_reviewer_suggestion_id_foreign` FOREIGN KEY (`reviewer_suggestion_id`) REFERENCES `reviewer_suggestions` (`reviewer_suggestion_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='Reviewer suggestion settings table to contain multilingual or extra information';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reviewer_suggestion_settings`
--

LOCK TABLES `reviewer_suggestion_settings` WRITE;
/*!40000 ALTER TABLE `reviewer_suggestion_settings` DISABLE KEYS */;
INSERT INTO `reviewer_suggestion_settings` VALUES
(2,'en','affiliation','Delft University of Technology'),
(2,'en','familyName','Doe'),
(2,'en','givenName','Jhon'),
(2,'en','suggestionReason','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>'),
(3,'en','affiliation','Leiden University'),
(3,'en','familyName','Von'),
(3,'en','givenName','Lisset'),
(3,'en','suggestionReason','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>'),
(4,'en','affiliation','Wageningen University & Research'),
(4,'en','familyName','Sharif'),
(4,'en','givenName','Rajek'),
(4,'en','suggestionReason','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>'),
(5,'en','affiliation','Utrecht University'),
(5,'en','familyName','Janssen'),
(5,'en','givenName','Julie'),
(5,'en','suggestionReason','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>'),
(6,'en','affiliation','McGill University'),
(6,'en','familyName','Hudson'),
(6,'en','givenName','Paul'),
(6,'en','suggestionReason','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>'),
(7,'en','affiliation','National University of Singapore'),
(7,'en','familyName','Kumar'),
(7,'en','givenName','Sabine'),
(7,'en','suggestionReason','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>'),
(8,'en','affiliation','University of Cape Town'),
(8,'en','familyName','Hellier'),
(8,'en','givenName','Stephen'),
(8,'en','suggestionReason','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>'),
(9,'en','affiliation','Imperial College London'),
(9,'en','familyName','Turner'),
(9,'en','givenName','Catherine'),
(9,'en','suggestionReason','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>'),
(10,'en','affiliation','University of Manitoba'),
(10,'en','familyName','McCrae'),
(10,'en','givenName','Aisla'),
(10,'en','suggestionReason','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>');
/*!40000 ALTER TABLE `reviewer_suggestion_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reviewer_suggestions`
--

DROP TABLE IF EXISTS `reviewer_suggestions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `reviewer_suggestions` (
  `reviewer_suggestion_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `suggesting_user_id` bigint(20) DEFAULT NULL COMMENT 'The user/author who has made the suggestion',
  `submission_id` bigint(20) NOT NULL COMMENT 'Submission at which the suggestion was made',
  `email` varchar(255) NOT NULL COMMENT 'Suggested reviewer email address',
  `orcid_id` varchar(255) DEFAULT NULL COMMENT 'Suggested reviewer optional Orcid Id',
  `approved_at` timestamp NULL DEFAULT NULL COMMENT 'If and when the suggestion approved to add/invite suggested_reviewer',
  `approver_id` bigint(20) DEFAULT NULL COMMENT 'The user who has approved the suggestion',
  `reviewer_id` bigint(20) DEFAULT NULL COMMENT 'The reviewer who has been added/invited through this suggestion',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`reviewer_suggestion_id`),
  KEY `reviewer_suggestions_suggesting_user_id` (`suggesting_user_id`),
  KEY `reviewer_suggestions_submission_id` (`submission_id`),
  KEY `reviewer_suggestions_approver_id_foreign` (`approver_id`),
  KEY `reviewer_suggestions_reviewer_id_foreign` (`reviewer_id`),
  CONSTRAINT `reviewer_suggestions_approver_id_foreign` FOREIGN KEY (`approver_id`) REFERENCES `users` (`user_id`) ON DELETE SET NULL,
  CONSTRAINT `reviewer_suggestions_reviewer_id_foreign` FOREIGN KEY (`reviewer_id`) REFERENCES `users` (`user_id`) ON DELETE SET NULL,
  CONSTRAINT `reviewer_suggestions_submission_id_foreign` FOREIGN KEY (`submission_id`) REFERENCES `submissions` (`submission_id`) ON DELETE CASCADE,
  CONSTRAINT `reviewer_suggestions_suggesting_user_id_foreign` FOREIGN KEY (`suggesting_user_id`) REFERENCES `users` (`user_id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='Author suggested reviewers at the submission time';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reviewer_suggestions`
--

LOCK TABLES `reviewer_suggestions` WRITE;
/*!40000 ALTER TABLE `reviewer_suggestions` DISABLE KEYS */;
INSERT INTO `reviewer_suggestions` VALUES
(2,36,20,'jdoe@mailinator.com',NULL,'2025-08-02 06:05:42',3,37,'2025-08-02 06:03:56','2025-08-02 06:05:42'),
(3,36,20,'lvon@mailinator.com',NULL,'2025-08-02 06:05:54',3,38,'2025-08-02 06:04:01','2025-08-02 06:05:54'),
(4,36,20,'rsharif@mailinator.com',NULL,'2025-08-02 06:06:58',3,39,'2025-08-02 06:04:07','2025-08-02 06:06:58'),
(5,36,20,'jjanssen@mailinator.com',NULL,'2025-08-02 06:06:06',3,7,'2025-08-02 06:04:13','2025-08-02 06:06:06'),
(6,36,20,'phudson@mailinator.com',NULL,'2025-08-02 06:06:20',3,8,'2025-08-02 06:04:18','2025-08-02 06:06:20'),
(7,36,20,'skumar@mailinator.com',NULL,'2025-08-02 06:06:31',3,16,'2025-08-02 06:04:24','2025-08-02 06:06:31'),
(8,36,20,'shellier@mailinator.com',NULL,'2025-08-02 06:06:44',3,14,'2025-08-02 06:04:29','2025-08-02 06:06:44'),
(9,36,20,'cturner@mailinator.com',NULL,'2025-08-02 06:07:10',3,15,'2025-08-02 06:04:35','2025-08-02 06:07:10'),
(10,36,20,'amccrae@mailinator.com',NULL,'2025-08-02 06:07:23',3,9,'2025-08-02 06:04:41','2025-08-02 06:07:23');
/*!40000 ALTER TABLE `reviewer_suggestions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ror_settings`
--

DROP TABLE IF EXISTS `ror_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `ror_settings` (
  `ror_setting_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `ror_id` bigint(20) NOT NULL,
  `locale` varchar(28) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` mediumtext DEFAULT NULL,
  PRIMARY KEY (`ror_setting_id`),
  UNIQUE KEY `ror_settings_unique` (`ror_id`,`locale`,`setting_name`),
  CONSTRAINT `ror_settings_ror_id_foreign` FOREIGN KEY (`ror_id`) REFERENCES `rors` (`ror_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='More data about Ror registry dataset cache';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ror_settings`
--

LOCK TABLES `ror_settings` WRITE;
/*!40000 ALTER TABLE `ror_settings` DISABLE KEYS */;
/*!40000 ALTER TABLE `ror_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rors`
--

DROP TABLE IF EXISTS `rors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `rors` (
  `ror_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `ror` varchar(255) NOT NULL,
  `display_locale` varchar(28) NOT NULL,
  `is_active` smallint(6) NOT NULL DEFAULT 1,
  `search_phrase` mediumtext DEFAULT NULL,
  PRIMARY KEY (`ror_id`),
  UNIQUE KEY `rors_unique` (`ror`),
  KEY `rors_display_locale` (`display_locale`),
  KEY `rors_is_active` (`is_active`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='Ror registry dataset cache';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rors`
--

LOCK TABLES `rors` WRITE;
/*!40000 ALTER TABLE `rors` DISABLE KEYS */;
/*!40000 ALTER TABLE `rors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `section_settings`
--

DROP TABLE IF EXISTS `section_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
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
/*!40101 SET character_set_client = utf8mb4 */;
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
/*!40101 SET character_set_client = utf8mb4 */;
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
('02FZnZ6LikEFOPWPz0gySVxnPvcZZBRrZi3RyWxp',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/138.0.0.0 Safari/537.36',1754113640,'YTo1OntzOjY6Il90b2tlbiI7czo0MDoiUHNmZzVhWVZXcE9hV09sUTZyNmx3UFNsRHY4NUswV3FqS0dJdmhHWSI7czo4OiJ1c2VybmFtZSI7czo1OiJhZG1pbiI7czo1OiJlbWFpbCI7czoyMzoicGtwYWRtaW5AbWFpbGluYXRvci5jb20iO3M6NTA6ImxvZ2luX3dlYl9jMWEyNmJjMDAyNDlkYzYyMWYwM2M0MTc3OGQ1NWZlMzMxZTdlOTEyIjtOO3M6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0='),
('0cgfFfSTclARjXYsjkSsrPRBJiw3Q8Et6AdkUbtA',29,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/138.0.0.0 Safari/537.36',1754114325,'YTo4OntzOjY6Il90b2tlbiI7czo0MDoiSjVJMldZZG84SnE0ZmZLREJYaXA3MDVYUzBlU21ubnBuWjN3aVZNRiI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czoxMzoiY3VycmVudExvY2FsZSI7czoyOiJlbiI7czo4OiJ1c2VybmFtZSI7czo4OiJsa3VtaWVnYSI7czo1MDoibG9naW5fd2ViX2MxYTI2YmMwMDI0OWRjNjIxZjAzYzQxNzc4ZDU1ZmUzMzFlN2U5MTIiO2k6Mjk7czo2OiJ1c2VySWQiO2k6Mjk7czo1OiJlbWFpbCI7czoyMzoibGt1bWllZ2FAbWFpbGluYXRvci5jb20iO3M6MTc6InBhc3N3b3JkX2hhc2hfd2ViIjtzOjYwOiIkMnkkMTAkSkF1NUNhOW1oNmhJV1ExZnppSWgzLnF3dk9LMFRmRVZJN3B6L3dnNVNCTks4NGxIczZCaGEiO30='),
('0W9DwDiCINoSdEcbtENEwPOBDNfm1g40IV8IHsHM',20,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/138.0.0.0 Safari/537.36',1754114098,'YTo4OntzOjY6Il90b2tlbiI7czo0MDoiUUU0UWhYZkw3Z2hGZU42Y3lVWW1QNlVIeHg4WVNFZ01VYW5SN3NMayI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czoxMzoiY3VycmVudExvY2FsZSI7czoyOiJlbiI7czo4OiJ1c2VybmFtZSI7czoxMjoiY21vbnRnb21lcmllIjtzOjUwOiJsb2dpbl93ZWJfYzFhMjZiYzAwMjQ5ZGM2MjFmMDNjNDE3NzhkNTVmZTMzMWU3ZTkxMiI7aToyMDtzOjY6InVzZXJJZCI7aToyMDtzOjU6ImVtYWlsIjtzOjI3OiJjbW9udGdvbWVyaWVAbWFpbGluYXRvci5jb20iO3M6MTc6InBhc3N3b3JkX2hhc2hfd2ViIjtzOjYwOiIkMnkkMTAkYU83Z3hkSnVQMEVvNFhBMy5HVXcydVp4bm0zay5lbGdPWU9rWkpLeEhMOG12SHhoVTRNdkciO30='),
('15dCjZxWwiaTBZ6PYYzIyCteLRzXpFEf8k0ohyFA',33,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/138.0.0.0 Safari/537.36',1754114438,'YTo4OntzOjY6Il90b2tlbiI7czo0MDoiRGQwMlh3NGJtU3BiUU5QMm5zNmd5WnJyWWJtaDJOcHZudFd4bXlKdiI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czoxMzoiY3VycmVudExvY2FsZSI7czoyOiJlbiI7czo4OiJ1c2VybmFtZSI7czoxMjoidmthcmJhc2l6YWVkIjtzOjUwOiJsb2dpbl93ZWJfYzFhMjZiYzAwMjQ5ZGM2MjFmMDNjNDE3NzhkNTVmZTMzMWU3ZTkxMiI7aTozMztzOjY6InVzZXJJZCI7aTozMztzOjU6ImVtYWlsIjtzOjI3OiJ2a2FyYmFzaXphZWRAbWFpbGluYXRvci5jb20iO3M6MTc6InBhc3N3b3JkX2hhc2hfd2ViIjtzOjYwOiIkMnkkMTAkaXpqR0U3dVM2QWZmTXlTY3B0QndlLlZNeVoydXY2Uk9DZllHM2xucHhmWHIyUmdNWk4vaWEiO30='),
('1ie1NLiuvPiDEmMHcdbTgAbgw9929e639S09c3J0',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/138.0.0.0 Safari/537.36',1754114708,'YTo1OntzOjY6Il90b2tlbiI7czo0MDoiV3JCQ3VyaWVvMHJ1QWw4blQ0U0NVdXhsb3BHalZHZTdoZVlJdWdTSSI7czo4OiJ1c2VybmFtZSI7czo1OiJhZG1pbiI7czo1OiJlbWFpbCI7czoyMzoicGtwYWRtaW5AbWFpbGluYXRvci5jb20iO3M6NTA6ImxvZ2luX3dlYl9jMWEyNmJjMDAyNDlkYzYyMWYwM2M0MTc3OGQ1NWZlMzMxZTdlOTEyIjtOO3M6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0='),
('2nKlvbhKwwwu8AUs2zHBB6thO6V7VmONuhPS8S6r',32,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/138.0.0.0 Safari/537.36',1754114430,'YTo4OntzOjY6Il90b2tlbiI7czo0MDoiUGZ5TkY0R015amR5aUNtSGg3RWplYUhuZkltd3Z5YThFTmxLNWdDSiI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czoxMzoiY3VycmVudExvY2FsZSI7czoyOiJlbiI7czo4OiJ1c2VybmFtZSI7czo2OiJycm9zc2kiO3M6NTA6ImxvZ2luX3dlYl9jMWEyNmJjMDAyNDlkYzYyMWYwM2M0MTc3OGQ1NWZlMzMxZTdlOTEyIjtpOjMyO3M6NjoidXNlcklkIjtpOjMyO3M6NToiZW1haWwiO3M6MjE6InJyb3NzaUBtYWlsaW5hdG9yLmNvbSI7czoxNzoicGFzc3dvcmRfaGFzaF93ZWIiO3M6NjA6IiQyeSQxMCRZUDBybk5KSnE4T3EyVzExbVZpTjEuRTUwYU9oamQxdzk4dDQzRXY3dVhaWnR3YXpGS3VRYSI7fQ=='),
('3SdPGitRs5MPls6qr9qBQ5O4iWgF5GLBmYZ3Zz5q',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/138.0.0.0 Safari/537.36',1754114421,'YTo3OntzOjY6Il90b2tlbiI7czo0MDoiUWFHNGZ0a0M2Z3pFV3owZ0N5R28waXBObzVLd3NnUHBOeVJZYU1IQiI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo1MDoibG9naW5fd2ViX2MxYTI2YmMwMDI0OWRjNjIxZjAzYzQxNzc4ZDU1ZmUzMzFlN2U5MTIiO2k6MztzOjY6InVzZXJJZCI7aTozO3M6ODoidXNlcm5hbWUiO3M6NzoiZGJhcm5lcyI7czo1OiJlbWFpbCI7czoyMjoiZGJhcm5lc0BtYWlsaW5hdG9yLmNvbSI7czoxNzoicGFzc3dvcmRfaGFzaF93ZWIiO3M6NjA6IiQyeSQxMCRjS2xCcDUzUTBkZ1kzdEQuS0hUY2F1VXozYng1RVExUWVaMm41RWRlcWo2ZUtxRXUxOXRGaSI7fQ=='),
('3W9jlltbZrwyGA4kTLgnTmxkY4nqE0tT16tiC1jT',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/138.0.0.0 Safari/537.36',1754114792,'YTo3OntzOjY6Il90b2tlbiI7czo0MDoiM0hyRnM4R054R0hramRoMzdEY2ozUW1xT0k2VDVmcmpKUjhaUUJCaCI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo1MDoibG9naW5fd2ViX2MxYTI2YmMwMDI0OWRjNjIxZjAzYzQxNzc4ZDU1ZmUzMzFlN2U5MTIiO2k6MztzOjY6InVzZXJJZCI7aTozO3M6ODoidXNlcm5hbWUiO3M6NzoiZGJhcm5lcyI7czo1OiJlbWFpbCI7czoyMjoiZGJhcm5lc0BtYWlsaW5hdG9yLmNvbSI7czoxNzoicGFzc3dvcmRfaGFzaF93ZWIiO3M6NjA6IiQyeSQxMCRTSVVONmFyOVUxcEZ2b1BiNEpkN2x1YVpCaXY1QU80RjFLTlRhNndvQ0MvTmk1LjA2cS9TUyI7fQ=='),
('5ADC3id5L4cMNZ8viey6y2avgYnnayKpx3XJY68r',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/138.0.0.0 Safari/537.36',1754114732,'YTo3OntzOjY6Il90b2tlbiI7czo0MDoicjREdHlnVnljZFdOam44TUhNTHZaOEdMVDd0RDVEcXRXMlJtdU1GQiI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo1MDoibG9naW5fd2ViX2MxYTI2YmMwMDI0OWRjNjIxZjAzYzQxNzc4ZDU1ZmUzMzFlN2U5MTIiO2k6MztzOjY6InVzZXJJZCI7aTozO3M6ODoidXNlcm5hbWUiO3M6NzoiZGJhcm5lcyI7czo1OiJlbWFpbCI7czoyMjoiZGJhcm5lc0BtYWlsaW5hdG9yLmNvbSI7czoxNzoicGFzc3dvcmRfaGFzaF93ZWIiO3M6NjA6IiQyeSQxMCR0MG1hM3JBaE13eloyYzhNTnVNbk4uVTltRUk3TjVwUi9ELmdacWJnS2ZyRVUwek11WTdPeSI7fQ=='),
('5sShPPU5fB3DaNDlMrsU2ytKaKv2wNKiECAUsT6q',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/138.0.0.0 Safari/537.36',1754114757,'YTo3OntzOjY6Il90b2tlbiI7czo0MDoiMDk3Q2JMMFQybGNYQUxEQWJsZVptd1dqYUFtNVk2S2FRY1NnUFB0UyI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo1MDoibG9naW5fd2ViX2MxYTI2YmMwMDI0OWRjNjIxZjAzYzQxNzc4ZDU1ZmUzMzFlN2U5MTIiO2k6MztzOjY6InVzZXJJZCI7aTozO3M6ODoidXNlcm5hbWUiO3M6NzoiZGJhcm5lcyI7czo1OiJlbWFpbCI7czoyMjoiZGJhcm5lc0BtYWlsaW5hdG9yLmNvbSI7czoxNzoicGFzc3dvcmRfaGFzaF93ZWIiO3M6NjA6IiQyeSQxMCRIc1RCdVdZZVNCR1ZhZldhRmxXa2t1YlRYOXhSZ0diS1FDSVBTTUIxdVdlSUhkSmhrY0dTUyI7fQ=='),
('5uFysKlTtC77bVCf35dZQLSwkgWC3D6hVZGrRrc4',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/138.0.0.0 Safari/537.36',1754113655,'YTozOntzOjY6Il90b2tlbiI7czo0MDoibFo1a2ppZGVzMUs3MjcyR2ZrUTlnSlZqUkRvWGkxdnBjWjZRZWxYeSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czoxMzoiY3VycmVudExvY2FsZSI7czoyOiJlbiI7fQ=='),
('6uCLyGsZJcXjXXiqVsJf3r3KJMR0DDAIs7njQcvg',25,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/138.0.0.0 Safari/537.36',1754114219,'YTo4OntzOjY6Il90b2tlbiI7czo0MDoib2tjc2c5N1ZZNG5vVllvYXVqUUV4TUtLUUxQUTB1NTNWSUN3MWV0NCI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czoxMzoiY3VycmVudExvY2FsZSI7czoyOiJlbiI7czo4OiJ1c2VybmFtZSI7czo5OiJmcGFnbGllcmkiO3M6NTA6ImxvZ2luX3dlYl9jMWEyNmJjMDAyNDlkYzYyMWYwM2M0MTc3OGQ1NWZlMzMxZTdlOTEyIjtpOjI1O3M6NjoidXNlcklkIjtpOjI1O3M6NToiZW1haWwiO3M6MjQ6ImZwYWdsaWVyaUBtYWlsaW5hdG9yLmNvbSI7czoxNzoicGFzc3dvcmRfaGFzaF93ZWIiO3M6NjA6IiQyeSQxMCR3dU1OWnJmaDljQnNiRE9jWXF3Q0hPYzFtWmt3d3RPTHhRVy9EOHVjeGRVdXMvakhhem41ZSI7fQ=='),
('76WDAeTW11hFVgxlfk7ntJEZs7Ek3hxSXLiCUZM6',1,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/138.0.0.0 Safari/537.36',1754113742,'YTo3OntzOjY6Il90b2tlbiI7czo0MDoiS0FVVEpGWkdCZTVFYmRtS2VLaGtLOEtvWXUxY2JqUUV3bjRXU2dVaCI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo1MDoibG9naW5fd2ViX2MxYTI2YmMwMDI0OWRjNjIxZjAzYzQxNzc4ZDU1ZmUzMzFlN2U5MTIiO2k6MTtzOjY6InVzZXJJZCI7aToxO3M6ODoidXNlcm5hbWUiO3M6NToiYWRtaW4iO3M6NToiZW1haWwiO3M6MjM6InBrcGFkbWluQG1haWxpbmF0b3IuY29tIjtzOjE3OiJwYXNzd29yZF9oYXNoX3dlYiI7czo2MDoiJDJ5JDEwJDIzUGY1VVlKQkF2cDcxZWloVi85Uy53Z2lNcjhHR0w3b2RQblY4RUZXTjNjZm9PTEhWSHJpIjt9'),
('7wxp75OMUGK3DXSCnDfmmoCNbV6OfeCTV4w2dleZ',34,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/138.0.0.0 Safari/537.36',1754114541,'YTo4OntzOjY6Il90b2tlbiI7czo0MDoiNFhWdWNPR2d4UTJNeGVvZ1FsUjl1dHVjT1JVMEZBa3RCa1RZUjBXNCI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czoxMzoiY3VycmVudExvY2FsZSI7czoyOiJlbiI7czo4OiJ1c2VybmFtZSI7czoxMToidndpbGxpYW1zb24iO3M6NTA6ImxvZ2luX3dlYl9jMWEyNmJjMDAyNDlkYzYyMWYwM2M0MTc3OGQ1NWZlMzMxZTdlOTEyIjtpOjM0O3M6NjoidXNlcklkIjtpOjM0O3M6NToiZW1haWwiO3M6MjY6InZ3aWxsaWFtc29uQG1haWxpbmF0b3IuY29tIjtzOjE3OiJwYXNzd29yZF9oYXNoX3dlYiI7czo2MDoiJDJ5JDEwJDdWVVhGSlpRZE1tZi5xL2p0MTlHQk9XVzJNTnVCR05MekZFeVkyTGMvRko3N29iLi9ORG1TIjt9'),
('7zWyCdX36UArMa64a2mPYV4PzD9z3iMs8xPLy5Ue',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/138.0.0.0 Safari/537.36',1754114851,'YTo4OntzOjY6Il90b2tlbiI7czo0MDoibTIyN0d5R3RIQWNFV01hS0ZocWFVWVB1V0pHWVM0RVlXRmhJMlJORSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo1MDoibG9naW5fd2ViX2MxYTI2YmMwMDI0OWRjNjIxZjAzYzQxNzc4ZDU1ZmUzMzFlN2U5MTIiO2k6MztzOjY6InVzZXJJZCI7aTozO3M6ODoidXNlcm5hbWUiO3M6NzoiZGJhcm5lcyI7czo1OiJlbWFpbCI7czoyMjoiZGJhcm5lc0BtYWlsaW5hdG9yLmNvbSI7czoxNzoicGFzc3dvcmRfaGFzaF93ZWIiO3M6NjA6IiQyeSQxMCRncG9yalFPYi84R1ZSLkNLdmp6djF1VGhlYkFoMS5zTm9sSTIwRm42S3RXUC9wMVN6dzBaMiI7czoxMzoiY3VycmVudExvY2FsZSI7czoyOiJlbiI7fQ=='),
('8BAcow4XBdHlhVGCBMTeGnSNETGfftMkBvvqs6RZ',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/138.0.0.0 Safari/537.36',1754114284,'YTo1OntzOjY6Il90b2tlbiI7czo0MDoiUWxINXVsQVNnUUxHR0RuamNnTmdyRDA3SjFYZGplSEVqRk04dGYyUyI7czo4OiJ1c2VybmFtZSI7czo4OiJhZ2FsbGVnbyI7czo1OiJlbWFpbCI7czoyMzoiYWdhbGxlZ29AbWFpbGluYXRvci5jb20iO3M6NTA6ImxvZ2luX3dlYl9jMWEyNmJjMDAyNDlkYzYyMWYwM2M0MTc3OGQ1NWZlMzMxZTdlOTEyIjtOO3M6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0='),
('8esmTCB3KGh8enVy3cCEdOHnWvgGw3liOQiciT47',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/138.0.0.0 Safari/537.36',1754114518,'YTo4OntzOjY6Il90b2tlbiI7czo0MDoiNHRZdHhWemNVTVdqcVJhcWJHdmtvbm9LcExLVFhBZmF1SUpMa0JDcyI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo1MDoibG9naW5fd2ViX2MxYTI2YmMwMDI0OWRjNjIxZjAzYzQxNzc4ZDU1ZmUzMzFlN2U5MTIiO2k6MztzOjY6InVzZXJJZCI7aTozO3M6ODoidXNlcm5hbWUiO3M6NzoiZGJhcm5lcyI7czo1OiJlbWFpbCI7czoyMjoiZGJhcm5lc0BtYWlsaW5hdG9yLmNvbSI7czoxNzoicGFzc3dvcmRfaGFzaF93ZWIiO3M6NjA6IiQyeSQxMCR5SnpUeHJjdjZKWHZqelZqQVhDSG5PRW91V29tUXMuU1pnSVdtOU1YbHdMU2l2Ui9FSjhTaSI7czoxMzoiY3VycmVudExvY2FsZSI7czoyOiJlbiI7fQ=='),
('8jYEpIllaotiROWuai2Dz7xFMkfNa3NOWTnihgL9',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/138.0.0.0 Safari/537.36',1754113429,'YTo1OntzOjY6Il90b2tlbiI7czo0MDoiTTNrUHRNdzVmTDZNMTd0WkRsQlFvRE1RbUhWVWVpdnR0RTIxUUlFYSI7czo4OiJ1c2VybmFtZSI7czo1OiJhZG1pbiI7czo1OiJlbWFpbCI7czoyMzoicGtwYWRtaW5AbWFpbGluYXRvci5jb20iO3M6NTA6ImxvZ2luX3dlYl9jMWEyNmJjMDAyNDlkYzYyMWYwM2M0MTc3OGQ1NWZlMzMxZTdlOTEyIjtOO3M6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0='),
('8mr8cS5v1rXHIADSS7dPSdKLIL9RQlbTqlasxCZV',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/138.0.0.0 Safari/537.36',1754113497,'YTozOntzOjY6Il90b2tlbiI7czo0MDoidmVISEFrS3ZoV3lmSVEzQm1PdUdCWmRYYUVJVEdsbnVjR3h5YVNtSSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czoxMzoiY3VycmVudExvY2FsZSI7czoyOiJlbiI7fQ=='),
('8VpwCTjwFetWmTBQMqWvc7cHjhWKV45pLduk0sVv',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/138.0.0.0 Safari/537.36',1754114807,'YTo3OntzOjY6Il90b2tlbiI7czo0MDoiSXR4UGV3VzFWdFVSWWdORzd6OUNnM093ZWpsOGlTZzM2cXU4bWhDSyI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo1MDoibG9naW5fd2ViX2MxYTI2YmMwMDI0OWRjNjIxZjAzYzQxNzc4ZDU1ZmUzMzFlN2U5MTIiO2k6MztzOjY6InVzZXJJZCI7aTozO3M6ODoidXNlcm5hbWUiO3M6NzoiZGJhcm5lcyI7czo1OiJlbWFpbCI7czoyMjoiZGJhcm5lc0BtYWlsaW5hdG9yLmNvbSI7czoxNzoicGFzc3dvcmRfaGFzaF93ZWIiO3M6NjA6IiQyeSQxMCRVYXJwSFZrYWpyWHVoNjRheGtUbEN1eVF2NmhhSHZNcDEwRFNzVkpkWGtNemJkajZmRnJ4dSI7fQ=='),
('9MpTWVyOCHTDEi06CHOxXDkUIk3P975TkeVNeUxX',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/138.0.0.0 Safari/537.36',1754113557,'YTo1OntzOjY6Il90b2tlbiI7czo0MDoiMkhjN0VGVjhZdks5Uk9vbmw0RjhNbnZ4aG5uRFpudVdsa0dIOGk5ZyI7czo4OiJ1c2VybmFtZSI7czo1OiJhZG1pbiI7czo1OiJlbWFpbCI7czoyMzoicGtwYWRtaW5AbWFpbGluYXRvci5jb20iO3M6NTA6ImxvZ2luX3dlYl9jMWEyNmJjMDAyNDlkYzYyMWYwM2M0MTc3OGQ1NWZlMzMxZTdlOTEyIjtOO3M6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0='),
('9SmWBZDPuUo33Bj0epBNSdEkHrOS9CPM1WbK62CR',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/138.0.0.0 Safari/537.36',1754114054,'YTo3OntzOjY6Il90b2tlbiI7czo0MDoiRHh4Y3VnZHIzRWtuMmFvYkpCZEx6UXAwclpXMERVYmQ1bkxKc1JjYiI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo1MDoibG9naW5fd2ViX2MxYTI2YmMwMDI0OWRjNjIxZjAzYzQxNzc4ZDU1ZmUzMzFlN2U5MTIiO2k6MztzOjY6InVzZXJJZCI7aTozO3M6ODoidXNlcm5hbWUiO3M6NzoiZGJhcm5lcyI7czo1OiJlbWFpbCI7czoyMjoiZGJhcm5lc0BtYWlsaW5hdG9yLmNvbSI7czoxNzoicGFzc3dvcmRfaGFzaF93ZWIiO3M6NjA6IiQyeSQxMCRaRDBFOXVGcVNaN1BMR2Z5ZDc1Q0suTzJSbks3WkJHMy5GcUdiNnFRMmU1Sy5kLmdDZmdCaSI7fQ=='),
('arj8XaDDMdNzvG0OAxNE9mWXkR38clf4n790TcQ2',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/138.0.0.0 Safari/537.36',1754114278,'YTo1OntzOjY6Il90b2tlbiI7czo0MDoiMldXZ0xHUGRUME1oSEN5a1BUQ0ZuUkRqM3NSNDF5OVNRVlhwV2NIeiI7czo4OiJ1c2VybmFtZSI7czo3OiJhbWNjcmFlIjtzOjU6ImVtYWlsIjtzOjIyOiJhbWNjcmFlQG1haWxpbmF0b3IuY29tIjtzOjUwOiJsb2dpbl93ZWJfYzFhMjZiYzAwMjQ5ZGM2MjFmMDNjNDE3NzhkNTVmZTMzMWU3ZTkxMiI7TjtzOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19'),
('aWcfarxVdM0wQmZNniFqGXl5khY0ymy7i6QoJTFL',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/138.0.0.0 Safari/537.36',1754114503,'YTo4OntzOjY6Il90b2tlbiI7czo0MDoic09XajRqYVBYRG03b3N5Y25WR2JwUFlEaE10bUVlOTFvQkFmcnFWeSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo1MDoibG9naW5fd2ViX2MxYTI2YmMwMDI0OWRjNjIxZjAzYzQxNzc4ZDU1ZmUzMzFlN2U5MTIiO2k6MztzOjY6InVzZXJJZCI7aTozO3M6ODoidXNlcm5hbWUiO3M6NzoiZGJhcm5lcyI7czo1OiJlbWFpbCI7czoyMjoiZGJhcm5lc0BtYWlsaW5hdG9yLmNvbSI7czoxNzoicGFzc3dvcmRfaGFzaF93ZWIiO3M6NjA6IiQyeSQxMCRCY3hnY3lTeHZlajlkaHNjN3ZFSi8uZU5BUkt0RFVSeUVNUTl6OFhYV0dsenlYZ1pFWWtaUyI7czoxMzoiY3VycmVudExvY2FsZSI7czoyOiJlbiI7fQ=='),
('bI5afF0TaikodDnOqloYxaJvigRbuKy4inoWXjU0',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/138.0.0.0 Safari/537.36',1754114479,'YTo3OntzOjY6Il90b2tlbiI7czo0MDoiSEZhZ1RxU1hzbGdQaGNORDRMWEJIbTFNNEpDS1o2TlRkZzlWZlRsTCI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo1MDoibG9naW5fd2ViX2MxYTI2YmMwMDI0OWRjNjIxZjAzYzQxNzc4ZDU1ZmUzMzFlN2U5MTIiO2k6MztzOjY6InVzZXJJZCI7aTozO3M6ODoidXNlcm5hbWUiO3M6NzoiZGJhcm5lcyI7czo1OiJlbWFpbCI7czoyMjoiZGJhcm5lc0BtYWlsaW5hdG9yLmNvbSI7czoxNzoicGFzc3dvcmRfaGFzaF93ZWIiO3M6NjA6IiQyeSQxMCRYenJIODl6bG0xZS9lZjFCNnppbll1NU5YQjQubTdjTzVQVGM1LkVkVko2akpaQkJhSjBMLiI7fQ=='),
('bJbEU2l6jIsubaCTOqTeKhnrSuNJonudUSdPuQpt',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/138.0.0.0 Safari/537.36',1754114714,'YTo1OntzOjY6Il90b2tlbiI7czo0MDoiU3JaUVRyRWdaMjRWbE9pUXVTY1NwN2JrdEpBSUozeml1c2Rab0dCTyI7czo4OiJ1c2VybmFtZSI7czo3OiJkYmFybmVzIjtzOjU6ImVtYWlsIjtzOjIyOiJkYmFybmVzQG1haWxpbmF0b3IuY29tIjtzOjUwOiJsb2dpbl93ZWJfYzFhMjZiYzAwMjQ5ZGM2MjFmMDNjNDE3NzhkNTVmZTMzMWU3ZTkxMiI7TjtzOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19'),
('BOc9Nq8VOBOwNFR5wjKi88zmMjGjlfiGjOpX8Th6',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/138.0.0.0 Safari/537.36',1754113624,'YTozOntzOjY6Il90b2tlbiI7czo0MDoialhRVXdhNGhZdDkycnJ5RUZiUmhSZmJpVWZFSkt0Z2JTSEdMbUFZbCI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czoxMzoiY3VycmVudExvY2FsZSI7czoyOiJlbiI7fQ=='),
('botJWUmCFzGdWg6ZW1nKet8dmVBLVWLxpyoYOMaC',1,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/138.0.0.0 Safari/537.36',1754113341,'YTo3OntzOjY6Il90b2tlbiI7czo0MDoiZUhJSzVqUkNoMXpTQkFOS1Nvc2dZcjhsckFxWjRTSWIyTWtzRlNRMCI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo1MDoibG9naW5fd2ViX2MxYTI2YmMwMDI0OWRjNjIxZjAzYzQxNzc4ZDU1ZmUzMzFlN2U5MTIiO2k6MTtzOjY6InVzZXJJZCI7aToxO3M6ODoidXNlcm5hbWUiO3M6NToiYWRtaW4iO3M6NToiZW1haWwiO3M6MjM6InBrcGFkbWluQG1haWxpbmF0b3IuY29tIjtzOjE3OiJwYXNzd29yZF9oYXNoX3dlYiI7czo2MDoiJDJ5JDEwJGFvby5WbUEzZy8uNEV4Q2NlNEhjRWVMeWFJVEtwSHExTE90MVZtQXp0WDVBQVlsQUFENjguIjt9'),
('c0jFjC3eCzb4Yz3Rohv0qXq52FLTdOaFrz1f2n3J',1,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/138.0.0.0 Safari/537.36',1754114720,'YTo4OntzOjY6Il90b2tlbiI7czo0MDoicmZ6a0JyTVNKdUZ5UHFBeHkwa1R0bWp3eUtsbDUyeFRSMWxqWlBEQiI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo1MDoibG9naW5fd2ViX2MxYTI2YmMwMDI0OWRjNjIxZjAzYzQxNzc4ZDU1ZmUzMzFlN2U5MTIiO2k6MTtzOjY6InVzZXJJZCI7aToxO3M6ODoidXNlcm5hbWUiO3M6NToiYWRtaW4iO3M6NToiZW1haWwiO3M6MjM6InBrcGFkbWluQG1haWxpbmF0b3IuY29tIjtzOjE3OiJwYXNzd29yZF9oYXNoX3dlYiI7czo2MDoiJDJ5JDEwJE1vTTMwb0dNeHJsdGF3cFJFelVXb09QQ2Z3aFBIQ0djbllQdm5RYjFCdkROZ1N2T25Mbk0uIjtzOjEzOiJjdXJyZW50TG9jYWxlIjtzOjI6ImVuIjt9'),
('c9ekWbrlPZnDgGxXFwsRCkKuw9yJQUQEWdV5iAbL',17,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/138.0.0.0 Safari/537.36',1754113813,'YTo4OntzOjY6Il90b2tlbiI7czo0MDoiazFDZWVlSWY3QzRjNGk3eHptWUQ1VWJQV3ozNTI5STVEc1MzR09FViI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czoxMzoiY3VycmVudExvY2FsZSI7czoyOiJlbiI7czo4OiJ1c2VybmFtZSI7czoxMDoiYW13YW5kZW5nYSI7czo1MDoibG9naW5fd2ViX2MxYTI2YmMwMDI0OWRjNjIxZjAzYzQxNzc4ZDU1ZmUzMzFlN2U5MTIiO2k6MTc7czo2OiJ1c2VySWQiO2k6MTc7czo1OiJlbWFpbCI7czoyNToiYW13YW5kZW5nYUBtYWlsaW5hdG9yLmNvbSI7czoxNzoicGFzc3dvcmRfaGFzaF93ZWIiO3M6NjA6IiQyeSQxMCQwSTdwRktxODBlaWtVanA3Q3UzWVZ1WFJIcE02bmhnMTZjMVEvajdoTUlybXhPOENvQldabSI7fQ=='),
('CB3DaZXjKNGAy3m7G30MR6JteM6QTxxutzulZEwk',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/138.0.0.0 Safari/537.36',1754114342,'YTo1OntzOjY6Il90b2tlbiI7czo0MDoiNWlyU0dGUGJhZ01XVHVzMzBCWnhQUEoyYUZxTzI2RXBSWU4xc0hsbSI7czo4OiJ1c2VybmFtZSI7czo3OiJkYmFybmVzIjtzOjU6ImVtYWlsIjtzOjIyOiJkYmFybmVzQG1haWxpbmF0b3IuY29tIjtzOjUwOiJsb2dpbl93ZWJfYzFhMjZiYzAwMjQ5ZGM2MjFmMDNjNDE3NzhkNTVmZTMzMWU3ZTkxMiI7TjtzOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19'),
('cB6IHm8jkrFo1HPmAbs0XJ4PLv2OHRtDDs2S4Z8t',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/138.0.0.0 Safari/537.36',1754113467,'YTo1OntzOjY6Il90b2tlbiI7czo0MDoiRVV3TUNWUWp5RUNZUnhtNks4U0gyTVFPRk1XMHNtYzBFdWo3c0dNRCI7czo4OiJ1c2VybmFtZSI7czo1OiJhZG1pbiI7czo1OiJlbWFpbCI7czoyMzoicGtwYWRtaW5AbWFpbGluYXRvci5jb20iO3M6NTA6ImxvZ2luX3dlYl9jMWEyNmJjMDAyNDlkYzYyMWYwM2M0MTc3OGQ1NWZlMzMxZTdlOTEyIjtOO3M6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0='),
('CHcxNrvfEQpEw2GjHyty8uxxSukFnfCQs0rEkBAv',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/138.0.0.0 Safari/537.36',1754114194,'YTo1OntzOjY6Il90b2tlbiI7czo0MDoiREJ0UWloQWg1Nm52NnNYWWdlQk5uRE1WTXBlb0ZybFRSZHBjZDE4ZSI7czo4OiJ1c2VybmFtZSI7czo3OiJkYmFybmVzIjtzOjU6ImVtYWlsIjtzOjIyOiJkYmFybmVzQG1haWxpbmF0b3IuY29tIjtzOjUwOiJsb2dpbl93ZWJfYzFhMjZiYzAwMjQ5ZGM2MjFmMDNjNDE3NzhkNTVmZTMzMWU3ZTkxMiI7TjtzOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19'),
('cJGul8b56gycJghVFwjqHGXNT1cW3A0cfBrpQHBH',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/138.0.0.0 Safari/537.36',1754113520,'YTozOntzOjY6Il90b2tlbiI7czo0MDoibEhpRDR2bk5tS0tQejB2MXF4czhHeGpoMnhlelJiQ21ITlV3ZTBWNiI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czoxMzoiY3VycmVudExvY2FsZSI7czoyOiJlbiI7fQ=='),
('cPz9iLVY4oxnWsl9bSaGGzI9gAiXBDcDOaTduoRL',5,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/138.0.0.0 Safari/537.36',1754114021,'YTo5OntzOjY6Il90b2tlbiI7czo0MDoiWTFqVENhQklRUGJleHZYMU5XWmp4ZkRyMHFmVlFucXpENDRySEZVYyI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo1MDoibG9naW5fd2ViX2MxYTI2YmMwMDI0OWRjNjIxZjAzYzQxNzc4ZDU1ZmUzMzFlN2U5MTIiO2k6NTtzOjY6InVzZXJJZCI7aTo1O3M6ODoidXNlcm5hbWUiO3M6ODoic2JlcmFyZG8iO3M6NToiZW1haWwiO3M6MjM6InNiZXJhcmRvQG1haWxpbmF0b3IuY29tIjtzOjE3OiJwYXNzd29yZF9oYXNoX3dlYiI7czo2MDoiJDJ5JDEwJGViOEMySk5SOWZ4U2R5SnFSb2tzeGVxck5DblMwM1I3dTI0YnoxOGdXaVZzY1JnTEo1MzhLIjtzOjEzOiJjdXJyZW50TG9jYWxlIjtzOjI6ImVuIjtzOjEwOiJzaWduZWRJbkFzIjtpOjM7fQ=='),
('Ct3HXDpBhpGH1D9eJkoeXHgvIQqvXBL9OKgsoZNy',22,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/138.0.0.0 Safari/537.36',1754114144,'YTo4OntzOjY6Il90b2tlbiI7czo0MDoiRjlWbmlCUUtrRmxBUWJSakdrWWRXTHdvc1JoclpWT0R5S0M0NVk1YyI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czoxMzoiY3VycmVudExvY2FsZSI7czoyOiJlbiI7czo4OiJ1c2VybmFtZSI7czo5OiJkcGhpbGxpcHMiO3M6NTA6ImxvZ2luX3dlYl9jMWEyNmJjMDAyNDlkYzYyMWYwM2M0MTc3OGQ1NWZlMzMxZTdlOTEyIjtpOjIyO3M6NjoidXNlcklkIjtpOjIyO3M6NToiZW1haWwiO3M6MjQ6ImRwaGlsbGlwc0BtYWlsaW5hdG9yLmNvbSI7czoxNzoicGFzc3dvcmRfaGFzaF93ZWIiO3M6NjA6IiQyeSQxMCRtVlBBNW5VNW01MzFDMUNsb1BHM0hPVGFEWlo5UXA1S1k3UjFvdnoyL0NEME9iRE85OVdHZSI7fQ=='),
('CuK5QOSyd63AI0tlMnlLWSg3klrOialfJQjeha7j',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/138.0.0.0 Safari/537.36',1754114552,'YTo3OntzOjY6Il90b2tlbiI7czo0MDoia3hKaHlBTmVnYU9BMDRIdlBRTHhyRXN1YmNteXFxOGhYQ2dOQnBvaCI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo1MDoibG9naW5fd2ViX2MxYTI2YmMwMDI0OWRjNjIxZjAzYzQxNzc4ZDU1ZmUzMzFlN2U5MTIiO2k6MztzOjY6InVzZXJJZCI7aTozO3M6ODoidXNlcm5hbWUiO3M6NzoiZGJhcm5lcyI7czo1OiJlbWFpbCI7czoyMjoiZGJhcm5lc0BtYWlsaW5hdG9yLmNvbSI7czoxNzoicGFzc3dvcmRfaGFzaF93ZWIiO3M6NjA6IiQyeSQxMCRrZUJDUE9mS0xRRHBuNi5kN3JwLkx1UnMwS0hjN24zRWt0TDZuQ09vZURpZG1SUE5WV1ZubSI7fQ=='),
('D7O2DV6pQrJpFtEcormPoeKzHeAN6ujfmngeVwZw',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/138.0.0.0 Safari/537.36',1754113974,'YTo4OntzOjY6Il90b2tlbiI7czo0MDoia2xiNHNYd0tKOXMzQlhCd00zNzRyTVBPaERUcnFZb21JeXJnVmtNWCI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czoxMzoiY3VycmVudExvY2FsZSI7czoyOiJlbiI7czo1MDoibG9naW5fd2ViX2MxYTI2YmMwMDI0OWRjNjIxZjAzYzQxNzc4ZDU1ZmUzMzFlN2U5MTIiO2k6MztzOjY6InVzZXJJZCI7aTozO3M6ODoidXNlcm5hbWUiO3M6NzoiZGJhcm5lcyI7czo1OiJlbWFpbCI7czoyMjoiZGJhcm5lc0BtYWlsaW5hdG9yLmNvbSI7czoxNzoicGFzc3dvcmRfaGFzaF93ZWIiO3M6NjA6IiQyeSQxMCQzeWE3bjE1WU9JdjNnMnJocFJ3NE4udm9kTk0ueU4uaFVLUWxrSmFzQ3dCYUdrMnBHc2FzbSI7fQ=='),
('dK0cuOYvPvmm5Bd9aZ44hO9Ngs0HqllIk8P9cTWZ',5,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/138.0.0.0 Safari/537.36',1754114013,'YTo5OntzOjY6Il90b2tlbiI7czo0MDoibERVY1hjVTNPcEtwUlJwV3lscVhxZk9ZNnNTS2Y3MUFPMHB0WnRMMyI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo1MDoibG9naW5fd2ViX2MxYTI2YmMwMDI0OWRjNjIxZjAzYzQxNzc4ZDU1ZmUzMzFlN2U5MTIiO2k6NTtzOjY6InVzZXJJZCI7aTo1O3M6ODoidXNlcm5hbWUiO3M6ODoic2JlcmFyZG8iO3M6NToiZW1haWwiO3M6MjM6InNiZXJhcmRvQG1haWxpbmF0b3IuY29tIjtzOjE3OiJwYXNzd29yZF9oYXNoX3dlYiI7czo2MDoiJDJ5JDEwJGViOEMySk5SOWZ4U2R5SnFSb2tzeGVxck5DblMwM1I3dTI0YnoxOGdXaVZzY1JnTEo1MzhLIjtzOjEzOiJjdXJyZW50TG9jYWxlIjtzOjI6ImVuIjtzOjEwOiJzaWduZWRJbkFzIjtpOjM7fQ=='),
('e4IsMDO1Ed385VGFX3JcbcadeyflfRIVUFkKuZFE',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/138.0.0.0 Safari/537.36',1754113411,'YTo1OntzOjY6Il90b2tlbiI7czo0MDoia3l3V2loVWN6YVA3SWIzUnlqVjlneno4Z09VNXZ1Rk9JSzVJNHJxbyI7czo4OiJ1c2VybmFtZSI7czo1OiJhZG1pbiI7czo1OiJlbWFpbCI7czoyMzoicGtwYWRtaW5AbWFpbGluYXRvci5jb20iO3M6NTA6ImxvZ2luX3dlYl9jMWEyNmJjMDAyNDlkYzYyMWYwM2M0MTc3OGQ1NWZlMzMxZTdlOTEyIjtOO3M6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0='),
('eHlZJ4JLNi1lFm1QFbUcTQFzykifUeDuiIUeCueb',1,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/138.0.0.0 Safari/537.36',1754113352,'YTo3OntzOjY6Il90b2tlbiI7czo0MDoic3kyRjZRanFDMHhUZ21uSDY1em05MzFjZGtQUTVLZGNWejhlSVJVQyI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo1MDoibG9naW5fd2ViX2MxYTI2YmMwMDI0OWRjNjIxZjAzYzQxNzc4ZDU1ZmUzMzFlN2U5MTIiO2k6MTtzOjY6InVzZXJJZCI7aToxO3M6ODoidXNlcm5hbWUiO3M6NToiYWRtaW4iO3M6NToiZW1haWwiO3M6MjM6InBrcGFkbWluQG1haWxpbmF0b3IuY29tIjtzOjE3OiJwYXNzd29yZF9oYXNoX3dlYiI7czo2MDoiJDJ5JDEwJEg4eWxsdy43MU1GN1FTLmFONUI2by4xMm9LMzFtbEluWldJODlFYmUyQ09HYlVnQWZwRHBxIjt9'),
('Ep9LDu556u6NGfd4RTr4nq6h34KjbvoiKCj2laV9',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/138.0.0.0 Safari/537.36',1754114136,'YTo3OntzOjY6Il90b2tlbiI7czo0MDoiV05Fd3BYR3NtRm4zbUZRcXlXbVU1NW1hTVBNYjZqb2J2S21haVZzOSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo1MDoibG9naW5fd2ViX2MxYTI2YmMwMDI0OWRjNjIxZjAzYzQxNzc4ZDU1ZmUzMzFlN2U5MTIiO2k6MztzOjY6InVzZXJJZCI7aTozO3M6ODoidXNlcm5hbWUiO3M6NzoiZGJhcm5lcyI7czo1OiJlbWFpbCI7czoyMjoiZGJhcm5lc0BtYWlsaW5hdG9yLmNvbSI7czoxNzoicGFzc3dvcmRfaGFzaF93ZWIiO3M6NjA6IiQyeSQxMCRJLlYwQWJndmtTbzJySnR3L0UxeTJ1V2hoWk42NUx1eEliY3UvM2ZycWVjWjdhL05kRVlLSyI7fQ=='),
('EyKPViom0HLkrPAPWvWhsXs9bflHp8BsW6RKW03H',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/138.0.0.0 Safari/537.36',1754114201,'YTo1OntzOjY6Il90b2tlbiI7czo0MDoicURiUWppR0xHcTdHVWVTZXF4V0ZWM0pPbW9nOGM2VmdyYkV2bEVmWSI7czo4OiJ1c2VybmFtZSI7czo3OiJwaHVkc29uIjtzOjU6ImVtYWlsIjtzOjIyOiJwaHVkc29uQG1haWxpbmF0b3IuY29tIjtzOjUwOiJsb2dpbl93ZWJfYzFhMjZiYzAwMjQ5ZGM2MjFmMDNjNDE3NzhkNTVmZTMzMWU3ZTkxMiI7TjtzOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19'),
('fb2BVMk2yKt7DzNbaLNx4GvQKwtO3sQdnVH4IloO',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/138.0.0.0 Safari/537.36',1754113993,'YTo4OntzOjY6Il90b2tlbiI7czo0MDoiM3VLRkkzbU45Q1RITENGOGs0OXRDNU4zVkt1ZnF3UE03TDNXT3Z6RyI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo1MDoibG9naW5fd2ViX2MxYTI2YmMwMDI0OWRjNjIxZjAzYzQxNzc4ZDU1ZmUzMzFlN2U5MTIiO2k6MztzOjY6InVzZXJJZCI7aTozO3M6ODoidXNlcm5hbWUiO3M6NzoiZGJhcm5lcyI7czo1OiJlbWFpbCI7czoyMjoiZGJhcm5lc0BtYWlsaW5hdG9yLmNvbSI7czoxNzoicGFzc3dvcmRfaGFzaF93ZWIiO3M6NjA6IiQyeSQxMCRWLkRQSkxMaWJobGFybHVNSTNPbVZPMnozSW1FRmpUbmVIeXFxbGdONkRYLnNBQWZKVmNoVyI7czoxMzoiY3VycmVudExvY2FsZSI7czoyOiJlbiI7fQ=='),
('Fbg7x4TeLcgxA5RPqfCWvmtYBZaaWMqTJMOC1TEP',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/138.0.0.0 Safari/537.36',1754114373,'YTo3OntzOjY6Il90b2tlbiI7czo0MDoiOGZIR1BiN0xlamlXM1dYZUNveTRnaEF1VFBBUGsyb2dLY0dNcnE3ayI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo1MDoibG9naW5fd2ViX2MxYTI2YmMwMDI0OWRjNjIxZjAzYzQxNzc4ZDU1ZmUzMzFlN2U5MTIiO2k6MztzOjY6InVzZXJJZCI7aTozO3M6ODoidXNlcm5hbWUiO3M6NzoiZGJhcm5lcyI7czo1OiJlbWFpbCI7czoyMjoiZGJhcm5lc0BtYWlsaW5hdG9yLmNvbSI7czoxNzoicGFzc3dvcmRfaGFzaF93ZWIiO3M6NjA6IiQyeSQxMCRvUURDbE50MVhqNjFmQjhwYU9pbG9PbWlnekpjZUFjWVNOVVRzM2F2TlFLeFdsZnNXVzROVyI7fQ=='),
('FktTlkU7NotSbf39Q7ljk1uNAoSRGbeVQkeBqCS7',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/138.0.0.0 Safari/537.36',1754113379,'YTo1OntzOjY6Il90b2tlbiI7czo0MDoiYll4Tkp6bjhlZ0trckdNSDd2VzBNZDJvbmM0eURucVVHSnlQamZPZyI7czo4OiJ1c2VybmFtZSI7czo1OiJhZG1pbiI7czo1OiJlbWFpbCI7czoyMzoicGtwYWRtaW5AbWFpbGluYXRvci5jb20iO3M6NTA6ImxvZ2luX3dlYl9jMWEyNmJjMDAyNDlkYzYyMWYwM2M0MTc3OGQ1NWZlMzMxZTdlOTEyIjtOO3M6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0='),
('FMf2emw7J8GJbqf4bNtGbsm9ISRAVZdpVFu14l7f',31,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/138.0.0.0 Safari/537.36',1754114390,'YTo4OntzOjY6Il90b2tlbiI7czo0MDoiNnBNZnBXckxrSjhGNGg2cnV0Zm1NN2J5dDA1czBRa0hBYVRZblFpZCI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czoxMzoiY3VycmVudExvY2FsZSI7czoyOiJlbiI7czo4OiJ1c2VybmFtZSI7czo4OiJyYmFpeWV3dSI7czo1MDoibG9naW5fd2ViX2MxYTI2YmMwMDI0OWRjNjIxZjAzYzQxNzc4ZDU1ZmUzMzFlN2U5MTIiO2k6MzE7czo2OiJ1c2VySWQiO2k6MzE7czo1OiJlbWFpbCI7czoyMzoicmJhaXlld3VAbWFpbGluYXRvci5jb20iO3M6MTc6InBhc3N3b3JkX2hhc2hfd2ViIjtzOjYwOiIkMnkkMTAkZXhKQ2R1UmZULlhncUhFaFN3VTNFLnlucXVGaTRKTFlHa3NSMmVKYWM5WVZWTHNUcVAwclMiO30='),
('FqXABxItWSdv3D2dvNGGuumCz9kg7MiN429KWe8C',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/138.0.0.0 Safari/537.36',1754114348,'YTo1OntzOjY6Il90b2tlbiI7czo0MDoicU42Z09FTEhUcXRCZ09wczJJdldVQzZHOFZJSmhSQ2xFc0k4TVhjaiI7czo4OiJ1c2VybmFtZSI7czo4OiJqamFuc3NlbiI7czo1OiJlbWFpbCI7czoyMzoiamphbnNzZW5AbWFpbGluYXRvci5jb20iO3M6NTA6ImxvZ2luX3dlYl9jMWEyNmJjMDAyNDlkYzYyMWYwM2M0MTc3OGQ1NWZlMzMxZTdlOTEyIjtOO3M6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0='),
('fSH2aTrtpXqv7LpaCZL0RaqEfvFjsNkvHUROA0mR',17,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/138.0.0.0 Safari/537.36',1754113944,'YTo4OntzOjY6Il90b2tlbiI7czo0MDoicjJsZHJZcHg0Y1hZVzQ0RHdCc1RYR0ZqRHpLUFZkdFRRY2FkMGlwbyI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo1MDoibG9naW5fd2ViX2MxYTI2YmMwMDI0OWRjNjIxZjAzYzQxNzc4ZDU1ZmUzMzFlN2U5MTIiO2k6MTc7czo2OiJ1c2VySWQiO2k6MTc7czo4OiJ1c2VybmFtZSI7czoxMDoiYW13YW5kZW5nYSI7czo1OiJlbWFpbCI7czoyNToiYW13YW5kZW5nYUBtYWlsaW5hdG9yLmNvbSI7czoxNzoicGFzc3dvcmRfaGFzaF93ZWIiO3M6NjA6IiQyeSQxMCRnM05kNzBSOTIwZ2FQSTAzY0xrVXYuMnp5RE55aUJ2ejlQNXBCTmE3Q1NQemI1aVNrYVBPbSI7czoxMzoiY3VycmVudExvY2FsZSI7czoyOiJlbiI7fQ=='),
('FwWBFfs5iz1x3qryFPlbb0uZZQI21OaeCd485qCb',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/138.0.0.0 Safari/537.36',1754114490,'YTo4OntzOjY6Il90b2tlbiI7czo0MDoieGRlYXdkbTB0eUw3U0hpZ2lxYlhVaVo4R3pFWTFPN3FKS1ZlaUdrTyI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo1MDoibG9naW5fd2ViX2MxYTI2YmMwMDI0OWRjNjIxZjAzYzQxNzc4ZDU1ZmUzMzFlN2U5MTIiO2k6MztzOjY6InVzZXJJZCI7aTozO3M6ODoidXNlcm5hbWUiO3M6NzoiZGJhcm5lcyI7czo1OiJlbWFpbCI7czoyMjoiZGJhcm5lc0BtYWlsaW5hdG9yLmNvbSI7czoxNzoicGFzc3dvcmRfaGFzaF93ZWIiO3M6NjA6IiQyeSQxMCQ1YVozR0g3Y3ZmZVk2WmFNWnhoanhlSFE4YkRLZ0F4MFB5UVZwdklDTmFxOVB0Q3N4a0dlbSI7czoxMzoiY3VycmVudExvY2FsZSI7czoyOiJlbiI7fQ=='),
('g8NomyhAmiCV49Z5iMydvh9nuB2I67uUR2ll1S2q',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/138.0.0.0 Safari/537.36',1754113722,'YTozOntzOjY6Il90b2tlbiI7czo0MDoic2JBNlRRa3VVNDl1R2N3bXg3T3A5N0h0amJHVGE2QWJmMVNHOFl6ViI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czoxMzoiY3VycmVudExvY2FsZSI7czoyOiJlbiI7fQ=='),
('GFMG8DTSq8VhVTBr4n7dMEMyxeCzNA28ymBUwhYr',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/138.0.0.0 Safari/537.36',1754113533,'YTo1OntzOjY6Il90b2tlbiI7czo0MDoidXp6NTJFWnd2ZGhoTmJzYWY2d1lrczVUR1V0U05PNDBxTEpsV284RCI7czo4OiJ1c2VybmFtZSI7czo1OiJhZG1pbiI7czo1OiJlbWFpbCI7czoyMzoicGtwYWRtaW5AbWFpbGluYXRvci5jb20iO3M6NTA6ImxvZ2luX3dlYl9jMWEyNmJjMDAyNDlkYzYyMWYwM2M0MTc3OGQ1NWZlMzMxZTdlOTEyIjtOO3M6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0='),
('gJcd2xzAxQ2uyCc1z1f0MNMKZJFpgrdX3TKlmuSJ',26,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/138.0.0.0 Safari/537.36',1754114258,'YTo4OntzOjY6Il90b2tlbiI7czo0MDoiUGNsbDVUbU41Y1lqdzFNaXZNTlhnekQyRHlkTHQyZ0tFMkd4Z2JNUiI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czoxMzoiY3VycmVudExvY2FsZSI7czoyOiJlbiI7czo4OiJ1c2VybmFtZSI7czo2OiJqbm92YWsiO3M6NTA6ImxvZ2luX3dlYl9jMWEyNmJjMDAyNDlkYzYyMWYwM2M0MTc3OGQ1NWZlMzMxZTdlOTEyIjtpOjI2O3M6NjoidXNlcklkIjtpOjI2O3M6NToiZW1haWwiO3M6MjE6Impub3Zha0BtYWlsaW5hdG9yLmNvbSI7czoxNzoicGFzc3dvcmRfaGFzaF93ZWIiO3M6NjA6IiQyeSQxMCRoLkFRc3p2Nm1wQ245ZUxvWnUwQ3d1SE5zdWVsa0xYcnFjeEJYY2drVHoud014cFlnakRGQyI7fQ=='),
('GYLxIK31V4h7hOox9jbGgk1X89SHrj6tLzbFNAXP',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/138.0.0.0 Safari/537.36',1754114532,'YTo4OntzOjY6Il90b2tlbiI7czo0MDoiSDI2YnVlNFdTOVM2cXZIM2ZJY3kwd1hKR2huaTNCdlpiOVN2Tnc3cCI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo1MDoibG9naW5fd2ViX2MxYTI2YmMwMDI0OWRjNjIxZjAzYzQxNzc4ZDU1ZmUzMzFlN2U5MTIiO2k6MztzOjY6InVzZXJJZCI7aTozO3M6ODoidXNlcm5hbWUiO3M6NzoiZGJhcm5lcyI7czo1OiJlbWFpbCI7czoyMjoiZGJhcm5lc0BtYWlsaW5hdG9yLmNvbSI7czoxNzoicGFzc3dvcmRfaGFzaF93ZWIiO3M6NjA6IiQyeSQxMCQwSEhZQlY3YjE0MS9IdEhVTi5xaWIuUC55d2FOdVg1RWthajFDNnphYWFlaUhBNkdnSWZBcSI7czoxMzoiY3VycmVudExvY2FsZSI7czoyOiJlbiI7fQ=='),
('gyN8H4O0WIynJgjG2FUxhPUEztUZv0oGdCtJ6IAF',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/138.0.0.0 Safari/537.36',1754114354,'YTo1OntzOjY6Il90b2tlbiI7czo0MDoiYmY4elVIREN1b3JSWmJpbG1BMEF4SE85Q3ppQkR5TTFCUmxTNXZNcyI7czo4OiJ1c2VybmFtZSI7czo3OiJhbWNjcmFlIjtzOjU6ImVtYWlsIjtzOjIyOiJhbWNjcmFlQG1haWxpbmF0b3IuY29tIjtzOjUwOiJsb2dpbl93ZWJfYzFhMjZiYzAwMjQ5ZGM2MjFmMDNjNDE3NzhkNTVmZTMzMWU3ZTkxMiI7TjtzOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19'),
('hi487735InNh4L0I6GlqCAPXs5PqgcB4nm5Atjin',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/138.0.0.0 Safari/537.36',1754114743,'YTo3OntzOjY6Il90b2tlbiI7czo0MDoiQmwzNGNTSzFVWldVSklITm9rMTEzM2tINHp4a3ZacmN6b2U4dXFFUCI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo1MDoibG9naW5fd2ViX2MxYTI2YmMwMDI0OWRjNjIxZjAzYzQxNzc4ZDU1ZmUzMzFlN2U5MTIiO2k6MztzOjY6InVzZXJJZCI7aTozO3M6ODoidXNlcm5hbWUiO3M6NzoiZGJhcm5lcyI7czo1OiJlbWFpbCI7czoyMjoiZGJhcm5lc0BtYWlsaW5hdG9yLmNvbSI7czoxNzoicGFzc3dvcmRfaGFzaF93ZWIiO3M6NjA6IiQyeSQxMCRNT2N2d1BHRTJ0NW4yd2NyanF2NFgublZUTGlyc2JMbmcveWpyL1FrcG5VVnRnZm8vdTFrVyI7fQ=='),
('htU7njDEWZxC4gL5mCfedHUPLvajqUZmmXnHDDG3',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/138.0.0.0 Safari/537.36',1754114702,'YTo1OntzOjY6Il90b2tlbiI7czo0MDoiRTByaHd4UG1zaWEzcjFqcDAwQXFaY25pSW55TWQ1bW1GVk80UWhUbiI7czo4OiJ1c2VybmFtZSI7czo3OiJkYmFybmVzIjtzOjU6ImVtYWlsIjtzOjIyOiJkYmFybmVzQG1haWxpbmF0b3IuY29tIjtzOjUwOiJsb2dpbl93ZWJfYzFhMjZiYzAwMjQ5ZGM2MjFmMDNjNDE3NzhkNTVmZTMzMWU3ZTkxMiI7TjtzOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19'),
('HvLJhr2oFGUhIeLq8PbjgLxehe3iF0nD6H4Q2vGu',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/138.0.0.0 Safari/537.36',1754113965,'YTo4OntzOjY6Il90b2tlbiI7czo0MDoiN0R0UTU5ZUZXVVF3VFFsRlh2UnJqMUw0Y0R6cnp6dzA2c09vaktHUiI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo1MDoibG9naW5fd2ViX2MxYTI2YmMwMDI0OWRjNjIxZjAzYzQxNzc4ZDU1ZmUzMzFlN2U5MTIiO2k6MztzOjY6InVzZXJJZCI7aTozO3M6ODoidXNlcm5hbWUiO3M6NzoiZGJhcm5lcyI7czo1OiJlbWFpbCI7czoyMjoiZGJhcm5lc0BtYWlsaW5hdG9yLmNvbSI7czoxNzoicGFzc3dvcmRfaGFzaF93ZWIiO3M6NjA6IiQyeSQxMCRkTFp2cnZJZ2sxY05ocVJmT3BnSlV1S2QxRHhINFR6L2kwZXdWRlh5L2tQLmczaGxCeUhTLiI7czoxMzoiY3VycmVudExvY2FsZSI7czoyOiJlbiI7fQ=='),
('IFAf4acXG4oaEWGLQHZCn18FOiXbqajY30KfNdTW',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/138.0.0.0 Safari/537.36',1754113951,'YTo1OntzOjY6Il90b2tlbiI7czo0MDoicUhMVFhGVFFNVUFDSHh2NDlPbEVJNFM3TEUxTTNFalhKSUlrQVBwdiI7czo4OiJ1c2VybmFtZSI7czo3OiJkYmFybmVzIjtzOjU6ImVtYWlsIjtzOjIyOiJkYmFybmVzQG1haWxpbmF0b3IuY29tIjtzOjUwOiJsb2dpbl93ZWJfYzFhMjZiYzAwMjQ5ZGM2MjFmMDNjNDE3NzhkNTVmZTMzMWU3ZTkxMiI7TjtzOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19'),
('IyrzWKnkNtcAxcv4U5JUjE7jgTTPqpNJiD6KAnEH',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/138.0.0.0 Safari/537.36',1754113448,'YTo1OntzOjY6Il90b2tlbiI7czo0MDoiNjNMc2pYTFptS3hFcDQ1c1dsRHI2THptV2pPaHBhaFBjUTRTc1huWSI7czo4OiJ1c2VybmFtZSI7czo1OiJhZG1pbiI7czo1OiJlbWFpbCI7czoyMzoicGtwYWRtaW5AbWFpbGluYXRvci5jb20iO3M6NTA6ImxvZ2luX3dlYl9jMWEyNmJjMDAyNDlkYzYyMWYwM2M0MTc3OGQ1NWZlMzMxZTdlOTEyIjtOO3M6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0='),
('jaVaFoirFc6Cg6F1ijVP4AFCHn8ozunCLs83IxHm',30,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/138.0.0.0 Safari/537.36',1754114381,'YTo4OntzOjY6Il90b2tlbiI7czo0MDoiRWJ1ekN4ZUxmWlhYM2Uwb2FQc3JZQjFSOFZ2eEN0czBkblU1eXRIYiI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czoxMzoiY3VycmVudExvY2FsZSI7czoyOiJlbiI7czo4OiJ1c2VybmFtZSI7czo3OiJwZGFuaWVsIjtzOjUwOiJsb2dpbl93ZWJfYzFhMjZiYzAwMjQ5ZGM2MjFmMDNjNDE3NzhkNTVmZTMzMWU3ZTkxMiI7aTozMDtzOjY6InVzZXJJZCI7aTozMDtzOjU6ImVtYWlsIjtzOjIyOiJwZGFuaWVsQG1haWxpbmF0b3IuY29tIjtzOjE3OiJwYXNzd29yZF9oYXNoX3dlYiI7czo2MDoiJDJ5JDEwJHRpRFBOUHZPOXlYTHNXM3M4dXQ2cHVEblF4VUZiaVJUckZWNFNFMllxUE56cXdSd3E0Tm4uIjt9'),
('Jbw2LXl2ha0G6exjj3jvfWCObFnr8JHYlqI6K86Q',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/138.0.0.0 Safari/537.36',1754113672,'YTo1OntzOjY6Il90b2tlbiI7czo0MDoiZDJyenlOYXV2RHo5Rlg4RHhhNmxOUW9WdzBUa2F1N3FmRkFxaEtGZCI7czo4OiJ1c2VybmFtZSI7czo1OiJhZG1pbiI7czo1OiJlbWFpbCI7czoyMzoicGtwYWRtaW5AbWFpbGluYXRvci5jb20iO3M6NTA6ImxvZ2luX3dlYl9jMWEyNmJjMDAyNDlkYzYyMWYwM2M0MTc3OGQ1NWZlMzMxZTdlOTEyIjtOO3M6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0='),
('JvXmGhyL9xvOT9j37cV2Auj8npiOhq9UMmiKZqe3',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/138.0.0.0 Safari/537.36',1754113476,'YTozOntzOjY6Il90b2tlbiI7czo0MDoieFFuS09nYklVQ0djWUtXeEdTT2JVRWpZSlNnckpUbzF3QUd0WlFtYSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czoxMzoiY3VycmVudExvY2FsZSI7czoyOiJlbiI7fQ=='),
('K5yiVsOmHqSt85w2GjPbPNbDVtEyELnSB9GNdzAR',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/138.0.0.0 Safari/537.36',1754113705,'YTo1OntzOjY6Il90b2tlbiI7czo0MDoiOU1telJsZllMbTltMWlKdjdUSEZUTlY2ZEJlbjU5cVZ1bWFCdnRpMiI7czo4OiJ1c2VybmFtZSI7czo1OiJhZG1pbiI7czo1OiJlbWFpbCI7czoyMzoicGtwYWRtaW5AbWFpbGluYXRvci5jb20iO3M6NTA6ImxvZ2luX3dlYl9jMWEyNmJjMDAyNDlkYzYyMWYwM2M0MTc3OGQ1NWZlMzMxZTdlOTEyIjtOO3M6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0='),
('kENGt4zofOz7KrDfyBv3CGLhAbGYSKdq2tbXDFAp',1,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/138.0.0.0 Safari/537.36',1754113753,'YTo3OntzOjY6Il90b2tlbiI7czo0MDoiSFJqNWoyeFdkenhPcnlYYlJFSVJsRGZ4MzNzcnd2MGxsSm9TcjJFOCI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo1MDoibG9naW5fd2ViX2MxYTI2YmMwMDI0OWRjNjIxZjAzYzQxNzc4ZDU1ZmUzMzFlN2U5MTIiO2k6MTtzOjY6InVzZXJJZCI7aToxO3M6ODoidXNlcm5hbWUiO3M6NToiYWRtaW4iO3M6NToiZW1haWwiO3M6MjM6InBrcGFkbWluQG1haWxpbmF0b3IuY29tIjtzOjE3OiJwYXNzd29yZF9oYXNoX3dlYiI7czo2MDoiJDJ5JDEwJFFXRllNajFXRjdxbEZ4RUpXeUY1TXU5VzhJbXF5RUU4dzczcjFZb014Y3RsTkY4S1pXYVVDIjt9'),
('kqMgcUW94nxRwDgMLb80igXxJyPpd6pbTDcxBrma',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/138.0.0.0 Safari/537.36',1754113583,'YTo1OntzOjY6Il90b2tlbiI7czo0MDoiUnp5aTh6QVRjcFh5aEl6Nll1WE9STHNVSlRxUERzeVNoU3c5a3F3MCI7czo4OiJ1c2VybmFtZSI7czo1OiJhZG1pbiI7czo1OiJlbWFpbCI7czoyMzoicGtwYWRtaW5AbWFpbGluYXRvci5jb20iO3M6NTA6ImxvZ2luX3dlYl9jMWEyNmJjMDAyNDlkYzYyMWYwM2M0MTc3OGQ1NWZlMzMxZTdlOTEyIjtOO3M6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0='),
('LCdf82QX6UTAH0s6dO7G2S5uYINnCiPCH6Pk5yOo',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/138.0.0.0 Safari/537.36',1754113455,'YTozOntzOjY6Il90b2tlbiI7czo0MDoiR3hQZEVGeFBXT1lveUI1MmRxNFpPS3BVSTZ5TndydFJmeTdSRk8yQiI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czoxMzoiY3VycmVudExvY2FsZSI7czoyOiJlbiI7fQ=='),
('lKMbFgnQkWZ67lhYS4W1P1Bwz41kS0jTXvc3VvnN',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/138.0.0.0 Safari/537.36',1754114510,'YTo4OntzOjY6Il90b2tlbiI7czo0MDoiUTNBalBra2xqeWZMV0tWVEN3eU5wQms2ODljYjNoN2tMMDJPRTg1NiI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo1MDoibG9naW5fd2ViX2MxYTI2YmMwMDI0OWRjNjIxZjAzYzQxNzc4ZDU1ZmUzMzFlN2U5MTIiO2k6MztzOjY6InVzZXJJZCI7aTozO3M6ODoidXNlcm5hbWUiO3M6NzoiZGJhcm5lcyI7czo1OiJlbWFpbCI7czoyMjoiZGJhcm5lc0BtYWlsaW5hdG9yLmNvbSI7czoxNzoicGFzc3dvcmRfaGFzaF93ZWIiO3M6NjA6IiQyeSQxMCRYenVuS2ZSS0dudFZUbDlHUUZya3JlQXRKaUozeVo2T0I3cnBMMGhUSlcucWtMcFJQRGVvSyI7czoxMzoiY3VycmVudExvY2FsZSI7czoyOiJlbiI7fQ=='),
('lwASkKTz3OVwqFtQWu9U9VXxn8c6reYd2t4MreR5',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/138.0.0.0 Safari/537.36',1754114497,'YTo4OntzOjY6Il90b2tlbiI7czo0MDoiRGhPYldsRHBxSHFQY1hCM040N3VNeDg2VTZ1ZXZ4cjFZaGEzU3g5eSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo1MDoibG9naW5fd2ViX2MxYTI2YmMwMDI0OWRjNjIxZjAzYzQxNzc4ZDU1ZmUzMzFlN2U5MTIiO2k6MztzOjY6InVzZXJJZCI7aTozO3M6ODoidXNlcm5hbWUiO3M6NzoiZGJhcm5lcyI7czo1OiJlbWFpbCI7czoyMjoiZGJhcm5lc0BtYWlsaW5hdG9yLmNvbSI7czoxNzoicGFzc3dvcmRfaGFzaF93ZWIiO3M6NjA6IiQyeSQxMCREc1NhZmhFdEpiOU5pemJzc3NiTEouaDVnT08vUTRFWTM5aVp2Lzd2MldieldibDViMG4yRyI7czoxMzoiY3VycmVudExvY2FsZSI7czoyOiJlbiI7fQ=='),
('lXMu04nH1HrtSd5bODwsHUeN1HC2uyjyvUt2Iwrq',19,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/138.0.0.0 Safari/537.36',1754114071,'YTo4OntzOjY6Il90b2tlbiI7czo0MDoiWDBDUTRNdG50dlZ4MDlWQlREbFVoaHdOc0kxV1ZUVkh0Mk5yNndlQiI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czoxMzoiY3VycmVudExvY2FsZSI7czoyOiJlbiI7czo4OiJ1c2VybmFtZSI7czo4OiJja3dhbnRlcyI7czo1MDoibG9naW5fd2ViX2MxYTI2YmMwMDI0OWRjNjIxZjAzYzQxNzc4ZDU1ZmUzMzFlN2U5MTIiO2k6MTk7czo2OiJ1c2VySWQiO2k6MTk7czo1OiJlbWFpbCI7czoyMzoiY2t3YW50ZXNAbWFpbGluYXRvci5jb20iO3M6MTc6InBhc3N3b3JkX2hhc2hfd2ViIjtzOjYwOiIkMnkkMTAkNXYuU2FHUWUwc1o5RTJsOXBBZ3ExTzIxQ0cwY3RRdHVqd3NMdlhZVlZiMVpEM1gxVGY0SnEiO30='),
('Mu8mPIZgyOGAxZIv2FvZN14fSagh67GlOyhzPjdk',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/138.0.0.0 Safari/537.36',1754114831,'YTo3OntzOjY6Il90b2tlbiI7czo0MDoiQ205M3pSaXZzOG1hd0hRYVVrTDJIMkVBaVdiVERYN29PUjhtQzFjOSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo1MDoibG9naW5fd2ViX2MxYTI2YmMwMDI0OWRjNjIxZjAzYzQxNzc4ZDU1ZmUzMzFlN2U5MTIiO2k6MztzOjY6InVzZXJJZCI7aTozO3M6ODoidXNlcm5hbWUiO3M6NzoiZGJhcm5lcyI7czo1OiJlbWFpbCI7czoyMjoiZGJhcm5lc0BtYWlsaW5hdG9yLmNvbSI7czoxNzoicGFzc3dvcmRfaGFzaF93ZWIiO3M6NjA6IiQyeSQxMCRaNE04dTNNQmxydUFaRUlwcHAxcWxPMUt4ZWhxbnNuRVV2dGhwTWMyaS9DNThYOGVDN1VseSI7fQ=='),
('mydS1l8Vi4sRfqW2cTQWCzXTyrrIvNQFZDnEnUrE',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/138.0.0.0 Safari/537.36',1754113418,'YTozOntzOjY6Il90b2tlbiI7czo0MDoiN1hMVDBPaVFvYkRXa1BoS3NHcHV6UmtId3pROHNHeGxISFpMY1Z4cCI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czoxMzoiY3VycmVudExvY2FsZSI7czoyOiJlbiI7fQ=='),
('N6uHkgigfEQSI882GW80CiZFsx8dd9Mk2BQ1Zh8H',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/138.0.0.0 Safari/537.36',1754113401,'YTozOntzOjY6Il90b2tlbiI7czo0MDoiM2trMjZTemtWbDk2NGhsUnhVNndNVVh6TkZTWlNUb2c0YXFUY1hOUSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czoxMzoiY3VycmVudExvY2FsZSI7czoyOiJlbiI7fQ=='),
('o563qUdYhGamK8DsQanDlwcv2iFuLrtsOiftJrgH',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/138.0.0.0 Safari/537.36',1754113721,'YTozOntzOjY6Il90b2tlbiI7czo0MDoid1lsdTZYTVhPT2VzSmtZSjBzc29PVDNNRVlqclNWYVhST1o5UVdNbCI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czoxMzoiY3VycmVudExvY2FsZSI7czoyOiJlbiI7fQ=='),
('odfR2NfyxTZPELzkapMAcRnKd91280Doi6FSgY6l',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/138.0.0.0 Safari/537.36',1754114361,'YTo1OntzOjY6Il90b2tlbiI7czo0MDoiQTlhZHVOUzlEYlI1VlJTWnBjTDdUTlBTRVBuR1pLUm9ialY2clZTVCI7czo4OiJ1c2VybmFtZSI7czo4OiJhZ2FsbGVnbyI7czo1OiJlbWFpbCI7czoyMzoiYWdhbGxlZ29AbWFpbGluYXRvci5jb20iO3M6NTA6ImxvZ2luX3dlYl9jMWEyNmJjMDAyNDlkYzYyMWYwM2M0MTc3OGQ1NWZlMzMxZTdlOTEyIjtOO3M6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0='),
('OjbZu7oToE8VCHvjajrQmO479agRzlwNDKMO3BdM',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/138.0.0.0 Safari/537.36',1754113320,'YToyOntzOjY6Il90b2tlbiI7czo0MDoibm4yNm5nc0szTmd2MVlOUmtaN1JmMkFRZUpoTnBFYUg2TFhsSUdrYiI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ=='),
('P4Pk7gr7EPL5TcNCSFxY0GDYq1v5ksHc7b438mEa',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/138.0.0.0 Safari/537.36',1754114089,'YTo3OntzOjY6Il90b2tlbiI7czo0MDoia3pRbjRUeXM3NlNXeGJjaDNTV3dGOHl1bFp6NmhXaGh3bDA3YXlUTCI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo1MDoibG9naW5fd2ViX2MxYTI2YmMwMDI0OWRjNjIxZjAzYzQxNzc4ZDU1ZmUzMzFlN2U5MTIiO2k6MztzOjY6InVzZXJJZCI7aTozO3M6ODoidXNlcm5hbWUiO3M6NzoiZGJhcm5lcyI7czo1OiJlbWFpbCI7czoyMjoiZGJhcm5lc0BtYWlsaW5hdG9yLmNvbSI7czoxNzoicGFzc3dvcmRfaGFzaF93ZWIiO3M6NjA6IiQyeSQxMCRlRUkyano2Snh6YXQ5cGouWkYxSHkuUC8vLjkuc05wMjdjVjJ2b1o2Z2pXR2hsZlZqMWR1RyI7fQ=='),
('pIzGd7VooOXikLvH3pmeT2LbkyM8iqFkSMuBoWPt',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/138.0.0.0 Safari/537.36',1754114250,'YTo3OntzOjY6Il90b2tlbiI7czo0MDoiVUllVXQ4cVFmWW9nRUM2TDM5YnJrSk50aEgyZFJtSno3RmNtMzJsQiI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo1MDoibG9naW5fd2ViX2MxYTI2YmMwMDI0OWRjNjIxZjAzYzQxNzc4ZDU1ZmUzMzFlN2U5MTIiO2k6MztzOjY6InVzZXJJZCI7aTozO3M6ODoidXNlcm5hbWUiO3M6NzoiZGJhcm5lcyI7czo1OiJlbWFpbCI7czoyMjoiZGJhcm5lc0BtYWlsaW5hdG9yLmNvbSI7czoxNzoicGFzc3dvcmRfaGFzaF93ZWIiO3M6NjA6IiQyeSQxMCRoVkM4VmhvRW81REVnanJ3TmZQTWguMjdxWVhOVzJyUFlrUk5LZkZCWERnL0N6UHZsOVJOcSI7fQ=='),
('pKb84swQQVpwqRyZCA0ILMISJeUWfB91BK0GACj7',28,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/138.0.0.0 Safari/537.36',1754114302,'YTo4OntzOjY6Il90b2tlbiI7czo0MDoiRmNjdFd0Q1haeVhBaGVIWUtkN2pjSHB4eUJaMDdyYUxSaWdxdTVWZSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czoxMzoiY3VycmVudExvY2FsZSI7czoyOiJlbiI7czo4OiJ1c2VybmFtZSI7czoxMjoibGNocmlzdG9waGVyIjtzOjUwOiJsb2dpbl93ZWJfYzFhMjZiYzAwMjQ5ZGM2MjFmMDNjNDE3NzhkNTVmZTMzMWU3ZTkxMiI7aToyODtzOjY6InVzZXJJZCI7aToyODtzOjU6ImVtYWlsIjtzOjI3OiJsY2hyaXN0b3BoZXJAbWFpbGluYXRvci5jb20iO3M6MTc6InBhc3N3b3JkX2hhc2hfd2ViIjtzOjYwOiIkMnkkMTAkQmVoVUlBTnlFSE1wcndydUNsMWNzZTFQU2hIQzNVcmZaOFNiblBBOG02d1UvOC91dm12cWkiO30='),
('pNbIK4n6I7m6ltZGVxXHfyaOXmUUtBA0PoGL9VSQ',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/138.0.0.0 Safari/537.36',1754113569,'YTozOntzOjY6Il90b2tlbiI7czo0MDoiRmMwSzZtY1JlQ0JYNXFpVklwOU9RSk9FOUswN2s2WkJWRVpQWlV3cyI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czoxMzoiY3VycmVudExvY2FsZSI7czoyOiJlbiI7fQ=='),
('pRwnQNPdXucrIClnMXk44XkOPonLQGiCUkHgjsPn',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/138.0.0.0 Safari/537.36',1754114272,'YTo1OntzOjY6Il90b2tlbiI7czo0MDoiU2JjMk9HUFlnY3B6U3l1TjZXY1BFOEU3blpsaDA3VVlQZkxSOHllWCI7czo4OiJ1c2VybmFtZSI7czo3OiJkYmFybmVzIjtzOjU6ImVtYWlsIjtzOjIyOiJkYmFybmVzQG1haWxpbmF0b3IuY29tIjtzOjUwOiJsb2dpbl93ZWJfYzFhMjZiYzAwMjQ5ZGM2MjFmMDNjNDE3NzhkNTVmZTMzMWU3ZTkxMiI7TjtzOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19'),
('pymqDY7FkAgc8X99x3M4w3WQeznSZzdILxRGYnst',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/138.0.0.0 Safari/537.36',1754114003,'YTo4OntzOjY6Il90b2tlbiI7czo0MDoiZWtkMXFqOG9iM0p2RERHOEtIWVhPcUlwMFJESkxNekZobkExd0FuOCI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo1MDoibG9naW5fd2ViX2MxYTI2YmMwMDI0OWRjNjIxZjAzYzQxNzc4ZDU1ZmUzMzFlN2U5MTIiO2k6MztzOjY6InVzZXJJZCI7aTozO3M6ODoidXNlcm5hbWUiO3M6NzoiZGJhcm5lcyI7czo1OiJlbWFpbCI7czoyMjoiZGJhcm5lc0BtYWlsaW5hdG9yLmNvbSI7czoxNzoicGFzc3dvcmRfaGFzaF93ZWIiO3M6NjA6IiQyeSQxMCRWb09BODVrYjZYV09ndEU5ZENySUlPUzUxZlhPd0tHM0V2MVZzSkZJZ2g5UkRqcVBxV2o1dSI7czoxMzoiY3VycmVudExvY2FsZSI7czoyOiJlbiI7fQ=='),
('Q5LPLO4c7bMaAbQM94uyPLB6QPTS55JO8cQdq6WF',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/138.0.0.0 Safari/537.36',1754114060,'YTo1OntzOjY6Il90b2tlbiI7czo0MDoiSE5NMzdneTVPYlVZMWRvTDN6bEJlNE1tcHZtVWRVUnBjbkFtMmVLRCI7czo4OiJ1c2VybmFtZSI7czo2OiJtaW5vdWUiO3M6NToiZW1haWwiO3M6MjE6Im1pbm91ZUBtYWlsaW5hdG9yLmNvbSI7czo1MDoibG9naW5fd2ViX2MxYTI2YmMwMDI0OWRjNjIxZjAzYzQxNzc4ZDU1ZmUzMzFlN2U5MTIiO047czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ=='),
('Q5PKVjoBr2jRl7XaBHu2ZKOORb8YnCc7ALaRvF6t',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/138.0.0.0 Safari/537.36',1754114033,'YTo4OntzOjY6Il90b2tlbiI7czo0MDoiZzA2SDNIb0E0ZHdrUUUyQUlXckI1OWpUV3NPVGE5aHNQSEpja3lBMyI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo1MDoibG9naW5fd2ViX2MxYTI2YmMwMDI0OWRjNjIxZjAzYzQxNzc4ZDU1ZmUzMzFlN2U5MTIiO2k6MztzOjY6InVzZXJJZCI7aTozO3M6ODoidXNlcm5hbWUiO3M6NzoiZGJhcm5lcyI7czo1OiJlbWFpbCI7czoyMjoiZGJhcm5lc0BtYWlsaW5hdG9yLmNvbSI7czoxNzoicGFzc3dvcmRfaGFzaF93ZWIiO3M6NjA6IiQyeSQxMCQ5bE95VVQ5dC9DTUwxMTRNdkx4eU5PTXNRTUc3UEdJa0pzaU1MdXVKT0UxdlFHL3JiU0g4YSI7czoxMzoiY3VycmVudExvY2FsZSI7czoyOiJlbiI7fQ=='),
('QBJrHBOagAVqlYGkImPXWWMcDEFJSuhpUSs0gj6l',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/138.0.0.0 Safari/537.36',1754114063,'YTo3OntzOjY6Il90b2tlbiI7czo0MDoiZjZjOGJBdkpYckZZaDlLa3dpZ05EdWJ1c0xpQ0lESVdDMkdJUnMxTSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo1MDoibG9naW5fd2ViX2MxYTI2YmMwMDI0OWRjNjIxZjAzYzQxNzc4ZDU1ZmUzMzFlN2U5MTIiO2k6MztzOjY6InVzZXJJZCI7aTozO3M6ODoidXNlcm5hbWUiO3M6NzoiZGJhcm5lcyI7czo1OiJlbWFpbCI7czoyMjoiZGJhcm5lc0BtYWlsaW5hdG9yLmNvbSI7czoxNzoicGFzc3dvcmRfaGFzaF93ZWIiO3M6NjA6IiQyeSQxMCRRYmJLNktMd3JRREtDRk9ZUjZCLm1lQWIuRm8zVXVmbVgxVVF3Yk41V1BzcUswWThSa1gxSyI7fQ=='),
('QJjhKHhDNIYaws1qm1kCVzk7sYlIWTytEa3v0Jmb',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/138.0.0.0 Safari/537.36',1754113395,'YTo1OntzOjY6Il90b2tlbiI7czo0MDoibUtkRnk1ck9QMzltOGRkVTVDTlVlM3VrSGFQMzlBVVpoRnRpRER0MiI7czo4OiJ1c2VybmFtZSI7czo1OiJhZG1pbiI7czo1OiJlbWFpbCI7czoyMzoicGtwYWRtaW5AbWFpbGluYXRvci5jb20iO3M6NTA6ImxvZ2luX3dlYl9jMWEyNmJjMDAyNDlkYzYyMWYwM2M0MTc3OGQ1NWZlMzMxZTdlOTEyIjtOO3M6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0='),
('qP6s8OpZFwr2BiBu5ms5YGdb0VBZ9JmuuSL9J2Kv',35,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/138.0.0.0 Safari/537.36',1754114561,'YTo4OntzOjY6Il90b2tlbiI7czo0MDoiNUlmNTdUR0w4dzRUVklYWXFQWVpUTDM1R2F1M0FpaTM4OTVmOUdKMCI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czoxMzoiY3VycmVudExvY2FsZSI7czoyOiJlbiI7czo4OiJ1c2VybmFtZSI7czo2OiJ6d29vZHMiO3M6NTA6ImxvZ2luX3dlYl9jMWEyNmJjMDAyNDlkYzYyMWYwM2M0MTc3OGQ1NWZlMzMxZTdlOTEyIjtpOjM1O3M6NjoidXNlcklkIjtpOjM1O3M6NToiZW1haWwiO3M6MjE6Inp3b29kc0BtYWlsaW5hdG9yLmNvbSI7czoxNzoicGFzc3dvcmRfaGFzaF93ZWIiO3M6NjA6IiQyeSQxMCQyQ1A2SFVKWXlFMkhZOVpVMUdPQmsuZjVVY3EuWHhjRlAuMGFxV09nOE1YYjNJcVNpbWtMLiI7fQ=='),
('R6wYU7AlnqALxmoAxDd6EfMR6LoWphBRBLbX9KEw',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/138.0.0.0 Safari/537.36',1754114585,'YTo3OntzOjY6Il90b2tlbiI7czo0MDoiRWl5OEtmaFFRY0JaRUlvQks3STlmWko4cTlpQlAweWtqTkE1ZjVrUiI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo1MDoibG9naW5fd2ViX2MxYTI2YmMwMDI0OWRjNjIxZjAzYzQxNzc4ZDU1ZmUzMzFlN2U5MTIiO2k6MztzOjY6InVzZXJJZCI7aTozO3M6ODoidXNlcm5hbWUiO3M6NzoiZGJhcm5lcyI7czo1OiJlbWFpbCI7czoyMjoiZGJhcm5lc0BtYWlsaW5hdG9yLmNvbSI7czoxNzoicGFzc3dvcmRfaGFzaF93ZWIiO3M6NjA6IiQyeSQxMCQvNlpIOVh6ZVJkcVM3ZmU3bzllenEuR1pKdVM1cGZLa1VxTFQ5RDZYZWZOTEhDd3J2RWlYeSI7fQ=='),
('rdlbHWWI2a0xoY9KTgds32RAhMJ0HxW9C1Ho2xha',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/138.0.0.0 Safari/537.36',1754114714,'YToyOntzOjY6Il90b2tlbiI7czo0MDoiQjJ3Q3RuMlJRZHZraFVEOEhQZThacUZGTmxLNTRweHhrSWxqaWhaeSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ=='),
('RDXA0oKVymFpJ3aC6t3hIEpq1WAGd4RgbKqwaXxx',24,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/138.0.0.0 Safari/537.36',1754114210,'YTo4OntzOjY6Il90b2tlbiI7czo0MDoibGVZOFQ2SG5ZQUxURFRHY21pTFVBMVJwcnlIQnJjWmpwdFVzNUl2SiI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czoxMzoiY3VycmVudExvY2FsZSI7czoyOiJlbiI7czo4OiJ1c2VybmFtZSI7czo3OiJlb3N0cm9tIjtzOjUwOiJsb2dpbl93ZWJfYzFhMjZiYzAwMjQ5ZGM2MjFmMDNjNDE3NzhkNTVmZTMzMWU3ZTkxMiI7aToyNDtzOjY6InVzZXJJZCI7aToyNDtzOjU6ImVtYWlsIjtzOjIyOiJlb3N0cm9tQG1haWxpbmF0b3IuY29tIjtzOjE3OiJwYXNzd29yZF9oYXNoX3dlYiI7czo2MDoiJDJ5JDEwJFo4aC5jNWFMTksxRkVPYzhwZUhWdk8wQk9zbC5vLmRaeTdnMTExLnFpbWYxdDFjcU93YXh5Ijt9'),
('RX5YPp7s6CJQFY5hKceAmMPGgoMYZzr13K8sI3Up',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/138.0.0.0 Safari/537.36',1754113611,'YTo1OntzOjY6Il90b2tlbiI7czo0MDoieDYyeENDV2ZxQzNSaGdDUkRhWXdUbERKQ29yem1OdkRjempVR2ZSMiI7czo4OiJ1c2VybmFtZSI7czo1OiJhZG1pbiI7czo1OiJlbWFpbCI7czoyMzoicGtwYWRtaW5AbWFpbGluYXRvci5jb20iO3M6NTA6ImxvZ2luX3dlYl9jMWEyNmJjMDAyNDlkYzYyMWYwM2M0MTc3OGQ1NWZlMzMxZTdlOTEyIjtOO3M6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0='),
('sX6Pec94BOexnpMy0XLm2NXN5D7QbznRa6mOPTLB',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/138.0.0.0 Safari/537.36',1754114767,'YTo3OntzOjY6Il90b2tlbiI7czo0MDoiUG93T3NwV1lnOTF2WXpRelFrWXEyV3Z5czRRVldlcjZPdngxU0x3eCI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo1MDoibG9naW5fd2ViX2MxYTI2YmMwMDI0OWRjNjIxZjAzYzQxNzc4ZDU1ZmUzMzFlN2U5MTIiO2k6MztzOjY6InVzZXJJZCI7aTozO3M6ODoidXNlcm5hbWUiO3M6NzoiZGJhcm5lcyI7czo1OiJlbWFpbCI7czoyMjoiZGJhcm5lc0BtYWlsaW5hdG9yLmNvbSI7czoxNzoicGFzc3dvcmRfaGFzaF93ZWIiO3M6NjA6IiQyeSQxMCRzMW5hZ2pkL0FTai9wYTZMdWw5QWd1QjJSSUhFTm5STkYzNEdkaGVCRDJZUDVtSHBSNkl2RyI7fQ=='),
('sxRnmZy1JC11OavcifGjrCu4rV8hd2k2neAMY6Nm',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/138.0.0.0 Safari/537.36',1754114316,'YTo3OntzOjY6Il90b2tlbiI7czo0MDoiaXlwbEFnaFdDeTdRRzBrbEFqNjlMamJ4ZDJLaHBBRWMyRnFaenRTRCI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo1MDoibG9naW5fd2ViX2MxYTI2YmMwMDI0OWRjNjIxZjAzYzQxNzc4ZDU1ZmUzMzFlN2U5MTIiO2k6MztzOjY6InVzZXJJZCI7aTozO3M6ODoidXNlcm5hbWUiO3M6NzoiZGJhcm5lcyI7czo1OiJlbWFpbCI7czoyMjoiZGJhcm5lc0BtYWlsaW5hdG9yLmNvbSI7czoxNzoicGFzc3dvcmRfaGFzaF93ZWIiO3M6NjA6IiQyeSQxMCQzVlJTeTdpa2NnTHV2ZGpDOWdlelFlb0J3bGhJcHYzRW5mbTRoWHFEQzl4elc3UHUza3RIeSI7fQ=='),
('TBwj7t73PgEprBYGzqUEvb3m6YLgbSnBs7tjhomI',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/138.0.0.0 Safari/537.36',1754113385,'YTozOntzOjY6Il90b2tlbiI7czo0MDoiNkJLNzF1cmttM3NLbmJsZ3lCeXRJTkozdzB0TGhmTTRVNlgxdEUxSiI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czoxMzoiY3VycmVudExvY2FsZSI7czoyOiJlbiI7fQ=='),
('tfErMM6iKOFSORk59NhnmhpvIdZBaXdA7Je1dgGv',36,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/138.0.0.0 Safari/537.36',1754114695,'YTo4OntzOjY6Il90b2tlbiI7czo0MDoiSWIzQVlXZHN3bWYzaVdwR1hmbVhMVURjNFNSVnVGUGNUQ2g5U2RpZiI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czoxMzoiY3VycmVudExvY2FsZSI7czoyOiJlbiI7czo4OiJ1c2VybmFtZSI7czo1OiJ6emVkZCI7czo1MDoibG9naW5fd2ViX2MxYTI2YmMwMDI0OWRjNjIxZjAzYzQxNzc4ZDU1ZmUzMzFlN2U5MTIiO2k6MzY7czo2OiJ1c2VySWQiO2k6MzY7czo1OiJlbWFpbCI7czoyMDoienplZGRAbWFpbGluYXRvci5jb20iO3M6MTc6InBhc3N3b3JkX2hhc2hfd2ViIjtzOjYwOiIkMnkkMTAkZXl3VVpVbHNac2E4ZnFLVjlCN25ELnovTGk3Y1htUDhiWFVzMmdSdmx4WU5rdDA0bEkvT2UiO30='),
('TFVojcAqqaZi1JIzRpil2DLDFnxifL4FK7X1GYSr',1,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/138.0.0.0 Safari/537.36',1754113359,'YTo3OntzOjY6Il90b2tlbiI7czo0MDoiSHNKZEo2TWtaQjQyOGl4cnlOVWhxV1BTSFh6dnRLNklRZmh1emNRUCI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo1MDoibG9naW5fd2ViX2MxYTI2YmMwMDI0OWRjNjIxZjAzYzQxNzc4ZDU1ZmUzMzFlN2U5MTIiO2k6MTtzOjY6InVzZXJJZCI7aToxO3M6ODoidXNlcm5hbWUiO3M6NToiYWRtaW4iO3M6NToiZW1haWwiO3M6MjM6InBrcGFkbWluQG1haWxpbmF0b3IuY29tIjtzOjE3OiJwYXNzd29yZF9oYXNoX3dlYiI7czo2MDoiJDJ5JDEwJEMyZEFFRnhyNHJVVnZBNlhoWDh6dS5uTG45MGNUYy5jTnpsbFZRVnFTZHlaL28welMwWmlDIjt9'),
('tG66iTMwwxkXgmiuNurtD40RcGmSxwZxMSZRXwtz',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/138.0.0.0 Safari/537.36',1754114781,'YTo3OntzOjY6Il90b2tlbiI7czo0MDoiaUNtYWVLUFpwSW5sZTFhOTRwYnBXU2hDWWpFMGdVTTJFUDRGdk5VVyI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo1MDoibG9naW5fd2ViX2MxYTI2YmMwMDI0OWRjNjIxZjAzYzQxNzc4ZDU1ZmUzMzFlN2U5MTIiO2k6MztzOjY6InVzZXJJZCI7aTozO3M6ODoidXNlcm5hbWUiO3M6NzoiZGJhcm5lcyI7czo1OiJlbWFpbCI7czoyMjoiZGJhcm5lc0BtYWlsaW5hdG9yLmNvbSI7czoxNzoicGFzc3dvcmRfaGFzaF93ZWIiO3M6NjA6IiQyeSQxMCREWFguTGRmNi9rNjF3VjV0cGpyZWFlVFVncVZQY25JQTFUZWxzUnUwYy5FMjE0MEJHbndjeSI7fQ=='),
('Tsgiu5TmcNhhfxyzRNDxeA1XMHifWFVUaONLx1Fc',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/138.0.0.0 Safari/537.36',1754113596,'YTozOntzOjY6Il90b2tlbiI7czo0MDoiRkgya3QxQnV2eXV2OWEyTWVqc2tVZzVoVnBYZmJkSlJRM3ZPdFE3eiI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czoxMzoiY3VycmVudExvY2FsZSI7czoyOiJlbiI7fQ=='),
('TSsGNagIYzdLa3EsbZ65irUd4c4aSiEaLBzpNR7r',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/138.0.0.0 Safari/537.36',1754113510,'YTo1OntzOjY6Il90b2tlbiI7czo0MDoibkQ4bk5QVEhEN2dIU3lIVjNaVllqTGhyalhybWNxTklkNjlRR1VSeSI7czo4OiJ1c2VybmFtZSI7czo1OiJhZG1pbiI7czo1OiJlbWFpbCI7czoyMzoicGtwYWRtaW5AbWFpbGluYXRvci5jb20iO3M6NTA6ImxvZ2luX3dlYl9jMWEyNmJjMDAyNDlkYzYyMWYwM2M0MTc3OGQ1NWZlMzMxZTdlOTEyIjtOO3M6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0='),
('UlKLRKrO6ROEvn0JM0x7j8Q1GQEG5nfbKCKy5EPn',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/138.0.0.0 Safari/537.36',1754113998,'YToyOntzOjY6Il90b2tlbiI7czo0MDoiQzVJVm5EMVZsY0pDaWQ1c1JtSVZzS1l0M242bkJhclZMMGFTQlh5WiI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ=='),
('UN4z2DjlYG84GPst0S3KBZtQpDcHxhkFtu0VVM3T',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/138.0.0.0 Safari/537.36',1754114819,'YTo3OntzOjY6Il90b2tlbiI7czo0MDoiNzRYTFhudm1uaDV6d1pZaUpzWEFSaVFZQlh4dzhHb3NRZ1FWVDAxTiI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo1MDoibG9naW5fd2ViX2MxYTI2YmMwMDI0OWRjNjIxZjAzYzQxNzc4ZDU1ZmUzMzFlN2U5MTIiO2k6MztzOjY6InVzZXJJZCI7aTozO3M6ODoidXNlcm5hbWUiO3M6NzoiZGJhcm5lcyI7czo1OiJlbWFpbCI7czoyMjoiZGJhcm5lc0BtYWlsaW5hdG9yLmNvbSI7czoxNzoicGFzc3dvcmRfaGFzaF93ZWIiO3M6NjA6IiQyeSQxMCRtenlEVkE3aWxxTVBaR1JBSHd6aUt1R21LSlhOTmZSYy5sT0NnL3EwNTJBb01US2JHVjNBVyI7fQ=='),
('utV91Fn5NyC1UYCmeVXcmCWB0SR8HKQy9Xc3KZyh',23,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/138.0.0.0 Safari/537.36',1754114179,'YTo4OntzOjY6Il90b2tlbiI7czo0MDoiNFJYNFdRTVhYTzlXN1Y2ZzJUdURvV1lxQ2NCaGVId1c3T0cyU0JSRSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czoxMzoiY3VycmVudExvY2FsZSI7czoyOiJlbiI7czo4OiJ1c2VybmFtZSI7czo5OiJkc29rb2xvZmYiO3M6NTA6ImxvZ2luX3dlYl9jMWEyNmJjMDAyNDlkYzYyMWYwM2M0MTc3OGQ1NWZlMzMxZTdlOTEyIjtpOjIzO3M6NjoidXNlcklkIjtpOjIzO3M6NToiZW1haWwiO3M6MjQ6ImRzb2tvbG9mZkBtYWlsaW5hdG9yLmNvbSI7czoxNzoicGFzc3dvcmRfaGFzaF93ZWIiO3M6NjA6IiQyeSQxMCR1RjRFalE3RnpZLlM0QWIyb1Q0WEllRTZUVzZrY2dnY2FrQWpNRkxtVGU3UkQwaTBsc1Z6UyI7fQ=='),
('uy3IIllb4WIW1xwHhniG1fTXUToIw3M4aXY5pmH7',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/138.0.0.0 Safari/537.36',1754113320,'YToyOntzOjY6Il90b2tlbiI7czo0MDoiUHlITGtkWHdtaXd6VFhTWUhTYnBtdGU1WUlDTjM4WHpYZTNyY05IOCI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ=='),
('uyXzVQWZ5Ae9KFgOUaaa0VReF0n1cQuegzVC3wSa',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/138.0.0.0 Safari/537.36',1754114594,'YTo1OntzOjY6Il90b2tlbiI7czo0MDoiN1dTdnpWUnN1SzZRUzdKVTZjVHkzMXRsVmN6VHlHSHBWOHJjbUJxYiI7czo4OiJ1c2VybmFtZSI7czo1OiJhZG1pbiI7czo1OiJlbWFpbCI7czoyMzoicGtwYWRtaW5AbWFpbGluYXRvci5jb20iO3M6NTA6ImxvZ2luX3dlYl9jMWEyNmJjMDAyNDlkYzYyMWYwM2M0MTc3OGQ1NWZlMzMxZTdlOTEyIjtOO3M6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0='),
('v0knsqnNZviHoNJeerjjl3uidFv7SgTKzVZqsr4t',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/138.0.0.0 Safari/537.36',1754113970,'YTo1OntzOjY6Il90b2tlbiI7czo0MDoiNllBU0dtaGpVbTVSdjRia09LR25mUzMyamN3OEU5ZEVaa1h3TzJsYyI7czo4OiJ1c2VybmFtZSI7czo3OiJkYmFybmVzIjtzOjU6ImVtYWlsIjtzOjIyOiJkYmFybmVzQG1haWxpbmF0b3IuY29tIjtzOjUwOiJsb2dpbl93ZWJfYzFhMjZiYzAwMjQ5ZGM2MjFmMDNjNDE3NzhkNTVmZTMzMWU3ZTkxMiI7TjtzOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19'),
('Vl2n2zC5zPAz7ZzjicFIPXmWolDSOC67Lxy5mx6t',1,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/138.0.0.0 Safari/537.36',1754113364,'YTo3OntzOjY6Il90b2tlbiI7czo0MDoiV3I5ZVZMa01MUDZ0emFmUm44eGJkRzNremh2eVJDeWdrTmVWbXRuZiI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo1MDoibG9naW5fd2ViX2MxYTI2YmMwMDI0OWRjNjIxZjAzYzQxNzc4ZDU1ZmUzMzFlN2U5MTIiO2k6MTtzOjY6InVzZXJJZCI7aToxO3M6ODoidXNlcm5hbWUiO3M6NToiYWRtaW4iO3M6NToiZW1haWwiO3M6MjM6InBrcGFkbWluQG1haWxpbmF0b3IuY29tIjtzOjE3OiJwYXNzd29yZF9oYXNoX3dlYiI7czo2MDoiJDJ5JDEwJFpxM2dwMXYvdXBXZEFMOUw4ai5CMi5yY2c0V0V3RGFvL1gwMkdBcnd6RWhlU2MyTWxpY1N5Ijt9'),
('voaIEemsm5PTaQZaoBUYzhAizPOWEs87waFZJPL1',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/138.0.0.0 Safari/537.36',1754113488,'YTo1OntzOjY6Il90b2tlbiI7czo0MDoiNUg5VjhzNXpkbzF0SVFmVDR2MVVIcTNYY3MyWGFrQ1pwb04zZTRleCI7czo4OiJ1c2VybmFtZSI7czo1OiJhZG1pbiI7czo1OiJlbWFpbCI7czoyMzoicGtwYWRtaW5AbWFpbGluYXRvci5jb20iO3M6NTA6ImxvZ2luX3dlYl9jMWEyNmJjMDAyNDlkYzYyMWYwM2M0MTc3OGQ1NWZlMzMxZTdlOTEyIjtOO3M6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0='),
('WcHVe6IUfkxUo8o5bFTb0HZeOTbtD9H1vVVIfaVW',18,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/138.0.0.0 Safari/537.36',1754114042,'YTo4OntzOjY6Il90b2tlbiI7czo0MDoiVnRDcmFocjBUV0p6TkNrVjQ0NHRqNWFldjZkRTNRT2JZcmh4UTZEQiI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czoxMzoiY3VycmVudExvY2FsZSI7czoyOiJlbiI7czo4OiJ1c2VybmFtZSI7czo3OiJjY29yaW5vIjtzOjUwOiJsb2dpbl93ZWJfYzFhMjZiYzAwMjQ5ZGM2MjFmMDNjNDE3NzhkNTVmZTMzMWU3ZTkxMiI7aToxODtzOjY6InVzZXJJZCI7aToxODtzOjU6ImVtYWlsIjtzOjIyOiJjY29yaW5vQG1haWxpbmF0b3IuY29tIjtzOjE3OiJwYXNzd29yZF9oYXNoX3dlYiI7czo2MDoiJDJ5JDEwJGVyU0E2YmRucXVIQ054WmRBblI1dk9MeUF3T1BTQ1lJalNoQmUvSlFYLkJLM29SdjAxcm5PIjt9'),
('wGldcIXz492gkXVsaUhuizJ0mAfZ2Z6a2WMUuyf4',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/138.0.0.0 Safari/537.36',1754113942,'YTo4OntzOjY6Il90b2tlbiI7czo0MDoiZHNQQ3BLeXZ6Y0tYUHhmTkxLVHk1TUFmMnR2R2pnemhBbXBIaUQ1MyI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo1MDoibG9naW5fd2ViX2MxYTI2YmMwMDI0OWRjNjIxZjAzYzQxNzc4ZDU1ZmUzMzFlN2U5MTIiO2k6MztzOjY6InVzZXJJZCI7aTozO3M6ODoidXNlcm5hbWUiO3M6NzoiZGJhcm5lcyI7czo1OiJlbWFpbCI7czoyMjoiZGJhcm5lc0BtYWlsaW5hdG9yLmNvbSI7czoxNzoicGFzc3dvcmRfaGFzaF93ZWIiO3M6NjA6IiQyeSQxMCQ1Q0I5eWRVdlF6a0NDOFp6R29sY3YuNXhlT3BBc08ySk92cXQwa0NFVjRwbGRsaldPbzdSLiI7czoxMzoiY3VycmVudExvY2FsZSI7czoyOiJlbiI7fQ=='),
('WZOJwH099ELkOuCMU8OlbbjnJnFOejYC4RH1dqGx',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/138.0.0.0 Safari/537.36',1754113437,'YTozOntzOjY6Il90b2tlbiI7czo0MDoiQ2k1cEVOcXZ1d2ZqY0lMaXpSeVFtY0xZNHJOcmExUDBRZ0U5UnN0NSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czoxMzoiY3VycmVudExvY2FsZSI7czoyOiJlbiI7fQ=='),
('ydA2jNgbV5cQ38SvGec9qVBYJWAOJnMktk3MJ4i8',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/138.0.0.0 Safari/537.36',1754113688,'YTozOntzOjY6Il90b2tlbiI7czo0MDoiNmFwRTVkSHZNMUIycVN3Mm9uVUpoMXZtb3M5b3U2SW5hb0k4VlRUQiI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czoxMzoiY3VycmVudExvY2FsZSI7czoyOiJlbiI7fQ=='),
('ye57m524qWMF2h2YtwXsNSolEhIwiWD7AQV2Xp2m',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/138.0.0.0 Safari/537.36',1754113845,'YTo3OntzOjY6Il90b2tlbiI7czo0MDoiNUNzdG9ab3JSa0FWWE9acDRiYUNwa25HenlWNlZKeDcyajFxclJPaiI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo1MDoibG9naW5fd2ViX2MxYTI2YmMwMDI0OWRjNjIxZjAzYzQxNzc4ZDU1ZmUzMzFlN2U5MTIiO2k6MztzOjY6InVzZXJJZCI7aTozO3M6ODoidXNlcm5hbWUiO3M6NzoiZGJhcm5lcyI7czo1OiJlbWFpbCI7czoyMjoiZGJhcm5lc0BtYWlsaW5hdG9yLmNvbSI7czoxNzoicGFzc3dvcmRfaGFzaF93ZWIiO3M6NjA6IiQyeSQxMCRWYWpwS2t3bXBINkovUzhnZXVRcEFld0NaY2VyVC5hYVpyNGxlYmJLbXdyOGh5T2RUNjRUTyI7fQ=='),
('ygMcpSRiozkHM98mRzhRIwecKMvBTerefnX65iZL',17,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/138.0.0.0 Safari/537.36',1754113955,'YTo4OntzOjY6Il90b2tlbiI7czo0MDoiSXhlZXpPVW1maENsQTZEaXFTaU92MmNsbnhlTk1kTWdlVzNEMlpPayI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo1MDoibG9naW5fd2ViX2MxYTI2YmMwMDI0OWRjNjIxZjAzYzQxNzc4ZDU1ZmUzMzFlN2U5MTIiO2k6MTc7czo2OiJ1c2VySWQiO2k6MTc7czo4OiJ1c2VybmFtZSI7czoxMDoiYW13YW5kZW5nYSI7czo1OiJlbWFpbCI7czoyNToiYW13YW5kZW5nYUBtYWlsaW5hdG9yLmNvbSI7czoxNzoicGFzc3dvcmRfaGFzaF93ZWIiO3M6NjA6IiQyeSQxMCQxTXJLSXg5T1I4MGNzTFg3ZUhnSlpPbkpJSG5RREJkS0FTTkNiQmxHak1mMW9sSGozVm9XRyI7czoxMzoiY3VycmVudExvY2FsZSI7czoyOiJlbiI7fQ=='),
('yO7P7IDI6IByxBJlewdtM28ecWdSc0XhFw8gvzRf',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/138.0.0.0 Safari/537.36',1754113543,'YTozOntzOjY6Il90b2tlbiI7czo0MDoiRWVFQVFIZFJrY0VVampnV05qM1kwZk0yUmlIaFVaUVNjaUE4eWRBRyI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czoxMzoiY3VycmVudExvY2FsZSI7czoyOiJlbiI7fQ=='),
('Yp21euRMAT8t6TkWCb6Vi7738DEjBaFLVfoemrgW',21,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/138.0.0.0 Safari/537.36',1754114107,'YTo4OntzOjY6Il90b2tlbiI7czo0MDoicXZDMWFZdGh2bG5SdEpRUW5DWHdBN3R2d0pYZmxvajk3eU5DRU9iSiI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czoxMzoiY3VycmVudExvY2FsZSI7czoyOiJlbiI7czo4OiJ1c2VybmFtZSI7czo2OiJkZGlvdWYiO3M6NTA6ImxvZ2luX3dlYl9jMWEyNmJjMDAyNDlkYzYyMWYwM2M0MTc3OGQ1NWZlMzMxZTdlOTEyIjtpOjIxO3M6NjoidXNlcklkIjtpOjIxO3M6NToiZW1haWwiO3M6MjE6ImRkaW91ZkBtYWlsaW5hdG9yLmNvbSI7czoxNzoicGFzc3dvcmRfaGFzaF93ZWIiO3M6NjA6IiQyeSQxMCR4SExrZmtuWHZGY1RIN3NQZWZidWVlend1dDRPVWRVMWFZaEozYVFENFRjU2Z0bkg2eC5rcSI7fQ=='),
('YVKoDtgBpfc6aRcpRFpR7pFvqT8HGkAtRav29Zqc',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/138.0.0.0 Safari/537.36',1754114171,'YTo3OntzOjY6Il90b2tlbiI7czo0MDoiMGh0VU9pdDVOcVN0VlIzbGtVVU5FMjVORENWNVMwR3FrbHlRWUxMRSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo1MDoibG9naW5fd2ViX2MxYTI2YmMwMDI0OWRjNjIxZjAzYzQxNzc4ZDU1ZmUzMzFlN2U5MTIiO2k6MztzOjY6InVzZXJJZCI7aTozO3M6ODoidXNlcm5hbWUiO3M6NzoiZGJhcm5lcyI7czo1OiJlbWFpbCI7czoyMjoiZGJhcm5lc0BtYWlsaW5hdG9yLmNvbSI7czoxNzoicGFzc3dvcmRfaGFzaF93ZWIiO3M6NjA6IiQyeSQxMCR6ZGo2OWRtbUZjY05KQ0ZqbTNxcnF1S2NQYlV4L1F6VkVrM2dJNmpFbUpMaVdnakVZa3NaeSI7fQ=='),
('YVVggYziOoFEElABukvCiKBW04n6zmQZTlCHv1tY',1,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/138.0.0.0 Safari/537.36',1754113763,'YTo3OntzOjY6Il90b2tlbiI7czo0MDoiSXpkTDVCNWkzMXo5MmtQaXlUam5lMVZGV05qM2JNUTY5S040cWZSUSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo1MDoibG9naW5fd2ViX2MxYTI2YmMwMDI0OWRjNjIxZjAzYzQxNzc4ZDU1ZmUzMzFlN2U5MTIiO2k6MTtzOjY6InVzZXJJZCI7aToxO3M6ODoidXNlcm5hbWUiO3M6NToiYWRtaW4iO3M6NToiZW1haWwiO3M6MjM6InBrcGFkbWluQG1haWxpbmF0b3IuY29tIjtzOjE3OiJwYXNzd29yZF9oYXNoX3dlYiI7czo2MDoiJDJ5JDEwJDhzVTJsMDJsOFdHczBCL2I0MEpDNWVzWWNnd1BOa2xjVXhBNTRwYkxBaVIvYjFERUMxb3BtIjt9'),
('ZcK3szcTwUAeggkurpjgWb0rEuNHGhX181U5xeox',27,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/138.0.0.0 Safari/537.36',1754114294,'YTo4OntzOjY6Il90b2tlbiI7czo0MDoiWk02VjRkNTJaQ05RMTNCaGFqR25LNENabHBINTBNbjNKNG1INmZKZiI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czoxMzoiY3VycmVudExvY2FsZSI7czoyOiJlbiI7czo4OiJ1c2VybmFtZSI7czoxMDoia2Fsa2hhZmFqaSI7czo1MDoibG9naW5fd2ViX2MxYTI2YmMwMDI0OWRjNjIxZjAzYzQxNzc4ZDU1ZmUzMzFlN2U5MTIiO2k6Mjc7czo2OiJ1c2VySWQiO2k6Mjc7czo1OiJlbWFpbCI7czoyNToia2Fsa2hhZmFqaUBtYWlsaW5hdG9yLmNvbSI7czoxNzoicGFzc3dvcmRfaGFzaF93ZWIiO3M6NjA6IiQyeSQxMCQudWdCdDA2S1JmWlZTaVNzaDh6b1llbW9LVk96djFqVUEwNnEyaEpnVVFUbXVtYjJxNXYxeSI7fQ==');
/*!40000 ALTER TABLE `sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `site`
--

DROP TABLE IF EXISTS `site`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
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
/*!40101 SET character_set_client = utf8mb4 */;
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
(15,'uniqueSiteId','','C29BE8DB-DF03-4CB8-A9E5-267513A222C5');
/*!40000 ALTER TABLE `site_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stage_assignments`
--

DROP TABLE IF EXISTS `stage_assignments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
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
) ENGINE=InnoDB AUTO_INCREMENT=98 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='Who can access a submission while it is in the editorial workflow. Includes all editorial and author assignments. For reviewers, see review_assignments.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stage_assignments`
--

LOCK TABLES `stage_assignments` WRITE;
/*!40000 ALTER TABLE `stage_assignments` DISABLE KEYS */;
INSERT INTO `stage_assignments` VALUES
(1,1,14,17,'2025-08-02 05:49:30',0,0),
(2,1,3,3,'2025-08-02 05:50:10',0,1),
(3,1,5,4,'2025-08-02 05:50:10',0,1),
(4,1,5,5,'2025-08-02 05:50:10',1,0),
(5,1,7,12,'2025-08-02 05:50:33',0,0),
(6,1,11,14,'2025-08-02 05:50:40',0,0),
(7,1,13,16,'2025-08-02 05:50:43',0,0),
(8,2,14,18,'2025-08-02 05:53:59',0,0),
(9,2,3,3,'2025-08-02 05:54:02',0,1),
(10,2,5,4,'2025-08-02 05:54:02',0,1),
(11,2,5,5,'2025-08-02 05:54:02',0,1),
(12,2,5,6,'2025-08-02 05:54:10',1,1),
(13,3,14,19,'2025-08-02 05:54:28',0,0),
(14,3,3,3,'2025-08-02 05:54:30',0,1),
(15,3,5,4,'2025-08-02 05:54:30',0,1),
(16,3,5,5,'2025-08-02 05:54:30',0,1),
(17,3,7,11,'2025-08-02 05:54:48',0,0),
(18,4,14,20,'2025-08-02 05:54:54',0,0),
(19,4,3,3,'2025-08-02 05:54:57',0,1),
(20,4,5,4,'2025-08-02 05:54:57',0,1),
(21,4,5,5,'2025-08-02 05:54:57',0,1),
(22,5,14,21,'2025-08-02 05:55:03',0,0),
(23,5,3,3,'2025-08-02 05:55:06',0,1),
(24,5,5,4,'2025-08-02 05:55:06',0,1),
(25,5,5,5,'2025-08-02 05:55:06',0,1),
(26,5,7,11,'2025-08-02 05:55:24',0,0),
(27,5,11,13,'2025-08-02 05:55:31',0,0),
(28,5,13,15,'2025-08-02 05:55:35',0,0),
(29,6,14,22,'2025-08-02 05:55:41',0,0),
(30,6,3,3,'2025-08-02 05:55:43',0,1),
(31,6,5,4,'2025-08-02 05:55:43',0,1),
(32,6,5,5,'2025-08-02 05:55:43',0,1),
(33,6,7,11,'2025-08-02 05:56:02',0,0),
(34,6,11,13,'2025-08-02 05:56:10',0,0),
(35,7,14,23,'2025-08-02 05:56:16',0,0),
(36,7,3,3,'2025-08-02 05:56:19',0,1),
(37,7,5,4,'2025-08-02 05:56:19',0,1),
(38,7,5,5,'2025-08-02 05:56:19',0,1),
(39,8,14,24,'2025-08-02 05:56:47',0,0),
(40,8,3,3,'2025-08-02 05:56:50',0,1),
(41,8,5,4,'2025-08-02 05:56:50',0,1),
(42,8,5,5,'2025-08-02 05:56:50',0,1),
(43,9,14,25,'2025-08-02 05:56:56',0,0),
(44,9,3,3,'2025-08-02 05:56:58',0,1),
(45,9,5,6,'2025-08-02 05:56:58',0,1),
(46,9,7,12,'2025-08-02 05:57:18',0,0),
(47,9,11,14,'2025-08-02 05:57:26',0,0),
(48,9,13,16,'2025-08-02 05:57:29',0,0),
(49,10,14,26,'2025-08-02 05:57:35',0,0),
(50,10,3,3,'2025-08-02 05:57:38',0,1),
(51,10,5,4,'2025-08-02 05:57:38',0,1),
(52,10,5,5,'2025-08-02 05:57:38',0,1),
(53,11,14,27,'2025-08-02 05:58:10',0,0),
(54,11,3,3,'2025-08-02 05:58:13',0,1),
(55,11,5,4,'2025-08-02 05:58:13',0,1),
(56,11,5,5,'2025-08-02 05:58:13',0,1),
(57,12,14,28,'2025-08-02 05:58:19',0,0),
(58,12,3,3,'2025-08-02 05:58:22',0,1),
(59,12,5,4,'2025-08-02 05:58:22',0,1),
(60,12,5,5,'2025-08-02 05:58:22',0,1),
(61,13,14,29,'2025-08-02 05:58:42',0,0),
(62,13,3,3,'2025-08-02 05:58:44',0,1),
(63,13,5,4,'2025-08-02 05:58:44',0,1),
(64,13,5,5,'2025-08-02 05:58:44',0,1),
(65,14,14,30,'2025-08-02 05:59:38',0,0),
(66,14,3,3,'2025-08-02 05:59:41',0,1),
(67,14,5,4,'2025-08-02 05:59:41',0,1),
(68,14,5,5,'2025-08-02 05:59:41',0,1),
(69,15,14,31,'2025-08-02 05:59:47',0,0),
(70,15,3,3,'2025-08-02 05:59:49',0,1),
(71,15,5,4,'2025-08-02 05:59:49',0,1),
(72,15,5,5,'2025-08-02 05:59:49',0,1),
(73,15,7,12,'2025-08-02 06:00:12',0,0),
(74,15,11,14,'2025-08-02 06:00:20',0,0),
(75,16,14,32,'2025-08-02 06:00:27',0,0),
(76,16,3,3,'2025-08-02 06:00:29',0,1),
(77,16,5,4,'2025-08-02 06:00:29',0,1),
(78,16,5,5,'2025-08-02 06:00:29',0,1),
(79,17,14,33,'2025-08-02 06:00:35',0,0),
(80,17,3,3,'2025-08-02 06:00:38',0,1),
(81,17,5,4,'2025-08-02 06:00:38',0,1),
(82,17,5,5,'2025-08-02 06:00:38',0,1),
(83,17,7,11,'2025-08-02 06:01:01',0,0),
(84,17,11,13,'2025-08-02 06:01:10',0,0),
(85,17,13,15,'2025-08-02 06:01:13',0,0),
(86,18,14,34,'2025-08-02 06:02:18',0,0),
(87,18,3,3,'2025-08-02 06:02:21',0,1),
(88,18,5,4,'2025-08-02 06:02:21',0,1),
(89,18,5,5,'2025-08-02 06:02:21',0,1),
(90,19,14,35,'2025-08-02 06:02:37',0,0),
(91,19,3,3,'2025-08-02 06:02:40',0,1),
(92,19,5,6,'2025-08-02 06:02:40',0,1),
(93,19,7,12,'2025-08-02 06:03:04',0,0),
(94,20,14,36,'2025-08-02 06:03:20',0,0),
(95,20,3,3,'2025-08-02 06:04:51',0,1),
(96,20,5,4,'2025-08-02 06:04:51',0,1),
(97,20,5,5,'2025-08-02 06:04:51',0,1);
/*!40000 ALTER TABLE `stage_assignments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `static_page_settings`
--

DROP TABLE IF EXISTS `static_page_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
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
/*!40101 SET character_set_client = utf8mb4 */;
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
/*!40101 SET character_set_client = utf8mb4 */;
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
/*!40101 SET character_set_client = utf8mb4 */;
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
(1,1,4096,7,10,8,'','<p>Here are my review comments</p>','2025-08-02 05:56:40',NULL,1),
(2,1,4096,10,15,9,'','<p>Here are my review comments</p>','2025-08-02 05:57:57',NULL,1),
(3,1,4096,10,16,10,'','<p>Here are my review comments</p>','2025-08-02 05:58:04',NULL,1),
(4,1,4096,13,19,7,'','<p>Here are my review comments</p>','2025-08-02 05:59:07',NULL,1),
(5,1,4096,13,20,9,'','<p>Here are my review comments</p>','2025-08-02 05:59:14',NULL,1),
(6,1,4096,13,21,10,'','<p>Here are my review comments</p>','2025-08-02 05:59:20',NULL,1);
/*!40000 ALTER TABLE `submission_comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `submission_file_revisions`
--

DROP TABLE IF EXISTS `submission_file_revisions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `submission_file_revisions` (
  `revision_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `submission_file_id` bigint(20) unsigned NOT NULL,
  `file_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`revision_id`),
  KEY `submission_file_revisions_submission_file_id` (`submission_file_id`),
  KEY `submission_file_revisions_file_id` (`file_id`),
  CONSTRAINT `submission_file_revisions_file_id_foreign` FOREIGN KEY (`file_id`) REFERENCES `files` (`file_id`) ON DELETE CASCADE,
  CONSTRAINT `submission_file_revisions_submission_file_id_foreign` FOREIGN KEY (`submission_file_id`) REFERENCES `submission_files` (`submission_file_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='Revisions map submission_file entries to files on the data store.';
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
(43,43,26),
(44,44,27),
(45,45,27);
/*!40000 ALTER TABLE `submission_file_revisions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `submission_file_settings`
--

DROP TABLE IF EXISTS `submission_file_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
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
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='Localized data about submission files like published metadata.';
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
(45,43,'en','name','Finocchiaro: Arguments About Arguments.pdf'),
(46,44,'en','name','Transformative Impact of AI Tools on Modern Education: Opportunities, Challenges, and Future Directions.pdf'),
(47,45,'en','name','Transformative Impact of AI Tools on Modern Education: Opportunities, Challenges, and Future Directions.pdf');
/*!40000 ALTER TABLE `submission_file_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `submission_files`
--

DROP TABLE IF EXISTS `submission_files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
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
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='All files associated with a submission, such as those uploaded during submission, as revisions, or by copyeditors or layout editors for production.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `submission_files`
--

LOCK TABLES `submission_files` WRITE;
/*!40000 ALTER TABLE `submission_files` DISABLE KEYS */;
INSERT INTO `submission_files` VALUES
(1,1,1,NULL,1,2,NULL,NULL,NULL,'2025-08-02 05:49:39','2025-08-02 05:49:40',17,NULL,NULL),
(2,1,2,NULL,12,2,NULL,NULL,NULL,'2025-08-02 05:49:41','2025-08-02 05:49:41',17,NULL,NULL),
(3,1,3,NULL,7,2,NULL,NULL,NULL,'2025-08-02 05:49:42','2025-08-02 05:49:43',17,NULL,NULL),
(4,1,4,NULL,7,2,NULL,NULL,NULL,'2025-08-02 05:49:43','2025-08-02 05:49:44',17,NULL,NULL),
(5,1,5,NULL,12,2,NULL,NULL,NULL,'2025-08-02 05:49:44','2025-08-02 05:49:45',17,NULL,NULL),
(7,1,5,5,12,4,NULL,NULL,NULL,'2025-08-02 05:50:18','2025-08-02 05:50:18',17,523,1),
(8,1,4,4,7,4,NULL,NULL,NULL,'2025-08-02 05:50:18','2025-08-02 05:50:18',17,523,1),
(9,1,3,3,7,4,NULL,NULL,NULL,'2025-08-02 05:50:18','2025-08-02 05:50:18',17,523,1),
(10,1,2,2,12,4,NULL,NULL,NULL,'2025-08-02 05:50:18','2025-08-02 05:50:18',17,523,1),
(11,1,1,1,1,4,NULL,NULL,NULL,'2025-08-02 05:50:19','2025-08-02 05:50:19',17,523,1),
(12,1,7,NULL,1,10,NULL,NULL,NULL,'2025-08-02 05:52:20','2025-08-02 05:52:21',3,521,1),
(13,2,8,NULL,1,2,NULL,NULL,NULL,'2025-08-02 05:54:01','2025-08-02 05:54:01',18,NULL,NULL),
(14,2,8,13,1,4,NULL,NULL,NULL,'2025-08-02 05:54:07','2025-08-02 05:54:07',18,523,2),
(15,3,9,NULL,1,2,NULL,NULL,NULL,'2025-08-02 05:54:29','2025-08-02 05:54:30',19,NULL,NULL),
(16,3,9,15,1,4,NULL,NULL,NULL,'2025-08-02 05:54:35','2025-08-02 05:54:35',19,523,3),
(17,4,10,NULL,1,2,NULL,NULL,NULL,'2025-08-02 05:54:56','2025-08-02 05:54:56',20,NULL,NULL),
(18,5,11,NULL,1,2,NULL,NULL,NULL,'2025-08-02 05:55:05','2025-08-02 05:55:05',21,NULL,NULL),
(19,5,11,18,1,4,NULL,NULL,NULL,'2025-08-02 05:55:12','2025-08-02 05:55:12',21,523,4),
(20,6,12,NULL,1,2,NULL,NULL,NULL,'2025-08-02 05:55:43','2025-08-02 05:55:43',22,NULL,NULL),
(21,6,12,20,1,4,NULL,NULL,NULL,'2025-08-02 05:55:49','2025-08-02 05:55:49',22,523,5),
(22,7,13,NULL,1,2,NULL,NULL,NULL,'2025-08-02 05:56:18','2025-08-02 05:56:18',23,NULL,NULL),
(23,7,13,22,1,4,NULL,NULL,NULL,'2025-08-02 05:56:25','2025-08-02 05:56:25',23,523,6),
(24,8,14,NULL,1,2,NULL,NULL,NULL,'2025-08-02 05:56:48','2025-08-02 05:56:49',24,NULL,NULL),
(25,9,15,NULL,1,2,NULL,NULL,NULL,'2025-08-02 05:56:58','2025-08-02 05:56:58',25,NULL,NULL),
(26,9,15,25,1,4,NULL,NULL,NULL,'2025-08-02 05:57:05','2025-08-02 05:57:05',25,523,7),
(27,10,16,NULL,1,2,NULL,NULL,NULL,'2025-08-02 05:57:37','2025-08-02 05:57:37',26,NULL,NULL),
(28,10,16,27,1,4,NULL,NULL,NULL,'2025-08-02 05:57:45','2025-08-02 05:57:45',26,523,8),
(29,11,17,NULL,1,2,NULL,NULL,NULL,'2025-08-02 05:58:12','2025-08-02 05:58:12',27,NULL,NULL),
(30,12,18,NULL,1,2,NULL,NULL,NULL,'2025-08-02 05:58:21','2025-08-02 05:58:21',28,NULL,NULL),
(31,12,18,30,1,4,NULL,NULL,NULL,'2025-08-02 05:58:29','2025-08-02 05:58:29',28,523,9),
(32,13,19,NULL,1,2,NULL,NULL,NULL,'2025-08-02 05:58:44','2025-08-02 05:58:44',29,NULL,NULL),
(33,13,19,32,1,4,NULL,NULL,NULL,'2025-08-02 05:58:52','2025-08-02 05:58:52',29,523,10),
(34,14,20,NULL,1,2,NULL,NULL,NULL,'2025-08-02 05:59:40','2025-08-02 05:59:40',30,NULL,NULL),
(35,15,21,NULL,1,2,NULL,NULL,NULL,'2025-08-02 05:59:48','2025-08-02 05:59:49',31,NULL,NULL),
(36,15,21,35,1,4,NULL,NULL,NULL,'2025-08-02 05:59:57','2025-08-02 05:59:57',31,523,11),
(37,16,22,NULL,1,2,NULL,NULL,NULL,'2025-08-02 06:00:28','2025-08-02 06:00:29',32,NULL,NULL),
(38,17,23,NULL,1,2,NULL,NULL,NULL,'2025-08-02 06:00:37','2025-08-02 06:00:37',33,NULL,NULL),
(39,17,23,38,1,4,NULL,NULL,NULL,'2025-08-02 06:00:46','2025-08-02 06:00:46',33,523,12),
(40,17,24,NULL,1,10,NULL,NULL,NULL,'2025-08-02 06:01:17','2025-08-02 06:01:18',3,521,3),
(41,18,25,NULL,1,2,NULL,NULL,NULL,'2025-08-02 06:02:20','2025-08-02 06:02:20',34,NULL,NULL),
(42,19,26,NULL,1,2,NULL,NULL,NULL,'2025-08-02 06:02:39','2025-08-02 06:02:39',35,NULL,NULL),
(43,19,26,42,1,4,NULL,NULL,NULL,'2025-08-02 06:02:49','2025-08-02 06:02:49',35,523,13),
(44,20,27,NULL,1,2,NULL,NULL,NULL,'2025-08-02 06:03:33','2025-08-02 06:03:34',36,NULL,NULL),
(45,20,27,44,1,4,NULL,NULL,NULL,'2025-08-02 06:05:29','2025-08-02 06:05:29',36,523,14);
/*!40000 ALTER TABLE `submission_files` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `submission_search_keyword_list`
--

DROP TABLE IF EXISTS `submission_search_keyword_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `submission_search_keyword_list` (
  `keyword_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `keyword_text` varchar(60) NOT NULL,
  PRIMARY KEY (`keyword_id`),
  UNIQUE KEY `submission_search_keyword_text` (`keyword_text`)
) ENGINE=InnoDB AUTO_INCREMENT=1028 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='A list of all keywords used in the search index';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `submission_search_keyword_list`
--

LOCK TABLES `submission_search_keyword_list` WRITE;
/*!40000 ALTER TABLE `submission_search_keyword_list` DISABLE KEYS */;
INSERT INTO `submission_search_keyword_list` VALUES
(98,'133rd'),
(405,'1980s'),
(713,'21st'),
(834,'abattoir'),
(869,'abnormal'),
(505,'academic'),
(590,'accepted'),
(996,'access'),
(474,'accompanying'),
(762,'achieving'),
(130,'acid'),
(605,'acids'),
(374,'action'),
(961,'actor'),
(954,'actors'),
(999,'adaptive'),
(461,'added'),
(503,'address'),
(109,'adg'),
(545,'adipose'),
(127,'adiposity'),
(264,'administered'),
(438,'administration'),
(994,'administrative'),
(792,'adopted'),
(793,'advocated'),
(859,'affected'),
(172,'affects'),
(831,'african'),
(960,'agree'),
(890,'aid'),
(540,'aim'),
(1,'alan'),
(233,'alberta'),
(84,'allocated'),
(43,'amina'),
(703,'analyses'),
(183,'analysis'),
(569,'analyzed'),
(1008,'analyzing'),
(567,'animals'),
(774,'anthracnose'),
(930,'antibiotics'),
(901,'antimicrobial'),
(639,'antonio'),
(666,'appears'),
(281,'applications'),
(437,'applied'),
(615,'aquifer'),
(161,'archival'),
(146,'areas'),
(296,'argument'),
(977,'arguments'),
(985,'artificial'),
(810,'ash'),
(541,'assess'),
(609,'assessed'),
(661,'assessments'),
(709,'atlantic'),
(163,'attitude'),
(891,'authorities'),
(488,'authority'),
(1001,'automated'),
(429,'availability'),
(78,'average'),
(549,'averaging'),
(563,'backfat'),
(295,'background'),
(765,'baiyewu'),
(67,'barley'),
(719,'barriers'),
(81,'barrows'),
(619,'barton'),
(489,'based'),
(482,'basin'),
(448,'basins'),
(68,'basis'),
(660,'bearings'),
(833,'beef'),
(62,'beet'),
(238,'began'),
(97,'beginning'),
(340,'belief'),
(307,'beliefs'),
(742,'belonging'),
(178,'benchmark'),
(192,'benefit'),
(651,'blanco'),
(198,'brazil'),
(487,'brazos'),
(856,'breeds'),
(1021,'bridge'),
(675,'buda'),
(846,'bulls'),
(1015,'burdens'),
(534,'butyrate'),
(582,'c18'),
(585,'c20'),
(240,'called'),
(829,'cameroon'),
(234,'canada'),
(458,'capabilities'),
(1011,'capacity'),
(858,'carcass'),
(841,'carcasses'),
(608,'carefully'),
(52,'carlo'),
(733,'carried'),
(708,'case'),
(937,'cases'),
(58,'cashmere'),
(861,'category'),
(151,'catherine'),
(827,'cattle'),
(321,'cedural'),
(626,'central'),
(714,'century'),
(664,'cfs'),
(528,'challenges'),
(685,'change'),
(515,'chapter'),
(840,'characteristics'),
(1020,'chatbots'),
(338,'children'),
(197,'china'),
(816,'chips'),
(532,'christopher'),
(137,'chroma'),
(583,'cis'),
(343,'citizens'),
(377,'citizenship'),
(313,'claim'),
(303,'claims'),
(220,'classroom'),
(936,'clinical'),
(570,'close'),
(710,'coast'),
(921,'coli'),
(905,'coliforms'),
(407,'colleagues'),
(565,'collected'),
(641,'collection'),
(963,'collective'),
(959,'collectively'),
(203,'collectivistic'),
(135,'colour'),
(770,'combating'),
(308,'commitments'),
(317,'common'),
(382,'commons'),
(187,'communication'),
(744,'communities'),
(726,'community'),
(157,'comparative'),
(953,'compare'),
(181,'compared'),
(193,'comparisons'),
(322,'competencies'),
(176,'compiled'),
(477,'complete'),
(886,'completely'),
(456,'complex'),
(131,'composition'),
(213,'computer'),
(934,'concentration'),
(637,'concept'),
(142,'concluded'),
(18,'conclusive'),
(883,'condemned'),
(469,'condensed'),
(427,'condensing'),
(621,'conditions'),
(353,'conducted'),
(341,'confident'),
(20,'conflicting'),
(943,'conjugative'),
(694,'connection'),
(613,'connectivity'),
(968,'consensus'),
(126,'consequence'),
(780,'considered'),
(199,'consistent'),
(316,'consists'),
(592,'consortium'),
(159,'construct'),
(483,'contained'),
(406,'contemporary'),
(574,'content'),
(208,'context'),
(700,'continual'),
(344,'continue'),
(38,'continuous'),
(729,'contributing'),
(971,'contributors'),
(88,'control'),
(525,'coordinated'),
(243,'core'),
(53,'corino'),
(33,'corporate'),
(740,'council'),
(175,'countries'),
(755,'country'),
(244,'courses'),
(398,'coward'),
(867,'cows'),
(363,'cps'),
(211,'craig'),
(177,'create'),
(360,'creative'),
(650,'creek'),
(297,'critique'),
(795,'crop'),
(817,'cubes'),
(802,'cultivars'),
(207,'cultural'),
(171,'culture'),
(745,'cultures'),
(593,'cured'),
(1009,'current'),
(237,'curriculum'),
(117,'cuts'),
(73,'dairy'),
(291,'dana'),
(705,'daniel'),
(162,'data'),
(470,'dataset'),
(453,'datasets'),
(99,'day'),
(387,'decades'),
(955,'decide'),
(371,'decision'),
(37,'decisions'),
(300,'deep'),
(736,'defining'),
(128,'degree'),
(737,'delivering'),
(698,'demands'),
(228,'demonstrate'),
(731,'describes'),
(494,'design'),
(706,'designing'),
(800,'destruction'),
(784,'devastating'),
(486,'develop'),
(459,'developed'),
(335,'developing'),
(46,'development'),
(418,'developments'),
(274,'diaga'),
(91,'diet'),
(601,'dietary'),
(76,'diets'),
(598,'differed'),
(931,'difference'),
(105,'differences'),
(328,'difficult'),
(966,'difficulty'),
(75,'diluted'),
(275,'diouf'),
(530,'directions'),
(301,'disagreement'),
(390,'disciplines'),
(684,'discontinuity'),
(280,'discussed'),
(738,'discussions'),
(779,'disease'),
(767,'diseases'),
(654,'dissipated'),
(388,'distinguished'),
(880,'distress'),
(36,'distribution'),
(331,'diverge'),
(717,'diversity'),
(638,'divide'),
(26,'dividend'),
(5,'dividends'),
(333,'domatilia'),
(633,'downstream'),
(648,'drainage'),
(683,'dramatic'),
(892,'draw'),
(1005,'driven'),
(620,'drought'),
(659,'droughts'),
(93,'dry'),
(887,'due'),
(687,'dynamic'),
(139,'economical'),
(24,'economists'),
(584,'ecosenoic'),
(871,'ectoparasites'),
(787,'edible'),
(222,'education'),
(987,'educational'),
(1007,'educators'),
(614,'edwards'),
(210,'effect'),
(189,'effectiveness'),
(60,'effects'),
(336,'efficacy'),
(188,'efficiency'),
(757,'egalitarianism'),
(378,'elinor'),
(716,'embracing'),
(507,'emerging'),
(741,'emphasises'),
(8,'empirical'),
(272,'employed'),
(165,'employees'),
(944,'encoding'),
(870,'encountered'),
(630,'endangered'),
(446,'endeavors'),
(1027,'engagement'),
(282,'engineering'),
(511,'engineers'),
(359,'enhance'),
(464,'enhanced'),
(375,'enhancing'),
(876,'enlarged'),
(914,'enterobacteriacea'),
(496,'environmental'),
(952,'environments'),
(337,'equip'),
(160,'equivalence'),
(920,'escherichia'),
(636,'established'),
(750,'ethnic'),
(751,'ethno'),
(42,'evaluation'),
(9,'evidence'),
(169,'examine'),
(268,'examined'),
(725,'examines'),
(209,'exerts'),
(195,'exhibited'),
(529,'exist'),
(29,'existing'),
(645,'exists'),
(444,'expanding'),
(383,'expe'),
(246,'expected'),
(85,'exper'),
(513,'experiences'),
(101,'experimental'),
(288,'expression'),
(670,'extended'),
(672,'extensive'),
(419,'fabio'),
(153,'facets'),
(182,'factor'),
(185,'factors'),
(916,'faeces'),
(502,'failed'),
(797,'fallowing'),
(119,'fat'),
(872,'fatigue'),
(559,'fats'),
(129,'fatty'),
(110,'fcr'),
(460,'features'),
(72,'fed'),
(102,'feed'),
(1017,'feedback'),
(772,'field'),
(917,'fifteen'),
(547,'fifty'),
(814,'finally'),
(23,'financial'),
(35,'financing'),
(315,'find'),
(201,'findings'),
(976,'finocchiaro'),
(15,'firm'),
(658,'flow'),
(665,'flowing'),
(481,'flows'),
(885,'flukes'),
(431,'focus'),
(298,'fogelin'),
(149,'food'),
(277,'forest'),
(1025,'fostering'),
(811,'found'),
(306,'framework'),
(310,'fruitfully'),
(853,'fulani'),
(39,'function'),
(812,'fungal'),
(13,'future'),
(1022,'gaps'),
(721,'gender'),
(825,'general'),
(287,'genes'),
(276,'genetic'),
(715,'genuinely'),
(82,'gilts'),
(808,'gins'),
(259,'goal'),
(973,'goverance'),
(286,'governing'),
(231,'government'),
(229,'grade'),
(678,'gradient'),
(686,'gradients'),
(1002,'grading'),
(346,'graduation'),
(644,'groundwater'),
(103,'group'),
(87,'groups'),
(463,'growing'),
(107,'growth'),
(852,'gudali'),
(27,'guidance'),
(848,'guinea'),
(120,'ham'),
(319,'hand'),
(421,'hansen'),
(604,'healthy'),
(70,'heavy'),
(849,'high'),
(114,'higher'),
(572,'highest'),
(1010,'highlight'),
(758,'highlights'),
(271,'hired'),
(255,'hiring'),
(83,'homogeneously'),
(909,'hospital'),
(915,'human'),
(691,'hydraulic'),
(643,'hydrogeologic'),
(612,'hydrologic'),
(656,'hydrologically'),
(77,'hypor'),
(517,'identification'),
(919,'identified'),
(86,'imental'),
(632,'immediately'),
(981,'impact'),
(473,'impacts'),
(250,'implement'),
(236,'implementation'),
(958,'implemented'),
(22,'implications'),
(759,'importance'),
(895,'improve'),
(535,'improves'),
(283,'improving'),
(748,'include'),
(485,'included'),
(794,'includes'),
(1026,'inclusivity'),
(697,'increased'),
(602,'increases'),
(595,'index'),
(743,'individual'),
(180,'individually'),
(202,'individuals'),
(801,'infected'),
(813,'infection'),
(908,'infections'),
(54,'influence'),
(667,'influenced'),
(690,'influences'),
(241,'information'),
(342,'informed'),
(242,'infused'),
(111,'ing'),
(693,'inherent'),
(933,'inhibitory'),
(79,'initial'),
(225,'initiatives'),
(467,'input'),
(950,'institutions'),
(358,'instruction'),
(504,'integrates'),
(273,'integrating'),
(218,'integration'),
(417,'intellectual'),
(986,'intelligence'),
(735,'intention'),
(707,'intercultural'),
(730,'interculturality'),
(145,'interest'),
(304,'interlocutors'),
(524,'internships'),
(41,'intuitive'),
(293,'investigating'),
(34,'investment'),
(31,'investors'),
(370,'involve'),
(749,'involvement'),
(516,'involves'),
(588,'iodine'),
(911,'iran'),
(910,'isfahan'),
(553,'isoenergetic'),
(906,'isolated'),
(918,'isolates'),
(19,'issue'),
(837,'january'),
(154,'job'),
(425,'john'),
(252,'jurisdictions'),
(900,'karbasizaed'),
(491,'karim'),
(923,'kelebsiella'),
(347,'key'),
(492,'khafaji'),
(339,'knowledge'),
(611,'kumiega'),
(152,'kwantes'),
(674,'kyle'),
(55,'lactation'),
(873,'lameness'),
(720,'language'),
(455,'large'),
(501,'largely'),
(836,'largest'),
(763,'lasting'),
(596,'layers'),
(373,'leads'),
(116,'lean'),
(350,'learn'),
(1013,'learner'),
(345,'learners'),
(248,'learning'),
(522,'led'),
(531,'leo'),
(875,'lesions'),
(230,'level'),
(587,'levels'),
(509,'leveraged'),
(527,'limitations'),
(1023,'limited'),
(752,'linguistic'),
(586,'linoleic'),
(581,'linolenic'),
(610,'lise'),
(7,'literature'),
(819,'live'),
(884,'liver'),
(806,'locally'),
(391,'long'),
(655,'longer'),
(843,'longissimus'),
(399,'los'),
(121,'losses'),
(677,'low'),
(118,'lower'),
(578,'lowest'),
(889,'lungs'),
(877,'lymph'),
(401,'mackenzie'),
(807,'made'),
(556,'maize'),
(221,'major'),
(372,'making'),
(394,'managed'),
(28,'management'),
(235,'mandated'),
(44,'mansour'),
(838,'march'),
(617,'marcos'),
(124,'marked'),
(862,'markedly'),
(786,'marketable'),
(551,'matched'),
(799,'material'),
(94,'matter'),
(855,'mbororo'),
(365,'means'),
(864,'meat'),
(285,'mechanisms'),
(258,'meet'),
(771,'menace'),
(712,'met'),
(902,'metal'),
(938,'metals'),
(468,'methodology'),
(935,'mic'),
(404,'mid'),
(756,'militate'),
(932,'minimal'),
(395,'mismanaged'),
(324,'mistakenly'),
(327,'mitments'),
(484,'model'),
(434,'modeling'),
(430,'models'),
(123,'moderate'),
(983,'modern'),
(490,'modifying'),
(701,'monitoring'),
(579,'monounsaturated'),
(212,'montgomerie'),
(820,'months'),
(777,'mosaic'),
(366,'motivate'),
(376,'motivation'),
(580,'mufa'),
(949,'multi'),
(946,'multidrug'),
(724,'multiethnic'),
(997,'multifaceted'),
(723,'multilingual'),
(167,'multinational'),
(929,'multiple'),
(2,'mwandenga'),
(156,'nation'),
(170,'national'),
(179,'nations'),
(1003,'natural'),
(173,'nature'),
(454,'necessarily'),
(699,'necessitates'),
(951,'networked'),
(270,'newly'),
(711,'nicaragua'),
(49,'nicolas'),
(768,'nigeria'),
(1004,'nlp'),
(878,'nodes'),
(881,'nodular'),
(653,'normal'),
(682,'north'),
(907,'nosocomial'),
(426,'novak'),
(663,'numerical'),
(349,'nurturing'),
(824,'nutrition'),
(606,'nutritional'),
(106,'observed'),
(17,'offer'),
(991,'offering'),
(557,'oil'),
(649,'onion'),
(984,'opportunities'),
(309,'order'),
(168,'organization'),
(186,'organizational'),
(520,'organizations'),
(882,'organs'),
(847,'origin'),
(476,'original'),
(379,'ostrom'),
(718,'overcome'),
(420,'paglieri'),
(260,'paper'),
(108,'parameters'),
(591,'parma'),
(325,'part'),
(143,'partially'),
(351,'participate'),
(732,'participatory'),
(519,'partner'),
(386,'past'),
(704,'patricia'),
(942,'pattern'),
(912,'patterns'),
(65,'pbps'),
(989,'pedagogical'),
(760,'pedagogy'),
(330,'people'),
(926,'percent'),
(115,'percentages'),
(536,'performance'),
(96,'period'),
(671,'periods'),
(440,'permit'),
(451,'permits'),
(191,'personal'),
(993,'personalized'),
(940,'persons'),
(969,'perverse'),
(292,'phillips'),
(144,'pig'),
(538,'piglets'),
(71,'pigs'),
(422,'pinto'),
(397,'places'),
(628,'plan'),
(443,'planning'),
(798,'planting'),
(290,'plants'),
(904,'plasmid'),
(1000,'platforms'),
(924,'pneumoniae'),
(140,'point'),
(21,'policy'),
(576,'polyunsaturated'),
(414,'pool'),
(696,'population'),
(788,'portions'),
(368,'positive'),
(928,'possess'),
(30,'potential'),
(679,'potentiometric'),
(753,'power'),
(25,'practical'),
(217,'practice'),
(990,'practices'),
(839,'pre'),
(857,'predominant'),
(868,'pregnant'),
(512,'present'),
(355,'presented'),
(769,'presents'),
(61,'pressed'),
(896,'prevent'),
(200,'previous'),
(623,'primary'),
(498,'principles'),
(320,'pro'),
(125,'prob'),
(361,'problem'),
(965,'problematic'),
(326,'procedural'),
(815,'processing'),
(59,'production'),
(314,'productive'),
(147,'products'),
(45,'professional'),
(544,'profile'),
(913,'profiles'),
(642,'program'),
(893,'programmes'),
(279,'progress'),
(523,'project'),
(518,'projects'),
(897,'promote'),
(761,'promoting'),
(692,'properties'),
(416,'property'),
(603,'proportion'),
(14,'prospects'),
(629,'protect'),
(457,'provide'),
(232,'province'),
(224,'provincial'),
(265,'public'),
(577,'pufa'),
(63,'pulp'),
(673,'pumping'),
(970,'punishing'),
(311,'pursue'),
(57,'quality'),
(56,'quantity'),
(634,'questions'),
(635,'raised'),
(764,'rana'),
(550,'randomized'),
(558,'rapeseed'),
(695,'rapid'),
(267,'rate'),
(92,'ratio'),
(967,'reaching'),
(148,'readily'),
(1016,'real'),
(860,'rearing'),
(423,'reason'),
(136,'receiving'),
(16,'recent'),
(668,'recharge'),
(424,'reclaimed'),
(842,'recorded'),
(945,'recovered'),
(854,'red'),
(1014,'reduce'),
(785,'reduction'),
(790,'reductions'),
(571,'reflected'),
(450,'reflects'),
(312,'refute'),
(133,'regard'),
(775,'regarded'),
(411,'region'),
(441,'regional'),
(412,'regions'),
(754,'relations'),
(941,'relationship'),
(40,'rely'),
(922,'remaining'),
(475,'removed'),
(95,'replaced'),
(66,'replacing'),
(204,'report'),
(845,'represent'),
(830,'representative'),
(480,'represents'),
(269,'require'),
(249,'required'),
(215,'requirements'),
(205,'research'),
(403,'researchers'),
(472,'reservoir'),
(452,'reservoirs'),
(988,'reshaping'),
(903,'resistance'),
(803,'resistant'),
(415,'resource'),
(393,'resources'),
(247,'respect'),
(879,'respiratory'),
(266,'response'),
(174,'responses'),
(589,'result'),
(262,'results'),
(184,'revealed'),
(6,'review'),
(400,'reyes'),
(384,'rienced'),
(439,'rights'),
(50,'riouf'),
(447,'river'),
(302,'robert'),
(348,'role'),
(822,'rosanna'),
(823,'rossi'),
(783,'rot'),
(796,'rotation'),
(436,'routinely'),
(972,'ruled'),
(832,'safety'),
(564,'samples'),
(616,'san'),
(956,'sanction'),
(962,'sanctioned'),
(964,'sanctioning'),
(957,'sanctions'),
(155,'satisfaction'),
(196,'satisfied'),
(573,'saturated'),
(850,'savannah'),
(995,'scalable'),
(389,'scholars'),
(251,'school'),
(122,'seasoning'),
(409,'sec'),
(150,'security'),
(640,'segments'),
(471,'selected'),
(134,'semimembranosus'),
(657,'separated'),
(239,'september'),
(622,'serves'),
(495,'service'),
(478,'set'),
(506,'setting'),
(1024,'settings'),
(925,'seventy'),
(781,'severe'),
(575,'sfa'),
(305,'share'),
(294,'shared'),
(32,'shareholding'),
(818,'shelf'),
(600,'show'),
(112,'showed'),
(356,'showing'),
(367,'shown'),
(676,'shows'),
(12,'signal'),
(10,'signaling'),
(3,'signalling'),
(104,'significant'),
(113,'significantly'),
(64,'silage'),
(865,'similar'),
(465,'simplifying'),
(466,'simulation'),
(662,'simulations'),
(166,'single'),
(826,'situation'),
(214,'skill'),
(226,'skills'),
(874,'skin'),
(562,'slaughter'),
(828,'slaughtered'),
(561,'slaughtering'),
(681,'slopes'),
(47,'social'),
(352,'society'),
(533,'sodium'),
(334,'sokoloff'),
(362,'solving'),
(627,'source'),
(625,'south'),
(631,'species'),
(392,'specific'),
(245,'specifies'),
(776,'spread'),
(618,'springs'),
(734,'staff'),
(256,'standards'),
(514,'stanford'),
(449,'state'),
(442,'statewide'),
(773,'storage'),
(791,'stored'),
(927,'strains'),
(254,'strategies'),
(357,'strategy'),
(479,'streamflows'),
(894,'strengthen'),
(689,'structural'),
(194,'structures'),
(521,'student'),
(227,'students'),
(69,'studied'),
(354,'studies'),
(158,'study'),
(597,'subcutaneous'),
(385,'substantial'),
(526,'successful'),
(206,'suggest'),
(11,'suggests'),
(261,'summarizes'),
(560,'supplement'),
(543,'supplementation'),
(554,'supplemented'),
(624,'supply'),
(190,'support'),
(323,'supporters'),
(747,'supporting'),
(647,'surface'),
(164,'survey'),
(497,'sustainability'),
(493,'sustainable'),
(90,'sweet'),
(435,'system'),
(432,'systems'),
(1012,'tailor'),
(722,'takes'),
(555,'tallow'),
(364,'taught'),
(510,'teach'),
(216,'teachers'),
(607,'technological'),
(998,'technologies'),
(219,'technology'),
(804,'tecto'),
(263,'telephone'),
(566,'ten'),
(542,'term'),
(433,'texas'),
(4,'theory'),
(299,'thesis'),
(805,'thiabendazole'),
(844,'thoracis'),
(746,'time'),
(396,'times'),
(546,'tissue'),
(223,'today'),
(939,'tolerant'),
(508,'tool'),
(982,'tools'),
(318,'topic'),
(500,'topics'),
(410,'tors'),
(866,'toughest'),
(898,'trade'),
(89,'traditional'),
(380,'traditions'),
(48,'transformation'),
(980,'transformative'),
(851,'transhumance'),
(568,'treatment'),
(599,'treatments'),
(278,'trees'),
(702,'trend'),
(381,'trends'),
(100,'trial'),
(888,'tuberculosis'),
(789,'tubers'),
(253,'turning'),
(1006,'tutoring'),
(1019,'tutors'),
(462,'types'),
(132,'unaffected'),
(284,'understanding'),
(727,'university'),
(688,'unknown'),
(992,'unprecedented'),
(594,'unsaturation'),
(257,'upgrade'),
(329,'uphold'),
(728,'uraccan'),
(899,'vajiheh'),
(947,'valerie'),
(369,'valuable'),
(138,'values'),
(680,'variation'),
(863,'varied'),
(445,'variety'),
(51,'version'),
(646,'vicinity'),
(141,'view'),
(1018,'virtual'),
(778,'virus'),
(499,'vital'),
(669,'vulnerable'),
(739,'wales'),
(428,'water'),
(537,'weaned'),
(539,'weaning'),
(80,'weight'),
(552,'weights'),
(652,'wet'),
(74,'whey'),
(548,'white'),
(332,'widely'),
(948,'williamson'),
(402,'wittfogel'),
(809,'wood'),
(975,'woods'),
(289,'woody'),
(408,'work'),
(413,'world'),
(766,'yam'),
(782,'yams'),
(835,'yaoundé'),
(821,'year'),
(978,'zayan'),
(979,'zedd'),
(974,'zita');
/*!40000 ALTER TABLE `submission_search_keyword_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `submission_search_object_keywords`
--

DROP TABLE IF EXISTS `submission_search_object_keywords`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
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
) ENGINE=InnoDB AUTO_INCREMENT=3595 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='Relationships between search objects and keywords in the search index';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `submission_search_object_keywords`
--

LOCK TABLES `submission_search_object_keywords` WRITE;
/*!40000 ALTER TABLE `submission_search_object_keywords` DISABLE KEYS */;
INSERT INTO `submission_search_object_keywords` VALUES
(759,9,1,0),
(760,9,2,1),
(761,9,43,2),
(762,9,44,3),
(763,9,49,4),
(764,9,50,5),
(765,10,3,0),
(766,10,4,1),
(767,10,5,2),
(768,10,6,3),
(769,10,7,4),
(770,10,8,5),
(771,10,9,6),
(772,11,10,0),
(773,11,4,1),
(774,11,11,2),
(775,11,5,3),
(776,11,12,4),
(777,11,13,5),
(778,11,14,6),
(779,11,15,7),
(780,11,16,8),
(781,11,8,9),
(782,11,9,10),
(783,11,17,11),
(784,11,18,12),
(785,11,9,13),
(786,11,19,14),
(787,11,20,15),
(788,11,21,16),
(789,11,22,17),
(790,11,23,18),
(791,11,24,19),
(792,11,25,20),
(793,11,26,21),
(794,11,21,22),
(795,11,27,23),
(796,11,28,24),
(797,11,29,25),
(798,11,30,26),
(799,11,31,27),
(800,11,32,28),
(801,11,33,29),
(802,11,34,30),
(803,11,35,31),
(804,11,36,32),
(805,11,37,33),
(806,11,38,34),
(807,11,39,35),
(808,11,28,36),
(809,11,26,37),
(810,11,37,38),
(811,11,40,39),
(812,11,41,40),
(813,11,42,41),
(814,13,45,0),
(815,13,46,1),
(816,13,47,2),
(817,13,48,3),
(962,17,52,0),
(963,17,53,1),
(964,18,54,0),
(965,18,55,1),
(966,18,56,2),
(967,18,57,3),
(968,18,58,4),
(969,18,59,5),
(970,19,60,0),
(971,19,61,1),
(972,19,62,2),
(973,19,63,3),
(974,19,64,4),
(975,19,65,5),
(976,19,66,6),
(977,19,67,7),
(978,19,68,8),
(979,19,69,9),
(980,19,70,10),
(981,19,71,11),
(982,19,72,12),
(983,19,73,13),
(984,19,74,14),
(985,19,75,15),
(986,19,76,16),
(987,19,77,17),
(988,19,71,18),
(989,19,78,19),
(990,19,79,20),
(991,19,80,21),
(992,19,81,22),
(993,19,82,23),
(994,19,83,24),
(995,19,84,25),
(996,19,85,26),
(997,19,86,27),
(998,19,87,28),
(999,19,88,29),
(1000,19,71,30),
(1001,19,72,31),
(1002,19,89,32),
(1003,19,90,33),
(1004,19,74,34),
(1005,19,75,35),
(1006,19,91,36),
(1007,19,92,37),
(1008,19,74,38),
(1009,19,93,39),
(1010,19,94,40),
(1011,19,65,41),
(1012,19,95,42),
(1013,19,67,43),
(1014,19,68,44),
(1015,19,96,45),
(1016,19,97,46),
(1017,19,98,47),
(1018,19,99,48),
(1019,19,100,49),
(1020,19,68,50),
(1021,19,65,51),
(1022,19,95,52),
(1023,19,67,53),
(1024,19,68,54),
(1025,19,101,55),
(1026,19,96,56),
(1027,19,76,57),
(1028,19,102,58),
(1029,19,73,59),
(1030,19,74,60),
(1031,19,75,61),
(1032,19,103,62),
(1033,19,104,63),
(1034,19,105,64),
(1035,19,106,65),
(1036,19,107,66),
(1037,19,108,67),
(1038,19,109,68),
(1039,19,110,69),
(1040,19,71,70),
(1041,19,76,71),
(1042,19,111,72),
(1043,19,65,73),
(1044,19,112,74),
(1045,19,113,75),
(1046,19,114,76),
(1047,19,115,77),
(1048,19,116,78),
(1049,19,117,79),
(1050,19,118,80),
(1051,19,115,81),
(1052,19,119,82),
(1053,19,117,83),
(1054,19,120,84),
(1055,19,80,85),
(1056,19,121,86),
(1057,19,122,87),
(1058,19,123,88),
(1059,19,113,89),
(1060,19,124,90),
(1061,19,65,91),
(1062,19,72,92),
(1063,19,71,93),
(1064,19,125,94),
(1065,19,126,95),
(1066,19,118,96),
(1067,19,127,97),
(1068,19,128,98),
(1069,19,129,99),
(1070,19,130,100),
(1071,19,131,101),
(1072,19,120,102),
(1073,19,119,103),
(1074,19,132,104),
(1075,19,76,105),
(1076,19,133,106),
(1077,19,134,107),
(1078,19,135,108),
(1079,19,71,109),
(1080,19,136,110),
(1081,19,65,111),
(1082,19,112,112),
(1083,19,118,113),
(1084,19,137,114),
(1085,19,138,115),
(1086,19,139,116),
(1087,19,140,117),
(1088,19,141,118),
(1089,19,142,119),
(1090,19,65,120),
(1091,19,143,121),
(1092,19,66,122),
(1093,19,67,123),
(1094,19,73,124),
(1095,19,74,125),
(1096,19,70,126),
(1097,19,144,127),
(1098,19,59,128),
(1099,19,145,129),
(1100,19,146,130),
(1101,19,147,131),
(1102,19,148,132),
(1103,21,71,0),
(1104,21,149,1),
(1105,21,150,2),
(1106,21,45,3),
(1107,21,46,4),
(1108,21,47,5),
(1109,21,48,6),
(1110,25,151,0),
(1111,25,152,1),
(1112,26,153,0),
(1113,26,154,1),
(1114,26,155,2),
(1115,26,156,3),
(1116,26,157,4),
(1117,26,158,5),
(1118,26,159,6),
(1119,26,160,7),
(1120,27,161,0),
(1121,27,162,1),
(1122,27,163,2),
(1123,27,164,3),
(1124,27,165,4),
(1125,27,166,5),
(1126,27,167,6),
(1127,27,168,7),
(1128,27,169,8),
(1129,27,128,9),
(1130,27,170,10),
(1131,27,171,11),
(1132,27,172,12),
(1133,27,173,13),
(1134,27,154,14),
(1135,27,155,15),
(1136,27,174,16),
(1137,27,175,17),
(1138,27,176,18),
(1139,27,177,19),
(1140,27,178,20),
(1141,27,179,21),
(1142,27,180,22),
(1143,27,181,23),
(1144,27,182,24),
(1145,27,183,25),
(1146,27,184,26),
(1147,27,185,27),
(1148,27,186,28),
(1149,27,187,29),
(1150,27,186,30),
(1151,27,188,31),
(1152,27,189,32),
(1153,27,186,33),
(1154,27,190,34),
(1155,27,191,35),
(1156,27,192,36),
(1157,27,193,37),
(1158,27,182,38),
(1159,27,194,39),
(1160,27,186,40),
(1161,27,187,41),
(1162,27,195,42),
(1163,27,159,43),
(1164,27,160,44),
(1165,27,191,45),
(1166,27,192,46),
(1167,27,196,47),
(1168,27,165,48),
(1169,27,197,49),
(1170,27,196,50),
(1171,27,198,51),
(1172,27,199,52),
(1173,27,200,53),
(1174,27,201,54),
(1175,27,202,55),
(1176,27,203,56),
(1177,27,179,57),
(1178,27,204,58),
(1179,27,114,59),
(1180,27,155,60),
(1181,27,205,61),
(1182,27,201,62),
(1183,27,206,63),
(1184,27,170,64),
(1185,27,207,65),
(1186,27,208,66),
(1187,27,209,67),
(1188,27,210,68),
(1189,27,173,69),
(1190,27,154,70),
(1191,27,155,71),
(1192,29,165,0),
(1193,29,164,1),
(1194,33,211,0),
(1195,33,212,1),
(1196,34,213,0),
(1197,34,214,1),
(1198,34,215,2),
(1199,34,29,3),
(1200,34,216,4),
(1201,34,22,5),
(1202,34,21,6),
(1203,34,217,7),
(1204,35,218,0),
(1205,35,219,1),
(1206,35,220,2),
(1207,35,221,3),
(1208,35,19,4),
(1209,35,222,5),
(1210,35,223,6),
(1211,35,170,7),
(1212,35,224,8),
(1213,35,225,9),
(1214,35,219,10),
(1215,35,226,11),
(1216,35,227,12),
(1217,35,228,13),
(1218,35,229,14),
(1219,35,230,15),
(1220,35,231,16),
(1221,35,232,17),
(1222,35,233,18),
(1223,35,234,19),
(1224,35,235,20),
(1225,35,236,21),
(1226,35,237,22),
(1227,35,238,23),
(1228,35,239,24),
(1229,35,240,25),
(1230,35,241,26),
(1231,35,187,27),
(1232,35,219,28),
(1233,35,237,29),
(1234,35,242,30),
(1235,35,243,31),
(1236,35,244,32),
(1237,35,245,33),
(1238,35,227,34),
(1239,35,246,35),
(1240,35,247,36),
(1241,35,219,37),
(1242,35,233,38),
(1243,35,248,39),
(1244,35,216,40),
(1245,35,249,41),
(1246,35,250,42),
(1247,35,237,43),
(1248,35,251,44),
(1249,35,252,45),
(1250,35,253,46),
(1251,35,45,47),
(1252,35,46,48),
(1253,35,254,49),
(1254,35,255,50),
(1255,35,256,51),
(1256,35,257,52),
(1257,35,216,53),
(1258,35,213,54),
(1259,35,226,55),
(1260,35,258,56),
(1261,35,259,57),
(1262,35,260,58),
(1263,35,261,59),
(1264,35,262,60),
(1265,35,263,61),
(1266,35,164,62),
(1267,35,264,63),
(1268,35,265,64),
(1269,35,251,65),
(1270,35,252,66),
(1271,35,232,67),
(1272,35,233,68),
(1273,35,266,69),
(1274,35,267,70),
(1275,35,268,71),
(1276,35,213,72),
(1277,35,226,73),
(1278,35,251,74),
(1279,35,252,75),
(1280,35,269,76),
(1281,35,270,77),
(1282,35,271,78),
(1283,35,216,79),
(1284,35,190,80),
(1285,35,254,81),
(1286,35,272,82),
(1287,35,272,83),
(1288,35,216,84),
(1289,37,273,0),
(1290,37,219,1),
(1291,37,213,2),
(1292,37,226,3),
(1293,37,164,4),
(1294,37,233,5),
(1295,37,170,6),
(1296,37,224,7),
(1297,37,45,8),
(1298,37,46,9),
(1299,41,274,0),
(1300,41,275,1),
(1301,42,276,0),
(1302,42,48,1),
(1303,42,277,2),
(1304,42,278,3),
(1305,43,6,0),
(1306,43,16,1),
(1307,43,279,2),
(1308,43,276,3),
(1309,43,48,4),
(1310,43,277,5),
(1311,43,278,6),
(1312,43,280,7),
(1313,43,281,8),
(1314,43,276,9),
(1315,43,282,10),
(1316,43,283,11),
(1317,43,277,12),
(1318,43,278,13),
(1319,43,284,14),
(1320,43,285,15),
(1321,43,286,16),
(1322,43,287,17),
(1323,43,288,18),
(1324,43,289,19),
(1325,43,290,20),
(1326,49,291,0),
(1327,49,292,1),
(1328,50,293,0),
(1329,50,294,1),
(1330,50,295,2),
(1331,50,249,3),
(1332,50,296,4),
(1333,50,297,5),
(1334,50,298,6),
(1335,50,299,7),
(1336,50,300,8),
(1337,50,301,9),
(1338,51,302,0),
(1339,51,298,1),
(1340,51,303,2),
(1341,51,304,3),
(1342,51,305,4),
(1343,51,306,5),
(1344,51,295,6),
(1345,51,307,7),
(1346,51,308,8),
(1347,51,309,9),
(1348,51,310,10),
(1349,51,311,11),
(1350,51,296,12),
(1351,51,312,13),
(1352,51,298,14),
(1353,51,313,15),
(1354,51,293,16),
(1355,51,294,17),
(1356,51,295,18),
(1357,51,249,19),
(1358,51,314,20),
(1359,51,296,21),
(1360,51,315,22),
(1361,51,295,23),
(1362,51,316,24),
(1363,51,317,25),
(1364,51,307,26),
(1365,51,318,27),
(1366,51,319,28),
(1367,51,294,29),
(1368,51,320,30),
(1369,51,321,31),
(1370,51,308,32),
(1371,51,322,33),
(1372,51,206,34),
(1373,51,298,35),
(1374,51,323,36),
(1375,51,324,37),
(1376,51,141,38),
(1377,51,294,39),
(1378,51,307,40),
(1379,51,325,41),
(1380,51,249,42),
(1381,51,295,43),
(1382,51,314,44),
(1383,51,296,45),
(1384,51,326,46),
(1385,51,327,47),
(1386,51,328,48),
(1387,51,329,49),
(1388,51,330,50),
(1389,51,307,51),
(1390,51,331,52),
(1391,51,332,53),
(1392,51,318,54),
(1393,51,319,55),
(1394,57,333,0),
(1395,57,334,1),
(1396,58,335,0),
(1397,58,336,1),
(1398,58,307,2),
(1399,58,220,3),
(1400,59,221,0),
(1401,59,259,1),
(1402,59,222,2),
(1403,59,337,3),
(1404,59,338,4),
(1405,59,339,5),
(1406,59,226,6),
(1407,59,340,7),
(1408,59,341,8),
(1409,59,342,9),
(1410,59,343,10),
(1411,59,343,11),
(1412,59,344,12),
(1413,59,345,13),
(1414,59,346,14),
(1415,59,260,15),
(1416,59,347,16),
(1417,59,348,17),
(1418,59,349,18),
(1419,59,336,19),
(1420,59,307,20),
(1421,59,309,21),
(1422,59,350,22),
(1423,59,351,23),
(1424,59,251,24),
(1425,59,352,25),
(1426,59,205,26),
(1427,59,201,27),
(1428,59,353,28),
(1429,59,47,29),
(1430,59,354,30),
(1431,59,208,31),
(1432,59,355,32),
(1433,59,356,33),
(1434,59,357,34),
(1435,59,358,35),
(1436,59,359,36),
(1437,59,336,37),
(1438,59,248,38),
(1439,59,325,39),
(1440,59,205,40),
(1441,59,360,41),
(1442,59,361,42),
(1443,59,362,43),
(1444,59,363,44),
(1445,59,364,45),
(1446,59,338,46),
(1447,59,365,47),
(1448,59,366,48),
(1449,59,190,49),
(1450,59,248,50),
(1451,59,367,51),
(1452,59,363,52),
(1453,59,368,53),
(1454,59,60,54),
(1455,59,336,55),
(1456,59,248,56),
(1457,59,369,57),
(1458,59,306,58),
(1459,59,370,59),
(1460,59,338,60),
(1461,59,371,61),
(1462,59,372,62),
(1463,59,373,63),
(1464,59,47,64),
(1465,59,374,65),
(1466,59,22,66),
(1467,59,375,67),
(1468,59,336,68),
(1469,59,376,69),
(1470,59,350,70),
(1471,59,220,71),
(1472,59,280,72),
(1473,61,222,0),
(1474,61,377,1),
(1475,65,378,0),
(1476,65,379,1),
(1477,66,380,0),
(1478,66,381,1),
(1479,66,158,2),
(1480,66,382,3),
(1481,67,158,0),
(1482,67,382,1),
(1483,67,383,2),
(1484,67,384,3),
(1485,67,385,4),
(1486,67,107,5),
(1487,67,46,6),
(1488,67,386,7),
(1489,67,387,8),
(1490,67,388,9),
(1491,67,389,10),
(1492,67,390,11),
(1493,67,391,12),
(1494,67,69,13),
(1495,67,392,14),
(1496,67,393,15),
(1497,67,394,16),
(1498,67,395,17),
(1499,67,396,18),
(1500,67,397,19),
(1501,67,398,20),
(1502,67,399,21),
(1503,67,400,22),
(1504,67,401,23),
(1505,67,402,24),
(1506,67,403,25),
(1507,67,69,26),
(1508,67,392,27),
(1509,67,382,28),
(1510,67,404,29),
(1511,67,405,30),
(1512,67,406,31),
(1513,67,407,32),
(1514,67,342,33),
(1515,67,408,34),
(1516,67,389,35),
(1517,67,390,36),
(1518,67,409,37),
(1519,67,410,38),
(1520,67,411,39),
(1521,67,145,40),
(1522,67,412,41),
(1523,67,413,42),
(1524,69,317,0),
(1525,69,414,1),
(1526,69,415,2),
(1527,69,317,3),
(1528,69,416,4),
(1529,69,417,5),
(1530,69,418,6),
(1531,73,419,0),
(1532,73,420,1),
(1533,74,421,0),
(1534,74,422,1),
(1535,74,423,2),
(1536,74,424,3),
(1537,81,425,0),
(1538,81,426,1),
(1539,82,427,0),
(1540,82,428,1),
(1541,82,429,2),
(1542,82,430,3),
(1543,82,431,4),
(1544,82,392,5),
(1545,82,428,6),
(1546,82,28,7),
(1547,82,432,8),
(1548,83,433,0),
(1549,83,428,1),
(1550,83,429,2),
(1551,83,434,3),
(1552,83,435,4),
(1553,83,436,5),
(1554,83,437,6),
(1555,83,438,7),
(1556,83,428,8),
(1557,83,439,9),
(1558,83,440,10),
(1559,83,435,11),
(1560,83,441,12),
(1561,83,442,13),
(1562,83,443,14),
(1563,83,444,15),
(1564,83,445,16),
(1565,83,446,17),
(1566,83,434,18),
(1567,83,428,19),
(1568,83,28,20),
(1569,83,447,21),
(1570,83,448,22),
(1571,83,449,23),
(1572,83,450,24),
(1573,83,428,25),
(1574,83,451,26),
(1575,83,452,27),
(1576,83,453,28),
(1577,83,454,29),
(1578,83,455,30),
(1579,83,456,31),
(1580,83,457,32),
(1581,83,371,33),
(1582,83,190,34),
(1583,83,458,35),
(1584,83,434,36),
(1585,83,435,37),
(1586,83,459,38),
(1587,83,434,39),
(1588,83,460,40),
(1589,83,461,41),
(1590,83,462,42),
(1591,83,281,43),
(1592,83,463,44),
(1593,83,281,45),
(1594,83,464,46),
(1595,83,465,47),
(1596,83,466,48),
(1597,83,467,49),
(1598,83,453,50),
(1599,83,431,51),
(1600,83,428,52),
(1601,83,28,53),
(1602,83,432,54),
(1603,83,468,55),
(1604,83,355,56),
(1605,83,335,57),
(1606,83,469,58),
(1607,83,470,59),
(1608,83,471,60),
(1609,83,472,61),
(1610,83,435,62),
(1611,83,450,63),
(1612,83,473,64),
(1613,83,428,65),
(1614,83,439,66),
(1615,83,474,67),
(1616,83,452,68),
(1617,83,475,69),
(1618,83,476,70),
(1619,83,477,71),
(1620,83,470,72),
(1621,83,478,73),
(1622,83,479,74),
(1623,83,459,75),
(1624,83,480,76),
(1625,83,481,77),
(1626,83,471,78),
(1627,83,435,79),
(1628,83,60,80),
(1629,83,428,81),
(1630,83,439,82),
(1631,83,447,83),
(1632,83,482,84),
(1633,83,483,85),
(1634,83,476,86),
(1635,83,477,87),
(1636,83,484,88),
(1637,83,467,89),
(1638,83,470,90),
(1639,83,485,91),
(1640,83,469,92),
(1641,83,470,93),
(1642,83,468,94),
(1643,83,437,95),
(1644,83,486,96),
(1645,83,469,97),
(1646,83,484,98),
(1647,83,487,99),
(1648,83,447,100),
(1649,83,488,101),
(1650,83,472,102),
(1651,83,435,103),
(1652,83,489,104),
(1653,83,490,105),
(1654,83,433,106),
(1655,83,428,107),
(1656,83,429,108),
(1657,83,434,109),
(1658,83,435,110),
(1659,83,470,111),
(1660,83,487,112),
(1661,83,447,113),
(1662,83,482,114),
(1663,85,428,0),
(1664,89,491,0),
(1665,89,492,1),
(1666,90,248,0),
(1667,90,493,1),
(1668,90,494,2),
(1669,90,495,3),
(1670,91,496,0),
(1671,91,497,1),
(1672,91,493,2),
(1673,91,46,3),
(1674,91,498,4),
(1675,91,499,5),
(1676,91,500,6),
(1677,91,282,7),
(1678,91,222,8),
(1679,91,501,9),
(1680,91,502,10),
(1681,91,503,11),
(1682,91,495,12),
(1683,91,248,13),
(1684,91,504,14),
(1685,91,47,15),
(1686,91,495,16),
(1687,91,505,17),
(1688,91,506,18),
(1689,91,507,19),
(1690,91,508,20),
(1691,91,509,21),
(1692,91,510,22),
(1693,91,493,23),
(1694,91,494,24),
(1695,91,13,25),
(1696,91,511,26),
(1697,91,512,27),
(1698,91,484,28),
(1699,91,495,29),
(1700,91,248,30),
(1701,91,510,31),
(1702,91,493,32),
(1703,91,494,33),
(1704,91,489,34),
(1705,91,513,35),
(1706,91,514,36),
(1707,91,515,37),
(1708,91,511,38),
(1709,91,493,39),
(1710,91,413,40),
(1711,91,484,41),
(1712,91,516,42),
(1713,91,517,43),
(1714,91,518,44),
(1715,91,519,45),
(1716,91,520,46),
(1717,91,521,47),
(1718,91,522,48),
(1719,91,523,49),
(1720,91,489,50),
(1721,91,494,51),
(1722,91,524,52),
(1723,91,525,53),
(1724,91,519,54),
(1725,91,520,55),
(1726,91,484,56),
(1727,91,526,57),
(1728,91,527,58),
(1729,91,528,59),
(1730,91,529,60),
(1731,91,280,61),
(1732,91,13,62),
(1733,91,530,63),
(1734,91,444,64),
(1735,91,484,65),
(1736,93,46,0),
(1737,93,282,1),
(1738,93,222,2),
(1739,93,495,3),
(1740,93,248,4),
(1741,93,497,5),
(1742,97,531,0),
(1743,97,532,1),
(1744,98,533,0),
(1745,98,534,1),
(1746,98,535,2),
(1747,98,107,3),
(1748,98,536,4),
(1749,98,537,5),
(1750,98,538,6),
(1751,98,96,7),
(1752,98,539,8),
(1753,99,540,0),
(1754,99,158,1),
(1755,99,541,2),
(1756,99,54,3),
(1757,99,391,4),
(1758,99,542,5),
(1759,99,119,6),
(1760,99,543,7),
(1761,99,129,8),
(1762,99,130,9),
(1763,99,544,10),
(1764,99,70,11),
(1765,99,144,12),
(1766,99,545,13),
(1767,99,546,14),
(1768,99,547,15),
(1769,99,455,16),
(1770,99,548,17),
(1771,99,81,18),
(1772,99,549,19),
(1773,99,550,20),
(1774,99,551,21),
(1775,99,552,22),
(1776,99,553,23),
(1777,99,76,24),
(1778,99,554,25),
(1779,99,555,26),
(1780,99,556,27),
(1781,99,557,28),
(1782,99,558,29),
(1783,99,557,30),
(1784,99,559,31),
(1785,99,560,32),
(1786,99,72,33),
(1787,99,561,34),
(1788,99,562,35),
(1789,99,563,36),
(1790,99,564,37),
(1791,99,565,38),
(1792,99,566,39),
(1793,99,567,40),
(1794,99,568,41),
(1795,99,569,42),
(1796,99,129,43),
(1797,99,130,44),
(1798,99,131,45),
(1799,99,563,46),
(1800,99,570,47),
(1801,99,571,48),
(1802,99,129,49),
(1803,99,130,50),
(1804,99,131,51),
(1805,99,554,52),
(1806,99,559,53),
(1807,99,563,54),
(1808,99,71,55),
(1809,99,72,56),
(1810,99,572,57),
(1811,99,573,58),
(1812,99,129,59),
(1813,99,130,60),
(1814,99,574,61),
(1815,99,575,62),
(1816,99,72,63),
(1817,99,572,64),
(1818,99,574,65),
(1819,99,576,66),
(1820,99,129,67),
(1821,99,130,68),
(1822,99,577,69),
(1823,99,578,70),
(1824,99,579,71),
(1825,99,129,72),
(1826,99,130,73),
(1827,99,580,74),
(1828,99,574,75),
(1829,99,72,76),
(1830,99,572,77),
(1831,99,574,78),
(1832,99,581,79),
(1833,99,130,80),
(1834,99,582,81),
(1835,99,583,82),
(1836,99,584,83),
(1837,99,130,84),
(1838,99,585,85),
(1839,99,568,86),
(1840,99,210,87),
(1841,99,586,88),
(1842,99,130,89),
(1843,99,587,90),
(1844,99,588,91),
(1845,99,563,92),
(1846,99,589,93),
(1847,99,111,94),
(1848,99,587,95),
(1849,99,114,96),
(1850,99,582,97),
(1851,99,590,98),
(1852,99,591,99),
(1853,99,592,100),
(1854,99,93,101),
(1855,99,593,102),
(1856,99,120,103),
(1857,99,594,104),
(1858,99,595,105),
(1859,99,596,106),
(1860,99,597,107),
(1861,99,563,108),
(1862,99,546,109),
(1863,99,598,110),
(1864,99,113,111),
(1865,99,599,112),
(1866,99,262,113),
(1867,99,600,114),
(1868,99,391,115),
(1869,99,542,116),
(1870,99,601,117),
(1871,99,543,118),
(1872,99,559,119),
(1873,99,129,120),
(1874,99,130,121),
(1875,99,544,122),
(1876,99,70,123),
(1877,99,144,124),
(1878,99,545,125),
(1879,99,546,126),
(1880,99,543,127),
(1881,99,558,128),
(1882,99,557,129),
(1883,99,602,130),
(1884,99,603,131),
(1885,99,604,132),
(1886,99,129,133),
(1887,99,605,134),
(1888,99,144,135),
(1889,99,119,136),
(1890,99,283,137),
(1891,99,606,138),
(1892,99,57,139),
(1893,99,60,140),
(1894,99,607,141),
(1895,99,57,142),
(1896,99,119,143),
(1897,99,608,144),
(1898,99,609,145),
(1899,101,71,0),
(1900,101,149,1),
(1901,101,150,2),
(1902,105,610,0),
(1903,105,611,1),
(1904,106,612,0),
(1905,106,613,1),
(1906,106,614,2),
(1907,106,615,3),
(1908,106,616,4),
(1909,106,617,5),
(1910,106,618,6),
(1911,106,619,7),
(1912,106,618,8),
(1913,106,620,9),
(1914,106,621,10),
(1915,107,614,0),
(1916,107,615,1),
(1917,107,622,2),
(1918,107,623,3),
(1919,107,428,4),
(1920,107,624,5),
(1921,107,625,6),
(1922,107,626,7),
(1923,107,433,8),
(1924,107,627,9),
(1925,107,221,10),
(1926,107,618,11),
(1927,107,335,12),
(1928,107,628,13),
(1929,107,629,14),
(1930,107,630,15),
(1931,107,631,16),
(1932,107,632,17),
(1933,107,633,18),
(1934,107,616,19),
(1935,107,617,20),
(1936,107,618,21),
(1937,107,634,22),
(1938,107,635,23),
(1939,107,636,24),
(1940,107,637,25),
(1941,107,612,26),
(1942,107,638,27),
(1943,107,616,28),
(1944,107,639,29),
(1945,107,619,30),
(1946,107,618,31),
(1947,107,640,32),
(1948,107,614,33),
(1949,107,615,34),
(1950,107,620,35),
(1951,107,621,36),
(1952,107,503,37),
(1953,107,634,38),
(1954,107,428,39),
(1955,107,230,40),
(1956,107,162,41),
(1957,107,641,42),
(1958,107,642,43),
(1959,107,643,44),
(1960,107,158,45),
(1961,107,353,46),
(1962,107,183,47),
(1963,107,644,48),
(1964,107,230,49),
(1965,107,162,50),
(1966,107,644,51),
(1967,107,638,52),
(1968,107,645,53),
(1969,107,646,54),
(1970,107,647,55),
(1971,107,648,56),
(1972,107,638,57),
(1973,107,649,58),
(1974,107,650,59),
(1975,107,651,60),
(1976,107,447,61),
(1977,107,652,62),
(1978,107,653,63),
(1979,107,612,64),
(1980,107,621,65),
(1981,107,183,66),
(1982,107,162,67),
(1983,107,565,68),
(1984,107,620,69),
(1985,107,11,70),
(1986,107,644,71),
(1987,107,638,72),
(1988,107,654,73),
(1989,107,655,74),
(1990,107,656,75),
(1991,107,657,76),
(1992,107,640,77),
(1993,107,589,78),
(1994,107,30,79),
(1995,107,644,80),
(1996,107,658,81),
(1997,107,386,82),
(1998,107,616,83),
(1999,107,617,84),
(2000,107,618,85),
(2001,107,619,86),
(2002,107,618,87),
(2003,107,221,88),
(2004,107,659,89),
(2005,107,22,90),
(2006,107,660,91),
(2007,107,28,92),
(2008,107,429,93),
(2009,107,644,94),
(2010,107,614,95),
(2011,107,615,96),
(2012,107,661,97),
(2013,107,662,98),
(2014,107,663,99),
(2015,107,484,100),
(2016,107,206,101),
(2017,107,664,102),
(2018,107,665,103),
(2019,107,386,104),
(2020,107,616,105),
(2021,107,617,106),
(2022,107,619,107),
(2023,107,618,108),
(2024,107,620,109),
(2025,107,621,110),
(2026,107,644,111),
(2027,107,638,112),
(2028,107,666,113),
(2029,107,667,114),
(2030,107,668,115),
(2031,107,649,116),
(2032,107,650,117),
(2033,107,651,118),
(2034,107,447,119),
(2035,107,666,120),
(2036,107,669,121),
(2037,107,670,122),
(2038,107,671,123),
(2039,107,668,124),
(2040,107,672,125),
(2041,107,673,126),
(2042,107,646,127),
(2043,107,674,128),
(2044,107,675,129),
(2045,107,162,130),
(2046,107,478,131),
(2047,107,676,132),
(2048,107,677,133),
(2049,107,678,134),
(2050,107,679,135),
(2051,107,647,136),
(2052,107,616,137),
(2053,107,617,138),
(2054,107,618,139),
(2055,107,674,140),
(2056,107,680,141),
(2057,107,587,142),
(2058,107,620,143),
(2059,107,620,144),
(2060,107,671,145),
(2061,107,674,146),
(2062,107,619,147),
(2063,107,618,148),
(2064,107,679,149),
(2065,107,647,150),
(2066,107,681,151),
(2067,107,113,152),
(2068,107,682,153),
(2069,107,683,154),
(2070,107,587,155),
(2071,107,620,156),
(2072,107,620,157),
(2073,107,671,158),
(2074,107,627,159),
(2075,107,173,160),
(2076,107,684,161),
(2077,107,685,162),
(2078,107,679,163),
(2079,107,686,164),
(2080,107,687,165),
(2081,107,428,166),
(2082,107,230,167),
(2083,107,266,168),
(2084,107,674,169),
(2085,107,688,170),
(2086,107,689,171),
(2087,107,690,172),
(2088,107,691,173),
(2089,107,692,174),
(2090,107,693,175),
(2091,107,615,176),
(2092,107,684,177),
(2093,107,54,178),
(2094,107,128,179),
(2095,107,612,180),
(2096,107,694,181),
(2097,107,616,182),
(2098,107,617,183),
(2099,107,619,184),
(2100,107,618,185),
(2101,107,695,186),
(2102,107,696,187),
(2103,107,107,188),
(2104,107,697,189),
(2105,107,428,190),
(2106,107,698,191),
(2107,107,674,192),
(2108,107,675,193),
(2109,107,146,194),
(2110,107,699,195),
(2111,107,700,196),
(2112,107,644,197),
(2113,107,230,198),
(2114,107,701,199),
(2115,107,642,200),
(2116,107,616,201),
(2117,107,617,202),
(2118,107,618,203),
(2119,107,675,204),
(2120,107,457,205),
(2121,107,162,206),
(2122,107,13,207),
(2123,107,643,208),
(2124,107,702,209),
(2125,107,703,210),
(2126,109,428,0),
(2127,113,704,0),
(2128,113,705,1),
(2129,114,706,0),
(2130,114,707,1),
(2131,114,237,2),
(2132,114,708,3),
(2133,114,158,4),
(2134,114,709,5),
(2135,114,710,6),
(2136,114,711,7),
(2137,115,528,0),
(2138,115,712,1),
(2139,115,713,2),
(2140,115,714,3),
(2141,115,715,4),
(2142,115,716,5),
(2143,115,717,6),
(2144,115,222,7),
(2145,115,718,8),
(2146,115,719,9),
(2147,115,344,10),
(2148,115,529,11),
(2149,115,330,12),
(2150,115,68,13),
(2151,115,720,14),
(2152,115,171,15),
(2153,115,721,16),
(2154,115,708,17),
(2155,115,158,18),
(2156,115,722,19),
(2157,115,709,20),
(2158,115,710,21),
(2159,115,711,22),
(2160,115,723,23),
(2161,115,724,24),
(2162,115,411,25),
(2163,115,725,26),
(2164,115,726,27),
(2165,115,727,28),
(2166,115,728,29),
(2167,115,729,30),
(2168,115,46,31),
(2169,115,730,32),
(2170,115,731,33),
(2171,115,732,34),
(2172,115,205,35),
(2173,115,733,36),
(2174,115,727,37),
(2175,115,734,38),
(2176,115,227,39),
(2177,115,735,40),
(2178,115,736,41),
(2179,115,707,42),
(2180,115,237,43),
(2181,115,254,44),
(2182,115,737,45),
(2183,115,484,46),
(2184,115,68,47),
(2185,115,738,48),
(2186,115,484,49),
(2187,115,726,50),
(2188,115,284,51),
(2189,115,739,52),
(2190,115,237,53),
(2191,115,740,54),
(2192,115,741,55),
(2193,115,742,56),
(2194,115,743,57),
(2195,115,744,58),
(2196,115,745,59),
(2197,115,746,60),
(2198,115,185,61),
(2199,115,747,62),
(2200,115,46,63),
(2201,115,707,64),
(2202,115,237,65),
(2203,115,748,66),
(2204,115,727,67),
(2205,115,570,68),
(2206,115,749,69),
(2207,115,750,70),
(2208,115,744,71),
(2209,115,622,72),
(2210,115,751,73),
(2211,115,752,74),
(2212,115,753,75),
(2213,115,754,76),
(2214,115,411,77),
(2215,115,755,78),
(2216,115,756,79),
(2217,115,757,80),
(2218,115,727,81),
(2219,115,205,82),
(2220,115,758,83),
(2221,115,759,84),
(2222,115,732,85),
(2223,115,760,86),
(2224,115,68,87),
(2225,115,761,88),
(2226,115,730,89),
(2227,115,762,90),
(2228,115,763,91),
(2229,115,47,92),
(2230,115,48,93),
(2231,117,713,0),
(2232,117,714,1),
(2233,117,717,2),
(2234,117,723,3),
(2235,117,724,4),
(2236,117,732,5),
(2237,117,760,6),
(2238,117,720,7),
(2239,117,171,8),
(2240,117,721,9),
(2241,117,757,10),
(2242,117,47,11),
(2243,117,48,12),
(2244,121,764,0),
(2245,121,765,1),
(2246,122,766,0),
(2247,122,767,1),
(2248,122,28,2),
(2249,122,768,3),
(2250,123,6,0),
(2251,123,769,1),
(2252,123,767,2),
(2253,123,766,3),
(2254,123,28,4),
(2255,123,254,5),
(2256,123,272,6),
(2257,123,770,7),
(2258,123,771,8),
(2259,123,768,9),
(2260,123,772,10),
(2261,123,773,11),
(2262,123,767,12),
(2263,123,355,13),
(2264,123,774,14),
(2265,123,775,15),
(2266,123,332,16),
(2267,123,776,17),
(2268,123,772,18),
(2269,123,767,19),
(2270,123,766,20),
(2271,123,777,21),
(2272,123,778,22),
(2273,123,779,23),
(2274,123,780,24),
(2275,123,781,25),
(2276,123,121,26),
(2277,123,782,27),
(2278,123,93,28),
(2279,123,783,29),
(2280,123,780,30),
(2281,123,784,31),
(2282,123,773,32),
(2283,123,767,33),
(2284,123,766,34),
(2285,123,93,35),
(2286,123,783,36),
(2287,123,782,37),
(2288,123,124,38),
(2289,123,785,39),
(2290,123,56,40),
(2291,123,786,41),
(2292,123,787,42),
(2293,123,788,43),
(2294,123,789,44),
(2295,123,790,45),
(2296,123,781,46),
(2297,123,791,47),
(2298,123,782,48),
(2299,123,28,49),
(2300,123,254,50),
(2301,123,792,51),
(2302,123,793,52),
(2303,123,770,53),
(2304,123,772,54),
(2305,123,767,55),
(2306,123,794,56),
(2307,123,795,57),
(2308,123,796,58),
(2309,123,797,59),
(2310,123,798,60),
(2311,123,604,61),
(2312,123,799,62),
(2313,123,800,63),
(2314,123,801,64),
(2315,123,795,65),
(2316,123,802,66),
(2317,123,803,67),
(2318,123,802,68),
(2319,123,773,69),
(2320,123,767,70),
(2321,123,804,71),
(2322,123,805,72),
(2323,123,806,73),
(2324,123,807,74),
(2325,123,93,75),
(2326,123,808,76),
(2327,123,809,77),
(2328,123,810,78),
(2329,123,773,79),
(2330,123,811,80),
(2331,123,629,81),
(2332,123,766,82),
(2333,123,789,83),
(2334,123,812,84),
(2335,123,813,85),
(2336,123,773,86),
(2337,123,814,87),
(2338,123,815,88),
(2339,123,766,89),
(2340,123,789,90),
(2341,123,816,91),
(2342,123,817,92),
(2343,123,602,93),
(2344,123,818,94),
(2345,123,819,95),
(2346,123,96,96),
(2347,123,820,97),
(2348,123,821,98),
(2349,129,822,0),
(2350,129,823,1),
(2351,130,54,0),
(2352,130,391,1),
(2353,130,542,2),
(2354,130,824,3),
(2355,130,601,4),
(2356,130,559,5),
(2357,130,129,6),
(2358,130,130,7),
(2359,130,131,8),
(2360,130,70,9),
(2361,130,71,10),
(2362,130,563,11),
(2363,131,540,0),
(2364,131,205,1),
(2365,131,457,2),
(2366,131,825,3),
(2367,131,826,4),
(2368,131,827,5),
(2369,131,828,6),
(2370,131,829,7),
(2371,131,830,8),
(2372,131,626,9),
(2373,131,831,10),
(2374,131,411,11),
(2375,131,57,12),
(2376,131,832,13),
(2377,131,833,14),
(2378,131,834,15),
(2379,131,835,16),
(2380,131,836,17),
(2381,131,829,18),
(2382,131,780,19),
(2383,131,837,20),
(2384,131,838,21),
(2385,131,839,22),
(2386,131,562,23),
(2387,131,621,24),
(2388,131,840,25),
(2389,131,827,26),
(2390,131,841,27),
(2391,131,842,28),
(2392,131,843,29),
(2393,131,844,30),
(2394,131,562,31),
(2395,131,841,32),
(2396,131,471,33),
(2397,131,845,34),
(2398,131,846,35),
(2399,131,828,36),
(2400,131,57,37),
(2401,131,108,38),
(2402,131,131,39),
(2403,131,843,40),
(2404,131,844,41),
(2405,131,733,42),
(2406,131,847,43),
(2407,131,827,44),
(2408,131,848,45),
(2409,131,849,46),
(2410,131,850,47),
(2411,131,851,48),
(2412,131,317,49),
(2413,131,59,50),
(2414,131,435,51),
(2415,131,852,52),
(2416,131,548,53),
(2417,131,853,54),
(2418,131,854,55),
(2419,131,855,56),
(2420,131,856,57),
(2421,131,857,58),
(2422,131,858,59),
(2423,131,80,60),
(2424,131,859,61),
(2425,131,860,62),
(2426,131,435,63),
(2427,131,827,64),
(2428,131,861,65),
(2429,131,862,66),
(2430,131,863,67),
(2431,131,821,68),
(2432,131,864,69),
(2433,131,57,70),
(2434,131,119,71),
(2435,131,574,72),
(2436,131,677,73),
(2437,131,865,74),
(2438,131,856,75),
(2439,131,852,76),
(2440,131,112,77),
(2441,131,866,78),
(2442,131,864,79),
(2443,131,867,80),
(2444,131,828,81),
(2445,131,868,82),
(2446,131,317,83),
(2447,131,869,84),
(2448,131,621,85),
(2449,131,870,86),
(2450,131,871,87),
(2451,131,872,88),
(2452,131,873,89),
(2453,131,812,90),
(2454,131,874,91),
(2455,131,875,92),
(2456,131,876,93),
(2457,131,877,94),
(2458,131,878,95),
(2459,131,879,96),
(2460,131,880,97),
(2461,131,881,98),
(2462,131,875,99),
(2463,131,841,100),
(2464,131,882,101),
(2465,131,883,102),
(2466,131,884,103),
(2467,131,885,104),
(2468,131,886,105),
(2469,131,883,106),
(2470,131,887,107),
(2471,131,888,108),
(2472,131,859,109),
(2473,131,889,110),
(2474,131,162,111),
(2475,131,890,112),
(2476,131,891,113),
(2477,131,892,114),
(2478,131,893,115),
(2479,131,540,116),
(2480,131,894,117),
(2481,131,827,118),
(2482,131,59,119),
(2483,131,895,120),
(2484,131,833,121),
(2485,131,624,122),
(2486,131,88,123),
(2487,131,896,124),
(2488,131,106,125),
(2489,131,767,126),
(2490,131,897,127),
(2491,131,441,128),
(2492,131,898,129),
(2493,133,827,0),
(2494,133,149,1),
(2495,133,150,2),
(3336,161,899,0),
(3337,161,900,1),
(3338,162,901,0),
(3339,162,70,1),
(3340,162,902,2),
(3341,162,903,3),
(3342,162,904,4),
(3343,162,544,5),
(3344,162,905,6),
(3345,162,906,7),
(3346,162,907,8),
(3347,162,908,9),
(3348,162,909,10),
(3349,162,910,11),
(3350,162,911,12),
(3351,163,901,0),
(3352,163,70,1),
(3353,163,902,2),
(3354,163,903,3),
(3355,163,912,4),
(3356,163,904,5),
(3357,163,913,6),
(3358,163,905,7),
(3359,163,914,8),
(3360,163,906,9),
(3361,163,907,10),
(3362,163,908,11),
(3363,163,604,12),
(3364,163,915,13),
(3365,163,916,14),
(3366,163,181,15),
(3367,163,917,16),
(3368,163,918,17),
(3369,163,907,18),
(3370,163,908,19),
(3371,163,919,20),
(3372,163,920,21),
(3373,163,921,22),
(3374,163,922,23),
(3375,163,923,24),
(3376,163,924,25),
(3377,163,925,26),
(3378,163,926,27),
(3379,163,927,28),
(3380,163,906,29),
(3381,163,907,30),
(3382,163,908,31),
(3383,163,928,32),
(3384,163,929,33),
(3385,163,903,34),
(3386,163,930,35),
(3387,163,181,36),
(3388,163,927,37),
(3389,163,604,38),
(3390,163,915,39),
(3391,163,916,40),
(3392,163,931,41),
(3393,163,932,42),
(3394,163,933,43),
(3395,163,934,44),
(3396,163,935,45),
(3397,163,138,46),
(3398,163,927,47),
(3399,163,936,48),
(3400,163,937,49),
(3401,163,916,50),
(3402,163,70,51),
(3403,163,938,52),
(3404,163,104,53),
(3405,163,927,54),
(3406,163,906,55),
(3407,163,909,56),
(3408,163,939,57),
(3409,163,70,58),
(3410,163,902,59),
(3411,163,604,60),
(3412,163,940,61),
(3413,163,199,62),
(3414,163,941,63),
(3415,163,904,64),
(3416,163,544,65),
(3417,163,103,66),
(3418,163,901,67),
(3419,163,903,68),
(3420,163,942,69),
(3421,163,943,70),
(3422,163,904,71),
(3423,163,944,72),
(3424,163,903,73),
(3425,163,70,74),
(3426,163,938,75),
(3427,163,930,76),
(3428,163,945,77),
(3429,163,927,78),
(3430,163,906,79),
(3431,163,907,80),
(3432,163,908,81),
(3433,163,262,82),
(3434,163,946,83),
(3435,163,903,84),
(3436,163,905,85),
(3437,163,30,86),
(3438,163,907,87),
(3439,163,813,88),
(3440,163,411,89),
(3441,169,947,0),
(3442,169,948,1),
(3443,170,168,0),
(3444,170,949,1),
(3445,170,230,2),
(3446,170,950,3),
(3447,170,951,4),
(3448,170,952,5),
(3449,171,953,0),
(3450,171,506,1),
(3451,171,954,2),
(3452,171,180,3),
(3453,171,955,4),
(3454,171,956,5),
(3455,171,506,6),
(3456,171,957,7),
(3457,171,958,8),
(3458,171,954,9),
(3459,171,959,10),
(3460,171,960,11),
(3461,171,961,12),
(3462,171,962,13),
(3463,171,963,14),
(3464,171,964,15),
(3465,171,37,16),
(3466,171,965,17),
(3467,171,887,18),
(3468,171,966,19),
(3469,171,967,20),
(3470,171,968,21),
(3471,171,371,22),
(3472,171,807,23),
(3473,171,959,24),
(3474,171,969,25),
(3475,171,964,26),
(3476,171,970,27),
(3477,171,849,28),
(3478,171,971,29),
(3479,171,743,30),
(3480,171,954,31),
(3481,171,972,32),
(3482,171,963,33),
(3483,171,964,34),
(3484,171,37,35),
(3485,171,145,36),
(3486,171,103,37),
(3487,173,168,0),
(3488,173,949,1),
(3489,173,230,2),
(3490,173,950,3),
(3491,173,973,4),
(3492,177,974,0),
(3493,177,975,1),
(3494,178,976,0),
(3495,178,977,1),
(3496,178,977,2),
(3508,185,978,0),
(3509,185,979,1),
(3510,186,980,0),
(3511,186,981,1),
(3512,186,982,2),
(3513,186,983,3),
(3514,186,222,4),
(3515,186,984,5),
(3516,186,528,6),
(3517,186,13,7),
(3518,186,530,8),
(3519,187,218,0),
(3520,187,985,1),
(3521,187,986,2),
(3522,187,982,3),
(3523,187,987,4),
(3524,187,432,5),
(3525,187,988,6),
(3526,187,989,7),
(3527,187,990,8),
(3528,187,991,9),
(3529,187,992,10),
(3530,187,984,11),
(3531,187,993,12),
(3532,187,248,13),
(3533,187,994,14),
(3534,187,188,15),
(3535,187,995,16),
(3536,187,996,17),
(3537,187,57,18),
(3538,187,222,19),
(3539,187,158,20),
(3540,187,725,21),
(3541,187,997,22),
(3542,187,981,23),
(3543,187,998,24),
(3544,187,999,25),
(3545,187,248,26),
(3546,187,1000,27),
(3547,187,1001,28),
(3548,187,1002,29),
(3549,187,432,30),
(3550,187,1003,31),
(3551,187,720,32),
(3552,187,815,33),
(3553,187,1004,34),
(3554,187,1005,35),
(3555,187,1006,36),
(3556,187,982,37),
(3557,187,227,38),
(3558,187,1007,39),
(3559,187,950,40),
(3560,187,1008,41),
(3561,187,1009,42),
(3562,187,281,43),
(3563,187,708,44),
(3564,187,354,45),
(3565,187,1010,46),
(3566,187,1011,47),
(3567,187,1012,48),
(3568,187,358,49),
(3569,187,743,50),
(3570,187,1013,51),
(3571,187,1014,52),
(3572,187,1007,53),
(3573,187,994,54),
(3574,187,1015,55),
(3575,187,457,56),
(3576,187,1016,57),
(3577,187,746,58),
(3578,187,1017,59),
(3579,187,507,60),
(3580,187,9,61),
(3581,187,11,62),
(3582,187,464,63),
(3583,187,982,64),
(3584,187,1018,65),
(3585,187,1019,66),
(3586,187,1020,67),
(3587,187,1021,68),
(3588,187,1022,69),
(3589,187,415,70),
(3590,187,1023,71),
(3591,187,1024,72),
(3592,187,1025,73),
(3593,187,1026,74),
(3594,187,1027,75);
/*!40000 ALTER TABLE `submission_search_object_keywords` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `submission_search_objects`
--

DROP TABLE IF EXISTS `submission_search_objects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `submission_search_objects` (
  `object_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `submission_id` bigint(20) NOT NULL,
  `type` int(11) NOT NULL COMMENT 'Type of item. E.g., abstract, fulltext, etc.',
  `assoc_id` bigint(20) DEFAULT NULL COMMENT 'Optional ID of an associated record (e.g., a file_id)',
  PRIMARY KEY (`object_id`),
  KEY `submission_search_objects_submission_id` (`submission_id`),
  CONSTRAINT `submission_search_object_submission` FOREIGN KEY (`submission_id`) REFERENCES `submissions` (`submission_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=193 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='A list of all search objects indexed in the search index';
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
(17,2,1,NULL),
(18,2,2,NULL),
(19,2,4,NULL),
(20,2,16,NULL),
(21,2,17,NULL),
(22,2,8,NULL),
(23,2,32,NULL),
(24,2,64,NULL),
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
(41,5,1,NULL),
(42,5,2,NULL),
(43,5,4,NULL),
(44,5,16,NULL),
(45,5,17,NULL),
(46,5,8,NULL),
(47,5,32,NULL),
(48,5,64,NULL),
(49,6,1,NULL),
(50,6,2,NULL),
(51,6,4,NULL),
(52,6,16,NULL),
(53,6,17,NULL),
(54,6,8,NULL),
(55,6,32,NULL),
(56,6,64,NULL),
(57,7,1,NULL),
(58,7,2,NULL),
(59,7,4,NULL),
(60,7,16,NULL),
(61,7,17,NULL),
(62,7,8,NULL),
(63,7,32,NULL),
(64,7,64,NULL),
(65,8,1,NULL),
(66,8,2,NULL),
(67,8,4,NULL),
(68,8,16,NULL),
(69,8,17,NULL),
(70,8,8,NULL),
(71,8,32,NULL),
(72,8,64,NULL),
(73,9,1,NULL),
(74,9,2,NULL),
(75,9,4,NULL),
(76,9,16,NULL),
(77,9,17,NULL),
(78,9,8,NULL),
(79,9,32,NULL),
(80,9,64,NULL),
(81,10,1,NULL),
(82,10,2,NULL),
(83,10,4,NULL),
(84,10,16,NULL),
(85,10,17,NULL),
(86,10,8,NULL),
(87,10,32,NULL),
(88,10,64,NULL),
(89,11,1,NULL),
(90,11,2,NULL),
(91,11,4,NULL),
(92,11,16,NULL),
(93,11,17,NULL),
(94,11,8,NULL),
(95,11,32,NULL),
(96,11,64,NULL),
(97,12,1,NULL),
(98,12,2,NULL),
(99,12,4,NULL),
(100,12,16,NULL),
(101,12,17,NULL),
(102,12,8,NULL),
(103,12,32,NULL),
(104,12,64,NULL),
(105,13,1,NULL),
(106,13,2,NULL),
(107,13,4,NULL),
(108,13,16,NULL),
(109,13,17,NULL),
(110,13,8,NULL),
(111,13,32,NULL),
(112,13,64,NULL),
(113,14,1,NULL),
(114,14,2,NULL),
(115,14,4,NULL),
(116,14,16,NULL),
(117,14,17,NULL),
(118,14,8,NULL),
(119,14,32,NULL),
(120,14,64,NULL),
(121,15,1,NULL),
(122,15,2,NULL),
(123,15,4,NULL),
(124,15,16,NULL),
(125,15,17,NULL),
(126,15,8,NULL),
(127,15,32,NULL),
(128,15,64,NULL),
(129,16,1,NULL),
(130,16,2,NULL),
(131,16,4,NULL),
(132,16,16,NULL),
(133,16,17,NULL),
(134,16,8,NULL),
(135,16,32,NULL),
(136,16,64,NULL),
(161,17,1,NULL),
(162,17,2,NULL),
(163,17,4,NULL),
(164,17,16,NULL),
(165,17,17,NULL),
(166,17,8,NULL),
(167,17,32,NULL),
(168,17,64,NULL),
(169,18,1,NULL),
(170,18,2,NULL),
(171,18,4,NULL),
(172,18,16,NULL),
(173,18,17,NULL),
(174,18,8,NULL),
(175,18,32,NULL),
(176,18,64,NULL),
(177,19,1,NULL),
(178,19,2,NULL),
(179,19,4,NULL),
(180,19,16,NULL),
(181,19,17,NULL),
(182,19,8,NULL),
(183,19,32,NULL),
(184,19,64,NULL),
(185,20,1,NULL),
(186,20,2,NULL),
(187,20,4,NULL),
(188,20,16,NULL),
(189,20,17,NULL),
(190,20,8,NULL),
(191,20,32,NULL),
(192,20,64,NULL);
/*!40000 ALTER TABLE `submission_search_objects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `submission_settings`
--

DROP TABLE IF EXISTS `submission_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
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
/*!40101 SET character_set_client = utf8mb4 */;
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
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='All submissions submitted to the context, including incomplete, declined and unpublished submissions.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `submissions`
--

LOCK TABLES `submissions` WRITE;
/*!40000 ALTER TABLE `submissions` DISABLE KEYS */;
INSERT INTO `submissions` VALUES
(1,1,1,'2025-08-02 05:53:37','2025-08-02 05:50:10','2025-08-02 05:50:10',5,'en',3,'',0),
(2,1,3,'2025-08-02 05:54:18','2025-08-02 05:54:02','2025-08-02 05:54:02',3,'en',1,'',0),
(3,1,4,'2025-08-02 05:54:48','2025-08-02 05:54:30','2025-08-02 05:54:30',4,'en',1,'',0),
(4,1,5,'2025-08-02 05:54:58','2025-08-02 05:54:57','2025-08-02 05:54:57',1,'en',1,'',0),
(5,1,6,'2025-08-02 05:55:35','2025-08-02 05:55:06','2025-08-02 05:55:06',5,'en',1,'',0),
(6,1,7,'2025-08-02 05:56:10','2025-08-02 05:55:43','2025-08-02 05:55:43',5,'en',1,'',0),
(7,1,8,'2025-08-02 05:56:40','2025-08-02 05:56:19','2025-08-02 05:56:19',3,'en',1,'',0),
(8,1,9,'2025-08-02 05:56:50','2025-08-02 05:56:50','2025-08-02 05:56:50',1,'en',1,'',0),
(9,1,10,'2025-08-02 05:57:29','2025-08-02 05:56:58','2025-08-02 05:56:58',5,'en',1,'',0),
(10,1,11,'2025-08-02 05:58:04','2025-08-02 05:57:38','2025-08-02 05:57:38',3,'en',1,'',0),
(11,1,12,'2025-08-02 05:58:13','2025-08-02 05:58:13','2025-08-02 05:58:13',1,'en',1,'',0),
(12,1,13,'2025-08-02 05:58:35','2025-08-02 05:58:22','2025-08-02 05:58:22',3,'en',1,'',0),
(13,1,14,'2025-08-02 05:59:30','2025-08-02 05:58:44','2025-08-02 05:58:44',3,'en',1,'',0),
(14,1,15,'2025-08-02 05:59:41','2025-08-02 05:59:41','2025-08-02 05:59:41',1,'en',1,'',0),
(15,1,16,'2025-08-02 06:00:20','2025-08-02 05:59:49','2025-08-02 05:59:49',5,'en',1,'',0),
(16,1,17,'2025-08-02 06:00:29','2025-08-02 06:00:29','2025-08-02 06:00:29',1,'en',1,'',0),
(17,1,18,'2025-08-02 06:02:08','2025-08-02 06:00:38','2025-08-02 06:00:38',5,'en',3,'',0),
(18,1,19,'2025-08-02 06:02:21','2025-08-02 06:02:21','2025-08-02 06:02:21',1,'en',4,'',0),
(19,1,20,'2025-08-02 06:03:04','2025-08-02 06:02:40','2025-08-02 06:02:40',4,'en',1,'',0),
(20,1,21,'2025-08-02 06:07:23','2025-08-02 06:04:51','2025-08-02 06:04:51',3,'en',1,'',0);
/*!40000 ALTER TABLE `submissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subscription_type_settings`
--

DROP TABLE IF EXISTS `subscription_type_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
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
/*!40101 SET character_set_client = utf8mb4 */;
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
/*!40101 SET character_set_client = utf8mb4 */;
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
/*!40101 SET character_set_client = utf8mb4 */;
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
/*!40101 SET character_set_client = utf8mb4 */;
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
/*!40101 SET character_set_client = utf8mb4 */;
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
  KEY `ust_load_id_context_id_ip_ua_url` (`load_id`,`context_id`,`ip`,`user_agent`,`canonical_url`),
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
/*!40101 SET character_set_client = utf8mb4 */;
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
  KEY `usii_load_id_context_id_ip_ua` (`load_id`,`context_id`,`ip`,`user_agent`),
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
/*!40101 SET character_set_client = utf8mb4 */;
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
  KEY `usir_load_id_context_id_ip_ua` (`load_id`,`context_id`,`ip`,`user_agent`),
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
/*!40101 SET character_set_client = utf8mb4 */;
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
) ENGINE=InnoDB AUTO_INCREMENT=109 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='More data about user groups, including localized properties such as the name.';
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
(102,18,'fr_CA','abbrev','RespAB'),
(103,19,'','nameLocaleKey','default.groups.name.editorialBoardMember'),
(104,19,'','abbrevLocaleKey','default.groups.abbrev.editorialBoardMember'),
(105,19,'en','name','Editorial Board Member'),
(106,19,'en','abbrev','EBM'),
(107,19,'fr_CA','name','##default.groups.name.editorialBoardMember##'),
(108,19,'fr_CA','abbrev','##default.groups.abbrev.editorialBoardMember##');
/*!40000 ALTER TABLE `user_group_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_group_stage`
--

DROP TABLE IF EXISTS `user_group_stage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
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
/*!40101 SET character_set_client = utf8mb4 */;
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
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='All defined user roles in a context, such as Author, Reviewer, Section Editor and Journal Manager.';
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
(18,1,2097152,1,1,0,0,0,0),
(19,1,4097,1,1,0,0,0,1);
/*!40000 ALTER TABLE `user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_interests`
--

DROP TABLE IF EXISTS `user_interests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
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
/*!40101 SET character_set_client = utf8mb4 */;
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
) ENGINE=InnoDB AUTO_INCREMENT=171 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='More data about users, including localized properties like their name and affiliation.';
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
(149,35,'en','givenName','Zita'),
(150,36,'en','affiliation','Rajshahi University of Engineering and Technology'),
(151,36,'en','familyName','Zedd'),
(152,36,'en','givenName','Zayan'),
(153,37,'en','affiliation','Delft University of Technology'),
(154,37,'fr_CA','affiliation',''),
(155,37,'en','familyName','Doe'),
(156,37,'fr_CA','familyName',''),
(157,37,'en','givenName','Jhon'),
(158,37,'fr_CA','givenName',''),
(159,38,'en','affiliation','Leiden University'),
(160,38,'fr_CA','affiliation',''),
(161,38,'en','familyName','Von'),
(162,38,'fr_CA','familyName',''),
(163,38,'en','givenName','Lisset'),
(164,38,'fr_CA','givenName',''),
(165,39,'en','affiliation','Wageningen University & Research'),
(166,39,'fr_CA','affiliation',''),
(167,39,'en','familyName','Sharif'),
(168,39,'fr_CA','familyName',''),
(169,39,'en','givenName','Rajek'),
(170,39,'fr_CA','givenName','');
/*!40000 ALTER TABLE `user_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_user_groups`
--

DROP TABLE IF EXISTS `user_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
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
) ENGINE=InnoDB AUTO_INCREMENT=64 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='Maps users to their assigned user_groups.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_user_groups`
--

LOCK TABLES `user_user_groups` WRITE;
/*!40000 ALTER TABLE `user_user_groups` DISABLE KEYS */;
INSERT INTO `user_user_groups` VALUES
(1,1,1,'2025-08-02 05:41:58',NULL,NULL),
(2,2,1,NULL,NULL,NULL),
(3,2,2,'2025-08-02 00:00:00',NULL,1),
(4,3,3,'2025-08-02 00:00:00',NULL,1),
(5,5,4,'2025-08-02 00:00:00',NULL,1),
(6,5,5,'2025-08-02 00:00:00',NULL,1),
(7,5,6,'2025-08-02 00:00:00',NULL,1),
(8,16,7,'2025-08-02 00:00:00',NULL,1),
(9,16,8,'2025-08-02 00:00:00',NULL,1),
(10,16,9,'2025-08-02 00:00:00',NULL,1),
(11,16,10,'2025-08-02 00:00:00',NULL,1),
(12,7,11,'2025-08-02 00:00:00',NULL,1),
(13,7,12,'2025-08-02 00:00:00',NULL,1),
(14,11,13,'2025-08-02 00:00:00',NULL,1),
(15,11,14,'2025-08-02 00:00:00',NULL,1),
(16,13,15,'2025-08-02 00:00:00',NULL,1),
(17,13,16,'2025-08-02 00:00:00',NULL,1),
(18,17,17,'2025-08-02 05:49:27',NULL,NULL),
(19,14,17,'2025-08-02 05:49:27',NULL,NULL),
(20,17,18,'2025-08-02 05:53:57',NULL,NULL),
(21,14,18,'2025-08-02 05:53:59',NULL,NULL),
(22,17,19,'2025-08-02 05:54:26',NULL,NULL),
(23,14,19,'2025-08-02 05:54:28',NULL,NULL),
(24,17,20,'2025-08-02 05:54:53',NULL,NULL),
(25,14,20,'2025-08-02 05:54:54',NULL,NULL),
(26,17,21,'2025-08-02 05:55:02',NULL,NULL),
(27,14,21,'2025-08-02 05:55:03',NULL,NULL),
(28,17,22,'2025-08-02 05:55:39',NULL,NULL),
(29,14,22,'2025-08-02 05:55:41',NULL,NULL),
(30,17,23,'2025-08-02 05:56:15',NULL,NULL),
(31,14,23,'2025-08-02 05:56:16',NULL,NULL),
(32,17,24,'2025-08-02 05:56:45',NULL,NULL),
(33,14,24,'2025-08-02 05:56:46',NULL,NULL),
(34,17,25,'2025-08-02 05:56:54',NULL,NULL),
(35,14,25,'2025-08-02 05:56:56',NULL,NULL),
(36,17,26,'2025-08-02 05:57:34',NULL,NULL),
(37,14,26,'2025-08-02 05:57:35',NULL,NULL),
(38,17,27,'2025-08-02 05:58:09',NULL,NULL),
(39,14,27,'2025-08-02 05:58:10',NULL,NULL),
(40,17,28,'2025-08-02 05:58:18',NULL,NULL),
(41,14,28,'2025-08-02 05:58:19',NULL,NULL),
(42,17,29,'2025-08-02 05:58:40',NULL,NULL),
(43,14,29,'2025-08-02 05:58:42',NULL,NULL),
(44,17,30,'2025-08-02 05:59:36',NULL,NULL),
(45,14,30,'2025-08-02 05:59:38',NULL,NULL),
(46,17,31,'2025-08-02 05:59:45',NULL,NULL),
(47,14,31,'2025-08-02 05:59:47',NULL,NULL),
(48,17,32,'2025-08-02 06:00:25',NULL,NULL),
(49,14,32,'2025-08-02 06:00:27',NULL,NULL),
(50,17,33,'2025-08-02 06:00:34',NULL,NULL),
(51,14,33,'2025-08-02 06:00:35',NULL,NULL),
(52,17,34,'2025-08-02 06:02:16',NULL,NULL),
(53,14,34,'2025-08-02 06:02:18',NULL,NULL),
(54,17,35,'2025-08-02 06:02:36',NULL,NULL),
(55,14,35,'2025-08-02 06:02:37',NULL,NULL),
(56,17,36,'2025-08-02 06:03:16',NULL,NULL),
(57,14,36,'2025-08-02 06:03:17',NULL,NULL),
(58,16,37,'2025-08-02 06:05:42',NULL,1),
(59,16,38,'2025-08-02 06:05:54',NULL,1),
(60,16,16,'2025-08-02 06:06:31',NULL,1),
(61,16,14,'2025-08-02 06:06:44',NULL,1),
(62,16,39,'2025-08-02 06:06:58',NULL,1),
(63,16,15,'2025-08-02 06:07:10',NULL,1);
/*!40000 ALTER TABLE `user_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
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
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='All registered users, including authentication data and profile data.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES
(1,'admin','$2y$10$MoM30oGMxrltawpREzUWoOPCfwhPHCGcnYPvnQb1BvDNgSvOnLnM.','pkpadmin@mailinator.com',NULL,NULL,NULL,NULL,NULL,'[]',NULL,NULL,'2025-08-02 05:41:58',NULL,'2025-08-02 06:05:14',NULL,NULL,NULL,0,NULL,1,NULL),
(2,'rvaca','$2y$10$.V2gg4p.EXa8LHQSXDse8uU7DlzEczrQdbJMqpSlEG/uGHSvQ6ZkG','rvaca@mailinator.com',NULL,NULL,NULL,NULL,'MX','[]',NULL,NULL,'2025-08-02 05:43:04',NULL,NULL,NULL,NULL,NULL,0,NULL,1,NULL),
(3,'dbarnes','$2y$10$gporjQOb/8GVR.CKvjzv1uThebAh1.sNolI20Fn6KtWP/p1Szw0Z2','dbarnes@mailinator.com',NULL,NULL,NULL,NULL,'AU','[]',NULL,NULL,'2025-08-02 05:43:21',NULL,'2025-08-02 06:07:12',NULL,NULL,NULL,0,NULL,1,NULL),
(4,'dbuskins','$2y$10$rp3LFC4xsocRdUaUyB.S2.06u16bBfubSRTgI2NBsMl4peu0OjYGC','dbuskins@mailinator.com',NULL,NULL,NULL,NULL,'US','[]',NULL,NULL,'2025-08-02 05:43:38',NULL,NULL,NULL,NULL,NULL,0,NULL,1,NULL),
(5,'sberardo','$2y$10$eb8C2JNR9fxSdyJqRoksxeqrNCnS03R7u24bz18gWiVscRgLJ538K','sberardo@mailinator.com',NULL,NULL,NULL,NULL,'CA','[]',NULL,NULL,'2025-08-02 05:43:56',NULL,NULL,NULL,NULL,NULL,0,NULL,1,NULL),
(6,'minoue','$2y$10$ytToqH85rLbRcBVdDD6MBOfUv064E7stSzl.FLGQ9UdMh0n.Tj1vm','minoue@mailinator.com',NULL,NULL,NULL,NULL,'JP','[]',NULL,NULL,'2025-08-02 05:44:15',NULL,'2025-08-02 05:54:14',NULL,NULL,NULL,0,NULL,1,NULL),
(7,'jjanssen','$2y$10$m5njD7e8roGWK7LQyz/.UuuvGVR3edfFdHZojpsSj8Ft.n.6kylXK','jjanssen@mailinator.com',NULL,NULL,NULL,NULL,'NL','[]',NULL,NULL,'2025-08-02 05:44:35',NULL,'2025-08-02 05:59:02',NULL,NULL,NULL,0,NULL,1,NULL),
(8,'phudson','$2y$10$cMapxwb4Au3n71hitMJZsOmqk0mXoBRDGQYG1RiE/SC1EmMcbI/pC','phudson@mailinator.com',NULL,NULL,NULL,NULL,'CA','[]',NULL,NULL,'2025-08-02 05:44:56',NULL,'2025-08-02 05:56:34',NULL,NULL,NULL,0,NULL,1,NULL),
(9,'amccrae','$2y$10$Cr9hiU07VJ883Ykx1fkSbedO9S4HO9deZJLc7cpfgMue.hMhK9vVW','amccrae@mailinator.com',NULL,NULL,NULL,NULL,'CA','[]',NULL,NULL,'2025-08-02 05:45:19',NULL,'2025-08-02 05:59:08',NULL,NULL,NULL,0,NULL,1,NULL),
(10,'agallego','$2y$10$Ryni7JLCumZFJRw91Me3fu3x1rXHo3QnBGN6XefiH0WDnbVkdLWi2','agallego@mailinator.com',NULL,NULL,NULL,NULL,'US','[]',NULL,NULL,'2025-08-02 05:45:42',NULL,'2025-08-02 05:59:15',NULL,NULL,NULL,0,NULL,1,NULL),
(11,'mfritz','$2y$10$efGuQouYXxmTSNET9oUvtuSQhH7iI66AXjy8u7FBdrvxXijPixwyy','mfritz@mailinator.com',NULL,NULL,NULL,NULL,'BE','[]',NULL,NULL,'2025-08-02 05:46:07',NULL,NULL,NULL,NULL,NULL,0,NULL,1,NULL),
(12,'svogt','$2y$10$TVNN33oZYgTqMnogBPVxyeb2opiZB51k7AbMMMvUa6cEGmLe5RZZG','svogt@mailinator.com',NULL,NULL,NULL,NULL,'CL','[]',NULL,NULL,'2025-08-02 05:46:34',NULL,NULL,NULL,NULL,NULL,0,NULL,1,NULL),
(13,'gcox','$2y$10$UusTgXvCYWKEwvHdu7f7c.mmWvqUGonQJG/56qmIru91krtzKVvUW','gcox@mailinator.com',NULL,NULL,NULL,NULL,'US','[]',NULL,NULL,'2025-08-02 05:47:03',NULL,NULL,NULL,NULL,NULL,0,NULL,1,NULL),
(14,'shellier','$2y$10$EXeI4AF4O2LVGGddVG4cCuRB.nFzWJ3syPKF71kT76OWsVoDQYRHa','shellier@mailinator.com',NULL,NULL,NULL,NULL,'ZA','[]',NULL,NULL,'2025-08-02 05:47:33',NULL,NULL,NULL,NULL,NULL,0,NULL,1,NULL),
(15,'cturner','$2y$10$3Ni4NHd92EerO4CggH1rr.ygiHy6f2xBm0iwbz/KsXWHLgB3JDVau','cturner@mailinator.com',NULL,NULL,NULL,NULL,'GB','[]',NULL,NULL,'2025-08-02 05:48:05',NULL,NULL,NULL,NULL,NULL,0,NULL,1,NULL),
(16,'skumar','$2y$10$hj2xGMICWpnd4DG6.0kZMeEsa8SJ3ihszLg/MxjXGyDeOR1R0P7XG','skumar@mailinator.com',NULL,NULL,NULL,NULL,'SG','[]',NULL,NULL,'2025-08-02 05:48:40',NULL,NULL,NULL,NULL,NULL,0,NULL,1,NULL),
(17,'amwandenga','$2y$10$1MrKIx9OR80csLX7eHgJZOnJIHnQDBdKASNCbBlGjMf1olHj3VoWG','amwandenga@mailinator.com',NULL,NULL,NULL,NULL,'ZA','[]',NULL,NULL,'2025-08-02 05:49:27',NULL,'2025-08-02 05:52:32',NULL,NULL,NULL,0,NULL,1,NULL),
(18,'ccorino','$2y$10$erSA6bdnquHCNxZdAnR5vOLyAwOPSCYIjShBe/JQX.BK3oRv01rnO','ccorino@mailinator.com',NULL,NULL,NULL,NULL,'IT','[]',NULL,NULL,'2025-08-02 05:53:57',NULL,'2025-08-02 05:53:57',NULL,NULL,NULL,0,NULL,1,NULL),
(19,'ckwantes','$2y$10$5v.SaGQe0sZ9E2l9pAgq1O21CG0ctQtujwsLvXYVVb1ZD3X1Tf4Jq','ckwantes@mailinator.com',NULL,NULL,NULL,NULL,'CA','[]',NULL,NULL,'2025-08-02 05:54:26',NULL,'2025-08-02 05:54:26',NULL,NULL,NULL,0,NULL,1,NULL),
(20,'cmontgomerie','$2y$10$aO7gxdJuP0Eo4XA3.GUw2uZxnm3k.elgOYOkZJKxHL8mvHxhU4MvG','cmontgomerie@mailinator.com',NULL,NULL,NULL,NULL,'CA','[]',NULL,NULL,'2025-08-02 05:54:53',NULL,'2025-08-02 05:54:53',NULL,NULL,NULL,0,NULL,1,NULL),
(21,'ddiouf','$2y$10$xHLkfknXvFcTH7sPefbueezwut4OUdU1aYhJ3aQD4TcSftnH6x.kq','ddiouf@mailinator.com',NULL,NULL,NULL,NULL,'EG','[]',NULL,NULL,'2025-08-02 05:55:02',NULL,'2025-08-02 05:55:02',NULL,NULL,NULL,0,NULL,1,NULL),
(22,'dphillips','$2y$10$mVPA5nU5m531C1CloPG3HOTaDZZ9Qp5KY7R1ovz2/CD0ObDO99WGe','dphillips@mailinator.com',NULL,NULL,NULL,NULL,'CA','[]',NULL,NULL,'2025-08-02 05:55:39',NULL,'2025-08-02 05:55:39',NULL,NULL,NULL,0,NULL,1,NULL),
(23,'dsokoloff','$2y$10$uF4EjQ7FzY.S4Ab2oT4XIeE6TW6kcggcakAjMFLmTe7RD0i0lsVzS','dsokoloff@mailinator.com',NULL,NULL,NULL,NULL,'IE','[]',NULL,NULL,'2025-08-02 05:56:15',NULL,'2025-08-02 05:56:15',NULL,NULL,NULL,0,NULL,1,NULL),
(24,'eostrom','$2y$10$Z8h.c5aLNK1FEOc8peHVvO0BOsl.o.dZy7g111.qimf1t1cqOwaxy','eostrom@mailinator.com',NULL,NULL,NULL,NULL,'US','[]',NULL,NULL,'2025-08-02 05:56:45',NULL,'2025-08-02 05:56:45',NULL,NULL,NULL,0,NULL,1,NULL),
(25,'fpaglieri','$2y$10$wuMNZrfh9cBsbDOcYqwCHOc1mZkwwtOLxQW/D8ucxdUus/jHazn5e','fpaglieri@mailinator.com',NULL,NULL,NULL,NULL,'IT','[]',NULL,NULL,'2025-08-02 05:56:54',NULL,'2025-08-02 05:56:54',NULL,NULL,NULL,0,NULL,1,NULL),
(26,'jnovak','$2y$10$h.AQszv6mpCn9eLoZu0CwuHNsuelkLXrqcxBXcgkTz.wMxpYgjDFC','jnovak@mailinator.com',NULL,NULL,NULL,NULL,'DK','[]',NULL,NULL,'2025-08-02 05:57:34',NULL,'2025-08-02 05:57:34',NULL,NULL,NULL,0,NULL,1,NULL),
(27,'kalkhafaji','$2y$10$.ugBt06KRfZVSiSsh8zoYemoKVOzv1jUA06q2hJgUQTmumb2q5v1y','kalkhafaji@mailinator.com',NULL,NULL,NULL,NULL,'US','[]',NULL,NULL,'2025-08-02 05:58:09',NULL,'2025-08-02 05:58:09',NULL,NULL,NULL,0,NULL,1,NULL),
(28,'lchristopher','$2y$10$BehUIANyEHMprwruCl1cse1PShHC3UrfZ8SbnPA8m6wU/8/uvmvqi','lchristopher@mailinator.com',NULL,NULL,NULL,NULL,'AU','[]',NULL,NULL,'2025-08-02 05:58:18',NULL,'2025-08-02 05:58:18',NULL,NULL,NULL,0,NULL,1,NULL),
(29,'lkumiega','$2y$10$JAu5Ca9mh6hIWQ1fziIh3.qwvOK0TfEVI7pz/wg5SBNK84lHs6Bha','lkumiega@mailinator.com',NULL,NULL,NULL,NULL,'ZA','[]',NULL,NULL,'2025-08-02 05:58:40',NULL,'2025-08-02 05:58:40',NULL,NULL,NULL,0,NULL,1,NULL),
(30,'pdaniel','$2y$10$tiDPNPvO9yXLsW3s8ut6puDnQxUFbiRTrFV4SE2YqPNzqwRwq4Nn.','pdaniel@mailinator.com',NULL,NULL,NULL,NULL,'GB','[]',NULL,NULL,'2025-08-02 05:59:36',NULL,'2025-08-02 05:59:37',NULL,NULL,NULL,0,NULL,1,NULL),
(31,'rbaiyewu','$2y$10$exJCduRfT.XgqHEhSwU3E.ynquFi4JLYGksR2eJac9YVVLsTqP0rS','rbaiyewu@mailinator.com',NULL,NULL,NULL,NULL,'KE','[]',NULL,NULL,'2025-08-02 05:59:45',NULL,'2025-08-02 05:59:45',NULL,NULL,NULL,0,NULL,1,NULL),
(32,'rrossi','$2y$10$YP0rnNJJq8Oq2W11mViN1.E50aOhjd1w98t43Ev7uXZZtwazFKuQa','rrossi@mailinator.com',NULL,NULL,NULL,NULL,'ES','[]',NULL,NULL,'2025-08-02 06:00:25',NULL,'2025-08-02 06:00:25',NULL,NULL,NULL,0,NULL,1,NULL),
(33,'vkarbasizaed','$2y$10$izjGE7uS6AffMyScptBwe.VMyZ2uv6ROCfYG3lnpxfXr2RgMZN/ia','vkarbasizaed@mailinator.com',NULL,NULL,NULL,NULL,'IR','[]',NULL,NULL,'2025-08-02 06:00:33',NULL,'2025-08-02 06:00:34',NULL,NULL,NULL,0,NULL,1,NULL),
(34,'vwilliamson','$2y$10$7VUXFJZQdMmf.q/jt19GBOWW2MNuBGNLzFEyY2Lc/FJ77ob./NDmS','vwilliamson@mailinator.com',NULL,NULL,NULL,NULL,'CA','[]',NULL,NULL,'2025-08-02 06:02:16',NULL,'2025-08-02 06:02:17',NULL,NULL,NULL,0,NULL,1,NULL),
(35,'zwoods','$2y$10$2CP6HUJYyE2HY9ZU1GOBk.f5Ucq.XxcFP.0aqWOg8MXb3IqSimkL.','zwoods@mailinator.com',NULL,NULL,NULL,NULL,'US','[]',NULL,NULL,'2025-08-02 06:02:36',NULL,'2025-08-02 06:02:36',NULL,NULL,NULL,0,NULL,1,NULL),
(36,'zzedd','$2y$10$eywUZUlsZsa8fqKV9B7nD.z/Li7cXmP8bXUs2gRvlxYNkt04lI/Oe','zzedd@mailinator.com',NULL,NULL,NULL,NULL,'BD','[]',NULL,NULL,'2025-08-02 06:03:16',NULL,'2025-08-02 06:03:16',NULL,NULL,NULL,0,NULL,1,NULL),
(37,'jdoe','$2y$10$yJlmVmBGL7A91jqMedacbuqq95Nb5y07mLyLsHd7PbSQlVN.m3Fq2','jdoe@mailinator.com',NULL,NULL,NULL,NULL,NULL,'[]',NULL,NULL,'2025-08-02 06:05:42',NULL,NULL,1,NULL,NULL,0,NULL,1,NULL),
(38,'lvon','$2y$10$IBVzeTBw9yxchMkgCwdYf.RTqJV/EEnBR1zlE73kCoh35d5XFt6Qy','lvon@mailinator.com',NULL,NULL,NULL,NULL,NULL,'[]',NULL,NULL,'2025-08-02 06:05:54',NULL,NULL,1,NULL,NULL,0,NULL,1,NULL),
(39,'rsharif','$2y$10$MWdqeDTgrtake1H9ygQtl.siwhCBdDPSZLi78RsHYmxKKYJES3Pym','rsharif@mailinator.com',NULL,NULL,NULL,NULL,NULL,'[]',NULL,NULL,'2025-08-02 06:06:58',NULL,NULL,1,NULL,NULL,0,NULL,1,NULL);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `versions`
--

DROP TABLE IF EXISTS `versions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
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
(1,1,0,0,0,'2025-08-02 05:41:58',1,'plugins.metadata','dc11','',0,0),
(2,1,1,0,0,'2025-08-02 05:41:58',1,'plugins.blocks','subscription','SubscriptionBlockPlugin',1,0),
(3,1,0,0,0,'2025-08-02 05:41:58',1,'plugins.blocks','languageToggle','LanguageToggleBlockPlugin',1,0),
(4,1,0,0,0,'2025-08-02 05:41:58',1,'plugins.blocks','information','InformationBlockPlugin',1,0),
(5,1,0,1,0,'2025-08-02 05:41:58',1,'plugins.blocks','browse','BrowseBlockPlugin',1,0),
(6,1,0,0,0,'2025-08-02 05:41:58',1,'plugins.blocks','developedBy','DevelopedByBlockPlugin',1,0),
(7,1,0,0,0,'2025-08-02 05:41:58',1,'plugins.blocks','makeSubmission','MakeSubmissionBlockPlugin',1,0),
(8,3,0,0,0,'2025-08-02 05:41:58',1,'plugins.generic','crossref','CrossrefPlugin',0,0),
(9,1,0,0,0,'2025-08-02 05:41:58',1,'plugins.generic','announcementFeed','AnnouncementFeedPlugin',1,0),
(10,1,0,0,0,'2025-08-02 05:41:58',1,'plugins.generic','dublinCoreMeta','DublinCoreMetaPlugin',1,0),
(11,1,0,0,0,'2025-08-02 05:41:58',1,'plugins.generic','usageEvent','',0,0),
(12,1,0,0,1,'2025-08-02 05:41:58',1,'plugins.generic','recommendByAuthor','RecommendByAuthorPlugin',1,1),
(13,2,0,0,0,'2025-08-02 05:41:58',1,'plugins.generic','datacite','DatacitePlugin',0,0),
(14,1,0,1,0,'2025-08-02 05:41:58',1,'plugins.generic','pdfJsViewer','PdfJsViewerPlugin',1,0),
(15,0,1,0,0,'2025-08-02 05:41:58',1,'plugins.generic','citationStyleLanguage','CitationStyleLanguagePlugin',1,0),
(16,1,2,0,0,'2025-08-02 05:41:58',1,'plugins.generic','staticPages','StaticPagesPlugin',1,0),
(17,1,2,0,0,'2025-08-02 05:41:58',1,'plugins.generic','customBlockManager','CustomBlockManagerPlugin',1,0),
(18,1,0,0,0,'2025-08-02 05:41:58',1,'plugins.generic','tinymce','TinyMCEPlugin',1,0),
(19,1,0,0,0,'2025-08-02 05:41:58',1,'plugins.generic','googleAnalytics','GoogleAnalyticsPlugin',1,0),
(20,1,0,1,0,'2025-08-02 05:41:58',1,'plugins.generic','lensGalley','LensGalleyPlugin',1,0),
(21,1,0,8,0,'2025-08-02 05:41:58',1,'plugins.generic','jatsTemplate','JatsTemplatePlugin',1,0),
(22,1,0,0,0,'2025-08-02 05:41:58',1,'plugins.generic','recommendBySimilarity','RecommendBySimilarityPlugin',1,1),
(23,1,2,0,0,'2025-08-02 05:41:58',1,'plugins.generic','credit','CreditPlugin',1,0),
(24,1,0,0,0,'2025-08-02 05:41:58',1,'plugins.generic','driver','DRIVERPlugin',1,0),
(25,1,0,0,0,'2025-08-02 05:41:58',1,'plugins.generic','webFeed','WebFeedPlugin',1,0),
(26,1,0,0,0,'2025-08-02 05:41:58',1,'plugins.generic','htmlArticleGalley','HtmlArticleGalleyPlugin',1,0),
(27,1,1,0,0,'2025-08-02 05:41:58',1,'plugins.generic','googleScholar','GoogleScholarPlugin',1,0),
(28,1,0,0,0,'2025-08-02 05:41:58',1,'plugins.importexport','native','',0,0),
(29,1,0,0,0,'2025-08-02 05:41:58',1,'plugins.importexport','pubmed','',0,0),
(30,1,1,0,0,'2025-08-02 05:41:58',1,'plugins.importexport','doaj','',0,0),
(31,1,0,0,0,'2025-08-02 05:41:58',1,'plugins.importexport','users','',0,0),
(32,1,0,0,0,'2025-08-02 05:41:58',1,'plugins.oaiMetadataFormats','marcxml','',0,0),
(33,1,0,0,0,'2025-08-02 05:41:58',1,'plugins.oaiMetadataFormats','rfc1807','',0,0),
(34,1,0,0,0,'2025-08-02 05:41:58',1,'plugins.oaiMetadataFormats','marc','',0,0),
(35,1,0,6,0,'2025-08-02 05:41:58',1,'plugins.oaiMetadataFormats','oaiJats','',0,0),
(36,1,0,0,0,'2025-08-02 05:41:58',1,'plugins.oaiMetadataFormats','dc','',0,0),
(37,1,0,0,0,'2025-08-02 05:41:58',1,'plugins.paymethod','paypal','',0,0),
(38,1,0,0,0,'2025-08-02 05:41:58',1,'plugins.paymethod','manual','',0,0),
(39,1,0,0,0,'2025-08-02 05:41:58',1,'plugins.pubIds','urn','URNPubIdPlugin',1,0),
(40,1,0,0,0,'2025-08-02 05:41:58',1,'plugins.reports','articles','',0,0),
(41,2,0,1,0,'2025-08-02 05:41:58',1,'plugins.reports','reviewReport','',0,0),
(42,1,1,0,0,'2025-08-02 05:41:58',1,'plugins.reports','counterReport','',0,0),
(43,1,0,0,0,'2025-08-02 05:41:58',1,'plugins.reports','subscriptions','',0,0),
(44,1,0,0,0,'2025-08-02 05:41:58',1,'plugins.themes','default','DefaultThemePlugin',1,0),
(45,3,5,0,1,'2025-08-02 05:41:53',1,'core','ojs2','',0,1);
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

-- Dump completed on 2025-08-02  6:07:31
