-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 23, 2020 at 07:06 PM
-- Server version: 10.4.6-MariaDB
-- PHP Version: 7.3.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ayo`
--

-- --------------------------------------------------------

--
-- Table structure for table `banner_slides`
--

CREATE TABLE `banner_slides` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `promo_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `main_category_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `url` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `home` tinyint(1) NOT NULL DEFAULT 1,
  `active` tinyint(1) NOT NULL DEFAULT 1,
  `link` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `banner_slides`
--

INSERT INTO `banner_slides` (`id`, `promo_id`, `main_category_id`, `url`, `home`, `active`, `link`, `created_at`, `updated_at`) VALUES
(1, 'f86abcefda90a6fab04c563de7c4aba0', NULL, 'https://source.unsplash.com/random/500x500', 1, 1, NULL, '2020-09-21 05:01:06', '2020-09-21 05:01:06'),
(2, '6dbb5ed49463863dcf558ad009923f03', NULL, 'https://source.unsplash.com/random/500x500', 1, 1, NULL, '2020-09-21 05:01:06', '2020-09-21 05:01:06'),
(3, '6430a990ad07dc86137100f1ea44b94a', NULL, 'https://images.unsplash.com/photo-1595116971898-300194333127?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1350&q=80', 1, 1, NULL, '2020-09-21 05:01:06', '2020-09-21 05:01:06'),
(4, '72d1a43eea2aac9f0c2204e0187bdccd', NULL, 'https://images.unsplash.com/photo-1581688084891-0cae8ad52111?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1350&q=80', 1, 1, NULL, '2020-09-21 05:01:06', '2020-09-21 05:01:06'),
(5, '7153d64c983b75ed4da5e9f78f63d1c4', NULL, 'https://images.unsplash.com/photo-1566576721346-d4a3b4eaeb55?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=701&q=80', 1, 1, NULL, '2020-09-21 05:01:06', '2020-09-21 05:01:06'),
(6, '5af6cf3069b45a4ae8710886369f0705', NULL, 'https://images.unsplash.com/photo-1526367790999-0150786686a2?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1351&q=80', 1, 1, NULL, '2020-09-21 05:01:06', '2020-09-21 05:01:06');

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT 1,
  `type` enum('guest','customer') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'guest',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`id`, `user_id`, `name`, `phone`, `password`, `active`, `type`, `created_at`, `updated_at`) VALUES
(1, '4ee3f7de1d2d81414c7cab282096c19b', NULL, NULL, '$2y$10$yWdWLf07aCiacTuTe1I10OIo4OY.7OqgySOGZSSeWhGC7cPHxRrwW', 1, 'guest', '2020-09-20 10:11:31', '2020-09-20 10:11:31'),
(2, '35cc6ea7d6c6a762426e0b1e642c573a', NULL, NULL, '$2y$10$TmZwd3PweGCJ2hEM6Aa5xeULC7xUwxefv1cqhiHzLlvNu4zXG5Zgi', 1, 'guest', '2020-09-20 10:14:48', '2020-09-20 10:14:48'),
(3, '841d9879ec2ec9271f86c9d0ced7168b', NULL, NULL, '$2y$10$L5uB.v/1zCtuluZN/tm3S.2Gnyf9NrL9t2KaAdVBhS0OBO785AQAi', 1, 'guest', '2020-09-20 10:37:28', '2020-09-20 10:37:28'),
(4, '5b953eac00977e26bd05283d3aa87218', NULL, NULL, '$2y$10$OWiLMOIKLAotLLxzlJF9ieDEM6CHGJwv/ukms2ElIA3uyacWZYhq6', 1, 'guest', '2020-09-20 23:10:43', '2020-09-20 23:10:43'),
(5, '95e1d8d2513a3a8dea2c074fd9768f07', NULL, NULL, '$2y$10$2.xIceLfXF0SaMjnwFW6G.DUIBllbx3q8YwlB3A9nKbRBBaX3sDlO', 1, 'guest', '2020-09-21 05:32:29', '2020-09-21 05:32:29'),
(6, '8311cc81f293af5242c749d11563acf9', NULL, NULL, '$2y$10$jQhCiSgqBJl01xfSlZ60D.PH0ntaOIpnWHGnHBXTRdKyk2GrcvjN.', 1, 'guest', '2020-09-21 08:10:53', '2020-09-21 08:10:53'),
(7, '5874fd60379fbb7de09507e6d1a2cd1c', NULL, NULL, '$2y$10$rN/8nC7rNbcDgGLI6jYfmuzA8B7UDFJWYiZobMXlUWWD0LtWtLRYG', 1, 'guest', '2020-09-22 07:57:14', '2020-09-22 07:57:14'),
(8, 'cc8c8b7e7b302171041aab0522e30180', NULL, NULL, '$2y$10$xLnxTWHMY.3XIEoWOHEdme8HyhSPB2pu5DDgHv/ki8l/lvABWaq8G', 1, 'guest', '2020-09-22 21:22:23', '2020-09-22 21:22:23'),
(9, '76ceb4100e141a6ece82941042db0258', NULL, NULL, '$2y$10$xR2j8H7IcgwgdIaN9.1UCe6ZBhtGKIAEbnXhseP67ezNqyJIwwgpq', 1, 'guest', '2020-09-23 00:17:08', '2020-09-23 00:17:08'),
(10, '6adc4da36f9395add5822e4d8b5d8e47', NULL, NULL, '$2y$10$Jen3PIcdZVb9Lnns7pXeP.eWfh3wxu4CgCpDEv.wB4Uz5NHy7nnYe', 1, 'guest', '2020-09-23 07:03:20', '2020-09-23 07:03:20');

-- --------------------------------------------------------

--
-- Table structure for table `delivery_types`
--

CREATE TABLE `delivery_types` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `delivery_type_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `instant` tinyint(1) NOT NULL DEFAULT 1,
  `day` int(11) DEFAULT NULL,
  `order_start` time DEFAULT NULL,
  `order_end` time DEFAULT NULL,
  `delivery_start` time DEFAULT NULL,
  `delivery_end` time DEFAULT NULL,
  `caption` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `delivery_types`
