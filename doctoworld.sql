-- MySQL dump 10.13  Distrib 8.0.22, for osx10.16 (x86_64)
--
-- Host: localhost    Database: doctoworld
-- ------------------------------------------------------
-- Server version	8.0.22

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
-- Table structure for table `activity_logs`
--

DROP TABLE IF EXISTS `activity_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `activity_logs` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `device_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `device_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `activity_logs_user_id_foreign` (`user_id`),
  CONSTRAINT `activity_logs_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `activity_logs`
--

LOCK TABLES `activity_logs` WRITE;
/*!40000 ALTER TABLE `activity_logs` DISABLE KEYS */;
/*!40000 ALTER TABLE `activity_logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `appointments`
--

DROP TABLE IF EXISTS `appointments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `appointments` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `appointee_id` int NOT NULL,
  `appointee_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `appointer_id` int DEFAULT NULL,
  `appointer_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta` json DEFAULT NULL,
  `amount` decimal(9,2) NOT NULL DEFAULT '0.00',
  `amount_meta` json DEFAULT NULL,
  `address` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address_meta` json DEFAULT NULL,
  `longitude` decimal(15,7) NOT NULL DEFAULT '0.0000000',
  `latitude` decimal(15,7) NOT NULL DEFAULT '0.0000000',
  `date` date NOT NULL,
  `time_from` time NOT NULL,
  `time_to` time NOT NULL,
  `is_guest` tinyint(1) NOT NULL DEFAULT '0',
  `customer_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_mobile` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `appointments`
--

LOCK TABLES `appointments` WRITE;
/*!40000 ALTER TABLE `appointments` DISABLE KEYS */;
/*!40000 ALTER TABLE `appointments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `banners`
--

DROP TABLE IF EXISTS `banners`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `banners` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `title` json NOT NULL,
  `meta` json DEFAULT NULL,
  `sort_order` int NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `banners`
--

LOCK TABLES `banners` WRITE;
/*!40000 ALTER TABLE `banners` DISABLE KEYS */;
INSERT INTO `banners` VALUES (1,'{\"en\": \"Lorem ipsum dolor sit amet, consectetur adipiscing elit.\"}','{\"scope\": \"ecommerce\"}',1,'2021-07-08 20:56:12','2021-07-08 20:56:12'),(2,'{\"en\": \"Lorem ipsum dolor sit amet, consectetur adipiscing elit.\"}','{\"scope\": \"ecommerce\"}',2,'2021-07-08 20:56:12','2021-07-08 20:56:12'),(3,'{\"en\": \"Lorem ipsum dolor sit amet, consectetur adipiscing elit.\"}','{\"scope\": \"doctor\"}',1,'2021-07-08 20:56:14','2021-07-08 20:56:14'),(4,'{\"en\": \"Lorem ipsum dolor sit amet, consectetur adipiscing elit.\"}','{\"scope\": \"doctor\"}',2,'2021-07-08 20:56:14','2021-07-08 20:56:14'),(5,'{\"en\": \"Lorem ipsum dolor sit amet, consectetur adipiscing elit.\"}','{\"scope\": \"hospital\"}',1,'2021-07-08 20:56:14','2021-07-08 20:56:14'),(6,'{\"en\": \"Lorem ipsum dolor sit amet, consectetur adipiscing elit.\"}','{\"scope\": \"hospital\"}',2,'2021-07-08 20:56:15','2021-07-08 20:56:15');
/*!40000 ALTER TABLE `banners` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` json NOT NULL,
  `meta` json DEFAULT NULL,
  `sort_order` int NOT NULL DEFAULT '1',
  `parent_id` int unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `categories_parent_id_foreign` (`parent_id`),
  CONSTRAINT `categories_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,'personal-care','{\"en\": \"Personal Care\"}','{\"scope\": \"ecommerce\"}',1,NULL,'2021-07-08 20:56:11','2021-07-08 20:56:11'),(2,'skin-care','{\"en\": \"Skin Care\"}','{\"scope\": \"ecommerce\"}',1,1,'2021-07-08 20:56:12','2021-07-08 20:56:12'),(3,'baby-care','{\"en\": \"Baby Care\"}','{\"scope\": \"ecommerce\"}',2,1,'2021-07-08 20:56:12','2021-07-08 20:56:12'),(4,'hair-care','{\"en\": \"Hair Care\"}','{\"scope\": \"ecommerce\"}',3,1,'2021-07-08 20:56:12','2021-07-08 20:56:12'),(5,'otc-medicines','{\"en\": \"OTC Medicines\"}','{\"scope\": \"ecommerce\"}',1,NULL,'2021-07-08 20:56:12','2021-07-08 20:56:12'),(6,'first-aid','{\"en\": \"First Aid\"}','{\"scope\": \"ecommerce\"}',1,5,'2021-07-08 20:56:12','2021-07-08 20:56:12'),(7,'fever','{\"en\": \"Fever\"}','{\"scope\": \"ecommerce\"}',2,5,'2021-07-08 20:56:12','2021-07-08 20:56:12'),(8,'pain','{\"en\": \"Pain\"}','{\"scope\": \"ecommerce\"}',3,5,'2021-07-08 20:56:12','2021-07-08 20:56:12'),(9,'mbbs','{\"en\": \"MBBS\"}','{\"scope\": \"degree\"}',1,NULL,'2021-07-08 20:56:12','2021-07-08 20:56:12'),(10,'hypertension-treatment','{\"en\": \"Hypertension Treatment\"}','{\"scope\": \"services\"}',1,NULL,'2021-07-08 20:56:12','2021-07-08 20:56:12'),(11,'diabetes-treatment','{\"en\": \"Diabetes Treatment\"}','{\"scope\": \"services\"}',1,NULL,'2021-07-08 20:56:12','2021-07-08 20:56:12'),(12,'general-physician','{\"en\": \"General Physician\"}','{\"scope\": \"specializations\"}',1,NULL,'2021-07-08 20:56:12','2021-07-08 20:56:12'),(13,'cardialogist','{\"en\": \"Cardialogist\"}','{\"scope\": \"specializations\"}',1,NULL,'2021-07-08 20:56:12','2021-07-08 20:56:12'),(14,'doctor','{\"en\": \"Doctor\"}','{\"scope\": \"type\"}',1,NULL,'2021-07-08 20:56:12','2021-07-08 20:56:12'),(15,'dentist','{\"en\": \"Dentist\"}','{\"scope\": \"type\"}',1,NULL,'2021-07-08 20:56:12','2021-07-08 20:56:12');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category_preferences`
--

DROP TABLE IF EXISTS `category_preferences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category_preferences` (
  `category_id` int unsigned DEFAULT NULL,
  `user_id` int unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  KEY `category_preferences_category_id_foreign` (`category_id`),
  KEY `category_preferences_user_id_foreign` (`user_id`),
  CONSTRAINT `category_preferences_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE,
  CONSTRAINT `category_preferences_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category_preferences`
--

LOCK TABLES `category_preferences` WRITE;
/*!40000 ALTER TABLE `category_preferences` DISABLE KEYS */;
/*!40000 ALTER TABLE `category_preferences` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `doctor_availabilities`
--

DROP TABLE IF EXISTS `doctor_availabilities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `doctor_availabilities` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `days` enum('sun','mon','tue','wed','thu','fri','sat') COLLATE utf8mb4_unicode_ci NOT NULL,
  `from` time NOT NULL,
  `to` time NOT NULL,
  `doctor_profile_id` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `doctor_availabilities_doctor_profile_id_foreign` (`doctor_profile_id`),
  CONSTRAINT `doctor_availabilities_doctor_profile_id_foreign` FOREIGN KEY (`doctor_profile_id`) REFERENCES `doctor_profiles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `doctor_availabilities`
--

LOCK TABLES `doctor_availabilities` WRITE;
/*!40000 ALTER TABLE `doctor_availabilities` DISABLE KEYS */;
/*!40000 ALTER TABLE `doctor_availabilities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `doctor_hospital_availabilities`
--

DROP TABLE IF EXISTS `doctor_hospital_availabilities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `doctor_hospital_availabilities` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `days` enum('sun','mon','tue','wed','thu','fri','sat') COLLATE utf8mb4_unicode_ci NOT NULL,
  `from` time NOT NULL,
  `to` time NOT NULL,
  `hospital_id` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `doctor_hospital_availabilities_hospital_id_foreign` (`hospital_id`),
  CONSTRAINT `doctor_hospital_availabilities_hospital_id_foreign` FOREIGN KEY (`hospital_id`) REFERENCES `doctor_hospitals` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `doctor_hospital_availabilities`
--

LOCK TABLES `doctor_hospital_availabilities` WRITE;
/*!40000 ALTER TABLE `doctor_hospital_availabilities` DISABLE KEYS */;
/*!40000 ALTER TABLE `doctor_hospital_availabilities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `doctor_hospital_services`
--

DROP TABLE IF EXISTS `doctor_hospital_services`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `doctor_hospital_services` (
  `hospital_id` int unsigned NOT NULL,
  `category_id` int unsigned NOT NULL,
  KEY `doctor_hospital_services_hospital_id_foreign` (`hospital_id`),
  KEY `doctor_hospital_services_category_id_foreign` (`category_id`),
  CONSTRAINT `doctor_hospital_services_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE,
  CONSTRAINT `doctor_hospital_services_hospital_id_foreign` FOREIGN KEY (`hospital_id`) REFERENCES `doctor_hospitals` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `doctor_hospital_services`
--

LOCK TABLES `doctor_hospital_services` WRITE;
/*!40000 ALTER TABLE `doctor_hospital_services` DISABLE KEYS */;
/*!40000 ALTER TABLE `doctor_hospital_services` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `doctor_hospitals`
--

DROP TABLE IF EXISTS `doctor_hospitals`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `doctor_hospitals` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` json NOT NULL,
  `tagline` json DEFAULT NULL,
  `details` json DEFAULT NULL,
  `meta` json DEFAULT NULL,
  `address` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `longitude` decimal(15,7) NOT NULL DEFAULT '0.0000000',
  `latitude` decimal(15,7) NOT NULL DEFAULT '0.0000000',
  `sort_order` int NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `doctor_hospitals`
--

LOCK TABLES `doctor_hospitals` WRITE;
/*!40000 ALTER TABLE `doctor_hospitals` DISABLE KEYS */;
INSERT INTO `doctor_hospitals` VALUES (1,'apollo-hospitals','{\"en\": \"Apollo Hospitals\"}','{\"en\": \"Apollo Hospitals Tagline\"}','{\"en\": \"Apollo Hospitals Details\"}',NULL,'Test Address',0.0000000,0.0000000,1,'2021-07-08 20:56:12','2021-07-08 20:56:12'),(2,'max-hospitals','{\"en\": \"Max Hospitals\"}','{\"en\": \"Max Hospitals Tagline\"}','{\"en\": \"Max Hospitals Details\"}',NULL,'Test Address',0.0000000,0.0000000,1,'2021-07-08 20:56:12','2021-07-08 20:56:12');
/*!40000 ALTER TABLE `doctor_hospitals` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `doctor_profiles`
--

DROP TABLE IF EXISTS `doctor_profiles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `doctor_profiles` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` json DEFAULT NULL,
  `tagline` json DEFAULT NULL,
  `details` json DEFAULT NULL,
  `meta` json DEFAULT NULL,
  `experience_years` int NOT NULL DEFAULT '0',
  `address` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `longitude` decimal(15,7) NOT NULL DEFAULT '0.0000000',
  `latitude` decimal(15,7) NOT NULL DEFAULT '0.0000000',
  `is_verified` tinyint(1) NOT NULL DEFAULT '1',
  `user_id` int unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `doctor_profiles_user_id_foreign` (`user_id`),
  CONSTRAINT `doctor_profiles_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `doctor_profiles`
--

LOCK TABLES `doctor_profiles` WRITE;
/*!40000 ALTER TABLE `doctor_profiles` DISABLE KEYS */;
/*!40000 ALTER TABLE `doctor_profiles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `doctor_profiles_degrees`
--

DROP TABLE IF EXISTS `doctor_profiles_degrees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `doctor_profiles_degrees` (
  `doctor_profile_id` int unsigned NOT NULL,
  `category_id` int unsigned NOT NULL,
  KEY `doctor_profiles_degrees_doctor_profile_id_foreign` (`doctor_profile_id`),
  KEY `doctor_profiles_degrees_category_id_foreign` (`category_id`),
  CONSTRAINT `doctor_profiles_degrees_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE,
  CONSTRAINT `doctor_profiles_degrees_doctor_profile_id_foreign` FOREIGN KEY (`doctor_profile_id`) REFERENCES `doctor_profiles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `doctor_profiles_degrees`
--

LOCK TABLES `doctor_profiles_degrees` WRITE;
/*!40000 ALTER TABLE `doctor_profiles_degrees` DISABLE KEYS */;
/*!40000 ALTER TABLE `doctor_profiles_degrees` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `doctor_profiles_hospitals`
--

DROP TABLE IF EXISTS `doctor_profiles_hospitals`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `doctor_profiles_hospitals` (
  `fee` decimal(8,2) unsigned NOT NULL,
  `doctor_profile_id` int unsigned NOT NULL,
  `hospital_id` int unsigned NOT NULL,
  KEY `doctor_profiles_hospitals_doctor_profile_id_foreign` (`doctor_profile_id`),
  KEY `doctor_profiles_hospitals_hospital_id_foreign` (`hospital_id`),
  CONSTRAINT `doctor_profiles_hospitals_doctor_profile_id_foreign` FOREIGN KEY (`doctor_profile_id`) REFERENCES `doctor_profiles` (`id`) ON DELETE CASCADE,
  CONSTRAINT `doctor_profiles_hospitals_hospital_id_foreign` FOREIGN KEY (`hospital_id`) REFERENCES `doctor_hospitals` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `doctor_profiles_hospitals`
--

LOCK TABLES `doctor_profiles_hospitals` WRITE;
/*!40000 ALTER TABLE `doctor_profiles_hospitals` DISABLE KEYS */;
/*!40000 ALTER TABLE `doctor_profiles_hospitals` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `doctor_profiles_services`
--

DROP TABLE IF EXISTS `doctor_profiles_services`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `doctor_profiles_services` (
  `doctor_profile_id` int unsigned NOT NULL,
  `category_id` int unsigned NOT NULL,
  KEY `doctor_profiles_services_doctor_profile_id_foreign` (`doctor_profile_id`),
  KEY `doctor_profiles_services_category_id_foreign` (`category_id`),
  CONSTRAINT `doctor_profiles_services_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE,
  CONSTRAINT `doctor_profiles_services_doctor_profile_id_foreign` FOREIGN KEY (`doctor_profile_id`) REFERENCES `doctor_profiles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `doctor_profiles_services`
--

LOCK TABLES `doctor_profiles_services` WRITE;
/*!40000 ALTER TABLE `doctor_profiles_services` DISABLE KEYS */;
/*!40000 ALTER TABLE `doctor_profiles_services` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `doctor_profiles_specializations`
--

DROP TABLE IF EXISTS `doctor_profiles_specializations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `doctor_profiles_specializations` (
  `doctor_profile_id` int unsigned NOT NULL,
  `category_id` int unsigned NOT NULL,
  KEY `doctor_profiles_specializations_doctor_profile_id_foreign` (`doctor_profile_id`),
  KEY `doctor_profiles_specializations_category_id_foreign` (`category_id`),
  CONSTRAINT `doctor_profiles_specializations_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE,
  CONSTRAINT `doctor_profiles_specializations_doctor_profile_id_foreign` FOREIGN KEY (`doctor_profile_id`) REFERENCES `doctor_profiles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `doctor_profiles_specializations`
--

LOCK TABLES `doctor_profiles_specializations` WRITE;
/*!40000 ALTER TABLE `doctor_profiles_specializations` DISABLE KEYS */;
/*!40000 ALTER TABLE `doctor_profiles_specializations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `doctor_profiles_types`
--

DROP TABLE IF EXISTS `doctor_profiles_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `doctor_profiles_types` (
  `doctor_profile_id` int unsigned NOT NULL,
  `category_id` int unsigned NOT NULL,
  KEY `doctor_profiles_types_doctor_profile_id_foreign` (`doctor_profile_id`),
  KEY `doctor_profiles_types_category_id_foreign` (`category_id`),
  CONSTRAINT `doctor_profiles_types_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE,
  CONSTRAINT `doctor_profiles_types_doctor_profile_id_foreign` FOREIGN KEY (`doctor_profile_id`) REFERENCES `doctor_profiles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `doctor_profiles_types`
--

LOCK TABLES `doctor_profiles_types` WRITE;
/*!40000 ALTER TABLE `doctor_profiles_types` DISABLE KEYS */;
/*!40000 ALTER TABLE `doctor_profiles_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ecommerce_addresses`
--

DROP TABLE IF EXISTS `ecommerce_addresses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ecommerce_addresses` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta` json DEFAULT NULL,
  `formatted_address` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address1` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address2` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `postcode` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `longitude` decimal(15,7) NOT NULL DEFAULT '0.0000000',
  `latitude` decimal(15,7) NOT NULL DEFAULT '0.0000000',
  `user_id` int unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ecommerce_addresses_user_id_foreign` (`user_id`),
  CONSTRAINT `ecommerce_addresses_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ecommerce_addresses`
--

LOCK TABLES `ecommerce_addresses` WRITE;
/*!40000 ALTER TABLE `ecommerce_addresses` DISABLE KEYS */;
/*!40000 ALTER TABLE `ecommerce_addresses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ecommerce_attribute_terms`
--

DROP TABLE IF EXISTS `ecommerce_attribute_terms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ecommerce_attribute_terms` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `attribute_id` int unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ecommerce_attribute_terms_attribute_id_foreign` (`attribute_id`),
  CONSTRAINT `ecommerce_attribute_terms_attribute_id_foreign` FOREIGN KEY (`attribute_id`) REFERENCES `ecommerce_attributes` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ecommerce_attribute_terms`
--

LOCK TABLES `ecommerce_attribute_terms` WRITE;
/*!40000 ALTER TABLE `ecommerce_attribute_terms` DISABLE KEYS */;
/*!40000 ALTER TABLE `ecommerce_attribute_terms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ecommerce_attributes`
--

DROP TABLE IF EXISTS `ecommerce_attributes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ecommerce_attributes` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `title` json NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ecommerce_attributes`
--

LOCK TABLES `ecommerce_attributes` WRITE;
/*!40000 ALTER TABLE `ecommerce_attributes` DISABLE KEYS */;
/*!40000 ALTER TABLE `ecommerce_attributes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ecommerce_coupons`
--

DROP TABLE IF EXISTS `ecommerce_coupons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ecommerce_coupons` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `title` json DEFAULT NULL,
  `detail` json DEFAULT NULL,
  `meta` json DEFAULT NULL,
  `code` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `reward` int NOT NULL,
  `type` enum('fixed','percent') COLLATE utf8mb4_unicode_ci NOT NULL,
  `expires_at` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ecommerce_coupons_code_unique` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ecommerce_coupons`
--

LOCK TABLES `ecommerce_coupons` WRITE;
/*!40000 ALTER TABLE `ecommerce_coupons` DISABLE KEYS */;
INSERT INTO `ecommerce_coupons` VALUES (1,'{\"en\": \"Test Coupon\"}','{\"en\": \"Test Coupon Details\"}',NULL,'TEST100',10,'percent','2020-12-31','2021-07-08 20:56:12','2021-07-08 20:56:12'),(2,'{\"en\": \"Test Coupon 2\"}','{\"en\": \"Test Coupon 2 Details\"}',NULL,'TEST200',20,'percent','2020-12-31','2021-07-08 20:56:12','2021-07-08 20:56:12'),(3,'{\"en\": \"Test Coupon 3\"}','{\"en\": \"Test Coupon 3 Details\"}',NULL,'TEST300',30,'percent','2020-12-31','2021-07-08 20:56:12','2021-07-08 20:56:12');
/*!40000 ALTER TABLE `ecommerce_coupons` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ecommerce_coupons_users`
--

DROP TABLE IF EXISTS `ecommerce_coupons_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ecommerce_coupons_users` (
  `user_id` int unsigned NOT NULL,
  `coupon_id` int unsigned NOT NULL,
  `used_at` timestamp NOT NULL,
  PRIMARY KEY (`user_id`,`coupon_id`),
  KEY `ecommerce_coupons_users_coupon_id_foreign` (`coupon_id`),
  CONSTRAINT `ecommerce_coupons_users_coupon_id_foreign` FOREIGN KEY (`coupon_id`) REFERENCES `ecommerce_coupons` (`id`) ON DELETE CASCADE,
  CONSTRAINT `ecommerce_coupons_users_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ecommerce_coupons_users`
--

LOCK TABLES `ecommerce_coupons_users` WRITE;
/*!40000 ALTER TABLE `ecommerce_coupons_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `ecommerce_coupons_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ecommerce_delivery_order_requests`
--

DROP TABLE IF EXISTS `ecommerce_delivery_order_requests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ecommerce_delivery_order_requests` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `meta` json DEFAULT NULL,
  `delivery_profile_id` int unsigned NOT NULL,
  `order_id` int unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_delivery_profile_order` (`delivery_profile_id`,`order_id`),
  KEY `ecommerce_delivery_order_requests_order_id_foreign` (`order_id`),
  CONSTRAINT `ecommerce_delivery_order_requests_delivery_profile_id_foreign` FOREIGN KEY (`delivery_profile_id`) REFERENCES `ecommerce_delivery_profiles` (`id`) ON DELETE CASCADE,
  CONSTRAINT `ecommerce_delivery_order_requests_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `ecommerce_orders` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ecommerce_delivery_order_requests`
--

LOCK TABLES `ecommerce_delivery_order_requests` WRITE;
/*!40000 ALTER TABLE `ecommerce_delivery_order_requests` DISABLE KEYS */;
/*!40000 ALTER TABLE `ecommerce_delivery_order_requests` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ecommerce_delivery_profiles`
--

DROP TABLE IF EXISTS `ecommerce_delivery_profiles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ecommerce_delivery_profiles` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `meta` json DEFAULT NULL,
  `is_verified` tinyint(1) NOT NULL DEFAULT '1',
  `is_online` tinyint(1) NOT NULL DEFAULT '0',
  `assigned` tinyint(1) NOT NULL DEFAULT '0',
  `longitude` decimal(15,7) DEFAULT NULL,
  `latitude` decimal(15,7) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `user_id` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ecommerce_delivery_profiles_user_id_foreign` (`user_id`),
  CONSTRAINT `ecommerce_delivery_profiles_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ecommerce_delivery_profiles`
--

LOCK TABLES `ecommerce_delivery_profiles` WRITE;
/*!40000 ALTER TABLE `ecommerce_delivery_profiles` DISABLE KEYS */;
/*!40000 ALTER TABLE `ecommerce_delivery_profiles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ecommerce_order_addresses`
--

DROP TABLE IF EXISTS `ecommerce_order_addresses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ecommerce_order_addresses` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mobile` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `formatted_address` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address1` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address2` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `postcode` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `longitude` decimal(15,7) NOT NULL,
  `latitude` decimal(15,7) NOT NULL,
  `order_id` int unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ecommerce_order_addresses_order_id_foreign` (`order_id`),
  CONSTRAINT `ecommerce_order_addresses_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `ecommerce_orders` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ecommerce_order_addresses`
--

LOCK TABLES `ecommerce_order_addresses` WRITE;
/*!40000 ALTER TABLE `ecommerce_order_addresses` DISABLE KEYS */;
/*!40000 ALTER TABLE `ecommerce_order_addresses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ecommerce_order_conditions`
--

DROP TABLE IF EXISTS `ecommerce_order_conditions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ecommerce_order_conditions` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `operator` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ecommerce_order_conditions`
--

LOCK TABLES `ecommerce_order_conditions` WRITE;
/*!40000 ALTER TABLE `ecommerce_order_conditions` DISABLE KEYS */;
/*!40000 ALTER TABLE `ecommerce_order_conditions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ecommerce_order_deliveries`
--

DROP TABLE IF EXISTS `ecommerce_order_deliveries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ecommerce_order_deliveries` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `order_id` int unsigned NOT NULL,
  `delivery_profile_id` int unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ecommerce_order_deliveries_order_id_foreign` (`order_id`),
  KEY `ecommerce_order_deliveries_delivery_profile_id_foreign` (`delivery_profile_id`),
  CONSTRAINT `ecommerce_order_deliveries_delivery_profile_id_foreign` FOREIGN KEY (`delivery_profile_id`) REFERENCES `ecommerce_delivery_profiles` (`id`) ON DELETE CASCADE,
  CONSTRAINT `ecommerce_order_deliveries_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `ecommerce_orders` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ecommerce_order_deliveries`
--

LOCK TABLES `ecommerce_order_deliveries` WRITE;
/*!40000 ALTER TABLE `ecommerce_order_deliveries` DISABLE KEYS */;
/*!40000 ALTER TABLE `ecommerce_order_deliveries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ecommerce_order_product_addons`
--

DROP TABLE IF EXISTS `ecommerce_order_product_addons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ecommerce_order_product_addons` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `total` decimal(8,2) NOT NULL,
  `product_addon_choice_id` int unsigned NOT NULL,
  `order_product_id` int unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ecommerce_order_product_addons_product_addon_choice_id_foreign` (`product_addon_choice_id`),
  KEY `ecommerce_order_product_addons_order_product_id_foreign` (`order_product_id`),
  CONSTRAINT `ecommerce_order_product_addons_order_product_id_foreign` FOREIGN KEY (`order_product_id`) REFERENCES `ecommerce_order_products` (`id`) ON DELETE CASCADE,
  CONSTRAINT `ecommerce_order_product_addons_product_addon_choice_id_foreign` FOREIGN KEY (`product_addon_choice_id`) REFERENCES `ecommerce_product_addon_choices` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ecommerce_order_product_addons`
--

LOCK TABLES `ecommerce_order_product_addons` WRITE;
/*!40000 ALTER TABLE `ecommerce_order_product_addons` DISABLE KEYS */;
/*!40000 ALTER TABLE `ecommerce_order_product_addons` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ecommerce_order_products`
--

DROP TABLE IF EXISTS `ecommerce_order_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ecommerce_order_products` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `quantity` int NOT NULL,
  `total` decimal(8,2) NOT NULL,
  `order_id` int unsigned NOT NULL,
  `vendor_product_id` int unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ecommerce_order_products_order_id_foreign` (`order_id`),
  KEY `ecommerce_order_products_vendor_product_id_foreign` (`vendor_product_id`),
  CONSTRAINT `ecommerce_order_products_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `ecommerce_orders` (`id`) ON DELETE CASCADE,
  CONSTRAINT `ecommerce_order_products_vendor_product_id_foreign` FOREIGN KEY (`vendor_product_id`) REFERENCES `ecommerce_vendor_products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ecommerce_order_products`
--

LOCK TABLES `ecommerce_order_products` WRITE;
/*!40000 ALTER TABLE `ecommerce_order_products` DISABLE KEYS */;
/*!40000 ALTER TABLE `ecommerce_order_products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ecommerce_orders`
--

DROP TABLE IF EXISTS `ecommerce_orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ecommerce_orders` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `notes` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta` json DEFAULT NULL,
  `is_guest` tinyint(1) NOT NULL DEFAULT '0',
  `customer_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_mobile` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subtotal` double(8,2) NOT NULL,
  `taxes` double(8,2) NOT NULL,
  `delivery_fee` double(8,2) NOT NULL,
  `total` double(8,2) NOT NULL,
  `discount` double(8,2) NOT NULL,
  `type` enum('ASAP','LATER') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'ASAP',
  `scheduled_on` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `vendor_id` int unsigned DEFAULT NULL,
  `user_id` int unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `distance_travelled` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `ecommerce_orders_vendor_id_foreign` (`vendor_id`),
  KEY `ecommerce_orders_user_id_foreign` (`user_id`),
  CONSTRAINT `ecommerce_orders_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `ecommerce_orders_vendor_id_foreign` FOREIGN KEY (`vendor_id`) REFERENCES `ecommerce_vendors` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ecommerce_orders`
--

LOCK TABLES `ecommerce_orders` WRITE;
/*!40000 ALTER TABLE `ecommerce_orders` DISABLE KEYS */;
/*!40000 ALTER TABLE `ecommerce_orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ecommerce_product_addon_choices`
--

DROP TABLE IF EXISTS `ecommerce_product_addon_choices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ecommerce_product_addon_choices` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `title` json NOT NULL,
  `price` double(8,2) NOT NULL,
  `product_addon_group_id` int unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ecommerce_product_addon_choices_product_addon_group_id_foreign` (`product_addon_group_id`),
  CONSTRAINT `ecommerce_product_addon_choices_product_addon_group_id_foreign` FOREIGN KEY (`product_addon_group_id`) REFERENCES `ecommerce_product_addon_groups` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ecommerce_product_addon_choices`
--

LOCK TABLES `ecommerce_product_addon_choices` WRITE;
/*!40000 ALTER TABLE `ecommerce_product_addon_choices` DISABLE KEYS */;
/*!40000 ALTER TABLE `ecommerce_product_addon_choices` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ecommerce_product_addon_groups`
--

DROP TABLE IF EXISTS `ecommerce_product_addon_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ecommerce_product_addon_groups` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `title` json NOT NULL,
  `max_choices` int unsigned NOT NULL,
  `min_choices` int unsigned NOT NULL,
  `product_id` int unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ecommerce_product_addon_groups_product_id_foreign` (`product_id`),
  CONSTRAINT `ecommerce_product_addon_groups_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `ecommerce_products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ecommerce_product_addon_groups`
--

LOCK TABLES `ecommerce_product_addon_groups` WRITE;
/*!40000 ALTER TABLE `ecommerce_product_addon_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `ecommerce_product_addon_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ecommerce_product_categories`
--

DROP TABLE IF EXISTS `ecommerce_product_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ecommerce_product_categories` (
  `product_id` int unsigned NOT NULL,
  `category_id` int unsigned NOT NULL,
  UNIQUE KEY `ecommerce_product_categories_product_id_category_id_unique` (`product_id`,`category_id`),
  KEY `ecommerce_product_categories_category_id_foreign` (`category_id`),
  CONSTRAINT `ecommerce_product_categories_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE,
  CONSTRAINT `ecommerce_product_categories_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `ecommerce_products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ecommerce_product_categories`
--

LOCK TABLES `ecommerce_product_categories` WRITE;
/*!40000 ALTER TABLE `ecommerce_product_categories` DISABLE KEYS */;
/*!40000 ALTER TABLE `ecommerce_product_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ecommerce_products`
--

DROP TABLE IF EXISTS `ecommerce_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ecommerce_products` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `title` json DEFAULT NULL,
  `detail` json DEFAULT NULL,
  `meta` json DEFAULT NULL,
  `price` double(8,2) NOT NULL,
  `owner` enum('admin','vendor') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'vendor',
  `parent_id` int unsigned DEFAULT NULL,
  `attribute_term_id` int unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `sells_count` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `ecommerce_products_attribute_term_id_foreign` (`attribute_term_id`),
  CONSTRAINT `ecommerce_products_attribute_term_id_foreign` FOREIGN KEY (`attribute_term_id`) REFERENCES `ecommerce_attribute_terms` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ecommerce_products`
--

LOCK TABLES `ecommerce_products` WRITE;
/*!40000 ALTER TABLE `ecommerce_products` DISABLE KEYS */;
/*!40000 ALTER TABLE `ecommerce_products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ecommerce_vendor_categories`
--

DROP TABLE IF EXISTS `ecommerce_vendor_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ecommerce_vendor_categories` (
  `vendor_id` int unsigned NOT NULL,
  `category_id` int unsigned NOT NULL,
  KEY `ecommerce_vendor_categories_vendor_id_foreign` (`vendor_id`),
  KEY `ecommerce_vendor_categories_category_id_foreign` (`category_id`),
  CONSTRAINT `ecommerce_vendor_categories_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE,
  CONSTRAINT `ecommerce_vendor_categories_vendor_id_foreign` FOREIGN KEY (`vendor_id`) REFERENCES `ecommerce_vendors` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ecommerce_vendor_categories`
--

LOCK TABLES `ecommerce_vendor_categories` WRITE;
/*!40000 ALTER TABLE `ecommerce_vendor_categories` DISABLE KEYS */;
/*!40000 ALTER TABLE `ecommerce_vendor_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ecommerce_vendor_product_categories`
--

DROP TABLE IF EXISTS `ecommerce_vendor_product_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ecommerce_vendor_product_categories` (
  `vendor_id` int unsigned NOT NULL,
  `category_id` int unsigned NOT NULL,
  `product_id` int unsigned NOT NULL,
  KEY `ecommerce_vendor_product_categories_vendor_id_foreign` (`vendor_id`),
  KEY `ecommerce_vendor_product_categories_category_id_foreign` (`category_id`),
  KEY `ecommerce_vendor_product_categories_product_id_foreign` (`product_id`),
  CONSTRAINT `ecommerce_vendor_product_categories_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE,
  CONSTRAINT `ecommerce_vendor_product_categories_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `ecommerce_products` (`id`) ON DELETE CASCADE,
  CONSTRAINT `ecommerce_vendor_product_categories_vendor_id_foreign` FOREIGN KEY (`vendor_id`) REFERENCES `ecommerce_vendors` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ecommerce_vendor_product_categories`
--

LOCK TABLES `ecommerce_vendor_product_categories` WRITE;
/*!40000 ALTER TABLE `ecommerce_vendor_product_categories` DISABLE KEYS */;
/*!40000 ALTER TABLE `ecommerce_vendor_product_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ecommerce_vendor_products`
--

DROP TABLE IF EXISTS `ecommerce_vendor_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ecommerce_vendor_products` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `price` double(8,2) NOT NULL,
  `sale_price` double(8,2) DEFAULT NULL,
  `sale_price_from` date DEFAULT NULL,
  `sale_price_to` date DEFAULT NULL,
  `stock_quantity` int NOT NULL DEFAULT '-1',
  `stock_low_threshold` int NOT NULL DEFAULT '0',
  `vendor_id` int unsigned NOT NULL,
  `product_id` int unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ecommerce_vendor_products_vendor_id_foreign` (`vendor_id`),
  KEY `ecommerce_vendor_products_product_id_foreign` (`product_id`),
  CONSTRAINT `ecommerce_vendor_products_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `ecommerce_products` (`id`) ON DELETE CASCADE,
  CONSTRAINT `ecommerce_vendor_products_vendor_id_foreign` FOREIGN KEY (`vendor_id`) REFERENCES `ecommerce_vendors` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ecommerce_vendor_products`
--

LOCK TABLES `ecommerce_vendor_products` WRITE;
/*!40000 ALTER TABLE `ecommerce_vendor_products` DISABLE KEYS */;
/*!40000 ALTER TABLE `ecommerce_vendor_products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ecommerce_vendors`
--

DROP TABLE IF EXISTS `ecommerce_vendors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ecommerce_vendors` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` json DEFAULT NULL,
  `tagline` json DEFAULT NULL,
  `details` json DEFAULT NULL,
  `meta` json DEFAULT NULL,
  `minimum_order` int unsigned NOT NULL DEFAULT '0',
  `delivery_fee` int unsigned NOT NULL DEFAULT '0',
  `area` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `longitude` decimal(15,7) NOT NULL DEFAULT '0.0000000',
  `latitude` decimal(15,7) NOT NULL DEFAULT '0.0000000',
  `is_verified` tinyint(1) NOT NULL DEFAULT '1',
  `user_id` int unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ecommerce_vendors_user_id_foreign` (`user_id`),
  CONSTRAINT `ecommerce_vendors_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ecommerce_vendors`
--

LOCK TABLES `ecommerce_vendors` WRITE;
/*!40000 ALTER TABLE `ecommerce_vendors` DISABLE KEYS */;
/*!40000 ALTER TABLE `ecommerce_vendors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `faqs`
--

DROP TABLE IF EXISTS `faqs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `faqs` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `short_description` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta` json DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `faqs`
--

LOCK TABLES `faqs` WRITE;
/*!40000 ALTER TABLE `faqs` DISABLE KEYS */;
INSERT INTO `faqs` VALUES (1,'Lorem ipsum','Lorem ipsum dolor sit amet.','Lorem ipsum dolor sit amet, consectetur adipiscing elit.',NULL,'2021-07-08 20:56:12','2021-07-08 20:56:12'),(2,'Lorem dolor','Lorem dolor ipsum dolor sit amet.','Lorem dolor ipsum sit amet, consectetur adipiscing elit.',NULL,'2021-07-08 20:56:12','2021-07-08 20:56:12');
/*!40000 ALTER TABLE `faqs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `favorites`
--

DROP TABLE IF EXISTS `favorites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `favorites` (
  `user_id` int unsigned NOT NULL,
  `favoriteable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `favoriteable_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`user_id`,`favoriteable_id`,`favoriteable_type`),
  KEY `favorites_favoriteable_type_favoriteable_id_index` (`favoriteable_type`,`favoriteable_id`),
  KEY `favorites_user_id_index` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `favorites`
--

LOCK TABLES `favorites` WRITE;
/*!40000 ALTER TABLE `favorites` DISABLE KEYS */;
/*!40000 ALTER TABLE `favorites` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jobs`
--

DROP TABLE IF EXISTS `jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `queue` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint unsigned NOT NULL,
  `reserved_at` int unsigned DEFAULT NULL,
  `available_at` int unsigned NOT NULL,
  `created_at` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `jobs_queue_index` (`queue`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jobs`
--

LOCK TABLES `jobs` WRITE;
/*!40000 ALTER TABLE `jobs` DISABLE KEYS */;
INSERT INTO `jobs` VALUES (1,'default','{\"displayName\":\"Spatie\\\\MediaLibrary\\\\Jobs\\\\PerformConversions\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"delay\":null,\"timeout\":null,\"timeoutAt\":null,\"data\":{\"commandName\":\"Spatie\\\\MediaLibrary\\\\Jobs\\\\PerformConversions\",\"command\":\"O:43:\\\"Spatie\\\\MediaLibrary\\\\Jobs\\\\PerformConversions\\\":11:{s:14:\\\"\\u0000*\\u0000conversions\\\";O:51:\\\"Spatie\\\\MediaLibrary\\\\Conversion\\\\ConversionCollection\\\":2:{s:8:\\\"\\u0000*\\u0000media\\\";N;s:8:\\\"\\u0000*\\u0000items\\\";a:1:{i:0;O:41:\\\"Spatie\\\\MediaLibrary\\\\Conversion\\\\Conversion\\\":7:{s:7:\\\"\\u0000*\\u0000name\\\";s:5:\\\"thumb\\\";s:28:\\\"\\u0000*\\u0000extractVideoFrameAtSecond\\\";i:0;s:16:\\\"\\u0000*\\u0000manipulations\\\";O:26:\\\"Spatie\\\\Image\\\\Manipulations\\\":1:{s:23:\\\"\\u0000*\\u0000manipulationSequence\\\";O:33:\\\"Spatie\\\\Image\\\\ManipulationSequence\\\":1:{s:9:\\\"\\u0000*\\u0000groups\\\";a:1:{i:0;a:3:{s:8:\\\"optimize\\\";s:341:\\\"{\\\"Spatie\\\\\\\\ImageOptimizer\\\\\\\\Optimizers\\\\\\\\Jpegoptim\\\":[\\\"--strip-all\\\",\\\"--all-progressive\\\"],\\\"Spatie\\\\\\\\ImageOptimizer\\\\\\\\Optimizers\\\\\\\\Pngquant\\\":[\\\"--force\\\"],\\\"Spatie\\\\\\\\ImageOptimizer\\\\\\\\Optimizers\\\\\\\\Optipng\\\":[\\\"-i0\\\",\\\"-o2\\\",\\\"-quiet\\\"],\\\"Spatie\\\\\\\\ImageOptimizer\\\\\\\\Optimizers\\\\\\\\Svgo\\\":[\\\"--disable=cleanupIDs\\\"],\\\"Spatie\\\\\\\\ImageOptimizer\\\\\\\\Optimizers\\\\\\\\Gifsicle\\\":[\\\"-b\\\",\\\"-O3\\\"]}\\\";s:6:\\\"format\\\";s:3:\\\"jpg\\\";s:5:\\\"width\\\";s:2:\\\"50\\\";}}}}s:23:\\\"\\u0000*\\u0000performOnCollections\\\";a:0:{}s:17:\\\"\\u0000*\\u0000performOnQueue\\\";b:1;s:26:\\\"\\u0000*\\u0000keepOriginalImageFormat\\\";b:0;s:27:\\\"\\u0000*\\u0000generateResponsiveImages\\\";b:0;}}}s:8:\\\"\\u0000*\\u0000media\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":4:{s:5:\\\"class\\\";s:32:\\\"Spatie\\\\MediaLibrary\\\\Models\\\\Media\\\";s:2:\\\"id\\\";i:1;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";}s:14:\\\"\\u0000*\\u0000onlyMissing\\\";b:0;s:6:\\\"\\u0000*\\u0000job\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:5:\\\"delay\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}\"}}',0,NULL,1625797572,1625797572),(2,'default','{\"displayName\":\"Spatie\\\\MediaLibrary\\\\Jobs\\\\PerformConversions\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"delay\":null,\"timeout\":null,\"timeoutAt\":null,\"data\":{\"commandName\":\"Spatie\\\\MediaLibrary\\\\Jobs\\\\PerformConversions\",\"command\":\"O:43:\\\"Spatie\\\\MediaLibrary\\\\Jobs\\\\PerformConversions\\\":11:{s:14:\\\"\\u0000*\\u0000conversions\\\";O:51:\\\"Spatie\\\\MediaLibrary\\\\Conversion\\\\ConversionCollection\\\":2:{s:8:\\\"\\u0000*\\u0000media\\\";N;s:8:\\\"\\u0000*\\u0000items\\\";a:1:{i:0;O:41:\\\"Spatie\\\\MediaLibrary\\\\Conversion\\\\Conversion\\\":7:{s:7:\\\"\\u0000*\\u0000name\\\";s:5:\\\"thumb\\\";s:28:\\\"\\u0000*\\u0000extractVideoFrameAtSecond\\\";i:0;s:16:\\\"\\u0000*\\u0000manipulations\\\";O:26:\\\"Spatie\\\\Image\\\\Manipulations\\\":1:{s:23:\\\"\\u0000*\\u0000manipulationSequence\\\";O:33:\\\"Spatie\\\\Image\\\\ManipulationSequence\\\":1:{s:9:\\\"\\u0000*\\u0000groups\\\";a:1:{i:0;a:3:{s:8:\\\"optimize\\\";s:341:\\\"{\\\"Spatie\\\\\\\\ImageOptimizer\\\\\\\\Optimizers\\\\\\\\Jpegoptim\\\":[\\\"--strip-all\\\",\\\"--all-progressive\\\"],\\\"Spatie\\\\\\\\ImageOptimizer\\\\\\\\Optimizers\\\\\\\\Pngquant\\\":[\\\"--force\\\"],\\\"Spatie\\\\\\\\ImageOptimizer\\\\\\\\Optimizers\\\\\\\\Optipng\\\":[\\\"-i0\\\",\\\"-o2\\\",\\\"-quiet\\\"],\\\"Spatie\\\\\\\\ImageOptimizer\\\\\\\\Optimizers\\\\\\\\Svgo\\\":[\\\"--disable=cleanupIDs\\\"],\\\"Spatie\\\\\\\\ImageOptimizer\\\\\\\\Optimizers\\\\\\\\Gifsicle\\\":[\\\"-b\\\",\\\"-O3\\\"]}\\\";s:6:\\\"format\\\";s:3:\\\"jpg\\\";s:5:\\\"width\\\";s:2:\\\"50\\\";}}}}s:23:\\\"\\u0000*\\u0000performOnCollections\\\";a:0:{}s:17:\\\"\\u0000*\\u0000performOnQueue\\\";b:1;s:26:\\\"\\u0000*\\u0000keepOriginalImageFormat\\\";b:0;s:27:\\\"\\u0000*\\u0000generateResponsiveImages\\\";b:0;}}}s:8:\\\"\\u0000*\\u0000media\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":4:{s:5:\\\"class\\\";s:32:\\\"Spatie\\\\MediaLibrary\\\\Models\\\\Media\\\";s:2:\\\"id\\\";i:2;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";}s:14:\\\"\\u0000*\\u0000onlyMissing\\\";b:0;s:6:\\\"\\u0000*\\u0000job\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:5:\\\"delay\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}\"}}',0,NULL,1625797572,1625797572),(3,'default','{\"displayName\":\"Spatie\\\\MediaLibrary\\\\Jobs\\\\PerformConversions\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"delay\":null,\"timeout\":null,\"timeoutAt\":null,\"data\":{\"commandName\":\"Spatie\\\\MediaLibrary\\\\Jobs\\\\PerformConversions\",\"command\":\"O:43:\\\"Spatie\\\\MediaLibrary\\\\Jobs\\\\PerformConversions\\\":11:{s:14:\\\"\\u0000*\\u0000conversions\\\";O:51:\\\"Spatie\\\\MediaLibrary\\\\Conversion\\\\ConversionCollection\\\":2:{s:8:\\\"\\u0000*\\u0000media\\\";N;s:8:\\\"\\u0000*\\u0000items\\\";a:1:{i:0;O:41:\\\"Spatie\\\\MediaLibrary\\\\Conversion\\\\Conversion\\\":7:{s:7:\\\"\\u0000*\\u0000name\\\";s:5:\\\"thumb\\\";s:28:\\\"\\u0000*\\u0000extractVideoFrameAtSecond\\\";i:0;s:16:\\\"\\u0000*\\u0000manipulations\\\";O:26:\\\"Spatie\\\\Image\\\\Manipulations\\\":1:{s:23:\\\"\\u0000*\\u0000manipulationSequence\\\";O:33:\\\"Spatie\\\\Image\\\\ManipulationSequence\\\":1:{s:9:\\\"\\u0000*\\u0000groups\\\";a:1:{i:0;a:3:{s:8:\\\"optimize\\\";s:341:\\\"{\\\"Spatie\\\\\\\\ImageOptimizer\\\\\\\\Optimizers\\\\\\\\Jpegoptim\\\":[\\\"--strip-all\\\",\\\"--all-progressive\\\"],\\\"Spatie\\\\\\\\ImageOptimizer\\\\\\\\Optimizers\\\\\\\\Pngquant\\\":[\\\"--force\\\"],\\\"Spatie\\\\\\\\ImageOptimizer\\\\\\\\Optimizers\\\\\\\\Optipng\\\":[\\\"-i0\\\",\\\"-o2\\\",\\\"-quiet\\\"],\\\"Spatie\\\\\\\\ImageOptimizer\\\\\\\\Optimizers\\\\\\\\Svgo\\\":[\\\"--disable=cleanupIDs\\\"],\\\"Spatie\\\\\\\\ImageOptimizer\\\\\\\\Optimizers\\\\\\\\Gifsicle\\\":[\\\"-b\\\",\\\"-O3\\\"]}\\\";s:6:\\\"format\\\";s:3:\\\"jpg\\\";s:5:\\\"width\\\";s:2:\\\"50\\\";}}}}s:23:\\\"\\u0000*\\u0000performOnCollections\\\";a:0:{}s:17:\\\"\\u0000*\\u0000performOnQueue\\\";b:1;s:26:\\\"\\u0000*\\u0000keepOriginalImageFormat\\\";b:0;s:27:\\\"\\u0000*\\u0000generateResponsiveImages\\\";b:0;}}}s:8:\\\"\\u0000*\\u0000media\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":4:{s:5:\\\"class\\\";s:32:\\\"Spatie\\\\MediaLibrary\\\\Models\\\\Media\\\";s:2:\\\"id\\\";i:3;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";}s:14:\\\"\\u0000*\\u0000onlyMissing\\\";b:0;s:6:\\\"\\u0000*\\u0000job\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:5:\\\"delay\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}\"}}',0,NULL,1625797572,1625797572),(4,'default','{\"displayName\":\"Spatie\\\\MediaLibrary\\\\Jobs\\\\PerformConversions\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"delay\":null,\"timeout\":null,\"timeoutAt\":null,\"data\":{\"commandName\":\"Spatie\\\\MediaLibrary\\\\Jobs\\\\PerformConversions\",\"command\":\"O:43:\\\"Spatie\\\\MediaLibrary\\\\Jobs\\\\PerformConversions\\\":11:{s:14:\\\"\\u0000*\\u0000conversions\\\";O:51:\\\"Spatie\\\\MediaLibrary\\\\Conversion\\\\ConversionCollection\\\":2:{s:8:\\\"\\u0000*\\u0000media\\\";N;s:8:\\\"\\u0000*\\u0000items\\\";a:1:{i:0;O:41:\\\"Spatie\\\\MediaLibrary\\\\Conversion\\\\Conversion\\\":7:{s:7:\\\"\\u0000*\\u0000name\\\";s:5:\\\"thumb\\\";s:28:\\\"\\u0000*\\u0000extractVideoFrameAtSecond\\\";i:0;s:16:\\\"\\u0000*\\u0000manipulations\\\";O:26:\\\"Spatie\\\\Image\\\\Manipulations\\\":1:{s:23:\\\"\\u0000*\\u0000manipulationSequence\\\";O:33:\\\"Spatie\\\\Image\\\\ManipulationSequence\\\":1:{s:9:\\\"\\u0000*\\u0000groups\\\";a:1:{i:0;a:3:{s:8:\\\"optimize\\\";s:341:\\\"{\\\"Spatie\\\\\\\\ImageOptimizer\\\\\\\\Optimizers\\\\\\\\Jpegoptim\\\":[\\\"--strip-all\\\",\\\"--all-progressive\\\"],\\\"Spatie\\\\\\\\ImageOptimizer\\\\\\\\Optimizers\\\\\\\\Pngquant\\\":[\\\"--force\\\"],\\\"Spatie\\\\\\\\ImageOptimizer\\\\\\\\Optimizers\\\\\\\\Optipng\\\":[\\\"-i0\\\",\\\"-o2\\\",\\\"-quiet\\\"],\\\"Spatie\\\\\\\\ImageOptimizer\\\\\\\\Optimizers\\\\\\\\Svgo\\\":[\\\"--disable=cleanupIDs\\\"],\\\"Spatie\\\\\\\\ImageOptimizer\\\\\\\\Optimizers\\\\\\\\Gifsicle\\\":[\\\"-b\\\",\\\"-O3\\\"]}\\\";s:6:\\\"format\\\";s:3:\\\"jpg\\\";s:5:\\\"width\\\";s:2:\\\"50\\\";}}}}s:23:\\\"\\u0000*\\u0000performOnCollections\\\";a:0:{}s:17:\\\"\\u0000*\\u0000performOnQueue\\\";b:1;s:26:\\\"\\u0000*\\u0000keepOriginalImageFormat\\\";b:0;s:27:\\\"\\u0000*\\u0000generateResponsiveImages\\\";b:0;}}}s:8:\\\"\\u0000*\\u0000media\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":4:{s:5:\\\"class\\\";s:32:\\\"Spatie\\\\MediaLibrary\\\\Models\\\\Media\\\";s:2:\\\"id\\\";i:4;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";}s:14:\\\"\\u0000*\\u0000onlyMissing\\\";b:0;s:6:\\\"\\u0000*\\u0000job\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:5:\\\"delay\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}\"}}',0,NULL,1625797574,1625797574),(5,'default','{\"displayName\":\"Spatie\\\\MediaLibrary\\\\Jobs\\\\PerformConversions\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"delay\":null,\"timeout\":null,\"timeoutAt\":null,\"data\":{\"commandName\":\"Spatie\\\\MediaLibrary\\\\Jobs\\\\PerformConversions\",\"command\":\"O:43:\\\"Spatie\\\\MediaLibrary\\\\Jobs\\\\PerformConversions\\\":11:{s:14:\\\"\\u0000*\\u0000conversions\\\";O:51:\\\"Spatie\\\\MediaLibrary\\\\Conversion\\\\ConversionCollection\\\":2:{s:8:\\\"\\u0000*\\u0000media\\\";N;s:8:\\\"\\u0000*\\u0000items\\\";a:1:{i:0;O:41:\\\"Spatie\\\\MediaLibrary\\\\Conversion\\\\Conversion\\\":7:{s:7:\\\"\\u0000*\\u0000name\\\";s:5:\\\"thumb\\\";s:28:\\\"\\u0000*\\u0000extractVideoFrameAtSecond\\\";i:0;s:16:\\\"\\u0000*\\u0000manipulations\\\";O:26:\\\"Spatie\\\\Image\\\\Manipulations\\\":1:{s:23:\\\"\\u0000*\\u0000manipulationSequence\\\";O:33:\\\"Spatie\\\\Image\\\\ManipulationSequence\\\":1:{s:9:\\\"\\u0000*\\u0000groups\\\";a:1:{i:0;a:3:{s:8:\\\"optimize\\\";s:341:\\\"{\\\"Spatie\\\\\\\\ImageOptimizer\\\\\\\\Optimizers\\\\\\\\Jpegoptim\\\":[\\\"--strip-all\\\",\\\"--all-progressive\\\"],\\\"Spatie\\\\\\\\ImageOptimizer\\\\\\\\Optimizers\\\\\\\\Pngquant\\\":[\\\"--force\\\"],\\\"Spatie\\\\\\\\ImageOptimizer\\\\\\\\Optimizers\\\\\\\\Optipng\\\":[\\\"-i0\\\",\\\"-o2\\\",\\\"-quiet\\\"],\\\"Spatie\\\\\\\\ImageOptimizer\\\\\\\\Optimizers\\\\\\\\Svgo\\\":[\\\"--disable=cleanupIDs\\\"],\\\"Spatie\\\\\\\\ImageOptimizer\\\\\\\\Optimizers\\\\\\\\Gifsicle\\\":[\\\"-b\\\",\\\"-O3\\\"]}\\\";s:6:\\\"format\\\";s:3:\\\"jpg\\\";s:5:\\\"width\\\";s:2:\\\"50\\\";}}}}s:23:\\\"\\u0000*\\u0000performOnCollections\\\";a:0:{}s:17:\\\"\\u0000*\\u0000performOnQueue\\\";b:1;s:26:\\\"\\u0000*\\u0000keepOriginalImageFormat\\\";b:0;s:27:\\\"\\u0000*\\u0000generateResponsiveImages\\\";b:0;}}}s:8:\\\"\\u0000*\\u0000media\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":4:{s:5:\\\"class\\\";s:32:\\\"Spatie\\\\MediaLibrary\\\\Models\\\\Media\\\";s:2:\\\"id\\\";i:5;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";}s:14:\\\"\\u0000*\\u0000onlyMissing\\\";b:0;s:6:\\\"\\u0000*\\u0000job\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:5:\\\"delay\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}\"}}',0,NULL,1625797574,1625797574),(6,'default','{\"displayName\":\"Spatie\\\\MediaLibrary\\\\Jobs\\\\PerformConversions\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"delay\":null,\"timeout\":null,\"timeoutAt\":null,\"data\":{\"commandName\":\"Spatie\\\\MediaLibrary\\\\Jobs\\\\PerformConversions\",\"command\":\"O:43:\\\"Spatie\\\\MediaLibrary\\\\Jobs\\\\PerformConversions\\\":11:{s:14:\\\"\\u0000*\\u0000conversions\\\";O:51:\\\"Spatie\\\\MediaLibrary\\\\Conversion\\\\ConversionCollection\\\":2:{s:8:\\\"\\u0000*\\u0000media\\\";N;s:8:\\\"\\u0000*\\u0000items\\\";a:1:{i:0;O:41:\\\"Spatie\\\\MediaLibrary\\\\Conversion\\\\Conversion\\\":7:{s:7:\\\"\\u0000*\\u0000name\\\";s:5:\\\"thumb\\\";s:28:\\\"\\u0000*\\u0000extractVideoFrameAtSecond\\\";i:0;s:16:\\\"\\u0000*\\u0000manipulations\\\";O:26:\\\"Spatie\\\\Image\\\\Manipulations\\\":1:{s:23:\\\"\\u0000*\\u0000manipulationSequence\\\";O:33:\\\"Spatie\\\\Image\\\\ManipulationSequence\\\":1:{s:9:\\\"\\u0000*\\u0000groups\\\";a:1:{i:0;a:3:{s:8:\\\"optimize\\\";s:341:\\\"{\\\"Spatie\\\\\\\\ImageOptimizer\\\\\\\\Optimizers\\\\\\\\Jpegoptim\\\":[\\\"--strip-all\\\",\\\"--all-progressive\\\"],\\\"Spatie\\\\\\\\ImageOptimizer\\\\\\\\Optimizers\\\\\\\\Pngquant\\\":[\\\"--force\\\"],\\\"Spatie\\\\\\\\ImageOptimizer\\\\\\\\Optimizers\\\\\\\\Optipng\\\":[\\\"-i0\\\",\\\"-o2\\\",\\\"-quiet\\\"],\\\"Spatie\\\\\\\\ImageOptimizer\\\\\\\\Optimizers\\\\\\\\Svgo\\\":[\\\"--disable=cleanupIDs\\\"],\\\"Spatie\\\\\\\\ImageOptimizer\\\\\\\\Optimizers\\\\\\\\Gifsicle\\\":[\\\"-b\\\",\\\"-O3\\\"]}\\\";s:6:\\\"format\\\";s:3:\\\"jpg\\\";s:5:\\\"width\\\";s:2:\\\"50\\\";}}}}s:23:\\\"\\u0000*\\u0000performOnCollections\\\";a:0:{}s:17:\\\"\\u0000*\\u0000performOnQueue\\\";b:1;s:26:\\\"\\u0000*\\u0000keepOriginalImageFormat\\\";b:0;s:27:\\\"\\u0000*\\u0000generateResponsiveImages\\\";b:0;}}}s:8:\\\"\\u0000*\\u0000media\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":4:{s:5:\\\"class\\\";s:32:\\\"Spatie\\\\MediaLibrary\\\\Models\\\\Media\\\";s:2:\\\"id\\\";i:6;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";}s:14:\\\"\\u0000*\\u0000onlyMissing\\\";b:0;s:6:\\\"\\u0000*\\u0000job\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:5:\\\"delay\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}\"}}',0,NULL,1625797574,1625797574),(7,'default','{\"displayName\":\"Spatie\\\\MediaLibrary\\\\Jobs\\\\PerformConversions\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"delay\":null,\"timeout\":null,\"timeoutAt\":null,\"data\":{\"commandName\":\"Spatie\\\\MediaLibrary\\\\Jobs\\\\PerformConversions\",\"command\":\"O:43:\\\"Spatie\\\\MediaLibrary\\\\Jobs\\\\PerformConversions\\\":11:{s:14:\\\"\\u0000*\\u0000conversions\\\";O:51:\\\"Spatie\\\\MediaLibrary\\\\Conversion\\\\ConversionCollection\\\":2:{s:8:\\\"\\u0000*\\u0000media\\\";N;s:8:\\\"\\u0000*\\u0000items\\\";a:1:{i:0;O:41:\\\"Spatie\\\\MediaLibrary\\\\Conversion\\\\Conversion\\\":7:{s:7:\\\"\\u0000*\\u0000name\\\";s:5:\\\"thumb\\\";s:28:\\\"\\u0000*\\u0000extractVideoFrameAtSecond\\\";i:0;s:16:\\\"\\u0000*\\u0000manipulations\\\";O:26:\\\"Spatie\\\\Image\\\\Manipulations\\\":1:{s:23:\\\"\\u0000*\\u0000manipulationSequence\\\";O:33:\\\"Spatie\\\\Image\\\\ManipulationSequence\\\":1:{s:9:\\\"\\u0000*\\u0000groups\\\";a:1:{i:0;a:3:{s:8:\\\"optimize\\\";s:341:\\\"{\\\"Spatie\\\\\\\\ImageOptimizer\\\\\\\\Optimizers\\\\\\\\Jpegoptim\\\":[\\\"--strip-all\\\",\\\"--all-progressive\\\"],\\\"Spatie\\\\\\\\ImageOptimizer\\\\\\\\Optimizers\\\\\\\\Pngquant\\\":[\\\"--force\\\"],\\\"Spatie\\\\\\\\ImageOptimizer\\\\\\\\Optimizers\\\\\\\\Optipng\\\":[\\\"-i0\\\",\\\"-o2\\\",\\\"-quiet\\\"],\\\"Spatie\\\\\\\\ImageOptimizer\\\\\\\\Optimizers\\\\\\\\Svgo\\\":[\\\"--disable=cleanupIDs\\\"],\\\"Spatie\\\\\\\\ImageOptimizer\\\\\\\\Optimizers\\\\\\\\Gifsicle\\\":[\\\"-b\\\",\\\"-O3\\\"]}\\\";s:6:\\\"format\\\";s:3:\\\"jpg\\\";s:5:\\\"width\\\";s:2:\\\"50\\\";}}}}s:23:\\\"\\u0000*\\u0000performOnCollections\\\";a:0:{}s:17:\\\"\\u0000*\\u0000performOnQueue\\\";b:1;s:26:\\\"\\u0000*\\u0000keepOriginalImageFormat\\\";b:0;s:27:\\\"\\u0000*\\u0000generateResponsiveImages\\\";b:0;}}}s:8:\\\"\\u0000*\\u0000media\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":4:{s:5:\\\"class\\\";s:32:\\\"Spatie\\\\MediaLibrary\\\\Models\\\\Media\\\";s:2:\\\"id\\\";i:7;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";}s:14:\\\"\\u0000*\\u0000onlyMissing\\\";b:0;s:6:\\\"\\u0000*\\u0000job\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:5:\\\"delay\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}\"}}',0,NULL,1625797575,1625797575),(8,'default','{\"displayName\":\"Spatie\\\\MediaLibrary\\\\Jobs\\\\PerformConversions\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"delay\":null,\"timeout\":null,\"timeoutAt\":null,\"data\":{\"commandName\":\"Spatie\\\\MediaLibrary\\\\Jobs\\\\PerformConversions\",\"command\":\"O:43:\\\"Spatie\\\\MediaLibrary\\\\Jobs\\\\PerformConversions\\\":11:{s:14:\\\"\\u0000*\\u0000conversions\\\";O:51:\\\"Spatie\\\\MediaLibrary\\\\Conversion\\\\ConversionCollection\\\":2:{s:8:\\\"\\u0000*\\u0000media\\\";N;s:8:\\\"\\u0000*\\u0000items\\\";a:1:{i:0;O:41:\\\"Spatie\\\\MediaLibrary\\\\Conversion\\\\Conversion\\\":7:{s:7:\\\"\\u0000*\\u0000name\\\";s:5:\\\"thumb\\\";s:28:\\\"\\u0000*\\u0000extractVideoFrameAtSecond\\\";i:0;s:16:\\\"\\u0000*\\u0000manipulations\\\";O:26:\\\"Spatie\\\\Image\\\\Manipulations\\\":1:{s:23:\\\"\\u0000*\\u0000manipulationSequence\\\";O:33:\\\"Spatie\\\\Image\\\\ManipulationSequence\\\":1:{s:9:\\\"\\u0000*\\u0000groups\\\";a:1:{i:0;a:3:{s:8:\\\"optimize\\\";s:341:\\\"{\\\"Spatie\\\\\\\\ImageOptimizer\\\\\\\\Optimizers\\\\\\\\Jpegoptim\\\":[\\\"--strip-all\\\",\\\"--all-progressive\\\"],\\\"Spatie\\\\\\\\ImageOptimizer\\\\\\\\Optimizers\\\\\\\\Pngquant\\\":[\\\"--force\\\"],\\\"Spatie\\\\\\\\ImageOptimizer\\\\\\\\Optimizers\\\\\\\\Optipng\\\":[\\\"-i0\\\",\\\"-o2\\\",\\\"-quiet\\\"],\\\"Spatie\\\\\\\\ImageOptimizer\\\\\\\\Optimizers\\\\\\\\Svgo\\\":[\\\"--disable=cleanupIDs\\\"],\\\"Spatie\\\\\\\\ImageOptimizer\\\\\\\\Optimizers\\\\\\\\Gifsicle\\\":[\\\"-b\\\",\\\"-O3\\\"]}\\\";s:6:\\\"format\\\";s:3:\\\"jpg\\\";s:5:\\\"width\\\";s:2:\\\"50\\\";}}}}s:23:\\\"\\u0000*\\u0000performOnCollections\\\";a:0:{}s:17:\\\"\\u0000*\\u0000performOnQueue\\\";b:1;s:26:\\\"\\u0000*\\u0000keepOriginalImageFormat\\\";b:0;s:27:\\\"\\u0000*\\u0000generateResponsiveImages\\\";b:0;}}}s:8:\\\"\\u0000*\\u0000media\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":4:{s:5:\\\"class\\\";s:32:\\\"Spatie\\\\MediaLibrary\\\\Models\\\\Media\\\";s:2:\\\"id\\\";i:8;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";}s:14:\\\"\\u0000*\\u0000onlyMissing\\\";b:0;s:6:\\\"\\u0000*\\u0000job\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:5:\\\"delay\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}\"}}',0,NULL,1625797575,1625797575);
/*!40000 ALTER TABLE `jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `likes`
--

DROP TABLE IF EXISTS `likes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `likes` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL COMMENT 'user_id',
  `likeable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `likeable_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `likes_likeable_type_likeable_id_index` (`likeable_type`,`likeable_id`),
  KEY `likes_user_id_index` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `likes`
--

LOCK TABLES `likes` WRITE;
/*!40000 ALTER TABLE `likes` DISABLE KEYS */;
/*!40000 ALTER TABLE `likes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ltm_translations`
--

DROP TABLE IF EXISTS `ltm_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ltm_translations` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `status` int NOT NULL DEFAULT '0',
  `locale` varchar(191) COLLATE utf8mb4_bin NOT NULL,
  `group` varchar(191) COLLATE utf8mb4_bin NOT NULL,
  `key` text COLLATE utf8mb4_bin NOT NULL,
  `value` text COLLATE utf8mb4_bin,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ltm_translations`
--

LOCK TABLES `ltm_translations` WRITE;
/*!40000 ALTER TABLE `ltm_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `ltm_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `media`
--

DROP TABLE IF EXISTS `media`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `media` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `model_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint unsigned NOT NULL,
  `collection_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `file_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mime_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `disk` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `size` bigint unsigned NOT NULL,
  `manipulations` json NOT NULL,
  `custom_properties` json NOT NULL,
  `responsive_images` json NOT NULL,
  `order_column` int unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `media_model_type_model_id_index` (`model_type`,`model_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `media`
--

LOCK TABLES `media` WRITE;
/*!40000 ALTER TABLE `media` DISABLE KEYS */;
INSERT INTO `media` VALUES (1,'Vtlabs\\Category\\Models\\Category',1,'images','200','200.png','image/png','public',781,'[]','[]','[]',1,'2021-07-08 20:56:12','2021-07-08 20:56:12'),(2,'Vtlabs\\Category\\Models\\Category',5,'images','200','200.png','image/png','public',781,'[]','[]','[]',2,'2021-07-08 20:56:12','2021-07-08 20:56:12'),(3,'Vtlabs\\Banner\\Models\\Banner',1,'images','200','200.png','image/png','public',781,'[]','[]','[]',3,'2021-07-08 20:56:12','2021-07-08 20:56:12'),(4,'Vtlabs\\Banner\\Models\\Banner',2,'images','200','200.png','image/png','public',781,'[]','[]','[]',4,'2021-07-08 20:56:14','2021-07-08 20:56:14'),(5,'Vtlabs\\Banner\\Models\\Banner',3,'images','200','200.png','image/png','public',781,'[]','[]','[]',5,'2021-07-08 20:56:14','2021-07-08 20:56:14'),(6,'Vtlabs\\Banner\\Models\\Banner',4,'images','200','200.png','image/png','public',781,'[]','[]','[]',6,'2021-07-08 20:56:14','2021-07-08 20:56:14'),(7,'Vtlabs\\Banner\\Models\\Banner',5,'images','200','200.png','image/png','public',781,'[]','[]','[]',7,'2021-07-08 20:56:15','2021-07-08 20:56:15'),(8,'Vtlabs\\Banner\\Models\\Banner',6,'images','200','200.png','image/png','public',781,'[]','[]','[]',8,'2021-07-08 20:56:15','2021-07-08 20:56:15');
/*!40000 ALTER TABLE `media` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'2014_04_02_193005_create_translations_table',1),(2,'2016_06_01_000001_create_oauth_auth_codes_table',1),(3,'2016_06_01_000002_create_oauth_access_tokens_table',1),(4,'2016_06_01_000003_create_oauth_refresh_tokens_table',1),(5,'2016_06_01_000004_create_oauth_clients_table',1),(6,'2016_06_01_000005_create_oauth_personal_access_clients_table',1),(7,'2018_06_07_123211_plans',1),(8,'2018_07_14_183253_create_table_appointments',1),(9,'2018_07_14_183253_payment_methods',1),(10,'2018_07_14_183253_payments',1),(11,'2018_07_14_183253_ratings',1),(12,'2018_07_14_183254_alter_payment_methods',1),(13,'2018_08_08_100000_create_telescope_entries_table',1),(14,'2018_12_14_000000_create_likes_table',1),(15,'2019_06_07_123211_plans_metadata',1),(16,'2020_04_04_000000_create_user_follower_table',1),(17,'2020_05_02_000545_create_permission_tables',1),(18,'2020_05_05_002400_create_statuses_table',1),(19,'2020_05_05_122859_create_media_table',1),(20,'2020_07_04_142129_create_favorites_table',1),(21,'2020_07_09_150356_create_banners_table',1),(22,'2020_07_09_150356_create_faqs_table',1),(23,'2020_07_09_150356_create_reports_table',1),(24,'2020_07_09_150356_create_supports_table',1),(25,'2021_04_12_232757_create_jobs_table',1),(26,'2050_01_01_000005_create_users_table',1),(27,'2050_01_01_000010_create_password_resets_table',1),(28,'2050_01_01_000015_create_settings_table',1),(29,'2050_01_01_000020_create_activity_logs_table',1),(30,'2050_01_01_000025_create_notifications_table',1),(31,'2051_01_01_000010_create_addresses_table',1),(32,'2051_01_01_000020_create_categories_table',1),(33,'2051_01_01_000030_create_vendors_table',1),(34,'2051_01_01_000035_create_delivery_profiles_table',1),(35,'2051_01_01_000038_create_attributes_table',1),(36,'2051_01_01_000040_create_products_table',1),(37,'2051_01_01_000042_create_vendor_products_table',1),(38,'2051_01_01_000044_create_vendor_product_categories_table',1),(39,'2051_01_01_000050_create_order_conditions_table',1),(40,'2051_01_01_000060_create_orders_table',1),(41,'2051_01_01_000070_create_order_deliveries_table',1),(42,'2051_01_01_000080_create_order_addresses_table',1),(43,'2051_01_01_000100_create_order_products_table',1),(44,'2051_01_01_000110_create_order_product_addons_table',1),(45,'2051_01_01_000120_create_coupons_table',1),(46,'2051_01_01_000130_create_delivery_order_requests_table',1),(47,'2051_01_01_000200_create_category_preferences_table',1),(48,'2051_01_01_000200_create_hospitals_table',1),(49,'2051_01_01_000210_create_doctors_table',1),(50,'2051_01_01_000215_create_availabilities_table',1),(51,'2051_01_01_000220_create_doctors_types_table',1),(52,'2051_01_01_000225_create_hospital_services_table',1),(53,'2051_01_01_000230_create_hospital_availabilities_table',1),(54,'2051_01_01_000510_alter_orders_add_distance_travelled_table',1),(55,'2051_01_01_000550_alter_products_add_sells_count',1),(56,'2052_02_20_113000_create_wallets_table',1),(57,'2052_02_20_113500_create_wallet_transactions_table',1);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `model_has_permissions`
--

DROP TABLE IF EXISTS `model_has_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `model_has_permissions` (
  `permission_id` bigint unsigned NOT NULL,
  `model_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`),
  CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `model_has_permissions`
--

LOCK TABLES `model_has_permissions` WRITE;
/*!40000 ALTER TABLE `model_has_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `model_has_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `model_has_roles`
--

DROP TABLE IF EXISTS `model_has_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `model_has_roles` (
  `role_id` bigint unsigned NOT NULL,
  `model_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`),
  CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `model_has_roles`
--

LOCK TABLES `model_has_roles` WRITE;
/*!40000 ALTER TABLE `model_has_roles` DISABLE KEYS */;
INSERT INTO `model_has_roles` VALUES (1,'Vtlabs\\Core\\Models\\User\\User',1);
/*!40000 ALTER TABLE `model_has_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notifications`
--

DROP TABLE IF EXISTS `notifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `notifications` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `text` text COLLATE utf8mb4_unicode_ci,
  `meta` json DEFAULT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` int unsigned DEFAULT NULL,
  `from_user_id` int unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `notifications_user_id_foreign` (`user_id`),
  KEY `notifications_from_user_id_foreign` (`from_user_id`),
  CONSTRAINT `notifications_from_user_id_foreign` FOREIGN KEY (`from_user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `notifications_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notifications`
--

LOCK TABLES `notifications` WRITE;
/*!40000 ALTER TABLE `notifications` DISABLE KEYS */;
/*!40000 ALTER TABLE `notifications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_access_tokens`
--

DROP TABLE IF EXISTS `oauth_access_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `oauth_access_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint unsigned DEFAULT NULL,
  `client_id` bigint unsigned NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_access_tokens_user_id_index` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_access_tokens`
--

LOCK TABLES `oauth_access_tokens` WRITE;
/*!40000 ALTER TABLE `oauth_access_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth_access_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_auth_codes`
--

DROP TABLE IF EXISTS `oauth_auth_codes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `oauth_auth_codes` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint unsigned NOT NULL,
  `client_id` bigint unsigned NOT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_auth_codes_user_id_index` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_auth_codes`
--

LOCK TABLES `oauth_auth_codes` WRITE;
/*!40000 ALTER TABLE `oauth_auth_codes` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth_auth_codes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_clients`
--

DROP TABLE IF EXISTS `oauth_clients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `oauth_clients` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `secret` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `redirect` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_clients_user_id_index` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_clients`
--

LOCK TABLES `oauth_clients` WRITE;
/*!40000 ALTER TABLE `oauth_clients` DISABLE KEYS */;
INSERT INTO `oauth_clients` VALUES (1,NULL,'Doctoworld Personal Access Client','HquNRJ164Uo86X5nIkFgdliVCM67UnQ0bkNeV7qY','http://localhost',1,0,0,'2021-07-08 20:56:15','2021-07-08 20:56:15'),(2,NULL,'Doctoworld Password Grant Client','5kBu9K1T16nlfuDrNciTVFGV8G8jQAMaJvkfnTR4','http://localhost',0,1,0,'2021-07-08 20:56:15','2021-07-08 20:56:15');
/*!40000 ALTER TABLE `oauth_clients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_personal_access_clients`
--

DROP TABLE IF EXISTS `oauth_personal_access_clients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `oauth_personal_access_clients` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `client_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_personal_access_clients`
--

LOCK TABLES `oauth_personal_access_clients` WRITE;
/*!40000 ALTER TABLE `oauth_personal_access_clients` DISABLE KEYS */;
INSERT INTO `oauth_personal_access_clients` VALUES (1,1,'2021-07-08 20:56:15','2021-07-08 20:56:15');
/*!40000 ALTER TABLE `oauth_personal_access_clients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_refresh_tokens`
--

DROP TABLE IF EXISTS `oauth_refresh_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `oauth_refresh_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `access_token_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_refresh_tokens`
--

LOCK TABLES `oauth_refresh_tokens` WRITE;
/*!40000 ALTER TABLE `oauth_refresh_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth_refresh_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_resets`
--

LOCK TABLES `password_resets` WRITE;
/*!40000 ALTER TABLE `password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_resets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment_methods`
--

DROP TABLE IF EXISTS `payment_methods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payment_methods` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` json NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `type` enum('prepaid','postpaid') COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `meta` json DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `payment_methods_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment_methods`
--

LOCK TABLES `payment_methods` WRITE;
/*!40000 ALTER TABLE `payment_methods` DISABLE KEYS */;
INSERT INTO `payment_methods` VALUES (1,'cod','{\"en\": \"Cash On Delivery\"}',1,'postpaid','2021-07-08 20:56:12','2021-07-08 20:56:12',NULL);
/*!40000 ALTER TABLE `payment_methods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payments`
--

DROP TABLE IF EXISTS `payments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payments` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `payable_id` int NOT NULL,
  `payable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payer_id` int DEFAULT NULL,
  `payer_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `amount` decimal(9,2) NOT NULL,
  `payment_method_id` int unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `payments_payment_method_id_foreign` (`payment_method_id`),
  CONSTRAINT `payments_payment_method_id_foreign` FOREIGN KEY (`payment_method_id`) REFERENCES `payment_methods` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payments`
--

LOCK TABLES `payments` WRITE;
/*!40000 ALTER TABLE `payments` DISABLE KEYS */;
/*!40000 ALTER TABLE `payments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permissions`
--

DROP TABLE IF EXISTS `permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `permissions` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permissions`
--

LOCK TABLES `permissions` WRITE;
/*!40000 ALTER TABLE `permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `plans`
--

DROP TABLE IF EXISTS `plans`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `plans` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `price` double(8,2) NOT NULL,
  `currency` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `duration` int NOT NULL DEFAULT '30',
  `metadata` mediumtext COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plans`
--

LOCK TABLES `plans` WRITE;
/*!40000 ALTER TABLE `plans` DISABLE KEYS */;
/*!40000 ALTER TABLE `plans` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `plans_features`
--

DROP TABLE IF EXISTS `plans_features`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `plans_features` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `plan_id` int NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `type` enum('feature','limit') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'feature',
  `limit` int NOT NULL DEFAULT '0',
  `metadata` mediumtext COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plans_features`
--

LOCK TABLES `plans_features` WRITE;
/*!40000 ALTER TABLE `plans_features` DISABLE KEYS */;
/*!40000 ALTER TABLE `plans_features` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `plans_subscriptions`
--

DROP TABLE IF EXISTS `plans_subscriptions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `plans_subscriptions` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `plan_id` int NOT NULL,
  `model_id` int NOT NULL,
  `model_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payment_method` enum('stripe') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_paid` tinyint(1) NOT NULL DEFAULT '0',
  `charging_price` double(8,2) DEFAULT NULL,
  `charging_currency` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_recurring` tinyint(1) NOT NULL DEFAULT '1',
  `recurring_each_days` int NOT NULL DEFAULT '30',
  `starts_on` timestamp NULL DEFAULT NULL,
  `expires_on` timestamp NULL DEFAULT NULL,
  `cancelled_on` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plans_subscriptions`
--

LOCK TABLES `plans_subscriptions` WRITE;
/*!40000 ALTER TABLE `plans_subscriptions` DISABLE KEYS */;
/*!40000 ALTER TABLE `plans_subscriptions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `plans_usages`
--

DROP TABLE IF EXISTS `plans_usages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `plans_usages` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `subscription_id` int NOT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `used` double(9,2) NOT NULL DEFAULT '0.00',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plans_usages`
--

LOCK TABLES `plans_usages` WRITE;
/*!40000 ALTER TABLE `plans_usages` DISABLE KEYS */;
/*!40000 ALTER TABLE `plans_usages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ratings`
--

DROP TABLE IF EXISTS `ratings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ratings` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `review` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `rateable_id` int NOT NULL,
  `rateable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `rater_id` int DEFAULT NULL,
  `rater_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `rating` double(9,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ratings`
--

LOCK TABLES `ratings` WRITE;
/*!40000 ALTER TABLE `ratings` DISABLE KEYS */;
/*!40000 ALTER TABLE `ratings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reports`
--

DROP TABLE IF EXISTS `reports`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reports` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `reportable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `reportable_id` bigint unsigned NOT NULL,
  `reporter_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `reporter_id` bigint unsigned NOT NULL,
  `reason` text COLLATE utf8mb4_unicode_ci,
  `meta` json DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `reports_reportable_type_reportable_id_index` (`reportable_type`,`reportable_id`),
  KEY `reports_reporter_type_reporter_id_index` (`reporter_type`,`reporter_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reports`
--

LOCK TABLES `reports` WRITE;
/*!40000 ALTER TABLE `reports` DISABLE KEYS */;
/*!40000 ALTER TABLE `reports` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role_has_permissions`
--

DROP TABLE IF EXISTS `role_has_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `role_has_permissions` (
  `permission_id` bigint unsigned NOT NULL,
  `role_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`role_id`),
  KEY `role_has_permissions_role_id_foreign` (`role_id`),
  CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role_has_permissions`
--

LOCK TABLES `role_has_permissions` WRITE;
/*!40000 ALTER TABLE `role_has_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `role_has_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'admin','api','2021-07-08 20:56:11','2021-07-08 20:56:11'),(2,'customer','api','2021-07-08 20:56:11','2021-07-08 20:56:11'),(3,'vendor','api','2021-07-08 20:56:11','2021-07-08 20:56:11'),(4,'doctor','api','2021-07-08 20:56:11','2021-07-08 20:56:11'),(5,'delivery','api','2021-07-08 20:56:11','2021-07-08 20:56:11');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `settings`
--

DROP TABLE IF EXISTS `settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `settings` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` enum('string','text','json','numeric','boolean') COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `settings_key_unique` (`key`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `settings`
--

LOCK TABLES `settings` WRITE;
/*!40000 ALTER TABLE `settings` DISABLE KEYS */;
INSERT INTO `settings` VALUES (1,'currency_code','USD','string'),(2,'currency_icon','$','string'),(3,'tax_in_percent','10','string'),(4,'support_email','admin@example.com','string'),(5,'support_phone','8181818118','string'),(6,'delivery_fee','25','string'),(7,'delivery_fee_set_by','admin','string'),(8,'delivery_fee_per_km_charge','5','string'),(9,'delivery_distance','8000','string'),(10,'distance_metric','KM','string'),(11,'refer_amount','50','string'),(12,'privacy_policy','Demo privacy policy','string'),(13,'about_us','Demo privacy policy','string'),(14,'terms','Demo Terms and Condition','string'),(15,'admin_commision_value','10','string'),(16,'schedule_interval_in_minutes','30','string');
/*!40000 ALTER TABLE `settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `statuses`
--

DROP TABLE IF EXISTS `statuses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `statuses` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `reason` text COLLATE utf8mb4_unicode_ci,
  `model_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `statuses_model_type_model_id_index` (`model_type`,`model_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `statuses`
--

LOCK TABLES `statuses` WRITE;
/*!40000 ALTER TABLE `statuses` DISABLE KEYS */;
/*!40000 ALTER TABLE `statuses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stripe_customers`
--

DROP TABLE IF EXISTS `stripe_customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stripe_customers` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `model_id` int NOT NULL,
  `model_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `customer_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stripe_customers`
--

LOCK TABLES `stripe_customers` WRITE;
/*!40000 ALTER TABLE `stripe_customers` DISABLE KEYS */;
/*!40000 ALTER TABLE `stripe_customers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `supports`
--

DROP TABLE IF EXISTS `supports`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `supports` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `message` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta` json DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `supports`
--

LOCK TABLES `supports` WRITE;
/*!40000 ALTER TABLE `supports` DISABLE KEYS */;
/*!40000 ALTER TABLE `supports` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `telescope_entries`
--

DROP TABLE IF EXISTS `telescope_entries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `telescope_entries` (
  `sequence` bigint unsigned NOT NULL AUTO_INCREMENT,
  `uuid` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch_id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `family_hash` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `should_display_on_index` tinyint(1) NOT NULL DEFAULT '1',
  `type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime DEFAULT NULL,
  PRIMARY KEY (`sequence`),
  UNIQUE KEY `telescope_entries_uuid_unique` (`uuid`),
  KEY `telescope_entries_batch_id_index` (`batch_id`),
  KEY `telescope_entries_family_hash_index` (`family_hash`),
  KEY `telescope_entries_created_at_index` (`created_at`),
  KEY `telescope_entries_type_should_display_on_index_index` (`type`,`should_display_on_index`)
) ENGINE=InnoDB AUTO_INCREMENT=358 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `telescope_entries`
--

LOCK TABLES `telescope_entries` WRITE;
/*!40000 ALTER TABLE `telescope_entries` DISABLE KEYS */;
INSERT INTO `telescope_entries` VALUES (1,'93dd8ca7-a2d2-44aa-9cd3-4e1e1ed4d58e','93dd8cb2-571c-4c73-bf61-06004c49203b',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"SHOW FULL TABLES WHERE table_type = \'BASE TABLE\'\",\"time\":\"214.85\",\"slow\":true,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/doctoworld\\/doctoworld\\/artisan\",\"line\":35,\"hash\":\"6f829d6126b80ce8ebe0bf8bda994397\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-07-09 02:26:08'),(2,'93dd8ca7-a40a-4c16-9ad2-098aa9acef92','93dd8cb2-571c-4c73-bf61-06004c49203b',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"SET FOREIGN_KEY_CHECKS=0;\",\"time\":\"0.79\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/doctoworld\\/doctoworld\\/artisan\",\"line\":35,\"hash\":\"9c5164ece4bf39898f83f37fb558d94e\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-07-09 02:26:08'),(3,'93dd8ca8-7916-44f1-9af9-7d1f5c1c24d0','93dd8cb2-571c-4c73-bf61-06004c49203b',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"drop table `activity_logs`,`appointments`,`banners`,`categories`,`category_preferences`,`doctor_availabilities`,`doctor_donors`,`doctor_hospital_availabilities`,`doctor_hospital_services`,`doctor_hospitals`,`doctor_profiles`,`doctor_profiles_degrees`,`doctor_profiles_hospitals`,`doctor_profiles_services`,`doctor_profiles_specializations`,`doctor_profiles_types`,`ecommerce_addresses`,`ecommerce_attribute_terms`,`ecommerce_attributes`,`ecommerce_coupons`,`ecommerce_coupons_users`,`ecommerce_delivery_order_requests`,`ecommerce_delivery_profiles`,`ecommerce_order_addresses`,`ecommerce_order_conditions`,`ecommerce_order_deliveries`,`ecommerce_order_product_addons`,`ecommerce_order_products`,`ecommerce_orders`,`ecommerce_product_addon_choices`,`ecommerce_product_addon_groups`,`ecommerce_product_categories`,`ecommerce_products`,`ecommerce_vendor_categories`,`ecommerce_vendor_product_categories`,`ecommerce_vendor_products`,`ecommerce_vendors`,`faqs`,`favorites`,`jobs`,`likes`,`ltm_translations`,`media`,`migrations`,`model_has_permissions`,`model_has_roles`,`notifications`,`oauth_access_tokens`,`oauth_auth_codes`,`oauth_clients`,`oauth_personal_access_clients`,`oauth_refresh_tokens`,`password_resets`,`payment_methods`,`payments`,`permissions`,`plans`,`plans_features`,`plans_subscriptions`,`plans_usages`,`ratings`,`role_has_permissions`,`roles`,`settings`,`statuses`,`stripe_customers`,`supports`,`telescope_entries`,`telescope_entries_tags`,`telescope_monitoring`,`user_follower`,`users`,`wallet_transactions`,`wallets`\",\"time\":\"544.95\",\"slow\":true,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/doctoworld\\/doctoworld\\/artisan\",\"line\":35,\"hash\":\"853bcdea80d538a2cad1452dfcd40351\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-07-09 02:26:09'),(4,'93dd8ca8-793e-47d3-b60d-55ad829958a8','93dd8cb2-571c-4c73-bf61-06004c49203b',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"SET FOREIGN_KEY_CHECKS=1;\",\"time\":\"0.16\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/doctoworld\\/doctoworld\\/artisan\",\"line\":35,\"hash\":\"ff8d2195509c14c72a84fc4ea05c636c\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-07-09 02:26:09'),(5,'93dd8ca8-7a1f-4b60-9baf-12d351b60dbb','93dd8cb2-571c-4c73-bf61-06004c49203b',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"select * from information_schema.tables where table_schema = \'doctoworld\' and table_name = \'migrations\' and table_type = \'BASE TABLE\'\",\"time\":\"1.67\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/doctoworld\\/doctoworld\\/artisan\",\"line\":35,\"hash\":\"ad7d07e5104cadcc6e9623dfc5fefdd8\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-07-09 02:26:09'),(6,'93dd8ca8-7eab-4b08-b66d-3be35353f392','93dd8cb2-571c-4c73-bf61-06004c49203b',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"create table `migrations` (`id` int unsigned not null auto_increment primary key, `migration` varchar(191) not null, `batch` int not null) default character set utf8mb4 collate \'utf8mb4_unicode_ci\'\",\"time\":\"10.07\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/doctoworld\\/doctoworld\\/artisan\",\"line\":35,\"hash\":\"dca3ddae9e8bbcd341293787e8610ea0\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-07-09 02:26:09'),(7,'93dd8ca8-81cd-4e9b-8291-b9a2c5aeb738','93dd8cb2-571c-4c73-bf61-06004c49203b',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"select `migration` from `migrations` order by `batch` asc, `migration` asc\",\"time\":\"0.87\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/doctoworld\\/doctoworld\\/artisan\",\"line\":35,\"hash\":\"ed08a59c7f0b8851f0fd2291ca94d5c7\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-07-09 02:26:09'),(8,'93dd8ca8-8528-49cb-830a-910fd75b6ba5','93dd8cb2-571c-4c73-bf61-06004c49203b',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"select max(`batch`) as aggregate from `migrations`\",\"time\":\"1.67\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/doctoworld\\/doctoworld\\/artisan\",\"line\":35,\"hash\":\"06e60d7b3d1a0c2de504de4e6f27735e\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-07-09 02:26:09'),(9,'93dd8ca8-88d1-4ef0-9679-b7594e9d8536','93dd8cb2-571c-4c73-bf61-06004c49203b',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"create table `ltm_translations` (`id` bigint unsigned not null auto_increment primary key, `status` int not null default \'0\', `locale` varchar(191) not null, `group` varchar(191) not null, `key` text not null, `value` text null, `created_at` timestamp null, `updated_at` timestamp null) default character set utf8mb4 collate \'utf8mb4_bin\'\",\"time\":\"8.25\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/doctoworld\\/doctoworld\\/database\\/migrations\\/2014_04_02_193005_create_translations_table.php\",\"line\":25,\"hash\":\"cfea85ef3381b8874207e9e9e5b9c13a\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-07-09 02:26:09'),(10,'93dd8ca8-8982-47ef-be47-17fcbfc7ada1','93dd8cb2-571c-4c73-bf61-06004c49203b',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"insert into `migrations` (`migration`, `batch`) values (\'2014_04_02_193005_create_translations_table\', 1)\",\"time\":\"1.28\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/doctoworld\\/doctoworld\\/artisan\",\"line\":35,\"hash\":\"f2b8e8e4266db16aec6db940c643eb68\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-07-09 02:26:09'),(11,'93dd8ca8-8ccc-4316-b4dd-02fc90dd579c','93dd8cb2-571c-4c73-bf61-06004c49203b',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"create table `oauth_auth_codes` (`id` varchar(100) not null, `user_id` bigint unsigned not null, `client_id` bigint unsigned not null, `scopes` text null, `revoked` tinyint(1) not null, `expires_at` datetime null) default character set utf8mb4 collate \'utf8mb4_unicode_ci\'\",\"time\":\"7.89\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/doctoworld\\/doctoworld\\/database\\/migrations\\/2016_06_01_000001_create_oauth_auth_codes_table.php\",\"line\":23,\"hash\":\"6aa061f0fc61b1fd026b5d2bebdf3449\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-07-09 02:26:09'),(12,'93dd8ca8-91ea-4396-bbab-a7c20026834c','93dd8cb2-571c-4c73-bf61-06004c49203b',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"alter table `oauth_auth_codes` add primary key `oauth_auth_codes_id_primary`(`id`)\",\"time\":\"12.89\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/doctoworld\\/doctoworld\\/database\\/migrations\\/2016_06_01_000001_create_oauth_auth_codes_table.php\",\"line\":23,\"hash\":\"1adb39f917be92744b1c913f3c50cc25\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-07-09 02:26:09'),(13,'93dd8ca8-948b-4eaa-918e-7f1933d8bead','93dd8cb2-571c-4c73-bf61-06004c49203b',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"alter table `oauth_auth_codes` add index `oauth_auth_codes_user_id_index`(`user_id`)\",\"time\":\"6.50\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/doctoworld\\/doctoworld\\/database\\/migrations\\/2016_06_01_000001_create_oauth_auth_codes_table.php\",\"line\":23,\"hash\":\"672329a8ecc84bf315ed3624dd041214\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-07-09 02:26:09'),(14,'93dd8ca8-94ee-49d0-8175-b1f16f716bc0','93dd8cb2-571c-4c73-bf61-06004c49203b',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"insert into `migrations` (`migration`, `batch`) values (\'2016_06_01_000001_create_oauth_auth_codes_table\', 1)\",\"time\":\"0.67\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/doctoworld\\/doctoworld\\/artisan\",\"line\":35,\"hash\":\"f2b8e8e4266db16aec6db940c643eb68\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-07-09 02:26:09'),(15,'93dd8ca8-9728-4540-9eda-cc108dc3f144','93dd8cb2-571c-4c73-bf61-06004c49203b',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"create table `oauth_access_tokens` (`id` varchar(100) not null, `user_id` bigint unsigned null, `client_id` bigint unsigned not null, `name` varchar(191) null, `scopes` text null, `revoked` tinyint(1) not null, `created_at` timestamp null, `updated_at` timestamp null, `expires_at` datetime null) default character set utf8mb4 collate \'utf8mb4_unicode_ci\'\",\"time\":\"5.19\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/doctoworld\\/doctoworld\\/database\\/migrations\\/2016_06_01_000002_create_oauth_access_tokens_table.php\",\"line\":25,\"hash\":\"944d905f87d4be029af74c95415d0273\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-07-09 02:26:09'),(16,'93dd8ca8-9bec-4d55-b848-b69c9c0a392e','93dd8cb2-571c-4c73-bf61-06004c49203b',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"alter table `oauth_access_tokens` add primary key `oauth_access_tokens_id_primary`(`id`)\",\"time\":\"11.95\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/doctoworld\\/doctoworld\\/database\\/migrations\\/2016_06_01_000002_create_oauth_access_tokens_table.php\",\"line\":25,\"hash\":\"6b7c78e2920404ce91d36f8d8c8307ba\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-07-09 02:26:09'),(17,'93dd8ca8-9e9b-4ac8-ab35-76d7b61a8f04','93dd8cb2-571c-4c73-bf61-06004c49203b',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"alter table `oauth_access_tokens` add index `oauth_access_tokens_user_id_index`(`user_id`)\",\"time\":\"6.57\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/doctoworld\\/doctoworld\\/database\\/migrations\\/2016_06_01_000002_create_oauth_access_tokens_table.php\",\"line\":25,\"hash\":\"c1b15baef8790b12f521213dbe280686\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-07-09 02:26:09'),(18,'93dd8ca8-9f64-4d5e-9e0c-5674ada3aaaf','93dd8cb2-571c-4c73-bf61-06004c49203b',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"insert into `migrations` (`migration`, `batch`) values (\'2016_06_01_000002_create_oauth_access_tokens_table\', 1)\",\"time\":\"1.64\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/doctoworld\\/doctoworld\\/artisan\",\"line\":35,\"hash\":\"f2b8e8e4266db16aec6db940c643eb68\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-07-09 02:26:09'),(19,'93dd8ca8-a252-4d6e-bbc0-503e14a197af','93dd8cb2-571c-4c73-bf61-06004c49203b',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"create table `oauth_refresh_tokens` (`id` varchar(100) not null, `access_token_id` varchar(100) not null, `revoked` tinyint(1) not null, `expires_at` datetime null) default character set utf8mb4 collate \'utf8mb4_unicode_ci\'\",\"time\":\"6.97\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/doctoworld\\/doctoworld\\/database\\/migrations\\/2016_06_01_000003_create_oauth_refresh_tokens_table.php\",\"line\":21,\"hash\":\"ac33fb223db31a26b02fb622cf82ca04\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-07-09 02:26:09'),(20,'93dd8ca8-a633-43b2-87e2-023cee2b5f31','93dd8cb2-571c-4c73-bf61-06004c49203b',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"alter table `oauth_refresh_tokens` add primary key `oauth_refresh_tokens_id_primary`(`id`)\",\"time\":\"9.70\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/doctoworld\\/doctoworld\\/database\\/migrations\\/2016_06_01_000003_create_oauth_refresh_tokens_table.php\",\"line\":21,\"hash\":\"ee33f1fe3e4cecba8aef8bd5cad6b706\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-07-09 02:26:09'),(21,'93dd8ca8-a702-40ea-8070-59faee3d48e5','93dd8cb2-571c-4c73-bf61-06004c49203b',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"insert into `migrations` (`migration`, `batch`) values (\'2016_06_01_000003_create_oauth_refresh_tokens_table\', 1)\",\"time\":\"1.71\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/doctoworld\\/doctoworld\\/artisan\",\"line\":35,\"hash\":\"f2b8e8e4266db16aec6db940c643eb68\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-07-09 02:26:09'),(22,'93dd8ca8-a9f4-4728-bca9-673aa21558ad','93dd8cb2-571c-4c73-bf61-06004c49203b',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"create table `oauth_clients` (`id` bigint unsigned not null auto_increment primary key, `user_id` bigint unsigned null, `name` varchar(191) not null, `secret` varchar(100) null, `redirect` text not null, `personal_access_client` tinyint(1) not null, `password_client` tinyint(1) not null, `revoked` tinyint(1) not null, `created_at` timestamp null, `updated_at` timestamp null) default character set utf8mb4 collate \'utf8mb4_unicode_ci\'\",\"time\":\"6.98\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/doctoworld\\/doctoworld\\/database\\/migrations\\/2016_06_01_000004_create_oauth_clients_table.php\",\"line\":26,\"hash\":\"d65cf8b670d3f295b884c5f1a0c2f214\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-07-09 02:26:09'),(23,'93dd8ca8-ac41-4a09-b15b-0b2f3a043a65','93dd8cb2-571c-4c73-bf61-06004c49203b',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"alter table `oauth_clients` add index `oauth_clients_user_id_index`(`user_id`)\",\"time\":\"5.67\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/doctoworld\\/doctoworld\\/database\\/migrations\\/2016_06_01_000004_create_oauth_clients_table.php\",\"line\":26,\"hash\":\"d80805c01983b9f1402e5c83cc8fca13\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-07-09 02:26:09'),(24,'93dd8ca8-aca2-4ac1-b718-f75df6753bcf','93dd8cb2-571c-4c73-bf61-06004c49203b',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"insert into `migrations` (`migration`, `batch`) values (\'2016_06_01_000004_create_oauth_clients_table\', 1)\",\"time\":\"0.64\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/doctoworld\\/doctoworld\\/artisan\",\"line\":35,\"hash\":\"f2b8e8e4266db16aec6db940c643eb68\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-07-09 02:26:09'),(25,'93dd8ca8-aec6-4943-9f5e-9b34b3df24f3','93dd8cb2-571c-4c73-bf61-06004c49203b',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"create table `oauth_personal_access_clients` (`id` bigint unsigned not null auto_increment primary key, `client_id` bigint unsigned not null, `created_at` timestamp null, `updated_at` timestamp null) default character set utf8mb4 collate \'utf8mb4_unicode_ci\'\",\"time\":\"5.04\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/doctoworld\\/doctoworld\\/database\\/migrations\\/2016_06_01_000005_create_oauth_personal_access_clients_table.php\",\"line\":20,\"hash\":\"e0d623a5cea9359b37b49a3525a26391\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-07-09 02:26:09'),(26,'93dd8ca8-af1c-48c4-9bfa-1eb1fecf5383','93dd8cb2-571c-4c73-bf61-06004c49203b',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"insert into `migrations` (`migration`, `batch`) values (\'2016_06_01_000005_create_oauth_personal_access_clients_table\', 1)\",\"time\":\"0.55\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/doctoworld\\/doctoworld\\/artisan\",\"line\":35,\"hash\":\"f2b8e8e4266db16aec6db940c643eb68\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-07-09 02:26:09'),(27,'93dd8ca8-b161-4a83-b8b8-29170203b8f5','93dd8cb2-571c-4c73-bf61-06004c49203b',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"create table `plans` (`id` int unsigned not null auto_increment primary key, `name` varchar(191) not null, `description` text null, `price` double(8, 2) not null, `currency` varchar(191) not null, `duration` int not null default \'30\', `created_at` timestamp null, `updated_at` timestamp null) default character set utf8mb4 collate \'utf8mb4_unicode_ci\'\",\"time\":\"5.35\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/doctoworld\\/doctoworld\\/database\\/migrations\\/2018_06_07_123211_plans.php\",\"line\":28,\"hash\":\"b6dbce85daee2ab58c42b66691142812\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-07-09 02:26:09'),(28,'93dd8ca8-b453-4938-a9c9-e0de29705398','93dd8cb2-571c-4c73-bf61-06004c49203b',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"create table `plans_features` (`id` int unsigned not null auto_increment primary key, `plan_id` int not null, `name` varchar(191) not null, `code` varchar(191) not null, `description` text null, `type` enum(\'feature\', \'limit\') not null default \'feature\', `limit` int not null default \'0\', `created_at` timestamp null, `updated_at` timestamp null) default character set utf8mb4 collate \'utf8mb4_unicode_ci\'\",\"time\":\"7.15\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/doctoworld\\/doctoworld\\/database\\/migrations\\/2018_06_07_123211_plans.php\",\"line\":42,\"hash\":\"26a9fc2ede795a997bbb1a1cd3ecd7a5\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-07-09 02:26:09'),(29,'93dd8ca8-b6e5-4f26-bf62-bf48800cc485','93dd8cb2-571c-4c73-bf61-06004c49203b',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"create table `plans_subscriptions` (`id` int unsigned not null auto_increment primary key, `plan_id` int not null, `model_id` int not null, `model_type` varchar(191) not null, `payment_method` enum(\'stripe\') null, `is_paid` tinyint(1) not null default \'0\', `charging_price` double(8, 2) null, `charging_currency` varchar(191) null, `is_recurring` tinyint(1) not null default \'1\', `recurring_each_days` int not null default \'30\', `starts_on` timestamp null, `expires_on` timestamp null, `cancelled_on` timestamp null, `created_at` timestamp null, `updated_at` timestamp null) default character set utf8mb4 collate \'utf8mb4_unicode_ci\'\",\"time\":\"6.12\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/doctoworld\\/doctoworld\\/database\\/migrations\\/2018_06_07_123211_plans.php\",\"line\":65,\"hash\":\"05222e9410114be1afb2582386da29e8\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-07-09 02:26:09'),(30,'93dd8ca8-b935-40a9-80b1-5b59d915203f','93dd8cb2-571c-4c73-bf61-06004c49203b',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"create table `plans_usages` (`id` int unsigned not null auto_increment primary key, `subscription_id` int not null, `code` varchar(191) not null, `used` double(9, 2) not null default \'0\', `created_at` timestamp null, `updated_at` timestamp null) default character set utf8mb4 collate \'utf8mb4_unicode_ci\'\",\"time\":\"5.57\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/doctoworld\\/doctoworld\\/database\\/migrations\\/2018_06_07_123211_plans.php\",\"line\":75,\"hash\":\"028bf5f94bfcdc4553952ac8c8defd2b\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-07-09 02:26:09'),(31,'93dd8ca8-bc1a-4a20-b873-375e8e183cf7','93dd8cb2-571c-4c73-bf61-06004c49203b',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"create table `stripe_customers` (`id` int unsigned not null auto_increment primary key, `model_id` int not null, `model_type` varchar(191) not null, `customer_id` varchar(191) not null, `created_at` timestamp null, `updated_at` timestamp null) default character set utf8mb4 collate \'utf8mb4_unicode_ci\'\",\"time\":\"7.01\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/doctoworld\\/doctoworld\\/database\\/migrations\\/2018_06_07_123211_plans.php\",\"line\":86,\"hash\":\"6ff134b3c20dc849a078cc806772398d\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-07-09 02:26:09'),(32,'93dd8ca8-bc75-464e-b800-6dc9be4a65bb','93dd8cb2-571c-4c73-bf61-06004c49203b',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"insert into `migrations` (`migration`, `batch`) values (\'2018_06_07_123211_plans\', 1)\",\"time\":\"0.55\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/doctoworld\\/doctoworld\\/artisan\",\"line\":35,\"hash\":\"f2b8e8e4266db16aec6db940c643eb68\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-07-09 02:26:09'),(33,'93dd8ca8-c163-4a32-941b-59bcd1f8e023','93dd8cb2-571c-4c73-bf61-06004c49203b',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"create table `appointments` (`id` int unsigned not null auto_increment primary key, `appointee_id` int not null, `appointee_type` varchar(191) not null, `appointer_id` int null, `appointer_type` varchar(191) null, `meta` json null, `amount` decimal(9, 2) not null default \'0\', `amount_meta` json null, `address` varchar(191) null, `address_meta` json null, `longitude` decimal(15, 7) not null default \'0\', `latitude` decimal(15, 7) not null default \'0\', `date` date not null, `time_from` time not null, `time_to` time not null, `is_guest` tinyint(1) not null default \'0\', `customer_name` varchar(191) null, `customer_email` varchar(191) null, `customer_mobile` varchar(191) null, `created_at` timestamp null, `updated_at` timestamp null) default character set utf8mb4 collate \'utf8mb4_unicode_ci\'\",\"time\":\"11.64\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/doctoworld\\/doctoworld\\/artisan\",\"line\":35,\"hash\":\"f76ef30d08913020b0be5d85f9482b8b\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-07-09 02:26:09'),(34,'93dd8ca8-c232-4030-953a-ba1f22b4ec00','93dd8cb2-571c-4c73-bf61-06004c49203b',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"insert into `migrations` (`migration`, `batch`) values (\'2018_07_14_183253_create_table_appointments\', 1)\",\"time\":\"1.46\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/doctoworld\\/doctoworld\\/artisan\",\"line\":35,\"hash\":\"f2b8e8e4266db16aec6db940c643eb68\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-07-09 02:26:09'),(35,'93dd8ca8-c62c-46fe-af48-aed6ff7d8c1c','93dd8cb2-571c-4c73-bf61-06004c49203b',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"create table `payment_methods` (`id` int unsigned not null auto_increment primary key, `slug` varchar(191) not null, `title` json not null, `enabled` tinyint(1) not null default \'1\', `type` enum(\'prepaid\', \'postpaid\') not null, `created_at` timestamp null, `updated_at` timestamp null) default character set utf8mb4 collate \'utf8mb4_unicode_ci\'\",\"time\":\"9.34\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/doctoworld\\/doctoworld\\/artisan\",\"line\":35,\"hash\":\"a36f5b37388f51896aeb863633053876\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-07-09 02:26:09'),(36,'93dd8ca8-c8e5-4e77-9272-146f2a36f478','93dd8cb2-571c-4c73-bf61-06004c49203b',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"alter table `payment_methods` add unique `payment_methods_slug_unique`(`slug`)\",\"time\":\"6.61\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/doctoworld\\/doctoworld\\/artisan\",\"line\":35,\"hash\":\"683e74b74429c21834d0db32d95d5750\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-07-09 02:26:09'),(37,'93dd8ca8-c950-442d-a3ca-8c8624fe70bc','93dd8cb2-571c-4c73-bf61-06004c49203b',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"insert into `migrations` (`migration`, `batch`) values (\'2018_07_14_183253_payment_methods\', 1)\",\"time\":\"0.69\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/doctoworld\\/doctoworld\\/artisan\",\"line\":35,\"hash\":\"f2b8e8e4266db16aec6db940c643eb68\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-07-09 02:26:09'),(38,'93dd8ca8-cc71-4192-a6cd-60e4eb4f2c6a','93dd8cb2-571c-4c73-bf61-06004c49203b',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"create table `payments` (`id` int unsigned not null auto_increment primary key, `payable_id` int not null, `payable_type` varchar(191) not null, `payer_id` int null, `payer_type` varchar(191) null, `amount` decimal(9, 2) not null, `payment_method_id` int unsigned null, `created_at` timestamp null, `updated_at` timestamp null) default character set utf8mb4 collate \'utf8mb4_unicode_ci\'\",\"time\":\"7.31\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/doctoworld\\/doctoworld\\/artisan\",\"line\":35,\"hash\":\"f54c995eea65fe27c804212e5480e44a\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-07-09 02:26:09'),(39,'93dd8ca8-d380-407c-9d42-c3ded5f78765','93dd8cb2-571c-4c73-bf61-06004c49203b',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"alter table `payments` add constraint `payments_payment_method_id_foreign` foreign key (`payment_method_id`) references `payment_methods` (`id`) on delete set null\",\"time\":\"17.61\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/doctoworld\\/doctoworld\\/artisan\",\"line\":35,\"hash\":\"ea4a6e83722f4ba5ef63b8dacf07eb9c\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-07-09 02:26:09'),(40,'93dd8ca8-d44a-4696-9cba-3392a5e00374','93dd8cb2-571c-4c73-bf61-06004c49203b',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"insert into `migrations` (`migration`, `batch`) values (\'2018_07_14_183253_payments\', 1)\",\"time\":\"1.48\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/doctoworld\\/doctoworld\\/artisan\",\"line\":35,\"hash\":\"f2b8e8e4266db16aec6db940c643eb68\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-07-09 02:26:09'),(41,'93dd8ca8-d76e-4c3f-bcbc-ffa1316073fa','93dd8cb2-571c-4c73-bf61-06004c49203b',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"create table `ratings` (`id` int unsigned not null auto_increment primary key, `review` text not null, `rateable_id` int not null, `rateable_type` varchar(191) not null, `rater_id` int null, `rater_type` varchar(191) null, `rating` double(9, 2) not null, `created_at` timestamp null, `updated_at` timestamp null) default character set utf8mb4 collate \'utf8mb4_unicode_ci\'\",\"time\":\"7.41\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/doctoworld\\/doctoworld\\/database\\/migrations\\/2018_07_14_183253_ratings.php\",\"line\":30,\"hash\":\"d8c6b73d3b7052cfa848508de8dc8410\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-07-09 02:26:09'),(42,'93dd8ca8-d7ff-40de-a1b9-7073e99595c8','93dd8cb2-571c-4c73-bf61-06004c49203b',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"insert into `migrations` (`migration`, `batch`) values (\'2018_07_14_183253_ratings\', 1)\",\"time\":\"1.08\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/doctoworld\\/doctoworld\\/artisan\",\"line\":35,\"hash\":\"f2b8e8e4266db16aec6db940c643eb68\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-07-09 02:26:09'),(43,'93dd8ca8-dc6f-4290-8615-8ea055e46b5c','93dd8cb2-571c-4c73-bf61-06004c49203b',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"alter table `payment_methods` add `meta` json null\",\"time\":\"10.78\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/doctoworld\\/doctoworld\\/artisan\",\"line\":35,\"hash\":\"99c85767e528efd6949c2418a12fcc6b\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-07-09 02:26:09'),(44,'93dd8ca8-dd44-4858-a0a5-d4bf4c93e961','93dd8cb2-571c-4c73-bf61-06004c49203b',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"insert into `migrations` (`migration`, `batch`) values (\'2018_07_14_183254_alter_payment_methods\', 1)\",\"time\":\"1.65\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/doctoworld\\/doctoworld\\/artisan\",\"line\":35,\"hash\":\"f2b8e8e4266db16aec6db940c643eb68\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-07-09 02:26:09'),(45,'93dd8ca8-e179-49be-9a8d-350a4b4081d9','93dd8cb2-571c-4c73-bf61-06004c49203b',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"create table `telescope_entries` (`sequence` bigint unsigned not null auto_increment primary key, `uuid` char(36) not null, `batch_id` char(36) not null, `family_hash` varchar(191) null, `should_display_on_index` tinyint(1) not null default \'1\', `type` varchar(20) not null, `content` longtext not null, `created_at` datetime null) default character set utf8mb4 collate \'utf8mb4_unicode_ci\'\",\"time\":\"10.04\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/doctoworld\\/doctoworld\\/database\\/migrations\\/2018_08_08_100000_create_telescope_entries_table.php\",\"line\":58,\"hash\":\"8d1ffbefc0996658c0af05e275ad250b\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-07-09 02:26:09'),(46,'93dd8ca8-e418-4d22-8680-ac977971f847','93dd8cb2-571c-4c73-bf61-06004c49203b',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"alter table `telescope_entries` add unique `telescope_entries_uuid_unique`(`uuid`)\",\"time\":\"6.43\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/doctoworld\\/doctoworld\\/database\\/migrations\\/2018_08_08_100000_create_telescope_entries_table.php\",\"line\":58,\"hash\":\"9fb859ae1faff74c6b9e0b70dfd8eea9\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-07-09 02:26:09'),(47,'93dd8ca8-e687-45d1-9961-5be195de8cfe','93dd8cb2-571c-4c73-bf61-06004c49203b',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"alter table `telescope_entries` add index `telescope_entries_batch_id_index`(`batch_id`)\",\"time\":\"5.99\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/doctoworld\\/doctoworld\\/database\\/migrations\\/2018_08_08_100000_create_telescope_entries_table.php\",\"line\":58,\"hash\":\"2b075509a9242d6e3f622536c5ccca07\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-07-09 02:26:09'),(48,'93dd8ca8-ea1c-4a4c-8644-9011e21fa1a3','93dd8cb2-571c-4c73-bf61-06004c49203b',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"alter table `telescope_entries` add index `telescope_entries_family_hash_index`(`family_hash`)\",\"time\":\"8.92\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/doctoworld\\/doctoworld\\/database\\/migrations\\/2018_08_08_100000_create_telescope_entries_table.php\",\"line\":58,\"hash\":\"3d25a2a244bd2028dfa0326d3dbf7f4c\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-07-09 02:26:09'),(49,'93dd8ca8-ed4f-4989-aeab-125170ecaf49','93dd8cb2-571c-4c73-bf61-06004c49203b',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"alter table `telescope_entries` add index `telescope_entries_created_at_index`(`created_at`)\",\"time\":\"7.92\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/doctoworld\\/doctoworld\\/database\\/migrations\\/2018_08_08_100000_create_telescope_entries_table.php\",\"line\":58,\"hash\":\"7352e7f84460fb7ffc450e7ea4de9dc7\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-07-09 02:26:09'),(50,'93dd8ca8-f019-49c4-b808-5adf1afe7d8b','93dd8cb2-571c-4c73-bf61-06004c49203b',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"alter table `telescope_entries` add index `telescope_entries_type_should_display_on_index_index`(`type`, `should_display_on_index`)\",\"time\":\"6.91\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/doctoworld\\/doctoworld\\/database\\/migrations\\/2018_08_08_100000_create_telescope_entries_table.php\",\"line\":58,\"hash\":\"7317a4cad2dfa1a5167548a6acd0b6a5\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-07-09 02:26:09'),(51,'93dd8ca8-f206-4c12-b19a-9472336b5589','93dd8cb2-571c-4c73-bf61-06004c49203b',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"create table `telescope_entries_tags` (`entry_uuid` char(36) not null, `tag` varchar(191) not null) default character set utf8mb4 collate \'utf8mb4_unicode_ci\'\",\"time\":\"4.58\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/doctoworld\\/doctoworld\\/database\\/migrations\\/2018_08_08_100000_create_telescope_entries_table.php\",\"line\":71,\"hash\":\"49a385485c9ea77ced1287c810e06704\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-07-09 02:26:09'),(52,'93dd8ca8-f3b5-4e8e-a3b7-c270bab70fc1','93dd8cb2-571c-4c73-bf61-06004c49203b',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"alter table `telescope_entries_tags` add index `telescope_entries_tags_entry_uuid_tag_index`(`entry_uuid`, `tag`)\",\"time\":\"4.13\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/doctoworld\\/doctoworld\\/database\\/migrations\\/2018_08_08_100000_create_telescope_entries_table.php\",\"line\":71,\"hash\":\"d77cdf5585b51f60954d40e76786e20f\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-07-09 02:26:09'),(53,'93dd8ca8-f57e-4012-a401-d702f8f05a6f','93dd8cb2-571c-4c73-bf61-06004c49203b',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"alter table `telescope_entries_tags` add index `telescope_entries_tags_tag_index`(`tag`)\",\"time\":\"4.38\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/doctoworld\\/doctoworld\\/database\\/migrations\\/2018_08_08_100000_create_telescope_entries_table.php\",\"line\":71,\"hash\":\"0bdb35d17e876d6225a7774a2c17647d\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-07-09 02:26:09'),(54,'93dd8ca8-fad6-4941-9fdd-71190bfb8661','93dd8cb2-571c-4c73-bf61-06004c49203b',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"alter table `telescope_entries_tags` add constraint `telescope_entries_tags_entry_uuid_foreign` foreign key (`entry_uuid`) references `telescope_entries` (`uuid`) on delete cascade\",\"time\":\"13.42\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/doctoworld\\/doctoworld\\/database\\/migrations\\/2018_08_08_100000_create_telescope_entries_table.php\",\"line\":71,\"hash\":\"662a818f80a3a9ba2570081fd7a6af2f\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-07-09 02:26:09'),(55,'93dd8ca8-fd6f-4270-88c8-cd2387f4443a','93dd8cb2-571c-4c73-bf61-06004c49203b',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"create table `telescope_monitoring` (`tag` varchar(191) not null) default character set utf8mb4 collate \'utf8mb4_unicode_ci\'\",\"time\":\"6.28\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/doctoworld\\/doctoworld\\/database\\/migrations\\/2018_08_08_100000_create_telescope_entries_table.php\",\"line\":75,\"hash\":\"88f0c31d036f95c144b2633daa82c5dd\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-07-09 02:26:09'),(56,'93dd8ca8-fde4-45b7-9f0c-3fa0a77b0ddf','93dd8cb2-571c-4c73-bf61-06004c49203b',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"insert into `migrations` (`migration`, `batch`) values (\'2018_08_08_100000_create_telescope_entries_table\', 1)\",\"time\":\"0.80\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/doctoworld\\/doctoworld\\/artisan\",\"line\":35,\"hash\":\"f2b8e8e4266db16aec6db940c643eb68\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-07-09 02:26:09'),(57,'93dd8ca9-006f-48c9-b214-fe2423408b38','93dd8cb2-571c-4c73-bf61-06004c49203b',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"create table `likes` (`id` bigint unsigned not null auto_increment primary key, `user_id` bigint unsigned not null comment \'user_id\', `likeable_type` varchar(191) not null, `likeable_id` bigint unsigned not null, `created_at` timestamp null, `updated_at` timestamp null) default character set utf8mb4 collate \'utf8mb4_unicode_ci\'\",\"time\":\"5.90\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/doctoworld\\/doctoworld\\/artisan\",\"line\":35,\"hash\":\"880cd0689f32a0d180a6804eec134990\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-07-09 02:26:09'),(58,'93dd8ca9-0299-4409-95ae-d5df48e28a20','93dd8cb2-571c-4c73-bf61-06004c49203b',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"alter table `likes` add index `likes_likeable_type_likeable_id_index`(`likeable_type`, `likeable_id`)\",\"time\":\"5.27\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/doctoworld\\/doctoworld\\/artisan\",\"line\":35,\"hash\":\"328443a41d311ae3484041ff982dd46f\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-07-09 02:26:09'),(59,'93dd8ca9-046e-426e-98e2-96796962ca72','93dd8cb2-571c-4c73-bf61-06004c49203b',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"alter table `likes` add index `likes_user_id_index`(`user_id`)\",\"time\":\"4.40\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/doctoworld\\/doctoworld\\/artisan\",\"line\":35,\"hash\":\"abe28084c4952e7d9a5aebf215ed8307\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-07-09 02:26:09'),(60,'93dd8ca9-04cc-4fd2-a93f-436b1a26f6b3','93dd8cb2-571c-4c73-bf61-06004c49203b',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"insert into `migrations` (`migration`, `batch`) values (\'2018_12_14_000000_create_likes_table\', 1)\",\"time\":\"0.59\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/doctoworld\\/doctoworld\\/artisan\",\"line\":35,\"hash\":\"f2b8e8e4266db16aec6db940c643eb68\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-07-09 02:26:09'),(61,'93dd8ca9-0919-447c-b87b-97105958b930','93dd8cb2-571c-4c73-bf61-06004c49203b',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"alter table `plans` add `metadata` mediumtext null after `duration`\",\"time\":\"10.55\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/doctoworld\\/doctoworld\\/database\\/migrations\\/2019_06_07_123211_plans_metadata.php\",\"line\":18,\"hash\":\"6d85f09f6ccb2e515282e827533da796\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-07-09 02:26:09'),(62,'93dd8ca9-0d66-43f7-803c-17284820de87','93dd8cb2-571c-4c73-bf61-06004c49203b',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"alter table `plans_features` add `metadata` mediumtext null after `limit`\",\"time\":\"10.67\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/doctoworld\\/doctoworld\\/database\\/migrations\\/2019_06_07_123211_plans_metadata.php\",\"line\":22,\"hash\":\"ebe5bfed4e2826b2bcdbe7c4c0953a58\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-07-09 02:26:09'),(63,'93dd8ca9-0db9-4eaa-90b7-7ce7529de203','93dd8cb2-571c-4c73-bf61-06004c49203b',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"insert into `migrations` (`migration`, `batch`) values (\'2019_06_07_123211_plans_metadata\', 1)\",\"time\":\"0.51\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/doctoworld\\/doctoworld\\/artisan\",\"line\":35,\"hash\":\"f2b8e8e4266db16aec6db940c643eb68\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-07-09 02:26:09'),(64,'93dd8ca9-107e-4102-b303-d35fd74cc0a5','93dd8cb2-571c-4c73-bf61-06004c49203b',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"create table `user_follower` (`id` int unsigned not null auto_increment primary key, `following_id` bigint unsigned not null, `follower_id` bigint unsigned not null, `accepted_at` timestamp null, `created_at` timestamp null, `updated_at` timestamp null) default character set utf8mb4 collate \'utf8mb4_unicode_ci\'\",\"time\":\"6.29\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/doctoworld\\/doctoworld\\/database\\/migrations\\/2020_04_04_000000_create_user_follower_table.php\",\"line\":29,\"hash\":\"9079a00a5ecf955e531e75dd4c0a4ff8\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-07-09 02:26:09'),(65,'93dd8ca9-131a-4ea0-bdd6-a26671dce964','93dd8cb2-571c-4c73-bf61-06004c49203b',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"alter table `user_follower` add index `user_follower_following_id_index`(`following_id`)\",\"time\":\"6.43\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/doctoworld\\/doctoworld\\/database\\/migrations\\/2020_04_04_000000_create_user_follower_table.php\",\"line\":29,\"hash\":\"ecfe502d2f5796fcede2410d93199838\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-07-09 02:26:09'),(66,'93dd8ca9-14d6-4151-afe0-55086aa41d54','93dd8cb2-571c-4c73-bf61-06004c49203b',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"alter table `user_follower` add index `user_follower_follower_id_index`(`follower_id`)\",\"time\":\"4.24\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/doctoworld\\/doctoworld\\/database\\/migrations\\/2020_04_04_000000_create_user_follower_table.php\",\"line\":29,\"hash\":\"44117eede74b2d4792654ec9a1a4837e\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-07-09 02:26:09'),(67,'93dd8ca9-1711-481f-be3a-7a7b75c10f5a','93dd8cb2-571c-4c73-bf61-06004c49203b',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"alter table `user_follower` add index `user_follower_accepted_at_index`(`accepted_at`)\",\"time\":\"5.51\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/doctoworld\\/doctoworld\\/database\\/migrations\\/2020_04_04_000000_create_user_follower_table.php\",\"line\":29,\"hash\":\"17ad061ab277ccdc9a7e9e9d25f3e0c8\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-07-09 02:26:09'),(68,'93dd8ca9-1769-48ad-8436-872b8985a98e','93dd8cb2-571c-4c73-bf61-06004c49203b',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"insert into `migrations` (`migration`, `batch`) values (\'2020_04_04_000000_create_user_follower_table\', 1)\",\"time\":\"0.56\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/doctoworld\\/doctoworld\\/artisan\",\"line\":35,\"hash\":\"f2b8e8e4266db16aec6db940c643eb68\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-07-09 02:26:09'),(69,'93dd8ca9-1c00-4df1-8919-08bce28f6ef0','93dd8cb2-571c-4c73-bf61-06004c49203b',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"create table `permissions` (`id` bigint unsigned not null auto_increment primary key, `name` varchar(191) not null, `guard_name` varchar(191) not null, `created_at` timestamp null, `updated_at` timestamp null) default character set utf8mb4 collate \'utf8mb4_unicode_ci\'\",\"time\":\"11.26\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/doctoworld\\/doctoworld\\/database\\/migrations\\/2020_05_02_000545_create_permission_tables.php\",\"line\":28,\"hash\":\"943d0cba252f3c1eb856b525af7aa8c2\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-07-09 02:26:09'),(70,'93dd8ca9-1e02-4e76-ae71-fd77afe204fd','93dd8cb2-571c-4c73-bf61-06004c49203b',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"create table `roles` (`id` bigint unsigned not null auto_increment primary key, `name` varchar(191) not null, `guard_name` varchar(191) not null, `created_at` timestamp null, `updated_at` timestamp null) default character set utf8mb4 collate \'utf8mb4_unicode_ci\'\",\"time\":\"4.77\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/doctoworld\\/doctoworld\\/database\\/migrations\\/2020_05_02_000545_create_permission_tables.php\",\"line\":35,\"hash\":\"7f53347312ebbe4f1fe0f45eb6c72d29\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-07-09 02:26:09'),(71,'93dd8ca9-1fd9-4ce3-9e7f-9dbfeeee991c','93dd8cb2-571c-4c73-bf61-06004c49203b',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"create table `model_has_permissions` (`permission_id` bigint unsigned not null, `model_type` varchar(191) not null, `model_id` bigint unsigned not null) default character set utf8mb4 collate \'utf8mb4_unicode_ci\'\",\"time\":\"4.34\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/doctoworld\\/doctoworld\\/database\\/migrations\\/2020_05_02_000545_create_permission_tables.php\",\"line\":51,\"hash\":\"109a9980cbdfab75641897282fe657f6\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-07-09 02:26:09'),(72,'93dd8ca9-21d3-4a80-ac10-10c9bd7b9b11','93dd8cb2-571c-4c73-bf61-06004c49203b',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"alter table `model_has_permissions` add index `model_has_permissions_model_id_model_type_index`(`model_id`, `model_type`)\",\"time\":\"4.81\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/doctoworld\\/doctoworld\\/database\\/migrations\\/2020_05_02_000545_create_permission_tables.php\",\"line\":51,\"hash\":\"799c3262f33663c6bf50078fe1c8ce02\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-07-09 02:26:09'),(73,'93dd8ca9-282f-483c-87c3-7d7b126643d1','93dd8cb2-571c-4c73-bf61-06004c49203b',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"alter table `model_has_permissions` add constraint `model_has_permissions_permission_id_foreign` foreign key (`permission_id`) references `permissions` (`id`) on delete cascade\",\"time\":\"16.00\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/doctoworld\\/doctoworld\\/database\\/migrations\\/2020_05_02_000545_create_permission_tables.php\",\"line\":51,\"hash\":\"2c922be382fed48d8023537e84ccdd66\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-07-09 02:26:09'),(74,'93dd8ca9-2c3b-4228-8aab-4f36ee9295cd','93dd8cb2-571c-4c73-bf61-06004c49203b',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"alter table `model_has_permissions` add primary key `model_has_permissions_permission_model_type_primary`(`permission_id`, `model_id`, `model_type`)\",\"time\":\"10.09\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/doctoworld\\/doctoworld\\/database\\/migrations\\/2020_05_02_000545_create_permission_tables.php\",\"line\":51,\"hash\":\"49037d8660ba17245bd921fd2a2cc676\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-07-09 02:26:09'),(75,'93dd8ca9-2e20-424f-8545-a6d59e1a25a4','93dd8cb2-571c-4c73-bf61-06004c49203b',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"create table `model_has_roles` (`role_id` bigint unsigned not null, `model_type` varchar(191) not null, `model_id` bigint unsigned not null) default character set utf8mb4 collate \'utf8mb4_unicode_ci\'\",\"time\":\"4.42\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/doctoworld\\/doctoworld\\/database\\/migrations\\/2020_05_02_000545_create_permission_tables.php\",\"line\":67,\"hash\":\"9f4e3403d563a9303f83b365753c89de\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-07-09 02:26:09'),(76,'93dd8ca9-300f-44c2-8bd3-1c72284e1ef7','93dd8cb2-571c-4c73-bf61-06004c49203b',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"alter table `model_has_roles` add index `model_has_roles_model_id_model_type_index`(`model_id`, `model_type`)\",\"time\":\"4.71\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/doctoworld\\/doctoworld\\/database\\/migrations\\/2020_05_02_000545_create_permission_tables.php\",\"line\":67,\"hash\":\"b5fc483eb06997eadd0a189cdb6820fd\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-07-09 02:26:09'),(77,'93dd8ca9-3692-4f6a-b905-a1284d9b36b8','93dd8cb2-571c-4c73-bf61-06004c49203b',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"alter table `model_has_roles` add constraint `model_has_roles_role_id_foreign` foreign key (`role_id`) references `roles` (`id`) on delete cascade\",\"time\":\"16.43\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/doctoworld\\/doctoworld\\/database\\/migrations\\/2020_05_02_000545_create_permission_tables.php\",\"line\":67,\"hash\":\"13a9f5419fe9cfd65c84f44a9af8aebe\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-07-09 02:26:09'),(78,'93dd8ca9-3d25-4284-9a5f-2e534d197f2b','93dd8cb2-571c-4c73-bf61-06004c49203b',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"alter table `model_has_roles` add primary key `model_has_roles_role_model_type_primary`(`role_id`, `model_id`, `model_type`)\",\"time\":\"16.56\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/doctoworld\\/doctoworld\\/database\\/migrations\\/2020_05_02_000545_create_permission_tables.php\",\"line\":67,\"hash\":\"1f469fb7744bab9d57e2a117ea8e85e9\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-07-09 02:26:09'),(79,'93dd8ca9-3fc8-4959-b477-f90be45c8309','93dd8cb2-571c-4c73-bf61-06004c49203b',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"create table `role_has_permissions` (`permission_id` bigint unsigned not null, `role_id` bigint unsigned not null) default character set utf8mb4 collate \'utf8mb4_unicode_ci\'\",\"time\":\"6.25\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/doctoworld\\/doctoworld\\/database\\/migrations\\/2020_05_02_000545_create_permission_tables.php\",\"line\":84,\"hash\":\"6d68419d82530d4983920098d7b350e2\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-07-09 02:26:09'),(80,'93dd8ca9-45a7-4b79-8f46-99574f672bce','93dd8cb2-571c-4c73-bf61-06004c49203b',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"alter table `role_has_permissions` add constraint `role_has_permissions_permission_id_foreign` foreign key (`permission_id`) references `permissions` (`id`) on delete cascade\",\"time\":\"14.75\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/doctoworld\\/doctoworld\\/database\\/migrations\\/2020_05_02_000545_create_permission_tables.php\",\"line\":84,\"hash\":\"09327a2ff7df4421191b9fdf2a1cce9e\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-07-09 02:26:09'),(81,'93dd8ca9-4be0-424d-a033-53a90ec80b3f','93dd8cb2-571c-4c73-bf61-06004c49203b',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"alter table `role_has_permissions` add constraint `role_has_permissions_role_id_foreign` foreign key (`role_id`) references `roles` (`id`) on delete cascade\",\"time\":\"15.67\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/doctoworld\\/doctoworld\\/database\\/migrations\\/2020_05_02_000545_create_permission_tables.php\",\"line\":84,\"hash\":\"4ad12bf8366b7b214265d1ff60544e17\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-07-09 02:26:09'),(82,'93dd8ca9-4ff8-4a74-9305-ff3fb3d602db','93dd8cb2-571c-4c73-bf61-06004c49203b',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"alter table `role_has_permissions` add primary key `role_has_permissions_permission_id_role_id_primary`(`permission_id`, `role_id`)\",\"time\":\"10.22\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/doctoworld\\/doctoworld\\/database\\/migrations\\/2020_05_02_000545_create_permission_tables.php\",\"line\":84,\"hash\":\"81edd4146b829a569e123fa43e8c9f01\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-07-09 02:26:09'),(83,'93dd8ca9-5082-4af1-ad22-8356b46fed99','93dd8cb2-571c-4c73-bf61-06004c49203b',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"insert into `migrations` (`migration`, `batch`) values (\'2020_05_02_000545_create_permission_tables\', 1)\",\"time\":\"0.53\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/doctoworld\\/doctoworld\\/artisan\",\"line\":35,\"hash\":\"f2b8e8e4266db16aec6db940c643eb68\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-07-09 02:26:09'),(84,'93dd8ca9-5298-41bd-abda-ba57709c78be','93dd8cb2-571c-4c73-bf61-06004c49203b',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"create table `statuses` (`id` int unsigned not null auto_increment primary key, `name` varchar(191) not null, `reason` text null, `model_type` varchar(191) not null, `model_id` bigint unsigned not null, `created_at` timestamp null, `updated_at` timestamp null) default character set utf8mb4 collate \'utf8mb4_unicode_ci\'\",\"time\":\"4.81\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/doctoworld\\/doctoworld\\/database\\/migrations\\/2020_05_05_002400_create_statuses_table.php\",\"line\":17,\"hash\":\"01fafb9f2b78fa36d96d6979dc4f7be7\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-07-09 02:26:09'),(85,'93dd8ca9-54a5-4ab7-b271-a2273e266c65','93dd8cb2-571c-4c73-bf61-06004c49203b',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"alter table `statuses` add index `statuses_model_type_model_id_index`(`model_type`, `model_id`)\",\"time\":\"5.01\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/doctoworld\\/doctoworld\\/database\\/migrations\\/2020_05_05_002400_create_statuses_table.php\",\"line\":17,\"hash\":\"d3235d2d588bb9d13bd441a538fbf77a\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-07-09 02:26:09'),(86,'93dd8ca9-54f1-41d0-a00a-2e5f09432c83','93dd8cb2-571c-4c73-bf61-06004c49203b',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"insert into `migrations` (`migration`, `batch`) values (\'2020_05_05_002400_create_statuses_table\', 1)\",\"time\":\"0.43\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/doctoworld\\/doctoworld\\/artisan\",\"line\":35,\"hash\":\"f2b8e8e4266db16aec6db940c643eb68\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-07-09 02:26:09'),(87,'93dd8ca9-5899-49b1-a2a3-992ce0c8ad82','93dd8cb2-571c-4c73-bf61-06004c49203b',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"create table `media` (`id` bigint unsigned not null auto_increment primary key, `model_type` varchar(191) not null, `model_id` bigint unsigned not null, `collection_name` varchar(191) not null, `name` varchar(191) not null, `file_name` varchar(191) not null, `mime_type` varchar(191) null, `disk` varchar(191) not null, `size` bigint unsigned not null, `manipulations` json not null, `custom_properties` json not null, `responsive_images` json not null, `order_column` int unsigned null, `created_at` timestamp null, `updated_at` timestamp null) default character set utf8mb4 collate \'utf8mb4_unicode_ci\'\",\"time\":\"8.79\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/doctoworld\\/doctoworld\\/database\\/migrations\\/2020_05_05_122859_create_media_table.php\",\"line\":28,\"hash\":\"c8dc909b23ea886cc9dc6ef66525f789\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-07-09 02:26:09'),(88,'93dd8ca9-5aac-42e0-b814-90ca1ee19223','93dd8cb2-571c-4c73-bf61-06004c49203b',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"alter table `media` add index `media_model_type_model_id_index`(`model_type`, `model_id`)\",\"time\":\"5.11\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/doctoworld\\/doctoworld\\/database\\/migrations\\/2020_05_05_122859_create_media_table.php\",\"line\":28,\"hash\":\"18aa785eeff7b50b2cd7fd56c897a016\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-07-09 02:26:09'),(89,'93dd8ca9-5af0-45e8-ae26-0f2748961acd','93dd8cb2-571c-4c73-bf61-06004c49203b',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"insert into `migrations` (`migration`, `batch`) values (\'2020_05_05_122859_create_media_table\', 1)\",\"time\":\"0.43\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/doctoworld\\/doctoworld\\/artisan\",\"line\":35,\"hash\":\"f2b8e8e4266db16aec6db940c643eb68\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-07-09 02:26:09'),(90,'93dd8ca9-5d2b-40b3-a54d-fcb5ef812fee','93dd8cb2-571c-4c73-bf61-06004c49203b',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"create table `favorites` (`user_id` int unsigned not null, `favoriteable_type` varchar(191) not null, `favoriteable_id` bigint unsigned not null, `created_at` timestamp null, `updated_at` timestamp null) default character set utf8mb4 collate \'utf8mb4_unicode_ci\'\",\"time\":\"5.22\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/doctoworld\\/doctoworld\\/database\\/migrations\\/2020_07_04_142129_create_favorites_table.php\",\"line\":22,\"hash\":\"e099bb5842405bfa58fd8867d3d0b08f\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-07-09 02:26:09'),(91,'93dd8ca9-648a-4410-be19-c272a4fe0f94','93dd8cb2-571c-4c73-bf61-06004c49203b',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"alter table `favorites` add index `favorites_favoriteable_type_favoriteable_id_index`(`favoriteable_type`, `favoriteable_id`)\",\"time\":\"18.60\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/doctoworld\\/doctoworld\\/database\\/migrations\\/2020_07_04_142129_create_favorites_table.php\",\"line\":22,\"hash\":\"44db824ac82c2875e9eabec08509828c\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-07-09 02:26:09'),(92,'93dd8ca9-6923-482d-a81d-fc7d0eb2bfa0','93dd8cb2-571c-4c73-bf61-06004c49203b',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"alter table `favorites` add primary key `favorites_user_id_favoriteable_id_favoriteable_type_primary`(`user_id`, `favoriteable_id`, `favoriteable_type`)\",\"time\":\"11.49\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/doctoworld\\/doctoworld\\/database\\/migrations\\/2020_07_04_142129_create_favorites_table.php\",\"line\":22,\"hash\":\"3d0702e4e3e85b42840a6189be0e90a8\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-07-09 02:26:09'),(93,'93dd8ca9-6c94-4808-a2d0-db9a955efd25','93dd8cb2-571c-4c73-bf61-06004c49203b',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"alter table `favorites` add index `favorites_user_id_index`(`user_id`)\",\"time\":\"8.56\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/doctoworld\\/doctoworld\\/database\\/migrations\\/2020_07_04_142129_create_favorites_table.php\",\"line\":22,\"hash\":\"7d9933a185b1e8004be01cab3cafb4bf\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-07-09 02:26:09'),(94,'93dd8ca9-6cf8-499e-98a6-a71ea59d7714','93dd8cb2-571c-4c73-bf61-06004c49203b',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"insert into `migrations` (`migration`, `batch`) values (\'2020_07_04_142129_create_favorites_table\', 1)\",\"time\":\"0.66\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/doctoworld\\/doctoworld\\/artisan\",\"line\":35,\"hash\":\"f2b8e8e4266db16aec6db940c643eb68\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-07-09 02:26:09'),(95,'93dd8ca9-6eff-4905-b87a-f9b542f37f0f','93dd8cb2-571c-4c73-bf61-06004c49203b',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"create table `banners` (`id` int unsigned not null auto_increment primary key, `title` json not null, `meta` json null, `sort_order` int not null default \'1\', `created_at` timestamp null, `updated_at` timestamp null) default character set utf8mb4 collate \'utf8mb4_unicode_ci\'\",\"time\":\"4.67\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/doctoworld\\/doctoworld\\/artisan\",\"line\":35,\"hash\":\"b14cbd781a39c03372a7a35c01c48608\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-07-09 02:26:09'),(96,'93dd8ca9-6f4b-4454-8b9d-835908ad1c5a','93dd8cb2-571c-4c73-bf61-06004c49203b',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"insert into `migrations` (`migration`, `batch`) values (\'2020_07_09_150356_create_banners_table\', 1)\",\"time\":\"0.48\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/doctoworld\\/doctoworld\\/artisan\",\"line\":35,\"hash\":\"f2b8e8e4266db16aec6db940c643eb68\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-07-09 02:26:09'),(97,'93dd8ca9-7341-4fee-ba7f-a2d764112e5a','93dd8cb2-571c-4c73-bf61-06004c49203b',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"create table `faqs` (`id` int unsigned not null auto_increment primary key, `title` varchar(191) not null, `short_description` varchar(191) not null, `description` varchar(191) not null, `meta` json null, `created_at` timestamp null, `updated_at` timestamp null) default character set utf8mb4 collate \'utf8mb4_unicode_ci\'\",\"time\":\"9.43\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/doctoworld\\/doctoworld\\/artisan\",\"line\":35,\"hash\":\"53a1d979c2e8a3bb4b17768f4532f142\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-07-09 02:26:09'),(98,'93dd8ca9-73f2-4cd9-9d77-59388867e289','93dd8cb2-571c-4c73-bf61-06004c49203b',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"insert into `migrations` (`migration`, `batch`) values (\'2020_07_09_150356_create_faqs_table\', 1)\",\"time\":\"1.21\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/doctoworld\\/doctoworld\\/artisan\",\"line\":35,\"hash\":\"f2b8e8e4266db16aec6db940c643eb68\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-07-09 02:26:09'),(99,'93dd8ca9-7764-4f24-9f43-df1a7cf22c44','93dd8cb2-571c-4c73-bf61-06004c49203b',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"create table `reports` (`id` int unsigned not null auto_increment primary key, `reportable_type` varchar(191) not null, `reportable_id` bigint unsigned not null, `reporter_type` varchar(191) not null, `reporter_id` bigint unsigned not null, `reason` text null, `meta` json null, `created_at` timestamp null, `updated_at` timestamp null) default character set utf8mb4 collate \'utf8mb4_unicode_ci\'\",\"time\":\"7.84\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/doctoworld\\/doctoworld\\/artisan\",\"line\":35,\"hash\":\"2a5d5b4ef5e6bae8a3f92142091de7ef\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-07-09 02:26:09'),(100,'93dd8ca9-799d-457e-b8da-fc4db74d4656','93dd8cb2-571c-4c73-bf61-06004c49203b',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"alter table `reports` add index `reports_reportable_type_reportable_id_index`(`reportable_type`, `reportable_id`)\",\"time\":\"5.41\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/doctoworld\\/doctoworld\\/artisan\",\"line\":35,\"hash\":\"7a4ad10bc4e387222fb9020948aaa2ea\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-07-09 02:26:09'),(101,'93dd8ca9-7b85-4ce1-bec3-1fe77e03bcac','93dd8cb2-571c-4c73-bf61-06004c49203b',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"alter table `reports` add index `reports_reporter_type_reporter_id_index`(`reporter_type`, `reporter_id`)\",\"time\":\"4.63\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/doctoworld\\/doctoworld\\/artisan\",\"line\":35,\"hash\":\"df0b30031d935bf0659d96c57f4f3014\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-07-09 02:26:09'),(102,'93dd8ca9-7bdb-404b-b2ab-b8a1d387cb63','93dd8cb2-571c-4c73-bf61-06004c49203b',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"insert into `migrations` (`migration`, `batch`) values (\'2020_07_09_150356_create_reports_table\', 1)\",\"time\":\"0.54\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/doctoworld\\/doctoworld\\/artisan\",\"line\":35,\"hash\":\"f2b8e8e4266db16aec6db940c643eb68\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-07-09 02:26:09'),(103,'93dd8ca9-81ec-479e-af26-abcd167bdfa8','93dd8cb2-571c-4c73-bf61-06004c49203b',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"create table `supports` (`id` int unsigned not null auto_increment primary key, `name` varchar(191) not null, `email` varchar(191) not null, `message` text not null, `meta` json null, `created_at` timestamp null, `updated_at` timestamp null) default character set utf8mb4 collate \'utf8mb4_unicode_ci\'\",\"time\":\"14.93\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/doctoworld\\/doctoworld\\/artisan\",\"line\":35,\"hash\":\"1f2d89998789c066250d31e3198a6c2f\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-07-09 02:26:09'),(104,'93dd8ca9-8248-4891-8b2b-c75cc2b9f615','93dd8cb2-571c-4c73-bf61-06004c49203b',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"insert into `migrations` (`migration`, `batch`) values (\'2020_07_09_150356_create_supports_table\', 1)\",\"time\":\"0.56\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/doctoworld\\/doctoworld\\/artisan\",\"line\":35,\"hash\":\"f2b8e8e4266db16aec6db940c643eb68\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-07-09 02:26:09'),(105,'93dd8ca9-8597-4b79-a873-0526c3a2d789','93dd8cb2-571c-4c73-bf61-06004c49203b',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"create table `jobs` (`id` bigint unsigned not null auto_increment primary key, `queue` varchar(191) not null, `payload` longtext not null, `attempts` tinyint unsigned not null, `reserved_at` int unsigned null, `available_at` int unsigned not null, `created_at` int unsigned not null) default character set utf8mb4 collate \'utf8mb4_unicode_ci\'\",\"time\":\"7.74\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/doctoworld\\/doctoworld\\/database\\/migrations\\/2021_04_12_232757_create_jobs_table.php\",\"line\":24,\"hash\":\"e979ba91e05e85b61b901876ce0321e7\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-07-09 02:26:09'),(106,'93dd8ca9-8866-465e-b435-fb9de3df13cd','93dd8cb2-571c-4c73-bf61-06004c49203b',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"alter table `jobs` add index `jobs_queue_index`(`queue`)\",\"time\":\"6.84\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/doctoworld\\/doctoworld\\/database\\/migrations\\/2021_04_12_232757_create_jobs_table.php\",\"line\":24,\"hash\":\"0cfaf07533bec3024be637314b74804b\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-07-09 02:26:09'),(107,'93dd8ca9-88e5-4625-a402-51e24a45b3c4','93dd8cb2-571c-4c73-bf61-06004c49203b',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"insert into `migrations` (`migration`, `batch`) values (\'2021_04_12_232757_create_jobs_table\', 1)\",\"time\":\"0.86\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/doctoworld\\/doctoworld\\/artisan\",\"line\":35,\"hash\":\"f2b8e8e4266db16aec6db940c643eb68\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-07-09 02:26:09'),(108,'93dd8ca9-8c0b-4396-b7df-43f70cd94333','93dd8cb2-571c-4c73-bf61-06004c49203b',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"create table `users` (`id` int unsigned not null auto_increment primary key, `name` varchar(191) not null, `email` varchar(191) not null, `username` varchar(191) null, `password` varchar(191) not null, `mobile_number` varchar(191) not null, `mobile_verified` tinyint(1) not null default \'0\', `is_verified` tinyint(1) not null default \'0\', `active` tinyint unsigned not null default \'1\', `language` varchar(191) not null default \'en\', `notification` json null, `meta` json null, `remember_token` varchar(100) null, `created_at` timestamp null, `updated_at` timestamp null) default character set utf8mb4 collate \'utf8mb4_unicode_ci\'\",\"time\":\"7.21\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/doctoworld\\/doctoworld\\/artisan\",\"line\":35,\"hash\":\"b3f60eff228c103ae23f40e2bc304dd7\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-07-09 02:26:09'),(109,'93dd8ca9-8f35-48f9-a521-ee92cd339502','93dd8cb2-571c-4c73-bf61-06004c49203b',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"alter table `users` add unique `users_email_unique`(`email`)\",\"time\":\"7.68\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/doctoworld\\/doctoworld\\/artisan\",\"line\":35,\"hash\":\"0648806a3d18c0f5b81e2257de64675e\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-07-09 02:26:09'),(110,'93dd8ca9-91f6-4339-aee3-b043d9b84644','93dd8cb2-571c-4c73-bf61-06004c49203b',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"alter table `users` add unique `users_username_unique`(`username`)\",\"time\":\"6.65\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/doctoworld\\/doctoworld\\/artisan\",\"line\":35,\"hash\":\"d9d8675342e514e22d4b25a58193a2f1\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-07-09 02:26:09'),(111,'93dd8ca9-9482-4688-8784-177aa6ef25a6','93dd8cb2-571c-4c73-bf61-06004c49203b',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"alter table `users` add unique `users_mobile_number_unique`(`mobile_number`)\",\"time\":\"6.19\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/doctoworld\\/doctoworld\\/artisan\",\"line\":35,\"hash\":\"ede267dad99cb97da27e7cf8f9d98449\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-07-09 02:26:09'),(112,'93dd8ca9-94f7-402a-80e1-b55f9487d2cd','93dd8cb2-571c-4c73-bf61-06004c49203b',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"insert into `migrations` (`migration`, `batch`) values (\'2050_01_01_000005_create_users_table\', 1)\",\"time\":\"0.73\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/doctoworld\\/doctoworld\\/artisan\",\"line\":35,\"hash\":\"f2b8e8e4266db16aec6db940c643eb68\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-07-09 02:26:09'),(113,'93dd8ca9-97c5-4593-91fc-3f168fbd383e','93dd8cb2-571c-4c73-bf61-06004c49203b',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"create table `password_resets` (`email` varchar(191) not null, `token` varchar(191) not null, `created_at` timestamp null) default character set utf8mb4 collate \'utf8mb4_unicode_ci\'\",\"time\":\"6.46\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/doctoworld\\/doctoworld\\/artisan\",\"line\":35,\"hash\":\"68731db34acd59ac6f47053016159dcb\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-07-09 02:26:09'),(114,'93dd8ca9-9bbd-44e3-be03-4377a4217e2a','93dd8cb2-571c-4c73-bf61-06004c49203b',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"alter table `password_resets` add index `password_resets_email_index`(`email`)\",\"time\":\"9.66\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/doctoworld\\/doctoworld\\/artisan\",\"line\":35,\"hash\":\"e47bfd004ad9142afc1b2460960fbe08\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-07-09 02:26:09'),(115,'93dd8ca9-9c3c-4e14-b728-49f6955b35e2','93dd8cb2-571c-4c73-bf61-06004c49203b',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"insert into `migrations` (`migration`, `batch`) values (\'2050_01_01_000010_create_password_resets_table\', 1)\",\"time\":\"0.79\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/doctoworld\\/doctoworld\\/artisan\",\"line\":35,\"hash\":\"f2b8e8e4266db16aec6db940c643eb68\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-07-09 02:26:09'),(116,'93dd8ca9-a1d5-44f0-8354-37cca3586822','93dd8cb2-571c-4c73-bf61-06004c49203b',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"create table `settings` (`id` int unsigned not null auto_increment primary key, `key` varchar(191) not null, `value` text not null, `type` enum(\'string\', \'text\', \'json\', \'numeric\', \'boolean\') not null) default character set utf8mb4 collate \'utf8mb4_unicode_ci\'\",\"time\":\"13.53\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/doctoworld\\/doctoworld\\/artisan\",\"line\":35,\"hash\":\"fbb96c6ea76bbfa8bd7689232cb16a7d\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-07-09 02:26:09'),(117,'93dd8ca9-a3f2-4e4e-bab0-ada06fec18e9','93dd8cb2-571c-4c73-bf61-06004c49203b',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"alter table `settings` add unique `settings_key_unique`(`key`)\",\"time\":\"5.10\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/doctoworld\\/doctoworld\\/artisan\",\"line\":35,\"hash\":\"341c887377abf0b07bc393a8c80d128b\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-07-09 02:26:09'),(118,'93dd8ca9-a452-4357-b936-5d41d27e5304','93dd8cb2-571c-4c73-bf61-06004c49203b',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"insert into `migrations` (`migration`, `batch`) values (\'2050_01_01_000015_create_settings_table\', 1)\",\"time\":\"0.60\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/doctoworld\\/doctoworld\\/artisan\",\"line\":35,\"hash\":\"f2b8e8e4266db16aec6db940c643eb68\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-07-09 02:26:09'),(119,'93dd8ca9-b096-4eab-85e8-7f138d7659bf','93dd8cb2-571c-4c73-bf61-06004c49203b',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"create table `activity_logs` (`id` int unsigned not null auto_increment primary key, `device_id` varchar(191) null, `device_type` varchar(191) not null, `user_id` int unsigned null, `created_at` timestamp null, `updated_at` timestamp null) default character set utf8mb4 collate \'utf8mb4_unicode_ci\'\",\"time\":\"30.75\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/doctoworld\\/doctoworld\\/artisan\",\"line\":35,\"hash\":\"2db69552d6e0f0e026ebc8ad81f2093f\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-07-09 02:26:09'),(120,'93dd8ca9-c789-482e-8d1a-5fc284696ed5','93dd8cb2-571c-4c73-bf61-06004c49203b',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"alter table `activity_logs` add constraint `activity_logs_user_id_foreign` foreign key (`user_id`) references `users` (`id`) on delete cascade\",\"time\":\"58.40\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/doctoworld\\/doctoworld\\/artisan\",\"line\":35,\"hash\":\"b7479993ef8c45e5d19047f88776c925\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-07-09 02:26:09'),(121,'93dd8ca9-cf6d-4ad1-abde-27f17508065b','93dd8cb2-571c-4c73-bf61-06004c49203b',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"insert into `migrations` (`migration`, `batch`) values (\'2050_01_01_000020_create_activity_logs_table\', 1)\",\"time\":\"19.71\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/doctoworld\\/doctoworld\\/artisan\",\"line\":35,\"hash\":\"f2b8e8e4266db16aec6db940c643eb68\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-07-09 02:26:09'),(122,'93dd8ca9-e0b8-4424-ac91-d2777944dff4','93dd8cb2-571c-4c73-bf61-06004c49203b',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"create table `notifications` (`id` int unsigned not null auto_increment primary key, `text` text null, `meta` json null, `type` varchar(191) null, `user_id` int unsigned null, `from_user_id` int unsigned null, `created_at` timestamp null, `updated_at` timestamp null) default character set utf8mb4 collate \'utf8mb4_unicode_ci\'\",\"time\":\"43.32\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/doctoworld\\/doctoworld\\/artisan\",\"line\":35,\"hash\":\"d431e8d99611ca82254ad510e9d54d2c\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-07-09 02:26:09'),(123,'93dd8ca9-f462-40a3-b123-3bd7ef74416c','93dd8cb2-571c-4c73-bf61-06004c49203b',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"alter table `notifications` add constraint `notifications_user_id_foreign` foreign key (`user_id`) references `users` (`id`) on delete cascade\",\"time\":\"49.97\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/doctoworld\\/doctoworld\\/artisan\",\"line\":35,\"hash\":\"9f4b08e0dd33de422fc8d11ceaba636e\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-07-09 02:26:10'),(124,'93dd8caa-1841-4cee-8e43-430082c3bd13','93dd8cb2-571c-4c73-bf61-06004c49203b',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"alter table `notifications` add constraint `notifications_from_user_id_foreign` foreign key (`from_user_id`) references `users` (`id`) on delete cascade\",\"time\":\"91.43\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/doctoworld\\/doctoworld\\/artisan\",\"line\":35,\"hash\":\"4dcf5127e54835653b873d8ccfaff4f2\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-07-09 02:26:10'),(125,'93dd8caa-18af-473a-800d-b28707e70635','93dd8cb2-571c-4c73-bf61-06004c49203b',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"insert into `migrations` (`migration`, `batch`) values (\'2050_01_01_000025_create_notifications_table\', 1)\",\"time\":\"0.71\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/doctoworld\\/doctoworld\\/artisan\",\"line\":35,\"hash\":\"f2b8e8e4266db16aec6db940c643eb68\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-07-09 02:26:10'),(126,'93dd8caa-27b4-4c2c-8df1-771bf259df95','93dd8cb2-571c-4c73-bf61-06004c49203b',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"create table `ecommerce_addresses` (`id` int unsigned not null auto_increment primary key, `title` varchar(191) not null, `meta` json null, `formatted_address` varchar(191) not null, `address1` varchar(191) null, `address2` varchar(191) null, `country` varchar(191) null, `state` varchar(191) null, `city` varchar(191) null, `postcode` varchar(191) null, `longitude` decimal(15, 7) not null default \'0\', `latitude` decimal(15, 7) not null default \'0\', `user_id` int unsigned not null, `created_at` timestamp null, `updated_at` timestamp null) default character set utf8mb4 collate \'utf8mb4_unicode_ci\'\",\"time\":\"37.66\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/doctoworld\\/doctoworld\\/artisan\",\"line\":35,\"hash\":\"c1b8b2ca7a17ca02944d5ab3b83fa964\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-07-09 02:26:10'),(127,'93dd8caa-52ed-428f-bc76-b558b6ed3e18','93dd8cb2-571c-4c73-bf61-06004c49203b',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"alter table `ecommerce_addresses` add constraint `ecommerce_addresses_user_id_foreign` foreign key (`user_id`) references `users` (`id`) on delete cascade\",\"time\":\"110.28\",\"slow\":true,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/doctoworld\\/doctoworld\\/artisan\",\"line\":35,\"hash\":\"482fb482b77e9592783d3bc7f737d12b\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-07-09 02:26:10'),(128,'93dd8caa-534e-4770-b35c-81fd6d68db68','93dd8cb2-571c-4c73-bf61-06004c49203b',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"insert into `migrations` (`migration`, `batch`) values (\'2051_01_01_000010_create_addresses_table\', 1)\",\"time\":\"0.61\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/doctoworld\\/doctoworld\\/artisan\",\"line\":35,\"hash\":\"f2b8e8e4266db16aec6db940c643eb68\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-07-09 02:26:10'),(129,'93dd8caa-55d1-405a-9243-3b21efe9a992','93dd8cb2-571c-4c73-bf61-06004c49203b',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"create table `categories` (`id` int unsigned not null auto_increment primary key, `slug` varchar(191) not null, `title` json not null, `meta` json null, `sort_order` int not null default \'1\', `parent_id` int unsigned null, `created_at` timestamp null, `updated_at` timestamp null) default character set utf8mb4 collate \'utf8mb4_unicode_ci\'\",\"time\":\"5.78\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/doctoworld\\/doctoworld\\/artisan\",\"line\":35,\"hash\":\"128a6d61600ae6f982951e2e5bee42be\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-07-09 02:26:10'),(130,'93dd8caa-5e10-4649-a8d9-a762c1f58d22','93dd8cb2-571c-4c73-bf61-06004c49203b',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"alter table `categories` add constraint `categories_parent_id_foreign` foreign key (`parent_id`) references `categories` (`id`) on delete cascade\",\"time\":\"20.66\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/doctoworld\\/doctoworld\\/artisan\",\"line\":35,\"hash\":\"4ccd04b5322d6536aa53f3c1d80ed757\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-07-09 02:26:10'),(131,'93dd8caa-5e8f-47a0-9c23-edbb03eb80a4','93dd8cb2-571c-4c73-bf61-06004c49203b',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"insert into `migrations` (`migration`, `batch`) values (\'2051_01_01_000020_create_categories_table\', 1)\",\"time\":\"0.80\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/doctoworld\\/doctoworld\\/artisan\",\"line\":35,\"hash\":\"f2b8e8e4266db16aec6db940c643eb68\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-07-09 02:26:10'),(132,'93dd8caa-6a8a-41b5-b829-5c912fe345e4','93dd8cb2-571c-4c73-bf61-06004c49203b',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"create table `ecommerce_vendors` (`id` int unsigned not null auto_increment primary key, `name` json null, `tagline` json null, `details` json null, `meta` json null, `minimum_order` int unsigned not null default \'0\', `delivery_fee` int unsigned not null default \'0\', `area` varchar(191) null, `address` varchar(191) null, `longitude` decimal(15, 7) not null default \'0\', `latitude` decimal(15, 7) not null default \'0\', `is_verified` tinyint(1) not null default \'1\', `user_id` int unsigned not null, `created_at` timestamp null, `updated_at` timestamp null) default character set utf8mb4 collate \'utf8mb4_unicode_ci\'\",\"time\":\"29.87\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/doctoworld\\/doctoworld\\/artisan\",\"line\":35,\"hash\":\"92ac2742e02b9d1201ad8fbb7f8c43fd\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-07-09 02:26:10'),(133,'93dd8caa-737c-467c-b0bd-0c8e6fcfc6eb','93dd8cb2-571c-4c73-bf61-06004c49203b',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"alter table `ecommerce_vendors` add constraint `ecommerce_vendors_user_id_foreign` foreign key (`user_id`) references `users` (`id`) on delete cascade\",\"time\":\"22.55\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/doctoworld\\/doctoworld\\/artisan\",\"line\":35,\"hash\":\"5c10ed46446473c0d9c6a16c3dd405f0\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-07-09 02:26:10'),(134,'93dd8caa-75bc-4437-9823-670582be975d','93dd8cb2-571c-4c73-bf61-06004c49203b',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"create table `ecommerce_vendor_categories` (`vendor_id` int unsigned not null, `category_id` int unsigned not null) default character set utf8mb4 collate \'utf8mb4_unicode_ci\'\",\"time\":\"5.26\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/doctoworld\\/doctoworld\\/artisan\",\"line\":35,\"hash\":\"52a3c206d988943739e328dcdd6bcecf\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-07-09 02:26:10'),(135,'93dd8caa-7ab4-4425-8ac0-24de9e66e034','93dd8cb2-571c-4c73-bf61-06004c49203b',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"alter table `ecommerce_vendor_categories` add constraint `ecommerce_vendor_categories_vendor_id_foreign` foreign key (`vendor_id`) references `ecommerce_vendors` (`id`) on delete cascade\",\"time\":\"12.41\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/doctoworld\\/doctoworld\\/artisan\",\"line\":35,\"hash\":\"974cf6039a5e37f7c1b1855b907861f1\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-07-09 02:26:10'),(136,'93dd8caa-8007-4980-acdc-8fa1b81ba391','93dd8cb2-571c-4c73-bf61-06004c49203b',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"alter table `ecommerce_vendor_categories` add constraint `ecommerce_vendor_categories_category_id_foreign` foreign key (`category_id`) references `categories` (`id`) on delete cascade\",\"time\":\"13.33\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/doctoworld\\/doctoworld\\/artisan\",\"line\":35,\"hash\":\"4285f885bb4932406b1e6a1f4988cb4b\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-07-09 02:26:10'),(137,'93dd8caa-8057-42d1-bb93-bd7e78fd394a','93dd8cb2-571c-4c73-bf61-06004c49203b',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"insert into `migrations` (`migration`, `batch`) values (\'2051_01_01_000030_create_vendors_table\', 1)\",\"time\":\"0.50\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/doctoworld\\/doctoworld\\/artisan\",\"line\":35,\"hash\":\"f2b8e8e4266db16aec6db940c643eb68\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-07-09 02:26:10'),(138,'93dd8caa-82f2-4aca-bdf7-1a3c09287297','93dd8cb2-571c-4c73-bf61-06004c49203b',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"create table `ecommerce_delivery_profiles` (`id` int unsigned not null auto_increment primary key, `meta` json null, `is_verified` tinyint(1) not null default \'1\', `is_online` tinyint(1) not null default \'0\', `assigned` tinyint(1) not null default \'0\', `longitude` decimal(15, 7) null, `latitude` decimal(15, 7) null, `created_at` timestamp null, `updated_at` timestamp null, `user_id` int unsigned not null) default character set utf8mb4 collate \'utf8mb4_unicode_ci\'\",\"time\":\"6.03\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/doctoworld\\/doctoworld\\/artisan\",\"line\":35,\"hash\":\"4ff674bb8286e306f270987252d6bf0d\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-07-09 02:26:10'),(139,'93dd8caa-8a7f-4d5a-aff9-a5e26ebf4804','93dd8cb2-571c-4c73-bf61-06004c49203b',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"alter table `ecommerce_delivery_profiles` add constraint `ecommerce_delivery_profiles_user_id_foreign` foreign key (`user_id`) references `users` (`id`) on delete cascade\",\"time\":\"18.99\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/doctoworld\\/doctoworld\\/artisan\",\"line\":35,\"hash\":\"f2bee5b2593de0438dc85bdfa7988ed2\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-07-09 02:26:10'),(140,'93dd8caa-8add-4725-84fe-f665945c907d','93dd8cb2-571c-4c73-bf61-06004c49203b',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"insert into `migrations` (`migration`, `batch`) values (\'2051_01_01_000035_create_delivery_profiles_table\', 1)\",\"time\":\"0.58\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/doctoworld\\/doctoworld\\/artisan\",\"line\":35,\"hash\":\"f2b8e8e4266db16aec6db940c643eb68\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-07-09 02:26:10'),(141,'93dd8caa-8cd4-4017-9773-06994d509d1f','93dd8cb2-571c-4c73-bf61-06004c49203b',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"create table `ecommerce_attributes` (`id` int unsigned not null auto_increment primary key, `title` json not null, `created_at` timestamp null, `updated_at` timestamp null) default character set utf8mb4 collate \'utf8mb4_unicode_ci\'\",\"time\":\"4.52\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/doctoworld\\/doctoworld\\/artisan\",\"line\":35,\"hash\":\"b15a08ddba56457e2c89693fa8a53fb5\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-07-09 02:26:10'),(142,'93dd8caa-8eaf-4ba4-b59a-0f0fc8d6dead','93dd8cb2-571c-4c73-bf61-06004c49203b',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"create table `ecommerce_attribute_terms` (`id` int unsigned not null auto_increment primary key, `title` varchar(191) not null, `attribute_id` int unsigned not null, `created_at` timestamp null, `updated_at` timestamp null) default character set utf8mb4 collate \'utf8mb4_unicode_ci\'\",\"time\":\"4.34\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/doctoworld\\/doctoworld\\/artisan\",\"line\":35,\"hash\":\"8528a927eb7ccb4e9f3203ca17183dd8\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-07-09 02:26:10'),(143,'93dd8caa-9399-4f0a-94e0-c7ac4e9da7e1','93dd8cb2-571c-4c73-bf61-06004c49203b',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"alter table `ecommerce_attribute_terms` add constraint `ecommerce_attribute_terms_attribute_id_foreign` foreign key (`attribute_id`) references `ecommerce_attributes` (`id`) on delete cascade\",\"time\":\"12.30\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/doctoworld\\/doctoworld\\/artisan\",\"line\":35,\"hash\":\"8b73e71678d06c4e02ddee15020744f9\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-07-09 02:26:10'),(144,'93dd8caa-93f0-4c02-9b4c-3531cccbbcec','93dd8cb2-571c-4c73-bf61-06004c49203b',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"insert into `migrations` (`migration`, `batch`) values (\'2051_01_01_000038_create_attributes_table\', 1)\",\"time\":\"0.54\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/doctoworld\\/doctoworld\\/artisan\",\"line\":35,\"hash\":\"f2b8e8e4266db16aec6db940c643eb68\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-07-09 02:26:10'),(145,'93dd8caa-9742-4dad-8a93-83f93f3b316d','93dd8cb2-571c-4c73-bf61-06004c49203b',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"create table `ecommerce_products` (`id` int unsigned not null auto_increment primary key, `title` json null, `detail` json null, `meta` json null, `price` double(8, 2) not null, `owner` enum(\'admin\', \'vendor\') not null default \'vendor\', `parent_id` int unsigned null, `attribute_term_id` int unsigned null, `created_at` timestamp null, `updated_at` timestamp null) default character set utf8mb4 collate \'utf8mb4_unicode_ci\'\",\"time\":\"7.82\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/doctoworld\\/doctoworld\\/artisan\",\"line\":35,\"hash\":\"85417132cd29604a1a1be2046c99ae61\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-07-09 02:26:10'),(146,'93dd8caa-9e22-45ce-91f8-b3fc52eb5d00','93dd8cb2-571c-4c73-bf61-06004c49203b',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"alter table `ecommerce_products` add constraint `ecommerce_products_attribute_term_id_foreign` foreign key (`attribute_term_id`) references `ecommerce_attribute_terms` (`id`) on delete cascade\",\"time\":\"17.18\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/doctoworld\\/doctoworld\\/artisan\",\"line\":35,\"hash\":\"5e0f66cc945c2cf47729542f43c44ee0\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-07-09 02:26:10'),(147,'93dd8caa-a07b-44d3-b25d-835e21b76de6','93dd8cb2-571c-4c73-bf61-06004c49203b',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"create table `ecommerce_product_addon_groups` (`id` int unsigned not null auto_increment primary key, `title` json not null, `max_choices` int unsigned not null, `min_choices` int unsigned not null, `product_id` int unsigned not null, `created_at` timestamp null, `updated_at` timestamp null) default character set utf8mb4 collate \'utf8mb4_unicode_ci\'\",\"time\":\"5.51\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/doctoworld\\/doctoworld\\/artisan\",\"line\":35,\"hash\":\"becc007f88705b37288afe7071230735\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-07-09 02:26:10'),(148,'93dd8caa-a691-48fe-bb08-60aa61e64d47','93dd8cb2-571c-4c73-bf61-06004c49203b',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"alter table `ecommerce_product_addon_groups` add constraint `ecommerce_product_addon_groups_product_id_foreign` foreign key (`product_id`) references `ecommerce_products` (`id`) on delete cascade\",\"time\":\"15.25\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/doctoworld\\/doctoworld\\/artisan\",\"line\":35,\"hash\":\"e906823e872c8e751581731a63e3b0ef\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-07-09 02:26:10'),(149,'93dd8caa-a983-4b0d-8c01-67e84550f355','93dd8cb2-571c-4c73-bf61-06004c49203b',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"create table `ecommerce_product_addon_choices` (`id` int unsigned not null auto_increment primary key, `title` json not null, `price` double(8, 2) not null, `product_addon_group_id` int unsigned not null, `created_at` timestamp null, `updated_at` timestamp null) default character set utf8mb4 collate \'utf8mb4_unicode_ci\'\",\"time\":\"6.86\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/doctoworld\\/doctoworld\\/artisan\",\"line\":35,\"hash\":\"28a09181cb6c8db9321064d81a51cb6d\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-07-09 02:26:10'),(150,'93dd8caa-af66-4135-84f1-2ae3f2471745','93dd8cb2-571c-4c73-bf61-06004c49203b',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"alter table `ecommerce_product_addon_choices` add constraint `ecommerce_product_addon_choices_product_addon_group_id_foreign` foreign key (`product_addon_group_id`) references `ecommerce_product_addon_groups` (`id`) on delete cascade\",\"time\":\"14.68\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/doctoworld\\/doctoworld\\/artisan\",\"line\":35,\"hash\":\"bf19add3ad48846da5ea8e153a0c8017\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-07-09 02:26:10'),(151,'93dd8caa-b158-484b-982d-ad1f1abc7d28','93dd8cb2-571c-4c73-bf61-06004c49203b',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"create table `ecommerce_product_categories` (`product_id` int unsigned not null, `category_id` int unsigned not null) default character set utf8mb4 collate \'utf8mb4_unicode_ci\'\",\"time\":\"4.49\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/doctoworld\\/doctoworld\\/artisan\",\"line\":35,\"hash\":\"61d31ff93e6fed8118899fe571f3cfb0\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-07-09 02:26:10'),(152,'93dd8caa-b677-488c-bd78-cb9c2b42db68','93dd8cb2-571c-4c73-bf61-06004c49203b',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"alter table `ecommerce_product_categories` add constraint `ecommerce_product_categories_product_id_foreign` foreign key (`product_id`) references `ecommerce_products` (`id`) on delete cascade\",\"time\":\"12.82\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/doctoworld\\/doctoworld\\/artisan\",\"line\":35,\"hash\":\"c9b84ef51e5a7cd7f29dec26b17541d8\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-07-09 02:26:10'),(153,'93dd8caa-bcfe-4f18-80d7-07be367e1052','93dd8cb2-571c-4c73-bf61-06004c49203b',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"alter table `ecommerce_product_categories` add constraint `ecommerce_product_categories_category_id_foreign` foreign key (`category_id`) references `categories` (`id`) on delete cascade\",\"time\":\"16.37\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/doctoworld\\/doctoworld\\/artisan\",\"line\":35,\"hash\":\"60e11f618d5ce8534b91b19a771bd4df\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-07-09 02:26:10'),(154,'93dd8caa-c0b4-4ac3-ae11-08aa598a69a7','93dd8cb2-571c-4c73-bf61-06004c49203b',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"alter table `ecommerce_product_categories` add unique `ecommerce_product_categories_product_id_category_id_unique`(`product_id`, `category_id`)\",\"time\":\"9.18\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/doctoworld\\/doctoworld\\/artisan\",\"line\":35,\"hash\":\"204c717fd2d2c0b304b3a9954aa418e1\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-07-09 02:26:10'),(155,'93dd8caa-c12b-423a-83db-e777ea83832e','93dd8cb2-571c-4c73-bf61-06004c49203b',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"insert into `migrations` (`migration`, `batch`) values (\'2051_01_01_000040_create_products_table\', 1)\",\"time\":\"0.76\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/doctoworld\\/doctoworld\\/artisan\",\"line\":35,\"hash\":\"f2b8e8e4266db16aec6db940c643eb68\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-07-09 02:26:10'),(156,'93dd8caa-c3ca-4d76-a46f-fec33a3cc9af','93dd8cb2-571c-4c73-bf61-06004c49203b',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"create table `ecommerce_vendor_products` (`id` int unsigned not null auto_increment primary key, `price` double(8, 2) not null, `sale_price` double(8, 2) null, `sale_price_from` date null, `sale_price_to` date null, `stock_quantity` int not null default \'-1\', `stock_low_threshold` int not null default \'0\', `vendor_id` int unsigned not null, `product_id` int unsigned not null, `created_at` timestamp null, `updated_at` timestamp null) default character set utf8mb4 collate \'utf8mb4_unicode_ci\'\",\"time\":\"5.85\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/doctoworld\\/doctoworld\\/artisan\",\"line\":35,\"hash\":\"98a5f4c18cf2408ee3d4c637e5a84f7b\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-07-09 02:26:10'),(157,'93dd8caa-ca5b-41f1-a3bd-8475c3f1f47a','93dd8cb2-571c-4c73-bf61-06004c49203b',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"alter table `ecommerce_vendor_products` add constraint `ecommerce_vendor_products_vendor_id_foreign` foreign key (`vendor_id`) references `ecommerce_vendors` (`id`) on delete cascade\",\"time\":\"16.43\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/doctoworld\\/doctoworld\\/artisan\",\"line\":35,\"hash\":\"ef46e7b0a8b69d15dfaf02bed474937d\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-07-09 02:26:10'),(158,'93dd8caa-d1bb-43bb-80f2-50b228d08b31','93dd8cb2-571c-4c73-bf61-06004c49203b',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"alter table `ecommerce_vendor_products` add constraint `ecommerce_vendor_products_product_id_foreign` foreign key (`product_id`) references `ecommerce_products` (`id`) on delete cascade\",\"time\":\"18.51\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/doctoworld\\/doctoworld\\/artisan\",\"line\":35,\"hash\":\"3fcb888abb013d14fc57da3746051552\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-07-09 02:26:10'),(159,'93dd8caa-d234-478d-91a0-4eb4ec648b8a','93dd8cb2-571c-4c73-bf61-06004c49203b',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"insert into `migrations` (`migration`, `batch`) values (\'2051_01_01_000042_create_vendor_products_table\', 1)\",\"time\":\"0.75\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/doctoworld\\/doctoworld\\/artisan\",\"line\":35,\"hash\":\"f2b8e8e4266db16aec6db940c643eb68\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-07-09 02:26:10'),(160,'93dd8caa-d494-4a97-9d80-6b1e0b158570','93dd8cb2-571c-4c73-bf61-06004c49203b',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"create table `ecommerce_vendor_product_categories` (`vendor_id` int unsigned not null, `category_id` int unsigned not null, `product_id` int unsigned not null) default character set utf8mb4 collate \'utf8mb4_unicode_ci\'\",\"time\":\"5.43\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/doctoworld\\/doctoworld\\/artisan\",\"line\":35,\"hash\":\"4ef8b3c765fe4500750ab6b09dcf5305\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-07-09 02:26:10'),(161,'93dd8caa-da2d-4c66-b3cc-4ea03ef6a176','93dd8cb2-571c-4c73-bf61-06004c49203b',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"alter table `ecommerce_vendor_product_categories` add constraint `ecommerce_vendor_product_categories_vendor_id_foreign` foreign key (`vendor_id`) references `ecommerce_vendors` (`id`) on delete cascade\",\"time\":\"13.98\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/doctoworld\\/doctoworld\\/artisan\",\"line\":35,\"hash\":\"256304cd734a366ec705fac063e2daaa\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-07-09 02:26:10'),(162,'93dd8caa-dfec-4375-a546-85fb217895ae','93dd8cb2-571c-4c73-bf61-06004c49203b',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"alter table `ecommerce_vendor_product_categories` add constraint `ecommerce_vendor_product_categories_category_id_foreign` foreign key (`category_id`) references `categories` (`id`) on delete cascade\",\"time\":\"14.37\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/doctoworld\\/doctoworld\\/artisan\",\"line\":35,\"hash\":\"0e44330d24ce1581c245457985acacce\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-07-09 02:26:10'),(163,'93dd8caa-e6a2-42b8-92bb-c57a21d04ba5','93dd8cb2-571c-4c73-bf61-06004c49203b',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"alter table `ecommerce_vendor_product_categories` add constraint `ecommerce_vendor_product_categories_product_id_foreign` foreign key (`product_id`) references `ecommerce_products` (`id`) on delete cascade\",\"time\":\"16.82\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/doctoworld\\/doctoworld\\/artisan\",\"line\":35,\"hash\":\"ea41f326940da5e9d3fe4c8380a50a8f\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-07-09 02:26:10'),(164,'93dd8caa-e70d-4190-b00f-8f6c056fc765','93dd8cb2-571c-4c73-bf61-06004c49203b',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"insert into `migrations` (`migration`, `batch`) values (\'2051_01_01_000044_create_vendor_product_categories_table\', 1)\",\"time\":\"0.69\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/doctoworld\\/doctoworld\\/artisan\",\"line\":35,\"hash\":\"f2b8e8e4266db16aec6db940c643eb68\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-07-09 02:26:10'),(165,'93dd8caa-e955-40d6-8833-8682b23cbe50','93dd8cb2-571c-4c73-bf61-06004c49203b',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"create table `ecommerce_order_conditions` (`id` int unsigned not null auto_increment primary key, `title` varchar(191) not null, `type` varchar(191) not null, `operator` varchar(191) not null, `value` varchar(191) not null) default character set utf8mb4 collate \'utf8mb4_unicode_ci\'\",\"time\":\"5.30\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/doctoworld\\/doctoworld\\/artisan\",\"line\":35,\"hash\":\"2dadc5906c21675027270a14cb7b3b6d\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-07-09 02:26:10'),(166,'93dd8caa-e9af-46fd-90bb-6c6e8f94e66d','93dd8cb2-571c-4c73-bf61-06004c49203b',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"insert into `migrations` (`migration`, `batch`) values (\'2051_01_01_000050_create_order_conditions_table\', 1)\",\"time\":\"0.56\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/doctoworld\\/doctoworld\\/artisan\",\"line\":35,\"hash\":\"f2b8e8e4266db16aec6db940c643eb68\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-07-09 02:26:10'),(167,'93dd8caa-ec71-48a1-b0c0-e61090c9725e','93dd8cb2-571c-4c73-bf61-06004c49203b',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"create table `ecommerce_orders` (`id` int unsigned not null auto_increment primary key, `notes` varchar(255) null, `meta` json null, `is_guest` tinyint(1) not null default \'0\', `customer_name` varchar(191) null, `customer_email` varchar(191) null, `customer_mobile` varchar(191) null, `subtotal` double(8, 2) not null, `taxes` double(8, 2) not null, `delivery_fee` double(8, 2) not null, `total` double(8, 2) not null, `discount` double(8, 2) not null, `type` enum(\'ASAP\', \'LATER\') not null default \'ASAP\', `scheduled_on` datetime not null default CURRENT_TIMESTAMP, `vendor_id` int unsigned null, `user_id` int unsigned null, `created_at` timestamp null, `updated_at` timestamp null) default character set utf8mb4 collate \'utf8mb4_unicode_ci\'\",\"time\":\"6.05\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/doctoworld\\/doctoworld\\/artisan\",\"line\":35,\"hash\":\"91990533fba87df761a8c875ac3c8125\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-07-09 02:26:10'),(168,'93dd8caa-f2e4-467e-97ff-172175624a47','93dd8cb2-571c-4c73-bf61-06004c49203b',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"alter table `ecommerce_orders` add constraint `ecommerce_orders_vendor_id_foreign` foreign key (`vendor_id`) references `ecommerce_vendors` (`id`) on delete set null\",\"time\":\"16.19\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/doctoworld\\/doctoworld\\/artisan\",\"line\":35,\"hash\":\"fc1c3ed6116d0cd0a03d2b0b4fa5a5d3\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-07-09 02:26:10'),(169,'93dd8caa-f9b4-4057-9b12-6ba3f8873932','93dd8cb2-571c-4c73-bf61-06004c49203b',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"alter table `ecommerce_orders` add constraint `ecommerce_orders_user_id_foreign` foreign key (`user_id`) references `users` (`id`) on delete cascade\",\"time\":\"17.12\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/doctoworld\\/doctoworld\\/artisan\",\"line\":35,\"hash\":\"a87fd79ef272c5508c4b456fcb9baa7e\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-07-09 02:26:10'),(170,'93dd8caa-fa0b-4d2d-929d-320cbc9f6c8b','93dd8cb2-571c-4c73-bf61-06004c49203b',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"insert into `migrations` (`migration`, `batch`) values (\'2051_01_01_000060_create_orders_table\', 1)\",\"time\":\"0.52\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/doctoworld\\/doctoworld\\/artisan\",\"line\":35,\"hash\":\"f2b8e8e4266db16aec6db940c643eb68\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-07-09 02:26:10'),(171,'93dd8caa-fc5e-49b4-889f-75b1df41fbc9','93dd8cb2-571c-4c73-bf61-06004c49203b',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"create table `ecommerce_order_deliveries` (`id` int unsigned not null auto_increment primary key, `order_id` int unsigned not null, `delivery_profile_id` int unsigned null, `created_at` timestamp null, `updated_at` timestamp null) default character set utf8mb4 collate \'utf8mb4_unicode_ci\'\",\"time\":\"5.35\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/doctoworld\\/doctoworld\\/artisan\",\"line\":35,\"hash\":\"c22b7f3651b272ab5b0ef0b1f89930a5\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-07-09 02:26:10'),(172,'93dd8cab-01e6-4045-98c9-b5ceec56bf15','93dd8cb2-571c-4c73-bf61-06004c49203b',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"alter table `ecommerce_order_deliveries` add constraint `ecommerce_order_deliveries_order_id_foreign` foreign key (`order_id`) references `ecommerce_orders` (`id`) on delete cascade\",\"time\":\"13.83\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/doctoworld\\/doctoworld\\/artisan\",\"line\":35,\"hash\":\"ac0d27ab952f5f43709070b164015977\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-07-09 02:26:10'),(173,'93dd8cab-08fa-495e-b89c-72612865f56d','93dd8cb2-571c-4c73-bf61-06004c49203b',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"alter table `ecommerce_order_deliveries` add constraint `ecommerce_order_deliveries_delivery_profile_id_foreign` foreign key (`delivery_profile_id`) references `ecommerce_delivery_profiles` (`id`) on delete cascade\",\"time\":\"17.78\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/doctoworld\\/doctoworld\\/artisan\",\"line\":35,\"hash\":\"f93dd3b9d57196686b83e273d8328e3b\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-07-09 02:26:10'),(174,'93dd8cab-095e-4fff-9ee4-9df00d2a9397','93dd8cb2-571c-4c73-bf61-06004c49203b',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"insert into `migrations` (`migration`, `batch`) values (\'2051_01_01_000070_create_order_deliveries_table\', 1)\",\"time\":\"0.62\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/doctoworld\\/doctoworld\\/artisan\",\"line\":35,\"hash\":\"f2b8e8e4266db16aec6db940c643eb68\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-07-09 02:26:10'),(175,'93dd8cab-0c2f-4fb8-9673-47bec871b988','93dd8cb2-571c-4c73-bf61-06004c49203b',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"create table `ecommerce_order_addresses` (`id` int unsigned not null auto_increment primary key, `name` varchar(191) null, `email` varchar(191) null, `mobile` varchar(191) null, `formatted_address` varchar(191) not null, `address1` varchar(191) null, `address2` varchar(191) null, `country` varchar(191) null, `state` varchar(191) null, `city` varchar(191) null, `postcode` varchar(191) null, `longitude` decimal(15, 7) not null, `latitude` decimal(15, 7) not null, `order_id` int unsigned not null, `created_at` timestamp null, `updated_at` timestamp null) default character set utf8mb4 collate \'utf8mb4_unicode_ci\'\",\"time\":\"6.39\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/doctoworld\\/doctoworld\\/artisan\",\"line\":35,\"hash\":\"991c53c9c3418a30588662b163902ddb\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-07-09 02:26:10'),(176,'93dd8cab-12a6-4073-bb02-909c7a4c777e','93dd8cb2-571c-4c73-bf61-06004c49203b',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"alter table `ecommerce_order_addresses` add constraint `ecommerce_order_addresses_order_id_foreign` foreign key (`order_id`) references `ecommerce_orders` (`id`) on delete cascade\",\"time\":\"16.20\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/doctoworld\\/doctoworld\\/artisan\",\"line\":35,\"hash\":\"c6fccc675256187fe418f350d71764c5\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-07-09 02:26:10'),(177,'93dd8cab-186c-437f-b4b8-bbd324154c0c','93dd8cb2-571c-4c73-bf61-06004c49203b',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"insert into `migrations` (`migration`, `batch`) values (\'2051_01_01_000080_create_order_addresses_table\', 1)\",\"time\":\"14.32\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/doctoworld\\/doctoworld\\/artisan\",\"line\":35,\"hash\":\"f2b8e8e4266db16aec6db940c643eb68\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-07-09 02:26:10'),(178,'93dd8cab-1ae6-4874-af7c-1df0beb0bde5','93dd8cb2-571c-4c73-bf61-06004c49203b',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"create table `ecommerce_order_products` (`id` int unsigned not null auto_increment primary key, `quantity` int not null, `total` decimal(8, 2) not null, `order_id` int unsigned not null, `vendor_product_id` int unsigned not null, `created_at` timestamp null, `updated_at` timestamp null) default character set utf8mb4 collate \'utf8mb4_unicode_ci\'\",\"time\":\"5.61\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/doctoworld\\/doctoworld\\/artisan\",\"line\":35,\"hash\":\"7e3839bdd0f772381001a5951e9103c3\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-07-09 02:26:10'),(179,'93dd8cab-212d-4bf4-bfdc-8f365028fe3f','93dd8cb2-571c-4c73-bf61-06004c49203b',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"alter table `ecommerce_order_products` add constraint `ecommerce_order_products_order_id_foreign` foreign key (`order_id`) references `ecommerce_orders` (`id`) on delete cascade\",\"time\":\"15.74\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/doctoworld\\/doctoworld\\/artisan\",\"line\":35,\"hash\":\"99fd43c3be16f295e1c2b8afcbd8790f\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-07-09 02:26:10'),(180,'93dd8cab-2959-41a9-9f4a-bdc4b31c1c73','93dd8cb2-571c-4c73-bf61-06004c49203b',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"alter table `ecommerce_order_products` add constraint `ecommerce_order_products_vendor_product_id_foreign` foreign key (`vendor_product_id`) references `ecommerce_vendor_products` (`id`) on delete cascade\",\"time\":\"20.58\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/doctoworld\\/doctoworld\\/artisan\",\"line\":35,\"hash\":\"dd6279b0dcab3a86a77c758e74a96fd3\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-07-09 02:26:10'),(181,'93dd8cab-29d2-4d31-aa74-269cbbda3cef','93dd8cb2-571c-4c73-bf61-06004c49203b',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"insert into `migrations` (`migration`, `batch`) values (\'2051_01_01_000100_create_order_products_table\', 1)\",\"time\":\"0.82\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/doctoworld\\/doctoworld\\/artisan\",\"line\":35,\"hash\":\"f2b8e8e4266db16aec6db940c643eb68\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-07-09 02:26:10'),(182,'93dd8cab-2c5e-4993-b92c-62782f3fb79f','93dd8cb2-571c-4c73-bf61-06004c49203b',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"create table `ecommerce_order_product_addons` (`id` int unsigned not null auto_increment primary key, `total` decimal(8, 2) not null, `product_addon_choice_id` int unsigned not null, `order_product_id` int unsigned not null, `created_at` timestamp null, `updated_at` timestamp null) default character set utf8mb4 collate \'utf8mb4_unicode_ci\'\",\"time\":\"5.86\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/doctoworld\\/doctoworld\\/artisan\",\"line\":35,\"hash\":\"58d6da4e8f0a24f0e43acfb7a0f10d83\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-07-09 02:26:10'),(183,'93dd8cab-334b-424e-a7a9-011504483a19','93dd8cb2-571c-4c73-bf61-06004c49203b',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"alter table `ecommerce_order_product_addons` add constraint `ecommerce_order_product_addons_product_addon_choice_id_foreign` foreign key (`product_addon_choice_id`) references `ecommerce_product_addon_choices` (`id`) on delete cascade\",\"time\":\"17.36\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/doctoworld\\/doctoworld\\/artisan\",\"line\":35,\"hash\":\"12fb8e7d49d60321c1d97fa46204bfbe\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-07-09 02:26:10'),(184,'93dd8cab-3a2b-481e-aa19-21890da31c15','93dd8cb2-571c-4c73-bf61-06004c49203b',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"alter table `ecommerce_order_product_addons` add constraint `ecommerce_order_product_addons_order_product_id_foreign` foreign key (`order_product_id`) references `ecommerce_order_products` (`id`) on delete cascade\",\"time\":\"17.25\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/doctoworld\\/doctoworld\\/artisan\",\"line\":35,\"hash\":\"f405547c888277b4b3dcebc19821cb4d\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-07-09 02:26:10'),(185,'93dd8cab-3a96-413f-9c8a-bc4c130d4ef9','93dd8cb2-571c-4c73-bf61-06004c49203b',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"insert into `migrations` (`migration`, `batch`) values (\'2051_01_01_000110_create_order_product_addons_table\', 1)\",\"time\":\"0.71\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/doctoworld\\/doctoworld\\/artisan\",\"line\":35,\"hash\":\"f2b8e8e4266db16aec6db940c643eb68\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-07-09 02:26:10'),(186,'93dd8cab-3d04-4f1c-960c-77348a14ee15','93dd8cb2-571c-4c73-bf61-06004c49203b',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"create table `ecommerce_coupons` (`id` int unsigned not null auto_increment primary key, `title` json null, `detail` json null, `meta` json null, `code` varchar(32) not null, `reward` int not null, `type` enum(\'fixed\', \'percent\') not null, `expires_at` date null, `created_at` timestamp null, `updated_at` timestamp null) default character set utf8mb4 collate \'utf8mb4_unicode_ci\'\",\"time\":\"5.56\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/doctoworld\\/doctoworld\\/artisan\",\"line\":35,\"hash\":\"f9889cd203437cfdfdbe6b7e1ff852dd\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-07-09 02:26:10'),(187,'93dd8cab-3f71-4d08-9634-f8c06b555e69','93dd8cb2-571c-4c73-bf61-06004c49203b',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"alter table `ecommerce_coupons` add unique `ecommerce_coupons_code_unique`(`code`)\",\"time\":\"5.90\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/doctoworld\\/doctoworld\\/artisan\",\"line\":35,\"hash\":\"d435fe75be93a52df12d8d78c438ede2\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-07-09 02:26:10'),(188,'93dd8cab-4189-455e-9449-dcdd7dd3c80e','93dd8cb2-571c-4c73-bf61-06004c49203b',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"create table `ecommerce_coupons_users` (`user_id` int unsigned not null, `coupon_id` int unsigned not null, `used_at` timestamp not null) default character set utf8mb4 collate \'utf8mb4_unicode_ci\'\",\"time\":\"4.79\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/doctoworld\\/doctoworld\\/artisan\",\"line\":35,\"hash\":\"628e0c3b043ec99d67bbcf89edd53d51\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-07-09 02:26:10'),(189,'93dd8cab-44ef-40a0-ab0c-dc213f33c9ed','93dd8cb2-571c-4c73-bf61-06004c49203b',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"alter table `ecommerce_coupons_users` add primary key `ecommerce_coupons_users_user_id_coupon_id_primary`(`user_id`, `coupon_id`)\",\"time\":\"8.25\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/doctoworld\\/doctoworld\\/artisan\",\"line\":35,\"hash\":\"d925cca230135aeeecdc8577ae9fd8b9\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-07-09 02:26:10'),(190,'93dd8cab-4d34-45ab-9cf7-3aadc20fd187','93dd8cb2-571c-4c73-bf61-06004c49203b',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"alter table `ecommerce_coupons_users` add constraint `ecommerce_coupons_users_user_id_foreign` foreign key (`user_id`) references `users` (`id`) on delete cascade\",\"time\":\"20.82\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/doctoworld\\/doctoworld\\/artisan\",\"line\":35,\"hash\":\"0a9c1a834b107f1ec0d8b5d6584e97b9\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-07-09 02:26:10'),(191,'93dd8cab-52bd-4f94-a763-02ce114b3ed8','93dd8cb2-571c-4c73-bf61-06004c49203b',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"alter table `ecommerce_coupons_users` add constraint `ecommerce_coupons_users_coupon_id_foreign` foreign key (`coupon_id`) references `ecommerce_coupons` (`id`) on delete cascade\",\"time\":\"13.85\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/doctoworld\\/doctoworld\\/artisan\",\"line\":35,\"hash\":\"491640cadd3cbfee75241552efc14d16\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-07-09 02:26:10'),(192,'93dd8cab-531b-4dfb-ab53-f42f97809c53','93dd8cb2-571c-4c73-bf61-06004c49203b',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"insert into `migrations` (`migration`, `batch`) values (\'2051_01_01_000120_create_coupons_table\', 1)\",\"time\":\"0.59\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/doctoworld\\/doctoworld\\/artisan\",\"line\":35,\"hash\":\"f2b8e8e4266db16aec6db940c643eb68\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-07-09 02:26:10'),(193,'93dd8cab-5531-4df6-8970-81131b18f0b5','93dd8cb2-571c-4c73-bf61-06004c49203b',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"create table `ecommerce_delivery_order_requests` (`id` int unsigned not null auto_increment primary key, `meta` json null, `delivery_profile_id` int unsigned not null, `order_id` int unsigned not null, `created_at` timestamp null, `updated_at` timestamp null) default character set utf8mb4 collate \'utf8mb4_unicode_ci\'\",\"time\":\"4.74\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/doctoworld\\/doctoworld\\/artisan\",\"line\":35,\"hash\":\"ef104f7eb8af4b78ffeed44676d2a715\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-07-09 02:26:10'),(194,'93dd8cab-5b0b-4df4-a1ac-ef0355e9e712','93dd8cb2-571c-4c73-bf61-06004c49203b',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"alter table `ecommerce_delivery_order_requests` add constraint `ecommerce_delivery_order_requests_delivery_profile_id_foreign` foreign key (`delivery_profile_id`) references `ecommerce_delivery_profiles` (`id`) on delete cascade\",\"time\":\"14.68\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/doctoworld\\/doctoworld\\/artisan\",\"line\":35,\"hash\":\"3c679a1f137a71d1e117f7e6a1f74093\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-07-09 02:26:10'),(195,'93dd8cab-620f-4fc9-90fa-ef03467adb54','93dd8cb2-571c-4c73-bf61-06004c49203b',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"alter table `ecommerce_delivery_order_requests` add constraint `ecommerce_delivery_order_requests_order_id_foreign` foreign key (`order_id`) references `ecommerce_orders` (`id`) on delete cascade\",\"time\":\"17.62\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/doctoworld\\/doctoworld\\/artisan\",\"line\":35,\"hash\":\"bb670c1e6e310f0c3c5974fd54deca6e\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-07-09 02:26:10'),(196,'93dd8cab-64b4-49c5-a993-d42185995ed5','93dd8cb2-571c-4c73-bf61-06004c49203b',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"alter table `ecommerce_delivery_order_requests` add unique `unique_delivery_profile_order`(`delivery_profile_id`, `order_id`)\",\"time\":\"6.45\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/doctoworld\\/doctoworld\\/artisan\",\"line\":35,\"hash\":\"ee65bcfe42da33bec840541c9a1beaf4\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-07-09 02:26:10'),(197,'93dd8cab-6524-43a6-bea5-b48c3cb6f6c9','93dd8cb2-571c-4c73-bf61-06004c49203b',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"insert into `migrations` (`migration`, `batch`) values (\'2051_01_01_000130_create_delivery_order_requests_table\', 1)\",\"time\":\"0.72\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/doctoworld\\/doctoworld\\/artisan\",\"line\":35,\"hash\":\"f2b8e8e4266db16aec6db940c643eb68\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-07-09 02:26:10'),(198,'93dd8cab-67de-43bc-a668-4022d5c0a9b0','93dd8cb2-571c-4c73-bf61-06004c49203b',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"create table `category_preferences` (`category_id` int unsigned null, `user_id` int unsigned null, `created_at` timestamp null, `updated_at` timestamp null) default character set utf8mb4 collate \'utf8mb4_unicode_ci\'\",\"time\":\"6.34\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/doctoworld\\/doctoworld\\/artisan\",\"line\":35,\"hash\":\"70a3667ee6676c92bd5b805d08be7312\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-07-09 02:26:10'),(199,'93dd8cab-6dec-461c-a487-1252a6364cb3','93dd8cb2-571c-4c73-bf61-06004c49203b',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"alter table `category_preferences` add constraint `category_preferences_category_id_foreign` foreign key (`category_id`) references `categories` (`id`) on delete cascade\",\"time\":\"15.14\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/doctoworld\\/doctoworld\\/artisan\",\"line\":35,\"hash\":\"79a6401245cff7b84aca5745f5dca665\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-07-09 02:26:11'),(200,'93dd8cab-7509-4faa-8b7f-e8d14cc48df6','93dd8cb2-571c-4c73-bf61-06004c49203b',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"alter table `category_preferences` add constraint `category_preferences_user_id_foreign` foreign key (`user_id`) references `users` (`id`) on delete cascade\",\"time\":\"17.87\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/doctoworld\\/doctoworld\\/artisan\",\"line\":35,\"hash\":\"79629ca78a168c0c3971e40ec8cd4d37\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-07-09 02:26:11'),(201,'93dd8cab-7569-4c58-9750-dfcf8f7253eb','93dd8cb2-571c-4c73-bf61-06004c49203b',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"insert into `migrations` (`migration`, `batch`) values (\'2051_01_01_000200_create_category_preferences_table\', 1)\",\"time\":\"0.60\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/doctoworld\\/doctoworld\\/artisan\",\"line\":35,\"hash\":\"f2b8e8e4266db16aec6db940c643eb68\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-07-09 02:26:11'),(202,'93dd8cab-77d5-4cbb-bdb9-34d77a09c7cc','93dd8cb2-571c-4c73-bf61-06004c49203b',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"create table `doctor_hospitals` (`id` int unsigned not null auto_increment primary key, `slug` varchar(191) not null, `name` json not null, `tagline` json null, `details` json null, `meta` json null, `address` varchar(191) null, `longitude` decimal(15, 7) not null default \'0\', `latitude` decimal(15, 7) not null default \'0\', `sort_order` int not null default \'1\', `created_at` timestamp null, `updated_at` timestamp null) default character set utf8mb4 collate \'utf8mb4_unicode_ci\'\",\"time\":\"5.53\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/doctoworld\\/doctoworld\\/artisan\",\"line\":35,\"hash\":\"62a979f15f24a51e81b7d06b85971083\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-07-09 02:26:11'),(203,'93dd8cab-7869-4a69-82f0-093fd212d570','93dd8cb2-571c-4c73-bf61-06004c49203b',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"insert into `migrations` (`migration`, `batch`) values (\'2051_01_01_000200_create_hospitals_table\', 1)\",\"time\":\"1.14\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/doctoworld\\/doctoworld\\/artisan\",\"line\":35,\"hash\":\"f2b8e8e4266db16aec6db940c643eb68\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-07-09 02:26:11'),(204,'93dd8cab-7ac6-4280-9277-cdf30bc53dff','93dd8cb2-571c-4c73-bf61-06004c49203b',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"create table `doctor_profiles` (`id` int unsigned not null auto_increment primary key, `name` json null, `tagline` json null, `details` json null, `meta` json null, `experience_years` int not null default \'0\', `address` varchar(191) null, `longitude` decimal(15, 7) not null default \'0\', `latitude` decimal(15, 7) not null default \'0\', `is_verified` tinyint(1) not null default \'1\', `user_id` int unsigned not null, `created_at` timestamp null, `updated_at` timestamp null) default character set utf8mb4 collate \'utf8mb4_unicode_ci\'\",\"time\":\"5.35\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/doctoworld\\/doctoworld\\/artisan\",\"line\":35,\"hash\":\"0f3a385b747ce43ce588b68d64d182f2\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-07-09 02:26:11'),(205,'93dd8cab-80e9-4f0a-95ab-1c114fa122bb','93dd8cb2-571c-4c73-bf61-06004c49203b',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"alter table `doctor_profiles` add constraint `doctor_profiles_user_id_foreign` foreign key (`user_id`) references `users` (`id`) on delete cascade\",\"time\":\"15.42\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/doctoworld\\/doctoworld\\/artisan\",\"line\":35,\"hash\":\"db89338856d209aed6ce7c3ea365c585\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-07-09 02:26:11'),(206,'93dd8cab-82e5-44d7-b0bd-a1350b718c96','93dd8cb2-571c-4c73-bf61-06004c49203b',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"create table `doctor_profiles_hospitals` (`fee` decimal(8, 2) unsigned not null, `doctor_profile_id` int unsigned not null, `hospital_id` int unsigned not null) default character set utf8mb4 collate \'utf8mb4_unicode_ci\'\",\"time\":\"4.64\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/doctoworld\\/doctoworld\\/artisan\",\"line\":35,\"hash\":\"2fcacb17a6ce59eb9c47fabe23712577\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-07-09 02:26:11'),(207,'93dd8cab-883a-4c86-ad91-d0352325152f','93dd8cb2-571c-4c73-bf61-06004c49203b',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"alter table `doctor_profiles_hospitals` add constraint `doctor_profiles_hospitals_doctor_profile_id_foreign` foreign key (`doctor_profile_id`) references `doctor_profiles` (`id`) on delete cascade\",\"time\":\"13.32\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/doctoworld\\/doctoworld\\/artisan\",\"line\":35,\"hash\":\"05bf30df17707822963ca3adea89100a\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-07-09 02:26:11'),(208,'93dd8cab-917e-46bf-92f7-8a7a8f46cbaf','93dd8cb2-571c-4c73-bf61-06004c49203b',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"alter table `doctor_profiles_hospitals` add constraint `doctor_profiles_hospitals_hospital_id_foreign` foreign key (`hospital_id`) references `doctor_hospitals` (`id`) on delete cascade\",\"time\":\"23.34\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/doctoworld\\/doctoworld\\/artisan\",\"line\":35,\"hash\":\"96c8ae11a458d23c713a5f8ac923430e\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-07-09 02:26:11'),(209,'93dd8cab-9377-4a3e-ac12-a660dc5bce51','93dd8cb2-571c-4c73-bf61-06004c49203b',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"create table `doctor_profiles_degrees` (`doctor_profile_id` int unsigned not null, `category_id` int unsigned not null) default character set utf8mb4 collate \'utf8mb4_unicode_ci\'\",\"time\":\"4.57\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/doctoworld\\/doctoworld\\/artisan\",\"line\":35,\"hash\":\"94f758f3b2d536ff498726b9ab0b75db\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-07-09 02:26:11'),(210,'93dd8cab-98ae-48f4-a6cb-adc08b2f5f4b','93dd8cb2-571c-4c73-bf61-06004c49203b',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"alter table `doctor_profiles_degrees` add constraint `doctor_profiles_degrees_doctor_profile_id_foreign` foreign key (`doctor_profile_id`) references `doctor_profiles` (`id`) on delete cascade\",\"time\":\"13.04\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/doctoworld\\/doctoworld\\/artisan\",\"line\":35,\"hash\":\"b5dd73e2f4f6d6a32486e30a3644d1a8\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-07-09 02:26:11'),(211,'93dd8cab-a046-4eea-8eb6-ab1f94f954af','93dd8cb2-571c-4c73-bf61-06004c49203b',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"alter table `doctor_profiles_degrees` add constraint `doctor_profiles_degrees_category_id_foreign` foreign key (`category_id`) references `categories` (`id`) on delete cascade\",\"time\":\"19.11\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/doctoworld\\/doctoworld\\/artisan\",\"line\":35,\"hash\":\"cf2ca19cfe3d8dca6f55a602e1078508\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-07-09 02:26:11'),(212,'93dd8cab-a230-49dd-8a85-e2898a3a11d8','93dd8cb2-571c-4c73-bf61-06004c49203b',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"create table `doctor_profiles_services` (`doctor_profile_id` int unsigned not null, `category_id` int unsigned not null) default character set utf8mb4 collate \'utf8mb4_unicode_ci\'\",\"time\":\"4.45\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/doctoworld\\/doctoworld\\/artisan\",\"line\":35,\"hash\":\"23cb65375e3cc7c5e9a3d07972ef4674\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-07-09 02:26:11'),(213,'93dd8cab-a74b-4f13-8c4e-6121a7174337','93dd8cb2-571c-4c73-bf61-06004c49203b',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"alter table `doctor_profiles_services` add constraint `doctor_profiles_services_doctor_profile_id_foreign` foreign key (`doctor_profile_id`) references `doctor_profiles` (`id`) on delete cascade\",\"time\":\"12.74\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/doctoworld\\/doctoworld\\/artisan\",\"line\":35,\"hash\":\"fa383efc6aca6f0f1ede5740b5a83b4d\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-07-09 02:26:11'),(214,'93dd8cab-ae0d-4cb1-8f25-b1df30775b40','93dd8cb2-571c-4c73-bf61-06004c49203b',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"alter table `doctor_profiles_services` add constraint `doctor_profiles_services_category_id_foreign` foreign key (`category_id`) references `categories` (`id`) on delete cascade\",\"time\":\"16.90\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/doctoworld\\/doctoworld\\/artisan\",\"line\":35,\"hash\":\"5298b73e69c26102491a30176aeeac7e\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-07-09 02:26:11'),(215,'93dd8cab-afd4-4704-b244-edd88b2401e1','93dd8cb2-571c-4c73-bf61-06004c49203b',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"create table `doctor_profiles_specializations` (`doctor_profile_id` int unsigned not null, `category_id` int unsigned not null) default character set utf8mb4 collate \'utf8mb4_unicode_ci\'\",\"time\":\"4.09\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/doctoworld\\/doctoworld\\/artisan\",\"line\":35,\"hash\":\"285fb95ed6051b5c0dce651f2f2422b4\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-07-09 02:26:11'),(216,'93dd8cab-b4fa-44b0-b3fe-34369fd42360','93dd8cb2-571c-4c73-bf61-06004c49203b',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"alter table `doctor_profiles_specializations` add constraint `doctor_profiles_specializations_doctor_profile_id_foreign` foreign key (`doctor_profile_id`) references `doctor_profiles` (`id`) on delete cascade\",\"time\":\"12.89\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/doctoworld\\/doctoworld\\/artisan\",\"line\":35,\"hash\":\"b00936ef33e076c704f9f5e0243e74bc\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-07-09 02:26:11'),(217,'93dd8cab-baa1-4b5a-b52e-ad084b7c4b5a','93dd8cb2-571c-4c73-bf61-06004c49203b',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"alter table `doctor_profiles_specializations` add constraint `doctor_profiles_specializations_category_id_foreign` foreign key (`category_id`) references `categories` (`id`) on delete cascade\",\"time\":\"14.17\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/doctoworld\\/doctoworld\\/artisan\",\"line\":35,\"hash\":\"7952636e6e4a22aeb07e6e7ec995e9af\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-07-09 02:26:11'),(218,'93dd8cab-bb06-400c-b90a-63061756da86','93dd8cb2-571c-4c73-bf61-06004c49203b',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"insert into `migrations` (`migration`, `batch`) values (\'2051_01_01_000210_create_doctors_table\', 1)\",\"time\":\"0.67\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/doctoworld\\/doctoworld\\/artisan\",\"line\":35,\"hash\":\"f2b8e8e4266db16aec6db940c643eb68\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-07-09 02:26:11'),(219,'93dd8cab-bd05-485b-859a-cae2556d151b','93dd8cb2-571c-4c73-bf61-06004c49203b',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"create table `doctor_availabilities` (`id` int unsigned not null auto_increment primary key, `days` enum(\'sun\', \'mon\', \'tue\', \'wed\', \'thu\', \'fri\', \'sat\') not null, `from` time not null, `to` time not null, `doctor_profile_id` int unsigned not null) default character set utf8mb4 collate \'utf8mb4_unicode_ci\'\",\"time\":\"4.50\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/doctoworld\\/doctoworld\\/artisan\",\"line\":35,\"hash\":\"8c082d55630ee93d6f87f9337f12696c\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-07-09 02:26:11'),(220,'93dd8cab-c20a-495a-8dd7-57db4dd2dad5','93dd8cb2-571c-4c73-bf61-06004c49203b',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"alter table `doctor_availabilities` add constraint `doctor_availabilities_doctor_profile_id_foreign` foreign key (`doctor_profile_id`) references `doctor_profiles` (`id`) on delete cascade\",\"time\":\"12.56\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/doctoworld\\/doctoworld\\/artisan\",\"line\":35,\"hash\":\"f96511d7d3eb0d9fc78a5a4ad7689b52\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-07-09 02:26:11'),(221,'93dd8cab-c25b-44c8-b61e-53360fe07230','93dd8cb2-571c-4c73-bf61-06004c49203b',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"insert into `migrations` (`migration`, `batch`) values (\'2051_01_01_000215_create_availabilities_table\', 1)\",\"time\":\"0.49\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/doctoworld\\/doctoworld\\/artisan\",\"line\":35,\"hash\":\"f2b8e8e4266db16aec6db940c643eb68\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-07-09 02:26:11'),(222,'93dd8cab-c40c-41d2-8b9a-cd7080953024','93dd8cb2-571c-4c73-bf61-06004c49203b',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"create table `doctor_profiles_types` (`doctor_profile_id` int unsigned not null, `category_id` int unsigned not null) default character set utf8mb4 collate \'utf8mb4_unicode_ci\'\",\"time\":\"3.85\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/doctoworld\\/doctoworld\\/artisan\",\"line\":35,\"hash\":\"31100ab1c44a40dcd3615e1cbda75a32\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-07-09 02:26:11'),(223,'93dd8cab-c928-44c3-8d0e-565451cbf2f1','93dd8cb2-571c-4c73-bf61-06004c49203b',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"alter table `doctor_profiles_types` add constraint `doctor_profiles_types_doctor_profile_id_foreign` foreign key (`doctor_profile_id`) references `doctor_profiles` (`id`) on delete cascade\",\"time\":\"12.79\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/doctoworld\\/doctoworld\\/artisan\",\"line\":35,\"hash\":\"4b3e4c841b1d5cc9f3da138d28ac627d\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-07-09 02:26:11'),(224,'93dd8cab-d3e7-4c97-9c71-191e1b374c3c','93dd8cb2-571c-4c73-bf61-06004c49203b',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"alter table `doctor_profiles_types` add constraint `doctor_profiles_types_category_id_foreign` foreign key (`category_id`) references `categories` (`id`) on delete cascade\",\"time\":\"27.13\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/doctoworld\\/doctoworld\\/artisan\",\"line\":35,\"hash\":\"d21f99d4fb987ac81fc769b551629017\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-07-09 02:26:11'),(225,'93dd8cab-d4bd-409d-a5a2-758e60ec8003','93dd8cb2-571c-4c73-bf61-06004c49203b',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"insert into `migrations` (`migration`, `batch`) values (\'2051_01_01_000220_create_doctors_types_table\', 1)\",\"time\":\"1.65\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/doctoworld\\/doctoworld\\/artisan\",\"line\":35,\"hash\":\"f2b8e8e4266db16aec6db940c643eb68\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-07-09 02:26:11'),(226,'93dd8cab-d6cb-48a3-bb46-959f8e1ae7f5','93dd8cb2-571c-4c73-bf61-06004c49203b',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"create table `doctor_hospital_services` (`hospital_id` int unsigned not null, `category_id` int unsigned not null) default character set utf8mb4 collate \'utf8mb4_unicode_ci\'\",\"time\":\"4.65\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/doctoworld\\/doctoworld\\/artisan\",\"line\":35,\"hash\":\"95c6dbe74e31ec878a66f723a72b6264\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-07-09 02:26:11'),(227,'93dd8cab-dc59-4523-b33b-9bd461a17ea8','93dd8cb2-571c-4c73-bf61-06004c49203b',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"alter table `doctor_hospital_services` add constraint `doctor_hospital_services_hospital_id_foreign` foreign key (`hospital_id`) references `doctor_hospitals` (`id`) on delete cascade\",\"time\":\"13.90\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/doctoworld\\/doctoworld\\/artisan\",\"line\":35,\"hash\":\"6af4f86c70dbe7cea576f74a5a80e554\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-07-09 02:26:11'),(228,'93dd8cab-e255-4303-9aba-8e77d700e088','93dd8cb2-571c-4c73-bf61-06004c49203b',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"alter table `doctor_hospital_services` add constraint `doctor_hospital_services_category_id_foreign` foreign key (`category_id`) references `categories` (`id`) on delete cascade\",\"time\":\"14.98\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/doctoworld\\/doctoworld\\/artisan\",\"line\":35,\"hash\":\"ec77b19fb31a92536101606cd599dada\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-07-09 02:26:11'),(229,'93dd8cab-e2b2-4b05-be76-4a0dfda2ce5e','93dd8cb2-571c-4c73-bf61-06004c49203b',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"insert into `migrations` (`migration`, `batch`) values (\'2051_01_01_000225_create_hospital_services_table\', 1)\",\"time\":\"0.58\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/doctoworld\\/doctoworld\\/artisan\",\"line\":35,\"hash\":\"f2b8e8e4266db16aec6db940c643eb68\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-07-09 02:26:11'),(230,'93dd8cab-e4f1-4c50-af88-e04a504ec6e0','93dd8cb2-571c-4c73-bf61-06004c49203b',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"create table `doctor_hospital_availabilities` (`id` int unsigned not null auto_increment primary key, `days` enum(\'sun\', \'mon\', \'tue\', \'wed\', \'thu\', \'fri\', \'sat\') not null, `from` time not null, `to` time not null, `hospital_id` int unsigned not null) default character set utf8mb4 collate \'utf8mb4_unicode_ci\'\",\"time\":\"5.18\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/doctoworld\\/doctoworld\\/artisan\",\"line\":35,\"hash\":\"6628785a08f80a87df0264eab5d1dafc\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-07-09 02:26:11'),(231,'93dd8cab-eb6c-44d9-9518-7b4474dcad0b','93dd8cb2-571c-4c73-bf61-06004c49203b',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"alter table `doctor_hospital_availabilities` add constraint `doctor_hospital_availabilities_hospital_id_foreign` foreign key (`hospital_id`) references `doctor_hospitals` (`id`) on delete cascade\",\"time\":\"16.27\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/doctoworld\\/doctoworld\\/artisan\",\"line\":35,\"hash\":\"5eb692eef7808c831839e6b06acfb5e3\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-07-09 02:26:11'),(232,'93dd8cab-ebd0-41f3-8af7-2d78a7476588','93dd8cb2-571c-4c73-bf61-06004c49203b',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"insert into `migrations` (`migration`, `batch`) values (\'2051_01_01_000230_create_hospital_availabilities_table\', 1)\",\"time\":\"0.62\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/doctoworld\\/doctoworld\\/artisan\",\"line\":35,\"hash\":\"f2b8e8e4266db16aec6db940c643eb68\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-07-09 02:26:11'),(233,'93dd8cab-f227-4f06-89d8-43d15bfb2830','93dd8cb2-571c-4c73-bf61-06004c49203b',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"alter table `ecommerce_orders` add `distance_travelled` int unsigned not null default \'0\'\",\"time\":\"15.73\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/doctoworld\\/doctoworld\\/artisan\",\"line\":35,\"hash\":\"b55fa73e0ccd59cedac0de5554a88340\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-07-09 02:26:11'),(234,'93dd8cab-f28d-45e2-b765-73d9f0d1b386','93dd8cb2-571c-4c73-bf61-06004c49203b',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"insert into `migrations` (`migration`, `batch`) values (\'2051_01_01_000510_alter_orders_add_distance_travelled_table\', 1)\",\"time\":\"0.67\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/doctoworld\\/doctoworld\\/artisan\",\"line\":35,\"hash\":\"f2b8e8e4266db16aec6db940c643eb68\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-07-09 02:26:11'),(235,'93dd8cab-f837-4d3f-b4ef-845125fe38d1','93dd8cb2-571c-4c73-bf61-06004c49203b',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"alter table `ecommerce_products` add `sells_count` int unsigned not null default \'0\'\",\"time\":\"13.99\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/doctoworld\\/doctoworld\\/artisan\",\"line\":35,\"hash\":\"352f0aba305852cf21e53f414817399e\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-07-09 02:26:11'),(236,'93dd8cab-f894-4983-b6d6-dd8e64f21f40','93dd8cb2-571c-4c73-bf61-06004c49203b',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"insert into `migrations` (`migration`, `batch`) values (\'2051_01_01_000550_alter_products_add_sells_count\', 1)\",\"time\":\"0.59\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/doctoworld\\/doctoworld\\/artisan\",\"line\":35,\"hash\":\"f2b8e8e4266db16aec6db940c643eb68\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-07-09 02:26:11'),(237,'93dd8cab-fda0-458c-8470-a18f22065fed','93dd8cb2-571c-4c73-bf61-06004c49203b',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"create table `wallets` (`id` int unsigned not null auto_increment primary key, `user_id` int unsigned null, `balance` bigint not null default \'0\', `created_at` timestamp null, `updated_at` timestamp null) default character set utf8mb4 collate \'utf8mb4_unicode_ci\'\",\"time\":\"5.95\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/doctoworld\\/doctoworld\\/database\\/migrations\\/2052_02_20_113000_create_wallets_table.php\",\"line\":30,\"hash\":\"cff46513f16ee90983764d7f84a9b55c\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-07-09 02:26:11'),(238,'93dd8cac-04c6-4d37-9bbb-6efbf5d932d9','93dd8cb2-571c-4c73-bf61-06004c49203b',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"alter table `wallets` add constraint `wallets_user_id_foreign` foreign key (`user_id`) references `users` (`id`) on delete set null\",\"time\":\"18.06\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/doctoworld\\/doctoworld\\/database\\/migrations\\/2052_02_20_113000_create_wallets_table.php\",\"line\":30,\"hash\":\"2f9da7e4d06ecd8aaa1642043f062fb7\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-07-09 02:26:11'),(239,'93dd8cac-051c-4322-9674-b27b1802378d','93dd8cb2-571c-4c73-bf61-06004c49203b',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"insert into `migrations` (`migration`, `batch`) values (\'2052_02_20_113000_create_wallets_table\', 1)\",\"time\":\"0.54\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/doctoworld\\/doctoworld\\/artisan\",\"line\":35,\"hash\":\"f2b8e8e4266db16aec6db940c643eb68\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-07-09 02:26:11'),(240,'93dd8cac-0764-4539-bbb5-b95ac48c0fec','93dd8cb2-571c-4c73-bf61-06004c49203b',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"create table `wallet_transactions` (`id` int unsigned not null auto_increment primary key, `wallet_id` int unsigned not null, `amount` int not null, `hash` varchar(60) not null, `type` varchar(30) not null, `accepted` tinyint(1) not null, `meta` json null, `created_at` timestamp null, `updated_at` timestamp null) default character set utf8mb4 collate \'utf8mb4_unicode_ci\'\",\"time\":\"5.33\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/doctoworld\\/doctoworld\\/database\\/migrations\\/2052_02_20_113500_create_wallet_transactions_table.php\",\"line\":29,\"hash\":\"60357801ce99be07bf0fff18a00dcbf8\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-07-09 02:26:11'),(241,'93dd8cac-0f71-4723-bd03-66a4757329a1','93dd8cb2-571c-4c73-bf61-06004c49203b',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"alter table `wallet_transactions` add constraint `wallet_transactions_wallet_id_foreign` foreign key (`wallet_id`) references `wallets` (`id`) on delete cascade\",\"time\":\"20.35\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/doctoworld\\/doctoworld\\/database\\/migrations\\/2052_02_20_113500_create_wallet_transactions_table.php\",\"line\":29,\"hash\":\"b0299888ca646c5db65fe7b2b50b5ee9\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-07-09 02:26:11'),(242,'93dd8cac-0fda-4d54-8bc6-839c12be3e65','93dd8cb2-571c-4c73-bf61-06004c49203b',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"insert into `migrations` (`migration`, `batch`) values (\'2052_02_20_113500_create_wallet_transactions_table\', 1)\",\"time\":\"0.67\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/doctoworld\\/doctoworld\\/artisan\",\"line\":35,\"hash\":\"f2b8e8e4266db16aec6db940c643eb68\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-07-09 02:26:11'),(243,'93dd8cac-2b1d-419f-b94b-76c62ed973b8','93dd8cb2-571c-4c73-bf61-06004c49203b',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"insert into `users` (`active`, `created_at`, `email`, `mobile_number`, `mobile_verified`, `name`, `password`, `updated_at`) values (1, \'2021-07-09 02:26:11\', \'admin@example.com\', \'8888888888\', 1, \'Admin\', \'y$y72RYrGnifu6qnX0uOKIeOuc5qONXaiMfcFlxEYMSip\\/Fh3wmRmBO\', \'2021-07-09 02:26:11\')\",\"time\":\"3.13\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/doctoworld\\/doctoworld\\/database\\/seeds\\/UsersTableSeeder.php\",\"line\":33,\"hash\":\"e748379f562b94becb4e10588106a72e\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-07-09 02:26:11'),(244,'93dd8cac-2d55-47d7-8c4d-3ffd0104e438','93dd8cb2-571c-4c73-bf61-06004c49203b',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"select * from `roles` where `name` = \'admin\' and `guard_name` = \'api\' limit 1\",\"time\":\"0.92\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/doctoworld\\/doctoworld\\/database\\/seeds\\/UsersTableSeeder.php\",\"line\":36,\"hash\":\"de1bc7a62331e87ecc91f3ab3855091f\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-07-09 02:26:11'),(245,'93dd8cac-2e90-428b-a70b-9d5c74e7ba82','93dd8cb2-571c-4c73-bf61-06004c49203b',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"insert into `roles` (`name`, `guard_name`, `updated_at`, `created_at`) values (\'admin\', \'api\', \'2021-07-09 02:26:11\', \'2021-07-09 02:26:11\')\",\"time\":\"1.48\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/doctoworld\\/doctoworld\\/database\\/seeds\\/UsersTableSeeder.php\",\"line\":36,\"hash\":\"2ff04aa60d5cad24fd0a1fad61c9656d\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-07-09 02:26:11'),(246,'93dd8cac-2f23-423c-b342-64ffba1c8b62','93dd8cb2-571c-4c73-bf61-06004c49203b',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"select * from `roles` where `name` = \'customer\' and `guard_name` = \'api\' limit 1\",\"time\":\"0.62\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/doctoworld\\/doctoworld\\/database\\/seeds\\/UsersTableSeeder.php\",\"line\":37,\"hash\":\"de1bc7a62331e87ecc91f3ab3855091f\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-07-09 02:26:11'),(247,'93dd8cac-301d-41e2-99b2-a51bfb36a27b','93dd8cb2-571c-4c73-bf61-06004c49203b',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"insert into `roles` (`name`, `guard_name`, `updated_at`, `created_at`) values (\'customer\', \'api\', \'2021-07-09 02:26:11\', \'2021-07-09 02:26:11\')\",\"time\":\"1.69\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/doctoworld\\/doctoworld\\/database\\/seeds\\/UsersTableSeeder.php\",\"line\":37,\"hash\":\"2ff04aa60d5cad24fd0a1fad61c9656d\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-07-09 02:26:11'),(248,'93dd8cac-3084-4684-8f87-3baed979b3ac','93dd8cb2-571c-4c73-bf61-06004c49203b',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"select * from `roles` where `name` = \'vendor\' and `guard_name` = \'api\' limit 1\",\"time\":\"0.45\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/doctoworld\\/doctoworld\\/database\\/seeds\\/UsersTableSeeder.php\",\"line\":38,\"hash\":\"de1bc7a62331e87ecc91f3ab3855091f\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-07-09 02:26:11'),(249,'93dd8cac-3126-48bc-a93d-d79f905a6710','93dd8cb2-571c-4c73-bf61-06004c49203b',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"insert into `roles` (`name`, `guard_name`, `updated_at`, `created_at`) values (\'vendor\', \'api\', \'2021-07-09 02:26:11\', \'2021-07-09 02:26:11\')\",\"time\":\"0.93\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/doctoworld\\/doctoworld\\/database\\/seeds\\/UsersTableSeeder.php\",\"line\":38,\"hash\":\"2ff04aa60d5cad24fd0a1fad61c9656d\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-07-09 02:26:11'),(250,'93dd8cac-31ea-4d39-8779-83756b625a68','93dd8cb2-571c-4c73-bf61-06004c49203b',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"select * from `roles` where `name` = \'doctor\' and `guard_name` = \'api\' limit 1\",\"time\":\"1.15\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/doctoworld\\/doctoworld\\/database\\/seeds\\/UsersTableSeeder.php\",\"line\":39,\"hash\":\"de1bc7a62331e87ecc91f3ab3855091f\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-07-09 02:26:11'),(251,'93dd8cac-3285-4c91-9d01-4e0a73d11f99','93dd8cb2-571c-4c73-bf61-06004c49203b',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"insert into `roles` (`name`, `guard_name`, `updated_at`, `created_at`) values (\'doctor\', \'api\', \'2021-07-09 02:26:11\', \'2021-07-09 02:26:11\')\",\"time\":\"0.88\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/doctoworld\\/doctoworld\\/database\\/seeds\\/UsersTableSeeder.php\",\"line\":39,\"hash\":\"2ff04aa60d5cad24fd0a1fad61c9656d\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-07-09 02:26:11'),(252,'93dd8cac-3328-45da-9be7-f3a378877f14','93dd8cb2-571c-4c73-bf61-06004c49203b',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"select * from `roles` where `name` = \'delivery\' and `guard_name` = \'api\' limit 1\",\"time\":\"1.06\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/doctoworld\\/doctoworld\\/database\\/seeds\\/UsersTableSeeder.php\",\"line\":40,\"hash\":\"de1bc7a62331e87ecc91f3ab3855091f\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-07-09 02:26:11'),(253,'93dd8cac-33b5-47b0-8330-5ce6c75d8731','93dd8cb2-571c-4c73-bf61-06004c49203b',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"insert into `roles` (`name`, `guard_name`, `updated_at`, `created_at`) values (\'delivery\', \'api\', \'2021-07-09 02:26:11\', \'2021-07-09 02:26:11\')\",\"time\":\"0.80\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/doctoworld\\/doctoworld\\/database\\/seeds\\/UsersTableSeeder.php\",\"line\":40,\"hash\":\"2ff04aa60d5cad24fd0a1fad61c9656d\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-07-09 02:26:11'),(254,'93dd8cac-3429-4a1a-99ad-e553cc299e2a','93dd8cb2-571c-4c73-bf61-06004c49203b',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"select * from `users` where `email` = \'admin@example.com\' limit 1\",\"time\":\"0.52\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/doctoworld\\/doctoworld\\/database\\/seeds\\/UsersTableSeeder.php\",\"line\":48,\"hash\":\"747ef04de752900539e8a3a1aee036ac\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-07-09 02:26:11'),(255,'93dd8cac-34a0-4d88-b02f-4f62603ed70f','93dd8cb2-571c-4c73-bf61-06004c49203b',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"select * from `roles` where `name` = \'admin\' and `guard_name` = \'api\' limit 1\",\"time\":\"0.42\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/doctoworld\\/doctoworld\\/database\\/seeds\\/UsersTableSeeder.php\",\"line\":54,\"hash\":\"de1bc7a62331e87ecc91f3ab3855091f\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-07-09 02:26:11'),(256,'93dd8cac-360b-4761-91a3-8934ce1be504','93dd8cb2-571c-4c73-bf61-06004c49203b',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"select * from `model_has_roles` where `model_has_roles`.`model_id` = 1 and `model_type` = \'Vtlabs\\\\Core\\\\Models\\\\User\\\\User\'\",\"time\":\"0.75\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/doctoworld\\/doctoworld\\/database\\/seeds\\/UsersTableSeeder.php\",\"line\":54,\"hash\":\"71574635b55b4486e52de86ec188b5a7\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-07-09 02:26:11'),(257,'93dd8cac-369b-4762-a6f2-81234d9603b2','93dd8cb2-571c-4c73-bf61-06004c49203b',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"insert into `model_has_roles` (`model_id`, `model_type`, `role_id`) values (1, \'Vtlabs\\\\Core\\\\Models\\\\User\\\\User\', 1)\",\"time\":\"0.98\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/doctoworld\\/doctoworld\\/database\\/seeds\\/UsersTableSeeder.php\",\"line\":54,\"hash\":\"b40636c8a9886b7fb107e3eb7dd2c0eb\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-07-09 02:26:11'),(258,'93dd8cac-3725-44d1-af06-37dc19cdb210','93dd8cb2-571c-4c73-bf61-06004c49203b',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"select `roles`.*, `model_has_roles`.`model_id` as `pivot_model_id`, `model_has_roles`.`role_id` as `pivot_role_id`, `model_has_roles`.`model_type` as `pivot_model_type` from `roles` inner join `model_has_roles` on `roles`.`id` = `model_has_roles`.`role_id` where `model_has_roles`.`model_id` in (1) and `model_has_roles`.`model_type` = \'Vtlabs\\\\Core\\\\Models\\\\User\\\\User\'\",\"time\":\"0.55\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/doctoworld\\/doctoworld\\/database\\/seeds\\/UsersTableSeeder.php\",\"line\":54,\"hash\":\"30e651e0e2d06e58b62d2416b9bec300\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-07-09 02:26:11'),(259,'93dd8cac-383f-4690-b08d-1970aa1026c5','93dd8cb2-571c-4c73-bf61-06004c49203b',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"insert into `settings` (`key`, `value`) values (\'currency_code\', \'USD\'), (\'currency_icon\', \'$\'), (\'tax_in_percent\', \'10\'), (\'support_email\', \'admin@example.com\'), (\'support_phone\', \'8181818118\'), (\'delivery_fee\', \'25\'), (\'delivery_fee_set_by\', \'admin\'), (\'delivery_fee_per_km_charge\', \'5\'), (\'delivery_distance\', \'8000\'), (\'distance_metric\', \'KM\'), (\'refer_amount\', \'50\'), (\'privacy_policy\', \'Demo privacy policy\'), (\'about_us\', \'Demo privacy policy\'), (\'terms\', \'Demo Terms and Condition\'), (\'admin_commision_value\', \'10\'), (\'schedule_interval_in_minutes\', \'30\')\",\"time\":\"1.04\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/doctoworld\\/doctoworld\\/database\\/seeds\\/SettingTableSeeder.php\",\"line\":17,\"hash\":\"fa8f371ea09f63993b8a163eefb7a93c\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-07-09 02:26:11'),(260,'93dd8cac-3ced-4e88-addc-b642278ef3d1','93dd8cb2-571c-4c73-bf61-06004c49203b',NULL,1,'event','{\"name\":\"Spatie\\\\Translatable\\\\Events\\\\TranslationHasBeenSet\",\"payload\":{\"model\":\"Vtlabs\\\\Category\\\\Models\\\\Category:\",\"key\":\"title\",\"locale\":\"en\",\"oldValue\":\"\",\"newValue\":\"Personal Care\"},\"listeners\":[],\"broadcast\":false,\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-07-09 02:26:11'),(261,'93dd8cac-3e60-4af1-8069-cd1cde3806c6','93dd8cb2-571c-4c73-bf61-06004c49203b',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"insert into `categories` (`slug`, `title`, `meta`, `sort_order`, `updated_at`, `created_at`) values (\'personal-care\', \'{\\\\\\\"en\\\\\\\":\\\\\\\"Personal Care\\\\\\\"}\', \'{\\\\\\\"scope\\\\\\\":\\\\\\\"ecommerce\\\\\\\"}\', 1, \'2021-07-09 02:26:11\', \'2021-07-09 02:26:11\')\",\"time\":\"2.86\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/doctoworld\\/doctoworld\\/database\\/seeds\\/CategoryTableSeeder.php\",\"line\":44,\"hash\":\"505f8c20c7ae9efcefa357431ea038c8\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-07-09 02:26:11'),(262,'93dd8cac-f695-4230-ac63-11c69cebab3a','93dd8cb2-571c-4c73-bf61-06004c49203b',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"select max(`order_column`) as aggregate from `media`\",\"time\":\"0.60\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/doctoworld\\/doctoworld\\/database\\/seeds\\/CategoryTableSeeder.php\",\"line\":48,\"hash\":\"7ca353d7601202740301a9e22a2ef124\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-07-09 02:26:12'),(263,'93dd8cac-f74a-4982-a0e2-bd9c08d2a7ed','93dd8cb2-571c-4c73-bf61-06004c49203b',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"insert into `media` (`name`, `file_name`, `disk`, `collection_name`, `mime_type`, `size`, `custom_properties`, `responsive_images`, `manipulations`, `model_id`, `model_type`, `order_column`, `updated_at`, `created_at`) values (\'200\', \'200.png\', \'public\', \'images\', \'image\\/png\', 781, \'[]\', \'[]\', \'[]\', 1, \'Vtlabs\\\\Category\\\\Models\\\\Category\', 1, \'2021-07-09 02:26:12\', \'2021-07-09 02:26:12\')\",\"time\":\"1.14\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/doctoworld\\/doctoworld\\/database\\/seeds\\/CategoryTableSeeder.php\",\"line\":48,\"hash\":\"7aea3bdb29139fee47ead42f0844d7b4\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-07-09 02:26:12'),(264,'93dd8cac-faef-4fd2-96fe-f0446b3994ba','93dd8cb2-571c-4c73-bf61-06004c49203b',NULL,1,'event','{\"name\":\"Spatie\\\\MediaLibrary\\\\Events\\\\MediaHasBeenAdded\",\"payload\":{\"media\":\"Spatie\\\\MediaLibrary\\\\Models\\\\Media:1\"},\"listeners\":[],\"broadcast\":false,\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-07-09 02:26:12'),(265,'93dd8cac-fd91-4ada-9277-2934451ef9f7','93dd8cb2-571c-4c73-bf61-06004c49203b',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"insert into `jobs` (`queue`, `attempts`, `reserved_at`, `available_at`, `created_at`, `payload`) values (\'default\', 0, null, 1625797572, 1625797572, \'{\\\\\\\"displayName\\\\\\\":\\\\\\\"Spatie\\\\\\\\MediaLibrary\\\\\\\\Jobs\\\\\\\\PerformConversions\\\\\\\",\\\\\\\"job\\\\\\\":\\\\\\\"Illuminate\\\\\\\\Queue\\\\\\\\CallQueuedHandler@call\\\\\\\",\\\\\\\"maxTries\\\\\\\":null,\\\\\\\"delay\\\\\\\":null,\\\\\\\"timeout\\\\\\\":null,\\\\\\\"timeoutAt\\\\\\\":null,\\\\\\\"data\\\\\\\":{\\\\\\\"commandName\\\\\\\":\\\\\\\"Spatie\\\\\\\\MediaLibrary\\\\\\\\Jobs\\\\\\\\PerformConversions\\\\\\\",\\\\\\\"command\\\\\\\":\\\\\\\"O:43:\\\\\\\\\\\"Spatie\\\\\\\\MediaLibrary\\\\\\\\Jobs\\\\\\\\PerformConversions\\\\\\\\\\\":11:{s:14:\\\\\\\\\\\"\\\\u0000*\\\\u0000conversions\\\\\\\\\\\";O:51:\\\\\\\\\\\"Spatie\\\\\\\\MediaLibrary\\\\\\\\Conversion\\\\\\\\ConversionCollection\\\\\\\\\\\":2:{s:8:\\\\\\\\\\\"\\\\u0000*\\\\u0000media\\\\\\\\\\\";N;s:8:\\\\\\\\\\\"\\\\u0000*\\\\u0000items\\\\\\\\\\\";a:1:{i:0;O:41:\\\\\\\\\\\"Spatie\\\\\\\\MediaLibrary\\\\\\\\Conversion\\\\\\\\Conversion\\\\\\\\\\\":7:{s:7:\\\\\\\\\\\"\\\\u0000*\\\\u0000name\\\\\\\\\\\";s:5:\\\\\\\\\\\"thumb\\\\\\\\\\\";s:28:\\\\\\\\\\\"\\\\u0000*\\\\u0000extractVideoFrameAtSecond\\\\\\\\\\\";i:0;s:16:\\\\\\\\\\\"\\\\u0000*\\\\u0000manipulations\\\\\\\\\\\";O:26:\\\\\\\\\\\"Spatie\\\\\\\\Image\\\\\\\\Manipulations\\\\\\\\\\\":1:{s:23:\\\\\\\\\\\"\\\\u0000*\\\\u0000manipulationSequence\\\\\\\\\\\";O:33:\\\\\\\\\\\"Spatie\\\\\\\\Image\\\\\\\\ManipulationSequence\\\\\\\\\\\":1:{s:9:\\\\\\\\\\\"\\\\u0000*\\\\u0000groups\\\\\\\\\\\";a:1:{i:0;a:3:{s:8:\\\\\\\\\\\"optimize\\\\\\\\\\\";s:341:\\\\\\\\\\\"{\\\\\\\\\\\"Spatie\\\\\\\\\\\\\\\\ImageOptimizer\\\\\\\\\\\\\\\\Optimizers\\\\\\\\\\\\\\\\Jpegoptim\\\\\\\\\\\":[\\\\\\\\\\\"--strip-all\\\\\\\\\\\",\\\\\\\\\\\"--all-progressive\\\\\\\\\\\"],\\\\\\\\\\\"Spatie\\\\\\\\\\\\\\\\ImageOptimizer\\\\\\\\\\\\\\\\Optimizers\\\\\\\\\\\\\\\\Pngquant\\\\\\\\\\\":[\\\\\\\\\\\"--force\\\\\\\\\\\"],\\\\\\\\\\\"Spatie\\\\\\\\\\\\\\\\ImageOptimizer\\\\\\\\\\\\\\\\Optimizers\\\\\\\\\\\\\\\\Optipng\\\\\\\\\\\":[\\\\\\\\\\\"-i0\\\\\\\\\\\",\\\\\\\\\\\"-o2\\\\\\\\\\\",\\\\\\\\\\\"-quiet\\\\\\\\\\\"],\\\\\\\\\\\"Spatie\\\\\\\\\\\\\\\\ImageOptimizer\\\\\\\\\\\\\\\\Optimizers\\\\\\\\\\\\\\\\Svgo\\\\\\\\\\\":[\\\\\\\\\\\"--disable=cleanupIDs\\\\\\\\\\\"],\\\\\\\\\\\"Spatie\\\\\\\\\\\\\\\\ImageOptimizer\\\\\\\\\\\\\\\\Optimizers\\\\\\\\\\\\\\\\Gifsicle\\\\\\\\\\\":[\\\\\\\\\\\"-b\\\\\\\\\\\",\\\\\\\\\\\"-O3\\\\\\\\\\\"]}\\\\\\\\\\\";s:6:\\\\\\\\\\\"format\\\\\\\\\\\";s:3:\\\\\\\\\\\"jpg\\\\\\\\\\\";s:5:\\\\\\\\\\\"width\\\\\\\\\\\";s:2:\\\\\\\\\\\"50\\\\\\\\\\\";}}}}s:23:\\\\\\\\\\\"\\\\u0000*\\\\u0000performOnCollections\\\\\\\\\\\";a:0:{}s:17:\\\\\\\\\\\"\\\\u0000*\\\\u0000performOnQueue\\\\\\\\\\\";b:1;s:26:\\\\\\\\\\\"\\\\u0000*\\\\u0000keepOriginalImageFormat\\\\\\\\\\\";b:0;s:27:\\\\\\\\\\\"\\\\u0000*\\\\u0000generateResponsiveImages\\\\\\\\\\\";b:0;}}}s:8:\\\\\\\\\\\"\\\\u0000*\\\\u0000media\\\\\\\\\\\";O:45:\\\\\\\\\\\"Illuminate\\\\\\\\Contracts\\\\\\\\Database\\\\\\\\ModelIdentifier\\\\\\\\\\\":4:{s:5:\\\\\\\\\\\"class\\\\\\\\\\\";s:32:\\\\\\\\\\\"Spatie\\\\\\\\MediaLibrary\\\\\\\\Models\\\\\\\\Media\\\\\\\\\\\";s:2:\\\\\\\\\\\"id\\\\\\\\\\\";i:1;s:9:\\\\\\\\\\\"relations\\\\\\\\\\\";a:0:{}s:10:\\\\\\\\\\\"connection\\\\\\\\\\\";s:5:\\\\\\\\\\\"mysql\\\\\\\\\\\";}s:14:\\\\\\\\\\\"\\\\u0000*\\\\u0000onlyMissing\\\\\\\\\\\";b:0;s:6:\\\\\\\\\\\"\\\\u0000*\\\\u0000job\\\\\\\\\\\";N;s:10:\\\\\\\\\\\"connection\\\\\\\\\\\";N;s:5:\\\\\\\\\\\"queue\\\\\\\\\\\";N;s:15:\\\\\\\\\\\"chainConnection\\\\\\\\\\\";N;s:10:\\\\\\\\\\\"chainQueue\\\\\\\\\\\";N;s:5:\\\\\\\\\\\"delay\\\\\\\\\\\";N;s:10:\\\\\\\\\\\"middleware\\\\\\\\\\\";a:0:{}s:7:\\\\\\\\\\\"chained\\\\\\\\\\\";a:0:{}}\\\\\\\"}}\')\",\"time\":\"0.97\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/doctoworld\\/doctoworld\\/database\\/seeds\\/CategoryTableSeeder.php\",\"line\":48,\"hash\":\"dcb5bc575158ce02a6c28ed0691de7a9\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-07-09 02:26:12'),(266,'93dd8cac-fdeb-44ea-ae35-0d36a6ebdc66','93dd8cb2-571c-4c73-bf61-06004c49203b',NULL,1,'event','{\"name\":\"Spatie\\\\Translatable\\\\Events\\\\TranslationHasBeenSet\",\"payload\":{\"model\":\"Vtlabs\\\\Category\\\\Models\\\\Category:\",\"key\":\"title\",\"locale\":\"en\",\"oldValue\":\"\",\"newValue\":\"Skin Care\"},\"listeners\":[],\"broadcast\":false,\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-07-09 02:26:12'),(267,'93dd8cac-fe6b-484a-a261-0eed568dddb1','93dd8cb2-571c-4c73-bf61-06004c49203b',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"insert into `categories` (`title`, `slug`, `sort_order`, `meta`, `parent_id`, `updated_at`, `created_at`) values (\'{\\\\\\\"en\\\\\\\":\\\\\\\"Skin Care\\\\\\\"}\', \'skin-care\', 1, \'{\\\\\\\"scope\\\\\\\":\\\\\\\"ecommerce\\\\\\\"}\', 1, \'2021-07-09 02:26:12\', \'2021-07-09 02:26:12\')\",\"time\":\"0.87\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/doctoworld\\/doctoworld\\/database\\/seeds\\/CategoryTableSeeder.php\",\"line\":50,\"hash\":\"eac6e78116221aa03993c274c1a7f063\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-07-09 02:26:12'),(268,'93dd8cac-fe83-4723-a57c-7f1e4ee09464','93dd8cb2-571c-4c73-bf61-06004c49203b',NULL,1,'event','{\"name\":\"Spatie\\\\Translatable\\\\Events\\\\TranslationHasBeenSet\",\"payload\":{\"model\":\"Vtlabs\\\\Category\\\\Models\\\\Category:\",\"key\":\"title\",\"locale\":\"en\",\"oldValue\":\"\",\"newValue\":\"Baby Care\"},\"listeners\":[],\"broadcast\":false,\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-07-09 02:26:12'),(269,'93dd8cac-fef1-4731-a9fb-373ece301385','93dd8cb2-571c-4c73-bf61-06004c49203b',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"insert into `categories` (`title`, `slug`, `sort_order`, `meta`, `parent_id`, `updated_at`, `created_at`) values (\'{\\\\\\\"en\\\\\\\":\\\\\\\"Baby Care\\\\\\\"}\', \'baby-care\', 2, \'{\\\\\\\"scope\\\\\\\":\\\\\\\"ecommerce\\\\\\\"}\', 1, \'2021-07-09 02:26:12\', \'2021-07-09 02:26:12\')\",\"time\":\"0.71\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/doctoworld\\/doctoworld\\/database\\/seeds\\/CategoryTableSeeder.php\",\"line\":50,\"hash\":\"eac6e78116221aa03993c274c1a7f063\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-07-09 02:26:12'),(270,'93dd8cac-ff0a-4e9e-8afd-bb6a6fe16f32','93dd8cb2-571c-4c73-bf61-06004c49203b',NULL,1,'event','{\"name\":\"Spatie\\\\Translatable\\\\Events\\\\TranslationHasBeenSet\",\"payload\":{\"model\":\"Vtlabs\\\\Category\\\\Models\\\\Category:\",\"key\":\"title\",\"locale\":\"en\",\"oldValue\":\"\",\"newValue\":\"Hair Care\"},\"listeners\":[],\"broadcast\":false,\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-07-09 02:26:12'),(271,'93dd8cac-ff75-47cf-ab61-833fabfa11fc','93dd8cb2-571c-4c73-bf61-06004c49203b',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"insert into `categories` (`title`, `slug`, `sort_order`, `meta`, `parent_id`, `updated_at`, `created_at`) values (\'{\\\\\\\"en\\\\\\\":\\\\\\\"Hair Care\\\\\\\"}\', \'hair-care\', 3, \'{\\\\\\\"scope\\\\\\\":\\\\\\\"ecommerce\\\\\\\"}\', 1, \'2021-07-09 02:26:12\', \'2021-07-09 02:26:12\')\",\"time\":\"0.66\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/doctoworld\\/doctoworld\\/database\\/seeds\\/CategoryTableSeeder.php\",\"line\":50,\"hash\":\"eac6e78116221aa03993c274c1a7f063\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-07-09 02:26:12'),(272,'93dd8cac-ff90-4259-b9f5-a50c8903a7f7','93dd8cb2-571c-4c73-bf61-06004c49203b',NULL,1,'event','{\"name\":\"Spatie\\\\Translatable\\\\Events\\\\TranslationHasBeenSet\",\"payload\":{\"model\":\"Vtlabs\\\\Category\\\\Models\\\\Category:\",\"key\":\"title\",\"locale\":\"en\",\"oldValue\":\"\",\"newValue\":\"OTC Medicines\"},\"listeners\":[],\"broadcast\":false,\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-07-09 02:26:12'),(273,'93dd8cac-fff6-4b2d-a3e8-c76956da7745','93dd8cb2-571c-4c73-bf61-06004c49203b',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"insert into `categories` (`slug`, `title`, `meta`, `sort_order`, `updated_at`, `created_at`) values (\'otc-medicines\', \'{\\\\\\\"en\\\\\\\":\\\\\\\"OTC Medicines\\\\\\\"}\', \'{\\\\\\\"scope\\\\\\\":\\\\\\\"ecommerce\\\\\\\"}\', 1, \'2021-07-09 02:26:12\', \'2021-07-09 02:26:12\')\",\"time\":\"0.65\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/doctoworld\\/doctoworld\\/database\\/seeds\\/CategoryTableSeeder.php\",\"line\":44,\"hash\":\"505f8c20c7ae9efcefa357431ea038c8\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-07-09 02:26:12'),(274,'93dd8cad-8eca-45e9-a9cd-5c811224986d','93dd8cb2-571c-4c73-bf61-06004c49203b',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"select max(`order_column`) as aggregate from `media`\",\"time\":\"0.53\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/doctoworld\\/doctoworld\\/database\\/seeds\\/CategoryTableSeeder.php\",\"line\":48,\"hash\":\"7ca353d7601202740301a9e22a2ef124\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-07-09 02:26:12'),(275,'93dd8cad-8f6c-4c9a-80e3-650880daa761','93dd8cb2-571c-4c73-bf61-06004c49203b',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"insert into `media` (`name`, `file_name`, `disk`, `collection_name`, `mime_type`, `size`, `custom_properties`, `responsive_images`, `manipulations`, `model_id`, `model_type`, `order_column`, `updated_at`, `created_at`) values (\'200\', \'200.png\', \'public\', \'images\', \'image\\/png\', 781, \'[]\', \'[]\', \'[]\', 5, \'Vtlabs\\\\Category\\\\Models\\\\Category\', 2, \'2021-07-09 02:26:12\', \'2021-07-09 02:26:12\')\",\"time\":\"1.06\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/doctoworld\\/doctoworld\\/database\\/seeds\\/CategoryTableSeeder.php\",\"line\":48,\"hash\":\"7aea3bdb29139fee47ead42f0844d7b4\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-07-09 02:26:12'),(276,'93dd8cad-8fd1-44ab-be1b-7b726335ed03','93dd8cb2-571c-4c73-bf61-06004c49203b',NULL,1,'event','{\"name\":\"Spatie\\\\MediaLibrary\\\\Events\\\\MediaHasBeenAdded\",\"payload\":{\"media\":\"Spatie\\\\MediaLibrary\\\\Models\\\\Media:2\"},\"listeners\":[],\"broadcast\":false,\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-07-09 02:26:12'),(277,'93dd8cad-90ba-49d3-8d15-4d40b5b684ca','93dd8cb2-571c-4c73-bf61-06004c49203b',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"insert into `jobs` (`queue`, `attempts`, `reserved_at`, `available_at`, `created_at`, `payload`) values (\'default\', 0, null, 1625797572, 1625797572, \'{\\\\\\\"displayName\\\\\\\":\\\\\\\"Spatie\\\\\\\\MediaLibrary\\\\\\\\Jobs\\\\\\\\PerformConversions\\\\\\\",\\\\\\\"job\\\\\\\":\\\\\\\"Illuminate\\\\\\\\Queue\\\\\\\\CallQueuedHandler@call\\\\\\\",\\\\\\\"maxTries\\\\\\\":null,\\\\\\\"delay\\\\\\\":null,\\\\\\\"timeout\\\\\\\":null,\\\\\\\"timeoutAt\\\\\\\":null,\\\\\\\"data\\\\\\\":{\\\\\\\"commandName\\\\\\\":\\\\\\\"Spatie\\\\\\\\MediaLibrary\\\\\\\\Jobs\\\\\\\\PerformConversions\\\\\\\",\\\\\\\"command\\\\\\\":\\\\\\\"O:43:\\\\\\\\\\\"Spatie\\\\\\\\MediaLibrary\\\\\\\\Jobs\\\\\\\\PerformConversions\\\\\\\\\\\":11:{s:14:\\\\\\\\\\\"\\\\u0000*\\\\u0000conversions\\\\\\\\\\\";O:51:\\\\\\\\\\\"Spatie\\\\\\\\MediaLibrary\\\\\\\\Conversion\\\\\\\\ConversionCollection\\\\\\\\\\\":2:{s:8:\\\\\\\\\\\"\\\\u0000*\\\\u0000media\\\\\\\\\\\";N;s:8:\\\\\\\\\\\"\\\\u0000*\\\\u0000items\\\\\\\\\\\";a:1:{i:0;O:41:\\\\\\\\\\\"Spatie\\\\\\\\MediaLibrary\\\\\\\\Conversion\\\\\\\\Conversion\\\\\\\\\\\":7:{s:7:\\\\\\\\\\\"\\\\u0000*\\\\u0000name\\\\\\\\\\\";s:5:\\\\\\\\\\\"thumb\\\\\\\\\\\";s:28:\\\\\\\\\\\"\\\\u0000*\\\\u0000extractVideoFrameAtSecond\\\\\\\\\\\";i:0;s:16:\\\\\\\\\\\"\\\\u0000*\\\\u0000manipulations\\\\\\\\\\\";O:26:\\\\\\\\\\\"Spatie\\\\\\\\Image\\\\\\\\Manipulations\\\\\\\\\\\":1:{s:23:\\\\\\\\\\\"\\\\u0000*\\\\u0000manipulationSequence\\\\\\\\\\\";O:33:\\\\\\\\\\\"Spatie\\\\\\\\Image\\\\\\\\ManipulationSequence\\\\\\\\\\\":1:{s:9:\\\\\\\\\\\"\\\\u0000*\\\\u0000groups\\\\\\\\\\\";a:1:{i:0;a:3:{s:8:\\\\\\\\\\\"optimize\\\\\\\\\\\";s:341:\\\\\\\\\\\"{\\\\\\\\\\\"Spatie\\\\\\\\\\\\\\\\ImageOptimizer\\\\\\\\\\\\\\\\Optimizers\\\\\\\\\\\\\\\\Jpegoptim\\\\\\\\\\\":[\\\\\\\\\\\"--strip-all\\\\\\\\\\\",\\\\\\\\\\\"--all-progressive\\\\\\\\\\\"],\\\\\\\\\\\"Spatie\\\\\\\\\\\\\\\\ImageOptimizer\\\\\\\\\\\\\\\\Optimizers\\\\\\\\\\\\\\\\Pngquant\\\\\\\\\\\":[\\\\\\\\\\\"--force\\\\\\\\\\\"],\\\\\\\\\\\"Spatie\\\\\\\\\\\\\\\\ImageOptimizer\\\\\\\\\\\\\\\\Optimizers\\\\\\\\\\\\\\\\Optipng\\\\\\\\\\\":[\\\\\\\\\\\"-i0\\\\\\\\\\\",\\\\\\\\\\\"-o2\\\\\\\\\\\",\\\\\\\\\\\"-quiet\\\\\\\\\\\"],\\\\\\\\\\\"Spatie\\\\\\\\\\\\\\\\ImageOptimizer\\\\\\\\\\\\\\\\Optimizers\\\\\\\\\\\\\\\\Svgo\\\\\\\\\\\":[\\\\\\\\\\\"--disable=cleanupIDs\\\\\\\\\\\"],\\\\\\\\\\\"Spatie\\\\\\\\\\\\\\\\ImageOptimizer\\\\\\\\\\\\\\\\Optimizers\\\\\\\\\\\\\\\\Gifsicle\\\\\\\\\\\":[\\\\\\\\\\\"-b\\\\\\\\\\\",\\\\\\\\\\\"-O3\\\\\\\\\\\"]}\\\\\\\\\\\";s:6:\\\\\\\\\\\"format\\\\\\\\\\\";s:3:\\\\\\\\\\\"jpg\\\\\\\\\\\";s:5:\\\\\\\\\\\"width\\\\\\\\\\\";s:2:\\\\\\\\\\\"50\\\\\\\\\\\";}}}}s:23:\\\\\\\\\\\"\\\\u0000*\\\\u0000performOnCollections\\\\\\\\\\\";a:0:{}s:17:\\\\\\\\\\\"\\\\u0000*\\\\u0000performOnQueue\\\\\\\\\\\";b:1;s:26:\\\\\\\\\\\"\\\\u0000*\\\\u0000keepOriginalImageFormat\\\\\\\\\\\";b:0;s:27:\\\\\\\\\\\"\\\\u0000*\\\\u0000generateResponsiveImages\\\\\\\\\\\";b:0;}}}s:8:\\\\\\\\\\\"\\\\u0000*\\\\u0000media\\\\\\\\\\\";O:45:\\\\\\\\\\\"Illuminate\\\\\\\\Contracts\\\\\\\\Database\\\\\\\\ModelIdentifier\\\\\\\\\\\":4:{s:5:\\\\\\\\\\\"class\\\\\\\\\\\";s:32:\\\\\\\\\\\"Spatie\\\\\\\\MediaLibrary\\\\\\\\Models\\\\\\\\Media\\\\\\\\\\\";s:2:\\\\\\\\\\\"id\\\\\\\\\\\";i:2;s:9:\\\\\\\\\\\"relations\\\\\\\\\\\";a:0:{}s:10:\\\\\\\\\\\"connection\\\\\\\\\\\";s:5:\\\\\\\\\\\"mysql\\\\\\\\\\\";}s:14:\\\\\\\\\\\"\\\\u0000*\\\\u0000onlyMissing\\\\\\\\\\\";b:0;s:6:\\\\\\\\\\\"\\\\u0000*\\\\u0000job\\\\\\\\\\\";N;s:10:\\\\\\\\\\\"connection\\\\\\\\\\\";N;s:5:\\\\\\\\\\\"queue\\\\\\\\\\\";N;s:15:\\\\\\\\\\\"chainConnection\\\\\\\\\\\";N;s:10:\\\\\\\\\\\"chainQueue\\\\\\\\\\\";N;s:5:\\\\\\\\\\\"delay\\\\\\\\\\\";N;s:10:\\\\\\\\\\\"middleware\\\\\\\\\\\";a:0:{}s:7:\\\\\\\\\\\"chained\\\\\\\\\\\";a:0:{}}\\\\\\\"}}\')\",\"time\":\"1.26\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/doctoworld\\/doctoworld\\/database\\/seeds\\/CategoryTableSeeder.php\",\"line\":48,\"hash\":\"dcb5bc575158ce02a6c28ed0691de7a9\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-07-09 02:26:12'),(278,'93dd8cad-90fc-4a58-8e0a-ba89e44b06c0','93dd8cb2-571c-4c73-bf61-06004c49203b',NULL,1,'event','{\"name\":\"Spatie\\\\Translatable\\\\Events\\\\TranslationHasBeenSet\",\"payload\":{\"model\":\"Vtlabs\\\\Category\\\\Models\\\\Category:\",\"key\":\"title\",\"locale\":\"en\",\"oldValue\":\"\",\"newValue\":\"First Aid\"},\"listeners\":[],\"broadcast\":false,\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-07-09 02:26:12'),(279,'93dd8cad-91a5-404a-b8d2-d673203b902b','93dd8cb2-571c-4c73-bf61-06004c49203b',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"insert into `categories` (`title`, `slug`, `sort_order`, `meta`, `parent_id`, `updated_at`, `created_at`) values (\'{\\\\\\\"en\\\\\\\":\\\\\\\"First Aid\\\\\\\"}\', \'first-aid\', 1, \'{\\\\\\\"scope\\\\\\\":\\\\\\\"ecommerce\\\\\\\"}\', 5, \'2021-07-09 02:26:12\', \'2021-07-09 02:26:12\')\",\"time\":\"1.11\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/doctoworld\\/doctoworld\\/database\\/seeds\\/CategoryTableSeeder.php\",\"line\":50,\"hash\":\"eac6e78116221aa03993c274c1a7f063\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-07-09 02:26:12'),(280,'93dd8cad-91ce-487e-bc44-fb230cc32800','93dd8cb2-571c-4c73-bf61-06004c49203b',NULL,1,'event','{\"name\":\"Spatie\\\\Translatable\\\\Events\\\\TranslationHasBeenSet\",\"payload\":{\"model\":\"Vtlabs\\\\Category\\\\Models\\\\Category:\",\"key\":\"title\",\"locale\":\"en\",\"oldValue\":\"\",\"newValue\":\"Fever\"},\"listeners\":[],\"broadcast\":false,\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-07-09 02:26:12'),(281,'93dd8cad-926f-4350-9bc7-b114357b4878','93dd8cb2-571c-4c73-bf61-06004c49203b',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"insert into `categories` (`title`, `slug`, `sort_order`, `meta`, `parent_id`, `updated_at`, `created_at`) values (\'{\\\\\\\"en\\\\\\\":\\\\\\\"Fever\\\\\\\"}\', \'fever\', 2, \'{\\\\\\\"scope\\\\\\\":\\\\\\\"ecommerce\\\\\\\"}\', 5, \'2021-07-09 02:26:12\', \'2021-07-09 02:26:12\')\",\"time\":\"1.04\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/doctoworld\\/doctoworld\\/database\\/seeds\\/CategoryTableSeeder.php\",\"line\":50,\"hash\":\"eac6e78116221aa03993c274c1a7f063\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-07-09 02:26:12'),(282,'93dd8cad-928c-4383-80b4-441c6b5e765f','93dd8cb2-571c-4c73-bf61-06004c49203b',NULL,1,'event','{\"name\":\"Spatie\\\\Translatable\\\\Events\\\\TranslationHasBeenSet\",\"payload\":{\"model\":\"Vtlabs\\\\Category\\\\Models\\\\Category:\",\"key\":\"title\",\"locale\":\"en\",\"oldValue\":\"\",\"newValue\":\"Pain\"},\"listeners\":[],\"broadcast\":false,\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-07-09 02:26:12'),(283,'93dd8cad-9303-493f-8778-151b741be8a1','93dd8cb2-571c-4c73-bf61-06004c49203b',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"insert into `categories` (`title`, `slug`, `sort_order`, `meta`, `parent_id`, `updated_at`, `created_at`) values (\'{\\\\\\\"en\\\\\\\":\\\\\\\"Pain\\\\\\\"}\', \'pain\', 3, \'{\\\\\\\"scope\\\\\\\":\\\\\\\"ecommerce\\\\\\\"}\', 5, \'2021-07-09 02:26:12\', \'2021-07-09 02:26:12\')\",\"time\":\"0.76\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/doctoworld\\/doctoworld\\/database\\/seeds\\/CategoryTableSeeder.php\",\"line\":50,\"hash\":\"eac6e78116221aa03993c274c1a7f063\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-07-09 02:26:12'),(284,'93dd8cad-9321-4688-aae7-e5052764f18c','93dd8cb2-571c-4c73-bf61-06004c49203b',NULL,1,'event','{\"name\":\"Spatie\\\\Translatable\\\\Events\\\\TranslationHasBeenSet\",\"payload\":{\"model\":\"Vtlabs\\\\Category\\\\Models\\\\Category:\",\"key\":\"title\",\"locale\":\"en\",\"oldValue\":\"\",\"newValue\":\"MBBS\"},\"listeners\":[],\"broadcast\":false,\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-07-09 02:26:12'),(285,'93dd8cad-9383-4ccc-bdae-efb3bfe47147','93dd8cb2-571c-4c73-bf61-06004c49203b',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"insert into `categories` (`slug`, `title`, `meta`, `sort_order`, `updated_at`, `created_at`) values (\'mbbs\', \'{\\\\\\\"en\\\\\\\":\\\\\\\"MBBS\\\\\\\"}\', \'{\\\\\\\"scope\\\\\\\":\\\\\\\"degree\\\\\\\"}\', 1, \'2021-07-09 02:26:12\', \'2021-07-09 02:26:12\')\",\"time\":\"0.61\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/doctoworld\\/doctoworld\\/database\\/seeds\\/CategoryTableSeeder.php\",\"line\":63,\"hash\":\"505f8c20c7ae9efcefa357431ea038c8\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-07-09 02:26:12'),(286,'93dd8cad-939e-48cb-ac81-ffbe0553b8ac','93dd8cb2-571c-4c73-bf61-06004c49203b',NULL,1,'event','{\"name\":\"Spatie\\\\Translatable\\\\Events\\\\TranslationHasBeenSet\",\"payload\":{\"model\":\"Vtlabs\\\\Category\\\\Models\\\\Category:\",\"key\":\"title\",\"locale\":\"en\",\"oldValue\":\"\",\"newValue\":\"Hypertension Treatment\"},\"listeners\":[],\"broadcast\":false,\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-07-09 02:26:12'),(287,'93dd8cad-9404-43ce-99b2-4390c1504a7c','93dd8cb2-571c-4c73-bf61-06004c49203b',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"insert into `categories` (`slug`, `title`, `meta`, `sort_order`, `updated_at`, `created_at`) values (\'hypertension-treatment\', \'{\\\\\\\"en\\\\\\\":\\\\\\\"Hypertension Treatment\\\\\\\"}\', \'{\\\\\\\"scope\\\\\\\":\\\\\\\"services\\\\\\\"}\', 1, \'2021-07-09 02:26:12\', \'2021-07-09 02:26:12\')\",\"time\":\"0.65\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/doctoworld\\/doctoworld\\/database\\/seeds\\/CategoryTableSeeder.php\",\"line\":82,\"hash\":\"505f8c20c7ae9efcefa357431ea038c8\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-07-09 02:26:12'),(288,'93dd8cad-9420-4809-acc1-62ed3d9e0428','93dd8cb2-571c-4c73-bf61-06004c49203b',NULL,1,'event','{\"name\":\"Spatie\\\\Translatable\\\\Events\\\\TranslationHasBeenSet\",\"payload\":{\"model\":\"Vtlabs\\\\Category\\\\Models\\\\Category:\",\"key\":\"title\",\"locale\":\"en\",\"oldValue\":\"\",\"newValue\":\"Diabetes Treatment\"},\"listeners\":[],\"broadcast\":false,\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-07-09 02:26:12'),(289,'93dd8cad-9482-4060-81e6-0082552fc6fc','93dd8cb2-571c-4c73-bf61-06004c49203b',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"insert into `categories` (`slug`, `title`, `meta`, `sort_order`, `updated_at`, `created_at`) values (\'diabetes-treatment\', \'{\\\\\\\"en\\\\\\\":\\\\\\\"Diabetes Treatment\\\\\\\"}\', \'{\\\\\\\"scope\\\\\\\":\\\\\\\"services\\\\\\\"}\', 1, \'2021-07-09 02:26:12\', \'2021-07-09 02:26:12\')\",\"time\":\"0.61\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/doctoworld\\/doctoworld\\/database\\/seeds\\/CategoryTableSeeder.php\",\"line\":82,\"hash\":\"505f8c20c7ae9efcefa357431ea038c8\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-07-09 02:26:12'),(290,'93dd8cad-949e-4490-afe1-49da2eca00ab','93dd8cb2-571c-4c73-bf61-06004c49203b',NULL,1,'event','{\"name\":\"Spatie\\\\Translatable\\\\Events\\\\TranslationHasBeenSet\",\"payload\":{\"model\":\"Vtlabs\\\\Category\\\\Models\\\\Category:\",\"key\":\"title\",\"locale\":\"en\",\"oldValue\":\"\",\"newValue\":\"General Physician\"},\"listeners\":[],\"broadcast\":false,\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-07-09 02:26:12'),(291,'93dd8cad-94f6-4f84-8605-f9edfd469174','93dd8cb2-571c-4c73-bf61-06004c49203b',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"insert into `categories` (`slug`, `title`, `meta`, `sort_order`, `updated_at`, `created_at`) values (\'general-physician\', \'{\\\\\\\"en\\\\\\\":\\\\\\\"General Physician\\\\\\\"}\', \'{\\\\\\\"scope\\\\\\\":\\\\\\\"specializations\\\\\\\"}\', 1, \'2021-07-09 02:26:12\', \'2021-07-09 02:26:12\')\",\"time\":\"0.51\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/doctoworld\\/doctoworld\\/database\\/seeds\\/CategoryTableSeeder.php\",\"line\":101,\"hash\":\"505f8c20c7ae9efcefa357431ea038c8\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-07-09 02:26:12'),(292,'93dd8cad-9511-441d-b577-71258a19ad37','93dd8cb2-571c-4c73-bf61-06004c49203b',NULL,1,'event','{\"name\":\"Spatie\\\\Translatable\\\\Events\\\\TranslationHasBeenSet\",\"payload\":{\"model\":\"Vtlabs\\\\Category\\\\Models\\\\Category:\",\"key\":\"title\",\"locale\":\"en\",\"oldValue\":\"\",\"newValue\":\"Cardialogist\"},\"listeners\":[],\"broadcast\":false,\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-07-09 02:26:12'),(293,'93dd8cad-9574-49ef-b955-0675dece0023','93dd8cb2-571c-4c73-bf61-06004c49203b',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"insert into `categories` (`slug`, `title`, `meta`, `sort_order`, `updated_at`, `created_at`) values (\'cardialogist\', \'{\\\\\\\"en\\\\\\\":\\\\\\\"Cardialogist\\\\\\\"}\', \'{\\\\\\\"scope\\\\\\\":\\\\\\\"specializations\\\\\\\"}\', 1, \'2021-07-09 02:26:12\', \'2021-07-09 02:26:12\')\",\"time\":\"0.60\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/doctoworld\\/doctoworld\\/database\\/seeds\\/CategoryTableSeeder.php\",\"line\":101,\"hash\":\"505f8c20c7ae9efcefa357431ea038c8\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-07-09 02:26:12'),(294,'93dd8cad-9590-468f-8084-cd5e87dd6d0e','93dd8cb2-571c-4c73-bf61-06004c49203b',NULL,1,'event','{\"name\":\"Spatie\\\\Translatable\\\\Events\\\\TranslationHasBeenSet\",\"payload\":{\"model\":\"Vtlabs\\\\Category\\\\Models\\\\Category:\",\"key\":\"title\",\"locale\":\"en\",\"oldValue\":\"\",\"newValue\":\"Doctor\"},\"listeners\":[],\"broadcast\":false,\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-07-09 02:26:12'),(295,'93dd8cad-962a-48b3-94a1-87399e593e76','93dd8cb2-571c-4c73-bf61-06004c49203b',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"insert into `categories` (`slug`, `title`, `meta`, `sort_order`, `updated_at`, `created_at`) values (\'doctor\', \'{\\\\\\\"en\\\\\\\":\\\\\\\"Doctor\\\\\\\"}\', \'{\\\\\\\"scope\\\\\\\":\\\\\\\"type\\\\\\\"}\', 1, \'2021-07-09 02:26:12\', \'2021-07-09 02:26:12\')\",\"time\":\"1.18\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/doctoworld\\/doctoworld\\/database\\/seeds\\/CategoryTableSeeder.php\",\"line\":120,\"hash\":\"505f8c20c7ae9efcefa357431ea038c8\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-07-09 02:26:12'),(296,'93dd8cad-9645-4cf6-81bf-2c68b417c394','93dd8cb2-571c-4c73-bf61-06004c49203b',NULL,1,'event','{\"name\":\"Spatie\\\\Translatable\\\\Events\\\\TranslationHasBeenSet\",\"payload\":{\"model\":\"Vtlabs\\\\Category\\\\Models\\\\Category:\",\"key\":\"title\",\"locale\":\"en\",\"oldValue\":\"\",\"newValue\":\"Dentist\"},\"listeners\":[],\"broadcast\":false,\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-07-09 02:26:12'),(297,'93dd8cad-96a5-49e1-bf43-d7cb29fc9e25','93dd8cb2-571c-4c73-bf61-06004c49203b',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"insert into `categories` (`slug`, `title`, `meta`, `sort_order`, `updated_at`, `created_at`) values (\'dentist\', \'{\\\\\\\"en\\\\\\\":\\\\\\\"Dentist\\\\\\\"}\', \'{\\\\\\\"scope\\\\\\\":\\\\\\\"type\\\\\\\"}\', 1, \'2021-07-09 02:26:12\', \'2021-07-09 02:26:12\')\",\"time\":\"0.60\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/doctoworld\\/doctoworld\\/database\\/seeds\\/CategoryTableSeeder.php\",\"line\":120,\"hash\":\"505f8c20c7ae9efcefa357431ea038c8\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-07-09 02:26:12'),(298,'93dd8cad-9726-41ee-9afd-21244ff666ff','93dd8cb2-571c-4c73-bf61-06004c49203b',NULL,1,'event','{\"name\":\"Spatie\\\\Translatable\\\\Events\\\\TranslationHasBeenSet\",\"payload\":{\"model\":\"Vtlabs\\\\Doctor\\\\Models\\\\Hospital:\",\"key\":\"name\",\"locale\":\"en\",\"oldValue\":\"\",\"newValue\":\"Apollo Hospitals\"},\"listeners\":[],\"broadcast\":false,\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-07-09 02:26:12'),(299,'93dd8cad-973a-4aba-b143-ab96d892e23b','93dd8cb2-571c-4c73-bf61-06004c49203b',NULL,1,'event','{\"name\":\"Spatie\\\\Translatable\\\\Events\\\\TranslationHasBeenSet\",\"payload\":{\"model\":\"Vtlabs\\\\Doctor\\\\Models\\\\Hospital:\",\"key\":\"tagline\",\"locale\":\"en\",\"oldValue\":\"\",\"newValue\":\"Apollo Hospitals Tagline\"},\"listeners\":[],\"broadcast\":false,\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-07-09 02:26:12'),(300,'93dd8cad-974b-4b26-bc6f-57bcb18048cb','93dd8cb2-571c-4c73-bf61-06004c49203b',NULL,1,'event','{\"name\":\"Spatie\\\\Translatable\\\\Events\\\\TranslationHasBeenSet\",\"payload\":{\"model\":\"Vtlabs\\\\Doctor\\\\Models\\\\Hospital:\",\"key\":\"details\",\"locale\":\"en\",\"oldValue\":\"\",\"newValue\":\"Apollo Hospitals Details\"},\"listeners\":[],\"broadcast\":false,\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-07-09 02:26:12'),(301,'93dd8cad-980a-4717-9626-e653e67903d4','93dd8cb2-571c-4c73-bf61-06004c49203b',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"insert into `doctor_hospitals` (`slug`, `name`, `tagline`, `details`, `address`, `sort_order`, `updated_at`, `created_at`) values (\'apollo-hospitals\', \'{\\\\\\\"en\\\\\\\":\\\\\\\"Apollo Hospitals\\\\\\\"}\', \'{\\\\\\\"en\\\\\\\":\\\\\\\"Apollo Hospitals Tagline\\\\\\\"}\', \'{\\\\\\\"en\\\\\\\":\\\\\\\"Apollo Hospitals Details\\\\\\\"}\', \'Test Address\', 1, \'2021-07-09 02:26:12\', \'2021-07-09 02:26:12\')\",\"time\":\"1.54\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/doctoworld\\/doctoworld\\/database\\/seeds\\/HospitalTableSeeder.php\",\"line\":33,\"hash\":\"c4b50863e56d3f325c4f730d8d49c1d0\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-07-09 02:26:12'),(302,'93dd8cad-9824-426c-80fb-ae883725d9d7','93dd8cb2-571c-4c73-bf61-06004c49203b',NULL,1,'event','{\"name\":\"Spatie\\\\Translatable\\\\Events\\\\TranslationHasBeenSet\",\"payload\":{\"model\":\"Vtlabs\\\\Doctor\\\\Models\\\\Hospital:\",\"key\":\"name\",\"locale\":\"en\",\"oldValue\":\"\",\"newValue\":\"Max Hospitals\"},\"listeners\":[],\"broadcast\":false,\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-07-09 02:26:12'),(303,'93dd8cad-9836-4c85-ad29-f753e8340da7','93dd8cb2-571c-4c73-bf61-06004c49203b',NULL,1,'event','{\"name\":\"Spatie\\\\Translatable\\\\Events\\\\TranslationHasBeenSet\",\"payload\":{\"model\":\"Vtlabs\\\\Doctor\\\\Models\\\\Hospital:\",\"key\":\"tagline\",\"locale\":\"en\",\"oldValue\":\"\",\"newValue\":\"Max Hospitals Tagline\"},\"listeners\":[],\"broadcast\":false,\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-07-09 02:26:12'),(304,'93dd8cad-9847-441b-889e-1c70defd359c','93dd8cb2-571c-4c73-bf61-06004c49203b',NULL,1,'event','{\"name\":\"Spatie\\\\Translatable\\\\Events\\\\TranslationHasBeenSet\",\"payload\":{\"model\":\"Vtlabs\\\\Doctor\\\\Models\\\\Hospital:\",\"key\":\"details\",\"locale\":\"en\",\"oldValue\":\"\",\"newValue\":\"Max Hospitals Details\"},\"listeners\":[],\"broadcast\":false,\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-07-09 02:26:12'),(305,'93dd8cad-98e2-4508-9298-8f9d2ae311f2','93dd8cb2-571c-4c73-bf61-06004c49203b',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"insert into `doctor_hospitals` (`slug`, `name`, `tagline`, `details`, `address`, `sort_order`, `updated_at`, `created_at`) values (\'max-hospitals\', \'{\\\\\\\"en\\\\\\\":\\\\\\\"Max Hospitals\\\\\\\"}\', \'{\\\\\\\"en\\\\\\\":\\\\\\\"Max Hospitals Tagline\\\\\\\"}\', \'{\\\\\\\"en\\\\\\\":\\\\\\\"Max Hospitals Details\\\\\\\"}\', \'Test Address\', 1, \'2021-07-09 02:26:12\', \'2021-07-09 02:26:12\')\",\"time\":\"1.20\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/doctoworld\\/doctoworld\\/database\\/seeds\\/HospitalTableSeeder.php\",\"line\":33,\"hash\":\"c4b50863e56d3f325c4f730d8d49c1d0\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-07-09 02:26:12'),(306,'93dd8cad-9935-40f1-b053-3451a1e852ec','93dd8cb2-571c-4c73-bf61-06004c49203b',NULL,1,'event','{\"name\":\"Spatie\\\\Translatable\\\\Events\\\\TranslationHasBeenSet\",\"payload\":{\"model\":\"Vtlabs\\\\Payment\\\\Models\\\\PaymentMethod:\",\"key\":\"title\",\"locale\":\"en\",\"oldValue\":\"\",\"newValue\":\"Cash On Delivery\"},\"listeners\":[],\"broadcast\":false,\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-07-09 02:26:12'),(307,'93dd8cad-999d-4d99-a9ff-5791fe612fb9','93dd8cb2-571c-4c73-bf61-06004c49203b',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"insert into `payment_methods` (`slug`, `title`, `enabled`, `type`, `updated_at`, `created_at`) values (\'cod\', \'{\\\\\\\"en\\\\\\\":\\\\\\\"Cash On Delivery\\\\\\\"}\', 1, \'postpaid\', \'2021-07-09 02:26:12\', \'2021-07-09 02:26:12\')\",\"time\":\"0.69\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/doctoworld\\/doctoworld\\/database\\/seeds\\/PaymentMethodTableSeeder.php\",\"line\":24,\"hash\":\"db23f33fd19440cd530773c51f78f60e\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-07-09 02:26:12'),(308,'93dd8cad-99f2-427d-a59a-746b900cdf8d','93dd8cb2-571c-4c73-bf61-06004c49203b',NULL,1,'event','{\"name\":\"Spatie\\\\Translatable\\\\Events\\\\TranslationHasBeenSet\",\"payload\":{\"model\":\"Vtlabs\\\\Ecommerce\\\\Models\\\\Coupon:\",\"key\":\"title\",\"locale\":\"en\",\"oldValue\":\"\",\"newValue\":\"Test Coupon\"},\"listeners\":[],\"broadcast\":false,\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-07-09 02:26:12'),(309,'93dd8cad-9a05-463e-8ce3-9b22da125e53','93dd8cb2-571c-4c73-bf61-06004c49203b',NULL,1,'event','{\"name\":\"Spatie\\\\Translatable\\\\Events\\\\TranslationHasBeenSet\",\"payload\":{\"model\":\"Vtlabs\\\\Ecommerce\\\\Models\\\\Coupon:\",\"key\":\"detail\",\"locale\":\"en\",\"oldValue\":\"\",\"newValue\":\"Test Coupon Details\"},\"listeners\":[],\"broadcast\":false,\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-07-09 02:26:12'),(310,'93dd8cad-9ad6-49bf-a4dc-5f5918a8b292','93dd8cb2-571c-4c73-bf61-06004c49203b',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"insert into `ecommerce_coupons` (`title`, `detail`, `code`, `reward`, `type`, `expires_at`, `updated_at`, `created_at`) values (\'{\\\\\\\"en\\\\\\\":\\\\\\\"Test Coupon\\\\\\\"}\', \'{\\\\\\\"en\\\\\\\":\\\\\\\"Test Coupon Details\\\\\\\"}\', \'TEST100\', 10, \'percent\', \'2020-12-31\', \'2021-07-09 02:26:12\', \'2021-07-09 02:26:12\')\",\"time\":\"1.72\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/doctoworld\\/doctoworld\\/database\\/seeds\\/CouponTableSeeder.php\",\"line\":41,\"hash\":\"bbd756391c4a95f5b4632e697f9e3d34\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-07-09 02:26:12'),(311,'93dd8cad-9aee-4d81-adce-4539171bdf49','93dd8cb2-571c-4c73-bf61-06004c49203b',NULL,1,'event','{\"name\":\"Spatie\\\\Translatable\\\\Events\\\\TranslationHasBeenSet\",\"payload\":{\"model\":\"Vtlabs\\\\Ecommerce\\\\Models\\\\Coupon:\",\"key\":\"title\",\"locale\":\"en\",\"oldValue\":\"\",\"newValue\":\"Test Coupon 2\"},\"listeners\":[],\"broadcast\":false,\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-07-09 02:26:12'),(312,'93dd8cad-9afe-4a2c-9aff-a178f8cd7ca4','93dd8cb2-571c-4c73-bf61-06004c49203b',NULL,1,'event','{\"name\":\"Spatie\\\\Translatable\\\\Events\\\\TranslationHasBeenSet\",\"payload\":{\"model\":\"Vtlabs\\\\Ecommerce\\\\Models\\\\Coupon:\",\"key\":\"detail\",\"locale\":\"en\",\"oldValue\":\"\",\"newValue\":\"Test Coupon 2 Details\"},\"listeners\":[],\"broadcast\":false,\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-07-09 02:26:12'),(313,'93dd8cad-9b59-42ae-a3b0-9b9e4706cf96','93dd8cb2-571c-4c73-bf61-06004c49203b',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"insert into `ecommerce_coupons` (`title`, `detail`, `code`, `reward`, `type`, `expires_at`, `updated_at`, `created_at`) values (\'{\\\\\\\"en\\\\\\\":\\\\\\\"Test Coupon 2\\\\\\\"}\', \'{\\\\\\\"en\\\\\\\":\\\\\\\"Test Coupon 2 Details\\\\\\\"}\', \'TEST200\', 20, \'percent\', \'2020-12-31\', \'2021-07-09 02:26:12\', \'2021-07-09 02:26:12\')\",\"time\":\"0.55\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/doctoworld\\/doctoworld\\/database\\/seeds\\/CouponTableSeeder.php\",\"line\":41,\"hash\":\"bbd756391c4a95f5b4632e697f9e3d34\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-07-09 02:26:12'),(314,'93dd8cad-9b71-4b8a-8883-8cc6753bbcf5','93dd8cb2-571c-4c73-bf61-06004c49203b',NULL,1,'event','{\"name\":\"Spatie\\\\Translatable\\\\Events\\\\TranslationHasBeenSet\",\"payload\":{\"model\":\"Vtlabs\\\\Ecommerce\\\\Models\\\\Coupon:\",\"key\":\"title\",\"locale\":\"en\",\"oldValue\":\"\",\"newValue\":\"Test Coupon 3\"},\"listeners\":[],\"broadcast\":false,\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-07-09 02:26:12'),(315,'93dd8cad-9b82-4bc4-85e7-b4e8f1a4f0c4','93dd8cb2-571c-4c73-bf61-06004c49203b',NULL,1,'event','{\"name\":\"Spatie\\\\Translatable\\\\Events\\\\TranslationHasBeenSet\",\"payload\":{\"model\":\"Vtlabs\\\\Ecommerce\\\\Models\\\\Coupon:\",\"key\":\"detail\",\"locale\":\"en\",\"oldValue\":\"\",\"newValue\":\"Test Coupon 3 Details\"},\"listeners\":[],\"broadcast\":false,\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-07-09 02:26:12'),(316,'93dd8cad-9c0e-4fde-a2f7-2c0d3dd90e3e','93dd8cb2-571c-4c73-bf61-06004c49203b',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"insert into `ecommerce_coupons` (`title`, `detail`, `code`, `reward`, `type`, `expires_at`, `updated_at`, `created_at`) values (\'{\\\\\\\"en\\\\\\\":\\\\\\\"Test Coupon 3\\\\\\\"}\', \'{\\\\\\\"en\\\\\\\":\\\\\\\"Test Coupon 3 Details\\\\\\\"}\', \'TEST300\', 30, \'percent\', \'2020-12-31\', \'2021-07-09 02:26:12\', \'2021-07-09 02:26:12\')\",\"time\":\"1.04\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/doctoworld\\/doctoworld\\/database\\/seeds\\/CouponTableSeeder.php\",\"line\":41,\"hash\":\"bbd756391c4a95f5b4632e697f9e3d34\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-07-09 02:26:12'),(317,'93dd8cad-9cde-4629-b575-dad4767cff98','93dd8cb2-571c-4c73-bf61-06004c49203b',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"insert into `faqs` (`title`, `short_description`, `description`, `updated_at`, `created_at`) values (\'Lorem ipsum\', \'Lorem ipsum dolor sit amet.\', \'Lorem ipsum dolor sit amet, consectetur adipiscing elit.\', \'2021-07-09 02:26:12\', \'2021-07-09 02:26:12\')\",\"time\":\"1.14\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/doctoworld\\/doctoworld\\/database\\/seeds\\/FaqTableSeeder.php\",\"line\":29,\"hash\":\"1155d5a654286fcedefebe1653aa3c98\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-07-09 02:26:12'),(318,'93dd8cad-9d3e-4fe9-8da9-881f733bafcc','93dd8cb2-571c-4c73-bf61-06004c49203b',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"insert into `faqs` (`title`, `short_description`, `description`, `updated_at`, `created_at`) values (\'Lorem dolor\', \'Lorem dolor ipsum dolor sit amet.\', \'Lorem dolor ipsum sit amet, consectetur adipiscing elit.\', \'2021-07-09 02:26:12\', \'2021-07-09 02:26:12\')\",\"time\":\"0.59\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/doctoworld\\/doctoworld\\/database\\/seeds\\/FaqTableSeeder.php\",\"line\":29,\"hash\":\"1155d5a654286fcedefebe1653aa3c98\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-07-09 02:26:12'),(319,'93dd8cad-9d93-49fd-a518-b68ae5b5b9c3','93dd8cb2-571c-4c73-bf61-06004c49203b',NULL,1,'event','{\"name\":\"Spatie\\\\Translatable\\\\Events\\\\TranslationHasBeenSet\",\"payload\":{\"model\":\"Vtlabs\\\\Banner\\\\Models\\\\Banner:\",\"key\":\"title\",\"locale\":\"en\",\"oldValue\":\"\",\"newValue\":\"Lorem ipsum dolor sit amet, consectetur adipiscing elit.\"},\"listeners\":[],\"broadcast\":false,\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-07-09 02:26:12'),(320,'93dd8cad-9e23-412b-a0eb-9373ec308720','93dd8cb2-571c-4c73-bf61-06004c49203b',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"insert into `banners` (`title`, `meta`, `sort_order`, `updated_at`, `created_at`) values (\'{\\\\\\\"en\\\\\\\":\\\\\\\"Lorem ipsum dolor sit amet, consectetur adipiscing elit.\\\\\\\"}\', \'{\\\\\\\"scope\\\\\\\":\\\\\\\"ecommerce\\\\\\\"}\', 1, \'2021-07-09 02:26:12\', \'2021-07-09 02:26:12\')\",\"time\":\"1.03\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/doctoworld\\/doctoworld\\/database\\/seeds\\/BannerTableSeeder.php\",\"line\":49,\"hash\":\"96ad107124f9feb780ddbe354a4e1c9d\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-07-09 02:26:12'),(321,'93dd8cae-2e66-4cd4-a698-1552335808b6','93dd8cb2-571c-4c73-bf61-06004c49203b',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"select max(`order_column`) as aggregate from `media`\",\"time\":\"0.53\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/doctoworld\\/doctoworld\\/database\\/seeds\\/BannerTableSeeder.php\",\"line\":53,\"hash\":\"7ca353d7601202740301a9e22a2ef124\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-07-09 02:26:12'),(322,'93dd8cae-2f14-4435-b98e-06b0432ff3c3','93dd8cb2-571c-4c73-bf61-06004c49203b',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"insert into `media` (`name`, `file_name`, `disk`, `collection_name`, `mime_type`, `size`, `custom_properties`, `responsive_images`, `manipulations`, `model_id`, `model_type`, `order_column`, `updated_at`, `created_at`) values (\'200\', \'200.png\', \'public\', \'images\', \'image\\/png\', 781, \'[]\', \'[]\', \'[]\', 1, \'Vtlabs\\\\Banner\\\\Models\\\\Banner\', 3, \'2021-07-09 02:26:12\', \'2021-07-09 02:26:12\')\",\"time\":\"1.08\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/doctoworld\\/doctoworld\\/database\\/seeds\\/BannerTableSeeder.php\",\"line\":53,\"hash\":\"7aea3bdb29139fee47ead42f0844d7b4\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-07-09 02:26:12'),(323,'93dd8cae-2f8c-4803-93b6-4cd3c5b4b1be','93dd8cb2-571c-4c73-bf61-06004c49203b',NULL,1,'event','{\"name\":\"Spatie\\\\MediaLibrary\\\\Events\\\\MediaHasBeenAdded\",\"payload\":{\"media\":\"Spatie\\\\MediaLibrary\\\\Models\\\\Media:3\"},\"listeners\":[],\"broadcast\":false,\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-07-09 02:26:12'),(324,'93dd8cae-307a-40b7-8a39-8809101c301c','93dd8cb2-571c-4c73-bf61-06004c49203b',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"insert into `jobs` (`queue`, `attempts`, `reserved_at`, `available_at`, `created_at`, `payload`) values (\'default\', 0, null, 1625797572, 1625797572, \'{\\\\\\\"displayName\\\\\\\":\\\\\\\"Spatie\\\\\\\\MediaLibrary\\\\\\\\Jobs\\\\\\\\PerformConversions\\\\\\\",\\\\\\\"job\\\\\\\":\\\\\\\"Illuminate\\\\\\\\Queue\\\\\\\\CallQueuedHandler@call\\\\\\\",\\\\\\\"maxTries\\\\\\\":null,\\\\\\\"delay\\\\\\\":null,\\\\\\\"timeout\\\\\\\":null,\\\\\\\"timeoutAt\\\\\\\":null,\\\\\\\"data\\\\\\\":{\\\\\\\"commandName\\\\\\\":\\\\\\\"Spatie\\\\\\\\MediaLibrary\\\\\\\\Jobs\\\\\\\\PerformConversions\\\\\\\",\\\\\\\"command\\\\\\\":\\\\\\\"O:43:\\\\\\\\\\\"Spatie\\\\\\\\MediaLibrary\\\\\\\\Jobs\\\\\\\\PerformConversions\\\\\\\\\\\":11:{s:14:\\\\\\\\\\\"\\\\u0000*\\\\u0000conversions\\\\\\\\\\\";O:51:\\\\\\\\\\\"Spatie\\\\\\\\MediaLibrary\\\\\\\\Conversion\\\\\\\\ConversionCollection\\\\\\\\\\\":2:{s:8:\\\\\\\\\\\"\\\\u0000*\\\\u0000media\\\\\\\\\\\";N;s:8:\\\\\\\\\\\"\\\\u0000*\\\\u0000items\\\\\\\\\\\";a:1:{i:0;O:41:\\\\\\\\\\\"Spatie\\\\\\\\MediaLibrary\\\\\\\\Conversion\\\\\\\\Conversion\\\\\\\\\\\":7:{s:7:\\\\\\\\\\\"\\\\u0000*\\\\u0000name\\\\\\\\\\\";s:5:\\\\\\\\\\\"thumb\\\\\\\\\\\";s:28:\\\\\\\\\\\"\\\\u0000*\\\\u0000extractVideoFrameAtSecond\\\\\\\\\\\";i:0;s:16:\\\\\\\\\\\"\\\\u0000*\\\\u0000manipulations\\\\\\\\\\\";O:26:\\\\\\\\\\\"Spatie\\\\\\\\Image\\\\\\\\Manipulations\\\\\\\\\\\":1:{s:23:\\\\\\\\\\\"\\\\u0000*\\\\u0000manipulationSequence\\\\\\\\\\\";O:33:\\\\\\\\\\\"Spatie\\\\\\\\Image\\\\\\\\ManipulationSequence\\\\\\\\\\\":1:{s:9:\\\\\\\\\\\"\\\\u0000*\\\\u0000groups\\\\\\\\\\\";a:1:{i:0;a:3:{s:8:\\\\\\\\\\\"optimize\\\\\\\\\\\";s:341:\\\\\\\\\\\"{\\\\\\\\\\\"Spatie\\\\\\\\\\\\\\\\ImageOptimizer\\\\\\\\\\\\\\\\Optimizers\\\\\\\\\\\\\\\\Jpegoptim\\\\\\\\\\\":[\\\\\\\\\\\"--strip-all\\\\\\\\\\\",\\\\\\\\\\\"--all-progressive\\\\\\\\\\\"],\\\\\\\\\\\"Spatie\\\\\\\\\\\\\\\\ImageOptimizer\\\\\\\\\\\\\\\\Optimizers\\\\\\\\\\\\\\\\Pngquant\\\\\\\\\\\":[\\\\\\\\\\\"--force\\\\\\\\\\\"],\\\\\\\\\\\"Spatie\\\\\\\\\\\\\\\\ImageOptimizer\\\\\\\\\\\\\\\\Optimizers\\\\\\\\\\\\\\\\Optipng\\\\\\\\\\\":[\\\\\\\\\\\"-i0\\\\\\\\\\\",\\\\\\\\\\\"-o2\\\\\\\\\\\",\\\\\\\\\\\"-quiet\\\\\\\\\\\"],\\\\\\\\\\\"Spatie\\\\\\\\\\\\\\\\ImageOptimizer\\\\\\\\\\\\\\\\Optimizers\\\\\\\\\\\\\\\\Svgo\\\\\\\\\\\":[\\\\\\\\\\\"--disable=cleanupIDs\\\\\\\\\\\"],\\\\\\\\\\\"Spatie\\\\\\\\\\\\\\\\ImageOptimizer\\\\\\\\\\\\\\\\Optimizers\\\\\\\\\\\\\\\\Gifsicle\\\\\\\\\\\":[\\\\\\\\\\\"-b\\\\\\\\\\\",\\\\\\\\\\\"-O3\\\\\\\\\\\"]}\\\\\\\\\\\";s:6:\\\\\\\\\\\"format\\\\\\\\\\\";s:3:\\\\\\\\\\\"jpg\\\\\\\\\\\";s:5:\\\\\\\\\\\"width\\\\\\\\\\\";s:2:\\\\\\\\\\\"50\\\\\\\\\\\";}}}}s:23:\\\\\\\\\\\"\\\\u0000*\\\\u0000performOnCollections\\\\\\\\\\\";a:0:{}s:17:\\\\\\\\\\\"\\\\u0000*\\\\u0000performOnQueue\\\\\\\\\\\";b:1;s:26:\\\\\\\\\\\"\\\\u0000*\\\\u0000keepOriginalImageFormat\\\\\\\\\\\";b:0;s:27:\\\\\\\\\\\"\\\\u0000*\\\\u0000generateResponsiveImages\\\\\\\\\\\";b:0;}}}s:8:\\\\\\\\\\\"\\\\u0000*\\\\u0000media\\\\\\\\\\\";O:45:\\\\\\\\\\\"Illuminate\\\\\\\\Contracts\\\\\\\\Database\\\\\\\\ModelIdentifier\\\\\\\\\\\":4:{s:5:\\\\\\\\\\\"class\\\\\\\\\\\";s:32:\\\\\\\\\\\"Spatie\\\\\\\\MediaLibrary\\\\\\\\Models\\\\\\\\Media\\\\\\\\\\\";s:2:\\\\\\\\\\\"id\\\\\\\\\\\";i:3;s:9:\\\\\\\\\\\"relations\\\\\\\\\\\";a:0:{}s:10:\\\\\\\\\\\"connection\\\\\\\\\\\";s:5:\\\\\\\\\\\"mysql\\\\\\\\\\\";}s:14:\\\\\\\\\\\"\\\\u0000*\\\\u0000onlyMissing\\\\\\\\\\\";b:0;s:6:\\\\\\\\\\\"\\\\u0000*\\\\u0000job\\\\\\\\\\\";N;s:10:\\\\\\\\\\\"connection\\\\\\\\\\\";N;s:5:\\\\\\\\\\\"queue\\\\\\\\\\\";N;s:15:\\\\\\\\\\\"chainConnection\\\\\\\\\\\";N;s:10:\\\\\\\\\\\"chainQueue\\\\\\\\\\\";N;s:5:\\\\\\\\\\\"delay\\\\\\\\\\\";N;s:10:\\\\\\\\\\\"middleware\\\\\\\\\\\";a:0:{}s:7:\\\\\\\\\\\"chained\\\\\\\\\\\";a:0:{}}\\\\\\\"}}\')\",\"time\":\"1.15\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/doctoworld\\/doctoworld\\/database\\/seeds\\/BannerTableSeeder.php\",\"line\":53,\"hash\":\"dcb5bc575158ce02a6c28ed0691de7a9\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-07-09 02:26:12'),(325,'93dd8cae-30c3-4fdd-b535-7e4d0abe3246','93dd8cb2-571c-4c73-bf61-06004c49203b',NULL,1,'event','{\"name\":\"Spatie\\\\Translatable\\\\Events\\\\TranslationHasBeenSet\",\"payload\":{\"model\":\"Vtlabs\\\\Banner\\\\Models\\\\Banner:\",\"key\":\"title\",\"locale\":\"en\",\"oldValue\":\"\",\"newValue\":\"Lorem ipsum dolor sit amet, consectetur adipiscing elit.\"},\"listeners\":[],\"broadcast\":false,\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-07-09 02:26:12'),(326,'93dd8cae-3162-4a43-8311-f90f69955cf3','93dd8cb2-571c-4c73-bf61-06004c49203b',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"insert into `banners` (`title`, `meta`, `sort_order`, `updated_at`, `created_at`) values (\'{\\\\\\\"en\\\\\\\":\\\\\\\"Lorem ipsum dolor sit amet, consectetur adipiscing elit.\\\\\\\"}\', \'{\\\\\\\"scope\\\\\\\":\\\\\\\"ecommerce\\\\\\\"}\', 2, \'2021-07-09 02:26:12\', \'2021-07-09 02:26:12\')\",\"time\":\"0.94\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/doctoworld\\/doctoworld\\/database\\/seeds\\/BannerTableSeeder.php\",\"line\":49,\"hash\":\"96ad107124f9feb780ddbe354a4e1c9d\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-07-09 02:26:12'),(327,'93dd8cb0-1d07-4185-b862-e59193dc637a','93dd8cb2-571c-4c73-bf61-06004c49203b',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"select max(`order_column`) as aggregate from `media`\",\"time\":\"0.47\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/doctoworld\\/doctoworld\\/database\\/seeds\\/BannerTableSeeder.php\",\"line\":53,\"hash\":\"7ca353d7601202740301a9e22a2ef124\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-07-09 02:26:14'),(328,'93dd8cb0-1dc0-4089-b2c0-15e1bc7e395b','93dd8cb2-571c-4c73-bf61-06004c49203b',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"insert into `media` (`name`, `file_name`, `disk`, `collection_name`, `mime_type`, `size`, `custom_properties`, `responsive_images`, `manipulations`, `model_id`, `model_type`, `order_column`, `updated_at`, `created_at`) values (\'200\', \'200.png\', \'public\', \'images\', \'image\\/png\', 781, \'[]\', \'[]\', \'[]\', 2, \'Vtlabs\\\\Banner\\\\Models\\\\Banner\', 4, \'2021-07-09 02:26:14\', \'2021-07-09 02:26:14\')\",\"time\":\"1.31\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/doctoworld\\/doctoworld\\/database\\/seeds\\/BannerTableSeeder.php\",\"line\":53,\"hash\":\"7aea3bdb29139fee47ead42f0844d7b4\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-07-09 02:26:14'),(329,'93dd8cb0-1e1c-4619-b535-fb41400dc415','93dd8cb2-571c-4c73-bf61-06004c49203b',NULL,1,'event','{\"name\":\"Spatie\\\\MediaLibrary\\\\Events\\\\MediaHasBeenAdded\",\"payload\":{\"media\":\"Spatie\\\\MediaLibrary\\\\Models\\\\Media:4\"},\"listeners\":[],\"broadcast\":false,\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-07-09 02:26:14'),(330,'93dd8cb0-1ebf-492b-8596-52302b7ee4c0','93dd8cb2-571c-4c73-bf61-06004c49203b',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"insert into `jobs` (`queue`, `attempts`, `reserved_at`, `available_at`, `created_at`, `payload`) values (\'default\', 0, null, 1625797574, 1625797574, \'{\\\\\\\"displayName\\\\\\\":\\\\\\\"Spatie\\\\\\\\MediaLibrary\\\\\\\\Jobs\\\\\\\\PerformConversions\\\\\\\",\\\\\\\"job\\\\\\\":\\\\\\\"Illuminate\\\\\\\\Queue\\\\\\\\CallQueuedHandler@call\\\\\\\",\\\\\\\"maxTries\\\\\\\":null,\\\\\\\"delay\\\\\\\":null,\\\\\\\"timeout\\\\\\\":null,\\\\\\\"timeoutAt\\\\\\\":null,\\\\\\\"data\\\\\\\":{\\\\\\\"commandName\\\\\\\":\\\\\\\"Spatie\\\\\\\\MediaLibrary\\\\\\\\Jobs\\\\\\\\PerformConversions\\\\\\\",\\\\\\\"command\\\\\\\":\\\\\\\"O:43:\\\\\\\\\\\"Spatie\\\\\\\\MediaLibrary\\\\\\\\Jobs\\\\\\\\PerformConversions\\\\\\\\\\\":11:{s:14:\\\\\\\\\\\"\\\\u0000*\\\\u0000conversions\\\\\\\\\\\";O:51:\\\\\\\\\\\"Spatie\\\\\\\\MediaLibrary\\\\\\\\Conversion\\\\\\\\ConversionCollection\\\\\\\\\\\":2:{s:8:\\\\\\\\\\\"\\\\u0000*\\\\u0000media\\\\\\\\\\\";N;s:8:\\\\\\\\\\\"\\\\u0000*\\\\u0000items\\\\\\\\\\\";a:1:{i:0;O:41:\\\\\\\\\\\"Spatie\\\\\\\\MediaLibrary\\\\\\\\Conversion\\\\\\\\Conversion\\\\\\\\\\\":7:{s:7:\\\\\\\\\\\"\\\\u0000*\\\\u0000name\\\\\\\\\\\";s:5:\\\\\\\\\\\"thumb\\\\\\\\\\\";s:28:\\\\\\\\\\\"\\\\u0000*\\\\u0000extractVideoFrameAtSecond\\\\\\\\\\\";i:0;s:16:\\\\\\\\\\\"\\\\u0000*\\\\u0000manipulations\\\\\\\\\\\";O:26:\\\\\\\\\\\"Spatie\\\\\\\\Image\\\\\\\\Manipulations\\\\\\\\\\\":1:{s:23:\\\\\\\\\\\"\\\\u0000*\\\\u0000manipulationSequence\\\\\\\\\\\";O:33:\\\\\\\\\\\"Spatie\\\\\\\\Image\\\\\\\\ManipulationSequence\\\\\\\\\\\":1:{s:9:\\\\\\\\\\\"\\\\u0000*\\\\u0000groups\\\\\\\\\\\";a:1:{i:0;a:3:{s:8:\\\\\\\\\\\"optimize\\\\\\\\\\\";s:341:\\\\\\\\\\\"{\\\\\\\\\\\"Spatie\\\\\\\\\\\\\\\\ImageOptimizer\\\\\\\\\\\\\\\\Optimizers\\\\\\\\\\\\\\\\Jpegoptim\\\\\\\\\\\":[\\\\\\\\\\\"--strip-all\\\\\\\\\\\",\\\\\\\\\\\"--all-progressive\\\\\\\\\\\"],\\\\\\\\\\\"Spatie\\\\\\\\\\\\\\\\ImageOptimizer\\\\\\\\\\\\\\\\Optimizers\\\\\\\\\\\\\\\\Pngquant\\\\\\\\\\\":[\\\\\\\\\\\"--force\\\\\\\\\\\"],\\\\\\\\\\\"Spatie\\\\\\\\\\\\\\\\ImageOptimizer\\\\\\\\\\\\\\\\Optimizers\\\\\\\\\\\\\\\\Optipng\\\\\\\\\\\":[\\\\\\\\\\\"-i0\\\\\\\\\\\",\\\\\\\\\\\"-o2\\\\\\\\\\\",\\\\\\\\\\\"-quiet\\\\\\\\\\\"],\\\\\\\\\\\"Spatie\\\\\\\\\\\\\\\\ImageOptimizer\\\\\\\\\\\\\\\\Optimizers\\\\\\\\\\\\\\\\Svgo\\\\\\\\\\\":[\\\\\\\\\\\"--disable=cleanupIDs\\\\\\\\\\\"],\\\\\\\\\\\"Spatie\\\\\\\\\\\\\\\\ImageOptimizer\\\\\\\\\\\\\\\\Optimizers\\\\\\\\\\\\\\\\Gifsicle\\\\\\\\\\\":[\\\\\\\\\\\"-b\\\\\\\\\\\",\\\\\\\\\\\"-O3\\\\\\\\\\\"]}\\\\\\\\\\\";s:6:\\\\\\\\\\\"format\\\\\\\\\\\";s:3:\\\\\\\\\\\"jpg\\\\\\\\\\\";s:5:\\\\\\\\\\\"width\\\\\\\\\\\";s:2:\\\\\\\\\\\"50\\\\\\\\\\\";}}}}s:23:\\\\\\\\\\\"\\\\u0000*\\\\u0000performOnCollections\\\\\\\\\\\";a:0:{}s:17:\\\\\\\\\\\"\\\\u0000*\\\\u0000performOnQueue\\\\\\\\\\\";b:1;s:26:\\\\\\\\\\\"\\\\u0000*\\\\u0000keepOriginalImageFormat\\\\\\\\\\\";b:0;s:27:\\\\\\\\\\\"\\\\u0000*\\\\u0000generateResponsiveImages\\\\\\\\\\\";b:0;}}}s:8:\\\\\\\\\\\"\\\\u0000*\\\\u0000media\\\\\\\\\\\";O:45:\\\\\\\\\\\"Illuminate\\\\\\\\Contracts\\\\\\\\Database\\\\\\\\ModelIdentifier\\\\\\\\\\\":4:{s:5:\\\\\\\\\\\"class\\\\\\\\\\\";s:32:\\\\\\\\\\\"Spatie\\\\\\\\MediaLibrary\\\\\\\\Models\\\\\\\\Media\\\\\\\\\\\";s:2:\\\\\\\\\\\"id\\\\\\\\\\\";i:4;s:9:\\\\\\\\\\\"relations\\\\\\\\\\\";a:0:{}s:10:\\\\\\\\\\\"connection\\\\\\\\\\\";s:5:\\\\\\\\\\\"mysql\\\\\\\\\\\";}s:14:\\\\\\\\\\\"\\\\u0000*\\\\u0000onlyMissing\\\\\\\\\\\";b:0;s:6:\\\\\\\\\\\"\\\\u0000*\\\\u0000job\\\\\\\\\\\";N;s:10:\\\\\\\\\\\"connection\\\\\\\\\\\";N;s:5:\\\\\\\\\\\"queue\\\\\\\\\\\";N;s:15:\\\\\\\\\\\"chainConnection\\\\\\\\\\\";N;s:10:\\\\\\\\\\\"chainQueue\\\\\\\\\\\";N;s:5:\\\\\\\\\\\"delay\\\\\\\\\\\";N;s:10:\\\\\\\\\\\"middleware\\\\\\\\\\\";a:0:{}s:7:\\\\\\\\\\\"chained\\\\\\\\\\\";a:0:{}}\\\\\\\"}}\')\",\"time\":\"0.83\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/doctoworld\\/doctoworld\\/database\\/seeds\\/BannerTableSeeder.php\",\"line\":53,\"hash\":\"dcb5bc575158ce02a6c28ed0691de7a9\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-07-09 02:26:14'),(331,'93dd8cb0-1eea-421c-a104-9df8bb11647c','93dd8cb2-571c-4c73-bf61-06004c49203b',NULL,1,'event','{\"name\":\"Spatie\\\\Translatable\\\\Events\\\\TranslationHasBeenSet\",\"payload\":{\"model\":\"Vtlabs\\\\Banner\\\\Models\\\\Banner:\",\"key\":\"title\",\"locale\":\"en\",\"oldValue\":\"\",\"newValue\":\"Lorem ipsum dolor sit amet, consectetur adipiscing elit.\"},\"listeners\":[],\"broadcast\":false,\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-07-09 02:26:14'),(332,'93dd8cb0-1f4f-44bd-92e8-7982006ba15e','93dd8cb2-571c-4c73-bf61-06004c49203b',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"insert into `banners` (`title`, `meta`, `sort_order`, `updated_at`, `created_at`) values (\'{\\\\\\\"en\\\\\\\":\\\\\\\"Lorem ipsum dolor sit amet, consectetur adipiscing elit.\\\\\\\"}\', \'{\\\\\\\"scope\\\\\\\":\\\\\\\"doctor\\\\\\\"}\', 1, \'2021-07-09 02:26:14\', \'2021-07-09 02:26:14\')\",\"time\":\"0.61\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/doctoworld\\/doctoworld\\/database\\/seeds\\/BannerTableSeeder.php\",\"line\":49,\"hash\":\"96ad107124f9feb780ddbe354a4e1c9d\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-07-09 02:26:14'),(333,'93dd8cb0-a6d7-4493-85e4-b7eb89f450e4','93dd8cb2-571c-4c73-bf61-06004c49203b',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"select max(`order_column`) as aggregate from `media`\",\"time\":\"0.52\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/doctoworld\\/doctoworld\\/database\\/seeds\\/BannerTableSeeder.php\",\"line\":53,\"hash\":\"7ca353d7601202740301a9e22a2ef124\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-07-09 02:26:14'),(334,'93dd8cb0-a7d2-4ac5-aabe-71e39df86197','93dd8cb2-571c-4c73-bf61-06004c49203b',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"insert into `media` (`name`, `file_name`, `disk`, `collection_name`, `mime_type`, `size`, `custom_properties`, `responsive_images`, `manipulations`, `model_id`, `model_type`, `order_column`, `updated_at`, `created_at`) values (\'200\', \'200.png\', \'public\', \'images\', \'image\\/png\', 781, \'[]\', \'[]\', \'[]\', 3, \'Vtlabs\\\\Banner\\\\Models\\\\Banner\', 5, \'2021-07-09 02:26:14\', \'2021-07-09 02:26:14\')\",\"time\":\"1.96\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/doctoworld\\/doctoworld\\/database\\/seeds\\/BannerTableSeeder.php\",\"line\":53,\"hash\":\"7aea3bdb29139fee47ead42f0844d7b4\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-07-09 02:26:14'),(335,'93dd8cb0-a845-4648-8cf6-787db26d8f5a','93dd8cb2-571c-4c73-bf61-06004c49203b',NULL,1,'event','{\"name\":\"Spatie\\\\MediaLibrary\\\\Events\\\\MediaHasBeenAdded\",\"payload\":{\"media\":\"Spatie\\\\MediaLibrary\\\\Models\\\\Media:5\"},\"listeners\":[],\"broadcast\":false,\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-07-09 02:26:14'),(336,'93dd8cb0-a8fd-4067-ac3b-1e85b3666978','93dd8cb2-571c-4c73-bf61-06004c49203b',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"insert into `jobs` (`queue`, `attempts`, `reserved_at`, `available_at`, `created_at`, `payload`) values (\'default\', 0, null, 1625797574, 1625797574, \'{\\\\\\\"displayName\\\\\\\":\\\\\\\"Spatie\\\\\\\\MediaLibrary\\\\\\\\Jobs\\\\\\\\PerformConversions\\\\\\\",\\\\\\\"job\\\\\\\":\\\\\\\"Illuminate\\\\\\\\Queue\\\\\\\\CallQueuedHandler@call\\\\\\\",\\\\\\\"maxTries\\\\\\\":null,\\\\\\\"delay\\\\\\\":null,\\\\\\\"timeout\\\\\\\":null,\\\\\\\"timeoutAt\\\\\\\":null,\\\\\\\"data\\\\\\\":{\\\\\\\"commandName\\\\\\\":\\\\\\\"Spatie\\\\\\\\MediaLibrary\\\\\\\\Jobs\\\\\\\\PerformConversions\\\\\\\",\\\\\\\"command\\\\\\\":\\\\\\\"O:43:\\\\\\\\\\\"Spatie\\\\\\\\MediaLibrary\\\\\\\\Jobs\\\\\\\\PerformConversions\\\\\\\\\\\":11:{s:14:\\\\\\\\\\\"\\\\u0000*\\\\u0000conversions\\\\\\\\\\\";O:51:\\\\\\\\\\\"Spatie\\\\\\\\MediaLibrary\\\\\\\\Conversion\\\\\\\\ConversionCollection\\\\\\\\\\\":2:{s:8:\\\\\\\\\\\"\\\\u0000*\\\\u0000media\\\\\\\\\\\";N;s:8:\\\\\\\\\\\"\\\\u0000*\\\\u0000items\\\\\\\\\\\";a:1:{i:0;O:41:\\\\\\\\\\\"Spatie\\\\\\\\MediaLibrary\\\\\\\\Conversion\\\\\\\\Conversion\\\\\\\\\\\":7:{s:7:\\\\\\\\\\\"\\\\u0000*\\\\u0000name\\\\\\\\\\\";s:5:\\\\\\\\\\\"thumb\\\\\\\\\\\";s:28:\\\\\\\\\\\"\\\\u0000*\\\\u0000extractVideoFrameAtSecond\\\\\\\\\\\";i:0;s:16:\\\\\\\\\\\"\\\\u0000*\\\\u0000manipulations\\\\\\\\\\\";O:26:\\\\\\\\\\\"Spatie\\\\\\\\Image\\\\\\\\Manipulations\\\\\\\\\\\":1:{s:23:\\\\\\\\\\\"\\\\u0000*\\\\u0000manipulationSequence\\\\\\\\\\\";O:33:\\\\\\\\\\\"Spatie\\\\\\\\Image\\\\\\\\ManipulationSequence\\\\\\\\\\\":1:{s:9:\\\\\\\\\\\"\\\\u0000*\\\\u0000groups\\\\\\\\\\\";a:1:{i:0;a:3:{s:8:\\\\\\\\\\\"optimize\\\\\\\\\\\";s:341:\\\\\\\\\\\"{\\\\\\\\\\\"Spatie\\\\\\\\\\\\\\\\ImageOptimizer\\\\\\\\\\\\\\\\Optimizers\\\\\\\\\\\\\\\\Jpegoptim\\\\\\\\\\\":[\\\\\\\\\\\"--strip-all\\\\\\\\\\\",\\\\\\\\\\\"--all-progressive\\\\\\\\\\\"],\\\\\\\\\\\"Spatie\\\\\\\\\\\\\\\\ImageOptimizer\\\\\\\\\\\\\\\\Optimizers\\\\\\\\\\\\\\\\Pngquant\\\\\\\\\\\":[\\\\\\\\\\\"--force\\\\\\\\\\\"],\\\\\\\\\\\"Spatie\\\\\\\\\\\\\\\\ImageOptimizer\\\\\\\\\\\\\\\\Optimizers\\\\\\\\\\\\\\\\Optipng\\\\\\\\\\\":[\\\\\\\\\\\"-i0\\\\\\\\\\\",\\\\\\\\\\\"-o2\\\\\\\\\\\",\\\\\\\\\\\"-quiet\\\\\\\\\\\"],\\\\\\\\\\\"Spatie\\\\\\\\\\\\\\\\ImageOptimizer\\\\\\\\\\\\\\\\Optimizers\\\\\\\\\\\\\\\\Svgo\\\\\\\\\\\":[\\\\\\\\\\\"--disable=cleanupIDs\\\\\\\\\\\"],\\\\\\\\\\\"Spatie\\\\\\\\\\\\\\\\ImageOptimizer\\\\\\\\\\\\\\\\Optimizers\\\\\\\\\\\\\\\\Gifsicle\\\\\\\\\\\":[\\\\\\\\\\\"-b\\\\\\\\\\\",\\\\\\\\\\\"-O3\\\\\\\\\\\"]}\\\\\\\\\\\";s:6:\\\\\\\\\\\"format\\\\\\\\\\\";s:3:\\\\\\\\\\\"jpg\\\\\\\\\\\";s:5:\\\\\\\\\\\"width\\\\\\\\\\\";s:2:\\\\\\\\\\\"50\\\\\\\\\\\";}}}}s:23:\\\\\\\\\\\"\\\\u0000*\\\\u0000performOnCollections\\\\\\\\\\\";a:0:{}s:17:\\\\\\\\\\\"\\\\u0000*\\\\u0000performOnQueue\\\\\\\\\\\";b:1;s:26:\\\\\\\\\\\"\\\\u0000*\\\\u0000keepOriginalImageFormat\\\\\\\\\\\";b:0;s:27:\\\\\\\\\\\"\\\\u0000*\\\\u0000generateResponsiveImages\\\\\\\\\\\";b:0;}}}s:8:\\\\\\\\\\\"\\\\u0000*\\\\u0000media\\\\\\\\\\\";O:45:\\\\\\\\\\\"Illuminate\\\\\\\\Contracts\\\\\\\\Database\\\\\\\\ModelIdentifier\\\\\\\\\\\":4:{s:5:\\\\\\\\\\\"class\\\\\\\\\\\";s:32:\\\\\\\\\\\"Spatie\\\\\\\\MediaLibrary\\\\\\\\Models\\\\\\\\Media\\\\\\\\\\\";s:2:\\\\\\\\\\\"id\\\\\\\\\\\";i:5;s:9:\\\\\\\\\\\"relations\\\\\\\\\\\";a:0:{}s:10:\\\\\\\\\\\"connection\\\\\\\\\\\";s:5:\\\\\\\\\\\"mysql\\\\\\\\\\\";}s:14:\\\\\\\\\\\"\\\\u0000*\\\\u0000onlyMissing\\\\\\\\\\\";b:0;s:6:\\\\\\\\\\\"\\\\u0000*\\\\u0000job\\\\\\\\\\\";N;s:10:\\\\\\\\\\\"connection\\\\\\\\\\\";N;s:5:\\\\\\\\\\\"queue\\\\\\\\\\\";N;s:15:\\\\\\\\\\\"chainConnection\\\\\\\\\\\";N;s:10:\\\\\\\\\\\"chainQueue\\\\\\\\\\\";N;s:5:\\\\\\\\\\\"delay\\\\\\\\\\\";N;s:10:\\\\\\\\\\\"middleware\\\\\\\\\\\";a:0:{}s:7:\\\\\\\\\\\"chained\\\\\\\\\\\";a:0:{}}\\\\\\\"}}\')\",\"time\":\"0.94\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/doctoworld\\/doctoworld\\/database\\/seeds\\/BannerTableSeeder.php\",\"line\":53,\"hash\":\"dcb5bc575158ce02a6c28ed0691de7a9\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-07-09 02:26:14'),(337,'93dd8cb0-a927-4059-83e9-9912ff17455d','93dd8cb2-571c-4c73-bf61-06004c49203b',NULL,1,'event','{\"name\":\"Spatie\\\\Translatable\\\\Events\\\\TranslationHasBeenSet\",\"payload\":{\"model\":\"Vtlabs\\\\Banner\\\\Models\\\\Banner:\",\"key\":\"title\",\"locale\":\"en\",\"oldValue\":\"\",\"newValue\":\"Lorem ipsum dolor sit amet, consectetur adipiscing elit.\"},\"listeners\":[],\"broadcast\":false,\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-07-09 02:26:14'),(338,'93dd8cb0-a999-4220-9f15-00a6e18e1df1','93dd8cb2-571c-4c73-bf61-06004c49203b',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"insert into `banners` (`title`, `meta`, `sort_order`, `updated_at`, `created_at`) values (\'{\\\\\\\"en\\\\\\\":\\\\\\\"Lorem ipsum dolor sit amet, consectetur adipiscing elit.\\\\\\\"}\', \'{\\\\\\\"scope\\\\\\\":\\\\\\\"doctor\\\\\\\"}\', 2, \'2021-07-09 02:26:14\', \'2021-07-09 02:26:14\')\",\"time\":\"0.67\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/doctoworld\\/doctoworld\\/database\\/seeds\\/BannerTableSeeder.php\",\"line\":49,\"hash\":\"96ad107124f9feb780ddbe354a4e1c9d\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-07-09 02:26:14'),(339,'93dd8cb1-26a1-4c41-a662-8dc7a6b95f3c','93dd8cb2-571c-4c73-bf61-06004c49203b',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"select max(`order_column`) as aggregate from `media`\",\"time\":\"0.53\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/doctoworld\\/doctoworld\\/database\\/seeds\\/BannerTableSeeder.php\",\"line\":53,\"hash\":\"7ca353d7601202740301a9e22a2ef124\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-07-09 02:26:14'),(340,'93dd8cb1-2744-4d4b-a019-1a9e01411603','93dd8cb2-571c-4c73-bf61-06004c49203b',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"insert into `media` (`name`, `file_name`, `disk`, `collection_name`, `mime_type`, `size`, `custom_properties`, `responsive_images`, `manipulations`, `model_id`, `model_type`, `order_column`, `updated_at`, `created_at`) values (\'200\', \'200.png\', \'public\', \'images\', \'image\\/png\', 781, \'[]\', \'[]\', \'[]\', 4, \'Vtlabs\\\\Banner\\\\Models\\\\Banner\', 6, \'2021-07-09 02:26:14\', \'2021-07-09 02:26:14\')\",\"time\":\"1.05\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/doctoworld\\/doctoworld\\/database\\/seeds\\/BannerTableSeeder.php\",\"line\":53,\"hash\":\"7aea3bdb29139fee47ead42f0844d7b4\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-07-09 02:26:14'),(341,'93dd8cb1-27fc-4731-aafd-cce9ec38e1f4','93dd8cb2-571c-4c73-bf61-06004c49203b',NULL,1,'event','{\"name\":\"Spatie\\\\MediaLibrary\\\\Events\\\\MediaHasBeenAdded\",\"payload\":{\"media\":\"Spatie\\\\MediaLibrary\\\\Models\\\\Media:6\"},\"listeners\":[],\"broadcast\":false,\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-07-09 02:26:14'),(342,'93dd8cb1-28f3-45c8-8239-96ed2d10f038','93dd8cb2-571c-4c73-bf61-06004c49203b',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"insert into `jobs` (`queue`, `attempts`, `reserved_at`, `available_at`, `created_at`, `payload`) values (\'default\', 0, null, 1625797574, 1625797574, \'{\\\\\\\"displayName\\\\\\\":\\\\\\\"Spatie\\\\\\\\MediaLibrary\\\\\\\\Jobs\\\\\\\\PerformConversions\\\\\\\",\\\\\\\"job\\\\\\\":\\\\\\\"Illuminate\\\\\\\\Queue\\\\\\\\CallQueuedHandler@call\\\\\\\",\\\\\\\"maxTries\\\\\\\":null,\\\\\\\"delay\\\\\\\":null,\\\\\\\"timeout\\\\\\\":null,\\\\\\\"timeoutAt\\\\\\\":null,\\\\\\\"data\\\\\\\":{\\\\\\\"commandName\\\\\\\":\\\\\\\"Spatie\\\\\\\\MediaLibrary\\\\\\\\Jobs\\\\\\\\PerformConversions\\\\\\\",\\\\\\\"command\\\\\\\":\\\\\\\"O:43:\\\\\\\\\\\"Spatie\\\\\\\\MediaLibrary\\\\\\\\Jobs\\\\\\\\PerformConversions\\\\\\\\\\\":11:{s:14:\\\\\\\\\\\"\\\\u0000*\\\\u0000conversions\\\\\\\\\\\";O:51:\\\\\\\\\\\"Spatie\\\\\\\\MediaLibrary\\\\\\\\Conversion\\\\\\\\ConversionCollection\\\\\\\\\\\":2:{s:8:\\\\\\\\\\\"\\\\u0000*\\\\u0000media\\\\\\\\\\\";N;s:8:\\\\\\\\\\\"\\\\u0000*\\\\u0000items\\\\\\\\\\\";a:1:{i:0;O:41:\\\\\\\\\\\"Spatie\\\\\\\\MediaLibrary\\\\\\\\Conversion\\\\\\\\Conversion\\\\\\\\\\\":7:{s:7:\\\\\\\\\\\"\\\\u0000*\\\\u0000name\\\\\\\\\\\";s:5:\\\\\\\\\\\"thumb\\\\\\\\\\\";s:28:\\\\\\\\\\\"\\\\u0000*\\\\u0000extractVideoFrameAtSecond\\\\\\\\\\\";i:0;s:16:\\\\\\\\\\\"\\\\u0000*\\\\u0000manipulations\\\\\\\\\\\";O:26:\\\\\\\\\\\"Spatie\\\\\\\\Image\\\\\\\\Manipulations\\\\\\\\\\\":1:{s:23:\\\\\\\\\\\"\\\\u0000*\\\\u0000manipulationSequence\\\\\\\\\\\";O:33:\\\\\\\\\\\"Spatie\\\\\\\\Image\\\\\\\\ManipulationSequence\\\\\\\\\\\":1:{s:9:\\\\\\\\\\\"\\\\u0000*\\\\u0000groups\\\\\\\\\\\";a:1:{i:0;a:3:{s:8:\\\\\\\\\\\"optimize\\\\\\\\\\\";s:341:\\\\\\\\\\\"{\\\\\\\\\\\"Spatie\\\\\\\\\\\\\\\\ImageOptimizer\\\\\\\\\\\\\\\\Optimizers\\\\\\\\\\\\\\\\Jpegoptim\\\\\\\\\\\":[\\\\\\\\\\\"--strip-all\\\\\\\\\\\",\\\\\\\\\\\"--all-progressive\\\\\\\\\\\"],\\\\\\\\\\\"Spatie\\\\\\\\\\\\\\\\ImageOptimizer\\\\\\\\\\\\\\\\Optimizers\\\\\\\\\\\\\\\\Pngquant\\\\\\\\\\\":[\\\\\\\\\\\"--force\\\\\\\\\\\"],\\\\\\\\\\\"Spatie\\\\\\\\\\\\\\\\ImageOptimizer\\\\\\\\\\\\\\\\Optimizers\\\\\\\\\\\\\\\\Optipng\\\\\\\\\\\":[\\\\\\\\\\\"-i0\\\\\\\\\\\",\\\\\\\\\\\"-o2\\\\\\\\\\\",\\\\\\\\\\\"-quiet\\\\\\\\\\\"],\\\\\\\\\\\"Spatie\\\\\\\\\\\\\\\\ImageOptimizer\\\\\\\\\\\\\\\\Optimizers\\\\\\\\\\\\\\\\Svgo\\\\\\\\\\\":[\\\\\\\\\\\"--disable=cleanupIDs\\\\\\\\\\\"],\\\\\\\\\\\"Spatie\\\\\\\\\\\\\\\\ImageOptimizer\\\\\\\\\\\\\\\\Optimizers\\\\\\\\\\\\\\\\Gifsicle\\\\\\\\\\\":[\\\\\\\\\\\"-b\\\\\\\\\\\",\\\\\\\\\\\"-O3\\\\\\\\\\\"]}\\\\\\\\\\\";s:6:\\\\\\\\\\\"format\\\\\\\\\\\";s:3:\\\\\\\\\\\"jpg\\\\\\\\\\\";s:5:\\\\\\\\\\\"width\\\\\\\\\\\";s:2:\\\\\\\\\\\"50\\\\\\\\\\\";}}}}s:23:\\\\\\\\\\\"\\\\u0000*\\\\u0000performOnCollections\\\\\\\\\\\";a:0:{}s:17:\\\\\\\\\\\"\\\\u0000*\\\\u0000performOnQueue\\\\\\\\\\\";b:1;s:26:\\\\\\\\\\\"\\\\u0000*\\\\u0000keepOriginalImageFormat\\\\\\\\\\\";b:0;s:27:\\\\\\\\\\\"\\\\u0000*\\\\u0000generateResponsiveImages\\\\\\\\\\\";b:0;}}}s:8:\\\\\\\\\\\"\\\\u0000*\\\\u0000media\\\\\\\\\\\";O:45:\\\\\\\\\\\"Illuminate\\\\\\\\Contracts\\\\\\\\Database\\\\\\\\ModelIdentifier\\\\\\\\\\\":4:{s:5:\\\\\\\\\\\"class\\\\\\\\\\\";s:32:\\\\\\\\\\\"Spatie\\\\\\\\MediaLibrary\\\\\\\\Models\\\\\\\\Media\\\\\\\\\\\";s:2:\\\\\\\\\\\"id\\\\\\\\\\\";i:6;s:9:\\\\\\\\\\\"relations\\\\\\\\\\\";a:0:{}s:10:\\\\\\\\\\\"connection\\\\\\\\\\\";s:5:\\\\\\\\\\\"mysql\\\\\\\\\\\";}s:14:\\\\\\\\\\\"\\\\u0000*\\\\u0000onlyMissing\\\\\\\\\\\";b:0;s:6:\\\\\\\\\\\"\\\\u0000*\\\\u0000job\\\\\\\\\\\";N;s:10:\\\\\\\\\\\"connection\\\\\\\\\\\";N;s:5:\\\\\\\\\\\"queue\\\\\\\\\\\";N;s:15:\\\\\\\\\\\"chainConnection\\\\\\\\\\\";N;s:10:\\\\\\\\\\\"chainQueue\\\\\\\\\\\";N;s:5:\\\\\\\\\\\"delay\\\\\\\\\\\";N;s:10:\\\\\\\\\\\"middleware\\\\\\\\\\\";a:0:{}s:7:\\\\\\\\\\\"chained\\\\\\\\\\\";a:0:{}}\\\\\\\"}}\')\",\"time\":\"1.30\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/doctoworld\\/doctoworld\\/database\\/seeds\\/BannerTableSeeder.php\",\"line\":53,\"hash\":\"dcb5bc575158ce02a6c28ed0691de7a9\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-07-09 02:26:14'),(343,'93dd8cb1-2934-43a0-b16e-f42cbf595b60','93dd8cb2-571c-4c73-bf61-06004c49203b',NULL,1,'event','{\"name\":\"Spatie\\\\Translatable\\\\Events\\\\TranslationHasBeenSet\",\"payload\":{\"model\":\"Vtlabs\\\\Banner\\\\Models\\\\Banner:\",\"key\":\"title\",\"locale\":\"en\",\"oldValue\":\"\",\"newValue\":\"Lorem ipsum dolor sit amet, consectetur adipiscing elit.\"},\"listeners\":[],\"broadcast\":false,\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-07-09 02:26:14'),(344,'93dd8cb1-29f2-47e5-9347-7dd012ffd742','93dd8cb2-571c-4c73-bf61-06004c49203b',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"insert into `banners` (`title`, `meta`, `sort_order`, `updated_at`, `created_at`) values (\'{\\\\\\\"en\\\\\\\":\\\\\\\"Lorem ipsum dolor sit amet, consectetur adipiscing elit.\\\\\\\"}\', \'{\\\\\\\"scope\\\\\\\":\\\\\\\"hospital\\\\\\\"}\', 1, \'2021-07-09 02:26:14\', \'2021-07-09 02:26:14\')\",\"time\":\"1.23\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/doctoworld\\/doctoworld\\/database\\/seeds\\/BannerTableSeeder.php\",\"line\":49,\"hash\":\"96ad107124f9feb780ddbe354a4e1c9d\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-07-09 02:26:14'),(345,'93dd8cb1-a906-4072-a3dd-f1eababee820','93dd8cb2-571c-4c73-bf61-06004c49203b',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"select max(`order_column`) as aggregate from `media`\",\"time\":\"1.30\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/doctoworld\\/doctoworld\\/database\\/seeds\\/BannerTableSeeder.php\",\"line\":53,\"hash\":\"7ca353d7601202740301a9e22a2ef124\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-07-09 02:26:15'),(346,'93dd8cb1-a9ac-45a1-895c-c6cc00b82052','93dd8cb2-571c-4c73-bf61-06004c49203b',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"insert into `media` (`name`, `file_name`, `disk`, `collection_name`, `mime_type`, `size`, `custom_properties`, `responsive_images`, `manipulations`, `model_id`, `model_type`, `order_column`, `updated_at`, `created_at`) values (\'200\', \'200.png\', \'public\', \'images\', \'image\\/png\', 781, \'[]\', \'[]\', \'[]\', 5, \'Vtlabs\\\\Banner\\\\Models\\\\Banner\', 7, \'2021-07-09 02:26:15\', \'2021-07-09 02:26:15\')\",\"time\":\"1.12\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/doctoworld\\/doctoworld\\/database\\/seeds\\/BannerTableSeeder.php\",\"line\":53,\"hash\":\"7aea3bdb29139fee47ead42f0844d7b4\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-07-09 02:26:15'),(347,'93dd8cb1-aa0f-4dcd-b010-38d9c4ce8eba','93dd8cb2-571c-4c73-bf61-06004c49203b',NULL,1,'event','{\"name\":\"Spatie\\\\MediaLibrary\\\\Events\\\\MediaHasBeenAdded\",\"payload\":{\"media\":\"Spatie\\\\MediaLibrary\\\\Models\\\\Media:7\"},\"listeners\":[],\"broadcast\":false,\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-07-09 02:26:15'),(348,'93dd8cb1-aaab-4ed5-be3f-20136d58167b','93dd8cb2-571c-4c73-bf61-06004c49203b',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"insert into `jobs` (`queue`, `attempts`, `reserved_at`, `available_at`, `created_at`, `payload`) values (\'default\', 0, null, 1625797575, 1625797575, \'{\\\\\\\"displayName\\\\\\\":\\\\\\\"Spatie\\\\\\\\MediaLibrary\\\\\\\\Jobs\\\\\\\\PerformConversions\\\\\\\",\\\\\\\"job\\\\\\\":\\\\\\\"Illuminate\\\\\\\\Queue\\\\\\\\CallQueuedHandler@call\\\\\\\",\\\\\\\"maxTries\\\\\\\":null,\\\\\\\"delay\\\\\\\":null,\\\\\\\"timeout\\\\\\\":null,\\\\\\\"timeoutAt\\\\\\\":null,\\\\\\\"data\\\\\\\":{\\\\\\\"commandName\\\\\\\":\\\\\\\"Spatie\\\\\\\\MediaLibrary\\\\\\\\Jobs\\\\\\\\PerformConversions\\\\\\\",\\\\\\\"command\\\\\\\":\\\\\\\"O:43:\\\\\\\\\\\"Spatie\\\\\\\\MediaLibrary\\\\\\\\Jobs\\\\\\\\PerformConversions\\\\\\\\\\\":11:{s:14:\\\\\\\\\\\"\\\\u0000*\\\\u0000conversions\\\\\\\\\\\";O:51:\\\\\\\\\\\"Spatie\\\\\\\\MediaLibrary\\\\\\\\Conversion\\\\\\\\ConversionCollection\\\\\\\\\\\":2:{s:8:\\\\\\\\\\\"\\\\u0000*\\\\u0000media\\\\\\\\\\\";N;s:8:\\\\\\\\\\\"\\\\u0000*\\\\u0000items\\\\\\\\\\\";a:1:{i:0;O:41:\\\\\\\\\\\"Spatie\\\\\\\\MediaLibrary\\\\\\\\Conversion\\\\\\\\Conversion\\\\\\\\\\\":7:{s:7:\\\\\\\\\\\"\\\\u0000*\\\\u0000name\\\\\\\\\\\";s:5:\\\\\\\\\\\"thumb\\\\\\\\\\\";s:28:\\\\\\\\\\\"\\\\u0000*\\\\u0000extractVideoFrameAtSecond\\\\\\\\\\\";i:0;s:16:\\\\\\\\\\\"\\\\u0000*\\\\u0000manipulations\\\\\\\\\\\";O:26:\\\\\\\\\\\"Spatie\\\\\\\\Image\\\\\\\\Manipulations\\\\\\\\\\\":1:{s:23:\\\\\\\\\\\"\\\\u0000*\\\\u0000manipulationSequence\\\\\\\\\\\";O:33:\\\\\\\\\\\"Spatie\\\\\\\\Image\\\\\\\\ManipulationSequence\\\\\\\\\\\":1:{s:9:\\\\\\\\\\\"\\\\u0000*\\\\u0000groups\\\\\\\\\\\";a:1:{i:0;a:3:{s:8:\\\\\\\\\\\"optimize\\\\\\\\\\\";s:341:\\\\\\\\\\\"{\\\\\\\\\\\"Spatie\\\\\\\\\\\\\\\\ImageOptimizer\\\\\\\\\\\\\\\\Optimizers\\\\\\\\\\\\\\\\Jpegoptim\\\\\\\\\\\":[\\\\\\\\\\\"--strip-all\\\\\\\\\\\",\\\\\\\\\\\"--all-progressive\\\\\\\\\\\"],\\\\\\\\\\\"Spatie\\\\\\\\\\\\\\\\ImageOptimizer\\\\\\\\\\\\\\\\Optimizers\\\\\\\\\\\\\\\\Pngquant\\\\\\\\\\\":[\\\\\\\\\\\"--force\\\\\\\\\\\"],\\\\\\\\\\\"Spatie\\\\\\\\\\\\\\\\ImageOptimizer\\\\\\\\\\\\\\\\Optimizers\\\\\\\\\\\\\\\\Optipng\\\\\\\\\\\":[\\\\\\\\\\\"-i0\\\\\\\\\\\",\\\\\\\\\\\"-o2\\\\\\\\\\\",\\\\\\\\\\\"-quiet\\\\\\\\\\\"],\\\\\\\\\\\"Spatie\\\\\\\\\\\\\\\\ImageOptimizer\\\\\\\\\\\\\\\\Optimizers\\\\\\\\\\\\\\\\Svgo\\\\\\\\\\\":[\\\\\\\\\\\"--disable=cleanupIDs\\\\\\\\\\\"],\\\\\\\\\\\"Spatie\\\\\\\\\\\\\\\\ImageOptimizer\\\\\\\\\\\\\\\\Optimizers\\\\\\\\\\\\\\\\Gifsicle\\\\\\\\\\\":[\\\\\\\\\\\"-b\\\\\\\\\\\",\\\\\\\\\\\"-O3\\\\\\\\\\\"]}\\\\\\\\\\\";s:6:\\\\\\\\\\\"format\\\\\\\\\\\";s:3:\\\\\\\\\\\"jpg\\\\\\\\\\\";s:5:\\\\\\\\\\\"width\\\\\\\\\\\";s:2:\\\\\\\\\\\"50\\\\\\\\\\\";}}}}s:23:\\\\\\\\\\\"\\\\u0000*\\\\u0000performOnCollections\\\\\\\\\\\";a:0:{}s:17:\\\\\\\\\\\"\\\\u0000*\\\\u0000performOnQueue\\\\\\\\\\\";b:1;s:26:\\\\\\\\\\\"\\\\u0000*\\\\u0000keepOriginalImageFormat\\\\\\\\\\\";b:0;s:27:\\\\\\\\\\\"\\\\u0000*\\\\u0000generateResponsiveImages\\\\\\\\\\\";b:0;}}}s:8:\\\\\\\\\\\"\\\\u0000*\\\\u0000media\\\\\\\\\\\";O:45:\\\\\\\\\\\"Illuminate\\\\\\\\Contracts\\\\\\\\Database\\\\\\\\ModelIdentifier\\\\\\\\\\\":4:{s:5:\\\\\\\\\\\"class\\\\\\\\\\\";s:32:\\\\\\\\\\\"Spatie\\\\\\\\MediaLibrary\\\\\\\\Models\\\\\\\\Media\\\\\\\\\\\";s:2:\\\\\\\\\\\"id\\\\\\\\\\\";i:7;s:9:\\\\\\\\\\\"relations\\\\\\\\\\\";a:0:{}s:10:\\\\\\\\\\\"connection\\\\\\\\\\\";s:5:\\\\\\\\\\\"mysql\\\\\\\\\\\";}s:14:\\\\\\\\\\\"\\\\u0000*\\\\u0000onlyMissing\\\\\\\\\\\";b:0;s:6:\\\\\\\\\\\"\\\\u0000*\\\\u0000job\\\\\\\\\\\";N;s:10:\\\\\\\\\\\"connection\\\\\\\\\\\";N;s:5:\\\\\\\\\\\"queue\\\\\\\\\\\";N;s:15:\\\\\\\\\\\"chainConnection\\\\\\\\\\\";N;s:10:\\\\\\\\\\\"chainQueue\\\\\\\\\\\";N;s:5:\\\\\\\\\\\"delay\\\\\\\\\\\";N;s:10:\\\\\\\\\\\"middleware\\\\\\\\\\\";a:0:{}s:7:\\\\\\\\\\\"chained\\\\\\\\\\\";a:0:{}}\\\\\\\"}}\')\",\"time\":\"0.80\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/doctoworld\\/doctoworld\\/database\\/seeds\\/BannerTableSeeder.php\",\"line\":53,\"hash\":\"dcb5bc575158ce02a6c28ed0691de7a9\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-07-09 02:26:15'),(349,'93dd8cb1-aad1-4949-89d3-aea9f84048d8','93dd8cb2-571c-4c73-bf61-06004c49203b',NULL,1,'event','{\"name\":\"Spatie\\\\Translatable\\\\Events\\\\TranslationHasBeenSet\",\"payload\":{\"model\":\"Vtlabs\\\\Banner\\\\Models\\\\Banner:\",\"key\":\"title\",\"locale\":\"en\",\"oldValue\":\"\",\"newValue\":\"Lorem ipsum dolor sit amet, consectetur adipiscing elit.\"},\"listeners\":[],\"broadcast\":false,\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-07-09 02:26:15'),(350,'93dd8cb1-ab6d-48bc-b667-7a9ab2bce564','93dd8cb2-571c-4c73-bf61-06004c49203b',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"insert into `banners` (`title`, `meta`, `sort_order`, `updated_at`, `created_at`) values (\'{\\\\\\\"en\\\\\\\":\\\\\\\"Lorem ipsum dolor sit amet, consectetur adipiscing elit.\\\\\\\"}\', \'{\\\\\\\"scope\\\\\\\":\\\\\\\"hospital\\\\\\\"}\', 2, \'2021-07-09 02:26:15\', \'2021-07-09 02:26:15\')\",\"time\":\"1.16\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/doctoworld\\/doctoworld\\/database\\/seeds\\/BannerTableSeeder.php\",\"line\":49,\"hash\":\"96ad107124f9feb780ddbe354a4e1c9d\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-07-09 02:26:15'),(351,'93dd8cb2-4e0a-445c-8767-1a7c84f24789','93dd8cb2-571c-4c73-bf61-06004c49203b',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"select max(`order_column`) as aggregate from `media`\",\"time\":\"0.69\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/doctoworld\\/doctoworld\\/database\\/seeds\\/BannerTableSeeder.php\",\"line\":53,\"hash\":\"7ca353d7601202740301a9e22a2ef124\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-07-09 02:26:15'),(352,'93dd8cb2-4ebe-489f-a450-b247a2d958e1','93dd8cb2-571c-4c73-bf61-06004c49203b',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"insert into `media` (`name`, `file_name`, `disk`, `collection_name`, `mime_type`, `size`, `custom_properties`, `responsive_images`, `manipulations`, `model_id`, `model_type`, `order_column`, `updated_at`, `created_at`) values (\'200\', \'200.png\', \'public\', \'images\', \'image\\/png\', 781, \'[]\', \'[]\', \'[]\', 6, \'Vtlabs\\\\Banner\\\\Models\\\\Banner\', 8, \'2021-07-09 02:26:15\', \'2021-07-09 02:26:15\')\",\"time\":\"1.23\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/doctoworld\\/doctoworld\\/database\\/seeds\\/BannerTableSeeder.php\",\"line\":53,\"hash\":\"7aea3bdb29139fee47ead42f0844d7b4\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-07-09 02:26:15'),(353,'93dd8cb2-4f49-44c7-9f0f-b0f5db659104','93dd8cb2-571c-4c73-bf61-06004c49203b',NULL,1,'event','{\"name\":\"Spatie\\\\MediaLibrary\\\\Events\\\\MediaHasBeenAdded\",\"payload\":{\"media\":\"Spatie\\\\MediaLibrary\\\\Models\\\\Media:8\"},\"listeners\":[],\"broadcast\":false,\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-07-09 02:26:15'),(354,'93dd8cb2-502c-4da0-8337-bf5bb641379c','93dd8cb2-571c-4c73-bf61-06004c49203b',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"insert into `jobs` (`queue`, `attempts`, `reserved_at`, `available_at`, `created_at`, `payload`) values (\'default\', 0, null, 1625797575, 1625797575, \'{\\\\\\\"displayName\\\\\\\":\\\\\\\"Spatie\\\\\\\\MediaLibrary\\\\\\\\Jobs\\\\\\\\PerformConversions\\\\\\\",\\\\\\\"job\\\\\\\":\\\\\\\"Illuminate\\\\\\\\Queue\\\\\\\\CallQueuedHandler@call\\\\\\\",\\\\\\\"maxTries\\\\\\\":null,\\\\\\\"delay\\\\\\\":null,\\\\\\\"timeout\\\\\\\":null,\\\\\\\"timeoutAt\\\\\\\":null,\\\\\\\"data\\\\\\\":{\\\\\\\"commandName\\\\\\\":\\\\\\\"Spatie\\\\\\\\MediaLibrary\\\\\\\\Jobs\\\\\\\\PerformConversions\\\\\\\",\\\\\\\"command\\\\\\\":\\\\\\\"O:43:\\\\\\\\\\\"Spatie\\\\\\\\MediaLibrary\\\\\\\\Jobs\\\\\\\\PerformConversions\\\\\\\\\\\":11:{s:14:\\\\\\\\\\\"\\\\u0000*\\\\u0000conversions\\\\\\\\\\\";O:51:\\\\\\\\\\\"Spatie\\\\\\\\MediaLibrary\\\\\\\\Conversion\\\\\\\\ConversionCollection\\\\\\\\\\\":2:{s:8:\\\\\\\\\\\"\\\\u0000*\\\\u0000media\\\\\\\\\\\";N;s:8:\\\\\\\\\\\"\\\\u0000*\\\\u0000items\\\\\\\\\\\";a:1:{i:0;O:41:\\\\\\\\\\\"Spatie\\\\\\\\MediaLibrary\\\\\\\\Conversion\\\\\\\\Conversion\\\\\\\\\\\":7:{s:7:\\\\\\\\\\\"\\\\u0000*\\\\u0000name\\\\\\\\\\\";s:5:\\\\\\\\\\\"thumb\\\\\\\\\\\";s:28:\\\\\\\\\\\"\\\\u0000*\\\\u0000extractVideoFrameAtSecond\\\\\\\\\\\";i:0;s:16:\\\\\\\\\\\"\\\\u0000*\\\\u0000manipulations\\\\\\\\\\\";O:26:\\\\\\\\\\\"Spatie\\\\\\\\Image\\\\\\\\Manipulations\\\\\\\\\\\":1:{s:23:\\\\\\\\\\\"\\\\u0000*\\\\u0000manipulationSequence\\\\\\\\\\\";O:33:\\\\\\\\\\\"Spatie\\\\\\\\Image\\\\\\\\ManipulationSequence\\\\\\\\\\\":1:{s:9:\\\\\\\\\\\"\\\\u0000*\\\\u0000groups\\\\\\\\\\\";a:1:{i:0;a:3:{s:8:\\\\\\\\\\\"optimize\\\\\\\\\\\";s:341:\\\\\\\\\\\"{\\\\\\\\\\\"Spatie\\\\\\\\\\\\\\\\ImageOptimizer\\\\\\\\\\\\\\\\Optimizers\\\\\\\\\\\\\\\\Jpegoptim\\\\\\\\\\\":[\\\\\\\\\\\"--strip-all\\\\\\\\\\\",\\\\\\\\\\\"--all-progressive\\\\\\\\\\\"],\\\\\\\\\\\"Spatie\\\\\\\\\\\\\\\\ImageOptimizer\\\\\\\\\\\\\\\\Optimizers\\\\\\\\\\\\\\\\Pngquant\\\\\\\\\\\":[\\\\\\\\\\\"--force\\\\\\\\\\\"],\\\\\\\\\\\"Spatie\\\\\\\\\\\\\\\\ImageOptimizer\\\\\\\\\\\\\\\\Optimizers\\\\\\\\\\\\\\\\Optipng\\\\\\\\\\\":[\\\\\\\\\\\"-i0\\\\\\\\\\\",\\\\\\\\\\\"-o2\\\\\\\\\\\",\\\\\\\\\\\"-quiet\\\\\\\\\\\"],\\\\\\\\\\\"Spatie\\\\\\\\\\\\\\\\ImageOptimizer\\\\\\\\\\\\\\\\Optimizers\\\\\\\\\\\\\\\\Svgo\\\\\\\\\\\":[\\\\\\\\\\\"--disable=cleanupIDs\\\\\\\\\\\"],\\\\\\\\\\\"Spatie\\\\\\\\\\\\\\\\ImageOptimizer\\\\\\\\\\\\\\\\Optimizers\\\\\\\\\\\\\\\\Gifsicle\\\\\\\\\\\":[\\\\\\\\\\\"-b\\\\\\\\\\\",\\\\\\\\\\\"-O3\\\\\\\\\\\"]}\\\\\\\\\\\";s:6:\\\\\\\\\\\"format\\\\\\\\\\\";s:3:\\\\\\\\\\\"jpg\\\\\\\\\\\";s:5:\\\\\\\\\\\"width\\\\\\\\\\\";s:2:\\\\\\\\\\\"50\\\\\\\\\\\";}}}}s:23:\\\\\\\\\\\"\\\\u0000*\\\\u0000performOnCollections\\\\\\\\\\\";a:0:{}s:17:\\\\\\\\\\\"\\\\u0000*\\\\u0000performOnQueue\\\\\\\\\\\";b:1;s:26:\\\\\\\\\\\"\\\\u0000*\\\\u0000keepOriginalImageFormat\\\\\\\\\\\";b:0;s:27:\\\\\\\\\\\"\\\\u0000*\\\\u0000generateResponsiveImages\\\\\\\\\\\";b:0;}}}s:8:\\\\\\\\\\\"\\\\u0000*\\\\u0000media\\\\\\\\\\\";O:45:\\\\\\\\\\\"Illuminate\\\\\\\\Contracts\\\\\\\\Database\\\\\\\\ModelIdentifier\\\\\\\\\\\":4:{s:5:\\\\\\\\\\\"class\\\\\\\\\\\";s:32:\\\\\\\\\\\"Spatie\\\\\\\\MediaLibrary\\\\\\\\Models\\\\\\\\Media\\\\\\\\\\\";s:2:\\\\\\\\\\\"id\\\\\\\\\\\";i:8;s:9:\\\\\\\\\\\"relations\\\\\\\\\\\";a:0:{}s:10:\\\\\\\\\\\"connection\\\\\\\\\\\";s:5:\\\\\\\\\\\"mysql\\\\\\\\\\\";}s:14:\\\\\\\\\\\"\\\\u0000*\\\\u0000onlyMissing\\\\\\\\\\\";b:0;s:6:\\\\\\\\\\\"\\\\u0000*\\\\u0000job\\\\\\\\\\\";N;s:10:\\\\\\\\\\\"connection\\\\\\\\\\\";N;s:5:\\\\\\\\\\\"queue\\\\\\\\\\\";N;s:15:\\\\\\\\\\\"chainConnection\\\\\\\\\\\";N;s:10:\\\\\\\\\\\"chainQueue\\\\\\\\\\\";N;s:5:\\\\\\\\\\\"delay\\\\\\\\\\\";N;s:10:\\\\\\\\\\\"middleware\\\\\\\\\\\";a:0:{}s:7:\\\\\\\\\\\"chained\\\\\\\\\\\";a:0:{}}\\\\\\\"}}\')\",\"time\":\"1.19\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/doctoworld\\/doctoworld\\/database\\/seeds\\/BannerTableSeeder.php\",\"line\":53,\"hash\":\"dcb5bc575158ce02a6c28ed0691de7a9\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-07-09 02:26:15'),(355,'93dd8cb2-5552-46e5-a25e-cf4ff46f1ee7','93dd8cb2-571c-4c73-bf61-06004c49203b',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"insert into `oauth_clients` (`user_id`, `name`, `secret`, `redirect`, `personal_access_client`, `password_client`, `revoked`, `updated_at`, `created_at`) values (null, \'Doctoworld Personal Access Client\', \'HquNRJ164Uo86X5nIkFgdliVCM67UnQ0bkNeV7qY\', \'http:\\/\\/localhost\', 1, 0, 0, \'2021-07-09 02:26:15\', \'2021-07-09 02:26:15\')\",\"time\":\"0.97\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/doctoworld\\/doctoworld\\/artisan\",\"line\":35,\"hash\":\"bc77ccc261b03668020fd7c60ae5eebc\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-07-09 02:26:15'),(356,'93dd8cb2-5651-4114-879c-bf0f0c49f00b','93dd8cb2-571c-4c73-bf61-06004c49203b',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"insert into `oauth_personal_access_clients` (`client_id`, `updated_at`, `created_at`) values (1, \'2021-07-09 02:26:15\', \'2021-07-09 02:26:15\')\",\"time\":\"1.84\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/doctoworld\\/doctoworld\\/artisan\",\"line\":35,\"hash\":\"ebe2f9b5834a09d9cc954abb8c72b92b\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-07-09 02:26:15'),(357,'93dd8cb2-56e2-4044-adc1-7eb0504c6492','93dd8cb2-571c-4c73-bf61-06004c49203b',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"insert into `oauth_clients` (`user_id`, `name`, `secret`, `redirect`, `personal_access_client`, `password_client`, `revoked`, `updated_at`, `created_at`) values (null, \'Doctoworld Password Grant Client\', \'5kBu9K1T16nlfuDrNciTVFGV8G8jQAMaJvkfnTR4\', \'http:\\/\\/localhost\', 0, 1, 0, \'2021-07-09 02:26:15\', \'2021-07-09 02:26:15\')\",\"time\":\"0.65\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/doctoworld\\/doctoworld\\/artisan\",\"line\":35,\"hash\":\"bc77ccc261b03668020fd7c60ae5eebc\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-07-09 02:26:15');
/*!40000 ALTER TABLE `telescope_entries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `telescope_entries_tags`
--

DROP TABLE IF EXISTS `telescope_entries_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `telescope_entries_tags` (
  `entry_uuid` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tag` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  KEY `telescope_entries_tags_entry_uuid_tag_index` (`entry_uuid`,`tag`),
  KEY `telescope_entries_tags_tag_index` (`tag`),
  CONSTRAINT `telescope_entries_tags_entry_uuid_foreign` FOREIGN KEY (`entry_uuid`) REFERENCES `telescope_entries` (`uuid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `telescope_entries_tags`
--

LOCK TABLES `telescope_entries_tags` WRITE;
/*!40000 ALTER TABLE `telescope_entries_tags` DISABLE KEYS */;
INSERT INTO `telescope_entries_tags` VALUES ('93dd8ca7-a2d2-44aa-9cd3-4e1e1ed4d58e','slow'),('93dd8ca8-7916-44f1-9af9-7d1f5c1c24d0','slow'),('93dd8caa-52ed-428f-bc76-b558b6ed3e18','slow'),('93dd8cac-3ced-4e88-addc-b642278ef3d1','Vtlabs\\Category\\Models\\Category:'),('93dd8cac-faef-4fd2-96fe-f0446b3994ba','Spatie\\MediaLibrary\\Models\\Media:1'),('93dd8cac-fdeb-44ea-ae35-0d36a6ebdc66','Vtlabs\\Category\\Models\\Category:'),('93dd8cac-fe83-4723-a57c-7f1e4ee09464','Vtlabs\\Category\\Models\\Category:'),('93dd8cac-ff0a-4e9e-8afd-bb6a6fe16f32','Vtlabs\\Category\\Models\\Category:'),('93dd8cac-ff90-4259-b9f5-a50c8903a7f7','Vtlabs\\Category\\Models\\Category:'),('93dd8cad-8fd1-44ab-be1b-7b726335ed03','Spatie\\MediaLibrary\\Models\\Media:2'),('93dd8cad-90fc-4a58-8e0a-ba89e44b06c0','Vtlabs\\Category\\Models\\Category:'),('93dd8cad-91ce-487e-bc44-fb230cc32800','Vtlabs\\Category\\Models\\Category:'),('93dd8cad-928c-4383-80b4-441c6b5e765f','Vtlabs\\Category\\Models\\Category:'),('93dd8cad-9321-4688-aae7-e5052764f18c','Vtlabs\\Category\\Models\\Category:'),('93dd8cad-939e-48cb-ac81-ffbe0553b8ac','Vtlabs\\Category\\Models\\Category:'),('93dd8cad-9420-4809-acc1-62ed3d9e0428','Vtlabs\\Category\\Models\\Category:'),('93dd8cad-949e-4490-afe1-49da2eca00ab','Vtlabs\\Category\\Models\\Category:'),('93dd8cad-9511-441d-b577-71258a19ad37','Vtlabs\\Category\\Models\\Category:'),('93dd8cad-9590-468f-8084-cd5e87dd6d0e','Vtlabs\\Category\\Models\\Category:'),('93dd8cad-9645-4cf6-81bf-2c68b417c394','Vtlabs\\Category\\Models\\Category:'),('93dd8cad-9726-41ee-9afd-21244ff666ff','Vtlabs\\Doctor\\Models\\Hospital:'),('93dd8cad-973a-4aba-b143-ab96d892e23b','Vtlabs\\Doctor\\Models\\Hospital:'),('93dd8cad-974b-4b26-bc6f-57bcb18048cb','Vtlabs\\Doctor\\Models\\Hospital:'),('93dd8cad-9824-426c-80fb-ae883725d9d7','Vtlabs\\Doctor\\Models\\Hospital:'),('93dd8cad-9836-4c85-ad29-f753e8340da7','Vtlabs\\Doctor\\Models\\Hospital:'),('93dd8cad-9847-441b-889e-1c70defd359c','Vtlabs\\Doctor\\Models\\Hospital:'),('93dd8cad-9935-40f1-b053-3451a1e852ec','Vtlabs\\Payment\\Models\\PaymentMethod:'),('93dd8cad-99f2-427d-a59a-746b900cdf8d','Vtlabs\\Ecommerce\\Models\\Coupon:'),('93dd8cad-9a05-463e-8ce3-9b22da125e53','Vtlabs\\Ecommerce\\Models\\Coupon:'),('93dd8cad-9aee-4d81-adce-4539171bdf49','Vtlabs\\Ecommerce\\Models\\Coupon:'),('93dd8cad-9afe-4a2c-9aff-a178f8cd7ca4','Vtlabs\\Ecommerce\\Models\\Coupon:'),('93dd8cad-9b71-4b8a-8883-8cc6753bbcf5','Vtlabs\\Ecommerce\\Models\\Coupon:'),('93dd8cad-9b82-4bc4-85e7-b4e8f1a4f0c4','Vtlabs\\Ecommerce\\Models\\Coupon:'),('93dd8cad-9d93-49fd-a518-b68ae5b5b9c3','Vtlabs\\Banner\\Models\\Banner:'),('93dd8cae-2f8c-4803-93b6-4cd3c5b4b1be','Spatie\\MediaLibrary\\Models\\Media:3'),('93dd8cae-30c3-4fdd-b535-7e4d0abe3246','Vtlabs\\Banner\\Models\\Banner:'),('93dd8cb0-1e1c-4619-b535-fb41400dc415','Spatie\\MediaLibrary\\Models\\Media:4'),('93dd8cb0-1eea-421c-a104-9df8bb11647c','Vtlabs\\Banner\\Models\\Banner:'),('93dd8cb0-a845-4648-8cf6-787db26d8f5a','Spatie\\MediaLibrary\\Models\\Media:5'),('93dd8cb0-a927-4059-83e9-9912ff17455d','Vtlabs\\Banner\\Models\\Banner:'),('93dd8cb1-27fc-4731-aafd-cce9ec38e1f4','Spatie\\MediaLibrary\\Models\\Media:6'),('93dd8cb1-2934-43a0-b16e-f42cbf595b60','Vtlabs\\Banner\\Models\\Banner:'),('93dd8cb1-aa0f-4dcd-b010-38d9c4ce8eba','Spatie\\MediaLibrary\\Models\\Media:7'),('93dd8cb1-aad1-4949-89d3-aea9f84048d8','Vtlabs\\Banner\\Models\\Banner:'),('93dd8cb2-4f49-44c7-9f0f-b0f5db659104','Spatie\\MediaLibrary\\Models\\Media:8');
/*!40000 ALTER TABLE `telescope_entries_tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `telescope_monitoring`
--

DROP TABLE IF EXISTS `telescope_monitoring`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `telescope_monitoring` (
  `tag` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `telescope_monitoring`
--

LOCK TABLES `telescope_monitoring` WRITE;
/*!40000 ALTER TABLE `telescope_monitoring` DISABLE KEYS */;
/*!40000 ALTER TABLE `telescope_monitoring` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_follower`
--

DROP TABLE IF EXISTS `user_follower`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_follower` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `following_id` bigint unsigned NOT NULL,
  `follower_id` bigint unsigned NOT NULL,
  `accepted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_follower_following_id_index` (`following_id`),
  KEY `user_follower_follower_id_index` (`follower_id`),
  KEY `user_follower_accepted_at_index` (`accepted_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_follower`
--

LOCK TABLES `user_follower` WRITE;
/*!40000 ALTER TABLE `user_follower` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_follower` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mobile_number` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mobile_verified` tinyint(1) NOT NULL DEFAULT '0',
  `is_verified` tinyint(1) NOT NULL DEFAULT '0',
  `active` tinyint unsigned NOT NULL DEFAULT '1',
  `language` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'en',
  `notification` json DEFAULT NULL,
  `meta` json DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`),
  UNIQUE KEY `users_mobile_number_unique` (`mobile_number`),
  UNIQUE KEY `users_username_unique` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Admin','admin@example.com',NULL,'$2y$10$y72RYrGnifu6qnX0uOKIeOuc5qONXaiMfcFlxEYMSip/Fh3wmRmBO','8888888888',1,0,1,'en',NULL,NULL,NULL,'2021-07-08 20:56:11','2021-07-08 20:56:11');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wallet_transactions`
--

DROP TABLE IF EXISTS `wallet_transactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wallet_transactions` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `wallet_id` int unsigned NOT NULL,
  `amount` int NOT NULL,
  `hash` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `accepted` tinyint(1) NOT NULL,
  `meta` json DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `wallet_transactions_wallet_id_foreign` (`wallet_id`),
  CONSTRAINT `wallet_transactions_wallet_id_foreign` FOREIGN KEY (`wallet_id`) REFERENCES `wallets` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wallet_transactions`
--

LOCK TABLES `wallet_transactions` WRITE;
/*!40000 ALTER TABLE `wallet_transactions` DISABLE KEYS */;
/*!40000 ALTER TABLE `wallet_transactions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wallets`
--

DROP TABLE IF EXISTS `wallets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wallets` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int unsigned DEFAULT NULL,
  `balance` bigint NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `wallets_user_id_foreign` (`user_id`),
  CONSTRAINT `wallets_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wallets`
--

LOCK TABLES `wallets` WRITE;
/*!40000 ALTER TABLE `wallets` DISABLE KEYS */;
/*!40000 ALTER TABLE `wallets` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-07-09  7:57:59
