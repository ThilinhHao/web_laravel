-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3308
-- Generation Time: Apr 07, 2023 at 03:51 PM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 7.4.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `login_fb`
--

-- --------------------------------------------------------

--
-- Table structure for table `carts`
--

CREATE TABLE `carts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` varchar(255) NOT NULL,
  `product_id` varchar(255) NOT NULL,
  `product_quantity` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `carts`
--

INSERT INTO `carts` (`id`, `user_id`, `product_id`, `product_quantity`, `created_at`, `updated_at`) VALUES
(44, '10', '3', '1', '2023-04-04 23:39:07', '2023-04-04 23:39:07');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `description` longtext NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0,
  `popular` tinyint(4) NOT NULL DEFAULT 0,
  `image` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `slug`, `description`, `status`, `popular`, `image`, `created_at`, `updated_at`) VALUES
(3, 'MSI', 'Window', 'đồ họa mượt', 1, 0, '1678873812.png', '2023-03-15 02:50:12', '2023-03-15 02:50:12'),
(5, 'HP', 'Window 10', 'máy dành cho dân văn phòng', 1, 0, '1679192376.png', '2023-03-18 19:19:36', '2023-03-18 19:19:36'),
(6, 'Dell', 'Window', 'tốt cho dân văn phòng', 1, 0, '1679454253.jpg', '2023-03-21 20:04:13', '2023-03-21 20:04:13'),
(7, 'Lenovo', 'Window', 'đồ họa mượt', 0, 1, '1679454370.png', '2023-03-21 20:06:10', '2023-03-21 20:06:10');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2023_03_15_015938_create_categories_table', 2),
(6, '2023_03_15_104249_create_permission_tables', 3),
(7, '2023_03_19_022246_create_products_table', 4),
(8, '2023_03_29_032527_create_carts_table', 5),
(9, '2023_04_02_141706_create_orders_table', 6),
(10, '2023_04_02_142058_create_order_items_table', 6),
(11, '2023_04_04_025110_create_wishlists_table', 7),
(12, '2023_04_05_071035_create_ratings_table', 8),
(13, '2023_04_05_081554_create_reviews_table', 9);

-- --------------------------------------------------------

--
-- Table structure for table `model_has_permissions`
--

CREATE TABLE `model_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(255) NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `model_has_roles`
--

CREATE TABLE `model_has_roles` (
  `role_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(255) NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `mobile` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `total_price` varchar(255) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0,
  `message` varchar(255) DEFAULT NULL,
  `tracking_no` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `user_id`, `name`, `email`, `mobile`, `address`, `total_price`, `status`, `message`, `tracking_no`, `created_at`, `updated_at`) VALUES
(6, 10, 'Hao Thi', 'thilinhhao123@gmail.com', '0123456789', 'Thanh Xuan Ha Noi', '31998', 0, NULL, 'success648', '2023-04-02 20:26:24', '2023-04-02 20:26:24'),
(7, 8, 'Hao Thi', 'thilinhhao2001@gmail.com', '0123456789', 'Thanh Xuan Ha Noi', '29998', 0, NULL, 'success998', '2023-04-04 07:28:40', '2023-04-04 07:28:40'),
(9, 8, 'Hao Thi', 'thilinhhao2001@gmail.com', '0123456789', 'Nguyen Trai Ha Noi', '16999', 0, NULL, 'success493', '2023-04-04 07:30:10', '2023-04-04 07:30:10'),
(10, 8, 'Doan tri Hao', 'thilinhhao2001@gmail.com', '0123456777', 'Thanh pho HCM', '18999', 0, NULL, 'success294', '2023-04-04 07:32:17', '2023-04-04 07:32:17'),
(12, 10, 'Hao Thi', 'thilinhhao123@gmail.com', '0123456789', 'Nguyen Trai Ha Noi', '34998', 1, NULL, 'success164', '2023-04-04 23:06:41', '2023-04-04 23:06:41'),
(15, 10, 'Hao Thi1', 'thilinhhao123@gmail.com', '0123456788', 'Thanh Xuan Ha Noi', '15999', 1, NULL, 'success219', '2023-04-04 23:12:23', '2023-04-04 23:12:23'),
(16, 10, 'Hao Thi1', 'thilinhhao123@gmail.com', '0123456789', 'Nguyen Trai Ha Noi', '17999', 1, NULL, 'success478', '2023-04-04 23:17:10', '2023-04-04 23:17:10'),
(17, 10, 'Hao11', 'thilinhhao123@gmail.com', '0123456789', 'Nguyen Trai Ha Noi', '13999', 1, NULL, 'success825', '2023-04-04 23:21:18', '2023-04-04 23:21:18'),
(18, 10, 'Hao Thi', 'thilinhhao123@gmail.com', '0123456789', 'Thanh Xuan Ha Noi', '22999', 1, NULL, 'success981', '2023-04-04 23:36:59', '2023-04-04 23:36:59');

-- --------------------------------------------------------

--
-- Table structure for table `order_items`
--

CREATE TABLE `order_items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` varchar(255) NOT NULL,
  `product_id` varchar(255) NOT NULL,
  `quantity` varchar(255) NOT NULL,
  `price` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `order_items`