--

INSERT INTO `delivery_types` (`id`, `delivery_type_id`, `instant`, `day`, `order_start`, `order_end`, `delivery_start`, `delivery_end`, `caption`, `created_at`, `updated_at`) VALUES
(1, 'd33a2617639e4debd73b8c5696996e0b', 1, NULL, NULL, NULL, NULL, NULL, NULL, '2020-09-21 06:26:42', '2020-09-21 06:26:42'),
(2, '5c5ab7bb9c8725a14b8a14a00e8a998b', 0, 1, '00:00:00', '12:00:00', '01:00:00', '07:00:00', NULL, '2020-09-21 06:26:42', '2020-09-21 06:26:42');

-- --------------------------------------------------------

--
-- Table structure for table `discounts`
--

CREATE TABLE `discounts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `discount_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` decimal(3,0) NOT NULL,
  `expired_at` datetime DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `discounts`
--

INSERT INTO `discounts` (`id`, `discount_id`, `product_id`, `amount`, `expired_at`, `active`, `created_at`, `updated_at`) VALUES
(1, '06e613177992065441dd006572f80eda', '55a127be4235f327f45801aa8d4ebce1', '29', NULL, 1, '2020-09-22 07:43:11', '2020-09-22 07:43:11'),
(2, 'ffa4355aa603a48e4d5fc0bfe43e94c8', 'cc3423a75cb9d9bbd5ea7aa948f9848b', '4', NULL, 1, '2020-09-22 07:43:39', '2020-09-22 07:43:39'),
(3, '1c1bef989cd9df26549dacced6c0a373', 'c9678807c10aa42bfc01bd368155d3fa', '50', '2020-10-22 15:47:06', 1, '2020-09-22 07:47:06', '2020-09-22 07:47:06');

-- --------------------------------------------------------

--
-- Table structure for table `intro_sliders`
--

CREATE TABLE `intro_sliders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `intro_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `caption` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `intro_sliders`
--

INSERT INTO `intro_sliders` (`id`, `intro_id`, `url`, `title`, `caption`, `active`, `created_at`, `updated_at`) VALUES
(1, '8bc6e50beb4b24832f6def944d5c8e8d', 'https://images.unsplash.com/photo-1587049693270-c7560da11218?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1000&q=80', 'Sayur Fresh', 'orem ipsum dolor sit amet, consectetur adipiscing elit. Nulla sapien nulla, dictum id efficitur vitae, euismod quis lectus. Nulla mollis sapien luctus neque cursus tincidunt id sed leo. Sed suscipit sem sed finibus hendrerit.', 1, '2020-09-20 10:31:01', '2020-09-20 10:31:01'),
(2, '049dfe928d404ff897944a994aa61746', 'https://images.unsplash.com/photo-1587049693270-c7560da11218?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1000&q=80', 'Sayur Fresh', 'orem ipsum dolor sit amet, consectetur adipiscing elit. Nulla sapien nulla, dictum id efficitur vitae, euismod quis lectus. Nulla mollis sapien luctus neque cursus tincidunt id sed leo. Sed suscipit sem sed finibus hendrerit.', 1, '2020-09-20 10:31:01', '2020-09-20 10:31:01'),
(3, '42ea99598a8b6cc39d5bc7ef76ca8498', 'https://images.unsplash.com/photo-1587049693270-c7560da11218?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1000&q=80', 'Sayur Fresh', 'orem ipsum dolor sit amet, consectetur adipiscing elit. Nulla sapien nulla, dictum id efficitur vitae, euismod quis lectus. Nulla mollis sapien luctus neque cursus tincidunt id sed leo. Sed suscipit sem sed finibus hendrerit.', 1, '2020-09-20 10:31:02', '2020-09-20 10:31:02'),
(4, 'c85e3a250801e546e437bf1f2bd43b64', 'https://images.unsplash.com/photo-1587049693270-c7560da11218?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1000&q=80', 'Sayur Fresh', 'orem ipsum dolor sit amet, consectetur adipiscing elit. Nulla sapien nulla, dictum id efficitur vitae, euismod quis lectus. Nulla mollis sapien luctus neque cursus tincidunt id sed leo. Sed suscipit sem sed finibus hendrerit.', 1, '2020-09-20 10:31:03', '2020-09-20 10:31:03');

-- --------------------------------------------------------

--
-- Table structure for table `main_categories`
--

CREATE TABLE `main_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `main_category_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `delivery_type_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `caption` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `color` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `link` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `main_categories`
--

