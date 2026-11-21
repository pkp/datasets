/*M!999999\- enable the sandbox mode */ 
-- MariaDB dump 10.19  Distrib 10.11.20-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: ops-ci
-- ------------------------------------------------------
-- Server version	10.11.20-MariaDB-ubu2404

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
(1,1,'en','name','University of Bologna'),
(2,2,'en','name','University of Windsor'),
(3,3,'en','name','University of Alberta'),
(4,4,'en','name','University of Victoria'),
(5,5,'en','name','University of Alberta'),
(6,6,'en','name','University of Victoria'),
(7,7,'en','name','Alexandria University'),
(8,8,'en','name','University of Toronto'),
(9,9,'en','name','University College Cork'),
(10,10,'en','name','Indiana University'),
(11,11,'en','name','Indiana University'),
(12,12,'en','name','University of Rome'),
(13,13,'en','name','University of Cape Town'),
(14,14,'en','name','Aalborg University'),
(15,15,'en','name','Stanford University'),
(16,16,'en','name','Stanford University'),
(17,17,'en','name','Australian National University'),
(18,18,'en','name','University of Cape Town'),
(19,19,'en','name','University of Wolverhampton'),
(20,20,'en','name','University of Nairobi'),
(21,21,'en','name','Barcelona University'),
(22,22,'en','name','University of Tehran'),
(23,23,'en','name','University of Windsor'),
(24,24,'en','name','CUNY');
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
(2,2,NULL),
(3,5,NULL),
(4,6,NULL),
(5,7,NULL),
(6,8,NULL),
(7,9,NULL),
(8,10,NULL),
(9,11,NULL),
(10,12,NULL),
(11,13,NULL),
(12,14,NULL),
(13,15,NULL),
(14,16,NULL),
(15,17,NULL),
(16,18,NULL),
(17,19,NULL),
(18,20,NULL),
(19,21,NULL),
(20,22,NULL),
(21,23,NULL),
(22,24,NULL),
(23,25,NULL),
(24,26,NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='More data about authors, including localized properties such as their name and affiliation.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `author_settings`
--

LOCK TABLES `author_settings` WRITE;
/*!40000 ALTER TABLE `author_settings` DISABLE KEYS */;
INSERT INTO `author_settings` VALUES
(1,1,'','country','IT'),
(2,1,'en','familyName','Corino'),
(3,1,'en','givenName','Carlo'),
(4,2,'','country','CA'),
(5,2,'en','familyName','Kwantes'),
(6,2,'en','givenName','Catherine'),
(9,3,'','country','FI'),
(10,3,'en','familyName','Kekkonen'),
(11,3,'fr_CA','familyName',NULL),
(12,3,'en','givenName','Urho'),
(13,3,'fr_CA','givenName',NULL),
(29,5,'','country','CA'),
(30,5,'en','familyName','Montgomerie'),
(31,5,'en','givenName','Craig'),
(32,6,'','country','CA'),
(33,6,'en','familyName','Irvine'),
(34,6,'en','givenName','Mark'),
(35,6,'en','organizationName',NULL),
(36,6,'fr_CA','organizationName',NULL),
(37,7,'','country','CA'),
(38,7,'en','familyName','Montgomerie'),
(39,7,'en','givenName','Craig'),
(40,8,'','country','CA'),
(41,8,'en','familyName','Irvine'),
(42,8,'en','givenName','Mark'),
(43,9,'','country','EG'),
(44,9,'en','familyName','Diouf'),
(45,9,'en','givenName','Diaga'),
(46,10,'','country','CA'),
(47,10,'en','familyName','Phillips'),
(48,10,'en','givenName','Dana'),
(49,11,'','country','IE'),
(50,11,'en','familyName','Sokoloff'),
(51,11,'en','givenName','Domatilia'),
(52,12,'','country','US'),
(53,12,'en','familyName','Ostrom'),
(54,12,'en','givenName','Elinor'),
(55,13,'','country','US'),
(56,13,'en','familyName','van Laerhoven'),
(57,13,'en','givenName','Frank'),
(58,13,'en','organizationName',NULL),
(59,13,'fr_CA','organizationName',NULL),
(60,14,'','country','IT'),
(61,14,'en','familyName','Paglieri'),
(62,14,'en','givenName','Fabio'),
(63,15,'','country','ZA'),
(64,15,'en','familyName','Mwandenga'),
(65,15,'en','givenName','John'),
(66,16,'','country','DK'),
(67,16,'en','familyName','Novak'),
(68,16,'en','givenName','John'),
(69,17,'','country','US'),
(70,17,'en','familyName','Al-Khafaji'),
(71,17,'en','givenName','Karim'),
(72,18,'','country','US'),
(73,18,'en','familyName','Morse'),
(74,18,'en','givenName','Margaret'),
(75,18,'en','organizationName',NULL),
(76,18,'fr_CA','organizationName',NULL),
(77,19,'','country','AU'),
(78,19,'en','familyName','Christopher'),
(79,19,'en','givenName','Leo'),
(80,20,'','country','ZA'),
(81,20,'en','familyName','Kumiega'),
(82,20,'en','givenName','Lise'),
(83,21,'','country','GB'),
(84,21,'en','familyName','Daniel'),
(85,21,'en','givenName','Patricia'),
(86,22,'','country','KE'),
(87,22,'en','familyName','Baiyewu'),
(88,22,'en','givenName','Rana'),
(89,23,'','country','ES'),
(90,23,'en','familyName','Rossi'),
(91,23,'en','givenName','Rosanna'),
(92,24,'','country','IR'),
(93,24,'en','familyName','Karbasizaed'),
(94,24,'en','givenName','Vajiheh'),
(95,25,'','country','CA'),
(96,25,'en','familyName','Williamson'),
(97,25,'en','givenName','Valerie'),
(98,26,'','country','US'),
(99,26,'en','familyName','Woods'),
(100,26,'en','givenName','Zita');
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
  `email` varchar(90) DEFAULT NULL,
  `include_in_browse` smallint(6) NOT NULL DEFAULT 1,
  `publication_id` bigint(20) NOT NULL,
  `seq` double NOT NULL DEFAULT 0,
  `contributor_type` enum('PERSON','ORGANIZATION','ANONYMOUS') NOT NULL DEFAULT 'PERSON',
  PRIMARY KEY (`author_id`),
  KEY `authors_publication_id` (`publication_id`),
  CONSTRAINT `authors_publication_id` FOREIGN KEY (`publication_id`) REFERENCES `publications` (`publication_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='The authors of a publication.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `authors`
--

LOCK TABLES `authors` WRITE;
/*!40000 ALTER TABLE `authors` DISABLE KEYS */;
INSERT INTO `authors` VALUES
(1,'ccorino@mailinator.com',1,1,0,'PERSON'),
(2,'ckwantes@mailinator.com',1,2,0,'PERSON'),
(3,'notanemailukk@mailinator.com',1,2,1,'PERSON'),
(5,'cmontgomerie@mailinator.com',1,3,0,'PERSON'),
(6,'mirvine@mailinator.com',1,3,1,'PERSON'),
(7,'cmontgomerie@mailinator.com',1,4,0,'PERSON'),
(8,'mirvine@mailinator.com',1,4,1,'PERSON'),
(9,'ddiouf@mailinator.com',1,5,0,'PERSON'),
(10,'dphillips@mailinator.com',1,6,0,'PERSON'),
(11,'dsokoloff@mailinator.com',1,7,0,'PERSON'),
(12,'eostrom@mailinator.com',1,8,0,'PERSON'),
(13,'fvanlaerhoven@mailinator.com',1,8,1,'PERSON'),
(14,'fpaglieri@mailinator.com',1,9,0,'PERSON'),
(15,'jmwandenga@mailinator.com',1,10,0,'PERSON'),
(16,'jnovak@mailinator.com',1,11,0,'PERSON'),
(17,'kalkhafaji@mailinator.com',1,12,0,'PERSON'),
(18,'mmorse@mailinator.com',1,12,1,'PERSON'),
(19,'lchristopher@mailinator.com',1,13,0,'PERSON'),
(20,'lkumiega@mailinator.com',1,14,0,'PERSON'),
(21,'pdaniel@mailinator.com',1,15,0,'PERSON'),
(22,'rbaiyewu@mailinator.com',1,16,0,'PERSON'),
(23,'rrossi@mailinator.com',1,17,0,'PERSON'),
(24,'vkarbasizaed@mailinator.com',1,18,0,'PERSON'),
(25,'vwilliamson@mailinator.com',1,19,0,'PERSON'),
(26,'zwoods@mailinator.com',1,20,0,'PERSON');
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
  `path` varchar(255) NOT NULL,
  `image` text DEFAULT NULL,
  PRIMARY KEY (`category_id`),
  UNIQUE KEY `category_path` (`context_id`,`path`),
  KEY `category_context_id` (`context_id`),
  KEY `category_context_parent_id` (`context_id`,`parent_id`),
  KEY `category_parent_id` (`parent_id`),
  CONSTRAINT `categories_context_id_foreign` FOREIGN KEY (`context_id`) REFERENCES `servers` (`server_id`) ON DELETE CASCADE,
  CONSTRAINT `categories_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `categories` (`category_id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='Categories permit the organization of submissions into a heirarchical structure.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES
(1,1,NULL,'social-sciences',NULL),
(2,1,1,'sociology',NULL),
(3,1,1,'anthropology',NULL),
(4,1,NULL,'applied-science',NULL),
(5,1,4,'comp-sci',NULL),
(6,1,5,'computer-vision',NULL),
(7,1,4,'eng',NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='More data about categories, including localized properties such as names.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category_settings`
--

LOCK TABLES `category_settings` WRITE;
/*!40000 ALTER TABLE `category_settings` DISABLE KEYS */;
INSERT INTO `category_settings` VALUES
(1,1,'','sortOption','datePublished-DESC'),
(2,1,'en','title','Social Sciences'),
(6,2,'','sortOption','datePublished-DESC'),
(7,2,'en','title','Sociology'),
(11,3,'','sortOption','datePublished-DESC'),
(12,3,'en','title','Anthropology'),
(16,4,'','sortOption','datePublished-DESC'),
(17,4,'en','title','Applied Science'),
(21,5,'','sortOption','datePublished-DESC'),
(22,5,'en','title','Computer Science'),
(26,6,'','sortOption','datePublished-DESC'),
(27,6,'en','title','Computer Vision'),
(31,7,'','sortOption','datePublished-DESC'),
(32,7,'en','title','Engineering');
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
-- Table structure for table `contributor_role_settings`
--

DROP TABLE IF EXISTS `contributor_role_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `contributor_role_settings` (
  `contributor_role_setting_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `contributor_role_id` bigint(20) NOT NULL,
  `setting_name` varchar(255) NOT NULL,
  `setting_value` varchar(255) DEFAULT NULL,
  `locale` varchar(28) NOT NULL,
  PRIMARY KEY (`contributor_role_setting_id`),
  UNIQUE KEY `contributor_role_id_setting_name_locale_unique` (`contributor_role_id`,`setting_name`,`locale`),
  CONSTRAINT `contributor_role_id_settings_foreign` FOREIGN KEY (`contributor_role_id`) REFERENCES `contributor_roles` (`contributor_role_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='Contributor role settings';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contributor_role_settings`
--

LOCK TABLES `contributor_role_settings` WRITE;
/*!40000 ALTER TABLE `contributor_role_settings` DISABLE KEYS */;
INSERT INTO `contributor_role_settings` VALUES
(1,1,'name','Author','en'),
(2,2,'name','Translator','en');
/*!40000 ALTER TABLE `contributor_role_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contributor_roles`
--

DROP TABLE IF EXISTS `contributor_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `contributor_roles` (
  `contributor_role_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `context_id` bigint(20) NOT NULL,
  `contributor_role_identifier` enum('AUTHOR','EDITOR','CHAIR','REVIEWER','REVIEW_ASSISTANT','STATS_REVIEWER','REVIEWER_EXTERNAL','READER','TRANSLATOR','OTHER') NOT NULL,
  PRIMARY KEY (`contributor_role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='The list of the contributor roles';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contributor_roles`
--

LOCK TABLES `contributor_roles` WRITE;
/*!40000 ALTER TABLE `contributor_roles` DISABLE KEYS */;
INSERT INTO `contributor_roles` VALUES
(1,1,'AUTHOR'),
(2,1,'TRANSLATOR');
/*!40000 ALTER TABLE `contributor_roles` ENABLE KEYS */;
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
/*!40101 SET character_set_client = utf8mb4 */;
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
-- Table structure for table `credit_contributor_roles`
--

DROP TABLE IF EXISTS `credit_contributor_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `credit_contributor_roles` (
  `credit_contributor_role_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `contributor_id` bigint(20) NOT NULL,
  `credit_role_id` bigint(20) DEFAULT NULL,
  `credit_degree` enum('LEAD','EQUAL','SUPPORTING') DEFAULT NULL,
  `contributor_role_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`credit_contributor_role_id`),
  UNIQUE KEY `contributor_id_credit_role_id_unique` (`contributor_id`,`credit_role_id`),
  UNIQUE KEY `contributor_id_contributor_role_id_unique` (`contributor_id`,`contributor_role_id`),
  KEY `credit_role_id_foreign` (`credit_role_id`),
  KEY `contributor_role_id_foreign` (`contributor_role_id`),
  CONSTRAINT `contributor_id_author_id_foreign` FOREIGN KEY (`contributor_id`) REFERENCES `authors` (`author_id`) ON DELETE CASCADE,
  CONSTRAINT `contributor_role_id_foreign` FOREIGN KEY (`contributor_role_id`) REFERENCES `contributor_roles` (`contributor_role_id`) ON DELETE CASCADE,
  CONSTRAINT `credit_role_id_foreign` FOREIGN KEY (`credit_role_id`) REFERENCES `credit_roles` (`credit_role_id`) ON DELETE CASCADE,
  CONSTRAINT `check_xor_credit_contributor_role` CHECK (`credit_role_id` is not null and `contributor_role_id` is null or `contributor_role_id` is not null and `credit_role_id` is null)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='The CRediT Roles and the degrees of contributors, and contributor roles';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `credit_contributor_roles`
--

LOCK TABLES `credit_contributor_roles` WRITE;
/*!40000 ALTER TABLE `credit_contributor_roles` DISABLE KEYS */;
INSERT INTO `credit_contributor_roles` VALUES
(1,1,NULL,NULL,1),
(2,2,NULL,NULL,1),
(3,3,NULL,NULL,1),
(5,5,NULL,NULL,1),
(6,6,NULL,NULL,1),
(7,7,NULL,NULL,1),
(8,8,NULL,NULL,1),
(9,9,NULL,NULL,1),
(10,10,NULL,NULL,1),
(11,11,NULL,NULL,1),
(12,12,NULL,NULL,1),
(13,13,NULL,NULL,1),
(14,14,NULL,NULL,1),
(15,15,NULL,NULL,1),
(16,16,NULL,NULL,1),
(17,17,NULL,NULL,1),
(18,18,NULL,NULL,1),
(19,19,NULL,NULL,1),
(20,20,NULL,NULL,1),
(21,21,NULL,NULL,1),
(22,22,NULL,NULL,1),
(23,23,NULL,NULL,1),
(24,24,NULL,NULL,1),
(25,25,NULL,NULL,1),
(26,26,NULL,NULL,1);
/*!40000 ALTER TABLE `credit_contributor_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `credit_roles`
--

DROP TABLE IF EXISTS `credit_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `credit_roles` (
  `credit_role_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `credit_role_identifier` varchar(255) NOT NULL,
  PRIMARY KEY (`credit_role_id`),
  UNIQUE KEY `credit_role_identifier_unique` (`credit_role_identifier`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='The list of the CRediT Roles';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `credit_roles`
--

LOCK TABLES `credit_roles` WRITE;
/*!40000 ALTER TABLE `credit_roles` DISABLE KEYS */;
INSERT INTO `credit_roles` VALUES
(1,'https://credit.niso.org/contributor-roles/conceptualization/'),
(2,'https://credit.niso.org/contributor-roles/data-curation/'),
(3,'https://credit.niso.org/contributor-roles/formal-analysis/'),
(4,'https://credit.niso.org/contributor-roles/funding-acquisition/'),
(5,'https://credit.niso.org/contributor-roles/investigation/'),
(6,'https://credit.niso.org/contributor-roles/methodology/'),
(7,'https://credit.niso.org/contributor-roles/project-administration/'),
(8,'https://credit.niso.org/contributor-roles/resources/'),
(9,'https://credit.niso.org/contributor-roles/software/'),
(10,'https://credit.niso.org/contributor-roles/supervision/'),
(11,'https://credit.niso.org/contributor-roles/validation/'),
(12,'https://credit.niso.org/contributor-roles/visualization/'),
(13,'https://credit.niso.org/contributor-roles/writing-original-draft/'),
(14,'https://credit.niso.org/contributor-roles/writing-review-editing/');
/*!40000 ALTER TABLE `credit_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `data_citation_settings`
--

DROP TABLE IF EXISTS `data_citation_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `data_citation_settings` (
  `data_citation_setting_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `data_citation_id` bigint(20) NOT NULL,
  `locale` varchar(28) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` mediumtext DEFAULT NULL,
  PRIMARY KEY (`data_citation_setting_id`),
  UNIQUE KEY `data_citation_settings_unique` (`data_citation_id`,`locale`,`setting_name`),
  KEY `data_citation_settings_data_citation_id` (`data_citation_id`),
  CONSTRAINT `data_citation_settings_data_citation_id` FOREIGN KEY (`data_citation_id`) REFERENCES `data_citations` (`data_citation_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='Additional data about data citations, including localized content.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `data_citation_settings`
--

LOCK TABLES `data_citation_settings` WRITE;
/*!40000 ALTER TABLE `data_citation_settings` DISABLE KEYS */;
/*!40000 ALTER TABLE `data_citation_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `data_citations`
--

DROP TABLE IF EXISTS `data_citations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `data_citations` (
  `data_citation_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `publication_id` bigint(20) NOT NULL,
  `seq` bigint(20) NOT NULL DEFAULT 0,
  PRIMARY KEY (`data_citation_id`),
  KEY `data_citations_publication` (`publication_id`),
  CONSTRAINT `data_citations_publication` FOREIGN KEY (`publication_id`) REFERENCES `publications` (`publication_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='A data citation pointing to a related data set.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `data_citations`
--

LOCK TABLES `data_citations` WRITE;
/*!40000 ALTER TABLE `data_citations` DISABLE KEYS */;
/*!40000 ALTER TABLE `data_citations` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='Editorial decisions recorded on a submission, such as decisions to accept or decline the submission, as well as decisions to send for review, send to copyediting, request revisions, and more.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `edit_decisions`
--

LOCK TABLES `edit_decisions` WRITE;
/*!40000 ALTER TABLE `edit_decisions` DISABLE KEYS */;
INSERT INTO `edit_decisions` VALUES
(1,2,NULL,5,NULL,3,33,'2026-11-21 13:30:51'),
(2,3,NULL,5,NULL,3,33,'2026-11-21 13:31:13'),
(3,3,NULL,6,NULL,3,34,'2026-11-21 13:31:17'),
(4,3,NULL,5,NULL,3,33,'2026-11-21 13:31:20'),
(5,4,NULL,5,NULL,3,8,'2026-11-21 13:31:49'),
(6,4,NULL,5,NULL,3,16,'2026-11-21 13:31:54'),
(7,4,NULL,5,NULL,3,8,'2026-11-21 13:31:58'),
(8,5,NULL,5,NULL,3,33,'2026-11-21 13:32:21'),
(9,5,NULL,6,NULL,3,34,'2026-11-21 13:32:25'),
(10,5,NULL,5,NULL,3,33,'2026-11-21 13:32:30'),
(11,6,NULL,5,NULL,3,33,'2026-11-21 13:32:52'),
(12,7,NULL,5,NULL,3,33,'2026-11-21 13:33:14'),
(13,8,NULL,5,NULL,3,33,'2026-11-21 13:33:36'),
(14,9,NULL,5,NULL,3,33,'2026-11-21 13:33:58'),
(15,10,NULL,5,NULL,3,33,'2026-11-21 13:34:20'),
(16,11,NULL,5,NULL,3,33,'2026-11-21 13:34:42'),
(17,12,NULL,5,NULL,3,33,'2026-11-21 13:35:04'),
(18,13,NULL,5,NULL,3,33,'2026-11-21 13:35:26'),
(19,14,NULL,5,NULL,3,33,'2026-11-21 13:35:49'),
(20,15,NULL,5,NULL,3,33,'2026-11-21 13:36:13'),
(21,16,NULL,5,NULL,3,33,'2026-11-21 13:36:35'),
(22,17,NULL,5,NULL,3,33,'2026-11-21 13:36:57'),
(23,18,NULL,5,NULL,3,33,'2026-11-21 13:37:18'),
(24,19,NULL,5,NULL,3,33,'2026-11-21 13:37:40');
/*!40000 ALTER TABLE `edit_decisions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `edit_task_participants`
--

DROP TABLE IF EXISTS `edit_task_participants`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `edit_task_participants` (
  `edit_task_participant_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `edit_task_id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `is_responsible` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`edit_task_participant_id`),
  UNIQUE KEY `edit_task_participants_unique` (`edit_task_id`,`user_id`),
  KEY `edit_task_participants_edit_task_id` (`edit_task_id`),
  KEY `edit_task_participants_user_id` (`user_id`),
  CONSTRAINT `edit_task_participants_edit_task_id_foreign` FOREIGN KEY (`edit_task_id`) REFERENCES `edit_tasks` (`edit_task_id`) ON DELETE CASCADE,
  CONSTRAINT `edit_task_participants_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='The users assigned to a task or discussion.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `edit_task_participants`
--

LOCK TABLES `edit_task_participants` WRITE;
/*!40000 ALTER TABLE `edit_task_participants` DISABLE KEYS */;
/*!40000 ALTER TABLE `edit_task_participants` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `edit_task_settings`
--

DROP TABLE IF EXISTS `edit_task_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `edit_task_settings` (
  `edit_task_setting_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `edit_task_id` bigint(20) NOT NULL,
  `locale` varchar(28) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` mediumtext DEFAULT NULL,
  PRIMARY KEY (`edit_task_setting_id`),
  UNIQUE KEY `edit_task_settings_unique` (`edit_task_id`,`locale`,`setting_name`),
  KEY `edit_task_settings_edit_task_id` (`edit_task_id`),
  CONSTRAINT `edit_task_settings_edit_task_id_foreign` FOREIGN KEY (`edit_task_id`) REFERENCES `edit_tasks` (`edit_task_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='More data about editorial tasks, including localized properties such as the name.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `edit_task_settings`
--

LOCK TABLES `edit_task_settings` WRITE;
/*!40000 ALTER TABLE `edit_task_settings` DISABLE KEYS */;
/*!40000 ALTER TABLE `edit_task_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `edit_task_template_settings`
--

DROP TABLE IF EXISTS `edit_task_template_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `edit_task_template_settings` (
  `edit_task_template_setting_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `edit_task_template_id` bigint(20) unsigned NOT NULL,
  `locale` varchar(28) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` mediumtext DEFAULT NULL,
  PRIMARY KEY (`edit_task_template_setting_id`),
  UNIQUE KEY `edit_task__template_settings_unique` (`edit_task_template_id`,`locale`,`setting_name`),
  KEY `edit_task_template_settings_edit_task_id` (`edit_task_template_id`),
  CONSTRAINT `edit_task_template_settings_edit_task_template_id_foreign` FOREIGN KEY (`edit_task_template_id`) REFERENCES `edit_task_templates` (`edit_task_template_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='includes additional and multilingual data about the editorial task templates.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `edit_task_template_settings`
--

LOCK TABLES `edit_task_template_settings` WRITE;
/*!40000 ALTER TABLE `edit_task_template_settings` DISABLE KEYS */;
INSERT INTO `edit_task_template_settings` VALUES
(1,1,'en','title','Discussion (Production)'),
(2,1,'fr_CA','title','Discussion (production)'),
(3,1,'en','description','Please enter your message.'),
(4,1,'fr_CA','description','Prière de saisir votre message.'),
(5,2,'en','title','Assign Editor'),
(6,2,'fr_CA','title','Assigner un-e rédacteur-trice'),
(7,2,'en','description',''),
(8,2,'fr_CA','description','');
/*!40000 ALTER TABLE `edit_task_template_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `edit_task_template_user_groups`
--

DROP TABLE IF EXISTS `edit_task_template_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `edit_task_template_user_groups` (
  `edit_task_template_id` bigint(20) unsigned NOT NULL,
  `user_group_id` bigint(20) NOT NULL,
  PRIMARY KEY (`edit_task_template_id`,`user_group_id`),
  KEY `ett_ug_user_group_idx` (`user_group_id`),
  CONSTRAINT `ett_ug_template_fk` FOREIGN KEY (`edit_task_template_id`) REFERENCES `edit_task_templates` (`edit_task_template_id`) ON DELETE CASCADE,
  CONSTRAINT `ett_ug_user_group_fk` FOREIGN KEY (`user_group_id`) REFERENCES `user_groups` (`user_group_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='Links task templates to user groups.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `edit_task_template_user_groups`
--

LOCK TABLES `edit_task_template_user_groups` WRITE;
/*!40000 ALTER TABLE `edit_task_template_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `edit_task_template_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `edit_task_templates`
--

DROP TABLE IF EXISTS `edit_task_templates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `edit_task_templates` (
  `edit_task_template_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `stage_id` smallint(5) unsigned NOT NULL,
  `context_id` bigint(20) NOT NULL COMMENT 'Journal/press ID for scoping templates',
  `include` tinyint(1) NOT NULL DEFAULT 0,
  `due_interval` enum('P1W','P2W','P3W','P4W','P1M','P1M15D','P2M','P2M15D','P3M') DEFAULT NULL COMMENT 'Interval after which the task is due, from the time it is created.',
  `type` enum('1','2') NOT NULL DEFAULT '1',
  `restrict_to_user_groups` tinyint(1) NOT NULL DEFAULT 0 COMMENT 'Whether the template is restricted to user groups defined in the many to many relationship.',
  `key` varchar(255) DEFAULT NULL COMMENT 'Indicates the unique key of the default template',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`edit_task_template_id`),
  UNIQUE KEY `edit_task_templates_key_context_id_unique` (`key`,`context_id`),
  KEY `edit_task_templates_context_id_idx` (`context_id`),
  CONSTRAINT `edit_task_templates_context_fk` FOREIGN KEY (`context_id`) REFERENCES `servers` (`server_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='Represents templates for the editorial tasks.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `edit_task_templates`
--

LOCK TABLES `edit_task_templates` WRITE;
/*!40000 ALTER TABLE `edit_task_templates` DISABLE KEYS */;
INSERT INTO `edit_task_templates` VALUES
(1,5,1,0,NULL,'1',0,'DISCUSSION_NOTIFICATION_PRODUCTION','2026-11-21 13:26:45','2026-11-21 13:26:45'),
(2,5,1,0,NULL,'1',0,'EDITOR_ASSIGN_PRODUCTION','2026-11-21 13:26:45','2026-11-21 13:26:45');
/*!40000 ALTER TABLE `edit_task_templates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `edit_tasks`
--

DROP TABLE IF EXISTS `edit_tasks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `edit_tasks` (
  `edit_task_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `assoc_type` bigint(20) NOT NULL,
  `assoc_id` bigint(20) NOT NULL,
  `stage_id` smallint(6) NOT NULL,
  `seq` double NOT NULL DEFAULT 0,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `closed` smallint(6) NOT NULL DEFAULT 0,
  `date_due` datetime DEFAULT NULL,
  `created_by` bigint(20) DEFAULT NULL,
  `started_by` bigint(20) DEFAULT NULL,
  `type` smallint(5) unsigned NOT NULL DEFAULT 1,
  `date_started` datetime DEFAULT NULL,
  `date_closed` datetime DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `edit_task_template_id` bigint(20) unsigned DEFAULT NULL,
  PRIMARY KEY (`edit_task_id`),
  KEY `edit_tasks_created_by_foreign` (`created_by`),
  KEY `edit_tasks_started_by_foreign` (`started_by`),
  KEY `edit_tasks_edit_task_template_id` (`edit_task_template_id`),
  KEY `edit_tasks_assoc_id` (`assoc_type`,`assoc_id`),
  CONSTRAINT `edit_task_task_template_id_fk` FOREIGN KEY (`edit_task_template_id`) REFERENCES `edit_task_templates` (`edit_task_template_id`) ON DELETE SET NULL,
  CONSTRAINT `edit_tasks_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`user_id`),
  CONSTRAINT `edit_tasks_started_by_foreign` FOREIGN KEY (`started_by`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='Editorial tasks and discussions, usually related to a submission, created by editors, authors and other editorial staff.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `edit_tasks`
--

LOCK TABLES `edit_tasks` WRITE;
/*!40000 ALTER TABLE `edit_tasks` DISABLE KEYS */;
/*!40000 ALTER TABLE `edit_tasks` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='A record of email messages that are sent in relation to an associated entity, such as a submission.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `email_log`
--

LOCK TABLES `email_log` WRITE;
/*!40000 ALTER TABLE `email_log` DISABLE KEYS */;
INSERT INTO `email_log` VALUES
(1,1048585,1,NULL,'2026-11-21 13:29:48',536870914,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Carlo Corino\" <ccorino@mailinator.com>','','','Thank you for your submission to Public Knowledge Preprint Server','<p>Dear Carlo Corino,</p><p>Thank you for your submission to Public Knowledge Preprint Server. We have received your preprint, The influence of lactation on the quantity and quality of cashmere production, and a moderator  will see it soon. Once the moderator has reviewed your submission, they will post your preprint or contact you.</p><p>You can view your submission and track its progress through the editorial process at the following location:</p><p>Submission URL: <a href=\"http://localhost/index.php/publicknowledge/en/dashboard/mySubmissions?workflowSubmissionId=1\">http://localhost/index.php/publicknowledge/en/dashboard/mySubmissions?workflowSubmissionId=1</a></p><p>If you have been logged out, you can login again with the username ccorino.</p><p>If you have any questions, please contact me from your <a href=\"http://localhost/index.php/publicknowledge/en/dashboard/mySubmissions?workflowSubmissionId=1\">submission dashboard</a>.</p><p>Thank you for considering Public Knowledge Preprint Server as a venue for your work.</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Preprint Server</a>.</p>'),
(2,1048585,2,NULL,'2026-11-21 13:30:43',536870914,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Catherine Kwantes\" <ckwantes@mailinator.com>','','','Thank you for your submission to Public Knowledge Preprint Server','<p>Dear Catherine Kwantes,</p><p>Thank you for your submission to Public Knowledge Preprint Server. We have received your preprint, The Facets Of Job Satisfaction: A Nine-Nation Comparative Study Of Construct Equivalence, and a moderator  will see it soon. Once the moderator has reviewed your submission, they will post your preprint or contact you.</p><p>You can view your submission and track its progress through the editorial process at the following location:</p><p>Submission URL: <a href=\"http://localhost/index.php/publicknowledge/en/dashboard/mySubmissions?workflowSubmissionId=2\">http://localhost/index.php/publicknowledge/en/dashboard/mySubmissions?workflowSubmissionId=2</a></p><p>If you have been logged out, you can login again with the username ckwantes.</p><p>If you have any questions, please contact me from your <a href=\"http://localhost/index.php/publicknowledge/en/dashboard/mySubmissions?workflowSubmissionId=2\">submission dashboard</a>.</p><p>Thank you for considering Public Knowledge Preprint Server as a venue for your work.</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Preprint Server</a>.</p>'),
(3,1048585,2,NULL,'2026-11-21 13:30:43',536870914,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Urho Kekkonen\" <notanemailukk@mailinator.com>','','','Submission Acknowledgement','<p>Dear Urho Kekkonen,</p><p>You have been named as a co-author on a preprint submitted to Public Knowledge Preprint Server. The submitter, Catherine Kwantes, provided the following details:</p><p>The Facets Of Job Satisfaction: A Nine-Nation Comparative Study Of Construct Equivalence<br>Catherine Kwantes, University of Windsor<br>Urho Kekkonen, </p><p>If any of these details are incorrect, or you do not wish to be named on this preprint, please contact me.</p><p>Thank you for considering this server as a venue for your work.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Preprint Server</a>.</p>'),
(4,1048585,3,NULL,'2026-11-21 13:31:09',536870914,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Craig Montgomerie\" <cmontgomerie@mailinator.com>','','','Thank you for your submission to Public Knowledge Preprint Server','<p>Dear Craig Montgomerie,</p><p>Thank you for your submission to Public Knowledge Preprint Server. We have received your preprint, Computer Skill Requirements for New and Existing Teachers: Implications for Policy and Practice, and a moderator  will see it soon. Once the moderator has reviewed your submission, they will post your preprint or contact you.</p><p>You can view your submission and track its progress through the editorial process at the following location:</p><p>Submission URL: <a href=\"http://localhost/index.php/publicknowledge/en/dashboard/mySubmissions?workflowSubmissionId=3\">http://localhost/index.php/publicknowledge/en/dashboard/mySubmissions?workflowSubmissionId=3</a></p><p>If you have been logged out, you can login again with the username cmontgomerie.</p><p>If you have any questions, please contact me from your <a href=\"http://localhost/index.php/publicknowledge/en/dashboard/mySubmissions?workflowSubmissionId=3\">submission dashboard</a>.</p><p>Thank you for considering Public Knowledge Preprint Server as a venue for your work.</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Preprint Server</a>.</p>'),
(5,1048585,3,NULL,'2026-11-21 13:31:09',536870914,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Mark Irvine\" <mirvine@mailinator.com>','','','Submission Acknowledgement','<p>Dear Mark Irvine,</p><p>You have been named as a co-author on a preprint submitted to Public Knowledge Preprint Server. The submitter, Craig Montgomerie, provided the following details:</p><p>Computer Skill Requirements for New and Existing Teachers: Implications for Policy and Practice<br>Craig Montgomerie, University of Alberta<br>Mark Irvine, University of Victoria</p><p>If any of these details are incorrect, or you do not wish to be named on this preprint, please contact me.</p><p>Thank you for considering this server as a venue for your work.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Preprint Server</a>.</p>'),
(6,1048585,4,NULL,'2026-11-21 13:31:43',536870914,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Diaga Diouf\" <ddiouf@mailinator.com>','','','Thank you for your submission to Public Knowledge Preprint Server','<p>Dear Diaga Diouf,</p><p>Thank you for your submission to Public Knowledge Preprint Server. We have received your preprint, Genetic transformation of forest trees, and a moderator  will see it soon. Once the moderator has reviewed your submission, they will post your preprint or contact you.</p><p>You can view your submission and track its progress through the editorial process at the following location:</p><p>Submission URL: <a href=\"http://localhost/index.php/publicknowledge/en/dashboard/mySubmissions?workflowSubmissionId=4\">http://localhost/index.php/publicknowledge/en/dashboard/mySubmissions?workflowSubmissionId=4</a></p><p>If you have been logged out, you can login again with the username ddiouf.</p><p>If you have any questions, please contact me from your <a href=\"http://localhost/index.php/publicknowledge/en/dashboard/mySubmissions?workflowSubmissionId=4\">submission dashboard</a>.</p><p>Thank you for considering Public Knowledge Preprint Server as a venue for your work.</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Preprint Server</a>.</p>'),
(7,1048585,4,3,'2026-11-21 13:31:49',805306369,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Diaga Diouf\" <ddiouf@mailinator.com>','','','Your submission has been declined','<p>Dear Diaga Diouf,</p><p>I’m sorry to inform you that, after reviewing your submission, \"Genetic transformation of forest trees\", the editor has found that it does not meet our requirements for publication in Public Knowledge Preprint Server.</p><p>I wish you success if you consider submitting your work elsewhere.</p><p>Kind regards,</p><p>Daniel Barnes</p>'),
(8,1048585,4,3,'2026-11-21 13:31:54',805306369,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Diaga Diouf\" <ddiouf@mailinator.com>','','','We have reversed the decision to decline your submission','<p>Dear Diaga Diouf,</p>\n<p>The decision to decline your submission, Genetic transformation of forest trees, has been reversed. \nA moderator will look further at your submission before deciding whether to decline \nor post the submission.</p>\n<p>Occasionally, a decision to decline a submission will be recorded accidentally in \nour system and must be reverted. I apologize for any confusion this may have caused.</p>\n<p>We will contact you if we need any further assistance.</p>\n<p>If you have any questions, please contact me from your <a href=\"http://localhost/index.php/publicknowledge/en/dashboard/mySubmissions?workflowSubmissionId=4\">submission dashboard</a>.</p>\n<p>Kind regards,</p>\n<p><p>Daniel Barnes</p></p>'),
(9,1048585,4,3,'2026-11-21 13:31:58',805306369,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Diaga Diouf\" <ddiouf@mailinator.com>','','','Your submission has been declined','<p>Dear Diaga Diouf,</p><p>I’m sorry to inform you that, after reviewing your submission, \"Genetic transformation of forest trees\", the editor has found that it does not meet our requirements for publication in Public Knowledge Preprint Server.</p><p>I wish you success if you consider submitting your work elsewhere.</p><p>Kind regards,</p><p>Daniel Barnes</p>'),
(10,1048585,5,NULL,'2026-11-21 13:32:17',536870914,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Dana Phillips\" <dphillips@mailinator.com>','','','Thank you for your submission to Public Knowledge Preprint Server','<p>Dear Dana Phillips,</p><p>Thank you for your submission to Public Knowledge Preprint Server. We have received your preprint, Investigating the Shared Background Required for Argument: A Critique of Fogelin\'s Thesis on Deep Disagreement, and a moderator  will see it soon. Once the moderator has reviewed your submission, they will post your preprint or contact you.</p><p>You can view your submission and track its progress through the editorial process at the following location:</p><p>Submission URL: <a href=\"http://localhost/index.php/publicknowledge/en/dashboard/mySubmissions?workflowSubmissionId=5\">http://localhost/index.php/publicknowledge/en/dashboard/mySubmissions?workflowSubmissionId=5</a></p><p>If you have been logged out, you can login again with the username dphillips.</p><p>If you have any questions, please contact me from your <a href=\"http://localhost/index.php/publicknowledge/en/dashboard/mySubmissions?workflowSubmissionId=5\">submission dashboard</a>.</p><p>Thank you for considering Public Knowledge Preprint Server as a venue for your work.</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Preprint Server</a>.</p>'),
(11,1048585,6,NULL,'2026-11-21 13:32:48',536870914,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Domatilia Sokoloff\" <dsokoloff@mailinator.com>','','','Thank you for your submission to Public Knowledge Preprint Server','<p>Dear Domatilia Sokoloff,</p><p>Thank you for your submission to Public Knowledge Preprint Server. We have received your preprint, Developing efficacy beliefs in the classroom, and a moderator  will see it soon. Once the moderator has reviewed your submission, they will post your preprint or contact you.</p><p>You can view your submission and track its progress through the editorial process at the following location:</p><p>Submission URL: <a href=\"http://localhost/index.php/publicknowledge/en/dashboard/mySubmissions?workflowSubmissionId=6\">http://localhost/index.php/publicknowledge/en/dashboard/mySubmissions?workflowSubmissionId=6</a></p><p>If you have been logged out, you can login again with the username dsokoloff.</p><p>If you have any questions, please contact me from your <a href=\"http://localhost/index.php/publicknowledge/en/dashboard/mySubmissions?workflowSubmissionId=6\">submission dashboard</a>.</p><p>Thank you for considering Public Knowledge Preprint Server as a venue for your work.</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Preprint Server</a>.</p>'),
(12,1048585,7,NULL,'2026-11-21 13:33:10',536870914,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Elinor Ostrom\" <eostrom@mailinator.com>','','','Thank you for your submission to Public Knowledge Preprint Server','<p>Dear Elinor Ostrom,</p><p>Thank you for your submission to Public Knowledge Preprint Server. We have received your preprint, Developing efficacy beliefs in the classroom, and a moderator  will see it soon. Once the moderator has reviewed your submission, they will post your preprint or contact you.</p><p>You can view your submission and track its progress through the editorial process at the following location:</p><p>Submission URL: <a href=\"http://localhost/index.php/publicknowledge/en/dashboard/mySubmissions?workflowSubmissionId=7\">http://localhost/index.php/publicknowledge/en/dashboard/mySubmissions?workflowSubmissionId=7</a></p><p>If you have been logged out, you can login again with the username eostrom.</p><p>If you have any questions, please contact me from your <a href=\"http://localhost/index.php/publicknowledge/en/dashboard/mySubmissions?workflowSubmissionId=7\">submission dashboard</a>.</p><p>Thank you for considering Public Knowledge Preprint Server as a venue for your work.</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Preprint Server</a>.</p>'),
(13,1048585,7,NULL,'2026-11-21 13:33:10',536870914,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Frank van Laerhoven\" <fvanlaerhoven@mailinator.com>','','','Submission Acknowledgement','<p>Dear Frank van Laerhoven,</p><p>You have been named as a co-author on a preprint submitted to Public Knowledge Preprint Server. The submitter, Elinor Ostrom, provided the following details:</p><p>Developing efficacy beliefs in the classroom<br>Elinor Ostrom, Indiana University<br>Frank van Laerhoven, Indiana University</p><p>If any of these details are incorrect, or you do not wish to be named on this preprint, please contact me.</p><p>Thank you for considering this server as a venue for your work.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Preprint Server</a>.</p>'),
(14,1048585,8,NULL,'2026-11-21 13:33:32',536870914,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Fabio Paglieri\" <fpaglieri@mailinator.com>','','','Thank you for your submission to Public Knowledge Preprint Server','<p>Dear Fabio Paglieri,</p><p>Thank you for your submission to Public Knowledge Preprint Server. We have received your preprint, Hansen & Pinto: Reason Reclaimed, and a moderator  will see it soon. Once the moderator has reviewed your submission, they will post your preprint or contact you.</p><p>You can view your submission and track its progress through the editorial process at the following location:</p><p>Submission URL: <a href=\"http://localhost/index.php/publicknowledge/en/dashboard/mySubmissions?workflowSubmissionId=8\">http://localhost/index.php/publicknowledge/en/dashboard/mySubmissions?workflowSubmissionId=8</a></p><p>If you have been logged out, you can login again with the username fpaglieri.</p><p>If you have any questions, please contact me from your <a href=\"http://localhost/index.php/publicknowledge/en/dashboard/mySubmissions?workflowSubmissionId=8\">submission dashboard</a>.</p><p>Thank you for considering Public Knowledge Preprint Server as a venue for your work.</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Preprint Server</a>.</p>'),
(15,1048585,9,NULL,'2026-11-21 13:33:54',536870914,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"John Mwandenga\" <jmwandenga@mailinator.com>','','','Thank you for your submission to Public Knowledge Preprint Server','<p>Dear John Mwandenga,</p><p>Thank you for your submission to Public Knowledge Preprint Server. We have received your preprint, Signalling Theory Dividends: A Review Of The Literature And Empirical Evidence, and a moderator  will see it soon. Once the moderator has reviewed your submission, they will post your preprint or contact you.</p><p>You can view your submission and track its progress through the editorial process at the following location:</p><p>Submission URL: <a href=\"http://localhost/index.php/publicknowledge/en/dashboard/mySubmissions?workflowSubmissionId=9\">http://localhost/index.php/publicknowledge/en/dashboard/mySubmissions?workflowSubmissionId=9</a></p><p>If you have been logged out, you can login again with the username jmwandenga.</p><p>If you have any questions, please contact me from your <a href=\"http://localhost/index.php/publicknowledge/en/dashboard/mySubmissions?workflowSubmissionId=9\">submission dashboard</a>.</p><p>Thank you for considering Public Knowledge Preprint Server as a venue for your work.</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Preprint Server</a>.</p>'),
(16,1048585,10,NULL,'2026-11-21 13:34:16',536870914,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"John Novak\" <jnovak@mailinator.com>','','','Thank you for your submission to Public Knowledge Preprint Server','<p>Dear John Novak,</p><p>Thank you for your submission to Public Knowledge Preprint Server. We have received your preprint, Condensing Water Availability Models to Focus on Specific Water Management Systems, and a moderator  will see it soon. Once the moderator has reviewed your submission, they will post your preprint or contact you.</p><p>You can view your submission and track its progress through the editorial process at the following location:</p><p>Submission URL: <a href=\"http://localhost/index.php/publicknowledge/en/dashboard/mySubmissions?workflowSubmissionId=10\">http://localhost/index.php/publicknowledge/en/dashboard/mySubmissions?workflowSubmissionId=10</a></p><p>If you have been logged out, you can login again with the username jnovak.</p><p>If you have any questions, please contact me from your <a href=\"http://localhost/index.php/publicknowledge/en/dashboard/mySubmissions?workflowSubmissionId=10\">submission dashboard</a>.</p><p>Thank you for considering Public Knowledge Preprint Server as a venue for your work.</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Preprint Server</a>.</p>'),
(17,1048585,11,NULL,'2026-11-21 13:34:38',536870914,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Karim Al-Khafaji\" <kalkhafaji@mailinator.com>','','','Thank you for your submission to Public Knowledge Preprint Server','<p>Dear Karim Al-Khafaji,</p><p>Thank you for your submission to Public Knowledge Preprint Server. We have received your preprint, Learning Sustainable Design through Service, and a moderator  will see it soon. Once the moderator has reviewed your submission, they will post your preprint or contact you.</p><p>You can view your submission and track its progress through the editorial process at the following location:</p><p>Submission URL: <a href=\"http://localhost/index.php/publicknowledge/en/dashboard/mySubmissions?workflowSubmissionId=11\">http://localhost/index.php/publicknowledge/en/dashboard/mySubmissions?workflowSubmissionId=11</a></p><p>If you have been logged out, you can login again with the username kalkhafaji.</p><p>If you have any questions, please contact me from your <a href=\"http://localhost/index.php/publicknowledge/en/dashboard/mySubmissions?workflowSubmissionId=11\">submission dashboard</a>.</p><p>Thank you for considering Public Knowledge Preprint Server as a venue for your work.</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Preprint Server</a>.</p>'),
(18,1048585,11,NULL,'2026-11-21 13:34:38',536870914,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Margaret Morse\" <mmorse@mailinator.com>','','','Submission Acknowledgement','<p>Dear Margaret Morse,</p><p>You have been named as a co-author on a preprint submitted to Public Knowledge Preprint Server. The submitter, Karim Al-Khafaji, provided the following details:</p><p>Learning Sustainable Design through Service<br>Karim Al-Khafaji, Stanford University<br>Margaret Morse, Stanford University</p><p>If any of these details are incorrect, or you do not wish to be named on this preprint, please contact me.</p><p>Thank you for considering this server as a venue for your work.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Preprint Server</a>.</p>'),
(19,1048585,12,NULL,'2026-11-21 13:35:00',536870914,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Leo Christopher\" <lchristopher@mailinator.com>','','','Thank you for your submission to Public Knowledge Preprint Server','<p>Dear Leo Christopher,</p><p>Thank you for your submission to Public Knowledge Preprint Server. We have received your preprint, Sodium butyrate improves growth performance of weaned piglets during the first period after weaning, and a moderator  will see it soon. Once the moderator has reviewed your submission, they will post your preprint or contact you.</p><p>You can view your submission and track its progress through the editorial process at the following location:</p><p>Submission URL: <a href=\"http://localhost/index.php/publicknowledge/en/dashboard/mySubmissions?workflowSubmissionId=12\">http://localhost/index.php/publicknowledge/en/dashboard/mySubmissions?workflowSubmissionId=12</a></p><p>If you have been logged out, you can login again with the username lchristopher.</p><p>If you have any questions, please contact me from your <a href=\"http://localhost/index.php/publicknowledge/en/dashboard/mySubmissions?workflowSubmissionId=12\">submission dashboard</a>.</p><p>Thank you for considering Public Knowledge Preprint Server as a venue for your work.</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Preprint Server</a>.</p>'),
(20,1048585,13,NULL,'2026-11-21 13:35:22',536870914,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Lise Kumiega\" <lkumiega@mailinator.com>','','','Thank you for your submission to Public Knowledge Preprint Server','<p>Dear Lise Kumiega,</p><p>Thank you for your submission to Public Knowledge Preprint Server. We have received your preprint, Hydrologic Connectivity in the Edwards Aquifer between San Marcos Springs and Barton Springs during 2009 Drought Conditions, and a moderator  will see it soon. Once the moderator has reviewed your submission, they will post your preprint or contact you.</p><p>You can view your submission and track its progress through the editorial process at the following location:</p><p>Submission URL: <a href=\"http://localhost/index.php/publicknowledge/en/dashboard/mySubmissions?workflowSubmissionId=13\">http://localhost/index.php/publicknowledge/en/dashboard/mySubmissions?workflowSubmissionId=13</a></p><p>If you have been logged out, you can login again with the username lkumiega.</p><p>If you have any questions, please contact me from your <a href=\"http://localhost/index.php/publicknowledge/en/dashboard/mySubmissions?workflowSubmissionId=13\">submission dashboard</a>.</p><p>Thank you for considering Public Knowledge Preprint Server as a venue for your work.</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Preprint Server</a>.</p>'),
(21,1048585,14,NULL,'2026-11-21 13:35:44',536870914,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Patricia Daniel\" <pdaniel@mailinator.com>','','','Thank you for your submission to Public Knowledge Preprint Server','<p>Dear Patricia Daniel,</p><p>Thank you for your submission to Public Knowledge Preprint Server. We have received your preprint, Towards Designing an Intercultural Curriculum: A Case Study from the Atlantic Coast of Nicaragua, and a moderator  will see it soon. Once the moderator has reviewed your submission, they will post your preprint or contact you.</p><p>You can view your submission and track its progress through the editorial process at the following location:</p><p>Submission URL: <a href=\"http://localhost/index.php/publicknowledge/en/dashboard/mySubmissions?workflowSubmissionId=14\">http://localhost/index.php/publicknowledge/en/dashboard/mySubmissions?workflowSubmissionId=14</a></p><p>If you have been logged out, you can login again with the username pdaniel.</p><p>If you have any questions, please contact me from your <a href=\"http://localhost/index.php/publicknowledge/en/dashboard/mySubmissions?workflowSubmissionId=14\">submission dashboard</a>.</p><p>Thank you for considering Public Knowledge Preprint Server as a venue for your work.</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Preprint Server</a>.</p>'),
(22,1048585,15,NULL,'2026-11-21 13:36:09',536870914,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Rana Baiyewu\" <rbaiyewu@mailinator.com>','','','Thank you for your submission to Public Knowledge Preprint Server','<p>Dear Rana Baiyewu,</p><p>Thank you for your submission to Public Knowledge Preprint Server. We have received your preprint, Yam diseases and its management in Nigeria, and a moderator  will see it soon. Once the moderator has reviewed your submission, they will post your preprint or contact you.</p><p>You can view your submission and track its progress through the editorial process at the following location:</p><p>Submission URL: <a href=\"http://localhost/index.php/publicknowledge/en/dashboard/mySubmissions?workflowSubmissionId=15\">http://localhost/index.php/publicknowledge/en/dashboard/mySubmissions?workflowSubmissionId=15</a></p><p>If you have been logged out, you can login again with the username rbaiyewu.</p><p>If you have any questions, please contact me from your <a href=\"http://localhost/index.php/publicknowledge/en/dashboard/mySubmissions?workflowSubmissionId=15\">submission dashboard</a>.</p><p>Thank you for considering Public Knowledge Preprint Server as a venue for your work.</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Preprint Server</a>.</p>'),
(23,1048585,16,NULL,'2026-11-21 13:36:31',536870914,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Rosanna Rossi\" <rrossi@mailinator.com>','','','Thank you for your submission to Public Knowledge Preprint Server','<p>Dear Rosanna Rossi,</p><p>Thank you for your submission to Public Knowledge Preprint Server. We have received your preprint, Influence of long-term nutrition with different dietary fats on fatty acid composition of heavy pigs backfat, and a moderator  will see it soon. Once the moderator has reviewed your submission, they will post your preprint or contact you.</p><p>You can view your submission and track its progress through the editorial process at the following location:</p><p>Submission URL: <a href=\"http://localhost/index.php/publicknowledge/en/dashboard/mySubmissions?workflowSubmissionId=16\">http://localhost/index.php/publicknowledge/en/dashboard/mySubmissions?workflowSubmissionId=16</a></p><p>If you have been logged out, you can login again with the username rrossi.</p><p>If you have any questions, please contact me from your <a href=\"http://localhost/index.php/publicknowledge/en/dashboard/mySubmissions?workflowSubmissionId=16\">submission dashboard</a>.</p><p>Thank you for considering Public Knowledge Preprint Server as a venue for your work.</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Preprint Server</a>.</p>'),
(24,1048585,17,NULL,'2026-11-21 13:36:52',536870914,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Vajiheh Karbasizaed\" <vkarbasizaed@mailinator.com>','','','Thank you for your submission to Public Knowledge Preprint Server','<p>Dear Vajiheh Karbasizaed,</p><p>Thank you for your submission to Public Knowledge Preprint Server. We have received your preprint, Antimicrobial, heavy metal resistance and plasmid profile of coliforms isolated from nosocomial infections in a hospital in Isfahan, Iran, and a moderator  will see it soon. Once the moderator has reviewed your submission, they will post your preprint or contact you.</p><p>You can view your submission and track its progress through the editorial process at the following location:</p><p>Submission URL: <a href=\"http://localhost/index.php/publicknowledge/en/dashboard/mySubmissions?workflowSubmissionId=17\">http://localhost/index.php/publicknowledge/en/dashboard/mySubmissions?workflowSubmissionId=17</a></p><p>If you have been logged out, you can login again with the username vkarbasizaed.</p><p>If you have any questions, please contact me from your <a href=\"http://localhost/index.php/publicknowledge/en/dashboard/mySubmissions?workflowSubmissionId=17\">submission dashboard</a>.</p><p>Thank you for considering Public Knowledge Preprint Server as a venue for your work.</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Preprint Server</a>.</p>'),
(25,1048585,18,NULL,'2026-11-21 13:37:14',536870914,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Valerie Williamson\" <vwilliamson@mailinator.com>','','','Thank you for your submission to Public Knowledge Preprint Server','<p>Dear Valerie Williamson,</p><p>Thank you for your submission to Public Knowledge Preprint Server. We have received your preprint, Self-Organization in Multi-Level Institutions in Networked Environments, and a moderator  will see it soon. Once the moderator has reviewed your submission, they will post your preprint or contact you.</p><p>You can view your submission and track its progress through the editorial process at the following location:</p><p>Submission URL: <a href=\"http://localhost/index.php/publicknowledge/en/dashboard/mySubmissions?workflowSubmissionId=18\">http://localhost/index.php/publicknowledge/en/dashboard/mySubmissions?workflowSubmissionId=18</a></p><p>If you have been logged out, you can login again with the username vwilliamson.</p><p>If you have any questions, please contact me from your <a href=\"http://localhost/index.php/publicknowledge/en/dashboard/mySubmissions?workflowSubmissionId=18\">submission dashboard</a>.</p><p>Thank you for considering Public Knowledge Preprint Server as a venue for your work.</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Preprint Server</a>.</p>'),
(26,1048585,19,NULL,'2026-11-21 13:37:36',536870914,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Zita Woods\" <zwoods@mailinator.com>','','','Thank you for your submission to Public Knowledge Preprint Server','<p>Dear Zita Woods,</p><p>Thank you for your submission to Public Knowledge Preprint Server. We have received your preprint, Finocchiaro: Arguments About Arguments, and a moderator  will see it soon. Once the moderator has reviewed your submission, they will post your preprint or contact you.</p><p>You can view your submission and track its progress through the editorial process at the following location:</p><p>Submission URL: <a href=\"http://localhost/index.php/publicknowledge/en/dashboard/mySubmissions?workflowSubmissionId=19\">http://localhost/index.php/publicknowledge/en/dashboard/mySubmissions?workflowSubmissionId=19</a></p><p>If you have been logged out, you can login again with the username zwoods.</p><p>If you have any questions, please contact me from your <a href=\"http://localhost/index.php/publicknowledge/en/dashboard/mySubmissions?workflowSubmissionId=19\">submission dashboard</a>.</p><p>Thank you for considering Public Knowledge Preprint Server as a venue for your work.</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Preprint Server</a>.</p>');
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
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='A record of users associated with an email log entry.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `email_log_users`
--

LOCK TABLES `email_log_users` WRITE;
/*!40000 ALTER TABLE `email_log_users` DISABLE KEYS */;
INSERT INTO `email_log_users` VALUES
(1,1,7),
(2,2,8),
(3,4,9),
(4,6,10),
(5,7,10),
(6,8,10),
(7,9,10),
(8,10,11),
(9,11,12),
(10,12,13),
(11,14,14),
(12,15,15),
(13,16,16),
(14,17,17),
(15,19,18),
(16,20,19),
(17,21,20),
(18,22,21),
(19,23,22),
(20,24,23),
(21,25,24),
(22,26,25);
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
  CONSTRAINT `email_templates_context_id_foreign` FOREIGN KEY (`context_id`) REFERENCES `servers` (`server_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='Custom email templates created by each context, and overrides of the default templates.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `email_templates`
--

LOCK TABLES `email_templates` WRITE;
/*!40000 ALTER TABLE `email_templates` DISABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=109 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='Default email templates created for every installed locale.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `email_templates_default_data`
--

LOCK TABLES `email_templates_default_data` WRITE;
/*!40000 ALTER TABLE `email_templates_default_data` DISABLE KEYS */;
INSERT INTO `email_templates_default_data` VALUES
(1,'PASSWORD_RESET_CONFIRM','en','Password Reset Confirm','Password Reset Confirmation','We have received a request to reset your password for the {$siteTitle} web site.<br />\n<br />\nIf you did not make this request, please ignore this email and your password will not be changed. If you wish to reset your password, click on the below URL.<br />\n<br />\nReset my password: <a href=\"{$passwordResetUrl}\">{$passwordResetUrl}</a><br />\n<br />\n{$siteContactName}'),
(3,'USER_REGISTER','en','User Created','Server Registration','{$recipientName}<br />\n<br />\nYou have now been registered as a user with {$contextName}. We have included your username and password in this email, which are needed for all work with this server through its website. At any point, you can ask to be removed from the server\'s list of users by contacting me.<br />\n<br />\nUsername: {$recipientUsername}<br />\nPassword: {$password}<br />\n<br />\nThank you,<br />\n{$signature}'),
(5,'USER_VALIDATE_CONTEXT','en','Validate Email (Server Registration)','Validate Your Account','{$recipientName}<br />\n<br />\nYou have created an account with {$contextName}, but before you can start using it, you need to validate your email account. To do this, simply follow the link below:<br />\n<br />\n<a href=\"{$activateUrl}\">{$activateUrl}</a><br />\n<br />\nThank you,<br />\n{$contextSignature}'),
(7,'USER_VALIDATE_SITE','en','Validate Email (Site)','Validate Your Account','{$recipientName}<br />\n<br />\nYou have created an account with {$siteTitle}, but before you can start using it, you need to validate your email account. To do this, simply follow the link below:<br />\n<br />\n<a href=\"{$activateUrl}\">{$activateUrl}</a><br />\n<br />\nThank you,<br />\n{$siteSignature}'),
(9,'SUBMISSION_ACK','en','Submission Acknowledgement (Pending Moderation)','Thank you for your submission to {$contextName}','<p>Dear {$recipientName},</p><p>Thank you for your submission to {$contextName}. We have received your preprint, {$submissionTitle}, and a moderator  will see it soon. Once the moderator has reviewed your submission, they will post your preprint or contact you.</p><p>You can view your submission and track its progress through the editorial process at the following location:</p><p>Submission URL: <a href=\"{$authorSubmissionUrl}\">{$authorSubmissionUrl}</a></p><p>If you have been logged out, you can login again with the username {$recipientUsername}.</p><p>If you have any questions, please contact me from your <a href=\"{$authorSubmissionUrl}\">submission dashboard</a>.</p><p>Thank you for considering {$contextName} as a venue for your work.</p>{$contextSignature}'),
(11,'POSTED_ACK','en','Posted Acknowledgement','Preprint Posted Acknowledgement','{$recipientName}:<br />\n<br />\nYour preprint, &quot;{$submissionTitle}&quot; has been posted online on {$contextName}.<br />\n<br />\nPreprint URL: <a href=\"{$submissionUrl}\">{$submissionUrl}</a><br />\n<br />\nIf you have any questions, please contact me.<br />\n<br />\n{$signature}'),
(13,'POSTED_NEW_VERSION_ACK','en','New Version Posted','New Version Posted Acknowledgement','<p>Dear {$recipientName},</p><p>Thank you for posting a new version of your preprint to {$contextName}. The new version is now <a href=\"{$submissionPublishedUrl}\">available</a>.</p><p>If you have any questions, please contact me.</p>{$signature}'),
(15,'SUBMISSION_ACK_CAN_POST','en','Submission Acknowledgement (No Moderation Required)','Thank you for your submission to {$contextName}','<p>Dear {$recipientName},</p><p>Thank you for your submission to {$contextName}. This is an automated message to let you know that we have received your preprint, {$submissionTitle}. As a trusted author, no moderation is required, so we invite you to <a href=\"{$authorSubmissionUrl}\">post your preprint</a> as soon as you are ready.</p><p>If you have been logged out, you can login again with the username {$recipientUsername}.</p><p>Thank you for considering {$contextName} as a venue for your work.</p>{$contextSignature}'),
(17,'SUBMISSION_ACK_NOT_USER','en','Submission Confirmation (Other Authors)','Submission Acknowledgement','<p>Dear {$recipientName},</p><p>You have been named as a co-author on a preprint submitted to {$contextName}. The submitter, {$submitterName}, provided the following details:</p><p>{$submissionTitle}<br>{$authorsWithAffiliation}</p><p>If any of these details are incorrect, or you do not wish to be named on this preprint, please contact me.</p><p>Thank you for considering this server as a venue for your work.</p><p>Kind regards,</p>{$contextSignature}'),
(19,'EDITOR_ASSIGN','en','Editor Assigned','You have been assigned as a moderator on a submission to {$contextName}','<p>Dear {$recipientName},</p><p>The following preprint has been assigned to you to see through the screening process in your role as Moderator.</p><p><a href=\"{$submissionUrl}\">{$submissionTitle}</a><br />{$authors}</p><p><b>Abstract</b></p>{$submissionAbstract}<p>Please login to <a href=\"{$submissionUrl}\">view the preprint</a>. Use the Discussions section to contact the author if you have any questions. Please post the preprint once you are satisfied that it meets all requirements.</p><p>Thank you in advance.</p><p>Kind regards,</p>{$contextSignature}'),
(21,'EDITOR_DECISION_ACCEPT','en','Submission Accepted','Your submission has passed moderation at {$contextName}','<p>Dear {$recipientName},</p><p>I am pleased to inform you that a moderator has decided to accept your preprint at {$contextName}. We found your submission, {$submissionTitle}, to meet the requirements for preprints posted to {$contextName} and thank you for choosing our server as a venue for your work.</p><p>If you have any questions, please contact me from your <a href=\"{$authorSubmissionUrl}\">submission dashboard</a>.</p><p>Kind regards,</p>{$signature}'),
(23,'EDITOR_DECISION_INITIAL_DECLINE','en','Submission Declined','Your submission has been declined','<p>Dear {$recipientName},</p><p>I’m sorry to inform you that, after reviewing your submission, \"{$submissionTitle}\", the editor has found that it does not meet our requirements for publication in {$contextName}.</p><p>I wish you success if you consider submitting your work elsewhere.</p><p>Kind regards,</p>{$signature}'),
(25,'EDITOR_DECISION_REVERT_INITIAL_DECLINE','en','Reinstate Submission Declined Without Review','We have reversed the decision to decline your submission','<p>Dear {$recipientName},</p>\n<p>The decision to decline your submission, {$submissionTitle}, has been reversed. \nA moderator will look further at your submission before deciding whether to decline \nor post the submission.</p>\n<p>Occasionally, a decision to decline a submission will be recorded accidentally in \nour system and must be reverted. I apologize for any confusion this may have caused.</p>\n<p>We will contact you if we need any further assistance.</p>\n<p>If you have any questions, please contact me from your <a href=\"{$authorSubmissionUrl}\">submission dashboard</a>.</p>\n<p>Kind regards,</p>\n<p>{$signature}</p>\n'),
(27,'EDITOR_DECISION_NOTIFY_OTHER_AUTHORS','en','Notify Other Authors','An update regarding your submission','<p>The following email was sent to {$submittingAuthorName} from {$contextName} regarding \"{$submissionTitle}\".</p>\n<p>You are receiving a copy of this notification because you are identified as an author of the submission. Any instructions in the message below are intended for the submitting author, {$submittingAuthorName}, and no action is required of you at this time.</p>\n\n{$messageToSubmittingAuthor}'),
(29,'STATISTICS_REPORT_NOTIFICATION','en','Statistics Report Notification','Preprint Server activity for {$month}, {$year}','\n{$recipientName}, <br />\n<br />\nYour preprint health report for {$month}, {$year} is now available. Your key stats for this month are below.<br />\n<ul>\n	<li>New submissions this month: {$newSubmissions}</li>\n	<li>Declined submissions this month: {$declinedSubmissions}</li>\n	<li>Accepted submissions this month: {$acceptedSubmissions}</li>\n	<li>Total submissions in the system: {$totalSubmissions}</li>\n</ul>\nLogin to the the preprint server to view more detailed <a href=\"{$editorialStatsLink}\">trends</a> and <a href=\"{$publicationStatsLink}\">posted preprint stats</a>. A full copy of this month\'s trends is attached.<br />\n<br />\nSincerely,<br />\n{$contextSignature}'),
(31,'ANNOUNCEMENT','en','New Announcement','{$announcementTitle}','<b>{$announcementTitle}</b><br />\n<br />\n{$announcementSummary}<br />\n<br />\nVisit our website to read the <a href=\"{$announcementUrl}\">full announcement</a>.'),
(33,'VERSION_CREATED','en','Version Created','A new version was created for \"{$submissionTitle}\"','<p>Dear {$recipientName}, </p><p>This is an automated message to inform you that a new version of your submission, \"{$submissionTitle}\", was created. You can view this version from your submission dashboard at the following link:</p><p><a href=\"{$submissionUrl}\">\"{$submissionTitle}\"</a></p><hr><p>This is an automatic email sent from <a href=\"{$contextUrl}\">{$contextName}</a>.</p>'),
(35,'SUBMISSION_SAVED_FOR_LATER','en','Submission Saved for Later','Resume your submission to {$contextName}','<p>Dear {$recipientName},</p><p>Your submission details have been saved in our system, but it has not yet been submitted for consideration. You can return to complete your submission at any time by following the link below.</p><p><a href=\"{$submissionWizardUrl}\">{$authorsShort} — \"{$submissionTitle}\"</a></p><hr><p>This is an automated email from <a href=\"{$contextUrl}\">{$contextName}</a>.</p>'),
(37,'SUBMISSION_NEEDS_EDITOR','en','Submission Needs Editor','A new submission needs an editor to be assigned: \"{$submissionTitle}\"','<p>Dear {$recipientName},</p><p>The following submission has been submitted and there is no editor assigned.</p><p><a href=\"{$submissionUrl}\">\"{$submissionTitle}\"</a><br />{$authors}</p><p><b>Abstract</b></p>{$submissionAbstract}<p>Please assign an editor who will be responsible for the submission by clicking the title above and assigning an editor under the Participants section.</p><hr><p>This is an automated email from <a href=\"{$contextUrl}\">{$contextName}</a>.</p>'),
(39,'CHANGE_EMAIL','en','Change Email Address Invitation','Confirm account contact email change request','<p>Dear {$recipientName},</p><p>You are receiving this email because someone has requested a change of your email to {$newEmail}.</p><p>If you have made this request please <a href=\"{$acceptInvitationUrl}\">confirm</a> the email change.</p><p>You can always <a href=\"{$declineInvitationUrl}\">reject</a> this email change.</p><p>Please feel free to contact me with any questions about the submission or the review process.</p><p>Kind regards,</p>{$siteContactName}'),
(41,'ORCID_COLLECT_AUTHOR_ID','en','orcidCollectAuthorId','Submission ORCID','Dear {$recipientName},<br/>\n<br/>\nYou have been listed as an author on a manuscript submission \"{$submissionTitle}\" to {$contextName}.<br/>\nTo confirm your authorship, please add your ORCID id to this submission by visiting the link provided below.<br/>\n<br/>\n<a href=\"{$authorOrcidUrl}\"><img id=\"orcid-id-logo\" src=\"https://info.orcid.org/wp-content/uploads/2020/12/ORCIDiD_icon16x16.png\" width=\'16\' height=\'16\' alt=\"ORCID iD icon\" style=\"display: block; margin: 0 .5em 0 0; padding: 0; float: left;\"/>Register or connect your ORCID iD</a><br/>\n<br/>\n<br>\n<a href=\"{$orcidAboutUrl}\">More information about ORCID at {$contextName}</a><br/>\n<br/>\nIf you have any questions, please contact me.<br/>\n<br/>\n{$contextSignature}<br/>\n'),
(43,'ORCID_REQUEST_AUTHOR_AUTHORIZATION','en','orcidRequestAuthorAuthorization','Requesting ORCID record access','Dear {$recipientName},<br>\n<br>\nYou have been listed as an author on the manuscript submission \"{$submissionTitle}\" to {$contextName}.\n<br>\n<br>\nPlease allow us to add your ORCID id to this submission and also to add the submission to your ORCID profile on publication.<br>\nVisit the link to the official ORCID website, login with your profile and authorize the access by following the instructions.<br>\n<br>\n<a href=\"{$authorOrcidUrl}\" style=\"display: inline-flex; align-items: center; background-color: white; text-align: center; padding: 10px 20px; text-decoration: none; border-radius: 5px; border: 2px solid #d7d4d4;\"><img id=\"orcid-id-logo\" src=\"https://info.orcid.org/wp-content/uploads/2020/12/ORCIDiD_icon16x16.png\" width=\'16\' height=\'16\' alt=\"ORCID iD icon\" style=\"display: block; margin: 0 .5em 0 0; padding: 0; float: left;\"/>Register or Connect your ORCID iD</a><br/>\n<br>\n<br>\nClick here to verify your account with ORCID: <a href=\"{$authorOrcidUrl}\">{$authorOrcidUrl}.</a>\n<br>\n<br>\n<a href=\"{$orcidAboutUrl}\">More about ORCID at {$contextName}</a><br/>\n<br>\n<br>\nIf you have any questions, please contact me.<br>\n<br>\n{$contextSignature}<br>\n'),
(45,'USER_ROLE_ASSIGNMENT_INVITATION','en','User Invited to Role Notification','You are invited to new roles','<div class=\'email-container\'>    <div class=\'email-header\'>        <h2>Invitation to New Role</h2>    </div>    <div class=\'email-content\'>        <p>Dear {$recipientName},</p>        <p>In light of your expertise, you have been invited by {$inviterName} to take on new roles at {$contextName}</p>        <p>At {$contextName}, we value your privacy. As such, we have taken steps to ensure that we are fully GDPR compliant. These steps include you being accountable to enter your own data and choosing who can see what information. For additional information on how we handled your data, please refer to our Privacy Policy.</p>        <div>{$existingRoles}</div>        <div>{$rolesAdded}</div>        <p>On accepting the invite, you will be redirected to {$contextName}.</p>        <p>Feel free to contact me with any questions about the process.</p>        <table class=\'btn-wrap\' role=\'presentation\' border=\'0\' cellpadding=\'0\' cellspacing=\'10\'>            <tr><td class=\'btn-cell btn-accept\'  bgcolor=\'#28a745\'><a class=\'btn\' href=\'{$acceptUrl}\'>Accept Invitation</a></td></tr>            <tr><td class=\'btn-cell btn-decline\' bgcolor=\'#dc3545\'><a class=\'btn\' href=\'{$declineUrl}\'>Decline Invitation</a></td></tr>        </table>        <p>Kind regards,</p>        <p>{$contextName}</p>    </div></div>'),
(47,'USER_ROLE_END','en','User Role Ended Notification','You have been removed from a role','<div class=\'email-container\'>    <div class=\'email-header\'>        <h2>Removed from a Role</h2>    </div>    <div class=\'email-content\'>        <p>Dear {$recipientName},</p>        <p>Thank you very much for your participation in the role of {$roleRemoved} at {$contextName}.</p>        <p>This is a notice to let you know that you have been removed from the following role at {$contextName}: <b>{$roleRemoved}</b>.</p>        <p>Your account with {$contextName} is still active and any other roles you previously held are still active.</p>        <p>Feel free to contact me with any questions about the process.</p>        <p>Kind regards,</p>        <p>{$contextName}</p>    </div></div>'),
(49,'ORCID_REQUEST_UPDATE_SCOPE','en','orcidRequestUpdateScope','Requesting updated ORCID record access','Dear {$recipientName},<br>\n<br>\nYou are listed as a contributor (author or reviewer) on the manuscript submission \"{$submissionTitle}\" to {$contextName}.\n<br>\n<br>\nYou have previously authorized {$contextName} to list your ORCID id on the site, and we require updateded permissions to add your contribution to your ORCID profile.<br>\nVisit the link to the official ORCID website, login with your profile and authorize the access by following the instructions.<br>\n<br>\n<a href=\"{$authorOrcidUrl}\" style=\"display: inline-flex; align-items: center; background-color: white; text-align: center; padding: 10px 20px; text-decoration: none; border-radius: 5px; border: 2px solid #d7d4d4;\"><img id=\"orcid-id-logo\" src=\"https://info.orcid.org/wp-content/uploads/2020/12/ORCIDiD_icon16x16.png\" width=\'16\' height=\'16\' alt=\"ORCID iD icon\" style=\"display: block; margin: 0 .5em 0 0; padding: 0; float: left;\"/>Register or Connect your ORCID iD</a><br/>\n<br>\n<br>\nClick here to update your account with ORCID: <a href=\"{$authorOrcidUrl}\">{$authorOrcidUrl}.</a>\n<br>\n<br>\n<a href=\"{$orcidAboutUrl}\">More about ORCID at {$contextName}</a><br/>\n<br>\n<br>\nIf you have any questions, please contact me.<br>\n<br>\n{$contextSignature}<br>\n'),
(51,'REQUEST_REVIEW_ROUND_AUTHOR_RESPONSE','en','Request Author Review Response','Request For Author Response To Reviewer Feedback','<p>Hello {$recipientName},</p><p>All peer reviews for your submission titled \"{$submissionTitle}\" have now been completed. We invite you to review the comments and provide a response to the reviewers\' feedback.</p><p>You can access the reviews and submit your response below.</p><p>If you have any questions, feel free to reach out.</p><br/> <br/><a href=\"{$reviewRoundAuthorResponseUrl}\" style=\"display:inline-block;padding:10px 16px;background-color:#2f6fa3;color:#ffffff;text-decoration:none;font-size:14px;font-weight:600;border-radius:4px;\">Submit Author Response</a><hr><p>The following comments were received from reviewers.</p>{$allReviewerComments}<hr><p>Kind regards,</p>{$signature}'),
(53,'AUTHOR_PUBLICATION_PUBLISHED','en','Publication Published','Publication Published','<p>Dear {$recipientName},</p><p>Your publication, {$publicationTitle}, to {$contextName}, has been published.</p><p>To view your publication, please visit <a href=\"{$publicationPublishedUrl}\">{$publicationPublishedUrl}</a>.</p>'),
(82,'PASSWORD_RESET_CONFIRM','fr_CA','Confirmation de la réinitialisation du mot de passe','Confirmation de la réinitialisation du mot de passe','Nous avons reçu une demande concernant la réinitialisation de votre mot de passe pour le site Web {$siteTitle}.<br />\n<br />\nSi vous n\'avez pas fait cette demande, veuillez ne pas tenir compte du présent message, votre mot de passe restera le même. Si vous souhaitez réinitialiser votre mot de passe, cliquer sur l\'URL ci-dessous.<br />\n<br />\nRéinitialisation de mon mot de passe : <a href=\"{$passwordResetUrl}\">{$passwordResetUrl}</a><br />\n<br />\n{$siteContactName}'),
(83,'USER_REGISTER','fr_CA','Création de l\'utilisateur-trice','Inscription au serveur','{$recipientName},<br />\n<br />\nVous êtes désormais inscrit-e en tant qu\'utilisateur-trice pour {$contextName}. Votre nom d\'utilisateur-trice et votre mot de passe figurent dans ce courriel, lesquels sont requis pour toute interaction avec le serveur via son site Web. À n\'importe quel moment, vous pouvez demander à être retiré-e de la liste des utilisateurs-trices du serveur en nous contactant.<br />\n<br />\nNom d\'utilisateur-trice : {$recipientUsername}<br />\nMot de passe : {$password}<br />\n<br />\nMerci,<br />\n{$signature}'),
(84,'USER_VALIDATE_CONTEXT','fr_CA','','Valider votre compte','{$recipientName},<br />\n<br />\nVous avez créé un compte avec {$contextName}. Pour pouvoir commencer à l\'utiliser vous devez d\'abord valider votre compte de courriel. Pour ce faire, vous n\'avez qu\'à suivre le lien ci-dessous :<br />\n<br />\n<a href=\"{$activateUrl}\">{$activateUrl}</a><br />\n<br />\nMerci,<br />\n{$contextSignature}'),
(85,'USER_VALIDATE_SITE','fr_CA','Valider le courriel (site)','',''),
(86,'SUBMISSION_ACK','fr_CA','Confirmation de soumission','Accusé de réception de la soumission à {$contextName}','<p>{$recipientName},</p><p>Nous vous remercions d\'avoir soumis le manuscrit intitulé « {$submissionTitle} » à la revue {$contextName}. Nous l\'avons bien reçu et un membre de notre équipe éditorial le prendre en charge sous peu. Grâce à notre système de gestion en ligne, vous pourrez suivre votre soumission tout au long du processus d\'édition en accédant au site Web de la revue :</p>\n<br />\nURL de la soumission : <a href=\"{$authorSubmissionUrl}\">{$authorSubmissionUrl}</a><br />\nNom d\'utilisateur-trice : {$recipientUsername}<br />\n<br />\nSi vous avez des questions, n\'hésitez pas à communiquer avec nous. Nous vous remercions d\'avoir pensé à notre revue pour la publication de vos travaux.<br />\n<br />\n{$contextSignature}'),
(87,'POSTED_ACK','fr_CA','','',''),
(88,'POSTED_NEW_VERSION_ACK','fr_CA','','',''),
(89,'SUBMISSION_ACK_CAN_POST','fr_CA','','Accusé de réception de la soumission à {$contextName}',''),
(90,'SUBMISSION_ACK_NOT_USER','fr_CA','Confirmation de soumission (autres auteur-es)','Accusé de réception de la soumission','Bonjour,<br />\n<br />\nLe manuscrit intitulé , « {$submissionTitle} » , a été soumis par {$submitterName} à {$contextName}.<br />\n<br />\nSi vous avez des questions, n\'hésitez pas à communiquer avec nous. Nous vous remercions d\'avoir pensé à {$contextName} pour la publication de vos travaux.<br />\n<br />\n{$contextSignature}'),
(91,'EDITOR_ASSIGN','fr_CA','Rédacteur-trice assigné','',''),
(92,'EDITOR_DECISION_ACCEPT','fr_CA','Soumission acceptée','',''),
(93,'EDITOR_DECISION_INITIAL_DECLINE','fr_CA','Soumission refusée avant évaluation','Décision du rédacteur','<p>{$recipientName},</p><p>Nous avons le regret de vous informer qu\'après avoir évaluer votre manuscrit, {$submissionTitle}, le-la rédacteur-trice en a conclue qu\'il ne rencontre pas les exigences nécessaires pour être publier dans {$contextName}.</p><p>Cordialement,</p>{$signature}'),
(94,'EDITOR_DECISION_REVERT_INITIAL_DECLINE','fr_CA','Rétablir une soumission refusée sans évaluation','Nous avons renversé la décision de rejeter votre soumission','<p>{$recipientName},</p>\n<p>La décision de rejeter votre soumission, {$submissionTitle}, a été renversée. Un-e modérateur-trice évaluera votre soumission dans les détails afin de décider si votre soumission sera rejetée ou pourra être envoyée en évaluation.</p>\n<p>Si vous avez des questions, vous pouvez nous contacter sur votre <a href=\"{$authorSubmissionUrl}\">tableau de bord de soumissions</a>.</p>\n<p>Cordialement,</p>\n<p>{$signature}</p>\n'),
(95,'EDITOR_DECISION_NOTIFY_OTHER_AUTHORS','fr_CA','Envoyer une notification aux autres auteur-es','Mise à jour concernant votre soumission','<p>Ce courriel a été envoyé à {$submittingAuthorName} par {$contextName} concernant {$submissionTitle}.</p>\n<p>Vous recevez une copie de cet avis car vous êtes identifié comme auteur-e de cette soumission. Toutes les instructions dans le message ci-dessous sont à l\'intention de l\'auteur-e de correspondance, {$submittingAuthorName}. </p><p>Aucune action n\'est attendue de votre part.</p>\n\n{$messageToSubmittingAuthor}'),
(96,'STATISTICS_REPORT_NOTIFICATION','fr_CA','Notification sur les rapports statistiques','',''),
(97,'ANNOUNCEMENT','fr_CA','Nouvelle annonce','',''),
(98,'VERSION_CREATED','fr_CA','Version créée','Une nouvelle version a été créée pour {$submissionTitle}','<p>{$recipientName}, </p><p>Ceci est un courriel automatique de <a href=\"{$contextUrl}\">{$contextName}</a> pour vous informer qu\'une nouvelle version de votre soumission, {$submissionTitle}, a été créée. Vous pouvez consulter cette version à partir de votre tableau de bord de soumission:</p><p><a href=\"{$submissionUrl}\">{$submissionTitle}</a></p><hr>'),
(99,'SUBMISSION_SAVED_FOR_LATER','fr_CA','Soumission incomplète sauvegardée','Reprendre votre soumission à {$contextName}','<p>{$recipientName},</p><p>Les détails de votre soumission ont été enregistrés, mais vous ne l\'avez pas encore finalisée. Vous pouvez le faire en cliquant sur le lien ci-dessous: </p><p><a href=\"{$submissionWizardUrl}\">{$authorsShort} — {$submissionTitle}</a></p><hr><p>Ceci est un message automatique de <a href=\"{$contextUrl}\">{$contextName}</a>.</p>'),
(100,'SUBMISSION_NEEDS_EDITOR','fr_CA','Soumission en attente de rédacteur-trice','Un-e rédacteur-trice doit être assigné-e à la nouvelle soumission : {$submissionTitle}','<p>{$recipientName},</p><p>La soumission suivante a été soumise et aucun-e rédacteur-trice ne lui est assigné-e.</p><p><a href=\"{$submissionUrl}\">{$submissionTitle}</a><br />{$authors}</p><p><b>Abstract</b></p>{$submissionAbstract}<p>S\'il vous plait, assignez un-e rédacteur-trice qui sera responsable de la soumission. </p><hr><p>Ceci est un courriel automatique de <a href=\"{$contextUrl}\">{$contextName}</a>.</p>'),
(101,'CHANGE_EMAIL','fr_CA','Changer l\'adresse courriel d\'invitation','','<p>Bonjour {$recipientName},</p><p>Vous recevez ce courriel parce que quelqu’un a demandé à changer votre adresse courriel pour {$newEmail}.</p><p>Si vous êtes à l’origine de cette demande, veuillez <a href=\"{$acceptInvitationUrl}\">confirmer</a> le changement d’adresse.</p><p>Vous pouvez également <a href=\"{$declineInvitationUrl}\">refuser</a> ce changement.</p><p>N’hésitez pas à me contacter si vous avez des questions concernant la soumission ou le processus d’évaluation.</p><p>Cordialement,</p>{$siteContactName}'),
(102,'ORCID_COLLECT_AUTHOR_ID','fr_CA','orcidCollectAuthorId','Soumission ORCID','{$recipientName},<br/>\n<br/>\nVous avez été inscrit ou inscrite en tant qu\'auteur ou auteure pour un manuscrit soumis à {$contextName}.<br/>\nPour confirmer votre statut d\'auteur ou d\'auteure, veuillez ajouter votre identifiant ORCID à cette soumission en cliquant sur le lien ci-dessous.<br/>\n<br/>\n<a href=\"{$authorOrcidUrl}\"><img id=\"orcid-id-logo\" src=\"https://info.orcid.org/wp-content/uploads/2020/12/ORCIDiD_icon16x16.png\" width=\'16\' height=\'16\' alt=\"icône identifiant ORCID\" style=\"display: block; margin: 0 .5em 0 0; padding: 0; float: left;\"/>Se connecter avec votre identifiant ORCID ou s\'inscrire</a><br/>\n<br/>\n<br/>\n<a href=\"{$orcidAboutUrl}\">Plus de renseignements sur votre identifiant ORCID dans {$contextName}</a><br/>\n<br/>\nSi vous avez des questions, veuillez communiquer avec nous.<br/>\n<br/>\n{$contextSignature}<br/>\n'),
(103,'ORCID_REQUEST_AUTHOR_AUTHORIZATION','fr_CA','orcidRequestAuthorAuthorization','Demande d\'accès au dossier ORCID','{$recipientName},<br/>\n<br/>\nVous avez été inscrit ou inscrite en tant qu\'auteur ou auteure pour le manuscrit « {$submissionTitle} » soumis à {$contextName}.\n<br/>\n<br/>\nVeuillez nous autoriser à ajouter votre identifiant ORCID à cette soumission et à ajouter également la soumission à votre dossier ORCID suite à sa publication.\n<br/>\nSuivre le lien vers le site officiel ORCID, vous connecter avec votre profil et autoriser l\'accès en suivant les instructions.<br/>\n<a href=\"{$authorOrcidUrl}\"><img id=\"orcid-id-logo\" src=\"https://info.orcid.org/wp-content/uploads/2020/12/ORCIDiD_icon16x16.png\" width=\'16\' height=\'16\' alt=\"icône identifiant ORCID\" style=\"display: block; margin: 0 .5em 0 0; padding: 0; float: left;\"/>Se connecter avec votre identifiant ORCID ou s\'inscrire</a><br/>\n<br/>\n<br/>\n<a href=\"{$orcidAboutUrl}\">Plus de renseignements sur votre identifiant ORCID dans {$contextName}</a><br/>\n<br/>\nSi vous avez des questions, veuillez communiquer avec nous.<br/>\n<br/>\n{$contextSignature}<br/>\n'),
(104,'USER_ROLE_ASSIGNMENT_INVITATION','fr_CA','Notification d\'invitation à un rôle','',''),
(105,'USER_ROLE_END','fr_CA','Notification de retrait d’un rôle','',''),
(106,'ORCID_REQUEST_UPDATE_SCOPE','fr_CA','','',''),
(107,'REQUEST_REVIEW_ROUND_AUTHOR_RESPONSE','fr_CA','','',''),
(108,'AUTHOR_PUBLICATION_PUBLISHED','fr_CA','','','');
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
  `impersonated_user_id` bigint(20) DEFAULT NULL COMMENT 'The user that was impersonated via the "Login as" mechanism when the event was performed',
  `date_logged` datetime NOT NULL,
  `event_type` bigint(20) DEFAULT NULL,
  `message` text DEFAULT NULL,
  `is_translated` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`log_id`),
  KEY `event_log_user_id` (`user_id`),
  KEY `event_log_impersonated_user_id` (`impersonated_user_id`),
  KEY `event_log_assoc` (`assoc_type`,`assoc_id`),
  CONSTRAINT `event_log_impersonated_user_id_foreign` FOREIGN KEY (`impersonated_user_id`) REFERENCES `users` (`user_id`) ON DELETE SET NULL,
  CONSTRAINT `event_log_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=211 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='A log of all events related to an object like a submission.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `event_log`
--

LOCK TABLES `event_log` WRITE;
/*!40000 ALTER TABLE `event_log` DISABLE KEYS */;
INSERT INTO `event_log` VALUES
(1,1048585,1,7,NULL,'2026-11-21 13:29:36',268435458,'submission.event.general.metadataUpdated',0),
(2,1048585,1,7,NULL,'2026-11-21 13:29:36',268435458,'submission.event.general.metadataUpdated',0),
(3,515,1,7,NULL,'2026-11-21 13:29:46',1342177281,'submission.event.fileUploaded',0),
(4,1048585,1,7,NULL,'2026-11-21 13:29:46',1342177288,'submission.event.fileRevised',0),
(5,515,1,7,NULL,'2026-11-21 13:29:48',1342177296,'submission.event.fileEdited',0),
(6,1048585,1,7,NULL,'2026-11-21 13:29:48',1342177296,'submission.event.fileEdited',0),
(7,1048585,1,7,NULL,'2026-11-21 13:29:48',268435457,'submission.event.submissionSubmitted',0),
(8,1048585,2,8,NULL,'2026-11-21 13:29:56',268435458,'submission.event.general.metadataUpdated',0),
(9,1048585,2,8,NULL,'2026-11-21 13:29:56',268435458,'submission.event.general.metadataUpdated',0),
(10,515,2,8,NULL,'2026-11-21 13:30:06',1342177281,'submission.event.fileUploaded',0),
(11,1048585,2,8,NULL,'2026-11-21 13:30:06',1342177288,'submission.event.fileRevised',0),
(12,515,2,8,NULL,'2026-11-21 13:30:08',1342177296,'submission.event.fileEdited',0),
(13,1048585,2,8,NULL,'2026-11-21 13:30:08',1342177296,'submission.event.fileEdited',0),
(14,1048585,2,8,NULL,'2026-11-21 13:30:24',268435458,'submission.event.general.metadataUpdated',0),
(15,1048585,2,8,NULL,'2026-11-21 13:30:43',268435457,'submission.event.submissionSubmitted',0),
(16,1048585,2,3,NULL,'2026-11-21 13:30:51',268435462,'publication.event.published',0),
(17,1048585,2,3,NULL,'2026-11-21 13:30:51',805306371,'editor.submission.decision.moveToDone.log',0),
(18,1048585,3,9,NULL,'2026-11-21 13:30:56',268435458,'submission.event.general.metadataUpdated',0),
(19,1048585,3,9,NULL,'2026-11-21 13:30:56',268435458,'submission.event.general.metadataUpdated',0),
(20,515,3,9,NULL,'2026-11-21 13:31:06',1342177281,'submission.event.fileUploaded',0),
(21,1048585,3,9,NULL,'2026-11-21 13:31:06',1342177288,'submission.event.fileRevised',0),
(22,515,3,9,NULL,'2026-11-21 13:31:08',1342177296,'submission.event.fileEdited',0),
(23,1048585,3,9,NULL,'2026-11-21 13:31:08',1342177296,'submission.event.fileEdited',0),
(24,515,3,9,NULL,'2026-11-21 13:31:08',1342177296,'submission.event.fileEdited',0),
(25,1048585,3,9,NULL,'2026-11-21 13:31:08',1342177296,'submission.event.fileEdited',0),
(26,1048585,3,9,NULL,'2026-11-21 13:31:09',268435457,'submission.event.submissionSubmitted',0),
(27,1048585,3,3,NULL,'2026-11-21 13:31:13',268435462,'publication.event.published',0),
(28,1048585,3,3,NULL,'2026-11-21 13:31:13',805306371,'editor.submission.decision.moveToDone.log',0),
(29,1048585,3,3,NULL,'2026-11-21 13:31:17',268435463,'publication.event.unpublished',0),
(30,1048585,3,3,NULL,'2026-11-21 13:31:17',805306371,'editor.submission.decision.returnToWorkflow.log',0),
(31,1048585,3,3,NULL,'2026-11-21 13:31:19',268435458,'submission.event.general.metadataUpdated',0),
(32,1048585,3,3,NULL,'2026-11-21 13:31:20',268435462,'publication.event.published',0),
(33,1048585,3,3,NULL,'2026-11-21 13:31:20',805306371,'editor.submission.decision.moveToDone.log',0),
(34,1048585,3,3,NULL,'2026-11-21 13:31:22',268435458,'submission.event.general.metadataUpdated',0),
(35,1048585,3,3,NULL,'2026-11-21 13:31:22',268435464,'publication.event.versionCreated',0),
(36,515,4,3,NULL,'2026-11-21 13:31:22',1342177281,'submission.event.fileUploaded',0),
(37,1048585,3,3,NULL,'2026-11-21 13:31:22',1342177288,'submission.event.fileRevised',0),
(38,1048585,3,3,NULL,'2026-11-21 13:31:24',268435458,'submission.event.general.metadataUpdated',0),
(39,1048585,3,3,NULL,'2026-11-21 13:31:26',268435462,'publication.event.versionPublished',0),
(40,1048585,4,10,NULL,'2026-11-21 13:31:31',268435458,'submission.event.general.metadataUpdated',0),
(41,1048585,4,10,NULL,'2026-11-21 13:31:31',268435458,'submission.event.general.metadataUpdated',0),
(42,515,5,10,NULL,'2026-11-21 13:31:41',1342177281,'submission.event.fileUploaded',0),
(43,1048585,4,10,NULL,'2026-11-21 13:31:41',1342177288,'submission.event.fileRevised',0),
(44,515,5,10,NULL,'2026-11-21 13:31:43',1342177296,'submission.event.fileEdited',0),
(45,1048585,4,10,NULL,'2026-11-21 13:31:43',1342177296,'submission.event.fileEdited',0),
(46,1048585,4,10,NULL,'2026-11-21 13:31:43',268435457,'submission.event.submissionSubmitted',0),
(47,1048585,4,3,NULL,'2026-11-21 13:31:49',805306371,'editor.submission.decision.decline.log',0),
(48,1048585,4,3,NULL,'2026-11-21 13:31:54',805306371,'editor.submission.decision.revertDecline.log',0),
(49,1048585,4,3,NULL,'2026-11-21 13:31:58',805306371,'editor.submission.decision.decline.log',0),
(50,1048585,5,11,NULL,'2026-11-21 13:32:05',268435458,'submission.event.general.metadataUpdated',0),
(51,1048585,5,11,NULL,'2026-11-21 13:32:05',268435458,'submission.event.general.metadataUpdated',0),
(52,515,6,11,NULL,'2026-11-21 13:32:15',1342177281,'submission.event.fileUploaded',0),
(53,1048585,5,11,NULL,'2026-11-21 13:32:15',1342177288,'submission.event.fileRevised',0),
(54,515,6,11,NULL,'2026-11-21 13:32:17',1342177296,'submission.event.fileEdited',0),
(55,1048585,5,11,NULL,'2026-11-21 13:32:17',1342177296,'submission.event.fileEdited',0),
(56,1048585,5,11,NULL,'2026-11-21 13:32:17',268435457,'submission.event.submissionSubmitted',0),
(57,1048585,5,3,NULL,'2026-11-21 13:32:21',268435462,'publication.event.published',0),
(58,1048585,5,3,NULL,'2026-11-21 13:32:21',805306371,'editor.submission.decision.moveToDone.log',0),
(59,1048585,5,3,NULL,'2026-11-21 13:32:25',268435463,'publication.event.unpublished',0),
(60,1048585,5,3,NULL,'2026-11-21 13:32:25',805306371,'editor.submission.decision.returnToWorkflow.log',0),
(61,1048585,5,3,NULL,'2026-11-21 13:32:30',268435462,'publication.event.published',0),
(62,1048585,5,3,NULL,'2026-11-21 13:32:30',805306371,'editor.submission.decision.moveToDone.log',0),
(63,1048585,6,12,NULL,'2026-11-21 13:32:36',268435458,'submission.event.general.metadataUpdated',0),
(64,1048585,6,12,NULL,'2026-11-21 13:32:36',268435458,'submission.event.general.metadataUpdated',0),
(65,515,7,12,NULL,'2026-11-21 13:32:45',1342177281,'submission.event.fileUploaded',0),
(66,1048585,6,12,NULL,'2026-11-21 13:32:45',1342177288,'submission.event.fileRevised',0),
(67,515,7,12,NULL,'2026-11-21 13:32:47',1342177296,'submission.event.fileEdited',0),
(68,1048585,6,12,NULL,'2026-11-21 13:32:47',1342177296,'submission.event.fileEdited',0),
(69,515,7,12,NULL,'2026-11-21 13:32:47',1342177296,'submission.event.fileEdited',0),
(70,1048585,6,12,NULL,'2026-11-21 13:32:47',1342177296,'submission.event.fileEdited',0),
(71,1048585,6,12,NULL,'2026-11-21 13:32:48',268435457,'submission.event.submissionSubmitted',0),
(72,1048585,6,3,NULL,'2026-11-21 13:32:52',268435462,'publication.event.published',0),
(73,1048585,6,3,NULL,'2026-11-21 13:32:52',805306371,'editor.submission.decision.moveToDone.log',0),
(74,1048585,7,13,NULL,'2026-11-21 13:32:58',268435458,'submission.event.general.metadataUpdated',0),
(75,1048585,7,13,NULL,'2026-11-21 13:32:58',268435458,'submission.event.general.metadataUpdated',0),
(76,515,8,13,NULL,'2026-11-21 13:33:07',1342177281,'submission.event.fileUploaded',0),
(77,1048585,7,13,NULL,'2026-11-21 13:33:07',1342177288,'submission.event.fileRevised',0),
(78,515,8,13,NULL,'2026-11-21 13:33:09',1342177296,'submission.event.fileEdited',0),
(79,1048585,7,13,NULL,'2026-11-21 13:33:09',1342177296,'submission.event.fileEdited',0),
(80,515,8,13,NULL,'2026-11-21 13:33:09',1342177296,'submission.event.fileEdited',0),
(81,1048585,7,13,NULL,'2026-11-21 13:33:09',1342177296,'submission.event.fileEdited',0),
(82,1048585,7,13,NULL,'2026-11-21 13:33:10',268435457,'submission.event.submissionSubmitted',0),
(83,1048585,7,3,NULL,'2026-11-21 13:33:14',268435462,'publication.event.published',0),
(84,1048585,7,3,NULL,'2026-11-21 13:33:14',805306371,'editor.submission.decision.moveToDone.log',0),
(85,1048585,8,14,NULL,'2026-11-21 13:33:20',268435458,'submission.event.general.metadataUpdated',0),
(86,1048585,8,14,NULL,'2026-11-21 13:33:20',268435458,'submission.event.general.metadataUpdated',0),
(87,515,9,14,NULL,'2026-11-21 13:33:29',1342177281,'submission.event.fileUploaded',0),
(88,1048585,8,14,NULL,'2026-11-21 13:33:29',1342177288,'submission.event.fileRevised',0),
(89,515,9,14,NULL,'2026-11-21 13:33:32',1342177296,'submission.event.fileEdited',0),
(90,1048585,8,14,NULL,'2026-11-21 13:33:32',1342177296,'submission.event.fileEdited',0),
(91,1048585,8,14,NULL,'2026-11-21 13:33:32',268435457,'submission.event.submissionSubmitted',0),
(92,1048585,8,3,NULL,'2026-11-21 13:33:36',268435462,'publication.event.published',0),
(93,1048585,8,3,NULL,'2026-11-21 13:33:36',805306371,'editor.submission.decision.moveToDone.log',0),
(94,1048585,9,15,NULL,'2026-11-21 13:33:42',268435458,'submission.event.general.metadataUpdated',0),
(95,1048585,9,15,NULL,'2026-11-21 13:33:42',268435458,'submission.event.general.metadataUpdated',0),
(96,515,10,15,NULL,'2026-11-21 13:33:51',1342177281,'submission.event.fileUploaded',0),
(97,1048585,9,15,NULL,'2026-11-21 13:33:51',1342177288,'submission.event.fileRevised',0),
(98,515,10,15,NULL,'2026-11-21 13:33:54',1342177296,'submission.event.fileEdited',0),
(99,1048585,9,15,NULL,'2026-11-21 13:33:54',1342177296,'submission.event.fileEdited',0),
(100,515,10,15,NULL,'2026-11-21 13:33:54',1342177296,'submission.event.fileEdited',0),
(101,1048585,9,15,NULL,'2026-11-21 13:33:54',1342177296,'submission.event.fileEdited',0),
(102,1048585,9,15,NULL,'2026-11-21 13:33:54',268435457,'submission.event.submissionSubmitted',0),
(103,1048585,9,3,NULL,'2026-11-21 13:33:58',268435462,'publication.event.published',0),
(104,1048585,9,3,NULL,'2026-11-21 13:33:58',805306371,'editor.submission.decision.moveToDone.log',0),
(105,1048585,10,16,NULL,'2026-11-21 13:34:04',268435458,'submission.event.general.metadataUpdated',0),
(106,1048585,10,16,NULL,'2026-11-21 13:34:04',268435458,'submission.event.general.metadataUpdated',0),
(107,515,11,16,NULL,'2026-11-21 13:34:13',1342177281,'submission.event.fileUploaded',0),
(108,1048585,10,16,NULL,'2026-11-21 13:34:13',1342177288,'submission.event.fileRevised',0),
(109,515,11,16,NULL,'2026-11-21 13:34:15',1342177296,'submission.event.fileEdited',0),
(110,1048585,10,16,NULL,'2026-11-21 13:34:15',1342177296,'submission.event.fileEdited',0),
(111,515,11,16,NULL,'2026-11-21 13:34:15',1342177296,'submission.event.fileEdited',0),
(112,1048585,10,16,NULL,'2026-11-21 13:34:15',1342177296,'submission.event.fileEdited',0),
(113,1048585,10,16,NULL,'2026-11-21 13:34:16',268435457,'submission.event.submissionSubmitted',0),
(114,1048585,10,3,NULL,'2026-11-21 13:34:20',268435462,'publication.event.published',0),
(115,1048585,10,3,NULL,'2026-11-21 13:34:20',805306371,'editor.submission.decision.moveToDone.log',0),
(116,1048585,11,17,NULL,'2026-11-21 13:34:26',268435458,'submission.event.general.metadataUpdated',0),
(117,1048585,11,17,NULL,'2026-11-21 13:34:26',268435458,'submission.event.general.metadataUpdated',0),
(118,515,12,17,NULL,'2026-11-21 13:34:35',1342177281,'submission.event.fileUploaded',0),
(119,1048585,11,17,NULL,'2026-11-21 13:34:35',1342177288,'submission.event.fileRevised',0),
(120,515,12,17,NULL,'2026-11-21 13:34:37',1342177296,'submission.event.fileEdited',0),
(121,1048585,11,17,NULL,'2026-11-21 13:34:37',1342177296,'submission.event.fileEdited',0),
(122,515,12,17,NULL,'2026-11-21 13:34:37',1342177296,'submission.event.fileEdited',0),
(123,1048585,11,17,NULL,'2026-11-21 13:34:37',1342177296,'submission.event.fileEdited',0),
(124,1048585,11,17,NULL,'2026-11-21 13:34:38',268435457,'submission.event.submissionSubmitted',0),
(125,1048585,11,3,NULL,'2026-11-21 13:34:42',268435462,'publication.event.published',0),
(126,1048585,11,3,NULL,'2026-11-21 13:34:43',805306371,'editor.submission.decision.moveToDone.log',0),
(127,1048585,12,18,NULL,'2026-11-21 13:34:48',268435458,'submission.event.general.metadataUpdated',0),
(128,1048585,12,18,NULL,'2026-11-21 13:34:48',268435458,'submission.event.general.metadataUpdated',0),
(129,515,13,18,NULL,'2026-11-21 13:34:57',1342177281,'submission.event.fileUploaded',0),
(130,1048585,12,18,NULL,'2026-11-21 13:34:57',1342177288,'submission.event.fileRevised',0),
(131,515,13,18,NULL,'2026-11-21 13:35:00',1342177296,'submission.event.fileEdited',0),
(132,1048585,12,18,NULL,'2026-11-21 13:35:00',1342177296,'submission.event.fileEdited',0),
(133,515,13,18,NULL,'2026-11-21 13:35:00',1342177296,'submission.event.fileEdited',0),
(134,1048585,12,18,NULL,'2026-11-21 13:35:00',1342177296,'submission.event.fileEdited',0),
(135,1048585,12,18,NULL,'2026-11-21 13:35:00',268435457,'submission.event.submissionSubmitted',0),
(136,1048585,12,3,NULL,'2026-11-21 13:35:04',268435462,'publication.event.published',0),
(137,1048585,12,3,NULL,'2026-11-21 13:35:04',805306371,'editor.submission.decision.moveToDone.log',0),
(138,1048585,13,19,NULL,'2026-11-21 13:35:10',268435458,'submission.event.general.metadataUpdated',0),
(139,1048585,13,19,NULL,'2026-11-21 13:35:10',268435458,'submission.event.general.metadataUpdated',0),
(140,515,14,19,NULL,'2026-11-21 13:35:19',1342177281,'submission.event.fileUploaded',0),
(141,1048585,13,19,NULL,'2026-11-21 13:35:19',1342177288,'submission.event.fileRevised',0),
(142,515,14,19,NULL,'2026-11-21 13:35:22',1342177296,'submission.event.fileEdited',0),
(143,1048585,13,19,NULL,'2026-11-21 13:35:22',1342177296,'submission.event.fileEdited',0),
(144,515,14,19,NULL,'2026-11-21 13:35:22',1342177296,'submission.event.fileEdited',0),
(145,1048585,13,19,NULL,'2026-11-21 13:35:22',1342177296,'submission.event.fileEdited',0),
(146,1048585,13,19,NULL,'2026-11-21 13:35:22',268435457,'submission.event.submissionSubmitted',0),
(147,1048585,13,3,NULL,'2026-11-21 13:35:26',268435462,'publication.event.published',0),
(148,1048585,13,3,NULL,'2026-11-21 13:35:26',805306371,'editor.submission.decision.moveToDone.log',0),
(149,1048585,14,20,NULL,'2026-11-21 13:35:32',268435458,'submission.event.general.metadataUpdated',0),
(150,1048585,14,20,NULL,'2026-11-21 13:35:32',268435458,'submission.event.general.metadataUpdated',0),
(151,515,15,20,NULL,'2026-11-21 13:35:41',1342177281,'submission.event.fileUploaded',0),
(152,1048585,14,20,NULL,'2026-11-21 13:35:41',1342177288,'submission.event.fileRevised',0),
(153,515,15,20,NULL,'2026-11-21 13:35:44',1342177296,'submission.event.fileEdited',0),
(154,1048585,14,20,NULL,'2026-11-21 13:35:44',1342177296,'submission.event.fileEdited',0),
(155,515,15,20,NULL,'2026-11-21 13:35:44',1342177296,'submission.event.fileEdited',0),
(156,1048585,14,20,NULL,'2026-11-21 13:35:44',1342177296,'submission.event.fileEdited',0),
(157,1048585,14,20,NULL,'2026-11-21 13:35:44',268435457,'submission.event.submissionSubmitted',0),
(158,1048585,14,3,NULL,'2026-11-21 13:35:49',268435462,'publication.event.published',0),
(159,1048585,14,3,NULL,'2026-11-21 13:35:49',805306371,'editor.submission.decision.moveToDone.log',0),
(160,1048585,15,21,NULL,'2026-11-21 13:35:57',268435458,'submission.event.general.metadataUpdated',0),
(161,1048585,15,21,NULL,'2026-11-21 13:35:57',268435458,'submission.event.general.metadataUpdated',0),
(162,515,16,21,NULL,'2026-11-21 13:36:06',1342177281,'submission.event.fileUploaded',0),
(163,1048585,15,21,NULL,'2026-11-21 13:36:06',1342177288,'submission.event.fileRevised',0),
(164,515,16,21,NULL,'2026-11-21 13:36:09',1342177296,'submission.event.fileEdited',0),
(165,1048585,15,21,NULL,'2026-11-21 13:36:09',1342177296,'submission.event.fileEdited',0),
(166,1048585,15,21,NULL,'2026-11-21 13:36:09',268435457,'submission.event.submissionSubmitted',0),
(167,1048585,15,3,NULL,'2026-11-21 13:36:13',268435462,'publication.event.published',0),
(168,1048585,15,3,NULL,'2026-11-21 13:36:13',805306371,'editor.submission.decision.moveToDone.log',0),
(169,1048585,16,22,NULL,'2026-11-21 13:36:19',268435458,'submission.event.general.metadataUpdated',0),
(170,1048585,16,22,NULL,'2026-11-21 13:36:19',268435458,'submission.event.general.metadataUpdated',0),
(171,515,17,22,NULL,'2026-11-21 13:36:28',1342177281,'submission.event.fileUploaded',0),
(172,1048585,16,22,NULL,'2026-11-21 13:36:28',1342177288,'submission.event.fileRevised',0),
(173,515,17,22,NULL,'2026-11-21 13:36:30',1342177296,'submission.event.fileEdited',0),
(174,1048585,16,22,NULL,'2026-11-21 13:36:30',1342177296,'submission.event.fileEdited',0),
(175,515,17,22,NULL,'2026-11-21 13:36:30',1342177296,'submission.event.fileEdited',0),
(176,1048585,16,22,NULL,'2026-11-21 13:36:30',1342177296,'submission.event.fileEdited',0),
(177,1048585,16,22,NULL,'2026-11-21 13:36:31',268435457,'submission.event.submissionSubmitted',0),
(178,1048585,16,3,NULL,'2026-11-21 13:36:35',268435462,'publication.event.published',0),
(179,1048585,16,3,NULL,'2026-11-21 13:36:35',805306371,'editor.submission.decision.moveToDone.log',0),
(180,1048585,17,23,NULL,'2026-11-21 13:36:40',268435458,'submission.event.general.metadataUpdated',0),
(181,1048585,17,23,NULL,'2026-11-21 13:36:41',268435458,'submission.event.general.metadataUpdated',0),
(182,515,18,23,NULL,'2026-11-21 13:36:50',1342177281,'submission.event.fileUploaded',0),
(183,1048585,17,23,NULL,'2026-11-21 13:36:50',1342177288,'submission.event.fileRevised',0),
(184,515,18,23,NULL,'2026-11-21 13:36:52',1342177296,'submission.event.fileEdited',0),
(185,1048585,17,23,NULL,'2026-11-21 13:36:52',1342177296,'submission.event.fileEdited',0),
(186,1048585,17,23,NULL,'2026-11-21 13:36:52',268435457,'submission.event.submissionSubmitted',0),
(187,1048585,17,3,NULL,'2026-11-21 13:36:57',268435462,'publication.event.published',0),
(188,1048585,17,3,NULL,'2026-11-21 13:36:57',805306371,'editor.submission.decision.moveToDone.log',0),
(189,1048585,18,24,NULL,'2026-11-21 13:37:02',268435458,'submission.event.general.metadataUpdated',0),
(190,1048585,18,24,NULL,'2026-11-21 13:37:02',268435458,'submission.event.general.metadataUpdated',0),
(191,515,19,24,NULL,'2026-11-21 13:37:12',1342177281,'submission.event.fileUploaded',0),
(192,1048585,18,24,NULL,'2026-11-21 13:37:12',1342177288,'submission.event.fileRevised',0),
(193,515,19,24,NULL,'2026-11-21 13:37:14',1342177296,'submission.event.fileEdited',0),
(194,1048585,18,24,NULL,'2026-11-21 13:37:14',1342177296,'submission.event.fileEdited',0),
(195,515,19,24,NULL,'2026-11-21 13:37:14',1342177296,'submission.event.fileEdited',0),
(196,1048585,18,24,NULL,'2026-11-21 13:37:14',1342177296,'submission.event.fileEdited',0),
(197,1048585,18,24,NULL,'2026-11-21 13:37:14',268435457,'submission.event.submissionSubmitted',0),
(198,1048585,18,3,NULL,'2026-11-21 13:37:18',268435462,'publication.event.published',0),
(199,1048585,18,3,NULL,'2026-11-21 13:37:19',805306371,'editor.submission.decision.moveToDone.log',0),
(200,1048585,19,25,NULL,'2026-11-21 13:37:24',268435458,'submission.event.general.metadataUpdated',0),
(201,1048585,19,25,NULL,'2026-11-21 13:37:24',268435458,'submission.event.general.metadataUpdated',0),
(202,515,20,25,NULL,'2026-11-21 13:37:34',1342177281,'submission.event.fileUploaded',0),
(203,1048585,19,25,NULL,'2026-11-21 13:37:34',1342177288,'submission.event.fileRevised',0),
(204,515,20,25,NULL,'2026-11-21 13:37:36',1342177296,'submission.event.fileEdited',0),
(205,1048585,19,25,NULL,'2026-11-21 13:37:36',1342177296,'submission.event.fileEdited',0),
(206,515,20,25,NULL,'2026-11-21 13:37:36',1342177296,'submission.event.fileEdited',0),
(207,1048585,19,25,NULL,'2026-11-21 13:37:36',1342177296,'submission.event.fileEdited',0),
(208,1048585,19,25,NULL,'2026-11-21 13:37:36',268435457,'submission.event.submissionSubmitted',0),
(209,1048585,19,3,NULL,'2026-11-21 13:37:40',268435462,'publication.event.published',0),
(210,1048585,19,3,NULL,'2026-11-21 13:37:40',805306371,'editor.submission.decision.moveToDone.log',0);
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
) ENGINE=InnoDB AUTO_INCREMENT=637 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='Data about an event log entry. This data is commonly used to display information about an event to a user.';
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
(19,6,'','fileId','1'),
(20,6,'en','filename','The influence of lactation on the quantity and quality of cashmere production.pdf'),
(21,6,'','fileStage','10'),
(22,6,'','submissionFileId','1'),
(23,6,'','submissionId','1'),
(24,6,'','username','ccorino'),
(25,10,'','fileId','2'),
(26,10,'en','filename','The Facets Of Job Satisfaction: A Nine-Nation Comparative Study Of Construct Equivalence.pdf'),
(27,10,'','fileStage','10'),
(28,10,'','submissionFileId','2'),
(29,10,'','submissionId','2'),
(30,10,'','username','ckwantes'),
(31,11,'','fileId','2'),
(32,11,'en','filename','The Facets Of Job Satisfaction: A Nine-Nation Comparative Study Of Construct Equivalence.pdf'),
(33,11,'','fileStage','10'),
(34,11,'','submissionFileId','2'),
(35,11,'','submissionId','2'),
(36,11,'','username','ckwantes'),
(37,12,'','fileId','2'),
(38,12,'en','filename','The Facets Of Job Satisfaction: A Nine-Nation Comparative Study Of Construct Equivalence.pdf'),
(39,12,'','fileStage','10'),
(40,12,'','submissionFileId','2'),
(41,12,'','submissionId','2'),
(42,12,'','username','ckwantes'),
(43,13,'','fileId','2'),
(44,13,'en','filename','The Facets Of Job Satisfaction: A Nine-Nation Comparative Study Of Construct Equivalence.pdf'),
(45,13,'','fileStage','10'),
(46,13,'','submissionFileId','2'),
(47,13,'','submissionId','2'),
(48,13,'','username','ckwantes'),
(49,17,'','editorName','Daniel Barnes'),
(50,20,'','fileId','3'),
(51,20,'en','filename','Computer Skill Requirements for New and Existing Teachers: Implications for Policy and Practice.pdf'),
(52,20,'','fileStage','10'),
(53,20,'','submissionFileId','3'),
(54,20,'','submissionId','3'),
(55,20,'','username','cmontgomerie'),
(56,21,'','fileId','3'),
(57,21,'en','filename','Computer Skill Requirements for New and Existing Teachers: Implications for Policy and Practice.pdf'),
(58,21,'','fileStage','10'),
(59,21,'','submissionFileId','3'),
(60,21,'','submissionId','3'),
(61,21,'','username','cmontgomerie'),
(62,22,'','fileId','3'),
(63,22,'en','filename','Computer Skill Requirements for New and Existing Teachers: Implications for Policy and Practice.pdf'),
(64,22,'','fileStage','10'),
(65,22,'','submissionFileId','3'),
(66,22,'','submissionId','3'),
(67,22,'','username','cmontgomerie'),
(68,23,'','fileId','3'),
(69,23,'en','filename','Computer Skill Requirements for New and Existing Teachers: Implications for Policy and Practice.pdf'),
(70,23,'','fileStage','10'),
(71,23,'','submissionFileId','3'),
(72,23,'','submissionId','3'),
(73,23,'','username','cmontgomerie'),
(74,24,'','fileId','3'),
(75,24,'en','filename','Computer Skill Requirements for New and Existing Teachers: Implications for Policy and Practice.pdf'),
(76,24,'','fileStage','10'),
(77,24,'','submissionFileId','3'),
(78,24,'','submissionId','3'),
(79,24,'','username','cmontgomerie'),
(80,25,'','fileId','3'),
(81,25,'en','filename','Computer Skill Requirements for New and Existing Teachers: Implications for Policy and Practice.pdf'),
(82,25,'','fileStage','10'),
(83,25,'','submissionFileId','3'),
(84,25,'','submissionId','3'),
(85,25,'','username','cmontgomerie'),
(86,28,'','editorName','Daniel Barnes'),
(87,30,'','editorName','Daniel Barnes'),
(88,33,'','editorName','Daniel Barnes'),
(89,36,'','fileId','3'),
(90,36,'en','filename','Computer Skill Requirements for New and Existing Teachers: Implications for Policy and Practice.pdf'),
(91,36,'','fileStage','10'),
(92,36,'','submissionFileId','4'),
(93,36,'','submissionId','3'),
(94,36,'','username','dbarnes'),
(95,37,'','fileId','3'),
(96,37,'en','filename','Computer Skill Requirements for New and Existing Teachers: Implications for Policy and Practice.pdf'),
(97,37,'','fileStage','10'),
(98,37,'','submissionFileId','4'),
(99,37,'','submissionId','3'),
(100,37,'','username','dbarnes'),
(101,42,'','fileId','4'),
(102,42,'en','filename','Genetic transformation of forest trees.pdf'),
(103,42,'','fileStage','10'),
(104,42,'','submissionFileId','5'),
(105,42,'','submissionId','4'),
(106,42,'','username','ddiouf'),
(107,43,'','fileId','4'),
(108,43,'en','filename','Genetic transformation of forest trees.pdf'),
(109,43,'','fileStage','10'),
(110,43,'','submissionFileId','5'),
(111,43,'','submissionId','4'),
(112,43,'','username','ddiouf'),
(113,44,'','fileId','4'),
(114,44,'en','filename','Genetic transformation of forest trees.pdf'),
(115,44,'','fileStage','10'),
(116,44,'','submissionFileId','5'),
(117,44,'','submissionId','4'),
(118,44,'','username','ddiouf'),
(119,45,'','fileId','4'),
(120,45,'en','filename','Genetic transformation of forest trees.pdf'),
(121,45,'','fileStage','10'),
(122,45,'','submissionFileId','5'),
(123,45,'','submissionId','4'),
(124,45,'','username','ddiouf'),
(125,47,'','editorName','Daniel Barnes'),
(126,48,'','editorName','Daniel Barnes'),
(127,49,'','editorName','Daniel Barnes'),
(128,52,'','fileId','5'),
(129,52,'en','filename','Investigating the Shared Background Required for Argument: A Critique of Fogelin\'s Thesis on Deep Disagreement.pdf'),
(130,52,'','fileStage','10'),
(131,52,'','submissionFileId','6'),
(132,52,'','submissionId','5'),
(133,52,'','username','dphillips'),
(134,53,'','fileId','5'),
(135,53,'en','filename','Investigating the Shared Background Required for Argument: A Critique of Fogelin\'s Thesis on Deep Disagreement.pdf'),
(136,53,'','fileStage','10'),
(137,53,'','submissionFileId','6'),
(138,53,'','submissionId','5'),
(139,53,'','username','dphillips'),
(140,54,'','fileId','5'),
(141,54,'en','filename','Investigating the Shared Background Required for Argument: A Critique of Fogelin\'s Thesis on Deep Disagreement.pdf'),
(142,54,'','fileStage','10'),
(143,54,'','submissionFileId','6'),
(144,54,'','submissionId','5'),
(145,54,'','username','dphillips'),
(146,55,'','fileId','5'),
(147,55,'en','filename','Investigating the Shared Background Required for Argument: A Critique of Fogelin\'s Thesis on Deep Disagreement.pdf'),
(148,55,'','fileStage','10'),
(149,55,'','submissionFileId','6'),
(150,55,'','submissionId','5'),
(151,55,'','username','dphillips'),
(152,58,'','editorName','Daniel Barnes'),
(153,60,'','editorName','Daniel Barnes'),
(154,62,'','editorName','Daniel Barnes'),
(155,65,'','fileId','6'),
(156,65,'en','filename','Developing efficacy beliefs in the classroom.pdf'),
(157,65,'','fileStage','10'),
(158,65,'','submissionFileId','7'),
(159,65,'','submissionId','6'),
(160,65,'','username','dsokoloff'),
(161,66,'','fileId','6'),
(162,66,'en','filename','Developing efficacy beliefs in the classroom.pdf'),
(163,66,'','fileStage','10'),
(164,66,'','submissionFileId','7'),
(165,66,'','submissionId','6'),
(166,66,'','username','dsokoloff'),
(167,67,'','fileId','6'),
(168,67,'en','filename','Developing efficacy beliefs in the classroom.pdf'),
(169,67,'','fileStage','10'),
(170,67,'','submissionFileId','7'),
(171,67,'','submissionId','6'),
(172,67,'','username','dsokoloff'),
(173,68,'','fileId','6'),
(174,68,'en','filename','Developing efficacy beliefs in the classroom.pdf'),
(175,68,'','fileStage','10'),
(176,68,'','submissionFileId','7'),
(177,68,'','submissionId','6'),
(178,68,'','username','dsokoloff'),
(179,69,'','fileId','6'),
(180,69,'en','filename','Developing efficacy beliefs in the classroom.pdf'),
(181,69,'','fileStage','10'),
(182,69,'','submissionFileId','7'),
(183,69,'','submissionId','6'),
(184,69,'','username','dsokoloff'),
(185,70,'','fileId','6'),
(186,70,'en','filename','Developing efficacy beliefs in the classroom.pdf'),
(187,70,'','fileStage','10'),
(188,70,'','submissionFileId','7'),
(189,70,'','submissionId','6'),
(190,70,'','username','dsokoloff'),
(191,73,'','editorName','Daniel Barnes'),
(192,76,'','fileId','7'),
(193,76,'en','filename','Developing efficacy beliefs in the classroom.pdf'),
(194,76,'','fileStage','10'),
(195,76,'','submissionFileId','8'),
(196,76,'','submissionId','7'),
(197,76,'','username','eostrom'),
(198,77,'','fileId','7'),
(199,77,'en','filename','Developing efficacy beliefs in the classroom.pdf'),
(200,77,'','fileStage','10'),
(201,77,'','submissionFileId','8'),
(202,77,'','submissionId','7'),
(203,77,'','username','eostrom'),
(204,78,'','fileId','7'),
(205,78,'en','filename','Developing efficacy beliefs in the classroom.pdf'),
(206,78,'','fileStage','10'),
(207,78,'','submissionFileId','8'),
(208,78,'','submissionId','7'),
(209,78,'','username','eostrom'),
(210,79,'','fileId','7'),
(211,79,'en','filename','Developing efficacy beliefs in the classroom.pdf'),
(212,79,'','fileStage','10'),
(213,79,'','submissionFileId','8'),
(214,79,'','submissionId','7'),
(215,79,'','username','eostrom'),
(216,80,'','fileId','7'),
(217,80,'en','filename','Developing efficacy beliefs in the classroom.pdf'),
(218,80,'','fileStage','10'),
(219,80,'','submissionFileId','8'),
(220,80,'','submissionId','7'),
(221,80,'','username','eostrom'),
(222,81,'','fileId','7'),
(223,81,'en','filename','Developing efficacy beliefs in the classroom.pdf'),
(224,81,'','fileStage','10'),
(225,81,'','submissionFileId','8'),
(226,81,'','submissionId','7'),
(227,81,'','username','eostrom'),
(228,84,'','editorName','Daniel Barnes'),
(229,87,'','fileId','8'),
(230,87,'en','filename','Hansen & Pinto: Reason Reclaimed.pdf'),
(231,87,'','fileStage','10'),
(232,87,'','submissionFileId','9'),
(233,87,'','submissionId','8'),
(234,87,'','username','fpaglieri'),
(235,88,'','fileId','8'),
(236,88,'en','filename','Hansen & Pinto: Reason Reclaimed.pdf'),
(237,88,'','fileStage','10'),
(238,88,'','submissionFileId','9'),
(239,88,'','submissionId','8'),
(240,88,'','username','fpaglieri'),
(241,89,'','fileId','8'),
(242,89,'en','filename','Hansen & Pinto: Reason Reclaimed.pdf'),
(243,89,'','fileStage','10'),
(244,89,'','submissionFileId','9'),
(245,89,'','submissionId','8'),
(246,89,'','username','fpaglieri'),
(247,90,'','fileId','8'),
(248,90,'en','filename','Hansen & Pinto: Reason Reclaimed.pdf'),
(249,90,'','fileStage','10'),
(250,90,'','submissionFileId','9'),
(251,90,'','submissionId','8'),
(252,90,'','username','fpaglieri'),
(253,93,'','editorName','Daniel Barnes'),
(254,96,'','fileId','9'),
(255,96,'en','filename','Signalling Theory Dividends: A Review Of The Literature And Empirical Evidence.pdf'),
(256,96,'','fileStage','10'),
(257,96,'','submissionFileId','10'),
(258,96,'','submissionId','9'),
(259,96,'','username','jmwandenga'),
(260,97,'','fileId','9'),
(261,97,'en','filename','Signalling Theory Dividends: A Review Of The Literature And Empirical Evidence.pdf'),
(262,97,'','fileStage','10'),
(263,97,'','submissionFileId','10'),
(264,97,'','submissionId','9'),
(265,97,'','username','jmwandenga'),
(266,98,'','fileId','9'),
(267,98,'en','filename','Signalling Theory Dividends: A Review Of The Literature And Empirical Evidence.pdf'),
(268,98,'','fileStage','10'),
(269,98,'','submissionFileId','10'),
(270,98,'','submissionId','9'),
(271,98,'','username','jmwandenga'),
(272,99,'','fileId','9'),
(273,99,'en','filename','Signalling Theory Dividends: A Review Of The Literature And Empirical Evidence.pdf'),
(274,99,'','fileStage','10'),
(275,99,'','submissionFileId','10'),
(276,99,'','submissionId','9'),
(277,99,'','username','jmwandenga'),
(278,100,'','fileId','9'),
(279,100,'en','filename','Signalling Theory Dividends: A Review Of The Literature And Empirical Evidence.pdf'),
(280,100,'','fileStage','10'),
(281,100,'','submissionFileId','10'),
(282,100,'','submissionId','9'),
(283,100,'','username','jmwandenga'),
(284,101,'','fileId','9'),
(285,101,'en','filename','Signalling Theory Dividends: A Review Of The Literature And Empirical Evidence.pdf'),
(286,101,'','fileStage','10'),
(287,101,'','submissionFileId','10'),
(288,101,'','submissionId','9'),
(289,101,'','username','jmwandenga'),
(290,104,'','editorName','Daniel Barnes'),
(291,107,'','fileId','10'),
(292,107,'en','filename','Condensing Water Availability Models to Focus on Specific Water Management Systems.pdf'),
(293,107,'','fileStage','10'),
(294,107,'','submissionFileId','11'),
(295,107,'','submissionId','10'),
(296,107,'','username','jnovak'),
(297,108,'','fileId','10'),
(298,108,'en','filename','Condensing Water Availability Models to Focus on Specific Water Management Systems.pdf'),
(299,108,'','fileStage','10'),
(300,108,'','submissionFileId','11'),
(301,108,'','submissionId','10'),
(302,108,'','username','jnovak'),
(303,109,'','fileId','10'),
(304,109,'en','filename','Condensing Water Availability Models to Focus on Specific Water Management Systems.pdf'),
(305,109,'','fileStage','10'),
(306,109,'','submissionFileId','11'),
(307,109,'','submissionId','10'),
(308,109,'','username','jnovak'),
(309,110,'','fileId','10'),
(310,110,'en','filename','Condensing Water Availability Models to Focus on Specific Water Management Systems.pdf'),
(311,110,'','fileStage','10'),
(312,110,'','submissionFileId','11'),
(313,110,'','submissionId','10'),
(314,110,'','username','jnovak'),
(315,111,'','fileId','10'),
(316,111,'en','filename','Condensing Water Availability Models to Focus on Specific Water Management Systems.pdf'),
(317,111,'','fileStage','10'),
(318,111,'','submissionFileId','11'),
(319,111,'','submissionId','10'),
(320,111,'','username','jnovak'),
(321,112,'','fileId','10'),
(322,112,'en','filename','Condensing Water Availability Models to Focus on Specific Water Management Systems.pdf'),
(323,112,'','fileStage','10'),
(324,112,'','submissionFileId','11'),
(325,112,'','submissionId','10'),
(326,112,'','username','jnovak'),
(327,115,'','editorName','Daniel Barnes'),
(328,118,'','fileId','11'),
(329,118,'en','filename','Learning Sustainable Design through Service.pdf'),
(330,118,'','fileStage','10'),
(331,118,'','submissionFileId','12'),
(332,118,'','submissionId','11'),
(333,118,'','username','kalkhafaji'),
(334,119,'','fileId','11'),
(335,119,'en','filename','Learning Sustainable Design through Service.pdf'),
(336,119,'','fileStage','10'),
(337,119,'','submissionFileId','12'),
(338,119,'','submissionId','11'),
(339,119,'','username','kalkhafaji'),
(340,120,'','fileId','11'),
(341,120,'en','filename','Learning Sustainable Design through Service.pdf'),
(342,120,'','fileStage','10'),
(343,120,'','submissionFileId','12'),
(344,120,'','submissionId','11'),
(345,120,'','username','kalkhafaji'),
(346,121,'','fileId','11'),
(347,121,'en','filename','Learning Sustainable Design through Service.pdf'),
(348,121,'','fileStage','10'),
(349,121,'','submissionFileId','12'),
(350,121,'','submissionId','11'),
(351,121,'','username','kalkhafaji'),
(352,122,'','fileId','11'),
(353,122,'en','filename','Learning Sustainable Design through Service.pdf'),
(354,122,'','fileStage','10'),
(355,122,'','submissionFileId','12'),
(356,122,'','submissionId','11'),
(357,122,'','username','kalkhafaji'),
(358,123,'','fileId','11'),
(359,123,'en','filename','Learning Sustainable Design through Service.pdf'),
(360,123,'','fileStage','10'),
(361,123,'','submissionFileId','12'),
(362,123,'','submissionId','11'),
(363,123,'','username','kalkhafaji'),
(364,126,'','editorName','Daniel Barnes'),
(365,129,'','fileId','12'),
(366,129,'en','filename','Sodium butyrate improves growth performance of weaned piglets during the first period after weaning.pdf'),
(367,129,'','fileStage','10'),
(368,129,'','submissionFileId','13'),
(369,129,'','submissionId','12'),
(370,129,'','username','lchristopher'),
(371,130,'','fileId','12'),
(372,130,'en','filename','Sodium butyrate improves growth performance of weaned piglets during the first period after weaning.pdf'),
(373,130,'','fileStage','10'),
(374,130,'','submissionFileId','13'),
(375,130,'','submissionId','12'),
(376,130,'','username','lchristopher'),
(377,131,'','fileId','12'),
(378,131,'en','filename','Sodium butyrate improves growth performance of weaned piglets during the first period after weaning.pdf'),
(379,131,'','fileStage','10'),
(380,131,'','submissionFileId','13'),
(381,131,'','submissionId','12'),
(382,131,'','username','lchristopher'),
(383,132,'','fileId','12'),
(384,132,'en','filename','Sodium butyrate improves growth performance of weaned piglets during the first period after weaning.pdf'),
(385,132,'','fileStage','10'),
(386,132,'','submissionFileId','13'),
(387,132,'','submissionId','12'),
(388,132,'','username','lchristopher'),
(389,133,'','fileId','12'),
(390,133,'en','filename','Sodium butyrate improves growth performance of weaned piglets during the first period after weaning.pdf'),
(391,133,'','fileStage','10'),
(392,133,'','submissionFileId','13'),
(393,133,'','submissionId','12'),
(394,133,'','username','lchristopher'),
(395,134,'','fileId','12'),
(396,134,'en','filename','Sodium butyrate improves growth performance of weaned piglets during the first period after weaning.pdf'),
(397,134,'','fileStage','10'),
(398,134,'','submissionFileId','13'),
(399,134,'','submissionId','12'),
(400,134,'','username','lchristopher'),
(401,137,'','editorName','Daniel Barnes'),
(402,140,'','fileId','13'),
(403,140,'en','filename','Hydrologic Connectivity in the Edwards Aquifer between San Marcos Springs and Barton Springs during 2009 Drought Conditions.pdf'),
(404,140,'','fileStage','10'),
(405,140,'','submissionFileId','14'),
(406,140,'','submissionId','13'),
(407,140,'','username','lkumiega'),
(408,141,'','fileId','13'),
(409,141,'en','filename','Hydrologic Connectivity in the Edwards Aquifer between San Marcos Springs and Barton Springs during 2009 Drought Conditions.pdf'),
(410,141,'','fileStage','10'),
(411,141,'','submissionFileId','14'),
(412,141,'','submissionId','13'),
(413,141,'','username','lkumiega'),
(414,142,'','fileId','13'),
(415,142,'en','filename','Hydrologic Connectivity in the Edwards Aquifer between San Marcos Springs and Barton Springs during 2009 Drought Conditions.pdf'),
(416,142,'','fileStage','10'),
(417,142,'','submissionFileId','14'),
(418,142,'','submissionId','13'),
(419,142,'','username','lkumiega'),
(420,143,'','fileId','13'),
(421,143,'en','filename','Hydrologic Connectivity in the Edwards Aquifer between San Marcos Springs and Barton Springs during 2009 Drought Conditions.pdf'),
(422,143,'','fileStage','10'),
(423,143,'','submissionFileId','14'),
(424,143,'','submissionId','13'),
(425,143,'','username','lkumiega'),
(426,144,'','fileId','13'),
(427,144,'en','filename','Hydrologic Connectivity in the Edwards Aquifer between San Marcos Springs and Barton Springs during 2009 Drought Conditions.pdf'),
(428,144,'','fileStage','10'),
(429,144,'','submissionFileId','14'),
(430,144,'','submissionId','13'),
(431,144,'','username','lkumiega'),
(432,145,'','fileId','13'),
(433,145,'en','filename','Hydrologic Connectivity in the Edwards Aquifer between San Marcos Springs and Barton Springs during 2009 Drought Conditions.pdf'),
(434,145,'','fileStage','10'),
(435,145,'','submissionFileId','14'),
(436,145,'','submissionId','13'),
(437,145,'','username','lkumiega'),
(438,148,'','editorName','Daniel Barnes'),
(439,151,'','fileId','14'),
(440,151,'en','filename','Towards Designing an Intercultural Curriculum: A Case Study from the Atlantic Coast of Nicaragua.pdf'),
(441,151,'','fileStage','10'),
(442,151,'','submissionFileId','15'),
(443,151,'','submissionId','14'),
(444,151,'','username','pdaniel'),
(445,152,'','fileId','14'),
(446,152,'en','filename','Towards Designing an Intercultural Curriculum: A Case Study from the Atlantic Coast of Nicaragua.pdf'),
(447,152,'','fileStage','10'),
(448,152,'','submissionFileId','15'),
(449,152,'','submissionId','14'),
(450,152,'','username','pdaniel'),
(451,153,'','fileId','14'),
(452,153,'en','filename','Towards Designing an Intercultural Curriculum: A Case Study from the Atlantic Coast of Nicaragua.pdf'),
(453,153,'','fileStage','10'),
(454,153,'','submissionFileId','15'),
(455,153,'','submissionId','14'),
(456,153,'','username','pdaniel'),
(457,154,'','fileId','14'),
(458,154,'en','filename','Towards Designing an Intercultural Curriculum: A Case Study from the Atlantic Coast of Nicaragua.pdf'),
(459,154,'','fileStage','10'),
(460,154,'','submissionFileId','15'),
(461,154,'','submissionId','14'),
(462,154,'','username','pdaniel'),
(463,155,'','fileId','14'),
(464,155,'en','filename','Towards Designing an Intercultural Curriculum: A Case Study from the Atlantic Coast of Nicaragua.pdf'),
(465,155,'','fileStage','10'),
(466,155,'','submissionFileId','15'),
(467,155,'','submissionId','14'),
(468,155,'','username','pdaniel'),
(469,156,'','fileId','14'),
(470,156,'en','filename','Towards Designing an Intercultural Curriculum: A Case Study from the Atlantic Coast of Nicaragua.pdf'),
(471,156,'','fileStage','10'),
(472,156,'','submissionFileId','15'),
(473,156,'','submissionId','14'),
(474,156,'','username','pdaniel'),
(475,159,'','editorName','Daniel Barnes'),
(476,162,'','fileId','15'),
(477,162,'en','filename','Yam diseases and its management in Nigeria.pdf'),
(478,162,'','fileStage','10'),
(479,162,'','submissionFileId','16'),
(480,162,'','submissionId','15'),
(481,162,'','username','rbaiyewu'),
(482,163,'','fileId','15'),
(483,163,'en','filename','Yam diseases and its management in Nigeria.pdf'),
(484,163,'','fileStage','10'),
(485,163,'','submissionFileId','16'),
(486,163,'','submissionId','15'),
(487,163,'','username','rbaiyewu'),
(488,164,'','fileId','15'),
(489,164,'en','filename','Yam diseases and its management in Nigeria.pdf'),
(490,164,'','fileStage','10'),
(491,164,'','submissionFileId','16'),
(492,164,'','submissionId','15'),
(493,164,'','username','rbaiyewu'),
(494,165,'','fileId','15'),
(495,165,'en','filename','Yam diseases and its management in Nigeria.pdf'),
(496,165,'','fileStage','10'),
(497,165,'','submissionFileId','16'),
(498,165,'','submissionId','15'),
(499,165,'','username','rbaiyewu'),
(500,168,'','editorName','Daniel Barnes'),
(501,171,'','fileId','16'),
(502,171,'en','filename','Influence of long-term nutrition with different dietary fats on fatty acid composition of heavy pigs backfat.pdf'),
(503,171,'','fileStage','10'),
(504,171,'','submissionFileId','17'),
(505,171,'','submissionId','16'),
(506,171,'','username','rrossi'),
(507,172,'','fileId','16'),
(508,172,'en','filename','Influence of long-term nutrition with different dietary fats on fatty acid composition of heavy pigs backfat.pdf'),
(509,172,'','fileStage','10'),
(510,172,'','submissionFileId','17'),
(511,172,'','submissionId','16'),
(512,172,'','username','rrossi'),
(513,173,'','fileId','16'),
(514,173,'en','filename','Influence of long-term nutrition with different dietary fats on fatty acid composition of heavy pigs backfat.pdf'),
(515,173,'','fileStage','10'),
(516,173,'','submissionFileId','17'),
(517,173,'','submissionId','16'),
(518,173,'','username','rrossi'),
(519,174,'','fileId','16'),
(520,174,'en','filename','Influence of long-term nutrition with different dietary fats on fatty acid composition of heavy pigs backfat.pdf'),
(521,174,'','fileStage','10'),
(522,174,'','submissionFileId','17'),
(523,174,'','submissionId','16'),
(524,174,'','username','rrossi'),
(525,175,'','fileId','16'),
(526,175,'en','filename','Influence of long-term nutrition with different dietary fats on fatty acid composition of heavy pigs backfat.pdf'),
(527,175,'','fileStage','10'),
(528,175,'','submissionFileId','17'),
(529,175,'','submissionId','16'),
(530,175,'','username','rrossi'),
(531,176,'','fileId','16'),
(532,176,'en','filename','Influence of long-term nutrition with different dietary fats on fatty acid composition of heavy pigs backfat.pdf'),
(533,176,'','fileStage','10'),
(534,176,'','submissionFileId','17'),
(535,176,'','submissionId','16'),
(536,176,'','username','rrossi'),
(537,179,'','editorName','Daniel Barnes'),
(538,182,'','fileId','17'),
(539,182,'en','filename','Antimicrobial, heavy metal resistance and plasmid profile of coliforms isolated from nosocomial infections in a hospital in Isfahan, Iran.pdf'),
(540,182,'','fileStage','10'),
(541,182,'','submissionFileId','18'),
(542,182,'','submissionId','17'),
(543,182,'','username','vkarbasizaed'),
(544,183,'','fileId','17'),
(545,183,'en','filename','Antimicrobial, heavy metal resistance and plasmid profile of coliforms isolated from nosocomial infections in a hospital in Isfahan, Iran.pdf'),
(546,183,'','fileStage','10'),
(547,183,'','submissionFileId','18'),
(548,183,'','submissionId','17'),
(549,183,'','username','vkarbasizaed'),
(550,184,'','fileId','17'),
(551,184,'en','filename','Antimicrobial, heavy metal resistance and plasmid profile of coliforms isolated from nosocomial infections in a hospital in Isfahan, Iran.pdf'),
(552,184,'','fileStage','10'),
(553,184,'','submissionFileId','18'),
(554,184,'','submissionId','17'),
(555,184,'','username','vkarbasizaed'),
(556,185,'','fileId','17'),
(557,185,'en','filename','Antimicrobial, heavy metal resistance and plasmid profile of coliforms isolated from nosocomial infections in a hospital in Isfahan, Iran.pdf'),
(558,185,'','fileStage','10'),
(559,185,'','submissionFileId','18'),
(560,185,'','submissionId','17'),
(561,185,'','username','vkarbasizaed'),
(562,188,'','editorName','Daniel Barnes'),
(563,191,'','fileId','18'),
(564,191,'en','filename','Self-Organization in Multi-Level Institutions in Networked Environments.pdf'),
(565,191,'','fileStage','10'),
(566,191,'','submissionFileId','19'),
(567,191,'','submissionId','18'),
(568,191,'','username','vwilliamson'),
(569,192,'','fileId','18'),
(570,192,'en','filename','Self-Organization in Multi-Level Institutions in Networked Environments.pdf'),
(571,192,'','fileStage','10'),
(572,192,'','submissionFileId','19'),
(573,192,'','submissionId','18'),
(574,192,'','username','vwilliamson'),
(575,193,'','fileId','18'),
(576,193,'en','filename','Self-Organization in Multi-Level Institutions in Networked Environments.pdf'),
(577,193,'','fileStage','10'),
(578,193,'','submissionFileId','19'),
(579,193,'','submissionId','18'),
(580,193,'','username','vwilliamson'),
(581,194,'','fileId','18'),
(582,194,'en','filename','Self-Organization in Multi-Level Institutions in Networked Environments.pdf'),
(583,194,'','fileStage','10'),
(584,194,'','submissionFileId','19'),
(585,194,'','submissionId','18'),
(586,194,'','username','vwilliamson'),
(587,195,'','fileId','18'),
(588,195,'en','filename','Self-Organization in Multi-Level Institutions in Networked Environments.pdf'),
(589,195,'','fileStage','10'),
(590,195,'','submissionFileId','19'),
(591,195,'','submissionId','18'),
(592,195,'','username','vwilliamson'),
(593,196,'','fileId','18'),
(594,196,'en','filename','Self-Organization in Multi-Level Institutions in Networked Environments.pdf'),
(595,196,'','fileStage','10'),
(596,196,'','submissionFileId','19'),
(597,196,'','submissionId','18'),
(598,196,'','username','vwilliamson'),
(599,199,'','editorName','Daniel Barnes'),
(600,202,'','fileId','19'),
(601,202,'en','filename','Finocchiaro: Arguments About Arguments.pdf'),
(602,202,'','fileStage','10'),
(603,202,'','submissionFileId','20'),
(604,202,'','submissionId','19'),
(605,202,'','username','zwoods'),
(606,203,'','fileId','19'),
(607,203,'en','filename','Finocchiaro: Arguments About Arguments.pdf'),
(608,203,'','fileStage','10'),
(609,203,'','submissionFileId','20'),
(610,203,'','submissionId','19'),
(611,203,'','username','zwoods'),
(612,204,'','fileId','19'),
(613,204,'en','filename','Finocchiaro: Arguments About Arguments.pdf'),
(614,204,'','fileStage','10'),
(615,204,'','submissionFileId','20'),
(616,204,'','submissionId','19'),
(617,204,'','username','zwoods'),
(618,205,'','fileId','19'),
(619,205,'en','filename','Finocchiaro: Arguments About Arguments.pdf'),
(620,205,'','fileStage','10'),
(621,205,'','submissionFileId','20'),
(622,205,'','submissionId','19'),
(623,205,'','username','zwoods'),
(624,206,'','fileId','19'),
(625,206,'en','filename','Finocchiaro: Arguments About Arguments.pdf'),
(626,206,'','fileStage','10'),
(627,206,'','submissionFileId','20'),
(628,206,'','submissionId','19'),
(629,206,'','username','zwoods'),
(630,207,'','fileId','19'),
(631,207,'en','filename','Finocchiaro: Arguments About Arguments.pdf'),
(632,207,'','fileStage','10'),
(633,207,'','submissionFileId','20'),
(634,207,'','submissionId','19'),
(635,207,'','username','zwoods'),
(636,210,'','editorName','Daniel Barnes');
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
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='Records information in the database about files tracked by the system, linking them to the local filesystem.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `files`
--

LOCK TABLES `files` WRITE;
/*!40000 ALTER TABLE `files` DISABLE KEYS */;
INSERT INTO `files` VALUES
(1,'contexts/1/submissions/1/6b019cca38d52.pdf','application/pdf'),
(2,'contexts/1/submissions/2/6b019cde03f99.pdf','application/pdf'),
(3,'contexts/1/submissions/3/6b019d1a3d0ba.pdf','application/pdf'),
(4,'contexts/1/submissions/4/6b019d3d27d24.pdf','application/pdf'),
(5,'contexts/1/submissions/5/6b019d5f20ff0.pdf','application/pdf'),
(6,'contexts/1/submissions/6/6b019d7d6ef84.pdf','application/pdf'),
(7,'contexts/1/submissions/7/6b019d93833be.pdf','application/pdf'),
(8,'contexts/1/submissions/8/6b019da9ef9b1.pdf','application/pdf'),
(9,'contexts/1/submissions/9/6b019dbfc2fdf.pdf','application/pdf'),
(10,'contexts/1/submissions/10/6b019dd598a51.pdf','application/pdf'),
(11,'contexts/1/submissions/11/6b019deb9477f.pdf','application/pdf'),
(12,'contexts/1/submissions/12/6b019e01dd46a.pdf','application/pdf'),
(13,'contexts/1/submissions/13/6b019e17d41a3.pdf','application/pdf'),
(14,'contexts/1/submissions/14/6b019e2dde9ac.pdf','application/pdf'),
(15,'contexts/1/submissions/15/6b019e46cc780.pdf','application/pdf'),
(16,'contexts/1/submissions/16/6b019e5c79a68.pdf','application/pdf'),
(17,'contexts/1/submissions/17/6b019e72422a3.pdf','application/pdf'),
(18,'contexts/1/submissions/18/6b019e8801876.pdf','application/pdf'),
(19,'contexts/1/submissions/19/6b019e9df24d8.pdf','application/pdf');
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
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='Filter groups are used to organized filters into named sets, which can be retrieved by the application for invocation.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `filter_groups`
--

LOCK TABLES `filter_groups` WRITE;
/*!40000 ALTER TABLE `filter_groups` DISABLE KEYS */;
INSERT INTO `filter_groups` VALUES
(1,'preprint=>crossref-xml','plugins.importexport.crossref.displayName','plugins.importexport.crossref.description','class::APP\\submission\\Submission[]','xml::schema(https://www.crossref.org/schemas/crossref5.4.0.xsd)'),
(2,'preprint=>dc11','plugins.metadata.dc11.preprintAdapter.displayName','plugins.metadata.dc11.preprintAdapter.description','class::APP\\submission\\Submission','metadata::APP\\plugins\\metadata\\dc11\\schema\\Dc11Schema(PREPRINT)'),
(3,'preprint=>native-xml','plugins.importexport.native.displayName','plugins.importexport.native.description','class::APP\\submission\\Submission[]','xml::schema(plugins/importexport/native/native.xsd)'),
(4,'native-xml=>preprint','plugins.importexport.native.displayName','plugins.importexport.native.description','xml::schema(plugins/importexport/native/native.xsd)','class::APP\\submission\\Submission[]'),
(5,'author=>native-xml','plugins.importexport.native.displayName','plugins.importexport.native.description','class::APP\\author\\Author[]','xml::schema(plugins/importexport/native/native.xsd)'),
(6,'native-xml=>author','plugins.importexport.native.displayName','plugins.importexport.native.description','xml::schema(plugins/importexport/native/native.xsd)','class::APP\\author\\Author[]'),
(7,'SubmissionFile=>native-xml','plugins.importexport.native.displayName','plugins.importexport.native.description','class::PKP\\submissionFile\\SubmissionFile','xml::schema(plugins/importexport/native/native.xsd)'),
(8,'native-xml=>SubmissionFile','plugins.importexport.native.displayName','plugins.importexport.native.description','xml::schema(plugins/importexport/native/native.xsd)','class::PKP\\submissionFile\\SubmissionFile[]'),
(9,'preprint-galley=>native-xml','plugins.importexport.native.displayName','plugins.importexport.native.description','class::PKP\\galley\\Galley','xml::schema(plugins/importexport/native/native.xsd)'),
(10,'native-xml=>PreprintGalley','plugins.importexport.native.displayName','plugins.importexport.native.description','xml::schema(plugins/importexport/native/native.xsd)','class::PKP\\galley\\Galley[]'),
(11,'publication=>native-xml','plugins.importexport.native.displayName','plugins.importexport.native.description','class::APP\\publication\\Publication','xml::schema(plugins/importexport/native/native.xsd)'),
(12,'native-xml=>Publication','plugins.importexport.native.displayName','plugins.importexport.native.description','xml::schema(plugins/importexport/native/native.xsd)','class::APP\\publication\\Publication[]');
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
-- Table structure for table `funder_settings`
--

DROP TABLE IF EXISTS `funder_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `funder_settings` (
  `funder_setting_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `funder_id` bigint(20) NOT NULL,
  `locale` varchar(28) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` mediumtext DEFAULT NULL,
  PRIMARY KEY (`funder_setting_id`),
  UNIQUE KEY `funder_settings_unique` (`funder_id`,`locale`,`setting_name`),
  KEY `funder_settings_funder_id` (`funder_id`),
  CONSTRAINT `funder_settings_funder_id` FOREIGN KEY (`funder_id`) REFERENCES `funders` (`funder_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='Additional data about funders.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `funder_settings`
--

LOCK TABLES `funder_settings` WRITE;
/*!40000 ALTER TABLE `funder_settings` DISABLE KEYS */;
/*!40000 ALTER TABLE `funder_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `funders`
--

DROP TABLE IF EXISTS `funders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `funders` (
  `funder_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `submission_id` bigint(20) NOT NULL,
  `ror` varchar(255) DEFAULT NULL,
  `seq` bigint(20) NOT NULL DEFAULT 0,
  PRIMARY KEY (`funder_id`),
  KEY `funders_ror` (`ror`),
  KEY `funders_submission` (`submission_id`),
  CONSTRAINT `funders_submission` FOREIGN KEY (`submission_id`) REFERENCES `submissions` (`submission_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='A funder associated with a publication.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `funders`
--

LOCK TABLES `funders` WRITE;
/*!40000 ALTER TABLE `funders` DISABLE KEYS */;
/*!40000 ALTER TABLE `funders` ENABLE KEYS */;
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
  `supports_file_variants` tinyint(1) NOT NULL DEFAULT 0 COMMENT 'Whether submission files in this genre support variant types, e.g. "web" or "high resolution"',
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
(1,1,0,1,1,0,0,1,'SUBMISSION',0),
(2,1,1,1,3,0,1,0,'RESEARCHINSTRUMENT',0),
(3,1,2,1,3,0,1,0,'RESEARCHMATERIALS',0),
(4,1,3,1,3,0,1,0,'RESEARCHRESULTS',0),
(5,1,4,1,3,0,1,0,'TRANSCRIPTS',0),
(6,1,5,1,3,0,1,0,'DATAANALYSIS',0),
(7,1,6,1,3,0,1,0,'DATASET',0),
(8,1,7,1,3,0,1,0,'SOURCETEXTS',0),
(9,1,8,1,1,1,1,0,'MULTIMEDIA',0),
(10,1,9,1,2,1,0,0,'IMAGE',1),
(11,1,10,1,1,1,0,0,'STYLE',0),
(12,1,11,1,3,0,1,0,'OTHER',0);
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
  CONSTRAINT `invitations_context_id` FOREIGN KEY (`context_id`) REFERENCES `servers` (`server_id`) ON DELETE CASCADE,
  CONSTRAINT `invitations_inviter_id_foreign` FOREIGN KEY (`inviter_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE,
  CONSTRAINT `invitations_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='Invitations are sent to request a person (by email) to allow them to accept or reject an operation or position, such as a board membership or a submission peer review.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `invitations`
--

LOCK TABLES `invitations` WRITE;
/*!40000 ALTER TABLE `invitations` DISABLE KEYS */;
INSERT INTO `invitations` VALUES
(1,'$2y$10$kyHF4hCC/.EyUkwKhz4qGOMS/WYSup1K92dz40ZaUWQ7T7iSct.aW','userRoleAssignment',NULL,1,'2026-11-24 13:27:29','{\"orcid\":null,\"orcidAccessDenied\":null,\"orcidAccessExpiresOn\":null,\"orcidAccessScope\":null,\"orcidAccessToken\":null,\"orcidIsVerified\":null,\"orcidRefreshToken\":null,\"givenName\":{\"en\":\"Ramiro\",\"fr_CA\":\"Ramiro\"},\"familyName\":{\"en\":\"Vaca\",\"fr_CA\":\"Vaca\"},\"affiliation\":{\"en\":\"Universidad Nacional Aut\\u00f3noma de M\\u00e9xico\",\"fr_CA\":\"Mexico\"},\"userCountry\":\"MX\",\"username\":\"rvaca\",\"password\":\"$2y$12$y9mWK72FWCSHbGzntQcPR.qAVReQA5tSMG8zGk.QQvWCZPgWUOEpC\",\"userGroupsToAdd\":[{\"userGroupId\":2,\"dateStart\":\"2026-11-21\",\"dateEnd\":null,\"masthead\":true}],\"passwordHashed\":true,\"sendEmailAddress\":\"rvaca@mailinator.com\",\"inviteStagePayload\":{\"orcid\":null,\"orcidAccessDenied\":null,\"orcidAccessExpiresOn\":null,\"orcidAccessScope\":null,\"orcidAccessToken\":null,\"orcidIsVerified\":null,\"orcidRefreshToken\":null,\"givenName\":null,\"familyName\":null,\"affiliation\":null,\"userCountry\":null,\"username\":null,\"password\":null,\"userGroupsToAdd\":[{\"userGroupId\":2,\"dateStart\":\"2026-11-21\",\"dateEnd\":null,\"masthead\":true}],\"passwordHashed\":null,\"sendEmailAddress\":\"rvaca@mailinator.com\",\"inviteStagePayload\":null,\"shouldUseInviteData\":null,\"emailComposer\":{\"body\":\"<div class=\'email-container\'>    <div class=\'email-header\'>        <h2>Invitation to New Role<\\/h2>    <\\/div>    <div class=\'email-content\'>        <p>Dear {$recipientName},<\\/p>        <p>In light of your expertise, you have been invited by {$inviterName} to take on new roles at Public Knowledge Preprint Server<\\/p>        <p>At Public Knowledge Preprint Server, we value your privacy. As such, we have taken steps to ensure that we are fully GDPR compliant. These steps include you being accountable to enter your own data and choosing who can see what information. For additional information on how we handled your data, please refer to our Privacy Policy.<\\/p>        <div>{$existingRoles}<\\/div>        <div>{$rolesAdded}<\\/div>        <p>On accepting the invite, you will be redirected to Public Knowledge Preprint Server.<\\/p>        <p>Feel free to contact me with any questions about the process.<\\/p>        <table class=\'btn-wrap\' role=\'presentation\' border=\'0\' cellpadding=\'0\' cellspacing=\'10\'>            <tr><td class=\'btn-cell btn-accept\'  bgcolor=\'#28a745\'><a class=\'btn\' href=\'{$acceptUrl}\'>Accept Invitation<\\/a><\\/td><\\/tr>            <tr><td class=\'btn-cell btn-decline\' bgcolor=\'#dc3545\'><a class=\'btn\' href=\'{$declineUrl}\'>Decline Invitation<\\/a><\\/td><\\/tr>        <\\/table>        <p>Kind regards,<\\/p>        <p>Public Knowledge Preprint Server<\\/p>    <\\/div><\\/div>\",\"subject\":\"You are invited to new roles\"}},\"shouldUseInviteData\":null,\"emailComposer\":{\"body\":\"<div class=\'email-container\'>    <div class=\'email-header\'>        <h2>Invitation to New Role<\\/h2>    <\\/div>    <div class=\'email-content\'>        <p>Dear {$recipientName},<\\/p>        <p>In light of your expertise, you have been invited by {$inviterName} to take on new roles at Public Knowledge Preprint Server<\\/p>        <p>At Public Knowledge Preprint Server, we value your privacy. As such, we have taken steps to ensure that we are fully GDPR compliant. These steps include you being accountable to enter your own data and choosing who can see what information. For additional information on how we handled your data, please refer to our Privacy Policy.<\\/p>        <div>{$existingRoles}<\\/div>        <div>{$rolesAdded}<\\/div>        <p>On accepting the invite, you will be redirected to Public Knowledge Preprint Server.<\\/p>        <p>Feel free to contact me with any questions about the process.<\\/p>        <table class=\'btn-wrap\' role=\'presentation\' border=\'0\' cellpadding=\'0\' cellspacing=\'10\'>            <tr><td class=\'btn-cell btn-accept\'  bgcolor=\'#28a745\'><a class=\'btn\' href=\'{$acceptUrl}\'>Accept Invitation<\\/a><\\/td><\\/tr>            <tr><td class=\'btn-cell btn-decline\' bgcolor=\'#dc3545\'><a class=\'btn\' href=\'{$declineUrl}\'>Decline Invitation<\\/a><\\/td><\\/tr>        <\\/table>        <p>Kind regards,<\\/p>        <p>Public Knowledge Preprint Server<\\/p>    <\\/div><\\/div>\",\"subject\":\"You are invited to new roles\"}}','ACCEPTED','rvaca@mailinator.com',1,'2026-11-21 13:27:27','2026-11-21 13:27:37'),
(2,'$2y$10$HfSBIPs0I3dKkzHxSYlc3exf7PvkrOxevoThjMUzlQvvgMmTNODwi','userRoleAssignment',NULL,1,'2026-11-24 13:27:47','{\"orcid\":null,\"orcidAccessDenied\":null,\"orcidAccessExpiresOn\":null,\"orcidAccessScope\":null,\"orcidAccessToken\":null,\"orcidIsVerified\":null,\"orcidRefreshToken\":null,\"givenName\":{\"en\":\"Daniel\",\"fr_CA\":\"Daniel\"},\"familyName\":{\"en\":\"Barnes\",\"fr_CA\":\"Barnes\"},\"affiliation\":{\"en\":\"University of Melbourne\",\"fr_CA\":\"Australia\"},\"userCountry\":\"AU\",\"username\":\"dbarnes\",\"password\":\"$2y$12$AdUIzbx7wLqOEEGay3ORqeVSabGLwvPhrVuZMlYPSk1\\/InbvqxMYq\",\"userGroupsToAdd\":[{\"userGroupId\":2,\"dateStart\":\"2026-11-21\",\"dateEnd\":null,\"masthead\":true}],\"passwordHashed\":true,\"sendEmailAddress\":\"dbarnes@mailinator.com\",\"inviteStagePayload\":{\"orcid\":null,\"orcidAccessDenied\":null,\"orcidAccessExpiresOn\":null,\"orcidAccessScope\":null,\"orcidAccessToken\":null,\"orcidIsVerified\":null,\"orcidRefreshToken\":null,\"givenName\":null,\"familyName\":null,\"affiliation\":null,\"userCountry\":null,\"username\":null,\"password\":null,\"userGroupsToAdd\":[{\"userGroupId\":2,\"dateStart\":\"2026-11-21\",\"dateEnd\":null,\"masthead\":true}],\"passwordHashed\":null,\"sendEmailAddress\":\"dbarnes@mailinator.com\",\"inviteStagePayload\":null,\"shouldUseInviteData\":null,\"emailComposer\":{\"body\":\"<div class=\'email-container\'>    <div class=\'email-header\'>        <h2>Invitation to New Role<\\/h2>    <\\/div>    <div class=\'email-content\'>        <p>Dear {$recipientName},<\\/p>        <p>In light of your expertise, you have been invited by {$inviterName} to take on new roles at Public Knowledge Preprint Server<\\/p>        <p>At Public Knowledge Preprint Server, we value your privacy. As such, we have taken steps to ensure that we are fully GDPR compliant. These steps include you being accountable to enter your own data and choosing who can see what information. For additional information on how we handled your data, please refer to our Privacy Policy.<\\/p>        <div>{$existingRoles}<\\/div>        <div>{$rolesAdded}<\\/div>        <p>On accepting the invite, you will be redirected to Public Knowledge Preprint Server.<\\/p>        <p>Feel free to contact me with any questions about the process.<\\/p>        <table class=\'btn-wrap\' role=\'presentation\' border=\'0\' cellpadding=\'0\' cellspacing=\'10\'>            <tr><td class=\'btn-cell btn-accept\'  bgcolor=\'#28a745\'><a class=\'btn\' href=\'{$acceptUrl}\'>Accept Invitation<\\/a><\\/td><\\/tr>            <tr><td class=\'btn-cell btn-decline\' bgcolor=\'#dc3545\'><a class=\'btn\' href=\'{$declineUrl}\'>Decline Invitation<\\/a><\\/td><\\/tr>        <\\/table>        <p>Kind regards,<\\/p>        <p>Public Knowledge Preprint Server<\\/p>    <\\/div><\\/div>\",\"subject\":\"You are invited to new roles\"}},\"shouldUseInviteData\":null,\"emailComposer\":{\"body\":\"<div class=\'email-container\'>    <div class=\'email-header\'>        <h2>Invitation to New Role<\\/h2>    <\\/div>    <div class=\'email-content\'>        <p>Dear {$recipientName},<\\/p>        <p>In light of your expertise, you have been invited by {$inviterName} to take on new roles at Public Knowledge Preprint Server<\\/p>        <p>At Public Knowledge Preprint Server, we value your privacy. As such, we have taken steps to ensure that we are fully GDPR compliant. These steps include you being accountable to enter your own data and choosing who can see what information. For additional information on how we handled your data, please refer to our Privacy Policy.<\\/p>        <div>{$existingRoles}<\\/div>        <div>{$rolesAdded}<\\/div>        <p>On accepting the invite, you will be redirected to Public Knowledge Preprint Server.<\\/p>        <p>Feel free to contact me with any questions about the process.<\\/p>        <table class=\'btn-wrap\' role=\'presentation\' border=\'0\' cellpadding=\'0\' cellspacing=\'10\'>            <tr><td class=\'btn-cell btn-accept\'  bgcolor=\'#28a745\'><a class=\'btn\' href=\'{$acceptUrl}\'>Accept Invitation<\\/a><\\/td><\\/tr>            <tr><td class=\'btn-cell btn-decline\' bgcolor=\'#dc3545\'><a class=\'btn\' href=\'{$declineUrl}\'>Decline Invitation<\\/a><\\/td><\\/tr>        <\\/table>        <p>Kind regards,<\\/p>        <p>Public Knowledge Preprint Server<\\/p>    <\\/div><\\/div>\",\"subject\":\"You are invited to new roles\"}}','ACCEPTED','dbarnes@mailinator.com',1,'2026-11-21 13:27:45','2026-11-21 13:27:55'),
(3,'$2y$10$K3maQHBUFWAb5PEV0osALeDd0zpee3xo.h8QnzhIloF94aIvZnajC','userRoleAssignment',NULL,1,'2026-11-24 13:28:06','{\"orcid\":null,\"orcidAccessDenied\":null,\"orcidAccessExpiresOn\":null,\"orcidAccessScope\":null,\"orcidAccessToken\":null,\"orcidIsVerified\":null,\"orcidRefreshToken\":null,\"givenName\":{\"en\":\"David\",\"fr_CA\":\"David\"},\"familyName\":{\"en\":\"Buskins\",\"fr_CA\":\"Buskins\"},\"affiliation\":{\"en\":\"University of Chicago\",\"fr_CA\":\"United States\"},\"userCountry\":\"US\",\"username\":\"dbuskins\",\"password\":\"$2y$12$N8K1hllC19iRBOC76YEDFuG6w1Cb5OTDnkj.bQqh4AvDzHPeTDrZC\",\"userGroupsToAdd\":[{\"userGroupId\":3,\"dateStart\":\"2026-11-21\",\"dateEnd\":null,\"masthead\":true}],\"passwordHashed\":true,\"sendEmailAddress\":\"dbuskins@mailinator.com\",\"inviteStagePayload\":{\"orcid\":null,\"orcidAccessDenied\":null,\"orcidAccessExpiresOn\":null,\"orcidAccessScope\":null,\"orcidAccessToken\":null,\"orcidIsVerified\":null,\"orcidRefreshToken\":null,\"givenName\":null,\"familyName\":null,\"affiliation\":null,\"userCountry\":null,\"username\":null,\"password\":null,\"userGroupsToAdd\":[{\"userGroupId\":3,\"dateStart\":\"2026-11-21\",\"dateEnd\":null,\"masthead\":true}],\"passwordHashed\":null,\"sendEmailAddress\":\"dbuskins@mailinator.com\",\"inviteStagePayload\":null,\"shouldUseInviteData\":null,\"emailComposer\":{\"body\":\"<div class=\'email-container\'>    <div class=\'email-header\'>        <h2>Invitation to New Role<\\/h2>    <\\/div>    <div class=\'email-content\'>        <p>Dear {$recipientName},<\\/p>        <p>In light of your expertise, you have been invited by {$inviterName} to take on new roles at Public Knowledge Preprint Server<\\/p>        <p>At Public Knowledge Preprint Server, we value your privacy. As such, we have taken steps to ensure that we are fully GDPR compliant. These steps include you being accountable to enter your own data and choosing who can see what information. For additional information on how we handled your data, please refer to our Privacy Policy.<\\/p>        <div>{$existingRoles}<\\/div>        <div>{$rolesAdded}<\\/div>        <p>On accepting the invite, you will be redirected to Public Knowledge Preprint Server.<\\/p>        <p>Feel free to contact me with any questions about the process.<\\/p>        <table class=\'btn-wrap\' role=\'presentation\' border=\'0\' cellpadding=\'0\' cellspacing=\'10\'>            <tr><td class=\'btn-cell btn-accept\'  bgcolor=\'#28a745\'><a class=\'btn\' href=\'{$acceptUrl}\'>Accept Invitation<\\/a><\\/td><\\/tr>            <tr><td class=\'btn-cell btn-decline\' bgcolor=\'#dc3545\'><a class=\'btn\' href=\'{$declineUrl}\'>Decline Invitation<\\/a><\\/td><\\/tr>        <\\/table>        <p>Kind regards,<\\/p>        <p>Public Knowledge Preprint Server<\\/p>    <\\/div><\\/div>\",\"subject\":\"You are invited to new roles\"}},\"shouldUseInviteData\":null,\"emailComposer\":{\"body\":\"<div class=\'email-container\'>    <div class=\'email-header\'>        <h2>Invitation to New Role<\\/h2>    <\\/div>    <div class=\'email-content\'>        <p>Dear {$recipientName},<\\/p>        <p>In light of your expertise, you have been invited by {$inviterName} to take on new roles at Public Knowledge Preprint Server<\\/p>        <p>At Public Knowledge Preprint Server, we value your privacy. As such, we have taken steps to ensure that we are fully GDPR compliant. These steps include you being accountable to enter your own data and choosing who can see what information. For additional information on how we handled your data, please refer to our Privacy Policy.<\\/p>        <div>{$existingRoles}<\\/div>        <div>{$rolesAdded}<\\/div>        <p>On accepting the invite, you will be redirected to Public Knowledge Preprint Server.<\\/p>        <p>Feel free to contact me with any questions about the process.<\\/p>        <table class=\'btn-wrap\' role=\'presentation\' border=\'0\' cellpadding=\'0\' cellspacing=\'10\'>            <tr><td class=\'btn-cell btn-accept\'  bgcolor=\'#28a745\'><a class=\'btn\' href=\'{$acceptUrl}\'>Accept Invitation<\\/a><\\/td><\\/tr>            <tr><td class=\'btn-cell btn-decline\' bgcolor=\'#dc3545\'><a class=\'btn\' href=\'{$declineUrl}\'>Decline Invitation<\\/a><\\/td><\\/tr>        <\\/table>        <p>Kind regards,<\\/p>        <p>Public Knowledge Preprint Server<\\/p>    <\\/div><\\/div>\",\"subject\":\"You are invited to new roles\"}}','ACCEPTED','dbuskins@mailinator.com',1,'2026-11-21 13:28:04','2026-11-21 13:28:14'),
(4,'$2y$10$ZMCwA1l8CiV4wnRYN9pDvOpaMhYS7bLeA6.J4BAU0BdiTWZ/FjgWC','userRoleAssignment',NULL,1,'2026-11-24 13:28:25','{\"orcid\":null,\"orcidAccessDenied\":null,\"orcidAccessExpiresOn\":null,\"orcidAccessScope\":null,\"orcidAccessToken\":null,\"orcidIsVerified\":null,\"orcidRefreshToken\":null,\"givenName\":{\"en\":\"Stephanie\",\"fr_CA\":\"Stephanie\"},\"familyName\":{\"en\":\"Berardo\",\"fr_CA\":\"Berardo\"},\"affiliation\":{\"en\":\"University of Toronto\",\"fr_CA\":\"Canada\"},\"userCountry\":\"CA\",\"username\":\"sberardo\",\"password\":\"$2y$12$O8ZeTKvS3K3wzs1lIp2kjOpKrEMqwOfGYb.iXFNYjCCxjxjReiEvi\",\"userGroupsToAdd\":[{\"userGroupId\":3,\"dateStart\":\"2026-11-21\",\"dateEnd\":null,\"masthead\":true}],\"passwordHashed\":true,\"sendEmailAddress\":\"sberardo@mailinator.com\",\"inviteStagePayload\":{\"orcid\":null,\"orcidAccessDenied\":null,\"orcidAccessExpiresOn\":null,\"orcidAccessScope\":null,\"orcidAccessToken\":null,\"orcidIsVerified\":null,\"orcidRefreshToken\":null,\"givenName\":null,\"familyName\":null,\"affiliation\":null,\"userCountry\":null,\"username\":null,\"password\":null,\"userGroupsToAdd\":[{\"userGroupId\":3,\"dateStart\":\"2026-11-21\",\"dateEnd\":null,\"masthead\":true}],\"passwordHashed\":null,\"sendEmailAddress\":\"sberardo@mailinator.com\",\"inviteStagePayload\":null,\"shouldUseInviteData\":null,\"emailComposer\":{\"body\":\"<div class=\'email-container\'>    <div class=\'email-header\'>        <h2>Invitation to New Role<\\/h2>    <\\/div>    <div class=\'email-content\'>        <p>Dear {$recipientName},<\\/p>        <p>In light of your expertise, you have been invited by {$inviterName} to take on new roles at Public Knowledge Preprint Server<\\/p>        <p>At Public Knowledge Preprint Server, we value your privacy. As such, we have taken steps to ensure that we are fully GDPR compliant. These steps include you being accountable to enter your own data and choosing who can see what information. For additional information on how we handled your data, please refer to our Privacy Policy.<\\/p>        <div>{$existingRoles}<\\/div>        <div>{$rolesAdded}<\\/div>        <p>On accepting the invite, you will be redirected to Public Knowledge Preprint Server.<\\/p>        <p>Feel free to contact me with any questions about the process.<\\/p>        <table class=\'btn-wrap\' role=\'presentation\' border=\'0\' cellpadding=\'0\' cellspacing=\'10\'>            <tr><td class=\'btn-cell btn-accept\'  bgcolor=\'#28a745\'><a class=\'btn\' href=\'{$acceptUrl}\'>Accept Invitation<\\/a><\\/td><\\/tr>            <tr><td class=\'btn-cell btn-decline\' bgcolor=\'#dc3545\'><a class=\'btn\' href=\'{$declineUrl}\'>Decline Invitation<\\/a><\\/td><\\/tr>        <\\/table>        <p>Kind regards,<\\/p>        <p>Public Knowledge Preprint Server<\\/p>    <\\/div><\\/div>\",\"subject\":\"You are invited to new roles\"}},\"shouldUseInviteData\":null,\"emailComposer\":{\"body\":\"<div class=\'email-container\'>    <div class=\'email-header\'>        <h2>Invitation to New Role<\\/h2>    <\\/div>    <div class=\'email-content\'>        <p>Dear {$recipientName},<\\/p>        <p>In light of your expertise, you have been invited by {$inviterName} to take on new roles at Public Knowledge Preprint Server<\\/p>        <p>At Public Knowledge Preprint Server, we value your privacy. As such, we have taken steps to ensure that we are fully GDPR compliant. These steps include you being accountable to enter your own data and choosing who can see what information. For additional information on how we handled your data, please refer to our Privacy Policy.<\\/p>        <div>{$existingRoles}<\\/div>        <div>{$rolesAdded}<\\/div>        <p>On accepting the invite, you will be redirected to Public Knowledge Preprint Server.<\\/p>        <p>Feel free to contact me with any questions about the process.<\\/p>        <table class=\'btn-wrap\' role=\'presentation\' border=\'0\' cellpadding=\'0\' cellspacing=\'10\'>            <tr><td class=\'btn-cell btn-accept\'  bgcolor=\'#28a745\'><a class=\'btn\' href=\'{$acceptUrl}\'>Accept Invitation<\\/a><\\/td><\\/tr>            <tr><td class=\'btn-cell btn-decline\' bgcolor=\'#dc3545\'><a class=\'btn\' href=\'{$declineUrl}\'>Decline Invitation<\\/a><\\/td><\\/tr>        <\\/table>        <p>Kind regards,<\\/p>        <p>Public Knowledge Preprint Server<\\/p>    <\\/div><\\/div>\",\"subject\":\"You are invited to new roles\"}}','ACCEPTED','sberardo@mailinator.com',1,'2026-11-21 13:28:23','2026-11-21 13:28:34'),
(5,'$2y$10$SiAlzZmug6XHRX6jp.rmnO/LHFnB9Us.YJtiLnSWCxudiOyHKOrF2','userRoleAssignment',NULL,1,'2026-11-24 13:28:46','{\"orcid\":null,\"orcidAccessDenied\":null,\"orcidAccessExpiresOn\":null,\"orcidAccessScope\":null,\"orcidAccessToken\":null,\"orcidIsVerified\":null,\"orcidRefreshToken\":null,\"givenName\":{\"en\":\"Minoti\",\"fr_CA\":\"Minoti\"},\"familyName\":{\"en\":\"Inoue\",\"fr_CA\":\"Inoue\"},\"affiliation\":{\"en\":\"Kyoto University\",\"fr_CA\":\"Japan\"},\"userCountry\":\"JP\",\"username\":\"minoue\",\"password\":\"$2y$12$9i3pcWdFJICgp1lQ5D1BMumCNB3mKo6v\\/LVCvB0gvlpdeIDmnwm1.\",\"userGroupsToAdd\":[{\"userGroupId\":3,\"dateStart\":\"2026-11-21\",\"dateEnd\":null,\"masthead\":true}],\"passwordHashed\":true,\"sendEmailAddress\":\"minoue@mailinator.com\",\"inviteStagePayload\":{\"orcid\":null,\"orcidAccessDenied\":null,\"orcidAccessExpiresOn\":null,\"orcidAccessScope\":null,\"orcidAccessToken\":null,\"orcidIsVerified\":null,\"orcidRefreshToken\":null,\"givenName\":null,\"familyName\":null,\"affiliation\":null,\"userCountry\":null,\"username\":null,\"password\":null,\"userGroupsToAdd\":[{\"userGroupId\":3,\"dateStart\":\"2026-11-21\",\"dateEnd\":null,\"masthead\":true}],\"passwordHashed\":null,\"sendEmailAddress\":\"minoue@mailinator.com\",\"inviteStagePayload\":null,\"shouldUseInviteData\":null,\"emailComposer\":{\"body\":\"<div class=\'email-container\'>    <div class=\'email-header\'>        <h2>Invitation to New Role<\\/h2>    <\\/div>    <div class=\'email-content\'>        <p>Dear {$recipientName},<\\/p>        <p>In light of your expertise, you have been invited by {$inviterName} to take on new roles at Public Knowledge Preprint Server<\\/p>        <p>At Public Knowledge Preprint Server, we value your privacy. As such, we have taken steps to ensure that we are fully GDPR compliant. These steps include you being accountable to enter your own data and choosing who can see what information. For additional information on how we handled your data, please refer to our Privacy Policy.<\\/p>        <div>{$existingRoles}<\\/div>        <div>{$rolesAdded}<\\/div>        <p>On accepting the invite, you will be redirected to Public Knowledge Preprint Server.<\\/p>        <p>Feel free to contact me with any questions about the process.<\\/p>        <table class=\'btn-wrap\' role=\'presentation\' border=\'0\' cellpadding=\'0\' cellspacing=\'10\'>            <tr><td class=\'btn-cell btn-accept\'  bgcolor=\'#28a745\'><a class=\'btn\' href=\'{$acceptUrl}\'>Accept Invitation<\\/a><\\/td><\\/tr>            <tr><td class=\'btn-cell btn-decline\' bgcolor=\'#dc3545\'><a class=\'btn\' href=\'{$declineUrl}\'>Decline Invitation<\\/a><\\/td><\\/tr>        <\\/table>        <p>Kind regards,<\\/p>        <p>Public Knowledge Preprint Server<\\/p>    <\\/div><\\/div>\",\"subject\":\"You are invited to new roles\"}},\"shouldUseInviteData\":null,\"emailComposer\":{\"body\":\"<div class=\'email-container\'>    <div class=\'email-header\'>        <h2>Invitation to New Role<\\/h2>    <\\/div>    <div class=\'email-content\'>        <p>Dear {$recipientName},<\\/p>        <p>In light of your expertise, you have been invited by {$inviterName} to take on new roles at Public Knowledge Preprint Server<\\/p>        <p>At Public Knowledge Preprint Server, we value your privacy. As such, we have taken steps to ensure that we are fully GDPR compliant. These steps include you being accountable to enter your own data and choosing who can see what information. For additional information on how we handled your data, please refer to our Privacy Policy.<\\/p>        <div>{$existingRoles}<\\/div>        <div>{$rolesAdded}<\\/div>        <p>On accepting the invite, you will be redirected to Public Knowledge Preprint Server.<\\/p>        <p>Feel free to contact me with any questions about the process.<\\/p>        <table class=\'btn-wrap\' role=\'presentation\' border=\'0\' cellpadding=\'0\' cellspacing=\'10\'>            <tr><td class=\'btn-cell btn-accept\'  bgcolor=\'#28a745\'><a class=\'btn\' href=\'{$acceptUrl}\'>Accept Invitation<\\/a><\\/td><\\/tr>            <tr><td class=\'btn-cell btn-decline\' bgcolor=\'#dc3545\'><a class=\'btn\' href=\'{$declineUrl}\'>Decline Invitation<\\/a><\\/td><\\/tr>        <\\/table>        <p>Kind regards,<\\/p>        <p>Public Knowledge Preprint Server<\\/p>    <\\/div><\\/div>\",\"subject\":\"You are invited to new roles\"}}','ACCEPTED','minoue@mailinator.com',1,'2026-11-21 13:28:43','2026-11-21 13:28:54');
/*!40000 ALTER TABLE `invitations` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='All pending or in-progress jobs.';
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
(15,15,'','titleLocaleKey','navigation.home','string'),
(16,16,'','titleLocaleKey','manager.announcements','string'),
(17,17,'','titleLocaleKey','navigation.archives','string'),
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
  CONSTRAINT `navigation_menu_items_context_id` FOREIGN KEY (`context_id`) REFERENCES `servers` (`server_id`) ON DELETE CASCADE
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
(15,1,NULL,'NMI_TYPE_HOME'),
(16,1,NULL,'NMI_TYPE_ANNOUNCEMENTS'),
(17,1,NULL,'NMI_TYPE_ARCHIVES'),
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
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `notes` (
  `note_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `assoc_type` bigint(20) NOT NULL,
  `assoc_id` bigint(20) NOT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `date_created` datetime NOT NULL,
  `date_modified` datetime DEFAULT NULL,
  `contents` text DEFAULT NULL,
  `is_headnote` tinyint(1) NOT NULL DEFAULT 0,
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
  CONSTRAINT `notifications_context_id_foreign` FOREIGN KEY (`context_id`) REFERENCES `servers` (`server_id`) ON DELETE CASCADE,
  CONSTRAINT `notifications_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=163 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='User notifications created during certain operations.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notifications`
--

LOCK TABLES `notifications` WRITE;
/*!40000 ALTER TABLE `notifications` DISABLE KEYS */;
INSERT INTO `notifications` VALUES
(5,1,NULL,3,16777220,'2026-11-21 13:29:48',NULL,1048585,1),
(6,1,NULL,3,16777222,'2026-11-21 13:29:48',NULL,1048585,1),
(7,1,NULL,3,16777223,'2026-11-21 13:29:48',NULL,1048585,1),
(8,1,4,2,16777217,'2026-11-21 13:29:48',NULL,1048585,1),
(9,1,5,2,16777217,'2026-11-21 13:29:48',NULL,1048585,1),
(10,1,NULL,2,16777243,'2026-11-21 13:29:48',NULL,1048585,1),
(11,1,NULL,2,16777245,'2026-11-21 13:29:48',NULL,1048585,1),
(12,1,NULL,3,16777220,'2026-11-21 13:30:43',NULL,1048585,2),
(13,1,NULL,3,16777222,'2026-11-21 13:30:43',NULL,1048585,2),
(14,1,NULL,3,16777223,'2026-11-21 13:30:43',NULL,1048585,2),
(15,1,4,2,16777217,'2026-11-21 13:30:43',NULL,1048585,2),
(16,1,5,2,16777217,'2026-11-21 13:30:43',NULL,1048585,2),
(17,1,NULL,2,16777243,'2026-11-21 13:30:43',NULL,1048585,2),
(18,1,NULL,2,16777245,'2026-11-21 13:30:43',NULL,1048585,2),
(19,1,8,3,16777263,'2026-11-21 13:30:51',NULL,1048588,2),
(20,1,NULL,3,16777220,'2026-11-21 13:31:09',NULL,1048585,3),
(21,1,NULL,3,16777222,'2026-11-21 13:31:09',NULL,1048585,3),
(22,1,NULL,3,16777223,'2026-11-21 13:31:09',NULL,1048585,3),
(23,1,4,2,16777217,'2026-11-21 13:31:09',NULL,1048585,3),
(24,1,5,2,16777217,'2026-11-21 13:31:09',NULL,1048585,3),
(25,1,NULL,2,16777243,'2026-11-21 13:31:09',NULL,1048585,3),
(26,1,NULL,2,16777245,'2026-11-21 13:31:09',NULL,1048585,3),
(28,1,9,3,16777263,'2026-11-21 13:31:20',NULL,1048588,3),
(29,1,4,3,16777259,'2026-11-21 13:31:22',NULL,1048585,3),
(30,1,5,3,16777259,'2026-11-21 13:31:22',NULL,1048585,3),
(31,1,9,3,16777259,'2026-11-21 13:31:22',NULL,1048585,3),
(32,1,9,3,16777263,'2026-11-21 13:31:26',NULL,1048588,4),
(33,1,NULL,3,16777220,'2026-11-21 13:31:43',NULL,1048585,4),
(34,1,NULL,3,16777222,'2026-11-21 13:31:43',NULL,1048585,4),
(35,1,NULL,3,16777223,'2026-11-21 13:31:43',NULL,1048585,4),
(36,1,4,2,16777217,'2026-11-21 13:31:43',NULL,1048585,4),
(37,1,5,2,16777217,'2026-11-21 13:31:43',NULL,1048585,4),
(38,1,NULL,2,16777243,'2026-11-21 13:31:43',NULL,1048585,4),
(39,1,NULL,2,16777245,'2026-11-21 13:31:43',NULL,1048585,4),
(41,1,10,2,16777234,'2026-11-21 13:31:58',NULL,1048585,4),
(42,1,NULL,3,16777220,'2026-11-21 13:32:17',NULL,1048585,5),
(43,1,NULL,3,16777222,'2026-11-21 13:32:17',NULL,1048585,5),
(44,1,NULL,3,16777223,'2026-11-21 13:32:17',NULL,1048585,5),
(45,1,4,2,16777217,'2026-11-21 13:32:17',NULL,1048585,5),
(46,1,5,2,16777217,'2026-11-21 13:32:17',NULL,1048585,5),
(47,1,NULL,2,16777243,'2026-11-21 13:32:17',NULL,1048585,5),
(48,1,NULL,2,16777245,'2026-11-21 13:32:17',NULL,1048585,5),
(50,1,11,3,16777263,'2026-11-21 13:32:30',NULL,1048588,6),
(51,1,NULL,3,16777220,'2026-11-21 13:32:48',NULL,1048585,6),
(52,1,NULL,3,16777222,'2026-11-21 13:32:48',NULL,1048585,6),
(53,1,NULL,3,16777223,'2026-11-21 13:32:48',NULL,1048585,6),
(54,1,4,2,16777217,'2026-11-21 13:32:48',NULL,1048585,6),
(55,1,5,2,16777217,'2026-11-21 13:32:48',NULL,1048585,6),
(56,1,NULL,2,16777243,'2026-11-21 13:32:48',NULL,1048585,6),
(57,1,NULL,2,16777245,'2026-11-21 13:32:48',NULL,1048585,6),
(58,1,12,3,16777263,'2026-11-21 13:32:52',NULL,1048588,7),
(59,1,NULL,3,16777220,'2026-11-21 13:33:10',NULL,1048585,7),
(60,1,NULL,3,16777222,'2026-11-21 13:33:10',NULL,1048585,7),
(61,1,NULL,3,16777223,'2026-11-21 13:33:10',NULL,1048585,7),
(62,1,4,2,16777217,'2026-11-21 13:33:10',NULL,1048585,7),
(63,1,5,2,16777217,'2026-11-21 13:33:10',NULL,1048585,7),
(64,1,NULL,2,16777243,'2026-11-21 13:33:10',NULL,1048585,7),
(65,1,NULL,2,16777245,'2026-11-21 13:33:10',NULL,1048585,7),
(66,1,13,3,16777263,'2026-11-21 13:33:15',NULL,1048588,8),
(67,1,NULL,3,16777220,'2026-11-21 13:33:32',NULL,1048585,8),
(68,1,NULL,3,16777222,'2026-11-21 13:33:32',NULL,1048585,8),
(69,1,NULL,3,16777223,'2026-11-21 13:33:32',NULL,1048585,8),
(70,1,4,2,16777217,'2026-11-21 13:33:32',NULL,1048585,8),
(71,1,5,2,16777217,'2026-11-21 13:33:32',NULL,1048585,8),
(72,1,NULL,2,16777243,'2026-11-21 13:33:32',NULL,1048585,8),
(73,1,NULL,2,16777245,'2026-11-21 13:33:32',NULL,1048585,8),
(74,1,14,3,16777263,'2026-11-21 13:33:36',NULL,1048588,9),
(75,1,NULL,3,16777220,'2026-11-21 13:33:54',NULL,1048585,9),
(76,1,NULL,3,16777222,'2026-11-21 13:33:54',NULL,1048585,9),
(77,1,NULL,3,16777223,'2026-11-21 13:33:54',NULL,1048585,9),
(78,1,4,2,16777217,'2026-11-21 13:33:54',NULL,1048585,9),
(79,1,5,2,16777217,'2026-11-21 13:33:54',NULL,1048585,9),
(80,1,NULL,2,16777243,'2026-11-21 13:33:54',NULL,1048585,9),
(81,1,NULL,2,16777245,'2026-11-21 13:33:54',NULL,1048585,9),
(82,1,15,3,16777263,'2026-11-21 13:33:58',NULL,1048588,10),
(83,1,NULL,3,16777220,'2026-11-21 13:34:16',NULL,1048585,10),
(84,1,NULL,3,16777222,'2026-11-21 13:34:16',NULL,1048585,10),
(85,1,NULL,3,16777223,'2026-11-21 13:34:16',NULL,1048585,10),
(86,1,4,2,16777217,'2026-11-21 13:34:16',NULL,1048585,10),
(87,1,5,2,16777217,'2026-11-21 13:34:16',NULL,1048585,10),
(88,1,NULL,2,16777243,'2026-11-21 13:34:16',NULL,1048585,10),
(89,1,NULL,2,16777245,'2026-11-21 13:34:16',NULL,1048585,10),
(90,1,16,3,16777263,'2026-11-21 13:34:20',NULL,1048588,11),
(91,1,NULL,3,16777220,'2026-11-21 13:34:38',NULL,1048585,11),
(92,1,NULL,3,16777222,'2026-11-21 13:34:38',NULL,1048585,11),
(93,1,NULL,3,16777223,'2026-11-21 13:34:38',NULL,1048585,11),
(94,1,4,2,16777217,'2026-11-21 13:34:38',NULL,1048585,11),
(95,1,5,2,16777217,'2026-11-21 13:34:38',NULL,1048585,11),
(96,1,NULL,2,16777243,'2026-11-21 13:34:38',NULL,1048585,11),
(97,1,NULL,2,16777245,'2026-11-21 13:34:38',NULL,1048585,11),
(98,1,17,3,16777263,'2026-11-21 13:34:43',NULL,1048588,12),
(99,1,NULL,3,16777220,'2026-11-21 13:35:00',NULL,1048585,12),
(100,1,NULL,3,16777222,'2026-11-21 13:35:00',NULL,1048585,12),
(101,1,NULL,3,16777223,'2026-11-21 13:35:00',NULL,1048585,12),
(102,1,4,2,16777217,'2026-11-21 13:35:00',NULL,1048585,12),
(103,1,5,2,16777217,'2026-11-21 13:35:00',NULL,1048585,12),
(104,1,NULL,2,16777243,'2026-11-21 13:35:00',NULL,1048585,12),
(105,1,NULL,2,16777245,'2026-11-21 13:35:00',NULL,1048585,12),
(106,1,18,3,16777263,'2026-11-21 13:35:04',NULL,1048588,13),
(107,1,NULL,3,16777220,'2026-11-21 13:35:22',NULL,1048585,13),
(108,1,NULL,3,16777222,'2026-11-21 13:35:22',NULL,1048585,13),
(109,1,NULL,3,16777223,'2026-11-21 13:35:22',NULL,1048585,13),
(110,1,4,2,16777217,'2026-11-21 13:35:22',NULL,1048585,13),
(111,1,5,2,16777217,'2026-11-21 13:35:22',NULL,1048585,13),
(112,1,NULL,2,16777243,'2026-11-21 13:35:22',NULL,1048585,13),
(113,1,NULL,2,16777245,'2026-11-21 13:35:22',NULL,1048585,13),
(114,1,19,3,16777263,'2026-11-21 13:35:26',NULL,1048588,14),
(115,1,NULL,3,16777220,'2026-11-21 13:35:44',NULL,1048585,14),
(116,1,NULL,3,16777222,'2026-11-21 13:35:44',NULL,1048585,14),
(117,1,NULL,3,16777223,'2026-11-21 13:35:44',NULL,1048585,14),
(118,1,4,2,16777217,'2026-11-21 13:35:44',NULL,1048585,14),
(119,1,5,2,16777217,'2026-11-21 13:35:44',NULL,1048585,14),
(120,1,NULL,2,16777243,'2026-11-21 13:35:44',NULL,1048585,14),
(121,1,NULL,2,16777245,'2026-11-21 13:35:44',NULL,1048585,14),
(122,1,20,3,16777263,'2026-11-21 13:35:49',NULL,1048588,15),
(123,1,NULL,3,16777220,'2026-11-21 13:36:09',NULL,1048585,15),
(124,1,NULL,3,16777222,'2026-11-21 13:36:09',NULL,1048585,15),
(125,1,NULL,3,16777223,'2026-11-21 13:36:09',NULL,1048585,15),
(126,1,4,2,16777217,'2026-11-21 13:36:09',NULL,1048585,15),
(127,1,5,2,16777217,'2026-11-21 13:36:09',NULL,1048585,15),
(128,1,NULL,2,16777243,'2026-11-21 13:36:09',NULL,1048585,15),
(129,1,NULL,2,16777245,'2026-11-21 13:36:09',NULL,1048585,15),
(130,1,21,3,16777263,'2026-11-21 13:36:13',NULL,1048588,16),
(131,1,NULL,3,16777220,'2026-11-21 13:36:31',NULL,1048585,16),
(132,1,NULL,3,16777222,'2026-11-21 13:36:31',NULL,1048585,16),
(133,1,NULL,3,16777223,'2026-11-21 13:36:31',NULL,1048585,16),
(134,1,4,2,16777217,'2026-11-21 13:36:31',NULL,1048585,16),
(135,1,5,2,16777217,'2026-11-21 13:36:31',NULL,1048585,16),
(136,1,NULL,2,16777243,'2026-11-21 13:36:31',NULL,1048585,16),
(137,1,NULL,2,16777245,'2026-11-21 13:36:31',NULL,1048585,16),
(138,1,22,3,16777263,'2026-11-21 13:36:35',NULL,1048588,17),
(139,1,NULL,3,16777220,'2026-11-21 13:36:52',NULL,1048585,17),
(140,1,NULL,3,16777222,'2026-11-21 13:36:52',NULL,1048585,17),
(141,1,NULL,3,16777223,'2026-11-21 13:36:52',NULL,1048585,17),
(142,1,4,2,16777217,'2026-11-21 13:36:52',NULL,1048585,17),
(143,1,5,2,16777217,'2026-11-21 13:36:52',NULL,1048585,17),
(144,1,NULL,2,16777243,'2026-11-21 13:36:52',NULL,1048585,17),
(145,1,NULL,2,16777245,'2026-11-21 13:36:52',NULL,1048585,17),
(146,1,23,3,16777263,'2026-11-21 13:36:57',NULL,1048588,18),
(147,1,NULL,3,16777220,'2026-11-21 13:37:14',NULL,1048585,18),
(148,1,NULL,3,16777222,'2026-11-21 13:37:14',NULL,1048585,18),
(149,1,NULL,3,16777223,'2026-11-21 13:37:14',NULL,1048585,18),
(150,1,4,2,16777217,'2026-11-21 13:37:14',NULL,1048585,18),
(151,1,5,2,16777217,'2026-11-21 13:37:14',NULL,1048585,18),
(152,1,NULL,2,16777243,'2026-11-21 13:37:14',NULL,1048585,18),
(153,1,NULL,2,16777245,'2026-11-21 13:37:14',NULL,1048585,18),
(154,1,24,3,16777263,'2026-11-21 13:37:19',NULL,1048588,19),
(155,1,NULL,3,16777220,'2026-11-21 13:37:36',NULL,1048585,19),
(156,1,NULL,3,16777222,'2026-11-21 13:37:36',NULL,1048585,19),
(157,1,NULL,3,16777223,'2026-11-21 13:37:36',NULL,1048585,19),
(158,1,4,2,16777217,'2026-11-21 13:37:36',NULL,1048585,19),
(159,1,5,2,16777217,'2026-11-21 13:37:36',NULL,1048585,19),
(160,1,NULL,2,16777243,'2026-11-21 13:37:36',NULL,1048585,19),
(161,1,NULL,2,16777245,'2026-11-21 13:37:36',NULL,1048585,19),
(162,1,25,3,16777263,'2026-11-21 13:37:40',NULL,1048588,20);
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
(2,'tinymceplugin',NULL,'enabled','1','bool'),
(3,'usageeventplugin',NULL,'enabled','1','bool'),
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
(14,'googlescholarplugin',1,'enabled','1','bool'),
(15,'webfeedplugin',1,'enabled','1','bool'),
(16,'webfeedplugin',1,'displayPage','homepage','string'),
(17,'webfeedplugin',1,'displayItems','1','bool'),
(18,'webfeedplugin',1,'recentItems','30','int'),
(19,'webfeedplugin',1,'includeIdentifiers','0','bool'),
(20,'pdfjsviewerplugin',1,'enabled','1','bool'),
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
/*!40101 SET character_set_client = utf8mb4 */;
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
(4,'en',4,'PDF',4,0,NULL,0,NULL,NULL),
(5,'en',5,'PDF',5,0,NULL,0,NULL,NULL),
(6,'en',6,'PDF',6,0,NULL,0,NULL,NULL),
(7,'en',7,'PDF',7,0,NULL,0,NULL,NULL),
(8,'en',8,'PDF',8,0,NULL,0,NULL,NULL),
(9,'en',9,'PDF',9,0,NULL,0,NULL,NULL),
(10,'en',10,'PDF',10,0,NULL,0,NULL,NULL),
(11,'en',11,'PDF',11,0,NULL,0,NULL,NULL),
(12,'en',12,'PDF',12,0,NULL,0,NULL,NULL),
(13,'en',13,'PDF',13,0,NULL,0,NULL,NULL),
(14,'en',14,'PDF',14,0,NULL,0,NULL,NULL),
(15,'en',15,'PDF',15,0,NULL,0,NULL,NULL),
(16,'en',16,'PDF',16,0,NULL,0,NULL,NULL),
(17,'en',17,'PDF',17,0,NULL,0,NULL,NULL),
(18,'en',18,'PDF',18,0,NULL,0,NULL,NULL),
(19,'en',19,'PDF',19,0,NULL,0,NULL,NULL),
(20,'en',20,'PDF',20,0,NULL,0,NULL,NULL);
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
  CONSTRAINT `publication_settings_publication_id` FOREIGN KEY (`publication_id`) REFERENCES `publications` (`publication_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=167 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='More data about publications, including localized properties such as the title and abstract.';
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
(5,2,'en','contextAbbreviation','publicknowledgePub Know Pre'),
(6,2,'en','contextName','Public Knowledge Preprint Server'),
(7,2,'fr_CA','contextName','Serveur de prépublication de la connaissance du public'),
(8,2,'','contextPrimaryLocale','en'),
(9,2,'en','copyrightHolder','Public Knowledge Preprint Server'),
(10,2,'fr_CA','copyrightHolder','Serveur de prépublication de la connaissance du public'),
(11,2,'','copyrightYear','2026'),
(12,3,'en','abstract','The integration of technology into the classroom is a major issue in education today. Many national and provincial initiatives specify the technology skills that students must demonstrate at each grade level. The Government of the Province of Alberta in Canada, has mandated the implementation of a new curriculum which began in September of 2000, called Information and Communication Technology. This curriculum is infused within core courses and specifies what students are “expected to know, be able to do, and be like with respect to technology” (Alberta Learning, 2000). Since teachers are required to implement this new curriculum, school jurisdictions are turning to professional development strategies and hiring standards to upgrade teachers’ computer skills to meet this goal. This paper summarizes the results of a telephone survey administered to all public school jurisdictions in the Province of Alberta with a 100% response rate. We examined the computer skills that school jurisdictions require of newly hired teachers, and the support strategies employed for currently employed teachers.'),
(13,3,'en','title','Computer Skill Requirements for New and Existing Teachers: Implications for Policy and Practice'),
(14,3,'en','contextAbbreviation','publicknowledgePub Know Pre'),
(15,3,'en','contextName','Public Knowledge Preprint Server'),
(16,3,'fr_CA','contextName','Serveur de prépublication de la connaissance du public'),
(17,3,'','contextPrimaryLocale','en'),
(18,3,'en','copyrightHolder','Public Knowledge Preprint Server'),
(19,3,'fr_CA','copyrightHolder','Serveur de prépublication de la connaissance du public'),
(20,3,'','copyrightYear','2026'),
(21,4,'en','abstract','The integration of technology into the classroom is a major issue in education today. Many national and provincial initiatives specify the technology skills that students must demonstrate at each grade level. The Government of the Province of Alberta in Canada, has mandated the implementation of a new curriculum which began in September of 2000, called Information and Communication Technology. This curriculum is infused within core courses and specifies what students are “expected to know, be able to do, and be like with respect to technology” (Alberta Learning, 2000). Since teachers are required to implement this new curriculum, school jurisdictions are turning to professional development strategies and hiring standards to upgrade teachers’ computer skills to meet this goal. This paper summarizes the results of a telephone survey administered to all public school jurisdictions in the Province of Alberta with a 100% response rate. We examined the computer skills that school jurisdictions require of newly hired teachers, and the support strategies employed for currently employed teachers.'),
(22,4,'en','copyrightHolder','Craig Montgomerie'),
(23,4,'fr_CA','copyrightHolder','Serveur de prépublication de la connaissance du public'),
(24,4,'','copyrightYear','2026'),
(25,4,'en','title','Computer Skill Requirements for New and Existing Teachers: Implications for Policy and Practice'),
(26,4,'en','contextAbbreviation','publicknowledgePub Know Pre'),
(27,4,'en','contextName','Public Knowledge Preprint Server'),
(28,4,'fr_CA','contextName','Serveur de prépublication de la connaissance du public'),
(29,4,'','contextPrimaryLocale','en'),
(30,5,'en','abstract','In this review, the recent progress on genetic transformation of forest trees were discussed. Its described also, different applications of genetic engineering for improving forest trees or understanding the mechanisms governing genes expression in woody plants.'),
(31,5,'en','title','Genetic transformation of forest trees'),
(32,6,'en','abstract','Robert Fogelin claims that interlocutors must share a framework of background beliefs and commitments in order to fruitfully pursue argument. I refute Fogelin’s claim by investigating more thoroughly the shared background required for productive argument. I find that this background consists not in any common beliefs regarding the topic at hand, but rather in certain shared pro-cedural commitments and competencies. I suggest that Fogelin and his supporters mistakenly view shared beliefs as part of the required background for productive argument because these procedural com-mitments become more difficult to uphold when people’s beliefs diverge widely regarding the topic at hand.'),
(33,6,'en','title','Investigating the Shared Background Required for Argument: A Critique of Fogelin\'s Thesis on Deep Disagreement'),
(34,6,'en','contextAbbreviation','publicknowledgePub Know Pre'),
(35,6,'en','contextName','Public Knowledge Preprint Server'),
(36,6,'fr_CA','contextName','Serveur de prépublication de la connaissance du public'),
(37,6,'','contextPrimaryLocale','en'),
(38,6,'en','copyrightHolder','Public Knowledge Preprint Server'),
(39,6,'fr_CA','copyrightHolder','Serveur de prépublication de la connaissance du public'),
(40,6,'','copyrightYear','2026'),
(41,7,'en','abstract','A major goal of education is to equip children with the knowledge, skills and self-belief to be confident and informed citizens - citizens who continue to see themselves as learners beyond graduation. This paper looks at the key role of nurturing efficacy beliefs in order to learn and participate in school and society. Research findings conducted within a social studies context are presented, showing how strategy instruction can enhance self-efficacy for learning. As part of this research, Creative Problem Solving (CPS) was taught to children as a means to motivate and support learning. It is shown that the use of CPS can have positive effects on self-efficacy for learning, and be a valuable framework to involve children in decision-making that leads to social action. Implications for enhancing self-efficacy and motivation to learn in the classroom are discussed.'),
(42,7,'en','title','Developing efficacy beliefs in the classroom'),
(43,7,'en','contextAbbreviation','publicknowledgePub Know Pre'),
(44,7,'en','contextName','Public Knowledge Preprint Server'),
(45,7,'fr_CA','contextName','Serveur de prépublication de la connaissance du public'),
(46,7,'','contextPrimaryLocale','en'),
(47,7,'en','copyrightHolder','Public Knowledge Preprint Server'),
(48,7,'fr_CA','copyrightHolder','Serveur de prépublication de la connaissance du public'),
(49,7,'','copyrightYear','2026'),
(50,8,'en','abstract','The study of the commons has expe- rienced substantial growth and development over the past decades.1 Distinguished scholars in many disciplines had long studied how specific resources were managed or mismanaged at particular times and places (Coward 1980; De los Reyes 1980; MacKenzie 1979; Wittfogel 1957), but researchers who studied specific commons before the mid-1980s were, however, less likely than their contemporary colleagues to be well informed about the work of scholars in other disciplines, about other sec- tors in their own region of interest, or in other regions of the world.'),
(51,8,'en','title','Developing efficacy beliefs in the classroom'),
(52,8,'en','contextAbbreviation','publicknowledgePub Know Pre'),
(53,8,'en','contextName','Public Knowledge Preprint Server'),
(54,8,'fr_CA','contextName','Serveur de prépublication de la connaissance du public'),
(55,8,'','contextPrimaryLocale','en'),
(56,8,'en','copyrightHolder','Public Knowledge Preprint Server'),
(57,8,'fr_CA','copyrightHolder','Serveur de prépublication de la connaissance du public'),
(58,8,'','copyrightYear','2026'),
(59,9,'en','abstract','None.'),
(60,9,'en','title','Hansen & Pinto: Reason Reclaimed'),
(61,9,'en','contextAbbreviation','publicknowledgePub Know Pre'),
(62,9,'en','contextName','Public Knowledge Preprint Server'),
(63,9,'fr_CA','contextName','Serveur de prépublication de la connaissance du public'),
(64,9,'','contextPrimaryLocale','en'),
(65,9,'en','copyrightHolder','Public Knowledge Preprint Server'),
(66,9,'fr_CA','copyrightHolder','Serveur de prépublication de la connaissance du public'),
(67,9,'','copyrightYear','2026'),
(68,10,'en','abstract','The signaling theory suggests that dividends signal future prospects of a firm. However, recent empirical evidence from the US and the Uk does not offer a conclusive evidence on this issue. There are conflicting policy implications among financial economists so much that there is no practical dividend policy guidance to management, existing and potential investors in shareholding. Since corporate investment, financing and distribution decisions are a continuous function of management, the dividend decisions seem to rely on intuitive evaluation.'),
(69,10,'en','title','Signalling Theory Dividends: A Review Of The Literature And Empirical Evidence'),
(70,10,'en','contextAbbreviation','publicknowledgePub Know Pre'),
(71,10,'en','contextName','Public Knowledge Preprint Server'),
(72,10,'fr_CA','contextName','Serveur de prépublication de la connaissance du public'),
(73,10,'','contextPrimaryLocale','en'),
(74,10,'en','copyrightHolder','Public Knowledge Preprint Server'),
(75,10,'fr_CA','copyrightHolder','Serveur de prépublication de la connaissance du public'),
(76,10,'','copyrightYear','2026'),
(77,11,'en','abstract','The Texas Water Availability Modeling System is routinely applied in administration of the water rights permit system, regional and statewide planning, and an expanding variety of other endeavors. Modeling water management in the 23 river basins of the state reflects about 8,000 water right permits and 3,400 reservoirs. Datasets are necessarily large and complex to provide the decision-support capabilities for which the modeling system was developed. New modeling features are being added, and the different types of applications are growing. Certain applications are enhanced by simplifying the simulation input datasets to focus on particular water management systems. A methodology is presented for developing a condensed dataset for a selected reservoir system that reflects the impacts of all the water rights and accompanying reservoirs removed from the original complete dataset. A set of streamflows is developed that represents flows available to the selected system considering the effects of all the other water rights in the river basin contained in the original complete model input dataset that are not included in the condensed dataset. The methodology is applied to develop a condensed model of the Brazos River Authority reservoir system based on modifying the Texas Water Availability Modeling System dataset for the Brazos River Basin.'),
(78,11,'en','title','Condensing Water Availability Models to Focus on Specific Water Management Systems'),
(79,11,'en','contextAbbreviation','publicknowledgePub Know Pre'),
(80,11,'en','contextName','Public Knowledge Preprint Server'),
(81,11,'fr_CA','contextName','Serveur de prépublication de la connaissance du public'),
(82,11,'','contextPrimaryLocale','en'),
(83,11,'en','copyrightHolder','Public Knowledge Preprint Server'),
(84,11,'fr_CA','copyrightHolder','Serveur de prépublication de la connaissance du public'),
(85,11,'','copyrightYear','2026'),
(86,12,'en','abstract','Environmental sustainability and sustainable development principles are vital topics that engineering education has largely failed to address. Service-learning, which integrates social service into an academic setting, is an emerging tool that can be leveraged to teach sustainable design to future engineers. We present a model of using service-learning to teach sustainable design based on the experiences of the Stanford chapter of Engineers for a Sustainable World. The model involves the identification of projects and partner organizations, a student led, project-based design course, and internships coordinated with partner organizations. The model has been very successful, although limitations and challenges exist. These are discussed along with future directions for expanding the model.'),
(87,12,'en','title','Learning Sustainable Design through Service'),
(88,12,'en','contextAbbreviation','publicknowledgePub Know Pre'),
(89,12,'en','contextName','Public Knowledge Preprint Server'),
(90,12,'fr_CA','contextName','Serveur de prépublication de la connaissance du public'),
(91,12,'','contextPrimaryLocale','en'),
(92,12,'en','copyrightHolder','Public Knowledge Preprint Server'),
(93,12,'fr_CA','copyrightHolder','Serveur de prépublication de la connaissance du public'),
(94,12,'','copyrightYear','2026'),
(95,13,'en','abstract','The aim of this study was to assess the influence of long-term fat supplementation on the fatty acid profile of heavy pig adipose tissue. Fifty-four Large White barrows, averaging 25 kg LW, were randomized (matched weights) to one of three isoenergetic diets supplemented with either tallow (TA), maize oil (MO), or rapeseed oil (RO). The fats were supplement- ed at 3% as fed from 25 to 110 kg LW, and at 2.5 % from 110 kg to slaughtering. Following slaughter at about 160 kg LW, backfat samples were collected from ten animals per treatment and analyzed. Fatty acid composition of backfat close- ly reflected the fatty acid composition of the supplemented fats. The backfat of pigs fed TA had the highest saturated fatty acid content (SFA) (P&lt;0.01); those fed MO had the highest content in polyunsaturated fatty acid (PUFA) and the lowest in monounsaturated fatty acid (MUFA) content; those fed RO had the highest content of linolenic acid (C18:3) and cis 11- ecosenoic acid (C20:1). Only MO treatment had an effect on linoleic acid levels and the iodine value (IV) of backfat, result- ing in levels higher than those (IV = 70; C18:2 = 15%) accepted by the Parma Consortium for dry-cured ham. The IV and unsaturation index in both layers of subcutaneous backfat tissue differed significantly between treatments. These results show that long-term dietary supplementation with different fats changes the fatty acid profile of heavy pig adipose tissue. Supplementation with rapeseed oil increases the proportion of “healthy” fatty acids in pig fat, thereby improving the nutritional quality, however the effects on the technological quality of the fat must be carefully assessed.'),
(96,13,'en','title','Sodium butyrate improves growth performance of weaned piglets during the first period after weaning'),
(97,13,'en','contextAbbreviation','publicknowledgePub Know Pre'),
(98,13,'en','contextName','Public Knowledge Preprint Server'),
(99,13,'fr_CA','contextName','Serveur de prépublication de la connaissance du public'),
(100,13,'','contextPrimaryLocale','en'),
(101,13,'en','copyrightHolder','Public Knowledge Preprint Server'),
(102,13,'fr_CA','copyrightHolder','Serveur de prépublication de la connaissance du public'),
(103,13,'','copyrightYear','2026'),
(104,14,'en','abstract','The Edwards Aquifer serves as the primary water supply in South-Central Texas and is the source for several major springs. In developing a plan to protect endangered species immediately downstream of San Marcos Springs, questions have been raised regarding the established concept of a hydrologic divide between the San Antonio and Barton Springs segments of the Edwards Aquifer during drought conditions. To address these questions, a water-level data collection program and a hydrogeologic study was conducted. An analysis of groundwater-level data indicate that a groundwater divide exists in the vicinity of the surface drainage divide between Onion Creek and Blanco River during wet and normal hydrologic conditions. However, analysis of data collected during the 2009 drought suggests that the groundwater divide dissipated and no longer hydrologically separated the two segments. As a result, there is potential for groundwater to flow past San Marcos Springs toward Barton Springs during major droughts. The implications for this have bearings on the management and availability of groundwater in the Edwards Aquifer. Assessments of simulations from a numerical model suggest 5 cfs could be flowing past San Marcos toward Barton springs under drought conditions. The groundwater divide appears to be influenced by recharge along Onion Creek and Blanco River and appears to be vulnerable to extended periods of little or no recharge and extensive pumping in the vicinity of Kyle and Buda. The 2009 data set shows a very low gradient in the potentiometric surface between San Marcos Springs and Kyle with very little variation in levels between drought and non-drought periods. From Kyle toward Barton Springs, the potentiometric surface slopes significantly to the north and has dramatic changes in levels between drought and non-drought periods. The source and nature of the discontinuity of the change in potentiometric gradients and dynamic water level response at Kyle is unknown. Structural influences or hydraulic properties inherent in the aquifer could be the cause of this discontinuity and may also influence the degree of hydrologic connection between San Marcos and Barton Springs. Rapid population growth and increased water demands in the Kyle and Buda areas necessitates a continual groundwater level monitoring program between San Marcos Springs and Buda to provide data for future hydrogeologic and trend analyses.'),
(105,14,'en','title','Hydrologic Connectivity in the Edwards Aquifer between San Marcos Springs and Barton Springs during 2009 Drought Conditions'),
(106,14,'en','contextAbbreviation','publicknowledgePub Know Pre'),
(107,14,'en','contextName','Public Knowledge Preprint Server'),
(108,14,'fr_CA','contextName','Serveur de prépublication de la connaissance du public'),
(109,14,'','contextPrimaryLocale','en'),
(110,14,'en','copyrightHolder','Public Knowledge Preprint Server'),
(111,14,'fr_CA','copyrightHolder','Serveur de prépublication de la connaissance du public'),
(112,14,'','copyrightYear','2026'),
(113,15,'en','abstract','One of the challenges still to be met in the 21st century is that of genuinely embracing diversity. How can education help to overcome the barriers that continue to exist between people on the basis of language, culture and gender? This case study takes the Atlantic Coast of Nicaragua as an example of a multilingual/multiethnic region and examines how the community university URACCAN is contributing to the development of interculturality. It describes participatory research that was carried out with university staff and students with the intention of defining an intercultural curriculum and appropriate strategies for delivering such. One model used as a basis for discussions was the Model for Community Understanding from the Wales Curriculum Council, which emphasises the belonging of the individual to different communities or cultures at the same time. Factors supporting the development of an intercultural curriculum include the university’s close involvement with the ethnic communities it serves. However, ethno-linguistic power relations within the region and the country as a whole, still militate against egalitarianism within the university. The research highlights the importance of participatory pedagogy as the basis for promoting interculturality and achieving lasting social transformation.'),
(114,15,'en','title','Towards Designing an Intercultural Curriculum: A Case Study from the Atlantic Coast of Nicaragua'),
(115,15,'en','contextAbbreviation','publicknowledgePub Know Pre'),
(116,15,'en','contextName','Public Knowledge Preprint Server'),
(117,15,'fr_CA','contextName','Serveur de prépublication de la connaissance du public'),
(118,15,'','contextPrimaryLocale','en'),
(119,15,'en','copyrightHolder','Public Knowledge Preprint Server'),
(120,15,'fr_CA','copyrightHolder','Serveur de prépublication de la connaissance du public'),
(121,15,'','copyrightYear','2026'),
(122,16,'en','abstract','This review presents different diseases associated with yam and the management strategies employed in combating its menace in Nigeria. The field and storage diseases are presented, anthracnose is regarded as the most widely spread of all the field diseases, while yam mosaic virus disease is considered to cause the most severe losses in yams. Dry rot is considered as the most devastating of all the storage diseases of yam. Dry rot of yams alone causes a marked reduction in the quantity, marketable value and edible portions of tubers and those reductions are more severe in stored yams. The management strategies adopted and advocated for combating the field diseases includes the use of crop rotation, fallowing, planting of healthy material, the destruction of infected crop cultivars and the use of resistant cultivars. With regards to the storage diseases, the use of Tecto (Thiabendazole), locally made dry gins or wood ash before storage has been found to protect yam tubers against fungal infection in storage. Finally, processing of yam tubers into chips or cubes increases its shelf live for a period of between 6 months and one year.'),
(123,16,'en','title','Yam diseases and its management in Nigeria'),
(124,16,'en','contextAbbreviation','publicknowledgePub Know Pre'),
(125,16,'en','contextName','Public Knowledge Preprint Server'),
(126,16,'fr_CA','contextName','Serveur de prépublication de la connaissance du public'),
(127,16,'','contextPrimaryLocale','en'),
(128,16,'en','copyrightHolder','Public Knowledge Preprint Server'),
(129,16,'fr_CA','copyrightHolder','Serveur de prépublication de la connaissance du public'),
(130,16,'','copyrightYear','2026'),
(131,17,'en','abstract','Aim of this research is to provide a general situation of cattle slaughtered in Cameroon, as a representative example for the Central African Sub-region. The quality and safety of beef from the abattoir of Yaoundé, the largest in Cameroon, were considered. From January 2009 to March 2012, the pre-slaughter conditions and characteristics of 1953 cattle carcasses were recorded, as well as the pH of m. longissimus thoracis 24 h after slaughter. From these carcasses, 60 were selected to represent the bulls slaughtered. The quality parameters and composition of m. longissimus thoracis were carried out. The origin of most of the cattle was the Guinea High Savannah (74.6%), and transhumance was the common production system (75.5%). Gudali (45.6%), White Fulani (33.3%) and Red Mbororo (20.3%) breeds were predominant. Carcass weight was affected by rearing system and cattle category, and it markedly varied during year. Considering meat quality, the fat content was low (1.2%) and similar between breeds, moreover Gudali showed the toughest meat. Of the cows slaughtered, 27% were pregnant and the most common abnormal conditions encountered were ectoparasites, fatigue, lameness, fungal-like skin lesions, enlarged lymph nodes, respiratory distress, nodular lesions. More than 20% of the carcasses had some organs condemned, mainly for liver flukes (5.17%), and 1.0% of them were completely condemned due to tuberculosis, that also affected 3.28% of lungs. These data could aid authorities draw up programmes with the aim to strengthen cattle production, improve beef supply, control and prevent the observed diseases, and promote the regional trade.'),
(132,17,'en','title','Influence of long-term nutrition with different dietary fats on fatty acid composition of heavy pigs backfat'),
(133,17,'en','contextAbbreviation','publicknowledgePub Know Pre'),
(134,17,'en','contextName','Public Knowledge Preprint Server'),
(135,17,'fr_CA','contextName','Serveur de prépublication de la connaissance du public'),
(136,17,'','contextPrimaryLocale','en'),
(137,17,'en','copyrightHolder','Public Knowledge Preprint Server'),
(138,17,'fr_CA','copyrightHolder','Serveur de prépublication de la connaissance du public'),
(139,17,'','copyrightYear','2026'),
(140,18,'en','abstract','The antimicrobial, heavy metal resistance patterns and plasmid profiles of Coliforms (Enterobacteriacea) isolated from nosocomial infections and healthy human faeces were compared. Fifteen of the 25 isolates from nosocomial infections were identified as Escherichia coli, and remaining as Kelebsiella pneumoniae. Seventy two percent of the strains isolated from nosocomial infections possess multiple resistance to antibiotics compared to 45% of strains from healthy human faeces. The difference between minimal inhibitory concentration (MIC) values of strains from clinical cases and from faeces for four heavy metals (Hg, Cu, Pb, Cd) was not significant. However most strains isolated from hospital were more tolerant to heavy metal than those from healthy persons. There was no consistent relationship between plasmid profile group and antimicrobial resistance pattern, although a conjugative plasmid (>56.4 kb) encoding resistance to heavy metals and antibiotics was recovered from eight of the strains isolated from nosocomial infections. The results indicate multidrug-resistance coliforms as a potential cause of nosocomial infection in this region.'),
(141,18,'en','title','Antimicrobial, heavy metal resistance and plasmid profile of coliforms isolated from nosocomial infections in a hospital in Isfahan, Iran'),
(142,18,'en','contextAbbreviation','publicknowledgePub Know Pre'),
(143,18,'en','contextName','Public Knowledge Preprint Server'),
(144,18,'fr_CA','contextName','Serveur de prépublication de la connaissance du public'),
(145,18,'','contextPrimaryLocale','en'),
(146,18,'en','copyrightHolder','Public Knowledge Preprint Server'),
(147,18,'fr_CA','copyrightHolder','Serveur de prépublication de la connaissance du public'),
(148,18,'','copyrightYear','2026'),
(149,19,'en','abstract','We compare a setting where actors individually decide whom to sanction with a setting where sanctions are only implemented when actors collectively agree that a certain actor should be sanctioned. Collective sanctioning decisions are problematic due to the difficulty of reaching consensus. However, when a decision is made collectively, perverse sanctioning (e.g. punishing high contributors) by individual actors is ruled out. Therefore, collective sanctioning decisions are likely to be in the interest of the whole group.'),
(150,19,'en','title','Self-Organization in Multi-Level Institutions in Networked Environments'),
(151,19,'en','contextAbbreviation','publicknowledgePub Know Pre'),
(152,19,'en','contextName','Public Knowledge Preprint Server'),
(153,19,'fr_CA','contextName','Serveur de prépublication de la connaissance du public'),
(154,19,'','contextPrimaryLocale','en'),
(155,19,'en','copyrightHolder','Public Knowledge Preprint Server'),
(156,19,'fr_CA','copyrightHolder','Serveur de prépublication de la connaissance du public'),
(157,19,'','copyrightYear','2026'),
(158,20,'en','abstract','None.'),
(159,20,'en','title','Finocchiaro: Arguments About Arguments'),
(160,20,'en','contextAbbreviation','publicknowledgePub Know Pre'),
(161,20,'en','contextName','Public Knowledge Preprint Server'),
(162,20,'fr_CA','contextName','Serveur de prépublication de la connaissance du public'),
(163,20,'','contextPrimaryLocale','en'),
(164,20,'en','copyrightHolder','Public Knowledge Preprint Server'),
(165,20,'fr_CA','copyrightHolder','Serveur de prépublication de la connaissance du public'),
(166,20,'','copyrightYear','2026');
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
  `submission_id` bigint(20) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `url_path` varchar(64) DEFAULT NULL,
  `doi_id` bigint(20) DEFAULT NULL,
  `version_stage` enum('AO') DEFAULT NULL,
  `version_minor` int(11) DEFAULT NULL,
  `version_major` int(11) DEFAULT NULL,
  `update_type` enum('addendum','clarification','correction','corrigendum','erratum','expression_of_concern','new_edition','new_version','partial_retraction','removal','retraction','withdrawal') NOT NULL DEFAULT 'new_version',
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `source_publication_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`publication_id`),
  KEY `publications_author_id` (`primary_contact_id`),
  KEY `publications_section_id` (`section_id`),
  KEY `publications_submission_id` (`submission_id`),
  KEY `publications_url_path` (`url_path`),
  KEY `publications_doi_id` (`doi_id`),
  KEY `publications_source_publication_id_index` (`source_publication_id`),
  CONSTRAINT `publications_author_id` FOREIGN KEY (`primary_contact_id`) REFERENCES `authors` (`author_id`) ON DELETE SET NULL,
  CONSTRAINT `publications_doi_id_foreign` FOREIGN KEY (`doi_id`) REFERENCES `dois` (`doi_id`) ON DELETE SET NULL,
  CONSTRAINT `publications_section_id_foreign` FOREIGN KEY (`section_id`) REFERENCES `sections` (`section_id`) ON DELETE SET NULL,
  CONSTRAINT `publications_source_publication_id` FOREIGN KEY (`source_publication_id`) REFERENCES `publications` (`publication_id`) ON DELETE SET NULL,
  CONSTRAINT `publications_submission_id_foreign` FOREIGN KEY (`submission_id`) REFERENCES `submissions` (`submission_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='Each publication is one version of a submission.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `publications`
--

LOCK TABLES `publications` WRITE;
/*!40000 ALTER TABLE `publications` DISABLE KEYS */;
INSERT INTO `publications` VALUES
(1,0,NULL,'2026-11-21 13:29:36',1,1,1,1,NULL,NULL,NULL,NULL,NULL,'new_version','2026-11-21 13:29:36',NULL),
(2,0,'2026-11-21','2026-11-21 13:30:51',2,1,2,3,NULL,NULL,'AO',0,1,'new_version','2026-11-21 13:29:56',NULL),
(3,0,'2026-11-21','2026-11-21 13:31:19',5,1,3,3,NULL,NULL,'AO',0,1,'new_version','2026-11-21 13:30:56',NULL),
(4,0,'2026-11-21','2026-11-21 13:31:26',7,1,3,3,NULL,NULL,'AO',0,2,'new_version','2026-11-21 13:31:22',3),
(5,0,NULL,'2026-11-21 13:31:31',9,1,4,1,NULL,NULL,NULL,NULL,NULL,'new_version','2026-11-21 13:31:31',NULL),
(6,0,'2026-11-21','2026-11-21 13:32:30',10,1,5,3,NULL,NULL,'AO',0,1,'new_version','2026-11-21 13:32:05',NULL),
(7,0,'2026-11-21','2026-11-21 13:32:52',11,1,6,3,NULL,NULL,'AO',0,1,'new_version','2026-11-21 13:32:35',NULL),
(8,0,'2026-11-21','2026-11-21 13:33:14',12,1,7,3,NULL,NULL,'AO',0,1,'new_version','2026-11-21 13:32:58',NULL),
(9,0,'2026-11-21','2026-11-21 13:33:36',14,1,8,3,NULL,NULL,'AO',0,1,'new_version','2026-11-21 13:33:20',NULL),
(10,0,'2026-11-21','2026-11-21 13:33:58',15,1,9,3,NULL,NULL,'AO',0,1,'new_version','2026-11-21 13:33:42',NULL),
(11,0,'2026-11-21','2026-11-21 13:34:20',16,1,10,3,NULL,NULL,'AO',0,1,'new_version','2026-11-21 13:34:04',NULL),
(12,0,'2026-11-21','2026-11-21 13:34:42',17,1,11,3,NULL,NULL,'AO',0,1,'new_version','2026-11-21 13:34:26',NULL),
(13,0,'2026-11-21','2026-11-21 13:35:04',19,1,12,3,NULL,NULL,'AO',0,1,'new_version','2026-11-21 13:34:48',NULL),
(14,0,'2026-11-21','2026-11-21 13:35:26',20,1,13,3,NULL,NULL,'AO',0,1,'new_version','2026-11-21 13:35:10',NULL),
(15,0,'2026-11-21','2026-11-21 13:35:48',21,1,14,3,NULL,NULL,'AO',0,1,'new_version','2026-11-21 13:35:32',NULL),
(16,0,'2026-11-21','2026-11-21 13:36:13',22,1,15,3,NULL,NULL,'AO',0,1,'new_version','2026-11-21 13:35:57',NULL),
(17,0,'2026-11-21','2026-11-21 13:36:35',23,1,16,3,NULL,NULL,'AO',0,1,'new_version','2026-11-21 13:36:19',NULL),
(18,0,'2026-11-21','2026-11-21 13:36:57',24,1,17,3,NULL,NULL,'AO',0,1,'new_version','2026-11-21 13:36:40',NULL),
(19,0,'2026-11-21','2026-11-21 13:37:18',25,1,18,3,NULL,NULL,'AO',0,1,'new_version','2026-11-21 13:37:02',NULL),
(20,0,'2026-11-21','2026-11-21 13:37:40',26,1,19,3,NULL,NULL,'AO',0,1,'new_version','2026-11-21 13:37:24',NULL);
/*!40000 ALTER TABLE `publications` ENABLE KEYS */;
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
  `competing_interests_declared` tinyint(1) NOT NULL DEFAULT 0 COMMENT 'Whether the reviewer answered the competing interests question; false means no declaration is on record.',
  `reviewer_recommendation_id` bigint(20) DEFAULT NULL,
  `doi_id` bigint(20) DEFAULT NULL COMMENT 'DOI ID for the DOI assigned to this peer review',
  `date_assigned` datetime DEFAULT NULL,
  `date_notified` datetime DEFAULT NULL,
  `date_confirmed` datetime DEFAULT NULL,
  `date_completed` datetime DEFAULT NULL,
  `date_considered` datetime DEFAULT NULL,
  `date_acknowledged` datetime DEFAULT NULL,
  `date_due` datetime DEFAULT NULL,
  `date_response_due` datetime DEFAULT NULL,
  `last_modified` datetime DEFAULT NULL,
  `last_modified_by_id` bigint(20) DEFAULT NULL COMMENT 'The ID of the user who last made modifications to the submitted review.',
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
  `is_review_publicly_visible` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`review_id`),
  KEY `review_assignments_submission_id` (`submission_id`),
  KEY `review_assignments_reviewer_id` (`reviewer_id`),
  KEY `review_assignments_recommendation_id` (`reviewer_recommendation_id`),
  KEY `review_assignments_doi_id` (`doi_id`),
  KEY `review_assignments_last_modified_by_id_foreign` (`last_modified_by_id`),
  KEY `review_assignment_reviewer_round` (`review_round_id`,`reviewer_id`),
  KEY `review_assignments_form_id` (`review_form_id`),
  KEY `review_assignments_reviewer_review` (`reviewer_id`,`review_id`),
  CONSTRAINT `review_assignments_doi_id_foreign` FOREIGN KEY (`doi_id`) REFERENCES `dois` (`doi_id`) ON DELETE SET NULL,
  CONSTRAINT `review_assignments_last_modified_by_id_foreign` FOREIGN KEY (`last_modified_by_id`) REFERENCES `users` (`user_id`) ON DELETE SET NULL,
  CONSTRAINT `review_assignments_review_form_id_foreign` FOREIGN KEY (`review_form_id`) REFERENCES `review_forms` (`review_form_id`),
  CONSTRAINT `review_assignments_review_round_id_foreign` FOREIGN KEY (`review_round_id`) REFERENCES `review_rounds` (`review_round_id`),
  CONSTRAINT `review_assignments_reviewer_id_foreign` FOREIGN KEY (`reviewer_id`) REFERENCES `users` (`user_id`),
  CONSTRAINT `review_assignments_reviewer_recommendation_id_foreign` FOREIGN KEY (`reviewer_recommendation_id`) REFERENCES `reviewer_recommendations` (`reviewer_recommendation_id`) ON DELETE SET NULL,
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
-- Table structure for table `review_round_author_response_authors`
--

DROP TABLE IF EXISTS `review_round_author_response_authors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `review_round_author_response_authors` (
  `review_round_author_response_author_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `response_id` bigint(20) NOT NULL COMMENT 'ID of the review round author response.',
  `author_id` bigint(20) NOT NULL COMMENT 'ID of the author to associate with the response.',
  PRIMARY KEY (`review_round_author_response_author_id`),
  KEY `review_round_author_response_authors_response_id` (`response_id`),
  KEY `review_round_author_response_authors_author_id` (`author_id`),
  CONSTRAINT `review_round_author_response_authors_author_id_foreign` FOREIGN KEY (`author_id`) REFERENCES `authors` (`author_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `review_round_author_response_authors_response_id_foreign` FOREIGN KEY (`response_id`) REFERENCES `review_round_author_responses` (`response_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='Associates authors with responses submitted for review rounds(which are stored in `review_round_author_responses`).';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `review_round_author_response_authors`
--

LOCK TABLES `review_round_author_response_authors` WRITE;
/*!40000 ALTER TABLE `review_round_author_response_authors` DISABLE KEYS */;
/*!40000 ALTER TABLE `review_round_author_response_authors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `review_round_author_response_settings`
--

DROP TABLE IF EXISTS `review_round_author_response_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `review_round_author_response_settings` (
  `response_setting_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `response_id` bigint(20) NOT NULL COMMENT 'ID of the review round response this setting entry belongs to.',
  `locale` varchar(28) DEFAULT NULL,
  `setting_name` varchar(255) NOT NULL,
  `setting_value` mediumtext DEFAULT NULL,
  PRIMARY KEY (`response_setting_id`),
  KEY `review_round_author_response_settings_response_id` (`response_id`),
  KEY `review_round_author_response_settings_response_setting_id` (`response_setting_id`),
  CONSTRAINT `review_round_author_response_settings_response_id_foreign` FOREIGN KEY (`response_id`) REFERENCES `review_round_author_responses` (`response_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `review_round_author_response_settings`
--

LOCK TABLES `review_round_author_response_settings` WRITE;
/*!40000 ALTER TABLE `review_round_author_response_settings` DISABLE KEYS */;
/*!40000 ALTER TABLE `review_round_author_response_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `review_round_author_responses`
--

DROP TABLE IF EXISTS `review_round_author_responses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `review_round_author_responses` (
  `response_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'Primary key.',
  `review_round_id` bigint(20) NOT NULL COMMENT 'ID of the review round the response belongs to.',
  `user_id` bigint(20) NOT NULL COMMENT 'User ID of the assigned author participant that is submitting the response.',
  `doi_id` bigint(20) DEFAULT NULL COMMENT 'DOI ID for the DOI assigned to the author response',
  `date_confirmed` datetime DEFAULT NULL COMMENT 'Date the author response was confirmed by editor.',
  `date_reverted` datetime DEFAULT NULL COMMENT 'Date the author response was reverted from confirmed to not confirmed.',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`response_id`),
  KEY `review_round_author_responses_review_round_id` (`review_round_id`),
  KEY `review_round_author_responses_user_id` (`user_id`),
  KEY `review_round_author_responses_review_round_id_user_id` (`review_round_id`,`user_id`),
  KEY `review_round_author_responses_doi_id` (`doi_id`),
  CONSTRAINT `review_round_author_responses_doi_id_foreign` FOREIGN KEY (`doi_id`) REFERENCES `dois` (`doi_id`) ON DELETE SET NULL,
  CONSTRAINT `review_round_author_responses_review_round_id_foreign` FOREIGN KEY (`review_round_id`) REFERENCES `review_rounds` (`review_round_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `review_round_author_responses_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `review_round_author_responses`
--

LOCK TABLES `review_round_author_responses` WRITE;
/*!40000 ALTER TABLE `review_round_author_responses` DISABLE KEYS */;
/*!40000 ALTER TABLE `review_round_author_responses` ENABLE KEYS */;
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
-- Table structure for table `review_round_settings`
--

DROP TABLE IF EXISTS `review_round_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `review_round_settings` (
  `review_round_setting_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `review_round_id` bigint(20) NOT NULL,
  `locale` varchar(255) DEFAULT NULL,
  `setting_name` varchar(255) NOT NULL,
  `setting_value` text DEFAULT NULL,
  `setting_type` varchar(6) NOT NULL COMMENT '(bool|int|float|string|object)',
  PRIMARY KEY (`review_round_setting_id`),
  KEY `review_round_settings_review_round_id` (`review_round_id`),
  CONSTRAINT `review_round_settings_review_round_id_foreign` FOREIGN KEY (`review_round_id`) REFERENCES `review_rounds` (`review_round_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `review_round_settings`
--

LOCK TABLES `review_round_settings` WRITE;
/*!40000 ALTER TABLE `review_round_settings` DISABLE KEYS */;
/*!40000 ALTER TABLE `review_round_settings` ENABLE KEYS */;
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
  `publication_id` bigint(20) DEFAULT NULL,
  `stage_id` bigint(20) DEFAULT NULL,
  `round` smallint(6) NOT NULL,
  `review_revision` bigint(20) DEFAULT NULL,
  `status` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`review_round_id`),
  UNIQUE KEY `review_rounds_submission_id_stage_id_round_pkey` (`submission_id`,`stage_id`,`round`),
  KEY `review_rounds_submission_id` (`submission_id`),
  KEY `review_rounds_publication_id` (`publication_id`),
  CONSTRAINT `review_rounds_publication_id_foreign` FOREIGN KEY (`publication_id`) REFERENCES `publications` (`publication_id`),
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
-- Table structure for table `reviewer_recommendation_settings`
--

DROP TABLE IF EXISTS `reviewer_recommendation_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `reviewer_recommendation_settings` (
  `reviewer_recommendation_setting_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `reviewer_recommendation_id` bigint(20) NOT NULL COMMENT 'The foreign key mapping of this setting to reviewer_recommendation_id table',
  `locale` varchar(28) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` mediumtext DEFAULT NULL,
  PRIMARY KEY (`reviewer_recommendation_setting_id`),
  UNIQUE KEY `reviewer_recommendation_settings_unique` (`reviewer_recommendation_id`,`locale`,`setting_name`),
  KEY `reviewer_recommendation_settings_recommendation_id` (`reviewer_recommendation_id`),
  KEY `reviewer_recommendation_settings_locale_setting_name_index` (`setting_name`,`locale`),
  CONSTRAINT `recommendation_settings_reviewer_recommendation_id_foreign` FOREIGN KEY (`reviewer_recommendation_id`) REFERENCES `reviewer_recommendations` (`reviewer_recommendation_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='Reviewer recommendation settings table to contain multilingual or extra information';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reviewer_recommendation_settings`
--

LOCK TABLES `reviewer_recommendation_settings` WRITE;
/*!40000 ALTER TABLE `reviewer_recommendation_settings` DISABLE KEYS */;
/*!40000 ALTER TABLE `reviewer_recommendation_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reviewer_recommendations`
--

DROP TABLE IF EXISTS `reviewer_recommendations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `reviewer_recommendations` (
  `reviewer_recommendation_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `context_id` bigint(20) NOT NULL COMMENT 'Context for which the recommendation has been made',
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT 'The status which determine if will be shown in recommendation list',
  `type` enum('1','2','3','4') DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`reviewer_recommendation_id`),
  KEY `reviewer_recommendations_context_id` (`context_id`),
  CONSTRAINT `reviewer_recommendations_context_id_foreign` FOREIGN KEY (`context_id`) REFERENCES `servers` (`server_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='Review recommendation selected by reviewer at the completion of review assignment';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reviewer_recommendations`
--

LOCK TABLES `reviewer_recommendations` WRITE;
/*!40000 ALTER TABLE `reviewer_recommendations` DISABLE KEYS */;
/*!40000 ALTER TABLE `reviewer_recommendations` ENABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='Author suggested reviewers at the submission time';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reviewer_suggestions`
--

LOCK TABLES `reviewer_suggestions` WRITE;
/*!40000 ALTER TABLE `reviewer_suggestions` DISABLE KEYS */;
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
/*!40101 SET character_set_client = utf8mb4 */;
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
/*!40101 SET character_set_client = utf8mb4 */;
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
) ENGINE=InnoDB AUTO_INCREMENT=88 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='More data about server settings, including localized properties such as policies.';
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
(8,1,'fr_CA','beginSubmissionHelp','<p>Merci de votre soumission à la revue Public Knowledge Preprint Server. Il vous sera demandé de téléverser des fichiers, identifier des co-auteur.trice.s et fournir des informations comme le titre et le résumé.</p><p>Si vous ne l\'avez pas encore fait, merci de consulter nos <a href=\"http://localhost/index.php/publicknowledge/about/submissions\" target=\"_blank\">Recommandations pour la soumission</a>. Lorsque vous remplissez les formulaires, merci de fournir autant de détails que possible pour aider nos éditeur.trice.s à évaluer votre travail. </p><p>Une fois que vous avez commencé, vous pouvez enregistrer votre soumission et y revenir plus tard. Vous pourrez alors réviser et modifier toutes les informations voulues avant de soumettre le tout.</p>'),
(9,1,'','citations','request'),
(10,1,'','contactEmail','rvaca@mailinator.com'),
(11,1,'','contactName','Ramiro Vaca'),
(12,1,'en','contributorsHelp','<p>Add details for all of the contributors to this submission. Contributors added here will be sent an email confirmation of the submission.</p><p> If a contributor can not be contacted by email, because they must remain anonymous or do not have an email account, please do not enter a fake email address. You can add information about this contributor in a message to the moderators at a later step in the submission process.</p>'),
(13,1,'fr_CA','contributorsHelp','<p>Ajouter des informations relatives à tous les contributeurs.trices à cette soumission. Les contributeurs.trices ajouté.e.s ici se verront envoyer un courriel de confirmation de la soumission ainsi qu\'une copie de toutes les décisions éditoriales enregistrées pour cette soumission.</p><p>Si un.e contributeur.trice ne peut être contacté.e par courriel parce qu\'il ou elle doit demeurer anonyme ou n\'a pas de compte de messagerie, veuillez ne pas entrer de courriel fictif. Vous pouvez ajouter des informations sur ce ou cette contributeur.trice à une étape ultérieure du processus de soumission.</p>'),
(14,1,'','country','IS'),
(15,1,'','defaultReviewMode','2'),
(16,1,'en','description','<p>The Public Knowledge Preprint Server is a preprint service on the subject of public access to science.</p>'),
(17,1,'fr_CA','description','<p>Le Serveur de prépublication de la connaissance du public est une service trimestrielle évaluée par les pairs sur le thème de l\'accès du public à la science.</p>'),
(18,1,'en','detailsHelp','<p>Please provide the following details to help us manage your submission in our system.</p>'),
(19,1,'fr_CA','detailsHelp','<p>Veuillez fournir les informations suivantes afin de nous aider à gérer votre soumission dans notre système.</p>'),
(20,1,'','copySubmissionAckPrimaryContact','0'),
(21,1,'','copySubmissionAckAddress',''),
(22,1,'','emailSignature','<br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Preprint Server</a>.</p>'),
(23,1,'','enableEnrollmentMasthead','1'),
(24,1,'','enableDois','1'),
(25,1,'','doiSuffixType','default'),
(26,1,'','registrationAgency',''),
(27,1,'','disableSubmissions','0'),
(28,1,'','editorialStatsEmail','1'),
(29,1,'en','forTheEditorsHelp','<p>Please provide the following details in order to help readers discover your preprint.</p><p>When entering metadata such as keywords, provide entries that you think would be most helpful to readers looking for research like yours.</p>'),
(30,1,'fr_CA','forTheEditorsHelp','<p>S\'il vous plaît, fournissez les détails suivants afin d\'aider l\'équipe éditoriale à gérer votre soumission.</p><p>Dans vos métadonnées, assurez vous de fournir des informations que vous pensez pouvoir être utile à la personne qui gérera votre soumission. Cette information peut être changée avant publication.</p>'),
(31,1,'','funders','request'),
(32,1,'','itemsPerPage','25'),
(33,1,'','keywords','request'),
(34,1,'en','librarianInformation','We encourage research librarians to list this server among their library\'s holdings. As well, it may be worth noting that this server\'s open source system is suitable for libraries to host for their faculty members to use (see <a href=\"https://pkp.sfu.ca\">Public Knowledge Project</a>).'),
(35,1,'fr_CA','librarianInformation','##default.contextSettings.forLibrarians##'),
(36,1,'en','name','Public Knowledge Preprint Server'),
(37,1,'fr_CA','name','Serveur de prépublication de la connaissance du public'),
(38,1,'','notifyAllAuthors','1'),
(39,1,'','numPageLinks','10'),
(40,1,'','numWeeksPerResponse','4'),
(41,1,'','numWeeksPerReview','4'),
(42,1,'','numReviewsPerSubmission','0'),
(43,1,'en','openAccessPolicy','This server provides immediate open access to its content on the principle that making research freely available to the public supports a greater global exchange of knowledge.'),
(44,1,'fr_CA','openAccessPolicy','##default.contextSettings.openAccessPolicy##'),
(45,1,'','orcidCity',''),
(46,1,'','orcidClientId',''),
(47,1,'','orcidClientSecret',''),
(48,1,'','orcidEnabled','0'),
(49,1,'','orcidLogLevel','ERROR'),
(50,1,'','orcidSendMailToAuthorsOnPublication','0'),
(51,1,'en','privacyStatement','<p>The names and email addresses entered in this server site will be used exclusively for the stated purposes of this server and will not be made available for any other purpose or to any other party.</p>'),
(52,1,'fr_CA','privacyStatement','##default.contextSettings.privacyStatement##'),
(53,1,'en','readerInformation','We encourage readers to sign up for the posting notification service for this server. Use the <a href=\"http://localhost/index.php/publicknowledge/user/register\">Register</a> link at the top of the home page. This list also allows the server to claim a certain level of support or readership. See the <a href=\"http://localhost/index.php/publicknowledge/about/submissions#privacyStatement\">Privacy Statement</a>, which assures readers that their name and email address will not be used for other purposes.'),
(54,1,'fr_CA','readerInformation','##default.contextSettings.forReaders##'),
(55,1,'en','reviewHelp','<p>Review the information you have entered before you complete your submission. You can change any of the details displayed here by clicking the edit button at the top of each section.</p>'),
(56,1,'fr_CA','reviewHelp','<p>Révisez l\'information que vous avez fourni avant de finaliser votre soumission. Vous pouvez modifier chaque détails affichés en cliquant sur le bouton d\'édition en haut de chaque section.</p><p>Une fois votre soumission transmise, un membre de l\'équipe éditoriale lui sera assigné afin de l\'évaluer. S\'il vous plaît, assurez vous que les détails fournis sont le plus exactes possibles.</p>'),
(57,1,'','submissionAcknowledgement','allAuthors'),
(58,1,'en','submissionChecklist','<p>All submissions must meet the following requirements.</p><ul><li>This submission meets the requirements outlined in the <a href=\"http://localhost/index.php/publicknowledge/about/submissions\">Author Guidelines</a>.</li><li>This submission has not been previously posted.</li><li>All references have been checked for accuracy and completeness.</li><li>All tables and figures have been numbered and labeled.</li><li>Permission has been obtained to post all photos, datasets and other material provided with this preprint.</li></ul>'),
(59,1,'fr_CA','submissionChecklist','##default.contextSettings.checklist##'),
(60,1,'','submitWithCategories','0'),
(61,1,'','supportedAddedSubmissionLocales','[\"en\",\"fr_CA\"]'),
(62,1,'','supportedDefaultSubmissionLocale','en'),
(63,1,'','supportedFormLocales','[\"en\",\"fr_CA\"]'),
(64,1,'','supportedLocales','[\"en\",\"fr_CA\"]'),
(65,1,'','supportedSubmissionLocales','[\"en\",\"fr_CA\"]'),
(66,1,'','supportedSubmissionMetadataLocales','[\"en\",\"fr_CA\"]'),
(67,1,'','themePluginPath','default'),
(68,1,'en','uploadFilesHelp','<p>Upload the preprint you would like to share. In addition to the main work, you may wish to upload data sets or other supplementary files that will help researchers understand and evaluate your work.</p>'),
(69,1,'fr_CA','uploadFilesHelp','<p> Fournir tous les fichiers dont notre équipe éditoriale pourrait avoir besoin pour évaluer votre soumission. En plus du fichier principal, vous pouvez soumettre des ensembles de données, une déclaration relative au conflit d\'intérêt ou tout autre fichier potentiellement utile pour nos éditeur.trice.s.</p>'),
(70,1,'','enableGeoUsageStats','disabled'),
(71,1,'','enableInstitutionUsageStats','0'),
(72,1,'','isSushiApiPublic','1'),
(73,1,'','enablePublicComments','0'),
(76,1,'','enableAuthorScreening','0'),
(77,1,'','enabledDoiTypes','[\"publication\"]'),
(78,1,'','postedAcknowledgement','1'),
(79,1,'','enableOai','1'),
(80,1,'','doiVersioning','1'),
(81,1,'','doiCreationTime','copyEditCreationTime'),
(82,1,'en','customHeaders','<meta name=\"pkp\" content=\"Test metatag.\">'),
(83,1,'en','searchDescription','The Public Knowledge Preprint Server is a preprint service on the subject of public access to science.'),
(84,1,'en','abbreviation','publicknowledgePub Know Pre'),
(85,1,'','mailingAddress','123 456th Street\nBurnaby, British Columbia\nCanada'),
(86,1,'','supportEmail','rvaca@mailinator.com'),
(87,1,'','supportName','Ramiro Vaca');
/*!40000 ALTER TABLE `server_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `servers`
--

DROP TABLE IF EXISTS `servers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
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
('039YIGqRcjqGddiYDczu9KG541ximMnkp6ASe5Ew',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/157.0.0.0 Safari/537.36',1795268078,'YTo2OntzOjY6Il90b2tlbiI7czo0MDoiVExISnlZSmY5Nm92ekJtY3lKMjNrWnAyU3ZZbEZSN0poRTl6bUlNciI7czo4OiJ1c2VybmFtZSI7czoxMDoia2Fsa2hhZmFqaSI7czo1OiJlbWFpbCI7czoyNToia2Fsa2hhZmFqaUBtYWlsaW5hdG9yLmNvbSI7czo1MDoibG9naW5fd2ViX2MxYTI2YmMwMDI0OWRjNjIxZjAzYzQxNzc4ZDU1ZmUzMzFlN2U5MTIiO047czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czoxMzoiY3VycmVudExvY2FsZSI7czoyOiJlbiI7fQ=='),
('0IYUqcAOpGuwjpsOqfFnfpShiNlYOxmgenTJjnah',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/157.0.0.0 Safari/537.36',1795268191,'YTo2OntzOjY6Il90b2tlbiI7czo0MDoiWFVWV2I3SHpOaGdtekpnRGUwUDlzODZyVzFqeDcwNzJLVW50eXJiRyI7czo4OiJ1c2VybmFtZSI7czo2OiJycm9zc2kiO3M6NToiZW1haWwiO3M6MjE6InJyb3NzaUBtYWlsaW5hdG9yLmNvbSI7czo1MDoibG9naW5fd2ViX2MxYTI2YmMwMDI0OWRjNjIxZjAzYzQxNzc4ZDU1ZmUzMzFlN2U5MTIiO047czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czoxMzoiY3VycmVudExvY2FsZSI7czoyOiJlbiI7fQ=='),
('0y4vtZygFVOpA15TYQx4JqnALK0NnPOdJoz6Tsgw',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/157.0.0.0 Safari/537.36',1795267942,'YTo5OntzOjY6Il90b2tlbiI7czo0MDoiU2xXWHhXNEl3Zng4bGdzUFZ1SHk2YmdRb2dySnZ5bHNUakRjMDM3NiI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czoxMzoiY3VycmVudExvY2FsZSI7czoyOiJlbiI7czo1MDoibG9naW5fd2ViX2MxYTI2YmMwMDI0OWRjNjIxZjAzYzQxNzc4ZDU1ZmUzMzFlN2U5MTIiO2k6MztzOjY6InVzZXJJZCI7aTozO3M6ODoidXNlcm5hbWUiO3M6NzoiZGJhcm5lcyI7czo1OiJlbWFpbCI7czoyMjoiZGJhcm5lc0BtYWlsaW5hdG9yLmNvbSI7czo4OiJsb2dpbl9pcCI7czo5OiIxMjcuMC4wLjEiO3M6MTc6InBhc3N3b3JkX2hhc2hfd2ViIjtzOjY0OiI2MjI0YTY0ZTllZWY1OTE4YjUwOTY4OTgyMzc2OTU2OTIyMDE3NDY0NTQ1NWI4ZGQyNjliNDZlZjNhMTExN2I2Ijt9'),
('2nYb0RsAs1Ukd2M9CXdW04sJizM46iSIGSStH6KF',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/157.0.0.0 Safari/537.36',1795267639,'YTo2OntzOjY6Il90b2tlbiI7czo0MDoiR3M1VWNpdWhKUmVyQ2VXSlBveWY0Z0Q3ZWtQNG9zWU9FVzRvR1k5SiI7czo4OiJ1c2VybmFtZSI7czo1OiJhZG1pbiI7czo1OiJlbWFpbCI7czoyMzoicGtwYWRtaW5AbWFpbGluYXRvci5jb20iO3M6NTA6ImxvZ2luX3dlYl9jMWEyNmJjMDAyNDlkYzYyMWYwM2M0MTc3OGQ1NWZlMzMxZTdlOTEyIjtOO3M6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fXM6MTM6ImN1cnJlbnRMb2NhbGUiO3M6MjoiZW4iO30='),
('2Z8hw6Cs3lvOnTpmkknIdzR6Ih86RLP9Luej9Fo7',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/157.0.0.0 Safari/537.36',1795268105,'YTo5OntzOjY6Il90b2tlbiI7czo0MDoiVHdmYkdWRGxRSFViN0l0akd4eVZjSTJ1ODNsdVE2dzFpZThxS2tNRSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czoxMzoiY3VycmVudExvY2FsZSI7czoyOiJlbiI7czo1MDoibG9naW5fd2ViX2MxYTI2YmMwMDI0OWRjNjIxZjAzYzQxNzc4ZDU1ZmUzMzFlN2U5MTIiO2k6MztzOjY6InVzZXJJZCI7aTozO3M6ODoidXNlcm5hbWUiO3M6NzoiZGJhcm5lcyI7czo1OiJlbWFpbCI7czoyMjoiZGJhcm5lc0BtYWlsaW5hdG9yLmNvbSI7czo4OiJsb2dpbl9pcCI7czo5OiIxMjcuMC4wLjEiO3M6MTc6InBhc3N3b3JkX2hhc2hfd2ViIjtzOjY0OiI2MjI0YTY0ZTllZWY1OTE4YjUwOTY4OTgyMzc2OTU2OTIyMDE3NDY0NTQ1NWI4ZGQyNjliNDZlZjNhMTExN2I2Ijt9'),
('3otK74ZmJ7yHv5TXHZgbejUR39JguksaQPgvOLf1',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/157.0.0.0 Safari/537.36',1795267735,'YTozOntzOjY6Il90b2tlbiI7czo0MDoibE1LQnpGREhYTE10SWp2WHNRZUx5NURHYURlMnBpUUF3Rm9Rb245ZiI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czoxMzoiY3VycmVudExvY2FsZSI7czoyOiJlbiI7fQ=='),
('3r5x8VY7qzS2XHPy0TLko1dok9r0mrd7HNpI6ADK',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/157.0.0.0 Safari/537.36',1795267633,'YTo2OntzOjY6Il90b2tlbiI7czo0MDoicXVoaWFuTmlIdHh6RzhwS2NBQ1JQTFBNWEJGSjA4b3RQZENwRFdYeSI7czo4OiJ1c2VybmFtZSI7czo1OiJhZG1pbiI7czo1OiJlbWFpbCI7czoyMzoicGtwYWRtaW5AbWFpbGluYXRvci5jb20iO3M6NTA6ImxvZ2luX3dlYl9jMWEyNmJjMDAyNDlkYzYyMWYwM2M0MTc3OGQ1NWZlMzMxZTdlOTEyIjtOO3M6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fXM6MTM6ImN1cnJlbnRMb2NhbGUiO3M6MjoiZW4iO30='),
('4qjXQ65fqcigtMq6As9OFJewlLYsT2w8aOUMxckb',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/157.0.0.0 Safari/537.36',1795268127,'YTo5OntzOjY6Il90b2tlbiI7czo0MDoiQlQ4YzhrNnJvOVVHSE9HNnNTcE8yMVVCNkhVZTRlb2JKbXNLOERSQSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czoxMzoiY3VycmVudExvY2FsZSI7czoyOiJlbiI7czo1MDoibG9naW5fd2ViX2MxYTI2YmMwMDI0OWRjNjIxZjAzYzQxNzc4ZDU1ZmUzMzFlN2U5MTIiO2k6MztzOjY6InVzZXJJZCI7aTozO3M6ODoidXNlcm5hbWUiO3M6NzoiZGJhcm5lcyI7czo1OiJlbWFpbCI7czoyMjoiZGJhcm5lc0BtYWlsaW5hdG9yLmNvbSI7czo4OiJsb2dpbl9pcCI7czo5OiIxMjcuMC4wLjEiO3M6MTc6InBhc3N3b3JkX2hhc2hfd2ViIjtzOjY0OiI2MjI0YTY0ZTllZWY1OTE4YjUwOTY4OTgyMzc2OTU2OTIyMDE3NDY0NTQ1NWI4ZGQyNjliNDZlZjNhMTExN2I2Ijt9'),
('4VwPU5f5FiuxEos9rWkLe45P3g40CYb31mVxFfBN',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/157.0.0.0 Safari/537.36',1795267920,'YTo5OntzOjY6Il90b2tlbiI7czo0MDoidGppZzcxRnhlcG43SjZCZDJ3MlVtUGc1Z0dRVWY3NlhUaUlHNjh3USI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czoxMzoiY3VycmVudExvY2FsZSI7czoyOiJlbiI7czo1MDoibG9naW5fd2ViX2MxYTI2YmMwMDI0OWRjNjIxZjAzYzQxNzc4ZDU1ZmUzMzFlN2U5MTIiO2k6MztzOjY6InVzZXJJZCI7aTozO3M6ODoidXNlcm5hbWUiO3M6NzoiZGJhcm5lcyI7czo1OiJlbWFpbCI7czoyMjoiZGJhcm5lc0BtYWlsaW5hdG9yLmNvbSI7czo4OiJsb2dpbl9pcCI7czo5OiIxMjcuMC4wLjEiO3M6MTc6InBhc3N3b3JkX2hhc2hfd2ViIjtzOjY0OiI2MjI0YTY0ZTllZWY1OTE4YjUwOTY4OTgyMzc2OTU2OTIyMDE3NDY0NTQ1NWI4ZGQyNjliNDZlZjNhMTExN2I2Ijt9'),
('9FZxWLbOwW0fjzH4xYb9caZsH7tlvKORCGChRsTN',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/157.0.0.0 Safari/537.36',1795267590,'YToyOntzOjY6Il90b2tlbiI7czo0MDoiMGk5Y2djSjZJaE10MDNTOXNhdUNkMUJRdFhIMzFzMnNIb2ZrS1NNQSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ=='),
('AhzzmkEVywiQCtFp7rKNUAgryUzqAdEFmWbCZ6AR',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/157.0.0.0 Safari/537.36',1795268235,'YTo2OntzOjY6Il90b2tlbiI7czo0MDoidjJPSlJ5aDN6SU5Sd29HbTAyOFlRcU5qdG95Mml4WjQxNGZPZHMwbyI7czo4OiJ1c2VybmFtZSI7czoxMToidndpbGxpYW1zb24iO3M6NToiZW1haWwiO3M6MjY6InZ3aWxsaWFtc29uQG1haWxpbmF0b3IuY29tIjtzOjUwOiJsb2dpbl93ZWJfYzFhMjZiYzAwMjQ5ZGM2MjFmMDNjNDE3NzhkNTVmZTMzMWU3ZTkxMiI7TjtzOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX1zOjEzOiJjdXJyZW50TG9jYWxlIjtzOjI6ImVuIjt9'),
('aloblHE0lgF8bfXN5sEUkPNOVCRvD1pxR2d1WIkT',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/157.0.0.0 Safari/537.36',1795267950,'YTo5OntzOjY6Il90b2tlbiI7czo0MDoiQkxNZWR6QXYzWkJaYWFZMDBZbzJiWTFKd3hmbWFhQ1N6NjRtWjNSeiI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czoxMzoiY3VycmVudExvY2FsZSI7czoyOiJlbiI7czo1MDoibG9naW5fd2ViX2MxYTI2YmMwMDI0OWRjNjIxZjAzYzQxNzc4ZDU1ZmUzMzFlN2U5MTIiO2k6MztzOjY6InVzZXJJZCI7aTozO3M6ODoidXNlcm5hbWUiO3M6NzoiZGJhcm5lcyI7czo1OiJlbWFpbCI7czoyMjoiZGJhcm5lc0BtYWlsaW5hdG9yLmNvbSI7czo4OiJsb2dpbl9pcCI7czo5OiIxMjcuMC4wLjEiO3M6MTc6InBhc3N3b3JkX2hhc2hfd2ViIjtzOjY0OiI2MjI0YTY0ZTllZWY1OTE4YjUwOTY4OTgyMzc2OTU2OTIyMDE3NDY0NTQ1NWI4ZGQyNjliNDZlZjNhMTExN2I2Ijt9'),
('APWwuAecJcMDH7sBhbeHA7lt7zg7YnhtRKCLNlnC',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/157.0.0.0 Safari/537.36',1795267990,'YTo2OntzOjY6Il90b2tlbiI7czo0MDoiRUtJVXZ1VjBkemg0bUVUcEIxbUhOc1RSWWtjZVlnRGdUeFJWZnplNSI7czo4OiJ1c2VybmFtZSI7czo3OiJlb3N0cm9tIjtzOjU6ImVtYWlsIjtzOjIyOiJlb3N0cm9tQG1haWxpbmF0b3IuY29tIjtzOjUwOiJsb2dpbl93ZWJfYzFhMjZiYzAwMjQ5ZGM2MjFmMDNjNDE3NzhkNTVmZTMzMWU3ZTkxMiI7TjtzOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX1zOjEzOiJjdXJyZW50TG9jYWxlIjtzOjI6ImVuIjt9'),
('bSww8hwIpAMvW7Ts3wUgir7AP0IzRCZu3eoqFjw8',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/157.0.0.0 Safari/537.36',1795267707,'YTo2OntzOjY6Il90b2tlbiI7czo0MDoiQkdHWXJ5a1pCaGNjMEliTWtCdTRUMmJhbmVtdXNHNHZwZjVmT0U5byI7czo4OiJ1c2VybmFtZSI7czo1OiJhZG1pbiI7czo1OiJlbWFpbCI7czoyMzoicGtwYWRtaW5AbWFpbGluYXRvci5jb20iO3M6NTA6ImxvZ2luX3dlYl9jMWEyNmJjMDAyNDlkYzYyMWYwM2M0MTc3OGQ1NWZlMzMxZTdlOTEyIjtOO3M6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fXM6MTM6ImN1cnJlbnRMb2NhbGUiO3M6MjoiZW4iO30='),
('BZEZEckwvWc5nJ35VxPJI0KUfnowjbv7JIXep2vv',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/157.0.0.0 Safari/537.36',1795268173,'YTo5OntzOjY6Il90b2tlbiI7czo0MDoiSmJaWTlzdHhZZDNBN3dRTkM3RFF6YUhjeXIzcmV6NUt2VUZOdzY2biI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czoxMzoiY3VycmVudExvY2FsZSI7czoyOiJlbiI7czo1MDoibG9naW5fd2ViX2MxYTI2YmMwMDI0OWRjNjIxZjAzYzQxNzc4ZDU1ZmUzMzFlN2U5MTIiO2k6MztzOjY6InVzZXJJZCI7aTozO3M6ODoidXNlcm5hbWUiO3M6NzoiZGJhcm5lcyI7czo1OiJlbWFpbCI7czoyMjoiZGJhcm5lc0BtYWlsaW5hdG9yLmNvbSI7czo4OiJsb2dpbl9pcCI7czo5OiIxMjcuMC4wLjEiO3M6MTc6InBhc3N3b3JkX2hhc2hfd2ViIjtzOjY0OiI2MjI0YTY0ZTllZWY1OTE4YjUwOTY4OTgyMzc2OTU2OTIyMDE3NDY0NTQ1NWI4ZGQyNjliNDZlZjNhMTExN2I2Ijt9'),
('ckY8paYstsrpE0PBy838WtBVDlsSIlQTF3Rfezh2',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/157.0.0.0 Safari/537.36',1795267695,'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZTFlc0o2TWplb3RJZDdUdTcyNlk0MzNDOE9SQU9kN1o5bks5NXJBVSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czoxMzoiY3VycmVudExvY2FsZSI7czoyOiJlbiI7fQ=='),
('cSIsZTYMH3GfY0uyJDjDqY9s5MDdiiDkR1PNhm0y',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/157.0.0.0 Safari/537.36',1795268217,'YTo5OntzOjY6Il90b2tlbiI7czo0MDoiODdxOWk5RFZsRXVwSW5JRjJIeHU3VGN6bjAzaFpFMEpSTGtVV0tpVCI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czoxMzoiY3VycmVudExvY2FsZSI7czoyOiJlbiI7czo1MDoibG9naW5fd2ViX2MxYTI2YmMwMDI0OWRjNjIxZjAzYzQxNzc4ZDU1ZmUzMzFlN2U5MTIiO2k6MztzOjY6InVzZXJJZCI7aTozO3M6ODoidXNlcm5hbWUiO3M6NzoiZGJhcm5lcyI7czo1OiJlbWFpbCI7czoyMjoiZGJhcm5lc0BtYWlsaW5hdG9yLmNvbSI7czo4OiJsb2dpbl9pcCI7czo5OiIxMjcuMC4wLjEiO3M6MTc6InBhc3N3b3JkX2hhc2hfd2ViIjtzOjY0OiI2MjI0YTY0ZTllZWY1OTE4YjUwOTY4OTgyMzc2OTU2OTIyMDE3NDY0NTQ1NWI4ZGQyNjliNDZlZjNhMTExN2I2Ijt9'),
('CvNU4vFhgZ3uYRmnuRr9WeZqG0AAA81tbwQqSdWG',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/157.0.0.0 Safari/537.36',1795268122,'YTo2OntzOjY6Il90b2tlbiI7czo0MDoiejdtVHdmMmQxdG5kd1g5T3NRZTFhU3JpVFFUSklqODQwOVRwZUdwcSI7czo4OiJ1c2VybmFtZSI7czo4OiJsa3VtaWVnYSI7czo1OiJlbWFpbCI7czoyMzoibGt1bWllZ2FAbWFpbGluYXRvci5jb20iO3M6NTA6ImxvZ2luX3dlYl9jMWEyNmJjMDAyNDlkYzYyMWYwM2M0MTc3OGQ1NWZlMzMxZTdlOTEyIjtOO3M6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fXM6MTM6ImN1cnJlbnRMb2NhbGUiO3M6MjoiZW4iO30='),
('cWytAGynK6qdNVk5ZMTuXlYgsiJKGAgbVLsWU92w',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/157.0.0.0 Safari/537.36',1795268261,'YTo5OntzOjY6Il90b2tlbiI7czo0MDoiR3ZQcElzSFlmSnM3TjZ4WHl5b3NFTzNjTzZTbFBHMHpCVXJSUVNkeiI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czoxMzoiY3VycmVudExvY2FsZSI7czoyOiJlbiI7czo1MDoibG9naW5fd2ViX2MxYTI2YmMwMDI0OWRjNjIxZjAzYzQxNzc4ZDU1ZmUzMzFlN2U5MTIiO2k6MztzOjY6InVzZXJJZCI7aTozO3M6ODoidXNlcm5hbWUiO3M6NzoiZGJhcm5lcyI7czo1OiJlbWFpbCI7czoyMjoiZGJhcm5lc0BtYWlsaW5hdG9yLmNvbSI7czo4OiJsb2dpbl9pcCI7czo5OiIxMjcuMC4wLjEiO3M6MTc6InBhc3N3b3JkX2hhc2hfd2ViIjtzOjY0OiI2MjI0YTY0ZTllZWY1OTE4YjUwOTY4OTgyMzc2OTU2OTIyMDE3NDY0NTQ1NWI4ZGQyNjliNDZlZjNhMTExN2I2Ijt9'),
('d77YXM1IYVKpwHuHrRWvHbe6H3meu9DyBws1J6BL',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/157.0.0.0 Safari/537.36',1795267728,'YTo2OntzOjY6Il90b2tlbiI7czo0MDoiMXJMelljQ3Y0U1gxTmozdW4yeW9NY1JLelVVMjBRa1lISmlaNURINCI7czo4OiJ1c2VybmFtZSI7czo1OiJhZG1pbiI7czo1OiJlbWFpbCI7czoyMzoicGtwYWRtaW5AbWFpbGluYXRvci5jb20iO3M6NTA6ImxvZ2luX3dlYl9jMWEyNmJjMDAyNDlkYzYyMWYwM2M0MTc3OGQ1NWZlMzMxZTdlOTEyIjtOO3M6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fXM6MTM6ImN1cnJlbnRMb2NhbGUiO3M6MjoiZW4iO30='),
('DbHkk09p51eqcBLwXWtR6nshWfZrSQDPDLNOqqqk',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/157.0.0.0 Safari/537.36',1795267886,'YTo5OntzOjY6Il90b2tlbiI7czo0MDoiQ3JhUWlZSlZndFN5bU5SUG03VzcxZ2dQSm1WNXBrV1JzV240V2dGeiI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czoxMzoiY3VycmVudExvY2FsZSI7czoyOiJlbiI7czo1MDoibG9naW5fd2ViX2MxYTI2YmMwMDI0OWRjNjIxZjAzYzQxNzc4ZDU1ZmUzMzFlN2U5MTIiO2k6MztzOjY6InVzZXJJZCI7aTozO3M6ODoidXNlcm5hbWUiO3M6NzoiZGJhcm5lcyI7czo1OiJlbWFpbCI7czoyMjoiZGJhcm5lc0BtYWlsaW5hdG9yLmNvbSI7czo4OiJsb2dpbl9pcCI7czo5OiIxMjcuMC4wLjEiO3M6MTc6InBhc3N3b3JkX2hhc2hfd2ViIjtzOjY0OiI2MjI0YTY0ZTllZWY1OTE4YjUwOTY4OTgyMzc2OTU2OTIyMDE3NDY0NTQ1NWI4ZGQyNjliNDZlZjNhMTExN2I2Ijt9'),
('dwLpxQ6M6gD6GAOiw7S1rumSG9RF1BdOfkUO5SeP',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/157.0.0.0 Safari/537.36',1795268256,'YTo2OntzOjY6Il90b2tlbiI7czo0MDoidmdEQmw4cHMwaUhBbWV3OUR0aDR4cVlrbHFQc2ZDMHBsVnlvT2pHayI7czo4OiJ1c2VybmFtZSI7czo2OiJ6d29vZHMiO3M6NToiZW1haWwiO3M6MjE6Inp3b29kc0BtYWlsaW5hdG9yLmNvbSI7czo1MDoibG9naW5fd2ViX2MxYTI2YmMwMDI0OWRjNjIxZjAzYzQxNzc4ZDU1ZmUzMzFlN2U5MTIiO047czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czoxMzoiY3VycmVudExvY2FsZSI7czoyOiJlbiI7fQ=='),
('fiTcvvNLTuRlrqCPZdmmrceVMvmLc62rn9drakCP',1,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/157.0.0.0 Safari/537.36',1795267743,'YTo5OntzOjY6Il90b2tlbiI7czo0MDoielVqVWQzZU5IOEFzTndhbDZVZlNwbURMR1l4cHo5NFhIeHlFNU0wVyI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czoxMzoiY3VycmVudExvY2FsZSI7czoyOiJlbiI7czo1MDoibG9naW5fd2ViX2MxYTI2YmMwMDI0OWRjNjIxZjAzYzQxNzc4ZDU1ZmUzMzFlN2U5MTIiO2k6MTtzOjY6InVzZXJJZCI7aToxO3M6ODoidXNlcm5hbWUiO3M6NToiYWRtaW4iO3M6NToiZW1haWwiO3M6MjM6InBrcGFkbWluQG1haWxpbmF0b3IuY29tIjtzOjg6ImxvZ2luX2lwIjtzOjk6IjEyNy4wLjAuMSI7czoxNzoicGFzc3dvcmRfaGFzaF93ZWIiO3M6NjQ6IjA1ZWIzMGVjYmYxY2YwZTI0NGI3MjAwMGFlNjU1YWNmYjQ0Y2I5ZDQ0OGJkNDUwZWM2NWEwNDRiNjI4NzhlNWMiO30='),
('GgZt5TB7wK4Kp1PZ33PHwHmEa4vKyRrGYsDmz57x',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/157.0.0.0 Safari/537.36',1795267968,'YTo2OntzOjY6Il90b2tlbiI7czo0MDoiRmlTbnBVTDRBa2FzS2xRNzFSTHRMVjFOeDNPRzhDNEtEbEpiejZUdCI7czo4OiJ1c2VybmFtZSI7czo5OiJkc29rb2xvZmYiO3M6NToiZW1haWwiO3M6MjQ6ImRzb2tvbG9mZkBtYWlsaW5hdG9yLmNvbSI7czo1MDoibG9naW5fd2ViX2MxYTI2YmMwMDI0OWRjNjIxZjAzYzQxNzc4ZDU1ZmUzMzFlN2U5MTIiO047czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czoxMzoiY3VycmVudExvY2FsZSI7czoyOiJlbiI7fQ=='),
('gzyShljGVJ0Y3mMKhU75rydonndrqL9Ul1zMVfSv',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/157.0.0.0 Safari/537.36',1795268038,'YTo5OntzOjY6Il90b2tlbiI7czo0MDoieG5VTFZJdlhuQ1NJT2kzVEMxbVhLYzRVVkxGdzVDZEpRZXc5aHpETyI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czoxMzoiY3VycmVudExvY2FsZSI7czoyOiJlbiI7czo1MDoibG9naW5fd2ViX2MxYTI2YmMwMDI0OWRjNjIxZjAzYzQxNzc4ZDU1ZmUzMzFlN2U5MTIiO2k6MztzOjY6InVzZXJJZCI7aTozO3M6ODoidXNlcm5hbWUiO3M6NzoiZGJhcm5lcyI7czo1OiJlbWFpbCI7czoyMjoiZGJhcm5lc0BtYWlsaW5hdG9yLmNvbSI7czo4OiJsb2dpbl9pcCI7czo5OiIxMjcuMC4wLjEiO3M6MTc6InBhc3N3b3JkX2hhc2hfd2ViIjtzOjY0OiI2MjI0YTY0ZTllZWY1OTE4YjUwOTY4OTgyMzc2OTU2OTIyMDE3NDY0NTQ1NWI4ZGQyNjliNDZlZjNhMTExN2I2Ijt9'),
('h2Che7u6gXfgdAfWFRWyIUBZkxdqUjP1br8ubK17',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/157.0.0.0 Safari/537.36',1795267626,'YTo2OntzOjY6Il90b2tlbiI7czo0MDoibkFVbmJHd3h3dktPV216ajE5ZllmRHVxZjlTOWl2ajFHd1BYUXdCdCI7czo4OiJ1c2VybmFtZSI7czo1OiJhZG1pbiI7czo1OiJlbWFpbCI7czoyMzoicGtwYWRtaW5AbWFpbGluYXRvci5jb20iO3M6NTA6ImxvZ2luX3dlYl9jMWEyNmJjMDAyNDlkYzYyMWYwM2M0MTc3OGQ1NWZlMzMxZTdlOTEyIjtOO3M6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fXM6MTM6ImN1cnJlbnRMb2NhbGUiO3M6MjoiZW4iO30='),
('H6Lcp4mhjUvmao5SlGkWIjdEHCzg0MGDYXQgk9GL',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/157.0.0.0 Safari/537.36',1795267669,'YTo2OntzOjY6Il90b2tlbiI7czo0MDoidjdtU21QSUdhRGZGU1B3ajgwVTZyenM0WklublVsMG1wdVpTRlpCUyI7czo4OiJ1c2VybmFtZSI7czo1OiJhZG1pbiI7czo1OiJlbWFpbCI7czoyMzoicGtwYWRtaW5AbWFpbGluYXRvci5jb20iO3M6NTA6ImxvZ2luX3dlYl9jMWEyNmJjMDAyNDlkYzYyMWYwM2M0MTc3OGQ1NWZlMzMxZTdlOTEyIjtOO3M6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fXM6MTM6ImN1cnJlbnRMb2NhbGUiO3M6MjoiZW4iO30='),
('kWnsToqBdit8fTxaDnO6yFcv0Kl3vfKiYtHHUkgy',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/157.0.0.0 Safari/537.36',1795268017,'YTo5OntzOjY6Il90b2tlbiI7czo0MDoiU2p3ajNRRUd5WUV5eVk0OEVqUDBuajNZbWU2cW80QUhTM1BYNDlZcSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czoxMzoiY3VycmVudExvY2FsZSI7czoyOiJlbiI7czo1MDoibG9naW5fd2ViX2MxYTI2YmMwMDI0OWRjNjIxZjAzYzQxNzc4ZDU1ZmUzMzFlN2U5MTIiO2k6MztzOjY6InVzZXJJZCI7aTozO3M6ODoidXNlcm5hbWUiO3M6NzoiZGJhcm5lcyI7czo1OiJlbWFpbCI7czoyMjoiZGJhcm5lc0BtYWlsaW5hdG9yLmNvbSI7czo4OiJsb2dpbl9pcCI7czo5OiIxMjcuMC4wLjEiO3M6MTc6InBhc3N3b3JkX2hhc2hfd2ViIjtzOjY0OiI2MjI0YTY0ZTllZWY1OTE4YjUwOTY4OTgyMzc2OTU2OTIyMDE3NDY0NTQ1NWI4ZGQyNjliNDZlZjNhMTExN2I2Ijt9'),
('KXMGDmPYJZzVaF5YpgasdKvh3HI21p0R2xCXq5EO',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/157.0.0.0 Safari/537.36',1795268145,'YTo2OntzOjY6Il90b2tlbiI7czo0MDoiNWN5eTJ2U3M3VjVRRThvZTdQaGs1bW9zMGoxYWxVRnd5ZzJTVHRYQSI7czo4OiJ1c2VybmFtZSI7czo3OiJwZGFuaWVsIjtzOjU6ImVtYWlsIjtzOjIyOiJwZGFuaWVsQG1haWxpbmF0b3IuY29tIjtzOjUwOiJsb2dpbl93ZWJfYzFhMjZiYzAwMjQ5ZGM2MjFmMDNjNDE3NzhkNTVmZTMzMWU3ZTkxMiI7TjtzOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX1zOjEzOiJjdXJyZW50TG9jYWxlIjtzOjI6ImVuIjt9'),
('L1o5ZeXdAnDvGpwYrSpPqzjc9DPFAwzm4tXqYYq1',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/157.0.0.0 Safari/537.36',1795267688,'YTo2OntzOjY6Il90b2tlbiI7czo0MDoidG5FaDNFZlFrQzRtemc4ektDQnRtRUxURHRHUVlxTFhSODF1TkRmaiI7czo4OiJ1c2VybmFtZSI7czo1OiJhZG1pbiI7czo1OiJlbWFpbCI7czoyMzoicGtwYWRtaW5AbWFpbGluYXRvci5jb20iO3M6NTA6ImxvZ2luX3dlYl9jMWEyNmJjMDAyNDlkYzYyMWYwM2M0MTc3OGQ1NWZlMzMxZTdlOTEyIjtOO3M6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fXM6MTM6ImN1cnJlbnRMb2NhbGUiO3M6MjoiZW4iO30='),
('Lf6iDlTEHvpBfuoy8xRdwIvr6c2rVYrnfzSaOulb',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/157.0.0.0 Safari/537.36',1795267937,'YTo2OntzOjY6Il90b2tlbiI7czo0MDoidTlnMzBPb0JDcG1kNkZsSHlMaVpHMHNJall2bUdrWEliaHpLdnhiYSI7czo4OiJ1c2VybmFtZSI7czo5OiJkcGhpbGxpcHMiO3M6NToiZW1haWwiO3M6MjQ6ImRwaGlsbGlwc0BtYWlsaW5hdG9yLmNvbSI7czo1MDoibG9naW5fd2ViX2MxYTI2YmMwMDI0OWRjNjIxZjAzYzQxNzc4ZDU1ZmUzMzFlN2U5MTIiO047czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czoxMzoiY3VycmVudExvY2FsZSI7czoyOiJlbiI7fQ=='),
('lqVT9EkhaZEfj7t2Tm52xHEhql65WyDleqRJaBhH',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/157.0.0.0 Safari/537.36',1795268056,'YTo2OntzOjY6Il90b2tlbiI7czo0MDoialpDNXZCYXFJUW5sdmNQYkczNmtMbkl0b3NIT1pZRWptN0RLTFV5QiI7czo4OiJ1c2VybmFtZSI7czo2OiJqbm92YWsiO3M6NToiZW1haWwiO3M6MjE6Impub3Zha0BtYWlsaW5hdG9yLmNvbSI7czo1MDoibG9naW5fd2ViX2MxYTI2YmMwMDI0OWRjNjIxZjAzYzQxNzc4ZDU1ZmUzMzFlN2U5MTIiO047czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czoxMzoiY3VycmVudExvY2FsZSI7czoyOiJlbiI7fQ=='),
('LW9OuvEkPiX5LibCLbsc5IsinbTJVipHNSqKUJRY',10,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/157.0.0.0 Safari/537.36',1795267903,'YTo5OntzOjY6Il90b2tlbiI7czo0MDoieHBYRWJrY01Fb3UzMnp5QjVHTTFoUGtsOTVnTlZnREdIQkRqM3B5UyI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czoxMzoiY3VycmVudExvY2FsZSI7czoyOiJlbiI7czo1MDoibG9naW5fd2ViX2MxYTI2YmMwMDI0OWRjNjIxZjAzYzQxNzc4ZDU1ZmUzMzFlN2U5MTIiO2k6MTA7czo2OiJ1c2VySWQiO2k6MTA7czo4OiJ1c2VybmFtZSI7czo2OiJkZGlvdWYiO3M6NToiZW1haWwiO3M6MjE6ImRkaW91ZkBtYWlsaW5hdG9yLmNvbSI7czo4OiJsb2dpbl9pcCI7czo5OiIxMjcuMC4wLjEiO3M6MTc6InBhc3N3b3JkX2hhc2hfd2ViIjtzOjY0OiI4ZTNmY2JiOWQ1OWYwNzgwYzFhMGZiM2M2YTgxY2MxMWU3NWFmZTE0NjhkMDUwNDkyNTkwNDM1ZTgyY2FkMDU1Ijt9'),
('m01gkSDml9zPYTmni2toQ3YKZGxLzKaKFhuGnZxA',1,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/157.0.0.0 Safari/537.36',1795267769,'YTo5OntzOjY6Il90b2tlbiI7czo0MDoiSTNERGRuNklYM0NIWVBUS3BEVnNGdDBIQUZuclBxc3RQdXpROWxpRyI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czoxMzoiY3VycmVudExvY2FsZSI7czoyOiJlbiI7czo1MDoibG9naW5fd2ViX2MxYTI2YmMwMDI0OWRjNjIxZjAzYzQxNzc4ZDU1ZmUzMzFlN2U5MTIiO2k6MTtzOjY6InVzZXJJZCI7aToxO3M6ODoidXNlcm5hbWUiO3M6NToiYWRtaW4iO3M6NToiZW1haWwiO3M6MjM6InBrcGFkbWluQG1haWxpbmF0b3IuY29tIjtzOjg6ImxvZ2luX2lwIjtzOjk6IjEyNy4wLjAuMSI7czoxNzoicGFzc3dvcmRfaGFzaF93ZWIiO3M6NjQ6IjA1ZWIzMGVjYmYxY2YwZTI0NGI3MjAwMGFlNjU1YWNmYjQ0Y2I5ZDQ0OGJkNDUwZWM2NWEwNDRiNjI4NzhlNWMiO30='),
('n3Ar2IVqDvebhp95Hv7QJpnl8chkpIIw1mxLr7XA',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/157.0.0.0 Safari/537.36',1795268034,'YTo2OntzOjY6Il90b2tlbiI7czo0MDoidVFubmJRVFR4MURsTlB5cjR6YWpKUldTS01yU3luc094c1VXZDRLQSI7czo4OiJ1c2VybmFtZSI7czoxMDoiam13YW5kZW5nYSI7czo1OiJlbWFpbCI7czoyNToiam13YW5kZW5nYUBtYWlsaW5hdG9yLmNvbSI7czo1MDoibG9naW5fd2ViX2MxYTI2YmMwMDI0OWRjNjIxZjAzYzQxNzc4ZDU1ZmUzMzFlN2U5MTIiO047czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czoxMzoiY3VycmVudExvY2FsZSI7czoyOiJlbiI7fQ=='),
('N5hNgyTxSR5sr3h9AjDygkqSXP9uEO3ceTE7dklo',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/157.0.0.0 Safari/537.36',1795268060,'YTo5OntzOjY6Il90b2tlbiI7czo0MDoiVjUxQzdzYnp6ekJoV1NYREhBUkRwT0s1djJ4OEpqOTZpd2NZOFBieCI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czoxMzoiY3VycmVudExvY2FsZSI7czoyOiJlbiI7czo1MDoibG9naW5fd2ViX2MxYTI2YmMwMDI0OWRjNjIxZjAzYzQxNzc4ZDU1ZmUzMzFlN2U5MTIiO2k6MztzOjY6InVzZXJJZCI7aTozO3M6ODoidXNlcm5hbWUiO3M6NzoiZGJhcm5lcyI7czo1OiJlbWFpbCI7czoyMjoiZGJhcm5lc0BtYWlsaW5hdG9yLmNvbSI7czo4OiJsb2dpbl9pcCI7czo5OiIxMjcuMC4wLjEiO3M6MTc6InBhc3N3b3JkX2hhc2hfd2ViIjtzOjY0OiI2MjI0YTY0ZTllZWY1OTE4YjUwOTY4OTgyMzc2OTU2OTIyMDE3NDY0NTQ1NWI4ZGQyNjliNDZlZjNhMTExN2I2Ijt9'),
('nvB1bTNx4hnCZhmQoRCYS4J6BMmvQ1V3fdVzlHxH',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/157.0.0.0 Safari/537.36',1795267851,'YTo5OntzOjY6Il90b2tlbiI7czo0MDoiNEx2WjUxZG41R3lKS2VXNE1aY01saGFmNlVicDZ1ZFhYTEplNVFrMyI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czoxMzoiY3VycmVudExvY2FsZSI7czoyOiJlbiI7czo1MDoibG9naW5fd2ViX2MxYTI2YmMwMDI0OWRjNjIxZjAzYzQxNzc4ZDU1ZmUzMzFlN2U5MTIiO2k6MztzOjY6InVzZXJJZCI7aTozO3M6ODoidXNlcm5hbWUiO3M6NzoiZGJhcm5lcyI7czo1OiJlbWFpbCI7czoyMjoiZGJhcm5lc0BtYWlsaW5hdG9yLmNvbSI7czo4OiJsb2dpbl9pcCI7czo5OiIxMjcuMC4wLjEiO3M6MTc6InBhc3N3b3JkX2hhc2hfd2ViIjtzOjY0OiI2MjI0YTY0ZTllZWY1OTE4YjUwOTY4OTgyMzc2OTU2OTIyMDE3NDY0NTQ1NWI4ZGQyNjliNDZlZjNhMTExN2I2Ijt9'),
('OSFdHOPgSh7db5zndCb6Z4BbNzAxzw0tupJtRpjA',8,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/157.0.0.0 Safari/537.36',1795267847,'YTo5OntzOjY6Il90b2tlbiI7czo0MDoiSmN6bll3NHNOcG00NnVIS1N6bDAxRlRUUGp3MW42QXZCZnEzWkVHVyI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czoxMzoiY3VycmVudExvY2FsZSI7czoyOiJlbiI7czo1MDoibG9naW5fd2ViX2MxYTI2YmMwMDI0OWRjNjIxZjAzYzQxNzc4ZDU1ZmUzMzFlN2U5MTIiO2k6ODtzOjY6InVzZXJJZCI7aTo4O3M6ODoidXNlcm5hbWUiO3M6ODoiY2t3YW50ZXMiO3M6NToiZW1haWwiO3M6MjM6ImNrd2FudGVzQG1haWxpbmF0b3IuY29tIjtzOjg6ImxvZ2luX2lwIjtzOjk6IjEyNy4wLjAuMSI7czoxNzoicGFzc3dvcmRfaGFzaF93ZWIiO3M6NjQ6ImU5ODI5YTFjNGY5OTY3YzM5OTk1Y2ZiZjkwZTdhYzE1OGYwMDg2MjhlNDMyNDFiZTliZTMxOTRkMTgxNWE3NWQiO30='),
('oX0xMNzGVj6FCKEWdkK0gjTzKTU0MSX4D9Bj7gSs',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/157.0.0.0 Safari/537.36',1795267592,'YTozOntzOjY6Il90b2tlbiI7czo0MDoiaWVpYnhpNnFxandkamluMkxoZE5EOWc1ZDRVT0o4Y1drNUM4YUFOTCI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czoxMzoiY3VycmVudExvY2FsZSI7czoyOiJlbiI7fQ=='),
('P1FV3Bxa58d2SCyLxpShHCwGJZlgP7hyMwFH73w8',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/157.0.0.0 Safari/537.36',1795267651,'YTo2OntzOjY6Il90b2tlbiI7czo0MDoiZlBERUZWR0hkRTBiNDIxSGN2eVpPR1RoT0lXTFc2endDbGpqWkU4aiI7czo4OiJ1c2VybmFtZSI7czo1OiJhZG1pbiI7czo1OiJlbWFpbCI7czoyMzoicGtwYWRtaW5AbWFpbGluYXRvci5jb20iO3M6NTA6ImxvZ2luX3dlYl9jMWEyNmJjMDAyNDlkYzYyMWYwM2M0MTc3OGQ1NWZlMzMxZTdlOTEyIjtOO3M6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fXM6MTM6ImN1cnJlbnRMb2NhbGUiO3M6MjoiZW4iO30='),
('pLgzEXCw08wbZ7PDDra0T53NB6eoZkxCVPROXup8',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/157.0.0.0 Safari/537.36',1795267946,'YTozOntzOjY6Il90b2tlbiI7czo0MDoiN0xaVzk4bmVDdk94NWVKd0VxWFNaUjlrUWhCdHRWWTY5d1NqUjJoSyI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czoxMzoiY3VycmVudExvY2FsZSI7czoyOiJlbiI7fQ=='),
('pPBppnbAVdBASuqAlFk2Q2p2EpPixIvcWewQL7Y2',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/157.0.0.0 Safari/537.36',1795268100,'YTo2OntzOjY6Il90b2tlbiI7czo0MDoiTHpUVGpIUVBmTTlhR3QxcnV3QXc3V0lOdEQ1RlBBa2tlcHZFcFJqeiI7czo4OiJ1c2VybmFtZSI7czoxMjoibGNocmlzdG9waGVyIjtzOjU6ImVtYWlsIjtzOjI3OiJsY2hyaXN0b3BoZXJAbWFpbGluYXRvci5jb20iO3M6NTA6ImxvZ2luX3dlYl9jMWEyNmJjMDAyNDlkYzYyMWYwM2M0MTc3OGQ1NWZlMzMxZTdlOTEyIjtOO3M6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fXM6MTM6ImN1cnJlbnRMb2NhbGUiO3M6MjoiZW4iO30='),
('qoCZV0u4ujzIxdiP2qVjYdpmKPNpR5LGFqSa0X5p',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/157.0.0.0 Safari/537.36',1795268169,'YTo2OntzOjY6Il90b2tlbiI7czo0MDoiWGZHM1NMaWdMWmRjQ2R6QTRIZ0pCUXFaeHRkMmxiYUxBOHBQczlUUyI7czo4OiJ1c2VybmFtZSI7czo4OiJyYmFpeWV3dSI7czo1OiJlbWFpbCI7czoyMzoicmJhaXlld3VAbWFpbGluYXRvci5jb20iO3M6NTA6ImxvZ2luX3dlYl9jMWEyNmJjMDAyNDlkYzYyMWYwM2M0MTc3OGQ1NWZlMzMxZTdlOTEyIjtOO3M6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fXM6MTM6ImN1cnJlbnRMb2NhbGUiO3M6MjoiZW4iO30='),
('R0xLpdeNtdkosLB9fionJL6r8TeGNCtPJ4kMPDPO',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/157.0.0.0 Safari/537.36',1795267657,'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZThGclh0U1BPRklFUWhvcGhWdENHbzB0WFR1cEpKOUtGNnVYa01UVCI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czoxMzoiY3VycmVudExvY2FsZSI7czoyOiJlbiI7fQ=='),
('R1dVKnOJbflcwfYK7NBmZLHABjKm2PgjA3WMCF3d',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/157.0.0.0 Safari/537.36',1795267874,'YTo2OntzOjY6Il90b2tlbiI7czo0MDoiUEt1ZzJPUVpsb3ZDTm41eWNUZkxKc2ZsSk11MzVnMHJOb3NaU3ZmMiI7czo4OiJ1c2VybmFtZSI7czo3OiJkYmFybmVzIjtzOjU6ImVtYWlsIjtzOjIyOiJkYmFybmVzQG1haWxpbmF0b3IuY29tIjtzOjUwOiJsb2dpbl93ZWJfYzFhMjZiYzAwMjQ5ZGM2MjFmMDNjNDE3NzhkNTVmZTMzMWU3ZTkxMiI7TjtzOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX1zOjEzOiJjdXJyZW50TG9jYWxlIjtzOjI6ImVuIjt9'),
('r2SK2XZs8eNS1veL5of7o2w4suN4qMYfb7em2SAW',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/157.0.0.0 Safari/537.36',1795267620,'YTo2OntzOjY6Il90b2tlbiI7czo0MDoiYzRuUFhiaTRGWHprUzJXQ0xyNEoxTzd1YjhOS0FSMXY3VFFTVnVVMiI7czo4OiJ1c2VybmFtZSI7czo1OiJhZG1pbiI7czo1OiJlbWFpbCI7czoyMzoicGtwYWRtaW5AbWFpbGluYXRvci5jb20iO3M6NTA6ImxvZ2luX3dlYl9jMWEyNmJjMDAyNDlkYzYyMWYwM2M0MTc3OGQ1NWZlMzMxZTdlOTEyIjtOO3M6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fXM6MTM6ImN1cnJlbnRMb2NhbGUiO3M6MjoiZW4iO30='),
('rasVjyqlBs8z1t2BoonLpptVAgou7wV3FcBzZc1p',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/157.0.0.0 Safari/537.36',1795267715,'YTozOntzOjY6Il90b2tlbiI7czo0MDoieUhlZFpKc3BqVG95YVUxOWlacWR5NGxMNmRQZnVDNUEwZ0Jxand3TSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czoxMzoiY3VycmVudExvY2FsZSI7czoyOiJlbiI7fQ=='),
('sDxWEGT8xEcC0xVyNQtwW8OoAXMSIjbNJm4jvw1y',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/157.0.0.0 Safari/537.36',1795267869,'YTo2OntzOjY6Il90b2tlbiI7czo0MDoiWGNhV3ViNG1rdnRZaXJRZWVjRFgxNWt1VXlqU1pxY0MwcE9wUTVrYiI7czo4OiJ1c2VybmFtZSI7czoxMjoiY21vbnRnb21lcmllIjtzOjU6ImVtYWlsIjtzOjI3OiJjbW9udGdvbWVyaWVAbWFpbGluYXRvci5jb20iO3M6NTA6ImxvZ2luX3dlYl9jMWEyNmJjMDAyNDlkYzYyMWYwM2M0MTc3OGQ1NWZlMzMxZTdlOTEyIjtOO3M6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fXM6MTM6ImN1cnJlbnRMb2NhbGUiO3M6MjoiZW4iO30='),
('sFa1QUXEKlGEDPp3n3iTJbgRfotn2Bg0fgiC5fEX',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/157.0.0.0 Safari/537.36',1795267972,'YTo5OntzOjY6Il90b2tlbiI7czo0MDoiVk03RU1ic205dXVvRmR4anFCRHFvbzdUNHJwQ3B5WG80RVhoajU5NSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czoxMzoiY3VycmVudExvY2FsZSI7czoyOiJlbiI7czo1MDoibG9naW5fd2ViX2MxYTI2YmMwMDI0OWRjNjIxZjAzYzQxNzc4ZDU1ZmUzMzFlN2U5MTIiO2k6MztzOjY6InVzZXJJZCI7aTozO3M6ODoidXNlcm5hbWUiO3M6NzoiZGJhcm5lcyI7czo1OiJlbWFpbCI7czoyMjoiZGJhcm5lc0BtYWlsaW5hdG9yLmNvbSI7czo4OiJsb2dpbl9pcCI7czo5OiIxMjcuMC4wLjEiO3M6MTc6InBhc3N3b3JkX2hhc2hfd2ViIjtzOjY0OiI2MjI0YTY0ZTllZWY1OTE4YjUwOTY4OTgyMzc2OTU2OTIyMDE3NDY0NTQ1NWI4ZGQyNjliNDZlZjNhMTExN2I2Ijt9'),
('TSwhFy5qKjELUqHFu6HWmi58SXTLMKUTJZViVmQy',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/157.0.0.0 Safari/537.36',1795267607,'YTo2OntzOjY6Il90b2tlbiI7czo0MDoiRzNLQUtzdmdYWDJtcGJNNnBPUmMzU3hzajdFWGNNVE9nZ2ZwcWR6SyI7czo4OiJ1c2VybmFtZSI7czo1OiJhZG1pbiI7czo1OiJlbWFpbCI7czoyMzoicGtwYWRtaW5AbWFpbGluYXRvci5jb20iO3M6NTA6ImxvZ2luX3dlYl9jMWEyNmJjMDAyNDlkYzYyMWYwM2M0MTc3OGQ1NWZlMzMxZTdlOTEyIjtOO3M6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fXM6MTM6ImN1cnJlbnRMb2NhbGUiO3M6MjoiZW4iO30='),
('Ujl9H5kcEopjwQtMJLEWHZzdJuu2psJjDvpT9qZC',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/157.0.0.0 Safari/537.36',1795267946,'YTo2OntzOjY6Il90b2tlbiI7czo0MDoiOHR2QTJJYlQxNzBWWWtsWWVXYjNadUtWdzZhR0lSRGZrRVV3NlJGUiI7czo4OiJ1c2VybmFtZSI7czo3OiJkYmFybmVzIjtzOjU6ImVtYWlsIjtzOjIyOiJkYmFybmVzQG1haWxpbmF0b3IuY29tIjtzOjUwOiJsb2dpbl93ZWJfYzFhMjZiYzAwMjQ5ZGM2MjFmMDNjNDE3NzhkNTVmZTMzMWU3ZTkxMiI7TjtzOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX1zOjEzOiJjdXJyZW50TG9jYWxlIjtzOjI6ImVuIjt9'),
('uu5jLWtaxdPMlf45rKjbo4nn7rbxfk68wzrfwlll',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/157.0.0.0 Safari/537.36',1795268195,'YTo5OntzOjY6Il90b2tlbiI7czo0MDoiQjk2dGFTeVM3OVdLbmRjWmZvN0pIMlhUTVgxUHJQNzJUZ2tPSUhvYiI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czoxMzoiY3VycmVudExvY2FsZSI7czoyOiJlbiI7czo1MDoibG9naW5fd2ViX2MxYTI2YmMwMDI0OWRjNjIxZjAzYzQxNzc4ZDU1ZmUzMzFlN2U5MTIiO2k6MztzOjY6InVzZXJJZCI7aTozO3M6ODoidXNlcm5hbWUiO3M6NzoiZGJhcm5lcyI7czo1OiJlbWFpbCI7czoyMjoiZGJhcm5lc0BtYWlsaW5hdG9yLmNvbSI7czo4OiJsb2dpbl9pcCI7czo5OiIxMjcuMC4wLjEiO3M6MTc6InBhc3N3b3JkX2hhc2hfd2ViIjtzOjY0OiI2MjI0YTY0ZTllZWY1OTE4YjUwOTY4OTgyMzc2OTU2OTIyMDE3NDY0NTQ1NWI4ZGQyNjliNDZlZjNhMTExN2I2Ijt9'),
('uY3UFkhPeKn0t5YsVfL86QZUyDBpbF64pGnxr1RT',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/157.0.0.0 Safari/537.36',1795268083,'YTo5OntzOjY6Il90b2tlbiI7czo0MDoiYXZNQVZDQ0FUOUZ6WUR6VGlmVU9RMXAyc1lpcjFQTVJMSVNzcGpyWCI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czoxMzoiY3VycmVudExvY2FsZSI7czoyOiJlbiI7czo1MDoibG9naW5fd2ViX2MxYTI2YmMwMDI0OWRjNjIxZjAzYzQxNzc4ZDU1ZmUzMzFlN2U5MTIiO2k6MztzOjY6InVzZXJJZCI7aTozO3M6ODoidXNlcm5hbWUiO3M6NzoiZGJhcm5lcyI7czo1OiJlbWFpbCI7czoyMjoiZGJhcm5lc0BtYWlsaW5hdG9yLmNvbSI7czo4OiJsb2dpbl9pcCI7czo5OiIxMjcuMC4wLjEiO3M6MTc6InBhc3N3b3JkX2hhc2hfd2ViIjtzOjY0OiI2MjI0YTY0ZTllZWY1OTE4YjUwOTY4OTgyMzc2OTU2OTIyMDE3NDY0NTQ1NWI4ZGQyNjliNDZlZjNhMTExN2I2Ijt9'),
('V5jlRiHxN89xUGhcCV1cey0RBLRHNgsQzEXAF6gc',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/157.0.0.0 Safari/537.36',1795268239,'YTo5OntzOjY6Il90b2tlbiI7czo0MDoiUU9DdEE2amF2MG5EU25YTkowTkdiRzRLeGI0WmdHanZlRkxlMURESSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czoxMzoiY3VycmVudExvY2FsZSI7czoyOiJlbiI7czo1MDoibG9naW5fd2ViX2MxYTI2YmMwMDI0OWRjNjIxZjAzYzQxNzc4ZDU1ZmUzMzFlN2U5MTIiO2k6MztzOjY6InVzZXJJZCI7aTozO3M6ODoidXNlcm5hbWUiO3M6NzoiZGJhcm5lcyI7czo1OiJlbWFpbCI7czoyMjoiZGJhcm5lc0BtYWlsaW5hdG9yLmNvbSI7czo4OiJsb2dpbl9pcCI7czo5OiIxMjcuMC4wLjEiO3M6MTc6InBhc3N3b3JkX2hhc2hfd2ViIjtzOjY0OiI2MjI0YTY0ZTllZWY1OTE4YjUwOTY4OTgyMzc2OTU2OTIyMDE3NDY0NTQ1NWI4ZGQyNjliNDZlZjNhMTExN2I2Ijt9'),
('vTCwgkSwGoVusRscBBSQ5aJ8q4p5kpvePDFJ04k2',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/157.0.0.0 Safari/537.36',1795268213,'YTo2OntzOjY6Il90b2tlbiI7czo0MDoiUzFSeUFSVG5SMVFMdUZSaWRrMEFyWDJZSHppeVlEeDNxSzJqRVRuaiI7czo4OiJ1c2VybmFtZSI7czoxMjoidmthcmJhc2l6YWVkIjtzOjU6ImVtYWlsIjtzOjI3OiJ2a2FyYmFzaXphZWRAbWFpbGluYXRvci5jb20iO3M6NTA6ImxvZ2luX3dlYl9jMWEyNmJjMDAyNDlkYzYyMWYwM2M0MTc3OGQ1NWZlMzMxZTdlOTEyIjtOO3M6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fXM6MTM6ImN1cnJlbnRMb2NhbGUiO3M6MjoiZW4iO30='),
('vWDADSnoDfAGY4sE6mpqrl8gpQQP4lQqsReffawr',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/157.0.0.0 Safari/537.36',1795267995,'YTo5OntzOjY6Il90b2tlbiI7czo0MDoieTl3VFBMVTl3N1JMYzFCNTRpckxVdERVOTBUUzY3cm94ZlVtUjRwcyI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czoxMzoiY3VycmVudExvY2FsZSI7czoyOiJlbiI7czo1MDoibG9naW5fd2ViX2MxYTI2YmMwMDI0OWRjNjIxZjAzYzQxNzc4ZDU1ZmUzMzFlN2U5MTIiO2k6MztzOjY6InVzZXJJZCI7aTozO3M6ODoidXNlcm5hbWUiO3M6NzoiZGJhcm5lcyI7czo1OiJlbWFpbCI7czoyMjoiZGJhcm5lc0BtYWlsaW5hdG9yLmNvbSI7czo4OiJsb2dpbl9pcCI7czo5OiIxMjcuMC4wLjEiO3M6MTc6InBhc3N3b3JkX2hhc2hfd2ViIjtzOjY0OiI2MjI0YTY0ZTllZWY1OTE4YjUwOTY4OTgyMzc2OTU2OTIyMDE3NDY0NTQ1NWI4ZGQyNjliNDZlZjNhMTExN2I2Ijt9'),
('w37BncVQ2uWl88P8jRpOWOHVYbCP9bOOTivHzfsi',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/157.0.0.0 Safari/537.36',1795268152,'YTo5OntzOjY6Il90b2tlbiI7czo0MDoibEMya282cVFPTGRGczM4RmYyeWlObDJsTjN4MjF6YTMzdXhxUXl4WiI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czoxMzoiY3VycmVudExvY2FsZSI7czoyOiJlbiI7czo1MDoibG9naW5fd2ViX2MxYTI2YmMwMDI0OWRjNjIxZjAzYzQxNzc4ZDU1ZmUzMzFlN2U5MTIiO2k6MztzOjY6InVzZXJJZCI7aTozO3M6ODoidXNlcm5hbWUiO3M6NzoiZGJhcm5lcyI7czo1OiJlbWFpbCI7czoyMjoiZGJhcm5lc0BtYWlsaW5hdG9yLmNvbSI7czo4OiJsb2dpbl9pcCI7czo5OiIxMjcuMC4wLjEiO3M6MTc6InBhc3N3b3JkX2hhc2hfd2ViIjtzOjY0OiI2MjI0YTY0ZTllZWY1OTE4YjUwOTY4OTgyMzc2OTU2OTIyMDE3NDY0NTQ1NWI4ZGQyNjliNDZlZjNhMTExN2I2Ijt9'),
('xKkDMfU21bDZntfjkmhezv9I3Z3pgpOPDzKwjKXI',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/157.0.0.0 Safari/537.36',1795268012,'YTo2OntzOjY6Il90b2tlbiI7czo0MDoiYmtqdklYa0RBZVlRTmZWNGVnaEhhbVNKaXJDc0dRM2ZxWHVuY0lRNyI7czo4OiJ1c2VybmFtZSI7czo5OiJmcGFnbGllcmkiO3M6NToiZW1haWwiO3M6MjQ6ImZwYWdsaWVyaUBtYWlsaW5hdG9yLmNvbSI7czo1MDoibG9naW5fd2ViX2MxYTI2YmMwMDI0OWRjNjIxZjAzYzQxNzc4ZDU1ZmUzMzFlN2U5MTIiO047czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czoxMzoiY3VycmVudExvY2FsZSI7czoyOiJlbiI7fQ=='),
('yhg1FScRYfNo2rvZdZD0Vv68paFFLOZ6XNSK2p6z',7,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/157.0.0.0 Safari/537.36',1795267788,'YTo5OntzOjY6Il90b2tlbiI7czo0MDoiaW5GSXc3YVM2UW1HQ201bFZ4MUNIZWZhYjhlYWlFbTBkMkJhcjFaciI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czoxMzoiY3VycmVudExvY2FsZSI7czoyOiJlbiI7czo1MDoibG9naW5fd2ViX2MxYTI2YmMwMDI0OWRjNjIxZjAzYzQxNzc4ZDU1ZmUzMzFlN2U5MTIiO2k6NztzOjY6InVzZXJJZCI7aTo3O3M6ODoidXNlcm5hbWUiO3M6NzoiY2NvcmlubyI7czo1OiJlbWFpbCI7czoyMjoiY2Nvcmlub0BtYWlsaW5hdG9yLmNvbSI7czo4OiJsb2dpbl9pcCI7czo5OiIxMjcuMC4wLjEiO3M6MTc6InBhc3N3b3JkX2hhc2hfd2ViIjtzOjY0OiIyOGE5NWQ2ZTY2OGEzMGIyZjY4YzFlMzI1ZDFhMDIzYzg3MmVhNzM5NTNlM2ZiNTc3OTllOTE3MzlkNmE3ZWQzIjt9'),
('ZJUxLRpUaA8J8IeMBXNPHpGczUbFJidlw8EecgSu',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/157.0.0.0 Safari/537.36',1795267676,'YTozOntzOjY6Il90b2tlbiI7czo0MDoiNjhqRnp5a21iSGZoQ0JCSGQwUlRmOWI1ZWZyanV1U2N2TGxzMDBRNCI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czoxMzoiY3VycmVudExvY2FsZSI7czoyOiJlbiI7fQ==');
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
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `site_settings` (
  `site_setting_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `setting_name` varchar(255) NOT NULL,
  `locale` varchar(28) NOT NULL DEFAULT '',
  `setting_value` mediumtext DEFAULT NULL,
  PRIMARY KEY (`site_setting_id`),
  UNIQUE KEY `site_settings_unique` (`setting_name`,`locale`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='More data about the site, including localized properties such as its name.';
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
(10,'passwordUncompromisedEnabled','','0'),
(11,'rateLimitEnabled','','0'),
(12,'rateLimitMaxAttempts','','5'),
(13,'rateLimitDecaySeconds','','300'),
(14,'disableSharedReviewerStatistics','','0'),
(15,'orcidClientId','',''),
(16,'orcidClientSecret','',''),
(17,'orcidCustomRedirectBaseUrl','',''),
(18,'orcidEnabled','','0'),
(19,'themePluginPath','','default'),
(20,'uniqueSiteId','','924059F2-1D3A-450B-8BD3-48BC24FB4C1C');
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
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='Who can access a submission while it is in the editorial workflow. Includes all editorial and author assignments. For reviewers, see review_assignments.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stage_assignments`
--

LOCK TABLES `stage_assignments` WRITE;
/*!40000 ALTER TABLE `stage_assignments` DISABLE KEYS */;
INSERT INTO `stage_assignments` VALUES
(1,1,4,7,'2026-11-21 13:29:36',0,1),
(2,1,3,4,'2026-11-21 13:29:48',0,1),
(3,1,3,5,'2026-11-21 13:29:48',0,1),
(4,2,4,8,'2026-11-21 13:29:56',0,1),
(5,2,3,4,'2026-11-21 13:30:43',0,1),
(6,2,3,5,'2026-11-21 13:30:43',0,1),
(7,3,4,9,'2026-11-21 13:30:56',0,1),
(8,3,3,4,'2026-11-21 13:31:09',0,1),
(9,3,3,5,'2026-11-21 13:31:09',0,1),
(10,4,4,10,'2026-11-21 13:31:31',0,1),
(11,4,3,4,'2026-11-21 13:31:43',0,1),
(12,4,3,5,'2026-11-21 13:31:43',0,1),
(13,5,4,11,'2026-11-21 13:32:05',0,1),
(14,5,3,4,'2026-11-21 13:32:17',0,1),
(15,5,3,5,'2026-11-21 13:32:17',0,1),
(16,6,4,12,'2026-11-21 13:32:35',0,1),
(17,6,3,4,'2026-11-21 13:32:48',0,1),
(18,6,3,5,'2026-11-21 13:32:48',0,1),
(19,7,4,13,'2026-11-21 13:32:58',0,1),
(20,7,3,4,'2026-11-21 13:33:10',0,1),
(21,7,3,5,'2026-11-21 13:33:10',0,1),
(22,8,4,14,'2026-11-21 13:33:20',0,1),
(23,8,3,4,'2026-11-21 13:33:32',0,1),
(24,8,3,5,'2026-11-21 13:33:32',0,1),
(25,9,4,15,'2026-11-21 13:33:42',0,1),
(26,9,3,4,'2026-11-21 13:33:54',0,1),
(27,9,3,5,'2026-11-21 13:33:54',0,1),
(28,10,4,16,'2026-11-21 13:34:04',0,1),
(29,10,3,4,'2026-11-21 13:34:16',0,1),
(30,10,3,5,'2026-11-21 13:34:16',0,1),
(31,11,4,17,'2026-11-21 13:34:26',0,1),
(32,11,3,4,'2026-11-21 13:34:38',0,1),
(33,11,3,5,'2026-11-21 13:34:38',0,1),
(34,12,4,18,'2026-11-21 13:34:48',0,1),
(35,12,3,4,'2026-11-21 13:35:00',0,1),
(36,12,3,5,'2026-11-21 13:35:00',0,1),
(37,13,4,19,'2026-11-21 13:35:10',0,1),
(38,13,3,4,'2026-11-21 13:35:22',0,1),
(39,13,3,5,'2026-11-21 13:35:22',0,1),
(40,14,4,20,'2026-11-21 13:35:32',0,1),
(41,14,3,4,'2026-11-21 13:35:44',0,1),
(42,14,3,5,'2026-11-21 13:35:44',0,1),
(43,15,4,21,'2026-11-21 13:35:57',0,1),
(44,15,3,4,'2026-11-21 13:36:09',0,1),
(45,15,3,5,'2026-11-21 13:36:09',0,1),
(46,16,4,22,'2026-11-21 13:36:19',0,1),
(47,16,3,4,'2026-11-21 13:36:31',0,1),
(48,16,3,5,'2026-11-21 13:36:31',0,1),
(49,17,4,23,'2026-11-21 13:36:40',0,1),
(50,17,3,4,'2026-11-21 13:36:52',0,1),
(51,17,3,5,'2026-11-21 13:36:52',0,1),
(52,18,4,24,'2026-11-21 13:37:02',0,1),
(53,18,3,4,'2026-11-21 13:37:14',0,1),
(54,18,3,5,'2026-11-21 13:37:14',0,1),
(55,19,4,25,'2026-11-21 13:37:24',0,1),
(56,19,3,4,'2026-11-21 13:37:36',0,1),
(57,19,3,5,'2026-11-21 13:37:36',0,1);
/*!40000 ALTER TABLE `stage_assignments` ENABLE KEYS */;
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
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `submission_comments` (
  `comment_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `comment_type` bigint(20) DEFAULT NULL,
  `role_id` bigint(20) NOT NULL,
  `submission_id` bigint(20) NOT NULL,
  `assoc_id` bigint(20) NOT NULL,
  `author_id` bigint(20) NOT NULL,
  `comment_title` text NOT NULL,
  `comments` mediumtext DEFAULT NULL,
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
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='Revisions map submission_file entries to files on the data store.';
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
(4,4,3),
(5,5,4),
(6,6,5),
(7,7,6),
(8,8,7),
(9,9,8),
(10,10,9),
(11,11,10),
(12,12,11),
(13,13,12),
(14,14,13),
(15,15,14),
(16,16,15),
(17,17,16),
(18,18,17),
(19,19,18),
(20,20,19);
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
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='Localized data about submission files like published metadata.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `submission_file_settings`
--

LOCK TABLES `submission_file_settings` WRITE;
/*!40000 ALTER TABLE `submission_file_settings` DISABLE KEYS */;
INSERT INTO `submission_file_settings` VALUES
(1,1,'en','name','The influence of lactation on the quantity and quality of cashmere production.pdf'),
(2,2,'en','name','The Facets Of Job Satisfaction: A Nine-Nation Comparative Study Of Construct Equivalence.pdf'),
(3,3,'en','name','Computer Skill Requirements for New and Existing Teachers: Implications for Policy and Practice.pdf'),
(4,4,'en','name','Computer Skill Requirements for New and Existing Teachers: Implications for Policy and Practice.pdf'),
(5,5,'en','name','Genetic transformation of forest trees.pdf'),
(6,6,'en','name','Investigating the Shared Background Required for Argument: A Critique of Fogelin\'s Thesis on Deep Disagreement.pdf'),
(7,7,'en','name','Developing efficacy beliefs in the classroom.pdf'),
(8,8,'en','name','Developing efficacy beliefs in the classroom.pdf'),
(9,9,'en','name','Hansen & Pinto: Reason Reclaimed.pdf'),
(10,10,'en','name','Signalling Theory Dividends: A Review Of The Literature And Empirical Evidence.pdf'),
(11,11,'en','name','Condensing Water Availability Models to Focus on Specific Water Management Systems.pdf'),
(12,12,'en','name','Learning Sustainable Design through Service.pdf'),
(13,13,'en','name','Sodium butyrate improves growth performance of weaned piglets during the first period after weaning.pdf'),
(14,14,'en','name','Hydrologic Connectivity in the Edwards Aquifer between San Marcos Springs and Barton Springs during 2009 Drought Conditions.pdf'),
(15,15,'en','name','Towards Designing an Intercultural Curriculum: A Case Study from the Atlantic Coast of Nicaragua.pdf'),
(16,16,'en','name','Yam diseases and its management in Nigeria.pdf'),
(17,17,'en','name','Influence of long-term nutrition with different dietary fats on fatty acid composition of heavy pigs backfat.pdf'),
(18,18,'en','name','Antimicrobial, heavy metal resistance and plasmid profile of coliforms isolated from nosocomial infections in a hospital in Isfahan, Iran.pdf'),
(19,19,'en','name','Self-Organization in Multi-Level Institutions in Networked Environments.pdf'),
(20,20,'en','name','Finocchiaro: Arguments About Arguments.pdf');
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
  `variant_group_id` bigint(20) DEFAULT NULL,
  `variant_type` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`submission_file_id`),
  KEY `submission_files_submission_id` (`submission_id`),
  KEY `submission_files_file_id` (`file_id`),
  KEY `submission_files_genre_id` (`genre_id`),
  KEY `submission_files_uploader_user_id` (`uploader_user_id`),
  KEY `submission_files_stage_assoc` (`file_stage`,`assoc_type`,`assoc_id`),
  KEY `submission_files_source_submission_file_id` (`source_submission_file_id`),
  KEY `submission_files_variant_group_id` (`variant_group_id`),
  CONSTRAINT `submission_files_file_id_foreign` FOREIGN KEY (`file_id`) REFERENCES `files` (`file_id`) ON DELETE CASCADE,
  CONSTRAINT `submission_files_genre_id_foreign` FOREIGN KEY (`genre_id`) REFERENCES `genres` (`genre_id`) ON DELETE SET NULL,
  CONSTRAINT `submission_files_source_submission_file_id_foreign` FOREIGN KEY (`source_submission_file_id`) REFERENCES `submission_files` (`submission_file_id`) ON DELETE CASCADE,
  CONSTRAINT `submission_files_submission_id` FOREIGN KEY (`submission_id`) REFERENCES `submissions` (`submission_id`) ON DELETE CASCADE,
  CONSTRAINT `submission_files_uploader_user_id_foreign` FOREIGN KEY (`uploader_user_id`) REFERENCES `users` (`user_id`) ON DELETE SET NULL,
  CONSTRAINT `submission_files_variant_group_id_foreign` FOREIGN KEY (`variant_group_id`) REFERENCES `variant_groups` (`variant_group_id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='All files associated with a submission, such as those uploaded during submission, as revisions, or by copyeditors or layout editors for production.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `submission_files`
--

LOCK TABLES `submission_files` WRITE;
/*!40000 ALTER TABLE `submission_files` DISABLE KEYS */;
INSERT INTO `submission_files` VALUES
(1,1,1,NULL,1,10,NULL,NULL,NULL,'2026-11-21 13:29:46','2026-11-21 13:29:48',7,521,1,NULL,NULL),
(2,2,2,NULL,1,10,NULL,NULL,NULL,'2026-11-21 13:30:06','2026-11-21 13:30:08',8,521,2,NULL,NULL),
(3,3,3,NULL,1,10,NULL,NULL,NULL,'2026-11-21 13:31:06','2026-11-21 13:31:08',9,521,3,NULL,NULL),
(4,3,3,NULL,1,10,NULL,NULL,NULL,'2026-11-21 13:31:22','2026-11-21 13:31:22',9,521,4,NULL,NULL),
(5,4,4,NULL,1,10,NULL,NULL,NULL,'2026-11-21 13:31:41','2026-11-21 13:31:43',10,521,5,NULL,NULL),
(6,5,5,NULL,1,10,NULL,NULL,NULL,'2026-11-21 13:32:15','2026-11-21 13:32:17',11,521,6,NULL,NULL),
(7,6,6,NULL,1,10,NULL,NULL,NULL,'2026-11-21 13:32:45','2026-11-21 13:32:47',12,521,7,NULL,NULL),
(8,7,7,NULL,1,10,NULL,NULL,NULL,'2026-11-21 13:33:07','2026-11-21 13:33:09',13,521,8,NULL,NULL),
(9,8,8,NULL,1,10,NULL,NULL,NULL,'2026-11-21 13:33:29','2026-11-21 13:33:32',14,521,9,NULL,NULL),
(10,9,9,NULL,1,10,NULL,NULL,NULL,'2026-11-21 13:33:51','2026-11-21 13:33:54',15,521,10,NULL,NULL),
(11,10,10,NULL,1,10,NULL,NULL,NULL,'2026-11-21 13:34:13','2026-11-21 13:34:15',16,521,11,NULL,NULL),
(12,11,11,NULL,1,10,NULL,NULL,NULL,'2026-11-21 13:34:35','2026-11-21 13:34:37',17,521,12,NULL,NULL),
(13,12,12,NULL,1,10,NULL,NULL,NULL,'2026-11-21 13:34:57','2026-11-21 13:35:00',18,521,13,NULL,NULL),
(14,13,13,NULL,1,10,NULL,NULL,NULL,'2026-11-21 13:35:19','2026-11-21 13:35:22',19,521,14,NULL,NULL),
(15,14,14,NULL,1,10,NULL,NULL,NULL,'2026-11-21 13:35:41','2026-11-21 13:35:44',20,521,15,NULL,NULL),
(16,15,15,NULL,1,10,NULL,NULL,NULL,'2026-11-21 13:36:06','2026-11-21 13:36:09',21,521,16,NULL,NULL),
(17,16,16,NULL,1,10,NULL,NULL,NULL,'2026-11-21 13:36:28','2026-11-21 13:36:30',22,521,17,NULL,NULL),
(18,17,17,NULL,1,10,NULL,NULL,NULL,'2026-11-21 13:36:50','2026-11-21 13:36:52',23,521,18,NULL,NULL),
(19,18,18,NULL,1,10,NULL,NULL,NULL,'2026-11-21 13:37:12','2026-11-21 13:37:14',24,521,19,NULL,NULL),
(20,19,19,NULL,1,10,NULL,NULL,NULL,'2026-11-21 13:37:34','2026-11-21 13:37:36',25,521,20,NULL,NULL);
/*!40000 ALTER TABLE `submission_files` ENABLE KEYS */;
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
(1,1,1,'2026-11-21 13:29:48','2026-11-21 13:29:48','2026-11-21 13:29:48',5,'en',1,'',0),
(2,1,2,'2026-11-21 13:30:51','2026-11-21 13:30:43','2026-11-21 13:30:43',6,'en',3,'',0),
(3,1,4,'2026-11-21 13:31:26','2026-11-21 13:31:09','2026-11-21 13:31:09',6,'en',3,'',0),
(4,1,5,'2026-11-21 13:31:43','2026-11-21 13:31:43','2026-11-21 13:31:43',5,'en',4,'',0),
(5,1,6,'2026-11-21 13:32:30','2026-11-21 13:32:17','2026-11-21 13:32:17',6,'en',3,'',0),
(6,1,7,'2026-11-21 13:32:52','2026-11-21 13:32:48','2026-11-21 13:32:48',6,'en',3,'',0),
(7,1,8,'2026-11-21 13:33:14','2026-11-21 13:33:10','2026-11-21 13:33:10',6,'en',3,'',0),
(8,1,9,'2026-11-21 13:33:36','2026-11-21 13:33:32','2026-11-21 13:33:32',6,'en',3,'',0),
(9,1,10,'2026-11-21 13:33:58','2026-11-21 13:33:54','2026-11-21 13:33:54',6,'en',3,'',0),
(10,1,11,'2026-11-21 13:34:20','2026-11-21 13:34:16','2026-11-21 13:34:16',6,'en',3,'',0),
(11,1,12,'2026-11-21 13:34:42','2026-11-21 13:34:38','2026-11-21 13:34:38',6,'en',3,'',0),
(12,1,13,'2026-11-21 13:35:04','2026-11-21 13:35:00','2026-11-21 13:35:00',6,'en',3,'',0),
(13,1,14,'2026-11-21 13:35:26','2026-11-21 13:35:22','2026-11-21 13:35:22',6,'en',3,'',0),
(14,1,15,'2026-11-21 13:35:49','2026-11-21 13:35:44','2026-11-21 13:35:44',6,'en',3,'',0),
(15,1,16,'2026-11-21 13:36:13','2026-11-21 13:36:09','2026-11-21 13:36:09',6,'en',3,'',0),
(16,1,17,'2026-11-21 13:36:35','2026-11-21 13:36:31','2026-11-21 13:36:31',6,'en',3,'',0),
(17,1,18,'2026-11-21 13:36:57','2026-11-21 13:36:52','2026-11-21 13:36:52',6,'en',3,'',0),
(18,1,19,'2026-11-21 13:37:18','2026-11-21 13:37:14','2026-11-21 13:37:14',6,'en',3,'',0),
(19,1,20,'2026-11-21 13:37:40','2026-11-21 13:37:36','2026-11-21 13:37:36',6,'en',3,'',0);
/*!40000 ALTER TABLE `submissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `submissions_fulltext`
--

DROP TABLE IF EXISTS `submissions_fulltext`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `submissions_fulltext` (
  `submissions_fulltext_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `submission_id` bigint(20) NOT NULL,
  `publication_id` bigint(20) NOT NULL,
  `locale` varchar(28) NOT NULL,
  `title` text NOT NULL,
  `abstract` text NOT NULL,
  `body` text NOT NULL,
  `authors` text NOT NULL,
  PRIMARY KEY (`submissions_fulltext_id`),
  UNIQUE KEY `submissions_fulltext_submission_id_publication_id_locale_unique` (`submission_id`,`publication_id`,`locale`),
  KEY `submissions_fulltext_publication_id_foreign` (`publication_id`),
  FULLTEXT KEY `submissions_fulltext_title_abstract_body_authors_fulltext` (`title`,`abstract`,`body`,`authors`),
  FULLTEXT KEY `submissions_fulltext_title_fulltext` (`title`),
  FULLTEXT KEY `submissions_fulltext_abstract_fulltext` (`abstract`),
  FULLTEXT KEY `submissions_fulltext_body_fulltext` (`body`),
  FULLTEXT KEY `submissions_fulltext_authors_fulltext` (`authors`),
  CONSTRAINT `submissions_fulltext_publication_id_foreign` FOREIGN KEY (`publication_id`) REFERENCES `publications` (`publication_id`) ON DELETE CASCADE,
  CONSTRAINT `submissions_fulltext_submission_id_foreign` FOREIGN KEY (`submission_id`) REFERENCES `submissions` (`submission_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='Fulltext search index for submission content';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `submissions_fulltext`
--

LOCK TABLES `submissions_fulltext` WRITE;
/*!40000 ALTER TABLE `submissions_fulltext` DISABLE KEYS */;
INSERT INTO `submissions_fulltext` VALUES
(1,2,2,'en','The Facets Of Job Satisfaction: A Nine-Nation Comparative Study Of Construct Equivalence','<p>Archival data from an attitude survey of employees in a single multinational organization were used to examine the degree to which national culture affects the nature of job satisfaction. Responses from nine countries were compiled to create a benchmark against which nations could be individually compared. Factor analysis revealed four factors: Organizational Communication, Organizational Efficiency/Effectiveness, Organizational Support, and Personal Benefit. Comparisons of factor structures indicated that Organizational Communication exhibited the most construct equivalence, and Personal Benefit the least. The most satisfied employees were those from China, and the least satisfied from Brazil, consistent with previous findings that individuals in collectivistic nations report higher satisfaction. The research findings suggest that national cultural context exerts an effect on the nature of job satisfaction.</p>','','Catherine Kwantes Urho Kekkonen '),
(5,3,3,'en','Computer Skill Requirements for New and Existing Teachers: Implications for Policy and Practice','The integration of technology into the classroom is a major issue in education today. Many national and provincial initiatives specify the technology skills that students must demonstrate at each grade level. The Government of the Province of Alberta in Canada, has mandated the implementation of a new curriculum which began in September of 2000, called Information and Communication Technology. This curriculum is infused within core courses and specifies what students are “expected to know, be able to do, and be like with respect to technology” (Alberta Learning, 2000). Since teachers are required to implement this new curriculum, school jurisdictions are turning to professional development strategies and hiring standards to upgrade teachers’ computer skills to meet this goal. This paper summarizes the results of a telephone survey administered to all public school jurisdictions in the Province of Alberta with a 100% response rate. We examined the computer skills that school jurisdictions require of newly hired teachers, and the support strategies employed for currently employed teachers.','','Craig Montgomerie Mark Irvine '),
(6,3,4,'en','Computer Skill Requirements for New and Existing Teachers: Implications for Policy and Practice','The integration of technology into the classroom is a major issue in education today. Many national and provincial initiatives specify the technology skills that students must demonstrate at each grade level. The Government of the Province of Alberta in Canada, has mandated the implementation of a new curriculum which began in September of 2000, called Information and Communication Technology. This curriculum is infused within core courses and specifies what students are “expected to know, be able to do, and be like with respect to technology” (Alberta Learning, 2000). Since teachers are required to implement this new curriculum, school jurisdictions are turning to professional development strategies and hiring standards to upgrade teachers’ computer skills to meet this goal. This paper summarizes the results of a telephone survey administered to all public school jurisdictions in the Province of Alberta with a 100% response rate. We examined the computer skills that school jurisdictions require of newly hired teachers, and the support strategies employed for currently employed teachers.','','Craig Montgomerie Mark Irvine '),
(9,5,6,'en','Investigating the Shared Background Required for Argument: A Critique of Fogelin\'s Thesis on Deep Disagreement','Robert Fogelin claims that interlocutors must share a framework of background beliefs and commitments in order to fruitfully pursue argument. I refute Fogelin’s claim by investigating more thoroughly the shared background required for productive argument. I find that this background consists not in any common beliefs regarding the topic at hand, but rather in certain shared pro-cedural commitments and competencies. I suggest that Fogelin and his supporters mistakenly view shared beliefs as part of the required background for productive argument because these procedural com-mitments become more difficult to uphold when people’s beliefs diverge widely regarding the topic at hand.','','Dana Phillips '),
(10,6,7,'en','Developing efficacy beliefs in the classroom','A major goal of education is to equip children with the knowledge, skills and self-belief to be confident and informed citizens - citizens who continue to see themselves as learners beyond graduation. This paper looks at the key role of nurturing efficacy beliefs in order to learn and participate in school and society. Research findings conducted within a social studies context are presented, showing how strategy instruction can enhance self-efficacy for learning. As part of this research, Creative Problem Solving (CPS) was taught to children as a means to motivate and support learning. It is shown that the use of CPS can have positive effects on self-efficacy for learning, and be a valuable framework to involve children in decision-making that leads to social action. Implications for enhancing self-efficacy and motivation to learn in the classroom are discussed.','','Domatilia Sokoloff '),
(11,7,8,'en','Developing efficacy beliefs in the classroom','The study of the commons has expe- rienced substantial growth and development over the past decades.1 Distinguished scholars in many disciplines had long studied how specific resources were managed or mismanaged at particular times and places (Coward 1980; De los Reyes 1980; MacKenzie 1979; Wittfogel 1957), but researchers who studied specific commons before the mid-1980s were, however, less likely than their contemporary colleagues to be well informed about the work of scholars in other disciplines, about other sec- tors in their own region of interest, or in other regions of the world.','','Elinor Ostrom Frank van Laerhoven '),
(12,8,9,'en','Hansen & Pinto: Reason Reclaimed','None.','','Fabio Paglieri '),
(13,9,10,'en','Signalling Theory Dividends: A Review Of The Literature And Empirical Evidence','The signaling theory suggests that dividends signal future prospects of a firm. However, recent empirical evidence from the US and the Uk does not offer a conclusive evidence on this issue. There are conflicting policy implications among financial economists so much that there is no practical dividend policy guidance to management, existing and potential investors in shareholding. Since corporate investment, financing and distribution decisions are a continuous function of management, the dividend decisions seem to rely on intuitive evaluation.','','John Mwandenga '),
(14,10,11,'en','Condensing Water Availability Models to Focus on Specific Water Management Systems','The Texas Water Availability Modeling System is routinely applied in administration of the water rights permit system, regional and statewide planning, and an expanding variety of other endeavors. Modeling water management in the 23 river basins of the state reflects about 8,000 water right permits and 3,400 reservoirs. Datasets are necessarily large and complex to provide the decision-support capabilities for which the modeling system was developed. New modeling features are being added, and the different types of applications are growing. Certain applications are enhanced by simplifying the simulation input datasets to focus on particular water management systems. A methodology is presented for developing a condensed dataset for a selected reservoir system that reflects the impacts of all the water rights and accompanying reservoirs removed from the original complete dataset. A set of streamflows is developed that represents flows available to the selected system considering the effects of all the other water rights in the river basin contained in the original complete model input dataset that are not included in the condensed dataset. The methodology is applied to develop a condensed model of the Brazos River Authority reservoir system based on modifying the Texas Water Availability Modeling System dataset for the Brazos River Basin.','','John Novak '),
(15,11,12,'en','Learning Sustainable Design through Service','Environmental sustainability and sustainable development principles are vital topics that engineering education has largely failed to address. Service-learning, which integrates social service into an academic setting, is an emerging tool that can be leveraged to teach sustainable design to future engineers. We present a model of using service-learning to teach sustainable design based on the experiences of the Stanford chapter of Engineers for a Sustainable World. The model involves the identification of projects and partner organizations, a student led, project-based design course, and internships coordinated with partner organizations. The model has been very successful, although limitations and challenges exist. These are discussed along with future directions for expanding the model.','','Karim Al-Khafaji Margaret Morse '),
(16,12,13,'en','Sodium butyrate improves growth performance of weaned piglets during the first period after weaning','The aim of this study was to assess the influence of long-term fat supplementation on the fatty acid profile of heavy pig adipose tissue. Fifty-four Large White barrows, averaging 25 kg LW, were randomized (matched weights) to one of three isoenergetic diets supplemented with either tallow (TA), maize oil (MO), or rapeseed oil (RO). The fats were supplement- ed at 3% as fed from 25 to 110 kg LW, and at 2.5 % from 110 kg to slaughtering. Following slaughter at about 160 kg LW, backfat samples were collected from ten animals per treatment and analyzed. Fatty acid composition of backfat close- ly reflected the fatty acid composition of the supplemented fats. The backfat of pigs fed TA had the highest saturated fatty acid content (SFA) (P&lt;0.01); those fed MO had the highest content in polyunsaturated fatty acid (PUFA) and the lowest in monounsaturated fatty acid (MUFA) content; those fed RO had the highest content of linolenic acid (C18:3) and cis 11- ecosenoic acid (C20:1). Only MO treatment had an effect on linoleic acid levels and the iodine value (IV) of backfat, result- ing in levels higher than those (IV = 70; C18:2 = 15%) accepted by the Parma Consortium for dry-cured ham. The IV and unsaturation index in both layers of subcutaneous backfat tissue differed significantly between treatments. These results show that long-term dietary supplementation with different fats changes the fatty acid profile of heavy pig adipose tissue. Supplementation with rapeseed oil increases the proportion of “healthy” fatty acids in pig fat, thereby improving the nutritional quality, however the effects on the technological quality of the fat must be carefully assessed.','','Leo Christopher '),
(17,13,14,'en','Hydrologic Connectivity in the Edwards Aquifer between San Marcos Springs and Barton Springs during 2009 Drought Conditions','The Edwards Aquifer serves as the primary water supply in South-Central Texas and is the source for several major springs. In developing a plan to protect endangered species immediately downstream of San Marcos Springs, questions have been raised regarding the established concept of a hydrologic divide between the San Antonio and Barton Springs segments of the Edwards Aquifer during drought conditions. To address these questions, a water-level data collection program and a hydrogeologic study was conducted. An analysis of groundwater-level data indicate that a groundwater divide exists in the vicinity of the surface drainage divide between Onion Creek and Blanco River during wet and normal hydrologic conditions. However, analysis of data collected during the 2009 drought suggests that the groundwater divide dissipated and no longer hydrologically separated the two segments. As a result, there is potential for groundwater to flow past San Marcos Springs toward Barton Springs during major droughts. The implications for this have bearings on the management and availability of groundwater in the Edwards Aquifer. Assessments of simulations from a numerical model suggest 5 cfs could be flowing past San Marcos toward Barton springs under drought conditions. The groundwater divide appears to be influenced by recharge along Onion Creek and Blanco River and appears to be vulnerable to extended periods of little or no recharge and extensive pumping in the vicinity of Kyle and Buda. The 2009 data set shows a very low gradient in the potentiometric surface between San Marcos Springs and Kyle with very little variation in levels between drought and non-drought periods. From Kyle toward Barton Springs, the potentiometric surface slopes significantly to the north and has dramatic changes in levels between drought and non-drought periods. The source and nature of the discontinuity of the change in potentiometric gradients and dynamic water level response at Kyle is unknown. Structural influences or hydraulic properties inherent in the aquifer could be the cause of this discontinuity and may also influence the degree of hydrologic connection between San Marcos and Barton Springs. Rapid population growth and increased water demands in the Kyle and Buda areas necessitates a continual groundwater level monitoring program between San Marcos Springs and Buda to provide data for future hydrogeologic and trend analyses.','','Lise Kumiega '),
(18,14,15,'en','Towards Designing an Intercultural Curriculum: A Case Study from the Atlantic Coast of Nicaragua','One of the challenges still to be met in the 21st century is that of genuinely embracing diversity. How can education help to overcome the barriers that continue to exist between people on the basis of language, culture and gender? This case study takes the Atlantic Coast of Nicaragua as an example of a multilingual/multiethnic region and examines how the community university URACCAN is contributing to the development of interculturality. It describes participatory research that was carried out with university staff and students with the intention of defining an intercultural curriculum and appropriate strategies for delivering such. One model used as a basis for discussions was the Model for Community Understanding from the Wales Curriculum Council, which emphasises the belonging of the individual to different communities or cultures at the same time. Factors supporting the development of an intercultural curriculum include the university’s close involvement with the ethnic communities it serves. However, ethno-linguistic power relations within the region and the country as a whole, still militate against egalitarianism within the university. The research highlights the importance of participatory pedagogy as the basis for promoting interculturality and achieving lasting social transformation.','','Patricia Daniel '),
(19,15,16,'en','Yam diseases and its management in Nigeria','This review presents different diseases associated with yam and the management strategies employed in combating its menace in Nigeria. The field and storage diseases are presented, anthracnose is regarded as the most widely spread of all the field diseases, while yam mosaic virus disease is considered to cause the most severe losses in yams. Dry rot is considered as the most devastating of all the storage diseases of yam. Dry rot of yams alone causes a marked reduction in the quantity, marketable value and edible portions of tubers and those reductions are more severe in stored yams. The management strategies adopted and advocated for combating the field diseases includes the use of crop rotation, fallowing, planting of healthy material, the destruction of infected crop cultivars and the use of resistant cultivars. With regards to the storage diseases, the use of Tecto (Thiabendazole), locally made dry gins or wood ash before storage has been found to protect yam tubers against fungal infection in storage. Finally, processing of yam tubers into chips or cubes increases its shelf live for a period of between 6 months and one year.','','Rana Baiyewu '),
(20,16,17,'en','Influence of long-term nutrition with different dietary fats on fatty acid composition of heavy pigs backfat','Aim of this research is to provide a general situation of cattle slaughtered in Cameroon, as a representative example for the Central African Sub-region. The quality and safety of beef from the abattoir of Yaoundé, the largest in Cameroon, were considered. From January 2009 to March 2012, the pre-slaughter conditions and characteristics of 1953 cattle carcasses were recorded, as well as the pH of m. longissimus thoracis 24 h after slaughter. From these carcasses, 60 were selected to represent the bulls slaughtered. The quality parameters and composition of m. longissimus thoracis were carried out. The origin of most of the cattle was the Guinea High Savannah (74.6%), and transhumance was the common production system (75.5%). Gudali (45.6%), White Fulani (33.3%) and Red Mbororo (20.3%) breeds were predominant. Carcass weight was affected by rearing system and cattle category, and it markedly varied during year. Considering meat quality, the fat content was low (1.2%) and similar between breeds, moreover Gudali showed the toughest meat. Of the cows slaughtered, 27% were pregnant and the most common abnormal conditions encountered were ectoparasites, fatigue, lameness, fungal-like skin lesions, enlarged lymph nodes, respiratory distress, nodular lesions. More than 20% of the carcasses had some organs condemned, mainly for liver flukes (5.17%), and 1.0% of them were completely condemned due to tuberculosis, that also affected 3.28% of lungs. These data could aid authorities draw up programmes with the aim to strengthen cattle production, improve beef supply, control and prevent the observed diseases, and promote the regional trade.','','Rosanna Rossi '),
(21,17,18,'en','Antimicrobial, heavy metal resistance and plasmid profile of coliforms isolated from nosocomial infections in a hospital in Isfahan, Iran','The antimicrobial, heavy metal resistance patterns and plasmid profiles of Coliforms (Enterobacteriacea) isolated from nosocomial infections and healthy human faeces were compared. Fifteen of the 25 isolates from nosocomial infections were identified as Escherichia coli, and remaining as Kelebsiella pneumoniae. Seventy two percent of the strains isolated from nosocomial infections possess multiple resistance to antibiotics compared to 45% of strains from healthy human faeces. The difference between minimal inhibitory concentration (MIC) values of strains from clinical cases and from faeces for four heavy metals (Hg, Cu, Pb, Cd) was not significant. However most strains isolated from hospital were more tolerant to heavy metal than those from healthy persons. There was no consistent relationship between plasmid profile group and antimicrobial resistance pattern, although a conjugative plasmid (>56.4 kb) encoding resistance to heavy metals and antibiotics was recovered from eight of the strains isolated from nosocomial infections. The results indicate multidrug-resistance coliforms as a potential cause of nosocomial infection in this region.','','Vajiheh Karbasizaed '),
(22,18,19,'en','Self-Organization in Multi-Level Institutions in Networked Environments','We compare a setting where actors individually decide whom to sanction with a setting where sanctions are only implemented when actors collectively agree that a certain actor should be sanctioned. Collective sanctioning decisions are problematic due to the difficulty of reaching consensus. However, when a decision is made collectively, perverse sanctioning (e.g. punishing high contributors) by individual actors is ruled out. Therefore, collective sanctioning decisions are likely to be in the interest of the whole group.','','Valerie Williamson '),
(23,19,20,'en','Finocchiaro: Arguments About Arguments','None.','','Zita Woods ');
/*!40000 ALTER TABLE `submissions_fulltext` ENABLE KEYS */;
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
  KEY `ust_load_id_context_id_ip_ua_url` (`load_id`,`context_id`,`ip`,`user_agent`,`canonical_url`),
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
-- Table structure for table `user_comment_reports`
--

DROP TABLE IF EXISTS `user_comment_reports`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_comment_reports` (
  `user_comment_report_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'Primary key.',
  `user_comment_id` bigint(20) NOT NULL COMMENT 'ID of the user comment that the reported was created for.',
  `user_id` bigint(20) NOT NULL COMMENT 'ID of the user that made the report.',
  `note` text NOT NULL COMMENT 'Reason for the report.',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`user_comment_report_id`),
  KEY `user_comment_reports_user_id_foreign` (`user_id`),
  KEY `user_comment_reports_user_comment_id` (`user_comment_id`),
  CONSTRAINT `user_comment_reports_user_comment_id_foreign` FOREIGN KEY (`user_comment_id`) REFERENCES `user_comments` (`user_comment_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `user_comment_reports_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_comment_reports`
--

LOCK TABLES `user_comment_reports` WRITE;
/*!40000 ALTER TABLE `user_comment_reports` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_comment_reports` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_comment_settings`
--

DROP TABLE IF EXISTS `user_comment_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_comment_settings` (
  `user_comment_setting_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'Primary key.',
  `user_comment_id` bigint(20) NOT NULL COMMENT 'ID of the user comment that the setting belongs to.',
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` longtext DEFAULT NULL,
  PRIMARY KEY (`user_comment_setting_id`),
  UNIQUE KEY `user_comment_settings_unique` (`user_comment_id`,`locale`,`setting_name`),
  CONSTRAINT `user_comment_settings_user_comment_id_foreign` FOREIGN KEY (`user_comment_id`) REFERENCES `user_comments` (`user_comment_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_comment_settings`
--

LOCK TABLES `user_comment_settings` WRITE;
/*!40000 ALTER TABLE `user_comment_settings` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_comment_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_comments`
--

DROP TABLE IF EXISTS `user_comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_comments` (
  `user_comment_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'Primary key.',
  `user_id` bigint(20) NOT NULL COMMENT 'ID of the user that made the comment.',
  `context_id` bigint(20) NOT NULL COMMENT 'ID of the context (e.g., journal) the comment belongs to.',
  `publication_id` bigint(20) NOT NULL COMMENT 'ID of the publication that the comment belongs to.',
  `comment_text` text NOT NULL COMMENT 'The comment text.',
  `is_approved` tinyint(1) NOT NULL DEFAULT 0 COMMENT 'Boolean indicating if the comment is approved.',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`user_comment_id`),
  KEY `user_comments_user_id_foreign` (`user_id`),
  KEY `user_comments_context_id_foreign` (`context_id`),
  KEY `user_comments_publication_context` (`publication_id`,`context_id`),
  CONSTRAINT `user_comments_context_id_foreign` FOREIGN KEY (`context_id`) REFERENCES `servers` (`server_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `user_comments_publication_id_foreign` FOREIGN KEY (`publication_id`) REFERENCES `publications` (`publication_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `user_comments_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_comments`
--

LOCK TABLES `user_comments` WRITE;
/*!40000 ALTER TABLE `user_comments` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_comments` ENABLE KEYS */;
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
(3,3,'','nameLocaleKey','default.groups.name.sectionEditor'),
(4,3,'','abbrevLocaleKey','default.groups.abbrev.sectionEditor'),
(5,4,'','nameLocaleKey','default.groups.name.author'),
(6,4,'','abbrevLocaleKey','default.groups.abbrev.author'),
(7,5,'','nameLocaleKey','default.groups.name.reader'),
(8,5,'','abbrevLocaleKey','default.groups.abbrev.reader'),
(9,6,'','nameLocaleKey','default.groups.name.editorialBoardMember'),
(10,6,'','abbrevLocaleKey','default.groups.abbrev.editorialBoardMember'),
(11,2,'en','name','Preprint Server manager'),
(12,2,'en','abbrev','PSM'),
(13,3,'en','name','Moderator'),
(14,3,'en','abbrev','MOD'),
(15,4,'en','name','Author'),
(16,4,'en','abbrev','AU'),
(17,5,'en','name','Reader'),
(18,5,'en','abbrev','Read'),
(19,6,'en','name','Editorial Board Member'),
(20,6,'en','abbrev','EBM'),
(21,2,'fr_CA','name','##default.groups.name.manager##'),
(22,2,'fr_CA','abbrev','##default.groups.abbrev.manager##'),
(23,3,'fr_CA','name','##default.groups.name.sectionEditor##'),
(24,3,'fr_CA','abbrev','##default.groups.abbrev.sectionEditor##'),
(25,4,'fr_CA','name','Auteur-e'),
(26,4,'fr_CA','abbrev','AU'),
(27,5,'fr_CA','name','Lecteur-trice'),
(28,5,'fr_CA','abbrev','Lect'),
(29,6,'fr_CA','name','Membre du comité éditorial'),
(30,6,'fr_CA','abbrev','MCE');
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
(1,1,2,5),
(2,1,2,6),
(3,1,3,5),
(4,1,3,6),
(5,1,4,5),
(6,1,4,6);
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
(1,NULL,1,1,0,0,1,0),
(2,1,16,1,0,1,1,0),
(3,1,17,1,0,1,0,1),
(4,1,65536,1,1,1,0,0),
(5,1,1048576,1,1,0,0,0),
(6,1,4097,1,0,0,0,1);
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
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='Maps users to their assigned user_groups.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_user_groups`
--

LOCK TABLES `user_user_groups` WRITE;
/*!40000 ALTER TABLE `user_user_groups` DISABLE KEYS */;
INSERT INTO `user_user_groups` VALUES
(1,1,1,'2026-11-21 13:26:13',NULL,NULL),
(2,2,1,NULL,NULL,NULL),
(3,2,2,'2026-11-21 00:00:00',NULL,1),
(4,2,3,'2026-11-21 00:00:00',NULL,1),
(5,3,4,'2026-11-21 00:00:00',NULL,1),
(6,3,5,'2026-11-21 00:00:00',NULL,1),
(7,3,6,'2026-11-21 00:00:00',NULL,1),
(8,5,7,'2026-11-21 13:29:34',NULL,NULL),
(9,4,7,'2026-11-21 13:29:36',NULL,NULL),
(10,5,8,'2026-11-21 13:29:52',NULL,NULL),
(11,4,8,'2026-11-21 13:29:53',NULL,NULL),
(12,5,9,'2026-11-21 13:30:54',NULL,NULL),
(13,4,9,'2026-11-21 13:30:56',NULL,NULL),
(14,5,10,'2026-11-21 13:31:29',NULL,NULL),
(15,4,10,'2026-11-21 13:31:31',NULL,NULL),
(16,5,11,'2026-11-21 13:32:03',NULL,NULL),
(17,4,11,'2026-11-21 13:32:05',NULL,NULL),
(18,5,12,'2026-11-21 13:32:33',NULL,NULL),
(19,4,12,'2026-11-21 13:32:35',NULL,NULL),
(20,5,13,'2026-11-21 13:32:56',NULL,NULL),
(21,4,13,'2026-11-21 13:32:58',NULL,NULL),
(22,5,14,'2026-11-21 13:33:18',NULL,NULL),
(23,4,14,'2026-11-21 13:33:20',NULL,NULL),
(24,5,15,'2026-11-21 13:33:40',NULL,NULL),
(25,4,15,'2026-11-21 13:33:42',NULL,NULL),
(26,5,16,'2026-11-21 13:34:02',NULL,NULL),
(27,4,16,'2026-11-21 13:34:04',NULL,NULL),
(28,5,17,'2026-11-21 13:34:24',NULL,NULL),
(29,4,17,'2026-11-21 13:34:26',NULL,NULL),
(30,5,18,'2026-11-21 13:34:46',NULL,NULL),
(31,4,18,'2026-11-21 13:34:48',NULL,NULL),
(32,5,19,'2026-11-21 13:35:08',NULL,NULL),
(33,4,19,'2026-11-21 13:35:10',NULL,NULL),
(34,5,20,'2026-11-21 13:35:30',NULL,NULL),
(35,4,20,'2026-11-21 13:35:32',NULL,NULL),
(36,5,21,'2026-11-21 13:35:55',NULL,NULL),
(37,4,21,'2026-11-21 13:35:57',NULL,NULL),
(38,5,22,'2026-11-21 13:36:17',NULL,NULL),
(39,4,22,'2026-11-21 13:36:19',NULL,NULL),
(40,5,23,'2026-11-21 13:36:38',NULL,NULL),
(41,4,23,'2026-11-21 13:36:40',NULL,NULL),
(42,5,24,'2026-11-21 13:37:00',NULL,NULL),
(43,4,24,'2026-11-21 13:37:02',NULL,NULL),
(44,5,25,'2026-11-21 13:37:22',NULL,NULL),
(45,4,25,'2026-11-21 13:37:24',NULL,NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='All registered users, including authentication data and profile data.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES
(1,'admin','$2y$12$gS4dHFP4eLyidVLVrS9VLu9nKXSQyR7fcWdMy/Ap0NJ1UaPjjqOdu','pkpadmin@mailinator.com',NULL,NULL,NULL,NULL,NULL,'[]',NULL,NULL,'2026-11-21 13:26:13',NULL,'2026-11-21 13:29:04',NULL,NULL,NULL,0,NULL,1,'jWRwxT0dic0RO3GiqGDw4TAeyvSp5BdBrP9BNyfFrtqWTtZCINCuUHpPOmZz'),
(2,'rvaca','$2y$12$y9mWK72FWCSHbGzntQcPR.qAVReQA5tSMG8zGk.QQvWCZPgWUOEpC','rvaca@mailinator.com',NULL,NULL,NULL,NULL,'MX','[]',NULL,NULL,'2026-11-21 13:27:37',NULL,NULL,NULL,NULL,NULL,0,NULL,1,NULL),
(3,'dbarnes','$2y$12$AdUIzbx7wLqOEEGay3ORqeVSabGLwvPhrVuZMlYPSk1/InbvqxMYq','dbarnes@mailinator.com',NULL,NULL,NULL,NULL,'AU','[]',NULL,NULL,'2026-11-21 13:27:55',NULL,'2026-11-21 13:37:37',NULL,NULL,NULL,0,NULL,1,'LIQVaQKVxViyWkoSIkN35iulaeY85ZVlPrJqLEqYgEh4bW2TT0faSgZiAiGr'),
(4,'dbuskins','$2y$12$N8K1hllC19iRBOC76YEDFuG6w1Cb5OTDnkj.bQqh4AvDzHPeTDrZC','dbuskins@mailinator.com',NULL,NULL,NULL,NULL,'US','[]',NULL,NULL,'2026-11-21 13:28:14',NULL,NULL,NULL,NULL,NULL,0,NULL,1,NULL),
(5,'sberardo','$2y$12$O8ZeTKvS3K3wzs1lIp2kjOpKrEMqwOfGYb.iXFNYjCCxjxjReiEvi','sberardo@mailinator.com',NULL,NULL,NULL,NULL,'CA','[]',NULL,NULL,'2026-11-21 13:28:34',NULL,NULL,NULL,NULL,NULL,0,NULL,1,NULL),
(6,'minoue','$2y$12$9i3pcWdFJICgp1lQ5D1BMumCNB3mKo6v/LVCvB0gvlpdeIDmnwm1.','minoue@mailinator.com',NULL,NULL,NULL,NULL,'JP','[]',NULL,NULL,'2026-11-21 13:28:54',NULL,NULL,NULL,NULL,NULL,0,NULL,1,NULL),
(7,'ccorino','$2y$12$BkSgEShNiMd66eJEuR2nbegBiitkfgP.kG8EaQJ9Qvx9xwTiITKx2','ccorino@mailinator.com',NULL,NULL,NULL,NULL,'IT','[]',NULL,NULL,'2026-11-21 13:29:34',NULL,'2026-11-21 13:29:34',NULL,NULL,NULL,0,NULL,1,NULL),
(8,'ckwantes','$2y$12$JZAWa344w5WOUytCv5XtcOu5RSW.WpcZSP.nTdZq6nEo/fGtJ4zXm','ckwantes@mailinator.com',NULL,NULL,NULL,NULL,'CA','[]',NULL,NULL,'2026-11-21 13:29:52',NULL,'2026-11-21 13:29:52',NULL,NULL,NULL,0,NULL,1,NULL),
(9,'cmontgomerie','$2y$12$C1zUDdMIOlquPxLSTDonI.S886RfFDl8OttFm.dCPULr6DugL15Si','cmontgomerie@mailinator.com',NULL,NULL,NULL,NULL,'CA','[]',NULL,NULL,'2026-11-21 13:30:54',NULL,'2026-11-21 13:30:54',NULL,NULL,NULL,0,NULL,1,NULL),
(10,'ddiouf','$2y$12$/YvvdxOfiCKcTg74IBxDuu1h82zsTSWcQKmGQe45L7vlAIJCxBtY.','ddiouf@mailinator.com',NULL,NULL,NULL,NULL,'EG','[]',NULL,NULL,'2026-11-21 13:31:29',NULL,'2026-11-21 13:31:29',NULL,NULL,NULL,0,NULL,1,NULL),
(11,'dphillips','$2y$12$3rHdMTFOsOuKpnWtfDpH4OGP09UNX9pfo772SCc0BpqQZZ/GWNviu','dphillips@mailinator.com',NULL,NULL,NULL,NULL,'CA','[]',NULL,NULL,'2026-11-21 13:32:03',NULL,'2026-11-21 13:32:03',NULL,NULL,NULL,0,NULL,1,NULL),
(12,'dsokoloff','$2y$12$0iExBvpdP813chzagW3I/.F6L1HUg3vfDSP5pyTd/JQcbz1uUxFEi','dsokoloff@mailinator.com',NULL,NULL,NULL,NULL,'IE','[]',NULL,NULL,'2026-11-21 13:32:33',NULL,'2026-11-21 13:32:34',NULL,NULL,NULL,0,NULL,1,NULL),
(13,'eostrom','$2y$12$mKCh1cUw496hS/NMmhMhS.mIv66hlaVIjP3KMRjV.lo1wPMFrkAJG','eostrom@mailinator.com',NULL,NULL,NULL,NULL,'US','[]',NULL,NULL,'2026-11-21 13:32:55',NULL,'2026-11-21 13:32:56',NULL,NULL,NULL,0,NULL,1,NULL),
(14,'fpaglieri','$2y$12$/MN9G8mPCDLndFBhMohtx.bRNiQkMxcwGu1oRFBDdJvUHmyehD2Aa','fpaglieri@mailinator.com',NULL,NULL,NULL,NULL,'IT','[]',NULL,NULL,'2026-11-21 13:33:18',NULL,'2026-11-21 13:33:18',NULL,NULL,NULL,0,NULL,1,NULL),
(15,'jmwandenga','$2y$12$3b6Y5EL21DfGbAgo9sqn8O4L6Z7Gt2kLHOa55e4e4uMQVU1B5QMu6','jmwandenga@mailinator.com',NULL,NULL,NULL,NULL,'ZA','[]',NULL,NULL,'2026-11-21 13:33:40',NULL,'2026-11-21 13:33:40',NULL,NULL,NULL,0,NULL,1,NULL),
(16,'jnovak','$2y$12$qQUFFCMO/LrnO1LZzS0WKeUvJrYa8mCpW3p50sV9oW0hV0EpH.SIm','jnovak@mailinator.com',NULL,NULL,NULL,NULL,'DK','[]',NULL,NULL,'2026-11-21 13:34:02',NULL,'2026-11-21 13:34:02',NULL,NULL,NULL,0,NULL,1,NULL),
(17,'kalkhafaji','$2y$12$nKgfKjeUmDe8CZat1V7zG.3NRB/IsWisjmjwoXfCO/xQGSqk7v2Je','kalkhafaji@mailinator.com',NULL,NULL,NULL,NULL,'US','[]',NULL,NULL,'2026-11-21 13:34:23',NULL,'2026-11-21 13:34:24',NULL,NULL,NULL,0,NULL,1,NULL),
(18,'lchristopher','$2y$12$CB6WGIy7DEAkrLn6pd0vlusgkf.Y6W3ATs813XzeGCqJ/fZh1czIC','lchristopher@mailinator.com',NULL,NULL,NULL,NULL,'AU','[]',NULL,NULL,'2026-11-21 13:34:46',NULL,'2026-11-21 13:34:46',NULL,NULL,NULL,0,NULL,1,NULL),
(19,'lkumiega','$2y$12$4YgykdPL5YZJT/3axvgbTOIW7PhRnQJ1UFOqL8/YZ9d5yO.ViGWVW','lkumiega@mailinator.com',NULL,NULL,NULL,NULL,'ZA','[]',NULL,NULL,'2026-11-21 13:35:08',NULL,'2026-11-21 13:35:08',NULL,NULL,NULL,0,NULL,1,NULL),
(20,'pdaniel','$2y$12$Aa99UHgRQNbmC0As.g5KNur7j/vwzIV/ESO4T7Rsc2NaXVhbjeZNO','pdaniel@mailinator.com',NULL,NULL,NULL,NULL,'GB','[]',NULL,NULL,'2026-11-21 13:35:30',NULL,'2026-11-21 13:35:30',NULL,NULL,NULL,0,NULL,1,NULL),
(21,'rbaiyewu','$2y$12$YimNtY57.oNom8F0aSCHwuTm0UyVXYmLbqPlDasbHVQqgxx30LHLq','rbaiyewu@mailinator.com',NULL,NULL,NULL,NULL,'KE','[]',NULL,NULL,'2026-11-21 13:35:55',NULL,'2026-11-21 13:35:55',NULL,NULL,NULL,0,NULL,1,NULL),
(22,'rrossi','$2y$12$fj.jmlW9C9Y6TYnj8ZY2gOQS4K/JRjkJAOtLlRudBSEMYasurZ9ZC','rrossi@mailinator.com',NULL,NULL,NULL,NULL,'ES','[]',NULL,NULL,'2026-11-21 13:36:16',NULL,'2026-11-21 13:36:17',NULL,NULL,NULL,0,NULL,1,NULL),
(23,'vkarbasizaed','$2y$12$7bDWUukm3u9NeRCs05KwqOvzz6EOMkMyGHx6.Y2AFJE5b5Rrn6uea','vkarbasizaed@mailinator.com',NULL,NULL,NULL,NULL,'IR','[]',NULL,NULL,'2026-11-21 13:36:38',NULL,'2026-11-21 13:36:39',NULL,NULL,NULL,0,NULL,1,NULL),
(24,'vwilliamson','$2y$12$tFxQbDTSM4tSdcPJ3hC82.77YegmhHFtGGo9FIBmNe44IFYRNtcvK','vwilliamson@mailinator.com',NULL,NULL,NULL,NULL,'CA','[]',NULL,NULL,'2026-11-21 13:37:00',NULL,'2026-11-21 13:37:00',NULL,NULL,NULL,0,NULL,1,NULL),
(25,'zwoods','$2y$12$aRiJe9XslOXNo9keRO5zduIwKobCoCFCsXvJXGdcqk0z5FFqK0i/K','zwoods@mailinator.com',NULL,NULL,NULL,NULL,'US','[]',NULL,NULL,'2026-11-21 13:37:22',NULL,'2026-11-21 13:37:22',NULL,NULL,NULL,0,NULL,1,NULL);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `variant_groups`
--

DROP TABLE IF EXISTS `variant_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `variant_groups` (
  `variant_group_id` bigint(20) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`variant_group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `variant_groups`
--

LOCK TABLES `variant_groups` WRITE;
/*!40000 ALTER TABLE `variant_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `variant_groups` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='Describes the installation and upgrade version history for the application and all installed plugins.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `versions`
--

LOCK TABLES `versions` WRITE;
/*!40000 ALTER TABLE `versions` DISABLE KEYS */;
INSERT INTO `versions` VALUES
(1,1,0,0,0,'2026-11-21 13:26:13',1,'plugins.metadata','dc11','',0,0),
(2,1,0,0,0,'2026-11-21 13:26:13',1,'plugins.blocks','languageToggle','LanguageToggleBlockPlugin',1,0),
(3,1,0,1,0,'2026-11-21 13:26:13',1,'plugins.blocks','browse','BrowseBlockPlugin',1,0),
(4,1,0,0,0,'2026-11-21 13:26:13',1,'plugins.blocks','developedBy','DevelopedByBlockPlugin',1,0),
(5,1,2,0,0,'2026-11-21 13:26:13',1,'plugins.generic','customBlockManager','CustomBlockManagerPlugin',1,0),
(6,1,0,0,0,'2026-11-21 13:26:13',1,'plugins.generic','citationStyleLanguage','CitationStyleLanguagePlugin',1,0),
(7,1,0,0,0,'2026-11-21 13:26:13',1,'plugins.generic','tinymce','TinyMCEPlugin',1,0),
(8,1,1,0,0,'2026-11-21 13:26:13',1,'plugins.generic','googleScholar','GoogleScholarPlugin',1,0),
(9,2,2,0,0,'2026-11-21 13:26:13',1,'plugins.generic','crossref','',0,0),
(10,1,0,0,0,'2026-11-21 13:26:13',1,'plugins.generic','webFeed','WebFeedPlugin',1,0),
(11,1,0,0,0,'2026-11-21 13:26:13',1,'plugins.generic','usageEvent','',0,0),
(12,1,0,0,0,'2026-11-21 13:26:13',1,'plugins.generic','googleAnalytics','GoogleAnalyticsPlugin',1,0),
(13,1,0,1,0,'2026-11-21 13:26:13',1,'plugins.generic','pdfJsViewer','PdfJsViewerPlugin',1,0),
(14,1,0,0,0,'2026-11-21 13:26:13',1,'plugins.importexport','native','',0,0),
(15,1,0,0,0,'2026-11-21 13:26:13',1,'plugins.oaiMetadataFormats','dc','',0,0),
(16,1,0,0,0,'2026-11-21 13:26:13',1,'plugins.themes','default','DefaultThemePlugin',1,0),
(17,3,6,0,0,'2026-11-21 13:26:11',1,'core','ops','',0,1);
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

-- Dump completed on 2026-11-21 13:37:41
