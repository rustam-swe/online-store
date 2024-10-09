-- MySQL dump 10.13  Distrib 8.4.2, for Linux (aarch64)
--
-- Host: localhost    Database: online_store
-- ------------------------------------------------------
-- Server version	8.4.2

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
-- Table structure for table `cache`
--

DROP TABLE IF EXISTS `cache`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cache` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cache`
--

LOCK TABLES `cache` WRITE;
/*!40000 ALTER TABLE `cache` DISABLE KEYS */;
/*!40000 ALTER TABLE `cache` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cache_locks`
--

DROP TABLE IF EXISTS `cache_locks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cache_locks` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `owner` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cache_locks`
--

LOCK TABLES `cache_locks` WRITE;
/*!40000 ALTER TABLE `cache_locks` DISABLE KEYS */;
/*!40000 ALTER TABLE `cache_locks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `carts`
--

DROP TABLE IF EXISTS `carts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `carts` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `product_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `carts_user_id_foreign` (`user_id`),
  KEY `carts_product_id_foreign` (`product_id`),
  CONSTRAINT `carts_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  CONSTRAINT `carts_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `carts`
--

LOCK TABLES `carts` WRITE;
/*!40000 ALTER TABLE `carts` DISABLE KEYS */;
/*!40000 ALTER TABLE `carts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `parent_id` bigint unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `categories_parent_id_foreign` (`parent_id`),
  CONSTRAINT `categories_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,'all',NULL,'2024-10-08 15:09:45','2024-10-08 15:09:45'),(2,'electronics',1,'2024-10-08 15:14:32','2024-10-08 15:14:32'),(3,'phones',2,'2024-10-08 15:38:00','2024-10-08 15:38:00'),(4,'laptops',2,'2024-10-08 15:38:06','2024-10-08 15:38:06'),(5,'Apple',4,'2024-10-08 15:38:33','2024-10-08 15:38:33'),(6,'Samsung',4,'2024-10-08 15:38:44','2024-10-08 15:38:44'),(7,'Android',3,'2024-10-08 15:38:55','2024-10-08 15:38:55'),(8,'ios',3,'2024-10-08 15:39:17','2024-10-08 15:39:17');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comments`
--

DROP TABLE IF EXISTS `comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comments` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `product_id` bigint unsigned NOT NULL,
  `text` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `rating` tinyint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `comments_user_id_foreign` (`user_id`),
  KEY `comments_product_id_foreign` (`product_id`),
  CONSTRAINT `comments_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  CONSTRAINT `comments_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comments`
--

LOCK TABLES `comments` WRITE;
/*!40000 ALTER TABLE `comments` DISABLE KEYS */;
/*!40000 ALTER TABLE `comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `failed_jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `failed_jobs`
--

LOCK TABLES `failed_jobs` WRITE;
/*!40000 ALTER TABLE `failed_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `failed_jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `images`
--

DROP TABLE IF EXISTS `images`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `images` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `product_id` bigint unsigned NOT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `images_product_id_foreign` (`product_id`),
  CONSTRAINT `images_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `images`
--

LOCK TABLES `images` WRITE;
/*!40000 ALTER TABLE `images` DISABLE KEYS */;
/*!40000 ALTER TABLE `images` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `job_batches`
--

DROP TABLE IF EXISTS `job_batches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `job_batches` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_jobs` int NOT NULL,
  `pending_jobs` int NOT NULL,
  `failed_jobs` int NOT NULL,
  `failed_job_ids` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `options` mediumtext COLLATE utf8mb4_unicode_ci,
  `cancelled_at` int DEFAULT NULL,
  `created_at` int NOT NULL,
  `finished_at` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
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
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `queue` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint unsigned NOT NULL,
  `reserved_at` int unsigned DEFAULT NULL,
  `available_at` int unsigned NOT NULL,
  `created_at` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `jobs_queue_index` (`queue`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jobs`
--

LOCK TABLES `jobs` WRITE;
/*!40000 ALTER TABLE `jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'0001_01_01_000000_create_users_table',1),(2,'0001_01_01_000001_create_cache_table',1),(3,'0001_01_01_000002_create_jobs_table',1),(4,'2024_10_08_100035_create_categories_table',1),(5,'2024_10_08_100723_create_products_table',1),(6,'2024_10_08_100948_create_comments_table',1),(7,'2024_10_08_100956_create_images_table',1),(8,'2024_10_08_101024_create_carts_table',1),(9,'2024_10_08_101029_create_orders_table',1),(10,'2024_10_08_143311_create_personal_access_tokens_table',2);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `total` int NOT NULL,
  `status` enum('pending','completed','cancelled') COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `orders_user_id_foreign` (`user_id`),
  CONSTRAINT `orders_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,1,203,'pending','2024-10-08 14:31:42','2024-10-08 14:31:42'),(2,2,156,'completed','2024-10-08 14:31:42','2024-10-08 14:31:42'),(3,2,312,'pending','2024-10-08 14:31:42','2024-10-08 14:31:42'),(4,2,151,'completed','2024-10-08 14:31:42','2024-10-08 14:31:42'),(5,2,206,'pending','2024-10-08 14:31:42','2024-10-08 14:31:42'),(6,4,143,'pending','2024-10-08 14:31:42','2024-10-08 14:31:42'),(7,4,306,'completed','2024-10-08 14:31:42','2024-10-08 14:31:42'),(8,4,63,'pending','2024-10-08 14:31:42','2024-10-08 14:31:42'),(9,5,207,'pending','2024-10-08 14:31:42','2024-10-08 14:31:42'),(10,5,435,'completed','2024-10-08 14:31:42','2024-10-08 14:31:42');
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_reset_tokens`
--

DROP TABLE IF EXISTS `password_reset_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_reset_tokens`
--

LOCK TABLES `password_reset_tokens` WRITE;
/*!40000 ALTER TABLE `password_reset_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_reset_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personal_access_tokens`
--

DROP TABLE IF EXISTS `personal_access_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `personal_access_tokens` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personal_access_tokens`
--

LOCK TABLES `personal_access_tokens` WRITE;
/*!40000 ALTER TABLE `personal_access_tokens` DISABLE KEYS */;
INSERT INTO `personal_access_tokens` VALUES (1,'App\\Models\\User',51,'Sobirjon','511988f4d20680f4b081fa389a99d16d7fbce237f283dce733b980e02c2c8ee2','[\"*\"]','2024-10-08 15:39:17',NULL,'2024-10-08 14:49:10','2024-10-08 15:39:17');
/*!40000 ALTER TABLE `personal_access_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `price` decimal(10,2) NOT NULL,
  `category_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `products_category_id_foreign` (`category_id`),
  CONSTRAINT `products_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (1,'Phone','Super phone',1000.00,2,'2024-10-08 15:22:03','2024-10-08 15:22:03'),(2,'Laptop','Orange laptop',2000.00,1,'2024-10-08 15:31:16','2024-10-08 15:31:16');
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sessions`
--

DROP TABLE IF EXISTS `sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sessions` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint unsigned DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sessions_user_id_index` (`user_id`),
  KEY `sessions_last_activity_index` (`last_activity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sessions`
--

LOCK TABLES `sessions` WRITE;
/*!40000 ALTER TABLE `sessions` DISABLE KEYS */;
INSERT INTO `sessions` VALUES ('X1SM9lLFRChWTQ3JdLKQPKmvnoAoRhypYSBxcBqQ',NULL,'192.168.65.1','PostmanRuntime/7.42.0','YTozOntzOjY6Il90b2tlbiI7czo0MDoiVVdnYkhlcXdMUjRnb0I1Z3BNQUswbUhqcjNQc2Q2YVUyOEc4eTJMdSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly9sb2NhbGhvc3Q6OTAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1728398063);
/*!40000 ALTER TABLE `sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Dr. Freda Heidenreich','nboehm@example.net','2024-10-08 14:31:42','$2y$12$zG4IBjnEFeWpSc28u1zIfes5afAKjoYfNxbuxXwMdcODvm0Xdr3Mq','gMXWWPM796','2024-10-08 14:31:42','2024-10-08 14:31:42'),(2,'Monty Herzog','demarco.oconnell@example.org','2024-10-08 14:31:42','$2y$12$zG4IBjnEFeWpSc28u1zIfes5afAKjoYfNxbuxXwMdcODvm0Xdr3Mq','JLK9aU8pUA','2024-10-08 14:31:42','2024-10-08 14:31:42'),(3,'Lucious Berge','florida79@example.org','2024-10-08 14:31:42','$2y$12$zG4IBjnEFeWpSc28u1zIfes5afAKjoYfNxbuxXwMdcODvm0Xdr3Mq','DHsz6mMVhN','2024-10-08 14:31:42','2024-10-08 14:31:42'),(4,'Anne Gulgowski','ipouros@example.org','2024-10-08 14:31:42','$2y$12$zG4IBjnEFeWpSc28u1zIfes5afAKjoYfNxbuxXwMdcODvm0Xdr3Mq','lwbTYlz1OL','2024-10-08 14:31:42','2024-10-08 14:31:42'),(5,'Rodrigo Purdy','nico.greenholt@example.org','2024-10-08 14:31:42','$2y$12$zG4IBjnEFeWpSc28u1zIfes5afAKjoYfNxbuxXwMdcODvm0Xdr3Mq','471jzdgVZj','2024-10-08 14:31:42','2024-10-08 14:31:42'),(6,'Earlene Terry','stark.hilario@example.org','2024-10-08 14:31:42','$2y$12$zG4IBjnEFeWpSc28u1zIfes5afAKjoYfNxbuxXwMdcODvm0Xdr3Mq','By74WDvt8F','2024-10-08 14:31:42','2024-10-08 14:31:42'),(7,'Ubaldo Carter','mya.zulauf@example.com','2024-10-08 14:31:42','$2y$12$zG4IBjnEFeWpSc28u1zIfes5afAKjoYfNxbuxXwMdcODvm0Xdr3Mq','7ImRvO9jWW','2024-10-08 14:31:42','2024-10-08 14:31:42'),(8,'Zoey VonRueden','ernestine21@example.com','2024-10-08 14:31:42','$2y$12$zG4IBjnEFeWpSc28u1zIfes5afAKjoYfNxbuxXwMdcODvm0Xdr3Mq','JGAGVarPr5','2024-10-08 14:31:42','2024-10-08 14:31:42'),(9,'Gladys Bergstrom I','caesar.ryan@example.net','2024-10-08 14:31:42','$2y$12$zG4IBjnEFeWpSc28u1zIfes5afAKjoYfNxbuxXwMdcODvm0Xdr3Mq','5sga1HbL32','2024-10-08 14:31:42','2024-10-08 14:31:42'),(10,'Arlie Haag','xlockman@example.net','2024-10-08 14:31:42','$2y$12$zG4IBjnEFeWpSc28u1zIfes5afAKjoYfNxbuxXwMdcODvm0Xdr3Mq','bLEj6gAXd5','2024-10-08 14:31:42','2024-10-08 14:31:42'),(11,'Bette Casper','ewill@example.com','2024-10-08 14:31:42','$2y$12$zG4IBjnEFeWpSc28u1zIfes5afAKjoYfNxbuxXwMdcODvm0Xdr3Mq','qxFmKKfB9C','2024-10-08 14:31:42','2024-10-08 14:31:42'),(12,'Mr. Kristopher Walter','elsie57@example.com','2024-10-08 14:31:42','$2y$12$zG4IBjnEFeWpSc28u1zIfes5afAKjoYfNxbuxXwMdcODvm0Xdr3Mq','cKThNIMETN','2024-10-08 14:31:42','2024-10-08 14:31:42'),(13,'Isaias Windler','gbeahan@example.net','2024-10-08 14:31:42','$2y$12$zG4IBjnEFeWpSc28u1zIfes5afAKjoYfNxbuxXwMdcODvm0Xdr3Mq','kOx3cVVBt1','2024-10-08 14:31:42','2024-10-08 14:31:42'),(14,'Ms. Carmen Gorczany','royal.sawayn@example.net','2024-10-08 14:31:42','$2y$12$zG4IBjnEFeWpSc28u1zIfes5afAKjoYfNxbuxXwMdcODvm0Xdr3Mq','6nIvV5yiDS','2024-10-08 14:31:42','2024-10-08 14:31:42'),(15,'Mr. Fidel Ritchie','elza20@example.org','2024-10-08 14:31:42','$2y$12$zG4IBjnEFeWpSc28u1zIfes5afAKjoYfNxbuxXwMdcODvm0Xdr3Mq','9YcOgh8Uea','2024-10-08 14:31:42','2024-10-08 14:31:42'),(16,'Roxane Gerhold','skeebler@example.com','2024-10-08 14:31:42','$2y$12$zG4IBjnEFeWpSc28u1zIfes5afAKjoYfNxbuxXwMdcODvm0Xdr3Mq','mt41KhPKu3','2024-10-08 14:31:42','2024-10-08 14:31:42'),(17,'Shania Hickle','adolfo81@example.org','2024-10-08 14:31:42','$2y$12$zG4IBjnEFeWpSc28u1zIfes5afAKjoYfNxbuxXwMdcODvm0Xdr3Mq','Dzmvxa17bq','2024-10-08 14:31:42','2024-10-08 14:31:42'),(18,'Alisha Olson DDS','hintz.eloisa@example.org','2024-10-08 14:31:42','$2y$12$zG4IBjnEFeWpSc28u1zIfes5afAKjoYfNxbuxXwMdcODvm0Xdr3Mq','jDdWuGuw28','2024-10-08 14:31:42','2024-10-08 14:31:42'),(19,'Mr. Deontae Hill V','hassie61@example.com','2024-10-08 14:31:42','$2y$12$zG4IBjnEFeWpSc28u1zIfes5afAKjoYfNxbuxXwMdcODvm0Xdr3Mq','5jW0wQIqDI','2024-10-08 14:31:42','2024-10-08 14:31:42'),(20,'Avery Sporer','albina.oconnell@example.net','2024-10-08 14:31:42','$2y$12$zG4IBjnEFeWpSc28u1zIfes5afAKjoYfNxbuxXwMdcODvm0Xdr3Mq','s0dNJqcFfu','2024-10-08 14:31:42','2024-10-08 14:31:42'),(21,'Mark Fadel','rosenbaum.kaylie@example.net','2024-10-08 14:31:42','$2y$12$zG4IBjnEFeWpSc28u1zIfes5afAKjoYfNxbuxXwMdcODvm0Xdr3Mq','0teV208JqS','2024-10-08 14:31:42','2024-10-08 14:31:42'),(22,'Mrs. Julianne Runolfsson DVM','wiza.melisa@example.net','2024-10-08 14:31:42','$2y$12$zG4IBjnEFeWpSc28u1zIfes5afAKjoYfNxbuxXwMdcODvm0Xdr3Mq','2ktCgsSuQK','2024-10-08 14:31:42','2024-10-08 14:31:42'),(23,'Mrs. Roselyn Beer','karlee.toy@example.net','2024-10-08 14:31:42','$2y$12$zG4IBjnEFeWpSc28u1zIfes5afAKjoYfNxbuxXwMdcODvm0Xdr3Mq','c5n24PHPX3','2024-10-08 14:31:42','2024-10-08 14:31:42'),(24,'Precious Koelpin','maximillia.lueilwitz@example.org','2024-10-08 14:31:42','$2y$12$zG4IBjnEFeWpSc28u1zIfes5afAKjoYfNxbuxXwMdcODvm0Xdr3Mq','YyufwX6et5','2024-10-08 14:31:42','2024-10-08 14:31:42'),(25,'Aidan VonRueden I','estell71@example.com','2024-10-08 14:31:42','$2y$12$zG4IBjnEFeWpSc28u1zIfes5afAKjoYfNxbuxXwMdcODvm0Xdr3Mq','qpppjdWRFB','2024-10-08 14:31:42','2024-10-08 14:31:42'),(26,'Gaetano Dare','rogahn.haley@example.org','2024-10-08 14:31:42','$2y$12$zG4IBjnEFeWpSc28u1zIfes5afAKjoYfNxbuxXwMdcODvm0Xdr3Mq','0bP7lNyJvX','2024-10-08 14:31:42','2024-10-08 14:31:42'),(27,'Marjory Hagenes','ernser.margarita@example.net','2024-10-08 14:31:42','$2y$12$zG4IBjnEFeWpSc28u1zIfes5afAKjoYfNxbuxXwMdcODvm0Xdr3Mq','ytVOvQrOgW','2024-10-08 14:31:42','2024-10-08 14:31:42'),(28,'Jalen Jacobson IV','kohler.roselyn@example.org','2024-10-08 14:31:42','$2y$12$zG4IBjnEFeWpSc28u1zIfes5afAKjoYfNxbuxXwMdcODvm0Xdr3Mq','6bPJV394EU','2024-10-08 14:31:42','2024-10-08 14:31:42'),(29,'Michelle Dooley','acollier@example.com','2024-10-08 14:31:42','$2y$12$zG4IBjnEFeWpSc28u1zIfes5afAKjoYfNxbuxXwMdcODvm0Xdr3Mq','61zoNwUBxN','2024-10-08 14:31:42','2024-10-08 14:31:42'),(30,'Rylan O\'Conner','alittel@example.com','2024-10-08 14:31:42','$2y$12$zG4IBjnEFeWpSc28u1zIfes5afAKjoYfNxbuxXwMdcODvm0Xdr3Mq','GsJHLXOB3A','2024-10-08 14:31:42','2024-10-08 14:31:42'),(31,'Belle Gleichner V','rlockman@example.org','2024-10-08 14:31:42','$2y$12$zG4IBjnEFeWpSc28u1zIfes5afAKjoYfNxbuxXwMdcODvm0Xdr3Mq','mSXJ2D2fBZ','2024-10-08 14:31:42','2024-10-08 14:31:42'),(32,'Delta Runte IV','daphne63@example.com','2024-10-08 14:31:42','$2y$12$zG4IBjnEFeWpSc28u1zIfes5afAKjoYfNxbuxXwMdcODvm0Xdr3Mq','IIc75bQpss','2024-10-08 14:31:42','2024-10-08 14:31:42'),(33,'Dustin Keeling','howe.melyssa@example.com','2024-10-08 14:31:42','$2y$12$zG4IBjnEFeWpSc28u1zIfes5afAKjoYfNxbuxXwMdcODvm0Xdr3Mq','WXO2UeSgud','2024-10-08 14:31:42','2024-10-08 14:31:42'),(34,'Stevie Adams','margaretta46@example.org','2024-10-08 14:31:42','$2y$12$zG4IBjnEFeWpSc28u1zIfes5afAKjoYfNxbuxXwMdcODvm0Xdr3Mq','mvJ4uaiDwk','2024-10-08 14:31:42','2024-10-08 14:31:42'),(35,'Ms. Vanessa Blick MD','serena.champlin@example.net','2024-10-08 14:31:42','$2y$12$zG4IBjnEFeWpSc28u1zIfes5afAKjoYfNxbuxXwMdcODvm0Xdr3Mq','kLcU4JvQ4Q','2024-10-08 14:31:42','2024-10-08 14:31:42'),(36,'Prof. Margie Rutherford PhD','amraz@example.org','2024-10-08 14:31:42','$2y$12$zG4IBjnEFeWpSc28u1zIfes5afAKjoYfNxbuxXwMdcODvm0Xdr3Mq','nzEXIgtymN','2024-10-08 14:31:42','2024-10-08 14:31:42'),(37,'Jamie Wisoky','shaun.mayert@example.org','2024-10-08 14:31:42','$2y$12$zG4IBjnEFeWpSc28u1zIfes5afAKjoYfNxbuxXwMdcODvm0Xdr3Mq','ILHjxzN2NY','2024-10-08 14:31:42','2024-10-08 14:31:42'),(38,'Marilou Halvorson','trycia09@example.org','2024-10-08 14:31:42','$2y$12$zG4IBjnEFeWpSc28u1zIfes5afAKjoYfNxbuxXwMdcODvm0Xdr3Mq','3pohxqDVvH','2024-10-08 14:31:42','2024-10-08 14:31:42'),(39,'Velma Durgan','senger.gust@example.com','2024-10-08 14:31:42','$2y$12$zG4IBjnEFeWpSc28u1zIfes5afAKjoYfNxbuxXwMdcODvm0Xdr3Mq','pbzMy5kY11','2024-10-08 14:31:42','2024-10-08 14:31:42'),(40,'Luciano Conn','ndickinson@example.org','2024-10-08 14:31:42','$2y$12$zG4IBjnEFeWpSc28u1zIfes5afAKjoYfNxbuxXwMdcODvm0Xdr3Mq','B2BT3vD3g4','2024-10-08 14:31:42','2024-10-08 14:31:42'),(41,'Jacky Boyle','marks.willow@example.net','2024-10-08 14:31:42','$2y$12$zG4IBjnEFeWpSc28u1zIfes5afAKjoYfNxbuxXwMdcODvm0Xdr3Mq','5G00TyKIwy','2024-10-08 14:31:42','2024-10-08 14:31:42'),(42,'Katelyn Donnelly','ziemann.monserrate@example.net','2024-10-08 14:31:42','$2y$12$zG4IBjnEFeWpSc28u1zIfes5afAKjoYfNxbuxXwMdcODvm0Xdr3Mq','UtfHJl4o6E','2024-10-08 14:31:42','2024-10-08 14:31:42'),(43,'Emily Emmerich','ehansen@example.com','2024-10-08 14:31:42','$2y$12$zG4IBjnEFeWpSc28u1zIfes5afAKjoYfNxbuxXwMdcODvm0Xdr3Mq','1Ss3oACZer','2024-10-08 14:31:42','2024-10-08 14:31:42'),(44,'Thaddeus Schoen','clementina.bahringer@example.org','2024-10-08 14:31:42','$2y$12$zG4IBjnEFeWpSc28u1zIfes5afAKjoYfNxbuxXwMdcODvm0Xdr3Mq','qs8U6HvYSe','2024-10-08 14:31:42','2024-10-08 14:31:42'),(45,'Molly Flatley Sr.','kris90@example.net','2024-10-08 14:31:42','$2y$12$zG4IBjnEFeWpSc28u1zIfes5afAKjoYfNxbuxXwMdcODvm0Xdr3Mq','mYJBnUDU0W','2024-10-08 14:31:42','2024-10-08 14:31:42'),(46,'Andre Haag','heber.thompson@example.net','2024-10-08 14:31:42','$2y$12$zG4IBjnEFeWpSc28u1zIfes5afAKjoYfNxbuxXwMdcODvm0Xdr3Mq','Hz0bqZ0jdi','2024-10-08 14:31:42','2024-10-08 14:31:42'),(47,'Myrna Emmerich','mbraun@example.net','2024-10-08 14:31:42','$2y$12$zG4IBjnEFeWpSc28u1zIfes5afAKjoYfNxbuxXwMdcODvm0Xdr3Mq','nOp9uMdpDF','2024-10-08 14:31:42','2024-10-08 14:31:42'),(48,'Prof. Marina Herzog MD','abogisich@example.net','2024-10-08 14:31:42','$2y$12$zG4IBjnEFeWpSc28u1zIfes5afAKjoYfNxbuxXwMdcODvm0Xdr3Mq','6IMErWzTDx','2024-10-08 14:31:42','2024-10-08 14:31:42'),(49,'Damon Stark MD','lucile98@example.org','2024-10-08 14:31:42','$2y$12$zG4IBjnEFeWpSc28u1zIfes5afAKjoYfNxbuxXwMdcODvm0Xdr3Mq','HRZc6IHj2Z','2024-10-08 14:31:42','2024-10-08 14:31:42'),(50,'Jordane Labadie','zhane@example.net','2024-10-08 14:31:42','$2y$12$zG4IBjnEFeWpSc28u1zIfes5afAKjoYfNxbuxXwMdcODvm0Xdr3Mq','o5z6yY9u3j','2024-10-08 14:31:42','2024-10-08 14:31:42'),(51,'Sobirjon','sobirjon@mail.com',NULL,'$2y$12$mtN.JqQtS.1UVgQaaHQ3mOTDl/GFHglOQ8wOFOnfHd25SRStHLilC',NULL,'2024-10-08 14:49:10','2024-10-08 14:49:10');
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

-- Dump completed on 2024-10-08 16:01:09