INSERT INTO `main_categories` (`id`, `main_category_id`, `delivery_type_id`, `title`, `caption`, `image`, `color`, `link`, `active`, `created_at`, `updated_at`) VALUES
(1, '7898df0c3e209cad60de137176ef7205', 'd33a2617639e4debd73b8c5696996e0b', 'Gas dan perlengkapan kompor', NULL, 'https://cdns.klimg.com/dream.co.id/resized/640x320/news/2019/10/31/121485/memasak-aman-dengan-bright-gas-191031h.jpg', '#fc0af0', NULL, 1, '2020-09-21 05:58:58', '2020-09-21 05:58:58'),
(2, 'bbcb7a4e2129486013d313759f3c183d', '5c5ab7bb9c8725a14b8a14a00e8a998b', 'Sayur, buah dan daging', NULL, 'https://images.unsplash.com/photo-1512621776951-a57141f2eefd?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1350&q=80', '#35ff1f', NULL, 1, '2020-09-21 05:58:58', '2020-09-21 05:58:58'),
(3, '12734174934f59dc196332770725a3fe', 'd33a2617639e4debd73b8c5696996e0b', 'Sembako', NULL, 'http://blog.sayurbox.com/wp-content/uploads/2020/04/paket-sembako-595x458.jpg', NULL, NULL, 1, '2020-09-21 05:58:58', '2020-09-21 05:58:58'),
(4, '0dd0ca593e8df9e0ddced122997a9e4c', 'd33a2617639e4debd73b8c5696996e0b', 'Pakaian', NULL, 'https://wp-en.oberlo.com/wp-content/uploads/2018/04/shutterstock_466589549.jpg', NULL, NULL, 1, '2020-09-21 05:58:58', '2020-09-21 05:58:58'),
(5, '0cd32ec530ed6a9e79874de8f4b09c09', 'd33a2617639e4debd73b8c5696996e0b', 'Hp dan Aksesoris', NULL, 'https://image.cnbcfm.com/api/v1/image/106105342-1567178289995screenshot2019-08-30at11.17.10am.png?v=1567178348&w=740&h=416', NULL, NULL, 1, '2020-09-21 05:58:58', '2020-09-21 05:58:58'),
(6, '418456b57a9a2eed2ada734bc32e16bc', 'd33a2617639e4debd73b8c5696996e0b', 'Desktop PC', NULL, 'https://assets.jalantikus.com/assets/cache/769/330/tips/2020/05/11/merakit-pc-gaming-3b5fa.jpg.webp', NULL, NULL, 1, '2020-09-21 05:58:58', '2020-09-21 05:58:58');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2016_06_01_000001_create_oauth_auth_codes_table', 1),
(2, '2016_06_01_000002_create_oauth_access_tokens_table', 1),
(3, '2016_06_01_000003_create_oauth_refresh_tokens_table', 1),
(4, '2016_06_01_000004_create_oauth_clients_table', 1),
(5, '2016_06_01_000005_create_oauth_personal_access_clients_table', 1),
(6, '2020_09_20_131924_create_customers_table', 1),
(7, '2020_09_20_173539_create_intro_sliders_table', 1),
(8, '2020_09_21_074413_create_banner_slides_table', 2),
(9, '2020_09_21_134213_create_main_categories_table', 3),
(10, '2020_09_21_141316_create_delivery_types_table', 4),
(11, '2020_09_21_173721_create_products_table', 5),
(12, '2020_09_21_175159_create_sub_categories_table', 6),
(13, '2020_09_22_152149_create_discounts_table', 7),
(14, '2020_09_22_174044_create_ratings_table', 8);

-- --------------------------------------------------------

--
-- Table structure for table `oauth_access_tokens`
--

CREATE TABLE `oauth_access_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_access_tokens`
--

