-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jun 06, 2024 at 10:32 AM
-- Server version: 8.0.30
-- PHP Version: 8.3.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ptclab_new_buer`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `username` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `name`, `email`, `username`, `email_verified_at`, `image`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Super Admin', 'admin@site.com', 'admin', NULL, '66614d4c92b021717652812.png', '$2y$12$1KiTN9XomHiv0sHfpZopfuE/YPa.B2hs5S.SGC7ERpQdq44.c4aG.', 'LFnIWH1T7AS1lpzl0RGtKNvqP1moBYH9he1ozJec4TtdigUkJkDBP2QjrXmX', NULL, '2024-06-05 23:46:52');

-- --------------------------------------------------------

--
-- Table structure for table `admin_notifications`
--

CREATE TABLE `admin_notifications` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` int UNSIGNED NOT NULL DEFAULT '0',
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_read` tinyint(1) NOT NULL DEFAULT '0',
  `click_url` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `admin_password_resets`
--

CREATE TABLE `admin_password_resets` (
  `id` bigint UNSIGNED NOT NULL,
  `email` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `token` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `owner` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `commission_logs`
--

CREATE TABLE `commission_logs` (
  `id` bigint UNSIGNED NOT NULL,
  `to_id` int NOT NULL DEFAULT '0',
  `from_id` int NOT NULL DEFAULT '0',
  `level` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` decimal(11,2) NOT NULL,
  `type` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `details` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `trx` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `deposits`
--

CREATE TABLE `deposits` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` int UNSIGNED NOT NULL DEFAULT '0',
  `plan_id` int UNSIGNED NOT NULL DEFAULT '0',
  `method_code` int UNSIGNED NOT NULL DEFAULT '0',
  `amount` decimal(28,8) NOT NULL DEFAULT '0.00000000',
  `method_currency` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `charge` decimal(28,8) NOT NULL DEFAULT '0.00000000',
  `rate` decimal(28,8) NOT NULL DEFAULT '0.00000000',
  `final_amount` decimal(28,8) NOT NULL DEFAULT '0.00000000',
  `detail` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `btc_amount` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `btc_wallet` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `trx` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_try` int NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '1=>success, 2=>pending, 3=>cancel',
  `from_api` tinyint(1) NOT NULL DEFAULT '0',
  `admin_feedback` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `success_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `failed_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_cron` int DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `device_tokens`
--

CREATE TABLE `device_tokens` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` int UNSIGNED NOT NULL DEFAULT '0',
  `is_app` tinyint(1) NOT NULL DEFAULT '0',
  `token` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `extensions`
--

