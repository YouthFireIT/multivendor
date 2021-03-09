-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Mar 04, 2021 at 09:46 AM
-- Server version: 10.4.10-MariaDB
-- PHP Version: 7.3.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `alibaba`
--

-- --------------------------------------------------------

--
-- Table structure for table `addons`
--

DROP TABLE IF EXISTS `addons`;
CREATE TABLE IF NOT EXISTS `addons` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf32_unicode_ci DEFAULT NULL,
  `unique_identifier` varchar(255) COLLATE utf32_unicode_ci DEFAULT NULL,
  `version` varchar(255) COLLATE utf32_unicode_ci DEFAULT NULL,
  `activated` int(1) NOT NULL DEFAULT 1,
  `image` varchar(1000) COLLATE utf32_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf32 COLLATE=utf32_unicode_ci;

--
-- Dumping data for table `addons`
--

INSERT INTO `addons` (`id`, `name`, `unique_identifier`, `version`, `activated`, `image`, `created_at`, `updated_at`) VALUES
(10, 'refund', 'refund_request', '1.0', 1, 'refund_request.png', '2020-06-15 19:18:16', '2020-06-15 19:18:16'),
(11, 'affiliate', 'affiliate_system', '1.1', 1, 'affiliate_banner.jpg', '2020-06-15 19:18:29', '2020-06-15 19:18:29'),
(12, 'club_point', 'club_point', '1.0', 1, 'club_points.png', '2020-06-15 19:18:40', '2020-06-15 19:18:40'),
(13, 'subscription', 'subscription', '1.0', 1, 'subscription.png', '2020-06-15 19:18:51', '2020-06-15 19:18:51'),
(14, 'Point of Sale', 'pos_system', '1.1', 1, 'pos_banner.jpg', '2020-08-26 00:23:40', '2020-08-26 00:23:40');

-- --------------------------------------------------------

--
-- Table structure for table `addresses`
--

DROP TABLE IF EXISTS `addresses`;
CREATE TABLE IF NOT EXISTS `addresses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `address` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `country` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `city` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `postal_code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `set_default` int(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `addresses`
--

INSERT INTO `addresses` (`id`, `user_id`, `address`, `country`, `city`, `postal_code`, `phone`, `set_default`, `created_at`, `updated_at`) VALUES
(1, 12, 'ffffcv', 'Bangladesh', 'dhaka', '1217', '1919946826', 0, '2020-09-02 18:46:11', '2020-09-02 18:46:11'),
(2, 12, 'dottobari', 'Bangladesh', 'sirajganj', '6700', '01718570043', 0, '2020-09-10 18:08:58', '2020-09-10 18:08:58'),
(3, 18, 'abdul', 'Bangladesh', 'sirajganj', '6700', '01718570043', 0, '2020-09-12 19:36:18', '2020-09-12 19:36:18'),
(4, 12, 'Dhaka', 'Bangladesh', 'Dhaka', '880', '01839944681', 0, '2021-01-26 07:25:14', '2021-01-26 07:25:14'),
(5, 36, 'test', 'Bangladesh', 'Dhaka', '880', '0183995454', 0, '2021-01-26 09:57:46', '2021-01-26 09:57:46');

-- --------------------------------------------------------

--
-- Table structure for table `advertising_images`
--

DROP TABLE IF EXISTS `advertising_images`;
CREATE TABLE IF NOT EXISTS `advertising_images` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `image` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `advertising_images`
--

INSERT INTO `advertising_images` (`id`, `image`) VALUES
(1, 'uploads/Advertising_image/1603688318.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `affiliate_configs`
--

DROP TABLE IF EXISTS `affiliate_configs`;
CREATE TABLE IF NOT EXISTS `affiliate_configs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(1000) COLLATE utf32_unicode_ci DEFAULT NULL,
  `value` text COLLATE utf32_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf32 COLLATE=utf32_unicode_ci;

--
-- Dumping data for table `affiliate_configs`
--

INSERT INTO `affiliate_configs` (`id`, `type`, `value`, `created_at`, `updated_at`) VALUES
(1, 'verification_form', '[{\"type\":\"text\",\"label\":\"Your name\"},{\"type\":\"text\",\"label\":\"Email\"},{\"type\":\"text\",\"label\":\"Full Address\"},{\"type\":\"text\",\"label\":\"Phone Number\"},{\"type\":\"text\",\"label\":\"How will you affiliate?\"}]', '2020-03-09 09:56:21', '2020-03-09 04:30:59');

-- --------------------------------------------------------

--
-- Table structure for table `affiliate_options`
--

DROP TABLE IF EXISTS `affiliate_options`;
CREATE TABLE IF NOT EXISTS `affiliate_options` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(255) COLLATE utf32_unicode_ci DEFAULT NULL,
  `details` longtext COLLATE utf32_unicode_ci DEFAULT NULL,
  `percentage` double NOT NULL DEFAULT 0,
  `status` int(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf32 COLLATE=utf32_unicode_ci;

--
-- Dumping data for table `affiliate_options`
--

INSERT INTO `affiliate_options` (`id`, `type`, `details`, `percentage`, `status`, `created_at`, `updated_at`) VALUES
(2, 'user_registration_first_purchase', '[]', 20, 1, '2020-03-03 05:08:37', '2020-09-12 17:48:13'),
(3, 'product_sharing', NULL, 20, 0, '2020-03-08 01:55:03', '2020-03-10 02:12:32'),
(4, 'category_wise_affiliate', NULL, 0, 0, '2020-03-08 01:55:03', '2020-03-10 02:12:32');

-- --------------------------------------------------------

--
-- Table structure for table `affiliate_payments`
--

DROP TABLE IF EXISTS `affiliate_payments`;
CREATE TABLE IF NOT EXISTS `affiliate_payments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `affiliate_user_id` int(11) NOT NULL,
  `amount` double(8,2) NOT NULL,
  `payment_method` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `payment_details` longtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `affiliate_payments`
--

INSERT INTO `affiliate_payments` (`id`, `affiliate_user_id`, `amount`, `payment_method`, `payment_details`, `created_at`, `updated_at`) VALUES
(2, 1, 20.00, 'Paypal', NULL, '2020-03-10 02:04:30', '2020-03-10 02:04:30');

-- --------------------------------------------------------

--
-- Table structure for table `affiliate_users`
--

DROP TABLE IF EXISTS `affiliate_users`;
CREATE TABLE IF NOT EXISTS `affiliate_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `paypal_email` varchar(255) COLLATE utf32_unicode_ci DEFAULT NULL,
  `bank_information` text COLLATE utf32_unicode_ci DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `informations` text COLLATE utf32_unicode_ci DEFAULT NULL,
  `balance` double(10,2) NOT NULL DEFAULT 0.00,
  `status` int(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf32 COLLATE=utf32_unicode_ci;

--
-- Dumping data for table `affiliate_users`
--

INSERT INTO `affiliate_users` (`id`, `paypal_email`, `bank_information`, `user_id`, `informations`, `balance`, `status`, `created_at`, `updated_at`) VALUES
(1, 'demo@gmail.com', '123456', 8, '[{\"type\":\"text\",\"label\":\"Your name\",\"value\":\"Nostrum dicta sint l\"},{\"type\":\"text\",\"label\":\"Email\",\"value\":\"Aut perferendis null\"},{\"type\":\"text\",\"label\":\"Full Address\",\"value\":\"Voluptatem Sit dolo\"},{\"type\":\"text\",\"label\":\"Phone Number\",\"value\":\"Ut ad beatae occaeca\"},{\"type\":\"text\",\"label\":\"How will you affiliate?\",\"value\":\"Porro sint soluta u\"}]', 30.00, 1, '2020-03-09 05:35:07', '2020-03-10 02:04:30'),
(2, NULL, NULL, 18, '[{\"type\":\"text\",\"label\":\"Your name\",\"value\":\"Zaman Computer\"},{\"type\":\"text\",\"label\":\"Email\",\"value\":\"wasimbar@gmail.com\"},{\"type\":\"text\",\"label\":\"Full Address\",\"value\":\"Computer City center, multiplan, Shop#434, Level # 4, 69-71, New Elephant road Dhaka-1205\"},{\"type\":\"text\",\"label\":\"Phone Number\",\"value\":\"01913987683\"},{\"type\":\"text\",\"label\":\"How will you affiliate?\",\"value\":\"Zaman computer\"}]', 0.00, 0, '2020-09-12 19:28:17', '2020-09-12 19:28:17');

-- --------------------------------------------------------

--
-- Table structure for table `app_settings`
--

DROP TABLE IF EXISTS `app_settings`;
CREATE TABLE IF NOT EXISTS `app_settings` (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
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

--
-- Dumping data for table `app_settings`
--

INSERT INTO `app_settings` (`id`, `name`, `logo`, `currency_id`, `currency_format`, `facebook`, `twitter`, `instagram`, `youtube`, `google_plus`, `created_at`, `updated_at`) VALUES
(1, 'MATGGAR', 'uploads/logo/matggar.png', 1, 'symbol', 'https://facebook.com', 'https://twitter.com', 'https://instagram.com', 'https://youtube.com', 'https://google.com', '2019-08-04 16:39:15', '2019-08-04 16:39:18');

-- --------------------------------------------------------

--
-- Table structure for table `attributes`
--

DROP TABLE IF EXISTS `attributes`;
CREATE TABLE IF NOT EXISTS `attributes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf32_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf32 COLLATE=utf32_unicode_ci;

--
-- Dumping data for table `attributes`
--

INSERT INTO `attributes` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Size', '2020-02-24 05:55:07', '2020-02-24 05:55:07'),
(2, 'Fabric', '2020-02-24 05:55:13', '2020-02-24 05:55:13');

-- --------------------------------------------------------

--
-- Table structure for table `banners`
--

DROP TABLE IF EXISTS `banners`;
CREATE TABLE IF NOT EXISTS `banners` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `photo` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `url` varchar(1000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `position` int(11) NOT NULL DEFAULT 1,
  `published` int(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `banners`
--

INSERT INTO `banners` (`id`, `photo`, `url`, `position`, `published`, `created_at`, `updated_at`) VALUES
(4, 'uploads/banners/banner.jpg', '#', 1, 0, '2019-03-12 05:58:23', '2020-06-21 10:10:46'),
(5, 'uploads/banners/banner.jpg', '#', 1, 0, '2019-03-12 05:58:41', '2020-06-21 10:10:47'),
(6, 'uploads/banners/banner.jpg', '#', 2, 1, '2019-03-12 05:58:52', '2019-03-12 05:58:57'),
(7, 'uploads/banners/banner.jpg', '#', 2, 1, '2019-05-26 05:16:38', '2019-05-26 05:17:34'),
(8, 'uploads/banners/banner.jpg', '#', 2, 1, '2019-06-11 05:00:06', '2019-06-11 05:00:27'),
(9, 'uploads/banners/banner.jpg', '#', 1, 0, '2019-06-11 05:00:15', '2020-06-21 10:10:00'),
(10, 'uploads/banners/banner.jpg', '#', 1, 0, '2019-06-11 05:00:24', '2019-06-11 05:01:56'),
(11, 'uploads/banners/oMW7BwuzD1Z4Riec07EpqUdDSNn21R3wknU086K3.png', 'banner01', 1, 0, '2020-06-21 10:08:34', '2020-07-16 10:00:23');

-- --------------------------------------------------------

--
-- Table structure for table `brands`
--

DROP TABLE IF EXISTS `brands`;
CREATE TABLE IF NOT EXISTS `brands` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `is_featured` tinyint(2) NOT NULL DEFAULT 0,
  `logo` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `top` int(1) NOT NULL DEFAULT 0,
  `slug` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `meta_title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `meta_description` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `brands`
--

INSERT INTO `brands` (`id`, `name`, `is_featured`, `logo`, `top`, `slug`, `meta_title`, `meta_description`, `created_at`, `updated_at`) VALUES
(1, 'Demo brand', 0, 'uploads/brands/brand.jpg', 1, 'Demo-brand-12', 'Demo brand', NULL, '2019-03-12 06:05:56', '2019-08-06 06:52:40'),
(2, 'JILONG', 1, 'uploads/brands/jv9KJkdHBZWXR1Bl6RsfFCqW5BbQknpbQK9CkroB.jpeg', 1, 'Demo-brand1', 'JILONG KL-280G  Fiber Splicer Machine with 5.7\" Color LCD', NULL, '2019-03-12 06:06:13', '2020-06-17 15:59:28'),
(5, 'Hp', 1, 'uploads/brands/Jn06gCzqbjDTBBiK2UkF2fYoabHpdNQpGC0AOd5U.jpeg', 0, 'Hp-qPdVl', 'hp', NULL, '2020-06-16 14:36:03', '2020-06-16 14:47:21'),
(6, 'Altai', 0, 'uploads/brands/RtUZM9x5IKbFN4FBlQuihVAqH64Z95AGyIRjROZU.jpeg', 0, 'Altai-yrH2D', 'WiFi router', NULL, '2020-06-16 14:45:59', '2020-06-16 14:45:59'),
(7, 'Dell', 0, 'uploads/brands/en0vMjzTD4lzSLOHqjfc3uMst0umCNSeCfJvFoNo.jpeg', 0, 'Dell-yVe58', NULL, NULL, '2020-06-16 14:56:33', '2020-06-16 14:56:33'),
(8, 'Lenovo', 0, 'uploads/brands/Lm2Y4p3wQY2jFLQDwvPcXQJiTuGmJqQzOmOPRq0W.png', 0, 'Lenovo-GqgI1', 'lv', NULL, '2020-06-16 14:57:16', '2020-06-16 14:57:16'),
(9, 'walton', 0, 'uploads/brands/MpIquPgURCBrVabdZFHOXk8ZABLQSX4EiMW0bnvb.png', 0, 'walton-0niqe', 'WL', NULL, '2020-06-16 14:57:45', '2020-06-16 14:57:45'),
(10, 'Acer', 1, 'uploads/brands/IuitXFMNNLYoTVTK1d8nXpnN8p1O1kvzamqVWLyH.jpeg', 0, 'Acer-o3w7B', NULL, NULL, '2020-06-16 14:58:19', '2020-06-16 14:58:19'),
(11, 'Msi', 0, 'uploads/brands/Sgh2Ol9x0T9MXTDucNp2uYRV6DbihxuLcdaiC1NC.png', 0, 'Msi-q3YDE', NULL, NULL, '2020-06-16 14:59:32', '2020-06-16 14:59:32'),
(12, 'jamuna fashion', 0, NULL, 0, 'jamuna-fashon-9nqN1', NULL, NULL, '2020-06-16 17:40:34', '2020-06-16 20:18:30'),
(13, 'altai', 0, 'uploads/brands/cccNVDELWY6iS1XGydWZF9IQnFADsvwTxx16NQeG.jpeg', 0, 'altai-HOAtw', 'altai', NULL, '2020-06-18 11:03:18', '2020-07-16 10:11:30'),
(14, 'pentanik', 1, NULL, 0, 'pentanik-JyZlg', 'pentanik', NULL, '2020-06-18 20:12:35', '2020-06-18 20:12:35'),
(15, 'Tp link', 0, 'uploads/brands/TT8MX9AWYLuU9GmHK2ikoLO27HSAH6KgNpMCAHpQ.png', 0, 'Tp-link-85c6k', 'Router, Wifi router,', NULL, '2020-06-23 14:14:59', '2020-07-16 10:09:28'),
(16, 'Mikrotik', 0, 'uploads/brands/8qiVCUFU6FX3WNuyLgwUNf3TqlrMvBupU6PFf7WT.jpeg', 0, 'Mikrotik-h9MdI', 'Router, Wifi router, ccr', NULL, '2020-07-02 20:29:22', '2020-07-16 10:10:32'),
(17, 'Fusion', 0, NULL, 0, 'Fusion-GQIkb', 'optical Splicer,', NULL, '2020-07-07 12:50:04', '2020-07-07 12:50:04'),
(18, 'D-link', 1, 'uploads/brands/6XG9JMQFSDfawPbSRWKuQuAJcnVNsmGPgYv3R3yK.png', 0, 'D-link-sCljM', 'D-link', NULL, '2020-09-02 13:49:42', '2020-09-02 13:49:42'),
(19, 'X-tech', 1, 'uploads/brands/RQKzx6eXMAhZeECp9ATiWz5YOVA8lY13xXOo5lgs.png', 0, 'X-tech-sIOEq', 'X-tech', NULL, '2020-09-02 13:51:40', '2020-09-02 13:51:40'),
(20, 'mi', 0, 'uploads/brands/vUSJSBUBFhHvya72GQIU6cJ1S2XgLCGYANUnx52r.png', 0, 'mi-KjO2D', 'mi router', NULL, '2020-09-13 07:53:27', '2020-09-13 07:54:04'),
(21, 'SzADP', 0, NULL, 0, 'SzADP-otaaC', 'cat6 cable', NULL, '2020-09-13 07:54:39', '2020-09-13 07:54:39'),
(22, 'Tenda', 1, 'uploads/brands/tY9ygEDUUqHS0T5jcWhgBAclwZuXCOWqaGbGRLZ2.png', 0, 'Tenda-WLWe7', 'tenda Router', NULL, '2020-09-13 07:55:52', '2020-09-13 07:57:09'),
(23, 'Vsol', 1, 'uploads/brands/ZAp2WONup6Tath47PmZaR0C1Un0MnB75H6Owi5QY.png', 0, 'Vsol-Dv9gG', 'Vsol onu', NULL, '2020-09-13 07:57:45', '2020-09-13 07:57:45'),
(24, 'Union', 1, NULL, 0, 'Union-hiaR0', 'pipe', NULL, '2020-09-14 17:22:35', '2020-09-14 17:22:35');

-- --------------------------------------------------------

--
-- Table structure for table `business_settings`
--

DROP TABLE IF EXISTS `business_settings`;
CREATE TABLE IF NOT EXISTS `business_settings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `value` longtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `business_settings`
--

INSERT INTO `business_settings` (`id`, `type`, `value`, `created_at`, `updated_at`) VALUES
(1, 'home_default_currency', '27', '2018-10-16 01:35:52', '2020-06-15 17:33:05'),
(2, 'system_default_currency', '27', '2018-10-16 01:36:58', '2020-06-15 17:33:05'),
(3, 'currency_format', '1', '2018-10-17 03:01:59', '2018-10-17 03:01:59'),
(4, 'symbol_format', '1', '2018-10-17 03:01:59', '2019-01-20 02:10:55'),
(5, 'no_of_decimals', '3', '2018-10-17 03:01:59', '2020-03-04 00:57:16'),
(6, 'product_activation', '1', '2018-10-28 01:38:37', '2019-02-04 01:11:41'),
(7, 'vendor_system_activation', '1', '2018-10-28 07:44:16', '2020-09-12 14:31:18'),
(8, 'show_vendors', '1', '2018-10-28 07:44:47', '2019-02-04 01:11:13'),
(9, 'paypal_payment', '1', '2018-10-28 07:45:16', '2020-09-12 14:30:59'),
(10, 'stripe_payment', '0', '2018-10-28 07:45:47', '2018-11-14 01:51:51'),
(11, 'cash_payment', '1', '2018-10-28 07:46:05', '2019-01-24 03:40:18'),
(12, 'payumoney_payment', '0', '2018-10-28 07:46:27', '2019-03-05 05:41:36'),
(13, 'best_selling', '1', '2018-12-24 08:13:44', '2019-02-14 05:29:13'),
(14, 'paypal_sandbox', '0', '2019-01-16 12:44:18', '2019-01-16 12:44:18'),
(15, 'sslcommerz_sandbox', '1', '2019-01-16 12:44:18', '2019-03-14 00:07:26'),
(16, 'sslcommerz_payment', '0', '2019-01-24 09:39:07', '2020-06-16 18:48:23'),
(17, 'vendor_commission', '20', '2019-01-31 06:18:04', '2019-04-13 06:49:26'),
(18, 'verification_form', '[{\"type\":\"text\",\"label\":\"Your name\"},{\"type\":\"text\",\"label\":\"integra technologies ltd\"},{\"type\":\"text\",\"label\":\"Email\"},{\"type\":\"text\",\"label\":\"License No\"},{\"type\":\"text\",\"label\":\"Full Address\"},{\"type\":\"text\",\"label\":\"01712946826\"}]', '2019-02-03 11:36:58', '2020-06-15 18:22:20'),
(19, 'google_analytics', '1', '2019-02-06 12:22:35', '2020-06-18 21:30:06'),
(20, 'facebook_login', '1', '2019-02-07 12:51:59', '2020-06-16 18:49:44'),
(21, 'google_login', '1', '2019-02-07 12:52:10', '2020-06-16 18:49:41'),
(22, 'twitter_login', '0', '2019-02-07 12:52:20', '2020-06-18 15:27:27'),
(23, 'payumoney_payment', '1', '2019-03-05 11:38:17', '2019-03-05 11:38:17'),
(24, 'payumoney_sandbox', '1', '2019-03-05 11:38:17', '2019-03-05 05:39:18'),
(36, 'facebook_chat', '1', '2019-04-15 11:45:04', '2020-06-17 18:19:32'),
(37, 'email_verification', '1', '2019-04-30 07:30:07', '2020-09-12 14:31:08'),
(38, 'wallet_system', '0', '2019-05-19 08:05:44', '2020-06-16 18:47:59'),
(39, 'coupon_system', '0', '2019-06-11 09:46:18', '2020-07-06 17:20:09'),
(40, 'current_version', '3.2', '2019-06-11 09:46:18', '2019-06-11 09:46:18'),
(41, 'instamojo_payment', '1', '2019-07-06 09:58:03', '2020-09-12 14:30:55'),
(42, 'instamojo_sandbox', '1', '2019-07-06 09:58:43', '2019-07-06 09:58:43'),
(43, 'razorpay', '1', '2019-07-06 09:58:43', '2020-09-12 14:30:53'),
(44, 'paystack', '1', '2019-07-21 13:00:38', '2020-09-12 14:30:51'),
(45, 'pickup_point', '1', '2019-10-17 11:50:39', '2020-06-18 21:34:06'),
(46, 'maintenance_mode', '0', '2019-10-17 11:51:04', '2020-09-12 14:30:13'),
(47, 'voguepay', '1', '2019-10-17 11:51:24', '2020-09-12 14:30:46'),
(48, 'voguepay_sandbox', '0', '2019-10-17 11:51:38', '2019-10-17 11:51:38'),
(50, 'category_wise_commission', '0', '2020-01-21 07:22:47', '2020-01-21 07:22:47'),
(51, 'conversation_system', '1', '2020-01-21 07:23:21', '2020-06-16 18:48:01'),
(52, 'guest_checkout_active', '1', '2020-01-22 07:36:38', '2020-01-22 07:36:38'),
(53, 'facebook_pixel', '0', '2020-01-22 11:43:58', '2020-01-22 11:43:58'),
(55, 'refund_request_time', '3', '2019-03-12 09:58:23', '2019-03-12 09:58:23'),
(56, 'club_point_convert_rate', '10', '2019-03-12 05:58:23', '2019-03-12 05:58:23'),
(57, 'classified_product', '1', '2020-08-25 20:23:12', '2020-08-25 20:23:12'),
(58, 'pos_activation_for_seller', '1', '2020-08-25 20:23:13', '2020-09-12 14:19:53'),
(59, 'shipping_type', 'product_wise_shipping', '2020-08-25 20:23:13', '2020-08-25 20:23:13'),
(60, 'flat_rate_shipping_cost', '0', '2020-08-25 20:23:13', '2020-08-25 20:23:13'),
(61, 'shipping_cost_admin', '0', '2020-08-25 20:23:13', '2020-08-25 20:23:13'),
(62, 'payhere_sandbox', '0', '2020-08-25 20:23:13', '2020-08-25 20:23:13'),
(63, 'payhere', '1', '2020-08-25 20:23:13', '2020-09-12 14:30:45'),
(64, 'google_recaptcha', '0', '2020-08-25 20:23:13', '2020-08-25 20:23:13');

-- --------------------------------------------------------

--
-- Table structure for table `carts`
--

DROP TABLE IF EXISTS `carts`;
CREATE TABLE IF NOT EXISTS `carts` (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `variation` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `price` double(8,2) DEFAULT NULL,
  `tax` double(8,2) DEFAULT NULL,
  `shipping_cost` double(8,2) DEFAULT NULL,
  `quantity` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
CREATE TABLE IF NOT EXISTS `categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `commision_rate` double(8,2) NOT NULL DEFAULT 0.00,
  `banner` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `icon` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `featured` int(1) NOT NULL DEFAULT 0,
  `top` int(1) NOT NULL DEFAULT 0,
  `digital` int(1) NOT NULL DEFAULT 0,
  `slug` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `meta_title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `category_mall` varchar(50) COLLATE utf8_unicode_ci DEFAULT '0',
  `meta_description` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `commision_rate`, `banner`, `icon`, `featured`, `top`, `digital`, `slug`, `meta_title`, `category_mall`, `meta_description`, `created_at`, `updated_at`) VALUES
(1, 'Women`s Fashion', 0.00, 'uploads/categories/banner/banner.jpg', 'uploads/categories/icon/N0jONHy8iXjtXmTmZ2K4XHCBNYuKzz27TSttwMOd.jpeg', 1, 1, 0, '5', 'women\'s fashion', '1', 'women\'s fashion', '2021-01-28 10:26:36', '2020-09-02 18:42:21'),
(2, 'Men`s Fashion', 0.00, 'uploads/categories/banner/oMW7BwuzD1Z4Riec07EpqUdDSNn21R3wknU086K3.png', 'uploads/categories/icon/ZuQYW7UwZFAE6rGLXACKhCazaFFEt6dslLVI24de.png', 1, 0, 0, 'Mens-Fashion', 't-shirt, shirt', '1', 'Men\'s Fashion', '2021-03-04 06:08:22', '2021-03-04 06:08:22'),
(4, 'Electronic Devices', 0.00, 'uploads/categories/banner/s0vR6shkpnxsu9Fd34PYYNG0vcNmxpJAGkLs7B7J.jpeg', 'uploads/categories/icon/DtIewRikd6TUmrke29jefD3GU6LUCU4gNwBz9nUv.jpeg', 1, 0, 0, '1', 'Electronic Devices', NULL, '1', '2020-10-27 10:32:57', '2020-10-27 10:32:57'),
(5, 'Electronic Accessories', 0.00, 'uploads/categories/banner/A8zAvK9l8BFwj7LtgWoHpfhUXLisvRnFrYkwIJr8.png', 'images/cat_1.webp', 1, 0, 0, 'Electronic-Accessories-3zqiB', 'Electronics', '1', 'Electronic Accessories', '2021-01-28 05:03:41', '2020-07-20 13:35:20'),
(6, 'TV & Home Appliances', 0.00, 'uploads/categories/banner/3ftuCVWjBLRKFMllzktpNPlrdT98Et1RCnl36wa3.png', 'images/cat_2.webp', 1, 0, 0, 'TV--Home-Appliances-WIpFi', 'tv', NULL, NULL, '2021-01-28 05:03:33', '2020-06-17 17:51:48'),
(7, 'Others Devises & access', 0.00, 'uploads/categories/banner/HaxjrjBDWsRrrFrgDaFH9HsvVN9D0rlwAca16SiR.jpeg', 'images/cat_3.webp', 1, 0, 0, 'ETCOTHERS-6ScSd', 'Other Devises', NULL, 'Other Devises', '2021-01-28 05:03:23', '2020-09-10 19:37:07');

-- --------------------------------------------------------

--
-- Table structure for table `club_points`
--

DROP TABLE IF EXISTS `club_points`;
CREATE TABLE IF NOT EXISTS `club_points` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `points` double(18,2) NOT NULL,
  `convert_status` int(1) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=60 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `club_points`
--

INSERT INTO `club_points` (`id`, `user_id`, `points`, `convert_status`, `created_at`, `updated_at`) VALUES
(1, 12, 0.00, 0, '2020-06-18 14:06:54', '2020-06-18 14:06:54'),
(2, 12, 0.00, 0, '2020-07-11 08:05:15', '2020-07-11 08:05:15'),
(3, 12, 0.00, 0, '2020-09-02 17:26:51', '2020-09-02 17:26:51'),
(4, 12, 0.00, 0, '2020-09-02 17:30:51', '2020-09-02 17:30:51'),
(5, 12, 0.00, 0, '2020-09-04 18:12:05', '2020-09-04 18:12:05'),
(6, 12, 0.00, 0, '2020-09-04 18:12:05', '2020-09-04 18:12:05'),
(7, 12, 0.00, 0, '2020-09-05 20:42:22', '2020-09-05 20:42:22'),
(8, 12, 0.00, 0, '2020-09-05 20:42:22', '2020-09-05 20:42:22'),
(9, 12, 0.00, 0, '2020-09-05 20:44:14', '2020-09-05 20:44:14'),
(10, 12, 0.00, 0, '2020-09-07 12:06:22', '2020-09-07 12:06:22'),
(11, 12, 0.00, 0, '2020-09-07 12:06:22', '2020-09-07 12:06:22'),
(12, 12, 0.00, 0, '2020-09-07 12:06:57', '2020-09-07 12:06:57'),
(13, 12, 0.00, 0, '2020-09-07 12:06:57', '2020-09-07 12:06:57'),
(14, 12, 0.00, 0, '2020-09-07 20:38:31', '2020-09-07 20:38:31'),
(15, 12, 0.00, 0, '2020-09-07 20:38:31', '2020-09-07 20:38:31'),
(16, 12, 0.00, 0, '2020-09-07 20:38:32', '2020-09-07 20:38:32'),
(17, 12, 0.00, 0, '2020-09-07 20:38:32', '2020-09-07 20:38:32'),
(18, 12, 0.00, 0, '2020-09-07 20:38:33', '2020-09-07 20:38:33'),
(19, 12, 0.00, 0, '2020-09-08 11:32:52', '2020-09-08 11:32:52'),
(20, 12, 0.00, 0, '2020-09-08 12:34:38', '2020-09-08 12:34:38'),
(21, 12, 0.00, 0, '2020-09-08 12:35:16', '2020-09-08 12:35:16'),
(22, 12, 0.00, 0, '2020-09-08 12:35:30', '2020-09-08 12:35:30'),
(23, 12, 0.00, 0, '2020-09-08 17:10:29', '2020-09-08 17:10:29'),
(24, 12, 0.00, 0, '2020-09-08 17:10:29', '2020-09-08 17:10:29'),
(25, 12, 0.00, 0, '2020-09-08 17:11:19', '2020-09-08 17:11:19'),
(26, 12, 0.00, 0, '2020-09-09 21:09:13', '2020-09-09 21:09:13'),
(27, 12, 0.00, 0, '2020-09-09 21:09:13', '2020-09-09 21:09:13'),
(28, 12, 0.00, 0, '2020-09-10 08:17:42', '2020-09-10 08:17:42'),
(29, 12, 0.00, 0, '2020-09-10 08:17:42', '2020-09-10 08:17:42'),
(30, 12, 0.00, 0, '2020-09-10 08:20:47', '2020-09-10 08:20:47'),
(31, 12, 0.00, 0, '2020-09-10 08:20:47', '2020-09-10 08:20:47'),
(32, 12, 0.00, 0, '2020-09-10 13:22:49', '2020-09-10 13:22:49'),
(33, 12, 0.00, 0, '2020-09-10 13:22:49', '2020-09-10 13:22:49'),
(34, 12, 0.00, 0, '2020-09-10 13:22:49', '2020-09-10 13:22:49'),
(35, 12, 0.00, 0, '2020-09-10 13:25:21', '2020-09-10 13:25:21'),
(36, 12, 0.00, 0, '2020-09-10 13:26:40', '2020-09-10 13:26:40'),
(37, 12, 0.00, 0, '2020-09-10 13:29:52', '2020-09-10 13:29:52'),
(38, 12, 0.00, 0, '2020-09-10 13:30:26', '2020-09-10 13:30:26'),
(39, 12, 0.00, 0, '2020-09-10 13:31:01', '2020-09-10 13:31:01'),
(40, 12, 0.00, 0, '2020-09-10 13:32:45', '2020-09-10 13:32:45'),
(41, 12, 0.00, 0, '2020-09-10 13:33:13', '2020-09-10 13:33:13'),
(42, 12, 0.00, 0, '2020-09-10 14:17:23', '2020-09-10 14:17:23'),
(43, 12, 0.00, 0, '2020-09-10 14:17:23', '2020-09-10 14:17:23'),
(44, 12, 0.00, 0, '2020-09-10 14:17:23', '2020-09-10 14:17:23'),
(45, 12, 0.00, 0, '2020-09-10 14:18:17', '2020-09-10 14:18:17'),
(46, 12, 0.00, 0, '2020-09-10 18:05:28', '2020-09-10 18:05:28'),
(47, 12, 0.00, 0, '2020-09-10 18:05:29', '2020-09-10 18:05:29'),
(48, 12, 0.00, 0, '2020-09-10 19:35:35', '2020-09-10 19:35:35'),
(49, 12, 0.00, 0, '2020-09-10 19:35:35', '2020-09-10 19:35:35'),
(50, 12, 0.00, 0, '2020-09-10 19:35:35', '2020-09-10 19:35:35'),
(51, 12, 0.00, 0, '2020-09-12 14:07:05', '2020-09-12 14:07:05'),
(52, 12, 0.00, 0, '2020-09-12 14:22:44', '2020-09-12 14:22:44'),
(53, 12, 0.00, 0, '2020-09-12 14:23:16', '2020-09-12 14:23:16'),
(54, 12, 0.00, 0, '2020-09-12 14:23:16', '2020-09-12 14:23:16'),
(55, 12, 0.00, 0, '2020-09-12 14:50:55', '2020-09-12 14:50:55'),
(56, 12, 0.00, 0, '2020-09-12 14:51:41', '2020-09-12 14:51:41'),
(57, 12, 0.00, 0, '2020-09-13 23:08:58', '2020-09-13 23:08:58'),
(58, 12, 0.00, 0, '2020-09-18 13:26:11', '2020-09-18 13:26:11'),
(59, 12, 0.00, 0, '2020-09-27 20:08:21', '2020-09-27 20:08:21');

-- --------------------------------------------------------

--
-- Table structure for table `club_point_details`
--

DROP TABLE IF EXISTS `club_point_details`;
CREATE TABLE IF NOT EXISTS `club_point_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `club_point_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `product_qty` int(11) NOT NULL,
  `point` double(8,2) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=91 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `club_point_details`
--

INSERT INTO `club_point_details` (`id`, `club_point_id`, `product_id`, `product_qty`, `point`, `created_at`, `updated_at`) VALUES
(1, 1, 17, 0, 0.00, '2020-06-18 14:06:54', '2020-06-18 14:06:54'),
(2, 2, 20, 0, 0.00, '2020-07-11 08:05:15', '2020-07-11 08:05:15'),
(3, 3, 26, 0, 0.00, '2020-09-02 17:26:51', '2020-09-02 17:26:51'),
(4, 3, 21, 0, 0.00, '2020-09-02 17:26:51', '2020-09-02 17:26:51'),
(5, 3, 20, 0, 0.00, '2020-09-02 17:26:51', '2020-09-02 17:26:51'),
(6, 4, 21, 0, 0.00, '2020-09-02 17:30:51', '2020-09-02 17:30:51'),
(7, 4, 17, 0, 0.00, '2020-09-02 17:30:51', '2020-09-02 17:30:51'),
(8, 4, 25, 0, 0.00, '2020-09-02 17:30:51', '2020-09-02 17:30:51'),
(9, 5, 19, 0, 0.00, '2020-09-04 18:12:05', '2020-09-04 18:12:05'),
(10, 6, 19, 0, 0.00, '2020-09-04 18:12:05', '2020-09-04 18:12:05'),
(11, 5, 21, 0, 0.00, '2020-09-04 18:12:05', '2020-09-04 18:12:05'),
(12, 6, 21, 0, 0.00, '2020-09-04 18:12:05', '2020-09-04 18:12:05'),
(13, 7, 15, 0, 0.00, '2020-09-05 20:42:22', '2020-09-05 20:42:22'),
(14, 7, 17, 0, 0.00, '2020-09-05 20:42:22', '2020-09-05 20:42:22'),
(15, 8, 15, 0, 0.00, '2020-09-05 20:42:22', '2020-09-05 20:42:22'),
(16, 8, 17, 0, 0.00, '2020-09-05 20:42:22', '2020-09-05 20:42:22'),
(17, 9, 15, 0, 0.00, '2020-09-05 20:44:14', '2020-09-05 20:44:14'),
(18, 9, 20, 0, 0.00, '2020-09-05 20:44:14', '2020-09-05 20:44:14'),
(19, 10, 20, 0, 0.00, '2020-09-07 12:06:22', '2020-09-07 12:06:22'),
(20, 11, 20, 0, 0.00, '2020-09-07 12:06:22', '2020-09-07 12:06:22'),
(21, 10, 21, 0, 0.00, '2020-09-07 12:06:22', '2020-09-07 12:06:22'),
(22, 11, 21, 0, 0.00, '2020-09-07 12:06:22', '2020-09-07 12:06:22'),
(23, 12, 20, 0, 0.00, '2020-09-07 12:06:57', '2020-09-07 12:06:57'),
(24, 12, 21, 0, 0.00, '2020-09-07 12:06:57', '2020-09-07 12:06:57'),
(25, 13, 20, 0, 0.00, '2020-09-07 12:06:57', '2020-09-07 12:06:57'),
(26, 13, 21, 0, 0.00, '2020-09-07 12:06:57', '2020-09-07 12:06:57'),
(27, 14, 20, 0, 0.00, '2020-09-07 20:38:31', '2020-09-07 20:38:31'),
(28, 14, 18, 0, 0.00, '2020-09-07 20:38:31', '2020-09-07 20:38:31'),
(29, 15, 20, 0, 0.00, '2020-09-07 20:38:31', '2020-09-07 20:38:31'),
(30, 15, 18, 0, 0.00, '2020-09-07 20:38:31', '2020-09-07 20:38:31'),
(31, 16, 20, 0, 0.00, '2020-09-07 20:38:32', '2020-09-07 20:38:32'),
(32, 16, 18, 0, 0.00, '2020-09-07 20:38:32', '2020-09-07 20:38:32'),
(33, 17, 20, 0, 0.00, '2020-09-07 20:38:32', '2020-09-07 20:38:32'),
(34, 17, 18, 0, 0.00, '2020-09-07 20:38:32', '2020-09-07 20:38:32'),
(35, 18, 20, 0, 0.00, '2020-09-07 20:38:33', '2020-09-07 20:38:33'),
(36, 18, 18, 0, 0.00, '2020-09-07 20:38:33', '2020-09-07 20:38:33'),
(37, 19, 20, 0, 0.00, '2020-09-08 11:32:52', '2020-09-08 11:32:52'),
(38, 19, 21, 0, 0.00, '2020-09-08 11:32:52', '2020-09-08 11:32:52'),
(39, 20, 17, 0, 0.00, '2020-09-08 12:34:38', '2020-09-08 12:34:38'),
(40, 21, 25, 0, 0.00, '2020-09-08 12:35:16', '2020-09-08 12:35:16'),
(41, 22, 17, 0, 0.00, '2020-09-08 12:35:30', '2020-09-08 12:35:30'),
(42, 23, 17, 0, 0.00, '2020-09-08 17:10:29', '2020-09-08 17:10:29'),
(43, 24, 17, 0, 0.00, '2020-09-08 17:10:29', '2020-09-08 17:10:29'),
(44, 23, 20, 0, 0.00, '2020-09-08 17:10:29', '2020-09-08 17:10:29'),
(45, 24, 20, 0, 0.00, '2020-09-08 17:10:29', '2020-09-08 17:10:29'),
(46, 25, 29, 0, 0.00, '2020-09-08 17:11:19', '2020-09-08 17:11:19'),
(47, 25, 27, 0, 0.00, '2020-09-08 17:11:19', '2020-09-08 17:11:19'),
(48, 26, 19, 0, 0.00, '2020-09-09 21:09:13', '2020-09-09 21:09:13'),
(49, 26, 21, 0, 0.00, '2020-09-09 21:09:13', '2020-09-09 21:09:13'),
(50, 26, 27, 0, 0.00, '2020-09-09 21:09:13', '2020-09-09 21:09:13'),
(51, 27, 19, 0, 0.00, '2020-09-09 21:09:13', '2020-09-09 21:09:13'),
(52, 27, 21, 0, 0.00, '2020-09-09 21:09:13', '2020-09-09 21:09:13'),
(53, 27, 27, 0, 0.00, '2020-09-09 21:09:13', '2020-09-09 21:09:13'),
(54, 28, 21, 0, 0.00, '2020-09-10 08:17:42', '2020-09-10 08:17:42'),
(55, 29, 21, 0, 0.00, '2020-09-10 08:17:42', '2020-09-10 08:17:42'),
(56, 30, 17, 0, 0.00, '2020-09-10 08:20:47', '2020-09-10 08:20:47'),
(57, 31, 17, 0, 0.00, '2020-09-10 08:20:47', '2020-09-10 08:20:47'),
(58, 32, 15, 0, 0.00, '2020-09-10 13:22:49', '2020-09-10 13:22:49'),
(59, 33, 15, 0, 0.00, '2020-09-10 13:22:49', '2020-09-10 13:22:49'),
(60, 34, 15, 0, 0.00, '2020-09-10 13:22:49', '2020-09-10 13:22:49'),
(61, 35, 18, 0, 0.00, '2020-09-10 13:25:21', '2020-09-10 13:25:21'),
(62, 36, 17, 0, 0.00, '2020-09-10 13:26:40', '2020-09-10 13:26:40'),
(63, 37, 17, 0, 0.00, '2020-09-10 13:29:52', '2020-09-10 13:29:52'),
(64, 38, 17, 0, 0.00, '2020-09-10 13:30:26', '2020-09-10 13:30:26'),
(65, 39, 17, 0, 0.00, '2020-09-10 13:31:01', '2020-09-10 13:31:01'),
(66, 40, 16, 0, 0.00, '2020-09-10 13:32:45', '2020-09-10 13:32:45'),
(67, 41, 17, 0, 0.00, '2020-09-10 13:33:13', '2020-09-10 13:33:13'),
(68, 42, 21, 0, 0.00, '2020-09-10 14:17:23', '2020-09-10 14:17:23'),
(69, 43, 21, 0, 0.00, '2020-09-10 14:17:23', '2020-09-10 14:17:23'),
(70, 44, 21, 0, 0.00, '2020-09-10 14:17:23', '2020-09-10 14:17:23'),
(71, 45, 21, 0, 0.00, '2020-09-10 14:18:17', '2020-09-10 14:18:17'),
(72, 46, 27, 0, 0.00, '2020-09-10 18:05:28', '2020-09-10 18:05:28'),
(73, 47, 27, 0, 0.00, '2020-09-10 18:05:29', '2020-09-10 18:05:29'),
(74, 48, 28, 0, 0.00, '2020-09-10 19:35:35', '2020-09-10 19:35:35'),
(75, 49, 28, 0, 0.00, '2020-09-10 19:35:35', '2020-09-10 19:35:35'),
(76, 50, 28, 0, 0.00, '2020-09-10 19:35:35', '2020-09-10 19:35:35'),
(77, 51, 19, 0, 0.00, '2020-09-12 14:07:05', '2020-09-12 14:07:05'),
(78, 51, 20, 0, 0.00, '2020-09-12 14:07:05', '2020-09-12 14:07:05'),
(79, 51, 28, 0, 0.00, '2020-09-12 14:07:05', '2020-09-12 14:07:05'),
(80, 51, 31, 0, 0.00, '2020-09-12 14:07:05', '2020-09-12 14:07:05'),
(81, 51, 40, 0, 0.00, '2020-09-12 14:07:05', '2020-09-12 14:07:05'),
(82, 52, 21, 0, 0.00, '2020-09-12 14:22:44', '2020-09-12 14:22:44'),
(83, 53, 25, 0, 0.00, '2020-09-12 14:23:16', '2020-09-12 14:23:16'),
(84, 54, 25, 0, 0.00, '2020-09-12 14:23:16', '2020-09-12 14:23:16'),
(85, 55, 17, 0, 0.00, '2020-09-12 14:50:55', '2020-09-12 14:50:55'),
(86, 56, 15, 0, 0.00, '2020-09-12 14:51:41', '2020-09-12 14:51:41'),
(87, 57, 44, 0, 0.00, '2020-09-13 23:08:58', '2020-09-13 23:08:58'),
(88, 58, 41, 0, 0.00, '2020-09-18 13:26:11', '2020-09-18 13:26:11'),
(89, 58, 40, 0, 0.00, '2020-09-18 13:26:11', '2020-09-18 13:26:11'),
(90, 59, 20, 0, 0.00, '2020-09-27 20:08:21', '2020-09-27 20:08:21');

-- --------------------------------------------------------

--
-- Table structure for table `colors`
--

DROP TABLE IF EXISTS `colors`;
CREATE TABLE IF NOT EXISTS `colors` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `code` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=144 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `colors`
--

INSERT INTO `colors` (`id`, `name`, `code`, `created_at`, `updated_at`) VALUES
(1, 'IndianRed', '#CD5C5C', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(2, 'LightCoral', '#F08080', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(3, 'Salmon', '#FA8072', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(4, 'DarkSalmon', '#E9967A', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(5, 'LightSalmon', '#FFA07A', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(6, 'Crimson', '#DC143C', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(7, 'Red', '#FF0000', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(8, 'FireBrick', '#B22222', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(9, 'DarkRed', '#8B0000', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(10, 'Pink', '#FFC0CB', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(11, 'LightPink', '#FFB6C1', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(12, 'HotPink', '#FF69B4', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(13, 'DeepPink', '#FF1493', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(14, 'MediumVioletRed', '#C71585', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(15, 'PaleVioletRed', '#DB7093', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(16, 'LightSalmon', '#FFA07A', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(17, 'Coral', '#FF7F50', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(18, 'Tomato', '#FF6347', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(19, 'OrangeRed', '#FF4500', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(20, 'DarkOrange', '#FF8C00', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(21, 'Orange', '#FFA500', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(22, 'Gold', '#FFD700', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(23, 'Yellow', '#FFFF00', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(24, 'LightYellow', '#FFFFE0', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(25, 'LemonChiffon', '#FFFACD', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(26, 'LightGoldenrodYellow', '#FAFAD2', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(27, 'PapayaWhip', '#FFEFD5', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(28, 'Moccasin', '#FFE4B5', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(29, 'PeachPuff', '#FFDAB9', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(30, 'PaleGoldenrod', '#EEE8AA', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(31, 'Khaki', '#F0E68C', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(32, 'DarkKhaki', '#BDB76B', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(33, 'Lavender', '#E6E6FA', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(34, 'Thistle', '#D8BFD8', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(35, 'Plum', '#DDA0DD', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(36, 'Violet', '#EE82EE', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(37, 'Orchid', '#DA70D6', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(38, 'Fuchsia', '#FF00FF', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(39, 'Magenta', '#FF00FF', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(40, 'MediumOrchid', '#BA55D3', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(41, 'MediumPurple', '#9370DB', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(42, 'Amethyst', '#9966CC', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(43, 'BlueViolet', '#8A2BE2', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(44, 'DarkViolet', '#9400D3', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(45, 'DarkOrchid', '#9932CC', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(46, 'DarkMagenta', '#8B008B', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(47, 'Purple', '#800080', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(48, 'Indigo', '#4B0082', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(49, 'SlateBlue', '#6A5ACD', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(50, 'DarkSlateBlue', '#483D8B', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(51, 'MediumSlateBlue', '#7B68EE', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(52, 'GreenYellow', '#ADFF2F', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(53, 'Chartreuse', '#7FFF00', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(54, 'LawnGreen', '#7CFC00', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(55, 'Lime', '#00FF00', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(56, 'LimeGreen', '#32CD32', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(57, 'PaleGreen', '#98FB98', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(58, 'LightGreen', '#90EE90', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(59, 'MediumSpringGreen', '#00FA9A', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(60, 'SpringGreen', '#00FF7F', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(61, 'MediumSeaGreen', '#3CB371', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(62, 'SeaGreen', '#2E8B57', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(63, 'ForestGreen', '#228B22', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(64, 'Green', '#008000', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(65, 'DarkGreen', '#006400', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(66, 'YellowGreen', '#9ACD32', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(67, 'OliveDrab', '#6B8E23', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(68, 'Olive', '#808000', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(69, 'DarkOliveGreen', '#556B2F', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(70, 'MediumAquamarine', '#66CDAA', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(71, 'DarkSeaGreen', '#8FBC8F', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(72, 'LightSeaGreen', '#20B2AA', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(73, 'DarkCyan', '#008B8B', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(74, 'Teal', '#008080', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(75, 'Aqua', '#00FFFF', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(76, 'Cyan', '#00FFFF', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(77, 'LightCyan', '#E0FFFF', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(78, 'PaleTurquoise', '#AFEEEE', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(79, 'Aquamarine', '#7FFFD4', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(80, 'Turquoise', '#40E0D0', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(81, 'MediumTurquoise', '#48D1CC', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(82, 'DarkTurquoise', '#00CED1', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(83, 'CadetBlue', '#5F9EA0', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(84, 'SteelBlue', '#4682B4', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(85, 'LightSteelBlue', '#B0C4DE', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(86, 'PowderBlue', '#B0E0E6', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(87, 'LightBlue', '#ADD8E6', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(88, 'SkyBlue', '#87CEEB', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(89, 'LightSkyBlue', '#87CEFA', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(90, 'DeepSkyBlue', '#00BFFF', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(91, 'DodgerBlue', '#1E90FF', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(92, 'CornflowerBlue', '#6495ED', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(93, 'MediumSlateBlue', '#7B68EE', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(94, 'RoyalBlue', '#4169E1', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(95, 'Blue', '#0000FF', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(96, 'MediumBlue', '#0000CD', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(97, 'DarkBlue', '#00008B', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(98, 'Navy', '#000080', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(99, 'MidnightBlue', '#191970', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(100, 'Cornsilk', '#FFF8DC', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(101, 'BlanchedAlmond', '#FFEBCD', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(102, 'Bisque', '#FFE4C4', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(103, 'NavajoWhite', '#FFDEAD', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(104, 'Wheat', '#F5DEB3', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(105, 'BurlyWood', '#DEB887', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(106, 'Tan', '#D2B48C', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(107, 'RosyBrown', '#BC8F8F', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(108, 'SandyBrown', '#F4A460', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(109, 'Goldenrod', '#DAA520', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(110, 'DarkGoldenrod', '#B8860B', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(111, 'Peru', '#CD853F', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(112, 'Chocolate', '#D2691E', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(113, 'SaddleBrown', '#8B4513', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(114, 'Sienna', '#A0522D', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(115, 'Brown', '#A52A2A', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(116, 'Maroon', '#800000', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(117, 'White', '#FFFFFF', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(118, 'Snow', '#FFFAFA', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(119, 'Honeydew', '#F0FFF0', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(120, 'MintCream', '#F5FFFA', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(121, 'Azure', '#F0FFFF', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(122, 'AliceBlue', '#F0F8FF', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(123, 'GhostWhite', '#F8F8FF', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(124, 'WhiteSmoke', '#F5F5F5', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(125, 'Seashell', '#FFF5EE', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(126, 'Beige', '#F5F5DC', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(127, 'OldLace', '#FDF5E6', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(128, 'FloralWhite', '#FFFAF0', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(129, 'Ivory', '#FFFFF0', '2018-11-05 02:12:30', '2018-11-05 02:12:30'),
(130, 'AntiqueWhite', '#FAEBD7', '2018-11-05 02:12:30', '2018-11-05 02:12:30'),
(131, 'Linen', '#FAF0E6', '2018-11-05 02:12:30', '2018-11-05 02:12:30'),
(132, 'LavenderBlush', '#FFF0F5', '2018-11-05 02:12:30', '2018-11-05 02:12:30'),
(133, 'MistyRose', '#FFE4E1', '2018-11-05 02:12:30', '2018-11-05 02:12:30'),
(134, 'Gainsboro', '#DCDCDC', '2018-11-05 02:12:30', '2018-11-05 02:12:30'),
(135, 'LightGrey', '#D3D3D3', '2018-11-05 02:12:30', '2018-11-05 02:12:30'),
(136, 'Silver', '#C0C0C0', '2018-11-05 02:12:30', '2018-11-05 02:12:30'),
(137, 'DarkGray', '#A9A9A9', '2018-11-05 02:12:30', '2018-11-05 02:12:30'),
(138, 'Gray', '#808080', '2018-11-05 02:12:30', '2018-11-05 02:12:30'),
(139, 'DimGray', '#696969', '2018-11-05 02:12:30', '2018-11-05 02:12:30'),
(140, 'LightSlateGray', '#778899', '2018-11-05 02:12:30', '2018-11-05 02:12:30'),
(141, 'SlateGray', '#708090', '2018-11-05 02:12:30', '2018-11-05 02:12:30'),
(142, 'DarkSlateGray', '#2F4F4F', '2018-11-05 02:12:30', '2018-11-05 02:12:30'),
(143, 'Black', '#000000', '2018-11-05 02:12:30', '2018-11-05 02:12:30');

-- --------------------------------------------------------

--
-- Table structure for table `conversations`
--

DROP TABLE IF EXISTS `conversations`;
CREATE TABLE IF NOT EXISTS `conversations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sender_id` int(11) NOT NULL,
  `receiver_id` int(11) NOT NULL,
  `title` varchar(1000) COLLATE utf32_unicode_ci DEFAULT NULL,
  `sender_viewed` int(1) NOT NULL DEFAULT 1,
  `receiver_viewed` int(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf32 COLLATE=utf32_unicode_ci;

--
-- Dumping data for table `conversations`
--

INSERT INTO `conversations` (`id`, `sender_id`, `receiver_id`, `title`, `sender_viewed`, `receiver_viewed`, `created_at`, `updated_at`) VALUES
(2, 12, 36, 'dsjfbjkds', 1, 0, '2021-01-26 09:48:55', '2021-01-26 09:48:55');

-- --------------------------------------------------------

--
-- Table structure for table `countries`
--

DROP TABLE IF EXISTS `countries`;
CREATE TABLE IF NOT EXISTS `countries` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(2) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `status` int(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=297 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `countries`
--

INSERT INTO `countries` (`id`, `code`, `name`, `status`, `created_at`, `updated_at`) VALUES
(1, 'AF', 'Afganistan', 0, NULL, '2020-09-10 19:26:49'),
(2, 'AL', 'Albania', 0, NULL, '2020-09-10 19:26:50'),
(3, 'DZ', 'Algeria', 0, NULL, '2020-09-10 19:26:51'),
(4, 'DS', 'American Samoa', 0, NULL, '2020-09-10 19:26:52'),
(5, 'AD', 'Andorra', 0, NULL, '2020-09-10 19:26:53'),
(6, 'AO', 'Angola', 0, NULL, '2020-09-10 19:26:54'),
(7, 'AI', 'Anguilla', 0, NULL, '2020-09-10 19:26:55'),
(8, 'AQ', 'Antarctica', 0, NULL, '2020-09-10 19:26:56'),
(9, 'AG', 'Antigua and Barbuda', 0, NULL, '2020-09-10 19:26:57'),
(10, 'AR', 'Argentina', 0, NULL, '2020-09-10 19:26:58'),
(11, 'AM', 'Armenia', 0, NULL, '2020-09-10 19:27:00'),
(12, 'AW', 'Aruba', 0, NULL, '2020-09-10 19:27:02'),
(13, 'AU', 'Australia', 1, NULL, NULL),
(14, 'AT', 'Austria', 0, NULL, '2020-09-10 19:26:41'),
(15, 'AZ', 'Azerbaijan', 0, NULL, '2020-09-10 19:26:41'),
(16, 'BS', 'Bahamas', 1, NULL, NULL),
(17, 'BH', 'Bahrain', 1, NULL, NULL),
(18, 'BD', 'Bangladesh', 1, NULL, NULL),
(19, 'BB', 'Barbados', 1, NULL, NULL),
(20, 'BY', 'Belarus', 1, NULL, NULL),
(21, 'BE', 'Belgium', 1, NULL, NULL),
(22, 'BZ', 'Belize', 1, NULL, NULL),
(23, 'BJ', 'Benin', 1, NULL, NULL),
(24, 'BM', 'Bermuda', 1, NULL, NULL),
(25, 'BT', 'Bhutan', 1, NULL, NULL),
(26, 'BO', 'Bolivia', 1, NULL, NULL),
(27, 'BA', 'Bosnia and Herzegovina', 1, NULL, NULL),
(28, 'BW', 'Botswana', 1, NULL, NULL),
(29, 'BV', 'Bouvet Island', 1, NULL, NULL),
(30, 'BR', 'Brazil', 1, NULL, NULL),
(31, 'IO', 'British Indian Ocean Territory', 1, NULL, NULL),
(32, 'BN', 'Brunei Darussalam', 1, NULL, NULL),
(33, 'BG', 'Bulgaria', 1, NULL, NULL),
(34, 'BF', 'Burkina Faso', 1, NULL, NULL),
(35, 'BI', 'Burundi', 1, NULL, NULL),
(36, 'KH', 'Cambodia', 1, NULL, NULL),
(37, 'CM', 'Cameroon', 1, NULL, NULL),
(38, 'CA', 'Canada', 1, NULL, NULL),
(39, 'CV', 'Cape Verde', 1, NULL, NULL),
(40, 'KY', 'Cayman Islands', 1, NULL, NULL),
(41, 'CF', 'Central African Republic', 1, NULL, NULL),
(42, 'TD', 'Chad', 1, NULL, NULL),
(43, 'CL', 'Chile', 1, NULL, NULL),
(44, 'CN', 'China', 1, NULL, NULL),
(45, 'CX', 'Christmas Island', 1, NULL, NULL),
(46, 'CC', 'Cocos (Keeling) Islands', 1, NULL, NULL),
(47, 'CO', 'Colombia', 1, NULL, NULL),
(48, 'KM', 'Comoros', 1, NULL, NULL),
(49, 'CG', 'Congo', 1, NULL, NULL),
(50, 'CK', 'Cook Islands', 1, NULL, NULL),
(51, 'CR', 'Costa Rica', 1, NULL, NULL),
(52, 'HR', 'Croatia (Hrvatska)', 1, NULL, NULL),
(53, 'CU', 'Cuba', 1, NULL, NULL),
(54, 'CY', 'Cyprus', 1, NULL, NULL),
(55, 'CZ', 'Czech Republic', 1, NULL, NULL),
(56, 'DK', 'Denmark', 1, NULL, NULL),
(57, 'DJ', 'Djibouti', 1, NULL, NULL),
(58, 'DM', 'Dominica', 1, NULL, NULL),
(59, 'DO', 'Dominican Republic', 1, NULL, NULL),
(60, 'TP', 'East Timor', 1, NULL, NULL),
(61, 'EC', 'Ecuador', 1, NULL, NULL),
(62, 'EG', 'Egypt', 1, NULL, NULL),
(63, 'SV', 'El Salvador', 1, NULL, NULL),
(64, 'GQ', 'Equatorial Guinea', 1, NULL, NULL),
(65, 'ER', 'Eritrea', 1, NULL, NULL),
(66, 'EE', 'Estonia', 1, NULL, NULL),
(67, 'ET', 'Ethiopia', 1, NULL, NULL),
(68, 'FK', 'Falkland Islands (Malvinas)', 1, NULL, NULL),
(69, 'FO', 'Faroe Islands', 1, NULL, NULL),
(70, 'FJ', 'Fiji', 1, NULL, NULL),
(71, 'FI', 'Finland', 1, NULL, NULL),
(72, 'FR', 'France', 1, NULL, NULL),
(73, 'FX', 'France, Metropolitan', 1, NULL, NULL),
(74, 'GF', 'French Guiana', 1, NULL, NULL),
(75, 'PF', 'French Polynesia', 1, NULL, NULL),
(76, 'TF', 'French Southern Territories', 1, NULL, NULL),
(77, 'GA', 'Gabon', 1, NULL, NULL),
(78, 'GM', 'Gambia', 1, NULL, NULL),
(79, 'GE', 'Georgia', 1, NULL, NULL),
(80, 'DE', 'Germany', 1, NULL, NULL),
(81, 'GH', 'Ghana', 1, NULL, NULL),
(82, 'GI', 'Gibraltar', 1, NULL, NULL),
(83, 'GK', 'Guernsey', 1, NULL, NULL),
(84, 'GR', 'Greece', 1, NULL, NULL),
(85, 'GL', 'Greenland', 1, NULL, NULL),
(86, 'GD', 'Grenada', 1, NULL, NULL),
(87, 'GP', 'Guadeloupe', 1, NULL, NULL),
(88, 'GU', 'Guam', 1, NULL, NULL),
(89, 'GT', 'Guatemala', 1, NULL, NULL),
(90, 'GN', 'Guinea', 1, NULL, NULL),
(91, 'GW', 'Guinea-Bissau', 1, NULL, NULL),
(92, 'GY', 'Guyana', 1, NULL, NULL),
(93, 'HT', 'Haiti', 1, NULL, NULL),
(94, 'HM', 'Heard and Mc Donald Islands', 1, NULL, NULL),
(95, 'HN', 'Honduras', 1, NULL, NULL),
(96, 'HK', 'Hong Kong', 1, NULL, NULL),
(97, 'HU', 'Hungary', 1, NULL, NULL),
(98, 'IS', 'Iceland', 1, NULL, NULL),
(99, 'IN', 'India', 1, NULL, NULL),
(100, 'IM', 'Isle of Man', 1, NULL, NULL),
(101, 'ID', 'Indonesia', 1, NULL, NULL),
(102, 'IR', 'Iran (Islamic Republic of)', 1, NULL, NULL),
(103, 'IQ', 'Iraq', 1, NULL, NULL),
(104, 'IE', 'Ireland', 1, NULL, NULL),
(105, 'IL', 'Israel', 1, NULL, NULL),
(106, 'IT', 'Italy', 1, NULL, NULL),
(107, 'CI', 'Ivory Coast', 1, NULL, NULL),
(108, 'JE', 'Jersey', 1, NULL, NULL),
(109, 'JM', 'Jamaica', 1, NULL, NULL),
(110, 'JP', 'Japan', 1, NULL, NULL),
(111, 'JO', 'Jordan', 1, NULL, NULL),
(112, 'KZ', 'Kazakhstan', 1, NULL, NULL),
(113, 'KE', 'Kenya', 1, NULL, NULL),
(114, 'KI', 'Kiribati', 1, NULL, NULL),
(115, 'KP', 'Korea, Democratic People\'s Republic of', 1, NULL, NULL),
(116, 'KR', 'Korea, Republic of', 1, NULL, NULL),
(117, 'XK', 'Kosovo', 1, NULL, NULL),
(118, 'KW', 'Kuwait', 1, NULL, NULL),
(119, 'KG', 'Kyrgyzstan', 1, NULL, NULL),
(120, 'LA', 'Lao People\'s Democratic Republic', 1, NULL, NULL),
(121, 'LV', 'Latvia', 1, NULL, NULL),
(122, 'LB', 'Lebanon', 1, NULL, NULL),
(123, 'LS', 'Lesotho', 1, NULL, NULL),
(124, 'LR', 'Liberia', 1, NULL, NULL),
(125, 'LY', 'Libyan Arab Jamahiriya', 1, NULL, NULL),
(126, 'LI', 'Liechtenstein', 1, NULL, NULL),
(127, 'LT', 'Lithuania', 1, NULL, NULL),
(128, 'LU', 'Luxembourg', 1, NULL, NULL),
(129, 'MO', 'Macau', 1, NULL, NULL),
(130, 'MK', 'Macedonia', 1, NULL, NULL),
(131, 'MG', 'Madagascar', 1, NULL, NULL),
(132, 'MW', 'Malawi', 1, NULL, NULL),
(133, 'MY', 'Malaysia', 1, NULL, NULL),
(134, 'MV', 'Maldives', 1, NULL, NULL),
(135, 'ML', 'Mali', 1, NULL, NULL),
(136, 'MT', 'Malta', 1, NULL, NULL),
(137, 'MH', 'Marshall Islands', 1, NULL, NULL),
(138, 'MQ', 'Martinique', 1, NULL, NULL),
(139, 'MR', 'Mauritania', 1, NULL, NULL),
(140, 'MU', 'Mauritius', 1, NULL, NULL),
(141, 'TY', 'Mayotte', 1, NULL, NULL),
(142, 'MX', 'Mexico', 1, NULL, NULL),
(143, 'FM', 'Micronesia, Federated States of', 1, NULL, NULL),
(144, 'MD', 'Moldova, Republic of', 1, NULL, NULL),
(145, 'MC', 'Monaco', 1, NULL, NULL),
(146, 'MN', 'Mongolia', 1, NULL, NULL),
(147, 'ME', 'Montenegro', 1, NULL, NULL),
(148, 'MS', 'Montserrat', 1, NULL, NULL),
(149, 'MA', 'Morocco', 1, NULL, NULL),
(150, 'MZ', 'Mozambique', 1, NULL, NULL),
(151, 'MM', 'Myanmar', 1, NULL, NULL),
(152, 'NA', 'Namibia', 1, NULL, NULL),
(153, 'NR', 'Nauru', 1, NULL, NULL),
(154, 'NP', 'Nepal', 1, NULL, NULL),
(155, 'NL', 'Netherlands', 1, NULL, NULL),
(156, 'AN', 'Netherlands Antilles', 1, NULL, NULL),
(157, 'NC', 'New Caledonia', 1, NULL, NULL),
(158, 'NZ', 'New Zealand', 1, NULL, NULL),
(159, 'NI', 'Nicaragua', 1, NULL, NULL),
(160, 'NE', 'Niger', 1, NULL, NULL),
(161, 'NG', 'Nigeria', 1, NULL, NULL),
(162, 'NU', 'Niue', 1, NULL, NULL),
(163, 'NF', 'Norfolk Island', 1, NULL, NULL),
(164, 'MP', 'Northern Mariana Islands', 1, NULL, NULL),
(165, 'NO', 'Norway', 1, NULL, NULL),
(166, 'OM', 'Oman', 1, NULL, NULL),
(167, 'PK', 'Pakistan', 1, NULL, NULL),
(168, 'PW', 'Palau', 1, NULL, NULL),
(169, 'PS', 'Palestine', 1, NULL, NULL),
(170, 'PA', 'Panama', 1, NULL, NULL),
(171, 'PG', 'Papua New Guinea', 1, NULL, NULL),
(172, 'PY', 'Paraguay', 1, NULL, NULL),
(173, 'PE', 'Peru', 1, NULL, NULL),
(174, 'PH', 'Philippines', 1, NULL, NULL),
(175, 'PN', 'Pitcairn', 1, NULL, NULL),
(176, 'PL', 'Poland', 1, NULL, NULL),
(177, 'PT', 'Portugal', 1, NULL, NULL),
(178, 'PR', 'Puerto Rico', 1, NULL, NULL),
(179, 'QA', 'Qatar', 1, NULL, NULL),
(180, 'RE', 'Reunion', 1, NULL, NULL),
(181, 'RO', 'Romania', 1, NULL, NULL),
(182, 'RU', 'Russian Federation', 1, NULL, NULL),
(183, 'RW', 'Rwanda', 1, NULL, NULL),
(184, 'KN', 'Saint Kitts and Nevis', 1, NULL, NULL),
(185, 'LC', 'Saint Lucia', 1, NULL, NULL),
(186, 'VC', 'Saint Vincent and the Grenadines', 1, NULL, NULL),
(187, 'WS', 'Samoa', 1, NULL, NULL),
(188, 'SM', 'San Marino', 1, NULL, NULL),
(189, 'ST', 'Sao Tome and Principe', 1, NULL, NULL),
(190, 'SA', 'Saudi Arabia', 1, NULL, NULL),
(191, 'SN', 'Senegal', 1, NULL, NULL),
(192, 'RS', 'Serbia', 1, NULL, NULL),
(193, 'SC', 'Seychelles', 1, NULL, NULL),
(194, 'SL', 'Sierra Leone', 1, NULL, NULL),
(195, 'SG', 'Singapore', 1, NULL, NULL),
(196, 'SK', 'Slovakia', 1, NULL, NULL),
(197, 'SI', 'Slovenia', 1, NULL, NULL),
(198, 'SB', 'Solomon Islands', 1, NULL, NULL),
(199, 'SO', 'Somalia', 1, NULL, NULL),
(200, 'ZA', 'South Africa', 1, NULL, NULL),
(201, 'GS', 'South Georgia South Sandwich Islands', 1, NULL, NULL),
(202, 'SS', 'South Sudan', 1, NULL, NULL),
(203, 'ES', 'Spain', 1, NULL, NULL),
(204, 'LK', 'Sri Lanka', 1, NULL, NULL),
(205, 'SH', 'St. Helena', 1, NULL, NULL),
(206, 'PM', 'St. Pierre and Miquelon', 1, NULL, NULL),
(207, 'SD', 'Sudan', 1, NULL, NULL),
(208, 'SR', 'Suriname', 1, NULL, NULL),
(209, 'SJ', 'Svalbard and Jan Mayen Islands', 1, NULL, NULL),
(210, 'SZ', 'Swaziland', 1, NULL, NULL),
(211, 'SE', 'Sweden', 1, NULL, NULL),
(212, 'CH', 'Switzerland', 1, NULL, NULL),
(213, 'SY', 'Syrian Arab Republic', 1, NULL, NULL),
(214, 'TW', 'Taiwan', 1, NULL, NULL),
(215, 'TJ', 'Tajikistan', 1, NULL, NULL),
(216, 'TZ', 'Tanzania, United Republic of', 1, NULL, NULL),
(217, 'TH', 'Thailand', 1, NULL, NULL),
(218, 'TG', 'Togo', 1, NULL, NULL),
(219, 'TK', 'Tokelau', 1, NULL, NULL),
(220, 'TO', 'Tonga', 1, NULL, NULL),
(221, 'TT', 'Trinidad and Tobago', 1, NULL, NULL),
(222, 'TN', 'Tunisia', 1, NULL, NULL),
(223, 'TR', 'Turkey', 1, NULL, NULL),
(224, 'TM', 'Turkmenistan', 1, NULL, NULL),
(225, 'TC', 'Turks and Caicos Islands', 1, NULL, NULL),
(226, 'TV', 'Tuvalu', 1, NULL, NULL),
(227, 'UG', 'Uganda', 1, NULL, NULL),
(228, 'UA', 'Ukraine', 1, NULL, NULL),
(229, 'AE', 'United Arab Emirates', 1, NULL, NULL),
(230, 'GB', 'United Kingdom', 1, NULL, NULL),
(231, 'US', 'United States', 1, NULL, NULL),
(232, 'UM', 'United States minor outlying islands', 1, NULL, NULL),
(233, 'UY', 'Uruguay', 1, NULL, NULL),
(234, 'UZ', 'Uzbekistan', 1, NULL, NULL),
(235, 'VU', 'Vanuatu', 1, NULL, NULL),
(236, 'VA', 'Vatican City State', 1, NULL, NULL),
(237, 'VE', 'Venezuela', 1, NULL, NULL),
(238, 'VN', 'Vietnam', 1, NULL, NULL),
(239, 'VG', 'Virgin Islands (British)', 1, NULL, NULL),
(240, 'VI', 'Virgin Islands (U.S.)', 1, NULL, NULL),
(241, 'WF', 'Wallis and Futuna Islands', 1, NULL, NULL),
(242, 'EH', 'Western Sahara', 1, NULL, NULL),
(243, 'YE', 'Yemen', 1, NULL, NULL),
(244, 'ZR', 'Zaire', 1, NULL, NULL),
(245, 'ZM', 'Zambia', 1, NULL, NULL),
(246, 'ZW', 'Zimbabwe', 1, NULL, NULL),
(247, 'AF', 'Afghanistan', 1, NULL, NULL),
(248, 'AL', 'Albania', 1, NULL, NULL),
(249, 'DZ', 'Algeria', 1, NULL, NULL),
(250, 'DS', 'American Samoa', 1, NULL, NULL),
(251, 'AD', 'Andorra', 1, NULL, NULL),
(252, 'AO', 'Angola', 1, NULL, NULL),
(253, 'AI', 'Anguilla', 1, NULL, NULL),
(254, 'AQ', 'Antarctica', 1, NULL, NULL),
(255, 'AG', 'Antigua and Barbuda', 1, NULL, NULL),
(256, 'AR', 'Argentina', 1, NULL, NULL),
(257, 'AM', 'Armenia', 1, NULL, NULL),
(258, 'AW', 'Aruba', 1, NULL, NULL),
(259, 'AU', 'Australia', 1, NULL, NULL),
(260, 'AT', 'Austria', 1, NULL, NULL),
(261, 'AZ', 'Azerbaijan', 1, NULL, NULL),
(262, 'BS', 'Bahamas', 1, NULL, NULL),
(263, 'BH', 'Bahrain', 1, NULL, NULL),
(264, 'BD', 'Bangladesh', 1, NULL, NULL),
(265, 'BB', 'Barbados', 1, NULL, NULL),
(266, 'BY', 'Belarus', 1, NULL, NULL),
(267, 'BE', 'Belgium', 1, NULL, NULL),
(268, 'BZ', 'Belize', 1, NULL, NULL),
(269, 'BJ', 'Benin', 1, NULL, NULL),
(270, 'BM', 'Bermuda', 1, NULL, NULL),
(271, 'BT', 'Bhutan', 1, NULL, NULL),
(272, 'BO', 'Bolivia', 1, NULL, NULL),
(273, 'BA', 'Bosnia and Herzegovina', 1, NULL, NULL),
(274, 'BW', 'Botswana', 1, NULL, NULL),
(275, 'BV', 'Bouvet Island', 1, NULL, NULL),
(276, 'BR', 'Brazil', 1, NULL, NULL),
(277, 'IO', 'British Indian Ocean Territory', 1, NULL, NULL),
(278, 'BN', 'Brunei Darussalam', 1, NULL, NULL),
(279, 'BG', 'Bulgaria', 1, NULL, NULL),
(280, 'BF', 'Burkina Faso', 1, NULL, NULL),
(281, 'BI', 'Burundi', 1, NULL, NULL),
(282, 'KH', 'Cambodia', 1, NULL, NULL),
(283, 'CM', 'Cameroon', 1, NULL, NULL),
(284, 'CA', 'Canada', 1, NULL, NULL),
(285, 'CV', 'Cape Verde', 1, NULL, NULL),
(286, 'KY', 'Cayman Islands', 1, NULL, NULL),
(287, 'CF', 'Central African Republic', 1, NULL, NULL),
(288, 'TD', 'Chad', 1, NULL, NULL),
(289, 'CL', 'Chile', 1, NULL, NULL),
(290, 'CN', 'China', 1, NULL, NULL),
(291, 'CX', 'Christmas Island', 1, NULL, NULL),
(292, 'CC', 'Cocos (Keeling) Islands', 1, NULL, NULL),
(293, 'CO', 'Colombia', 1, NULL, NULL),
(294, 'KM', 'Comoros', 1, NULL, NULL),
(295, 'CG', 'Congo', 1, NULL, NULL),
(296, 'CK', 'Cook Islands', 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `coupons`
--

DROP TABLE IF EXISTS `coupons`;
CREATE TABLE IF NOT EXISTS `coupons` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `code` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `details` longtext COLLATE utf8_unicode_ci NOT NULL,
  `discount` double(8,2) NOT NULL,
  `discount_type` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `start_date` int(15) NOT NULL,
  `end_date` int(15) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `coupon_usages`
--

DROP TABLE IF EXISTS `coupon_usages`;
CREATE TABLE IF NOT EXISTS `coupon_usages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `coupon_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `currencies`
--

DROP TABLE IF EXISTS `currencies`;
CREATE TABLE IF NOT EXISTS `currencies` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `symbol` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `exchange_rate` double(10,5) NOT NULL,
  `status` int(10) NOT NULL DEFAULT 0,
  `code` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `currencies`
--

INSERT INTO `currencies` (`id`, `name`, `symbol`, `exchange_rate`, `status`, `code`, `created_at`, `updated_at`) VALUES
(1, 'U.S. Dollar', '$', 1.00000, 1, 'USD', '2018-10-09 11:35:08', '2021-01-26 10:10:37'),
(2, 'Australian Dollar', '$', 1.28000, 1, 'AUD', '2018-10-09 11:35:08', '2019-02-04 05:51:55'),
(5, 'Brazilian Real', 'R$', 3.25000, 1, 'BRL', '2018-10-09 11:35:08', '2018-10-17 05:51:00'),
(6, 'Canadian Dollar', '$', 1.27000, 1, 'CAD', '2018-10-09 11:35:08', '2018-10-09 11:35:08'),
(7, 'Czech Koruna', 'Kč', 20.65000, 1, 'CZK', '2018-10-09 11:35:08', '2018-10-09 11:35:08'),
(8, 'Danish Krone', 'kr', 6.05000, 1, 'DKK', '2018-10-09 11:35:08', '2018-10-09 11:35:08'),
(9, 'Euro', '€', 0.85000, 1, 'EUR', '2018-10-09 11:35:08', '2018-10-09 11:35:08'),
(10, 'Hong Kong Dollar', '$', 7.83000, 1, 'HKD', '2018-10-09 11:35:08', '2018-10-09 11:35:08'),
(11, 'Hungarian Forint', 'Ft', 255.24000, 1, 'HUF', '2018-10-09 11:35:08', '2018-10-09 11:35:08'),
(12, 'Israeli New Sheqel', '₪', 3.48000, 1, 'ILS', '2018-10-09 11:35:08', '2018-10-09 11:35:08'),
(13, 'Japanese Yen', '¥', 107.12000, 1, 'JPY', '2018-10-09 11:35:08', '2018-10-09 11:35:08'),
(14, 'Malaysian Ringgit', 'RM', 3.91000, 1, 'MYR', '2018-10-09 11:35:08', '2018-10-09 11:35:08'),
(15, 'Mexican Peso', '$', 18.72000, 1, 'MXN', '2018-10-09 11:35:08', '2018-10-09 11:35:08'),
(16, 'Norwegian Krone', 'kr', 7.83000, 1, 'NOK', '2018-10-09 11:35:08', '2018-10-09 11:35:08'),
(17, 'New Zealand Dollar', '$', 1.38000, 1, 'NZD', '2018-10-09 11:35:08', '2018-10-09 11:35:08'),
(18, 'Philippine Peso', '₱', 52.26000, 1, 'PHP', '2018-10-09 11:35:08', '2018-10-09 11:35:08'),
(19, 'Polish Zloty', 'zł', 3.39000, 1, 'PLN', '2018-10-09 11:35:08', '2018-10-09 11:35:08'),
(20, 'Pound Sterling', '£', 0.72000, 1, 'GBP', '2018-10-09 11:35:08', '2018-10-09 11:35:08'),
(21, 'Russian Ruble', 'руб', 55.93000, 1, 'RUB', '2018-10-09 11:35:08', '2018-10-09 11:35:08'),
(22, 'Singapore Dollar', '$', 1.32000, 1, 'SGD', '2018-10-09 11:35:08', '2018-10-09 11:35:08'),
(23, 'Swedish Krona', 'kr', 8.19000, 1, 'SEK', '2018-10-09 11:35:08', '2018-10-09 11:35:08'),
(24, 'Swiss Franc', 'CHF', 0.94000, 1, 'CHF', '2018-10-09 11:35:08', '2018-10-09 11:35:08'),
(26, 'Thai Baht', '฿', 31.39000, 1, 'THB', '2018-10-09 11:35:08', '2018-10-09 11:35:08'),
(27, 'Taka', '৳', 84.00000, 1, 'BDT', '2018-10-09 11:35:08', '2018-12-02 05:16:13'),
(28, 'Indian Rupee', 'Rs', 68.45000, 1, 'Rupee', '2019-07-07 10:33:46', '2019-07-07 10:33:46');

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

DROP TABLE IF EXISTS `customers`;
CREATE TABLE IF NOT EXISTS `customers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`id`, `user_id`, `created_at`, `updated_at`) VALUES
(4, 8, '2019-08-01 10:35:09', '2019-08-01 10:35:09'),
(5, 14, '2020-06-26 08:09:20', '2020-06-26 08:09:20'),
(6, 18, '2020-09-12 19:13:25', '2020-09-12 19:13:25'),
(7, 19, '2020-10-22 06:09:02', '2020-10-22 06:09:02'),
(8, 20, '2020-10-22 06:13:04', '2020-10-22 06:13:04'),
(9, 21, '2020-10-22 06:18:29', '2020-10-22 06:18:29'),
(10, 22, '2020-10-22 08:59:16', '2020-10-22 08:59:16'),
(11, 23, '2020-10-22 10:34:57', '2020-10-22 10:34:57'),
(12, 24, '2020-10-26 05:10:08', '2020-10-26 05:10:08'),
(13, 25, '2020-10-26 05:12:24', '2020-10-26 05:12:24'),
(14, 26, '2020-10-26 05:17:53', '2020-10-26 05:17:53'),
(15, 27, '2020-10-26 05:26:48', '2020-10-26 05:26:48'),
(16, 28, '2021-01-26 08:48:50', '2021-01-26 08:48:50'),
(17, 29, '2021-01-26 08:57:57', '2021-01-26 08:57:57'),
(18, 30, '2021-01-26 09:08:03', '2021-01-26 09:08:03'),
(19, 31, '2021-01-26 09:11:18', '2021-01-26 09:11:18'),
(20, 32, '2021-01-26 09:13:56', '2021-01-26 09:13:56'),
(21, 33, '2021-01-26 09:15:58', '2021-01-26 09:15:58'),
(22, 34, '2021-01-26 09:18:03', '2021-01-26 09:18:03'),
(24, 39, '2021-03-02 07:21:23', '2021-03-02 07:21:23');

-- --------------------------------------------------------

--
-- Table structure for table `customer_packages`
--

DROP TABLE IF EXISTS `customer_packages`;
CREATE TABLE IF NOT EXISTS `customer_packages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `amount` double(28,2) DEFAULT NULL,
  `product_upload` int(11) DEFAULT NULL,
  `logo` varchar(150) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `customer_products`
--

DROP TABLE IF EXISTS `customer_products`;
CREATE TABLE IF NOT EXISTS `customer_products` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `published` int(1) NOT NULL DEFAULT 0,
  `status` int(1) NOT NULL DEFAULT 0,
  `added_by` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `subcategory_id` int(11) DEFAULT NULL,
  `subsubcategory_id` int(11) DEFAULT NULL,
  `brand_id` int(11) DEFAULT NULL,
  `photos` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `thumbnail_img` varchar(150) COLLATE utf8_unicode_ci DEFAULT NULL,
  `conditon` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `location` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `video_provider` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `video_link` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `unit` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tags` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` mediumtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `unit_price` double(28,2) DEFAULT 0.00,
  `meta_title` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `meta_description` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `meta_img` varchar(150) COLLATE utf8_unicode_ci DEFAULT NULL,
  `pdf` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `slug` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `flash_deals`
--

DROP TABLE IF EXISTS `flash_deals`;
CREATE TABLE IF NOT EXISTS `flash_deals` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `start_date` int(20) DEFAULT NULL,
  `end_date` int(20) DEFAULT NULL,
  `status` int(1) NOT NULL DEFAULT 0,
  `featured` int(1) NOT NULL DEFAULT 0,
  `background_color` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `text_color` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `banner` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `flash_deals`
--

INSERT INTO `flash_deals` (`id`, `title`, `start_date`, `end_date`, `status`, `featured`, `background_color`, `text_color`, `banner`, `slug`, `created_at`, `updated_at`) VALUES
(7, 'Banar', 1593820800, 1593993600, 1, 0, '#faeff', 'dark', 'uploads/offers/banner/bx0iWkqCspV7eI68UofOVD0tkvCH2cgKffopR5Sl.jpeg', 'banar-sppcn', '2020-07-04 07:59:10', '2020-10-24 14:38:39'),
(8, 'jamuna', 1593820800, 1594339200, 1, 0, '#FFFCCAA', 'dark', 'uploads/offers/banner/RRCHldnCqHTOwUsJl4k53r4t1OEf5mHBG5PPZMMd.png', 'jamuna-hdxv9', '2020-07-04 08:01:50', '2020-10-24 14:38:40');

-- --------------------------------------------------------

--
-- Table structure for table `flash_deal_products`
--

DROP TABLE IF EXISTS `flash_deal_products`;
CREATE TABLE IF NOT EXISTS `flash_deal_products` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `flash_deal_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `discount` double(8,2) DEFAULT 0.00,
  `discount_type` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `flash_deal_products`
--

INSERT INTO `flash_deal_products` (`id`, `flash_deal_id`, `product_id`, `discount`, `discount_type`, `created_at`, `updated_at`) VALUES
(9, 7, 26, 150.00, 'amount', '2020-07-04 07:59:10', '2020-07-04 07:59:10'),
(10, 8, 17, 25.00, 'percent', '2020-07-04 08:01:50', '2020-07-04 08:01:50');

-- --------------------------------------------------------

--
-- Table structure for table `general_settings`
--

DROP TABLE IF EXISTS `general_settings`;
CREATE TABLE IF NOT EXISTS `general_settings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `frontend_color` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'default',
  `logo` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
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
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `general_settings`
--

INSERT INTO `general_settings` (`id`, `frontend_color`, `logo`, `admin_logo`, `admin_login_background`, `admin_login_sidebar`, `favicon`, `site_name`, `address`, `description`, `phone`, `email`, `facebook`, `instagram`, `twitter`, `youtube`, `google_plus`, `created_at`, `updated_at`) VALUES
(1, '3', 'uploads/logo/Uo8atTu9i1iHHEvz28se1SzlTloRi4WjIqCPjkgA.png', 'uploads/admin_logo/MAj9zDeT0NX7ZlbEzTrfFmQmd29RVWHcqiykxK9V.png', 'uploads/admin_login_background/gykzyamaBGycWNGXnkIrNq3QJEOmwDu72ysGh0eL.png', 'uploads/admin_login_sidebar/FKBGiiHW5V29Se11U1bZfhEK9IN3SRDyggugKUZi.png', 'uploads/favicon/ISNPh3VtCcy52UPZ4ST6qDT6UeKvNAQeEU7Hfp6P.png', 'Bazaar Pratidin', '46, Flat#5A,Opposite of Hatil, West Shewrapara,Mirpur (4.90 mi) Dhaka, Bangladesh 1216', 'bazaarpratidin', '+8801712946826', 'info@bazaarpratidin.com', 'https://www.facebook.com/bazaarpratidinonline', 'https://www.instagram.com', 'https://www.twitter.com', 'https://www.youtube.com', 'https://www.googleplus.com', '2020-09-12 13:49:56', '2020-09-12 17:49:56');

-- --------------------------------------------------------

--
-- Table structure for table `home_categories`
--

DROP TABLE IF EXISTS `home_categories`;
CREATE TABLE IF NOT EXISTS `home_categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category_id` int(11) NOT NULL,
  `subsubcategories` varchar(1000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` int(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `home_categories`
--

INSERT INTO `home_categories` (`id`, `category_id`, `subsubcategories`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, '[\"1\"]', 1, '2019-03-12 06:38:23', '2020-07-11 08:08:40'),
(2, 2, '[\"10\"]', 1, '2019-03-12 06:44:54', '2019-03-12 06:44:54');

-- --------------------------------------------------------

--
-- Table structure for table `languages`
--

DROP TABLE IF EXISTS `languages`;
CREATE TABLE IF NOT EXISTS `languages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `code` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `rtl` int(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `languages`
--

INSERT INTO `languages` (`id`, `name`, `code`, `rtl`, `created_at`, `updated_at`) VALUES
(1, 'English', 'en', 0, '2019-01-20 12:13:20', '2020-06-18 14:27:39'),
(3, 'Bangla', 'bd', 0, '2019-02-17 06:35:37', '2020-06-18 14:27:39');

-- --------------------------------------------------------

--
-- Table structure for table `links`
--

DROP TABLE IF EXISTS `links`;
CREATE TABLE IF NOT EXISTS `links` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `url` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

DROP TABLE IF EXISTS `messages`;
CREATE TABLE IF NOT EXISTS `messages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `conversation_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `message` text COLLATE utf32_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf32 COLLATE=utf32_unicode_ci;

--
-- Dumping data for table `messages`
--

INSERT INTO `messages` (`id`, `conversation_id`, `user_id`, `message`, `created_at`, `updated_at`) VALUES
(8, 2, 12, 'sdiofj sdlfjksd dsfdios;fhsdmn fsdafsdajkfhbs v', '2021-01-26 09:48:55', '2021-01-26 09:48:55');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `oauth_access_tokens`
--

DROP TABLE IF EXISTS `oauth_access_tokens`;
CREATE TABLE IF NOT EXISTS `oauth_access_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `client_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_access_tokens_user_id_index` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_access_tokens`
--

INSERT INTO `oauth_access_tokens` (`id`, `user_id`, `client_id`, `name`, `scopes`, `revoked`, `created_at`, `updated_at`, `expires_at`) VALUES
('125ce8289850f80d9fea100325bf892fbd0deba1f87dbfc2ab81fb43d57377ec24ed65f7dc560e46', 1, 1, 'Personal Access Token', '[]', 0, '2019-07-30 04:51:13', '2019-07-30 04:51:13', '2020-07-30 10:51:13'),
('293d2bb534220c070c4e90d25b5509965d23d3ddbc05b1e29fb4899ae09420ff112dbccab1c6f504', 1, 1, 'Personal Access Token', '[]', 1, '2019-08-04 06:00:04', '2019-08-04 06:00:04', '2020-08-04 12:00:04'),
('5363e91c7892acdd6417aa9c7d4987d83568e229befbd75be64282dbe8a88147c6c705e06c1fb2bf', 1, 1, 'Personal Access Token', '[]', 0, '2019-07-13 06:44:28', '2019-07-13 06:44:28', '2020-07-13 12:44:28'),
('681b4a4099fac5e12517307b4027b54df94cbaf0cbf6b4bf496534c94f0ccd8a79dd6af9742d076b', 1, 1, 'Personal Access Token', '[]', 1, '2019-08-04 07:23:06', '2019-08-04 07:23:06', '2020-08-04 13:23:06'),
('6d229e3559e568df086c706a1056f760abc1370abe74033c773490581a042442154afa1260c4b6f0', 1, 1, 'Personal Access Token', '[]', 1, '2019-08-04 07:32:12', '2019-08-04 07:32:12', '2020-08-04 13:32:12'),
('6efc0f1fc3843027ea1ea7cd35acf9c74282f0271c31d45a164e7b27025a315d31022efe7bb94aaa', 1, 1, 'Personal Access Token', '[]', 0, '2019-08-08 02:35:26', '2019-08-08 02:35:26', '2020-08-08 08:35:26'),
('7745b763da15a06eaded371330072361b0524c41651cf48bf76fc1b521a475ece78703646e06d3b0', 1, 1, 'Personal Access Token', '[]', 1, '2019-08-04 07:29:44', '2019-08-04 07:29:44', '2020-08-04 13:29:44'),
('815b625e239934be293cd34479b0f766bbc1da7cc10d464a2944ddce3a0142e943ae48be018ccbd0', 1, 1, 'Personal Access Token', '[]', 1, '2019-07-22 02:07:47', '2019-07-22 02:07:47', '2020-07-22 08:07:47'),
('8921a4c96a6d674ac002e216f98855c69de2568003f9b4136f6e66f4cb9545442fb3e37e91a27cad', 1, 1, 'Personal Access Token', '[]', 1, '2019-08-04 06:05:05', '2019-08-04 06:05:05', '2020-08-04 12:05:05'),
('8d8b85720304e2f161a66564cec0ecd50d70e611cc0efbf04e409330086e6009f72a39ce2191f33a', 1, 1, 'Personal Access Token', '[]', 1, '2019-08-04 06:44:35', '2019-08-04 06:44:35', '2020-08-04 12:44:35'),
('bcaaebdead4c0ef15f3ea6d196fd80749d309e6db8603b235e818cb626a5cea034ff2a55b66e3e1a', 1, 1, 'Personal Access Token', '[]', 1, '2019-08-04 07:14:32', '2019-08-04 07:14:32', '2020-08-04 13:14:32'),
('c25417a5c728073ca8ba57058ded43d496a9d2619b434d2a004dd490a64478c08bc3e06ffc1be65d', 1, 1, 'Personal Access Token', '[]', 1, '2019-07-30 01:45:31', '2019-07-30 01:45:31', '2020-07-30 07:45:31'),
('c7423d85b2b5bdc5027cb283be57fa22f5943cae43f60b0ed27e6dd198e46f25e3501b3081ed0777', 1, 1, 'Personal Access Token', '[]', 1, '2019-08-05 05:02:59', '2019-08-05 05:02:59', '2020-08-05 11:02:59'),
('e76f19dbd5c2c4060719fb1006ac56116fd86f7838b4bf74e2c0a0ac9696e724df1e517dbdb357f4', 1, 1, 'Personal Access Token', '[]', 1, '2019-07-15 02:53:40', '2019-07-15 02:53:40', '2020-07-15 08:53:40'),
('ed7c269dd6f9a97750a982f62e0de54749be6950e323cdfef892a1ec93f8ddbacf9fe26e6a42180e', 1, 1, 'Personal Access Token', '[]', 1, '2019-07-13 06:36:45', '2019-07-13 06:36:45', '2020-07-13 12:36:45'),
('f6d1475bc17a27e389000d3df4da5c5004ce7610158b0dd414226700c0f6db48914637b4c76e1948', 1, 1, 'Personal Access Token', '[]', 1, '2019-08-04 07:22:01', '2019-08-04 07:22:01', '2020-08-04 13:22:01'),
('f85e4e444fc954430170c41779a4238f84cd6fed905f682795cd4d7b6a291ec5204a10ac0480eb30', 1, 1, 'Personal Access Token', '[]', 1, '2019-07-30 06:38:49', '2019-07-30 06:38:49', '2020-07-30 12:38:49'),
('f8bf983a42c543b99128296e4bc7c2d17a52b5b9ef69670c629b93a653c6a4af27be452e0c331f79', 1, 1, 'Personal Access Token', '[]', 1, '2019-08-04 07:28:55', '2019-08-04 07:28:55', '2020-08-04 13:28:55');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_auth_codes`
--

DROP TABLE IF EXISTS `oauth_auth_codes`;
CREATE TABLE IF NOT EXISTS `oauth_auth_codes` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  `client_id` int(10) UNSIGNED NOT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_clients`
--

DROP TABLE IF EXISTS `oauth_clients`;
CREATE TABLE IF NOT EXISTS `oauth_clients` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
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

--
-- Dumping data for table `oauth_clients`
--

INSERT INTO `oauth_clients` (`id`, `user_id`, `name`, `secret`, `redirect`, `personal_access_client`, `password_client`, `revoked`, `created_at`, `updated_at`) VALUES
(1, NULL, 'Laravel Personal Access Client', 'eR2y7WUuem28ugHKppFpmss7jPyOHZsMkQwBo1Jj', 'http://localhost', 1, 0, 0, '2019-07-13 06:17:34', '2019-07-13 06:17:34'),
(2, NULL, 'Laravel Password Grant Client', 'WLW2Ol0GozbaXEnx1NtXoweYPuKEbjWdviaUgw77', 'http://localhost', 0, 1, 0, '2019-07-13 06:17:34', '2019-07-13 06:17:34');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_personal_access_clients`
--

DROP TABLE IF EXISTS `oauth_personal_access_clients`;
CREATE TABLE IF NOT EXISTS `oauth_personal_access_clients` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `client_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_personal_access_clients_client_id_index` (`client_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_personal_access_clients`
--

INSERT INTO `oauth_personal_access_clients` (`id`, `client_id`, `created_at`, `updated_at`) VALUES
(1, 1, '2019-07-13 06:17:34', '2019-07-13 06:17:34');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_refresh_tokens`
--

DROP TABLE IF EXISTS `oauth_refresh_tokens`;
CREATE TABLE IF NOT EXISTS `oauth_refresh_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `access_token_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_refresh_tokens_access_token_id_index` (`access_token_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
CREATE TABLE IF NOT EXISTS `orders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `guest_id` int(11) DEFAULT NULL,
  `shipping_address` longtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `payment_type` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `payment_status` varchar(20) COLLATE utf8_unicode_ci DEFAULT 'unpaid',
  `payment_details` longtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `grand_total` double(8,2) DEFAULT NULL,
  `coupon_discount` double(8,2) NOT NULL DEFAULT 0.00,
  `code` mediumtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `date` int(20) NOT NULL,
  `viewed` int(1) NOT NULL DEFAULT 0,
  `delivery_viewed` int(1) NOT NULL DEFAULT 1,
  `payment_status_viewed` int(1) DEFAULT 1,
  `commission_calculated` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=92 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `user_id`, `guest_id`, `shipping_address`, `payment_type`, `payment_status`, `payment_details`, `grand_total`, `coupon_discount`, `code`, `date`, `viewed`, `delivery_viewed`, `payment_status_viewed`, `commission_calculated`, `created_at`, `updated_at`) VALUES
(5, NULL, 265735, '{\"name\":\"md. abdul baten\",\"email\":\"abdulbaten2534@gmail.com\",\"address\":\"15 purana paltan, chowdhury Complex(1st Floor shop-11\",\"country\":\"Bangladesh\",\"city\":\"Dhaka\",\"postal_code\":\"1217\",\"phone\":\"01919946826\",\"checkout_type\":\"guest\"}', 'cash_on_delivery', 'paid', NULL, 122000.00, 0.00, '20200616-12055061', 1592309150, 1, 0, 0, 0, '2020-06-16 16:05:50', '2020-06-19 09:12:06'),
(6, NULL, 601578, '{\"name\":\"Babu\",\"email\":\"mdabuhasan01@gmail.com\",\"address\":\"Pipulbariabazar bagbati sirajgonj\",\"country\":\"Bangladesh\",\"city\":\"Sirajganj\",\"postal_code\":\"6700\",\"phone\":\"01717122035\",\"checkout_type\":\"guest\"}', 'cash_on_delivery', 'paid', NULL, 160.00, 0.00, '20200617-14481874', 1592405298, 1, 0, 0, 0, '2020-06-17 18:48:18', '2020-06-17 20:40:09'),
(7, 12, NULL, '{\"name\":\"dfcghjb zdxfcgvhbjn\",\"email\":\"landcluser1.rms@gmail.com\",\"address\":\"zsdxfcgvhbn\",\"country\":\"Afghanistan\",\"city\":\"sxdcfvghbnjm\",\"postal_code\":\"121232\",\"phone\":\"1364465313\",\"checkout_type\":\"logged\"}', 'cash_on_delivery', 'paid', NULL, 160.00, 0.00, '20200618-10065178', 1592474811, 1, 0, 0, 0, '2020-06-18 14:06:51', '2020-06-18 14:12:10'),
(8, NULL, 946574, '{\"name\":\"Md. Abul Kalam Azad\",\"email\":\"azadsb@gmail.com\",\"address\":\"sb office\",\"country\":\"Bangladesh\",\"city\":\"dhaka\",\"postal_code\":\"1217\",\"phone\":\"01918163226\",\"checkout_type\":\"guest\"}', 'cash_on_delivery', 'paid', NULL, 240.02, 0.00, '20200622-08464729', 1592815607, 1, 0, 0, 0, '2020-06-22 12:46:47', '2020-06-30 10:16:30'),
(9, 12, NULL, '{\"name\":\"Md Anower hossain\",\"email\":\"shariful372788@gmail.com\",\"address\":\"khatiyamari, Dhunot, Bogura.\",\"country\":\"Bangladesh\",\"city\":\"Khatiyamari,Bogra.\",\"postal_code\":\"+880\",\"phone\":\"01712946826\",\"checkout_type\":\"logged\"}', 'cash_on_delivery', 'paid', NULL, 9500.00, 0.00, '20200711-04051219', 1594440312, 1, 0, 0, 0, '2020-07-11 08:05:12', '2020-07-11 13:57:12'),
(10, 14, NULL, '{\"name\":\"kawsarahmmed\",\"email\":\"kawsarahmmed6959@gmail.com\",\"address\":null,\"country\":null,\"city\":null,\"postal_code\":null,\"phone\":null}', 'cash', 'paid', 'cash', 15600.00, 5000.00, '20200902-13264938', 1599053209, 0, 0, 0, 1, '2020-09-02 17:26:49', '2020-09-02 17:26:51'),
(11, 14, NULL, '{\"name\":\"kawsarahmmed\",\"email\":\"kawsarahmmed6959@gmail.com\",\"address\":null,\"country\":null,\"city\":null,\"postal_code\":null,\"phone\":null}', 'cash', 'paid', 'cash', 9902.50, 400.00, '20200902-13305094', 1599053450, 0, 0, 0, 1, '2020-09-02 17:30:50', '2020-09-02 17:30:51'),
(12, 12, NULL, '{\"name\":\"Youth Fire IT\",\"email\":\"admin@youthfireit.com\",\"address\":\"ffffcv\",\"country\":\"Bangladesh\",\"city\":\"dhaka\",\"postal_code\":\"1217\",\"phone\":\"1919946826\",\"checkout_type\":\"logged\"}', 'cash_on_delivery', 'unpaid', NULL, 34.00, 0.00, '20200902-14470412', 1599058024, 0, 0, 0, 0, '2020-09-02 18:47:04', '2020-09-02 18:47:04'),
(13, 14, NULL, '{\"name\":\"kawsarahmmed\",\"email\":\"kawsarahmmed6959@gmail.com\",\"address\":null,\"country\":null,\"city\":null,\"postal_code\":null,\"phone\":null}', 'cash', 'paid', 'cash', 7240.00, 2000.00, '20200904-14120281', 1599228722, 0, 0, 0, 1, '2020-09-04 18:12:02', '2020-09-04 18:12:05'),
(14, 14, NULL, '{\"name\":\"kawsarahmmed\",\"email\":\"kawsarahmmed6959@gmail.com\",\"address\":null,\"country\":null,\"city\":null,\"postal_code\":null,\"phone\":null}', 'cash', 'paid', 'cash', 7240.00, 2000.00, '20200904-14120311', 1599228723, 0, 0, 0, 1, '2020-09-04 18:12:03', '2020-09-04 18:12:05'),
(15, 12, NULL, '{\"name\":\"Youth Fire IT\",\"email\":\"admin@youthfireit.com\",\"address\":\"ffffcv\",\"country\":\"Bangladesh\",\"city\":\"dhaka\",\"postal_code\":\"1217\",\"phone\":\"1919946826\",\"checkout_type\":\"logged\"}', 'cash_on_delivery', 'unpaid', NULL, 122000.00, 0.00, '20200904-14295352', 1599229793, 0, 0, 0, 0, '2020-09-04 18:29:53', '2020-09-04 18:29:53'),
(16, 8, NULL, '{\"name\":\"Mr. Customer\",\"email\":\"customer@example.com\",\"address\":null,\"country\":null,\"city\":null,\"postal_code\":\"1234\",\"phone\":null}', 'cash', 'paid', 'cash', 122000.50, 52.00, '20200905-16421942', 1599324139, 0, 0, 0, 1, '2020-09-05 20:42:19', '2020-09-05 20:42:22'),
(17, 8, NULL, '{\"name\":\"Mr. Customer\",\"email\":\"customer@example.com\",\"address\":null,\"country\":null,\"city\":null,\"postal_code\":\"1234\",\"phone\":null}', 'cash', 'paid', 'cash', 122000.50, 52.00, '20200905-16422138', 1599324141, 0, 0, 0, 1, '2020-09-05 20:42:21', '2020-09-05 20:42:22'),
(18, 14, NULL, '{\"name\":\"kawsarahmmed\",\"email\":\"kawsarahmmed6959@gmail.com\",\"address\":null,\"country\":null,\"city\":null,\"postal_code\":null,\"phone\":null}', 'cash', 'paid', 'cash', 131500.00, 0.00, '20200905-16441387', 1599324253, 1, 0, 0, 1, '2020-09-05 20:44:13', '2020-09-08 12:33:22'),
(19, NULL, 930257, '{\"name\":null,\"email\":null,\"address\":null,\"country\":\"Afghanistan\",\"city\":null,\"postal_code\":null,\"phone\":null}', 'cash', 'paid', 'cash', 27900.00, 0.00, '20200907-08061977', 1599465979, 0, 0, 0, 1, '2020-09-07 12:06:19', '2020-09-07 12:06:22'),
(20, NULL, 480245, '{\"name\":null,\"email\":null,\"address\":null,\"country\":\"Afghanistan\",\"city\":null,\"postal_code\":null,\"phone\":null}', 'cash', 'paid', 'cash', 27900.00, 0.00, '20200907-08062149', 1599465981, 1, 0, 0, 1, '2020-09-07 12:06:21', '2020-09-09 07:35:39'),
(21, NULL, 559620, '{\"name\":null,\"email\":null,\"address\":null,\"country\":\"Afghanistan\",\"city\":null,\"postal_code\":null,\"phone\":null}', 'cash', 'paid', 'cash', 18400.00, 0.00, '20200907-08065778', 1599466017, 1, 0, 0, 1, '2020-09-07 12:06:57', '2020-09-09 07:33:59'),
(22, NULL, 404711, '{\"name\":null,\"email\":null,\"address\":null,\"country\":\"Afghanistan\",\"city\":null,\"postal_code\":null,\"phone\":null}', 'cash', 'paid', 'cash', 18400.00, 0.00, '20200907-08065725', 1599466017, 1, 0, 0, 1, '2020-09-07 12:06:57', '2020-09-09 07:35:55'),
(23, NULL, 215316, '{\"name\":null,\"email\":null,\"address\":null,\"country\":\"Afghanistan\",\"city\":null,\"postal_code\":null,\"phone\":null}', 'cash', 'paid', 'cash', 9740.02, 0.00, '20200907-16382950', 1599496709, 1, 0, 0, 1, '2020-09-07 20:38:29', '2020-09-09 07:33:38'),
(24, NULL, 250768, '{\"name\":null,\"email\":null,\"address\":null,\"country\":\"Afghanistan\",\"city\":null,\"postal_code\":null,\"phone\":null}', 'cash', 'paid', 'cash', 9740.02, 0.00, '20200907-16383083', 1599496710, 1, 0, 0, 1, '2020-09-07 20:38:30', '2020-09-09 07:33:15'),
(25, NULL, 345551, '{\"name\":null,\"email\":null,\"address\":null,\"country\":\"Afghanistan\",\"city\":null,\"postal_code\":null,\"phone\":null}', 'cash', 'paid', 'cash', 9740.02, 0.00, '20200907-16383161', 1599496711, 1, 0, 0, 1, '2020-09-07 20:38:31', '2020-09-08 12:33:00'),
(26, NULL, 627959, '{\"name\":null,\"email\":null,\"address\":null,\"country\":\"Afghanistan\",\"city\":null,\"postal_code\":null,\"phone\":null}', 'cash', 'paid', 'cash', 9740.02, 0.00, '20200907-16383152', 1599496711, 1, 0, 0, 1, '2020-09-07 20:38:31', '2020-09-09 07:32:20'),
(27, NULL, 626098, '{\"name\":null,\"email\":null,\"address\":null,\"country\":\"Afghanistan\",\"city\":null,\"postal_code\":null,\"phone\":null}', 'cash', 'paid', 'cash', 9740.02, 0.00, '20200907-16383268', 1599496712, 1, 0, 0, 1, '2020-09-07 20:38:32', '2020-09-08 12:32:51'),
(28, NULL, 634136, '{\"name\":null,\"email\":null,\"address\":null,\"country\":\"Afghanistan\",\"city\":null,\"postal_code\":null,\"phone\":null}', 'cash', 'paid', 'cash', 15400.00, 3000.00, '20200908-07325154', 1599550371, 1, 0, 0, 1, '2020-09-08 11:32:51', '2020-09-08 12:32:28'),
(29, NULL, 418991, '{\"name\":null,\"email\":null,\"address\":null,\"country\":\"Afghanistan\",\"city\":null,\"postal_code\":null,\"phone\":null}', 'cash', 'paid', 'cash', 52.50, 0.00, '20200908-08343629', 1599554076, 1, 0, 0, 1, '2020-09-08 12:34:36', '2020-09-09 07:31:37'),
(30, NULL, 934271, '{\"name\":null,\"email\":null,\"address\":null,\"country\":\"Afghanistan\",\"city\":null,\"postal_code\":null,\"phone\":null}', 'cash', 'paid', 'cash', 1350.00, 0.00, '20200908-08351517', 1599554115, 1, 0, 0, 1, '2020-09-08 12:35:15', '2020-09-09 07:31:08'),
(31, NULL, 441453, '{\"name\":null,\"email\":null,\"address\":null,\"country\":\"Afghanistan\",\"city\":null,\"postal_code\":null,\"phone\":null}', 'cash', 'paid', 'cash', 157.50, 0.00, '20200908-08352920', 1599554129, 1, 0, 0, 1, '2020-09-08 12:35:29', '2020-09-08 17:07:49'),
(32, NULL, 164644, '{\"name\":null,\"email\":null,\"address\":null,\"country\":\"Afghanistan\",\"city\":null,\"postal_code\":null,\"phone\":null}', 'cash', 'paid', 'cash', 9657.50, 0.00, '20200908-13102759', 1599570627, 1, 0, 0, 1, '2020-09-08 17:10:27', '2020-09-09 07:30:53'),
(33, NULL, 199400, '{\"name\":null,\"email\":null,\"address\":null,\"country\":\"Afghanistan\",\"city\":null,\"postal_code\":null,\"phone\":null}', 'cash', 'paid', 'cash', 9657.50, 0.00, '20200908-13102811', 1599570628, 1, 0, 0, 1, '2020-09-08 17:10:28', '2020-09-09 07:30:38'),
(34, NULL, 722230, '{\"name\":null,\"email\":null,\"address\":null,\"country\":\"Afghanistan\",\"city\":null,\"postal_code\":null,\"phone\":null}', 'cash', 'paid', 'cash', 8000.00, 0.00, '20200908-13111897', 1599570678, 1, 0, 0, 1, '2020-09-08 17:11:18', '2020-09-09 07:30:21'),
(35, NULL, 750943, '{\"name\":null,\"email\":null,\"address\":null,\"country\":\"Afghanistan\",\"city\":null,\"postal_code\":null,\"phone\":null}', 'cash', 'paid', 'cash', 21134.00, 0.00, '20200909-17091146', 1599671351, 0, 0, 0, 1, '2020-09-09 21:09:11', '2020-09-09 21:09:13'),
(36, NULL, 444350, '{\"name\":null,\"email\":null,\"address\":null,\"country\":\"Afghanistan\",\"city\":null,\"postal_code\":null,\"phone\":null}', 'cash', 'paid', 'cash', 21134.00, 0.00, '20200909-17091283', 1599671352, 1, 0, 0, 1, '2020-09-09 21:09:12', '2020-09-10 08:17:10'),
(37, NULL, 753210, '{\"name\":null,\"email\":null,\"address\":null,\"country\":\"Afghanistan\",\"city\":null,\"postal_code\":null,\"phone\":null}', 'cash', 'paid', 'cash', 8900.00, 0.00, '20200910-04174070', 1599711460, 0, 0, 0, 1, '2020-09-10 08:17:40', '2020-09-10 08:17:42'),
(38, NULL, 414840, '{\"name\":null,\"email\":null,\"address\":null,\"country\":\"Afghanistan\",\"city\":null,\"postal_code\":null,\"phone\":null}', 'cash', 'paid', 'cash', 8900.00, 0.00, '20200910-04174110', 1599711461, 0, 0, 0, 1, '2020-09-10 08:17:41', '2020-09-10 08:17:42'),
(39, 14, NULL, '{\"name\":\"kawsarahmmed\",\"email\":\"kawsarahmmed6959@gmail.com\",\"address\":null,\"country\":null,\"city\":null,\"postal_code\":null,\"phone\":null}', 'cash', 'paid', 'cash', 52.50, 0.00, '20200910-04204675', 1599711646, 0, 0, 0, 1, '2020-09-10 08:20:46', '2020-09-10 08:20:47'),
(40, 14, NULL, '{\"name\":\"kawsarahmmed\",\"email\":\"kawsarahmmed6959@gmail.com\",\"address\":null,\"country\":null,\"city\":null,\"postal_code\":null,\"phone\":null}', 'cash', 'paid', 'cash', 52.50, 0.00, '20200910-04204724', 1599711647, 0, 0, 0, 1, '2020-09-10 08:20:47', '2020-09-10 08:20:47'),
(41, NULL, 595464, '{\"name\":null,\"email\":null,\"address\":null,\"country\":\"Afghanistan\",\"city\":null,\"postal_code\":null,\"phone\":null}', 'cash', 'paid', 'cash', 122000.00, 0.00, '20200910-09224731', 1599729767, 0, 0, 0, 1, '2020-09-10 13:22:47', '2020-09-10 13:22:49'),
(42, NULL, 752818, '{\"name\":null,\"email\":null,\"address\":null,\"country\":\"Afghanistan\",\"city\":null,\"postal_code\":null,\"phone\":null}', 'cash', 'paid', 'cash', 122000.00, 0.00, '20200910-09224747', 1599729767, 0, 0, 0, 1, '2020-09-10 13:22:47', '2020-09-10 13:22:49'),
(43, NULL, 981617, '{\"name\":null,\"email\":null,\"address\":null,\"country\":\"Afghanistan\",\"city\":null,\"postal_code\":null,\"phone\":null}', 'cash', 'paid', 'cash', 122000.00, 0.00, '20200910-09224877', 1599729768, 0, 0, 0, 1, '2020-09-10 13:22:48', '2020-09-10 13:22:49'),
(44, 14, NULL, '{\"name\":\"kawsarahmmed\",\"email\":\"kawsarahmmed6959@gmail.com\",\"address\":null,\"country\":null,\"city\":null,\"postal_code\":null,\"phone\":null}', 'cash', 'paid', 'cash', 240.02, 0.00, '20200910-09252116', 1599729921, 0, 0, 0, 1, '2020-09-10 13:25:21', '2020-09-10 13:25:21'),
(45, 14, NULL, '{\"name\":\"kawsarahmmed\",\"email\":\"kawsarahmmed6959@gmail.com\",\"address\":null,\"country\":null,\"city\":null,\"postal_code\":null,\"phone\":null}', 'cash', 'paid', 'cash', 52.50, 0.00, '20200910-09263965', 1599729999, 0, 0, 0, 1, '2020-09-10 13:26:39', '2020-09-10 13:26:40'),
(46, 8, NULL, '{\"name\":\"Mr. Customer\",\"email\":\"customer@example.com\",\"address\":null,\"country\":null,\"city\":null,\"postal_code\":\"1234\",\"phone\":null}', 'cash', 'paid', 'cash', 52.50, 0.00, '20200910-09295189', 1599730191, 0, 0, 0, 1, '2020-09-10 13:29:51', '2020-09-10 13:29:52'),
(47, 8, NULL, '{\"name\":\"Mr. Customer\",\"email\":\"customer@example.com\",\"address\":null,\"country\":null,\"city\":null,\"postal_code\":\"1234\",\"phone\":null}', 'cash', 'paid', 'cash', 52.50, 0.00, '20200910-09302537', 1599730225, 0, 0, 0, 1, '2020-09-10 13:30:25', '2020-09-10 13:30:26'),
(48, 8, NULL, '{\"name\":null,\"email\":null,\"address\":null,\"country\":\"Afghanistan\",\"city\":null,\"postal_code\":null,\"phone\":null}', 'cash', 'paid', 'cash', 52.50, 0.00, '20200910-09310123', 1599730261, 0, 0, 0, 1, '2020-09-10 13:31:01', '2020-09-10 13:31:01'),
(49, 8, NULL, '{\"name\":\"Mr. Customer\",\"email\":\"customer@example.com\",\"address\":null,\"country\":null,\"city\":null,\"postal_code\":\"1234\",\"phone\":null}', 'cash', 'paid', 'cash', 700.00, 0.00, '20200910-09324494', 1599730364, 0, 0, 0, 1, '2020-09-10 13:32:44', '2020-09-10 13:32:45'),
(50, 8, NULL, '{\"name\":\"Mr. Customer\",\"email\":\"customer@example.com\",\"address\":null,\"country\":null,\"city\":null,\"postal_code\":\"1234\",\"phone\":null}', 'cash', 'paid', 'cash', 52.50, 0.00, '20200910-09331387', 1599730393, 0, 0, 0, 1, '2020-09-10 13:33:13', '2020-09-10 13:33:13'),
(51, NULL, 103164, '{\"name\":null,\"email\":null,\"address\":null,\"country\":\"Afghanistan\",\"city\":null,\"postal_code\":null,\"phone\":null}', 'cash', 'paid', 'cash', 8900.00, 0.00, '20200910-10172111', 1599733041, 0, 0, 0, 1, '2020-09-10 14:17:21', '2020-09-10 14:17:23'),
(52, NULL, 458677, '{\"name\":null,\"email\":null,\"address\":null,\"country\":\"Afghanistan\",\"city\":null,\"postal_code\":null,\"phone\":null}', 'cash', 'paid', 'cash', 8900.00, 0.00, '20200910-10172255', 1599733042, 0, 0, 0, 1, '2020-09-10 14:17:22', '2020-09-10 14:17:23'),
(53, NULL, 967546, '{\"name\":null,\"email\":null,\"address\":null,\"country\":\"Afghanistan\",\"city\":null,\"postal_code\":null,\"phone\":null}', 'cash', 'paid', 'cash', 8900.00, 0.00, '20200910-10172255', 1599733042, 0, 0, 0, 1, '2020-09-10 14:17:22', '2020-09-10 14:17:23'),
(54, 14, NULL, '{\"name\":\"kawsarahmmed\",\"email\":\"kawsarahmmed6959@gmail.com\",\"address\":null,\"country\":null,\"city\":null,\"postal_code\":null,\"phone\":null}', 'cash', 'paid', 'cash', 8900.00, 0.00, '20200910-10181789', 1599733097, 0, 0, 0, 1, '2020-09-10 14:18:17', '2020-09-10 14:18:17'),
(55, NULL, 780833, '{\"name\":\"md hasan\",\"email\":\"nfc6600@gmail.com\",\"address\":null,\"country\":\"Bangladesh\",\"city\":null,\"postal_code\":\"6700\",\"phone\":\"01718570043\"}', 'cash', 'paid', 'cash', 3250.00, 50.00, '20200910-14052512', 1599746725, 0, 0, 0, 1, '2020-09-10 18:05:25', '2020-09-10 18:05:28'),
(56, NULL, 729289, '{\"name\":\"md hasan\",\"email\":\"nfc6600@gmail.com\",\"address\":null,\"country\":\"Bangladesh\",\"city\":null,\"postal_code\":\"6700\",\"phone\":\"01718570043\"}', 'cash', 'paid', 'cash', 3250.00, 50.00, '20200910-14052829', 1599746728, 0, 0, 0, 1, '2020-09-10 18:05:28', '2020-09-10 18:05:29'),
(57, 12, NULL, '{\"name\":\"Youth Fire IT\",\"email\":\"admin@youthfireit.com\",\"address\":\"dottobari\",\"country\":\"Bangladesh\",\"city\":\"sirajganj\",\"postal_code\":\"6700\",\"phone\":\"01718570043\",\"checkout_type\":\"logged\"}', 'cash_on_delivery', 'paid', NULL, 9500.00, 0.00, '20200910-14093193', 1599746971, 1, 0, 0, 1, '2020-09-10 18:09:31', '2020-09-27 20:08:21'),
(58, NULL, 998755, '{\"name\":null,\"email\":null,\"address\":null,\"country\":\"Afghanistan\",\"city\":null,\"postal_code\":null,\"phone\":null}', 'cash', 'paid', 'cash', 3250.00, 0.00, '20200910-15353356', 1599752133, 1, 0, 0, 1, '2020-09-10 19:35:33', '2020-09-14 14:45:34'),
(59, NULL, 570994, '{\"name\":null,\"email\":null,\"address\":null,\"country\":\"Afghanistan\",\"city\":null,\"postal_code\":null,\"phone\":null}', 'cash', 'paid', 'cash', 3250.00, 0.00, '20200910-15353353', 1599752133, 0, 0, 0, 1, '2020-09-10 19:35:33', '2020-09-10 19:35:35'),
(60, NULL, 520370, '{\"name\":null,\"email\":null,\"address\":null,\"country\":\"Afghanistan\",\"city\":null,\"postal_code\":null,\"phone\":null}', 'cash', 'paid', 'cash', 3250.00, 0.00, '20200910-15353488', 1599752134, 1, 0, 0, 1, '2020-09-10 19:35:34', '2020-09-12 14:16:02'),
(61, NULL, 121881, '{\"name\":null,\"email\":null,\"address\":null,\"country\":\"Afghanistan\",\"city\":null,\"postal_code\":null,\"phone\":null}', 'cash', 'paid', 'cash', 29467.00, 0.00, '20200912-10070392', 1599905223, 1, 0, 0, 1, '2020-09-12 14:07:03', '2020-09-12 14:07:40'),
(62, NULL, 606448, '{\"name\":\"md ainal\",\"email\":null,\"address\":null,\"country\":\"Bangladesh\",\"city\":null,\"postal_code\":\"6700\",\"phone\":\"01775643381\"}', 'cash', 'paid', 'cash', 8900.00, 0.00, '20200912-10224326', 1599906163, 1, 0, 0, 1, '2020-09-12 14:22:43', '2020-09-12 14:24:00'),
(63, 14, NULL, '{\"name\":\"kawsarahmmed\",\"email\":\"kawsarahmmed6959@gmail.com\",\"address\":null,\"country\":null,\"city\":null,\"postal_code\":null,\"phone\":null}', 'cash', 'paid', 'cash', 1350.00, 0.00, '20200912-10231547', 1599906195, 1, 0, 0, 1, '2020-09-12 14:23:15', '2020-09-12 14:23:47'),
(65, 8, NULL, '{\"name\":\"Mr. Customer\",\"email\":\"customer@example.com\",\"address\":null,\"country\":null,\"city\":null,\"postal_code\":\"1234\",\"phone\":null}', 'cash', 'paid', 'cash', 52.50, 0.00, '20200912-10505468', 1599907854, 1, 0, 0, 1, '2020-09-12 14:50:54', '2020-09-12 14:51:07'),
(66, 8, NULL, '{\"name\":\"Mr. Customer\",\"email\":\"customer@example.com\",\"address\":null,\"country\":null,\"city\":null,\"postal_code\":\"1234\",\"phone\":null}', 'cash', 'paid', 'cash', 122000.00, 0.00, '20200912-10514113', 1599907901, 1, 0, 0, 1, '2020-09-12 14:51:41', '2020-09-12 14:52:01'),
(67, 18, NULL, '{\"name\":\"md ainal Hossain\",\"email\":\"nfc6600@gmail.com\",\"address\":\"abdul\",\"country\":\"Bangladesh\",\"city\":\"sirajganj\",\"postal_code\":\"6700\",\"phone\":\"01718570043\",\"checkout_type\":\"logged\"}', 'cash_on_delivery', 'paid', NULL, 100.00, 0.00, '20200912-15373253', 1599925052, 1, 0, 0, 1, '2020-09-12 19:37:32', '2020-09-13 23:08:58'),
(68, NULL, 571277, '{\"name\":null,\"email\":null,\"address\":null,\"country\":\"Afghanistan\",\"city\":null,\"postal_code\":null,\"phone\":null}', 'cash', 'paid', 'cash', 3083.00, 0.00, '20200918-09260938', 1600399569, 1, 0, 0, 1, '2020-09-18 13:26:09', '2020-09-18 13:26:37'),
(69, NULL, 562577, '{\"name\":\"Mohammad Farhad\",\"email\":\"test@gmail.com\",\"address\":\"test, reter\",\"country\":\"Bangladesh\",\"city\":\"Dhaka\",\"postal_code\":\"880\",\"phone\":\"0183995454\",\"checkout_type\":\"guest\"}', 'cash_on_delivery', 'unpaid', NULL, 16800.00, 0.00, '20210126-12153170', 1611641731, 0, 0, 0, 0, '2021-01-26 06:15:31', '2021-01-26 06:15:31'),
(70, NULL, 885561, '{\"name\":\"Mohammad Farhad\",\"email\":\"test@gmail.com\",\"address\":\"test, reter\",\"country\":\"Bangladesh\",\"city\":\"Dhaka\",\"postal_code\":\"880\",\"phone\":\"0183995454\",\"checkout_type\":\"guest\"}', 'cash_on_delivery', 'unpaid', NULL, 16800.00, 0.00, '20210126-12175055', 1611641870, 0, 0, 0, 0, '2021-01-26 06:17:50', '2021-01-26 06:17:51'),
(71, 12, NULL, '{\"name\":\"Youth Fire IT\",\"email\":\"admin@youthfireit.com\",\"address\":\"ffffcv\",\"country\":\"Bangladesh\",\"city\":\"dhaka\",\"postal_code\":\"1217\",\"phone\":\"1919946826\",\"checkout_type\":\"logged\"}', 'cash_on_delivery', 'unpaid', NULL, 16800.00, 0.00, '20210126-12264115', 1611642401, 0, 0, 0, 0, '2021-01-26 06:26:41', '2021-01-26 06:26:41'),
(72, 12, NULL, '{\"name\":\"Youth Fire IT\",\"email\":\"admin@youthfireit.com\",\"address\":\"ffffcv\",\"country\":\"Bangladesh\",\"city\":\"dhaka\",\"postal_code\":\"1217\",\"phone\":\"1919946826\",\"checkout_type\":\"logged\"}', 'cash_on_delivery', 'unpaid', NULL, 16800.00, 0.00, '20210126-12274226', 1611642462, 0, 0, 0, 0, '2021-01-26 06:27:42', '2021-01-26 06:27:42'),
(73, 12, NULL, '{\"name\":\"Youth Fire IT\",\"email\":\"admin@youthfireit.com\",\"address\":\"ffffcv\",\"country\":\"Bangladesh\",\"city\":\"dhaka\",\"postal_code\":\"1217\",\"phone\":\"1919946826\",\"checkout_type\":\"logged\"}', 'cash_on_delivery', 'unpaid', NULL, 16800.00, 0.00, '20210126-12291138', 1611642551, 0, 0, 0, 0, '2021-01-26 06:29:11', '2021-01-26 06:29:11'),
(74, 12, NULL, '{\"name\":\"Youth Fire IT\",\"email\":\"admin@youthfireit.com\",\"address\":\"dottobari\",\"country\":\"Bangladesh\",\"city\":\"sirajganj\",\"postal_code\":\"6700\",\"phone\":\"01718570043\",\"checkout_type\":\"logged\"}', 'cash_on_delivery', 'unpaid', NULL, 16800.00, 0.00, '20210126-12304086', 1611642640, 0, 0, 0, 0, '2021-01-26 06:30:40', '2021-01-26 06:30:40'),
(75, 12, NULL, '{\"name\":\"Youth Fire IT\",\"email\":\"admin@youthfireit.com\",\"address\":\"ffffcv\",\"country\":\"Bangladesh\",\"city\":\"dhaka\",\"postal_code\":\"1217\",\"phone\":\"1919946826\",\"checkout_type\":\"logged\"}', 'cash_on_delivery', 'unpaid', NULL, 16800.00, 0.00, '20210126-12325995', 1611642779, 0, 0, 0, 0, '2021-01-26 06:32:59', '2021-01-26 06:32:59'),
(76, 12, NULL, '{\"name\":\"Youth Fire IT\",\"email\":\"admin@youthfireit.com\",\"address\":\"ffffcv\",\"country\":\"Bangladesh\",\"city\":\"dhaka\",\"postal_code\":\"1217\",\"phone\":\"1919946826\",\"checkout_type\":\"logged\"}', 'cash_on_delivery', 'unpaid', NULL, NULL, 0.00, '20210126-12355920', 1611642959, 0, 0, 0, 0, '2021-01-26 06:35:59', '2021-01-26 06:35:59'),
(77, 12, NULL, '{\"name\":\"Youth Fire IT\",\"email\":\"admin@youthfireit.com\",\"address\":\"ffffcv\",\"country\":\"Bangladesh\",\"city\":\"dhaka\",\"postal_code\":\"1217\",\"phone\":\"1919946826\",\"checkout_type\":\"logged\"}', 'cash_on_delivery', 'unpaid', NULL, NULL, 0.00, '20210126-12371541', 1611643035, 0, 0, 0, 0, '2021-01-26 06:37:15', '2021-01-26 06:37:15'),
(78, 12, NULL, '{\"name\":\"Youth Fire IT\",\"email\":\"admin@youthfireit.com\",\"address\":\"ffffcv\",\"country\":\"Bangladesh\",\"city\":\"dhaka\",\"postal_code\":\"1217\",\"phone\":\"1919946826\",\"checkout_type\":\"logged\"}', 'cash_on_delivery', 'unpaid', NULL, NULL, 0.00, '20210126-12383660', 1611643116, 0, 0, 0, 0, '2021-01-26 06:38:36', '2021-01-26 06:38:36'),
(79, 12, NULL, '{\"name\":\"Youth Fire IT\",\"email\":\"admin@youthfireit.com\",\"address\":\"ffffcv\",\"country\":\"Bangladesh\",\"city\":\"dhaka\",\"postal_code\":\"1217\",\"phone\":\"1919946826\",\"checkout_type\":\"logged\"}', 'cash_on_delivery', 'unpaid', NULL, NULL, 0.00, '20210126-12391269', 1611643152, 0, 0, 0, 0, '2021-01-26 06:39:12', '2021-01-26 06:39:12'),
(80, 12, NULL, '{\"name\":\"Youth Fire IT\",\"email\":\"admin@youthfireit.com\",\"address\":\"ffffcv\",\"country\":\"Bangladesh\",\"city\":\"dhaka\",\"postal_code\":\"1217\",\"phone\":\"1919946826\",\"checkout_type\":\"logged\"}', 'cash_on_delivery', 'unpaid', NULL, 16800.00, 0.00, '20210126-12395830', 1611643198, 0, 0, 0, 0, '2021-01-26 06:39:58', '2021-01-26 06:39:58'),
(81, 12, NULL, '{\"name\":\"Youth Fire IT\",\"email\":\"admin@youthfireit.com\",\"address\":\"ffffcv\",\"country\":\"Bangladesh\",\"city\":\"dhaka\",\"postal_code\":\"1217\",\"phone\":\"1919946826\",\"checkout_type\":\"logged\"}', 'cash_on_delivery', 'unpaid', NULL, 16800.00, 0.00, '20210126-12413618', 1611643296, 0, 0, 0, 0, '2021-01-26 06:41:36', '2021-01-26 06:41:36'),
(82, 12, NULL, '{\"name\":\"Youth Fire IT\",\"email\":\"admin@youthfireit.com\",\"address\":\"ffffcv\",\"country\":\"Bangladesh\",\"city\":\"dhaka\",\"postal_code\":\"1217\",\"phone\":\"1919946826\",\"checkout_type\":\"logged\"}', 'cash_on_delivery', 'unpaid', NULL, 16800.00, 0.00, '20210126-12423692', 1611643356, 0, 0, 0, 0, '2021-01-26 06:42:36', '2021-01-26 06:42:37'),
(83, 12, NULL, '{\"name\":\"Youth Fire IT\",\"email\":\"admin@youthfireit.com\",\"address\":\"ffffcv\",\"country\":\"Bangladesh\",\"city\":\"dhaka\",\"postal_code\":\"1217\",\"phone\":\"1919946826\",\"checkout_type\":\"logged\"}', 'cash_on_delivery', 'unpaid', NULL, 16800.00, 0.00, '20210126-12441319', 1611643453, 0, 0, 0, 0, '2021-01-26 06:44:13', '2021-01-26 06:44:13'),
(84, 12, NULL, '{\"name\":\"Youth Fire IT\",\"email\":\"admin@youthfireit.com\",\"address\":\"ffffcv\",\"country\":\"Bangladesh\",\"city\":\"dhaka\",\"postal_code\":\"1217\",\"phone\":\"1919946826\",\"checkout_type\":\"logged\"}', 'cash_on_delivery', 'unpaid', NULL, 16800.00, 0.00, '20210126-12453759', 1611643537, 0, 0, 0, 0, '2021-01-26 06:45:37', '2021-01-26 06:45:37'),
(85, 12, NULL, '{\"name\":\"Youth Fire IT\",\"email\":\"admin@youthfireit.com\",\"address\":\"ffffcv\",\"country\":\"Bangladesh\",\"city\":\"dhaka\",\"postal_code\":\"1217\",\"phone\":\"1919946826\",\"checkout_type\":\"logged\"}', 'cash_on_delivery', 'unpaid', NULL, 16800.00, 0.00, '20210126-12460418', 1611643564, 0, 0, 0, 0, '2021-01-26 06:46:04', '2021-01-26 06:46:04'),
(86, 12, NULL, '{\"name\":\"Youth Fire IT\",\"email\":\"admin@youthfireit.com\",\"address\":\"ffffcv\",\"country\":\"Bangladesh\",\"city\":\"dhaka\",\"postal_code\":\"1217\",\"phone\":\"1919946826\",\"checkout_type\":\"logged\"}', 'cash_on_delivery', 'unpaid', NULL, 16800.00, 0.00, '20210126-12480571', 1611643685, 0, 0, 0, 0, '2021-01-26 06:48:05', '2021-01-26 06:48:06'),
(87, 12, NULL, '{\"name\":\"Youth Fire IT\",\"email\":\"admin@youthfireit.com\",\"address\":\"ffffcv\",\"country\":\"Bangladesh\",\"city\":\"dhaka\",\"postal_code\":\"1217\",\"phone\":\"1919946826\",\"checkout_type\":\"logged\"}', 'cash_on_delivery', 'unpaid', NULL, 16800.00, 0.00, '20210126-12482598', 1611643705, 0, 0, 0, 0, '2021-01-26 06:48:25', '2021-01-26 06:48:25'),
(88, 12, NULL, '{\"name\":\"Youth Fire IT\",\"email\":\"admin@youthfireit.com\",\"address\":\"ffffcv\",\"country\":\"Bangladesh\",\"city\":\"dhaka\",\"postal_code\":\"1217\",\"phone\":\"1919946826\",\"checkout_type\":\"logged\"}', 'cash_on_delivery', 'unpaid', NULL, 16800.00, 0.00, '20210126-12483789', 1611643717, 0, 0, 0, 0, '2021-01-26 06:48:37', '2021-01-26 06:48:37'),
(89, 12, NULL, '{\"name\":\"Youth Fire IT\",\"email\":\"admin@youthfireit.com\",\"address\":\"ffffcv\",\"country\":\"Bangladesh\",\"city\":\"dhaka\",\"postal_code\":\"1217\",\"phone\":\"1919946826\",\"checkout_type\":\"logged\"}', 'cash_on_delivery', 'unpaid', NULL, 4200.00, 0.00, '20210126-13212021', 1611645680, 0, 0, 0, 0, '2021-01-26 07:21:20', '2021-01-26 07:21:20'),
(90, 12, NULL, '{\"name\":\"Youth Fire IT\",\"email\":\"admin@youthfireit.com\",\"address\":\"ffffcv\",\"country\":\"Bangladesh\",\"city\":\"dhaka\",\"postal_code\":\"1217\",\"phone\":\"1919946826\",\"checkout_type\":\"logged\"}', 'cash_on_delivery', 'unpaid', NULL, 4200.00, 0.00, '20210126-13223946', 1611645759, 0, 0, 0, 0, '2021-01-26 07:22:39', '2021-01-26 07:22:39'),
(91, 36, NULL, '{\"name\":\"Mohammad Farhad\",\"email\":\"mohammadfarhad681@gmail.com\",\"address\":\"test\",\"country\":\"Bangladesh\",\"city\":\"Dhaka\",\"postal_code\":\"880\",\"phone\":\"0183995454\",\"checkout_type\":\"logged\"}', 'cash_on_delivery', 'unpaid', NULL, 820.00, 0.00, '20210126-15580367', 1611655083, 1, 0, 0, 0, '2021-01-26 09:58:03', '2021-01-26 09:58:45');

-- --------------------------------------------------------

--
-- Table structure for table `order_details`
--

DROP TABLE IF EXISTS `order_details`;
CREATE TABLE IF NOT EXISTS `order_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `seller_id` int(11) DEFAULT NULL,
  `product_id` int(11) NOT NULL,
  `variation` longtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `price` double(8,2) DEFAULT NULL,
  `tax` double(8,2) NOT NULL DEFAULT 0.00,
  `shipping_cost` double(8,2) NOT NULL DEFAULT 0.00,
  `quantity` int(11) DEFAULT NULL,
  `payment_status` varchar(10) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'unpaid',
  `delivery_status` varchar(20) COLLATE utf8_unicode_ci DEFAULT 'pending',
  `shipping_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `pickup_point_id` int(11) DEFAULT NULL,
  `product_referral_code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `views` int(11) DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=121 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `order_details`
--

INSERT INTO `order_details` (`id`, `order_id`, `seller_id`, `product_id`, `variation`, `price`, `tax`, `shipping_cost`, `quantity`, `payment_status`, `delivery_status`, `shipping_type`, `pickup_point_id`, `product_referral_code`, `created_at`, `updated_at`, `views`) VALUES
(5, 5, 12, 15, '', 122000.00, 0.00, 0.00, 1, 'paid', 'delivered', 'home_delivery', NULL, NULL, '2020-06-16 16:05:50', '2020-06-19 09:12:10', 1),
(6, 6, 12, 17, '', 160.00, 0.00, 0.00, 1, 'paid', 'delivered', 'home_delivery', NULL, NULL, '2020-06-17 18:48:18', '2020-06-17 20:40:09', 0),
(7, 7, 12, 17, '', 160.00, 0.00, 0.00, 1, 'paid', 'delivered', 'home_delivery', NULL, NULL, '2020-06-18 14:06:51', '2020-06-18 14:12:10', 0),
(8, 8, 12, 18, '', 240.02, 0.00, 0.00, 1, 'paid', 'delivered', 'home_delivery', NULL, NULL, '2020-06-22 12:46:47', '2020-06-30 10:16:30', 0),
(9, 9, 12, 20, '', 9500.00, 0.00, 0.00, 1, 'paid', 'delivered', 'home_delivery', NULL, NULL, '2020-07-11 08:05:12', '2020-07-11 13:57:12', 0),
(10, 10, 12, 26, NULL, 2200.00, 0.00, 0.00, 1, 'paid', 'pending', NULL, NULL, NULL, '2020-09-02 17:26:49', '2020-09-02 17:26:49', 0),
(11, 10, 12, 21, NULL, 8900.00, 0.00, 0.00, 1, 'paid', 'pending', NULL, NULL, NULL, '2020-09-02 17:26:49', '2020-09-02 17:26:49', 0),
(12, 10, 12, 20, NULL, 9500.00, 0.00, 0.00, 1, 'paid', 'pending', NULL, NULL, NULL, '2020-09-02 17:26:49', '2020-09-02 17:26:49', 0),
(13, 11, 12, 21, NULL, 8900.00, 0.00, 0.00, 1, 'paid', 'pending', NULL, NULL, NULL, '2020-09-02 17:30:50', '2020-09-02 17:30:50', 0),
(14, 11, 12, 17, NULL, 52.50, 0.00, 0.00, 1, 'paid', 'pending', NULL, NULL, NULL, '2020-09-02 17:30:50', '2020-09-02 17:30:50', 0),
(15, 11, 12, 25, NULL, 1350.00, 0.00, 0.00, 1, 'paid', 'pending', NULL, NULL, NULL, '2020-09-02 17:30:50', '2020-09-02 17:30:50', 0),
(16, 12, 12, 19, '', 34.00, 0.00, 0.00, 2, 'unpaid', 'pending', 'home_delivery', NULL, NULL, '2020-09-02 18:47:04', '2020-09-02 18:47:04', 0),
(17, 13, 12, 19, NULL, 340.00, 0.00, 0.00, 20, 'paid', 'pending', NULL, NULL, NULL, '2020-09-04 18:12:02', '2020-09-04 18:12:02', 0),
(18, 13, 12, 21, NULL, 8900.00, 0.00, 0.00, 1, 'paid', 'pending', NULL, NULL, NULL, '2020-09-04 18:12:02', '2020-09-04 18:12:02', 0),
(19, 14, 12, 19, NULL, 340.00, 0.00, 0.00, 20, 'paid', 'pending', NULL, NULL, NULL, '2020-09-04 18:12:03', '2020-09-04 18:12:03', 0),
(20, 14, 12, 21, NULL, 8900.00, 0.00, 0.00, 1, 'paid', 'pending', NULL, NULL, NULL, '2020-09-04 18:12:03', '2020-09-04 18:12:03', 0),
(21, 15, 12, 15, '', 122000.00, 0.00, 0.00, 1, 'unpaid', 'pending', 'home_delivery', NULL, NULL, '2020-09-04 18:29:53', '2020-09-04 18:29:53', 0),
(22, 16, 12, 15, NULL, 122000.00, 0.00, 0.00, 1, 'paid', 'pending', NULL, NULL, NULL, '2020-09-05 20:42:19', '2020-09-05 20:42:19', 0),
(23, 16, 12, 17, NULL, 52.50, 0.00, 0.00, 1, 'paid', 'pending', NULL, NULL, NULL, '2020-09-05 20:42:19', '2020-09-05 20:42:19', 0),
(24, 17, 12, 15, NULL, 122000.00, 0.00, 0.00, 1, 'paid', 'pending', NULL, NULL, NULL, '2020-09-05 20:42:21', '2020-09-05 20:42:21', 0),
(25, 17, 12, 17, NULL, 52.50, 0.00, 0.00, 1, 'paid', 'pending', NULL, NULL, NULL, '2020-09-05 20:42:21', '2020-09-05 20:42:21', 0),
(26, 18, 12, 15, NULL, 122000.00, 0.00, 0.00, 1, 'paid', 'on_delivery', NULL, NULL, NULL, '2020-09-05 20:44:13', '2020-09-08 12:33:39', 0),
(27, 18, 12, 20, NULL, 9500.00, 0.00, 0.00, 1, 'paid', 'on_delivery', NULL, NULL, NULL, '2020-09-05 20:44:13', '2020-09-08 12:33:39', 0),
(28, 19, 12, 20, NULL, 19000.00, 0.00, 0.00, 2, 'paid', 'pending', NULL, NULL, NULL, '2020-09-07 12:06:19', '2020-09-07 12:06:19', 0),
(29, 19, 12, 21, NULL, 8900.00, 0.00, 0.00, 1, 'paid', 'pending', NULL, NULL, NULL, '2020-09-07 12:06:19', '2020-09-07 12:06:19', 0),
(30, 20, 12, 20, NULL, 19000.00, 0.00, 0.00, 2, 'paid', 'delivered', NULL, NULL, NULL, '2020-09-07 12:06:21', '2020-09-09 07:35:46', 0),
(31, 20, 12, 21, NULL, 8900.00, 0.00, 0.00, 1, 'paid', 'delivered', NULL, NULL, NULL, '2020-09-07 12:06:21', '2020-09-09 07:35:46', 0),
(32, 21, 12, 20, NULL, 9500.00, 0.00, 0.00, 1, 'paid', 'delivered', NULL, NULL, NULL, '2020-09-07 12:06:57', '2020-09-09 07:34:03', 0),
(33, 21, 12, 21, NULL, 8900.00, 0.00, 0.00, 1, 'paid', 'delivered', NULL, NULL, NULL, '2020-09-07 12:06:57', '2020-09-09 07:34:03', 0),
(34, 22, 12, 20, NULL, 9500.00, 0.00, 0.00, 1, 'paid', 'delivered', NULL, NULL, NULL, '2020-09-07 12:06:57', '2020-09-09 07:36:00', 0),
(35, 22, 12, 21, NULL, 8900.00, 0.00, 0.00, 1, 'paid', 'delivered', NULL, NULL, NULL, '2020-09-07 12:06:57', '2020-09-09 07:36:00', 0),
(36, 23, 12, 20, NULL, 9500.00, 0.00, 0.00, 1, 'paid', 'delivered', NULL, NULL, NULL, '2020-09-07 20:38:29', '2020-09-09 07:33:43', 0),
(37, 23, 12, 18, NULL, 240.02, 0.00, 0.00, 1, 'paid', 'delivered', NULL, NULL, NULL, '2020-09-07 20:38:29', '2020-09-09 07:33:43', 0),
(38, 24, 12, 20, NULL, 9500.00, 0.00, 0.00, 1, 'paid', 'delivered', NULL, NULL, NULL, '2020-09-07 20:38:30', '2020-09-09 07:33:22', 0),
(39, 24, 12, 18, NULL, 240.02, 0.00, 0.00, 1, 'paid', 'delivered', NULL, NULL, NULL, '2020-09-07 20:38:30', '2020-09-09 07:33:22', 0),
(40, 25, 12, 20, NULL, 9500.00, 0.00, 0.00, 1, 'paid', 'pending', NULL, NULL, NULL, '2020-09-07 20:38:31', '2020-09-07 20:38:31', 0),
(41, 25, 12, 18, NULL, 240.02, 0.00, 0.00, 1, 'paid', 'pending', NULL, NULL, NULL, '2020-09-07 20:38:31', '2020-09-07 20:38:31', 0),
(42, 26, 12, 20, NULL, 9500.00, 0.00, 0.00, 1, 'paid', 'delivered', NULL, NULL, NULL, '2020-09-07 20:38:31', '2020-09-09 07:32:33', 0),
(43, 26, 12, 18, NULL, 240.02, 0.00, 0.00, 1, 'paid', 'delivered', NULL, NULL, NULL, '2020-09-07 20:38:31', '2020-09-09 07:32:33', 0),
(44, 27, 12, 20, NULL, 9500.00, 0.00, 0.00, 1, 'paid', 'pending', NULL, NULL, NULL, '2020-09-07 20:38:32', '2020-09-07 20:38:32', 0),
(45, 27, 12, 18, NULL, 240.02, 0.00, 0.00, 1, 'paid', 'pending', NULL, NULL, NULL, '2020-09-07 20:38:32', '2020-09-07 20:38:32', 0),
(46, 28, 12, 20, NULL, 9500.00, 0.00, 0.00, 1, 'paid', 'pending', NULL, NULL, NULL, '2020-09-08 11:32:51', '2020-09-08 11:32:51', 0),
(47, 28, 12, 21, NULL, 8900.00, 0.00, 0.00, 1, 'paid', 'pending', NULL, NULL, NULL, '2020-09-08 11:32:51', '2020-09-08 11:32:51', 0),
(48, 29, 12, 17, NULL, 52.50, 0.00, 0.00, 1, 'paid', 'delivered', NULL, NULL, NULL, '2020-09-08 12:34:36', '2020-09-09 07:31:43', 0),
(49, 30, 12, 25, NULL, 1350.00, 0.00, 0.00, 1, 'paid', 'delivered', NULL, NULL, NULL, '2020-09-08 12:35:15', '2020-09-09 07:31:25', 0),
(50, 31, 12, 17, NULL, 157.50, 0.00, 0.00, 3, 'paid', 'delivered', NULL, NULL, NULL, '2020-09-08 12:35:29', '2020-09-08 17:08:12', 0),
(51, 32, 12, 17, NULL, 157.50, 0.00, 0.00, 3, 'paid', 'delivered', NULL, NULL, NULL, '2020-09-08 17:10:27', '2020-09-09 07:31:00', 0),
(52, 32, 12, 20, NULL, 9500.00, 0.00, 0.00, 1, 'paid', 'delivered', NULL, NULL, NULL, '2020-09-08 17:10:27', '2020-09-09 07:31:00', 0),
(53, 33, 12, 17, NULL, 157.50, 0.00, 0.00, 3, 'paid', 'delivered', NULL, NULL, NULL, '2020-09-08 17:10:28', '2020-09-09 07:30:43', 0),
(54, 33, 12, 20, NULL, 9500.00, 0.00, 0.00, 1, 'paid', 'delivered', NULL, NULL, NULL, '2020-09-08 17:10:28', '2020-09-09 07:30:43', 0),
(55, 34, 12, 29, NULL, 4700.00, 0.00, 0.00, 2, 'paid', 'delivered', NULL, NULL, NULL, '2020-09-08 17:11:18', '2020-09-09 07:30:27', 0),
(56, 34, 12, 27, NULL, 3300.00, 0.00, 0.00, 1, 'paid', 'delivered', NULL, NULL, NULL, '2020-09-08 17:11:18', '2020-09-09 07:30:27', 0),
(57, 35, 12, 19, NULL, 34.00, 0.00, 0.00, 2, 'paid', 'pending', NULL, NULL, NULL, '2020-09-09 21:09:11', '2020-09-09 21:09:11', 0),
(58, 35, 12, 21, NULL, 17800.00, 0.00, 0.00, 2, 'paid', 'pending', NULL, NULL, NULL, '2020-09-09 21:09:11', '2020-09-09 21:09:11', 0),
(59, 35, 12, 27, NULL, 3300.00, 0.00, 0.00, 1, 'paid', 'pending', NULL, NULL, NULL, '2020-09-09 21:09:11', '2020-09-09 21:09:11', 0),
(60, 36, 12, 19, NULL, 34.00, 0.00, 0.00, 2, 'paid', 'on_delivery', NULL, NULL, NULL, '2020-09-09 21:09:12', '2020-09-10 08:17:25', 0),
(61, 36, 12, 21, NULL, 17800.00, 0.00, 0.00, 2, 'paid', 'on_delivery', NULL, NULL, NULL, '2020-09-09 21:09:12', '2020-09-10 08:17:25', 0),
(62, 36, 12, 27, NULL, 3300.00, 0.00, 0.00, 1, 'paid', 'on_delivery', NULL, NULL, NULL, '2020-09-09 21:09:12', '2020-09-10 08:17:25', 0),
(63, 37, 12, 21, NULL, 8900.00, 0.00, 0.00, 1, 'paid', 'pending', NULL, NULL, NULL, '2020-09-10 08:17:40', '2020-09-10 08:17:40', 0),
(64, 38, 12, 21, NULL, 8900.00, 0.00, 0.00, 1, 'paid', 'pending', NULL, NULL, NULL, '2020-09-10 08:17:41', '2020-09-10 08:17:41', 0),
(65, 39, 12, 17, NULL, 52.50, 0.00, 0.00, 1, 'paid', 'pending', NULL, NULL, NULL, '2020-09-10 08:20:46', '2020-09-10 08:20:46', 0),
(66, 40, 12, 17, NULL, 52.50, 0.00, 0.00, 1, 'paid', 'pending', NULL, NULL, NULL, '2020-09-10 08:20:47', '2020-09-10 08:20:47', 0),
(67, 41, 12, 15, NULL, 122000.00, 0.00, 0.00, 1, 'paid', 'pending', NULL, NULL, NULL, '2020-09-10 13:22:47', '2020-09-10 13:22:47', 0),
(68, 42, 12, 15, NULL, 122000.00, 0.00, 0.00, 1, 'paid', 'pending', NULL, NULL, NULL, '2020-09-10 13:22:48', '2020-09-10 13:22:48', 0),
(69, 43, 12, 15, NULL, 122000.00, 0.00, 0.00, 1, 'paid', 'pending', NULL, NULL, NULL, '2020-09-10 13:22:48', '2020-09-10 13:22:48', 0),
(70, 44, 12, 18, NULL, 240.02, 0.00, 0.00, 1, 'paid', 'pending', NULL, NULL, NULL, '2020-09-10 13:25:21', '2020-09-10 13:25:21', 0),
(71, 45, 12, 17, NULL, 52.50, 0.00, 0.00, 1, 'paid', 'pending', NULL, NULL, NULL, '2020-09-10 13:26:39', '2020-09-10 13:26:39', 0),
(72, 46, 12, 17, NULL, 52.50, 0.00, 0.00, 1, 'paid', 'pending', NULL, NULL, NULL, '2020-09-10 13:29:51', '2020-09-10 13:29:51', 0),
(73, 47, 12, 17, NULL, 52.50, 0.00, 0.00, 1, 'paid', 'pending', NULL, NULL, NULL, '2020-09-10 13:30:25', '2020-09-10 13:30:25', 0),
(74, 48, 12, 17, NULL, 52.50, 0.00, 0.00, 1, 'paid', 'pending', NULL, NULL, NULL, '2020-09-10 13:31:01', '2020-09-10 13:31:01', 0),
(75, 49, 12, 16, NULL, 700.00, 0.00, 0.00, 1, 'paid', 'pending', NULL, NULL, NULL, '2020-09-10 13:32:44', '2020-09-10 13:32:44', 0),
(76, 50, 12, 17, NULL, 52.50, 0.00, 0.00, 1, 'paid', 'pending', NULL, NULL, NULL, '2020-09-10 13:33:13', '2020-09-10 13:33:13', 0),
(77, 51, 12, 21, NULL, 8900.00, 0.00, 0.00, 1, 'paid', 'pending', NULL, NULL, NULL, '2020-09-10 14:17:21', '2020-09-10 14:17:21', 0),
(78, 52, 12, 21, NULL, 8900.00, 0.00, 0.00, 1, 'paid', 'pending', NULL, NULL, NULL, '2020-09-10 14:17:22', '2020-09-10 14:17:22', 0),
(79, 53, 12, 21, NULL, 8900.00, 0.00, 0.00, 1, 'paid', 'pending', NULL, NULL, NULL, '2020-09-10 14:17:22', '2020-09-10 14:17:22', 0),
(80, 54, 12, 21, NULL, 8900.00, 0.00, 0.00, 1, 'paid', 'pending', NULL, NULL, NULL, '2020-09-10 14:18:17', '2020-09-10 14:18:17', 0),
(81, 55, 12, 27, NULL, 3300.00, 0.00, 0.00, 1, 'paid', 'pending', NULL, NULL, NULL, '2020-09-10 18:05:25', '2020-09-10 18:05:25', 0),
(82, 56, 12, 27, NULL, 3300.00, 0.00, 0.00, 1, 'paid', 'pending', NULL, NULL, NULL, '2020-09-10 18:05:28', '2020-09-10 18:05:28', 0),
(83, 57, 12, 20, '', 9500.00, 0.00, 0.00, 1, 'paid', 'delivered', 'home_delivery', NULL, NULL, '2020-09-10 18:09:31', '2020-09-27 20:08:21', 0),
(84, 58, 12, 28, NULL, 3250.00, 0.00, 0.00, 1, 'paid', 'pending', NULL, NULL, NULL, '2020-09-10 19:35:34', '2020-09-10 19:35:34', 0),
(85, 59, 12, 28, NULL, 3250.00, 0.00, 0.00, 1, 'paid', 'pending', NULL, NULL, NULL, '2020-09-10 19:35:34', '2020-09-10 19:35:34', 0),
(86, 60, 12, 28, NULL, 3250.00, 0.00, 0.00, 1, 'paid', 'pending', NULL, NULL, NULL, '2020-09-10 19:35:34', '2020-09-10 19:35:34', 0),
(87, 61, 12, 19, NULL, 17.00, 0.00, 0.00, 1, 'paid', 'delivered', NULL, NULL, NULL, '2020-09-12 14:07:03', '2020-09-27 20:07:48', 0),
(88, 61, 12, 20, NULL, 9500.00, 0.00, 0.00, 1, 'paid', 'delivered', NULL, NULL, NULL, '2020-09-12 14:07:03', '2020-09-27 20:07:48', 0),
(89, 61, 12, 28, NULL, 3250.00, 0.00, 0.00, 1, 'paid', 'delivered', NULL, NULL, NULL, '2020-09-12 14:07:03', '2020-09-27 20:07:48', 0),
(90, 61, 12, 31, NULL, 15000.00, 0.00, 0.00, 1, 'paid', 'delivered', NULL, NULL, NULL, '2020-09-12 14:07:03', '2020-09-27 20:07:48', 0),
(91, 61, 12, 40, NULL, 1700.00, 0.00, 0.00, 100, 'paid', 'delivered', NULL, NULL, NULL, '2020-09-12 14:07:03', '2020-09-27 20:07:48', 0),
(92, 62, 12, 21, NULL, 8900.00, 0.00, 0.00, 1, 'paid', 'delivered', NULL, NULL, NULL, '2020-09-12 14:22:43', '2020-09-12 14:29:29', 0),
(93, 63, 12, 25, NULL, 1350.00, 0.00, 0.00, 1, 'paid', 'on_delivery', NULL, NULL, NULL, '2020-09-12 14:23:15', '2020-09-12 17:10:54', 0),
(95, 65, 12, 17, NULL, 52.50, 0.00, 0.00, 1, 'paid', 'on_delivery', NULL, NULL, NULL, '2020-09-12 14:50:54', '2020-09-12 17:10:34', 0),
(96, 66, 12, 15, NULL, 122000.00, 0.00, 0.00, 1, 'paid', 'delivered', NULL, NULL, NULL, '2020-09-12 14:51:41', '2020-09-12 14:52:08', 0),
(97, 67, 12, 44, '', 100.00, 0.00, 0.00, 2, 'paid', 'delivered', 'pickup_point', 0, NULL, '2020-09-12 19:37:32', '2020-09-13 23:08:58', 0),
(98, 68, 12, 41, NULL, 2250.00, 0.00, 0.00, 3, 'paid', 'delivered', NULL, NULL, NULL, '2020-09-18 13:26:09', '2020-09-22 20:34:28', 0),
(99, 68, 12, 40, NULL, 833.00, 0.00, 0.00, 49, 'paid', 'delivered', NULL, NULL, NULL, '2020-09-18 13:26:09', '2020-09-22 20:34:28', 0),
(100, 69, 12, 51, '', 16800.00, 0.00, 0.00, 4, 'unpaid', 'pending', 'home_delivery', NULL, NULL, '2021-01-26 06:15:31', '2021-01-26 06:15:31', 0),
(101, 70, 12, 51, '', 16800.00, 0.00, 0.00, 4, 'unpaid', 'pending', 'home_delivery', NULL, NULL, '2021-01-26 06:17:51', '2021-01-26 06:17:51', 0),
(102, 71, 12, 51, '', 16800.00, 0.00, 0.00, 4, 'unpaid', 'pending', 'home_delivery', NULL, NULL, '2021-01-26 06:26:41', '2021-01-26 06:26:41', 0),
(103, 72, 12, 51, '', 16800.00, 0.00, 0.00, 4, 'unpaid', 'pending', 'home_delivery', NULL, NULL, '2021-01-26 06:27:42', '2021-01-26 06:27:42', 0),
(104, 73, 12, 51, '', 16800.00, 0.00, 0.00, 4, 'unpaid', 'pending', 'home_delivery', NULL, NULL, '2021-01-26 06:29:11', '2021-01-26 06:29:11', 0),
(105, 74, 12, 51, '', 16800.00, 0.00, 0.00, 4, 'unpaid', 'pending', 'home_delivery', NULL, NULL, '2021-01-26 06:30:40', '2021-01-26 06:30:40', 0),
(106, 75, 12, 51, '', 16800.00, 0.00, 0.00, 4, 'unpaid', 'pending', 'home_delivery', NULL, NULL, '2021-01-26 06:32:59', '2021-01-26 06:32:59', 0),
(107, 78, 12, 51, '', 16800.00, 0.00, 0.00, 4, 'unpaid', 'pending', 'home_delivery', NULL, NULL, '2021-01-26 06:38:36', '2021-01-26 06:38:36', 0),
(108, 79, 12, 51, '', 16800.00, 0.00, 0.00, 4, 'unpaid', 'pending', 'home_delivery', NULL, NULL, '2021-01-26 06:39:12', '2021-01-26 06:39:12', 0),
(109, 80, 12, 51, '', 16800.00, 0.00, 0.00, 4, 'unpaid', 'pending', 'home_delivery', NULL, NULL, '2021-01-26 06:39:58', '2021-01-26 06:39:58', 0),
(110, 81, 12, 51, '', 16800.00, 0.00, 0.00, 4, 'unpaid', 'pending', 'home_delivery', NULL, NULL, '2021-01-26 06:41:36', '2021-01-26 06:41:36', 0),
(111, 82, 12, 51, '', 16800.00, 0.00, 0.00, 4, 'unpaid', 'pending', 'home_delivery', NULL, NULL, '2021-01-26 06:42:37', '2021-01-26 06:42:37', 0),
(112, 83, 12, 51, '', 16800.00, 0.00, 0.00, 4, 'unpaid', 'pending', 'home_delivery', NULL, NULL, '2021-01-26 06:44:13', '2021-01-26 06:44:13', 0),
(113, 84, 12, 51, '', 16800.00, 0.00, 0.00, 4, 'unpaid', 'pending', 'home_delivery', NULL, NULL, '2021-01-26 06:45:37', '2021-01-26 06:45:37', 0),
(114, 85, 12, 51, '', 16800.00, 0.00, 0.00, 4, 'unpaid', 'pending', 'home_delivery', NULL, NULL, '2021-01-26 06:46:04', '2021-01-26 06:46:04', 0),
(115, 86, 12, 51, '', 16800.00, 0.00, 0.00, 4, 'unpaid', 'pending', 'home_delivery', NULL, NULL, '2021-01-26 06:48:05', '2021-01-26 06:48:05', 0),
(116, 87, 12, 51, '', 16800.00, 0.00, 0.00, 4, 'unpaid', 'pending', 'home_delivery', NULL, NULL, '2021-01-26 06:48:25', '2021-01-26 06:48:25', 0),
(117, 88, 12, 51, '', 16800.00, 0.00, 0.00, 4, 'unpaid', 'pending', 'home_delivery', NULL, NULL, '2021-01-26 06:48:37', '2021-01-26 06:48:37', 0),
(118, 89, 12, 51, '', 4200.00, 0.00, 0.00, 1, 'unpaid', 'pending', 'home_delivery', NULL, NULL, '2021-01-26 07:21:20', '2021-01-26 07:21:20', 0),
(119, 90, 12, 51, '', 4200.00, 0.00, 0.00, 1, 'unpaid', 'pending', 'home_delivery', NULL, NULL, '2021-01-26 07:22:39', '2021-01-26 07:22:39', 0),
(120, 91, 36, 52, 'Aquamarine-46', 780.00, 40.00, 0.00, 2, 'unpaid', 'pending', 'home_delivery', NULL, NULL, '2021-01-26 09:58:03', '2021-01-26 09:58:03', 0);

-- --------------------------------------------------------

--
-- Table structure for table `pages`
--

DROP TABLE IF EXISTS `pages`;
CREATE TABLE IF NOT EXISTS `pages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `content` longtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `meta_title` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `meta_description` varchar(1000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `keywords` varchar(1000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `meta_image` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE IF NOT EXISTS `password_resets` (
  `email` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

DROP TABLE IF EXISTS `payments`;
CREATE TABLE IF NOT EXISTS `payments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `seller_id` int(11) NOT NULL,
  `amount` double(8,2) NOT NULL DEFAULT 0.00,
  `payment_details` longtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `payment_method` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `txn_code` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pickup_points`
--

DROP TABLE IF EXISTS `pickup_points`;
CREATE TABLE IF NOT EXISTS `pickup_points` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `staff_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `address` text NOT NULL,
  `phone` varchar(15) NOT NULL,
  `pick_up_status` int(1) DEFAULT NULL,
  `cash_on_pickup_status` int(1) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `policies`
--

DROP TABLE IF EXISTS `policies`;
CREATE TABLE IF NOT EXISTS `policies` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(35) COLLATE utf8_unicode_ci NOT NULL,
  `content` longtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `policies`
--

INSERT INTO `policies` (`id`, `name`, `content`, `created_at`, `updated_at`) VALUES
(1, 'support_policy', NULL, '2019-10-29 12:54:45', '2019-01-22 05:13:15'),
(2, 'return_policy', NULL, '2019-10-29 12:54:47', '2019-01-24 05:40:11'),
(4, 'seller_policy', NULL, '2019-10-29 12:54:49', '2019-02-04 17:50:15'),
(5, 'terms', NULL, '2019-10-29 12:54:51', '2019-10-28 18:00:00'),
(6, 'privacy_policy', '<p class=\"MsoNormal\" style=\"margin: 0in 0in 10pt; line-height: 115%; font-size: 11pt; font-family: Calibri, sans-serif; text-align: justify;\">\r\n\r\n\r\n    <strong><span style=\"font-size:24.0pt;\r\nfont-family:&quot;Arial&quot;,&quot;sans-serif&quot;;mso-fareast-font-family:&quot;Times New Roman&quot;;\r\ncolor:#333333;mso-font-kerning:18.0pt\">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; Privacy and Confidentiality</span></strong></p><p style=\"text-align: justify;\">\r\n\r\n</p><p class=\"MsoNormal\" style=\"text-indent: 0.5in; margin: 0in 0in 10pt; line-height: 115%; font-size: 11pt; font-family: Calibri, sans-serif; text-align: justify;\"><span style=\"font-size:9.0pt;font-family:&quot;Arial&quot;,&quot;sans-serif&quot;;\r\nmso-fareast-font-family:&quot;Times New Roman&quot;;color:#333333\">Welcome to the\r\nbazaarpratidin.com website<span style=\"mso-spacerun:yes\">&nbsp; </span>operated by Bazaar Pratidin &amp; jamuna computer We respect your privacy and want to protect your personal information. To learn more, please read this Privacy Policy.</span></p><p style=\"text-align: justify;\">\r\n\r\n</p><p class=\"MsoNormal\" style=\"margin: 0in 0in 10pt; line-height: 115%; font-size: 11pt; font-family: Calibri, sans-serif; text-align: justify;\"><span style=\"font-size:9.0pt;font-family:&quot;Arial&quot;,&quot;sans-serif&quot;;\r\nmso-fareast-font-family:&quot;Times New Roman&quot;;color:#333333\">This Privacy Policy\r\nexplains how we collect, use and (under certain conditions) disclose your\r\npersonal information. This Privacy Policy also explains the steps we have taken\r\nto secure your personal information. Finally, this Privacy Policy explains your\r\noptions regarding the collection, use and disclosure of your personal\r\ninformation. By visiting the Site directly or through another site, you accept\r\nthe practices described in this Policy.</span></p><p style=\"text-align: justify;\">\r\n\r\n</p><p class=\"MsoNormal\" style=\"margin: 0in 0in 10pt; line-height: 115%; font-size: 11pt; font-family: Calibri, sans-serif; text-align: justify;\"><span style=\"font-size:9.0pt;font-family:&quot;Arial&quot;,&quot;sans-serif&quot;;\r\nmso-fareast-font-family:&quot;Times New Roman&quot;;color:#333333\">Data protection is a\r\nmatter of trust and your privacy is important to us. We shall therefore only\r\nuse your name and other information which relates to you in the manner set out\r\nin this Privacy Policy. We will only collect information where it is necessary\r\nfor us to do so and we will only collect information if it is relevant to our\r\ndealings with you.</span></p><p style=\"text-align: justify;\">\r\n\r\n</p><p class=\"MsoNormal\" style=\"margin: 0in 0in 10pt; line-height: 115%; font-size: 11pt; font-family: Calibri, sans-serif; text-align: justify;\"><span style=\"font-size:9.0pt;font-family:&quot;Arial&quot;,&quot;sans-serif&quot;;\r\nmso-fareast-font-family:&quot;Times New Roman&quot;;color:#333333\">We will only keep your\r\ninformation for as long as we are either required to by law or as is relevant\r\nfor the purposes for which it was collected.</span></p><p style=\"text-align: justify;\">\r\n\r\n</p><p class=\"MsoNormal\" style=\"margin: 0in 0in 10pt; line-height: 115%; font-size: 11pt; font-family: Calibri, sans-serif; text-align: justify;\"><span style=\"font-size:9.0pt;font-family:&quot;Arial&quot;,&quot;sans-serif&quot;;\r\nmso-fareast-font-family:&quot;Times New Roman&quot;;color:#333333\">You can visit the Site\r\nand browse without having to provide personal details. During your visit to the\r\nSite you remain anonymous and at no time can we identify you unless you have an\r\naccount on the Site and log on with your user name and password.<br style=\"mso-special-character:line-break\">\r\n<br style=\"mso-special-character:line-break\">\r\n</span></p><p style=\"text-align: justify;\">\r\n\r\n</p><p class=\"MsoNormal\" style=\"margin: 0in 0in 10pt; line-height: 115%; font-family: Calibri, sans-serif; text-align: justify; font-size: 11pt;\"><span style=\"font-size: 12pt; font-family: Arial, sans-serif; color: rgb(51, 51, 51);\"><span style=\"font-size: 12pt;\">&nbsp;&nbsp;&nbsp;&nbsp; </span><span style=\"font-size: 12pt;\">&nbsp;</span></span><span style=\"font-family: Arial, sans-serif; color: rgb(51, 51, 51); font-size: 12pt;\"><strong style=\"\"><u>Data that we collect</u></strong></span></p><p style=\"text-align: justify;\">\r\n\r\n</p><p class=\"MsoNormal\" style=\"margin: 0in 0in 10pt; line-height: 115%; font-size: 11pt; font-family: Calibri, sans-serif; text-align: justify;\"><span style=\"font-size:9.0pt;font-family:&quot;Arial&quot;,&quot;sans-serif&quot;;\r\nmso-fareast-font-family:&quot;Times New Roman&quot;;color:#333333\">We may collect various\r\npieces of information if you seek to place an order for a product with us on\r\nthe Site.</span></p><p style=\"text-align: justify;\">\r\n\r\n</p><p class=\"MsoNormal\" style=\"margin: 0in 0in 10pt; line-height: 115%; font-size: 11pt; font-family: Calibri, sans-serif; text-align: justify;\"><span style=\"font-size:9.0pt;font-family:&quot;Arial&quot;,&quot;sans-serif&quot;;\r\nmso-fareast-font-family:&quot;Times New Roman&quot;;color:#333333\">We collect, store and\r\nprocess your data for processing your purchase on the Site and any possible\r\nlater claims, and to provide you with our services. We may collect personal\r\ninformation including, but not limited to, your title, name, gender, date of\r\nbirth, email address, postal address, delivery address (if different),\r\ntelephone number, mobile number, fax number, payment details, payment card\r\ndetails or bank account details.</span></p><p style=\"text-align: justify;\">\r\n\r\n</p><p class=\"MsoNormal\" style=\"margin: 0in 0in 10pt; line-height: 115%; font-size: 11pt; font-family: Calibri, sans-serif; text-align: justify;\"><span style=\"font-size:9.0pt;font-family:&quot;Arial&quot;,&quot;sans-serif&quot;;\r\nmso-fareast-font-family:&quot;Times New Roman&quot;;color:#333333\">We will use the\r\ninformation you provide to enable us to process your orders and to provide you\r\nwith the services and information offered through our website and which you\r\nrequest. Further, we will use the information you provide to administer your\r\naccount with us; verify and carry out financial transactions in relation to\r\npayments you make; audit the downloading of data from our website; improve the\r\nlayout and/or content of the pages of our website and customize them for users;\r\nidentify visitors on our website; carry out research on our users\'\r\ndemographics; send you information we think you may find useful or which you\r\nhave requested from us, including information about our products and services,\r\nprovided you have indicated that you have not objected to being contacted for\r\nthese purposes. Subject to obtaining your consent we may contact you by email\r\nwith details of other products and services. If you prefer not to receive any\r\nmarketing communications from us, you can opt out at any time.</span></p><p style=\"text-align: justify;\">\r\n\r\n</p><p class=\"MsoNormal\" style=\"margin: 0in 0in 10pt; line-height: 115%; font-size: 11pt; font-family: Calibri, sans-serif; text-align: justify;\"><span style=\"font-size:9.0pt;font-family:&quot;Arial&quot;,&quot;sans-serif&quot;;\r\nmso-fareast-font-family:&quot;Times New Roman&quot;;color:#333333\">We may pass your name\r\nand address on to a third party in order to make delivery of the product to you\r\n(for example to our courier or supplier). You must only submit to us the Site\r\ninformation which is accurate and not misleading and you must keep it up to\r\ndate and inform us of changes.</span></p><p style=\"text-align: justify;\">\r\n\r\n</p><p class=\"MsoNormal\" style=\"margin: 0in 0in 10pt; line-height: 115%; font-size: 11pt; font-family: Calibri, sans-serif; text-align: justify;\"><span style=\"font-size:9.0pt;font-family:&quot;Arial&quot;,&quot;sans-serif&quot;;\r\nmso-fareast-font-family:&quot;Times New Roman&quot;;color:#333333\">Your actual order\r\ndetails may be stored with us but for security reasons cannot be retrieved\r\ndirectly by us. However, you may access this information by logging into your\r\naccount on the Site. Here you can view the details of your orders that have\r\nbeen completed, those which are open and those which are shortly to be\r\ndispatched and administer your address details, bank details ( for refund\r\npurposes) and any newsletter to which you may have subscribed. You undertake to\r\ntreat the personal access data confidentially and not make it available to\r\nunauthorized third parties. We cannot assume any liability for misuse of\r\npasswords unless this misuse is our fault.</span></p><p style=\"text-align: justify;\">\r\n\r\n</p><p class=\"MsoNormal\" style=\"margin: 0in 0in 10pt; line-height: 115%; font-family: Calibri, sans-serif; text-align: justify; font-size: 11pt;\"><span style=\"font-family: Arial, sans-serif; color: rgb(51, 51, 51); font-size: 12pt;\"><span style=\"font-size: 12pt;\"><strong>&nbsp; &nbsp; &nbsp; &nbsp; </strong></span></span><span style=\"font-family: Arial, sans-serif; color: rgb(51, 51, 51); font-size: 12pt;\"><u style=\"\"><strong>Other uses of your\r\nPersonal Information</strong></u></span></p><p style=\"text-align: justify;\">\r\n\r\n</p><p class=\"MsoNormal\" style=\"margin: 0in 0in 10pt; line-height: 115%; font-size: 11pt; font-family: Calibri, sans-serif; text-align: justify;\"><span style=\"font-size:9.0pt;font-family:&quot;Arial&quot;,&quot;sans-serif&quot;;\r\nmso-fareast-font-family:&quot;Times New Roman&quot;;color:#333333\">We may use your\r\npersonal information for opinion and market research. Your details are\r\nanonymous and will only be used for statistical purposes. You can choose to opt\r\nout of this at any time. Any answers to surveys or opinion polls we may ask you\r\nto complete will not be forwarded on to third parties. Disclosing your email\r\naddress is only necessary if you would like to take part in competitions. We\r\nsave the answers to our surveys separately from your email address.</span></p><p style=\"text-align: justify;\">\r\n\r\n</p><p class=\"MsoNormal\" style=\"margin: 0in 0in 10pt; line-height: 115%; font-size: 11pt; font-family: Calibri, sans-serif; text-align: justify;\"><span style=\"font-size:9.0pt;font-family:&quot;Arial&quot;,&quot;sans-serif&quot;;\r\nmso-fareast-font-family:&quot;Times New Roman&quot;;color:#333333\">&nbsp;</span></p><p style=\"text-align: justify;\">\r\n\r\n</p><p class=\"MsoNormal\" style=\"margin: 0in 0in 10pt; line-height: 115%; font-size: 11pt; font-family: Calibri, sans-serif; text-align: justify;\"><span style=\"font-size:9.0pt;font-family:&quot;Arial&quot;,&quot;sans-serif&quot;;\r\nmso-fareast-font-family:&quot;Times New Roman&quot;;color:#333333\">We may also send you\r\nother information about us, the Site, our other websites, our products, sales\r\npromotions, our newsletters, anything relating to other companies in our group\r\nor our business partners. If you would prefer not to receive any of this\r\nadditional information as detailed in this paragraph (or any part of it) please\r\nclick the \'unsubscribe\' link in any email that we send to you. Within 7 working\r\ndays (days which are neither (i) a Sunday, nor (ii) a public holiday anywhere\r\nin Bangladesh) of receipt of your instruction we will cease to send you\r\ninformation as requested. If your instruction is unclear we will contact you\r\nfor clarification.</span></p><p style=\"text-align: justify;\">\r\n\r\n</p><p class=\"MsoNormal\" style=\"margin: 0in 0in 10pt; line-height: 115%; font-size: 11pt; font-family: Calibri, sans-serif; text-align: justify;\"><span style=\"font-size:9.0pt;font-family:&quot;Arial&quot;,&quot;sans-serif&quot;;\r\nmso-fareast-font-family:&quot;Times New Roman&quot;;color:#333333\">&nbsp;</span></p><p style=\"text-align: justify;\">\r\n\r\n</p><p class=\"MsoNormal\" style=\"margin: 0in 0in 10pt; line-height: 115%; font-size: 11pt; font-family: Calibri, sans-serif; text-align: justify;\"><span style=\"font-size:9.0pt;font-family:&quot;Arial&quot;,&quot;sans-serif&quot;;\r\nmso-fareast-font-family:&quot;Times New Roman&quot;;color:#333333\">We may further\r\nanonymize data about users of the Site generally and use it for various\r\npurposes, including ascertaining the general location of the users and usage of\r\ncertain aspects of the Site or a link contained in an email to those registered\r\nto receive them, and supplying that anonymized data to third parties such as\r\npublishers. However, that anonymized data will not be capable of identifying\r\nyou personally.<br style=\"mso-special-character:line-break\">\r\n<br style=\"mso-special-character:line-break\">\r\n</span></p><p style=\"text-align: justify;\">\r\n\r\n</p><p class=\"MsoNormal\" style=\"margin: 0in 0in 10pt; line-height: 115%; font-size: 11pt; font-family: Calibri, sans-serif; text-align: justify;\"><b><span style=\"font-size:12.0pt;\r\nfont-family:&quot;Arial&quot;,&quot;sans-serif&quot;;mso-fareast-font-family:&quot;Times New Roman&quot;;\r\ncolor:#333333\"><span style=\"mso-spacerun:yes\">&nbsp;&nbsp;&nbsp; </span>Competitions</span></b></p><p style=\"text-align: justify;\">\r\n\r\n</p><p class=\"MsoNormal\" style=\"margin: 0in 0in 10pt; line-height: 115%; font-size: 11pt; font-family: Calibri, sans-serif; text-align: justify;\"><span style=\"font-size:9.0pt;font-family:&quot;Arial&quot;,&quot;sans-serif&quot;;\r\nmso-fareast-font-family:&quot;Times New Roman&quot;;color:#333333\">For any competition we\r\nuse the data to notify winners and advertise our offers. You can find more\r\ndetails where applicable in our participation terms for the respective\r\ncompetition.<br style=\"mso-special-character:line-break\">\r\n<br style=\"mso-special-character:line-break\">\r\n</span></p><p style=\"text-align: justify;\">\r\n\r\n</p><p class=\"MsoNormal\" style=\"margin: 0in 0in 10pt; line-height: 115%; font-size: 11pt; font-family: Calibri, sans-serif; text-align: justify;\"><b><span style=\"font-size:12.0pt;\r\nfont-family:&quot;Arial&quot;,&quot;sans-serif&quot;;mso-fareast-font-family:&quot;Times New Roman&quot;;\r\ncolor:#333333\"><span style=\"mso-spacerun:yes\">&nbsp;&nbsp;&nbsp;&nbsp; </span>Third Parties and\r\nLinks</span></b></p><p style=\"text-align: justify;\">\r\n\r\n</p><p class=\"MsoNormal\" style=\"margin: 0in 0in 10pt; line-height: 115%; font-size: 11pt; font-family: Calibri, sans-serif; text-align: justify;\"><span style=\"font-size:9.0pt;font-family:&quot;Arial&quot;,&quot;sans-serif&quot;;\r\nmso-fareast-font-family:&quot;Times New Roman&quot;;color:#333333\">We may pass your\r\ndetails to other companies in our group. We may also pass your details to our\r\nagents and subcontractors to help us with any of our uses of your data set out\r\nin our Privacy Policy. For example, we may use third parties to assist us with\r\ndelivering products to you, to help us to collect payments from you, to analyze\r\ndata and to provide us with marketing or customer service assistance.</span></p><p style=\"text-align: justify;\">\r\n\r\n</p><p class=\"MsoNormal\" style=\"margin: 0in 0in 10pt; line-height: 115%; font-size: 11pt; font-family: Calibri, sans-serif; text-align: justify;\"><span style=\"font-size:9.0pt;font-family:&quot;Arial&quot;,&quot;sans-serif&quot;;\r\nmso-fareast-font-family:&quot;Times New Roman&quot;;color:#333333\">&nbsp;</span></p><p style=\"text-align: justify;\">\r\n\r\n</p><p class=\"MsoNormal\" style=\"margin: 0in 0in 10pt; line-height: 115%; font-size: 11pt; font-family: Calibri, sans-serif; text-align: justify;\"><span style=\"font-size:9.0pt;font-family:&quot;Arial&quot;,&quot;sans-serif&quot;;\r\nmso-fareast-font-family:&quot;Times New Roman&quot;;color:#333333\">We may exchange\r\ninformation with third parties for the purposes of fraud protection and credit\r\nrisk reduction. We may transfer our databases containing your personal\r\ninformation if we sell our business or part of it. Other than as set out in\r\nthis Privacy Policy, we shall NOT sell or disclose your personal data to third\r\nparties without obtaining your prior consent unless this is necessary for the\r\npurposes set out in this Privacy Policy or unless we are required to do so by\r\nlaw. The Site may contain advertising of third parties and links to other sites\r\nor frames of other sites. Please be aware that we are not responsible for the\r\nprivacy practices or content of those third parties or other sites, nor for any\r\nthird party to whom we transfer your data in accordance with our Privacy\r\nPolicy.</span></p><p style=\"text-align: justify;\">\r\n\r\n</p><p class=\"MsoNormal\" style=\"margin: 0in 0in 10pt; line-height: 115%; font-size: 11pt; font-family: Calibri, sans-serif; text-align: justify;\"><span style=\"font-size:9.0pt;font-family:&quot;Arial&quot;,&quot;sans-serif&quot;;\r\nmso-fareast-font-family:&quot;Times New Roman&quot;;color:#333333\"><br style=\"mso-special-character:\r\nline-break\">\r\n<br style=\"mso-special-character:line-break\">\r\n</span></p><p style=\"text-align: justify;\">\r\n\r\n</p><p class=\"MsoNormal\" style=\"margin: 0in 0in 10pt; line-height: 115%; font-size: 11pt; font-family: Calibri, sans-serif; text-align: justify;\"><b><span style=\"font-size:12.0pt;\r\nfont-family:&quot;Arial&quot;,&quot;sans-serif&quot;;mso-fareast-font-family:&quot;Times New Roman&quot;;\r\ncolor:#333333\"><span style=\"mso-spacerun:yes\">&nbsp;&nbsp;&nbsp; </span>Cookies</span></b></p><p style=\"text-align: justify;\">\r\n\r\n</p><p class=\"MsoNormal\" style=\"margin: 0in 0in 10pt; line-height: 115%; font-size: 11pt; font-family: Calibri, sans-serif; text-align: justify;\"><span style=\"font-size:9.0pt;font-family:&quot;Arial&quot;,&quot;sans-serif&quot;;\r\nmso-fareast-font-family:&quot;Times New Roman&quot;;color:#333333\">The acceptance of\r\ncookies is not a requirement for visiting the Site. However we would like to\r\npoint out that the use of the \'basket\' functionality on the Site and ordering\r\nis only possible with the activation of cookies. Cookies are tiny text files\r\nwhich identify your computer to our server as a unique user when you visit\r\ncertain pages on the Site and they are stored by your Internet browser on your\r\ncomputer\'s hard drive. Cookies can be used to recognize your Internet Protocol\r\naddress, saving you time while you are on, or want to enter, the Site. We only\r\nuse cookies for your convenience in using the Site (for example to remember who\r\nyou are when you want to amend your shopping cart without having to re-enter\r\nyour email address) and not for obtaining or using any other information about\r\nyou (for example targeted advertising). Your browser can be set to not accept\r\ncookies, but this would restrict your use of the Site. Please accept our\r\nassurance that our use of cookies does not contain any personal or private details\r\nand are free from viruses.</span></p><p style=\"text-align: justify;\">\r\n\r\n</p><p class=\"MsoNormal\" style=\"margin: 0in 0in 10pt; line-height: 115%; font-size: 11pt; font-family: Calibri, sans-serif; text-align: justify;\"><span style=\"font-size:9.0pt;font-family:&quot;Arial&quot;,&quot;sans-serif&quot;;\r\nmso-fareast-font-family:&quot;Times New Roman&quot;;color:#333333\">&nbsp;</span></p><p style=\"text-align: justify;\">\r\n\r\n</p><p class=\"MsoNormal\" style=\"margin: 0in 0in 10pt; line-height: 115%; font-size: 11pt; font-family: Calibri, sans-serif; text-align: justify;\"><span style=\"font-size:9.0pt;font-family:&quot;Arial&quot;,&quot;sans-serif&quot;;\r\nmso-fareast-font-family:&quot;Times New Roman&quot;;color:#333333\">This website uses\r\nGoogle Analytics, a web analytics service provided by Google, Inc.\r\n(\"Google\"). Google Analytics uses cookies, which are text files\r\nplaced on your computer, to help the website analyze how users use the site.\r\nThe information generated by the cookie about your use of the website\r\n(including your IP address) will be transmitted to and stored by Google on\r\nservers in the United States. Google will use this information for the purpose\r\nof evaluating your use of the website, compiling reports on website activity\r\nfor website operators and providing other services relating to website activity\r\nand internet usage. Google may also transfer this information to third parties\r\nwhere required to do so by law, or where such third parties process the\r\ninformation on Google\'s behalf. Google will not associate your IP address with\r\nany other data held by Google. You may refuse the use of cookies by selecting\r\nthe appropriate settings on your browser, however please note that if you do\r\nthis you may not be able to use the full functionality of this website. By\r\nusing this website, you consent to the processing of data about you by Google\r\nin the manner and for the purposes set out above.<br style=\"mso-special-character:\r\nline-break\">\r\n<br style=\"mso-special-character:line-break\">\r\n</span></p><p style=\"text-align: justify;\">\r\n\r\n</p><p class=\"MsoNormal\" style=\"margin: 0in 0in 10pt; line-height: 115%; font-size: 11pt; font-family: Calibri, sans-serif; text-align: justify;\"><b><span style=\"font-size:12.0pt;\r\nfont-family:&quot;Arial&quot;,&quot;sans-serif&quot;;mso-fareast-font-family:&quot;Times New Roman&quot;;\r\ncolor:#333333\"><span style=\"mso-spacerun:yes\">&nbsp;&nbsp; </span>Security</span></b></p><p style=\"text-align: justify;\">\r\n\r\n</p><p class=\"MsoNormal\" style=\"margin: 0in 0in 10pt; line-height: 115%; font-size: 11pt; font-family: Calibri, sans-serif; text-align: justify;\"><span style=\"font-size:9.0pt;font-family:&quot;Arial&quot;,&quot;sans-serif&quot;;\r\nmso-fareast-font-family:&quot;Times New Roman&quot;;color:#333333\">We have in place\r\nappropriate technical and security measures to prevent unauthorized or unlawful\r\naccess to or accidental loss of or destruction or damage to your information.\r\nWhen we collect data through the Site, we collect your personal details on a\r\nsecure server. We use firewalls on our servers. Our security procedures mean\r\nthat we may occasionally request proof of identity before we disclose personal\r\ninformation to you. You are responsible for protecting against unauthorized\r\naccess to your password and to your computer.<br style=\"mso-special-character:\r\nline-break\">\r\n<br style=\"mso-special-character:line-break\">\r\n</span></p><p style=\"text-align: justify;\">\r\n\r\n</p><p class=\"MsoNormal\" style=\"margin: 0in 0in 10pt; line-height: 115%; font-size: 11pt; font-family: Calibri, sans-serif; text-align: justify;\"><b><span style=\"font-size:12.0pt;\r\nfont-family:&quot;Arial&quot;,&quot;sans-serif&quot;;mso-fareast-font-family:&quot;Times New Roman&quot;;\r\ncolor:#333333\"><span style=\"mso-spacerun:yes\">&nbsp;&nbsp; </span>Your rights</span></b></p><p style=\"text-align: justify;\">\r\n\r\n</p><p class=\"MsoNormal\" style=\"margin: 0in 0in 10pt; line-height: 115%; font-size: 11pt; font-family: Calibri, sans-serif; text-align: justify;\"><span style=\"font-size:9.0pt;line-height:115%;font-family:\r\n&quot;Arial&quot;,&quot;sans-serif&quot;;mso-fareast-font-family:&quot;Times New Roman&quot;;color:#333333\">If\r\nyou are concerned about your data you have the right to request access to the\r\npersonal data which we may hold or process about you. You have the right to\r\nrequire us to correct any inaccuracies in your data free of charge. At any\r\nstage you also have the right to ask us to stop using your personal data for\r\ndirect marketing purposes.</span></p>', '2020-06-22 04:43:48', '2020-06-22 08:43:48');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
CREATE TABLE IF NOT EXISTS `products` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `added_by` varchar(6) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'admin',
  `user_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `subcategory_id` int(11) NOT NULL,
  `subsubcategory_id` int(11) DEFAULT NULL,
  `brand_id` int(11) DEFAULT NULL,
  `photos` varchar(2000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `thumbnail_img` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `featured_img` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `flash_deal_img` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `video_provider` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `video_link` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tags` mediumtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` longtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `unit_price` double(8,2) NOT NULL,
  `purchase_price` double(8,2) NOT NULL,
  `variant_product` int(1) NOT NULL DEFAULT 0,
  `attributes` varchar(1000) COLLATE utf8_unicode_ci NOT NULL DEFAULT '[]',
  `choice_options` mediumtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `colors` mediumtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `variations` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `todays_deal` int(11) NOT NULL DEFAULT 0,
  `published` int(11) NOT NULL DEFAULT 1,
  `featured` int(11) NOT NULL DEFAULT 0,
  `current_stock` int(10) NOT NULL DEFAULT 0,
  `unit` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `min_qty` int(11) NOT NULL DEFAULT 1,
  `discount` double(8,2) DEFAULT NULL,
  `discount_type` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tax` double(8,2) DEFAULT NULL,
  `tax_type` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `shipping_type` varchar(20) CHARACTER SET latin1 DEFAULT 'flat_rate',
  `shipping_cost` double(8,2) DEFAULT 0.00,
  `num_of_sale` int(11) NOT NULL DEFAULT 0,
  `meta_title` mediumtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `meta_description` longtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `meta_img` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `pdf` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `slug` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `earn_point` double(8,2) NOT NULL DEFAULT 0.00,
  `refundable` int(1) NOT NULL DEFAULT 0,
  `rating` double(8,2) NOT NULL DEFAULT 0.00,
  `barcode` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `digital` int(1) NOT NULL DEFAULT 0,
  `file_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `file_path` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=80 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `added_by`, `user_id`, `category_id`, `subcategory_id`, `subsubcategory_id`, `brand_id`, `photos`, `thumbnail_img`, `featured_img`, `flash_deal_img`, `video_provider`, `video_link`, `tags`, `description`, `unit_price`, `purchase_price`, `variant_product`, `attributes`, `choice_options`, `colors`, `variations`, `todays_deal`, `published`, `featured`, `current_stock`, `unit`, `min_qty`, `discount`, `discount_type`, `tax`, `tax_type`, `shipping_type`, `shipping_cost`, `num_of_sale`, `meta_title`, `meta_description`, `meta_img`, `pdf`, `slug`, `earn_point`, `refundable`, `rating`, `barcode`, `digital`, `file_name`, `file_path`, `created_at`, `updated_at`) VALUES
(15, 'JILONG KL-280G Fiber Splicer Machine with 5.7\" Color LCD', 'admin', 12, 4, 18, 37, 2, '[\"images/owl-carousel-topranking-img/owl-carousel-topranking-img1.webp\", \"images/owl-carousel-topranking-img/owl-carousel-topranking-img2.webp\", \"images/owl-carousel-topranking-img/owl-carousel-topranking-img3.webp\"]', 'uploads/products/thumbnail/Aukymn6t6aqbWjnzZ8n9cL9WxGZCAmnautbbRDDi.jpeg', 'uploads/products/featured/W3Rh5Bb3nxKPDvv8v8l7DO73ifvq9TcY451v5Kl3.jpeg', '', 'youtube', NULL, 'Fiber Splicer Machine', '&lt;span style=\"color: rgb(34, 34, 34); font-family: Raleway, HelveticaNeue, &amp;quot;Helvetica Neue&amp;quot;, Helvetica, Arial, sans-serif; font-size: 16.5px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration-style: initial; text-decoration-color: initial; display: inline !important; float: none;\"&gt;JiLong KL-280G fusion splicer machine has PAS technology, applicable fibers SM MM DS NZDS, fiber diameter - cladding diameter 80-150μm, coating diameter 100-1000μm, fiber count single - fiber cleaved length 8-16mm / coating diameter 250μm, actual average splice loss 0.02dB/SM / 0.01dBMM / 0.04dB/DS / 0.04dB/NZDS, typical splicing time typical 9 sec, return loss ＞60dB, splicing mode - auto / calibrate / normal / special, fiber aligning method - meticulous / core / clad / manual, splicing program 53 templet / 40 user, tube heating program 9 templet / 24 user, tube typical heating time 30 sec, protection sleeve length 60mm / 40mm, storage of splice result 4000 results - 20 parameter per result, fiber image magnification 300X / 150X, battery capacity typical 150 cycles, 5.7 inch TFT color LCD monitor, tension test 2N electrode life 2500, terminal USB and VGA, power supply AC 100-240V with AC adapter, inner li-battery 7800 mAh.&lt;/span&gt;', 122000.00, 109000.00, 0, '[]', '[]', '[]', NULL, 0, 1, 0, -7, '2', 1, 0.00, 'amount', 0.00, 'amount', 'flat_rate', 0.00, 900, NULL, NULL, NULL, NULL, 'JILONG-KL-280G-Fiber-Splicer-Machine-with-57-Color-LCD-ME1eS', 0.00, 1, 0.00, NULL, 0, NULL, NULL, '2020-06-16 15:18:57', '2020-09-12 14:51:41'),
(16, 'Unstitched Cotton Block Printed Salwar Kameez - Women Clothing', 'admin', 12, 1, 1, 1, 12, '[\"uploads\\/products\\/photos\\/kRpYbnwp2W21TO36wuohRpz7OhyXIA6UQiSgHWn7.jpeg\",\"uploads\\/products\\/photos\\/SfpJ8zMFSzlEPpvKhLMRKwVwUE0CnRseQXHKqqoW.jpeg\"]', 'uploads/products/thumbnail/4ik0urXPhMd4xXdOrQmzPxZUU1XQkyRhUjQNfOCd.jpeg', 'uploads/products/featured/4VctXpSrYBbTKbMh9hkVrhvIbOhjMgq70AhGGLaw.jpeg', 'uploads/products/flash_deal/mP3Fqp1o8tSYvxpf54cHIap3nL4LPDBExqzJ6F3g.jpeg', 'youtube', NULL, '', NULL, 700.00, 600.00, 0, '[]', '[]', '[]', NULL, 0, 1, 1, 0, '2', 1, 0.00, 'amount', 0.00, 'amount', 'flat_rate', 0.00, 1, NULL, NULL, NULL, NULL, 'Unstitched-Cotton-Block-Printed-Salwar-Kameez---Women-Clothing-FFfjY', 0.00, 1, 0.00, NULL, 0, NULL, NULL, '2020-06-16 18:00:56', '2020-09-10 13:32:44'),
(17, 'KN 95 Protective Mask', 'admin', 12, 7, 31, 44, 1, '[\"uploads\\/products\\/photos\\/f1dxJgLfyQnErU6hZWoZ5T85nyUyoWHRRwdzEncU.png\"]', 'uploads/products/thumbnail/Rw31kRwTGHWbbsGqyTPRVq1gyYvx8DCrGypBo6k4.png', 'uploads/products/featured/Cr9X2lVSvgIRCnKR0SKb4RtsB4bSsRAvsVIJYmii.png', 'images/1.png', 'youtube', NULL, 'COVID-19', NULL, 70.00, 30.00, 0, '[]', '[]', '[]', NULL, 0, 0, 0, 479, 'piec', 1, 25.00, 'percent', 0.00, 'amount', 'flat_rate', 0.00, 17, NULL, NULL, NULL, NULL, 'KN-95-Protective-Mask-4Ta4w', 0.00, 1, 0.00, NULL, 0, NULL, NULL, '2020-06-17 15:28:53', '2020-09-13 07:31:11'),
(18, 'KN 95 USA Quality', 'admin', 12, 7, 31, 44, 1, '[\"uploads\\/products\\/photos\\/OuT591HHTwIpX3yKr7OOxJimIQVj4Y1qvFl11hKm.png\"]', 'uploads/products/thumbnail/b4nN2yT2b6X5oeBvfi9ggOulJ0Du2aXcdFdoJQ1A.png', 'uploads/products/featured/4LumBUSTPuLPDo7L4AzfIHQcrQuGfiLS7lhUdLM7.png', 'uploads/products/flash_deal/DYhXW5eOeqCe715veQG2Rug21aKYKjTImzwFwD85.png', 'youtube', NULL, 'USA', NULL, 270.00, 190.00, 0, '[]', '[]', '[]', NULL, 0, 0, 0, 493, 'piece', 1, 29.98, 'amount', 0.00, 'amount', 'flat_rate', 0.00, 7, NULL, NULL, NULL, NULL, 'KN-95-USA-Quality-677Zs', 0.00, 1, 0.00, NULL, 0, NULL, NULL, '2020-06-17 15:35:14', '2020-09-13 07:31:06'),
(19, 'One time Face mask', 'admin', 12, 7, 31, 44, 1, '[\"uploads\\/products\\/photos\\/N2asT28bcdKtfiLSm6QOnW3eGMaeIdOz0WxzBVeq.png\"]', 'uploads/products/thumbnail/CI6y1nFBWVuvqkmsbN4ifT0SFFrr9wpSCWFDh01W.png', 'uploads/products/featured/llxvT3SR563vZvJDdvsfZ1hQFELzN0PIRNscfNiO.png', 'uploads/products/flash_deal/lRO6JQssWoWCwZYG7bPap63VqkVv5hRv5fj08Fd5.png', 'youtube', NULL, 'FM', NULL, 22.00, 11.00, 0, '[]', '[]', '[]', NULL, 0, 1, 1, 953, 'piece', 1, 5.00, 'amount', 0.00, 'amount', 'flat_rate', 0.00, 6, NULL, NULL, NULL, NULL, 'One-time-Face-mask-KqKWf', 0.00, 1, 0.00, NULL, 0, NULL, NULL, '2020-06-17 15:39:23', '2020-09-12 14:07:03'),
(20, 'Altai C1n Outdoor Super WiFi Long Range Wireless AP', 'admin', 12, 4, 18, NULL, 6, '[\"uploads\\/products\\/photos\\/FlSu061FDrGA0Um2GlrbQJZQVcFRWkbMmnaYi3Kn.png\"]', 'uploads/products/thumbnail/2EYt40PwdzwUdhYMp88twehBUK4YdQYNvYzlTEZS.png', 'uploads/products/featured/6nreKZF2xh67aPM7GZEbYYFKWoQE8FtHXUvYXPeM.png', 'uploads/products/flash_deal/VHN27W1bl8iM9rNBQY3X6JRbWGfXebsZaCd9vcQw.png', 'youtube', NULL, 'AlTai', '<div class=\"s-top\" style=\"margin-top: 0.5em; color: rgb(34, 34, 34); font-family: Raleway, HelveticaNeue, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; font-size: 16.5px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration-style: initial; text-decoration-color: initial;\"><b style=\"font-weight: bold;\">Description</b></div><div class=\"s-top\" style=\"margin-top: 0.5em; color: rgb(34, 34, 34); font-family: Raleway, HelveticaNeue, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; font-size: 16.5px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration-style: initial; text-decoration-color: initial;\"><p style=\"margin-top: 0px; margin-bottom: 0.5em; line-height: 2em;\">Altai C1n super wifi wireless AP has long range wifi, 2.4 GHz wireless frequency, 802.11b/g/n wireless feature, up to 250-500m coverage, 255 client, 16 SSID, PPPoE supported, IP65 compliant, bandwidth control per VAP / client.</p></div><div class=\"s-bottom\" style=\"margin-bottom: 0.5em; color: rgb(34, 34, 34); font-family: Raleway, HelveticaNeue, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; font-size: 16.5px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration-style: initial; text-decoration-color: initial;\"><b style=\"font-weight: bold;\">Product Warranty</b></div><p style=\"margin-top: 0px; margin-bottom: 0.5em; line-height: 2em; color: rgb(34, 34, 34); font-family: Raleway, HelveticaNeue, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; font-size: 16.5px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration-style: initial; text-decoration-color: initial;\">This product wireless access point comes with 1 year warranty.</p><br>', 13000.00, 8200.00, 0, '[]', '[]', '[]', NULL, 0, 1, 1, 98, 'piece', 1, 3500.00, 'amount', 0.00, 'amount', 'flat_rate', 0.00, 17, NULL, NULL, NULL, NULL, 'Altai-C1n-Outdoor-Super-WiFi-Long-Range-Wireless-AP-YjxpY', 0.00, 1, 0.00, NULL, 0, NULL, NULL, '2020-06-18 11:08:29', '2020-09-12 14:07:03'),
(21, 'Pentanik Basic 32 inch LED TV', 'admin', 12, 6, 32, 46, 14, '[\"uploads\\/products\\/photos\\/Kbgmu9HJ4v2ifjeuFTTIqkIlbqmUoTTuWOyI07dT.png\"]', 'uploads/products/thumbnail/6f83tCm7AVNCmmVc4MM1fHI6Ln3m7ZNIbDHfdJSu.png', 'uploads/products/featured/Q5ALb3XzoJPp4hoc43AtgRjAZdfQ6PCWrl17ewiP.png', 'uploads/products/flash_deal/1SnormXalgvYpNl1qz7xq8XsEENL5GyOQuCQ6SU5.png', 'youtube', NULL, '32 inch led tv, 32 inch TV, Basic LED TV, China LED TV, LED TV', NULL, 13000.00, 8000.00, 0, '[]', '[]', '[]', NULL, 1, 1, 1, -10, 'piece', 1, 4100.00, 'amount', 0.00, 'amount', 'flat_rate', 0.00, 18, NULL, NULL, NULL, NULL, 'Pentanik-Basic-32-inch-LED-TV-d6FeN', 0.00, 1, 0.00, NULL, 0, NULL, NULL, '2020-06-18 20:34:09', '2020-09-12 14:22:43'),
(22, 'Pentanik 39 inch Basic LED TV', 'admin', 12, 6, 32, 46, 14, '[\"uploads\\/products\\/photos\\/3qabIY5sNySzb1YxKSsEWqL9T5hbvHHRDUQ0SQLH.png\"]', 'uploads/products/thumbnail/YvFpgFcfd4QEZYxEr0Uokqwrav57E00Isae1b5cV.png', 'uploads/products/featured/cqngj8KcdgAYcF0WBRl7FexKanFOF74fXJlx0ikL.png', 'uploads/products/flash_deal/taRgsk4fXZMe6ey2XK9OubHKNtGqg1vIs3KMmXSp.png', 'youtube', NULL, '39 inch, 39 inch led tv, Basic LED TV, China LED TV, LED TV', '<h4 style=\"box-sizing: border-box; margin: 0px 0px 20px; padding: 0px; border: 0px; outline: 0px; font-variant-ligatures: normal; font-variant-caps: normal; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; line-height: 1.4; vertical-align: baseline; font-family: &quot;Open Sans&quot;, sans-serif; font-size: 17px; font-style: normal; font-weight: 600; color: rgb(51, 51, 51); letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-style: initial; text-decoration-color: initial;\">Warranty policy :</h4><table class=\"table table-striped-odd specification\" width=\"400\" style=\"box-sizing: border-box; margin: 0px 0px 2.618em; padding: 0px; border: 0px; outline: 0px; font-variant-ligatures: normal; font-variant-caps: normal; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; line-height: inherit; vertical-align: baseline; font-family: &quot;Open Sans&quot;, sans-serif; font-size: 14px; font-style: normal; font-weight: 400; border-collapse: collapse; border-spacing: 0px; width: 648px; color: rgb(73, 73, 73); letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-style: initial; text-decoration-color: initial; height: 80px;\"><tbody style=\"box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; outline: 0px; font-variant: inherit; font-stretch: inherit; line-height: inherit; vertical-align: baseline; font-family: inherit; font-size: 14px; font-style: inherit; font-weight: inherit;\"><tr style=\"box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; outline: 0px; font-variant: inherit; font-stretch: inherit; line-height: inherit; vertical-align: baseline; font-family: inherit; font-size: 14px; font-style: inherit; font-weight: inherit;\"><td class=\"display-name\" colspan=\"1\" rowspan=\"1\" style=\"box-sizing: border-box; margin: 0px; padding: 10px 10px 10px 0px; border-width: 0px 0px 1px; border-top-style: initial; border-right-style: initial; border-bottom-style: solid; border-left-style: initial; border-top-color: initial; border-right-color: initial; border-bottom-color: rgb(233, 233, 233); border-left-color: initial; border-image: initial; outline: 0px; font-variant: inherit; font-stretch: inherit; line-height: inherit; vertical-align: top; font-family: inherit; font-size: 14px; font-style: inherit; font-weight: 400; text-align: left;\"><span style=\"box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; outline: 0px; font-variant: inherit; font-stretch: inherit; line-height: inherit; vertical-align: baseline; font-family: inherit; font-size: 14px; font-style: inherit; font-weight: inherit; color: rgb(255, 102, 0);\"><strong style=\"box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; outline: 0px; font-variant: inherit; font-stretch: inherit; line-height: inherit; vertical-align: baseline; font-family: inherit; font-size: 14px; font-style: inherit; font-weight: 600; color: rgb(255, 102, 0);\">☑&nbsp;&nbsp;</strong><span style=\"box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; outline: 0px; font-variant: inherit; font-stretch: inherit; line-height: inherit; vertical-align: baseline; font-family: inherit; font-size: 14px; font-style: inherit; font-weight: inherit; color: rgb(255, 102, 0);\"><b style=\"box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; outline: 0px; font-variant: inherit; font-stretch: inherit; line-height: inherit; vertical-align: baseline; font-family: inherit; font-size: 14px; font-style: inherit; font-weight: 600;\">Replacement</b></span><b style=\"box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; outline: 0px; font-variant: inherit; font-stretch: inherit; line-height: inherit; vertical-align: baseline; font-family: inherit; font-size: 14px; font-style: inherit; font-weight: 600; color: rgb(255, 102, 0);\"><span>&nbsp;</span></b><strong style=\"box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; outline: 0px; font-variant: inherit; font-stretch: inherit; line-height: inherit; vertical-align: baseline; font-family: inherit; font-size: inherit; font-style: inherit; font-weight: 600; color: rgb(255, 102, 0);\">Guarantee</strong><strong style=\"box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; outline: 0px; font-variant: inherit; font-stretch: inherit; line-height: inherit; vertical-align: baseline; font-family: inherit; font-size: 14px; font-style: inherit; font-weight: 600; color: rgb(255, 102, 0);\"><br style=\"box-sizing: border-box;\"></strong></span></td><td colspan=\"1\" rowspan=\"1\" style=\"box-sizing: border-box; margin: 0px; padding: 10px 0px 10px 10px; border-width: 0px 0px 1px; border-top-style: initial; border-right-style: initial; border-bottom-style: solid; border-left-style: initial; border-top-color: initial; border-right-color: initial; border-bottom-color: rgb(233, 233, 233); border-left-color: initial; border-image: initial; outline: 0px; font-variant: inherit; font-stretch: inherit; line-height: inherit; vertical-align: top; font-family: inherit; font-size: 14px; font-style: inherit; font-weight: 400; text-align: left;\">1 Year</td></tr><tr style=\"box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; outline: 0px; font-variant: inherit; font-stretch: inherit; line-height: inherit; vertical-align: baseline; font-family: inherit; font-size: 14px; font-style: inherit; font-weight: inherit;\"><td class=\"display-name\" colspan=\"1\" rowspan=\"1\" style=\"box-sizing: border-box; margin: 0px; padding: 10px 10px 10px 0px; border-width: 0px 0px 1px; border-top-style: initial; border-right-style: initial; border-bottom-style: solid; border-left-style: initial; border-top-color: initial; border-right-color: initial; border-bottom-color: rgb(233, 233, 233); border-left-color: initial; border-image: initial; outline: 0px; font-variant: inherit; font-stretch: inherit; line-height: inherit; vertical-align: top; font-family: inherit; font-size: 14px; font-style: inherit; font-weight: 400; text-align: left;\"><span style=\"box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; outline: 0px; font-variant: inherit; font-stretch: inherit; line-height: inherit; vertical-align: baseline; font-family: inherit; font-size: 14px; font-style: inherit; font-weight: inherit; color: rgb(51, 204, 204);\"><strong style=\"box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; outline: 0px; font-variant: inherit; font-stretch: inherit; line-height: inherit; vertical-align: baseline; font-family: inherit; font-size: 14px; font-style: inherit; font-weight: 600;\">⚒&nbsp; Service Warranty&nbsp;</strong></span></td><td colspan=\"1\" rowspan=\"1\" style=\"box-sizing: border-box; margin: 0px; padding: 10px 0px 10px 10px; border-width: 0px 0px 1px; border-top-style: initial; border-right-style: initial; border-bottom-style: solid; border-left-style: initial; border-top-color: initial; border-right-color: initial; border-bottom-color: rgb(233, 233, 233); border-left-color: initial; border-image: initial; outline: 0px; font-variant: inherit; font-stretch: inherit; line-height: inherit; vertical-align: top; font-family: inherit; font-size: 14px; font-style: inherit; font-weight: 400; text-align: left;\">10 year’s</td></tr></tbody></table><p style=\"box-sizing: border-box; margin: 0px 0px 20px; padding: 0px; border: 0px; outline: 0px; font-variant-ligatures: normal; font-variant-caps: normal; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; line-height: inherit; vertical-align: baseline; font-family: &quot;Open Sans&quot;, sans-serif; font-size: 14px; font-style: normal; font-weight: 400; color: rgb(73, 73, 73); letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-style: initial; text-decoration-color: initial;\">Delivery &amp; Payment Policy:</p><ul style=\"box-sizing: border-box; margin: 20px 0px 0px 20px; padding: 0px; border: 0px; outline: 0px; font-variant-ligatures: normal; font-variant-caps: normal; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; line-height: inherit; vertical-align: baseline; font-family: &quot;Open Sans&quot;, sans-serif; font-size: 14px; font-style: normal; font-weight: 400; list-style: disc; color: rgb(73, 73, 73); letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-style: initial; text-decoration-color: initial;\"><li style=\"box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; outline: 0px; font-variant: inherit; font-stretch: inherit; line-height: inherit; vertical-align: baseline; font-family: inherit; font-size: 14px; font-style: inherit; font-weight: inherit;\"><strong style=\"box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; outline: 0px; font-variant: inherit; font-stretch: inherit; line-height: inherit; vertical-align: baseline; font-family: inherit; font-size: 14px; font-style: inherit; font-weight: 600;\"><span style=\"box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; outline: 0px; font-variant: inherit; font-stretch: inherit; line-height: inherit; vertical-align: baseline; font-family: inherit; font-size: 14px; font-style: inherit; font-weight: inherit; color: rgb(51, 102, 255);\">EMI</span><span>&nbsp;</span>System Available</strong></li><li style=\"box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; outline: 0px; font-variant: inherit; font-stretch: inherit; line-height: inherit; vertical-align: baseline; font-family: inherit; font-size: 14px; font-style: inherit; font-weight: inherit;\"><strong style=\"box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; outline: 0px; font-variant: inherit; font-stretch: inherit; line-height: inherit; vertical-align: baseline; font-family: inherit; font-size: 14px; font-style: inherit; font-weight: 600;\">Cash On Home Delivery ( Dhaka City…Charge Applied )</strong></li><li style=\"box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; outline: 0px; font-variant: inherit; font-stretch: inherit; line-height: inherit; vertical-align: baseline; font-family: inherit; font-size: 14px; font-style: inherit; font-weight: inherit;\"><strong style=\"box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; outline: 0px; font-variant: inherit; font-stretch: inherit; line-height: inherit; vertical-align: baseline; font-family: inherit; font-size: 14px; font-style: inherit; font-weight: 600;\">Courier Delivery to all over Bangladesh. Charge Applied .</strong></li></ul><h1 style=\"box-sizing: border-box; margin: 0px 0px 20px; padding: 0px; border: 0px; outline: 0px; font-variant-ligatures: normal; font-variant-caps: normal; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; line-height: 1.4; vertical-align: baseline; font-family: &quot;Open Sans&quot;, sans-serif; font-size: 23px; font-style: normal; font-weight: 600; color: rgb(51, 51, 51); letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-style: initial; text-decoration-color: initial;\">Pentanik&nbsp; 39 inch Basic LED TV</h1><h2 style=\"box-sizing: border-box; margin: 0px 0px 20px; padding: 0px; border: 0px; outline: 0px; font-variant-ligatures: normal; font-variant-caps: normal; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; line-height: 1.4; vertical-align: baseline; font-family: &quot;Open Sans&quot;, sans-serif; font-size: 20px; font-style: normal; font-weight: 600; color: rgb(51, 51, 51); letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-style: initial; text-decoration-color: initial;\">Features:</h2><ul style=\"box-sizing: border-box; margin: 20px 0px 0px 20px; padding: 0px; border: 0px; outline: 0px; font-variant-ligatures: normal; font-variant-caps: normal; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; line-height: inherit; vertical-align: baseline; font-family: &quot;Open Sans&quot;, sans-serif; font-size: 14px; font-style: normal; font-weight: 400; list-style: disc; color: rgb(73, 73, 73); letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-style: initial; text-decoration-color: initial;\"><li style=\"box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; outline: 0px; font-variant: inherit; font-stretch: inherit; line-height: inherit; vertical-align: baseline; font-family: inherit; font-size: 14px; font-style: inherit; font-weight: inherit;\">Brand Name: Pentanik</li><li style=\"box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; outline: 0px; font-variant: inherit; font-stretch: inherit; line-height: inherit; vertical-align: baseline; font-family: inherit; font-size: 14px; font-style: inherit; font-weight: inherit;\">Screen Size:&nbsp; 39 Inch (Black)</li><li style=\"box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; outline: 0px; font-variant: inherit; font-stretch: inherit; line-height: inherit; vertical-align: baseline; font-family: inherit; font-size: 14px; font-style: inherit; font-weight: inherit;\">Display Technology:&nbsp; LED</li><li style=\"box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; outline: 0px; font-variant: inherit; font-stretch: inherit; line-height: inherit; vertical-align: baseline; font-family: inherit; font-size: 14px; font-style: inherit; font-weight: inherit;\">Display Resolution Maximum: 720p</li><li style=\"box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; outline: 0px; font-variant: inherit; font-stretch: inherit; line-height: inherit; vertical-align: baseline; font-family: inherit; font-size: 14px; font-style: inherit; font-weight: inherit;\">Number of HDMI Ports:&nbsp; 1</li><li style=\"box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; outline: 0px; font-variant: inherit; font-stretch: inherit; line-height: inherit; vertical-align: baseline; font-family: inherit; font-size: 14px; font-style: inherit; font-weight: inherit;\">Total USB Ports: 1</li><li style=\"box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; outline: 0px; font-variant: inherit; font-stretch: inherit; line-height: inherit; vertical-align: baseline; font-family: inherit; font-size: 14px; font-style: inherit; font-weight: inherit;\">Total VGA Ports: 1</li><li style=\"box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; outline: 0px; font-variant: inherit; font-stretch: inherit; line-height: inherit; vertical-align: baseline; font-family: inherit; font-size: 14px; font-style: inherit; font-weight: inherit;\">Language:&nbsp; English</li><li style=\"box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; outline: 0px; font-variant: inherit; font-stretch: inherit; line-height: inherit; vertical-align: baseline; font-family: inherit; font-size: 14px; font-style: inherit; font-weight: inherit;\">Includes Remote:&nbsp; Yes</li></ul><p style=\"box-sizing: border-box; margin: 0px 0px 20px; padding: 0px; border: 0px; outline: 0px; font-variant-ligatures: normal; font-variant-caps: normal; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; line-height: inherit; vertical-align: baseline; font-family: &quot;Open Sans&quot;, sans-serif; font-size: 14px; font-style: normal; font-weight: 400; color: rgb(73, 73, 73); letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-style: initial; text-decoration-color: initial;\">It’s so important to have the right home Electronics Item , whether they are large or small, they help you satisfy the different needs we have around the house as well as making life so much more comfortable for us. Top of the<span>&nbsp;</span><a href=\"https://ponnobd.com/home-appliances/\" target=\"_blank\" rel=\"noopener\" title=\"- Pentanik 39 inch Basic LED TV\" style=\"box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; outline: 0px; font-variant: inherit; font-stretch: inherit; line-height: inherit; vertical-align: baseline; font-family: inherit; font-size: 14px; font-style: inherit; font-weight: inherit; background-color: transparent; color: rgb(20, 20, 20); text-decoration: none; transition: all 0.3s ease 0s;\"><strong style=\"box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; outline: 0px; font-variant: inherit; font-stretch: inherit; line-height: inherit; vertical-align: baseline; font-family: inherit; font-size: 14px; font-style: inherit; font-weight: 600;\">HOME</strong>&nbsp;<strong style=\"box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; outline: 0px; font-variant: inherit; font-stretch: inherit; line-height: inherit; vertical-align: baseline; font-family: inherit; font-size: 14px; font-style: inherit; font-weight: 600;\">APPLIANCES</strong></a>&nbsp;so important to us are&nbsp;<strong style=\"box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; outline: 0px; font-variant: inherit; font-stretch: inherit; line-height: inherit; vertical-align: baseline; font-family: inherit; font-size: 14px; font-style: inherit; font-weight: 600;\">TELEVISIONS,&nbsp;</strong>and here on Pentanik, we have a wide variety to suit your different needs and budgets.</p><p style=\"box-sizing: border-box; margin: 0px 0px 20px; padding: 0px; border: 0px; outline: 0px; font-variant-ligatures: normal; font-variant-caps: normal; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; line-height: inherit; vertical-align: baseline; font-family: &quot;Open Sans&quot;, sans-serif; font-size: 14px; font-style: normal; font-weight: 400; color: rgb(73, 73, 73); letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-style: initial; text-decoration-color: initial;\">After a long day at work, sitting in front of the television and watching your favorite program is a common way to end your day. Our selection of Pentanik televisions is sure to give you the comfort and relaxation you need. Buy the Pentanik<span>&nbsp;</span><a href=\"https://pentanik.com/basic-led-tv/pentanik-basic-39-inch-led-tv/\" title=\"- Pentanik 39 inch Basic LED TV\" style=\"box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; outline: 0px; font-variant: inherit; font-stretch: inherit; line-height: inherit; vertical-align: baseline; font-family: inherit; font-size: 14px; font-style: inherit; font-weight: inherit; background-color: transparent; color: rgb(20, 20, 20); text-decoration: none; transition: all 0.3s ease 0s;\">39 inch Basic</a>&nbsp; LED TV&nbsp; on Pentanik Authorized<span>&nbsp;</span><a href=\"https://ponnobd.com/pentanik-tv/\" target=\"_blank\" rel=\"noopener\" title=\"- Pentanik 39 inch Basic LED TV\" style=\"box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; outline: 0px; font-variant: inherit; font-stretch: inherit; line-height: inherit; vertical-align: baseline; font-family: inherit; font-size: 14px; font-style: inherit; font-weight: inherit; background-color: transparent; color: rgb(20, 20, 20); text-decoration: none; transition: all 0.3s ease 0s;\">shop</a>&nbsp; at the best price in Bangladesh.</p><p style=\"box-sizing: border-box; margin: 0px 0px 20px; padding: 0px; border: 0px; outline: 0px; font-variant-ligatures: normal; font-variant-caps: normal; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; line-height: inherit; vertical-align: baseline; font-family: &quot;Open Sans&quot;, sans-serif; font-size: 14px; font-style: normal; font-weight: 400; color: rgb(73, 73, 73); letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-style: initial; text-decoration-color: initial;\">&nbsp;</p><h4 style=\"box-sizing: border-box; margin: 0px 0px 20px; padding: 0px; border: 0px; outline: 0px; font-variant-ligatures: normal; font-variant-caps: normal; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; line-height: 1.4; vertical-align: baseline; font-family: &quot;Open Sans&quot;, sans-serif; font-size: 17px; font-style: normal; font-weight: 600; color: rgb(51, 51, 51); letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-style: initial; text-decoration-color: initial;\"><strong style=\"box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; outline: 0px; font-variant: inherit; font-stretch: inherit; line-height: inherit; vertical-align: baseline; font-family: inherit; font-size: 17px; font-style: inherit; font-weight: 600;\">39 Inch<span>&nbsp;</span><a href=\"https://pentanik.com/basic-led-tv-price-in-bangladesh/\" title=\"- Pentanik 39 inch Basic LED TV\" style=\"box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; outline: 0px; font-variant: inherit; font-stretch: inherit; line-height: inherit; vertical-align: baseline; font-family: inherit; font-size: 17px; font-style: inherit; font-weight: inherit; background-color: transparent; color: rgb(20, 20, 20); text-decoration: none; transition: all 0.3s ease 0s;\">Basic</a><span>&nbsp;</span>LED TV Specifications</strong></h4><p style=\"box-sizing: border-box; margin: 0px 0px 20px; padding: 0px; border: 0px; outline: 0px; font-variant-ligatures: normal; font-variant-caps: normal; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; line-height: inherit; vertical-align: baseline; font-family: &quot;Open Sans&quot;, sans-serif; font-size: 14px; font-style: normal; font-weight: 400; color: rgb(73, 73, 73); letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-style: initial; text-decoration-color: initial;\">High brightness contrast LED panelDigital process for picture and audioSupport HD TV component signal inputPC resolution supportingAV X 1/VGA X 1/HDMI X 2/USB X 2Resolution: 1366*768 Brightness 200cd/m2Supper slim up to 87mmTV system: PAL/SECAM/NTSCSound system: B/G, D/K, IDTV system: DVB-T/T2(MPEG2/MPEG4/MHEG4)Energy saving / Auto power off / Free wall bracket.</p><p style=\"box-sizing: border-box; margin: 0px 0px 20px; padding: 0px; border: 0px; outline: 0px; font-variant-ligatures: normal; font-variant-caps: normal; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; line-height: inherit; vertical-align: baseline; font-family: &quot;Open Sans&quot;, sans-serif; font-size: 14px; font-style: normal; font-weight: 400; color: rgb(73, 73, 73); letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-style: initial; text-decoration-color: initial;\"><strong style=\"box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; outline: 0px; font-variant: inherit; font-stretch: inherit; line-height: inherit; vertical-align: baseline; font-family: inherit; font-size: 14px; font-style: inherit; font-weight: 600;\">About the Brand<span>&nbsp;</span></strong>Quality materials, durable composites, innovative designs and functionality, that’s what the Pentanik brand brings to you with variety and affordable. Pentanik creates products that are just right for your needs, durable and suited for your environment, at the right prices too.</p><br>', 23000.00, 17000.00, 0, '[]', '[]', '[]', NULL, 0, 0, 1, 6, 'piece', 1, 5000.00, 'amount', 0.00, 'amount', 'flat_rate', 0.00, 0, NULL, NULL, NULL, NULL, 'Pentanik-39-inch-Basic-LED-TV-OG77K', 0.00, 1, 0.00, NULL, 0, NULL, NULL, '2020-06-18 20:46:37', '2020-07-05 18:10:11');
INSERT INTO `products` (`id`, `name`, `added_by`, `user_id`, `category_id`, `subcategory_id`, `subsubcategory_id`, `brand_id`, `photos`, `thumbnail_img`, `featured_img`, `flash_deal_img`, `video_provider`, `video_link`, `tags`, `description`, `unit_price`, `purchase_price`, `variant_product`, `attributes`, `choice_options`, `colors`, `variations`, `todays_deal`, `published`, `featured`, `current_stock`, `unit`, `min_qty`, `discount`, `discount_type`, `tax`, `tax_type`, `shipping_type`, `shipping_cost`, `num_of_sale`, `meta_title`, `meta_description`, `meta_img`, `pdf`, `slug`, `earn_point`, `refundable`, `rating`, `barcode`, `digital`, `file_name`, `file_path`, `created_at`, `updated_at`) VALUES
(23, 'Pentanik 32 inch Smart Android led TV', 'admin', 12, 6, 32, 46, 14, '[\"uploads\\/products\\/photos\\/4lroeM9iOq2A7dLjEfZaUECNfaJU8y9eeGNI9uZW.png\"]', 'uploads/products/thumbnail/hz49dEnXE3ko6EIbvrITOINh1X4fk26iEooAaP56.png', 'uploads/products/featured/hispMvoI8RqpYYqODWvgtzx95xbtA8FoPPfs5kog.png', 'uploads/products/flash_deal/liQ7WCFtrMMMVcqxnHU0lNHD24jrga7FQHJmWIkj.png', 'youtube', NULL, '32 inch android tv price in bangladesh, 32 inch led tv, 32 inch led tv price in bangladesh, 32 inch smart tv, 32 inch smart tv price in bangladesh, 32 inch TV, 32 inch tv price in bangladesh, China LED TV, smart android tv, smart led tv', '<h2 style=\"box-sizing: border-box; margin: 0px 0px 20px; padding: 0px; border: 0px; outline: 0px; font-variant-ligatures: normal; font-variant-caps: normal; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; line-height: 1.4; vertical-align: baseline; font-family: &quot;Open Sans&quot;, sans-serif; font-size: 20px; font-style: normal; font-weight: 600; color: rgb(51, 51, 51); letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-style: initial; text-decoration-color: initial;\">Features of Pentanik 32 Inch LED TV:</h2><ul style=\"box-sizing: border-box; margin: 20px 0px 0px 20px; padding: 0px; border: 0px; outline: 0px; font-variant-ligatures: normal; font-variant-caps: normal; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; line-height: inherit; vertical-align: baseline; font-family: &quot;Open Sans&quot;, sans-serif; font-size: 14px; font-style: normal; font-weight: 400; list-style: disc; color: rgb(73, 73, 73); letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-style: initial; text-decoration-color: initial;\"><li style=\"box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; outline: 0px; font-variant: inherit; font-stretch: inherit; line-height: inherit; vertical-align: baseline; font-family: inherit; font-size: 14px; font-style: inherit; font-weight: inherit;\">Brand Name: Pentanik</li><li style=\"box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; outline: 0px; font-variant: inherit; font-stretch: inherit; line-height: inherit; vertical-align: baseline; font-family: inherit; font-size: 14px; font-style: inherit; font-weight: inherit;\">Screen Size:&nbsp; 32 &nbsp;Inch (Black)</li><li style=\"box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; outline: 0px; font-variant: inherit; font-stretch: inherit; line-height: inherit; vertical-align: baseline; font-family: inherit; font-size: 14px; font-style: inherit; font-weight: inherit;\">Display Regulation: 1368X720</li><li style=\"box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; outline: 0px; font-variant: inherit; font-stretch: inherit; line-height: inherit; vertical-align: baseline; font-family: inherit; font-size: 14px; font-style: inherit; font-weight: inherit;\">Display Technology:&nbsp; LED</li><li style=\"box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; outline: 0px; font-variant: inherit; font-stretch: inherit; line-height: inherit; vertical-align: baseline; font-family: inherit; font-size: 14px; font-style: inherit; font-weight: inherit;\">Display Resolution Maximum: 1080p</li><li style=\"box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; outline: 0px; font-variant: inherit; font-stretch: inherit; line-height: inherit; vertical-align: baseline; font-family: inherit; font-size: 14px; font-style: inherit; font-weight: inherit;\">Number of HDMI Ports:&nbsp; 2</li><li style=\"box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; outline: 0px; font-variant: inherit; font-stretch: inherit; line-height: inherit; vertical-align: baseline; font-family: inherit; font-size: 14px; font-style: inherit; font-weight: inherit;\">Total USB Ports: 2</li><li style=\"box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; outline: 0px; font-variant: inherit; font-stretch: inherit; line-height: inherit; vertical-align: baseline; font-family: inherit; font-size: 14px; font-style: inherit; font-weight: inherit;\">Total VGA Ports: 1</li><li style=\"box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; outline: 0px; font-variant: inherit; font-stretch: inherit; line-height: inherit; vertical-align: baseline; font-family: inherit; font-size: 14px; font-style: inherit; font-weight: inherit;\">Language:&nbsp; English</li><li style=\"box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; outline: 0px; font-variant: inherit; font-stretch: inherit; line-height: inherit; vertical-align: baseline; font-family: inherit; font-size: 14px; font-style: inherit; font-weight: inherit;\">Includes Remote:&nbsp; Yes</li><li style=\"box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; outline: 0px; font-variant: inherit; font-stretch: inherit; line-height: inherit; vertical-align: baseline; font-family: inherit; font-size: 14px; font-style: inherit; font-weight: inherit;\">Technology: korea</li><li style=\"box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; outline: 0px; font-variant: inherit; font-stretch: inherit; line-height: inherit; vertical-align: baseline; font-family: inherit; font-size: 14px; font-style: inherit; font-weight: inherit;\">Made In : China</li></ul><p style=\"box-sizing: border-box; margin: 0px 0px 20px; padding: 0px; border: 0px; outline: 0px; font-variant-ligatures: normal; font-variant-caps: normal; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; line-height: inherit; vertical-align: baseline; font-family: &quot;Open Sans&quot;, sans-serif; font-size: 14px; font-style: normal; font-weight: 400; color: rgb(73, 73, 73); letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-style: initial; text-decoration-color: initial;\">&nbsp;</p><h3 style=\"box-sizing: border-box; margin: 0px 0px 20px; padding: 0px; border: 0px; outline: 0px; font-variant-ligatures: normal; font-variant-caps: normal; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; line-height: 1.4; vertical-align: baseline; font-family: &quot;Open Sans&quot;, sans-serif; font-size: 18px; font-style: normal; font-weight: 600; color: rgb(51, 51, 51); letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-style: initial; text-decoration-color: initial;\">Description:</h3><ul style=\"box-sizing: border-box; margin: 20px 0px 0px 20px; padding: 0px; border: 0px; outline: 0px; font-variant-ligatures: normal; font-variant-caps: normal; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; line-height: inherit; vertical-align: baseline; font-family: &quot;Open Sans&quot;, sans-serif; font-size: 14px; font-style: normal; font-weight: 400; list-style: disc; color: rgb(73, 73, 73); letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-style: initial; text-decoration-color: initial;\"><li style=\"box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; outline: 0px; font-variant: inherit; font-stretch: inherit; line-height: inherit; vertical-align: baseline; font-family: inherit; font-size: 14px; font-style: inherit; font-weight: inherit;\">Surround Sound</li><li style=\"box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; outline: 0px; font-variant: inherit; font-stretch: inherit; line-height: inherit; vertical-align: baseline; font-family: inherit; font-size: 14px; font-style: inherit; font-weight: inherit;\">Eye Protection Technology</li><li style=\"box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; outline: 0px; font-variant: inherit; font-stretch: inherit; line-height: inherit; vertical-align: baseline; font-family: inherit; font-size: 14px; font-style: inherit; font-weight: inherit;\">ECO Saving</li><li style=\"box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; outline: 0px; font-variant: inherit; font-stretch: inherit; line-height: inherit; vertical-align: baseline; font-family: inherit; font-size: 14px; font-style: inherit; font-weight: inherit;\">HD Ready.</li></ul><p style=\"box-sizing: border-box; margin: 0px 0px 20px; padding: 0px; border: 0px; outline: 0px; font-variant-ligatures: normal; font-variant-caps: normal; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; line-height: inherit; vertical-align: baseline; font-family: &quot;Open Sans&quot;, sans-serif; font-size: 14px; font-style: normal; font-weight: 400; color: rgb(73, 73, 73); letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-style: initial; text-decoration-color: initial;\">&nbsp;</p><h2 style=\"box-sizing: border-box; margin: 0px 0px 20px; padding: 0px; border: 0px; outline: 0px; font-variant-ligatures: normal; font-variant-caps: normal; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; line-height: 1.4; vertical-align: baseline; font-family: &quot;Open Sans&quot;, sans-serif; font-size: 20px; font-style: normal; font-weight: 600; color: rgb(51, 51, 51); letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-style: initial; text-decoration-color: initial;\">&nbsp;32 inch led tv price in bangladesh</h2><p style=\"box-sizing: border-box; margin: 0px 0px 20px; padding: 0px; border: 0px; outline: 0px; font-variant-ligatures: normal; font-variant-caps: normal; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; line-height: inherit; vertical-align: baseline; font-family: &quot;Open Sans&quot;, sans-serif; font-size: 14px; font-style: normal; font-weight: 400; color: rgb(73, 73, 73); letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-style: initial; text-decoration-color: initial;\">It’s so important to have the right home Electronics, whether they are large or small, they help you satisfy the different needs we have around the house as well as making life so much more comfortable for us. Top of the HOME APPLIANCES so important to us are TELEVISIONS, and here on Pentanik 32 inch led tv price in Bangladesh, we have a wide variety to suit your different needs and tailored to fit different sitting room layouts.</p><p style=\"box-sizing: border-box; margin: 0px 0px 20px; padding: 0px; border: 0px; outline: 0px; font-variant-ligatures: normal; font-variant-caps: normal; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; line-height: inherit; vertical-align: baseline; font-family: &quot;Open Sans&quot;, sans-serif; font-size: 14px; font-style: normal; font-weight: 400; color: rgb(73, 73, 73); letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-style: initial; text-decoration-color: initial;\">Television is the main attraction of your home’s entertainment center. Bringing life to your living room or bedroom as the case may be the television gives an avenue to gather with friends or family to watch the news, sports, a favorite television series, or blockbuster movie, for all of this and more you’re going to want a TV with optimum sound and picture quality.</p><p style=\"box-sizing: border-box; margin: 0px 0px 20px; padding: 0px; border: 0px; outline: 0px; font-variant-ligatures: normal; font-variant-caps: normal; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; line-height: inherit; vertical-align: baseline; font-family: &quot;Open Sans&quot;, sans-serif; font-size: 14px; font-style: normal; font-weight: 400; color: rgb(73, 73, 73); letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-style: initial; text-decoration-color: initial;\">After a long day at work, sitting in front of the television and watching your favorite program is a common way to end your day. Our selection of&nbsp;<strong style=\"box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; outline: 0px; font-variant: inherit; font-stretch: inherit; line-height: inherit; vertical-align: baseline; font-family: inherit; font-size: 14px; font-style: inherit; font-weight: 600;\"><a href=\"https://pentanik.com/smart-tv-price-in-bangladesh/\" title=\"[object object] - Pentanik 32 inch Smart Android led TV\" style=\"box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; outline: 0px; font-variant: inherit; font-stretch: inherit; line-height: inherit; vertical-align: baseline; font-family: inherit; font-size: 14px; font-style: inherit; font-weight: inherit; background-color: transparent; color: rgb(20, 20, 20); text-decoration: none; transition: all 0.3s ease 0s;\">Pentanik</a><span>&nbsp;</span>televisions</strong>&nbsp;is sure to give you the comfort and relaxation you need.</p><p style=\"box-sizing: border-box; margin: 0px 0px 20px; padding: 0px; border: 0px; outline: 0px; font-variant-ligatures: normal; font-variant-caps: normal; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; line-height: inherit; vertical-align: baseline; font-family: &quot;Open Sans&quot;, sans-serif; font-size: 14px; font-style: normal; font-weight: 400; color: rgb(73, 73, 73); letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-style: initial; text-decoration-color: initial;\">&nbsp;</p><p style=\"box-sizing: border-box; margin: 0px 0px 20px; padding: 0px; border: 0px; outline: 0px; font-variant-ligatures: normal; font-variant-caps: normal; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; line-height: inherit; vertical-align: baseline; font-family: &quot;Open Sans&quot;, sans-serif; font-size: 14px; font-style: normal; font-weight: 400; color: rgb(73, 73, 73); letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-style: initial; text-decoration-color: initial;\"><strong style=\"box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; outline: 0px; font-variant: inherit; font-stretch: inherit; line-height: inherit; vertical-align: baseline; font-family: inherit; font-size: 14px; font-style: inherit; font-weight: 600;\">Internet Used Information:</strong><br style=\"box-sizing: border-box;\">Android Operating System used<br style=\"box-sizing: border-box;\">WiFi System used, PlayStore, / Aptoide TV<br style=\"box-sizing: border-box;\">Youtube, Facebook, Viber, Whatapps, Wireless Mouse &amp;<br style=\"box-sizing: border-box;\">Mouse Keyboard etc used.</p><p style=\"box-sizing: border-box; margin: 0px 0px 20px; padding: 0px; border: 0px; outline: 0px; font-variant-ligatures: normal; font-variant-caps: normal; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; line-height: inherit; vertical-align: baseline; font-family: &quot;Open Sans&quot;, sans-serif; font-size: 14px; font-style: normal; font-weight: 400; color: rgb(73, 73, 73); letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-style: initial; text-decoration-color: initial;\">Screen Share Skype from Mobile to Video Or Game TV</p><p style=\"box-sizing: border-box; margin: 0px 0px 20px; padding: 0px; border: 0px; outline: 0px; font-variant-ligatures: normal; font-variant-caps: normal; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; line-height: inherit; vertical-align: baseline; font-family: &quot;Open Sans&quot;, sans-serif; font-size: 14px; font-style: normal; font-weight: 400; color: rgb(73, 73, 73); letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-style: initial; text-decoration-color: initial;\">We have also other&nbsp;<a href=\"https://ponnobd.com/smart-tv\" target=\"_blank\" rel=\"noopener\" title=\"[object object] - Pentanik 32 inch Smart Android led TV\" style=\"box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; outline: 0px; font-variant: inherit; font-stretch: inherit; line-height: inherit; vertical-align: baseline; font-family: inherit; font-size: 14px; font-style: inherit; font-weight: inherit; background-color: transparent; color: rgb(20, 20, 20); text-decoration: none; transition: all 0.3s ease 0s;\">Smart LED TV</a>s. You may also check those products on&nbsp;<a href=\"https://pentanik.com/\" target=\"_blank\" rel=\"nofollow noopener noreferrer\" title=\"[object object] - Pentanik 32 inch Smart Android led TV\" style=\"box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; outline: 0px; font-variant: inherit; font-stretch: inherit; line-height: inherit; vertical-align: baseline; font-family: inherit; font-size: 14px; font-style: inherit; font-weight: inherit; background-color: transparent; color: rgb(20, 20, 20); text-decoration: none; transition: all 0.3s ease 0s;\">Pentanik</a>&nbsp;site.</p>', 17000.00, 10000.00, 0, '[]', '[]', '[]', NULL, 0, 0, 1, 10, 'piece', 1, 6800.00, 'amount', 0.00, 'amount', 'flat_rate', 0.00, 0, NULL, NULL, NULL, NULL, 'Pentanik-32-inch-Smart-Android-led-TV-igxLd', 0.00, 1, 0.00, NULL, 0, NULL, NULL, '2020-06-18 21:05:21', '2020-09-02 13:45:23'),
(24, 'Tl-WR841N 2 antina black', 'admin', 12, 2, 33, 45, 15, '[\"uploads\\/products\\/photos\\/DCyh0aL0taXKaI54xj94Ve1MKtDTSoy5OiP2zgGw.jpeg\"]', 'uploads/products/thumbnail/TwIVof84SzMYsbQ7hchHnjfcDCK8Ih4X4VnGXr1I.jpeg', 'uploads/products/featured/NVrUTZfxaCJLp2il82ZtXWafcY51cDlYc2nuaaCU.jpeg', 'uploads/products/flash_deal/euLk5kLfjMI1MjlVFCEbdzMFlUEhyO7ogTNpG2l4.jpeg', 'youtube', NULL, 'router,2 antina wifi router black', NULL, 1500.00, 1400.00, 0, '[]', '[]', '[]', NULL, 0, 0, 1, 100, 'piece', 1, 50.00, 'amount', 0.00, 'amount', 'flat_rate', 80.00, 0, NULL, NULL, NULL, NULL, 'Tl-WR841N-2-antina-black-uO60P', 0.00, 1, 0.00, NULL, 0, NULL, NULL, '2020-06-23 14:18:41', '2020-09-02 13:45:20'),
(25, 'Tl-WR850N 2 antina white', 'admin', 12, 1, 33, 45, 15, '[\"uploads\\/products\\/photos\\/DQSAfBXA2UCjCNQ1PYV0D2NWkoUUPv9cPJcxZGQ5.jpeg\"]', 'uploads/products/thumbnail/lsY6hCUHL0QEeYM878KvhGMP1gaP0tRxri0RiXyK.jpeg', 'uploads/products/featured/Yqm3Ry2DzrR1zo7EpZlisx710b0ZHQrGP1vDOQBh.jpeg', 'uploads/products/flash_deal/tnokyYcUvy5gJBHsMWuxo5Zg2IQToypQz80AydII.jpeg', 'youtube', NULL, 'Tl-WR850N 2 antina white,Router,wifi router,wifi', NULL, 1400.00, 1280.00, 0, '[]', '[]', '[]', NULL, 0, 1, 1, 96, 'piece', 1, 50.00, 'amount', 0.00, 'amount', 'flat_rate', 0.00, 4, NULL, NULL, NULL, NULL, 'Tl-WR850N-2-antina-white-kRdyk', 0.00, 1, 0.00, NULL, 0, NULL, NULL, '2020-07-02 18:36:36', '2020-09-12 14:23:16'),
(26, 'archer c20 3 anitina2', 'admin', 12, 1, 33, 45, 15, '[\"uploads\\/products\\/photos\\/nBibjdsX7nL8aiuGamdxuckTl3E7C0FRD5mJ5UwD.jpeg\"]', 'uploads/products/thumbnail/Z21PhddYPK6moCOi75Wcf1dPhYObIOusOf8eojYj.jpeg', 'uploads/products/featured/iICoUsvfapCuoRSGHuFf6l91zDTBrXA7PL7lqSSb.jpeg', 'images/2.png', 'youtube', NULL, 'wifi router,archel router', NULL, 2350.00, 2020.00, 0, '[]', '[]', '[]', NULL, 0, 1, 1, 99, 'piece', 1, 150.00, 'amount', 0.00, 'amount', 'flat_rate', 0.00, 1, 'Router, Wifi router,', NULL, 'uploads/products/meta/OWyiGA1BElTgSsq2JuEclH3u1PUP71Z01inukhro.jpeg', NULL, 'archer-c20-3-anitina2-BD4Vq', 0.00, 1, 0.00, NULL, 0, NULL, NULL, '2020-07-02 19:38:52', '2020-09-02 17:26:49'),
(27, 'archer C6 Router', 'admin', 12, 2, 33, 45, 15, '[\"uploads\\/products\\/photos\\/pVKHElInDdhU8IbtaYE4rYFgT9yRHaEn7jyxWj2P.jpeg\"]', 'uploads/products/thumbnail/8neBxxmC21z4AblMzCCwEMld2whN69V5e1jDQSZx.jpeg', 'uploads/products/featured/rXZd8uahCYxfcwRFC0QGkfL7J5NubP9C6oun803Q.jpeg', 'uploads/products/flash_deal/lSpVxH3VtSgrRxMBgr7v112Po0Fcl2QxQqxZcVoN.jpeg', 'youtube', NULL, 'router, wifi router,archer C6,high destens wifi router', NULL, 3300.00, 3200.00, 0, '[]', '[]', '[]', NULL, 1, 1, 1, 95, 'piece', 1, 0.00, 'amount', 0.00, 'amount', 'flat_rate', 0.00, 5, 'Router, Wifi router,', NULL, 'uploads/products/meta/oF3d5f6ggERiALb4W4SsddVYl8sSX42RwBsxGeTc.jpeg', NULL, 'archer-C6-Router-Dr1Vz', 0.00, 1, 0.00, NULL, 0, NULL, NULL, '2020-07-02 19:50:51', '2020-09-10 18:05:28'),
(28, 'C60 Router', 'admin', 12, 2, 33, 45, 15, '[\"uploads\\/products\\/photos\\/8r7Jk5FZSsqLVi0GFr4YXIZYzBSXl6WklwcdjYfX.png\"]', 'uploads/products/thumbnail/6L9K2HHATuejCmJmsCwBe262XjbpOm78li8B1iKA.jpeg', 'uploads/products/featured/OZg6OVAJjHc1yWpBmBUdjQ0lPTyhr3iidk8Xe9LM.png', 'uploads/products/flash_deal/gvnzUC6FgWhkLk3PJTQO3VtnGZEKol3loNYmRE8O.jpeg', 'youtube', NULL, 'wifi router, c60', NULL, 3250.00, 3000.00, 0, '[]', '[]', '[]', NULL, 0, 1, 1, 97, 'piece', 1, 0.00, 'amount', 0.00, 'amount', 'flat_rate', 0.00, 3, NULL, NULL, NULL, NULL, 'C60-Router-yFVMH', 0.00, 1, 0.00, NULL, 0, NULL, NULL, '2020-07-02 19:59:57', '2020-09-12 14:07:03'),
(29, 'Tp-link 24 port Switch', 'admin', 12, 4, 34, 47, 15, '[\"uploads\\/products\\/photos\\/OEopEoEE0v9enA0PR9ciLGT84IkFadMxnMmiCTNy.jpeg\"]', 'uploads/products/thumbnail/JFeQE6H9ByGw9w1ZNTNzMAYpS1ESPOHjejt1QXyw.jpeg', 'uploads/products/featured/CflsZ59yYWcqQVmr37mzeD46uERzbtny2jG9PCjD.jpeg', 'uploads/products/flash_deal/iuH2RxGQrQkhTrjFvykO6891L9a2EFLaHhN9kHHV.jpeg', 'youtube', NULL, 'Networking switch, Switch', NULL, 2350.00, 2450.00, 0, '[]', '[]', '[]', NULL, 0, 1, 1, 98, 'piece', 1, 0.00, 'amount', 0.00, 'amount', 'flat_rate', 0.00, 1, 'Networking switch,', NULL, 'uploads/products/meta/JVIVfP35d9dqEIdy5PyLMnrYC6wGDbdfp5xjEA3H.jpeg', NULL, 'Tp-link-24-port-Switch-fBP76', 0.00, 1, 0.00, NULL, 0, NULL, NULL, '2020-07-02 20:10:10', '2020-09-08 17:11:18'),
(30, 'Mikrotik RB1100AHx2 Dual Core CPU 2GB RAM 13 Gigabit LAN Port Ethernet Router', 'admin', 12, 4, 18, 48, 11, '[\"uploads\\/products\\/photos\\/JAZbqVWH1zrRHf9yNPECrxSrEYcYGEf517089eMw.jpeg\"]', 'uploads/products/thumbnail/cmL2CJ8oDnmbBs03sxwIht1YKPhEnHr73EzLOEAQ.jpeg', 'uploads/products/featured/9dVgEqaPNcKOSu3IFsuGEB25XaBP4Lo8jnwN5wGC.jpeg', 'uploads/products/flash_deal/XaQtEm6UJjpwhUXwebXEbtB11bq32c81RhC8XF8v.jpeg', 'youtube', NULL, 'CCR,RB Router', NULL, 30000.00, 2100.00, 0, '[]', '[]', '[]', NULL, 0, 1, 1, 10, 'piece', 1, 2500.00, 'amount', 0.00, 'amount', 'flat_rate', 0.00, 0, NULL, NULL, NULL, NULL, 'Mikrotik-RB1100AHx2-Dual-Core-CPU-2GB-RAM-13-Gigabit-LAN-Port-Ethernet-Router-wHGyH', 0.00, 1, 0.00, NULL, 0, NULL, NULL, '2020-07-02 20:31:14', '2020-07-07 13:12:28'),
(31, 'Mikrotik RB METAL 2SHPn  300-600 meter Range indoor/outdoor Router', 'admin', 12, 4, 18, 48, 16, '[\"uploads\\/products\\/photos\\/HwikYsYMSVmKX7Jlf6duk4GRkizfju166U5RhjVb.jpeg\"]', 'uploads/products/thumbnail/gH307kn0cXwCRxWmADif2Sj3GB48jQmFuDA1ssBJ.jpeg', 'uploads/products/featured/yQ6vQdI2Bh5SEmh1ccYW2xuFJJZDlDHlqvnnU6gK.jpeg', 'uploads/products/flash_deal/eWa0dZOYQfalooKY4Wnu1GKzySFoJJXtzrO91xtT.jpeg', 'youtube', NULL, '500 meter Range wifi Outdoor router', '<h1 id=\"spec\" style=\"box-sizing: border-box; margin: 0px; padding: 0px 0px 10px; border: 0px; outline: 0px; background: 0px 0px rgb(255, 255, 255); font-size: 30px; vertical-align: baseline; text-size-adjust: 100%; color: rgb(51, 51, 51); font-weight: 500; line-height: 1em; font-family: &quot;open sans&quot;, Arial, sans-serif; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; letter-spacing: normal; orphans: 2; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration-style: initial; text-decoration-color: initial;\">Product specifications</h1><table class=\"parameters_table\" style=\"box-sizing: border-box; border-spacing: 0px; border-collapse: collapse; width: 732px; margin: 0px 0px 15px; border: 1px solid rgb(238, 238, 238); text-align: left; color: rgb(102, 102, 102); font-family: &quot;open sans&quot;, Arial, sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 500; letter-spacing: normal; orphans: 2; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-style: initial; text-decoration-color: initial;\"><tbody style=\"box-sizing: border-box;\"><tr style=\"box-sizing: border-box; max-width: 100%; padding: 0.857em 0.587em;\"><th colspan=\"2\" style=\"box-sizing: border-box; padding: 0.857em 0.587em; color: rgb(85, 85, 85); font-weight: 700; max-width: 100%;\">Details</th></tr><tr style=\"box-sizing: border-box; max-width: 100%; padding: 0.857em 0.587em;\"><td style=\"box-sizing: border-box; padding: 0.857em 0.587em; border-top: 1px solid rgb(238, 238, 238); max-width: 100%;\">Product code</td><td style=\"box-sizing: border-box; padding: 0.857em 0.587em; border-top: 1px solid rgb(238, 238, 238); max-width: 100%;\">RBMetal2SHPn</td></tr><tr style=\"box-sizing: border-box; max-width: 100%; padding: 0.857em 0.587em;\"><td style=\"box-sizing: border-box; padding: 0.857em 0.587em; border-top: 1px solid rgb(238, 238, 238); max-width: 100%;\">CPU nominal frequency</td><td style=\"box-sizing: border-box; padding: 0.857em 0.587em; border-top: 1px solid rgb(238, 238, 238); max-width: 100%;\">400 MHz</td></tr><tr style=\"box-sizing: border-box; max-width: 100%; padding: 0.857em 0.587em;\"><td style=\"box-sizing: border-box; padding: 0.857em 0.587em; border-top: 1px solid rgb(238, 238, 238); max-width: 100%;\">CPU core count</td><td style=\"box-sizing: border-box; padding: 0.857em 0.587em; border-top: 1px solid rgb(238, 238, 238); max-width: 100%;\">1</td></tr><tr style=\"box-sizing: border-box; max-width: 100%; padding: 0.857em 0.587em;\"><td style=\"box-sizing: border-box; padding: 0.857em 0.587em; border-top: 1px solid rgb(238, 238, 238); max-width: 100%;\">Architecture</td><td style=\"box-sizing: border-box; padding: 0.857em 0.587em; border-top: 1px solid rgb(238, 238, 238); max-width: 100%;\">MIPS-BE</td></tr><tr style=\"box-sizing: border-box; max-width: 100%; padding: 0.857em 0.587em;\"><td style=\"box-sizing: border-box; padding: 0.857em 0.587em; border-top: 1px solid rgb(238, 238, 238); max-width: 100%;\">Size of RAM</td><td style=\"box-sizing: border-box; padding: 0.857em 0.587em; border-top: 1px solid rgb(238, 238, 238); max-width: 100%;\">64 MB</td></tr><tr style=\"box-sizing: border-box; max-width: 100%; padding: 0.857em 0.587em;\"><td style=\"box-sizing: border-box; padding: 0.857em 0.587em; border-top: 1px solid rgb(238, 238, 238); max-width: 100%;\">10/100 Ethernet ports</td><td style=\"box-sizing: border-box; padding: 0.857em 0.587em; border-top: 1px solid rgb(238, 238, 238); max-width: 100%;\">1</td></tr><tr style=\"box-sizing: border-box; max-width: 100%; padding: 0.857em 0.587em;\"><td style=\"box-sizing: border-box; padding: 0.857em 0.587em; border-top: 1px solid rgb(238, 238, 238); max-width: 100%;\">Wireless chip model</td><td style=\"box-sizing: border-box; padding: 0.857em 0.587em; border-top: 1px solid rgb(238, 238, 238); max-width: 100%;\">AR9283</td></tr><tr style=\"box-sizing: border-box; max-width: 100%; padding: 0.857em 0.587em;\"><td style=\"box-sizing: border-box; padding: 0.857em 0.587em; border-top: 1px solid rgb(238, 238, 238); max-width: 100%;\">Wireless standards</td><td style=\"box-sizing: border-box; padding: 0.857em 0.587em; border-top: 1px solid rgb(238, 238, 238); max-width: 100%;\">802.11b/g/n</td></tr><tr style=\"box-sizing: border-box; max-width: 100%; padding: 0.857em 0.587em;\"><td style=\"box-sizing: border-box; padding: 0.857em 0.587em; border-top: 1px solid rgb(238, 238, 238); max-width: 100%;\">Supported input voltage</td><td style=\"box-sizing: border-box; padding: 0.857em 0.587em; border-top: 1px solid rgb(238, 238, 238); max-width: 100%;\">9 V – 30 V</td></tr><tr style=\"box-sizing: border-box; max-width: 100%; padding: 0.857em 0.587em;\"><td style=\"box-sizing: border-box; padding: 0.857em 0.587em; border-top: 1px solid rgb(238, 238, 238); max-width: 100%;\">PoE in</td><td style=\"box-sizing: border-box; padding: 0.857em 0.587em; border-top: 1px solid rgb(238, 238, 238); max-width: 100%;\">Yes</td></tr><tr style=\"box-sizing: border-box; max-width: 100%; padding: 0.857em 0.587em;\"><td style=\"box-sizing: border-box; padding: 0.857em 0.587em; border-top: 1px solid rgb(238, 238, 238); max-width: 100%;\">Voltage Monitor</td><td style=\"box-sizing: border-box; padding: 0.857em 0.587em; border-top: 1px solid rgb(238, 238, 238); max-width: 100%;\">Yes</td></tr><tr style=\"box-sizing: border-box; max-width: 100%; padding: 0.857em 0.587em;\"><td style=\"box-sizing: border-box; padding: 0.857em 0.587em; border-top: 1px solid rgb(238, 238, 238); max-width: 100%;\">PCB temperature monitor</td><td style=\"box-sizing: border-box; padding: 0.857em 0.587em; border-top: 1px solid rgb(238, 238, 238); max-width: 100%;\">Yes</td></tr><tr style=\"box-sizing: border-box; max-width: 100%; padding: 0.857em 0.587em;\"><td style=\"box-sizing: border-box; padding: 0.857em 0.587em; border-top: 1px solid rgb(238, 238, 238); max-width: 100%;\">Dimensions</td><td style=\"box-sizing: border-box; padding: 0.857em 0.587em; border-top: 1px solid rgb(238, 238, 238); max-width: 100%;\">177x44x44mm, 193g</td></tr><tr style=\"box-sizing: border-box; max-width: 100%; padding: 0.857em 0.587em;\"><td style=\"box-sizing: border-box; padding: 0.857em 0.587em; border-top: 1px solid rgb(238, 238, 238); max-width: 100%;\">Operating System</td><td style=\"box-sizing: border-box; padding: 0.857em 0.587em; border-top: 1px solid rgb(238, 238, 238); max-width: 100%;\">RouterOS</td></tr><tr style=\"box-sizing: border-box; max-width: 100%; padding: 0.857em 0.587em;\"><td style=\"box-sizing: border-box; padding: 0.857em 0.587em; border-top: 1px solid rgb(238, 238, 238); max-width: 100%;\">Tested ambient temperature</td><td style=\"box-sizing: border-box; padding: 0.857em 0.587em; border-top: 1px solid rgb(238, 238, 238); max-width: 100%;\">-30C to +70C</td></tr><tr style=\"box-sizing: border-box; max-width: 100%; padding: 0.857em 0.587em;\"><td style=\"box-sizing: border-box; padding: 0.857em 0.587em; border-top: 1px solid rgb(238, 238, 238); max-width: 100%;\">License level</td><td style=\"box-sizing: border-box; padding: 0.857em 0.587em; border-top: 1px solid rgb(238, 238, 238); max-width: 100%;\">4</td></tr><tr style=\"box-sizing: border-box; max-width: 100%; padding: 0.857em 0.587em;\"><td style=\"box-sizing: border-box; padding: 0.857em 0.587em; border-top: 1px solid rgb(238, 238, 238); max-width: 100%;\">CPU</td><td style=\"box-sizing: border-box; padding: 0.857em 0.587em; border-top: 1px solid rgb(238, 238, 238); max-width: 100%;\">AR7241</td></tr><tr style=\"box-sizing: border-box; max-width: 100%; padding: 0.857em 0.587em;\"><td style=\"box-sizing: border-box; padding: 0.857em 0.587em; border-top: 1px solid rgb(238, 238, 238); max-width: 100%;\">Max Power consumption</td><td style=\"box-sizing: border-box; padding: 0.857em 0.587em; border-top: 1px solid rgb(238, 238, 238); max-width: 100%;\">11.5W</td></tr><tr style=\"box-sizing: border-box; max-width: 100%; padding: 0.857em 0.587em;\"><td style=\"box-sizing: border-box; padding: 0.857em 0.587em; border-top: 1px solid rgb(238, 238, 238); max-width: 100%;\">Number of chains</td><td style=\"box-sizing: border-box; padding: 0.857em 0.587em; border-top: 1px solid rgb(238, 238, 238); max-width: 100%;\">1</td></tr><tr style=\"box-sizing: border-box; max-width: 100%; padding: 0.857em 0.587em;\"><td style=\"box-sizing: border-box; padding: 0.857em 0.587em; border-top: 1px solid rgb(238, 238, 238); max-width: 100%;\">Storage type</td><td style=\"box-sizing: border-box; padding: 0.857em 0.587em; border-top: 1px solid rgb(238, 238, 238); max-width: 100%;\">NAND</td></tr><tr style=\"box-sizing: border-box; max-width: 100%; padding: 0.857em 0.587em;\"><td style=\"box-sizing: border-box; padding: 0.857em 0.587em; border-top: 1px solid rgb(238, 238, 238); max-width: 100%;\">Storage size</td><td style=\"box-sizing: border-box; padding: 0.857em 0.587em; border-top: 1px solid rgb(238, 238, 238); max-width: 100%;\">64 MB</td></tr></tbody></table><br>', 15000.00, 13000.00, 0, '[]', '[]', '[]', NULL, 1, 1, 1, 4, 'piece', 1, 0.00, 'amount', 0.00, 'amount', 'flat_rate', 0.00, 1, NULL, NULL, NULL, NULL, 'Mikrotik-RB-METAL-2SHPn--300-600-meter-Range-indooroutdoor-Router-tB5vl', 0.00, 1, 0.00, NULL, 0, NULL, NULL, '2020-07-02 20:47:58', '2020-09-12 14:07:03'),
(32, 'Glass Full Cover Screen Protector', 'admin', 12, 5, 13, 22, 1, '[\"uploads\\/products\\/photos\\/nbPGOoHS0hISc2j3RWJEzSVvSxJkq5gttbuZpLlm.png\"]', 'uploads/products/thumbnail/JbQHRQrat5GNzIAP8g1xhopfBtjnjlls0AU2yCSZ.png', 'uploads/products/featured/oWLYTwxi8vvrh1ATpgHa1vvzASUs5Y66dLu0y4g2.png', 'uploads/products/flash_deal/IIIuAaJBrUpH4L0RIEyfv9VgLsC1QOFO6VEEu49R.png', 'youtube', NULL, 'mobile glass,glass protectot', NULL, 260.00, 150.00, 0, '[]', '[]', '[]', NULL, 0, 1, 1, 100, 'piece', 1, 0.00, 'amount', 0.00, 'amount', 'free', 0.00, 0, 'mobile caseing, glass protector,', NULL, 'uploads/products/meta/s9ABq6OsGwcABnwZ4DJLso5yYBoWVHra0xf155AU.jpeg', NULL, 'Glass-Full-Cover-Screen-Protector-ZmgxM', 0.00, 1, 0.00, NULL, 0, NULL, NULL, '2020-07-04 06:28:08', '2020-09-02 13:41:46'),
(33, 'Mikrotik RB4011iGS+RM 10xGigabit Ethernet', 'admin', 12, 4, 18, 48, 16, '[\"uploads\\/products\\/photos\\/xUH4HuoxEXmQR7oK1LUILfV3YIFBBsj8kHaKRsIs.png\"]', 'uploads/products/thumbnail/XYkPvtkysyeWAq0y7IRzd0nc1dl8vtgDncHP8EDH.png', 'uploads/products/featured/pubEKT2SJ7cFoKTknommuYKCN2pX5lHNTQYw6rgL.png', 'uploads/products/flash_deal/IfnLY02Rxh3BdZGomPSUYahZchRjXs9hqlxgEZCU.png', 'youtube', NULL, 'RB,mikrotikRB4011', NULL, 17500.00, 15000.00, 0, '[]', '[]', '[]', NULL, 1, 1, 1, 10, 'piece', 1, 1500.00, 'amount', 0.00, 'amount', 'flat_rate', 0.00, 0, NULL, NULL, NULL, NULL, 'Mikrotik-RB4011iGSRM-10xGigabit-Ethernet-3J1da', 0.00, 1, 0.00, NULL, 0, NULL, NULL, '2020-07-05 17:39:48', '2020-07-05 17:41:46');
INSERT INTO `products` (`id`, `name`, `added_by`, `user_id`, `category_id`, `subcategory_id`, `subsubcategory_id`, `brand_id`, `photos`, `thumbnail_img`, `featured_img`, `flash_deal_img`, `video_provider`, `video_link`, `tags`, `description`, `unit_price`, `purchase_price`, `variant_product`, `attributes`, `choice_options`, `colors`, `variations`, `todays_deal`, `published`, `featured`, `current_stock`, `unit`, `min_qty`, `discount`, `discount_type`, `tax`, `tax_type`, `shipping_type`, `shipping_cost`, `num_of_sale`, `meta_title`, `meta_description`, `meta_img`, `pdf`, `slug`, `earn_point`, `refundable`, `rating`, `barcode`, `digital`, `file_name`, `file_path`, `created_at`, `updated_at`) VALUES
(34, 'Mikrotik RB1100AHx4 Dude Edition Router', 'admin', 12, 4, 18, 48, 16, '[\"uploads\\/products\\/photos\\/oZFMw6c3l2acJbnB9zAQxPmJbbgvreWwAa4A4hDn.jpeg\"]', 'uploads/products/thumbnail/4WZulyTrNFelkbHh85VzWHMa1Iz3NESH4RTz5XwJ.jpeg', 'uploads/products/featured/l8GFmXdEWh8rrYkk18qoeq9CSUuQVagPzORXLn5J.jpeg', 'uploads/products/flash_deal/7q808BR6vjimKkt3z01QGDFysZInp0I4dnNXuAX9.jpeg', 'youtube', NULL, 'mikrotik router RB', '<table class=\"table product-table\" style=\"box-sizing: border-box; border-spacing: 0px; border-collapse: collapse; width: 732px; margin: 0px 0px 15px; border: 1px solid rgb(238, 238, 238); text-align: left; color: rgb(102, 102, 102); font-family: &quot;open sans&quot;, Arial, sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 500; letter-spacing: normal; orphans: 2; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-style: initial; text-decoration-color: initial;\"><thead style=\"box-sizing: border-box;\"><tr style=\"box-sizing: border-box; max-width: 100%; padding: 0.857em 0.587em;\"><th colspan=\"2\" style=\"box-sizing: border-box; padding: 0.857em 0.587em; color: rgb(85, 85, 85); font-weight: 700; max-width: 100%;\">Details</th></tr></thead><tbody style=\"box-sizing: border-box;\"><tr style=\"box-sizing: border-box; max-width: 100%; padding: 0.857em 0.587em;\"><td style=\"box-sizing: border-box; padding: 0.857em 0.587em; border-top: 1px solid rgb(238, 238, 238); max-width: 100%;\"><a href=\"https://globalbrand.com.bd/?post_type=product&amp;p=5923&amp;preview=true\" style=\"box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; outline: 0px; background: 0px 0px; font-size: 14px; vertical-align: baseline; text-size-adjust: 100%; color: rgb(12, 113, 195); text-decoration: none;\">Product<span>&nbsp;</span></a>code</td><td style=\"box-sizing: border-box; padding: 0.857em 0.587em; border-top: 1px solid rgb(238, 238, 238); max-width: 100%;\"><a href=\"https://mikrotik.com/product/RB1100Dx4\" style=\"box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; outline: 0px; background: 0px 0px; font-size: 14px; vertical-align: baseline; text-size-adjust: 100%; color: rgb(12, 113, 195); text-decoration: none;\">RB1100Dx4</a></td></tr><tr style=\"box-sizing: border-box; max-width: 100%; padding: 0.857em 0.587em;\"><td style=\"box-sizing: border-box; padding: 0.857em 0.587em; border-top: 1px solid rgb(238, 238, 238); max-width: 100%;\">Architecture</td><td style=\"box-sizing: border-box; padding: 0.857em 0.587em; border-top: 1px solid rgb(238, 238, 238); max-width: 100%;\">ARM 32bit</td></tr><tr style=\"box-sizing: border-box; max-width: 100%; padding: 0.857em 0.587em;\"><td style=\"box-sizing: border-box; padding: 0.857em 0.587em; border-top: 1px solid rgb(238, 238, 238); max-width: 100%;\">CPU</td><td style=\"box-sizing: border-box; padding: 0.857em 0.587em; border-top: 1px solid rgb(238, 238, 238); max-width: 100%;\">AL21400</td></tr><tr style=\"box-sizing: border-box; max-width: 100%; padding: 0.857em 0.587em;\"><td style=\"box-sizing: border-box; padding: 0.857em 0.587em; border-top: 1px solid rgb(238, 238, 238); max-width: 100%;\">CPU core count</td><td style=\"box-sizing: border-box; padding: 0.857em 0.587em; border-top: 1px solid rgb(238, 238, 238); max-width: 100%;\">4</td></tr><tr style=\"box-sizing: border-box; max-width: 100%; padding: 0.857em 0.587em;\"><td style=\"box-sizing: border-box; padding: 0.857em 0.587em; border-top: 1px solid rgb(238, 238, 238); max-width: 100%;\">CPU nominal frequency</td><td style=\"box-sizing: border-box; padding: 0.857em 0.587em; border-top: 1px solid rgb(238, 238, 238); max-width: 100%;\">1.4 GHz</td></tr><tr style=\"box-sizing: border-box; max-width: 100%; padding: 0.857em 0.587em;\"><td style=\"box-sizing: border-box; padding: 0.857em 0.587em; border-top: 1px solid rgb(238, 238, 238); max-width: 100%;\">Dimensions</td><td style=\"box-sizing: border-box; padding: 0.857em 0.587em; border-top: 1px solid rgb(238, 238, 238); max-width: 100%;\">444 x 148 x 47 mm</td></tr><tr style=\"box-sizing: border-box; max-width: 100%; padding: 0.857em 0.587em;\"><td style=\"box-sizing: border-box; padding: 0.857em 0.587em; border-top: 1px solid rgb(238, 238, 238); max-width: 100%;\">License level</td><td style=\"box-sizing: border-box; padding: 0.857em 0.587em; border-top: 1px solid rgb(238, 238, 238); max-width: 100%;\">6</td></tr><tr style=\"box-sizing: border-box; max-width: 100%; padding: 0.857em 0.587em;\"><td style=\"box-sizing: border-box; padding: 0.857em 0.587em; border-top: 1px solid rgb(238, 238, 238); max-width: 100%;\">Operating System</td><td style=\"box-sizing: border-box; padding: 0.857em 0.587em; border-top: 1px solid rgb(238, 238, 238); max-width: 100%;\">RouterOS</td></tr><tr style=\"box-sizing: border-box; max-width: 100%; padding: 0.857em 0.587em;\"><td style=\"box-sizing: border-box; padding: 0.857em 0.587em; border-top: 1px solid rgb(238, 238, 238); max-width: 100%;\">Size of RAM</td><td style=\"box-sizing: border-box; padding: 0.857em 0.587em; border-top: 1px solid rgb(238, 238, 238); max-width: 100%;\">1 GB</td></tr><tr style=\"box-sizing: border-box; max-width: 100%; padding: 0.857em 0.587em;\"><td style=\"box-sizing: border-box; padding: 0.857em 0.587em; border-top: 1px solid rgb(238, 238, 238); max-width: 100%;\">Storage size</td><td style=\"box-sizing: border-box; padding: 0.857em 0.587em; border-top: 1px solid rgb(238, 238, 238); max-width: 100%;\">128 MB</td></tr><tr style=\"box-sizing: border-box; max-width: 100%; padding: 0.857em 0.587em;\"><td style=\"box-sizing: border-box; padding: 0.857em 0.587em; border-top: 1px solid rgb(238, 238, 238); max-width: 100%;\">Storage type</td><td style=\"box-sizing: border-box; padding: 0.857em 0.587em; border-top: 1px solid rgb(238, 238, 238); max-width: 100%;\">NAND</td></tr><tr style=\"box-sizing: border-box; max-width: 100%; padding: 0.857em 0.587em;\"><td style=\"box-sizing: border-box; padding: 0.857em 0.587em; border-top: 1px solid rgb(238, 238, 238); max-width: 100%;\">Tested ambient temperature</td><td style=\"box-sizing: border-box; padding: 0.857em 0.587em; border-top: 1px solid rgb(238, 238, 238); max-width: 100%;\">-40°C to 70°C</td></tr><tr style=\"box-sizing: border-box; max-width: 100%; padding: 0.857em 0.587em;\"><td style=\"box-sizing: border-box; padding: 0.857em 0.587em; border-top: 1px solid rgb(238, 238, 238); max-width: 100%;\"><br></td><td style=\"box-sizing: border-box; padding: 0.857em 0.587em; border-top: 1px solid rgb(238, 238, 238); max-width: 100%;\"><br></td></tr></tbody></table><h2 style=\"box-sizing: border-box; margin: 0px; padding: 0px 0px 10px; border: 0px; outline: 0px; background: 0px 0px rgb(255, 255, 255); font-size: 26px; vertical-align: baseline; text-size-adjust: 100%; color: rgb(51, 51, 51); font-weight: 500; line-height: 1em; font-family: &quot;open sans&quot;, Arial, sans-serif; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; letter-spacing: normal; orphans: 2; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration-style: initial; text-decoration-color: initial;\">Powering</h2><table class=\"table product-table\" style=\"box-sizing: border-box; border-spacing: 0px; border-collapse: collapse; width: 732px; margin: 0px 0px 15px; border: 1px solid rgb(238, 238, 238); text-align: left; color: rgb(102, 102, 102); font-family: &quot;open sans&quot;, Arial, sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 500; letter-spacing: normal; orphans: 2; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-style: initial; text-decoration-color: initial;\"><thead style=\"box-sizing: border-box;\"><tr style=\"box-sizing: border-box; max-width: 100%; padding: 0.857em 0.587em;\"><th colspan=\"2\" style=\"box-sizing: border-box; padding: 0.857em 0.587em; color: rgb(85, 85, 85); font-weight: 700; max-width: 100%;\">Details</th></tr></thead><tbody style=\"box-sizing: border-box;\"><tr style=\"box-sizing: border-box; max-width: 100%; padding: 0.857em 0.587em;\"><td style=\"box-sizing: border-box; padding: 0.857em 0.587em; border-top: 1px solid rgb(238, 238, 238); max-width: 100%;\">PoE in</td><td style=\"box-sizing: border-box; padding: 0.857em 0.587em; border-top: 1px solid rgb(238, 238, 238); max-width: 100%;\">802.3af/at</td></tr><tr style=\"box-sizing: border-box; max-width: 100%; padding: 0.857em 0.587em;\"><td style=\"box-sizing: border-box; padding: 0.857em 0.587em; border-top: 1px solid rgb(238, 238, 238); max-width: 100%;\">PoE in input Voltage</td><td style=\"box-sizing: border-box; padding: 0.857em 0.587em; border-top: 1px solid rgb(238, 238, 238); max-width: 100%;\">20-57 V</td></tr><tr style=\"box-sizing: border-box; max-width: 100%; padding: 0.857em 0.587em;\"><td style=\"box-sizing: border-box; padding: 0.857em 0.587em; border-top: 1px solid rgb(238, 238, 238); max-width: 100%;\">Number of AC inputs</td><td style=\"box-sizing: border-box; padding: 0.857em 0.587em; border-top: 1px solid rgb(238, 238, 238); max-width: 100%;\">2</td></tr><tr style=\"box-sizing: border-box; max-width: 100%; padding: 0.857em 0.587em;\"><td style=\"box-sizing: border-box; padding: 0.857em 0.587em; border-top: 1px solid rgb(238, 238, 238); max-width: 100%;\">Number of DC inputs</td><td style=\"box-sizing: border-box; padding: 0.857em 0.587em; border-top: 1px solid rgb(238, 238, 238); max-width: 100%;\">2 (2-pin terminal, PoE-IN)</td></tr><tr style=\"box-sizing: border-box; max-width: 100%; padding: 0.857em 0.587em;\"><td style=\"box-sizing: border-box; padding: 0.857em 0.587em; border-top: 1px solid rgb(238, 238, 238); max-width: 100%;\">2-pin terminal input Voltage</td><td style=\"box-sizing: border-box; padding: 0.857em 0.587em; border-top: 1px solid rgb(238, 238, 238); max-width: 100%;\">-48, 20-57 V</td></tr><tr style=\"box-sizing: border-box; max-width: 100%; padding: 0.857em 0.587em;\"><td style=\"box-sizing: border-box; padding: 0.857em 0.587em; border-top: 1px solid rgb(238, 238, 238); max-width: 100%;\">Max power consumption</td><td style=\"box-sizing: border-box; padding: 0.857em 0.587em; border-top: 1px solid rgb(238, 238, 238); max-width: 100%;\">33 W</td></tr><tr style=\"box-sizing: border-box; max-width: 100%; padding: 0.857em 0.587em;\"><td style=\"box-sizing: border-box; padding: 0.857em 0.587em; border-top: 1px solid rgb(238, 238, 238); max-width: 100%;\">Max power consumption without attachments</td><td style=\"box-sizing: border-box; padding: 0.857em 0.587em; border-top: 1px solid rgb(238, 238, 238); max-width: 100%;\">25 W</td></tr></tbody></table><h2 style=\"box-sizing: border-box; margin: 0px; padding: 0px 0px 10px; border: 0px; outline: 0px; background: 0px 0px rgb(255, 255, 255); font-size: 26px; vertical-align: baseline; text-size-adjust: 100%; color: rgb(51, 51, 51); font-weight: 500; line-height: 1em; font-family: &quot;open sans&quot;, Arial, sans-serif; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; letter-spacing: normal; orphans: 2; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration-style: initial; text-decoration-color: initial;\">Ethernet</h2><table class=\"table product-table\" style=\"box-sizing: border-box; border-spacing: 0px; border-collapse: collapse; width: 732px; margin: 0px 0px 15px; border: 1px solid rgb(238, 238, 238); text-align: left; color: rgb(102, 102, 102); font-family: &quot;open sans&quot;, Arial, sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 500; letter-spacing: normal; orphans: 2; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-style: initial; text-decoration-color: initial;\"><thead style=\"box-sizing: border-box;\"><tr style=\"box-sizing: border-box; max-width: 100%; padding: 0.857em 0.587em;\"><th colspan=\"2\" style=\"box-sizing: border-box; padding: 0.857em 0.587em; color: rgb(85, 85, 85); font-weight: 700; max-width: 100%;\">Details</th></tr></thead><tbody style=\"box-sizing: border-box;\"><tr style=\"box-sizing: border-box; max-width: 100%; padding: 0.857em 0.587em;\"><td style=\"box-sizing: border-box; padding: 0.857em 0.587em; border-top: 1px solid rgb(238, 238, 238); max-width: 100%;\">10/100/1000 Ethernet ports</td><td style=\"box-sizing: border-box; padding: 0.857em 0.587em; border-top: 1px solid rgb(238, 238, 238); max-width: 100%;\">13</td></tr></tbody></table><br>', 26000.00, 21000.00, 0, '[]', '[]', '[]', NULL, 0, 1, 1, 1, 'piece', 1, 2000.00, 'amount', 0.00, 'amount', 'flat_rate', 0.00, 0, NULL, NULL, NULL, NULL, 'Mikrotik-RB1100AHx4-Dude-Edition-Router-ZijZ7', 0.00, 1, 0.00, NULL, 0, NULL, NULL, '2020-07-05 17:54:55', '2020-09-02 13:41:46'),
(36, 'Fusion Splicer FL-117', 'admin', 12, 4, 18, 37, 17, '[\"uploads\\/products\\/photos\\/Nqi2cMjbWBFfv4YRwaXAyFHIMFu5ILGRY9PioUYX.jpeg\"]', 'uploads/products/thumbnail/Dno6hgIXzwUUdR06BvJuPJbnZ4PIIhOvhwYidIhO.jpeg', 'uploads/products/featured/kmk3UAHPOYV10xE7xyIY7kRyLhXIMc1zOdSDTzVm.jpeg', 'uploads/products/flash_deal/htbHuDA1gI1NURtWY8uNzvUzi8AagM6MenbT38e2.jpeg', 'youtube', NULL, 'splicer machean', '<div style=\"box-sizing: border-box; color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Helvetica, Arial, sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-style: initial; text-decoration-color: initial;\">● Used for FTTH and ordinary fiber project</div><div style=\"box-sizing: border-box; color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Helvetica, Arial, sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-style: initial; text-decoration-color: initial;\">● Core to core alignment by PAS technology<br style=\"box-sizing: border-box;\">● 8 sec splicing time and 30 sec heat time<br style=\"box-sizing: border-box;\">● 300 X or Y view, 200 X and Y view<br style=\"box-sizing: border-box;\">● 5 inch digital high-quality LCD screen, observe X and Y view at same time<br style=\"box-sizing: border-box;\">● Three in one fixture, splicing single fiber, cable indoor and pig tail<br style=\"box-sizing: border-box;\">● Built in large capacity lithium battery of 200 times splicing and heating<br style=\"box-sizing: border-box;\">● Small size and light weight, 2.1KG including battery</div><h2 style=\"box-sizing: border-box; font-family: &quot;Open Sans&quot;, Helvetica, Arial, sans-serif; font-weight: 400; line-height: 20px; color: rgb(10, 10, 10); margin-top: 20px; margin-bottom: 10px; font-size: 18px; font-style: normal; text-transform: uppercase; font-variant-ligatures: normal; font-variant-caps: normal; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration-style: initial; text-decoration-color: initial;\">PRODUCT DESCRIPTION</h2><table border=\"1\" width=\"621\" cellspacing=\"0\" cellpadding=\"0\" align=\"left\" style=\"box-sizing: border-box; border-collapse: collapse; border-spacing: 0px; background-color: transparent; color: rgb(10, 10, 10); font-family: &quot;Open Sans&quot;, Helvetica, Arial, sans-serif; font-size: 13px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration-style: initial; text-decoration-color: initial;\"><tbody style=\"box-sizing: border-box;\"><tr style=\"box-sizing: border-box;\"><td style=\"box-sizing: border-box; padding: 0px;\">Model</td><td style=\"box-sizing: border-box; padding: 0px;\">FL-117 FTTH Fusion Splicer</td></tr><tr style=\"box-sizing: border-box;\"><td style=\"box-sizing: border-box; padding: 0px;\">Splicing Type</td><td style=\"box-sizing: border-box; padding: 0px;\">SM, MM, DS, NZDS</td></tr><tr style=\"box-sizing: border-box;\"><td style=\"box-sizing: border-box; padding: 0px;\">Splicing Loss</td><td style=\"box-sizing: border-box; padding: 0px;\">0.02dB(SM)，0.01dB(MM)，0.04dB(DS)，0.04dB(NZDS)</td></tr><tr style=\"box-sizing: border-box;\"><td style=\"box-sizing: border-box; padding: 0px;\">Return Loss</td><td style=\"box-sizing: border-box; padding: 0px;\">&gt;60dB</td></tr><tr style=\"box-sizing: border-box;\"><td style=\"box-sizing: border-box; padding: 0px;\">Splicing Mode</td><td style=\"box-sizing: border-box; padding: 0px;\">Manual, Half Auto, Auto</td></tr><tr style=\"box-sizing: border-box;\"><td style=\"box-sizing: border-box; padding: 0px;\">Fiber Alignment</td><td style=\"box-sizing: border-box; padding: 0px;\">Core to Core Alignment by PAS technology</td></tr><tr style=\"box-sizing: border-box;\"><td style=\"box-sizing: border-box; padding: 0px;\">Applicable Fiber</td><td style=\"box-sizing: border-box; padding: 0px;\">Cable indoor and 0.25mm,0.9mm fiber,&nbsp;&nbsp; SC connector(option)</td></tr><tr style=\"box-sizing: border-box;\"><td style=\"box-sizing: border-box; padding: 0px;\">Splicing Time</td><td style=\"box-sizing: border-box; padding: 0px;\">≤9s</td></tr><tr style=\"box-sizing: border-box;\"><td style=\"box-sizing: border-box; padding: 0px;\">Heat Time</td><td style=\"box-sizing: border-box; padding: 0px;\">≤30s</td></tr><tr style=\"box-sizing: border-box;\"><td style=\"box-sizing: border-box; padding: 0px;\">Cleaved Length</td><td style=\"box-sizing: border-box; padding: 0px;\">8～16mm</td></tr><tr style=\"box-sizing: border-box;\"><td style=\"box-sizing: border-box; padding: 0px;\">Fiber Image/ Magnification</td><td style=\"box-sizing: border-box; padding: 0px;\">300/200</td></tr><tr style=\"box-sizing: border-box;\"><td style=\"box-sizing: border-box; padding: 0px;\">View Display</td><td style=\"box-sizing: border-box; padding: 0px;\">5 inch digital high-quality LCD screen</td></tr><tr style=\"box-sizing: border-box;\"><td style=\"box-sizing: border-box; padding: 0px;\">Tension Test</td><td style=\"box-sizing: border-box; padding: 0px;\">Standard 2N (option)</td></tr><tr style=\"box-sizing: border-box;\"><td style=\"box-sizing: border-box; padding: 0px;\">Heat Shrinkable Sleeve</td><td style=\"box-sizing: border-box; padding: 0px;\">60mm, 40mm and serials heat Shrinkable Sleeve</td></tr><tr style=\"box-sizing: border-box;\"><td style=\"box-sizing: border-box; padding: 0px;\">Battery Capacity</td><td style=\"box-sizing: border-box; padding: 0px;\">200 cycles splicing and heating, 3 hours charging time<br style=\"box-sizing: border-box;\">( splicing and charging at same time)</td></tr><tr style=\"box-sizing: border-box;\"><td style=\"box-sizing: border-box; padding: 0px;\">Battery Life</td><td style=\"box-sizing: border-box; padding: 0px;\">Cycling charge 300-500 times, easy to replace battery</td></tr><tr style=\"box-sizing: border-box;\"><td style=\"box-sizing: border-box; padding: 0px;\">Electrodes Life</td><td style=\"box-sizing: border-box; padding: 0px;\">3000, easy to replace electrodes</td></tr><tr style=\"box-sizing: border-box;\"><td style=\"box-sizing: border-box; padding: 0px;\">Power Source</td><td style=\"box-sizing: border-box; padding: 0px;\">≤20W</td></tr><tr style=\"box-sizing: border-box;\"><td style=\"box-sizing: border-box; padding: 0px;\">Interface</td><td style=\"box-sizing: border-box; padding: 0px;\">USB Convenient data download and software update</td></tr><tr style=\"box-sizing: border-box;\"><td style=\"box-sizing: border-box; padding: 0px;\">Construction Lighting</td><td style=\"box-sizing: border-box; padding: 0px;\">Built in high brightness, wide range of lights, easy to operate at night</td></tr><tr style=\"box-sizing: border-box;\"><td style=\"box-sizing: border-box; padding: 0px;\">Power supply</td><td style=\"box-sizing: border-box; padding: 0px;\">Built in lithium battery 5200mAh 11.1V; external adapter, input: AC100-240V, output: DC13.5V/4.5A</td></tr><tr style=\"box-sizing: border-box;\"><td style=\"box-sizing: border-box; padding: 0px;\">Operating Condition</td><td style=\"box-sizing: border-box; padding: 0px;\">0-5000m above sea level, Temperature: -10-60℃,<br style=\"box-sizing: border-box;\">Humidity:0～95%RH (No dew)</td></tr><tr style=\"box-sizing: border-box;\"><td style=\"box-sizing: border-box; padding: 0px;\">Weight (including battery)</td><td style=\"box-sizing: border-box; padding: 0px;\">2.1 KG (including battery)</td></tr><tr style=\"box-sizing: border-box;\"><td style=\"box-sizing: border-box; padding: 0px;\">Dimension (LxWxH)</td><td style=\"box-sizing: border-box; padding: 0px;\">135mm(L)×158mm(W)×155mm(H)</td></tr></tbody></table><p style=\"box-sizing: border-box; margin: 0px 0px 20px; color: rgb(10, 10, 10); font-family: &quot;Open Sans&quot;, Helvetica, Arial, sans-serif; font-size: 13px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration-style: initial; text-decoration-color: initial;\">&nbsp;</p><p style=\"box-sizing: border-box; margin: 0px 0px 20px; color: rgb(10, 10, 10); font-family: &quot;Open Sans&quot;, Helvetica, Arial, sans-serif; font-size: 13px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration-style: initial; text-decoration-color: initial;\">&nbsp;</p><p style=\"box-sizing: border-box; margin: 0px 0px 20px; color: rgb(10, 10, 10); font-family: &quot;Open Sans&quot;, Helvetica, Arial, sans-serif; font-size: 13px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration-style: initial; text-decoration-color: initial;\">&nbsp;</p><p style=\"box-sizing: border-box; margin: 0px 0px 20px; color: rgb(10, 10, 10); font-family: &quot;Open Sans&quot;, Helvetica, Arial, sans-serif; font-size: 13px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration-style: initial; text-decoration-color: initial;\">&nbsp;</p><div style=\"box-sizing: border-box; color: rgb(10, 10, 10); font-family: &quot;Open Sans&quot;, Helvetica, Arial, sans-serif; font-size: 13px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration-style: initial; text-decoration-color: initial;\"><br></div><div style=\"box-sizing: border-box; color: rgb(10, 10, 10); font-family: &quot;Open Sans&quot;, Helvetica, Arial, sans-serif; font-size: 13px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration-style: initial; text-decoration-color: initial;\"><table border=\"1\" width=\"584\" cellspacing=\"0\" cellpadding=\"0\" style=\"box-sizing: border-box; border-collapse: collapse; border-spacing: 0px; background-color: transparent;\"><tbody style=\"box-sizing: border-box;\"><tr style=\"box-sizing: border-box;\"><td colspan=\"3\" style=\"box-sizing: border-box; padding: 0px;\"><strong style=\"box-sizing: border-box; font-weight: bold;\">Standard Configuration</strong></td></tr><tr style=\"box-sizing: border-box;\"><td style=\"box-sizing: border-box; padding: 0px;\">No</td><td style=\"box-sizing: border-box; padding: 0px;\">Items</td><td style=\"box-sizing: border-box; padding: 0px;\">Qty</td></tr><tr style=\"box-sizing: border-box;\"><td style=\"box-sizing: border-box; padding: 0px;\">1</td><td style=\"box-sizing: border-box; padding: 0px;\">&nbsp;Fusion Splicer (FL-117)</td><td style=\"box-sizing: border-box; padding: 0px;\">1 set</td></tr><tr style=\"box-sizing: border-box;\"><td style=\"box-sizing: border-box; padding: 0px;\">2</td><td style=\"box-sizing: border-box; padding: 0px;\">&nbsp;Fiber Cleaver</td><td style=\"box-sizing: border-box; padding: 0px;\">1 pc</td></tr><tr style=\"box-sizing: border-box;\"><td style=\"box-sizing: border-box; padding: 0px;\">3</td><td style=\"box-sizing: border-box; padding: 0px;\">&nbsp;Fiber Stripper</td><td style=\"box-sizing: border-box; padding: 0px;\">1 pc</td></tr><tr style=\"box-sizing: border-box;\"><td style=\"box-sizing: border-box; padding: 0px;\">4</td><td style=\"box-sizing: border-box; padding: 0px;\">&nbsp;AC Adaptor</td><td style=\"box-sizing: border-box; padding: 0px;\">1 pc</td></tr><tr style=\"box-sizing: border-box;\"><td style=\"box-sizing: border-box; padding: 0px;\">5</td><td style=\"box-sizing: border-box; padding: 0px;\">&nbsp;Li Battery</td><td style=\"box-sizing: border-box; padding: 0px;\">1 pc</td></tr><tr style=\"box-sizing: border-box;\"><td style=\"box-sizing: border-box; padding: 0px;\">6</td><td style=\"box-sizing: border-box; padding: 0px;\">&nbsp;Charger</td><td style=\"box-sizing: border-box; padding: 0px;\">1 pc</td></tr><tr style=\"box-sizing: border-box;\"><td style=\"box-sizing: border-box; padding: 0px;\">7</td><td style=\"box-sizing: border-box; padding: 0px;\">&nbsp;Spare Electrodes</td><td style=\"box-sizing: border-box; padding: 0px;\">1 pair</td></tr><tr style=\"box-sizing: border-box;\"><td style=\"box-sizing: border-box; padding: 0px;\">8</td><td style=\"box-sizing: border-box; padding: 0px;\">&nbsp;Cooling Tray</td><td style=\"box-sizing: border-box; padding: 0px;\">1 pc</td></tr><tr style=\"box-sizing: border-box;\"><td style=\"box-sizing: border-box; padding: 0px;\">9</td><td style=\"box-sizing: border-box; padding: 0px;\">&nbsp;User Manual CD</td><td style=\"box-sizing: border-box; padding: 0px;\">1 pc</td></tr><tr style=\"box-sizing: border-box;\"><td style=\"box-sizing: border-box; padding: 0px;\">10</td><td style=\"box-sizing: border-box; padding: 0px;\">Carrying Case</td><td style=\"box-sizing: border-box; padding: 0px;\">1 pc</td></tr></tbody></table></div><br>', 120000.00, 90000.00, 0, '[]', '[]', '[]', NULL, 0, 1, 1, 10, 'piece', 1, 15000.00, 'amount', 0.00, 'amount', 'flat_rate', 0.00, 0, NULL, NULL, NULL, NULL, 'Fusion-Splicer-FL-117-Z9jb7', 0.00, 1, 0.00, NULL, 0, NULL, NULL, '2020-07-07 13:01:09', '2020-08-11 17:30:39');
INSERT INTO `products` (`id`, `name`, `added_by`, `user_id`, `category_id`, `subcategory_id`, `subsubcategory_id`, `brand_id`, `photos`, `thumbnail_img`, `featured_img`, `flash_deal_img`, `video_provider`, `video_link`, `tags`, `description`, `unit_price`, `purchase_price`, `variant_product`, `attributes`, `choice_options`, `colors`, `variations`, `todays_deal`, `published`, `featured`, `current_stock`, `unit`, `min_qty`, `discount`, `discount_type`, `tax`, `tax_type`, `shipping_type`, `shipping_cost`, `num_of_sale`, `meta_title`, `meta_description`, `meta_img`, `pdf`, `slug`, `earn_point`, `refundable`, `rating`, `barcode`, `digital`, `file_name`, `file_path`, `created_at`, `updated_at`) VALUES
(37, 'Fusion FL-118 Splicer', 'admin', 12, 4, 18, 37, 17, '[\"uploads\\/products\\/photos\\/POZ06q8SlpvkAXSRGGbOXPlWphHU4T1uy4AzrH19.jpeg\"]', 'uploads/products/thumbnail/T5AQO3fQ1vnRAJ5NjlcI5YCxNBf5s5PwafqyV7Bb.jpeg', 'uploads/products/featured/WpAcmro3UmODmqVqwiWIzMlsmjhGWWHRBwfFRzwS.jpeg', 'uploads/products/flash_deal/mTgNb6UPe1QVsTWnT9RoMLX2ksoVsYKWymeSBXsr.jpeg', 'youtube', NULL, 'Fusion FL-118 Splicer', '<p><span style=\"color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Helvetica, Arial, sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-style: initial; text-decoration-color: initial; display: inline !important; float: none;\">● Used for &nbsp;FTTH and ordinary fiber project</span><br style=\"box-sizing: border-box; color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Helvetica, Arial, sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-style: initial; text-decoration-color: initial;\"><span style=\"color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Helvetica, Arial, sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-style: initial; text-decoration-color: initial; display: inline !important; float: none;\">●Core to core alignment by PAS technology</span><br style=\"box-sizing: border-box; color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Helvetica, Arial, sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-style: initial; text-decoration-color: initial;\"><span style=\"color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Helvetica, Arial, sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-style: initial; text-decoration-color: initial; display: inline !important; float: none;\">● 8 sec splicing time and 30 sec heat time</span><br style=\"box-sizing: border-box; color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Helvetica, Arial, sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-style: initial; text-decoration-color: initial;\"><span style=\"color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Helvetica, Arial, sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-style: initial; text-decoration-color: initial; display: inline !important; float: none;\">●With 7200 mAh Ultra-large capacity Li battery</span><br style=\"box-sizing: border-box; color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Helvetica, Arial, sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-style: initial; text-decoration-color: initial;\"><span style=\"color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Helvetica, Arial, sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-style: initial; text-decoration-color: initial; display: inline !important; float: none;\">● 350 X or Y view, 280 X and Y view</span><br style=\"box-sizing: border-box; color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Helvetica, Arial, sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-style: initial; text-decoration-color: initial;\"><span style=\"color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Helvetica, Arial, sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-style: initial; text-decoration-color: initial; display: inline !important; float: none;\">●Large amplification and clear core</span><br style=\"box-sizing: border-box; color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Helvetica, Arial, sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-style: initial; text-decoration-color: initial;\"><span style=\"color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Helvetica, Arial, sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-style: initial; text-decoration-color: initial; display: inline !important; float: none;\">● 5 inch digital high-quality LCD screen, observe X and Y view at same time</span><br style=\"box-sizing: border-box; color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Helvetica, Arial, sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-style: initial; text-decoration-color: initial;\"><span style=\"color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Helvetica, Arial, sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-style: initial; text-decoration-color: initial; display: inline !important; float: none;\">● Three in one fixture, splicing single fiber, cable indoor and pig tail</span><br style=\"box-sizing: border-box; color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Helvetica, Arial, sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-style: initial; text-decoration-color: initial;\"><span style=\"color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Helvetica, Arial, sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-style: initial; text-decoration-color: initial; display: inline !important; float: none;\">● Built in large capacity lithium battery of 200 times splicing and heating</span><br style=\"box-sizing: border-box; color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Helvetica, Arial, sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-style: initial; text-decoration-color: initial;\"><span style=\"color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Helvetica, Arial, sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-style: initial; text-decoration-color: initial; display: inline !important; float: none;\">● Small size and light weight, 1.98KG including battery</span><br style=\"box-sizing: border-box; color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Helvetica, Arial, sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-style: initial; text-decoration-color: initial;\"><span style=\"color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Helvetica, Arial, sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-style: initial; text-decoration-color: initial; display: inline !important; float: none;\">●V type high power automatic heater with steel based thick film;high thermal efficiency, fast heating &nbsp; and long life</span></p><p><br></p><h2 style=\"box-sizing: border-box; font-family: &quot;Open Sans&quot;, Helvetica, Arial, sans-serif; font-weight: 400; line-height: 20px; color: rgb(10, 10, 10); margin-top: 20px; margin-bottom: 10px; font-size: 18px; font-style: normal; text-transform: uppercase; font-variant-ligatures: normal; font-variant-caps: normal; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration-style: initial; text-decoration-color: initial;\">PRODUCT DESCRIPTION</h2><div style=\"box-sizing: border-box; color: rgb(10, 10, 10); font-family: &quot;Open Sans&quot;, Helvetica, Arial, sans-serif; font-size: 13px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration-style: initial; text-decoration-color: initial;\"><strong style=\"box-sizing: border-box; font-weight: bold;\">Specifications</strong></div><table border=\"1\" width=\"621\" cellspacing=\"0\" cellpadding=\"0\" align=\"left\" style=\"box-sizing: border-box; border-collapse: collapse; border-spacing: 0px; background-color: transparent; color: rgb(10, 10, 10); font-family: &quot;Open Sans&quot;, Helvetica, Arial, sans-serif; font-size: 13px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration-style: initial; text-decoration-color: initial;\"><tbody style=\"box-sizing: border-box;\"><tr style=\"box-sizing: border-box;\"><td style=\"box-sizing: border-box; padding: 0px;\">Model</td><td style=\"box-sizing: border-box; padding: 0px;\">FL-118 &nbsp;Fusion Splicer</td></tr><tr style=\"box-sizing: border-box;\"><td style=\"box-sizing: border-box; padding: 0px;\">Splicing Type</td><td style=\"box-sizing: border-box; padding: 0px;\">SM, MM, DS, NZDS</td></tr><tr style=\"box-sizing: border-box;\"><td style=\"box-sizing: border-box; padding: 0px;\">Splicing Loss</td><td style=\"box-sizing: border-box; padding: 0px;\">0.02dB(SM)，0.01dB(MM)，0.04dB(DS)，0.04dB(NZDS)</td></tr><tr style=\"box-sizing: border-box;\"><td style=\"box-sizing: border-box; padding: 0px;\">Return Loss</td><td style=\"box-sizing: border-box; padding: 0px;\">&gt;60dB</td></tr><tr style=\"box-sizing: border-box;\"><td style=\"box-sizing: border-box; padding: 0px;\">Splicing Mode</td><td style=\"box-sizing: border-box; padding: 0px;\">Manual, Half Auto, Auto</td></tr><tr style=\"box-sizing: border-box;\"><td style=\"box-sizing: border-box; padding: 0px;\">Fiber Alignment</td><td style=\"box-sizing: border-box; padding: 0px;\">Core to Core Alignment by PAS technology</td></tr><tr style=\"box-sizing: border-box;\"><td style=\"box-sizing: border-box; padding: 0px;\">Applicable Fiber</td><td style=\"box-sizing: border-box; padding: 0px;\">Cable indoor and 0.25mm,0.9mm fiber,&nbsp;&nbsp; SC connector(option)</td></tr><tr style=\"box-sizing: border-box;\"><td style=\"box-sizing: border-box; padding: 0px;\">Splicing Time</td><td style=\"box-sizing: border-box; padding: 0px;\">≤9s</td></tr><tr style=\"box-sizing: border-box;\"><td style=\"box-sizing: border-box; padding: 0px;\">Heat Time</td><td style=\"box-sizing: border-box; padding: 0px;\">≤30s</td></tr><tr style=\"box-sizing: border-box;\"><td style=\"box-sizing: border-box; padding: 0px;\">Cleaved Length</td><td style=\"box-sizing: border-box; padding: 0px;\">8～16mm</td></tr><tr style=\"box-sizing: border-box;\"><td style=\"box-sizing: border-box; padding: 0px;\">Fiber Image/ Magnification</td><td style=\"box-sizing: border-box; padding: 0px;\">350/280</td></tr><tr style=\"box-sizing: border-box;\"><td style=\"box-sizing: border-box; padding: 0px;\">View Display</td><td style=\"box-sizing: border-box; padding: 0px;\">5 inch digital high-quality LCD screen</td></tr><tr style=\"box-sizing: border-box;\"><td style=\"box-sizing: border-box; padding: 0px;\">Tension Test</td><td style=\"box-sizing: border-box; padding: 0px;\">Standard 2N (option)</td></tr><tr style=\"box-sizing: border-box;\"><td style=\"box-sizing: border-box; padding: 0px;\">Heat Shrinkable Sleeve</td><td style=\"box-sizing: border-box; padding: 0px;\">60mm, 40mm and serials heat Shrinkable Sleeve</td></tr><tr style=\"box-sizing: border-box;\"><td style=\"box-sizing: border-box; padding: 0px;\">Battery Capacity</td><td style=\"box-sizing: border-box; padding: 0px;\">200 cycles splicing and heating,&nbsp; 3 hours charging time<br style=\"box-sizing: border-box;\">( splicing and charging at same time)</td></tr><tr style=\"box-sizing: border-box;\"><td style=\"box-sizing: border-box; padding: 0px;\">Battery Life</td><td style=\"box-sizing: border-box; padding: 0px;\">Cycling charge 300-500 times, easy to replace battery</td></tr><tr style=\"box-sizing: border-box;\"><td style=\"box-sizing: border-box; padding: 0px;\">Electrodes Life</td><td style=\"box-sizing: border-box; padding: 0px;\">3000, easy to replace electrodes</td></tr><tr style=\"box-sizing: border-box;\"><td style=\"box-sizing: border-box; padding: 0px;\">Power Source</td><td style=\"box-sizing: border-box; padding: 0px;\">≤20W</td></tr><tr style=\"box-sizing: border-box;\"><td style=\"box-sizing: border-box; padding: 0px;\">Interface</td><td style=\"box-sizing: border-box; padding: 0px;\">USB&nbsp; &nbsp;Convenient data download and software update</td></tr><tr style=\"box-sizing: border-box;\"><td style=\"box-sizing: border-box; padding: 0px;\">Construction Lighting</td><td style=\"box-sizing: border-box; padding: 0px;\">Built in high brightness, wide range of lights, easy to operate at night</td></tr><tr style=\"box-sizing: border-box;\"><td style=\"box-sizing: border-box; padding: 0px;\">Power supply</td><td style=\"box-sizing: border-box; padding: 0px;\">Built in lithium battery 5200mAh 11.1V; external adapter, input: AC100-240V, output: DC13.5V/4.5A</td></tr><tr style=\"box-sizing: border-box;\"><td style=\"box-sizing: border-box; padding: 0px;\">Operating Condition</td><td style=\"box-sizing: border-box; padding: 0px;\">0-5000m above sea level, Temperature: -10-60℃,<br style=\"box-sizing: border-box;\">Humidity:0～95%RH (No dew)</td></tr><tr style=\"box-sizing: border-box;\"><td style=\"box-sizing: border-box; padding: 0px;\">Weight&nbsp; (including battery)</td><td style=\"box-sizing: border-box; padding: 0px;\">1.98 KG (including battery)</td></tr><tr style=\"box-sizing: border-box;\"><td style=\"box-sizing: border-box; padding: 0px;\">Dimension (LxWxH)</td><td style=\"box-sizing: border-box; padding: 0px;\">135mm(L)×158mm(W)×155mm(H)</td></tr></tbody></table><p style=\"box-sizing: border-box; margin: 0px 0px 20px; color: rgb(10, 10, 10); font-family: &quot;Open Sans&quot;, Helvetica, Arial, sans-serif; font-size: 13px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration-style: initial; text-decoration-color: initial;\">&nbsp;</p>&nbsp;<table border=\"1\" width=\"584\" cellspacing=\"0\" cellpadding=\"0\" style=\"box-sizing: border-box; border-collapse: collapse; border-spacing: 0px; background-color: transparent; color: rgb(10, 10, 10); font-family: &quot;Open Sans&quot;, Helvetica, Arial, sans-serif; font-size: 13px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration-style: initial; text-decoration-color: initial;\"><tbody style=\"box-sizing: border-box;\"><tr style=\"box-sizing: border-box;\"><td colspan=\"3\" style=\"box-sizing: border-box; padding: 0px;\"><strong style=\"box-sizing: border-box; font-weight: bold;\">Standard Configuration</strong></td></tr><tr style=\"box-sizing: border-box;\"><td style=\"box-sizing: border-box; padding: 0px;\">No</td><td style=\"box-sizing: border-box; padding: 0px;\">Items</td><td style=\"box-sizing: border-box; padding: 0px;\">Qty</td></tr><tr style=\"box-sizing: border-box;\"><td style=\"box-sizing: border-box; padding: 0px;\">1</td><td style=\"box-sizing: border-box; padding: 0px;\">&nbsp;Fusion Splicer (FL-118)</td><td style=\"box-sizing: border-box; padding: 0px;\">1 set</td></tr><tr style=\"box-sizing: border-box;\"><td style=\"box-sizing: border-box; padding: 0px;\">2</td><td style=\"box-sizing: border-box; padding: 0px;\">&nbsp;Fiber Cleaver</td><td style=\"box-sizing: border-box; padding: 0px;\">1 pc</td></tr><tr style=\"box-sizing: border-box;\"><td style=\"box-sizing: border-box; padding: 0px;\">3</td><td style=\"box-sizing: border-box; padding: 0px;\">&nbsp;Fiber Stripper</td><td style=\"box-sizing: border-box; padding: 0px;\">1 pc</td></tr><tr style=\"box-sizing: border-box;\"><td style=\"box-sizing: border-box; padding: 0px;\">4</td><td style=\"box-sizing: border-box; padding: 0px;\">&nbsp;AC Adaptor</td><td style=\"box-sizing: border-box; padding: 0px;\">1 pc</td></tr><tr style=\"box-sizing: border-box;\"><td style=\"box-sizing: border-box; padding: 0px;\">5</td><td style=\"box-sizing: border-box; padding: 0px;\">&nbsp;Li Battery</td><td style=\"box-sizing: border-box; padding: 0px;\">1 pc</td></tr><tr style=\"box-sizing: border-box;\"><td style=\"box-sizing: border-box; padding: 0px;\">6</td><td style=\"box-sizing: border-box; padding: 0px;\">&nbsp;Charger</td><td style=\"box-sizing: border-box; padding: 0px;\">1 pc</td></tr><tr style=\"box-sizing: border-box;\"><td style=\"box-sizing: border-box; padding: 0px;\">7</td><td style=\"box-sizing: border-box; padding: 0px;\">&nbsp;Spare Electrodes</td><td style=\"box-sizing: border-box; padding: 0px;\">1 pair</td></tr><tr style=\"box-sizing: border-box;\"><td style=\"box-sizing: border-box; padding: 0px;\">8</td><td style=\"box-sizing: border-box; padding: 0px;\">&nbsp;Cooling Tray</td><td style=\"box-sizing: border-box; padding: 0px;\">1 pc</td></tr><tr style=\"box-sizing: border-box;\"><td style=\"box-sizing: border-box; padding: 0px;\">9</td><td style=\"box-sizing: border-box; padding: 0px;\">&nbsp;User Manual CD</td><td style=\"box-sizing: border-box; padding: 0px;\">1 pc</td></tr><tr style=\"box-sizing: border-box;\"><td style=\"box-sizing: border-box; padding: 0px;\">10</td><td style=\"box-sizing: border-box; padding: 0px;\">Carrying Case</td><td style=\"box-sizing: border-box; padding: 0px;\">1 pc</td></tr></tbody></table><p><br></p>', 125000.00, 95000.00, 0, '[]', '[]', '[]', NULL, 0, 1, 1, 10, 'piece', 1, 15000.00, 'amount', 0.00, 'amount', 'flat_rate', 0.00, 0, NULL, NULL, NULL, NULL, 'Fusion-FL-118-Splicer-lBjO0', 0.00, 1, 0.00, NULL, 0, NULL, NULL, '2020-07-07 13:11:55', '2020-09-02 13:53:20'),
(38, 'PNY Loop Attache 32 GB USB 3.0 Mobile Disk Drive', 'admin', 12, 5, 17, 36, 15, '[\"uploads\\/products\\/photos\\/B6mNihmSpjg4zfEXCkACZ2q57JJWoDLcW7rWiWPJ.jpeg\"]', 'uploads/products/thumbnail/QfP3fmRlyL3djSW85hVb8gMFvwD80N99PeJlrC7k.jpeg', 'uploads/products/featured/yOqkNeCH7wIm1Pz4sHIlbsRsDcVQfBmoP8Omi2T2.jpeg', 'uploads/products/flash_deal/0hImQBBq4tVJ5uyy4bALQwjIr2NxbbxuuIbKlP5b.jpeg', 'youtube', NULL, 'pendrive', '<section class=\"specification-tab m-tb-10\" id=\"specification\" style=\"box-sizing: border-box; margin: 10px 0px; padding: 0px; -webkit-font-smoothing: antialiased; display: block; color: rgb(51, 51, 51); font-family: &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(241, 243, 245); text-decoration-style: initial; text-decoration-color: initial;\"><table class=\"data-table\" cellpadding=\"0\" cellspacing=\"0\" style=\"box-sizing: border-box; margin: 0px 0px 15px; padding: 0px; -webkit-font-smoothing: antialiased; border-collapse: collapse; border-spacing: 0px; background-color: transparent; width: 847px;\"><tbody style=\"box-sizing: border-box; margin: 0px; padding: 0px; -webkit-font-smoothing: antialiased;\"><tr style=\"box-sizing: border-box; margin: 0px; padding: 0px; -webkit-font-smoothing: antialiased; border-bottom: 1px solid rgb(225, 225, 225);\"><td class=\"name\" style=\"box-sizing: border-box; margin: 0px; padding: 0px 30px; -webkit-font-smoothing: antialiased; width: 212px; background: rgb(238, 238, 238); text-align: right; color: rgb(70, 68, 68); font-size: 13px; line-height: 35px; font-weight: 600;\">Capacity</td><td class=\"value\" style=\"box-sizing: border-box; margin: 0px; padding: 0px 30px; -webkit-font-smoothing: antialiased; width: 635px; background: rgb(255, 255, 255); color: rgb(34, 34, 34); font-size: 14px; line-height: 22px;\">32 GB</td></tr><tr style=\"box-sizing: border-box; margin: 0px; padding: 0px; -webkit-font-smoothing: antialiased; border-bottom: 1px solid rgb(225, 225, 225);\"><td class=\"name\" style=\"box-sizing: border-box; margin: 0px; padding: 0px 30px; -webkit-font-smoothing: antialiased; width: 212px; background: rgb(238, 238, 238); text-align: right; color: rgb(70, 68, 68); font-size: 13px; line-height: 35px; font-weight: 600;\">Read Speed</td><td class=\"value\" style=\"box-sizing: border-box; margin: 0px; padding: 0px 30px; -webkit-font-smoothing: antialiased; width: 635px; background: rgb(255, 255, 255); color: rgb(34, 34, 34); font-size: 14px; line-height: 22px;\">up to 115MB/s (on 3.0 port)</td></tr><tr style=\"box-sizing: border-box; margin: 0px; padding: 0px; -webkit-font-smoothing: antialiased; border-bottom: 1px solid rgb(225, 225, 225);\"><td class=\"name\" style=\"box-sizing: border-box; margin: 0px; padding: 0px 30px; -webkit-font-smoothing: antialiased; width: 212px; background: rgb(238, 238, 238); text-align: right; color: rgb(70, 68, 68); font-size: 13px; line-height: 35px; font-weight: 600;\">Write Speed</td><td class=\"value\" style=\"box-sizing: border-box; margin: 0px; padding: 0px 30px; -webkit-font-smoothing: antialiased; width: 635px; background: rgb(255, 255, 255); color: rgb(34, 34, 34); font-size: 14px; line-height: 22px;\">up to 25MB/s (on 3.0 port)</td></tr><tr style=\"box-sizing: border-box; margin: 0px; padding: 0px; -webkit-font-smoothing: antialiased; border-bottom: 1px solid rgb(225, 225, 225);\"><td class=\"name\" style=\"box-sizing: border-box; margin: 0px; padding: 0px 30px; -webkit-font-smoothing: antialiased; width: 212px; background: rgb(238, 238, 238); text-align: right; color: rgb(70, 68, 68); font-size: 13px; line-height: 35px; font-weight: 600;\">Color</td><td class=\"value\" style=\"box-sizing: border-box; margin: 0px; padding: 0px 30px; -webkit-font-smoothing: antialiased; width: 635px; background: rgb(255, 255, 255); color: rgb(34, 34, 34); font-size: 14px; line-height: 22px;\">Gold Metal Body</td></tr><tr style=\"box-sizing: border-box; margin: 0px; padding: 0px; -webkit-font-smoothing: antialiased; border-bottom: 1px solid rgb(225, 225, 225);\"><td class=\"name\" style=\"box-sizing: border-box; margin: 0px; padding: 0px 30px; -webkit-font-smoothing: antialiased; width: 212px; background: rgb(238, 238, 238); text-align: right; color: rgb(70, 68, 68); font-size: 13px; line-height: 35px; font-weight: 600;\">Connectivity</td><td class=\"value\" style=\"box-sizing: border-box; margin: 0px; padding: 0px 30px; -webkit-font-smoothing: antialiased; width: 635px; background: rgb(255, 255, 255); color: rgb(34, 34, 34); font-size: 14px; line-height: 22px;\">USB 3.0 metallic flash drive with rifle color coating ,<br style=\"box-sizing: border-box; margin: 0px; padding: 0px; -webkit-font-smoothing: antialiased;\">USB 2.0 and 1.1 compatible</td></tr></tbody><thead style=\"box-sizing: border-box; margin: 0px; padding: 0px; -webkit-font-smoothing: antialiased;\"><tr style=\"box-sizing: border-box; margin: 0px; padding: 0px; -webkit-font-smoothing: antialiased; border-bottom: 1px solid rgb(225, 225, 225);\"><td class=\"heading-row\" colspan=\"3\" style=\"box-sizing: border-box; margin: 0px; padding: 10px 30px; -webkit-font-smoothing: antialiased; background: rgb(151, 161, 161); font-size: 15px; color: rgb(255, 255, 255); font-weight: 600;\">Physical Attribute</td></tr></thead><tbody style=\"box-sizing: border-box; margin: 0px; padding: 0px; -webkit-font-smoothing: antialiased;\"><tr style=\"box-sizing: border-box; margin: 0px; padding: 0px; -webkit-font-smoothing: antialiased; border-bottom: 1px solid rgb(225, 225, 225);\"><td class=\"name\" style=\"box-sizing: border-box; margin: 0px; padding: 0px 30px; -webkit-font-smoothing: antialiased; width: 212px; background: rgb(238, 238, 238); text-align: right; color: rgb(70, 68, 68); font-size: 13px; line-height: 35px; font-weight: 600;\">Dimensions</td><td class=\"value\" style=\"box-sizing: border-box; margin: 0px; padding: 0px 30px; -webkit-font-smoothing: antialiased; width: 635px; background: rgb(255, 255, 255); color: rgb(34, 34, 34); font-size: 14px; line-height: 22px;\">H 4,5mm x W 12mm x L 48,8mm</td></tr><tr style=\"box-sizing: border-box; margin: 0px; padding: 0px; -webkit-font-smoothing: antialiased; border-bottom: 1px solid rgb(225, 225, 225);\"><td class=\"name\" style=\"box-sizing: border-box; margin: 0px; padding: 0px 30px; -webkit-font-smoothing: antialiased; width: 212px; background: rgb(238, 238, 238); text-align: right; color: rgb(70, 68, 68); font-size: 13px; line-height: 35px; font-weight: 600;\">System Requirement</td><td class=\"value\" style=\"box-sizing: border-box; margin: 0px; padding: 0px 30px; -webkit-font-smoothing: antialiased; width: 635px; background: rgb(255, 255, 255); color: rgb(34, 34, 34); font-size: 14px; line-height: 22px;\">Works with Windows® 7, Windows® 8, Windows® Vista, Windows® XP , Windows® ME, Windows® 2000, Mac® OS 8.6 and higher, Linux® kernel 2.4+ ,<br style=\"box-sizing: border-box; margin: 0px; padding: 0px; -webkit-font-smoothing: antialiased;\">Non compatible Windows® 98</td></tr></tbody><thead style=\"box-sizing: border-box; margin: 0px; padding: 0px; -webkit-font-smoothing: antialiased;\"><tr style=\"box-sizing: border-box; margin: 0px; padding: 0px; -webkit-font-smoothing: antialiased; border-bottom: 1px solid rgb(225, 225, 225);\"><td class=\"heading-row\" colspan=\"3\" style=\"box-sizing: border-box; margin: 0px; padding: 10px 30px; -webkit-font-smoothing: antialiased; background: rgb(151, 161, 161); font-size: 15px; color: rgb(255, 255, 255); font-weight: 600;\">Warranty Information</td></tr></thead><tbody style=\"box-sizing: border-box; margin: 0px; padding: 0px; -webkit-font-smoothing: antialiased;\"><tr style=\"box-sizing: border-box; margin: 0px; padding: 0px; -webkit-font-smoothing: antialiased; border-bottom: 1px solid rgb(225, 225, 225);\"><td class=\"name\" style=\"box-sizing: border-box; margin: 0px; padding: 0px 30px; -webkit-font-smoothing: antialiased; width: 212px; background: rgb(238, 238, 238); text-align: right; color: rgb(70, 68, 68); font-size: 13px; line-height: 35px; font-weight: 600;\">Warranty</td><td class=\"value\" style=\"box-sizing: border-box; margin: 0px; padding: 0px 30px; -webkit-font-smoothing: antialiased; width: 635px; background: rgb(255, 255, 255); color: rgb(34, 34, 34); font-size: 14px; line-height: 22px;\">02 years</td></tr></tbody></table></section><section class=\"description bg-white m-tb-15 p-15\" id=\"description\" style=\"box-sizing: border-box; margin: 15px 0px; padding: 15px; -webkit-font-smoothing: antialiased; display: block; background-color: rgb(255, 255, 255); color: rgb(51, 51, 51); font-family: &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration-style: initial; text-decoration-color: initial;\"><h2 class=\"section-head\" style=\"box-sizing: border-box; margin: 0px 0px 15px; padding: 0px; -webkit-font-smoothing: antialiased; font-size: 18px; color: rgb(34, 34, 34); font-weight: 600;\">Description :</h2><div itemprop=\"description\" style=\"box-sizing: border-box; margin: 0px; padding: 0px; -webkit-font-smoothing: antialiased;\"><p style=\"box-sizing: border-box; margin: 0px 0px 10px; padding: 0px; -webkit-font-smoothing: antialiased;\"><span style=\"box-sizing: border-box; margin: 0px; padding: 0px; -webkit-font-smoothing: antialiased; font-weight: 700;\">PNY Loop Attache 32 GB USB 3.0 Mobile Disk Drive</span>The innovative and metallic design of the PNY Loop Attaché 3.0 Flash Drive provides a convenient way to store and share easily your documents, music and photos. The functional carabiner design makes it securely attaches to keys, tote, or belt loop, so important files are always within reach. This convenient and shock resis­tant USB Flash Drive provides the ultimate mobile storage solution for people on the go. Store and transfer images, music, documents, games and more !</p><span style=\"box-sizing: border-box; margin: 0px; padding: 0px; -webkit-font-smoothing: antialiased; font-weight: bold;\">2 years warranty&nbsp;</span></div></section>', 1450.00, 1150.00, 0, '[]', '[]', '[]', NULL, 0, 1, 1, 10, 'pice', 1, 200.00, 'amount', 0.00, 'amount', 'flat_rate', 0.00, 0, NULL, NULL, NULL, NULL, 'PNY-Loop-Attache-32-GB-USB-30-Mobile-Disk-Drive-1dTLv', 0.00, 1, 0.00, NULL, 0, NULL, NULL, '2020-07-16 12:11:55', '2020-09-02 13:37:08'),
(39, 'TP link  8 port  Switch', 'admin', 12, 4, 18, NULL, 15, '[\"uploads\\/products\\/photos\\/YRe0A1hY3A9egmVFPfAfzkfwZgnepnAk3iBE5MAG.jpeg\",\"uploads\\/products\\/photos\\/tsRL6AFdfodBKex5V6aeBIwn7s1wvuINXQy53qHZ.jpeg\"]', 'uploads/products/thumbnail/w4KyX8iuUMAfBP3HKh35NpFWaW46OUE15G07lKtX.jpeg', NULL, NULL, 'youtube', NULL, 'Switch 8 port g', NULL, 1800.00, 1600.00, 0, '[]', '[]', '[]', NULL, 0, 1, 1, 100, 'pice', 1, 0.00, 'amount', 0.00, 'amount', 'flat_rate', 0.00, 0, '8 port Gegabite swich', NULL, 'uploads/products/meta/31kmPw2qXgQihqNxhJ9JCmky2HmGYsIQt46206Ld.jpeg', NULL, 'TP-link--8-port--Switch-tZyqv', 0.00, 1, 0.00, NULL, 0, NULL, NULL, '2020-09-02 13:21:24', '2020-09-18 13:05:20'),
(40, 'optical fiber', 'admin', 12, 4, 18, NULL, 1, '[\"uploads\\/products\\/photos\\/GzyV1hnX48kr21nf4MlKt3xqAlacyUhsaPmkevy7.jpeg\",\"uploads\\/products\\/photos\\/Wqwom7rA7NXGJfdzJFPplM1c1zxTkfvwu7SZtwxU.jpeg\"]', 'uploads/products/thumbnail/Zae9c8VPEn0UMqWPjtHblM4m4AXzKadPHZLRoRKK.jpeg', NULL, NULL, 'youtube', NULL, 'optical cable', NULL, 17.00, 14.60, 0, '[]', '[]', '[]', NULL, 0, 1, 1, 2851, 'meter', 1, 0.00, 'amount', 0.00, 'amount', 'flat_rate', 0.00, 2, 'Usamatrin', NULL, 'uploads/products/meta/P3b47MHgezUMQA7zi9ls61jPUEwNXsLt9ni3LzIX.jpeg', NULL, 'optical-fiber-jM0bx', 0.00, 1, 0.00, NULL, 0, NULL, NULL, '2020-09-02 13:26:21', '2020-09-18 13:26:09'),
(41, 'D-link media Converter', 'admin', 12, 4, 18, NULL, 1, '[\"uploads\\/products\\/photos\\/O1gAPqbdDymBg9ZG48WvhSq1Qzu1tbK2EfJTQlYb.jpeg\",\"uploads\\/products\\/photos\\/so5jPQmrGees2VUBhKuXjpAevaxIGdP5IDW6n6Gw.jpeg\"]', 'uploads/products/thumbnail/0eHxpDKEOVsdRuAfSY0n9EWLBr4WoCPTCuo878XY.jpeg', NULL, NULL, 'youtube', NULL, 'mc', NULL, 750.00, 540.00, 0, '[]', '[]', '[]', NULL, 0, 1, 1, 97, 'pice', 1, 0.00, 'amount', 0.00, 'amount', 'flat_rate', 0.00, 1, 'mc dlink, D-link mc', NULL, 'uploads/products/meta/TrCxpEgJr1ljYWzThSfXDu4nQoDY0yB4YL3wCt3x.jpeg', NULL, 'D-link-media-Converter-M5rJ7', 0.00, 1, 0.00, NULL, 0, NULL, NULL, '2020-09-02 13:31:04', '2020-09-18 13:26:09'),
(42, 'onu Epon Xtech', 'admin', 12, 4, 18, 37, 1, '[\"uploads\\/products\\/photos\\/QKXu9uTLevX9JQ7l6cFuPHjRBdIboNDg3UQgojAG.jpeg\",\"uploads\\/products\\/photos\\/QMsAup6qAvFKKfbcle2KVArpYBE7KQ63s7YfVQJh.jpeg\"]', 'uploads/products/thumbnail/QCr043WiXfG2WbQrTwSemhKb9c3TpstcigtqcCHG.jpeg', NULL, NULL, 'youtube', NULL, 'onu', NULL, 1050.00, 1100.00, 0, '[]', '[]', '[]', NULL, 0, 1, 1, 99, 'pice', 1, 0.00, 'amount', 0.00, 'amount', 'free', 0.00, 0, 'onu', NULL, 'uploads/products/meta/s331zaPsDEyvlO7eowDWcaacVawcZleLMWtwBEFp.jpeg', NULL, 'onu-Epon-Xtech-vHvjy', 0.00, 1, 0.00, NULL, 0, NULL, NULL, '2020-09-02 13:39:51', '2020-09-02 14:00:08'),
(44, 'TJ Box', 'admin', 12, 4, 18, 48, 1, '[\"uploads\\/products\\/photos\\/qMax52Kl6MqJ6P0xIsXcOcQhRPncgOxNpuyjvB2f.jpeg\"]', 'uploads/products/thumbnail/JPdIexTkVAwC2zYL3vQDPaaGEIJk10ZVAFzXCZTZ.jpeg', NULL, NULL, 'youtube', NULL, 'tj box', NULL, 50.00, 40.00, 0, '[]', '[]', '[]', NULL, 0, 1, 1, 98, 'pice', 1, 0.00, 'amount', 0.00, 'amount', 'flat_rate', 0.00, 1, 'tj box', NULL, 'uploads/products/meta/JPdIexTkVAwC2zYL3vQDPaaGEIJk10ZVAFzXCZTZ.jpeg', NULL, 'TJ-Box-0AQnT', 0.00, 1, 0.00, NULL, 0, NULL, NULL, '2020-09-02 14:04:07', '2020-09-12 19:37:32'),
(45, 'TJ Box', 'admin', 12, 4, 18, NULL, NULL, '[\"uploads\\/products\\/photos\\/faugeSi6C6M8nmb9npWFUudRFKIs3V0OPcdLG8Cg.jpeg\"]', 'uploads/products/thumbnail/oOBH2ECm2W1xltqrYxYGh75U4XRJtUnRxUKRYBBx.jpeg', NULL, NULL, 'youtube', NULL, 'tj box', NULL, 75.00, 65.00, 0, '[]', '[]', '[]', NULL, 0, 1, 1, 100, 'pice', 1, 0.00, 'amount', 0.00, 'amount', 'flat_rate', 0.00, 0, 'tj box', NULL, 'uploads/products/meta/oOBH2ECm2W1xltqrYxYGh75U4XRJtUnRxUKRYBBx.jpeg', NULL, 'TJ-Box-pdsY3', 0.00, 1, 0.00, NULL, 0, NULL, NULL, '2020-09-02 14:07:24', '2020-09-02 14:07:28'),
(46, 'N301 tenda 2 abtina Router', 'admin', 12, 4, 18, NULL, 22, '[\"uploads\\/products\\/photos\\/gssiZlnrdmE5wGlO8QEa3h9oRf8G4MBTGTud6Zz9.jpeg\",\"uploads\\/products\\/photos\\/1HAiKiT4Lku0kM11btE4dKGXfMeNVzvSPdKGV7p8.jpeg\"]', 'uploads/products/thumbnail/NPM9mFWt9M8SSeVFHQEq7mo9jmbesBLst45A5FAf.jpeg', NULL, NULL, 'youtube', NULL, 'tenda router', NULL, 950.00, 830.00, 0, '[]', '[]', '[]', NULL, 0, 1, 1, 106, 'pc', 1, 0.00, 'amount', 0.00, 'amount', 'flat_rate', 0.00, 0, 'tenda router', NULL, 'uploads/products/meta/NPM9mFWt9M8SSeVFHQEq7mo9jmbesBLst45A5FAf.jpeg', NULL, 'N301-tenda-2-abtina-Router-bVQU5', 0.00, 1, 0.00, NULL, 0, NULL, NULL, '2020-09-13 08:05:15', '2020-09-13 08:05:22'),
(48, 'Gi pipr', 'admin', 12, 7, 31, NULL, 24, '[\"uploads\\/products\\/photos\\/KWxwURoAZxpoVt5K4vvbg3dUpyBrklhvcwjDJGx1.jpeg\"]', 'uploads/products/thumbnail/roZX4LLo2E9GqMAcX3tcjm5kXibOr0hZTFm5XDZi.jpeg', NULL, NULL, 'youtube', NULL, 'gi pipe', NULL, 2300.00, 1800.00, 0, '[]', '[]', '[]', NULL, 0, 1, 1, 100, 'pc', 1, 0.00, 'amount', 0.00, 'amount', 'flat_rate', 0.00, 0, 'Gi pipr', NULL, 'uploads/products/meta/roZX4LLo2E9GqMAcX3tcjm5kXibOr0hZTFm5XDZi.jpeg', NULL, 'Gi-pipr-50qQT', 0.00, 1, 0.00, '12345876259', 0, NULL, NULL, '2020-09-14 17:25:32', '2020-09-14 17:32:38'),
(49, 'Xiaomi MI 4C R4CM 300 Mbps 4 Antenna Router (Global Version)', 'admin', 12, 4, 33, NULL, 20, '[\"uploads\\/products\\/photos\\/svGYxyS4WzhkXMYSQkmbliafcmeYdFHZSwDNSBRa.jpeg\",\"uploads\\/products\\/photos\\/IrQ4pjl7r2CnKTe05BKv7JUsGxDCX1exb8jWcitN.jpeg\",\"uploads\\/products\\/photos\\/aThzbpPQOqrmrE9F0kI17yuRwvVH3EqSld1G46V6.jpeg\"]', 'uploads/products/thumbnail/oFA2pHhglvs82AVGM7DNyKXNATkpJL3UvaLN7cjM.jpeg', NULL, NULL, 'youtube', NULL, 'Xiaome', '<p><strong>Data Rate</strong>: 300Mbps\r\n</p><p><strong>Antenna:</strong>	4\r\n</p><p><strong>Button:</strong>	Reset Button</p><p>\r\n<strong>Frequency:</strong>	2.4 GHz\r\n</p><p><strong>Interface:&nbsp;</strong>Network Protocol: IEEE 802.11b/g/n,IEEE 802.3/3u</p><p>\r\n<strong>Network Standard:</strong>	Wireless Standard: Wireless AC</p><p>\r\n<strong>Encryption:</strong>	WPA-PSK,WPA2-PSK</p><p>\r\n<strong>Others:</strong>	Speed of Ethernet Port: 10/100Mbps\r\n</p><p><u><strong>Physical Dimension</strong></u>\r\n</p><p><strong>Dimension:</strong>	24.00 x 16.00 x 3.00 cm\r\n</p><p><strong>Weight:</strong> 0.4400 kg\r\n</p><p><strong>Color:</strong> White\r\n</p>', 1950.00, 1300.00, 0, '[]', '[]', '[]', NULL, 0, 1, 1, 100, 'pcs', 100, 350.00, 'amount', 0.00, 'amount', 'flat_rate', 0.00, 0, 'Xiaomi MI 4C R4CM 300 Mbps 4 Antenna Router (Global Version)', '<p><strong>Data Rate</strong>: 300Mbps\r\n</p><p><strong>Antenna:</strong>	4\r\n</p><p><strong>Button:</strong>	Reset Button</p><p>\r\n<strong>Frequency:</strong>	2.4 GHz\r\n</p><p><strong>Interface:&nbsp;</strong>Network Protocol: IEEE 802.11b/g/n,IEEE 802.3/3u</p><p>\r\n<strong>Network Standard:</strong>	Wireless Standard: Wireless AC</p><p>\r\n<strong>Encryption:</strong>	WPA-PSK,WPA2-PSK</p><p>\r\n<strong>Others:</strong>	Speed of Ethernet Port: 10/100Mbps\r\n</p><p><u><strong>Physical Dimension</strong></u>\r\n</p><p><strong>Dimension:</strong>	24.00 x 16.00 x 3.00 cm\r\n</p><p><strong>Weight:</strong> 0.4400 kg\r\n</p><p><strong>Color:</strong> White\r\n</p>', 'uploads/products/meta/oFA2pHhglvs82AVGM7DNyKXNATkpJL3UvaLN7cjM.jpeg', NULL, 'Xiaomi-MI-4C-R4CM-300-Mbps-4-Antenna-Router-Global-Version-FHm5m', 0.00, 1, 0.00, '6970244525529', 0, NULL, NULL, '2020-09-16 20:08:49', '2020-10-15 21:11:00'),
(50, 'MT Link Router MT-WR850N', 'admin', 12, 4, 33, NULL, 15, '[\"uploads\\/products\\/photos\\/FhWEtebA6papk0NoTbjoUjEmo5IdyonCiKI6muao.jpeg\"]', 'uploads/products/thumbnail/nQ4qbFWxaZV5kp4d0pBnQg9gwNCkiU8y1N1S8Dvl.jpeg', NULL, NULL, 'youtube', NULL, '', '<p><strong><u>Features</u></strong></p><ul><li>Comply with IEEE802.11n/g/b, IEEE802.3 10Base-T, IEEE802.3u 100Base-TX standards</li><li>Parental controls to supervise Internet activity</li><li>Connect your computers, gaming consoles, Internet-enabled HDTV’s and Blu-Ray players, and other wireless devices at&nbsp;up to 300 Mbps of transfer speeds</li><li>Advanced WAP/WAP2 wireless security and SPI firewall protection</li><li>MIMO technology enabled</li><li>Support DHCP Client, PPPoE Client, Russian PPoE, Static IP, PPTP Dynamic/Static</li><li>Support Option 121 and 249</li><li>Support multi-wireless mode: WISP, AP, WDS, AP+WDS, repeater, client</li><li>WPS button securely connects devices at a snap</li><li>Support FTP, PPTP and L2TP pass through</li><li>IP and MAC binding addictively prevent ARP virus attacks</li><li>Support WMM</li><li>Support DMZ</li></ul><p><strong><u>Specifications:</u></strong></p><ul><li><strong>ModelMT-&nbsp;</strong> &nbsp;WR850N</li><li><strong>Standards</strong>&nbsp; IEEE 802.11b, IEEE 802.11g, IEEE 802.11n</li><li><strong>Protocols</strong>&nbsp; &nbsp;IEEE 802.3 10Base-T, IEEE 802.3u 100Base-TX</li><li><strong>Ports&nbsp;</strong> &nbsp; 1x 10/100M Auto MDI/MDIX RJ45 port4x 10/100M Auto MDI/MDIX RJ45&nbsp;</li><li><strong>Button&nbsp; </strong>DefaultWPS</li><li><strong>Data Transfer Rates</strong> 11n: 40MHZ (300 Mbps, 270 Mbps, 240 Mbps, 180 Mbps, 120 Mbps, 90 Mbps, 60 Mbps, 30 Mbps)20MHZ (144 Mbps, 130 Mbps, 115 Mbps, 86 Mbps, 57 Mbps, 43 Mbps, 28 Mbps, 14 Mbps) (Auto-Sense)801.11g:(54Mbps, 48Mbps, 36Mbps, 24Mbps, 18Mbps, 12Mbps, 11Mbps, 9Mbps, 6Mbps)802.11b:(11Mbps,9Mbps, 6Mbps, 5, 5Mbps, 2Mbps, 1Mbps)</li><li><strong>Antenna</strong>&nbsp; 2 x 5dBi Fixed Antenna</li><li><strong>Dimension&nbsp;</strong> 183 mm(L)*125.2 mm(W)*30.72 mm(H)</li><li><strong>Operating Temperature&nbsp;</strong> 0° to 40° C</li><li><strong>Operating Humidity</strong>&nbsp; 10% to 90% RH non-condensing</li></ul>', 1300.00, 840.00, 0, '[]', '[]', '[]', NULL, 0, 1, 1, 100, 'pcs', 100, 101.00, 'amount', 0.00, 'amount', 'flat_rate', 0.00, 0, 'MT Link Router MT-WR850N', '<p><strong><u>Features</u></strong></p><ul><li>Comply with IEEE802.11n/g/b, IEEE802.3 10Base-T, IEEE802.3u 100Base-TX standards</li><li>Parental controls to supervise Internet activity</li><li>Connect your computers, gaming consoles, Internet-enabled HDTV’s and Blu-Ray players, and other wireless devices at&nbsp;up to 300 Mbps of transfer speeds</li><li>Advanced WAP/WAP2 wireless security and SPI firewall protection</li><li>MIMO technology enabled</li><li>Support DHCP Client, PPPoE Client, Russian PPoE, Static IP, PPTP Dynamic/Static</li><li>Support Option 121 and 249</li><li>Support multi-wireless mode: WISP, AP, WDS, AP+WDS, repeater, client</li><li>WPS button securely connects devices at a snap</li><li>Support FTP, PPTP and L2TP pass through</li><li>IP and MAC binding addictively prevent ARP virus attacks</li><li>Support WMM</li><li>Support DMZ</li></ul><p><strong><u>Specifications:</u></strong></p><ul><li><strong>ModelMT-&nbsp;</strong> &nbsp;WR850N</li><li><strong>Standards</strong>&nbsp; IEEE 802.11b, IEEE 802.11g, IEEE 802.11n</li><li><strong>Protocols</strong>&nbsp; &nbsp;IEEE 802.3 10Base-T, IEEE 802.3u 100Base-TX</li><li><strong>Ports&nbsp;</strong> &nbsp; 1x 10/100M Auto MDI/MDIX RJ45 port4x 10/100M Auto MDI/MDIX RJ45&nbsp;</li><li><strong>Button&nbsp; </strong>DefaultWPS</li><li><strong>Data Transfer Rates</strong> 11n: 40MHZ (300 Mbps, 270 Mbps, 240 Mbps, 180 Mbps, 120 Mbps, 90 Mbps, 60 Mbps, 30 Mbps)20MHZ (144 Mbps, 130 Mbps, 115 Mbps, 86 Mbps, 57 Mbps, 43 Mbps, 28 Mbps, 14 Mbps) (Auto-Sense)801.11g:(54Mbps, 48Mbps, 36Mbps, 24Mbps, 18Mbps, 12Mbps, 11Mbps, 9Mbps, 6Mbps)802.11b:(11Mbps,9Mbps, 6Mbps, 5, 5Mbps, 2Mbps, 1Mbps)</li><li><strong>Antenna</strong>&nbsp; 2 x 5dBi Fixed Antenna</li><li><strong>Dimension&nbsp;</strong> 183 mm(L)*125.2 mm(W)*30.72 mm(H)</li><li><strong>Operating Temperature&nbsp;</strong> 0° to 40° C</li><li><strong>Operating Humidity</strong>&nbsp; 10% to 90% RH non-condensing</li></ul>', 'uploads/products/meta/nQ4qbFWxaZV5kp4d0pBnQg9gwNCkiU8y1N1S8Dvl.jpeg', NULL, 'MT-Link-Router-MT-WR850N-40HDh', 0.00, 1, 0.00, NULL, 0, NULL, NULL, '2020-09-16 21:00:22', '2020-10-11 19:19:19'),
(56, 'tanda o3 km outdoor CPE', 'admin', 12, 4, 7, NULL, 22, '[\"uploads\\/products\\/photos\\/XpEm1ga9UD9jyzf2PFwqhLaUeSYt30RRJL0AVi4v.png\",\"uploads\\/products\\/photos\\/yLgJ0FYTNr7RcVVy9GaKTRwQTHPTCDushcm8Uazk.jpeg\"]', 'uploads/products/thumbnail/Y7RGToe21udMHSRTLM0k875jTQlstYOUlW9VU3Ox.jpeg', NULL, NULL, 'youtube', NULL, 'outdoor ,1 km outdoor router', 'bhnm', 4500.00, 3700.00, 1, '[\"1\"]', '[{\"attribute_id\":\"1\",\"values\":[\"m\",\"lg\"]}]', '[]', NULL, 0, 1, 1, 24, 'pcs', 1, 300.00, 'amount', 0.00, 'amount', 'free', 0.00, 19, 'outdoor wifi router', NULL, 'uploads/products/meta/NSWMu8s66CLWv3cPmP8FgLr6ygfc1Va2z42VVdro.jpeg', NULL, 'tanda-o3-km-outdoor-CPE-i3gIU', 0.00, 1, 0.00, 'E6262011029000372', 0, NULL, NULL, '2021-03-04 05:09:32', '2021-03-04 05:09:32'),
(57, 'Unstitched Cotton Block Printed Salwar Kameez - Women Clothing', 'admin', 12, 1, 1, 1, 12, '[\"uploads\\/products\\/photos\\/kRpYbnwp2W21TO36wuohRpz7OhyXIA6UQiSgHWn7.jpeg\",\"uploads\\/products\\/photos\\/SfpJ8zMFSzlEPpvKhLMRKwVwUE0CnRseQXHKqqoW.jpeg\"]', 'uploads/products/thumbnail/4ik0urXPhMd4xXdOrQmzPxZUU1XQkyRhUjQNfOCd.jpeg', 'uploads/products/featured/4VctXpSrYBbTKbMh9hkVrhvIbOhjMgq70AhGGLaw.jpeg', 'uploads/products/flash_deal/mP3Fqp1o8tSYvxpf54cHIap3nL4LPDBExqzJ6F3g.jpeg', 'youtube', NULL, '', NULL, 700.00, 600.00, 0, '[]', '[]', '[]', NULL, 0, 1, 1, 0, '2', 1, 0.00, 'amount', 0.00, 'amount', 'flat_rate', 0.00, 1, NULL, NULL, NULL, NULL, 'Unstitched-Cotton-Block-Printed-Salwar-Kameez---Women-Clothing-HIJ61', 0.00, 1, 0.00, NULL, 0, NULL, NULL, '2021-03-04 05:14:12', '2021-03-04 05:14:12'),
(58, 'Unstitched Cotton Block Printed Salwar Kameez - Women Clothing', 'admin', 12, 1, 1, 1, 12, '[\"uploads\\/products\\/photos\\/kRpYbnwp2W21TO36wuohRpz7OhyXIA6UQiSgHWn7.jpeg\",\"uploads\\/products\\/photos\\/SfpJ8zMFSzlEPpvKhLMRKwVwUE0CnRseQXHKqqoW.jpeg\"]', 'uploads/products/thumbnail/4ik0urXPhMd4xXdOrQmzPxZUU1XQkyRhUjQNfOCd.jpeg', 'uploads/products/featured/4VctXpSrYBbTKbMh9hkVrhvIbOhjMgq70AhGGLaw.jpeg', 'uploads/products/flash_deal/mP3Fqp1o8tSYvxpf54cHIap3nL4LPDBExqzJ6F3g.jpeg', 'youtube', NULL, '', NULL, 700.00, 600.00, 0, '[]', '[]', '[]', NULL, 0, 1, 1, 0, '2', 1, 0.00, 'amount', 0.00, 'amount', 'flat_rate', 0.00, 1, NULL, NULL, NULL, NULL, 'Unstitched-Cotton-Block-Printed-Salwar-Kameez---Women-Clothing-czrBx', 0.00, 1, 0.00, NULL, 0, NULL, NULL, '2021-03-04 05:14:18', '2021-03-04 05:14:18');
INSERT INTO `products` (`id`, `name`, `added_by`, `user_id`, `category_id`, `subcategory_id`, `subsubcategory_id`, `brand_id`, `photos`, `thumbnail_img`, `featured_img`, `flash_deal_img`, `video_provider`, `video_link`, `tags`, `description`, `unit_price`, `purchase_price`, `variant_product`, `attributes`, `choice_options`, `colors`, `variations`, `todays_deal`, `published`, `featured`, `current_stock`, `unit`, `min_qty`, `discount`, `discount_type`, `tax`, `tax_type`, `shipping_type`, `shipping_cost`, `num_of_sale`, `meta_title`, `meta_description`, `meta_img`, `pdf`, `slug`, `earn_point`, `refundable`, `rating`, `barcode`, `digital`, `file_name`, `file_path`, `created_at`, `updated_at`) VALUES
(59, 'Unstitched Cotton Block Printed Salwar Kameez - Women Clothing', 'admin', 12, 1, 1, 1, 12, '[\"uploads\\/products\\/photos\\/kRpYbnwp2W21TO36wuohRpz7OhyXIA6UQiSgHWn7.jpeg\",\"uploads\\/products\\/photos\\/SfpJ8zMFSzlEPpvKhLMRKwVwUE0CnRseQXHKqqoW.jpeg\"]', 'uploads/products/thumbnail/4ik0urXPhMd4xXdOrQmzPxZUU1XQkyRhUjQNfOCd.jpeg', 'uploads/products/featured/4VctXpSrYBbTKbMh9hkVrhvIbOhjMgq70AhGGLaw.jpeg', 'uploads/products/flash_deal/mP3Fqp1o8tSYvxpf54cHIap3nL4LPDBExqzJ6F3g.jpeg', 'youtube', NULL, '', NULL, 700.00, 600.00, 0, '[]', '[]', '[]', NULL, 0, 1, 1, 0, '2', 1, 0.00, 'amount', 0.00, 'amount', 'flat_rate', 0.00, 1, NULL, NULL, NULL, NULL, 'Unstitched-Cotton-Block-Printed-Salwar-Kameez---Women-Clothing-dyZ48', 0.00, 1, 0.00, NULL, 0, NULL, NULL, '2021-03-04 05:14:45', '2021-03-04 05:14:45'),
(60, 'Summer Strickland', 'admin', 12, 1, 2, NULL, 2, '[\"uploads\\/products\\/photos\\/PlRLWfKyuudgv4MBb34WQQ9NVH5DwJTiqUxFx0uj.jpeg\",\"uploads\\/products\\/photos\\/gCUbj4k9GIr4Qdvxvnkmi4Rd5z65NM2y1BVt5sBi.jpeg\"]', 'uploads/products/thumbnail/93ITmFds4lgFazyztvmKz96llvm1vpOGQZva3GnA.jpeg', NULL, NULL, 'youtube', NULL, 'dsad', 'gdfgd', 250.00, 230.00, 0, '[]', '[]', '[]', NULL, 0, 1, 1, 0, '34', 1, 0.00, 'amount', 0.00, 'amount', 'flat_rate', 0.00, 0, 'Summer Strickland', 'gdfgd', 'uploads/products/meta/93ITmFds4lgFazyztvmKz96llvm1vpOGQZva3GnA.jpeg', NULL, 'Summer-Strickland-0tIab', 0.00, 1, 0.00, NULL, 0, NULL, NULL, '2021-03-04 05:20:17', '2021-03-04 05:21:07'),
(61, 'Summer Strickland', 'admin', 12, 1, 2, NULL, 2, '[\"uploads\\/products\\/photos\\/PlRLWfKyuudgv4MBb34WQQ9NVH5DwJTiqUxFx0uj.jpeg\",\"uploads\\/products\\/photos\\/gCUbj4k9GIr4Qdvxvnkmi4Rd5z65NM2y1BVt5sBi.jpeg\"]', 'uploads/products/thumbnail/93ITmFds4lgFazyztvmKz96llvm1vpOGQZva3GnA.jpeg', NULL, NULL, 'youtube', NULL, 'dsad', 'gdfgd', 250.00, 230.00, 0, '[]', '[]', '[]', NULL, 0, 1, 1, 0, '34', 1, 0.00, 'amount', 0.00, 'amount', 'flat_rate', 0.00, 0, 'Summer Strickland', 'gdfgd', 'uploads/products/meta/93ITmFds4lgFazyztvmKz96llvm1vpOGQZva3GnA.jpeg', NULL, 'Summer-Strickland-vOz55', 0.00, 1, 0.00, NULL, 0, NULL, NULL, '2021-03-04 05:27:58', '2021-03-04 05:27:58'),
(62, 'Summer Strickland', 'admin', 12, 1, 2, NULL, 2, '[\"uploads\\/products\\/photos\\/PlRLWfKyuudgv4MBb34WQQ9NVH5DwJTiqUxFx0uj.jpeg\",\"uploads\\/products\\/photos\\/gCUbj4k9GIr4Qdvxvnkmi4Rd5z65NM2y1BVt5sBi.jpeg\"]', 'uploads/products/thumbnail/93ITmFds4lgFazyztvmKz96llvm1vpOGQZva3GnA.jpeg', NULL, NULL, 'youtube', NULL, 'dsad', 'gdfgd', 250.00, 230.00, 0, '[]', '[]', '[]', NULL, 0, 1, 1, 0, '34', 1, 0.00, 'amount', 0.00, 'amount', 'flat_rate', 0.00, 0, 'Summer Strickland', 'gdfgd', 'uploads/products/meta/93ITmFds4lgFazyztvmKz96llvm1vpOGQZva3GnA.jpeg', NULL, 'Summer-Strickland-vLG25', 0.00, 1, 0.00, NULL, 0, NULL, NULL, '2021-03-04 05:28:02', '2021-03-04 05:28:02'),
(63, 'T Strickland', 'admin', 12, 1, 3, 7, 2, '[\"uploads\\/products\\/photos\\/qq3wi0jkpX996PwKkOSkg2kxlbGo1Dhc3oQWI358.jpeg\"]', 'uploads/products/thumbnail/avu4kNMhlHdeB5ngPAJg6PrYEO3CQrQImlfdt3ni.jpeg', NULL, NULL, 'youtube', NULL, 'dsad', 'gdfgd', 250.00, 230.00, 0, '[]', '[]', '[]', NULL, 0, 1, 1, 0, '34', 1, 0.00, 'amount', 0.00, 'amount', 'flat_rate', 0.00, 0, 'Summer Strickland', 'gdfgd', NULL, NULL, 'T-Strickland-VNJFu', 0.00, 1, 0.00, NULL, 0, NULL, NULL, '2021-03-04 05:28:28', '2021-03-04 05:29:52'),
(64, 'T Strickland', 'admin', 12, 1, 3, 7, 2, '[\"uploads\\/products\\/photos\\/qq3wi0jkpX996PwKkOSkg2kxlbGo1Dhc3oQWI358.jpeg\"]', 'uploads/products/thumbnail/avu4kNMhlHdeB5ngPAJg6PrYEO3CQrQImlfdt3ni.jpeg', NULL, NULL, 'youtube', NULL, 'dsad', 'gdfgd', 250.00, 230.00, 0, '[]', '[]', '[]', NULL, 0, 1, 1, 0, '34', 1, 0.00, 'amount', 0.00, 'amount', 'flat_rate', 0.00, 0, 'Summer Strickland', 'gdfgd', NULL, NULL, 'T-Strickland-C7kJW', 0.00, 1, 0.00, NULL, 0, NULL, NULL, '2021-03-04 05:30:11', '2021-03-04 05:30:11'),
(65, 'T Strickland', 'admin', 12, 1, 3, 7, 2, '[\"uploads\\/products\\/photos\\/qq3wi0jkpX996PwKkOSkg2kxlbGo1Dhc3oQWI358.jpeg\"]', 'uploads/products/thumbnail/avu4kNMhlHdeB5ngPAJg6PrYEO3CQrQImlfdt3ni.jpeg', NULL, NULL, 'youtube', NULL, 'dsad', 'gdfgd', 250.00, 230.00, 0, '[]', '[]', '[]', NULL, 0, 1, 1, 0, '34', 1, 0.00, 'amount', 0.00, 'amount', 'flat_rate', 0.00, 0, 'Summer Strickland', 'gdfgd', NULL, NULL, 'T-Strickland-88Ri5', 0.00, 1, 0.00, NULL, 0, NULL, NULL, '2021-03-04 05:30:15', '2021-03-04 05:30:15'),
(70, 'shose', 'admin', 12, 2, 6, 14, 2, '[\"uploads\\/products\\/photos\\/ROvcbKm94sq7JvzdcHx4gteolTslrkUpj4XU9zIg.jpeg\"]', 'uploads/products/thumbnail/qCCNVIB77q1DLyon0G4byMaOlK6uwJqNjGIx0JBC.jpeg', NULL, NULL, 'youtube', NULL, '', 'gdsffff', 260.00, 250.00, 0, '[]', '[]', '[]', NULL, 0, 1, 1, 16, '34', 1, 0.00, 'amount', 0.00, 'amount', 'flat_rate', 0.00, 0, 'shose', 'gdsffff', 'uploads/products/meta/qCCNVIB77q1DLyon0G4byMaOlK6uwJqNjGIx0JBC.jpeg', NULL, 'shose-vtsLe', 0.00, 1, 0.00, NULL, 0, NULL, NULL, '2021-03-04 06:06:30', '2021-03-04 06:09:12'),
(71, 'shose', 'admin', 12, 2, 6, 14, 2, '[\"uploads\\/products\\/photos\\/ROvcbKm94sq7JvzdcHx4gteolTslrkUpj4XU9zIg.jpeg\"]', 'uploads/products/thumbnail/qCCNVIB77q1DLyon0G4byMaOlK6uwJqNjGIx0JBC.jpeg', NULL, NULL, 'youtube', NULL, '', 'gdsffff', 260.00, 250.00, 0, '[]', '[]', '[]', NULL, 0, 1, 1, 16, '34', 1, 0.00, 'amount', 0.00, 'amount', 'flat_rate', 0.00, 0, 'shose', 'gdsffff', 'uploads/products/meta/qCCNVIB77q1DLyon0G4byMaOlK6uwJqNjGIx0JBC.jpeg', NULL, 'shose-OQWXA', 0.00, 1, 0.00, NULL, 0, NULL, NULL, '2021-03-04 06:11:47', '2021-03-04 06:11:47'),
(72, 'shose', 'admin', 12, 2, 6, 14, 2, '[\"uploads\\/products\\/photos\\/ROvcbKm94sq7JvzdcHx4gteolTslrkUpj4XU9zIg.jpeg\"]', 'uploads/products/thumbnail/qCCNVIB77q1DLyon0G4byMaOlK6uwJqNjGIx0JBC.jpeg', NULL, NULL, 'youtube', NULL, '', 'gdsffff', 260.00, 250.00, 0, '[]', '[]', '[]', NULL, 0, 1, 1, 16, '34', 1, 0.00, 'amount', 0.00, 'amount', 'flat_rate', 0.00, 0, 'shose', 'gdsffff', 'uploads/products/meta/qCCNVIB77q1DLyon0G4byMaOlK6uwJqNjGIx0JBC.jpeg', NULL, 'shose-lmWyU', 0.00, 1, 0.00, NULL, 0, NULL, NULL, '2021-03-04 06:11:51', '2021-03-04 06:11:51'),
(73, 'sofa', 'admin', 12, 2, 5, 13, 2, '[\"uploads\\/products\\/photos\\/3k2M1UcYRtj6Zm4uNnqelQii5gFdjnfY0cbYRRTp.jpeg\"]', 'uploads/products/thumbnail/4LnhFu6UZg3P4eMRdaD2dlt4jxIM6YXwmg4xyr60.jpeg', NULL, NULL, 'youtube', NULL, '', 'gdsffff', 260.00, 250.00, 0, '[]', '[]', '[]', NULL, 0, 1, 1, 16, '34', 1, 0.00, 'amount', 0.00, 'amount', 'flat_rate', 0.00, 0, 'sofa', 'gdsffff', 'uploads/products/meta/jrMgFaHXnrU45i3YG60n2ZPndzp1ZQXRkNmkgJ6v.jpeg', NULL, 'sofa-U3McQ', 0.00, 1, 0.00, NULL, 0, NULL, NULL, '2021-03-04 06:13:17', '2021-03-04 06:15:03'),
(74, 'sofa', 'admin', 12, 2, 5, 13, 2, '[\"uploads\\/products\\/photos\\/3k2M1UcYRtj6Zm4uNnqelQii5gFdjnfY0cbYRRTp.jpeg\"]', 'uploads/products/thumbnail/4LnhFu6UZg3P4eMRdaD2dlt4jxIM6YXwmg4xyr60.jpeg', NULL, NULL, 'youtube', NULL, '', 'gdsffff', 260.00, 250.00, 0, '[]', '[]', '[]', NULL, 0, 1, 1, 16, '34', 1, 0.00, 'amount', 0.00, 'amount', 'flat_rate', 0.00, 0, 'sofa', 'gdsffff', 'uploads/products/meta/jrMgFaHXnrU45i3YG60n2ZPndzp1ZQXRkNmkgJ6v.jpeg', NULL, 'sofa-LUs4L', 0.00, 1, 0.00, NULL, 0, NULL, NULL, '2021-03-04 06:15:19', '2021-03-04 06:15:19'),
(75, 'sofa', 'admin', 12, 2, 5, 13, 2, '[\"uploads\\/products\\/photos\\/3k2M1UcYRtj6Zm4uNnqelQii5gFdjnfY0cbYRRTp.jpeg\"]', 'uploads/products/thumbnail/4LnhFu6UZg3P4eMRdaD2dlt4jxIM6YXwmg4xyr60.jpeg', NULL, NULL, 'youtube', NULL, '', 'gdsffff', 260.00, 250.00, 0, '[]', '[]', '[]', NULL, 0, 1, 1, 16, '34', 1, 0.00, 'amount', 0.00, 'amount', 'flat_rate', 0.00, 0, 'sofa', 'gdsffff', 'uploads/products/meta/jrMgFaHXnrU45i3YG60n2ZPndzp1ZQXRkNmkgJ6v.jpeg', NULL, 'sofa-vNO1A', 0.00, 1, 0.00, NULL, 0, NULL, NULL, '2021-03-04 06:15:23', '2021-03-04 06:15:23'),
(77, 'tupi2', 'admin', 12, 2, 4, 12, 2, '[\"uploads\\/products\\/photos\\/7R4O2BCVSyXCEKaRG8U6WC8D55G7pQsTldo71v3o.jpeg\"]', 'uploads/products/thumbnail/p8Rh2bK5ksAjugqABb0qXXxaoai5b0hdKxVEak2V.jpeg', NULL, NULL, 'youtube', NULL, '', 'gdsffff', 260.00, 250.00, 0, '[]', '[]', '[]', NULL, 0, 1, 1, 16, '34', 1, 0.00, 'amount', 0.00, 'amount', 'flat_rate', 0.00, 0, 'sofa', 'gdsffff', 'uploads/products/meta/jrMgFaHXnrU45i3YG60n2ZPndzp1ZQXRkNmkgJ6v.jpeg', NULL, 'tupi2-JABfF', 0.00, 1, 0.00, NULL, 0, NULL, NULL, '2021-03-04 06:16:43', '2021-03-04 09:12:19'),
(78, 'tupi1', 'admin', 12, 2, 4, 12, 2, '[\"uploads\\/products\\/photos\\/7R4O2BCVSyXCEKaRG8U6WC8D55G7pQsTldo71v3o.jpeg\"]', 'uploads/products/thumbnail/cUc4KuTJKgRcRtDQCKRzx4q4rhwVJyHB4X4nPzUM.jpeg', NULL, NULL, 'youtube', NULL, '', 'gdsffff', 260.00, 250.00, 0, '[]', '[]', '[]', NULL, 0, 1, 1, 16, '34', 1, 0.00, 'amount', 0.00, 'amount', 'flat_rate', 0.00, 0, 'sofa', 'gdsffff', 'uploads/products/meta/jrMgFaHXnrU45i3YG60n2ZPndzp1ZQXRkNmkgJ6v.jpeg', NULL, 'tupi1-ZWIAd', 0.00, 1, 0.00, NULL, 0, NULL, NULL, '2021-03-04 06:19:18', '2021-03-04 09:11:23'),
(79, 'tupi', 'admin', 12, 2, 4, 12, 2, '[\"uploads\\/products\\/photos\\/7R4O2BCVSyXCEKaRG8U6WC8D55G7pQsTldo71v3o.jpeg\"]', 'uploads/products/thumbnail/p8Rh2bK5ksAjugqABb0qXXxaoai5b0hdKxVEak2V.jpeg', NULL, NULL, 'youtube', NULL, '', 'gdsffff', 260.00, 250.00, 0, '[]', '[]', '[]', NULL, 0, 1, 1, 16, '34', 1, 0.00, 'amount', 0.00, 'amount', 'flat_rate', 0.00, 0, 'sofa', 'gdsffff', 'uploads/products/meta/jrMgFaHXnrU45i3YG60n2ZPndzp1ZQXRkNmkgJ6v.jpeg', NULL, 'tupi-x9mHF', 0.00, 1, 0.00, NULL, 0, NULL, NULL, '2021-03-04 06:19:22', '2021-03-04 06:19:22');

-- --------------------------------------------------------

--
-- Table structure for table `product_stocks`
--

DROP TABLE IF EXISTS `product_stocks`;
CREATE TABLE IF NOT EXISTS `product_stocks` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `variant` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sku` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `price` double(10,2) NOT NULL DEFAULT 0.00,
  `qty` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `product_stocks`
--

INSERT INTO `product_stocks` (`id`, `product_id`, `variant`, `sku`, `price`, `qty`, `created_at`, `updated_at`) VALUES
(1, 53, 'Aqua-38', 't-Aqua-38', 500.00, 10, '2021-01-26 09:44:36', '2021-01-26 09:44:36'),
(2, 53, 'Aqua-40', 't-Aqua-40', 500.00, 10, '2021-01-26 09:44:36', '2021-01-26 09:44:36'),
(3, 52, 'Aqua-40', 't-Aqua-40', 400.00, 40, '2021-01-26 09:56:39', '2021-01-26 09:56:39'),
(4, 52, 'Aqua-46', 't-Aqua-46', 400.00, 100, '2021-01-26 09:56:39', '2021-01-26 09:56:39'),
(5, 52, 'Aquamarine-40', 't-Aquamarine-40', 400.00, 50, '2021-01-26 09:56:39', '2021-01-26 09:56:39'),
(6, 52, 'Aquamarine-46', 't-Aquamarine-46', 400.00, 98, '2021-01-26 09:56:39', '2021-01-26 09:58:03'),
(15, 54, 'Amethyst-S-tat', 't-Amethyst-S-tat', 500.00, 10, '2021-01-31 06:45:24', '2021-01-31 06:45:24'),
(16, 54, 'Amethyst-S-cotton', 't-Amethyst-S-cotton', 500.00, 10, '2021-01-31 06:45:24', '2021-01-31 06:45:24'),
(17, 54, 'Amethyst-M-tat', 't-Amethyst-M-tat', 500.00, 10, '2021-01-31 06:45:24', '2021-01-31 06:45:24'),
(18, 54, 'Amethyst-M-cotton', 't-Amethyst-M-cotton', 500.00, 10, '2021-01-31 06:45:24', '2021-01-31 06:45:24'),
(19, 54, 'Amethyst-XL-tat', 't-Amethyst-XL-tat', 500.00, 10, '2021-01-31 06:45:24', '2021-01-31 06:45:24'),
(20, 54, 'Amethyst-XL-cotton', 't-Amethyst-XL-cotton', 500.00, 10, '2021-01-31 06:45:24', '2021-01-31 06:45:24'),
(21, 54, 'Amethyst-XXL-tat', 't-Amethyst-XXL-tat', 500.00, 10, '2021-01-31 06:45:24', '2021-01-31 06:45:24'),
(22, 54, 'Amethyst-XXL-cotton', 't-Amethyst-XXL-cotton', 500.00, 10, '2021-01-31 06:45:24', '2021-01-31 06:45:24'),
(23, 54, 'Aqua-S-tat', 't-Aqua-S-tat', 500.00, 10, '2021-01-31 06:45:24', '2021-01-31 06:45:24'),
(24, 54, 'Aqua-S-cotton', 't-Aqua-S-cotton', 500.00, 10, '2021-01-31 06:45:24', '2021-01-31 06:45:24'),
(25, 54, 'Aqua-M-tat', 't-Aqua-M-tat', 500.00, 10, '2021-01-31 06:45:24', '2021-01-31 06:45:24'),
(26, 54, 'Aqua-M-cotton', 't-Aqua-M-cotton', 500.00, 10, '2021-01-31 06:45:24', '2021-01-31 06:45:24'),
(27, 54, 'Aqua-XL-tat', 't-Aqua-XL-tat', 500.00, 10, '2021-01-31 06:45:24', '2021-01-31 06:45:24'),
(28, 54, 'Aqua-XL-cotton', 't-Aqua-XL-cotton', 500.00, 10, '2021-01-31 06:45:24', '2021-01-31 06:45:24'),
(29, 54, 'Aqua-XXL-tat', 't-Aqua-XXL-tat', 500.00, 10, '2021-01-31 06:45:24', '2021-01-31 06:45:24'),
(30, 54, 'Aqua-XXL-cotton', 't-Aqua-XXL-cotton', 510.00, 10, '2021-01-31 06:45:24', '2021-01-31 06:45:24'),
(31, 51, 'AliceBlue-m', 'tokoC-AliceBlue-m', 4500.00, 15, '2021-03-04 04:31:48', '2021-03-04 04:31:48'),
(32, 51, 'AliceBlue-lg', 'tokoC-AliceBlue-lg', 4500.00, 25, '2021-03-04 04:31:48', '2021-03-04 04:31:48'),
(33, 51, 'm', 'tokoC-m', 4500.00, 10, '2021-03-04 04:33:01', '2021-03-04 04:33:01'),
(34, 51, 'lg', 'tokoC-lg', 4500.00, 10, '2021-03-04 04:33:01', '2021-03-04 04:33:01');

-- --------------------------------------------------------

--
-- Table structure for table `refund_requests`
--

DROP TABLE IF EXISTS `refund_requests`;
CREATE TABLE IF NOT EXISTS `refund_requests` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `order_detail_id` int(11) NOT NULL,
  `seller_id` int(11) NOT NULL,
  `seller_approval` int(1) NOT NULL DEFAULT 0,
  `admin_approval` int(1) NOT NULL DEFAULT 0,
  `refund_amount` double(8,2) NOT NULL DEFAULT 0.00,
  `reason` longtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `admin_seen` int(11) NOT NULL,
  `refund_status` int(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `reviews`
--

DROP TABLE IF EXISTS `reviews`;
CREATE TABLE IF NOT EXISTS `reviews` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `rating` int(11) NOT NULL DEFAULT 0,
  `comment` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `status` int(1) NOT NULL DEFAULT 1,
  `viewed` int(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
CREATE TABLE IF NOT EXISTS `roles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `permissions` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `permissions`, `created_at`, `updated_at`) VALUES
(1, 'Manager', '[\"1\",\"2\",\"4\"]', '2018-10-10 04:39:47', '2018-10-10 04:51:37'),
(2, 'Accountant', '[\"2\",\"3\"]', '2018-10-10 04:52:09', '2018-10-10 04:52:09');

-- --------------------------------------------------------

--
-- Table structure for table `searches`
--

DROP TABLE IF EXISTS `searches`;
CREATE TABLE IF NOT EXISTS `searches` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `query` varchar(1000) COLLATE utf8_unicode_ci NOT NULL,
  `count` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `searches`
--

INSERT INTO `searches` (`id`, `query`, `count`, `created_at`, `updated_at`) VALUES
(2, 'dcs', 6, '2020-03-08 00:29:09', '2020-09-28 08:11:35'),
(3, 'das', 8, '2020-03-08 00:29:15', '2020-09-28 08:11:33'),
(4, 'mikrotikrb4011', 6, '2020-07-05 18:01:22', '2020-09-28 08:11:36'),
(5, 'mikrotikrb1100', 8, '2020-07-05 18:02:11', '2020-09-28 08:11:34'),
(6, 'mikrotikrb1100 ahx4', 1, '2020-07-05 18:02:25', '2020-07-05 18:02:25'),
(7, 'White board', 7, '2020-07-21 07:52:05', '2020-09-28 08:11:34'),
(8, 'Eid cow', 1, '2020-07-21 13:08:44', '2020-07-21 13:08:44');

-- --------------------------------------------------------

--
-- Table structure for table `sellers`
--

DROP TABLE IF EXISTS `sellers`;
CREATE TABLE IF NOT EXISTS `sellers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `verification_status` int(1) NOT NULL DEFAULT 0,
  `verification_info` longtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `cash_on_delivery_status` int(1) NOT NULL DEFAULT 0,
  `sslcommerz_status` int(1) NOT NULL DEFAULT 0,
  `stripe_status` int(1) DEFAULT 0,
  `paypal_status` int(1) NOT NULL DEFAULT 0,
  `paypal_client_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `paypal_client_secret` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ssl_store_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ssl_password` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `stripe_key` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `stripe_secret` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `instamojo_status` int(1) NOT NULL DEFAULT 0,
  `instamojo_api_key` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `instamojo_token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `razorpay_status` int(1) NOT NULL DEFAULT 0,
  `razorpay_api_key` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `razorpay_secret` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `paystack_status` int(1) NOT NULL DEFAULT 0,
  `paystack_public_key` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `paystack_secret_key` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `voguepay_status` int(1) NOT NULL DEFAULT 0,
  `voguepay_merchand_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `admin_to_pay` double(8,2) NOT NULL DEFAULT 0.00,
  `bank_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `bank_acc_name` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `bank_acc_no` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `bank_routing_no` int(50) DEFAULT NULL,
  `bank_payment_status` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `date` date DEFAULT NULL,
  `delivery` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `sellers`
--

INSERT INTO `sellers` (`id`, `user_id`, `verification_status`, `verification_info`, `cash_on_delivery_status`, `sslcommerz_status`, `stripe_status`, `paypal_status`, `paypal_client_id`, `paypal_client_secret`, `ssl_store_id`, `ssl_password`, `stripe_key`, `stripe_secret`, `instamojo_status`, `instamojo_api_key`, `instamojo_token`, `razorpay_status`, `razorpay_api_key`, `razorpay_secret`, `paystack_status`, `paystack_public_key`, `paystack_secret_key`, `voguepay_status`, `voguepay_merchand_id`, `admin_to_pay`, `bank_name`, `bank_acc_name`, `bank_acc_no`, `bank_routing_no`, `bank_payment_status`, `created_at`, `updated_at`, `date`, `delivery`) VALUES
(1, 3, 1, '[{\"type\":\"text\",\"label\":\"Name\",\"value\":\"Mr. Seller\"},{\"type\":\"select\",\"label\":\"Marital Status\",\"value\":\"Married\"},{\"type\":\"multi_select\",\"label\":\"Company\",\"value\":\"[\\\"Company\\\"]\"},{\"type\":\"select\",\"label\":\"Gender\",\"value\":\"Male\"},{\"type\":\"file\",\"label\":\"Image\",\"value\":\"uploads\\/verification_form\\/CRWqFifcbKqibNzllBhEyUSkV6m1viknGXMEhtiW.png\"}]', 1, 1, 1, 0, NULL, NULL, 'activ5c3c5dac9254d', 'activ5c3c5dac9254d@ssl', 'pk_test_CqAfBW85ZifDyuEOhGaD4ZbE', 'sk_test_mRRMmV4GnBJ4UT7qeLlDe5F8', 0, NULL, NULL, 0, NULL, NULL, 1, 'pk_test_855c5f39d8f662a5d63fabe25ead64fe21018f15', 'sk_test_1175e92519f88e9c665d0b980f53ff1cfffbbc38', 0, NULL, 78.40, NULL, NULL, NULL, NULL, 0, '2018-10-07 04:42:57', '2020-01-26 04:21:11', NULL, 0),
(2, 17, 1, NULL, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, 0, NULL, 0.00, NULL, NULL, NULL, NULL, 0, '2020-09-12 19:01:21', '2020-09-12 19:01:27', NULL, 0),
(3, 36, 1, NULL, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, 0, NULL, 0.00, NULL, NULL, NULL, NULL, 0, '2021-01-26 09:31:03', '2021-01-26 09:48:06', NULL, 0),
(4, 37, 1, NULL, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, 0, NULL, 0.00, NULL, NULL, NULL, NULL, 0, '2021-01-26 10:47:32', '2021-01-26 10:48:21', NULL, 0),
(5, 38, 0, NULL, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, 0, NULL, 0.00, NULL, NULL, NULL, NULL, 0, '2021-01-31 04:26:44', '2021-01-31 04:26:44', NULL, 0),
(6, 40, 0, NULL, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, 0, NULL, 0.00, NULL, NULL, NULL, NULL, 0, '2021-03-03 04:37:59', '2021-03-03 04:37:59', NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `seller_withdraw_requests`
--

DROP TABLE IF EXISTS `seller_withdraw_requests`;
CREATE TABLE IF NOT EXISTS `seller_withdraw_requests` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `amount` double(8,2) DEFAULT NULL,
  `message` longtext DEFAULT NULL,
  `status` int(1) DEFAULT NULL,
  `viewed` int(1) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `seo_settings`
--

DROP TABLE IF EXISTS `seo_settings`;
CREATE TABLE IF NOT EXISTS `seo_settings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `keyword` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `author` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `revisit` int(11) NOT NULL,
  `sitemap_link` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `seo_settings`
--

INSERT INTO `seo_settings` (`id`, `keyword`, `author`, `revisit`, `sitemap_link`, `description`, `created_at`, `updated_at`) VALUES
(1, 'bootstrap,responsive,template,developer', 'bazaarpratidin', 11, 'https://www.bazaarpratidin.com', 'bazaarpratidin', '2020-06-16 14:46:48', '2020-06-16 18:46:48');

-- --------------------------------------------------------

--
-- Table structure for table `shops`
--

DROP TABLE IF EXISTS `shops`;
CREATE TABLE IF NOT EXISTS `shops` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `name` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `logo` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sliders` longtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `address` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `facebook` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `google` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `twitter` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `youtube` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `meta_title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `meta_description` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `pick_up_point_id` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `shipping_cost` double(8,2) NOT NULL DEFAULT 0.00,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `shops`
--

INSERT INTO `shops` (`id`, `user_id`, `name`, `logo`, `sliders`, `address`, `facebook`, `google`, `twitter`, `youtube`, `slug`, `meta_title`, `meta_description`, `pick_up_point_id`, `shipping_cost`, `created_at`, `updated_at`) VALUES
(1, 3, 'Demo Seller Shop', 'shop/logo/Gt1xw7vjTpMnwpADkGSilc35qrAfcw02kuZ36Jdn.png', '[\"uploads\\/shop\\/sliders\\/lToeKDeUyWcxy1HRs2yH37oBLyIwEwyPkqdyXBRO.jpeg\",\"uploads\\/shop\\/sliders\\/asDBJ3Bro1ijNaNnx3Hpnp6uq3n66ndyLczOJ0F6.jpeg\",\"uploads\\/shop\\/sliders\\/ltwUfHND4QP1K7bPFbuOC4i8v6zL9KHJKzex4zaX.jpeg\"]', 'House : Demo, Road : Demo, Section : Demo', 'www.facebook.com', 'www.google.com', 'www.twitter.com', 'www.youtube.com', 'Demo-Seller-Shop-1', 'Demo Seller Shop Title', 'Demo description', NULL, 0.00, '2018-11-27 10:23:13', '2019-08-06 06:43:16'),
(2, 17, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'demo-shop-17', NULL, NULL, NULL, 0.00, '2020-09-12 19:01:21', '2020-09-12 19:01:21'),
(3, 36, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'demo-shop-36', NULL, NULL, NULL, 0.00, '2021-01-26 09:31:03', '2021-01-26 09:31:03'),
(4, 37, 'khanadhana', NULL, NULL, 'Old Dhaka', NULL, NULL, NULL, NULL, 'khanadhana-', NULL, NULL, NULL, 0.00, '2021-01-26 10:47:32', '2021-01-26 10:47:32'),
(5, 38, 'Mohammad Farhad', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Mohammad-Farhad-', NULL, NULL, NULL, 0.00, '2021-01-31 04:26:44', '2021-01-31 04:26:44'),
(6, 40, 'yeapes', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'yeapes-', NULL, NULL, NULL, 0.00, '2021-03-03 04:37:59', '2021-03-03 04:37:59');

-- --------------------------------------------------------

--
-- Table structure for table `sliders`
--

DROP TABLE IF EXISTS `sliders`;
CREATE TABLE IF NOT EXISTS `sliders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `photo` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `published` int(1) NOT NULL DEFAULT 1,
  `link` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `sliders`
--

INSERT INTO `sliders` (`id`, `photo`, `published`, `link`, `created_at`, `updated_at`) VALUES
(11, 'uploads/sliders/CCy04qRu6j934JgWNYGd3zt85GawYvZgK6ecdzOM.png', 0, 'C:\\Users\\user\\Desktop', '2020-06-17 17:15:10', '2020-07-20 10:58:34'),
(16, 'uploads/sliders/GqVfOiaYI4jXveqIZKyZgxGKdOPq03bEvM3NPipJ.png', 1, 'banner01', '2020-06-21 10:26:16', '2020-06-21 10:26:16'),
(18, 'uploads/sliders/aCdEBXx485cJe5mvAmruin03F0P3a5hpzkC6EfZw.jpeg', 1, 'banner4', '2020-06-30 16:15:05', '2020-06-30 16:15:05'),
(19, 'uploads/sliders/8osHZzgmYE9vyVAE9nS6quMz0NuiAATSFbdRpmEJ.jpeg', 1, 'banner3', '2020-07-08 06:12:03', '2020-07-08 06:12:03'),
(20, 'uploads/sliders/uDtMki2e8smi2E3qVPIDjsrWwFtL2IeO531XumIi.jpeg', 0, 'Cow banner', '2020-07-20 11:00:04', '2020-09-02 16:24:03');

-- --------------------------------------------------------

--
-- Table structure for table `staff`
--

DROP TABLE IF EXISTS `staff`;
CREATE TABLE IF NOT EXISTS `staff` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `staff`
--

INSERT INTO `staff` (`id`, `user_id`, `role_id`, `created_at`, `updated_at`) VALUES
(1, 15, 1, '2020-08-11 17:35:22', '2020-08-11 17:35:22'),
(2, 16, 2, '2020-09-12 14:17:42', '2020-09-12 14:17:42'),
(3, 35, 1, '2021-01-26 09:28:56', '2021-01-26 09:28:56');

-- --------------------------------------------------------

--
-- Table structure for table `subscribers`
--

DROP TABLE IF EXISTS `subscribers`;
CREATE TABLE IF NOT EXISTS `subscribers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `subscriptions`
--

DROP TABLE IF EXISTS `subscriptions`;
CREATE TABLE IF NOT EXISTS `subscriptions` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` double NOT NULL,
  `days` int(11) NOT NULL,
  `allowed_products` int(11) NOT NULL,
  `details` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `allowed_delivery` int(11) DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `subscriptions`
--

INSERT INTO `subscriptions` (`id`, `title`, `price`, `days`, `allowed_products`, `details`, `allowed_delivery`, `created_at`, `updated_at`) VALUES
(2, 'basic', 400, 5, 0, 'this is test', 0, NULL, NULL),
(3, 'Free', 0, 2, 3, 'free', 0, NULL, NULL),
(4, 'Premium', 590, 44, 0, 'this is test', 0, NULL, NULL),
(5, 'Premium', 300, 44, 12, 'this istest', 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sub_categories`
--

DROP TABLE IF EXISTS `sub_categories`;
CREATE TABLE IF NOT EXISTS `sub_categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `category_id` int(11) NOT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `meta_title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `meta_description` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `fk_category_id` (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `sub_categories`
--

INSERT INTO `sub_categories` (`id`, `name`, `category_id`, `slug`, `meta_title`, `meta_description`, `created_at`, `updated_at`) VALUES
(1, 'Traditional Clothing $ Clothing', 1, 'Demo-sub-category-1', NULL, NULL, '2019-03-12 06:13:24', '2020-06-16 17:56:35'),
(2, 'Saree', 1, 'Demo-sub-category-2', 'Demo sub category 2', NULL, '2019-03-12 06:13:44', '2020-06-16 17:29:48'),
(3, 'shaloar Kameez', 1, 'Demo-sub-category-3', 'SK', NULL, '2019-03-12 06:13:59', '2020-06-16 17:32:58'),
(4, 'Man sub category2', 2, 'Man-sub-category2', 'Man sub category2', NULL, '2019-03-12 06:18:25', '2021-03-04 05:56:44'),
(5, 'Man sub category1', 2, 'Man-sub-category1', 'Man sub category1', NULL, '2019-03-12 06:18:38', '2021-03-04 05:55:55'),
(6, 'Man sub category', 2, 'Man-sub-category', 'Man sub category', NULL, '2019-03-12 06:18:51', '2021-03-04 05:56:15'),
(7, 'Security Camera', 4, 'Demo-sub-category-1', 'camera, cctv', NULL, '2019-03-12 06:19:05', '2020-06-16 13:39:48'),
(8, 'Mobiles', 4, 'Demo-sub-category-2', 'mobiles', NULL, '2019-03-12 06:19:13', '2020-06-16 13:23:25'),
(9, 'Laptops', 4, '1111', 'laptops', NULL, '2019-03-12 06:19:22', '2020-06-16 13:24:50'),
(10, 'Tablets', 4, 'Tablets-i6alm', 'Tablet', NULL, '2020-06-16 13:27:47', '2020-06-16 13:27:47'),
(11, 'Desktops', 4, 'Desktops-ADD75', 'computer, Desktop', NULL, '2020-06-16 13:29:06', '2020-06-16 13:29:06'),
(12, 'cameras', 4, 'cameras-bjdqH', 'cameras', NULL, '2020-06-16 13:29:44', '2020-06-16 13:29:44'),
(13, 'Mobiles Accessories', 5, 'Mobiles-Accessories-1bKtV', 'cable, powerbanks', NULL, '2020-06-16 13:50:06', '2020-06-16 13:50:06'),
(14, 'Audio', 5, 'Audio-NRDtp', NULL, NULL, '2020-06-16 13:55:34', '2020-06-16 13:55:34'),
(15, 'camera', 5, 'camera-i0Ahc', NULL, NULL, '2020-06-16 14:03:40', '2020-06-16 14:03:40'),
(16, 'Computer', 5, 'Computer-QS1bq', 'Computer Accessories', NULL, '2020-06-16 14:06:04', '2020-06-16 14:06:04'),
(17, 'Storages', 5, 'Storages-r9Ide', NULL, NULL, '2020-06-16 14:09:44', '2020-06-16 14:09:44'),
(18, 'Networking & Network Equipment and cable', 4, 'Networking-twZjS', 'NW', NULL, '2020-06-16 15:12:23', '2020-06-16 15:16:22'),
(31, 'Covid-19,Access', 7, 'Covid-19Access-E708q', 'CV', NULL, '2020-06-17 15:17:14', '2020-06-17 15:17:14'),
(32, 'TV & TV Accessories', 6, 'TV--TV-Accessories-zxq4G', 'tv', NULL, '2020-06-18 20:24:01', '2020-06-18 20:24:01'),
(33, 'Routers', 4, 'Routers-xNLm0', 'Router, Wifi router,', NULL, '2020-07-02 18:45:15', '2020-07-02 18:45:15'),
(34, 'Switchs', 4, 'Switchs-NMIGD', 'Networking switch,', NULL, '2020-07-02 20:04:50', '2020-07-02 20:04:50');

-- --------------------------------------------------------

--
-- Table structure for table `sub_sub_categories`
--

DROP TABLE IF EXISTS `sub_sub_categories`;
CREATE TABLE IF NOT EXISTS `sub_sub_categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sub_category_id` int(11) NOT NULL,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `meta_title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `meta_description` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `fk_sub_category_id` (`sub_category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `sub_sub_categories`
--

INSERT INTO `sub_sub_categories` (`id`, `sub_category_id`, `name`, `slug`, `meta_title`, `meta_description`, `created_at`, `updated_at`) VALUES
(1, 1, 'Unstitched Cotton Block Printed Salwar Kameez - Wo', 'Demo-sub-sub-category', 'Demo sub sub category', NULL, '2019-03-12 06:19:49', '2020-06-16 17:58:48'),
(2, 1, 'Demo sub sub category 2', 'Demo-sub-sub-category-2', 'Demo sub sub category 2', NULL, '2019-03-12 06:20:23', '2019-08-06 06:07:19'),
(3, 1, 'Demo sub sub category 3', 'Demo-sub-sub-category-3', 'Demo sub sub category 3', NULL, '2019-03-12 06:20:43', '2019-08-06 06:07:19'),
(4, 2, 'Demo sub sub category 1', 'Demo-sub-sub-category-1', 'Demo sub sub category 1', NULL, '2019-03-12 06:21:28', '2019-08-06 06:07:19'),
(5, 2, 'Demo sub sub category 2', 'Demo-sub-sub-category-2', 'Demo sub sub category 2', NULL, '2019-03-12 06:21:40', '2019-08-06 06:07:19'),
(6, 2, 'Demo sub sub category 3', 'Demo-sub-sub-category-3', 'Demo sub sub category 3', NULL, '2019-03-12 06:21:56', '2019-08-06 06:07:19'),
(7, 3, 'Demo sub sub category 1', 'Demo-sub-sub-category-1', 'Demo sub sub category 1', NULL, '2019-03-12 06:23:31', '2019-08-06 06:07:19'),
(8, 3, 'Demo sub sub category 3', 'Demo-sub-sub-category-3', 'Demo sub sub category 3', NULL, '2019-03-12 06:23:48', '2019-08-06 06:07:19'),
(9, 3, 'Demo sub sub category 3', 'Demo-sub-sub-category-3', 'Demo sub sub category 3', NULL, '2019-03-12 06:24:01', '2019-08-06 06:07:19'),
(10, 4, 'Demo sub sub category 1', 'Demo-sub-sub-category-1', 'Demo sub sub category 1', NULL, '2019-03-12 06:24:37', '2019-08-06 06:07:19'),
(11, 4, 'Demo sub sub category 2', 'Demo-sub-sub-category-2', 'Demo sub sub category 2', NULL, '2019-03-12 06:25:14', '2019-08-06 06:07:19'),
(12, 4, 'Demo sub sub category', 'Demo-sub-sub-category', 'Demo sub sub category', NULL, '2019-03-12 06:25:25', '2019-08-06 06:07:19'),
(13, 5, 'Demo sub sub category 1', 'Demo-sub-sub-category-1', 'Demo sub sub category 1', NULL, '2019-03-12 06:25:58', '2019-08-06 06:07:19'),
(14, 6, 'Demo sub sub category 1', 'Demo-sub-sub-category-1', 'Demo sub sub category 1', NULL, '2019-03-12 06:26:16', '2019-08-06 06:07:19'),
(15, 8, 'oppo Phones', 'Demo-sub-sub-category', 'phones', NULL, '2019-03-12 06:27:17', '2020-06-16 13:36:26'),
(16, 8, 'Sumsung', '2', 'mobile, sumsung', NULL, '2019-03-12 06:27:29', '2020-06-16 13:31:23'),
(17, 8, 'Vivo Phone', 'Demo-sub-sub-category', 'vivo, mobile, phones', NULL, '2019-03-12 06:27:41', '2020-06-16 13:33:22'),
(18, 7, 'cctv camera', 'cctv-camera-YTEel', 'cctv', NULL, '2020-06-16 13:41:06', '2020-06-16 13:41:06'),
(19, 7, 'IP security Camera', 'IP-security-Camera-d2liC', 'ip camera', NULL, '2020-06-16 13:43:33', '2020-06-16 13:43:33'),
(20, 11, 'All-in-one', 'All-in-one-BoOBM', 'computer, Desktop', NULL, '2020-06-16 13:44:14', '2020-06-16 13:46:42'),
(21, 9, 'Laptops & Notebooks', 'Laptops--Notebooks-eNU9A', 'computer, Desktop, laptops', NULL, '2020-06-16 13:46:23', '2020-06-16 13:46:23'),
(22, 13, 'Phones Cases', 'Phones-Cases-TZnkQ', 'mobile caseing', NULL, '2020-06-16 13:51:29', '2020-06-16 13:51:29'),
(23, 13, 'Power Bank', 'Power-Bank-xDKPH', 'battary, powerbank', NULL, '2020-06-16 13:52:18', '2020-06-16 13:52:18'),
(24, 13, 'Cable & Conerters', 'Cable--Conerters-BPdRT', 'cable', NULL, '2020-06-16 13:53:19', '2020-06-16 13:53:19'),
(25, 13, 'charger', 'charger-igA0O', 'mobile charger', NULL, '2020-06-16 13:54:37', '2020-06-16 13:54:37'),
(26, 14, 'Headphones & Headset', 'Headphones--Headset-r3tPW', NULL, NULL, '2020-06-16 13:56:31', '2020-06-16 13:56:31'),
(27, 14, 'Home Enterinment', 'Home-Enterinment-wmMho', NULL, NULL, '2020-06-16 13:57:32', '2020-06-16 13:57:32'),
(28, 14, 'Bluetooth Speaker', 'Bluetooth-Speaker-fgHbm', NULL, NULL, '2020-06-16 13:58:13', '2020-06-16 13:58:13'),
(29, 15, 'Batteries', 'Batteries-XQFwz', 'battarie', NULL, '2020-06-16 14:04:56', '2020-06-16 14:04:56'),
(30, 16, 'Monitors', 'Monitors-HswNM', 'monitor', NULL, '2020-06-16 14:06:46', '2020-06-16 14:06:46'),
(31, 16, 'PC Audio', 'PC-Audio-Z7Sd7', 'pc', NULL, '2020-06-16 14:07:43', '2020-06-16 14:07:43'),
(32, 16, 'keyboards', 'keyboards-JjHom', 'keyboard', NULL, '2020-06-16 14:08:22', '2020-06-16 14:08:22'),
(33, 16, 'Mouse', 'Mouse-yv3vC', NULL, NULL, '2020-06-16 14:09:07', '2020-06-16 14:09:07'),
(34, 17, 'External Hard Drive', 'External-Hard-Drive-ba7Q1', NULL, NULL, '2020-06-16 14:10:34', '2020-06-16 14:10:34'),
(35, 17, 'Internal Hard Drives', 'Internal-Hard-Drives-Fwiae', NULL, NULL, '2020-06-16 14:11:08', '2020-06-16 14:11:08'),
(36, 17, 'OTG', 'OTG-3x78J', NULL, NULL, '2020-06-16 14:11:33', '2020-06-16 14:11:33'),
(37, 18, 'JILONG KL-280G', 'JILONG-KL-280G-Kotwi', 'optical jonter machen', NULL, '2020-06-16 15:17:13', '2020-07-07 12:54:39'),
(44, 31, 'Accessories', 'Accessories-ElXmw', 'cv', NULL, '2020-06-17 15:25:40', '2020-06-17 15:25:40'),
(45, 33, 'TP LInk', 'Routers-C1rHw', 'Router, Wifi router,', NULL, '2020-06-18 11:07:28', '2020-07-02 19:28:29'),
(46, 32, 'LED,LCD,CRT', 'LEDLCDCRT-zQem2', 'tv', NULL, '2020-06-18 20:25:12', '2020-06-18 20:25:12'),
(47, 34, 'tp Link,24 port,16 port,8 port', 'tp-Link24-port16-port8-port-1yKRp', 'Networking switch,', NULL, '2020-07-02 20:07:00', '2020-07-02 20:07:00'),
(48, 18, 'Mikrotik', 'Mikrotik-Q9JSR', 'mikrotik RB,CCR router', NULL, '2020-07-02 20:26:50', '2020-07-02 20:26:50');

-- --------------------------------------------------------

--
-- Table structure for table `tickets`
--

DROP TABLE IF EXISTS `tickets`;
CREATE TABLE IF NOT EXISTS `tickets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` int(6) NOT NULL,
  `user_id` int(11) NOT NULL,
  `subject` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `details` longtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `files` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `status` varchar(10) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'pending',
  `viewed` int(1) NOT NULL DEFAULT 0,
  `client_viewed` int(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ticket_replies`
--

DROP TABLE IF EXISTS `ticket_replies`;
CREATE TABLE IF NOT EXISTS `ticket_replies` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ticket_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `reply` longtext COLLATE utf8_unicode_ci NOT NULL,
  `files` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `referred_by` int(11) DEFAULT NULL,
  `provider_id` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_type` varchar(10) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'customer',
  `name` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `verification_code` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `password` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `avatar` varchar(256) COLLATE utf8_unicode_ci DEFAULT NULL,
  `avatar_original` varchar(256) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address` varchar(300) COLLATE utf8_unicode_ci DEFAULT NULL,
  `country` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `city` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `postal_code` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `customer_package_id` int(11) DEFAULT NULL,
  `remaining_uploads` int(11) DEFAULT NULL,
  `balance` double(8,2) NOT NULL DEFAULT 0.00,
  `referral_code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `referred_by`, `provider_id`, `user_type`, `name`, `email`, `email_verified_at`, `verification_code`, `password`, `remember_token`, `avatar`, `avatar_original`, `address`, `country`, `city`, `postal_code`, `phone`, `customer_package_id`, `remaining_uploads`, `balance`, `referral_code`, `created_at`, `updated_at`) VALUES
(3, NULL, NULL, 'seller', 'md Dollor Hossain', 'abdulbaten2534@gmail.com', '2018-12-11 18:00:00', NULL, '$2y$10$01IGcrhjRXVkFsw3te96NuFu9nbIzHz24jkQRn802II0X/ex28o3i', '1zoU4eQxnOC5yxRWLsTzMNBPpJuOvTk4g3GMUVYIrbGijiXHOfIlFq0wHrIn', 'https://lh3.googleusercontent.com/-7OnRtLyua5Q/AAAAAAAAAAI/AAAAAAAADRk/VqWKMl4f8CI/photo.jpg?sz=50', 'uploads/ucQhvfz4EQXNeTbN8Eif0Cpq5LnOwvg8t7qKNKVs.jpeg', 'Demo address', 'US', 'Demo city', '1234', NULL, NULL, NULL, 0.00, '3dLUoHsR1l', '2018-10-07 04:42:57', '2020-06-15 18:18:50'),
(8, NULL, NULL, 'customer', 'Mr. Customer', 'customer@example.com', '2018-12-11 18:00:00', NULL, '$2y$10$eUKRlkmm2TAug75cfGQ4i.WoUbcJ2uVPqUlVkox.cv4CCyGEIMQEm', '9ndcz5o7xgnuxctJIbvUQcP41QKmgnWCc7JDSnWdHOvipOP2AijpamCNafEe', 'https://lh3.googleusercontent.com/-7OnRtLyua5Q/AAAAAAAAAAI/AAAAAAAADRk/VqWKMl4f8CI/photo.jpg?sz=50', 'uploads/ucQhvfz4EQXNeTbN8Eif0Cpq5LnOwvg8t7qKNKVs.jpeg', 'Demo address', 'US', 'Demo city', '1234', NULL, NULL, NULL, 0.00, '8zJTyXTlTT', '2018-10-07 04:42:57', '2020-03-03 04:26:11'),
(12, NULL, NULL, 'admin', 'Youth Fire IT', 'admin@youthfireit.com', '2020-06-15 17:06:05', NULL, '$2y$10$jmH9KQfcVmpid2mvhP2IM.kse0EjhHwSQk4aq.txrq6VMIbuXf/lG', '0tR5u6nFU6ahnSnje3x1qKHfdBykJVGtCWgGBNBJOdAijaOiC64J7UWmE2rh', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, '2020-06-15 17:33:05', '2020-06-15 17:33:05'),
(14, NULL, NULL, 'customer', 'kawsarahmmed', 'kawsarahmmed6959@gmail.com', '2020-06-26 08:06:20', NULL, '$2y$10$IHItgibxT52zGupfNVOyGeop1RSGur.ixXA1Nnu1MqNpwCmmJs5cG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, '2020-06-26 08:09:20', '2020-06-26 08:09:20'),
(15, NULL, NULL, 'staff', 'mst. hafiza Khatun', 'hafiza6600@gmail.com', NULL, NULL, '$2y$10$7z4gCB2vpMCW2GhvDK1IS.Etre.YK3UMNBKjLXPW/gytECLtmqUtu', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '01919946826', NULL, NULL, 0.00, NULL, '2020-08-11 17:35:22', '2020-08-11 17:35:22'),
(16, NULL, NULL, 'staff', 'md Sohag', 'jamunacomputer2016@gmail.com', NULL, NULL, '$2y$10$CJMlhXhCIWC9ZWBqEptOCOX8S4keQe.8mvn6wgr2.tWllsAh5M4EC', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '01919946826', NULL, NULL, 0.00, NULL, '2020-09-12 14:17:42', '2020-09-12 14:18:11'),
(17, NULL, NULL, 'seller', 'Zaman Computer', 'wasimbar@gmail.com', NULL, NULL, '$2y$10$MFHUCeMZ/aF0OIfwZRU5vODB5mlZuL337DAvg6cowVDX32q7N3gOG', 'DrGxuufT40EGqnt6LgkdMNBWjfUj5VsHP1YDPSgaaku79AyXu6R6BjDU7qBD', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, '2020-09-12 19:01:21', '2020-09-12 19:01:21'),
(18, NULL, NULL, 'customer', 'md ainal Hossain', 'nfc6600@gmail.com', NULL, NULL, '$2y$10$wSLU9dDreuhDLncFr1kY2e2ZOxwyO1kfJCEwI0wjtaBnCuLzAwL2S', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, '2020-09-12 19:13:25', '2020-09-12 19:13:25'),
(36, NULL, NULL, 'seller', 'Mohammad Farhad', 'mohammadfarhad681@gmail.com', '2021-01-26 09:36:10', 'eyJpdiI6IlwvV0J0eE45dTdwd3FTZ2ZrSTdPekpBPT0iLCJ2YWx1ZSI6ImNPSE9YOHFlWEt2R2NoaHJcL3I3bXhnPT0iLCJtYWMiOiIxOGFhMWVhZjRlYzkyMjFlYzc0YjI2MDJjZDA5NzI0NDYwYzQ4M2IxNGZkYmI3MTlmZjEyYzY5Y2YwOWI5NzYxIn0=', '$2y$10$ckNcPmljGh6TNFxUjqcGFukL9AzXSpxbmkBZXvK8AaN1hgjux3wTK', 'if7kqPP1vNTYwjgL1PNh23VNTEGDzAtDMCUoeA18shV7EMDCjNPsQXLgCEel', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, '2021-01-26 09:31:03', '2021-01-26 09:36:10'),
(37, NULL, NULL, 'seller', 'deb', 'roydebbrota@gmail.com', '2021-01-31 09:32:20', 'eyJpdiI6IldBVWpjVmttMzNZSVpybWR2aklBa2c9PSIsInZhbHVlIjoid2JVQlhMY1hzeURISDAyMW9HYTBMUT09IiwibWFjIjoiNGUyZTUyNmNhMDIyYjRjZmUwMzg5YjEwNDAyOTZmYTc0MGMxZGMyMWRmZjdiZTdkOWViNGQxOGZlZTM5MGY4ZCJ9', '$2y$10$lNcCumyS5FXHqFq0sCJs9.KQG5CQb4iAXVRFHhKPG/gFz2JM/ryx2', 'kQTY2ies0W5TYlq6stUqfyyaURowp6VW1rWjeDelUl4AtO4YzFHHS2FN3I2C', NULL, NULL, NULL, NULL, NULL, NULL, '+01924343222', NULL, NULL, 0.00, NULL, '2021-01-26 10:46:18', '2021-01-31 09:32:20'),
(38, NULL, NULL, 'seller', 'Mohammad Farhad', 'forhad@youthfireit.com', '2021-01-31 04:29:22', 'eyJpdiI6InlWb3hUQU1kYkJHSm9WZ3dLT2x4UkE9PSIsInZhbHVlIjoib0dCWStkRVF2U2ZBVVdlRU1mbngyQT09IiwibWFjIjoiYTZkMDQwYTA3Mzg1ZDEwNmNlMTZiMTA3OGU5MDU5YzVjNjdhZTIyMmZmMjM3NGRiNTdkNzY5NjI3OTdkZjBkOCJ9', '$2y$10$DbY7TnpXuh2jUKC4DGd0R.V0awcqa7U4Izn.tM2DANGc3LSoWs6jW', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0183995454', NULL, NULL, 0.00, NULL, '2021-01-31 04:26:44', '2021-01-31 04:29:22'),
(39, NULL, NULL, 'customer', 'Armand Jones', 'wijusavi@mailinator.com', NULL, 'eyJpdiI6ImNrVjhhRm5ZN2NtUjQ1dWNtOXVMN0E9PSIsInZhbHVlIjoiN0NBTmhTQWU4NlFzQUZnaUFnVFo5dz09IiwibWFjIjoiYzg2YWIyYzY4NDgxYTYyOGU3ZTllM2E0YmIzZDExN2ZmYTMzZDYzMzg4ZmZlZWNjMDU3YjA2N2NjYWZhZmI5MiJ9', '$2y$10$Y1bGy7NWnt3vaOk3T0vei.57/mana3L6MsEOjCmK6MUEcaxIexRA2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '+01867734016', NULL, NULL, 0.00, NULL, '2021-03-02 07:21:23', '2021-03-02 07:21:27'),
(40, NULL, NULL, 'seller', 'yeapes', 'yeapes@gmail.com', NULL, NULL, '$2y$10$CyqXF2seSkJnnIR.VfS30OrTsjYPQIlgaOgIJ0Uc3S9M.u2ZJBk.G', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '01867734016', NULL, NULL, 0.00, NULL, '2021-03-03 04:37:59', '2021-03-03 04:37:59');

-- --------------------------------------------------------

--
-- Table structure for table `user_subscriptions`
--

DROP TABLE IF EXISTS `user_subscriptions`;
CREATE TABLE IF NOT EXISTS `user_subscriptions` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `subscription_id` int(11) NOT NULL,
  `title` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` double NOT NULL,
  `days` int(11) NOT NULL,
  `details` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `allowed_products` int(11) NOT NULL,
  `method` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `txnid` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `charge_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `delivery` int(11) NOT NULL DEFAULT 0,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `wallets`
--

DROP TABLE IF EXISTS `wallets`;
CREATE TABLE IF NOT EXISTS `wallets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `amount` double(8,2) NOT NULL,
  `payment_method` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `payment_details` longtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `wishlists`
--

DROP TABLE IF EXISTS `wishlists`;
CREATE TABLE IF NOT EXISTS `wishlists` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `wishlists`
--

INSERT INTO `wishlists` (`id`, `user_id`, `product_id`, `created_at`, `updated_at`) VALUES
(1, 23, 28, '2020-10-22 10:38:02', '2020-10-22 10:38:02'),
(2, 23, 25, '2020-10-22 10:38:12', '2020-10-22 10:38:12');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