INSERT INTO `oauth_access_tokens` (`id`, `user_id`, `client_id`, `name`, `scopes`, `revoked`, `created_at`, `updated_at`, `expires_at`) VALUES
('17eec1a2cb56ed6502f8e848b4769dcba8456e7a49cbbd1ac54ce23a341bf6ec47df26a0f8c5d8aa', 1, 2, 'Guest Access Token', '[]', 0, '2020-09-20 10:11:31', '2020-09-20 10:11:31', '2030-09-20 18:11:31'),
('1f4abad33845adb49bef31a0956badd2cea61fb3e57e605aee763c1b96408206a586c26e3188955d', 3, 2, 'Guest Access Token', '[]', 0, '2020-09-20 10:37:28', '2020-09-20 10:37:28', '2030-09-20 18:37:26'),
('4edb9465846b8e9fa32ccaa93cf28ca8b798b59ebd5ab995d737470b69843818c032ba3f52ab9eaa', 10, 2, 'Guest Access Token', '[]', 0, '2020-09-23 07:03:21', '2020-09-23 07:03:21', '2030-09-23 15:03:19'),
('6bf5d3213296821ee5d523411cdc6c2aaf832ae683604f546faf0781caae44ced0f37cd954606342', 9, 2, 'Guest Access Token', '[]', 0, '2020-09-23 00:17:09', '2020-09-23 00:17:09', '2030-09-23 08:17:06'),
('7f37e29a6de64a24da3d4370a85e744fddc151799431286d9a9585214b666d8816d3779ce3d1147e', 5, 2, 'Guest Access Token', '[]', 0, '2020-09-21 05:32:30', '2020-09-21 05:32:30', '2030-09-21 13:32:29'),
('830887336a48b4dd0fae38ad365ac12cbdb4eeed566322e267afe932d3a41fad10c126abd8f406c1', 2, 2, 'Guest Access Token', '[]', 0, '2020-09-20 10:14:48', '2020-09-20 10:14:48', '2030-09-20 18:14:47'),
('985f2be5ecba9a000db660ff6961717d58534d7bc9b25c4943cb565fa6916288cc134569420dfe0d', 8, 2, 'Guest Access Token', '[]', 0, '2020-09-22 21:22:24', '2020-09-22 21:22:24', '2030-09-23 05:22:22'),
('d1809c8601e6fedd17ceae03d9d2d2d2b51469fedacb5701a68db4ffc9fc027084053c45de11a5c3', 6, 2, 'Guest Access Token', '[]', 0, '2020-09-21 08:10:54', '2020-09-21 08:10:54', '2030-09-21 16:10:52'),
('d225e96b8bd66b37b909daa7da91f5a0462a83c448f797afc1f5decf46752fa0dd163ad3904db12a', 7, 2, 'Guest Access Token', '[]', 0, '2020-09-22 07:57:14', '2020-09-22 07:57:14', '2030-09-22 15:57:13'),
('f20dd1e92705c80aa353dfcccb27047dcc6d6a3c6c68e15fb1b4ed0f58ce5c990cb68324803a7b09', 4, 2, 'Guest Access Token', '[]', 0, '2020-09-20 23:10:43', '2020-09-20 23:10:43', '2030-09-21 07:10:43');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_auth_codes`
--

CREATE TABLE `oauth_auth_codes` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_clients`
--

CREATE TABLE `oauth_clients` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `secret` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `provider` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `redirect` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_clients`
--

INSERT INTO `oauth_clients` (`id`, `user_id`, `name`, `secret`, `provider`, `redirect`, `personal_access_client`, `password_client`, `revoked`, `created_at`, `updated_at`) VALUES
(1, NULL, 'Laravel Personal Access Client', 'VDtNgeAD7LP0aVS52igaA6sBQ9mZsM4FeXSElCpt', NULL, 'http://localhost', 1, 0, 0, '2020-09-20 10:04:56', '2020-09-20 10:04:56'),
(2, NULL, 'Laravel Personal Access Client', 'CFxU7nAEbF5vVnLdC5XyGrZVEBBPqdqViQaBMowo', NULL, 'http://localhost', 1, 0, 0, '2020-09-20 10:05:35', '2020-09-20 10:05:35'),
(3, NULL, 'Laravel Password Grant Client', 'FyfdIgAzkFPiErPxLV3paaCzXzKlF6Lj7iWylZK5', 'customers', 'http://localhost', 0, 1, 0, '2020-09-20 10:05:37', '2020-09-20 10:05:37');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_personal_access_clients`
--

CREATE TABLE `oauth_personal_access_clients` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_personal_access_clients`
--

INSERT INTO `oauth_personal_access_clients` (`id`, `client_id`, `created_at`, `updated_at`) VALUES
(1, 1, '2020-09-20 10:04:56', '2020-09-20 10:04:56'),
(2, 2, '2020-09-20 10:05:35', '2020-09-20 10:05:35');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_refresh_tokens`
--

CREATE TABLE `oauth_refresh_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `access_token_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sub_category_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cover` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `caption` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` decimal(12,0) NOT NULL,
  `tag` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `link` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `product_id`, `sub_category_id`, `cover`, `name`, `caption`, `price`, `tag`, `link`, `active`, `created_at`, `updated_at`) VALUES