--

INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `quantity`, `price`, `created_at`, `updated_at`) VALUES
(10, '6', '2', '1', '13999', '2023-04-02 20:26:24', '2023-04-02 20:26:24'),
(11, '6', '3', '1', '17999', '2023-04-02 20:26:24', '2023-04-02 20:26:24'),
(12, '7', '2', '1', '13999', '2023-04-04 07:28:40', '2023-04-04 07:28:40'),
(13, '7', '6', '1', '15999', '2023-04-04 07:28:40', '2023-04-04 07:28:40'),
(14, '9', '4', '1', '16999', '2023-04-04 07:30:10', '2023-04-04 07:30:10'),
(15, '10', '5', '1', '18999', '2023-04-04 07:32:17', '2023-04-04 07:32:17'),
(16, '11', '3', '2', '17999', '2023-04-04 19:17:50', '2023-04-04 19:17:50'),
(17, '12', '4', '1', '16999', '2023-04-04 23:06:41', '2023-04-04 23:06:41'),
(18, '12', '3', '1', '17999', '2023-04-04 23:06:41', '2023-04-04 23:06:41'),
(19, '13', '4', '1', '16999', '2023-04-04 23:08:36', '2023-04-04 23:08:36'),
(20, '15', '6', '1', '15999', '2023-04-04 23:12:23', '2023-04-04 23:12:23'),
(21, '16', '3', '1', '17999', '2023-04-04 23:17:10', '2023-04-04 23:17:10'),
(22, '17', '2', '1', '13999', '2023-04-04 23:21:18', '2023-04-04 23:21:18'),
(23, '18', '7', '1', '22999', '2023-04-04 23:36:59', '2023-04-04 23:36:59');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `password_resets`
--

INSERT INTO `password_resets` (`email`, `token`, `created_at`) VALUES
('thilinhhao123@gmail.com', '$2y$10$PG2r2t45TB0p68UgWnhBXuwHhLq7weX.c5J8HZ.OJ7cVkpR6yDqsG', '2023-03-19 19:49:29');

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `guard_name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `cate_id` bigint(20) NOT NULL,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `description` longtext NOT NULL,
  `original_price` varchar(255) NOT NULL,
  `selling_price` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `qty` varchar(255) NOT NULL,
  `tax` varchar(255) NOT NULL,
  `status` tinyint(4) NOT NULL,
  `trending` tinyint(4) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `cate_id`, `name`, `slug`, `description`, `original_price`, `selling_price`, `image`, `qty`, `tax`, `status`, `trending`, `created_at`, `updated_at`) VALUES
(2, 5, 'Laptop Asus TUF Gaming', 'asus-gaming', 'giá học sinh sinh viên', '14999', '13999', '1679211975.jpg', '4', '18', 1, 0, '2023-03-19 00:46:15', '2023-04-04 23:21:18'),
(3, 3, 'MSI', 'msi', 'đồ họa khủng, cấu hình mạnh', '19999', '17999', '1679214604.jpg', '12', '24', 2, 1, '2023-03-19 01:30:04', '2023-04-04 23:17:10'),
(4, 3, 'MSI gaming', 'msi-gaming', 'giá cả hợp lí dành cho mọi người', '17999', '16999', '1679214730.png', '7', '14', 3, 0, '2023-03-19 01:32:10', '2023-04-04 23:08:36'),
(5, 7, 'Laptop Lenovo', 'laptop lenovo', 'máy đẹppppp', '21000', '18999', '1679455036.jpg', '14', '20', 0, 3, '2023-03-21 20:17:16', '2023-04-04 07:32:17'),
(6, 6, 'Laptop Dell 2023', 'laptop dell', 'hiệu suất caoo', '18999', '15999', '1679455109.jpg', '10', '20', 0, 4, '2023-03-21 20:18:29', '2023-04-04 23:12:23'),
(7, 5, 'Laptop super HP', 'Window', 'phiên bản mới nhất và hot nhất', '24000', '22999', '1679455536.jpg', '20', '24', 4, 0, '2023-03-21 20:25:36', '2023-04-04 23:36:59'),
(8, 7, 'Laptop super Lenovo', 'Window', 'sản phẩm mới nhất 2023', '23999', '21000', '1679457553.jpg', '23', '30', 5, 0, '2023-03-21 20:59:13', '2023-03-21 20:59:13');

-- --------------------------------------------------------

--
-- Table structure for table `ratings`
--

CREATE TABLE `ratings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` varchar(255) NOT NULL,
  `product_id` varchar(255) NOT NULL,
  `stars_rated` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ratings`
--

INSERT INTO `ratings` (`id`, `user_id`, `product_id`, `stars_rated`, `created_at`, `updated_at`) VALUES
(2, '10', '2', '3', '2023-04-05 00:38:27', '2023-04-05 00:57:42'),
(3, '10', '4', '4', '2023-04-05 01:02:18', '2023-04-05 01:02:18'),
(4, '8', '2', '5', '2023-04-05 01:06:09', '2023-04-05 01:06:09');

-- --------------------------------------------------------

