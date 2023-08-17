-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 06, 2023 at 09:22 AM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `update_geniuscart`
--

-- --------------------------------------------------------

--
-- Table structure for table `addons`
--

CREATE TABLE `addons` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `keyword` varchar(191) DEFAULT NULL,
  `type` varchar(191) DEFAULT NULL,
  `uninstall_files` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `email` varchar(191) NOT NULL,
  `phone` varchar(191) NOT NULL,
  `role_id` int(191) NOT NULL DEFAULT 0,
  `photo` varchar(191) DEFAULT NULL,
  `password` varchar(191) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `remember_token` varchar(100) DEFAULT NULL,
  `email_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `shop_name` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `name`, `email`, `phone`, `role_id`, `photo`, `password`, `status`, `remember_token`, `email_token`, `created_at`, `updated_at`, `shop_name`) VALUES
(1, 'Admin', 'admin@gmail.com', '01629552892', 0, '1556780563user.png', '$2y$10$bvMVG9qQG2H90HfR3Wj8aeyTTK4t1lypd1.1PgP/At8qdEDYThI3O', 1, 'oL63V64ZkIgPEe7PzYSxlez4NCQC8SQonoLg1eg4WyRMMzZ5bQv4Ivra5zJz', NULL, '2018-02-28 23:27:08', '2020-11-19 04:40:00', 'Genius Store');

-- --------------------------------------------------------

--
-- Table structure for table `admin_languages`
--

CREATE TABLE `admin_languages` (
  `id` int(191) NOT NULL,
  `is_default` tinyint(1) NOT NULL DEFAULT 0,
  `language` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `file` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `rtl` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `admin_languages`
--

INSERT INTO `admin_languages` (`id`, `is_default`, `language`, `file`, `name`, `rtl`) VALUES
(1, 1, 'English', '1567232745AoOcvCtY.json', '1567232745AoOcvCtY', 0),
(3, 0, 'عربى', '15970374764TGUNJJs.json', '15970374764TGUNJJs', 0);

-- --------------------------------------------------------

--
-- Table structure for table `admin_user_conversations`
--

CREATE TABLE `admin_user_conversations` (
  `id` int(191) NOT NULL,
  `subject` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(191) NOT NULL,
  `message` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `type` enum('Ticket','Dispute') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_number` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `admin_user_messages`
--