(1, '55a127be4235f327f45801aa8d4ebce1', '62bd033591f2bd23e362d35279d33a08', 'https://source.unsplash.com/random/500x500', 'Produk Murah Bagus 0', NULL, '327024', NULL, NULL, 1, '2020-09-21 18:51:00', '2020-09-21 18:51:00'),
(2, '312139328654bce650f8062b0100d0f3', '62bd033591f2bd23e362d35279d33a08', 'https://source.unsplash.com/random/500x500', 'Produk Murah Bagus 1', NULL, '631864', NULL, NULL, 1, '2020-09-21 18:51:00', '2020-09-21 18:51:00'),
(3, 'cc3423a75cb9d9bbd5ea7aa948f9848b', '62bd033591f2bd23e362d35279d33a08', 'https://source.unsplash.com/random/500x500', 'Produk Murah Bagus 2', NULL, '438885', NULL, NULL, 1, '2020-09-21 18:51:00', '2020-09-21 18:51:00'),
(4, '7635c347fe965edadb2a719c6bc74657', '62bd033591f2bd23e362d35279d33a08', 'https://source.unsplash.com/random/500x500', 'Produk Murah Bagus 3', NULL, '51439', NULL, NULL, 1, '2020-09-21 18:51:00', '2020-09-21 18:51:00'),
(5, '445b8c87df4d5b797bc5e8bc0da9a870', '62bd033591f2bd23e362d35279d33a08', 'https://source.unsplash.com/random/500x500', 'Produk Murah Bagus 4', NULL, '47194', NULL, NULL, 1, '2020-09-21 18:51:00', '2020-09-21 18:51:00'),
(6, 'f2626a3473ab0cdab89b4a6985fe6f73', '62bd033591f2bd23e362d35279d33a08', 'https://source.unsplash.com/random/500x500', 'Produk Murah Bagus 5', NULL, '600933', NULL, NULL, 1, '2020-09-21 18:51:00', '2020-09-21 18:51:00'),
(7, 'c9678807c10aa42bfc01bd368155d3fa', '62bd033591f2bd23e362d35279d33a08', 'https://source.unsplash.com/random/500x500', 'Produk Murah Bagus 6', NULL, '868114', NULL, NULL, 1, '2020-09-21 18:51:00', '2020-09-21 18:51:00'),
(8, '9182b21912fa7e9fea998c27573ceaaa', '62bd033591f2bd23e362d35279d33a08', 'https://source.unsplash.com/random/500x500', 'Produk Murah Bagus 7', NULL, '339116', NULL, NULL, 1, '2020-09-21 18:51:00', '2020-09-21 18:51:00'),
(9, '0af99e9611c5c5f46478ea1373bd1d12', '62bd033591f2bd23e362d35279d33a08', 'https://source.unsplash.com/random/500x500', 'Produk Murah Bagus 8', NULL, '559785', NULL, NULL, 1, '2020-09-21 18:51:00', '2020-09-21 18:51:00'),
(10, '36176091421df13d9bb589fd3e79f8da', '62bd033591f2bd23e362d35279d33a08', 'https://source.unsplash.com/random/500x500', 'Produk Murah Bagus 9', NULL, '924131', NULL, NULL, 1, '2020-09-21 18:51:00', '2020-09-21 18:51:00'),
(11, '6bdfe85481f4bf6a4025de53cb10daa0', '62bd033591f2bd23e362d35279d33a08', 'https://source.unsplash.com/random/500x500', 'Produk Murah Bagus 10', NULL, '918002', NULL, NULL, 1, '2020-09-21 18:51:00', '2020-09-21 18:51:00'),
(12, 'b2c2c7f5d8841424d663ef42fb94609f', '62bd033591f2bd23e362d35279d33a08', 'https://source.unsplash.com/random/500x500', 'Produk Murah Bagus 11', NULL, '580086', NULL, NULL, 1, '2020-09-21 18:51:00', '2020-09-21 18:51:00'),
(13, 'ee1eac775c2535fe6e8ed7a732d44480', '62bd033591f2bd23e362d35279d33a08', 'https://source.unsplash.com/random/500x500', 'Produk Murah Bagus 12', NULL, '336084', NULL, NULL, 1, '2020-09-21 18:51:00', '2020-09-21 18:51:00'),
(14, 'e5923891550380df4ace382c3d95b7d6', '62bd033591f2bd23e362d35279d33a08', 'https://source.unsplash.com/random/500x500', 'Produk Murah Bagus 13', NULL, '808524', NULL, NULL, 1, '2020-09-21 18:51:00', '2020-09-21 18:51:00'),
(15, 'ca2d27f5c32e75fdf946381c14f93d72', '62bd033591f2bd23e362d35279d33a08', 'https://source.unsplash.com/random/500x500', 'Produk Murah Bagus 14', NULL, '401522', NULL, NULL, 1, '2020-09-21 18:51:00', '2020-09-21 18:51:00'),
(16, 'ce6c24dc516205f0c58588efaa552778', '62bd033591f2bd23e362d35279d33a08', 'https://source.unsplash.com/random/500x500', 'Produk Murah Bagus 15', NULL, '97369', NULL, NULL, 1, '2020-09-21 18:51:00', '2020-09-21 18:51:00'),
(17, '74bd4698da8da3cecdeeb400b9596d88', '62bd033591f2bd23e362d35279d33a08', 'https://source.unsplash.com/random/500x500', 'Produk Murah Bagus 16', NULL, '483876', NULL, NULL, 1, '2020-09-21 18:51:00', '2020-09-21 18:51:00'),
(18, '05e063bd8f1d152965f0f9973268f1fe', '62bd033591f2bd23e362d35279d33a08', 'https://source.unsplash.com/random/500x500', 'Produk Murah Bagus 17', NULL, '248478', NULL, NULL, 1, '2020-09-21 18:51:00', '2020-09-21 18:51:00'),
(19, '758c8d1cccc5cc6db35be5ac264c95ec', '62bd033591f2bd23e362d35279d33a08', 'https://source.unsplash.com/random/500x500', 'Produk Murah Bagus 18', NULL, '188049', NULL, NULL, 1, '2020-09-21 18:51:00', '2020-09-21 18:51:00'),
(20, 'e4e7267286015b324351779e95f1abc5', '62bd033591f2bd23e362d35279d33a08', 'https://source.unsplash.com/random/500x500', 'Produk Murah Bagus 19', NULL, '602270', NULL, NULL, 1, '2020-09-21 18:51:00', '2020-09-21 18:51:00'),
(21, '0f0605f0d919f822e13109a911330483', '62bd033591f2bd23e362d35279d33a08', 'https://source.unsplash.com/random/500x500', 'Produk Murah Bagus 20', NULL, '858337', NULL, NULL, 1, '2020-09-21 18:51:00', '2020-09-21 18:51:00'),
(22, 'f54155d653c2043e7d6eea6852db4336', '62bd033591f2bd23e362d35279d33a08', 'https://source.unsplash.com/random/500x500', 'Produk Murah Bagus 21', NULL, '39923', NULL, NULL, 1, '2020-09-21 18:51:00', '2020-09-21 18:51:00'),
(23, '1197c081f33e4776013fd3567a0c8677', '62bd033591f2bd23e362d35279d33a08', 'https://source.unsplash.com/random/500x500', 'Produk Murah Bagus 22', NULL, '323631', NULL, NULL, 1, '2020-09-21 18:51:00', '2020-09-21 18:51:00'),
(24, '778f54f7e6ef8ba99a78a8b718cb959c', '62bd033591f2bd23e362d35279d33a08', 'https://source.unsplash.com/random/500x500', 'Produk Murah Bagus 23', NULL, '261153', NULL, NULL, 1, '2020-09-21 18:51:00', '2020-09-21 18:51:00'),
(25, '28b99af8a55c48f9abdbb8f60c92af51', '62bd033591f2bd23e362d35279d33a08', 'https://source.unsplash.com/random/500x500', 'Produk Murah Bagus 24', NULL, '432627', NULL, NULL, 1, '2020-09-21 18:51:00', '2020-09-21 18:51:00'),
(26, '5b63548cfb00332601382e8c91a3930a', '62bd033591f2bd23e362d35279d33a08', 'https://source.unsplash.com/random/500x500', 'Produk Murah Bagus 25', NULL, '987381', NULL, NULL, 1, '2020-09-21 18:51:00', '2020-09-21 18:51:00'),
(27, '423ac631d9e3c7ee515a8ad45fd60ed3', '62bd033591f2bd23e362d35279d33a08', 'https://source.unsplash.com/random/500x500', 'Produk Murah Bagus 26', NULL, '685344', NULL, NULL, 1, '2020-09-21 18:51:00', '2020-09-21 18:51:00'),
(28, '099fa774235270c999be042d46624af0', '62bd033591f2bd23e362d35279d33a08', 'https://source.unsplash.com/random/500x500', 'Produk Murah Bagus 27', NULL, '492427', NULL, NULL, 1, '2020-09-21 18:51:00', '2020-09-21 18:51:00'),
(29, 'c3554a1bcfe8a37140d67d843733a46d', '62bd033591f2bd23e362d35279d33a08', 'https://source.unsplash.com/random/500x500', 'Produk Murah Bagus 28', NULL, '886140', NULL, NULL, 1, '2020-09-21 18:51:00', '2020-09-21 18:51:00'),
(30, '9c9cf498dea2bad1a76eba79b3d03e62', '62bd033591f2bd23e362d35279d33a08', 'https://source.unsplash.com/random/500x500', 'Produk Murah Bagus 29', NULL, '683523', NULL, NULL, 1, '2020-09-21 18:51:00', '2020-09-21 18:51:00'),
(31, 'e7045968e42f74b57a73499e3cb1655c', '62bd033591f2bd23e362d35279d33a08', 'https://source.unsplash.com/random/500x500', 'Produk Murah Bagus 30', NULL, '292061', NULL, NULL, 1, '2020-09-21 18:51:00', '2020-09-21 18:51:00'),
(32, '167f0c54164e8b05ac25935aa64aed77', '62bd033591f2bd23e362d35279d33a08', 'https://source.unsplash.com/random/500x500', 'Produk Murah Bagus 31', NULL, '327659', NULL, NULL, 1, '2020-09-21 18:51:00', '2020-09-21 18:51:00'),
(33, '224e841fd8b40a76dca3dfdba2274bb1', '62bd033591f2bd23e362d35279d33a08', 'https://source.unsplash.com/random/500x500', 'Produk Murah Bagus 32', NULL, '805653', NULL, NULL, 1, '2020-09-21 18:51:00', '2020-09-21 18:51:00'),
(34, '2138be5594e81f3835667b00672fedc0', '62bd033591f2bd23e362d35279d33a08', 'https://source.unsplash.com/random/500x500', 'Produk Murah Bagus 33', NULL, '332694', NULL, NULL, 1, '2020-09-21 18:51:00', '2020-09-21 18:51:00'),
(35, 'ff14fe991c61e41445439bb845b9588d', '62bd033591f2bd23e362d35279d33a08', 'https://source.unsplash.com/random/500x500', 'Produk Murah Bagus 34', NULL, '264759', NULL, NULL, 1, '2020-09-21 18:51:00', '2020-09-21 18:51:00'),
(36, '7e37469ef3ccac9bde3d1787d63ee88f', '62bd033591f2bd23e362d35279d33a08', 'https://source.unsplash.com/random/500x500', 'Produk Murah Bagus 35', NULL, '859413', NULL, NULL, 1, '2020-09-21 18:51:00', '2020-09-21 18:51:00'),
(37, '6a0c19c9b456e6945108e751a6a0ca44', '62bd033591f2bd23e362d35279d33a08', 'https://source.unsplash.com/random/500x500', 'Produk Murah Bagus 36', NULL, '228714', NULL, NULL, 1, '2020-09-21 18:51:00', '2020-09-21 18:51:00'),
(38, 'f6a17ab64240a34728b234560e5856b0', '62bd033591f2bd23e362d35279d33a08', 'https://source.unsplash.com/random/500x500', 'Produk Murah Bagus 37', NULL, '864100', NULL, NULL, 1, '2020-09-21 18:51:00', '2020-09-21 18:51:00'),
(39, '543afc500426cb5426e9ae62ccac5922', '62bd033591f2bd23e362d35279d33a08', 'https://source.unsplash.com/random/500x500', 'Produk Murah Bagus 38', NULL, '441038', NULL, NULL, 1, '2020-09-21 18:51:00', '2020-09-21 18:51:00'),
(40, '4a18fc329b56aadea8c2537807751f1d', '62bd033591f2bd23e362d35279d33a08', 'https://source.unsplash.com/random/500x500', 'Produk Murah Bagus 39', NULL, '245645', NULL, NULL, 1, '2020-09-21 18:51:00', '2020-09-21 18:51:00'),
(41, 'f1458e6bbf33edd96bfaf6150c295218', '62bd033591f2bd23e362d35279d33a08', 'https://source.unsplash.com/random/500x500', 'Produk Murah Bagus 40', NULL, '233678', NULL, NULL, 1, '2020-09-21 18:51:00', '2020-09-21 18:51:00'),
(42, '3af34a4ec00c8baa701c449db91acaa4', '62bd033591f2bd23e362d35279d33a08', 'https://source.unsplash.com/random/500x500', 'Produk Murah Bagus 41', NULL, '655727', NULL, NULL, 1, '2020-09-21 18:51:00', '2020-09-21 18:51:00'),
(43, 'a23d639933740b0a8941e9ca44aa3cc1', '62bd033591f2bd23e362d35279d33a08', 'https://source.unsplash.com/random/500x500', 'Produk Murah Bagus 42', NULL, '484153', NULL, NULL, 1, '2020-09-21 18:51:00', '2020-09-21 18:51:00'),
(44, 'eddb93ea1a08b621ee2aa4791611cdad', '62bd033591f2bd23e362d35279d33a08', 'https://source.unsplash.com/random/500x500', 'Produk Murah Bagus 43', NULL, '194460', NULL, NULL, 1, '2020-09-21 18:51:00', '2020-09-21 18:51:00'),
(45, 'f400fdc28193a1e93d6ea2ea83faef49', '62bd033591f2bd23e362d35279d33a08', 'https://source.unsplash.com/random/500x500', 'Produk Murah Bagus 44', NULL, '164864', NULL, NULL, 1, '2020-09-21 18:51:00', '2020-09-21 18:51:00'),
(46, 'de6a85100508092a21016934fa2b2cef', '62bd033591f2bd23e362d35279d33a08', 'https://source.unsplash.com/random/500x500', 'Produk Murah Bagus 45', NULL, '631445', NULL, NULL, 1, '2020-09-21 18:51:00', '2020-09-21 18:51:00'),
(47, 'fcb0ae07fe9ef66c6a81e5b4e808812b', '62bd033591f2bd23e362d35279d33a08', 'https://source.unsplash.com/random/500x500', 'Produk Murah Bagus 46', NULL, '89584', NULL, NULL, 1, '2020-09-21 18:51:00', '2020-09-21 18:51:00'),
(48, '72089c680ddb09689f469871886f0231', '62bd033591f2bd23e362d35279d33a08', 'https://source.unsplash.com/random/500x500', 'Produk Murah Bagus 47', NULL, '965562', NULL, NULL, 1, '2020-09-21 18:51:00', '2020-09-21 18:51:00'),
(49, '951377c349a92c76c260b9a377856d5f', '62bd033591f2bd23e362d35279d33a08', 'https://source.unsplash.com/random/500x500', 'Produk Murah Bagus 48', NULL, '379121', NULL, NULL, 1, '2020-09-21 18:51:00', '2020-09-21 18:51:00'),
(50, '8e3922aee6bc094d96c18b267e69b428', '62bd033591f2bd23e362d35279d33a08', 'https://source.unsplash.com/random/500x500', 'Produk Murah Bagus 49', NULL, '244202', NULL, NULL, 1, '2020-09-21 18:51:00', '2020-09-21 18:51:00'),
(51, '6cf4a2b90308e057d64ec4481f0aae8a', '62bd033591f2bd23e362d35279d33a08', 'https://source.unsplash.com/random/500x500', 'Produk Murah Bagus 50', NULL, '543101', NULL, NULL, 1, '2020-09-21 18:51:00', '2020-09-21 18:51:00');

