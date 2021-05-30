-- MySQL dump 10.13  Distrib 5.5.45, for Win64 (x86)
--
-- Host: localhost    Database: db_rouen
-- ------------------------------------------------------
-- Server version	5.5.45

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
-- Table structure for table `client_products`
--

DROP TABLE IF EXISTS `client_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `client_products` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `client_id` bigint(20) unsigned NOT NULL,
  `product_id` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `client_product-unique` (`client_id`,`product_id`),
  KEY `client_products_product_id_foreign` (`product_id`),
  CONSTRAINT `client_products_client_id_foreign` FOREIGN KEY (`client_id`) REFERENCES `clients` (`id`),
  CONSTRAINT `client_products_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `client_products`
--

LOCK TABLES `client_products` WRITE;
/*!40000 ALTER TABLE `client_products` DISABLE KEYS */;
/*!40000 ALTER TABLE `client_products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clients`
--

DROP TABLE IF EXISTS `clients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `clients` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `address` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `contact` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `superviser_id` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `clients_superviser_id_foreign` (`superviser_id`),
  CONSTRAINT `clients_superviser_id_foreign` FOREIGN KEY (`superviser_id`) REFERENCES `suppliers` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clients`
--

LOCK TABLES `clients` WRITE;
/*!40000 ALTER TABLE `clients` DISABLE KEYS */;
/*!40000 ALTER TABLE `clients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `failed_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `connection` text COLLATE utf8_unicode_ci NOT NULL,
  `queue` text COLLATE utf8_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `failed_jobs`
--

LOCK TABLES `failed_jobs` WRITE;
/*!40000 ALTER TABLE `failed_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `failed_jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'2014_10_12_000000_create_users_table',1),(2,'2014_10_12_100000_create_password_resets_table',1),(3,'2019_08_19_000000_create_failed_jobs_table',1),(4,'2021_04_22_102455_create_suppliers_table',1),(5,'2021_04_22_134510_create_supervisers_table',1),(6,'2021_04_22_140725_create_teams_table',1),(7,'2021_04_22_152323_create_team_members_table',1),(8,'2021_04_28_100240_create_products_table',1),(9,'2021_04_29_080248_create_stocks_table',1),(10,'2021_04_29_102842_create_mouvments_table',1),(11,'2021_05_16_124935_create_clients_table',1),(12,'2021_05_16_151218_create_client_products_table',1);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mouvments`
--

DROP TABLE IF EXISTS `mouvments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mouvments` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `action` enum('IN','OUT') COLLATE utf8_unicode_ci NOT NULL,
  `product_id` bigint(20) unsigned NOT NULL,
  `quantity` int(11) NOT NULL,
  `note` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `team_member_id` bigint(20) unsigned DEFAULT NULL,
  `user_id` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mouvments_product_id_foreign` (`product_id`),
  KEY `mouvments_team_member_id_foreign` (`team_member_id`),
  KEY `mouvments_user_id_foreign` (`user_id`),
  CONSTRAINT `mouvments_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`),
  CONSTRAINT `mouvments_team_member_id_foreign` FOREIGN KEY (`team_member_id`) REFERENCES `team_members` (`id`),
  CONSTRAINT `mouvments_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mouvments`
--

LOCK TABLES `mouvments` WRITE;
/*!40000 ALTER TABLE `mouvments` DISABLE KEYS */;
INSERT INTO `mouvments` VALUES (1,'IN',4,2,NULL,NULL,1,'2021-05-27 09:10:07','2021-05-27 09:10:07'),(2,'OUT',4,2,'',2,1,'2021-05-27 09:27:24','2021-05-27 09:27:24'),(3,'IN',3,10,NULL,NULL,1,'2021-05-27 09:47:32','2021-05-27 09:47:32'),(4,'IN',3,20,NULL,NULL,1,'2021-05-27 09:48:08','2021-05-27 09:48:08'),(5,'IN',4,15,NULL,NULL,1,'2021-05-27 09:48:09','2021-05-27 09:48:09'),(6,'OUT',3,2,'',2,1,'2021-05-27 09:48:53','2021-05-27 09:48:53'),(7,'OUT',4,1,'',2,1,'2021-05-27 09:48:53','2021-05-27 09:48:53'),(8,'OUT',3,1,'',2,1,'2021-05-27 11:26:16','2021-05-27 11:26:16'),(9,'OUT',4,0,'',2,1,'2021-05-27 11:26:16','2021-05-27 11:26:16'),(10,'OUT',3,1,'',2,1,'2021-05-28 08:51:15','2021-05-28 08:51:15');
/*!40000 ALTER TABLE `mouvments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_resets`
--

LOCK TABLES `password_resets` WRITE;
/*!40000 ALTER TABLE `password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_resets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `products` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `reference` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `brand` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `alert` int(11) NOT NULL,
  `supplier_id` bigint(20) unsigned DEFAULT NULL,
  `price` double NOT NULL,
  `service` enum('Menuiserie','Peinture','Sol','MultiService') COLLATE utf8_unicode_ci NOT NULL,
  `nature` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `unit` enum('L','mL','kg','rlx','pcs','m2','tine','rouleau') COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `products_reference_unique` (`reference`),
  KEY `products_supplier_id_foreign` (`supplier_id`),
  CONSTRAINT `products_supplier_id_foreign` FOREIGN KEY (`supplier_id`) REFERENCES `suppliers` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=131 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (2,'A-0030-Z','Meuble ├®vier Liberty',NULL,1,NULL,48.77,'MultiService','Meubles','pcs','2021-05-27 08:46:45','2021-05-27 08:46:45'),(3,'A-0040-Z','Aquaryl Satin 16l','AQUARYL',8,1,4,'Peinture','Meubles','tine','2021-05-27 08:47:29','2021-05-27 11:29:46'),(4,'A-0050-Z','Aquaryl Mat 16l','AQUARYL',1,NULL,3.8,'Peinture','Peinture','tine','2021-05-27 08:48:15','2021-05-27 08:48:15'),(5,'25206013','TARKETT Habitat','Osca',8,4,7.09,'Sol','Linos','m2','2021-05-27 11:36:27','2021-05-27 11:36:27'),(6,'25213008','TARKETT Habitat Genius','Osca',8,4,10.18,'Sol','Linos','m2','2021-05-27 14:11:26','2021-05-27 14:11:26'),(7,'25212005','TARKETT Habitat Genius SS4','Osca',8,4,10.18,'Sol','Linos','m2','2021-05-27 14:13:52','2021-05-27 14:13:52'),(8,'123','TARKETT Lame','Seigneurie',8,5,10,'Sol','Linos','m2','2021-05-28 05:08:55','2021-05-28 05:08:55'),(9,'1234','TX Habitat Trend OAK','Seigneurie',8,5,7.2,'Sol','Linos','m2','2021-05-28 05:16:12','2021-05-28 05:16:12'),(10,'12345','TX Habitat Kiruma','Seigneurie',8,5,7.2,'Sol','Linos','m2','2021-05-28 05:18:30','2021-05-28 05:20:47'),(11,'3wsm12','ALLURA DECIBEL 0.35','Osca',8,4,13.75,'Sol','Linos','m2','2021-05-28 05:21:48','2021-05-28 05:21:48'),(12,'123456','ARDASOL','Osca',8,4,7.95,'Sol','Linos','m2','2021-05-28 05:22:28','2021-05-28 05:22:28'),(13,'1234567','ARDASOL Fibr├®','Osca',8,4,23,'Sol','Linos','m2','2021-05-28 05:24:00','2021-05-28 05:24:00'),(14,'25128501','ACCENT EXCELLENCE','Osca',8,4,18.59,'Sol','Linos','m2','2021-05-28 05:24:55','2021-05-28 05:24:55'),(15,'25133501','TX EXCELLENCE','Osca',8,4,18.59,'Sol','Linos','m2','2021-05-28 05:25:36','2021-05-28 05:25:36'),(16,'01','TASSEAU',NULL,8,6,1.48,'Menuiserie','Bois','pcs','2021-05-28 05:26:47','2021-05-28 05:26:47'),(17,'012','PLINTHE 70 Sapin',NULL,8,6,0.6,'Menuiserie','Bois','mL','2021-05-28 05:28:32','2021-05-28 05:28:32'),(18,'0123','PLINTHE 110 Sapin',NULL,8,6,1.29,'Menuiserie','Bois','mL','2021-05-28 05:29:21','2021-05-28 05:29:21'),(19,'01234','CHAMPLAT 6X35',NULL,8,6,0.56,'Menuiserie','Bois','mL','2021-05-28 05:30:21','2021-05-28 05:30:21'),(20,'012345','BAGUETTE Angle 20X20',NULL,8,6,1.33,'Menuiserie','Bois','pcs','2021-05-28 05:31:57','2021-05-28 05:31:57'),(21,'0123456','BAGUETTE Angle 35X35',NULL,8,6,2.26,'Menuiserie','Bois','pcs','2021-05-28 05:32:52','2021-05-28 05:32:52'),(22,'01234567','BA 13 Standard',NULL,8,6,2.12,'Menuiserie','Bois','m2','2021-05-28 05:34:04','2021-05-28 05:34:04'),(23,'012345678','PANNEAU OSB 12mm 3.25*1.25',NULL,8,6,4.42,'Menuiserie','Panneaux','m2','2021-05-28 05:36:25','2021-05-28 05:36:25'),(24,'0123456789','PANNEAU Contreplaque 10mm 2.5*1.22',NULL,8,6,11.41,'Menuiserie','Panneaux','m2','2021-05-28 05:45:50','2021-05-28 05:45:50'),(25,'23','PANNEAU CP15',NULL,8,6,15.16,'Menuiserie','Panneaux','m2','2021-05-28 05:46:49','2021-05-28 05:46:49'),(26,'234','PANNEAU M├®dium 10mm',NULL,8,6,6.04,'Menuiserie','Panneaux','m2','2021-05-28 06:19:02','2021-05-28 06:19:02'),(27,'2345','PANNEAU MDF 16mm Blanc 2.44*1.22',NULL,8,6,7.84,'Menuiserie','Panneaux','m2','2021-05-28 06:20:06','2021-05-28 06:20:06'),(28,'23456','PANNEAU M├®dium 18 mm',NULL,8,6,8.78,'Menuiserie','Panneaux','m2','2021-05-28 06:20:58','2021-05-28 06:20:58'),(29,'930','HUISSERIE 80',NULL,8,6,110.44,'Menuiserie','Dalles','pcs','2021-05-28 06:22:51','2021-05-28 06:22:51'),(30,'Gypton Quatro 20','DALLE Plafond 600*600',NULL,8,7,17.86,'Menuiserie','Dalles','m2','2021-05-28 06:23:40','2021-05-28 06:23:40'),(31,'gorteya','DALLE Plafond 600*600',NULL,8,7,7.57,'Menuiserie','Dalles','m2','2021-05-28 06:24:14','2021-05-28 06:24:14'),(32,'Gypton Quatro 50','DALLE Plafond 600*600',NULL,8,7,22.54,'Menuiserie','Dalles','m2','2021-05-28 06:24:50','2021-05-28 06:24:50'),(33,'eklor','DALLE Plafond 600*600',NULL,8,7,7.08,'Menuiserie','Dalles','m2','2021-05-28 06:25:41','2021-05-28 06:25:41'),(34,'HOPE-CLE','BEQUILLE',NULL,8,8,9.7,'Menuiserie','Serrures','pcs','2021-05-28 10:40:15','2021-05-28 10:40:15'),(35,'CLE I AXE50','Serrure axe 50',NULL,8,NULL,6.87,'Menuiserie','Serrures','pcs','2021-05-28 10:43:50','2021-05-28 10:43:50'),(36,'CLE I AXE40','Serrure axe 40',NULL,8,NULL,6.87,'Menuiserie','Serrures','pcs','2021-05-28 10:44:28','2021-05-28 10:44:28'),(37,'S├®rie 113.184','Ferme porte',NULL,8,8,39.78,'Menuiserie','Serrures','pcs','2021-05-28 10:45:13','2021-05-28 10:45:13'),(38,'98211.2','Brosse Rechampir n┬░2','Osca',8,4,2.29,'Peinture','Brosses','pcs','2021-05-28 10:48:35','2021-05-28 10:48:35'),(39,'98211.4','Brosse Rechampir n┬░4','Osca',8,4,2.78,'Peinture','Brosses','pcs','2021-05-28 10:50:45','2021-05-28 10:50:45'),(40,'98211.6','Brosse Rechampir n┬░6','Osca',8,4,3.59,'Peinture','Brosses','pcs','2021-05-28 10:51:30','2021-05-28 10:51:30'),(41,'98211.8','Brosse Rechampir n┬░8','Osca',8,4,4.44,'Peinture','Brosses','pcs','2021-05-28 10:52:12','2021-05-28 10:52:12'),(42,'98311.25','Brosse Radiateur 25','Osca',8,4,1.43,'Peinture','Brosses','pcs','2021-05-28 10:53:43','2021-05-28 10:53:43'),(43,'98311.35','Brosse Radiateur 35','Osca',8,4,1.68,'Peinture','Brosses','pcs','2021-05-28 11:01:16','2021-05-28 11:01:16'),(44,'98311.45','Brosse Radiateur 45','Osca',8,4,2.24,'Peinture','Brosses','pcs','2021-05-28 11:02:57','2021-05-28 11:02:57'),(45,'33132564','Meuble Evier Liberty',NULL,8,1,48.77,'MultiService','Meubles','pcs','2021-05-28 12:15:12','2021-05-28 12:15:12'),(46,'33213216','Evier Inox',NULL,8,1,46.87,'MultiService','Eviers','pcs','2021-05-28 12:16:32','2021-05-28 12:16:32'),(47,'33201179','Evier R├®sine',NULL,8,1,167,'MultiService','Eviers','pcs','2021-05-28 12:18:09','2021-05-28 12:18:09'),(48,'D1160AA','Mitigeur','Porcher',8,1,60.22,'MultiService','Robinets','pcs','2021-05-28 12:19:58','2021-05-28 12:19:58'),(49,'39100029','Mitigeur Lavabo',NULL,8,1,51.98,'MultiService','Robinets','pcs','2021-05-28 12:21:10','2021-05-28 12:21:10'),(50,'39130059','Mitigeur Baignoire',NULL,8,1,18.93,'MultiService','Robinets','pcs','2021-05-28 12:21:58','2021-05-28 12:21:58'),(51,'SerNor1','Serrure Normale',NULL,8,2,5.52,'MultiService','Serrures','pcs','2021-05-28 12:22:33','2021-05-28 12:22:33'),(52,'SerCond1','Serrure ├á Condamnation',NULL,8,2,5.67,'MultiService','Serrures','pcs','2021-05-28 12:23:11','2021-05-28 12:23:11'),(53,'39130018','Barre de douche avec douchette',NULL,8,1,13.74,'MultiService','Garnitures/outillages','pcs','2021-05-28 12:26:25','2021-05-28 12:26:25'),(54,'BequNor1','B├®quille Normale',NULL,8,2,6.99,'MultiService','Garnitures/outillages','pcs','2021-05-28 12:27:11','2021-05-28 12:27:11'),(55,'BequCond1','B├®quille ├á Condamnation',NULL,8,2,8.16,'MultiService','Garnitures/outillages','pcs','2021-05-28 12:28:00','2021-05-28 12:28:00'),(56,'35630649','Douchette',NULL,8,1,10.62,'MultiService','Garnitures/outillages','pcs','2021-05-28 12:28:49','2021-05-28 12:28:49'),(57,'21130158','Colonne Lavabo',NULL,8,1,3.26,'MultiService','Garnitures/outillages','pcs','2021-05-28 12:30:11','2021-05-28 12:30:11'),(58,'33290123','Siphon',NULL,8,1,3.27,'MultiService','Garnitures/outillages','pcs','2021-05-28 12:30:45','2021-05-28 12:30:45'),(59,'98RO92560','Lame Scrapeur',NULL,8,4,6.9,'Peinture','Lames','pcs','2021-05-28 12:32:59','2021-05-28 12:32:59'),(60,'98OPLAMCOC4494','Lame Croche',NULL,8,4,3.59,'Peinture','Lames','pcs','2021-05-28 12:33:52','2021-05-28 12:33:52'),(61,'989567.0199','Lame Cutter 18mm',NULL,8,4,0.66,'Peinture','Lames','pcs','2021-05-28 12:34:46','2021-05-28 12:34:46'),(62,'989567.0299','Lame Cutter 9mm',NULL,8,4,2.75,'Peinture','Lames','pcs','2021-05-28 12:35:33','2021-05-28 12:35:33'),(63,'98OPLAMTRAP4492','Lame Droite',NULL,8,4,2.99,'Peinture','Lames','pcs','2021-05-28 12:36:29','2021-05-28 12:36:29'),(64,'98RO94315','Scrapeur',NULL,8,4,16.71,'Peinture','Lames','pcs','2021-05-28 12:58:21','2021-05-28 12:58:21'),(65,'98JFLMPOL30','Polyane en 30 microns 25*2',NULL,8,4,5.17,'Peinture','Trucs au sol','m2','2021-05-28 13:07:05','2021-05-28 13:07:05'),(66,'989426.1010','B├óche Feutre Absorbant',NULL,8,4,5.99,'Peinture','Trucs au sol','m2','2021-05-28 13:08:07','2021-05-28 13:08:07'),(67,'984600','Masquage Lisse en 50mm',NULL,8,4,1.36,'Peinture','Lissages','pcs','2021-05-28 13:09:17','2021-05-28 13:09:17'),(68,'98TEBO050','Masquage Orange 50mm',NULL,8,4,1.82,'Peinture','Lissages','pcs','2021-05-28 13:10:14','2021-05-28 13:10:14'),(69,'92SEA3111344','Abrasif Cale Grain 100',NULL,8,4,3.65,'Peinture','Lissages','pcs','2021-05-28 13:11:08','2021-05-28 13:11:08'),(70,'92SEA311343','Abrasif Cale grain 120',NULL,8,4,3.65,'Peinture','Lissages','pcs','2021-05-28 13:12:13','2021-05-28 13:12:13'),(71,'92SEA311345','Abrasif Cale Grain 80/60/40',NULL,8,4,3.65,'Peinture','Lissages','pcs','2021-05-28 13:12:57','2021-05-28 13:12:57'),(72,'98RO91400','Araseur',NULL,8,4,12.84,'Peinture','Lissages','pcs','2021-05-28 13:13:59','2021-05-28 13:13:59'),(73,'98W103','Spatule ├á Maroufler',NULL,8,4,1.47,'Peinture','Lissages','pcs','2021-05-28 13:14:53','2021-05-28 13:14:53'),(74,'CartNeo1','Cartouche N├®opr├¿ne',NULL,8,4,3.45,'Peinture','Enduits / Fixateurs','pcs','2021-05-28 13:18:04','2021-05-28 13:18:04'),(75,'98ACRS00001','Cartouche Acrylique Blanc',NULL,8,4,1.01,'Peinture','Enduits / Fixateurs','pcs','2021-05-28 13:19:10','2021-05-28 13:19:10'),(76,'93SIL50Blanc','Cartouche Silicone Blanc',NULL,8,4,4.12,'Peinture','Enduits / Fixateurs','pcs','2021-05-28 13:20:23','2021-05-28 13:20:23'),(77,'9827.790','MICROTEX 250mm',NULL,8,4,5.18,'Peinture','Rouleaux','pcs','2021-05-28 13:23:43','2021-05-28 13:23:43'),(78,'9825.790','MICROTEX 180mm',NULL,8,4,3.75,'Peinture','Rouleaux','pcs','2021-05-28 13:24:26','2021-05-28 13:24:26'),(79,'9850.790','MICROTEX 100mm',NULL,8,4,0.83,'Peinture','Rouleaux','pcs','2021-05-28 13:25:16','2021-05-28 13:25:16'),(80,'9827.695','MICROSTAR 250mm',NULL,8,4,4.27,'Peinture','Rouleaux','pcs','2021-05-28 13:26:07','2021-05-28 13:26:07'),(81,'9825.680','MICROSTAR 180mm',NULL,8,4,4.42,'Peinture','Rouleaux','pcs','2021-05-28 13:26:52','2021-05-28 13:26:52'),(82,'9850.680','MICROSTAR 100mm',NULL,8,4,0.77,'Peinture','Rouleaux','pcs','2021-05-28 13:27:41','2021-05-28 13:27:41'),(83,'9827.170','AQUASTAR 250mm',NULL,8,4,3.91,'Peinture','Rouleaux','pcs','2021-05-28 13:29:24','2021-05-28 13:29:24'),(84,'9825.070','ROTRACRYL 180mm',NULL,8,4,2.64,'Peinture','Rouleaux','pcs','2021-05-28 13:30:23','2021-05-28 13:30:23'),(85,'9850.780','ROTRACRYL 100mm',NULL,8,4,0.4,'Peinture','Rouleaux','pcs','2021-05-28 13:31:28','2021-05-28 13:31:28'),(86,'9827.320','RAYE Jaune 250mm',NULL,8,4,2.86,'Peinture','Rouleaux','pcs','2021-05-28 13:32:15','2021-05-28 13:32:15'),(87,'9825.320','RAYE Jaune 180mm',NULL,8,4,2.17,'Peinture','Rouleaux','pcs','2021-05-28 13:32:58','2021-05-28 13:32:58'),(88,'9850.320','RAYE Jaune 100mm',NULL,8,4,0.47,'Peinture','Rouleaux','pcs','2021-05-28 13:33:43','2021-05-28 13:33:43'),(89,'27910','ROTAFLOR 250mm',NULL,8,4,4.98,'Peinture','Rouleaux','pcs','2021-05-28 13:34:28','2021-05-28 13:34:28'),(90,'25900','ROTAFLOR 180mm',NULL,8,4,3.97,'Peinture','Rouleaux','pcs','2021-05-28 13:35:13','2021-05-28 13:35:13'),(91,'40901','ROTAFLOR 100mm',NULL,8,4,2.12,'Peinture','Rouleaux','pcs','2021-05-28 13:35:54','2021-05-28 13:35:54'),(92,'K803.61.00','Monture 250mm',NULL,8,4,1.49,'Peinture','Rouleaux','pcs','2021-05-28 13:36:56','2021-05-28 13:36:56'),(93,'K803.63.00','Monture 180mm',NULL,8,4,1.02,'Peinture','Rouleaux','pcs','2021-05-28 13:38:04','2021-05-28 13:38:04'),(94,'K833.00','Monture Pate de Lapin',NULL,8,4,0.68,'Peinture','Rouleaux','pcs','2021-05-28 13:38:42','2021-05-28 13:38:42'),(95,'93C007420','Colle Toile de Verre TDV 146',NULL,8,4,0.66,'Peinture','Colle','kg','2021-05-28 13:40:20','2021-05-28 13:40:20'),(96,'9330603750','Colle Sol PVC Moquette MIPLAFIX 300',NULL,8,4,3.52,'Peinture','Colle','kg','2021-05-28 13:41:23','2021-05-28 13:41:23'),(97,'ColPOISS','Colle Poissante N├®ogliss',NULL,8,4,6.6,'Peinture','Colle','kg','2021-05-28 13:42:09','2021-05-28 13:42:09'),(98,'80A2210910023','HEVAQUAPRIM 3L',NULL,8,4,10.8,'Peinture','Enduits / Fixateurs','L','2021-05-28 13:43:14','2021-05-28 13:43:14'),(99,'HEVAPRIM15','HEVAQUAPRIM 15L',NULL,8,4,5.73,'Peinture','Enduits / Fixateurs','L','2021-05-28 13:44:45','2021-05-28 13:44:45'),(100,'Rebouch5','3H Reboucheur 5kg',NULL,8,4,2.7,'Peinture','Enduits / Fixateurs','kg','2021-05-28 13:45:40','2021-05-28 13:45:40'),(101,'97TOUPERETRELBO15','Enduit Reboucheur TOUPERET 15kg','TOUPERET',8,4,2.55,'Peinture','Enduits / Fixateurs','kg','2021-05-28 13:46:56','2021-05-28 13:46:56'),(102,'94SCALDECOLPA5','DECOL Papiers Peint 5l',NULL,8,4,4.42,'Peinture','Enduits / Fixateurs','L','2021-05-28 13:47:49','2021-05-28 13:47:49'),(103,'96T1009C','Toile de Verre Tresse',NULL,8,4,1.27,'Peinture','Toiles','mL','2021-05-28 13:49:29','2021-05-28 13:49:29'),(104,'96T1112C','Toile de Verre Standard Pr├®peinte',NULL,8,4,50.6,'Peinture','Toiles','rlx','2021-05-28 13:52:14','2021-05-28 13:52:14'),(105,'96T1112CE','Toile de Verre Standard Pr├®peinte pr├® encoll├®e',NULL,8,4,1.69,'Peinture','Toiles','mL','2021-05-28 13:54:46','2021-05-28 13:54:46'),(106,'96T1009CE','Toile Tresse Pr├®encoll├® Pre├½nte',NULL,8,4,1.89,'Peinture','Toiles','mL','2021-05-28 13:55:46','2021-05-28 13:55:46'),(107,'MC60960221','Tapeten Wallcoverings Gris *2rlx',NULL,8,5,40,'Peinture','Papiers Peints','rlx','2021-05-28 13:57:26','2021-05-28 13:57:26'),(108,'5936_65','Tapeten Wallcoverings Blanc *2rlx',NULL,8,5,40,'Peinture','Papiers Peints','rlx','2021-05-28 13:58:26','2021-05-28 13:58:26'),(109,'5936_64','Tapeten Wallcoverings Marron *2rlx',NULL,8,5,40,'Peinture','Papiers Peints','rlx','2021-05-28 13:59:24','2021-05-28 13:59:24'),(110,'CV200C','Batir├®no Fibre de cellulose et polyest├¿re',NULL,8,5,40,'Peinture','Papiers Peints','rlx','2021-05-28 14:00:24','2021-05-28 14:00:24'),(111,'GO 593634','MONTECOLINO',NULL,8,5,40,'Peinture','Intisse','rlx','2021-05-28 14:03:04','2021-05-28 14:03:04'),(112,'GO 593665','MONTECOLINO',NULL,8,5,40,'Peinture','Intisse','rlx','2021-05-28 14:03:50','2021-05-28 14:03:50'),(113,'GO 593666','MONTECOLINO',NULL,8,5,40,'Peinture','Intisse','rlx','2021-05-28 14:04:33','2021-05-28 14:04:33'),(114,'20266','MONTECOLINO Gris',NULL,8,5,39.95,'Peinture','Intisse','rlx','2021-05-28 14:05:16','2021-05-28 14:05:16'),(115,'GO 20261','MONTECOLINO Beige clair',NULL,8,5,39.95,'Peinture','Intisse','rlx','2021-05-28 14:07:03','2021-05-28 14:07:03'),(116,'GO 20263','MONTECOLINO Marron',NULL,8,5,39.95,'Peinture','Intisse','rlx','2021-05-28 14:07:38','2021-05-28 14:07:38'),(117,'20171052','Aquaryl Satin 16l',NULL,8,3,4,'Peinture','Peinture','L','2021-05-28 14:10:20','2021-05-28 14:10:20'),(118,'20151084','Aquaryl Mat 16l',NULL,8,3,3.8,'Peinture','Peinture','L','2021-05-28 14:11:03','2021-05-28 14:11:03'),(119,'80A2253910035','Aquaryl Velour 16l',NULL,8,3,3.54,'Peinture','Peinture','L','2021-05-28 14:11:54','2021-05-28 14:11:54'),(120,'UNBAQ3','Unistop Bois Eau 3l',NULL,8,3,12.96,'Peinture','Peinture','L','2021-05-28 14:12:34','2021-05-28 14:12:34'),(121,'Unsevo3','Unistop Bois Evolution 3l',NULL,8,3,12.96,'Peinture','Peinture','L','2021-05-28 14:13:19','2021-05-28 14:13:19'),(122,'Unsng16','Uniglis Satin 16l',NULL,8,3,6.97,'Peinture','Peinture','L','2021-05-28 14:14:05','2021-05-28 14:14:05'),(123,'2226','Nevada 20kg',NULL,8,3,6.1,'Peinture','Peinture','kg','2021-05-28 14:14:41','2021-05-28 14:14:41'),(124,'80A2257910035','Hevaquan Satin TV Blanc 15l',NULL,8,4,3.93,'Peinture','Peinture','L','2021-05-28 14:15:32','2021-05-28 14:15:32'),(125,'80A2394910045','Oscafixe ISO 15l',NULL,8,4,5.43,'Peinture','Peinture','L','2021-05-28 14:17:42','2021-05-28 14:17:42'),(126,'OASCABOIS','Osca Bois Satin 3l',NULL,8,4,9.37,'Peinture','Peinture','L','2021-05-28 14:18:22','2021-05-28 14:18:22'),(127,'80A1102910022','CIDPRIM ACP 3l',NULL,8,4,9.16,'Peinture','Peinture','L','2021-05-28 14:19:04','2021-05-28 14:19:04'),(128,'1584','HEVAQUA Velours 15l',NULL,8,4,3.65,'Peinture','Peinture','L','2021-05-28 14:19:42','2021-05-28 14:19:42'),(129,'1594','OSCACRYL Mat 15l',NULL,8,4,3.72,'Peinture','Peinture','L','2021-05-28 14:20:16','2021-05-28 14:20:16'),(130,'1564','Freitaccroche 3l',NULL,8,5,11.12,'Peinture','Peinture','L','2021-05-28 14:20:50','2021-05-28 14:20:50');
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stocks`
--

DROP TABLE IF EXISTS `stocks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stocks` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `product_id` bigint(20) unsigned NOT NULL,
  `value` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `stocks_product_id_unique` (`product_id`),
  CONSTRAINT `stocks_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=131 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stocks`
--

LOCK TABLES `stocks` WRITE;
/*!40000 ALTER TABLE `stocks` DISABLE KEYS */;
INSERT INTO `stocks` VALUES (2,2,0,'2021-05-27 08:46:45','2021-05-27 08:46:45'),(3,3,26,'2021-05-27 08:47:29','2021-05-28 08:51:15'),(4,4,14,'2021-05-27 08:48:15','2021-05-27 09:48:53'),(5,5,0,'2021-05-27 11:36:27','2021-05-27 11:36:27'),(6,6,0,'2021-05-27 14:11:26','2021-05-27 14:11:26'),(7,7,0,'2021-05-27 14:13:52','2021-05-27 14:13:52'),(8,8,0,'2021-05-28 05:08:55','2021-05-28 05:08:55'),(9,9,0,'2021-05-28 05:16:12','2021-05-28 05:16:12'),(10,10,0,'2021-05-28 05:18:30','2021-05-28 05:18:30'),(11,11,0,'2021-05-28 05:21:48','2021-05-28 05:21:48'),(12,12,0,'2021-05-28 05:22:28','2021-05-28 05:22:28'),(13,13,0,'2021-05-28 05:24:00','2021-05-28 05:24:00'),(14,14,0,'2021-05-28 05:24:55','2021-05-28 05:24:55'),(15,15,0,'2021-05-28 05:25:36','2021-05-28 05:25:36'),(16,16,0,'2021-05-28 05:26:47','2021-05-28 05:26:47'),(17,17,0,'2021-05-28 05:28:32','2021-05-28 05:28:32'),(18,18,0,'2021-05-28 05:29:21','2021-05-28 05:29:21'),(19,19,0,'2021-05-28 05:30:21','2021-05-28 05:30:21'),(20,20,0,'2021-05-28 05:31:57','2021-05-28 05:31:57'),(21,21,0,'2021-05-28 05:32:52','2021-05-28 05:32:52'),(22,22,0,'2021-05-28 05:34:04','2021-05-28 05:34:04'),(23,23,0,'2021-05-28 05:36:25','2021-05-28 05:36:25'),(24,24,0,'2021-05-28 05:45:50','2021-05-28 05:45:50'),(25,25,0,'2021-05-28 05:46:49','2021-05-28 05:46:49'),(26,26,0,'2021-05-28 06:19:02','2021-05-28 06:19:02'),(27,27,0,'2021-05-28 06:20:06','2021-05-28 06:20:06'),(28,28,0,'2021-05-28 06:20:58','2021-05-28 06:20:58'),(29,29,0,'2021-05-28 06:22:51','2021-05-28 06:22:51'),(30,30,0,'2021-05-28 06:23:40','2021-05-28 06:23:40'),(31,31,0,'2021-05-28 06:24:14','2021-05-28 06:24:14'),(32,32,0,'2021-05-28 06:24:50','2021-05-28 06:24:50'),(33,33,0,'2021-05-28 06:25:41','2021-05-28 06:25:41'),(34,34,0,'2021-05-28 10:40:15','2021-05-28 10:40:15'),(35,35,0,'2021-05-28 10:43:50','2021-05-28 10:43:50'),(36,36,0,'2021-05-28 10:44:28','2021-05-28 10:44:28'),(37,37,0,'2021-05-28 10:45:13','2021-05-28 10:45:13'),(38,38,0,'2021-05-28 10:48:35','2021-05-28 10:48:35'),(39,39,0,'2021-05-28 10:50:45','2021-05-28 10:50:45'),(40,40,0,'2021-05-28 10:51:30','2021-05-28 10:51:30'),(41,41,0,'2021-05-28 10:52:12','2021-05-28 10:52:12'),(42,42,0,'2021-05-28 10:53:43','2021-05-28 10:53:43'),(43,43,0,'2021-05-28 11:01:16','2021-05-28 11:01:16'),(44,44,0,'2021-05-28 11:02:57','2021-05-28 11:02:57'),(45,45,0,'2021-05-28 12:15:12','2021-05-28 12:15:12'),(46,46,0,'2021-05-28 12:16:32','2021-05-28 12:16:32'),(47,47,0,'2021-05-28 12:18:09','2021-05-28 12:18:09'),(48,48,0,'2021-05-28 12:19:58','2021-05-28 12:19:58'),(49,49,0,'2021-05-28 12:21:10','2021-05-28 12:21:10'),(50,50,0,'2021-05-28 12:21:58','2021-05-28 12:21:58'),(51,51,0,'2021-05-28 12:22:33','2021-05-28 12:22:33'),(52,52,0,'2021-05-28 12:23:11','2021-05-28 12:23:11'),(53,53,0,'2021-05-28 12:26:25','2021-05-28 12:26:25'),(54,54,0,'2021-05-28 12:27:11','2021-05-28 12:27:11'),(55,55,0,'2021-05-28 12:28:00','2021-05-28 12:28:00'),(56,56,0,'2021-05-28 12:28:49','2021-05-28 12:28:49'),(57,57,0,'2021-05-28 12:30:11','2021-05-28 12:30:11'),(58,58,0,'2021-05-28 12:30:45','2021-05-28 12:30:45'),(59,59,0,'2021-05-28 12:32:59','2021-05-28 12:32:59'),(60,60,0,'2021-05-28 12:33:52','2021-05-28 12:33:52'),(61,61,0,'2021-05-28 12:34:46','2021-05-28 12:34:46'),(62,62,0,'2021-05-28 12:35:33','2021-05-28 12:35:33'),(63,63,0,'2021-05-28 12:36:29','2021-05-28 12:36:29'),(64,64,0,'2021-05-28 12:58:21','2021-05-28 12:58:21'),(65,65,0,'2021-05-28 13:07:05','2021-05-28 13:07:05'),(66,66,0,'2021-05-28 13:08:07','2021-05-28 13:08:07'),(67,67,0,'2021-05-28 13:09:17','2021-05-28 13:09:17'),(68,68,0,'2021-05-28 13:10:14','2021-05-28 13:10:14'),(69,69,0,'2021-05-28 13:11:08','2021-05-28 13:11:08'),(70,70,0,'2021-05-28 13:12:13','2021-05-28 13:12:13'),(71,71,0,'2021-05-28 13:12:57','2021-05-28 13:12:57'),(72,72,0,'2021-05-28 13:13:59','2021-05-28 13:13:59'),(73,73,0,'2021-05-28 13:14:53','2021-05-28 13:14:53'),(74,74,0,'2021-05-28 13:18:04','2021-05-28 13:18:04'),(75,75,0,'2021-05-28 13:19:10','2021-05-28 13:19:10'),(76,76,0,'2021-05-28 13:20:23','2021-05-28 13:20:23'),(77,77,0,'2021-05-28 13:23:43','2021-05-28 13:23:43'),(78,78,0,'2021-05-28 13:24:26','2021-05-28 13:24:26'),(79,79,0,'2021-05-28 13:25:16','2021-05-28 13:25:16'),(80,80,0,'2021-05-28 13:26:07','2021-05-28 13:26:07'),(81,81,0,'2021-05-28 13:26:52','2021-05-28 13:26:52'),(82,82,0,'2021-05-28 13:27:41','2021-05-28 13:27:41'),(83,83,0,'2021-05-28 13:29:24','2021-05-28 13:29:24'),(84,84,0,'2021-05-28 13:30:23','2021-05-28 13:30:23'),(85,85,0,'2021-05-28 13:31:28','2021-05-28 13:31:28'),(86,86,0,'2021-05-28 13:32:15','2021-05-28 13:32:15'),(87,87,0,'2021-05-28 13:32:58','2021-05-28 13:32:58'),(88,88,0,'2021-05-28 13:33:43','2021-05-28 13:33:43'),(89,89,0,'2021-05-28 13:34:28','2021-05-28 13:34:28'),(90,90,0,'2021-05-28 13:35:13','2021-05-28 13:35:13'),(91,91,0,'2021-05-28 13:35:54','2021-05-28 13:35:54'),(92,92,0,'2021-05-28 13:36:56','2021-05-28 13:36:56'),(93,93,0,'2021-05-28 13:38:04','2021-05-28 13:38:04'),(94,94,0,'2021-05-28 13:38:42','2021-05-28 13:38:42'),(95,95,0,'2021-05-28 13:40:20','2021-05-28 13:40:20'),(96,96,0,'2021-05-28 13:41:23','2021-05-28 13:41:23'),(97,97,0,'2021-05-28 13:42:09','2021-05-28 13:42:09'),(98,98,0,'2021-05-28 13:43:14','2021-05-28 13:43:14'),(99,99,0,'2021-05-28 13:44:45','2021-05-28 13:44:45'),(100,100,0,'2021-05-28 13:45:40','2021-05-28 13:45:40'),(101,101,0,'2021-05-28 13:46:56','2021-05-28 13:46:56'),(102,102,0,'2021-05-28 13:47:50','2021-05-28 13:47:50'),(103,103,0,'2021-05-28 13:49:29','2021-05-28 13:49:29'),(104,104,0,'2021-05-28 13:52:14','2021-05-28 13:52:14'),(105,105,0,'2021-05-28 13:54:46','2021-05-28 13:54:46'),(106,106,0,'2021-05-28 13:55:46','2021-05-28 13:55:46'),(107,107,0,'2021-05-28 13:57:26','2021-05-28 13:57:26'),(108,108,0,'2021-05-28 13:58:26','2021-05-28 13:58:26'),(109,109,0,'2021-05-28 13:59:24','2021-05-28 13:59:24'),(110,110,0,'2021-05-28 14:00:24','2021-05-28 14:00:24'),(111,111,0,'2021-05-28 14:03:04','2021-05-28 14:03:04'),(112,112,0,'2021-05-28 14:03:50','2021-05-28 14:03:50'),(113,113,0,'2021-05-28 14:04:33','2021-05-28 14:04:33'),(114,114,0,'2021-05-28 14:05:16','2021-05-28 14:05:16'),(115,115,0,'2021-05-28 14:07:03','2021-05-28 14:07:03'),(116,116,0,'2021-05-28 14:07:38','2021-05-28 14:07:38'),(117,117,0,'2021-05-28 14:10:20','2021-05-28 14:10:20'),(118,118,0,'2021-05-28 14:11:03','2021-05-28 14:11:03'),(119,119,0,'2021-05-28 14:11:54','2021-05-28 14:11:54'),(120,120,0,'2021-05-28 14:12:34','2021-05-28 14:12:34'),(121,121,0,'2021-05-28 14:13:19','2021-05-28 14:13:19'),(122,122,0,'2021-05-28 14:14:05','2021-05-28 14:14:05'),(123,123,0,'2021-05-28 14:14:41','2021-05-28 14:14:41'),(124,124,0,'2021-05-28 14:15:32','2021-05-28 14:15:32'),(125,125,0,'2021-05-28 14:17:42','2021-05-28 14:17:42'),(126,126,0,'2021-05-28 14:18:22','2021-05-28 14:18:22'),(127,127,0,'2021-05-28 14:19:04','2021-05-28 14:19:04'),(128,128,0,'2021-05-28 14:19:42','2021-05-28 14:19:42'),(129,129,0,'2021-05-28 14:20:16','2021-05-28 14:20:16'),(130,130,0,'2021-05-28 14:20:50','2021-05-28 14:20:50');
/*!40000 ALTER TABLE `stocks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `supervisers`
--

DROP TABLE IF EXISTS `supervisers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `supervisers` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `firstname` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `lastname` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `contact` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `domain` enum('Menuiserie','Peinture','Sol','MultiService') COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `supervisers`
--

LOCK TABLES `supervisers` WRITE;
/*!40000 ALTER TABLE `supervisers` DISABLE KEYS */;
INSERT INTO `supervisers` VALUES (1,'C├®dric','LEROUX','06 79 45 25 47','MultiService','2021-05-27 08:44:56','2021-05-27 11:23:27'),(2,'Patrick','LENOIR','1234','Menuiserie','2021-05-27 11:23:47','2021-05-27 11:28:30'),(3,'Monika','FALEK','06 01 45 62 09','Peinture','2021-05-27 11:33:14','2021-05-27 11:33:14'),(4,'Abdenacer','BENYAHIA','06 52 49 55 93','Peinture','2021-05-27 11:35:04','2021-05-27 11:35:04');
/*!40000 ALTER TABLE `supervisers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `suppliers`
--

DROP TABLE IF EXISTS `suppliers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `suppliers` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `address` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `contact` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `suppliers`
--

LOCK TABLES `suppliers` WRITE;
/*!40000 ALTER TABLE `suppliers` DISABLE KEYS */;
INSERT INTO `suppliers` VALUES (1,'Mabille Tereva','Z.I Rue du Foss├® Roger\r\n76800 Saint Etienne du Rouvray','02 35 65 95 95','2021-05-27 09:38:31','2021-05-27 09:38:31'),(2,'Setin','33 Boulevard L├®nine, 76800 Saint-├ëtienne-du-Rouvray','02 32 80 35 35','2021-05-27 09:39:20','2021-05-27 09:39:20'),(3,'LDI couleurs diffusion','33 Route de Darn├®tal, 76000 Rouen','02 32 10 11 14','2021-05-27 09:40:02','2021-05-27 09:40:02'),(4,'Osca','110, rue des Fr├¿res Delattre 76140 PETIT QUEVILLY / 177, rue de la vall├®e 76600 LE HAVRE','02 35 72 68 04','2021-05-27 09:41:20','2021-05-27 09:41:20'),(5,'Seigneurie','30 Rue du Pr├® de la Bataille, 76000 Rouen','02 32 10 22 00','2021-05-27 09:42:13','2021-05-27 09:42:13'),(6,'Somedec','141 Rue des Martyrs de la R├®sistance, 76150 Maromme','02 35 75 61 02','2021-05-27 09:42:55','2021-05-27 09:42:55'),(7,'Litt','5 Avenue Emile Basly, 76120 Le Grand-Quevilly','02 35 36 00 21','2021-05-27 09:43:38','2021-05-27 09:43:38'),(8,'Legallais','Z.I. Est, Rue de la Grande ├ëpine Entree n┬░3, 76800 Saint-├ëtienne-du-Rouvray','02 31 23 42 34','2021-05-27 09:44:27','2021-05-27 09:44:27');
/*!40000 ALTER TABLE `suppliers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `team_members`
--

DROP TABLE IF EXISTS `team_members`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `team_members` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `firstname` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `lastname` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `reference` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `contact` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `team_id` bigint(20) unsigned DEFAULT NULL,
  `title` enum('CHIEF','OF') COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `team_members_reference_unique` (`reference`),
  KEY `team_members_team_id_foreign` (`team_id`),
  CONSTRAINT `team_members_team_id_foreign` FOREIGN KEY (`team_id`) REFERENCES `teams` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `team_members`
--

LOCK TABLES `team_members` WRITE;
/*!40000 ALTER TABLE `team_members` DISABLE KEYS */;
INSERT INTO `team_members` VALUES (2,'Noel','CESBRON','TM-CESB2','1234',1,'CHIEF','2021-05-27 08:43:09','2021-05-27 08:45:06'),(3,'Christphe','PETIT','TM-PETI3','1234',1,'OF','2021-05-27 08:44:13','2021-05-27 08:45:17');
/*!40000 ALTER TABLE `team_members` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teams`
--

DROP TABLE IF EXISTS `teams`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `teams` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `superviser_id` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `teams_superviser_id_foreign` (`superviser_id`),
  CONSTRAINT `teams_superviser_id_foreign` FOREIGN KEY (`superviser_id`) REFERENCES `supervisers` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teams`
--

LOCK TABLES `teams` WRITE;
/*!40000 ALTER TABLE `teams` DISABLE KEYS */;
INSERT INTO `teams` VALUES (1,'LEROUX - CESBRON',1,'2021-05-27 08:45:06','2021-05-27 08:45:06');
/*!40000 ALTER TABLE `teams` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Maurel','zandamaurel@abbei.org','2021-05-27 06:38:14','$2y$10$kFLaBDN1J8vPRyTh1jRlW.CLqaXR8vtg570612S.Kv6NGNS6qVSj2','YcyM8IiAHG','2021-05-27 06:38:14','2021-05-27 06:38:14');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-05-31  0:55:18
