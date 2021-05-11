-- MySQL dump 10.13  Distrib 5.7.24, for Win64 (x86_64)
--
-- Host: localhost    Database: saunyaprod
-- ------------------------------------------------------
-- Server version	5.7.24

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
-- Table structure for table `addons`
--

DROP TABLE IF EXISTS `addons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `addons` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf32_unicode_ci DEFAULT NULL,
  `unique_identifier` varchar(255) COLLATE utf32_unicode_ci DEFAULT NULL,
  `version` varchar(255) COLLATE utf32_unicode_ci DEFAULT NULL,
  `activated` int(1) NOT NULL DEFAULT '1',
  `image` varchar(1000) COLLATE utf32_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf32 COLLATE=utf32_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `addons`
--

LOCK TABLES `addons` WRITE;
/*!40000 ALTER TABLE `addons` DISABLE KEYS */;
INSERT INTO `addons` VALUES (1,'affiliate','affiliate_system','1.5',1,'affiliate_banner.jpg','2021-04-23 15:09:20','2021-04-23 15:09:20'),(2,'club_point','club_point','1.2',1,'club_points.png','2021-04-23 15:09:54','2021-04-23 15:09:54'),(3,'Offline Payment','offline_payment','1.3',1,'offline_banner.jpg','2021-04-23 15:10:09','2021-04-23 15:10:09'),(4,'OTP','otp_system','1.4',1,'otp_system.jpg','2021-04-23 15:10:23','2021-04-23 15:10:23'),(5,'Point of Sale','pos_system','1.5',1,'pos_banner.jpg','2021-04-23 15:10:35','2021-04-23 15:10:35'),(6,'refund','refund_request','1.2',1,'refund_request.png','2021-04-23 15:11:09','2021-04-23 15:11:09'),(7,'Seller Subscription System','seller_subscription','1.0',1,'seller_subscription.jpg','2021-04-23 15:14:29','2021-04-23 15:14:29');
/*!40000 ALTER TABLE `addons` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `addresses`
--

DROP TABLE IF EXISTS `addresses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `addresses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `country` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `city` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `id_card` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `city_cost` int(20) DEFAULT NULL,
  `district_cost` int(20) DEFAULT NULL,
  `address` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `district` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `postal_code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `set_default` int(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `addresses`
--

LOCK TABLES `addresses` WRITE;
/*!40000 ALTER TABLE `addresses` DISABLE KEYS */;
/*!40000 ALTER TABLE `addresses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `affiliate_configs`
--

DROP TABLE IF EXISTS `affiliate_configs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `affiliate_configs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(1000) COLLATE utf32_unicode_ci DEFAULT NULL,
  `value` text COLLATE utf32_unicode_ci,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf32 COLLATE=utf32_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `affiliate_configs`
--

LOCK TABLES `affiliate_configs` WRITE;
/*!40000 ALTER TABLE `affiliate_configs` DISABLE KEYS */;
INSERT INTO `affiliate_configs` VALUES (1,'verification_form','[{\"type\":\"text\",\"label\":\"Your name\"},{\"type\":\"text\",\"label\":\"Email\"},{\"type\":\"text\",\"label\":\"Full Address\"},{\"type\":\"text\",\"label\":\"Phone Number\"},{\"type\":\"text\",\"label\":\"How will you affiliate?\"}]','2020-03-09 09:56:21','2020-03-09 04:30:59');
/*!40000 ALTER TABLE `affiliate_configs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `affiliate_logs`
--

DROP TABLE IF EXISTS `affiliate_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `affiliate_logs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `guest_id` int(11) DEFAULT NULL,
  `referred_by_user` int(11) NOT NULL,
  `amount` double(20,2) NOT NULL,
  `order_id` bigint(20) DEFAULT NULL,
  `order_detail_id` bigint(20) DEFAULT NULL,
  `affiliate_type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `affiliate_logs`
--

LOCK TABLES `affiliate_logs` WRITE;
/*!40000 ALTER TABLE `affiliate_logs` DISABLE KEYS */;
/*!40000 ALTER TABLE `affiliate_logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `affiliate_options`
--

DROP TABLE IF EXISTS `affiliate_options`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `affiliate_options` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(255) COLLATE utf32_unicode_ci DEFAULT NULL,
  `details` longtext COLLATE utf32_unicode_ci,
  `percentage` double NOT NULL DEFAULT '0',
  `status` int(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf32 COLLATE=utf32_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `affiliate_options`
--

LOCK TABLES `affiliate_options` WRITE;
/*!40000 ALTER TABLE `affiliate_options` DISABLE KEYS */;
INSERT INTO `affiliate_options` VALUES (2,'user_registration_first_purchase',NULL,20,1,'2020-03-03 05:08:37','2020-03-05 03:56:30'),(3,'product_sharing',NULL,20,0,'2020-03-08 01:55:03','2020-03-10 02:12:32'),(4,'category_wise_affiliate',NULL,0,0,'2020-03-08 01:55:03','2020-03-10 02:12:32');
/*!40000 ALTER TABLE `affiliate_options` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `affiliate_payments`
--

DROP TABLE IF EXISTS `affiliate_payments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `affiliate_payments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `affiliate_user_id` int(11) NOT NULL,
  `amount` double(8,2) NOT NULL,
  `payment_method` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `payment_details` longtext COLLATE utf8_unicode_ci,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `affiliate_payments`
--

LOCK TABLES `affiliate_payments` WRITE;
/*!40000 ALTER TABLE `affiliate_payments` DISABLE KEYS */;
INSERT INTO `affiliate_payments` VALUES (2,1,20.00,'Paypal',NULL,'2020-03-10 02:04:30','2020-03-10 02:04:30');
/*!40000 ALTER TABLE `affiliate_payments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `affiliate_users`
--

DROP TABLE IF EXISTS `affiliate_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `affiliate_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `paypal_email` varchar(255) COLLATE utf32_unicode_ci DEFAULT NULL,
  `bank_information` text COLLATE utf32_unicode_ci,
  `user_id` int(11) NOT NULL,
  `informations` text COLLATE utf32_unicode_ci,
  `balance` double(10,2) NOT NULL DEFAULT '0.00',
  `status` int(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf32 COLLATE=utf32_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `affiliate_users`
--

LOCK TABLES `affiliate_users` WRITE;
/*!40000 ALTER TABLE `affiliate_users` DISABLE KEYS */;
INSERT INTO `affiliate_users` VALUES (1,'demo@gmail.com','123456',8,'[{\"type\":\"text\",\"label\":\"Your name\",\"value\":\"Nostrum dicta sint l\"},{\"type\":\"text\",\"label\":\"Email\",\"value\":\"Aut perferendis null\"},{\"type\":\"text\",\"label\":\"Full Address\",\"value\":\"Voluptatem Sit dolo\"},{\"type\":\"text\",\"label\":\"Phone Number\",\"value\":\"Ut ad beatae occaeca\"},{\"type\":\"text\",\"label\":\"How will you affiliate?\",\"value\":\"Porro sint soluta u\"}]',30.00,1,'2020-03-09 05:35:07','2020-03-10 02:04:30');
/*!40000 ALTER TABLE `affiliate_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `affiliate_withdraw_requests`
--

DROP TABLE IF EXISTS `affiliate_withdraw_requests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `affiliate_withdraw_requests` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `amount` double(10,2) NOT NULL,
  `status` int(1) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `affiliate_withdraw_requests`
--

LOCK TABLES `affiliate_withdraw_requests` WRITE;
/*!40000 ALTER TABLE `affiliate_withdraw_requests` DISABLE KEYS */;
/*!40000 ALTER TABLE `affiliate_withdraw_requests` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app_settings`
--

DROP TABLE IF EXISTS `app_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `app_settings` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `logo` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `currency_id` int(11) DEFAULT NULL,
  `currency_format` char(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `facebook` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `twitter` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `instagram` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `youtube` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `google_plus` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_settings`
--

LOCK TABLES `app_settings` WRITE;
/*!40000 ALTER TABLE `app_settings` DISABLE KEYS */;
INSERT INTO `app_settings` VALUES (1,'Active eCommerce','uploads/logo/matggar.png',1,'symbol','https://facebook.com','https://twitter.com','https://instagram.com','https://youtube.com','https://google.com','2019-08-04 16:39:15','2019-08-04 16:39:18');
/*!40000 ALTER TABLE `app_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `attribute_translations`
--

DROP TABLE IF EXISTS `attribute_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `attribute_translations` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `attribute_id` bigint(20) NOT NULL,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `lang` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attribute_translations`
--

LOCK TABLES `attribute_translations` WRITE;
/*!40000 ALTER TABLE `attribute_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `attribute_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `attributes`
--

DROP TABLE IF EXISTS `attributes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `attributes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf32_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf32 COLLATE=utf32_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attributes`
--

LOCK TABLES `attributes` WRITE;
/*!40000 ALTER TABLE `attributes` DISABLE KEYS */;
INSERT INTO `attributes` VALUES (1,'Size','2020-02-24 05:55:07','2020-02-24 05:55:07'),(2,'Fabric','2020-02-24 05:55:13','2020-02-24 05:55:13');
/*!40000 ALTER TABLE `attributes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `banners`
--

DROP TABLE IF EXISTS `banners`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `banners` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `photo` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `url` varchar(1000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `position` int(11) NOT NULL DEFAULT '1',
  `published` int(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `banners`
--

LOCK TABLES `banners` WRITE;
/*!40000 ALTER TABLE `banners` DISABLE KEYS */;
INSERT INTO `banners` VALUES (4,'uploads/banners/banner.jpg','#',1,1,'2019-03-12 05:58:23','2019-06-11 04:56:50'),(5,'uploads/banners/banner.jpg','#',1,1,'2019-03-12 05:58:41','2019-03-12 05:58:57'),(6,'uploads/banners/banner.jpg','#',2,1,'2019-03-12 05:58:52','2019-03-12 05:58:57'),(7,'uploads/banners/banner.jpg','#',2,1,'2019-05-26 05:16:38','2019-05-26 05:17:34'),(8,'uploads/banners/banner.jpg','#',2,1,'2019-06-11 05:00:06','2019-06-11 05:00:27'),(9,'uploads/banners/banner.jpg','#',1,1,'2019-06-11 05:00:15','2019-06-11 05:00:29'),(10,'uploads/banners/banner.jpg','#',1,0,'2019-06-11 05:00:24','2019-06-11 05:01:56');
/*!40000 ALTER TABLE `banners` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blog_categories`
--

DROP TABLE IF EXISTS `blog_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blog_categories` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `category_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blog_categories`
--

LOCK TABLES `blog_categories` WRITE;
/*!40000 ALTER TABLE `blog_categories` DISABLE KEYS */;
/*!40000 ALTER TABLE `blog_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blogs`
--

DROP TABLE IF EXISTS `blogs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blogs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `category_id` int(11) NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `short_description` text COLLATE utf8mb4_unicode_ci,
  `description` longtext COLLATE utf8mb4_unicode_ci,
  `banner` int(11) DEFAULT NULL,
  `meta_title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_img` int(11) DEFAULT NULL,
  `meta_description` text COLLATE utf8mb4_unicode_ci,
  `meta_keywords` text COLLATE utf8mb4_unicode_ci,
  `status` int(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blogs`
--

LOCK TABLES `blogs` WRITE;
/*!40000 ALTER TABLE `blogs` DISABLE KEYS */;
/*!40000 ALTER TABLE `blogs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `booking_items`
--

DROP TABLE IF EXISTS `booking_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `booking_items` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `booking_id` int(10) unsigned NOT NULL,
  `product_id` int(10) unsigned NOT NULL,
  `quantity` tinyint(4) NOT NULL,
  `unit_price` double NOT NULL,
  `amount` double NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `booking_items`
--

LOCK TABLES `booking_items` WRITE;
/*!40000 ALTER TABLE `booking_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `booking_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `booking_times`
--

DROP TABLE IF EXISTS `booking_times`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `booking_times` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `day` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `start_time` time NOT NULL,
  `end_time` time NOT NULL,
  `multiple_booking` enum('yes','no') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'yes',
  `max_booking` int(11) NOT NULL DEFAULT '0',
  `status` enum('enabled','disabled') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'enabled',
  `slot_duration` int(11) NOT NULL DEFAULT '30',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `booking_times`
--

LOCK TABLES `booking_times` WRITE;
/*!40000 ALTER TABLE `booking_times` DISABLE KEYS */;
/*!40000 ALTER TABLE `booking_times` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `booking_user`
--

DROP TABLE IF EXISTS `booking_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `booking_user` (
  `booking_id` int(10) unsigned NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`booking_id`,`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `booking_user`
--

LOCK TABLES `booking_user` WRITE;
/*!40000 ALTER TABLE `booking_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `booking_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bookings`
--

DROP TABLE IF EXISTS `bookings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bookings` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `deal_id` int(10) unsigned DEFAULT NULL,
  `deal_quantity` double DEFAULT NULL,
  `coupon_id` bigint(20) unsigned DEFAULT NULL,
  `user_id` int(10) unsigned DEFAULT NULL,
  `date_time` datetime NOT NULL,
  `status` enum('pending','approved','in progress','completed','canceled') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'pending',
  `payment_gateway` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `original_amount` double(8,2) NOT NULL,
  `discount` double(8,2) NOT NULL,
  `coupon_discount` double DEFAULT NULL,
  `discount_percent` double NOT NULL,
  `tax_name` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tax_percent` double(8,2) DEFAULT NULL,
  `tax_amount` double(8,2) DEFAULT NULL,
  `amount_to_pay` double(8,2) NOT NULL,
  `payment_status` enum('pending','completed') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'pending',
  `source` varchar(191) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'pos',
  `additional_notes` text COLLATE utf8_unicode_ci,
  `shop_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bookings`
--

LOCK TABLES `bookings` WRITE;
/*!40000 ALTER TABLE `bookings` DISABLE KEYS */;
/*!40000 ALTER TABLE `bookings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `brand_translations`
--

DROP TABLE IF EXISTS `brand_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `brand_translations` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `brand_id` bigint(20) NOT NULL,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `lang` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `brand_translations`
--

LOCK TABLES `brand_translations` WRITE;
/*!40000 ALTER TABLE `brand_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `brand_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `brands`
--

DROP TABLE IF EXISTS `brands`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `brands` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `logo` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `top` int(1) NOT NULL DEFAULT '0',
  `slug` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `meta_title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `meta_description` text COLLATE utf8_unicode_ci,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `brands`
--

LOCK TABLES `brands` WRITE;
/*!40000 ALTER TABLE `brands` DISABLE KEYS */;
INSERT INTO `brands` VALUES (1,'Demo brand','uploads/brands/brand.jpg',1,'Demo-brand-12','Demo brand',NULL,'2019-03-12 06:05:56','2019-08-06 06:52:40'),(2,'Demo brand1','uploads/brands/brand.jpg',1,'Demo-brand1','Demo brand1',NULL,'2019-03-12 06:06:13','2019-08-06 06:07:26');
/*!40000 ALTER TABLE `brands` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `business_settings`
--

DROP TABLE IF EXISTS `business_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `business_settings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `value` longtext COLLATE utf8_unicode_ci,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=117 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `business_settings`
--

LOCK TABLES `business_settings` WRITE;
/*!40000 ALTER TABLE `business_settings` DISABLE KEYS */;
INSERT INTO `business_settings` VALUES (1,'home_default_currency','1','2018-10-16 01:35:52','2019-01-28 01:26:53'),(2,'system_default_currency','1','2018-10-16 01:36:58','2020-01-26 04:22:13'),(3,'currency_format','1','2018-10-17 03:01:59','2018-10-17 03:01:59'),(4,'symbol_format','1','2018-10-17 03:01:59','2019-01-20 02:10:55'),(5,'no_of_decimals','3','2018-10-17 03:01:59','2020-03-04 00:57:16'),(6,'product_activation','1','2018-10-28 01:38:37','2019-02-04 01:11:41'),(7,'vendor_system_activation','1','2018-10-28 07:44:16','2019-02-04 01:11:38'),(8,'show_vendors','1','2018-10-28 07:44:47','2019-02-04 01:11:13'),(9,'paypal_payment','0','2018-10-28 07:45:16','2019-01-31 05:09:10'),(10,'stripe_payment','0','2018-10-28 07:45:47','2018-11-14 01:51:51'),(11,'cash_payment','1','2018-10-28 07:46:05','2019-01-24 03:40:18'),(12,'payumoney_payment','0','2018-10-28 07:46:27','2019-03-05 05:41:36'),(13,'best_selling','1','2018-12-24 08:13:44','2019-02-14 05:29:13'),(14,'paypal_sandbox','0','2019-01-16 12:44:18','2019-01-16 12:44:18'),(15,'sslcommerz_sandbox','1','2019-01-16 12:44:18','2019-03-14 00:07:26'),(16,'sslcommerz_payment','0','2019-01-24 09:39:07','2019-01-29 06:13:46'),(17,'vendor_commission','20','2019-01-31 06:18:04','2019-04-13 06:49:26'),(18,'verification_form','[{\"type\":\"text\",\"label\":\"Your name\"},{\"type\":\"text\",\"label\":\"Shop name\"},{\"type\":\"text\",\"label\":\"Email\"},{\"type\":\"text\",\"label\":\"License No\"},{\"type\":\"text\",\"label\":\"Full Address\"},{\"type\":\"text\",\"label\":\"Phone Number\"},{\"type\":\"file\",\"label\":\"Tax Papers\"}]','2019-02-03 11:36:58','2019-02-16 06:14:42'),(19,'google_analytics','0','2019-02-06 12:22:35','2019-02-06 12:22:35'),(20,'facebook_login','0','2019-02-07 12:51:59','2019-02-08 19:41:15'),(21,'google_login','0','2019-02-07 12:52:10','2019-02-08 19:41:14'),(22,'twitter_login','0','2019-02-07 12:52:20','2019-02-08 02:32:56'),(23,'payumoney_payment','1','2019-03-05 11:38:17','2019-03-05 11:38:17'),(24,'payumoney_sandbox','1','2019-03-05 11:38:17','2019-03-05 05:39:18'),(36,'facebook_chat','0','2019-04-15 11:45:04','2019-04-15 11:45:04'),(37,'email_verification','0','2019-04-30 07:30:07','2019-04-30 07:30:07'),(38,'wallet_system','0','2019-05-19 08:05:44','2019-05-19 02:11:57'),(39,'coupon_system','0','2019-06-11 09:46:18','2019-06-11 09:46:18'),(40,'current_version','4.4','2019-06-11 09:46:18','2019-06-11 09:46:18'),(41,'instamojo_payment','0','2019-07-06 09:58:03','2019-07-06 09:58:03'),(42,'instamojo_sandbox','1','2019-07-06 09:58:43','2019-07-06 09:58:43'),(43,'razorpay','0','2019-07-06 09:58:43','2019-07-06 09:58:43'),(44,'paystack','0','2019-07-21 13:00:38','2019-07-21 13:00:38'),(45,'pickup_point','0','2019-10-17 11:50:39','2019-10-17 11:50:39'),(46,'maintenance_mode','0','2019-10-17 11:51:04','2019-10-17 11:51:04'),(47,'voguepay','0','2019-10-17 11:51:24','2019-10-17 11:51:24'),(48,'voguepay_sandbox','0','2019-10-17 11:51:38','2019-10-17 11:51:38'),(50,'category_wise_commission','0','2020-01-21 07:22:47','2020-01-21 07:22:47'),(51,'conversation_system','1','2020-01-21 07:23:21','2020-01-21 07:23:21'),(52,'guest_checkout_active','1','2020-01-22 07:36:38','2020-01-22 07:36:38'),(53,'facebook_pixel','0','2020-01-22 11:43:58','2020-01-22 11:43:58'),(55,'classified_product','0','2020-05-13 13:01:05','2020-05-13 13:01:05'),(56,'pos_activation_for_seller','1','2020-06-11 09:45:02','2020-06-11 09:45:02'),(57,'shipping_type','product_wise_shipping','2020-07-01 13:49:56','2020-07-01 13:49:56'),(58,'flat_rate_shipping_cost','0','2020-07-01 13:49:56','2020-07-01 13:49:56'),(59,'shipping_cost_admin','0','2020-07-01 13:49:56','2020-07-01 13:49:56'),(60,'payhere_sandbox','0','2020-07-30 18:23:53','2020-07-30 18:23:53'),(61,'payhere','0','2020-07-30 18:23:53','2020-07-30 18:23:53'),(62,'google_recaptcha','0','2020-08-17 07:13:37','2020-08-17 07:13:37'),(63,'ngenius','0','2020-09-22 10:58:21','2020-09-22 10:58:21'),(64,'header_logo','1','2020-11-16 07:26:36','2021-04-23 13:28:24'),(65,'show_language_switcher','on','2020-11-16 07:26:36','2020-11-16 07:26:36'),(66,'show_currency_switcher','on','2020-11-16 07:26:36','2020-11-16 07:26:36'),(67,'header_stikcy','on','2020-11-16 07:26:36','2020-11-16 07:26:36'),(68,'footer_logo',NULL,'2020-11-16 07:26:36','2020-11-16 07:26:36'),(69,'about_us_description',NULL,'2020-11-16 07:26:36','2020-11-16 07:26:36'),(70,'contact_address',NULL,'2020-11-16 07:26:36','2020-11-16 07:26:36'),(71,'contact_phone',NULL,'2020-11-16 07:26:36','2020-11-16 07:26:36'),(72,'contact_email',NULL,'2020-11-16 07:26:36','2020-11-16 07:26:36'),(73,'widget_one_labels',NULL,'2020-11-16 07:26:36','2020-11-16 07:26:36'),(74,'widget_one_links',NULL,'2020-11-16 07:26:36','2020-11-16 07:26:36'),(75,'widget_one',NULL,'2020-11-16 07:26:36','2020-11-16 07:26:36'),(76,'frontend_copyright_text',NULL,'2020-11-16 07:26:36','2020-11-16 07:26:36'),(77,'show_social_links',NULL,'2020-11-16 07:26:36','2020-11-16 07:26:36'),(78,'facebook_link',NULL,'2020-11-16 07:26:36','2020-11-16 07:26:36'),(79,'twitter_link',NULL,'2020-11-16 07:26:36','2020-11-16 07:26:36'),(80,'instagram_link',NULL,'2020-11-16 07:26:36','2020-11-16 07:26:36'),(81,'youtube_link',NULL,'2020-11-16 07:26:36','2020-11-16 07:26:36'),(82,'linkedin_link',NULL,'2020-11-16 07:26:36','2020-11-16 07:26:36'),(83,'payment_method_images','3,2','2020-11-16 07:26:36','2021-04-23 13:34:51'),(84,'home_slider_images','[]','2020-11-16 07:26:36','2020-11-16 07:26:36'),(85,'home_slider_links','[]','2020-11-16 07:26:36','2020-11-16 07:26:36'),(86,'home_banner1_images','[]','2020-11-16 07:26:36','2020-11-16 07:26:36'),(87,'home_banner1_links','[]','2020-11-16 07:26:36','2020-11-16 07:26:36'),(88,'home_banner2_images','[]','2020-11-16 07:26:36','2020-11-16 07:26:36'),(89,'home_banner2_links','[]','2020-11-16 07:26:36','2020-11-16 07:26:36'),(90,'home_categories','[]','2020-11-16 07:26:36','2020-11-16 07:26:36'),(91,'top10_categories','[]','2020-11-16 07:26:36','2020-11-16 07:26:36'),(92,'top10_brands','[]','2020-11-16 07:26:36','2020-11-16 07:26:36'),(93,'website_name','Saunya Cosmetics','2020-11-16 07:26:36','2021-04-23 13:30:48'),(94,'site_motto','Be Natural','2020-11-16 07:26:36','2021-04-23 13:30:48'),(95,'site_icon','1','2020-11-16 07:26:36','2021-04-23 13:30:48'),(96,'base_color','#0E712A','2020-11-16 07:26:36','2021-04-23 13:30:48'),(97,'base_hov_color','#0E712A','2020-11-16 07:26:36','2021-04-23 13:30:48'),(98,'meta_title',NULL,'2020-11-16 07:26:36','2020-11-16 07:26:36'),(99,'meta_description',NULL,'2020-11-16 07:26:36','2020-11-16 07:26:36'),(100,'meta_keywords',NULL,'2020-11-16 07:26:36','2020-11-16 07:26:36'),(101,'meta_image',NULL,'2020-11-16 07:26:36','2020-11-16 07:26:36'),(102,'site_name',NULL,'2020-11-16 07:26:36','2020-11-16 07:26:36'),(103,'system_logo_white',NULL,'2020-11-16 07:26:36','2020-11-16 07:26:36'),(104,'system_logo_black',NULL,'2020-11-16 07:26:36','2020-11-16 07:26:36'),(105,'timezone',NULL,'2020-11-16 07:26:36','2020-11-16 07:26:36'),(106,'admin_login_background',NULL,'2020-11-16 07:26:36','2020-11-16 07:26:36'),(107,'iyzico_sandbox','1','2020-12-30 16:45:56','2020-12-30 16:45:56'),(108,'iyzico','1','2020-12-30 16:45:56','2020-12-30 16:45:56'),(109,'decimal_separator','1','2020-12-30 16:45:56','2020-12-30 16:45:56'),(110,'nagad','0','2021-01-22 10:30:03','2021-01-22 10:30:03'),(111,'bkash','0','2021-01-22 10:30:03','2021-01-22 10:30:03'),(112,'bkash_sandbox','1','2021-01-22 10:30:03','2021-01-22 10:30:03'),(113,'header_menu_labels','[\"Home\",\"Flash Sale\",\"Blogs\",\"All Brands\",\"All Categories\"]','2021-02-16 02:43:11','2021-02-16 02:52:18'),(114,'header_menu_links','[\"http:\\/\\/domain.com\",\"http:\\/\\/domain.com\\/flash-deals\",\"http:\\/\\/domain.com\\/blog\",\"http:\\/\\/domain.com\\/brands\",\"http:\\/\\/domain.com\\/categories\"]','2021-02-16 02:43:11','2021-02-18 01:20:04'),(115,'club_point_convert_rate','10','2019-03-12 05:58:23','2019-03-12 05:58:23'),(116,'refund_request_time','3','2019-03-12 04:58:23','2019-03-12 04:58:23');
/*!40000 ALTER TABLE `business_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `carts`
--

DROP TABLE IF EXISTS `carts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `carts` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `owner_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `address_id` int(11) NOT NULL DEFAULT '0',
  `product_id` int(11) DEFAULT NULL,
  `variation` text COLLATE utf8_unicode_ci,
  `price` double(8,2) DEFAULT '0.00',
  `tax` double(8,2) DEFAULT '0.00',
  `shipping_cost` double(8,2) DEFAULT '0.00',
  `discount` double(10,2) NOT NULL DEFAULT '0.00',
  `coupon_code` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `coupon_applied` tinyint(4) NOT NULL DEFAULT '0',
  `quantity` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) DEFAULT '0',
  `level` int(11) NOT NULL DEFAULT '0',
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `order_level` int(11) NOT NULL DEFAULT '0',
  `commision_rate` double(8,2) NOT NULL DEFAULT '0.00',
  `banner` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `icon` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `featured` int(1) NOT NULL DEFAULT '0',
  `is_service` tinyint(1) NOT NULL DEFAULT '0',
  `top` int(1) NOT NULL DEFAULT '0',
  `digital` int(1) NOT NULL DEFAULT '0',
  `slug` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `meta_title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `meta_description` text COLLATE utf8_unicode_ci,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `slug` (`slug`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category_translations`
--

DROP TABLE IF EXISTS `category_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `category_translations` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `category_id` bigint(20) NOT NULL,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `lang` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category_translations`
--

LOCK TABLES `category_translations` WRITE;
/*!40000 ALTER TABLE `category_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `category_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cities`
--

DROP TABLE IF EXISTS `cities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cities` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `country_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `has_district` tinyint(1) NOT NULL DEFAULT '0',
  `cost` double(20,2) NOT NULL DEFAULT '0.00',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cities`
--

LOCK TABLES `cities` WRITE;
/*!40000 ALTER TABLE `cities` DISABLE KEYS */;
INSERT INTO `cities` VALUES (1,37,'Douala',1,0.00,'2021-04-23 15:13:11','2021-04-23 15:22:47');
/*!40000 ALTER TABLE `cities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `city_translations`
--

DROP TABLE IF EXISTS `city_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `city_translations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `city_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `lang` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `city_translations`
--

LOCK TABLES `city_translations` WRITE;
/*!40000 ALTER TABLE `city_translations` DISABLE KEYS */;
INSERT INTO `city_translations` VALUES (1,1,'Douala','en','2021-04-23 15:22:47','2021-04-23 15:22:47');
/*!40000 ALTER TABLE `city_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `club_point_details`
--

DROP TABLE IF EXISTS `club_point_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `club_point_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `club_point_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `product_qty` int(11) NOT NULL,
  `point` double(8,2) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `club_point_details`
--

LOCK TABLES `club_point_details` WRITE;
/*!40000 ALTER TABLE `club_point_details` DISABLE KEYS */;
/*!40000 ALTER TABLE `club_point_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `club_points`
--

DROP TABLE IF EXISTS `club_points`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `club_points` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `points` double(18,2) NOT NULL,
  `convert_status` int(1) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `club_points`
--

LOCK TABLES `club_points` WRITE;
/*!40000 ALTER TABLE `club_points` DISABLE KEYS */;
/*!40000 ALTER TABLE `club_points` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `colors`
--

DROP TABLE IF EXISTS `colors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `colors` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `code` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=144 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `colors`
--

LOCK TABLES `colors` WRITE;
/*!40000 ALTER TABLE `colors` DISABLE KEYS */;
INSERT INTO `colors` VALUES (1,'IndianRed','#CD5C5C','2018-11-05 02:12:26','2018-11-05 02:12:26'),(2,'LightCoral','#F08080','2018-11-05 02:12:26','2018-11-05 02:12:26'),(3,'Salmon','#FA8072','2018-11-05 02:12:26','2018-11-05 02:12:26'),(4,'DarkSalmon','#E9967A','2018-11-05 02:12:26','2018-11-05 02:12:26'),(5,'LightSalmon','#FFA07A','2018-11-05 02:12:26','2018-11-05 02:12:26'),(6,'Crimson','#DC143C','2018-11-05 02:12:26','2018-11-05 02:12:26'),(7,'Red','#FF0000','2018-11-05 02:12:26','2018-11-05 02:12:26'),(8,'FireBrick','#B22222','2018-11-05 02:12:26','2018-11-05 02:12:26'),(9,'DarkRed','#8B0000','2018-11-05 02:12:26','2018-11-05 02:12:26'),(10,'Pink','#FFC0CB','2018-11-05 02:12:26','2018-11-05 02:12:26'),(11,'LightPink','#FFB6C1','2018-11-05 02:12:26','2018-11-05 02:12:26'),(12,'HotPink','#FF69B4','2018-11-05 02:12:26','2018-11-05 02:12:26'),(13,'DeepPink','#FF1493','2018-11-05 02:12:26','2018-11-05 02:12:26'),(14,'MediumVioletRed','#C71585','2018-11-05 02:12:26','2018-11-05 02:12:26'),(15,'PaleVioletRed','#DB7093','2018-11-05 02:12:26','2018-11-05 02:12:26'),(16,'LightSalmon','#FFA07A','2018-11-05 02:12:26','2018-11-05 02:12:26'),(17,'Coral','#FF7F50','2018-11-05 02:12:26','2018-11-05 02:12:26'),(18,'Tomato','#FF6347','2018-11-05 02:12:26','2018-11-05 02:12:26'),(19,'OrangeRed','#FF4500','2018-11-05 02:12:26','2018-11-05 02:12:26'),(20,'DarkOrange','#FF8C00','2018-11-05 02:12:26','2018-11-05 02:12:26'),(21,'Orange','#FFA500','2018-11-05 02:12:26','2018-11-05 02:12:26'),(22,'Gold','#FFD700','2018-11-05 02:12:26','2018-11-05 02:12:26'),(23,'Yellow','#FFFF00','2018-11-05 02:12:26','2018-11-05 02:12:26'),(24,'LightYellow','#FFFFE0','2018-11-05 02:12:26','2018-11-05 02:12:26'),(25,'LemonChiffon','#FFFACD','2018-11-05 02:12:26','2018-11-05 02:12:26'),(26,'LightGoldenrodYellow','#FAFAD2','2018-11-05 02:12:27','2018-11-05 02:12:27'),(27,'PapayaWhip','#FFEFD5','2018-11-05 02:12:27','2018-11-05 02:12:27'),(28,'Moccasin','#FFE4B5','2018-11-05 02:12:27','2018-11-05 02:12:27'),(29,'PeachPuff','#FFDAB9','2018-11-05 02:12:27','2018-11-05 02:12:27'),(30,'PaleGoldenrod','#EEE8AA','2018-11-05 02:12:27','2018-11-05 02:12:27'),(31,'Khaki','#F0E68C','2018-11-05 02:12:27','2018-11-05 02:12:27'),(32,'DarkKhaki','#BDB76B','2018-11-05 02:12:27','2018-11-05 02:12:27'),(33,'Lavender','#E6E6FA','2018-11-05 02:12:27','2018-11-05 02:12:27'),(34,'Thistle','#D8BFD8','2018-11-05 02:12:27','2018-11-05 02:12:27'),(35,'Plum','#DDA0DD','2018-11-05 02:12:27','2018-11-05 02:12:27'),(36,'Violet','#EE82EE','2018-11-05 02:12:27','2018-11-05 02:12:27'),(37,'Orchid','#DA70D6','2018-11-05 02:12:27','2018-11-05 02:12:27'),(38,'Fuchsia','#FF00FF','2018-11-05 02:12:27','2018-11-05 02:12:27'),(39,'Magenta','#FF00FF','2018-11-05 02:12:27','2018-11-05 02:12:27'),(40,'MediumOrchid','#BA55D3','2018-11-05 02:12:27','2018-11-05 02:12:27'),(41,'MediumPurple','#9370DB','2018-11-05 02:12:27','2018-11-05 02:12:27'),(42,'Amethyst','#9966CC','2018-11-05 02:12:27','2018-11-05 02:12:27'),(43,'BlueViolet','#8A2BE2','2018-11-05 02:12:27','2018-11-05 02:12:27'),(44,'DarkViolet','#9400D3','2018-11-05 02:12:27','2018-11-05 02:12:27'),(45,'DarkOrchid','#9932CC','2018-11-05 02:12:27','2018-11-05 02:12:27'),(46,'DarkMagenta','#8B008B','2018-11-05 02:12:27','2018-11-05 02:12:27'),(47,'Purple','#800080','2018-11-05 02:12:27','2018-11-05 02:12:27'),(48,'Indigo','#4B0082','2018-11-05 02:12:27','2018-11-05 02:12:27'),(49,'SlateBlue','#6A5ACD','2018-11-05 02:12:27','2018-11-05 02:12:27'),(50,'DarkSlateBlue','#483D8B','2018-11-05 02:12:27','2018-11-05 02:12:27'),(51,'MediumSlateBlue','#7B68EE','2018-11-05 02:12:27','2018-11-05 02:12:27'),(52,'GreenYellow','#ADFF2F','2018-11-05 02:12:27','2018-11-05 02:12:27'),(53,'Chartreuse','#7FFF00','2018-11-05 02:12:27','2018-11-05 02:12:27'),(54,'LawnGreen','#7CFC00','2018-11-05 02:12:27','2018-11-05 02:12:27'),(55,'Lime','#00FF00','2018-11-05 02:12:27','2018-11-05 02:12:27'),(56,'LimeGreen','#32CD32','2018-11-05 02:12:27','2018-11-05 02:12:27'),(57,'PaleGreen','#98FB98','2018-11-05 02:12:27','2018-11-05 02:12:27'),(58,'LightGreen','#90EE90','2018-11-05 02:12:27','2018-11-05 02:12:27'),(59,'MediumSpringGreen','#00FA9A','2018-11-05 02:12:27','2018-11-05 02:12:27'),(60,'SpringGreen','#00FF7F','2018-11-05 02:12:27','2018-11-05 02:12:27'),(61,'MediumSeaGreen','#3CB371','2018-11-05 02:12:27','2018-11-05 02:12:27'),(62,'SeaGreen','#2E8B57','2018-11-05 02:12:27','2018-11-05 02:12:27'),(63,'ForestGreen','#228B22','2018-11-05 02:12:28','2018-11-05 02:12:28'),(64,'Green','#008000','2018-11-05 02:12:28','2018-11-05 02:12:28'),(65,'DarkGreen','#006400','2018-11-05 02:12:28','2018-11-05 02:12:28'),(66,'YellowGreen','#9ACD32','2018-11-05 02:12:28','2018-11-05 02:12:28'),(67,'OliveDrab','#6B8E23','2018-11-05 02:12:28','2018-11-05 02:12:28'),(68,'Olive','#808000','2018-11-05 02:12:28','2018-11-05 02:12:28'),(69,'DarkOliveGreen','#556B2F','2018-11-05 02:12:28','2018-11-05 02:12:28'),(70,'MediumAquamarine','#66CDAA','2018-11-05 02:12:28','2018-11-05 02:12:28'),(71,'DarkSeaGreen','#8FBC8F','2018-11-05 02:12:28','2018-11-05 02:12:28'),(72,'LightSeaGreen','#20B2AA','2018-11-05 02:12:28','2018-11-05 02:12:28'),(73,'DarkCyan','#008B8B','2018-11-05 02:12:28','2018-11-05 02:12:28'),(74,'Teal','#008080','2018-11-05 02:12:28','2018-11-05 02:12:28'),(75,'Aqua','#00FFFF','2018-11-05 02:12:28','2018-11-05 02:12:28'),(76,'Cyan','#00FFFF','2018-11-05 02:12:28','2018-11-05 02:12:28'),(77,'LightCyan','#E0FFFF','2018-11-05 02:12:28','2018-11-05 02:12:28'),(78,'PaleTurquoise','#AFEEEE','2018-11-05 02:12:28','2018-11-05 02:12:28'),(79,'Aquamarine','#7FFFD4','2018-11-05 02:12:28','2018-11-05 02:12:28'),(80,'Turquoise','#40E0D0','2018-11-05 02:12:28','2018-11-05 02:12:28'),(81,'MediumTurquoise','#48D1CC','2018-11-05 02:12:28','2018-11-05 02:12:28'),(82,'DarkTurquoise','#00CED1','2018-11-05 02:12:28','2018-11-05 02:12:28'),(83,'CadetBlue','#5F9EA0','2018-11-05 02:12:28','2018-11-05 02:12:28'),(84,'SteelBlue','#4682B4','2018-11-05 02:12:28','2018-11-05 02:12:28'),(85,'LightSteelBlue','#B0C4DE','2018-11-05 02:12:28','2018-11-05 02:12:28'),(86,'PowderBlue','#B0E0E6','2018-11-05 02:12:28','2018-11-05 02:12:28'),(87,'LightBlue','#ADD8E6','2018-11-05 02:12:28','2018-11-05 02:12:28'),(88,'SkyBlue','#87CEEB','2018-11-05 02:12:28','2018-11-05 02:12:28'),(89,'LightSkyBlue','#87CEFA','2018-11-05 02:12:28','2018-11-05 02:12:28'),(90,'DeepSkyBlue','#00BFFF','2018-11-05 02:12:28','2018-11-05 02:12:28'),(91,'DodgerBlue','#1E90FF','2018-11-05 02:12:28','2018-11-05 02:12:28'),(92,'CornflowerBlue','#6495ED','2018-11-05 02:12:28','2018-11-05 02:12:28'),(93,'MediumSlateBlue','#7B68EE','2018-11-05 02:12:28','2018-11-05 02:12:28'),(94,'RoyalBlue','#4169E1','2018-11-05 02:12:28','2018-11-05 02:12:28'),(95,'Blue','#0000FF','2018-11-05 02:12:28','2018-11-05 02:12:28'),(96,'MediumBlue','#0000CD','2018-11-05 02:12:28','2018-11-05 02:12:28'),(97,'DarkBlue','#00008B','2018-11-05 02:12:28','2018-11-05 02:12:28'),(98,'Navy','#000080','2018-11-05 02:12:28','2018-11-05 02:12:28'),(99,'MidnightBlue','#191970','2018-11-05 02:12:29','2018-11-05 02:12:29'),(100,'Cornsilk','#FFF8DC','2018-11-05 02:12:29','2018-11-05 02:12:29'),(101,'BlanchedAlmond','#FFEBCD','2018-11-05 02:12:29','2018-11-05 02:12:29'),(102,'Bisque','#FFE4C4','2018-11-05 02:12:29','2018-11-05 02:12:29'),(103,'NavajoWhite','#FFDEAD','2018-11-05 02:12:29','2018-11-05 02:12:29'),(104,'Wheat','#F5DEB3','2018-11-05 02:12:29','2018-11-05 02:12:29'),(105,'BurlyWood','#DEB887','2018-11-05 02:12:29','2018-11-05 02:12:29'),(106,'Tan','#D2B48C','2018-11-05 02:12:29','2018-11-05 02:12:29'),(107,'RosyBrown','#BC8F8F','2018-11-05 02:12:29','2018-11-05 02:12:29'),(108,'SandyBrown','#F4A460','2018-11-05 02:12:29','2018-11-05 02:12:29'),(109,'Goldenrod','#DAA520','2018-11-05 02:12:29','2018-11-05 02:12:29'),(110,'DarkGoldenrod','#B8860B','2018-11-05 02:12:29','2018-11-05 02:12:29'),(111,'Peru','#CD853F','2018-11-05 02:12:29','2018-11-05 02:12:29'),(112,'Chocolate','#D2691E','2018-11-05 02:12:29','2018-11-05 02:12:29'),(113,'SaddleBrown','#8B4513','2018-11-05 02:12:29','2018-11-05 02:12:29'),(114,'Sienna','#A0522D','2018-11-05 02:12:29','2018-11-05 02:12:29'),(115,'Brown','#A52A2A','2018-11-05 02:12:29','2018-11-05 02:12:29'),(116,'Maroon','#800000','2018-11-05 02:12:29','2018-11-05 02:12:29'),(117,'White','#FFFFFF','2018-11-05 02:12:29','2018-11-05 02:12:29'),(118,'Snow','#FFFAFA','2018-11-05 02:12:29','2018-11-05 02:12:29'),(119,'Honeydew','#F0FFF0','2018-11-05 02:12:29','2018-11-05 02:12:29'),(120,'MintCream','#F5FFFA','2018-11-05 02:12:29','2018-11-05 02:12:29'),(121,'Azure','#F0FFFF','2018-11-05 02:12:29','2018-11-05 02:12:29'),(122,'AliceBlue','#F0F8FF','2018-11-05 02:12:29','2018-11-05 02:12:29'),(123,'GhostWhite','#F8F8FF','2018-11-05 02:12:29','2018-11-05 02:12:29'),(124,'WhiteSmoke','#F5F5F5','2018-11-05 02:12:29','2018-11-05 02:12:29'),(125,'Seashell','#FFF5EE','2018-11-05 02:12:29','2018-11-05 02:12:29'),(126,'Beige','#F5F5DC','2018-11-05 02:12:29','2018-11-05 02:12:29'),(127,'OldLace','#FDF5E6','2018-11-05 02:12:29','2018-11-05 02:12:29'),(128,'FloralWhite','#FFFAF0','2018-11-05 02:12:29','2018-11-05 02:12:29'),(129,'Ivory','#FFFFF0','2018-11-05 02:12:30','2018-11-05 02:12:30'),(130,'AntiqueWhite','#FAEBD7','2018-11-05 02:12:30','2018-11-05 02:12:30'),(131,'Linen','#FAF0E6','2018-11-05 02:12:30','2018-11-05 02:12:30'),(132,'LavenderBlush','#FFF0F5','2018-11-05 02:12:30','2018-11-05 02:12:30'),(133,'MistyRose','#FFE4E1','2018-11-05 02:12:30','2018-11-05 02:12:30'),(134,'Gainsboro','#DCDCDC','2018-11-05 02:12:30','2018-11-05 02:12:30'),(135,'LightGrey','#D3D3D3','2018-11-05 02:12:30','2018-11-05 02:12:30'),(136,'Silver','#C0C0C0','2018-11-05 02:12:30','2018-11-05 02:12:30'),(137,'DarkGray','#A9A9A9','2018-11-05 02:12:30','2018-11-05 02:12:30'),(138,'Gray','#808080','2018-11-05 02:12:30','2018-11-05 02:12:30'),(139,'DimGray','#696969','2018-11-05 02:12:30','2018-11-05 02:12:30'),(140,'LightSlateGray','#778899','2018-11-05 02:12:30','2018-11-05 02:12:30'),(141,'SlateGray','#708090','2018-11-05 02:12:30','2018-11-05 02:12:30'),(142,'DarkSlateGray','#2F4F4F','2018-11-05 02:12:30','2018-11-05 02:12:30'),(143,'Black','#000000','2018-11-05 02:12:30','2018-11-05 02:12:30');
/*!40000 ALTER TABLE `colors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `commission_histories`
--

DROP TABLE IF EXISTS `commission_histories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `commission_histories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `order_detail_id` int(11) NOT NULL,
  `seller_id` int(11) NOT NULL,
  `admin_commission` double(25,2) NOT NULL,
  `seller_earning` double(25,2) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `commission_histories`
--

LOCK TABLES `commission_histories` WRITE;
/*!40000 ALTER TABLE `commission_histories` DISABLE KEYS */;
/*!40000 ALTER TABLE `commission_histories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `company_settings`
--

DROP TABLE IF EXISTS `company_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `company_settings` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `company_name` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `company_email` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `company_phone` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `logo` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address` text COLLATE utf8_unicode_ci NOT NULL,
  `date_format` varchar(191) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y-m-d',
  `time_format` varchar(191) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'h:i A',
  `website` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `timezone` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `locale` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `latitude` decimal(10,8) NOT NULL,
  `longitude` decimal(11,8) NOT NULL,
  `currency_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `purchase_code` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `supported_until` timestamp NULL DEFAULT NULL,
  `multi_task_user` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `booking_per_day` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `employee_selection` enum('enabled','disabled') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'disabled',
  `disable_slot` enum('enabled','disabled') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'disabled',
  `booking_time_type` enum('sum','avg','max','min') COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `company_settings`
--

LOCK TABLES `company_settings` WRITE;
/*!40000 ALTER TABLE `company_settings` DISABLE KEYS */;
/*!40000 ALTER TABLE `company_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `conversations`
--

DROP TABLE IF EXISTS `conversations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `conversations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sender_id` int(11) NOT NULL,
  `receiver_id` int(11) NOT NULL,
  `title` varchar(1000) COLLATE utf32_unicode_ci DEFAULT NULL,
  `sender_viewed` int(1) NOT NULL DEFAULT '1',
  `receiver_viewed` int(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf32 COLLATE=utf32_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `conversations`
--

LOCK TABLES `conversations` WRITE;
/*!40000 ALTER TABLE `conversations` DISABLE KEYS */;
/*!40000 ALTER TABLE `conversations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `countries`
--

DROP TABLE IF EXISTS `countries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `countries` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(2) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `status` int(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=297 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `countries`
--

LOCK TABLES `countries` WRITE;
/*!40000 ALTER TABLE `countries` DISABLE KEYS */;
INSERT INTO `countries` VALUES (1,'AF','Afghanistan',1,NULL,NULL),(2,'AL','Albania',1,NULL,NULL),(3,'DZ','Algeria',1,NULL,NULL),(4,'DS','American Samoa',1,NULL,NULL),(5,'AD','Andorra',1,NULL,NULL),(6,'AO','Angola',1,NULL,NULL),(7,'AI','Anguilla',1,NULL,NULL),(8,'AQ','Antarctica',1,NULL,NULL),(9,'AG','Antigua and Barbuda',1,NULL,NULL),(10,'AR','Argentina',1,NULL,NULL),(11,'AM','Armenia',1,NULL,NULL),(12,'AW','Aruba',1,NULL,NULL),(13,'AU','Australia',1,NULL,NULL),(14,'AT','Austria',1,NULL,NULL),(15,'AZ','Azerbaijan',1,NULL,NULL),(16,'BS','Bahamas',1,NULL,NULL),(17,'BH','Bahrain',1,NULL,NULL),(18,'BD','Bangladesh',1,NULL,NULL),(19,'BB','Barbados',1,NULL,NULL),(20,'BY','Belarus',1,NULL,NULL),(21,'BE','Belgium',1,NULL,NULL),(22,'BZ','Belize',1,NULL,NULL),(23,'BJ','Benin',1,NULL,NULL),(24,'BM','Bermuda',1,NULL,NULL),(25,'BT','Bhutan',1,NULL,NULL),(26,'BO','Bolivia',1,NULL,NULL),(27,'BA','Bosnia and Herzegovina',1,NULL,NULL),(28,'BW','Botswana',1,NULL,NULL),(29,'BV','Bouvet Island',1,NULL,NULL),(30,'BR','Brazil',1,NULL,NULL),(31,'IO','British Indian Ocean Territory',1,NULL,NULL),(32,'BN','Brunei Darussalam',1,NULL,NULL),(33,'BG','Bulgaria',1,NULL,NULL),(34,'BF','Burkina Faso',1,NULL,NULL),(35,'BI','Burundi',1,NULL,NULL),(36,'KH','Cambodia',1,NULL,NULL),(37,'CM','Cameroon',1,NULL,NULL),(38,'CA','Canada',1,NULL,NULL),(39,'CV','Cape Verde',1,NULL,NULL),(40,'KY','Cayman Islands',1,NULL,NULL),(41,'CF','Central African Republic',1,NULL,NULL),(42,'TD','Chad',1,NULL,NULL),(43,'CL','Chile',1,NULL,NULL),(44,'CN','China',1,NULL,NULL),(45,'CX','Christmas Island',1,NULL,NULL),(46,'CC','Cocos (Keeling) Islands',1,NULL,NULL),(47,'CO','Colombia',1,NULL,NULL),(48,'KM','Comoros',1,NULL,NULL),(49,'CG','Congo',1,NULL,NULL),(50,'CK','Cook Islands',1,NULL,NULL),(51,'CR','Costa Rica',1,NULL,NULL),(52,'HR','Croatia (Hrvatska)',1,NULL,NULL),(53,'CU','Cuba',1,NULL,NULL),(54,'CY','Cyprus',1,NULL,NULL),(55,'CZ','Czech Republic',1,NULL,NULL),(56,'DK','Denmark',1,NULL,NULL),(57,'DJ','Djibouti',1,NULL,NULL),(58,'DM','Dominica',1,NULL,NULL),(59,'DO','Dominican Republic',1,NULL,NULL),(60,'TP','East Timor',1,NULL,NULL),(61,'EC','Ecuador',1,NULL,NULL),(62,'EG','Egypt',1,NULL,NULL),(63,'SV','El Salvador',1,NULL,NULL),(64,'GQ','Equatorial Guinea',1,NULL,NULL),(65,'ER','Eritrea',1,NULL,NULL),(66,'EE','Estonia',1,NULL,NULL),(67,'ET','Ethiopia',1,NULL,NULL),(68,'FK','Falkland Islands (Malvinas)',1,NULL,NULL),(69,'FO','Faroe Islands',1,NULL,NULL),(70,'FJ','Fiji',1,NULL,NULL),(71,'FI','Finland',1,NULL,NULL),(72,'FR','France',1,NULL,NULL),(73,'FX','France, Metropolitan',1,NULL,NULL),(74,'GF','French Guiana',1,NULL,NULL),(75,'PF','French Polynesia',1,NULL,NULL),(76,'TF','French Southern Territories',1,NULL,NULL),(77,'GA','Gabon',1,NULL,NULL),(78,'GM','Gambia',1,NULL,NULL),(79,'GE','Georgia',1,NULL,NULL),(80,'DE','Germany',1,NULL,NULL),(81,'GH','Ghana',1,NULL,NULL),(82,'GI','Gibraltar',1,NULL,NULL),(83,'GK','Guernsey',1,NULL,NULL),(84,'GR','Greece',1,NULL,NULL),(85,'GL','Greenland',1,NULL,NULL),(86,'GD','Grenada',1,NULL,NULL),(87,'GP','Guadeloupe',1,NULL,NULL),(88,'GU','Guam',1,NULL,NULL),(89,'GT','Guatemala',1,NULL,NULL),(90,'GN','Guinea',1,NULL,NULL),(91,'GW','Guinea-Bissau',1,NULL,NULL),(92,'GY','Guyana',1,NULL,NULL),(93,'HT','Haiti',1,NULL,NULL),(94,'HM','Heard and Mc Donald Islands',1,NULL,NULL),(95,'HN','Honduras',1,NULL,NULL),(96,'HK','Hong Kong',1,NULL,NULL),(97,'HU','Hungary',1,NULL,NULL),(98,'IS','Iceland',1,NULL,NULL),(99,'IN','India',1,NULL,NULL),(100,'IM','Isle of Man',1,NULL,NULL),(101,'ID','Indonesia',1,NULL,NULL),(102,'IR','Iran (Islamic Republic of)',1,NULL,NULL),(103,'IQ','Iraq',1,NULL,NULL),(104,'IE','Ireland',1,NULL,NULL),(105,'IL','Israel',1,NULL,NULL),(106,'IT','Italy',1,NULL,NULL),(107,'CI','Ivory Coast',1,NULL,NULL),(108,'JE','Jersey',1,NULL,NULL),(109,'JM','Jamaica',1,NULL,NULL),(110,'JP','Japan',1,NULL,NULL),(111,'JO','Jordan',1,NULL,NULL),(112,'KZ','Kazakhstan',1,NULL,NULL),(113,'KE','Kenya',1,NULL,NULL),(114,'KI','Kiribati',1,NULL,NULL),(115,'KP','Korea, Democratic People\'s Republic of',1,NULL,NULL),(116,'KR','Korea, Republic of',1,NULL,NULL),(117,'XK','Kosovo',1,NULL,NULL),(118,'KW','Kuwait',1,NULL,NULL),(119,'KG','Kyrgyzstan',1,NULL,NULL),(120,'LA','Lao People\'s Democratic Republic',1,NULL,NULL),(121,'LV','Latvia',1,NULL,NULL),(122,'LB','Lebanon',1,NULL,NULL),(123,'LS','Lesotho',1,NULL,NULL),(124,'LR','Liberia',1,NULL,NULL),(125,'LY','Libyan Arab Jamahiriya',1,NULL,NULL),(126,'LI','Liechtenstein',1,NULL,NULL),(127,'LT','Lithuania',1,NULL,NULL),(128,'LU','Luxembourg',1,NULL,NULL),(129,'MO','Macau',1,NULL,NULL),(130,'MK','Macedonia',1,NULL,NULL),(131,'MG','Madagascar',1,NULL,NULL),(132,'MW','Malawi',1,NULL,NULL),(133,'MY','Malaysia',1,NULL,NULL),(134,'MV','Maldives',1,NULL,NULL),(135,'ML','Mali',1,NULL,NULL),(136,'MT','Malta',1,NULL,NULL),(137,'MH','Marshall Islands',1,NULL,NULL),(138,'MQ','Martinique',1,NULL,NULL),(139,'MR','Mauritania',1,NULL,NULL),(140,'MU','Mauritius',1,NULL,NULL),(141,'TY','Mayotte',1,NULL,NULL),(142,'MX','Mexico',1,NULL,NULL),(143,'FM','Micronesia, Federated States of',1,NULL,NULL),(144,'MD','Moldova, Republic of',1,NULL,NULL),(145,'MC','Monaco',1,NULL,NULL),(146,'MN','Mongolia',1,NULL,NULL),(147,'ME','Montenegro',1,NULL,NULL),(148,'MS','Montserrat',1,NULL,NULL),(149,'MA','Morocco',1,NULL,NULL),(150,'MZ','Mozambique',1,NULL,NULL),(151,'MM','Myanmar',1,NULL,NULL),(152,'NA','Namibia',1,NULL,NULL),(153,'NR','Nauru',1,NULL,NULL),(154,'NP','Nepal',1,NULL,NULL),(155,'NL','Netherlands',1,NULL,NULL),(156,'AN','Netherlands Antilles',1,NULL,NULL),(157,'NC','New Caledonia',1,NULL,NULL),(158,'NZ','New Zealand',1,NULL,NULL),(159,'NI','Nicaragua',1,NULL,NULL),(160,'NE','Niger',1,NULL,NULL),(161,'NG','Nigeria',1,NULL,NULL),(162,'NU','Niue',1,NULL,NULL),(163,'NF','Norfolk Island',1,NULL,NULL),(164,'MP','Northern Mariana Islands',1,NULL,NULL),(165,'NO','Norway',1,NULL,NULL),(166,'OM','Oman',1,NULL,NULL),(167,'PK','Pakistan',1,NULL,NULL),(168,'PW','Palau',1,NULL,NULL),(169,'PS','Palestine',1,NULL,NULL),(170,'PA','Panama',1,NULL,NULL),(171,'PG','Papua New Guinea',1,NULL,NULL),(172,'PY','Paraguay',1,NULL,NULL),(173,'PE','Peru',1,NULL,NULL),(174,'PH','Philippines',1,NULL,NULL),(175,'PN','Pitcairn',1,NULL,NULL),(176,'PL','Poland',1,NULL,NULL),(177,'PT','Portugal',1,NULL,NULL),(178,'PR','Puerto Rico',1,NULL,NULL),(179,'QA','Qatar',1,NULL,NULL),(180,'RE','Reunion',1,NULL,NULL),(181,'RO','Romania',1,NULL,NULL),(182,'RU','Russian Federation',1,NULL,NULL),(183,'RW','Rwanda',1,NULL,NULL),(184,'KN','Saint Kitts and Nevis',1,NULL,NULL),(185,'LC','Saint Lucia',1,NULL,NULL),(186,'VC','Saint Vincent and the Grenadines',1,NULL,NULL),(187,'WS','Samoa',1,NULL,NULL),(188,'SM','San Marino',1,NULL,NULL),(189,'ST','Sao Tome and Principe',1,NULL,NULL),(190,'SA','Saudi Arabia',1,NULL,NULL),(191,'SN','Senegal',1,NULL,NULL),(192,'RS','Serbia',1,NULL,NULL),(193,'SC','Seychelles',1,NULL,NULL),(194,'SL','Sierra Leone',1,NULL,NULL),(195,'SG','Singapore',1,NULL,NULL),(196,'SK','Slovakia',1,NULL,NULL),(197,'SI','Slovenia',1,NULL,NULL),(198,'SB','Solomon Islands',1,NULL,NULL),(199,'SO','Somalia',1,NULL,NULL),(200,'ZA','South Africa',1,NULL,NULL),(201,'GS','South Georgia South Sandwich Islands',1,NULL,NULL),(202,'SS','South Sudan',1,NULL,NULL),(203,'ES','Spain',1,NULL,NULL),(204,'LK','Sri Lanka',1,NULL,NULL),(205,'SH','St. Helena',1,NULL,NULL),(206,'PM','St. Pierre and Miquelon',1,NULL,NULL),(207,'SD','Sudan',1,NULL,NULL),(208,'SR','Suriname',1,NULL,NULL),(209,'SJ','Svalbard and Jan Mayen Islands',1,NULL,NULL),(210,'SZ','Swaziland',1,NULL,NULL),(211,'SE','Sweden',1,NULL,NULL),(212,'CH','Switzerland',1,NULL,NULL),(213,'SY','Syrian Arab Republic',1,NULL,NULL),(214,'TW','Taiwan',1,NULL,NULL),(215,'TJ','Tajikistan',1,NULL,NULL),(216,'TZ','Tanzania, United Republic of',1,NULL,NULL),(217,'TH','Thailand',1,NULL,NULL),(218,'TG','Togo',1,NULL,NULL),(219,'TK','Tokelau',1,NULL,NULL),(220,'TO','Tonga',1,NULL,NULL),(221,'TT','Trinidad and Tobago',1,NULL,NULL),(222,'TN','Tunisia',1,NULL,NULL),(223,'TR','Turkey',1,NULL,NULL),(224,'TM','Turkmenistan',1,NULL,NULL),(225,'TC','Turks and Caicos Islands',1,NULL,NULL),(226,'TV','Tuvalu',1,NULL,NULL),(227,'UG','Uganda',1,NULL,NULL),(228,'UA','Ukraine',1,NULL,NULL),(229,'AE','United Arab Emirates',1,NULL,NULL),(230,'GB','United Kingdom',1,NULL,NULL),(231,'US','United States',1,NULL,NULL),(232,'UM','United States minor outlying islands',1,NULL,NULL),(233,'UY','Uruguay',1,NULL,NULL),(234,'UZ','Uzbekistan',1,NULL,NULL),(235,'VU','Vanuatu',1,NULL,NULL),(236,'VA','Vatican City State',1,NULL,NULL),(237,'VE','Venezuela',1,NULL,NULL),(238,'VN','Vietnam',1,NULL,NULL),(239,'VG','Virgin Islands (British)',1,NULL,NULL),(240,'VI','Virgin Islands (U.S.)',1,NULL,NULL),(241,'WF','Wallis and Futuna Islands',1,NULL,NULL),(242,'EH','Western Sahara',1,NULL,NULL),(243,'YE','Yemen',1,NULL,NULL),(244,'ZR','Zaire',1,NULL,NULL),(245,'ZM','Zambia',1,NULL,NULL),(246,'ZW','Zimbabwe',1,NULL,NULL);
/*!40000 ALTER TABLE `countries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `coupon_usages`
--

DROP TABLE IF EXISTS `coupon_usages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `coupon_usages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `coupon_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `coupon_usages`
--

LOCK TABLES `coupon_usages` WRITE;
/*!40000 ALTER TABLE `coupon_usages` DISABLE KEYS */;
/*!40000 ALTER TABLE `coupon_usages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `coupons`
--

DROP TABLE IF EXISTS `coupons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `coupons` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `code` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `details` longtext COLLATE utf8_unicode_ci NOT NULL,
  `discount` double(20,2) NOT NULL,
  `discount_type` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `start_date` int(15) NOT NULL,
  `end_date` int(15) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `coupons`
--

LOCK TABLES `coupons` WRITE;
/*!40000 ALTER TABLE `coupons` DISABLE KEYS */;
/*!40000 ALTER TABLE `coupons` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `currencies`
--

DROP TABLE IF EXISTS `currencies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `currencies` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `symbol` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `exchange_rate` double(10,5) NOT NULL,
  `status` int(10) NOT NULL DEFAULT '0',
  `code` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `currencies`
--

LOCK TABLES `currencies` WRITE;
/*!40000 ALTER TABLE `currencies` DISABLE KEYS */;
INSERT INTO `currencies` VALUES (1,'U.S. Dollar','$',1.00000,1,'USD','2018-10-09 11:35:08','2018-10-17 05:50:52'),(2,'Australian Dollar','$',1.28000,1,'AUD','2018-10-09 11:35:08','2019-02-04 05:51:55'),(5,'Brazilian Real','R$',3.25000,1,'BRL','2018-10-09 11:35:08','2018-10-17 05:51:00'),(6,'Canadian Dollar','$',1.27000,1,'CAD','2018-10-09 11:35:08','2018-10-09 11:35:08'),(7,'Czech Koruna','Kč',20.65000,1,'CZK','2018-10-09 11:35:08','2018-10-09 11:35:08'),(8,'Danish Krone','kr',6.05000,1,'DKK','2018-10-09 11:35:08','2018-10-09 11:35:08'),(9,'Euro','€',0.85000,1,'EUR','2018-10-09 11:35:08','2018-10-09 11:35:08'),(10,'Hong Kong Dollar','$',7.83000,1,'HKD','2018-10-09 11:35:08','2018-10-09 11:35:08'),(11,'Hungarian Forint','Ft',255.24000,1,'HUF','2018-10-09 11:35:08','2018-10-09 11:35:08'),(12,'Israeli New Sheqel','₪',3.48000,1,'ILS','2018-10-09 11:35:08','2018-10-09 11:35:08'),(13,'Japanese Yen','¥',107.12000,1,'JPY','2018-10-09 11:35:08','2018-10-09 11:35:08'),(14,'Malaysian Ringgit','RM',3.91000,1,'MYR','2018-10-09 11:35:08','2018-10-09 11:35:08'),(15,'Mexican Peso','$',18.72000,1,'MXN','2018-10-09 11:35:08','2018-10-09 11:35:08'),(16,'Norwegian Krone','kr',7.83000,1,'NOK','2018-10-09 11:35:08','2018-10-09 11:35:08'),(17,'New Zealand Dollar','$',1.38000,1,'NZD','2018-10-09 11:35:08','2018-10-09 11:35:08'),(18,'Philippine Peso','₱',52.26000,1,'PHP','2018-10-09 11:35:08','2018-10-09 11:35:08'),(19,'Polish Zloty','zł',3.39000,1,'PLN','2018-10-09 11:35:08','2018-10-09 11:35:08'),(20,'Pound Sterling','£',0.72000,1,'GBP','2018-10-09 11:35:08','2018-10-09 11:35:08'),(21,'Russian Ruble','руб',55.93000,1,'RUB','2018-10-09 11:35:08','2018-10-09 11:35:08'),(22,'Singapore Dollar','$',1.32000,1,'SGD','2018-10-09 11:35:08','2018-10-09 11:35:08'),(23,'Swedish Krona','kr',8.19000,1,'SEK','2018-10-09 11:35:08','2018-10-09 11:35:08'),(24,'Swiss Franc','CHF',0.94000,1,'CHF','2018-10-09 11:35:08','2018-10-09 11:35:08'),(26,'Thai Baht','฿',31.39000,1,'THB','2018-10-09 11:35:08','2018-10-09 11:35:08'),(27,'Taka','৳',84.00000,1,'BDT','2018-10-09 11:35:08','2018-12-02 05:16:13'),(28,'Indian Rupee','Rs',68.45000,1,'Rupee','2019-07-07 10:33:46','2019-07-07 10:33:46');
/*!40000 ALTER TABLE `currencies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_package_payments`
--

DROP TABLE IF EXISTS `customer_package_payments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer_package_payments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `customer_package_id` int(11) NOT NULL,
  `payment_method` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `payment_details` longtext COLLATE utf8_unicode_ci NOT NULL,
  `approval` int(1) NOT NULL,
  `offline_payment` int(1) NOT NULL COMMENT '1=offline payment\r\n2=online paymnet',
  `reciept` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_package_payments`
--

LOCK TABLES `customer_package_payments` WRITE;
/*!40000 ALTER TABLE `customer_package_payments` DISABLE KEYS */;
/*!40000 ALTER TABLE `customer_package_payments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_package_translations`
--

DROP TABLE IF EXISTS `customer_package_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer_package_translations` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `customer_package_id` bigint(20) NOT NULL,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `lang` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_package_translations`
--

LOCK TABLES `customer_package_translations` WRITE;
/*!40000 ALTER TABLE `customer_package_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `customer_package_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_packages`
--

DROP TABLE IF EXISTS `customer_packages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer_packages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `amount` double(20,2) DEFAULT NULL,
  `product_upload` int(11) DEFAULT NULL,
  `logo` varchar(150) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_packages`
--

LOCK TABLES `customer_packages` WRITE;
/*!40000 ALTER TABLE `customer_packages` DISABLE KEYS */;
/*!40000 ALTER TABLE `customer_packages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_product_translations`
--

DROP TABLE IF EXISTS `customer_product_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer_product_translations` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `customer_product_id` bigint(20) NOT NULL,
  `name` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `unit` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` longtext COLLATE utf8_unicode_ci,
  `lang` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_product_translations`
--

LOCK TABLES `customer_product_translations` WRITE;
/*!40000 ALTER TABLE `customer_product_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `customer_product_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_products`
--

DROP TABLE IF EXISTS `customer_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer_products` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `published` int(1) NOT NULL DEFAULT '0',
  `status` int(1) NOT NULL DEFAULT '0',
  `added_by` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `subcategory_id` int(11) DEFAULT NULL,
  `subsubcategory_id` int(11) DEFAULT NULL,
  `brand_id` int(11) DEFAULT NULL,
  `photos` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `thumbnail_img` varchar(150) COLLATE utf8_unicode_ci DEFAULT NULL,
  `conditon` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `location` text COLLATE utf8_unicode_ci,
  `video_provider` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `video_link` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `unit` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tags` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` mediumtext COLLATE utf8_unicode_ci,
  `unit_price` double(20,2) DEFAULT '0.00',
  `meta_title` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `meta_description` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `meta_img` varchar(150) COLLATE utf8_unicode_ci DEFAULT NULL,
  `pdf` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `slug` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_products`
--

LOCK TABLES `customer_products` WRITE;
/*!40000 ALTER TABLE `customer_products` DISABLE KEYS */;
/*!40000 ALTER TABLE `customer_products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customers`
--

DROP TABLE IF EXISTS `customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customers`
--

LOCK TABLES `customers` WRITE;
/*!40000 ALTER TABLE `customers` DISABLE KEYS */;
INSERT INTO `customers` VALUES (4,8,'2019-08-01 10:35:09','2019-08-01 10:35:09');
/*!40000 ALTER TABLE `customers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `deal_items`
--

DROP TABLE IF EXISTS `deal_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `deal_items` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `deal_id` int(10) unsigned DEFAULT NULL,
  `business_service_id` int(10) unsigned DEFAULT NULL,
  `quantity` tinyint(4) NOT NULL,
  `unit_price` double NOT NULL,
  `discount_amount` double NOT NULL,
  `total_amount` double NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `deal_items`
--

LOCK TABLES `deal_items` WRITE;
/*!40000 ALTER TABLE `deal_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `deal_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `deals`
--

DROP TABLE IF EXISTS `deals`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `deals` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `shop_id` int(11) NOT NULL,
  `deal_type` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `start_date_time` datetime DEFAULT NULL,
  `end_date_time` datetime DEFAULT NULL,
  `open_time` time NOT NULL,
  `close_time` time NOT NULL,
  `uses_limit` int(11) DEFAULT NULL,
  `used_time` int(11) DEFAULT NULL,
  `original_amount` double DEFAULT NULL,
  `deal_amount` double DEFAULT NULL,
  `days` text COLLATE utf8_unicode_ci,
  `image` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` enum('active','inactive','expire') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'active',
  `description` text COLLATE utf8_unicode_ci,
  `discount_type` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `percentage` int(11) DEFAULT NULL,
  `deal_applied_on` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `max_order_per_customer` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `deals`
--

LOCK TABLES `deals` WRITE;
/*!40000 ALTER TABLE `deals` DISABLE KEYS */;
/*!40000 ALTER TABLE `deals` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `district_translations`
--

DROP TABLE IF EXISTS `district_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `district_translations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `district_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `lang` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `district_translations`
--

LOCK TABLES `district_translations` WRITE;
/*!40000 ALTER TABLE `district_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `district_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `districts`
--

DROP TABLE IF EXISTS `districts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `districts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `city_id` int(11) NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `cost` double(20,2) NOT NULL DEFAULT '0.00',
  `status` int(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=300 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `districts`
--

LOCK TABLES `districts` WRITE;
/*!40000 ALTER TABLE `districts` DISABLE KEYS */;
INSERT INTO `districts` VALUES (299,1,'bepanda',500.00,1,'2021-04-23 15:31:19','2021-04-23 15:31:19');
/*!40000 ALTER TABLE `districts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee_group_services`
--

DROP TABLE IF EXISTS `employee_group_services`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `employee_group_services` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `employee_groups_id` int(10) unsigned DEFAULT NULL,
  `business_service_id` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee_group_services`
--

LOCK TABLES `employee_group_services` WRITE;
/*!40000 ALTER TABLE `employee_group_services` DISABLE KEYS */;
/*!40000 ALTER TABLE `employee_group_services` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee_groups`
--

DROP TABLE IF EXISTS `employee_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `employee_groups` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` enum('active','deactive') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee_groups`
--

LOCK TABLES `employee_groups` WRITE;
/*!40000 ALTER TABLE `employee_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `employee_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee_schedules`
--

DROP TABLE IF EXISTS `employee_schedules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `employee_schedules` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `employee_id` int(10) unsigned NOT NULL,
  `is_working` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `start_time` time DEFAULT NULL,
  `end_time` time DEFAULT NULL,
  `days` text COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee_schedules`
--

LOCK TABLES `employee_schedules` WRITE;
/*!40000 ALTER TABLE `employee_schedules` DISABLE KEYS */;
/*!40000 ALTER TABLE `employee_schedules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `flash_deal_products`
--

DROP TABLE IF EXISTS `flash_deal_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `flash_deal_products` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `flash_deal_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `discount` double(20,2) DEFAULT '0.00',
  `discount_type` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `flash_deal_products`
--

LOCK TABLES `flash_deal_products` WRITE;
/*!40000 ALTER TABLE `flash_deal_products` DISABLE KEYS */;
/*!40000 ALTER TABLE `flash_deal_products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `flash_deal_translations`
--

DROP TABLE IF EXISTS `flash_deal_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `flash_deal_translations` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `flash_deal_id` bigint(20) NOT NULL,
  `title` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `lang` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `flash_deal_translations`
--

LOCK TABLES `flash_deal_translations` WRITE;
/*!40000 ALTER TABLE `flash_deal_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `flash_deal_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `flash_deals`
--

DROP TABLE IF EXISTS `flash_deals`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `flash_deals` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `start_date` int(20) DEFAULT NULL,
  `end_date` int(20) DEFAULT NULL,
  `status` int(1) NOT NULL DEFAULT '0',
  `featured` int(1) NOT NULL DEFAULT '0',
  `background_color` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `text_color` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `banner` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `flash_deals`
--

LOCK TABLES `flash_deals` WRITE;
/*!40000 ALTER TABLE `flash_deals` DISABLE KEYS */;
/*!40000 ALTER TABLE `flash_deals` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `general_settings`
--

DROP TABLE IF EXISTS `general_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `general_settings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `frontend_color` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'default',
  `logo` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `footer_logo` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `admin_logo` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `admin_login_background` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `admin_login_sidebar` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `favicon` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `site_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address` varchar(1000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `phone` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `facebook` varchar(1000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `instagram` varchar(1000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `twitter` varchar(1000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `youtube` varchar(1000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `google_plus` varchar(1000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `general_settings`
--

LOCK TABLES `general_settings` WRITE;
/*!40000 ALTER TABLE `general_settings` DISABLE KEYS */;
INSERT INTO `general_settings` VALUES (1,'default','uploads/logo/pfdIuiMeXGkDAIpPEUrvUCbQrOHu484nbGfz77zB.png',NULL,'uploads/admin_logo/wCgHrz0Q5QoL1yu4vdrNnQIr4uGuNL48CXfcxOuS.png',NULL,NULL,'uploads/favicon/uHdGidSaRVzvPgDj6JFtntMqzJkwDk9659233jrb.png','Active Ecommerce CMS','Demo Address','Active eCommerce CMS is a Multi vendor system is such a platform to build a border less marketplace.','1234567890','admin@example.com','https://www.facebook.com','https://www.instagram.com','https://www.twitter.com','https://www.youtube.com','https://www.googleplus.com','2019-03-13 08:01:06','2019-03-13 02:01:06');
/*!40000 ALTER TABLE `general_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `home_categories`
--

DROP TABLE IF EXISTS `home_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `home_categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category_id` int(11) NOT NULL,
  `subsubcategories` varchar(1000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` int(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `home_categories`
--

LOCK TABLES `home_categories` WRITE;
/*!40000 ALTER TABLE `home_categories` DISABLE KEYS */;
INSERT INTO `home_categories` VALUES (1,1,'[\"1\"]',1,'2019-03-12 06:38:23','2019-03-12 06:38:23'),(2,2,'[\"10\"]',1,'2019-03-12 06:44:54','2019-03-12 06:44:54');
/*!40000 ALTER TABLE `home_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `languages`
--

DROP TABLE IF EXISTS `languages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `languages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `code` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `rtl` int(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `languages`
--

LOCK TABLES `languages` WRITE;
/*!40000 ALTER TABLE `languages` DISABLE KEYS */;
INSERT INTO `languages` VALUES (1,'English','en',0,'2019-01-20 12:13:20','2019-01-20 12:13:20'),(3,'Bangla','bd',0,'2019-02-17 06:35:37','2019-02-18 06:49:51'),(4,'Arabic','sa',1,'2019-04-28 18:34:12','2019-04-28 18:34:12');
/*!40000 ALTER TABLE `languages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `leaves`
--

DROP TABLE IF EXISTS `leaves`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `leaves` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `employee_id` int(10) unsigned NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date DEFAULT NULL,
  `start_time` time DEFAULT NULL,
  `end_time` time DEFAULT NULL,
  `leave_type` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `leaves`
--

LOCK TABLES `leaves` WRITE;
/*!40000 ALTER TABLE `leaves` DISABLE KEYS */;
/*!40000 ALTER TABLE `leaves` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `links`
--

DROP TABLE IF EXISTS `links`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `links` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `url` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `links`
--

LOCK TABLES `links` WRITE;
/*!40000 ALTER TABLE `links` DISABLE KEYS */;
/*!40000 ALTER TABLE `links` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `locations`
--

DROP TABLE IF EXISTS `locations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `locations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `shop_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_locations_shops` (`shop_id`),
  CONSTRAINT `FK_locations_shops` FOREIGN KEY (`shop_id`) REFERENCES `shops` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `locations`
--

LOCK TABLES `locations` WRITE;
/*!40000 ALTER TABLE `locations` DISABLE KEYS */;
INSERT INTO `locations` VALUES (1,'Douala , Makepe','2021-03-03 08:35:09','2021-03-18 08:36:17',NULL),(2,'Yaounde , Omnisport','2021-03-18 08:36:36','2021-03-18 08:36:36',NULL),(3,'yaounde , bastos','2021-03-18 08:36:50','2021-03-18 08:36:50',NULL);
/*!40000 ALTER TABLE `locations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `manual_payment_methods`
--

DROP TABLE IF EXISTS `manual_payment_methods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `manual_payment_methods` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `heading` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `bank_info` text COLLATE utf8_unicode_ci,
  `photo` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `manual_payment_methods`
--

LOCK TABLES `manual_payment_methods` WRITE;
/*!40000 ALTER TABLE `manual_payment_methods` DISABLE KEYS */;
/*!40000 ALTER TABLE `manual_payment_methods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `messages`
--

DROP TABLE IF EXISTS `messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `messages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `conversation_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `message` text COLLATE utf32_unicode_ci,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf32 COLLATE=utf32_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `messages`
--

LOCK TABLES `messages` WRITE;
/*!40000 ALTER TABLE `messages` DISABLE KEYS */;
/*!40000 ALTER TABLE `messages` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'2014_10_12_000000_create_users_table',1),(2,'2014_10_12_100000_create_password_resets_table',1);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_access_tokens`
--

DROP TABLE IF EXISTS `oauth_access_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oauth_access_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `client_id` int(10) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
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
INSERT INTO `oauth_access_tokens` VALUES ('125ce8289850f80d9fea100325bf892fbd0deba1f87dbfc2ab81fb43d57377ec24ed65f7dc560e46',1,1,'Personal Access Token','[]',0,'2019-07-30 04:51:13','2019-07-30 04:51:13','2020-07-30 10:51:13'),('293d2bb534220c070c4e90d25b5509965d23d3ddbc05b1e29fb4899ae09420ff112dbccab1c6f504',1,1,'Personal Access Token','[]',1,'2019-08-04 06:00:04','2019-08-04 06:00:04','2020-08-04 12:00:04'),('5363e91c7892acdd6417aa9c7d4987d83568e229befbd75be64282dbe8a88147c6c705e06c1fb2bf',1,1,'Personal Access Token','[]',0,'2019-07-13 06:44:28','2019-07-13 06:44:28','2020-07-13 12:44:28'),('681b4a4099fac5e12517307b4027b54df94cbaf0cbf6b4bf496534c94f0ccd8a79dd6af9742d076b',1,1,'Personal Access Token','[]',1,'2019-08-04 07:23:06','2019-08-04 07:23:06','2020-08-04 13:23:06'),('6d229e3559e568df086c706a1056f760abc1370abe74033c773490581a042442154afa1260c4b6f0',1,1,'Personal Access Token','[]',1,'2019-08-04 07:32:12','2019-08-04 07:32:12','2020-08-04 13:32:12'),('6efc0f1fc3843027ea1ea7cd35acf9c74282f0271c31d45a164e7b27025a315d31022efe7bb94aaa',1,1,'Personal Access Token','[]',0,'2019-08-08 02:35:26','2019-08-08 02:35:26','2020-08-08 08:35:26'),('7745b763da15a06eaded371330072361b0524c41651cf48bf76fc1b521a475ece78703646e06d3b0',1,1,'Personal Access Token','[]',1,'2019-08-04 07:29:44','2019-08-04 07:29:44','2020-08-04 13:29:44'),('815b625e239934be293cd34479b0f766bbc1da7cc10d464a2944ddce3a0142e943ae48be018ccbd0',1,1,'Personal Access Token','[]',1,'2019-07-22 02:07:47','2019-07-22 02:07:47','2020-07-22 08:07:47'),('8921a4c96a6d674ac002e216f98855c69de2568003f9b4136f6e66f4cb9545442fb3e37e91a27cad',1,1,'Personal Access Token','[]',1,'2019-08-04 06:05:05','2019-08-04 06:05:05','2020-08-04 12:05:05'),('8d8b85720304e2f161a66564cec0ecd50d70e611cc0efbf04e409330086e6009f72a39ce2191f33a',1,1,'Personal Access Token','[]',1,'2019-08-04 06:44:35','2019-08-04 06:44:35','2020-08-04 12:44:35'),('bcaaebdead4c0ef15f3ea6d196fd80749d309e6db8603b235e818cb626a5cea034ff2a55b66e3e1a',1,1,'Personal Access Token','[]',1,'2019-08-04 07:14:32','2019-08-04 07:14:32','2020-08-04 13:14:32'),('c25417a5c728073ca8ba57058ded43d496a9d2619b434d2a004dd490a64478c08bc3e06ffc1be65d',1,1,'Personal Access Token','[]',1,'2019-07-30 01:45:31','2019-07-30 01:45:31','2020-07-30 07:45:31'),('c7423d85b2b5bdc5027cb283be57fa22f5943cae43f60b0ed27e6dd198e46f25e3501b3081ed0777',1,1,'Personal Access Token','[]',1,'2019-08-05 05:02:59','2019-08-05 05:02:59','2020-08-05 11:02:59'),('e76f19dbd5c2c4060719fb1006ac56116fd86f7838b4bf74e2c0a0ac9696e724df1e517dbdb357f4',1,1,'Personal Access Token','[]',1,'2019-07-15 02:53:40','2019-07-15 02:53:40','2020-07-15 08:53:40'),('ed7c269dd6f9a97750a982f62e0de54749be6950e323cdfef892a1ec93f8ddbacf9fe26e6a42180e',1,1,'Personal Access Token','[]',1,'2019-07-13 06:36:45','2019-07-13 06:36:45','2020-07-13 12:36:45'),('f6d1475bc17a27e389000d3df4da5c5004ce7610158b0dd414226700c0f6db48914637b4c76e1948',1,1,'Personal Access Token','[]',1,'2019-08-04 07:22:01','2019-08-04 07:22:01','2020-08-04 13:22:01'),('f85e4e444fc954430170c41779a4238f84cd6fed905f682795cd4d7b6a291ec5204a10ac0480eb30',1,1,'Personal Access Token','[]',1,'2019-07-30 06:38:49','2019-07-30 06:38:49','2020-07-30 12:38:49'),('f8bf983a42c543b99128296e4bc7c2d17a52b5b9ef69670c629b93a653c6a4af27be452e0c331f79',1,1,'Personal Access Token','[]',1,'2019-08-04 07:28:55','2019-08-04 07:28:55','2020-08-04 13:28:55');
/*!40000 ALTER TABLE `oauth_access_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_auth_codes`
--

DROP TABLE IF EXISTS `oauth_auth_codes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oauth_auth_codes` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  `client_id` int(10) unsigned NOT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oauth_clients` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `secret` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
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
INSERT INTO `oauth_clients` VALUES (1,NULL,'Laravel Personal Access Client','eR2y7WUuem28ugHKppFpmss7jPyOHZsMkQwBo1Jj','http://localhost',1,0,0,'2019-07-13 06:17:34','2019-07-13 06:17:34'),(2,NULL,'Laravel Password Grant Client','WLW2Ol0GozbaXEnx1NtXoweYPuKEbjWdviaUgw77','http://localhost',0,1,0,'2019-07-13 06:17:34','2019-07-13 06:17:34');
/*!40000 ALTER TABLE `oauth_clients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_personal_access_clients`
--

DROP TABLE IF EXISTS `oauth_personal_access_clients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oauth_personal_access_clients` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `client_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_personal_access_clients_client_id_index` (`client_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_personal_access_clients`
--

LOCK TABLES `oauth_personal_access_clients` WRITE;
/*!40000 ALTER TABLE `oauth_personal_access_clients` DISABLE KEYS */;
INSERT INTO `oauth_personal_access_clients` VALUES (1,1,'2019-07-13 06:17:34','2019-07-13 06:17:34');
/*!40000 ALTER TABLE `oauth_personal_access_clients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_refresh_tokens`
--

DROP TABLE IF EXISTS `oauth_refresh_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oauth_refresh_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `access_token_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_refresh_tokens_access_token_id_index` (`access_token_id`)
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
-- Table structure for table `order_details`
--

DROP TABLE IF EXISTS `order_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `seller_id` int(11) DEFAULT NULL,
  `product_id` int(11) NOT NULL,
  `variation` longtext COLLATE utf8_unicode_ci,
  `price` double(20,2) DEFAULT NULL,
  `tax` double(20,2) NOT NULL DEFAULT '0.00',
  `shipping_cost` double(20,2) NOT NULL DEFAULT '0.00',
  `quantity` int(11) DEFAULT NULL,
  `payment_status` varchar(10) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'unpaid',
  `delivery_status` varchar(20) COLLATE utf8_unicode_ci DEFAULT 'pending',
  `shipping_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `pickup_point_id` int(11) DEFAULT NULL,
  `product_referral_code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_details`
--

LOCK TABLES `order_details` WRITE;
/*!40000 ALTER TABLE `order_details` DISABLE KEYS */;
/*!40000 ALTER TABLE `order_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `guest_id` int(11) DEFAULT NULL,
  `seller_id` int(11) DEFAULT NULL,
  `shipping_address` longtext COLLATE utf8_unicode_ci,
  `delivery_status` varchar(20) COLLATE utf8_unicode_ci DEFAULT 'pending',
  `payment_type` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `manual_payment` int(1) NOT NULL DEFAULT '0',
  `manual_payment_data` text COLLATE utf8_unicode_ci,
  `payment_status` varchar(20) COLLATE utf8_unicode_ci DEFAULT 'unpaid',
  `payment_details` longtext COLLATE utf8_unicode_ci,
  `grand_total` double(20,2) DEFAULT NULL,
  `coupon_discount` double(20,2) NOT NULL DEFAULT '0.00',
  `code` mediumtext COLLATE utf8_unicode_ci,
  `date` int(20) NOT NULL,
  `viewed` int(1) NOT NULL DEFAULT '0',
  `delivery_viewed` int(1) NOT NULL DEFAULT '1',
  `payment_status_viewed` int(1) DEFAULT '1',
  `commission_calculated` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `otp_configurations`
--

DROP TABLE IF EXISTS `otp_configurations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `otp_configurations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `value` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `otp_configurations`
--

LOCK TABLES `otp_configurations` WRITE;
/*!40000 ALTER TABLE `otp_configurations` DISABLE KEYS */;
INSERT INTO `otp_configurations` VALUES (1,'nexmo','1','2020-03-22 09:19:07','2020-03-22 09:19:07'),(2,'otp_for_order','1','2020-03-22 09:19:07','2020-03-22 09:19:07'),(3,'otp_for_delivery_status','1','2020-03-22 09:19:37','2020-03-22 09:19:37'),(4,'otp_for_paid_status','0','2020-03-22 09:19:37','2020-03-22 09:19:37'),(5,'twillo','0','2020-03-22 09:54:03','2020-03-22 03:54:20'),(6,'ssl_wireless','0','2020-03-22 09:54:03','2020-03-22 03:54:20'),(7,'fast2sms','0','2020-03-22 09:54:03','2020-03-22 03:54:20'),(8,'mimo','0','2020-12-27 09:54:03','2020-12-28 03:54:20');
/*!40000 ALTER TABLE `otp_configurations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `page_translations`
--

DROP TABLE IF EXISTS `page_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `page_translations` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `page_id` bigint(20) NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `content` longtext COLLATE utf8_unicode_ci NOT NULL,
  `lang` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `page_translations`
--

LOCK TABLES `page_translations` WRITE;
/*!40000 ALTER TABLE `page_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `page_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pages`
--

DROP TABLE IF EXISTS `pages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `content` longtext COLLATE utf8_unicode_ci,
  `meta_title` text COLLATE utf8_unicode_ci,
  `meta_description` varchar(1000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `keywords` varchar(1000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `meta_image` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pages`
--

LOCK TABLES `pages` WRITE;
/*!40000 ALTER TABLE `pages` DISABLE KEYS */;
INSERT INTO `pages` VALUES (1,'home_page','Home Page','home',NULL,NULL,NULL,NULL,NULL,'2020-11-04 10:13:20','2020-11-04 10:13:20'),(2,'seller_policy_page','Seller Policy Pages','sellerpolicy',NULL,NULL,NULL,NULL,NULL,'2020-11-04 10:14:41','2020-11-04 12:19:30'),(3,'return_policy_page','Return Policy Page','returnpolicy',NULL,NULL,NULL,NULL,NULL,'2020-11-04 10:14:41','2020-11-04 10:14:41'),(4,'support_policy_page','Support Policy Page','supportpolicy',NULL,NULL,NULL,NULL,NULL,'2020-11-04 10:14:59','2020-11-04 10:14:59'),(5,'terms_conditions_page','Term Conditions Page','terms',NULL,NULL,NULL,NULL,NULL,'2020-11-04 10:15:29','2020-11-04 10:15:29'),(6,'privacy_policy_page','Privacy Policy Page','privacypolicy',NULL,NULL,NULL,NULL,NULL,'2020-11-04 10:15:55','2020-11-04 10:15:55');
/*!40000 ALTER TABLE `pages` ENABLE KEYS */;
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
-- Table structure for table `payments`
--

DROP TABLE IF EXISTS `payments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `payments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `seller_id` int(11) NOT NULL,
  `amount` double(20,2) NOT NULL DEFAULT '0.00',
  `payment_details` longtext COLLATE utf8_unicode_ci,
  `payment_method` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `txn_code` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payments`
--

LOCK TABLES `payments` WRITE;
/*!40000 ALTER TABLE `payments` DISABLE KEYS */;
/*!40000 ALTER TABLE `payments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pickup_point_translations`
--

DROP TABLE IF EXISTS `pickup_point_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pickup_point_translations` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `pickup_point_id` bigint(20) NOT NULL,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `address` text COLLATE utf8_unicode_ci NOT NULL,
  `lang` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pickup_point_translations`
--

LOCK TABLES `pickup_point_translations` WRITE;
/*!40000 ALTER TABLE `pickup_point_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `pickup_point_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pickup_points`
--

DROP TABLE IF EXISTS `pickup_points`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pickup_points` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `staff_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `address` text NOT NULL,
  `phone` varchar(15) NOT NULL,
  `shop_id` int(11) NOT NULL,
  `pick_up_status` int(1) DEFAULT NULL,
  `cash_on_pickup_status` int(1) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pickup_points`
--

LOCK TABLES `pickup_points` WRITE;
/*!40000 ALTER TABLE `pickup_points` DISABLE KEYS */;
/*!40000 ALTER TABLE `pickup_points` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `policies`
--

DROP TABLE IF EXISTS `policies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `policies` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(35) COLLATE utf8_unicode_ci NOT NULL,
  `content` longtext COLLATE utf8_unicode_ci,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `policies`
--

LOCK TABLES `policies` WRITE;
/*!40000 ALTER TABLE `policies` DISABLE KEYS */;
INSERT INTO `policies` VALUES (1,'support_policy',NULL,'2019-10-29 12:54:45','2019-01-22 05:13:15'),(2,'return_policy',NULL,'2019-10-29 12:54:47','2019-01-24 05:40:11'),(4,'seller_policy',NULL,'2019-10-29 12:54:49','2019-02-04 17:50:15'),(5,'terms',NULL,'2019-10-29 12:54:51','2019-10-28 18:00:00'),(6,'privacy_policy',NULL,'2019-10-29 12:54:54','2019-10-28 18:00:00');
/*!40000 ALTER TABLE `policies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_stocks`
--

DROP TABLE IF EXISTS `product_stocks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product_stocks` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `variant` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sku` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `price` double(20,2) NOT NULL DEFAULT '0.00',
  `qty` int(11) NOT NULL DEFAULT '0',
  `image` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_stocks`
--

LOCK TABLES `product_stocks` WRITE;
/*!40000 ALTER TABLE `product_stocks` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_stocks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_taxes`
--

DROP TABLE IF EXISTS `product_taxes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product_taxes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `tax_id` int(11) NOT NULL,
  `tax` double(20,2) NOT NULL,
  `tax_type` varchar(10) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_taxes`
--

LOCK TABLES `product_taxes` WRITE;
/*!40000 ALTER TABLE `product_taxes` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_taxes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_translations`
--

DROP TABLE IF EXISTS `product_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product_translations` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `product_id` bigint(20) NOT NULL,
  `name` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `unit` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` longtext COLLATE utf8_unicode_ci,
  `lang` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_translations`
--

LOCK TABLES `product_translations` WRITE;
/*!40000 ALTER TABLE `product_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `products` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `added_by` varchar(6) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'admin',
  `user_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `subcategory_id` int(11) DEFAULT NULL,
  `subsubcategory_id` int(11) DEFAULT NULL,
  `brand_id` int(11) DEFAULT NULL,
  `photos` varchar(2000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `thumbnail_img` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `video_provider` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `video_link` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tags` varchar(1000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` longtext COLLATE utf8_unicode_ci,
  `unit_price` double(20,2) NOT NULL,
  `purchase_price` double(20,2) NOT NULL,
  `variant_product` int(1) NOT NULL DEFAULT '0',
  `attributes` varchar(1000) COLLATE utf8_unicode_ci NOT NULL DEFAULT '[]',
  `choice_options` mediumtext COLLATE utf8_unicode_ci,
  `colors` mediumtext COLLATE utf8_unicode_ci,
  `variations` text COLLATE utf8_unicode_ci,
  `todays_deal` int(11) NOT NULL DEFAULT '0',
  `published` int(11) NOT NULL DEFAULT '1',
  `stock_visibility_state` varchar(10) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'quantity',
  `cash_on_delivery` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1 = On, 0 = Off',
  `featured` int(11) NOT NULL DEFAULT '0',
  `seller_featured` int(11) NOT NULL DEFAULT '0',
  `current_stock` int(10) NOT NULL DEFAULT '0',
  `unit` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `min_qty` int(11) NOT NULL DEFAULT '1',
  `low_stock_quantity` int(11) DEFAULT NULL,
  `discount` double(20,2) DEFAULT NULL,
  `discount_type` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tax` double(20,2) DEFAULT NULL,
  `tax_type` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `shipping_type` varchar(20) CHARACTER SET latin1 DEFAULT 'flat_rate',
  `shipping_cost` text COLLATE utf8_unicode_ci,
  `is_quantity_multiplied` tinyint(1) NOT NULL DEFAULT '0' COMMENT '1 = Mutiplied with shipping cost',
  `est_shipping_days` int(11) DEFAULT NULL,
  `num_of_sale` int(11) NOT NULL DEFAULT '0',
  `meta_title` mediumtext COLLATE utf8_unicode_ci,
  `meta_description` longtext COLLATE utf8_unicode_ci,
  `meta_img` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `pdf` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `slug` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `refundable` int(1) NOT NULL DEFAULT '0',
  `earn_point` double(8,2) NOT NULL DEFAULT '0.00',
  `rating` double(8,2) NOT NULL DEFAULT '0.00',
  `barcode` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `digital` int(1) NOT NULL DEFAULT '0',
  `file_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `file_path` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `time` double(8,2) NOT NULL,
  `time_type` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `is_service` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `tags` (`tags`(255))
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `refund_requests`
--

DROP TABLE IF EXISTS `refund_requests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `refund_requests` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `order_detail_id` int(11) NOT NULL,
  `seller_id` int(11) NOT NULL,
  `seller_approval` int(1) NOT NULL DEFAULT '0',
  `admin_approval` int(1) NOT NULL DEFAULT '0',
  `refund_amount` double(8,2) NOT NULL DEFAULT '0.00',
  `reason` longtext COLLATE utf8_unicode_ci,
  `admin_seen` int(11) NOT NULL,
  `refund_status` int(1) NOT NULL DEFAULT '0',
  `reject_reason` longtext COLLATE utf8_unicode_ci,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `refund_requests`
--

LOCK TABLES `refund_requests` WRITE;
/*!40000 ALTER TABLE `refund_requests` DISABLE KEYS */;
/*!40000 ALTER TABLE `refund_requests` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reviews`
--

DROP TABLE IF EXISTS `reviews`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reviews` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `rating` int(11) NOT NULL DEFAULT '0',
  `comment` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `status` int(1) NOT NULL DEFAULT '1',
  `viewed` int(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reviews`
--

LOCK TABLES `reviews` WRITE;
/*!40000 ALTER TABLE `reviews` DISABLE KEYS */;
/*!40000 ALTER TABLE `reviews` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role_translations`
--

DROP TABLE IF EXISTS `role_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `role_translations` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `role_id` bigint(20) NOT NULL,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `lang` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role_translations`
--

LOCK TABLES `role_translations` WRITE;
/*!40000 ALTER TABLE `role_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `role_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `roles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `permissions` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'Manager','[\"1\",\"2\",\"4\"]','2018-10-10 04:39:47','2018-10-10 04:51:37'),(2,'Accountant','[\"2\",\"3\"]','2018-10-10 04:52:09','2018-10-10 04:52:09');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `searches`
--

DROP TABLE IF EXISTS `searches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `searches` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `query` varchar(1000) COLLATE utf8_unicode_ci NOT NULL,
  `count` int(11) NOT NULL DEFAULT '1',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `searches`
--

LOCK TABLES `searches` WRITE;
/*!40000 ALTER TABLE `searches` DISABLE KEYS */;
INSERT INTO `searches` VALUES (2,'dcs',1,'2020-03-08 00:29:09','2020-03-08 00:29:09'),(3,'das',3,'2020-03-08 00:29:15','2020-03-08 00:29:50');
/*!40000 ALTER TABLE `searches` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `seller_packages`
--

DROP TABLE IF EXISTS `seller_packages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `seller_packages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `amount` double(11,2) NOT NULL DEFAULT '0.00',
  `product_upload` int(11) NOT NULL DEFAULT '0',
  `digital_product_upload` int(11) NOT NULL DEFAULT '0',
  `logo` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `duration` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `seller_packages`
--

LOCK TABLES `seller_packages` WRITE;
/*!40000 ALTER TABLE `seller_packages` DISABLE KEYS */;
/*!40000 ALTER TABLE `seller_packages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `seller_withdraw_requests`
--

DROP TABLE IF EXISTS `seller_withdraw_requests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `seller_withdraw_requests` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `amount` double(20,2) DEFAULT NULL,
  `message` longtext,
  `status` int(1) DEFAULT NULL,
  `viewed` int(1) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `seller_withdraw_requests`
--

LOCK TABLES `seller_withdraw_requests` WRITE;
/*!40000 ALTER TABLE `seller_withdraw_requests` DISABLE KEYS */;
/*!40000 ALTER TABLE `seller_withdraw_requests` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sellers`
--

DROP TABLE IF EXISTS `sellers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sellers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `seller_package_id` int(11) DEFAULT NULL,
  `remaining_uploads` int(11) NOT NULL DEFAULT '0',
  `remaining_digital_uploads` int(11) NOT NULL DEFAULT '0',
  `invalid_at` date DEFAULT NULL,
  `verification_status` int(1) NOT NULL DEFAULT '0',
  `verification_info` longtext COLLATE utf8_unicode_ci,
  `cash_on_delivery_status` int(1) NOT NULL DEFAULT '0',
  `admin_to_pay` double(20,2) NOT NULL DEFAULT '0.00',
  `bank_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `bank_acc_name` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `bank_acc_no` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `bank_routing_no` int(50) DEFAULT NULL,
  `bank_payment_status` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sellers`
--

LOCK TABLES `sellers` WRITE;
/*!40000 ALTER TABLE `sellers` DISABLE KEYS */;
INSERT INTO `sellers` VALUES (1,3,NULL,0,0,NULL,1,'[{\"type\":\"text\",\"label\":\"Name\",\"value\":\"Mr. Seller\"},{\"type\":\"select\",\"label\":\"Marital Status\",\"value\":\"Married\"},{\"type\":\"multi_select\",\"label\":\"Company\",\"value\":\"[\\\"Company\\\"]\"},{\"type\":\"select\",\"label\":\"Gender\",\"value\":\"Male\"},{\"type\":\"file\",\"label\":\"Image\",\"value\":\"uploads\\/verification_form\\/CRWqFifcbKqibNzllBhEyUSkV6m1viknGXMEhtiW.png\"}]',1,78.40,NULL,NULL,NULL,NULL,0,'2018-10-07 04:42:57','2020-01-26 04:21:11');
/*!40000 ALTER TABLE `sellers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `seo_settings`
--

DROP TABLE IF EXISTS `seo_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `seo_settings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `keyword` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `author` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `revisit` int(11) NOT NULL,
  `sitemap_link` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `seo_settings`
--

LOCK TABLES `seo_settings` WRITE;
/*!40000 ALTER TABLE `seo_settings` DISABLE KEYS */;
INSERT INTO `seo_settings` VALUES (1,'bootstrap,responsive,template,developer','Active IT Zone',11,'https://www.activeitzone.com','Active E-commerce CMS Multi vendor system is such a platform to build a border less marketplace both for physical and digital goods.','2019-08-08 08:56:11','2019-08-08 02:56:11');
/*!40000 ALTER TABLE `seo_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shops`
--

DROP TABLE IF EXISTS `shops`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shops` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `name` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `logo` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sliders` longtext COLLATE utf8_unicode_ci,
  `address` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `facebook` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `google` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `twitter` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `youtube` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `meta_title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `meta_description` text COLLATE utf8_unicode_ci,
  `pick_up_point_id` text COLLATE utf8_unicode_ci,
  `shipping_cost` double(20,2) NOT NULL DEFAULT '0.00',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shops`
--

LOCK TABLES `shops` WRITE;
/*!40000 ALTER TABLE `shops` DISABLE KEYS */;
INSERT INTO `shops` VALUES (1,3,'Demo Seller Shop',NULL,NULL,'House : Demo, Road : Demo, Section : Demo','www.facebook.com','www.google.com','www.twitter.com','www.youtube.com','Demo-Seller-Shop-1','Demo Seller Shop Title','Demo description',NULL,0.00,'2018-11-27 10:23:13','2019-08-06 06:43:16');
/*!40000 ALTER TABLE `shops` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sliders`
--

DROP TABLE IF EXISTS `sliders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sliders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `photo` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `published` int(1) NOT NULL DEFAULT '1',
  `link` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sliders`
--

LOCK TABLES `sliders` WRITE;
/*!40000 ALTER TABLE `sliders` DISABLE KEYS */;
INSERT INTO `sliders` VALUES (7,'uploads/sliders/slider-image.jpg',1,NULL,'2019-03-12 05:58:05','2019-03-12 05:58:05'),(8,'uploads/sliders/slider-image.jpg',1,NULL,'2019-03-12 05:58:12','2019-03-12 05:58:12');
/*!40000 ALTER TABLE `sliders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `staff`
--

DROP TABLE IF EXISTS `staff`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `staff` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `staff`
--

LOCK TABLES `staff` WRITE;
/*!40000 ALTER TABLE `staff` DISABLE KEYS */;
/*!40000 ALTER TABLE `staff` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subscribers`
--

DROP TABLE IF EXISTS `subscribers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `subscribers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subscribers`
--

LOCK TABLES `subscribers` WRITE;
/*!40000 ALTER TABLE `subscribers` DISABLE KEYS */;
/*!40000 ALTER TABLE `subscribers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `taxes`
--

DROP TABLE IF EXISTS `taxes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `taxes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `tax_status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '0 = Inactive, 1 = Active',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `taxes`
--

LOCK TABLES `taxes` WRITE;
/*!40000 ALTER TABLE `taxes` DISABLE KEYS */;
INSERT INTO `taxes` VALUES (3,'Tax',1,'2021-03-07 11:45:33','2021-03-07 11:45:33');
/*!40000 ALTER TABLE `taxes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ticket_replies`
--

DROP TABLE IF EXISTS `ticket_replies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ticket_replies` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ticket_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `reply` longtext COLLATE utf8_unicode_ci NOT NULL,
  `files` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ticket_replies`
--

LOCK TABLES `ticket_replies` WRITE;
/*!40000 ALTER TABLE `ticket_replies` DISABLE KEYS */;
/*!40000 ALTER TABLE `ticket_replies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tickets`
--

DROP TABLE IF EXISTS `tickets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tickets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` int(6) NOT NULL,
  `user_id` int(11) NOT NULL,
  `subject` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `details` longtext COLLATE utf8_unicode_ci,
  `files` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin,
  `status` varchar(10) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'pending',
  `viewed` int(1) NOT NULL DEFAULT '0',
  `client_viewed` int(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tickets`
--

LOCK TABLES `tickets` WRITE;
/*!40000 ALTER TABLE `tickets` DISABLE KEYS */;
/*!40000 ALTER TABLE `tickets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `todo_items`
--

DROP TABLE IF EXISTS `todo_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `todo_items` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `title` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `status` enum('pending','completed') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'pending',
  `position` int(10) unsigned NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `todo_items`
--

LOCK TABLES `todo_items` WRITE;
/*!40000 ALTER TABLE `todo_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `todo_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `translations`
--

DROP TABLE IF EXISTS `translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `translations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lang` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lang_key` text COLLATE utf8_unicode_ci,
  `lang_value` text COLLATE utf8_unicode_ci,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1515 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `translations`
--

LOCK TABLES `translations` WRITE;
/*!40000 ALTER TABLE `translations` DISABLE KEYS */;
INSERT INTO `translations` VALUES (3,'en','All Category','All Category','2020-11-02 07:40:38','2020-11-02 07:40:38'),(4,'en','All','All','2020-11-02 07:40:38','2020-11-02 07:40:38'),(5,'en','Flash Sale','Flash Sale','2020-11-02 07:40:40','2020-11-02 07:40:40'),(6,'en','View More','View More','2020-11-02 07:40:40','2020-11-02 07:40:40'),(7,'en','Add to wishlist','Add to wishlist','2020-11-02 07:40:40','2020-11-02 07:40:40'),(8,'en','Add to compare','Add to compare','2020-11-02 07:40:40','2020-11-02 07:40:40'),(9,'en','Add to cart','Add to cart','2020-11-02 07:40:40','2020-11-02 07:40:40'),(10,'en','Club Point','Club Point','2020-11-02 07:40:40','2020-11-02 07:40:40'),(11,'en','Classified Ads','Classified Ads','2020-11-02 07:40:40','2020-11-02 07:40:40'),(13,'en','Used','Used','2020-11-02 07:40:40','2020-11-02 07:40:40'),(14,'en','Top 10 Categories','Top 10 Categories','2020-11-02 07:40:40','2020-11-02 07:40:40'),(15,'en','View All Categories','View All Categories','2020-11-02 07:40:40','2020-11-02 07:40:40'),(16,'en','Top 10 Brands','Top 10 Brands','2020-11-02 07:40:40','2020-11-02 07:40:40'),(17,'en','View All Brands','View All Brands','2020-11-02 07:40:40','2020-11-02 07:40:40'),(43,'en','Terms & conditions','Terms & conditions','2020-11-02 07:40:41','2020-11-02 07:40:41'),(51,'en','Best Selling','Best Selling','2020-11-02 07:40:42','2020-11-02 07:40:42'),(53,'en','Top 20','Top 20','2020-11-02 07:40:42','2020-11-02 07:40:42'),(55,'en','Featured Products','Featured Products','2020-11-02 07:40:42','2020-11-02 07:40:42'),(56,'en','Best Sellers','Best Sellers','2020-11-02 07:40:43','2020-11-02 07:40:43'),(57,'en','Visit Store','Visit Store','2020-11-02 07:40:43','2020-11-02 07:40:43'),(58,'en','Popular Suggestions','Popular Suggestions','2020-11-02 07:46:59','2020-11-02 07:46:59'),(59,'en','Category Suggestions','Category Suggestions','2020-11-02 07:46:59','2020-11-02 07:46:59'),(62,'en','Automobile & Motorcycle','Automobile & Motorcycle','2020-11-02 07:47:01','2020-11-02 07:47:01'),(63,'en','Price range','Price range','2020-11-02 07:47:01','2020-11-02 07:47:01'),(64,'en','Filter by color','Filter by color','2020-11-02 07:47:02','2020-11-02 07:47:02'),(65,'en','Home','Home','2020-11-02 07:47:02','2020-11-02 07:47:02'),(67,'en','Newest','Newest','2020-11-02 07:47:02','2020-11-02 07:47:02'),(68,'en','Oldest','Oldest','2020-11-02 07:47:02','2020-11-02 07:47:02'),(69,'en','Price low to high','Price low to high','2020-11-02 07:47:02','2020-11-02 07:47:02'),(70,'en','Price high to low','Price high to low','2020-11-02 07:47:02','2020-11-02 07:47:02'),(71,'en','Brands','Brands','2020-11-02 07:47:02','2020-11-02 07:47:02'),(72,'en','All Brands','All Brands','2020-11-02 07:47:02','2020-11-02 07:47:02'),(74,'en','All Sellers','All Sellers','2020-11-02 07:47:02','2020-11-02 07:47:02'),(78,'en','Inhouse product','Inhouse product','2020-11-02 08:18:03','2020-11-02 08:18:03'),(79,'en','Message Seller','Message Seller','2020-11-02 08:18:03','2020-11-02 08:18:03'),(80,'en','Price','Price','2020-11-02 08:18:03','2020-11-02 08:18:03'),(81,'en','Discount Price','Discount Price','2020-11-02 08:18:03','2020-11-02 08:18:03'),(82,'en','Color','Color','2020-11-02 08:18:03','2020-11-02 08:18:03'),(83,'en','Quantity','Quantity','2020-11-02 08:18:03','2020-11-02 08:18:03'),(84,'en','available','available','2020-11-02 08:18:03','2020-11-02 08:18:03'),(85,'en','Total Price','Total Price','2020-11-02 08:18:03','2020-11-02 08:18:03'),(86,'en','Out of Stock','Out of Stock','2020-11-02 08:18:03','2020-11-02 08:18:03'),(87,'en','Refund','Refund','2020-11-02 08:18:03','2020-11-02 08:18:03'),(88,'en','Share','Share','2020-11-02 08:18:03','2020-11-02 08:18:03'),(89,'en','Sold By','Sold By','2020-11-02 08:18:03','2020-11-02 08:18:03'),(90,'en','customer reviews','customer reviews','2020-11-02 08:18:03','2020-11-02 08:18:03'),(91,'en','Top Selling Products','Top Selling Products','2020-11-02 08:18:03','2020-11-02 08:18:03'),(92,'en','Description','Description','2020-11-02 08:18:03','2020-11-02 08:18:03'),(93,'en','Video','Video','2020-11-02 08:18:03','2020-11-02 08:18:03'),(94,'en','Reviews','Reviews','2020-11-02 08:18:03','2020-11-02 08:18:03'),(95,'en','Download','Download','2020-11-02 08:18:03','2020-11-02 08:18:03'),(96,'en','There have been no reviews for this product yet.','There have been no reviews for this product yet.','2020-11-02 08:18:03','2020-11-02 08:18:03'),(97,'en','Related products','Related products','2020-11-02 08:18:03','2020-11-02 08:18:03'),(98,'en','Any query about this product','Any query about this product','2020-11-02 08:18:03','2020-11-02 08:18:03'),(99,'en','Product Name','Product Name','2020-11-02 08:18:03','2020-11-02 08:18:03'),(100,'en','Your Question','Your Question','2020-11-02 08:18:03','2020-11-02 08:18:03'),(101,'en','Send','Send','2020-11-02 08:18:03','2020-11-02 08:18:03'),(103,'en','Use country code before number','Use country code before number','2020-11-02 08:18:03','2020-11-02 08:18:03'),(105,'en','Remember Me','Remember Me','2020-11-02 08:18:03','2020-11-02 08:18:03'),(107,'en','Dont have an account?','Dont have an account?','2020-11-02 08:18:04','2020-11-02 08:18:04'),(108,'en','Register Now','Register Now','2020-11-02 08:18:04','2020-11-02 08:18:04'),(109,'en','Or Login With','Or Login With','2020-11-02 08:18:04','2020-11-02 08:18:04'),(110,'en','oops..','oops..','2020-11-02 10:29:04','2020-11-02 10:29:04'),(111,'en','This item is out of stock!','This item is out of stock!','2020-11-02 10:29:04','2020-11-02 10:29:04'),(112,'en','Back to shopping','Back to shopping','2020-11-02 10:29:04','2020-11-02 10:29:04'),(113,'en','Login to your account.','Login to your account.','2020-11-02 11:27:41','2020-11-02 11:27:41'),(115,'en','Purchase History','Purchase History','2020-11-02 11:27:53','2020-11-02 11:27:53'),(116,'en','New','New','2020-11-02 11:27:53','2020-11-02 11:27:53'),(117,'en','Downloads','Downloads','2020-11-02 11:27:53','2020-11-02 11:27:53'),(118,'en','Sent Refund Request','Sent Refund Request','2020-11-02 11:27:53','2020-11-02 11:27:53'),(119,'en','Product Bulk Upload','Product Bulk Upload','2020-11-02 11:27:53','2020-11-02 11:27:53'),(123,'en','Orders','Orders','2020-11-02 11:27:53','2020-11-02 11:27:53'),(124,'en','Recieved Refund Request','Recieved Refund Request','2020-11-02 11:27:53','2020-11-02 11:27:53'),(126,'en','Shop Setting','Shop Setting','2020-11-02 11:27:53','2020-11-02 11:27:53'),(127,'en','Payment History','Payment History','2020-11-02 11:27:53','2020-11-02 11:27:53'),(128,'en','Money Withdraw','Money Withdraw','2020-11-02 11:27:53','2020-11-02 11:27:53'),(129,'en','Conversations','Conversations','2020-11-02 11:27:53','2020-11-02 11:27:53'),(130,'en','My Wallet','My Wallet','2020-11-02 11:27:53','2020-11-02 11:27:53'),(131,'en','Earning Points','Earning Points','2020-11-02 11:27:53','2020-11-02 11:27:53'),(132,'en','Support Ticket','Support Ticket','2020-11-02 11:27:53','2020-11-02 11:27:53'),(133,'en','Manage Profile','Manage Profile','2020-11-02 11:27:53','2020-11-02 11:27:53'),(134,'en','Sold Amount','Sold Amount','2020-11-02 11:27:53','2020-11-02 11:27:53'),(135,'en','Your sold amount (current month)','Your sold amount (current month)','2020-11-02 11:27:53','2020-11-02 11:27:53'),(136,'en','Total Sold','Total Sold','2020-11-02 11:27:54','2020-11-02 11:27:54'),(137,'en','Last Month Sold','Last Month Sold','2020-11-02 11:27:54','2020-11-02 11:27:54'),(138,'en','Total sale','Total sale','2020-11-02 11:27:54','2020-11-02 11:27:54'),(139,'en','Total earnings','Total earnings','2020-11-02 11:27:54','2020-11-02 11:27:54'),(140,'en','Successful orders','Successful orders','2020-11-02 11:27:54','2020-11-02 11:27:54'),(141,'en','Total orders','Total orders','2020-11-02 11:27:54','2020-11-02 11:27:54'),(142,'en','Pending orders','Pending orders','2020-11-02 11:27:54','2020-11-02 11:27:54'),(143,'en','Cancelled orders','Cancelled orders','2020-11-02 11:27:54','2020-11-02 11:27:54'),(145,'en','Product','Product','2020-11-02 11:27:55','2020-11-02 11:27:55'),(147,'en','Purchased Package','Purchased Package','2020-11-02 11:27:55','2020-11-02 11:27:55'),(148,'en','Package Not Found','Package Not Found','2020-11-02 11:27:55','2020-11-02 11:27:55'),(149,'en','Upgrade Package','Upgrade Package','2020-11-02 11:27:55','2020-11-02 11:27:55'),(150,'en','Shop','Shop','2020-11-02 11:27:55','2020-11-02 11:27:55'),(151,'en','Manage & organize your shop','Manage & organize your shop','2020-11-02 11:27:55','2020-11-02 11:27:55'),(152,'en','Go to setting','Go to setting','2020-11-02 11:27:55','2020-11-02 11:27:55'),(153,'en','Payment','Payment','2020-11-02 11:27:55','2020-11-02 11:27:55'),(154,'en','Configure your payment method','Configure your payment method','2020-11-02 11:27:55','2020-11-02 11:27:55'),(156,'en','My Panel','My Panel','2020-11-02 11:27:55','2020-11-02 11:27:55'),(158,'en','Item has been added to wishlist','Item has been added to wishlist','2020-11-02 11:27:55','2020-11-02 11:27:55'),(159,'en','My Points','My Points','2020-11-02 11:28:15','2020-11-02 11:28:15'),(160,'en',' Points',' Points','2020-11-02 11:28:15','2020-11-02 11:28:15'),(161,'en','Wallet Money','Wallet Money','2020-11-02 11:28:16','2020-11-02 11:28:16'),(162,'en','Exchange Rate','Exchange Rate','2020-11-02 11:28:16','2020-11-02 11:28:16'),(163,'en','Point Earning history','Point Earning history','2020-11-02 11:28:16','2020-11-02 11:28:16'),(164,'en','Date','Date','2020-11-02 11:28:16','2020-11-02 11:28:16'),(165,'en','Points','Points','2020-11-02 11:28:16','2020-11-02 11:28:16'),(166,'en','Converted','Converted','2020-11-02 11:28:16','2020-11-02 11:28:16'),(167,'en','Action','Action','2020-11-02 11:28:16','2020-11-02 11:28:16'),(168,'en','No history found.','No history found.','2020-11-02 11:28:16','2020-11-02 11:28:16'),(169,'en','Convert has been done successfully Check your Wallets','Convert has been done successfully Check your Wallets','2020-11-02 11:28:16','2020-11-02 11:28:16'),(170,'en','Something went wrong','Something went wrong','2020-11-02 11:28:16','2020-11-02 11:28:16'),(171,'en','Remaining Uploads','Remaining Uploads','2020-11-02 11:37:13','2020-11-02 11:37:13'),(172,'en','No Package Found','No Package Found','2020-11-02 11:37:13','2020-11-02 11:37:13'),(173,'en','Search product','Search product','2020-11-02 11:37:13','2020-11-02 11:37:13'),(174,'en','Name','Name','2020-11-02 11:37:13','2020-11-02 11:37:13'),(176,'en','Current Qty','Current Qty','2020-11-02 11:37:13','2020-11-02 11:37:13'),(177,'en','Base Price','Base Price','2020-11-02 11:37:13','2020-11-02 11:37:13'),(178,'en','Published','Published','2020-11-02 11:37:13','2020-11-02 11:37:13'),(179,'en','Featured','Featured','2020-11-02 11:37:13','2020-11-02 11:37:13'),(180,'en','Options','Options','2020-11-02 11:37:13','2020-11-02 11:37:13'),(181,'en','Edit','Edit','2020-11-02 11:37:13','2020-11-02 11:37:13'),(182,'en','Duplicate','Duplicate','2020-11-02 11:37:13','2020-11-02 11:37:13'),(184,'en','1. Download the skeleton file and fill it with data.','1. Download the skeleton file and fill it with data.','2020-11-02 11:37:20','2020-11-02 11:37:20'),(185,'en','2. You can download the example file to understand how the data must be filled.','2. You can download the example file to understand how the data must be filled.','2020-11-02 11:37:20','2020-11-02 11:37:20'),(186,'en','3. Once you have downloaded and filled the skeleton file, upload it in the form below and submit.','3. Once you have downloaded and filled the skeleton file, upload it in the form below and submit.','2020-11-02 11:37:20','2020-11-02 11:37:20'),(187,'en','4. After uploading products you need to edit them and set products images and choices.','4. After uploading products you need to edit them and set products images and choices.','2020-11-02 11:37:20','2020-11-02 11:37:20'),(188,'en','Download CSV','Download CSV','2020-11-02 11:37:20','2020-11-02 11:37:20'),(189,'en','1. Category,Sub category,Sub Sub category and Brand should be in numerical ids.','1. Category,Sub category,Sub Sub category and Brand should be in numerical ids.','2020-11-02 11:37:20','2020-11-02 11:37:20'),(190,'en','2. You can download the pdf to get Category,Sub category,Sub Sub category and Brand id.','2. You can download the pdf to get Category,Sub category,Sub Sub category and Brand id.','2020-11-02 11:37:20','2020-11-02 11:37:20'),(191,'en','Download Category','Download Category','2020-11-02 11:37:20','2020-11-02 11:37:20'),(192,'en','Download Sub category','Download Sub category','2020-11-02 11:37:20','2020-11-02 11:37:20'),(193,'en','Download Sub Sub category','Download Sub Sub category','2020-11-02 11:37:20','2020-11-02 11:37:20'),(194,'en','Download Brand','Download Brand','2020-11-02 11:37:20','2020-11-02 11:37:20'),(195,'en','Upload CSV File','Upload CSV File','2020-11-02 11:37:20','2020-11-02 11:37:20'),(196,'en','CSV','CSV','2020-11-02 11:37:20','2020-11-02 11:37:20'),(197,'en','Choose CSV File','Choose CSV File','2020-11-02 11:37:20','2020-11-02 11:37:20'),(198,'en','Upload','Upload','2020-11-02 11:37:20','2020-11-02 11:37:20'),(199,'en','Add New Digital Product','Add New Digital Product','2020-11-02 11:37:25','2020-11-02 11:37:25'),(200,'en','Available Status','Available Status','2020-11-02 11:37:29','2020-11-02 11:37:29'),(201,'en','Admin Status','Admin Status','2020-11-02 11:37:29','2020-11-02 11:37:29'),(202,'en','Pending Balance','Pending Balance','2020-11-02 11:38:07','2020-11-02 11:38:07'),(203,'en','Send Withdraw Request','Send Withdraw Request','2020-11-02 11:38:07','2020-11-02 11:38:07'),(204,'en','Withdraw Request history','Withdraw Request history','2020-11-02 11:38:07','2020-11-02 11:38:07'),(205,'en','Amount','Amount','2020-11-02 11:38:07','2020-11-02 11:38:07'),(206,'en','Status','Status','2020-11-02 11:38:07','2020-11-02 11:38:07'),(207,'en','Message','Message','2020-11-02 11:38:07','2020-11-02 11:38:07'),(208,'en','Send A Withdraw Request','Send A Withdraw Request','2020-11-02 11:38:07','2020-11-02 11:38:07'),(209,'en','Basic Info','Basic Info','2020-11-02 11:38:13','2020-11-02 11:38:13'),(211,'en','Your Phone','Your Phone','2020-11-02 11:38:13','2020-11-02 11:38:13'),(212,'en','Photo','Photo','2020-11-02 11:38:13','2020-11-02 11:38:13'),(213,'en','Browse','Browse','2020-11-02 11:38:13','2020-11-02 11:38:13'),(215,'en','Your Password','Your Password','2020-11-02 11:38:13','2020-11-02 11:38:13'),(216,'en','New Password','New Password','2020-11-02 11:38:14','2020-11-02 11:38:14'),(217,'en','Confirm Password','Confirm Password','2020-11-02 11:38:14','2020-11-02 11:38:14'),(218,'en','Add New Address','Add New Address','2020-11-02 11:38:14','2020-11-02 11:38:14'),(219,'en','Payment Setting','Payment Setting','2020-11-02 11:38:14','2020-11-02 11:38:14'),(220,'en','Cash Payment','Cash Payment','2020-11-02 11:38:14','2020-11-02 11:38:14'),(221,'en','Bank Payment','Bank Payment','2020-11-02 11:38:14','2020-11-02 11:38:14'),(222,'en','Bank Name','Bank Name','2020-11-02 11:38:14','2020-11-02 11:38:14'),(223,'en','Bank Account Name','Bank Account Name','2020-11-02 11:38:14','2020-11-02 11:38:14'),(224,'en','Bank Account Number','Bank Account Number','2020-11-02 11:38:14','2020-11-02 11:38:14'),(225,'en','Bank Routing Number','Bank Routing Number','2020-11-02 11:38:14','2020-11-02 11:38:14'),(226,'en','Update Profile','Update Profile','2020-11-02 11:38:14','2020-11-02 11:38:14'),(227,'en','Change your email','Change your email','2020-11-02 11:38:14','2020-11-02 11:38:14'),(228,'en','Your Email','Your Email','2020-11-02 11:38:14','2020-11-02 11:38:14'),(229,'en','Sending Email...','Sending Email...','2020-11-02 11:38:14','2020-11-02 11:38:14'),(230,'en','Verify','Verify','2020-11-02 11:38:14','2020-11-02 11:38:14'),(231,'en','Update Email','Update Email','2020-11-02 11:38:14','2020-11-02 11:38:14'),(232,'en','New Address','New Address','2020-11-02 11:38:14','2020-11-02 11:38:14'),(233,'en','Your Address','Your Address','2020-11-02 11:38:14','2020-11-02 11:38:14'),(234,'en','Country','Country','2020-11-02 11:38:14','2020-11-02 11:38:14'),(235,'en','Select your country','Select your country','2020-11-02 11:38:14','2020-11-02 11:38:14'),(236,'en','City','City','2020-11-02 11:38:14','2020-11-02 11:38:14'),(237,'en','Your City','Your City','2020-11-02 11:38:14','2020-11-02 11:38:14'),(239,'en','Your Postal Code','Your Postal Code','2020-11-02 11:38:14','2020-11-02 11:38:14'),(240,'en','+880','+880','2020-11-02 11:38:14','2020-11-02 11:38:14'),(241,'en','Save','Save','2020-11-02 11:38:14','2020-11-02 11:38:14'),(242,'en','Received Refund Request','Received Refund Request','2020-11-02 11:56:20','2020-11-02 11:56:20'),(244,'en','Delete Confirmation','Delete Confirmation','2020-11-02 11:56:20','2020-11-02 11:56:20'),(245,'en','Are you sure to delete this?','Are you sure to delete this?','2020-11-02 11:56:21','2020-11-02 11:56:21'),(246,'en','Premium Packages for Sellers','Premium Packages for Sellers','2020-11-02 11:57:36','2020-11-02 11:57:36'),(247,'en','Product Upload','Product Upload','2020-11-02 11:57:36','2020-11-02 11:57:36'),(248,'en','Digital Product Upload','Digital Product Upload','2020-11-02 11:57:36','2020-11-02 11:57:36'),(250,'en','Purchase Package','Purchase Package','2020-11-02 11:57:36','2020-11-02 11:57:36'),(251,'en','Select Payment Type','Select Payment Type','2020-11-02 11:57:36','2020-11-02 11:57:36'),(252,'en','Payment Type','Payment Type','2020-11-02 11:57:36','2020-11-02 11:57:36'),(253,'en','Select One','Select One','2020-11-02 11:57:36','2020-11-02 11:57:36'),(254,'en','Online payment','Online payment','2020-11-02 11:57:37','2020-11-02 11:57:37'),(255,'en','Offline payment','Offline payment','2020-11-02 11:57:37','2020-11-02 11:57:37'),(256,'en','Purchase Your Package','Purchase Your Package','2020-11-02 11:57:37','2020-11-02 11:57:37'),(258,'en','Paypal','Paypal','2020-11-02 11:57:37','2020-11-02 11:57:37'),(259,'en','Stripe','Stripe','2020-11-02 11:57:37','2020-11-02 11:57:37'),(260,'en','sslcommerz','sslcommerz','2020-11-02 11:57:37','2020-11-02 11:57:37'),(265,'en','Confirm','Confirm','2020-11-02 11:57:37','2020-11-02 11:57:37'),(266,'en','Offline Package Payment','Offline Package Payment','2020-11-02 11:57:37','2020-11-02 11:57:37'),(267,'en','Transaction ID','Transaction ID','2020-11-02 12:30:12','2020-11-02 12:30:12'),(268,'en','Choose image','Choose image','2020-11-02 12:30:12','2020-11-02 12:30:12'),(269,'en','Code','Code','2020-11-02 12:42:00','2020-11-02 12:42:00'),(270,'en','Delivery Status','Delivery Status','2020-11-02 12:42:00','2020-11-02 12:42:00'),(271,'en','Payment Status','Payment Status','2020-11-02 12:42:00','2020-11-02 12:42:00'),(272,'en','Paid','Paid','2020-11-02 12:42:00','2020-11-02 12:42:00'),(273,'en','Order Details','Order Details','2020-11-02 12:42:00','2020-11-02 12:42:00'),(274,'en','Download Invoice','Download Invoice','2020-11-02 12:42:00','2020-11-02 12:42:00'),(275,'en','Unpaid','Unpaid','2020-11-02 12:42:00','2020-11-02 12:42:00'),(277,'en','Order placed','Order placed','2020-11-02 12:43:59','2020-11-02 12:43:59'),(278,'en','Confirmed','Confirmed','2020-11-02 12:43:59','2020-11-02 12:43:59'),(279,'en','On delivery','On delivery','2020-11-02 12:43:59','2020-11-02 12:43:59'),(280,'en','Delivered','Delivered','2020-11-02 12:43:59','2020-11-02 12:43:59'),(281,'en','Order Summary','Order Summary','2020-11-02 12:43:59','2020-11-02 12:43:59'),(282,'en','Order Code','Order Code','2020-11-02 12:43:59','2020-11-02 12:43:59'),(283,'en','Customer','Customer','2020-11-02 12:43:59','2020-11-02 12:43:59'),(287,'en','Total order amount','Total order amount','2020-11-02 12:43:59','2020-11-02 12:43:59'),(288,'en','Shipping metdod','Shipping metdod','2020-11-02 12:43:59','2020-11-02 12:43:59'),(289,'en','Flat shipping rate','Flat shipping rate','2020-11-02 12:44:00','2020-11-02 12:44:00'),(290,'en','Payment metdod','Payment metdod','2020-11-02 12:44:00','2020-11-02 12:44:00'),(291,'en','Variation','Variation','2020-11-02 12:44:00','2020-11-02 12:44:00'),(292,'en','Delivery Type','Delivery Type','2020-11-02 12:44:00','2020-11-02 12:44:00'),(293,'en','Home Delivery','Home Delivery','2020-11-02 12:44:00','2020-11-02 12:44:00'),(294,'en','Order Ammount','Order Ammount','2020-11-02 12:44:00','2020-11-02 12:44:00'),(295,'en','Subtotal','Subtotal','2020-11-02 12:44:00','2020-11-02 12:44:00'),(296,'en','Shipping','Shipping','2020-11-02 12:44:00','2020-11-02 12:44:00'),(298,'en','Coupon Discount','Coupon Discount','2020-11-02 12:44:00','2020-11-02 12:44:00'),(300,'en','N/A','N/A','2020-11-02 12:44:20','2020-11-02 12:44:20'),(301,'en','In stock','In stock','2020-11-02 12:54:52','2020-11-02 12:54:52'),(302,'en','Buy Now','Buy Now','2020-11-02 12:54:52','2020-11-02 12:54:52'),(303,'en','Item added to your cart!','Item added to your cart!','2020-11-02 12:56:46','2020-11-02 12:56:46'),(304,'en','Proceed to Checkout','Proceed to Checkout','2020-11-02 12:56:46','2020-11-02 12:56:46'),(305,'en','Cart Items','Cart Items','2020-11-02 12:56:46','2020-11-02 12:56:46'),(306,'en','1. My Cart','1. My Cart','2020-11-02 12:56:46','2020-11-02 12:56:46'),(307,'en','View cart','View cart','2020-11-02 12:56:46','2020-11-02 12:56:46'),(308,'en','2. Shipping info','2. Shipping info','2020-11-02 12:56:46','2020-11-02 12:56:46'),(309,'en','Checkout','Checkout','2020-11-02 12:56:46','2020-11-02 12:56:46'),(310,'en','3. Delivery info','3. Delivery info','2020-11-02 12:56:46','2020-11-02 12:56:46'),(311,'en','4. Payment','4. Payment','2020-11-02 12:56:46','2020-11-02 12:56:46'),(312,'en','5. Confirmation','5. Confirmation','2020-11-02 12:56:46','2020-11-02 12:56:46'),(313,'en','Remove','Remove','2020-11-02 12:56:46','2020-11-02 12:56:46'),(314,'en','Return to shop','Return to shop','2020-11-02 12:56:46','2020-11-02 12:56:46'),(315,'en','Continue to Shipping','Continue to Shipping','2020-11-02 12:56:46','2020-11-02 12:56:46'),(316,'en','Or','Or','2020-11-02 12:56:46','2020-11-02 12:56:46'),(317,'en','Guest Checkout','Guest Checkout','2020-11-02 12:56:46','2020-11-02 12:56:46'),(318,'en','Continue to Delivery Info','Continue to Delivery Info','2020-11-02 12:57:44','2020-11-02 12:57:44'),(319,'en','Postal Code','Postal Code','2020-11-02 13:01:01','2020-11-02 13:01:01'),(320,'en','Choose Delivery Type','Choose Delivery Type','2020-11-02 13:01:04','2020-11-02 13:01:04'),(321,'en','Local Pickup','Local Pickup','2020-11-02 13:01:04','2020-11-02 13:01:04'),(322,'en','Select your nearest pickup point','Select your nearest pickup point','2020-11-02 13:01:04','2020-11-02 13:01:04'),(323,'en','Continue to Payment','Continue to Payment','2020-11-02 13:01:04','2020-11-02 13:01:04'),(324,'en','Select a payment option','Select a payment option','2020-11-02 13:01:13','2020-11-02 13:01:13'),(325,'en','Razorpay','Razorpay','2020-11-02 13:01:13','2020-11-02 13:01:13'),(326,'en','Paystack','Paystack','2020-11-02 13:01:13','2020-11-02 13:01:13'),(327,'en','VoguePay','VoguePay','2020-11-02 13:01:13','2020-11-02 13:01:13'),(328,'en','payhere','payhere','2020-11-02 13:01:13','2020-11-02 13:01:13'),(329,'en','ngenius','ngenius','2020-11-02 13:01:13','2020-11-02 13:01:13'),(330,'en','Paytm','Paytm','2020-11-02 13:01:13','2020-11-02 13:01:13'),(331,'en','Cash on Delivery','Cash on Delivery','2020-11-02 13:01:13','2020-11-02 13:01:13'),(332,'en','Your wallet balance :','Your wallet balance :','2020-11-02 13:01:13','2020-11-02 13:01:13'),(333,'en','Insufficient balance','Insufficient balance','2020-11-02 13:01:13','2020-11-02 13:01:13'),(334,'en','I agree to the','I agree to the','2020-11-02 13:01:14','2020-11-02 13:01:14'),(338,'en','Complete Order','Complete Order','2020-11-02 13:01:14','2020-11-02 13:01:14'),(339,'en','Summary','Summary','2020-11-02 13:01:14','2020-11-02 13:01:14'),(340,'en','Items','Items','2020-11-02 13:01:14','2020-11-02 13:01:14'),(341,'en','Total Club point','Total Club point','2020-11-02 13:01:14','2020-11-02 13:01:14'),(342,'en','Total Shipping','Total Shipping','2020-11-02 13:01:14','2020-11-02 13:01:14'),(343,'en','Have coupon code? Enter here','Have coupon code? Enter here','2020-11-02 13:01:14','2020-11-02 13:01:14'),(344,'en','Apply','Apply','2020-11-02 13:01:14','2020-11-02 13:01:14'),(345,'en','You need to agree with our policies','You need to agree with our policies','2020-11-02 13:01:14','2020-11-02 13:01:14'),(346,'en','Forgot password','Forgot password','2020-11-02 13:01:25','2020-11-02 13:01:25'),(469,'en','SEO Setting','SEO Setting','2020-11-02 13:01:33','2020-11-02 13:01:33'),(474,'en','System Update','System Update','2020-11-02 13:01:34','2020-11-02 13:01:34'),(480,'en','Add New Payment Method','Add New Payment Method','2020-11-02 13:01:38','2020-11-02 13:01:38'),(481,'en','Manual Payment Method','Manual Payment Method','2020-11-02 13:01:38','2020-11-02 13:01:38'),(482,'en','Heading','Heading','2020-11-02 13:01:38','2020-11-02 13:01:38'),(483,'en','Logo','Logo','2020-11-02 13:01:38','2020-11-02 13:01:38'),(484,'en','Manual Payment Information','Manual Payment Information','2020-11-02 13:01:42','2020-11-02 13:01:42'),(485,'en','Type','Type','2020-11-02 13:01:42','2020-11-02 13:01:42'),(486,'en','Custom Payment','Custom Payment','2020-11-02 13:01:42','2020-11-02 13:01:42'),(487,'en','Check Payment','Check Payment','2020-11-02 13:01:42','2020-11-02 13:01:42'),(488,'en','Checkout Thumbnail','Checkout Thumbnail','2020-11-02 13:01:42','2020-11-02 13:01:42'),(489,'en','Payment Instruction','Payment Instruction','2020-11-02 13:01:42','2020-11-02 13:01:42'),(490,'en','Bank Information','Bank Information','2020-11-02 13:01:42','2020-11-02 13:01:42'),(491,'en','Select File','Select File','2020-11-02 13:01:53','2020-11-02 13:01:53'),(492,'en','Upload New','Upload New','2020-11-02 13:01:53','2020-11-02 13:01:53'),(493,'en','Sort by newest','Sort by newest','2020-11-02 13:01:53','2020-11-02 13:01:53'),(494,'en','Sort by oldest','Sort by oldest','2020-11-02 13:01:53','2020-11-02 13:01:53'),(495,'en','Sort by smallest','Sort by smallest','2020-11-02 13:01:53','2020-11-02 13:01:53'),(496,'en','Sort by largest','Sort by largest','2020-11-02 13:01:53','2020-11-02 13:01:53'),(497,'en','Selected Only','Selected Only','2020-11-02 13:01:53','2020-11-02 13:01:53'),(498,'en','No files found','No files found','2020-11-02 13:01:53','2020-11-02 13:01:53'),(499,'en','0 File selected','0 File selected','2020-11-02 13:01:53','2020-11-02 13:01:53'),(500,'en','Clear','Clear','2020-11-02 13:01:53','2020-11-02 13:01:53'),(501,'en','Prev','Prev','2020-11-02 13:01:53','2020-11-02 13:01:53'),(502,'en','Next','Next','2020-11-02 13:01:53','2020-11-02 13:01:53'),(503,'en','Add Files','Add Files','2020-11-02 13:01:53','2020-11-02 13:01:53'),(504,'en','Method has been inserted successfully','Method has been inserted successfully','2020-11-02 13:02:03','2020-11-02 13:02:03'),(506,'en','Order Date','Order Date','2020-11-02 13:02:42','2020-11-02 13:02:42'),(507,'en','Bill to','Bill to','2020-11-02 13:02:42','2020-11-02 13:02:42'),(510,'en','Sub Total','Sub Total','2020-11-02 13:02:42','2020-11-02 13:02:42'),(512,'en','Total Tax','Total Tax','2020-11-02 13:02:42','2020-11-02 13:02:42'),(513,'en','Grand Total','Grand Total','2020-11-02 13:02:42','2020-11-02 13:02:42'),(514,'en','Your order has been placed successfully. Please submit payment information from purchase history','Your order has been placed successfully. Please submit payment information from purchase history','2020-11-02 13:02:47','2020-11-02 13:02:47'),(515,'en','Thank You for Your Order!','Thank You for Your Order!','2020-11-02 13:02:48','2020-11-02 13:02:48'),(516,'en','Order Code:','Order Code:','2020-11-02 13:02:48','2020-11-02 13:02:48'),(517,'en','A copy or your order summary has been sent to','A copy or your order summary has been sent to','2020-11-02 13:02:48','2020-11-02 13:02:48'),(518,'en','Make Payment','Make Payment','2020-11-02 13:03:26','2020-11-02 13:03:26'),(519,'en','Payment screenshot','Payment screenshot','2020-11-02 13:03:29','2020-11-02 13:03:29'),(520,'en','Paypal Credential','Paypal Credential','2020-11-02 13:12:20','2020-11-02 13:12:20'),(522,'en','Paypal Client ID','Paypal Client ID','2020-11-02 13:12:20','2020-11-02 13:12:20'),(523,'en','Paypal Client Secret','Paypal Client Secret','2020-11-02 13:12:20','2020-11-02 13:12:20'),(524,'en','Paypal Sandbox Mode','Paypal Sandbox Mode','2020-11-02 13:12:20','2020-11-02 13:12:20'),(525,'en','Sslcommerz Credential','Sslcommerz Credential','2020-11-02 13:12:21','2020-11-02 13:12:21'),(526,'en','Sslcz Store Id','Sslcz Store Id','2020-11-02 13:12:21','2020-11-02 13:12:21'),(527,'en','Sslcz store password','Sslcz store password','2020-11-02 13:12:21','2020-11-02 13:12:21'),(528,'en','Sslcommerz Sandbox Mode','Sslcommerz Sandbox Mode','2020-11-02 13:12:21','2020-11-02 13:12:21'),(529,'en','Stripe Credential','Stripe Credential','2020-11-02 13:12:21','2020-11-02 13:12:21'),(531,'en','STRIPE KEY','STRIPE KEY','2020-11-02 13:12:21','2020-11-02 13:12:21'),(533,'en','STRIPE SECRET','STRIPE SECRET','2020-11-02 13:12:21','2020-11-02 13:12:21'),(534,'en','RazorPay Credential','RazorPay Credential','2020-11-02 13:12:21','2020-11-02 13:12:21'),(535,'en','RAZOR KEY','RAZOR KEY','2020-11-02 13:12:21','2020-11-02 13:12:21'),(536,'en','RAZOR SECRET','RAZOR SECRET','2020-11-02 13:12:21','2020-11-02 13:12:21'),(537,'en','Instamojo Credential','Instamojo Credential','2020-11-02 13:12:21','2020-11-02 13:12:21'),(538,'en','API KEY','API KEY','2020-11-02 13:12:21','2020-11-02 13:12:21'),(539,'en','IM API KEY','IM API KEY','2020-11-02 13:12:21','2020-11-02 13:12:21'),(540,'en','AUTH TOKEN','AUTH TOKEN','2020-11-02 13:12:21','2020-11-02 13:12:21'),(541,'en','IM AUTH TOKEN','IM AUTH TOKEN','2020-11-02 13:12:21','2020-11-02 13:12:21'),(542,'en','Instamojo Sandbox Mode','Instamojo Sandbox Mode','2020-11-02 13:12:21','2020-11-02 13:12:21'),(543,'en','PayStack Credential','PayStack Credential','2020-11-02 13:12:21','2020-11-02 13:12:21'),(544,'en','PUBLIC KEY','PUBLIC KEY','2020-11-02 13:12:21','2020-11-02 13:12:21'),(545,'en','SECRET KEY','SECRET KEY','2020-11-02 13:12:21','2020-11-02 13:12:21'),(546,'en','MERCHANT EMAIL','MERCHANT EMAIL','2020-11-02 13:12:21','2020-11-02 13:12:21'),(547,'en','VoguePay Credential','VoguePay Credential','2020-11-02 13:12:21','2020-11-02 13:12:21'),(548,'en','MERCHANT ID','MERCHANT ID','2020-11-02 13:12:21','2020-11-02 13:12:21'),(549,'en','Sandbox Mode','Sandbox Mode','2020-11-02 13:12:21','2020-11-02 13:12:21'),(550,'en','Payhere Credential','Payhere Credential','2020-11-02 13:12:21','2020-11-02 13:12:21'),(551,'en','PAYHERE MERCHANT ID','PAYHERE MERCHANT ID','2020-11-02 13:12:22','2020-11-02 13:12:22'),(552,'en','PAYHERE SECRET','PAYHERE SECRET','2020-11-02 13:12:22','2020-11-02 13:12:22'),(553,'en','PAYHERE CURRENCY','PAYHERE CURRENCY','2020-11-02 13:12:22','2020-11-02 13:12:22'),(554,'en','Payhere Sandbox Mode','Payhere Sandbox Mode','2020-11-02 13:12:22','2020-11-02 13:12:22'),(555,'en','Ngenius Credential','Ngenius Credential','2020-11-02 13:12:22','2020-11-02 13:12:22'),(556,'en','NGENIUS OUTLET ID','NGENIUS OUTLET ID','2020-11-02 13:12:22','2020-11-02 13:12:22'),(557,'en','NGENIUS API KEY','NGENIUS API KEY','2020-11-02 13:12:22','2020-11-02 13:12:22'),(558,'en','NGENIUS CURRENCY','NGENIUS CURRENCY','2020-11-02 13:12:22','2020-11-02 13:12:22'),(559,'en','Mpesa Credential','Mpesa Credential','2020-11-02 13:12:22','2020-11-02 13:12:22'),(560,'en','MPESA CONSUMER KEY','MPESA CONSUMER KEY','2020-11-02 13:12:22','2020-11-02 13:12:22'),(561,'en','MPESA_CONSUMER_KEY','MPESA_CONSUMER_KEY','2020-11-02 13:12:22','2020-11-02 13:12:22'),(562,'en','MPESA CONSUMER SECRET','MPESA CONSUMER SECRET','2020-11-02 13:12:22','2020-11-02 13:12:22'),(563,'en','MPESA_CONSUMER_SECRET','MPESA_CONSUMER_SECRET','2020-11-02 13:12:22','2020-11-02 13:12:22'),(564,'en','MPESA SHORT CODE','MPESA SHORT CODE','2020-11-02 13:12:22','2020-11-02 13:12:22'),(565,'en','MPESA_SHORT_CODE','MPESA_SHORT_CODE','2020-11-02 13:12:22','2020-11-02 13:12:22'),(566,'en','MPESA SANDBOX ACTIVATION','MPESA SANDBOX ACTIVATION','2020-11-02 13:12:22','2020-11-02 13:12:22'),(567,'en','Flutterwave Credential','Flutterwave Credential','2020-11-02 13:12:22','2020-11-02 13:12:22'),(568,'en','RAVE_PUBLIC_KEY','RAVE_PUBLIC_KEY','2020-11-02 13:12:22','2020-11-02 13:12:22'),(569,'en','RAVE_SECRET_KEY','RAVE_SECRET_KEY','2020-11-02 13:12:22','2020-11-02 13:12:22'),(570,'en','RAVE_TITLE','RAVE_TITLE','2020-11-02 13:12:22','2020-11-02 13:12:22'),(571,'en','STAGIN ACTIVATION','STAGIN ACTIVATION','2020-11-02 13:12:22','2020-11-02 13:12:22'),(573,'en','All Product','All Product','2020-11-02 13:15:01','2020-11-02 13:15:01'),(574,'en','Sort By','Sort By','2020-11-02 13:15:01','2020-11-02 13:15:01'),(575,'en','Rating (High > Low)','Rating (High > Low)','2020-11-02 13:15:01','2020-11-02 13:15:01'),(576,'en','Rating (Low > High)','Rating (Low > High)','2020-11-02 13:15:01','2020-11-02 13:15:01'),(577,'en','Num of Sale (High > Low)','Num of Sale (High > Low)','2020-11-02 13:15:01','2020-11-02 13:15:01'),(578,'en','Num of Sale (Low > High)','Num of Sale (Low > High)','2020-11-02 13:15:01','2020-11-02 13:15:01'),(579,'en','Base Price (High > Low)','Base Price (High > Low)','2020-11-02 13:15:01','2020-11-02 13:15:01'),(580,'en','Base Price (Low > High)','Base Price (Low > High)','2020-11-02 13:15:01','2020-11-02 13:15:01'),(581,'en','Type & Enter','Type & Enter','2020-11-02 13:15:01','2020-11-02 13:15:01'),(582,'en','Added By','Added By','2020-11-02 13:15:01','2020-11-02 13:15:01'),(583,'en','Num of Sale','Num of Sale','2020-11-02 13:15:01','2020-11-02 13:15:01'),(584,'en','Total Stock','Total Stock','2020-11-02 13:15:01','2020-11-02 13:15:01'),(585,'en','Todays Deal','Todays Deal','2020-11-02 13:15:01','2020-11-02 13:15:01'),(586,'en','Rating','Rating','2020-11-02 13:15:01','2020-11-02 13:15:01'),(587,'en','times','times','2020-11-02 13:15:01','2020-11-02 13:15:01'),(588,'en','Add Nerw Product','Add Nerw Product','2020-11-02 13:15:02','2020-11-02 13:15:02'),(589,'en','Product Information','Product Information','2020-11-02 13:15:02','2020-11-02 13:15:02'),(590,'en','Unit','Unit','2020-11-02 13:15:02','2020-11-02 13:15:02'),(591,'en','Unit (e.g. KG, Pc etc)','Unit (e.g. KG, Pc etc)','2020-11-02 13:15:03','2020-11-02 13:15:03'),(592,'en','Minimum Qty','Minimum Qty','2020-11-02 13:15:03','2020-11-02 13:15:03'),(593,'en','Tags','Tags','2020-11-02 13:15:03','2020-11-02 13:15:03'),(594,'en','Type and hit enter to add a tag','Type and hit enter to add a tag','2020-11-02 13:15:03','2020-11-02 13:15:03'),(595,'en','Barcode','Barcode','2020-11-02 13:15:03','2020-11-02 13:15:03'),(596,'en','Refundable','Refundable','2020-11-02 13:15:03','2020-11-02 13:15:03'),(597,'en','Product Images','Product Images','2020-11-02 13:15:03','2020-11-02 13:15:03'),(598,'en','Gallery Images','Gallery Images','2020-11-02 13:15:03','2020-11-02 13:15:03'),(599,'en','Todays Deal updated successfully','Todays Deal updated successfully','2020-11-02 13:15:03','2020-11-02 13:15:03'),(600,'en','Published products updated successfully','Published products updated successfully','2020-11-02 13:15:03','2020-11-02 13:15:03'),(601,'en','Thumbnail Image','Thumbnail Image','2020-11-02 13:15:03','2020-11-02 13:15:03'),(602,'en','Featured products updated successfully','Featured products updated successfully','2020-11-02 13:15:03','2020-11-02 13:15:03'),(603,'en','Product Videos','Product Videos','2020-11-02 13:15:03','2020-11-02 13:15:03'),(604,'en','Video Provider','Video Provider','2020-11-02 13:15:03','2020-11-02 13:15:03'),(605,'en','Youtube','Youtube','2020-11-02 13:15:03','2020-11-02 13:15:03'),(606,'en','Dailymotion','Dailymotion','2020-11-02 13:15:03','2020-11-02 13:15:03'),(607,'en','Vimeo','Vimeo','2020-11-02 13:15:03','2020-11-02 13:15:03'),(608,'en','Video Link','Video Link','2020-11-02 13:15:03','2020-11-02 13:15:03'),(609,'en','Product Variation','Product Variation','2020-11-02 13:15:03','2020-11-02 13:15:03'),(610,'en','Colors','Colors','2020-11-02 13:15:03','2020-11-02 13:15:03'),(611,'en','Attributes','Attributes','2020-11-02 13:15:03','2020-11-02 13:15:03'),(612,'en','Choose Attributes','Choose Attributes','2020-11-02 13:15:03','2020-11-02 13:15:03'),(613,'en','Choose the attributes of this product and then input values of each attribute','Choose the attributes of this product and then input values of each attribute','2020-11-02 13:15:03','2020-11-02 13:15:03'),(614,'en','Product price + stock','Product price + stock','2020-11-02 13:15:03','2020-11-02 13:15:03'),(616,'en','Unit price','Unit price','2020-11-02 13:15:03','2020-11-02 13:15:03'),(617,'en','Purchase price','Purchase price','2020-11-02 13:15:03','2020-11-02 13:15:03'),(618,'en','Flat','Flat','2020-11-02 13:15:04','2020-11-02 13:15:04'),(619,'en','Percent','Percent','2020-11-02 13:15:04','2020-11-02 13:15:04'),(620,'en','Discount','Discount','2020-11-02 13:15:04','2020-11-02 13:15:04'),(621,'en','Product Description','Product Description','2020-11-02 13:15:04','2020-11-02 13:15:04'),(622,'en','Product Shipping Cost','Product Shipping Cost','2020-11-02 13:15:04','2020-11-02 13:15:04'),(623,'en','Free Shipping','Free Shipping','2020-11-02 13:15:04','2020-11-02 13:15:04'),(624,'en','Flat Rate','Flat Rate','2020-11-02 13:15:04','2020-11-02 13:15:04'),(625,'en','Shipping cost','Shipping cost','2020-11-02 13:15:04','2020-11-02 13:15:04'),(626,'en','PDF Specification','PDF Specification','2020-11-02 13:15:04','2020-11-02 13:15:04'),(627,'en','SEO Meta Tags','SEO Meta Tags','2020-11-02 13:15:04','2020-11-02 13:15:04'),(628,'en','Meta Title','Meta Title','2020-11-02 13:15:04','2020-11-02 13:15:04'),(629,'en','Meta Image','Meta Image','2020-11-02 13:15:04','2020-11-02 13:15:04'),(630,'en','Choice Title','Choice Title','2020-11-02 13:15:04','2020-11-02 13:15:04'),(631,'en','Enter choice values','Enter choice values','2020-11-02 13:15:04','2020-11-02 13:15:04'),(632,'en','All categories','All categories','2020-11-03 07:12:19','2020-11-03 07:12:19'),(633,'en','Add New category','Add New category','2020-11-03 07:12:19','2020-11-03 07:12:19'),(634,'en','Type name & Enter','Type name & Enter','2020-11-03 07:12:19','2020-11-03 07:12:19'),(635,'en','Banner','Banner','2020-11-03 07:12:19','2020-11-03 07:12:19'),(637,'en','Commission','Commission','2020-11-03 07:12:19','2020-11-03 07:12:19'),(638,'en','icon','icon','2020-11-03 07:12:19','2020-11-03 07:12:19'),(639,'en','Featured categories updated successfully','Featured categories updated successfully','2020-11-03 07:12:20','2020-11-03 07:12:20'),(640,'en','Hot','Hot','2020-11-03 07:13:12','2020-11-03 07:13:12'),(641,'en','Filter by Payment Status','Filter by Payment Status','2020-11-03 07:15:15','2020-11-03 07:15:15'),(642,'en','Un-Paid','Un-Paid','2020-11-03 07:15:15','2020-11-03 07:15:15'),(643,'en','Filter by Deliver Status','Filter by Deliver Status','2020-11-03 07:15:15','2020-11-03 07:15:15'),(644,'en','Pending','Pending','2020-11-03 07:15:15','2020-11-03 07:15:15'),(645,'en','Type Order code & hit Enter','Type Order code & hit Enter','2020-11-03 07:15:15','2020-11-03 07:15:15'),(646,'en','Num. of Products','Num. of Products','2020-11-03 07:15:15','2020-11-03 07:15:15'),(647,'en','Walk In Customer','Walk In Customer','2020-11-03 10:03:20','2020-11-03 10:03:20'),(648,'en','QTY','QTY','2020-11-03 10:03:20','2020-11-03 10:03:20'),(649,'en','Without Shipping Charge','Without Shipping Charge','2020-11-03 10:03:20','2020-11-03 10:03:20'),(650,'en','With Shipping Charge','With Shipping Charge','2020-11-03 10:03:20','2020-11-03 10:03:20'),(651,'en','Pay With Cash','Pay With Cash','2020-11-03 10:03:20','2020-11-03 10:03:20'),(652,'en','Shipping Address','Shipping Address','2020-11-03 10:03:20','2020-11-03 10:03:20'),(653,'en','Close','Close','2020-11-03 10:03:20','2020-11-03 10:03:20'),(654,'en','Select country','Select country','2020-11-03 10:03:21','2020-11-03 10:03:21'),(655,'en','Order Confirmation','Order Confirmation','2020-11-03 10:03:21','2020-11-03 10:03:21'),(656,'en','Are you sure to confirm this order?','Are you sure to confirm this order?','2020-11-03 10:03:21','2020-11-03 10:03:21'),(657,'en','Comfirm Order','Comfirm Order','2020-11-03 10:03:21','2020-11-03 10:03:21'),(659,'en','Personal Info','Personal Info','2020-11-03 11:38:15','2020-11-03 11:38:15'),(660,'en','Repeat Password','Repeat Password','2020-11-03 11:38:15','2020-11-03 11:38:15'),(661,'en','Shop Name','Shop Name','2020-11-03 11:38:15','2020-11-03 11:38:15'),(662,'en','Register Your Shop','Register Your Shop','2020-11-03 11:38:15','2020-11-03 11:38:15'),(663,'en','Affiliate Informations','Affiliate Informations','2020-11-03 11:39:06','2020-11-03 11:39:06'),(664,'en','Affiliate','Affiliate','2020-11-03 11:39:06','2020-11-03 11:39:06'),(665,'en','User Info','User Info','2020-11-03 11:39:06','2020-11-03 11:39:06'),(667,'en','Installed Addon','Installed Addon','2020-11-03 11:48:13','2020-11-03 11:48:13'),(668,'en','Available Addon','Available Addon','2020-11-03 11:48:13','2020-11-03 11:48:13'),(669,'en','Install New Addon','Install New Addon','2020-11-03 11:48:13','2020-11-03 11:48:13'),(670,'en','Version','Version','2020-11-03 11:48:13','2020-11-03 11:48:13'),(671,'en','Activated','Activated','2020-11-03 11:48:13','2020-11-03 11:48:13'),(672,'en','Deactivated','Deactivated','2020-11-03 11:48:13','2020-11-03 11:48:13'),(673,'en','Activate OTP','Activate OTP','2020-11-03 11:48:20','2020-11-03 11:48:20'),(674,'en','OTP will be Used For','OTP will be Used For','2020-11-03 11:48:20','2020-11-03 11:48:20'),(675,'en','Settings updated successfully','Settings updated successfully','2020-11-03 11:48:20','2020-11-03 11:48:20'),(676,'en','Product Owner','Product Owner','2020-11-03 11:48:46','2020-11-03 11:48:46'),(677,'en','Point','Point','2020-11-03 11:48:46','2020-11-03 11:48:46'),(678,'en','Set Point for Product Within a Range','Set Point for Product Within a Range','2020-11-03 11:48:47','2020-11-03 11:48:47'),(679,'en','Set Point for multiple products','Set Point for multiple products','2020-11-03 11:48:47','2020-11-03 11:48:47'),(680,'en','Min Price','Min Price','2020-11-03 11:48:47','2020-11-03 11:48:47'),(681,'en','Max Price','Max Price','2020-11-03 11:48:47','2020-11-03 11:48:47'),(682,'en','Set Point for all Products','Set Point for all Products','2020-11-03 11:48:47','2020-11-03 11:48:47'),(683,'en','Set Point For ','Set Point For ','2020-11-03 11:48:47','2020-11-03 11:48:47'),(684,'en','Convert Status','Convert Status','2020-11-03 11:48:58','2020-11-03 11:48:58'),(685,'en','Earned At','Earned At','2020-11-03 11:48:59','2020-11-03 11:48:59'),(686,'en','Seller Based Selling Report','Seller Based Selling Report','2020-11-03 11:49:35','2020-11-03 11:49:35'),(687,'en','Sort by verificarion status','Sort by verificarion status','2020-11-03 11:49:35','2020-11-03 11:49:35'),(688,'en','Approved','Approved','2020-11-03 11:49:35','2020-11-03 11:49:35'),(689,'en','Non Approved','Non Approved','2020-11-03 11:49:35','2020-11-03 11:49:35'),(690,'en','Filter','Filter','2020-11-03 11:49:35','2020-11-03 11:49:35'),(691,'en','Seller Name','Seller Name','2020-11-03 11:49:35','2020-11-03 11:49:35'),(692,'en','Number of Product Sale','Number of Product Sale','2020-11-03 11:49:36','2020-11-03 11:49:36'),(693,'en','Order Amount','Order Amount','2020-11-03 11:49:36','2020-11-03 11:49:36'),(694,'en','Facebook Chat Setting','Facebook Chat Setting','2020-11-03 11:51:14','2020-11-03 11:51:14'),(695,'en','Facebook Page ID','Facebook Page ID','2020-11-03 11:51:14','2020-11-03 11:51:14'),(696,'en','Please be carefull when you are configuring Facebook chat. For incorrect configuration you will not get messenger icon on your user-end site.','Please be carefull when you are configuring Facebook chat. For incorrect configuration you will not get messenger icon on your user-end site.','2020-11-03 11:51:14','2020-11-03 11:51:14'),(697,'en','Login into your facebook page','Login into your facebook page','2020-11-03 11:51:14','2020-11-03 11:51:14'),(698,'en','Find the About option of your facebook page','Find the About option of your facebook page','2020-11-03 11:51:14','2020-11-03 11:51:14'),(699,'en','At the very bottom, you can find the \\“Facebook Page ID\\”','At the very bottom, you can find the \\“Facebook Page ID\\”','2020-11-03 11:51:14','2020-11-03 11:51:14'),(700,'en','Go to Settings of your page and find the option of \\\"Advance Messaging\\\"','Go to Settings of your page and find the option of \\\"Advance Messaging\\\"','2020-11-03 11:51:14','2020-11-03 11:51:14'),(701,'en','Scroll down that page and you will get \\\"white listed domain\\\"','Scroll down that page and you will get \\\"white listed domain\\\"','2020-11-03 11:51:14','2020-11-03 11:51:14'),(702,'en','Set your website domain name','Set your website domain name','2020-11-03 11:51:14','2020-11-03 11:51:14'),(703,'en','Google reCAPTCHA Setting','Google reCAPTCHA Setting','2020-11-03 11:51:25','2020-11-03 11:51:25'),(704,'en','Site KEY','Site KEY','2020-11-03 11:51:25','2020-11-03 11:51:25'),(705,'en','Select Shipping Method','Select Shipping Method','2020-11-03 11:51:32','2020-11-03 11:51:32'),(706,'en','Product Wise Shipping Cost','Product Wise Shipping Cost','2020-11-03 11:51:32','2020-11-03 11:51:32'),(707,'en','Flat Rate Shipping Cost','Flat Rate Shipping Cost','2020-11-03 11:51:32','2020-11-03 11:51:32'),(708,'en','Seller Wise Flat Shipping Cost','Seller Wise Flat Shipping Cost','2020-11-03 11:51:32','2020-11-03 11:51:32'),(709,'en','Note','Note','2020-11-03 11:51:32','2020-11-03 11:51:32'),(710,'en','Product Wise Shipping Cost calulation: Shipping cost is calculate by addition of each product shipping cost','Product Wise Shipping Cost calulation: Shipping cost is calculate by addition of each product shipping cost','2020-11-03 11:51:32','2020-11-03 11:51:32'),(711,'en','Flat Rate Shipping Cost calulation: How many products a customer purchase, doesn\'t matter. Shipping cost is fixed','Flat Rate Shipping Cost calulation: How many products a customer purchase, doesn\'t matter. Shipping cost is fixed','2020-11-03 11:51:32','2020-11-03 11:51:32'),(712,'en','Seller Wise Flat Shipping Cost calulation: Fixed rate for each seller. If a customer purchase 2 product from two seller shipping cost is calculate by addition of each seller flat shipping cost','Seller Wise Flat Shipping Cost calulation: Fixed rate for each seller. If a customer purchase 2 product from two seller shipping cost is calculate by addition of each seller flat shipping cost','2020-11-03 11:51:32','2020-11-03 11:51:32'),(713,'en','Flat Rate Cost','Flat Rate Cost','2020-11-03 11:51:32','2020-11-03 11:51:32'),(714,'en','Shipping Cost for Admin Products','Shipping Cost for Admin Products','2020-11-03 11:51:32','2020-11-03 11:51:32'),(715,'en','Countries','Countries','2020-11-03 11:52:02','2020-11-03 11:52:02'),(716,'en','Show/Hide','Show/Hide','2020-11-03 11:52:02','2020-11-03 11:52:02'),(717,'en','Country status updated successfully','Country status updated successfully','2020-11-03 11:52:02','2020-11-03 11:52:02'),(718,'en','All Subcategories','All Subcategories','2020-11-03 12:27:55','2020-11-03 12:27:55'),(719,'en','Add New Subcategory','Add New Subcategory','2020-11-03 12:27:55','2020-11-03 12:27:55'),(720,'en','Sub-Categories','Sub-Categories','2020-11-03 12:27:55','2020-11-03 12:27:55'),(721,'en','Sub Category Information','Sub Category Information','2020-11-03 12:28:07','2020-11-03 12:28:07'),(723,'en','Slug','Slug','2020-11-03 12:28:07','2020-11-03 12:28:07'),(724,'en','All Sub Subcategories','All Sub Subcategories','2020-11-03 12:29:12','2020-11-03 12:29:12'),(725,'en','Add New Sub Subcategory','Add New Sub Subcategory','2020-11-03 12:29:12','2020-11-03 12:29:12'),(726,'en','Sub-Sub-categories','Sub-Sub-categories','2020-11-03 12:29:12','2020-11-03 12:29:12'),(727,'en','Make This Default','Make This Default','2020-11-04 08:24:24','2020-11-04 08:24:24'),(728,'en','Shops','Shops','2020-11-04 11:17:10','2020-11-04 11:17:10'),(729,'en','Women Clothing & Fashion','Women Clothing & Fashion','2020-11-04 11:23:12','2020-11-04 11:23:12'),(730,'en','Cellphones & Tabs','Cellphones & Tabs','2020-11-04 12:10:41','2020-11-04 12:10:41'),(731,'en','Welcome to','Welcome to','2020-11-07 07:14:43','2020-11-07 07:14:43'),(732,'en','Create a New Account','Create a New Account','2020-11-07 07:32:15','2020-11-07 07:32:15'),(733,'en','Full Name','Full Name','2020-11-07 07:32:15','2020-11-07 07:32:15'),(734,'en','password','password','2020-11-07 07:32:15','2020-11-07 07:32:15'),(735,'en','Confrim Password','Confrim Password','2020-11-07 07:32:15','2020-11-07 07:32:15'),(736,'en','I agree with the','I agree with the','2020-11-07 07:32:15','2020-11-07 07:32:15'),(737,'en','Terms and Conditions','Terms and Conditions','2020-11-07 07:32:15','2020-11-07 07:32:15'),(738,'en','Register','Register','2020-11-07 07:32:15','2020-11-07 07:32:15'),(739,'en','Already have an account','Already have an account','2020-11-07 07:32:16','2020-11-07 07:32:16'),(741,'en','Sign Up with','Sign Up with','2020-11-07 07:32:16','2020-11-07 07:32:16'),(742,'en','I agree with the Terms and Conditions','I agree with the Terms and Conditions','2020-11-07 07:34:49','2020-11-07 07:34:49'),(745,'en','All Role','All Role','2020-11-07 07:44:28','2020-11-07 07:44:28'),(746,'en','Add New Role','Add New Role','2020-11-07 07:44:28','2020-11-07 07:44:28'),(747,'en','Roles','Roles','2020-11-07 07:44:28','2020-11-07 07:44:28'),(749,'en','Add New Staffs','Add New Staffs','2020-11-07 07:44:36','2020-11-07 07:44:36'),(750,'en','Role','Role','2020-11-07 07:44:36','2020-11-07 07:44:36'),(751,'en','Frontend Website Name','Frontend Website Name','2020-11-07 07:44:59','2020-11-07 07:44:59'),(752,'en','Website Name','Website Name','2020-11-07 07:44:59','2020-11-07 07:44:59'),(753,'en','Site Motto','Site Motto','2020-11-07 07:44:59','2020-11-07 07:44:59'),(754,'en','Best eCommerce Website','Best eCommerce Website','2020-11-07 07:44:59','2020-11-07 07:44:59'),(755,'en','Site Icon','Site Icon','2020-11-07 07:44:59','2020-11-07 07:44:59'),(756,'en','Website favicon. 32x32 .png','Website favicon. 32x32 .png','2020-11-07 07:44:59','2020-11-07 07:44:59'),(757,'en','Website Base Color','Website Base Color','2020-11-07 07:44:59','2020-11-07 07:44:59'),(758,'en','Hex Color Code','Hex Color Code','2020-11-07 07:44:59','2020-11-07 07:44:59'),(759,'en','Website Base Hover Color','Website Base Hover Color','2020-11-07 07:44:59','2020-11-07 07:44:59'),(760,'en','Update','Update','2020-11-07 07:45:00','2020-11-07 07:45:00'),(761,'en','Global Seo','Global Seo','2020-11-07 07:45:00','2020-11-07 07:45:00'),(762,'en','Meta description','Meta description','2020-11-07 07:45:00','2020-11-07 07:45:00'),(763,'en','Keywords','Keywords','2020-11-07 07:45:00','2020-11-07 07:45:00'),(764,'en','Separate with coma','Separate with coma','2020-11-07 07:45:00','2020-11-07 07:45:00'),(765,'en','Website Pages','Website Pages','2020-11-07 07:49:04','2020-11-07 07:49:04'),(766,'en','All Pages','All Pages','2020-11-07 07:49:04','2020-11-07 07:49:04'),(767,'en','Add New Page','Add New Page','2020-11-07 07:49:04','2020-11-07 07:49:04'),(768,'en','URL','URL','2020-11-07 07:49:04','2020-11-07 07:49:04'),(769,'en','Actions','Actions','2020-11-07 07:49:04','2020-11-07 07:49:04'),(770,'en','Edit Page Information','Edit Page Information','2020-11-07 07:49:22','2020-11-07 07:49:22'),(771,'en','Page Content','Page Content','2020-11-07 07:49:22','2020-11-07 07:49:22'),(772,'en','Title','Title','2020-11-07 07:49:22','2020-11-07 07:49:22'),(773,'en','Link','Link','2020-11-07 07:49:22','2020-11-07 07:49:22'),(774,'en','Use character, number, hypen only','Use character, number, hypen only','2020-11-07 07:49:22','2020-11-07 07:49:22'),(775,'en','Add Content','Add Content','2020-11-07 07:49:22','2020-11-07 07:49:22'),(776,'en','Seo Fields','Seo Fields','2020-11-07 07:49:22','2020-11-07 07:49:22'),(777,'en','Update Page','Update Page','2020-11-07 07:49:22','2020-11-07 07:49:22'),(778,'en','Default Language','Default Language','2020-11-07 07:50:09','2020-11-07 07:50:09'),(779,'en','Add New Language','Add New Language','2020-11-07 07:50:09','2020-11-07 07:50:09'),(780,'en','RTL','RTL','2020-11-07 07:50:09','2020-11-07 07:50:09'),(781,'en','Translation','Translation','2020-11-07 07:50:09','2020-11-07 07:50:09'),(782,'en','Language Information','Language Information','2020-11-07 07:50:23','2020-11-07 07:50:23'),(783,'en','Save Page','Save Page','2020-11-07 07:51:27','2020-11-07 07:51:27'),(784,'en','Home Page Settings','Home Page Settings','2020-11-07 07:51:35','2020-11-07 07:51:35'),(785,'en','Home Slider','Home Slider','2020-11-07 07:51:35','2020-11-07 07:51:35'),(786,'en','Photos & Links','Photos & Links','2020-11-07 07:51:35','2020-11-07 07:51:35'),(787,'en','Add New','Add New','2020-11-07 07:51:35','2020-11-07 07:51:35'),(788,'en','Home Categories','Home Categories','2020-11-07 07:51:35','2020-11-07 07:51:35'),(789,'en','Home Banner 1 (Max 3)','Home Banner 1 (Max 3)','2020-11-07 07:51:35','2020-11-07 07:51:35'),(790,'en','Banner & Links','Banner & Links','2020-11-07 07:51:35','2020-11-07 07:51:35'),(791,'en','Home Banner 2 (Max 3)','Home Banner 2 (Max 3)','2020-11-07 07:51:36','2020-11-07 07:51:36'),(792,'en','Top 10','Top 10','2020-11-07 07:51:36','2020-11-07 07:51:36'),(793,'en','Top Categories (Max 10)','Top Categories (Max 10)','2020-11-07 07:51:36','2020-11-07 07:51:36'),(794,'en','Top Brands (Max 10)','Top Brands (Max 10)','2020-11-07 07:51:36','2020-11-07 07:51:36'),(795,'en','System Name','System Name','2020-11-07 07:54:22','2020-11-07 07:54:22'),(796,'en','System Logo - White','System Logo - White','2020-11-07 07:54:22','2020-11-07 07:54:22'),(797,'en','Choose Files','Choose Files','2020-11-07 07:54:22','2020-11-07 07:54:22'),(798,'en','Will be used in admin panel side menu','Will be used in admin panel side menu','2020-11-07 07:54:23','2020-11-07 07:54:23'),(799,'en','System Logo - Black','System Logo - Black','2020-11-07 07:54:23','2020-11-07 07:54:23'),(800,'en','Will be used in admin panel topbar in mobile + Admin login page','Will be used in admin panel topbar in mobile + Admin login page','2020-11-07 07:54:23','2020-11-07 07:54:23'),(801,'en','System Timezone','System Timezone','2020-11-07 07:54:23','2020-11-07 07:54:23'),(802,'en','Admin login page background','Admin login page background','2020-11-07 07:54:23','2020-11-07 07:54:23'),(803,'en','Website Header','Website Header','2020-11-07 08:21:36','2020-11-07 08:21:36'),(804,'en','Header Setting','Header Setting','2020-11-07 08:21:36','2020-11-07 08:21:36'),(805,'en','Header Logo','Header Logo','2020-11-07 08:21:36','2020-11-07 08:21:36'),(806,'en','Show Language Switcher?','Show Language Switcher?','2020-11-07 08:21:36','2020-11-07 08:21:36'),(807,'en','Show Currency Switcher?','Show Currency Switcher?','2020-11-07 08:21:36','2020-11-07 08:21:36'),(808,'en','Enable stikcy header?','Enable stikcy header?','2020-11-07 08:21:36','2020-11-07 08:21:36'),(809,'en','Website Footer','Website Footer','2020-11-07 08:21:56','2020-11-07 08:21:56'),(810,'en','Footer Widget','Footer Widget','2020-11-07 08:21:56','2020-11-07 08:21:56'),(811,'en','About Widget','About Widget','2020-11-07 08:21:56','2020-11-07 08:21:56'),(812,'en','Footer Logo','Footer Logo','2020-11-07 08:21:56','2020-11-07 08:21:56'),(813,'en','About description','About description','2020-11-07 08:21:56','2020-11-07 08:21:56'),(814,'en','Contact Info Widget','Contact Info Widget','2020-11-07 08:21:56','2020-11-07 08:21:56'),(815,'en','Footer contact address','Footer contact address','2020-11-07 08:21:56','2020-11-07 08:21:56'),(816,'en','Footer contact phone','Footer contact phone','2020-11-07 08:21:56','2020-11-07 08:21:56'),(817,'en','Footer contact email','Footer contact email','2020-11-07 08:21:56','2020-11-07 08:21:56'),(818,'en','Link Widget One','Link Widget One','2020-11-07 08:21:56','2020-11-07 08:21:56'),(819,'en','Links','Links','2020-11-07 08:21:56','2020-11-07 08:21:56'),(820,'en','Footer Bottom','Footer Bottom','2020-11-07 08:21:56','2020-11-07 08:21:56'),(821,'en','Copyright Widget ','Copyright Widget ','2020-11-07 08:21:57','2020-11-07 08:21:57'),(822,'en','Copyright Text','Copyright Text','2020-11-07 08:21:57','2020-11-07 08:21:57'),(823,'en','Social Link Widget ','Social Link Widget ','2020-11-07 08:21:57','2020-11-07 08:21:57'),(824,'en','Show Social Links?','Show Social Links?','2020-11-07 08:21:57','2020-11-07 08:21:57'),(825,'en','Social Links','Social Links','2020-11-07 08:21:57','2020-11-07 08:21:57'),(826,'en','Payment Methods Widget ','Payment Methods Widget ','2020-11-07 08:21:57','2020-11-07 08:21:57'),(827,'en','RTL status updated successfully','RTL status updated successfully','2020-11-07 08:36:11','2020-11-07 08:36:11'),(828,'en','Language changed to ','Language changed to ','2020-11-07 08:36:27','2020-11-07 08:36:27'),(829,'en','Inhouse Product sale report','Inhouse Product sale report','2020-11-07 09:30:25','2020-11-07 09:30:25'),(830,'en','Sort by Category','Sort by Category','2020-11-07 09:30:25','2020-11-07 09:30:25'),(831,'en','Product wise stock report','Product wise stock report','2020-11-07 09:31:02','2020-11-07 09:31:02'),(832,'en','Currency changed to ','Currency changed to ','2020-11-07 12:36:28','2020-11-07 12:36:28'),(833,'en','Avatar','Avatar','2020-11-08 09:32:35','2020-11-08 09:32:35'),(834,'en','Copy','Copy','2020-11-08 10:03:42','2020-11-08 10:03:42'),(835,'en','Variant','Variant','2020-11-08 10:43:02','2020-11-08 10:43:02'),(836,'en','Variant Price','Variant Price','2020-11-08 10:43:03','2020-11-08 10:43:03'),(837,'en','SKU','SKU','2020-11-08 10:43:03','2020-11-08 10:43:03'),(838,'en','Key','Key','2020-11-08 12:35:09','2020-11-08 12:35:09'),(839,'en','Value','Value','2020-11-08 12:35:09','2020-11-08 12:35:09'),(840,'en','Copy Translations','Copy Translations','2020-11-08 12:35:10','2020-11-08 12:35:10'),(841,'en','All Pick-up Points','All Pick-up Points','2020-11-08 12:35:43','2020-11-08 12:35:43'),(842,'en','Add New Pick-up Point','Add New Pick-up Point','2020-11-08 12:35:43','2020-11-08 12:35:43'),(843,'en','Manager','Manager','2020-11-08 12:35:43','2020-11-08 12:35:43'),(844,'en','Location','Location','2020-11-08 12:35:43','2020-11-08 12:35:43'),(845,'en','Pickup Station Contact','Pickup Station Contact','2020-11-08 12:35:43','2020-11-08 12:35:43'),(846,'en','Open','Open','2020-11-08 12:35:43','2020-11-08 12:35:43'),(847,'en','POS Activation for Seller','POS Activation for Seller','2020-11-08 12:35:55','2020-11-08 12:35:55'),(848,'en','Order Completed Successfully.','Order Completed Successfully.','2020-11-08 12:36:02','2020-11-08 12:36:02'),(849,'en','Text Input','Text Input','2020-11-08 12:38:40','2020-11-08 12:38:40'),(850,'en','Select','Select','2020-11-08 12:38:40','2020-11-08 12:38:40'),(851,'en','Multiple Select','Multiple Select','2020-11-08 12:38:40','2020-11-08 12:38:40'),(852,'en','Radio','Radio','2020-11-08 12:38:40','2020-11-08 12:38:40'),(853,'en','File','File','2020-11-08 12:38:40','2020-11-08 12:38:40'),(854,'en','Email Address','Email Address','2020-11-08 12:39:32','2020-11-08 12:39:32'),(855,'en','Verification Info','Verification Info','2020-11-08 12:39:32','2020-11-08 12:39:32'),(856,'en','Approval','Approval','2020-11-08 12:39:32','2020-11-08 12:39:32'),(857,'en','Due Amount','Due Amount','2020-11-08 12:39:32','2020-11-08 12:39:32'),(858,'en','Show','Show','2020-11-08 12:39:32','2020-11-08 12:39:32'),(859,'en','Pay Now','Pay Now','2020-11-08 12:39:32','2020-11-08 12:39:32'),(860,'en','Affiliate User Verification','Affiliate User Verification','2020-11-08 12:40:01','2020-11-08 12:40:01'),(861,'en','Reject','Reject','2020-11-08 12:40:01','2020-11-08 12:40:01'),(862,'en','Accept','Accept','2020-11-08 12:40:01','2020-11-08 12:40:01'),(863,'en','Beauty, Health & Hair','Beauty, Health & Hair','2020-11-08 12:54:17','2020-11-08 12:54:17'),(864,'en','Comparison','Comparison','2020-11-08 12:54:33','2020-11-08 12:54:33'),(865,'en','Reset Compare List','Reset Compare List','2020-11-08 12:54:33','2020-11-08 12:54:33'),(866,'en','Your comparison list is empty','Your comparison list is empty','2020-11-08 12:54:33','2020-11-08 12:54:33'),(867,'en','Convert Point To Wallet','Convert Point To Wallet','2020-11-08 13:04:42','2020-11-08 13:04:42'),(868,'en','Note: You need to activate wallet option first before using club point addon.','Note: You need to activate wallet option first before using club point addon.','2020-11-08 13:04:43','2020-11-08 13:04:43'),(869,'en','Create an account.','Create an account.','2020-11-09 06:17:11','2020-11-09 06:17:11'),(870,'en','Use Email Instead','Use Email Instead','2020-11-09 06:17:11','2020-11-09 06:17:11'),(871,'en','By signing up you agree to our terms and conditions.','By signing up you agree to our terms and conditions.','2020-11-09 06:17:11','2020-11-09 06:17:11'),(872,'en','Create Account','Create Account','2020-11-09 06:17:11','2020-11-09 06:17:11'),(873,'en','Or Join With','Or Join With','2020-11-09 06:17:11','2020-11-09 06:17:11'),(874,'en','Already have an account?','Already have an account?','2020-11-09 06:17:11','2020-11-09 06:17:11'),(875,'en','Log In','Log In','2020-11-09 06:17:11','2020-11-09 06:17:11'),(876,'en','Computer & Accessories','Computer & Accessories','2020-11-09 07:52:05','2020-11-09 07:52:05'),(878,'en','Product(s)','Product(s)','2020-11-09 07:52:23','2020-11-09 07:52:23'),(879,'en','in your cart','in your cart','2020-11-09 07:52:23','2020-11-09 07:52:23'),(880,'en','in your wishlist','in your wishlist','2020-11-09 07:52:23','2020-11-09 07:52:23'),(881,'en','you ordered','you ordered','2020-11-09 07:52:24','2020-11-09 07:52:24'),(882,'en','Default Shipping Address','Default Shipping Address','2020-11-09 07:52:24','2020-11-09 07:52:24'),(883,'en','Sports & outdoor','Sports & outdoor','2020-11-09 07:53:32','2020-11-09 07:53:32'),(884,'en','Copied','Copied','2020-11-09 07:54:19','2020-11-09 07:54:19'),(885,'en','Copy the Promote Link','Copy the Promote Link','2020-11-09 07:54:19','2020-11-09 07:54:19'),(886,'en','Write a review','Write a review','2020-11-09 07:54:20','2020-11-09 07:54:20'),(887,'en','Your name','Your name','2020-11-09 07:54:20','2020-11-09 07:54:20'),(888,'en','Comment','Comment','2020-11-09 07:54:20','2020-11-09 07:54:20'),(889,'en','Your review','Your review','2020-11-09 07:54:20','2020-11-09 07:54:20'),(890,'en','Submit review','Submit review','2020-11-09 07:54:20','2020-11-09 07:54:20'),(891,'en','Claire Willis','Claire Willis','2020-11-09 08:05:00','2020-11-09 08:05:00'),(892,'en','Germaine Greene','Germaine Greene','2020-11-09 08:05:00','2020-11-09 08:05:00'),(893,'en','Product File','Product File','2020-11-09 08:07:08','2020-11-09 08:07:08'),(894,'en','Choose file','Choose file','2020-11-09 08:07:08','2020-11-09 08:07:08'),(895,'en','Type to add a tag','Type to add a tag','2020-11-09 08:07:08','2020-11-09 08:07:08'),(896,'en','Images','Images','2020-11-09 08:07:08','2020-11-09 08:07:08'),(897,'en','Main Images','Main Images','2020-11-09 08:07:08','2020-11-09 08:07:08'),(898,'en','Meta Tags','Meta Tags','2020-11-09 08:07:08','2020-11-09 08:07:08'),(899,'en','Digital Product has been inserted successfully','Digital Product has been inserted successfully','2020-11-09 08:14:25','2020-11-09 08:14:25'),(900,'en','Edit Digital Product','Edit Digital Product','2020-11-09 08:14:34','2020-11-09 08:14:34'),(901,'en','Select an option','Select an option','2020-11-09 08:14:34','2020-11-09 08:14:34'),(902,'en','tax','tax','2020-11-09 08:14:35','2020-11-09 08:14:35'),(903,'en','Any question about this product?','Any question about this product?','2020-11-09 08:15:11','2020-11-09 08:15:11'),(904,'en','Sign in','Sign in','2020-11-09 08:15:11','2020-11-09 08:15:11'),(905,'en','Login with Google','Login with Google','2020-11-09 08:15:11','2020-11-09 08:15:11'),(906,'en','Login with Facebook','Login with Facebook','2020-11-09 08:15:11','2020-11-09 08:15:11'),(907,'en','Login with Twitter','Login with Twitter','2020-11-09 08:15:11','2020-11-09 08:15:11'),(908,'en','Click to show phone number','Click to show phone number','2020-11-09 08:15:51','2020-11-09 08:15:51'),(909,'en','Other Ads of','Other Ads of','2020-11-09 08:15:52','2020-11-09 08:15:52'),(910,'en','Store Home','Store Home','2020-11-09 08:54:23','2020-11-09 08:54:23'),(911,'en','Top Selling','Top Selling','2020-11-09 08:54:23','2020-11-09 08:54:23'),(912,'en','Shop Settings','Shop Settings','2020-11-09 08:55:38','2020-11-09 08:55:38'),(913,'en','Visit Shop','Visit Shop','2020-11-09 08:55:38','2020-11-09 08:55:38'),(914,'en','Pickup Points','Pickup Points','2020-11-09 08:55:38','2020-11-09 08:55:38'),(915,'en','Select Pickup Point','Select Pickup Point','2020-11-09 08:55:38','2020-11-09 08:55:38'),(916,'en','Slider Settings','Slider Settings','2020-11-09 08:55:39','2020-11-09 08:55:39'),(917,'en','Social Media Link','Social Media Link','2020-11-09 08:55:39','2020-11-09 08:55:39'),(918,'en','Facebook','Facebook','2020-11-09 08:55:39','2020-11-09 08:55:39'),(919,'en','Twitter','Twitter','2020-11-09 08:55:39','2020-11-09 08:55:39'),(920,'en','Google','Google','2020-11-09 08:55:39','2020-11-09 08:55:39'),(921,'en','New Arrival Products','New Arrival Products','2020-11-09 08:56:26','2020-11-09 08:56:26'),(922,'en','Check Your Order Status','Check Your Order Status','2020-11-09 09:23:32','2020-11-09 09:23:32'),(923,'en','Shipping method','Shipping method','2020-11-09 09:27:40','2020-11-09 09:27:40'),(924,'en','Shipped By','Shipped By','2020-11-09 09:27:41','2020-11-09 09:27:41'),(925,'en','Image','Image','2020-11-09 09:29:37','2020-11-09 09:29:37'),(926,'en','Sub Sub Category','Sub Sub Category','2020-11-09 09:29:37','2020-11-09 09:29:37'),(927,'en','Inhouse Products','Inhouse Products','2020-11-09 10:22:32','2020-11-09 10:22:32'),(928,'en','Forgot Password?','Forgot Password?','2020-11-09 10:33:21','2020-11-09 10:33:21'),(929,'en','Enter your email address to recover your password.','Enter your email address to recover your password.','2020-11-09 10:33:21','2020-11-09 10:33:21'),(930,'en','Email or Phone','Email or Phone','2020-11-09 10:33:21','2020-11-09 10:33:21'),(931,'en','Send Password Reset Link','Send Password Reset Link','2020-11-09 10:33:21','2020-11-09 10:33:21'),(932,'en','Back to Login','Back to Login','2020-11-09 10:33:21','2020-11-09 10:33:21'),(933,'en','index','index','2020-11-09 10:35:29','2020-11-09 10:35:29'),(934,'en','Download Your Product','Download Your Product','2020-11-09 10:35:30','2020-11-09 10:35:30'),(935,'en','Option','Option','2020-11-09 10:35:30','2020-11-09 10:35:30'),(936,'en','Applied Refund Request','Applied Refund Request','2020-11-09 10:35:39','2020-11-09 10:35:39'),(937,'en','Item has been renoved from wishlist','Item has been renoved from wishlist','2020-11-09 10:36:04','2020-11-09 10:36:04'),(938,'en','Bulk Products Upload','Bulk Products Upload','2020-11-09 10:39:24','2020-11-09 10:39:24'),(939,'en','Upload CSV','Upload CSV','2020-11-09 10:39:25','2020-11-09 10:39:25'),(940,'en','Create a Ticket','Create a Ticket','2020-11-09 10:40:25','2020-11-09 10:40:25'),(941,'en','Tickets','Tickets','2020-11-09 10:40:25','2020-11-09 10:40:25'),(942,'en','Ticket ID','Ticket ID','2020-11-09 10:40:25','2020-11-09 10:40:25'),(943,'en','Sending Date','Sending Date','2020-11-09 10:40:25','2020-11-09 10:40:25'),(944,'en','Subject','Subject','2020-11-09 10:40:25','2020-11-09 10:40:25'),(945,'en','View Details','View Details','2020-11-09 10:40:25','2020-11-09 10:40:25'),(946,'en','Provide a detailed description','Provide a detailed description','2020-11-09 10:40:26','2020-11-09 10:40:26'),(947,'en','Type your reply','Type your reply','2020-11-09 10:40:26','2020-11-09 10:40:26'),(948,'en','Send Ticket','Send Ticket','2020-11-09 10:40:26','2020-11-09 10:40:26'),(949,'en','Load More','Load More','2020-11-09 10:40:57','2020-11-09 10:40:57'),(950,'en','Jewelry & Watches','Jewelry & Watches','2020-11-09 10:47:38','2020-11-09 10:47:38'),(951,'en','Filters','Filters','2020-11-09 10:53:54','2020-11-09 10:53:54'),(952,'en','Contact address','Contact address','2020-11-09 10:58:46','2020-11-09 10:58:46'),(953,'en','Contact phone','Contact phone','2020-11-09 10:58:47','2020-11-09 10:58:47'),(954,'en','Contact email','Contact email','2020-11-09 10:58:47','2020-11-09 10:58:47'),(955,'en','Filter by','Filter by','2020-11-09 11:00:03','2020-11-09 11:00:03'),(956,'en','Condition','Condition','2020-11-09 11:56:13','2020-11-09 11:56:13'),(957,'en','All Type','All Type','2020-11-09 11:56:13','2020-11-09 11:56:13'),(960,'en','Pay with wallet','Pay with wallet','2020-11-09 12:56:34','2020-11-09 12:56:34'),(961,'en','Select variation','Select variation','2020-11-10 07:54:29','2020-11-10 07:54:29'),(962,'en','No Product Added','No Product Added','2020-11-10 08:07:53','2020-11-10 08:07:53'),(963,'en','Status has been updated successfully','Status has been updated successfully','2020-11-10 08:41:23','2020-11-10 08:41:23'),(964,'en','All Seller Packages','All Seller Packages','2020-11-10 09:14:10','2020-11-10 09:14:10'),(965,'en','Add New Package','Add New Package','2020-11-10 09:14:10','2020-11-10 09:14:10'),(966,'en','Package Logo','Package Logo','2020-11-10 09:14:10','2020-11-10 09:14:10'),(967,'en','days','days','2020-11-10 09:14:10','2020-11-10 09:14:10'),(968,'en','Create New Seller Package','Create New Seller Package','2020-11-10 09:14:31','2020-11-10 09:14:31'),(969,'en','Package Name','Package Name','2020-11-10 09:14:31','2020-11-10 09:14:31'),(970,'en','Duration','Duration','2020-11-10 09:14:31','2020-11-10 09:14:31'),(971,'en','Validity in number of days','Validity in number of days','2020-11-10 09:14:31','2020-11-10 09:14:31'),(972,'en','Update Package Information','Update Package Information','2020-11-10 09:14:59','2020-11-10 09:14:59'),(973,'en','Package has been inserted successfully','Package has been inserted successfully','2020-11-10 09:15:14','2020-11-10 09:15:14'),(974,'en','Refund Request','Refund Request','2020-11-10 09:17:25','2020-11-10 09:17:25'),(975,'en','Reason','Reason','2020-11-10 09:17:25','2020-11-10 09:17:25'),(976,'en','Label','Label','2020-11-10 09:20:13','2020-11-10 09:20:13'),(977,'en','Select Label','Select Label','2020-11-10 09:20:13','2020-11-10 09:20:13'),(978,'en','Multiple Select Label','Multiple Select Label','2020-11-10 09:20:13','2020-11-10 09:20:13'),(979,'en','Radio Label','Radio Label','2020-11-10 09:20:13','2020-11-10 09:20:13'),(980,'en','Pickup Point Orders','Pickup Point Orders','2020-11-10 09:25:40','2020-11-10 09:25:40'),(981,'en','View','View','2020-11-10 09:25:40','2020-11-10 09:25:40'),(982,'en','Order #','Order #','2020-11-10 09:25:48','2020-11-10 09:25:48'),(983,'en','Order Status','Order Status','2020-11-10 09:25:48','2020-11-10 09:25:48'),(984,'en','Total amount','Total amount','2020-11-10 09:25:48','2020-11-10 09:25:48'),(986,'en','TOTAL','TOTAL','2020-11-10 09:25:49','2020-11-10 09:25:49'),(987,'en','Delivery status has been updated','Delivery status has been updated','2020-11-10 09:25:49','2020-11-10 09:25:49'),(988,'en','Payment status has been updated','Payment status has been updated','2020-11-10 09:25:49','2020-11-10 09:25:49'),(989,'en','INVOICE','INVOICE','2020-11-10 09:25:58','2020-11-10 09:25:58'),(990,'en','Set Refund Time','Set Refund Time','2020-11-10 09:34:04','2020-11-10 09:34:04'),(991,'en','Set Time for sending Refund Request','Set Time for sending Refund Request','2020-11-10 09:34:04','2020-11-10 09:34:04'),(992,'en','Set Refund Sticker','Set Refund Sticker','2020-11-10 09:34:05','2020-11-10 09:34:05'),(993,'en','Sticker','Sticker','2020-11-10 09:34:05','2020-11-10 09:34:05'),(994,'en','Refund Request All','Refund Request All','2020-11-10 09:34:12','2020-11-10 09:34:12'),(995,'en','Order Id','Order Id','2020-11-10 09:34:12','2020-11-10 09:34:12'),(996,'en','Seller Approval','Seller Approval','2020-11-10 09:34:12','2020-11-10 09:34:12'),(997,'en','Admin Approval','Admin Approval','2020-11-10 09:34:12','2020-11-10 09:34:12'),(998,'en','Refund Status','Refund Status','2020-11-10 09:34:12','2020-11-10 09:34:12'),(1000,'en','No Refund','No Refund','2020-11-10 09:35:27','2020-11-10 09:35:27'),(1001,'en','Status updated successfully','Status updated successfully','2020-11-10 09:54:20','2020-11-10 09:54:20'),(1002,'en','User Search Report','User Search Report','2020-11-11 06:43:24','2020-11-11 06:43:24'),(1003,'en','Search By','Search By','2020-11-11 06:43:24','2020-11-11 06:43:24'),(1004,'en','Number searches','Number searches','2020-11-11 06:43:24','2020-11-11 06:43:24'),(1005,'en','Sender','Sender','2020-11-11 06:51:49','2020-11-11 06:51:49'),(1006,'en','Receiver','Receiver','2020-11-11 06:51:49','2020-11-11 06:51:49'),(1007,'en','Verification form updated successfully','Verification form updated successfully','2020-11-11 06:53:29','2020-11-11 06:53:29'),(1008,'en','Invalid email or password','Invalid email or password','2020-11-11 07:07:49','2020-11-11 07:07:49'),(1009,'en','All Coupons','All Coupons','2020-11-11 07:14:04','2020-11-11 07:14:04'),(1010,'en','Add New Coupon','Add New Coupon','2020-11-11 07:14:04','2020-11-11 07:14:04'),(1011,'en','Coupon Information','Coupon Information','2020-11-11 07:14:04','2020-11-11 07:14:04'),(1012,'en','Start Date','Start Date','2020-11-11 07:14:04','2020-11-11 07:14:04'),(1013,'en','End Date','End Date','2020-11-11 07:14:05','2020-11-11 07:14:05'),(1014,'en','Product Base','Product Base','2020-11-11 07:14:05','2020-11-11 07:14:05'),(1015,'en','Send Newsletter','Send Newsletter','2020-11-11 07:14:10','2020-11-11 07:14:10'),(1016,'en','Mobile Users','Mobile Users','2020-11-11 07:14:10','2020-11-11 07:14:10'),(1017,'en','SMS subject','SMS subject','2020-11-11 07:14:10','2020-11-11 07:14:10'),(1018,'en','SMS content','SMS content','2020-11-11 07:14:10','2020-11-11 07:14:10'),(1019,'en','All Flash Delas','All Flash Delas','2020-11-11 07:16:06','2020-11-11 07:16:06'),(1020,'en','Create New Flash Dela','Create New Flash Dela','2020-11-11 07:16:06','2020-11-11 07:16:06'),(1022,'en','Page Link','Page Link','2020-11-11 07:16:06','2020-11-11 07:16:06'),(1023,'en','Flash Deal Information','Flash Deal Information','2020-11-11 07:16:14','2020-11-11 07:16:14'),(1024,'en','Background Color','Background Color','2020-11-11 07:16:14','2020-11-11 07:16:14'),(1026,'en','Text Color','Text Color','2020-11-11 07:16:14','2020-11-11 07:16:14'),(1027,'en','White','White','2020-11-11 07:16:14','2020-11-11 07:16:14'),(1028,'en','Dark','Dark','2020-11-11 07:16:15','2020-11-11 07:16:15'),(1029,'en','Choose Products','Choose Products','2020-11-11 07:16:15','2020-11-11 07:16:15'),(1030,'en','Discounts','Discounts','2020-11-11 07:16:20','2020-11-11 07:16:20'),(1031,'en','Discount Type','Discount Type','2020-11-11 07:16:20','2020-11-11 07:16:20'),(1032,'en','Twillo Credential','Twillo Credential','2020-11-11 07:17:35','2020-11-11 07:17:35'),(1033,'en','TWILIO SID','TWILIO SID','2020-11-11 07:17:35','2020-11-11 07:17:35'),(1034,'en','TWILIO AUTH TOKEN','TWILIO AUTH TOKEN','2020-11-11 07:17:35','2020-11-11 07:17:35'),(1035,'en','TWILIO VERIFY SID','TWILIO VERIFY SID','2020-11-11 07:17:35','2020-11-11 07:17:35'),(1036,'en','VALID TWILLO NUMBER','VALID TWILLO NUMBER','2020-11-11 07:17:35','2020-11-11 07:17:35'),(1037,'en','Nexmo Credential','Nexmo Credential','2020-11-11 07:17:35','2020-11-11 07:17:35'),(1038,'en','NEXMO KEY','NEXMO KEY','2020-11-11 07:17:35','2020-11-11 07:17:35'),(1039,'en','NEXMO SECRET','NEXMO SECRET','2020-11-11 07:17:35','2020-11-11 07:17:35'),(1040,'en','SSL Wireless Credential','SSL Wireless Credential','2020-11-11 07:17:35','2020-11-11 07:17:35'),(1041,'en','SSL SMS API TOKEN','SSL SMS API TOKEN','2020-11-11 07:17:35','2020-11-11 07:17:35'),(1042,'en','SSL SMS SID','SSL SMS SID','2020-11-11 07:17:35','2020-11-11 07:17:35'),(1043,'en','SSL SMS URL','SSL SMS URL','2020-11-11 07:17:35','2020-11-11 07:17:35'),(1044,'en','Fast2SMS Credential','Fast2SMS Credential','2020-11-11 07:17:35','2020-11-11 07:17:35'),(1045,'en','AUTH KEY','AUTH KEY','2020-11-11 07:17:35','2020-11-11 07:17:35'),(1046,'en','ROUTE','ROUTE','2020-11-11 07:17:35','2020-11-11 07:17:35'),(1047,'en','Promotional Use','Promotional Use','2020-11-11 07:17:35','2020-11-11 07:17:35'),(1048,'en','Transactional Use','Transactional Use','2020-11-11 07:17:35','2020-11-11 07:17:35'),(1050,'en','SENDER ID','SENDER ID','2020-11-11 07:17:35','2020-11-11 07:17:35'),(1051,'en','Nexmo OTP','Nexmo OTP','2020-11-11 07:17:42','2020-11-11 07:17:42'),(1052,'en','Twillo OTP','Twillo OTP','2020-11-11 07:17:43','2020-11-11 07:17:43'),(1053,'en','SSL Wireless OTP','SSL Wireless OTP','2020-11-11 07:17:43','2020-11-11 07:17:43'),(1054,'en','Fast2SMS OTP','Fast2SMS OTP','2020-11-11 07:17:43','2020-11-11 07:17:43'),(1055,'en','Order Placement','Order Placement','2020-11-11 07:17:43','2020-11-11 07:17:43'),(1056,'en','Delivery Status Changing Time','Delivery Status Changing Time','2020-11-11 07:17:43','2020-11-11 07:17:43'),(1057,'en','Paid Status Changing Time','Paid Status Changing Time','2020-11-11 07:17:43','2020-11-11 07:17:43'),(1058,'en','Send Bulk SMS','Send Bulk SMS','2020-11-11 07:19:14','2020-11-11 07:19:14'),(1059,'en','All Subscribers','All Subscribers','2020-11-11 07:21:51','2020-11-11 07:21:51'),(1060,'en','Coupon Information Adding','Coupon Information Adding','2020-11-11 07:22:25','2020-11-11 07:22:25'),(1061,'en','Coupon Type','Coupon Type','2020-11-11 07:22:25','2020-11-11 07:22:25'),(1062,'en','For Products','For Products','2020-11-11 07:22:25','2020-11-11 07:22:25'),(1063,'en','For Total Orders','For Total Orders','2020-11-11 07:22:25','2020-11-11 07:22:25'),(1064,'en','Add Your Product Base Coupon','Add Your Product Base Coupon','2020-11-11 07:22:42','2020-11-11 07:22:42'),(1065,'en','Coupon code','Coupon code','2020-11-11 07:22:42','2020-11-11 07:22:42'),(1066,'en','Sub Category','Sub Category','2020-11-11 07:22:42','2020-11-11 07:22:42'),(1067,'en','Add More','Add More','2020-11-11 07:22:43','2020-11-11 07:22:43'),(1068,'en','Add Your Cart Base Coupon','Add Your Cart Base Coupon','2020-11-11 07:29:40','2020-11-11 07:29:40'),(1069,'en','Minimum Shopping','Minimum Shopping','2020-11-11 07:29:40','2020-11-11 07:29:40'),(1070,'en','Maximum Discount Amount','Maximum Discount Amount','2020-11-11 07:29:41','2020-11-11 07:29:41'),(1071,'en','Coupon Information Update','Coupon Information Update','2020-11-11 08:18:34','2020-11-11 08:18:34'),(1073,'en','Please Configure SMTP Setting to work all email sending funtionality','Please Configure SMTP Setting to work all email sending funtionality','2020-11-11 13:10:18','2020-11-11 13:10:18'),(1074,'en','Configure Now','Configure Now','2020-11-11 13:10:18','2020-11-11 13:10:18'),(1076,'en','Total published products','Total published products','2020-11-11 13:10:18','2020-11-11 13:10:18'),(1077,'en','Total sellers products','Total sellers products','2020-11-11 13:10:18','2020-11-11 13:10:18'),(1078,'en','Total admin products','Total admin products','2020-11-11 13:10:18','2020-11-11 13:10:18'),(1079,'en','Manage Products','Manage Products','2020-11-11 13:10:18','2020-11-11 13:10:18'),(1080,'en','Total product category','Total product category','2020-11-11 13:10:18','2020-11-11 13:10:18'),(1081,'en','Create Category','Create Category','2020-11-11 13:10:18','2020-11-11 13:10:18'),(1082,'en','Total product sub sub category','Total product sub sub category','2020-11-11 13:10:18','2020-11-11 13:10:18'),(1083,'en','Create Sub Sub Category','Create Sub Sub Category','2020-11-11 13:10:18','2020-11-11 13:10:18'),(1084,'en','Total product sub category','Total product sub category','2020-11-11 13:10:18','2020-11-11 13:10:18'),(1085,'en','Create Sub Category','Create Sub Category','2020-11-11 13:10:18','2020-11-11 13:10:18'),(1086,'en','Total product brand','Total product brand','2020-11-11 13:10:18','2020-11-11 13:10:18'),(1087,'en','Create Brand','Create Brand','2020-11-11 13:10:18','2020-11-11 13:10:18'),(1089,'en','Total sellers','Total sellers','2020-11-11 13:10:19','2020-11-11 13:10:19'),(1091,'en','Total approved sellers','Total approved sellers','2020-11-11 13:10:19','2020-11-11 13:10:19'),(1093,'en','Total pending sellers','Total pending sellers','2020-11-11 13:10:19','2020-11-11 13:10:19'),(1094,'en','Manage Sellers','Manage Sellers','2020-11-11 13:10:19','2020-11-11 13:10:19'),(1095,'en','Category wise product sale','Category wise product sale','2020-11-11 13:10:19','2020-11-11 13:10:19'),(1097,'en','Sale','Sale','2020-11-11 13:10:19','2020-11-11 13:10:19'),(1098,'en','Category wise product stock','Category wise product stock','2020-11-11 13:10:19','2020-11-11 13:10:19'),(1099,'en','Category Name','Category Name','2020-11-11 13:10:19','2020-11-11 13:10:19'),(1100,'en','Stock','Stock','2020-11-11 13:10:19','2020-11-11 13:10:19'),(1101,'en','Frontend','Frontend','2020-11-11 13:10:19','2020-11-11 13:10:19'),(1103,'en','Home page','Home page','2020-11-11 13:10:19','2020-11-11 13:10:19'),(1104,'en','setting','setting','2020-11-11 13:10:19','2020-11-11 13:10:19'),(1106,'en','Policy page','Policy page','2020-11-11 13:10:20','2020-11-11 13:10:20'),(1107,'en','setting','setting','2020-11-11 13:10:20','2020-11-11 13:10:20'),(1109,'en','General','General','2020-11-11 13:10:20','2020-11-11 13:10:20'),(1110,'en','setting','setting','2020-11-11 13:10:20','2020-11-11 13:10:20'),(1111,'en','Click Here','Click Here','2020-11-11 13:10:20','2020-11-11 13:10:20'),(1112,'en','Useful link','Useful link','2020-11-11 13:10:20','2020-11-11 13:10:20'),(1113,'en','setting','setting','2020-11-11 13:10:20','2020-11-11 13:10:20'),(1114,'en','Click Here','Click Here','2020-11-11 13:10:20','2020-11-11 13:10:20'),(1115,'en','Activation','Activation','2020-11-11 13:10:20','2020-11-11 13:10:20'),(1116,'en','setting','setting','2020-11-11 13:10:20','2020-11-11 13:10:20'),(1117,'en','Click Here','Click Here','2020-11-11 13:10:20','2020-11-11 13:10:20'),(1118,'en','SMTP','SMTP','2020-11-11 13:10:20','2020-11-11 13:10:20'),(1119,'en','setting','setting','2020-11-11 13:10:20','2020-11-11 13:10:20'),(1120,'en','Click Here','Click Here','2020-11-11 13:10:20','2020-11-11 13:10:20'),(1121,'en','Payment method','Payment method','2020-11-11 13:10:20','2020-11-11 13:10:20'),(1122,'en','setting','setting','2020-11-11 13:10:20','2020-11-11 13:10:20'),(1123,'en','Click Here','Click Here','2020-11-11 13:10:20','2020-11-11 13:10:20'),(1124,'en','Social media','Social media','2020-11-11 13:10:20','2020-11-11 13:10:20'),(1125,'en','setting','setting','2020-11-11 13:10:20','2020-11-11 13:10:20'),(1126,'en','Click Here','Click Here','2020-11-11 13:10:21','2020-11-11 13:10:21'),(1127,'en','Business','Business','2020-11-11 13:10:21','2020-11-11 13:10:21'),(1128,'en','setting','setting','2020-11-11 13:10:21','2020-11-11 13:10:21'),(1130,'en','setting','setting','2020-11-11 13:10:21','2020-11-11 13:10:21'),(1131,'en','Click Here','Click Here','2020-11-11 13:10:21','2020-11-11 13:10:21'),(1132,'en','Seller verification','Seller verification','2020-11-11 13:10:21','2020-11-11 13:10:21'),(1133,'en','form setting','form setting','2020-11-11 13:10:21','2020-11-11 13:10:21'),(1134,'en','Click Here','Click Here','2020-11-11 13:10:21','2020-11-11 13:10:21'),(1135,'en','Language','Language','2020-11-11 13:10:21','2020-11-11 13:10:21'),(1136,'en','setting','setting','2020-11-11 13:10:21','2020-11-11 13:10:21'),(1137,'en','Click Here','Click Here','2020-11-11 13:10:21','2020-11-11 13:10:21'),(1139,'en','setting','setting','2020-11-11 13:10:21','2020-11-11 13:10:21'),(1140,'en','Click Here','Click Here','2020-11-11 13:10:21','2020-11-11 13:10:21'),(1141,'en','Dashboard','Dashboard','2020-11-11 13:10:21','2020-11-11 13:10:21'),(1142,'en','POS System','POS System','2020-11-11 13:10:21','2020-11-11 13:10:21'),(1143,'en','POS Manager','POS Manager','2020-11-11 13:10:21','2020-11-11 13:10:21'),(1144,'en','POS Configuration','POS Configuration','2020-11-11 13:10:21','2020-11-11 13:10:21'),(1145,'en','Products','Products','2020-11-11 13:10:21','2020-11-11 13:10:21'),(1146,'en','Add New product','Add New product','2020-11-11 13:10:22','2020-11-11 13:10:22'),(1147,'en','All Products','All Products','2020-11-11 13:10:22','2020-11-11 13:10:22'),(1148,'en','In House Products','In House Products','2020-11-11 13:10:22','2020-11-11 13:10:22'),(1149,'en','Seller Products','Seller Products','2020-11-11 13:10:22','2020-11-11 13:10:22'),(1150,'en','Digital Products','Digital Products','2020-11-11 13:10:22','2020-11-11 13:10:22'),(1151,'en','Bulk Import','Bulk Import','2020-11-11 13:10:22','2020-11-11 13:10:22'),(1152,'en','Bulk Export','Bulk Export','2020-11-11 13:10:22','2020-11-11 13:10:22'),(1153,'en','Category','Category','2020-11-11 13:10:22','2020-11-11 13:10:22'),(1154,'en','Subcategory','Subcategory','2020-11-11 13:10:22','2020-11-11 13:10:22'),(1155,'en','Sub Subcategory','Sub Subcategory','2020-11-11 13:10:22','2020-11-11 13:10:22'),(1156,'en','Brand','Brand','2020-11-11 13:10:22','2020-11-11 13:10:22'),(1157,'en','Attribute','Attribute','2020-11-11 13:10:22','2020-11-11 13:10:22'),(1158,'en','Product Reviews','Product Reviews','2020-11-11 13:10:22','2020-11-11 13:10:22'),(1159,'en','Sales','Sales','2020-11-11 13:10:22','2020-11-11 13:10:22'),(1160,'en','All Orders','All Orders','2020-11-11 13:10:22','2020-11-11 13:10:22'),(1161,'en','Inhouse orders','Inhouse orders','2020-11-11 13:10:22','2020-11-11 13:10:22'),(1162,'en','Seller Orders','Seller Orders','2020-11-11 13:10:22','2020-11-11 13:10:22'),(1163,'en','Pick-up Point Order','Pick-up Point Order','2020-11-11 13:10:22','2020-11-11 13:10:22'),(1164,'en','Refunds','Refunds','2020-11-11 13:10:22','2020-11-11 13:10:22'),(1165,'en','Refund Requests','Refund Requests','2020-11-11 13:10:22','2020-11-11 13:10:22'),(1166,'en','Approved Refund','Approved Refund','2020-11-11 13:10:23','2020-11-11 13:10:23'),(1167,'en','Refund Configuration','Refund Configuration','2020-11-11 13:10:23','2020-11-11 13:10:23'),(1168,'en','Customers','Customers','2020-11-11 13:10:23','2020-11-11 13:10:23'),(1169,'en','Customer list','Customer list','2020-11-11 13:10:23','2020-11-11 13:10:23'),(1170,'en','Classified Products','Classified Products','2020-11-11 13:10:23','2020-11-11 13:10:23'),(1171,'en','Classified Packages','Classified Packages','2020-11-11 13:10:23','2020-11-11 13:10:23'),(1172,'en','Sellers','Sellers','2020-11-11 13:10:23','2020-11-11 13:10:23'),(1173,'en','All Seller','All Seller','2020-11-11 13:10:23','2020-11-11 13:10:23'),(1174,'en','Payouts','Payouts','2020-11-11 13:10:23','2020-11-11 13:10:23'),(1175,'en','Payout Requests','Payout Requests','2020-11-11 13:10:23','2020-11-11 13:10:23'),(1176,'en','Seller Commission','Seller Commission','2020-11-11 13:10:23','2020-11-11 13:10:23'),(1177,'en','Seller Packages','Seller Packages','2020-11-11 13:10:23','2020-11-11 13:10:23'),(1178,'en','Seller Verification Form','Seller Verification Form','2020-11-11 13:10:23','2020-11-11 13:10:23'),(1179,'en','Reports','Reports','2020-11-11 13:10:23','2020-11-11 13:10:23'),(1180,'en','In House Product Sale','In House Product Sale','2020-11-11 13:10:23','2020-11-11 13:10:23'),(1181,'en','Seller Products Sale','Seller Products Sale','2020-11-11 13:10:23','2020-11-11 13:10:23'),(1182,'en','Products Stock','Products Stock','2020-11-11 13:10:23','2020-11-11 13:10:23'),(1183,'en','Products wishlist','Products wishlist','2020-11-11 13:10:23','2020-11-11 13:10:23'),(1184,'en','User Searches','User Searches','2020-11-11 13:10:23','2020-11-11 13:10:23'),(1185,'en','Marketing','Marketing','2020-11-11 13:10:24','2020-11-11 13:10:24'),(1186,'en','Flash deals','Flash deals','2020-11-11 13:10:24','2020-11-11 13:10:24'),(1187,'en','Newsletters','Newsletters','2020-11-11 13:10:24','2020-11-11 13:10:24'),(1188,'en','Bulk SMS','Bulk SMS','2020-11-11 13:10:24','2020-11-11 13:10:24'),(1189,'en','Subscribers','Subscribers','2020-11-11 13:10:24','2020-11-11 13:10:24'),(1190,'en','Coupon','Coupon','2020-11-11 13:10:24','2020-11-11 13:10:24'),(1191,'en','Support','Support','2020-11-11 13:10:24','2020-11-11 13:10:24'),(1192,'en','Ticket','Ticket','2020-11-11 13:10:24','2020-11-11 13:10:24'),(1193,'en','Product Queries','Product Queries','2020-11-11 13:10:24','2020-11-11 13:10:24'),(1194,'en','Website Setup','Website Setup','2020-11-11 13:10:24','2020-11-11 13:10:24'),(1195,'en','Header','Header','2020-11-11 13:10:24','2020-11-11 13:10:24'),(1196,'en','Footer','Footer','2020-11-11 13:10:24','2020-11-11 13:10:24'),(1197,'en','Pages','Pages','2020-11-11 13:10:24','2020-11-11 13:10:24'),(1198,'en','Appearance','Appearance','2020-11-11 13:10:24','2020-11-11 13:10:24'),(1199,'en','Setup & Configurations','Setup & Configurations','2020-11-11 13:10:24','2020-11-11 13:10:24'),(1200,'en','General Settings','General Settings','2020-11-11 13:10:24','2020-11-11 13:10:24'),(1201,'en','Features activation','Features activation','2020-11-11 13:10:24','2020-11-11 13:10:24'),(1202,'en','Languages','Languages','2020-11-11 13:10:24','2020-11-11 13:10:24'),(1203,'en','Currency','Currency','2020-11-11 13:10:25','2020-11-11 13:10:25'),(1204,'en','Pickup point','Pickup point','2020-11-11 13:10:25','2020-11-11 13:10:25'),(1205,'en','SMTP Settings','SMTP Settings','2020-11-11 13:10:25','2020-11-11 13:10:25'),(1206,'en','Payment Methods','Payment Methods','2020-11-11 13:10:25','2020-11-11 13:10:25'),(1207,'en','File System Configuration','File System Configuration','2020-11-11 13:10:25','2020-11-11 13:10:25'),(1208,'en','Social media Logins','Social media Logins','2020-11-11 13:10:25','2020-11-11 13:10:25'),(1209,'en','Analytics Tools','Analytics Tools','2020-11-11 13:10:25','2020-11-11 13:10:25'),(1210,'en','Facebook Chat','Facebook Chat','2020-11-11 13:10:25','2020-11-11 13:10:25'),(1211,'en','Google reCAPTCHA','Google reCAPTCHA','2020-11-11 13:10:25','2020-11-11 13:10:25'),(1212,'en','Shipping Configuration','Shipping Configuration','2020-11-11 13:10:25','2020-11-11 13:10:25'),(1213,'en','Shipping Countries','Shipping Countries','2020-11-11 13:10:25','2020-11-11 13:10:25'),(1214,'en','Affiliate System','Affiliate System','2020-11-11 13:10:25','2020-11-11 13:10:25'),(1215,'en','Affiliate Registration Form','Affiliate Registration Form','2020-11-11 13:10:25','2020-11-11 13:10:25'),(1216,'en','Affiliate Configurations','Affiliate Configurations','2020-11-11 13:10:25','2020-11-11 13:10:25'),(1217,'en','Affiliate Users','Affiliate Users','2020-11-11 13:10:25','2020-11-11 13:10:25'),(1218,'en','Referral Users','Referral Users','2020-11-11 13:10:25','2020-11-11 13:10:25'),(1219,'en','Affiliate Withdraw Requests','Affiliate Withdraw Requests','2020-11-11 13:10:26','2020-11-11 13:10:26'),(1220,'en','Offline Payment System','Offline Payment System','2020-11-11 13:10:26','2020-11-11 13:10:26'),(1221,'en','Manual Payment Methods','Manual Payment Methods','2020-11-11 13:10:26','2020-11-11 13:10:26'),(1222,'en','Offline Wallet Recharge','Offline Wallet Recharge','2020-11-11 13:10:26','2020-11-11 13:10:26'),(1223,'en','Offline Customer Package Payments','Offline Customer Package Payments','2020-11-11 13:10:26','2020-11-11 13:10:26'),(1224,'en','Offline Seller Package Payments','Offline Seller Package Payments','2020-11-11 13:10:26','2020-11-11 13:10:26'),(1225,'en','Paytm Payment Gateway','Paytm Payment Gateway','2020-11-11 13:10:26','2020-11-11 13:10:26'),(1226,'en','Set Paytm Credentials','Set Paytm Credentials','2020-11-11 13:10:26','2020-11-11 13:10:26'),(1227,'en','Club Point System','Club Point System','2020-11-11 13:10:26','2020-11-11 13:10:26'),(1228,'en','Club Point Configurations','Club Point Configurations','2020-11-11 13:10:26','2020-11-11 13:10:26'),(1229,'en','Set Product Point','Set Product Point','2020-11-11 13:10:26','2020-11-11 13:10:26'),(1230,'en','User Points','User Points','2020-11-11 13:10:26','2020-11-11 13:10:26'),(1231,'en','OTP System','OTP System','2020-11-11 13:10:26','2020-11-11 13:10:26'),(1232,'en','OTP Configurations','OTP Configurations','2020-11-11 13:10:26','2020-11-11 13:10:26'),(1233,'en','Set OTP Credentials','Set OTP Credentials','2020-11-11 13:10:26','2020-11-11 13:10:26'),(1234,'en','Staffs','Staffs','2020-11-11 13:10:26','2020-11-11 13:10:26'),(1235,'en','All staffs','All staffs','2020-11-11 13:10:27','2020-11-11 13:10:27'),(1236,'en','Staff permissions','Staff permissions','2020-11-11 13:10:27','2020-11-11 13:10:27'),(1237,'en','Addon Manager','Addon Manager','2020-11-11 13:10:27','2020-11-11 13:10:27'),(1238,'en','Browse Website','Browse Website','2020-11-11 13:10:27','2020-11-11 13:10:27'),(1239,'en','POS','POS','2020-11-11 13:10:27','2020-11-11 13:10:27'),(1240,'en','Notifications','Notifications','2020-11-11 13:10:27','2020-11-11 13:10:27'),(1241,'en','new orders','new orders','2020-11-11 13:10:27','2020-11-11 13:10:27'),(1242,'en','user-image','user-image','2020-11-11 13:10:27','2020-11-11 13:10:27'),(1243,'en','Profile','Profile','2020-11-11 13:10:27','2020-11-11 13:10:27'),(1244,'en','Logout','Logout','2020-11-11 13:10:27','2020-11-11 13:10:27'),(1247,'en','Page Not Found!','Page Not Found!','2020-11-11 13:10:28','2020-11-11 13:10:28'),(1249,'en','The page you are looking for has not been found on our server.','The page you are looking for has not been found on our server.','2020-11-11 13:10:28','2020-11-11 13:10:28'),(1253,'en','Registration','Registration','2020-11-11 13:10:29','2020-11-11 13:10:29'),(1255,'en','I am shopping for...','I am shopping for...','2020-11-11 13:10:29','2020-11-11 13:10:29'),(1257,'en','Compare','Compare','2020-11-11 13:10:29','2020-11-11 13:10:29'),(1259,'en','Wishlist','Wishlist','2020-11-11 13:10:29','2020-11-11 13:10:29'),(1261,'en','Cart','Cart','2020-11-11 13:10:29','2020-11-11 13:10:29'),(1263,'en','Your Cart is empty','Your Cart is empty','2020-11-11 13:10:29','2020-11-11 13:10:29'),(1265,'en','Categories','Categories','2020-11-11 13:10:29','2020-11-11 13:10:29'),(1267,'en','See All','See All','2020-11-11 13:10:29','2020-11-11 13:10:29'),(1269,'en','Seller Policy','Seller Policy','2020-11-11 13:10:29','2020-11-11 13:10:29'),(1271,'en','Return Policy','Return Policy','2020-11-11 13:10:29','2020-11-11 13:10:29'),(1273,'en','Support Policy','Support Policy','2020-11-11 13:10:29','2020-11-11 13:10:29'),(1275,'en','Privacy Policy','Privacy Policy','2020-11-11 13:10:29','2020-11-11 13:10:29'),(1277,'en','Your Email Address','Your Email Address','2020-11-11 13:10:29','2020-11-11 13:10:29'),(1279,'en','Subscribe','Subscribe','2020-11-11 13:10:29','2020-11-11 13:10:29'),(1281,'en','Contact Info','Contact Info','2020-11-11 13:10:29','2020-11-11 13:10:29'),(1283,'en','Address','Address','2020-11-11 13:10:29','2020-11-11 13:10:29'),(1285,'en','Phone','Phone','2020-11-11 13:10:30','2020-11-11 13:10:30'),(1287,'en','Email','Email','2020-11-11 13:10:30','2020-11-11 13:10:30'),(1288,'en','Login','Login','2020-11-11 13:10:30','2020-11-11 13:10:30'),(1289,'en','My Account','My Account','2020-11-11 13:10:30','2020-11-11 13:10:30'),(1291,'en','Login','Login','2020-11-11 13:10:30','2020-11-11 13:10:30'),(1293,'en','Order History','Order History','2020-11-11 13:10:30','2020-11-11 13:10:30'),(1295,'en','My Wishlist','My Wishlist','2020-11-11 13:10:30','2020-11-11 13:10:30'),(1297,'en','Track Order','Track Order','2020-11-11 13:10:30','2020-11-11 13:10:30'),(1299,'en','Be an affiliate partner','Be an affiliate partner','2020-11-11 13:10:30','2020-11-11 13:10:30'),(1301,'en','Be a Seller','Be a Seller','2020-11-11 13:10:30','2020-11-11 13:10:30'),(1303,'en','Apply Now','Apply Now','2020-11-11 13:10:30','2020-11-11 13:10:30'),(1305,'en','Confirmation','Confirmation','2020-11-11 13:10:30','2020-11-11 13:10:30'),(1307,'en','Delete confirmation message','Delete confirmation message','2020-11-11 13:10:30','2020-11-11 13:10:30'),(1309,'en','Cancel','Cancel','2020-11-11 13:10:30','2020-11-11 13:10:30'),(1312,'en','Delete','Delete','2020-11-11 13:10:30','2020-11-11 13:10:30'),(1313,'en','Item has been added to compare list','Item has been added to compare list','2020-11-11 13:10:30','2020-11-11 13:10:30'),(1314,'en','Please login first','Please login first','2020-11-11 13:10:30','2020-11-11 13:10:30'),(1315,'en','Total Earnings From','Total Earnings From','2020-11-12 08:01:11','2020-11-12 08:01:11'),(1316,'en','Client Subscription','Client Subscription','2020-11-12 08:01:12','2020-11-12 08:01:12'),(1317,'en','Product category','Product category','2020-11-12 08:03:46','2020-11-12 08:03:46'),(1318,'en','Product sub sub category','Product sub sub category','2020-11-12 08:03:46','2020-11-12 08:03:46'),(1319,'en','Product sub category','Product sub category','2020-11-12 08:03:46','2020-11-12 08:03:46'),(1320,'en','Product brand','Product brand','2020-11-12 08:03:46','2020-11-12 08:03:46'),(1321,'en','Top Client Packages','Top Client Packages','2020-11-12 08:05:21','2020-11-12 08:05:21'),(1322,'en','Top Freelancer Packages','Top Freelancer Packages','2020-11-12 08:05:21','2020-11-12 08:05:21'),(1323,'en','Number of sale','Number of sale','2020-11-12 09:13:09','2020-11-12 09:13:09'),(1324,'en','Number of Stock','Number of Stock','2020-11-12 09:16:02','2020-11-12 09:16:02'),(1325,'en','Top 10 Products','Top 10 Products','2020-11-12 10:02:29','2020-11-12 10:02:29'),(1326,'en','Top 12 Products','Top 12 Products','2020-11-12 10:02:39','2020-11-12 10:02:39'),(1327,'en','Admin can not be a seller','Admin can not be a seller','2020-11-12 11:30:19','2020-11-12 11:30:19'),(1328,'en','Filter by Rating','Filter by Rating','2020-11-15 08:01:15','2020-11-15 08:01:15'),(1329,'en','Published reviews updated successfully','Published reviews updated successfully','2020-11-15 08:01:15','2020-11-15 08:01:15'),(1330,'en','Refund Sticker has been updated successfully','Refund Sticker has been updated successfully','2020-11-15 08:17:12','2020-11-15 08:17:12'),(1331,'en','Edit Product','Edit Product','2020-11-15 10:31:54','2020-11-15 10:31:54'),(1332,'en','Meta Images','Meta Images','2020-11-15 10:32:12','2020-11-15 10:32:12'),(1333,'en','Update Product','Update Product','2020-11-15 10:32:12','2020-11-15 10:32:12'),(1334,'en','Product has been deleted successfully','Product has been deleted successfully','2020-11-15 10:32:57','2020-11-15 10:32:57'),(1335,'en','Your Profile has been updated successfully!','Your Profile has been updated successfully!','2020-11-15 11:10:42','2020-11-15 11:10:42'),(1336,'en','Upload limit has been reached. Please upgrade your package.','Upload limit has been reached. Please upgrade your package.','2020-11-15 11:13:45','2020-11-15 11:13:45'),(1337,'en','Add Your Product','Add Your Product','2020-11-15 11:17:56','2020-11-15 11:17:56'),(1338,'en','Select a category','Select a category','2020-11-15 11:17:56','2020-11-15 11:17:56'),(1339,'en','Select a brand','Select a brand','2020-11-15 11:17:56','2020-11-15 11:17:56'),(1340,'en','Product Unit','Product Unit','2020-11-15 11:17:56','2020-11-15 11:17:56'),(1341,'en','Minimum Qty.','Minimum Qty.','2020-11-15 11:17:56','2020-11-15 11:17:56'),(1342,'en','Product Tag','Product Tag','2020-11-15 11:17:56','2020-11-15 11:17:56'),(1343,'en','Type & hit enter','Type & hit enter','2020-11-15 11:17:56','2020-11-15 11:17:56'),(1344,'en','Videos','Videos','2020-11-15 11:17:56','2020-11-15 11:17:56'),(1345,'en','Video From','Video From','2020-11-15 11:17:56','2020-11-15 11:17:56'),(1346,'en','Video URL','Video URL','2020-11-15 11:17:56','2020-11-15 11:17:56'),(1347,'en','Customer Choice','Customer Choice','2020-11-15 11:17:56','2020-11-15 11:17:56'),(1348,'en','PDF','PDF','2020-11-15 11:17:56','2020-11-15 11:17:56'),(1349,'en','Choose PDF','Choose PDF','2020-11-15 11:17:56','2020-11-15 11:17:56'),(1350,'en','Select Category','Select Category','2020-11-15 11:17:56','2020-11-15 11:17:56'),(1351,'en','Target Category','Target Category','2020-11-15 11:17:56','2020-11-15 11:17:56'),(1352,'en','subsubcategory','subsubcategory','2020-11-15 11:17:56','2020-11-15 11:17:56'),(1353,'en','Search Category','Search Category','2020-11-15 11:17:56','2020-11-15 11:17:56'),(1354,'en','Search SubCategory','Search SubCategory','2020-11-15 11:17:56','2020-11-15 11:17:56'),(1355,'en','Search SubSubCategory','Search SubSubCategory','2020-11-15 11:17:56','2020-11-15 11:17:56'),(1356,'en','Update your product','Update your product','2020-11-15 11:39:14','2020-11-15 11:39:14'),(1357,'en','Product has been updated successfully','Product has been updated successfully','2020-11-15 11:51:36','2020-11-15 11:51:36'),(1358,'en','Add Your Digital Product','Add Your Digital Product','2020-11-15 12:24:21','2020-11-15 12:24:21'),(1359,'en','Active eCommerce CMS Update Process','Active eCommerce CMS Update Process','2020-11-16 07:53:31','2020-11-16 07:53:31'),(1361,'en','Codecanyon purchase code','Codecanyon purchase code','2020-11-16 07:53:31','2020-11-16 07:53:31'),(1362,'en','Database Name','Database Name','2020-11-16 07:53:31','2020-11-16 07:53:31'),(1363,'en','Database Username','Database Username','2020-11-16 07:53:31','2020-11-16 07:53:31'),(1364,'en','Database Password','Database Password','2020-11-16 07:53:31','2020-11-16 07:53:31'),(1365,'en','Database Hostname','Database Hostname','2020-11-16 07:53:31','2020-11-16 07:53:31'),(1366,'en','Update Now','Update Now','2020-11-16 07:53:31','2020-11-16 07:53:31'),(1368,'en','Congratulations','Congratulations','2020-11-16 07:55:14','2020-11-16 07:55:14'),(1369,'en','You have successfully completed the updating process. Please Login to continue','You have successfully completed the updating process. Please Login to continue','2020-11-16 07:55:14','2020-11-16 07:55:14'),(1370,'en','Go to Home','Go to Home','2020-11-16 07:55:14','2020-11-16 07:55:14'),(1371,'en','Login to Admin panel','Login to Admin panel','2020-11-16 07:55:14','2020-11-16 07:55:14'),(1372,'en','S3 File System Credentials','S3 File System Credentials','2020-11-16 12:59:57','2020-11-16 12:59:57'),(1373,'en','AWS_ACCESS_KEY_ID','AWS_ACCESS_KEY_ID','2020-11-16 12:59:57','2020-11-16 12:59:57'),(1374,'en','AWS_SECRET_ACCESS_KEY','AWS_SECRET_ACCESS_KEY','2020-11-16 12:59:57','2020-11-16 12:59:57'),(1375,'en','AWS_DEFAULT_REGION','AWS_DEFAULT_REGION','2020-11-16 12:59:57','2020-11-16 12:59:57'),(1376,'en','AWS_BUCKET','AWS_BUCKET','2020-11-16 12:59:57','2020-11-16 12:59:57'),(1377,'en','AWS_URL','AWS_URL','2020-11-16 12:59:57','2020-11-16 12:59:57'),(1378,'en','S3 File System Activation','S3 File System Activation','2020-11-16 12:59:57','2020-11-16 12:59:57'),(1379,'en','Your phone number','Your phone number','2020-11-17 05:50:10','2020-11-17 05:50:10'),(1380,'en','Zip File','Zip File','2020-11-17 06:58:45','2020-11-17 06:58:45'),(1381,'en','Install','Install','2020-11-17 06:58:45','2020-11-17 06:58:45'),(1382,'en','This version is not capable of installing Addons, Please update.','This version is not capable of installing Addons, Please update.','2020-11-17 06:59:11','2020-11-17 06:59:11'),(1383,'en','Browse All Categories','Browse All Categories','2021-02-09 09:01:58','2021-02-09 09:01:58'),(1384,'en','Find Our Locations','Find Our Locations','2021-02-09 09:01:58','2021-02-09 09:01:58'),(1385,'en','To Get More Emersive','To Get More Emersive','2021-02-09 09:01:58','2021-02-09 09:01:58'),(1386,'en','Nothing found','Nothing found','2021-04-23 13:21:40','2021-04-23 13:21:40'),(1387,'en','File selected','File selected','2021-04-23 13:21:40','2021-04-23 13:21:40'),(1388,'en','Files selected','Files selected','2021-04-23 13:21:40','2021-04-23 13:21:40'),(1389,'en','Add more files','Add more files','2021-04-23 13:21:40','2021-04-23 13:21:40'),(1390,'en','Adding more files','Adding more files','2021-04-23 13:21:40','2021-04-23 13:21:40'),(1391,'en','Drop files here, paste or','Drop files here, paste or','2021-04-23 13:21:40','2021-04-23 13:21:40'),(1392,'en','Upload complete','Upload complete','2021-04-23 13:21:40','2021-04-23 13:21:40'),(1393,'en','Upload paused','Upload paused','2021-04-23 13:21:40','2021-04-23 13:21:40'),(1394,'en','Resume upload','Resume upload','2021-04-23 13:21:40','2021-04-23 13:21:40'),(1395,'en','Pause upload','Pause upload','2021-04-23 13:21:40','2021-04-23 13:21:40'),(1396,'en','Retry upload','Retry upload','2021-04-23 13:21:40','2021-04-23 13:21:40'),(1397,'en','Cancel upload','Cancel upload','2021-04-23 13:21:40','2021-04-23 13:21:40'),(1398,'en','Uploading','Uploading','2021-04-23 13:21:40','2021-04-23 13:21:40'),(1399,'en','Processing','Processing','2021-04-23 13:21:40','2021-04-23 13:21:40'),(1400,'en','Complete','Complete','2021-04-23 13:21:40','2021-04-23 13:21:40'),(1401,'en','Files','Files','2021-04-23 13:21:40','2021-04-23 13:21:40'),(1402,'en','Blogs','Blogs','2021-04-23 13:21:41','2021-04-23 13:21:41'),(1403,'en','View All Sellers','View All Sellers','2021-04-23 13:21:42','2021-04-23 13:21:42'),(1404,'en','Please Configure SMTP Setting to work all email sending functionality','Please Configure SMTP Setting to work all email sending functionality','2021-04-23 13:22:02','2021-04-23 13:22:02'),(1405,'en','Order','Order','2021-04-23 13:22:02','2021-04-23 13:22:02'),(1406,'en','Search in menu','Search in menu','2021-04-23 13:22:03','2021-04-23 13:22:03'),(1407,'en','Uploaded Files','Uploaded Files','2021-04-23 13:22:03','2021-04-23 13:22:03'),(1408,'en','Commission History','Commission History','2021-04-23 13:22:03','2021-04-23 13:22:03'),(1409,'en','Wallet Recharge History','Wallet Recharge History','2021-04-23 13:22:03','2021-04-23 13:22:03'),(1410,'en','Blog System','Blog System','2021-04-23 13:22:03','2021-04-23 13:22:03'),(1411,'en','All Posts','All Posts','2021-04-23 13:22:03','2021-04-23 13:22:03'),(1412,'en','Vat & TAX','Vat & TAX','2021-04-23 13:22:03','2021-04-23 13:22:03'),(1413,'en','Facebook Comment','Facebook Comment','2021-04-23 13:22:03','2021-04-23 13:22:03'),(1414,'en','Shipping Cities','Shipping Cities','2021-04-23 13:22:03','2021-04-23 13:22:03'),(1415,'en','System','System','2021-04-23 13:22:03','2021-04-23 13:22:03'),(1416,'en','Server status','Server status','2021-04-23 13:22:03','2021-04-23 13:22:03'),(1417,'en','Pickup Point Information','Pickup Point Information','2021-04-23 13:24:14','2021-04-23 13:24:14'),(1418,'en','Pickup Point Status','Pickup Point Status','2021-04-23 13:24:14','2021-04-23 13:24:14'),(1419,'en','Pick-up Point Manager','Pick-up Point Manager','2021-04-23 13:24:14','2021-04-23 13:24:14'),(1420,'en','Header Nav Menu','Header Nav Menu','2021-04-23 13:27:39','2021-04-23 13:27:39'),(1421,'en','Link with','Link with','2021-04-23 13:27:39','2021-04-23 13:27:39'),(1422,'en','Search your files','Search your files','2021-04-23 13:27:53','2021-04-23 13:27:53'),(1423,'en','Cookies Agreement','Cookies Agreement','2021-04-23 13:30:21','2021-04-23 13:30:21'),(1424,'en','Cookies Agreement Text','Cookies Agreement Text','2021-04-23 13:30:21','2021-04-23 13:30:21'),(1425,'en','Show Cookies Agreement?','Show Cookies Agreement?','2021-04-23 13:30:21','2021-04-23 13:30:21'),(1426,'en','Custom Script','Custom Script','2021-04-23 13:30:21','2021-04-23 13:30:21'),(1427,'en','Header custom script - before </head>','Header custom script - before </head>','2021-04-23 13:30:21','2021-04-23 13:30:21'),(1428,'en','Write script with <script> tag','Write script with <script> tag','2021-04-23 13:30:21','2021-04-23 13:30:21'),(1429,'en','Footer custom script - before </body>','Footer custom script - before </body>','2021-04-23 13:30:21','2021-04-23 13:30:21'),(1430,'en','Services','Services','2021-04-23 14:29:34','2021-04-23 14:29:34'),(1431,'en','Install/Update Addon','Install/Update Addon','2021-04-23 15:08:47','2021-04-23 15:08:47'),(1432,'en','No Addon Installed','No Addon Installed','2021-04-23 15:08:47','2021-04-23 15:08:47'),(1433,'en','Install/Update','Install/Update','2021-04-23 15:08:51','2021-04-23 15:08:51'),(1435,'en','Affiliate Logs','Affiliate Logs','2021-04-23 15:09:22','2021-04-23 15:09:22'),(1439,'en','Addon nstalled successfully','Addon nstalled successfully','2021-04-23 15:10:35','2021-04-23 15:10:35'),(1440,'en','This addon is updated successfully','This addon is updated successfully','2021-04-23 15:10:47','2021-04-23 15:10:47'),(1441,'en','Approved Refunds','Approved Refunds','2021-04-23 15:11:11','2021-04-23 15:11:11'),(1442,'en','rejected Refunds','rejected Refunds','2021-04-23 15:11:11','2021-04-23 15:11:11'),(1443,'en','All cities','All cities','2021-04-23 15:12:49','2021-04-23 15:12:49'),(1444,'en','Cities','Cities','2021-04-23 15:12:50','2021-04-23 15:12:50'),(1445,'en','Cost','Cost','2021-04-23 15:12:50','2021-04-23 15:12:50'),(1446,'en','Add New city','Add New city','2021-04-23 15:12:50','2021-04-23 15:12:50'),(1447,'en','City has been inserted successfully','City has been inserted successfully','2021-04-23 15:13:11','2021-04-23 15:13:11'),(1448,'en','Has district','Has district','2021-04-23 15:21:06','2021-04-23 15:21:06'),(1449,'en','City Information','City Information','2021-04-23 15:21:11','2021-04-23 15:21:11'),(1450,'en','City has been updated successfully','City has been updated successfully','2021-04-23 15:22:47','2021-04-23 15:22:47'),(1451,'en','All Districts','All Districts','2021-04-23 15:24:19','2021-04-23 15:24:19'),(1452,'en','Districts','Districts','2021-04-23 15:24:19','2021-04-23 15:24:19'),(1453,'en','Add New District','Add New District','2021-04-23 15:29:00','2021-04-23 15:29:00'),(1454,'en','District has been inserted successfully','District has been inserted successfully','2021-04-23 15:31:19','2021-04-23 15:31:19'),(1455,'en','Products and Services','Products and Services','2021-04-23 15:59:10','2021-04-23 15:59:10'),(1456,'en','Add New Service','Add New Service','2021-04-23 15:59:10','2021-04-23 15:59:10'),(1457,'en','All Services','All Services','2021-04-23 15:59:10','2021-04-23 15:59:10'),(1458,'en','Shipping Districts','Shipping Districts','2021-04-23 15:59:11','2021-04-23 15:59:11'),(1459,'en','Service Information','Service Information','2021-04-23 15:59:16','2021-04-23 15:59:16'),(1460,'en','Service Name','Service Name','2021-04-23 15:59:16','2021-04-23 15:59:16'),(1461,'en','This is used for search. Input those words by which cutomer can find this Service.','This is used for search. Input those words by which cutomer can find this Service.','2021-04-23 15:59:17','2021-04-23 15:59:17'),(1462,'en','These images are visible in Service details page gallery. Use 600x600 sizes images.','These images are visible in Service details page gallery. Use 600x600 sizes images.','2021-04-23 15:59:17','2021-04-23 15:59:17'),(1463,'en','This image is visible in all Service box. Use 300x300 sizes image. Keep some blank space around main object of your image as we had to crop some edge in different devices to make it responsive.','This image is visible in all Service box. Use 300x300 sizes image. Keep some blank space around main object of your image as we had to crop some edge in different devices to make it responsive.','2021-04-23 15:59:17','2021-04-23 15:59:17'),(1464,'en','Service Videos','Service Videos','2021-04-23 15:59:17','2021-04-23 15:59:17'),(1465,'en','Use proper link without extra parameter. Don\'t use short share link/embeded iframe code.','Use proper link without extra parameter. Don\'t use short share link/embeded iframe code.','2021-04-23 15:59:17','2021-04-23 15:59:17'),(1466,'en','Service Variation','Service Variation','2021-04-23 15:59:17','2021-04-23 15:59:17'),(1467,'en','Choose the attributes of this Service and then input values of each attribute','Choose the attributes of this Service and then input values of each attribute','2021-04-23 15:59:17','2021-04-23 15:59:17'),(1468,'en','Service price + stock','Service price + stock','2021-04-23 15:59:17','2021-04-23 15:59:17'),(1469,'en','Service Description','Service Description','2021-04-23 15:59:17','2021-04-23 15:59:17'),(1470,'en','Service Shipping Cost','Service Shipping Cost','2021-04-23 15:59:17','2021-04-23 15:59:17'),(1471,'en','Save Service','Save Service','2021-04-23 15:59:17','2021-04-23 15:59:17'),(1472,'en','Wallet Transaction Report','Wallet Transaction Report','2021-04-23 15:59:46','2021-04-23 15:59:46'),(1473,'en','Wallet Transaction','Wallet Transaction','2021-04-23 15:59:46','2021-04-23 15:59:46'),(1474,'en','Choose User','Choose User','2021-04-23 15:59:46','2021-04-23 15:59:46'),(1475,'en','Daterange','Daterange','2021-04-23 15:59:46','2021-04-23 15:59:46'),(1476,'en','Parent Category','Parent Category','2021-04-23 16:26:57','2021-04-23 16:26:57'),(1477,'en','Order Level','Order Level','2021-04-23 16:26:57','2021-04-23 16:26:57'),(1478,'en','Level','Level','2021-04-23 16:26:57','2021-04-23 16:26:57'),(1479,'en','Category Information','Category Information','2021-04-23 16:27:00','2021-04-23 16:27:00'),(1480,'en','No Parent','No Parent','2021-04-23 16:27:00','2021-04-23 16:27:00'),(1481,'en','Ordering Number','Ordering Number','2021-04-23 16:27:00','2021-04-23 16:27:00'),(1482,'en','Physical','Physical','2021-04-23 16:27:00','2021-04-23 16:27:00'),(1483,'en','Digital','Digital','2021-04-23 16:27:00','2021-04-23 16:27:00'),(1484,'en','200x200','200x200','2021-04-23 16:27:00','2021-04-23 16:27:00'),(1485,'en','32x32','32x32','2021-04-23 16:27:00','2021-04-23 16:27:00'),(1486,'en','Is a Service Category','Is a Service Category','2021-04-23 16:27:00','2021-04-23 16:27:00'),(1487,'en','Featured Products and Services','Featured Products and Services','2021-04-26 09:40:59','2021-04-26 09:40:59'),(1488,'en','Best Booking','Best Booking','2021-04-26 09:52:30','2021-04-26 09:52:30'),(1489,'en','Info','Info','2021-04-26 10:27:44','2021-04-26 10:27:44'),(1490,'en','This is used for search. Input those words by which cutomer can find this product.','This is used for search. Input those words by which cutomer can find this product.','2021-04-26 10:27:51','2021-04-26 10:27:51'),(1491,'en','These images are visible in product details page gallery. Use 600x600 sizes images.','These images are visible in product details page gallery. Use 600x600 sizes images.','2021-04-26 10:27:51','2021-04-26 10:27:51'),(1492,'en','This image is visible in all product box. Use 300x300 sizes image. Keep some blank space around main object of your image as we had to crop some edge in different devices to make it responsive.','This image is visible in all product box. Use 300x300 sizes image. Keep some blank space around main object of your image as we had to crop some edge in different devices to make it responsive.','2021-04-26 10:27:51','2021-04-26 10:27:51'),(1493,'en','Product Wise Shipping','Product Wise Shipping','2021-04-26 10:27:52','2021-04-26 10:27:52'),(1494,'en','Douala','Douala','2021-04-26 10:27:52','2021-04-26 10:27:52'),(1495,'en','Is Product Quantity Mulitiply','Is Product Quantity Mulitiply','2021-04-26 10:27:52','2021-04-26 10:27:52'),(1496,'en','Low Stock Quantity Warning','Low Stock Quantity Warning','2021-04-26 10:27:52','2021-04-26 10:27:52'),(1497,'en','Stock Visibility State','Stock Visibility State','2021-04-26 10:27:52','2021-04-26 10:27:52'),(1498,'en','Show Stock Quantity','Show Stock Quantity','2021-04-26 10:27:52','2021-04-26 10:27:52'),(1499,'en','Show Stock With Text Only','Show Stock With Text Only','2021-04-26 10:27:52','2021-04-26 10:27:52'),(1500,'en','Hide Stock','Hide Stock','2021-04-26 10:27:52','2021-04-26 10:27:52'),(1501,'en','Flash Deal','Flash Deal','2021-04-26 10:27:52','2021-04-26 10:27:52'),(1502,'en','Add To Flash','Add To Flash','2021-04-26 10:27:52','2021-04-26 10:27:52'),(1503,'en','Estimate Shipping Time','Estimate Shipping Time','2021-04-26 10:27:52','2021-04-26 10:27:52'),(1504,'en','Shipping Days','Shipping Days','2021-04-26 10:27:52','2021-04-26 10:27:52'),(1505,'en','Save As Draft','Save As Draft','2021-04-26 10:27:52','2021-04-26 10:27:52'),(1506,'en','Save & Unpublish','Save & Unpublish','2021-04-26 10:27:52','2021-04-26 10:27:52'),(1507,'en','Save & Publish','Save & Publish','2021-04-26 10:27:52','2021-04-26 10:27:52'),(1508,'en','Reject Refund Request !','Reject Refund Request !','2021-04-26 14:21:51','2021-04-26 14:21:51'),(1509,'en','Reject Reason','Reject Reason','2021-04-26 14:21:51','2021-04-26 14:21:51'),(1510,'en','Submit','Submit','2021-04-26 14:21:51','2021-04-26 14:21:51'),(1511,'en','Approval has been done successfully','Approval has been done successfully','2021-04-26 14:21:51','2021-04-26 14:21:51'),(1512,'en','Refund has been sent successfully','Refund has been sent successfully','2021-04-26 14:21:51','2021-04-26 14:21:51'),(1513,'en','Filter by date','Filter by date','2021-04-26 14:21:58','2021-04-26 14:21:58'),(1514,'en','Save Product','Save Product','2021-04-26 14:26:05','2021-04-26 14:26:05');
/*!40000 ALTER TABLE `translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `uploads`
--

DROP TABLE IF EXISTS `uploads`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `uploads` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `file_original_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `file_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `file_size` int(11) DEFAULT NULL,
  `extension` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `uploads`
--

LOCK TABLES `uploads` WRITE;
/*!40000 ALTER TABLE `uploads` DISABLE KEYS */;
INSERT INTO `uploads` VALUES (1,'logo saunya','uploads/all/Fs2wctrWI09Ukuyzs8Dr0fSCqzVzYK33Ef88BtFU.png',9,28303,'png','image','2021-04-23 13:28:07','2021-04-23 13:28:07',NULL),(2,'orange money','uploads/all/2VLIh18f4Sy6JN5QgAt8DqjgpbtCUyEvryqB1LFP.jpg',9,24672,'jpg','image','2021-04-23 13:31:58','2021-04-23 13:31:58',NULL),(3,'mtn momo','uploads/all/KpAh3oufJVTP7rXWQn3UiIS7AuYDKaoviucufaZV.png',9,48816,'png','image','2021-04-23 13:32:21','2021-04-23 13:32:21',NULL);
/*!40000 ALTER TABLE `uploads` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `referred_by` int(11) DEFAULT NULL,
  `provider_id` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_type` varchar(10) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'customer',
  `name` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `verification_code` text COLLATE utf8_unicode_ci,
  `new_email_verificiation_code` text COLLATE utf8_unicode_ci,
  `password` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `avatar` varchar(256) COLLATE utf8_unicode_ci DEFAULT NULL,
  `avatar_original` varchar(256) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address` varchar(300) COLLATE utf8_unicode_ci DEFAULT NULL,
  `country` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `city` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `postal_code` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `balance` double(20,2) NOT NULL DEFAULT '0.00',
  `banned` tinyint(4) NOT NULL DEFAULT '0',
  `referral_code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `customer_package_id` int(11) DEFAULT NULL,
  `remaining_uploads` int(11) DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (3,NULL,NULL,'seller','Mr. Seller','seller@example.com','2018-12-11 18:00:00',NULL,NULL,'$2y$10$eUKRlkmm2TAug75cfGQ4i.WoUbcJ2uVPqUlVkox.cv4CCyGEIMQEm','1zoU4eQxnOC5yxRWLsTzMNBPpJuOvTk4g3GMUVYIrbGijiXHOfIlFq0wHrIn','https://lh3.googleusercontent.com/-7OnRtLyua5Q/AAAAAAAAAAI/AAAAAAAADRk/VqWKMl4f8CI/photo.jpg?sz=50',NULL,'Demo address','US','Demo city','1234',NULL,0.00,0,'3dLUoHsR1l',NULL,NULL,'2018-10-07 04:42:57','2020-03-05 01:33:22'),(8,NULL,NULL,'customer','Mr. Customer','customer@example.com','2018-12-11 18:00:00',NULL,NULL,'$2y$10$eUKRlkmm2TAug75cfGQ4i.WoUbcJ2uVPqUlVkox.cv4CCyGEIMQEm','9ndcz5o7xgnuxctJIbvUQcP41QKmgnWCc7JDSnWdHOvipOP2AijpamCNafEe','https://lh3.googleusercontent.com/-7OnRtLyua5Q/AAAAAAAAAAI/AAAAAAAADRk/VqWKMl4f8CI/photo.jpg?sz=50',NULL,'Demo address','US','Demo city','1234',NULL,0.00,0,'8zJTyXTlTT',NULL,NULL,'2018-10-07 04:42:57','2020-03-03 04:26:11'),(9,NULL,NULL,'admin','saunya cosmetics','info@saunya.com','2021-04-23 13:04:31',NULL,NULL,'$2y$10$BLoTB2Jpp.w.QlWomGZkAeSohjKU.4HiVSfu7Yhnd8hqx8DpwA8pi',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0.00,0,NULL,NULL,0,'2021-04-23 13:21:31','2021-04-23 13:21:31');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wallets`
--

DROP TABLE IF EXISTS `wallets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wallets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `amount` double(20,2) NOT NULL,
  `payment_method` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `payment_details` longtext COLLATE utf8_unicode_ci,
  `approval` int(1) NOT NULL DEFAULT '0',
  `offline_payment` int(1) NOT NULL DEFAULT '0',
  `reciept` varchar(150) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wallets`
--

LOCK TABLES `wallets` WRITE;
/*!40000 ALTER TABLE `wallets` DISABLE KEYS */;
/*!40000 ALTER TABLE `wallets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wishlists`
--

DROP TABLE IF EXISTS `wishlists`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wishlists` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wishlists`
--

LOCK TABLES `wishlists` WRITE;
/*!40000 ALTER TABLE `wishlists` DISABLE KEYS */;
/*!40000 ALTER TABLE `wishlists` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-04-27 18:12:46