CREATE TABLE `admin_user_messages` (
  `id` int(191) NOT NULL,
  `conversation_id` int(191) NOT NULL,
  `message` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `arrival_sections`
--

CREATE TABLE `arrival_sections` (
  `id` int(5) NOT NULL,
  `title` varchar(500) NOT NULL,
  `header` varchar(500) NOT NULL,
  `photo` varchar(300) NOT NULL,
  `status` tinyint(5) NOT NULL DEFAULT 0,
  `position` tinyint(5) NOT NULL DEFAULT 0,
  `created_at` timestamp(6) NOT NULL DEFAULT current_timestamp(6),
  `updated_at` timestamp(6) NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `arrival_sections`
--

INSERT INTO `arrival_sections` (`id`, `title`, `header`, `photo`, `status`, `position`, `created_at`, `updated_at`) VALUES
(3, 'MEN COLLECTION', 'New Autumn Arrival 2021', '164370899567png.png', 1, 0, '2022-02-01 03:03:51.000000', '2022-02-01 03:49:55.000000'),
(4, 'NEW FASHION', 'New Autumn Arrival 2022', '164371008182png.png', 1, 1, '2022-02-01 04:08:01.000000', '2022-03-02 22:55:55.000000');

-- --------------------------------------------------------

--
-- Table structure for table `attributes`
--

CREATE TABLE `attributes` (
  `id` int(11) NOT NULL,
  `attributable_id` int(11) DEFAULT NULL,
  `attributable_type` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `input_name` varchar(255) DEFAULT NULL,
  `price_status` int(3) NOT NULL DEFAULT 1 COMMENT '0 - hide, 1- show	',
  `details_status` int(3) NOT NULL DEFAULT 1 COMMENT '0 - hide, 1- show	',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `attributes`
--

INSERT INTO `attributes` (`id`, `attributable_id`, `attributable_type`, `name`, `input_name`, `price_status`, `details_status`, `created_at`, `updated_at`) VALUES
(14, 5, 'App\\Models\\Category', 'Warranty Type', 'warranty_type', 1, 1, '2019-09-23 22:56:07', '2019-09-23 22:56:07'),
(20, 4, 'App\\Models\\Category', 'Warranty Type', 'warranty_type', 1, 1, '2019-09-24 00:41:46', '2019-10-03 00:18:54'),
(21, 4, 'App\\Models\\Category', 'Brand', 'brand', 1, 1, '2019-09-24 00:44:13', '2019-10-03 00:19:13'),
(22, 2, 'App\\Models\\Subcategory', 'Color Family', 'color_family', 1, 1, '2019-09-24 00:45:45', '2019-09-24 00:45:45'),
(24, 1, 'App\\Models\\Childcategory', 'Display Size', 'display_size', 1, 1, '2019-09-24 00:54:17', '2019-09-24 00:54:17'),
(25, 12, 'App\\Models\\Subcategory', 'demo', 'demo', 1, 1, '2019-09-24 01:26:47', '2019-09-24 01:26:47'),
(30, 3, 'App\\Models\\Subcategory', 'Interior Color', 'interior_color', 1, 1, '2019-09-24 04:31:44', '2019-09-24 04:31:44'),
(31, 8, 'App\\Models\\Childcategory', 'Temperature', 'temperature', 1, 1, '2019-09-24 04:34:35', '2019-09-24 04:34:35'),
(32, 18, 'App\\Models\\Category', 'Demo', 'demo', 1, 1, '2019-10-02 23:39:12', '2019-10-02 23:39:12'),
(33, 4, 'App\\Models\\Category', 'RAM', 'ram', 0, 1, '2019-10-12 03:22:03', '2020-11-09 02:26:58'),
(39, 16, 'App\\Models\\Category', 'Brand', 'brand', 1, 1, '2022-03-24 15:50:51', '2022-03-24 15:50:51'),
(40, 16, 'App\\Models\\Category', 'Warrenty', 'warrenty', 1, 1, '2022-03-24 15:54:30', '2022-03-24 15:54:30'),
(41, 16, 'App\\Models\\Category', 'Belt', 'belt', 1, 1, '2022-03-24 15:55:52', '2022-03-24 15:55:52');

-- --------------------------------------------------------

--
-- Table structure for table `attribute_options`
--

CREATE TABLE `attribute_options` (
  `id` int(11) NOT NULL,
  `attribute_id` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `attribute_options`
--

INSERT INTO `attribute_options` (`id`, `attribute_id`, `name`, `created_at`, `updated_at`) VALUES
(107, 14, 'No Warranty', '2019-09-23 22:56:07', '2019-09-23 22:56:07'),
(108, 14, 'Local seller Warranty', '2019-09-23 22:56:07', '2019-09-23 22:56:07'),
(109, 14, 'Non local warranty', '2019-09-23 22:56:07', '2019-09-23 22:56:07'),
(110, 14, 'International Manufacturer Warranty', '2019-09-23 22:56:07', '2019-09-23 22:56:07'),
(111, 14, 'International Seller Warranty', '2019-09-23 22:56:07', '2019-09-23 22:56:07'),
(157, 22, 'Black', '2019-09-24 00:46:26', '2019-09-24 00:46:26'),
(158, 22, 'White', '2019-09-24 00:46:26', '2019-09-24 00:46:26'),
(159, 22, 'Sliver', '2019-09-24 00:46:26', '2019-09-24 00:46:26'),
(160, 22, 'Red', '2019-09-24 00:46:26', '2019-09-24 00:46:26'),
(161, 22, 'Dark Grey', '2019-09-24 00:46:26', '2019-09-24 00:46:26'),
(162, 22, 'Dark Blue', '2019-09-24 00:46:26', '2019-09-24 00:46:26'),
(163, 22, 'Brown', '2019-09-24 00:46:26', '2019-09-24 00:46:26'),
(172, 24, '40', '2019-09-24 01:25:32', '2019-09-24 01:25:32'),
(173, 24, '22', '2019-09-24 01:25:32', '2019-09-24 01:25:32'),
(174, 24, '24', '2019-09-24 01:25:32', '2019-09-24 01:25:32'),
(175, 24, '32', '2019-09-24 01:25:32', '2019-09-24 01:25:32'),
(176, 24, '21', '2019-09-24 01:25:32', '2019-09-24 01:25:32'),
(177, 25, 'demo 1', '2019-09-24 01:26:47', '2019-09-24 01:26:47'),
(178, 25, 'demo 2', '2019-09-24 01:26:47', '2019-09-24 01:26:47'),
(187, 30, 'Yellow', '2019-09-24 04:31:44', '2019-09-24 04:31:44'),
(188, 30, 'White', '2019-09-24 04:31:44', '2019-09-24 04:31:44'),
(189, 31, '22', '2019-09-24 04:34:35', '2019-09-24 04:34:35'),
(190, 31, '34', '2019-09-24 04:34:35', '2019-09-24 04:34:35'),
(191, 31, '45', '2019-09-24 04:34:35', '2019-09-24 04:34:35'),
(195, 20, 'Local seller warranty', '2019-10-03 00:18:54', '2019-10-03 00:18:54'),
(196, 20, 'No warranty', '2019-10-03 00:18:54', '2019-10-03 00:18:54'),
(197, 20, 'international manufacturer warranty', '2019-10-03 00:18:54', '2019-10-03 00:18:54'),
(198, 20, 'Non-local warranty', '2019-10-03 00:18:54', '2019-10-03 00:18:54'),
(199, 21, 'Symphony', '2019-10-03 00:19:13', '2019-10-03 00:19:13'),
(200, 21, 'Oppo', '2019-10-03 00:19:13', '2019-10-03 00:19:13'),
(201, 21, 'EStore', '2019-10-03 00:19:13', '2019-10-03 00:19:13'),
(202, 21, 'Infinix', '2019-10-03 00:19:13', '2019-10-03 00:19:13'),
(203, 21, 'Apple', '2019-10-03 00:19:13', '2019-10-03 00:19:13'),
(253, 32, 'demo 1', '2019-10-13 03:18:04', '2019-10-13 03:18:04'),
(254, 32, 'demo 2', '2019-10-13 03:18:04', '2019-10-13 03:18:04'),
(255, 32, 'demo 3', '2019-10-13 03:18:04', '2019-10-13 03:18:04'),
(259, 33, '1 GB', '2020-11-09 02:26:58', '2020-11-09 02:26:58'),
(260, 33, '2 GB', '2020-11-09 02:26:58', '2020-11-09 02:26:58'),
(261, 33, '3 GB', '2020-11-09 02:26:58', '2020-11-09 02:26:58'),
(269, 39, 'G-Shock', '2022-03-24 15:50:51', '2022-03-24 15:50:51'),
(270, 39, 'Diesel', '2022-03-24 15:50:51', '2022-03-24 15:50:51'),
(271, 39, 'Longines', '2022-03-24 15:50:51', '2022-03-24 15:50:51'),
(272, 39, 'Hamilton', '2022-03-24 15:50:51', '2022-03-24 15:50:51'),
(273, 39, 'Citizen', '2022-03-24 15:50:51', '2022-03-24 15:50:51'),
(274, 40, 'Local Sell Warrenty', '2022-03-24 15:54:30', '2022-03-24 15:54:30'),
(275, 40, 'Manufacture Warrenty', '2022-03-24 15:54:30', '2022-03-24 15:54:30'),
(276, 40, 'International Warrenty', '2022-03-24 15:54:30', '2022-03-24 15:54:30'),
(277, 41, 'Leather', '2022-03-24 15:55:52', '2022-03-24 15:55:52'),
(278, 41, 'Stainless steel', '2022-03-24 15:55:52', '2022-03-24 15:55:52'),
(279, 41, 'Rubber', '2022-03-24 15:55:52', '2022-03-24 15:55:52'),
(280, 41, 'Normal', '2022-03-24 15:55:52', '2022-03-24 15:55:52');

-- --------------------------------------------------------

--
-- Table structure for table `banners`
--

CREATE TABLE `banners` (
  `id` int(191) NOT NULL,
  `photo` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `link` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` enum('Large','TopSmall','BottomSmall') NOT NULL,
  `language_id` int(191) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `banners`
--

INSERT INTO `banners` (`id`, `photo`, `link`, `type`, `language_id`) VALUES
(3, '16340212841632390083Topsmall.jpg', 'https://www.google.com/', 'Large', 1);

-- --------------------------------------------------------

--
-- Table structure for table `blogs`
--

CREATE TABLE `blogs` (
  `id` int(10) UNSIGNED NOT NULL,
  `category_id` int(191) NOT NULL,
  `title` varchar(191) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `details` text NOT NULL,
  `photo` varchar(191) DEFAULT NULL,
  `source` varchar(191) NOT NULL,
  `views` int(11) NOT NULL DEFAULT 0,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `meta_tag` text DEFAULT NULL,
  `meta_description` text DEFAULT NULL,
  `tags` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `language_id` int(191) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `blogs`
--

INSERT INTO `blogs` (`id`, `category_id`, `title`, `slug`, `details`, `photo`, `source`, `views`, `status`, `meta_tag`, `meta_description`, `tags`, `created_at`, `language_id`) VALUES
(9, 2, 'How to design effective arts?', 'how-to-design-effective-artsoCiZ', '<div align=\"justify\">The recording starts with the patter of a summer squall. Later, a \r\ndrifting tone like that of a not-quite-tuned-in radio station \r\n                                        rises and for a while drowns out\r\n the patter. These are the sounds encountered by NASA’s Cassini \r\nspacecraft as it dove \r\n                                        the gap between Saturn and its \r\ninnermost ring on April 26, the first of 22 such encounters before it \r\nwill plunge into \r\n                                        atmosphere in September. What \r\nCassini did not detect were many of the collisions of dust particles \r\nhitting the spacecraft\r\n                                        it passed through the plane of \r\nthe ringsen the charged particles oscillate in unison.<br><br></div><h3 align=\"justify\">How its Works ?</h3>\r\n                                    <p align=\"justify\">\r\n                                        MIAMI — For decades, South \r\nFlorida schoolchildren and adults fascinated by far-off galaxies, \r\nearthly ecosystems, the proper\r\n                                        ties of light and sound and \r\nother wonders of science had only a quaint, antiquated museum here in \r\nwhich to explore their \r\n                                        interests. Now, with the \r\nlong-delayed opening of a vast new science museum downtown set for \r\nMonday, visitors will be able \r\n                                        to stand underneath a suspended,\r\n 500,000-gallon aquarium tank and gaze at hammerhead and tiger sharks, \r\nmahi mahi, devil\r\n                                        rays and other creatures through\r\n a 60,000-pound oculus. <br></p><p align=\"justify\">Lens that will give the impression of seeing the fish from the bottom of\r\n a huge cocktail glass. And that’s just one of many\r\n                                        attractions and exhibits. \r\nOfficials at the $305 million Phillip and Patricia Frost Museum of \r\nScience promise that it will be a \r\n                                        vivid expression of modern \r\nscientific inquiry and exposition. Its opening follows a series of \r\nsetbacks and lawsuits and a \r\n                                        scramble to finish the \r\n250,000-square-foot structure. At one point, the project ran \r\nprecariously short of money. The museum\r\n                                        high-profile opening is \r\nespecially significant in a state s <br></p><p align=\"justify\"><br></p><h3 align=\"justify\">Top 5 reason to choose us</h3>\r\n                                    <p align=\"justify\">\r\n                                        Mauna Loa, the biggest volcano \r\non Earth — and one of the most active — covers half the Island of \r\nHawaii. Just 35 miles to the \r\n                                        northeast, Mauna Kea, known to \r\nnative Hawaiians as Mauna a Wakea, rises nearly 14,000 feet above sea \r\nlevel. To them it repre\r\n                                        sents a spiritual connection \r\nbetween our planet and the heavens above. These volcanoes, which have \r\nbeguiled millions of \r\n                                        tourists visiting the Hawaiian \r\nislands, have also plagued scientists with a long-running mystery: If \r\nthey are so close together, \r\n                                        how did they develop in two \r\nparallel tracks along the Hawaiian-Emperor chain formed over the same \r\nhot spot in the Pacific \r\n                                        Ocean — and why are their \r\nchemical compositions so different? \"We knew this was related to \r\nsomething much deeper,\r\n                                        but we couldn’t see what,” said \r\nTim Jones.\r\n                                    </p>', '164543362116423090481560403334beautiful-cellphone-cute-761963jpgjpg.jpg', 'www.geniusocean.com', 41, 1, 'b1,b2,b3', 'Mauna Loa, the biggest volcano on Earth — and one of the most active — covers half the Island of Hawaii. Just 35 miles to the northeast, Mauna Kea, known to native Hawaiians as Mauna a Wakea, rises nearly 14,000 feet above sea level.', 'Business,Research,Mechanical,Process,Innovation,Engineering', '2018-02-06 09:53:41', 1),
(10, 3, 'How to design effective arts?', 'how-to-design-effective-artsWAVi', '<div align=\"justify\">The recording starts with the patter of a summer squall. Later, a \r\ndrifting tone like that of a not-quite-tuned-in radio station \r\n                                        rises and for a while drowns out\r\n the patter. These are the sounds encountered by NASA’s Cassini \r\nspacecraft as it dove \r\n                                        the gap between Saturn and its \r\ninnermost ring on April 26, the first of 22 such encounters before it \r\nwill plunge into \r\n                                        atmosphere in September. What \r\nCassini did not detect were many of the collisions of dust particles \r\nhitting the spacecraft\r\n                                        it passed through the plane of \r\nthe ringsen the charged particles oscillate in unison.<br><br></div><h3 align=\"justify\">How its Works ?</h3>\r\n                                    <p align=\"justify\">\r\n                                        MIAMI — For decades, South \r\nFlorida schoolchildren and adults fascinated by far-off galaxies, \r\nearthly ecosystems, the proper\r\n                                        ties of light and sound and \r\nother wonders of science had only a quaint, antiquated museum here in \r\nwhich to explore their \r\n                                        interests. Now, with the \r\nlong-delayed opening of a vast new science museum downtown set for \r\nMonday, visitors will be able \r\n                                        to stand underneath a suspended,\r\n 500,000-gallon aquarium tank and gaze at hammerhead and tiger sharks, \r\nmahi mahi, devil\r\n                                        rays and other creatures through\r\n a 60,000-pound oculus. <br></p><p align=\"justify\">Lens that will give the impression of seeing the fish from the bottom of\r\n a huge cocktail glass. And that’s just one of many\r\n                                        attractions and exhibits. \r\nOfficials at the $305 million Phillip and Patricia Frost Museum of \r\nScience promise that it will be a \r\n                                        vivid expression of modern \r\nscientific inquiry and exposition. Its opening follows a series of \r\nsetbacks and lawsuits and a \r\n                                        scramble to finish the \r\n250,000-square-foot structure. At one point, the project ran \r\nprecariously short of money. The museum\r\n                                        high-profile opening is \r\nespecially significant in a state s <br></p><p align=\"justify\"><br></p><h3 align=\"justify\">Top 5 reason to choose us</h3>\r\n                                    <p align=\"justify\">\r\n                                        Mauna Loa, the biggest volcano \r\non Earth — and one of the most active — covers half the Island of \r\nHawaii. Just 35 miles to the \r\n                                        northeast, Mauna Kea, known to \r\nnative Hawaiians as Mauna a Wakea, rises nearly 14,000 feet above sea \r\nlevel. To them it repre\r\n                                        sents a spiritual connection \r\nbetween our planet and the heavens above. These volcanoes, which have \r\nbeguiled millions of \r\n                                        tourists visiting the Hawaiian \r\nislands, have also plagued scientists with a long-running mystery: If \r\nthey are so close together, \r\n                                        how did they develop in two \r\nparallel tracks along the Hawaiian-Emperor chain formed over the same \r\nhot spot in the Pacific \r\n                                        Ocean — and why are their \r\nchemical compositions so different? \"We knew this was related to \r\nsomething much deeper,\r\n                                        but we couldn’t see what,” said \r\nTim Jones.\r\n                                    </p>', '164543363216423090781560403521afro-attractive-beautiful-2253065jpgjpg.jpg', 'www.geniusocean.com', 15, 1, NULL, NULL, 'Business,Research,Mechanical,Process,Innovation,Engineering', '2018-03-06 09:54:21', 1),
(12, 2, 'How to design effective arts?', 'how-to-design-effective-artsLUx6', '<div align=\"justify\">The recording starts with the patter of a summer squall. Later, a \r\ndrifting tone like that of a not-quite-tuned-in radio station \r\n                                        rises and for a while drowns out\r\n the patter. These are the sounds encountered by NASA’s Cassini \r\nspacecraft as it dove \r\n                                        the gap between Saturn and its \r\ninnermost ring on April 26, the first of 22 such encounters before it \r\nwill plunge into \r\n                                        atmosphere in September. What \r\nCassini did not detect were many of the collisions of dust particles \r\nhitting the spacecraft\r\n                                        it passed through the plane of \r\nthe ringsen the charged particles oscillate in unison.<br><br></div><h3 align=\"justify\">How its Works ?</h3>\r\n                                    <p align=\"justify\">\r\n                                        MIAMI — For decades, South \r\nFlorida schoolchildren and adults fascinated by far-off galaxies, \r\nearthly ecosystems, the proper\r\n                                        ties of light and sound and \r\nother wonders of science had only a quaint, antiquated museum here in \r\nwhich to explore their \r\n                                        interests. Now, with the \r\nlong-delayed opening of a vast new science museum downtown set for \r\nMonday, visitors will be able \r\n                                        to stand underneath a suspended,\r\n 500,000-gallon aquarium tank and gaze at hammerhead and tiger sharks, \r\nmahi mahi, devil\r\n                                        rays and other creatures through\r\n a 60,000-pound oculus. <br></p><p align=\"justify\">Lens that will give the impression of seeing the fish from the bottom of\r\n a huge cocktail glass. And that’s just one of many\r\n                                        attractions and exhibits. \r\nOfficials at the $305 million Phillip and Patricia Frost Museum of \r\nScience promise that it will be a \r\n                                        vivid expression of modern \r\nscientific inquiry and exposition. Its opening follows a series of \r\nsetbacks and lawsuits and a \r\n                                        scramble to finish the \r\n250,000-square-foot structure. At one point, the project ran \r\nprecariously short of money. The museum\r\n                                        high-profile opening is \r\nespecially significant in a state s <br></p><p align=\"justify\"><br></p><h3 align=\"justify\">Top 5 reason to choose us</h3>\r\n                                    <p align=\"justify\">\r\n                                        Mauna Loa, the biggest volcano \r\non Earth — and one of the most active — covers half the Island of \r\nHawaii. Just 35 miles to the \r\n                                        northeast, Mauna Kea, known to \r\nnative Hawaiians as Mauna a Wakea, rises nearly 14,000 feet above sea \r\nlevel. To them it repre\r\n                                        sents a spiritual connection \r\nbetween our planet and the heavens above. These volcanoes, which have \r\nbeguiled millions of \r\n                                        tourists visiting the Hawaiian \r\nislands, have also plagued scientists with a long-running mystery: If \r\nthey are so close together, \r\n                                        how did they develop in two \r\nparallel tracks along the Hawaiian-Emperor chain formed over the same \r\nhot spot in the Pacific \r\n                                        Ocean — and why are their \r\nchemical compositions so different? \"We knew this was related to \r\nsomething much deeper,\r\n                                        but we couldn’t see what,” said \r\nTim Jones.\r\n                                    </p>', '164543360916423090171560403662beautiful-brown-hair-casual-1989252jpgjpg.jpg', 'www.geniusocean.com', 20, 1, NULL, NULL, 'Business,Research,Mechanical,Process,Innovation,Engineering', '2018-04-06 22:04:20', 1),
(13, 3, 'How to design effective arts?', 'how-to-design-effective-artsSCtj', '<div align=\"justify\">The recording starts with the patter of a summer squall. Later, a \r\ndrifting tone like that of a not-quite-tuned-in radio station \r\n                                        rises and for a while drowns out\r\n the patter. These are the sounds encountered by NASA’s Cassini \r\nspacecraft as it dove \r\n                                        the gap between Saturn and its \r\ninnermost ring on April 26, the first of 22 such encounters before it \r\nwill plunge into \r\n                                        atmosphere in September. What \r\nCassini did not detect were many of the collisions of dust particles \r\nhitting the spacecraft\r\n                                        it passed through the plane of \r\nthe ringsen the charged particles oscillate in unison.<br><br></div><h3 align=\"justify\">How its Works ?</h3>\r\n                                    <p align=\"justify\">\r\n                                        MIAMI — For decades, South \r\nFlorida schoolchildren and adults fascinated by far-off galaxies, \r\nearthly ecosystems, the proper\r\n                                        ties of light and sound and \r\nother wonders of science had only a quaint, antiquated museum here in \r\nwhich to explore their \r\n                                        interests. Now, with the \r\nlong-delayed opening of a vast new science museum downtown set for \r\nMonday, visitors will be able \r\n                                        to stand underneath a suspended,\r\n 500,000-gallon aquarium tank and gaze at hammerhead and tiger sharks, \r\nmahi mahi, devil\r\n                                        rays and other creatures through\r\n a 60,000-pound oculus. <br></p><p align=\"justify\">Lens that will give the impression of seeing the fish from the bottom of\r\n a huge cocktail glass. And that’s just one of many\r\n                                        attractions and exhibits. \r\nOfficials at the $305 million Phillip and Patricia Frost Museum of \r\nScience promise that it will be a \r\n                                        vivid expression of modern \r\nscientific inquiry and exposition. Its opening follows a series of \r\nsetbacks and lawsuits and a \r\n                                        scramble to finish the \r\n250,000-square-foot structure. At one point, the project ran \r\nprecariously short of money. The museum\r\n                                        high-profile opening is \r\nespecially significant in a state s <br></p><p align=\"justify\"><br></p><h3 align=\"justify\">Top 5 reason to choose us</h3>\r\n                                    <p align=\"justify\">\r\n                                        Mauna Loa, the biggest volcano \r\non Earth — and one of the most active — covers half the Island of \r\nHawaii. Just 35 miles to the \r\n                                        northeast, Mauna Kea, known to \r\nnative Hawaiians as Mauna a Wakea, rises nearly 14,000 feet above sea \r\nlevel. To them it repre\r\n                                        sents a spiritual connection \r\nbetween our planet and the heavens above. These volcanoes, which have \r\nbeguiled millions of \r\n                                        tourists visiting the Hawaiian \r\nislands, have also plagued scientists with a long-running mystery: If \r\nthey are so close together, \r\n                                        how did they develop in two \r\nparallel tracks along the Hawaiian-Emperor chain formed over the same \r\nhot spot in the Pacific \r\n                                        Ocean — and why are their \r\nchemical compositions so different? \"We knew this was related to \r\nsomething much deeper,\r\n                                        but we couldn’t see what,” said \r\nTim Jones.\r\n                                    </p>', '1645433598164069213125pngpng.png', 'www.geniusocean.com', 58, 1, NULL, NULL, 'Business,Research,Mechanical,Process,Innovation,Engineering', '2018-05-06 22:04:36', 1),
(14, 2, 'How to design effective arts?', 'how-to-design-effective-arts5Xoo', '<div align=\"justify\">The recording starts with the patter of a summer squall. Later, a drifting tone like that of a not-quite-tuned-in radio station rises and for a while drowns out the patter. These are the sounds encountered by NASA’s Cassini spacecraft as it dove the gap between Saturn and its innermost ring on April 26, the first of 22 such encounters before it will plunge into atmosphere in September. What Cassini did not detect were many of the collisions of dust particles hitting the spacecraft it passed through the plane of the ringsen the charged particles oscillate in unison.<br><br></div><h3 align=\"justify\" style=\"font-family: \" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" color:=\"\" rgb(51,=\"\" 51,=\"\" 51);\"=\"\">How its Works ?</h3><p align=\"justify\">MIAMI — For decades, South Florida schoolchildren and adults fascinated by far-off galaxies, earthly ecosystems, the proper ties of light and sound and other wonders of science had only a quaint, antiquated museum here in which to explore their interests. Now, with the long-delayed opening of a vast new science museum downtown set for Monday, visitors will be able to stand underneath a suspended, 500,000-gallon aquarium tank and gaze at hammerhead and tiger sharks, mahi mahi, devil rays and other creatures through a 60,000-pound oculus.&nbsp;<br></p><p align=\"justify\">Lens that will give the impression of seeing the fish from the bottom of a huge cocktail glass. And that’s just one of many attractions and exhibits. Officials at the $305 million Phillip and Patricia Frost Museum of Science promise that it will be a vivid expression of modern scientific inquiry and exposition. Its opening follows a series of setbacks and lawsuits and a scramble to finish the 250,000-square-foot structure. At one point, the project ran precariously short of money. The museum high-profile opening is especially significant in a state s&nbsp;<br></p><p align=\"justify\"><br></p><h3 align=\"justify\" style=\"font-family: \" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" color:=\"\" rgb(51,=\"\" 51,=\"\" 51);\"=\"\">Top 5 reason to choose us</h3><p align=\"justify\">Mauna Loa, the biggest volcano on Earth — and one of the most active — covers half the Island of Hawaii. Just 35 miles to the northeast, Mauna Kea, known to native Hawaiians as Mauna a Wakea, rises nearly 14,000 feet above sea level. To them it repre sents a spiritual connection between our planet and the heavens above. These volcanoes, which have beguiled millions of tourists visiting the Hawaiian islands, have also plagued scientists with a long-running mystery: If they are so close together, how did they develop in two parallel tracks along the Hawaiian-Emperor chain formed over the same hot spot in the Pacific Ocean — and why are their chemical compositions so different? \"We knew this was related to something much deeper, but we couldn’t see what,” said Tim Jones.</p>', '1645433573164069202629pngpng.png', 'www.geniusocean.com', 4, 1, NULL, NULL, 'Business,Research,Mechanical,Process,Innovation,Engineering', '2018-06-03 06:02:30', 1),
(15, 3, 'How to design effective arts?', 'how-to-design-effective-artsq2Rz', '<div align=\"justify\">The recording starts with the patter of a summer squall. Later, a drifting tone like that of a not-quite-tuned-in radio station rises and for a while drowns out the patter. These are the sounds encountered by NASA’s Cassini spacecraft as it dove the gap between Saturn and its innermost ring on April 26, the first of 22 such encounters before it will plunge into atmosphere in September. What Cassini did not detect were many of the collisions of dust particles hitting the spacecraft it passed through the plane of the ringsen the charged particles oscillate in unison.<br><br></div><h3 align=\"justify\" style=\"font-family: \" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" color:=\"\" rgb(51,=\"\" 51,=\"\" 51);\"=\"\">How its Works ?</h3><p align=\"justify\">MIAMI — For decades, South Florida schoolchildren and adults fascinated by far-off galaxies, earthly ecosystems, the proper ties of light and sound and other wonders of science had only a quaint, antiquated museum here in which to explore their interests. Now, with the long-delayed opening of a vast new science museum downtown set for Monday, visitors will be able to stand underneath a suspended, 500,000-gallon aquarium tank and gaze at hammerhead and tiger sharks, mahi mahi, devil rays and other creatures through a 60,000-pound oculus.&nbsp;<br></p><p align=\"justify\">Lens that will give the impression of seeing the fish from the bottom of a huge cocktail glass. And that’s just one of many attractions and exhibits. Officials at the $305 million Phillip and Patricia Frost Museum of Science promise that it will be a vivid expression of modern scientific inquiry and exposition. Its opening follows a series of setbacks and lawsuits and a scramble to finish the 250,000-square-foot structure. At one point, the project ran precariously short of money. The museum high-profile opening is especially significant in a state s&nbsp;<br></p><p align=\"justify\"><br></p><h3 align=\"justify\" style=\"font-family: \" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" color:=\"\" rgb(51,=\"\" 51,=\"\" 51);\"=\"\">Top 5 reason to choose us</h3><p align=\"justify\">Mauna Loa, the biggest volcano on Earth — and one of the most active — covers half the Island of Hawaii. Just 35 miles to the northeast, Mauna Kea, known to native Hawaiians as Mauna a Wakea, rises nearly 14,000 feet above sea level. To them it repre sents a spiritual connection between our planet and the heavens above. These volcanoes, which have beguiled millions of tourists visiting the Hawaiian islands, have also plagued scientists with a long-running mystery: If they are so close together, how did they develop in two parallel tracks along the Hawaiian-Emperor chain formed over the same hot spot in the Pacific Ocean — and why are their chemical compositions so different? \"We knew this was related to something much deeper, but we couldn’t see what,” said Tim Jones.</p>', '164543355515542700676-minjpg.jpg', 'www.geniusocean.com', 10, 1, NULL, NULL, 'Business,Research,Mechanical,Process,Innovation,Engineering', '2018-07-03 06:02:53', 1),
(16, 2, 'How to design effective arts?', 'how-to-design-effective-artsGnee', '<div align=\"justify\">The recording starts with the patter of a summer squall. Later, a drifting tone like that of a not-quite-tuned-in radio station rises and for a while drowns out the patter. These are the sounds encountered by NASA’s Cassini spacecraft as it dove the gap between Saturn and its innermost ring on April 26, the first of 22 such encounters before it will plunge into atmosphere in September. What Cassini did not detect were many of the collisions of dust particles hitting the spacecraft it passed through the plane of the ringsen the charged particles oscillate in unison.<br><br></div><h3 align=\"justify\" style=\"font-family: \" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" color:=\"\" rgb(51,=\"\" 51,=\"\" 51);\"=\"\">How its Works ?</h3><p align=\"justify\">MIAMI — For decades, South Florida schoolchildren and adults fascinated by far-off galaxies, earthly ecosystems, the proper ties of light and sound and other wonders of science had only a quaint, antiquated museum here in which to explore their interests. Now, with the long-delayed opening of a vast new science museum downtown set for Monday, visitors will be able to stand underneath a suspended, 500,000-gallon aquarium tank and gaze at hammerhead and tiger sharks, mahi mahi, devil rays and other creatures through a 60,000-pound oculus.&nbsp;<br></p><p align=\"justify\">Lens that will give the impression of seeing the fish from the bottom of a huge cocktail glass. And that’s just one of many attractions and exhibits. Officials at the $305 million Phillip and Patricia Frost Museum of Science promise that it will be a vivid expression of modern scientific inquiry and exposition. Its opening follows a series of setbacks and lawsuits and a scramble to finish the 250,000-square-foot structure. At one point, the project ran precariously short of money. The museum high-profile opening is especially significant in a state s&nbsp;<br></p><p align=\"justify\"><br></p><h3 align=\"justify\" style=\"font-family: \" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" color:=\"\" rgb(51,=\"\" 51,=\"\" 51);\"=\"\">Top 5 reason to choose us</h3><p align=\"justify\">Mauna Loa, the biggest volcano on Earth — and one of the most active — covers half the Island of Hawaii. Just 35 miles to the northeast, Mauna Kea, known to native Hawaiians as Mauna a Wakea, rises nearly 14,000 feet above sea level. To them it repre sents a spiritual connection between our planet and the heavens above. These volcanoes, which have beguiled millions of tourists visiting the Hawaiian islands, have also plagued scientists with a long-running mystery: If they are so close together, how did they develop in two parallel tracks along the Hawaiian-Emperor chain formed over the same hot spot in the Pacific Ocean — and why are their chemical compositions so different? \"We knew this was related to something much deeper, but we couldn’t see what,” said Tim Jones.</p>', '164543353615542699045-minjpg.jpg', 'www.geniusocean.com', 6, 1, NULL, NULL, 'Business,Research,Mechanical,Process,Innovation,Engineering', '2018-08-03 06:03:14', 1),
(17, 3, 'How to design effective arts?', 'how-to-design-effective-artsOYf3', '<div align=\"justify\">The recording starts with the patter of a summer squall. Later, a drifting tone like that of a not-quite-tuned-in radio station rises and for a while drowns out the patter. These are the sounds encountered by NASA’s Cassini spacecraft as it dove the gap between Saturn and its innermost ring on April 26, the first of 22 such encounters before it will plunge into atmosphere in September. What Cassini did not detect were many of the collisions of dust particles hitting the spacecraft it passed through the plane of the ringsen the charged particles oscillate in unison.<br><br></div><h3 align=\"justify\" style=\"font-family: \" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" color:=\"\" rgb(51,=\"\" 51,=\"\" 51);\"=\"\">How its Works ?</h3><p align=\"justify\">MIAMI — For decades, South Florida schoolchildren and adults fascinated by far-off galaxies, earthly ecosystems, the proper ties of light and sound and other wonders of science had only a quaint, antiquated museum here in which to explore their interests. Now, with the long-delayed opening of a vast new science museum downtown set for Monday, visitors will be able to stand underneath a suspended, 500,000-gallon aquarium tank and gaze at hammerhead and tiger sharks, mahi mahi, devil rays and other creatures through a 60,000-pound oculus.&nbsp;<br></p><p align=\"justify\">Lens that will give the impression of seeing the fish from the bottom of a huge cocktail glass. And that’s just one of many attractions and exhibits. Officials at the $305 million Phillip and Patricia Frost Museum of Science promise that it will be a vivid expression of modern scientific inquiry and exposition. Its opening follows a series of setbacks and lawsuits and a scramble to finish the 250,000-square-foot structure. At one point, the project ran precariously short of money. The museum high-profile opening is especially significant in a state s&nbsp;<br></p><p align=\"justify\"><br></p><h3 align=\"justify\" style=\"font-family: \" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" color:=\"\" rgb(51,=\"\" 51,=\"\" 51);\"=\"\">Top 5 reason to choose us</h3><p align=\"justify\">Mauna Loa, the biggest volcano on Earth — and one of the most active — covers half the Island of Hawaii. Just 35 miles to the northeast, Mauna Kea, known to native Hawaiians as Mauna a Wakea, rises nearly 14,000 feet above sea level. To them it repre sents a spiritual connection between our planet and the heavens above. These volcanoes, which have beguiled millions of tourists visiting the Hawaiian islands, have also plagued scientists with a long-running mystery: If they are so close together, how did they develop in two parallel tracks along the Hawaiian-Emperor chain formed over the same hot spot in the Pacific Ocean — and why are their chemical compositions so different? \"We knew this was related to something much deeper, but we couldn’t see what,” said Tim Jones.</p>', '164543351615542698954-minjpg.jpg', 'www.geniusocean.com', 55, 1, NULL, NULL, 'Business,Research,Mechanical,Process,Innovation,Engineering', '2019-01-03 06:03:37', 1),
(18, 2, 'How to design effective arts?', 'how-to-design-effective-artsrJ9k', '<div align=\"justify\">The recording starts with the patter of a summer squall. Later, a drifting tone like that of a not-quite-tuned-in radio station rises and for a while drowns out the patter. These are the sounds encountered by NASA’s Cassini spacecraft as it dove the gap between Saturn and its innermost ring on April 26, the first of 22 such encounters before it will plunge into atmosphere in September. What Cassini did not detect were many of the collisions of dust particles hitting the spacecraft it passed through the plane of the ringsen the charged particles oscillate in unison.<br><br></div><h3 align=\"justify\" style=\"font-family: \" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" color:=\"\" rgb(51,=\"\" 51,=\"\" 51);\"=\"\">How its Works ?</h3><p align=\"justify\">MIAMI — For decades, South Florida schoolchildren and adults fascinated by far-off galaxies, earthly ecosystems, the proper ties of light and sound and other wonders of science had only a quaint, antiquated museum here in which to explore their interests. Now, with the long-delayed opening of a vast new science museum downtown set for Monday, visitors will be able to stand underneath a suspended, 500,000-gallon aquarium tank and gaze at hammerhead and tiger sharks, mahi mahi, devil rays and other creatures through a 60,000-pound oculus.&nbsp;<br></p><p align=\"justify\">Lens that will give the impression of seeing the fish from the bottom of a huge cocktail glass. And that’s just one of many attractions and exhibits. Officials at the $305 million Phillip and Patricia Frost Museum of Science promise that it will be a vivid expression of modern scientific inquiry and exposition. Its opening follows a series of setbacks and lawsuits and a scramble to finish the 250,000-square-foot structure. At one point, the project ran precariously short of money. The museum high-profile opening is especially significant in a state s&nbsp;<br></p><p align=\"justify\"><br></p><h3 align=\"justify\" style=\"font-family: \" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" color:=\"\" rgb(51,=\"\" 51,=\"\" 51);\"=\"\">Top 5 reason to choose us</h3><p align=\"justify\">Mauna Loa, the biggest volcano on Earth — and one of the most active — covers half the Island of Hawaii. Just 35 miles to the northeast, Mauna Kea, known to native Hawaiians as Mauna a Wakea, rises nearly 14,000 feet above sea level. To them it repre sents a spiritual connection between our planet and the heavens above. These volcanoes, which have beguiled millions of tourists visiting the Hawaiian islands, have also plagued scientists with a long-running mystery: If they are so close together, how did they develop in two parallel tracks along the Hawaiian-Emperor chain formed over the same hot spot in the Pacific Ocean — and why are their chemical compositions so different? \"We knew this was related to something much deeper, but we couldn’t see what,” said Tim Jones.</p>', '16454339504png.png', 'www.geniusocean.com', 207, 1, NULL, NULL, 'Business,Research,Mechanical,Process,Innovation,Engineering', '2019-01-03 06:03:59', 1),
(20, 2, 'How to design effective arts?', 'how-to-design-effective-artspnST', '<div align=\"justify\">The recording starts with the patter of a summer squall. Later, a drifting tone like that of a not-quite-tuned-in radio station rises and for a while drowns out the patter. These are the sounds encountered by NASA’s Cassini spacecraft as it dove the gap between Saturn and its innermost ring on April 26, the first of 22 such encounters before it will plunge into atmosphere in September. What Cassini did not detect were many of the collisions of dust particles hitting the spacecraft it passed through the plane of the ringsen the charged particles oscillate in unison.<br><br></div><h3 align=\"justify\" style=\"font-family: \" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" color:=\"\" rgb(51,=\"\" 51,=\"\" 51);\"=\"\">How its Works ?</h3><p align=\"justify\">MIAMI — For decades, South Florida schoolchildren and adults fascinated by far-off galaxies, earthly ecosystems, the proper ties of light and sound and other wonders of science had only a quaint, antiquated museum here in which to explore their interests. Now, with the long-delayed opening of a vast new science museum downtown set for Monday, visitors will be able to stand underneath a suspended, 500,000-gallon aquarium tank and gaze at hammerhead and tiger sharks, mahi mahi, devil rays and other creatures through a 60,000-pound oculus.&nbsp;<br></p><p align=\"justify\">Lens that will give the impression of seeing the fish from the bottom of a huge cocktail glass. And that’s just one of many attractions and exhibits. Officials at the $305 million Phillip and Patricia Frost Museum of Science promise that it will be a vivid expression of modern scientific inquiry and exposition. Its opening follows a series of setbacks and lawsuits and a scramble to finish the 250,000-square-foot structure. At one point, the project ran precariously short of money. The museum high-profile opening is especially significant in a state s&nbsp;<br></p><p align=\"justify\"><br></p><h3 align=\"justify\" style=\"font-family: \" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" color:=\"\" rgb(51,=\"\" 51,=\"\" 51);\"=\"\">Top 5 reason to choose us</h3><p align=\"justify\">Mauna Loa, the biggest volcano on Earth — and one of the most active — covers half the Island of Hawaii. Just 35 miles to the northeast, Mauna Kea, known to native Hawaiians as Mauna a Wakea, rises nearly 14,000 feet above sea level. To them it repre sents a spiritual connection between our planet and the heavens above. These volcanoes, which have beguiled millions of tourists visiting the Hawaiian islands, have also plagued scientists with a long-running mystery: If they are so close together, how did they develop in two parallel tracks along the Hawaiian-Emperor chain formed over the same hot spot in the Pacific Ocean — and why are their chemical compositions so different? \"We knew this was related to something much deeper, but we couldn’t see what,” said Tim Jones.</p>', '164543347015542698832-minjpg.jpg', 'www.geniusocean.com', 11, 1, NULL, NULL, 'Business,Research,Mechanical,Process,Innovation,Engineering', '2018-08-03 06:03:14', 1),
(21, 3, 'How to design effective arts?', 'how-to-design-effective-arts1kzz', '<div align=\"justify\">The recording starts with the patter of a summer squall. Later, a drifting tone like that of a not-quite-tuned-in radio station rises and for a while drowns out the patter. These are the sounds encountered by NASA’s Cassini spacecraft as it dove the gap between Saturn and its innermost ring on April 26, the first of 22 such encounters before it will plunge into atmosphere in September. What Cassini did not detect were many of the collisions of dust particles hitting the spacecraft it passed through the plane of the ringsen the charged particles oscillate in unison.<br><br></div><h3 align=\"justify\" style=\"font-family: \" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" color:=\"\" rgb(51,=\"\" 51,=\"\" 51);\"=\"\">How its Works ?</h3><p align=\"justify\">MIAMI — For decades, South Florida schoolchildren and adults fascinated by far-off galaxies, earthly ecosystems, the proper ties of light and sound and other wonders of science had only a quaint, antiquated museum here in which to explore their interests. Now, with the long-delayed opening of a vast new science museum downtown set for Monday, visitors will be able to stand underneath a suspended, 500,000-gallon aquarium tank and gaze at hammerhead and tiger sharks, mahi mahi, devil rays and other creatures through a 60,000-pound oculus.&nbsp;<br></p><p align=\"justify\">Lens that will give the impression of seeing the fish from the bottom of a huge cocktail glass. And that’s just one of many attractions and exhibits. Officials at the $305 million Phillip and Patricia Frost Museum of Science promise that it will be a vivid expression of modern scientific inquiry and exposition. Its opening follows a series of setbacks and lawsuits and a scramble to finish the 250,000-square-foot structure. At one point, the project ran precariously short of money. The museum high-profile opening is especially significant in a state s&nbsp;<br></p><p align=\"justify\"><br></p><h3 align=\"justify\" style=\"font-family: \" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" color:=\"\" rgb(51,=\"\" 51,=\"\" 51);\"=\"\">Top 5 reason to choose us</h3><p align=\"justify\">Mauna Loa, the biggest volcano on Earth — and one of the most active — covers half the Island of Hawaii. Just 35 miles to the northeast, Mauna Kea, known to native Hawaiians as Mauna a Wakea, rises nearly 14,000 feet above sea level. To them it repre sents a spiritual connection between our planet and the heavens above. These volcanoes, which have beguiled millions of tourists visiting the Hawaiian islands, have also plagued scientists with a long-running mystery: If they are so close together, how did they develop in two parallel tracks along the Hawaiian-Emperor chain formed over the same hot spot in the Pacific Ocean — and why are their chemical compositions so different? \"We knew this was related to something much deeper, but we couldn’t see what,” said Tim Jones.</p>', '16454334471572852760blog7png.png', 'www.geniusocean.com', 39, 1, NULL, NULL, 'Business,Research,Mechanical,Process,Innovation,Engineering', '2019-01-03 06:03:37', 1),
(22, 2, 'How to design effective arts?', 'how-to-design-effective-artsAmHL', '<div align=\"justify\">The recording starts with the patter of a summer squall. Later, a drifting tone like that of a not-quite-tuned-in radio station rises and for a while drowns out the patter. These are the sounds encountered by NASA’s Cassini spacecraft as it dove the gap between Saturn and its innermost ring on April 26, the first of 22 such encounters before it will plunge into atmosphere in September. What Cassini did not detect were many of the collisions of dust particles hitting the spacecraft it passed through the plane of the ringsen the charged particles oscillate in unison.<br><br></div><h3 align=\"justify\" style=\"font-family: \" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" color:=\"\" rgb(51,=\"\" 51,=\"\" 51);\"=\"\">How its Works ?</h3><p align=\"justify\">MIAMI — For decades, South Florida schoolchildren and adults fascinated by far-off galaxies, earthly ecosystems, the proper ties of light and sound and other wonders of science had only a quaint, antiquated museum here in which to explore their interests. Now, with the long-delayed opening of a vast new science museum downtown set for Monday, visitors will be able to stand underneath a suspended, 500,000-gallon aquarium tank and gaze at hammerhead and tiger sharks, mahi mahi, devil rays and other creatures through a 60,000-pound oculus.&nbsp;<br></p><p align=\"justify\">Lens that will give the impression of seeing the fish from the bottom of a huge cocktail glass. And that’s just one of many attractions and exhibits. Officials at the $305 million Phillip and Patricia Frost Museum of Science promise that it will be a vivid expression of modern scientific inquiry and exposition. Its opening follows a series of setbacks and lawsuits and a scramble to finish the 250,000-square-foot structure. At one point, the project ran precariously short of money. The museum high-profile opening is especially significant in a state s&nbsp;<br></p><p align=\"justify\"><br></p><h3 align=\"justify\" style=\"font-family: \" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" color:=\"\" rgb(51,=\"\" 51,=\"\" 51);\"=\"\">Top 5 reason to choose us</h3><p align=\"justify\">Mauna Loa, the biggest volcano on Earth — and one of the most active — covers half the Island of Hawaii. Just 35 miles to the northeast, Mauna Kea, known to native Hawaiians as Mauna a Wakea, rises nearly 14,000 feet above sea level. To them it repre sents a spiritual connection between our planet and the heavens above. These volcanoes, which have beguiled millions of tourists visiting the Hawaiian islands, have also plagued scientists with a long-running mystery: If they are so close together, how did they develop in two parallel tracks along the Hawaiian-Emperor chain formed over the same hot spot in the Pacific Ocean — and why are their chemical compositions so different? \"We knew this was related to something much deeper, but we couldn’t see what,” said Tim Jones.</p>', '164543402825png.png', 'www.geniusocean.com', 79, 1, NULL, NULL, 'Business,Research,Mechanical,Process,Innovation,Engineering', '2019-01-03 06:03:59', 1),
(23, 7, 'How to design effective arts?', 'how-to-design-effective-artszYxx', '<div align=\"justify\">The recording starts with the patter of a summer squall. Later, a drifting tone like that of a not-quite-tuned-in radio station rises and for a while drowns out the patter. These are the sounds encountered by NASA’s Cassini spacecraft as it dove the gap between Saturn and its innermost ring on April 26, the first of 22 such encounters before it will plunge into atmosphere in September. What Cassini did not detect were many of the collisions of dust particles hitting the spacecraft it passed through the plane of the ringsen the charged particles oscillate in unison.<br><br></div><h3 align=\"justify\" style=\"font-family: \" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" color:=\"\" rgb(51,=\"\" 51,=\"\" 51);\"=\"\">How its Works ?</h3><p align=\"justify\">MIAMI — For decades, South Florida schoolchildren and adults fascinated by far-off galaxies, earthly ecosystems, the proper ties of light and sound and other wonders of science had only a quaint, antiquated museum here in which to explore their interests. Now, with the long-delayed opening of a vast new science museum downtown set for Monday, visitors will be able to stand underneath a suspended, 500,000-gallon aquarium tank and gaze at hammerhead and tiger sharks, mahi mahi, devil rays and other creatures through a 60,000-pound oculus.&nbsp;<br></p><p align=\"justify\">Lens that will give the impression of seeing the fish from the bottom of a huge cocktail glass. And that’s just one of many attractions and exhibits. Officials at the $305 million Phillip and Patricia Frost Museum of Science promise that it will be a vivid expression of modern scientific inquiry and exposition. Its opening follows a series of setbacks and lawsuits and a scramble to finish the 250,000-square-foot structure. At one point, the project ran precariously short of money. The museum high-profile opening is especially significant in a state s&nbsp;<br></p><p align=\"justify\"><br></p><h3 align=\"justify\" style=\"font-family: \" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" color:=\"\" rgb(51,=\"\" 51,=\"\" 51);\"=\"\">Top 5 reason to choose us</h3><p align=\"justify\">Mauna Loa, the biggest volcano on Earth — and one of the most active — covers half the Island of Hawaii. Just 35 miles to the northeast, Mauna Kea, known to native Hawaiians as Mauna a Wakea, rises nearly 14,000 feet above sea level. To them it repre sents a spiritual connection between our planet and the heavens above. These volcanoes, which have beguiled millions of tourists visiting the Hawaiian islands, have also plagued scientists with a long-running mystery: If they are so close together, how did they develop in two parallel tracks along the Hawaiian-Emperor chain formed over the same hot spot in the Pacific Ocean — and why are their chemical compositions so different? \"We knew this was related to something much deeper, but we couldn’t see what,” said Tim Jones.</p>', '16454334081572852731blog3jpg.jpg', 'www.geniusocean.com', 10, 1, NULL, NULL, 'Business,Research,Mechanical,Process,Innovation,Engineering', '2018-08-03 06:03:14', 1),
(24, 3, 'How to design effective arts?', 'how-to-design-effective-arts8bQ1', '<div align=\"justify\">The recording starts with the patter of a summer squall. Later, a drifting tone like that of a not-quite-tuned-in radio station rises and for a while drowns out the patter. These are the sounds encountered by NASA’s Cassini spacecraft as it dove the gap between Saturn and its innermost ring on April 26, the first of 22 such encounters before it will plunge into atmosphere in September. What Cassini did not detect were many of the collisions of dust particles hitting the spacecraft it passed through the plane of the ringsen the charged particles oscillate in unison.<br><br></div><h3 align=\"justify\" style=\"font-family: \" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" color:=\"\" rgb(51,=\"\" 51,=\"\" 51);\"=\"\">How its Works ?</h3><p align=\"justify\">MIAMI — For decades, South Florida schoolchildren and adults fascinated by far-off galaxies, earthly ecosystems, the proper ties of light and sound and other wonders of science had only a quaint, antiquated museum here in which to explore their interests. Now, with the long-delayed opening of a vast new science museum downtown set for Monday, visitors will be able to stand underneath a suspended, 500,000-gallon aquarium tank and gaze at hammerhead and tiger sharks, mahi mahi, devil rays and other creatures through a 60,000-pound oculus.&nbsp;<br></p><p align=\"justify\">Lens that will give the impression of seeing the fish from the bottom of a huge cocktail glass. And that’s just one of many attractions and exhibits. Officials at the $305 million Phillip and Patricia Frost Museum of Science promise that it will be a vivid expression of modern scientific inquiry and exposition. Its opening follows a series of setbacks and lawsuits and a scramble to finish the 250,000-square-foot structure. At one point, the project ran precariously short of money. The museum high-profile opening is especially significant in a state s&nbsp;<br></p><p align=\"justify\"><br></p><h3 align=\"justify\" style=\"font-family: \" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" color:=\"\" rgb(51,=\"\" 51,=\"\" 51);\"=\"\">Top 5 reason to choose us</h3><p align=\"justify\">Mauna Loa, the biggest volcano on Earth — and one of the most active — covers half the Island of Hawaii. Just 35 miles to the northeast, Mauna Kea, known to native Hawaiians as Mauna a Wakea, rises nearly 14,000 feet above sea level. To them it repre sents a spiritual connection between our planet and the heavens above. These volcanoes, which have beguiled millions of tourists visiting the Hawaiian islands, have also plagued scientists with a long-running mystery: If they are so close together, how did they develop in two parallel tracks along the Hawaiian-Emperor chain formed over the same hot spot in the Pacific Ocean — and why are their chemical compositions so different? \"We knew this was related to something much deeper, but we couldn’t see what,” said Tim Jones.</p>', '16454333931572852725blog2jpg.jpg', 'www.geniusocean.com', 39, 1, NULL, NULL, 'Business,Research,Mechanical,Process,Innovation,Engineering', '2019-01-03 06:03:37', 1);
INSERT INTO `blogs` (`id`, `category_id`, `title`, `slug`, `details`, `photo`, `source`, `views`, `status`, `meta_tag`, `meta_description`, `tags`, `created_at`, `language_id`) VALUES
(25, 3, 'How to design effective arts?', 'how-to-design-effective-artsSt80', '<div align=\"justify\">The recording starts with the patter of a summer squall. Later, a drifting tone like that of a not-quite-tuned-in radio station rises and for a while drowns out the patter. These are the sounds encountered by NASA’s Cassini spacecraft as it dove the gap between Saturn and its innermost ring on April 26, the first of 22 such encounters before it will plunge into atmosphere in September. What Cassini did not detect were many of the collisions of dust particles hitting the spacecraft it passed through the plane of the ringsen the charged particles oscillate in unison.<br><br></div><h3 align=\"justify\" style=\"font-family: \" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" color:=\"\" rgb(51,=\"\" 51,=\"\" 51);\"=\"\">How its Works ?</h3><p align=\"justify\">MIAMI — For decades, South Florida schoolchildren and adults fascinated by far-off galaxies, earthly ecosystems, the proper ties of light and sound and other wonders of science had only a quaint, antiquated museum here in which to explore their interests. Now, with the long-delayed opening of a vast new science museum downtown set for Monday, visitors will be able to stand underneath a suspended, 500,000-gallon aquarium tank and gaze at hammerhead and tiger sharks, mahi mahi, devil rays and other creatures through a 60,000-pound oculus.&nbsp;<br></p><p align=\"justify\">Lens that will give the impression of seeing the fish from the bottom of a huge cocktail glass. And that’s just one of many attractions and exhibits. Officials at the $305 million Phillip and Patricia Frost Museum of Science promise that it will be a vivid expression of modern scientific inquiry and exposition. Its opening follows a series of setbacks and lawsuits and a scramble to finish the 250,000-square-foot structure. At one point, the project ran precariously short of money. The museum high-profile opening is especially significant in a state s&nbsp;<br></p><p align=\"justify\"><br></p><h3 align=\"justify\" style=\"font-family: \" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" color:=\"\" rgb(51,=\"\" 51,=\"\" 51);\"=\"\">Top 5 reason to choose us</h3><p align=\"justify\">Mauna Loa, the biggest volcano on Earth — and one of the most active — covers half the Island of Hawaii. Just 35 miles to the northeast, Mauna Kea, known to native Hawaiians as Mauna a Wakea, rises nearly 14,000 feet above sea level. To them it repre sents a spiritual connection between our planet and the heavens above. These volcanoes, which have beguiled millions of tourists visiting the Hawaiian islands, have also plagued scientists with a long-running mystery: If they are so close together, how did they develop in two parallel tracks along the Hawaiian-Emperor chain formed over the same hot spot in the Pacific Ocean — and why are their chemical compositions so different? \"We knew this was related to something much deeper, but we couldn’t see what,” said Tim Jones.</p><p align=\"justify\"><br></p><p align=\"justify\"><img onclick=\"alert(\'Hacked\')\" src=\"https://i.imgur.com/jtEirwY.png\" width=\"128\"><br></p><p align=\"justify\"><br></p>\r\n\r\n<script>alert(\'Hacked\');</script>', '16454333771572852720blog1png.png', 'www.geniusocean.com', 72, 1, NULL, NULL, 'Business,Research,Mechanical,Process,Innovation,Engineering', '2019-01-03 06:03:59', 1);

-- --------------------------------------------------------

--
-- Table structure for table `blog_categories`
--

CREATE TABLE `blog_categories` (
  `id` int(191) NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `language_id` int(191) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `blog_categories`
--

INSERT INTO `blog_categories` (`id`, `name`, `slug`, `language_id`) VALUES
(2, 'Web Services', 'web-services', 1),
(3, 'Business Philosophy', 'business-philosophy', 1),
(4, 'Business Help', 'business-help', 1),
(5, 'Random Thoughts', 'random-thoughts', 1),
(6, 'Mechanical', 'mechanical', 1),
(7, 'Entrepreneurs', 'entrepreneurs', 1),
(8, 'Technology', 'technology', 1);

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(191) NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `photo` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `language_id` int(191) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `slug`, `status`, `photo`, `image`, `language_id`) VALUES
(4, 'Electronic', 'electric', 1, '1557807287light.png', '1573626327cat-banner.jpg', 1),
(5, 'Fashion & Beauty', 'fashion-and-Beauty', 1, '1557807279fashion.png', '1573626334cat-banner.jpg', 1),
(6, 'Camera & Photo', 'camera-and-photo', 1, '1557807264camera.png', '1573626340cat-banner.jpg', 1),
(7, 'Smart Phone & Table', 'smart-phone-and-table', 1, '1557377810mobile.png', '1573626346cat-banner.jpg', 1),
(8, 'Sport & Outdoor', 'sport-and-Outdoor', 1, '1557807258sports.png', '1573626353cat-banner.jpg', 1),
(9, 'Jewelry & Watches', 'jewelry-and-watches', 1, '1557807252furniture.png', '1573626296cat-banner.jpg', 1),
(10, 'Health & Beauty', 'health-and-beauty', 1, '1557807228trends.png', '1573626302cat-banner.jpg', 1),
(11, 'Books & Office', 'books-and-office', 1, '1557377917bags.png', '1573626308cat-banner.jpg', 1),
(12, 'Toys & Hobbies', 'toys-and-hobbies', 1, '1557807214sports.png', '1573626313cat-banner.jpg', 1),
(15, 'Automobiles', 'automobiles-and-motorcycles', 1, '1568708648motor.car.png', '1573626289cat-banner.jpg', 1),
(16, 'Home decoration', 'Home-decoration-and-Appliance', 1, '1568708757home.png', '1573626283cat-banner.jpg', 1),
(17, 'Portable & Personal', 'portable-and-personal-electronics', 1, '1568878538electronic.jpg', '1573626276cat-banner.jpg', 1),
(18, 'Outdoor, Recreation', 'Outdoor-Recreation-and-Fitness', 1, '1568878596home.jpg', '1573626270cat-banner.jpg', 1),
(19, 'Surveillance Safety', 'Surveillance-Safety-and-Security', 1, '1573624409icon.png', '1573626259cat-banner.jpg', 1);

-- --------------------------------------------------------

--
-- Table structure for table `childcategories`
--

CREATE TABLE `childcategories` (
  `id` int(191) NOT NULL,
  `subcategory_id` int(191) NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `language_id` int(191) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `childcategories`
--

INSERT INTO `childcategories` (`id`, `subcategory_id`, `name`, `slug`, `status`, `language_id`) VALUES
(1, 2, 'LCD TV', 'lcd-tv', 1, 1),
(2, 2, 'LED TV', 'led-tv', 1, 1),
(3, 2, 'Curved TV', 'curved-tv', 1, 1),
(4, 2, 'Plasma TV', 'plasma-tv', 1, 1),
(5, 3, 'Top Freezer', 'top-freezer', 1, 1),
(6, 3, 'Side-by-Side', 'side-by-side', 1, 1),
(7, 3, 'Counter-Depth', 'counter-depth', 1, 1),
(8, 3, 'Mini Fridge', 'mini-fridge', 1, 1),
(9, 4, 'Front Loading', 'front-loading', 1, 1),
(10, 4, 'Top Loading', 'top-loading', 1, 1),
(11, 4, 'Washer Dryer Combo', 'washer-dryer-combo', 1, 1),
(12, 4, 'Laundry Center', 'laundry-center', 1, 1),
(13, 5, 'Central Air', 'central-air', 1, 1),
(14, 5, 'Window Air', 'window-air', 1, 1),
(15, 5, 'Portable Air', 'portable-air', 1, 1),
(16, 5, 'Hybrid Air', 'hybrid-air', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `id` int(191) NOT NULL,
  `user_id` int(191) UNSIGNED NOT NULL,
  `product_id` int(191) UNSIGNED NOT NULL,
  `text` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `conversations`
--

CREATE TABLE `conversations` (
  `id` int(191) NOT NULL,
  `subject` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `sent_user` int(191) NOT NULL,
  `recieved_user` int(191) NOT NULL,
  `message` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `counters`
--

CREATE TABLE `counters` (
  `id` int(11) NOT NULL,
  `type` enum('referral','browser') NOT NULL DEFAULT 'referral',
  `referral` varchar(255) DEFAULT NULL,
  `total_count` int(11) NOT NULL DEFAULT 0,
  `todays_count` int(11) NOT NULL DEFAULT 0,
  `today` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `counters`
--

INSERT INTO `counters` (`id`, `type`, `referral`, `total_count`, `todays_count`, `today`) VALUES
(1, 'referral', 'www.facebook.com', 5, 0, NULL),
(2, 'referral', 'geniusocean.com', 926, 0, NULL),
(3, 'browser', 'Windows 10', 6513, 0, NULL),
(4, 'browser', 'Linux', 245, 0, NULL),
(5, 'browser', 'Unknown OS Platform', 742, 0, NULL),
(6, 'browser', 'Windows 7', 485, 0, NULL),
(7, 'referral', 'yandex.ru', 15, 0, NULL),
(8, 'browser', 'Windows 8.1', 556, 0, NULL),
(9, 'referral', 'www.google.com', 8, 0, NULL),
(10, 'browser', 'Android', 502, 0, NULL),
(11, 'browser', 'Mac OS X', 571, 0, NULL),
(12, 'referral', 'l.facebook.com', 4, 0, NULL),
(13, 'referral', 'codecanyon.net', 6, 0, NULL),
(14, 'browser', 'Windows XP', 2, 0, NULL),
(15, 'browser', 'Windows 8', 3, 0, NULL),
(16, 'browser', 'iPad', 6, 0, NULL),
(17, 'browser', 'Ubuntu', 7, 0, NULL),
(18, 'browser', 'iPhone', 26, 0, NULL),
(19, 'referral', 'www.sandbox.paypal.com', 4, 0, NULL),
(20, 'referral', 'baidu.com', 1, 0, NULL),
(21, 'referral', 'org.telegram.messenger', 3, 0, NULL),
(22, 'referral', 'm.facebook.com', 7, 0, NULL),
(23, 'referral', 'ravemodal-dev.herokuapp.com', 1, 0, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `countries`
--

CREATE TABLE `countries` (
  `id` int(11) NOT NULL,
  `country_code` varchar(2) NOT NULL DEFAULT '',
  `country_name` varchar(100) NOT NULL DEFAULT '',
  `tax` double NOT NULL DEFAULT 0,
  `status` int(11) NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `countries`
--

INSERT INTO `countries` (`id`, `country_code`, `country_name`, `tax`, `status`) VALUES
(1, 'AF', 'Afghanistan', 0, 1),
(2, 'AL', 'Albania', 0, 1),
(3, 'DZ', 'Algeria', 0, 0),
(4, 'DS', 'American Samoa', 0, 0),
(5, 'AD', 'Andorra', 0, 0),
(6, 'AO', 'Angola', 0, 0),
(7, 'AI', 'Anguilla', 0, 0),
(8, 'AQ', 'Antarctica', 0, 0),
(9, 'AG', 'Antigua and Barbuda', 0, 0),
(10, 'AR', 'Argentina', 0, 0),
(11, 'AM', 'Armenia', 0, 0),
(12, 'AW', 'Aruba', 0, 0),
(13, 'AU', 'Australia', 0, 1),
(14, 'AT', 'Austria', 0, 1),
(15, 'AZ', 'Azerbaijan', 0, 0),
(16, 'BS', 'Bahamas', 0, 0),
(17, 'BH', 'Bahrain', 0, 0),
(18, 'BD', 'Bangladesh', 0, 1),
(19, 'BB', 'Barbados', 0, 0),
(20, 'BY', 'Belarus', 0, 1),
(21, 'BE', 'Belgium', 0, 0),
(22, 'BZ', 'Belize', 0, 0),
(23, 'BJ', 'Benin', 0, 0),
(24, 'BM', 'Bermuda', 0, 0),
(25, 'BT', 'Bhutan', 0, 0),
(26, 'BO', 'Bolivia', 0, 0),
(27, 'BA', 'Bosnia and Herzegovina', 0, 0),
(28, 'BW', 'Botswana', 0, 0),
(29, 'BV', 'Bouvet Island', 0, 0),
(30, 'BR', 'Brazil', 0, 0),
(31, 'IO', 'British Indian Ocean Territory', 0, 0),
(32, 'BN', 'Brunei Darussalam', 0, 0),
(33, 'BG', 'Bulgaria', 0, 0),
(34, 'BF', 'Burkina Faso', 0, 0),
(35, 'BI', 'Burundi', 0, 0),
(36, 'KH', 'Cambodia', 0, 0),
(37, 'CM', 'Cameroon', 0, 0),
(38, 'CA', 'Canada', 0, 0),
(39, 'CV', 'Cape Verde', 0, 0),
(40, 'KY', 'Cayman Islands', 0, 0),
(41, 'CF', 'Central African Republic', 0, 0),
(42, 'TD', 'Chad', 0, 0),
(43, 'CL', 'Chile', 0, 0),
(44, 'CN', 'China', 0, 0),
(45, 'CX', 'Christmas Island', 0, 0),
(46, 'CC', 'Cocos (Keeling) Islands', 0, 0),
(47, 'CO', 'Colombia', 0, 0),
(48, 'KM', 'Comoros', 0, 0),
(49, 'CD', 'Democratic Republic of the Congo', 0, 0),
(50, 'CG', 'Republic of Congo', 0, 0),
(51, 'CK', 'Cook Islands', 0, 0),
(52, 'CR', 'Costa Rica', 0, 0),
(53, 'HR', 'Croatia (Hrvatska)', 0, 0),
(54, 'CU', 'Cuba', 0, 0),
(55, 'CY', 'Cyprus', 0, 0),
(56, 'CZ', 'Czech Republic', 0, 0),
(57, 'DK', 'Denmark', 0, 0),
(58, 'DJ', 'Djibouti', 0, 0),
(59, 'DM', 'Dominica', 0, 0),
(60, 'DO', 'Dominican Republic', 0, 0),
(61, 'TP', 'East Timor', 0, 0),
(62, 'EC', 'Ecuador', 0, 0),
(63, 'EG', 'Egypt', 0, 0),
(64, 'SV', 'El Salvador', 0, 0),
(65, 'GQ', 'Equatorial Guinea', 0, 0),
(66, 'ER', 'Eritrea', 0, 0),
(67, 'EE', 'Estonia', 0, 0),
(68, 'ET', 'Ethiopia', 0, 0),
(69, 'FK', 'Falkland Islands (Malvinas)', 0, 0),
(70, 'FO', 'Faroe Islands', 0, 0),
(71, 'FJ', 'Fiji', 0, 0),
(72, 'FI', 'Finland', 0, 0),
(73, 'FR', 'France', 0, 0),
(74, 'FX', 'France, Metropolitan', 0, 0),
(75, 'GF', 'French Guiana', 0, 0),
(76, 'PF', 'French Polynesia', 0, 0),
(77, 'TF', 'French Southern Territories', 0, 0),
(78, 'GA', 'Gabon', 0, 0),
(79, 'GM', 'Gambia', 0, 0),
(80, 'GE', 'Georgia', 0, 0),
(81, 'DE', 'Germany', 0, 0),
(82, 'GH', 'Ghana', 0, 0),
(83, 'GI', 'Gibraltar', 0, 0),
(84, 'GK', 'Guernsey', 0, 0),
(85, 'GR', 'Greece', 0, 0),
(86, 'GL', 'Greenland', 0, 0),
(87, 'GD', 'Grenada', 0, 0),
(88, 'GP', 'Guadeloupe', 0, 0),
(89, 'GU', 'Guam', 0, 0),
(90, 'GT', 'Guatemala', 0, 0),
(91, 'GN', 'Guinea', 0, 0),
(92, 'GW', 'Guinea-Bissau', 0, 0),
(93, 'GY', 'Guyana', 0, 0),
(94, 'HT', 'Haiti', 0, 0),
(95, 'HM', 'Heard and Mc Donald Islands', 0, 0),
(96, 'HN', 'Honduras', 0, 0),
(97, 'HK', 'Hong Kong', 0, 0),
(98, 'HU', 'Hungary', 0, 0),
(99, 'IS', 'Iceland', 0, 0),
(100, 'IN', 'India', 0, 1),
(101, 'IM', 'Isle of Man', 0, 0),
(102, 'ID', 'Indonesia', 0, 0),
(103, 'IR', 'Iran (Islamic Republic of)', 0, 0),
(104, 'IQ', 'Iraq', 0, 0),
(105, 'IE', 'Ireland', 0, 0),
(106, 'IL', 'Israel', 0, 0),
(107, 'IT', 'Italy', 0, 0),
(108, 'CI', 'Ivory Coast', 0, 0),
(109, 'JE', 'Jersey', 0, 0),
(110, 'JM', 'Jamaica', 0, 0),
(111, 'JP', 'Japan', 0, 0),
(112, 'JO', 'Jordan', 0, 0),
(113, 'KZ', 'Kazakhstan', 0, 0),
(114, 'KE', 'Kenya', 0, 0),
(115, 'KI', 'Kiribati', 0, 0),
(116, 'KP', 'Korea, Democratic People\'s Republic of', 0, 0),
(117, 'KR', 'Korea, Republic of', 0, 0),
(118, 'XK', 'Kosovo', 0, 0),
(119, 'KW', 'Kuwait', 0, 0),
(120, 'KG', 'Kyrgyzstan', 0, 0),
(121, 'LA', 'Lao People\'s Democratic Republic', 0, 0),
(122, 'LV', 'Latvia', 0, 0),
(123, 'LB', 'Lebanon', 0, 0),
(124, 'LS', 'Lesotho', 0, 0),
(125, 'LR', 'Liberia', 0, 0),
(126, 'LY', 'Libyan Arab Jamahiriya', 0, 0),
(127, 'LI', 'Liechtenstein', 0, 0),
(128, 'LT', 'Lithuania', 0, 0),
(129, 'LU', 'Luxembourg', 0, 0),
(130, 'MO', 'Macau', 0, 0),
(131, 'MK', 'North Macedonia', 0, 0),
(132, 'MG', 'Madagascar', 0, 0),
(133, 'MW', 'Malawi', 0, 0),
(134, 'MY', 'Malaysia', 0, 0),
(135, 'MV', 'Maldives', 0, 0),
(136, 'ML', 'Mali', 0, 0),
(137, 'MT', 'Malta', 0, 0),
(138, 'MH', 'Marshall Islands', 0, 0),
(139, 'MQ', 'Martinique', 0, 0),
(140, 'MR', 'Mauritania', 0, 0),
(141, 'MU', 'Mauritius', 0, 0),
(142, 'TY', 'Mayotte', 0, 0),
(143, 'MX', 'Mexico', 0, 0),
(144, 'FM', 'Micronesia, Federated States of', 0, 0),
(145, 'MD', 'Moldova, Republic of', 0, 0),
(146, 'MC', 'Monaco', 0, 0),
(147, 'MN', 'Mongolia', 0, 0),
(148, 'ME', 'Montenegro', 0, 0),
(149, 'MS', 'Montserrat', 0, 0),
(150, 'MA', 'Morocco', 0, 0),
(151, 'MZ', 'Mozambique', 0, 0),
(152, 'MM', 'Myanmar', 0, 0),
(153, 'NA', 'Namibia', 0, 0),
(154, 'NR', 'Nauru', 0, 0),
(155, 'NP', 'Nepal', 0, 0),
(156, 'NL', 'Netherlands', 0, 0),
(157, 'AN', 'Netherlands Antilles', 0, 0),
(158, 'NC', 'New Caledonia', 0, 0),
(159, 'NZ', 'New Zealand', 0, 0),
(160, 'NI', 'Nicaragua', 0, 0),
(161, 'NE', 'Niger', 0, 0),
(162, 'NG', 'Nigeria', 0, 0),
(163, 'NU', 'Niue', 0, 0),
(164, 'NF', 'Norfolk Island', 0, 0),
(165, 'MP', 'Northern Mariana Islands', 0, 0),
(166, 'NO', 'Norway', 0, 0),
(167, 'OM', 'Oman', 0, 0),
(168, 'PK', 'Pakistan', 0, 0),
(169, 'PW', 'Palau', 0, 0),
(170, 'PS', 'Palestine', 0, 0),
(171, 'PA', 'Panama', 0, 0),
(172, 'PG', 'Papua New Guinea', 0, 0),
(173, 'PY', 'Paraguay', 0, 0),
(174, 'PE', 'Peru', 0, 0),
(175, 'PH', 'Philippines', 0, 0),
(176, 'PN', 'Pitcairn', 0, 0),
(177, 'PL', 'Poland', 0, 0),
(178, 'PT', 'Portugal', 0, 0),
(179, 'PR', 'Puerto Rico', 0, 0),
(180, 'QA', 'Qatar', 0, 0),
(181, 'RE', 'Reunion', 0, 0),
(182, 'RO', 'Romania', 0, 0),
(183, 'RU', 'Russian Federation', 0, 1),
(184, 'RW', 'Rwanda', 0, 0),
(185, 'KN', 'Saint Kitts and Nevis', 0, 0),
(186, 'LC', 'Saint Lucia', 0, 0),
(187, 'VC', 'Saint Vincent and the Grenadines', 0, 0),
(188, 'WS', 'Samoa', 0, 0),
(189, 'SM', 'San Marino', 0, 0),
(190, 'ST', 'Sao Tome and Principe', 0, 0),
(191, 'SA', 'Saudi Arabia', 0, 0),
(192, 'SN', 'Senegal', 0, 0),
(193, 'RS', 'Serbia', 0, 0),
(194, 'SC', 'Seychelles', 0, 0),
(195, 'SL', 'Sierra Leone', 0, 0),
(196, 'SG', 'Singapore', 0, 0),
(197, 'SK', 'Slovakia', 0, 0),
(198, 'SI', 'Slovenia', 0, 0),
(199, 'SB', 'Solomon Islands', 0, 0),
(200, 'SO', 'Somalia', 0, 0),
(201, 'ZA', 'South Africa', 0, 0),
(202, 'GS', 'South Georgia South Sandwich Islands', 0, 0),
(203, 'SS', 'South Sudan', 0, 0),
(204, 'ES', 'Spain', 0, 0),
(205, 'LK', 'Sri Lanka', 0, 0),
(206, 'SH', 'St. Helena', 0, 0),
(207, 'PM', 'St. Pierre and Miquelon', 0, 0),
(208, 'SD', 'Sudan', 0, 0),
(209, 'SR', 'Suriname', 0, 0),
(210, 'SJ', 'Svalbard and Jan Mayen Islands', 0, 0),
(211, 'SZ', 'Swaziland', 0, 0),
(212, 'SE', 'Sweden', 0, 0),
(213, 'CH', 'Switzerland', 0, 0),
(214, 'SY', 'Syrian Arab Republic', 0, 0),
(215, 'TW', 'Taiwan', 0, 0),
(216, 'TJ', 'Tajikistan', 0, 0),
(217, 'TZ', 'Tanzania, United Republic of', 0, 0),
(218, 'TH', 'Thailand', 0, 0),
(219, 'TG', 'Togo', 0, 0),
(220, 'TK', 'Tokelau', 0, 0),
(221, 'TO', 'Tonga', 0, 0),
(222, 'TT', 'Trinidad and Tobago', 0, 0),
(223, 'TN', 'Tunisia', 0, 0),
(224, 'TR', 'Turkey', 0, 0),
(225, 'TM', 'Turkmenistan', 0, 0),
(226, 'TC', 'Turks and Caicos Islands', 0, 0),
(227, 'TV', 'Tuvalu', 0, 0),
(228, 'UG', 'Uganda', 0, 1),
(229, 'UA', 'Ukraine', 0, 0),
(230, 'AE', 'United Arab Emirates', 0, 0),
(231, 'GB', 'United Kingdom', 0, 1),
(232, 'US', 'United States', 0, 1),
(233, 'UM', 'United States minor outlying islands', 0, 0),
(234, 'UY', 'Uruguay', 0, 0),
(235, 'UZ', 'Uzbekistan', 0, 0),
(236, 'VU', 'Vanuatu', 0, 0),
(237, 'VA', 'Vatican City State', 2, 1),
(238, 'VE', 'Venezuela', 0, 1),
(239, 'VN', 'Vietnam', 0, 1),
(240, 'VG', 'Virgin Islands (British)', 0, 1),
(241, 'VI', 'Virgin Islands (U.S.)', 0, 1),
(242, 'WF', 'Wallis and Futuna Islands', 0, 1),
(243, 'EH', 'Western Sahara', 0, 1),
(244, 'YE', 'Yemen', 0, 1),
(245, 'ZM', 'Zambia', 5, 1),
(246, 'ZW', 'Zimbabwe', 36, 1);

-- --------------------------------------------------------

--
-- Table structure for table `coupons`
--

CREATE TABLE `coupons` (
  `id` int(11) NOT NULL,
  `code` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` tinyint(4) NOT NULL,
  `price` double NOT NULL,
  `times` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `used` int(191) UNSIGNED NOT NULL DEFAULT 0,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `coupon_type` varchar(255) DEFAULT NULL,
  `category` int(11) DEFAULT NULL,
  `sub_category` int(11) DEFAULT NULL,
  `child_category` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `currencies`
--

CREATE TABLE `currencies` (
  `id` int(191) NOT NULL,
  `name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `sign` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` double NOT NULL,
  `is_default` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `currencies`
--

INSERT INTO `currencies` (`id`, `name`, `sign`, `value`, `is_default`) VALUES
(1, 'USD', '$', 1, 1),
(4, 'BDT', '৳', 84.63, 0),
(6, 'EUR', '€', 0.89, 0),
(8, 'INR', '₹', 68.95, 0),
(9, 'NGN', '₦', 363.919, 0),
(10, 'BRL', 'R$', 4.02, 0);

-- --------------------------------------------------------

--
-- Table structure for table `deposits`
--

CREATE TABLE `deposits` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `currency` blob DEFAULT NULL,
  `currency_code` varchar(255) DEFAULT NULL,
  `amount` double DEFAULT 0,
  `currency_value` double DEFAULT 0,
  `method` varchar(255) DEFAULT NULL,
  `txnid` varchar(255) DEFAULT NULL,
  `flutter_id` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `email_templates`
--

CREATE TABLE `email_templates` (
  `id` int(11) NOT NULL,
  `email_type` varchar(255) DEFAULT NULL,
  `email_subject` mediumtext DEFAULT NULL,
  `email_body` longtext DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `email_templates`
--

INSERT INTO `email_templates` (`id`, `email_type`, `email_subject`, `email_body`, `status`) VALUES
(1, 'new_order', 'Your Order Placed Successfully', '<p>Hello {customer_name},<br>Your Order Number is {order_number}<br>Your order has been placed successfully</p>', 1),
(2, 'new_registration', 'Welcome To Royal Cart', '<p>Hello {customer_name},<br>You have successfully registered to {website_title}, We wish you will have a wonderful experience using our service.</p><p>Thank You<br></p>', 1),
(3, 'vendor_accept', 'Your Vendor Account Activated', '<p>Hello {customer_name},<br>Your Vendor Account Activated Successfully. Please Login to your account and build your own shop.</p><p>Thank You<br></p>', 1),
(4, 'subscription_warning', 'Your subscrption plan will end after five days', '<p>Hello {customer_name},<br>Your subscription plan duration will end after five days. Please renew your plan otherwise all of your products will be deactivated.</p><p>Thank You<br></p>', 1),
(5, 'vendor_verification', 'Request for verification.', '<p>Hello {customer_name},<br>You are requested verify your account. Please send us photo of your passport.</p><p>Thank You<br></p>', 1),
(6, 'wallet_deposit', 'Balance Added to Your Account.', '<p>Hello {customer_name},<br>${deposit_amount} has been deposited in your account. Your current balance is ${wallet_balance}</p><p>Thank You<br></p>', 1);

-- --------------------------------------------------------

--
-- Table structure for table `faqs`
--

CREATE TABLE `faqs` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(191) NOT NULL,
  `details` text NOT NULL,
  `language_id` int(191) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `faqs`
--

INSERT INTO `faqs` (`id`, `title`, `details`, `language_id`) VALUES
(1, 'Right my front it wound cause fully', '<div style=\"text-align: justify;\">Nam enim risus, molestie et, porta ac, aliquam ac, risus. Quisque lobortis. Phasellus pellentesque purus in massa. Aenean in pede. Phasellus ac libero ac tellus pellentesque semper. Sed ac felis. Sed commodo, magna quis lacinia ornare, quam ante aliquam nisi, eu iaculis leo purus venenatis dui.</div>', 1),
(3, 'Man particular insensible celebrated', '<div style=\"text-align: justify;\"><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Arial, sans-serif;\">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut tincidunt, odio vitae elementum ultricies, mauris massa auctor ipsum, vitae finibus odio eros et dui. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Suspendisse potenti. Cras nec nisl ultricies, vestibulum turpis a, cursus erat. Sed lectus turpis, aliquam eget posuere a, congue non risus. Proin consequat, felis id venenatis porttitor, est lorem luctus nulla, a vehicula orci tortor eget erat. Nunc nec sodales mauris, in scelerisque libero. Proin urna felis, egestas id malesuada non, interdum ut mi. Morbi diam lorem, maximus in felis non, fringilla mollis urna.</p><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Arial, sans-serif;\">Vestibulum pulvinar arcu eget ligula dictum, ac dignissim eros aliquam. Vivamus id elementum mauris. Vivamus iaculis nisi erat, at egestas diam rhoncus eget. Suspendisse at metus quam. Nullam egestas dolor nec est elementum tempus et sit amet est. Vestibulum eu diam sit amet enim varius efficitur. Proin laoreet sapien ac lacus euismod, et malesuada nibh consectetur.</p></div>', 1),
(4, 'Civilly why how end viewing related', '<div style=\"text-align: justify;\"><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Arial, sans-serif;\">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut tincidunt, odio vitae elementum ultricies, mauris massa auctor ipsum, vitae finibus odio eros et dui. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Suspendisse potenti. Cras nec nisl ultricies, vestibulum turpis a, cursus erat. Sed lectus turpis, aliquam eget posuere a, congue non risus. Proin consequat, felis id venenatis porttitor, est lorem luctus nulla, a vehicula orci tortor eget erat. Nunc nec sodales mauris, in scelerisque libero. Proin urna felis, egestas id malesuada non, interdum ut mi. Morbi diam lorem, maximus in felis non, fringilla mollis urna.</p><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Arial, sans-serif;\">Vestibulum pulvinar arcu eget ligula dictum, ac dignissim eros aliquam. Vivamus id elementum mauris. Vivamus iaculis nisi erat, at egestas diam rhoncus eget. Suspendisse at metus quam. Nullam egestas dolor nec est elementum tempus et sit amet est. Vestibulum eu diam sit amet enim varius efficitur. Proin laoreet sapien ac lacus euismod, et malesuada nibh consectetur.</p></div>', 1),
(5, 'Six started far placing saw respect', '<div style=\"text-align: justify;\"><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Arial, sans-serif;\">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut tincidunt, odio vitae elementum ultricies, mauris massa auctor ipsum, vitae finibus odio eros et dui. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Suspendisse potenti. Cras nec nisl ultricies, vestibulum turpis a, cursus erat. Sed lectus turpis, aliquam eget posuere a, congue non risus. Proin consequat, felis id venenatis porttitor, est lorem luctus nulla, a vehicula orci tortor eget erat. Nunc nec sodales mauris, in scelerisque libero. Proin urna felis, egestas id malesuada non, interdum ut mi. Morbi diam lorem, maximus in felis non, fringilla mollis urna.</p><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Arial, sans-serif;\">Vestibulum pulvinar arcu eget ligula dictum, ac dignissim eros aliquam. Vivamus id elementum mauris. Vivamus iaculis nisi erat, at egestas diam rhoncus eget. Suspendisse at metus quam. Nullam egestas dolor nec est elementum tempus et sit amet est. Vestibulum eu diam sit amet enim varius efficitur. Proin laoreet sapien ac lacus euismod, et malesuada nibh consectetur.</p></div>', 1),
(6, 'She jointure goodness interest debat', '<div style=\"text-align: center;\"><div style=\"text-align: justify;\"><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; color: rgb(0, 0, 0); font-family: \" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;\"=\"\">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut tincidunt, odio vitae elementum ultricies, mauris massa auctor ipsum, vitae finibus odio eros et dui. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Suspendisse potenti. Cras nec nisl ultricies, vestibulum turpis a, cursus erat. Sed lectus turpis, aliquam eget posuere a, congue non risus. Proin consequat, felis id venenatis porttitor, est lorem luctus nulla, a vehicula orci tortor eget erat. Nunc nec sodales mauris, in scelerisque libero. Proin urna felis, egestas id malesuada non, interdum ut mi. Morbi diam lorem, maximus in felis non, fringilla mollis urna.</p><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; color: rgb(0, 0, 0); font-family: \" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;\"=\"\">Vestibulum pulvinar arcu eget ligula dictum, ac dignissim eros aliquam. Vivamus id elementum mauris. Vivamus iaculis nisi erat, at egestas diam rhoncus eget. Suspendisse at metus quam. Nullam egestas dolor nec est elementum tempus et sit amet est. Vestibulum eu diam sit amet enim varius efficitur. Proin laoreet sapien ac lacus euismod, et malesuada nibh consectetur.</p></div></div>', 1),
(7, 'Duis eu molestie quam, sed rhoncus nibh', '<p open=\"\" sans\",=\"\" arial,=\"\" sans-serif;\"=\"\" style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; color: rgb(0, 0, 0); text-align: justify; padding: 0px;\">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut tincidunt, odio vitae elementum ultricies, mauris massa auctor ipsum, vitae finibus odio eros et dui. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Suspendisse potenti. Cras nec nisl ultricies, vestibulum turpis a, cursus erat. Sed lectus turpis, aliquam eget posuere a, congue non risus. Proin consequat, felis id venenatis porttitor, est lorem luctus nulla, a vehicula orci tortor eget erat. Nunc nec sodales mauris, in scelerisque libero. Proin urna felis, egestas id malesuada non, interdum ut mi. Morbi diam lorem, maximus in felis non, fringilla mollis urna.</p><p open=\"\" sans\",=\"\" arial,=\"\" sans-serif;\"=\"\" style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; color: rgb(0, 0, 0); text-align: justify; padding: 0px;\">Vestibulum pulvinar arcu eget ligula dictum, ac dignissim eros aliquam. Vivamus id elementum mauris. Vivamus iaculis nisi erat, at egestas diam rhoncus eget. Suspendisse at metus quam. Nullam egestas dolor nec est elementum tempus et sit amet est. Vestibulum eu diam sit amet enim varius efficitur. Proin laoreet sapien ac lacus euismod, et malesuada nibh consectetur.</p>', 1);

-- --------------------------------------------------------

--
-- Table structure for table `favorite_sellers`
--

CREATE TABLE `favorite_sellers` (
  `id` int(191) NOT NULL,
  `user_id` int(191) NOT NULL,
  `vendor_id` int(191) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `fonts`
--

CREATE TABLE `fonts` (
  `id` int(11) NOT NULL,
  `is_default` tinyint(4) DEFAULT 0,
  `font_family` varchar(100) DEFAULT NULL,
  `font_value` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `fonts`
--

INSERT INTO `fonts` (`id`, `is_default`, `font_family`, `font_value`) VALUES
(1, 1, 'Roboto', 'Roboto'),
(3, 0, 'Roboto Mono', 'Roboto+Mono'),
(4, 0, 'Libre Caslon Display', 'Libre+Caslon+Display'),
(5, 0, 'Pangolin', 'Pangolin'),
(6, 0, 'Dancing Script', 'Dancing+Script'),
(7, 0, 'Open Sans', 'Open+Sans');

-- --------------------------------------------------------

--
-- Table structure for table `galleries`
--

CREATE TABLE `galleries` (
  `id` int(191) UNSIGNED NOT NULL,
  `product_id` int(191) UNSIGNED NOT NULL,
  `photo` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `galleries`
--

INSERT INTO `galleries` (`id`, `product_id`, `photo`) VALUES
(86, 109, '1568026737EBGSE78G.jpg'),
(87, 109, '1568026737B8hO1RRr.jpg'),
(88, 109, '1568026737tf0rwVoz.jpg'),
(89, 109, '1568026737GGIPSqYo.jpg'),
(95, 107, '1568026797FFNrNPxK.jpg'),
(96, 107, '1568026797UwY9ZLfQ.jpg'),
(97, 107, '1568026797Kl6eZLx5.jpg'),
(98, 107, '1568026797h3R48VaO.jpg'),
(99, 107, '15680267989kXwH40I.jpg'),
(125, 122, '1568027503rFK94cnU.jpg'),
(126, 122, '1568027503i1X2FtIi.jpg'),
(127, 122, '156802750316jxawoZ.jpg'),
(128, 122, '1568027503QRBf290F.jpg'),
(129, 121, '1568027539SQqUc8Bu.jpg'),
(130, 121, '1568027539Zs5OTzjq.jpg'),
(131, 121, '1568027539C45VRZq1.jpg'),
(132, 121, '15680275398ovCzFnJ.jpg'),
(133, 120, '1568027565bJgX744G.jpg'),
(134, 120, '1568027565j0RPFUgX.jpg'),
(135, 120, '1568027565QGi6Lhyo.jpg'),
(136, 120, '15680275658MAY3VKp.jpg'),
(137, 119, '1568027610p9R6ivC6.jpg'),
(138, 119, '1568027610t2Aq7E5D.jpg'),
(139, 119, '1568027611ikz4n0fx.jpg'),
(140, 119, '15680276117BLgrCub.jpg'),
(141, 118, '156802763634t0c8tG.jpg'),
(142, 118, '1568027636fuJplSf3.jpg'),
(143, 118, '1568027636MXcgCQHU.jpg'),
(144, 118, '1568027636lfexGTpt.jpg'),
(145, 117, '1568027665rFHWlsAJ.jpg'),
(146, 117, '15680276655LPktA9k.jpg'),
(147, 117, '1568027665vcNWWq3u.jpg'),
(148, 117, '1568027665gQnqKhCw.jpg'),
(149, 116, '1568027692FPQpwtWN.jpg'),
(150, 116, '1568027692zBaGjOIC.jpg'),
(151, 116, '1568027692UXpDx63F.jpg'),
(152, 116, '1568027692KdIWbIGK.jpg'),
(153, 95, '1568027743xS8gHocM.jpg'),
(154, 95, '1568027743aVUOljdD.jpg'),
(155, 95, '156802774327OOA1Zj.jpg'),
(156, 95, '1568027743kGBx6mxa.jpg'),
(187, 112, '1568029210JSAwjRPr.jpg'),
(188, 112, '1568029210EiVUkcK6.jpg'),
(189, 112, '1568029210fJSo5hya.jpg'),
(190, 112, '15680292101vCcGfq8.jpg'),
(191, 111, '1568029272lB0JETcn.jpg'),
(192, 111, '1568029272wF3ldKgv.jpg'),
(193, 111, '1568029272NI33ExCu.jpg'),
(194, 111, '15680292724TXrpokz.jpg'),
(217, 159, '1570085246audi-automobile-car-909907.jpg'),
(218, 159, '1570085246automobile-automotive-car-112460.jpg'),
(274, 178, '1639377201kIRW1EDl.jpg'),
(275, 178, '16393772019VK5FLtl.jpg'),
(276, 178, '1639377201krle8zlu.jpg'),
(277, 175, '16393776956AA40xFx.jpg'),
(278, 175, '16393776955klqsJ7E.jpg'),
(279, 175, '1639377695kWR5DE5x.jpg'),
(280, 169, '1639377747A3Pknjfy.jpg'),
(281, 169, '1639377747dxsp2VSK.jpg'),
(282, 164, '16393780458Yr3ZAOE.jpg'),
(283, 164, '1639378045UMFwFsPS.jpg'),
(284, 164, '16393780453ZLjK3mm.jpg'),
(285, 163, '1639378095FKuTnjNm.jpg'),
(286, 163, '1639378095fjzWQrCS.jpg'),
(287, 163, '16393780950yzaxhTO.jpg'),
(288, 162, '1639378165t5CzXscD.jpg'),
(289, 162, '1639378165qI2PTBtC.jpg'),
(290, 162, '1639378165jYceIttx.jpg'),
(291, 161, '1639378430m3XEmUer.jpg'),
(292, 161, '1639378430qqzusNiP.jpg'),
(293, 161, '1639378430euqFZ796.jpg'),
(294, 160, '1639392393qABYd9Jp.jpg'),
(295, 160, '1639392393M7WZcZyF.jpg'),
(296, 160, '1639392394NcXuluij.jpg'),
(297, 144, '1639392542Hi8kqofd.jpg'),
(298, 144, '1639392543aNErwy42.jpg'),
(299, 144, '1639392543TClWju2X.jpg'),
(303, 135, '1639392748zU2kggIw.jpg'),
(304, 135, '1639392748KS5BV2nQ.jpg'),
(305, 135, '1639392748T3zkUMnp.jpg'),
(309, 114, '16394527172MC08Ov5.jpg'),
(310, 114, '1639452717EByuwyqy.jpg'),
(311, 114, '1639452717nNfXnbRZ.jpg'),
(312, 128, '16394564079EvhKQXl.jpg'),
(313, 128, '1639456407vtTRoAr7.jpg'),
(314, 128, '1639456408cd9XLUJ1.jpg'),
(326, 170, '1646901584l8MraaNk.jpg'),
(327, 170, '1646901584I1CFhs35.jpg'),
(328, 170, '1646901584Okkqp3E2.jpg'),
(329, 170, '1646901585daDTZaH9.jpg'),
(330, 168, '1648013520wLz6NjQ8.jpg'),
(331, 168, '1648013521CUVnKkuW.jpg'),
(332, 168, '1648013521ZCJGdOET.jpg'),
(333, 168, '1648013521cfKHnzKx.jpg'),
(334, 168, '1648013521nwKHsHXv.jpg'),
(335, 165, '16480136903vx2nVLT.jpg'),
(336, 165, '1648013690zDZkb083.jpg'),
(337, 165, '1648013690prNoHG1K.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `generalsettings`
--

CREATE TABLE `generalsettings` (
  `id` bigint(20) NOT NULL,
  `logo` varchar(191) DEFAULT NULL,
  `favicon` varchar(191) NOT NULL,
  `title` varchar(191) NOT NULL,
  `colors` varchar(191) DEFAULT NULL,
  `loader` varchar(191) NOT NULL,
  `admin_loader` varchar(191) DEFAULT NULL,
  `is_talkto` tinyint(1) NOT NULL DEFAULT 1,
  `talkto` text DEFAULT NULL,
  `is_language` tinyint(1) NOT NULL DEFAULT 1,
  `is_loader` tinyint(1) NOT NULL DEFAULT 1,
  `is_disqus` tinyint(1) NOT NULL DEFAULT 0,
  `disqus` longtext DEFAULT NULL,
  `guest_checkout` tinyint(1) NOT NULL DEFAULT 0,
  `currency_format` tinyint(1) NOT NULL DEFAULT 0,
  `withdraw_fee` double NOT NULL DEFAULT 0,
  `withdraw_charge` double NOT NULL DEFAULT 0,
  `shipping_cost` double NOT NULL DEFAULT 0,
  `mail_driver` varchar(191) DEFAULT NULL,
  `mail_host` varchar(191) DEFAULT NULL,
  `mail_port` varchar(191) DEFAULT NULL,
  `mail_encryption` varchar(191) DEFAULT NULL,
  `mail_user` varchar(191) DEFAULT NULL,
  `mail_pass` varchar(191) DEFAULT NULL,
  `from_email` varchar(191) DEFAULT NULL,
  `from_name` varchar(191) DEFAULT NULL,
  `is_smtp` tinyint(1) NOT NULL DEFAULT 0,
  `is_comment` tinyint(1) NOT NULL DEFAULT 1,
  `is_currency` tinyint(1) NOT NULL DEFAULT 1,
  `is_affilate` tinyint(1) NOT NULL DEFAULT 1,
  `affilate_charge` int(100) NOT NULL DEFAULT 0,
  `affilate_banner` text DEFAULT NULL,
  `fixed_commission` double NOT NULL DEFAULT 0,
  `percentage_commission` double NOT NULL DEFAULT 0,
  `multiple_shipping` tinyint(1) NOT NULL DEFAULT 0,
  `multiple_packaging` tinyint(4) NOT NULL DEFAULT 0,
  `vendor_ship_info` tinyint(1) NOT NULL DEFAULT 0,
  `reg_vendor` tinyint(1) NOT NULL DEFAULT 0,
  `footer_color` varchar(191) DEFAULT NULL,
  `copyright_color` varchar(191) DEFAULT NULL,
  `copyright` varchar(255) DEFAULT NULL,
  `is_admin_loader` tinyint(1) NOT NULL DEFAULT 0,
  `is_verification_email` tinyint(1) NOT NULL DEFAULT 0,
  `wholesell` int(191) NOT NULL DEFAULT 0,
  `is_capcha` tinyint(1) NOT NULL DEFAULT 0,
  `capcha_secret_key` varchar(100) DEFAULT NULL,
  `capcha_site_key` varchar(100) DEFAULT NULL,
  `error_banner_404` varchar(191) DEFAULT NULL,
  `error_banner_500` varchar(191) DEFAULT NULL,
  `is_popup` tinyint(1) NOT NULL DEFAULT 0,
  `popup_background` text DEFAULT NULL,
  `breadcrumb_banner` varchar(500) DEFAULT NULL,
  `invoice_logo` varchar(191) DEFAULT NULL,
  `user_image` varchar(191) DEFAULT NULL,
  `vendor_color` varchar(191) DEFAULT NULL,
  `is_secure` tinyint(1) NOT NULL DEFAULT 0,
  `is_report` tinyint(1) NOT NULL,
  `footer_logo` text DEFAULT NULL,
  `show_stock` tinyint(1) NOT NULL DEFAULT 0,
  `is_maintain` tinyint(1) NOT NULL DEFAULT 0,
  `header_color` enum('light','dark') NOT NULL DEFAULT 'light',
  `maintain_text` text DEFAULT NULL,
  `is_buy_now` tinyint(4) NOT NULL,
  `version` varchar(40) DEFAULT NULL,
  `affilate_product` tinyint(1) NOT NULL DEFAULT 1,
  `verify_product` tinyint(1) NOT NULL DEFAULT 0,
  `page_count` int(11) NOT NULL DEFAULT 0,
  `flash_count` int(11) NOT NULL DEFAULT 0,
  `hot_count` int(11) NOT NULL DEFAULT 0,
  `new_count` int(11) NOT NULL DEFAULT 0,
  `sale_count` int(11) NOT NULL DEFAULT 0,
  `best_seller_count` int(11) NOT NULL DEFAULT 0,
  `popular_count` int(11) NOT NULL DEFAULT 0,
  `top_rated_count` int(11) NOT NULL DEFAULT 0,
  `big_save_count` int(11) NOT NULL DEFAULT 0,
  `trending_count` int(11) NOT NULL DEFAULT 0,
  `seller_product_count` int(11) NOT NULL DEFAULT 0,
  `wishlist_count` int(11) NOT NULL DEFAULT 0,
  `vendor_page_count` int(11) NOT NULL DEFAULT 0,
  `min_price` double NOT NULL DEFAULT 0,
  `max_price` double NOT NULL DEFAULT 0,
  `post_count` tinyint(1) NOT NULL DEFAULT 0,
  `product_page` text DEFAULT NULL,
  `wishlist_page` text DEFAULT NULL,
  `is_contact_seller` tinyint(1) NOT NULL DEFAULT 0,
  `is_debug` tinyint(1) NOT NULL DEFAULT 0,
  `decimal_separator` varchar(10) DEFAULT NULL,
  `thousand_separator` varchar(10) DEFAULT NULL,
  `is_cookie` tinyint(1) NOT NULL DEFAULT 0,
  `product_affilate` tinyint(1) NOT NULL DEFAULT 0,
  `product_affilate_bonus` int(10) NOT NULL DEFAULT 0,
  `is_reward` int(11) NOT NULL DEFAULT 0,
  `reward_point` int(11) NOT NULL DEFAULT 0,
  `reward_dolar` int(11) NOT NULL DEFAULT 0,
  `physical` tinyint(4) NOT NULL DEFAULT 1,
  `digital` tinyint(4) NOT NULL DEFAULT 1,
  `license` tinyint(4) NOT NULL DEFAULT 1,
  `affilite` tinyint(4) NOT NULL DEFAULT 1,
  `partner_title` varchar(250) DEFAULT NULL,
  `partner_text` longtext DEFAULT NULL,
  `deal_title` varchar(255) DEFAULT NULL,
  `deal_details` varchar(600) DEFAULT NULL,
  `deal_time` date DEFAULT NULL,
  `deal_background` varchar(500) DEFAULT NULL,
  `demo_content` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `generalsettings`
--

INSERT INTO `generalsettings` (`id`, `logo`, `favicon`, `title`, `colors`, `loader`, `admin_loader`, `is_talkto`, `talkto`, `is_language`, `is_loader`, `is_disqus`, `disqus`, `guest_checkout`, `currency_format`, `withdraw_fee`, `withdraw_charge`, `shipping_cost`, `mail_driver`, `mail_host`, `mail_port`, `mail_encryption`, `mail_user`, `mail_pass`, `from_email`, `from_name`, `is_smtp`, `is_comment`, `is_currency`, `is_affilate`, `affilate_charge`, `affilate_banner`, `fixed_commission`, `percentage_commission`, `multiple_shipping`, `multiple_packaging`, `vendor_ship_info`, `reg_vendor`, `footer_color`, `copyright_color`, `copyright`, `is_admin_loader`, `is_verification_email`, `wholesell`, `is_capcha`, `capcha_secret_key`, `capcha_site_key`, `error_banner_404`, `error_banner_500`, `is_popup`, `popup_background`, `breadcrumb_banner`, `invoice_logo`, `user_image`, `vendor_color`, `is_secure`, `is_report`, `footer_logo`, `show_stock`, `is_maintain`, `header_color`, `maintain_text`, `is_buy_now`, `version`, `affilate_product`, `verify_product`, `page_count`, `flash_count`, `hot_count`, `new_count`, `sale_count`, `best_seller_count`, `popular_count`, `top_rated_count`, `big_save_count`, `trending_count`, `seller_product_count`, `wishlist_count`, `vendor_page_count`, `min_price`, `max_price`, `post_count`, `product_page`, `wishlist_page`, `is_contact_seller`, `is_debug`, `decimal_separator`, `thousand_separator`, `is_cookie`, `product_affilate`, `product_affilate_bonus`, `is_reward`, `reward_point`, `reward_dolar`, `physical`, `digital`, `license`, `affilite`, `partner_title`, `partner_text`, `deal_title`, `deal_details`, `deal_time`, `deal_background`, `demo_content`) VALUES
(1, '16480137961571567295logopng.png', '16480155641571567283faviconpng.png', 'GeniusCart-new', '#424a4d', '1564224328loading3.gif', '1564224329loading3.gif', 0, 'Cillum eu id enim aliquip aute ullamco anim. Culpa deserunt nostrud excepteur voluptate velit ipsum esse enim.', 1, 1, 0, 'junnun', 1, 1, 5, 5, 5, 'smtp', 'smtp.mailtrap.io', '25', 'TLS', 'bc0787d74e8e64', 'd1e867c163fea6', 'test@junnun.royalscripts.com', 'GeniusTest', 1, 1, 1, 1, 10, '15587771131554048228onepiece.jpeg', 5, 5, 1, 1, 1, 1, '#143250', '#02020c', 'COPYRIGHT © 2020. All Rights Reserved By GeniusOcean', 1, 0, 6, 0, '6LcnPoEaAAAAACV_xC4jdPqumaYKBnxz9Sj6y0zk', '6LcnPoEaAAAAAF6QhKPZ8V4744yiEnr41li3SYDn', '1566878455404.png', '1587792059error-500.png', 1, '1592369253banner.jpg', '1648110638breadpng.png', '16480138261571567295logopng.png', '1567655174profile.jpg', '#666666', 0, 1, '16480137831571567295logopng.png', 1, 0, 'light', '<div style=\"text-align: center;\"><font size=\"5\"><br></font></div><h1 style=\"text-align: center;\"><font size=\"6\">UNDER MAINTENANCE</font></h1>', 1, '1.1', 1, 1, 12, 6, 12, 12, 12, 12, 4, 4, 4, 4, 3, 12, 12, 0, 1000000, 6, NULL, '12,24,36,48,60', 1, 1, '.', ',', 0, 1, 5, 1, 10, 15, 1, 1, 1, 1, 'Our Partners', 'Cillum eu id enim aliquip aute ullamco anim. Culpa deserunt nostrud excepteur voluptate velit ipsum esse enim.', 'CLICK SHOP NOW FOR ALL DEAL OF THE PRODUCT', 'Donec condimentum Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras cursus pretium sapien, in pulvinar ipsum molestie id. Aliquam erat volutpat. Duis quam tellus, ullamcorper.....', '2022-03-31', '164743040383png.png', 0);

-- --------------------------------------------------------

--
-- Table structure for table `languages`
--

CREATE TABLE `languages` (
  `id` int(191) NOT NULL,
  `is_default` tinyint(1) NOT NULL DEFAULT 0,
  `language` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `file` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(100) NOT NULL,
  `rtl` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `languages`
--

INSERT INTO `languages` (`id`, `is_default`, `language`, `file`, `name`, `rtl`) VALUES
(1, 1, 'English', '1605519199OsGO7B86.json', '1605519199OsGO7B86', 0);

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

CREATE TABLE `messages` (
  `id` int(191) NOT NULL,
  `conversation_id` int(191) NOT NULL,
  `message` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `sent_user` int(191) DEFAULT NULL,
  `recieved_user` int(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` int(191) NOT NULL,
  `order_id` int(191) UNSIGNED DEFAULT NULL,
  `user_id` int(191) DEFAULT NULL,
  `vendor_id` int(191) DEFAULT NULL,
  `product_id` int(191) DEFAULT NULL,
  `conversation_id` int(191) DEFAULT NULL,
  `is_read` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `user_id` int(191) DEFAULT NULL,
  `cart` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `method` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shipping` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pickup_location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `totalQty` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `pay_amount` double NOT NULL,
  `txnid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `charge_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_number` varchar(255) NOT NULL,
  `payment_status` varchar(255) NOT NULL DEFAULT 'Pending',
  `customer_email` varchar(255) NOT NULL,
  `customer_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `customer_country` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `customer_phone` varchar(255) NOT NULL,
  `customer_address` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `customer_city` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `customer_zip` varchar(255) DEFAULT NULL,
  `shipping_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `shipping_country` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shipping_email` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `shipping_phone` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `shipping_address` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `shipping_city` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `shipping_zip` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `order_note` text CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `coupon_code` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `coupon_discount` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('pending','processing','completed','declined','on delivery') NOT NULL DEFAULT 'pending',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `affilate_user` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `affilate_charge` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `currency_sign` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `currency_name` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `currency_value` double NOT NULL,
  `shipping_cost` double NOT NULL,
  `packing_cost` double NOT NULL DEFAULT 0,
  `tax` double NOT NULL,
  `tax_location` varchar(191) DEFAULT NULL,
  `dp` tinyint(1) NOT NULL DEFAULT 0,
  `pay_id` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `vendor_shipping_id` int(191) NOT NULL DEFAULT 0,
  `vendor_packing_id` int(191) NOT NULL DEFAULT 0,
  `wallet_price` double NOT NULL DEFAULT 0,
  `shipping_title` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `packing_title` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_state` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shipping_state` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `discount` int(10) NOT NULL DEFAULT 0,
  `affilate_users` text DEFAULT NULL,
  `commission` double NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `order_tracks`
--

CREATE TABLE `order_tracks` (
  `id` int(191) NOT NULL,
  `order_id` int(191) NOT NULL,
  `title` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `text` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `packages`
--

CREATE TABLE `packages` (
  `id` int(191) NOT NULL,
  `user_id` int(191) NOT NULL DEFAULT 0,
  `title` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subtitle` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` double NOT NULL DEFAULT 0,
  `language_id` int(191) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `packages`
--

INSERT INTO `packages` (`id`, `user_id`, `title`, `subtitle`, `price`, `language_id`) VALUES
(1, 0, 'Default Packaging', 'Default packaging by store', 0, 1),
(2, 0, 'Gift Packaging', 'Exclusive Gift packaging', 15, 1),
(4, 22, 'Large box', 'Large box', 2, 1);

-- --------------------------------------------------------

--
-- Table structure for table `pages`
--

CREATE TABLE `pages` (
  `id` int(191) NOT NULL,
  `title` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `details` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `photo` varchar(500) DEFAULT NULL,
  `meta_tag` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `header` tinyint(1) NOT NULL DEFAULT 0,
  `footer` tinyint(1) NOT NULL DEFAULT 0,
  `language_id` int(191) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `pages`
--

INSERT INTO `pages` (`id`, `title`, `slug`, `details`, `photo`, `meta_tag`, `meta_description`, `header`, `footer`, `language_id`) VALUES
(1, 'About Us', 'about', '<div helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 14px;=\"\" font-style:=\"\" normal;=\"\" font-variant-ligatures:=\"\" font-variant-caps:=\"\" font-weight:=\"\" 400;=\"\" letter-spacing:=\"\" orphans:=\"\" 2;=\"\" text-align:=\"\" start;=\"\" text-indent:=\"\" 0px;=\"\" text-transform:=\"\" none;=\"\" white-space:=\"\" widows:=\"\" word-spacing:=\"\" -webkit-text-stroke-width:=\"\" background-color:=\"\" rgb(255,=\"\" 255,=\"\" 255);=\"\" text-decoration-style:=\"\" initial;=\"\" text-decoration-color:=\"\" initial;\"=\"\"><h2><font size=\"6\">Title number 1</font><br></h2><p>Lorem Ipsum&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p></div><div helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 14px;=\"\" font-style:=\"\" normal;=\"\" font-variant-ligatures:=\"\" font-variant-caps:=\"\" font-weight:=\"\" 400;=\"\" letter-spacing:=\"\" orphans:=\"\" 2;=\"\" text-align:=\"\" start;=\"\" text-indent:=\"\" 0px;=\"\" text-transform:=\"\" none;=\"\" white-space:=\"\" widows:=\"\" word-spacing:=\"\" -webkit-text-stroke-width:=\"\" background-color:=\"\" rgb(255,=\"\" 255,=\"\" 255);=\"\" text-decoration-style:=\"\" initial;=\"\" text-decoration-color:=\"\" initial;\"=\"\"><h2><font size=\"6\">Title number 2</font><br></h2><p>It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).</p></div><div helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 14px;=\"\" font-style:=\"\" normal;=\"\" font-variant-ligatures:=\"\" font-variant-caps:=\"\" font-weight:=\"\" 400;=\"\" letter-spacing:=\"\" orphans:=\"\" 2;=\"\" text-align:=\"\" start;=\"\" text-indent:=\"\" 0px;=\"\" text-transform:=\"\" none;=\"\" white-space:=\"\" widows:=\"\" word-spacing:=\"\" -webkit-text-stroke-width:=\"\" background-color:=\"\" rgb(255,=\"\" 255,=\"\" 255);=\"\" text-decoration-style:=\"\" initial;=\"\" text-decoration-color:=\"\" initial;\"=\"\"></div>', '164593825554png.png', NULL, NULL, 1, 0, 1),
(2, 'Privacy & Policy', 'privacy', '<div helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 14px;=\"\" font-style:=\"\" normal;=\"\" font-variant-ligatures:=\"\" font-variant-caps:=\"\" font-weight:=\"\" 400;=\"\" letter-spacing:=\"\" orphans:=\"\" 2;=\"\" text-align:=\"\" start;=\"\" text-indent:=\"\" 0px;=\"\" text-transform:=\"\" none;=\"\" white-space:=\"\" widows:=\"\" word-spacing:=\"\" -webkit-text-stroke-width:=\"\" background-color:=\"\" rgb(255,=\"\" 255,=\"\" 255);=\"\" text-decoration-style:=\"\" initial;=\"\" text-decoration-color:=\"\" initial;\"=\"\"><h2 style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 0.5rem; font-weight: 500; line-height: 1.44444; font-size: 52px; color: rgb(20, 50, 80); font-family: &quot;Open Sans&quot;, sans-serif;\"><font size=\"6\" style=\"box-sizing: border-box;\">Title number 1</font><br style=\"box-sizing: border-box;\"></h2><h2><div helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 14px;=\"\" font-style:=\"\" normal;=\"\" font-variant-ligatures:=\"\" font-variant-caps:=\"\" font-weight:=\"\" 400;=\"\" letter-spacing:=\"\" orphans:=\"\" 2;=\"\" text-align:=\"\" start;=\"\" text-indent:=\"\" 0px;=\"\" text-transform:=\"\" none;=\"\" white-space:=\"\" widows:=\"\" word-spacing:=\"\" -webkit-text-stroke-width:=\"\" background-color:=\"\" rgb(255,=\"\" 255,=\"\" 255);=\"\" text-decoration-style:=\"\" initial;=\"\" text-decoration-color:=\"\" initial;\"=\"\" style=\"color: rgb(70, 85, 65); font-size: 16px;\"><p>Lorem Ipsum&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p></div></h2><h2 style=\"line-height: 1.44444;\"><font size=\"6\">Title number 2</font><br></h2><h2><div helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 14px;=\"\" font-style:=\"\" normal;=\"\" font-variant-ligatures:=\"\" font-variant-caps:=\"\" font-weight:=\"\" 400;=\"\" letter-spacing:=\"\" orphans:=\"\" 2;=\"\" text-align:=\"\" start;=\"\" text-indent:=\"\" 0px;=\"\" text-transform:=\"\" none;=\"\" white-space:=\"\" widows:=\"\" word-spacing:=\"\" -webkit-text-stroke-width:=\"\" background-color:=\"\" rgb(255,=\"\" 255,=\"\" 255);=\"\" text-decoration-style:=\"\" initial;=\"\" text-decoration-color:=\"\" initial;\"=\"\" style=\"color: rgb(70, 85, 65); font-size: 16px;\"><p>It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).</p></div></h2></div>', '164593897354png.png', 'test,test1,test2,test3', 'Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc.', 1, 1, 1),
(3, 'Terms & Condition', 'terms', '<div helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 14px;=\"\" font-style:=\"\" normal;=\"\" font-variant-ligatures:=\"\" font-variant-caps:=\"\" font-weight:=\"\" 400;=\"\" letter-spacing:=\"\" orphans:=\"\" 2;=\"\" text-align:=\"\" start;=\"\" text-indent:=\"\" 0px;=\"\" text-transform:=\"\" none;=\"\" white-space:=\"\" widows:=\"\" word-spacing:=\"\" -webkit-text-stroke-width:=\"\" background-color:=\"\" rgb(255,=\"\" 255,=\"\" 255);=\"\" text-decoration-style:=\"\" initial;=\"\" text-decoration-color:=\"\" initial;\"=\"\"><h2 style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 0.5rem; font-weight: 500; line-height: 1.44444; font-size: 52px; color: rgb(20, 50, 80); font-family: &quot;Open Sans&quot;, sans-serif;\"><font size=\"6\" style=\"box-sizing: border-box;\">Title number 1</font><br style=\"box-sizing: border-box;\"></h2><h2><div helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 14px;=\"\" font-style:=\"\" normal;=\"\" font-variant-ligatures:=\"\" font-variant-caps:=\"\" font-weight:=\"\" 400;=\"\" letter-spacing:=\"\" orphans:=\"\" 2;=\"\" text-align:=\"\" start;=\"\" text-indent:=\"\" 0px;=\"\" text-transform:=\"\" none;=\"\" white-space:=\"\" widows:=\"\" word-spacing:=\"\" -webkit-text-stroke-width:=\"\" background-color:=\"\" rgb(255,=\"\" 255,=\"\" 255);=\"\" text-decoration-style:=\"\" initial;=\"\" text-decoration-color:=\"\" initial;\"=\"\" style=\"color: rgb(70, 85, 65); font-size: 16px;\"><p>Lorem Ipsum&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p></div></h2><h2 style=\"line-height: 1.44444;\"><font size=\"6\">Title number 2</font><br></h2><h2><div helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 14px;=\"\" font-style:=\"\" normal;=\"\" font-variant-ligatures:=\"\" font-variant-caps:=\"\" font-weight:=\"\" 400;=\"\" letter-spacing:=\"\" orphans:=\"\" 2;=\"\" text-align:=\"\" start;=\"\" text-indent:=\"\" 0px;=\"\" text-transform:=\"\" none;=\"\" white-space:=\"\" widows:=\"\" word-spacing:=\"\" -webkit-text-stroke-width:=\"\" background-color:=\"\" rgb(255,=\"\" 255,=\"\" 255);=\"\" text-decoration-style:=\"\" initial;=\"\" text-decoration-color:=\"\" initial;\"=\"\" style=\"color: rgb(70, 85, 65); font-size: 16px;\"><p>It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).</p></div></h2></div>', '164593902254png.png', 't1,t2,t3,t4', 'There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn\'t anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc.', 1, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `pagesettings`
--

CREATE TABLE `pagesettings` (
  `id` int(10) UNSIGNED NOT NULL,
  `contact_email` varchar(191) NOT NULL,
  `street` text DEFAULT NULL,
  `phone` text DEFAULT NULL,
  `fax` text DEFAULT NULL,
  `email` text DEFAULT NULL,
  `site` text DEFAULT NULL,
  `best_seller_banner` text DEFAULT NULL,
  `best_seller_banner_link` text DEFAULT NULL,
  `big_save_banner` text DEFAULT NULL,
  `big_save_banner_link` text DEFAULT NULL,
  `best_seller_banner1` text DEFAULT NULL,
  `best_seller_banner_link1` text DEFAULT NULL,
  `big_save_banner1` text DEFAULT NULL,
  `big_save_banner_link1` text DEFAULT NULL,
  `rightbanner1` text DEFAULT NULL,
  `rightbanner2` text DEFAULT NULL,
  `rightbannerlink1` text DEFAULT NULL,
  `rightbannerlink2` text DEFAULT NULL,
  `home` tinyint(1) NOT NULL DEFAULT 0,
  `blog` tinyint(1) NOT NULL DEFAULT 0,
  `faq` tinyint(1) NOT NULL DEFAULT 0,
  `contact` tinyint(1) NOT NULL DEFAULT 0,
  `category` tinyint(1) NOT NULL DEFAULT 0,
  `arrival_section` tinyint(1) NOT NULL DEFAULT 1,
  `our_services` tinyint(1) NOT NULL DEFAULT 1,
  `second_left_banner` tinyint(1) NOT NULL DEFAULT 1,
  `popular_products` tinyint(1) NOT NULL DEFAULT 1,
  `third_left_banner` tinyint(1) NOT NULL DEFAULT 1,
  `slider` tinyint(1) NOT NULL DEFAULT 0,
  `flash_deal` tinyint(1) NOT NULL DEFAULT 1,
  `deal_of_the_day` tinyint(1) NOT NULL DEFAULT 1,
  `best_sellers` tinyint(1) NOT NULL DEFAULT 1,
  `partner` tinyint(1) NOT NULL DEFAULT 1,
  `top_big_trending` tinyint(1) NOT NULL DEFAULT 0,
  `top_brand` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `pagesettings`
--

INSERT INTO `pagesettings` (`id`, `contact_email`, `street`, `phone`, `fax`, `email`, `site`, `best_seller_banner`, `best_seller_banner_link`, `big_save_banner`, `big_save_banner_link`, `best_seller_banner1`, `best_seller_banner_link1`, `big_save_banner1`, `big_save_banner_link1`, `rightbanner1`, `rightbanner2`, `rightbannerlink1`, `rightbannerlink2`, `home`, `blog`, `faq`, `contact`, `category`, `arrival_section`, `our_services`, `second_left_banner`, `popular_products`, `third_left_banner`, `slider`, `flash_deal`, `deal_of_the_day`, `best_sellers`, `partner`, `top_big_trending`, `top_brand`) VALUES
(1, 'admin@geniusocean.com', '3584 Hickory Heights Drive , USA', '00 000 000 000', '00 000 000 000', 'admin@geniusocean.com', 'https://geniusocean.com/', '1639369899side-banner22png.png', 'http://google.com', '1639370813Bottom31png.png', 'http://google.com', '1639369899bottom3-bigg1png.png', 'http://google.com', '1573022053aside-banner1.jpg', 'http://google.com', '1573547281sm-banner.jpg', '1573547653sm-banner.jpg', 'https://codecanyon.net/user/geniusocean/portfolio', 'https://codecanyon.net/user/geniusocean/portfolio', 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `partners`
--

CREATE TABLE `partners` (
  `id` int(191) NOT NULL,
  `photo` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `link` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `partners`
--

INSERT INTO `partners` (`id`, `photo`, `link`) VALUES
(7, '1571289583p1.jpg', 'https://codecanyon.net/user/geniusocean/portfolio'),
(8, '1571289601p2.jpg', 'https://codecanyon.net/user/geniusocean/portfolio'),
(9, '1571289608p3.jpg', 'https://codecanyon.net/user/geniusocean/portfolio'),
(10, '1571289614p4.jpg', 'https://codecanyon.net/user/geniusocean/portfolio'),
(11, '1571289621p5.jpg', 'https://codecanyon.net/user/geniusocean/portfolio'),
(12, '1571289627p6.jpg', 'https://codecanyon.net/user/geniusocean/portfolio'),
(13, '1571289634p7.jpg', 'https://codecanyon.net/user/geniusocean/portfolio'),
(14, '1571289642p8.jpg', 'https://codecanyon.net/user/geniusocean/portfolio'),
(15, '1571289650p9.jpg', 'https://codecanyon.net/user/geniusocean/portfolio'),
(16, '1571289657p10.jpg', 'https://codecanyon.net/user/geniusocean/portfolio'),
(18, '1571289669p12.jpg', 'https://codecanyon.net/user/geniusocean/portfolio'),
(19, '1571289675p13.jpg', 'https://codecanyon.net/user/geniusocean/portfolio');

-- --------------------------------------------------------

--
-- Table structure for table `payment_gateways`
--

CREATE TABLE `payment_gateways` (
  `id` int(191) NOT NULL,
  `subtitle` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `title` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `details` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` enum('manual','automatic') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'manual',
  `information` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `keyword` varchar(191) DEFAULT NULL,
  `currency_id` varchar(191) NOT NULL DEFAULT '*',
  `checkout` int(191) NOT NULL DEFAULT 1,
  `deposit` int(191) NOT NULL DEFAULT 1,
  `subscription` int(191) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `payment_gateways`
--

INSERT INTO `payment_gateways` (`id`, `subtitle`, `title`, `details`, `name`, `type`, `information`, `keyword`, `currency_id`, `checkout`, `deposit`, `subscription`) VALUES
(1, 'Pay with cash upon delivery.', 'Cash On Delivery', NULL, 'Cash On Delivery', 'automatic', '{\"text\":\"Pay via your PayPal account.\"}', 'cod', '*', 1, 0, 0),
(2, '(5 - 6 days)', 'Mobile Money', '<b>Payment Number: </b>69234324233423', NULL, 'manual', NULL, NULL, '*', 1, 1, 1),
(4, NULL, NULL, NULL, 'SSLCommerz', 'automatic', '{\"store_id\":\"geniu5e1b00621f81e\",\"store_password\":\"geniu5e1b00621f81e@ssl\",\"sandbox_check\":1,\"text\":\"Pay Via SSLCommerz.\"}', 'sslcommerz', '[\"4\"]', 1, 1, 1),
(6, NULL, NULL, NULL, 'Flutter Wave', 'automatic', '{\"public_key\":\"FLWPUBK_TEST-299dc2c8bf4c7f14f7d7f48c32433393-X\",\"secret_key\":\"FLWSECK_TEST-afb1f2a4789002d7c0f2185b830450b7-X\",\"text\":\"Pay via your Flutter Wave account.\"}', 'flutterwave', '[\"1\",\"9\"]', 1, 1, 1),
(7, NULL, NULL, NULL, 'Mercadopago', 'automatic', '{\"public_key\":\"TEST-6f72a502-51c8-4e9a-8ca3-cb7fa0addad8\",\"token\":\"TEST-6068652511264159-022306-e78da379f3963916b1c7130ff2906826-529753482\",\"sandbox_check\":1,\"text\":\"Pay Via MercadoPago\"}', 'mercadopago', '[\"1\"]', 1, 1, 1),
(8, NULL, NULL, NULL, 'Authorize.Net', 'automatic', '{\"login_id\":\"76zu9VgUSxrJ\",\"txn_key\":\"2Vj62a6skSrP5U3X\",\"sandbox_check\":1,\"text\":\"Pay Via Authorize.Net\"}', 'authorize.net', '[\"1\"]', 1, 1, 1),
(9, NULL, NULL, NULL, 'Razorpay', 'automatic', '{\"key\":\"rzp_test_xDH74d48cwl8DF\",\"secret\":\"cr0H1BiQ20hVzhpHfHuNbGri\",\"text\":\"Pay via your Razorpay account.\"}', 'razorpay', '[\"8\"]', 1, 1, 1),
(10, NULL, NULL, NULL, 'Mollie Payment', 'automatic', '{\"key\":\"test_5HcWVs9qc5pzy36H9Tu9mwAyats33J\",\"text\":\"Pay with Mollie Payment.\"}', 'mollie', '[\"1\",\"6\"]', 1, 1, 1),
(11, NULL, NULL, NULL, 'Paytm', 'automatic', '{\"merchant\":\"tkogux49985047638244\",\"secret\":\"LhNGUUKE9xCQ9xY8\",\"website\":\"WEBSTAGING\",\"industry\":\"Retail\",\"sandbox_check\":1,\"text\":\"Pay via your Paytm account.\"}', 'paytm', '[\"8\"]', 1, 1, 1),
(12, NULL, NULL, NULL, 'Paystack', 'automatic', '{\"key\":\"pk_test_162a56d42131cbb01932ed0d2c48f9cb99d8e8e2\",\"email\":\"junnuns@gmail.com\",\"text\":\"Pay via your Paystack account.\"}', 'paystack', '[\"9\"]', 1, 1, 1),
(13, NULL, NULL, NULL, 'Instamojo', 'automatic', '{\"key\":\"test_172371aa837ae5cad6047dc3052\",\"token\":\"test_4ac5a785e25fc596b67dbc5c267\",\"sandbox_check\":1,\"text\":\"Pay via your Instamojo account.\"}', 'instamojo', '[\"8\"]', 1, 1, 1),
(14, NULL, NULL, NULL, 'Stripe', 'automatic', '{\"key\":\"pk_test_UnU1Coi1p5qFGwtpjZMRMgJM\",\"secret\":\"sk_test_QQcg3vGsKRPlW6T3dXcNJsor\",\"text\":\"Pay via your Credit Card.\"}', 'stripe', '[\"1\"]', 1, 1, 1),
(15, NULL, NULL, NULL, 'Paypal', 'automatic', '{\"client_id\":\"AcWYnysKa_elsQIAnlfsJXokR64Z31CeCbpis9G3msDC-BvgcbAwbacfDfEGSP-9Dp9fZaGgD05pX5Qi\",\"client_secret\":\"EGZXTq6d6vBPq8kysVx8WQA5NpavMpDzOLVOb9u75UfsJ-cFzn6aeBXIMyJW2lN1UZtJg5iDPNL9ocYE\",\"sandbox_check\":1,\"text\":\"Pay via your PayPal account.\"}', 'paypal', '[\"1\"]', 1, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `pickups`
--

CREATE TABLE `pickups` (
  `id` int(191) UNSIGNED NOT NULL,
  `location` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `language_id` int(191) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `pickups`
--

INSERT INTO `pickups` (`id`, `location`, `language_id`) VALUES
(2, 'Azampur', 1),
(3, 'Dhaka', 1),
(4, 'Kazipara', 1),
(5, 'Kamarpara', 1),
(6, 'Uttara', 1);

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(191) UNSIGNED NOT NULL,
  `sku` varchar(255) DEFAULT NULL,
  `product_type` enum('normal','affiliate') NOT NULL DEFAULT 'normal',
  `affiliate_link` text DEFAULT NULL,
  `user_id` int(191) NOT NULL DEFAULT 0,
  `category_id` int(191) UNSIGNED NOT NULL,
  `subcategory_id` int(191) UNSIGNED DEFAULT NULL,
  `childcategory_id` int(191) UNSIGNED DEFAULT NULL,
  `attributes` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `photo` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `thumbnail` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `file` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `size` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `size_qty` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `size_price` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `color` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` double NOT NULL,
  `previous_price` double DEFAULT NULL,
  `details` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `stock` int(191) DEFAULT NULL,
  `policy` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(2) UNSIGNED NOT NULL DEFAULT 1,
  `views` int(191) UNSIGNED NOT NULL DEFAULT 0,
  `tags` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `features` text DEFAULT NULL,
  `colors` text DEFAULT NULL,
  `product_condition` tinyint(1) NOT NULL DEFAULT 0,
  `ship` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_meta` tinyint(1) NOT NULL DEFAULT 0,
  `meta_tag` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `youtube` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` enum('Physical','Digital','License') NOT NULL,
  `license` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `license_qty` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `link` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `platform` varchar(255) DEFAULT NULL,
  `region` varchar(255) DEFAULT NULL,
  `licence_type` varchar(255) DEFAULT NULL,
  `measure` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `featured` tinyint(2) UNSIGNED NOT NULL DEFAULT 0,
  `best` tinyint(10) UNSIGNED NOT NULL DEFAULT 0,
  `top` tinyint(10) UNSIGNED NOT NULL DEFAULT 0,
  `hot` tinyint(10) UNSIGNED NOT NULL DEFAULT 0,
  `latest` tinyint(10) UNSIGNED NOT NULL DEFAULT 0,
  `big` tinyint(10) UNSIGNED NOT NULL DEFAULT 0,
  `trending` tinyint(1) NOT NULL DEFAULT 0,
  `sale` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `is_discount` tinyint(1) NOT NULL DEFAULT 0,
  `discount_date` date DEFAULT NULL,
  `whole_sell_qty` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `whole_sell_discount` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_catalog` tinyint(1) NOT NULL DEFAULT 0,
  `catalog_id` int(191) NOT NULL DEFAULT 0,
  `language_id` int(191) DEFAULT NULL,
  `preordered` tinyint(1) NOT NULL DEFAULT 0,
  `minimum_qty` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `color_all` text DEFAULT NULL,
  `size_all` text DEFAULT NULL,
  `stock_check` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `sku`, `product_type`, `affiliate_link`, `user_id`, `category_id`, `subcategory_id`, `childcategory_id`, `attributes`, `name`, `slug`, `photo`, `thumbnail`, `file`, `size`, `size_qty`, `size_price`, `color`, `price`, `previous_price`, `details`, `stock`, `policy`, `status`, `views`, `tags`, `features`, `colors`, `product_condition`, `ship`, `is_meta`, `meta_tag`, `meta_description`, `youtube`, `type`, `license`, `license_qty`, `link`, `platform`, `region`, `licence_type`, `measure`, `featured`, `best`, `top`, `hot`, `latest`, `big`, `trending`, `sale`, `created_at`, `updated_at`, `is_discount`, `discount_date`, `whole_sell_qty`, `whole_sell_discount`, `is_catalog`, `catalog_id`, `language_id`, `preordered`, `minimum_qty`, `color_all`, `size_all`, `stock_check`) VALUES
(95, 'pr495jsv1', 'affiliate', 'https://www.amazon.com/Rolex-Master-Automatic-self-Wind-Certified-Pre-Owned/dp/B07MHJ8SVQ/ref=lp_13779934011_1_2?s=apparel&ie=UTF8&qid=1565186470&sr=1-2&nodeID=13779934011&psd=1', 13, 4, NULL, NULL, NULL, 'Affiliate Product Title will Be Here. Affiliate Product Title will Be Here 95', 'affiliate-product-title-will-be-here-affiliate-product-title-will-be-here-95-pr495jsv1', '1568027732dTwHda8l.png', '1577617660xEcrWcwo.jpg', NULL, 'S,S,S,M,M,M,L,L,L,XL,XL,XL,XXL,XXL,XXL', '100,100,100,100,100,100,100,100,100,100,100,100,100,100,100', '1,2,3,1,2,3,1,2,3,1,2,3,1,2,3', '#000000,#f41c1c,#3c34d5,#c12ec8,#007137,#000000,#f41c1c,#3c34d5,#007137,#c12ec8,#f41c1c,#3c34d5,#007137,#000000,#c12ec8', 50, 100, 'Donec condimentum\n\n           Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras cursus pretium sapien, in pulvinar ipsum molestie id. Aliquam erat volutpat. Duis quam tellus, ullamcorper at tristique ac, viverra at diam. Donec egestas eu odio tincidunt ultrices. Suspendisse egestas vulputate mauris non commodo. In convallis aliquam vulputate. Quisque varius est ac lorem venenatis lobortis. Fusce a iaculis mi, ut elementum ex. Mauris faucibus enim quis lacinia mollis. Vivamus in volutpat ante. Nullam nec vulputate mi. Fusce tempor cursus odio, nec cursus purus malesuada sit amet.\n           Aliquam ultricies\n\n           Fusce vitae lacinia mauris, eget vehicula augue. Phasellus efficitur felis non ligula dictum, sit amet faucibus nulla sollicitudin. Donec condimentum metus enim, id molestie urna ultrices sed. Nunc rhoncus purus venenatis nulla efficitur, a ultrices elit ornare. Donec vitae congue ante. Sed eleifend ex sit amet odio vestibulum, ac sagittis quam finibus. Ut egestas sit amet urna eu blandit. Duis iaculis ante vitae risus condimentum, vitae laoreet sem dapibus. Aliquam ultricies risus quis sagittis fermentum. Suspendisse interdum magna erat, viverra elementum sem sollicitudin eget\n           Aliquam ultricies\n\n           Fusce vitae lacinia mauris, eget vehicula augue. Phasellus efficitur felis non ligula dictum, sit amet faucibus nulla sollicitudin. Donec condimentum metus enim, id molestie urna ultrices sed. Nunc rhoncus purus venenatis nulla efficitur, a ultrices elit ornare. Donec vitae congue ante. Sed eleifend ex sit amet odio vestibulum, ac sagittis quam finibus. Ut egestas sit amet urna eu blandit. Duis iaculis ante vitae risus condimentum, vitae laoreet sem dapibus. Aliquam ultricies risus quis sagittis fermentum. Suspendisse interdum magna erat, viverra elementum sem sollicitudin eget\n           ', 55555, '<h4 class=\"title\" style=\"font-weight: 600; line-height: 1.2381; font-size: 20px; color: rgb(5, 14, 51);\"><div class=\"product-services\" style=\"display: flex; margin-top: 1.5em; color: rgb(118, 118, 120); font-family: Jost, sans-serif; font-size: 16px; font-weight: 400;\"><span style=\"width: 115px; font-weight: 600; padding-right: 0px;\">Services:</span><ul class=\"product-services-list\" style=\"padding: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; list-style-position: initial; list-style-image: initial; flex: 0 0 calc(100% - 115px); line-height: 28px;\"><li class=\"product-service-item\">30 Day Return Policy</li><li class=\"product-service-item\">Cash on Delivery available</li><li class=\"product-service-item\">Free Delivery</li></ul></div><div class=\"woocommerce-product-details__short-description\" style=\"display: flex; margin-top: 1.5em; color: rgb(118, 118, 120); font-family: Jost, sans-serif; font-size: 16px; font-weight: 400;\"><span style=\"width: 115px; font-weight: 600; padding-right: 0px;\">Highlights:</span><div class=\"short-description\" style=\"flex: 0 0 calc(100% - 115px);\"><ul style=\"padding: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; list-style-position: initial; list-style-image: initial; line-height: 28px;\"><li>Regular Fit.</li><li>Full sleeves.</li><li>70% cotton, 30% polyester.</li><li>Easy to wear and versatile as Casual.</li><li>Machine wash, tumble dry.</li></ul></div></div></h4>', 1, 74, 'watch', NULL, NULL, 2, '5-7 days', 0, NULL, NULL, NULL, 'Physical', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 1, 0, 1, 1, 1, '2019-09-09 07:36:06', '2022-03-06 00:28:54', 1, '2021-06-30', '10,20,30,40', '5,10,15,20', 0, 0, 1, 0, NULL, NULL, NULL, 1),
(107, NULL, 'normal', NULL, 13, 11, NULL, NULL, NULL, 'Digital Product Title will Be Here by Name 107', 'digital-product-title-will-be-here-by-name-107-4ll107cru-arabic', '1568026791NGCCXoMs.png', '1568026791O2FR26Va.jpg', '1568016463minimal (16).zip', NULL, NULL, NULL, NULL, 50, 75, 'Donec condimentum\n\n           Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras cursus pretium sapien, in pulvinar ipsum molestie id. Aliquam erat volutpat. Duis quam tellus, ullamcorper at tristique ac, viverra at diam. Donec egestas eu odio tincidunt ultrices. Suspendisse egestas vulputate mauris non commodo. In convallis aliquam vulputate. Quisque varius est ac lorem venenatis lobortis. Fusce a iaculis mi, ut elementum ex. Mauris faucibus enim quis lacinia mollis. Vivamus in volutpat ante. Nullam nec vulputate mi. Fusce tempor cursus odio, nec cursus purus malesuada sit amet.\n           Aliquam ultricies\n\n           Fusce vitae lacinia mauris, eget vehicula augue. Phasellus efficitur felis non ligula dictum, sit amet faucibus nulla sollicitudin. Donec condimentum metus enim, id molestie urna ultrices sed. Nunc rhoncus purus venenatis nulla efficitur, a ultrices elit ornare. Donec vitae congue ante. Sed eleifend ex sit amet odio vestibulum, ac sagittis quam finibus. Ut egestas sit amet urna eu blandit. Duis iaculis ante vitae risus condimentum, vitae laoreet sem dapibus. Aliquam ultricies risus quis sagittis fermentum. Suspendisse interdum magna erat, viverra elementum sem sollicitudin eget\n           Aliquam ultricies\n\n           Fusce vitae lacinia mauris, eget vehicula augue. Phasellus efficitur felis non ligula dictum, sit amet faucibus nulla sollicitudin. Donec condimentum metus enim, id molestie urna ultrices sed. Nunc rhoncus purus venenatis nulla efficitur, a ultrices elit ornare. Donec vitae congue ante. Sed eleifend ex sit amet odio vestibulum, ac sagittis quam finibus. Ut egestas sit amet urna eu blandit. Duis iaculis ante vitae risus condimentum, vitae laoreet sem dapibus. Aliquam ultricies risus quis sagittis fermentum. Suspendisse interdum magna erat, viverra elementum sem sollicitudin eget\n           ', NULL, '<h4 class=\"title\" style=\"font-weight: 600; line-height: 1.2381; font-size: 20px; color: rgb(5, 14, 51);\"><div class=\"product-services\" style=\"display: flex; margin-top: 1.5em; color: rgb(118, 118, 120); font-family: Jost, sans-serif; font-size: 16px; font-weight: 400;\"><span style=\"width: 115px; font-weight: 600; padding-right: 0px;\">Services:</span><ul class=\"product-services-list\" style=\"padding: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; list-style-position: initial; list-style-image: initial; flex: 0 0 calc(100% - 115px); line-height: 28px;\"><li class=\"product-service-item\">30 Day Return Policy</li><li class=\"product-service-item\">Cash on Delivery available</li><li class=\"product-service-item\">Free Delivery</li></ul></div><div class=\"woocommerce-product-details__short-description\" style=\"display: flex; margin-top: 1.5em; color: rgb(118, 118, 120); font-family: Jost, sans-serif; font-size: 16px; font-weight: 400;\"><span style=\"width: 115px; font-weight: 600; padding-right: 0px;\">Highlights:</span><div class=\"short-description\" style=\"flex: 0 0 calc(100% - 115px);\"><ul style=\"padding: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; list-style-position: initial; list-style-image: initial; line-height: 28px;\"><li>Regular Fit.</li><li>Full sleeves.</li><li>70% cotton, 30% polyester.</li><li>Easy to wear and versatile as Casual.</li><li>Machine wash, tumble dry.</li></ul></div></div></h4>', 1, 10, 'book,ebook', NULL, NULL, 0, NULL, 0, 'book,ebook', 'These are ebook from Demo store.', 'https://www.youtube.com/watch?v=HxNydN5tScI', 'Digital', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, 0, 0, 1, 0, 1, 1, '2019-09-09 12:07:43', '2022-03-03 02:37:02', 0, NULL, NULL, NULL, 0, 0, 1, 0, NULL, NULL, NULL, 1),
(109, NULL, 'normal', NULL, 13, 11, NULL, NULL, NULL, 'Digital Product Title will Be Here by Name 109', 'digital-product-title-will-be-here-by-name-109-ext109m9m-arabic', '15680267308Mckygzw.png', '1568026730uz1TS02K.jpg', '1568016463minimal (16).zip', NULL, NULL, NULL, NULL, 50, 75, 'Donec condimentum\n\n           Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras cursus pretium sapien, in pulvinar ipsum molestie id. Aliquam erat volutpat. Duis quam tellus, ullamcorper at tristique ac, viverra at diam. Donec egestas eu odio tincidunt ultrices. Suspendisse egestas vulputate mauris non commodo. In convallis aliquam vulputate. Quisque varius est ac lorem venenatis lobortis. Fusce a iaculis mi, ut elementum ex. Mauris faucibus enim quis lacinia mollis. Vivamus in volutpat ante. Nullam nec vulputate mi. Fusce tempor cursus odio, nec cursus purus malesuada sit amet.\n           Aliquam ultricies\n\n           Fusce vitae lacinia mauris, eget vehicula augue. Phasellus efficitur felis non ligula dictum, sit amet faucibus nulla sollicitudin. Donec condimentum metus enim, id molestie urna ultrices sed. Nunc rhoncus purus venenatis nulla efficitur, a ultrices elit ornare. Donec vitae congue ante. Sed eleifend ex sit amet odio vestibulum, ac sagittis quam finibus. Ut egestas sit amet urna eu blandit. Duis iaculis ante vitae risus condimentum, vitae laoreet sem dapibus. Aliquam ultricies risus quis sagittis fermentum. Suspendisse interdum magna erat, viverra elementum sem sollicitudin eget\n           Aliquam ultricies\n\n           Fusce vitae lacinia mauris, eget vehicula augue. Phasellus efficitur felis non ligula dictum, sit amet faucibus nulla sollicitudin. Donec condimentum metus enim, id molestie urna ultrices sed. Nunc rhoncus purus venenatis nulla efficitur, a ultrices elit ornare. Donec vitae congue ante. Sed eleifend ex sit amet odio vestibulum, ac sagittis quam finibus. Ut egestas sit amet urna eu blandit. Duis iaculis ante vitae risus condimentum, vitae laoreet sem dapibus. Aliquam ultricies risus quis sagittis fermentum. Suspendisse interdum magna erat, viverra elementum sem sollicitudin eget\n           ', NULL, '<h4 class=\"title\" style=\"font-weight: 600; line-height: 1.2381; font-size: 20px; color: rgb(5, 14, 51);\"><div class=\"product-services\" style=\"display: flex; margin-top: 1.5em; color: rgb(118, 118, 120); font-family: Jost, sans-serif; font-size: 16px; font-weight: 400;\"><span style=\"width: 115px; font-weight: 600; padding-right: 0px;\">Services:</span><ul class=\"product-services-list\" style=\"padding: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; list-style-position: initial; list-style-image: initial; flex: 0 0 calc(100% - 115px); line-height: 28px;\"><li class=\"product-service-item\">30 Day Return Policy</li><li class=\"product-service-item\">Cash on Delivery available</li><li class=\"product-service-item\">Free Delivery</li></ul></div><div class=\"woocommerce-product-details__short-description\" style=\"display: flex; margin-top: 1.5em; color: rgb(118, 118, 120); font-family: Jost, sans-serif; font-size: 16px; font-weight: 400;\"><span style=\"width: 115px; font-weight: 600; padding-right: 0px;\">Highlights:</span><div class=\"short-description\" style=\"flex: 0 0 calc(100% - 115px);\"><ul style=\"padding: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; list-style-position: initial; list-style-image: initial; line-height: 28px;\"><li>Regular Fit.</li><li>Full sleeves.</li><li>70% cotton, 30% polyester.</li><li>Easy to wear and versatile as Casual.</li><li>Machine wash, tumble dry.</li></ul></div></div></h4>', 1, 15, 'book,ebook', NULL, NULL, 0, NULL, 0, 'book,ebook', 'These are ebook from Demo store.', 'https://www.youtube.com/watch?v=HxNydN5tScI', 'Digital', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, 1, 0, 0, 1, 0, '2019-09-09 12:07:43', '2022-03-06 00:11:24', 0, NULL, NULL, NULL, 0, 0, 1, 0, NULL, NULL, NULL, 1),
(111, NULL, 'normal', NULL, 13, 8, NULL, NULL, NULL, 'License key title will be here according to your wish 111', 'license-key-title-will-be-here-according-to-your-wish-111-', '1568029267UZnlkD97.png', '1568029267AY9MRYAQ.jpg', NULL, NULL, NULL, NULL, NULL, 80, 100, 'Donec condimentum\r\n\r\n           Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras cursus pretium sapien, in pulvinar ipsum molestie id. Aliquam erat volutpat. Duis quam tellus, ullamcorper at tristique ac, viverra at diam. Donec egestas eu odio tincidunt ultrices. Suspendisse egestas vulputate mauris non commodo. In convallis aliquam vulputate. Quisque varius est ac lorem venenatis lobortis. Fusce a iaculis mi, ut elementum ex. Mauris faucibus enim quis lacinia mollis. Vivamus in volutpat ante. Nullam nec vulputate mi. Fusce tempor cursus odio, nec cursus purus malesuada sit amet.\r\n           Aliquam ultricies\r\n\r\n           Fusce vitae lacinia mauris, eget vehicula augue. Phasellus efficitur felis non ligula dictum, sit amet faucibus nulla sollicitudin. Donec condimentum metus enim, id molestie urna ultrices sed. Nunc rhoncus purus venenatis nulla efficitur, a ultrices elit ornare. Donec vitae congue ante. Sed eleifend ex sit amet odio vestibulum, ac sagittis quam finibus. Ut egestas sit amet urna eu blandit. Duis iaculis ante vitae risus condimentum, vitae laoreet sem dapibus. Aliquam ultricies risus quis sagittis fermentum. Suspendisse interdum magna erat, viverra elementum sem sollicitudin eget\r\n           Aliquam ultricies\r\n\r\n           Fusce vitae lacinia mauris, eget vehicula augue. Phasellus efficitur felis non ligula dictum, sit amet faucibus nulla sollicitudin. Donec condimentum metus enim, id molestie urna ultrices sed. Nunc rhoncus purus venenatis nulla efficitur, a ultrices elit ornare. Donec vitae congue ante. Sed eleifend ex sit amet odio vestibulum, ac sagittis quam finibus. Ut egestas sit amet urna eu blandit. Duis iaculis ante vitae risus condimentum, vitae laoreet sem dapibus. Aliquam ultricies risus quis sagittis fermentum. Suspendisse interdum magna erat, viverra elementum sem sollicitudin eget', NULL, '<h4 class=\"title\" style=\"font-weight: 600; line-height: 1.2381; font-size: 20px; color: rgb(5, 14, 51);\"><div class=\"product-services\" style=\"display: flex; margin-top: 1.5em; color: rgb(118, 118, 120); font-family: Jost, sans-serif; font-size: 16px; font-weight: 400;\"><span style=\"width: 115px; font-weight: 600; padding-right: 0px;\">Services:</span><ul class=\"product-services-list\" style=\"padding: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; list-style-position: initial; list-style-image: initial; flex: 0 0 calc(100% - 115px); line-height: 28px;\"><li class=\"product-service-item\">30 Day Return Policy</li><li class=\"product-service-item\">Cash on Delivery available</li><li class=\"product-service-item\">Free Delivery</li></ul></div><div class=\"woocommerce-product-details__short-description\" style=\"display: flex; margin-top: 1.5em; color: rgb(118, 118, 120); font-family: Jost, sans-serif; font-size: 16px; font-weight: 400;\"><span style=\"width: 115px; font-weight: 600; padding-right: 0px;\">Highlights:</span><div class=\"short-description\" style=\"flex: 0 0 calc(100% - 115px);\"><ul style=\"padding: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; list-style-position: initial; list-style-image: initial; line-height: 28px;\"><li>Regular Fit.</li><li>Full sleeves.</li><li>70% cotton, 30% polyester.</li><li>Easy to wear and versatile as Casual.</li><li>Machine wash, tumble dry.</li></ul></div></div></h4>', 1, 31, 'game', NULL, NULL, 0, NULL, 0, NULL, NULL, 'https://www.youtube.com/watch?v=HxNydN5tScI', 'License', '888888888888888888888888', '1.0E+25', NULL, 'edsfdsf', 'sdfsd', 'sdfsdfs', NULL, 1, 1, 1, 1, 1, 1, 1, 1, '2019-09-09 12:25:20', '2023-03-05 22:56:48', 0, NULL, NULL, NULL, 0, 0, 1, 0, NULL, NULL, NULL, 1),
(112, NULL, 'normal', NULL, 13, 8, NULL, NULL, NULL, 'License key title will be here according to your wish 1', 'license-key-title-will-be-here-according-to-your-wish-1-', '1648013610nbbGKBia.png', '1648013611p5T1Ljor.jpg', '156801752005.zip', NULL, NULL, NULL, NULL, 80, 100, 'Donec condimentum\r\n\r\n           Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras cursus pretium sapien, in pulvinar ipsum molestie id. Aliquam erat volutpat. Duis quam tellus, ullamcorper at tristique ac, viverra at diam. Donec egestas eu odio tincidunt ultrices. Suspendisse egestas vulputate mauris non commodo. In convallis aliquam vulputate. Quisque varius est ac lorem venenatis lobortis. Fusce a iaculis mi, ut elementum ex. Mauris faucibus enim quis lacinia mollis. Vivamus in volutpat ante. Nullam nec vulputate mi. Fusce tempor cursus odio, nec cursus purus malesuada sit amet.\r\n           Aliquam ultricies\r\n\r\n           Fusce vitae lacinia mauris, eget vehicula augue. Phasellus efficitur felis non ligula dictum, sit amet faucibus nulla sollicitudin. Donec condimentum metus enim, id molestie urna ultrices sed. Nunc rhoncus purus venenatis nulla efficitur, a ultrices elit ornare. Donec vitae congue ante. Sed eleifend ex sit amet odio vestibulum, ac sagittis quam finibus. Ut egestas sit amet urna eu blandit. Duis iaculis ante vitae risus condimentum, vitae laoreet sem dapibus. Aliquam ultricies risus quis sagittis fermentum. Suspendisse interdum magna erat, viverra elementum sem sollicitudin eget\r\n           Aliquam ultricies\r\n\r\n           Fusce vitae lacinia mauris, eget vehicula augue. Phasellus efficitur felis non ligula dictum, sit amet faucibus nulla sollicitudin. Donec condimentum metus enim, id molestie urna ultrices sed. Nunc rhoncus purus venenatis nulla efficitur, a ultrices elit ornare. Donec vitae congue ante. Sed eleifend ex sit amet odio vestibulum, ac sagittis quam finibus. Ut egestas sit amet urna eu blandit. Duis iaculis ante vitae risus condimentum, vitae laoreet sem dapibus. Aliquam ultricies risus quis sagittis fermentum. Suspendisse interdum magna erat, viverra elementum sem sollicitudin eget', NULL, '<h4 class=\"title\" style=\"font-weight: 600; line-height: 1.2381; font-size: 20px; color: rgb(5, 14, 51);\"><div class=\"product-services\" style=\"display: flex; margin-top: 1.5em; color: rgb(118, 118, 120); font-family: Jost, sans-serif; font-size: 16px; font-weight: 400;\"><span style=\"width: 115px; font-weight: 600; padding-right: 0px;\">Services:</span><ul class=\"product-services-list\" style=\"padding: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; list-style-position: initial; list-style-image: initial; flex: 0 0 calc(100% - 115px); line-height: 28px;\"><li class=\"product-service-item\">30 Day Return Policy</li><li class=\"product-service-item\">Cash on Delivery available</li><li class=\"product-service-item\">Free Delivery</li></ul></div><div class=\"woocommerce-product-details__short-description\" style=\"display: flex; margin-top: 1.5em; color: rgb(118, 118, 120); font-family: Jost, sans-serif; font-size: 16px; font-weight: 400;\"><span style=\"width: 115px; font-weight: 600; padding-right: 0px;\">Highlights:</span><div class=\"short-description\" style=\"flex: 0 0 calc(100% - 115px);\"><ul style=\"padding: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; list-style-position: initial; list-style-image: initial; line-height: 28px;\"><li>Regular Fit.</li><li>Full sleeves.</li><li>70% cotton, 30% polyester.</li><li>Easy to wear and versatile as Casual.</li><li>Machine wash, tumble dry.</li></ul></div></div></h4>', 1, 16, 'game', 'Keyword 2,Keyword1', '#e80707,#113fe0', 0, NULL, 0, NULL, NULL, 'https://www.youtube.com/watch?v=HxNydN5tScI', 'License', '888888888888888888888888', '9999999999999999999999999', NULL, NULL, NULL, NULL, NULL, 1, 0, 0, 1, 1, 0, 1, 0, '2019-09-09 12:25:20', '2022-03-22 23:33:31', 0, NULL, NULL, NULL, 0, 0, 1, 0, NULL, NULL, NULL, 1),
(114, NULL, 'normal', NULL, 13, 10, NULL, NULL, NULL, 'License key title will be here according to your wish 1', 'license-key-title-will-be-here-according-to-your-wish-1-', '1639452704vGVh3Hle.png', '1639452704LCoONyz3.jpg', '156801752005.zip', NULL, NULL, NULL, NULL, 80, 100, 'Donec condimentum\n\n           Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras cursus pretium sapien, in pulvinar ipsum molestie id. Aliquam erat volutpat. Duis quam tellus, ullamcorper at tristique ac, viverra at diam. Donec egestas eu odio tincidunt ultrices. Suspendisse egestas vulputate mauris non commodo. In convallis aliquam vulputate. Quisque varius est ac lorem venenatis lobortis. Fusce a iaculis mi, ut elementum ex. Mauris faucibus enim quis lacinia mollis. Vivamus in volutpat ante. Nullam nec vulputate mi. Fusce tempor cursus odio, nec cursus purus malesuada sit amet.\n           Aliquam ultricies\n\n           Fusce vitae lacinia mauris, eget vehicula augue. Phasellus efficitur felis non ligula dictum, sit amet faucibus nulla sollicitudin. Donec condimentum metus enim, id molestie urna ultrices sed. Nunc rhoncus purus venenatis nulla efficitur, a ultrices elit ornare. Donec vitae congue ante. Sed eleifend ex sit amet odio vestibulum, ac sagittis quam finibus. Ut egestas sit amet urna eu blandit. Duis iaculis ante vitae risus condimentum, vitae laoreet sem dapibus. Aliquam ultricies risus quis sagittis fermentum. Suspendisse interdum magna erat, viverra elementum sem sollicitudin eget\n           Aliquam ultricies\n\n           Fusce vitae lacinia mauris, eget vehicula augue. Phasellus efficitur felis non ligula dictum, sit amet faucibus nulla sollicitudin. Donec condimentum metus enim, id molestie urna ultrices sed. Nunc rhoncus purus venenatis nulla efficitur, a ultrices elit ornare. Donec vitae congue ante. Sed eleifend ex sit amet odio vestibulum, ac sagittis quam finibus. Ut egestas sit amet urna eu blandit. Duis iaculis ante vitae risus condimentum, vitae laoreet sem dapibus. Aliquam ultricies risus quis sagittis fermentum. Suspendisse interdum magna erat, viverra elementum sem sollicitudin eget\n           ', NULL, '<h4 class=\"title\" style=\"font-weight: 600; line-height: 1.2381; font-size: 20px; color: rgb(5, 14, 51);\"><div class=\"product-services\" style=\"display: flex; margin-top: 1.5em; color: rgb(118, 118, 120); font-family: Jost, sans-serif; font-size: 16px; font-weight: 400;\"><span style=\"width: 115px; font-weight: 600; padding-right: 0px;\">Services:</span><ul class=\"product-services-list\" style=\"padding: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; list-style-position: initial; list-style-image: initial; flex: 0 0 calc(100% - 115px); line-height: 28px;\"><li class=\"product-service-item\">30 Day Return Policy</li><li class=\"product-service-item\">Cash on Delivery available</li><li class=\"product-service-item\">Free Delivery</li></ul></div><div class=\"woocommerce-product-details__short-description\" style=\"display: flex; margin-top: 1.5em; color: rgb(118, 118, 120); font-family: Jost, sans-serif; font-size: 16px; font-weight: 400;\"><span style=\"width: 115px; font-weight: 600; padding-right: 0px;\">Highlights:</span><div class=\"short-description\" style=\"flex: 0 0 calc(100% - 115px);\"><ul style=\"padding: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; list-style-position: initial; list-style-image: initial; line-height: 28px;\"><li>Regular Fit.</li><li>Full sleeves.</li><li>70% cotton, 30% polyester.</li><li>Easy to wear and versatile as Casual.</li><li>Machine wash, tumble dry.</li></ul></div></div></h4>', 1, 17, 'game', NULL, NULL, 0, NULL, 0, NULL, NULL, 'https://www.youtube.com/watch?v=HxNydN5tScI', 'License', '888888888888888888888888', '1.0E+25', NULL, NULL, NULL, NULL, NULL, 1, 0, 0, 1, 0, 0, 1, 1, '2019-09-09 12:25:20', '2022-03-06 00:14:57', 0, NULL, NULL, NULL, 0, 0, 1, 0, NULL, NULL, NULL, 1),
(116, 'pr496jsv1', 'affiliate', 'https://www.amazon.com/Rolex-Master-Automatic-self-Wind-Certified-Pre-Owned/dp/B07MHJ8SVQ/ref=lp_13779934011_1_2?s=apparel&ie=UTF8&qid=1565186470&sr=1-2&nodeID=13779934011&psd=1', 13, 4, NULL, NULL, NULL, 'Affiliate Product Title will Be Here. Affiliate Product Title will Be Here 116', 'affiliate-product-title-will-be-here-affiliate-product-title-will-be-here-116-pr496jsv1', '1568027684whVhJDrR.png', '1577617649gNetfByq.jpg', NULL, 'S,S,S,M,M,M,L,L,L,XL,XL,XL,Extra Large,Extra Large,Extra Large', '100,100,100,100,100,100,100,100,100,100,100,100,100,100,100', '1,2,3,1,2,3,1,2,3,1,2,3,1,2,3', '#000000,#f41c1c,#3c34d5,#c12ec8,#007137,#000000,#f41c1c,#3c34d5,#007137,#c12ec8,#f41c1c,#3c34d5,#007137,#000000,#c12ec8', 50, 100, 'Donec condimentum\n\n           Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras cursus pretium sapien, in pulvinar ipsum molestie id. Aliquam erat volutpat. Duis quam tellus, ullamcorper at tristique ac, viverra at diam. Donec egestas eu odio tincidunt ultrices. Suspendisse egestas vulputate mauris non commodo. In convallis aliquam vulputate. Quisque varius est ac lorem venenatis lobortis. Fusce a iaculis mi, ut elementum ex. Mauris faucibus enim quis lacinia mollis. Vivamus in volutpat ante. Nullam nec vulputate mi. Fusce tempor cursus odio, nec cursus purus malesuada sit amet.\n           Aliquam ultricies\n\n           Fusce vitae lacinia mauris, eget vehicula augue. Phasellus efficitur felis non ligula dictum, sit amet faucibus nulla sollicitudin. Donec condimentum metus enim, id molestie urna ultrices sed. Nunc rhoncus purus venenatis nulla efficitur, a ultrices elit ornare. Donec vitae congue ante. Sed eleifend ex sit amet odio vestibulum, ac sagittis quam finibus. Ut egestas sit amet urna eu blandit. Duis iaculis ante vitae risus condimentum, vitae laoreet sem dapibus. Aliquam ultricies risus quis sagittis fermentum. Suspendisse interdum magna erat, viverra elementum sem sollicitudin eget\n           Aliquam ultricies\n\n           Fusce vitae lacinia mauris, eget vehicula augue. Phasellus efficitur felis non ligula dictum, sit amet faucibus nulla sollicitudin. Donec condimentum metus enim, id molestie urna ultrices sed. Nunc rhoncus purus venenatis nulla efficitur, a ultrices elit ornare. Donec vitae congue ante. Sed eleifend ex sit amet odio vestibulum, ac sagittis quam finibus. Ut egestas sit amet urna eu blandit. Duis iaculis ante vitae risus condimentum, vitae laoreet sem dapibus. Aliquam ultricies risus quis sagittis fermentum. Suspendisse interdum magna erat, viverra elementum sem sollicitudin eget\n           ', 55555, '<h4 class=\"title\" style=\"font-weight: 600; line-height: 1.2381; font-size: 20px; color: rgb(5, 14, 51);\"><div class=\"product-services\" style=\"display: flex; margin-top: 1.5em; color: rgb(118, 118, 120); font-family: Jost, sans-serif; font-size: 16px; font-weight: 400;\"><span style=\"width: 115px; font-weight: 600; padding-right: 0px;\">Services:</span><ul class=\"product-services-list\" style=\"padding: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; list-style-position: initial; list-style-image: initial; flex: 0 0 calc(100% - 115px); line-height: 28px;\"><li class=\"product-service-item\">30 Day Return Policy</li><li class=\"product-service-item\">Cash on Delivery available</li><li class=\"product-service-item\">Free Delivery</li></ul></div><div class=\"woocommerce-product-details__short-description\" style=\"display: flex; margin-top: 1.5em; color: rgb(118, 118, 120); font-family: Jost, sans-serif; font-size: 16px; font-weight: 400;\"><span style=\"width: 115px; font-weight: 600; padding-right: 0px;\">Highlights:</span><div class=\"short-description\" style=\"flex: 0 0 calc(100% - 115px);\"><ul style=\"padding: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; list-style-position: initial; list-style-image: initial; line-height: 28px;\"><li>Regular Fit.</li><li>Full sleeves.</li><li>70% cotton, 30% polyester.</li><li>Easy to wear and versatile as Casual.</li><li>Machine wash, tumble dry.</li></ul></div></div></h4>', 1, 38, 'watch', 'Keyword1,Keyword 2', '#ff1a1a,#0fbcd4', 2, '5-7 days', 0, NULL, NULL, NULL, 'Physical', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 1, 0, 1, 1, 0, '2019-09-09 12:36:06', '2022-02-15 05:34:11', 1, '2021-06-30', '10,20,30,40', '5,10,15,20', 0, 0, 1, 0, NULL, NULL, NULL, 1),
(117, 'pr497jsv1', 'affiliate', 'https://www.amazon.com/Rolex-Master-Automatic-self-Wind-Certified-Pre-Owned/dp/B07MHJ8SVQ/ref=lp_13779934011_1_2?s=apparel&ie=UTF8&qid=1565186470&sr=1-2&nodeID=13779934011&psd=1', 13, 4, NULL, NULL, NULL, 'Affiliate Product Title will Be Here. Affiliate Product Title will Be Here 117', 'affiliate-product-title-will-be-here-affiliate-product-title-will-be-here-117-pr497jsv1', '1568027658Up0FIXsW.png', '1577617641ogGOi53N.jpg', NULL, 'S,S,S,M,M,M,L,L,L,XL,XL,XL,XXL,XXL,XXL', '100,100,100,100,100,100,100,100,100,100,100,100,100,100,100', '1,2,3,1,2,3,1,2,3,1,2,3,1,2,3', '#000000,#f41c1c,#3c34d5,#c12ec8,#007137,#000000,#f41c1c,#3c34d5,#007137,#c12ec8,#f41c1c,#3c34d5,#007137,#000000,#c12ec8', 50, 100, 'Donec condimentum\n\n           Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras cursus pretium sapien, in pulvinar ipsum molestie id. Aliquam erat volutpat. Duis quam tellus, ullamcorper at tristique ac, viverra at diam. Donec egestas eu odio tincidunt ultrices. Suspendisse egestas vulputate mauris non commodo. In convallis aliquam vulputate. Quisque varius est ac lorem venenatis lobortis. Fusce a iaculis mi, ut elementum ex. Mauris faucibus enim quis lacinia mollis. Vivamus in volutpat ante. Nullam nec vulputate mi. Fusce tempor cursus odio, nec cursus purus malesuada sit amet.\n           Aliquam ultricies\n\n           Fusce vitae lacinia mauris, eget vehicula augue. Phasellus efficitur felis non ligula dictum, sit amet faucibus nulla sollicitudin. Donec condimentum metus enim, id molestie urna ultrices sed. Nunc rhoncus purus venenatis nulla efficitur, a ultrices elit ornare. Donec vitae congue ante. Sed eleifend ex sit amet odio vestibulum, ac sagittis quam finibus. Ut egestas sit amet urna eu blandit. Duis iaculis ante vitae risus condimentum, vitae laoreet sem dapibus. Aliquam ultricies risus quis sagittis fermentum. Suspendisse interdum magna erat, viverra elementum sem sollicitudin eget\n           Aliquam ultricies\n\n           Fusce vitae lacinia mauris, eget vehicula augue. Phasellus efficitur felis non ligula dictum, sit amet faucibus nulla sollicitudin. Donec condimentum metus enim, id molestie urna ultrices sed. Nunc rhoncus purus venenatis nulla efficitur, a ultrices elit ornare. Donec vitae congue ante. Sed eleifend ex sit amet odio vestibulum, ac sagittis quam finibus. Ut egestas sit amet urna eu blandit. Duis iaculis ante vitae risus condimentum, vitae laoreet sem dapibus. Aliquam ultricies risus quis sagittis fermentum. Suspendisse interdum magna erat, viverra elementum sem sollicitudin eget\n           ', 55555, '<h4 class=\"title\" style=\"font-weight: 600; line-height: 1.2381; font-size: 20px; color: rgb(5, 14, 51);\"><div class=\"product-services\" style=\"display: flex; margin-top: 1.5em; color: rgb(118, 118, 120); font-family: Jost, sans-serif; font-size: 16px; font-weight: 400;\"><span style=\"width: 115px; font-weight: 600; padding-right: 0px;\">Services:</span><ul class=\"product-services-list\" style=\"padding: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; list-style-position: initial; list-style-image: initial; flex: 0 0 calc(100% - 115px); line-height: 28px;\"><li class=\"product-service-item\">30 Day Return Policy</li><li class=\"product-service-item\">Cash on Delivery available</li><li class=\"product-service-item\">Free Delivery</li></ul></div><div class=\"woocommerce-product-details__short-description\" style=\"display: flex; margin-top: 1.5em; color: rgb(118, 118, 120); font-family: Jost, sans-serif; font-size: 16px; font-weight: 400;\"><span style=\"width: 115px; font-weight: 600; padding-right: 0px;\">Highlights:</span><div class=\"short-description\" style=\"flex: 0 0 calc(100% - 115px);\"><ul style=\"padding: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; list-style-position: initial; list-style-image: initial; line-height: 28px;\"><li>Regular Fit.</li><li>Full sleeves.</li><li>70% cotton, 30% polyester.</li><li>Easy to wear and versatile as Casual.</li><li>Machine wash, tumble dry.</li></ul></div></div></h4>', 1, 6, 'watch', NULL, NULL, 2, '5-7 days', 0, NULL, NULL, NULL, 'Physical', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 1, 0, 1, 1, 0, '2019-09-09 12:36:06', '2022-02-08 22:33:50', 1, '2021-06-30', '10,20,30,40', '5,10,15,20', 0, 0, 1, 0, NULL, NULL, NULL, 1),
(118, 'pr498jsv1', 'affiliate', 'https://www.amazon.com/Rolex-Master-Automatic-self-Wind-Certified-Pre-Owned/dp/B07MHJ8SVQ/ref=lp_13779934011_1_2?s=apparel&ie=UTF8&qid=1565186470&sr=1-2&nodeID=13779934011&psd=1', 13, 4, NULL, NULL, NULL, 'Affiliate Product Title will Be Here. Affiliate Product Title will Be Here 118', 'affiliate-product-title-will-be-here-affiliate-product-title-will-be-here-118-pr498jsv1', '1568027631cnmEylRa.png', '1577617633KxEnzs97.jpg', NULL, 'S,S,S,M,M,M,L,L,L,XL,XL,XL,XXL,XXL,XXL', '100,100,100,100,100,100,100,100,100,100,100,100,100,100,100', '1,2,3,1,2,3,1,2,3,1,2,3,1,2,3', '#000000,#f41c1c,#3c34d5,#c12ec8,#007137,#000000,#f41c1c,#3c34d5,#007137,#c12ec8,#f41c1c,#3c34d5,#007137,#000000,#c12ec8', 50, 100, 'Donec condimentum\n\n           Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras cursus pretium sapien, in pulvinar ipsum molestie id. Aliquam erat volutpat. Duis quam tellus, ullamcorper at tristique ac, viverra at diam. Donec egestas eu odio tincidunt ultrices. Suspendisse egestas vulputate mauris non commodo. In convallis aliquam vulputate. Quisque varius est ac lorem venenatis lobortis. Fusce a iaculis mi, ut elementum ex. Mauris faucibus enim quis lacinia mollis. Vivamus in volutpat ante. Nullam nec vulputate mi. Fusce tempor cursus odio, nec cursus purus malesuada sit amet.\n           Aliquam ultricies\n\n           Fusce vitae lacinia mauris, eget vehicula augue. Phasellus efficitur felis non ligula dictum, sit amet faucibus nulla sollicitudin. Donec condimentum metus enim, id molestie urna ultrices sed. Nunc rhoncus purus venenatis nulla efficitur, a ultrices elit ornare. Donec vitae congue ante. Sed eleifend ex sit amet odio vestibulum, ac sagittis quam finibus. Ut egestas sit amet urna eu blandit. Duis iaculis ante vitae risus condimentum, vitae laoreet sem dapibus. Aliquam ultricies risus quis sagittis fermentum. Suspendisse interdum magna erat, viverra elementum sem sollicitudin eget\n           Aliquam ultricies\n\n           Fusce vitae lacinia mauris, eget vehicula augue. Phasellus efficitur felis non ligula dictum, sit amet faucibus nulla sollicitudin. Donec condimentum metus enim, id molestie urna ultrices sed. Nunc rhoncus purus venenatis nulla efficitur, a ultrices elit ornare. Donec vitae congue ante. Sed eleifend ex sit amet odio vestibulum, ac sagittis quam finibus. Ut egestas sit amet urna eu blandit. Duis iaculis ante vitae risus condimentum, vitae laoreet sem dapibus. Aliquam ultricies risus quis sagittis fermentum. Suspendisse interdum magna erat, viverra elementum sem sollicitudin eget\n           ', 55555, '<h4 class=\"title\" style=\"font-weight: 600; line-height: 1.2381; font-size: 20px; color: rgb(5, 14, 51);\"><div class=\"product-services\" style=\"display: flex; margin-top: 1.5em; color: rgb(118, 118, 120); font-family: Jost, sans-serif; font-size: 16px; font-weight: 400;\"><span style=\"width: 115px; font-weight: 600; padding-right: 0px;\">Services:</span><ul class=\"product-services-list\" style=\"padding: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; list-style-position: initial; list-style-image: initial; flex: 0 0 calc(100% - 115px); line-height: 28px;\"><li class=\"product-service-item\">30 Day Return Policy</li><li class=\"product-service-item\">Cash on Delivery available</li><li class=\"product-service-item\">Free Delivery</li></ul></div><div class=\"woocommerce-product-details__short-description\" style=\"display: flex; margin-top: 1.5em; color: rgb(118, 118, 120); font-family: Jost, sans-serif; font-size: 16px; font-weight: 400;\"><span style=\"width: 115px; font-weight: 600; padding-right: 0px;\">Highlights:</span><div class=\"short-description\" style=\"flex: 0 0 calc(100% - 115px);\"><ul style=\"padding: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; list-style-position: initial; list-style-image: initial; line-height: 28px;\"><li>Regular Fit.</li><li>Full sleeves.</li><li>70% cotton, 30% polyester.</li><li>Easy to wear and versatile as Casual.</li><li>Machine wash, tumble dry.</li></ul></div></div></h4>', 1, 5, 'watch', NULL, NULL, 2, '5-7 days', 0, NULL, NULL, NULL, 'Physical', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 1, 0, 1, 1, 0, '2019-09-09 12:36:06', '2022-02-08 22:33:50', 1, '2021-06-30', '10,20,30,40', '5,10,15,20', 0, 0, 1, 0, NULL, NULL, NULL, 1),
(119, 'pr499jsv1', 'affiliate', 'https://www.amazon.com/Rolex-Master-Automatic-self-Wind-Certified-Pre-Owned/dp/B07MHJ8SVQ/ref=lp_13779934011_1_2?s=apparel&ie=UTF8&qid=1565186470&sr=1-2&nodeID=13779934011&psd=1', 13, 4, NULL, NULL, NULL, 'Affiliate Product Title will Be Here. Affiliate Product Title will Be Here 1', 'affiliate-product-title-will-be-here-affiliate-product-title-will-be-here-1-pr499jsv1', '1568027603i5UAZiKB.png', '1577617624IKzGBL9L.jpg', NULL, 'S,S,S,M,M,M,L,L,L,XL,XL,XL,XXL,XXL,XXL', '100,100,100,100,100,100,100,100,100,100,100,100,100,100,100', '1,2,3,1,2,3,1,2,3,1,2,3,1,2,3', '#000000,#f41c1c,#3c34d5,#c12ec8,#007137,#000000,#f41c1c,#3c34d5,#007137,#c12ec8,#f41c1c,#3c34d5,#007137,#000000,#c12ec8', 50, 100, 'Donec condimentum\n\n           Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras cursus pretium sapien, in pulvinar ipsum molestie id. Aliquam erat volutpat. Duis quam tellus, ullamcorper at tristique ac, viverra at diam. Donec egestas eu odio tincidunt ultrices. Suspendisse egestas vulputate mauris non commodo. In convallis aliquam vulputate. Quisque varius est ac lorem venenatis lobortis. Fusce a iaculis mi, ut elementum ex. Mauris faucibus enim quis lacinia mollis. Vivamus in volutpat ante. Nullam nec vulputate mi. Fusce tempor cursus odio, nec cursus purus malesuada sit amet.\n           Aliquam ultricies\n\n           Fusce vitae lacinia mauris, eget vehicula augue. Phasellus efficitur felis non ligula dictum, sit amet faucibus nulla sollicitudin. Donec condimentum metus enim, id molestie urna ultrices sed. Nunc rhoncus purus venenatis nulla efficitur, a ultrices elit ornare. Donec vitae congue ante. Sed eleifend ex sit amet odio vestibulum, ac sagittis quam finibus. Ut egestas sit amet urna eu blandit. Duis iaculis ante vitae risus condimentum, vitae laoreet sem dapibus. Aliquam ultricies risus quis sagittis fermentum. Suspendisse interdum magna erat, viverra elementum sem sollicitudin eget\n           Aliquam ultricies\n\n           Fusce vitae lacinia mauris, eget vehicula augue. Phasellus efficitur felis non ligula dictum, sit amet faucibus nulla sollicitudin. Donec condimentum metus enim, id molestie urna ultrices sed. Nunc rhoncus purus venenatis nulla efficitur, a ultrices elit ornare. Donec vitae congue ante. Sed eleifend ex sit amet odio vestibulum, ac sagittis quam finibus. Ut egestas sit amet urna eu blandit. Duis iaculis ante vitae risus condimentum, vitae laoreet sem dapibus. Aliquam ultricies risus quis sagittis fermentum. Suspendisse interdum magna erat, viverra elementum sem sollicitudin eget\n           ', 55555, '<h4 class=\"title\" style=\"font-weight: 600; line-height: 1.2381; font-size: 20px; color: rgb(5, 14, 51);\"><div class=\"product-services\" style=\"display: flex; margin-top: 1.5em; color: rgb(118, 118, 120); font-family: Jost, sans-serif; font-size: 16px; font-weight: 400;\"><span style=\"width: 115px; font-weight: 600; padding-right: 0px;\">Services:</span><ul class=\"product-services-list\" style=\"padding: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; list-style-position: initial; list-style-image: initial; flex: 0 0 calc(100% - 115px); line-height: 28px;\"><li class=\"product-service-item\">30 Day Return Policy</li><li class=\"product-service-item\">Cash on Delivery available</li><li class=\"product-service-item\">Free Delivery</li></ul></div><div class=\"woocommerce-product-details__short-description\" style=\"display: flex; margin-top: 1.5em; color: rgb(118, 118, 120); font-family: Jost, sans-serif; font-size: 16px; font-weight: 400;\"><span style=\"width: 115px; font-weight: 600; padding-right: 0px;\">Highlights:</span><div class=\"short-description\" style=\"flex: 0 0 calc(100% - 115px);\"><ul style=\"padding: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; list-style-position: initial; list-style-image: initial; line-height: 28px;\"><li>Regular Fit.</li><li>Full sleeves.</li><li>70% cotton, 30% polyester.</li><li>Easy to wear and versatile as Casual.</li><li>Machine wash, tumble dry.</li></ul></div></div></h4>', 1, 12, 'watch', NULL, NULL, 2, '5-7 days', 0, NULL, NULL, NULL, 'Physical', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 1, 0, 1, 1, 0, '2019-09-09 12:36:06', '2022-02-08 22:33:50', 1, '2021-06-30', '10,20,30,40', '5,10,15,20', 0, 0, 1, 0, NULL, NULL, NULL, 1),
(120, 'pr500jsv1', 'affiliate', 'https://www.amazon.com/Rolex-Master-Automatic-self-Wind-Certified-Pre-Owned/dp/B07MHJ8SVQ/ref=lp_13779934011_1_2?s=apparel&ie=UTF8&qid=1565186470&sr=1-2&nodeID=13779934011&psd=1', 13, 4, NULL, NULL, NULL, 'Affiliate Product Title will Be Here. Affiliate Product Title will Be Here 120', 'affiliate-product-title-will-be-here-affiliate-product-title-will-be-here-120-pr500jsv1', '1568027558gLSECTIh.png', '1577617616ol3RAb6T.jpg', NULL, 'S,S,S,M,M,M,L,L,L,XL,XL,XL,XXL,XXL,XXL', '100,100,100,100,100,100,100,100,100,100,100,100,100,100,100', '1,2,3,1,2,3,1,2,3,1,2,3,1,2,3', '#000000,#f41c1c,#3c34d5,#c12ec8,#007137,#000000,#f41c1c,#3c34d5,#007137,#c12ec8,#f41c1c,#3c34d5,#007137,#000000,#c12ec8', 50, 100, 'Donec condimentum\n\n           Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras cursus pretium sapien, in pulvinar ipsum molestie id. Aliquam erat volutpat. Duis quam tellus, ullamcorper at tristique ac, viverra at diam. Donec egestas eu odio tincidunt ultrices. Suspendisse egestas vulputate mauris non commodo. In convallis aliquam vulputate. Quisque varius est ac lorem venenatis lobortis. Fusce a iaculis mi, ut elementum ex. Mauris faucibus enim quis lacinia mollis. Vivamus in volutpat ante. Nullam nec vulputate mi. Fusce tempor cursus odio, nec cursus purus malesuada sit amet.\n           Aliquam ultricies\n\n           Fusce vitae lacinia mauris, eget vehicula augue. Phasellus efficitur felis non ligula dictum, sit amet faucibus nulla sollicitudin. Donec condimentum metus enim, id molestie urna ultrices sed. Nunc rhoncus purus venenatis nulla efficitur, a ultrices elit ornare. Donec vitae congue ante. Sed eleifend ex sit amet odio vestibulum, ac sagittis quam finibus. Ut egestas sit amet urna eu blandit. Duis iaculis ante vitae risus condimentum, vitae laoreet sem dapibus. Aliquam ultricies risus quis sagittis fermentum. Suspendisse interdum magna erat, viverra elementum sem sollicitudin eget\n           Aliquam ultricies\n\n           Fusce vitae lacinia mauris, eget vehicula augue. Phasellus efficitur felis non ligula dictum, sit amet faucibus nulla sollicitudin. Donec condimentum metus enim, id molestie urna ultrices sed. Nunc rhoncus purus venenatis nulla efficitur, a ultrices elit ornare. Donec vitae congue ante. Sed eleifend ex sit amet odio vestibulum, ac sagittis quam finibus. Ut egestas sit amet urna eu blandit. Duis iaculis ante vitae risus condimentum, vitae laoreet sem dapibus. Aliquam ultricies risus quis sagittis fermentum. Suspendisse interdum magna erat, viverra elementum sem sollicitudin eget\n           ', 55555, '<h4 class=\"title\" style=\"font-weight: 600; line-height: 1.2381; font-size: 20px; color: rgb(5, 14, 51);\"><div class=\"product-services\" style=\"display: flex; margin-top: 1.5em; color: rgb(118, 118, 120); font-family: Jost, sans-serif; font-size: 16px; font-weight: 400;\"><span style=\"width: 115px; font-weight: 600; padding-right: 0px;\">Services:</span><ul class=\"product-services-list\" style=\"padding: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; list-style-position: initial; list-style-image: initial; flex: 0 0 calc(100% - 115px); line-height: 28px;\"><li class=\"product-service-item\">30 Day Return Policy</li><li class=\"product-service-item\">Cash on Delivery available</li><li class=\"product-service-item\">Free Delivery</li></ul></div><div class=\"woocommerce-product-details__short-description\" style=\"display: flex; margin-top: 1.5em; color: rgb(118, 118, 120); font-family: Jost, sans-serif; font-size: 16px; font-weight: 400;\"><span style=\"width: 115px; font-weight: 600; padding-right: 0px;\">Highlights:</span><div class=\"short-description\" style=\"flex: 0 0 calc(100% - 115px);\"><ul style=\"padding: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; list-style-position: initial; list-style-image: initial; line-height: 28px;\"><li>Regular Fit.</li><li>Full sleeves.</li><li>70% cotton, 30% polyester.</li><li>Easy to wear and versatile as Casual.</li><li>Machine wash, tumble dry.</li></ul></div></div></h4>', 1, 5, 'watch', NULL, NULL, 2, '5-7 days', 0, NULL, NULL, NULL, 'Physical', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 1, 0, 1, 1, 0, '2019-09-09 12:36:06', '2022-02-08 22:33:50', 1, '2021-06-30', '10,20,30,40', '5,10,15,20', 0, 0, 1, 0, NULL, NULL, NULL, 1);
INSERT INTO `products` (`id`, `sku`, `product_type`, `affiliate_link`, `user_id`, `category_id`, `subcategory_id`, `childcategory_id`, `attributes`, `name`, `slug`, `photo`, `thumbnail`, `file`, `size`, `size_qty`, `size_price`, `color`, `price`, `previous_price`, `details`, `stock`, `policy`, `status`, `views`, `tags`, `features`, `colors`, `product_condition`, `ship`, `is_meta`, `meta_tag`, `meta_description`, `youtube`, `type`, `license`, `license_qty`, `link`, `platform`, `region`, `licence_type`, `measure`, `featured`, `best`, `top`, `hot`, `latest`, `big`, `trending`, `sale`, `created_at`, `updated_at`, `is_discount`, `discount_date`, `whole_sell_qty`, `whole_sell_discount`, `is_catalog`, `catalog_id`, `language_id`, `preordered`, `minimum_qty`, `color_all`, `size_all`, `stock_check`) VALUES
(121, 'pr501jsv1', 'affiliate', 'https://www.amazon.com/Rolex-Master-Automatic-self-Wind-Certified-Pre-Owned/dp/B07MHJ8SVQ/ref=lp_13779934011_1_2?s=apparel&ie=UTF8&qid=1565186470&sr=1-2&nodeID=13779934011&psd=1', 13, 4, NULL, NULL, NULL, 'Affiliate Product Title will Be Here. Affiliate Product Title will Be Here 121', 'affiliate-product-title-will-be-here-affiliate-product-title-will-be-here-121-pr501jsv1', '1568027534O1QEBPpR.png', '1577617608MSgUIoEZ.jpg', NULL, 'S,S,S,M,M,M,L,L,L,XL,XL,XL,XXL,XXL,XXL', '100,100,100,100,100,100,100,100,100,100,100,100,100,100,100', '1,2,3,1,2,3,1,2,3,1,2,3,1,2,3', '#000000,#f41c1c,#3c34d5,#c12ec8,#007137,#000000,#f41c1c,#3c34d5,#007137,#c12ec8,#f41c1c,#3c34d5,#007137,#000000,#c12ec8', 50, 100, 'Donec condimentum\n\n           Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras cursus pretium sapien, in pulvinar ipsum molestie id. Aliquam erat volutpat. Duis quam tellus, ullamcorper at tristique ac, viverra at diam. Donec egestas eu odio tincidunt ultrices. Suspendisse egestas vulputate mauris non commodo. In convallis aliquam vulputate. Quisque varius est ac lorem venenatis lobortis. Fusce a iaculis mi, ut elementum ex. Mauris faucibus enim quis lacinia mollis. Vivamus in volutpat ante. Nullam nec vulputate mi. Fusce tempor cursus odio, nec cursus purus malesuada sit amet.\n           Aliquam ultricies\n\n           Fusce vitae lacinia mauris, eget vehicula augue. Phasellus efficitur felis non ligula dictum, sit amet faucibus nulla sollicitudin. Donec condimentum metus enim, id molestie urna ultrices sed. Nunc rhoncus purus venenatis nulla efficitur, a ultrices elit ornare. Donec vitae congue ante. Sed eleifend ex sit amet odio vestibulum, ac sagittis quam finibus. Ut egestas sit amet urna eu blandit. Duis iaculis ante vitae risus condimentum, vitae laoreet sem dapibus. Aliquam ultricies risus quis sagittis fermentum. Suspendisse interdum magna erat, viverra elementum sem sollicitudin eget\n           Aliquam ultricies\n\n           Fusce vitae lacinia mauris, eget vehicula augue. Phasellus efficitur felis non ligula dictum, sit amet faucibus nulla sollicitudin. Donec condimentum metus enim, id molestie urna ultrices sed. Nunc rhoncus purus venenatis nulla efficitur, a ultrices elit ornare. Donec vitae congue ante. Sed eleifend ex sit amet odio vestibulum, ac sagittis quam finibus. Ut egestas sit amet urna eu blandit. Duis iaculis ante vitae risus condimentum, vitae laoreet sem dapibus. Aliquam ultricies risus quis sagittis fermentum. Suspendisse interdum magna erat, viverra elementum sem sollicitudin eget\n           ', 55555, '<h4 class=\"title\" style=\"font-weight: 600; line-height: 1.2381; font-size: 20px; color: rgb(5, 14, 51);\"><div class=\"product-services\" style=\"display: flex; margin-top: 1.5em; color: rgb(118, 118, 120); font-family: Jost, sans-serif; font-size: 16px; font-weight: 400;\"><span style=\"width: 115px; font-weight: 600; padding-right: 0px;\">Services:</span><ul class=\"product-services-list\" style=\"padding: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; list-style-position: initial; list-style-image: initial; flex: 0 0 calc(100% - 115px); line-height: 28px;\"><li class=\"product-service-item\">30 Day Return Policy</li><li class=\"product-service-item\">Cash on Delivery available</li><li class=\"product-service-item\">Free Delivery</li></ul></div><div class=\"woocommerce-product-details__short-description\" style=\"display: flex; margin-top: 1.5em; color: rgb(118, 118, 120); font-family: Jost, sans-serif; font-size: 16px; font-weight: 400;\"><span style=\"width: 115px; font-weight: 600; padding-right: 0px;\">Highlights:</span><div class=\"short-description\" style=\"flex: 0 0 calc(100% - 115px);\"><ul style=\"padding: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; list-style-position: initial; list-style-image: initial; line-height: 28px;\"><li>Regular Fit.</li><li>Full sleeves.</li><li>70% cotton, 30% polyester.</li><li>Easy to wear and versatile as Casual.</li><li>Machine wash, tumble dry.</li></ul></div></div></h4>', 1, 16, 'watch', NULL, NULL, 2, '5-7 days', 0, NULL, NULL, NULL, 'Physical', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 1, 0, 1, 1, 0, '2019-09-09 12:36:06', '2022-02-08 22:33:50', 1, '2021-06-30', '10,20,30,40', '5,10,15,20', 0, 0, 1, 0, NULL, NULL, NULL, 1),
(122, 'pr502jsv1', 'affiliate', 'https://www.amazon.com/Rolex-Master-Automatic-self-Wind-Certified-Pre-Owned/dp/B07MHJ8SVQ/ref=lp_13779934011_1_2?s=apparel&ie=UTF8&qid=1565186470&sr=1-2&nodeID=13779934011&psd=1', 13, 4, NULL, NULL, NULL, 'Affiliate Product Title will Be Here. Affiliate Product Title will Be Here 122', 'affiliate-product-title-will-be-here-affiliate-product-title-will-be-here-122-pr502jsv1', '1568027493eLqHNoZP.png', '1577617600WtjwVRxD.jpg', NULL, 'S,S,S,M,M,M,L,L,L,XL,XL,XL,XXL,XXL,XXL', '100,100,100,100,100,100,100,100,100,100,100,100,100,100,100', '1,2,3,1,2,3,1,2,3,1,2,3,1,2,3', '#000000,#f41c1c,#3c34d5,#c12ec8,#007137,#000000,#f41c1c,#3c34d5,#007137,#c12ec8,#f41c1c,#3c34d5,#007137,#000000,#c12ec8', 50, 100, 'Donec condimentum\n\n           Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras cursus pretium sapien, in pulvinar ipsum molestie id. Aliquam erat volutpat. Duis quam tellus, ullamcorper at tristique ac, viverra at diam. Donec egestas eu odio tincidunt ultrices. Suspendisse egestas vulputate mauris non commodo. In convallis aliquam vulputate. Quisque varius est ac lorem venenatis lobortis. Fusce a iaculis mi, ut elementum ex. Mauris faucibus enim quis lacinia mollis. Vivamus in volutpat ante. Nullam nec vulputate mi. Fusce tempor cursus odio, nec cursus purus malesuada sit amet.\n           Aliquam ultricies\n\n           Fusce vitae lacinia mauris, eget vehicula augue. Phasellus efficitur felis non ligula dictum, sit amet faucibus nulla sollicitudin. Donec condimentum metus enim, id molestie urna ultrices sed. Nunc rhoncus purus venenatis nulla efficitur, a ultrices elit ornare. Donec vitae congue ante. Sed eleifend ex sit amet odio vestibulum, ac sagittis quam finibus. Ut egestas sit amet urna eu blandit. Duis iaculis ante vitae risus condimentum, vitae laoreet sem dapibus. Aliquam ultricies risus quis sagittis fermentum. Suspendisse interdum magna erat, viverra elementum sem sollicitudin eget\n           Aliquam ultricies\n\n           Fusce vitae lacinia mauris, eget vehicula augue. Phasellus efficitur felis non ligula dictum, sit amet faucibus nulla sollicitudin. Donec condimentum metus enim, id molestie urna ultrices sed. Nunc rhoncus purus venenatis nulla efficitur, a ultrices elit ornare. Donec vitae congue ante. Sed eleifend ex sit amet odio vestibulum, ac sagittis quam finibus. Ut egestas sit amet urna eu blandit. Duis iaculis ante vitae risus condimentum, vitae laoreet sem dapibus. Aliquam ultricies risus quis sagittis fermentum. Suspendisse interdum magna erat, viverra elementum sem sollicitudin eget\n           ', 55555, '<h4 class=\"title\" style=\"font-weight: 600; line-height: 1.2381; font-size: 20px; color: rgb(5, 14, 51);\"><div class=\"product-services\" style=\"display: flex; margin-top: 1.5em; color: rgb(118, 118, 120); font-family: Jost, sans-serif; font-size: 16px; font-weight: 400;\"><span style=\"width: 115px; font-weight: 600; padding-right: 0px;\">Services:</span><ul class=\"product-services-list\" style=\"padding: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; list-style-position: initial; list-style-image: initial; flex: 0 0 calc(100% - 115px); line-height: 28px;\"><li class=\"product-service-item\">30 Day Return Policy</li><li class=\"product-service-item\">Cash on Delivery available</li><li class=\"product-service-item\">Free Delivery</li></ul></div><div class=\"woocommerce-product-details__short-description\" style=\"display: flex; margin-top: 1.5em; color: rgb(118, 118, 120); font-family: Jost, sans-serif; font-size: 16px; font-weight: 400;\"><span style=\"width: 115px; font-weight: 600; padding-right: 0px;\">Highlights:</span><div class=\"short-description\" style=\"flex: 0 0 calc(100% - 115px);\"><ul style=\"padding: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; list-style-position: initial; list-style-image: initial; line-height: 28px;\"><li>Regular Fit.</li><li>Full sleeves.</li><li>70% cotton, 30% polyester.</li><li>Easy to wear and versatile as Casual.</li><li>Machine wash, tumble dry.</li></ul></div></div></h4>', 1, 28, 'watch', NULL, NULL, 2, '5-7 days', 0, NULL, NULL, NULL, 'Physical', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 1, 0, 1, 1, 0, '2019-09-09 12:36:06', '2022-02-08 22:33:50', 1, '2021-06-30', '10,20,30,40', '5,10,15,20', 0, 0, 1, 0, NULL, NULL, NULL, 1),
(128, 'pr613jsv1', 'normal', NULL, 13, 5, 6, NULL, NULL, 'Top Rated product title will be here according to your wish 102', 'top-rated-product-title-will-be-here-according-to-your-wish-102-pr613jsv1', '1639456384gCuvZIXe.png', '1639456386BpfFKqHN.jpg', NULL, 'S,S,S,M,M,M,L,L,L,XL,XL,XL,XXL,XXL,XXL', '98,100,99,100,100,100,100,100,100,100,100,100,100,100,100', '1,2,3,1,2,3,1,2,3,1,2,3,1,2,3', '#000000,#f41c1c,#3c34d5,#c12ec8,#007137,#000000,#f41c1c,#3c34d5,#007137,#c12ec8,#f41c1c,#3c34d5,#007137,#000000,#c12ec8', 100, 500, 'Donec condimentum\n\n           Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras cursus pretium sapien, in pulvinar ipsum molestie id. Aliquam erat volutpat. Duis quam tellus, ullamcorper at tristique ac, viverra at diam. Donec egestas eu odio tincidunt ultrices. Suspendisse egestas vulputate mauris non commodo. In convallis aliquam vulputate. Quisque varius est ac lorem venenatis lobortis. Fusce a iaculis mi, ut elementum ex. Mauris faucibus enim quis lacinia mollis. Vivamus in volutpat ante. Nullam nec vulputate mi. Fusce tempor cursus odio, nec cursus purus malesuada sit amet.\n           Aliquam ultricies\n\n           Fusce vitae lacinia mauris, eget vehicula augue. Phasellus efficitur felis non ligula dictum, sit amet faucibus nulla sollicitudin. Donec condimentum metus enim, id molestie urna ultrices sed. Nunc rhoncus purus venenatis nulla efficitur, a ultrices elit ornare. Donec vitae congue ante. Sed eleifend ex sit amet odio vestibulum, ac sagittis quam finibus. Ut egestas sit amet urna eu blandit. Duis iaculis ante vitae risus condimentum, vitae laoreet sem dapibus. Aliquam ultricies risus quis sagittis fermentum. Suspendisse interdum magna erat, viverra elementum sem sollicitudin eget\n           Aliquam ultricies\n\n           Fusce vitae lacinia mauris, eget vehicula augue. Phasellus efficitur felis non ligula dictum, sit amet faucibus nulla sollicitudin. Donec condimentum metus enim, id molestie urna ultrices sed. Nunc rhoncus purus venenatis nulla efficitur, a ultrices elit ornare. Donec vitae congue ante. Sed eleifend ex sit amet odio vestibulum, ac sagittis quam finibus. Ut egestas sit amet urna eu blandit. Duis iaculis ante vitae risus condimentum, vitae laoreet sem dapibus. Aliquam ultricies risus quis sagittis fermentum. Suspendisse interdum magna erat, viverra elementum sem sollicitudin eget\n           ', NULL, '<h4 class=\"title\" style=\"font-weight: 600; line-height: 1.2381; font-size: 20px; color: rgb(5, 14, 51);\"><div class=\"product-services\" style=\"display: flex; margin-top: 1.5em; color: rgb(118, 118, 120); font-family: Jost, sans-serif; font-size: 16px; font-weight: 400;\"><span style=\"width: 115px; font-weight: 600; padding-right: 0px;\">Services:</span><ul class=\"product-services-list\" style=\"padding: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; list-style-position: initial; list-style-image: initial; flex: 0 0 calc(100% - 115px); line-height: 28px;\"><li class=\"product-service-item\">30 Day Return Policy</li><li class=\"product-service-item\">Cash on Delivery available</li><li class=\"product-service-item\">Free Delivery</li></ul></div><div class=\"woocommerce-product-details__short-description\" style=\"display: flex; margin-top: 1.5em; color: rgb(118, 118, 120); font-family: Jost, sans-serif; font-size: 16px; font-weight: 400;\"><span style=\"width: 115px; font-weight: 600; padding-right: 0px;\">Highlights:</span><div class=\"short-description\" style=\"flex: 0 0 calc(100% - 115px);\"><ul style=\"padding: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; list-style-position: initial; list-style-image: initial; line-height: 28px;\"><li>Regular Fit.</li><li>Full sleeves.</li><li>70% cotton, 30% polyester.</li><li>Easy to wear and versatile as Casual.</li><li>Machine wash, tumble dry.</li></ul></div></div></h4>', 1, 25, 'fashion', 'Keyword1,Keyword 2', '#42c406,#f00505', 2, '5-7 days', 0, 'fashion', 'Fashion meta tag from Demo store.', 'https://www.youtube.com/watch?v=HxNydN5tScI', 'Physical', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, 1, 1, 0, 1, 1, '2019-09-09 13:00:05', '2022-03-24 12:46:07', 1, '2022-03-24', '10,20,30,40', '5,10,15,20', 0, 0, 1, 0, NULL, NULL, NULL, 1),
(135, '3uZ9903ofs1', 'normal', NULL, 13, 11, NULL, 1, NULL, '32 \'\'NAPCO D/GLASS ULTRA SLIM HD lED TV ES700E', '32-napco-dglass-ultra-slim-hd-led-tv-es700e-3uz9903ofs1', '1639392738Dts57dc4.png', '1639392738TGJsX6up.jpg', NULL, NULL, NULL, NULL, NULL, 30, 50, 'Donec condimentum\n\n           Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras cursus pretium sapien, in pulvinar ipsum molestie id. Aliquam erat volutpat. Duis quam tellus, ullamcorper at tristique ac, viverra at diam. Donec egestas eu odio tincidunt ultrices. Suspendisse egestas vulputate mauris non commodo. In convallis aliquam vulputate. Quisque varius est ac lorem venenatis lobortis. Fusce a iaculis mi, ut elementum ex. Mauris faucibus enim quis lacinia mollis. Vivamus in volutpat ante. Nullam nec vulputate mi. Fusce tempor cursus odio, nec cursus purus malesuada sit amet.\n           Aliquam ultricies\n\n           Fusce vitae lacinia mauris, eget vehicula augue. Phasellus efficitur felis non ligula dictum, sit amet faucibus nulla sollicitudin. Donec condimentum metus enim, id molestie urna ultrices sed. Nunc rhoncus purus venenatis nulla efficitur, a ultrices elit ornare. Donec vitae congue ante. Sed eleifend ex sit amet odio vestibulum, ac sagittis quam finibus. Ut egestas sit amet urna eu blandit. Duis iaculis ante vitae risus condimentum, vitae laoreet sem dapibus. Aliquam ultricies risus quis sagittis fermentum. Suspendisse interdum magna erat, viverra elementum sem sollicitudin eget\n           Aliquam ultricies\n\n           Fusce vitae lacinia mauris, eget vehicula augue. Phasellus efficitur felis non ligula dictum, sit amet faucibus nulla sollicitudin. Donec condimentum metus enim, id molestie urna ultrices sed. Nunc rhoncus purus venenatis nulla efficitur, a ultrices elit ornare. Donec vitae congue ante. Sed eleifend ex sit amet odio vestibulum, ac sagittis quam finibus. Ut egestas sit amet urna eu blandit. Duis iaculis ante vitae risus condimentum, vitae laoreet sem dapibus. Aliquam ultricies risus quis sagittis fermentum. Suspendisse interdum magna erat, viverra elementum sem sollicitudin eget\n           ', 395, '<h4 class=\"title\" style=\"font-weight: 600; line-height: 1.2381; font-size: 20px; color: rgb(5, 14, 51);\"><div class=\"product-services\" style=\"display: flex; margin-top: 1.5em; color: rgb(118, 118, 120); font-family: Jost, sans-serif; font-size: 16px; font-weight: 400;\"><span style=\"width: 115px; font-weight: 600; padding-right: 0px;\">Services:</span><ul class=\"product-services-list\" style=\"padding: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; list-style-position: initial; list-style-image: initial; flex: 0 0 calc(100% - 115px); line-height: 28px;\"><li class=\"product-service-item\">30 Day Return Policy</li><li class=\"product-service-item\">Cash on Delivery available</li><li class=\"product-service-item\">Free Delivery</li></ul></div><div class=\"woocommerce-product-details__short-description\" style=\"display: flex; margin-top: 1.5em; color: rgb(118, 118, 120); font-family: Jost, sans-serif; font-size: 16px; font-weight: 400;\"><span style=\"width: 115px; font-weight: 600; padding-right: 0px;\">Highlights:</span><div class=\"short-description\" style=\"flex: 0 0 calc(100% - 115px);\"><ul style=\"padding: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; list-style-position: initial; list-style-image: initial; line-height: 28px;\"><li>Regular Fit.</li><li>Full sleeves.</li><li>70% cotton, 30% polyester.</li><li>Easy to wear and versatile as Casual.</li><li>Machine wash, tumble dry.</li></ul></div></div></h4>', 1, 97, 'lcd,tv,led', NULL, NULL, 2, '24 hour', 0, NULL, NULL, 'https://www.youtube.com/watch?v=LIqQNG_q2us', 'Physical', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 0, 0, 1, 0, 1, 1, '2019-09-29 23:08:12', '2022-02-27 04:46:39', 1, '2022-03-23', '15,20,30,40,50', '10,15,20,25,30', 1, 0, 1, 0, NULL, NULL, NULL, 0),
(144, 'vrX2915O5c1', 'normal', NULL, 13, 4, 2, 1, '{\"warranty_type\":{\"values\":[\"No warranty\",\"international manufacturer warranty\",\"Non-local warranty\"],\"prices\":[\"5\",\"10\",\"15\"],\"details_status\":1},\"color_family\":{\"values\":[\"Black\",\"White\",\"Sliver\",\"Red\"],\"prices\":[\"10\",\"12\",\"15\",\"20\"],\"details_status\":1}}', '32 \'\'NAPCO D/GLASS ULTRA SLIM HD lED TV ES700E', '32-napco-dglass-ultra-slim-hd-led-tv-es700e-vrx2915o5c1', '1639392531ypne3xL8.png', '1639392531mZxqr9sa.jpg', NULL, NULL, NULL, NULL, NULL, 300, 500, 'Donec condimentum\n\n           Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras cursus pretium sapien, in pulvinar ipsum molestie id. Aliquam erat volutpat. Duis quam tellus, ullamcorper at tristique ac, viverra at diam. Donec egestas eu odio tincidunt ultrices. Suspendisse egestas vulputate mauris non commodo. In convallis aliquam vulputate. Quisque varius est ac lorem venenatis lobortis. Fusce a iaculis mi, ut elementum ex. Mauris faucibus enim quis lacinia mollis. Vivamus in volutpat ante. Nullam nec vulputate mi. Fusce tempor cursus odio, nec cursus purus malesuada sit amet.\n           Aliquam ultricies\n\n           Fusce vitae lacinia mauris, eget vehicula augue. Phasellus efficitur felis non ligula dictum, sit amet faucibus nulla sollicitudin. Donec condimentum metus enim, id molestie urna ultrices sed. Nunc rhoncus purus venenatis nulla efficitur, a ultrices elit ornare. Donec vitae congue ante. Sed eleifend ex sit amet odio vestibulum, ac sagittis quam finibus. Ut egestas sit amet urna eu blandit. Duis iaculis ante vitae risus condimentum, vitae laoreet sem dapibus. Aliquam ultricies risus quis sagittis fermentum. Suspendisse interdum magna erat, viverra elementum sem sollicitudin eget\n           Aliquam ultricies\n\n           Fusce vitae lacinia mauris, eget vehicula augue. Phasellus efficitur felis non ligula dictum, sit amet faucibus nulla sollicitudin. Donec condimentum metus enim, id molestie urna ultrices sed. Nunc rhoncus purus venenatis nulla efficitur, a ultrices elit ornare. Donec vitae congue ante. Sed eleifend ex sit amet odio vestibulum, ac sagittis quam finibus. Ut egestas sit amet urna eu blandit. Duis iaculis ante vitae risus condimentum, vitae laoreet sem dapibus. Aliquam ultricies risus quis sagittis fermentum. Suspendisse interdum magna erat, viverra elementum sem sollicitudin eget\n           ', 396, '<h4 class=\"title\" style=\"font-weight: 600; line-height: 1.2381; font-size: 20px; color: rgb(5, 14, 51);\"><div class=\"product-services\" style=\"display: flex; margin-top: 1.5em; color: rgb(118, 118, 120); font-family: Jost, sans-serif; font-size: 16px; font-weight: 400;\"><span style=\"width: 115px; font-weight: 600; padding-right: 0px;\">Services:</span><ul class=\"product-services-list\" style=\"padding: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; list-style-position: initial; list-style-image: initial; flex: 0 0 calc(100% - 115px); line-height: 28px;\"><li class=\"product-service-item\">30 Day Return Policy</li><li class=\"product-service-item\">Cash on Delivery available</li><li class=\"product-service-item\">Free Delivery</li></ul></div><div class=\"woocommerce-product-details__short-description\" style=\"display: flex; margin-top: 1.5em; color: rgb(118, 118, 120); font-family: Jost, sans-serif; font-size: 16px; font-weight: 400;\"><span style=\"width: 115px; font-weight: 600; padding-right: 0px;\">Highlights:</span><div class=\"short-description\" style=\"flex: 0 0 calc(100% - 115px);\"><ul style=\"padding: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; list-style-position: initial; list-style-image: initial; line-height: 28px;\"><li>Regular Fit.</li><li>Full sleeves.</li><li>70% cotton, 30% polyester.</li><li>Easy to wear and versatile as Casual.</li><li>Machine wash, tumble dry.</li></ul></div></div></h4>', 1, 49, 'lcd,tv,led', NULL, NULL, 2, '24 hour', 0, NULL, NULL, 'https://www.youtube.com/watch?v=LIqQNG_q2us', 'Physical', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 1, 1, 0, 1, 1, '2019-10-02 21:21:58', '2022-02-24 03:50:52', 0, NULL, '15,20,30,40,50', '10,15,20,25,30', 0, 135, 1, 0, '5', NULL, NULL, 0),
(159, 'zhv5144fRY1', 'normal', NULL, 13, 5, 6, NULL, '{\"warranty_type\":{\"values\":[\"No Warranty\",\"Local seller Warranty\",\"Non local warranty\"],\"prices\":[\"0\",\"5\",\"10\"],\"details_status\":1}}', 'Revel - Real Estate HTML Template', 'revel-real-estate-html-template-zhv5144fry1', '1639392452QopalU8v.png', '16393924528O19PHvm.jpg', NULL, NULL, NULL, NULL, NULL, 300, 346, 'Donec condimentum\n\n           Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras cursus pretium sapien, in pulvinar ipsum molestie id. Aliquam erat volutpat. Duis quam tellus, ullamcorper at tristique ac, viverra at diam. Donec egestas eu odio tincidunt ultrices. Suspendisse egestas vulputate mauris non commodo. In convallis aliquam vulputate. Quisque varius est ac lorem venenatis lobortis. Fusce a iaculis mi, ut elementum ex. Mauris faucibus enim quis lacinia mollis. Vivamus in volutpat ante. Nullam nec vulputate mi. Fusce tempor cursus odio, nec cursus purus malesuada sit amet.\n           Aliquam ultricies\n\n           Fusce vitae lacinia mauris, eget vehicula augue. Phasellus efficitur felis non ligula dictum, sit amet faucibus nulla sollicitudin. Donec condimentum metus enim, id molestie urna ultrices sed. Nunc rhoncus purus venenatis nulla efficitur, a ultrices elit ornare. Donec vitae congue ante. Sed eleifend ex sit amet odio vestibulum, ac sagittis quam finibus. Ut egestas sit amet urna eu blandit. Duis iaculis ante vitae risus condimentum, vitae laoreet sem dapibus. Aliquam ultricies risus quis sagittis fermentum. Suspendisse interdum magna erat, viverra elementum sem sollicitudin eget\n           Aliquam ultricies\n\n           Fusce vitae lacinia mauris, eget vehicula augue. Phasellus efficitur felis non ligula dictum, sit amet faucibus nulla sollicitudin. Donec condimentum metus enim, id molestie urna ultrices sed. Nunc rhoncus purus venenatis nulla efficitur, a ultrices elit ornare. Donec vitae congue ante. Sed eleifend ex sit amet odio vestibulum, ac sagittis quam finibus. Ut egestas sit amet urna eu blandit. Duis iaculis ante vitae risus condimentum, vitae laoreet sem dapibus. Aliquam ultricies risus quis sagittis fermentum. Suspendisse interdum magna erat, viverra elementum sem sollicitudin eget\n           ', 34634, '<h4 class=\"title\" style=\"font-weight: 600; line-height: 1.2381; font-size: 20px; color: rgb(5, 14, 51);\"><div class=\"product-services\" style=\"display: flex; margin-top: 1.5em; color: rgb(118, 118, 120); font-family: Jost, sans-serif; font-size: 16px; font-weight: 400;\"><span style=\"width: 115px; font-weight: 600; padding-right: 0px;\">Services:</span><ul class=\"product-services-list\" style=\"padding: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; list-style-position: initial; list-style-image: initial; flex: 0 0 calc(100% - 115px); line-height: 28px;\"><li class=\"product-service-item\">30 Day Return Policy</li><li class=\"product-service-item\">Cash on Delivery available</li><li class=\"product-service-item\">Free Delivery</li></ul></div><div class=\"woocommerce-product-details__short-description\" style=\"display: flex; margin-top: 1.5em; color: rgb(118, 118, 120); font-family: Jost, sans-serif; font-size: 16px; font-weight: 400;\"><span style=\"width: 115px; font-weight: 600; padding-right: 0px;\">Highlights:</span><div class=\"short-description\" style=\"flex: 0 0 calc(100% - 115px);\"><ul style=\"padding: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; list-style-position: initial; list-style-image: initial; line-height: 28px;\"><li>Regular Fit.</li><li>Full sleeves.</li><li>70% cotton, 30% polyester.</li><li>Easy to wear and versatile as Casual.</li><li>Machine wash, tumble dry.</li></ul></div></div></h4>', 1, 26, NULL, NULL, NULL, 2, '24 hour', 0, NULL, NULL, 'https://www.youtube.com/watch?v=MIJBxqzazeM', 'Physical', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, 1, 1, 0, 1, 0, '2019-10-03 00:47:25', '2022-03-01 05:48:19', 0, NULL, '15,20,30,40,50', '10,15,20,25,30', 0, 0, 1, 0, '5', NULL, NULL, 0),
(160, 'o1L5621DiS1', 'normal', NULL, 13, 5, 6, NULL, NULL, 'Zain - Digital Agency and Startup HTML Template', 'zain-digital-agency-and-startup-html-template-o1l5621dis1', '1639392363pYiiT6Vy.png', '1639392364Li5C3bEO.jpg', NULL, NULL, NULL, NULL, NULL, 346, 346, 'Donec condimentum\n\n           Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras cursus pretium sapien, in pulvinar ipsum molestie id. Aliquam erat volutpat. Duis quam tellus, ullamcorper at tristique ac, viverra at diam. Donec egestas eu odio tincidunt ultrices. Suspendisse egestas vulputate mauris non commodo. In convallis aliquam vulputate. Quisque varius est ac lorem venenatis lobortis. Fusce a iaculis mi, ut elementum ex. Mauris faucibus enim quis lacinia mollis. Vivamus in volutpat ante. Nullam nec vulputate mi. Fusce tempor cursus odio, nec cursus purus malesuada sit amet.\n           Aliquam ultricies\n\n           Fusce vitae lacinia mauris, eget vehicula augue. Phasellus efficitur felis non ligula dictum, sit amet faucibus nulla sollicitudin. Donec condimentum metus enim, id molestie urna ultrices sed. Nunc rhoncus purus venenatis nulla efficitur, a ultrices elit ornare. Donec vitae congue ante. Sed eleifend ex sit amet odio vestibulum, ac sagittis quam finibus. Ut egestas sit amet urna eu blandit. Duis iaculis ante vitae risus condimentum, vitae laoreet sem dapibus. Aliquam ultricies risus quis sagittis fermentum. Suspendisse interdum magna erat, viverra elementum sem sollicitudin eget\n           Aliquam ultricies\n\n           Fusce vitae lacinia mauris, eget vehicula augue. Phasellus efficitur felis non ligula dictum, sit amet faucibus nulla sollicitudin. Donec condimentum metus enim, id molestie urna ultrices sed. Nunc rhoncus purus venenatis nulla efficitur, a ultrices elit ornare. Donec vitae congue ante. Sed eleifend ex sit amet odio vestibulum, ac sagittis quam finibus. Ut egestas sit amet urna eu blandit. Duis iaculis ante vitae risus condimentum, vitae laoreet sem dapibus. Aliquam ultricies risus quis sagittis fermentum. Suspendisse interdum magna erat, viverra elementum sem sollicitudin eget\n           ', 34, '<h4 class=\"title\" style=\"font-weight: 600; line-height: 1.2381; font-size: 20px; color: rgb(5, 14, 51);\"><div class=\"product-services\" style=\"display: flex; margin-top: 1.5em; color: rgb(118, 118, 120); font-family: Jost, sans-serif; font-size: 16px; font-weight: 400;\"><span style=\"width: 115px; font-weight: 600; padding-right: 0px;\">Services:</span><ul class=\"product-services-list\" style=\"padding: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; list-style-position: initial; list-style-image: initial; flex: 0 0 calc(100% - 115px); line-height: 28px;\"><li class=\"product-service-item\">30 Day Return Policy</li><li class=\"product-service-item\">Cash on Delivery available</li><li class=\"product-service-item\">Free Delivery</li></ul></div><div class=\"woocommerce-product-details__short-description\" style=\"display: flex; margin-top: 1.5em; color: rgb(118, 118, 120); font-family: Jost, sans-serif; font-size: 16px; font-weight: 400;\"><span style=\"width: 115px; font-weight: 600; padding-right: 0px;\">Highlights:</span><div class=\"short-description\" style=\"flex: 0 0 calc(100% - 115px);\"><ul style=\"padding: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; list-style-position: initial; list-style-image: initial; line-height: 28px;\"><li>Regular Fit.</li><li>Full sleeves.</li><li>70% cotton, 30% polyester.</li><li>Easy to wear and versatile as Casual.</li><li>Machine wash, tumble dry.</li></ul></div></div></h4>', 1, 63, NULL, NULL, NULL, 2, '24 hour', 0, NULL, NULL, 'https://www.youtube.com/watch?v=MIJBxqzazeM', 'Physical', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, 1, 1, 1, 0, 1, '2019-10-03 00:54:14', '2022-03-24 15:58:41', 0, NULL, '15,20,30,40,50', '10,15,20,25,30', 0, 0, 1, 0, '5', NULL, NULL, 0),
(161, 'D2e6433Yi01', 'normal', NULL, 13, 4, 2, 1, '{\"warranty_type\":{\"values\":[\"Local seller warranty\",\"No warranty\",\"international manufacturer warranty\"],\"prices\":[\"10\",\"15\",\"20\"],\"details_status\":1},\"brand\":{\"values\":[\"Oppo\",\"EStore\",\"Infinix\"],\"prices\":[\"10\",\"15\",\"20\"],\"details_status\":1},\"ram\":{\"values\":[\"2 GB\",\"3 GB\"],\"prices\":[\"0\",\"0\"],\"details_status\":1},\"color_family\":{\"values\":[\"White\",\"Sliver\",\"Red\",\"Dark Grey\"],\"prices\":[\"10\",\"15\",\"20\",\"25\"],\"details_status\":1}}', 'Revel - Real Estate HTML Template', 'revel-real-estate-html-template-d2e6433yi01', '16393784188Gm57Wu2.png', '1639378418BxWim5Uq.jpg', NULL, NULL, NULL, NULL, NULL, 300, 400, 'Donec condimentum\n\n           Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras cursus pretium sapien, in pulvinar ipsum molestie id. Aliquam erat volutpat. Duis quam tellus, ullamcorper at tristique ac, viverra at diam. Donec egestas eu odio tincidunt ultrices. Suspendisse egestas vulputate mauris non commodo. In convallis aliquam vulputate. Quisque varius est ac lorem venenatis lobortis. Fusce a iaculis mi, ut elementum ex. Mauris faucibus enim quis lacinia mollis. Vivamus in volutpat ante. Nullam nec vulputate mi. Fusce tempor cursus odio, nec cursus purus malesuada sit amet.\n           Aliquam ultricies\n\n           Fusce vitae lacinia mauris, eget vehicula augue. Phasellus efficitur felis non ligula dictum, sit amet faucibus nulla sollicitudin. Donec condimentum metus enim, id molestie urna ultrices sed. Nunc rhoncus purus venenatis nulla efficitur, a ultrices elit ornare. Donec vitae congue ante. Sed eleifend ex sit amet odio vestibulum, ac sagittis quam finibus. Ut egestas sit amet urna eu blandit. Duis iaculis ante vitae risus condimentum, vitae laoreet sem dapibus. Aliquam ultricies risus quis sagittis fermentum. Suspendisse interdum magna erat, viverra elementum sem sollicitudin eget\n           Aliquam ultricies\n\n           Fusce vitae lacinia mauris, eget vehicula augue. Phasellus efficitur felis non ligula dictum, sit amet faucibus nulla sollicitudin. Donec condimentum metus enim, id molestie urna ultrices sed. Nunc rhoncus purus venenatis nulla efficitur, a ultrices elit ornare. Donec vitae congue ante. Sed eleifend ex sit amet odio vestibulum, ac sagittis quam finibus. Ut egestas sit amet urna eu blandit. Duis iaculis ante vitae risus condimentum, vitae laoreet sem dapibus. Aliquam ultricies risus quis sagittis fermentum. Suspendisse interdum magna erat, viverra elementum sem sollicitudin eget\n           ', 0, '<h4 class=\"title\" style=\"font-weight: 600; line-height: 1.2381; font-size: 20px; color: rgb(5, 14, 51);\"><div class=\"product-services\" style=\"display: flex; margin-top: 1.5em; color: rgb(118, 118, 120); font-family: Jost, sans-serif; font-size: 16px; font-weight: 400;\"><span style=\"width: 115px; font-weight: 600; padding-right: 0px;\">Services:</span><ul class=\"product-services-list\" style=\"padding: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; list-style-position: initial; list-style-image: initial; flex: 0 0 calc(100% - 115px); line-height: 28px;\"><li class=\"product-service-item\">30 Day Return Policy</li><li class=\"product-service-item\">Cash on Delivery available</li><li class=\"product-service-item\">Free Delivery</li></ul></div><div class=\"woocommerce-product-details__short-description\" style=\"display: flex; margin-top: 1.5em; color: rgb(118, 118, 120); font-family: Jost, sans-serif; font-size: 16px; font-weight: 400;\"><span style=\"width: 115px; font-weight: 600; padding-right: 0px;\">Highlights:</span><div class=\"short-description\" style=\"flex: 0 0 calc(100% - 115px);\"><ul style=\"padding: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; list-style-position: initial; list-style-image: initial; line-height: 28px;\"><li>Regular Fit.</li><li>Full sleeves.</li><li>70% cotton, 30% polyester.</li><li>Easy to wear and versatile as Casual.</li><li>Machine wash, tumble dry.</li></ul></div></div></h4>', 1, 80, NULL, NULL, NULL, 2, '24 hour', 0, NULL, NULL, 'https://www.youtube.com/watch?v=MIJBxqzazeM', 'Physical', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 0, 1, 1, 1, 0, 0, '2019-10-03 01:07:59', '2022-02-15 22:18:29', 0, NULL, '15,20,30,40,50', '10,15,20,25,30', 0, 0, 1, 0, NULL, '#241c1c,#f52424,#437a0b', NULL, 0),
(162, 'tOC5844N0t1', 'normal', NULL, 13, 4, 2, 1, '{\"warranty_type\":{\"values\":[\"Local seller warranty\",\"No warranty\",\"international manufacturer warranty\",\"Non-local warranty\"],\"prices\":[\"10\",\"15\",\"20\",\"25\"],\"details_status\":1},\"brand\":{\"values\":[\"Symphony\",\"Oppo\",\"EStore\",\"Infinix\",\"Apple\"],\"prices\":[\"5\",\"10\",\"15\",\"20\",\"25\"],\"details_status\":1},\"color_family\":{\"values\":[\"Black\",\"Sliver\",\"Dark Grey\",\"Brown\"],\"prices\":[\"10\",\"15\",\"20\",\"35\"],\"details_status\":1},\"display_size\":{\"values\":[\"40\",\"22\",\"24\",\"32\",\"21\"],\"prices\":[\"120\",\"10\",\"20\",\"15\",\"60\"],\"details_status\":1}}', 'Zain - Digital Agency and Startup HTML Template', 'zain-digital-agency-and-startup-html-template-toc5844n0t1', '1639378156F9SBl2Yx.png', '1639378156sxEgX2Pk.jpg', NULL, NULL, NULL, NULL, NULL, 400, 450, 'Donec condimentum\n\n           Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras cursus pretium sapien, in pulvinar ipsum molestie id. Aliquam erat volutpat. Duis quam tellus, ullamcorper at tristique ac, viverra at diam. Donec egestas eu odio tincidunt ultrices. Suspendisse egestas vulputate mauris non commodo. In convallis aliquam vulputate. Quisque varius est ac lorem venenatis lobortis. Fusce a iaculis mi, ut elementum ex. Mauris faucibus enim quis lacinia mollis. Vivamus in volutpat ante. Nullam nec vulputate mi. Fusce tempor cursus odio, nec cursus purus malesuada sit amet.\n           Aliquam ultricies\n\n           Fusce vitae lacinia mauris, eget vehicula augue. Phasellus efficitur felis non ligula dictum, sit amet faucibus nulla sollicitudin. Donec condimentum metus enim, id molestie urna ultrices sed. Nunc rhoncus purus venenatis nulla efficitur, a ultrices elit ornare. Donec vitae congue ante. Sed eleifend ex sit amet odio vestibulum, ac sagittis quam finibus. Ut egestas sit amet urna eu blandit. Duis iaculis ante vitae risus condimentum, vitae laoreet sem dapibus. Aliquam ultricies risus quis sagittis fermentum. Suspendisse interdum magna erat, viverra elementum sem sollicitudin eget\n           Aliquam ultricies\n\n           Fusce vitae lacinia mauris, eget vehicula augue. Phasellus efficitur felis non ligula dictum, sit amet faucibus nulla sollicitudin. Donec condimentum metus enim, id molestie urna ultrices sed. Nunc rhoncus purus venenatis nulla efficitur, a ultrices elit ornare. Donec vitae congue ante. Sed eleifend ex sit amet odio vestibulum, ac sagittis quam finibus. Ut egestas sit amet urna eu blandit. Duis iaculis ante vitae risus condimentum, vitae laoreet sem dapibus. Aliquam ultricies risus quis sagittis fermentum. Suspendisse interdum magna erat, viverra elementum sem sollicitudin eget\n           ', 445, '<h4 class=\"title\" style=\"font-weight: 600; line-height: 1.2381; font-size: 20px; color: rgb(5, 14, 51);\"><div class=\"product-services\" style=\"display: flex; margin-top: 1.5em; color: rgb(118, 118, 120); font-family: Jost, sans-serif; font-size: 16px; font-weight: 400;\"><span style=\"width: 115px; font-weight: 600; padding-right: 0px;\">Services:</span><ul class=\"product-services-list\" style=\"padding: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; list-style-position: initial; list-style-image: initial; flex: 0 0 calc(100% - 115px); line-height: 28px;\"><li class=\"product-service-item\">30 Day Return Policy</li><li class=\"product-service-item\">Cash on Delivery available</li><li class=\"product-service-item\">Free Delivery</li></ul></div><div class=\"woocommerce-product-details__short-description\" style=\"display: flex; margin-top: 1.5em; color: rgb(118, 118, 120); font-family: Jost, sans-serif; font-size: 16px; font-weight: 400;\"><span style=\"width: 115px; font-weight: 600; padding-right: 0px;\">Highlights:</span><div class=\"short-description\" style=\"flex: 0 0 calc(100% - 115px);\"><ul style=\"padding: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; list-style-position: initial; list-style-image: initial; line-height: 28px;\"><li>Regular Fit.</li><li>Full sleeves.</li><li>70% cotton, 30% polyester.</li><li>Easy to wear and versatile as Casual.</li><li>Machine wash, tumble dry.</li></ul></div></div></h4>', 1, 363, 'dsf,hgf', 'Test,test1', '#000000,#d14141', 2, '24', 0, NULL, NULL, 'https://www.youtube.com/watch?v=MIJBxqzazeM', 'Physical', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, 0, 1, 1, 1, 0, 1, '2019-10-05 00:11:44', '2023-03-05 22:55:17', 0, NULL, '15,20,30,40,50', '10,15,20,25,30', 0, 0, 1, 0, NULL, '#c71f1f,#000000,#00c236', NULL, 0),
(163, '1ui8665inp1', 'normal', NULL, 13, 7, NULL, NULL, NULL, 'Zain - Digital Agency and Startup HTML Template', 'zain-digital-agency-and-startup-html-template-1ui8665inp1', '1648014087Du4NpEMJ.png', '16480140873qDlGgIK.jpg', NULL, 'S,S,S,M,M,M,L,L,L,XL,XL,XL', '100,100,100,100,100,100,100,100,100,100,100,100', '1,2,3,1,2,3,1,2,3,1,2,3', '#000000,#f41c1c,#3c34d5,#c12ec8,#007137,#000000,#f41c1c,#3c34d5,#007137,#c12ec8,#f41c1c,#3c34d5', 300, 464, 'Donec condimentum\r\n\r\n           Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras cursus pretium sapien, in pulvinar ipsum molestie id. Aliquam erat volutpat. Duis quam tellus, ullamcorper at tristique ac, viverra at diam. Donec egestas eu odio tincidunt ultrices. Suspendisse egestas vulputate mauris non commodo. In convallis aliquam vulputate. Quisque varius est ac lorem venenatis lobortis. Fusce a iaculis mi, ut elementum ex. Mauris faucibus enim quis lacinia mollis. Vivamus in volutpat ante. Nullam nec vulputate mi. Fusce tempor cursus odio, nec cursus purus malesuada sit amet.\r\n           Aliquam ultricies\r\n\r\n           Fusce vitae lacinia mauris, eget vehicula augue. Phasellus efficitur felis non ligula dictum, sit amet faucibus nulla sollicitudin. Donec condimentum metus enim, id molestie urna ultrices sed. Nunc rhoncus purus venenatis nulla efficitur, a ultrices elit ornare. Donec vitae congue ante. Sed eleifend ex sit amet odio vestibulum, ac sagittis quam finibus. Ut egestas sit amet urna eu blandit. Duis iaculis ante vitae risus condimentum, vitae laoreet sem dapibus. Aliquam ultricies risus quis sagittis fermentum. Suspendisse interdum magna erat, viverra elementum sem sollicitudin eget\r\n           Aliquam ultricies\r\n\r\n           Fusce vitae lacinia mauris, eget vehicula augue. Phasellus efficitur felis non ligula dictum, sit amet faucibus nulla sollicitudin. Donec condimentum metus enim, id molestie urna ultrices sed. Nunc rhoncus purus venenatis nulla efficitur, a ultrices elit ornare. Donec vitae congue ante. Sed eleifend ex sit amet odio vestibulum, ac sagittis quam finibus. Ut egestas sit amet urna eu blandit. Duis iaculis ante vitae risus condimentum, vitae laoreet sem dapibus. Aliquam ultricies risus quis sagittis fermentum. Suspendisse interdum magna erat, viverra elementum sem sollicitudin eget', 734, '<h4 class=\"title\" style=\"font-weight: 600; line-height: 1.2381; font-size: 20px; color: rgb(5, 14, 51);\"><div class=\"product-services\" style=\"display: flex; margin-top: 1.5em; color: rgb(118, 118, 120); font-family: Jost, sans-serif; font-size: 16px; font-weight: 400;\"><span style=\"width: 115px; font-weight: 600; padding-right: 0px;\">Services:</span><ul class=\"product-services-list\" style=\"padding: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; list-style-position: initial; list-style-image: initial; flex: 0 0 calc(100% - 115px); line-height: 28px;\"><li class=\"product-service-item\">30 Day Return Policy</li><li class=\"product-service-item\">Cash on Delivery available</li><li class=\"product-service-item\">Free Delivery</li></ul></div><div class=\"woocommerce-product-details__short-description\" style=\"display: flex; margin-top: 1.5em; color: rgb(118, 118, 120); font-family: Jost, sans-serif; font-size: 16px; font-weight: 400;\"><span style=\"width: 115px; font-weight: 600; padding-right: 0px;\">Highlights:</span><div class=\"short-description\" style=\"flex: 0 0 calc(100% - 115px);\"><ul style=\"padding: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; list-style-position: initial; list-style-image: initial; line-height: 28px;\"><li>Regular Fit.</li><li>Full sleeves.</li><li>70% cotton, 30% polyester.</li><li>Easy to wear and versatile as Casual.</li><li>Machine wash, tumble dry.</li></ul></div></div></h4>', 1, 90, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL, 'https://www.youtube.com/watch?v=MIJBxqzazeM', 'Physical', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, 1, 0, 1, 0, 1, '2019-10-05 00:58:14', '2022-03-24 13:14:40', 1, '2022-06-10', '10,20,30,40', '5,10,15,20', 0, 0, 1, 0, NULL, NULL, NULL, 1),
(164, 'RXp8737LeV1', 'normal', NULL, 13, 5, 9, NULL, NULL, 'Zain - Digital Agency and Startup HTML Template', 'zain-digital-agency-and-startup-html-template-rxp8737lev1', '1639378035iwML8B6F.png', '1639378035XJWgisPU.jpg', NULL, 'S,S,S,M,M,M,L,L,L,XL,XL,XL,XXL,XXL,XXL', '99,100,100,100,100,100,100,100,100,100,100,100,100,100,100', '1,2,3,1,2,3,1,2,3,1,2,3,1,2,3', '#000000,#f41c1c,#3c34d5,#c12ec8,#007137,#000000,#f41c1c,#3c34d5,#007137,#c12ec8,#f41c1c,#3c34d5,#007137,#000000,#c12ec8', 300, 548, 'Donec condimentum\n\n           Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras cursus pretium sapien, in pulvinar ipsum molestie id. Aliquam erat volutpat. Duis quam tellus, ullamcorper at tristique ac, viverra at diam. Donec egestas eu odio tincidunt ultrices. Suspendisse egestas vulputate mauris non commodo. In convallis aliquam vulputate. Quisque varius est ac lorem venenatis lobortis. Fusce a iaculis mi, ut elementum ex. Mauris faucibus enim quis lacinia mollis. Vivamus in volutpat ante. Nullam nec vulputate mi. Fusce tempor cursus odio, nec cursus purus malesuada sit amet.\n           Aliquam ultricies\n\n           Fusce vitae lacinia mauris, eget vehicula augue. Phasellus efficitur felis non ligula dictum, sit amet faucibus nulla sollicitudin. Donec condimentum metus enim, id molestie urna ultrices sed. Nunc rhoncus purus venenatis nulla efficitur, a ultrices elit ornare. Donec vitae congue ante. Sed eleifend ex sit amet odio vestibulum, ac sagittis quam finibus. Ut egestas sit amet urna eu blandit. Duis iaculis ante vitae risus condimentum, vitae laoreet sem dapibus. Aliquam ultricies risus quis sagittis fermentum. Suspendisse interdum magna erat, viverra elementum sem sollicitudin eget\n           Aliquam ultricies\n\n           Fusce vitae lacinia mauris, eget vehicula augue. Phasellus efficitur felis non ligula dictum, sit amet faucibus nulla sollicitudin. Donec condimentum metus enim, id molestie urna ultrices sed. Nunc rhoncus purus venenatis nulla efficitur, a ultrices elit ornare. Donec vitae congue ante. Sed eleifend ex sit amet odio vestibulum, ac sagittis quam finibus. Ut egestas sit amet urna eu blandit. Duis iaculis ante vitae risus condimentum, vitae laoreet sem dapibus. Aliquam ultricies risus quis sagittis fermentum. Suspendisse interdum magna erat, viverra elementum sem sollicitudin eget\n           ', 4587, '<h4 class=\"title\" style=\"font-weight: 600; line-height: 1.2381; font-size: 20px; color: rgb(5, 14, 51);\"><div class=\"product-services\" style=\"display: flex; margin-top: 1.5em; color: rgb(118, 118, 120); font-family: Jost, sans-serif; font-size: 16px; font-weight: 400;\"><span style=\"width: 115px; font-weight: 600; padding-right: 0px;\">Services:</span><ul class=\"product-services-list\" style=\"padding: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; list-style-position: initial; list-style-image: initial; flex: 0 0 calc(100% - 115px); line-height: 28px;\"><li class=\"product-service-item\">30 Day Return Policy</li><li class=\"product-service-item\">Cash on Delivery available</li><li class=\"product-service-item\">Free Delivery</li></ul></div><div class=\"woocommerce-product-details__short-description\" style=\"display: flex; margin-top: 1.5em; color: rgb(118, 118, 120); font-family: Jost, sans-serif; font-size: 16px; font-weight: 400;\"><span style=\"width: 115px; font-weight: 600; padding-right: 0px;\">Highlights:</span><div class=\"short-description\" style=\"flex: 0 0 calc(100% - 115px);\"><ul style=\"padding: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; list-style-position: initial; list-style-image: initial; line-height: 28px;\"><li>Regular Fit.</li><li>Full sleeves.</li><li>70% cotton, 30% polyester.</li><li>Easy to wear and versatile as Casual.</li><li>Machine wash, tumble dry.</li></ul></div></div></h4>', 1, 227, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL, 'https://www.youtube.com/watch?v=MIJBxqzazeM', 'Physical', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 0, 1, 0, 0, 1, '2019-10-05 00:59:33', '2022-03-24 15:58:27', 1, '2022-04-05', '10,20,30,40', '5,10,15,20', 0, 0, 1, 0, NULL, NULL, NULL, 1);
INSERT INTO `products` (`id`, `sku`, `product_type`, `affiliate_link`, `user_id`, `category_id`, `subcategory_id`, `childcategory_id`, `attributes`, `name`, `slug`, `photo`, `thumbnail`, `file`, `size`, `size_qty`, `size_price`, `color`, `price`, `previous_price`, `details`, `stock`, `policy`, `status`, `views`, `tags`, `features`, `colors`, `product_condition`, `ship`, `is_meta`, `meta_tag`, `meta_description`, `youtube`, `type`, `license`, `license_qty`, `link`, `platform`, `region`, `licence_type`, `measure`, `featured`, `best`, `top`, `hot`, `latest`, `big`, `trending`, `sale`, `created_at`, `updated_at`, `is_discount`, `discount_date`, `whole_sell_qty`, `whole_sell_discount`, `is_catalog`, `catalog_id`, `language_id`, `preordered`, `minimum_qty`, `color_all`, `size_all`, `stock_check`) VALUES
(165, 'RXp8737Le1', 'normal', NULL, 13, 16, NULL, NULL, NULL, 'Zain - Digital Agency and Startup HTML Template', 'zain-digital-agency-and-startup-html-template-rxp8737le1', '1648013669fVYfMbbZ.png', '1648013669ZDg86Ncm.jpg', NULL, NULL, NULL, NULL, NULL, 300, 548, 'Donec condimentum\r\n\r\n           Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras cursus pretium sapien, in pulvinar ipsum molestie id. Aliquam erat volutpat. Duis quam tellus, ullamcorper at tristique ac, viverra at diam. Donec egestas eu odio tincidunt ultrices. Suspendisse egestas vulputate mauris non commodo. In convallis aliquam vulputate. Quisque varius est ac lorem venenatis lobortis. Fusce a iaculis mi, ut elementum ex. Mauris faucibus enim quis lacinia mollis. Vivamus in volutpat ante. Nullam nec vulputate mi. Fusce tempor cursus odio, nec cursus purus malesuada sit amet.\r\n           Aliquam ultricies\r\n\r\n           Fusce vitae lacinia mauris, eget vehicula augue. Phasellus efficitur felis non ligula dictum, sit amet faucibus nulla sollicitudin. Donec condimentum metus enim, id molestie urna ultrices sed. Nunc rhoncus purus venenatis nulla efficitur, a ultrices elit ornare. Donec vitae congue ante. Sed eleifend ex sit amet odio vestibulum, ac sagittis quam finibus. Ut egestas sit amet urna eu blandit. Duis iaculis ante vitae risus condimentum, vitae laoreet sem dapibus. Aliquam ultricies risus quis sagittis fermentum. Suspendisse interdum magna erat, viverra elementum sem sollicitudin eget\r\n           Aliquam ultricies\r\n\r\n           Fusce vitae lacinia mauris, eget vehicula augue. Phasellus efficitur felis non ligula dictum, sit amet faucibus nulla sollicitudin. Donec condimentum metus enim, id molestie urna ultrices sed. Nunc rhoncus purus venenatis nulla efficitur, a ultrices elit ornare. Donec vitae congue ante. Sed eleifend ex sit amet odio vestibulum, ac sagittis quam finibus. Ut egestas sit amet urna eu blandit. Duis iaculis ante vitae risus condimentum, vitae laoreet sem dapibus. Aliquam ultricies risus quis sagittis fermentum. Suspendisse interdum magna erat, viverra elementum sem sollicitudin eget', 4586, '<h4 class=\"title\" style=\"font-weight: 600; line-height: 1.2381; font-size: 20px; color: rgb(5, 14, 51);\"><div class=\"product-services\" style=\"display: flex; margin-top: 1.5em; color: rgb(118, 118, 120); font-family: Jost, sans-serif; font-size: 16px; font-weight: 400;\"><span style=\"width: 115px; font-weight: 600; padding-right: 0px;\">Services:</span><ul class=\"product-services-list\" style=\"padding: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; list-style-position: initial; list-style-image: initial; flex: 0 0 calc(100% - 115px); line-height: 28px;\"><li class=\"product-service-item\">30 Day Return Policy</li><li class=\"product-service-item\">Cash on Delivery available</li><li class=\"product-service-item\">Free Delivery</li></ul></div><div class=\"woocommerce-product-details__short-description\" style=\"display: flex; margin-top: 1.5em; color: rgb(118, 118, 120); font-family: Jost, sans-serif; font-size: 16px; font-weight: 400;\"><span style=\"width: 115px; font-weight: 600; padding-right: 0px;\">Highlights:</span><div class=\"short-description\" style=\"flex: 0 0 calc(100% - 115px);\"><ul style=\"padding: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; list-style-position: initial; list-style-image: initial; line-height: 28px;\"><li>Regular Fit.</li><li>Full sleeves.</li><li>70% cotton, 30% polyester.</li><li>Easy to wear and versatile as Casual.</li><li>Machine wash, tumble dry.</li></ul></div></div></h4>', 1, 43, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL, 'https://www.youtube.com/watch?v=MIJBxqzazeM', 'Physical', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 0, 1, 0, 0, 1, 0, '2019-10-05 01:00:19', '2022-03-22 23:35:24', 0, NULL, '10,20,30,40', '5,10,15,20', 1, 0, 1, 0, NULL, NULL, NULL, 0),
(168, 'tbs53803yh1', 'normal', NULL, 13, 16, NULL, 1, '{\"brand\":{\"values\":[\"G-Shock\",\"Diesel\",\"Longines\",\"Hamilton\",\"Citizen\"],\"prices\":[\"5\",\"5\",\"5\",\"5\",\"5\"],\"details_status\":1},\"warrenty\":{\"values\":[\"Local Sell Warrenty\",\"Manufacture Warrenty\",\"International Warrenty\"],\"prices\":[\"5\",\"5\",\"5\"],\"details_status\":1},\"belt\":{\"values\":[\"Leather\",\"Stainless steel\",\"Rubber\",\"Normal\"],\"prices\":[\"5\",\"5\",\"5\",\"5\"],\"details_status\":1}}', 'Revel - Real Estate Huuu', 'revel-real-estate-huuu-tbs53803yh1', '1648013500i2EEZrBt.png', '1648013500IhrIbnTy.jpg', NULL, NULL, NULL, NULL, NULL, 300, 345, 'Donec condimentum\r\n\r\n           Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras cursus pretium sapien, in pulvinar ipsum molestie id. Aliquam erat volutpat. Duis quam tellus, ullamcorper at tristique ac, viverra at diam. Donec egestas eu odio tincidunt ultrices. Suspendisse egestas vulputate mauris non commodo. In convallis aliquam vulputate. Quisque varius est ac lorem venenatis lobortis. Fusce a iaculis mi, ut elementum ex. Mauris faucibus enim quis lacinia mollis. Vivamus in volutpat ante. Nullam nec vulputate mi. Fusce tempor cursus odio, nec cursus purus malesuada sit amet.\r\n           Aliquam ultricies\r\n\r\n           Fusce vitae lacinia mauris, eget vehicula augue. Phasellus efficitur felis non ligula dictum, sit amet faucibus nulla sollicitudin. Donec condimentum metus enim, id molestie urna ultrices sed. Nunc rhoncus purus venenatis nulla efficitur, a ultrices elit ornare. Donec vitae congue ante. Sed eleifend ex sit amet odio vestibulum, ac sagittis quam finibus. Ut egestas sit amet urna eu blandit. Duis iaculis ante vitae risus condimentum, vitae laoreet sem dapibus. Aliquam ultricies risus quis sagittis fermentum. Suspendisse interdum magna erat, viverra elementum sem sollicitudin eget\r\n           Aliquam ultricies\r\n\r\n           Fusce vitae lacinia mauris, eget vehicula augue. Phasellus efficitur felis non ligula dictum, sit amet faucibus nulla sollicitudin. Donec condimentum metus enim, id molestie urna ultrices sed. Nunc rhoncus purus venenatis nulla efficitur, a ultrices elit ornare. Donec vitae congue ante. Sed eleifend ex sit amet odio vestibulum, ac sagittis quam finibus. Ut egestas sit amet urna eu blandit. Duis iaculis ante vitae risus condimentum, vitae laoreet sem dapibus. Aliquam ultricies risus quis sagittis fermentum. Suspendisse interdum magna erat, viverra elementum sem sollicitudin eget', 6345, '<h4 class=\"title\" style=\"font-weight: 600; line-height: 1.2381; font-size: 20px; color: rgb(5, 14, 51);\"><div class=\"product-services\" style=\"display: flex; margin-top: 1.5em; color: rgb(118, 118, 120); font-family: Jost, sans-serif; font-size: 16px; font-weight: 400;\"><span style=\"width: 115px; font-weight: 600; padding-right: 0px;\">Services:</span><ul class=\"product-services-list\" style=\"padding: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; list-style-position: initial; list-style-image: initial; flex: 0 0 calc(100% - 115px); line-height: 28px;\"><li class=\"product-service-item\">30 Day Return Policy</li><li class=\"product-service-item\">Cash on Delivery available</li><li class=\"product-service-item\">Free Delivery</li></ul></div><div class=\"woocommerce-product-details__short-description\" style=\"display: flex; margin-top: 1.5em; color: rgb(118, 118, 120); font-family: Jost, sans-serif; font-size: 16px; font-weight: 400;\"><span style=\"width: 115px; font-weight: 600; padding-right: 0px;\">Highlights:</span><div class=\"short-description\" style=\"flex: 0 0 calc(100% - 115px);\"><ul style=\"padding: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; list-style-position: initial; list-style-image: initial; line-height: 28px;\"><li>Regular Fit.</li><li>Full sleeves.</li><li>70% cotton, 30% polyester.</li><li>Easy to wear and versatile as Casual.</li><li>Machine wash, tumble dry.</li></ul></div></div></h4>', 1, 76, NULL, NULL, NULL, 0, '5-10 days', 0, NULL, NULL, 'https://www.youtube.com/watch?v=MIJBxqzazeM', 'Physical', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, 1, 1, 1, 0, 0, 1, '2019-10-12 04:17:25', '2022-03-24 15:58:05', 0, NULL, '10,20,30,40', '5,10,15,20', 0, 0, 1, 0, NULL, '#f10e0e,#3e5ee7,#139d1c', NULL, 0),
(169, 'TRg5938WNy1', 'normal', NULL, 13, 5, 6, NULL, '{\"warranty_type\":{\"values\":[\"No Warranty\",\"Local seller Warranty\",\"Non local warranty\",\"International Manufacturer Warranty\",\"International Seller Warranty\"],\"prices\":[\"0\",\"5\",\"0\",\"5\",\"5\"],\"details_status\":1}}', 'Top Rated product title will be here according to your wish 123', 'top-rated-product-title-will-be-here-according-to-your-wish-123-trg5938wny1', '1639377739mqNT2g2x.png', '1639377739Zf2W38p8.jpg', NULL, NULL, NULL, NULL, NULL, 100, 500, 'Donec condimentum\r\n\r\n           Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras cursus pretium sapien, in pulvinar ipsum molestie id. Aliquam erat volutpat. Duis quam tellus, ullamcorper at tristique ac, viverra at diam. Donec egestas eu odio tincidunt ultrices. Suspendisse egestas vulputate mauris non commodo. In convallis aliquam vulputate. Quisque varius est ac lorem venenatis lobortis. Fusce a iaculis mi, ut elementum ex. Mauris faucibus enim quis lacinia mollis. Vivamus in volutpat ante. Nullam nec vulputate mi. Fusce tempor cursus odio, nec cursus purus malesuada sit amet.\r\n           Aliquam ultricies\r\n\r\n           Fusce vitae lacinia mauris, eget vehicula augue. Phasellus efficitur felis non ligula dictum, sit amet faucibus nulla sollicitudin. Donec condimentum metus enim, id molestie urna ultrices sed. Nunc rhoncus purus venenatis nulla efficitur, a ultrices elit ornare. Donec vitae congue ante. Sed eleifend ex sit amet odio vestibulum, ac sagittis quam finibus. Ut egestas sit amet urna eu blandit. Duis iaculis ante vitae risus condimentum, vitae laoreet sem dapibus. Aliquam ultricies risus quis sagittis fermentum. Suspendisse interdum magna erat, viverra elementum sem sollicitudin eget\r\n           Aliquam ultricies\r\n\r\n           Fusce vitae lacinia mauris, eget vehicula augue. Phasellus efficitur felis non ligula dictum, sit amet faucibus nulla sollicitudin. Donec condimentum metus enim, id molestie urna ultrices sed. Nunc rhoncus purus venenatis nulla efficitur, a ultrices elit ornare. Donec vitae congue ante. Sed eleifend ex sit amet odio vestibulum, ac sagittis quam finibus. Ut egestas sit amet urna eu blandit. Duis iaculis ante vitae risus condimentum, vitae laoreet sem dapibus. Aliquam ultricies risus quis sagittis fermentum. Suspendisse interdum magna erat, viverra elementum sem sollicitudin eget', NULL, '<h4 class=\"title\" style=\"font-weight: 600; line-height: 1.2381; font-size: 20px; color: rgb(5, 14, 51);\"><div class=\"product-services\" style=\"display: flex; margin-top: 1.5em; color: rgb(118, 118, 120); font-family: Jost, sans-serif; font-size: 16px; font-weight: 400;\"><span style=\"width: 115px; font-weight: 600; padding-right: 0px;\">Services:</span><ul class=\"product-services-list\" style=\"padding: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; list-style-position: initial; list-style-image: initial; flex: 0 0 calc(100% - 115px); line-height: 28px;\"><li class=\"product-service-item\">30 Day Return Policy</li><li class=\"product-service-item\">Cash on Delivery available</li><li class=\"product-service-item\">Free Delivery</li></ul></div><div class=\"woocommerce-product-details__short-description\" style=\"display: flex; margin-top: 1.5em; color: rgb(118, 118, 120); font-family: Jost, sans-serif; font-size: 16px; font-weight: 400;\"><span style=\"width: 115px; font-weight: 600; padding-right: 0px;\">Highlights:</span><div class=\"short-description\" style=\"flex: 0 0 calc(100% - 115px);\"><ul style=\"padding: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; list-style-position: initial; list-style-image: initial; line-height: 28px;\"><li>Regular Fit.</li><li>Full sleeves.</li><li>70% cotton, 30% polyester.</li><li>Easy to wear and versatile as Casual.</li><li>Machine wash, tumble dry.</li></ul></div></div></h4>', 1, 75, 'fashion', NULL, NULL, 2, '5-7 days', 0, 'fashion', 'Fashion meta tag from Demo store.', 'https://www.youtube.com/watch?v=HxNydN5tScI', 'Physical', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, 1, 0, 0, 1, 0, '2019-10-12 04:26:18', '2022-03-24 16:02:35', 0, NULL, '10,20,30,40', '5,10,15,20', 0, 123, 1, 0, NULL, NULL, '44,42,40', 0),
(170, '6Vb6172gWR1', 'normal', NULL, 13, 5, 6, NULL, NULL, 'Top Rated product title will be here according to your wish 123', 'top-rated-product-title-will-be-here-according-to-your-wish-123-6vb6172gwr1', '16480134488OmlUgJN.png', '1648013448fKLXa8ZZ.jpg', NULL, NULL, NULL, NULL, NULL, 100, 500, 'Donec condimentum\r\n\r\n           Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras cursus pretium sapien, in pulvinar ipsum molestie id. Aliquam erat volutpat. Duis quam tellus, ullamcorper at tristique ac, viverra at diam. Donec egestas eu odio tincidunt ultrices. Suspendisse egestas vulputate mauris non commodo. In convallis aliquam vulputate. Quisque varius est ac lorem venenatis lobortis. Fusce a iaculis mi, ut elementum ex. Mauris faucibus enim quis lacinia mollis. Vivamus in volutpat ante. Nullam nec vulputate mi. Fusce tempor cursus odio, nec cursus purus malesuada sit amet.\r\n           Aliquam ultricies\r\n\r\n           Fusce vitae lacinia mauris, eget vehicula augue. Phasellus efficitur felis non ligula dictum, sit amet faucibus nulla sollicitudin. Donec condimentum metus enim, id molestie urna ultrices sed. Nunc rhoncus purus venenatis nulla efficitur, a ultrices elit ornare. Donec vitae congue ante. Sed eleifend ex sit amet odio vestibulum, ac sagittis quam finibus. Ut egestas sit amet urna eu blandit. Duis iaculis ante vitae risus condimentum, vitae laoreet sem dapibus. Aliquam ultricies risus quis sagittis fermentum. Suspendisse interdum magna erat, viverra elementum sem sollicitudin eget\r\n           Aliquam ultricies\r\n\r\n           Fusce vitae lacinia mauris, eget vehicula augue. Phasellus efficitur felis non ligula dictum, sit amet faucibus nulla sollicitudin. Donec condimentum metus enim, id molestie urna ultrices sed. Nunc rhoncus purus venenatis nulla efficitur, a ultrices elit ornare. Donec vitae congue ante. Sed eleifend ex sit amet odio vestibulum, ac sagittis quam finibus. Ut egestas sit amet urna eu blandit. Duis iaculis ante vitae risus condimentum, vitae laoreet sem dapibus. Aliquam ultricies risus quis sagittis fermentum. Suspendisse interdum magna erat, viverra elementum sem sollicitudin eget', NULL, '<h4 class=\"title\" style=\"font-weight: 600; line-height: 1.2381; font-size: 20px; color: rgb(5, 14, 51);\"><div class=\"product-services\" style=\"display: flex; margin-top: 1.5em; color: rgb(118, 118, 120); font-family: Jost, sans-serif; font-size: 16px; font-weight: 400;\"><span style=\"width: 115px; font-weight: 600; padding-right: 0px;\">Services:</span><ul class=\"product-services-list\" style=\"padding: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; list-style-position: initial; list-style-image: initial; flex: 0 0 calc(100% - 115px); line-height: 28px;\"><li class=\"product-service-item\">30 Day Return Policy</li><li class=\"product-service-item\">Cash on Delivery available</li><li class=\"product-service-item\">Free Delivery</li></ul></div><div class=\"woocommerce-product-details__short-description\" style=\"display: flex; margin-top: 1.5em; color: rgb(118, 118, 120); font-family: Jost, sans-serif; font-size: 16px; font-weight: 400;\"><span style=\"width: 115px; font-weight: 600; padding-right: 0px;\">Highlights:</span><div class=\"short-description\" style=\"flex: 0 0 calc(100% - 115px);\"><ul style=\"padding: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; list-style-position: initial; list-style-image: initial; line-height: 28px;\"><li>Regular Fit.</li><li>Full sleeves.</li><li>70% cotton, 30% polyester.</li><li>Easy to wear and versatile as Casual.</li><li>Machine wash, tumble dry.</li></ul></div></div></h4>', 1, 133, 'fashion', NULL, NULL, 2, '5-7 days', 0, 'fashion', 'Fashion meta tag from Demo store.', 'https://www.youtube.com/watch?v=HxNydN5tScI', 'Physical', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 1, 0, 1, 0, 0, 1, '2019-10-12 04:29:55', '2022-03-24 13:31:58', 1, '2022-03-17', '10,20,30,40', '5,10,15,20', 0, 123, 1, 0, NULL, NULL, NULL, 0),
(175, '9gn6494iUN1', 'normal', NULL, 13, 5, 7, NULL, '{\"warranty_type\":{\"values\":[\"Local seller Warranty\",\"International Manufacturer Warranty\"],\"prices\":[\"5\",\"5\"],\"details_status\":1}}', 'Physical Product Title Title will Be Here 102', 'physical-product-title-title-will-be-here-102-9gn6494iun1', '1648013375aGqS3Zgd.png', '1648013376Q0pmYfnP.jpg', NULL, NULL, NULL, NULL, NULL, 100, 200, 'Donec condimentum\r\n\r\n           Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras cursus pretium sapien, in pulvinar ipsum molestie id. Aliquam erat volutpat. Duis quam tellus, ullamcorper at tristique ac, viverra at diam. Donec egestas eu odio tincidunt ultrices. Suspendisse egestas vulputate mauris non commodo. In convallis aliquam vulputate. Quisque varius est ac lorem venenatis lobortis. Fusce a iaculis mi, ut elementum ex. Mauris faucibus enim quis lacinia mollis. Vivamus in volutpat ante. Nullam nec vulputate mi. Fusce tempor cursus odio, nec cursus purus malesuada sit amet.\r\n           Aliquam ultricies\r\n\r\n           Fusce vitae lacinia mauris, eget vehicula augue. Phasellus efficitur felis non ligula dictum, sit amet faucibus nulla sollicitudin. Donec condimentum metus enim, id molestie urna ultrices sed. Nunc rhoncus purus venenatis nulla efficitur, a ultrices elit ornare. Donec vitae congue ante. Sed eleifend ex sit amet odio vestibulum, ac sagittis quam finibus. Ut egestas sit amet urna eu blandit. Duis iaculis ante vitae risus condimentum, vitae laoreet sem dapibus. Aliquam ultricies risus quis sagittis fermentum. Suspendisse interdum magna erat, viverra elementum sem sollicitudin eget\r\n           Aliquam ultricies\r\n\r\n           Fusce vitae lacinia mauris, eget vehicula augue. Phasellus efficitur felis non ligula dictum, sit amet faucibus nulla sollicitudin. Donec condimentum metus enim, id molestie urna ultrices sed. Nunc rhoncus purus venenatis nulla efficitur, a ultrices elit ornare. Donec vitae congue ante. Sed eleifend ex sit amet odio vestibulum, ac sagittis quam finibus. Ut egestas sit amet urna eu blandit. Duis iaculis ante vitae risus condimentum, vitae laoreet sem dapibus. Aliquam ultricies risus quis sagittis fermentum. Suspendisse interdum magna erat, viverra elementum sem sollicitudin eget', NULL, '<h4 class=\"title\" style=\"font-weight: 600; line-height: 1.2381; font-size: 20px; color: rgb(5, 14, 51);\"><div class=\"product-services\" style=\"display: flex; margin-top: 1.5em; color: rgb(118, 118, 120); font-family: Jost, sans-serif; font-size: 16px; font-weight: 400;\"><span style=\"width: 115px; font-weight: 600; padding-right: 0px;\">Services:</span><ul class=\"product-services-list\" style=\"padding: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; list-style-position: initial; list-style-image: initial; flex: 0 0 calc(100% - 115px); line-height: 28px;\"><li class=\"product-service-item\">30 Day Return Policy</li><li class=\"product-service-item\">Cash on Delivery available</li><li class=\"product-service-item\">Free Delivery</li></ul></div><div class=\"woocommerce-product-details__short-description\" style=\"display: flex; margin-top: 1.5em; color: rgb(118, 118, 120); font-family: Jost, sans-serif; font-size: 16px; font-weight: 400;\"><span style=\"width: 115px; font-weight: 600; padding-right: 0px;\">Highlights:</span><div class=\"short-description\" style=\"flex: 0 0 calc(100% - 115px);\"><ul style=\"padding: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; list-style-position: initial; list-style-image: initial; line-height: 28px;\"><li>Regular Fit.</li><li>Full sleeves.</li><li>70% cotton, 30% polyester.</li><li>Easy to wear and versatile as Casual.</li><li>Machine wash, tumble dry.</li></ul></div></div></h4>', 1, 320, 'clothing,bag', NULL, NULL, 2, '5-7 days', 0, 'clothing,bag', 'clothing, bag', 'https://www.youtube.com/watch?v=HxNydN5tScI', 'Physical', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 1, 1, 0, 0, 1, '2019-10-12 04:35:03', '2022-03-24 15:41:10', 1, '2022-03-17', '10,20,30,40', '5,10,15,20', 0, 102, 1, 0, NULL, '#14de0d,#000000,#f20c0c,#17eab7', NULL, 0),
(178, 'Tcv6794KXS1', 'normal', NULL, 13, 5, 7, NULL, NULL, 'Physical Product Title Title will Be Here 99', 'physical-product-title-title-will-be-here-99-tcv6794kxs1', '1639377187LerG6ypK.png', '1639377189b67fhAxf.jpg', NULL, NULL, NULL, NULL, NULL, 100, 200, 'Donec condimentum\n\n           Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras cursus pretium sapien, in pulvinar ipsum molestie id. Aliquam erat volutpat. Duis quam tellus, ullamcorper at tristique ac, viverra at diam. Donec egestas eu odio tincidunt ultrices. Suspendisse egestas vulputate mauris non commodo. In convallis aliquam vulputate. Quisque varius est ac lorem venenatis lobortis. Fusce a iaculis mi, ut elementum ex. Mauris faucibus enim quis lacinia mollis. Vivamus in volutpat ante. Nullam nec vulputate mi. Fusce tempor cursus odio, nec cursus purus malesuada sit amet.\n           Aliquam ultricies\n\n           Fusce vitae lacinia mauris, eget vehicula augue. Phasellus efficitur felis non ligula dictum, sit amet faucibus nulla sollicitudin. Donec condimentum metus enim, id molestie urna ultrices sed. Nunc rhoncus purus venenatis nulla efficitur, a ultrices elit ornare. Donec vitae congue ante. Sed eleifend ex sit amet odio vestibulum, ac sagittis quam finibus. Ut egestas sit amet urna eu blandit. Duis iaculis ante vitae risus condimentum, vitae laoreet sem dapibus. Aliquam ultricies risus quis sagittis fermentum. Suspendisse interdum magna erat, viverra elementum sem sollicitudin eget\n           Aliquam ultricies\n\n           Fusce vitae lacinia mauris, eget vehicula augue. Phasellus efficitur felis non ligula dictum, sit amet faucibus nulla sollicitudin. Donec condimentum metus enim, id molestie urna ultrices sed. Nunc rhoncus purus venenatis nulla efficitur, a ultrices elit ornare. Donec vitae congue ante. Sed eleifend ex sit amet odio vestibulum, ac sagittis quam finibus. Ut egestas sit amet urna eu blandit. Duis iaculis ante vitae risus condimentum, vitae laoreet sem dapibus. Aliquam ultricies risus quis sagittis fermentum. Suspendisse interdum magna erat, viverra elementum sem sollicitudin eget\n           ', NULL, '<h4 class=\"title\" style=\"font-weight: 600; line-height: 1.2381; font-size: 20px; color: rgb(5, 14, 51);\"><div class=\"product-services\" style=\"display: flex; margin-top: 1.5em; color: rgb(118, 118, 120); font-family: Jost, sans-serif; font-size: 16px; font-weight: 400;\"><span style=\"width: 115px; font-weight: 600; padding-right: 0px;\">Services:</span><ul class=\"product-services-list\" style=\"padding: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; list-style-position: initial; list-style-image: initial; flex: 0 0 calc(100% - 115px); line-height: 28px;\"><li class=\"product-service-item\">30 Day Return Policy</li><li class=\"product-service-item\">Cash on Delivery available</li><li class=\"product-service-item\">Free Delivery</li></ul></div><div class=\"woocommerce-product-details__short-description\" style=\"display: flex; margin-top: 1.5em; color: rgb(118, 118, 120); font-family: Jost, sans-serif; font-size: 16px; font-weight: 400;\"><span style=\"width: 115px; font-weight: 600; padding-right: 0px;\">Highlights:</span><div class=\"short-description\" style=\"flex: 0 0 calc(100% - 115px);\"><ul style=\"padding: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; list-style-position: initial; list-style-image: initial; line-height: 28px;\"><li>Regular Fit.</li><li>Full sleeves.</li><li>70% cotton, 30% polyester.</li><li>Easy to wear and versatile as Casual.</li><li>Machine wash, tumble dry.</li></ul></div></div></h4>', 1, 427, 'clothing,bag', NULL, NULL, 2, '5-7 days', 0, 'clothing,bag', 'clothing, bag', 'https://www.youtube.com/watch?v=HxNydN5tScI', 'Physical', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, 1, 1, 0, 0, 0, 0, '2019-10-12 04:40:20', '2022-03-24 15:18:29', 0, NULL, '10,20,30,40', '5,10,15,20', 0, 99, 1, 0, NULL, NULL, NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `product_clicks`
--

CREATE TABLE `product_clicks` (
  `id` int(191) NOT NULL,
  `product_id` int(191) NOT NULL,
  `date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ratings`
--

CREATE TABLE `ratings` (
  `id` int(191) NOT NULL,
  `user_id` int(191) NOT NULL,
  `product_id` int(191) NOT NULL,
  `review` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `rating` tinyint(2) NOT NULL,
  `review_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `replies`
--

CREATE TABLE `replies` (
  `id` int(11) NOT NULL,
  `user_id` int(191) UNSIGNED NOT NULL,
  `comment_id` int(191) UNSIGNED NOT NULL,
  `text` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `reports`
--

CREATE TABLE `reports` (
  `id` int(191) NOT NULL,
  `user_id` int(191) NOT NULL,
  `product_id` int(192) NOT NULL,
  `title` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `note` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `reviews`
--

CREATE TABLE `reviews` (
  `id` int(10) UNSIGNED NOT NULL,
  `photo` varchar(191) DEFAULT NULL,
  `title` varchar(191) DEFAULT NULL,
  `subtitle` text DEFAULT NULL,
  `details` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `rewards`
--

CREATE TABLE `rewards` (
  `id` bigint(20) NOT NULL,
  `order_amount` double NOT NULL DEFAULT 0,
  `reward` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `rewards`
--

INSERT INTO `rewards` (`id`, `order_amount`, `reward`) VALUES
(13, 200, 15),
(14, 300, 20);

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` int(191) NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `section` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `section`) VALUES
(16, 'Manager', 'orders , categories , products , affilate_products , bulk_product_upload , product_discussion , set_coupons , customers , customer_deposits , vendors , vendor_subscriptions , vendor_verifications , vendor_subscription_plans , messages , general_settings , home_page_settings , menu_page_settings , payment_settings , social_settings , language_settings , seo_tools , subscribers'),
(17, 'Moderator', 'orders , products , customers , vendors , categories , blog , messages , home_page_settings , payment_settings , social_settings , language_settings , seo_tools , subscribers'),
(18, 'Staff', 'orders , products , vendors , vendor_subscription_plans , categories , blog , home_page_settings , menu_page_settings , language_settings , seo_tools , subscribers');

-- --------------------------------------------------------

--
-- Table structure for table `seotools`
--

CREATE TABLE `seotools` (
  `id` int(10) UNSIGNED NOT NULL,
  `google_analytics` text DEFAULT NULL,
  `facebook_pixel` text DEFAULT NULL,
  `meta_keys` text DEFAULT NULL,
  `meta_description` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `seotools`
--

INSERT INTO `seotools` (`id`, `google_analytics`, `facebook_pixel`, `meta_keys`, `meta_description`) VALUES
(1, 'UA-137437974-1', 'UA-137437974-1', 'Genius,Ocean,Sea,Etc,SeaGenius', 'dsjhdeykfuyoty');

-- --------------------------------------------------------

--
-- Table structure for table `services`
--

CREATE TABLE `services` (
  `id` int(191) NOT NULL,
  `user_id` int(191) NOT NULL DEFAULT 0,
  `title` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `details` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `photo` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `language_id` int(191) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `services`
--

INSERT INTO `services` (`id`, `user_id`, `title`, `details`, `photo`, `language_id`) VALUES
(10, 0, 'Manage Quality', 'Best Quality Gaurentee', '1573019546si1.png', 1),
(11, 0, 'Manage Quality', 'Best Quality Gaurentee', '1573019563si1.png', 1),
(12, 0, 'Manage Quality', 'Best Quality Gaurentee', '1573019576si1.png', 1),
(13, 0, 'Manage Quality', 'Best Quality Gaurentee', '1573019589si1.png', 1),
(14, 0, 'Manage Quality', 'Best Quality Gaurentee', '1573019598si1.png', 1),
(15, 13, 'FREE SHIPPING', 'TEST', '1575875429brand1.png', 1),
(16, 13, 'PAYMENT METHOD', 'Secure Payment', '1575875467brand2.png', 1),
(17, 13, '30 DAY RETURNS', '30-Day Return Policy', '1575875488brand3.png', 1),
(18, 13, 'HELP CENTER', '24/7 Support System', '1575875506brand4.png', 1),
(19, 0, 'إدارة الجودة', 'أفضل ضمان الجودة', '1576400756si1.png', 2),
(20, 0, 'إدارة الجودة', 'أفضل ضمان الجودة', '1576400752si1.png', 2),
(21, 0, 'إدارة الجودة', 'أفضل ضمان الجودة', '1576400746si1.png', 2),
(22, 0, 'إدارة الجودة', 'أفضل ضمان الجودة', '1576400740si1.png', 2),
(23, 0, 'إدارة الجودة', 'أفضل ضمان الجودة', '1576400734si1.png', 2),
(24, 13, 'الشحن مجانا', 'الشحن مجانا', '1576402404brand1.png', 2),
(25, 13, 'طريقة الدفع او السداد\r\n', 'دفع امن\r\n', '1576402421brand2.png', 2),
(26, 13, '30 يوم عوائد\r\n', '30 يوما عودة السياسة', '1576402428brand3.png', 2),
(27, 13, 'مركز المساعدة', '24/7 نظام الدعم', '1576402434brand4.png', 2);

-- --------------------------------------------------------

--
-- Table structure for table `shippings`
--

CREATE TABLE `shippings` (
  `id` int(11) NOT NULL,
  `user_id` int(191) NOT NULL DEFAULT 0,
  `title` text DEFAULT NULL,
  `subtitle` text DEFAULT NULL,
  `price` double NOT NULL DEFAULT 0,
  `language_id` int(191) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `shippings`
--

INSERT INTO `shippings` (`id`, `user_id`, `title`, `subtitle`, `price`, `language_id`) VALUES
(1, 0, 'Free Shipping', '(10 - 12 days)', 0, 1),
(2, 0, 'Express Shipping', '(5 - 6 days)', 10, 1),
(5, 22, 'EMS', '8-15 Days', 26, 1);

-- --------------------------------------------------------

--
-- Table structure for table `sliders`
--

CREATE TABLE `sliders` (
  `id` int(191) UNSIGNED NOT NULL,
  `subtitle_text` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subtitle_size` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subtitle_color` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subtitle_anime` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `title_text` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `title_size` varchar(50) DEFAULT NULL,
  `title_color` varchar(50) DEFAULT NULL,
  `title_anime` varchar(50) DEFAULT NULL,
  `details_text` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `details_size` varchar(50) DEFAULT NULL,
  `details_color` varchar(50) DEFAULT NULL,
  `details_anime` varchar(50) DEFAULT NULL,
  `photo` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `position` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `link` text DEFAULT NULL,
  `language_id` int(191) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `sliders`
--

INSERT INTO `sliders` (`id`, `subtitle_text`, `subtitle_size`, `subtitle_color`, `subtitle_anime`, `title_text`, `title_size`, `title_color`, `title_anime`, `details_text`, `details_size`, `details_color`, `details_anime`, `photo`, `position`, `link`, `language_id`) VALUES
(8, 'Best Accessories', '24', '#1f224f', 'slideInUp', 'Get Up to 40% Off', '60', '#1f224f', 'slideInDown', 'Gadget for everyday to make your life more interesting and easier even smarter.', '16', '#1f224f', 'slideInLeft', '16474305667png.png', 'left', 'https://codecanyon.net/user/geniusocean/portfolio', 1),
(9, 'Fresh Foods', '24', '#1f224f', 'slideInUp', 'Get Up to 40% Off', '60', '#1f224f', 'slideInDown', 'Buy the best Organic Food for your Healthy Future and Family.', '16', '#1f224f', 'slideInDown', '164743050917png.png', 'left', 'https://codecanyon.net/user/geniusocean/portfolio', 1),
(10, 'Best Furniture', '24', '#1f224f', 'slideInUp', 'Get Up to 40% Off', '60', '#1f224f', 'slideInDown', 'Furniture must have personality, as well as be beautiful and make your home Gorgeous.', '16', '#1f224f', 'slideInRight', '164743055618png.png', 'left', 'https://codecanyon.net/user/geniusocean/portfolio', 1);

-- --------------------------------------------------------

--
-- Table structure for table `socialsettings`
--

CREATE TABLE `socialsettings` (
  `id` int(10) UNSIGNED NOT NULL,
  `facebook` varchar(191) NOT NULL,
  `gplus` varchar(191) NOT NULL,
  `twitter` varchar(191) NOT NULL,
  `linkedin` varchar(191) NOT NULL,
  `dribble` varchar(191) DEFAULT NULL,
  `f_status` tinyint(4) NOT NULL DEFAULT 1,
  `g_status` tinyint(4) NOT NULL DEFAULT 1,
  `t_status` tinyint(4) NOT NULL DEFAULT 1,
  `l_status` tinyint(4) NOT NULL DEFAULT 1,
  `d_status` tinyint(4) NOT NULL DEFAULT 1,
  `f_check` tinyint(10) DEFAULT NULL,
  `g_check` tinyint(10) DEFAULT NULL,
  `fclient_id` text DEFAULT NULL,
  `fclient_secret` text DEFAULT NULL,
  `fredirect` text DEFAULT NULL,
  `gclient_id` text DEFAULT NULL,
  `gclient_secret` text DEFAULT NULL,
  `gredirect` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `socialsettings`
--

INSERT INTO `socialsettings` (`id`, `facebook`, `gplus`, `twitter`, `linkedin`, `dribble`, `f_status`, `g_status`, `t_status`, `l_status`, `d_status`, `f_check`, `g_check`, `fclient_id`, `fclient_secret`, `fredirect`, `gclient_id`, `gclient_secret`, `gredirect`) VALUES
(1, 'https://www.facebook.com/', 'https://plus.google.com/', 'https://twitter.com/', 'https://www.linkedin.com/', 'https://dribbble.com/', 1, 1, 1, 1, 1, 1, 1, '503140663460329', 'f66cd670ec43d14209a2728af26dcc43', 'https://dev.geniusocean.net/xcart/auth/facebook/callback', '904681031719-sh1aolu42k7l93ik0bkiddcboghbpcfi.apps.googleusercontent.com', 'yGBWmUpPtn5yWhDAsXnswEX3', 'https://dev.geniusocean.net/xcart/auth/google/callback');

-- --------------------------------------------------------

--
-- Table structure for table `social_links`
--

CREATE TABLE `social_links` (
  `id` int(191) NOT NULL,
  `user_id` int(191) NOT NULL DEFAULT 0,
  `link` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `social_links`
--

INSERT INTO `social_links` (`id`, `user_id`, `link`, `icon`, `status`) VALUES
(1, 0, 'https://www.facebook.com/', 'fab fa-facebook-f', 1),
(2, 0, 'https://twitter.com/', 'fab fa-twitter', 1),
(3, 0, 'https://linkedin.com/', 'fab fa-linkedin-in', 1),
(4, 0, 'https://www.google.com/', 'fab fa-google-plus-g', 1),
(5, 0, 'https://dribbble.com/', 'fab fa-dribbble', 1),
(6, 13, 'https://www.google.com/', 'fab fa-google', 1),
(7, 13, 'https://twitter.com/', 'fab fa-twitter', 1),
(8, 13, 'https://www.facebook.com/', 'fab fa-facebook', 1),
(9, 13, 'https://linkedin.com/', 'fab fa-linkedin', 1),
(10, 22, 'https://www.google.com/', 'fab fa-google', 1);

-- --------------------------------------------------------

--
-- Table structure for table `social_providers`
--

CREATE TABLE `social_providers` (
  `id` int(191) NOT NULL,
  `user_id` int(191) NOT NULL,
  `provider_id` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `provider` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `states`
--

CREATE TABLE `states` (
  `id` bigint(20) NOT NULL,
  `country_id` int(11) NOT NULL DEFAULT 0,
  `state` varchar(111) DEFAULT NULL,
  `tax` double NOT NULL DEFAULT 0,
  `status` int(11) NOT NULL DEFAULT 1,
  `owner_id` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `states`
--

INSERT INTO `states` (`id`, `country_id`, `state`, `tax`, `status`, `owner_id`) VALUES
(2, 245, 'New Youk', 2, 1, 0),
(4, 246, 'Virginia', 4, 1, 0),
(5, 237, 'Sancta Sedes', 0, 1, 0),
(6, 246, 'Harare', 0, 1, 0),
(7, 245, 'Lusaka', 0, 1, 0),
(8, 244, 'Zinjibar', 0, 1, 0),
(9, 244, 'Mukalla', 0, 1, 0),
(10, 243, 'Smara', 0, 1, 0),
(11, 243, 'Hawza', 0, 1, 0),
(12, 242, 'Vaitupu', 0, 1, 0),
(13, 242, 'Leava', 0, 1, 0),
(14, 18, 'Dhaka', 0, 1, 0),
(15, 18, 'Comilla', 0, 1, 0),
(16, 1, 'Kabul', 0, 1, 0),
(17, 1, 'Kapisa', 0, 1, 0),
(18, 2, 'Fier', 0, 1, 0),
(19, 2, 'Korce', 0, 1, 0),
(20, 13, 'Victoria', 0, 1, 0),
(21, 13, 'Tasmania', 0, 1, 0),
(22, 14, 'Vienna', 0, 1, 0),
(23, 14, 'Styria', 0, 1, 0),
(24, 20, 'Brest Oblast', 0, 1, 0),
(25, 20, 'Vitebsk Oblast', 0, 1, 0),
(26, 100, 'Assam', 0, 1, 0),
(27, 100, 'Bihar', 0, 1, 0),
(28, 100, 'Bombay', 0, 1, 0),
(29, 183, 'Adygea', 0, 1, 0),
(30, 183, 'Buryatia', 0, 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `subcategories`
--

CREATE TABLE `subcategories` (
  `id` int(191) NOT NULL,
  `category_id` int(191) NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `language_id` int(191) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `subcategories`
--

INSERT INTO `subcategories` (`id`, `category_id`, `name`, `slug`, `status`, `language_id`) VALUES
(2, 4, 'TELEVISION', 'television', 1, 1),
(3, 4, 'REFRIGERATOR', 'refrigerator', 1, 1),
(4, 4, 'WASHING MACHINE', 'washing-machine', 1, 1),
(5, 4, 'AIR CONDITIONERS', 'air-conditioners', 1, 1),
(6, 5, 'ACCESSORIES', 'accessories', 1, 1),
(7, 5, 'BAGS', 'bags', 1, 1),
(8, 5, 'CLOTHINGS', 'clothings', 1, 1),
(9, 5, 'SHOES', 'shoes', 1, 1),
(10, 7, 'APPLE', 'apple', 1, 1),
(11, 7, 'SAMSUNG', 'samsung', 1, 1),
(12, 7, 'LG', 'lg', 1, 1),
(13, 7, 'SONY', 'sony', 1, 1),
(14, 6, 'DSLR', 'dslr', 1, 1),
(15, 6, 'Camera Phone', 'camera-phone', 1, 1),
(16, 6, 'Action Camera', 'animation-camera', 1, 1),
(17, 6, 'Digital Camera', 'digital-camera', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `subscribers`
--

CREATE TABLE `subscribers` (
  `id` int(191) NOT NULL,
  `email` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `subscriptions`
--

CREATE TABLE `subscriptions` (
  `id` int(11) NOT NULL,
  `title` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` double NOT NULL DEFAULT 0,
  `days` int(11) NOT NULL,
  `allowed_products` int(11) NOT NULL DEFAULT 0,
  `details` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `subscriptions`
--

INSERT INTO `subscriptions` (`id`, `title`, `price`, `days`, `allowed_products`, `details`) VALUES
(5, 'Standard', 60, 45, 25, '<ol><li>Lorem ipsum dolor sit amet<br></li><li>Lorem ipsum dolor sit ame<br></li><li>Lorem ipsum dolor sit am<br></li></ol>'),
(6, 'Premium', 120, 90, 90, '<span style=\"color: rgb(0, 0, 0); font-family: \" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;=\"\" text-align:=\"\" justify;\"=\"\">Lorem ipsum dolor sit amet, consectetur adipiscing elit.</span><br>'),
(7, 'Unlimited', 250, 365, 0, '<span style=\"color: rgb(0, 0, 0); font-family: \" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;=\"\" text-align:=\"\" justify;\"=\"\">Lorem ipsum dolor sit amet, consectetur adipiscing elit.</span><br>'),
(8, 'Basic', 0, 30, 0, '<ol><li>Lorem ipsum dolor sit amet<br></li><li>Lorem ipsum dolor sit ame<br></li><li>Lorem ipsum dolor sit am<br></li></ol>');

-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--

CREATE TABLE `transactions` (
  `id` int(11) NOT NULL,
  `user_id` int(191) DEFAULT NULL,
  `reward_point` double DEFAULT 0,
  `reward_dolar` double NOT NULL DEFAULT 0,
  `txn_number` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `amount` double DEFAULT 0,
  `currency_sign` blob DEFAULT NULL,
  `currency_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `currency_value` double NOT NULL DEFAULT 0,
  `method` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `txnid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `details` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'plus, minus',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `photo` varchar(191) DEFAULT NULL,
  `zip` varchar(191) DEFAULT NULL,
  `city` varchar(191) DEFAULT NULL,
  `country` varchar(100) DEFAULT NULL,
  `state` varchar(191) DEFAULT NULL,
  `address` varchar(191) DEFAULT NULL,
  `phone` varchar(191) DEFAULT NULL,
  `fax` varchar(191) DEFAULT NULL,
  `email` varchar(191) NOT NULL,
  `password` varchar(191) DEFAULT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `is_provider` tinyint(10) NOT NULL DEFAULT 0,
  `status` tinyint(10) NOT NULL DEFAULT 0,
  `verification_link` text DEFAULT NULL,
  `email_verified` enum('Yes','No') NOT NULL DEFAULT 'No',
  `affilate_code` text DEFAULT NULL,
  `affilate_income` double NOT NULL DEFAULT 0,
  `shop_name` text DEFAULT NULL,
  `owner_name` text DEFAULT NULL,
  `shop_number` text DEFAULT NULL,
  `shop_address` text DEFAULT NULL,
  `reg_number` text DEFAULT NULL,
  `shop_message` text DEFAULT NULL,
  `shop_details` text DEFAULT NULL,
  `shop_image` varchar(191) DEFAULT NULL,
  `f_url` text DEFAULT NULL,
  `g_url` text DEFAULT NULL,
  `t_url` text DEFAULT NULL,
  `l_url` text DEFAULT NULL,
  `is_vendor` tinyint(1) NOT NULL DEFAULT 0,
  `f_check` tinyint(1) NOT NULL DEFAULT 0,
  `g_check` tinyint(1) NOT NULL DEFAULT 0,
  `t_check` tinyint(1) NOT NULL DEFAULT 0,
  `l_check` tinyint(1) NOT NULL DEFAULT 0,
  `mail_sent` tinyint(1) NOT NULL DEFAULT 0,
  `shipping_cost` double NOT NULL DEFAULT 0,
  `current_balance` double NOT NULL DEFAULT 0,
  `date` date DEFAULT NULL,
  `ban` tinyint(1) NOT NULL DEFAULT 0,
  `balance` double NOT NULL DEFAULT 0,
  `reward` double NOT NULL DEFAULT 0,
  `email_token` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `photo`, `zip`, `city`, `country`, `state`, `address`, `phone`, `fax`, `email`, `password`, `remember_token`, `created_at`, `updated_at`, `is_provider`, `status`, `verification_link`, `email_verified`, `affilate_code`, `affilate_income`, `shop_name`, `owner_name`, `shop_number`, `shop_address`, `reg_number`, `shop_message`, `shop_details`, `shop_image`, `f_url`, `g_url`, `t_url`, `l_url`, `is_vendor`, `f_check`, `g_check`, `t_check`, `l_check`, `mail_sent`, `shipping_cost`, `current_balance`, `date`, `ban`, `balance`, `reward`, `email_token`) VALUES
(13, 'Vendor', NULL, '1234', NULL, 'Algeria', 'UN', NULL, '3453453345453411', '23123121', 'vendor@gmail.com', '$2y$10$.4NrvXAeyToa4x07EkFvS.XIUEc/aXGsxe1onkQ.Udms4Sl2W9ZYq', 'FZZT79vFSHr5AmVKwnXqxA0kngg49oMItd1ob9zlR6Z1eKsjgLz3hsdh9sZH', '2018-03-07 12:05:44', '2023-03-05 22:58:29', 0, 2, '$2y$10$oIf1at.0LwscVwaX/8h.WuSwMKEAAsn8EJ.9P7mWzNUFIcEBQs8ry', 'Yes', '$2y$10$oIf1at.0LwscVwaX/8h.WuSwMKEAAsn8EJ.9P7mWzNUFIcEBQs8rysdfsdfds', 4920.8, 'Test Stores', 'User', '43543534', 'Space Needle 400 Broad St, Seattles', 'asdasd', 'sdf', NULL, NULL, NULL, NULL, NULL, NULL, 2, 0, 0, 0, 0, 1, 0, 91241.459, '2023-11-11', 0, 699.79, 0, NULL),
(22, 'User', '16429180191556780563userpng.png', '1231', 'Test City', 'Algeria', 'UN', 'Test Address', '34534534534', '34534534534', 'user@gmail.com', '$2y$10$SoiCG9/MlJIvAir5tUKAjevXO0N4P0qEUb27vFMc53uCWMfgd.FLm', 'ZQNaEU71sXvFwHcTR4CVbeflhUurUen1rujVm9P7UWbIvlJST2vZHlXvTX0j', '2019-06-20 06:26:24', '2023-03-05 22:57:44', 0, 0, '1edae93935fba69d9542192fb854a80a', 'Yes', '8f09b9691613ecb8c3f7e36e34b97b80', 4298.635, 'Test Shops', 'Saxena', '213213', 'fgfg', '123213', NULL, NULL, '1640498386Wonderland-AhoraMisma-Ajpg.jpg', NULL, NULL, NULL, NULL, 2, 0, 0, 0, 0, 1, 0, 0, '2022-04-02', 0, 395114.10139024, 220, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `user_notifications`
--

CREATE TABLE `user_notifications` (
  `id` int(191) NOT NULL,
  `user_id` int(191) NOT NULL,
  `order_number` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_read` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user_subscriptions`
--

CREATE TABLE `user_subscriptions` (
  `id` int(191) NOT NULL,
  `user_id` int(191) NOT NULL,
  `subscription_id` int(191) NOT NULL,
  `title` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `currency_sign` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `currency_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `currency_value` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` double NOT NULL DEFAULT 0,
  `days` int(11) NOT NULL,
  `allowed_products` int(11) NOT NULL DEFAULT 0,
  `details` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `method` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Free',
  `txnid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `charge_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `flutter_id` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 0,
  `payment_number` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `user_subscriptions`
--

INSERT INTO `user_subscriptions` (`id`, `user_id`, `subscription_id`, `title`, `currency_sign`, `currency_code`, `currency_value`, `price`, `days`, `allowed_products`, `details`, `method`, `txnid`, `charge_id`, `flutter_id`, `created_at`, `updated_at`, `status`, `payment_number`) VALUES
(159, 13, 7, 'Unlimited', '$', 'USD', '1', 250, 365, 0, '<span style=\"color: rgb(0, 0, 0); font-family: \" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;=\"\" text-align:=\"\" justify;\"=\"\">Lorem ipsum dolor sit amet, consectetur adipiscing elit.</span><br>', 'Molly', 'tr_GujuVzTkBB', NULL, NULL, '2021-09-11 22:00:44', '2021-09-11 22:00:44', 1, NULL),
(172, 22, 5, 'Standard', '$', 'USD', '1', 60, 45, 25, '<ol><li>Lorem ipsum dolor sit amet<br></li><li>Lorem ipsum dolor sit ame<br></li><li>Lorem ipsum dolor sit am<br></li></ol>', 'Stripe', 'txn_3KTjT0JlIV5dN9n70jJxJUry', 'ch_3KTjT0JlIV5dN9n70b9oPU0r', NULL, '2022-02-16 03:06:31', '2022-02-16 03:06:31', 1, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `vendor_orders`
--

CREATE TABLE `vendor_orders` (
  `id` int(191) NOT NULL,
  `user_id` int(191) NOT NULL,
  `order_id` int(191) NOT NULL,
  `qty` int(191) NOT NULL,
  `price` double NOT NULL,
  `order_number` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('pending','processing','completed','declined','on delivery') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `created_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `verifications`
--

CREATE TABLE `verifications` (
  `id` int(191) NOT NULL,
  `user_id` int(191) NOT NULL,
  `attachments` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('Pending','Verified','Declined') DEFAULT NULL,
  `text` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `admin_warning` tinyint(1) NOT NULL DEFAULT 0,
  `warning_reason` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `verifications`
--

INSERT INTO `verifications` (`id`, `user_id`, `attachments`, `status`, `text`, `admin_warning`, `warning_reason`, `created_at`, `updated_at`) VALUES
(1, 13, '157096738015693932021.jpg,157096738015693932022.jpg', 'Declined', 'TEST', 0, NULL, '2019-10-13 05:49:40', '2021-12-12 17:19:55'),
(7, 13, NULL, NULL, NULL, 1, 'Check', '2021-10-19 21:32:20', '2021-10-19 21:32:20'),
(8, 36, NULL, NULL, NULL, 1, '324', '2021-12-12 17:18:25', '2021-12-12 17:18:25');

-- --------------------------------------------------------

--
-- Table structure for table `wishlists`
--

CREATE TABLE `wishlists` (
  `id` int(191) UNSIGNED NOT NULL,
  `user_id` int(191) UNSIGNED NOT NULL,
  `product_id` int(191) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `withdraws`
--

CREATE TABLE `withdraws` (
  `id` int(191) NOT NULL,
  `user_id` int(191) DEFAULT NULL,
  `method` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `acc_email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `iban` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `acc_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `swift` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `reference` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `amount` float DEFAULT NULL,
  `fee` float DEFAULT 0,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `status` enum('pending','completed','rejected') NOT NULL DEFAULT 'pending',
  `type` enum('user','vendor') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `addons`
--
ALTER TABLE `addons`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `admins_email_unique` (`email`);

--
-- Indexes for table `admin_languages`
--
ALTER TABLE `admin_languages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `admin_user_conversations`
--
ALTER TABLE `admin_user_conversations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `admin_user_messages`
--
ALTER TABLE `admin_user_messages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `arrival_sections`
--
ALTER TABLE `arrival_sections`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `attributes`
--
ALTER TABLE `attributes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `attribute_options`
--
ALTER TABLE `attribute_options`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `banners`
--
ALTER TABLE `banners`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `blogs`
--
ALTER TABLE `blogs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `blog_categories`
--
ALTER TABLE `blog_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `childcategories`
--
ALTER TABLE `childcategories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `conversations`
--
ALTER TABLE `conversations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `counters`
--
ALTER TABLE `counters`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `countries`
--
ALTER TABLE `countries`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `coupons`
--
ALTER TABLE `coupons`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `currencies`
--
ALTER TABLE `currencies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `deposits`
--
ALTER TABLE `deposits`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `email_templates`
--
ALTER TABLE `email_templates`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `faqs`
--
ALTER TABLE `faqs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `favorite_sellers`
--
ALTER TABLE `favorite_sellers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `fonts`
--
ALTER TABLE `fonts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `galleries`
--
ALTER TABLE `galleries`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `generalsettings`
--
ALTER TABLE `generalsettings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `languages`
--
ALTER TABLE `languages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_tracks`
--
ALTER TABLE `order_tracks`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `packages`
--
ALTER TABLE `packages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pages`
--
ALTER TABLE `pages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pagesettings`
--
ALTER TABLE `pagesettings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `partners`
--
ALTER TABLE `partners`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `payment_gateways`
--
ALTER TABLE `payment_gateways`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pickups`
--
ALTER TABLE `pickups`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);
ALTER TABLE `products` ADD FULLTEXT KEY `name` (`name`);
ALTER TABLE `products` ADD FULLTEXT KEY `attributes` (`attributes`);

--
-- Indexes for table `product_clicks`
--
ALTER TABLE `product_clicks`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ratings`
--
ALTER TABLE `ratings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `replies`
--
ALTER TABLE `replies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `reports`
--
ALTER TABLE `reports`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `reviews`
--
ALTER TABLE `reviews`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `rewards`
--
ALTER TABLE `rewards`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `seotools`
--
ALTER TABLE `seotools`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `services`
--
ALTER TABLE `services`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `shippings`
--
ALTER TABLE `shippings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sliders`
--
ALTER TABLE `sliders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `socialsettings`
--
ALTER TABLE `socialsettings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `social_links`
--
ALTER TABLE `social_links`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `social_providers`
--
ALTER TABLE `social_providers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `states`
--
ALTER TABLE `states`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `subcategories`
--
ALTER TABLE `subcategories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `subscribers`
--
ALTER TABLE `subscribers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `subscriptions`
--
ALTER TABLE `subscriptions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_notifications`
--
ALTER TABLE `user_notifications`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_subscriptions`
--
ALTER TABLE `user_subscriptions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `vendor_orders`
--
ALTER TABLE `vendor_orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `verifications`
--
ALTER TABLE `verifications`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wishlists`
--
ALTER TABLE `wishlists`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `withdraws`
--
ALTER TABLE `withdraws`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `addons`
--
ALTER TABLE `addons`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `admin_languages`
--
ALTER TABLE `admin_languages`
  MODIFY `id` int(191) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `admin_user_conversations`
--
ALTER TABLE `admin_user_conversations`
  MODIFY `id` int(191) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `admin_user_messages`
--
ALTER TABLE `admin_user_messages`
  MODIFY `id` int(191) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `arrival_sections`
--
ALTER TABLE `arrival_sections`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `attributes`
--
ALTER TABLE `attributes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT for table `attribute_options`
--
ALTER TABLE `attribute_options`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=281;

--
-- AUTO_INCREMENT for table `banners`
--
ALTER TABLE `banners`
  MODIFY `id` int(191) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `blogs`
--
ALTER TABLE `blogs`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;

--
-- AUTO_INCREMENT for table `blog_categories`
--
ALTER TABLE `blog_categories`
  MODIFY `id` int(191) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(191) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT for table `childcategories`
--
ALTER TABLE `childcategories`
  MODIFY `id` int(191) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `id` int(191) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `conversations`
--
ALTER TABLE `conversations`
  MODIFY `id` int(191) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `counters`
--
ALTER TABLE `counters`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `countries`
--
ALTER TABLE `countries`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=247;

--
-- AUTO_INCREMENT for table `coupons`
--
ALTER TABLE `coupons`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `currencies`
--
ALTER TABLE `currencies`
  MODIFY `id` int(191) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `deposits`
--
ALTER TABLE `deposits`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=101;

--
-- AUTO_INCREMENT for table `email_templates`
--
ALTER TABLE `email_templates`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `faqs`
--
ALTER TABLE `faqs`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `favorite_sellers`
--
ALTER TABLE `favorite_sellers`
  MODIFY `id` int(191) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `fonts`
--
ALTER TABLE `fonts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `galleries`
--
ALTER TABLE `galleries`
  MODIFY `id` int(191) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=338;

--
-- AUTO_INCREMENT for table `generalsettings`
--
ALTER TABLE `generalsettings`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `languages`
--
ALTER TABLE `languages`
  MODIFY `id` int(191) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `messages`
--
ALTER TABLE `messages`
  MODIFY `id` int(191) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `id` int(191) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=144;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=249;

--
-- AUTO_INCREMENT for table `order_tracks`
--
ALTER TABLE `order_tracks`
  MODIFY `id` int(191) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `packages`
--
ALTER TABLE `packages`
  MODIFY `id` int(191) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `pages`
--
ALTER TABLE `pages`
  MODIFY `id` int(191) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `pagesettings`
--
ALTER TABLE `pagesettings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `partners`
--
ALTER TABLE `partners`
  MODIFY `id` int(191) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `payment_gateways`
--
ALTER TABLE `payment_gateways`
  MODIFY `id` int(191) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `pickups`
--
ALTER TABLE `pickups`
  MODIFY `id` int(191) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(191) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=383;

--
-- AUTO_INCREMENT for table `product_clicks`
--
ALTER TABLE `product_clicks`
  MODIFY `id` int(191) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ratings`
--
ALTER TABLE `ratings`
  MODIFY `id` int(191) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `replies`
--
ALTER TABLE `replies`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `reports`
--
ALTER TABLE `reports`
  MODIFY `id` int(191) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `reviews`
--
ALTER TABLE `reviews`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `rewards`
--
ALTER TABLE `rewards`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(191) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `seotools`
--
ALTER TABLE `seotools`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `services`
--
ALTER TABLE `services`
  MODIFY `id` int(191) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `shippings`
--
ALTER TABLE `shippings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `sliders`
--
ALTER TABLE `sliders`
  MODIFY `id` int(191) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `socialsettings`
--
ALTER TABLE `socialsettings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `social_links`
--
ALTER TABLE `social_links`
  MODIFY `id` int(191) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `social_providers`
--
ALTER TABLE `social_providers`
  MODIFY `id` int(191) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `states`
--
ALTER TABLE `states`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `subcategories`
--
ALTER TABLE `subcategories`
  MODIFY `id` int(191) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `subscribers`
--
ALTER TABLE `subscribers`
  MODIFY `id` int(191) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `subscriptions`
--
ALTER TABLE `subscriptions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `transactions`
--
ALTER TABLE `transactions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT for table `user_notifications`
--
ALTER TABLE `user_notifications`
  MODIFY `id` int(191) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=137;

--
-- AUTO_INCREMENT for table `user_subscriptions`
--
ALTER TABLE `user_subscriptions`
  MODIFY `id` int(191) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=173;

--
-- AUTO_INCREMENT for table `vendor_orders`
--
ALTER TABLE `vendor_orders`
  MODIFY `id` int(191) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=298;

--
-- AUTO_INCREMENT for table `verifications`
--
ALTER TABLE `verifications`
  MODIFY `id` int(191) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `wishlists`
--
ALTER TABLE `wishlists`
  MODIFY `id` int(191) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=69;

--
-- AUTO_INCREMENT for table `withdraws`
--
ALTER TABLE `withdraws`
  MODIFY `id` int(191) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