--
-- Table structure for table `reviews`
--

CREATE TABLE `reviews` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` varchar(255) NOT NULL,
  `product_id` varchar(255) NOT NULL,
  `user_review` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `reviews`
--

INSERT INTO `reviews` (`id`, `user_id`, `product_id`, `user_review`, `created_at`, `updated_at`) VALUES
(1, '8', '3', 'giá cả hợp lí, sản phẩm chất lượng', '2023-04-05 01:49:35', '2023-04-05 01:49:35'),
(2, '8', '3', 'sản phẩm như cc', '2023-04-05 02:15:01', '2023-04-05 02:15:01'),
(3, '10', '3', 'lừa dảo vkl', '2023-04-05 02:23:29', '2023-04-05 02:23:29'),
(4, '10', '3', 'ccccc', '2023-04-05 02:25:58', '2023-04-05 02:25:58'),
(5, '8', '3', 'aaaaaa', '2023-04-05 02:33:35', '2023-04-05 02:33:35'),
(6, '8', '3', 'bbbbbb', '2023-04-05 02:33:40', '2023-04-05 02:33:40'),
(7, '8', '3', 'abccc', '2023-04-05 07:02:39', '2023-04-05 07:02:39');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `guard_name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `role_has_permissions`
--

CREATE TABLE `role_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `provider_id` varchar(255) DEFAULT NULL,
  `avatar` varchar(255) DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `role_as` tinyint(4) NOT NULL DEFAULT 0,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `provider_id`, `avatar`, `email_verified_at`, `password`, `role_as`, `remember_token`, `created_at`, `updated_at`) VALUES
(8, 'Hào Thi Linh', 'thilinhhao2001@gmail.com', '117677189217948199484', 'https://lh3.googleusercontent.com/a/AGNmyxYJIChtP4uLM4mOLB11hNsKz-jSI8y4CCdlaDFF=s96-c', NULL, NULL, 0, NULL, '2023-03-09 21:50:14', '2023-03-09 21:50:14'),
(10, 'Haoadmin123', 'thilinhhao123@gmail.com', NULL, NULL, NULL, '$2y$10$ViSfizeMlTtu3h2j.68kduBS.4srC6iAZt8apeTCUni7hi4e6CAWO', 1, 'kxfDP9SQCJc1yKVZyT49wl6QtRvGKLk1KYVoMmoWFwp4hgLqqrvBuzXNjeH2', '2023-03-10 07:28:17', '2023-03-14 08:20:16'),
(12, 'Hào Thi', 'haothi14112001@gmail.com', '533682922227161', 'https://graph.facebook.com/v3.3/533682922227161/picture?type=normal', NULL, NULL, 0, NULL, '2023-03-12 19:53:51', '2023-03-12 19:53:51'),
(18, 'Hao123', 'minhhoan08112001ptit@gmail.com', NULL, NULL, NULL, '$2y$10$TbQzBhZX2zyJcQ3JefCpjeo72zl8Hibw8aOLrIauVzxpFL84h2abS', 0, NULL, '2023-03-19 19:49:14', '2023-03-19 19:49:14'),
(19, 'Hao1234', 'thilinhhao1234@gmail.com', NULL, NULL, NULL, '$2y$10$JkHwQuGi.wHHz/NyKqzhwe9hb8OsxMDOwPmEC9JZnR2t2FgQXxu2q', 0, NULL, '2023-03-19 19:53:00', '2023-03-19 19:53:00');

-- --------------------------------------------------------

--
-- Table structure for table `wishlists`
--

CREATE TABLE `wishlists` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` varchar(255) NOT NULL,
  `product_id` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `wishlists`
--

INSERT INTO `wishlists` (`id`, `user_id`, `product_id`, `created_at`, `updated_at`) VALUES
(2, '18', '3', '2023-04-04 00:56:23', '2023-04-04 00:56:23'),
(7, '18', '2', '2023-04-04 02:21:32', '2023-04-04 02:21:32'),
(8, '8', '6', '2023-04-04 07:28:25', '2023-04-04 07:28:25'),
(9, '8', '4', '2023-04-04 07:29:52', '2023-04-04 07:29:52'),
(10, '10', '5', '2023-04-04 07:47:17', '2023-04-04 07:47:17'),
(11, '10', '3', '2023-04-04 08:07:33', '2023-04-04 08:07:33');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `carts`
--
ALTER TABLE `carts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  ADD KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indexes for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  ADD KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_items`
--
ALTER TABLE `order_items`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `permissions_name_guard_name_unique` (`name`,`guard_name`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

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
-- Indexes for table `reviews`
--
ALTER TABLE `reviews`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_name_guard_name_unique` (`name`,`guard_name`);

--
-- Indexes for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `role_has_permissions_role_id_foreign` (`role_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indexes for table `wishlists`
--
ALTER TABLE `wishlists`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `carts`
--
ALTER TABLE `carts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `order_items`
--
ALTER TABLE `order_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `ratings`
--
ALTER TABLE `ratings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `reviews`
--
ALTER TABLE `reviews`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `wishlists`
--
ALTER TABLE `wishlists`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
