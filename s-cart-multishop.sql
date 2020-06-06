-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 25, 2019 at 11:13 PM
-- Server version: 10.1.29-MariaDB
-- PHP Version: 7.1.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `s-cart-multishop`
--

-- --------------------------------------------------------

--
-- Table structure for table `activitylist`
--

CREATE TABLE `activitylist` (
  `id` int(11) NOT NULL,
  `type` varchar(200) NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '0',
  `notes` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `activitylist`
--

INSERT INTO `activitylist` (`id`, `type`, `active`, `notes`) VALUES
(1, 'Clothes', 1, 'Clothes'),
(2, 'Mobiles&Accesciories', 1, 'Mobiles&Accesciories'),
(3, 'Labtop&PCs', 1, 'Labtop&PCs'),
(4, 'Books', 1, 'Books'),
(6, 'Beauty&Health', 1, 'Beauty&Health'),
(7, 'Food&Drinks', 1, 'Food&Drinks'),
(8, 'Spare Parts Motors', 1, 'spare parts Motors');

-- --------------------------------------------------------

--
-- Table structure for table `admin_menu`
--

CREATE TABLE `admin_menu` (
  `id` int(10) UNSIGNED NOT NULL,
  `parent_id` int(11) NOT NULL DEFAULT '0',
  `order` int(11) NOT NULL DEFAULT '0',
  `title` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `uri` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `permission` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admin_menu`
--

INSERT INTO `admin_menu` (`id`, `parent_id`, `order`, `title`, `icon`, `uri`, `permission`, `active`, `created_at`, `updated_at`) VALUES
(1, 0, 1, 'Index', 'fa-bar-chart', '/', NULL, 1, NULL, NULL),
(2, 0, 2, 'Admin', 'fa-tasks', NULL, NULL, 1, NULL, '2018-12-30 02:36:54'),
(3, 2, 3, 'Users', 'fa-users', 'auth/users', NULL, 1, NULL, NULL),
(4, 2, 4, 'Roles', 'fa-user', 'auth/roles', NULL, 1, NULL, NULL),
(5, 2, 5, 'Permission', 'fa-ban', 'auth/permissions', NULL, 1, NULL, NULL),
(6, 2, 6, 'Menu', 'fa-bars', 'auth/menu', NULL, 0, NULL, NULL),
(7, 2, 7, 'Operation log', 'fa-history', 'auth/logs', NULL, 0, NULL, NULL),
(8, 31, 27, 'Customer', 'fa-user-md', 'shop_customer', NULL, 1, '2018-01-13 08:27:55', '2019-02-09 10:33:31'),
(9, 25, 22, 'Orders', 'fa-shopping-cart', 'shop_order', NULL, 1, '2018-01-13 08:33:55', '2019-02-09 10:33:31'),
(10, 15, 15, 'All products', 'fa-file-photo-o', 'shop_product', NULL, 1, '2018-01-13 08:44:02', '2019-02-09 10:33:31'),
(11, 15, 17, 'Brand', 'fa-bank', 'shop_brand', NULL, 1, '2018-01-13 08:47:15', '2019-02-09 10:33:31'),
(13, 15, 14, 'Categories', 'fa-folder-open-o', 'shop_category', NULL, 1, '2018-01-13 08:52:17', '2019-02-09 10:33:31'),
(14, 15, 16, 'Special price', 'fa-paw', 'shop_special_price', NULL, 1, '2018-02-06 11:07:21', '2019-02-09 10:33:31'),
(15, 0, 13, 'Product Manager', 'fa-folder-open', NULL, NULL, 1, '2018-02-08 23:04:43', '2019-02-09 10:33:31'),
(18, 23, 44, 'Config info', 'fa-cog', 'config_info', NULL, 1, '2018-02-10 02:07:45', '2019-03-23 08:28:54'),
(22, 0, 8, 'Pages', 'fa-clone', 'shop_page', NULL, 0, '2018-02-10 02:19:50', '2019-02-08 09:21:24'),
(23, 0, 43, 'Settings', 'fa-cogs', NULL, NULL, 1, '2018-02-11 08:01:24', '2019-03-23 08:28:54'),
(24, 62, 39, 'Banners', 'fa-simplybuilt', 'banner', NULL, 1, '2018-03-13 13:10:22', '2019-03-23 08:28:54'),
(25, 0, 21, 'Order Manager', 'fa-cart-arrow-down', NULL, NULL, 1, '2018-05-06 07:59:14', '2019-02-09 10:33:31'),
(26, 25, 23, 'Order status', 'fa-asterisk', 'shop_order_status', NULL, 1, '2018-05-06 08:56:14', '2019-02-09 10:33:31'),
(27, 25, 24, 'Payment Status', 'fa-recycle', 'shop_payment_status', NULL, 1, '2018-05-06 08:57:12', '2019-02-09 10:33:31'),
(28, 25, 25, 'Shipping status', 'fa-ambulance', 'shop_shipping_status', NULL, 1, '2018-05-06 16:46:53', '2019-02-09 10:33:31'),
(30, 0, 29, 'Extensions', 'fa-puzzle-piece', NULL, NULL, 1, '2018-05-07 06:47:33', '2019-03-23 08:28:54'),
(31, 0, 26, 'Customer Manager', 'fa-group', NULL, NULL, 1, '2018-05-07 06:52:20', '2019-02-09 10:33:31'),
(51, 23, 45, 'Config global', 'fa-cogs', 'config_global', NULL, 1, '2018-09-19 13:51:31', '2019-03-23 08:28:54'),
(52, 56, 47, 'Config Language', 'fa-pagelines', 'language', NULL, 1, '2018-10-14 14:58:23', '2019-03-23 08:28:54'),
(53, 101, 37, 'Layout', 'fa-bars', 'layout', NULL, 1, '2018-10-16 23:16:09', '2019-03-23 08:29:13'),
(56, 23, 46, 'Localisation', 'fa-shirtsinbulk', NULL, NULL, 1, '2018-11-01 23:04:12', '2019-03-23 08:28:54'),
(57, 15, 18, 'Vendor', 'fa-user-secret', 'shop_vendor', NULL, 1, '2018-11-07 15:15:33', '2019-02-09 10:33:31'),
(58, 0, 51, 'Report & Analytics', 'fa-pie-chart', NULL, NULL, 1, '2018-11-07 22:59:47', '2019-03-23 08:28:54'),
(59, 58, 52, 'Customer', 'fa-bars', 'report/customer', NULL, 1, '2018-11-07 23:00:54', '2019-03-23 08:28:54'),
(60, 58, 53, 'Product', 'fa-bars', 'report/product', NULL, 1, '2018-11-07 23:01:21', '2019-03-23 08:28:54'),
(61, 15, 19, 'Import multi product', 'fa-save', 'process/productImport', NULL, 1, '2018-11-11 09:10:14', '2019-02-09 10:33:31'),
(62, 0, 38, 'Images manager', 'fa-image', NULL, NULL, 0, '2018-11-12 12:25:16', '2019-03-23 08:28:54'),
(63, 62, 40, 'Images', 'fa-file-image-o', 'documents', NULL, 1, '2018-11-12 12:26:13', '2019-03-23 08:28:54'),
(64, 56, 48, 'Currencies', 'fa-dollar', 'currencies', NULL, 1, '2018-12-03 23:55:44', '2019-03-23 08:28:54'),
(65, 0, 41, 'Api manager', 'fa-plug', NULL, NULL, 0, '2018-12-16 02:51:06', '2019-03-23 08:28:54'),
(66, 65, 42, 'Shop Api', 'fa-usb', 'modules/api/shop_api', NULL, 1, '2018-12-16 02:53:09', '2019-03-23 08:28:54'),
(70, 15, 20, 'Attributes group', 'fa-bars', 'shop_attribute_group', NULL, 1, '2018-12-27 15:32:39', '2019-02-09 10:33:31'),
(71, 30, 30, 'Payment', 'fa-money', 'extensions/Payment', NULL, 1, '2019-02-01 08:50:26', '2019-03-23 08:28:54'),
(72, 30, 31, 'Shipping', 'fa-ambulance', 'extensions/Shipping', NULL, 1, '2019-02-01 08:51:58', '2019-03-23 08:28:54'),
(73, 30, 32, 'Total', 'fa-cog', 'extensions/Total', NULL, 1, '2019-02-01 08:52:33', '2019-03-23 08:28:54'),
(74, 30, 33, 'Other', 'fa-circle-thin', 'extensions/Other', NULL, 1, '2019-02-01 08:53:09', '2019-03-23 08:28:54'),
(75, 0, 34, 'Modules', 'fa-codepen', NULL, NULL, 0, '2019-02-08 05:17:59', '2019-03-23 08:28:54'),
(76, 75, 35, 'Cms', 'fa-modx', 'modules/Cms', NULL, 1, '2019-02-08 05:25:13', '2019-03-23 08:28:54'),
(81, 23, 49, 'Templates manager', 'fa-columns', 'config_template', NULL, 1, '2019-02-25 03:26:36', '2019-03-23 08:28:54'),
(82, 23, 50, 'Backup & Restore', 'fa-save', 'backup_database', NULL, 1, '2019-02-25 03:32:26', '2019-03-23 08:28:54'),
(83, 31, 28, 'Subscribe manager', 'fa-user-md', 'subscribe', NULL, 1, '2019-02-27 01:39:41', '2019-03-23 08:28:54'),
(101, 0, 36, 'Design Layout', 'fa-object-ungroup', NULL, NULL, 0, '2019-03-23 08:28:31', '2019-03-23 08:28:54'),
(102, 75, 0, 'Other', 'fa-bars', 'modules/Other', NULL, 1, '2019-03-23 08:31:19', '2019-03-23 08:31:19'),
(105, 101, 0, 'URL', 'fa-chrome', 'layout_url', NULL, 1, '2019-03-31 01:45:43', '2019-03-31 01:45:43'),
(106, 31, 27, 'Customers Category', 'fa-user-md', 'shop_customer', NULL, 1, '2018-01-13 08:27:55', '2019-02-09 10:33:31');

-- --------------------------------------------------------

--
-- Table structure for table `admin_operation_log`
--

CREATE TABLE `admin_operation_log` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `path` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `method` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ip` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `input` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admin_operation_log`
--

INSERT INTO `admin_operation_log` (`id`, `company_id`, `user_id`, `path`, `method`, `ip`, `input`, `created_at`, `updated_at`) VALUES
(1, NULL, 1, 'system_admin', 'GET', '127.0.0.1', '[]', '2019-03-31 01:58:42', '2019-03-31 01:58:42'),
(2, NULL, 1, 'system_admin/layout', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-03-31 01:58:49', '2019-03-31 01:58:49'),
(3, NULL, 1, 'system_admin/auth/setting', 'GET', '127.0.0.1', '[]', '2019-03-31 01:58:54', '2019-03-31 01:58:54'),
(4, NULL, 1, 'system_admin/auth/setting', 'PUT', '127.0.0.1', '{\"name\":\"Administrator\",\"password\":\"admin\",\"password_confirmation\":\"admin\",\"_token\":\"I2IMslcPFzFycSNmH70LCIF2F7DGH4CcXoQFzVim\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/demoshop.local\\/system_admin\\/layout\"}', '2019-03-31 01:59:05', '2019-03-31 01:59:05'),
(5, NULL, 1, 'system_admin/auth/setting', 'GET', '127.0.0.1', '[]', '2019-03-31 01:59:05', '2019-03-31 01:59:05'),
(6, NULL, 1, 'system_admin/backup_database', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-03-31 01:59:14', '2019-03-31 01:59:14'),
(7, NULL, 1, 'system_admin/backup', 'POST', '127.0.0.1', '{\"_token\":\"I2IMslcPFzFycSNmH70LCIF2F7DGH4CcXoQFzVim\"}', '2019-03-31 01:59:15', '2019-03-31 01:59:15'),
(8, NULL, 1, 'system_admin', 'GET', '127.0.0.1', '[]', '2019-04-17 03:51:22', '2019-04-17 03:51:22'),
(9, NULL, 1, 'system_admin', 'GET', '127.0.0.1', '[]', '2019-04-17 03:52:11', '2019-04-17 03:52:11'),
(10, NULL, 1, 'system_admin/auth/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-17 03:52:15', '2019-04-17 03:52:15'),
(11, NULL, 1, 'system_admin/auth/users/create', 'GET', '127.0.0.1', '[]', '2019-04-17 03:52:21', '2019-04-17 03:52:21'),
(12, NULL, 1, 'system_admin', 'GET', '127.0.0.1', '[]', '2019-04-17 03:52:27', '2019-04-17 03:52:27'),
(13, NULL, 1, 'system_admin/config_info', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-17 03:52:34', '2019-04-17 03:52:34'),
(14, NULL, 1, 'system_admin', 'GET', '127.0.0.1', '[]', '2019-04-17 04:15:58', '2019-04-17 04:15:58'),
(15, NULL, 1, 'system_admin/shop_order', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-17 04:16:11', '2019-04-17 04:16:11'),
(16, NULL, 1, 'system_admin/shop_order_status', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-17 04:16:38', '2019-04-17 04:16:38'),
(17, NULL, 1, 'system_admin/shop_order', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-17 04:16:43', '2019-04-17 04:16:43'),
(18, NULL, 1, 'system_admin/shop_order_edit/1', 'GET', '127.0.0.1', '[]', '2019-04-17 04:17:02', '2019-04-17 04:17:02'),
(19, NULL, 1, 'system_admin', 'GET', '127.0.0.1', '[]', '2019-04-20 02:43:47', '2019-04-20 02:43:47'),
(20, NULL, 1, 'system_admin', 'GET', '127.0.0.1', '[]', '2019-04-20 02:44:15', '2019-04-20 02:44:15'),
(21, NULL, 1, 'system_admin/shop_order', 'GET', '127.0.0.1', '[]', '2019-04-20 02:44:36', '2019-04-20 02:44:36'),
(22, NULL, 1, 'system_admin/shop_order', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-20 02:45:04', '2019-04-20 02:45:04'),
(23, NULL, 1, 'system_admin/shop_order', 'GET', '127.0.0.1', '[]', '2019-04-20 02:45:27', '2019-04-20 02:45:27'),
(24, NULL, 1, 'system_admin/shop_order', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-20 02:46:33', '2019-04-20 02:46:33'),
(25, NULL, 1, 'system_admin/shop_order', 'GET', '127.0.0.1', '[]', '2019-04-20 02:47:51', '2019-04-20 02:47:51'),
(26, NULL, 1, 'system_admin', 'GET', '127.0.0.1', '[]', '2019-04-20 02:48:01', '2019-04-20 02:48:01'),
(27, NULL, 1, 'system_admin', 'GET', '127.0.0.1', '[]', '2019-04-20 02:48:43', '2019-04-20 02:48:43'),
(28, NULL, 1, 'system_admin', 'GET', '127.0.0.1', '[]', '2019-04-20 02:54:04', '2019-04-20 02:54:04'),
(29, NULL, 1, 'system_admin/shop_order', 'GET', '127.0.0.1', '[]', '2019-04-20 02:54:07', '2019-04-20 02:54:07'),
(30, NULL, 1, 'system_admin/shop_order_edit/3', 'GET', '127.0.0.1', '[]', '2019-04-20 02:54:26', '2019-04-20 02:54:26'),
(31, NULL, 1, 'system_admin/shop_category', 'GET', '127.0.0.1', '[]', '2019-04-20 16:11:52', '2019-04-20 16:11:52'),
(32, NULL, 1, 'system_admin/auth/logout', 'GET', '127.0.0.1', '[]', '2019-04-20 16:42:06', '2019-04-20 16:42:06'),
(33, NULL, 1, 'system_admin', 'GET', '127.0.0.1', '[]', '2019-04-26 01:43:08', '2019-04-26 01:43:08'),
(34, NULL, 1, 'system_admin/shop_order', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-26 01:50:56', '2019-04-26 01:50:56'),
(35, NULL, 1, 'system_admin/shop_order_edit/3', 'GET', '127.0.0.1', '[]', '2019-04-26 01:51:20', '2019-04-26 01:51:20'),
(36, NULL, 1, 'system_admin/shop_order_edit/shop_order_update', 'PUT', '127.0.0.1', '{\"name\":\"status\",\"value\":\"1\",\"pk\":\"3\",\"_token\":\"Kifq7rpUj6HDMqonbovC1EVEo8172XQg4ZRcCj3H\",\"_editable\":\"1\",\"_method\":\"PUT\"}', '2019-04-26 01:51:30', '2019-04-26 01:51:30'),
(37, NULL, 1, 'system_admin/shop_order_edit/3', 'GET', '127.0.0.1', '[]', '2019-04-29 15:29:54', '2019-04-29 15:29:54'),
(38, NULL, 1, 'system_admin/shop_order_edit/3', 'GET', '127.0.0.1', '[]', '2019-04-29 15:30:18', '2019-04-29 15:30:18'),
(39, NULL, 1, 'system_admin/auth/logout', 'GET', '127.0.0.1', '[]', '2019-04-29 15:36:21', '2019-04-29 15:36:21'),
(40, NULL, 1, 'system_admin', 'GET', '127.0.0.1', '[]', '2019-05-01 02:56:47', '2019-05-01 02:56:47'),
(41, NULL, 1, 'system_admin/auth/login', 'GET', '127.0.0.1', '[]', '2019-05-01 03:40:26', '2019-05-01 03:40:26'),
(42, NULL, 1, 'system_admin', 'GET', '127.0.0.1', '[]', '2019-05-01 03:40:27', '2019-05-01 03:40:27'),
(43, NULL, 1, 'system_admin/auth/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-01 03:40:55', '2019-05-01 03:40:55'),
(44, NULL, 1, 'system_admin/auth/users/create', 'GET', '127.0.0.1', '[]', '2019-05-01 03:41:48', '2019-05-01 03:41:48'),
(45, NULL, 1, 'system_admin/auth/menu', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-01 03:42:20', '2019-05-01 03:42:20'),
(46, NULL, 1, 'system_admin/auth/logs', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-01 03:42:57', '2019-05-01 03:42:57'),
(47, NULL, 1, 'system_admin/auth/users', 'GET', '127.0.0.1', '[]', '2019-05-01 13:11:04', '2019-05-01 13:11:04'),
(48, NULL, 1, 'system_admin/auth/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-01 13:18:43', '2019-05-01 13:18:43'),
(49, NULL, 1, 'system_admin/auth/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-01 13:34:21', '2019-05-01 13:34:21'),
(50, NULL, 1, 'system_admin/auth/users/4', 'DELETE', '127.0.0.1', '{\"_method\":\"delete\",\"_token\":\"ZK3jkdEjg0DjIJQ4WNDOmDUgKZ0rHvtuxZjpVUV6\"}', '2019-05-01 13:35:24', '2019-05-01 13:35:24'),
(51, NULL, 1, 'system_admin/auth/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-01 13:35:25', '2019-05-01 13:35:25'),
(52, NULL, 1, 'system_admin/auth/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-01 13:35:34', '2019-05-01 13:35:34'),
(53, NULL, 1, 'system_admin/auth/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-01 14:14:29', '2019-05-01 14:14:29'),
(54, NULL, 1, 'system_admin', 'GET', '127.0.0.1', '[]', '2019-05-01 15:39:42', '2019-05-01 15:39:42'),
(55, NULL, 1, 'system_admin/auth/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-01 15:39:55', '2019-05-01 15:39:55'),
(56, NULL, 1, 'system_admin/auth/users/3', 'GET', '127.0.0.1', '[]', '2019-05-01 15:40:01', '2019-05-01 15:40:01'),
(57, NULL, 1, 'system_admin/auth/users', 'GET', '127.0.0.1', '[]', '2019-05-01 15:40:09', '2019-05-01 15:40:09'),
(58, NULL, 1, 'system_admin/auth/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-01 15:59:31', '2019-05-01 15:59:31'),
(59, NULL, 1, 'system_admin/auth/users', 'GET', '127.0.0.1', '[]', '2019-05-01 16:00:26', '2019-05-01 16:00:26'),
(60, NULL, 1, 'system_admin/auth/users', 'GET', '127.0.0.1', '[]', '2019-05-01 16:02:32', '2019-05-01 16:02:32'),
(61, NULL, 1, 'system_admin/auth/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-01 16:18:33', '2019-05-01 16:18:33'),
(62, NULL, 1, 'system_admin/auth/users', 'GET', '127.0.0.1', '[]', '2019-05-01 16:18:50', '2019-05-01 16:18:50'),
(63, NULL, 1, 'system_admin/auth/users', 'GET', '127.0.0.1', '[]', '2019-05-01 16:19:14', '2019-05-01 16:19:14'),
(64, NULL, 1, 'system_admin/auth/users', 'GET', '127.0.0.1', '[]', '2019-05-01 16:19:29', '2019-05-01 16:19:29'),
(65, NULL, 1, 'system_admin/auth/users', 'GET', '127.0.0.1', '[]', '2019-05-01 16:19:32', '2019-05-01 16:19:32'),
(66, NULL, 1, 'system_admin/auth/users', 'GET', '127.0.0.1', '[]', '2019-05-01 16:47:38', '2019-05-01 16:47:38'),
(67, NULL, 1, 'system_admin/auth/users', 'GET', '127.0.0.1', '[]', '2019-05-01 16:48:16', '2019-05-01 16:48:16'),
(68, NULL, 1, 'system_admin/auth/users', 'GET', '127.0.0.1', '[]', '2019-05-01 16:50:02', '2019-05-01 16:50:02'),
(69, NULL, 1, 'system_admin/auth/users', 'GET', '127.0.0.1', '[]', '2019-05-01 16:54:23', '2019-05-01 16:54:23'),
(70, NULL, 1, 'system_admin/auth/users', 'GET', '127.0.0.1', '[]', '2019-05-01 16:55:09', '2019-05-01 16:55:09'),
(71, NULL, 1, 'system_admin/auth/users', 'GET', '127.0.0.1', '[]', '2019-05-01 16:56:44', '2019-05-01 16:56:44'),
(72, NULL, 1, 'system_admin/auth/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-01 16:56:48', '2019-05-01 16:56:48'),
(73, NULL, 1, 'system_admin/auth/users', 'GET', '127.0.0.1', '[]', '2019-05-01 16:57:07', '2019-05-01 16:57:07'),
(74, NULL, 1, 'system_admin/auth/users', 'GET', '127.0.0.1', '[]', '2019-05-01 17:02:38', '2019-05-01 17:02:38'),
(75, NULL, 1, 'system_admin/auth/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-01 17:02:40', '2019-05-01 17:02:40'),
(76, NULL, 1, 'system_admin/auth/users', 'GET', '127.0.0.1', '[]', '2019-05-01 17:03:45', '2019-05-01 17:03:45'),
(77, NULL, 1, 'system_admin/auth/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-01 17:03:48', '2019-05-01 17:03:48'),
(78, NULL, 1, 'system_admin/auth/users', 'GET', '127.0.0.1', '[]', '2019-05-01 17:04:51', '2019-05-01 17:04:51'),
(79, NULL, 1, 'system_admin/auth/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-01 17:04:55', '2019-05-01 17:04:55'),
(80, NULL, 1, 'system_admin/auth/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-01 17:05:30', '2019-05-01 17:05:30'),
(81, NULL, 1, 'system_admin/auth/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-01 17:05:32', '2019-05-01 17:05:32'),
(82, NULL, 1, 'system_admin/auth/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-01 17:06:00', '2019-05-01 17:06:00'),
(83, NULL, 1, 'system_admin/auth/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-01 17:06:34', '2019-05-01 17:06:34'),
(84, NULL, 1, 'system_admin/auth/users', 'GET', '127.0.0.1', '[]', '2019-05-01 17:06:35', '2019-05-01 17:06:35'),
(85, NULL, 1, 'system_admin/shop_page', 'GET', '127.0.0.1', '[]', '2019-05-01 17:06:36', '2019-05-01 17:06:36'),
(86, NULL, 1, 'system_admin/auth/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-01 17:06:41', '2019-05-01 17:06:41'),
(87, NULL, 1, 'system_admin/auth/users', 'GET', '127.0.0.1', '[]', '2019-05-01 17:06:41', '2019-05-01 17:06:41'),
(88, NULL, 1, 'system_admin/auth/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-01 17:06:44', '2019-05-01 17:06:44'),
(89, NULL, 1, 'system_admin/auth/users', 'GET', '127.0.0.1', '[]', '2019-05-01 17:06:44', '2019-05-01 17:06:44'),
(90, NULL, 1, 'system_admin/auth/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-01 17:06:47', '2019-05-01 17:06:47'),
(91, NULL, 1, 'system_admin/auth/users', 'GET', '127.0.0.1', '[]', '2019-05-01 17:06:47', '2019-05-01 17:06:47'),
(92, NULL, 1, 'system_admin/auth/users', 'GET', '127.0.0.1', '[]', '2019-05-01 17:06:50', '2019-05-01 17:06:50'),
(93, NULL, 1, 'system_admin/auth/users', 'GET', '127.0.0.1', '[]', '2019-05-01 17:07:30', '2019-05-01 17:07:30'),
(94, NULL, 1, 'system_admin/auth/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-01 17:07:33', '2019-05-01 17:07:33'),
(95, NULL, 1, 'system_admin/auth/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-01 17:07:34', '2019-05-01 17:07:34'),
(96, NULL, 1, 'system_admin/auth/users', 'GET', '127.0.0.1', '[]', '2019-05-01 17:07:37', '2019-05-01 17:07:37'),
(97, NULL, 1, 'system_admin/auth/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-01 17:07:38', '2019-05-01 17:07:38'),
(98, NULL, 1, 'system_admin/auth/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\",\"id\":\"5\"}', '2019-05-01 17:07:51', '2019-05-01 17:07:51'),
(99, NULL, 1, 'system_admin/auth/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\",\"id\":\"1\"}', '2019-05-01 17:07:56', '2019-05-01 17:07:56'),
(100, NULL, 1, 'system_admin/auth/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\",\"id\":null}', '2019-05-01 17:08:00', '2019-05-01 17:08:00'),
(101, NULL, 1, 'system_admin/extensions/Total', 'GET', '127.0.0.1', '[]', '2019-05-01 19:17:46', '2019-05-01 19:17:46'),
(102, NULL, 1, 'system_admin/modules/Cms', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-01 19:18:03', '2019-05-01 19:18:03'),
(103, NULL, 1, 'system_admin/modules/Other', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-01 19:18:10', '2019-05-01 19:18:10'),
(104, NULL, 1, 'system_admin/modules/api/shop_api', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-01 19:18:18', '2019-05-01 19:18:18'),
(105, NULL, 1, 'system_admin/report/customer', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-01 19:19:02', '2019-05-01 19:19:02'),
(106, NULL, 1, 'system_admin/report/customer', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-01 19:19:08', '2019-05-01 19:19:08'),
(107, NULL, 1, 'system_admin/report/customer', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-01 19:19:19', '2019-05-01 19:19:19'),
(108, NULL, 1, 'system_admin/report/customer', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-01 19:19:27', '2019-05-01 19:19:27'),
(109, NULL, 1, 'system_admin/config_info', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-01 19:19:51', '2019-05-01 19:19:51'),
(110, NULL, 1, 'system_admin/config_info', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-01 19:19:58', '2019-05-01 19:19:58'),
(111, NULL, 1, 'system_admin/config_global', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-01 19:19:59', '2019-05-01 19:19:59'),
(112, NULL, 1, 'system_admin/config_info', 'GET', '127.0.0.1', '[]', '2019-05-01 19:20:00', '2019-05-01 19:20:00'),
(113, NULL, 1, 'system_admin/config_global', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-01 19:21:15', '2019-05-01 19:21:15'),
(114, NULL, 1, 'system_admin/config_info', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-01 19:21:36', '2019-05-01 19:21:36'),
(115, NULL, 1, 'system_admin/language', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-01 19:21:42', '2019-05-01 19:21:42'),
(116, NULL, 1, 'system_admin/language/create', 'GET', '127.0.0.1', '[]', '2019-05-01 19:21:49', '2019-05-01 19:21:49'),
(117, NULL, 1, 'system_admin/shop_customer', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-01 19:22:44', '2019-05-01 19:22:44'),
(118, NULL, 1, 'system_admin/subscribe', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-01 19:22:47', '2019-05-01 19:22:47'),
(119, NULL, 1, 'system_admin/shop_page', 'GET', '127.0.0.1', '[]', '2019-05-01 19:23:01', '2019-05-01 19:23:01'),
(120, NULL, 1, 'system_admin/extensions/Shipping', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-01 19:23:13', '2019-05-01 19:23:13'),
(121, NULL, 1, 'system_admin/extensions/Payment', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-01 19:23:15', '2019-05-01 19:23:15'),
(122, NULL, 1, 'system_admin/extensions/Total', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-01 19:23:18', '2019-05-01 19:23:18'),
(123, NULL, 1, 'system_admin/extensions/Other', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-01 19:23:20', '2019-05-01 19:23:20'),
(124, NULL, 1, 'system_admin/layout', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-01 19:23:28', '2019-05-01 19:23:28'),
(125, NULL, 1, 'system_admin/extensions/Payment', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-01 19:24:19', '2019-05-01 19:24:19'),
(126, NULL, 1, 'system_admin/extensions/Shipping', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-01 19:24:20', '2019-05-01 19:24:20'),
(127, NULL, 1, 'system_admin/extensions/Total', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-01 19:24:22', '2019-05-01 19:24:22'),
(128, NULL, 1, 'system_admin/shop_shipping_status', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-01 19:46:45', '2019-05-01 19:46:45'),
(129, NULL, 1, 'system_admin/shop_payment_status', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-01 19:46:49', '2019-05-01 19:46:49'),
(130, NULL, 1, 'system_admin/shop_order_status', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-01 19:46:59', '2019-05-01 19:46:59'),
(131, NULL, 1, 'system_admin/shop_order', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-01 19:47:09', '2019-05-01 19:47:09'),
(132, NULL, 1, 'system_admin/shop_vendor', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-01 19:47:23', '2019-05-01 19:47:23'),
(133, NULL, 1, 'system_admin/shop_brand', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-01 19:47:26', '2019-05-01 19:47:26'),
(134, NULL, 1, 'system_admin/shop_special_price', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-01 19:47:29', '2019-05-01 19:47:29'),
(135, NULL, 1, 'system_admin/shop_product', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-01 19:47:42', '2019-05-01 19:47:42'),
(136, NULL, 1, 'system_admin/shop_category', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-01 19:47:53', '2019-05-01 19:47:53'),
(137, NULL, 1, 'system_admin/shop_customer', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-01 19:48:48', '2019-05-01 19:48:48'),
(138, NULL, 1, 'system_admin/shop_customer/create', 'GET', '127.0.0.1', '[]', '2019-05-01 19:48:52', '2019-05-01 19:48:52'),
(139, NULL, 1, 'system_admin/auth/roles', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-01 19:49:04', '2019-05-01 19:49:04'),
(140, NULL, 1, 'system_admin/auth/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-01 19:49:06', '2019-05-01 19:49:06'),
(141, NULL, 1, 'system_admin/auth/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-01 19:49:14', '2019-05-01 19:49:14'),
(142, NULL, 1, 'system_admin', 'GET', '127.0.0.1', '[]', '2019-05-01 19:49:19', '2019-05-01 19:49:19'),
(143, NULL, 1, 'system_admin', 'GET', '127.0.0.1', '[]', '2019-05-01 19:49:25', '2019-05-01 19:49:25'),
(144, NULL, 1, 'system_admin', 'GET', '127.0.0.1', '[]', '2019-05-01 19:49:28', '2019-05-01 19:49:28'),
(145, NULL, 1, 'system_admin/auth/menu', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-01 19:50:00', '2019-05-01 19:50:00'),
(146, NULL, 1, 'system_admin/auth/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-01 19:55:05', '2019-05-01 19:55:05'),
(147, NULL, 1, 'system_admin/auth/users/1', 'GET', '127.0.0.1', '[]', '2019-05-01 19:55:08', '2019-05-01 19:55:08'),
(148, NULL, 1, 'system_admin/auth/users/3', 'GET', '127.0.0.1', '[]', '2019-05-01 19:55:18', '2019-05-01 19:55:18'),
(149, NULL, 1, 'system_admin/auth/users/3', 'GET', '127.0.0.1', '[]', '2019-05-01 19:55:46', '2019-05-01 19:55:46'),
(150, NULL, 1, 'system_admin/auth/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-01 20:20:09', '2019-05-01 20:20:09'),
(151, NULL, 1, 'system_admin/auth/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-01 20:20:12', '2019-05-01 20:20:12'),
(152, NULL, 1, 'system_admin/auth/users', 'GET', '127.0.0.1', '[]', '2019-05-01 20:20:14', '2019-05-01 20:20:14'),
(153, NULL, 1, 'system_admin/auth/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-01 21:05:29', '2019-05-01 21:05:29'),
(154, NULL, 1, 'system_admin/auth/users', 'GET', '127.0.0.1', '[]', '2019-05-01 21:05:30', '2019-05-01 21:05:30'),
(155, NULL, 1, 'system_admin/auth/users', 'GET', '127.0.0.1', '[]', '2019-05-01 21:05:30', '2019-05-01 21:05:30'),
(156, NULL, 1, 'system_admin/auth/users', 'GET', '127.0.0.1', '[]', '2019-05-01 21:05:30', '2019-05-01 21:05:30'),
(157, NULL, 1, 'system_admin/auth/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-01 21:05:31', '2019-05-01 21:05:31'),
(158, NULL, 1, 'system_admin/auth/users', 'GET', '127.0.0.1', '[]', '2019-05-01 21:05:31', '2019-05-01 21:05:31'),
(159, NULL, 1, 'system_admin/auth/users', 'GET', '127.0.0.1', '[]', '2019-05-01 21:05:32', '2019-05-01 21:05:32'),
(160, NULL, 1, 'system_admin/auth/users', 'GET', '127.0.0.1', '[]', '2019-05-01 21:05:32', '2019-05-01 21:05:32'),
(161, NULL, 1, 'system_admin/auth/users', 'GET', '127.0.0.1', '[]', '2019-05-01 21:05:32', '2019-05-01 21:05:32'),
(162, NULL, 1, 'system_admin/auth/users', 'GET', '127.0.0.1', '[]', '2019-05-01 21:05:33', '2019-05-01 21:05:33'),
(163, NULL, 1, 'system_admin/auth/users', 'GET', '127.0.0.1', '[]', '2019-05-01 21:05:33', '2019-05-01 21:05:33'),
(164, NULL, 1, 'system_admin/auth/users', 'GET', '127.0.0.1', '[]', '2019-05-01 21:05:34', '2019-05-01 21:05:34'),
(165, NULL, 1, 'system_admin/auth/users', 'GET', '127.0.0.1', '[]', '2019-05-01 21:05:34', '2019-05-01 21:05:34'),
(166, NULL, 1, 'system_admin/auth/users', 'GET', '127.0.0.1', '[]', '2019-05-01 21:05:34', '2019-05-01 21:05:34'),
(167, NULL, 1, 'system_admin/auth/users', 'GET', '127.0.0.1', '[]', '2019-05-01 21:05:35', '2019-05-01 21:05:35'),
(168, NULL, 1, 'system_admin/auth/users', 'GET', '127.0.0.1', '[]', '2019-05-01 21:05:35', '2019-05-01 21:05:35'),
(169, NULL, 1, 'system_admin/auth/users', 'GET', '127.0.0.1', '[]', '2019-05-01 21:07:45', '2019-05-01 21:07:45'),
(170, NULL, 1, 'system_admin/auth/users', 'GET', '127.0.0.1', '[]', '2019-05-01 21:08:23', '2019-05-01 21:08:23'),
(171, NULL, 1, 'system_admin/auth/users', 'GET', '127.0.0.1', '[]', '2019-05-01 21:25:51', '2019-05-01 21:25:51'),
(172, NULL, 1, 'system_admin/auth/users', 'GET', '127.0.0.1', '[]', '2019-05-01 21:26:19', '2019-05-01 21:26:19'),
(173, NULL, 1, 'system_admin/auth/users', 'GET', '127.0.0.1', '[]', '2019-05-01 21:33:18', '2019-05-01 21:33:18'),
(174, NULL, 1, 'system_admin/auth/users', 'GET', '127.0.0.1', '[]', '2019-05-01 21:34:07', '2019-05-01 21:34:07'),
(175, NULL, 1, 'system_admin/auth/users', 'GET', '127.0.0.1', '[]', '2019-05-01 21:34:38', '2019-05-01 21:34:38'),
(176, NULL, 1, 'system_admin/auth/users', 'GET', '127.0.0.1', '[]', '2019-05-01 21:34:57', '2019-05-01 21:34:57'),
(177, NULL, 1, 'system_admin/auth/users', 'GET', '127.0.0.1', '[]', '2019-05-01 21:35:35', '2019-05-01 21:35:35'),
(178, NULL, 1, 'system_admin/auth/users', 'GET', '127.0.0.1', '[]', '2019-05-01 21:36:17', '2019-05-01 21:36:17'),
(179, NULL, 1, 'system_admin/auth/users', 'GET', '127.0.0.1', '[]', '2019-05-01 21:55:20', '2019-05-01 21:55:20'),
(180, NULL, 1, 'system_admin/auth/users', 'GET', '127.0.0.1', '[]', '2019-05-01 21:55:41', '2019-05-01 21:55:41'),
(181, NULL, 1, 'system_admin/auth/users', 'GET', '127.0.0.1', '[]', '2019-05-01 21:56:09', '2019-05-01 21:56:09'),
(182, NULL, 1, 'system_admin/auth/users', 'GET', '127.0.0.1', '[]', '2019-05-01 21:56:56', '2019-05-01 21:56:56'),
(183, NULL, 1, 'system_admin/auth/users', 'GET', '127.0.0.1', '[]', '2019-05-01 21:57:33', '2019-05-01 21:57:33'),
(184, NULL, 1, 'system_admin/auth/users', 'GET', '127.0.0.1', '[]', '2019-05-01 22:02:10', '2019-05-01 22:02:10'),
(185, NULL, 1, 'system_admin/auth/users', 'GET', '127.0.0.1', '[]', '2019-05-01 22:02:29', '2019-05-01 22:02:29'),
(186, NULL, 1, 'system_admin/auth/users', 'GET', '127.0.0.1', '[]', '2019-05-01 22:05:33', '2019-05-01 22:05:33'),
(187, NULL, 1, 'system_admin/auth/users', 'GET', '127.0.0.1', '[]', '2019-05-01 22:06:17', '2019-05-01 22:06:17'),
(188, NULL, 1, 'system_admin/auth/users', 'GET', '127.0.0.1', '[]', '2019-05-01 22:07:01', '2019-05-01 22:07:01'),
(189, NULL, 1, 'system_admin/auth/users', 'GET', '127.0.0.1', '[]', '2019-05-01 22:08:54', '2019-05-01 22:08:54'),
(190, NULL, 1, 'system_admin/auth/users', 'GET', '127.0.0.1', '[]', '2019-05-01 22:15:40', '2019-05-01 22:15:40'),
(191, NULL, 1, 'system_admin/auth/users', 'GET', '127.0.0.1', '[]', '2019-05-01 22:16:02', '2019-05-01 22:16:02'),
(192, NULL, 1, 'system_admin/auth/users', 'GET', '127.0.0.1', '[]', '2019-05-01 22:17:55', '2019-05-01 22:17:55'),
(193, NULL, 1, 'system_admin/auth/users', 'GET', '127.0.0.1', '[]', '2019-05-01 22:19:16', '2019-05-01 22:19:16'),
(194, NULL, 1, 'system_admin/auth/users', 'GET', '127.0.0.1', '[]', '2019-05-01 22:20:02', '2019-05-01 22:20:02'),
(195, NULL, 1, 'system_admin/auth/users', 'GET', '127.0.0.1', '[]', '2019-05-01 22:21:18', '2019-05-01 22:21:18'),
(196, NULL, 1, 'system_admin/auth/users', 'GET', '127.0.0.1', '[]', '2019-05-01 22:22:32', '2019-05-01 22:22:32'),
(197, NULL, 1, 'system_admin/auth/users', 'GET', '127.0.0.1', '[]', '2019-05-01 22:23:03', '2019-05-01 22:23:03'),
(198, NULL, 1, 'system_admin/auth/users', 'GET', '127.0.0.1', '[]', '2019-05-01 22:23:43', '2019-05-01 22:23:43'),
(199, NULL, 1, 'system_admin/auth/users', 'GET', '127.0.0.1', '[]', '2019-05-01 22:25:01', '2019-05-01 22:25:01'),
(200, NULL, 1, 'system_admin/auth/users', 'GET', '127.0.0.1', '[]', '2019-05-01 22:25:35', '2019-05-01 22:25:35'),
(201, NULL, 1, 'system_admin/auth/users', 'GET', '127.0.0.1', '[]', '2019-05-01 22:25:56', '2019-05-01 22:25:56'),
(202, NULL, 1, 'system_admin/auth/users', 'GET', '127.0.0.1', '[]', '2019-05-01 22:26:24', '2019-05-01 22:26:24'),
(203, NULL, 1, 'system_admin/auth/users', 'GET', '127.0.0.1', '[]', '2019-05-02 14:24:43', '2019-05-02 14:24:43'),
(204, NULL, 1, 'system_admin/auth/users', 'GET', '127.0.0.1', '[]', '2019-05-02 14:25:26', '2019-05-02 14:25:26'),
(205, NULL, 1, 'system_admin/auth/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-02 14:25:37', '2019-05-02 14:25:37'),
(206, NULL, 1, 'system_admin/auth/users', 'GET', '127.0.0.1', '[]', '2019-05-02 14:27:54', '2019-05-02 14:27:54'),
(207, NULL, 1, 'system_admin/auth/users', 'GET', '127.0.0.1', '[]', '2019-05-02 14:28:08', '2019-05-02 14:28:08'),
(208, NULL, 1, 'system_admin/auth/users', 'GET', '127.0.0.1', '[]', '2019-05-02 14:28:54', '2019-05-02 14:28:54'),
(209, NULL, 1, 'system_admin/auth/users', 'GET', '127.0.0.1', '[]', '2019-05-02 14:31:39', '2019-05-02 14:31:39'),
(210, NULL, 1, 'system_admin/auth/users', 'GET', '127.0.0.1', '[]', '2019-05-02 14:34:28', '2019-05-02 14:34:28'),
(211, NULL, 1, 'system_admin/auth/users', 'GET', '127.0.0.1', '[]', '2019-05-02 14:36:38', '2019-05-02 14:36:38'),
(212, NULL, 1, 'system_admin/auth/users', 'GET', '127.0.0.1', '[]', '2019-05-02 14:37:11', '2019-05-02 14:37:11'),
(213, NULL, 1, 'system_admin/auth/users', 'GET', '127.0.0.1', '[]', '2019-05-02 15:46:31', '2019-05-02 15:46:31'),
(214, NULL, 1, 'system_admin/auth/users', 'GET', '127.0.0.1', '[]', '2019-05-02 15:47:06', '2019-05-02 15:47:06'),
(215, NULL, 1, 'system_admin/auth/users', 'GET', '127.0.0.1', '[]', '2019-05-02 16:05:24', '2019-05-02 16:05:24'),
(216, NULL, 1, 'system_admin/auth/users', 'GET', '127.0.0.1', '[]', '2019-05-02 16:05:43', '2019-05-02 16:05:43'),
(217, NULL, 1, 'system_admin/shop_product', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-02 17:41:41', '2019-05-02 17:41:41'),
(218, NULL, 1, 'system_admin/auth/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-02 17:46:20', '2019-05-02 17:46:20'),
(219, NULL, 1, 'system_admin/auth/roles', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-02 17:47:21', '2019-05-02 17:47:21'),
(220, NULL, 1, 'system_admin/auth/permissions', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-02 17:47:23', '2019-05-02 17:47:23'),
(221, NULL, 1, 'system_admin/auth/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-02 17:47:36', '2019-05-02 17:47:36'),
(222, NULL, 1, 'system_admin/shop_category', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-02 17:47:39', '2019-05-02 17:47:39'),
(223, NULL, 1, 'system_admin/shop_product', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-02 17:47:43', '2019-05-02 17:47:43'),
(224, NULL, 1, 'system_admin/shop_product', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-02 17:49:48', '2019-05-02 17:49:48'),
(225, NULL, 1, 'system_admin/shop_product', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-02 17:49:51', '2019-05-02 17:49:51'),
(226, NULL, 1, 'system_admin', 'GET', '127.0.0.1', '[]', '2019-05-02 18:52:46', '2019-05-02 18:52:46'),
(227, NULL, 1, 'system_admin/auth/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-02 18:56:43', '2019-05-02 18:56:43'),
(228, NULL, 1, 'system_admin/auth/roles', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-02 18:56:47', '2019-05-02 18:56:47'),
(229, NULL, 1, 'system_admin/auth/permissions', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-02 18:56:49', '2019-05-02 18:56:49'),
(230, NULL, 1, 'system_admin/auth/permissions', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-02 19:00:19', '2019-05-02 19:00:19'),
(231, NULL, 1, 'system_admin/auth/menu', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-02 19:00:30', '2019-05-02 19:00:30'),
(232, NULL, 1, 'system_admin/auth/logs', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-02 19:00:57', '2019-05-02 19:00:57'),
(233, NULL, 1, 'system_admin/auth/logs', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-02 19:06:28', '2019-05-02 19:06:28'),
(234, NULL, 1, 'system_admin/auth/logs', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-02 19:07:05', '2019-05-02 19:07:05'),
(235, NULL, 1, 'system_admin/shop_page', 'GET', '127.0.0.1', '[]', '2019-05-02 19:07:13', '2019-05-02 19:07:13'),
(236, NULL, 1, 'system_admin/shop_page', 'GET', '127.0.0.1', '[]', '2019-05-02 19:08:16', '2019-05-02 19:08:16'),
(237, NULL, 1, 'system_admin/shop_category', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-02 19:08:27', '2019-05-02 19:08:27'),
(238, NULL, 1, 'system_admin/shop_product', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-02 19:08:28', '2019-05-02 19:08:28'),
(239, NULL, 1, 'system_admin/shop_product', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-02 19:09:53', '2019-05-02 19:09:53'),
(240, NULL, 1, 'system_admin/auth/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-02 19:10:41', '2019-05-02 19:10:41'),
(241, NULL, 1, 'system_admin/shop_category', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-02 19:10:44', '2019-05-02 19:10:44'),
(242, NULL, 1, 'system_admin/shop_product', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-02 19:10:46', '2019-05-02 19:10:46'),
(243, NULL, 1, 'system_admin/shop_product', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-02 19:14:12', '2019-05-02 19:14:12'),
(244, NULL, 1, 'system_admin/shop_product', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-02 19:15:08', '2019-05-02 19:15:08'),
(245, NULL, 1, 'system_admin/shop_special_price', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-02 19:16:43', '2019-05-02 19:16:43'),
(246, NULL, 1, 'system_admin/shop_special_price', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-02 19:18:38', '2019-05-02 19:18:38'),
(247, NULL, 1, 'system_admin/shop_special_price', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-02 19:18:52', '2019-05-02 19:18:52'),
(248, NULL, 1, 'system_admin/shop_product', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-02 19:19:09', '2019-05-02 19:19:09'),
(249, NULL, 1, 'system_admin/shop_special_price', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-02 19:19:13', '2019-05-02 19:19:13'),
(250, NULL, 1, 'system_admin/shop_special_price/create', 'GET', '127.0.0.1', '[]', '2019-05-02 19:19:28', '2019-05-02 19:19:28'),
(251, NULL, 1, 'system_admin/get_info/productInfo', 'GET', '127.0.0.1', '{\"id\":null}', '2019-05-02 19:19:30', '2019-05-02 19:19:30'),
(252, NULL, 1, 'system_admin/shop_special_price', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-02 19:19:51', '2019-05-02 19:19:51'),
(253, NULL, 1, 'system_admin/shop_brand', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-02 19:19:54', '2019-05-02 19:19:54'),
(254, NULL, 1, 'system_admin/shop_vendor', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-02 19:19:57', '2019-05-02 19:19:57'),
(255, NULL, 1, 'system_admin/shop_vendor', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-02 19:24:50', '2019-05-02 19:24:50'),
(256, NULL, 1, 'system_admin/process/productImport', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-02 19:26:01', '2019-05-02 19:26:01'),
(257, NULL, 1, 'system_admin/shop_attribute_group', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-02 19:26:14', '2019-05-02 19:26:14'),
(258, NULL, 1, 'system_admin/shop_attribute_group', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-02 19:27:46', '2019-05-02 19:27:46'),
(259, NULL, 1, 'system_admin/shop_order', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-02 19:27:54', '2019-05-02 19:27:54'),
(260, NULL, 1, 'system_admin/shop_order_status', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-02 19:27:58', '2019-05-02 19:27:58'),
(261, NULL, 1, 'system_admin/shop_payment_status', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-02 19:28:03', '2019-05-02 19:28:03'),
(262, NULL, 1, 'system_admin/shop_shipping_status', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-02 19:28:05', '2019-05-02 19:28:05'),
(263, NULL, 1, 'system_admin/shop_customer', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-02 19:28:09', '2019-05-02 19:28:09'),
(264, NULL, 1, 'system_admin/shop_customer', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-02 19:28:57', '2019-05-02 19:28:57'),
(265, NULL, 1, 'system_admin/subscribe', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-02 19:28:59', '2019-05-02 19:28:59'),
(266, NULL, 1, 'system_admin/subscribe', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-02 19:29:41', '2019-05-02 19:29:41'),
(267, NULL, 1, 'system_admin/extensions/Payment', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-02 19:29:44', '2019-05-02 19:29:44'),
(268, NULL, 1, 'system_admin/extensions/Shipping', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-02 19:29:53', '2019-05-02 19:29:53'),
(269, NULL, 1, 'system_admin/extensions/Total', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-02 19:29:56', '2019-05-02 19:29:56'),
(270, NULL, 1, 'system_admin/extensions/Total', 'GET', '127.0.0.1', '{\"action\":\"config\",\"extensionKey\":\"Discount\"}', '2019-05-02 19:30:06', '2019-05-02 19:30:06'),
(271, NULL, 1, 'system_admin/shop_discount', 'GET', '127.0.0.1', '[]', '2019-05-02 19:30:07', '2019-05-02 19:30:07'),
(272, NULL, 1, 'system_admin/extensions/Shipping', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-02 19:30:17', '2019-05-02 19:30:17'),
(273, NULL, 1, 'system_admin/extensions/Shipping', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-02 19:30:20', '2019-05-02 19:30:20'),
(274, NULL, 1, 'system_admin/modules/Cms', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-02 19:30:29', '2019-05-02 19:30:29'),
(275, NULL, 1, 'system_admin/modules/Other', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-02 19:30:33', '2019-05-02 19:30:33'),
(276, NULL, 1, 'system_admin/layout', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-02 19:30:43', '2019-05-02 19:30:43'),
(277, NULL, 1, 'system_admin/layout', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-02 19:31:53', '2019-05-02 19:31:53'),
(278, NULL, 1, 'system_admin/layout_url', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-02 19:31:55', '2019-05-02 19:31:55'),
(279, NULL, 1, 'system_admin/layout', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-02 19:33:04', '2019-05-02 19:33:04'),
(280, NULL, 1, 'system_admin/layout_url', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-02 19:33:06', '2019-05-02 19:33:06'),
(281, NULL, 1, 'system_admin/layout', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-02 19:33:09', '2019-05-02 19:33:09'),
(282, NULL, 1, 'system_admin/layout_url', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-02 19:33:11', '2019-05-02 19:33:11'),
(283, NULL, 1, 'system_admin/banner', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-02 19:33:13', '2019-05-02 19:33:13'),
(284, NULL, 1, 'system_admin/documents', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-02 19:33:15', '2019-05-02 19:33:15'),
(285, NULL, 1, 'system_admin/documents', 'GET', '127.0.0.1', '[]', '2019-05-02 19:33:15', '2019-05-02 19:33:15'),
(286, NULL, 1, 'system_admin/documents/folders', 'GET', '127.0.0.1', '{\"working_dir\":null,\"type\":null,\"_\":\"1556807596316\"}', '2019-05-02 19:33:16', '2019-05-02 19:33:16'),
(287, NULL, 1, 'system_admin/documents/errors', 'GET', '127.0.0.1', '{\"working_dir\":null,\"type\":null,\"_\":\"1556807596317\"}', '2019-05-02 19:33:16', '2019-05-02 19:33:16'),
(288, NULL, 1, 'system_admin/documents/jsonitems', 'GET', '127.0.0.1', '{\"working_dir\":null,\"type\":null,\"sort_type\":\"alphabetic\",\"_\":\"1556807596318\"}', '2019-05-02 19:33:17', '2019-05-02 19:33:17'),
(289, NULL, 1, 'system_admin/documents/jsonitems', 'GET', '127.0.0.1', '{\"working_dir\":\"\\/photos\",\"type\":null,\"sort_type\":\"alphabetic\",\"_\":\"1556807596319\"}', '2019-05-02 19:33:25', '2019-05-02 19:33:25'),
(290, NULL, 1, 'system_admin/documents/jsonitems', 'GET', '127.0.0.1', '{\"working_dir\":\"\\/photos\\/blogs\",\"type\":null,\"sort_type\":\"alphabetic\",\"_\":\"1556807596320\"}', '2019-05-02 19:33:28', '2019-05-02 19:33:28'),
(291, NULL, 1, 'system_admin/documents/jsonitems', 'GET', '127.0.0.1', '{\"working_dir\":\"\\/website\",\"type\":null,\"sort_type\":\"alphabetic\",\"_\":\"1556807596321\"}', '2019-05-02 19:33:31', '2019-05-02 19:33:31'),
(292, NULL, 1, 'system_admin/documents/jsonitems', 'GET', '127.0.0.1', '{\"working_dir\":\"\\/website\\/banner\",\"type\":null,\"sort_type\":\"alphabetic\",\"_\":\"1556807596322\"}', '2019-05-02 19:33:34', '2019-05-02 19:33:34'),
(293, NULL, 1, 'system_admin/banner', 'GET', '127.0.0.1', '[]', '2019-05-02 19:33:38', '2019-05-02 19:33:38'),
(294, NULL, 1, 'system_admin/modules/api/shop_api', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-02 19:33:43', '2019-05-02 19:33:43'),
(295, NULL, 1, 'system_admin/modules/api/shop_api', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-02 19:34:15', '2019-05-02 19:34:15'),
(296, NULL, 1, 'system_admin/config_info', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-02 19:34:18', '2019-05-02 19:34:18'),
(297, NULL, 1, 'system_admin/config_global', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-02 19:34:22', '2019-05-02 19:34:22'),
(298, NULL, 1, 'system_admin/config_global', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-02 19:35:11', '2019-05-02 19:35:11'),
(299, NULL, 1, 'system_admin/language', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-02 19:35:18', '2019-05-02 19:35:18'),
(300, NULL, 1, 'system_admin/language', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-02 19:36:07', '2019-05-02 19:36:07'),
(301, NULL, 1, 'system_admin/currencies', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-02 19:36:11', '2019-05-02 19:36:11'),
(302, NULL, 1, 'system_admin/config_template', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-02 19:36:14', '2019-05-02 19:36:14'),
(303, NULL, 1, 'system_admin/backup_database', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-02 19:36:28', '2019-05-02 19:36:28'),
(304, NULL, 1, 'system_admin/report/customer', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-02 19:36:59', '2019-05-02 19:36:59'),
(305, NULL, 1, 'system_admin', 'GET', '127.0.0.1', '[]', '2019-05-02 19:37:05', '2019-05-02 19:37:05'),
(306, NULL, 1, 'system_admin/auth/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-02 19:37:19', '2019-05-02 19:37:19'),
(307, NULL, 1, 'system_admin/auth/users/create', 'GET', '127.0.0.1', '[]', '2019-05-02 19:37:32', '2019-05-02 19:37:32'),
(308, NULL, 1, 'system_admin/auth/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-02 20:22:39', '2019-05-02 20:22:39'),
(309, NULL, 1, 'system_admin/auth/users/create', 'GET', '127.0.0.1', '[]', '2019-05-02 20:22:41', '2019-05-02 20:22:41'),
(310, NULL, 1, 'system_admin/auth/users', 'POST', '127.0.0.1', '{\"username\":\"mahmoud\",\"name\":\"mahmoud\",\"password\":\"4715192\",\"password_confirmation\":\"4715192\",\"roles\":[\"1\",null],\"permissions\":[\"1\",null],\"_token\":\"Suyiy8cDvxQfgpm4PZqH7tLM1S39u81JDbsFUJkC\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/system_admin\\/auth\\/users\"}', '2019-05-02 20:23:08', '2019-05-02 20:23:08'),
(311, NULL, 1, 'system_admin/auth/users', 'GET', '127.0.0.1', '[]', '2019-05-02 20:23:09', '2019-05-02 20:23:09'),
(312, NULL, 1, 'system_admin/auth/users/create', 'GET', '127.0.0.1', '[]', '2019-05-02 22:14:42', '2019-05-02 22:14:42'),
(313, NULL, 1, 'system_admin/auth/users/create', 'GET', '127.0.0.1', '[]', '2019-05-02 22:16:22', '2019-05-02 22:16:22'),
(314, NULL, 1, 'system_admin/auth/users/create', 'GET', '127.0.0.1', '[]', '2019-05-02 22:16:37', '2019-05-02 22:16:37'),
(315, NULL, 1, 'system_admin/auth/users/create', 'GET', '127.0.0.1', '[]', '2019-05-02 22:18:48', '2019-05-02 22:18:48'),
(316, NULL, 1, 'system_admin/auth/users/create', 'GET', '127.0.0.1', '[]', '2019-05-02 22:18:58', '2019-05-02 22:18:58'),
(317, NULL, 1, 'system_admin/auth/users/create', 'GET', '127.0.0.1', '[]', '2019-05-02 22:21:03', '2019-05-02 22:21:03'),
(318, NULL, 1, 'system_admin/auth/users/create', 'GET', '127.0.0.1', '[]', '2019-05-02 22:21:43', '2019-05-02 22:21:43'),
(319, NULL, 1, 'system_admin/auth/users/create', 'GET', '127.0.0.1', '[]', '2019-05-02 22:22:00', '2019-05-02 22:22:00'),
(320, NULL, 1, 'system_admin/auth/users/create', 'GET', '127.0.0.1', '[]', '2019-05-02 22:26:05', '2019-05-02 22:26:05'),
(321, NULL, 1, 'system_admin/auth/users/create', 'GET', '127.0.0.1', '[]', '2019-05-02 22:37:21', '2019-05-02 22:37:21'),
(322, NULL, 1, 'system_admin/auth/users/create', 'GET', '127.0.0.1', '[]', '2019-05-02 22:38:32', '2019-05-02 22:38:32'),
(323, NULL, 1, 'system_admin/auth/users/create', 'GET', '127.0.0.1', '[]', '2019-05-02 22:39:05', '2019-05-02 22:39:05'),
(324, NULL, 1, 'system_admin/auth/users/create', 'GET', '127.0.0.1', '[]', '2019-05-02 22:39:16', '2019-05-02 22:39:16'),
(325, NULL, 1, 'system_admin/auth/users/create', 'GET', '127.0.0.1', '[]', '2019-05-02 22:39:57', '2019-05-02 22:39:57'),
(326, NULL, 1, 'system_admin/auth/users/create', 'GET', '127.0.0.1', '[]', '2019-05-02 22:40:23', '2019-05-02 22:40:23'),
(327, NULL, 1, 'system_admin/auth/users/create', 'GET', '127.0.0.1', '[]', '2019-05-02 22:40:52', '2019-05-02 22:40:52'),
(328, NULL, 1, 'system_admin/auth/users/create', 'GET', '127.0.0.1', '[]', '2019-05-02 22:41:50', '2019-05-02 22:41:50'),
(329, NULL, 1, 'system_admin/auth/users/create', 'GET', '127.0.0.1', '[]', '2019-05-02 22:48:58', '2019-05-02 22:48:58'),
(330, NULL, 1, 'system_admin/auth/users/create', 'GET', '127.0.0.1', '[]', '2019-05-02 22:49:19', '2019-05-02 22:49:19'),
(331, NULL, 1, 'system_admin/auth/users/create', 'GET', '127.0.0.1', '[]', '2019-05-02 23:30:23', '2019-05-02 23:30:23'),
(332, NULL, 1, 'system_admin/auth/users/create', 'GET', '127.0.0.1', '[]', '2019-05-02 23:30:27', '2019-05-02 23:30:27'),
(333, NULL, 1, 'system_admin/auth/users/create', 'GET', '127.0.0.1', '[]', '2019-05-02 23:31:53', '2019-05-02 23:31:53'),
(334, NULL, 1, 'system_admin/auth/users/create', 'GET', '127.0.0.1', '[]', '2019-05-02 23:34:01', '2019-05-02 23:34:01'),
(335, NULL, 1, 'system_admin/auth/users/create', 'GET', '127.0.0.1', '[]', '2019-05-02 23:40:51', '2019-05-02 23:40:51'),
(336, NULL, 1, 'system_admin/auth/users/create', 'GET', '127.0.0.1', '[]', '2019-05-02 23:41:13', '2019-05-02 23:41:13'),
(337, NULL, 1, 'system_admin/auth/users/create', 'GET', '127.0.0.1', '[]', '2019-05-02 23:42:48', '2019-05-02 23:42:48'),
(338, NULL, 1, 'system_admin/auth/users/create', 'GET', '127.0.0.1', '[]', '2019-05-02 23:43:39', '2019-05-02 23:43:39'),
(339, NULL, 1, 'system_admin/auth/users/create', 'GET', '127.0.0.1', '[]', '2019-05-02 23:43:56', '2019-05-02 23:43:56'),
(340, NULL, 1, 'system_admin/auth/users/create', 'GET', '127.0.0.1', '[]', '2019-05-03 14:10:26', '2019-05-03 14:10:26'),
(341, NULL, 1, 'system_admin', 'GET', '127.0.0.1', '[]', '2019-05-03 19:20:56', '2019-05-03 19:20:56'),
(342, NULL, 1, 'system_admin/auth/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-03 19:22:53', '2019-05-03 19:22:53'),
(343, NULL, 1, 'system_admin/auth/users', 'GET', '127.0.0.1', '[]', '2019-05-03 19:43:23', '2019-05-03 19:43:23'),
(344, NULL, 1, 'system_admin/auth/users', 'GET', '127.0.0.1', '[]', '2019-05-03 19:43:45', '2019-05-03 19:43:45'),
(345, NULL, 1, 'system_admin/auth/users', 'GET', '127.0.0.1', '[]', '2019-05-03 19:44:11', '2019-05-03 19:44:11'),
(346, NULL, 1, 'system_admin/auth/users', 'GET', '127.0.0.1', '[]', '2019-05-03 19:44:19', '2019-05-03 19:44:19'),
(347, NULL, 1, 'system_admin/auth/users', 'GET', '127.0.0.1', '[]', '2019-05-03 19:45:42', '2019-05-03 19:45:42'),
(348, NULL, 1, 'system_admin/auth/users', 'GET', '127.0.0.1', '[]', '2019-05-03 19:45:44', '2019-05-03 19:45:44'),
(349, NULL, 1, 'system_admin/auth/users', 'GET', '127.0.0.1', '[]', '2019-05-03 19:45:51', '2019-05-03 19:45:51'),
(350, NULL, 1, 'system_admin/auth/users', 'GET', '127.0.0.1', '[]', '2019-05-03 19:46:01', '2019-05-03 19:46:01'),
(351, NULL, 1, 'system_admin/auth/users', 'GET', '127.0.0.1', '[]', '2019-05-03 19:46:38', '2019-05-03 19:46:38'),
(352, NULL, 1, 'system_admin/auth/users', 'GET', '127.0.0.1', '[]', '2019-05-03 19:47:45', '2019-05-03 19:47:45'),
(353, NULL, 1, 'system_admin/auth/users', 'GET', '127.0.0.1', '[]', '2019-05-03 20:12:18', '2019-05-03 20:12:18'),
(354, NULL, 1, 'system_admin/auth/users', 'GET', '127.0.0.1', '[]', '2019-05-03 20:12:34', '2019-05-03 20:12:34'),
(355, NULL, 1, 'system_admin/auth/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-03 20:12:49', '2019-05-03 20:12:49'),
(356, NULL, 1, 'system_admin/auth/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-03 20:12:51', '2019-05-03 20:12:51'),
(357, NULL, 1, 'system_admin/auth/users/create', 'GET', '127.0.0.1', '[]', '2019-05-03 20:12:55', '2019-05-03 20:12:55'),
(358, NULL, 1, 'system_admin/auth/users/create', 'GET', '127.0.0.1', '[]', '2019-05-03 20:15:35', '2019-05-03 20:15:35'),
(359, NULL, 1, 'system_admin/auth/users/create', 'GET', '127.0.0.1', '[]', '2019-05-03 20:16:44', '2019-05-03 20:16:44'),
(360, NULL, 1, 'system_admin/auth/users/create', 'GET', '127.0.0.1', '[]', '2019-05-03 20:18:11', '2019-05-03 20:18:11'),
(361, NULL, 1, 'system_admin/auth/users/create', 'GET', '127.0.0.1', '[]', '2019-05-03 20:19:15', '2019-05-03 20:19:15'),
(362, NULL, 1, 'system_admin/auth/users/create', 'GET', '127.0.0.1', '[]', '2019-05-03 20:19:32', '2019-05-03 20:19:32'),
(363, NULL, 1, 'system_admin/auth/users/create', 'GET', '127.0.0.1', '[]', '2019-05-03 20:19:52', '2019-05-03 20:19:52'),
(364, NULL, 1, 'system_admin/auth/users/create', 'GET', '127.0.0.1', '[]', '2019-05-03 20:21:53', '2019-05-03 20:21:53'),
(365, NULL, 1, 'system_admin/auth/users/create', 'GET', '127.0.0.1', '[]', '2019-05-04 21:37:31', '2019-05-04 21:37:31'),
(366, NULL, 1, 'system_admin/auth/users/create', 'GET', '127.0.0.1', '[]', '2019-05-04 21:38:17', '2019-05-04 21:38:17'),
(367, NULL, 1, 'system_admin/auth/users/create', 'GET', '127.0.0.1', '[]', '2019-05-04 22:28:10', '2019-05-04 22:28:10'),
(368, NULL, 1, 'system_admin/auth/users/create', 'GET', '127.0.0.1', '[]', '2019-05-04 22:44:59', '2019-05-04 22:44:59'),
(369, NULL, 1, 'system_admin/auth/users/create', 'GET', '127.0.0.1', '[]', '2019-05-04 22:53:48', '2019-05-04 22:53:48'),
(370, NULL, 1, 'system_admin/auth/users/create', 'GET', '127.0.0.1', '[]', '2019-05-04 22:54:18', '2019-05-04 22:54:18'),
(371, NULL, 1, 'system_admin/auth/users/create', 'GET', '127.0.0.1', '[]', '2019-05-04 22:54:57', '2019-05-04 22:54:57'),
(372, NULL, 1, 'system_admin/auth/login', 'GET', '127.0.0.1', '[]', '2019-05-04 22:55:04', '2019-05-04 22:55:04'),
(373, NULL, 1, 'system_admin/auth/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-04 22:55:10', '2019-05-04 22:55:10'),
(374, NULL, 1, 'system_admin/auth/users/create', 'GET', '127.0.0.1', '[]', '2019-05-04 22:55:13', '2019-05-04 22:55:13'),
(375, NULL, 1, 'system_admin/auth/users/create', 'GET', '127.0.0.1', '[]', '2019-05-04 23:30:43', '2019-05-04 23:30:43'),
(376, NULL, 1, 'system_admin/auth/users/create', 'GET', '127.0.0.1', '[]', '2019-05-04 23:30:55', '2019-05-04 23:30:55'),
(377, NULL, 1, 'system_admin/auth/users/create', 'GET', '127.0.0.1', '[]', '2019-05-04 23:31:11', '2019-05-04 23:31:11'),
(378, NULL, 1, 'system_admin/auth/users/create', 'GET', '127.0.0.1', '[]', '2019-05-04 23:34:32', '2019-05-04 23:34:32'),
(379, NULL, 1, 'system_admin/auth/users/create', 'GET', '127.0.0.1', '[]', '2019-05-04 23:34:45', '2019-05-04 23:34:45'),
(380, NULL, 1, 'system_admin/auth/users/create', 'GET', '127.0.0.1', '[]', '2019-05-04 23:40:44', '2019-05-04 23:40:44'),
(381, NULL, 1, 'system_admin/auth/users/create', 'GET', '127.0.0.1', '[]', '2019-05-04 23:49:26', '2019-05-04 23:49:26');
INSERT INTO `admin_operation_log` (`id`, `company_id`, `user_id`, `path`, `method`, `ip`, `input`, `created_at`, `updated_at`) VALUES
(382, NULL, 1, 'system_admin/auth/users/create', 'GET', '127.0.0.1', '[]', '2019-05-04 23:49:41', '2019-05-04 23:49:41'),
(383, NULL, 1, 'system_admin/auth/users/create', 'GET', '127.0.0.1', '[]', '2019-05-04 23:50:37', '2019-05-04 23:50:37'),
(384, NULL, 1, 'system_admin/auth/users/create', 'GET', '127.0.0.1', '[]', '2019-05-04 23:50:50', '2019-05-04 23:50:50'),
(385, NULL, 1, 'system_admin/auth/users/create', 'GET', '127.0.0.1', '[]', '2019-05-04 23:52:35', '2019-05-04 23:52:35'),
(386, NULL, 1, 'system_admin/auth/users/create', 'GET', '127.0.0.1', '[]', '2019-05-04 23:53:01', '2019-05-04 23:53:01'),
(387, NULL, 1, 'system_admin/auth/users/create', 'GET', '127.0.0.1', '[]', '2019-05-04 23:55:36', '2019-05-04 23:55:36'),
(388, NULL, 1, 'system_admin/auth/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-04 23:55:51', '2019-05-04 23:55:51'),
(389, NULL, 1, 'system_admin/auth/users/create', 'GET', '127.0.0.1', '[]', '2019-05-04 23:55:54', '2019-05-04 23:55:54'),
(390, NULL, 1, 'system_admin/auth/roles', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-04 23:59:40', '2019-05-04 23:59:40'),
(391, NULL, 1, 'system_admin', 'GET', '127.0.0.1', '[]', '2019-05-05 01:02:57', '2019-05-05 01:02:57'),
(392, NULL, 1, 'system_admin/shop_category', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-05 01:03:08', '2019-05-05 01:03:08'),
(393, NULL, 1, 'system_admin/shop_category/create', 'GET', '127.0.0.1', '[]', '2019-05-05 01:04:02', '2019-05-05 01:04:02'),
(394, NULL, 1, 'system_admin/shop_category/create', 'GET', '127.0.0.1', '[]', '2019-05-05 01:06:46', '2019-05-05 01:06:46'),
(395, NULL, 1, 'system_admin/shop_category/create', 'GET', '127.0.0.1', '[]', '2019-05-05 01:07:04', '2019-05-05 01:07:04'),
(396, NULL, 1, 'system_admin/shop_category/create', 'GET', '127.0.0.1', '[]', '2019-05-05 01:07:29', '2019-05-05 01:07:29'),
(397, NULL, 1, 'system_admin/shop_category', 'POST', '127.0.0.1', '{\"en__name\":\"cat1\",\"en__keyword\":\"cat1 keyword\",\"en__description\":\"cat1 description\",\"parent\":\"0\",\"sort\":\"0\",\"top\":\"off\",\"status\":\"on\",\"_token\":\"vVH33tJFrKCj6tCflM0WSsm7aR5qSXOxKV9VPX8O\",\"_previous_\":\"http:\\/\\/localhost:8000\\/system_admin\\/shop_category\"}', '2019-05-05 01:09:29', '2019-05-05 01:09:29'),
(398, NULL, 1, 'system_admin/shop_category', 'GET', '127.0.0.1', '[]', '2019-05-05 01:09:31', '2019-05-05 01:09:31'),
(399, NULL, 1, 'system_admin/shop_category', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-05 01:11:55', '2019-05-05 01:11:55'),
(400, NULL, 1, 'system_admin/shop_product', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-05 01:11:57', '2019-05-05 01:11:57'),
(401, NULL, 1, 'system_admin/shop_product', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\",\"name\":\"meg\",\"sku\":null}', '2019-05-05 01:12:32', '2019-05-05 01:12:32'),
(402, NULL, 1, 'system_admin/shop_product', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\",\"name\":null,\"sku\":null}', '2019-05-05 01:12:36', '2019-05-05 01:12:36'),
(403, NULL, 1, 'system_admin/shop_product', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\",\"name\":\"polo\",\"sku\":null}', '2019-05-05 01:12:48', '2019-05-05 01:12:48'),
(404, NULL, 1, 'system_admin/shop_product', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\",\"name\":\"polo x\",\"sku\":null}', '2019-05-05 01:12:57', '2019-05-05 01:12:57'),
(405, NULL, 1, 'system_admin/shop_product', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\",\"name\":\"polo\",\"sku\":null}', '2019-05-05 01:13:01', '2019-05-05 01:13:01'),
(406, NULL, 1, 'system_admin/shop_product/create', 'GET', '127.0.0.1', '[]', '2019-05-05 01:13:06', '2019-05-05 01:13:06'),
(407, NULL, 1, 'system_admin/shop_product/create', 'GET', '127.0.0.1', '[]', '2019-05-05 01:18:26', '2019-05-05 01:18:26'),
(408, NULL, 1, 'system_admin/shop_product', 'POST', '127.0.0.1', '{\"en__name\":\"prod1\",\"en__keyword\":\"prod1 keyword\",\"en__description\":\"prod1 desc\",\"en__content\":\"prod 1 long data\",\"category_id\":\"19\",\"price\":\"200\",\"cost\":\"120\",\"stock\":\"8\",\"sku\":null,\"brand_id\":\"0\",\"vendor_id\":\"0\",\"status\":\"on\",\"sort\":\"1\",\"type\":\"0\",\"date_available\":null,\"_token\":\"vVH33tJFrKCj6tCflM0WSsm7aR5qSXOxKV9VPX8O\",\"_previous_\":\"http:\\/\\/localhost:8000\\/system_admin\\/shop_product?&name=polo+&sku=\"}', '2019-05-05 01:20:30', '2019-05-05 01:20:30'),
(409, NULL, 1, 'system_admin/shop_product/create', 'GET', '127.0.0.1', '[]', '2019-05-05 01:20:30', '2019-05-05 01:20:30'),
(410, NULL, 1, 'system_admin/shop_product', 'POST', '127.0.0.1', '{\"en__name\":\"prod1\",\"en__keyword\":\"prod1 keyword\",\"en__description\":\"prod1 desc\",\"en__content\":\"prod 1 long data\",\"category_id\":\"19\",\"price\":\"200\",\"cost\":\"120\",\"stock\":\"8\",\"sku\":\"prod1\",\"brand_id\":\"0\",\"vendor_id\":\"0\",\"status\":\"on\",\"sort\":\"1\",\"type\":\"0\",\"date_available\":null,\"_token\":\"vVH33tJFrKCj6tCflM0WSsm7aR5qSXOxKV9VPX8O\"}', '2019-05-05 01:20:50', '2019-05-05 01:20:50'),
(411, NULL, 1, 'system_admin/shop_product', 'GET', '127.0.0.1', '[]', '2019-05-05 01:20:51', '2019-05-05 01:20:51'),
(412, NULL, 1, 'system_admin/shop_product/50/edit', 'GET', '127.0.0.1', '[]', '2019-05-05 01:22:29', '2019-05-05 01:22:29'),
(413, NULL, 1, 'system_admin', 'GET', '127.0.0.1', '[]', '2019-05-05 01:25:42', '2019-05-05 01:25:42'),
(414, NULL, 1, 'system_admin/shop_category', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-05 01:25:55', '2019-05-05 01:25:55'),
(415, NULL, 1, 'system_admin/shop_category/create', 'GET', '127.0.0.1', '[]', '2019-05-05 01:25:58', '2019-05-05 01:25:58'),
(416, NULL, 1, 'system_admin/shop_category/create', 'GET', '127.0.0.1', '[]', '2019-05-05 03:01:17', '2019-05-05 03:01:17'),
(417, NULL, 1, 'system_admin/shop_category', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-05 03:01:38', '2019-05-05 03:01:38'),
(418, NULL, 1, 'system_admin/shop_product', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-05 03:01:54', '2019-05-05 03:01:54'),
(419, NULL, 1, 'system_admin/shop_product/create', 'GET', '127.0.0.1', '[]', '2019-05-05 03:02:01', '2019-05-05 03:02:01'),
(420, NULL, 1, 'system_admin/shop_product/create', 'GET', '127.0.0.1', '[]', '2019-05-05 03:03:36', '2019-05-05 03:03:36'),
(421, NULL, 1, 'system_admin/shop_page', 'GET', '127.0.0.1', '[]', '2019-05-05 03:04:11', '2019-05-05 03:04:11'),
(422, NULL, 1, 'system_admin/shop_product', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-05 03:04:18', '2019-05-05 03:04:18'),
(423, NULL, 1, 'system_admin/shop_special_price', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-05 03:04:31', '2019-05-05 03:04:31'),
(424, NULL, 1, 'system_admin/shop_special_price/create', 'GET', '127.0.0.1', '[]', '2019-05-05 03:04:41', '2019-05-05 03:04:41'),
(425, NULL, 1, 'system_admin/get_info/productInfo', 'GET', '127.0.0.1', '{\"id\":null}', '2019-05-05 03:04:43', '2019-05-05 03:04:43'),
(426, NULL, 1, 'system_admin/shop_special_price', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-05 03:52:23', '2019-05-05 03:52:23'),
(427, NULL, 1, 'system_admin/shop_special_price/create', 'GET', '127.0.0.1', '[]', '2019-05-05 03:52:25', '2019-05-05 03:52:25'),
(428, NULL, 1, 'system_admin/get_info/productInfo', 'GET', '127.0.0.1', '{\"id\":null}', '2019-05-05 03:52:26', '2019-05-05 03:52:26'),
(429, NULL, 1, 'system_admin/shop_brand', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-05 03:52:39', '2019-05-05 03:52:39'),
(430, NULL, 1, 'system_admin/shop_product', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-05 03:52:43', '2019-05-05 03:52:43'),
(431, NULL, 1, 'system_admin/shop_product/50/edit', 'GET', '127.0.0.1', '[]', '2019-05-05 03:52:47', '2019-05-05 03:52:47'),
(432, NULL, 1, 'system_admin/shop_product/50/edit', 'GET', '127.0.0.1', '[]', '2019-05-05 04:23:41', '2019-05-05 04:23:41'),
(433, NULL, 1, 'system_admin/shop_product/50/edit', 'GET', '127.0.0.1', '[]', '2019-05-05 04:24:24', '2019-05-05 04:24:24'),
(434, NULL, 1, 'system_admin/shop_product/50/edit', 'GET', '127.0.0.1', '[]', '2019-05-05 04:24:32', '2019-05-05 04:24:32'),
(435, NULL, 1, 'system_admin/shop_product/50/edit', 'GET', '127.0.0.1', '[]', '2019-05-05 04:32:52', '2019-05-05 04:32:52'),
(436, NULL, 1, 'system_admin/shop_product/50/edit', 'GET', '127.0.0.1', '[]', '2019-05-05 04:36:07', '2019-05-05 04:36:07'),
(437, NULL, 1, 'system_admin/shop_product/50/edit', 'GET', '127.0.0.1', '[]', '2019-05-05 04:37:08', '2019-05-05 04:37:08'),
(438, NULL, 1, 'system_admin/shop_product/50/edit', 'GET', '127.0.0.1', '[]', '2019-05-05 04:38:03', '2019-05-05 04:38:03'),
(439, NULL, 1, 'system_admin/shop_vendor', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-05 04:39:15', '2019-05-05 04:39:15'),
(440, NULL, 1, 'system_admin/shop_vendor/create', 'GET', '127.0.0.1', '[]', '2019-05-05 04:39:21', '2019-05-05 04:39:21'),
(441, NULL, 1, 'system_admin/shop_vendor/create', 'GET', '127.0.0.1', '[]', '2019-05-05 04:41:46', '2019-05-05 04:41:46'),
(442, NULL, 1, 'system_admin/shop_vendor', 'POST', '127.0.0.1', '{\"name\":\"mahmoud\",\"email\":\"ms_ms25490@yahoo.com\",\"phone\":\"1142931228\",\"address\":\"caru egt\",\"sort\":\"0\",\"_token\":\"kRMdQc73J6P0utcHNVWtjAB9ZN8SP9T4iWj2SuGZ\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/system_admin\\/shop_vendor\"}', '2019-05-05 04:42:27', '2019-05-05 04:42:27'),
(443, NULL, 1, 'system_admin/shop_vendor', 'GET', '127.0.0.1', '[]', '2019-05-05 04:42:28', '2019-05-05 04:42:28'),
(444, NULL, 1, 'system_admin/process/productImport', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-05 04:42:54', '2019-05-05 04:42:54'),
(445, NULL, 1, 'system_admin/shop_attribute_group', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-05 05:02:43', '2019-05-05 05:02:43'),
(446, NULL, 1, 'system_admin/shop_attribute_group/create', 'GET', '127.0.0.1', '[]', '2019-05-05 05:03:07', '2019-05-05 05:03:07'),
(447, NULL, 1, 'system_admin/shop_attribute_group/create', 'GET', '127.0.0.1', '[]', '2019-05-07 02:07:38', '2019-05-07 02:07:38'),
(448, NULL, 1, 'system_admin/shop_category', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-07 02:08:29', '2019-05-07 02:08:29'),
(449, NULL, 1, 'system_admin/shop_product', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-07 02:09:11', '2019-05-07 02:09:11'),
(450, NULL, 1, 'system_admin/shop_special_price', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-07 02:09:25', '2019-05-07 02:09:25'),
(451, NULL, 1, 'system_admin/shop_product', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-07 02:09:28', '2019-05-07 02:09:28'),
(452, NULL, 1, 'system_admin/shop_attribute_group', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-07 02:09:36', '2019-05-07 02:09:36'),
(453, NULL, 1, 'system_admin/shop_attribute_group/create', 'GET', '127.0.0.1', '[]', '2019-05-07 02:19:06', '2019-05-07 02:19:06'),
(454, NULL, 1, 'system_admin/shop_attribute_group', 'POST', '127.0.0.1', '{\"name\":\"\\u062f\\u0647\\u0628\\u064a\",\"status\":\"on\",\"sort\":\"1\",\"type\":\"radio\",\"_token\":\"r9KWXM3lOpdP4WELwSE1fxyLTeldL8HMiWIJZejR\",\"after-save\":\"1\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/system_admin\\/shop_attribute_group\"}', '2019-05-07 02:21:39', '2019-05-07 02:21:39'),
(455, NULL, 1, 'system_admin/shop_attribute_group/3/edit', 'GET', '127.0.0.1', '[]', '2019-05-07 02:21:40', '2019-05-07 02:21:40'),
(456, NULL, 1, 'system_admin/shop_attribute_group', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-07 02:22:08', '2019-05-07 02:22:08'),
(457, NULL, 1, 'system_admin/shop_product', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-07 02:22:30', '2019-05-07 02:22:30'),
(458, NULL, 1, 'system_admin/shop_product/50/edit', 'GET', '127.0.0.1', '[]', '2019-05-07 02:22:38', '2019-05-07 02:22:38'),
(459, NULL, 1, 'system_admin/shop_brand', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-07 02:24:10', '2019-05-07 02:24:10'),
(460, NULL, 1, 'system_admin/shop_order', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-07 02:24:27', '2019-05-07 02:24:27'),
(461, NULL, 1, 'system_admin/shop_order/create', 'GET', '127.0.0.1', '[]', '2019-05-07 02:34:45', '2019-05-07 02:34:45'),
(462, NULL, 1, 'system_admin/shop_order/create', 'GET', '127.0.0.1', '[]', '2019-05-07 02:49:44', '2019-05-07 02:49:44'),
(463, NULL, 1, 'system_admin/layout', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-07 02:50:04', '2019-05-07 02:50:04'),
(464, NULL, 1, 'system_admin/layout/create', 'GET', '127.0.0.1', '[]', '2019-05-07 02:50:09', '2019-05-07 02:50:09'),
(465, NULL, 1, 'system_admin/extensions/Payment', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-07 02:50:36', '2019-05-07 02:50:36'),
(466, NULL, 1, 'system_admin/shop_order', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-07 02:51:19', '2019-05-07 02:51:19'),
(467, NULL, 1, 'system_admin/shop_order/create', 'GET', '127.0.0.1', '[]', '2019-05-07 02:51:24', '2019-05-07 02:51:24'),
(468, NULL, 1, 'system_admin/shop_customer', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-07 02:51:30', '2019-05-07 02:51:30'),
(469, NULL, 1, 'system_admin/shop_customer/create', 'GET', '127.0.0.1', '[]', '2019-05-07 02:51:34', '2019-05-07 02:51:34'),
(470, NULL, 1, 'system_admin/shop_customer', 'POST', '127.0.0.1', '{\"name\":\"mahmoud customer\",\"email\":\"ms_ms25490@yahoo.com\",\"password\":null,\"address1\":\"caru egt\",\"address2\":null,\"phone\":\"1142931228\",\"_token\":\"r9KWXM3lOpdP4WELwSE1fxyLTeldL8HMiWIJZejR\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/system_admin\\/shop_customer\"}', '2019-05-07 03:02:14', '2019-05-07 03:02:14'),
(471, NULL, 1, 'system_admin/shop_customer/create', 'GET', '127.0.0.1', '[]', '2019-05-07 03:02:15', '2019-05-07 03:02:15'),
(472, NULL, 1, 'system_admin/shop_customer/create', 'GET', '127.0.0.1', '[]', '2019-05-07 03:10:12', '2019-05-07 03:10:12'),
(473, NULL, 1, 'system_admin/shop_customer', 'POST', '127.0.0.1', '{\"name\":\"mahmoud\",\"email\":\"ms_ms25490@yahoo.com\",\"password\":null,\"address1\":\"caru egt\",\"address2\":null,\"phone\":\"1142931228\",\"_token\":\"r9KWXM3lOpdP4WELwSE1fxyLTeldL8HMiWIJZejR\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/system_admin\\/shop_customer\"}', '2019-05-07 03:10:17', '2019-05-07 03:10:17'),
(474, NULL, 1, 'system_admin/shop_customer/create', 'GET', '127.0.0.1', '[]', '2019-05-07 03:10:18', '2019-05-07 03:10:18'),
(475, NULL, 1, 'system_admin/shop_customer', 'POST', '127.0.0.1', '{\"name\":\"mahmoud\",\"email\":\"ms_ms25490@yahoo.com\",\"password\":\".f\",\"address1\":\"caru egt\",\"address2\":null,\"phone\":\"1142931228\",\"_token\":\"r9KWXM3lOpdP4WELwSE1fxyLTeldL8HMiWIJZejR\"}', '2019-05-07 03:10:41', '2019-05-07 03:10:41'),
(476, NULL, 1, 'system_admin/shop_customer/create', 'GET', '127.0.0.1', '[]', '2019-05-07 03:10:42', '2019-05-07 03:10:42'),
(477, NULL, 1, 'system_admin/shop_customer', 'POST', '127.0.0.1', '{\"name\":\"mahmoud\",\"email\":\"ms_ms25490@yahoo.com\",\"password\":\".f\",\"address1\":\"caru egt\",\"address2\":null,\"phone\":\"1142931228\",\"_token\":\"r9KWXM3lOpdP4WELwSE1fxyLTeldL8HMiWIJZejR\"}', '2019-05-07 03:13:48', '2019-05-07 03:13:48'),
(478, NULL, 1, 'system_admin/shop_customer/create', 'GET', '127.0.0.1', '[]', '2019-05-07 03:13:49', '2019-05-07 03:13:49'),
(479, NULL, 1, 'system_admin/shop_customer', 'POST', '127.0.0.1', '{\"name\":\"mahmoud\",\"email\":\"ms_ms25490@yahoo.com\",\"password\":\".f\",\"address1\":\"caru egt\",\"address2\":null,\"phone\":\"1142931228\",\"_token\":\"r9KWXM3lOpdP4WELwSE1fxyLTeldL8HMiWIJZejR\"}', '2019-05-07 03:15:02', '2019-05-07 03:15:02'),
(480, NULL, 1, 'system_admin/shop_customer/create', 'GET', '127.0.0.1', '[]', '2019-05-07 03:15:02', '2019-05-07 03:15:02'),
(481, NULL, 1, 'system_admin/shop_customer', 'POST', '127.0.0.1', '{\"name\":\"mahmoud\",\"email\":\"ms_ms25490@yahoo.com\",\"password\":\"123456\",\"address1\":\"caru egt\",\"address2\":null,\"phone\":\"1142931228\",\"_token\":\"r9KWXM3lOpdP4WELwSE1fxyLTeldL8HMiWIJZejR\"}', '2019-05-07 03:15:28', '2019-05-07 03:15:28'),
(482, NULL, 1, 'system_admin/shop_customer/create', 'GET', '127.0.0.1', '[]', '2019-05-07 03:15:29', '2019-05-07 03:15:29'),
(483, NULL, 1, 'system_admin/shop_customer', 'POST', '127.0.0.1', '{\"name\":\"mahmoud\",\"email\":\"ms_ms25490@yahoo.com\",\"password\":\"123456\",\"address1\":\"caru egt\",\"address2\":null,\"phone\":\"1142931228\",\"_token\":\"r9KWXM3lOpdP4WELwSE1fxyLTeldL8HMiWIJZejR\"}', '2019-05-07 03:41:09', '2019-05-07 03:41:09'),
(484, NULL, 1, 'system_admin/shop_customer', 'GET', '127.0.0.1', '[]', '2019-05-07 03:41:09', '2019-05-07 03:41:09'),
(485, NULL, 1, 'system_admin/shop_order_status', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-07 03:59:08', '2019-05-07 03:59:08'),
(486, NULL, 1, 'system_admin/shop_order_status/create', 'GET', '127.0.0.1', '[]', '2019-05-07 03:59:13', '2019-05-07 03:59:13'),
(487, NULL, 1, 'system_admin/shop_order_status', 'POST', '127.0.0.1', '{\"name\":\"new\",\"_token\":\"r9KWXM3lOpdP4WELwSE1fxyLTeldL8HMiWIJZejR\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/system_admin\\/shop_order_status\"}', '2019-05-07 03:59:21', '2019-05-07 03:59:21'),
(488, NULL, 1, 'system_admin/shop_order_status/create', 'GET', '127.0.0.1', '[]', '2019-05-07 03:59:22', '2019-05-07 03:59:22'),
(489, NULL, 1, 'system_admin/shop_order_status', 'POST', '127.0.0.1', '{\"name\":\"new\",\"_token\":\"r9KWXM3lOpdP4WELwSE1fxyLTeldL8HMiWIJZejR\"}', '2019-05-07 04:02:56', '2019-05-07 04:02:56'),
(490, NULL, 1, 'system_admin/shop_order_status', 'GET', '127.0.0.1', '[]', '2019-05-07 04:02:56', '2019-05-07 04:02:56'),
(491, NULL, 1, 'system_admin/shop_order_status/create', 'GET', '127.0.0.1', '[]', '2019-05-07 04:03:02', '2019-05-07 04:03:02'),
(492, NULL, 1, 'system_admin/shop_order_status', 'POST', '127.0.0.1', '{\"name\":\"processing\",\"_token\":\"r9KWXM3lOpdP4WELwSE1fxyLTeldL8HMiWIJZejR\",\"after-save\":\"2\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/system_admin\\/shop_order_status\"}', '2019-05-07 04:03:11', '2019-05-07 04:03:11'),
(493, NULL, 1, 'system_admin/shop_order_status/create', 'GET', '127.0.0.1', '[]', '2019-05-07 04:03:11', '2019-05-07 04:03:11'),
(494, NULL, 1, 'system_admin/shop_order_status', 'POST', '127.0.0.1', '{\"name\":\"done\",\"_token\":\"r9KWXM3lOpdP4WELwSE1fxyLTeldL8HMiWIJZejR\",\"after-save\":\"2\"}', '2019-05-07 04:03:15', '2019-05-07 04:03:15'),
(495, NULL, 1, 'system_admin/shop_order_status/create', 'GET', '127.0.0.1', '[]', '2019-05-07 04:03:15', '2019-05-07 04:03:15'),
(496, NULL, 1, 'system_admin/shop_order', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-07 04:04:05', '2019-05-07 04:04:05'),
(497, NULL, 1, 'system_admin/shop_order/create', 'GET', '127.0.0.1', '[]', '2019-05-07 04:04:07', '2019-05-07 04:04:07'),
(498, NULL, 1, 'system_admin/shop_customer', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-07 04:04:19', '2019-05-07 04:04:19'),
(499, NULL, 1, 'system_admin/shop_order', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-07 04:04:28', '2019-05-07 04:04:28'),
(500, NULL, 1, 'system_admin/shop_order/create', 'GET', '127.0.0.1', '[]', '2019-05-07 04:04:30', '2019-05-07 04:04:30'),
(501, NULL, 1, 'system_admin/shop_order/create', 'GET', '127.0.0.1', '[]', '2019-05-07 04:05:24', '2019-05-07 04:05:24'),
(502, NULL, 1, 'system_admin/shop_order/create', 'GET', '127.0.0.1', '[]', '2019-05-07 04:06:33', '2019-05-07 04:06:33'),
(503, NULL, 1, 'system_admin/shop_order/create', 'GET', '127.0.0.1', '[]', '2019-05-07 04:10:53', '2019-05-07 04:10:53'),
(504, NULL, 1, 'system_admin/get_info/userInfo', 'GET', '127.0.0.1', '{\"id\":\"1\"}', '2019-05-07 04:10:56', '2019-05-07 04:10:56'),
(505, NULL, 1, 'system_admin/shop_order/create', 'GET', '127.0.0.1', '[]', '2019-05-07 04:17:10', '2019-05-07 04:17:10'),
(506, NULL, 1, 'system_admin/shop_order/create', 'GET', '127.0.0.1', '[]', '2019-05-07 04:24:47', '2019-05-07 04:24:47'),
(507, NULL, 1, 'system_admin/subscribe', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-07 04:25:14', '2019-05-07 04:25:14'),
(508, NULL, 1, 'system_admin/subscribe/create', 'GET', '127.0.0.1', '[]', '2019-05-07 04:25:18', '2019-05-07 04:25:18'),
(509, NULL, 1, 'system_admin/extensions/Payment', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-07 04:25:31', '2019-05-07 04:25:31'),
(510, NULL, 1, 'system_admin/extensions/Payment', 'GET', '127.0.0.1', '{\"action\":\"config\",\"extensionKey\":\"Cash\"}', '2019-05-07 04:25:36', '2019-05-07 04:25:36'),
(511, NULL, 1, 'system_admin/extensions/Payment', 'GET', '127.0.0.1', '[]', '2019-05-07 04:25:40', '2019-05-07 04:25:40'),
(512, NULL, 1, 'system_admin/extensions/Shipping', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-07 04:25:57', '2019-05-07 04:25:57'),
(513, NULL, 1, 'system_admin/extensions/Shipping', 'GET', '127.0.0.1', '{\"action\":\"config\",\"extensionKey\":\"ShippingStandard\"}', '2019-05-07 04:26:09', '2019-05-07 04:26:09'),
(514, NULL, 1, 'system_admin/extensions/Payment', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-07 04:26:34', '2019-05-07 04:26:34'),
(515, NULL, 1, 'system_admin/extensions/Shipping', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-07 04:26:35', '2019-05-07 04:26:35'),
(516, NULL, 1, 'system_admin/subscribe', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-07 04:27:38', '2019-05-07 04:27:38'),
(517, NULL, 1, 'system_admin/shop_customer', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-07 04:27:39', '2019-05-07 04:27:39'),
(518, NULL, 1, 'system_admin/shop_customer/create', 'GET', '127.0.0.1', '[]', '2019-05-07 04:27:45', '2019-05-07 04:27:45'),
(519, NULL, 1, 'system_admin/shop_customer', 'GET', '127.0.0.1', '[]', '2019-05-08 01:24:39', '2019-05-08 01:24:39'),
(520, NULL, 1, 'system_admin/shop_order', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-08 01:25:18', '2019-05-08 01:25:18'),
(521, NULL, 1, 'system_admin/shop_order/create', 'GET', '127.0.0.1', '[]', '2019-05-08 01:25:22', '2019-05-08 01:25:22'),
(522, NULL, 1, 'system_admin/shop_order/create', 'GET', '127.0.0.1', '[]', '2019-05-08 01:31:10', '2019-05-08 01:31:10'),
(523, NULL, 1, 'system_admin', 'GET', '127.0.0.1', '[]', '2019-05-08 01:32:07', '2019-05-08 01:32:07'),
(524, NULL, 1, 'system_admin/shop_order', 'GET', '127.0.0.1', '[]', '2019-05-08 01:32:11', '2019-05-08 01:32:11'),
(525, NULL, 1, 'system_admin/shop_order_edit/1', 'GET', '127.0.0.1', '[]', '2019-05-08 01:32:45', '2019-05-08 01:32:45'),
(526, NULL, 1, 'system_admin/shop_order', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-08 01:33:03', '2019-05-08 01:33:03'),
(527, NULL, 1, 'system_admin/shop_order/create', 'GET', '127.0.0.1', '[]', '2019-05-08 01:41:01', '2019-05-08 01:41:01'),
(528, NULL, 1, 'system_admin/get_info/userInfo', 'GET', '127.0.0.1', '{\"id\":\"1\"}', '2019-05-08 01:41:07', '2019-05-08 01:41:07'),
(529, NULL, 1, 'system_admin/shop_order', 'POST', '127.0.0.1', '{\"user_id\":\"1\",\"toname\":\"mahmoud\",\"address1\":\"caru egt\",\"address2\":null,\"phone\":\"1142931228_\",\"currency\":\"EGP\",\"exchange_rate\":\"1\",\"comment\":null,\"status\":\"6\",\"email\":null,\"_token\":\"aITYGUhf5qeumJ88EWXJOk4P0VLKQbmA7kv1saXI\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/system_admin\\/shop_order\"}', '2019-05-08 01:41:22', '2019-05-08 01:41:22'),
(530, NULL, 1, 'system_admin/shop_order/create', 'GET', '127.0.0.1', '[]', '2019-05-08 01:41:22', '2019-05-08 01:41:22'),
(531, NULL, 1, 'system_admin/shop_order', 'POST', '127.0.0.1', '{\"user_id\":\"1\",\"toname\":\"mahmoud\",\"address1\":\"caru egt\",\"address2\":null,\"phone\":\"1142931228_\",\"currency\":\"EGP\",\"exchange_rate\":\"1\",\"comment\":null,\"status\":\"6\",\"email\":null,\"_token\":\"aITYGUhf5qeumJ88EWXJOk4P0VLKQbmA7kv1saXI\"}', '2019-05-08 01:43:09', '2019-05-08 01:43:09'),
(532, NULL, 1, 'system_admin/shop_order', 'GET', '127.0.0.1', '[]', '2019-05-08 01:43:10', '2019-05-08 01:43:10'),
(533, NULL, 1, 'system_admin/shop_order_edit/4', 'GET', '127.0.0.1', '[]', '2019-05-08 01:43:21', '2019-05-08 01:43:21'),
(534, NULL, 1, 'system_admin/shop_order_edit/4', 'GET', '127.0.0.1', '[]', '2019-05-08 01:53:10', '2019-05-08 01:53:10'),
(535, NULL, 1, 'system_admin/shop_order_edit/4', 'GET', '127.0.0.1', '[]', '2019-05-08 01:54:41', '2019-05-08 01:54:41'),
(536, NULL, 1, 'system_admin/shop_order_edit/4', 'GET', '127.0.0.1', '[]', '2019-05-08 01:55:40', '2019-05-08 01:55:40'),
(537, NULL, 1, 'system_admin/shop_order_edit/4', 'GET', '127.0.0.1', '[]', '2019-05-08 02:12:33', '2019-05-08 02:12:33'),
(538, NULL, 1, 'system_admin/shop_order_edit/4', 'GET', '127.0.0.1', '[]', '2019-05-08 02:14:12', '2019-05-08 02:14:12'),
(539, NULL, 1, 'system_admin/shop_order_edit/4', 'GET', '127.0.0.1', '[]', '2019-05-08 02:14:44', '2019-05-08 02:14:44'),
(540, NULL, 1, 'system_admin/shop_order_edit/4', 'GET', '127.0.0.1', '[]', '2019-05-08 02:19:29', '2019-05-08 02:19:29'),
(541, NULL, 1, 'system_admin/shop_order_edit/4', 'GET', '127.0.0.1', '[]', '2019-05-08 02:19:52', '2019-05-08 02:19:52'),
(542, NULL, 1, 'system_admin/shop_order_edit/4', 'GET', '127.0.0.1', '[]', '2019-05-08 02:20:17', '2019-05-08 02:20:17'),
(543, NULL, 1, 'system_admin/shop_order_edit/4', 'GET', '127.0.0.1', '[]', '2019-05-08 02:20:40', '2019-05-08 02:20:40'),
(544, NULL, 1, 'system_admin/shop_order_edit/4', 'GET', '127.0.0.1', '[]', '2019-05-08 02:21:20', '2019-05-08 02:21:20'),
(545, NULL, 1, 'system_admin/shop_order_edit/shop_order_update', 'PUT', '127.0.0.1', '{\"name\":\"status\",\"value\":\"7\",\"pk\":\"4\",\"_token\":\"aITYGUhf5qeumJ88EWXJOk4P0VLKQbmA7kv1saXI\",\"_editable\":\"1\",\"_method\":\"PUT\"}', '2019-05-08 02:21:25', '2019-05-08 02:21:25'),
(546, NULL, 1, 'system_admin/shop_order', 'GET', '127.0.0.1', '[]', '2019-05-08 02:21:34', '2019-05-08 02:21:34'),
(547, NULL, 1, 'system_admin/shop_order_edit/4', 'GET', '127.0.0.1', '[]', '2019-05-08 02:21:51', '2019-05-08 02:21:51'),
(548, NULL, 1, 'system_admin/shop_order_edit/4', 'GET', '127.0.0.1', '[]', '2019-05-08 02:22:04', '2019-05-08 02:22:04'),
(549, NULL, 1, 'system_admin/shop_order', 'GET', '127.0.0.1', '[]', '2019-05-08 02:22:13', '2019-05-08 02:22:13'),
(550, NULL, 1, 'system_admin/shop_order', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-08 02:22:18', '2019-05-08 02:22:18'),
(551, NULL, 1, 'system_admin/shop_order', 'GET', '127.0.0.1', '[]', '2019-05-08 02:22:21', '2019-05-08 02:22:21'),
(552, NULL, 1, 'system_admin/shop_order_edit/4', 'GET', '127.0.0.1', '[]', '2019-05-08 02:22:26', '2019-05-08 02:22:26'),
(553, NULL, 1, 'system_admin/shop_order_edit/shop_order_update', 'PUT', '127.0.0.1', '{\"name\":\"status\",\"value\":\"2\",\"pk\":\"4\",\"_token\":\"aITYGUhf5qeumJ88EWXJOk4P0VLKQbmA7kv1saXI\",\"_editable\":\"1\",\"_method\":\"PUT\"}', '2019-05-08 02:22:44', '2019-05-08 02:22:44'),
(554, NULL, 1, 'system_admin/shop_order', 'GET', '127.0.0.1', '[]', '2019-05-08 02:22:50', '2019-05-08 02:22:50'),
(555, NULL, 1, 'system_admin/shop_order', 'GET', '127.0.0.1', '[]', '2019-05-08 02:24:30', '2019-05-08 02:24:30'),
(556, NULL, 1, 'system_admin/shop_order', 'GET', '127.0.0.1', '{\"_columns_\":\"id,email,subtotal,shipping,discount,total,received,payment_method,currency,exchange_rate,created_at\",\"_pjax\":\"#pjax-container\"}', '2019-05-08 02:24:53', '2019-05-08 02:24:53'),
(557, NULL, 1, 'system_admin/shop_order', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-08 02:25:00', '2019-05-08 02:25:00'),
(558, NULL, 1, 'system_admin/shop_order_edit/4', 'GET', '127.0.0.1', '[]', '2019-05-08 02:25:23', '2019-05-08 02:25:23'),
(559, NULL, 1, 'system_admin/shop_order_edit/4', 'GET', '127.0.0.1', '[]', '2019-05-08 02:25:52', '2019-05-08 02:25:52'),
(560, NULL, 1, 'system_admin/shop_order_edit/4', 'GET', '127.0.0.1', '[]', '2019-05-08 02:26:14', '2019-05-08 02:26:14'),
(561, NULL, 1, 'system_admin/shop_order', 'GET', '127.0.0.1', '[]', '2019-05-08 02:26:41', '2019-05-08 02:26:41'),
(562, NULL, 1, 'system_admin/shop_order_edit/4', 'GET', '127.0.0.1', '[]', '2019-05-08 02:26:44', '2019-05-08 02:26:44'),
(563, NULL, 1, 'system_admin/shop_order_edit/4', 'GET', '127.0.0.1', '[]', '2019-05-08 02:27:58', '2019-05-08 02:27:58'),
(564, NULL, 1, 'system_admin/shop_order_edit/4', 'GET', '127.0.0.1', '[]', '2019-05-08 02:29:06', '2019-05-08 02:29:06'),
(565, NULL, 1, 'system_admin/shop_order_edit/4', 'GET', '127.0.0.1', '[]', '2019-05-08 02:29:51', '2019-05-08 02:29:51'),
(566, NULL, 1, 'system_admin/shop_order_edit/1', 'GET', '127.0.0.1', '[]', '2019-05-08 02:30:20', '2019-05-08 02:30:20'),
(567, NULL, 1, 'system_admin/shop_order_edit/1', 'GET', '127.0.0.1', '[]', '2019-05-08 02:32:06', '2019-05-08 02:32:06'),
(568, NULL, 1, 'system_admin/shop_order_edit/4', 'GET', '127.0.0.1', '[]', '2019-05-08 02:32:17', '2019-05-08 02:32:17'),
(569, NULL, 1, 'system_admin/shop_order_edit/4', 'GET', '127.0.0.1', '[]', '2019-05-08 02:35:46', '2019-05-08 02:35:46'),
(570, NULL, 1, 'system_admin/shop_order_edit/4', 'GET', '127.0.0.1', '[]', '2019-05-08 02:46:49', '2019-05-08 02:46:49'),
(571, NULL, 1, 'system_admin/get_info/productInfo', 'GET', '127.0.0.1', '{\"id\":\"50\"}', '2019-05-08 02:46:59', '2019-05-08 02:46:59'),
(572, NULL, 1, 'system_admin/shop_order_edit/order_add_item', 'POST', '127.0.0.1', '{\"_token\":\"aITYGUhf5qeumJ88EWXJOk4P0VLKQbmA7kv1saXI\",\"add_order\":\"4\",\"add_id\":\"50\",\"add_qty\":\"1\",\"add_price\":\"200\"}', '2019-05-08 02:47:00', '2019-05-08 02:47:00'),
(573, NULL, 1, 'system_admin/shop_order_edit/4', 'GET', '127.0.0.1', '[]', '2019-05-08 02:47:05', '2019-05-08 02:47:05'),
(574, NULL, 1, 'system_admin/get_info/productInfo', 'GET', '127.0.0.1', '{\"id\":\"3\"}', '2019-05-08 02:47:25', '2019-05-08 02:47:25'),
(575, NULL, 1, 'system_admin/banner', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-08 02:47:38', '2019-05-08 02:47:38'),
(576, NULL, 1, 'system_admin/shop_order_edit/4', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-08 02:47:41', '2019-05-08 02:47:41'),
(577, NULL, 1, 'system_admin/shop_order_edit/4', 'GET', '127.0.0.1', '[]', '2019-05-08 03:05:19', '2019-05-08 03:05:19'),
(578, NULL, 1, 'system_admin/shop_order_edit/4', 'GET', '127.0.0.1', '[]', '2019-05-08 03:05:48', '2019-05-08 03:05:48'),
(579, NULL, 1, 'system_admin/shop_order_edit/4', 'GET', '127.0.0.1', '[]', '2019-05-08 03:06:03', '2019-05-08 03:06:03'),
(580, NULL, 1, 'system_admin/shop_order_edit/4', 'GET', '127.0.0.1', '[]', '2019-05-08 03:06:26', '2019-05-08 03:06:26'),
(581, NULL, 1, 'system_admin/shop_order_edit/4', 'GET', '127.0.0.1', '[]', '2019-05-08 03:06:33', '2019-05-08 03:06:33'),
(582, NULL, 1, 'system_admin/shop_order_edit/4', 'GET', '127.0.0.1', '[]', '2019-05-08 03:06:50', '2019-05-08 03:06:50'),
(583, NULL, 1, 'system_admin/shop_order', 'GET', '127.0.0.1', '[]', '2019-05-08 03:06:55', '2019-05-08 03:06:55'),
(584, NULL, 1, 'system_admin/shop_order', 'GET', '127.0.0.1', '[]', '2019-05-08 03:06:58', '2019-05-08 03:06:58'),
(585, NULL, 1, 'system_admin/shop_order', 'GET', '127.0.0.1', '[]', '2019-05-08 03:07:13', '2019-05-08 03:07:13'),
(586, NULL, 1, 'system_admin/shop_order', 'GET', '127.0.0.1', '[]', '2019-05-08 03:07:26', '2019-05-08 03:07:26'),
(587, NULL, 1, 'system_admin/shop_order', 'GET', '127.0.0.1', '[]', '2019-05-08 03:07:42', '2019-05-08 03:07:42'),
(588, NULL, 1, 'system_admin/shop_order_edit/4', 'GET', '127.0.0.1', '[]', '2019-05-08 03:08:52', '2019-05-08 03:08:52'),
(589, NULL, 1, 'system_admin/shop_order_status', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-08 03:09:03', '2019-05-08 03:09:03'),
(590, NULL, 1, 'system_admin/shop_order_status/create', 'GET', '127.0.0.1', '[]', '2019-05-08 03:09:05', '2019-05-08 03:09:05'),
(591, NULL, 1, 'system_admin/shop_order_status', 'POST', '127.0.0.1', '{\"name\":\"Hold\",\"_token\":\"aITYGUhf5qeumJ88EWXJOk4P0VLKQbmA7kv1saXI\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/system_admin\\/shop_order_status\"}', '2019-05-08 03:09:13', '2019-05-08 03:09:13'),
(592, NULL, 1, 'system_admin/shop_order_status', 'GET', '127.0.0.1', '[]', '2019-05-08 03:09:13', '2019-05-08 03:09:13'),
(593, NULL, 1, 'system_admin/shop_order', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-08 03:09:40', '2019-05-08 03:09:40'),
(594, NULL, 1, 'system_admin/shop_order', 'GET', '127.0.0.1', '[]', '2019-05-08 03:09:44', '2019-05-08 03:09:44'),
(595, NULL, 1, 'system_admin/shop_order', 'GET', '127.0.0.1', '[]', '2019-05-08 03:10:00', '2019-05-08 03:10:00'),
(596, NULL, 1, 'system_admin/shop_order', 'GET', '127.0.0.1', '[]', '2019-05-08 03:10:09', '2019-05-08 03:10:09'),
(597, NULL, 1, 'system_admin/shop_order', 'GET', '127.0.0.1', '[]', '2019-05-08 03:10:17', '2019-05-08 03:10:17'),
(598, NULL, 1, 'system_admin/shop_order', 'GET', '127.0.0.1', '[]', '2019-05-08 03:10:28', '2019-05-08 03:10:28'),
(599, NULL, 1, 'system_admin/shop_order', 'GET', '127.0.0.1', '[]', '2019-05-08 03:10:38', '2019-05-08 03:10:38'),
(600, NULL, 1, 'system_admin/shop_order_edit/4', 'GET', '127.0.0.1', '[]', '2019-05-08 03:14:13', '2019-05-08 03:14:13'),
(601, NULL, 1, 'system_admin/shop_order_edit/4', 'GET', '127.0.0.1', '[]', '2019-05-08 03:15:11', '2019-05-08 03:15:11'),
(602, NULL, 1, 'system_admin/shop_order_edit/4', 'GET', '127.0.0.1', '[]', '2019-05-09 01:11:21', '2019-05-09 01:11:21'),
(603, NULL, 1, 'system_admin/shop_order_edit/shop_order_update', 'PUT', '127.0.0.1', '{\"name\":\"status\",\"value\":\"6\",\"pk\":\"4\",\"_token\":\"tE9ogdXpwi0Qvj6pyC4qfFExITDyfjOapRDgL6hf\",\"_editable\":\"1\",\"_method\":\"PUT\"}', '2019-05-09 01:58:14', '2019-05-09 01:58:14'),
(604, NULL, 1, 'system_admin/auth/login', 'GET', '127.0.0.1', '[]', '2019-05-09 01:58:21', '2019-05-09 01:58:21'),
(605, NULL, 1, 'system_admin', 'GET', '127.0.0.1', '[]', '2019-05-09 01:58:21', '2019-05-09 01:58:21'),
(606, NULL, 1, 'system_admin/shop_order', 'GET', '127.0.0.1', '[]', '2019-05-09 01:58:26', '2019-05-09 01:58:26'),
(607, NULL, 1, 'system_admin/shop_order_edit/1', 'GET', '127.0.0.1', '[]', '2019-05-09 01:58:36', '2019-05-09 01:58:36'),
(608, NULL, 1, 'system_admin/shop_order_edit/shop_order_update', 'PUT', '127.0.0.1', '{\"name\":\"status\",\"value\":\"1\",\"pk\":\"1\",\"_token\":\"tE9ogdXpwi0Qvj6pyC4qfFExITDyfjOapRDgL6hf\",\"_editable\":\"1\",\"_method\":\"PUT\"}', '2019-05-09 01:58:46', '2019-05-09 01:58:46'),
(609, NULL, 1, 'system_admin/shop_order', 'GET', '127.0.0.1', '[]', '2019-05-09 01:58:54', '2019-05-09 01:58:54'),
(610, NULL, 1, 'system_admin/shop_order_edit/4', 'GET', '127.0.0.1', '[]', '2019-05-09 01:59:09', '2019-05-09 01:59:09'),
(611, NULL, 1, 'system_admin/shop_order_edit/shop_order_update', 'PUT', '127.0.0.1', '{\"name\":\"status\",\"value\":\"7\",\"pk\":\"4\",\"_token\":\"tE9ogdXpwi0Qvj6pyC4qfFExITDyfjOapRDgL6hf\",\"_editable\":\"1\",\"_method\":\"PUT\"}', '2019-05-09 01:59:16', '2019-05-09 01:59:16'),
(612, NULL, 1, 'system_admin/shop_order', 'GET', '127.0.0.1', '[]', '2019-05-09 01:59:17', '2019-05-09 01:59:17'),
(613, NULL, 1, 'system_admin/shop_order_status', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-09 01:59:44', '2019-05-09 01:59:44'),
(614, NULL, 1, 'system_admin/shop_order', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-09 01:59:57', '2019-05-09 01:59:57'),
(615, NULL, 1, 'system_admin/shop_order_edit/4', 'GET', '127.0.0.1', '[]', '2019-05-09 01:59:59', '2019-05-09 01:59:59'),
(616, NULL, 1, 'system_admin/shop_order_edit/shop_order_update', 'PUT', '127.0.0.1', '{\"name\":\"status\",\"value\":\"9\",\"pk\":\"4\",\"_token\":\"tE9ogdXpwi0Qvj6pyC4qfFExITDyfjOapRDgL6hf\",\"_editable\":\"1\",\"_method\":\"PUT\"}', '2019-05-09 02:00:07', '2019-05-09 02:00:07'),
(617, NULL, 1, 'system_admin/shop_order', 'GET', '127.0.0.1', '[]', '2019-05-09 02:00:09', '2019-05-09 02:00:09'),
(618, NULL, 1, 'system_admin/shop_order_status', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-09 02:00:21', '2019-05-09 02:00:21'),
(619, NULL, 1, 'system_admin/shop_order_status/create', 'GET', '127.0.0.1', '[]', '2019-05-09 02:00:24', '2019-05-09 02:00:24'),
(620, NULL, 1, 'system_admin/shop_order_status', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-09 02:01:06', '2019-05-09 02:01:06'),
(621, NULL, 1, 'system_admin/shop_order_status', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-09 02:10:50', '2019-05-09 02:10:50'),
(622, NULL, 1, 'system_admin/shop_order', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-09 02:10:58', '2019-05-09 02:10:58'),
(623, NULL, 1, 'system_admin/shop_order', 'GET', '127.0.0.1', '[]', '2019-05-09 02:11:12', '2019-05-09 02:11:12'),
(624, NULL, 1, 'system_admin/shop_order', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-09 02:13:48', '2019-05-09 02:13:48'),
(625, NULL, 1, 'system_admin/shop_order_status', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-09 02:14:00', '2019-05-09 02:14:00'),
(626, NULL, 1, 'system_admin/shop_order_status', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\",\"_sort\":{\"column\":\"id\",\"type\":\"desc\"}}', '2019-05-09 02:14:16', '2019-05-09 02:14:16'),
(627, NULL, 1, 'system_admin/shop_order_status', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\",\"_sort\":{\"column\":\"id\",\"type\":\"asc\"}}', '2019-05-09 02:14:18', '2019-05-09 02:14:18'),
(628, NULL, 1, 'system_admin/shop_order_status', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\",\"_sort\":{\"column\":\"name\",\"type\":\"desc\"}}', '2019-05-09 02:14:24', '2019-05-09 02:14:24'),
(629, NULL, 1, 'system_admin/shop_order_status', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\",\"_sort\":{\"column\":\"id\",\"type\":\"desc\"}}', '2019-05-09 02:14:27', '2019-05-09 02:14:27'),
(630, NULL, 1, 'system_admin/shop_order_status', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\",\"_sort\":{\"column\":\"id\",\"type\":\"asc\"}}', '2019-05-09 02:14:33', '2019-05-09 02:14:33'),
(631, NULL, 1, 'system_admin/shop_payment_status', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-09 02:14:59', '2019-05-09 02:14:59'),
(632, NULL, 1, 'system_admin/shop_payment_status', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-09 02:15:37', '2019-05-09 02:15:37'),
(633, NULL, 1, 'system_admin/shop_order', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-09 02:15:43', '2019-05-09 02:15:43'),
(634, NULL, 1, 'system_admin/shop_order_edit/1', 'GET', '127.0.0.1', '[]', '2019-05-09 02:15:48', '2019-05-09 02:15:48'),
(635, NULL, 1, 'system_admin/shop_order_edit/shop_order_update', 'PUT', '127.0.0.1', '{\"name\":\"shipping_status\",\"value\":\"1\",\"pk\":\"1\",\"_token\":\"tE9ogdXpwi0Qvj6pyC4qfFExITDyfjOapRDgL6hf\",\"_editable\":\"1\",\"_method\":\"PUT\"}', '2019-05-09 02:17:09', '2019-05-09 02:17:09'),
(636, NULL, 1, 'system_admin/shop_order', 'GET', '127.0.0.1', '[]', '2019-05-09 02:17:11', '2019-05-09 02:17:11'),
(637, NULL, 1, 'system_admin/language', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-09 02:19:06', '2019-05-09 02:19:06'),
(638, NULL, 1, 'system_admin/language/create', 'GET', '127.0.0.1', '[]', '2019-05-09 02:19:11', '2019-05-09 02:19:11'),
(639, NULL, 1, 'system_admin/report/customer', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-09 02:19:18', '2019-05-09 02:19:18'),
(640, NULL, 1, 'system_admin/shop_order_status', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-09 02:19:34', '2019-05-09 02:19:34'),
(641, NULL, 1, 'system_admin/shop_payment_status', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-09 02:19:35', '2019-05-09 02:19:35'),
(642, NULL, 1, 'system_admin/shop_shipping_status', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-09 02:19:37', '2019-05-09 02:19:37'),
(643, NULL, 1, 'system_admin/modules/api/shop_api', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-09 02:19:47', '2019-05-09 02:19:47'),
(644, NULL, 1, 'system_admin/modules/api/shop_api/create', 'GET', '127.0.0.1', '[]', '2019-05-09 02:19:59', '2019-05-09 02:19:59'),
(645, NULL, 1, 'system_admin/modules/api/shop_api', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-09 02:21:13', '2019-05-09 02:21:13'),
(646, NULL, 1, 'system_admin', 'GET', '127.0.0.1', '[]', '2019-05-10 23:03:47', '2019-05-10 23:03:47'),
(647, NULL, 1, 'system_admin/auth/roles', 'GET', '127.0.0.1', '[]', '2019-05-11 02:11:25', '2019-05-11 02:11:25'),
(648, NULL, 1, 'system_admin/auth/permissions', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-11 02:11:32', '2019-05-11 02:11:32'),
(649, NULL, 1, 'system_admin/auth/roles', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-11 02:11:35', '2019-05-11 02:11:35'),
(650, NULL, 1, 'system_admin/auth/roles/create', 'GET', '127.0.0.1', '[]', '2019-05-11 02:11:39', '2019-05-11 02:11:39'),
(651, NULL, 1, 'system_admin/auth/menu', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-11 02:12:06', '2019-05-11 02:12:06'),
(652, NULL, 1, 'system_admin/shop_page', 'GET', '127.0.0.1', '[]', '2019-05-11 02:12:22', '2019-05-11 02:12:22'),
(653, NULL, 1, 'system_admin/shop_category', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-11 02:18:05', '2019-05-11 02:18:05'),
(654, NULL, 1, 'system_admin/language', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-11 02:18:24', '2019-05-11 02:18:24'),
(655, NULL, 1, 'system_admin/language/create', 'GET', '127.0.0.1', '[]', '2019-05-11 02:18:27', '2019-05-11 02:18:27'),
(656, NULL, 1, 'system_admin/shop_customer', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-11 02:19:09', '2019-05-11 02:19:09'),
(657, NULL, 1, 'system_admin/shop_customer/create', 'GET', '127.0.0.1', '[]', '2019-05-11 02:19:13', '2019-05-11 02:19:13'),
(658, NULL, 1, 'system_admin/shop_customer/create', 'GET', '127.0.0.1', '[]', '2019-05-11 04:24:01', '2019-05-11 04:24:01'),
(659, NULL, 1, 'system_admin/shop_customer/create', 'GET', '127.0.0.1', '[]', '2019-05-11 04:27:04', '2019-05-11 04:27:04'),
(660, NULL, 1, 'system_admin/shop_customer/create', 'GET', '127.0.0.1', '[]', '2019-05-11 04:37:00', '2019-05-11 04:37:00'),
(661, NULL, 1, 'system_admin/shop_customer/create', 'GET', '127.0.0.1', '[]', '2019-05-11 04:39:02', '2019-05-11 04:39:02'),
(662, NULL, 1, 'system_admin/shop_customer/create', 'GET', '127.0.0.1', '[]', '2019-05-11 04:40:45', '2019-05-11 04:40:45'),
(663, NULL, 1, 'system_admin', 'GET', '127.0.0.1', '[]', '2019-05-11 22:06:03', '2019-05-11 22:06:03'),
(664, NULL, 1, 'system_admin/auth/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-11 22:06:29', '2019-05-11 22:06:29'),
(665, NULL, 1, 'system_admin/auth/users', 'GET', '127.0.0.1', '[]', '2019-05-11 22:44:01', '2019-05-11 22:44:01'),
(666, NULL, 1, 'system_admin/auth/roles', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-11 22:44:06', '2019-05-11 22:44:06'),
(667, NULL, 1, 'system_admin/config_info', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-11 22:47:04', '2019-05-11 22:47:04'),
(668, NULL, 1, 'system_admin/config_info', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-11 22:47:29', '2019-05-11 22:47:29'),
(669, NULL, 1, 'system_admin/config_global', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-11 22:47:52', '2019-05-11 22:47:52'),
(670, NULL, 1, 'system_admin/config_global', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-11 22:47:53', '2019-05-11 22:47:53'),
(671, NULL, 1, 'system_admin/language', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-11 22:48:09', '2019-05-11 22:48:09'),
(672, NULL, 1, 'system_admin/language/create', 'GET', '127.0.0.1', '[]', '2019-05-11 22:48:11', '2019-05-11 22:48:11'),
(673, NULL, 1, 'system_admin/language', 'POST', '127.0.0.1', '{\"name\":\"arabic\",\"code\":\"ar\",\"status\":\"on\",\"sort\":\"1\",\"_token\":\"i6VpF8ovuC9azurxYg7seuszVboE8YldseOoGjXS\",\"_previous_\":\"http:\\/\\/localhost:8000\\/system_admin\\/language\"}', '2019-05-11 22:48:54', '2019-05-11 22:48:54'),
(674, NULL, 1, 'system_admin/language', 'GET', '127.0.0.1', '[]', '2019-05-11 22:48:55', '2019-05-11 22:48:55'),
(675, NULL, 1, 'system_admin/config_info', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-11 22:49:16', '2019-05-11 22:49:16'),
(676, NULL, 1, 'system_admin/config_global', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-11 22:49:20', '2019-05-11 22:49:20'),
(677, NULL, 1, 'system_admin/config_global', 'GET', '127.0.0.1', '[]', '2019-05-11 22:49:55', '2019-05-11 22:49:55'),
(678, NULL, 1, 'system_admin/config_global', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-11 22:50:11', '2019-05-11 22:50:11'),
(679, NULL, 1, 'system_admin/language', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-11 22:50:16', '2019-05-11 22:50:16'),
(680, NULL, 1, 'system_admin/language/1/edit', 'GET', '127.0.0.1', '[]', '2019-05-11 22:50:27', '2019-05-11 22:50:27'),
(681, NULL, 1, 'system_admin/language', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-11 22:50:52', '2019-05-11 22:50:52'),
(682, NULL, 1, 'system_admin/language/3/edit', 'GET', '127.0.0.1', '[]', '2019-05-11 22:50:56', '2019-05-11 22:50:56'),
(683, NULL, 1, 'system_admin/language/3', 'PUT', '127.0.0.1', '{\"name\":\"arabic\",\"code\":\"ar\",\"status\":\"on\",\"sort\":\"2\",\"_token\":\"i6VpF8ovuC9azurxYg7seuszVboE8YldseOoGjXS\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/localhost:8000\\/system_admin\\/language\"}', '2019-05-11 22:51:07', '2019-05-11 22:51:07'),
(684, NULL, 1, 'system_admin/language', 'GET', '127.0.0.1', '[]', '2019-05-11 22:51:07', '2019-05-11 22:51:07'),
(685, NULL, 1, 'system_admin/auth/setting', 'GET', '127.0.0.1', '[]', '2019-05-11 22:51:18', '2019-05-11 22:51:18'),
(686, NULL, 1, 'system_admin/config_global', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-11 22:51:43', '2019-05-11 22:51:43'),
(687, NULL, 1, 'system_admin/config_global', 'GET', '127.0.0.1', '[]', '2019-05-11 22:52:22', '2019-05-11 22:52:22'),
(688, NULL, 1, 'system_admin/config_global', 'GET', '127.0.0.1', '[]', '2019-05-11 22:52:42', '2019-05-11 22:52:42'),
(689, NULL, 1, 'system_admin/config_global', 'GET', '127.0.0.1', '[]', '2019-05-11 22:56:36', '2019-05-11 22:56:36'),
(690, NULL, 1, 'system_admin/config_global/1/edit', 'GET', '127.0.0.1', '[]', '2019-05-11 22:57:05', '2019-05-11 22:57:05'),
(691, NULL, 1, 'system_admin/config_global/1', 'PUT', '127.0.0.1', '{\"en__title\":\"souqVIS\",\"en__keyword\":null,\"en__description\":\"easy to sell and buy\",\"vi__title\":\"souqVIS\",\"vi__keyword\":null,\"vi__description\":\"easy to sell\",\"ar__title\":\"Souq\",\"ar__keyword\":\"ar\",\"ar__description\":null,\"phone\":\"0123456789\",\"long_phone\":\"Support: 0987654321\",\"time_active\":null,\"address\":\"123st - abc - xyz\",\"email\":\"admin@admin.com\",\"locale\":\"ar\",\"currency\":\"EGP\",\"_token\":\"i6VpF8ovuC9azurxYg7seuszVboE8YldseOoGjXS\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/localhost:8000\\/system_admin\\/config_global\"}', '2019-05-11 22:58:05', '2019-05-11 22:58:05'),
(692, NULL, 1, 'system_admin/config_global', 'GET', '127.0.0.1', '[]', '2019-05-11 22:58:07', '2019-05-11 22:58:07'),
(693, NULL, 1, 'system_admin/config_template', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-11 22:58:38', '2019-05-11 22:58:38'),
(694, NULL, 1, 'system_admin/currencies', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-11 22:59:08', '2019-05-11 22:59:08'),
(695, NULL, 1, 'system_admin/currencies', 'GET', '127.0.0.1', '[]', '2019-05-11 23:05:00', '2019-05-11 23:05:00'),
(696, NULL, 1, 'system_admin', 'GET', '127.0.0.1', '[]', '2019-05-11 23:05:19', '2019-05-11 23:05:19'),
(697, NULL, 1, 'system_admin/locale/ar', 'GET', '127.0.0.1', '[]', '2019-05-11 23:05:31', '2019-05-11 23:05:31'),
(698, NULL, 1, 'system_admin', 'GET', '127.0.0.1', '[]', '2019-05-11 23:05:31', '2019-05-11 23:05:31'),
(699, NULL, 1, 'system_admin', 'GET', '127.0.0.1', '[]', '2019-05-11 23:05:43', '2019-05-11 23:05:43'),
(700, NULL, 1, 'system_admin/locale/ar', 'GET', '127.0.0.1', '[]', '2019-05-12 03:29:03', '2019-05-12 03:29:03'),
(701, NULL, 1, 'system_admin/auth/login', 'GET', '127.0.0.1', '[]', '2019-05-12 03:29:04', '2019-05-12 03:29:04'),
(702, NULL, 1, 'system_admin', 'GET', '127.0.0.1', '[]', '2019-05-12 03:29:04', '2019-05-12 03:29:04'),
(703, NULL, 1, 'system_admin', 'GET', '127.0.0.1', '[]', '2019-05-12 03:41:36', '2019-05-12 03:41:36'),
(704, NULL, 1, 'system_admin', 'GET', '127.0.0.1', '[]', '2019-05-12 03:43:06', '2019-05-12 03:43:06'),
(705, NULL, 1, 'system_admin', 'GET', '127.0.0.1', '[]', '2019-05-12 03:51:58', '2019-05-12 03:51:58'),
(706, NULL, 1, 'system_admin', 'GET', '127.0.0.1', '[]', '2019-05-12 04:24:45', '2019-05-12 04:24:45'),
(707, NULL, 1, 'system_admin', 'GET', '127.0.0.1', '[]', '2019-05-12 04:25:24', '2019-05-12 04:25:24'),
(708, NULL, 1, 'system_admin', 'GET', '127.0.0.1', '[]', '2019-05-12 04:25:43', '2019-05-12 04:25:43'),
(709, NULL, 1, 'system_admin', 'GET', '127.0.0.1', '[]', '2019-05-12 04:27:07', '2019-05-12 04:27:07'),
(710, NULL, 1, 'system_admin', 'GET', '127.0.0.1', '[]', '2019-05-12 04:27:25', '2019-05-12 04:27:25'),
(711, NULL, 1, 'system_admin', 'GET', '127.0.0.1', '[]', '2019-05-12 04:27:46', '2019-05-12 04:27:46'),
(712, NULL, 1, 'system_admin', 'GET', '127.0.0.1', '[]', '2019-05-12 04:52:02', '2019-05-12 04:52:02'),
(713, NULL, 1, 'system_admin', 'GET', '127.0.0.1', '[]', '2019-05-12 04:55:37', '2019-05-12 04:55:37'),
(714, NULL, 1, 'system_admin', 'GET', '127.0.0.1', '[]', '2019-05-12 04:56:44', '2019-05-12 04:56:44'),
(715, NULL, 1, 'system_admin/locale/en', 'GET', '127.0.0.1', '[]', '2019-05-12 04:56:51', '2019-05-12 04:56:51'),
(716, NULL, 1, 'system_admin', 'GET', '127.0.0.1', '[]', '2019-05-12 04:56:51', '2019-05-12 04:56:51'),
(717, NULL, 1, 'system_admin', 'GET', '127.0.0.1', '[]', '2019-05-12 04:57:09', '2019-05-12 04:57:09'),
(718, NULL, 1, 'system_admin', 'GET', '127.0.0.1', '[]', '2019-05-12 04:59:37', '2019-05-12 04:59:37'),
(719, NULL, 1, 'system_admin', 'GET', '127.0.0.1', '[]', '2019-05-12 05:03:37', '2019-05-12 05:03:37');
INSERT INTO `admin_operation_log` (`id`, `company_id`, `user_id`, `path`, `method`, `ip`, `input`, `created_at`, `updated_at`) VALUES
(720, NULL, 1, 'system_admin', 'GET', '127.0.0.1', '[]', '2019-05-12 05:04:35', '2019-05-12 05:04:35'),
(721, NULL, 1, 'system_admin', 'GET', '127.0.0.1', '[]', '2019-05-12 05:05:46', '2019-05-12 05:05:46'),
(722, NULL, 1, 'system_admin', 'GET', '127.0.0.1', '[]', '2019-05-12 05:06:11', '2019-05-12 05:06:11'),
(723, NULL, 1, 'system_admin', 'GET', '127.0.0.1', '[]', '2019-05-13 03:05:37', '2019-05-13 03:05:37'),
(724, NULL, 1, 'system_admin', 'GET', '127.0.0.1', '[]', '2019-05-13 03:06:21', '2019-05-13 03:06:21'),
(725, NULL, 1, 'system_admin', 'GET', '127.0.0.1', '[]', '2019-05-13 03:06:25', '2019-05-13 03:06:25'),
(726, NULL, 1, 'system_admin', 'GET', '127.0.0.1', '[]', '2019-05-13 03:06:44', '2019-05-13 03:06:44'),
(727, NULL, 1, 'system_admin', 'GET', '127.0.0.1', '[]', '2019-05-13 03:07:47', '2019-05-13 03:07:47'),
(728, NULL, 1, 'system_admin', 'GET', '127.0.0.1', '[]', '2019-05-13 03:25:22', '2019-05-13 03:25:22'),
(729, NULL, 1, 'system_admin', 'GET', '127.0.0.1', '[]', '2019-05-13 03:26:07', '2019-05-13 03:26:07'),
(730, NULL, 1, 'system_admin', 'GET', '127.0.0.1', '[]', '2019-05-17 19:43:58', '2019-05-17 19:43:58'),
(731, NULL, 1, 'system_admin', 'GET', '127.0.0.1', '[]', '2019-05-17 19:44:38', '2019-05-17 19:44:38'),
(732, NULL, 1, 'system_admin', 'GET', '127.0.0.1', '[]', '2019-05-17 19:45:04', '2019-05-17 19:45:04'),
(733, NULL, 1, 'system_admin', 'GET', '127.0.0.1', '[]', '2019-05-18 02:42:06', '2019-05-18 02:42:06'),
(734, NULL, 1, 'system_admin/auth/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-18 02:42:25', '2019-05-18 02:42:25'),
(735, NULL, 1, 'system_admin/auth/roles', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-18 02:42:31', '2019-05-18 02:42:31'),
(736, NULL, 1, 'system_admin/auth/permissions', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-18 02:42:40', '2019-05-18 02:42:40'),
(737, NULL, 1, 'system_admin/auth/permissions/create', 'GET', '127.0.0.1', '[]', '2019-05-18 02:43:04', '2019-05-18 02:43:04'),
(738, NULL, 1, 'system_admin/auth/roles', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-18 02:43:29', '2019-05-18 02:43:29'),
(739, NULL, 1, 'system_admin/auth/permissions', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-18 02:43:31', '2019-05-18 02:43:31'),
(740, NULL, 1, 'system_admin/shop_category', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-18 02:43:37', '2019-05-18 02:43:37'),
(741, NULL, 1, 'system_admin/shop_category', 'GET', '127.0.0.1', '[]', '2019-05-18 02:44:37', '2019-05-18 02:44:37'),
(742, NULL, 1, 'system_admin/shop_category', 'GET', '127.0.0.1', '[]', '2019-05-18 02:45:30', '2019-05-18 02:45:30'),
(743, NULL, 1, 'system_admin/shop_category', 'GET', '127.0.0.1', '[]', '2019-05-18 02:47:12', '2019-05-18 02:47:12'),
(744, NULL, 1, 'system_admin/shop_category', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-18 02:47:50', '2019-05-18 02:47:50'),
(745, NULL, 1, 'system_admin/shop_product', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-18 02:47:52', '2019-05-18 02:47:52'),
(746, NULL, 1, 'system_admin/shop_special_price', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-18 02:47:58', '2019-05-18 02:47:58'),
(747, NULL, 1, 'system_admin/shop_customer', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-18 02:48:03', '2019-05-18 02:48:03'),
(748, NULL, 1, 'system_admin/shop_customer', 'GET', '127.0.0.1', '[]', '2019-05-18 04:31:01', '2019-05-18 04:31:01'),
(749, NULL, 1, 'system_admin/shop_customer', 'GET', '127.0.0.1', '[]', '2019-05-18 04:31:15', '2019-05-18 04:31:15'),
(750, NULL, 1, 'system_admin/shop_customer', 'GET', '127.0.0.1', '[]', '2019-05-18 04:31:22', '2019-05-18 04:31:22'),
(751, NULL, 1, 'system_admin/shop_customer', 'GET', '127.0.0.1', '[]', '2019-05-18 04:32:07', '2019-05-18 04:32:07'),
(752, NULL, 1, 'system_admin/shop_customer', 'GET', '127.0.0.1', '[]', '2019-05-18 04:48:21', '2019-05-18 04:48:21'),
(753, NULL, 1, 'system_admin/shop_customer', 'GET', '127.0.0.1', '[]', '2019-05-18 04:48:26', '2019-05-18 04:48:26'),
(754, NULL, 1, 'system_admin/shop_customer', 'GET', '127.0.0.1', '[]', '2019-05-18 05:01:36', '2019-05-18 05:01:36'),
(755, NULL, 1, 'system_admin/shop_customer', 'GET', '127.0.0.1', '[]', '2019-05-18 05:01:45', '2019-05-18 05:01:45'),
(756, NULL, 1, 'system_admin/shop_customer', 'GET', '127.0.0.1', '[]', '2019-05-18 13:46:50', '2019-05-18 13:46:50'),
(757, NULL, 1, 'system_admin/shop_order', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-18 14:32:35', '2019-05-18 14:32:35'),
(758, NULL, 1, 'system_admin/shop_order_status', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-18 14:32:38', '2019-05-18 14:32:38'),
(759, NULL, 1, 'system_admin/shop_shipping_status', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-18 14:32:51', '2019-05-18 14:32:51'),
(760, NULL, 1, 'system_admin/shop_payment_status', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-18 14:32:55', '2019-05-18 14:32:55'),
(761, NULL, 1, 'system_admin/shop_order', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-18 14:32:58', '2019-05-18 14:32:58'),
(762, NULL, 1, 'system_admin/shop_order', 'GET', '127.0.0.1', '[]', '2019-05-18 14:39:54', '2019-05-18 14:39:54'),
(763, NULL, 1, 'system_admin/shop_order', 'GET', '127.0.0.1', '[]', '2019-05-18 15:38:17', '2019-05-18 15:38:17'),
(764, NULL, 1, 'system_admin/shop_order', 'GET', '127.0.0.1', '[]', '2019-05-18 15:39:19', '2019-05-18 15:39:19'),
(765, NULL, 1, 'system_admin/shop_order', 'GET', '127.0.0.1', '[]', '2019-05-18 15:39:22', '2019-05-18 15:39:22'),
(766, NULL, 1, 'system_admin/shop_order', 'GET', '127.0.0.1', '[]', '2019-05-18 15:42:51', '2019-05-18 15:42:51'),
(767, NULL, 1, 'system_admin/shop_order', 'GET', '127.0.0.1', '[]', '2019-05-18 15:44:51', '2019-05-18 15:44:51'),
(768, NULL, 1, 'system_admin/shop_order', 'GET', '127.0.0.1', '[]', '2019-05-18 15:45:28', '2019-05-18 15:45:28'),
(769, NULL, 1, 'system_admin/shop_order', 'GET', '127.0.0.1', '[]', '2019-05-18 15:45:51', '2019-05-18 15:45:51'),
(770, NULL, 1, 'system_admin/shop_order', 'GET', '127.0.0.1', '[]', '2019-05-18 15:54:45', '2019-05-18 15:54:45'),
(771, NULL, 1, 'system_admin/shop_order', 'GET', '127.0.0.1', '[]', '2019-05-18 15:55:40', '2019-05-18 15:55:40'),
(772, NULL, 1, 'system_admin/shop_order', 'GET', '127.0.0.1', '[]', '2019-05-18 15:56:19', '2019-05-18 15:56:19'),
(773, NULL, 1, 'system_admin/shop_order', 'GET', '127.0.0.1', '[]', '2019-05-18 15:56:25', '2019-05-18 15:56:25'),
(774, NULL, 1, 'system_admin/shop_order', 'GET', '127.0.0.1', '[]', '2019-05-18 15:56:54', '2019-05-18 15:56:54'),
(775, NULL, 1, 'system_admin/shop_order', 'GET', '127.0.0.1', '[]', '2019-05-18 15:57:30', '2019-05-18 15:57:30'),
(776, NULL, 1, 'system_admin/shop_order', 'GET', '127.0.0.1', '[]', '2019-05-18 15:59:55', '2019-05-18 15:59:55'),
(777, NULL, 1, 'system_admin/shop_order', 'GET', '127.0.0.1', '[]', '2019-05-18 16:00:10', '2019-05-18 16:00:10'),
(778, NULL, 1, 'system_admin/shop_order', 'GET', '127.0.0.1', '[]', '2019-05-18 16:03:46', '2019-05-18 16:03:46'),
(779, NULL, 1, 'system_admin/shop_order', 'GET', '127.0.0.1', '[]', '2019-05-18 16:05:55', '2019-05-18 16:05:55'),
(780, NULL, 1, 'system_admin/shop_order', 'GET', '127.0.0.1', '[]', '2019-05-18 16:05:58', '2019-05-18 16:05:58'),
(781, NULL, 1, 'system_admin/shop_order', 'GET', '127.0.0.1', '[]', '2019-05-18 16:07:35', '2019-05-18 16:07:35'),
(782, NULL, 1, 'system_admin/shop_order', 'GET', '127.0.0.1', '[]', '2019-05-18 16:08:12', '2019-05-18 16:08:12'),
(783, NULL, 1, 'system_admin/shop_order', 'GET', '127.0.0.1', '[]', '2019-05-18 16:12:54', '2019-05-18 16:12:54'),
(784, NULL, 1, 'system_admin/shop_order', 'GET', '127.0.0.1', '[]', '2019-05-18 16:14:53', '2019-05-18 16:14:53'),
(785, NULL, 1, 'system_admin/shop_order', 'GET', '127.0.0.1', '[]', '2019-05-18 16:15:32', '2019-05-18 16:15:32'),
(786, NULL, 1, 'system_admin/shop_order', 'GET', '127.0.0.1', '[]', '2019-05-18 16:22:58', '2019-05-18 16:22:58'),
(787, NULL, 1, 'system_admin/shop_order', 'GET', '127.0.0.1', '[]', '2019-05-18 16:28:08', '2019-05-18 16:28:08'),
(788, NULL, 1, 'system_admin/shop_order', 'GET', '127.0.0.1', '[]', '2019-05-18 16:35:49', '2019-05-18 16:35:49'),
(789, NULL, 1, 'system_admin/shop_order', 'GET', '127.0.0.1', '[]', '2019-05-18 16:46:14', '2019-05-18 16:46:14'),
(790, NULL, 1, 'system_admin/shop_order', 'GET', '127.0.0.1', '[]', '2019-05-18 16:48:10', '2019-05-18 16:48:10'),
(791, NULL, 1, 'system_admin/shop_order', 'GET', '127.0.0.1', '[]', '2019-05-18 16:51:04', '2019-05-18 16:51:04'),
(792, NULL, 1, 'system_admin/shop_order', 'GET', '127.0.0.1', '{\"keyword\":\"4\",\"_pjax\":\"#pjax-container\"}', '2019-05-18 16:53:50', '2019-05-18 16:53:50'),
(793, NULL, 1, 'system_admin/shop_order', 'GET', '127.0.0.1', '{\"keyword\":null,\"_pjax\":\"#pjax-container\"}', '2019-05-18 16:53:59', '2019-05-18 16:53:59'),
(794, NULL, 1, 'system_admin/shop_order', 'GET', '127.0.0.1', '{\"keyword\":\"4\",\"_pjax\":\"#pjax-container\"}', '2019-05-18 16:54:04', '2019-05-18 16:54:04'),
(795, NULL, 1, 'system_admin/shop_order', 'GET', '127.0.0.1', '{\"keyword\":\"4\"}', '2019-05-18 16:55:38', '2019-05-18 16:55:38'),
(796, NULL, 1, 'system_admin/shop_order', 'GET', '127.0.0.1', '{\"keyword\":\"4\"}', '2019-05-18 17:00:25', '2019-05-18 17:00:25'),
(797, NULL, 1, 'system_admin/shop_order', 'GET', '127.0.0.1', '{\"keyword\":\"4\"}', '2019-05-18 17:03:14', '2019-05-18 17:03:14'),
(798, NULL, 1, 'system_admin/auth/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-18 17:10:49', '2019-05-18 17:10:49'),
(799, NULL, 1, 'system_admin/shop_category', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-18 17:10:54', '2019-05-18 17:10:54'),
(800, NULL, 1, 'system_admin/shop_category', 'GET', '127.0.0.1', '[]', '2019-05-18 17:21:47', '2019-05-18 17:21:47'),
(801, NULL, 1, 'system_admin/shop_category', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-18 17:28:33', '2019-05-18 17:28:33'),
(802, NULL, 1, 'system_admin/auth/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-18 17:28:37', '2019-05-18 17:28:37'),
(803, NULL, 1, 'system_admin/shop_category', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-18 17:29:30', '2019-05-18 17:29:30'),
(804, NULL, 1, 'system_admin/shop_category', 'GET', '127.0.0.1', '[]', '2019-05-18 17:33:24', '2019-05-18 17:33:24'),
(805, NULL, 1, 'system_admin/shop_category', 'GET', '127.0.0.1', '[]', '2019-05-18 17:38:42', '2019-05-18 17:38:42'),
(806, NULL, 1, 'system_admin/language', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-18 17:40:08', '2019-05-18 17:40:08'),
(807, NULL, 1, 'system_admin/auth/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-18 17:40:32', '2019-05-18 17:40:32'),
(808, NULL, 1, 'system_admin/auth/users', 'GET', '127.0.0.1', '[]', '2019-05-18 17:40:41', '2019-05-18 17:40:41'),
(809, NULL, 1, 'system_admin/auth/users', 'GET', '127.0.0.1', '[]', '2019-05-18 17:41:59', '2019-05-18 17:41:59'),
(810, NULL, 1, 'system_admin/shop_category', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-18 17:47:43', '2019-05-18 17:47:43'),
(811, NULL, 1, 'system_admin/shop_order', 'GET', '127.0.0.1', '{\"keyword\":\"4\",\"_pjax\":\"#pjax-container\"}', '2019-05-18 17:47:53', '2019-05-18 17:47:53'),
(812, NULL, 1, 'system_admin/locale/vi', 'GET', '127.0.0.1', '[]', '2019-05-18 18:15:41', '2019-05-18 18:15:41'),
(813, NULL, 1, 'system_admin/shop_order', 'GET', '127.0.0.1', '{\"keyword\":\"4\"}', '2019-05-18 18:15:41', '2019-05-18 18:15:41'),
(814, NULL, 1, 'system_admin/locale/ar', 'GET', '127.0.0.1', '[]', '2019-05-18 18:15:49', '2019-05-18 18:15:49'),
(815, NULL, 1, 'system_admin/shop_order', 'GET', '127.0.0.1', '{\"keyword\":\"4\"}', '2019-05-18 18:15:49', '2019-05-18 18:15:49'),
(816, NULL, 1, 'system_admin/locale/vi', 'GET', '127.0.0.1', '[]', '2019-05-18 18:15:56', '2019-05-18 18:15:56'),
(817, NULL, 1, 'system_admin/shop_order', 'GET', '127.0.0.1', '{\"keyword\":\"4\"}', '2019-05-18 18:15:56', '2019-05-18 18:15:56'),
(818, NULL, 1, 'system_admin/locale/ar', 'GET', '127.0.0.1', '[]', '2019-05-18 18:16:03', '2019-05-18 18:16:03'),
(819, NULL, 1, 'system_admin/shop_order', 'GET', '127.0.0.1', '{\"keyword\":\"4\"}', '2019-05-18 18:16:03', '2019-05-18 18:16:03'),
(820, NULL, 1, 'system_admin', 'GET', '127.0.0.1', '[]', '2019-05-18 18:16:09', '2019-05-18 18:16:09'),
(821, NULL, 1, 'system_admin', 'GET', '127.0.0.1', '[]', '2019-05-18 18:18:46', '2019-05-18 18:18:46'),
(822, NULL, 1, 'system_admin', 'GET', '127.0.0.1', '[]', '2019-05-18 18:30:16', '2019-05-18 18:30:16'),
(823, NULL, 1, 'system_admin', 'GET', '127.0.0.1', '[]', '2019-05-18 18:32:27', '2019-05-18 18:32:27'),
(824, NULL, 1, 'system_admin', 'GET', '127.0.0.1', '[]', '2019-05-18 18:32:52', '2019-05-18 18:32:52'),
(825, NULL, 1, 'system_admin', 'GET', '127.0.0.1', '[]', '2019-05-18 18:34:08', '2019-05-18 18:34:08'),
(826, NULL, 1, 'system_admin', 'GET', '127.0.0.1', '[]', '2019-05-18 18:34:44', '2019-05-18 18:34:44'),
(827, NULL, 1, 'system_admin', 'GET', '127.0.0.1', '[]', '2019-05-18 18:34:59', '2019-05-18 18:34:59'),
(828, NULL, 1, 'system_admin', 'GET', '127.0.0.1', '[]', '2019-05-18 18:35:10', '2019-05-18 18:35:10'),
(829, NULL, 1, 'system_admin', 'GET', '127.0.0.1', '[]', '2019-05-18 18:35:24', '2019-05-18 18:35:24'),
(830, NULL, 1, 'system_admin', 'GET', '127.0.0.1', '[]', '2019-05-18 18:35:46', '2019-05-18 18:35:46'),
(831, NULL, 1, 'system_admin', 'GET', '127.0.0.1', '[]', '2019-05-18 18:36:49', '2019-05-18 18:36:49'),
(832, NULL, 1, 'system_admin', 'GET', '127.0.0.1', '[]', '2019-05-19 02:03:45', '2019-05-19 02:03:45'),
(833, NULL, 1, 'system_admin', 'GET', '127.0.0.1', '[]', '2019-05-19 02:06:56', '2019-05-19 02:06:56'),
(834, NULL, 1, 'system_admin', 'GET', '127.0.0.1', '[]', '2019-05-19 02:07:36', '2019-05-19 02:07:36'),
(835, NULL, 1, 'system_admin', 'GET', '127.0.0.1', '[]', '2019-05-19 02:07:42', '2019-05-19 02:07:42'),
(836, NULL, 1, 'system_admin', 'GET', '127.0.0.1', '[]', '2019-05-19 02:11:30', '2019-05-19 02:11:30'),
(837, NULL, 1, 'system_admin', 'GET', '127.0.0.1', '[]', '2019-05-19 02:11:34', '2019-05-19 02:11:34'),
(838, NULL, 1, 'system_admin', 'GET', '127.0.0.1', '[]', '2019-05-19 02:12:16', '2019-05-19 02:12:16'),
(839, NULL, 1, 'system_admin', 'GET', '127.0.0.1', '[]', '2019-05-19 02:13:03', '2019-05-19 02:13:03'),
(840, NULL, 1, 'system_admin', 'GET', '127.0.0.1', '[]', '2019-05-19 02:16:03', '2019-05-19 02:16:03'),
(841, NULL, 1, 'system_admin', 'GET', '127.0.0.1', '[]', '2019-05-19 02:16:56', '2019-05-19 02:16:56'),
(842, NULL, 1, 'system_admin', 'GET', '127.0.0.1', '[]', '2019-05-19 02:20:11', '2019-05-19 02:20:11'),
(843, NULL, 1, 'system_admin/extensions/Payment', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-19 02:21:45', '2019-05-19 02:21:45'),
(844, NULL, 1, 'system_admin/extensions/Shipping', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-19 02:21:56', '2019-05-19 02:21:56'),
(845, NULL, 1, 'system_admin/extensions/Shipping', 'GET', '127.0.0.1', '{\"action\":\"config\",\"extensionKey\":\"ShippingStandard\"}', '2019-05-19 02:22:17', '2019-05-19 02:22:17'),
(846, NULL, 1, 'system_admin/extensions/Shipping', 'GET', '127.0.0.1', '[]', '2019-05-19 02:22:28', '2019-05-19 02:22:28'),
(847, NULL, 1, 'system_admin/extensions/installExtension', 'POST', '127.0.0.1', '{\"_token\":\"XgX7CnjLPs8doHPlB14TAkJIE5Mz2KnM4qhQtSHC\",\"key\":\"ShippingBasic\",\"group\":\"Shipping\"}', '2019-05-19 02:22:35', '2019-05-19 02:22:35'),
(848, NULL, 1, 'system_admin/extensions/Shipping', 'GET', '127.0.0.1', '[]', '2019-05-19 02:22:36', '2019-05-19 02:22:36'),
(849, NULL, 1, 'system_admin/extensions/Shipping', 'GET', '127.0.0.1', '{\"action\":\"config\",\"extensionKey\":\"ShippingBasic\"}', '2019-05-19 02:22:43', '2019-05-19 02:22:43'),
(850, NULL, 1, 'system_admin/extensions/Shipping', 'GET', '127.0.0.1', '{\"action\":\"config\",\"extensionKey\":\"ShippingStandard\"}', '2019-05-19 02:23:07', '2019-05-19 02:23:07'),
(851, NULL, 1, 'system_admin/extensions/Payment', 'GET', '127.0.0.1', '[]', '2019-05-19 02:23:13', '2019-05-19 02:23:13'),
(852, NULL, 1, 'system_admin/extensions/Total', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-19 02:23:19', '2019-05-19 02:23:19'),
(853, NULL, 1, 'system_admin/extensions/Total', 'GET', '127.0.0.1', '{\"action\":\"config\",\"extensionKey\":\"Discount\"}', '2019-05-19 02:23:22', '2019-05-19 02:23:22'),
(854, NULL, 1, 'system_admin/shop_discount', 'GET', '127.0.0.1', '[]', '2019-05-19 02:23:26', '2019-05-19 02:23:26'),
(855, NULL, 1, 'system_admin/shop_discount', 'GET', '127.0.0.1', '[]', '2019-05-19 02:35:50', '2019-05-19 02:35:50'),
(856, NULL, 1, 'system_admin/shop_discount/create', 'GET', '127.0.0.1', '[]', '2019-05-19 02:35:57', '2019-05-19 02:35:57'),
(857, NULL, 1, 'system_admin/shop_category', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-19 02:36:48', '2019-05-19 02:36:48'),
(858, NULL, 1, 'system_admin/shop_page', 'GET', '127.0.0.1', '[]', '2019-05-19 02:36:49', '2019-05-19 02:36:49'),
(859, NULL, 1, 'system_admin/shop_vendor', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-19 02:45:02', '2019-05-19 02:45:02'),
(860, NULL, 1, 'system_admin/shop_attribute_group', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-19 02:46:24', '2019-05-19 02:46:24'),
(861, NULL, 1, 'system_admin/shop_attribute_group', 'GET', '127.0.0.1', '[]', '2019-05-19 02:50:38', '2019-05-19 02:50:38'),
(862, NULL, 1, 'system_admin/shop_attribute_group', 'GET', '127.0.0.1', '[]', '2019-05-19 02:52:57', '2019-05-19 02:52:57'),
(863, NULL, 1, 'system_admin/shop_attribute_group', 'GET', '127.0.0.1', '[]', '2019-05-19 02:53:17', '2019-05-19 02:53:17'),
(864, NULL, 1, 'system_admin/shop_attribute_group', 'GET', '127.0.0.1', '[]', '2019-05-19 02:53:38', '2019-05-19 02:53:38'),
(865, NULL, 1, 'system_admin/shop_attribute_group', 'GET', '127.0.0.1', '[]', '2019-05-19 02:54:03', '2019-05-19 02:54:03'),
(866, NULL, 1, 'system_admin/shop_attribute_group', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-19 02:54:11', '2019-05-19 02:54:11'),
(867, NULL, 1, 'system_admin/shop_attribute_group', 'GET', '127.0.0.1', '[]', '2019-05-19 02:54:30', '2019-05-19 02:54:30'),
(868, NULL, 1, 'system_admin/shop_payment_status', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-19 03:11:01', '2019-05-19 03:11:01'),
(869, NULL, 1, 'system_admin/shop_payment_status', 'GET', '127.0.0.1', '[]', '2019-05-19 03:12:23', '2019-05-19 03:12:23'),
(870, NULL, 1, 'system_admin/shop_shipping_status', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-19 03:12:30', '2019-05-19 03:12:30'),
(871, NULL, 1, 'system_admin/shop_shipping_status/create', 'GET', '127.0.0.1', '[]', '2019-05-19 03:12:34', '2019-05-19 03:12:34'),
(872, NULL, 1, 'system_admin/shop_customer', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-19 03:17:08', '2019-05-19 03:17:08'),
(873, NULL, 1, 'system_admin/subscribe', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-19 03:18:05', '2019-05-19 03:18:05'),
(874, NULL, 1, 'system_admin/subscribe/create', 'GET', '127.0.0.1', '[]', '2019-05-19 03:18:08', '2019-05-19 03:18:08'),
(875, NULL, 1, 'system_admin/subscribe', 'POST', '127.0.0.1', '{\"email\":\"mahmoud.25490@gmail.com\",\"_token\":\"XgX7CnjLPs8doHPlB14TAkJIE5Mz2KnM4qhQtSHC\",\"_previous_\":\"http:\\/\\/localhost:8000\\/system_admin\\/subscribe\"}', '2019-05-19 03:18:15', '2019-05-19 03:18:15'),
(876, NULL, 1, 'system_admin/subscribe/create', 'GET', '127.0.0.1', '[]', '2019-05-19 03:18:16', '2019-05-19 03:18:16'),
(877, NULL, 1, 'system_admin/subscribe', 'POST', '127.0.0.1', '{\"email\":\"mahmoud.25490@gmail.com\",\"_token\":\"XgX7CnjLPs8doHPlB14TAkJIE5Mz2KnM4qhQtSHC\"}', '2019-05-19 03:19:58', '2019-05-19 03:19:58'),
(878, NULL, 1, 'system_admin/subscribe', 'GET', '127.0.0.1', '[]', '2019-05-19 03:19:58', '2019-05-19 03:19:58'),
(879, NULL, 1, 'system_admin/extensions/Payment', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-19 03:31:01', '2019-05-19 03:31:01'),
(880, NULL, 1, 'system_admin/extensions/Shipping', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-19 03:31:15', '2019-05-19 03:31:15'),
(881, NULL, 1, 'system_admin/extensions/Payment', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-19 03:31:17', '2019-05-19 03:31:17'),
(882, NULL, 1, 'system_admin/extensions/Total', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-19 03:31:18', '2019-05-19 03:31:18'),
(883, NULL, 1, 'system_admin/extensions/Other', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-19 03:31:21', '2019-05-19 03:31:21'),
(884, NULL, 1, 'system_admin/extensions/Payment', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-19 03:31:26', '2019-05-19 03:31:26'),
(885, NULL, 1, 'system_admin/extensions/Total', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-19 03:33:07', '2019-05-19 03:33:07'),
(886, NULL, 1, 'system_admin/extensions/Total', 'GET', '127.0.0.1', '{\"action\":\"config\",\"extensionKey\":\"Discount\"}', '2019-05-19 03:33:11', '2019-05-19 03:33:11'),
(887, NULL, 1, 'system_admin/shop_discount', 'GET', '127.0.0.1', '[]', '2019-05-19 03:33:15', '2019-05-19 03:33:15'),
(888, NULL, 1, 'system_admin/extensions/Total', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-19 03:33:28', '2019-05-19 03:33:28'),
(889, NULL, 1, 'system_admin/extensions/Total', 'GET', '127.0.0.1', '{\"action\":\"config\",\"extensionKey\":\"Discount\"}', '2019-05-19 03:33:32', '2019-05-19 03:33:32'),
(890, NULL, 1, 'system_admin/shop_discount', 'GET', '127.0.0.1', '[]', '2019-05-19 03:33:36', '2019-05-19 03:33:36'),
(891, NULL, 1, 'system_admin/layout_url', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-19 03:34:49', '2019-05-19 03:34:49'),
(892, NULL, 1, 'system_admin/layout', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-19 03:34:54', '2019-05-19 03:34:54'),
(893, NULL, 1, 'system_admin/layout/create', 'GET', '127.0.0.1', '[]', '2019-05-19 03:34:58', '2019-05-19 03:34:58'),
(894, NULL, 1, 'system_admin/report/customer', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-19 03:35:17', '2019-05-19 03:35:17'),
(895, NULL, 1, 'system_admin/report/customer', 'GET', '127.0.0.1', '[]', '2019-05-19 03:57:02', '2019-05-19 03:57:02'),
(896, NULL, 1, 'system_admin/report/customer', 'GET', '127.0.0.1', '[]', '2019-05-19 03:58:02', '2019-05-19 03:58:02'),
(897, NULL, 1, 'system_admin', 'GET', '127.0.0.1', '[]', '2019-05-19 03:58:07', '2019-05-19 03:58:07'),
(898, NULL, 1, 'system_admin', 'GET', '127.0.0.1', '[]', '2019-05-19 04:02:39', '2019-05-19 04:02:39'),
(899, NULL, 1, 'system_admin', 'GET', '127.0.0.1', '[]', '2019-05-19 04:04:03', '2019-05-19 04:04:03'),
(900, NULL, 1, 'system_admin/shop_order', 'GET', '127.0.0.1', '{\"keyword\":\"4\"}', '2019-05-20 02:00:29', '2019-05-20 02:00:29'),
(901, NULL, 1, 'system_admin/shop_order', 'GET', '127.0.0.1', '{\"keyword\":\"0106\",\"_pjax\":\"#pjax-container\"}', '2019-05-20 02:07:22', '2019-05-20 02:07:22'),
(902, NULL, 1, 'system_admin/shop_order', 'GET', '127.0.0.1', '{\"keyword\":\"4\",\"_pjax\":\"#pjax-container\"}', '2019-05-20 02:07:28', '2019-05-20 02:07:28'),
(903, NULL, 1, 'system_admin/shop_order', 'GET', '127.0.0.1', '{\"keyword\":\"4\"}', '2019-05-20 02:08:40', '2019-05-20 02:08:40'),
(904, NULL, 1, 'system_admin/shop_order', 'GET', '127.0.0.1', '{\"keyword\":\"4\"}', '2019-05-20 02:10:02', '2019-05-20 02:10:02'),
(905, NULL, 1, 'system_admin/shop_order', 'GET', '127.0.0.1', '{\"keyword\":\"4\"}', '2019-05-20 02:10:41', '2019-05-20 02:10:41'),
(906, NULL, 1, 'system_admin/shop_order', 'GET', '127.0.0.1', '{\"keyword\":\"4\"}', '2019-05-20 02:10:57', '2019-05-20 02:10:57'),
(907, NULL, 1, 'system_admin/shop_order', 'GET', '127.0.0.1', '{\"keyword\":\"4\"}', '2019-05-20 02:11:24', '2019-05-20 02:11:24'),
(908, NULL, 1, 'system_admin/shop_order', 'GET', '127.0.0.1', '{\"keyword\":\"4\"}', '2019-05-20 02:11:29', '2019-05-20 02:11:29'),
(909, NULL, 1, 'system_admin/shop_order', 'GET', '127.0.0.1', '{\"keyword\":\"4\"}', '2019-05-20 02:14:59', '2019-05-20 02:14:59'),
(910, NULL, 1, 'system_admin/shop_order', 'GET', '127.0.0.1', '{\"keyword\":\"4\"}', '2019-05-20 02:15:20', '2019-05-20 02:15:20'),
(911, NULL, 1, 'system_admin/shop_order', 'GET', '127.0.0.1', '{\"keyword\":\"4\"}', '2019-05-20 02:15:46', '2019-05-20 02:15:46'),
(912, NULL, 1, 'system_admin/shop_order', 'GET', '127.0.0.1', '{\"keyword\":\"4\"}', '2019-05-20 02:16:12', '2019-05-20 02:16:12'),
(913, NULL, 1, 'system_admin/shop_order', 'GET', '127.0.0.1', '{\"keyword\":\"4\"}', '2019-05-20 02:30:00', '2019-05-20 02:30:00'),
(914, NULL, 1, 'system_admin/shop_order', 'GET', '127.0.0.1', '{\"keyword\":\"4\"}', '2019-05-20 02:31:53', '2019-05-20 02:31:53'),
(915, NULL, 1, 'system_admin/shop_order', 'GET', '127.0.0.1', '{\"keyword\":\"4\"}', '2019-05-20 02:33:02', '2019-05-20 02:33:02'),
(916, NULL, 1, 'system_admin/shop_order', 'GET', '127.0.0.1', '{\"keyword\":\"4\"}', '2019-05-20 02:33:37', '2019-05-20 02:33:37'),
(917, NULL, 1, 'system_admin/shop_order', 'GET', '127.0.0.1', '{\"keyword\":\"4\"}', '2019-05-20 02:33:53', '2019-05-20 02:33:53'),
(918, NULL, 1, 'system_admin/shop_order', 'GET', '127.0.0.1', '{\"keyword\":\"4\"}', '2019-05-20 02:33:58', '2019-05-20 02:33:58'),
(919, NULL, 1, 'system_admin/shop_order', 'GET', '127.0.0.1', '{\"keyword\":\"4\"}', '2019-05-20 02:34:17', '2019-05-20 02:34:17'),
(920, NULL, 1, 'system_admin/shop_order', 'GET', '127.0.0.1', '{\"keyword\":\"4\"}', '2019-05-20 02:34:42', '2019-05-20 02:34:42'),
(921, NULL, 1, 'system_admin/shop_order', 'GET', '127.0.0.1', '{\"keyword\":\"4\"}', '2019-05-20 02:35:27', '2019-05-20 02:35:27'),
(922, NULL, 1, 'system_admin/shop_order', 'GET', '127.0.0.1', '{\"keyword\":\"4\"}', '2019-05-20 02:38:57', '2019-05-20 02:38:57'),
(923, NULL, 1, 'system_admin/shop_order', 'GET', '127.0.0.1', '{\"keyword\":\"4\"}', '2019-05-20 02:39:32', '2019-05-20 02:39:32'),
(924, NULL, 1, 'system_admin/shop_order', 'GET', '127.0.0.1', '{\"keyword\":\"4\"}', '2019-05-20 02:39:49', '2019-05-20 02:39:49'),
(925, NULL, 1, 'system_admin/shop_order', 'GET', '127.0.0.1', '{\"keyword\":\"4\"}', '2019-05-20 02:42:07', '2019-05-20 02:42:07'),
(926, NULL, 1, 'system_admin/shop_order', 'GET', '127.0.0.1', '{\"keyword\":\"4\"}', '2019-05-20 02:47:11', '2019-05-20 02:47:11'),
(927, NULL, 1, 'system_admin/shop_order', 'GET', '127.0.0.1', '{\"keyword\":\"4\"}', '2019-05-20 02:48:13', '2019-05-20 02:48:13'),
(928, NULL, 1, 'system_admin/auth/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-20 02:48:24', '2019-05-20 02:48:24'),
(929, NULL, 1, 'system_admin/shop_order', 'GET', '127.0.0.1', '{\"keyword\":\"4\",\"_pjax\":\"#pjax-container\"}', '2019-05-20 02:48:29', '2019-05-20 02:48:29'),
(930, NULL, 1, 'system_admin/shop_order', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-20 02:48:48', '2019-05-20 02:48:48'),
(931, NULL, 1, 'system_admin/shop_order', 'GET', '127.0.0.1', '{\"keyword\":\"4\",\"_pjax\":\"#pjax-container\"}', '2019-05-20 02:48:55', '2019-05-20 02:48:55'),
(932, NULL, 1, 'system_admin/shop_order', 'GET', '127.0.0.1', '{\"keyword\":\"4\",\"_pjax\":\"#pjax-container\"}', '2019-05-20 02:50:37', '2019-05-20 02:50:37'),
(933, NULL, 1, 'system_admin/shop_order', 'GET', '127.0.0.1', '{\"keyword\":\"4\",\"_pjax\":\"#pjax-container\"}', '2019-05-20 02:50:58', '2019-05-20 02:50:58'),
(934, NULL, 1, 'system_admin/shop_order', 'GET', '127.0.0.1', '{\"keyword\":\"4\",\"_pjax\":\"#pjax-container\"}', '2019-05-20 02:51:33', '2019-05-20 02:51:33'),
(935, NULL, 1, 'system_admin/shop_order', 'GET', '127.0.0.1', '{\"keyword\":\"4\",\"_pjax\":\"#pjax-container\"}', '2019-05-20 02:51:36', '2019-05-20 02:51:36'),
(936, NULL, 1, 'system_admin/shop_order', 'GET', '127.0.0.1', '{\"keyword\":\"4\",\"_pjax\":\"#pjax-container\"}', '2019-05-20 02:53:18', '2019-05-20 02:53:18'),
(937, NULL, 1, 'system_admin/shop_order', 'GET', '127.0.0.1', '{\"keyword\":\"4\",\"_pjax\":\"#pjax-container\"}', '2019-05-20 02:53:20', '2019-05-20 02:53:20'),
(938, NULL, 1, 'system_admin/shop_order', 'GET', '127.0.0.1', '{\"keyword\":\"4\",\"_pjax\":\"#pjax-container\"}', '2019-05-20 02:53:56', '2019-05-20 02:53:56'),
(939, NULL, 1, 'system_admin/shop_order', 'GET', '127.0.0.1', '{\"keyword\":\"1\",\"_pjax\":\"#pjax-container\"}', '2019-05-20 02:54:05', '2019-05-20 02:54:05'),
(940, NULL, 1, 'system_admin/shop_order', 'GET', '127.0.0.1', '{\"keyword\":\"1\"}', '2019-05-20 02:55:01', '2019-05-20 02:55:01'),
(941, NULL, 1, 'system_admin/shop_order', 'GET', '127.0.0.1', '{\"keyword\":\"4\",\"_pjax\":\"#pjax-container\"}', '2019-05-20 02:55:07', '2019-05-20 02:55:07'),
(942, NULL, 1, 'system_admin/shop_order', 'GET', '127.0.0.1', '{\"keyword\":\"1\",\"_pjax\":\"#pjax-container\"}', '2019-05-20 02:55:10', '2019-05-20 02:55:10'),
(943, NULL, 1, 'system_admin/shop_order', 'GET', '127.0.0.1', '{\"keyword\":\"3\",\"_pjax\":\"#pjax-container\"}', '2019-05-20 02:55:13', '2019-05-20 02:55:13'),
(944, NULL, 1, 'system_admin/shop_order', 'GET', '127.0.0.1', '{\"keyword\":\"4\",\"_pjax\":\"#pjax-container\"}', '2019-05-20 02:55:18', '2019-05-20 02:55:18'),
(945, NULL, 1, 'system_admin/shop_order', 'GET', '127.0.0.1', '{\"keyword\":\"3\",\"_pjax\":\"#pjax-container\"}', '2019-05-20 02:56:17', '2019-05-20 02:56:17'),
(946, NULL, 1, 'system_admin/shop_order', 'GET', '127.0.0.1', '{\"keyword\":\"4\",\"_pjax\":\"#pjax-container\"}', '2019-05-20 02:56:23', '2019-05-20 02:56:23'),
(947, NULL, 1, 'system_admin/shop_order', 'GET', '127.0.0.1', '{\"keyword\":\"4\",\"_pjax\":\"#pjax-container\"}', '2019-05-20 02:56:52', '2019-05-20 02:56:52'),
(948, NULL, 1, 'system_admin/shop_order', 'GET', '127.0.0.1', '{\"keyword\":\"4\",\"_pjax\":\"#pjax-container\"}', '2019-05-20 02:57:09', '2019-05-20 02:57:09'),
(949, NULL, 1, 'system_admin/shop_order_edit/3', 'GET', '127.0.0.1', '[]', '2019-05-20 02:57:16', '2019-05-20 02:57:16'),
(950, NULL, 1, 'system_admin/shop_order', 'GET', '127.0.0.1', '{\"keyword\":\"4\",\"_pjax\":\"#pjax-container\"}', '2019-05-20 02:58:39', '2019-05-20 02:58:39'),
(951, NULL, 1, 'system_admin/shop_order', 'GET', '127.0.0.1', '{\"keyword\":\"4\",\"_pjax\":\"#pjax-container\"}', '2019-05-20 02:58:41', '2019-05-20 02:58:41'),
(952, NULL, 1, 'system_admin/shop_order', 'GET', '127.0.0.1', '{\"keyword\":\"4\",\"_pjax\":\"#pjax-container\"}', '2019-05-20 02:58:54', '2019-05-20 02:58:54'),
(953, NULL, 1, 'system_admin/shop_order', 'GET', '127.0.0.1', '{\"keyword\":\"1\",\"_pjax\":\"#pjax-container\"}', '2019-05-20 02:59:00', '2019-05-20 02:59:00'),
(954, NULL, 1, 'system_admin/shop_order', 'GET', '127.0.0.1', '{\"keyword\":\"4\",\"_pjax\":\"#pjax-container\"}', '2019-05-20 03:00:29', '2019-05-20 03:00:29'),
(955, NULL, 1, 'system_admin/shop_order', 'GET', '127.0.0.1', '{\"keyword\":\"4\",\"_pjax\":\"#pjax-container\"}', '2019-05-20 03:01:16', '2019-05-20 03:01:16'),
(956, NULL, 1, 'system_admin/shop_order', 'GET', '127.0.0.1', '{\"keyword\":\"7\",\"_pjax\":\"#pjax-container\"}', '2019-05-20 03:01:23', '2019-05-20 03:01:23'),
(957, NULL, 1, 'system_admin/shop_order_edit/4', 'GET', '127.0.0.1', '[]', '2019-05-20 03:01:51', '2019-05-20 03:01:51'),
(958, NULL, 1, 'system_admin/shop_order_edit/3', 'GET', '127.0.0.1', '[]', '2019-05-20 03:02:05', '2019-05-20 03:02:05'),
(959, NULL, 1, 'system_admin/shop_order', 'GET', '127.0.0.1', '{\"keyword\":\"7\"}', '2019-05-20 03:02:42', '2019-05-20 03:02:42'),
(960, NULL, 1, 'system_admin/shop_order_edit/4', 'GET', '127.0.0.1', '[]', '2019-05-20 03:04:42', '2019-05-20 03:04:42'),
(961, NULL, 1, 'system_admin/shop_order_edit/3', 'GET', '127.0.0.1', '[]', '2019-05-20 03:05:00', '2019-05-20 03:05:00'),
(962, NULL, 1, 'system_admin/shop_order_edit/3', 'GET', '127.0.0.1', '[]', '2019-05-20 03:05:19', '2019-05-20 03:05:19'),
(963, NULL, 1, 'system_admin/shop_order_edit/3', 'GET', '127.0.0.1', '[]', '2019-05-20 03:06:24', '2019-05-20 03:06:24'),
(964, NULL, 1, 'system_admin/shop_order_edit/3', 'GET', '127.0.0.1', '[]', '2019-05-20 03:11:58', '2019-05-20 03:11:58'),
(965, NULL, 1, 'system_admin/shop_order_edit/4', 'GET', '127.0.0.1', '[]', '2019-05-20 03:12:09', '2019-05-20 03:12:09'),
(966, NULL, 1, 'system_admin/shop_order_edit/4', 'GET', '127.0.0.1', '[]', '2019-05-20 03:16:44', '2019-05-20 03:16:44'),
(967, NULL, 1, 'system_admin/shop_order_edit/4', 'GET', '127.0.0.1', '[]', '2019-05-20 03:17:35', '2019-05-20 03:17:35'),
(968, NULL, 1, 'system_admin/shop_order_edit/3', 'GET', '127.0.0.1', '[]', '2019-05-20 03:19:07', '2019-05-20 03:19:07'),
(969, NULL, 1, 'system_admin/shop_order_edit/3', 'GET', '127.0.0.1', '[]', '2019-05-20 03:20:14', '2019-05-20 03:20:14'),
(970, NULL, 1, 'system_admin/shop_order_edit/3', 'GET', '127.0.0.1', '[]', '2019-05-20 03:20:37', '2019-05-20 03:20:37'),
(971, NULL, 1, 'system_admin/shop_order_edit/3', 'GET', '127.0.0.1', '[]', '2019-05-20 03:21:01', '2019-05-20 03:21:01'),
(972, NULL, 1, 'system_admin/shop_order_edit/3', 'GET', '127.0.0.1', '[]', '2019-05-20 03:21:43', '2019-05-20 03:21:43'),
(973, NULL, 1, 'system_admin/get_info/productInfo', 'GET', '127.0.0.1', '{\"id\":\"3\"}', '2019-05-20 03:22:13', '2019-05-20 03:22:13'),
(974, NULL, 1, 'system_admin/shop_order_edit/order_add_item', 'POST', '127.0.0.1', '{\"_token\":\"LM3RoeWQSrFex2RHTyCMoQwMNDsK6H7ioV3Ysjbi\",\"add_order\":\"3\",\"add_id\":\"3\",\"add_qty\":\"1\",\"add_price\":\"220000\"}', '2019-05-20 03:22:14', '2019-05-20 03:22:14'),
(975, NULL, 1, 'system_admin/shop_order_edit/3', 'GET', '127.0.0.1', '[]', '2019-05-20 03:22:16', '2019-05-20 03:22:16'),
(976, NULL, 1, 'system_admin/get_info/itemInfo', 'GET', '127.0.0.1', '{\"id\":\"4\"}', '2019-05-20 03:22:21', '2019-05-20 03:22:21'),
(977, NULL, 1, 'system_admin/shop_order_edit/order_edit_item', 'POST', '127.0.0.1', '{\"pOrder\":\"3\",\"pId\":\"4\",\"pName\":null,\"pQty\":\"1\",\"pPrice\":\"220000\",\"pAttr\":\"xc\",\"_token\":\"LM3RoeWQSrFex2RHTyCMoQwMNDsK6H7ioV3Ysjbi\"}', '2019-05-20 03:22:31', '2019-05-20 03:22:31'),
(978, NULL, 1, 'system_admin/shop_order_edit/3', 'GET', '127.0.0.1', '[]', '2019-05-20 03:22:32', '2019-05-20 03:22:32'),
(979, NULL, 1, 'system_admin/get_info/itemInfo', 'GET', '127.0.0.1', '{\"id\":\"4\"}', '2019-05-20 03:22:39', '2019-05-20 03:22:39'),
(980, NULL, 1, 'system_admin/process/productImport', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-20 03:22:48', '2019-05-20 03:22:48'),
(981, NULL, 1, 'system_admin/shop_attribute_group', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-20 03:22:51', '2019-05-20 03:22:51'),
(982, NULL, 1, 'system_admin/shop_product', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-20 03:23:11', '2019-05-20 03:23:11'),
(983, NULL, 1, 'system_admin/shop_product', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-20 03:23:15', '2019-05-20 03:23:15'),
(984, NULL, 1, 'system_admin/shop_product', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-20 03:23:19', '2019-05-20 03:23:19'),
(985, NULL, 1, 'system_admin/shop_order', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-20 03:24:37', '2019-05-20 03:24:37'),
(986, NULL, 1, 'system_admin/shop_order_edit/4', 'GET', '127.0.0.1', '[]', '2019-05-20 03:24:41', '2019-05-20 03:24:41'),
(987, NULL, 1, 'system_admin/shop_order_edit/4', 'GET', '127.0.0.1', '[]', '2019-05-20 03:27:48', '2019-05-20 03:27:48'),
(988, NULL, 1, 'system_admin/shop_order_edit/4', 'GET', '127.0.0.1', '[]', '2019-05-20 03:29:17', '2019-05-20 03:29:17'),
(989, NULL, 1, 'system_admin/shop_order_edit/3', 'GET', '127.0.0.1', '[]', '2019-05-20 03:29:23', '2019-05-20 03:29:23'),
(990, NULL, 1, 'system_admin/shop_order_edit/9', 'GET', '127.0.0.1', '[]', '2019-05-20 03:29:32', '2019-05-20 03:29:32'),
(991, NULL, 1, 'system_admin/shop_order_edit/3', 'GET', '127.0.0.1', '[]', '2019-05-20 03:29:38', '2019-05-20 03:29:38'),
(992, NULL, 1, 'system_admin/shop_product', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-20 03:30:06', '2019-05-20 03:30:06'),
(993, NULL, 1, 'system_admin/shop_product', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-20 04:18:51', '2019-05-20 04:18:51'),
(994, NULL, 1, 'system_admin/shop_product', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-20 04:24:00', '2019-05-20 04:24:00'),
(995, NULL, 1, 'system_admin/shop_product', 'GET', '127.0.0.1', '[]', '2019-05-20 04:25:17', '2019-05-20 04:25:17'),
(996, NULL, 1, 'system_admin/shop_product/create', 'GET', '127.0.0.1', '[]', '2019-05-20 04:25:32', '2019-05-20 04:25:32'),
(997, NULL, 1, 'system_admin/shop_product/create', 'GET', '127.0.0.1', '[]', '2019-05-20 04:28:47', '2019-05-20 04:28:47'),
(998, NULL, 1, 'system_admin/shop_product/create', 'GET', '127.0.0.1', '[]', '2019-05-20 04:29:17', '2019-05-20 04:29:17'),
(999, NULL, 1, 'system_admin/shop_product/create', 'GET', '127.0.0.1', '[]', '2019-05-20 04:30:14', '2019-05-20 04:30:14'),
(1000, NULL, 1, 'system_admin/shop_product/create', 'GET', '127.0.0.1', '[]', '2019-05-20 04:39:31', '2019-05-20 04:39:31'),
(1001, NULL, 1, 'system_admin/shop_product/create', 'GET', '127.0.0.1', '[]', '2019-05-20 04:39:44', '2019-05-20 04:39:44'),
(1002, NULL, 1, 'system_admin/shop_product/create', 'GET', '127.0.0.1', '[]', '2019-05-20 04:39:56', '2019-05-20 04:39:56'),
(1003, NULL, 1, 'system_admin/shop_product/create', 'GET', '127.0.0.1', '[]', '2019-05-20 04:40:10', '2019-05-20 04:40:10'),
(1004, NULL, 1, 'system_admin/shop_product/create', 'GET', '127.0.0.1', '[]', '2019-05-20 04:40:50', '2019-05-20 04:40:50'),
(1005, NULL, 1, 'system_admin/shop_product/create', 'GET', '127.0.0.1', '[]', '2019-05-20 04:46:59', '2019-05-20 04:46:59'),
(1006, NULL, 1, 'system_admin/shop_product/create', 'GET', '127.0.0.1', '[]', '2019-05-20 04:48:48', '2019-05-20 04:48:48'),
(1007, NULL, 1, 'system_admin/shop_product/create', 'GET', '127.0.0.1', '[]', '2019-05-20 04:50:02', '2019-05-20 04:50:02'),
(1008, NULL, 1, 'system_admin/shop_product/create', 'GET', '127.0.0.1', '[]', '2019-05-20 04:53:29', '2019-05-20 04:53:29'),
(1009, NULL, 1, 'system_admin/shop_product/create', 'GET', '127.0.0.1', '[]', '2019-05-20 05:04:15', '2019-05-20 05:04:15'),
(1010, NULL, 1, 'system_admin/shop_product/create', 'GET', '127.0.0.1', '[]', '2019-05-20 05:15:51', '2019-05-20 05:15:51'),
(1011, NULL, 1, 'system_admin', 'GET', '127.0.0.1', '[]', '2019-05-20 05:16:28', '2019-05-20 05:16:28'),
(1012, NULL, 1, 'system_admin/shop_order_status', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-20 05:16:47', '2019-05-20 05:16:47'),
(1013, NULL, 1, 'system_admin/shop_order_status/create', 'GET', '127.0.0.1', '[]', '2019-05-20 05:16:49', '2019-05-20 05:16:49'),
(1014, NULL, 1, 'system_admin/auth/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-20 05:17:00', '2019-05-20 05:17:00'),
(1015, NULL, 1, 'system_admin/auth/users/create', 'GET', '127.0.0.1', '[]', '2019-05-20 05:17:02', '2019-05-20 05:17:02'),
(1016, NULL, 1, 'system_admin/shop_product', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-20 05:17:54', '2019-05-20 05:17:54'),
(1017, NULL, 1, 'system_admin/shop_product', 'GET', '127.0.0.1', '[]', '2019-05-20 05:18:30', '2019-05-20 05:18:30'),
(1018, NULL, 1, 'system_admin/shop_product/create', 'GET', '127.0.0.1', '[]', '2019-05-20 05:18:37', '2019-05-20 05:18:37'),
(1019, NULL, 1, 'system_admin/shop_category', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-20 05:18:57', '2019-05-20 05:18:57'),
(1020, NULL, 1, 'system_admin/shop_category/19', 'PUT', '127.0.0.1', '{\"top\":\"on\",\"_token\":\"LM3RoeWQSrFex2RHTyCMoQwMNDsK6H7ioV3Ysjbi\",\"_method\":\"PUT\"}', '2019-05-20 05:19:01', '2019-05-20 05:19:01'),
(1021, NULL, 1, 'system_admin/shop_category', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-20 05:19:06', '2019-05-20 05:19:06'),
(1022, NULL, 1, 'system_admin/shop_category/19', 'PUT', '127.0.0.1', '{\"top\":\"on\",\"_token\":\"LM3RoeWQSrFex2RHTyCMoQwMNDsK6H7ioV3Ysjbi\",\"_method\":\"PUT\"}', '2019-05-20 05:19:08', '2019-05-20 05:19:08'),
(1023, NULL, 1, 'system_admin/shop_category/19/edit', 'GET', '127.0.0.1', '[]', '2019-05-20 05:19:30', '2019-05-20 05:19:30'),
(1024, NULL, 1, 'system_admin/shop_category', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-20 05:20:34', '2019-05-20 05:20:34'),
(1025, NULL, 1, 'system_admin/shop_product', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-20 05:20:36', '2019-05-20 05:20:36'),
(1026, NULL, 1, 'system_admin/shop_product/50/edit', 'GET', '127.0.0.1', '[]', '2019-05-20 05:20:39', '2019-05-20 05:20:39'),
(1027, NULL, 1, 'system_admin/shop_product/50/edit', 'GET', '127.0.0.1', '[]', '2019-05-20 05:25:02', '2019-05-20 05:25:02'),
(1028, NULL, 1, 'system_admin/shop_product/50/edit', 'GET', '127.0.0.1', '[]', '2019-05-20 05:27:21', '2019-05-20 05:27:21'),
(1029, NULL, 1, 'system_admin/shop_product/50/edit', 'GET', '127.0.0.1', '[]', '2019-05-20 05:29:21', '2019-05-20 05:29:21'),
(1030, NULL, 1, 'system_admin/shop_product/50/edit', 'GET', '127.0.0.1', '[]', '2019-05-20 06:15:04', '2019-05-20 06:15:04'),
(1031, NULL, 1, 'system_admin/shop_product/50/edit', 'GET', '127.0.0.1', '[]', '2019-05-20 06:18:13', '2019-05-20 06:18:13'),
(1032, NULL, 1, 'system_admin/shop_category', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-20 06:18:33', '2019-05-20 06:18:33'),
(1033, NULL, 1, 'system_admin/shop_product', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-20 06:18:39', '2019-05-20 06:18:39'),
(1034, NULL, 1, 'system_admin/shop_product', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-20 06:18:45', '2019-05-20 06:18:45'),
(1035, NULL, 1, 'system_admin/shop_product', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-20 06:20:20', '2019-05-20 06:20:20'),
(1036, NULL, 1, 'system_admin/shop_product/3/edit', 'GET', '127.0.0.1', '[]', '2019-05-20 06:20:28', '2019-05-20 06:20:28'),
(1037, NULL, 1, 'system_admin/shop_product/3/edit', 'GET', '127.0.0.1', '[]', '2019-05-20 06:33:05', '2019-05-20 06:33:05'),
(1038, NULL, 1, 'system_admin/shop_product/3/edit', 'GET', '127.0.0.1', '[]', '2019-05-20 06:39:12', '2019-05-20 06:39:12'),
(1039, NULL, 1, 'system_admin/shop_product/3/edit', 'GET', '127.0.0.1', '[]', '2019-05-20 06:51:34', '2019-05-20 06:51:34'),
(1040, NULL, 1, 'system_admin/shop_product/3/edit', 'GET', '127.0.0.1', '[]', '2019-05-20 06:51:53', '2019-05-20 06:51:53'),
(1041, NULL, 1, 'system_admin/shop_product/3/edit', 'GET', '127.0.0.1', '[]', '2019-05-20 06:53:02', '2019-05-20 06:53:02'),
(1042, NULL, 1, 'system_admin', 'GET', '127.0.0.1', '[]', '2019-05-21 03:46:20', '2019-05-21 03:46:20'),
(1043, NULL, 1, 'system_admin', 'GET', '127.0.0.1', '[]', '2019-05-21 03:49:20', '2019-05-21 03:49:20'),
(1044, NULL, 1, 'system_admin', 'GET', '127.0.0.1', '[]', '2019-05-21 03:50:16', '2019-05-21 03:50:16'),
(1045, NULL, 1, 'system_admin/modules/Cms', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-21 03:50:31', '2019-05-21 03:50:31'),
(1046, NULL, 1, 'system_admin/auth/logs', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-21 04:10:05', '2019-05-21 04:10:05'),
(1047, NULL, 1, 'system_admin/auth/logs', 'GET', '127.0.0.1', '[]', '2019-05-21 04:10:27', '2019-05-21 04:10:27'),
(1048, NULL, 1, 'system_admin/shop_page', 'GET', '127.0.0.1', '[]', '2019-05-21 04:11:49', '2019-05-21 04:11:49'),
(1049, NULL, 1, 'system_admin/shop_page/create', 'GET', '127.0.0.1', '[]', '2019-05-21 04:11:55', '2019-05-21 04:11:55'),
(1050, NULL, 1, 'system_admin/shop_page/create', 'GET', '127.0.0.1', '[]', '2019-05-21 04:14:31', '2019-05-21 04:14:31'),
(1051, NULL, 1, 'system_admin/shop_page/create', 'GET', '127.0.0.1', '[]', '2019-05-21 04:19:22', '2019-05-21 04:19:22'),
(1052, NULL, 1, 'system_admin', 'GET', '127.0.0.1', '[]', '2019-05-21 04:19:31', '2019-05-21 04:19:31'),
(1053, NULL, 1, 'system_admin/banner', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-21 04:21:12', '2019-05-21 04:21:12'),
(1054, NULL, 1, 'system_admin/documents', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-21 04:21:16', '2019-05-21 04:21:16'),
(1055, NULL, 1, 'system_admin/documents', 'GET', '127.0.0.1', '[]', '2019-05-21 04:21:17', '2019-05-21 04:21:17'),
(1056, NULL, 1, 'system_admin/documents/folders', 'GET', '127.0.0.1', '{\"working_dir\":null,\"type\":null,\"_\":\"1558394478238\"}', '2019-05-21 04:21:18', '2019-05-21 04:21:18'),
(1057, NULL, 1, 'system_admin/documents/errors', 'GET', '127.0.0.1', '{\"working_dir\":null,\"type\":null,\"_\":\"1558394478239\"}', '2019-05-21 04:21:19', '2019-05-21 04:21:19'),
(1058, NULL, 1, 'system_admin/documents/jsonitems', 'GET', '127.0.0.1', '{\"working_dir\":null,\"type\":null,\"sort_type\":\"alphabetic\",\"_\":\"1558394478240\"}', '2019-05-21 04:21:19', '2019-05-21 04:21:19'),
(1059, NULL, 1, 'system_admin/documents/jsonitems', 'GET', '127.0.0.1', '{\"working_dir\":\"\\/photos\",\"type\":null,\"sort_type\":\"alphabetic\",\"_\":\"1558394478241\"}', '2019-05-21 04:21:22', '2019-05-21 04:21:22'),
(1060, NULL, 1, 'system_admin/documents/jsonitems', 'GET', '127.0.0.1', '{\"working_dir\":\"\\/photos\\/blogs\",\"type\":null,\"sort_type\":\"alphabetic\",\"_\":\"1558394478242\"}', '2019-05-21 04:21:24', '2019-05-21 04:21:24'),
(1061, NULL, 1, 'system_admin/banner', 'GET', '127.0.0.1', '[]', '2019-05-21 04:21:28', '2019-05-21 04:21:28'),
(1062, NULL, 1, 'system_admin/banner/create', 'GET', '127.0.0.1', '[]', '2019-05-21 04:21:32', '2019-05-21 04:21:32'),
(1063, NULL, 1, 'system_admin/layout_url', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-21 04:21:56', '2019-05-21 04:21:56'),
(1064, NULL, 1, 'system_admin/layout_url', 'GET', '127.0.0.1', '[]', '2019-05-21 04:22:21', '2019-05-21 04:22:21'),
(1065, NULL, 1, 'system_admin/layout_url', 'GET', '127.0.0.1', '[]', '2019-05-21 04:26:40', '2019-05-21 04:26:40'),
(1066, NULL, 1, 'system_admin/config_info', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-21 04:32:44', '2019-05-21 04:32:44'),
(1067, NULL, 1, 'system_admin/config_global', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-21 04:32:53', '2019-05-21 04:32:53'),
(1068, NULL, 1, 'system_admin/config_global/1/edit', 'GET', '127.0.0.1', '[]', '2019-05-21 04:33:23', '2019-05-21 04:33:23'),
(1069, NULL, 1, 'system_admin/config_global/1', 'PUT', '127.0.0.1', '{\"key\":\"0\",\"logo\":\"_file_del_\",\"_file_del_\":null,\"_token\":\"xudvtdSG5nZiqQRmbwjSgtAwNcIiLWCMTmCyv4Wk\",\"_method\":\"PUT\"}', '2019-05-21 04:36:43', '2019-05-21 04:36:43'),
(1070, NULL, 1, 'system_admin/config_global/1', 'PUT', '127.0.0.1', '{\"key\":\"0\",\"logo\":\"_file_del_\",\"_file_del_\":null,\"_token\":\"xudvtdSG5nZiqQRmbwjSgtAwNcIiLWCMTmCyv4Wk\",\"_method\":\"PUT\"}', '2019-05-21 04:36:45', '2019-05-21 04:36:45'),
(1071, NULL, 1, 'system_admin/config_global/1', 'PUT', '127.0.0.1', '{\"key\":\"0\",\"logo\":\"_file_del_\",\"_file_del_\":null,\"_token\":\"xudvtdSG5nZiqQRmbwjSgtAwNcIiLWCMTmCyv4Wk\",\"_method\":\"PUT\"}', '2019-05-21 04:36:47', '2019-05-21 04:36:47'),
(1072, NULL, 1, 'system_admin/config_global/1', 'PUT', '127.0.0.1', '{\"key\":\"0\",\"logo\":\"_file_del_\",\"_file_del_\":null,\"_token\":\"xudvtdSG5nZiqQRmbwjSgtAwNcIiLWCMTmCyv4Wk\",\"_method\":\"PUT\"}', '2019-05-21 04:36:48', '2019-05-21 04:36:48'),
(1073, NULL, 1, 'system_admin/config_info', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-21 04:36:54', '2019-05-21 04:36:54'),
(1074, NULL, 1, 'system_admin/config_global', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-21 04:36:57', '2019-05-21 04:36:57'),
(1075, NULL, 1, 'system_admin/config_global/1/edit', 'GET', '127.0.0.1', '[]', '2019-05-21 04:37:01', '2019-05-21 04:37:01'),
(1076, NULL, 1, 'system_admin/config_global/1', 'PUT', '127.0.0.1', '{\"key\":\"0\",\"watermark\":\"_file_del_\",\"_file_del_\":null,\"_token\":\"xudvtdSG5nZiqQRmbwjSgtAwNcIiLWCMTmCyv4Wk\",\"_method\":\"PUT\"}', '2019-05-21 04:38:00', '2019-05-21 04:38:00'),
(1077, NULL, 1, 'system_admin/config_global/1', 'PUT', '127.0.0.1', '{\"ar__title\":\"souqVIS\",\"ar__keyword\":null,\"ar__description\":\"easy to sell and buy\",\"en__title\":\"souqVIS\",\"en__keyword\":null,\"en__description\":\"easy to sell\",\"vi__title\":\"Souq\",\"vi__keyword\":\"ar\",\"vi__description\":null,\"phone\":\"0123456789\",\"long_phone\":\"Support: 0987654321\",\"time_active\":null,\"address\":\"123st - abc - xyz\",\"email\":\"admin@admin.com\",\"locale\":\"ar\",\"currency\":\"EGP\",\"_token\":\"xudvtdSG5nZiqQRmbwjSgtAwNcIiLWCMTmCyv4Wk\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/localhost:8000\\/system_admin\\/config_global\"}', '2019-05-21 04:38:23', '2019-05-21 04:38:23'),
(1078, NULL, 1, 'system_admin/config_global/1/edit', 'GET', '127.0.0.1', '[]', '2019-05-21 04:38:23', '2019-05-21 04:38:23'),
(1079, NULL, 1, 'system_admin/config_global/1', 'GET', '127.0.0.1', '[]', '2019-05-24 17:31:38', '2019-05-24 17:31:38'),
(1080, NULL, 1, 'system_admin/config_global/1', 'GET', '127.0.0.1', '[]', '2019-05-25 03:00:01', '2019-05-25 03:00:01'),
(1081, NULL, 1, 'system_admin/config_global/1', 'GET', '127.0.0.1', '[]', '2019-05-25 03:02:28', '2019-05-25 03:02:28'),
(1082, NULL, 1, 'system_admin/config_global/1', 'GET', '127.0.0.1', '[]', '2019-05-25 03:07:57', '2019-05-25 03:07:57'),
(1083, NULL, 1, 'system_admin/config_global/1', 'GET', '127.0.0.1', '[]', '2019-05-25 03:13:10', '2019-05-25 03:13:10'),
(1084, NULL, 1, 'system_admin/config_global/1', 'GET', '127.0.0.1', '[]', '2019-05-25 03:13:45', '2019-05-25 03:13:45'),
(1085, NULL, 1, 'system_admin/config_global/1', 'GET', '127.0.0.1', '[]', '2019-05-25 03:17:24', '2019-05-25 03:17:24'),
(1086, NULL, 1, 'system_admin/config_global/1', 'GET', '127.0.0.1', '[]', '2019-05-25 03:21:19', '2019-05-25 03:21:19'),
(1087, NULL, 1, 'system_admin', 'GET', '127.0.0.1', '[]', '2019-05-25 03:21:44', '2019-05-25 03:21:44'),
(1088, NULL, 1, 'system_admin/config_info', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-25 03:27:50', '2019-05-25 03:27:50'),
(1089, NULL, 1, 'system_admin/config_global', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-25 03:27:56', '2019-05-25 03:27:56');
INSERT INTO `admin_operation_log` (`id`, `company_id`, `user_id`, `path`, `method`, `ip`, `input`, `created_at`, `updated_at`) VALUES
(1090, NULL, 1, 'system_admin/config_global', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-25 03:29:11', '2019-05-25 03:29:11'),
(1091, NULL, 1, 'system_admin/config_global', 'GET', '127.0.0.1', '{\"_columns_\":\"html,logo,descriptions,phone,long_phone,time_active,address,email,locale,currency\",\"_pjax\":\"#pjax-container\"}', '2019-05-25 03:29:25', '2019-05-25 03:29:25'),
(1092, NULL, 1, 'system_admin/config_global', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-25 03:29:30', '2019-05-25 03:29:30'),
(1093, NULL, 1, 'system_admin/config_global/1/edit', 'GET', '127.0.0.1', '[]', '2019-05-25 03:29:56', '2019-05-25 03:29:56'),
(1094, NULL, 1, 'system_admin/config_global/1/edit', 'GET', '127.0.0.1', '[]', '2019-05-25 03:34:48', '2019-05-25 03:34:48'),
(1095, NULL, 1, 'system_admin/config_global/1/edit', 'GET', '127.0.0.1', '[]', '2019-05-25 03:38:22', '2019-05-25 03:38:22'),
(1096, NULL, 1, 'system_admin', 'GET', '127.0.0.1', '[]', '2019-05-25 04:06:03', '2019-05-25 04:06:03'),
(1097, NULL, 1, 'system_admin', 'GET', '127.0.0.1', '[]', '2019-05-25 04:09:16', '2019-05-25 04:09:16'),
(1098, NULL, 1, 'system_admin', 'GET', '127.0.0.1', '[]', '2019-05-25 04:10:06', '2019-05-25 04:10:06'),
(1099, NULL, 1, 'system_admin', 'GET', '127.0.0.1', '[]', '2019-05-25 04:11:01', '2019-05-25 04:11:01'),
(1100, NULL, 1, 'system_admin', 'GET', '127.0.0.1', '[]', '2019-05-25 04:12:16', '2019-05-25 04:12:16'),
(1101, NULL, 1, 'system_admin', 'GET', '127.0.0.1', '[]', '2019-05-25 04:15:36', '2019-05-25 04:15:36'),
(1102, NULL, 1, 'system_admin/shop_customer', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-25 04:16:22', '2019-05-25 04:16:22'),
(1103, NULL, 1, 'system_admin/shop_customer', 'GET', '127.0.0.1', '[]', '2019-05-25 04:42:44', '2019-05-25 04:42:44'),
(1104, NULL, 1, 'system_admin/shop_customer', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-25 04:43:09', '2019-05-25 04:43:09'),
(1105, NULL, 1, 'system_admin/shop_customer', 'GET', '127.0.0.1', '[]', '2019-05-25 04:45:06', '2019-05-25 04:45:06'),
(1106, NULL, 1, 'system_admin/shop_customer', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-25 04:45:18', '2019-05-25 04:45:18'),
(1107, NULL, 1, 'system_admin/shop_customer', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-25 04:45:19', '2019-05-25 04:45:19'),
(1108, NULL, 1, 'system_admin/subscribe', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-25 04:45:25', '2019-05-25 04:45:25'),
(1109, NULL, 1, 'system_admin/subscribe/create', 'GET', '127.0.0.1', '[]', '2019-05-25 04:45:27', '2019-05-25 04:45:27'),
(1110, NULL, 1, 'system_admin/auth/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-25 04:45:35', '2019-05-25 04:45:35'),
(1111, NULL, 1, 'system_admin/auth/users', 'GET', '127.0.0.1', '[]', '2019-05-25 04:51:21', '2019-05-25 04:51:21'),
(1112, NULL, 1, 'system_admin/auth/menu', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-25 04:51:31', '2019-05-25 04:51:31'),
(1113, NULL, 1, 'system_admin/shop_vendor', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-25 04:52:57', '2019-05-25 04:52:57'),
(1114, NULL, 1, 'system_admin', 'GET', '127.0.0.1', '[]', '2019-05-25 04:53:01', '2019-05-25 04:53:01'),
(1115, NULL, 1, 'system_admin/config_info', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-25 04:53:21', '2019-05-25 04:53:21'),
(1116, NULL, 1, 'system_admin/config_info', 'GET', '127.0.0.1', '[]', '2019-05-25 05:06:22', '2019-05-25 05:06:22'),
(1117, NULL, 1, 'system_admin/config_info', 'GET', '127.0.0.1', '{\"_columns_\":\"detail\",\"_pjax\":\"#pjax-container\"}', '2019-05-25 05:06:39', '2019-05-25 05:06:39'),
(1118, NULL, 1, 'system_admin/config_info', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-25 05:06:43', '2019-05-25 05:06:43'),
(1119, NULL, 1, 'system_admin/config_info', 'GET', '127.0.0.1', '{\"_columns_\":\"detail\",\"_pjax\":\"#pjax-container\"}', '2019-05-25 05:06:47', '2019-05-25 05:06:47'),
(1120, NULL, 1, 'system_admin/config_info', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-25 05:06:52', '2019-05-25 05:06:52'),
(1121, NULL, 1, 'system_admin/config_info', 'GET', '127.0.0.1', '[]', '2019-05-25 05:07:11', '2019-05-25 05:07:11'),
(1122, NULL, 1, 'system_admin/config_global', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-25 05:07:16', '2019-05-25 05:07:16'),
(1123, NULL, 1, 'system_admin', 'GET', '127.0.0.1', '[]', '2019-05-25 05:07:26', '2019-05-25 05:07:26'),
(1124, NULL, 1, 'system_admin/shop_order', 'GET', '127.0.0.1', '[]', '2019-05-25 05:22:24', '2019-05-25 05:22:24'),
(1125, NULL, 1, 'system_admin', 'GET', '127.0.0.1', '[]', '2019-05-25 05:27:42', '2019-05-25 05:27:42'),
(1126, NULL, 1, 'system_admin', 'GET', '127.0.0.1', '[]', '2019-05-25 05:28:55', '2019-05-25 05:28:55'),
(1127, NULL, 1, 'system_admin', 'GET', '127.0.0.1', '[]', '2019-05-25 05:30:17', '2019-05-25 05:30:17'),
(1128, NULL, 1, 'system_admin', 'GET', '127.0.0.1', '[]', '2019-05-25 05:30:41', '2019-05-25 05:30:41'),
(1129, NULL, 1, 'system_admin', 'GET', '127.0.0.1', '[]', '2019-05-25 05:31:20', '2019-05-25 05:31:20'),
(1130, NULL, 1, 'system_admin', 'GET', '127.0.0.1', '[]', '2019-05-25 05:33:07', '2019-05-25 05:33:07'),
(1131, NULL, 1, 'system_admin', 'GET', '127.0.0.1', '[]', '2019-05-25 05:33:56', '2019-05-25 05:33:56'),
(1132, NULL, 1, 'system_admin/report/product', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-25 05:34:20', '2019-05-25 05:34:20'),
(1133, NULL, 1, 'system_admin/report/product', 'GET', '127.0.0.1', '[]', '2019-05-25 05:46:20', '2019-05-25 05:46:20'),
(1134, NULL, 1, 'system_admin/report/product', 'GET', '127.0.0.1', '[]', '2019-05-25 05:49:10', '2019-05-25 05:49:10'),
(1135, NULL, 1, 'system_admin/report/product', 'GET', '127.0.0.1', '[]', '2019-05-25 05:49:48', '2019-05-25 05:49:48'),
(1136, NULL, 1, 'system_admin/report/product', 'GET', '127.0.0.1', '[]', '2019-05-25 05:50:52', '2019-05-25 05:50:52'),
(1137, NULL, 1, 'system_admin/shop_product', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-25 05:51:07', '2019-05-25 05:51:07'),
(1138, NULL, 1, 'system_admin', 'GET', '127.0.0.1', '[]', '2019-05-25 05:51:21', '2019-05-25 05:51:21'),
(1139, NULL, 1, 'system_admin/auth/menu', 'GET', '127.0.0.1', '[]', '2019-05-25 14:55:14', '2019-05-25 14:55:14'),
(1140, NULL, 1, 'system_admin/auth/menu', 'GET', '127.0.0.1', '[]', '2019-05-25 14:56:53', '2019-05-25 14:56:53'),
(1141, NULL, 1, 'system_admin/auth/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-25 14:57:00', '2019-05-25 14:57:00'),
(1142, NULL, 1, 'system_admin/auth/roles', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-25 14:57:02', '2019-05-25 14:57:02'),
(1143, NULL, 1, 'system_admin/auth/roles/create', 'GET', '127.0.0.1', '[]', '2019-05-25 14:58:40', '2019-05-25 14:58:40'),
(1144, NULL, 1, 'system_admin/shop_category', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-25 15:08:32', '2019-05-25 15:08:32'),
(1145, NULL, 1, 'system_admin/shop_category', 'GET', '127.0.0.1', '[]', '2019-05-25 15:11:17', '2019-05-25 15:11:17'),
(1146, NULL, 1, 'system_admin/shop_category', 'GET', '127.0.0.1', '[]', '2019-05-25 21:04:28', '2019-05-25 21:04:28'),
(1147, NULL, 1, 'system_admin/shop_category', 'GET', '127.0.0.1', '[]', '2019-05-25 21:04:54', '2019-05-25 21:04:54'),
(1148, NULL, 1, 'system_admin/shop_category', 'GET', '127.0.0.1', '[]', '2019-05-25 21:05:11', '2019-05-25 21:05:11'),
(1149, NULL, 1, 'system_admin/shop_category', 'GET', '127.0.0.1', '[]', '2019-05-25 21:06:27', '2019-05-25 21:06:27'),
(1150, NULL, 1, 'system_admin/shop_category', 'GET', '127.0.0.1', '[]', '2019-05-25 21:07:14', '2019-05-25 21:07:14'),
(1151, NULL, 1, 'system_admin/shop_category', 'GET', '127.0.0.1', '[]', '2019-05-25 21:07:52', '2019-05-25 21:07:52'),
(1152, NULL, 1, 'system_admin/shop_category', 'GET', '127.0.0.1', '[]', '2019-05-25 21:08:10', '2019-05-25 21:08:10'),
(1153, NULL, 1, 'system_admin/shop_category', 'GET', '127.0.0.1', '[]', '2019-05-25 21:08:30', '2019-05-25 21:08:30'),
(1154, NULL, 1, 'system_admin/documents', 'GET', '127.0.0.1', '[]', '2019-05-26 01:49:31', '2019-05-26 01:49:31'),
(1155, NULL, 1, 'system_admin/documents/folders', 'GET', '127.0.0.1', '{\"working_dir\":null,\"type\":null,\"_\":\"1558817372549\"}', '2019-05-26 01:49:33', '2019-05-26 01:49:33'),
(1156, NULL, 1, 'system_admin/documents/errors', 'GET', '127.0.0.1', '{\"working_dir\":null,\"type\":null,\"_\":\"1558817372550\"}', '2019-05-26 01:49:33', '2019-05-26 01:49:33'),
(1157, NULL, 1, 'system_admin/documents/jsonitems', 'GET', '127.0.0.1', '{\"working_dir\":null,\"type\":null,\"sort_type\":\"alphabetic\",\"_\":\"1558817372551\"}', '2019-05-26 01:49:33', '2019-05-26 01:49:33'),
(1158, NULL, 1, 'system_admin/documents/jsonitems', 'GET', '127.0.0.1', '{\"working_dir\":\"\\/photos\",\"type\":null,\"sort_type\":\"alphabetic\",\"_\":\"1558817372552\"}', '2019-05-26 01:49:45', '2019-05-26 01:49:45'),
(1159, NULL, 1, 'system_admin/documents/jsonitems', 'GET', '127.0.0.1', '{\"working_dir\":\"\\/photos\\/blogs\",\"type\":null,\"sort_type\":\"alphabetic\",\"_\":\"1558817372553\"}', '2019-05-26 01:49:47', '2019-05-26 01:49:47'),
(1160, NULL, 1, 'system_admin/auth/login', 'GET', '127.0.0.1', '[]', '2019-05-26 01:49:51', '2019-05-26 01:49:51');

-- --------------------------------------------------------

--
-- Table structure for table `admin_permissions`
--

CREATE TABLE `admin_permissions` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(11) DEFAULT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `http_method` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `http_path` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admin_permissions`
--

INSERT INTO `admin_permissions` (`id`, `company_id`, `name`, `slug`, `http_method`, `http_path`, `created_at`, `updated_at`) VALUES
(1, NULL, 'All permission', '*', '', '*', NULL, '2018-07-26 07:29:38'),
(2, NULL, 'Dashboard', 'dashboard', 'GET', '/', NULL, NULL),
(3, NULL, 'Login', 'auth.login', '', '/auth/login\r\n/auth/logout', NULL, NULL),
(4, NULL, 'User setting', 'auth.setting', 'GET,PUT,DELETE', '/auth/setting', NULL, '2018-08-25 04:19:26'),
(5, NULL, 'Auth management', 'auth.management', '', '/auth/roles\r\n/auth/permissions\r\n/auth/menu\r\n/auth/logs', NULL, NULL),
(10, NULL, 'View', 'view', 'GET', '*', '2018-09-23 11:56:03', '2019-02-09 10:41:53');

-- --------------------------------------------------------

--
-- Table structure for table `admin_roles`
--

CREATE TABLE `admin_roles` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(11) DEFAULT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admin_roles`
--

INSERT INTO `admin_roles` (`id`, `company_id`, `name`, `slug`, `created_at`, `updated_at`) VALUES
(1, NULL, 'Administrator', 'administrator', '2018-01-12 10:27:40', '2018-01-12 10:27:40'),
(2, NULL, 'Admin', 'admin', '2018-01-12 11:02:33', '2018-01-12 11:02:33'),
(3, NULL, 'User', 'user', '2018-01-12 11:03:14', '2018-01-12 11:03:14'),
(4, NULL, 'Content', 'content', '2018-01-13 01:27:11', '2018-01-13 01:27:11');

-- --------------------------------------------------------

--
-- Table structure for table `admin_role_menu`
--

CREATE TABLE `admin_role_menu` (
  `role_id` int(11) NOT NULL,
  `menu_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admin_role_menu`
--

INSERT INTO `admin_role_menu` (`role_id`, `menu_id`, `created_at`, `updated_at`) VALUES
(1, 12, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `admin_role_permissions`
--

CREATE TABLE `admin_role_permissions` (
  `role_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admin_role_permissions`
--

INSERT INTO `admin_role_permissions` (`role_id`, `permission_id`, `created_at`, `updated_at`) VALUES
(1, 1, NULL, NULL),
(3, 3, NULL, NULL),
(2, 2, NULL, NULL),
(2, 3, NULL, NULL),
(2, 4, NULL, NULL),
(4, 3, NULL, NULL),
(4, 4, NULL, NULL),
(3, 10, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `admin_role_users`
--

CREATE TABLE `admin_role_users` (
  `role_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admin_role_users`
--

INSERT INTO `admin_role_users` (`role_id`, `user_id`, `created_at`, `updated_at`) VALUES
(1, 1, NULL, NULL),
(3, 3, NULL, NULL),
(1, 4, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `admin_users`
--

CREATE TABLE `admin_users` (
  `id` int(10) UNSIGNED NOT NULL,
  `username` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `company_id` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admin_users`
--

INSERT INTO `admin_users` (`id`, `username`, `password`, `company_id`, `name`, `avatar`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'admin', '$2y$10$XisO29cFPf1fJQp1toGt7uYSy7lQMGj67ceC/x6x0JJ9Wbn7KLL7e', 1, 'Administrator', NULL, 'IF1cnL5e8PyiboYmQk82l76ZZiT9WfVGMaBNEd70qmWCOFBqg96lrxgqTRAK', '2018-01-12 10:27:40', '2019-03-31 01:59:05'),
(3, 'test', '$2y$10$Ao7Uey2z5jPFta/rZG51XuG1OZiWdlbdf3QSgsAjKn9Hfpcp14Ami', NULL, 'User', NULL, '5JS9Sgy0dX24uyOwFjR5w5rCgimd7B2Y1DLvxQgnZ2w0IJY7nNO9vqTg2AOl', '2018-01-12 11:05:28', '2018-09-23 11:56:26'),
(4, 'mahmoud', '$2y$10$ZIWhkat2JRBesEk4VrS.P.75KgmeIjvHiSi2orh5UEwRlnHcV/F9i', 2, 'mahmoud', NULL, NULL, '2019-05-02 20:23:08', '2019-05-02 20:23:08');

-- --------------------------------------------------------

--
-- Table structure for table `admin_user_permissions`
--

CREATE TABLE `admin_user_permissions` (
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admin_user_permissions`
--

INSERT INTO `admin_user_permissions` (`user_id`, `permission_id`, `created_at`, `updated_at`) VALUES
(4, 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `banner`
--

CREATE TABLE `banner` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(11) DEFAULT NULL,
  `image` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `url` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `html` text COLLATE utf8_unicode_ci,
  `status` tinyint(4) NOT NULL DEFAULT '0',
  `sort` tinyint(4) NOT NULL DEFAULT '0',
  `click` tinyint(4) NOT NULL DEFAULT '0',
  `type` tinyint(4) DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `banner`
--

INSERT INTO `banner` (`id`, `company_id`, `image`, `url`, `html`, `status`, `sort`, `click`, `type`, `created_at`, `updated_at`) VALUES
(8, NULL, 'banner/6122cfae7fdb5fff1a4e7406dcab10ef.jpg', NULL, '<h1>S-CART</h1>\r\n                  <h2>Free E-Commerce Template</h2>\r\n                  <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. </p>\r\n                  <button type=\"button\" class=\"btn btn-default get\">Get it now</button>', 1, 0, 0, 1, '2018-08-02 09:23:32', '2018-09-20 15:24:53'),
(16, NULL, 'banner/7b16dd5b838439ddbe58c3ea506f5db1.jpg', NULL, '<h1>S-CART</h1>\r\n                  <h2>Free E-Commerce Template</h2>\r\n                  <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. </p>\r\n                  <button type=\"button\" class=\"btn btn-default get\">Get it now</button>', 1, 0, 0, 1, '2018-08-21 08:09:08', '2018-09-20 15:24:43'),
(17, NULL, 'banner/36e662803f744d4f9df2cecc2e17b87b.jpg', NULL, '<h1>S-CART</h1>\r\n                  <h2>Free E-Commerce Template</h2>\r\n                  <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. </p>\r\n                  <button type=\"button\" class=\"btn btn-default get\">Get it now</button>', 1, 0, 0, 0, '2018-09-03 09:51:56', '2018-09-20 15:24:23');

-- --------------------------------------------------------

--
-- Table structure for table `companies`
--

CREATE TABLE `companies` (
  `id` int(11) NOT NULL,
  `name` varchar(250) NOT NULL,
  `activity_id` int(11) NOT NULL,
  `longitude` varchar(250) DEFAULT NULL,
  `latitude` varchar(250) DEFAULT NULL,
  `notes` varchar(300) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `companies`
--

INSERT INTO `companies` (`id`, `name`, `activity_id`, `longitude`, `latitude`, `notes`) VALUES
(1, 'dorra', 1, NULL, NULL, 'clothes'),
(2, 'highcoder', 1, NULL, NULL, 'clothes');

-- --------------------------------------------------------

--
-- Table structure for table `config`
--

CREATE TABLE `config` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(11) DEFAULT NULL,
  `type` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `code` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `key` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `value` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sort` tinyint(4) NOT NULL DEFAULT '0',
  `detail` varchar(300) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `config`
--

INSERT INTO `config` (`id`, `company_id`, `type`, `code`, `key`, `value`, `sort`, `detail`) VALUES
(10, NULL, NULL, 'config', 'shop_allow_guest', '1', 11, 'language.admin.shop_allow_guest'),
(11, NULL, NULL, 'smtp', 'smtp_host', NULL, 8, 'language.admin.smtp_host'),
(12, NULL, NULL, 'smtp', 'smtp_user', '', 7, 'language.admin.smtp_user'),
(13, NULL, NULL, 'smtp', 'smtp_password', '', 6, 'language.admin.smtp_password'),
(14, NULL, NULL, 'smtp', 'smtp_security', '', 5, 'language.admin.smtp_security'),
(15, NULL, NULL, 'smtp', 'smtp_port', '', 4, 'language.admin.smtp_port'),
(16, NULL, NULL, 'smtp', 'smtp_mode', '0', 9, 'language.admin.smtp_mode'),
(18, NULL, NULL, 'config', 'product_preorder', '1', 18, 'language.admin.product_preorder'),
(19, NULL, NULL, 'config', 'product_display_out_of_stock', '1', 19, 'language.admin.product_display_out_of_stock'),
(20, NULL, NULL, 'config', 'product_buy_out_of_stock', '1', 20, 'language.admin.product_buy_out_of_stock'),
(22, NULL, NULL, 'config', 'show_date_available', '1', 21, 'language.admin.show_date_available'),
(26, NULL, NULL, 'display', 'product_hot', '6', 0, 'language.admin.hot_product'),
(27, NULL, NULL, 'display', 'product_new', '6', 0, 'language.admin.new_product'),
(28, NULL, NULL, 'display', 'product_list', '18', 0, 'language.admin.list_product'),
(29, NULL, NULL, 'display', 'product_relation', '4', 0, 'language.admin.relation_product'),
(30, NULL, NULL, 'config', 'site_ssl', '0', 0, 'language.admin.enable_https'),
(32, NULL, NULL, 'config', 'watermark', '1', 0, 'language.admin.enable_watermark'),
(44, NULL, NULL, 'config', 'site_status', '1', 100, 'language.admin.site_status'),
(45, NULL, NULL, 'display', 'product_viewed', '4', 0, 'language.admin.viewed_product'),
(47, NULL, 'Extensions', 'Payment', 'Cash', '1', 0, 'Extensions/Payment/Cash.title'),
(48, NULL, 'Extensions', 'Shipping', 'ShippingStandard', '1', 0, 'Shipping Standard'),
(55, NULL, 'Extensions', 'Total', 'Discount', '1', 0, 'Extensions/Total/Discount.title'),
(64, NULL, 'Modules', 'Other', 'LastViewProduct', '1', 0, 'Modules/Other/LastViewProduct.title'),
(65, NULL, NULL, 'display', 'item_list', '12', 0, 'language.admin.item_list'),
(66, NULL, NULL, 'config', 'show_product_of_category_children', '1', 21, 'language.admin.show_product_of_category_children'),
(67, NULL, 'Extensions', 'Shipping', 'ShippingBasic', '1', 0, 'Extensions/Shipping/ShippingBasic.title');

-- --------------------------------------------------------

--
-- Table structure for table `config_global`
--

CREATE TABLE `config_global` (
  `id` int(11) NOT NULL,
  `company_id` int(11) DEFAULT NULL,
  `logo` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `watermark` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `template` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `long_phone` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `time_active` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address` varchar(300) COLLATE utf8_unicode_ci DEFAULT NULL,
  `locale` varchar(300) COLLATE utf8_unicode_ci DEFAULT NULL,
  `currency` varchar(300) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `config_global`
--

INSERT INTO `config_global` (`id`, `company_id`, `logo`, `watermark`, `template`, `phone`, `long_phone`, `email`, `time_active`, `address`, `locale`, `currency`) VALUES
(1, 1, 'images/highcoder.png', 'images/watermark.png', 'default', '0123456789', 'Support: 0987654321', 'admin@admin.com', NULL, '123st - abc - xyz', 'ar', 'EGP');

-- --------------------------------------------------------

--
-- Table structure for table `config_global_description`
--

CREATE TABLE `config_global_description` (
  `config_id` int(11) NOT NULL,
  `lang_id` tinyint(4) NOT NULL,
  `title` text COLLATE utf8mb4_unicode_ci,
  `description` text COLLATE utf8mb4_unicode_ci,
  `keyword` text COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `config_global_description`
--

INSERT INTO `config_global_description` (`config_id`, `lang_id`, `title`, `description`, `keyword`) VALUES
(1, 1, 'souqVIS', 'easy to sell and buy', NULL),
(1, 2, 'souqVIS', 'easy to sell', NULL),
(1, 3, 'Souq', NULL, 'ar');

-- --------------------------------------------------------

--
-- Table structure for table `language`
--

CREATE TABLE `language` (
  `id` int(11) NOT NULL,
  `company_id` int(11) DEFAULT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `code` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `direction` enum('RTL','LTR') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'LTR',
  `icon` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '1',
  `sort` tinyint(4) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `language`
--

INSERT INTO `language` (`id`, `company_id`, `name`, `code`, `direction`, `icon`, `status`, `sort`) VALUES
(1, 1, 'arabic', 'ar', 'RTL', 'language/QA.PNG', 1, 2),
(2, 1, 'English', 'en', 'LTR', 'language/flag_uk.png', 1, 1),
(3, NULL, 'Tiếng Việt', 'vi', 'LTR', 'language/flag_vn.png', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `layout`
--

CREATE TABLE `layout` (
  `id` int(11) NOT NULL,
  `company_id` int(11) DEFAULT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `position` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `page` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `type` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `text` text COLLATE utf8_unicode_ci,
  `status` tinyint(4) NOT NULL DEFAULT '0',
  `sort` tinyint(4) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `layout`
--

INSERT INTO `layout` (`id`, `company_id`, `name`, `position`, `page`, `type`, `text`, `status`, `sort`) VALUES
(1, NULL, 'Facebook code', 'top', '', 'html', '<div id=\"fb-root\"></div>\r\n<script>(function(d, s, id) {\r\n  var js, fjs = d.getElementsByTagName(s)[0];\r\n  if (d.getElementById(id)) return;\r\n  js = d.createElement(s); js.id = id;\r\n  js.src = \'//connect.facebook.net/vi_VN/sdk.js#xfbml=1&version=v2.8&appId=934208239994473\';\r\n  fjs.parentNode.insertBefore(js, fjs);\r\n}(document, \'script\', \'facebook-jssdk\'));\r\n</script>', 1, 0),
(2, NULL, 'Google Analytics', 'header', '', 'html', '<!-- Global site tag (gtag.js) - Google Analytics -->\r\n<script async src=\"https://www.googletagmanager.com/gtag/js?id=UA-128658138-1\"></script>\r\n<script>\r\n  window.dataLayer = window.dataLayer || [];\r\n  function gtag(){dataLayer.push(arguments);}\r\n  gtag(\'js\', new Date());\r\n\r\n  gtag(\'config\', \'UA-128658138-1\');\r\n</script>', 1, 0),
(4, NULL, 'Product last view', 'left', '', 'module', '\\App\\Modules\\Other\\Controllers\\LastViewProduct', 1, 0),
(5, NULL, 'Product special', 'left', 'home,product_list', 'view', 'product_special', 1, 1),
(6, NULL, 'Brands', 'left', 'home,item_list', 'view', 'brands_left', 1, 3),
(7, NULL, 'Banner home', 'banner_top', 'home', 'view', 'banner_image', 1, 0),
(8, NULL, 'Categories', 'left', 'home,product_list,product_detail,shop_wishlist', 'view', 'categories', 1, 4);

-- --------------------------------------------------------

--
-- Table structure for table `layout_page`
--

CREATE TABLE `layout_page` (
  `id` int(11) NOT NULL,
  `uniquekey` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `layout_page`
--

INSERT INTO `layout_page` (`id`, `uniquekey`, `name`) VALUES
(1, 'home', 'Home page'),
(2, 'product_list', 'Product list'),
(3, 'product_detail', 'Product detail'),
(4, 'shop_cart', 'Shop cart'),
(5, 'shop_account', 'Account'),
(6, 'shop_profile', 'Profile'),
(7, 'shop_compare', 'Compare page'),
(8, 'shop_wishlist', 'Wishlist page'),
(9, 'item_list', 'Item list');

-- --------------------------------------------------------

--
-- Table structure for table `layout_position`
--

CREATE TABLE `layout_position` (
  `id` int(11) NOT NULL,
  `uniquekey` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `layout_position`
--

INSERT INTO `layout_position` (`id`, `uniquekey`, `name`) VALUES
(1, 'meta', 'Meta'),
(2, 'header', 'Header'),
(3, 'top', 'Top'),
(4, 'bottom', 'Bottom'),
(5, 'footer', 'Footer'),
(6, 'left', 'Column left'),
(7, 'right', 'Column right'),
(8, 'banner_top', 'Banner top');

-- --------------------------------------------------------

--
-- Table structure for table `layout_type`
--

CREATE TABLE `layout_type` (
  `id` int(11) NOT NULL,
  `uniquekey` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `layout_type`
--

INSERT INTO `layout_type` (`id`, `uniquekey`, `name`) VALUES
(1, 'html', 'Html'),
(2, 'view', 'View'),
(4, 'module', 'Module');

-- --------------------------------------------------------

--
-- Table structure for table `layout_url`
--

CREATE TABLE `layout_url` (
  `id` int(11) NOT NULL,
  `company_id` int(11) DEFAULT NULL,
  `name` varchar(100) NOT NULL,
  `url` varchar(100) NOT NULL,
  `target` varchar(50) NOT NULL,
  `group` varchar(50) NOT NULL,
  `module` varchar(50) DEFAULT NULL,
  `status` tinyint(4) DEFAULT '1',
  `sort` tinyint(4) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `layout_url`
--

INSERT INTO `layout_url` (`id`, `company_id`, `name`, `url`, `target`, `group`, `module`, `status`, `sort`) VALUES
(1, 1, 'language.contact', '/contact.html', '_self', 'menu', NULL, 1, 3),
(2, NULL, 'language.about', '/about.html', '_self', 'menu', NULL, 1, 4),
(3, NULL, 'S-Cart', 'https://s-cart.org', '_blank', 'menu', NULL, 1, 0),
(4, NULL, 'language.my_profile', '/member/login.html', '_self', 'footer', NULL, 1, 5),
(5, NULL, 'language.compare_page', '/compare.html', '_self', 'footer', NULL, 1, 4),
(6, NULL, 'language.wishlist_page', '/wishlist.html', '_self', 'footer', NULL, 1, 3);

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `shipping_standard`
--

CREATE TABLE `shipping_standard` (
  `id` int(10) UNSIGNED NOT NULL,
  `fee` int(11) NOT NULL,
  `shipping_free` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `shipping_standard`
--

INSERT INTO `shipping_standard` (`id`, `fee`, `shipping_free`) VALUES
(1, 20000, 100000);

-- --------------------------------------------------------

--
-- Table structure for table `shop_api`
--

CREATE TABLE `shop_api` (
  `id` int(11) NOT NULL,
  `company_id` int(11) DEFAULT NULL,
  `name` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `hidden_default` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `type` varchar(50) COLLATE utf8_unicode_ci NOT NULL COMMENT 'private - secret - public'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `shop_api`
--

INSERT INTO `shop_api` (`id`, `company_id`, `name`, `hidden_default`, `type`) VALUES
(1, 1, 'api_product_list', NULL, 'secret'),
(2, 1, 'api_product_detail', 'cost,sold,stock,sort', 'private'),
(3, 1, 'api_order_list', '', 'public'),
(4, 1, 'api_order_detail', '', 'secret');

-- --------------------------------------------------------

--
-- Table structure for table `shop_api_process`
--

CREATE TABLE `shop_api_process` (
  `id` int(11) NOT NULL,
  `api_id` int(11) NOT NULL DEFAULT '0',
  `secret_key` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `hidden_fileds` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ip_allow` text COLLATE utf8_unicode_ci,
  `ip_deny` text COLLATE utf8_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `exp` timestamp NULL DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `shop_api_process`
--

INSERT INTO `shop_api_process` (`id`, `api_id`, `secret_key`, `hidden_fileds`, `ip_allow`, `ip_deny`, `created_at`, `updated_at`, `exp`, `status`) VALUES
(1, 1, '!CVCBsd$6j9ds3%flh[^d', 'descriptions,cost', '', '127.0.0.11,1233.2.2.3', '2018-12-16 07:13:16', '2018-12-16 07:17:33', '2019-12-14 09:20:33', 1),
(4, 1, '%GSFf13gkLtP@d', 'descriptions,brand_id', NULL, NULL, '2018-12-16 07:13:16', '2018-12-16 07:13:16', NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `shop_attribute_detail`
--

CREATE TABLE `shop_attribute_detail` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `attribute_id` tinyint(4) NOT NULL,
  `product_id` int(11) NOT NULL,
  `sort` tinyint(4) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `shop_attribute_detail`
--

INSERT INTO `shop_attribute_detail` (`id`, `name`, `attribute_id`, `product_id`, `sort`) VALUES
(5, 'Blue', 1, 48, 0),
(6, 'White', 1, 48, 0),
(7, 'S', 2, 48, 0),
(8, 'XL', 2, 48, 0),
(9, 'Blue', 1, 49, 0),
(10, 'Red', 1, 49, 0),
(11, 'S', 2, 49, 0),
(12, 'M', 2, 49, 0);

-- --------------------------------------------------------

--
-- Table structure for table `shop_attribute_group`
--

CREATE TABLE `shop_attribute_group` (
  `id` int(11) NOT NULL,
  `company_id` int(11) DEFAULT NULL,
  `name` varchar(100) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '0',
  `sort` tinyint(4) NOT NULL DEFAULT '0',
  `type` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `shop_attribute_group`
--

INSERT INTO `shop_attribute_group` (`id`, `company_id`, `name`, `status`, `sort`, `type`) VALUES
(1, NULL, 'Color', 1, 1, 'radio'),
(2, NULL, 'Size', 1, 2, 'select'),
(3, 1, 'دهبي', 1, 1, 'radio');

-- --------------------------------------------------------

--
-- Table structure for table `shop_brand`
--

CREATE TABLE `shop_brand` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(11) DEFAULT NULL,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `image` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `url` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '0',
  `sort` tinyint(4) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `shop_brand`
--

INSERT INTO `shop_brand` (`id`, `company_id`, `name`, `image`, `url`, `status`, `sort`) VALUES
(1, NULL, 'Husq', 'brand/1ca28f797c0f2edb635c4b51c2e7e952.png', NULL, 1, 0),
(2, NULL, 'Ideal', 'brand/0a778de7e1e2f2a0635d6a1727e3de8d.png', NULL, 1, 0),
(3, 1, 'Apex', 'brand/d3abfcfc8c0fef7e1356fc637ab9d8d8.png', NULL, 1, 0),
(4, NULL, 'CST', 'brand/185c50c85b83644e02e8b96639370341.png', NULL, 1, 0),
(5, NULL, 'Klein', 'brand/3e11cc022e9f30774ab5f6a0c6c36451.png', NULL, 1, 0),
(6, NULL, 'Metabo', 'brand/7868b0924b8f115aef70292aea1a67b8.png', NULL, 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `shop_category`
--

CREATE TABLE `shop_category` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(11) DEFAULT NULL,
  `image` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `parent` int(11) NOT NULL DEFAULT '0',
  `top` int(11) DEFAULT '0',
  `sort` tinyint(4) NOT NULL DEFAULT '0',
  `status` tinyint(4) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `shop_category`
--

INSERT INTO `shop_category` (`id`, `company_id`, `image`, `parent`, `top`, `sort`, `status`) VALUES
(1, 1, NULL, 0, 1, 0, 1),
(2, NULL, '', 0, 1, 0, 1),
(3, NULL, '', 0, 1, 0, 1),
(4, NULL, '', 0, 1, 0, 1),
(5, NULL, '', 0, 1, 0, 1),
(6, NULL, '', 9, 0, 0, 1),
(7, NULL, '', 4, 0, 0, 1),
(8, NULL, '', 4, 0, 0, 1),
(9, NULL, '', 0, 1, 0, 1),
(10, NULL, '', 2, 0, 0, 1),
(11, NULL, '', 1, 0, 0, 1),
(12, NULL, '', 1, 0, 3, 1),
(13, NULL, '', 9, 0, 2, 1),
(14, NULL, '', 4, 0, 0, 1),
(15, NULL, '', 5, 0, 0, 1),
(16, NULL, '', 2, 0, 0, 1),
(17, NULL, '', 3, 0, 0, 1),
(18, NULL, '', 3, 0, 0, 1),
(19, 1, 'category/a08b2175a89edfb4ed2147a633351c58.PNG', 0, 0, 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `shop_category_description`
--

CREATE TABLE `shop_category_description` (
  `shop_category_id` int(11) NOT NULL,
  `company_id` int(11) DEFAULT NULL,
  `lang_id` int(11) NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `keyword` varchar(300) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `shop_category_description`
--

INSERT INTO `shop_category_description` (`shop_category_id`, `company_id`, `lang_id`, `name`, `keyword`, `description`) VALUES
(1, NULL, 1, 'SPORTSWEAR', NULL, NULL),
(1, NULL, 2, 'Danh mục SPORTSWEAR', NULL, NULL),
(2, NULL, 1, 'MENS', NULL, NULL),
(2, NULL, 2, 'Danh mục MENS', NULL, NULL),
(3, NULL, 1, 'WOMENS', NULL, NULL),
(3, NULL, 2, 'Danh mục WOMENS', NULL, NULL),
(4, NULL, 1, 'KIDS', NULL, NULL),
(4, NULL, 2, 'Danh mục KIDS', NULL, NULL),
(5, NULL, 1, 'FASHION', NULL, NULL),
(5, NULL, 2, 'Danh mục FASHION', NULL, NULL),
(6, NULL, 1, 'GUESS', NULL, NULL),
(6, NULL, 2, 'Danh mục GUESS', NULL, NULL),
(7, NULL, 1, 'PUMA', NULL, NULL),
(7, NULL, 2, 'Danh mục PUMA', NULL, NULL),
(8, NULL, 1, 'ASICS', NULL, NULL),
(8, NULL, 2, 'Danh mục ASICS', NULL, NULL),
(9, NULL, 1, 'HOUSEHOLDS', NULL, NULL),
(9, NULL, 2, 'Danh mục HOUSEHOLDS', NULL, NULL),
(10, NULL, 1, 'VALENTINO', NULL, NULL),
(10, NULL, 2, 'Danh mục VALENTINO', NULL, NULL),
(11, NULL, 1, 'DIOR', NULL, NULL),
(11, NULL, 2, 'Danh mục DIOR', NULL, NULL),
(12, NULL, 1, 'VALENTINO', NULL, NULL),
(12, NULL, 2, 'Danh mục VALENTINO', NULL, NULL),
(13, NULL, 1, 'DIOR', NULL, NULL),
(13, NULL, 2, 'Danh mục DIOR', NULL, NULL),
(14, NULL, 1, 'FENDI', NULL, NULL),
(14, NULL, 2, 'Danh mục FENDI', NULL, NULL),
(15, NULL, 1, 'FENDI', NULL, NULL),
(15, NULL, 2, 'Danh mục  FENDI', NULL, NULL),
(16, NULL, 1, 'NIKE', NULL, NULL),
(16, NULL, 2, 'Danh mục NIKE', NULL, NULL),
(17, NULL, 1, 'UNDER ARMOUR', NULL, NULL),
(17, NULL, 2, 'Danh mục UNDER ARMOUR', NULL, NULL),
(18, NULL, 1, 'ADIDAS', NULL, NULL),
(18, NULL, 2, 'Danh mục ADIDAS', NULL, NULL),
(19, NULL, 1, 'cat1', 'cat1 keyword', 'cat1 description');

-- --------------------------------------------------------

--
-- Table structure for table `shop_currency`
--

CREATE TABLE `shop_currency` (
  `id` int(11) NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `company_id` int(11) DEFAULT NULL,
  `code` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `symbol` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `exchange_rate` float NOT NULL,
  `precision` tinyint(1) NOT NULL DEFAULT '2',
  `symbol_first` tinyint(4) NOT NULL DEFAULT '0',
  `thousands` varchar(2) COLLATE utf8_unicode_ci NOT NULL DEFAULT ',',
  `status` tinyint(4) NOT NULL DEFAULT '0',
  `sort` tinyint(4) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `shop_currency`
--

INSERT INTO `shop_currency` (`id`, `name`, `company_id`, `code`, `symbol`, `exchange_rate`, `precision`, `symbol_first`, `thousands`, `status`, `sort`) VALUES
(1, 'EGP pound', 1, 'EGP', 'P', 1, 0, 1, ',', 1, 0),
(2, 'VietNam Dong', NULL, 'VND', '₫', 20, 0, 0, ',', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `shop_discount`
--

CREATE TABLE `shop_discount` (
  `id` int(10) UNSIGNED NOT NULL,
  `code` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `company_id` int(11) DEFAULT NULL,
  `reward` int(11) NOT NULL DEFAULT '0',
  `type` tinyint(4) NOT NULL DEFAULT '0',
  `data` text COLLATE utf8mb4_unicode_ci,
  `number_uses` int(11) NOT NULL DEFAULT '1',
  `used` int(11) NOT NULL DEFAULT '0',
  `status` tinyint(4) NOT NULL DEFAULT '1',
  `login` int(11) NOT NULL DEFAULT '0',
  `expires_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `shop_discount`
--

INSERT INTO `shop_discount` (`id`, `code`, `company_id`, `reward`, `type`, `data`, `number_uses`, `used`, `status`, `login`, `expires_at`) VALUES
(1, 'TEST', NULL, 10, 0, NULL, 10, 0, 1, 0, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `shop_discount_user`
--

CREATE TABLE `shop_discount_user` (
  `user_id` int(11) NOT NULL,
  `discount_id` int(11) NOT NULL,
  `log` text COLLATE utf8mb4_unicode_ci,
  `used_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `shop_order`
--

CREATE TABLE `shop_order` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `subtotal` int(11) DEFAULT '0',
  `shipping` int(11) DEFAULT '0',
  `discount` int(11) DEFAULT '0',
  `payment_status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0-not send 1-pp send 2-sent',
  `shipping_status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0-notship 1-sending 2-pp send 3-shipped',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0-new 1-processing 2-hold 3-cancel 4-Completed',
  `tax` tinyint(4) DEFAULT '0' COMMENT '%',
  `total` int(11) DEFAULT '0',
  `currency` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `exchange_rate` float DEFAULT NULL,
  `received` int(11) DEFAULT '0',
  `balance` int(11) DEFAULT '0',
  `toname` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `address1` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `address2` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `country` int(3) DEFAULT NULL,
  `phone` char(50) COLLATE utf8_unicode_ci NOT NULL,
  `email` char(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `comment` varchar(300) COLLATE utf8_unicode_ci DEFAULT NULL,
  `payment_method` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `transaction` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `shop_order`
--

INSERT INTO `shop_order` (`id`, `company_id`, `user_id`, `subtotal`, `shipping`, `discount`, `payment_status`, `shipping_status`, `status`, `tax`, `total`, `currency`, `exchange_rate`, `received`, `balance`, `toname`, `address1`, `address2`, `country`, `phone`, `email`, `comment`, `payment_method`, `transaction`, `created_at`, `updated_at`) VALUES
(1, 1, 0, 400000, 0, 0, 0, 1, 1, 0, 400000, 'USD', 1, 0, 400000, 'mahmod', 'caru egt', 'j', NULL, '01142931228', 'ms_ms25490@yahoo.com', NULL, 'Cash', NULL, '2019-04-17 04:15:47', '2019-05-09 02:17:09'),
(3, 2, 0, 5210000, 0, 0, 0, 0, 1, 0, 5210000, 'USD', 1, 0, 5210000, 'max', 'caru egt', 'address2', NULL, '01142931228', 'ms_ms20@yahoo.com', NULL, 'Cash', NULL, '2019-04-20 02:53:58', '2019-05-20 03:22:14'),
(4, 1, 1, 200, 0, 0, 0, 0, 1, 0, 200, 'EGP', 1, 0, 200, 'mahmoud', 'caru egt', NULL, NULL, '1142931228_', 'ms_ms25490@yahoo.com', NULL, NULL, NULL, '2019-05-08 01:43:09', '2019-05-09 02:00:07');

-- --------------------------------------------------------

--
-- Table structure for table `shop_order_detail`
--

CREATE TABLE `shop_order_detail` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(11) DEFAULT NULL,
  `order_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `product_id` int(11) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `price` int(11) DEFAULT '0' COMMENT 'Price: price of product or type',
  `qty` int(11) DEFAULT '0',
  `total_price` int(11) DEFAULT '0',
  `sku` varchar(25) COLLATE utf8_unicode_ci DEFAULT NULL,
  `type` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Attributes',
  `currency` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `exchange_rate` float DEFAULT NULL,
  `attribute` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Attributes',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `shop_order_detail`
--

INSERT INTO `shop_order_detail` (`id`, `company_id`, `order_id`, `product_id`, `name`, `price`, `qty`, `total_price`, `sku`, `type`, `currency`, `exchange_rate`, `attribute`, `created_at`, `updated_at`) VALUES
(1, NULL, 1, 3, 'Easy Polo Black Edition 3', 200000, 2, 400000, 'MEGA2560', NULL, NULL, NULL, NULL, '2019-04-17 04:15:47', NULL),
(2, NULL, 3, 11, 'Easy Polo Black Edition 11', 4990000, 1, 4990000, 'ANYCUBIC-P', NULL, NULL, NULL, NULL, '2019-04-20 02:53:58', NULL),
(3, NULL, 4, 50, 'prod1', 200, 1, 200, 'prod1', NULL, NULL, NULL, NULL, NULL, NULL),
(4, NULL, 3, 3, '', 220000, 1, 220000, 'MEGA2560', NULL, NULL, NULL, 'xc', NULL, '2019-05-20 03:22:32');

-- --------------------------------------------------------

--
-- Table structure for table `shop_order_history`
--

CREATE TABLE `shop_order_history` (
  `id` int(11) NOT NULL,
  `company_id` int(11) DEFAULT NULL,
  `order_id` int(11) NOT NULL DEFAULT '0',
  `content` text COLLATE utf8_unicode_ci NOT NULL,
  `admin_id` int(11) NOT NULL DEFAULT '0',
  `user_id` int(11) NOT NULL DEFAULT '0',
  `add_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `shop_order_history`
--

INSERT INTO `shop_order_history` (`id`, `company_id`, `order_id`, `content`, `admin_id`, `user_id`, `add_date`) VALUES
(1, NULL, 1, 'New order', 0, 0, '2019-04-17 04:15:47'),
(2, NULL, 3, 'New order', 0, 0, '2019-04-20 02:53:58'),
(3, NULL, 3, 'Change <b>status</b> from <span style=\"color:blue\">\'0\'</span> to <span style=\"color:red\">\'1\'</span>', 1, 0, '2019-04-26 01:51:31'),
(4, NULL, 4, 'Change <b>status</b> from <span style=\"color:blue\">\'6\'</span> to <span style=\"color:red\">\'7\'</span>', 1, 0, '2019-05-08 02:21:25'),
(5, NULL, 4, 'Change <b>status</b> from <span style=\"color:blue\">\'7\'</span> to <span style=\"color:red\">\'2\'</span>', 1, 0, '2019-05-08 02:22:45'),
(6, NULL, 4, 'Add product prod1', 1, 0, '2019-05-08 02:47:00'),
(7, NULL, 4, 'Change <b>status</b> from <span style=\"color:blue\">\'2\'</span> to <span style=\"color:red\">\'6\'</span>', 1, 0, '2019-05-09 01:58:14'),
(8, NULL, 1, 'Change <b>status</b> from <span style=\"color:blue\">\'0\'</span> to <span style=\"color:red\">\'1\'</span>', 1, 0, '2019-05-09 01:58:47'),
(9, NULL, 4, 'Change <b>status</b> from <span style=\"color:blue\">\'6\'</span> to <span style=\"color:red\">\'7\'</span>', 1, 0, '2019-05-09 01:59:16'),
(10, NULL, 4, 'Change <b>status</b> from <span style=\"color:blue\">\'7\'</span> to <span style=\"color:red\">\'9\'</span>', 1, 0, '2019-05-09 02:00:07'),
(11, NULL, 1, 'Change <b>shipping_status</b> from <span style=\"color:blue\">\'0\'</span> to <span style=\"color:red\">\'1\'</span>', 1, 0, '2019-05-09 02:17:09'),
(12, NULL, 3, 'Add product ', 1, 0, '2019-05-20 03:22:14'),
(13, NULL, 3, 'Edit product #4: Data {\"qty\":\"1\",\"price\":\"220000\",\"name\":\"\",\"total_price\":220000,\"attribute\":\"xc\"}', 1, 0, '2019-05-20 03:22:32');

-- --------------------------------------------------------

--
-- Table structure for table `shop_order_status`
--

CREATE TABLE `shop_order_status` (
  `id` int(11) NOT NULL,
  `company_id` int(11) NOT NULL,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `shop_order_status`
--

INSERT INTO `shop_order_status` (`id`, `company_id`, `name`) VALUES
(0, 1, 'New'),
(1, 1, 'Processing'),
(2, 1, 'Hold'),
(3, 1, 'Canceled'),
(4, 1, 'Done'),
(5, 1, 'Failed');

-- --------------------------------------------------------

--
-- Table structure for table `shop_order_total`
--

CREATE TABLE `shop_order_total` (
  `id` int(11) NOT NULL,
  `company_id` int(11) DEFAULT NULL,
  `order_id` int(11) NOT NULL,
  `title` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `code` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `value` int(11) NOT NULL,
  `text` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sort` int(11) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `shop_order_total`
--

INSERT INTO `shop_order_total` (`id`, `company_id`, `order_id`, `title`, `code`, `value`, `text`, `sort`, `created_at`, `updated_at`) VALUES
(1, 0, 1, 'Sub Total', 'subtotal', 400000, '$400,000', 1, '2019-04-17 04:15:47', NULL),
(2, 0, 1, 'Shipping Standard', 'shipping', 0, '$0', 10, '2019-04-17 04:15:47', NULL),
(3, 0, 1, 'Discount', 'discount', 0, '$0', 20, '2019-04-17 04:15:47', NULL),
(4, 0, 1, 'Total', 'total', 400000, '$400,000', 100, '2019-04-17 04:15:47', NULL),
(5, 0, 1, 'Received', 'received', 0, '$0', 200, '2019-04-17 04:15:47', NULL),
(6, NULL, 3, 'Sub Total', 'subtotal', 5210000, '4,990,000', 1, '2019-04-20 02:53:58', '2019-05-20 03:22:15'),
(7, NULL, 3, 'Shipping Standard', 'shipping', 0, '0', 10, '2019-04-20 02:53:58', NULL),
(8, NULL, 3, 'Discount', 'discount', 0, '0', 20, '2019-04-20 02:53:58', NULL),
(9, NULL, 3, 'Total', 'total', 5210000, '4,990,000', 100, '2019-04-20 02:53:58', '2019-05-20 03:22:15'),
(10, NULL, 3, 'Received', 'received', 0, '0', 200, '2019-04-20 02:53:58', NULL),
(11, NULL, 4, 'Subtotal', 'subtotal', 200, NULL, 1, NULL, '2019-05-08 02:47:00'),
(12, NULL, 4, 'Shipping', 'shipping', 0, NULL, 10, NULL, NULL),
(13, NULL, 4, 'Discount', 'discount', 0, NULL, 20, NULL, NULL),
(14, NULL, 4, 'Total', 'total', 200, NULL, 100, NULL, '2019-05-08 02:47:00'),
(15, NULL, 4, 'Received', 'received', 0, NULL, 200, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `shop_page`
--

CREATE TABLE `shop_page` (
  `id` int(11) NOT NULL,
  `company_id` int(11) DEFAULT NULL,
  `image` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `uniquekey` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `status` tinyint(3) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `shop_page`
--

INSERT INTO `shop_page` (`id`, `company_id`, `image`, `uniquekey`, `status`) VALUES
(1, NULL, '', 'about', 1),
(2, NULL, NULL, 'contact', 1);

-- --------------------------------------------------------

--
-- Table structure for table `shop_page_description`
--

CREATE TABLE `shop_page_description` (
  `page_id` int(11) NOT NULL,
  `lang_id` int(11) NOT NULL,
  `title` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `keyword` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `content` text COLLATE utf8_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `shop_page_description`
--

INSERT INTO `shop_page_description` (`page_id`, `lang_id`, `title`, `keyword`, `description`, `content`) VALUES
(1, 1, 'About', NULL, NULL, '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<img alt=\"\" src=\"/documents/photos/blogs/16d9_star_trek_tng_uniform_tee.jpeg\" style=\"width: 262px; height: 262px; float: right; margin: 10px;\" /></p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>'),
(1, 2, 'Giới thiệu', NULL, NULL, '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<img alt=\"\" src=\"/documents/photos/blogs/16d9_star_trek_tng_uniform_tee.jpeg\" style=\"width: 262px; height: 262px; float: right; margin: 10px;\" /></p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>'),
(2, 1, 'Contact', '', NULL, 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. <br>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.'),
(2, 2, 'Liên hệ với chúng tôi', '', NULL, 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. <br>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.');

-- --------------------------------------------------------

--
-- Table structure for table `shop_payment_status`
--

CREATE TABLE `shop_payment_status` (
  `id` int(11) NOT NULL,
  `company_id` int(11) DEFAULT NULL,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `shop_payment_status`
--

INSERT INTO `shop_payment_status` (`id`, `company_id`, `name`) VALUES
(0, 1, 'Unpaid'),
(1, 1, 'Partial payment'),
(2, 1, 'Paid'),
(3, 1, 'Refurn');

-- --------------------------------------------------------

--
-- Table structure for table `shop_product`
--

CREATE TABLE `shop_product` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(11) DEFAULT NULL,
  `sku` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `image` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `brand_id` int(10) UNSIGNED DEFAULT '0',
  `vendor_id` int(10) UNSIGNED DEFAULT '0',
  `category_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `category_other` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `price` int(11) NOT NULL,
  `cost` int(11) DEFAULT '0',
  `stock` int(11) NOT NULL DEFAULT '0',
  `sold` int(11) NOT NULL DEFAULT '0',
  `type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0-Nomal 1-New 2-Hot',
  `option` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sort` tinyint(4) NOT NULL DEFAULT '0',
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '0- inactive 1-active ',
  `view` int(11) DEFAULT '0',
  `date_lastview` timestamp NULL DEFAULT NULL,
  `date_available` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `shop_product`
--

INSERT INTO `shop_product` (`id`, `company_id`, `sku`, `image`, `brand_id`, `vendor_id`, `category_id`, `category_other`, `price`, `cost`, `stock`, `sold`, `type`, `option`, `sort`, `status`, `view`, `date_lastview`, `date_available`, `created_at`, `updated_at`) VALUES
(3, 1, 'MEGA2560', 'product/f2d9505d28f1b10f949cec466cada01e.jpeg', 1, 1, 7, NULL, 220000, 150000, 98, 2, 0, NULL, 0, 1, 148, '2019-03-30 13:40:10', NULL, '2018-01-15 07:57:31', '2019-04-17 04:15:47'),
(4, NULL, 'LEDFAN1', 'product/95349d3747fdaf79d391fdc98e083701.jpg', 1, 1, 6, NULL, 190000, 100000, 99, 1, 1, NULL, 0, 1, 120, '2019-03-30 21:16:55', NULL, '2018-01-16 06:03:54', '2019-03-30 21:16:55'),
(5, NULL, 'CLOCKFAN1', 'product/15aa6b1f31b53a0177d7653761a45274.jpeg', 1, 1, 13, NULL, 420000, 320000, 100, 0, 1, NULL, 0, 1, 140, '2019-03-29 08:44:45', NULL, '2018-01-16 06:04:41', '2019-03-29 08:44:45'),
(6, NULL, 'CLOCKFAN2', 'product/0e1416d509af3712bd801404ca928702.jpeg', 1, 1, 13, NULL, 380000, 250000, 97, 3, 1, NULL, 0, 1, 182, '2019-03-30 21:53:34', NULL, '2018-02-02 07:52:50', '2019-03-30 21:53:34'),
(7, NULL, 'CLOCKFAN3', 'product/95349d3747fdaf79d391fdc98e083701.jpg', 1, 1, 13, NULL, 320000, 250000, 99, 1, 1, NULL, 1, 1, 136, '2019-03-30 20:01:30', NULL, '2018-02-02 07:53:30', '2019-03-30 20:01:30'),
(8, NULL, 'TMC2208', 'product/95349d3747fdaf79d391fdc98e083701.jpg', 1, 1, 11, NULL, 220000, 130000, 100, 0, 0, NULL, 1, 1, 161, '2019-03-29 20:59:27', NULL, '2018-02-02 07:53:30', '2019-03-29 20:59:27'),
(9, NULL, 'FILAMENT', 'product/95349d3747fdaf79d391fdc98e083701.jpg', 1, 1, 15, NULL, 299000, 200000, 99, 1, 1, NULL, 1, 1, 190, '2019-03-25 10:34:42', NULL, '2018-02-02 07:53:30', '2019-03-25 10:34:42'),
(10, NULL, 'A4988', 'product/820283598735f98a9b23960821da438b.jpeg', 2, 1, 11, NULL, 39000, 20000, 100, 0, 0, NULL, 1, 1, 88, '2019-03-23 13:37:07', NULL, '2018-02-02 07:53:30', '2019-03-23 13:37:07'),
(11, NULL, 'ANYCUBIC-P', 'product/d63af407fa92299e163696a585566dc7.jpeg', 2, 1, 10, NULL, 4990000, 3500000, 99, 1, 0, NULL, 0, 1, 130, '2019-03-30 07:35:13', NULL, '2018-01-15 07:57:31', '2019-04-20 02:53:58'),
(12, NULL, '3DHLFD', 'product/95349d3747fdaf79d391fdc98e083701.jpg', 2, 1, 12, NULL, 7990000, 5200000, 100, 0, 1, NULL, 0, 1, 123, '2019-04-26 01:41:06', NULL, '2018-01-15 07:57:31', '2019-04-26 01:41:06'),
(20, NULL, 'SS495A', 'product/95349d3747fdaf79d391fdc98e083701.jpg', 3, 1, 14, NULL, 15000, 7000, 100, 0, 1, NULL, 0, 1, 169, '2019-03-30 10:48:54', NULL, '2018-01-15 07:57:31', '2019-03-30 10:48:54'),
(21, NULL, '3D-CARBON1.75', 'product/d05966a529efdd8d7b41ed9b687859b6.jpeg', 3, 1, 15, NULL, 390000, 15000, 100, 0, 1, NULL, 1, 1, 147, '2019-03-31 01:34:44', NULL, '2018-02-02 07:53:30', '2019-03-31 01:34:44'),
(22, NULL, '3D-GOLD1.75', 'product/eedfd153bf368919a134da17f22c8de7.jpeg', 3, 1, 15, NULL, 500000, 15000, 100, 0, 1, NULL, 1, 1, 192, '2019-03-30 15:41:07', NULL, '2018-04-12 08:05:37', '2019-03-30 15:41:07'),
(23, NULL, 'LCD12864-3D', 'product/a7a315526ecf7594731448d792714a11.jpeg', 3, 1, 11, NULL, 220000, 15000, 100, 0, 0, NULL, 0, 1, 72, '2019-03-30 07:03:19', NULL, '2018-08-11 06:33:37', '2019-03-30 07:03:19'),
(24, NULL, 'LCD2004-3D', 'product/9215506044b8a350fc082f5350b3653a.jpg', 3, 1, 11, NULL, 190000, 15000, 100, 0, 0, NULL, 0, 1, 93, '2019-03-30 07:03:13', NULL, '2018-08-11 06:39:31', '2019-03-30 07:03:13'),
(25, NULL, 'RAMPS1.5-3D', 'product/1d6cdd4473603c7a4d162067713b8da8.jpg', 3, 1, 11, NULL, 120000, 15000, 100, 0, 0, NULL, 0, 1, 93, '2019-03-30 07:02:12', NULL, '2018-08-11 06:41:25', '2019-03-30 07:02:12'),
(26, NULL, 'EFULL-3D', 'product/07e79f6546499878cba383dd5bfe977e.jpeg', 3, 1, 11, NULL, 890000, 15000, 100, 0, 0, NULL, 0, 1, 77, '2019-03-30 18:12:24', NULL, '2018-08-11 06:50:25', '2019-03-30 18:12:24'),
(27, NULL, 'ANYCUBIC-I3M', 'product/ea88b7078652909f3d6c5d445aa05f59.jpeg', 3, 1, 10, NULL, 7990000, 15000, 100, 0, 0, NULL, 0, 1, 162, '2019-03-30 15:50:41', NULL, '2018-08-22 09:26:00', '2019-03-30 15:50:41'),
(28, NULL, '3DNOZZLE', 'product/c25c81c852823f5ea8ba4250978217a5.jpeg', 3, 1, 11, NULL, 10000, 15000, 100, 0, 0, NULL, 0, 1, 77, '2019-03-30 07:03:17', NULL, '2018-08-23 21:21:48', '2019-03-30 07:03:17'),
(29, NULL, '3D-TEFLONLOCK', 'product/8e28f51184f0a96970c05185b1412fa1.jpeg', 3, 1, 12, NULL, 10000, 15000, 99, 1, 0, NULL, 0, 1, 115, '2019-03-30 07:49:35', NULL, '2018-08-23 21:32:48', '2019-03-30 07:49:35'),
(30, NULL, '3D-BELT-GT2', 'product/8f795b2335d42cdb7c7eafcfaf714cb2.jpeg', 4, 1, 11, NULL, 20000, 15000, 100, 0, 1, NULL, 0, 1, 145, '2019-04-19 22:15:49', NULL, '2018-08-23 21:35:39', '2019-04-19 22:15:49'),
(31, NULL, '3D-TEFLONLOCK-M10', 'product/0e1416d509af3712bd801404ca928702.jpeg', 4, 1, 11, NULL, 10000, 15000, 100, 0, 0, NULL, 0, 1, 85, '2019-03-30 20:00:41', NULL, '2018-08-23 21:39:03', '2019-03-30 20:00:41'),
(32, NULL, '3D-HOTWIRE1240', 'product/efd9fb910ba539c125b7c431a1ccc563.jpg', 4, 1, 11, NULL, 20000, 15000, 100, 0, 1, NULL, 0, 1, 165, '2019-03-30 20:53:09', NULL, '2018-08-23 21:40:54', '2019-03-30 20:53:09'),
(33, NULL, '3D-TEFTLON-24', 'product/a635cc2bdf5485ccb2c0cc9d186968b2.jpeg', 4, 1, 16, NULL, 15000, 15000, 100, 0, 0, NULL, 1, 1, 119, '2019-03-26 16:41:29', NULL, '2018-08-23 21:44:04', '2019-03-26 16:41:29'),
(34, NULL, '3D-TEFTLON-W24', 'product/a32f12e009ebf0d24ab264706ecbc15e.jpeg', 4, 1, 11, NULL, 20000, 15000, 100, 0, 1, NULL, 0, 1, 148, '2019-03-29 01:51:55', NULL, '2018-08-23 22:09:34', '2019-03-29 01:51:55'),
(35, NULL, '3D-SENSOR-NTC 100K', 'product/41c8f0d0111cd5a3f0538604233cbed8.jpeg', 4, 1, 10, NULL, 15000, 15000, 100, 0, 1, NULL, 0, 1, 213, '2019-05-02 18:50:15', NULL, '2018-08-23 22:13:58', '2019-05-02 18:50:15'),
(36, NULL, 'nRLF24L01+2.4HZ', 'product/820283598735f98a9b23960821da438b.jpeg', 4, 1, 11, NULL, 25000, 15000, 100, 0, 0, NULL, 0, 1, 137, '2019-03-30 18:52:08', NULL, '2018-08-23 23:07:15', '2019-03-30 18:52:08'),
(37, NULL, 'ARDUINO-NANO', 'product/da687e60e54bd7fc7eab5c76e7ec3754.jpeg', 4, 1, 17, NULL, 100000, 15000, 99, 1, 0, NULL, 0, 1, 175, '2019-03-29 13:34:47', NULL, '2018-08-23 23:25:48', '2019-03-29 13:34:47'),
(38, NULL, 'LEDSTRIP-5050RGB', 'product/61559578baf403e03565e73a14f845ce.jpeg', 4, 1, 9, NULL, 15000, 15000, 99, 1, 1, NULL, 0, 1, 203, '2019-03-29 14:39:01', NULL, '2018-08-23 23:33:31', '2019-03-29 14:39:01'),
(39, NULL, 'LEDSTRIP-S', 'product/c400aecd5c6d87782ac9af33dd7a5980.jpg', 4, 1, 12, NULL, 15000, 15000, 100, 0, 0, NULL, 0, 1, 93, '2019-03-28 09:48:06', NULL, '2018-08-24 01:46:21', '2019-03-28 09:48:06'),
(40, NULL, 'P10-IR', 'product/830d640cd17eba0bf186dc649d5c3053.jpeg', 5, 1, 12, NULL, 15000, 15000, 100, 0, 0, NULL, 0, 1, 83, '2019-03-28 21:01:21', NULL, '2018-08-24 01:49:49', '2019-03-28 21:01:21'),
(41, NULL, 'P10-IG', 'product/9d9aab8be8634708c9cf5b690fee74a4.jpeg', 5, 1, 10, NULL, 15000, 15000, 99, 1, 1, NULL, 0, 1, 121, '2019-03-29 13:47:31', NULL, '2018-08-24 01:51:11', '2019-03-29 13:47:31'),
(42, NULL, 'P10-IB', 'product/98fafb9da683cd9ee854598f3f3a3bd5.jpeg', 5, 1, 11, NULL, 15000, 15000, 100, 0, 0, NULL, 0, 1, 98, '2019-03-28 17:25:25', NULL, '2018-08-24 01:52:58', '2019-03-28 17:25:25'),
(43, NULL, 'P10-IRGB', 'product/a111c060ebb6ffbbd2d34ae278501789.jpg', 5, 1, 6, NULL, 15000, 15000, 99, 1, 0, NULL, 0, 1, 124, '2019-03-30 16:51:34', NULL, '2018-08-24 01:54:45', '2019-03-30 16:51:34'),
(44, NULL, 'P10-IRG', 'product/95349d3747fdaf79d391fdc98e083701.jpg', 5, 1, 11, NULL, 15000, 15000, 100, 0, 1, NULL, 0, 1, 173, '2019-03-30 15:42:45', NULL, '2018-08-24 01:56:02', '2019-03-30 15:42:45'),
(45, NULL, 'LFF', 'product/3c8f613d30b4e487ef95a5e4cdea634c.jpeg', 5, 1, 6, NULL, 15000, 15000, 94, 6, 0, NULL, 0, 1, 238, '2019-03-29 11:49:10', NULL, '2018-08-24 01:58:42', '2019-03-29 11:49:10'),
(46, NULL, 'P25-I', 'product/949fa36ebd56593445fb61d141fd2a81.jpeg', 5, 1, 10, NULL, 15000, 15000, 96, 4, 0, NULL, 0, 1, 230, '2019-03-30 14:18:48', NULL, '2018-08-24 02:23:07', '2019-03-30 14:18:48'),
(47, NULL, 'BX-5U0', 'product/cd7aa3394c35330ed7f9e4095c6adb65.jpeg', 5, 1, 12, NULL, 15000, 15000, 93, 7, 0, NULL, 0, 1, 266, '2019-03-30 15:30:39', NULL, '2018-08-24 02:48:31', '2019-03-30 15:30:39'),
(48, NULL, 'BX-5UT', 'product/b0d947f6ddd37e9684055c6cd45cd40d.jpg', 5, 1, 11, NULL, 15000, 15000, 84, 16, 0, NULL, 0, 1, 500, '2019-03-30 07:19:42', NULL, '2018-08-24 02:52:15', '2019-03-30 07:19:42'),
(49, NULL, 'BX-5UTbnv', 'product/42eb3619452dfabb8ea09f64cff290c6.jpeg', 5, 1, 2, NULL, 15000, 15000, 74, 26, 1, NULL, 0, 1, 458, '2019-03-29 18:09:24', '2019-03-29 17:00:00', '2018-09-03 01:05:59', '2019-03-29 18:09:24'),
(50, 1, 'prod1', NULL, 0, 0, 19, NULL, 200, 120, 8, 0, 0, NULL, 1, 1, 0, NULL, NULL, '2019-05-05 01:20:50', '2019-05-05 01:20:50');

-- --------------------------------------------------------

--
-- Table structure for table `shop_product_description`
--

CREATE TABLE `shop_product_description` (
  `product_id` int(11) NOT NULL,
  `lang_id` int(11) NOT NULL,
  `company_id` int(11) DEFAULT NULL,
  `name` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `keyword` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `content` text COLLATE utf8_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `shop_product_description`
--

INSERT INTO `shop_product_description` (`product_id`, `lang_id`, `company_id`, `name`, `description`, `keyword`, `content`) VALUES
(3, 1, NULL, 'Easy Polo Black Edition 3', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', NULL, '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<img alt=\"\" src=\"/documents/photos/blogs/16d9_star_trek_tng_uniform_tee.jpeg\" style=\"width: 262px; height: 262px; float: right; margin: 10px;\" /></p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>'),
(3, 2, NULL, 'Easy Polo Black Edition 3', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', NULL, '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<img alt=\"\" src=\"/documents/photos/blogs/16d9_star_trek_tng_uniform_tee.jpeg\" style=\"width: 262px; height: 262px; float: right; margin: 10px;\" /></p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>'),
(4, 1, NULL, 'Easy Polo Black Edition 4', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', '', '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<img alt=\"\" src=\"/documents/photos/blogs/16d9_star_trek_tng_uniform_tee.jpeg\" style=\"width: 262px; height: 262px; float: right; margin: 10px;\" /></p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>'),
(4, 2, NULL, 'Easy Polo Black Edition 4', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', '', '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<img alt=\"\" src=\"/documents/photos/blogs/16d9_star_trek_tng_uniform_tee.jpeg\" style=\"width: 262px; height: 262px; float: right; margin: 10px;\" /></p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>'),
(5, 1, NULL, 'Easy Polo Black Edition 5', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', NULL, '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<img alt=\"\" src=\"/documents/photos/blogs/16d9_star_trek_tng_uniform_tee.jpeg\" style=\"width: 262px; height: 262px; float: right; margin: 10px;\" /></p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>'),
(5, 2, NULL, 'Easy Polo Black Edition 5', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', NULL, '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<img alt=\"\" src=\"/documents/photos/blogs/16d9_star_trek_tng_uniform_tee.jpeg\" style=\"width: 262px; height: 262px; float: right; margin: 10px;\" /></p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>'),
(6, 1, NULL, 'Easy Polo Black Edition 6', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', '', '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<img alt=\"\" src=\"/documents/photos/blogs/16d9_star_trek_tng_uniform_tee.jpeg\" style=\"width: 262px; height: 262px; float: right; margin: 10px;\" /></p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>'),
(6, 2, NULL, 'Easy Polo Black Edition 6', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', '', '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<img alt=\"\" src=\"/documents/photos/blogs/16d9_star_trek_tng_uniform_tee.jpeg\" style=\"width: 262px; height: 262px; float: right; margin: 10px;\" /></p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>'),
(7, 1, NULL, 'Easy Polo Black Edition 7', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', '', '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<img alt=\"\" src=\"/documents/photos/blogs/16d9_star_trek_tng_uniform_tee.jpeg\" style=\"width: 262px; height: 262px; float: right; margin: 10px;\" /></p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>'),
(7, 2, NULL, 'Easy Polo Black Edition 7', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', '', '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<img alt=\"\" src=\"/documents/photos/blogs/16d9_star_trek_tng_uniform_tee.jpeg\" style=\"width: 262px; height: 262px; float: right; margin: 10px;\" /></p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>'),
(8, 1, NULL, 'Easy Polo Black Edition 8', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', '', '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<img alt=\"\" src=\"/documents/photos/blogs/16d9_star_trek_tng_uniform_tee.jpeg\" style=\"width: 262px; height: 262px; float: right; margin: 10px;\" /></p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>'),
(8, 2, NULL, 'Easy Polo Black Edition 8', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', '', '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<img alt=\"\" src=\"/documents/photos/blogs/16d9_star_trek_tng_uniform_tee.jpeg\" style=\"width: 262px; height: 262px; float: right; margin: 10px;\" /></p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>'),
(9, 1, NULL, 'Easy Polo Black Edition 9', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', NULL, '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<img alt=\"\" src=\"/documents/photos/blogs/16d9_star_trek_tng_uniform_tee.jpeg\" style=\"width: 262px; height: 262px; float: right; margin: 10px;\" /></p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>'),
(9, 2, NULL, 'Easy Polo Black Edition 9', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', NULL, '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<img alt=\"\" src=\"/documents/photos/blogs/16d9_star_trek_tng_uniform_tee.jpeg\" style=\"width: 262px; height: 262px; float: right; margin: 10px;\" /></p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>'),
(10, 1, NULL, 'Easy Polo Black Edition 10', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', '', '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<img alt=\"\" src=\"/documents/photos/blogs/16d9_star_trek_tng_uniform_tee.jpeg\" style=\"width: 262px; height: 262px; float: right; margin: 10px;\" /></p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>'),
(10, 2, NULL, 'Easy Polo Black Edition 10', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', '', '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<img alt=\"\" src=\"/documents/photos/blogs/16d9_star_trek_tng_uniform_tee.jpeg\" style=\"width: 262px; height: 262px; float: right; margin: 10px;\" /></p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>'),
(11, 1, NULL, 'Easy Polo Black Edition 11', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', NULL, '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<img alt=\"\" src=\"/documents/photos/blogs/16d9_star_trek_tng_uniform_tee.jpeg\" style=\"width: 262px; height: 262px; float: right; margin: 10px;\" /></p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>'),
(11, 2, NULL, 'Easy Polo Black Edition 11', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', NULL, '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<img alt=\"\" src=\"/documents/photos/blogs/16d9_star_trek_tng_uniform_tee.jpeg\" style=\"width: 262px; height: 262px; float: right; margin: 10px;\" /></p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>'),
(12, 1, NULL, 'Easy Polo Black Edition 12', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', '', '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<img alt=\"\" src=\"/documents/photos/blogs/16d9_star_trek_tng_uniform_tee.jpeg\" style=\"width: 262px; height: 262px; float: right; margin: 10px;\" /></p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>'),
(12, 2, NULL, 'Easy Polo Black Edition 12', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', '', '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<img alt=\"\" src=\"/documents/photos/blogs/16d9_star_trek_tng_uniform_tee.jpeg\" style=\"width: 262px; height: 262px; float: right; margin: 10px;\" /></p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>'),
(20, 1, NULL, 'Easy Polo Black Edition 20', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', '', '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<img alt=\"\" src=\"/documents/photos/blogs/16d9_star_trek_tng_uniform_tee.jpeg\" style=\"width: 262px; height: 262px; float: right; margin: 10px;\" /></p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>'),
(20, 2, NULL, 'Easy Polo Black Edition 20', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', '', '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<img alt=\"\" src=\"/documents/photos/blogs/16d9_star_trek_tng_uniform_tee.jpeg\" style=\"width: 262px; height: 262px; float: right; margin: 10px;\" /></p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>'),
(21, 1, NULL, 'Easy Polo Black Edition 21', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', NULL, '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<img alt=\"\" src=\"/documents/photos/blogs/16d9_star_trek_tng_uniform_tee.jpeg\" style=\"width: 262px; height: 262px; float: right; margin: 10px;\" /></p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>'),
(21, 2, NULL, 'Easy Polo Black Edition 21', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', NULL, '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<img alt=\"\" src=\"/documents/photos/blogs/16d9_star_trek_tng_uniform_tee.jpeg\" style=\"width: 262px; height: 262px; float: right; margin: 10px;\" /></p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>'),
(22, 1, NULL, 'Easy Polo Black Edition 22', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', NULL, '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<img alt=\"\" src=\"/documents/photos/blogs/16d9_star_trek_tng_uniform_tee.jpeg\" style=\"width: 262px; height: 262px; float: right; margin: 10px;\" /></p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>'),
(22, 2, NULL, 'Easy Polo Black Edition 22', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', NULL, '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<img alt=\"\" src=\"/documents/photos/blogs/16d9_star_trek_tng_uniform_tee.jpeg\" style=\"width: 262px; height: 262px; float: right; margin: 10px;\" /></p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>'),
(23, 1, NULL, 'Easy Polo Black Edition 23', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', NULL, '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<img alt=\"\" src=\"/documents/photos/blogs/16d9_star_trek_tng_uniform_tee.jpeg\" style=\"width: 262px; height: 262px; float: right; margin: 10px;\" /></p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>'),
(23, 2, NULL, 'Easy Polo Black Edition 23', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', NULL, '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<img alt=\"\" src=\"/documents/photos/blogs/16d9_star_trek_tng_uniform_tee.jpeg\" style=\"width: 262px; height: 262px; float: right; margin: 10px;\" /></p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>'),
(24, 1, NULL, 'Easy Polo Black Edition 24', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', NULL, '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<img alt=\"\" src=\"/documents/photos/blogs/16d9_star_trek_tng_uniform_tee.jpeg\" style=\"width: 262px; height: 262px; float: right; margin: 10px;\" /></p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>'),
(24, 2, NULL, 'Easy Polo Black Edition 24', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', NULL, '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<img alt=\"\" src=\"/documents/photos/blogs/16d9_star_trek_tng_uniform_tee.jpeg\" style=\"width: 262px; height: 262px; float: right; margin: 10px;\" /></p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>'),
(25, 1, NULL, 'Easy Polo Black Edition 25', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', NULL, '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<img alt=\"\" src=\"/documents/photos/blogs/16d9_star_trek_tng_uniform_tee.jpeg\" style=\"width: 262px; height: 262px; float: right; margin: 10px;\" /></p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>'),
(25, 2, NULL, 'Easy Polo Black Edition 25', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', NULL, '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<img alt=\"\" src=\"/documents/photos/blogs/16d9_star_trek_tng_uniform_tee.jpeg\" style=\"width: 262px; height: 262px; float: right; margin: 10px;\" /></p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>'),
(26, 1, NULL, 'Easy Polo Black Edition 26', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', NULL, '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<img alt=\"\" src=\"/documents/photos/blogs/16d9_star_trek_tng_uniform_tee.jpeg\" style=\"width: 262px; height: 262px; float: right; margin: 10px;\" /></p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>'),
(26, 2, NULL, 'Easy Polo Black Edition 26', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', NULL, '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<img alt=\"\" src=\"/documents/photos/blogs/16d9_star_trek_tng_uniform_tee.jpeg\" style=\"width: 262px; height: 262px; float: right; margin: 10px;\" /></p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>'),
(27, 1, NULL, 'Easy Polo Black Edition 27', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', NULL, '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<img alt=\"\" src=\"/documents/photos/blogs/16d9_star_trek_tng_uniform_tee.jpeg\" style=\"width: 262px; height: 262px; float: right; margin: 10px;\" /></p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>');
INSERT INTO `shop_product_description` (`product_id`, `lang_id`, `company_id`, `name`, `description`, `keyword`, `content`) VALUES
(27, 2, NULL, 'Easy Polo Black Edition 27', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', NULL, '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<img alt=\"\" src=\"/documents/photos/blogs/16d9_star_trek_tng_uniform_tee.jpeg\" style=\"width: 262px; height: 262px; float: right; margin: 10px;\" /></p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>'),
(28, 1, NULL, 'Easy Polo Black Edition 28', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', NULL, '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<img alt=\"\" src=\"/documents/photos/blogs/16d9_star_trek_tng_uniform_tee.jpeg\" style=\"width: 262px; height: 262px; float: right; margin: 10px;\" /></p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>'),
(28, 2, NULL, 'Easy Polo Black Edition 28', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', NULL, '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<img alt=\"\" src=\"/documents/photos/blogs/16d9_star_trek_tng_uniform_tee.jpeg\" style=\"width: 262px; height: 262px; float: right; margin: 10px;\" /></p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>'),
(29, 1, NULL, 'Easy Polo Black Edition 29', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', NULL, '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<img alt=\"\" src=\"/documents/photos/blogs/16d9_star_trek_tng_uniform_tee.jpeg\" style=\"width: 262px; height: 262px; float: right; margin: 10px;\" /></p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>'),
(29, 2, NULL, 'Easy Polo Black Edition 29', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', NULL, '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<img alt=\"\" src=\"/documents/photos/blogs/16d9_star_trek_tng_uniform_tee.jpeg\" style=\"width: 262px; height: 262px; float: right; margin: 10px;\" /></p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>'),
(30, 1, NULL, 'Easy Polo Black Edition 30', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', NULL, '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<img alt=\"\" src=\"/documents/photos/blogs/16d9_star_trek_tng_uniform_tee.jpeg\" style=\"width: 262px; height: 262px; float: right; margin: 10px;\" /></p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>'),
(30, 2, NULL, 'Easy Polo Black Edition 30', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', NULL, '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<img alt=\"\" src=\"/documents/photos/blogs/16d9_star_trek_tng_uniform_tee.jpeg\" style=\"width: 262px; height: 262px; float: right; margin: 10px;\" /></p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>'),
(31, 1, NULL, 'Easy Polo Black Edition 31', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', NULL, '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<img alt=\"\" src=\"/documents/photos/blogs/16d9_star_trek_tng_uniform_tee.jpeg\" style=\"width: 262px; height: 262px; float: right; margin: 10px;\" /></p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>'),
(31, 2, NULL, 'Easy Polo Black Edition 31', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', NULL, '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<img alt=\"\" src=\"/documents/photos/blogs/16d9_star_trek_tng_uniform_tee.jpeg\" style=\"width: 262px; height: 262px; float: right; margin: 10px;\" /></p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>'),
(32, 1, NULL, 'Easy Polo Black Edition 32', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', NULL, '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<img alt=\"\" src=\"/documents/photos/blogs/16d9_star_trek_tng_uniform_tee.jpeg\" style=\"width: 262px; height: 262px; float: right; margin: 10px;\" /></p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>'),
(32, 2, NULL, 'Easy Polo Black Edition 32', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', NULL, '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<img alt=\"\" src=\"/documents/photos/blogs/16d9_star_trek_tng_uniform_tee.jpeg\" style=\"width: 262px; height: 262px; float: right; margin: 10px;\" /></p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>'),
(33, 1, NULL, 'Easy Polo Black Edition 33', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', NULL, '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<img alt=\"\" src=\"/documents/photos/blogs/16d9_star_trek_tng_uniform_tee.jpeg\" style=\"width: 262px; height: 262px; float: right; margin: 10px;\" /></p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>'),
(33, 2, NULL, 'Easy Polo Black Edition 33', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', NULL, '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<img alt=\"\" src=\"/documents/photos/blogs/16d9_star_trek_tng_uniform_tee.jpeg\" style=\"width: 262px; height: 262px; float: right; margin: 10px;\" /></p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>'),
(34, 1, NULL, 'Easy Polo Black Edition 34', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', NULL, '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<img alt=\"\" src=\"/documents/photos/blogs/16d9_star_trek_tng_uniform_tee.jpeg\" style=\"width: 262px; height: 262px; float: right; margin: 10px;\" /></p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>'),
(34, 2, NULL, 'Easy Polo Black Edition 34', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', NULL, '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<img alt=\"\" src=\"/documents/photos/blogs/16d9_star_trek_tng_uniform_tee.jpeg\" style=\"width: 262px; height: 262px; float: right; margin: 10px;\" /></p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>'),
(35, 1, NULL, 'Easy Polo Black Edition 35', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', NULL, '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<img alt=\"\" src=\"/documents/photos/blogs/16d9_star_trek_tng_uniform_tee.jpeg\" style=\"width: 262px; height: 262px; float: right; margin: 10px;\" /></p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>'),
(35, 2, NULL, 'Easy Polo Black Edition 35', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', NULL, '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<img alt=\"\" src=\"/documents/photos/blogs/16d9_star_trek_tng_uniform_tee.jpeg\" style=\"width: 262px; height: 262px; float: right; margin: 10px;\" /></p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>'),
(36, 1, NULL, 'Easy Polo Black Edition 36', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', NULL, '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<img alt=\"\" src=\"/documents/photos/blogs/16d9_star_trek_tng_uniform_tee.jpeg\" style=\"width: 262px; height: 262px; float: right; margin: 10px;\" /></p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>'),
(36, 2, NULL, 'Easy Polo Black Edition 36', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', NULL, '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<img alt=\"\" src=\"/documents/photos/blogs/16d9_star_trek_tng_uniform_tee.jpeg\" style=\"width: 262px; height: 262px; float: right; margin: 10px;\" /></p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>'),
(37, 1, NULL, 'Easy Polo Black Edition 37', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', NULL, '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<img alt=\"\" src=\"/documents/photos/blogs/16d9_star_trek_tng_uniform_tee.jpeg\" style=\"width: 262px; height: 262px; float: right; margin: 10px;\" /></p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>'),
(37, 2, NULL, 'Easy Polo Black Edition 37', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', NULL, '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<img alt=\"\" src=\"/documents/photos/blogs/16d9_star_trek_tng_uniform_tee.jpeg\" style=\"width: 262px; height: 262px; float: right; margin: 10px;\" /></p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>'),
(38, 1, NULL, 'Easy Polo Black Edition 38', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', NULL, '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<img alt=\"\" src=\"/documents/photos/blogs/16d9_star_trek_tng_uniform_tee.jpeg\" style=\"width: 262px; height: 262px; float: right; margin: 10px;\" /></p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>'),
(38, 2, NULL, 'Easy Polo Black Edition 38', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', NULL, '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<img alt=\"\" src=\"/documents/photos/blogs/16d9_star_trek_tng_uniform_tee.jpeg\" style=\"width: 262px; height: 262px; float: right; margin: 10px;\" /></p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>'),
(39, 1, NULL, 'Easy Polo Black Edition 39', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', NULL, '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<img alt=\"\" src=\"/documents/photos/blogs/16d9_star_trek_tng_uniform_tee.jpeg\" style=\"width: 262px; height: 262px; float: right; margin: 10px;\" /></p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>'),
(39, 2, NULL, 'Easy Polo Black Edition 39', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', NULL, '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<img alt=\"\" src=\"/documents/photos/blogs/16d9_star_trek_tng_uniform_tee.jpeg\" style=\"width: 262px; height: 262px; float: right; margin: 10px;\" /></p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>'),
(40, 1, NULL, 'Easy Polo Black Edition 40', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', NULL, '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<img alt=\"\" src=\"/documents/photos/blogs/16d9_star_trek_tng_uniform_tee.jpeg\" style=\"width: 262px; height: 262px; float: right; margin: 10px;\" /></p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>'),
(40, 2, NULL, 'Easy Polo Black Edition 40', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', NULL, '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<img alt=\"\" src=\"/documents/photos/blogs/16d9_star_trek_tng_uniform_tee.jpeg\" style=\"width: 262px; height: 262px; float: right; margin: 10px;\" /></p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>'),
(41, 1, NULL, 'Easy Polo Black Edition 41', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', NULL, '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<img alt=\"\" src=\"/documents/photos/blogs/16d9_star_trek_tng_uniform_tee.jpeg\" style=\"width: 262px; height: 262px; float: right; margin: 10px;\" /></p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>'),
(41, 2, NULL, 'Easy Polo Black Edition 41', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', NULL, '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<img alt=\"\" src=\"/documents/photos/blogs/16d9_star_trek_tng_uniform_tee.jpeg\" style=\"width: 262px; height: 262px; float: right; margin: 10px;\" /></p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>'),
(42, 1, NULL, 'Easy Polo Black Edition 42', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', NULL, '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<img alt=\"\" src=\"/documents/photos/blogs/16d9_star_trek_tng_uniform_tee.jpeg\" style=\"width: 262px; height: 262px; float: right; margin: 10px;\" /></p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>'),
(42, 2, NULL, 'Easy Polo Black Edition 42', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', NULL, '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<img alt=\"\" src=\"/documents/photos/blogs/16d9_star_trek_tng_uniform_tee.jpeg\" style=\"width: 262px; height: 262px; float: right; margin: 10px;\" /></p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>'),
(43, 1, NULL, 'Easy Polo Black Edition 43', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', NULL, '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<img alt=\"\" src=\"/documents/photos/blogs/16d9_star_trek_tng_uniform_tee.jpeg\" style=\"width: 262px; height: 262px; float: right; margin: 10px;\" /></p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>'),
(43, 2, NULL, 'Easy Polo Black Edition 43', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', NULL, '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<img alt=\"\" src=\"/documents/photos/blogs/16d9_star_trek_tng_uniform_tee.jpeg\" style=\"width: 262px; height: 262px; float: right; margin: 10px;\" /></p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>'),
(44, 1, NULL, 'Easy Polo Black Edition 44', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', NULL, '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<img alt=\"\" src=\"/documents/photos/blogs/16d9_star_trek_tng_uniform_tee.jpeg\" style=\"width: 262px; height: 262px; float: right; margin: 10px;\" /></p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>'),
(44, 2, NULL, 'Easy Polo Black Edition 44', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', NULL, '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<img alt=\"\" src=\"/documents/photos/blogs/16d9_star_trek_tng_uniform_tee.jpeg\" style=\"width: 262px; height: 262px; float: right; margin: 10px;\" /></p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>');
INSERT INTO `shop_product_description` (`product_id`, `lang_id`, `company_id`, `name`, `description`, `keyword`, `content`) VALUES
(45, 1, NULL, 'Easy Polo Black Edition 45', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', NULL, '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<img alt=\"\" src=\"/documents/photos/blogs/16d9_star_trek_tng_uniform_tee.jpeg\" style=\"width: 262px; height: 262px; float: right; margin: 10px;\" /></p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>'),
(45, 2, NULL, 'Easy Polo Black Edition 45', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', NULL, '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<img alt=\"\" src=\"/documents/photos/blogs/16d9_star_trek_tng_uniform_tee.jpeg\" style=\"width: 262px; height: 262px; float: right; margin: 10px;\" /></p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>'),
(46, 1, NULL, 'Easy Polo Black Edition 46', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', NULL, '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<img alt=\"\" src=\"/documents/photos/blogs/16d9_star_trek_tng_uniform_tee.jpeg\" style=\"width: 262px; height: 262px; float: right; margin: 10px;\" /></p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>'),
(46, 2, NULL, 'Easy Polo Black Edition 46', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', NULL, '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<img alt=\"\" src=\"/documents/photos/blogs/16d9_star_trek_tng_uniform_tee.jpeg\" style=\"width: 262px; height: 262px; float: right; margin: 10px;\" /></p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>'),
(47, 1, NULL, 'Easy Polo Black Edition 47', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', NULL, '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<img alt=\"\" src=\"/documents/photos/blogs/16d9_star_trek_tng_uniform_tee.jpeg\" style=\"width: 262px; height: 262px; float: right; margin: 10px;\" /></p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>'),
(47, 2, NULL, 'Easy Polo Black Edition 47', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', NULL, '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<img alt=\"\" src=\"/documents/photos/blogs/16d9_star_trek_tng_uniform_tee.jpeg\" style=\"width: 262px; height: 262px; float: right; margin: 10px;\" /></p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>'),
(48, 1, NULL, 'Easy Polo Black Edition 48', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', NULL, '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<img alt=\"\" src=\"/documents/photos/blogs/16d9_star_trek_tng_uniform_tee.jpeg\" style=\"width: 262px; height: 262px; float: right; margin: 10px;\" /></p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>'),
(48, 2, NULL, 'Easy Polo Black Edition 48', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', NULL, '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<img alt=\"\" src=\"/documents/photos/blogs/16d9_star_trek_tng_uniform_tee.jpeg\" style=\"width: 262px; height: 262px; float: right; margin: 10px;\" /></p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>'),
(49, 1, NULL, 'Easy Polo Black Edition 49', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', NULL, '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<img alt=\"\" src=\"/documents/photos/blogs/16d9_star_trek_tng_uniform_tee.jpeg\" style=\"width: 262px; height: 262px; float: right; margin: 10px;\" /></p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>'),
(49, 3, NULL, 'Easy Polo Black Edition 49', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', NULL, '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<img alt=\"\" src=\"/documents/photos/blogs/16d9_star_trek_tng_uniform_tee.jpeg\" style=\"width: 262px; height: 262px; float: right; margin: 10px;\" /></p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>'),
(50, 1, NULL, 'prod1', 'prod1 desc', 'prod1 keyword', 'prod 1 long data');

-- --------------------------------------------------------

--
-- Table structure for table `shop_product_image`
--

CREATE TABLE `shop_product_image` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(11) DEFAULT NULL,
  `image` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `product_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `sort` int(2) UNSIGNED NOT NULL DEFAULT '0',
  `status` int(2) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `shop_product_image`
--

INSERT INTO `shop_product_image` (`id`, `company_id`, `image`, `product_id`, `sort`, `status`) VALUES
(82, NULL, 'product_slide/0642809276ecd6a28cb23d464cf41734.jpeg', 38, 0, 0),
(83, NULL, 'product_slide/f4786d81509a8d8ffa461535b07c77bc.png', 38, 0, 0),
(84, NULL, 'product_slide/e09af215f794f8225063c368f46a971d.jpeg', 39, 0, 0),
(87, NULL, 'product_slide/54fac65e58eb9abafe3ac1acbde5ee6d.jpeg', 40, 0, 0),
(88, NULL, 'product_slide/81f37c10d867710075e3ab6153a31d03.png', 40, 0, 0),
(89, NULL, 'product_slide/2fbba5ac3b9c0838e5ce2b536d0c5659.jpeg', 42, 0, 0),
(90, NULL, 'product_slide/8718dfdb75f951010cdce669768c3e3a.png', 42, 0, 0),
(92, NULL, 'product_slide/86282e4f808428108773596dea5ee29c.jpeg', 43, 0, 0),
(93, NULL, 'product_slide/b89873b9c888c0511e14c6e3abc798e8.jpeg', 43, 0, 0),
(94, NULL, 'product_slide/b0d9ffad7e40d07bae6d36665f765e0f.jpeg', 43, 0, 0),
(95, NULL, 'product_slide/70edffd9b5b4121fb8aee7e41c941f03.jpeg', 44, 0, 0),
(96, NULL, 'product_slide/e9d5898fc6daf50751ec0c4e91ed904d.jpeg', 45, 0, 0),
(109, NULL, 'product_slide/e91e85e37bb89ed854aa4123ce5eb14f.jpeg', 49, 0, 0),
(110, NULL, 'product_slide/bcf85f60d3fe35de2c1be6272f9605ef.png', 52, 0, 0),
(111, NULL, 'product_slide/40999526f41b1d4090e30c6b0ce21dca.jpg', 53, 0, 0),
(113, NULL, 'product_slide/7963a1dc4e1676c2b3bc97ade96de7b6.jpeg', 49, 0, 0),
(114, NULL, 'product_slide/101a109520cfbddde1be1791423010b6.jpeg', 46, 0, 0),
(115, NULL, 'product_slide/f02dbb115272eac46f46f015608ab93a.jpeg', 46, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `shop_product_like`
--

CREATE TABLE `shop_product_like` (
  `product_id` int(11) NOT NULL,
  `users_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `shop_product_option`
--

CREATE TABLE `shop_product_option` (
  `id` int(11) NOT NULL,
  `company_id` int(11) NOT NULL,
  `opt_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `opt_sku` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `opt_price` int(11) DEFAULT NULL,
  `opt_image` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `shop_product_option`
--

INSERT INTO `shop_product_option` (`id`, `company_id`, `opt_name`, `opt_sku`, `opt_price`, `opt_image`, `product_id`) VALUES
(3, 0, 'Sản phẩm xanh', 'BX-5UT-s', 454, 'product/4c28c6a2fc6a3fa79197798707d55b5c.png', 48),
(4, 0, '34324234', 'BX-5UT-T', 1111, 'product/293da323794f89ee2d7962f44f930393.png', 48),
(12, 0, 'fdgdfg', 'fgdfgd', NULL, 'product/68f8a4d063e4ddef447616116dd03e0f.png', 42),
(13, 0, 'bnmbnmbn', 'BX-5U0-1fgfgjghjhgj', NULL, 'product/2702691387f97f5985843cbb243d267c.png', 42),
(16, 0, 'Sản phẩm xanh', 'BX-5U0-1fgfgkjh', NULL, 'product/777274d55ff7adeef36ca930022a8db9.jpg', 29),
(17, 0, 'Sản phẩm xanh', 'BX-5U0-1fgfgl', NULL, 'product/0ba3c6a927bb0e2cd2d54ce0c13df919.jpg', 30),
(18, 0, 'Sản phẩm xanh', 'BX-5U0-1fgfgg', NULL, 'product/7eb3eefcb94b7548cc4942a42f36e186.jpg', 27);

-- --------------------------------------------------------

--
-- Table structure for table `shop_shipping`
--

CREATE TABLE `shop_shipping` (
  `id` int(11) NOT NULL,
  `company_id` int(11) DEFAULT NULL,
  `type` int(11) NOT NULL DEFAULT '0',
  `value` int(11) NOT NULL DEFAULT '0',
  `free` int(11) NOT NULL DEFAULT '0',
  `status` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `shop_shipping`
--

INSERT INTO `shop_shipping` (`id`, `company_id`, `type`, `value`, `free`, `status`) VALUES
(1, NULL, 0, 20000, 10000000, 1);

-- --------------------------------------------------------

--
-- Table structure for table `shop_shipping_status`
--

CREATE TABLE `shop_shipping_status` (
  `id` int(11) NOT NULL,
  `company_id` int(11) NOT NULL,
  `name` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `shop_shipping_status`
--

INSERT INTO `shop_shipping_status` (`id`, `company_id`, `name`) VALUES
(0, 0, 'Not sent'),
(1, 0, 'Sending'),
(2, 0, 'Shipping done');

-- --------------------------------------------------------

--
-- Table structure for table `shop_shoppingcart`
--

CREATE TABLE `shop_shoppingcart` (
  `identifier` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `instance` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `content` text COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `shop_special_price`
--

CREATE TABLE `shop_special_price` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(11) DEFAULT NULL,
  `product_id` int(11) NOT NULL,
  `price` int(11) NOT NULL,
  `off` int(11) DEFAULT '0',
  `date_start` timestamp NULL DEFAULT NULL,
  `date_end` timestamp NULL DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '0',
  `comment` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `shop_special_price`
--

INSERT INTO `shop_special_price` (`id`, `company_id`, `product_id`, `price`, `off`, `date_start`, `date_end`, `status`, `comment`, `created_at`, `updated_at`) VALUES
(1, 1, 21, 150000, 0, '2018-01-27 17:00:00', '2019-04-29 17:00:00', 1, NULL, '2018-02-06 05:05:20', '2018-04-12 07:45:17'),
(4, NULL, 6, 40000, 0, NULL, '2019-06-27 17:00:00', 1, NULL, '2018-02-06 05:44:40', '2018-04-12 07:45:32'),
(6, NULL, 8, 30000, 0, '2018-02-06 17:00:00', '2018-03-09 17:00:00', 1, NULL, '2018-02-07 07:45:19', '2018-02-07 08:17:42'),
(7, NULL, 10, 15000, 0, '2018-02-05 17:00:00', '2018-03-28 17:00:00', 1, NULL, '2018-02-07 07:49:48', '2018-03-10 22:36:43'),
(9, NULL, 11, 100000, 0, '2018-03-18 17:00:00', '2018-03-30 17:00:00', 1, NULL, '2018-02-08 08:51:45', '2018-03-24 19:49:07'),
(11, NULL, 12, 100000, 0, NULL, NULL, 1, NULL, '2018-03-27 07:13:47', '2018-03-27 07:18:44'),
(12, NULL, 7, 320000, 0, '2011-10-25 17:00:00', '2019-05-07 17:00:00', 1, NULL, '2018-04-12 07:46:40', '2018-08-31 17:05:12'),
(13, NULL, 23, 198000, 10, '2018-05-07 17:00:00', '2018-06-07 17:00:00', 0, 'test giam gia', '2018-05-09 08:15:37', '2018-08-28 15:13:45'),
(14, NULL, 49, 10000, 0, NULL, NULL, 1, NULL, '2018-09-22 11:19:07', '2018-09-22 11:19:07'),
(15, NULL, 3, 200000, 0, NULL, NULL, 1, NULL, '2018-09-22 11:20:14', '2018-09-22 11:20:14');

-- --------------------------------------------------------

--
-- Table structure for table `shop_users`
--

CREATE TABLE `shop_users` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address1` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address2` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `shop_users`
--

INSERT INTO `shop_users` (`id`, `company_id`, `name`, `email`, `password`, `address1`, `address2`, `phone`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 1, 'mahmoud', 'ms_ms25490@yahoo.com', '$2y$10$MpxfOiKlstJNu0yjL4vjo.n2504ygw17tkIxseCfkEKmteoEm82fe', 'caru egt', NULL, '1142931228', NULL, '2019-05-07 03:41:09', '2019-05-07 03:41:09');

-- --------------------------------------------------------

--
-- Table structure for table `shop_vendor`
--

CREATE TABLE `shop_vendor` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(11) DEFAULT NULL,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `image` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `url` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sort` tinyint(4) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `shop_vendor`
--

INSERT INTO `shop_vendor` (`id`, `company_id`, `name`, `email`, `phone`, `image`, `address`, `url`, `sort`) VALUES
(1, NULL, 'ABC distributor', 'abc@abc.com', '012496657567', NULL, NULL, NULL, 0),
(2, 1, 'mahmoud', 'ms_ms25490@yahoo.com', '1142931228', 'vendor/94bf816d0d1fffd7d11b3a3adcd31359.jpg', 'caru egt', NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `subscribe`
--

CREATE TABLE `subscribe` (
  `id` int(11) NOT NULL,
  `company_id` int(11) DEFAULT NULL,
  `email` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `updated_at` date NOT NULL,
  `created_at` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `subscribe`
--

INSERT INTO `subscribe` (`id`, `company_id`, `email`, `updated_at`, `created_at`) VALUES
(1, NULL, 'lanhktc@gmail.com', '0000-00-00', '0000-00-00'),
(2, NULL, 'mahmoud.25490@gmail.com', '2019-05-19', '2019-05-19');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `activitylist`
--
ALTER TABLE `activitylist`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `type` (`type`);

--
-- Indexes for table `admin_menu`
--
ALTER TABLE `admin_menu`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `admin_operation_log`
--
ALTER TABLE `admin_operation_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `admin_operation_log_user_id_index` (`user_id`);

--
-- Indexes for table `admin_permissions`
--
ALTER TABLE `admin_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `admin_permissions_name_unique` (`name`);

--
-- Indexes for table `admin_roles`
--
ALTER TABLE `admin_roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `admin_roles_name_unique` (`name`);

--
-- Indexes for table `admin_role_menu`
--
ALTER TABLE `admin_role_menu`
  ADD KEY `admin_role_menu_role_id_menu_id_index` (`role_id`,`menu_id`);

--
-- Indexes for table `admin_role_permissions`
--
ALTER TABLE `admin_role_permissions`
  ADD KEY `admin_role_permissions_role_id_permission_id_index` (`role_id`,`permission_id`);

--
-- Indexes for table `admin_role_users`
--
ALTER TABLE `admin_role_users`
  ADD KEY `admin_role_users_role_id_user_id_index` (`role_id`,`user_id`);

--
-- Indexes for table `admin_users`
--
ALTER TABLE `admin_users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `admin_users_username_unique` (`username`);

--
-- Indexes for table `admin_user_permissions`
--
ALTER TABLE `admin_user_permissions`
  ADD KEY `admin_user_permissions_user_id_permission_id_index` (`user_id`,`permission_id`);

--
-- Indexes for table `banner`
--
ALTER TABLE `banner`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `companies`
--
ALTER TABLE `companies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `config`
--
ALTER TABLE `config`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `key` (`key`);

--
-- Indexes for table `config_global`
--
ALTER TABLE `config_global`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `config_global_description`
--
ALTER TABLE `config_global_description`
  ADD UNIQUE KEY `config_id_lang_id` (`config_id`,`lang_id`);

--
-- Indexes for table `language`
--
ALTER TABLE `language`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `code` (`code`);

--
-- Indexes for table `layout`
--
ALTER TABLE `layout`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `layout_page`
--
ALTER TABLE `layout_page`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uniquekey` (`uniquekey`);

--
-- Indexes for table `layout_position`
--
ALTER TABLE `layout_position`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uniquekey` (`uniquekey`);

--
-- Indexes for table `layout_type`
--
ALTER TABLE `layout_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uniquekey` (`uniquekey`);

--
-- Indexes for table `layout_url`
--
ALTER TABLE `layout_url`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `shipping_standard`
--
ALTER TABLE `shipping_standard`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `shop_api`
--
ALTER TABLE `shop_api`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `shop_api_process`
--
ALTER TABLE `shop_api_process`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `secret_key` (`secret_key`);

--
-- Indexes for table `shop_attribute_detail`
--
ALTER TABLE `shop_attribute_detail`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `shop_attribute_group`
--
ALTER TABLE `shop_attribute_group`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `shop_brand`
--
ALTER TABLE `shop_brand`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `shop_category`
--
ALTER TABLE `shop_category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `shop_category_description`
--
ALTER TABLE `shop_category_description`
  ADD UNIQUE KEY `shop_category_id_lang_id` (`shop_category_id`,`lang_id`);

--
-- Indexes for table `shop_currency`
--
ALTER TABLE `shop_currency`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `code` (`code`);

--
-- Indexes for table `shop_discount`
--
ALTER TABLE `shop_discount`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `shop_discount_code_unique` (`code`);

--
-- Indexes for table `shop_order`
--
ALTER TABLE `shop_order`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `shop_order_detail`
--
ALTER TABLE `shop_order_detail`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `shop_order_history`
--
ALTER TABLE `shop_order_history`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `shop_order_status`
--
ALTER TABLE `shop_order_status`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `shop_order_total`
--
ALTER TABLE `shop_order_total`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `shop_page`
--
ALTER TABLE `shop_page`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `key` (`uniquekey`);

--
-- Indexes for table `shop_page_description`
--
ALTER TABLE `shop_page_description`
  ADD UNIQUE KEY `cms_page_id_lang_id` (`page_id`,`lang_id`);

--
-- Indexes for table `shop_payment_status`
--
ALTER TABLE `shop_payment_status`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `shop_product`
--
ALTER TABLE `shop_product`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `sku` (`sku`);

--
-- Indexes for table `shop_product_description`
--
ALTER TABLE `shop_product_description`
  ADD UNIQUE KEY `product_id_lang_id` (`product_id`,`lang_id`);

--
-- Indexes for table `shop_product_image`
--
ALTER TABLE `shop_product_image`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `shop_product_like`
--
ALTER TABLE `shop_product_like`
  ADD PRIMARY KEY (`product_id`,`users_id`);

--
-- Indexes for table `shop_product_option`
--
ALTER TABLE `shop_product_option`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `opt_sku` (`opt_sku`);

--
-- Indexes for table `shop_shipping`
--
ALTER TABLE `shop_shipping`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `shop_shipping_status`
--
ALTER TABLE `shop_shipping_status`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `shop_shoppingcart`
--
ALTER TABLE `shop_shoppingcart`
  ADD KEY `shop_shoppingcart_identifier_instance_index` (`identifier`,`instance`);

--
-- Indexes for table `shop_special_price`
--
ALTER TABLE `shop_special_price`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `shop_users`
--
ALTER TABLE `shop_users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indexes for table `shop_vendor`
--
ALTER TABLE `shop_vendor`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `subscribe`
--
ALTER TABLE `subscribe`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `activitylist`
--
ALTER TABLE `activitylist`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `admin_menu`
--
ALTER TABLE `admin_menu`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=107;

--
-- AUTO_INCREMENT for table `admin_operation_log`
--
ALTER TABLE `admin_operation_log`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1161;

--
-- AUTO_INCREMENT for table `admin_permissions`
--
ALTER TABLE `admin_permissions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `admin_roles`
--
ALTER TABLE `admin_roles`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `admin_users`
--
ALTER TABLE `admin_users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `banner`
--
ALTER TABLE `banner`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `companies`
--
ALTER TABLE `companies`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `config`
--
ALTER TABLE `config`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=68;

--
-- AUTO_INCREMENT for table `config_global`
--
ALTER TABLE `config_global`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `language`
--
ALTER TABLE `language`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `layout`
--
ALTER TABLE `layout`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `layout_page`
--
ALTER TABLE `layout_page`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `layout_position`
--
ALTER TABLE `layout_position`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `layout_type`
--
ALTER TABLE `layout_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `layout_url`
--
ALTER TABLE `layout_url`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `shipping_standard`
--
ALTER TABLE `shipping_standard`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `shop_api`
--
ALTER TABLE `shop_api`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `shop_api_process`
--
ALTER TABLE `shop_api_process`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `shop_attribute_detail`
--
ALTER TABLE `shop_attribute_detail`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `shop_attribute_group`
--
ALTER TABLE `shop_attribute_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `shop_brand`
--
ALTER TABLE `shop_brand`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `shop_category`
--
ALTER TABLE `shop_category`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `shop_currency`
--
ALTER TABLE `shop_currency`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `shop_discount`
--
ALTER TABLE `shop_discount`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `shop_order`
--
ALTER TABLE `shop_order`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `shop_order_detail`
--
ALTER TABLE `shop_order_detail`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `shop_order_history`
--
ALTER TABLE `shop_order_history`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `shop_order_status`
--
ALTER TABLE `shop_order_status`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `shop_order_total`
--
ALTER TABLE `shop_order_total`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `shop_page`
--
ALTER TABLE `shop_page`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `shop_payment_status`
--
ALTER TABLE `shop_payment_status`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `shop_product`
--
ALTER TABLE `shop_product`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT for table `shop_product_image`
--
ALTER TABLE `shop_product_image`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=116;

--
-- AUTO_INCREMENT for table `shop_product_option`
--
ALTER TABLE `shop_product_option`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `shop_shipping`
--
ALTER TABLE `shop_shipping`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `shop_shipping_status`
--
ALTER TABLE `shop_shipping_status`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `shop_special_price`
--
ALTER TABLE `shop_special_price`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `shop_users`
--
ALTER TABLE `shop_users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `shop_vendor`
--
ALTER TABLE `shop_vendor`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `subscribe`
--
ALTER TABLE `subscribe`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