CREATE TABLE `extensions` (
  `id` bigint UNSIGNED NOT NULL,
  `act` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `script` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `shortcode` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT 'object',
  `support` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT 'help section',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1=>enable, 2=>disable',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `extensions`
--

INSERT INTO `extensions` (`id`, `act`, `name`, `description`, `image`, `script`, `shortcode`, `support`, `status`, `created_at`, `updated_at`) VALUES
(1, 'tawk-chat', 'Tawk.to', 'Key location is shown bellow', 'tawky_big.png', '<script>\r\n                        var Tawk_API=Tawk_API||{}, Tawk_LoadStart=new Date();\r\n                        (function(){\r\n                        var s1=document.createElement(\"script\"),s0=document.getElementsByTagName(\"script\")[0];\r\n                        s1.async=true;\r\n                        s1.src=\"https://embed.tawk.to/{{app_key}}\";\r\n                        s1.charset=\"UTF-8\";\r\n                        s1.setAttribute(\"crossorigin\",\"*\");\r\n                        s0.parentNode.insertBefore(s1,s0);\r\n                        })();\r\n                    </script>', '{\"app_key\":{\"title\":\"App Key\",\"value\":\"------\"}}', 'twak.png', 0, '2019-10-18 23:16:05', '2022-03-22 05:22:24'),
(2, 'google-recaptcha2', 'Google Recaptcha 2', 'Key location is shown bellow', 'recaptcha3.png', '\n<script src=\"https://www.google.com/recaptcha/api.js\"></script>\n<div class=\"g-recaptcha\" data-sitekey=\"{{site_key}}\" data-callback=\"verifyCaptcha\"></div>\n<div id=\"g-recaptcha-error\"></div>', '{\"site_key\":{\"title\":\"Site Key\",\"value\":\"---------------\"},\"secret_key\":{\"title\":\"Secret Key\",\"value\":\"---------------\"}}', 'recaptcha.png', 0, '2019-10-18 23:16:05', '2024-06-05 23:48:45'),
(3, 'custom-captcha', 'Custom Captcha', 'Just put any random string', 'customcaptcha.png', NULL, '{\"random_key\":{\"title\":\"Random String\",\"value\":\"-----\"}}', 'na', 0, '2019-10-18 23:16:05', '2022-05-08 00:25:27'),
(4, 'google-analytics', 'Google Analytics', 'Key location is shown bellow', 'google_analytics.png', '<script async src=\"https://www.googletagmanager.com/gtag/js?id={{measurement_id}}\"></script>\n                <script>\n                  window.dataLayer = window.dataLayer || [];\n                  function gtag(){dataLayer.push(arguments);}\n                  gtag(\"js\", new Date());\n                \n                  gtag(\"config\", \"{{measurement_id}}\");\n                </script>', '{\"measurement_id\":{\"title\":\"Measurement ID\",\"value\":\"------\"}}', 'ganalytics.png', 0, NULL, '2021-05-04 10:19:12'),
(5, 'fb-comment', 'Facebook Comment ', 'Key location is shown bellow', 'Facebook.png', '<div id=\"fb-root\"></div><script async defer crossorigin=\"anonymous\" src=\"https://connect.facebook.net/en_GB/sdk.js#xfbml=1&version=v4.0&appId={{app_key}}&autoLogAppEvents=1\"></script>', '{\"app_key\":{\"title\":\"App Key\",\"value\":\"----\"}}', 'fb_com.png', 0, NULL, '2022-04-28 04:38:36');

-- --------------------------------------------------------

--
-- Table structure for table `forms`
--

CREATE TABLE `forms` (
  `id` bigint UNSIGNED NOT NULL,
  `act` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `form_data` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `forms`
--

INSERT INTO `forms` (`id`, `act`, `form_data`, `created_at`, `updated_at`) VALUES
(7, 'kyc', '{\"full_name\":{\"name\":\"Full Name\",\"label\":\"full_name\",\"is_required\":\"required\",\"extensions\":null,\"options\":[],\"type\":\"text\"},\"nid_number\":{\"name\":\"NID Number\",\"label\":\"nid_number\",\"is_required\":\"required\",\"extensions\":null,\"options\":[],\"type\":\"text\"},\"gender\":{\"name\":\"Gender\",\"label\":\"gender\",\"is_required\":\"required\",\"extensions\":null,\"options\":[\"Male\",\"Female\",\"Others\"],\"type\":\"select\"},\"you_hobby\":{\"name\":\"You Hobby\",\"label\":\"you_hobby\",\"is_required\":\"required\",\"extensions\":null,\"options\":[\"Programming\",\"Gardening\",\"Traveling\",\"Others\"],\"type\":\"checkbox\"},\"nid_photo\":{\"name\":\"NID Photo\",\"label\":\"nid_photo\",\"is_required\":\"required\",\"extensions\":\"jpg,png\",\"options\":[],\"type\":\"file\"}}', '2022-03-17 02:56:14', '2022-04-11 03:23:40');

-- --------------------------------------------------------

--
-- Table structure for table `frontends`
--

CREATE TABLE `frontends` (
  `id` bigint UNSIGNED NOT NULL,
  `data_keys` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `data_values` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `seo_content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `tempname` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `view` int NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `frontends`
--

INSERT INTO `frontends` (`id`, `data_keys`, `data_values`, `seo_content`, `tempname`, `slug`, `view`, `created_at`, `updated_at`) VALUES
(1, 'seo.data', '{\"seo_image\":\"1\",\"keywords\":[\"ppc\",\"ptc\",\"pay per click\",\"earn money\",\"ppv\",\"pey per view\",\"paid click\",\"earn per click\",\"ptclab\"],\"description\":\"PTCLab is a complete and ultimate PHP Script for Pay Per Click Platform. It developed with Laravel and Bootstrap 5\\r\\n.\",\"social_title\":\"PTCLab - Pay Per Click Platform\",\"social_description\":\"PTCLab is a complete and ultimate PHP Script for Pay Per Click Platform. It developed with Laravel and Bootstrap 5.\",\"image\":\"66614f8ecc01d1717653390.png\"}', NULL, 'globals', '', 0, '2020-07-04 23:42:52', '2024-06-05 23:57:18'),
(41, 'cookie.data', '{\"short_desc\":\"We may use cookies or any other tracking technologies when you visit our website, including any other media form, mobile website, or mobile application related or connected to help customize the Site and improve your experience.\",\"description\":\"<div class=\\\"mb-5\\\" style=\\\"color: rgb(111, 111, 111); font-family: Nunito, sans-serif; margin-bottom: 3rem !important;\\\"><h3 class=\\\"mb-3\\\" style=\\\"font-weight: 600; line-height: 1.3; font-size: 24px; font-family: Exo, sans-serif; color: rgb(54, 54, 54);\\\">What information do we collect?<\\/h3><p class=\\\"font-18\\\" style=\\\"margin-right: 0px; margin-left: 0px; font-size: 18px !important;\\\">We gather data from you when you register on our site, submit a request, buy any services, react to an overview, or round out a structure. At the point when requesting any assistance or enrolling on our site, as suitable, you might be approached to enter your: name, email address, or telephone number. You may, nonetheless, visit our site anonymously.<\\/p><\\/div><div class=\\\"mb-5\\\" style=\\\"color: rgb(111, 111, 111); font-family: Nunito, sans-serif; margin-bottom: 3rem !important;\\\"><h3 class=\\\"mb-3\\\" style=\\\"font-weight: 600; line-height: 1.3; font-size: 24px; font-family: Exo, sans-serif; color: rgb(54, 54, 54);\\\">How do we protect your information?<\\/h3><p class=\\\"font-18\\\" style=\\\"margin-right: 0px; margin-left: 0px; font-size: 18px !important;\\\">All provided delicate\\/credit data is sent through Stripe.<br>After an exchange, your private data (credit cards, social security numbers, financials, and so on) won\'t be put away on our workers.<\\/p><\\/div><div class=\\\"mb-5\\\" style=\\\"color: rgb(111, 111, 111); font-family: Nunito, sans-serif; margin-bottom: 3rem !important;\\\"><h3 class=\\\"mb-3\\\" style=\\\"font-weight: 600; line-height: 1.3; font-size: 24px; font-family: Exo, sans-serif; color: rgb(54, 54, 54);\\\">Do we disclose any information to outside parties?<\\/h3><p class=\\\"font-18\\\" style=\\\"margin-right: 0px; margin-left: 0px; font-size: 18px !important;\\\">We don\'t sell, exchange, or in any case move to outside gatherings by and by recognizable data. This does exclude confided in outsiders who help us in working our site, leading our business, or adjusting you, since those gatherings consent to keep this data private. We may likewise deliver your data when we accept discharge is suitable to follow the law, implement our site strategies, or ensure our own or others\' rights, property, or wellbeing.<\\/p><\\/div><div class=\\\"mb-5\\\" style=\\\"color: rgb(111, 111, 111); font-family: Nunito, sans-serif; margin-bottom: 3rem !important;\\\"><h3 class=\\\"mb-3\\\" style=\\\"font-weight: 600; line-height: 1.3; font-size: 24px; font-family: Exo, sans-serif; color: rgb(54, 54, 54);\\\">Children\'s Online Privacy Protection Act Compliance<\\/h3><p class=\\\"font-18\\\" style=\\\"margin-right: 0px; margin-left: 0px; font-size: 18px !important;\\\">We are consistent with the prerequisites of COPPA (Children\'s Online Privacy Protection Act), we don\'t gather any data from anybody under 13 years old. Our site, items, and administrations are completely coordinated to individuals who are in any event 13 years of age or more established.<\\/p><\\/div><div class=\\\"mb-5\\\" style=\\\"color: rgb(111, 111, 111); font-family: Nunito, sans-serif; margin-bottom: 3rem !important;\\\"><h3 class=\\\"mb-3\\\" style=\\\"font-weight: 600; line-height: 1.3; font-size: 24px; font-family: Exo, sans-serif; color: rgb(54, 54, 54);\\\">Changes to our Privacy Policy<\\/h3><p class=\\\"font-18\\\" style=\\\"margin-right: 0px; margin-left: 0px; font-size: 18px !important;\\\">If we decide to change our privacy policy, we will post those changes on this page.<\\/p><\\/div><div class=\\\"mb-5\\\" style=\\\"color: rgb(111, 111, 111); font-family: Nunito, sans-serif; margin-bottom: 3rem !important;\\\"><h3 class=\\\"mb-3\\\" style=\\\"font-weight: 600; line-height: 1.3; font-size: 24px; font-family: Exo, sans-serif; color: rgb(54, 54, 54);\\\">How long we retain your information?<\\/h3><p class=\\\"font-18\\\" style=\\\"margin-right: 0px; margin-left: 0px; font-size: 18px !important;\\\">At the point when you register for our site, we cycle and keep your information we have about you however long you don\'t erase the record or withdraw yourself (subject to laws and guidelines).<\\/p><\\/div><div class=\\\"mb-5\\\" style=\\\"color: rgb(111, 111, 111); font-family: Nunito, sans-serif; margin-bottom: 3rem !important;\\\"><h3 class=\\\"mb-3\\\" style=\\\"font-weight: 600; line-height: 1.3; font-size: 24px; font-family: Exo, sans-serif; color: rgb(54, 54, 54);\\\">What we don\\u2019t do with your data<\\/h3><p class=\\\"font-18\\\" style=\\\"margin-right: 0px; margin-left: 0px; font-size: 18px !important;\\\">We don\'t and will never share, unveil, sell, or in any case give your information to different organizations for the promoting of their items or administrations.<\\/p><\\/div>\",\"status\":1}', NULL, 'globals', NULL, 0, '2020-07-04 23:42:52', '2022-03-30 11:23:12'),
(44, 'maintenance.data', '{\"description\":\"<h2 style=\\\"text-align:center;\\\"><span><font size=\\\"6\\\">We\'re just tuning up a few things.<\\/font><\\/span><\\/h2>We apologize for the inconvenience but Front is currently undergoing planned maintenance. Thanks for your patience.\",\"image\":\"66602f11d2cd91717579537.png\"}', NULL, 'globals', NULL, 0, '2020-07-04 23:42:52', '2024-06-05 09:25:37'),
(45, 'banner.element', '{\"has_image\":\"1\",\"heading\":\"Best Possible Way for Earn From Home\",\"subheading\":\"Lorem ipsum dolor sit, amet consectetur adipisicing elit. Doloribus necessitatibus repudiandae porro reprehenderit, beatae perferendis repellat quo ipsa omnis, vitae!\",\"button_1\":\"Sign Up\",\"button_1_url\":\"register\",\"button_2\":\"Sign In\",\"button_2_url\":\"login\",\"image\":\"6263b9309981d1650702640.png\"}', NULL, 'basic', NULL, 0, '2022-04-23 07:00:40', '2022-04-23 07:00:42'),
(46, 'banner.element', '{\"has_image\":\"1\",\"heading\":\"Start Earning From The Comfort of Home\",\"subheading\":\"Lorem ipsum dolor sit, amet consectetur adipisicing elit. Doloribus necessitatibus repudiandae porro reprehenderit, beatae perferendis repellat quo ipsa omnis, vitae!\",\"button_1\":\"Login\",\"button_1_url\":\"login\",\"button_2\":\"Register\",\"button_2_url\":\"register\",\"image\":\"6263b954969731650702676.png\"}', NULL, 'basic', NULL, 0, '2022-04-23 07:01:16', '2022-04-23 07:01:18'),
(47, 'about.content', '{\"has_image\":\"1\",\"heading\":\"About PTCLab\",\"description\":\"<p style=\\\"margin-top:15px;margin-right:0px;margin-left:0px;color:rgb(111,111,111);font-size:16px;font-family:Roboto, sans-serif;\\\">\\u00a0Best Possible Way for Earn From Home. Temporibus eveniet commodi obcaecati voluptates reiciendis quis ipsum incidunt quibusdam aperiam autem suscipit maiores temporTemporibus eveniet commodi obcaecati voluptates reiciendis quis ipsum incidunt quibusdam aperiam autem suscipit maiores tempora impedit, exercitationem ratione distinctio nulla magni nemo cumque inventore sapiente nisi at vel. Laborum suscipit fuga.<\\/p><ul class=\\\"cmn-list\\\" style=\\\"margin-top:20px;font-family:Roboto, sans-serif;\\\"><li style=\\\"color:rgb(111,111,111);margin-top:0px;margin-right:0px;margin-left:0px;font-size:16px;line-height:1.7;padding-left:40px;\\\">Dolores velit ad excepturi omnis quod nesciunt.<\\/li><li style=\\\"color:rgb(111,111,111);margin-top:15px;margin-right:0px;margin-left:0px;font-size:16px;line-height:1.7;padding-left:40px;\\\">Cumque non labore recusandae, eaque quo sint.<\\/li><li style=\\\"color:rgb(111,111,111);margin-top:15px;margin-right:0px;margin-left:0px;font-size:16px;line-height:1.7;padding-left:40px;\\\">Accusamus facere possimus illum, nulla nemo dolores.<\\/li><li style=\\\"color:rgb(111,111,111);margin-top:15px;margin-right:0px;margin-left:0px;font-size:16px;line-height:1.7;padding-left:40px;\\\">Seriores nisi iure consequatur incidunt aliquam sunt.<\\/li><\\/ul>\",\"video_url\":\"https:\\/\\/www.youtube.com\\/embed\\/WOb4cj7izpE\",\"video_button_icon\":\"<i class=\\\"las la-play-circle\\\"><\\/i>\",\"image\":\"6263ba6f2de1c1650702959.png\"}', NULL, 'basic', NULL, 0, '2022-04-23 07:05:59', '2022-04-23 07:11:30'),
(48, 'features.content', '{\"heading\":\"Benefits And Facilities\",\"subheading\":\"Lorem ipsum dolor sit, amet consectetur adipisicing elit. Doloribus necessitatibus repudiandae porro reprehenderit, beatae perferendis repellat quo ipsa omnis, vitae!\"}', NULL, 'basic', NULL, 0, '2022-04-23 07:17:22', '2022-04-23 07:17:23'),
(49, 'features.element', '{\"icon\":\"<i class=\\\"fas fa-globe-africa\\\"><\\/i>\",\"title\":\"We\'re Global\",\"content\":\"Voluptatibus at vero, amet sit esse sequi quam odio debitis. Nulla porro tenetur adipisci laborum sunt repellendus error, asperiores quam nobis sit!\"}', NULL, 'basic', NULL, 0, '2022-04-23 07:17:55', '2022-04-23 07:17:55'),
(50, 'features.element', '{\"icon\":\"<i class=\\\"fas fa-headset\\\"><\\/i>\",\"title\":\"Best Support\",\"content\":\"Voluptatibus at vero, amet sit esse sequi quam odio debitis. Nulla porro tenetur adipisci laborum sunt repellendus error, asperiores quam nobis sit!\"}', NULL, 'basic', NULL, 0, '2022-04-23 07:19:04', '2022-04-23 07:19:04'),
(51, 'features.element', '{\"icon\":\"<i class=\\\"lab la-bitcoin\\\"><\\/i>\",\"title\":\"We Accept Crypto\",\"content\":\"Voluptatibus at vero, amet sit esse sequi quam odio debitis. Nulla porro tenetur adipisci laborum sunt repellendus error, asperiores quam nobis sit!\"}', NULL, 'basic', NULL, 0, '2022-04-23 07:20:19', '2022-04-23 07:20:20'),
(52, 'features.element', '{\"icon\":\"<i class=\\\"fas fa-chart-area\\\"><\\/i>\",\"title\":\"We\'re Profitable\",\"content\":\"Voluptatibus at vero, amet sit esse sequi quam odio debitis. Nulla porro tenetur adipisci laborum sunt repellendus error, asperiores quam nobis sit!\"}', NULL, 'basic', NULL, 0, '2022-04-23 07:21:09', '2022-04-23 07:21:09'),
(53, 'features.element', '{\"icon\":\"<i class=\\\"fas fa-lock\\\"><\\/i>\",\"title\":\"We\'re Secure\",\"content\":\"Voluptatibus at vero, amet sit esse sequi quam odio debitis. Nulla porro tenetur adipisci laborum sunt repellendus error, asperiores quam nobis sit!\"}', NULL, 'basic', NULL, 0, '2022-04-23 07:21:25', '2022-04-23 07:21:25'),
(54, 'features.element', '{\"icon\":\"<i class=\\\"fas fa-copy\\\"><\\/i>\",\"title\":\"We\'re Certified\",\"content\":\"Voluptatibus at vero, amet sit esse sequi quam odio debitis. Nulla porro tenetur adipisci laborum sunt repellendus error, asperiores quam nobis sit!\"}', NULL, 'basic', NULL, 0, '2022-04-23 07:21:43', '2022-04-23 07:21:43'),
(55, 'plan.content', '{\"heading\":\"Membership Plans\",\"subheading\":\"Lorem ipsum dolor sit, amet consectetur adipisicing elit. Doloribus necessitatibus repudiandae porro reprehenderit, beatae perferendis repellat quo ipsa omnis, vitae!\"}', NULL, 'basic', NULL, 0, '2022-04-23 07:24:18', '2022-04-23 07:24:18'),
(56, 'counter.content', '{\"has_image\":\"1\",\"heading\":\"Best Place To Earn Money Online\",\"sub_heading\":\"Lorem ipsum dolor sit, amet consectetur adipisicing elit. Doloribus necessitatibus repudiandae porro reprehenderit, beatae perferendis repellat quo ipsa omnis, vitae!\",\"image\":\"6263bfd419cc41650704340.png\"}', NULL, 'basic', NULL, 0, '2022-04-23 07:29:00', '2022-04-23 07:29:00'),
(57, 'counter.element', '{\"icon\":\"<i class=\\\"far fa-money-bill-alt\\\"><\\/i>\",\"title\":\"Withdraw\",\"number\":\"$750K+\"}', NULL, 'basic', NULL, 0, '2022-04-23 07:29:20', '2022-04-23 07:29:20'),
(58, 'counter.element', '{\"icon\":\"<i class=\\\"fas fa-users\\\"><\\/i>\",\"title\":\"Users\",\"number\":\"50K+\"}', NULL, 'basic', NULL, 0, '2022-04-23 07:29:49', '2022-04-23 07:29:49'),
(59, 'counter.element', '{\"icon\":\"<i class=\\\"fas fa-link\\\"><\\/i>\",\"title\":\"Impression\",\"number\":\"20M+\"}', NULL, 'basic', NULL, 0, '2022-04-23 07:30:14', '2022-04-23 07:30:59'),
(60, 'counter.element', '{\"icon\":\"<i class=\\\"fas fa-ad\\\"><\\/i>\",\"title\":\"Advertisement\",\"number\":\"568K+\"}', NULL, 'basic', NULL, 0, '2022-04-23 07:30:43', '2022-04-23 07:30:44'),
(61, 'testimonial.content', '{\"heading\":\"What People Says\",\"subheading\":\"Lorem ipsum dolor sit, amet consectetur adipisicing elit. Doloribus necessitatibus repudiandae porro reprehenderit, beatae perferendis repellat quo ipsa omnis, vitae!\"}', NULL, 'basic', NULL, 0, '2022-04-23 07:40:32', '2022-04-23 07:40:32'),
(62, 'testimonial.element', '{\"has_image\":\"1\",\"name\":\"Chris Hamsorth\",\"designation\":\"PTC Player\",\"comment\":\"Lorem ipsum dolor sit amet, consectetur adipisicing elit. Voluptatibus fuga, lauda ium odio dolor ut  iusto,  pariatur neque ique quod ratione tempore velit iure sapiente beatae id dolores.\",\"image\":\"6263c2b65eb0b1650705078.jpg\"}', NULL, 'basic', NULL, 0, '2022-04-23 07:41:18', '2022-04-23 07:41:18'),
(63, 'testimonial.element', '{\"has_image\":\"1\",\"name\":\"John Doe\",\"designation\":\"Businessman\",\"comment\":\"Lorem ipsum dolor sit amet, consectetur adipisicing elit. Voluptatibus fuga, lauda ium odio dolor ut  iusto,  pariatur neque ique quod ratione tempore velit iure sapiente beatae id dolores.\",\"image\":\"6263c2c7a0f131650705095.jpg\"}', NULL, 'basic', NULL, 0, '2022-04-23 07:41:35', '2022-04-23 07:41:35'),
(64, 'testimonial.element', '{\"has_image\":\"1\",\"name\":\"Rajendra\",\"designation\":\"Web Developer\",\"comment\":\"Lorem ipsum dolor sit amet, consectetur adipisicing elit. Voluptatibus fuga, lauda ium odio dolor ut  iusto,  pariatur neque ique quod ratione tempore velit iure sapiente beatae id dolores.v\",\"image\":\"6263c2dd9b0931650705117.jpg\"}', NULL, 'basic', NULL, 0, '2022-04-23 07:41:57', '2022-04-23 07:41:57'),
(65, 'faq.content', '{\"heading\":\"Frequently Asked Question\",\"subheading\":\"Lorem ipsum dolor sit, amet consectetur adipisicing elit. Doloribus necessitatibus repudiandae porro reprehenderit, beatae perferendis repellat quo ipsa omnis, vitae!\"}', NULL, 'basic', NULL, 0, '2022-04-23 07:44:21', '2022-04-23 07:44:21'),
(66, 'faq.element', '{\"question\":\"What constitutes a quorum in a PTC?\",\"answer\":\"The standard definition of a quorum in Robert\'s Rules of Order is that the majority of an assembly must be present to conduct business. That is, if there are twenty members of a group, eleven must be present to constitute a quorum. The same requirement for a quorum applies to PTCs, with one additional provision. The Handbook (4.1.8.3) provides that absentee votes will be counted in PTCs, whereas Robert\'s Rules really do not provide for a mixture of absentee and in-person votes in an assembly\"}', NULL, 'basic', NULL, 0, '2022-04-23 07:44:36', '2022-04-23 07:44:36'),
(67, 'faq.element', '{\"question\":\"What constitutes a positive or negative vote in PTCs?\",\"answer\":\"The standard definition of a quorum in Robert\'s Rules of Order is that the majority of an assembly must be present to conduct business. That is, if there are twenty members of a group, eleven must be present to constitute a quorum. The same requirement for a quorum applies to PTCs, with one additional provision. The Handbook (4.1.8.3) provides that absentee votes will be counted in PTCs, whereas Robert\'s Rules really do not provide for a mixture of absentee and in-person votes in an assembly\"}', NULL, 'basic', NULL, 0, '2022-04-23 07:44:51', '2022-04-23 07:44:51'),
(68, 'faq.element', '{\"question\":\"Can an abstention vote be cast at a PTC meeting?\",\"answer\":\"The standard definition of a quorum in Robert\'s Rules of Order is that the majority of an assembly must be present to conduct business. That is, if there are twenty members of a group, eleven must be present to constitute a quorum. The same requirement for a quorum applies to PTCs, with one additional provision. The Handbook (4.1.8.3) provides that absentee votes will be counted in PTCs, whereas Robert\'s Rules really do not provide for a mixture of absentee and in-person votes in an assembly\"}', NULL, 'basic', NULL, 0, '2022-04-23 07:45:04', '2022-04-23 07:45:04'),
(69, 'faq.element', '{\"question\":\"Can a faculty member on OCSA or FML serve on a PTC?\",\"answer\":\"The standard definition of a quorum in Robert\'s Rules of Order is that the majority of an assembly must be present to conduct business. That is, if there are twenty members of a group, eleven must be present to constitute a quorum. The same requirement for a quorum applies to PTCs, with one additional provision. The Handbook (4.1.8.3) provides that absentee votes will be counted in PTCs, whereas Robert\'s Rules really do not provide for a mixture of absentee and in-person votes in an assembly\"}', NULL, 'basic', NULL, 0, '2022-04-23 07:45:19', '2022-04-23 07:45:19'),
(70, 'faq.element', '{\"question\":\"How will additional members of PTCs be elected in departments with fewer than four tenured faculty members?\",\"answer\":\"The standard definition of a quorum in Robert\'s Rules of Order is that the majority of an assembly must be present to conduct business. That is, if there are twenty members of a group, eleven must be present to constitute a quorum. The same requirement for a quorum applies to PTCs, with one additional provision. The Handbook (4.1.8.3) provides that absentee votes will be counted in PTCs, whereas Robert\'s Rules really do not provide for a mixture of absentee and in-person votes in an assembly\"}', NULL, 'basic', NULL, 0, '2022-04-23 07:45:34', '2022-04-23 07:45:34'),
(71, 'faq.element', '{\"question\":\"How can absentee ballots be cast?\",\"answer\":\"The standard definition of a quorum in Robert\'s Rules of Order is that the majority of an assembly must be present to conduct business. That is, if there are twenty members of a group, eleven must be present to constitute a quorum. The same requirement for a quorum applies to PTCs, with one additional provision. The Handbook (4.1.8.3) provides that absentee votes will be counted in PTCs, whereas Robert\'s Rules really do not provide for a mixture of absentee and in-person votes in an assembly\"}', NULL, 'basic', NULL, 0, '2022-04-23 07:45:48', '2022-04-23 07:45:48'),
(72, 'faq.element', '{\"question\":\"Why should members of the PTC fill out vote justification forms explaining their votes?\",\"answer\":\"The standard definition of a quorum in Robert\'s Rules of Order is that the majority of an assembly must be present to conduct business. That is, if there are twenty members of a group, eleven must be present to constitute a quorum. The same requirement for a quorum applies to PTCs, with one additional provision. The Handbook (4.1.8.3) provides that absentee votes will be counted in PTCs, whereas Robert\'s Rules really do not provide for a mixture of absentee and in-person votes in an assembly\"}', NULL, 'basic', NULL, 0, '2022-04-23 07:46:00', '2022-04-23 07:46:01'),
(73, 'policy_pages.element', '{\"title\":\"Privacy and Policy\",\"details\":\"<div class=\\\"mb-5\\\" style=\\\"color:rgb(111,111,111);font-family:Nunito, sans-serif;margin-bottom:3rem;\\\"><h3 class=\\\"mb-3\\\" style=\\\"font-weight:600;line-height:1.3;font-size:24px;font-family:Exo, sans-serif;color:rgb(54,54,54);\\\">What information do we collect?<\\/h3><p class=\\\"font-18\\\" style=\\\"margin-right:0px;margin-left:0px;font-size:18px;\\\">We gather data from you when you register on our site, submit a request, buy any services, react to an overview, or round out a structure. At the point when requesting any assistance or enrolling on our site, as suitable, you might be approached to enter your: name, email address, or telephone number. You may, nonetheless, visit our site anonymously.<\\/p><\\/div><div class=\\\"mb-5\\\" style=\\\"color:rgb(111,111,111);font-family:Nunito, sans-serif;margin-bottom:3rem;\\\"><h3 class=\\\"mb-3\\\" style=\\\"font-weight:600;line-height:1.3;font-size:24px;font-family:Exo, sans-serif;color:rgb(54,54,54);\\\">How do we protect your information?<\\/h3><p class=\\\"font-18\\\" style=\\\"margin-right:0px;margin-left:0px;font-size:18px;\\\">All provided delicate\\/credit data is sent through Stripe.<br \\/>After an exchange, your private data (credit cards, social security numbers, financials, and so on) won\'t be put away on our workers.<\\/p><\\/div><div class=\\\"mb-5\\\" style=\\\"color:rgb(111,111,111);font-family:Nunito, sans-serif;margin-bottom:3rem;\\\"><h3 class=\\\"mb-3\\\" style=\\\"font-weight:600;line-height:1.3;font-size:24px;font-family:Exo, sans-serif;color:rgb(54,54,54);\\\">Do we disclose any information to outside parties?<\\/h3><p class=\\\"font-18\\\" style=\\\"margin-right:0px;margin-left:0px;font-size:18px;\\\">We don\'t sell, exchange, or in any case move to outside gatherings by and by recognizable data. This does exclude confided in outsiders who help us in working our site, leading our business, or adjusting you, since those gatherings consent to keep this data private. We may likewise deliver your data when we accept discharge is suitable to follow the law, implement our site strategies, or ensure our own or others\' rights, property, or wellbeing.<\\/p><\\/div><div class=\\\"mb-5\\\" style=\\\"color:rgb(111,111,111);font-family:Nunito, sans-serif;margin-bottom:3rem;\\\"><h3 class=\\\"mb-3\\\" style=\\\"font-weight:600;line-height:1.3;font-size:24px;font-family:Exo, sans-serif;color:rgb(54,54,54);\\\">Children\'s Online Privacy Protection Act Compliance<\\/h3><p class=\\\"font-18\\\" style=\\\"margin-right:0px;margin-left:0px;font-size:18px;\\\">We are consistent with the prerequisites of COPPA (Children\'s Online Privacy Protection Act), we don\'t gather any data from anybody under 13 years old. Our site, items, and administrations are completely coordinated to individuals who are in any event 13 years of age or more established.<\\/p><\\/div><div class=\\\"mb-5\\\" style=\\\"color:rgb(111,111,111);font-family:Nunito, sans-serif;margin-bottom:3rem;\\\"><h3 class=\\\"mb-3\\\" style=\\\"font-weight:600;line-height:1.3;font-size:24px;font-family:Exo, sans-serif;color:rgb(54,54,54);\\\">Changes to our Privacy Policy<\\/h3><p class=\\\"font-18\\\" style=\\\"margin-right:0px;margin-left:0px;font-size:18px;\\\">If we decide to change our privacy policy, we will post those changes on this page.<\\/p><\\/div><div class=\\\"mb-5\\\" style=\\\"color:rgb(111,111,111);font-family:Nunito, sans-serif;margin-bottom:3rem;\\\"><h3 class=\\\"mb-3\\\" style=\\\"font-weight:600;line-height:1.3;font-size:24px;font-family:Exo, sans-serif;color:rgb(54,54,54);\\\">How long we retain your information?<\\/h3><p class=\\\"font-18\\\" style=\\\"margin-right:0px;margin-left:0px;font-size:18px;\\\">At the point when you register for our site, we cycle and keep your information we have about you however long you don\'t erase the record or withdraw yourself (subject to laws and guidelines).<\\/p><\\/div><div class=\\\"mb-5\\\" style=\\\"color:rgb(111,111,111);font-family:Nunito, sans-serif;margin-bottom:3rem;\\\"><h3 class=\\\"mb-3\\\" style=\\\"font-weight:600;line-height:1.3;font-size:24px;font-family:Exo, sans-serif;color:rgb(54,54,54);\\\">What we don\\u2019t do with your data<\\/h3><p class=\\\"font-18\\\" style=\\\"margin-right:0px;margin-left:0px;font-size:18px;\\\">We don\'t and will never share, unveil, sell, or in any case give your information to different organizations for the promoting of their items or administrations.<\\/p><\\/div>\"}', NULL, 'basic', 'privacy-and-policy', 0, '2022-04-23 07:49:43', '2022-04-23 08:37:03'),
(74, 'policy_pages.element', '{\"title\":\"Payment Policy\",\"details\":\"<div class=\\\"mb-5\\\" style=\\\"color:rgb(111,111,111);font-family:Nunito, sans-serif;margin-bottom:3rem;\\\"><h3 class=\\\"mb-3\\\" style=\\\"font-weight:600;line-height:1.3;font-size:24px;font-family:Exo, sans-serif;color:rgb(54,54,54);\\\">What information do we collect?<\\/h3><p class=\\\"font-18\\\" style=\\\"margin-right:0px;margin-left:0px;font-size:18px;\\\">We gather data from you when you register on our site, submit a request, buy any services, react to an overview, or round out a structure. At the point when requesting any assistance or enrolling on our site, as suitable, you might be approached to enter your: name, email address, or telephone number. You may, nonetheless, visit our site anonymously.<\\/p><\\/div><div class=\\\"mb-5\\\" style=\\\"color:rgb(111,111,111);font-family:Nunito, sans-serif;margin-bottom:3rem;\\\"><h3 class=\\\"mb-3\\\" style=\\\"font-weight:600;line-height:1.3;font-size:24px;font-family:Exo, sans-serif;color:rgb(54,54,54);\\\">How do we protect your information?<\\/h3><p class=\\\"font-18\\\" style=\\\"margin-right:0px;margin-left:0px;font-size:18px;\\\">All provided delicate\\/credit data is sent through Stripe.<br \\/>After an exchange, your private data (credit cards, social security numbers, financials, and so on) won\'t be put away on our workers.<\\/p><\\/div><div class=\\\"mb-5\\\" style=\\\"color:rgb(111,111,111);font-family:Nunito, sans-serif;margin-bottom:3rem;\\\"><h3 class=\\\"mb-3\\\" style=\\\"font-weight:600;line-height:1.3;font-size:24px;font-family:Exo, sans-serif;color:rgb(54,54,54);\\\">Do we disclose any information to outside parties?<\\/h3><p class=\\\"font-18\\\" style=\\\"margin-right:0px;margin-left:0px;font-size:18px;\\\">We don\'t sell, exchange, or in any case move to outside gatherings by and by recognizable data. This does exclude confided in outsiders who help us in working our site, leading our business, or adjusting you, since those gatherings consent to keep this data private. We may likewise deliver your data when we accept discharge is suitable to follow the law, implement our site strategies, or ensure our own or others\' rights, property, or wellbeing.<\\/p><\\/div><div class=\\\"mb-5\\\" style=\\\"color:rgb(111,111,111);font-family:Nunito, sans-serif;margin-bottom:3rem;\\\"><h3 class=\\\"mb-3\\\" style=\\\"font-weight:600;line-height:1.3;font-size:24px;font-family:Exo, sans-serif;color:rgb(54,54,54);\\\">Children\'s Online Privacy Protection Act Compliance<\\/h3><p class=\\\"font-18\\\" style=\\\"margin-right:0px;margin-left:0px;font-size:18px;\\\">We are consistent with the prerequisites of COPPA (Children\'s Online Privacy Protection Act), we don\'t gather any data from anybody under 13 years old. Our site, items, and administrations are completely coordinated to individuals who are in any event 13 years of age or more established.<\\/p><\\/div><div class=\\\"mb-5\\\" style=\\\"color:rgb(111,111,111);font-family:Nunito, sans-serif;margin-bottom:3rem;\\\"><h3 class=\\\"mb-3\\\" style=\\\"font-weight:600;line-height:1.3;font-size:24px;font-family:Exo, sans-serif;color:rgb(54,54,54);\\\">Changes to our Privacy Policy<\\/h3><p class=\\\"font-18\\\" style=\\\"margin-right:0px;margin-left:0px;font-size:18px;\\\">If we decide to change our privacy policy, we will post those changes on this page.<\\/p><\\/div><div class=\\\"mb-5\\\" style=\\\"color:rgb(111,111,111);font-family:Nunito, sans-serif;margin-bottom:3rem;\\\"><h3 class=\\\"mb-3\\\" style=\\\"font-weight:600;line-height:1.3;font-size:24px;font-family:Exo, sans-serif;color:rgb(54,54,54);\\\">How long we retain your information?<\\/h3><p class=\\\"font-18\\\" style=\\\"margin-right:0px;margin-left:0px;font-size:18px;\\\">At the point when you register for our site, we cycle and keep your information we have about you however long you don\'t erase the record or withdraw yourself (subject to laws and guidelines).<\\/p><\\/div><div class=\\\"mb-5\\\" style=\\\"color:rgb(111,111,111);font-family:Nunito, sans-serif;margin-bottom:3rem;\\\"><h3 class=\\\"mb-3\\\" style=\\\"font-weight:600;line-height:1.3;font-size:24px;font-family:Exo, sans-serif;color:rgb(54,54,54);\\\">What we don\\u2019t do with your data<\\/h3><p class=\\\"font-18\\\" style=\\\"margin-right:0px;margin-left:0px;font-size:18px;\\\">We don\'t and will never share, unveil, sell, or in any case give your information to different organizations for the promoting of their items or administrations.<\\/p><\\/div>\"}', NULL, 'basic', 'payment-policy', 0, '2022-04-23 07:50:04', '2022-04-23 07:50:04'),
(75, 'blog.content', '{\"heading\":\"Our Latest Blog\",\"subheading\":\"Lorem ipsum dolor sit, amet consectetur adipisicing elit. Doloribus necessitatibus repudiandae porro reprehenderit, beatae perferendis repellat quo ipsa omnis, vitae!\"}', NULL, 'basic', NULL, 0, '2022-04-23 07:51:10', '2022-04-23 07:51:10'),
(76, 'blog.element', '{\"has_image\":[\"1\"],\"title\":\"Dit boek is een verhand eling over de\",\"description\":\"<p style=\\\"margin:20px 0px 21px;font-size:16px;color:rgb(102,102,102);line-height:30px;font-family:\'Noto Sans\', sans-serif;\\\">There are many variations of passages of Lorem Ipsum available, but the majority have suffered that the alteration in some form by injected humour or the an randomised words which don\'t look even evry is and slightly believable. If you are going to use a passage of Lorem Ipsum you need to be sure there isn\'t is the anything aembarrassing hidden in the middle of text.Ipsum available but the majority have that suffered is alteration in some form by injected humour or randomised words.<\\/p><p class=\\\"marked\\\" style=\\\"margin:20px 0px 21px;font-size:16px;color:rgb(0,0,80);line-height:30px;font-style:italic;font-family:\'Noto Sans\', sans-serif;\\\">All their equipment and instruments are alive.All their equipment and instruments are alive. I the that about to watched storm, so beautiful terrific.Silver mist suffused the deck the ship.The are recorded voice the a dumm a scratched the Tthst speaker. Almost before we knew it.Almost is before we knew it we had left the dummy is ground.<\\/p><p style=\\\"margin:20px 0px 6px;font-size:16px;color:rgb(102,102,102);line-height:30px;font-family:\'Noto Sans\', sans-serif;\\\">The face of the moon was in shadow.The spectacle before us was indeed sublime.All their equipment tha is and instruments are alive.All their equipment and instruments are alive.I watched the storm so beautiful yet terrific.Silver mist suffused the deck of the ship.<\\/p>\",\"image\":\"6263c534d4d551650705716.jpg\"}', NULL, 'basic', 'dit-boek-is-een-verhand-eling-over-de', 744, '2022-04-23 07:51:56', '2024-06-04 00:42:00'),
(77, 'blog.element', '{\"has_image\":[\"1\"],\"title\":\"Dit boek is een verhand eling over de\",\"description\":\"<p style=\\\"margin:20px 0px 21px;font-size:16px;color:rgb(102,102,102);line-height:30px;font-family:\'Noto Sans\', sans-serif;\\\">There are many variations of passages of Lorem Ipsum available, but the majority have suffered that the alteration in some form by injected humour or the an randomised words which don\'t look even evry is and slightly believable. If you are going to use a passage of Lorem Ipsum you need to be sure there isn\'t is the anything aembarrassing hidden in the middle of text.Ipsum available but the majority have that suffered is alteration in some form by injected humour or randomised words.<\\/p><p class=\\\"marked\\\" style=\\\"margin:20px 0px 21px;font-size:16px;color:rgb(0,0,80);line-height:30px;font-style:italic;font-family:\'Noto Sans\', sans-serif;\\\">All their equipment and instruments are alive.All their equipment and instruments are alive. I the that about to watched storm, so beautiful terrific.Silver mist suffused the deck the ship.The are recorded voice the a dumm a scratched the Tthst speaker. Almost before we knew it.Almost is before we knew it we had left the dummy is ground.<\\/p><p style=\\\"margin:20px 0px 6px;font-size:16px;color:rgb(102,102,102);line-height:30px;font-family:\'Noto Sans\', sans-serif;\\\">The face of the moon was in shadow.The spectacle before us was indeed sublime.All their equipment tha is and instruments are alive.All their equipment and instruments are alive.I watched the storm so beautiful yet terrific.Silver mist suffused the deck of the ship.<\\/p>\",\"image\":\"6263c5776573b1650705783.jpg\"}', NULL, 'basic', 'dit-boek-is-een-verhand-eling-over-de', 722, '2022-04-23 07:53:03', '2024-06-04 00:41:59'),
(78, 'blog.element', '{\"has_image\":[\"1\"],\"title\":\"Er zijn vele variaties van passages van\",\"description\":\"<p style=\\\"margin:20px 0px 21px;font-size:16px;color:rgb(102,102,102);line-height:30px;font-family:\'Noto Sans\', sans-serif;\\\">There are many variations of passages of Lorem Ipsum available, but the majority have suffered that the alteration in some form by injected humour or the an randomised words which don\'t look even evry is and slightly believable. If you are going to use a passage of Lorem Ipsum you need to be sure there isn\'t is the anything aembarrassing hidden in the middle of text.Ipsum available but the majority have that suffered is alteration in some form by injected humour or randomised words.<\\/p><p class=\\\"marked\\\" style=\\\"margin:20px 0px 21px;font-size:16px;color:rgb(0,0,80);line-height:30px;font-style:italic;font-family:\'Noto Sans\', sans-serif;\\\">All their equipment and instruments are alive.All their equipment and instruments are alive. I the that about to watched storm, so beautiful terrific.Silver mist suffused the deck the ship.The are recorded voice the a dumm a scratched the Tthst speaker. Almost before we knew it.Almost is before we knew it we had left the dummy is ground.<\\/p><p style=\\\"margin:20px 0px 6px;font-size:16px;color:rgb(102,102,102);line-height:30px;font-family:\'Noto Sans\', sans-serif;\\\">The face of the moon was in shadow.The spectacle before us was indeed sublime.All their equipment tha is and instruments are alive.All their equipment and instruments are alive.I watched the storm so beautiful yet terrific.Silver mist suffused the deck of the ship.<\\/p>\",\"image\":\"6263c5ca845e61650705866.jpg\"}', NULL, 'basic', 'er-zijn-vele-variaties-van-passages-van', 728, '2022-04-23 07:54:26', '2024-06-04 00:41:58'),
(79, 'blog.element', '{\"has_image\":[\"1\"],\"title\":\"Het is al geruime tijd een bekend geg\",\"description\":\"<p style=\\\"margin:20px 0px 21px;font-size:16px;color:rgb(102,102,102);line-height:30px;font-family:\'Noto Sans\', sans-serif;\\\">There are many variations of passages of Lorem Ipsum available, but the majority have suffered that the alteration in some form by injected humour or the an randomised words which don\'t look even evry is and slightly believable. If you are going to use a passage of Lorem Ipsum you need to be sure there isn\'t is the anything aembarrassing hidden in the middle of text.Ipsum available but the majority have that suffered is alteration in some form by injected humour or randomised words.<\\/p><p class=\\\"marked\\\" style=\\\"margin:20px 0px 21px;font-size:16px;color:rgb(0,0,80);line-height:30px;font-style:italic;font-family:\'Noto Sans\', sans-serif;\\\">All their equipment and instruments are alive.All their equipment and instruments are alive. I the that about to watched storm, so beautiful terrific.Silver mist suffused the deck the ship.The are recorded voice the a dumm a scratched the Tthst speaker. Almost before we knew it.Almost is before we knew it we had left the dummy is ground.<\\/p><p style=\\\"margin:20px 0px 6px;font-size:16px;color:rgb(102,102,102);line-height:30px;font-family:\'Noto Sans\', sans-serif;\\\">The face of the moon was in shadow.The spectacle before us was indeed sublime.All their equipment tha is and instruments are alive.All their equipment and instruments are alive.I watched the storm so beautiful yet terrific.Silver mist suffused the deck of the ship.<\\/p>\",\"image\":\"6263c5e6ee3281650705894.jpg\"}', NULL, 'basic', 'het-is-al-geruime-tijd-een-bekend-geg', 1046, '2022-04-23 07:54:54', '2024-06-04 00:41:17'),
(80, 'blog.element', '{\"has_image\":[\"1\"],\"title\":\"Law firm opened near to that gonig to\",\"description\":\"<p style=\\\"margin:20px 0px 21px;font-size:16px;color:rgb(102,102,102);line-height:30px;font-family:\'Noto Sans\', sans-serif;\\\">There are many variations of passages of Lorem Ipsum available, but the majority have suffered that the alteration in some form by injected humour or the an randomised words which don\'t look even evry is and slightly believable. If you are going to use a passage of Lorem Ipsum you need to be sure there isn\'t is the anything aembarrassing hidden in the middle of text.Ipsum available but the majority have that suffered is alteration in some form by injected humour or randomised words.<\\/p><p class=\\\"marked\\\" style=\\\"margin:20px 0px 21px;font-size:16px;color:rgb(0,0,80);line-height:30px;font-style:italic;font-family:\'Noto Sans\', sans-serif;\\\">All their equipment and instruments are alive.All their equipment and instruments are alive. I the that about to watched storm, so beautiful terrific.Silver mist suffused the deck the ship.The are recorded voice the a dumm a scratched the Tthst speaker. Almost before we knew it.Almost is before we knew it we had left the dummy is ground.<\\/p><p style=\\\"margin:20px 0px 6px;font-size:16px;color:rgb(102,102,102);line-height:30px;font-family:\'Noto Sans\', sans-serif;\\\">The face of the moon was in shadow.The spectacle before us was indeed sublime.All their equipment tha is and instruments are alive.All their equipment and instruments are alive.I watched the storm so beautiful yet terrific.Silver mist suffused the deck of the ship.<\\/p>\",\"image\":\"6263c5ff668751650705919.jpg\"}', NULL, 'basic', 'law-firm-opened-near-to-that-gonig-to', 1052, '2022-04-23 07:55:19', '2024-06-04 00:41:16'),
(81, 'blog.element', '{\"has_image\":[\"1\"],\"title\":\"Law firm opened near to that gonig to\",\"description\":\"<p style=\\\"margin:20px 0px 21px;font-size:16px;color:rgb(102,102,102);line-height:30px;font-family:\'Noto Sans\', sans-serif;\\\">There are many variations of passages of Lorem Ipsum available, but the majority have suffered that the alteration in some form by injected humour or the an randomised words which don\'t look even evry is and slightly believable. If you are going to use a passage of Lorem Ipsum you need to be sure there isn\'t is the anything aembarrassing hidden in the middle of text.Ipsum available but the majority have that suffered is alteration in some form by injected humour or randomised words.<\\/p><p class=\\\"marked\\\" style=\\\"margin:20px 0px 21px;font-size:16px;color:rgb(0,0,80);line-height:30px;font-style:italic;font-family:\'Noto Sans\', sans-serif;\\\">All their equipment and instruments are alive.All their equipment and instruments are alive. I the that about to watched storm, so beautiful terrific.Silver mist suffused the deck the ship.The are recorded voice the a dumm a scratched the Tthst speaker. Almost before we knew it.Almost is before we knew it we had left the dummy is ground.<\\/p><p style=\\\"margin:20px 0px 6px;font-size:16px;color:rgb(102,102,102);line-height:30px;font-family:\'Noto Sans\', sans-serif;\\\">The face of the moon was in shadow.The spectacle before us was indeed sublime.All their equipment tha is and instruments are alive.All their equipment and instruments are alive.I watched the storm so beautiful yet terrific.Silver mist suffused the deck of the ship.<\\/p>\",\"image\":\"6263c61391bf31650705939.jpg\"}', NULL, 'basic', 'law-firm-opened-near-to-that-gonig-to', 1129, '2022-04-23 07:55:39', '2024-06-04 00:41:15'),
(82, 'breadcrumb.content', '{\"has_image\":\"1\",\"image\":\"6263cd14a6e8d1650707732.png\"}', NULL, 'basic', NULL, 0, '2022-04-23 08:25:32', '2022-04-23 08:25:34'),
(83, 'contact.content', '{\"has_image\":\"1\",\"heading\":\"Get in Touch\",\"subheading\":\"Reach out to us for swift assistance and friendly support\",\"image\":\"665ef7737a7fb1717499763.png\"}', NULL, 'basic', '', 0, '2022-04-23 08:42:01', '2024-06-04 11:16:14'),
(84, 'contact.element', '{\"icon\":\"<i class=\\\"far fa-envelope\\\"><\\/i>\",\"title\":\"Email Address\",\"content\":\"contact@ptcl.com\"}', NULL, 'basic', NULL, 0, '2022-04-23 08:42:19', '2022-04-23 08:42:19'),
(85, 'contact.element', '{\"icon\":\"<i class=\\\"fas fa-phone\\\"><\\/i>\",\"title\":\"Phone Number\",\"content\":\"+012-345-67890\"}', NULL, 'basic', NULL, 0, '2022-04-23 08:42:36', '2022-04-23 08:42:36'),
(86, 'contact.element', '{\"icon\":\"<i class=\\\"fas fa-map-marker-alt\\\"><\\/i>\",\"title\":\"Office Address\",\"content\":\"ABC road street, Cool City\"}', NULL, 'basic', NULL, 0, '2022-04-23 08:42:51', '2022-04-23 08:42:51'),
(87, 'login.content', '{\"heading\":\"Hi. welcome to PTCLab\",\"subheading\":\"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incint ut labore et am, quis nostrud exercitation ullamco laboris\"}', NULL, 'basic', NULL, 0, '2022-04-24 07:43:31', '2022-04-24 07:43:31'),
(88, 'register.content', '{\"heading\":\"Register New Account\",\"subheading\":\"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incint ut labore et am, quis nostrud exercitation ullamco laboris\"}', NULL, 'basic', NULL, 0, '2022-04-24 07:43:48', '2022-04-24 07:43:48'),
(89, 'kyc_info.content', '{\"verification_content\":\"Lorem ipsum, dolor sit amet consectetur adipisicing elit. Hic officia quod natus, non dicta perspiciatis, quae repellendus ea illum aut debitis sint amet? Ratione voluptates beatae numquam.\",\"pending_content\":\"Lorem ipsum, dolor sit amet consectetur adipisicing elit. Hic officia quod natus, non dicta perspiciatis, quae repellendus ea illum aut debitis sint amet? Ratione voluptates beatae numquam.\"}', NULL, 'basic', NULL, 0, '2022-04-24 22:29:41', '2022-04-24 22:29:41'),
(90, 'about.content', '{\"has_image\":\"1\",\"heading\":\"Make more than ever before Join Us\",\"subheading\":\"About Us\",\"description\":\"<p style=\\\"margin-bottom:1rem;color:rgb(95,125,149);font-family:\'Open Sans\', sans-serif;font-size:16px;\\\">Lorem ipsum dolor, sit amet consectetur adipisicing elit. Doloremque natus, repellendus consequatur, animi minima ex quidem temporibus ab odio, eaque aliquid consectetur vel adipisci.<\\/p><ul class=\\\"list list--check\\\" style=\\\"color:rgb(95,125,149);font-family:\'Open Sans\', sans-serif;\\\"><li>PPC Keyword Research<\\/li><li>Managing Your PPC Campaigns<\\/li><li>Review Costly PPC Keywords<\\/li><li>Refine Landing Pages<\\/li><\\/ul>\",\"image\":\"6353d54ba02d11666438475.png\"}', NULL, 'ptc_diamond', NULL, 0, '2022-10-22 09:12:01', '2022-10-22 09:34:35'),
(91, 'banner.content', '{\"has_image\":\"1\",\"heading\":\"Earn and Make Money Online Per Click\",\"subheading\":\"Paid to click is an online business model that draws online traffic from people aiming to earn money from home\",\"button_name\":\"Get Started\",\"button_link\":\"user\\/login\",\"video_link\":\"https:\\/\\/www.youtube.com\\/watch?v=WOb4cj7izpE\",\"background_image\":\"6353d4d0413691666438352.png\",\"image\":\"6353d4d0b3de01666438352.png\"}', NULL, 'ptc_diamond', NULL, 0, '2022-10-22 09:13:08', '2022-11-05 04:42:08'),
(92, 'blog.content', '{\"heading\":\"Blog Section\",\"subheading\":\"Blog\"}', NULL, 'ptc_diamond', NULL, 0, '2022-10-22 09:13:15', '2022-10-22 09:13:15'),
(93, 'blog.element', '{\"has_image\":[\"1\"],\"title\":\"Dit boek is een verhand eling over de\",\"description\":\"<p style=\\\"margin:20px 0px 21px;font-size:16px;color:rgb(102,102,102);line-height:30px;font-family:\'Noto Sans\', sans-serif;\\\">There are many variations of passages of Lorem Ipsum available, but the majority have suffered that the alteration in some form by injected humour or the an randomised words which don\'t look even evry is and slightly believable. If you are going to use a passage of Lorem Ipsum you need to be sure there isn\'t is the anything aembarrassing hidden in the middle of text.Ipsum available but the majority have that suffered is alteration in some form by injected humour or randomised words.<\\/p><p class=\\\"marked\\\" style=\\\"margin:20px 0px 21px;font-size:16px;color:rgb(0,0,80);line-height:30px;font-style:italic;font-family:\'Noto Sans\', sans-serif;\\\">All their equipment and instruments are alive.All their equipment and instruments are alive. I the that about to watched storm, so beautiful terrific.Silver mist suffused the deck the ship.The are recorded voice the a dumm a scratched the Tthst speaker. Almost before we knew it.Almost is before we knew it we had left the dummy is ground.<\\/p><p style=\\\"margin:20px 0px 6px;font-size:16px;color:rgb(102,102,102);line-height:30px;font-family:\'Noto Sans\', sans-serif;\\\">The face of the moon was in shadow.The spectacle before us was indeed sublime.All their equipment tha is and instruments are alive.All their equipment and instruments are alive.I watched the storm so beautiful yet terrific.Silver mist suffused the deck of the ship.<\\/p>\",\"image\":\"6353da51703671666439761.png\"}', NULL, 'ptc_diamond', 'dit-boek-is-een-verhand-eling-over-de', 18, '2022-10-22 09:13:15', '2023-11-30 06:33:11'),
(94, 'blog.element', '{\"has_image\":[\"1\"],\"title\":\"Dit boek is een verhand eling over de\",\"description\":\"<p style=\\\"margin:20px 0px 21px;font-size:16px;color:rgb(102,102,102);line-height:30px;font-family:\'Noto Sans\', sans-serif;\\\">There are many variations of passages of Lorem Ipsum available, but the majority have suffered that the alteration in some form by injected humour or the an randomised words which don\'t look even evry is and slightly believable. If you are going to use a passage of Lorem Ipsum you need to be sure there isn\'t is the anything aembarrassing hidden in the middle of text.Ipsum available but the majority have that suffered is alteration in some form by injected humour or randomised words.<\\/p><p class=\\\"marked\\\" style=\\\"margin:20px 0px 21px;font-size:16px;color:rgb(0,0,80);line-height:30px;font-style:italic;font-family:\'Noto Sans\', sans-serif;\\\">All their equipment and instruments are alive.All their equipment and instruments are alive. I the that about to watched storm, so beautiful terrific.Silver mist suffused the deck the ship.The are recorded voice the a dumm a scratched the Tthst speaker. Almost before we knew it.Almost is before we knew it we had left the dummy is ground.<\\/p><p style=\\\"margin:20px 0px 6px;font-size:16px;color:rgb(102,102,102);line-height:30px;font-family:\'Noto Sans\', sans-serif;\\\">The face of the moon was in shadow.The spectacle before us was indeed sublime.All their equipment tha is and instruments are alive.All their equipment and instruments are alive.I watched the storm so beautiful yet terrific.Silver mist suffused the deck of the ship.<\\/p>\",\"image\":\"6353da5e5f0c71666439774.png\"}', NULL, 'ptc_diamond', 'dit-boek-is-een-verhand-eling-over-de', 42, '2022-10-22 09:13:15', '2024-03-03 02:26:38'),
(95, 'blog.element', '{\"has_image\":[\"1\"],\"title\":\"Er zijn vele variaties van passages van\",\"description\":\"<p style=\\\"margin:20px 0px 21px;font-size:16px;color:rgb(102,102,102);line-height:30px;font-family:\'Noto Sans\', sans-serif;\\\">There are many variations of passages of Lorem Ipsum available, but the majority have suffered that the alteration in some form by injected humour or the an randomised words which don\'t look even evry is and slightly believable. If you are going to use a passage of Lorem Ipsum you need to be sure there isn\'t is the anything aembarrassing hidden in the middle of text.Ipsum available but the majority have that suffered is alteration in some form by injected humour or randomised words.<\\/p><p class=\\\"marked\\\" style=\\\"margin:20px 0px 21px;font-size:16px;color:rgb(0,0,80);line-height:30px;font-style:italic;font-family:\'Noto Sans\', sans-serif;\\\">All their equipment and instruments are alive.All their equipment and instruments are alive. I the that about to watched storm, so beautiful terrific.Silver mist suffused the deck the ship.The are recorded voice the a dumm a scratched the Tthst speaker. Almost before we knew it.Almost is before we knew it we had left the dummy is ground.<\\/p><p style=\\\"margin:20px 0px 6px;font-size:16px;color:rgb(102,102,102);line-height:30px;font-family:\'Noto Sans\', sans-serif;\\\">The face of the moon was in shadow.The spectacle before us was indeed sublime.All their equipment tha is and instruments are alive.All their equipment and instruments are alive.I watched the storm so beautiful yet terrific.Silver mist suffused the deck of the ship.<\\/p>\",\"image\":\"6353da6f575171666439791.png\"}', NULL, 'ptc_diamond', 'er-zijn-vele-variaties-van-passages-van', 13, '2022-10-22 09:13:15', '2023-11-30 06:32:58');
INSERT INTO `frontends` (`id`, `data_keys`, `data_values`, `seo_content`, `tempname`, `slug`, `view`, `created_at`, `updated_at`) VALUES
(96, 'blog.element', '{\"has_image\":[\"1\"],\"title\":\"Het is al geruime tijd een bekend geg\",\"description\":\"<p style=\\\"margin:20px 0px 21px;font-size:16px;color:rgb(102,102,102);line-height:30px;font-family:\'Noto Sans\', sans-serif;\\\">There are many variations of passages of Lorem Ipsum available, but the majority have suffered that the alteration in some form by injected humour or the an randomised words which don\'t look even evry is and slightly believable. If you are going to use a passage of Lorem Ipsum you need to be sure there isn\'t is the anything aembarrassing hidden in the middle of text.Ipsum available but the majority have that suffered is alteration in some form by injected humour or randomised words.<\\/p><p class=\\\"marked\\\" style=\\\"margin:20px 0px 21px;font-size:16px;color:rgb(0,0,80);line-height:30px;font-style:italic;font-family:\'Noto Sans\', sans-serif;\\\">All their equipment and instruments are alive.All their equipment and instruments are alive. I the that about to watched storm, so beautiful terrific.Silver mist suffused the deck the ship.The are recorded voice the a dumm a scratched the Tthst speaker. Almost before we knew it.Almost is before we knew it we had left the dummy is ground.<\\/p><p style=\\\"margin:20px 0px 6px;font-size:16px;color:rgb(102,102,102);line-height:30px;font-family:\'Noto Sans\', sans-serif;\\\">The face of the moon was in shadow.The spectacle before us was indeed sublime.All their equipment tha is and instruments are alive.All their equipment and instruments are alive.I watched the storm so beautiful yet terrific.Silver mist suffused the deck of the ship.<\\/p>\",\"image\":\"6353da79b93f71666439801.png\"}', NULL, 'ptc_diamond', 'het-is-al-geruime-tijd-een-bekend-geg', 111, '2022-10-22 09:13:15', '2024-05-10 15:59:10'),
(97, 'blog.element', '{\"has_image\":[\"1\"],\"title\":\"Law firm opened near to that gonig to\",\"description\":\"<p style=\\\"margin:20px 0px 21px;font-size:16px;color:rgb(102,102,102);line-height:30px;font-family:\'Noto Sans\', sans-serif;\\\">There are many variations of passages of Lorem Ipsum available, but the majority have suffered that the alteration in some form by injected humour or the an randomised words which don\'t look even evry is and slightly believable. If you are going to use a passage of Lorem Ipsum you need to be sure there isn\'t is the anything aembarrassing hidden in the middle of text.Ipsum available but the majority have that suffered is alteration in some form by injected humour or randomised words.<\\/p><p class=\\\"marked\\\" style=\\\"margin:20px 0px 21px;font-size:16px;color:rgb(0,0,80);line-height:30px;font-style:italic;font-family:\'Noto Sans\', sans-serif;\\\">All their equipment and instruments are alive.All their equipment and instruments are alive. I the that about to watched storm, so beautiful terrific.Silver mist suffused the deck the ship.The are recorded voice the a dumm a scratched the Tthst speaker. Almost before we knew it.Almost is before we knew it we had left the dummy is ground.<\\/p><p style=\\\"margin:20px 0px 6px;font-size:16px;color:rgb(102,102,102);line-height:30px;font-family:\'Noto Sans\', sans-serif;\\\">The face of the moon was in shadow.The spectacle before us was indeed sublime.All their equipment tha is and instruments are alive.All their equipment and instruments are alive.I watched the storm so beautiful yet terrific.Silver mist suffused the deck of the ship.<\\/p>\",\"image\":\"6353da8e4db201666439822.png\"}', NULL, 'ptc_diamond', 'law-firm-opened-near-to-that-gonig-to-2', 140, '2022-10-22 09:13:15', '2024-06-05 07:34:40'),
(98, 'blog.element', '{\"has_image\":[\"1\"],\"title\":\"Law firm opened near to that gonig to\",\"description\":\"<p style=\\\"margin:20px 0px 21px;font-size:16px;color:rgb(102,102,102);line-height:30px;font-family:\'Noto Sans\', sans-serif;\\\">There are many variations of passages of Lorem Ipsum available, but the majority have suffered that the alteration in some form by injected humour or the an randomised words which don\'t look even evry is and slightly believable. If you are going to use a passage of Lorem Ipsum you need to be sure there isn\'t is the anything aembarrassing hidden in the middle of text.Ipsum available but the majority have that suffered is alteration in some form by injected humour or randomised words.<\\/p><p class=\\\"marked\\\" style=\\\"margin:20px 0px 21px;font-size:16px;color:rgb(0,0,80);line-height:30px;font-style:italic;font-family:\'Noto Sans\', sans-serif;\\\">All their equipment and instruments are alive.All their equipment and instruments are alive. I the that about to watched storm, so beautiful terrific.Silver mist suffused the deck the ship.The are recorded voice the a dumm a scratched the Tthst speaker. Almost before we knew it.Almost is before we knew it we had left the dummy is ground.<\\/p><p style=\\\"margin:20px 0px 6px;font-size:16px;color:rgb(102,102,102);line-height:30px;font-family:\'Noto Sans\', sans-serif;\\\">The face of the moon was in shadow.The spectacle before us was indeed sublime.All their equipment tha is and instruments are alive.All their equipment and instruments are alive.I watched the storm so beautiful yet terrific.Silver mist suffused the deck of the ship.<\\/p>\",\"image\":\"6353daa14a4121666439841.png\"}', NULL, 'ptc_diamond', 'law-firm-opened-near-to-that-gonig-to-1', 163, '2022-10-22 09:13:15', '2024-06-05 07:34:29'),
(99, 'breadcrumb.content', '{\"has_image\":\"1\",\"image\":\"6353da0bc1a7a1666439691.png\"}', NULL, 'ptc_diamond', NULL, 0, '2022-10-22 09:13:20', '2022-10-22 09:54:51'),
(100, 'contact.content', '{\"has_image\":\"1\",\"heading\":\"Send Your Messages\",\"image\":\"6353db3012f591666439984.png\"}', NULL, 'ptc_diamond', NULL, 0, '2022-10-22 09:20:10', '2022-10-22 09:59:44'),
(101, 'contact.element', '{\"icon\":\"<i class=\\\"far fa-envelope\\\"><\\/i>\",\"title\":\"Email Address\",\"content\":\"contact@ptcl.com\"}', NULL, 'ptc_diamond', NULL, 0, '2022-10-22 09:20:10', '2022-10-22 09:20:10'),
(102, 'contact.element', '{\"icon\":\"<i class=\\\"fas fa-phone\\\"><\\/i>\",\"title\":\"Phone Number\",\"content\":\"+012-345-67890\"}', NULL, 'ptc_diamond', NULL, 0, '2022-10-22 09:20:10', '2022-10-22 09:20:10'),
(103, 'contact.element', '{\"icon\":\"<i class=\\\"fas fa-map-marker-alt\\\"><\\/i>\",\"title\":\"Office Address\",\"content\":\"ABC road street, Cool City\"}', NULL, 'ptc_diamond', NULL, 0, '2022-10-22 09:20:10', '2022-10-22 09:20:10'),
(104, 'counter.content', '{\"has_image\":\"1\",\"heading\":\"Best Place To Earn Money Online Join Us\",\"subheading\":\"Discover More\",\"description\":\"Lorem ipsum dolor, sit amet consectetur adipisicing elit. Doloremque natus, repellendus consequatur, animi minima ex quidem temporibus ab odio, eaque aliquid consectetur.\",\"background_image\":\"6353d5cdce1e71666438605.png\"}', NULL, 'ptc_diamond', NULL, 0, '2022-10-22 09:20:16', '2022-10-22 09:36:46'),
(105, 'counter.element', '{\"title\":\"Withdraw\",\"number\":\"$50\",\"range\":\"K+\"}', NULL, 'ptc_diamond', NULL, 0, '2022-10-22 09:20:16', '2022-10-23 09:07:42'),
(106, 'counter.element', '{\"title\":\"Users\",\"number\":\"30\",\"range\":\"K+\"}', NULL, 'ptc_diamond', NULL, 0, '2022-10-22 09:20:16', '2022-10-23 09:08:04'),
(107, 'counter.element', '{\"title\":\"Impression\",\"number\":\"20\",\"range\":\"M+\"}', NULL, 'ptc_diamond', NULL, 0, '2022-10-22 09:20:16', '2022-10-23 09:08:15'),
(108, 'counter.element', '{\"title\":\"Advertisement\",\"number\":\"568\",\"range\":\"K+\"}', NULL, 'ptc_diamond', NULL, 0, '2022-10-22 09:20:16', '2022-10-23 09:08:24'),
(109, 'faq.content', '{\"heading\":\"Frequently Asked Question\",\"subheading\":\"FAQ\"}', NULL, 'ptc_diamond', NULL, 0, '2022-10-22 09:20:22', '2022-10-22 09:20:22'),
(110, 'faq.element', '{\"question\":\"What constitutes a quorum in a PTC?\",\"answer\":\"The standard definition of a quorum in Robert\'s Rules of Order is that the majority of an assembly must be present to conduct business. That is, if there are twenty members of a group, eleven must be present to constitute a quorum. The same requirement for a quorum applies to PTCs, with one additional provision. The Handbook (4.1.8.3) provides that absentee votes will be counted in PTCs, whereas Robert\'s Rules really do not provide for a mixture of absentee and in-person votes in an assembly\"}', NULL, 'ptc_diamond', NULL, 0, '2022-10-22 09:20:22', '2022-10-22 09:20:22'),
(111, 'faq.element', '{\"question\":\"What constitutes a positive or negative vote in PTCs?\",\"answer\":\"The standard definition of a quorum in Robert\'s Rules of Order is that the majority of an assembly must be present to conduct business. That is, if there are twenty members of a group, eleven must be present to constitute a quorum. The same requirement for a quorum applies to PTCs, with one additional provision. The Handbook (4.1.8.3) provides that absentee votes will be counted in PTCs, whereas Robert\'s Rules really do not provide for a mixture of absentee and in-person votes in an assembly\"}', NULL, 'ptc_diamond', NULL, 0, '2022-10-22 09:20:22', '2022-10-22 09:20:22'),
(112, 'faq.element', '{\"question\":\"Can an abstention vote be cast at a PTC meeting?\",\"answer\":\"The standard definition of a quorum in Robert\'s Rules of Order is that the majority of an assembly must be present to conduct business. That is, if there are twenty members of a group, eleven must be present to constitute a quorum. The same requirement for a quorum applies to PTCs, with one additional provision. The Handbook (4.1.8.3) provides that absentee votes will be counted in PTCs, whereas Robert\'s Rules really do not provide for a mixture of absentee and in-person votes in an assembly\"}', NULL, 'ptc_diamond', NULL, 0, '2022-10-22 09:20:22', '2022-10-22 09:20:22'),
(113, 'faq.element', '{\"question\":\"Can a faculty member on OCSA or FML serve on a PTC?\",\"answer\":\"The standard definition of a quorum in Robert\'s Rules of Order is that the majority of an assembly must be present to conduct business. That is, if there are twenty members of a group, eleven must be present to constitute a quorum. The same requirement for a quorum applies to PTCs, with one additional provision. The Handbook (4.1.8.3) provides that absentee votes will be counted in PTCs, whereas Robert\'s Rules really do not provide for a mixture of absentee and in-person votes in an assembly\"}', NULL, 'ptc_diamond', NULL, 0, '2022-10-22 09:20:22', '2022-10-22 09:20:22'),
(114, 'faq.element', '{\"question\":\"How will additional members of PTCs be elected in departments with fewer than four tenured faculty members?\",\"answer\":\"The standard definition of a quorum in Robert\'s Rules of Order is that the majority of an assembly must be present to conduct business. That is, if there are twenty members of a group, eleven must be present to constitute a quorum. The same requirement for a quorum applies to PTCs, with one additional provision. The Handbook (4.1.8.3) provides that absentee votes will be counted in PTCs, whereas Robert\'s Rules really do not provide for a mixture of absentee and in-person votes in an assembly\"}', NULL, 'ptc_diamond', NULL, 0, '2022-10-22 09:20:22', '2022-10-22 09:20:22'),
(115, 'faq.element', '{\"question\":\"How can absentee ballots be cast?\",\"answer\":\"The standard definition of a quorum in Robert\'s Rules of Order is that the majority of an assembly must be present to conduct business. That is, if there are twenty members of a group, eleven must be present to constitute a quorum. The same requirement for a quorum applies to PTCs, with one additional provision. The Handbook (4.1.8.3) provides that absentee votes will be counted in PTCs, whereas Robert\'s Rules really do not provide for a mixture of absentee and in-person votes in an assembly\"}', NULL, 'ptc_diamond', NULL, 0, '2022-10-22 09:20:22', '2022-10-22 09:20:22'),
(116, 'faq.element', '{\"question\":\"Why should members of the PTC fill out vote justification forms explaining their votes?\",\"answer\":\"The standard definition of a quorum in Robert\'s Rules of Order is that the majority of an assembly must be present to conduct business. That is, if there are twenty members of a group, eleven must be present to constitute a quorum. The same requirement for a quorum applies to PTCs, with one additional provision. The Handbook (4.1.8.3) provides that absentee votes will be counted in PTCs, whereas Robert\'s Rules really do not provide for a mixture of absentee and in-person votes in an assembly\"}', NULL, 'ptc_diamond', NULL, 0, '2022-10-22 09:20:22', '2022-10-22 09:20:22'),
(117, 'features.content', '{\"heading\":\"Features Which Helps You Earn More\",\"subheading\":\"Our Features\"}', NULL, 'ptc_diamond', NULL, 0, '2022-10-22 09:20:28', '2022-10-22 09:20:28'),
(118, 'features.element', '{\"icon\":\"<i class=\\\"las la-globe-americas\\\"><\\/i>\",\"title\":\"We\'re Global\",\"content\":\"Voluptatibus at vero, amet sit esse sequi quam odio debitis. Nulla porro tenetur adipisci laborum sunt repellendus error, asperiores quam nobis sit!\"}', NULL, 'ptc_diamond', NULL, 0, '2022-10-22 09:20:28', '2022-10-22 09:20:28'),
(119, 'features.element', '{\"icon\":\"<i class=\\\"las la-headset\\\"><\\/i>\",\"title\":\"Best Support\",\"content\":\"Voluptatibus at vero, amet sit esse sequi quam odio debitis. Nulla porro tenetur adipisci laborum sunt repellendus error, asperiores quam nobis sit!\"}', NULL, 'ptc_diamond', NULL, 0, '2022-10-22 09:20:28', '2022-10-22 09:20:28'),
(120, 'features.element', '{\"icon\":\"<i class=\\\"lab la-bitcoin\\\"><\\/i>\",\"title\":\"We Accept Crypto\",\"content\":\"Voluptatibus at vero, amet sit esse sequi quam odio debitis. Nulla porro tenetur adipisci laborum sunt repellendus error, asperiores quam nobis sit!\"}', NULL, 'ptc_diamond', NULL, 0, '2022-10-22 09:20:28', '2022-10-22 09:20:28'),
(121, 'features.element', '{\"icon\":\"<i class=\\\"las la-chart-bar\\\"><\\/i>\",\"title\":\"We\'re Profitable\",\"content\":\"Voluptatibus at vero, amet sit esse sequi quam odio debitis. Nulla porro tenetur adipisci laborum sunt repellendus error, asperiores quam nobis sit!\"}', NULL, 'ptc_diamond', NULL, 0, '2022-10-22 09:20:28', '2022-10-22 09:20:28'),
(122, 'features.element', '{\"icon\":\"<i class=\\\"las la-lock\\\"><\\/i>\",\"title\":\"We\'re Secure\",\"content\":\"Voluptatibus at vero, amet sit esse sequi quam odio debitis. Nulla porro tenetur adipisci laborum sunt repellendus error, asperiores quam nobis sit!\"}', NULL, 'ptc_diamond', NULL, 0, '2022-10-22 09:20:28', '2022-10-22 09:20:28'),
(123, 'features.element', '{\"icon\":\"<i class=\\\"lar la-copy\\\"><\\/i>\",\"title\":\"We\'re Certified\",\"content\":\"Voluptatibus at vero, amet sit esse sequi quam odio debitis. Nulla porro tenetur adipisci laborum sunt repellendus error, asperiores quam nobis sit!\"}', NULL, 'ptc_diamond', NULL, 0, '2022-10-22 09:20:28', '2022-10-22 09:20:28'),
(124, 'features.element', '{\"icon\":\"<i class=\\\"las la-file-invoice-dollar\\\"><\\/i>\",\"title\":\"Earning Statement\",\"content\":\"Search engine advertising, also known as search engine marketing (SEM), allows you to show ads to users based on the keywords.\"}', NULL, 'ptc_diamond', NULL, 0, '2022-10-22 09:20:28', '2022-10-22 09:20:28'),
(125, 'features.element', '{\"icon\":\"<i class=\\\"lar la-credit-card\\\"><\\/i>\",\"title\":\"Secure Transection\",\"content\":\"Search engine advertising, also known as search engine marketing (SEM), allows you to show ads to users based on the keywords.\"}', NULL, 'ptc_diamond', NULL, 0, '2022-10-22 09:20:28', '2022-10-22 09:20:28'),
(126, 'testimonial.content', '{\"heading\":\"What Our Clients Say\",\"subheading\":\"Testimonial\"}', NULL, 'ptc_diamond', NULL, 0, '2022-10-22 09:24:43', '2022-10-22 09:24:43'),
(127, 'testimonial.element', '{\"has_image\":\"1\",\"name\":\"Chris Hamsorth\",\"designation\":\"PTC Player\",\"comment\":\"Lorem ipsum dolor sit amet, consectetur adipisicing elit. Voluptatibus fuga, lauda ium odio dolor ut  iusto,  pariatur neque ique quod ratione tempore velit iure sapiente beatae id dolores.\",\"reason\":\"Design Quality\",\"image\":\"6353da1fdaed41666439711.png\"}', NULL, 'ptc_diamond', NULL, 0, '2022-10-22 09:24:43', '2022-10-22 09:55:11'),
(128, 'testimonial.element', '{\"has_image\":\"1\",\"name\":\"John Doe\",\"designation\":\"Businessman\",\"comment\":\"Lorem ipsum dolor sit amet, consectetur adipisicing elit. Voluptatibus fuga, lauda ium odio dolor ut  iusto,  pariatur neque ique quod ratione tempore velit iure sapiente beatae id dolores.\",\"reason\":\"For Support\",\"image\":\"6353da26117611666439718.png\"}', NULL, 'ptc_diamond', NULL, 0, '2022-10-22 09:24:43', '2022-10-22 09:55:18'),
(129, 'testimonial.element', '{\"has_image\":\"1\",\"name\":\"Rajendra\",\"designation\":\"Web Developer\",\"comment\":\"Lorem ipsum dolor sit amet, consectetur adipisicing elit. Voluptatibus fuga, lauda ium odio dolor ut  iusto,  pariatur neque ique quod ratione tempore velit iure sapiente beatae id dolores.v\",\"reason\":\"Code Quality\",\"image\":\"6353da2be597b1666439723.png\"}', NULL, 'ptc_diamond', NULL, 0, '2022-10-22 09:24:43', '2022-10-22 09:55:23'),
(130, 'testimonial.element', '{\"has_image\":\"1\",\"name\":\"Peter Parker\",\"designation\":\"Microtech, Inc.\",\"comment\":\"Lorem ipsum dolor sit amet, consectetur adipisicing elit. Voluptatibus fuga, lauda ium odio dolor ut  iusto,  pariatur neque ique quod ratione tempore velit iure sapiente beatae id dolores.\",\"reason\":\"Design Quality\",\"image\":\"6353da31690f01666439729.png\"}', NULL, 'ptc_diamond', NULL, 0, '2022-10-22 09:24:43', '2022-10-22 09:55:29'),
(131, 'header.content', '{\"phone\":\"+1212121245545\",\"email\":\"company@email.com\"}', NULL, 'ptc_diamond', NULL, 0, '2022-10-22 09:26:04', '2022-10-22 09:26:04'),
(132, 'footer.content', '{\"heading\":\"About Us\",\"description\":\"Maecenas tempus tellus egondime honcus sequam seitmet dipiscing sem eque sedipsuNam quam egondime honcus sequam\"}', NULL, 'ptc_diamond', NULL, 0, '2022-10-22 09:26:20', '2022-10-22 09:26:20'),
(133, 'client.element', '{\"has_image\":\"1\",\"image\":\"6353d507b0c481666438407.png\"}', NULL, 'ptc_diamond', NULL, 0, '2022-10-22 09:33:27', '2022-10-22 09:33:27'),
(134, 'client.element', '{\"has_image\":\"1\",\"image\":\"6353d50cc10a11666438412.png\"}', NULL, 'ptc_diamond', NULL, 0, '2022-10-22 09:33:32', '2022-10-22 09:33:32'),
(135, 'client.element', '{\"has_image\":\"1\",\"image\":\"6353d512b35a71666438418.png\"}', NULL, 'ptc_diamond', NULL, 0, '2022-10-22 09:33:38', '2022-10-22 09:33:38'),
(136, 'client.element', '{\"has_image\":\"1\",\"image\":\"6353d51b1e5f31666438427.png\"}', NULL, 'ptc_diamond', NULL, 0, '2022-10-22 09:33:47', '2022-10-22 09:33:47'),
(137, 'client.element', '{\"has_image\":\"1\",\"image\":\"6353d524125c01666438436.png\"}', NULL, 'ptc_diamond', NULL, 0, '2022-10-22 09:33:56', '2022-10-22 09:33:56'),
(138, 'client.element', '{\"has_image\":\"1\",\"image\":\"6353d528dcbf81666438440.png\"}', NULL, 'ptc_diamond', NULL, 0, '2022-10-22 09:34:00', '2022-10-22 09:34:00'),
(139, 'client.element', '{\"has_image\":\"1\",\"image\":\"6353d52e3b1601666438446.png\"}', NULL, 'ptc_diamond', NULL, 0, '2022-10-22 09:34:06', '2022-10-22 09:34:06'),
(140, 'client.element', '{\"has_image\":\"1\",\"image\":\"6353d533830ce1666438451.png\"}', NULL, 'ptc_diamond', NULL, 0, '2022-10-22 09:34:11', '2022-10-22 09:34:11'),
(141, 'login.content', '{\"has_image\":\"1\",\"heading\":\"Sign In\",\"image\":\"6353d5f00b9aa1666438640.png\"}', NULL, 'ptc_diamond', NULL, 0, '2022-10-22 09:37:10', '2022-10-22 09:37:20'),
(142, 'register.content', '{\"has_image\":\"1\",\"heading\":\"Register New Account\",\"image\":\"6353d9d75dec21666439639.png\"}', NULL, 'ptc_diamond', NULL, 0, '2022-10-22 09:53:31', '2022-10-22 09:53:59'),
(143, 'plan.content', '{\"heading\":\"Choose The Best Plan\",\"subheading\":\"Our Plan Packages\"}', NULL, 'ptc_diamond', NULL, 0, '2022-10-22 09:57:34', '2022-10-22 09:57:34'),
(144, 'policy_pages.element', '{\"title\":\"Privacy and Policy\",\"details\":\"<div class=\\\"mb-5\\\" style=\\\"color:rgb(111,111,111);font-family:Nunito, sans-serif;margin-bottom:3rem;\\\"><h3 class=\\\"mb-3\\\" style=\\\"font-weight:600;line-height:1.3;font-size:24px;font-family:Exo, sans-serif;color:rgb(54,54,54);\\\">What information do we collect?<\\/h3><p class=\\\"font-18\\\" style=\\\"margin-right:0px;margin-left:0px;font-size:18px;\\\">We gather data from you when you register on our site, submit a request, buy any services, react to an overview, or round out a structure. At the point when requesting any assistance or enrolling on our site, as suitable, you might be approached to enter your: name, email address, or telephone number. You may, nonetheless, visit our site anonymously.<\\/p><\\/div><div class=\\\"mb-5\\\" style=\\\"color:rgb(111,111,111);font-family:Nunito, sans-serif;margin-bottom:3rem;\\\"><h3 class=\\\"mb-3\\\" style=\\\"font-weight:600;line-height:1.3;font-size:24px;font-family:Exo, sans-serif;color:rgb(54,54,54);\\\">How do we protect your information?<\\/h3><p class=\\\"font-18\\\" style=\\\"margin-right:0px;margin-left:0px;font-size:18px;\\\">All provided delicate\\/credit data is sent through Stripe.<br \\/>After an exchange, your private data (credit cards, social security numbers, financials, and so on) won\'t be put away on our workers.<\\/p><\\/div><div class=\\\"mb-5\\\" style=\\\"color:rgb(111,111,111);font-family:Nunito, sans-serif;margin-bottom:3rem;\\\"><h3 class=\\\"mb-3\\\" style=\\\"font-weight:600;line-height:1.3;font-size:24px;font-family:Exo, sans-serif;color:rgb(54,54,54);\\\">Do we disclose any information to outside parties?<\\/h3><p class=\\\"font-18\\\" style=\\\"margin-right:0px;margin-left:0px;font-size:18px;\\\">We don\'t sell, exchange, or in any case move to outside gatherings by and by recognizable data. This does exclude confided in outsiders who help us in working our site, leading our business, or adjusting you, since those gatherings consent to keep this data private. We may likewise deliver your data when we accept discharge is suitable to follow the law, implement our site strategies, or ensure our own or others\' rights, property, or wellbeing.<\\/p><\\/div><div class=\\\"mb-5\\\" style=\\\"color:rgb(111,111,111);font-family:Nunito, sans-serif;margin-bottom:3rem;\\\"><h3 class=\\\"mb-3\\\" style=\\\"font-weight:600;line-height:1.3;font-size:24px;font-family:Exo, sans-serif;color:rgb(54,54,54);\\\">Children\'s Online Privacy Protection Act Compliance<\\/h3><p class=\\\"font-18\\\" style=\\\"margin-right:0px;margin-left:0px;font-size:18px;\\\">We are consistent with the prerequisites of COPPA (Children\'s Online Privacy Protection Act), we don\'t gather any data from anybody under 13 years old. Our site, items, and administrations are completely coordinated to individuals who are in any event 13 years of age or more established.<\\/p><\\/div><div class=\\\"mb-5\\\" style=\\\"color:rgb(111,111,111);font-family:Nunito, sans-serif;margin-bottom:3rem;\\\"><h3 class=\\\"mb-3\\\" style=\\\"font-weight:600;line-height:1.3;font-size:24px;font-family:Exo, sans-serif;color:rgb(54,54,54);\\\">Changes to our Privacy Policy<\\/h3><p class=\\\"font-18\\\" style=\\\"margin-right:0px;margin-left:0px;font-size:18px;\\\">If we decide to change our privacy policy, we will post those changes on this page.<\\/p><\\/div><div class=\\\"mb-5\\\" style=\\\"color:rgb(111,111,111);font-family:Nunito, sans-serif;margin-bottom:3rem;\\\"><h3 class=\\\"mb-3\\\" style=\\\"font-weight:600;line-height:1.3;font-size:24px;font-family:Exo, sans-serif;color:rgb(54,54,54);\\\">How long we retain your information?<\\/h3><p class=\\\"font-18\\\" style=\\\"margin-right:0px;margin-left:0px;font-size:18px;\\\">At the point when you register for our site, we cycle and keep your information we have about you however long you don\'t erase the record or withdraw yourself (subject to laws and guidelines).<\\/p><\\/div><div class=\\\"mb-5\\\" style=\\\"color:rgb(111,111,111);font-family:Nunito, sans-serif;margin-bottom:3rem;\\\"><h3 class=\\\"mb-3\\\" style=\\\"font-weight:600;line-height:1.3;font-size:24px;font-family:Exo, sans-serif;color:rgb(54,54,54);\\\">What we don\\u2019t do with your data<\\/h3><p class=\\\"font-18\\\" style=\\\"margin-right:0px;margin-left:0px;font-size:18px;\\\">We don\'t and will never share, unveil, sell, or in any case give your information to different organizations for the promoting of their items or administrations.<\\/p><\\/div>\"}', NULL, 'ptc_diamond', 'privacy-and-policy', 0, '2022-10-22 10:24:11', '2022-10-22 10:24:11'),
(145, 'policy_pages.element', '{\"title\":\"Payment Policy\",\"details\":\"<div class=\\\"mb-5\\\" style=\\\"color:rgb(111,111,111);font-family:Nunito, sans-serif;margin-bottom:3rem;\\\"><h3 class=\\\"mb-3\\\" style=\\\"font-weight:600;line-height:1.3;font-size:24px;font-family:Exo, sans-serif;color:rgb(54,54,54);\\\">What information do we collect?<\\/h3><p class=\\\"font-18\\\" style=\\\"margin-right:0px;margin-left:0px;font-size:18px;\\\">We gather data from you when you register on our site, submit a request, buy any services, react to an overview, or round out a structure. At the point when requesting any assistance or enrolling on our site, as suitable, you might be approached to enter your: name, email address, or telephone number. You may, nonetheless, visit our site anonymously.<\\/p><\\/div><div class=\\\"mb-5\\\" style=\\\"color:rgb(111,111,111);font-family:Nunito, sans-serif;margin-bottom:3rem;\\\"><h3 class=\\\"mb-3\\\" style=\\\"font-weight:600;line-height:1.3;font-size:24px;font-family:Exo, sans-serif;color:rgb(54,54,54);\\\">How do we protect your information?<\\/h3><p class=\\\"font-18\\\" style=\\\"margin-right:0px;margin-left:0px;font-size:18px;\\\">All provided delicate\\/credit data is sent through Stripe.<br \\/>After an exchange, your private data (credit cards, social security numbers, financials, and so on) won\'t be put away on our workers.<\\/p><\\/div><div class=\\\"mb-5\\\" style=\\\"color:rgb(111,111,111);font-family:Nunito, sans-serif;margin-bottom:3rem;\\\"><h3 class=\\\"mb-3\\\" style=\\\"font-weight:600;line-height:1.3;font-size:24px;font-family:Exo, sans-serif;color:rgb(54,54,54);\\\">Do we disclose any information to outside parties?<\\/h3><p class=\\\"font-18\\\" style=\\\"margin-right:0px;margin-left:0px;font-size:18px;\\\">We don\'t sell, exchange, or in any case move to outside gatherings by and by recognizable data. This does exclude confided in outsiders who help us in working our site, leading our business, or adjusting you, since those gatherings consent to keep this data private. We may likewise deliver your data when we accept discharge is suitable to follow the law, implement our site strategies, or ensure our own or others\' rights, property, or wellbeing.<\\/p><\\/div><div class=\\\"mb-5\\\" style=\\\"color:rgb(111,111,111);font-family:Nunito, sans-serif;margin-bottom:3rem;\\\"><h3 class=\\\"mb-3\\\" style=\\\"font-weight:600;line-height:1.3;font-size:24px;font-family:Exo, sans-serif;color:rgb(54,54,54);\\\">Children\'s Online Privacy Protection Act Compliance<\\/h3><p class=\\\"font-18\\\" style=\\\"margin-right:0px;margin-left:0px;font-size:18px;\\\">We are consistent with the prerequisites of COPPA (Children\'s Online Privacy Protection Act), we don\'t gather any data from anybody under 13 years old. Our site, items, and administrations are completely coordinated to individuals who are in any event 13 years of age or more established.<\\/p><\\/div><div class=\\\"mb-5\\\" style=\\\"color:rgb(111,111,111);font-family:Nunito, sans-serif;margin-bottom:3rem;\\\"><h3 class=\\\"mb-3\\\" style=\\\"font-weight:600;line-height:1.3;font-size:24px;font-family:Exo, sans-serif;color:rgb(54,54,54);\\\">Changes to our Privacy Policy<\\/h3><p class=\\\"font-18\\\" style=\\\"margin-right:0px;margin-left:0px;font-size:18px;\\\">If we decide to change our privacy policy, we will post those changes on this page.<\\/p><\\/div><div class=\\\"mb-5\\\" style=\\\"color:rgb(111,111,111);font-family:Nunito, sans-serif;margin-bottom:3rem;\\\"><h3 class=\\\"mb-3\\\" style=\\\"font-weight:600;line-height:1.3;font-size:24px;font-family:Exo, sans-serif;color:rgb(54,54,54);\\\">How long we retain your information?<\\/h3><p class=\\\"font-18\\\" style=\\\"margin-right:0px;margin-left:0px;font-size:18px;\\\">At the point when you register for our site, we cycle and keep your information we have about you however long you don\'t erase the record or withdraw yourself (subject to laws and guidelines).<\\/p><\\/div><div class=\\\"mb-5\\\" style=\\\"color:rgb(111,111,111);font-family:Nunito, sans-serif;margin-bottom:3rem;\\\"><h3 class=\\\"mb-3\\\" style=\\\"font-weight:600;line-height:1.3;font-size:24px;font-family:Exo, sans-serif;color:rgb(54,54,54);\\\">What we don\\u2019t do with your data<\\/h3><p class=\\\"font-18\\\" style=\\\"margin-right:0px;margin-left:0px;font-size:18px;\\\">We don\'t and will never share, unveil, sell, or in any case give your information to different organizations for the promoting of their items or administrations.<\\/p><\\/div>\"}', NULL, 'ptc_diamond', 'payment-policy', 0, '2022-10-22 10:24:11', '2022-10-22 10:24:11'),
(146, 'policy_pages.element', '{\"title\":\"Support Policy\",\"details\":\"<div class=\\\"mb-5\\\" style=\\\"margin-bottom:3rem;color:rgb(111,111,111);font-family:Nunito, sans-serif;\\\"><h3 class=\\\"mb-3\\\" style=\\\"font-weight:600;line-height:1.3;font-size:24px;color:rgb(54,54,54);font-family:Exo, sans-serif;\\\">What information do we collect?<\\/h3><p class=\\\"font-18\\\" style=\\\"margin-right:0px;margin-left:0px;font-size:18px;\\\">We gather data from you when you register on our site, submit a request, buy any services, react to an overview, or round out a structure. At the point when requesting any assistance or enrolling on our site, as suitable, you might be approached to enter your: name, email address, or telephone number. You may, nonetheless, visit our site anonymously.<\\/p><\\/div><div class=\\\"mb-5\\\" style=\\\"margin-bottom:3rem;color:rgb(111,111,111);font-family:Nunito, sans-serif;\\\"><h3 class=\\\"mb-3\\\" style=\\\"font-weight:600;line-height:1.3;font-size:24px;color:rgb(54,54,54);font-family:Exo, sans-serif;\\\">How do we protect your information?<\\/h3><p class=\\\"font-18\\\" style=\\\"margin-right:0px;margin-left:0px;font-size:18px;\\\">All provided delicate\\/credit data is sent through Stripe.<br \\/>After an exchange, your private data (credit cards, social security numbers, financials, and so on) won\'t be put away on our workers.<\\/p><\\/div><div class=\\\"mb-5\\\" style=\\\"margin-bottom:3rem;color:rgb(111,111,111);font-family:Nunito, sans-serif;\\\"><h3 class=\\\"mb-3\\\" style=\\\"font-weight:600;line-height:1.3;font-size:24px;color:rgb(54,54,54);font-family:Exo, sans-serif;\\\">Do we disclose any information to outside parties?<\\/h3><p class=\\\"font-18\\\" style=\\\"margin-right:0px;margin-left:0px;font-size:18px;\\\">We don\'t sell, exchange, or in any case move to outside gatherings by and by recognizable data. This does exclude confided in outsiders who help us in working our site, leading our business, or adjusting you, since those gatherings consent to keep this data private. We may likewise deliver your data when we accept discharge is suitable to follow the law, implement our site strategies, or ensure our own or others\' rights, property, or wellbeing.<\\/p><\\/div><div class=\\\"mb-5\\\" style=\\\"margin-bottom:3rem;color:rgb(111,111,111);font-family:Nunito, sans-serif;\\\"><h3 class=\\\"mb-3\\\" style=\\\"font-weight:600;line-height:1.3;font-size:24px;color:rgb(54,54,54);font-family:Exo, sans-serif;\\\">Children\'s Online Privacy Protection Act Compliance<\\/h3><p class=\\\"font-18\\\" style=\\\"margin-right:0px;margin-left:0px;font-size:18px;\\\">We are consistent with the prerequisites of COPPA (Children\'s Online Privacy Protection Act), we don\'t gather any data from anybody under 13 years old. Our site, items, and administrations are completely coordinated to individuals who are in any event 13 years of age or more established.<\\/p><\\/div><div class=\\\"mb-5\\\" style=\\\"margin-bottom:3rem;color:rgb(111,111,111);font-family:Nunito, sans-serif;\\\"><h3 class=\\\"mb-3\\\" style=\\\"font-weight:600;line-height:1.3;font-size:24px;color:rgb(54,54,54);font-family:Exo, sans-serif;\\\">Changes to our Privacy Policy<\\/h3><p class=\\\"font-18\\\" style=\\\"margin-right:0px;margin-left:0px;font-size:18px;\\\">If we decide to change our privacy policy, we will post those changes on this page.<\\/p><\\/div><div class=\\\"mb-5\\\" style=\\\"margin-bottom:3rem;color:rgb(111,111,111);font-family:Nunito, sans-serif;\\\"><h3 class=\\\"mb-3\\\" style=\\\"font-weight:600;line-height:1.3;font-size:24px;color:rgb(54,54,54);font-family:Exo, sans-serif;\\\">How long we retain your information?<\\/h3><p class=\\\"font-18\\\" style=\\\"margin-right:0px;margin-left:0px;font-size:18px;\\\">At the point when you register for our site, we cycle and keep your information we have about you however long you don\'t erase the record or withdraw yourself (subject to laws and guidelines).<\\/p><\\/div><div class=\\\"mb-5\\\" style=\\\"margin-bottom:3rem;color:rgb(111,111,111);font-family:Nunito, sans-serif;\\\"><h3 class=\\\"mb-3\\\" style=\\\"font-weight:600;line-height:1.3;font-size:24px;color:rgb(54,54,54);font-family:Exo, sans-serif;\\\">What we don\\u2019t do with your data<\\/h3><p class=\\\"font-18\\\" style=\\\"margin-right:0px;margin-left:0px;font-size:18px;\\\">We don\'t and will never share, unveil, sell, or in any case give your information to different organizations for the promoting of their items or administrations.<\\/p><\\/div>\"}', NULL, 'ptc_diamond', 'support-policy', 0, '2022-10-22 10:34:15', '2022-10-22 10:34:15'),
(147, 'brand.element', '{\"has_image\":\"1\",\"image\":\"6354ede4936a71666510308.png\"}', NULL, 'ptc_diamond', NULL, 0, '2022-10-23 05:31:48', '2022-10-23 05:31:48'),
(148, 'brand.element', '{\"has_image\":\"1\",\"image\":\"6354edead8ff11666510314.png\"}', NULL, 'ptc_diamond', NULL, 0, '2022-10-23 05:31:54', '2022-10-23 05:31:54'),
(149, 'brand.element', '{\"has_image\":\"1\",\"image\":\"6354edf23219d1666510322.png\"}', NULL, 'ptc_diamond', NULL, 0, '2022-10-23 05:32:02', '2022-10-23 05:32:02'),
(150, 'brand.element', '{\"has_image\":\"1\",\"image\":\"6354fed25f39c1666514642.png\"}', NULL, 'ptc_diamond', NULL, 0, '2022-10-23 06:44:02', '2022-10-23 06:44:02'),
(151, 'brand.element', '{\"has_image\":\"1\",\"image\":\"6354fed9845dc1666514649.png\"}', NULL, 'ptc_diamond', NULL, 0, '2022-10-23 06:44:09', '2022-10-23 06:44:09'),
(152, 'brand.element', '{\"has_image\":\"1\",\"image\":\"6354fedf6ecd71666514655.png\"}', NULL, 'ptc_diamond', NULL, 0, '2022-10-23 06:44:15', '2022-10-23 06:44:15'),
(153, 'brand.element', '{\"has_image\":\"1\",\"image\":\"6354fee3d220e1666514659.png\"}', NULL, 'ptc_diamond', NULL, 0, '2022-10-23 06:44:19', '2022-10-23 06:44:19'),
(154, 'brand.element', '{\"has_image\":\"1\",\"image\":\"6354fee8ba3d21666514664.png\"}', NULL, 'ptc_diamond', NULL, 0, '2022-10-23 06:44:24', '2022-10-23 06:44:24'),
(155, 'kyc_info.content', '{\"verification_content\":\"Lorem ipsum, dolor sit amet consectetur adipisicing elit. Hic officia quod natus, non dicta perspiciatis, quae repellendus ea illum aut debitis sint amet? Ratione voluptates beatae numquam.\",\"pending_content\":\"Lorem ipsum, dolor sit amet consectetur adipisicing elit. Hic officia quod natus, non dicta perspiciatis, quae repellendus ea illum aut debitis sint amet? Ratione voluptates beatae numquam.\"}', NULL, 'ptc_diamond', NULL, 0, '2022-10-24 10:11:25', '2022-10-24 10:11:25'),
(156, 'social_icon.element', '{\"title\":\"Facebook\",\"icon\":\"<i class=\\\"lab la-facebook-f\\\"><\\/i>\",\"url\":\"https:\\/\\/www.facebook.com\"}', NULL, 'ptc_diamond', NULL, 0, '2022-11-03 06:44:14', '2022-11-03 06:44:14'),
(157, 'social_icon.element', '{\"title\":\"Twitter\",\"icon\":\"<i class=\\\"lab la-twitter\\\"><\\/i>\",\"url\":\"https:\\/\\/twitter.com\"}', NULL, 'ptc_diamond', NULL, 0, '2022-11-03 06:44:31', '2022-11-03 06:44:31'),
(158, 'social_icon.element', '{\"title\":\"LinkedIn\",\"icon\":\"<i class=\\\"lab la-linkedin-in\\\"><\\/i>\",\"url\":\"https:\\/\\/www.linkedin.com\"}', NULL, 'ptc_diamond', NULL, 0, '2022-11-03 06:45:13', '2022-11-03 06:45:13'),
(159, 'social_icon.element', '{\"title\":\"Instagram\",\"icon\":\"<i class=\\\"lab la-instagram\\\"><\\/i>\",\"url\":\"https:\\/\\/www.instagram.com\"}', NULL, 'ptc_diamond', NULL, 0, '2022-11-03 06:45:32', '2022-11-03 06:45:32'),
(160, 'contact.element', '{\"icon\":\"<i class=\\\"las la-map-marker\\\"><\\/i>\",\"title\":\"Office Address\",\"content\":\"ABC road street, Cool City\"}', NULL, 'ptc_planet', NULL, 0, '2023-04-18 10:58:42', '2023-04-19 04:06:02'),
(161, 'breadcrumb.content', '{\"has_image\":\"1\",\"image\":\"643e943b699b91681822779.jpg\"}', NULL, 'ptc_planet', NULL, 0, '2023-04-18 10:59:39', '2023-04-18 10:59:39'),
(162, 'login.content', '{\"has_image\":\"1\",\"image\":\"6440c08dcc54f1681965197.png\"}', NULL, 'ptc_planet', NULL, 0, '2023-04-18 11:02:00', '2023-04-20 02:33:18'),
(163, 'payment.element', '{\"has_image\":\"1\",\"image\":\"6440af3be44581681960763.png\"}', NULL, 'ptc_planet', NULL, 0, '2023-04-18 11:03:02', '2023-04-20 01:19:23'),
(164, 'payment.element', '{\"has_image\":\"1\",\"image\":\"6440af24744401681960740.png\"}', NULL, 'ptc_planet', NULL, 0, '2023-04-18 11:03:07', '2023-04-20 01:19:00'),
(165, 'payment.element', '{\"has_image\":\"1\",\"image\":\"6440af2a8c2141681960746.png\"}', NULL, 'ptc_planet', NULL, 0, '2023-04-18 11:03:12', '2023-04-20 01:19:06'),
(166, 'payment.element', '{\"has_image\":\"1\",\"image\":\"6440af314deca1681960753.png\"}', NULL, 'ptc_planet', NULL, 0, '2023-04-18 11:03:17', '2023-04-20 01:19:13'),
(167, 'payment.element', '{\"has_image\":\"1\",\"image\":\"6440af429e30d1681960770.png\"}', NULL, 'ptc_planet', NULL, 0, '2023-04-18 11:04:38', '2023-04-20 01:19:30'),
(168, 'payment.element', '{\"has_image\":\"1\",\"image\":\"6440af53a2b361681960787.png\"}', NULL, 'ptc_planet', NULL, 0, '2023-04-18 11:05:08', '2023-04-20 01:19:47'),
(169, 'payment.element', '{\"has_image\":\"1\",\"image\":\"6440af5a6ad721681960794.png\"}', NULL, 'ptc_planet', NULL, 0, '2023-04-19 03:19:01', '2023-04-20 01:19:54'),
(170, 'payment.element', '{\"has_image\":\"1\",\"image\":\"6440af62c93d21681960802.png\"}', NULL, 'ptc_planet', NULL, 0, '2023-04-19 03:19:09', '2023-04-20 01:20:02'),
(171, 'policy_pages.element', '{\"title\":\"Privacy and Policy\",\"details\":\"<div class=\\\"mb-5\\\" style=\\\"color:rgb(111,111,111);font-family:Nunito, sans-serif;margin-bottom:3rem;\\\"><h3 class=\\\"mb-3\\\" style=\\\"font-weight:600;line-height:1.3;font-size:24px;font-family:Exo, sans-serif;color:rgb(54,54,54);\\\">What information do we collect?<\\/h3><p class=\\\"font-18\\\" style=\\\"margin-right:0px;margin-left:0px;font-size:18px;\\\">We gather data from you when you register on our site, submit a request, buy any services, react to an overview, or round out a structure. At the point when requesting any assistance or enrolling on our site, as suitable, you might be approached to enter your: name, email address, or telephone number. You may, nonetheless, visit our site anonymously.<\\/p><\\/div><div class=\\\"mb-5\\\" style=\\\"color:rgb(111,111,111);font-family:Nunito, sans-serif;margin-bottom:3rem;\\\"><h3 class=\\\"mb-3\\\" style=\\\"font-weight:600;line-height:1.3;font-size:24px;font-family:Exo, sans-serif;color:rgb(54,54,54);\\\">How do we protect your information?<\\/h3><p class=\\\"font-18\\\" style=\\\"margin-right:0px;margin-left:0px;font-size:18px;\\\">All provided delicate\\/credit data is sent through Stripe.<br \\/>After an exchange, your private data (credit cards, social security numbers, financials, and so on) won\'t be put away on our workers.<\\/p><\\/div><div class=\\\"mb-5\\\" style=\\\"color:rgb(111,111,111);font-family:Nunito, sans-serif;margin-bottom:3rem;\\\"><h3 class=\\\"mb-3\\\" style=\\\"font-weight:600;line-height:1.3;font-size:24px;font-family:Exo, sans-serif;color:rgb(54,54,54);\\\">Do we disclose any information to outside parties?<\\/h3><p class=\\\"font-18\\\" style=\\\"margin-right:0px;margin-left:0px;font-size:18px;\\\">We don\'t sell, exchange, or in any case move to outside gatherings by and by recognizable data. This does exclude confided in outsiders who help us in working our site, leading our business, or adjusting you, since those gatherings consent to keep this data private. We may likewise deliver your data when we accept discharge is suitable to follow the law, implement our site strategies, or ensure our own or others\' rights, property, or wellbeing.<\\/p><\\/div><div class=\\\"mb-5\\\" style=\\\"color:rgb(111,111,111);font-family:Nunito, sans-serif;margin-bottom:3rem;\\\"><h3 class=\\\"mb-3\\\" style=\\\"font-weight:600;line-height:1.3;font-size:24px;font-family:Exo, sans-serif;color:rgb(54,54,54);\\\">Children\'s Online Privacy Protection Act Compliance<\\/h3><p class=\\\"font-18\\\" style=\\\"margin-right:0px;margin-left:0px;font-size:18px;\\\">We are consistent with the prerequisites of COPPA (Children\'s Online Privacy Protection Act), we don\'t gather any data from anybody under 13 years old. Our site, items, and administrations are completely coordinated to individuals who are in any event 13 years of age or more established.<\\/p><\\/div><div class=\\\"mb-5\\\" style=\\\"color:rgb(111,111,111);font-family:Nunito, sans-serif;margin-bottom:3rem;\\\"><h3 class=\\\"mb-3\\\" style=\\\"font-weight:600;line-height:1.3;font-size:24px;font-family:Exo, sans-serif;color:rgb(54,54,54);\\\">Changes to our Privacy Policy<\\/h3><p class=\\\"font-18\\\" style=\\\"margin-right:0px;margin-left:0px;font-size:18px;\\\">If we decide to change our privacy policy, we will post those changes on this page.<\\/p><\\/div><div class=\\\"mb-5\\\" style=\\\"color:rgb(111,111,111);font-family:Nunito, sans-serif;margin-bottom:3rem;\\\"><h3 class=\\\"mb-3\\\" style=\\\"font-weight:600;line-height:1.3;font-size:24px;font-family:Exo, sans-serif;color:rgb(54,54,54);\\\">How long we retain your information?<\\/h3><p class=\\\"font-18\\\" style=\\\"margin-right:0px;margin-left:0px;font-size:18px;\\\">At the point when you register for our site, we cycle and keep your information we have about you however long you don\'t erase the record or withdraw yourself (subject to laws and guidelines).<\\/p><\\/div><div class=\\\"mb-5\\\" style=\\\"color:rgb(111,111,111);font-family:Nunito, sans-serif;margin-bottom:3rem;\\\"><h3 class=\\\"mb-3\\\" style=\\\"font-weight:600;line-height:1.3;font-size:24px;font-family:Exo, sans-serif;color:rgb(54,54,54);\\\">What we don\\u2019t do with your data<\\/h3><p class=\\\"font-18\\\" style=\\\"margin-right:0px;margin-left:0px;font-size:18px;\\\">We don\'t and will never share, unveil, sell, or in any case give your information to different organizations for the promoting of their items or administrations.<\\/p><\\/div>\"}', NULL, 'ptc_planet', 'privacy-and-policy', 0, '2023-04-19 03:20:15', '2023-04-19 03:20:15'),
(172, 'policy_pages.element', '{\"title\":\"Payment Policy\",\"details\":\"<div class=\\\"mb-5\\\" style=\\\"color:rgb(111,111,111);font-family:Nunito, sans-serif;margin-bottom:3rem;\\\"><h3 class=\\\"mb-3\\\" style=\\\"font-weight:600;line-height:1.3;font-size:24px;font-family:Exo, sans-serif;color:rgb(54,54,54);\\\">What information do we collect?<\\/h3><p class=\\\"font-18\\\" style=\\\"margin-right:0px;margin-left:0px;font-size:18px;\\\">We gather data from you when you register on our site, submit a request, buy any services, react to an overview, or round out a structure. At the point when requesting any assistance or enrolling on our site, as suitable, you might be approached to enter your: name, email address, or telephone number. You may, nonetheless, visit our site anonymously.<\\/p><\\/div><div class=\\\"mb-5\\\" style=\\\"color:rgb(111,111,111);font-family:Nunito, sans-serif;margin-bottom:3rem;\\\"><h3 class=\\\"mb-3\\\" style=\\\"font-weight:600;line-height:1.3;font-size:24px;font-family:Exo, sans-serif;color:rgb(54,54,54);\\\">How do we protect your information?<\\/h3><p class=\\\"font-18\\\" style=\\\"margin-right:0px;margin-left:0px;font-size:18px;\\\">All provided delicate\\/credit data is sent through Stripe.<br \\/>After an exchange, your private data (credit cards, social security numbers, financials, and so on) won\'t be put away on our workers.<\\/p><\\/div><div class=\\\"mb-5\\\" style=\\\"color:rgb(111,111,111);font-family:Nunito, sans-serif;margin-bottom:3rem;\\\"><h3 class=\\\"mb-3\\\" style=\\\"font-weight:600;line-height:1.3;font-size:24px;font-family:Exo, sans-serif;color:rgb(54,54,54);\\\">Do we disclose any information to outside parties?<\\/h3><p class=\\\"font-18\\\" style=\\\"margin-right:0px;margin-left:0px;font-size:18px;\\\">We don\'t sell, exchange, or in any case move to outside gatherings by and by recognizable data. This does exclude confided in outsiders who help us in working our site, leading our business, or adjusting you, since those gatherings consent to keep this data private. We may likewise deliver your data when we accept discharge is suitable to follow the law, implement our site strategies, or ensure our own or others\' rights, property, or wellbeing.<\\/p><\\/div><div class=\\\"mb-5\\\" style=\\\"color:rgb(111,111,111);font-family:Nunito, sans-serif;margin-bottom:3rem;\\\"><h3 class=\\\"mb-3\\\" style=\\\"font-weight:600;line-height:1.3;font-size:24px;font-family:Exo, sans-serif;color:rgb(54,54,54);\\\">Children\'s Online Privacy Protection Act Compliance<\\/h3><p class=\\\"font-18\\\" style=\\\"margin-right:0px;margin-left:0px;font-size:18px;\\\">We are consistent with the prerequisites of COPPA (Children\'s Online Privacy Protection Act), we don\'t gather any data from anybody under 13 years old. Our site, items, and administrations are completely coordinated to individuals who are in any event 13 years of age or more established.<\\/p><\\/div><div class=\\\"mb-5\\\" style=\\\"color:rgb(111,111,111);font-family:Nunito, sans-serif;margin-bottom:3rem;\\\"><h3 class=\\\"mb-3\\\" style=\\\"font-weight:600;line-height:1.3;font-size:24px;font-family:Exo, sans-serif;color:rgb(54,54,54);\\\">Changes to our Privacy Policy<\\/h3><p class=\\\"font-18\\\" style=\\\"margin-right:0px;margin-left:0px;font-size:18px;\\\">If we decide to change our privacy policy, we will post those changes on this page.<\\/p><\\/div><div class=\\\"mb-5\\\" style=\\\"color:rgb(111,111,111);font-family:Nunito, sans-serif;margin-bottom:3rem;\\\"><h3 class=\\\"mb-3\\\" style=\\\"font-weight:600;line-height:1.3;font-size:24px;font-family:Exo, sans-serif;color:rgb(54,54,54);\\\">How long we retain your information?<\\/h3><p class=\\\"font-18\\\" style=\\\"margin-right:0px;margin-left:0px;font-size:18px;\\\">At the point when you register for our site, we cycle and keep your information we have about you however long you don\'t erase the record or withdraw yourself (subject to laws and guidelines).<\\/p><\\/div><div class=\\\"mb-5\\\" style=\\\"color:rgb(111,111,111);font-family:Nunito, sans-serif;margin-bottom:3rem;\\\"><h3 class=\\\"mb-3\\\" style=\\\"font-weight:600;line-height:1.3;font-size:24px;font-family:Exo, sans-serif;color:rgb(54,54,54);\\\">What we don\\u2019t do with your data<\\/h3><p class=\\\"font-18\\\" style=\\\"margin-right:0px;margin-left:0px;font-size:18px;\\\">We don\'t and will never share, unveil, sell, or in any case give your information to different organizations for the promoting of their items or administrations.<\\/p><\\/div>\"}', NULL, 'ptc_planet', 'payment-policy', 0, '2023-04-19 03:20:15', '2023-04-19 03:20:15');
INSERT INTO `frontends` (`id`, `data_keys`, `data_values`, `seo_content`, `tempname`, `slug`, `view`, `created_at`, `updated_at`) VALUES
(173, 'policy_pages.element', '{\"title\":\"Support Policy\",\"details\":\"<div class=\\\"mb-5\\\" style=\\\"margin-bottom:3rem;color:rgb(111,111,111);font-family:Nunito, sans-serif;\\\"><h3 class=\\\"mb-3\\\" style=\\\"font-weight:600;line-height:1.3;font-size:24px;color:rgb(54,54,54);font-family:Exo, sans-serif;\\\">What information do we collect?<\\/h3><p class=\\\"font-18\\\" style=\\\"margin-right:0px;margin-left:0px;font-size:18px;\\\">We gather data from you when you register on our site, submit a request, buy any services, react to an overview, or round out a structure. At the point when requesting any assistance or enrolling on our site, as suitable, you might be approached to enter your: name, email address, or telephone number. You may, nonetheless, visit our site anonymously.<\\/p><\\/div><div class=\\\"mb-5\\\" style=\\\"margin-bottom:3rem;color:rgb(111,111,111);font-family:Nunito, sans-serif;\\\"><h3 class=\\\"mb-3\\\" style=\\\"font-weight:600;line-height:1.3;font-size:24px;color:rgb(54,54,54);font-family:Exo, sans-serif;\\\">How do we protect your information?<\\/h3><p class=\\\"font-18\\\" style=\\\"margin-right:0px;margin-left:0px;font-size:18px;\\\">All provided delicate\\/credit data is sent through Stripe.<br \\/>After an exchange, your private data (credit cards, social security numbers, financials, and so on) won\'t be put away on our workers.<\\/p><\\/div><div class=\\\"mb-5\\\" style=\\\"margin-bottom:3rem;color:rgb(111,111,111);font-family:Nunito, sans-serif;\\\"><h3 class=\\\"mb-3\\\" style=\\\"font-weight:600;line-height:1.3;font-size:24px;color:rgb(54,54,54);font-family:Exo, sans-serif;\\\">Do we disclose any information to outside parties?<\\/h3><p class=\\\"font-18\\\" style=\\\"margin-right:0px;margin-left:0px;font-size:18px;\\\">We don\'t sell, exchange, or in any case move to outside gatherings by and by recognizable data. This does exclude confided in outsiders who help us in working our site, leading our business, or adjusting you, since those gatherings consent to keep this data private. We may likewise deliver your data when we accept discharge is suitable to follow the law, implement our site strategies, or ensure our own or others\' rights, property, or wellbeing.<\\/p><\\/div><div class=\\\"mb-5\\\" style=\\\"margin-bottom:3rem;color:rgb(111,111,111);font-family:Nunito, sans-serif;\\\"><h3 class=\\\"mb-3\\\" style=\\\"font-weight:600;line-height:1.3;font-size:24px;color:rgb(54,54,54);font-family:Exo, sans-serif;\\\">Children\'s Online Privacy Protection Act Compliance<\\/h3><p class=\\\"font-18\\\" style=\\\"margin-right:0px;margin-left:0px;font-size:18px;\\\">We are consistent with the prerequisites of COPPA (Children\'s Online Privacy Protection Act), we don\'t gather any data from anybody under 13 years old. Our site, items, and administrations are completely coordinated to individuals who are in any event 13 years of age or more established.<\\/p><\\/div><div class=\\\"mb-5\\\" style=\\\"margin-bottom:3rem;color:rgb(111,111,111);font-family:Nunito, sans-serif;\\\"><h3 class=\\\"mb-3\\\" style=\\\"font-weight:600;line-height:1.3;font-size:24px;color:rgb(54,54,54);font-family:Exo, sans-serif;\\\">Changes to our Privacy Policy<\\/h3><p class=\\\"font-18\\\" style=\\\"margin-right:0px;margin-left:0px;font-size:18px;\\\">If we decide to change our privacy policy, we will post those changes on this page.<\\/p><\\/div><div class=\\\"mb-5\\\" style=\\\"margin-bottom:3rem;color:rgb(111,111,111);font-family:Nunito, sans-serif;\\\"><h3 class=\\\"mb-3\\\" style=\\\"font-weight:600;line-height:1.3;font-size:24px;color:rgb(54,54,54);font-family:Exo, sans-serif;\\\">How long we retain your information?<\\/h3><p class=\\\"font-18\\\" style=\\\"margin-right:0px;margin-left:0px;font-size:18px;\\\">At the point when you register for our site, we cycle and keep your information we have about you however long you don\'t erase the record or withdraw yourself (subject to laws and guidelines).<\\/p><\\/div><div class=\\\"mb-5\\\" style=\\\"margin-bottom:3rem;color:rgb(111,111,111);font-family:Nunito, sans-serif;\\\"><h3 class=\\\"mb-3\\\" style=\\\"font-weight:600;line-height:1.3;font-size:24px;color:rgb(54,54,54);font-family:Exo, sans-serif;\\\">What we don\\u2019t do with your data<\\/h3><p class=\\\"font-18\\\" style=\\\"margin-right:0px;margin-left:0px;font-size:18px;\\\">We don\'t and will never share, unveil, sell, or in any case give your information to different organizations for the promoting of their items or administrations.<\\/p><\\/div>\"}', NULL, 'ptc_planet', 'support-policy', 0, '2023-04-19 03:20:15', '2023-04-19 03:20:15'),
(174, 'kyc_info.content', '{\"verification_content\":\"Please submit the required KYC information to verify yourself. Otherwise, you couldn\\\\\'t make any withdrawal requests to the system.\",\"pending_content\":\"Your submitted KYC information is pending for admin approval. Please wait till that approved their verification to see your submitted information.\"}', NULL, 'ptc_planet', NULL, 0, '2023-04-19 03:26:25', '2023-04-19 03:26:25'),
(175, 'banned.content', '{\"has_image\":\"1\",\"heading\":\"You are banned\",\"image\":\"643f7ba8872f31681882024.png\"}', NULL, 'ptc_planet', NULL, 0, '2023-04-19 03:27:04', '2023-04-19 03:27:04'),
(176, 'social_icon.element', '{\"title\":\"Facebook\",\"icon\":\"<i class=\\\"lab la-facebook-f\\\"><\\/i>\",\"url\":\"https:\\/\\/www.facebook.com\"}', NULL, 'ptc_planet', NULL, 0, '2023-04-19 03:33:27', '2023-04-19 03:33:27'),
(177, 'social_icon.element', '{\"title\":\"Twitter\",\"icon\":\"<i class=\\\"lab la-twitter\\\"><\\/i>\",\"url\":\"https:\\/\\/twitter.com\"}', NULL, 'ptc_planet', NULL, 0, '2023-04-19 03:33:27', '2023-04-19 03:33:27'),
(178, 'social_icon.element', '{\"title\":\"LinkedIn\",\"icon\":\"<i class=\\\"lab la-linkedin-in\\\"><\\/i>\",\"url\":\"https:\\/\\/www.linkedin.com\"}', NULL, 'ptc_planet', NULL, 0, '2023-04-19 03:33:27', '2023-04-19 03:33:27'),
(179, 'social_icon.element', '{\"title\":\"Instagram\",\"icon\":\"<i class=\\\"lab la-instagram\\\"><\\/i>\",\"url\":\"https:\\/\\/www.instagram.com\"}', NULL, 'ptc_planet', NULL, 0, '2023-04-19 03:33:27', '2023-04-19 03:33:27'),
(180, 'banner.content', '{\"has_image\":\"1\",\"heading\":\"Earn money by completing simple clicks online.\",\"subheading\":\"Everyone can join. And get started to earn.\",\"button_name\":\"Get Started\",\"button_link\":\"user\\/register\",\"image\":\"643e888dd70131681819789.png\"}', NULL, 'ptc_planet', NULL, 0, '2023-04-18 10:09:49', '2023-04-18 10:09:50'),
(181, 'about.content', '{\"has_image\":\"1\",\"heading\":\"About Us\",\"subheading\":\"Make more than ever before\",\"content\":\"<span style=\\\"color:rgb(102,102,102);font-size:15px;background-color:rgb(248,249,250);\\\">Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ipsa adipisci beatae quidem. Cupiditate accusamus ab, fugit vel, sint mollitia deserunt modi voluptatem maxime dolor odit. Dolorem quam rem facilis, minus, perspiciatis illo sint quia sed fugit, dolorum natus sequi? Error, quia suscipit! Harum.<\\/span><br \\/>\",\"button_name\":\"Get Started\",\"button_link\":\"user\\/register\",\"image\":\"643e88cce01041681819852.jpg\"}', NULL, 'ptc_planet', NULL, 0, '2023-04-18 10:10:52', '2023-04-18 10:10:53'),
(182, 'about.element', '{\"icon\":\"<i class=\\\"las la-crosshairs\\\"><\\/i>\",\"title\":\"Our Mission\",\"content\":\"Lorem ipsum dolor sit amet, consectetur adipisicing elit. Voluptatum inventore illum adipisci vitae deserunt, non sit.\"}', NULL, 'ptc_planet', NULL, 0, '2023-04-18 10:11:28', '2023-04-18 10:11:28'),
(183, 'about.element', '{\"icon\":\"<i class=\\\"las la-chart-area\\\"><\\/i>\",\"title\":\"Our Vision\",\"content\":\"Vission of PTC Planet Lorem ipsum dolor sit amet, consectetur adipisicing elit. Voluptatum inventore illum adipisci vitae deserunt, non sit.\"}', NULL, 'ptc_planet', NULL, 0, '2023-04-18 10:12:07', '2023-04-18 10:12:07'),
(184, 'features.content', '{\"heading\":\"Features Which Helps You Earn More\",\"subheading\":\"Our Features\"}', NULL, 'ptc_planet', NULL, 0, '2023-04-18 10:12:43', '2023-04-18 10:12:43'),
(185, 'features.element', '{\"icon\":\"<i class=\\\"las la-globe-americas\\\"><\\/i>\",\"title\":\"We\'re Global\",\"content\":\"Voluptatibus at vero, amet sit esse sequi quam odio debitis. Nulla porro tenetur adipisci laborum sunt repellendus error, asperiores quam nobis sit!\"}', NULL, 'ptc_planet', NULL, 0, '2023-04-18 10:12:43', '2023-04-18 10:12:43'),
(186, 'features.element', '{\"icon\":\"<i class=\\\"las la-headset\\\"><\\/i>\",\"title\":\"Best Support\",\"content\":\"Voluptatibus at vero, amet sit esse sequi quam odio debitis. Nulla porro tenetur adipisci laborum sunt repellendus error, asperiores quam nobis sit!\"}', NULL, 'ptc_planet', NULL, 0, '2023-04-18 10:12:43', '2023-04-18 10:12:43'),
(187, 'features.element', '{\"icon\":\"<i class=\\\"lab la-bitcoin\\\"><\\/i>\",\"title\":\"We Accept Crypto\",\"content\":\"Voluptatibus at vero, amet sit esse sequi quam odio debitis. Nulla porro tenetur adipisci laborum sunt repellendus error, asperiores quam nobis sit!\"}', NULL, 'ptc_planet', NULL, 0, '2023-04-18 10:12:43', '2023-04-18 10:12:43'),
(188, 'features.element', '{\"icon\":\"<i class=\\\"las la-chart-bar\\\"><\\/i>\",\"title\":\"We\'re Profitable\",\"content\":\"Voluptatibus at vero, amet sit esse sequi quam odio debitis. Nulla porro tenetur adipisci laborum sunt repellendus error, asperiores quam nobis sit!\"}', NULL, 'ptc_planet', NULL, 0, '2023-04-18 10:12:43', '2023-04-18 10:12:43'),
(189, 'features.element', '{\"icon\":\"<i class=\\\"las la-lock\\\"><\\/i>\",\"title\":\"We\'re Secure\",\"content\":\"Voluptatibus at vero, amet sit esse sequi quam odio debitis. Nulla porro tenetur adipisci laborum sunt repellendus error, asperiores quam nobis sit!\"}', NULL, 'ptc_planet', NULL, 0, '2023-04-18 10:12:43', '2023-04-18 10:12:43'),
(190, 'features.element', '{\"icon\":\"<i class=\\\"las la-file-invoice-dollar\\\"><\\/i>\",\"title\":\"Earning Statement\",\"content\":\"Search engine advertising, also known as search engine marketing (SEM), allows you to show ads to users based on the keywords.\"}', NULL, 'ptc_planet', NULL, 0, '2023-04-18 10:12:43', '2023-04-18 10:12:43'),
(191, 'plan.content', '{\"heading\":\"Choose The Best Plan\",\"subheading\":\"Our Plan Packages\"}', NULL, 'ptc_planet', NULL, 0, '2023-04-18 10:13:05', '2023-04-18 10:13:05'),
(192, 'counter.content', '{\"heading\":\"Best Place To Earn Money Online\",\"description\":\"Lorem ipsum dolor sit amet consectetur adipisicing elit. Inventore eos, libero magnam reiciendis totam sed expedita ex, numquam at, voluptatibus dolore ab perferendis adipisci illum cupiditate doloremque consectetur iure ratione placeat! Omnis molestias ipsa harum repudiandae minus quo corporis quaerat accusantium labore expedita, deleniti voluptates et illo iure velit aliquid. Minima eos dolores.\",\"button_name\":\"Get Started Now\",\"button_link\":\"user\\/register\"}', NULL, 'ptc_planet', NULL, 0, '2023-04-18 10:17:19', '2023-04-18 10:17:19'),
(193, 'counter.element', '{\"title\":\"Advertisement\",\"number\":\"580\",\"range\":\"K+\"}', NULL, 'ptc_planet', NULL, 0, '2023-04-18 10:17:57', '2023-04-18 10:18:31'),
(194, 'counter.element', '{\"title\":\"Impression\",\"number\":\"20\",\"range\":\"M+\"}', NULL, 'ptc_planet', NULL, 0, '2023-04-18 10:18:22', '2023-04-18 10:18:22'),
(195, 'counter.element', '{\"title\":\"Users\",\"number\":\"50\",\"range\":\"K+\"}', NULL, 'ptc_planet', NULL, 0, '2023-04-18 10:18:55', '2023-04-18 10:18:55'),
(196, 'counter.element', '{\"title\":\"Withdraw\",\"number\":\"$680\",\"range\":\"K+\"}', NULL, 'ptc_planet', NULL, 0, '2023-04-18 10:19:23', '2023-04-18 10:19:23'),
(197, 'faq.content', '{\"heading\":\"Frequently Asked Question\",\"subheading\":\"FAQ\"}', NULL, 'ptc_planet', NULL, 0, '2023-04-18 10:19:39', '2023-04-18 10:19:39'),
(198, 'faq.element', '{\"question\":\"What constitutes a quorum in a PTC?\",\"answer\":\"The standard definition of a quorum in Robert\'s Rules of Order is that the majority of an assembly must be present to conduct business. That is, if there are twenty members of a group, eleven must be present to constitute a quorum. The same requirement for a quorum applies to PTCs, with one additional provision. The Handbook (4.1.8.3) provides that absentee votes will be counted in PTCs, whereas Robert\'s Rules really do not provide for a mixture of absentee and in-person votes in an assembly\"}', NULL, 'ptc_planet', NULL, 0, '2023-04-18 10:19:39', '2023-04-18 10:19:39'),
(199, 'faq.element', '{\"question\":\"What constitutes a positive or negative vote in PTCs?\",\"answer\":\"The standard definition of a quorum in Robert\'s Rules of Order is that the majority of an assembly must be present to conduct business. That is, if there are twenty members of a group, eleven must be present to constitute a quorum. The same requirement for a quorum applies to PTCs, with one additional provision. The Handbook (4.1.8.3) provides that absentee votes will be counted in PTCs, whereas Robert\'s Rules really do not provide for a mixture of absentee and in-person votes in an assembly\"}', NULL, 'ptc_planet', NULL, 0, '2023-04-18 10:19:39', '2023-04-18 10:19:39'),
(200, 'faq.element', '{\"question\":\"Can an abstention vote be cast at a PTC meeting?\",\"answer\":\"The standard definition of a quorum in Robert\'s Rules of Order is that the majority of an assembly must be present to conduct business. That is, if there are twenty members of a group, eleven must be present to constitute a quorum. The same requirement for a quorum applies to PTCs, with one additional provision. The Handbook (4.1.8.3) provides that absentee votes will be counted in PTCs, whereas Robert\'s Rules really do not provide for a mixture of absentee and in-person votes in an assembly\"}', NULL, 'ptc_planet', NULL, 0, '2023-04-18 10:19:39', '2023-04-18 10:19:39'),
(201, 'faq.element', '{\"question\":\"Can a faculty member on OCSA or FML serve on a PTC?\",\"answer\":\"The standard definition of a quorum in Robert\'s Rules of Order is that the majority of an assembly must be present to conduct business. That is, if there are twenty members of a group, eleven must be present to constitute a quorum. The same requirement for a quorum applies to PTCs, with one additional provision. The Handbook (4.1.8.3) provides that absentee votes will be counted in PTCs, whereas Robert\'s Rules really do not provide for a mixture of absentee and in-person votes in an assembly\"}', NULL, 'ptc_planet', NULL, 0, '2023-04-18 10:19:39', '2023-04-18 10:19:39'),
(202, 'faq.element', '{\"question\":\"How will additional members of PTCs be elected in departments with fewer than four tenured faculty members?\",\"answer\":\"The standard definition of a quorum in Robert\'s Rules of Order is that the majority of an assembly must be present to conduct business. That is, if there are twenty members of a group, eleven must be present to constitute a quorum. The same requirement for a quorum applies to PTCs, with one additional provision. The Handbook (4.1.8.3) provides that absentee votes will be counted in PTCs, whereas Robert\'s Rules really do not provide for a mixture of absentee and in-person votes in an assembly\"}', NULL, 'ptc_planet', NULL, 0, '2023-04-18 10:19:39', '2023-04-18 10:19:39'),
(203, 'faq.element', '{\"question\":\"How can absentee ballots be cast?\",\"answer\":\"The standard definition of a quorum in Robert\'s Rules of Order is that the majority of an assembly must be present to conduct business. That is, if there are twenty members of a group, eleven must be present to constitute a quorum. The same requirement for a quorum applies to PTCs, with one additional provision. The Handbook (4.1.8.3) provides that absentee votes will be counted in PTCs, whereas Robert\'s Rules really do not provide for a mixture of absentee and in-person votes in an assembly\"}', NULL, 'ptc_planet', NULL, 0, '2023-04-18 10:19:39', '2023-04-18 10:19:39'),
(204, 'faq.element', '{\"question\":\"Why should members of the PTC fill out vote justification forms explaining their votes?\",\"answer\":\"The standard definition of a quorum in Robert\'s Rules of Order is that the majority of an assembly must be present to conduct business. That is, if there are twenty members of a group, eleven must be present to constitute a quorum. The same requirement for a quorum applies to PTCs, with one additional provision. The Handbook (4.1.8.3) provides that absentee votes will be counted in PTCs, whereas Robert\'s Rules really do not provide for a mixture of absentee and in-person votes in an assembly\"}', NULL, 'ptc_planet', NULL, 0, '2023-04-18 10:19:39', '2023-04-18 10:19:39'),
(205, 'testimonial.content', '{\"heading\":\"What Our Clients Say\",\"subheading\":\"Testimonial\"}', NULL, 'ptc_planet', NULL, 0, '2023-04-18 10:19:57', '2023-04-20 01:21:33'),
(206, 'blog.content', '{\"heading\":\"Blog Section\",\"subheading\":\"Blog\"}', NULL, 'ptc_planet', NULL, 0, '2023-04-18 10:21:19', '2023-04-18 10:21:19'),
(207, 'blog.element', '{\"has_image\":[\"1\"],\"title\":\"Dit boek is een verhand eling over de\",\"description\":\"<p style=\\\"margin:20px 0px 21px;font-size:16px;color:rgb(102,102,102);line-height:30px;font-family:\'Noto Sans\', sans-serif;\\\">There are many variations of passages of Lorem Ipsum available, but the majority have suffered that the alteration in some form by injected humour or the an randomised words which don\'t look even evry is and slightly believable. If you are going to use a passage of Lorem Ipsum you need to be sure there isn\'t is the anything aembarrassing hidden in the middle of text.Ipsum available but the majority have that suffered is alteration in some form by injected humour or randomised words.<\\/p><p class=\\\"marked\\\" style=\\\"margin:20px 0px 21px;font-size:16px;color:rgb(0,0,80);line-height:30px;font-style:italic;font-family:\'Noto Sans\', sans-serif;\\\">All their equipment and instruments are alive.All their equipment and instruments are alive. I the that about to watched storm, so beautiful terrific.Silver mist suffused the deck the ship.The are recorded voice the a dumm a scratched the Tthst speaker. Almost before we knew it.Almost is before we knew it we had left the dummy is ground.<\\/p><p style=\\\"margin:20px 0px 6px;font-size:16px;color:rgb(102,102,102);line-height:30px;font-family:\'Noto Sans\', sans-serif;\\\">The face of the moon was in shadow.The spectacle before us was indeed sublime.All their equipment tha is and instruments are alive.All their equipment and instruments are alive.I watched the storm so beautiful yet terrific.Silver mist suffused the deck of the ship.<\\/p>\",\"image\":\"6440de7ec724d1681972862.png\"}', NULL, 'ptc_planet', 'dit-boek-is-een-verhand-eling-over-de', 0, '2023-04-18 10:21:19', '2023-04-20 14:41:03'),
(208, 'blog.element', '{\"has_image\":[\"1\"],\"title\":\"Dit boek is een verhand eling over de\",\"description\":\"<p style=\\\"margin:20px 0px 21px;font-size:16px;color:rgb(102,102,102);line-height:30px;font-family:\'Noto Sans\', sans-serif;\\\">There are many variations of passages of Lorem Ipsum available, but the majority have suffered that the alteration in some form by injected humour or the an randomised words which don\'t look even evry is and slightly believable. If you are going to use a passage of Lorem Ipsum you need to be sure there isn\'t is the anything aembarrassing hidden in the middle of text.Ipsum available but the majority have that suffered is alteration in some form by injected humour or randomised words.<\\/p><p class=\\\"marked\\\" style=\\\"margin:20px 0px 21px;font-size:16px;color:rgb(0,0,80);line-height:30px;font-style:italic;font-family:\'Noto Sans\', sans-serif;\\\">All their equipment and instruments are alive.All their equipment and instruments are alive. I the that about to watched storm, so beautiful terrific.Silver mist suffused the deck the ship.The are recorded voice the a dumm a scratched the Tthst speaker. Almost before we knew it.Almost is before we knew it we had left the dummy is ground.<\\/p><p style=\\\"margin:20px 0px 6px;font-size:16px;color:rgb(102,102,102);line-height:30px;font-family:\'Noto Sans\', sans-serif;\\\">The face of the moon was in shadow.The spectacle before us was indeed sublime.All their equipment tha is and instruments are alive.All their equipment and instruments are alive.I watched the storm so beautiful yet terrific.Silver mist suffused the deck of the ship.<\\/p>\",\"image\":\"6440dd8621b531681972614.jpg\"}', NULL, 'ptc_planet', 'dit-boek-is-een-verhand-eling-over-de', 4, '2023-04-18 10:21:19', '2023-04-28 21:09:08'),
(209, 'blog.element', '{\"has_image\":[\"1\"],\"title\":\"Er zijn vele variaties van passages van\",\"description\":\"<p style=\\\"margin:20px 0px 21px;font-size:16px;color:rgb(102,102,102);line-height:30px;font-family:\'Noto Sans\', sans-serif;\\\">There are many variations of passages of Lorem Ipsum available, but the majority have suffered that the alteration in some form by injected humour or the an randomised words which don\'t look even evry is and slightly believable. If you are going to use a passage of Lorem Ipsum you need to be sure there isn\'t is the anything aembarrassing hidden in the middle of text.Ipsum available but the majority have that suffered is alteration in some form by injected humour or randomised words.<\\/p><p class=\\\"marked\\\" style=\\\"margin:20px 0px 21px;font-size:16px;color:rgb(0,0,80);line-height:30px;font-style:italic;font-family:\'Noto Sans\', sans-serif;\\\">All their equipment and instruments are alive.All their equipment and instruments are alive. I the that about to watched storm, so beautiful terrific.Silver mist suffused the deck the ship.The are recorded voice the a dumm a scratched the Tthst speaker. Almost before we knew it.Almost is before we knew it we had left the dummy is ground.<\\/p><p style=\\\"margin:20px 0px 6px;font-size:16px;color:rgb(102,102,102);line-height:30px;font-family:\'Noto Sans\', sans-serif;\\\">The face of the moon was in shadow.The spectacle before us was indeed sublime.All their equipment tha is and instruments are alive.All their equipment and instruments are alive.I watched the storm so beautiful yet terrific.Silver mist suffused the deck of the ship.<\\/p>\",\"image\":\"6440dd961cffb1681972630.jpg\"}', NULL, 'ptc_planet', 'er-zijn-vele-variaties-van-passages-van', 2, '2023-04-18 10:21:19', '2023-04-28 21:04:12'),
(210, 'blog.element', '{\"has_image\":[\"1\"],\"title\":\"Het is al geruime tijd een bekend geg\",\"description\":\"<p style=\\\"margin:20px 0px 21px;font-size:16px;color:rgb(102,102,102);line-height:30px;font-family:\'Noto Sans\', sans-serif;\\\">There are many variations of passages of Lorem Ipsum available, but the majority have suffered that the alteration in some form by injected humour or the an randomised words which don\'t look even evry is and slightly believable. If you are going to use a passage of Lorem Ipsum you need to be sure there isn\'t is the anything aembarrassing hidden in the middle of text.Ipsum available but the majority have that suffered is alteration in some form by injected humour or randomised words.<\\/p><p class=\\\"marked\\\" style=\\\"margin:20px 0px 21px;font-size:16px;color:rgb(0,0,80);line-height:30px;font-style:italic;font-family:\'Noto Sans\', sans-serif;\\\">All their equipment and instruments are alive.All their equipment and instruments are alive. I the that about to watched storm, so beautiful terrific.Silver mist suffused the deck the ship.The are recorded voice the a dumm a scratched the Tthst speaker. Almost before we knew it.Almost is before we knew it we had left the dummy is ground.<\\/p><p style=\\\"margin:20px 0px 6px;font-size:16px;color:rgb(102,102,102);line-height:30px;font-family:\'Noto Sans\', sans-serif;\\\">The face of the moon was in shadow.The spectacle before us was indeed sublime.All their equipment tha is and instruments are alive.All their equipment and instruments are alive.I watched the storm so beautiful yet terrific.Silver mist suffused the deck of the ship.<\\/p>\",\"image\":\"6440dda15d7521681972641.jpg\"}', NULL, 'ptc_planet', 'het-is-al-geruime-tijd-een-bekend-geg', 5, '2023-04-18 10:21:19', '2023-04-29 05:32:35'),
(211, 'blog.element', '{\"has_image\":[\"1\"],\"title\":\"Law firm opened near to that gonig to\",\"description\":\"<p style=\\\"margin:20px 0px 21px;font-size:16px;color:rgb(102,102,102);line-height:30px;font-family:\'Noto Sans\', sans-serif;\\\">There are many variations of passages of Lorem Ipsum available, but the majority have suffered that the alteration in some form by injected humour or the an randomised words which don\'t look even evry is and slightly believable. If you are going to use a passage of Lorem Ipsum you need to be sure there isn\'t is the anything aembarrassing hidden in the middle of text.Ipsum available but the majority have that suffered is alteration in some form by injected humour or randomised words.<\\/p><p class=\\\"marked\\\" style=\\\"margin:20px 0px 21px;font-size:16px;color:rgb(0,0,80);line-height:30px;font-style:italic;font-family:\'Noto Sans\', sans-serif;\\\">All their equipment and instruments are alive.All their equipment and instruments are alive. I the that about to watched storm, so beautiful terrific.Silver mist suffused the deck the ship.The are recorded voice the a dumm a scratched the Tthst speaker. Almost before we knew it.Almost is before we knew it we had left the dummy is ground.<\\/p><p style=\\\"margin:20px 0px 6px;font-size:16px;color:rgb(102,102,102);line-height:30px;font-family:\'Noto Sans\', sans-serif;\\\">The face of the moon was in shadow.The spectacle before us was indeed sublime.All their equipment tha is and instruments are alive.All their equipment and instruments are alive.I watched the storm so beautiful yet terrific.Silver mist suffused the deck of the ship.<\\/p>\",\"image\":\"6440de662eb591681972838.jpg\"}', NULL, 'ptc_planet', 'law-firm-opened-near-to-that-gonig-to', 14, '2023-04-18 10:21:19', '2023-04-29 05:28:23'),
(212, 'blog.element', '{\"has_image\":[\"1\"],\"title\":\"Law firm opened near to that gonig to\",\"description\":\"<p style=\\\"margin:20px 0px 21px;font-size:16px;color:rgb(102,102,102);line-height:30px;font-family:\'Noto Sans\', sans-serif;\\\">There are many variations of passages of Lorem Ipsum available, but the majority have suffered that the alteration in some form by injected humour or the an randomised words which don\'t look even evry is and slightly believable. If you are going to use a passage of Lorem Ipsum you need to be sure there isn\'t is the anything aembarrassing hidden in the middle of text.Ipsum available but the majority have that suffered is alteration in some form by injected humour or randomised words.<\\/p><p class=\\\"marked\\\" style=\\\"margin:20px 0px 21px;font-size:16px;color:rgb(0,0,80);line-height:30px;font-style:italic;font-family:\'Noto Sans\', sans-serif;\\\">All their equipment and instruments are alive.All their equipment and instruments are alive. I the that about to watched storm, so beautiful terrific.Silver mist suffused the deck the ship.The are recorded voice the a dumm a scratched the Tthst speaker. Almost before we knew it.Almost is before we knew it we had left the dummy is ground.<\\/p><p style=\\\"margin:20px 0px 6px;font-size:16px;color:rgb(102,102,102);line-height:30px;font-family:\'Noto Sans\', sans-serif;\\\">The face of the moon was in shadow.The spectacle before us was indeed sublime.All their equipment tha is and instruments are alive.All their equipment and instruments are alive.I watched the storm so beautiful yet terrific.Silver mist suffused the deck of the ship.<\\/p>\",\"image\":\"6440de41711251681972801.jpg\"}', NULL, 'ptc_planet', 'law-firm-opened-near-to-that-gonig-to', 8, '2023-04-18 10:21:19', '2023-04-29 07:53:46'),
(213, 'header.content', '{\"phone\":\"+880011776633\",\"email\":\"company@email.com\"}', NULL, 'ptc_planet', NULL, 0, '2023-04-18 10:22:49', '2023-04-19 03:29:59'),
(214, 'footer.content', '{\"description\":\"Maecenas tempus tellus egondime honcus sequam seitmet dipiscing sem eque sedipsuNam quam egondime honcus sequam\"}', NULL, 'ptc_planet', NULL, 0, '2023-04-18 10:23:08', '2023-04-18 10:23:08'),
(215, 'contact.content', '{\"has_image\":\"1\",\"title\":\"Get in touch\",\"image\":\"643fb0f17587e1681895665.png\"}', NULL, 'ptc_planet', NULL, 0, '2023-04-18 10:58:38', '2023-04-19 07:14:25'),
(216, 'contact.element', '{\"icon\":\"<i class=\\\"las la-envelope-open\\\"><\\/i>\",\"title\":\"Email Address\",\"content\":\"contact@ptcl.com\"}', NULL, 'ptc_planet', NULL, 0, '2023-04-18 10:58:42', '2023-04-19 08:49:23'),
(217, 'contact.element', '{\"icon\":\"<i class=\\\"las la-phone-volume\\\"><\\/i>\",\"title\":\"Phone Number\",\"content\":\"+012-345-67890\"}', NULL, 'ptc_planet', NULL, 0, '2023-04-18 10:58:42', '2023-04-19 04:05:52'),
(218, 'payment.element', '{\"has_image\":\"1\",\"image\":\"6440af699b42d1681960809.png\"}', NULL, 'ptc_planet', NULL, 0, '2023-04-20 01:06:31', '2023-04-20 01:20:09'),
(219, 'payment.element', '{\"has_image\":\"1\",\"image\":\"6440af703947b1681960816.png\"}', NULL, 'ptc_planet', NULL, 0, '2023-04-20 01:06:52', '2023-04-20 01:20:16'),
(220, 'payment.element', '{\"has_image\":\"1\",\"image\":\"6440af78c26ac1681960824.png\"}', NULL, 'ptc_planet', NULL, 0, '2023-04-20 01:07:11', '2023-04-20 01:20:24'),
(221, 'testimonial.element', '{\"has_image\":\"1\",\"name\":\"Chris Hamsorth\",\"designation\":\"PTC Player\",\"comment\":\"Lorem ipsum dolor sit amet, consectetur adipisicing elit. Voluptatibus fuga, lauda ium odio dolor ut  iusto,  pariatur neque ique quod ratione tempore velit iure sapiente beatae id dolores.\",\"rating\":\"5\",\"image\":\"6440afcfa672f1681960911.jpg\"}', NULL, 'ptc_planet', NULL, 0, '2023-04-20 01:21:33', '2023-04-20 01:21:51'),
(222, 'testimonial.element', '{\"has_image\":\"1\",\"name\":\"Canny Bar\",\"designation\":\"Businessman\",\"comment\":\"Lorem ipsum dolor sit amet, consectetur adipisicing elit. Voluptatibus fuga, lauda ium odio dolor ut  iusto,  pariatur neque ique quod ratione tempore velit iure sapiente beatae id dolores.\",\"rating\":\"4\",\"image\":\"6440afd99abd91681960921.jpg\"}', NULL, 'ptc_planet', NULL, 0, '2023-04-20 01:21:33', '2023-04-20 01:25:39'),
(223, 'testimonial.element', '{\"has_image\":\"1\",\"name\":\"Peter Parker\",\"designation\":\"Web Developer\",\"comment\":\"Lorem ipsum dolor sit amet, consectetur adipisicing elit. Voluptatibus fuga, lauda ium odio dolor ut  iusto,  pariatur neque ique quod ratione tempore velit iure sapiente beatae id dolores.v\",\"rating\":\"4.5\",\"image\":\"6440afe504db91681960933.png\"}', NULL, 'ptc_planet', NULL, 0, '2023-04-20 01:21:33', '2023-04-20 01:26:18'),
(224, 'testimonial.element', '{\"has_image\":\"1\",\"name\":\"Nila Anderworther\",\"designation\":\"Microtech, Inc.\",\"comment\":\"Lorem ipsum dolor sit amet, consectetur adipisicing elit. Voluptatibus fuga, lauda ium odio dolor ut  iusto,  pariatur neque ique quod ratione tempore velit iure sapiente beatae id dolores.\",\"rating\":\"5\",\"image\":\"6440aff25de6a1681960946.jpg\"}', NULL, 'ptc_planet', NULL, 0, '2023-04-20 01:21:33', '2023-04-20 01:26:05'),
(225, 'seo.data', '{\"seo_image\":\"1\",\"keywords\":[\"ppc\",\"ptc\",\"pay per click\",\"earn money\",\"ppv\",\"pey per view\",\"paid click\",\"earn per click\",\"ptclab\"],\"description\":\"PTCLab is a complete and ultimate PHP Script for Pay Per Click Platform. It developed with Laravel and Bootstrap 4.\",\"social_title\":\"PTCLab - Pay Per Click Platform\",\"social_description\":\"PTCLab is a complete and ultimate PHP Script for Pay Per Click Platform. It developed with Laravel and Bootstrap 4.\",\"image\":\"648f0516a3e3e1687094550.png\"}', NULL, NULL, NULL, 0, '2023-06-18 23:22:30', '2023-06-18 23:22:30'),
(231, 'social_icon.element', '{\"title\":\"Instagram\",\"icon\":\"<i class=\\\"fab fa-instagram\\\"><\\/i>\",\"url\":\"https:\\/\\/www.instagram.com\"}', NULL, 'ptc_prime', NULL, 0, NULL, NULL),
(232, 'social_icon.element', '{\"title\":\"LinkedIn\",\"icon\":\"<i class=\\\"fab fa-linkedin-in\\\"><\\/i>\",\"url\":\"https:\\/\\/www.linkedin.com\"}', NULL, 'ptc_prime', NULL, 0, NULL, NULL),
(233, 'social_icon.element', '{\"title\":\"Twitter\",\"icon\":\"<i class=\\\"fab fa-twitter\\\"><\\/i>\",\"url\":\"https:\\/\\/twitter.com\"}', NULL, 'ptc_prime', NULL, 0, NULL, NULL),
(234, 'social_icon.element', '{\"title\":\"Facebook\",\"icon\":\"<i class=\\\"fab fa-facebook-f\\\"><\\/i>\",\"url\":\"https:\\/\\/www.facebook.com\"}', NULL, 'ptc_prime', NULL, 0, NULL, NULL),
(235, 'kyc_info.content', '{\"verification_content\":\"Lorem ipsum, dolor sit amet consectetur adipisicing elit. Hic officia quod natus, non dicta perspiciatis, quae repellendus ea illum aut debitis sint amet? Ratione voluptates beatae numquam.\",\"pending_content\":\"Lorem ipsum, dolor sit amet consectetur adipisicing elit. Hic officia quod natus, non dicta perspiciatis, quae repellendus ea illum aut debitis sint amet? Ratione voluptates beatae numquam.\"}', NULL, 'ptc_prime', NULL, 0, NULL, NULL),
(236, 'register.content', '{\"heading\":\"Sign Up\",\"subheading\":\"Signup and unlock your online earning! today\"}', NULL, 'ptc_prime', NULL, 0, NULL, '2023-09-30 11:31:44'),
(237, 'login.content', '{\"heading\":\"Login\",\"subheading\":\"Signin and explore your PTC world\"}', NULL, 'ptc_prime', NULL, 0, NULL, '2023-09-30 11:32:35'),
(238, 'blog.element', '{\"has_image\":[\"1\"],\"title\":\"Law firm opened near to that gonig to\",\"description\":\"<p style=\\\"margin:20px 0px 21px;font-size:16px;color:rgb(102,102,102);line-height:30px;font-family:\'Noto Sans\', sans-serif;\\\">There are many variations of passages of Lorem Ipsum available, but the majority have suffered that the alteration in some form by injected humour or the an randomised words which don\'t look even evry is and slightly believable. If you are going to use a passage of Lorem Ipsum you need to be sure there isn\'t is the anything aembarrassing hidden in the middle of text.Ipsum available but the majority have that suffered is alteration in some form by injected humour or randomised words.<\\/p><p class=\\\"marked\\\" style=\\\"margin:20px 0px 21px;font-size:16px;color:rgb(0,0,80);line-height:30px;font-style:italic;font-family:\'Noto Sans\', sans-serif;\\\">All their equipment and instruments are alive.All their equipment and instruments are alive. I the that about to watched storm, so beautiful terrific.Silver mist suffused the deck the ship.The are recorded voice the a dumm a scratched the Tthst speaker. Almost before we knew it.Almost is before we knew it we had left the dummy is ground.<\\/p><p style=\\\"margin:20px 0px 6px;font-size:16px;color:rgb(102,102,102);line-height:30px;font-family:\'Noto Sans\', sans-serif;\\\">The face of the moon was in shadow.The spectacle before us was indeed sublime.All their equipment tha is and instruments are alive.All their equipment and instruments are alive.I watched the storm so beautiful yet terrific.Silver mist suffused the deck of the ship.<\\/p>\",\"image\":\"651059a1611d81695570337.png\"}', NULL, 'ptc_prime', 'law-firm-opened-near-to-that-gonig-to', 10, NULL, '2024-05-17 16:50:43'),
(239, 'blog.element', '{\"has_image\":[\"1\"],\"title\":\"Law firm opened near to that gonig to\",\"description\":\"<p style=\\\"margin:20px 0px 21px;font-size:16px;color:rgb(102,102,102);line-height:30px;font-family:\'Noto Sans\', sans-serif;\\\">There are many variations of passages of Lorem Ipsum available, but the majority have suffered that the alteration in some form by injected humour or the an randomised words which don\'t look even evry is and slightly believable. If you are going to use a passage of Lorem Ipsum you need to be sure there isn\'t is the anything aembarrassing hidden in the middle of text.Ipsum available but the majority have that suffered is alteration in some form by injected humour or randomised words.<\\/p><p class=\\\"marked\\\" style=\\\"margin:20px 0px 21px;font-size:16px;color:rgb(0,0,80);line-height:30px;font-style:italic;font-family:\'Noto Sans\', sans-serif;\\\">All their equipment and instruments are alive.All their equipment and instruments are alive. I the that about to watched storm, so beautiful terrific.Silver mist suffused the deck the ship.The are recorded voice the a dumm a scratched the Tthst speaker. Almost before we knew it.Almost is before we knew it we had left the dummy is ground.<\\/p><p style=\\\"margin:20px 0px 6px;font-size:16px;color:rgb(102,102,102);line-height:30px;font-family:\'Noto Sans\', sans-serif;\\\">The face of the moon was in shadow.The spectacle before us was indeed sublime.All their equipment tha is and instruments are alive.All their equipment and instruments are alive.I watched the storm so beautiful yet terrific.Silver mist suffused the deck of the ship.<\\/p>\",\"image\":\"6510599b51f1f1695570331.png\"}', NULL, 'ptc_prime', 'law-firm-opened-near-to-that-gonig-to', 33, NULL, '2024-05-17 16:50:41'),
(240, 'blog.element', '{\"has_image\":[\"1\"],\"title\":\"Het is al geruime tijd een bekend geg\",\"description\":\"<p style=\\\"margin:20px 0px 21px;font-size:16px;color:rgb(102,102,102);line-height:30px;font-family:\'Noto Sans\', sans-serif;\\\">There are many variations of passages of Lorem Ipsum available, but the majority have suffered that the alteration in some form by injected humour or the an randomised words which don\'t look even evry is and slightly believable. If you are going to use a passage of Lorem Ipsum you need to be sure there isn\'t is the anything aembarrassing hidden in the middle of text.Ipsum available but the majority have that suffered is alteration in some form by injected humour or randomised words.<\\/p><p class=\\\"marked\\\" style=\\\"margin:20px 0px 21px;font-size:16px;color:rgb(0,0,80);line-height:30px;font-style:italic;font-family:\'Noto Sans\', sans-serif;\\\">All their equipment and instruments are alive.All their equipment and instruments are alive. I the that about to watched storm, so beautiful terrific.Silver mist suffused the deck the ship.The are recorded voice the a dumm a scratched the Tthst speaker. Almost before we knew it.Almost is before we knew it we had left the dummy is ground.<\\/p><p style=\\\"margin:20px 0px 6px;font-size:16px;color:rgb(102,102,102);line-height:30px;font-family:\'Noto Sans\', sans-serif;\\\">The face of the moon was in shadow.The spectacle before us was indeed sublime.All their equipment tha is and instruments are alive.All their equipment and instruments are alive.I watched the storm so beautiful yet terrific.Silver mist suffused the deck of the ship.<\\/p>\",\"image\":\"6510598de02fc1695570317.png\"}', NULL, 'ptc_prime', 'het-is-al-geruime-tijd-een-bekend-geg', 13, NULL, '2024-05-17 16:50:40'),
(241, 'blog.element', '{\"has_image\":[\"1\"],\"title\":\"Er zijn vele variaties van passages van\",\"description\":\"<p style=\\\"margin:20px 0px 21px;font-size:16px;color:rgb(102,102,102);line-height:30px;font-family:\'Noto Sans\', sans-serif;\\\">There are many variations of passages of Lorem Ipsum available, but the majority have suffered that the alteration in some form by injected humour or the an randomised words which don\'t look even evry is and slightly believable. If you are going to use a passage of Lorem Ipsum you need to be sure there isn\'t is the anything aembarrassing hidden in the middle of text.Ipsum available but the majority have that suffered is alteration in some form by injected humour or randomised words.<\\/p><p class=\\\"marked\\\" style=\\\"margin:20px 0px 21px;font-size:16px;color:rgb(0,0,80);line-height:30px;font-style:italic;font-family:\'Noto Sans\', sans-serif;\\\">All their equipment and instruments are alive.All their equipment and instruments are alive. I the that about to watched storm, so beautiful terrific.Silver mist suffused the deck the ship.The are recorded voice the a dumm a scratched the Tthst speaker. Almost before we knew it.Almost is before we knew it we had left the dummy is ground.<\\/p><p style=\\\"margin:20px 0px 6px;font-size:16px;color:rgb(102,102,102);line-height:30px;font-family:\'Noto Sans\', sans-serif;\\\">The face of the moon was in shadow.The spectacle before us was indeed sublime.All their equipment tha is and instruments are alive.All their equipment and instruments are alive.I watched the storm so beautiful yet terrific.Silver mist suffused the deck of the ship.<\\/p>\",\"image\":\"65105984a63771695570308.png\"}', NULL, 'ptc_prime', 'er-zijn-vele-variaties-van-passages-van', 25, NULL, '2024-05-17 16:50:38'),
(242, 'blog.element', '{\"has_image\":[\"1\"],\"title\":\"Dit boek is een verhand eling over de\",\"description\":\"<p style=\\\"margin:20px 0px 21px;font-size:16px;color:rgb(102,102,102);line-height:30px;font-family:\'Noto Sans\', sans-serif;\\\">There are many variations of passages of Lorem Ipsum available, but the majority have suffered that the alteration in some form by injected humour or the an randomised words which don\'t look even evry is and slightly believable. If you are going to use a passage of Lorem Ipsum you need to be sure there isn\'t is the anything aembarrassing hidden in the middle of text.Ipsum available but the majority have that suffered is alteration in some form by injected humour or randomised words.<\\/p><p class=\\\"marked\\\" style=\\\"margin:20px 0px 21px;font-size:16px;color:rgb(0,0,80);line-height:30px;font-style:italic;font-family:\'Noto Sans\', sans-serif;\\\">All their equipment and instruments are alive.All their equipment and instruments are alive. I the that about to watched storm, so beautiful terrific.Silver mist suffused the deck the ship.The are recorded voice the a dumm a scratched the Tthst speaker. Almost before we knew it.Almost is before we knew it we had left the dummy is ground.<\\/p><p style=\\\"margin:20px 0px 6px;font-size:16px;color:rgb(102,102,102);line-height:30px;font-family:\'Noto Sans\', sans-serif;\\\">The face of the moon was in shadow.The spectacle before us was indeed sublime.All their equipment tha is and instruments are alive.All their equipment and instruments are alive.I watched the storm so beautiful yet terrific.Silver mist suffused the deck of the ship.<\\/p>\",\"image\":\"6510597aa0f261695570298.png\"}', NULL, 'ptc_prime', 'dit-boek-is-een-verhand-eling-over-de', 54, NULL, '2024-06-02 06:21:15'),
(243, 'blog.element', '{\"has_image\":[\"1\"],\"title\":\"Dit boek is een verhand eling over de\",\"description\":\"<p style=\\\"margin:20px 0px 21px;font-size:16px;color:rgb(102,102,102);line-height:30px;font-family:\'Noto Sans\', sans-serif;\\\">There are many variations of passages of Lorem Ipsum available, but the majority have suffered that the alteration in some form by injected humour or the an randomised words which don\'t look even evry is and slightly believable. If you are going to use a passage of Lorem Ipsum you need to be sure there isn\'t is the anything aembarrassing hidden in the middle of text.Ipsum available but the majority have that suffered is alteration in some form by injected humour or randomised words.<\\/p><p class=\\\"marked\\\" style=\\\"margin:20px 0px 21px;font-size:16px;color:rgb(0,0,80);line-height:30px;font-style:italic;font-family:\'Noto Sans\', sans-serif;\\\">All their equipment and instruments are alive.All their equipment and instruments are alive. I the that about to watched storm, so beautiful terrific.Silver mist suffused the deck the ship.The are recorded voice the a dumm a scratched the Tthst speaker. Almost before we knew it.Almost is before we knew it we had left the dummy is ground.<\\/p><p style=\\\"margin:20px 0px 6px;font-size:16px;color:rgb(102,102,102);line-height:30px;font-family:\'Noto Sans\', sans-serif;\\\">The face of the moon was in shadow.The spectacle before us was indeed sublime.All their equipment tha is and instruments are alive.All their equipment and instruments are alive.I watched the storm so beautiful yet terrific.Silver mist suffused the deck of the ship.<\\/p>\",\"image\":\"6510596a07fb61695570282.png\"}', NULL, 'ptc_prime', 'dit-boek-is-een-verhand-eling-over-de', 45, NULL, '2024-05-22 18:40:13'),
(244, 'blog.content', '{\"section_title\":\"Our News & Blogs\",\"heading\":\"Inside the PPT Universe: Exclusive Articles and Updates\",\"button\":\"View All\",\"button_link\":\"blog\"}', NULL, 'ptc_prime', NULL, 0, NULL, '2023-09-30 10:22:13'),
(245, 'faq.element', '{\"question\":\"Why should members of the PTC fill out vote justification forms explaining their votes?\",\"answer\":\"The standard definition of a quorum in Robert\'s Rules of Order is that the majority of an assembly must be present to conduct business. That is, if there are twenty members of a group, eleven must be present to constitute a quorum. The same requirement for a quorum applies to PTCs, with one additional provision. The Handbook (4.1.8.3) provides that absentee votes will be counted in PTCs, whereas Robert\'s Rules really do not provide for a mixture of absentee and in-person votes in an assembly\"}', NULL, 'ptc_prime', NULL, 0, NULL, NULL),
(246, 'faq.element', '{\"question\":\"How can absentee ballots be cast?\",\"answer\":\"The standard definition of a quorum in Robert\'s Rules of Order is that the majority of an assembly must be present to conduct business. That is, if there are twenty members of a group, eleven must be present to constitute a quorum. The same requirement for a quorum applies to PTCs, with one additional provision. The Handbook (4.1.8.3) provides that absentee votes will be counted in PTCs, whereas Robert\'s Rules really do not provide for a mixture of absentee and in-person votes in an assembly\"}', NULL, 'ptc_prime', NULL, 0, NULL, NULL),
(247, 'faq.element', '{\"question\":\"How will additional members of PTCs be elected in departments with fewer than four tenured faculty members?\",\"answer\":\"The standard definition of a quorum in Robert\'s Rules of Order is that the majority of an assembly must be present to conduct business. That is, if there are twenty members of a group, eleven must be present to constitute a quorum. The same requirement for a quorum applies to PTCs, with one additional provision. The Handbook (4.1.8.3) provides that absentee votes will be counted in PTCs, whereas Robert\'s Rules really do not provide for a mixture of absentee and in-person votes in an assembly\"}', NULL, 'ptc_prime', NULL, 0, NULL, NULL),
(248, 'faq.element', '{\"question\":\"Can a faculty member on OCSA or FML serve on a PTC?\",\"answer\":\"The standard definition of a quorum in Robert\'s Rules of Order is that the majority of an assembly must be present to conduct business. That is, if there are twenty members of a group, eleven must be present to constitute a quorum. The same requirement for a quorum applies to PTCs, with one additional provision. The Handbook (4.1.8.3) provides that absentee votes will be counted in PTCs, whereas Robert\'s Rules really do not provide for a mixture of absentee and in-person votes in an assembly\"}', NULL, 'ptc_prime', NULL, 0, NULL, NULL),
(249, 'faq.element', '{\"question\":\"Can an abstention vote be cast at a PTC meeting?\",\"answer\":\"The standard definition of a quorum in Robert\'s Rules of Order is that the majority of an assembly must be present to conduct business. That is, if there are twenty members of a group, eleven must be present to constitute a quorum. The same requirement for a quorum applies to PTCs, with one additional provision. The Handbook (4.1.8.3) provides that absentee votes will be counted in PTCs, whereas Robert\'s Rules really do not provide for a mixture of absentee and in-person votes in an assembly\"}', NULL, 'ptc_prime', NULL, 0, NULL, NULL),
(250, 'faq.element', '{\"question\":\"What constitutes a positive or negative vote in PTCs?\",\"answer\":\"The standard definition of a quorum in Robert\'s Rules of Order is that the majority of an assembly must be present to conduct business. That is, if there are twenty members of a group, eleven must be present to constitute a quorum. The same requirement for a quorum applies to PTCs, with one additional provision. The Handbook (4.1.8.3) provides that absentee votes will be counted in PTCs, whereas Robert\'s Rules really do not provide for a mixture of absentee and in-person votes in an assembly\"}', NULL, 'ptc_prime', NULL, 0, NULL, NULL),
(251, 'faq.element', '{\"question\":\"What constitutes a quorum in a PTC?\",\"answer\":\"The standard definition of a quorum in Robert\'s Rules of Order is that the majority of an assembly must be present to conduct business. That is, if there are twenty members of a group, eleven must be present to constitute a quorum. The same requirement for a quorum applies to PTCs, with one additional provision. The Handbook (4.1.8.3) provides that absentee votes will be counted in PTCs, whereas Robert\'s Rules really do not provide for a mixture of absentee and in-person votes in an assembly\"}', NULL, 'ptc_prime', NULL, 0, NULL, NULL),
(252, 'faq.content', '{\"section_title\":\"FAQ\'s\",\"heading\":\"Frequently Asked Questions\",\"subheading\":\"With a deep understanding of the ever-evolving social media landscape, we help businesses maximize.\",\"title\":\"Couldn\\u2019t find what you were looking for? Write to us at\",\"email\":\"nathan.roberts@example.com\"}', NULL, 'ptc_prime', NULL, 0, NULL, NULL),
(253, 'contact.element', '{\"has_image\":\"1\",\"title\":\"123 Sample St, Sydney NSW 2000 AU\",\"information_type\":\"location\",\"icon_image\":\"6510510bdf0271695568139.png\"}', NULL, 'ptc_prime', NULL, 0, NULL, '2023-09-30 16:44:20');
INSERT INTO `frontends` (`id`, `data_keys`, `data_values`, `seo_content`, `tempname`, `slug`, `view`, `created_at`, `updated_at`) VALUES
(254, 'contact.element', '{\"has_image\":\"1\",\"title\":\"+1 (555) 000-0000\",\"information_type\":\"mailto\",\"icon_image\":\"65105101ca6681695568129.png\"}', NULL, 'ptc_prime', NULL, 0, NULL, '2023-09-30 16:44:26'),
(255, 'contact.element', '{\"has_image\":\"1\",\"title\":\"hello@relume.io\",\"information_type\":\"mailto\",\"icon_image\":\"651050f4370bd1695568116.png\"}', NULL, 'ptc_prime', NULL, 0, NULL, '2023-09-30 16:47:27'),
(256, 'contact.content', '{\"heading\":\"Contact Us\",\"subheading\":\"Contact us if you have any questions, suggestions, feedback or complaints. You can reach us by email, phone or contact form. We are always happy to hear from you and we will do our best to respond as soon as possible.\",\"button\":\"Submit\"}', NULL, 'ptc_prime', NULL, 0, NULL, NULL),
(257, 'policy_pages.element', '{\"title\":\"Support Policy\",\"details\":\"<div class=\\\"mb-5\\\" style=\\\"margin-bottom:3rem;color:rgb(111,111,111);font-family:Nunito, sans-serif;\\\"><h3 class=\\\"mb-3\\\" style=\\\"font-weight:600;line-height:1.3;font-size:24px;color:rgb(54,54,54);font-family:Exo, sans-serif;\\\">What information do we collect?<\\/h3><p class=\\\"font-18\\\" style=\\\"margin-right:0px;margin-left:0px;font-size:18px;\\\">We gather data from you when you register on our site, submit a request, buy any services, react to an overview, or round out a structure. At the point when requesting any assistance or enrolling on our site, as suitable, you might be approached to enter your: name, email address, or telephone number. You may, nonetheless, visit our site anonymously.<\\/p><\\/div><div class=\\\"mb-5\\\" style=\\\"margin-bottom:3rem;color:rgb(111,111,111);font-family:Nunito, sans-serif;\\\"><h3 class=\\\"mb-3\\\" style=\\\"font-weight:600;line-height:1.3;font-size:24px;color:rgb(54,54,54);font-family:Exo, sans-serif;\\\">How do we protect your information?<\\/h3><p class=\\\"font-18\\\" style=\\\"margin-right:0px;margin-left:0px;font-size:18px;\\\">All provided delicate\\/credit data is sent through Stripe.<br \\/>After an exchange, your private data (credit cards, social security numbers, financials, and so on) won\'t be put away on our workers.<\\/p><\\/div><div class=\\\"mb-5\\\" style=\\\"margin-bottom:3rem;color:rgb(111,111,111);font-family:Nunito, sans-serif;\\\"><h3 class=\\\"mb-3\\\" style=\\\"font-weight:600;line-height:1.3;font-size:24px;color:rgb(54,54,54);font-family:Exo, sans-serif;\\\">Do we disclose any information to outside parties?<\\/h3><p class=\\\"font-18\\\" style=\\\"margin-right:0px;margin-left:0px;font-size:18px;\\\">We don\'t sell, exchange, or in any case move to outside gatherings by and by recognizable data. This does exclude confided in outsiders who help us in working our site, leading our business, or adjusting you, since those gatherings consent to keep this data private. We may likewise deliver your data when we accept discharge is suitable to follow the law, implement our site strategies, or ensure our own or others\' rights, property, or wellbeing.<\\/p><\\/div><div class=\\\"mb-5\\\" style=\\\"margin-bottom:3rem;color:rgb(111,111,111);font-family:Nunito, sans-serif;\\\"><h3 class=\\\"mb-3\\\" style=\\\"font-weight:600;line-height:1.3;font-size:24px;color:rgb(54,54,54);font-family:Exo, sans-serif;\\\">Children\'s Online Privacy Protection Act Compliance<\\/h3><p class=\\\"font-18\\\" style=\\\"margin-right:0px;margin-left:0px;font-size:18px;\\\">We are consistent with the prerequisites of COPPA (Children\'s Online Privacy Protection Act), we don\'t gather any data from anybody under 13 years old. Our site, items, and administrations are completely coordinated to individuals who are in any event 13 years of age or more established.<\\/p><\\/div><div class=\\\"mb-5\\\" style=\\\"margin-bottom:3rem;color:rgb(111,111,111);font-family:Nunito, sans-serif;\\\"><h3 class=\\\"mb-3\\\" style=\\\"font-weight:600;line-height:1.3;font-size:24px;color:rgb(54,54,54);font-family:Exo, sans-serif;\\\">Changes to our Privacy Policy<\\/h3><p class=\\\"font-18\\\" style=\\\"margin-right:0px;margin-left:0px;font-size:18px;\\\">If we decide to change our privacy policy, we will post those changes on this page.<\\/p><\\/div><div class=\\\"mb-5\\\" style=\\\"margin-bottom:3rem;color:rgb(111,111,111);font-family:Nunito, sans-serif;\\\"><h3 class=\\\"mb-3\\\" style=\\\"font-weight:600;line-height:1.3;font-size:24px;color:rgb(54,54,54);font-family:Exo, sans-serif;\\\">How long we retain your information?<\\/h3><p class=\\\"font-18\\\" style=\\\"margin-right:0px;margin-left:0px;font-size:18px;\\\">At the point when you register for our site, we cycle and keep your information we have about you however long you don\'t erase the record or withdraw yourself (subject to laws and guidelines).<\\/p><\\/div><div class=\\\"mb-5\\\" style=\\\"margin-bottom:3rem;color:rgb(111,111,111);font-family:Nunito, sans-serif;\\\"><h3 class=\\\"mb-3\\\" style=\\\"font-weight:600;line-height:1.3;font-size:24px;color:rgb(54,54,54);font-family:Exo, sans-serif;\\\">What we don\\u2019t do with your data<\\/h3><p class=\\\"font-18\\\" style=\\\"margin-right:0px;margin-left:0px;font-size:18px;\\\">We don\'t and will never share, unveil, sell, or in any case give your information to different organizations for the promoting of their items or administrations.<\\/p><\\/div>\"}', NULL, 'ptc_prime', 'support-policy', 0, NULL, NULL),
(258, 'policy_pages.element', '{\"title\":\"Payment Policy\",\"details\":\"<div class=\\\"mb-5\\\" style=\\\"color:rgb(111,111,111);font-family:Nunito, sans-serif;margin-bottom:3rem;\\\"><h3 class=\\\"mb-3\\\" style=\\\"font-weight:600;line-height:1.3;font-size:24px;font-family:Exo, sans-serif;color:rgb(54,54,54);\\\">What information do we collect?<\\/h3><p class=\\\"font-18\\\" style=\\\"margin-right:0px;margin-left:0px;font-size:18px;\\\">We gather data from you when you register on our site, submit a request, buy any services, react to an overview, or round out a structure. At the point when requesting any assistance or enrolling on our site, as suitable, you might be approached to enter your: name, email address, or telephone number. You may, nonetheless, visit our site anonymously.<\\/p><\\/div><div class=\\\"mb-5\\\" style=\\\"color:rgb(111,111,111);font-family:Nunito, sans-serif;margin-bottom:3rem;\\\"><h3 class=\\\"mb-3\\\" style=\\\"font-weight:600;line-height:1.3;font-size:24px;font-family:Exo, sans-serif;color:rgb(54,54,54);\\\">How do we protect your information?<\\/h3><p class=\\\"font-18\\\" style=\\\"margin-right:0px;margin-left:0px;font-size:18px;\\\">All provided delicate\\/credit data is sent through Stripe.<br \\/>After an exchange, your private data (credit cards, social security numbers, financials, and so on) won\'t be put away on our workers.<\\/p><\\/div><div class=\\\"mb-5\\\" style=\\\"color:rgb(111,111,111);font-family:Nunito, sans-serif;margin-bottom:3rem;\\\"><h3 class=\\\"mb-3\\\" style=\\\"font-weight:600;line-height:1.3;font-size:24px;font-family:Exo, sans-serif;color:rgb(54,54,54);\\\">Do we disclose any information to outside parties?<\\/h3><p class=\\\"font-18\\\" style=\\\"margin-right:0px;margin-left:0px;font-size:18px;\\\">We don\'t sell, exchange, or in any case move to outside gatherings by and by recognizable data. This does exclude confided in outsiders who help us in working our site, leading our business, or adjusting you, since those gatherings consent to keep this data private. We may likewise deliver your data when we accept discharge is suitable to follow the law, implement our site strategies, or ensure our own or others\' rights, property, or wellbeing.<\\/p><\\/div><div class=\\\"mb-5\\\" style=\\\"color:rgb(111,111,111);font-family:Nunito, sans-serif;margin-bottom:3rem;\\\"><h3 class=\\\"mb-3\\\" style=\\\"font-weight:600;line-height:1.3;font-size:24px;font-family:Exo, sans-serif;color:rgb(54,54,54);\\\">Children\'s Online Privacy Protection Act Compliance<\\/h3><p class=\\\"font-18\\\" style=\\\"margin-right:0px;margin-left:0px;font-size:18px;\\\">We are consistent with the prerequisites of COPPA (Children\'s Online Privacy Protection Act), we don\'t gather any data from anybody under 13 years old. Our site, items, and administrations are completely coordinated to individuals who are in any event 13 years of age or more established.<\\/p><\\/div><div class=\\\"mb-5\\\" style=\\\"color:rgb(111,111,111);font-family:Nunito, sans-serif;margin-bottom:3rem;\\\"><h3 class=\\\"mb-3\\\" style=\\\"font-weight:600;line-height:1.3;font-size:24px;font-family:Exo, sans-serif;color:rgb(54,54,54);\\\">Changes to our Privacy Policy<\\/h3><p class=\\\"font-18\\\" style=\\\"margin-right:0px;margin-left:0px;font-size:18px;\\\">If we decide to change our privacy policy, we will post those changes on this page.<\\/p><\\/div><div class=\\\"mb-5\\\" style=\\\"color:rgb(111,111,111);font-family:Nunito, sans-serif;margin-bottom:3rem;\\\"><h3 class=\\\"mb-3\\\" style=\\\"font-weight:600;line-height:1.3;font-size:24px;font-family:Exo, sans-serif;color:rgb(54,54,54);\\\">How long we retain your information?<\\/h3><p class=\\\"font-18\\\" style=\\\"margin-right:0px;margin-left:0px;font-size:18px;\\\">At the point when you register for our site, we cycle and keep your information we have about you however long you don\'t erase the record or withdraw yourself (subject to laws and guidelines).<\\/p><\\/div><div class=\\\"mb-5\\\" style=\\\"color:rgb(111,111,111);font-family:Nunito, sans-serif;margin-bottom:3rem;\\\"><h3 class=\\\"mb-3\\\" style=\\\"font-weight:600;line-height:1.3;font-size:24px;font-family:Exo, sans-serif;color:rgb(54,54,54);\\\">What we don\\u2019t do with your data<\\/h3><p class=\\\"font-18\\\" style=\\\"margin-right:0px;margin-left:0px;font-size:18px;\\\">We don\'t and will never share, unveil, sell, or in any case give your information to different organizations for the promoting of their items or administrations.<\\/p><\\/div>\"}', NULL, 'ptc_prime', 'payment-policy', 0, NULL, NULL),
(259, 'policy_pages.element', '{\"title\":\"Privacy and Policy\",\"details\":\"<div class=\\\"mb-5\\\" style=\\\"color:rgb(111,111,111);font-family:Nunito, sans-serif;margin-bottom:3rem;\\\"><h3 class=\\\"mb-3\\\" style=\\\"font-weight:600;line-height:1.3;font-size:24px;font-family:Exo, sans-serif;color:rgb(54,54,54);\\\">What information do we collect?<\\/h3><p class=\\\"font-18\\\" style=\\\"margin-right:0px;margin-left:0px;font-size:18px;\\\">We gather data from you when you register on our site, submit a request, buy any services, react to an overview, or round out a structure. At the point when requesting any assistance or enrolling on our site, as suitable, you might be approached to enter your: name, email address, or telephone number. You may, nonetheless, visit our site anonymously.<\\/p><\\/div><div class=\\\"mb-5\\\" style=\\\"color:rgb(111,111,111);font-family:Nunito, sans-serif;margin-bottom:3rem;\\\"><h3 class=\\\"mb-3\\\" style=\\\"font-weight:600;line-height:1.3;font-size:24px;font-family:Exo, sans-serif;color:rgb(54,54,54);\\\">How do we protect your information?<\\/h3><p class=\\\"font-18\\\" style=\\\"margin-right:0px;margin-left:0px;font-size:18px;\\\">All provided delicate\\/credit data is sent through Stripe.<br \\/>After an exchange, your private data (credit cards, social security numbers, financials, and so on) won\'t be put away on our workers.<\\/p><\\/div><div class=\\\"mb-5\\\" style=\\\"color:rgb(111,111,111);font-family:Nunito, sans-serif;margin-bottom:3rem;\\\"><h3 class=\\\"mb-3\\\" style=\\\"font-weight:600;line-height:1.3;font-size:24px;font-family:Exo, sans-serif;color:rgb(54,54,54);\\\">Do we disclose any information to outside parties?<\\/h3><p class=\\\"font-18\\\" style=\\\"margin-right:0px;margin-left:0px;font-size:18px;\\\">We don\'t sell, exchange, or in any case move to outside gatherings by and by recognizable data. This does exclude confided in outsiders who help us in working our site, leading our business, or adjusting you, since those gatherings consent to keep this data private. We may likewise deliver your data when we accept discharge is suitable to follow the law, implement our site strategies, or ensure our own or others\' rights, property, or wellbeing.<\\/p><\\/div><div class=\\\"mb-5\\\" style=\\\"color:rgb(111,111,111);font-family:Nunito, sans-serif;margin-bottom:3rem;\\\"><h3 class=\\\"mb-3\\\" style=\\\"font-weight:600;line-height:1.3;font-size:24px;font-family:Exo, sans-serif;color:rgb(54,54,54);\\\">Children\'s Online Privacy Protection Act Compliance<\\/h3><p class=\\\"font-18\\\" style=\\\"margin-right:0px;margin-left:0px;font-size:18px;\\\">We are consistent with the prerequisites of COPPA (Children\'s Online Privacy Protection Act), we don\'t gather any data from anybody under 13 years old. Our site, items, and administrations are completely coordinated to individuals who are in any event 13 years of age or more established.<\\/p><\\/div><div class=\\\"mb-5\\\" style=\\\"color:rgb(111,111,111);font-family:Nunito, sans-serif;margin-bottom:3rem;\\\"><h3 class=\\\"mb-3\\\" style=\\\"font-weight:600;line-height:1.3;font-size:24px;font-family:Exo, sans-serif;color:rgb(54,54,54);\\\">Changes to our Privacy Policy<\\/h3><p class=\\\"font-18\\\" style=\\\"margin-right:0px;margin-left:0px;font-size:18px;\\\">If we decide to change our privacy policy, we will post those changes on this page.<\\/p><\\/div><div class=\\\"mb-5\\\" style=\\\"color:rgb(111,111,111);font-family:Nunito, sans-serif;margin-bottom:3rem;\\\"><h3 class=\\\"mb-3\\\" style=\\\"font-weight:600;line-height:1.3;font-size:24px;font-family:Exo, sans-serif;color:rgb(54,54,54);\\\">How long we retain your information?<\\/h3><p class=\\\"font-18\\\" style=\\\"margin-right:0px;margin-left:0px;font-size:18px;\\\">At the point when you register for our site, we cycle and keep your information we have about you however long you don\'t erase the record or withdraw yourself (subject to laws and guidelines).<\\/p><\\/div><div class=\\\"mb-5\\\" style=\\\"color:rgb(111,111,111);font-family:Nunito, sans-serif;margin-bottom:3rem;\\\"><h3 class=\\\"mb-3\\\" style=\\\"font-weight:600;line-height:1.3;font-size:24px;font-family:Exo, sans-serif;color:rgb(54,54,54);\\\">What we don\\u2019t do with your data<\\/h3><p class=\\\"font-18\\\" style=\\\"margin-right:0px;margin-left:0px;font-size:18px;\\\">We don\'t and will never share, unveil, sell, or in any case give your information to different organizations for the promoting of their items or administrations.<\\/p><\\/div>\"}', NULL, 'ptc_prime', 'privacy-and-policy', 0, NULL, NULL),
(260, 'footer.element', '{\"icon\":\"<i class=\\\"lar la-envelope\\\"><\\/i>\",\"information\":\"contact@ptcl.com\",\"information_type\":\"mailto\"}', NULL, 'ptc_prime', NULL, 0, NULL, '2023-09-30 10:36:16'),
(261, 'footer.element', '{\"icon\":\"<i class=\\\"las la-phone-volume\\\"><\\/i>\",\"information\":\"+012-345-67890\",\"information_type\":\"tel\"}', NULL, 'ptc_prime', NULL, 0, NULL, '2023-09-30 10:36:23'),
(262, 'footer.element', '{\"icon\":\"<i class=\\\"las la-map-marker-alt\\\"><\\/i>\",\"information\":\"13 Vine St, Lowa, USA\",\"information_type\":\"none\"}', NULL, 'ptc_prime', NULL, 0, NULL, '2023-09-30 16:36:32'),
(263, 'footer.content', '{\"about\":\"we\'ve crafted a dynamic platform where your time and clicks transform into real rewards. Whether you\'re a newcomer looking to dip your toes into the world of online earnings or an experienced pro seeking to maximize your income, PTCLab has you covered.\"}', NULL, 'ptc_prime', NULL, 0, NULL, '2023-09-30 15:35:20'),
(264, 'testimonial.element', '{\"has_image\":\"1\",\"name\":\"Chris Hamsorth\",\"designation\":\"PTC Player\",\"comment\":\"Lorem ipsum dolor sit amet, consectetur adipisicing elit. Voluptatibus fuga, lauda ium odio dolor ut  iusto,  pariatur neque ique quod ratione tempore velit iure sapiente beatae id dolores.\",\"review\":\"4\",\"image\":\"650f017618ed01695482230.png\"}', NULL, 'ptc_prime', NULL, 0, NULL, NULL),
(265, 'testimonial.element', '{\"has_image\":\"1\",\"name\":\"Rajendra\",\"designation\":\"Web Developer\",\"comment\":\"Lorem ipsum dolor sit amet, consectetur adipisicing elit. Voluptatibus fuga, lauda ium odio dolor ut  iusto,  pariatur neque ique quod ratione tempore velit iure sapiente beatae id dolores.v\",\"review\":\"5\",\"image\":\"650f0187097181695482247.png\"}', NULL, 'ptc_prime', NULL, 0, NULL, NULL),
(266, 'testimonial.element', '{\"has_image\":\"1\",\"name\":\"Chris Hamsorth\",\"designation\":\"PTC Player\",\"comment\":\"Lorem ipsum dolor sit amet, consectetur adipisicing elit. Voluptatibus fuga, lauda ium odio dolor ut  iusto,  pariatur neque ique quod ratione tempore velit iure sapiente beatae id dolores.\",\"review\":\"4\",\"image\":\"650f017618ed01695482230.png\"}', NULL, 'ptc_prime', NULL, 0, NULL, NULL),
(267, 'testimonial.element', '{\"has_image\":\"1\",\"name\":\"Peter Parker\",\"designation\":\"Microtech, Inc.\",\"comment\":\"Lorem ipsum dolor sit amet, consectetur adipisicing elit. Voluptatibus fuga, lauda ium odio dolor ut  iusto,  pariatur neque ique quod ratione tempore velit iure sapiente beatae id dolores.\",\"review\":\"4\",\"image\":\"650f018ee974a1695482254.png\"}', NULL, 'ptc_prime', NULL, 0, NULL, NULL),
(268, 'testimonial.element', '{\"has_image\":\"1\",\"name\":\"Rajendra\",\"designation\":\"Web Developer\",\"comment\":\"Lorem ipsum dolor sit amet, consectetur adipisicing elit. Voluptatibus fuga, lauda ium odio dolor ut  iusto,  pariatur neque ique quod ratione tempore velit iure sapiente beatae id dolores.v\",\"review\":\"5\",\"image\":\"650f0187097181695482247.png\"}', NULL, 'ptc_prime', NULL, 0, NULL, NULL),
(269, 'testimonial.element', '{\"has_image\":\"1\",\"name\":\"John Doe\",\"designation\":\"Businessman\",\"comment\":\"Lorem ipsum dolor sit amet, consectetur adipisicing elit. Voluptatibus fuga, lauda ium odio dolor ut  iusto,  pariatur neque ique quod ratione tempore velit iure sapiente beatae id dolores.\",\"review\":\"5\",\"image\":\"650f017e2935f1695482238.png\"}', NULL, 'ptc_prime', NULL, 0, NULL, NULL),
(270, 'testimonial.element', '{\"has_image\":\"1\",\"name\":\"Chris Hamsorth\",\"designation\":\"PTC Player\",\"comment\":\"Lorem ipsum dolor sit amet, consectetur adipisicing elit. Voluptatibus fuga, lauda ium odio dolor ut  iusto,  pariatur neque ique quod ratione tempore velit iure sapiente beatae id dolores.\",\"review\":\"4\",\"image\":\"650f017618ed01695482230.png\"}', NULL, 'ptc_prime', NULL, 0, NULL, NULL),
(271, 'testimonial.content', '{\"section_title\":\"Our Users Review\",\"heading\":\"Words from Our Earners: PTC Success Stories\"}', NULL, 'ptc_prime', NULL, 0, NULL, NULL),
(272, 'counter.content', '{\"heading\":\"Best Place To Earn Money Online\"}', NULL, 'ptc_prime', NULL, 0, NULL, NULL),
(273, 'plan.content', '{\"section_title\":\"Our Best Plans\",\"heading\":\"Unleash Your Earning Power: Our Plan Offerings at a Glance\"}', NULL, 'ptc_prime', NULL, 0, NULL, NULL),
(274, 'features.element', '{\"has_image\":\"1\",\"title\":\"Secure Transection\",\"content\":\"Search engine advertising, also known as search engine marketing (SEM), allows you to show ads to users based on the keywords.\",\"icon_image\":\"650ef139666f51695478073.png\"}', NULL, 'ptc_prime', NULL, 0, NULL, NULL),
(275, 'features.element', '{\"has_image\":\"1\",\"title\":\"Earning Statement\",\"content\":\"Search engine advertising, also known as search engine marketing (SEM), allows you to show ads to users based on the keywords.\",\"icon_image\":\"650ef133ae1071695478067.png\"}', NULL, 'ptc_prime', NULL, 0, NULL, NULL),
(276, 'features.element', '{\"has_image\":\"1\",\"title\":\"We\'re Certified\",\"content\":\"Voluptatibus at vero, amet sit esse sequi quam odio debitis. Nulla porro tenetur adipisci laborum sunt repellendus error, asperiores quam nobis sit!\",\"icon_image\":\"650ef12dc43991695478061.png\"}', NULL, 'ptc_prime', NULL, 0, NULL, NULL),
(277, 'features.element', '{\"has_image\":\"1\",\"title\":\"We\'re Secure\",\"content\":\"Voluptatibus at vero, amet sit esse sequi quam odio debitis. Nulla porro tenetur adipisci laborum sunt repellendus error, asperiores quam nobis sit!\",\"icon_image\":\"650ef127d92161695478055.png\"}', NULL, 'ptc_prime', NULL, 0, NULL, NULL),
(278, 'features.element', '{\"has_image\":\"1\",\"title\":\"We\'re Profitable\",\"content\":\"Voluptatibus at vero, amet sit esse sequi quam odio debitis. Nulla porro tenetur adipisci laborum sunt repellendus error, asperiores quam nobis sit!\",\"icon_image\":\"650ef1213e12a1695478049.png\"}', NULL, 'ptc_prime', NULL, 0, NULL, NULL),
(279, 'features.element', '{\"has_image\":\"1\",\"title\":\"We Accept Crypto\",\"content\":\"Voluptatibus at vero, amet sit esse sequi quam odio debitis. Nulla porro tenetur adipisci laborum sunt repellendus error, asperiores quam nobis sit!\",\"icon_image\":\"650ef11aa9a1e1695478042.png\"}', NULL, 'ptc_prime', NULL, 0, NULL, NULL),
(280, 'features.element', '{\"has_image\":\"1\",\"title\":\"Best Support\",\"content\":\"Voluptatibus at vero, amet sit esse sequi quam odio debitis. Nulla porro tenetur adipisci laborum sunt repellendus error, asperiores quam nobis sit!\",\"icon_image\":\"650ef113a3d3e1695478035.png\"}', NULL, 'ptc_prime', NULL, 0, NULL, NULL),
(281, 'features.element', '{\"has_image\":\"1\",\"title\":\"We\'re Global\",\"content\":\"Voluptatibus at vero, amet sit esse sequi quam odio debitis. Nulla porro tenetur adipisci laborum sunt repellendus error, asperiores quam nobis sit!\",\"icon_image\":\"650ef10d0dbe21695478029.png\"}', NULL, 'ptc_prime', NULL, 0, NULL, NULL),
(282, 'features.content', '{\"section_title\":\"Our Features\",\"heading\":\"Earning Evolved: Embrace the Future with PTC Features\",\"button\":\"Get Started\",\"button_link\":\"user\\/register\"}', NULL, 'ptc_prime', NULL, 0, NULL, NULL),
(283, 'about.element', '{\"has_image\":[\"1\"],\"title\":\"Review Costly PPC Keywords\",\"sub_title\":\"Welcome to PTCLAB, the premier platform that connects users with valuable earning opportunities.\",\"icon_image\":\"650eeb3bb9e291695476539.png\"}', NULL, 'ptc_prime', NULL, 0, NULL, NULL),
(284, 'about.element', '{\"has_image\":[\"1\"],\"title\":\"Refine Landing Pages\",\"sub_title\":\"Welcome to PTCLAB, the premier platform that connects users with valuable earning opportunities.\",\"icon_image\":\"650eeb2cba6411695476524.png\"}', NULL, 'ptc_prime', NULL, 0, NULL, NULL),
(285, 'about.element', '{\"has_image\":[\"1\"],\"title\":\"Managing Your PPC Campaigns\",\"sub_title\":\"Welcome to PTCLAB, the premier platform that connects users with valuable earning opportunities.\",\"icon_image\":\"650eeb1ca8bb41695476508.png\"}', NULL, 'ptc_prime', NULL, 0, NULL, NULL),
(286, 'about.element', '{\"has_image\":[\"1\"],\"title\":\"PPC Keyword Research\",\"sub_title\":\"Welcome to PTCLAB, the premier platform that connects users with valuable earning opportunities.\",\"icon_image\":\"650eeb0697bb01695476486.png\"}', NULL, 'ptc_prime', NULL, 0, NULL, NULL),
(287, 'about.content', '{\"has_image\":\"1\",\"section_title\":\"About Us\",\"heading\":\"The Power of PTCLAB: Providing Financial Opportunities at Your Fingertips\",\"subheading\":\"Welcome to PTCLAB, the premier platform that connects users with valuable earning opportunities. With our innovative PPT system, you can effortlessly monetize your time and earn money by simply clicking on ads.\",\"button\":\"Get Started\",\"button_link\":\"user\\/register\",\"image\":\"650eeae37a11a1695476451.png\"}', NULL, 'ptc_prime', NULL, 0, NULL, NULL),
(288, 'brand.element', '{\"has_image\":\"1\",\"image\":\"6517ac6e641b21696050286.png\"}', NULL, 'ptc_prime', NULL, 0, NULL, '2023-09-30 09:04:46'),
(289, 'brand.element', '{\"has_image\":\"1\",\"image\":\"6517ac793c1911696050297.png\"}', NULL, 'ptc_prime', NULL, 0, NULL, '2023-09-30 09:04:57'),
(290, 'brand.element', '{\"has_image\":\"1\",\"image\":\"6517ac84856011696050308.png\"}', NULL, 'ptc_prime', NULL, 0, NULL, '2023-09-30 09:05:08'),
(291, 'brand.element', '{\"has_image\":\"1\",\"image\":\"6517ac944f4571696050324.png\"}', NULL, 'ptc_prime', NULL, 0, NULL, '2023-09-30 09:05:24'),
(292, 'brand.element', '{\"has_image\":\"1\",\"image\":\"650ee512b84291695474962.png\"}', NULL, 'ptc_prime', NULL, 0, NULL, NULL),
(293, 'brand.element', '{\"has_image\":\"1\",\"image\":\"6517ac9c2e1f21696050332.png\"}', NULL, 'ptc_prime', NULL, 0, NULL, '2023-09-30 09:05:32'),
(294, 'brand.element', '{\"has_image\":\"1\",\"image\":\"650ee508d1e921695474952.png\"}', NULL, 'ptc_prime', NULL, 0, NULL, NULL),
(295, 'brand.element', '{\"has_image\":\"1\",\"image\":\"6517acb302e151696050355.png\"}', NULL, 'ptc_prime', NULL, 0, NULL, '2023-09-30 09:05:55'),
(296, 'banner.content', '{\"has_image\":\"1\",\"title\":\"Unleash Your Clicking Power\",\"heading\":\"Effortlessly Earn Money by Viewing\",\"subheading\":\"Turn your clicks into cash with our trusted PPT website. Experience a reliable and transparent system that rewards your engagement and dedication.\",\"button_one\":\"Get Started\",\"button_link_one\":\"user\\/register\",\"button_two\":\"Learn More\",\"button_link_two\":\"about\",\"customer_count\":\"1000+\",\"customer_title\":\"Happy Customer\",\"image_one\":\"6517ab4ec1ba71696049998.png\",\"image_two\":\"6517ab4ef387d1696049998.png\",\"image_three\":\"6517ab4f1aa081696049999.png\"}', NULL, 'ptc_prime', NULL, 0, NULL, '2023-09-30 15:04:41'),
(297, 'counter.element', '{\"title\":\"Withdraw\",\"number\":\"750\",\"abbreviation\":\"K+\"}', NULL, 'ptc_prime', NULL, 0, '2023-09-30 10:08:31', '2023-09-30 10:09:58'),
(298, 'counter.element', '{\"title\":\"Users\",\"number\":\"50\",\"abbreviation\":\"K+\"}', NULL, 'ptc_prime', NULL, 0, '2023-09-30 10:08:31', '2023-09-30 10:10:09'),
(299, 'counter.element', '{\"title\":\"Impression\",\"number\":\"20\",\"abbreviation\":\"M+\"}', NULL, 'ptc_prime', NULL, 0, '2023-09-30 10:08:31', '2023-09-30 10:10:15'),
(300, 'counter.element', '{\"title\":\"Advertisement\",\"number\":\"568\",\"abbreviation\":\"K=\"}', NULL, 'ptc_prime', NULL, 0, '2023-09-30 10:08:31', '2023-09-30 10:10:29'),
(301, 'testimonial.element', '{\"has_image\":\"1\",\"name\":\"Chris Hamsort\",\"designation\":\"Chris Hamsort\",\"comment\":\"Chris Hamsort\",\"review\":\"4\"}', NULL, 'ptc_prime', NULL, 0, '2023-09-30 13:38:28', '2023-09-30 13:38:28'),
(302, 'kyc.content', '{\"required\":\"Complete KYC to unlock the full potential of our platform! KYC helps us verify your identity and keep things secure. It is quick and easy just follow the on-screen instructions. Get started with KYC verification now!\",\"pending\":\"Your KYC verification is being reviewed. We might need some additional information. You will get an email update soon. In the meantime, explore our platform with limited features.\",\"reject\":\"We regret to inform you that the Know Your Customer (KYC) information provided has been reviewed and unfortunately, it has not met our verification standards.\"}', NULL, 'basic', '', 0, '2024-05-18 05:06:56', '2024-05-18 05:06:56'),
(303, 'register_disable.content', '{\"has_image\":\"1\",\"heading\":\"Registration Currently Disabled\",\"subheading\":\"Page you are looking for doesn\'t exit or an other error occurred or temporarily unavailable.\",\"button_name\":\"Go to Home\",\"button_url\":\"\\/\",\"image\":\"66488b6067df71716030304.png\"}', NULL, 'ptc_diamond', '', 0, '2024-05-18 05:05:04', '2024-05-18 05:05:04'),
(304, 'ban_page.content', '{\"has_image\":\"1\",\"heading\":\"THIS ACCOUNT IS BANNED\",\"image\":\"66602de41d5fe1717579236.jpg\"}', NULL, 'ptc_diamond', '', 0, '2024-06-05 09:19:37', '2024-06-05 09:21:01'),
(305, 'kyc.content', '{\"required\":\"Complete KYC to unlock the full potential of our platform! KYC helps us verify your identity and keep things secure. It is quick and easy just follow the on-screen instructions. Get started with KYC verification now!\",\"pending\":\"Your KYC verification is being reviewed. We might need some additional information. You will get an email update soon. In the meantime, explore our platform with limited features.\",\"reject\":\"We regret to inform you that the Know Your Customer (KYC) information provided has been reviewed and unfortunately, it has not met our verification standards.\"}', NULL, 'ptc_diamond', '', 0, '2024-05-18 05:06:56', '2024-05-18 05:06:56'),
(306, 'register_disable.content', '{\"has_image\":\"1\",\"heading\":\"Registration Currently Disabled\",\"subheading\":\"Page you are looking for doesn\'t exit or an other error occurred or temporarily unavailable.\",\"button_name\":\"Go to Home\",\"button_url\":\"\\/\",\"image\":\"66488b6067df71716030304.png\"}', NULL, 'ptc_prime', '', 0, '2024-05-18 05:05:04', '2024-05-18 05:05:04'),
(307, 'register_disable.content', '{\"has_image\":\"1\",\"heading\":\"Registration Currently Disabled\",\"subheading\":\"Page you are looking for doesn\'t exit or an other error occurred or temporarily unavailable.\",\"button_name\":\"Go to Home\",\"button_url\":\"\\/\",\"image\":\"66488b6067df71716030304.png\"}', NULL, 'basic', '', 0, '2024-05-18 05:05:04', '2024-05-18 05:05:04'),
(308, 'kyc.content', '{\"required\":\"Complete KYC to unlock the full potential of our platform! KYC helps us verify your identity and keep things secure. It is quick and easy just follow the on-screen instructions. Get started with KYC verification now!\",\"pending\":\"Your KYC verification is being reviewed. We might need some additional information. You will get an email update soon. In the meantime, explore our platform with limited features.\",\"reject\":\"We regret to inform you that the Know Your Customer (KYC) information provided has been reviewed and unfortunately, it has not met our verification standards.\"}', NULL, 'ptc_prime', '', 0, '2024-05-18 05:06:56', '2024-05-18 05:06:56');

-- --------------------------------------------------------

--
-- Table structure for table `gateways`
--

CREATE TABLE `gateways` (
  `id` bigint UNSIGNED NOT NULL,
  `form_id` int UNSIGNED NOT NULL DEFAULT '0',
  `code` int DEFAULT NULL,
  `name` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `alias` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'NULL',
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1=>enable, 2=>disable',
  `gateway_parameters` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `supported_currencies` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `crypto` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0: fiat currency, 1: crypto currency',
  `extra` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `gateways`
--

INSERT INTO `gateways` (`id`, `form_id`, `code`, `name`, `alias`, `image`, `status`, `gateway_parameters`, `supported_currencies`, `crypto`, `extra`, `description`, `created_at`, `updated_at`) VALUES
(1, 0, 101, 'Paypal', 'Paypal', '663a38d7b455d1715091671.png', 1, '{\"paypal_email\":{\"title\":\"PayPal Email\",\"global\":true,\"value\":\"sb-owud61543012@business.example.com\"}}', '{\"AUD\":\"AUD\",\"BRL\":\"BRL\",\"CAD\":\"CAD\",\"CZK\":\"CZK\",\"DKK\":\"DKK\",\"EUR\":\"EUR\",\"HKD\":\"HKD\",\"HUF\":\"HUF\",\"INR\":\"INR\",\"ILS\":\"ILS\",\"JPY\":\"JPY\",\"MYR\":\"MYR\",\"MXN\":\"MXN\",\"TWD\":\"TWD\",\"NZD\":\"NZD\",\"NOK\":\"NOK\",\"PHP\":\"PHP\",\"PLN\":\"PLN\",\"GBP\":\"GBP\",\"RUB\":\"RUB\",\"SGD\":\"SGD\",\"SEK\":\"SEK\",\"CHF\":\"CHF\",\"THB\":\"THB\",\"USD\":\"$\"}', 0, NULL, NULL, '2019-09-14 13:14:22', '2021-05-21 00:04:38'),
(2, 0, 102, 'Perfect Money', 'PerfectMoney', '663a3920e30a31715091744.png', 1, '{\"passphrase\":{\"title\":\"ALTERNATE PASSPHRASE\",\"global\":true,\"value\":\"hR26aw02Q1eEeUPSIfuwNypXX\"},\"wallet_id\":{\"title\":\"PM Wallet\",\"global\":false,\"value\":\"\"}}', '{\"USD\":\"$\",\"EUR\":\"\\u20ac\"}', 0, NULL, NULL, '2019-09-14 13:14:22', '2021-05-21 01:35:33'),
(3, 0, 103, 'Stripe Hosted', 'Stripe', '663a39861cb9d1715091846.png', 1, '{\"secret_key\":{\"title\":\"Secret Key\",\"global\":true,\"value\":\"sk_test_51I6GGiCGv1sRiQlEi5v1or9eR0HVbuzdMd2rW4n3DxC8UKfz66R4X6n4yYkzvI2LeAIuRU9H99ZpY7XCNFC9xMs500vBjZGkKG\"},\"publishable_key\":{\"title\":\"PUBLISHABLE KEY\",\"global\":true,\"value\":\"pk_test_51I6GGiCGv1sRiQlEOisPKrjBqQqqcFsw8mXNaZ2H2baN6R01NulFS7dKFji1NRRxuchoUTEDdB7ujKcyKYSVc0z500eth7otOM\"}}', '{\"USD\":\"USD\",\"AUD\":\"AUD\",\"BRL\":\"BRL\",\"CAD\":\"CAD\",\"CHF\":\"CHF\",\"DKK\":\"DKK\",\"EUR\":\"EUR\",\"GBP\":\"GBP\",\"HKD\":\"HKD\",\"INR\":\"INR\",\"JPY\":\"JPY\",\"MXN\":\"MXN\",\"MYR\":\"MYR\",\"NOK\":\"NOK\",\"NZD\":\"NZD\",\"PLN\":\"PLN\",\"SEK\":\"SEK\",\"SGD\":\"SGD\"}', 0, NULL, NULL, '2019-09-14 13:14:22', '2021-05-21 00:48:36'),
(4, 0, 104, 'Skrill', 'Skrill', '663a39494c4a91715091785.png', 1, '{\"pay_to_email\":{\"title\":\"Skrill Email\",\"global\":true,\"value\":\"merchant@skrill.com\"},\"secret_key\":{\"title\":\"Secret Key\",\"global\":true,\"value\":\"---\"}}', '{\"AED\":\"AED\",\"AUD\":\"AUD\",\"BGN\":\"BGN\",\"BHD\":\"BHD\",\"CAD\":\"CAD\",\"CHF\":\"CHF\",\"CZK\":\"CZK\",\"DKK\":\"DKK\",\"EUR\":\"EUR\",\"GBP\":\"GBP\",\"HKD\":\"HKD\",\"HRK\":\"HRK\",\"HUF\":\"HUF\",\"ILS\":\"ILS\",\"INR\":\"INR\",\"ISK\":\"ISK\",\"JOD\":\"JOD\",\"JPY\":\"JPY\",\"KRW\":\"KRW\",\"KWD\":\"KWD\",\"MAD\":\"MAD\",\"MYR\":\"MYR\",\"NOK\":\"NOK\",\"NZD\":\"NZD\",\"OMR\":\"OMR\",\"PLN\":\"PLN\",\"QAR\":\"QAR\",\"RON\":\"RON\",\"RSD\":\"RSD\",\"SAR\":\"SAR\",\"SEK\":\"SEK\",\"SGD\":\"SGD\",\"THB\":\"THB\",\"TND\":\"TND\",\"TRY\":\"TRY\",\"TWD\":\"TWD\",\"USD\":\"USD\",\"ZAR\":\"ZAR\",\"COP\":\"COP\"}', 0, NULL, NULL, '2019-09-14 13:14:22', '2021-05-21 01:30:16'),
(5, 0, 105, 'PayTM', 'Paytm', '663a390f601191715091727.png', 1, '{\"MID\":{\"title\":\"Merchant ID\",\"global\":true,\"value\":\"DIY12386817555501617\"},\"merchant_key\":{\"title\":\"Merchant Key\",\"global\":true,\"value\":\"bKMfNxPPf_QdZppa\"},\"WEBSITE\":{\"title\":\"Paytm Website\",\"global\":true,\"value\":\"DIYtestingweb\"},\"INDUSTRY_TYPE_ID\":{\"title\":\"Industry Type\",\"global\":true,\"value\":\"Retail\"},\"CHANNEL_ID\":{\"title\":\"CHANNEL ID\",\"global\":true,\"value\":\"WEB\"},\"transaction_url\":{\"title\":\"Transaction URL\",\"global\":true,\"value\":\"https:\\/\\/pguat.paytm.com\\/oltp-web\\/processTransaction\"},\"transaction_status_url\":{\"title\":\"Transaction STATUS URL\",\"global\":true,\"value\":\"https:\\/\\/pguat.paytm.com\\/paytmchecksum\\/paytmCallback.jsp\"}}', '{\"AUD\":\"AUD\",\"ARS\":\"ARS\",\"BDT\":\"BDT\",\"BRL\":\"BRL\",\"BGN\":\"BGN\",\"CAD\":\"CAD\",\"CLP\":\"CLP\",\"CNY\":\"CNY\",\"COP\":\"COP\",\"HRK\":\"HRK\",\"CZK\":\"CZK\",\"DKK\":\"DKK\",\"EGP\":\"EGP\",\"EUR\":\"EUR\",\"GEL\":\"GEL\",\"GHS\":\"GHS\",\"HKD\":\"HKD\",\"HUF\":\"HUF\",\"INR\":\"INR\",\"IDR\":\"IDR\",\"ILS\":\"ILS\",\"JPY\":\"JPY\",\"KES\":\"KES\",\"MYR\":\"MYR\",\"MXN\":\"MXN\",\"MAD\":\"MAD\",\"NPR\":\"NPR\",\"NZD\":\"NZD\",\"NGN\":\"NGN\",\"NOK\":\"NOK\",\"PKR\":\"PKR\",\"PEN\":\"PEN\",\"PHP\":\"PHP\",\"PLN\":\"PLN\",\"RON\":\"RON\",\"RUB\":\"RUB\",\"SGD\":\"SGD\",\"ZAR\":\"ZAR\",\"KRW\":\"KRW\",\"LKR\":\"LKR\",\"SEK\":\"SEK\",\"CHF\":\"CHF\",\"THB\":\"THB\",\"TRY\":\"TRY\",\"UGX\":\"UGX\",\"UAH\":\"UAH\",\"AED\":\"AED\",\"GBP\":\"GBP\",\"USD\":\"USD\",\"VND\":\"VND\",\"XOF\":\"XOF\"}', 0, NULL, NULL, '2019-09-14 13:14:22', '2021-05-21 03:00:44'),
(6, 0, 106, 'Payeer', 'Payeer', '663a38c9e2e931715091657.png', 0, '{\"merchant_id\":{\"title\":\"Merchant ID\",\"global\":true,\"value\":\"866989763\"},\"secret_key\":{\"title\":\"Secret key\",\"global\":true,\"value\":\"7575\"}}', '{\"USD\":\"USD\",\"EUR\":\"EUR\",\"RUB\":\"RUB\"}', 0, '{\"status\":{\"title\": \"Status URL\",\"value\":\"ipn.Payeer\"}}', NULL, '2019-09-14 13:14:22', '2020-12-28 01:26:58'),
(7, 0, 107, 'PayStack', 'Paystack', '663a38fc814e91715091708.png', 1, '{\"public_key\":{\"title\":\"Public key\",\"global\":true,\"value\":\"pk_test_cd330608eb47970889bca397ced55c1dd5ad3783\"},\"secret_key\":{\"title\":\"Secret key\",\"global\":true,\"value\":\"sk_test_8a0b1f199362d7acc9c390bff72c4e81f74e2ac3\"}}', '{\"USD\":\"USD\",\"NGN\":\"NGN\"}', 0, '{\"callback\":{\"title\": \"Callback URL\",\"value\":\"ipn.Paystack\"},\"webhook\":{\"title\": \"Webhook URL\",\"value\":\"ipn.Paystack\"}}\r\n', NULL, '2019-09-14 13:14:22', '2021-05-21 01:49:51'),
(9, 0, 109, 'Flutterwave', 'Flutterwave', '663a36c2c34d61715091138.png', 1, '{\"public_key\":{\"title\":\"Public Key\",\"global\":true,\"value\":\"----------------\"},\"secret_key\":{\"title\":\"Secret Key\",\"global\":true,\"value\":\"-----------------------\"},\"encryption_key\":{\"title\":\"Encryption Key\",\"global\":true,\"value\":\"------------------\"}}', '{\"BIF\":\"BIF\",\"CAD\":\"CAD\",\"CDF\":\"CDF\",\"CVE\":\"CVE\",\"EUR\":\"EUR\",\"GBP\":\"GBP\",\"GHS\":\"GHS\",\"GMD\":\"GMD\",\"GNF\":\"GNF\",\"KES\":\"KES\",\"LRD\":\"LRD\",\"MWK\":\"MWK\",\"MZN\":\"MZN\",\"NGN\":\"NGN\",\"RWF\":\"RWF\",\"SLL\":\"SLL\",\"STD\":\"STD\",\"TZS\":\"TZS\",\"UGX\":\"UGX\",\"USD\":\"USD\",\"XAF\":\"XAF\",\"XOF\":\"XOF\",\"ZMK\":\"ZMK\",\"ZMW\":\"ZMW\",\"ZWD\":\"ZWD\"}', 0, NULL, NULL, '2019-09-14 13:14:22', '2021-06-05 11:37:45'),
(10, 0, 110, 'RazorPay', 'Razorpay', '663a393a527831715091770.png', 1, '{\"key_id\":{\"title\":\"Key Id\",\"global\":true,\"value\":\"rzp_test_kiOtejPbRZU90E\"},\"key_secret\":{\"title\":\"Key Secret \",\"global\":true,\"value\":\"osRDebzEqbsE1kbyQJ4y0re7\"}}', '{\"INR\":\"INR\"}', 0, NULL, NULL, '2019-09-14 13:14:22', '2021-05-21 02:51:32'),
(11, 0, 111, 'Stripe Storefront', 'StripeJs', '663a3995417171715091861.png', 1, '{\"secret_key\":{\"title\":\"Secret Key\",\"global\":true,\"value\":\"sk_test_51I6GGiCGv1sRiQlEi5v1or9eR0HVbuzdMd2rW4n3DxC8UKfz66R4X6n4yYkzvI2LeAIuRU9H99ZpY7XCNFC9xMs500vBjZGkKG\"},\"publishable_key\":{\"title\":\"PUBLISHABLE KEY\",\"global\":true,\"value\":\"pk_test_51I6GGiCGv1sRiQlEOisPKrjBqQqqcFsw8mXNaZ2H2baN6R01NulFS7dKFji1NRRxuchoUTEDdB7ujKcyKYSVc0z500eth7otOM\"}}', '{\"USD\":\"USD\",\"AUD\":\"AUD\",\"BRL\":\"BRL\",\"CAD\":\"CAD\",\"CHF\":\"CHF\",\"DKK\":\"DKK\",\"EUR\":\"EUR\",\"GBP\":\"GBP\",\"HKD\":\"HKD\",\"INR\":\"INR\",\"JPY\":\"JPY\",\"MXN\":\"MXN\",\"MYR\":\"MYR\",\"NOK\":\"NOK\",\"NZD\":\"NZD\",\"PLN\":\"PLN\",\"SEK\":\"SEK\",\"SGD\":\"SGD\"}', 0, NULL, NULL, '2019-09-14 13:14:22', '2021-05-21 00:53:10'),
(12, 0, 112, 'Instamojo', 'Instamojo', '663a384d54a111715091533.png', 1, '{\"api_key\":{\"title\":\"API KEY\",\"global\":true,\"value\":\"test_2241633c3bc44a3de84a3b33969\"},\"auth_token\":{\"title\":\"Auth Token\",\"global\":true,\"value\":\"test_279f083f7bebefd35217feef22d\"},\"salt\":{\"title\":\"Salt\",\"global\":true,\"value\":\"19d38908eeff4f58b2ddda2c6d86ca25\"}}', '{\"INR\":\"INR\"}', 0, NULL, NULL, '2019-09-14 13:14:22', '2021-05-21 02:56:20'),
(13, 0, 501, 'Blockchain', 'Blockchain', '663a35efd0c311715090927.png', 1, '{\"api_key\":{\"title\":\"API Key\",\"global\":true,\"value\":\"55529946-05ca-48ff-8710-f279d86b1cc5\"},\"xpub_code\":{\"title\":\"XPUB CODE\",\"global\":true,\"value\":\"xpub6CKQ3xxWyBoFAF83izZCSFUorptEU9AF8TezhtWeMU5oefjX3sFSBw62Lr9iHXPkXmDQJJiHZeTRtD9Vzt8grAYRhvbz4nEvBu3QKELVzFK\"}}', '{\"BTC\":\"BTC\"}', 1, NULL, NULL, '2019-09-14 13:14:22', '2022-03-21 07:41:56'),
(15, 0, 503, 'CoinPayments', 'Coinpayments', '663a36a8d8e1d1715091112.png', 1, '{\"public_key\":{\"title\":\"Public Key\",\"global\":true,\"value\":\"----------------------------------\"},\"private_key\":{\"title\":\"Private Key\",\"global\":true,\"value\":\"----------------------------------------\"},\"merchant_id\":{\"title\":\"Merchant ID\",\"global\":true,\"value\":\"--------------------------\"}}', '{\"BTC\":\"Bitcoin\",\"BTC.LN\":\"Bitcoin (Lightning Network)\",\"LTC\":\"Litecoin\",\"CPS\":\"CPS Coin\",\"VLX\":\"Velas\",\"APL\":\"Apollo\",\"AYA\":\"Aryacoin\",\"BAD\":\"Badcoin\",\"BCD\":\"Bitcoin Diamond\",\"BCH\":\"Bitcoin Cash\",\"BCN\":\"Bytecoin\",\"BEAM\":\"BEAM\",\"BITB\":\"Bean Cash\",\"BLK\":\"BlackCoin\",\"BSV\":\"Bitcoin SV\",\"BTAD\":\"Bitcoin Adult\",\"BTG\":\"Bitcoin Gold\",\"BTT\":\"BitTorrent\",\"CLOAK\":\"CloakCoin\",\"CLUB\":\"ClubCoin\",\"CRW\":\"Crown\",\"CRYP\":\"CrypticCoin\",\"CRYT\":\"CryTrExCoin\",\"CURE\":\"CureCoin\",\"DASH\":\"DASH\",\"DCR\":\"Decred\",\"DEV\":\"DeviantCoin\",\"DGB\":\"DigiByte\",\"DOGE\":\"Dogecoin\",\"EBST\":\"eBoost\",\"EOS\":\"EOS\",\"ETC\":\"Ether Classic\",\"ETH\":\"Ethereum\",\"ETN\":\"Electroneum\",\"EUNO\":\"EUNO\",\"EXP\":\"EXP\",\"Expanse\":\"Expanse\",\"FLASH\":\"FLASH\",\"GAME\":\"GameCredits\",\"GLC\":\"Goldcoin\",\"GRS\":\"Groestlcoin\",\"KMD\":\"Komodo\",\"LOKI\":\"LOKI\",\"LSK\":\"LSK\",\"MAID\":\"MaidSafeCoin\",\"MUE\":\"MonetaryUnit\",\"NAV\":\"NAV Coin\",\"NEO\":\"NEO\",\"NMC\":\"Namecoin\",\"NVST\":\"NVO Token\",\"NXT\":\"NXT\",\"OMNI\":\"OMNI\",\"PINK\":\"PinkCoin\",\"PIVX\":\"PIVX\",\"POT\":\"PotCoin\",\"PPC\":\"Peercoin\",\"PROC\":\"ProCurrency\",\"PURA\":\"PURA\",\"QTUM\":\"QTUM\",\"RES\":\"Resistance\",\"RVN\":\"Ravencoin\",\"RVR\":\"RevolutionVR\",\"SBD\":\"Steem Dollars\",\"SMART\":\"SmartCash\",\"SOXAX\":\"SOXAX\",\"STEEM\":\"STEEM\",\"STRAT\":\"STRAT\",\"SYS\":\"Syscoin\",\"TPAY\":\"TokenPay\",\"TRIGGERS\":\"Triggers\",\"TRX\":\" TRON\",\"UBQ\":\"Ubiq\",\"UNIT\":\"UniversalCurrency\",\"USDT.TRC20\":\"Tether USD (Omni Layer)\",\"VTC\":\"Vertcoin\",\"WAVES\":\"Waves\",\"XCP\":\"Counterparty\",\"XEM\":\"NEM\",\"XMR\":\"Monero\",\"XSN\":\"Stakenet\",\"XSR\":\"SucreCoin\",\"XVG\":\"VERGE\",\"XZC\":\"ZCoin\",\"ZEC\":\"ZCash\",\"ZEN\":\"Horizen\"}', 1, NULL, NULL, '2019-09-14 13:14:22', '2022-05-08 08:15:32'),
(16, 0, 504, 'CoinPayments Fiat', 'CoinpaymentsFiat', '663a36b7b841a1715091127.png', 1, '{\"merchant_id\":{\"title\":\"Merchant ID\",\"global\":true,\"value\":\"6515561\"}}', '{\"USD\":\"USD\",\"AUD\":\"AUD\",\"BRL\":\"BRL\",\"CAD\":\"CAD\",\"CHF\":\"CHF\",\"CLP\":\"CLP\",\"CNY\":\"CNY\",\"DKK\":\"DKK\",\"EUR\":\"EUR\",\"GBP\":\"GBP\",\"HKD\":\"HKD\",\"INR\":\"INR\",\"ISK\":\"ISK\",\"JPY\":\"JPY\",\"KRW\":\"KRW\",\"NZD\":\"NZD\",\"PLN\":\"PLN\",\"RUB\":\"RUB\",\"SEK\":\"SEK\",\"SGD\":\"SGD\",\"THB\":\"THB\",\"TWD\":\"TWD\"}', 0, NULL, NULL, '2019-09-14 13:14:22', '2021-05-21 02:07:44'),
(17, 0, 505, 'Coingate', 'Coingate', '663a368e753381715091086.png', 1, '{\"api_key\":{\"title\":\"API Key\",\"global\":true,\"value\":\"6354mwVCEw5kHzRJ6thbGo-N\"}}', '{\"USD\":\"USD\",\"EUR\":\"EUR\"}', 0, NULL, NULL, '2019-09-14 13:14:22', '2022-03-30 09:24:57'),
(18, 0, 506, 'Coinbase Commerce', 'CoinbaseCommerce', '663a367e46ae51715091070.png', 1, '{\"api_key\":{\"title\":\"API Key\",\"global\":true,\"value\":\"c47cd7df-d8e8-424b-a20a\"},\"secret\":{\"title\":\"Webhook Shared Secret\",\"global\":true,\"value\":\"55871878-2c32-4f64-ab66\"}}', '{\"USD\":\"USD\",\"EUR\":\"EUR\",\"JPY\":\"JPY\",\"GBP\":\"GBP\",\"AUD\":\"AUD\",\"CAD\":\"CAD\",\"CHF\":\"CHF\",\"CNY\":\"CNY\",\"SEK\":\"SEK\",\"NZD\":\"NZD\",\"MXN\":\"MXN\",\"SGD\":\"SGD\",\"HKD\":\"HKD\",\"NOK\":\"NOK\",\"KRW\":\"KRW\",\"TRY\":\"TRY\",\"RUB\":\"RUB\",\"INR\":\"INR\",\"BRL\":\"BRL\",\"ZAR\":\"ZAR\",\"AED\":\"AED\",\"AFN\":\"AFN\",\"ALL\":\"ALL\",\"AMD\":\"AMD\",\"ANG\":\"ANG\",\"AOA\":\"AOA\",\"ARS\":\"ARS\",\"AWG\":\"AWG\",\"AZN\":\"AZN\",\"BAM\":\"BAM\",\"BBD\":\"BBD\",\"BDT\":\"BDT\",\"BGN\":\"BGN\",\"BHD\":\"BHD\",\"BIF\":\"BIF\",\"BMD\":\"BMD\",\"BND\":\"BND\",\"BOB\":\"BOB\",\"BSD\":\"BSD\",\"BTN\":\"BTN\",\"BWP\":\"BWP\",\"BYN\":\"BYN\",\"BZD\":\"BZD\",\"CDF\":\"CDF\",\"CLF\":\"CLF\",\"CLP\":\"CLP\",\"COP\":\"COP\",\"CRC\":\"CRC\",\"CUC\":\"CUC\",\"CUP\":\"CUP\",\"CVE\":\"CVE\",\"CZK\":\"CZK\",\"DJF\":\"DJF\",\"DKK\":\"DKK\",\"DOP\":\"DOP\",\"DZD\":\"DZD\",\"EGP\":\"EGP\",\"ERN\":\"ERN\",\"ETB\":\"ETB\",\"FJD\":\"FJD\",\"FKP\":\"FKP\",\"GEL\":\"GEL\",\"GGP\":\"GGP\",\"GHS\":\"GHS\",\"GIP\":\"GIP\",\"GMD\":\"GMD\",\"GNF\":\"GNF\",\"GTQ\":\"GTQ\",\"GYD\":\"GYD\",\"HNL\":\"HNL\",\"HRK\":\"HRK\",\"HTG\":\"HTG\",\"HUF\":\"HUF\",\"IDR\":\"IDR\",\"ILS\":\"ILS\",\"IMP\":\"IMP\",\"IQD\":\"IQD\",\"IRR\":\"IRR\",\"ISK\":\"ISK\",\"JEP\":\"JEP\",\"JMD\":\"JMD\",\"JOD\":\"JOD\",\"KES\":\"KES\",\"KGS\":\"KGS\",\"KHR\":\"KHR\",\"KMF\":\"KMF\",\"KPW\":\"KPW\",\"KWD\":\"KWD\",\"KYD\":\"KYD\",\"KZT\":\"KZT\",\"LAK\":\"LAK\",\"LBP\":\"LBP\",\"LKR\":\"LKR\",\"LRD\":\"LRD\",\"LSL\":\"LSL\",\"LYD\":\"LYD\",\"MAD\":\"MAD\",\"MDL\":\"MDL\",\"MGA\":\"MGA\",\"MKD\":\"MKD\",\"MMK\":\"MMK\",\"MNT\":\"MNT\",\"MOP\":\"MOP\",\"MRO\":\"MRO\",\"MUR\":\"MUR\",\"MVR\":\"MVR\",\"MWK\":\"MWK\",\"MYR\":\"MYR\",\"MZN\":\"MZN\",\"NAD\":\"NAD\",\"NGN\":\"NGN\",\"NIO\":\"NIO\",\"NPR\":\"NPR\",\"OMR\":\"OMR\",\"PAB\":\"PAB\",\"PEN\":\"PEN\",\"PGK\":\"PGK\",\"PHP\":\"PHP\",\"PKR\":\"PKR\",\"PLN\":\"PLN\",\"PYG\":\"PYG\",\"QAR\":\"QAR\",\"RON\":\"RON\",\"RSD\":\"RSD\",\"RWF\":\"RWF\",\"SAR\":\"SAR\",\"SBD\":\"SBD\",\"SCR\":\"SCR\",\"SDG\":\"SDG\",\"SHP\":\"SHP\",\"SLL\":\"SLL\",\"SOS\":\"SOS\",\"SRD\":\"SRD\",\"SSP\":\"SSP\",\"STD\":\"STD\",\"SVC\":\"SVC\",\"SYP\":\"SYP\",\"SZL\":\"SZL\",\"THB\":\"THB\",\"TJS\":\"TJS\",\"TMT\":\"TMT\",\"TND\":\"TND\",\"TOP\":\"TOP\",\"TTD\":\"TTD\",\"TWD\":\"TWD\",\"TZS\":\"TZS\",\"UAH\":\"UAH\",\"UGX\":\"UGX\",\"UYU\":\"UYU\",\"UZS\":\"UZS\",\"VEF\":\"VEF\",\"VND\":\"VND\",\"VUV\":\"VUV\",\"WST\":\"WST\",\"XAF\":\"XAF\",\"XAG\":\"XAG\",\"XAU\":\"XAU\",\"XCD\":\"XCD\",\"XDR\":\"XDR\",\"XOF\":\"XOF\",\"XPD\":\"XPD\",\"XPF\":\"XPF\",\"XPT\":\"XPT\",\"YER\":\"YER\",\"ZMW\":\"ZMW\",\"ZWL\":\"ZWL\"}\r\n\r\n', 0, '{\"endpoint\":{\"title\": \"Webhook Endpoint\",\"value\":\"ipn.CoinbaseCommerce\"}}', NULL, '2019-09-14 13:14:22', '2021-05-21 02:02:47'),
(24, 0, 113, 'Paypal Express', 'PaypalSdk', '663a38ed101a61715091693.png', 1, '{\"clientId\":{\"title\":\"Paypal Client ID\",\"global\":true,\"value\":\"Ae0-tixtSV7DvLwIh3Bmu7JvHrjh5EfGdXr_cEklKAVjjezRZ747BxKILiBdzlKKyp-W8W_T7CKH1Ken\"},\"clientSecret\":{\"title\":\"Client Secret\",\"global\":true,\"value\":\"EOhbvHZgFNO21soQJT1L9Q00M3rK6PIEsdiTgXRBt2gtGtxwRer5JvKnVUGNU5oE63fFnjnYY7hq3HBA\"}}', '{\"AUD\":\"AUD\",\"BRL\":\"BRL\",\"CAD\":\"CAD\",\"CZK\":\"CZK\",\"DKK\":\"DKK\",\"EUR\":\"EUR\",\"HKD\":\"HKD\",\"HUF\":\"HUF\",\"INR\":\"INR\",\"ILS\":\"ILS\",\"JPY\":\"JPY\",\"MYR\":\"MYR\",\"MXN\":\"MXN\",\"TWD\":\"TWD\",\"NZD\":\"NZD\",\"NOK\":\"NOK\",\"PHP\":\"PHP\",\"PLN\":\"PLN\",\"GBP\":\"GBP\",\"RUB\":\"RUB\",\"SGD\":\"SGD\",\"SEK\":\"SEK\",\"CHF\":\"CHF\",\"THB\":\"THB\",\"USD\":\"$\"}', 0, NULL, NULL, '2019-09-14 13:14:22', '2021-05-20 23:01:08'),
(25, 0, 114, 'Stripe Checkout', 'StripeV3', '663a39afb519f1715091887.png', 1, '{\"secret_key\":{\"title\":\"Secret Key\",\"global\":true,\"value\":\"sk_test_51I6GGiCGv1sRiQlEi5v1or9eR0HVbuzdMd2rW4n3DxC8UKfz66R4X6n4yYkzvI2LeAIuRU9H99ZpY7XCNFC9xMs500vBjZGkKG\"},\"publishable_key\":{\"title\":\"PUBLISHABLE KEY\",\"global\":true,\"value\":\"pk_test_51I6GGiCGv1sRiQlEOisPKrjBqQqqcFsw8mXNaZ2H2baN6R01NulFS7dKFji1NRRxuchoUTEDdB7ujKcyKYSVc0z500eth7otOM\"},\"end_point\":{\"title\":\"End Point Secret\",\"global\":true,\"value\":\"whsec_lUmit1gtxwKTveLnSe88xCSDdnPOt8g5\"}}', '{\"USD\":\"USD\",\"AUD\":\"AUD\",\"BRL\":\"BRL\",\"CAD\":\"CAD\",\"CHF\":\"CHF\",\"DKK\":\"DKK\",\"EUR\":\"EUR\",\"GBP\":\"GBP\",\"HKD\":\"HKD\",\"INR\":\"INR\",\"JPY\":\"JPY\",\"MXN\":\"MXN\",\"MYR\":\"MYR\",\"NOK\":\"NOK\",\"NZD\":\"NZD\",\"PLN\":\"PLN\",\"SEK\":\"SEK\",\"SGD\":\"SGD\"}', 0, '{\"webhook\":{\"title\": \"Webhook Endpoint\",\"value\":\"ipn.StripeV3\"}}', NULL, '2019-09-14 13:14:22', '2021-05-21 00:58:38'),
(27, 0, 115, 'Mollie', 'Mollie', '663a387ec69371715091582.png', 1, '{\"mollie_email\":{\"title\":\"Mollie Email \",\"global\":true,\"value\":\"vi@gmail.com\"},\"api_key\":{\"title\":\"API KEY\",\"global\":true,\"value\":\"test_cucfwKTWfft9s337qsVfn5CC4vNkrn\"}}', '{\"AED\":\"AED\",\"AUD\":\"AUD\",\"BGN\":\"BGN\",\"BRL\":\"BRL\",\"CAD\":\"CAD\",\"CHF\":\"CHF\",\"CZK\":\"CZK\",\"DKK\":\"DKK\",\"EUR\":\"EUR\",\"GBP\":\"GBP\",\"HKD\":\"HKD\",\"HRK\":\"HRK\",\"HUF\":\"HUF\",\"ILS\":\"ILS\",\"ISK\":\"ISK\",\"JPY\":\"JPY\",\"MXN\":\"MXN\",\"MYR\":\"MYR\",\"NOK\":\"NOK\",\"NZD\":\"NZD\",\"PHP\":\"PHP\",\"PLN\":\"PLN\",\"RON\":\"RON\",\"RUB\":\"RUB\",\"SEK\":\"SEK\",\"SGD\":\"SGD\",\"THB\":\"THB\",\"TWD\":\"TWD\",\"USD\":\"USD\",\"ZAR\":\"ZAR\"}', 0, NULL, NULL, '2019-09-14 13:14:22', '2021-05-21 02:44:45'),
(30, 0, 116, 'Cashmaal', 'Cashmaal', '663a361b16bd11715090971.png', 1, '{\"web_id\":{\"title\":\"Web Id\",\"global\":true,\"value\":\"3748\"},\"ipn_key\":{\"title\":\"IPN Key\",\"global\":true,\"value\":\"546254628759524554647987\"}}', '{\"PKR\":\"PKR\",\"USD\":\"USD\"}', 0, '{\"webhook\":{\"title\": \"IPN URL\",\"value\":\"ipn.Cashmaal\"}}', NULL, NULL, '2021-06-22 08:05:04'),
(36, 0, 119, 'Mercado Pago', 'MercadoPago', '663a386c714a91715091564.png', 1, '{\"access_token\":{\"title\":\"Access Token\",\"global\":true,\"value\":\"3Vee5S2F\"}}', '{\"USD\":\"USD\",\"CAD\":\"CAD\",\"CHF\":\"CHF\",\"DKK\":\"DKK\",\"EUR\":\"EUR\",\"GBP\":\"GBP\",\"NOK\":\"NOK\",\"PLN\":\"PLN\",\"SEK\":\"SEK\",\"AUD\":\"AUD\",\"NZD\":\"NZD\"}', 0, NULL, NULL, NULL, '2021-07-17 09:44:29'),
(47, 0, 120, 'Authorize.net', 'Authorize', '663a35b9ca5991715090873.png', 1, '{\"login_id\":{\"title\":\"Login ID\",\"global\":true,\"value\":\"3Vee5S2F\"},\"transaction_key\":{\"title\":\"Transaction Key\",\"global\":true,\"value\":\"3Vee5S2F\"}}', '{\"USD\":\"USD\",\"CAD\":\"CAD\",\"CHF\":\"CHF\",\"DKK\":\"DKK\",\"EUR\":\"EUR\",\"GBP\":\"GBP\",\"NOK\":\"NOK\",\"PLN\":\"PLN\",\"SEK\":\"SEK\",\"AUD\":\"AUD\",\"NZD\":\"NZD\"}', 0, NULL, NULL, NULL, '2021-07-17 19:44:29'),
(48, 0, 121, 'NMI', 'NMI', '663a3897754cf1715091607.png', 1, '{\"api_key\":{\"title\":\"API Key\",\"global\":true,\"value\":\"-------\"}}', '{\"AED\":\"AED\",\"ARS\":\"ARS\",\"AUD\":\"AUD\",\"BOB\":\"BOB\",\"BRL\":\"BRL\",\"CAD\":\"CAD\",\"CHF\":\"CHF\",\"CLP\":\"CLP\",\"CNY\":\"CNY\",\"COP\":\"COP\",\"DKK\":\"DKK\",\"EUR\":\"EUR\",\"GBP\":\"GBP\",\"HKD\":\"HKD\",\"IDR\":\"IDR\",\"ILS\":\"ILS\",\"INR\":\"INR\",\"JPY\":\"JPY\",\"KRW\":\"KRW\",\"MXN\":\"MXN\",\"MYR\":\"MYR\",\"NOK\":\"NOK\",\"NZD\":\"NZD\",\"PEN\":\"PEN\",\"PHP\":\"PHP\",\"PLN\":\"PLN\",\"PYG\":\"PYG\",\"RUB\":\"RUB\",\"SEC\":\"SEC\",\"SGD\":\"SGD\",\"THB\":\"THB\",\"TRY\":\"TRY\",\"TWD\":\"TWD\",\"USD\":\"USD\",\"ZAR\":\"ZAR\"}', 0, NULL, NULL, NULL, '2022-08-28 20:12:37'),
(57, 0, 510, 'BTCPay', 'BTCPay', '663a35cd25a8d1715090893.png', 1, '{\"store_id\":{\"title\":\"Store Id\",\"global\":true,\"value\":\"-------\"},\"api_key\":{\"title\":\"Api Key\",\"global\":true,\"value\":\"------\"},\"server_name\":{\"title\":\"Server Name\",\"global\":true,\"value\":\"https:\\/\\/yourbtcpaserver.lndyn.com\"},\"secret_code\":{\"title\":\"Secret Code\",\"global\":true,\"value\":\"----------\"}}', '{\"BTC\":\"Bitcoin\",\"LTC\":\"Litecoin\"}', 1, '{\"webhook\":{\"title\": \"IPN URL\",\"value\":\"ipn.BTCPay\"}}', NULL, NULL, NULL),
(58, 0, 511, 'Now payments hosted', 'NowPaymentsHosted', '663a38b8d57a81715091640.png', 1, '{\"api_key\":{\"title\":\"API Key\",\"global\":true,\"value\":\"-------------------\"},\"secret_key\":{\"title\":\"Secret Key\",\"global\":true,\"value\":\"--------------\"}}', '{\"BTG\":\"BTG\",\"ETH\":\"ETH\",\"XMR\":\"XMR\",\"ZEC\":\"ZEC\",\"XVG\":\"XVG\",\"ADA\":\"ADA\",\"LTC\":\"LTC\",\"BCH\":\"BCH\",\"QTUM\":\"QTUM\",\"DASH\":\"DASH\",\"XLM\":\"XLM\",\"XRP\":\"XRP\",\"XEM\":\"XEM\",\"DGB\":\"DGB\",\"LSK\":\"LSK\",\"DOGE\":\"DOGE\",\"TRX\":\"TRX\",\"KMD\":\"KMD\",\"REP\":\"REP\",\"BAT\":\"BAT\",\"ARK\":\"ARK\",\"WAVES\":\"WAVES\",\"BNB\":\"BNB\",\"XZC\":\"XZC\",\"NANO\":\"NANO\",\"TUSD\":\"TUSD\",\"VET\":\"VET\",\"ZEN\":\"ZEN\",\"GRS\":\"GRS\",\"FUN\":\"FUN\",\"NEO\":\"NEO\",\"GAS\":\"GAS\",\"PAX\":\"PAX\",\"USDC\":\"USDC\",\"ONT\":\"ONT\",\"XTZ\":\"XTZ\",\"LINK\":\"LINK\",\"RVN\":\"RVN\",\"BNBMAINNET\":\"BNBMAINNET\",\"ZIL\":\"ZIL\",\"BCD\":\"BCD\",\"USDT\":\"USDT\",\"USDTERC20\":\"USDTERC20\",\"CRO\":\"CRO\",\"DAI\":\"DAI\",\"HT\":\"HT\",\"WABI\":\"WABI\",\"BUSD\":\"BUSD\",\"ALGO\":\"ALGO\",\"USDTTRC20\":\"USDTTRC20\",\"GT\":\"GT\",\"STPT\":\"STPT\",\"AVA\":\"AVA\",\"SXP\":\"SXP\",\"UNI\":\"UNI\",\"OKB\":\"OKB\",\"BTC\":\"BTC\"}', 1, '', NULL, NULL, '2023-02-14 15:42:09'),
(59, 0, 509, 'Now payments checkout', 'NowPaymentsCheckout', '663a38a59d2541715091621.png', 1, '{\"api_key\":{\"title\":\"API Key\",\"global\":true,\"value\":\"-------------------\"},\"secret_key\":{\"title\":\"Secret Key\",\"global\":true,\"value\":\"--------------\"}}', '{\"USD\":\"USD\",\"EUR\":\"EUR\"}', 1, '', NULL, NULL, '2023-02-14 15:42:09'),
(60, 0, 122, '2Checkout', 'TwoCheckout', '663a39b8e64b91715091896.png', 1, '{\"merchant_code\": {\"title\": \"Merchant Code\",\"global\": true,\"value\": \"---------\"},\"secret_key\": {\"title\": \"Secret Key\",\"global\": true,\"value\": \"--------\"}}', '{\"AFN\": \"AFN\",\"ALL\": \"ALL\",\"DZD\": \"DZD\",\"ARS\": \"ARS\",\"AUD\": \"AUD\",\"AZN\": \"AZN\",\"BSD\": \"BSD\",\"BDT\": \"BDT\",\"BBD\": \"BBD\",\"BZD\": \"BZD\",\"BMD\": \"BMD\",\"BOB\": \"BOB\",\"BWP\": \"BWP\",\"BRL\": \"BRL\",\"GBP\": \"GBP\",\"BND\": \"BND\",\"BGN\": \"BGN\",\"CAD\": \"CAD\",\"CLP\": \"CLP\",\"CNY\": \"CNY\",\"COP\": \"COP\",\"CRC\": \"CRC\",\"HRK\": \"HRK\",\"CZK\": \"CZK\",\"DKK\": \"DKK\",\"DOP\": \"DOP\",\"XCD\": \"XCD\",\"EGP\": \"EGP\",\"EUR\": \"EUR\",\"FJD\": \"FJD\",\"GTQ\": \"GTQ\",\"HKD\": \"HKD\",\"HNL\": \"HNL\",\"HUF\": \"HUF\",\"INR\": \"INR\",\"IDR\": \"IDR\",\"ILS\": \"ILS\",\"JMD\": \"JMD\",\"JPY\": \"JPY\",\"KZT\": \"KZT\",\"KES\": \"KES\",\"LAK\": \"LAK\",\"MMK\": \"MMK\",\"LBP\": \"LBP\",\"LRD\": \"LRD\",\"MOP\": \"MOP\",\"MYR\": \"MYR\",\"MVR\": \"MVR\",\"MRO\": \"MRO\",\"MUR\": \"MUR\",\"MXN\": \"MXN\",\"MAD\": \"MAD\",\"NPR\": \"NPR\",\"TWD\": \"TWD\",\"NZD\": \"NZD\",\"NIO\": \"NIO\",\"NOK\": \"NOK\",\"PKR\": \"PKR\",\"PGK\": \"PGK\",\"PEN\": \"PEN\",\"PHP\": \"PHP\",\"PLN\": \"PLN\",\"QAR\": \"QAR\",\"RON\": \"RON\",\"RUB\": \"RUB\",\"WST\": \"WST\",\"SAR\": \"SAR\",\"SCR\": \"SCR\",\"SGD\": \"SGD\",\"SBD\": \"SBD\",\"ZAR\": \"ZAR\",\"KRW\": \"KRW\",\"LKR\": \"LKR\",\"SEK\": \"SEK\",\"CHF\": \"CHF\",\"SYP\": \"SYP\",\"THB\": \"THB\",\"TOP\": \"TOP\",\"TTD\": \"TTD\",\"TRY\": \"TRY\",\"UAH\": \"UAH\",\"AED\": \"AED\",\"USD\": \"USD\",\"VUV\": \"VUV\",\"VND\": \"VND\",\"XOF\": \"XOF\",\"YER\": \"YER\"}', 0, '{\"approved_url\":{\"title\": \"Approved URL\",\"value\":\"ipn.TwoCheckout\"}}', NULL, NULL, '2023-02-14 15:42:09'),
(61, 0, 123, 'Checkout', 'Checkout', '663a3628733351715090984.png', 1, '{\"secret_key\":{\"title\":\"Secret Key\",\"global\":true,\"value\":\"sk_f7f9a069-dcc5-45d8-aa72-e60f605c9514\"},\"public_key\":{\"title\":\"PUBLIC KEY\",\"global\":true,\"value\":\"pk_66e19b3f-a431-44ff-823f-d773d960f6b9\"},\"processing_channel_id\":{\"title\":\"PROCESSING CHANNEL\",\"global\":true,\"value\":\"---\"}}', '{\"USD\":\"USD\",\"EUR\":\"EUR\",\"GBP\":\"GBP\",\"HKD\":\"HKD\",\"AUD\":\"AUD\",\"CAN\":\"CAN\",\"CHF\":\"CHF\",\"SGD\":\"SGD\",\"JPY\":\"JPY\",\"NZD\":\"NZD\"}', 0, NULL, NULL, NULL, NULL),
(62, 0, 507, 'Binance', 'Binance', '663a35db4fd621715090907.png', 1, '{\"api_key\":{\"title\":\"API Key\",\"global\":true,\"value\":\"tsu3tjiq0oqfbtmlbevoeraxhfbp3brejnm9txhjxcp4to29ujvakvfl1ibsn3ja\"},\"secret_key\":{\"title\":\"Secret Key\",\"global\":true,\"value\":\"jzngq4t04ltw8d4iqpi7admfl8tvnpehxnmi34id1zvfaenbwwvsvw7llw3zdko8\"},\"merchant_id\":{\"title\":\"Merchant ID\",\"global\":true,\"value\":\"231129033\"}}', '{\"BTC\":\"Bitcoin\",\"USD\":\"USD\",\"BNB\":\"BNB\"}', 1, '{\"cron\":{\"title\": \"Cron Job URL\",\"value\":\"ipn.Binance\"}}', NULL, NULL, '2023-02-14 05:08:04'),
(63, 0, 124, 'SslCommerz', 'SslCommerz', '663a397a70c571715091834.png', 1, '{\"store_id\": {\"title\": \"Store ID\",\"global\": true,\"value\": \"---------\"},\"store_password\": {\"title\": \"Store Password\",\"global\": true,\"value\": \"----------\"}}', '{\"BDT\":\"BDT\",\"USD\":\"USD\",\"EUR\":\"EUR\",\"SGD\":\"SGD\",\"INR\":\"INR\",\"MYR\":\"MYR\"}', 0, NULL, NULL, NULL, '2023-05-06 07:43:01'),
(64, 0, 125, 'Aamarpay', 'Aamarpay', '663a34d5d1dfc1715090645.png', 1, '{\"store_id\": {\"title\": \"Store ID\",\"global\": true,\"value\": \"---------\"},\"signature_key\": {\"title\": \"Signature Key\",\"global\": true,\"value\": \"----------\"}}', '{\"BDT\":\"BDT\"}', 0, NULL, NULL, NULL, '2023-05-06 07:43:01');

-- --------------------------------------------------------

--
-- Table structure for table `gateway_currencies`
--

CREATE TABLE `gateway_currencies` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `currency` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `symbol` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `method_code` int DEFAULT NULL,
  `gateway_alias` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `min_amount` decimal(28,8) NOT NULL DEFAULT '0.00000000',
  `max_amount` decimal(28,8) NOT NULL DEFAULT '0.00000000',
  `percent_charge` decimal(5,2) NOT NULL DEFAULT '0.00',
  `fixed_charge` decimal(28,8) NOT NULL DEFAULT '0.00000000',
  `rate` decimal(28,8) NOT NULL DEFAULT '0.00000000',
  `gateway_parameter` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `general_settings`
--

CREATE TABLE `general_settings` (
  `id` bigint UNSIGNED NOT NULL,
  `site_name` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cur_text` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'currency text',
  `cur_sym` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'currency symbol',
  `email_from` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_from_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_template` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `sms_template` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sms_from` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `push_title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `push_template` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `base_color` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `secondary_color` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mail_config` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT 'email configuration',
  `sms_config` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `firebase_config` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `global_shortcodes` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `kv` tinyint(1) NOT NULL DEFAULT '0',
  `ev` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'email verification, 0 - dont check, 1 - check',
  `en` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'email notification, 0 - dont send, 1 - send',
  `sv` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'mobile verication, 0 - dont check, 1 - check',
  `sn` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'sms notification, 0 - dont send, 1 - send',
  `pn` tinyint(1) NOT NULL DEFAULT '1',
  `force_ssl` tinyint(1) NOT NULL DEFAULT '0',
  `maintenance_mode` tinyint(1) NOT NULL DEFAULT '0',
  `secure_password` tinyint(1) NOT NULL DEFAULT '0',
  `agree` tinyint(1) NOT NULL DEFAULT '0',
  `registration` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0: Off	, 1: On',
  `active_template` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deposit_commission` tinyint(1) NOT NULL DEFAULT '0',
  `plan_subscribe_commission` tinyint(1) NOT NULL DEFAULT '0',
  `ptc_view_commission` tinyint(1) NOT NULL DEFAULT '0',
  `available_version` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `system_customized` tinyint(1) NOT NULL DEFAULT '0',
  `paginate_number` int NOT NULL DEFAULT '0',
  `currency_format` tinyint(1) NOT NULL DEFAULT '0' COMMENT '1=>Both\r\n2=>Text Only\r\n3=>Symbol Only',
  `registration_bonus` decimal(28,8) NOT NULL DEFAULT '0.00000000',
  `bt_fixed` decimal(28,8) NOT NULL DEFAULT '0.00000000',
  `bt_percent` decimal(11,2) NOT NULL DEFAULT '0.00',
  `balance_transfer` tinyint(1) NOT NULL DEFAULT '0',
  `default_plan` int NOT NULL DEFAULT '0',
  `user_ads_post` tinyint(1) NOT NULL DEFAULT '0',
  `ad_auto_approve` tinyint(1) NOT NULL DEFAULT '0',
  `ads_setting` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `socialite_credentials` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `multi_language` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `general_settings`
--

INSERT INTO `general_settings` (`id`, `site_name`, `cur_text`, `cur_sym`, `email_from`, `email_from_name`, `email_template`, `sms_template`, `sms_from`, `push_title`, `push_template`, `base_color`, `secondary_color`, `mail_config`, `sms_config`, `firebase_config`, `global_shortcodes`, `kv`, `ev`, `en`, `sv`, `sn`, `pn`, `force_ssl`, `maintenance_mode`, `secure_password`, `agree`, `registration`, `active_template`, `deposit_commission`, `plan_subscribe_commission`, `ptc_view_commission`, `available_version`, `system_customized`, `paginate_number`, `currency_format`, `registration_bonus`, `bt_fixed`, `bt_percent`, `balance_transfer`, `default_plan`, `user_ads_post`, `ad_auto_approve`, `ads_setting`, `socialite_credentials`, `multi_language`, `created_at`, `updated_at`) VALUES
(1, 'PTCLab', 'USD', '$', 'no-reply@viserlab.com', '{{site_name}}', '<html>\n<meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\">\n<meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge\">\n<meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\n<title>\n</title>\n<style type=\"text/css\">\n	.ReadMsgBody {\n		width: 100%;\n		background-color: #ffffff;\n	}\n	.ExternalClass {\n		width: 100%;\n		background-color: #ffffff;\n	}\n	.ExternalClass,\n	.ExternalClass p,\n	.ExternalClass span,\n	.ExternalClass font,\n	.ExternalClass td,\n	.ExternalClass div {\n		line-height: 100%;\n	}\n	html {\n		width: 100%;\n	}\n	body {\n		-webkit-text-size-adjust: none;\n		-ms-text-size-adjust: none;\n		margin: 0;\n		padding: 0;\n	}\n	table {\n		border-spacing: 0;\n		table-layout: fixed;\n		margin: 0 auto;\n		border-collapse: collapse;\n	}\n	table table table {\n		table-layout: auto;\n	}\n	.yshortcuts a {\n		border-bottom: none !important;\n	}\n	img:hover {\n		opacity: 0.9 !important;\n	}\n	a {\n		color: #0087ff;\n		text-decoration: none;\n	}\n	.textbutton a {\n		font-family: \"open sans\", arial, sans-serif !important;\n	}\n	.btn-link a {\n		color: #ffffff !important;\n	}\n	@media only screen and (max-width: 480px) {\n		body {\n			width: auto !important;\n		}\n		*[class=\"table-inner\"] {\n			width: 90% !important;\n			text-align: center !important;\n		}\n		*[class=\"table-full\"] {\n			width: 100% !important;\n			text-align: center !important;\n		} /* image */\n		img[class=\"img1\"] {\n			width: 100% !important;\n			height: auto !important;\n		}\n	}\n\n</style>\n<table bgcolor=\"#030442\" width=\"100%\" border=\"0\" align=\"center\" cellpadding=\"0\" cellspacing=\"0\">\n	<tbody>\n		<tr>\n			<td height=\"50\">\n			</td>\n		</tr>\n		<tr>\n			<td align=\"center\" style=\"text-align:center;vertical-align:top;font-size:0;\">\n				<table align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\">\n					<tbody>\n						<tr>\n							<td align=\"center\" width=\"600\">\n								<table class=\"table-inner\" width=\"95%\" border=\"0\" align=\"center\" cellpadding=\"0\" cellspacing=\"0\">\n									<tbody>\n										<tr>\n											<td bgcolor=\"#0087ff\" style=\"border-top-left-radius:6px; border-top-right-radius:6px;text-align:center;vertical-align:top;font-size:0;\" align=\"center\">\n												<table width=\"90%\" border=\"0\" align=\"center\" cellpadding=\"0\" cellspacing=\"0\">\n													<tbody>\n														<tr>\n															<td height=\"20\">\n															</td>\n														</tr>\n														<tr>\n															<td align=\"center\" style=\"font-family: Open sans, Arial, sans-serif; color:#FFFFFF; font-size:16px; font-weight: bold;\">\n															This is a System Generated Email</td>\n														</tr>\n														<tr>\n															<td height=\"20\">\n															</td>\n														</tr>\n													</tbody>\n												</table>\n											</td>\n										</tr>\n									</tbody>\n								</table>\n								<table class=\"table-inner\" width=\"95%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\n									<tbody>\n										<tr>\n											<td bgcolor=\"#FFFFFF\" align=\"center\" style=\"text-align:center;vertical-align:top;font-size:0;\">\n												<table align=\"center\" width=\"90%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\n													<tbody>\n														<tr>\n															<td height=\"35\">\n															</td>\n														</tr>\n														<tr>\n															<td align=\"center\" style=\"vertical-align:top;font-size:0;\">\n																<a href=\"#\">\n																	<img style=\"display:block; line-height:0px; font-size:0px; border:0px; width: 240px;\" width=\"240px\" src=\"https://viserlab.com/assets/images/logoIcon/logo-dark.png\" alt=\"img\">\n																</a>\n															</td>\n														</tr>\n														<tr>\n															<td height=\"40\"></td>\n														</tr>\n														<tr>\n															<td align=\"center\" style=\"font-family: Open Sans, Arial, sans-serif; font-size: 22px;color:#414a51;font-weight: bold;\">\n															Hello {{fullname}} ({{username}}) </td>\n														</tr>\n														<tr>\n															<td align=\"center\" style=\"text-align:center;vertical-align:top;font-size:0;\">\n																<table width=\"40\" border=\"0\" align=\"center\" cellpadding=\"0\" cellspacing=\"0\">\n																	<tbody>\n																		<tr>\n																			<td height=\"20\" style=\" border-bottom:3px solid #0087ff;\">\n																			</td>\n																		</tr>\n																	</tbody>\n																</table>\n															</td>\n														</tr>\n														<tr>\n															<td height=\"30\"></td>\n														</tr>\n														<tr>\n															<td align=\"left\" style=\"font-family: Open sans, Arial, sans-serif; color:#7f8c8d; font-size:16px; line-height: 28px;\">\n															{{message}}</td>\n														</tr>\n														<tr>\n															<td height=\"60\"></td>\n														</tr>\n													</tbody>\n												</table>\n											</td>\n										</tr>\n										<tr>\n											<td height=\"45\" align=\"center\" bgcolor=\"#f4f4f4\" style=\"border-bottom-left-radius:6px;border-bottom-right-radius:6px;\">\n												<table align=\"center\" width=\"90%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\n													<tbody>\n														<tr>\n															<td height=\"10\"></td>\n														</tr>\n														<tr>\n															<td class=\"preference-link\" align=\"center\" style=\"font-family: Open sans, Arial, sans-serif; color:#95a5a6; font-size:14px;\">\n																© 2023 <a href=\"#\">{{site_name}}</a> &nbsp;. All Rights Reserved. </td>\n														</tr>\n														<tr>\n															<td height=\"10\"></td>\n														</tr>\n													</tbody>\n												</table>\n											</td>\n										</tr>\n									</tbody>\n								</table>\n							</td>\n						</tr>\n					</tbody>\n				</table>\n			</td>\n		</tr>\n		<tr>\n			<td height=\"60\"></td>\n		</tr>\n	</tbody>\n</table>\n</html>\n', 'hi {{fullname}} ({{username}}), {{message}}', 'ViserAdmin', '{{site_name}}', 'hi {{fullname}} ({{username}}), {{message}}', '0099ff', '001d4a', '{\"name\":\"php\"}', '{\"name\":\"infobip\",\"clickatell\":{\"api_key\":\"----------------\"},\"infobip\":{\"username\":\"----------------\",\"password\":\"-----------------\"},\"message_bird\":{\"api_key\":\"-------------------\"},\"nexmo\":{\"api_key\":\"----------------------\",\"api_secret\":\"----------------------\"},\"sms_broadcast\":{\"username\":\"----------------------\",\"password\":\"-----------------------------\"},\"twilio\":{\"account_sid\":\"-----------------------\",\"auth_token\":\"---------------------------\",\"from\":\"----------------------\"},\"text_magic\":{\"username\":\"-----------------------\",\"apiv2_key\":\"-------------------------------\"},\"custom\":{\"method\":\"get\",\"url\":\"https:\\/\\/hostname\\/demo-api-v1\",\"headers\":{\"name\":[\"api_key\"],\"value\":[\"test_api 555\"]},\"body\":{\"name\":[\"from_number\"],\"value\":[\"5657545757\"]}}}', '{\"apiKey\":\"----------\",\"authDomain\":\"---------\",\"projectId\":\"--------\",\"storageBucket\":\"-------\",\"messagingSenderId\":\"--------\",\"appId\":\"--------\",\"measurementId\":\"------\",\"serverKey\":\"--------\"}', '{\n    \"site_name\":\"Name of your site\",\n    \"site_currency\":\"Currency of your site\",\n    \"currency_symbol\":\"Symbol of currency\"\n}', 0, 1, 1, 1, 0, 1, 1, 0, 0, 1, 1, 'basic', 0, 0, 0, '4.0', 0, 20, 1, 0.50000000, 0.50000000, 3.50, 1, 1, 1, 0, '{\"ad_price\":{\"script\":\"1\",\"image\":\"516\",\"url\":\"17\",\"youtube\":\"299\"},\"amount_for_user\":{\"script\":\"2\",\"image\":\"46\",\"url\":\"77\",\"youtube\":\"89\"}}', '{\"google\":{\"client_id\":\"---------------\",\"client_secret\":\"---------------\",\"status\":1},\"facebook\":{\"client_id\":\"---------------\",\"client_secret\":\"---------------\",\"status\":1},\"linkedin\":{\"client_id\":\"-----------------\",\"client_secret\":\"---------------\",\"status\":1}}', 1, NULL, '2024-06-05 23:56:19');

-- --------------------------------------------------------

--
-- Table structure for table `languages`
--

CREATE TABLE `languages` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `code` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_default` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0: not default language, 1: default language',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `languages`
--

INSERT INTO `languages` (`id`, `name`, `code`, `image`, `is_default`, `created_at`, `updated_at`) VALUES
(1, 'English', 'en', '6518fefe68b471696136958.png', 1, '2020-07-06 03:47:55', '2023-10-01 09:09:18');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` bigint UNSIGNED NOT NULL,
  `migration` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `notification_logs`
--

CREATE TABLE `notification_logs` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` int UNSIGNED NOT NULL DEFAULT '0',
  `sender` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sent_from` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sent_to` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subject` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `message` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `notification_type` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_read` tinyint NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `notification_templates`
--

CREATE TABLE `notification_templates` (
  `id` bigint UNSIGNED NOT NULL,
  `act` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subject` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `push_title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_body` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `sms_body` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `push_body` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `shortcodes` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `email_status` tinyint(1) NOT NULL DEFAULT '1',
  `email_sent_from_name` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_sent_from_address` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sms_status` tinyint(1) NOT NULL DEFAULT '1',
  `sms_sent_from` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `push_status` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `notification_templates`
--

INSERT INTO `notification_templates` (`id`, `act`, `name`, `subject`, `push_title`, `email_body`, `sms_body`, `push_body`, `shortcodes`, `email_status`, `email_sent_from_name`, `email_sent_from_address`, `sms_status`, `sms_sent_from`, `push_status`, `created_at`, `updated_at`) VALUES
(1, 'BAL_ADD', 'Balance - Added', 'Your Account has been Credited', '{{site_name}} - Balance Added', '<div><div style=\"font-family: Montserrat, sans-serif;\">{{amount}} {{site_currency}} has been added to your account .</div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\">Transaction Number : {{trx}}</div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><span style=\"color: rgb(33, 37, 41); font-family: Montserrat, sans-serif;\">Your Current Balance is :&nbsp;</span><font style=\"font-family: Montserrat, sans-serif;\"><span style=\"font-weight: bolder;\">{{post_balance}}&nbsp; {{site_currency}}&nbsp;</span></font><br></div><div><font style=\"font-family: Montserrat, sans-serif;\"><span style=\"font-weight: bolder;\"><br></span></font></div><div>Admin note:&nbsp;<span style=\"color: rgb(33, 37, 41); font-size: 12px; font-weight: 600; white-space: nowrap; text-align: var(--bs-body-text-align);\">{{remark}}</span></div>', '{{amount}} {{site_currency}} credited in your account. Your Current Balance {{post_balance}} {{site_currency}} . Transaction: #{{trx}}. Admin note is \"{{remark}}\"', NULL, '{\"trx\":\"Transaction number for the action\",\"amount\":\"Amount inserted by the admin\",\"remark\":\"Remark inserted by the admin\",\"post_balance\":\"Balance of the user after this transaction\"}', 1, NULL, NULL, 0, NULL, 0, '2021-11-03 12:00:00', '2022-04-03 02:18:28'),
(2, 'BAL_SUB', 'Balance - Subtracted', 'Your Account has been Debited', '{{site_name}} - Balance Subtracted', '<div style=\"font-family: Montserrat, sans-serif;\">{{amount}} {{site_currency}} has been subtracted from your account .</div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\">Transaction Number : {{trx}}</div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><span style=\"color: rgb(33, 37, 41); font-family: Montserrat, sans-serif;\">Your Current Balance is :&nbsp;</span><font style=\"font-family: Montserrat, sans-serif;\"><span style=\"font-weight: bolder;\">{{post_balance}}&nbsp; {{site_currency}}</span></font><br><div><font style=\"font-family: Montserrat, sans-serif;\"><span style=\"font-weight: bolder;\"><br></span></font></div><div>Admin Note: {{remark}}</div>', '{{amount}} {{site_currency}} debited from your account. Your Current Balance {{post_balance}} {{site_currency}} . Transaction: #{{trx}}. Admin Note is {{remark}}', NULL, '{\"trx\":\"Transaction number for the action\",\"amount\":\"Amount inserted by the admin\",\"remark\":\"Remark inserted by the admin\",\"post_balance\":\"Balance of the user after this transaction\"}', 1, NULL, NULL, 1, NULL, 0, '2021-11-03 12:00:00', '2022-04-03 02:24:11'),
(3, 'DEPOSIT_COMPLETE', 'Deposit - Automated - Successful', 'Deposit Completed Successfully', '{{site_name}} - Deposit successful', '<div>Your deposit of&nbsp;<span style=\"font-weight: bolder;\">{{amount}} {{site_currency}}</span>&nbsp;is via&nbsp;&nbsp;<span style=\"font-weight: bolder;\">{{method_name}}&nbsp;</span>has been completed Successfully.<span style=\"font-weight: bolder;\"><br></span></div><div><span style=\"font-weight: bolder;\"><br></span></div><div><span style=\"font-weight: bolder;\">Details of your Deposit :<br></span></div><div><br></div><div>Amount : {{amount}} {{site_currency}}</div><div>Charge:&nbsp;<font color=\"#000000\">{{charge}} {{site_currency}}</font></div><div><br></div><div>Conversion Rate : 1 {{site_currency}} = {{rate}} {{method_currency}}</div><div>Received : {{method_amount}} {{method_currency}}<br></div><div>Paid via :&nbsp; {{method_name}}</div><div><br></div><div>Transaction Number : {{trx}}</div><div><font size=\"5\"><span style=\"font-weight: bolder;\"><br></span></font></div><div><font size=\"5\">Your current Balance is&nbsp;<span style=\"font-weight: bolder;\">{{post_balance}} {{site_currency}}</span></font></div><div><br style=\"font-family: Montserrat, sans-serif;\"></div>', '{{amount}} {{site_currency}} Deposit successfully by {{method_name}}', NULL, '{\"trx\":\"Transaction number for the deposit\",\"amount\":\"Amount inserted by the user\",\"charge\":\"Gateway charge set by the admin\",\"rate\":\"Conversion rate between base currency and method currency\",\"method_name\":\"Name of the deposit method\",\"method_currency\":\"Currency of the deposit method\",\"method_amount\":\"Amount after conversion between base currency and method currency\",\"post_balance\":\"Balance of the user after this transaction\"}', 1, NULL, NULL, 1, NULL, 0, '2021-11-03 12:00:00', '2022-04-03 02:25:43'),
(4, 'DEPOSIT_APPROVE', 'Deposit - Manual - Approved', 'Your Deposit is Approved', '{{site_name}} - Deposit Request Approved', '<div style=\"font-family: Montserrat, sans-serif;\">Your deposit request of&nbsp;<span style=\"font-weight: bolder;\">{{amount}} {{site_currency}}</span>&nbsp;is via&nbsp;&nbsp;<span style=\"font-weight: bolder;\">{{method_name}}&nbsp;</span>is Approved .<span style=\"font-weight: bolder;\"><br></span></div><div style=\"font-family: Montserrat, sans-serif;\"><span style=\"font-weight: bolder;\"><br></span></div><div style=\"font-family: Montserrat, sans-serif;\"><span style=\"font-weight: bolder;\">Details of your Deposit :<br></span></div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\">Amount : {{amount}} {{site_currency}}</div><div style=\"font-family: Montserrat, sans-serif;\">Charge:&nbsp;<font color=\"#FF0000\">{{charge}} {{site_currency}}</font></div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\">Conversion Rate : 1 {{site_currency}} = {{rate}} {{method_currency}}</div><div style=\"font-family: Montserrat, sans-serif;\">Received : {{method_amount}} {{method_currency}}<br></div><div style=\"font-family: Montserrat, sans-serif;\">Paid via :&nbsp; {{method_name}}</div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\">Transaction Number : {{trx}}</div><div style=\"font-family: Montserrat, sans-serif;\"><font size=\"5\"><span style=\"font-weight: bolder;\"><br></span></font></div><div style=\"font-family: Montserrat, sans-serif;\"><font size=\"5\">Your current Balance is&nbsp;<span style=\"font-weight: bolder;\">{{post_balance}} {{site_currency}}</span></font></div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\"><br></div>', 'Admin Approve Your {{amount}} {{site_currency}} payment request by {{method_name}} transaction : {{trx}}', NULL, '{\"trx\":\"Transaction number for the deposit\",\"amount\":\"Amount inserted by the user\",\"charge\":\"Gateway charge set by the admin\",\"rate\":\"Conversion rate between base currency and method currency\",\"method_name\":\"Name of the deposit method\",\"method_currency\":\"Currency of the deposit method\",\"method_amount\":\"Amount after conversion between base currency and method currency\",\"post_balance\":\"Balance of the user after this transaction\"}', 1, NULL, NULL, 1, NULL, 0, '2021-11-03 12:00:00', '2022-04-03 02:26:07'),
(5, 'DEPOSIT_REJECT', 'Deposit - Manual - Rejected', 'Your Deposit Request is Rejected', '{{site_name}} - Deposit Request Rejected', '<div style=\"font-family: Montserrat, sans-serif;\">Your deposit request of&nbsp;<span style=\"font-weight: bolder;\">{{amount}} {{site_currency}}</span>&nbsp;is via&nbsp;&nbsp;<span style=\"font-weight: bolder;\">{{method_name}} has been rejected</span>.<span style=\"font-weight: bolder;\"><br></span></div><div><br></div><div><br></div><div style=\"font-family: Montserrat, sans-serif;\">Conversion Rate : 1 {{site_currency}} = {{rate}} {{method_currency}}</div><div style=\"font-family: Montserrat, sans-serif;\">Received : {{method_amount}} {{method_currency}}<br></div><div style=\"font-family: Montserrat, sans-serif;\">Paid via :&nbsp; {{method_name}}</div><div style=\"font-family: Montserrat, sans-serif;\">Charge: {{charge}}</div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\">Transaction Number was : {{trx}}</div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\">if you have any queries, feel free to contact us.<br></div><br style=\"font-family: Montserrat, sans-serif;\"><div style=\"font-family: Montserrat, sans-serif;\"><br><br></div><span style=\"color: rgb(33, 37, 41); font-family: Montserrat, sans-serif;\">{{rejection_message}}</span><br>', 'Admin Rejected Your {{amount}} {{site_currency}} payment request by {{method_name}}\r\n\r\n{{rejection_message}}', NULL, '{\"trx\":\"Transaction number for the deposit\",\"amount\":\"Amount inserted by the user\",\"charge\":\"Gateway charge set by the admin\",\"rate\":\"Conversion rate between base currency and method currency\",\"method_name\":\"Name of the deposit method\",\"method_currency\":\"Currency of the deposit method\",\"method_amount\":\"Amount after conversion between base currency and method currency\",\"rejection_message\":\"Rejection message by the admin\"}', 1, NULL, NULL, 1, NULL, 0, '2021-11-03 12:00:00', '2022-04-05 03:45:27'),
(6, 'DEPOSIT_REQUEST', 'Deposit - Manual - Requested', 'Deposit Request Submitted Successfully', NULL, '<div>Your deposit request of&nbsp;<span style=\"font-weight: bolder;\">{{amount}} {{site_currency}}</span>&nbsp;is via&nbsp;&nbsp;<span style=\"font-weight: bolder;\">{{method_name}}&nbsp;</span>submitted successfully<span style=\"font-weight: bolder;\">&nbsp;.<br></span></div><div><span style=\"font-weight: bolder;\"><br></span></div><div><span style=\"font-weight: bolder;\">Details of your Deposit :<br></span></div><div><br></div><div>Amount : {{amount}} {{site_currency}}</div><div>Charge:&nbsp;<font color=\"#FF0000\">{{charge}} {{site_currency}}</font></div><div><br></div><div>Conversion Rate : 1 {{site_currency}} = {{rate}} {{method_currency}}</div><div>Payable : {{method_amount}} {{method_currency}}<br></div><div>Pay via :&nbsp; {{method_name}}</div><div><br></div><div>Transaction Number : {{trx}}</div><div><br></div><div><br style=\"font-family: Montserrat, sans-serif;\"></div>', '{{amount}} {{site_currency}} Deposit requested by {{method_name}}. Charge: {{charge}} . Trx: {{trx}}', NULL, '{\"trx\":\"Transaction number for the deposit\",\"amount\":\"Amount inserted by the user\",\"charge\":\"Gateway charge set by the admin\",\"rate\":\"Conversion rate between base currency and method currency\",\"method_name\":\"Name of the deposit method\",\"method_currency\":\"Currency of the deposit method\",\"method_amount\":\"Amount after conversion between base currency and method currency\"}', 1, NULL, NULL, 1, NULL, 0, '2021-11-03 12:00:00', '2022-04-03 02:29:19'),
(7, 'PASS_RESET_CODE', 'Password - Reset - Code', 'Password Reset', '{{site_name}} Password Reset Code', '<div style=\"font-family: Montserrat, sans-serif;\">We have received a request to reset the password for your account on&nbsp;<span style=\"font-weight: bolder;\">{{time}} .<br></span></div><div style=\"font-family: Montserrat, sans-serif;\">Requested From IP:&nbsp;<span style=\"font-weight: bolder;\">{{ip}}</span>&nbsp;using&nbsp;<span style=\"font-weight: bolder;\">{{browser}}</span>&nbsp;on&nbsp;<span style=\"font-weight: bolder;\">{{operating_system}}&nbsp;</span>.</div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><br style=\"font-family: Montserrat, sans-serif;\"><div style=\"font-family: Montserrat, sans-serif;\"><div>Your account recovery code is:&nbsp;&nbsp;&nbsp;<font size=\"6\"><span style=\"font-weight: bolder;\">{{code}}</span></font></div><div><br></div></div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\"><font size=\"4\" color=\"#CC0000\">If you do not wish to reset your password, please disregard this message.&nbsp;</font><br></div><div><font size=\"4\" color=\"#CC0000\"><br></font></div>', 'Your account recovery code is: {{code}}', NULL, '{\"code\":\"Verification code for password reset\",\"ip\":\"IP address of the user\",\"browser\":\"Browser of the user\",\"operating_system\":\"Operating system of the user\",\"time\":\"Time of the request\"}', 1, NULL, NULL, 0, NULL, 0, '2021-11-03 12:00:00', '2022-03-20 20:47:05'),
(8, 'PASS_RESET_DONE', 'Password - Reset - Confirmation', 'You have reset your password', NULL, '<p style=\"font-family: Montserrat, sans-serif;\">You have successfully reset your password.</p><p style=\"font-family: Montserrat, sans-serif;\">You changed from&nbsp; IP:&nbsp;<span style=\"font-weight: bolder;\">{{ip}}</span>&nbsp;using&nbsp;<span style=\"font-weight: bolder;\">{{browser}}</span>&nbsp;on&nbsp;<span style=\"font-weight: bolder;\">{{operating_system}}&nbsp;</span>&nbsp;on&nbsp;<span style=\"font-weight: bolder;\">{{time}}</span></p><p style=\"font-family: Montserrat, sans-serif;\"><span style=\"font-weight: bolder;\"><br></span></p><p style=\"font-family: Montserrat, sans-serif;\"><span style=\"font-weight: bolder;\"><font color=\"#ff0000\">If you did not change that, please contact us as soon as possible.</font></span></p>', 'Your password has been changed successfully', NULL, '{\"ip\":\"IP address of the user\",\"browser\":\"Browser of the user\",\"operating_system\":\"Operating system of the user\",\"time\":\"Time of the request\"}', 1, NULL, NULL, 1, NULL, 0, '2021-11-03 12:00:00', '2022-04-05 03:46:35'),
(9, 'ADMIN_SUPPORT_REPLY', 'Support - Reply', 'Reply Support Ticket', '{{site_name}} - Support Ticket Replied', '<div><p><span data-mce-style=\"font-size: 11pt;\" style=\"font-size: 11pt;\"><span style=\"font-weight: bolder;\">A member from our support team has replied to the following ticket:</span></span></p><p><span style=\"font-weight: bolder;\"><span data-mce-style=\"font-size: 11pt;\" style=\"font-size: 11pt;\"><span style=\"font-weight: bolder;\"><br></span></span></span></p><p><span style=\"font-weight: bolder;\">[Ticket#{{ticket_id}}] {{ticket_subject}}<br><br>Click here to reply:&nbsp; {{link}}</span></p><p>----------------------------------------------</p><p>Here is the reply :<br></p><p>{{reply}}<br></p></div><div><br style=\"font-family: Montserrat, sans-serif;\"></div>', 'Your Ticket#{{ticket_id}} :  {{ticket_subject}} has been replied.', NULL, '{\"ticket_id\":\"ID of the support ticket\",\"ticket_subject\":\"Subject  of the support ticket\",\"reply\":\"Reply made by the admin\",\"link\":\"URL to view the support ticket\"}', 1, NULL, NULL, 1, NULL, 0, '2021-11-03 12:00:00', '2022-03-20 20:47:51'),
(10, 'EVER_CODE', 'Verification - Email', 'Please verify your email address', NULL, '<br><div><div style=\"font-family: Montserrat, sans-serif;\">Thanks For joining us.<br></div><div style=\"font-family: Montserrat, sans-serif;\">Please use the below code to verify your email address.<br></div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\">Your email verification code is:<font size=\"6\"><span style=\"font-weight: bolder;\">&nbsp;{{code}}</span></font></div></div>', '---', NULL, '{\"code\":\"Email verification code\"}', 1, NULL, NULL, 0, NULL, 0, '2021-11-03 12:00:00', '2022-04-03 02:32:07'),
(11, 'SVER_CODE', 'Verification - SMS', 'Verify Your Mobile Number', NULL, '---', 'Your phone verification code is: {{code}}', NULL, '{\"code\":\"SMS Verification Code\"}', 0, NULL, NULL, 1, NULL, 0, '2021-11-03 12:00:00', '2022-03-20 19:24:37'),
(12, 'WITHDRAW_APPROVE', 'Withdraw - Approved', 'Withdraw Request has been Processed and your money is sent', '{{site_name}} - Withdrawal Request Approved', '<div style=\"font-family: Montserrat, sans-serif;\">Your withdraw request of&nbsp;<span style=\"font-weight: bolder;\">{{amount}} {{site_currency}}</span>&nbsp; via&nbsp;&nbsp;<span style=\"font-weight: bolder;\">{{method_name}}&nbsp;</span>has been Processed Successfully.<span style=\"font-weight: bolder;\"><br></span></div><div style=\"font-family: Montserrat, sans-serif;\"><span style=\"font-weight: bolder;\"><br></span></div><div style=\"font-family: Montserrat, sans-serif;\"><span style=\"font-weight: bolder;\">Details of your withdraw:<br></span></div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\">Amount : {{amount}} {{site_currency}}</div><div style=\"font-family: Montserrat, sans-serif;\">Charge:&nbsp;<font color=\"#FF0000\">{{charge}} {{site_currency}}</font></div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\">Conversion Rate : 1 {{site_currency}} = {{rate}} {{method_currency}}</div><div style=\"font-family: Montserrat, sans-serif;\">You will get: {{method_amount}} {{method_currency}}<br></div><div style=\"font-family: Montserrat, sans-serif;\">Via :&nbsp; {{method_name}}</div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\">Transaction Number : {{trx}}</div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\">-----</div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\"><font size=\"4\">Details of Processed Payment :</font></div><div style=\"font-family: Montserrat, sans-serif;\"><font size=\"4\"><span style=\"font-weight: bolder;\">{{admin_details}}</span></font></div>', 'Admin Approve Your {{amount}} {{site_currency}} withdraw request by {{method_name}}. Transaction {{trx}}', NULL, '{\"trx\":\"Transaction number for the withdraw\",\"amount\":\"Amount requested by the user\",\"charge\":\"Gateway charge set by the admin\",\"rate\":\"Conversion rate between base currency and method currency\",\"method_name\":\"Name of the withdraw method\",\"method_currency\":\"Currency of the withdraw method\",\"method_amount\":\"Amount after conversion between base currency and method currency\",\"admin_details\":\"Details provided by the admin\"}', 1, NULL, NULL, 1, NULL, 0, '2021-11-03 12:00:00', '2022-03-20 20:50:16'),
(13, 'WITHDRAW_REJECT', 'Withdraw - Rejected', 'Withdraw Request has been Rejected and your money is refunded to your account', '{{site_name}} - Withdrawal Request Rejected', '<div style=\"font-family: Montserrat, sans-serif;\">Your withdraw request of&nbsp;<span style=\"font-weight: bolder;\">{{amount}} {{site_currency}}</span>&nbsp; via&nbsp;&nbsp;<span style=\"font-weight: bolder;\">{{method_name}}&nbsp;</span>has been Rejected.<span style=\"font-weight: bolder;\"><br></span></div><div style=\"font-family: Montserrat, sans-serif;\"><span style=\"font-weight: bolder;\"><br></span></div><div style=\"font-family: Montserrat, sans-serif;\"><span style=\"font-weight: bolder;\">Details of your withdraw:<br></span></div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\">Amount : {{amount}} {{site_currency}}</div><div style=\"font-family: Montserrat, sans-serif;\">Charge:&nbsp;<font color=\"#FF0000\">{{charge}} {{site_currency}}</font></div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\">Conversion Rate : 1 {{site_currency}} = {{rate}} {{method_currency}}</div><div style=\"font-family: Montserrat, sans-serif;\">You should get: {{method_amount}} {{method_currency}}<br></div><div style=\"font-family: Montserrat, sans-serif;\">Via :&nbsp; {{method_name}}</div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\">Transaction Number : {{trx}}</div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\">----</div><div style=\"font-family: Montserrat, sans-serif;\"><font size=\"3\"><br></font></div><div style=\"font-family: Montserrat, sans-serif;\"><font size=\"3\">{{amount}} {{currency}} has been&nbsp;<span style=\"font-weight: bolder;\">refunded&nbsp;</span>to your account and your current Balance is&nbsp;<span style=\"font-weight: bolder;\">{{post_balance}}</span><span style=\"font-weight: bolder;\">&nbsp;{{site_currency}}</span></font></div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\">-----</div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\"><font size=\"4\">Details of Rejection :</font></div><div style=\"font-family: Montserrat, sans-serif;\"><font size=\"4\"><span style=\"font-weight: bolder;\">{{admin_details}}</span></font></div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\"><br><br><br><br><br></div><div></div><div></div>', 'Admin Rejected Your {{amount}} {{site_currency}} withdraw request. Your Main Balance {{post_balance}}  {{method_name}} , Transaction {{trx}}', NULL, '{\"trx\":\"Transaction number for the withdraw\",\"amount\":\"Amount requested by the user\",\"charge\":\"Gateway charge set by the admin\",\"rate\":\"Conversion rate between base currency and method currency\",\"method_name\":\"Name of the withdraw method\",\"method_currency\":\"Currency of the withdraw method\",\"method_amount\":\"Amount after conversion between base currency and method currency\",\"post_balance\":\"Balance of the user after fter this action\",\"admin_details\":\"Rejection message by the admin\"}', 1, NULL, NULL, 1, NULL, 0, '2021-11-03 12:00:00', '2022-03-20 20:57:46'),
(14, 'WITHDRAW_REQUEST', 'Withdraw - Requested', 'Withdraw Request Submitted Successfully', '{{site_name}} - Requested for withdrawal', '<div style=\"font-family: Montserrat, sans-serif;\">Your withdraw request of&nbsp;<span style=\"font-weight: bolder;\">{{amount}} {{site_currency}}</span>&nbsp; via&nbsp;&nbsp;<span style=\"font-weight: bolder;\">{{method_name}}&nbsp;</span>has been submitted Successfully.<span style=\"font-weight: bolder;\"><br></span></div><div style=\"font-family: Montserrat, sans-serif;\"><span style=\"font-weight: bolder;\"><br></span></div><div style=\"font-family: Montserrat, sans-serif;\"><span style=\"font-weight: bolder;\">Details of your withdraw:<br></span></div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\">Amount : {{amount}} {{site_currency}}</div><div style=\"font-family: Montserrat, sans-serif;\">Charge:&nbsp;<font color=\"#FF0000\">{{charge}} {{site_currency}}</font></div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\">Conversion Rate : 1 {{site_currency}} = {{rate}} {{method_currency}}</div><div style=\"font-family: Montserrat, sans-serif;\">You will get: {{method_amount}} {{method_currency}}<br></div><div style=\"font-family: Montserrat, sans-serif;\">Via :&nbsp; {{method_name}}</div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\">Transaction Number : {{trx}}</div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\"><font size=\"5\">Your current Balance is&nbsp;<span style=\"font-weight: bolder;\">{{post_balance}} {{site_currency}}</span></font></div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\"><br><br><br></div>', '{{amount}} {{site_currency}} withdraw requested by {{method_name}}. You will get {{method_amount}} {{method_currency}} Trx: {{trx}}', NULL, '{\"trx\":\"Transaction number for the withdraw\",\"amount\":\"Amount requested by the user\",\"charge\":\"Gateway charge set by the admin\",\"rate\":\"Conversion rate between base currency and method currency\",\"method_name\":\"Name of the withdraw method\",\"method_currency\":\"Currency of the withdraw method\",\"method_amount\":\"Amount after conversion between base currency and method currency\",\"post_balance\":\"Balance of the user after fter this transaction\"}', 1, NULL, NULL, 1, NULL, 0, '2021-11-03 12:00:00', '2022-03-21 04:39:03'),
(15, 'DEFAULT', 'Default Template', '{{subject}}', '{{subject}}', '{{message}}', '{{message}}', NULL, '{\"subject\":\"Subject\",\"message\":\"Message\"}', 1, NULL, NULL, 1, NULL, 0, '2019-09-14 13:14:22', '2021-11-04 09:38:55'),
(16, 'KYC_APPROVE', 'KYC Approved', 'KYC has been approved', '{{site_name}} - KYC Approved', NULL, NULL, NULL, '[]', 1, NULL, NULL, 1, NULL, 0, NULL, NULL),
(17, 'KYC_REJECT', 'KYC Rejected', 'KYC has been rejected', '{{site_name}} - KYC Rejected', NULL, NULL, NULL, '{\"reason\":\"Rejection Reason\"}', 1, NULL, NULL, 1, NULL, 0, NULL, NULL),
(19, 'BALANCE_TRANSFER', 'Balance Transfer', 'Balance Transfer', 'Balance Transfer', 'You\'ve sent {{amount}} {{site_currency}} to {{receiver}}. The transaction number was #{{trx}}. Your current balance is {{post_balance}} {{site_currency}}', 'You\'ve sent {{amount}} {{site_currency}} to {{receiver}}. The transaction number was #{{trx}}. Your current balance is {{post_balance}} {{site_currency}}', NULL, '{\"amount\":\"Amount\",\"trx\":\"Transaction Number\",\"charge\":\"Charge\",\"afterCharge\":\"After Charge\",\"post_balance\":\"Post Balance\",\"receiver\":\"Receiver\"}', 1, NULL, NULL, 1, NULL, 0, NULL, '2022-04-28 02:55:03'),
(20, 'BALANCE_RECEIVE', 'Balance Receive', 'Balance Receive', 'Balance Receive', 'You\'ve received {{amount}} {{site_currency}} from {{sender}}. The transaction number is #{{trx}}', 'You\'ve received {{amount}} {{site_currency}} from {{sender}}. The transaction number is #{{trx}}', NULL, '{\"amount\":\"Amount\",\"trx\":\"Transaction Number\",\"post_balance\":\"Post Balance\",\"sender\":\"Sender\"}', 1, NULL, NULL, 1, NULL, 0, NULL, '2022-04-28 02:53:33'),
(21, 'REFERRAL_COMMISSION', 'Referral Commission', 'Referral commission got successfully', 'Referral commission got successfully', 'You have got {{amount}} {{site_currency}} referral commission as {{level}} position for {{type}} of your referral. Your current balance is {{post_balance}} {{site_currency}} and the transaction number is {{trx}}', 'You have got {{amount}} {{currency_symbol}} referral commission as {{level}} position for {{type}} of your referral. Your current balance is {{post_balance}} {{currency_symbol}} and the transaction number is {{trx}}', NULL, '{\"amount\":\"Amount of commission\",\"post_balance\":\"Balance after commission\",\"trx\":\"Transaction number\",\"level\":\"Level of referral\",\"type\":\"Type of commission\"}', 0, NULL, NULL, 0, NULL, 0, NULL, '2022-04-28 03:02:43'),
(22, 'BUY_PLAN', 'Subscribed Plan', 'You\'ve subscribed successfully', 'You\'ve subscribed successfully', 'You\'ve subscribed to {{plan_name}} plan. The price {{amount}} {{currency}}. The transaction number is #{{trx}}. Your current is {{post_balance}} {{currency}}', 'You\'ve subscribed to {{plan_name}} plan. The price {{amount}} {{currency}}. The transaction number is #{{trx}}. Your current is {{post_balance}} {{currency}}', NULL, '{\"amount\":\"Price of the plan\",\"plan_name\":\"Name of plan\",\"trx\":\"Transaction number\",\"post_balance\":\"Balance after transactions\"}', 1, NULL, NULL, 1, NULL, 0, NULL, '2022-01-12 23:20:41'),
(23, 'PTC_APPROVE', 'PTC Approved', 'PTC Advertisement Approved', 'PTC Advertisement Approved', 'Your ad {{title}} has been approved successfully. There are {{quantity}} click is available for this ad. The duration was&nbsp; {{duration}} seconds', 'Your ad {{title}} has been approved successfully. There are {{quantity}} click is available for this ad. The duration was  {{duration}} seconds', NULL, '{\"title\":\"PTC title\",\"quantity\":\"PTC quantity\",\"duration\":\"PTC duration\"}', 1, NULL, NULL, 1, NULL, 0, NULL, '2022-05-09 04:10:03'),
(24, 'PTC_REJECT', 'PTC Rejected', 'PTC Advertisement Rejected', 'PTC Advertisement Rejected', 'Your ad {{title}} has been rejected. Your ad quantity was {{quantity}}. and duration was {{duration}} seconds. You\'ve got back {{back_amount}} {{site_currency}} after rejection. Your current balance is {{post_balance}} {{site_currencuy}}.The transaction number was {{trx}}', 'Your ad {{title}} has been rejected. Your ad quantity was {{quantity}}. and duration was {{duration}} seconds. You\'ve got back {{back_amount}} {{site_currency}} after rejection. Your current balance is {{post_balance}} {{site_currencuy}}.The transaction number was {{trx}}', NULL, '{\"title\":\"PTC title\",\"quantity\":\"PTC quantity\",\"duration\":\"PTC duration\",\"back_amount\":\"Backed amount after rejection\",\"trx\":\"Transaction number\",\"post_balance\":\"Balance after transaction\"}', 1, NULL, NULL, 1, NULL, 0, NULL, '2022-05-09 04:09:35');

-- --------------------------------------------------------

--
-- Table structure for table `pages`
--

CREATE TABLE `pages` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tempname` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'template name',
  `secs` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `seo_content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `is_default` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `pages`
--

INSERT INTO `pages` (`id`, `name`, `slug`, `tempname`, `secs`, `seo_content`, `is_default`, `created_at`, `updated_at`) VALUES
(1, 'HOME', '/', 'templates.basic.', '[\"about\",\"features\",\"counter\",\"plan\",\"testimonial\",\"faq\",\"blog\"]', NULL, 1, '2020-07-11 06:23:58', '2024-06-04 10:47:10'),
(4, 'Blog', 'blog', 'templates.basic.', NULL, NULL, 1, '2020-10-22 01:14:43', '2020-10-22 01:14:43'),
(5, 'Contact', 'contact', 'templates.basic.', NULL, NULL, 1, '2020-10-22 01:14:53', '2020-10-22 01:14:53'),
(19, 'About', 'about-us', 'templates.basic.', '[\"about\",\"features\",\"testimonial\",\"faq\",\"counter\"]', NULL, 0, '2022-05-08 03:18:46', '2024-06-04 10:57:18'),
(20, 'HOME', '/', 'templates.ptc_diamond.', '[\"brand\",\"about\",\"features\",\"faq\",\"plan\",\"counter\",\"testimonial\",\"blog\"]', NULL, 1, NULL, '2022-10-30 07:04:45'),
(21, 'Blog', 'blog', 'templates.ptc_diamond.', NULL, NULL, 1, NULL, NULL),
(22, 'Contact', 'contact', 'templates.ptc_diamond.', NULL, NULL, 1, NULL, NULL),
(23, 'About', 'about', 'templates.ptc_diamond.', '[\"about\",\"testimonial\",\"faq\"]', NULL, 0, '2022-10-20 06:38:45', '2022-10-22 07:27:58'),
(24, 'Plans', 'plans', 'templates.ptc_diamond.', '[\"faq\"]', NULL, 1, NULL, '2022-10-30 07:08:45'),
(25, 'Plans', 'plans', 'templates.basic.', '[\"counter\"]', NULL, 1, NULL, '2022-10-30 08:44:44'),
(26, 'HOME', '/', 'templates.ptc_planet.', '[\"how_works\",\"about\",\"features\",\"plan\",\"counter\",\"faq\",\"testimonial\",\"blog\"]', NULL, 1, '2020-07-11 10:23:58', '2022-04-23 12:01:20'),
(27, 'Blog', 'blog', 'templates.ptc_planet.', NULL, NULL, 1, NULL, NULL),
(28, 'Contact', 'contact', 'templates.ptc_planet.', NULL, NULL, 1, '2020-10-22 05:14:53', '2020-10-22 05:14:53'),
(29, 'Plans', 'plans', 'templates.ptc_planet.', '[\"faq\"]', NULL, 1, NULL, '2022-10-30 07:08:45'),
(30, 'HOME', '/', 'templates.ptc_prime.', '[\"brand\",\"about\",\"features\",\"plan\",\"counter\",\"testimonial\",\"blog\"]', NULL, 1, NULL, NULL),
(31, 'Contact', 'contact', 'templates.ptc_prime.', '[\"faq\"]', NULL, 1, NULL, NULL),
(32, 'Plans', 'plans', 'templates.ptc_prime.', '[\"faq\"]', NULL, 1, NULL, NULL),
(33, 'About', 'about', 'templates.ptc_prime.', '[\"about\",\"brand\",\"faq\"]', NULL, 0, NULL, NULL),
(34, 'Blog', 'blog', 'templates.ptc_prime.', NULL, NULL, 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `token` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `plans`
--

CREATE TABLE `plans` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `tagline` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `price` decimal(28,8) NOT NULL DEFAULT '0.00000000',
  `daily_limit` int NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `ref_level` int NOT NULL DEFAULT '0',
  `validity` int NOT NULL DEFAULT '0',
  `highlight` tinyint NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ptcs`
--

CREATE TABLE `ptcs` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` tinyint NOT NULL DEFAULT '0',
  `ads_type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '1 = link | 2 = image | 3 = script',
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ads_body` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `amount` decimal(28,8) NOT NULL DEFAULT '0.00000000',
  `duration` int NOT NULL DEFAULT '0',
  `max_show` int NOT NULL DEFAULT '0',
  `showed` int NOT NULL DEFAULT '0',
  `remain` int NOT NULL DEFAULT '0',
  `reject_reason` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `schedule` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '0 = inactive, 1 = active, 2 = pending, 3 = rejected',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ptc_engagements`
--

CREATE TABLE `ptc_engagements` (
  `id` bigint UNSIGNED NOT NULL,
  `ptc_id` int UNSIGNED NOT NULL DEFAULT '0',
  `click` datetime DEFAULT NULL,
  `confirm` datetime DEFAULT NULL,
  `duration` int NOT NULL DEFAULT '0',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ptc_reports`
--

CREATE TABLE `ptc_reports` (
  `id` bigint UNSIGNED NOT NULL,
  `ptc_id` int UNSIGNED NOT NULL DEFAULT '0',
  `user_id` int UNSIGNED NOT NULL DEFAULT '0',
  `ptc_report_type_id` int UNSIGNED NOT NULL DEFAULT '0',
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ptc_report_types`
--

CREATE TABLE `ptc_report_types` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ptc_views`
--

CREATE TABLE `ptc_views` (
  `id` bigint NOT NULL,
  `ptc_id` int DEFAULT '0',
  `user_id` int DEFAULT '0',
  `view_date` date DEFAULT NULL,
  `amount` decimal(28,8) DEFAULT '0.00000000',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `referrals`
--

CREATE TABLE `referrals` (
  `id` bigint UNSIGNED NOT NULL,
  `level` int NOT NULL,
  `percent` decimal(11,2) NOT NULL DEFAULT '0.00',
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `commission_type` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `support_attachments`
--

CREATE TABLE `support_attachments` (
  `id` bigint UNSIGNED NOT NULL,
  `support_message_id` int UNSIGNED NOT NULL DEFAULT '0',
  `attachment` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `support_messages`
--

CREATE TABLE `support_messages` (
  `id` bigint UNSIGNED NOT NULL,
  `support_ticket_id` int UNSIGNED NOT NULL DEFAULT '0',
  `admin_id` int UNSIGNED NOT NULL DEFAULT '0',
  `message` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `support_tickets`
--

CREATE TABLE `support_tickets` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` int DEFAULT '0',
  `name` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ticket` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subject` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0: Open, 1: Answered, 2: Replied, 3: Closed',
  `priority` tinyint(1) NOT NULL DEFAULT '0' COMMENT '1 = Low, 2 = medium, 3 = heigh',
  `last_reply` datetime DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--

CREATE TABLE `transactions` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` int UNSIGNED NOT NULL DEFAULT '0',
  `amount` decimal(28,8) NOT NULL DEFAULT '0.00000000',
  `charge` decimal(28,8) NOT NULL DEFAULT '0.00000000',
  `post_balance` decimal(28,8) NOT NULL DEFAULT '0.00000000',
  `trx_type` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `trx` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `details` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remark` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `update_logs`
--

CREATE TABLE `update_logs` (
  `id` bigint UNSIGNED NOT NULL,
  `version` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `update_log` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint UNSIGNED NOT NULL,
  `plan_id` int NOT NULL DEFAULT '0',
  `ref_by` int UNSIGNED NOT NULL DEFAULT '0',
  `daily_limit` int NOT NULL DEFAULT '0',
  `firstname` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lastname` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `username` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `country_code` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dial_code` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '0',
  `country_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `zip` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mobile` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `balance` decimal(28,8) NOT NULL DEFAULT '0.00000000',
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT 'contains full address',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '0: banned, 1: active',
  `kyc_data` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `kyc_rejection_reason` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `kv` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0: KYC Unverified, 2: KYC pending, 1: KYC verified',
  `ev` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0: email unverified, 1: email verified',
  `sv` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0: mobile unverified, 1: mobile verified',
  `profile_complete` tinyint(1) NOT NULL DEFAULT '0',
  `ver_code` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'stores verification code',
  `ver_code_send_at` datetime DEFAULT NULL COMMENT 'verification send time',
  `ts` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0: 2fa off, 1: 2fa on',
  `tv` tinyint(1) NOT NULL DEFAULT '1' COMMENT '0: 2fa unverified, 1: 2fa verified',
  `tsc` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ban_reason` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `expire_date` datetime DEFAULT NULL,
  `remember_token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `provider` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `provider_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user_logins`
--

CREATE TABLE `user_logins` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` int UNSIGNED NOT NULL DEFAULT '0',
  `user_ip` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country_code` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `longitude` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `latitude` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `browser` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `os` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `withdrawals`
--

CREATE TABLE `withdrawals` (
  `id` bigint UNSIGNED NOT NULL,
  `method_id` int UNSIGNED NOT NULL DEFAULT '0',
  `user_id` int UNSIGNED NOT NULL DEFAULT '0',
  `amount` decimal(28,8) NOT NULL DEFAULT '0.00000000',
  `currency` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `rate` decimal(28,8) NOT NULL DEFAULT '0.00000000',
  `charge` decimal(28,8) NOT NULL DEFAULT '0.00000000',
  `trx` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `final_amount` decimal(28,8) NOT NULL DEFAULT '0.00000000',
  `after_charge` decimal(28,8) NOT NULL DEFAULT '0.00000000',
  `withdraw_information` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '1=>success, 2=>pending, 3=>cancel,  ',
  `admin_feedback` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `withdraw_methods`
--

CREATE TABLE `withdraw_methods` (
  `id` bigint UNSIGNED NOT NULL,
  `form_id` int UNSIGNED NOT NULL DEFAULT '0',
  `name` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `min_limit` decimal(28,8) DEFAULT '0.00000000',
  `max_limit` decimal(28,8) NOT NULL DEFAULT '0.00000000',
  `fixed_charge` decimal(28,8) DEFAULT '0.00000000',
  `rate` decimal(28,8) DEFAULT '0.00000000',
  `percent_charge` decimal(5,2) DEFAULT NULL,
  `currency` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`,`username`);

--
-- Indexes for table `admin_notifications`
--
ALTER TABLE `admin_notifications`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `admin_password_resets`
--
ALTER TABLE `admin_password_resets`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `commission_logs`
--
ALTER TABLE `commission_logs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `deposits`
--
ALTER TABLE `deposits`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `device_tokens`
--
ALTER TABLE `device_tokens`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `extensions`
--
ALTER TABLE `extensions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `forms`
--
ALTER TABLE `forms`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `frontends`
--
ALTER TABLE `frontends`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `gateways`
--
ALTER TABLE `gateways`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `code` (`code`);

--
-- Indexes for table `gateway_currencies`
--
ALTER TABLE `gateway_currencies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `general_settings`
--
ALTER TABLE `general_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `languages`
--
ALTER TABLE `languages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notification_logs`
--
ALTER TABLE `notification_logs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notification_templates`
--
ALTER TABLE `notification_templates`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pages`
--
ALTER TABLE `pages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `plans`
--
ALTER TABLE `plans`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ptcs`
--
ALTER TABLE `ptcs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ptc_engagements`
--
ALTER TABLE `ptc_engagements`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ptc_reports`
--
ALTER TABLE `ptc_reports`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ptc_report_types`
--
ALTER TABLE `ptc_report_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ptc_views`
--
ALTER TABLE `ptc_views`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `referrals`
--
ALTER TABLE `referrals`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `support_attachments`
--
ALTER TABLE `support_attachments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `support_messages`
--
ALTER TABLE `support_messages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `support_tickets`
--
ALTER TABLE `support_tickets`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `update_logs`
--
ALTER TABLE `update_logs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`,`email`);

--
-- Indexes for table `user_logins`
--
ALTER TABLE `user_logins`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `withdrawals`
--
ALTER TABLE `withdrawals`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `withdraw_methods`
--
ALTER TABLE `withdraw_methods`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `admin_notifications`
--
ALTER TABLE `admin_notifications`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `admin_password_resets`
--
ALTER TABLE `admin_password_resets`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `commission_logs`
--
ALTER TABLE `commission_logs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `deposits`
--
ALTER TABLE `deposits`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `device_tokens`
--
ALTER TABLE `device_tokens`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `extensions`
--
ALTER TABLE `extensions`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `forms`
--
ALTER TABLE `forms`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `frontends`
--
ALTER TABLE `frontends`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=309;

--
-- AUTO_INCREMENT for table `gateways`
--
ALTER TABLE `gateways`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=65;

--
-- AUTO_INCREMENT for table `gateway_currencies`
--
ALTER TABLE `gateway_currencies`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `general_settings`
--
ALTER TABLE `general_settings`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `languages`
--
ALTER TABLE `languages`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `notification_logs`
--
ALTER TABLE `notification_logs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `notification_templates`
--
ALTER TABLE `notification_templates`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `pages`
--
ALTER TABLE `pages`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `plans`
--
ALTER TABLE `plans`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ptcs`
--
ALTER TABLE `ptcs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ptc_engagements`
--
ALTER TABLE `ptc_engagements`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ptc_reports`
--
ALTER TABLE `ptc_reports`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ptc_report_types`
--
ALTER TABLE `ptc_report_types`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ptc_views`
--
ALTER TABLE `ptc_views`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `referrals`
--
ALTER TABLE `referrals`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `support_attachments`
--
ALTER TABLE `support_attachments`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `support_messages`
--
ALTER TABLE `support_messages`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `support_tickets`
--
ALTER TABLE `support_tickets`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `transactions`
--
ALTER TABLE `transactions`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `update_logs`
--
ALTER TABLE `update_logs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user_logins`
--
ALTER TABLE `user_logins`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `withdrawals`
--
ALTER TABLE `withdrawals`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `withdraw_methods`
--
ALTER TABLE `withdraw_methods`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

DROP TABLE `cache`, `cache_locks`;
ALTER TABLE `ptcs` CHANGE `user_id` `user_id` INT NOT NULL DEFAULT '0';
UPDATE `general_settings` SET `ev` = '0' WHERE `general_settings`.`id` = 1;
UPDATE `general_settings` SET `sv` = '0' WHERE `general_settings`.`id` = 1;