-- --------------------------------------------------------

--
-- Table structure for table `ratings`
--

CREATE TABLE `ratings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `rating_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `relation_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `star` enum('1','2','3','4','5') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '5',
  `comment` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sub_categories`
--

CREATE TABLE `sub_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `sub_category_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `main_category_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `caption` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `color` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `link` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sub_categories`
--

INSERT INTO `sub_categories` (`id`, `sub_category_id`, `main_category_id`, `title`, `caption`, `image`, `color`, `link`, `active`, `created_at`, `updated_at`) VALUES
(1, '62bd033591f2bd23e362d35279d33a08', '7898df0c3e209cad60de137176ef7205', 'Sub Kategori 0', NULL, 'https://res.cloudinary.com/vjtechsolution/image/upload/v1600713849/mock/fish-and-chips.png', NULL, NULL, 1, '2020-09-21 10:46:08', '2020-09-21 10:46:08'),
(2, '3456a9476ffc6a912eba9df7107ff87a', '7898df0c3e209cad60de137176ef7205', 'Sub Kategori 1', NULL, 'https://res.cloudinary.com/vjtechsolution/image/upload/v1600713849/mock/fish-and-chips.png', NULL, NULL, 1, '2020-09-21 10:46:08', '2020-09-21 10:46:08'),
(3, 'f666fa9f1ae9e97b11850b0905e18f23', '7898df0c3e209cad60de137176ef7205', 'Sub Kategori 2', NULL, 'https://res.cloudinary.com/vjtechsolution/image/upload/v1600713849/mock/fish-and-chips.png', NULL, NULL, 1, '2020-09-21 10:46:08', '2020-09-21 10:46:08'),
(4, '2cf1c51409a09b0f1c91ec7c8b6c21bc', '7898df0c3e209cad60de137176ef7205', 'Sub Kategori 3', NULL, 'https://res.cloudinary.com/vjtechsolution/image/upload/v1600713849/mock/fish-and-chips.png', NULL, NULL, 1, '2020-09-21 10:46:08', '2020-09-21 10:46:08'),
(5, 'c3254dc558c135768e199498f0c8ef17', '7898df0c3e209cad60de137176ef7205', 'Sub Kategori 4', NULL, 'https://res.cloudinary.com/vjtechsolution/image/upload/v1600713849/mock/fish-and-chips.png', NULL, NULL, 1, '2020-09-21 10:46:08', '2020-09-21 10:46:08'),
(6, 'c2db80cbab66d54ec1f5a6135a252980', '7898df0c3e209cad60de137176ef7205', 'Sub Kategori 5', NULL, 'https://res.cloudinary.com/vjtechsolution/image/upload/v1600713849/mock/fish-and-chips.png', NULL, NULL, 1, '2020-09-21 10:46:08', '2020-09-21 10:46:08'),
(7, '20a036848bbde574f35cf87e272c155f', '7898df0c3e209cad60de137176ef7205', 'Sub Kategori 6', NULL, 'https://res.cloudinary.com/vjtechsolution/image/upload/v1600713849/mock/fish-and-chips.png', NULL, NULL, 1, '2020-09-21 10:46:08', '2020-09-21 10:46:08'),
(8, '61924e79b4809b1eecbafb1f5fe401ec', '7898df0c3e209cad60de137176ef7205', 'Sub Kategori 7', NULL, 'https://res.cloudinary.com/vjtechsolution/image/upload/v1600713849/mock/fish-and-chips.png', NULL, NULL, 1, '2020-09-21 10:46:08', '2020-09-21 10:46:08'),
(9, '3b9f754a3d44821ccd2abaa704156b2b', '7898df0c3e209cad60de137176ef7205', 'Sub Kategori 8', NULL, 'https://res.cloudinary.com/vjtechsolution/image/upload/v1600713849/mock/fish-and-chips.png', NULL, NULL, 1, '2020-09-21 10:46:08', '2020-09-21 10:46:08'),
(10, 'd9806a17948f7517327abb81654e62b5', '7898df0c3e209cad60de137176ef7205', 'Sub Kategori 9', NULL, 'https://res.cloudinary.com/vjtechsolution/image/upload/v1600713849/mock/fish-and-chips.png', NULL, NULL, 1, '2020-09-21 10:46:08', '2020-09-21 10:46:08'),
(11, '941d8a3fc84c1772798a493da8db62fb', '7898df0c3e209cad60de137176ef7205', 'Sub Kategori 10', NULL, 'https://res.cloudinary.com/vjtechsolution/image/upload/v1600713849/mock/fish-and-chips.png', NULL, NULL, 1, '2020-09-21 10:46:08', '2020-09-21 10:46:08');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `banner_slides`
--
ALTER TABLE `banner_slides`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `delivery_types`
--
ALTER TABLE `delivery_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `discounts`
--
ALTER TABLE `discounts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `intro_sliders`
--
ALTER TABLE `intro_sliders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `main_categories`
--
ALTER TABLE `main_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oauth_access_tokens`
--
ALTER TABLE `oauth_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_access_tokens_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_auth_codes`
--
ALTER TABLE `oauth_auth_codes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_auth_codes_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_clients_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oauth_refresh_tokens`
--
ALTER TABLE `oauth_refresh_tokens`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ratings`
--
ALTER TABLE `ratings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sub_categories`
--
ALTER TABLE `sub_categories`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `banner_slides`
--
ALTER TABLE `banner_slides`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `delivery_types`
--
ALTER TABLE `delivery_types`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `discounts`
--
ALTER TABLE `discounts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `intro_sliders`
--
ALTER TABLE `intro_sliders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `main_categories`
--
ALTER TABLE `main_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;

--
-- AUTO_INCREMENT for table `ratings`
--
ALTER TABLE `ratings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sub_categories`
--
ALTER TABLE `sub_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
