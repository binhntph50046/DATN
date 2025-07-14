-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: localhost
-- Thời gian đã tạo: Th7 10, 2025 lúc 10:06 AM
-- Phiên bản máy phục vụ: 5.7.43-log
-- Phiên bản PHP: 8.3.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `applestore`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `banners`
--

CREATE TABLE `banners` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `link` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('active','inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `order` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `banners`
--

INSERT INTO `banners` (`id`, `title`, `image`, `description`, `link`, `status`, `order`, `created_at`, `updated_at`) VALUES
(1, 'Khám Phá Thiết Bị Công Nghệ Mới Nhất', 'uploads/banners/68450b64495d8.jpg', 'Sở hữu sản phẩm chính hãng, chất lượng vượt trội, giá ưu đãi.', NULL, 'active', 1, '2025-05-08 15:17:47', '2025-06-14 22:01:59'),
(2, 'Phụ Kiện Công Nghệ Cao Cấp', 'uploads/banners/68450be6afb67.jpg', 'Đa dạng mẫu mã – Bảo vệ thiết bị – Tăng trải nghiệm sử dụng.', NULL, 'active', 2, '2025-05-08 15:17:48', '2025-06-14 22:06:16'),
(3, 'Ưu Đãi Hấp Dẫn Dành Riêng Cho Bạn', 'uploads/banners/68450b9d61c0e.jpg', 'Giảm giá, quà tặng và nhiều đặc quyền khi mua sắm hôm nay.', NULL, 'active', 3, '2025-05-08 15:17:48', '2025-06-14 22:06:39'),
(4, 'Mua Sắm Dễ Dàng – Giao Hàng Tận Nhà', 'uploads/banners/68450bb6a924e.jpg', 'Dịch vụ nhanh chóng – Thanh toán linh hoạt – Hỗ trợ tận tâm.', NULL, 'active', 7, '2025-05-08 15:17:49', '2025-06-14 22:07:15');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `blogs`
--

CREATE TABLE `blogs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` text COLLATE utf8mb4_unicode_ci,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `category_id` bigint(20) UNSIGNED DEFAULT NULL,
  `author_id` bigint(20) UNSIGNED DEFAULT NULL,
  `status` enum('active','inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `cache`
--

INSERT INTO `cache` (`key`, `value`, `expiration`) VALUES
('laravel_cache_b888b29826bb53dc531437e723738383d8339b56', 'i:1;', 1751374633),
('laravel_cache_b888b29826bb53dc531437e723738383d8339b56:timer', 'i:1751374633;', 1751374633),
('laravel_cache_spatie.permission.cache', 'a:3:{s:5:\"alias\";a:4:{s:1:\"a\";s:2:\"id\";s:1:\"b\";s:4:\"name\";s:1:\"c\";s:10:\"guard_name\";s:1:\"r\";s:5:\"roles\";}s:11:\"permissions\";a:37:{i:0;a:4:{s:1:\"a\";i:1;s:1:\"b\";s:15:\"view categories\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:1;a:4:{s:1:\"a\";i:2;s:1:\"b\";s:17:\"create categories\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:2;a:4:{s:1:\"a\";i:3;s:1:\"b\";s:15:\"edit categories\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:3;a:4:{s:1:\"a\";i:4;s:1:\"b\";s:17:\"delete categories\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:4;a:4:{s:1:\"a\";i:5;s:1:\"b\";s:12:\"view banners\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:5;a:4:{s:1:\"a\";i:6;s:1:\"b\";s:14:\"create banners\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:6;a:4:{s:1:\"a\";i:7;s:1:\"b\";s:12:\"edit banners\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:7;a:4:{s:1:\"a\";i:8;s:1:\"b\";s:14:\"delete banners\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:8;a:4:{s:1:\"a\";i:9;s:1:\"b\";s:13:\"view products\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:9;a:4:{s:1:\"a\";i:10;s:1:\"b\";s:15:\"create products\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:10;a:4:{s:1:\"a\";i:11;s:1:\"b\";s:13:\"edit products\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:11;a:4:{s:1:\"a\";i:12;s:1:\"b\";s:15:\"delete products\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:12;a:4:{s:1:\"a\";i:13;s:1:\"b\";s:11:\"view orders\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:13;a:4:{s:1:\"a\";i:14;s:1:\"b\";s:13:\"create orders\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:14;a:4:{s:1:\"a\";i:15;s:1:\"b\";s:11:\"edit orders\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:15;a:4:{s:1:\"a\";i:16;s:1:\"b\";s:13:\"delete orders\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:16;a:4:{s:1:\"a\";i:17;s:1:\"b\";s:10:\"view users\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:17;a:4:{s:1:\"a\";i:18;s:1:\"b\";s:12:\"create users\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:18;a:4:{s:1:\"a\";i:19;s:1:\"b\";s:10:\"edit users\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:19;a:4:{s:1:\"a\";i:20;s:1:\"b\";s:12:\"delete users\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:20;a:4:{s:1:\"a\";i:21;s:1:\"b\";s:10:\"view blogs\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:21;a:4:{s:1:\"a\";i:22;s:1:\"b\";s:12:\"create blogs\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:22;a:4:{s:1:\"a\";i:23;s:1:\"b\";s:10:\"edit blogs\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:23;a:4:{s:1:\"a\";i:24;s:1:\"b\";s:12:\"delete blogs\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:24;a:4:{s:1:\"a\";i:25;s:1:\"b\";s:15:\"view attributes\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:25;a:4:{s:1:\"a\";i:26;s:1:\"b\";s:17:\"create attributes\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:26;a:4:{s:1:\"a\";i:27;s:1:\"b\";s:15:\"edit attributes\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:27;a:4:{s:1:\"a\";i:28;s:1:\"b\";s:17:\"delete attributes\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:28;a:4:{s:1:\"a\";i:29;s:1:\"b\";s:14:\"view dashboard\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:29;a:4:{s:1:\"a\";i:30;s:1:\"b\";s:7:\"addrole\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:30;a:4:{s:1:\"a\";i:31;s:1:\"b\";s:28:\"view category specifications\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:31;a:4:{s:1:\"a\";i:32;s:1:\"b\";s:24:\"view category attributes\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:32;a:4:{s:1:\"a\";i:33;s:1:\"b\";s:19:\"view specifications\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:33;a:4:{s:1:\"a\";i:34;s:1:\"b\";s:20:\"trash specifications\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:34;a:4:{s:1:\"a\";i:35;s:1:\"b\";s:22:\"restore specifications\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:35;a:4:{s:1:\"a\";i:36;s:1:\"b\";s:21:\"delete specifications\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:36;a:4:{s:1:\"a\";i:37;s:1:\"b\";s:13:\"view vouchers\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}}s:5:\"roles\";a:2:{i:0;a:3:{s:1:\"a\";i:1;s:1:\"b\";s:5:\"admin\";s:1:\"c\";s:3:\"web\";}i:1;a:3:{s:1:\"a\";i:2;s:1:\"b\";s:5:\"staff\";s:1:\"c\";s:3:\"web\";}}}', 1751723772);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `owner` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `carts`
--

CREATE TABLE `carts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `carts`
--

INSERT INTO `carts` (`id`, `user_id`, `created_at`) VALUES
(1, 1, '2025-05-28 12:03:39'),
(2, 43, '2025-05-28 16:50:10'),
(4, 76, '2025-06-13 14:23:38'),
(5, 42, '2025-06-14 07:36:33'),
(6, 77, '2025-07-07 08:57:29');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `cart_items`
--

CREATE TABLE `cart_items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `cart_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `variant_id` bigint(20) UNSIGNED DEFAULT NULL,
  `quantity` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `cart_items`
--

INSERT INTO `cart_items` (`id`, `cart_id`, `product_id`, `variant_id`, `quantity`) VALUES
(108, 2, 152, 240, 3),
(109, 2, 152, 239, 1),
(111, 5, 155, 245, 1),
(114, 6, 155, 245, 2),
(115, 6, 152, 248, 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `parent_id` bigint(20) UNSIGNED DEFAULT NULL,
  `order` int(11) NOT NULL DEFAULT '0',
  `status` enum('active','inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `type` tinyint(4) DEFAULT '1',
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `icon` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `categories`
--

INSERT INTO `categories` (`id`, `name`, `slug`, `parent_id`, `order`, `status`, `type`, `image`, `icon`, `created_at`, `updated_at`, `deleted_at`) VALUES
(25, 'Iphone', 'iphone', NULL, 1, 'active', 1, 'uploads/categories/1750055763_Danh mục Iphone.png', 'fa-brands fa-apple', '2025-06-16 13:36:03', '2025-06-30 10:18:32', NULL),
(26, 'Ipad', 'ipad', NULL, 2, 'active', 1, 'uploads/categories/1750055888_Danh mục Ipad.png', 'fa-solid fa-tablet-screen-button', '2025-06-16 13:38:08', '2025-06-30 10:16:51', NULL),
(27, 'Mac', 'mac', NULL, 3, 'active', 1, 'uploads/categories/1750055982_Danh mục Mac.png', 'fa-solid fa-laptop', '2025-06-16 13:38:11', '2025-06-30 10:17:02', NULL),
(28, 'Watch', 'watch', NULL, 4, 'active', 1, 'uploads/categories/1750055904_Danh mục Watch.png', 'fa-regular fa-clock', '2025-06-16 13:38:24', '2025-06-30 10:16:35', NULL),
(29, 'Tai nghe, loa', 'tai-nghe-loa', NULL, 5, 'active', 1, 'uploads/categories/1750055919_Danh mục tai nghe, loa.png', 'fa-solid fa-headphones', '2025-06-16 13:38:39', '2025-06-30 10:16:19', NULL),
(30, 'Phụ kiện', 'phu-kien', NULL, 6, 'active', 1, 'uploads/categories/1750055957_Danh mục Phụ kiện.png', 'fa-solid fa-plug', '2025-06-16 13:39:17', '2025-06-30 10:16:07', NULL),
(31, 'asdasdd', 'asdasdd', NULL, 7, 'active', 1, 'uploads/categories/1750478975_iphone-16-pro-max-16-titan-tu-nhien-thumbnew-650x650.png', 'fa-brands fa-apple', '2025-06-21 11:09:35', '2025-06-30 10:19:06', '2025-06-30 10:19:06');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `ch_favorites`
--

CREATE TABLE `ch_favorites` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `favorite_id` bigint(20) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `ch_messages`
--

CREATE TABLE `ch_messages` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `from_id` bigint(20) NOT NULL,
  `to_id` bigint(20) NOT NULL,
  `body` varchar(5000) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `attachment` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `seen` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `contacts`
--

CREATE TABLE `contacts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `first_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `message` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `contacts`
--

INSERT INTO `contacts` (`id`, `first_name`, `last_name`, `email`, `phone`, `message`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Mừng', 'Nguyễn Văn', 'nguyendinhkhai0103@gmail.com', '0792263516', 'ok rồi bạn', '2025-05-24 16:52:42', '2025-05-24 16:52:42', NULL),
(2, 'Mừng', 'Nguyễn Văn', 'admin@gmail.com', '0792263516', 'oke', '2025-05-27 14:40:41', '2025-05-27 14:40:41', NULL),
(3, 'Khuất Thảo', 'Ly', 'mungnvph20465@fpt.edu.vn', '1234567890', 'iiiii', '2025-05-27 14:42:02', '2025-05-27 14:42:02', NULL),
(4, 'Mừng', 'Nguyễn Văn', 'admin@gmail.com', '1234567890', 'ssss', '2025-05-27 14:42:45', '2025-05-27 14:42:45', NULL),
(5, 'Mừng', 'Nguyễn Văn', 'dothivy0102@gmail.com', '1234567890', 'dịch vụ chưa', '2025-05-27 14:45:30', '2025-05-27 14:45:30', NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `failed_jobs`
--

INSERT INTO `failed_jobs` (`id`, `uuid`, `connection`, `queue`, `payload`, `exception`, `failed_at`) VALUES
(1, '058c6da8-c482-44ff-8337-f4cd5b3d614e', 'database', 'default', '{\"uuid\":\"058c6da8-c482-44ff-8337-f4cd5b3d614e\",\"displayName\":\"App\\\\Events\\\\OrderStatusUpdated\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":14:{s:5:\\\"event\\\";O:29:\\\"App\\\\Events\\\\OrderStatusUpdated\\\":1:{s:5:\\\"order\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:16:\\\"App\\\\Models\\\\Order\\\";s:2:\\\"id\\\";i:47;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\"},\"createdAt\":1748709788,\"delay\":null}', 'Illuminate\\Broadcasting\\BroadcastException: Pusher error: cURL error 7: Failed to connect to localhost port 8080 after 2255 ms: Couldn\'t connect to server (see https://curl.haxx.se/libcurl/c/libcurl-errors.html) for http://localhost:8080/apps/130010/events?auth_key=hebhaulzxbkh4ugtjs5x&auth_timestamp=1748724476&auth_version=1.0&body_md5=33c2617b95b7518834e2eebeb8c024ce&auth_signature=93bf11e08631ee174b24e439770c58de8594946bf51463a62bc146ebde6a3d1c. in C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Broadcasting\\Broadcasters\\PusherBroadcaster.php:163\nStack trace:\n#0 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Broadcasting\\BroadcastEvent.php(93): Illuminate\\Broadcasting\\Broadcasters\\PusherBroadcaster->broadcast(Object(Illuminate\\Support\\Collection), \'OrderStatusUpda...\', Array)\n#1 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(36): Illuminate\\Broadcasting\\BroadcastEvent->handle(Object(Illuminate\\Broadcasting\\BroadcastManager))\n#2 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Util.php(43): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#3 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(96): Illuminate\\Container\\Util::unwrapIfClosure(Object(Closure))\n#4 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(35): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(Illuminate\\Foundation\\Application), Array, Object(Closure))\n#5 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Container.php(754): Illuminate\\Container\\BoundMethod::call(Object(Illuminate\\Foundation\\Application), Array, Array, NULL)\n#6 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Bus\\Dispatcher.php(132): Illuminate\\Container\\Container->call(Array)\n#7 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(169): Illuminate\\Bus\\Dispatcher->Illuminate\\Bus\\{closure}(Object(Illuminate\\Broadcasting\\BroadcastEvent))\n#8 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(126): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Broadcasting\\BroadcastEvent))\n#9 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Bus\\Dispatcher.php(136): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#10 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(125): Illuminate\\Bus\\Dispatcher->dispatchNow(Object(Illuminate\\Broadcasting\\BroadcastEvent), false)\n#11 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(169): Illuminate\\Queue\\CallQueuedHandler->Illuminate\\Queue\\{closure}(Object(Illuminate\\Broadcasting\\BroadcastEvent))\n#12 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(126): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Broadcasting\\BroadcastEvent))\n#13 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(120): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#14 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(68): Illuminate\\Queue\\CallQueuedHandler->dispatchThroughMiddleware(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Object(Illuminate\\Broadcasting\\BroadcastEvent))\n#15 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Jobs\\Job.php(102): Illuminate\\Queue\\CallQueuedHandler->call(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Array)\n#16 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(441): Illuminate\\Queue\\Jobs\\Job->fire()\n#17 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(391): Illuminate\\Queue\\Worker->process(\'database\', Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Object(Illuminate\\Queue\\WorkerOptions))\n#18 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(177): Illuminate\\Queue\\Worker->runJob(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), \'database\', Object(Illuminate\\Queue\\WorkerOptions))\n#19 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Console\\WorkCommand.php(148): Illuminate\\Queue\\Worker->daemon(\'database\', \'default\', Object(Illuminate\\Queue\\WorkerOptions))\n#20 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Console\\WorkCommand.php(131): Illuminate\\Queue\\Console\\WorkCommand->runWorker(\'database\', \'default\')\n#21 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(36): Illuminate\\Queue\\Console\\WorkCommand->handle()\n#22 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Util.php(43): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#23 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(96): Illuminate\\Container\\Util::unwrapIfClosure(Object(Closure))\n#24 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(35): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(Illuminate\\Foundation\\Application), Array, Object(Closure))\n#25 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Container.php(754): Illuminate\\Container\\BoundMethod::call(Object(Illuminate\\Foundation\\Application), Array, Array, NULL)\n#26 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Console\\Command.php(211): Illuminate\\Container\\Container->call(Array)\n#27 C:\\DATN\\vendor\\symfony\\console\\Command\\Command.php(279): Illuminate\\Console\\Command->execute(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#28 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Console\\Command.php(180): Symfony\\Component\\Console\\Command\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#29 C:\\DATN\\vendor\\symfony\\console\\Application.php(1094): Illuminate\\Console\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#30 C:\\DATN\\vendor\\symfony\\console\\Application.php(342): Symfony\\Component\\Console\\Application->doRunCommand(Object(Illuminate\\Queue\\Console\\WorkCommand), Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#31 C:\\DATN\\vendor\\symfony\\console\\Application.php(193): Symfony\\Component\\Console\\Application->doRun(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#32 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Console\\Kernel.php(197): Symfony\\Component\\Console\\Application->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#33 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Application.php(1234): Illuminate\\Foundation\\Console\\Kernel->handle(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#34 C:\\DATN\\artisan(16): Illuminate\\Foundation\\Application->handleCommand(Object(Symfony\\Component\\Console\\Input\\ArgvInput))\n#35 {main}', '2025-06-01 03:47:59'),
(2, '89a0986b-70a4-4d6a-8c0b-29c3f1c32e0e', 'database', 'default', '{\"uuid\":\"89a0986b-70a4-4d6a-8c0b-29c3f1c32e0e\",\"displayName\":\"App\\\\Events\\\\OrderStatusUpdated\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":14:{s:5:\\\"event\\\";O:29:\\\"App\\\\Events\\\\OrderStatusUpdated\\\":1:{s:5:\\\"order\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:16:\\\"App\\\\Models\\\\Order\\\";s:2:\\\"id\\\";i:47;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\"},\"createdAt\":1748709845,\"delay\":null}', 'Illuminate\\Broadcasting\\BroadcastException: Pusher error: cURL error 7: Failed to connect to localhost port 8080 after 2248 ms: Couldn\'t connect to server (see https://curl.haxx.se/libcurl/c/libcurl-errors.html) for http://localhost:8080/apps/130010/events?auth_key=hebhaulzxbkh4ugtjs5x&auth_timestamp=1748724480&auth_version=1.0&body_md5=33c2617b95b7518834e2eebeb8c024ce&auth_signature=e0e0e06590a453df7f6050bf0c1c546f8d87c90715a030ea829eef61ba33dc47. in C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Broadcasting\\Broadcasters\\PusherBroadcaster.php:163\nStack trace:\n#0 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Broadcasting\\BroadcastEvent.php(93): Illuminate\\Broadcasting\\Broadcasters\\PusherBroadcaster->broadcast(Object(Illuminate\\Support\\Collection), \'OrderStatusUpda...\', Array)\n#1 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(36): Illuminate\\Broadcasting\\BroadcastEvent->handle(Object(Illuminate\\Broadcasting\\BroadcastManager))\n#2 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Util.php(43): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#3 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(96): Illuminate\\Container\\Util::unwrapIfClosure(Object(Closure))\n#4 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(35): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(Illuminate\\Foundation\\Application), Array, Object(Closure))\n#5 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Container.php(754): Illuminate\\Container\\BoundMethod::call(Object(Illuminate\\Foundation\\Application), Array, Array, NULL)\n#6 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Bus\\Dispatcher.php(132): Illuminate\\Container\\Container->call(Array)\n#7 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(169): Illuminate\\Bus\\Dispatcher->Illuminate\\Bus\\{closure}(Object(Illuminate\\Broadcasting\\BroadcastEvent))\n#8 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(126): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Broadcasting\\BroadcastEvent))\n#9 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Bus\\Dispatcher.php(136): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#10 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(125): Illuminate\\Bus\\Dispatcher->dispatchNow(Object(Illuminate\\Broadcasting\\BroadcastEvent), false)\n#11 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(169): Illuminate\\Queue\\CallQueuedHandler->Illuminate\\Queue\\{closure}(Object(Illuminate\\Broadcasting\\BroadcastEvent))\n#12 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(126): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Broadcasting\\BroadcastEvent))\n#13 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(120): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#14 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(68): Illuminate\\Queue\\CallQueuedHandler->dispatchThroughMiddleware(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Object(Illuminate\\Broadcasting\\BroadcastEvent))\n#15 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Jobs\\Job.php(102): Illuminate\\Queue\\CallQueuedHandler->call(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Array)\n#16 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(441): Illuminate\\Queue\\Jobs\\Job->fire()\n#17 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(391): Illuminate\\Queue\\Worker->process(\'database\', Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Object(Illuminate\\Queue\\WorkerOptions))\n#18 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(177): Illuminate\\Queue\\Worker->runJob(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), \'database\', Object(Illuminate\\Queue\\WorkerOptions))\n#19 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Console\\WorkCommand.php(148): Illuminate\\Queue\\Worker->daemon(\'database\', \'default\', Object(Illuminate\\Queue\\WorkerOptions))\n#20 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Console\\WorkCommand.php(131): Illuminate\\Queue\\Console\\WorkCommand->runWorker(\'database\', \'default\')\n#21 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(36): Illuminate\\Queue\\Console\\WorkCommand->handle()\n#22 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Util.php(43): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#23 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(96): Illuminate\\Container\\Util::unwrapIfClosure(Object(Closure))\n#24 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(35): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(Illuminate\\Foundation\\Application), Array, Object(Closure))\n#25 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Container.php(754): Illuminate\\Container\\BoundMethod::call(Object(Illuminate\\Foundation\\Application), Array, Array, NULL)\n#26 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Console\\Command.php(211): Illuminate\\Container\\Container->call(Array)\n#27 C:\\DATN\\vendor\\symfony\\console\\Command\\Command.php(279): Illuminate\\Console\\Command->execute(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#28 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Console\\Command.php(180): Symfony\\Component\\Console\\Command\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#29 C:\\DATN\\vendor\\symfony\\console\\Application.php(1094): Illuminate\\Console\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#30 C:\\DATN\\vendor\\symfony\\console\\Application.php(342): Symfony\\Component\\Console\\Application->doRunCommand(Object(Illuminate\\Queue\\Console\\WorkCommand), Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#31 C:\\DATN\\vendor\\symfony\\console\\Application.php(193): Symfony\\Component\\Console\\Application->doRun(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#32 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Console\\Kernel.php(197): Symfony\\Component\\Console\\Application->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#33 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Application.php(1234): Illuminate\\Foundation\\Console\\Kernel->handle(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#34 C:\\DATN\\artisan(16): Illuminate\\Foundation\\Application->handleCommand(Object(Symfony\\Component\\Console\\Input\\ArgvInput))\n#35 {main}', '2025-06-01 03:48:03'),
(3, '9afa8ca5-794a-4977-a9a5-cb686205a36d', 'database', 'default', '{\"uuid\":\"9afa8ca5-794a-4977-a9a5-cb686205a36d\",\"displayName\":\"App\\\\Events\\\\OrderStatusUpdated\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":14:{s:5:\\\"event\\\";O:29:\\\"App\\\\Events\\\\OrderStatusUpdated\\\":1:{s:5:\\\"order\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:16:\\\"App\\\\Models\\\\Order\\\";s:2:\\\"id\\\";i:47;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\"},\"createdAt\":1748713564,\"delay\":null}', 'Illuminate\\Broadcasting\\BroadcastException: Pusher error: cURL error 7: Failed to connect to localhost port 8080 after 2252 ms: Couldn\'t connect to server (see https://curl.haxx.se/libcurl/c/libcurl-errors.html) for http://localhost:8080/apps/130010/events?auth_key=hebhaulzxbkh4ugtjs5x&auth_timestamp=1748724483&auth_version=1.0&body_md5=33c2617b95b7518834e2eebeb8c024ce&auth_signature=66e241526fef054b2ce4f2377abc7cd68cd1770893b20a92d5a832400e83bceb. in C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Broadcasting\\Broadcasters\\PusherBroadcaster.php:163\nStack trace:\n#0 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Broadcasting\\BroadcastEvent.php(93): Illuminate\\Broadcasting\\Broadcasters\\PusherBroadcaster->broadcast(Object(Illuminate\\Support\\Collection), \'OrderStatusUpda...\', Array)\n#1 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(36): Illuminate\\Broadcasting\\BroadcastEvent->handle(Object(Illuminate\\Broadcasting\\BroadcastManager))\n#2 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Util.php(43): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#3 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(96): Illuminate\\Container\\Util::unwrapIfClosure(Object(Closure))\n#4 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(35): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(Illuminate\\Foundation\\Application), Array, Object(Closure))\n#5 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Container.php(754): Illuminate\\Container\\BoundMethod::call(Object(Illuminate\\Foundation\\Application), Array, Array, NULL)\n#6 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Bus\\Dispatcher.php(132): Illuminate\\Container\\Container->call(Array)\n#7 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(169): Illuminate\\Bus\\Dispatcher->Illuminate\\Bus\\{closure}(Object(Illuminate\\Broadcasting\\BroadcastEvent))\n#8 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(126): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Broadcasting\\BroadcastEvent))\n#9 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Bus\\Dispatcher.php(136): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#10 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(125): Illuminate\\Bus\\Dispatcher->dispatchNow(Object(Illuminate\\Broadcasting\\BroadcastEvent), false)\n#11 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(169): Illuminate\\Queue\\CallQueuedHandler->Illuminate\\Queue\\{closure}(Object(Illuminate\\Broadcasting\\BroadcastEvent))\n#12 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(126): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Broadcasting\\BroadcastEvent))\n#13 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(120): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#14 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(68): Illuminate\\Queue\\CallQueuedHandler->dispatchThroughMiddleware(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Object(Illuminate\\Broadcasting\\BroadcastEvent))\n#15 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Jobs\\Job.php(102): Illuminate\\Queue\\CallQueuedHandler->call(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Array)\n#16 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(441): Illuminate\\Queue\\Jobs\\Job->fire()\n#17 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(391): Illuminate\\Queue\\Worker->process(\'database\', Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Object(Illuminate\\Queue\\WorkerOptions))\n#18 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(177): Illuminate\\Queue\\Worker->runJob(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), \'database\', Object(Illuminate\\Queue\\WorkerOptions))\n#19 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Console\\WorkCommand.php(148): Illuminate\\Queue\\Worker->daemon(\'database\', \'default\', Object(Illuminate\\Queue\\WorkerOptions))\n#20 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Console\\WorkCommand.php(131): Illuminate\\Queue\\Console\\WorkCommand->runWorker(\'database\', \'default\')\n#21 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(36): Illuminate\\Queue\\Console\\WorkCommand->handle()\n#22 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Util.php(43): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#23 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(96): Illuminate\\Container\\Util::unwrapIfClosure(Object(Closure))\n#24 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(35): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(Illuminate\\Foundation\\Application), Array, Object(Closure))\n#25 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Container.php(754): Illuminate\\Container\\BoundMethod::call(Object(Illuminate\\Foundation\\Application), Array, Array, NULL)\n#26 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Console\\Command.php(211): Illuminate\\Container\\Container->call(Array)\n#27 C:\\DATN\\vendor\\symfony\\console\\Command\\Command.php(279): Illuminate\\Console\\Command->execute(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#28 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Console\\Command.php(180): Symfony\\Component\\Console\\Command\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#29 C:\\DATN\\vendor\\symfony\\console\\Application.php(1094): Illuminate\\Console\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#30 C:\\DATN\\vendor\\symfony\\console\\Application.php(342): Symfony\\Component\\Console\\Application->doRunCommand(Object(Illuminate\\Queue\\Console\\WorkCommand), Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#31 C:\\DATN\\vendor\\symfony\\console\\Application.php(193): Symfony\\Component\\Console\\Application->doRun(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#32 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Console\\Kernel.php(197): Symfony\\Component\\Console\\Application->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#33 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Application.php(1234): Illuminate\\Foundation\\Console\\Kernel->handle(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#34 C:\\DATN\\artisan(16): Illuminate\\Foundation\\Application->handleCommand(Object(Symfony\\Component\\Console\\Input\\ArgvInput))\n#35 {main}', '2025-06-01 03:48:06'),
(4, '45f54d57-4174-4d3c-8159-4c4e087f0c41', 'database', 'default', '{\"uuid\":\"45f54d57-4174-4d3c-8159-4c4e087f0c41\",\"displayName\":\"App\\\\Events\\\\OrderStatusUpdated\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":14:{s:5:\\\"event\\\";O:29:\\\"App\\\\Events\\\\OrderStatusUpdated\\\":1:{s:5:\\\"order\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:16:\\\"App\\\\Models\\\\Order\\\";s:2:\\\"id\\\";i:47;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\"},\"createdAt\":1748713771,\"delay\":null}', 'Illuminate\\Broadcasting\\BroadcastException: Pusher error: cURL error 7: Failed to connect to localhost port 8080 after 2250 ms: Couldn\'t connect to server (see https://curl.haxx.se/libcurl/c/libcurl-errors.html) for http://localhost:8080/apps/130010/events?auth_key=hebhaulzxbkh4ugtjs5x&auth_timestamp=1748724486&auth_version=1.0&body_md5=33c2617b95b7518834e2eebeb8c024ce&auth_signature=185ab2c8c516dda258cacc14ffedfd8f1fe4c99ba595034f2cadb48204a264c4. in C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Broadcasting\\Broadcasters\\PusherBroadcaster.php:163\nStack trace:\n#0 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Broadcasting\\BroadcastEvent.php(93): Illuminate\\Broadcasting\\Broadcasters\\PusherBroadcaster->broadcast(Object(Illuminate\\Support\\Collection), \'OrderStatusUpda...\', Array)\n#1 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(36): Illuminate\\Broadcasting\\BroadcastEvent->handle(Object(Illuminate\\Broadcasting\\BroadcastManager))\n#2 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Util.php(43): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#3 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(96): Illuminate\\Container\\Util::unwrapIfClosure(Object(Closure))\n#4 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(35): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(Illuminate\\Foundation\\Application), Array, Object(Closure))\n#5 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Container.php(754): Illuminate\\Container\\BoundMethod::call(Object(Illuminate\\Foundation\\Application), Array, Array, NULL)\n#6 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Bus\\Dispatcher.php(132): Illuminate\\Container\\Container->call(Array)\n#7 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(169): Illuminate\\Bus\\Dispatcher->Illuminate\\Bus\\{closure}(Object(Illuminate\\Broadcasting\\BroadcastEvent))\n#8 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(126): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Broadcasting\\BroadcastEvent))\n#9 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Bus\\Dispatcher.php(136): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#10 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(125): Illuminate\\Bus\\Dispatcher->dispatchNow(Object(Illuminate\\Broadcasting\\BroadcastEvent), false)\n#11 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(169): Illuminate\\Queue\\CallQueuedHandler->Illuminate\\Queue\\{closure}(Object(Illuminate\\Broadcasting\\BroadcastEvent))\n#12 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(126): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Broadcasting\\BroadcastEvent))\n#13 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(120): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#14 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(68): Illuminate\\Queue\\CallQueuedHandler->dispatchThroughMiddleware(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Object(Illuminate\\Broadcasting\\BroadcastEvent))\n#15 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Jobs\\Job.php(102): Illuminate\\Queue\\CallQueuedHandler->call(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Array)\n#16 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(441): Illuminate\\Queue\\Jobs\\Job->fire()\n#17 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(391): Illuminate\\Queue\\Worker->process(\'database\', Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Object(Illuminate\\Queue\\WorkerOptions))\n#18 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(177): Illuminate\\Queue\\Worker->runJob(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), \'database\', Object(Illuminate\\Queue\\WorkerOptions))\n#19 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Console\\WorkCommand.php(148): Illuminate\\Queue\\Worker->daemon(\'database\', \'default\', Object(Illuminate\\Queue\\WorkerOptions))\n#20 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Console\\WorkCommand.php(131): Illuminate\\Queue\\Console\\WorkCommand->runWorker(\'database\', \'default\')\n#21 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(36): Illuminate\\Queue\\Console\\WorkCommand->handle()\n#22 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Util.php(43): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#23 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(96): Illuminate\\Container\\Util::unwrapIfClosure(Object(Closure))\n#24 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(35): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(Illuminate\\Foundation\\Application), Array, Object(Closure))\n#25 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Container.php(754): Illuminate\\Container\\BoundMethod::call(Object(Illuminate\\Foundation\\Application), Array, Array, NULL)\n#26 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Console\\Command.php(211): Illuminate\\Container\\Container->call(Array)\n#27 C:\\DATN\\vendor\\symfony\\console\\Command\\Command.php(279): Illuminate\\Console\\Command->execute(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#28 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Console\\Command.php(180): Symfony\\Component\\Console\\Command\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#29 C:\\DATN\\vendor\\symfony\\console\\Application.php(1094): Illuminate\\Console\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#30 C:\\DATN\\vendor\\symfony\\console\\Application.php(342): Symfony\\Component\\Console\\Application->doRunCommand(Object(Illuminate\\Queue\\Console\\WorkCommand), Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#31 C:\\DATN\\vendor\\symfony\\console\\Application.php(193): Symfony\\Component\\Console\\Application->doRun(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#32 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Console\\Kernel.php(197): Symfony\\Component\\Console\\Application->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#33 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Application.php(1234): Illuminate\\Foundation\\Console\\Kernel->handle(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#34 C:\\DATN\\artisan(16): Illuminate\\Foundation\\Application->handleCommand(Object(Symfony\\Component\\Console\\Input\\ArgvInput))\n#35 {main}', '2025-06-01 03:48:09'),
(5, '8ab363eb-cbfe-4561-8fb6-bff428fc7837', 'database', 'default', '{\"uuid\":\"8ab363eb-cbfe-4561-8fb6-bff428fc7837\",\"displayName\":\"App\\\\Events\\\\OrderStatusUpdated\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":14:{s:5:\\\"event\\\";O:29:\\\"App\\\\Events\\\\OrderStatusUpdated\\\":1:{s:5:\\\"order\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:16:\\\"App\\\\Models\\\\Order\\\";s:2:\\\"id\\\";i:131;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\"},\"createdAt\":1749824576,\"delay\":null}', 'Illuminate\\Broadcasting\\BroadcastException: Pusher error: cURL error 7: Failed to connect to localhost port 8080: Connection refused (see https://curl.haxx.se/libcurl/c/libcurl-errors.html) for http://localhost:8080/apps/130010/events?auth_key=hebhaulzxbkh4ugtjs5x&auth_timestamp=1749826079&auth_version=1.0&body_md5=539ee96f87ac29afad92506635105a45&auth_signature=593edd9a5cd2266697bb3c9e79cb008781ca658626350565797b6a5b4e14f9e4. in /www/wwwroot/applestore.kenhweb.com/vendor/laravel/framework/src/Illuminate/Broadcasting/Broadcasters/PusherBroadcaster.php:163\nStack trace:\n#0 /www/wwwroot/applestore.kenhweb.com/vendor/laravel/framework/src/Illuminate/Broadcasting/BroadcastEvent.php(93): Illuminate\\Broadcasting\\Broadcasters\\PusherBroadcaster->broadcast()\n#1 /www/wwwroot/applestore.kenhweb.com/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(36): Illuminate\\Broadcasting\\BroadcastEvent->handle()\n#2 /www/wwwroot/applestore.kenhweb.com/vendor/laravel/framework/src/Illuminate/Container/Util.php(43): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#3 /www/wwwroot/applestore.kenhweb.com/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(96): Illuminate\\Container\\Util::unwrapIfClosure()\n#4 /www/wwwroot/applestore.kenhweb.com/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(35): Illuminate\\Container\\BoundMethod::callBoundMethod()\n#5 /www/wwwroot/applestore.kenhweb.com/vendor/laravel/framework/src/Illuminate/Container/Container.php(754): Illuminate\\Container\\BoundMethod::call()\n#6 /www/wwwroot/applestore.kenhweb.com/vendor/laravel/framework/src/Illuminate/Bus/Dispatcher.php(132): Illuminate\\Container\\Container->call()\n#7 /www/wwwroot/applestore.kenhweb.com/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(169): Illuminate\\Bus\\Dispatcher->Illuminate\\Bus\\{closure}()\n#8 /www/wwwroot/applestore.kenhweb.com/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(126): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}()\n#9 /www/wwwroot/applestore.kenhweb.com/vendor/laravel/framework/src/Illuminate/Bus/Dispatcher.php(136): Illuminate\\Pipeline\\Pipeline->then()\n#10 /www/wwwroot/applestore.kenhweb.com/vendor/laravel/framework/src/Illuminate/Queue/CallQueuedHandler.php(125): Illuminate\\Bus\\Dispatcher->dispatchNow()\n#11 /www/wwwroot/applestore.kenhweb.com/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(169): Illuminate\\Queue\\CallQueuedHandler->Illuminate\\Queue\\{closure}()\n#12 /www/wwwroot/applestore.kenhweb.com/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(126): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}()\n#13 /www/wwwroot/applestore.kenhweb.com/vendor/laravel/framework/src/Illuminate/Queue/CallQueuedHandler.php(120): Illuminate\\Pipeline\\Pipeline->then()\n#14 /www/wwwroot/applestore.kenhweb.com/vendor/laravel/framework/src/Illuminate/Queue/CallQueuedHandler.php(68): Illuminate\\Queue\\CallQueuedHandler->dispatchThroughMiddleware()\n#15 /www/wwwroot/applestore.kenhweb.com/vendor/laravel/framework/src/Illuminate/Queue/Jobs/Job.php(102): Illuminate\\Queue\\CallQueuedHandler->call()\n#16 /www/wwwroot/applestore.kenhweb.com/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(441): Illuminate\\Queue\\Jobs\\Job->fire()\n#17 /www/wwwroot/applestore.kenhweb.com/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(391): Illuminate\\Queue\\Worker->process()\n#18 /www/wwwroot/applestore.kenhweb.com/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(177): Illuminate\\Queue\\Worker->runJob()\n#19 /www/wwwroot/applestore.kenhweb.com/vendor/laravel/framework/src/Illuminate/Queue/Console/WorkCommand.php(148): Illuminate\\Queue\\Worker->daemon()\n#20 /www/wwwroot/applestore.kenhweb.com/vendor/laravel/framework/src/Illuminate/Queue/Console/WorkCommand.php(131): Illuminate\\Queue\\Console\\WorkCommand->runWorker()\n#21 /www/wwwroot/applestore.kenhweb.com/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(36): Illuminate\\Queue\\Console\\WorkCommand->handle()\n#22 /www/wwwroot/applestore.kenhweb.com/vendor/laravel/framework/src/Illuminate/Container/Util.php(43): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#23 /www/wwwroot/applestore.kenhweb.com/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(96): Illuminate\\Container\\Util::unwrapIfClosure()\n#24 /www/wwwroot/applestore.kenhweb.com/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(35): Illuminate\\Container\\BoundMethod::callBoundMethod()\n#25 /www/wwwroot/applestore.kenhweb.com/vendor/laravel/framework/src/Illuminate/Container/Container.php(754): Illuminate\\Container\\BoundMethod::call()\n#26 /www/wwwroot/applestore.kenhweb.com/vendor/laravel/framework/src/Illuminate/Console/Command.php(211): Illuminate\\Container\\Container->call()\n#27 /www/wwwroot/applestore.kenhweb.com/vendor/symfony/console/Command/Command.php(318): Illuminate\\Console\\Command->execute()\n#28 /www/wwwroot/applestore.kenhweb.com/vendor/laravel/framework/src/Illuminate/Console/Command.php(180): Symfony\\Component\\Console\\Command\\Command->run()\n#29 /www/wwwroot/applestore.kenhweb.com/vendor/symfony/console/Application.php(1092): Illuminate\\Console\\Command->run()\n#30 /www/wwwroot/applestore.kenhweb.com/vendor/symfony/console/Application.php(341): Symfony\\Component\\Console\\Application->doRunCommand()\n#31 /www/wwwroot/applestore.kenhweb.com/vendor/symfony/console/Application.php(192): Symfony\\Component\\Console\\Application->doRun()\n#32 /www/wwwroot/applestore.kenhweb.com/vendor/laravel/framework/src/Illuminate/Foundation/Console/Kernel.php(197): Symfony\\Component\\Console\\Application->run()\n#33 /www/wwwroot/applestore.kenhweb.com/vendor/laravel/framework/src/Illuminate/Foundation/Application.php(1234): Illuminate\\Foundation\\Console\\Kernel->handle()\n#34 /www/wwwroot/applestore.kenhweb.com/artisan(16): Illuminate\\Foundation\\Application->handleCommand()\n#35 {main}', '2025-06-13 21:47:59'),
(6, '808a36b8-fe18-4ff6-854c-a5b1315313ea', 'database', 'default', '{\"uuid\":\"808a36b8-fe18-4ff6-854c-a5b1315313ea\",\"displayName\":\"App\\\\Events\\\\OrderStatusUpdated\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":14:{s:5:\\\"event\\\";O:29:\\\"App\\\\Events\\\\OrderStatusUpdated\\\":1:{s:5:\\\"order\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:16:\\\"App\\\\Models\\\\Order\\\";s:2:\\\"id\\\";i:131;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\"},\"createdAt\":1749826869,\"delay\":null}', 'Illuminate\\Database\\Eloquent\\ModelNotFoundException: No query results for model [App\\Models\\Order]. in C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\Eloquent\\Builder.php:750\nStack trace:\n#0 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\SerializesAndRestoresModelIdentifiers.php(110): Illuminate\\Database\\Eloquent\\Builder->firstOrFail()\n#1 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\SerializesAndRestoresModelIdentifiers.php(63): App\\Events\\OrderStatusUpdated->restoreModel(Object(Illuminate\\Contracts\\Database\\ModelIdentifier))\n#2 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\SerializesModels.php(97): App\\Events\\OrderStatusUpdated->getRestoredPropertyValue(Object(Illuminate\\Contracts\\Database\\ModelIdentifier))\n#3 [internal function]: App\\Events\\OrderStatusUpdated->__unserialize(Array)\n#4 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(95): unserialize(\'O:38:\"Illuminat...\')\n#5 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(62): Illuminate\\Queue\\CallQueuedHandler->getCommand(Array)\n#6 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Jobs\\Job.php(102): Illuminate\\Queue\\CallQueuedHandler->call(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Array)\n#7 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(441): Illuminate\\Queue\\Jobs\\Job->fire()\n#8 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(391): Illuminate\\Queue\\Worker->process(\'database\', Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Object(Illuminate\\Queue\\WorkerOptions))\n#9 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(177): Illuminate\\Queue\\Worker->runJob(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), \'database\', Object(Illuminate\\Queue\\WorkerOptions))\n#10 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Console\\WorkCommand.php(148): Illuminate\\Queue\\Worker->daemon(\'database\', \'default\', Object(Illuminate\\Queue\\WorkerOptions))\n#11 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Console\\WorkCommand.php(131): Illuminate\\Queue\\Console\\WorkCommand->runWorker(\'database\', \'default\')\n#12 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(36): Illuminate\\Queue\\Console\\WorkCommand->handle()\n#13 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Util.php(43): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#14 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(96): Illuminate\\Container\\Util::unwrapIfClosure(Object(Closure))\n#15 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(35): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(Illuminate\\Foundation\\Application), Array, Object(Closure))\n#16 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Container.php(754): Illuminate\\Container\\BoundMethod::call(Object(Illuminate\\Foundation\\Application), Array, Array, NULL)\n#17 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Console\\Command.php(211): Illuminate\\Container\\Container->call(Array)\n#18 C:\\DATN\\vendor\\symfony\\console\\Command\\Command.php(318): Illuminate\\Console\\Command->execute(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#19 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Console\\Command.php(180): Symfony\\Component\\Console\\Command\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#20 C:\\DATN\\vendor\\symfony\\console\\Application.php(1092): Illuminate\\Console\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#21 C:\\DATN\\vendor\\symfony\\console\\Application.php(341): Symfony\\Component\\Console\\Application->doRunCommand(Object(Illuminate\\Queue\\Console\\WorkCommand), Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#22 C:\\DATN\\vendor\\symfony\\console\\Application.php(192): Symfony\\Component\\Console\\Application->doRun(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#23 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Console\\Kernel.php(197): Symfony\\Component\\Console\\Application->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#24 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Application.php(1234): Illuminate\\Foundation\\Console\\Kernel->handle(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#25 C:\\DATN\\artisan(16): Illuminate\\Foundation\\Application->handleCommand(Object(Symfony\\Component\\Console\\Input\\ArgvInput))\n#26 {main}', '2025-06-15 01:38:47');
INSERT INTO `failed_jobs` (`id`, `uuid`, `connection`, `queue`, `payload`, `exception`, `failed_at`) VALUES
(7, '09f018e7-9591-43ec-bc9c-220a0373d837', 'database', 'default', '{\"uuid\":\"09f018e7-9591-43ec-bc9c-220a0373d837\",\"displayName\":\"App\\\\Events\\\\OrderStatusUpdated\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":14:{s:5:\\\"event\\\";O:29:\\\"App\\\\Events\\\\OrderStatusUpdated\\\":1:{s:5:\\\"order\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:16:\\\"App\\\\Models\\\\Order\\\";s:2:\\\"id\\\";i:8;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\"},\"createdAt\":1749933511,\"delay\":null}', 'Illuminate\\Broadcasting\\BroadcastException: Pusher error: cURL error 7: Failed to connect to localhost port 8080 after 2256 ms: Couldn\'t connect to server (see https://curl.haxx.se/libcurl/c/libcurl-errors.html) for http://localhost:8080/apps/130010/events?auth_key=hebhaulzxbkh4ugtjs5x&auth_timestamp=1749933515&auth_version=1.0&body_md5=be850f50a4fb0f1b426336ee3062d40a&auth_signature=807310411230c6c838020c1c139346991de6c7eb45063cec37ba2c4c73cb0976. in C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Broadcasting\\Broadcasters\\PusherBroadcaster.php:163\nStack trace:\n#0 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Broadcasting\\BroadcastEvent.php(93): Illuminate\\Broadcasting\\Broadcasters\\PusherBroadcaster->broadcast(Object(Illuminate\\Support\\Collection), \'OrderStatusUpda...\', Array)\n#1 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(36): Illuminate\\Broadcasting\\BroadcastEvent->handle(Object(Illuminate\\Broadcasting\\BroadcastManager))\n#2 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Util.php(43): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#3 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(96): Illuminate\\Container\\Util::unwrapIfClosure(Object(Closure))\n#4 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(35): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(Illuminate\\Foundation\\Application), Array, Object(Closure))\n#5 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Container.php(754): Illuminate\\Container\\BoundMethod::call(Object(Illuminate\\Foundation\\Application), Array, Array, NULL)\n#6 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Bus\\Dispatcher.php(132): Illuminate\\Container\\Container->call(Array)\n#7 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(169): Illuminate\\Bus\\Dispatcher->Illuminate\\Bus\\{closure}(Object(Illuminate\\Broadcasting\\BroadcastEvent))\n#8 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(126): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Broadcasting\\BroadcastEvent))\n#9 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Bus\\Dispatcher.php(136): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#10 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(125): Illuminate\\Bus\\Dispatcher->dispatchNow(Object(Illuminate\\Broadcasting\\BroadcastEvent), false)\n#11 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(169): Illuminate\\Queue\\CallQueuedHandler->Illuminate\\Queue\\{closure}(Object(Illuminate\\Broadcasting\\BroadcastEvent))\n#12 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(126): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Broadcasting\\BroadcastEvent))\n#13 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(120): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#14 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(68): Illuminate\\Queue\\CallQueuedHandler->dispatchThroughMiddleware(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Object(Illuminate\\Broadcasting\\BroadcastEvent))\n#15 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Jobs\\Job.php(102): Illuminate\\Queue\\CallQueuedHandler->call(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Array)\n#16 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(441): Illuminate\\Queue\\Jobs\\Job->fire()\n#17 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(391): Illuminate\\Queue\\Worker->process(\'database\', Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Object(Illuminate\\Queue\\WorkerOptions))\n#18 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(177): Illuminate\\Queue\\Worker->runJob(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), \'database\', Object(Illuminate\\Queue\\WorkerOptions))\n#19 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Console\\WorkCommand.php(148): Illuminate\\Queue\\Worker->daemon(\'database\', \'default\', Object(Illuminate\\Queue\\WorkerOptions))\n#20 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Console\\WorkCommand.php(131): Illuminate\\Queue\\Console\\WorkCommand->runWorker(\'database\', \'default\')\n#21 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(36): Illuminate\\Queue\\Console\\WorkCommand->handle()\n#22 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Util.php(43): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#23 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(96): Illuminate\\Container\\Util::unwrapIfClosure(Object(Closure))\n#24 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(35): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(Illuminate\\Foundation\\Application), Array, Object(Closure))\n#25 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Container.php(754): Illuminate\\Container\\BoundMethod::call(Object(Illuminate\\Foundation\\Application), Array, Array, NULL)\n#26 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Console\\Command.php(211): Illuminate\\Container\\Container->call(Array)\n#27 C:\\DATN\\vendor\\symfony\\console\\Command\\Command.php(318): Illuminate\\Console\\Command->execute(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#28 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Console\\Command.php(180): Symfony\\Component\\Console\\Command\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#29 C:\\DATN\\vendor\\symfony\\console\\Application.php(1092): Illuminate\\Console\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#30 C:\\DATN\\vendor\\symfony\\console\\Application.php(341): Symfony\\Component\\Console\\Application->doRunCommand(Object(Illuminate\\Queue\\Console\\WorkCommand), Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#31 C:\\DATN\\vendor\\symfony\\console\\Application.php(192): Symfony\\Component\\Console\\Application->doRun(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#32 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Console\\Kernel.php(197): Symfony\\Component\\Console\\Application->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#33 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Application.php(1234): Illuminate\\Foundation\\Console\\Kernel->handle(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#34 C:\\DATN\\artisan(16): Illuminate\\Foundation\\Application->handleCommand(Object(Symfony\\Component\\Console\\Input\\ArgvInput))\n#35 {main}', '2025-06-15 03:39:05'),
(8, 'f4f33307-9419-4000-8ac7-d13c1d2dae2f', 'database', 'default', '{\"uuid\":\"f4f33307-9419-4000-8ac7-d13c1d2dae2f\",\"displayName\":\"App\\\\Events\\\\OrderStatusUpdated\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":14:{s:5:\\\"event\\\";O:29:\\\"App\\\\Events\\\\OrderStatusUpdated\\\":1:{s:5:\\\"order\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:16:\\\"App\\\\Models\\\\Order\\\";s:2:\\\"id\\\";i:13;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\"},\"createdAt\":1749946927,\"delay\":null}', 'Illuminate\\Broadcasting\\BroadcastException: Pusher error: cURL error 7: Failed to connect to localhost port 8080 after 2238 ms: Couldn\'t connect to server (see https://curl.haxx.se/libcurl/c/libcurl-errors.html) for http://localhost:8080/apps/130010/events?auth_key=hebhaulzxbkh4ugtjs5x&auth_timestamp=1749947064&auth_version=1.0&body_md5=3c8136858e93e4b1b25e594e907837f0&auth_signature=5eac0f6101dca114c213d9ad0e25f3262cc1b929dcd5879a50171348ea112796. in C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Broadcasting\\Broadcasters\\PusherBroadcaster.php:163\nStack trace:\n#0 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Broadcasting\\BroadcastEvent.php(93): Illuminate\\Broadcasting\\Broadcasters\\PusherBroadcaster->broadcast(Object(Illuminate\\Support\\Collection), \'OrderStatusUpda...\', Array)\n#1 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(36): Illuminate\\Broadcasting\\BroadcastEvent->handle(Object(Illuminate\\Broadcasting\\BroadcastManager))\n#2 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Util.php(43): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#3 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(96): Illuminate\\Container\\Util::unwrapIfClosure(Object(Closure))\n#4 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(35): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(Illuminate\\Foundation\\Application), Array, Object(Closure))\n#5 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Container.php(754): Illuminate\\Container\\BoundMethod::call(Object(Illuminate\\Foundation\\Application), Array, Array, NULL)\n#6 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Bus\\Dispatcher.php(132): Illuminate\\Container\\Container->call(Array)\n#7 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(169): Illuminate\\Bus\\Dispatcher->Illuminate\\Bus\\{closure}(Object(Illuminate\\Broadcasting\\BroadcastEvent))\n#8 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(126): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Broadcasting\\BroadcastEvent))\n#9 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Bus\\Dispatcher.php(136): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#10 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(125): Illuminate\\Bus\\Dispatcher->dispatchNow(Object(Illuminate\\Broadcasting\\BroadcastEvent), false)\n#11 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(169): Illuminate\\Queue\\CallQueuedHandler->Illuminate\\Queue\\{closure}(Object(Illuminate\\Broadcasting\\BroadcastEvent))\n#12 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(126): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Broadcasting\\BroadcastEvent))\n#13 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(120): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#14 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(68): Illuminate\\Queue\\CallQueuedHandler->dispatchThroughMiddleware(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Object(Illuminate\\Broadcasting\\BroadcastEvent))\n#15 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Jobs\\Job.php(102): Illuminate\\Queue\\CallQueuedHandler->call(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Array)\n#16 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(441): Illuminate\\Queue\\Jobs\\Job->fire()\n#17 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(391): Illuminate\\Queue\\Worker->process(\'database\', Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Object(Illuminate\\Queue\\WorkerOptions))\n#18 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(177): Illuminate\\Queue\\Worker->runJob(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), \'database\', Object(Illuminate\\Queue\\WorkerOptions))\n#19 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Console\\WorkCommand.php(148): Illuminate\\Queue\\Worker->daemon(\'database\', \'default\', Object(Illuminate\\Queue\\WorkerOptions))\n#20 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Console\\WorkCommand.php(131): Illuminate\\Queue\\Console\\WorkCommand->runWorker(\'database\', \'default\')\n#21 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(36): Illuminate\\Queue\\Console\\WorkCommand->handle()\n#22 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Util.php(43): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#23 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(96): Illuminate\\Container\\Util::unwrapIfClosure(Object(Closure))\n#24 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(35): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(Illuminate\\Foundation\\Application), Array, Object(Closure))\n#25 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Container.php(754): Illuminate\\Container\\BoundMethod::call(Object(Illuminate\\Foundation\\Application), Array, Array, NULL)\n#26 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Console\\Command.php(211): Illuminate\\Container\\Container->call(Array)\n#27 C:\\DATN\\vendor\\symfony\\console\\Command\\Command.php(318): Illuminate\\Console\\Command->execute(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#28 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Console\\Command.php(180): Symfony\\Component\\Console\\Command\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#29 C:\\DATN\\vendor\\symfony\\console\\Application.php(1092): Illuminate\\Console\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#30 C:\\DATN\\vendor\\symfony\\console\\Application.php(341): Symfony\\Component\\Console\\Application->doRunCommand(Object(Illuminate\\Queue\\Console\\WorkCommand), Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#31 C:\\DATN\\vendor\\symfony\\console\\Application.php(192): Symfony\\Component\\Console\\Application->doRun(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#32 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Console\\Kernel.php(197): Symfony\\Component\\Console\\Application->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#33 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Application.php(1234): Illuminate\\Foundation\\Console\\Kernel->handle(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#34 C:\\DATN\\artisan(16): Illuminate\\Foundation\\Application->handleCommand(Object(Symfony\\Component\\Console\\Input\\ArgvInput))\n#35 {main}', '2025-06-15 07:24:26'),
(9, '14af1aaa-10e5-42c6-93cd-a60835a14114', 'database', 'default', '{\"uuid\":\"14af1aaa-10e5-42c6-93cd-a60835a14114\",\"displayName\":\"App\\\\Events\\\\OrderStatusUpdated\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":14:{s:5:\\\"event\\\";O:29:\\\"App\\\\Events\\\\OrderStatusUpdated\\\":1:{s:5:\\\"order\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:16:\\\"App\\\\Models\\\\Order\\\";s:2:\\\"id\\\";i:13;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\"},\"createdAt\":1749946982,\"delay\":null}', 'Illuminate\\Broadcasting\\BroadcastException: Pusher error: cURL error 7: Failed to connect to localhost port 8080 after 2248 ms: Couldn\'t connect to server (see https://curl.haxx.se/libcurl/c/libcurl-errors.html) for http://localhost:8080/apps/130010/events?auth_key=hebhaulzxbkh4ugtjs5x&auth_timestamp=1749947067&auth_version=1.0&body_md5=3c8136858e93e4b1b25e594e907837f0&auth_signature=fc47ab9e05eb63b7fc6dfa136a91e2a63a9a3651d88cc17bc9c809f0efc87f8a. in C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Broadcasting\\Broadcasters\\PusherBroadcaster.php:163\nStack trace:\n#0 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Broadcasting\\BroadcastEvent.php(93): Illuminate\\Broadcasting\\Broadcasters\\PusherBroadcaster->broadcast(Object(Illuminate\\Support\\Collection), \'OrderStatusUpda...\', Array)\n#1 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(36): Illuminate\\Broadcasting\\BroadcastEvent->handle(Object(Illuminate\\Broadcasting\\BroadcastManager))\n#2 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Util.php(43): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#3 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(96): Illuminate\\Container\\Util::unwrapIfClosure(Object(Closure))\n#4 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(35): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(Illuminate\\Foundation\\Application), Array, Object(Closure))\n#5 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Container.php(754): Illuminate\\Container\\BoundMethod::call(Object(Illuminate\\Foundation\\Application), Array, Array, NULL)\n#6 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Bus\\Dispatcher.php(132): Illuminate\\Container\\Container->call(Array)\n#7 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(169): Illuminate\\Bus\\Dispatcher->Illuminate\\Bus\\{closure}(Object(Illuminate\\Broadcasting\\BroadcastEvent))\n#8 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(126): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Broadcasting\\BroadcastEvent))\n#9 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Bus\\Dispatcher.php(136): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#10 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(125): Illuminate\\Bus\\Dispatcher->dispatchNow(Object(Illuminate\\Broadcasting\\BroadcastEvent), false)\n#11 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(169): Illuminate\\Queue\\CallQueuedHandler->Illuminate\\Queue\\{closure}(Object(Illuminate\\Broadcasting\\BroadcastEvent))\n#12 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(126): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Broadcasting\\BroadcastEvent))\n#13 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(120): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#14 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(68): Illuminate\\Queue\\CallQueuedHandler->dispatchThroughMiddleware(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Object(Illuminate\\Broadcasting\\BroadcastEvent))\n#15 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Jobs\\Job.php(102): Illuminate\\Queue\\CallQueuedHandler->call(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Array)\n#16 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(441): Illuminate\\Queue\\Jobs\\Job->fire()\n#17 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(391): Illuminate\\Queue\\Worker->process(\'database\', Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Object(Illuminate\\Queue\\WorkerOptions))\n#18 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(177): Illuminate\\Queue\\Worker->runJob(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), \'database\', Object(Illuminate\\Queue\\WorkerOptions))\n#19 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Console\\WorkCommand.php(148): Illuminate\\Queue\\Worker->daemon(\'database\', \'default\', Object(Illuminate\\Queue\\WorkerOptions))\n#20 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Console\\WorkCommand.php(131): Illuminate\\Queue\\Console\\WorkCommand->runWorker(\'database\', \'default\')\n#21 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(36): Illuminate\\Queue\\Console\\WorkCommand->handle()\n#22 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Util.php(43): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#23 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(96): Illuminate\\Container\\Util::unwrapIfClosure(Object(Closure))\n#24 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(35): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(Illuminate\\Foundation\\Application), Array, Object(Closure))\n#25 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Container.php(754): Illuminate\\Container\\BoundMethod::call(Object(Illuminate\\Foundation\\Application), Array, Array, NULL)\n#26 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Console\\Command.php(211): Illuminate\\Container\\Container->call(Array)\n#27 C:\\DATN\\vendor\\symfony\\console\\Command\\Command.php(318): Illuminate\\Console\\Command->execute(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#28 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Console\\Command.php(180): Symfony\\Component\\Console\\Command\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#29 C:\\DATN\\vendor\\symfony\\console\\Application.php(1092): Illuminate\\Console\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#30 C:\\DATN\\vendor\\symfony\\console\\Application.php(341): Symfony\\Component\\Console\\Application->doRunCommand(Object(Illuminate\\Queue\\Console\\WorkCommand), Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#31 C:\\DATN\\vendor\\symfony\\console\\Application.php(192): Symfony\\Component\\Console\\Application->doRun(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#32 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Console\\Kernel.php(197): Symfony\\Component\\Console\\Application->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#33 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Application.php(1234): Illuminate\\Foundation\\Console\\Kernel->handle(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#34 C:\\DATN\\artisan(16): Illuminate\\Foundation\\Application->handleCommand(Object(Symfony\\Component\\Console\\Input\\ArgvInput))\n#35 {main}', '2025-06-15 07:24:29'),
(10, '48cf5f85-9986-4e14-b93d-7547793a40c8', 'database', 'default', '{\"uuid\":\"48cf5f85-9986-4e14-b93d-7547793a40c8\",\"displayName\":\"App\\\\Events\\\\OrderStatusUpdated\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":14:{s:5:\\\"event\\\";O:29:\\\"App\\\\Events\\\\OrderStatusUpdated\\\":1:{s:5:\\\"order\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:16:\\\"App\\\\Models\\\\Order\\\";s:2:\\\"id\\\";i:13;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\"},\"createdAt\":1749947134,\"delay\":null}', 'Illuminate\\Broadcasting\\BroadcastException: Pusher error: cURL error 7: Failed to connect to localhost port 8080 after 2259 ms: Couldn\'t connect to server (see https://curl.haxx.se/libcurl/c/libcurl-errors.html) for http://localhost:8080/apps/130010/events?auth_key=hebhaulzxbkh4ugtjs5x&auth_timestamp=1749947136&auth_version=1.0&body_md5=c1da76622780455fdeb6a1eca05d525a&auth_signature=17d0654da54bf65c833b3d1614c01caf200d7f2b7e64ef6631b96602443e9874. in C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Broadcasting\\Broadcasters\\PusherBroadcaster.php:163\nStack trace:\n#0 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Broadcasting\\BroadcastEvent.php(93): Illuminate\\Broadcasting\\Broadcasters\\PusherBroadcaster->broadcast(Object(Illuminate\\Support\\Collection), \'OrderStatusUpda...\', Array)\n#1 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(36): Illuminate\\Broadcasting\\BroadcastEvent->handle(Object(Illuminate\\Broadcasting\\BroadcastManager))\n#2 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Util.php(43): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#3 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(96): Illuminate\\Container\\Util::unwrapIfClosure(Object(Closure))\n#4 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(35): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(Illuminate\\Foundation\\Application), Array, Object(Closure))\n#5 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Container.php(754): Illuminate\\Container\\BoundMethod::call(Object(Illuminate\\Foundation\\Application), Array, Array, NULL)\n#6 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Bus\\Dispatcher.php(132): Illuminate\\Container\\Container->call(Array)\n#7 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(169): Illuminate\\Bus\\Dispatcher->Illuminate\\Bus\\{closure}(Object(Illuminate\\Broadcasting\\BroadcastEvent))\n#8 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(126): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Broadcasting\\BroadcastEvent))\n#9 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Bus\\Dispatcher.php(136): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#10 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(125): Illuminate\\Bus\\Dispatcher->dispatchNow(Object(Illuminate\\Broadcasting\\BroadcastEvent), false)\n#11 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(169): Illuminate\\Queue\\CallQueuedHandler->Illuminate\\Queue\\{closure}(Object(Illuminate\\Broadcasting\\BroadcastEvent))\n#12 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(126): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Broadcasting\\BroadcastEvent))\n#13 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(120): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#14 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(68): Illuminate\\Queue\\CallQueuedHandler->dispatchThroughMiddleware(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Object(Illuminate\\Broadcasting\\BroadcastEvent))\n#15 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Jobs\\Job.php(102): Illuminate\\Queue\\CallQueuedHandler->call(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Array)\n#16 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(441): Illuminate\\Queue\\Jobs\\Job->fire()\n#17 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(391): Illuminate\\Queue\\Worker->process(\'database\', Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Object(Illuminate\\Queue\\WorkerOptions))\n#18 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(177): Illuminate\\Queue\\Worker->runJob(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), \'database\', Object(Illuminate\\Queue\\WorkerOptions))\n#19 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Console\\WorkCommand.php(148): Illuminate\\Queue\\Worker->daemon(\'database\', \'default\', Object(Illuminate\\Queue\\WorkerOptions))\n#20 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Console\\WorkCommand.php(131): Illuminate\\Queue\\Console\\WorkCommand->runWorker(\'database\', \'default\')\n#21 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(36): Illuminate\\Queue\\Console\\WorkCommand->handle()\n#22 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Util.php(43): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#23 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(96): Illuminate\\Container\\Util::unwrapIfClosure(Object(Closure))\n#24 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(35): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(Illuminate\\Foundation\\Application), Array, Object(Closure))\n#25 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Container.php(754): Illuminate\\Container\\BoundMethod::call(Object(Illuminate\\Foundation\\Application), Array, Array, NULL)\n#26 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Console\\Command.php(211): Illuminate\\Container\\Container->call(Array)\n#27 C:\\DATN\\vendor\\symfony\\console\\Command\\Command.php(318): Illuminate\\Console\\Command->execute(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#28 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Console\\Command.php(180): Symfony\\Component\\Console\\Command\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#29 C:\\DATN\\vendor\\symfony\\console\\Application.php(1092): Illuminate\\Console\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#30 C:\\DATN\\vendor\\symfony\\console\\Application.php(341): Symfony\\Component\\Console\\Application->doRunCommand(Object(Illuminate\\Queue\\Console\\WorkCommand), Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#31 C:\\DATN\\vendor\\symfony\\console\\Application.php(192): Symfony\\Component\\Console\\Application->doRun(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#32 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Console\\Kernel.php(197): Symfony\\Component\\Console\\Application->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#33 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Application.php(1234): Illuminate\\Foundation\\Console\\Kernel->handle(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#34 C:\\DATN\\artisan(16): Illuminate\\Foundation\\Application->handleCommand(Object(Symfony\\Component\\Console\\Input\\ArgvInput))\n#35 {main}', '2025-06-15 07:25:39'),
(11, 'f08692a1-8e33-490d-b745-deb453dd31d0', 'database', 'default', '{\"uuid\":\"f08692a1-8e33-490d-b745-deb453dd31d0\",\"displayName\":\"App\\\\Events\\\\OrderStatusUpdated\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":14:{s:5:\\\"event\\\";O:29:\\\"App\\\\Events\\\\OrderStatusUpdated\\\":1:{s:5:\\\"order\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:16:\\\"App\\\\Models\\\\Order\\\";s:2:\\\"id\\\";i:13;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\"},\"createdAt\":1749947275,\"delay\":null}', 'Illuminate\\Broadcasting\\BroadcastException: Pusher error: cURL error 7: Failed to connect to localhost port 8080 after 2253 ms: Couldn\'t connect to server (see https://curl.haxx.se/libcurl/c/libcurl-errors.html) for http://localhost:8080/apps/130010/events?auth_key=hebhaulzxbkh4ugtjs5x&auth_timestamp=1749947277&auth_version=1.0&body_md5=771bd9263a6eb0ff81765a5901f26bf4&auth_signature=0bed3ace386745531a7fe961202fd1c9a30c632e944c7558755d16fa8bc93fc6. in C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Broadcasting\\Broadcasters\\PusherBroadcaster.php:163\nStack trace:\n#0 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Broadcasting\\BroadcastEvent.php(93): Illuminate\\Broadcasting\\Broadcasters\\PusherBroadcaster->broadcast(Object(Illuminate\\Support\\Collection), \'OrderStatusUpda...\', Array)\n#1 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(36): Illuminate\\Broadcasting\\BroadcastEvent->handle(Object(Illuminate\\Broadcasting\\BroadcastManager))\n#2 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Util.php(43): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#3 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(96): Illuminate\\Container\\Util::unwrapIfClosure(Object(Closure))\n#4 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(35): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(Illuminate\\Foundation\\Application), Array, Object(Closure))\n#5 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Container.php(754): Illuminate\\Container\\BoundMethod::call(Object(Illuminate\\Foundation\\Application), Array, Array, NULL)\n#6 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Bus\\Dispatcher.php(132): Illuminate\\Container\\Container->call(Array)\n#7 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(169): Illuminate\\Bus\\Dispatcher->Illuminate\\Bus\\{closure}(Object(Illuminate\\Broadcasting\\BroadcastEvent))\n#8 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(126): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Broadcasting\\BroadcastEvent))\n#9 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Bus\\Dispatcher.php(136): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#10 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(125): Illuminate\\Bus\\Dispatcher->dispatchNow(Object(Illuminate\\Broadcasting\\BroadcastEvent), false)\n#11 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(169): Illuminate\\Queue\\CallQueuedHandler->Illuminate\\Queue\\{closure}(Object(Illuminate\\Broadcasting\\BroadcastEvent))\n#12 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(126): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Broadcasting\\BroadcastEvent))\n#13 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(120): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#14 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(68): Illuminate\\Queue\\CallQueuedHandler->dispatchThroughMiddleware(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Object(Illuminate\\Broadcasting\\BroadcastEvent))\n#15 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Jobs\\Job.php(102): Illuminate\\Queue\\CallQueuedHandler->call(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Array)\n#16 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(441): Illuminate\\Queue\\Jobs\\Job->fire()\n#17 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(391): Illuminate\\Queue\\Worker->process(\'database\', Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Object(Illuminate\\Queue\\WorkerOptions))\n#18 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(177): Illuminate\\Queue\\Worker->runJob(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), \'database\', Object(Illuminate\\Queue\\WorkerOptions))\n#19 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Console\\WorkCommand.php(148): Illuminate\\Queue\\Worker->daemon(\'database\', \'default\', Object(Illuminate\\Queue\\WorkerOptions))\n#20 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Console\\WorkCommand.php(131): Illuminate\\Queue\\Console\\WorkCommand->runWorker(\'database\', \'default\')\n#21 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(36): Illuminate\\Queue\\Console\\WorkCommand->handle()\n#22 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Util.php(43): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#23 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(96): Illuminate\\Container\\Util::unwrapIfClosure(Object(Closure))\n#24 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(35): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(Illuminate\\Foundation\\Application), Array, Object(Closure))\n#25 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Container.php(754): Illuminate\\Container\\BoundMethod::call(Object(Illuminate\\Foundation\\Application), Array, Array, NULL)\n#26 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Console\\Command.php(211): Illuminate\\Container\\Container->call(Array)\n#27 C:\\DATN\\vendor\\symfony\\console\\Command\\Command.php(318): Illuminate\\Console\\Command->execute(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#28 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Console\\Command.php(180): Symfony\\Component\\Console\\Command\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#29 C:\\DATN\\vendor\\symfony\\console\\Application.php(1092): Illuminate\\Console\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#30 C:\\DATN\\vendor\\symfony\\console\\Application.php(341): Symfony\\Component\\Console\\Application->doRunCommand(Object(Illuminate\\Queue\\Console\\WorkCommand), Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#31 C:\\DATN\\vendor\\symfony\\console\\Application.php(192): Symfony\\Component\\Console\\Application->doRun(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#32 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Console\\Kernel.php(197): Symfony\\Component\\Console\\Application->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#33 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Application.php(1234): Illuminate\\Foundation\\Console\\Kernel->handle(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#34 C:\\DATN\\artisan(16): Illuminate\\Foundation\\Application->handleCommand(Object(Symfony\\Component\\Console\\Input\\ArgvInput))\n#35 {main}', '2025-06-15 07:27:59');
INSERT INTO `failed_jobs` (`id`, `uuid`, `connection`, `queue`, `payload`, `exception`, `failed_at`) VALUES
(12, '2a90554b-5c59-434b-ad53-baca7f57948a', 'database', 'default', '{\"uuid\":\"2a90554b-5c59-434b-ad53-baca7f57948a\",\"displayName\":\"App\\\\Events\\\\OrderStatusUpdated\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":14:{s:5:\\\"event\\\";O:29:\\\"App\\\\Events\\\\OrderStatusUpdated\\\":1:{s:5:\\\"order\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:16:\\\"App\\\\Models\\\\Order\\\";s:2:\\\"id\\\";i:13;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\"},\"createdAt\":1749947506,\"delay\":null}', 'Illuminate\\Broadcasting\\BroadcastException: Pusher error: cURL error 7: Failed to connect to localhost port 8080 after 2260 ms: Couldn\'t connect to server (see https://curl.haxx.se/libcurl/c/libcurl-errors.html) for http://localhost:8080/apps/130010/events?auth_key=hebhaulzxbkh4ugtjs5x&auth_timestamp=1749947508&auth_version=1.0&body_md5=3c8136858e93e4b1b25e594e907837f0&auth_signature=653dc5479561468daea6a1bc89c76fcc439c91d78ae1744c95a79bb8ef0b7818. in C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Broadcasting\\Broadcasters\\PusherBroadcaster.php:163\nStack trace:\n#0 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Broadcasting\\BroadcastEvent.php(93): Illuminate\\Broadcasting\\Broadcasters\\PusherBroadcaster->broadcast(Object(Illuminate\\Support\\Collection), \'OrderStatusUpda...\', Array)\n#1 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(36): Illuminate\\Broadcasting\\BroadcastEvent->handle(Object(Illuminate\\Broadcasting\\BroadcastManager))\n#2 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Util.php(43): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#3 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(96): Illuminate\\Container\\Util::unwrapIfClosure(Object(Closure))\n#4 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(35): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(Illuminate\\Foundation\\Application), Array, Object(Closure))\n#5 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Container.php(754): Illuminate\\Container\\BoundMethod::call(Object(Illuminate\\Foundation\\Application), Array, Array, NULL)\n#6 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Bus\\Dispatcher.php(132): Illuminate\\Container\\Container->call(Array)\n#7 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(169): Illuminate\\Bus\\Dispatcher->Illuminate\\Bus\\{closure}(Object(Illuminate\\Broadcasting\\BroadcastEvent))\n#8 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(126): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Broadcasting\\BroadcastEvent))\n#9 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Bus\\Dispatcher.php(136): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#10 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(125): Illuminate\\Bus\\Dispatcher->dispatchNow(Object(Illuminate\\Broadcasting\\BroadcastEvent), false)\n#11 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(169): Illuminate\\Queue\\CallQueuedHandler->Illuminate\\Queue\\{closure}(Object(Illuminate\\Broadcasting\\BroadcastEvent))\n#12 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(126): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Broadcasting\\BroadcastEvent))\n#13 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(120): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#14 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(68): Illuminate\\Queue\\CallQueuedHandler->dispatchThroughMiddleware(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Object(Illuminate\\Broadcasting\\BroadcastEvent))\n#15 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Jobs\\Job.php(102): Illuminate\\Queue\\CallQueuedHandler->call(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Array)\n#16 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(441): Illuminate\\Queue\\Jobs\\Job->fire()\n#17 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(391): Illuminate\\Queue\\Worker->process(\'database\', Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Object(Illuminate\\Queue\\WorkerOptions))\n#18 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(177): Illuminate\\Queue\\Worker->runJob(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), \'database\', Object(Illuminate\\Queue\\WorkerOptions))\n#19 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Console\\WorkCommand.php(148): Illuminate\\Queue\\Worker->daemon(\'database\', \'default\', Object(Illuminate\\Queue\\WorkerOptions))\n#20 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Console\\WorkCommand.php(131): Illuminate\\Queue\\Console\\WorkCommand->runWorker(\'database\', \'default\')\n#21 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(36): Illuminate\\Queue\\Console\\WorkCommand->handle()\n#22 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Util.php(43): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#23 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(96): Illuminate\\Container\\Util::unwrapIfClosure(Object(Closure))\n#24 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(35): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(Illuminate\\Foundation\\Application), Array, Object(Closure))\n#25 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Container.php(754): Illuminate\\Container\\BoundMethod::call(Object(Illuminate\\Foundation\\Application), Array, Array, NULL)\n#26 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Console\\Command.php(211): Illuminate\\Container\\Container->call(Array)\n#27 C:\\DATN\\vendor\\symfony\\console\\Command\\Command.php(318): Illuminate\\Console\\Command->execute(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#28 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Console\\Command.php(180): Symfony\\Component\\Console\\Command\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#29 C:\\DATN\\vendor\\symfony\\console\\Application.php(1092): Illuminate\\Console\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#30 C:\\DATN\\vendor\\symfony\\console\\Application.php(341): Symfony\\Component\\Console\\Application->doRunCommand(Object(Illuminate\\Queue\\Console\\WorkCommand), Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#31 C:\\DATN\\vendor\\symfony\\console\\Application.php(192): Symfony\\Component\\Console\\Application->doRun(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#32 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Console\\Kernel.php(197): Symfony\\Component\\Console\\Application->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#33 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Application.php(1234): Illuminate\\Foundation\\Console\\Kernel->handle(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#34 C:\\DATN\\artisan(16): Illuminate\\Foundation\\Application->handleCommand(Object(Symfony\\Component\\Console\\Input\\ArgvInput))\n#35 {main}', '2025-06-15 07:31:51'),
(13, '248c1f19-fcd2-4ce8-b446-d074e2bcf7a1', 'database', 'default', '{\"uuid\":\"248c1f19-fcd2-4ce8-b446-d074e2bcf7a1\",\"displayName\":\"App\\\\Events\\\\OrderStatusUpdated\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":14:{s:5:\\\"event\\\";O:29:\\\"App\\\\Events\\\\OrderStatusUpdated\\\":1:{s:5:\\\"order\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:16:\\\"App\\\\Models\\\\Order\\\";s:2:\\\"id\\\";i:13;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\"},\"createdAt\":1749947568,\"delay\":null}', 'Illuminate\\Broadcasting\\BroadcastException: Pusher error: cURL error 7: Failed to connect to localhost port 8080 after 2258 ms: Couldn\'t connect to server (see https://curl.haxx.se/libcurl/c/libcurl-errors.html) for http://localhost:8080/apps/130010/events?auth_key=hebhaulzxbkh4ugtjs5x&auth_timestamp=1749947569&auth_version=1.0&body_md5=c1da76622780455fdeb6a1eca05d525a&auth_signature=24fcc739b9f570d22d57705afe7d47f293bf1ba06333fa6b478bba70bfde17f7. in C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Broadcasting\\Broadcasters\\PusherBroadcaster.php:163\nStack trace:\n#0 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Broadcasting\\BroadcastEvent.php(93): Illuminate\\Broadcasting\\Broadcasters\\PusherBroadcaster->broadcast(Object(Illuminate\\Support\\Collection), \'OrderStatusUpda...\', Array)\n#1 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(36): Illuminate\\Broadcasting\\BroadcastEvent->handle(Object(Illuminate\\Broadcasting\\BroadcastManager))\n#2 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Util.php(43): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#3 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(96): Illuminate\\Container\\Util::unwrapIfClosure(Object(Closure))\n#4 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(35): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(Illuminate\\Foundation\\Application), Array, Object(Closure))\n#5 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Container.php(754): Illuminate\\Container\\BoundMethod::call(Object(Illuminate\\Foundation\\Application), Array, Array, NULL)\n#6 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Bus\\Dispatcher.php(132): Illuminate\\Container\\Container->call(Array)\n#7 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(169): Illuminate\\Bus\\Dispatcher->Illuminate\\Bus\\{closure}(Object(Illuminate\\Broadcasting\\BroadcastEvent))\n#8 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(126): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Broadcasting\\BroadcastEvent))\n#9 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Bus\\Dispatcher.php(136): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#10 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(125): Illuminate\\Bus\\Dispatcher->dispatchNow(Object(Illuminate\\Broadcasting\\BroadcastEvent), false)\n#11 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(169): Illuminate\\Queue\\CallQueuedHandler->Illuminate\\Queue\\{closure}(Object(Illuminate\\Broadcasting\\BroadcastEvent))\n#12 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(126): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Broadcasting\\BroadcastEvent))\n#13 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(120): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#14 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(68): Illuminate\\Queue\\CallQueuedHandler->dispatchThroughMiddleware(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Object(Illuminate\\Broadcasting\\BroadcastEvent))\n#15 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Jobs\\Job.php(102): Illuminate\\Queue\\CallQueuedHandler->call(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Array)\n#16 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(441): Illuminate\\Queue\\Jobs\\Job->fire()\n#17 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(391): Illuminate\\Queue\\Worker->process(\'database\', Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Object(Illuminate\\Queue\\WorkerOptions))\n#18 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(177): Illuminate\\Queue\\Worker->runJob(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), \'database\', Object(Illuminate\\Queue\\WorkerOptions))\n#19 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Console\\WorkCommand.php(148): Illuminate\\Queue\\Worker->daemon(\'database\', \'default\', Object(Illuminate\\Queue\\WorkerOptions))\n#20 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Console\\WorkCommand.php(131): Illuminate\\Queue\\Console\\WorkCommand->runWorker(\'database\', \'default\')\n#21 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(36): Illuminate\\Queue\\Console\\WorkCommand->handle()\n#22 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Util.php(43): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#23 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(96): Illuminate\\Container\\Util::unwrapIfClosure(Object(Closure))\n#24 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(35): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(Illuminate\\Foundation\\Application), Array, Object(Closure))\n#25 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Container.php(754): Illuminate\\Container\\BoundMethod::call(Object(Illuminate\\Foundation\\Application), Array, Array, NULL)\n#26 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Console\\Command.php(211): Illuminate\\Container\\Container->call(Array)\n#27 C:\\DATN\\vendor\\symfony\\console\\Command\\Command.php(318): Illuminate\\Console\\Command->execute(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#28 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Console\\Command.php(180): Symfony\\Component\\Console\\Command\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#29 C:\\DATN\\vendor\\symfony\\console\\Application.php(1092): Illuminate\\Console\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#30 C:\\DATN\\vendor\\symfony\\console\\Application.php(341): Symfony\\Component\\Console\\Application->doRunCommand(Object(Illuminate\\Queue\\Console\\WorkCommand), Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#31 C:\\DATN\\vendor\\symfony\\console\\Application.php(192): Symfony\\Component\\Console\\Application->doRun(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#32 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Console\\Kernel.php(197): Symfony\\Component\\Console\\Application->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#33 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Application.php(1234): Illuminate\\Foundation\\Console\\Kernel->handle(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#34 C:\\DATN\\artisan(16): Illuminate\\Foundation\\Application->handleCommand(Object(Symfony\\Component\\Console\\Input\\ArgvInput))\n#35 {main}', '2025-06-15 07:32:52'),
(14, 'b88e287b-f80f-41c7-b3a9-0771d83d405b', 'database', 'default', '{\"uuid\":\"b88e287b-f80f-41c7-b3a9-0771d83d405b\",\"displayName\":\"App\\\\Events\\\\OrderStatusUpdated\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":14:{s:5:\\\"event\\\";O:29:\\\"App\\\\Events\\\\OrderStatusUpdated\\\":1:{s:5:\\\"order\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:16:\\\"App\\\\Models\\\\Order\\\";s:2:\\\"id\\\";i:87;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\"},\"createdAt\":1750175418,\"delay\":null}', 'Illuminate\\Broadcasting\\BroadcastException: Pusher error: cURL error 7: Failed to connect to localhost port 8080 after 2219 ms: Couldn\'t connect to server (see https://curl.haxx.se/libcurl/c/libcurl-errors.html) for http://localhost:8080/apps/130010/events?auth_key=hebhaulzxbkh4ugtjs5x&auth_timestamp=1750570956&auth_version=1.0&body_md5=86800e735f66842c83d242f33145d73e&auth_signature=edb01ec9ae2840c86491dae3d1808212709f9425ca9a870f1461788e39dec10c. in D:\\laragon\\www\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Broadcasting\\Broadcasters\\PusherBroadcaster.php:163\nStack trace:\n#0 D:\\laragon\\www\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Broadcasting\\BroadcastEvent.php(93): Illuminate\\Broadcasting\\Broadcasters\\PusherBroadcaster->broadcast(Object(Illuminate\\Support\\Collection), \'OrderStatusUpda...\', Array)\n#1 D:\\laragon\\www\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(36): Illuminate\\Broadcasting\\BroadcastEvent->handle(Object(Illuminate\\Broadcasting\\BroadcastManager))\n#2 D:\\laragon\\www\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Util.php(43): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#3 D:\\laragon\\www\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(96): Illuminate\\Container\\Util::unwrapIfClosure(Object(Closure))\n#4 D:\\laragon\\www\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(35): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(Illuminate\\Foundation\\Application), Array, Object(Closure))\n#5 D:\\laragon\\www\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Container.php(754): Illuminate\\Container\\BoundMethod::call(Object(Illuminate\\Foundation\\Application), Array, Array, NULL)\n#6 D:\\laragon\\www\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Bus\\Dispatcher.php(132): Illuminate\\Container\\Container->call(Array)\n#7 D:\\laragon\\www\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(169): Illuminate\\Bus\\Dispatcher->Illuminate\\Bus\\{closure}(Object(Illuminate\\Broadcasting\\BroadcastEvent))\n#8 D:\\laragon\\www\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(126): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Broadcasting\\BroadcastEvent))\n#9 D:\\laragon\\www\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Bus\\Dispatcher.php(136): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#10 D:\\laragon\\www\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(125): Illuminate\\Bus\\Dispatcher->dispatchNow(Object(Illuminate\\Broadcasting\\BroadcastEvent), false)\n#11 D:\\laragon\\www\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(169): Illuminate\\Queue\\CallQueuedHandler->Illuminate\\Queue\\{closure}(Object(Illuminate\\Broadcasting\\BroadcastEvent))\n#12 D:\\laragon\\www\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(126): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Broadcasting\\BroadcastEvent))\n#13 D:\\laragon\\www\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(120): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#14 D:\\laragon\\www\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(68): Illuminate\\Queue\\CallQueuedHandler->dispatchThroughMiddleware(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Object(Illuminate\\Broadcasting\\BroadcastEvent))\n#15 D:\\laragon\\www\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Jobs\\Job.php(102): Illuminate\\Queue\\CallQueuedHandler->call(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Array)\n#16 D:\\laragon\\www\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(441): Illuminate\\Queue\\Jobs\\Job->fire()\n#17 D:\\laragon\\www\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(391): Illuminate\\Queue\\Worker->process(\'database\', Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Object(Illuminate\\Queue\\WorkerOptions))\n#18 D:\\laragon\\www\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(177): Illuminate\\Queue\\Worker->runJob(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), \'database\', Object(Illuminate\\Queue\\WorkerOptions))\n#19 D:\\laragon\\www\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Console\\WorkCommand.php(148): Illuminate\\Queue\\Worker->daemon(\'database\', \'default\', Object(Illuminate\\Queue\\WorkerOptions))\n#20 D:\\laragon\\www\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Console\\WorkCommand.php(131): Illuminate\\Queue\\Console\\WorkCommand->runWorker(\'database\', \'default\')\n#21 D:\\laragon\\www\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(36): Illuminate\\Queue\\Console\\WorkCommand->handle()\n#22 D:\\laragon\\www\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Util.php(43): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#23 D:\\laragon\\www\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(96): Illuminate\\Container\\Util::unwrapIfClosure(Object(Closure))\n#24 D:\\laragon\\www\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(35): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(Illuminate\\Foundation\\Application), Array, Object(Closure))\n#25 D:\\laragon\\www\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Container.php(754): Illuminate\\Container\\BoundMethod::call(Object(Illuminate\\Foundation\\Application), Array, Array, NULL)\n#26 D:\\laragon\\www\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Console\\Command.php(211): Illuminate\\Container\\Container->call(Array)\n#27 D:\\laragon\\www\\DATN\\vendor\\symfony\\console\\Command\\Command.php(318): Illuminate\\Console\\Command->execute(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#28 D:\\laragon\\www\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Console\\Command.php(180): Symfony\\Component\\Console\\Command\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#29 D:\\laragon\\www\\DATN\\vendor\\symfony\\console\\Application.php(1092): Illuminate\\Console\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#30 D:\\laragon\\www\\DATN\\vendor\\symfony\\console\\Application.php(341): Symfony\\Component\\Console\\Application->doRunCommand(Object(Illuminate\\Queue\\Console\\WorkCommand), Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#31 D:\\laragon\\www\\DATN\\vendor\\symfony\\console\\Application.php(192): Symfony\\Component\\Console\\Application->doRun(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#32 D:\\laragon\\www\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Console\\Kernel.php(197): Symfony\\Component\\Console\\Application->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#33 D:\\laragon\\www\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Application.php(1234): Illuminate\\Foundation\\Console\\Kernel->handle(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#34 D:\\laragon\\www\\DATN\\artisan(16): Illuminate\\Foundation\\Application->handleCommand(Object(Symfony\\Component\\Console\\Input\\ArgvInput))\n#35 {main}', '2025-06-22 12:42:39'),
(15, 'd173fd9c-6d6c-40d1-a002-4a34c4b0c0f0', 'database', 'default', '{\"uuid\":\"d173fd9c-6d6c-40d1-a002-4a34c4b0c0f0\",\"displayName\":\"App\\\\Events\\\\OrderStatusUpdated\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":14:{s:5:\\\"event\\\";O:29:\\\"App\\\\Events\\\\OrderStatusUpdated\\\":1:{s:5:\\\"order\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:16:\\\"App\\\\Models\\\\Order\\\";s:2:\\\"id\\\";i:87;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\"},\"createdAt\":1750175423,\"delay\":null}', 'Illuminate\\Broadcasting\\BroadcastException: Pusher error: cURL error 7: Failed to connect to localhost port 8080 after 2261 ms: Couldn\'t connect to server (see https://curl.haxx.se/libcurl/c/libcurl-errors.html) for http://localhost:8080/apps/130010/events?auth_key=hebhaulzxbkh4ugtjs5x&auth_timestamp=1750570960&auth_version=1.0&body_md5=86800e735f66842c83d242f33145d73e&auth_signature=9ab70e2e1909ef9fe0135d316dffa48ea8c886b3947db67fcedc35c4f29151a2. in D:\\laragon\\www\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Broadcasting\\Broadcasters\\PusherBroadcaster.php:163\nStack trace:\n#0 D:\\laragon\\www\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Broadcasting\\BroadcastEvent.php(93): Illuminate\\Broadcasting\\Broadcasters\\PusherBroadcaster->broadcast(Object(Illuminate\\Support\\Collection), \'OrderStatusUpda...\', Array)\n#1 D:\\laragon\\www\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(36): Illuminate\\Broadcasting\\BroadcastEvent->handle(Object(Illuminate\\Broadcasting\\BroadcastManager))\n#2 D:\\laragon\\www\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Util.php(43): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#3 D:\\laragon\\www\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(96): Illuminate\\Container\\Util::unwrapIfClosure(Object(Closure))\n#4 D:\\laragon\\www\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(35): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(Illuminate\\Foundation\\Application), Array, Object(Closure))\n#5 D:\\laragon\\www\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Container.php(754): Illuminate\\Container\\BoundMethod::call(Object(Illuminate\\Foundation\\Application), Array, Array, NULL)\n#6 D:\\laragon\\www\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Bus\\Dispatcher.php(132): Illuminate\\Container\\Container->call(Array)\n#7 D:\\laragon\\www\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(169): Illuminate\\Bus\\Dispatcher->Illuminate\\Bus\\{closure}(Object(Illuminate\\Broadcasting\\BroadcastEvent))\n#8 D:\\laragon\\www\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(126): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Broadcasting\\BroadcastEvent))\n#9 D:\\laragon\\www\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Bus\\Dispatcher.php(136): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#10 D:\\laragon\\www\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(125): Illuminate\\Bus\\Dispatcher->dispatchNow(Object(Illuminate\\Broadcasting\\BroadcastEvent), false)\n#11 D:\\laragon\\www\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(169): Illuminate\\Queue\\CallQueuedHandler->Illuminate\\Queue\\{closure}(Object(Illuminate\\Broadcasting\\BroadcastEvent))\n#12 D:\\laragon\\www\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(126): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Broadcasting\\BroadcastEvent))\n#13 D:\\laragon\\www\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(120): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#14 D:\\laragon\\www\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(68): Illuminate\\Queue\\CallQueuedHandler->dispatchThroughMiddleware(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Object(Illuminate\\Broadcasting\\BroadcastEvent))\n#15 D:\\laragon\\www\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Jobs\\Job.php(102): Illuminate\\Queue\\CallQueuedHandler->call(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Array)\n#16 D:\\laragon\\www\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(441): Illuminate\\Queue\\Jobs\\Job->fire()\n#17 D:\\laragon\\www\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(391): Illuminate\\Queue\\Worker->process(\'database\', Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Object(Illuminate\\Queue\\WorkerOptions))\n#18 D:\\laragon\\www\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(177): Illuminate\\Queue\\Worker->runJob(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), \'database\', Object(Illuminate\\Queue\\WorkerOptions))\n#19 D:\\laragon\\www\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Console\\WorkCommand.php(148): Illuminate\\Queue\\Worker->daemon(\'database\', \'default\', Object(Illuminate\\Queue\\WorkerOptions))\n#20 D:\\laragon\\www\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Console\\WorkCommand.php(131): Illuminate\\Queue\\Console\\WorkCommand->runWorker(\'database\', \'default\')\n#21 D:\\laragon\\www\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(36): Illuminate\\Queue\\Console\\WorkCommand->handle()\n#22 D:\\laragon\\www\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Util.php(43): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#23 D:\\laragon\\www\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(96): Illuminate\\Container\\Util::unwrapIfClosure(Object(Closure))\n#24 D:\\laragon\\www\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(35): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(Illuminate\\Foundation\\Application), Array, Object(Closure))\n#25 D:\\laragon\\www\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Container.php(754): Illuminate\\Container\\BoundMethod::call(Object(Illuminate\\Foundation\\Application), Array, Array, NULL)\n#26 D:\\laragon\\www\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Console\\Command.php(211): Illuminate\\Container\\Container->call(Array)\n#27 D:\\laragon\\www\\DATN\\vendor\\symfony\\console\\Command\\Command.php(318): Illuminate\\Console\\Command->execute(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#28 D:\\laragon\\www\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Console\\Command.php(180): Symfony\\Component\\Console\\Command\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#29 D:\\laragon\\www\\DATN\\vendor\\symfony\\console\\Application.php(1092): Illuminate\\Console\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#30 D:\\laragon\\www\\DATN\\vendor\\symfony\\console\\Application.php(341): Symfony\\Component\\Console\\Application->doRunCommand(Object(Illuminate\\Queue\\Console\\WorkCommand), Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#31 D:\\laragon\\www\\DATN\\vendor\\symfony\\console\\Application.php(192): Symfony\\Component\\Console\\Application->doRun(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#32 D:\\laragon\\www\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Console\\Kernel.php(197): Symfony\\Component\\Console\\Application->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#33 D:\\laragon\\www\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Application.php(1234): Illuminate\\Foundation\\Console\\Kernel->handle(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#34 D:\\laragon\\www\\DATN\\artisan(16): Illuminate\\Foundation\\Application->handleCommand(Object(Symfony\\Component\\Console\\Input\\ArgvInput))\n#35 {main}', '2025-06-22 12:42:42');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `faqs`
--

CREATE TABLE `faqs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `question` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `answer` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `keywords` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('active','inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `flash_sales`
--

CREATE TABLE `flash_sales` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `start_time` datetime NOT NULL,
  `end_time` datetime NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `flash_sales`
--

INSERT INTO `flash_sales` (`id`, `name`, `start_time`, `end_time`, `status`, `created_at`, `updated_at`) VALUES
(5, 'Flash Sale Summer', '2025-06-06 09:09:00', '2025-06-12 09:09:00', 1, '2025-06-08 09:09:56', '2025-06-08 10:29:23');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `flash_sale_items`
--

CREATE TABLE `flash_sale_items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `flash_sale_id` bigint(20) UNSIGNED NOT NULL,
  `product_variant_id` bigint(20) UNSIGNED NOT NULL,
  `count` int(11) NOT NULL DEFAULT '0',
  `discount` decimal(15,0) NOT NULL,
  `discount_type` enum('percent','fixed') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'percent',
  `buy_limit` int(11) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `invoices`
--

CREATE TABLE `invoices` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `invoice_code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total` decimal(15,0) NOT NULL,
  `issued_by` bigint(20) UNSIGNED DEFAULT NULL,
  `issued_at` timestamp NULL DEFAULT NULL,
  `file_path` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `invoices`
--

INSERT INTO `invoices` (`id`, `order_id`, `invoice_code`, `total`, `issued_by`, `issued_at`, `file_path`, `created_at`, `updated_at`) VALUES
(53, 70, 'INV000070', 12999999, NULL, '2025-06-15 23:49:44', NULL, '2025-06-15 23:49:44', '2025-06-15 23:49:44'),
(56, 73, 'INV000073', 34333, NULL, '2025-06-15 23:57:28', NULL, '2025-06-15 23:57:28', '2025-06-15 23:57:28'),
(57, 74, 'INV000074', 34333, NULL, '2025-06-15 23:58:24', NULL, '2025-06-15 23:58:24', '2025-06-15 23:58:24'),
(58, 75, 'INV000075', 34333, NULL, '2025-06-16 00:02:19', NULL, '2025-06-16 00:02:19', '2025-06-16 00:02:19'),
(59, 76, 'INV000076', 12999999, NULL, '2025-06-16 00:09:41', NULL, '2025-06-16 00:09:41', '2025-06-16 00:09:41'),
(60, 77, 'INV000077', 12999999, NULL, '2025-06-16 00:13:26', NULL, '2025-06-16 00:13:26', '2025-06-16 00:13:26'),
(61, 81, 'INV000081', 34333, NULL, '2025-06-16 00:31:38', NULL, '2025-06-16 00:31:38', '2025-06-16 00:31:38'),
(62, 82, 'INV000082', 34333, NULL, '2025-06-16 00:32:27', NULL, '2025-06-16 00:32:27', '2025-06-16 00:32:27'),
(63, 84, 'INV000084', 34333, NULL, '2025-06-16 00:34:42', NULL, '2025-06-16 00:34:42', '2025-06-16 00:34:42'),
(64, 85, 'INV000085', 12999999, NULL, '2025-06-16 00:35:28', NULL, '2025-06-16 00:35:28', '2025-06-16 00:35:28'),
(65, 88, 'INV000088', 34333, NULL, '2025-06-16 01:00:09', NULL, '2025-06-16 01:00:09', '2025-06-16 01:00:09'),
(70, 93, 'INV000093', 12345, NULL, '2025-06-16 15:27:36', NULL, '2025-06-16 15:27:36', '2025-06-16 15:27:36'),
(71, 94, 'INV000094', 2345678, NULL, '2025-06-16 22:58:34', NULL, '2025-06-16 22:58:34', '2025-06-16 22:58:34'),
(72, 95, 'INV000095', 555, NULL, '2025-06-17 22:45:55', NULL, '2025-06-17 22:45:55', '2025-06-17 22:45:55'),
(73, 96, 'INV000096', 55125, NULL, '2025-06-18 15:25:23', NULL, '2025-06-18 15:25:23', '2025-06-18 15:25:23'),
(74, 97, 'INV000097', 222, NULL, '2025-06-19 14:18:33', NULL, '2025-06-19 14:18:33', '2025-06-19 14:18:33'),
(75, 98, 'INV000098', 111, NULL, '2025-06-19 22:38:28', NULL, '2025-06-19 22:38:28', '2025-06-19 22:38:28'),
(76, 99, 'INV000099', 333, NULL, '2025-06-23 10:07:30', NULL, '2025-06-23 10:07:30', '2025-06-23 10:07:30'),
(77, 100, 'INV000100', 222, NULL, '2025-06-24 09:11:50', NULL, '2025-06-24 09:11:50', '2025-06-24 09:11:50'),
(78, 101, 'INV000101', 222, NULL, '2025-06-30 20:13:02', NULL, '2025-06-30 20:13:02', '2025-06-30 20:13:02'),
(79, 102, 'INV000102', 222, NULL, '2025-06-30 20:16:22', NULL, '2025-06-30 20:16:22', '2025-06-30 20:16:22'),
(80, 103, 'INV000103', 1278790, NULL, '2025-06-30 21:04:01', NULL, '2025-06-30 21:04:01', '2025-06-30 21:04:01'),
(81, 104, 'INV000104', 7890, NULL, '2025-07-01 15:56:30', NULL, '2025-07-01 15:56:30', '2025-07-01 15:56:30');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `jobs`
--

INSERT INTO `jobs` (`id`, `queue`, `payload`, `attempts`, `reserved_at`, `available_at`, `created_at`) VALUES
(291, 'default', '{\"uuid\":\"1da3bf1d-17df-4bbc-97b0-f7eb038a2f8b\",\"displayName\":\"App\\\\Events\\\\OrderStatusUpdated\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":14:{s:5:\\\"event\\\";O:29:\\\"App\\\\Events\\\\OrderStatusUpdated\\\":1:{s:5:\\\"order\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:16:\\\"App\\\\Models\\\\Order\\\";s:2:\\\"id\\\";i:100;s:9:\\\"relations\\\";a:3:{i:0;s:5:\\\"items\\\";i:1;s:13:\\\"items.product\\\";i:2;s:13:\\\"items.variant\\\";}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\"},\"createdAt\":1750731300,\"delay\":null}', 0, NULL, 1750731300, 1750731300),
(292, 'default', '{\"uuid\":\"0482dad1-7c72-4619-8a0a-588ec002a861\",\"displayName\":\"App\\\\Events\\\\OrderStatusUpdated\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":14:{s:5:\\\"event\\\";O:29:\\\"App\\\\Events\\\\OrderStatusUpdated\\\":1:{s:5:\\\"order\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:16:\\\"App\\\\Models\\\\Order\\\";s:2:\\\"id\\\";i:99;s:9:\\\"relations\\\";a:3:{i:0;s:5:\\\"items\\\";i:1;s:13:\\\"items.product\\\";i:2;s:13:\\\"items.variant\\\";}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\"},\"createdAt\":1750731612,\"delay\":null}', 0, NULL, 1750731612, 1750731612),
(293, 'default', '{\"uuid\":\"cef263b1-bf0e-4028-a8d6-8e49f1080535\",\"displayName\":\"App\\\\Events\\\\OrderStatusUpdated\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":14:{s:5:\\\"event\\\";O:29:\\\"App\\\\Events\\\\OrderStatusUpdated\\\":1:{s:5:\\\"order\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:16:\\\"App\\\\Models\\\\Order\\\";s:2:\\\"id\\\";i:98;s:9:\\\"relations\\\";a:3:{i:0;s:5:\\\"items\\\";i:1;s:13:\\\"items.product\\\";i:2;s:13:\\\"items.variant\\\";}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\"},\"createdAt\":1750731948,\"delay\":null}', 0, NULL, 1750731948, 1750731948),
(294, 'default', '{\"uuid\":\"eef436a2-3875-4f5b-8f27-bf54508562d3\",\"displayName\":\"App\\\\Events\\\\OrderStatusUpdated\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":14:{s:5:\\\"event\\\";O:29:\\\"App\\\\Events\\\\OrderStatusUpdated\\\":1:{s:5:\\\"order\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:16:\\\"App\\\\Models\\\\Order\\\";s:2:\\\"id\\\";i:97;s:9:\\\"relations\\\";a:3:{i:0;s:5:\\\"items\\\";i:1;s:13:\\\"items.product\\\";i:2;s:13:\\\"items.variant\\\";}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\"},\"createdAt\":1750732093,\"delay\":null}', 0, NULL, 1750732093, 1750732093),
(295, 'default', '{\"uuid\":\"37e28787-b0de-432e-b081-36af10e3dce4\",\"displayName\":\"App\\\\Events\\\\OrderStatusUpdated\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":14:{s:5:\\\"event\\\";O:29:\\\"App\\\\Events\\\\OrderStatusUpdated\\\":1:{s:5:\\\"order\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:16:\\\"App\\\\Models\\\\Order\\\";s:2:\\\"id\\\";i:94;s:9:\\\"relations\\\";a:1:{i:0;s:5:\\\"items\\\";}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\"},\"createdAt\":1750732890,\"delay\":null}', 0, NULL, 1750732890, 1750732890),
(296, 'default', '{\"uuid\":\"2f35ce3c-6395-4be3-abbe-c27596b2fff1\",\"displayName\":\"App\\\\Events\\\\OrderStatusUpdated\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":14:{s:5:\\\"event\\\";O:29:\\\"App\\\\Events\\\\OrderStatusUpdated\\\":1:{s:5:\\\"order\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:16:\\\"App\\\\Models\\\\Order\\\";s:2:\\\"id\\\";i:93;s:9:\\\"relations\\\";a:1:{i:0;s:5:\\\"items\\\";}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\"},\"createdAt\":1750733206,\"delay\":null}', 0, NULL, 1750733206, 1750733206),
(297, 'default', '{\"uuid\":\"2d102cb0-0f88-4d51-a7cc-10146b7b94ba\",\"displayName\":\"App\\\\Events\\\\OrderStatusUpdated\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":14:{s:5:\\\"event\\\";O:29:\\\"App\\\\Events\\\\OrderStatusUpdated\\\":1:{s:5:\\\"order\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:16:\\\"App\\\\Models\\\\Order\\\";s:2:\\\"id\\\";i:88;s:9:\\\"relations\\\";a:1:{i:0;s:5:\\\"items\\\";}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\"},\"createdAt\":1750733760,\"delay\":null}', 0, NULL, 1750733760, 1750733760),
(298, 'default', '{\"uuid\":\"7d217cef-f23d-44f5-8f55-c5aada584ca8\",\"displayName\":\"App\\\\Events\\\\OrderStatusUpdated\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":14:{s:5:\\\"event\\\";O:29:\\\"App\\\\Events\\\\OrderStatusUpdated\\\":1:{s:5:\\\"order\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:16:\\\"App\\\\Models\\\\Order\\\";s:2:\\\"id\\\";i:102;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\"},\"createdAt\":1751289637,\"delay\":null}', 0, NULL, 1751289637, 1751289637),
(299, 'default', '{\"uuid\":\"7ce0010f-804b-4a7a-bd23-00758cf95934\",\"displayName\":\"App\\\\Events\\\\OrderStatusUpdated\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":14:{s:5:\\\"event\\\";O:29:\\\"App\\\\Events\\\\OrderStatusUpdated\\\":1:{s:5:\\\"order\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:16:\\\"App\\\\Models\\\\Order\\\";s:2:\\\"id\\\";i:102;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\"},\"createdAt\":1751289716,\"delay\":null}', 0, NULL, 1751289716, 1751289716),
(300, 'default', '{\"uuid\":\"c51a2c98-e7ef-4418-98b0-988ed6f25c52\",\"displayName\":\"App\\\\Events\\\\OrderStatusUpdated\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":14:{s:5:\\\"event\\\";O:29:\\\"App\\\\Events\\\\OrderStatusUpdated\\\":1:{s:5:\\\"order\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:16:\\\"App\\\\Models\\\\Order\\\";s:2:\\\"id\\\";i:102;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\"},\"createdAt\":1751289799,\"delay\":null}', 0, NULL, 1751289799, 1751289799),
(301, 'default', '{\"uuid\":\"fb84b6d6-6cf4-4bdd-b06e-f807426b22fe\",\"displayName\":\"App\\\\Events\\\\OrderStatusUpdated\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":14:{s:5:\\\"event\\\";O:29:\\\"App\\\\Events\\\\OrderStatusUpdated\\\":1:{s:5:\\\"order\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:16:\\\"App\\\\Models\\\\Order\\\";s:2:\\\"id\\\";i:101;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\"},\"createdAt\":1751289816,\"delay\":null}', 0, NULL, 1751289816, 1751289816),
(302, 'default', '{\"uuid\":\"9225c4eb-1616-424e-a63d-bfb4bf3713e1\",\"displayName\":\"App\\\\Events\\\\OrderStatusUpdated\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":14:{s:5:\\\"event\\\";O:29:\\\"App\\\\Events\\\\OrderStatusUpdated\\\":1:{s:5:\\\"order\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:16:\\\"App\\\\Models\\\\Order\\\";s:2:\\\"id\\\";i:102;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\"},\"createdAt\":1751291636,\"delay\":null}', 0, NULL, 1751291636, 1751291636),
(303, 'default', '{\"uuid\":\"d10aaf62-7be6-4c49-acaf-ddc27e502f45\",\"displayName\":\"App\\\\Events\\\\OrderStatusUpdated\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":14:{s:5:\\\"event\\\";O:29:\\\"App\\\\Events\\\\OrderStatusUpdated\\\":1:{s:5:\\\"order\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:16:\\\"App\\\\Models\\\\Order\\\";s:2:\\\"id\\\";i:101;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\"},\"createdAt\":1751291643,\"delay\":null}', 0, NULL, 1751291643, 1751291643),
(304, 'default', '{\"uuid\":\"7307ee04-bd03-44dc-8161-1fb0be0e2dcf\",\"displayName\":\"App\\\\Events\\\\OrderStatusUpdated\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":14:{s:5:\\\"event\\\";O:29:\\\"App\\\\Events\\\\OrderStatusUpdated\\\":1:{s:5:\\\"order\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:16:\\\"App\\\\Models\\\\Order\\\";s:2:\\\"id\\\";i:101;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\"},\"createdAt\":1751291762,\"delay\":null}', 0, NULL, 1751291762, 1751291762),
(305, 'default', '{\"uuid\":\"ac66f4dc-1fe0-4954-9c76-7bae15970126\",\"displayName\":\"App\\\\Events\\\\OrderStatusUpdated\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":14:{s:5:\\\"event\\\";O:29:\\\"App\\\\Events\\\\OrderStatusUpdated\\\":1:{s:5:\\\"order\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:16:\\\"App\\\\Models\\\\Order\\\";s:2:\\\"id\\\";i:101;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\"},\"createdAt\":1751291840,\"delay\":null}', 0, NULL, 1751291840, 1751291840),
(306, 'default', '{\"uuid\":\"5b83de70-06be-4253-966e-422a4c317881\",\"displayName\":\"App\\\\Events\\\\OrderStatusUpdated\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":14:{s:5:\\\"event\\\";O:29:\\\"App\\\\Events\\\\OrderStatusUpdated\\\":1:{s:5:\\\"order\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:16:\\\"App\\\\Models\\\\Order\\\";s:2:\\\"id\\\";i:103;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\"},\"createdAt\":1751292382,\"delay\":null}', 0, NULL, 1751292382, 1751292382),
(307, 'default', '{\"uuid\":\"873dcaae-3d2c-41a4-a519-8895efd40bb9\",\"displayName\":\"App\\\\Events\\\\OrderStatusUpdated\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":14:{s:5:\\\"event\\\";O:29:\\\"App\\\\Events\\\\OrderStatusUpdated\\\":1:{s:5:\\\"order\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:16:\\\"App\\\\Models\\\\Order\\\";s:2:\\\"id\\\";i:103;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\"},\"createdAt\":1751292429,\"delay\":null}', 0, NULL, 1751292429, 1751292429),
(308, 'default', '{\"uuid\":\"39b5741a-3a8c-4bee-8d65-43c3d80bddc1\",\"displayName\":\"App\\\\Events\\\\OrderStatusUpdated\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":14:{s:5:\\\"event\\\";O:29:\\\"App\\\\Events\\\\OrderStatusUpdated\\\":1:{s:5:\\\"order\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:16:\\\"App\\\\Models\\\\Order\\\";s:2:\\\"id\\\";i:103;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\"},\"createdAt\":1751292485,\"delay\":null}', 0, NULL, 1751292485, 1751292485),
(309, 'default', '{\"uuid\":\"5d369f5c-b0ad-4402-a344-09d17c69fae4\",\"displayName\":\"App\\\\Events\\\\OrderStatusUpdated\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":14:{s:5:\\\"event\\\";O:29:\\\"App\\\\Events\\\\OrderStatusUpdated\\\":1:{s:5:\\\"order\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:16:\\\"App\\\\Models\\\\Order\\\";s:2:\\\"id\\\";i:103;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\"},\"createdAt\":1751292532,\"delay\":null}', 0, NULL, 1751292532, 1751292532);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_jobs` int(11) NOT NULL,
  `pending_jobs` int(11) NOT NULL,
  `failed_jobs` int(11) NOT NULL,
  `failed_job_ids` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `options` mediumtext COLLATE utf8mb4_unicode_ci,
  `cancelled_at` int(11) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `finished_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `messages`
--

CREATE TABLE `messages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `from_user_id` bigint(20) UNSIGNED NOT NULL,
  `to_user_id` bigint(20) UNSIGNED NOT NULL,
  `message` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '0001_01_01_000001_create_cache_table', 1),
(2, '0001_01_01_000002_create_jobs_table', 1),
(3, '2024_03_19_000000_create_sessions_table', 1),
(4, '2025_05_07_041051_create_roles_table', 1),
(5, '2025_05_07_041052_create_permissions_table', 1),
(6, '2025_05_07_041052_create_role_permissions_table', 1),
(7, '2025_05_07_041052_create_users_table', 1),
(8, '2025_05_07_041053_create_categories_table', 1),
(9, '2025_05_07_041053_create_products_table', 1),
(10, '2025_05_07_041054_create_product_images_table', 1),
(11, '2025_05_07_041054_create_product_reviews_table', 1),
(12, '2025_05_07_041054_create_product_variants_table', 1),
(13, '2025_05_07_041054_create_shipping_methods_table', 1),
(14, '2025_05_07_041055_create_carts_table', 1),
(15, '2025_05_07_041055_create_orders_table', 1),
(16, '2025_05_07_041056_create_cart_items_table', 1),
(17, '2025_05_07_041056_create_order_items_table', 1),
(18, '2025_05_07_041056_create_user_addresses_table', 1),
(19, '2025_05_07_041056_create_wishlists_table', 1),
(20, '2025_05_07_070922_create_banners_table', 1),
(21, '2025_05_07_071913_create_blogs_table', 1),
(22, '2025_05_08_144146_update_is_featured_default_in_products_table', 2),
(23, '2025_05_08_144605_add_order_to_banners_table', 3),
(24, '2025_05_08_155856_add_link_to_banners_table', 4),
(25, '2025_05_09_011124_remove_ram_from_product_variants', 5),
(26, '2025_05_09_011416_rename_is_active_to_status_in_product_variants', 6),
(27, '2025_05_09_013701_create_capacities_table', 7),
(28, '2025_05_09_013701_create_colors_table', 7),
(29, '2025_05_09_014708_update_product_variants_capacity_color', 8),
(30, '2024_03_19_add_soft_deletes_to_colors_and_capacities', 9),
(31, '2025_05_09_074001_modify_products_table', 10),
(32, '2025_05_09_074114_modify_product_variants_table', 10),
(33, '2025_05_09_074131_create_variant_attributes_table', 10),
(34, '2025_05_09_074147_create_product_attributes_table', 10),
(35, '2025_05_09_080245_remove_price_from_products_table', 11),
(36, '2025_05_09_081137_drop_price_from_product_variants_table', 12),
(37, '2025_05_09_092032_rename_image_url_to_image_in_product_variants_table', 13),
(38, '2025_05_09_101144_remove_stock_from_products_table', 14),
(39, '2025_05_10_015532_remove_default_variant_id_from_products_table', 15),
(41, '2025_05_10_022326_add_stock_to_products_table', 16),
(42, '2025_05_12_084953_update_product_tables_structure', 17),
(43, '2025_05_12_153708_add_guard_name_to_roles_and_permissions_tables', 18),
(44, '2025_05_12_154142_add_timestamps_to_roles_and_permissions_tables', 19),
(45, '2025_05_12_165433_update_role_to_role_id_in_users_table', 20),
(46, '2025_05_13_023750_create_permission_tables', 21),
(47, '2025_05_13_072913_remove_image_discount_price_purchase_price_selling_price_from_products', 22),
(48, '2025_05_13_143459_drop_roles_and_permissions_tables', 23),
(49, '2025_05_13_153400_create_role_has_permissions_table', 24),
(50, '2025_05_13_154223_add_description_to_permissions_table', 25),
(51, '2025_05_13_140900_add_hex_to_variant_attributes', 26),
(52, '2025_05_13_160610_modify_variant_attributes_columns_to_json', 27),
(53, '2025_05_13_160000_recreate_permission_tables', 28),
(54, '2025_05_14_105029_add_is_default_to_product_variants_table', 29),
(56, '2025_05_14_130636_add_hex_to_variant_attributes', 30),
(57, '2025_05_14_135435_drop_spatie_permission_tables', 31),
(58, '2025_05_14_140736_drop_spatie_permission_tables', 32),
(59, '2025_05_14_141637_drop_spatie_permission_tables', 33),
(60, '2025_05_14_135939_create_spatie_permission_core_tables', 34),
(61, '2025_05_14_141755_add_description_to_banners_table', 35),
(62, '2025_05_14_145009_create_model_has_permissions_table', 36),
(63, '2025_05_14_145531_create_model_has_roles_table', 37),
(64, '2025_05_15_090400_add_sku_to_product_attributes_table', 38),
(65, '2025_05_15_023932_optimize_variant_tables', 39),
(66, '2025_05_15_072252_remove_role_id_from_users_table', 40),
(67, '2025_05_15_072903_create_permission_tables', 41),
(68, '2025_05_15_073818_add_description_to_permissions_table', 42),
(69, '2025_05_15_081055_add_role_id_to_users_table', 43),
(70, '2025_05_15_111743_remove_role_id_from_users_table', 44),
(71, '2025_05_15_094547_create_permission_tables', 45),
(72, '2025_05_15_124011_create_permission_tables', 46),
(73, '2024_03_21_000000_remove_unused_fields', 47),
(74, '2025_05_17_082859_update_product_variants_table', 48),
(75, '2025_05_17_082859_update_products_table', 48),
(76, '2025_05_17_082900_update_variant_attribute_types_table', 49),
(77, '2025_05_17_082900_update_variant_attribute_values_table', 49),
(78, '2025_05_17_082901_update_variant_combinations_table', 50),
(79, '2024_03_21_000000_remove_sort_order_from_variant_attribute_types', 51),
(80, '2024_03_21_000001_remove_sort_order_from_variant_attribute_values', 51),
(81, '2025_05_17_083832_remove_sort_order_from_variant_attribute_types', 51),
(82, '2025_05_17_083841_remove_sort_order_from_variant_attribute_values', 51),
(83, '2025_05_17_083935_create_stock_movements_table', 52),
(84, '2025_05_17_083947_create_stock_adjustments_table', 52),
(85, '2025_05_17_084000_add_category_id_to_variant_attribute_types', 53),
(86, '2025_05_17_084204_add_category_id_to_variant_attribute_types', 53),
(87, '2025_05_17_085439_update_variant_attribute_types_table_add_category_ids_json', 53),
(88, '2025_05_17_085837_change_category_id_to_category_ids_in_variant_attribute_types', 53),
(91, '2025_05_17_090318_remove_code_from_variant_attribute_types', 54),
(92, '2025_05_18_000002_create_specifications_tables', 55),
(93, '2025_05_18_000003_drop_old_tables', 56),
(94, '2025_05_18_000004_create_product_specifications_table', 57),
(95, '2025_05_18_000005_recreate_product_specifications_table', 58),
(96, '2025_05_18_000006_update_specifications_table', 59),
(97, '2025_05_19_135058_create_contacts_table', 60),
(110, '2025_05_15_134055_create_vouchers_table', 61),
(111, '2025_05_15_134109_create_user_vouchers_table', 61),
(112, '2025_05_22_060948_add_cancel_reason_to_orders_table', 62),
(113, '2024_05_22_000001_update_variant_attribute_values_to_json', 63),
(114, '2025_05_19_164129_create_contacts_table', 64),
(115, '2025_05_20_080544_add_deleted_at_to_contacts_table', 64),
(116, '2025_05_21_124829_create_subscribers_table', 64),
(117, '2025_05_25_013802_add_views_to_products_table', 65),
(118, '2025_05_26_012029_add_name_to_subscribers_table', 66),
(119, '2025_05_26_031323_add_deleted_at_to_subscribers_table', 66),
(120, '2025_05_26_110805_create_faqs_table', 66),
(125, '2025_05_28_101618_create_flash_sales_table', 67),
(126, '2025_05_28_101621_create_flash_sale_items_table', 67),
(127, '2024_03_20_create_order_details_table', 68),
(128, '2025_05_28_143546_update_payment_method_enum_in_orders_table', 69),
(129, '2025_05_29_202039_add_provider_columns_to_users_table', 70),
(130, '2024_03_20_add_deleted_at_to_product_reviews', 71),
(131, '2025_05_30_212052_add_image_to_categories_table', 72),
(132, '2025_06_02_162806_create_password_reset_tokens_table', 73),
(133, '2024_01_01_000001_create_invoices_table', 74),
(134, '2024_03_15_000000_create_resend_invoice_requests_table', 75),
(135, '2024_06_01_000001_create_order_returns_table', 76),
(136, '2024_06_01_000002_create_order_return_items_table', 77),
(137, '2024_06_01_000003_add_refunded_amount_to_orders_table', 78),
(138, '2024_06_01_000004_add_restock_to_order_return_items_table', 79),
(139, '2024_06_01_000005_add_status_to_order_items_table', 80),
(140, '2025_06_13_145145_add_deleted_at_to_variant_combinations_table', 81),
(141, '2025_06_14_124028_create_search_histories_table', 82),
(142, '2025_06_14_124031_create_product_views_table', 82),
(145, '2025_06_18_204617_add_timestamps_to_sessions_table', 83),
(146, '2025_06_18_212622_create_page_views_table', 84),
(147, '2025_06_18_213851_add_user_id_to_page_views_table', 85),
(148, '2025_06_19_180946_update_product_reviews_add_images_and_variant_id', 86),
(149, '2025_06_21_155812_add_session_id_to_page_views_table', 87),
(150, '2025_06_21_170918_add_voucher_fields_to_orders_table', 88),
(151, '2025_06_23_091415_create_shipping_orders_table', 89),
(152, '2025_06_23_100000_add_ghn_fields_to_orders_table', 90),
(153, '2025_06_24_092127_add_ghn_address_fields_to_orders_table', 91),
(154, '2025_06_24_164252_add_duration_to_page_views_table', 92),
(155, '2025_06_30_100436_add_icon_to_categories_table', 93),
(156, '2025_06_21_180431_add_order_id_to_product_reviews_table', 94),
(157, '2025_07_01_145044_add_proof_video_to_order_returns_table', 95),
(158, '2024_03_15_create_refund_proofs_table', 96),
(159, '2025_06_27_214635_create_messages_table', 97),
(160, '2025_07_05_999999_add_active_status_to_users', 97),
(161, '2025_07_05_999999_add_avatar_to_users', 97),
(162, '2025_07_05_999999_add_dark_mode_to_users', 97),
(163, '2025_07_05_999999_add_messenger_color_to_users', 97),
(166, '2025_07_05_999999_create_chatify_messages_table', 98),
(167, '2025_07_05_999999_create_chatify_favorites_table', 99);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `model_has_permissions`
--

CREATE TABLE `model_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `model_has_roles`
--

CREATE TABLE `model_has_roles` (
  `role_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'App\\Models\\User',
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `model_has_roles`
--

INSERT INTO `model_has_roles` (`role_id`, `model_type`, `model_id`) VALUES
(1, 'App\\Models\\User', 1),
(2, 'App\\Models\\User', 1),
(2, 'App\\Models\\User', 2),
(2, 'App\\Models\\User', 19),
(3, 'App\\Models\\User', 22),
(3, 'App\\Models\\User', 32),
(3, 'App\\Models\\User', 38),
(3, 'App\\Models\\User', 40),
(3, 'App\\Models\\User', 41),
(3, 'App\\Models\\User', 42),
(3, 'App\\Models\\User', 44),
(3, 'App\\Models\\User', 50),
(3, 'App\\Models\\User', 51),
(3, 'App\\Models\\User', 52),
(3, 'App\\Models\\User', 53),
(3, 'App\\Models\\User', 54),
(3, 'App\\Models\\User', 55),
(3, 'App\\Models\\User', 56),
(3, 'App\\Models\\User', 57),
(3, 'App\\Models\\User', 58),
(3, 'App\\Models\\User', 59),
(3, 'App\\Models\\User', 60),
(3, 'App\\Models\\User', 61),
(3, 'App\\Models\\User', 62),
(3, 'App\\Models\\User', 63),
(3, 'App\\Models\\User', 64),
(3, 'App\\Models\\User', 65),
(3, 'App\\Models\\User', 66),
(3, 'App\\Models\\User', 67),
(3, 'App\\Models\\User', 68),
(3, 'App\\Models\\User', 69),
(3, 'App\\Models\\User', 70),
(3, 'App\\Models\\User', 71),
(3, 'App\\Models\\User', 73),
(3, 'App\\Models\\User', 74),
(3, 'App\\Models\\User', 75),
(3, 'App\\Models\\User', 76),
(3, 'App\\Models\\User', 77),
(3, 'App\\Models\\User', 78),
(3, 'App\\Models\\User', 79),
(3, 'App\\Models\\User', 80),
(3, 'App\\Models\\User', 81),
(3, 'App\\Models\\User', 82);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `orders`
--

CREATE TABLE `orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `voucher_id` bigint(20) UNSIGNED DEFAULT NULL,
  `voucher_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `discount_amount` decimal(15,0) NOT NULL DEFAULT '0',
  `subtotal` decimal(15,0) DEFAULT NULL,
  `discount` decimal(15,0) NOT NULL DEFAULT '0',
  `shipping_fee` decimal(15,0) DEFAULT NULL,
  `total_price` decimal(15,0) DEFAULT NULL,
  `refunded_amount` decimal(15,0) NOT NULL DEFAULT '0',
  `shipping_address` text COLLATE utf8mb4_unicode_ci,
  `shipping_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shipping_phone` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shipping_email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_method` enum('cod','bank_transfer','credit_card','vnpay','qr') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'cod',
  `payment_status` enum('pending','paid','failed','refunded') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `shipping_method_id` bigint(20) UNSIGNED DEFAULT NULL,
  `status` enum('pending','confirmed','preparing','shipping','completed','cancelled','returned','partially_returned') COLLATE utf8mb4_unicode_ci DEFAULT 'pending',
  `is_paid` tinyint(1) NOT NULL DEFAULT '0',
  `notes` text COLLATE utf8mb4_unicode_ci,
  `cancel_reason` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `orders`
--

INSERT INTO `orders` (`id`, `order_code`, `user_id`, `voucher_id`, `voucher_code`, `discount_amount`, `subtotal`, `discount`, `shipping_fee`, `total_price`, `refunded_amount`, `shipping_address`, `shipping_name`, `shipping_phone`, `shipping_email`, `payment_method`, `payment_status`, `shipping_method_id`, `status`, `is_paid`, `notes`, `cancel_reason`, `created_at`, `updated_at`) VALUES
(70, 'DH70', 42, NULL, NULL, 0, 12999999, 0, 0, 12999999, 0, 'Vọng Giang', 'đại học coder', '0968791308', 'daichuvan95@gmail.com', 'vnpay', 'pending', NULL, 'pending', 0, NULL, NULL, '2025-06-15 23:49:44', '2025-06-24 09:24:32'),
(73, 'ORD202506159519', 42, NULL, NULL, 0, 34333, 0, 0, 34333, 0, 'Vọng Giang', 'đại học coder ', '0968791308', 'daichuvan95@gmail.com', 'vnpay', 'pending', NULL, 'pending', 0, NULL, NULL, '2025-06-15 23:57:28', '2025-06-24 09:24:32'),
(74, 'DH74', 42, NULL, NULL, 0, 34333, 0, 0, 34333, 0, 'Vọng Giang', 'đại học coder', '0968791308', 'daichuvan95@gmail.com', 'vnpay', 'pending', NULL, 'pending', 0, NULL, NULL, '2025-06-15 23:58:23', '2025-06-24 09:24:32'),
(75, 'DH75', 42, NULL, NULL, 0, 34333, 0, 0, 34333, 0, 'Vọng Giang', 'đại học coder', '0968791308', 'daichuvan95@gmail.com', 'vnpay', 'pending', NULL, 'pending', 0, NULL, NULL, '2025-06-16 00:02:19', '2025-06-24 09:24:32'),
(76, 'ORD202506168114', 42, NULL, NULL, 0, 12999999, 0, 0, 12999999, 0, 'Vọng Giang', 'đại học coder ', '0968791308', 'daichuvan95@gmail.com', 'vnpay', 'pending', NULL, 'pending', 0, NULL, NULL, '2025-06-16 00:09:41', '2025-06-24 09:24:32'),
(77, 'DH77', 42, NULL, NULL, 0, 12999999, 0, 0, 12999999, 0, 'Vọng Giang', 'đại học coder', '0968791308', 'daichuvan95@gmail.com', 'vnpay', 'pending', NULL, 'pending', 0, NULL, NULL, '2025-06-16 00:13:26', '2025-06-24 09:24:32'),
(78, 'DH78', 42, NULL, NULL, 0, 12999999, 0, 0, 12999999, 0, 'Vọng Giang', 'đại học coder', '0968791308', 'daichuvan95@gmail.com', 'vnpay', 'pending', NULL, 'cancelled', 0, NULL, 'tôi cần thay đổi phương thức thanh toán xxx', '2025-06-16 00:16:57', '2025-06-24 09:24:32'),
(79, 'DH79', 42, NULL, NULL, 0, 12999999, 0, 0, 12999999, 0, 'Vọng Giang', 'đại học coder', '0968791308', 'daichuvan95@gmail.com', 'vnpay', 'paid', NULL, 'confirmed', 1, NULL, NULL, '2025-06-16 00:23:11', '2025-06-24 09:24:32'),
(80, 'DH80', 42, NULL, NULL, 0, 34333, 0, 0, 34333, 0, 'Vọng Giang', 'đại học coder', '0968791308', 'daichuvan95@gmail.com', 'vnpay', 'paid', NULL, 'confirmed', 1, NULL, NULL, '2025-06-16 00:29:31', '2025-06-24 09:24:32'),
(81, 'ORD202506162345', 42, NULL, NULL, 0, 34333, 0, 0, 34333, 0, 'Vọng Giang', 'đại học coder ', '0968791308', 'daichuvan95@gmail.com', 'vnpay', 'pending', NULL, 'pending', 0, NULL, NULL, '2025-06-16 00:31:38', '2025-06-24 09:24:32'),
(82, 'ORD202506165008', 42, NULL, NULL, 0, 34333, 0, 0, 34333, 0, 'Vọng Giang', 'đại học coder ', '0968791308', 'daichuvan95@gmail.com', 'vnpay', 'paid', NULL, 'confirmed', 1, NULL, NULL, '2025-06-16 00:32:27', '2025-06-24 09:24:32'),
(83, 'DH83', 42, NULL, NULL, 0, 12999999, 0, 0, 12999999, 0, 'Vọng Giang', 'đại học coder', '0968791308', 'daichuvan95@gmail.com', 'vnpay', 'paid', NULL, 'confirmed', 1, NULL, NULL, '2025-06-16 00:33:47', '2025-06-24 09:24:32'),
(84, 'DH84', 42, NULL, NULL, 0, 34333, 0, 0, 34333, 0, 'Vọng Giang', 'đại học coder', '0968791308', 'daichuvan95@gmail.com', 'cod', 'pending', NULL, 'pending', 0, NULL, NULL, '2025-06-16 00:34:42', '2025-06-24 09:24:32'),
(85, 'DH85', 42, NULL, NULL, 0, 12999999, 0, 0, 12999999, 0, 'Vọng Giang', 'đại học coder', '0968791308', 'daichuvan95@gmail.com', 'cod', 'pending', NULL, 'pending', 0, NULL, NULL, '2025-06-16 00:35:28', '2025-06-24 09:24:32'),
(86, 'DH86', 42, NULL, NULL, 0, 26799996, 0, 0, 26799996, 0, 'Vọng Giang', 'đại học coder', '0968791308', 'daichuvan95@gmail.com', 'vnpay', 'paid', NULL, 'confirmed', 1, NULL, NULL, '2025-06-16 00:43:50', '2025-06-24 09:24:32'),
(87, 'DH87', 42, NULL, NULL, 0, 13068665, 0, 0, 13068665, 0, 'Vọng Giang', 'đại học coder', '0968791308', 'daichuvan95@gmail.com', 'vnpay', 'paid', NULL, 'completed', 1, NULL, NULL, '2025-06-16 00:53:12', '2025-06-24 09:24:32'),
(88, 'DH88', 42, NULL, NULL, 0, 34333, 0, 0, 34333, 0, 'Vọng Giang', 'đại học coder', '0968791308', 'daichuvan95@gmail.com', 'cod', 'pending', NULL, 'confirmed', 0, NULL, NULL, '2025-06-16 01:00:09', '2025-06-24 09:55:47'),
(93, 'DH93', 43, NULL, NULL, 0, 12345, 0, 0, 12345, 0, 'Hà Nội', 'Cường', '0987654321', 'test@gmail.com', 'cod', 'pending', NULL, 'confirmed', 0, NULL, NULL, '2025-06-16 15:27:36', '2025-06-24 09:46:35'),
(94, 'DH94', 43, NULL, NULL, 0, 2345678, 0, 0, 2345678, 0, 'Hà Nội', 'Cường', '0987654311', 'test@gmail.com', 'cod', 'pending', NULL, 'confirmed', 0, NULL, NULL, '2025-06-16 22:58:34', '2025-06-24 09:41:18'),
(95, 'DH95', 43, NULL, NULL, 0, 35555556, 0, 0, 35555556, 0, 'Hà Nội', 'Cường', '0987654321', 'test@gmail.com', 'cod', 'paid', NULL, 'completed', 0, NULL, NULL, '2025-06-17 22:45:55', '2025-06-24 09:24:32'),
(96, 'DH96', NULL, NULL, NULL, 0, 55125, 0, 0, 55125, 0, 'Vọng Giang', 'đại học coder', '0368706552', 'user98@gmail.com', 'cod', 'paid', NULL, 'completed', 0, NULL, NULL, '2025-06-18 15:25:23', '2025-06-24 09:24:32'),
(97, 'DH97', NULL, NULL, NULL, 0, 222, 0, 0, 222, 0, 'Nam từ liêm hà nội', 'bình', '0968791306', 'user98@gmail.com', 'cod', 'pending', NULL, 'confirmed', 0, NULL, NULL, '2025-06-19 14:18:33', '2025-06-24 09:28:03'),
(98, 'DH98', 43, NULL, NULL, 0, 111, 0, 0, 111, 0, 'Hà Nội', 'Cường', '0987654311', 'test@gmail.com', 'cod', 'pending', NULL, 'confirmed', 0, NULL, NULL, '2025-06-19 22:38:28', '2025-06-24 09:25:39'),
(99, 'DH99', 71, NULL, NULL, 0, 333, 0, 0, 333, 0, 'Tx. Thái Hòa', 'Kim Hồng Phong', '0973067464', 'phongk211005@gmail.com', 'cod', 'pending', NULL, 'confirmed', 0, NULL, NULL, '2025-06-23 10:07:30', '2025-06-24 09:24:32'),
(100, 'DH100', 71, NULL, NULL, 0, 222, 0, 0, 222, 0, 'Tx. Thái Hòa', 'Kim Hồng Phong', '0973067464', 'phongk211005@gmail.com', 'cod', 'pending', NULL, 'confirmed', 0, '', NULL, '2025-06-24 09:11:49', '2025-06-24 09:24:32'),
(101, 'DH101', 43, NULL, NULL, 0, 222, 0, 0, 222, 0, 'Hà Nội', 'Cường', '0987654321', 'test@gmail.com', 'cod', 'pending', NULL, 'completed', 0, '', NULL, '2025-06-30 20:13:02', '2025-06-30 20:57:20'),
(102, 'DH102', 43, NULL, NULL, 0, 222, 0, 0, 222, 0, 'Hà Nội', 'Cường', '0987654321', 'test@gmail.com', 'cod', 'pending', NULL, 'completed', 0, '', NULL, '2025-06-30 20:16:22', '2025-06-30 20:53:56'),
(103, 'DH103', 43, NULL, NULL, 0, 1278790, 0, 0, 1278790, 0, 'Hà Nội', 'Cường', '0987654321', 'test@gmail.com', 'cod', 'pending', NULL, 'completed', 0, '', NULL, '2025-06-30 21:04:01', '2025-06-30 21:08:52'),
(104, 'DH104', 42, NULL, NULL, 0, 7890, 0, 0, 7890, 0, 'Vọng Giang', 'đại học coder', '0968791308', 'daichuvan95@gmail.com', 'cod', 'pending', NULL, 'completed', 0, '', NULL, '2025-07-01 15:56:30', '2025-07-01 15:56:30');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `order_items`
--

CREATE TABLE `order_items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `product_variant_id` bigint(20) UNSIGNED NOT NULL,
  `quantity` int(11) NOT NULL,
  `price` decimal(15,0) NOT NULL,
  `total` decimal(15,0) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `order_items`
--

INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `product_variant_id`, `quantity`, `price`, `total`, `created_at`, `updated_at`, `deleted_at`) VALUES
(98, 95, 152, 239, 1, 555, 555, '2025-06-17 22:45:55', '2025-06-17 22:45:55', NULL),
(99, 96, 152, 239, 1, 55125, 55125, '2025-06-18 15:25:23', '2025-06-18 15:25:23', NULL),
(100, 97, 155, 245, 1, 222, 222, '2025-06-19 14:18:33', '2025-06-19 14:18:33', NULL),
(101, 98, 153, 243, 1, 111, 111, '2025-06-19 22:38:28', '2025-06-19 22:38:28', NULL),
(102, 99, 154, 244, 1, 333, 333, '2025-06-23 10:07:30', '2025-06-23 10:07:30', NULL),
(103, 100, 155, 245, 1, 222, 222, '2025-06-24 09:11:49', '2025-06-24 09:11:49', NULL),
(104, 101, 155, 245, 1, 222, 222, '2025-06-30 20:13:02', '2025-06-30 20:13:02', NULL),
(105, 102, 155, 245, 1, 222, 222, '2025-06-30 20:16:22', '2025-06-30 20:16:22', NULL),
(106, 103, 155, 245, 1, 222, 222, '2025-06-30 21:04:01', '2025-06-30 21:04:01', NULL),
(107, 103, 153, 243, 1, 1222111, 1222111, '2025-06-30 21:04:01', '2025-06-30 21:04:01', NULL),
(108, 104, 152, 248, 1, 7890, 7890, '2025-07-01 15:56:30', '2025-07-01 15:56:30', NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `order_returns`
--

CREATE TABLE `order_returns` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `status` enum('pending','approved','rejected','refunded') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `reason` text COLLATE utf8mb4_unicode_ci,
  `image` text COLLATE utf8mb4_unicode_ci,
  `proof_video` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `refund_proof_image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `refund_note` text COLLATE utf8mb4_unicode_ci,
  `refund_amount` decimal(15,0) DEFAULT NULL,
  `refund_method` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `admin_id` bigint(20) UNSIGNED DEFAULT NULL,
  `processed_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `order_return_items`
--

CREATE TABLE `order_return_items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_return_id` bigint(20) UNSIGNED NOT NULL,
  `order_item_id` bigint(20) UNSIGNED NOT NULL,
  `quantity` int(11) NOT NULL,
  `restock` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `page_views`
--

CREATE TABLE `page_views` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `session_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `duration` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `page_views`
--

INSERT INTO `page_views` (`id`, `session_id`, `user_id`, `url`, `ip_address`, `user_agent`, `duration`, `created_at`, `updated_at`) VALUES
(1, NULL, NULL, 'http://127.0.0.1:8000', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36 Edg/137.0.0.0', NULL, '2025-06-18 21:35:59', '2025-06-18 21:35:59'),
(2, NULL, NULL, 'http://127.0.0.1:8000', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36 Edg/137.0.0.0', NULL, '2025-06-18 21:40:10', '2025-06-18 21:40:10'),
(3, NULL, NULL, 'http://127.0.0.1:8000/logout', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36 Edg/137.0.0.0', NULL, '2025-06-18 21:40:20', '2025-06-18 21:40:20'),
(4, NULL, NULL, 'http://127.0.0.1:8000/login', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36 Edg/137.0.0.0', NULL, '2025-06-18 21:40:21', '2025-06-18 21:40:21'),
(5, NULL, NULL, 'http://127.0.0.1:8000/login', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36 Edg/137.0.0.0', NULL, '2025-06-18 21:40:27', '2025-06-18 21:40:27'),
(6, NULL, NULL, 'http://127.0.0.1:8000', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36 Edg/137.0.0.0', NULL, '2025-06-18 21:40:28', '2025-06-18 21:40:28'),
(7, NULL, 1, 'http://127.0.0.1:8000/admin', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-18 21:41:20', '2025-06-18 21:41:20'),
(8, NULL, 74, 'http://127.0.0.1:8000', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36 Edg/137.0.0.0', NULL, '2025-06-18 21:41:30', '2025-06-18 21:41:30'),
(9, NULL, 1, 'http://127.0.0.1:8000/admin', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-19 21:42:20', '2025-06-18 21:42:20'),
(10, NULL, 1, 'http://127.0.0.1:8000/admin', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-18 21:42:34', '2025-06-18 21:42:34'),
(11, NULL, 1, 'http://127.0.0.1:8000/admin', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-18 21:42:48', '2025-06-18 21:42:48'),
(12, NULL, 1, 'http://127.0.0.1:8000/admin', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-18 21:51:16', '2025-06-18 21:51:16'),
(13, NULL, 1, 'http://127.0.0.1:8000/admin', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-18 21:54:51', '2025-06-18 21:54:51'),
(14, NULL, 1, 'http://127.0.0.1:8000/admin', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-18 21:55:13', '2025-06-18 21:55:13'),
(15, NULL, 1, 'http://127.0.0.1:8000/admin', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-18 21:55:20', '2025-06-18 21:55:20'),
(16, NULL, 1, 'http://127.0.0.1:8000/admin', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-18 21:55:26', '2025-06-18 21:55:26'),
(17, NULL, 1, 'http://127.0.0.1:8000/admin', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-18 21:55:30', '2025-06-18 21:55:30'),
(18, NULL, 1, 'http://127.0.0.1:8000/admin', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-18 21:55:32', '2025-06-18 21:55:32'),
(19, NULL, 1, 'http://127.0.0.1:8000/admin', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-18 21:55:36', '2025-06-18 21:55:36'),
(20, NULL, 1, 'http://127.0.0.1:8000/admin', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-18 21:55:49', '2025-06-18 21:55:49'),
(21, NULL, 1, 'http://127.0.0.1:8000/admin', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-18 21:58:39', '2025-06-18 21:58:39'),
(22, NULL, 1, 'http://127.0.0.1:8000/admin', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-18 22:04:25', '2025-06-18 22:04:25'),
(23, NULL, 1, 'http://127.0.0.1:8000/admin', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-18 22:04:47', '2025-06-18 22:04:47'),
(24, NULL, 1, 'http://127.0.0.1:8000/admin', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-18 22:12:08', '2025-06-18 22:12:08'),
(25, NULL, 1, 'http://127.0.0.1:8000/admin', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-18 22:13:48', '2025-06-18 22:13:48'),
(26, NULL, 1, 'http://127.0.0.1:8000/admin', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-18 22:14:42', '2025-06-18 22:14:42'),
(27, NULL, 1, 'http://127.0.0.1:8000/admin/categories', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-18 22:15:32', '2025-06-18 22:15:32'),
(28, NULL, NULL, 'http://127.0.0.1:8000', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-19 15:46:02', '2025-06-19 15:46:02'),
(29, NULL, NULL, 'http://127.0.0.1:8000/login', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-19 15:46:32', '2025-06-19 15:46:32'),
(30, NULL, NULL, 'http://127.0.0.1:8000/login', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-19 15:46:39', '2025-06-19 15:46:39'),
(31, NULL, 1, 'http://127.0.0.1:8000/admin', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-19 15:46:41', '2025-06-19 15:46:41'),
(32, NULL, 1, 'http://127.0.0.1:8000/admin', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-19 15:47:13', '2025-06-19 15:47:13'),
(33, NULL, NULL, 'http://127.0.0.1:8000', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-19 15:55:37', '2025-06-19 15:55:37'),
(34, NULL, NULL, 'http://127.0.0.1:8000/login', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-19 15:55:40', '2025-06-19 15:55:40'),
(35, NULL, NULL, 'http://127.0.0.1:8000/login', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-19 15:55:46', '2025-06-19 15:55:46'),
(36, NULL, 74, 'http://127.0.0.1:8000', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-19 15:55:46', '2025-06-19 15:55:46'),
(37, NULL, NULL, 'http://127.0.0.1:8000', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36 Edg/137.0.0.0', NULL, '2025-06-19 15:55:52', '2025-06-19 15:55:52'),
(38, NULL, NULL, 'http://127.0.0.1:8000/login', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36 Edg/137.0.0.0', NULL, '2025-06-19 15:55:56', '2025-06-19 15:55:56'),
(39, NULL, NULL, 'http://127.0.0.1:8000/login', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36 Edg/137.0.0.0', NULL, '2025-06-19 15:56:01', '2025-06-19 15:56:01'),
(40, NULL, 77, 'http://127.0.0.1:8000', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36 Edg/137.0.0.0', NULL, '2025-06-19 15:56:02', '2025-06-19 15:56:02'),
(41, NULL, 1, 'http://127.0.0.1:8000/admin', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-19 15:56:07', '2025-06-19 15:56:07'),
(42, NULL, 1, 'http://127.0.0.1:8000/admin', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-19 16:04:03', '2025-06-19 16:04:03'),
(43, NULL, 1, 'http://127.0.0.1:8000/admin', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-19 16:05:18', '2025-06-19 16:05:18'),
(44, NULL, 1, 'http://127.0.0.1:8000/admin', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-19 16:06:14', '2025-06-19 16:06:14'),
(45, NULL, 1, 'http://127.0.0.1:8000/admin', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-19 16:07:13', '2025-06-19 16:07:13'),
(46, NULL, 1, 'http://127.0.0.1:8000/admin', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-19 16:12:25', '2025-06-19 16:12:25'),
(47, NULL, 1, 'http://127.0.0.1:8000/admin', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-19 16:15:08', '2025-06-19 16:15:08'),
(48, NULL, 1, 'http://127.0.0.1:8000/admin', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-19 16:18:19', '2025-06-19 16:18:19'),
(49, NULL, 1, 'http://127.0.0.1:8000/admin', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-19 16:18:48', '2025-06-19 16:18:48'),
(50, NULL, 1, 'http://127.0.0.1:8000/admin/orders', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-19 16:20:06', '2025-06-19 16:20:06'),
(51, NULL, 1, 'http://127.0.0.1:8000/admin', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-19 16:21:29', '2025-06-19 16:21:29'),
(52, NULL, 1, 'http://127.0.0.1:8000/admin', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-19 16:21:34', '2025-06-19 16:21:34'),
(53, NULL, 1, 'http://127.0.0.1:8000/admin', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-19 16:23:11', '2025-06-19 16:23:11'),
(54, NULL, 1, 'http://127.0.0.1:8000/admin/vouchers', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-19 16:23:17', '2025-06-19 16:23:17'),
(55, NULL, 1, 'http://127.0.0.1:8000/admin/blogs', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-19 16:23:22', '2025-06-19 16:23:22'),
(56, NULL, 1, 'http://127.0.0.1:8000/admin/users', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-19 16:23:26', '2025-06-19 16:23:26'),
(57, NULL, 1, 'http://127.0.0.1:8000/admin/products', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-19 16:25:10', '2025-06-19 16:25:10'),
(58, NULL, 1, 'http://127.0.0.1:8000/admin/attributes', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-19 16:25:15', '2025-06-19 16:25:15'),
(59, NULL, 1, 'http://127.0.0.1:8000/admin/order-returns', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-19 16:25:33', '2025-06-19 16:25:33'),
(60, NULL, 1, 'http://127.0.0.1:8000/admin/users', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-19 16:25:37', '2025-06-19 16:25:37'),
(61, NULL, 1, 'http://127.0.0.1:8000/admin/contacts', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-19 16:25:41', '2025-06-19 16:25:41'),
(62, NULL, 1, 'http://127.0.0.1:8000/admin/subscribers', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-19 16:25:45', '2025-06-19 16:25:45'),
(63, NULL, 1, 'http://127.0.0.1:8000/admin/products', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-19 16:25:55', '2025-06-19 16:25:55'),
(64, NULL, 1, 'http://127.0.0.1:8000/admin/specifications', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-19 16:26:04', '2025-06-19 16:26:04'),
(65, NULL, 1, 'http://127.0.0.1:8000/admin', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-19 16:26:12', '2025-06-19 16:26:12'),
(66, NULL, 1, 'http://127.0.0.1:8000', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-19 16:30:29', '2025-06-19 16:30:29'),
(67, NULL, 1, 'http://127.0.0.1:8000/profile', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-19 16:30:38', '2025-06-19 16:30:38'),
(68, NULL, 1, 'http://127.0.0.1:8000/admin', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-19 16:30:50', '2025-06-19 16:30:50'),
(69, NULL, NULL, 'http://127.0.0.1:8000', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-19 22:14:06', '2025-06-19 22:14:06'),
(70, NULL, NULL, 'http://127.0.0.1:8000/login', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-19 22:14:17', '2025-06-19 22:14:17'),
(71, NULL, NULL, 'http://127.0.0.1:8000/login', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-19 22:14:24', '2025-06-19 22:14:24'),
(72, NULL, NULL, 'http://127.0.0.1:8000/login', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-19 22:14:26', '2025-06-19 22:14:26'),
(73, NULL, NULL, 'http://127.0.0.1:8000/login', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-19 22:14:29', '2025-06-19 22:14:29'),
(74, NULL, 1, 'http://127.0.0.1:8000/admin', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-19 22:14:31', '2025-06-19 22:14:31'),
(75, NULL, NULL, 'http://127.0.0.1:8000', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-20 20:42:45', '2025-06-20 20:42:45'),
(76, NULL, NULL, 'http://127.0.0.1:8000/login', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-20 20:44:50', '2025-06-20 20:44:50'),
(77, NULL, NULL, 'http://127.0.0.1:8000/login', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-20 20:44:56', '2025-06-20 20:44:56'),
(78, NULL, NULL, 'http://127.0.0.1:8000/login', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-20 20:44:58', '2025-06-20 20:44:58'),
(79, NULL, NULL, 'http://127.0.0.1:8000/login', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-20 20:45:03', '2025-06-20 20:45:03'),
(80, NULL, 1, 'http://127.0.0.1:8000/admin', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-20 20:45:04', '2025-06-20 20:45:04'),
(81, NULL, 1, 'http://127.0.0.1:8000/admin', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-20 20:45:25', '2025-06-20 20:45:25'),
(82, NULL, 1, 'http://127.0.0.1:8000/admin', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-20 20:46:04', '2025-06-20 20:46:04'),
(83, NULL, 1, 'http://127.0.0.1:8000/admin', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-20 20:47:39', '2025-06-20 20:47:39'),
(84, NULL, 1, 'http://127.0.0.1:8000/admin', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-20 20:48:25', '2025-06-20 20:48:25'),
(85, NULL, 1, 'http://127.0.0.1:8000/admin', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-20 20:51:05', '2025-06-20 20:51:05'),
(86, NULL, 1, 'http://127.0.0.1:8000/admin', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-20 20:51:24', '2025-06-20 20:51:24'),
(87, NULL, 1, 'http://127.0.0.1:8000/admin', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-20 20:54:38', '2025-06-20 20:54:38'),
(88, NULL, 1, 'http://127.0.0.1:8000/admin', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-20 20:55:15', '2025-06-20 20:55:15'),
(89, NULL, 1, 'http://127.0.0.1:8000/admin', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-20 20:56:28', '2025-06-20 20:56:28'),
(90, NULL, 1, 'http://127.0.0.1:8000/admin', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-20 20:56:49', '2025-06-20 20:56:49'),
(91, NULL, 1, 'http://127.0.0.1:8000/admin', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-20 21:11:38', '2025-06-20 21:11:38'),
(92, NULL, 1, 'http://127.0.0.1:8000/admin', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-20 21:11:46', '2025-06-20 21:11:46'),
(93, NULL, 1, 'http://127.0.0.1:8000/admin', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-20 21:12:11', '2025-06-20 21:12:11'),
(94, NULL, 1, 'http://127.0.0.1:8000/admin', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-20 21:12:12', '2025-06-20 21:12:12'),
(95, NULL, 1, 'http://127.0.0.1:8000/admin', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-20 21:12:14', '2025-06-20 21:12:14'),
(96, NULL, 1, 'http://127.0.0.1:8000/admin', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-20 21:12:15', '2025-06-20 21:12:15'),
(97, NULL, 1, 'http://127.0.0.1:8000/admin', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-20 21:12:16', '2025-06-20 21:12:16'),
(98, NULL, 1, 'http://127.0.0.1:8000/admin', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-20 21:12:17', '2025-06-20 21:12:17'),
(99, NULL, 1, 'http://127.0.0.1:8000/admin', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-20 21:12:29', '2025-06-20 21:12:29'),
(100, NULL, 1, 'http://127.0.0.1:8000/admin', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-20 21:12:43', '2025-06-20 21:12:43'),
(101, NULL, 1, 'http://127.0.0.1:8000/admin', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-20 21:14:42', '2025-06-20 21:14:42'),
(102, NULL, 1, 'http://127.0.0.1:8000/admin', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-20 21:14:53', '2025-06-20 21:14:53'),
(103, NULL, 1, 'http://127.0.0.1:8000/admin', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-20 21:15:22', '2025-06-20 21:15:22'),
(104, NULL, 1, 'http://127.0.0.1:8000/admin', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-20 21:18:22', '2025-06-20 21:18:22'),
(105, NULL, 1, 'http://127.0.0.1:8000/admin', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-20 21:18:36', '2025-06-20 21:18:36'),
(106, NULL, 1, 'http://127.0.0.1:8000/admin', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-20 21:18:46', '2025-06-20 21:18:46'),
(107, NULL, 1, 'http://127.0.0.1:8000/admin', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-20 21:18:55', '2025-06-20 21:18:55'),
(108, NULL, 1, 'http://127.0.0.1:8000/admin/products', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-20 21:19:10', '2025-06-20 21:19:10'),
(109, NULL, 1, 'http://127.0.0.1:8000/admin', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-20 21:24:22', '2025-06-20 21:24:22'),
(110, NULL, 1, 'http://127.0.0.1:8000/admin', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-20 21:24:32', '2025-06-20 21:24:32'),
(111, NULL, 1, 'http://127.0.0.1:8000/admin', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-20 21:28:59', '2025-06-20 21:28:59'),
(112, NULL, 1, 'http://127.0.0.1:8000/admin/orders/97', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-20 21:29:55', '2025-06-20 21:29:55'),
(113, NULL, 1, 'http://127.0.0.1:8000/admin', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-20 21:30:29', '2025-06-20 21:30:29'),
(114, NULL, 1, 'http://127.0.0.1:8000/admin', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-20 21:31:04', '2025-06-20 21:31:04'),
(115, NULL, 1, 'http://127.0.0.1:8000/admin', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-20 21:31:24', '2025-06-20 21:31:24'),
(116, NULL, 1, 'http://127.0.0.1:8000/admin/orders/96', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-20 21:31:32', '2025-06-20 21:31:32'),
(117, NULL, 1, 'http://127.0.0.1:8000/admin', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-20 21:34:24', '2025-06-20 21:34:24'),
(118, NULL, 1, 'http://127.0.0.1:8000/admin', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-20 21:34:44', '2025-06-20 21:34:44'),
(119, NULL, 1, 'http://127.0.0.1:8000/admin', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-20 21:34:56', '2025-06-20 21:34:56'),
(120, NULL, 1, 'http://127.0.0.1:8000/admin', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-20 21:35:08', '2025-06-20 21:35:08'),
(121, NULL, 1, 'http://127.0.0.1:8000/admin', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-20 21:42:23', '2025-06-20 21:42:23'),
(122, NULL, 1, 'http://127.0.0.1:8000/admin', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-20 21:43:09', '2025-06-20 21:43:09'),
(123, NULL, 1, 'http://127.0.0.1:8000/admin', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-20 21:44:01', '2025-06-20 21:44:01'),
(124, NULL, 1, 'http://127.0.0.1:8000/admin', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-20 21:44:22', '2025-06-20 21:44:22'),
(125, NULL, 1, 'http://127.0.0.1:8000/admin', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-20 21:44:29', '2025-06-20 21:44:29'),
(126, NULL, 1, 'http://127.0.0.1:8000/admin', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-20 21:45:54', '2025-06-20 21:45:54'),
(127, NULL, 1, 'http://127.0.0.1:8000/admin', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-20 21:46:14', '2025-06-20 21:46:14'),
(128, NULL, 1, 'http://127.0.0.1:8000/admin', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-20 21:48:24', '2025-06-20 21:48:24'),
(129, NULL, 1, 'http://127.0.0.1:8000/admin', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-20 21:49:37', '2025-06-20 21:49:37'),
(130, NULL, 1, 'http://127.0.0.1:8000/admin', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-20 22:20:15', '2025-06-20 22:20:15'),
(131, NULL, 1, 'http://127.0.0.1:8000/admin', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-20 22:21:14', '2025-06-20 22:21:14'),
(132, NULL, 1, 'http://127.0.0.1:8000/admin/products', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-20 22:21:18', '2025-06-20 22:21:18'),
(133, NULL, 1, 'http://127.0.0.1:8000/admin/products/155', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-20 22:21:34', '2025-06-20 22:21:34'),
(134, NULL, 1, 'http://127.0.0.1:8000/admin', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-20 22:22:01', '2025-06-20 22:22:01'),
(135, NULL, 1, 'http://127.0.0.1:8000/admin', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-20 22:22:28', '2025-06-20 22:22:28'),
(136, NULL, 1, 'http://127.0.0.1:8000/admin', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-20 23:13:14', '2025-06-20 23:13:14'),
(137, NULL, NULL, 'http://127.0.0.1:8000', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-20 23:14:35', '2025-06-20 23:14:35'),
(138, NULL, NULL, 'http://127.0.0.1:8000/login', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-20 23:14:38', '2025-06-20 23:14:38'),
(139, NULL, NULL, 'http://127.0.0.1:8000/login', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-20 23:14:44', '2025-06-20 23:14:44'),
(140, NULL, 74, 'http://127.0.0.1:8000', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-20 23:14:46', '2025-06-20 23:14:46'),
(141, NULL, 1, 'http://127.0.0.1:8000/admin', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-20 23:14:53', '2025-06-20 23:14:53'),
(142, NULL, 1, 'http://127.0.0.1:8000/admin', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-20 23:16:00', '2025-06-20 23:16:00'),
(143, 'yaPKmsgGJZeVuKlqrOyuCAekRuEiZLOfiO44CoDI', NULL, 'http://127.0.0.1:8000', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-21 16:03:47', '2025-06-21 16:03:47'),
(144, 'yaPKmsgGJZeVuKlqrOyuCAekRuEiZLOfiO44CoDI', NULL, 'http://127.0.0.1:8000/login', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-21 16:03:52', '2025-06-21 16:03:52'),
(145, 'yaPKmsgGJZeVuKlqrOyuCAekRuEiZLOfiO44CoDI', NULL, 'http://127.0.0.1:8000/login', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-21 16:03:58', '2025-06-21 16:03:58'),
(146, 'wRnbJNyElX5OjW9IXgwEQ5oCabrfR48zUqZudg7z', 74, 'http://127.0.0.1:8000', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-21 16:04:01', '2025-06-21 16:04:01'),
(147, 'QzhaPvehbXqVdfEdMmmWA7nRskSSEn76VK3B4kR2', NULL, 'http://127.0.0.1:8000', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-21 16:04:08', '2025-06-21 16:04:08'),
(148, 'QzhaPvehbXqVdfEdMmmWA7nRskSSEn76VK3B4kR2', NULL, 'http://127.0.0.1:8000/login', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-21 16:04:11', '2025-06-21 16:04:11'),
(149, 'QzhaPvehbXqVdfEdMmmWA7nRskSSEn76VK3B4kR2', NULL, 'http://127.0.0.1:8000/login', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-21 16:05:03', '2025-06-21 16:05:03'),
(150, 'SxLOOtsU3qUvKlA8BhRmv4cLquQTGBg9b65HtFfO', 77, 'http://127.0.0.1:8000', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-21 16:05:04', '2025-06-21 16:05:04'),
(151, 'wRnbJNyElX5OjW9IXgwEQ5oCabrfR48zUqZudg7z', 74, 'http://127.0.0.1:8000/logout', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-21 16:05:11', '2025-06-21 16:05:11'),
(152, 'B0shDZbopUowxbpiAgpiUldVzWBuz4oAJaUCXqg9', NULL, 'http://127.0.0.1:8000/login', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-21 16:05:12', '2025-06-21 16:05:12'),
(153, 'B0shDZbopUowxbpiAgpiUldVzWBuz4oAJaUCXqg9', NULL, 'http://127.0.0.1:8000/login', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-21 16:05:21', '2025-06-21 16:05:21'),
(154, '686pcaWxEyMuy5jQK3IDyRtVNoj2qaOkbVBWJFEJ', 1, 'http://127.0.0.1:8000/admin', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-21 16:05:21', '2025-06-21 16:05:21'),
(155, '686pcaWxEyMuy5jQK3IDyRtVNoj2qaOkbVBWJFEJ', 1, 'http://127.0.0.1:8000/admin', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-21 16:07:04', '2025-06-21 16:07:04'),
(156, '686pcaWxEyMuy5jQK3IDyRtVNoj2qaOkbVBWJFEJ', 1, 'http://127.0.0.1:8000/admin', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-21 16:07:16', '2025-06-21 16:07:16'),
(157, '686pcaWxEyMuy5jQK3IDyRtVNoj2qaOkbVBWJFEJ', 1, 'http://127.0.0.1:8000/admin', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-21 16:10:41', '2025-06-21 16:10:41'),
(158, 'rYvobd23iSOhQ9avJF8ozHixSsnyKQY4MiDTvasj', NULL, 'http://127.0.0.1:8000', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36 Edg/137.0.0.0', NULL, '2025-06-21 16:10:50', '2025-06-21 16:10:50'),
(159, '686pcaWxEyMuy5jQK3IDyRtVNoj2qaOkbVBWJFEJ', 1, 'http://127.0.0.1:8000/admin', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-21 16:10:58', '2025-06-21 16:10:58'),
(160, '686pcaWxEyMuy5jQK3IDyRtVNoj2qaOkbVBWJFEJ', 1, 'http://127.0.0.1:8000/admin', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-21 16:11:01', '2025-06-21 16:11:01'),
(161, 'rYvobd23iSOhQ9avJF8ozHixSsnyKQY4MiDTvasj', NULL, 'http://127.0.0.1:8000', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36 Edg/137.0.0.0', NULL, '2025-06-21 16:11:17', '2025-06-21 16:11:17'),
(162, 'rYvobd23iSOhQ9avJF8ozHixSsnyKQY4MiDTvasj', NULL, 'http://127.0.0.1:8000', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36 Edg/137.0.0.0', NULL, '2025-06-21 16:11:25', '2025-06-21 16:11:25'),
(163, '686pcaWxEyMuy5jQK3IDyRtVNoj2qaOkbVBWJFEJ', 1, 'http://127.0.0.1:8000/admin', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-21 16:11:34', '2025-06-21 16:11:34'),
(164, '686pcaWxEyMuy5jQK3IDyRtVNoj2qaOkbVBWJFEJ', 1, 'http://127.0.0.1:8000/logout', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-21 16:14:22', '2025-06-21 16:14:22'),
(165, 'fByVD6SdeQ8AVcdGEKn9sedkUp5g8HKBDKR53MbV', NULL, 'http://127.0.0.1:8000/login', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-21 16:14:23', '2025-06-21 16:14:23'),
(166, 'fByVD6SdeQ8AVcdGEKn9sedkUp5g8HKBDKR53MbV', NULL, 'http://127.0.0.1:8000/login', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-21 16:14:28', '2025-06-21 16:14:28'),
(167, 'fByVD6SdeQ8AVcdGEKn9sedkUp5g8HKBDKR53MbV', NULL, 'http://127.0.0.1:8000/login', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-21 16:14:29', '2025-06-21 16:14:29'),
(168, 'fByVD6SdeQ8AVcdGEKn9sedkUp5g8HKBDKR53MbV', NULL, 'http://127.0.0.1:8000/login', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-21 16:14:32', '2025-06-21 16:14:32'),
(169, 'iCK8J9uwPFpXpaBXd6M9o5BuP0CeE2amFIt9Psgn', 1, 'http://127.0.0.1:8000/admin', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-21 16:14:33', '2025-06-21 16:14:33'),
(170, 'rYvobd23iSOhQ9avJF8ozHixSsnyKQY4MiDTvasj', NULL, 'http://127.0.0.1:8000', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36 Edg/137.0.0.0', NULL, '2025-06-21 16:16:37', '2025-06-21 16:16:37'),
(171, 'iCK8J9uwPFpXpaBXd6M9o5BuP0CeE2amFIt9Psgn', 1, 'http://127.0.0.1:8000/admin', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-21 16:16:40', '2025-06-21 16:16:40'),
(172, 'iCK8J9uwPFpXpaBXd6M9o5BuP0CeE2amFIt9Psgn', 1, 'http://127.0.0.1:8000/admin', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-21 16:16:49', '2025-06-21 16:16:49'),
(173, 'rYvobd23iSOhQ9avJF8ozHixSsnyKQY4MiDTvasj', NULL, 'http://127.0.0.1:8000', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36 Edg/137.0.0.0', NULL, '2025-06-21 16:16:54', '2025-06-21 16:16:54'),
(174, 'iCK8J9uwPFpXpaBXd6M9o5BuP0CeE2amFIt9Psgn', 1, 'http://127.0.0.1:8000/admin', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-21 16:16:58', '2025-06-21 16:16:58'),
(175, 'rYvobd23iSOhQ9avJF8ozHixSsnyKQY4MiDTvasj', NULL, 'http://127.0.0.1:8000', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36 Edg/137.0.0.0', NULL, '2025-06-21 16:17:18', '2025-06-21 16:17:18'),
(176, 'iCK8J9uwPFpXpaBXd6M9o5BuP0CeE2amFIt9Psgn', 1, 'http://127.0.0.1:8000/admin', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-21 16:17:33', '2025-06-21 16:17:33'),
(177, 'iCK8J9uwPFpXpaBXd6M9o5BuP0CeE2amFIt9Psgn', 1, 'http://127.0.0.1:8000/admin', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-21 16:19:16', '2025-06-21 16:19:16'),
(178, 'BbHIIcqrQJAx6mKfd1f9ImSfKn9YlO5kcrCemjDD', NULL, 'http://127.0.0.1:8000', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-21 20:39:59', '2025-06-21 20:39:59'),
(179, 'BbHIIcqrQJAx6mKfd1f9ImSfKn9YlO5kcrCemjDD', NULL, 'http://127.0.0.1:8000/increment-view/153', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-21 20:40:58', '2025-06-21 20:40:58'),
(180, 'BbHIIcqrQJAx6mKfd1f9ImSfKn9YlO5kcrCemjDD', NULL, 'http://127.0.0.1:8000', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-21 20:42:50', '2025-06-21 20:42:50'),
(181, 'BbHIIcqrQJAx6mKfd1f9ImSfKn9YlO5kcrCemjDD', NULL, 'http://127.0.0.1:8000', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-21 20:45:00', '2025-06-21 20:45:00'),
(182, 'BbHIIcqrQJAx6mKfd1f9ImSfKn9YlO5kcrCemjDD', NULL, 'http://127.0.0.1:8000/login', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-21 20:47:45', '2025-06-21 20:47:45'),
(183, 'BbHIIcqrQJAx6mKfd1f9ImSfKn9YlO5kcrCemjDD', NULL, 'http://127.0.0.1:8000/login', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-21 20:47:50', '2025-06-21 20:47:50'),
(184, 'EtbwVE4PgOrMnRKyjnkXuUl8I75Ox3d5PReONii1', 1, 'http://127.0.0.1:8000/admin', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-21 20:47:54', '2025-06-21 20:47:54'),
(185, 'EtbwVE4PgOrMnRKyjnkXuUl8I75Ox3d5PReONii1', 1, 'http://127.0.0.1:8000/admin', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-21 20:48:26', '2025-06-21 20:48:26'),
(186, 'EtbwVE4PgOrMnRKyjnkXuUl8I75Ox3d5PReONii1', 1, 'http://127.0.0.1:8000/admin/products', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-21 20:48:32', '2025-06-21 20:48:32'),
(187, 'EtbwVE4PgOrMnRKyjnkXuUl8I75Ox3d5PReONii1', 1, 'http://127.0.0.1:8000/admin', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-21 20:53:01', '2025-06-21 20:53:01'),
(188, 'EtbwVE4PgOrMnRKyjnkXuUl8I75Ox3d5PReONii1', 1, 'http://127.0.0.1:8000/admin', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-21 20:54:58', '2025-06-21 20:54:58'),
(189, 'EtbwVE4PgOrMnRKyjnkXuUl8I75Ox3d5PReONii1', 1, 'http://127.0.0.1:8000/admin', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-21 20:58:01', '2025-06-21 20:58:01'),
(190, 'EtbwVE4PgOrMnRKyjnkXuUl8I75Ox3d5PReONii1', 1, 'http://127.0.0.1:8000/admin', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-21 21:01:06', '2025-06-21 21:01:06'),
(191, 'EtbwVE4PgOrMnRKyjnkXuUl8I75Ox3d5PReONii1', 1, 'http://127.0.0.1:8000/admin', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-21 21:03:32', '2025-06-21 21:03:32'),
(192, 'EtbwVE4PgOrMnRKyjnkXuUl8I75Ox3d5PReONii1', 1, 'http://127.0.0.1:8000/admin', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-21 21:04:12', '2025-06-21 21:04:12'),
(193, 'EtbwVE4PgOrMnRKyjnkXuUl8I75Ox3d5PReONii1', 1, 'http://127.0.0.1:8000/admin', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-21 21:04:19', '2025-06-21 21:04:19'),
(194, 'EtbwVE4PgOrMnRKyjnkXuUl8I75Ox3d5PReONii1', 1, 'http://127.0.0.1:8000/admin', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-21 21:04:28', '2025-06-21 21:04:28'),
(195, 'EtbwVE4PgOrMnRKyjnkXuUl8I75Ox3d5PReONii1', 1, 'http://127.0.0.1:8000/admin', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-21 21:06:02', '2025-06-21 21:06:02'),
(196, 'EtbwVE4PgOrMnRKyjnkXuUl8I75Ox3d5PReONii1', 1, 'http://127.0.0.1:8000/admin', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-21 21:06:34', '2025-06-21 21:06:34'),
(197, 'EtbwVE4PgOrMnRKyjnkXuUl8I75Ox3d5PReONii1', 1, 'http://127.0.0.1:8000/admin', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-21 21:07:08', '2025-06-21 21:07:08'),
(198, 'EtbwVE4PgOrMnRKyjnkXuUl8I75Ox3d5PReONii1', 1, 'http://127.0.0.1:8000/admin', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-21 21:07:28', '2025-06-21 21:07:28'),
(199, 'EtbwVE4PgOrMnRKyjnkXuUl8I75Ox3d5PReONii1', 1, 'http://127.0.0.1:8000/admin', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-21 21:07:41', '2025-06-21 21:07:41'),
(200, 'EtbwVE4PgOrMnRKyjnkXuUl8I75Ox3d5PReONii1', 1, 'http://127.0.0.1:8000/admin', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-21 21:08:27', '2025-06-21 21:08:27'),
(201, 'EtbwVE4PgOrMnRKyjnkXuUl8I75Ox3d5PReONii1', 1, 'http://127.0.0.1:8000/admin', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-21 21:09:04', '2025-06-21 21:09:04'),
(202, 'EtbwVE4PgOrMnRKyjnkXuUl8I75Ox3d5PReONii1', 1, 'http://127.0.0.1:8000/admin', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-21 21:26:32', '2025-06-21 21:26:32'),
(203, 'EtbwVE4PgOrMnRKyjnkXuUl8I75Ox3d5PReONii1', 1, 'http://127.0.0.1:8000/admin', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-21 21:29:08', '2025-06-21 21:29:08'),
(204, 'EtbwVE4PgOrMnRKyjnkXuUl8I75Ox3d5PReONii1', 1, 'http://127.0.0.1:8000/admin', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-21 21:29:17', '2025-06-21 21:29:17'),
(205, 'EtbwVE4PgOrMnRKyjnkXuUl8I75Ox3d5PReONii1', 1, 'http://127.0.0.1:8000/admin', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-21 21:29:58', '2025-06-21 21:29:58'),
(206, 'EtbwVE4PgOrMnRKyjnkXuUl8I75Ox3d5PReONii1', 1, 'http://127.0.0.1:8000/admin', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-21 21:31:04', '2025-06-21 21:31:04'),
(207, 'EtbwVE4PgOrMnRKyjnkXuUl8I75Ox3d5PReONii1', 1, 'http://127.0.0.1:8000/admin', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-21 21:31:24', '2025-06-21 21:31:24'),
(208, 'EtbwVE4PgOrMnRKyjnkXuUl8I75Ox3d5PReONii1', 1, 'http://127.0.0.1:8000/admin', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-21 21:31:43', '2025-06-21 21:31:43');
INSERT INTO `page_views` (`id`, `session_id`, `user_id`, `url`, `ip_address`, `user_agent`, `duration`, `created_at`, `updated_at`) VALUES
(209, 'EtbwVE4PgOrMnRKyjnkXuUl8I75Ox3d5PReONii1', 1, 'http://127.0.0.1:8000/admin', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-21 21:31:58', '2025-06-21 21:31:58'),
(210, 'EtbwVE4PgOrMnRKyjnkXuUl8I75Ox3d5PReONii1', 1, 'http://127.0.0.1:8000/admin', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-21 21:34:01', '2025-06-21 21:34:01'),
(211, 'EtbwVE4PgOrMnRKyjnkXuUl8I75Ox3d5PReONii1', 1, 'http://127.0.0.1:8000/admin', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-21 21:34:18', '2025-06-21 21:34:18'),
(212, 'EtbwVE4PgOrMnRKyjnkXuUl8I75Ox3d5PReONii1', 1, 'http://127.0.0.1:8000/admin', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-21 21:35:07', '2025-06-21 21:35:07'),
(213, 'EtbwVE4PgOrMnRKyjnkXuUl8I75Ox3d5PReONii1', 1, 'http://127.0.0.1:8000/admin', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-21 21:37:12', '2025-06-21 21:37:12'),
(214, 'EtbwVE4PgOrMnRKyjnkXuUl8I75Ox3d5PReONii1', 1, 'http://127.0.0.1:8000/admin', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-21 21:41:50', '2025-06-21 21:41:50'),
(215, 'EtbwVE4PgOrMnRKyjnkXuUl8I75Ox3d5PReONii1', 1, 'http://127.0.0.1:8000/admin', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-21 21:47:57', '2025-06-21 21:47:57'),
(216, 'EtbwVE4PgOrMnRKyjnkXuUl8I75Ox3d5PReONii1', 1, 'http://127.0.0.1:8000/admin', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-21 21:58:33', '2025-06-21 21:58:33'),
(217, 'EtbwVE4PgOrMnRKyjnkXuUl8I75Ox3d5PReONii1', 1, 'http://127.0.0.1:8000/admin', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-21 22:02:22', '2025-06-21 22:02:22'),
(218, 'EtbwVE4PgOrMnRKyjnkXuUl8I75Ox3d5PReONii1', 1, 'http://127.0.0.1:8000/admin', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-21 22:03:14', '2025-06-21 22:03:14'),
(219, 'EtbwVE4PgOrMnRKyjnkXuUl8I75Ox3d5PReONii1', 1, 'http://127.0.0.1:8000/admin', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-21 22:04:53', '2025-06-21 22:04:53'),
(220, 'EtbwVE4PgOrMnRKyjnkXuUl8I75Ox3d5PReONii1', 1, 'http://127.0.0.1:8000/admin', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-21 22:07:31', '2025-06-21 22:07:31'),
(221, 'EtbwVE4PgOrMnRKyjnkXuUl8I75Ox3d5PReONii1', 1, 'http://127.0.0.1:8000/admin', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-21 22:07:39', '2025-06-21 22:07:39'),
(222, 'EtbwVE4PgOrMnRKyjnkXuUl8I75Ox3d5PReONii1', 1, 'http://127.0.0.1:8000/admin', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-21 22:08:11', '2025-06-21 22:08:11'),
(223, 'EtbwVE4PgOrMnRKyjnkXuUl8I75Ox3d5PReONii1', 1, 'http://127.0.0.1:8000/admin', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-21 22:08:44', '2025-06-21 22:08:44'),
(224, 'EtbwVE4PgOrMnRKyjnkXuUl8I75Ox3d5PReONii1', 1, 'http://127.0.0.1:8000/admin', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-21 22:09:26', '2025-06-21 22:09:26'),
(225, 'EtbwVE4PgOrMnRKyjnkXuUl8I75Ox3d5PReONii1', 1, 'http://127.0.0.1:8000/admin', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-21 22:10:49', '2025-06-21 22:10:49'),
(226, 'EtbwVE4PgOrMnRKyjnkXuUl8I75Ox3d5PReONii1', 1, 'http://127.0.0.1:8000/admin', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-21 22:11:41', '2025-06-21 22:11:41'),
(227, 'EtbwVE4PgOrMnRKyjnkXuUl8I75Ox3d5PReONii1', 1, 'http://127.0.0.1:8000/admin', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-21 22:12:02', '2025-06-21 22:12:02'),
(228, 'EtbwVE4PgOrMnRKyjnkXuUl8I75Ox3d5PReONii1', 1, 'http://127.0.0.1:8000/admin', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-21 22:14:49', '2025-06-21 22:14:49'),
(229, 'EtbwVE4PgOrMnRKyjnkXuUl8I75Ox3d5PReONii1', 1, 'http://127.0.0.1:8000/admin', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-21 22:14:56', '2025-06-21 22:14:56'),
(230, 'EtbwVE4PgOrMnRKyjnkXuUl8I75Ox3d5PReONii1', 1, 'http://127.0.0.1:8000/admin', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-21 22:15:04', '2025-06-21 22:15:04'),
(231, 'EtbwVE4PgOrMnRKyjnkXuUl8I75Ox3d5PReONii1', 1, 'http://127.0.0.1:8000/admin', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-21 22:16:24', '2025-06-21 22:16:24'),
(232, 'EtbwVE4PgOrMnRKyjnkXuUl8I75Ox3d5PReONii1', 1, 'http://127.0.0.1:8000', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-21 22:25:01', '2025-06-21 22:25:01'),
(233, 'EtbwVE4PgOrMnRKyjnkXuUl8I75Ox3d5PReONii1', 1, 'http://127.0.0.1:8000/admin', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-21 22:25:06', '2025-06-21 22:25:06'),
(234, 'EtbwVE4PgOrMnRKyjnkXuUl8I75Ox3d5PReONii1', 1, 'http://127.0.0.1:8000/admin', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-21 22:25:17', '2025-06-21 22:25:17'),
(235, 'dg36PX23hxDuYpNbU29PyfdRumEAqYq8suvoLj5V', NULL, 'http://127.0.0.1:8000', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', NULL, '2025-06-22 12:19:46', '2025-06-22 12:19:46'),
(236, 'xMwdgXphO88nHWf2FcCLinr93X40cZojuUCi5uOH', 71, 'http://127.0.0.1:8000', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-22 12:19:50', '2025-06-22 12:19:50'),
(237, 'xMwdgXphO88nHWf2FcCLinr93X40cZojuUCi5uOH', 71, 'http://127.0.0.1:8000', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-22 12:20:01', '2025-06-22 12:20:01'),
(238, 'xMwdgXphO88nHWf2FcCLinr93X40cZojuUCi5uOH', 71, 'http://127.0.0.1:8000', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-22 12:20:12', '2025-06-22 12:20:12'),
(239, 'xMwdgXphO88nHWf2FcCLinr93X40cZojuUCi5uOH', 71, 'http://127.0.0.1:8000', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-22 12:20:22', '2025-06-22 12:20:22'),
(240, 'dg36PX23hxDuYpNbU29PyfdRumEAqYq8suvoLj5V', NULL, 'http://127.0.0.1:8000', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', NULL, '2025-06-22 12:20:26', '2025-06-22 12:20:26'),
(241, 'xMwdgXphO88nHWf2FcCLinr93X40cZojuUCi5uOH', 71, 'http://127.0.0.1:8000', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-22 12:20:33', '2025-06-22 12:20:33'),
(242, 'dg36PX23hxDuYpNbU29PyfdRumEAqYq8suvoLj5V', NULL, 'http://127.0.0.1:8000/chatbot/ask', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', NULL, '2025-06-22 12:20:43', '2025-06-22 12:20:43'),
(243, 'dg36PX23hxDuYpNbU29PyfdRumEAqYq8suvoLj5V', NULL, 'http://127.0.0.1:8000/chatbot/ask', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', NULL, '2025-06-22 12:20:57', '2025-06-22 12:20:57'),
(244, 'dg36PX23hxDuYpNbU29PyfdRumEAqYq8suvoLj5V', NULL, 'http://127.0.0.1:8000/chatbot/ask', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', NULL, '2025-06-22 12:21:28', '2025-06-22 12:21:28'),
(245, 'dg36PX23hxDuYpNbU29PyfdRumEAqYq8suvoLj5V', NULL, 'http://127.0.0.1:8000/chatbot/ask', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', NULL, '2025-06-22 12:21:52', '2025-06-22 12:21:52'),
(246, 'dg36PX23hxDuYpNbU29PyfdRumEAqYq8suvoLj5V', NULL, 'http://127.0.0.1:8000/chatbot/ask', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', NULL, '2025-06-22 12:22:35', '2025-06-22 12:22:35'),
(247, 'dg36PX23hxDuYpNbU29PyfdRumEAqYq8suvoLj5V', NULL, 'http://127.0.0.1:8000/chatbot/ask', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', NULL, '2025-06-22 12:23:47', '2025-06-22 12:23:47'),
(248, 'dg36PX23hxDuYpNbU29PyfdRumEAqYq8suvoLj5V', NULL, 'http://127.0.0.1:8000/chatbot/ask', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', NULL, '2025-06-22 12:24:09', '2025-06-22 12:24:09'),
(249, 'dg36PX23hxDuYpNbU29PyfdRumEAqYq8suvoLj5V', NULL, 'http://127.0.0.1:8000/chatbot/ask', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', NULL, '2025-06-22 12:24:37', '2025-06-22 12:24:37'),
(250, 'dg36PX23hxDuYpNbU29PyfdRumEAqYq8suvoLj5V', NULL, 'http://127.0.0.1:8000/chatbot/ask', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', NULL, '2025-06-22 12:25:10', '2025-06-22 12:25:10'),
(251, 'dg36PX23hxDuYpNbU29PyfdRumEAqYq8suvoLj5V', NULL, 'http://127.0.0.1:8000/chatbot/ask', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', NULL, '2025-06-22 12:30:26', '2025-06-22 12:30:26'),
(252, 'dg36PX23hxDuYpNbU29PyfdRumEAqYq8suvoLj5V', NULL, 'http://127.0.0.1:8000/chatbot/ask', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', NULL, '2025-06-22 12:30:54', '2025-06-22 12:30:54'),
(253, 'dg36PX23hxDuYpNbU29PyfdRumEAqYq8suvoLj5V', NULL, 'http://127.0.0.1:8000/chatbot/ask', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', NULL, '2025-06-22 12:32:43', '2025-06-22 12:32:43'),
(254, 'dg36PX23hxDuYpNbU29PyfdRumEAqYq8suvoLj5V', NULL, 'http://127.0.0.1:8000/chatbot/ask', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', NULL, '2025-06-22 12:33:14', '2025-06-22 12:33:14'),
(255, 'dg36PX23hxDuYpNbU29PyfdRumEAqYq8suvoLj5V', NULL, 'http://127.0.0.1:8000/chatbot/ask', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', NULL, '2025-06-22 12:34:11', '2025-06-22 12:34:11'),
(256, 'dg36PX23hxDuYpNbU29PyfdRumEAqYq8suvoLj5V', NULL, 'http://127.0.0.1:8000/shop', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', NULL, '2025-06-22 12:36:06', '2025-06-22 12:36:06'),
(257, 'xMwdgXphO88nHWf2FcCLinr93X40cZojuUCi5uOH', 71, 'http://127.0.0.1:8000', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-22 12:36:13', '2025-06-22 12:36:13'),
(258, 'xMwdgXphO88nHWf2FcCLinr93X40cZojuUCi5uOH', 71, 'http://127.0.0.1:8000', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-22 12:36:29', '2025-06-22 12:36:29'),
(259, 'xMwdgXphO88nHWf2FcCLinr93X40cZojuUCi5uOH', 71, 'http://127.0.0.1:8000', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-22 12:36:40', '2025-06-22 12:36:40'),
(260, 'xMwdgXphO88nHWf2FcCLinr93X40cZojuUCi5uOH', 71, 'http://127.0.0.1:8000', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-22 12:36:51', '2025-06-22 12:36:51'),
(261, 'xMwdgXphO88nHWf2FcCLinr93X40cZojuUCi5uOH', 71, 'http://127.0.0.1:8000/compare', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-22 12:38:06', '2025-06-22 12:38:06'),
(262, 'xMwdgXphO88nHWf2FcCLinr93X40cZojuUCi5uOH', 71, 'http://127.0.0.1:8000/compare', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-22 12:38:19', '2025-06-22 12:38:19'),
(263, 'xMwdgXphO88nHWf2FcCLinr93X40cZojuUCi5uOH', 71, 'http://127.0.0.1:8000/compare', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-22 12:38:31', '2025-06-22 12:38:31'),
(264, 'xMwdgXphO88nHWf2FcCLinr93X40cZojuUCi5uOH', 71, 'http://127.0.0.1:8000/compare', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-22 12:38:43', '2025-06-22 12:38:43'),
(265, 'xMwdgXphO88nHWf2FcCLinr93X40cZojuUCi5uOH', 71, 'http://127.0.0.1:8000/compare', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-22 12:38:55', '2025-06-22 12:38:55'),
(266, 'xMwdgXphO88nHWf2FcCLinr93X40cZojuUCi5uOH', 71, 'http://127.0.0.1:8000/compare', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-22 12:39:08', '2025-06-22 12:39:08'),
(267, 'xMwdgXphO88nHWf2FcCLinr93X40cZojuUCi5uOH', 71, 'http://127.0.0.1:8000/compare', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-22 12:39:19', '2025-06-22 12:39:19'),
(268, 'xMwdgXphO88nHWf2FcCLinr93X40cZojuUCi5uOH', 71, 'http://127.0.0.1:8000', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-22 12:40:10', '2025-06-22 12:40:10'),
(269, 'xMwdgXphO88nHWf2FcCLinr93X40cZojuUCi5uOH', 71, 'http://127.0.0.1:8000', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-22 12:40:30', '2025-06-22 12:40:30'),
(270, 'dg36PX23hxDuYpNbU29PyfdRumEAqYq8suvoLj5V', NULL, 'http://127.0.0.1:8000', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', NULL, '2025-06-22 12:40:46', '2025-06-22 12:40:46'),
(271, 'xMwdgXphO88nHWf2FcCLinr93X40cZojuUCi5uOH', 71, 'http://127.0.0.1:8000', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-22 12:40:54', '2025-06-22 12:40:54'),
(272, 'dg36PX23hxDuYpNbU29PyfdRumEAqYq8suvoLj5V', NULL, 'http://127.0.0.1:8000/login', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', NULL, '2025-06-22 12:41:01', '2025-06-22 12:41:01'),
(273, 'xMwdgXphO88nHWf2FcCLinr93X40cZojuUCi5uOH', 71, 'http://127.0.0.1:8000', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-22 12:41:18', '2025-06-22 12:41:18'),
(274, 'dg36PX23hxDuYpNbU29PyfdRumEAqYq8suvoLj5V', NULL, 'http://127.0.0.1:8000/login', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', NULL, '2025-06-22 12:41:18', '2025-06-22 12:41:18'),
(275, 'xMwdgXphO88nHWf2FcCLinr93X40cZojuUCi5uOH', 71, 'http://127.0.0.1:8000', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-22 12:41:26', '2025-06-22 12:41:26'),
(276, 'VfI3Ng47UpIMrX97lhF6RJo0SwReAHQej0M2pgFl', 1, 'http://127.0.0.1:8000/admin', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', NULL, '2025-06-22 12:41:27', '2025-06-22 12:41:27'),
(277, 'xMwdgXphO88nHWf2FcCLinr93X40cZojuUCi5uOH', 71, 'http://127.0.0.1:8000', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-22 12:41:35', '2025-06-22 12:41:35'),
(278, 'xMwdgXphO88nHWf2FcCLinr93X40cZojuUCi5uOH', 71, 'http://127.0.0.1:8000', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-22 12:41:45', '2025-06-22 12:41:45'),
(279, 'xMwdgXphO88nHWf2FcCLinr93X40cZojuUCi5uOH', 71, 'http://127.0.0.1:8000', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-22 12:41:55', '2025-06-22 12:41:55'),
(280, 'xMwdgXphO88nHWf2FcCLinr93X40cZojuUCi5uOH', 71, 'http://127.0.0.1:8000', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-22 12:42:06', '2025-06-22 12:42:06'),
(281, 'xMwdgXphO88nHWf2FcCLinr93X40cZojuUCi5uOH', 71, 'http://127.0.0.1:8000', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-22 12:42:18', '2025-06-22 12:42:18'),
(282, 'VfI3Ng47UpIMrX97lhF6RJo0SwReAHQej0M2pgFl', 1, 'http://127.0.0.1:8000', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', NULL, '2025-06-22 12:42:51', '2025-06-22 12:42:51'),
(283, 'xMwdgXphO88nHWf2FcCLinr93X40cZojuUCi5uOH', 71, 'http://127.0.0.1:8000/compare', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-22 12:43:06', '2025-06-22 12:43:06'),
(284, 'VfI3Ng47UpIMrX97lhF6RJo0SwReAHQej0M2pgFl', 1, 'http://127.0.0.1:8000/admin', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', NULL, '2025-06-22 12:43:10', '2025-06-22 12:43:10'),
(285, 'VfI3Ng47UpIMrX97lhF6RJo0SwReAHQej0M2pgFl', 1, 'http://127.0.0.1:8000/admin', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', NULL, '2025-06-22 12:43:20', '2025-06-22 12:43:20'),
(286, 'xMwdgXphO88nHWf2FcCLinr93X40cZojuUCi5uOH', 71, 'http://127.0.0.1:8000/chatbot/ask', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-22 12:46:33', '2025-06-22 12:46:33'),
(287, 'xMwdgXphO88nHWf2FcCLinr93X40cZojuUCi5uOH', 71, 'http://127.0.0.1:8000/chatbot/ask', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-22 12:46:43', '2025-06-22 12:46:43'),
(288, 'xMwdgXphO88nHWf2FcCLinr93X40cZojuUCi5uOH', 71, 'http://127.0.0.1:8000/chatbot/ask', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-22 12:47:02', '2025-06-22 12:47:02'),
(289, 'VfI3Ng47UpIMrX97lhF6RJo0SwReAHQej0M2pgFl', 1, 'http://127.0.0.1:8000', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', NULL, '2025-06-22 12:47:00', '2025-06-22 12:47:00'),
(290, 'xMwdgXphO88nHWf2FcCLinr93X40cZojuUCi5uOH', 71, 'http://127.0.0.1:8000/chatbot/ask', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-22 12:47:21', '2025-06-22 12:47:21'),
(291, 'VfI3Ng47UpIMrX97lhF6RJo0SwReAHQej0M2pgFl', 1, 'http://127.0.0.1:8000/compare', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', NULL, '2025-06-22 12:47:35', '2025-06-22 12:47:35'),
(292, 'VfI3Ng47UpIMrX97lhF6RJo0SwReAHQej0M2pgFl', 1, 'http://127.0.0.1:8000/shop', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', NULL, '2025-06-22 12:47:52', '2025-06-22 12:47:52'),
(293, 'xMwdgXphO88nHWf2FcCLinr93X40cZojuUCi5uOH', 71, 'http://127.0.0.1:8000', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-22 12:52:58', '2025-06-22 12:52:58'),
(294, 'VfI3Ng47UpIMrX97lhF6RJo0SwReAHQej0M2pgFl', 1, 'http://127.0.0.1:8000', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', NULL, '2025-06-22 13:01:04', '2025-06-22 13:01:04'),
(295, 'VfI3Ng47UpIMrX97lhF6RJo0SwReAHQej0M2pgFl', 1, 'http://127.0.0.1:8000/admin', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', NULL, '2025-06-22 13:06:36', '2025-06-22 13:06:36'),
(296, 'VfI3Ng47UpIMrX97lhF6RJo0SwReAHQej0M2pgFl', 1, 'http://127.0.0.1:8000/admin', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', NULL, '2025-06-22 13:06:54', '2025-06-22 13:06:54'),
(297, 'VfI3Ng47UpIMrX97lhF6RJo0SwReAHQej0M2pgFl', 1, 'http://127.0.0.1:8000/admin/variants', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', NULL, '2025-06-22 13:08:31', '2025-06-22 13:08:31'),
(298, 'VfI3Ng47UpIMrX97lhF6RJo0SwReAHQej0M2pgFl', 1, 'http://127.0.0.1:8000/admin/products', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', NULL, '2025-06-22 13:08:40', '2025-06-22 13:08:40'),
(299, 'VfI3Ng47UpIMrX97lhF6RJo0SwReAHQej0M2pgFl', 1, 'http://127.0.0.1:8000/admin', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', NULL, '2025-06-22 13:09:54', '2025-06-22 13:09:54'),
(300, 'FWRxDeJ4IDjoS5kfPD0sNfrQ7YvxABhvM1gSvk5R', NULL, 'http://127.0.0.1:8000', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-22 13:23:17', '2025-06-22 13:23:17'),
(301, 'FWRxDeJ4IDjoS5kfPD0sNfrQ7YvxABhvM1gSvk5R', NULL, 'http://127.0.0.1:8000/login', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-22 13:23:25', '2025-06-22 13:23:25'),
(302, 'FWRxDeJ4IDjoS5kfPD0sNfrQ7YvxABhvM1gSvk5R', NULL, 'http://127.0.0.1:8000/login', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-22 13:23:31', '2025-06-22 13:23:31'),
(303, '1HN5cgT6GobTyQ06lLIO3WybGtFZqpQDbnH11vMA', 1, 'http://127.0.0.1:8000/admin', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-22 13:23:34', '2025-06-22 13:23:34'),
(304, 'hXYI5W8ex68X6HkoBlYukFBLo5sBADnFjTLBpQ0l', NULL, 'http://127.0.0.1:8000', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', NULL, '2025-06-23 08:58:56', '2025-06-23 08:58:56'),
(305, 'rzTHP2QkrhDWRzLrcWaGEmMf1s40VMaLt33H3hFj', NULL, 'http://127.0.0.1:8000/login', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', NULL, '2025-06-23 08:59:11', '2025-06-23 08:59:11'),
(306, 'rzTHP2QkrhDWRzLrcWaGEmMf1s40VMaLt33H3hFj', NULL, 'http://127.0.0.1:8000/login', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', NULL, '2025-06-23 08:59:21', '2025-06-23 08:59:21'),
(307, 'rzTHP2QkrhDWRzLrcWaGEmMf1s40VMaLt33H3hFj', NULL, 'http://127.0.0.1:8000/login', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', NULL, '2025-06-23 08:59:25', '2025-06-23 08:59:25'),
(308, 'rzTHP2QkrhDWRzLrcWaGEmMf1s40VMaLt33H3hFj', NULL, 'http://127.0.0.1:8000/login', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', NULL, '2025-06-23 08:59:27', '2025-06-23 08:59:27'),
(309, 'sAE2cHyaGPcHI61hiCSiLtewZWTy4jYxUHWa7xAa', 1, 'http://127.0.0.1:8000/admin', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', NULL, '2025-06-23 08:59:32', '2025-06-23 08:59:32'),
(310, 'sAE2cHyaGPcHI61hiCSiLtewZWTy4jYxUHWa7xAa', 1, 'http://127.0.0.1:8000', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', NULL, '2025-06-23 09:55:31', '2025-06-23 09:55:31'),
(311, 'sAE2cHyaGPcHI61hiCSiLtewZWTy4jYxUHWa7xAa', 1, 'http://127.0.0.1:8000/product/iphone-15-pro-max-1750314062', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', NULL, '2025-06-23 09:56:53', '2025-06-23 09:56:53'),
(312, 'sAE2cHyaGPcHI61hiCSiLtewZWTy4jYxUHWa7xAa', 1, 'http://127.0.0.1:8000/product/iphone-15-pro-max-1750314062', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', NULL, '2025-06-23 10:00:06', '2025-06-23 10:00:06'),
(313, 'sAE2cHyaGPcHI61hiCSiLtewZWTy4jYxUHWa7xAa', 1, 'http://127.0.0.1:8000/checkout?image=http%3A%2F%2F127.0.0.1%3A8000%2Fuploads%2Fproducts%2F1750314063_0_iphone-16-pro-max-titan-trang-thumb-650x650.png&quantity=1&variant_id=244', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', NULL, '2025-06-23 10:00:12', '2025-06-23 10:00:12'),
(314, 'sAE2cHyaGPcHI61hiCSiLtewZWTy4jYxUHWa7xAa', 1, 'http://127.0.0.1:8000/product/iphone-15-pro-max-1750314062', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', NULL, '2025-06-23 10:00:13', '2025-06-23 10:00:13'),
(315, 'sAE2cHyaGPcHI61hiCSiLtewZWTy4jYxUHWa7xAa', 1, 'http://127.0.0.1:8000/logout', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', NULL, '2025-06-23 10:00:23', '2025-06-23 10:00:23'),
(316, 'hrTESEsQfRc7SpZ6VDQ7qTZASbHf3DdhbyU2iR2A', NULL, 'http://127.0.0.1:8000/login', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', NULL, '2025-06-23 10:00:25', '2025-06-23 10:00:25'),
(317, 'hrTESEsQfRc7SpZ6VDQ7qTZASbHf3DdhbyU2iR2A', NULL, 'http://127.0.0.1:8000/auth/google', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', NULL, '2025-06-23 10:00:30', '2025-06-23 10:00:30'),
(318, 'hrTESEsQfRc7SpZ6VDQ7qTZASbHf3DdhbyU2iR2A', NULL, 'http://127.0.0.1:8000/register', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', NULL, '2025-06-23 10:01:01', '2025-06-23 10:01:01'),
(319, 'hrTESEsQfRc7SpZ6VDQ7qTZASbHf3DdhbyU2iR2A', NULL, 'http://127.0.0.1:8000/register', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', NULL, '2025-06-23 10:01:50', '2025-06-23 10:01:50'),
(320, 'hrTESEsQfRc7SpZ6VDQ7qTZASbHf3DdhbyU2iR2A', NULL, 'http://127.0.0.1:8000/register', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', NULL, '2025-06-23 10:01:53', '2025-06-23 10:01:53'),
(321, 'hrTESEsQfRc7SpZ6VDQ7qTZASbHf3DdhbyU2iR2A', NULL, 'http://127.0.0.1:8000/register', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', NULL, '2025-06-23 10:04:58', '2025-06-23 10:04:58'),
(322, 'hrTESEsQfRc7SpZ6VDQ7qTZASbHf3DdhbyU2iR2A', NULL, 'http://127.0.0.1:8000/register', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', NULL, '2025-06-23 10:04:59', '2025-06-23 10:04:59'),
(323, 'hrTESEsQfRc7SpZ6VDQ7qTZASbHf3DdhbyU2iR2A', NULL, 'http://127.0.0.1:8000/login', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', NULL, '2025-06-23 10:06:41', '2025-06-23 10:06:41'),
(324, 'hrTESEsQfRc7SpZ6VDQ7qTZASbHf3DdhbyU2iR2A', NULL, 'http://127.0.0.1:8000/login', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', NULL, '2025-06-23 10:06:50', '2025-06-23 10:06:50'),
(325, 'MwUv5wPJthdsCy91WEQS5lQGOy73uhpDTERJKUn3', 71, 'http://127.0.0.1:8000', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', NULL, '2025-06-23 10:06:53', '2025-06-23 10:06:53'),
(326, 'MwUv5wPJthdsCy91WEQS5lQGOy73uhpDTERJKUn3', 71, 'http://127.0.0.1:8000/product/airpods-pro-2nd-gen-usb-c-1750313767', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', NULL, '2025-06-23 10:06:59', '2025-06-23 10:06:59'),
(327, 'MwUv5wPJthdsCy91WEQS5lQGOy73uhpDTERJKUn3', 71, 'http://127.0.0.1:8000/product/iphone-15-pro-max-1750314062', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', NULL, '2025-06-23 10:07:01', '2025-06-23 10:07:01'),
(328, 'MwUv5wPJthdsCy91WEQS5lQGOy73uhpDTERJKUn3', 71, 'http://127.0.0.1:8000/checkout?image=http%3A%2F%2F127.0.0.1%3A8000%2Fuploads%2Fproducts%2F1750314063_0_iphone-16-pro-max-titan-trang-thumb-650x650.png&quantity=1&variant_id=244', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', NULL, '2025-06-23 10:07:11', '2025-06-23 10:07:11'),
(329, 'MwUv5wPJthdsCy91WEQS5lQGOy73uhpDTERJKUn3', 71, 'http://127.0.0.1:8000/checkout', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', NULL, '2025-06-23 10:07:29', '2025-06-23 10:07:29'),
(330, 'MwUv5wPJthdsCy91WEQS5lQGOy73uhpDTERJKUn3', 71, 'http://127.0.0.1:8000/order', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', NULL, '2025-06-23 10:07:54', '2025-06-23 10:07:54'),
(331, 'MwUv5wPJthdsCy91WEQS5lQGOy73uhpDTERJKUn3', 71, 'http://127.0.0.1:8000/order', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', NULL, '2025-06-23 10:11:39', '2025-06-23 10:11:39'),
(332, 'MwUv5wPJthdsCy91WEQS5lQGOy73uhpDTERJKUn3', 71, 'http://127.0.0.1:8000/order', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', NULL, '2025-06-23 10:21:22', '2025-06-23 10:21:22'),
(333, 'MwUv5wPJthdsCy91WEQS5lQGOy73uhpDTERJKUn3', 71, 'http://127.0.0.1:8000/order', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', NULL, '2025-06-23 10:22:18', '2025-06-23 10:22:18'),
(334, 'MwUv5wPJthdsCy91WEQS5lQGOy73uhpDTERJKUn3', 71, 'http://127.0.0.1:8000/order', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', NULL, '2025-06-23 10:22:41', '2025-06-23 10:22:41'),
(335, 'MwUv5wPJthdsCy91WEQS5lQGOy73uhpDTERJKUn3', 71, 'http://127.0.0.1:8000/order', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', NULL, '2025-06-23 10:23:01', '2025-06-23 10:23:01'),
(336, 'MwUv5wPJthdsCy91WEQS5lQGOy73uhpDTERJKUn3', 71, 'http://127.0.0.1:8000/order', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', NULL, '2025-06-23 10:43:04', '2025-06-23 10:43:04'),
(337, 'MwUv5wPJthdsCy91WEQS5lQGOy73uhpDTERJKUn3', 71, 'http://127.0.0.1:8000', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', NULL, '2025-06-23 11:00:22', '2025-06-23 11:00:22'),
(338, 'MwUv5wPJthdsCy91WEQS5lQGOy73uhpDTERJKUn3', 71, 'http://127.0.0.1:8000/admin', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', NULL, '2025-06-23 11:00:29', '2025-06-23 11:00:29'),
(339, 'MwUv5wPJthdsCy91WEQS5lQGOy73uhpDTERJKUn3', 71, 'http://127.0.0.1:8000/admin', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', NULL, '2025-06-23 11:00:30', '2025-06-23 11:00:30'),
(340, 'MwUv5wPJthdsCy91WEQS5lQGOy73uhpDTERJKUn3', 71, 'http://127.0.0.1:8000/admin', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', NULL, '2025-06-23 11:04:15', '2025-06-23 11:04:15'),
(341, 'MwUv5wPJthdsCy91WEQS5lQGOy73uhpDTERJKUn3', 71, 'http://127.0.0.1:8000', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', NULL, '2025-06-23 11:04:25', '2025-06-23 11:04:25'),
(342, 'MwUv5wPJthdsCy91WEQS5lQGOy73uhpDTERJKUn3', 71, 'http://127.0.0.1:8000/profile', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', NULL, '2025-06-23 11:04:35', '2025-06-23 11:04:35'),
(343, 'MwUv5wPJthdsCy91WEQS5lQGOy73uhpDTERJKUn3', 71, 'http://127.0.0.1:8000/logout', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', NULL, '2025-06-23 11:04:49', '2025-06-23 11:04:49'),
(344, 'ELRX3zbtXclf1WexQrvtfhLKySIS8QaPf6zdBQwM', NULL, 'http://127.0.0.1:8000/login', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', NULL, '2025-06-23 11:04:51', '2025-06-23 11:04:51'),
(345, 'ELRX3zbtXclf1WexQrvtfhLKySIS8QaPf6zdBQwM', NULL, 'http://127.0.0.1:8000/login', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', NULL, '2025-06-23 11:05:00', '2025-06-23 11:05:00'),
(346, 'yJY8FSnTdaqwHQTJNeFUtM3tinvlCe6KkFrY0WFe', 1, 'http://127.0.0.1:8000/admin', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', NULL, '2025-06-23 11:05:05', '2025-06-23 11:05:05'),
(347, 'yJY8FSnTdaqwHQTJNeFUtM3tinvlCe6KkFrY0WFe', 1, 'http://127.0.0.1:8000/admin/products', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', NULL, '2025-06-23 11:05:33', '2025-06-23 11:05:33'),
(348, 'yJY8FSnTdaqwHQTJNeFUtM3tinvlCe6KkFrY0WFe', 1, 'http://127.0.0.1:8000/admin/products/152/edit', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', NULL, '2025-06-23 11:05:48', '2025-06-23 11:05:48'),
(349, 'yJY8FSnTdaqwHQTJNeFUtM3tinvlCe6KkFrY0WFe', 1, 'http://127.0.0.1:8000/admin/attributes/64/values', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', NULL, '2025-06-23 11:06:25', '2025-06-23 11:06:25'),
(350, 'yJY8FSnTdaqwHQTJNeFUtM3tinvlCe6KkFrY0WFe', 1, 'http://127.0.0.1:8000/admin/attributes/63/values', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', NULL, '2025-06-23 11:06:30', '2025-06-23 11:06:30'),
(351, 'yJY8FSnTdaqwHQTJNeFUtM3tinvlCe6KkFrY0WFe', 1, 'http://127.0.0.1:8000/admin/products/152/edit', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', NULL, '2025-06-23 11:08:38', '2025-06-23 11:08:38'),
(352, 'yJY8FSnTdaqwHQTJNeFUtM3tinvlCe6KkFrY0WFe', 1, 'http://127.0.0.1:8000/admin/attributes/63/values', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', NULL, '2025-06-23 11:08:46', '2025-06-23 11:08:46'),
(353, 'yJY8FSnTdaqwHQTJNeFUtM3tinvlCe6KkFrY0WFe', 1, 'http://127.0.0.1:8000/admin/attributes/64/values', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', NULL, '2025-06-23 11:08:49', '2025-06-23 11:08:49'),
(354, 'yJY8FSnTdaqwHQTJNeFUtM3tinvlCe6KkFrY0WFe', 1, 'http://127.0.0.1:8000/admin/attributes/63/values', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', NULL, '2025-06-23 11:08:53', '2025-06-23 11:08:53'),
(355, 'yJY8FSnTdaqwHQTJNeFUtM3tinvlCe6KkFrY0WFe', 1, 'http://127.0.0.1:8000/admin/products/152/edit', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', NULL, '2025-06-23 11:09:07', '2025-06-23 11:09:07'),
(356, 'yJY8FSnTdaqwHQTJNeFUtM3tinvlCe6KkFrY0WFe', 1, 'http://127.0.0.1:8000/admin/attributes/64/values', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', NULL, '2025-06-23 11:09:40', '2025-06-23 11:09:40'),
(357, 'yJY8FSnTdaqwHQTJNeFUtM3tinvlCe6KkFrY0WFe', 1, 'http://127.0.0.1:8000/admin/attributes/63/values', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', NULL, '2025-06-23 11:09:43', '2025-06-23 11:09:43'),
(358, 'yJY8FSnTdaqwHQTJNeFUtM3tinvlCe6KkFrY0WFe', 1, 'http://127.0.0.1:8000/admin/products/152/edit', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', NULL, '2025-06-23 11:15:16', '2025-06-23 11:15:16'),
(359, 'yJY8FSnTdaqwHQTJNeFUtM3tinvlCe6KkFrY0WFe', 1, 'http://127.0.0.1:8000/admin/attributes/64/values', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', NULL, '2025-06-23 11:15:27', '2025-06-23 11:15:27'),
(360, 'yJY8FSnTdaqwHQTJNeFUtM3tinvlCe6KkFrY0WFe', 1, 'http://127.0.0.1:8000/admin/attributes/63/values', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', NULL, '2025-06-23 11:15:31', '2025-06-23 11:15:31'),
(361, 'yJY8FSnTdaqwHQTJNeFUtM3tinvlCe6KkFrY0WFe', 1, 'http://127.0.0.1:8000/admin/products/152/edit', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', NULL, '2025-06-23 11:17:34', '2025-06-23 11:17:34'),
(362, 'yJY8FSnTdaqwHQTJNeFUtM3tinvlCe6KkFrY0WFe', 1, 'http://127.0.0.1:8000/admin/attributes/64/values', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', NULL, '2025-06-23 11:17:46', '2025-06-23 11:17:46'),
(363, 'yJY8FSnTdaqwHQTJNeFUtM3tinvlCe6KkFrY0WFe', 1, 'http://127.0.0.1:8000/admin/attributes/63/values', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', NULL, '2025-06-23 11:17:50', '2025-06-23 11:17:50'),
(364, 'yJY8FSnTdaqwHQTJNeFUtM3tinvlCe6KkFrY0WFe', 1, 'http://127.0.0.1:8000/admin/products/152/edit', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', NULL, '2025-06-23 11:20:53', '2025-06-23 11:20:53'),
(365, 'yJY8FSnTdaqwHQTJNeFUtM3tinvlCe6KkFrY0WFe', 1, 'http://127.0.0.1:8000/admin/attributes/64/values', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', NULL, '2025-06-23 11:21:17', '2025-06-23 11:21:17'),
(366, 'yJY8FSnTdaqwHQTJNeFUtM3tinvlCe6KkFrY0WFe', 1, 'http://127.0.0.1:8000/admin/attributes/63/values', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', NULL, '2025-06-23 11:21:21', '2025-06-23 11:21:21'),
(367, 'yJY8FSnTdaqwHQTJNeFUtM3tinvlCe6KkFrY0WFe', 1, 'http://127.0.0.1:8000/admin/products/check-variant-duplicates', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', NULL, '2025-06-23 11:21:28', '2025-06-23 11:21:28'),
(368, 'yJY8FSnTdaqwHQTJNeFUtM3tinvlCe6KkFrY0WFe', 1, 'http://127.0.0.1:8000/admin/variants', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', NULL, '2025-06-23 11:21:43', '2025-06-23 11:21:43'),
(369, '8kVnkUsp1WTdkCt2VZ96iJytvJZ5Ca0wZ1h7YTEg', NULL, 'http://127.0.0.1:8000', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', NULL, '2025-06-23 13:25:20', '2025-06-23 13:25:20'),
(370, '4Wa3ZGkzRcvYXxIML44ufwV1sH6sn8xNl0pd78uh', NULL, 'http://127.0.0.1:8000/login', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', NULL, '2025-06-23 13:25:34', '2025-06-23 13:25:34'),
(371, '4Wa3ZGkzRcvYXxIML44ufwV1sH6sn8xNl0pd78uh', NULL, 'http://127.0.0.1:8000/login', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', NULL, '2025-06-23 13:25:46', '2025-06-23 13:25:46'),
(372, 'sA0aZjGsf63RCqQ28panNbqFt57zaAOEud9bnfNi', 1, 'http://127.0.0.1:8000/admin', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', NULL, '2025-06-23 13:25:58', '2025-06-23 13:25:58'),
(373, 'sA0aZjGsf63RCqQ28panNbqFt57zaAOEud9bnfNi', 1, 'http://127.0.0.1:8000/admin/products', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', NULL, '2025-06-23 13:26:46', '2025-06-23 13:26:46'),
(374, 'sA0aZjGsf63RCqQ28panNbqFt57zaAOEud9bnfNi', 1, 'http://127.0.0.1:8000/admin/products/152/edit', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', NULL, '2025-06-23 13:27:24', '2025-06-23 13:27:24'),
(375, 'sA0aZjGsf63RCqQ28panNbqFt57zaAOEud9bnfNi', 1, 'http://127.0.0.1:8000/admin/products/152/edit', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', NULL, '2025-06-23 13:35:17', '2025-06-23 13:35:17'),
(376, 'sA0aZjGsf63RCqQ28panNbqFt57zaAOEud9bnfNi', 1, 'http://127.0.0.1:8000/admin/products/152/edit', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', NULL, '2025-06-23 13:37:05', '2025-06-23 13:37:05'),
(377, 'sA0aZjGsf63RCqQ28panNbqFt57zaAOEud9bnfNi', 1, 'http://127.0.0.1:8000', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', NULL, '2025-06-23 13:38:18', '2025-06-23 13:38:18'),
(378, 'sA0aZjGsf63RCqQ28panNbqFt57zaAOEud9bnfNi', 1, 'http://127.0.0.1:8000', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', NULL, '2025-06-23 13:42:32', '2025-06-23 13:42:32'),
(379, 'sA0aZjGsf63RCqQ28panNbqFt57zaAOEud9bnfNi', 1, 'http://127.0.0.1:8000/admin', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', NULL, '2025-06-23 13:42:35', '2025-06-23 13:42:35'),
(380, 'sA0aZjGsf63RCqQ28panNbqFt57zaAOEud9bnfNi', 1, 'http://127.0.0.1:8000/admin', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', NULL, '2025-06-23 13:42:39', '2025-06-23 13:42:39'),
(381, 'sA0aZjGsf63RCqQ28panNbqFt57zaAOEud9bnfNi', 1, 'http://127.0.0.1:8000/admin/products', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', NULL, '2025-06-23 13:42:46', '2025-06-23 13:42:46'),
(382, 'sA0aZjGsf63RCqQ28panNbqFt57zaAOEud9bnfNi', 1, 'http://127.0.0.1:8000/admin/products/152/edit', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', NULL, '2025-06-23 13:42:58', '2025-06-23 13:42:58'),
(383, 'sA0aZjGsf63RCqQ28panNbqFt57zaAOEud9bnfNi', 1, 'http://127.0.0.1:8000/admin/attributes/64/values', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', NULL, '2025-06-23 13:43:34', '2025-06-23 13:43:34'),
(384, 'sA0aZjGsf63RCqQ28panNbqFt57zaAOEud9bnfNi', 1, 'http://127.0.0.1:8000/admin/attributes/63/values', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', NULL, '2025-06-23 13:43:45', '2025-06-23 13:43:45'),
(385, 'sA0aZjGsf63RCqQ28panNbqFt57zaAOEud9bnfNi', 1, 'http://127.0.0.1:8000/admin/products/check-duplicate-variants', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', NULL, '2025-06-23 13:43:52', '2025-06-23 13:43:52'),
(386, 'sA0aZjGsf63RCqQ28panNbqFt57zaAOEud9bnfNi', 1, 'http://127.0.0.1:8000/admin/products/check-duplicate-variants', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', NULL, '2025-06-23 13:45:15', '2025-06-23 13:45:15'),
(387, 'sA0aZjGsf63RCqQ28panNbqFt57zaAOEud9bnfNi', 1, 'http://127.0.0.1:8000/admin/products/check-duplicate-variants', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', NULL, '2025-06-23 13:45:20', '2025-06-23 13:45:20'),
(388, 'sA0aZjGsf63RCqQ28panNbqFt57zaAOEud9bnfNi', 1, 'http://127.0.0.1:8000/admin/products/check-duplicate-variants', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', NULL, '2025-06-23 13:45:26', '2025-06-23 13:45:26'),
(389, 'sA0aZjGsf63RCqQ28panNbqFt57zaAOEud9bnfNi', 1, 'http://127.0.0.1:8000/admin/products/152/edit', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', NULL, '2025-06-23 13:45:51', '2025-06-23 13:45:51'),
(390, 'sA0aZjGsf63RCqQ28panNbqFt57zaAOEud9bnfNi', 1, 'http://127.0.0.1:8000/admin/products/check-duplicate-variants', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', NULL, '2025-06-23 13:46:01', '2025-06-23 13:46:01'),
(391, 'sA0aZjGsf63RCqQ28panNbqFt57zaAOEud9bnfNi', 1, 'http://127.0.0.1:8000/admin/products/152/edit', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', NULL, '2025-06-23 13:46:20', '2025-06-23 13:46:20'),
(392, 'sA0aZjGsf63RCqQ28panNbqFt57zaAOEud9bnfNi', 1, 'http://127.0.0.1:8000/admin/products/check-duplicate-variants', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', NULL, '2025-06-23 13:46:39', '2025-06-23 13:46:39');
INSERT INTO `page_views` (`id`, `session_id`, `user_id`, `url`, `ip_address`, `user_agent`, `duration`, `created_at`, `updated_at`) VALUES
(393, 'sA0aZjGsf63RCqQ28panNbqFt57zaAOEud9bnfNi', 1, 'http://127.0.0.1:8000/admin/products/check-duplicate-variants', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', NULL, '2025-06-23 13:46:48', '2025-06-23 13:46:48'),
(394, 'sA0aZjGsf63RCqQ28panNbqFt57zaAOEud9bnfNi', 1, 'http://127.0.0.1:8000/admin/products/check-duplicate-variants', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', NULL, '2025-06-23 13:46:52', '2025-06-23 13:46:52'),
(395, 'sA0aZjGsf63RCqQ28panNbqFt57zaAOEud9bnfNi', 1, 'http://127.0.0.1:8000/admin/products/check-duplicate-variants', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', NULL, '2025-06-23 13:46:54', '2025-06-23 13:46:54'),
(396, 'sA0aZjGsf63RCqQ28panNbqFt57zaAOEud9bnfNi', 1, 'http://127.0.0.1:8000/admin/products/check-duplicate-variants', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', NULL, '2025-06-23 13:46:55', '2025-06-23 13:46:55'),
(397, 'sA0aZjGsf63RCqQ28panNbqFt57zaAOEud9bnfNi', 1, 'http://127.0.0.1:8000/admin/products/check-duplicate-variants', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', NULL, '2025-06-23 13:46:56', '2025-06-23 13:46:56'),
(398, 'sA0aZjGsf63RCqQ28panNbqFt57zaAOEud9bnfNi', 1, 'http://127.0.0.1:8000/admin/products/check-duplicate-variants', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', NULL, '2025-06-23 13:46:57', '2025-06-23 13:46:57'),
(399, 'sA0aZjGsf63RCqQ28panNbqFt57zaAOEud9bnfNi', 1, 'http://127.0.0.1:8000/admin/products/check-duplicate-variants', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', NULL, '2025-06-23 13:46:58', '2025-06-23 13:46:58'),
(400, 'sA0aZjGsf63RCqQ28panNbqFt57zaAOEud9bnfNi', 1, 'http://127.0.0.1:8000/admin/products/152/edit', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', NULL, '2025-06-23 13:50:08', '2025-06-23 13:50:08'),
(401, 'sA0aZjGsf63RCqQ28panNbqFt57zaAOEud9bnfNi', 1, 'http://127.0.0.1:8000/admin/products/check-duplicate-variants', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', NULL, '2025-06-23 13:50:26', '2025-06-23 13:50:26'),
(402, 'sA0aZjGsf63RCqQ28panNbqFt57zaAOEud9bnfNi', 1, 'http://127.0.0.1:8000/admin/products/check-duplicate-variants', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', NULL, '2025-06-23 13:50:28', '2025-06-23 13:50:28'),
(403, 'sA0aZjGsf63RCqQ28panNbqFt57zaAOEud9bnfNi', 1, 'http://127.0.0.1:8000/admin/products/check-duplicate-variants', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', NULL, '2025-06-23 13:50:35', '2025-06-23 13:50:35'),
(404, 'sA0aZjGsf63RCqQ28panNbqFt57zaAOEud9bnfNi', 1, 'http://127.0.0.1:8000/admin/products/152/edit', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', NULL, '2025-06-23 13:52:54', '2025-06-23 13:52:54'),
(405, 'sA0aZjGsf63RCqQ28panNbqFt57zaAOEud9bnfNi', 1, 'http://127.0.0.1:8000/admin/products/check-duplicate-variants', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', NULL, '2025-06-23 13:53:10', '2025-06-23 13:53:10'),
(406, 'sA0aZjGsf63RCqQ28panNbqFt57zaAOEud9bnfNi', 1, 'http://127.0.0.1:8000/admin', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', NULL, '2025-06-23 13:57:24', '2025-06-23 13:57:24'),
(407, 'sA0aZjGsf63RCqQ28panNbqFt57zaAOEud9bnfNi', 1, 'http://127.0.0.1:8000', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', NULL, '2025-06-23 13:57:27', '2025-06-23 13:57:27'),
(408, 'sA0aZjGsf63RCqQ28panNbqFt57zaAOEud9bnfNi', 1, 'http://127.0.0.1:8000/chatbot/ask', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', NULL, '2025-06-23 13:57:39', '2025-06-23 13:57:39'),
(409, 'sA0aZjGsf63RCqQ28panNbqFt57zaAOEud9bnfNi', 1, 'http://127.0.0.1:8000/chatbot/ask', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', NULL, '2025-06-23 13:57:59', '2025-06-23 13:57:59'),
(410, 'sA0aZjGsf63RCqQ28panNbqFt57zaAOEud9bnfNi', 1, 'http://127.0.0.1:8000/chatbot/ask', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', NULL, '2025-06-23 13:58:33', '2025-06-23 13:58:33'),
(411, 'sA0aZjGsf63RCqQ28panNbqFt57zaAOEud9bnfNi', 1, 'http://127.0.0.1:8000/compare', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', NULL, '2025-06-23 13:59:13', '2025-06-23 13:59:13'),
(412, 'sA0aZjGsf63RCqQ28panNbqFt57zaAOEud9bnfNi', 1, 'http://127.0.0.1:8000', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', NULL, '2025-06-23 14:00:18', '2025-06-23 14:00:18'),
(413, 'sA0aZjGsf63RCqQ28panNbqFt57zaAOEud9bnfNi', 1, 'http://127.0.0.1:8000/product/airpods-pro-2nd-gen-usb-c-1750313767', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', NULL, '2025-06-23 14:00:49', '2025-06-23 14:00:49'),
(414, 'sA0aZjGsf63RCqQ28panNbqFt57zaAOEud9bnfNi', 1, 'http://127.0.0.1:8000/product/airpods-pro-2nd-gen-usb-c-1750313767', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', NULL, '2025-06-23 14:03:34', '2025-06-23 14:03:34'),
(415, 'sA0aZjGsf63RCqQ28panNbqFt57zaAOEud9bnfNi', 1, 'http://127.0.0.1:8000/admin/products/152/edit', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', NULL, '2025-06-23 14:03:36', '2025-06-23 14:03:36'),
(416, 'sA0aZjGsf63RCqQ28panNbqFt57zaAOEud9bnfNi', 1, 'http://127.0.0.1:8000/admin/products/152/edit', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', NULL, '2025-06-23 14:04:18', '2025-06-23 14:04:18'),
(417, 'sA0aZjGsf63RCqQ28panNbqFt57zaAOEud9bnfNi', 1, 'http://127.0.0.1:8000/product/airpods-pro-2nd-gen-usb-c-1750313767', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', NULL, '2025-06-23 14:06:30', '2025-06-23 14:06:30'),
(418, 'sA0aZjGsf63RCqQ28panNbqFt57zaAOEud9bnfNi', 1, 'http://127.0.0.1:8000/admin/products/152/edit', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', NULL, '2025-06-23 14:06:35', '2025-06-23 14:06:35'),
(419, 'sA0aZjGsf63RCqQ28panNbqFt57zaAOEud9bnfNi', 1, 'http://127.0.0.1:8000/admin/products/152/edit', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', NULL, '2025-06-23 14:06:57', '2025-06-23 14:06:57'),
(420, 'sA0aZjGsf63RCqQ28panNbqFt57zaAOEud9bnfNi', 1, 'http://127.0.0.1:8000/product/airpods-pro-2nd-gen-usb-c-1750313767', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', NULL, '2025-06-23 14:07:12', '2025-06-23 14:07:12'),
(421, 'sA0aZjGsf63RCqQ28panNbqFt57zaAOEud9bnfNi', 1, 'http://127.0.0.1:8000/admin/products/152/edit', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', NULL, '2025-06-23 14:07:21', '2025-06-23 14:07:21'),
(422, 'sA0aZjGsf63RCqQ28panNbqFt57zaAOEud9bnfNi', 1, 'http://127.0.0.1:8000/admin/products/152/edit', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', NULL, '2025-06-23 14:07:33', '2025-06-23 14:07:33'),
(423, 'sA0aZjGsf63RCqQ28panNbqFt57zaAOEud9bnfNi', 1, 'http://127.0.0.1:8000/admin/products/check-duplicate-variants', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', NULL, '2025-06-23 14:08:05', '2025-06-23 14:08:05'),
(424, 'sA0aZjGsf63RCqQ28panNbqFt57zaAOEud9bnfNi', 1, 'http://127.0.0.1:8000/admin/products/check-duplicate-variants', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', NULL, '2025-06-23 14:08:18', '2025-06-23 14:08:18'),
(425, 'sA0aZjGsf63RCqQ28panNbqFt57zaAOEud9bnfNi', 1, 'http://127.0.0.1:8000/admin/attributes/64/values', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', NULL, '2025-06-23 14:08:36', '2025-06-23 14:08:36'),
(426, 'sA0aZjGsf63RCqQ28panNbqFt57zaAOEud9bnfNi', 1, 'http://127.0.0.1:8000/admin/products/check-duplicate-variants', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', NULL, '2025-06-23 14:08:40', '2025-06-23 14:08:40'),
(427, 'sA0aZjGsf63RCqQ28panNbqFt57zaAOEud9bnfNi', 1, 'http://127.0.0.1:8000/admin/products/check-duplicate-variants', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', NULL, '2025-06-23 14:09:12', '2025-06-23 14:09:12'),
(428, 'sA0aZjGsf63RCqQ28panNbqFt57zaAOEud9bnfNi', 1, 'http://127.0.0.1:8000/admin/products/check-duplicate-variants', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', NULL, '2025-06-23 14:09:13', '2025-06-23 14:09:13'),
(429, 'sA0aZjGsf63RCqQ28panNbqFt57zaAOEud9bnfNi', 1, 'http://127.0.0.1:8000/admin/products/check-duplicate-variants', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', NULL, '2025-06-23 14:09:14', '2025-06-23 14:09:14'),
(430, 'sA0aZjGsf63RCqQ28panNbqFt57zaAOEud9bnfNi', 1, 'http://127.0.0.1:8000/admin/products/check-duplicate-variants', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', NULL, '2025-06-23 14:09:19', '2025-06-23 14:09:19'),
(431, 'sA0aZjGsf63RCqQ28panNbqFt57zaAOEud9bnfNi', 1, 'http://127.0.0.1:8000/admin/products/152', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', NULL, '2025-06-23 14:09:41', '2025-06-23 14:09:41'),
(432, 'sA0aZjGsf63RCqQ28panNbqFt57zaAOEud9bnfNi', 1, 'http://127.0.0.1:8000/admin/products', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', NULL, '2025-06-23 14:09:47', '2025-06-23 14:09:47'),
(433, 'sA0aZjGsf63RCqQ28panNbqFt57zaAOEud9bnfNi', 1, 'http://127.0.0.1:8000/admin/products/152/edit', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', NULL, '2025-06-23 14:09:57', '2025-06-23 14:09:57'),
(434, 'sA0aZjGsf63RCqQ28panNbqFt57zaAOEud9bnfNi', 1, 'http://127.0.0.1:8000/admin/variants', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', NULL, '2025-06-23 14:10:07', '2025-06-23 14:10:07'),
(435, 'sA0aZjGsf63RCqQ28panNbqFt57zaAOEud9bnfNi', 1, 'http://127.0.0.1:8000/admin/variants/trash', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', NULL, '2025-06-23 14:10:31', '2025-06-23 14:10:31'),
(436, 'sA0aZjGsf63RCqQ28panNbqFt57zaAOEud9bnfNi', 1, 'http://127.0.0.1:8000/admin/products', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', NULL, '2025-06-23 14:12:54', '2025-06-23 14:12:54'),
(437, 'sA0aZjGsf63RCqQ28panNbqFt57zaAOEud9bnfNi', 1, 'http://127.0.0.1:8000/admin/products/create', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', NULL, '2025-06-23 14:13:18', '2025-06-23 14:13:18'),
(438, 'sA0aZjGsf63RCqQ28panNbqFt57zaAOEud9bnfNi', 1, 'http://127.0.0.1:8000/admin/products/create', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', NULL, '2025-06-23 14:13:21', '2025-06-23 14:13:21'),
(439, 'sA0aZjGsf63RCqQ28panNbqFt57zaAOEud9bnfNi', 1, 'http://127.0.0.1:8000/admin/categories/25/specifications', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', NULL, '2025-06-23 14:13:56', '2025-06-23 14:13:56'),
(440, 'sA0aZjGsf63RCqQ28panNbqFt57zaAOEud9bnfNi', 1, 'http://127.0.0.1:8000/admin/categories/25/attributes', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', NULL, '2025-06-23 14:13:57', '2025-06-23 14:13:57'),
(441, 'sA0aZjGsf63RCqQ28panNbqFt57zaAOEud9bnfNi', 1, 'http://127.0.0.1:8000/admin/attributes/63/values', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', NULL, '2025-06-23 14:14:00', '2025-06-23 14:14:00'),
(442, 'sA0aZjGsf63RCqQ28panNbqFt57zaAOEud9bnfNi', 1, 'http://127.0.0.1:8000/admin/attributes/63/values', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', NULL, '2025-06-23 14:14:01', '2025-06-23 14:14:01'),
(443, 'sA0aZjGsf63RCqQ28panNbqFt57zaAOEud9bnfNi', 1, 'http://127.0.0.1:8000/admin/attributes/64/values', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', NULL, '2025-06-23 14:14:04', '2025-06-23 14:14:04'),
(444, 'sA0aZjGsf63RCqQ28panNbqFt57zaAOEud9bnfNi', 1, 'http://127.0.0.1:8000/admin/attributes/64/values', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', NULL, '2025-06-23 14:14:05', '2025-06-23 14:14:05'),
(445, 'sA0aZjGsf63RCqQ28panNbqFt57zaAOEud9bnfNi', 1, 'http://127.0.0.1:8000/admin/products/check-duplicate-variants', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', NULL, '2025-06-23 14:14:09', '2025-06-23 14:14:09'),
(446, 'sA0aZjGsf63RCqQ28panNbqFt57zaAOEud9bnfNi', 1, 'http://127.0.0.1:8000/admin/products/check-duplicate-variants', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', NULL, '2025-06-23 14:14:30', '2025-06-23 14:14:30'),
(447, 'sA0aZjGsf63RCqQ28panNbqFt57zaAOEud9bnfNi', 1, 'http://127.0.0.1:8000/admin/products/152/edit', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', NULL, '2025-06-23 14:38:35', '2025-06-23 14:38:35'),
(448, 'sA0aZjGsf63RCqQ28panNbqFt57zaAOEud9bnfNi', 1, 'http://127.0.0.1:8000/admin/products/152/edit', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', NULL, '2025-06-23 14:50:26', '2025-06-23 14:50:26'),
(449, 'sA0aZjGsf63RCqQ28panNbqFt57zaAOEud9bnfNi', 1, 'http://127.0.0.1:8000/admin/products/152/edit', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', NULL, '2025-06-23 14:50:46', '2025-06-23 14:50:46'),
(450, 'sA0aZjGsf63RCqQ28panNbqFt57zaAOEud9bnfNi', 1, 'http://127.0.0.1:8000/admin/products/152/edit', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', NULL, '2025-06-23 14:53:26', '2025-06-23 14:53:26'),
(451, 'sA0aZjGsf63RCqQ28panNbqFt57zaAOEud9bnfNi', 1, 'http://127.0.0.1:8000/admin/products/check-duplicate-variants', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', NULL, '2025-06-23 14:53:47', '2025-06-23 14:53:47'),
(452, 'sA0aZjGsf63RCqQ28panNbqFt57zaAOEud9bnfNi', 1, 'http://127.0.0.1:8000/admin/products/152/edit', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', NULL, '2025-06-23 14:55:22', '2025-06-23 14:55:22'),
(453, 'sA0aZjGsf63RCqQ28panNbqFt57zaAOEud9bnfNi', 1, 'http://127.0.0.1:8000/admin/products/152/edit', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', NULL, '2025-06-23 15:00:39', '2025-06-23 15:00:39'),
(454, 'sA0aZjGsf63RCqQ28panNbqFt57zaAOEud9bnfNi', 1, 'http://127.0.0.1:8000', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', NULL, '2025-06-23 16:09:37', '2025-06-23 16:09:37'),
(455, 'sA0aZjGsf63RCqQ28panNbqFt57zaAOEud9bnfNi', 1, 'http://127.0.0.1:8000/admin', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', NULL, '2025-06-23 16:10:14', '2025-06-23 16:10:14'),
(456, 'sA0aZjGsf63RCqQ28panNbqFt57zaAOEud9bnfNi', 1, 'http://127.0.0.1:8000/admin', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', NULL, '2025-06-23 16:10:22', '2025-06-23 16:10:22'),
(457, 'sA0aZjGsf63RCqQ28panNbqFt57zaAOEud9bnfNi', 1, 'http://127.0.0.1:8000', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', NULL, '2025-06-23 16:10:40', '2025-06-23 16:10:40'),
(458, 'sA0aZjGsf63RCqQ28panNbqFt57zaAOEud9bnfNi', 1, 'http://127.0.0.1:8000/admin', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', NULL, '2025-06-23 16:10:58', '2025-06-23 16:10:58'),
(459, 'sA0aZjGsf63RCqQ28panNbqFt57zaAOEud9bnfNi', 1, 'http://127.0.0.1:8000/admin', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', NULL, '2025-06-23 16:11:08', '2025-06-23 16:11:08'),
(460, 'sA0aZjGsf63RCqQ28panNbqFt57zaAOEud9bnfNi', 1, 'http://127.0.0.1:8000', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', NULL, '2025-06-23 16:11:26', '2025-06-23 16:11:26'),
(461, 'sA0aZjGsf63RCqQ28panNbqFt57zaAOEud9bnfNi', 1, 'http://127.0.0.1:8000/admin', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', NULL, '2025-06-23 16:11:33', '2025-06-23 16:11:33'),
(462, 'sA0aZjGsf63RCqQ28panNbqFt57zaAOEud9bnfNi', 1, 'http://127.0.0.1:8000/admin', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', NULL, '2025-06-23 16:11:45', '2025-06-23 16:11:45'),
(463, 'sA0aZjGsf63RCqQ28panNbqFt57zaAOEud9bnfNi', 1, 'http://127.0.0.1:8000/logout', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', NULL, '2025-06-23 16:12:58', '2025-06-23 16:12:58'),
(464, 'w0lJleF7fGvQ8wOveW5YKv04RaJxeZlZAwXcuxmy', NULL, 'http://127.0.0.1:8000/login', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', NULL, '2025-06-23 16:13:00', '2025-06-23 16:13:00'),
(465, 'w0lJleF7fGvQ8wOveW5YKv04RaJxeZlZAwXcuxmy', NULL, 'http://127.0.0.1:8000/login', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', NULL, '2025-06-23 16:13:06', '2025-06-23 16:13:06'),
(466, 'w0lJleF7fGvQ8wOveW5YKv04RaJxeZlZAwXcuxmy', NULL, 'http://127.0.0.1:8000/login', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', NULL, '2025-06-23 16:13:23', '2025-06-23 16:13:23'),
(467, 'RLnCFcOtxkCNBi9duM03T567hfJ5yTAtUXijEgDl', 71, 'http://127.0.0.1:8000/admin', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', NULL, '2025-06-23 16:13:26', '2025-06-23 16:13:26'),
(468, 'RLnCFcOtxkCNBi9duM03T567hfJ5yTAtUXijEgDl', 71, 'http://127.0.0.1:8000', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', NULL, '2025-06-23 16:16:20', '2025-06-23 16:16:20'),
(469, 'RLnCFcOtxkCNBi9duM03T567hfJ5yTAtUXijEgDl', 71, 'http://127.0.0.1:8000/logout', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', NULL, '2025-06-23 16:16:32', '2025-06-23 16:16:32'),
(470, 'kCiQCaN0skXCuEIojXvBSH0Yt7BTSBfmDeiZXLbI', NULL, 'http://127.0.0.1:8000/login', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', NULL, '2025-06-23 16:16:33', '2025-06-23 16:16:33'),
(471, 'kCiQCaN0skXCuEIojXvBSH0Yt7BTSBfmDeiZXLbI', NULL, 'http://127.0.0.1:8000/login', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', NULL, '2025-06-23 16:16:45', '2025-06-23 16:16:45'),
(472, 'ifQfZyq11wydGUyI3gZwRESUAtDa6krdNfVvK002', 1, 'http://127.0.0.1:8000/admin', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', NULL, '2025-06-23 16:16:48', '2025-06-23 16:16:48'),
(473, 'sfn4ShYI3pjd9WQVZ0tYXP4SYPfiQozCO6C2O7Fs', NULL, 'http://127.0.0.1:8000', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-23 20:41:31', '2025-06-23 20:41:31'),
(474, 'sfn4ShYI3pjd9WQVZ0tYXP4SYPfiQozCO6C2O7Fs', NULL, 'http://127.0.0.1:8000/login', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-23 20:41:41', '2025-06-23 20:41:41'),
(475, 'sfn4ShYI3pjd9WQVZ0tYXP4SYPfiQozCO6C2O7Fs', NULL, 'http://127.0.0.1:8000/login', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-23 20:41:47', '2025-06-23 20:41:47'),
(476, '7VAYTSNPgqLx4LCAXdSAOwFZ1dQIS7q3I6H64Yjr', 1, 'http://127.0.0.1:8000/admin', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-23 20:41:49', '2025-06-23 20:41:49'),
(477, '7VAYTSNPgqLx4LCAXdSAOwFZ1dQIS7q3I6H64Yjr', 1, 'http://127.0.0.1:8000/admin', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-23 20:42:20', '2025-06-23 20:42:20'),
(478, '7VAYTSNPgqLx4LCAXdSAOwFZ1dQIS7q3I6H64Yjr', 1, 'http://127.0.0.1:8000/admin', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-23 20:42:58', '2025-06-23 20:42:58'),
(479, '7VAYTSNPgqLx4LCAXdSAOwFZ1dQIS7q3I6H64Yjr', 1, 'http://127.0.0.1:8000/admin', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-23 20:43:24', '2025-06-23 20:43:24'),
(480, '7VAYTSNPgqLx4LCAXdSAOwFZ1dQIS7q3I6H64Yjr', 1, 'http://127.0.0.1:8000/admin', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-23 20:43:50', '2025-06-23 20:43:50'),
(481, '7VAYTSNPgqLx4LCAXdSAOwFZ1dQIS7q3I6H64Yjr', 1, 'http://127.0.0.1:8000/admin', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-23 20:47:57', '2025-06-23 20:47:57'),
(482, '7VAYTSNPgqLx4LCAXdSAOwFZ1dQIS7q3I6H64Yjr', 1, 'http://127.0.0.1:8000/admin', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-23 20:48:59', '2025-06-23 20:48:59'),
(483, '7VAYTSNPgqLx4LCAXdSAOwFZ1dQIS7q3I6H64Yjr', 1, 'http://127.0.0.1:8000/admin', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-23 20:50:16', '2025-06-23 20:50:16'),
(484, '7VAYTSNPgqLx4LCAXdSAOwFZ1dQIS7q3I6H64Yjr', 1, 'http://127.0.0.1:8000/admin', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-23 20:58:02', '2025-06-23 20:58:02'),
(485, '7VAYTSNPgqLx4LCAXdSAOwFZ1dQIS7q3I6H64Yjr', 1, 'http://127.0.0.1:8000/admin', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-23 20:58:32', '2025-06-23 20:58:32'),
(486, '7VAYTSNPgqLx4LCAXdSAOwFZ1dQIS7q3I6H64Yjr', 1, 'http://127.0.0.1:8000/admin', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-23 20:59:10', '2025-06-23 20:59:10'),
(487, 'MkDAaaPwxIkqQLbPDihm0USxOIVewv8lgQN7pp85', NULL, 'http://127.0.0.1:8000', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', NULL, '2025-06-23 22:02:58', '2025-06-23 22:02:58'),
(488, 'MkDAaaPwxIkqQLbPDihm0USxOIVewv8lgQN7pp85', NULL, 'http://127.0.0.1:8000', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', NULL, '2025-06-23 22:04:14', '2025-06-23 22:04:14'),
(489, 'MkDAaaPwxIkqQLbPDihm0USxOIVewv8lgQN7pp85', NULL, 'http://127.0.0.1:8000/login', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', NULL, '2025-06-23 22:04:32', '2025-06-23 22:04:32'),
(490, 'MkDAaaPwxIkqQLbPDihm0USxOIVewv8lgQN7pp85', NULL, 'http://127.0.0.1:8000/login', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', NULL, '2025-06-23 22:04:47', '2025-06-23 22:04:47'),
(491, '9hZTOjy4nly8oTqngKrDTfIYstbSptbGQQ6be9Hh', NULL, 'http://127.0.0.1:8000', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-23 22:05:05', '2025-06-23 22:05:05'),
(492, '9hZTOjy4nly8oTqngKrDTfIYstbSptbGQQ6be9Hh', NULL, 'http://127.0.0.1:8000/compare', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-23 22:05:36', '2025-06-23 22:05:36'),
(493, 'MkDAaaPwxIkqQLbPDihm0USxOIVewv8lgQN7pp85', NULL, 'http://127.0.0.1:8000/login', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', NULL, '2025-06-23 22:06:14', '2025-06-23 22:06:14'),
(494, 'xTJhsgYFFCjPVmzxPV16k3egEnfSzGjjxRBq5At0', 71, 'http://127.0.0.1:8000/admin', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', NULL, '2025-06-23 22:06:27', '2025-06-23 22:06:27'),
(495, 'xTJhsgYFFCjPVmzxPV16k3egEnfSzGjjxRBq5At0', 71, 'http://127.0.0.1:8000/admin', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', NULL, '2025-06-23 22:06:46', '2025-06-23 22:06:46'),
(496, 'xTJhsgYFFCjPVmzxPV16k3egEnfSzGjjxRBq5At0', 71, 'http://127.0.0.1:8000/admin', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', NULL, '2025-06-23 22:06:57', '2025-06-23 22:06:57'),
(497, 'xTJhsgYFFCjPVmzxPV16k3egEnfSzGjjxRBq5At0', 71, 'http://127.0.0.1:8000', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', NULL, '2025-06-23 22:07:12', '2025-06-23 22:07:12'),
(498, 'xTJhsgYFFCjPVmzxPV16k3egEnfSzGjjxRBq5At0', 71, 'http://127.0.0.1:8000/logout', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', NULL, '2025-06-23 22:07:34', '2025-06-23 22:07:34'),
(499, 'f84354LYfJVzHJX0G5wNfbMxqLxOujT8WoLD35XV', NULL, 'http://127.0.0.1:8000/login', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', NULL, '2025-06-23 22:07:42', '2025-06-23 22:07:42'),
(500, 'f84354LYfJVzHJX0G5wNfbMxqLxOujT8WoLD35XV', NULL, 'http://127.0.0.1:8000/login', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', NULL, '2025-06-23 22:08:01', '2025-06-23 22:08:01'),
(501, 'x1f9EkFgZfUNLF1pHFhgZrpvoOqnN20Aqot48cgn', 1, 'http://127.0.0.1:8000/admin', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', NULL, '2025-06-23 22:08:10', '2025-06-23 22:08:10'),
(502, 'x1f9EkFgZfUNLF1pHFhgZrpvoOqnN20Aqot48cgn', 1, 'http://127.0.0.1:8000/admin/products', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', NULL, '2025-06-23 22:08:51', '2025-06-23 22:08:51'),
(503, '9hZTOjy4nly8oTqngKrDTfIYstbSptbGQQ6be9Hh', NULL, 'http://127.0.0.1:8000/compare', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-23 22:09:21', '2025-06-23 22:09:21'),
(504, 'x1f9EkFgZfUNLF1pHFhgZrpvoOqnN20Aqot48cgn', 1, 'http://127.0.0.1:8000/admin/products/152/edit', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', NULL, '2025-06-23 22:09:35', '2025-06-23 22:09:35'),
(505, '9hZTOjy4nly8oTqngKrDTfIYstbSptbGQQ6be9Hh', NULL, 'http://127.0.0.1:8000/compare', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-23 22:09:46', '2025-06-23 22:09:46'),
(506, '9hZTOjy4nly8oTqngKrDTfIYstbSptbGQQ6be9Hh', NULL, 'http://127.0.0.1:8000/shop', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-23 22:10:37', '2025-06-23 22:10:37'),
(507, 'x1f9EkFgZfUNLF1pHFhgZrpvoOqnN20Aqot48cgn', 1, 'http://127.0.0.1:8000/admin/products/check-duplicate-variants', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', NULL, '2025-06-23 22:10:34', '2025-06-23 22:10:34'),
(508, 'x1f9EkFgZfUNLF1pHFhgZrpvoOqnN20Aqot48cgn', 1, 'http://127.0.0.1:8000/admin/products/check-duplicate-variants', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', NULL, '2025-06-23 22:10:42', '2025-06-23 22:10:42'),
(509, 'x1f9EkFgZfUNLF1pHFhgZrpvoOqnN20Aqot48cgn', 1, 'http://127.0.0.1:8000/admin', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', NULL, '2025-06-23 22:11:19', '2025-06-23 22:11:19'),
(510, '9hZTOjy4nly8oTqngKrDTfIYstbSptbGQQ6be9Hh', NULL, 'http://127.0.0.1:8000/compare', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-23 22:12:45', '2025-06-23 22:12:45'),
(511, '9hZTOjy4nly8oTqngKrDTfIYstbSptbGQQ6be9Hh', NULL, 'http://127.0.0.1:8000/compare', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-23 22:12:57', '2025-06-23 22:12:57'),
(512, '9hZTOjy4nly8oTqngKrDTfIYstbSptbGQQ6be9Hh', NULL, 'http://127.0.0.1:8000/compare', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-23 22:13:07', '2025-06-23 22:13:07'),
(513, '9hZTOjy4nly8oTqngKrDTfIYstbSptbGQQ6be9Hh', NULL, 'http://127.0.0.1:8000/compare', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-23 22:13:17', '2025-06-23 22:13:17'),
(514, '9hZTOjy4nly8oTqngKrDTfIYstbSptbGQQ6be9Hh', NULL, 'http://127.0.0.1:8000', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-23 22:13:43', '2025-06-23 22:13:43'),
(515, '9hZTOjy4nly8oTqngKrDTfIYstbSptbGQQ6be9Hh', NULL, 'http://127.0.0.1:8000/compare', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-23 22:14:24', '2025-06-23 22:14:24'),
(516, '9hZTOjy4nly8oTqngKrDTfIYstbSptbGQQ6be9Hh', NULL, 'http://127.0.0.1:8000', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-23 22:15:14', '2025-06-23 22:15:14'),
(517, '9hZTOjy4nly8oTqngKrDTfIYstbSptbGQQ6be9Hh', NULL, 'http://127.0.0.1:8000/compare', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-23 22:15:37', '2025-06-23 22:15:37'),
(518, '9hZTOjy4nly8oTqngKrDTfIYstbSptbGQQ6be9Hh', NULL, 'http://127.0.0.1:8000/compare', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-23 22:18:11', '2025-06-23 22:18:11'),
(519, '9hZTOjy4nly8oTqngKrDTfIYstbSptbGQQ6be9Hh', NULL, 'http://127.0.0.1:8000/compare', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-23 22:18:48', '2025-06-23 22:18:48'),
(520, '9hZTOjy4nly8oTqngKrDTfIYstbSptbGQQ6be9Hh', NULL, 'http://127.0.0.1:8000/compare', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-23 22:19:50', '2025-06-23 22:19:50'),
(521, '9hZTOjy4nly8oTqngKrDTfIYstbSptbGQQ6be9Hh', NULL, 'http://127.0.0.1:8000/compare', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-23 22:22:17', '2025-06-23 22:22:17'),
(522, '9hZTOjy4nly8oTqngKrDTfIYstbSptbGQQ6be9Hh', NULL, 'http://127.0.0.1:8000/compare', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-23 22:22:37', '2025-06-23 22:22:37'),
(523, '9hZTOjy4nly8oTqngKrDTfIYstbSptbGQQ6be9Hh', NULL, 'http://127.0.0.1:8000/compare', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-23 22:23:30', '2025-06-23 22:23:30'),
(524, '9hZTOjy4nly8oTqngKrDTfIYstbSptbGQQ6be9Hh', NULL, 'http://127.0.0.1:8000/compare', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-23 22:23:39', '2025-06-23 22:23:39'),
(525, '9hZTOjy4nly8oTqngKrDTfIYstbSptbGQQ6be9Hh', NULL, 'http://127.0.0.1:8000/compare', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-23 22:23:49', '2025-06-23 22:23:49'),
(526, '9hZTOjy4nly8oTqngKrDTfIYstbSptbGQQ6be9Hh', NULL, 'http://127.0.0.1:8000/compare', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-23 22:23:56', '2025-06-23 22:23:56'),
(527, '9hZTOjy4nly8oTqngKrDTfIYstbSptbGQQ6be9Hh', NULL, 'http://127.0.0.1:8000/compare', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-23 22:24:50', '2025-06-23 22:24:50'),
(528, '9hZTOjy4nly8oTqngKrDTfIYstbSptbGQQ6be9Hh', NULL, 'http://127.0.0.1:8000/compare', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-23 22:24:59', '2025-06-23 22:24:59'),
(529, '9hZTOjy4nly8oTqngKrDTfIYstbSptbGQQ6be9Hh', NULL, 'http://127.0.0.1:8000/compare', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-23 22:26:23', '2025-06-23 22:26:23'),
(530, '9hZTOjy4nly8oTqngKrDTfIYstbSptbGQQ6be9Hh', NULL, 'http://127.0.0.1:8000/compare', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-23 22:26:33', '2025-06-23 22:26:33'),
(531, '9hZTOjy4nly8oTqngKrDTfIYstbSptbGQQ6be9Hh', NULL, 'http://127.0.0.1:8000/compare', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-23 22:26:54', '2025-06-23 22:26:54'),
(532, '9hZTOjy4nly8oTqngKrDTfIYstbSptbGQQ6be9Hh', NULL, 'http://127.0.0.1:8000/compare', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-23 22:27:03', '2025-06-23 22:27:03'),
(533, '9hZTOjy4nly8oTqngKrDTfIYstbSptbGQQ6be9Hh', NULL, 'http://127.0.0.1:8000/compare', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-23 22:27:13', '2025-06-23 22:27:13'),
(534, '9hZTOjy4nly8oTqngKrDTfIYstbSptbGQQ6be9Hh', NULL, 'http://127.0.0.1:8000/compare', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-23 22:27:36', '2025-06-23 22:27:36'),
(535, '9hZTOjy4nly8oTqngKrDTfIYstbSptbGQQ6be9Hh', NULL, 'http://127.0.0.1:8000/compare', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-23 22:27:45', '2025-06-23 22:27:45'),
(536, '9hZTOjy4nly8oTqngKrDTfIYstbSptbGQQ6be9Hh', NULL, 'http://127.0.0.1:8000/compare', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-23 22:28:55', '2025-06-23 22:28:55'),
(537, '9hZTOjy4nly8oTqngKrDTfIYstbSptbGQQ6be9Hh', NULL, 'http://127.0.0.1:8000/compare', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-23 22:29:05', '2025-06-23 22:29:05'),
(538, '9hZTOjy4nly8oTqngKrDTfIYstbSptbGQQ6be9Hh', NULL, 'http://127.0.0.1:8000/compare', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-23 22:29:54', '2025-06-23 22:29:54'),
(539, '9hZTOjy4nly8oTqngKrDTfIYstbSptbGQQ6be9Hh', NULL, 'http://127.0.0.1:8000/compare', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-23 22:30:04', '2025-06-23 22:30:04'),
(540, '9hZTOjy4nly8oTqngKrDTfIYstbSptbGQQ6be9Hh', NULL, 'http://127.0.0.1:8000/compare', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-23 22:32:27', '2025-06-23 22:32:27'),
(541, '9hZTOjy4nly8oTqngKrDTfIYstbSptbGQQ6be9Hh', NULL, 'http://127.0.0.1:8000/compare', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-23 22:33:27', '2025-06-23 22:33:27'),
(542, '9hZTOjy4nly8oTqngKrDTfIYstbSptbGQQ6be9Hh', NULL, 'http://127.0.0.1:8000/compare', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-23 22:34:16', '2025-06-23 22:34:16'),
(543, '9hZTOjy4nly8oTqngKrDTfIYstbSptbGQQ6be9Hh', NULL, 'http://127.0.0.1:8000/compare', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-23 22:34:38', '2025-06-23 22:34:38'),
(544, '9hZTOjy4nly8oTqngKrDTfIYstbSptbGQQ6be9Hh', NULL, 'http://127.0.0.1:8000/compare', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-23 22:38:45', '2025-06-23 22:38:45'),
(545, '9hZTOjy4nly8oTqngKrDTfIYstbSptbGQQ6be9Hh', NULL, 'http://127.0.0.1:8000/compare', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-23 22:39:22', '2025-06-23 22:39:22'),
(546, 'fgm4ClWO3j54zhCOdatMnDr0I8rOzp4tDuPDv7qB', NULL, 'http://127.0.0.1:8000/checkout?image=http%3A%2F%2F127.0.0.1%3A8000%2Fuploads%2Fproducts%2F1750313768_0_Danh%2520m%25E1%25BB%25A5c%2520tai%2520nghe%2C%2520loa.png&quantity=1&variant_id=243', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-23 22:41:31', '2025-06-23 22:41:31'),
(547, 'fgm4ClWO3j54zhCOdatMnDr0I8rOzp4tDuPDv7qB', NULL, 'http://127.0.0.1:8000', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-23 22:41:46', '2025-06-23 22:41:46'),
(548, 'fgm4ClWO3j54zhCOdatMnDr0I8rOzp4tDuPDv7qB', NULL, 'http://127.0.0.1:8000/chatbot/ask', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-23 22:42:04', '2025-06-23 22:42:04'),
(549, 'fgm4ClWO3j54zhCOdatMnDr0I8rOzp4tDuPDv7qB', NULL, 'http://127.0.0.1:8000/chatbot/ask', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-23 22:42:59', '2025-06-23 22:42:59'),
(550, '9hZTOjy4nly8oTqngKrDTfIYstbSptbGQQ6be9Hh', NULL, 'http://127.0.0.1:8000/compare', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-23 22:46:26', '2025-06-23 22:46:26'),
(551, '9hZTOjy4nly8oTqngKrDTfIYstbSptbGQQ6be9Hh', NULL, 'http://127.0.0.1:8000/compare', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-23 22:47:16', '2025-06-23 22:47:16'),
(552, '9hZTOjy4nly8oTqngKrDTfIYstbSptbGQQ6be9Hh', NULL, 'http://127.0.0.1:8000/compare', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-23 22:48:53', '2025-06-23 22:48:53'),
(553, '9hZTOjy4nly8oTqngKrDTfIYstbSptbGQQ6be9Hh', NULL, 'http://127.0.0.1:8000/compare', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-23 22:49:04', '2025-06-23 22:49:04'),
(554, '9hZTOjy4nly8oTqngKrDTfIYstbSptbGQQ6be9Hh', NULL, 'http://127.0.0.1:8000/compare', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-23 22:49:28', '2025-06-23 22:49:28'),
(555, '9hZTOjy4nly8oTqngKrDTfIYstbSptbGQQ6be9Hh', NULL, 'http://127.0.0.1:8000/compare', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-23 22:54:11', '2025-06-23 22:54:11'),
(556, '9hZTOjy4nly8oTqngKrDTfIYstbSptbGQQ6be9Hh', NULL, 'http://127.0.0.1:8000/compare', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-23 22:54:38', '2025-06-23 22:54:38'),
(557, 'fgm4ClWO3j54zhCOdatMnDr0I8rOzp4tDuPDv7qB', NULL, 'http://127.0.0.1:8000', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-23 22:59:10', '2025-06-23 22:59:10'),
(558, 'fgm4ClWO3j54zhCOdatMnDr0I8rOzp4tDuPDv7qB', NULL, 'http://127.0.0.1:8000/login', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-23 23:10:02', '2025-06-23 23:10:02'),
(559, 'fgm4ClWO3j54zhCOdatMnDr0I8rOzp4tDuPDv7qB', NULL, 'http://127.0.0.1:8000/login', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-23 23:10:19', '2025-06-23 23:10:19'),
(560, 'RGWwEBmNAoiPqZh29TY1zPsWkCuU1YeTES0ccV6o', 1, 'http://127.0.0.1:8000/admin', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-23 23:10:26', '2025-06-23 23:10:26'),
(561, 'RGWwEBmNAoiPqZh29TY1zPsWkCuU1YeTES0ccV6o', 1, 'http://127.0.0.1:8000', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-24 00:10:48', '2025-06-24 00:10:48'),
(562, 'HEep9wafurLppPadtslhENwzwGTzD9lINZYc8n8m', NULL, 'http://127.0.0.1:8000', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', NULL, '2025-06-24 07:58:59', '2025-06-24 07:58:59'),
(563, 'HEep9wafurLppPadtslhENwzwGTzD9lINZYc8n8m', NULL, 'http://127.0.0.1:8000/login', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', NULL, '2025-06-24 07:59:10', '2025-06-24 07:59:10'),
(564, 'HEep9wafurLppPadtslhENwzwGTzD9lINZYc8n8m', NULL, 'http://127.0.0.1:8000/login', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', NULL, '2025-06-24 07:59:22', '2025-06-24 07:59:22'),
(565, 'uAuSGRCkbQ7gHYY4gIjJveA4kisjLRtUzfdCpsDI', 1, 'http://127.0.0.1:8000/admin', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', NULL, '2025-06-24 07:59:28', '2025-06-24 07:59:28'),
(566, 'uAuSGRCkbQ7gHYY4gIjJveA4kisjLRtUzfdCpsDI', 1, 'http://127.0.0.1:8000/admin/products', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', NULL, '2025-06-24 07:59:44', '2025-06-24 07:59:44'),
(567, 'uAuSGRCkbQ7gHYY4gIjJveA4kisjLRtUzfdCpsDI', 1, 'http://127.0.0.1:8000', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', NULL, '2025-06-24 08:01:51', '2025-06-24 08:01:51'),
(568, 'uAuSGRCkbQ7gHYY4gIjJveA4kisjLRtUzfdCpsDI', 1, 'http://127.0.0.1:8000/logout', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', NULL, '2025-06-24 08:02:04', '2025-06-24 08:02:04'),
(569, 'AK0jNQH1SH6uWx0OdYrDVEU8v8ZNIeIRvlDDPDgc', NULL, 'http://127.0.0.1:8000/login', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', NULL, '2025-06-24 08:02:04', '2025-06-24 08:02:04'),
(570, 'AK0jNQH1SH6uWx0OdYrDVEU8v8ZNIeIRvlDDPDgc', NULL, 'http://127.0.0.1:8000/login', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', NULL, '2025-06-24 08:02:43', '2025-06-24 08:02:43'),
(571, 'W0Sp5lxr7m6bl8ZCvFfF9R9VSVgc4GQnbRj2shFm', 71, 'http://127.0.0.1:8000', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', NULL, '2025-06-24 08:03:32', '2025-06-24 08:03:32'),
(572, 'W0Sp5lxr7m6bl8ZCvFfF9R9VSVgc4GQnbRj2shFm', 71, 'http://127.0.0.1:8000/product/iphone-14-pro-max-1750314182', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', NULL, '2025-06-24 08:07:35', '2025-06-24 08:07:35'),
(573, 'W0Sp5lxr7m6bl8ZCvFfF9R9VSVgc4GQnbRj2shFm', 71, 'http://127.0.0.1:8000/checkout?image=http%3A%2F%2F127.0.0.1%3A8000%2Fuploads%2Fproducts%2F1750314183_0_iphone-16-pro-max-16-titan-tu-nhien-thumbnew-650x650.png&quantity=1&variant_id=245', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', NULL, '2025-06-24 08:07:43', '2025-06-24 08:07:43');
INSERT INTO `page_views` (`id`, `session_id`, `user_id`, `url`, `ip_address`, `user_agent`, `duration`, `created_at`, `updated_at`) VALUES
(574, 'W0Sp5lxr7m6bl8ZCvFfF9R9VSVgc4GQnbRj2shFm', 71, 'http://127.0.0.1:8000/checkout?image=http%3A%2F%2F127.0.0.1%3A8000%2Fuploads%2Fproducts%2F1750314183_0_iphone-16-pro-max-16-titan-tu-nhien-thumbnew-650x650.png&quantity=1&variant_id=245', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', NULL, '2025-06-24 08:27:54', '2025-06-24 08:27:54'),
(575, 'W0Sp5lxr7m6bl8ZCvFfF9R9VSVgc4GQnbRj2shFm', 71, 'http://127.0.0.1:8000/checkout?image=http%3A%2F%2F127.0.0.1%3A8000%2Fuploads%2Fproducts%2F1750314183_0_iphone-16-pro-max-16-titan-tu-nhien-thumbnew-650x650.png&quantity=1&variant_id=245', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', NULL, '2025-06-24 08:28:10', '2025-06-24 08:28:10'),
(576, 'W0Sp5lxr7m6bl8ZCvFfF9R9VSVgc4GQnbRj2shFm', 71, 'http://127.0.0.1:8000/checkout?image=http%3A%2F%2F127.0.0.1%3A8000%2Fuploads%2Fproducts%2F1750314183_0_iphone-16-pro-max-16-titan-tu-nhien-thumbnew-650x650.png&quantity=1&variant_id=245', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', NULL, '2025-06-24 08:28:42', '2025-06-24 08:28:42'),
(577, 'W0Sp5lxr7m6bl8ZCvFfF9R9VSVgc4GQnbRj2shFm', 71, 'http://127.0.0.1:8000/checkout?image=http%3A%2F%2F127.0.0.1%3A8000%2Fuploads%2Fproducts%2F1750314183_0_iphone-16-pro-max-16-titan-tu-nhien-thumbnew-650x650.png&quantity=1&variant_id=245', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', NULL, '2025-06-24 08:30:17', '2025-06-24 08:30:17'),
(578, 'W0Sp5lxr7m6bl8ZCvFfF9R9VSVgc4GQnbRj2shFm', 71, 'http://127.0.0.1:8000/checkout?image=http%3A%2F%2F127.0.0.1%3A8000%2Fuploads%2Fproducts%2F1750314183_0_iphone-16-pro-max-16-titan-tu-nhien-thumbnew-650x650.png&quantity=1&variant_id=245', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', NULL, '2025-06-24 08:33:33', '2025-06-24 08:33:33'),
(579, 'W0Sp5lxr7m6bl8ZCvFfF9R9VSVgc4GQnbRj2shFm', 71, 'http://127.0.0.1:8000/checkout?image=http%3A%2F%2F127.0.0.1%3A8000%2Fuploads%2Fproducts%2F1750314183_0_iphone-16-pro-max-16-titan-tu-nhien-thumbnew-650x650.png&quantity=1&variant_id=245', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', NULL, '2025-06-24 08:37:39', '2025-06-24 08:37:39'),
(580, 'W0Sp5lxr7m6bl8ZCvFfF9R9VSVgc4GQnbRj2shFm', 71, 'http://127.0.0.1:8000/checkout?image=http%3A%2F%2F127.0.0.1%3A8000%2Fuploads%2Fproducts%2F1750314183_0_iphone-16-pro-max-16-titan-tu-nhien-thumbnew-650x650.png&quantity=1&variant_id=245', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', NULL, '2025-06-24 08:46:57', '2025-06-24 08:46:57'),
(581, 'W0Sp5lxr7m6bl8ZCvFfF9R9VSVgc4GQnbRj2shFm', 71, 'http://127.0.0.1:8000/checkout?image=http%3A%2F%2F127.0.0.1%3A8000%2Fuploads%2Fproducts%2F1750314183_0_iphone-16-pro-max-16-titan-tu-nhien-thumbnew-650x650.png&quantity=1&variant_id=245', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', NULL, '2025-06-24 08:47:10', '2025-06-24 08:47:10'),
(582, 'W0Sp5lxr7m6bl8ZCvFfF9R9VSVgc4GQnbRj2shFm', 71, 'http://127.0.0.1:8000/checkout?image=http%3A%2F%2F127.0.0.1%3A8000%2Fuploads%2Fproducts%2F1750314183_0_iphone-16-pro-max-16-titan-tu-nhien-thumbnew-650x650.png&quantity=1&variant_id=245', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', NULL, '2025-06-24 08:48:48', '2025-06-24 08:48:48'),
(583, 'W0Sp5lxr7m6bl8ZCvFfF9R9VSVgc4GQnbRj2shFm', 71, 'http://127.0.0.1:8000/checkout?image=http%3A%2F%2F127.0.0.1%3A8000%2Fuploads%2Fproducts%2F1750314183_0_iphone-16-pro-max-16-titan-tu-nhien-thumbnew-650x650.png&quantity=1&variant_id=245', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', NULL, '2025-06-24 08:48:53', '2025-06-24 08:48:53'),
(584, 'W0Sp5lxr7m6bl8ZCvFfF9R9VSVgc4GQnbRj2shFm', 71, 'http://127.0.0.1:8000/checkout?image=http%3A%2F%2F127.0.0.1%3A8000%2Fuploads%2Fproducts%2F1750314183_0_iphone-16-pro-max-16-titan-tu-nhien-thumbnew-650x650.png&quantity=1&variant_id=245', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', NULL, '2025-06-24 08:52:56', '2025-06-24 08:52:56'),
(585, 'W0Sp5lxr7m6bl8ZCvFfF9R9VSVgc4GQnbRj2shFm', 71, 'http://127.0.0.1:8000/checkout?image=http%3A%2F%2F127.0.0.1%3A8000%2Fuploads%2Fproducts%2F1750314183_0_iphone-16-pro-max-16-titan-tu-nhien-thumbnew-650x650.png&quantity=1&variant_id=245', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', NULL, '2025-06-24 08:54:50', '2025-06-24 08:54:50'),
(586, 'W0Sp5lxr7m6bl8ZCvFfF9R9VSVgc4GQnbRj2shFm', 71, 'http://127.0.0.1:8000/checkout?image=http%3A%2F%2F127.0.0.1%3A8000%2Fuploads%2Fproducts%2F1750314183_0_iphone-16-pro-max-16-titan-tu-nhien-thumbnew-650x650.png&quantity=1&variant_id=245', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', NULL, '2025-06-24 09:04:55', '2025-06-24 09:04:55'),
(587, 'W0Sp5lxr7m6bl8ZCvFfF9R9VSVgc4GQnbRj2shFm', 71, 'http://127.0.0.1:8000/checkout?image=http%3A%2F%2F127.0.0.1%3A8000%2Fuploads%2Fproducts%2F1750314183_0_iphone-16-pro-max-16-titan-tu-nhien-thumbnew-650x650.png&quantity=1&variant_id=245', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', NULL, '2025-06-24 09:07:24', '2025-06-24 09:07:24'),
(588, 'W0Sp5lxr7m6bl8ZCvFfF9R9VSVgc4GQnbRj2shFm', 71, 'http://127.0.0.1:8000/admin', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', NULL, '2025-06-24 09:11:37', '2025-06-24 09:11:37'),
(589, 'W0Sp5lxr7m6bl8ZCvFfF9R9VSVgc4GQnbRj2shFm', 71, 'http://127.0.0.1:8000/admin', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', NULL, '2025-06-24 09:11:44', '2025-06-24 09:11:44'),
(590, 'W0Sp5lxr7m6bl8ZCvFfF9R9VSVgc4GQnbRj2shFm', 71, 'http://127.0.0.1:8000/checkout', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', NULL, '2025-06-24 09:11:49', '2025-06-24 09:11:49'),
(591, 'W0Sp5lxr7m6bl8ZCvFfF9R9VSVgc4GQnbRj2shFm', 71, 'http://127.0.0.1:8000/order', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', NULL, '2025-06-24 09:12:18', '2025-06-24 09:12:18'),
(592, 'W0Sp5lxr7m6bl8ZCvFfF9R9VSVgc4GQnbRj2shFm', 71, 'http://127.0.0.1:8000/logout', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', NULL, '2025-06-24 09:12:39', '2025-06-24 09:12:39'),
(593, 'KN6y0qWmJPeuZmUw2oKYPT7akH6njWh67OrdEnvy', NULL, 'http://127.0.0.1:8000/login', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', NULL, '2025-06-24 09:12:40', '2025-06-24 09:12:40'),
(594, '2dAZH6Beu0av0TAXLZIhMaCiHBEjWqWr83UjObiB', NULL, 'http://127.0.0.1:8000/login', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', NULL, '2025-06-24 09:12:55', '2025-06-24 09:12:55'),
(595, 'KN6y0qWmJPeuZmUw2oKYPT7akH6njWh67OrdEnvy', NULL, 'http://127.0.0.1:8000/login', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', NULL, '2025-06-24 09:13:09', '2025-06-24 09:13:09'),
(596, 'ACMRtRg7c8nXlCfLGX2c5VQuDmJsqO75b2XWIpru', 71, 'http://127.0.0.1:8000', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', NULL, '2025-06-24 09:13:11', '2025-06-24 09:13:11'),
(597, '2dAZH6Beu0av0TAXLZIhMaCiHBEjWqWr83UjObiB', NULL, 'http://127.0.0.1:8000/login', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', NULL, '2025-06-24 09:13:25', '2025-06-24 09:13:25'),
(598, 'HhXSeEBquvQlPq63gFjCebP1EziVetpOM0BNraAg', 1, 'http://127.0.0.1:8000/admin', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', NULL, '2025-06-24 09:13:27', '2025-06-24 09:13:27'),
(599, 'ACMRtRg7c8nXlCfLGX2c5VQuDmJsqO75b2XWIpru', 71, 'http://127.0.0.1:8000/order', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', NULL, '2025-06-24 09:13:32', '2025-06-24 09:13:32'),
(600, 'HhXSeEBquvQlPq63gFjCebP1EziVetpOM0BNraAg', 1, 'http://127.0.0.1:8000/admin/orders', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', NULL, '2025-06-24 09:13:38', '2025-06-24 09:13:38'),
(601, 'HhXSeEBquvQlPq63gFjCebP1EziVetpOM0BNraAg', 1, 'http://127.0.0.1:8000/admin/orders/100', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', NULL, '2025-06-24 09:14:29', '2025-06-24 09:14:29'),
(602, 'HhXSeEBquvQlPq63gFjCebP1EziVetpOM0BNraAg', 1, 'http://127.0.0.1:8000/admin/orders/100/status', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', NULL, '2025-06-24 09:14:42', '2025-06-24 09:14:42'),
(603, 'HhXSeEBquvQlPq63gFjCebP1EziVetpOM0BNraAg', 1, 'http://127.0.0.1:8000/admin/orders/100', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', NULL, '2025-06-24 09:15:01', '2025-06-24 09:15:01'),
(604, 'HhXSeEBquvQlPq63gFjCebP1EziVetpOM0BNraAg', 1, 'http://127.0.0.1:8000/admin/orders/100/status', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', NULL, '2025-06-24 09:15:58', '2025-06-24 09:15:58'),
(605, 'HhXSeEBquvQlPq63gFjCebP1EziVetpOM0BNraAg', 1, 'http://127.0.0.1:8000/admin/orders/100', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', NULL, '2025-06-24 09:15:59', '2025-06-24 09:15:59'),
(606, 'HhXSeEBquvQlPq63gFjCebP1EziVetpOM0BNraAg', 1, 'http://127.0.0.1:8000/admin/orders/100', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', NULL, '2025-06-24 09:16:25', '2025-06-24 09:16:25'),
(607, 'HhXSeEBquvQlPq63gFjCebP1EziVetpOM0BNraAg', 1, 'http://127.0.0.1:8000/admin/orders/100/status', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', NULL, '2025-06-24 09:16:30', '2025-06-24 09:16:30'),
(608, 'HhXSeEBquvQlPq63gFjCebP1EziVetpOM0BNraAg', 1, 'http://127.0.0.1:8000/admin/orders/100', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', NULL, '2025-06-24 09:16:32', '2025-06-24 09:16:32'),
(609, 'HhXSeEBquvQlPq63gFjCebP1EziVetpOM0BNraAg', 1, 'http://127.0.0.1:8000/admin/orders', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', NULL, '2025-06-24 09:18:41', '2025-06-24 09:18:41'),
(610, 'HhXSeEBquvQlPq63gFjCebP1EziVetpOM0BNraAg', 1, 'http://127.0.0.1:8000/admin/orders/99', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', NULL, '2025-06-24 09:19:57', '2025-06-24 09:19:57'),
(611, 'HhXSeEBquvQlPq63gFjCebP1EziVetpOM0BNraAg', 1, 'http://127.0.0.1:8000/admin/orders/99/status', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', NULL, '2025-06-24 09:20:02', '2025-06-24 09:20:02'),
(612, 'HhXSeEBquvQlPq63gFjCebP1EziVetpOM0BNraAg', 1, 'http://127.0.0.1:8000/admin/orders/99', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', NULL, '2025-06-24 09:20:14', '2025-06-24 09:20:14'),
(613, 'HhXSeEBquvQlPq63gFjCebP1EziVetpOM0BNraAg', 1, 'http://127.0.0.1:8000/admin/orders', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', NULL, '2025-06-24 09:25:12', '2025-06-24 09:25:12'),
(614, 'HhXSeEBquvQlPq63gFjCebP1EziVetpOM0BNraAg', 1, 'http://127.0.0.1:8000/admin/orders/98', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', NULL, '2025-06-24 09:25:25', '2025-06-24 09:25:25'),
(615, 'HhXSeEBquvQlPq63gFjCebP1EziVetpOM0BNraAg', 1, 'http://127.0.0.1:8000/admin/orders/98/status', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', NULL, '2025-06-24 09:25:39', '2025-06-24 09:25:39'),
(616, 'HhXSeEBquvQlPq63gFjCebP1EziVetpOM0BNraAg', 1, 'http://127.0.0.1:8000/admin/orders/98', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', NULL, '2025-06-24 09:25:50', '2025-06-24 09:25:50'),
(617, 'HhXSeEBquvQlPq63gFjCebP1EziVetpOM0BNraAg', 1, 'http://127.0.0.1:8000/admin/orders', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', NULL, '2025-06-24 09:27:31', '2025-06-24 09:27:31'),
(618, 'HhXSeEBquvQlPq63gFjCebP1EziVetpOM0BNraAg', 1, 'http://127.0.0.1:8000/admin/orders/97', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', NULL, '2025-06-24 09:27:57', '2025-06-24 09:27:57'),
(619, 'HhXSeEBquvQlPq63gFjCebP1EziVetpOM0BNraAg', 1, 'http://127.0.0.1:8000/admin/orders/97/status', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', NULL, '2025-06-24 09:28:03', '2025-06-24 09:28:03'),
(620, 'HhXSeEBquvQlPq63gFjCebP1EziVetpOM0BNraAg', 1, 'http://127.0.0.1:8000/admin/orders/97', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', NULL, '2025-06-24 09:28:14', '2025-06-24 09:28:14'),
(621, 'ACMRtRg7c8nXlCfLGX2c5VQuDmJsqO75b2XWIpru', 71, 'http://127.0.0.1:8000/order', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', NULL, '2025-06-24 09:32:37', '2025-06-24 09:32:37'),
(622, 'ACMRtRg7c8nXlCfLGX2c5VQuDmJsqO75b2XWIpru', 71, 'http://127.0.0.1:8000/order', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', NULL, '2025-06-24 09:40:25', '2025-06-24 09:40:25'),
(623, 'HhXSeEBquvQlPq63gFjCebP1EziVetpOM0BNraAg', 1, 'http://127.0.0.1:8000/admin/orders', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', NULL, '2025-06-24 09:40:59', '2025-06-24 09:40:59'),
(624, 'HhXSeEBquvQlPq63gFjCebP1EziVetpOM0BNraAg', 1, 'http://127.0.0.1:8000/admin/orders/94', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', NULL, '2025-06-24 09:41:11', '2025-06-24 09:41:11'),
(625, 'HhXSeEBquvQlPq63gFjCebP1EziVetpOM0BNraAg', 1, 'http://127.0.0.1:8000/admin/orders/94', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', NULL, '2025-06-24 09:41:12', '2025-06-24 09:41:12'),
(626, 'HhXSeEBquvQlPq63gFjCebP1EziVetpOM0BNraAg', 1, 'http://127.0.0.1:8000/admin/orders/94/status', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', NULL, '2025-06-24 09:41:18', '2025-06-24 09:41:18'),
(627, 'HhXSeEBquvQlPq63gFjCebP1EziVetpOM0BNraAg', 1, 'http://127.0.0.1:8000/admin/orders/94', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', NULL, '2025-06-24 09:41:31', '2025-06-24 09:41:31'),
(628, 'ACMRtRg7c8nXlCfLGX2c5VQuDmJsqO75b2XWIpru', 71, 'http://127.0.0.1:8000/order', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', NULL, '2025-06-24 09:46:13', '2025-06-24 09:46:13'),
(629, 'HhXSeEBquvQlPq63gFjCebP1EziVetpOM0BNraAg', 1, 'http://127.0.0.1:8000/admin/orders', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', NULL, '2025-06-24 09:46:22', '2025-06-24 09:46:22'),
(630, 'HhXSeEBquvQlPq63gFjCebP1EziVetpOM0BNraAg', 1, 'http://127.0.0.1:8000/admin/orders/93', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', NULL, '2025-06-24 09:46:29', '2025-06-24 09:46:29'),
(631, 'HhXSeEBquvQlPq63gFjCebP1EziVetpOM0BNraAg', 1, 'http://127.0.0.1:8000/admin/orders/93/status', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', NULL, '2025-06-24 09:46:34', '2025-06-24 09:46:34'),
(632, 'HhXSeEBquvQlPq63gFjCebP1EziVetpOM0BNraAg', 1, 'http://127.0.0.1:8000/admin/orders/93', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', NULL, '2025-06-24 09:46:47', '2025-06-24 09:46:47'),
(633, 'ACMRtRg7c8nXlCfLGX2c5VQuDmJsqO75b2XWIpru', 71, 'http://127.0.0.1:8000/order', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', NULL, '2025-06-24 09:54:35', '2025-06-24 09:54:35'),
(634, 'HhXSeEBquvQlPq63gFjCebP1EziVetpOM0BNraAg', 1, 'http://127.0.0.1:8000/admin/orders', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', NULL, '2025-06-24 09:55:32', '2025-06-24 09:55:32'),
(635, 'HhXSeEBquvQlPq63gFjCebP1EziVetpOM0BNraAg', 1, 'http://127.0.0.1:8000/admin/orders/88', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', NULL, '2025-06-24 09:55:39', '2025-06-24 09:55:39'),
(636, 'HhXSeEBquvQlPq63gFjCebP1EziVetpOM0BNraAg', 1, 'http://127.0.0.1:8000/admin/orders/88/status', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', NULL, '2025-06-24 09:55:47', '2025-06-24 09:55:47'),
(637, 'HhXSeEBquvQlPq63gFjCebP1EziVetpOM0BNraAg', 1, 'http://127.0.0.1:8000/admin/orders/88', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', NULL, '2025-06-24 09:56:01', '2025-06-24 09:56:01'),
(638, 'ACMRtRg7c8nXlCfLGX2c5VQuDmJsqO75b2XWIpru', 71, 'http://127.0.0.1:8000/order', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', NULL, '2025-06-24 10:24:03', '2025-06-24 10:24:03'),
(639, '22WSTIVAZBP0qtin2eVvCPf0HIiVYeaoNZttU7ph', NULL, 'http://127.0.0.1:8000', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-24 16:05:20', '2025-06-24 16:05:20'),
(640, '22WSTIVAZBP0qtin2eVvCPf0HIiVYeaoNZttU7ph', NULL, 'http://127.0.0.1:8000/compare', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-24 16:05:37', '2025-06-24 16:05:37'),
(641, 'vqCcqpUBFwcklFmw1RhRFC4R3XZ88XtFymd4FG3z', NULL, 'http://127.0.0.1:8000', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-24 16:07:46', '2025-06-24 16:07:46'),
(642, 'vqCcqpUBFwcklFmw1RhRFC4R3XZ88XtFymd4FG3z', NULL, 'http://127.0.0.1:8000/login', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-24 16:07:52', '2025-06-24 16:07:52'),
(643, 'vqCcqpUBFwcklFmw1RhRFC4R3XZ88XtFymd4FG3z', NULL, 'http://127.0.0.1:8000/login', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-24 16:07:59', '2025-06-24 16:07:59'),
(644, 'O0LpYPNHHcqUTUJrikt2oiM31IVaJWSlYJGsn24i', 1, 'http://127.0.0.1:8000/admin', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-24 16:08:01', '2025-06-24 16:08:01'),
(645, 'O0LpYPNHHcqUTUJrikt2oiM31IVaJWSlYJGsn24i', 1, 'http://127.0.0.1:8000/admin', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-24 16:08:58', '2025-06-24 16:08:58'),
(646, '22WSTIVAZBP0qtin2eVvCPf0HIiVYeaoNZttU7ph', NULL, 'http://127.0.0.1:8000/compare', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-24 16:13:16', '2025-06-24 16:13:16'),
(647, '22WSTIVAZBP0qtin2eVvCPf0HIiVYeaoNZttU7ph', NULL, 'http://127.0.0.1:8000/compare', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-24 16:13:20', '2025-06-24 16:13:20'),
(648, '22WSTIVAZBP0qtin2eVvCPf0HIiVYeaoNZttU7ph', NULL, 'http://127.0.0.1:8000/compare', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-24 16:15:00', '2025-06-24 16:15:00'),
(649, '22WSTIVAZBP0qtin2eVvCPf0HIiVYeaoNZttU7ph', NULL, 'http://127.0.0.1:8000/compare', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-24 16:15:04', '2025-06-24 16:15:04'),
(650, '22WSTIVAZBP0qtin2eVvCPf0HIiVYeaoNZttU7ph', NULL, 'http://127.0.0.1:8000/compare', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-24 16:16:18', '2025-06-24 16:16:18'),
(651, '22WSTIVAZBP0qtin2eVvCPf0HIiVYeaoNZttU7ph', NULL, 'http://127.0.0.1:8000/compare', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-24 16:17:13', '2025-06-24 16:17:13'),
(652, '22WSTIVAZBP0qtin2eVvCPf0HIiVYeaoNZttU7ph', NULL, 'http://127.0.0.1:8000/compare', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-24 16:17:17', '2025-06-24 16:17:17'),
(653, '22WSTIVAZBP0qtin2eVvCPf0HIiVYeaoNZttU7ph', NULL, 'http://127.0.0.1:8000/compare', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-24 16:17:32', '2025-06-24 16:17:32'),
(654, '22WSTIVAZBP0qtin2eVvCPf0HIiVYeaoNZttU7ph', NULL, 'http://127.0.0.1:8000/compare', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-24 16:17:36', '2025-06-24 16:17:36'),
(655, '22WSTIVAZBP0qtin2eVvCPf0HIiVYeaoNZttU7ph', NULL, 'http://127.0.0.1:8000/compare', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-24 16:20:00', '2025-06-24 16:20:00'),
(656, '22WSTIVAZBP0qtin2eVvCPf0HIiVYeaoNZttU7ph', NULL, 'http://127.0.0.1:8000/compare', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-24 16:20:04', '2025-06-24 16:20:04'),
(657, '22WSTIVAZBP0qtin2eVvCPf0HIiVYeaoNZttU7ph', NULL, 'http://127.0.0.1:8000/compare', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-24 16:20:07', '2025-06-24 16:20:07'),
(658, '22WSTIVAZBP0qtin2eVvCPf0HIiVYeaoNZttU7ph', NULL, 'http://127.0.0.1:8000/compare', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-24 16:22:31', '2025-06-24 16:22:31'),
(659, '22WSTIVAZBP0qtin2eVvCPf0HIiVYeaoNZttU7ph', NULL, 'http://127.0.0.1:8000/product/iphone-15-pro-max-1750314062', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-24 16:22:45', '2025-06-24 16:22:45'),
(660, '22WSTIVAZBP0qtin2eVvCPf0HIiVYeaoNZttU7ph', NULL, 'http://127.0.0.1:8000/compare', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-24 16:24:51', '2025-06-24 16:24:51'),
(661, '22WSTIVAZBP0qtin2eVvCPf0HIiVYeaoNZttU7ph', NULL, 'http://127.0.0.1:8000/compare', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-24 16:24:54', '2025-06-24 16:24:54'),
(662, '22WSTIVAZBP0qtin2eVvCPf0HIiVYeaoNZttU7ph', NULL, 'http://127.0.0.1:8000/compare', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-24 16:26:24', '2025-06-24 16:26:24'),
(663, '22WSTIVAZBP0qtin2eVvCPf0HIiVYeaoNZttU7ph', NULL, 'http://127.0.0.1:8000/compare', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-24 16:26:31', '2025-06-24 16:26:31'),
(664, '22WSTIVAZBP0qtin2eVvCPf0HIiVYeaoNZttU7ph', NULL, 'http://127.0.0.1:8000/compare', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-24 16:26:40', '2025-06-24 16:26:40'),
(665, '22WSTIVAZBP0qtin2eVvCPf0HIiVYeaoNZttU7ph', NULL, 'http://127.0.0.1:8000/compare', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-24 16:27:09', '2025-06-24 16:27:09'),
(666, '22WSTIVAZBP0qtin2eVvCPf0HIiVYeaoNZttU7ph', NULL, 'http://127.0.0.1:8000/compare', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-24 16:27:12', '2025-06-24 16:27:12'),
(667, '22WSTIVAZBP0qtin2eVvCPf0HIiVYeaoNZttU7ph', NULL, 'http://127.0.0.1:8000/compare', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-24 16:28:11', '2025-06-24 16:28:11'),
(668, '22WSTIVAZBP0qtin2eVvCPf0HIiVYeaoNZttU7ph', NULL, 'http://127.0.0.1:8000/compare', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-24 16:29:05', '2025-06-24 16:29:05'),
(669, '22WSTIVAZBP0qtin2eVvCPf0HIiVYeaoNZttU7ph', NULL, 'http://127.0.0.1:8000/compare', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-24 16:30:43', '2025-06-24 16:30:43'),
(670, '22WSTIVAZBP0qtin2eVvCPf0HIiVYeaoNZttU7ph', NULL, 'http://127.0.0.1:8000/compare', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-24 16:32:09', '2025-06-24 16:32:09'),
(671, '22WSTIVAZBP0qtin2eVvCPf0HIiVYeaoNZttU7ph', NULL, 'http://127.0.0.1:8000/compare', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-24 16:33:05', '2025-06-24 16:33:05'),
(672, '22WSTIVAZBP0qtin2eVvCPf0HIiVYeaoNZttU7ph', NULL, 'http://127.0.0.1:8000/compare', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-24 16:33:09', '2025-06-24 16:33:09'),
(673, '22WSTIVAZBP0qtin2eVvCPf0HIiVYeaoNZttU7ph', NULL, 'http://127.0.0.1:8000/compare', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-24 16:33:13', '2025-06-24 16:33:13'),
(674, '22WSTIVAZBP0qtin2eVvCPf0HIiVYeaoNZttU7ph', NULL, 'http://127.0.0.1:8000/compare', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-24 16:33:20', '2025-06-24 16:33:20'),
(675, '22WSTIVAZBP0qtin2eVvCPf0HIiVYeaoNZttU7ph', NULL, 'http://127.0.0.1:8000/compare', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-24 16:36:07', '2025-06-24 16:36:07'),
(676, '22WSTIVAZBP0qtin2eVvCPf0HIiVYeaoNZttU7ph', NULL, 'http://127.0.0.1:8000/compare', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-24 16:36:38', '2025-06-24 16:36:38'),
(677, '22WSTIVAZBP0qtin2eVvCPf0HIiVYeaoNZttU7ph', NULL, 'http://127.0.0.1:8000/compare', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-24 16:37:04', '2025-06-24 16:37:04'),
(678, '22WSTIVAZBP0qtin2eVvCPf0HIiVYeaoNZttU7ph', NULL, 'http://127.0.0.1:8000/compare', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-24 16:37:14', '2025-06-24 16:37:14'),
(679, '22WSTIVAZBP0qtin2eVvCPf0HIiVYeaoNZttU7ph', NULL, 'http://127.0.0.1:8000/compare', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-24 16:37:31', '2025-06-24 16:37:31'),
(680, '22WSTIVAZBP0qtin2eVvCPf0HIiVYeaoNZttU7ph', NULL, 'http://127.0.0.1:8000/product/iphone-15-pro-max-1750314062', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-24 16:38:00', '2025-06-24 16:38:00'),
(681, '22WSTIVAZBP0qtin2eVvCPf0HIiVYeaoNZttU7ph', NULL, 'http://127.0.0.1:8000/compare', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-24 16:39:33', '2025-06-24 16:39:33'),
(682, '22WSTIVAZBP0qtin2eVvCPf0HIiVYeaoNZttU7ph', NULL, 'http://127.0.0.1:8000/compare', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-24 16:41:16', '2025-06-24 16:41:16'),
(683, '22WSTIVAZBP0qtin2eVvCPf0HIiVYeaoNZttU7ph', NULL, 'http://127.0.0.1:8000/compare', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-24 16:41:34', '2025-06-24 16:41:34'),
(684, '22WSTIVAZBP0qtin2eVvCPf0HIiVYeaoNZttU7ph', NULL, 'http://127.0.0.1:8000/compare', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-24 16:41:38', '2025-06-24 16:41:38'),
(685, '22WSTIVAZBP0qtin2eVvCPf0HIiVYeaoNZttU7ph', NULL, 'http://127.0.0.1:8000/compare', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-24 16:41:51', '2025-06-24 16:41:51'),
(686, '22WSTIVAZBP0qtin2eVvCPf0HIiVYeaoNZttU7ph', NULL, 'http://127.0.0.1:8000/compare', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-24 16:41:56', '2025-06-24 16:41:56'),
(687, '22WSTIVAZBP0qtin2eVvCPf0HIiVYeaoNZttU7ph', NULL, 'http://127.0.0.1:8000/compare', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-24 16:42:01', '2025-06-24 16:42:01'),
(688, '22WSTIVAZBP0qtin2eVvCPf0HIiVYeaoNZttU7ph', NULL, 'http://127.0.0.1:8000/compare', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-24 16:42:03', '2025-06-24 16:42:03'),
(689, '22WSTIVAZBP0qtin2eVvCPf0HIiVYeaoNZttU7ph', NULL, 'http://127.0.0.1:8000/compare', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-24 16:42:13', '2025-06-24 16:42:13'),
(690, '22WSTIVAZBP0qtin2eVvCPf0HIiVYeaoNZttU7ph', NULL, 'http://127.0.0.1:8000/compare', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-24 16:42:16', '2025-06-24 16:42:16'),
(691, '22WSTIVAZBP0qtin2eVvCPf0HIiVYeaoNZttU7ph', NULL, 'http://127.0.0.1:8000/compare', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-24 16:42:27', '2025-06-24 16:42:27'),
(692, '22WSTIVAZBP0qtin2eVvCPf0HIiVYeaoNZttU7ph', NULL, 'http://127.0.0.1:8000/compare', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-24 16:42:38', '2025-06-24 16:42:38'),
(693, '22WSTIVAZBP0qtin2eVvCPf0HIiVYeaoNZttU7ph', NULL, 'http://127.0.0.1:8000/compare', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-24 16:43:05', '2025-06-24 16:43:05'),
(694, '22WSTIVAZBP0qtin2eVvCPf0HIiVYeaoNZttU7ph', NULL, 'http://127.0.0.1:8000/compare', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-24 16:43:09', '2025-06-24 16:43:09'),
(695, '22WSTIVAZBP0qtin2eVvCPf0HIiVYeaoNZttU7ph', NULL, 'http://127.0.0.1:8000/compare', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-24 16:43:12', '2025-06-24 16:43:12'),
(696, '22WSTIVAZBP0qtin2eVvCPf0HIiVYeaoNZttU7ph', NULL, 'http://127.0.0.1:8000/compare', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-24 16:43:15', '2025-06-24 16:43:15'),
(697, 'O0LpYPNHHcqUTUJrikt2oiM31IVaJWSlYJGsn24i', 1, 'http://127.0.0.1:8000/admin', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-24 16:44:05', '2025-06-24 16:44:05'),
(698, 'O0LpYPNHHcqUTUJrikt2oiM31IVaJWSlYJGsn24i', 1, 'http://127.0.0.1:8000/admin', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-24 16:45:26', '2025-06-24 16:45:26'),
(699, '22WSTIVAZBP0qtin2eVvCPf0HIiVYeaoNZttU7ph', NULL, 'http://127.0.0.1:8000', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-24 16:47:29', '2025-06-24 16:47:29'),
(700, '22WSTIVAZBP0qtin2eVvCPf0HIiVYeaoNZttU7ph', NULL, 'http://127.0.0.1:8000', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-24 16:48:43', '2025-06-24 16:48:43'),
(701, '22WSTIVAZBP0qtin2eVvCPf0HIiVYeaoNZttU7ph', NULL, 'http://127.0.0.1:8000', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-24 16:49:18', '2025-06-24 16:49:18'),
(702, '22WSTIVAZBP0qtin2eVvCPf0HIiVYeaoNZttU7ph', NULL, 'http://127.0.0.1:8000', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-24 16:50:14', '2025-06-24 16:50:14'),
(703, '22WSTIVAZBP0qtin2eVvCPf0HIiVYeaoNZttU7ph', NULL, 'http://127.0.0.1:8000', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-24 16:51:17', '2025-06-24 16:51:17'),
(704, '22WSTIVAZBP0qtin2eVvCPf0HIiVYeaoNZttU7ph', NULL, 'http://127.0.0.1:8000/compare', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-24 16:51:39', '2025-06-24 16:51:39'),
(705, '22WSTIVAZBP0qtin2eVvCPf0HIiVYeaoNZttU7ph', NULL, 'http://127.0.0.1:8000/compare', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-24 17:00:22', '2025-06-24 17:00:22'),
(706, 'CiPfjbYGrlcJfxuWIVED3gzi0aTw8l7W91Vcij1i', NULL, 'http://127.0.0.1:8000', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-24 20:17:55', '2025-06-24 20:17:55'),
(707, 'CiPfjbYGrlcJfxuWIVED3gzi0aTw8l7W91Vcij1i', NULL, 'http://127.0.0.1:8000/login', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-24 20:17:58', '2025-06-24 20:17:58'),
(708, 'CiPfjbYGrlcJfxuWIVED3gzi0aTw8l7W91Vcij1i', NULL, 'http://127.0.0.1:8000/login', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-24 20:18:02', '2025-06-24 20:18:02'),
(709, 'CiPfjbYGrlcJfxuWIVED3gzi0aTw8l7W91Vcij1i', NULL, 'http://127.0.0.1:8000/login', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-24 20:18:08', '2025-06-24 20:18:08'),
(710, 'KN8AFPpdDpmCkqvp28953DkXDuRpBHkkyNM5hqlV', 1, 'http://127.0.0.1:8000/admin', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-24 20:18:10', '2025-06-24 20:18:10'),
(711, 'KN8AFPpdDpmCkqvp28953DkXDuRpBHkkyNM5hqlV', 1, 'http://127.0.0.1:8000/admin', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-24 21:09:47', '2025-06-24 21:09:47'),
(712, 'KN8AFPpdDpmCkqvp28953DkXDuRpBHkkyNM5hqlV', 1, 'http://127.0.0.1:8000/admin', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-24 21:13:07', '2025-06-24 21:13:07'),
(713, 'KN8AFPpdDpmCkqvp28953DkXDuRpBHkkyNM5hqlV', 1, 'http://127.0.0.1:8000/admin', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-24 21:13:33', '2025-06-24 21:13:33'),
(714, 'KN8AFPpdDpmCkqvp28953DkXDuRpBHkkyNM5hqlV', 1, 'http://127.0.0.1:8000/admin', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-24 21:14:41', '2025-06-24 21:14:41'),
(715, 'QK2DhlJLJBrxEFaO1wuwUo1lFRqaB9SLVWznbokN', NULL, 'http://127.0.0.1:8000', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-24 21:14:47', '2025-06-24 21:14:47'),
(716, 'QK2DhlJLJBrxEFaO1wuwUo1lFRqaB9SLVWznbokN', NULL, 'http://127.0.0.1:8000/compare', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-24 21:15:42', '2025-06-24 21:15:42'),
(717, 'QK2DhlJLJBrxEFaO1wuwUo1lFRqaB9SLVWznbokN', NULL, 'http://127.0.0.1:8000/compare', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-24 21:18:36', '2025-06-24 21:18:36'),
(718, 'KN8AFPpdDpmCkqvp28953DkXDuRpBHkkyNM5hqlV', 1, 'http://127.0.0.1:8000/admin/subscribers', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-24 21:19:32', '2025-06-24 21:19:32'),
(719, 'KN8AFPpdDpmCkqvp28953DkXDuRpBHkkyNM5hqlV', 1, 'http://127.0.0.1:8000/admin/subscribers', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-24 21:19:36', '2025-06-24 21:19:36'),
(720, 'QK2DhlJLJBrxEFaO1wuwUo1lFRqaB9SLVWznbokN', NULL, 'http://127.0.0.1:8000/compare', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-24 21:21:10', '2025-06-24 21:21:10'),
(721, 'QK2DhlJLJBrxEFaO1wuwUo1lFRqaB9SLVWznbokN', NULL, 'http://127.0.0.1:8000/compare', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-24 21:22:28', '2025-06-24 21:22:28'),
(722, 'QK2DhlJLJBrxEFaO1wuwUo1lFRqaB9SLVWznbokN', NULL, 'http://127.0.0.1:8000', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-24 21:22:38', '2025-06-24 21:22:38'),
(723, 'QK2DhlJLJBrxEFaO1wuwUo1lFRqaB9SLVWznbokN', NULL, 'http://127.0.0.1:8000/compare', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-24 21:23:15', '2025-06-24 21:23:15'),
(724, 'QK2DhlJLJBrxEFaO1wuwUo1lFRqaB9SLVWznbokN', NULL, 'http://127.0.0.1:8000', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-24 21:23:28', '2025-06-24 21:23:28'),
(725, 'QK2DhlJLJBrxEFaO1wuwUo1lFRqaB9SLVWznbokN', NULL, 'http://127.0.0.1:8000/compare', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-24 21:23:53', '2025-06-24 21:23:53'),
(726, 'QK2DhlJLJBrxEFaO1wuwUo1lFRqaB9SLVWznbokN', NULL, 'http://127.0.0.1:8000/compare', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-24 21:24:38', '2025-06-24 21:24:38'),
(727, 'KN8AFPpdDpmCkqvp28953DkXDuRpBHkkyNM5hqlV', 1, 'http://127.0.0.1:8000/admin/subscribers', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-24 21:24:38', '2025-06-24 21:24:38'),
(728, 'KN8AFPpdDpmCkqvp28953DkXDuRpBHkkyNM5hqlV', 1, 'http://127.0.0.1:8000/admin/subscribers', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-24 21:24:39', '2025-06-24 21:24:39'),
(729, 'KN8AFPpdDpmCkqvp28953DkXDuRpBHkkyNM5hqlV', 1, 'http://127.0.0.1:8000/admin/activities', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-24 21:24:48', '2025-06-24 21:24:48'),
(730, 'KN8AFPpdDpmCkqvp28953DkXDuRpBHkkyNM5hqlV', 1, 'http://127.0.0.1:8000/admin/activities', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-24 21:25:25', '2025-06-24 21:25:25'),
(731, 'QK2DhlJLJBrxEFaO1wuwUo1lFRqaB9SLVWznbokN', NULL, 'http://127.0.0.1:8000', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-24 21:26:17', '2025-06-24 21:26:17'),
(732, 'QK2DhlJLJBrxEFaO1wuwUo1lFRqaB9SLVWznbokN', NULL, 'http://127.0.0.1:8000', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-24 21:26:36', '2025-06-24 21:26:36'),
(733, 'QK2DhlJLJBrxEFaO1wuwUo1lFRqaB9SLVWznbokN', NULL, 'http://127.0.0.1:8000', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-24 21:27:53', '2025-06-24 21:27:53'),
(734, 'QK2DhlJLJBrxEFaO1wuwUo1lFRqaB9SLVWznbokN', NULL, 'http://127.0.0.1:8000', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-24 21:28:14', '2025-06-24 21:28:14'),
(735, 'QK2DhlJLJBrxEFaO1wuwUo1lFRqaB9SLVWznbokN', NULL, 'http://127.0.0.1:8000', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-24 21:28:28', '2025-06-24 21:28:28'),
(736, 'QK2DhlJLJBrxEFaO1wuwUo1lFRqaB9SLVWznbokN', NULL, 'http://127.0.0.1:8000', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-24 21:28:44', '2025-06-24 21:28:44'),
(737, 'QK2DhlJLJBrxEFaO1wuwUo1lFRqaB9SLVWznbokN', NULL, 'http://127.0.0.1:8000', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-24 21:29:17', '2025-06-24 21:29:17'),
(738, 'QK2DhlJLJBrxEFaO1wuwUo1lFRqaB9SLVWznbokN', NULL, 'http://127.0.0.1:8000', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-24 21:29:56', '2025-06-24 21:29:56'),
(739, 'QK2DhlJLJBrxEFaO1wuwUo1lFRqaB9SLVWznbokN', NULL, 'http://127.0.0.1:8000', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-24 21:30:23', '2025-06-24 21:30:23'),
(740, 'QK2DhlJLJBrxEFaO1wuwUo1lFRqaB9SLVWznbokN', NULL, 'http://127.0.0.1:8000/compare?products=154%2C155', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-24 21:32:15', '2025-06-24 21:32:15'),
(741, 'KN8AFPpdDpmCkqvp28953DkXDuRpBHkkyNM5hqlV', 1, 'http://127.0.0.1:8000/admin/activities', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-24 21:32:29', '2025-06-24 21:32:29'),
(742, 'QK2DhlJLJBrxEFaO1wuwUo1lFRqaB9SLVWznbokN', NULL, 'http://127.0.0.1:8000/compare?products=154%2C155', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-24 21:33:09', '2025-06-24 21:33:09'),
(743, 'KN8AFPpdDpmCkqvp28953DkXDuRpBHkkyNM5hqlV', 1, 'http://127.0.0.1:8000/admin/subscribers', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-24 21:33:18', '2025-06-24 21:33:18'),
(744, 'KN8AFPpdDpmCkqvp28953DkXDuRpBHkkyNM5hqlV', 1, 'http://127.0.0.1:8000/admin/activities', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-24 21:33:23', '2025-06-24 21:33:23'),
(745, 'KN8AFPpdDpmCkqvp28953DkXDuRpBHkkyNM5hqlV', 1, 'http://127.0.0.1:8000/admin/subscribers', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-24 21:33:28', '2025-06-24 21:33:28'),
(746, 'QK2DhlJLJBrxEFaO1wuwUo1lFRqaB9SLVWznbokN', NULL, 'http://127.0.0.1:8000', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-24 21:33:30', '2025-06-24 21:33:30'),
(747, 'KN8AFPpdDpmCkqvp28953DkXDuRpBHkkyNM5hqlV', 1, 'http://127.0.0.1:8000/admin/activities', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-24 21:33:31', '2025-06-24 21:33:31'),
(748, 'QK2DhlJLJBrxEFaO1wuwUo1lFRqaB9SLVWznbokN', NULL, 'http://127.0.0.1:8000', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-24 21:34:49', '2025-06-24 21:34:49'),
(749, 'QK2DhlJLJBrxEFaO1wuwUo1lFRqaB9SLVWznbokN', NULL, 'http://127.0.0.1:8000', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-24 21:35:05', '2025-06-24 21:35:05'),
(750, 'QK2DhlJLJBrxEFaO1wuwUo1lFRqaB9SLVWznbokN', NULL, 'http://127.0.0.1:8000', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-24 21:36:26', '2025-06-24 21:36:26');
INSERT INTO `page_views` (`id`, `session_id`, `user_id`, `url`, `ip_address`, `user_agent`, `duration`, `created_at`, `updated_at`) VALUES
(751, 'KN8AFPpdDpmCkqvp28953DkXDuRpBHkkyNM5hqlV', 1, 'http://127.0.0.1:8000/admin/activities', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-24 21:37:45', '2025-06-24 21:37:45'),
(752, 'KN8AFPpdDpmCkqvp28953DkXDuRpBHkkyNM5hqlV', 1, 'http://127.0.0.1:8000/admin/activities', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-24 21:39:30', '2025-06-24 21:39:30'),
(753, 'KN8AFPpdDpmCkqvp28953DkXDuRpBHkkyNM5hqlV', 1, 'http://127.0.0.1:8000/admin/activities', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-24 21:40:10', '2025-06-24 21:40:10'),
(754, 'KN8AFPpdDpmCkqvp28953DkXDuRpBHkkyNM5hqlV', 1, 'http://127.0.0.1:8000/admin/activities', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-24 21:40:17', '2025-06-24 21:40:17'),
(755, 'KN8AFPpdDpmCkqvp28953DkXDuRpBHkkyNM5hqlV', 1, 'http://127.0.0.1:8000/admin/activities', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-24 21:40:28', '2025-06-24 21:40:28'),
(756, 'QK2DhlJLJBrxEFaO1wuwUo1lFRqaB9SLVWznbokN', NULL, 'http://127.0.0.1:8000', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-24 21:41:23', '2025-06-24 21:41:23'),
(757, 'KN8AFPpdDpmCkqvp28953DkXDuRpBHkkyNM5hqlV', 1, 'http://127.0.0.1:8000/admin/activities', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-24 21:41:30', '2025-06-24 21:41:30'),
(758, 'QK2DhlJLJBrxEFaO1wuwUo1lFRqaB9SLVWznbokN', NULL, 'http://127.0.0.1:8000/compare?products=155%2C154', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-24 21:41:47', '2025-06-24 21:41:47'),
(759, 'KN8AFPpdDpmCkqvp28953DkXDuRpBHkkyNM5hqlV', 1, 'http://127.0.0.1:8000/admin/activities', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-24 21:42:11', '2025-06-24 21:42:11'),
(760, 'KN8AFPpdDpmCkqvp28953DkXDuRpBHkkyNM5hqlV', 1, 'http://127.0.0.1:8000/admin/activities', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-24 21:42:31', '2025-06-24 21:42:31'),
(761, 'KN8AFPpdDpmCkqvp28953DkXDuRpBHkkyNM5hqlV', 1, 'http://127.0.0.1:8000/admin/activities', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-24 21:43:15', '2025-06-24 21:43:15'),
(762, 'QK2DhlJLJBrxEFaO1wuwUo1lFRqaB9SLVWznbokN', NULL, 'http://127.0.0.1:8000/compare?products=155%2C154', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-24 21:43:25', '2025-06-24 21:43:25'),
(763, 'QK2DhlJLJBrxEFaO1wuwUo1lFRqaB9SLVWznbokN', NULL, 'http://127.0.0.1:8000/compare?products=155%2C154', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-24 21:43:34', '2025-06-24 21:43:34'),
(764, 'QK2DhlJLJBrxEFaO1wuwUo1lFRqaB9SLVWznbokN', NULL, 'http://127.0.0.1:8000/compare?products=155%2C154', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-24 21:43:45', '2025-06-24 21:43:45'),
(765, 'QK2DhlJLJBrxEFaO1wuwUo1lFRqaB9SLVWznbokN', NULL, 'http://127.0.0.1:8000', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-24 21:43:55', '2025-06-24 21:43:55'),
(766, 'KN8AFPpdDpmCkqvp28953DkXDuRpBHkkyNM5hqlV', 1, 'http://127.0.0.1:8000/admin/users', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-24 21:44:56', '2025-06-24 21:44:56'),
(767, 'QK2DhlJLJBrxEFaO1wuwUo1lFRqaB9SLVWznbokN', NULL, 'http://127.0.0.1:8000', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-24 21:45:07', '2025-06-24 21:45:07'),
(768, 'QK2DhlJLJBrxEFaO1wuwUo1lFRqaB9SLVWznbokN', NULL, 'http://127.0.0.1:8000', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-24 21:45:15', '2025-06-24 21:45:15'),
(769, 'QK2DhlJLJBrxEFaO1wuwUo1lFRqaB9SLVWznbokN', NULL, 'http://127.0.0.1:8000', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-24 21:45:24', '2025-06-24 21:45:24'),
(770, 'KN8AFPpdDpmCkqvp28953DkXDuRpBHkkyNM5hqlV', 1, 'http://127.0.0.1:8000/admin/activities', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-24 21:46:04', '2025-06-24 21:46:04'),
(771, 'KN8AFPpdDpmCkqvp28953DkXDuRpBHkkyNM5hqlV', 1, 'http://127.0.0.1:8000/admin/activities/user/1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-24 21:46:14', '2025-06-24 21:46:14'),
(772, 'KN8AFPpdDpmCkqvp28953DkXDuRpBHkkyNM5hqlV', 1, 'http://127.0.0.1:8000/admin/activities/user/1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-24 21:46:37', '2025-06-24 21:46:37'),
(773, 'QK2DhlJLJBrxEFaO1wuwUo1lFRqaB9SLVWznbokN', NULL, 'http://127.0.0.1:8000/compare?products=154%2C155', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-24 21:46:44', '2025-06-24 21:46:44'),
(774, 'QK2DhlJLJBrxEFaO1wuwUo1lFRqaB9SLVWznbokN', NULL, 'http://127.0.0.1:8000/compare?products=154%2C155', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-24 21:47:22', '2025-06-24 21:47:22'),
(775, 'KN8AFPpdDpmCkqvp28953DkXDuRpBHkkyNM5hqlV', 1, 'http://127.0.0.1:8000/admin/activities/user/71', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-24 21:47:23', '2025-06-24 21:47:23'),
(776, 'QK2DhlJLJBrxEFaO1wuwUo1lFRqaB9SLVWznbokN', NULL, 'http://127.0.0.1:8000/shop', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-24 21:47:40', '2025-06-24 21:47:40'),
(777, 'QK2DhlJLJBrxEFaO1wuwUo1lFRqaB9SLVWznbokN', NULL, 'http://127.0.0.1:8000', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-24 21:47:57', '2025-06-24 21:47:57'),
(778, 'KN8AFPpdDpmCkqvp28953DkXDuRpBHkkyNM5hqlV', 1, 'http://127.0.0.1:8000/admin/activities/user/71', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-24 21:48:01', '2025-06-24 21:48:01'),
(779, 'QK2DhlJLJBrxEFaO1wuwUo1lFRqaB9SLVWznbokN', NULL, 'http://127.0.0.1:8000', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-24 21:48:05', '2025-06-24 21:48:05'),
(780, 'KN8AFPpdDpmCkqvp28953DkXDuRpBHkkyNM5hqlV', 1, 'http://127.0.0.1:8000/admin/activities/user/77', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-24 21:48:12', '2025-06-24 21:48:12'),
(781, 'KN8AFPpdDpmCkqvp28953DkXDuRpBHkkyNM5hqlV', 1, 'http://127.0.0.1:8000/admin/activities/user/1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-24 21:48:18', '2025-06-24 21:48:18'),
(782, 'QK2DhlJLJBrxEFaO1wuwUo1lFRqaB9SLVWznbokN', NULL, 'http://127.0.0.1:8000', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-24 21:49:17', '2025-06-24 21:49:17'),
(783, 'KN8AFPpdDpmCkqvp28953DkXDuRpBHkkyNM5hqlV', 1, 'http://127.0.0.1:8000/admin/products', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-24 21:50:59', '2025-06-24 21:50:59'),
(784, 'KN8AFPpdDpmCkqvp28953DkXDuRpBHkkyNM5hqlV', 1, 'http://127.0.0.1:8000/admin/activities', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-24 21:51:07', '2025-06-24 21:51:07'),
(785, 'QK2DhlJLJBrxEFaO1wuwUo1lFRqaB9SLVWznbokN', NULL, 'http://127.0.0.1:8000/shop', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-24 21:52:03', '2025-06-24 21:52:03'),
(786, 'KN8AFPpdDpmCkqvp28953DkXDuRpBHkkyNM5hqlV', 1, 'http://127.0.0.1:8000/admin/activities', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-24 21:52:27', '2025-06-24 21:52:27'),
(787, 'QK2DhlJLJBrxEFaO1wuwUo1lFRqaB9SLVWznbokN', NULL, 'http://127.0.0.1:8000', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-24 21:52:42', '2025-06-24 21:52:42'),
(788, 'QK2DhlJLJBrxEFaO1wuwUo1lFRqaB9SLVWznbokN', NULL, 'http://127.0.0.1:8000', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-24 21:54:51', '2025-06-24 21:54:51'),
(789, 'QK2DhlJLJBrxEFaO1wuwUo1lFRqaB9SLVWznbokN', NULL, 'http://127.0.0.1:8000', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-24 21:55:00', '2025-06-24 21:55:00'),
(790, 'QK2DhlJLJBrxEFaO1wuwUo1lFRqaB9SLVWznbokN', NULL, 'http://127.0.0.1:8000', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-24 21:55:19', '2025-06-24 21:55:19'),
(791, 'QK2DhlJLJBrxEFaO1wuwUo1lFRqaB9SLVWznbokN', NULL, 'http://127.0.0.1:8000', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-24 21:55:56', '2025-06-24 21:55:56'),
(792, 'QK2DhlJLJBrxEFaO1wuwUo1lFRqaB9SLVWznbokN', NULL, 'http://127.0.0.1:8000', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-24 21:56:20', '2025-06-24 21:56:20'),
(793, 'KN8AFPpdDpmCkqvp28953DkXDuRpBHkkyNM5hqlV', 1, 'http://127.0.0.1:8000/admin/activities', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-24 21:57:06', '2025-06-24 21:57:06'),
(794, 'KN8AFPpdDpmCkqvp28953DkXDuRpBHkkyNM5hqlV', 1, 'http://127.0.0.1:8000/admin/subscribers', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-24 21:57:11', '2025-06-24 21:57:11'),
(795, 'QK2DhlJLJBrxEFaO1wuwUo1lFRqaB9SLVWznbokN', NULL, 'http://127.0.0.1:8000', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-24 21:57:14', '2025-06-24 21:57:14'),
(796, 'KN8AFPpdDpmCkqvp28953DkXDuRpBHkkyNM5hqlV', 1, 'http://127.0.0.1:8000/admin/activities', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-24 21:57:15', '2025-06-24 21:57:15'),
(797, 'KN8AFPpdDpmCkqvp28953DkXDuRpBHkkyNM5hqlV', 1, 'http://127.0.0.1:8000/admin/activities/user/77', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-24 21:57:41', '2025-06-24 21:57:41'),
(798, 'QK2DhlJLJBrxEFaO1wuwUo1lFRqaB9SLVWznbokN', NULL, 'http://127.0.0.1:8000', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-24 21:57:46', '2025-06-24 21:57:46'),
(799, 'KN8AFPpdDpmCkqvp28953DkXDuRpBHkkyNM5hqlV', 1, 'http://127.0.0.1:8000/admin/products', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-24 21:57:47', '2025-06-24 21:57:47'),
(800, 'QK2DhlJLJBrxEFaO1wuwUo1lFRqaB9SLVWznbokN', NULL, 'http://127.0.0.1:8000', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-24 21:58:03', '2025-06-24 21:58:03'),
(801, 'QK2DhlJLJBrxEFaO1wuwUo1lFRqaB9SLVWznbokN', NULL, 'http://127.0.0.1:8000/compare?products=154%2C152%2C155', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-24 21:58:58', '2025-06-24 21:58:58'),
(802, 'QK2DhlJLJBrxEFaO1wuwUo1lFRqaB9SLVWznbokN', NULL, 'http://127.0.0.1:8000', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-24 21:59:29', '2025-06-24 21:59:29'),
(803, 'KN8AFPpdDpmCkqvp28953DkXDuRpBHkkyNM5hqlV', 1, 'http://127.0.0.1:8000/admin/activities', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-24 22:02:55', '2025-06-24 22:02:55'),
(804, 'QK2DhlJLJBrxEFaO1wuwUo1lFRqaB9SLVWznbokN', NULL, 'http://127.0.0.1:8000/compare?products=155%2C152', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-24 22:04:01', '2025-06-24 22:04:01'),
(805, 'QK2DhlJLJBrxEFaO1wuwUo1lFRqaB9SLVWznbokN', NULL, 'http://127.0.0.1:8000/compare?products=155%2C152', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-24 22:05:29', '2025-06-24 22:05:29'),
(806, 'QK2DhlJLJBrxEFaO1wuwUo1lFRqaB9SLVWznbokN', NULL, 'http://127.0.0.1:8000/compare?products=155%2C152', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-24 22:06:50', '2025-06-24 22:06:50'),
(807, 'QK2DhlJLJBrxEFaO1wuwUo1lFRqaB9SLVWznbokN', NULL, 'http://127.0.0.1:8000', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-24 22:07:23', '2025-06-24 22:07:23'),
(808, 'QK2DhlJLJBrxEFaO1wuwUo1lFRqaB9SLVWznbokN', NULL, 'http://127.0.0.1:8000', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-24 22:07:32', '2025-06-24 22:07:32'),
(809, 'QK2DhlJLJBrxEFaO1wuwUo1lFRqaB9SLVWznbokN', NULL, 'http://127.0.0.1:8000/compare?products=154%2C155', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-24 22:08:30', '2025-06-24 22:08:30'),
(810, 'KN8AFPpdDpmCkqvp28953DkXDuRpBHkkyNM5hqlV', 1, 'http://127.0.0.1:8000/admin/activities/user/1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-24 22:10:03', '2025-06-24 22:10:03'),
(811, 'QK2DhlJLJBrxEFaO1wuwUo1lFRqaB9SLVWznbokN', NULL, 'http://127.0.0.1:8000/compare?products=154%2C155', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-24 22:12:04', '2025-06-24 22:12:04'),
(812, 'QK2DhlJLJBrxEFaO1wuwUo1lFRqaB9SLVWznbokN', NULL, 'http://127.0.0.1:8000/compare?products=154%2C155', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-24 22:17:14', '2025-06-24 22:17:14'),
(813, 'KN8AFPpdDpmCkqvp28953DkXDuRpBHkkyNM5hqlV', 1, 'http://127.0.0.1:8000/admin/activities', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-24 22:17:18', '2025-06-24 22:17:18'),
(814, 'QK2DhlJLJBrxEFaO1wuwUo1lFRqaB9SLVWznbokN', NULL, 'http://127.0.0.1:8000', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-24 22:17:43', '2025-06-24 22:17:43'),
(815, 'KN8AFPpdDpmCkqvp28953DkXDuRpBHkkyNM5hqlV', 1, 'http://127.0.0.1:8000/admin/activities', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-24 22:18:09', '2025-06-24 22:18:09'),
(816, 'KN8AFPpdDpmCkqvp28953DkXDuRpBHkkyNM5hqlV', 1, 'http://127.0.0.1:8000/admin/activities', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-24 22:18:26', '2025-06-24 22:18:26'),
(817, 'QK2DhlJLJBrxEFaO1wuwUo1lFRqaB9SLVWznbokN', NULL, 'http://127.0.0.1:8000/compare?products=155%2C152%2C154', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-24 22:18:29', '2025-06-24 22:18:29'),
(818, 'KN8AFPpdDpmCkqvp28953DkXDuRpBHkkyNM5hqlV', 1, 'http://127.0.0.1:8000/admin/activities/user/1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-24 22:21:32', '2025-06-24 22:21:32'),
(819, 'KN8AFPpdDpmCkqvp28953DkXDuRpBHkkyNM5hqlV', 1, 'http://127.0.0.1:8000/admin/activities/user/1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-24 22:22:21', '2025-06-24 22:22:21'),
(820, 'KN8AFPpdDpmCkqvp28953DkXDuRpBHkkyNM5hqlV', 1, 'http://127.0.0.1:8000/admin/activities/user/1?page=2', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-24 22:22:42', '2025-06-24 22:22:42'),
(821, 'KN8AFPpdDpmCkqvp28953DkXDuRpBHkkyNM5hqlV', 1, 'http://127.0.0.1:8000/admin/activities/user/1?page=1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-24 22:22:45', '2025-06-24 22:22:45'),
(822, 'KN8AFPpdDpmCkqvp28953DkXDuRpBHkkyNM5hqlV', 1, 'http://127.0.0.1:8000/admin/activities/user/1?page=1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-24 22:31:40', '2025-06-24 22:31:40'),
(823, 'KN8AFPpdDpmCkqvp28953DkXDuRpBHkkyNM5hqlV', 1, 'http://127.0.0.1:8000/admin/activities/user/1?page=1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-24 22:35:15', '2025-06-24 22:35:15'),
(824, 'KN8AFPpdDpmCkqvp28953DkXDuRpBHkkyNM5hqlV', 1, 'http://127.0.0.1:8000/admin/activities/user/1?page=1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-24 22:46:50', '2025-06-24 22:46:50'),
(825, 'KN8AFPpdDpmCkqvp28953DkXDuRpBHkkyNM5hqlV', 1, 'http://127.0.0.1:8000/admin/users', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-24 22:46:58', '2025-06-24 22:46:58'),
(826, 'KN8AFPpdDpmCkqvp28953DkXDuRpBHkkyNM5hqlV', 1, 'http://127.0.0.1:8000/admin/activities', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-24 22:47:02', '2025-06-24 22:47:02'),
(827, 'KN8AFPpdDpmCkqvp28953DkXDuRpBHkkyNM5hqlV', 1, 'http://127.0.0.1:8000/admin/contacts', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-24 22:49:31', '2025-06-24 22:49:31'),
(828, 'KN8AFPpdDpmCkqvp28953DkXDuRpBHkkyNM5hqlV', 1, 'http://127.0.0.1:8000/admin/contacts', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-24 22:50:25', '2025-06-24 22:50:25'),
(829, 'KN8AFPpdDpmCkqvp28953DkXDuRpBHkkyNM5hqlV', 1, 'http://127.0.0.1:8000/admin/contacts', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-24 22:51:38', '2025-06-24 22:51:38'),
(830, 'KN8AFPpdDpmCkqvp28953DkXDuRpBHkkyNM5hqlV', 1, 'http://127.0.0.1:8000/admin/activities', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-24 22:55:39', '2025-06-24 22:55:39'),
(831, 'KN8AFPpdDpmCkqvp28953DkXDuRpBHkkyNM5hqlV', 1, 'http://127.0.0.1:8000/admin/activities/user/1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-24 22:55:44', '2025-06-24 22:55:44'),
(832, 'KN8AFPpdDpmCkqvp28953DkXDuRpBHkkyNM5hqlV', 1, 'http://127.0.0.1:8000/admin/activities/user/1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-24 22:58:18', '2025-06-24 22:58:18'),
(833, 'KN8AFPpdDpmCkqvp28953DkXDuRpBHkkyNM5hqlV', 1, 'http://127.0.0.1:8000/logout', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-24 22:59:19', '2025-06-24 22:59:19'),
(834, 'aW9oOFLwDWI2YfJC3kTHcqGezRZMbntn4E90cJDe', NULL, 'http://127.0.0.1:8000/login', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-24 22:59:19', '2025-06-24 22:59:19'),
(835, 'aW9oOFLwDWI2YfJC3kTHcqGezRZMbntn4E90cJDe', NULL, 'http://127.0.0.1:8000/login', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-24 22:59:29', '2025-06-24 22:59:29'),
(836, 'wRo1xqHRTo1bHNcAtHNpoBWmhPxSB5sQFuD2t0YX', 77, 'http://127.0.0.1:8000', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-24 22:59:30', '2025-06-24 22:59:30'),
(837, 'wRo1xqHRTo1bHNcAtHNpoBWmhPxSB5sQFuD2t0YX', 77, 'http://127.0.0.1:8000/shop', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-24 22:59:34', '2025-06-24 22:59:34'),
(838, 'wRo1xqHRTo1bHNcAtHNpoBWmhPxSB5sQFuD2t0YX', 77, 'http://127.0.0.1:8000/shop', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-24 22:59:56', '2025-06-24 22:59:56'),
(839, 'wRo1xqHRTo1bHNcAtHNpoBWmhPxSB5sQFuD2t0YX', 77, 'http://127.0.0.1:8000/shop', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-24 23:00:26', '2025-06-24 23:00:26'),
(840, 'wRo1xqHRTo1bHNcAtHNpoBWmhPxSB5sQFuD2t0YX', 77, 'http://127.0.0.1:8000/shop', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-24 23:00:31', '2025-06-24 23:00:31'),
(841, 'wRo1xqHRTo1bHNcAtHNpoBWmhPxSB5sQFuD2t0YX', 77, 'http://127.0.0.1:8000/about', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-24 23:01:38', '2025-06-24 23:01:38'),
(842, 'wRo1xqHRTo1bHNcAtHNpoBWmhPxSB5sQFuD2t0YX', 77, 'http://127.0.0.1:8000/about', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-24 23:01:47', '2025-06-24 23:01:47'),
(843, 'wRo1xqHRTo1bHNcAtHNpoBWmhPxSB5sQFuD2t0YX', 77, 'http://127.0.0.1:8000/about', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-24 23:01:53', '2025-06-24 23:01:53'),
(844, 'wRo1xqHRTo1bHNcAtHNpoBWmhPxSB5sQFuD2t0YX', 77, 'http://127.0.0.1:8000/about', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-24 23:05:37', '2025-06-24 23:05:37'),
(845, 'wRo1xqHRTo1bHNcAtHNpoBWmhPxSB5sQFuD2t0YX', 77, 'http://127.0.0.1:8000/about', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-24 23:05:41', '2025-06-24 23:05:41'),
(846, 'wRo1xqHRTo1bHNcAtHNpoBWmhPxSB5sQFuD2t0YX', 77, 'http://127.0.0.1:8000/about', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-24 23:05:42', '2025-06-24 23:05:42'),
(847, 'wRo1xqHRTo1bHNcAtHNpoBWmhPxSB5sQFuD2t0YX', 77, 'http://127.0.0.1:8000/about', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-24 23:05:43', '2025-06-24 23:05:43'),
(848, 'wRo1xqHRTo1bHNcAtHNpoBWmhPxSB5sQFuD2t0YX', 77, 'http://127.0.0.1:8000/about', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-24 23:05:46', '2025-06-24 23:05:46'),
(849, 'wRo1xqHRTo1bHNcAtHNpoBWmhPxSB5sQFuD2t0YX', 77, 'http://127.0.0.1:8000/about', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-24 23:05:51', '2025-06-24 23:05:51'),
(850, 'wRo1xqHRTo1bHNcAtHNpoBWmhPxSB5sQFuD2t0YX', 77, 'http://127.0.0.1:8000/about', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-24 23:06:12', '2025-06-24 23:06:12'),
(851, 'wRo1xqHRTo1bHNcAtHNpoBWmhPxSB5sQFuD2t0YX', 77, 'http://127.0.0.1:8000/about', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-24 23:09:11', '2025-06-24 23:09:11'),
(852, 'wRo1xqHRTo1bHNcAtHNpoBWmhPxSB5sQFuD2t0YX', 77, 'http://127.0.0.1:8000/about', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-24 23:09:48', '2025-06-24 23:09:48'),
(853, 'wRo1xqHRTo1bHNcAtHNpoBWmhPxSB5sQFuD2t0YX', 77, 'http://127.0.0.1:8000/about', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-24 23:09:52', '2025-06-24 23:09:52'),
(854, 'wRo1xqHRTo1bHNcAtHNpoBWmhPxSB5sQFuD2t0YX', 77, 'http://127.0.0.1:8000/blog', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-24 23:11:46', '2025-06-24 23:11:46'),
(855, 'wRo1xqHRTo1bHNcAtHNpoBWmhPxSB5sQFuD2t0YX', 77, 'http://127.0.0.1:8000/about', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-24 23:11:50', '2025-06-24 23:11:50'),
(856, 'wRo1xqHRTo1bHNcAtHNpoBWmhPxSB5sQFuD2t0YX', 77, 'http://127.0.0.1:8000/about', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-24 23:14:07', '2025-06-24 23:14:07'),
(857, 'wRo1xqHRTo1bHNcAtHNpoBWmhPxSB5sQFuD2t0YX', 77, 'http://127.0.0.1:8000/blog', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-24 23:14:16', '2025-06-24 23:14:16'),
(858, 'wRo1xqHRTo1bHNcAtHNpoBWmhPxSB5sQFuD2t0YX', 77, 'http://127.0.0.1:8000/blog', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-24 23:19:04', '2025-06-24 23:19:04'),
(859, 'wRo1xqHRTo1bHNcAtHNpoBWmhPxSB5sQFuD2t0YX', 77, 'http://127.0.0.1:8000/contact', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-24 23:19:08', '2025-06-24 23:19:08'),
(860, 'wRo1xqHRTo1bHNcAtHNpoBWmhPxSB5sQFuD2t0YX', 77, 'http://127.0.0.1:8000/contact', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-24 23:19:30', '2025-06-24 23:19:30'),
(861, 'wRo1xqHRTo1bHNcAtHNpoBWmhPxSB5sQFuD2t0YX', 77, 'http://127.0.0.1:8000', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-24 23:19:33', '2025-06-24 23:19:33'),
(862, 'wRo1xqHRTo1bHNcAtHNpoBWmhPxSB5sQFuD2t0YX', 77, 'http://127.0.0.1:8000/shop', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-24 23:19:39', '2025-06-24 23:19:39'),
(863, 'wRo1xqHRTo1bHNcAtHNpoBWmhPxSB5sQFuD2t0YX', 77, 'http://127.0.0.1:8000/shop', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-24 23:21:01', '2025-06-24 23:21:01'),
(864, 'wRo1xqHRTo1bHNcAtHNpoBWmhPxSB5sQFuD2t0YX', 77, 'http://127.0.0.1:8000/about', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-24 23:21:10', '2025-06-24 23:21:10'),
(865, 'wRo1xqHRTo1bHNcAtHNpoBWmhPxSB5sQFuD2t0YX', 77, 'http://127.0.0.1:8000/blog', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-24 23:22:47', '2025-06-24 23:22:47'),
(866, 'wRo1xqHRTo1bHNcAtHNpoBWmhPxSB5sQFuD2t0YX', 77, 'http://127.0.0.1:8000/contact', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-24 23:23:45', '2025-06-24 23:23:45'),
(867, 'wRo1xqHRTo1bHNcAtHNpoBWmhPxSB5sQFuD2t0YX', 77, 'http://127.0.0.1:8000/contact', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-24 23:27:09', '2025-06-24 23:27:09'),
(868, 'wRo1xqHRTo1bHNcAtHNpoBWmhPxSB5sQFuD2t0YX', 77, 'http://127.0.0.1:8000/contact', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-24 23:27:20', '2025-06-24 23:27:20'),
(869, 'wRo1xqHRTo1bHNcAtHNpoBWmhPxSB5sQFuD2t0YX', 77, 'http://127.0.0.1:8000/blog', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-24 23:27:33', '2025-06-24 23:27:33'),
(870, 'wRo1xqHRTo1bHNcAtHNpoBWmhPxSB5sQFuD2t0YX', 77, 'http://127.0.0.1:8000/contact', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-24 23:27:38', '2025-06-24 23:27:38'),
(871, 'wRo1xqHRTo1bHNcAtHNpoBWmhPxSB5sQFuD2t0YX', 77, 'http://127.0.0.1:8000/contact', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-24 23:27:42', '2025-06-24 23:27:42'),
(872, 'wRo1xqHRTo1bHNcAtHNpoBWmhPxSB5sQFuD2t0YX', 77, 'http://127.0.0.1:8000/contact', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-24 23:28:43', '2025-06-24 23:28:43'),
(873, 'wRo1xqHRTo1bHNcAtHNpoBWmhPxSB5sQFuD2t0YX', 77, 'http://127.0.0.1:8000/contact', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-24 23:28:48', '2025-06-24 23:28:48'),
(874, 'wRo1xqHRTo1bHNcAtHNpoBWmhPxSB5sQFuD2t0YX', 77, 'http://127.0.0.1:8000/contact', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-24 23:31:30', '2025-06-24 23:31:30'),
(875, 'wRo1xqHRTo1bHNcAtHNpoBWmhPxSB5sQFuD2t0YX', 77, 'http://127.0.0.1:8000/contact', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-24 23:33:57', '2025-06-24 23:33:57'),
(876, 'wRo1xqHRTo1bHNcAtHNpoBWmhPxSB5sQFuD2t0YX', 77, 'http://127.0.0.1:8000/contact', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-24 23:34:01', '2025-06-24 23:34:01'),
(877, 'wRo1xqHRTo1bHNcAtHNpoBWmhPxSB5sQFuD2t0YX', 77, 'http://127.0.0.1:8000/contact', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-24 23:34:02', '2025-06-24 23:34:02'),
(878, 'wRo1xqHRTo1bHNcAtHNpoBWmhPxSB5sQFuD2t0YX', 77, 'http://127.0.0.1:8000/contact', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-24 23:34:03', '2025-06-24 23:34:03'),
(879, 'wRo1xqHRTo1bHNcAtHNpoBWmhPxSB5sQFuD2t0YX', 77, 'http://127.0.0.1:8000/contact', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-24 23:34:04', '2025-06-24 23:34:04'),
(880, 'wRo1xqHRTo1bHNcAtHNpoBWmhPxSB5sQFuD2t0YX', 77, 'http://127.0.0.1:8000/contact', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-24 23:34:07', '2025-06-24 23:34:07'),
(881, 'wRo1xqHRTo1bHNcAtHNpoBWmhPxSB5sQFuD2t0YX', 77, 'http://127.0.0.1:8000/blog', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-24 23:34:10', '2025-06-24 23:34:10'),
(882, 'wRo1xqHRTo1bHNcAtHNpoBWmhPxSB5sQFuD2t0YX', 77, 'http://127.0.0.1:8000/blog', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-24 23:34:19', '2025-06-24 23:34:19'),
(883, 'wRo1xqHRTo1bHNcAtHNpoBWmhPxSB5sQFuD2t0YX', 77, 'http://127.0.0.1:8000/blog', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-24 23:37:14', '2025-06-24 23:37:14'),
(884, 'wRo1xqHRTo1bHNcAtHNpoBWmhPxSB5sQFuD2t0YX', 77, 'http://127.0.0.1:8000/blog', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-24 23:37:21', '2025-06-24 23:37:21'),
(885, 'wRo1xqHRTo1bHNcAtHNpoBWmhPxSB5sQFuD2t0YX', 77, 'http://127.0.0.1:8000', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-24 23:37:24', '2025-06-24 23:37:24'),
(886, 'wRo1xqHRTo1bHNcAtHNpoBWmhPxSB5sQFuD2t0YX', 77, 'http://127.0.0.1:8000', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-24 23:37:34', '2025-06-24 23:37:34'),
(887, 'wRo1xqHRTo1bHNcAtHNpoBWmhPxSB5sQFuD2t0YX', 77, 'http://127.0.0.1:8000', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-24 23:38:05', '2025-06-24 23:38:05'),
(888, 'wRo1xqHRTo1bHNcAtHNpoBWmhPxSB5sQFuD2t0YX', 77, 'http://127.0.0.1:8000', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-24 23:38:28', '2025-06-24 23:38:28'),
(889, 'wRo1xqHRTo1bHNcAtHNpoBWmhPxSB5sQFuD2t0YX', 77, 'http://127.0.0.1:8000', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-24 23:38:36', '2025-06-24 23:38:36'),
(890, 'wRo1xqHRTo1bHNcAtHNpoBWmhPxSB5sQFuD2t0YX', 77, 'http://127.0.0.1:8000', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-24 23:41:22', '2025-06-24 23:41:22'),
(891, 'wRo1xqHRTo1bHNcAtHNpoBWmhPxSB5sQFuD2t0YX', 77, 'http://127.0.0.1:8000', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-24 23:43:53', '2025-06-24 23:43:53'),
(892, 'wRo1xqHRTo1bHNcAtHNpoBWmhPxSB5sQFuD2t0YX', 77, 'http://127.0.0.1:8000', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-24 23:47:47', '2025-06-24 23:47:47'),
(893, 'wRo1xqHRTo1bHNcAtHNpoBWmhPxSB5sQFuD2t0YX', 77, 'http://127.0.0.1:8000/shop', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-24 23:47:52', '2025-06-24 23:47:52'),
(894, 'wRo1xqHRTo1bHNcAtHNpoBWmhPxSB5sQFuD2t0YX', 77, 'http://127.0.0.1:8000/shop', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-24 23:47:58', '2025-06-24 23:47:58'),
(895, 'wRo1xqHRTo1bHNcAtHNpoBWmhPxSB5sQFuD2t0YX', 77, 'http://127.0.0.1:8000/product/iphone-15-pro-max-1750314062', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-24 23:58:42', '2025-06-24 23:58:42'),
(896, 'wRo1xqHRTo1bHNcAtHNpoBWmhPxSB5sQFuD2t0YX', 77, 'http://127.0.0.1:8000', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-25 00:01:52', '2025-06-25 00:01:52'),
(897, 'wRo1xqHRTo1bHNcAtHNpoBWmhPxSB5sQFuD2t0YX', 77, 'http://127.0.0.1:8000', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-25 00:05:09', '2025-06-25 00:05:09'),
(898, 'FYTiymfBcWe5Psdu3or5EoURROghyhCeqYSkGGB3', NULL, 'http://127.0.0.1:8000/compare?products=155%2C152%2C154', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-25 08:19:47', '2025-06-25 08:19:47'),
(899, 'fPxYE47EyPZHALJzHNZEj9oHViGmY6iQVGxACCgc', NULL, 'http://127.0.0.1:8000', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-25 12:04:16', '2025-06-25 12:04:16'),
(900, 'fPxYE47EyPZHALJzHNZEj9oHViGmY6iQVGxACCgc', NULL, 'http://127.0.0.1:8000', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-25 12:04:59', '2025-06-25 12:04:59'),
(901, 'fPxYE47EyPZHALJzHNZEj9oHViGmY6iQVGxACCgc', NULL, 'http://127.0.0.1:8000/login', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-25 12:05:12', '2025-06-25 12:05:12'),
(902, 'fPxYE47EyPZHALJzHNZEj9oHViGmY6iQVGxACCgc', NULL, 'http://127.0.0.1:8000/login', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-25 12:05:20', '2025-06-25 12:05:20'),
(903, '4S6xgLef2C87Fp9I5q9YrGIZOuqd8fR9J5W7q6Fv', 77, 'http://127.0.0.1:8000', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-25 12:05:21', '2025-06-25 12:05:21'),
(904, '4S6xgLef2C87Fp9I5q9YrGIZOuqd8fR9J5W7q6Fv', 77, 'http://127.0.0.1:8000/shop', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-25 12:05:47', '2025-06-25 12:05:47'),
(905, '4S6xgLef2C87Fp9I5q9YrGIZOuqd8fR9J5W7q6Fv', 77, 'http://127.0.0.1:8000/about', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-25 12:07:01', '2025-06-25 12:07:01'),
(906, '4S6xgLef2C87Fp9I5q9YrGIZOuqd8fR9J5W7q6Fv', 77, 'http://127.0.0.1:8000/shop', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-25 12:07:04', '2025-06-25 12:07:04'),
(907, '4S6xgLef2C87Fp9I5q9YrGIZOuqd8fR9J5W7q6Fv', 77, 'http://127.0.0.1:8000/blog', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-25 12:07:20', '2025-06-25 12:07:20'),
(908, '4S6xgLef2C87Fp9I5q9YrGIZOuqd8fR9J5W7q6Fv', 77, 'http://127.0.0.1:8000/about', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-25 12:07:25', '2025-06-25 12:07:25'),
(909, '4S6xgLef2C87Fp9I5q9YrGIZOuqd8fR9J5W7q6Fv', 77, 'http://127.0.0.1:8000/about', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-25 12:07:59', '2025-06-25 12:07:59'),
(910, '4S6xgLef2C87Fp9I5q9YrGIZOuqd8fR9J5W7q6Fv', 77, 'http://127.0.0.1:8000/blog', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-25 12:08:01', '2025-06-25 12:08:01'),
(911, '4S6xgLef2C87Fp9I5q9YrGIZOuqd8fR9J5W7q6Fv', 77, 'http://127.0.0.1:8000/blog', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-25 12:11:22', '2025-06-25 12:11:22'),
(912, '4S6xgLef2C87Fp9I5q9YrGIZOuqd8fR9J5W7q6Fv', 77, 'http://127.0.0.1:8000/contact', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-25 12:11:37', '2025-06-25 12:11:37'),
(913, '4S6xgLef2C87Fp9I5q9YrGIZOuqd8fR9J5W7q6Fv', 77, 'http://127.0.0.1:8000/shop', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-25 12:11:39', '2025-06-25 12:11:39'),
(914, '4S6xgLef2C87Fp9I5q9YrGIZOuqd8fR9J5W7q6Fv', 77, 'http://127.0.0.1:8000/logout', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-25 12:14:45', '2025-06-25 12:14:45'),
(915, 'Fy8osRk2vPdK3fyDSvibTjDvbVyGVcw1fS2C8TYn', NULL, 'http://127.0.0.1:8000/login', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-25 12:14:45', '2025-06-25 12:14:45'),
(916, 'Fy8osRk2vPdK3fyDSvibTjDvbVyGVcw1fS2C8TYn', NULL, 'http://127.0.0.1:8000/login', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-25 12:14:52', '2025-06-25 12:14:52'),
(917, 'gZUl9vXHxPvGYlggCtMflj9I1KSjRoMkYqQQjVJU', 1, 'http://127.0.0.1:8000/admin', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-25 12:14:53', '2025-06-25 12:14:53'),
(918, 'TSsQeFcH4QcD5emLAQJBJdqh4FJvXPmoj1dJMdFF', NULL, 'http://127.0.0.1:8000', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', NULL, '2025-06-25 13:28:35', '2025-06-25 13:28:35'),
(919, 'TSsQeFcH4QcD5emLAQJBJdqh4FJvXPmoj1dJMdFF', NULL, 'http://127.0.0.1:8000/login', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', NULL, '2025-06-25 13:29:10', '2025-06-25 13:29:10'),
(920, 'TSsQeFcH4QcD5emLAQJBJdqh4FJvXPmoj1dJMdFF', NULL, 'http://127.0.0.1:8000/login', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', NULL, '2025-06-25 13:29:23', '2025-06-25 13:29:23'),
(921, 'r745E5a8R68upZMCk79hbas3VPGoUq709qorXVDi', 1, 'http://127.0.0.1:8000/admin', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', NULL, '2025-06-25 13:29:30', '2025-06-25 13:29:30'),
(922, 'r745E5a8R68upZMCk79hbas3VPGoUq709qorXVDi', 1, 'http://127.0.0.1:8000/admin/products', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', NULL, '2025-06-25 13:29:42', '2025-06-25 13:29:42'),
(923, 'r745E5a8R68upZMCk79hbas3VPGoUq709qorXVDi', 1, 'http://127.0.0.1:8000/admin/products/152/edit', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', NULL, '2025-06-25 13:29:51', '2025-06-25 13:29:51'),
(924, 'r745E5a8R68upZMCk79hbas3VPGoUq709qorXVDi', 1, 'http://127.0.0.1:8000/admin/products/152/edit', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', NULL, '2025-06-25 13:33:20', '2025-06-25 13:33:20'),
(925, 'r745E5a8R68upZMCk79hbas3VPGoUq709qorXVDi', 1, 'http://127.0.0.1:8000/admin/products/152/edit', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', NULL, '2025-06-25 13:34:39', '2025-06-25 13:34:39'),
(926, 'r745E5a8R68upZMCk79hbas3VPGoUq709qorXVDi', 1, 'http://127.0.0.1:8000/admin/products/152/edit', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', NULL, '2025-06-25 13:40:36', '2025-06-25 13:40:36'),
(927, 'r745E5a8R68upZMCk79hbas3VPGoUq709qorXVDi', 1, 'http://127.0.0.1:8000/admin/products/152/edit', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', NULL, '2025-06-25 13:42:34', '2025-06-25 13:42:34'),
(928, 'r745E5a8R68upZMCk79hbas3VPGoUq709qorXVDi', 1, 'http://127.0.0.1:8000/admin/products/152/edit', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', NULL, '2025-06-25 13:42:45', '2025-06-25 13:42:45'),
(929, 'r745E5a8R68upZMCk79hbas3VPGoUq709qorXVDi', 1, 'http://127.0.0.1:8000/admin/products/152/edit', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', NULL, '2025-06-25 13:43:52', '2025-06-25 13:43:52'),
(930, 'r745E5a8R68upZMCk79hbas3VPGoUq709qorXVDi', 1, 'http://127.0.0.1:8000/admin/products/152/edit', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', NULL, '2025-06-25 13:54:59', '2025-06-25 13:54:59'),
(931, 'r745E5a8R68upZMCk79hbas3VPGoUq709qorXVDi', 1, 'http://127.0.0.1:8000/admin/products/152/edit', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', NULL, '2025-06-25 13:57:45', '2025-06-25 13:57:45'),
(932, 'r745E5a8R68upZMCk79hbas3VPGoUq709qorXVDi', 1, 'http://127.0.0.1:8000/admin/products/152/edit', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', NULL, '2025-06-25 14:00:58', '2025-06-25 14:00:58'),
(933, 'r745E5a8R68upZMCk79hbas3VPGoUq709qorXVDi', 1, 'http://127.0.0.1:8000/admin/products/152/edit', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', NULL, '2025-06-25 14:02:20', '2025-06-25 14:02:20'),
(934, 'r745E5a8R68upZMCk79hbas3VPGoUq709qorXVDi', 1, 'http://127.0.0.1:8000/admin/products/152/edit', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', NULL, '2025-06-25 14:29:48', '2025-06-25 14:29:48');
INSERT INTO `page_views` (`id`, `session_id`, `user_id`, `url`, `ip_address`, `user_agent`, `duration`, `created_at`, `updated_at`) VALUES
(935, 'r745E5a8R68upZMCk79hbas3VPGoUq709qorXVDi', 1, 'http://127.0.0.1:8000/admin/products/152/edit', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', NULL, '2025-06-25 14:31:47', '2025-06-25 14:31:47'),
(936, 'r745E5a8R68upZMCk79hbas3VPGoUq709qorXVDi', 1, 'http://127.0.0.1:8000/admin/products/152/edit', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', NULL, '2025-06-25 14:32:25', '2025-06-25 14:32:25'),
(937, 'r745E5a8R68upZMCk79hbas3VPGoUq709qorXVDi', 1, 'http://127.0.0.1:8000/admin/products/152/edit', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', NULL, '2025-06-25 14:33:49', '2025-06-25 14:33:49'),
(938, 'r745E5a8R68upZMCk79hbas3VPGoUq709qorXVDi', 1, 'http://127.0.0.1:8000/admin/products/152/edit', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', NULL, '2025-06-25 14:37:46', '2025-06-25 14:37:46'),
(939, 'r745E5a8R68upZMCk79hbas3VPGoUq709qorXVDi', 1, 'http://127.0.0.1:8000/admin/products/152/edit', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', NULL, '2025-06-25 15:13:49', '2025-06-25 15:13:49'),
(940, 'r745E5a8R68upZMCk79hbas3VPGoUq709qorXVDi', 1, 'http://127.0.0.1:8000/admin/products/152/edit', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', NULL, '2025-06-25 15:14:46', '2025-06-25 15:14:46'),
(941, 'r745E5a8R68upZMCk79hbas3VPGoUq709qorXVDi', 1, 'http://127.0.0.1:8000/admin/products/check-duplicate-variants', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', NULL, '2025-06-25 15:15:30', '2025-06-25 15:15:30'),
(942, 'r745E5a8R68upZMCk79hbas3VPGoUq709qorXVDi', 1, 'http://127.0.0.1:8000/admin/products/152', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', NULL, '2025-06-25 15:15:57', '2025-06-25 15:15:57'),
(943, 'r745E5a8R68upZMCk79hbas3VPGoUq709qorXVDi', 1, 'http://127.0.0.1:8000/admin/products', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', NULL, '2025-06-25 15:16:01', '2025-06-25 15:16:01'),
(944, 'r745E5a8R68upZMCk79hbas3VPGoUq709qorXVDi', 1, 'http://127.0.0.1:8000/admin/products/152/edit', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', NULL, '2025-06-25 15:16:09', '2025-06-25 15:16:09'),
(945, 'r745E5a8R68upZMCk79hbas3VPGoUq709qorXVDi', 1, 'http://127.0.0.1:8000/admin/variants', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', NULL, '2025-06-25 15:16:25', '2025-06-25 15:16:25'),
(946, 'r745E5a8R68upZMCk79hbas3VPGoUq709qorXVDi', 1, 'http://127.0.0.1:8000/admin/variants/trash', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', NULL, '2025-06-25 15:16:32', '2025-06-25 15:16:32'),
(947, 'r745E5a8R68upZMCk79hbas3VPGoUq709qorXVDi', 1, 'http://127.0.0.1:8000/admin/products/check-duplicate-variants', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', NULL, '2025-06-25 15:16:50', '2025-06-25 15:16:50'),
(948, 'O9tADuaWqpA7wpXZZWikb0jrSVhDxVvqwYGXldOo', NULL, 'http://127.0.0.1:8000', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-25 15:52:52', '2025-06-25 15:52:52'),
(949, 'O9tADuaWqpA7wpXZZWikb0jrSVhDxVvqwYGXldOo', NULL, 'http://127.0.0.1:8000/login', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-25 15:52:58', '2025-06-25 15:52:58'),
(950, 'O9tADuaWqpA7wpXZZWikb0jrSVhDxVvqwYGXldOo', NULL, 'http://127.0.0.1:8000/login', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-25 15:53:05', '2025-06-25 15:53:05'),
(951, 'i7nuKl31QkdH1wyMtnBUHnLkbN0YtCqsQXWsXQzU', 1, 'http://127.0.0.1:8000/admin', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-25 15:53:06', '2025-06-25 15:53:06'),
(952, 'i7nuKl31QkdH1wyMtnBUHnLkbN0YtCqsQXWsXQzU', 1, 'http://127.0.0.1:8000/admin/activities', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-25 15:53:14', '2025-06-25 15:53:14'),
(953, 'i7nuKl31QkdH1wyMtnBUHnLkbN0YtCqsQXWsXQzU', 1, 'http://127.0.0.1:8000/admin/activities/user/1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-25 15:53:51', '2025-06-25 15:53:51'),
(954, 'i7nuKl31QkdH1wyMtnBUHnLkbN0YtCqsQXWsXQzU', 1, 'http://127.0.0.1:8000', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-25 16:12:11', '2025-06-25 16:12:11'),
(955, 'i7nuKl31QkdH1wyMtnBUHnLkbN0YtCqsQXWsXQzU', 1, 'http://127.0.0.1:8000/admin', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-25 16:12:19', '2025-06-25 16:12:19'),
(956, 'i7nuKl31QkdH1wyMtnBUHnLkbN0YtCqsQXWsXQzU', 1, 'http://127.0.0.1:8000', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-25 16:12:39', '2025-06-25 16:12:39'),
(957, 'i7nuKl31QkdH1wyMtnBUHnLkbN0YtCqsQXWsXQzU', 1, 'http://127.0.0.1:8000', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-25 16:26:15', '2025-06-25 16:26:15'),
(958, 'i7nuKl31QkdH1wyMtnBUHnLkbN0YtCqsQXWsXQzU', 1, 'http://127.0.0.1:8000/shop', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-25 16:26:27', '2025-06-25 16:26:27'),
(959, 'i7nuKl31QkdH1wyMtnBUHnLkbN0YtCqsQXWsXQzU', 1, 'http://127.0.0.1:8000/shop', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-25 16:27:13', '2025-06-25 16:27:13'),
(960, 'i7nuKl31QkdH1wyMtnBUHnLkbN0YtCqsQXWsXQzU', 1, 'http://127.0.0.1:8000/shop', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-25 16:27:46', '2025-06-25 16:27:46'),
(961, 'i7nuKl31QkdH1wyMtnBUHnLkbN0YtCqsQXWsXQzU', 1, 'http://127.0.0.1:8000/shop', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-25 16:27:59', '2025-06-25 16:27:59'),
(962, 'i7nuKl31QkdH1wyMtnBUHnLkbN0YtCqsQXWsXQzU', 1, 'http://127.0.0.1:8000/shop', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-25 16:29:21', '2025-06-25 16:29:21'),
(963, 'i7nuKl31QkdH1wyMtnBUHnLkbN0YtCqsQXWsXQzU', 1, 'http://127.0.0.1:8000/product/iphone-15-pro-max-1750314062', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-25 16:30:56', '2025-06-25 16:30:56'),
(964, 'i7nuKl31QkdH1wyMtnBUHnLkbN0YtCqsQXWsXQzU', 1, 'http://127.0.0.1:8000/checkout?image=http%3A%2F%2F127.0.0.1%3A8000%2Fuploads%2Fproducts%2F1750314063_0_iphone-16-pro-max-white-titan-1-638621796200037842-650x650.jpg&quantity=1&variant_id=244', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-25 16:34:10', '2025-06-25 16:34:10'),
(965, 'i7nuKl31QkdH1wyMtnBUHnLkbN0YtCqsQXWsXQzU', 1, 'http://127.0.0.1:8000/product/iphone-15-pro-max-1750314062', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-25 16:34:12', '2025-06-25 16:34:12'),
(966, 'i7nuKl31QkdH1wyMtnBUHnLkbN0YtCqsQXWsXQzU', 1, 'http://127.0.0.1:8000/checkout?image=http%3A%2F%2F127.0.0.1%3A8000%2Fuploads%2Fproducts%2F1750314063_0_iphone-16-pro-max-titan-trang-thumb-650x650.png&quantity=1&variant_id=244', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-25 16:34:19', '2025-06-25 16:34:19'),
(967, 'i7nuKl31QkdH1wyMtnBUHnLkbN0YtCqsQXWsXQzU', 1, 'http://127.0.0.1:8000/product/iphone-15-pro-max-1750314062', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-25 16:34:19', '2025-06-25 16:34:19'),
(968, 'i7nuKl31QkdH1wyMtnBUHnLkbN0YtCqsQXWsXQzU', 1, 'http://127.0.0.1:8000', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-25 16:34:23', '2025-06-25 16:34:23'),
(969, 'i7nuKl31QkdH1wyMtnBUHnLkbN0YtCqsQXWsXQzU', 1, 'http://127.0.0.1:8000', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-25 16:34:47', '2025-06-25 16:34:47'),
(970, 'i7nuKl31QkdH1wyMtnBUHnLkbN0YtCqsQXWsXQzU', 1, 'http://127.0.0.1:8000', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-25 16:35:26', '2025-06-25 16:35:26'),
(971, 'i7nuKl31QkdH1wyMtnBUHnLkbN0YtCqsQXWsXQzU', 1, 'http://127.0.0.1:8000/shop', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-25 16:35:31', '2025-06-25 16:35:31'),
(972, 'i7nuKl31QkdH1wyMtnBUHnLkbN0YtCqsQXWsXQzU', 1, 'http://127.0.0.1:8000/shop', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-25 16:35:39', '2025-06-25 16:35:39'),
(973, 'i7nuKl31QkdH1wyMtnBUHnLkbN0YtCqsQXWsXQzU', 1, 'http://127.0.0.1:8000/shop', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-25 16:35:56', '2025-06-25 16:35:56'),
(974, 'i7nuKl31QkdH1wyMtnBUHnLkbN0YtCqsQXWsXQzU', 1, 'http://127.0.0.1:8000/shop', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-25 16:36:17', '2025-06-25 16:36:17'),
(975, 'i7nuKl31QkdH1wyMtnBUHnLkbN0YtCqsQXWsXQzU', 1, 'http://127.0.0.1:8000/shop', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-25 16:37:19', '2025-06-25 16:37:19'),
(976, 'i7nuKl31QkdH1wyMtnBUHnLkbN0YtCqsQXWsXQzU', 1, 'http://127.0.0.1:8000/shop', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-25 16:37:25', '2025-06-25 16:37:25'),
(977, 'i7nuKl31QkdH1wyMtnBUHnLkbN0YtCqsQXWsXQzU', 1, 'http://127.0.0.1:8000/shop', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-25 16:42:08', '2025-06-25 16:42:08'),
(978, 'i7nuKl31QkdH1wyMtnBUHnLkbN0YtCqsQXWsXQzU', 1, 'http://127.0.0.1:8000/shop', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-25 16:42:22', '2025-06-25 16:42:22'),
(979, 'i7nuKl31QkdH1wyMtnBUHnLkbN0YtCqsQXWsXQzU', 1, 'http://127.0.0.1:8000/shop', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-25 16:42:36', '2025-06-25 16:42:36'),
(980, 'i7nuKl31QkdH1wyMtnBUHnLkbN0YtCqsQXWsXQzU', 1, 'http://127.0.0.1:8000/shop', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-25 16:43:40', '2025-06-25 16:43:40'),
(981, 'i7nuKl31QkdH1wyMtnBUHnLkbN0YtCqsQXWsXQzU', 1, 'http://127.0.0.1:8000/shop', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-25 16:43:48', '2025-06-25 16:43:48'),
(982, 'i7nuKl31QkdH1wyMtnBUHnLkbN0YtCqsQXWsXQzU', 1, 'http://127.0.0.1:8000/shop', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-25 16:44:47', '2025-06-25 16:44:47'),
(983, 'i7nuKl31QkdH1wyMtnBUHnLkbN0YtCqsQXWsXQzU', 1, 'http://127.0.0.1:8000/shop', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-25 16:45:25', '2025-06-25 16:45:25'),
(984, 'i7nuKl31QkdH1wyMtnBUHnLkbN0YtCqsQXWsXQzU', 1, 'http://127.0.0.1:8000/shop', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-25 16:46:50', '2025-06-25 16:46:50'),
(985, 'i7nuKl31QkdH1wyMtnBUHnLkbN0YtCqsQXWsXQzU', 1, 'http://127.0.0.1:8000/shop', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-25 16:47:00', '2025-06-25 16:47:00'),
(986, 'i7nuKl31QkdH1wyMtnBUHnLkbN0YtCqsQXWsXQzU', 1, 'http://127.0.0.1:8000/shop', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-25 16:47:30', '2025-06-25 16:47:30'),
(987, 'i7nuKl31QkdH1wyMtnBUHnLkbN0YtCqsQXWsXQzU', 1, 'http://127.0.0.1:8000/shop', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-25 16:49:31', '2025-06-25 16:49:31'),
(988, 'i7nuKl31QkdH1wyMtnBUHnLkbN0YtCqsQXWsXQzU', 1, 'http://127.0.0.1:8000/shop', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-25 16:51:55', '2025-06-25 16:51:55'),
(989, 'i7nuKl31QkdH1wyMtnBUHnLkbN0YtCqsQXWsXQzU', 1, 'http://127.0.0.1:8000/shop', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-25 16:52:26', '2025-06-25 16:52:26'),
(990, 'i7nuKl31QkdH1wyMtnBUHnLkbN0YtCqsQXWsXQzU', 1, 'http://127.0.0.1:8000/about', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-25 16:53:46', '2025-06-25 16:53:46'),
(991, 'i7nuKl31QkdH1wyMtnBUHnLkbN0YtCqsQXWsXQzU', 1, 'http://127.0.0.1:8000/about', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-25 16:55:29', '2025-06-25 16:55:29'),
(992, 'i7nuKl31QkdH1wyMtnBUHnLkbN0YtCqsQXWsXQzU', 1, 'http://127.0.0.1:8000/about', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-25 16:55:34', '2025-06-25 16:55:34'),
(993, 'i7nuKl31QkdH1wyMtnBUHnLkbN0YtCqsQXWsXQzU', 1, 'http://127.0.0.1:8000/about', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-25 16:57:10', '2025-06-25 16:57:10'),
(994, 'i7nuKl31QkdH1wyMtnBUHnLkbN0YtCqsQXWsXQzU', 1, 'http://127.0.0.1:8000/about', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-25 16:57:23', '2025-06-25 16:57:23'),
(995, 'i7nuKl31QkdH1wyMtnBUHnLkbN0YtCqsQXWsXQzU', 1, 'http://127.0.0.1:8000/about', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-25 16:58:05', '2025-06-25 16:58:05'),
(996, 'i7nuKl31QkdH1wyMtnBUHnLkbN0YtCqsQXWsXQzU', 1, 'http://127.0.0.1:8000/about', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-25 16:58:11', '2025-06-25 16:58:11'),
(997, 'i7nuKl31QkdH1wyMtnBUHnLkbN0YtCqsQXWsXQzU', 1, 'http://127.0.0.1:8000/about', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-25 17:01:23', '2025-06-25 17:01:23'),
(998, 'i7nuKl31QkdH1wyMtnBUHnLkbN0YtCqsQXWsXQzU', 1, 'http://127.0.0.1:8000/about', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-25 17:01:29', '2025-06-25 17:01:29'),
(999, 'i7nuKl31QkdH1wyMtnBUHnLkbN0YtCqsQXWsXQzU', 1, 'http://127.0.0.1:8000/about', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-25 17:05:14', '2025-06-25 17:05:14'),
(1000, 'i7nuKl31QkdH1wyMtnBUHnLkbN0YtCqsQXWsXQzU', 1, 'http://127.0.0.1:8000/about', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-25 17:05:24', '2025-06-25 17:05:24'),
(1001, 'i7nuKl31QkdH1wyMtnBUHnLkbN0YtCqsQXWsXQzU', 1, 'http://127.0.0.1:8000/about', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-25 17:06:46', '2025-06-25 17:06:46'),
(1002, 'i7nuKl31QkdH1wyMtnBUHnLkbN0YtCqsQXWsXQzU', 1, 'http://127.0.0.1:8000/about', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-25 17:10:57', '2025-06-25 17:10:57'),
(1003, 'i7nuKl31QkdH1wyMtnBUHnLkbN0YtCqsQXWsXQzU', 1, 'http://127.0.0.1:8000/about', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-25 17:13:59', '2025-06-25 17:13:59'),
(1004, 'i7nuKl31QkdH1wyMtnBUHnLkbN0YtCqsQXWsXQzU', 1, 'http://127.0.0.1:8000/track/start', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-25 17:14:01', '2025-06-25 17:14:01'),
(1005, 'i7nuKl31QkdH1wyMtnBUHnLkbN0YtCqsQXWsXQzU', 1, 'http://127.0.0.1:8000/about', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-25 17:14:01', '2025-06-25 17:14:01'),
(1006, 'i7nuKl31QkdH1wyMtnBUHnLkbN0YtCqsQXWsXQzU', 1, 'http://127.0.0.1:8000/about', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-25 17:14:12', '2025-06-25 17:14:12'),
(1007, 'i7nuKl31QkdH1wyMtnBUHnLkbN0YtCqsQXWsXQzU', 1, 'http://127.0.0.1:8000/track/start', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-25 17:14:14', '2025-06-25 17:14:14'),
(1008, 'i7nuKl31QkdH1wyMtnBUHnLkbN0YtCqsQXWsXQzU', 1, 'http://127.0.0.1:8000/about', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-25 17:14:14', '2025-06-25 17:14:14'),
(1009, 'i7nuKl31QkdH1wyMtnBUHnLkbN0YtCqsQXWsXQzU', 1, 'http://127.0.0.1:8000/shop', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-25 17:14:26', '2025-06-25 17:14:26'),
(1010, 'i7nuKl31QkdH1wyMtnBUHnLkbN0YtCqsQXWsXQzU', 1, 'http://127.0.0.1:8000/track/start', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-25 17:14:29', '2025-06-25 17:14:29'),
(1011, 'i7nuKl31QkdH1wyMtnBUHnLkbN0YtCqsQXWsXQzU', 1, 'http://127.0.0.1:8000/shop', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-25 17:14:29', '2025-06-25 17:14:29'),
(1012, 'i7nuKl31QkdH1wyMtnBUHnLkbN0YtCqsQXWsXQzU', 1, 'http://127.0.0.1:8000/blog', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-25 17:15:04', '2025-06-25 17:15:04'),
(1013, 'i7nuKl31QkdH1wyMtnBUHnLkbN0YtCqsQXWsXQzU', 1, 'http://127.0.0.1:8000/track/start', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-25 17:15:05', '2025-06-25 17:15:05'),
(1014, 'i7nuKl31QkdH1wyMtnBUHnLkbN0YtCqsQXWsXQzU', 1, 'http://127.0.0.1:8000/blog', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-25 17:15:05', '2025-06-25 17:15:05'),
(1015, 'i7nuKl31QkdH1wyMtnBUHnLkbN0YtCqsQXWsXQzU', 1, 'http://127.0.0.1:8000/contact', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-25 17:15:10', '2025-06-25 17:15:10'),
(1016, 'i7nuKl31QkdH1wyMtnBUHnLkbN0YtCqsQXWsXQzU', 1, 'http://127.0.0.1:8000/track/start', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-25 17:15:11', '2025-06-25 17:15:11'),
(1017, 'i7nuKl31QkdH1wyMtnBUHnLkbN0YtCqsQXWsXQzU', 1, 'http://127.0.0.1:8000/contact', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-25 17:15:11', '2025-06-25 17:15:11'),
(1018, 'i7nuKl31QkdH1wyMtnBUHnLkbN0YtCqsQXWsXQzU', 1, 'http://127.0.0.1:8000/admin', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-25 17:15:33', '2025-06-25 17:15:33'),
(1019, 'i7nuKl31QkdH1wyMtnBUHnLkbN0YtCqsQXWsXQzU', 1, 'http://127.0.0.1:8000', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-25 17:15:51', '2025-06-25 17:15:51'),
(1020, 'i7nuKl31QkdH1wyMtnBUHnLkbN0YtCqsQXWsXQzU', 1, 'http://127.0.0.1:8000/track/start', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-25 17:15:53', '2025-06-25 17:15:53'),
(1021, 'i7nuKl31QkdH1wyMtnBUHnLkbN0YtCqsQXWsXQzU', 1, 'http://127.0.0.1:8000/', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-25 17:15:53', '2025-06-25 17:15:53'),
(1022, 'i7nuKl31QkdH1wyMtnBUHnLkbN0YtCqsQXWsXQzU', 1, 'http://127.0.0.1:8000', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-25 17:19:11', '2025-06-25 17:19:11'),
(1023, 'i7nuKl31QkdH1wyMtnBUHnLkbN0YtCqsQXWsXQzU', 1, 'http://127.0.0.1:8000/track/start', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-25 17:19:15', '2025-06-25 17:19:15'),
(1024, 'i7nuKl31QkdH1wyMtnBUHnLkbN0YtCqsQXWsXQzU', 1, 'http://127.0.0.1:8000/', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-25 17:19:15', '2025-06-25 17:19:15'),
(1025, 'i7nuKl31QkdH1wyMtnBUHnLkbN0YtCqsQXWsXQzU', 1, 'http://127.0.0.1:8000', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-25 17:20:09', '2025-06-25 17:20:09'),
(1026, 'i7nuKl31QkdH1wyMtnBUHnLkbN0YtCqsQXWsXQzU', 1, 'http://127.0.0.1:8000/track/start', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-25 17:20:11', '2025-06-25 17:20:11'),
(1027, 'i7nuKl31QkdH1wyMtnBUHnLkbN0YtCqsQXWsXQzU', 1, 'http://127.0.0.1:8000/', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-25 17:20:11', '2025-06-25 17:20:11'),
(1028, 'i7nuKl31QkdH1wyMtnBUHnLkbN0YtCqsQXWsXQzU', 1, 'http://127.0.0.1:8000/shop', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-25 17:20:17', '2025-06-25 17:20:17'),
(1029, 'i7nuKl31QkdH1wyMtnBUHnLkbN0YtCqsQXWsXQzU', 1, 'http://127.0.0.1:8000/track/start', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-25 17:20:19', '2025-06-25 17:20:19'),
(1030, 'i7nuKl31QkdH1wyMtnBUHnLkbN0YtCqsQXWsXQzU', 1, 'http://127.0.0.1:8000/shop', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-25 17:20:19', '2025-06-25 17:20:19'),
(1031, 'i7nuKl31QkdH1wyMtnBUHnLkbN0YtCqsQXWsXQzU', 1, 'http://127.0.0.1:8000/about', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-25 17:20:31', '2025-06-25 17:20:31'),
(1032, 'i7nuKl31QkdH1wyMtnBUHnLkbN0YtCqsQXWsXQzU', 1, 'http://127.0.0.1:8000/track/start', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-25 17:20:32', '2025-06-25 17:20:32'),
(1033, 'i7nuKl31QkdH1wyMtnBUHnLkbN0YtCqsQXWsXQzU', 1, 'http://127.0.0.1:8000/about', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-25 17:20:32', '2025-06-25 17:20:32'),
(1034, 'i7nuKl31QkdH1wyMtnBUHnLkbN0YtCqsQXWsXQzU', 1, 'http://127.0.0.1:8000', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-25 17:22:18', '2025-06-25 17:22:18'),
(1035, 'i7nuKl31QkdH1wyMtnBUHnLkbN0YtCqsQXWsXQzU', 1, 'http://127.0.0.1:8000/track/start', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-25 17:22:19', '2025-06-25 17:22:19'),
(1036, 'i7nuKl31QkdH1wyMtnBUHnLkbN0YtCqsQXWsXQzU', 1, 'http://127.0.0.1:8000/', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-25 17:22:19', '2025-06-25 17:22:19'),
(1037, 'i7nuKl31QkdH1wyMtnBUHnLkbN0YtCqsQXWsXQzU', 1, 'http://127.0.0.1:8000/increment-view/155', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-25 17:22:23', '2025-06-25 17:22:23'),
(1038, 'i7nuKl31QkdH1wyMtnBUHnLkbN0YtCqsQXWsXQzU', 1, 'http://127.0.0.1:8000/product/iphone-14-pro-max-1750314182', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-25 17:22:23', '2025-06-25 17:22:23'),
(1039, 'i7nuKl31QkdH1wyMtnBUHnLkbN0YtCqsQXWsXQzU', 1, 'http://127.0.0.1:8000/track/start', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-25 17:22:25', '2025-06-25 17:22:25'),
(1040, 'i7nuKl31QkdH1wyMtnBUHnLkbN0YtCqsQXWsXQzU', 1, 'http://127.0.0.1:8000/product/iphone-14-pro-max-1750314182', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-25 17:22:25', '2025-06-25 17:22:25'),
(1041, 'nc3BD70KjNVUMSeZ9T3s0ir9ex6pzxpLauIpuvx9', NULL, 'http://127.0.0.1:8000', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-25 21:54:19', '2025-06-25 21:54:19'),
(1042, 'nc3BD70KjNVUMSeZ9T3s0ir9ex6pzxpLauIpuvx9', NULL, 'http://127.0.0.1:8000/track/start', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-25 21:54:23', '2025-06-25 21:54:23'),
(1043, 'nc3BD70KjNVUMSeZ9T3s0ir9ex6pzxpLauIpuvx9', NULL, 'http://127.0.0.1:8000/', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-25 21:54:23', '2025-06-25 21:54:23'),
(1044, 'nc3BD70KjNVUMSeZ9T3s0ir9ex6pzxpLauIpuvx9', NULL, 'http://127.0.0.1:8000', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-25 21:55:34', '2025-06-25 21:55:34'),
(1045, 'nc3BD70KjNVUMSeZ9T3s0ir9ex6pzxpLauIpuvx9', NULL, 'http://127.0.0.1:8000/track/start', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-25 21:55:35', '2025-06-25 21:55:35'),
(1046, 'nc3BD70KjNVUMSeZ9T3s0ir9ex6pzxpLauIpuvx9', NULL, 'http://127.0.0.1:8000/', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-25 21:55:35', '2025-06-25 21:55:35'),
(1047, 'nc3BD70KjNVUMSeZ9T3s0ir9ex6pzxpLauIpuvx9', NULL, 'http://127.0.0.1:8000', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-25 21:56:17', '2025-06-25 21:56:17'),
(1048, 'nc3BD70KjNVUMSeZ9T3s0ir9ex6pzxpLauIpuvx9', NULL, 'http://127.0.0.1:8000/track/start', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-25 21:56:20', '2025-06-25 21:56:20'),
(1049, 'nc3BD70KjNVUMSeZ9T3s0ir9ex6pzxpLauIpuvx9', NULL, 'http://127.0.0.1:8000/', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-25 21:56:20', '2025-06-25 21:56:20'),
(1050, 'nc3BD70KjNVUMSeZ9T3s0ir9ex6pzxpLauIpuvx9', NULL, 'http://127.0.0.1:8000', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-25 21:59:38', '2025-06-25 21:59:38'),
(1051, 'nc3BD70KjNVUMSeZ9T3s0ir9ex6pzxpLauIpuvx9', NULL, 'http://127.0.0.1:8000/track/start', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-25 21:59:41', '2025-06-25 21:59:41'),
(1052, 'nc3BD70KjNVUMSeZ9T3s0ir9ex6pzxpLauIpuvx9', NULL, 'http://127.0.0.1:8000/', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-25 21:59:41', '2025-06-25 21:59:41'),
(1053, 'nc3BD70KjNVUMSeZ9T3s0ir9ex6pzxpLauIpuvx9', NULL, 'http://127.0.0.1:8000', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-25 21:59:53', '2025-06-25 21:59:53'),
(1054, 'nc3BD70KjNVUMSeZ9T3s0ir9ex6pzxpLauIpuvx9', NULL, 'http://127.0.0.1:8000/track/start', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-25 21:59:55', '2025-06-25 21:59:55'),
(1055, 'nc3BD70KjNVUMSeZ9T3s0ir9ex6pzxpLauIpuvx9', NULL, 'http://127.0.0.1:8000/', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-25 21:59:55', '2025-06-25 21:59:55'),
(1056, 'nc3BD70KjNVUMSeZ9T3s0ir9ex6pzxpLauIpuvx9', NULL, 'http://127.0.0.1:8000/login', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-25 21:59:58', '2025-06-25 21:59:58'),
(1057, 'nc3BD70KjNVUMSeZ9T3s0ir9ex6pzxpLauIpuvx9', NULL, 'http://127.0.0.1:8000/login', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-25 22:00:10', '2025-06-25 22:00:10'),
(1058, 'UyBjyeNI1OghD49S3NrnaK65DpLuDuywAaEb23X6', 77, 'http://127.0.0.1:8000', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-25 22:00:12', '2025-06-25 22:00:12'),
(1059, 'UyBjyeNI1OghD49S3NrnaK65DpLuDuywAaEb23X6', 77, 'http://127.0.0.1:8000/track/start', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-25 22:00:13', '2025-06-25 22:00:13'),
(1060, 'UyBjyeNI1OghD49S3NrnaK65DpLuDuywAaEb23X6', 77, 'http://127.0.0.1:8000/', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-25 22:00:13', '2025-06-25 22:00:13'),
(1061, 'UyBjyeNI1OghD49S3NrnaK65DpLuDuywAaEb23X6', 77, 'http://127.0.0.1:8000/shop', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-25 22:00:26', '2025-06-25 22:00:26'),
(1062, 'UyBjyeNI1OghD49S3NrnaK65DpLuDuywAaEb23X6', 77, 'http://127.0.0.1:8000/track/start', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-25 22:00:29', '2025-06-25 22:00:29'),
(1063, 'UyBjyeNI1OghD49S3NrnaK65DpLuDuywAaEb23X6', 77, 'http://127.0.0.1:8000/shop', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-25 22:00:29', '2025-06-25 22:00:29'),
(1064, 'UyBjyeNI1OghD49S3NrnaK65DpLuDuywAaEb23X6', 77, 'http://127.0.0.1:8000/shop', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-25 22:01:44', '2025-06-25 22:01:44'),
(1065, 'UyBjyeNI1OghD49S3NrnaK65DpLuDuywAaEb23X6', 77, 'http://127.0.0.1:8000/track/start', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-25 22:01:46', '2025-06-25 22:01:46'),
(1066, 'UyBjyeNI1OghD49S3NrnaK65DpLuDuywAaEb23X6', 77, 'http://127.0.0.1:8000/shop', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', -9, '2025-06-25 22:01:46', '2025-06-25 22:01:54'),
(1067, 'UyBjyeNI1OghD49S3NrnaK65DpLuDuywAaEb23X6', 77, 'http://127.0.0.1:8000/about', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-25 22:01:54', '2025-06-25 22:01:54'),
(1068, 'UyBjyeNI1OghD49S3NrnaK65DpLuDuywAaEb23X6', 77, 'http://127.0.0.1:8000/track/stop', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-25 22:01:54', '2025-06-25 22:01:54'),
(1069, 'UyBjyeNI1OghD49S3NrnaK65DpLuDuywAaEb23X6', 77, 'http://127.0.0.1:8000/track/start', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-25 22:01:56', '2025-06-25 22:01:56'),
(1070, 'UyBjyeNI1OghD49S3NrnaK65DpLuDuywAaEb23X6', 77, 'http://127.0.0.1:8000/about', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', -31, '2025-06-25 22:01:56', '2025-06-25 22:02:27'),
(1071, 'UyBjyeNI1OghD49S3NrnaK65DpLuDuywAaEb23X6', 77, 'http://127.0.0.1:8000/blog', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-25 22:02:26', '2025-06-25 22:02:26'),
(1072, 'UyBjyeNI1OghD49S3NrnaK65DpLuDuywAaEb23X6', 77, 'http://127.0.0.1:8000/track/stop', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-25 22:02:26', '2025-06-25 22:02:26'),
(1073, 'UyBjyeNI1OghD49S3NrnaK65DpLuDuywAaEb23X6', 77, 'http://127.0.0.1:8000/track/start', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-25 22:02:28', '2025-06-25 22:02:28'),
(1074, 'UyBjyeNI1OghD49S3NrnaK65DpLuDuywAaEb23X6', 77, 'http://127.0.0.1:8000/blog', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', -71, '2025-06-25 22:02:28', '2025-06-25 22:03:39'),
(1075, 'UyBjyeNI1OghD49S3NrnaK65DpLuDuywAaEb23X6', 77, 'http://127.0.0.1:8000/contact', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-25 22:03:38', '2025-06-25 22:03:38'),
(1076, 'UyBjyeNI1OghD49S3NrnaK65DpLuDuywAaEb23X6', 77, 'http://127.0.0.1:8000/track/stop', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-25 22:03:39', '2025-06-25 22:03:39'),
(1077, 'UyBjyeNI1OghD49S3NrnaK65DpLuDuywAaEb23X6', 77, 'http://127.0.0.1:8000/track/start', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-25 22:03:40', '2025-06-25 22:03:40'),
(1078, 'UyBjyeNI1OghD49S3NrnaK65DpLuDuywAaEb23X6', 77, 'http://127.0.0.1:8000/contact', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', -203, '2025-06-25 22:03:40', '2025-06-25 22:07:02'),
(1079, 'UyBjyeNI1OghD49S3NrnaK65DpLuDuywAaEb23X6', 77, 'http://127.0.0.1:8000/blog', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-25 22:07:02', '2025-06-25 22:07:02'),
(1080, 'UyBjyeNI1OghD49S3NrnaK65DpLuDuywAaEb23X6', 77, 'http://127.0.0.1:8000/track/stop', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-25 22:07:02', '2025-06-25 22:07:02'),
(1081, 'UyBjyeNI1OghD49S3NrnaK65DpLuDuywAaEb23X6', 77, 'http://127.0.0.1:8000/track/start', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-25 22:07:03', '2025-06-25 22:07:03'),
(1082, 'UyBjyeNI1OghD49S3NrnaK65DpLuDuywAaEb23X6', 77, 'http://127.0.0.1:8000/blog', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-25 22:07:03', '2025-06-25 22:07:03'),
(1083, 'UyBjyeNI1OghD49S3NrnaK65DpLuDuywAaEb23X6', 77, 'http://127.0.0.1:8000/logout', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-25 22:09:01', '2025-06-25 22:09:01'),
(1084, 'XOmzZHEBETofZnNR4pIM3wfbh3Z5PgoAA7iNYk6M', NULL, 'http://127.0.0.1:8000/login', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-25 22:09:02', '2025-06-25 22:09:02'),
(1085, 'XOmzZHEBETofZnNR4pIM3wfbh3Z5PgoAA7iNYk6M', NULL, 'http://127.0.0.1:8000/login', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-25 22:09:24', '2025-06-25 22:09:24'),
(1086, 'tEEkMcs3HrlRGL37F7I2lQFxZXRIxMiRL3KZe7bU', 1, 'http://127.0.0.1:8000/admin', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-25 22:09:24', '2025-06-25 22:09:24'),
(1087, 'tEEkMcs3HrlRGL37F7I2lQFxZXRIxMiRL3KZe7bU', 1, 'http://127.0.0.1:8000/admin/activities', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-25 22:09:32', '2025-06-25 22:09:32'),
(1088, 'tEEkMcs3HrlRGL37F7I2lQFxZXRIxMiRL3KZe7bU', 1, 'http://127.0.0.1:8000/admin/activities/user/77', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-25 22:09:39', '2025-06-25 22:09:39'),
(1089, 'tEEkMcs3HrlRGL37F7I2lQFxZXRIxMiRL3KZe7bU', 1, 'http://127.0.0.1:8000/admin/blogs', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-25 22:13:00', '2025-06-25 22:13:00'),
(1090, 'tEEkMcs3HrlRGL37F7I2lQFxZXRIxMiRL3KZe7bU', 1, 'http://127.0.0.1:8000/logout', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-25 22:14:47', '2025-06-25 22:14:47'),
(1091, 'DAEKZIqkUQDZ1WurzK2G2jw1VrDyHb7F1I97nRj2', NULL, 'http://127.0.0.1:8000/login', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-25 22:14:47', '2025-06-25 22:14:47'),
(1092, 'DAEKZIqkUQDZ1WurzK2G2jw1VrDyHb7F1I97nRj2', NULL, 'http://127.0.0.1:8000/login', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-25 22:14:59', '2025-06-25 22:14:59'),
(1093, 'iZm9AQot86oLxuRyrPTMXn2NucvgDawQs4QnAAnD', 77, 'http://127.0.0.1:8000', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-25 22:15:00', '2025-06-25 22:15:00'),
(1094, 'iZm9AQot86oLxuRyrPTMXn2NucvgDawQs4QnAAnD', 77, 'http://127.0.0.1:8000/track/start', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-25 22:15:01', '2025-06-25 22:15:01'),
(1095, 'iZm9AQot86oLxuRyrPTMXn2NucvgDawQs4QnAAnD', 77, 'http://127.0.0.1:8000/', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', 106, '2025-06-25 22:15:01', '2025-06-25 22:16:47'),
(1096, 'iZm9AQot86oLxuRyrPTMXn2NucvgDawQs4QnAAnD', 77, 'http://127.0.0.1:8000/increment-view/155', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-25 22:16:45', '2025-06-25 22:16:45'),
(1097, 'iZm9AQot86oLxuRyrPTMXn2NucvgDawQs4QnAAnD', 77, 'http://127.0.0.1:8000/product/iphone-14-pro-max-1750314182', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-25 22:16:46', '2025-06-25 22:16:46'),
(1098, 'iZm9AQot86oLxuRyrPTMXn2NucvgDawQs4QnAAnD', 77, 'http://127.0.0.1:8000/track/stop', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-25 22:16:47', '2025-06-25 22:16:47'),
(1099, 'iZm9AQot86oLxuRyrPTMXn2NucvgDawQs4QnAAnD', 77, 'http://127.0.0.1:8000/track/start', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-25 22:16:48', '2025-06-25 22:16:48'),
(1100, 'iZm9AQot86oLxuRyrPTMXn2NucvgDawQs4QnAAnD', 77, 'http://127.0.0.1:8000/product/iphone-14-pro-max-1750314182', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', 197, '2025-06-25 22:16:48', '2025-06-25 22:20:04'),
(1101, 'iZm9AQot86oLxuRyrPTMXn2NucvgDawQs4QnAAnD', 77, 'http://127.0.0.1:8000/about', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-25 22:20:03', '2025-06-25 22:20:03'),
(1102, 'iZm9AQot86oLxuRyrPTMXn2NucvgDawQs4QnAAnD', 77, 'http://127.0.0.1:8000/track/stop', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-25 22:20:04', '2025-06-25 22:20:04'),
(1103, 'iZm9AQot86oLxuRyrPTMXn2NucvgDawQs4QnAAnD', 77, 'http://127.0.0.1:8000/track/start', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-25 22:20:05', '2025-06-25 22:20:05'),
(1104, 'iZm9AQot86oLxuRyrPTMXn2NucvgDawQs4QnAAnD', 77, 'http://127.0.0.1:8000/about', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', 184, '2025-06-25 22:20:05', '2025-06-25 22:23:08'),
(1105, 'iZm9AQot86oLxuRyrPTMXn2NucvgDawQs4QnAAnD', 77, 'http://127.0.0.1:8000/blog', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-25 22:23:08', '2025-06-25 22:23:08'),
(1106, 'iZm9AQot86oLxuRyrPTMXn2NucvgDawQs4QnAAnD', 77, 'http://127.0.0.1:8000/track/stop', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-25 22:23:08', '2025-06-25 22:23:08'),
(1107, 'iZm9AQot86oLxuRyrPTMXn2NucvgDawQs4QnAAnD', 77, 'http://127.0.0.1:8000/track/start', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-25 22:23:09', '2025-06-25 22:23:09'),
(1108, 'iZm9AQot86oLxuRyrPTMXn2NucvgDawQs4QnAAnD', 77, 'http://127.0.0.1:8000/blog', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', 28, '2025-06-25 22:23:09', '2025-06-25 22:23:36'),
(1109, 'iZm9AQot86oLxuRyrPTMXn2NucvgDawQs4QnAAnD', 77, 'http://127.0.0.1:8000/contact', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-25 22:23:35', '2025-06-25 22:23:35'),
(1110, 'iZm9AQot86oLxuRyrPTMXn2NucvgDawQs4QnAAnD', 77, 'http://127.0.0.1:8000/track/stop', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-25 22:23:36', '2025-06-25 22:23:36'),
(1111, 'iZm9AQot86oLxuRyrPTMXn2NucvgDawQs4QnAAnD', 77, 'http://127.0.0.1:8000/track/start', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-25 22:23:37', '2025-06-25 22:23:37'),
(1112, 'iZm9AQot86oLxuRyrPTMXn2NucvgDawQs4QnAAnD', 77, 'http://127.0.0.1:8000/contact', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-25 22:23:37', '2025-06-25 22:23:37'),
(1113, 'iZm9AQot86oLxuRyrPTMXn2NucvgDawQs4QnAAnD', 77, 'http://127.0.0.1:8000/logout', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-25 22:49:15', '2025-06-25 22:49:15'),
(1114, 'orJtVzMXc8fJX8b5HvK2pP7tN1c69kWuPFgkM82Z', NULL, 'http://127.0.0.1:8000/login', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-25 22:49:16', '2025-06-25 22:49:16'),
(1115, 'orJtVzMXc8fJX8b5HvK2pP7tN1c69kWuPFgkM82Z', NULL, 'http://127.0.0.1:8000/login', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-25 22:49:41', '2025-06-25 22:49:41'),
(1116, 'd11wWXENMWJC4eXNxKpofPtUYt6ikI549ZFQtaZu', 77, 'http://127.0.0.1:8000', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-25 22:49:42', '2025-06-25 22:49:42'),
(1117, 'd11wWXENMWJC4eXNxKpofPtUYt6ikI549ZFQtaZu', 77, 'http://127.0.0.1:8000/track/start', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-25 22:49:44', '2025-06-25 22:49:44'),
(1118, 'd11wWXENMWJC4eXNxKpofPtUYt6ikI549ZFQtaZu', 77, 'http://127.0.0.1:8000/', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', 33, '2025-06-25 22:49:44', '2025-06-25 22:50:17'),
(1119, 'd11wWXENMWJC4eXNxKpofPtUYt6ikI549ZFQtaZu', 77, 'http://127.0.0.1:8000/about', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-25 22:50:16', '2025-06-25 22:50:16');
INSERT INTO `page_views` (`id`, `session_id`, `user_id`, `url`, `ip_address`, `user_agent`, `duration`, `created_at`, `updated_at`) VALUES
(1120, 'd11wWXENMWJC4eXNxKpofPtUYt6ikI549ZFQtaZu', 77, 'http://127.0.0.1:8000/track/stop', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-25 22:50:16', '2025-06-25 22:50:16'),
(1121, 'd11wWXENMWJC4eXNxKpofPtUYt6ikI549ZFQtaZu', 77, 'http://127.0.0.1:8000/track/start', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-25 22:50:18', '2025-06-25 22:50:18'),
(1122, 'd11wWXENMWJC4eXNxKpofPtUYt6ikI549ZFQtaZu', 77, 'http://127.0.0.1:8000/about', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', 3935, '2025-06-25 22:50:18', '2025-06-25 23:55:52'),
(1123, 'd11wWXENMWJC4eXNxKpofPtUYt6ikI549ZFQtaZu', 77, 'http://127.0.0.1:8000/shop', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-25 23:55:51', '2025-06-25 23:55:51'),
(1124, 'd11wWXENMWJC4eXNxKpofPtUYt6ikI549ZFQtaZu', 77, 'http://127.0.0.1:8000/track/stop', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-25 23:55:52', '2025-06-25 23:55:52'),
(1125, 'd11wWXENMWJC4eXNxKpofPtUYt6ikI549ZFQtaZu', 77, 'http://127.0.0.1:8000/track/start', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-25 23:55:53', '2025-06-25 23:55:53'),
(1126, 'd11wWXENMWJC4eXNxKpofPtUYt6ikI549ZFQtaZu', 77, 'http://127.0.0.1:8000/shop', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-25 23:55:53', '2025-06-25 23:55:53'),
(1127, 'd11wWXENMWJC4eXNxKpofPtUYt6ikI549ZFQtaZu', 77, 'http://127.0.0.1:8000/logout', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-25 23:56:03', '2025-06-25 23:56:03'),
(1128, '2KflqBwLJAPJquHBKSGLIoGH02jkgu376e7XbwN1', NULL, 'http://127.0.0.1:8000/login', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-25 23:56:03', '2025-06-25 23:56:03'),
(1129, 'sz5mxINSJD1Ua7HdGdGQEkzY0h6OZ7XssRiPxdwd', NULL, 'http://127.0.0.1:8000', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-26 20:26:30', '2025-06-26 20:26:30'),
(1130, 'sz5mxINSJD1Ua7HdGdGQEkzY0h6OZ7XssRiPxdwd', NULL, 'http://127.0.0.1:8000/track/start', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-26 20:26:34', '2025-06-26 20:26:34'),
(1131, 'sz5mxINSJD1Ua7HdGdGQEkzY0h6OZ7XssRiPxdwd', NULL, 'http://127.0.0.1:8000/', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', 4, '2025-06-26 20:26:34', '2025-06-26 20:26:37'),
(1132, 'sz5mxINSJD1Ua7HdGdGQEkzY0h6OZ7XssRiPxdwd', NULL, 'http://127.0.0.1:8000/login', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-26 20:26:37', '2025-06-26 20:26:37'),
(1133, 'sz5mxINSJD1Ua7HdGdGQEkzY0h6OZ7XssRiPxdwd', NULL, 'http://127.0.0.1:8000/track/stop', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-26 20:26:37', '2025-06-26 20:26:37'),
(1134, 'sz5mxINSJD1Ua7HdGdGQEkzY0h6OZ7XssRiPxdwd', NULL, 'http://127.0.0.1:8000/login', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-26 20:26:43', '2025-06-26 20:26:43'),
(1135, 'jpL6d3dRz8VtydEFYJB0kQ0akx5csWZgEgOJidVf', 1, 'http://127.0.0.1:8000/admin', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-26 20:26:45', '2025-06-26 20:26:45'),
(1136, 'jpL6d3dRz8VtydEFYJB0kQ0akx5csWZgEgOJidVf', 1, 'http://127.0.0.1:8000/admin/activities', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-26 20:26:54', '2025-06-26 20:26:54'),
(1137, 'jpL6d3dRz8VtydEFYJB0kQ0akx5csWZgEgOJidVf', 1, 'http://127.0.0.1:8000/admin/activities/user/77', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-26 20:27:03', '2025-06-26 20:27:03'),
(1138, 'jpL6d3dRz8VtydEFYJB0kQ0akx5csWZgEgOJidVf', 1, 'http://127.0.0.1:8000/admin/activities/user/77?page=2', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-26 20:29:02', '2025-06-26 20:29:02'),
(1139, 'jpL6d3dRz8VtydEFYJB0kQ0akx5csWZgEgOJidVf', 1, 'http://127.0.0.1:8000/admin/activities/user/77?page=1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-26 20:29:07', '2025-06-26 20:29:07'),
(1140, '3ZG00dZTZtTh0UzMaN2cNdPq9aM3PB28CdkLt58P', NULL, 'http://127.0.0.1:8000', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-26 20:29:17', '2025-06-26 20:29:17'),
(1141, '3ZG00dZTZtTh0UzMaN2cNdPq9aM3PB28CdkLt58P', NULL, 'http://127.0.0.1:8000/track/start', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-26 20:29:18', '2025-06-26 20:29:18'),
(1142, '3ZG00dZTZtTh0UzMaN2cNdPq9aM3PB28CdkLt58P', NULL, 'http://127.0.0.1:8000/', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', 3, '2025-06-26 20:29:18', '2025-06-26 20:29:20'),
(1143, '3ZG00dZTZtTh0UzMaN2cNdPq9aM3PB28CdkLt58P', NULL, 'http://127.0.0.1:8000/login', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-26 20:29:19', '2025-06-26 20:29:19'),
(1144, '3ZG00dZTZtTh0UzMaN2cNdPq9aM3PB28CdkLt58P', NULL, 'http://127.0.0.1:8000/track/stop', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-26 20:29:20', '2025-06-26 20:29:20'),
(1145, '3ZG00dZTZtTh0UzMaN2cNdPq9aM3PB28CdkLt58P', NULL, 'http://127.0.0.1:8000/login', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-26 20:29:26', '2025-06-26 20:29:26'),
(1146, '3ZG00dZTZtTh0UzMaN2cNdPq9aM3PB28CdkLt58P', NULL, 'http://127.0.0.1:8000/login', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-26 20:29:26', '2025-06-26 20:29:26'),
(1147, '3ZG00dZTZtTh0UzMaN2cNdPq9aM3PB28CdkLt58P', NULL, 'http://127.0.0.1:8000/login', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-26 20:29:30', '2025-06-26 20:29:30'),
(1148, '3rHtGBgpL4GyA4AG1KYqUc10XyrfHzVLXFksr1LH', 77, 'http://127.0.0.1:8000', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-26 20:29:31', '2025-06-26 20:29:31'),
(1149, '3rHtGBgpL4GyA4AG1KYqUc10XyrfHzVLXFksr1LH', 77, 'http://127.0.0.1:8000/track/start', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-26 20:29:32', '2025-06-26 20:29:32'),
(1150, '3rHtGBgpL4GyA4AG1KYqUc10XyrfHzVLXFksr1LH', 77, 'http://127.0.0.1:8000/', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', 21, '2025-06-26 20:29:32', '2025-06-26 20:29:53'),
(1151, 'jpL6d3dRz8VtydEFYJB0kQ0akx5csWZgEgOJidVf', 1, 'http://127.0.0.1:8000/admin/activities/user/77?page=1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-26 20:29:37', '2025-06-26 20:29:37'),
(1152, '3rHtGBgpL4GyA4AG1KYqUc10XyrfHzVLXFksr1LH', 77, 'http://127.0.0.1:8000/shop', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-26 20:29:51', '2025-06-26 20:29:51'),
(1153, '3rHtGBgpL4GyA4AG1KYqUc10XyrfHzVLXFksr1LH', 77, 'http://127.0.0.1:8000/track/stop', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-26 20:29:53', '2025-06-26 20:29:53'),
(1154, '3rHtGBgpL4GyA4AG1KYqUc10XyrfHzVLXFksr1LH', 77, 'http://127.0.0.1:8000/track/start', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-26 20:29:54', '2025-06-26 20:29:54'),
(1155, '3rHtGBgpL4GyA4AG1KYqUc10XyrfHzVLXFksr1LH', 77, 'http://127.0.0.1:8000/shop', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', 161, '2025-06-26 20:29:54', '2025-06-26 20:32:34'),
(1156, 'jpL6d3dRz8VtydEFYJB0kQ0akx5csWZgEgOJidVf', 1, 'http://127.0.0.1:8000/admin/activities/user/77?page=1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-26 20:29:55', '2025-06-26 20:29:55'),
(1157, '3rHtGBgpL4GyA4AG1KYqUc10XyrfHzVLXFksr1LH', 77, 'http://127.0.0.1:8000/product/iphone-15-pro-max-1750314062', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-26 20:32:33', '2025-06-26 20:32:33'),
(1158, '3rHtGBgpL4GyA4AG1KYqUc10XyrfHzVLXFksr1LH', 77, 'http://127.0.0.1:8000/track/stop', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-26 20:32:34', '2025-06-26 20:32:34'),
(1159, '3rHtGBgpL4GyA4AG1KYqUc10XyrfHzVLXFksr1LH', 77, 'http://127.0.0.1:8000/track/start', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-26 20:32:35', '2025-06-26 20:32:35'),
(1160, '3rHtGBgpL4GyA4AG1KYqUc10XyrfHzVLXFksr1LH', 77, 'http://127.0.0.1:8000/product/iphone-15-pro-max-1750314062', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', 145, '2025-06-26 20:32:35', '2025-06-26 20:35:00'),
(1161, '3rHtGBgpL4GyA4AG1KYqUc10XyrfHzVLXFksr1LH', 77, 'http://127.0.0.1:8000/blog', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-26 20:34:59', '2025-06-26 20:34:59'),
(1162, '3rHtGBgpL4GyA4AG1KYqUc10XyrfHzVLXFksr1LH', 77, 'http://127.0.0.1:8000/track/stop', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-26 20:35:00', '2025-06-26 20:35:00'),
(1163, '3rHtGBgpL4GyA4AG1KYqUc10XyrfHzVLXFksr1LH', 77, 'http://127.0.0.1:8000/track/start', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-26 20:35:02', '2025-06-26 20:35:02'),
(1164, '3rHtGBgpL4GyA4AG1KYqUc10XyrfHzVLXFksr1LH', 77, 'http://127.0.0.1:8000/blog', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', 60, '2025-06-26 20:35:02', '2025-06-26 20:36:01'),
(1165, '3rHtGBgpL4GyA4AG1KYqUc10XyrfHzVLXFksr1LH', 77, 'http://127.0.0.1:8000/contact', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-26 20:36:00', '2025-06-26 20:36:00'),
(1166, '3rHtGBgpL4GyA4AG1KYqUc10XyrfHzVLXFksr1LH', 77, 'http://127.0.0.1:8000/track/stop', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-26 20:36:01', '2025-06-26 20:36:01'),
(1167, '3rHtGBgpL4GyA4AG1KYqUc10XyrfHzVLXFksr1LH', 77, 'http://127.0.0.1:8000/track/start', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-26 20:36:02', '2025-06-26 20:36:02'),
(1168, '3rHtGBgpL4GyA4AG1KYqUc10XyrfHzVLXFksr1LH', 77, 'http://127.0.0.1:8000/contact', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', 185, '2025-06-26 20:36:02', '2025-06-26 20:39:06'),
(1169, '3rHtGBgpL4GyA4AG1KYqUc10XyrfHzVLXFksr1LH', 77, 'http://127.0.0.1:8000/shop', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-26 20:39:05', '2025-06-26 20:39:05'),
(1170, '3rHtGBgpL4GyA4AG1KYqUc10XyrfHzVLXFksr1LH', 77, 'http://127.0.0.1:8000/track/stop', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-26 20:39:06', '2025-06-26 20:39:06'),
(1171, '3rHtGBgpL4GyA4AG1KYqUc10XyrfHzVLXFksr1LH', 77, 'http://127.0.0.1:8000/track/start', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-26 20:39:07', '2025-06-26 20:39:07'),
(1172, '3rHtGBgpL4GyA4AG1KYqUc10XyrfHzVLXFksr1LH', 77, 'http://127.0.0.1:8000/shop', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', 406, '2025-06-26 20:39:07', '2025-06-26 20:45:53'),
(1173, 'jpL6d3dRz8VtydEFYJB0kQ0akx5csWZgEgOJidVf', 1, 'http://127.0.0.1:8000/admin/activities/user/77?page=1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-26 20:39:30', '2025-06-26 20:39:30'),
(1174, 'jpL6d3dRz8VtydEFYJB0kQ0akx5csWZgEgOJidVf', 1, 'http://127.0.0.1:8000/admin/activities/user/77?page=1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-26 20:39:38', '2025-06-26 20:39:38'),
(1175, '3rHtGBgpL4GyA4AG1KYqUc10XyrfHzVLXFksr1LH', 77, 'http://127.0.0.1:8000/shop/watch', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-26 20:45:52', '2025-06-26 20:45:52'),
(1176, '3rHtGBgpL4GyA4AG1KYqUc10XyrfHzVLXFksr1LH', 77, 'http://127.0.0.1:8000/track/stop', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-26 20:45:53', '2025-06-26 20:45:53'),
(1177, '3rHtGBgpL4GyA4AG1KYqUc10XyrfHzVLXFksr1LH', 77, 'http://127.0.0.1:8000/track/start', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-26 20:45:53', '2025-06-26 20:45:53'),
(1178, '3rHtGBgpL4GyA4AG1KYqUc10XyrfHzVLXFksr1LH', 77, 'http://127.0.0.1:8000/shop/watch', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', 2846, '2025-06-26 20:45:53', '2025-06-26 21:33:18'),
(1179, '3rHtGBgpL4GyA4AG1KYqUc10XyrfHzVLXFksr1LH', 77, 'http://127.0.0.1:8000/about', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-26 21:33:18', '2025-06-26 21:33:18'),
(1180, '3rHtGBgpL4GyA4AG1KYqUc10XyrfHzVLXFksr1LH', 77, 'http://127.0.0.1:8000/track/stop', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-26 21:33:18', '2025-06-26 21:33:18'),
(1181, '3rHtGBgpL4GyA4AG1KYqUc10XyrfHzVLXFksr1LH', 77, 'http://127.0.0.1:8000/track/start', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-26 21:33:19', '2025-06-26 21:33:19'),
(1182, '3rHtGBgpL4GyA4AG1KYqUc10XyrfHzVLXFksr1LH', 77, 'http://127.0.0.1:8000/about', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', 174, '2025-06-26 21:33:19', '2025-06-26 21:36:12'),
(1183, '3rHtGBgpL4GyA4AG1KYqUc10XyrfHzVLXFksr1LH', 77, 'http://127.0.0.1:8000/blog', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-26 21:36:12', '2025-06-26 21:36:12'),
(1184, '3rHtGBgpL4GyA4AG1KYqUc10XyrfHzVLXFksr1LH', 77, 'http://127.0.0.1:8000/track/stop', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-26 21:36:12', '2025-06-26 21:36:12'),
(1185, '3rHtGBgpL4GyA4AG1KYqUc10XyrfHzVLXFksr1LH', 77, 'http://127.0.0.1:8000/track/start', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-26 21:36:13', '2025-06-26 21:36:13'),
(1186, '3rHtGBgpL4GyA4AG1KYqUc10XyrfHzVLXFksr1LH', 77, 'http://127.0.0.1:8000/blog', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-26 21:36:13', '2025-06-26 21:36:13'),
(1187, '3rHtGBgpL4GyA4AG1KYqUc10XyrfHzVLXFksr1LH', 77, 'http://127.0.0.1:8000/contact', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-26 21:39:45', '2025-06-26 21:39:45'),
(1188, '3rHtGBgpL4GyA4AG1KYqUc10XyrfHzVLXFksr1LH', 77, 'http://127.0.0.1:8000/track/start', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-26 21:39:46', '2025-06-26 21:39:46'),
(1189, '3rHtGBgpL4GyA4AG1KYqUc10XyrfHzVLXFksr1LH', 77, 'http://127.0.0.1:8000/contact', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-26 21:39:46', '2025-06-26 21:39:46'),
(1190, '3rHtGBgpL4GyA4AG1KYqUc10XyrfHzVLXFksr1LH', 77, 'http://127.0.0.1:8000', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-26 21:40:22', '2025-06-26 21:40:22'),
(1191, '3rHtGBgpL4GyA4AG1KYqUc10XyrfHzVLXFksr1LH', 77, 'http://127.0.0.1:8000/track/start', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-26 21:40:23', '2025-06-26 21:40:23'),
(1192, '3rHtGBgpL4GyA4AG1KYqUc10XyrfHzVLXFksr1LH', 77, 'http://127.0.0.1:8000/', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-26 21:40:23', '2025-06-26 21:40:23'),
(1193, '3rHtGBgpL4GyA4AG1KYqUc10XyrfHzVLXFksr1LH', 77, 'http://127.0.0.1:8000/about', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-26 21:40:46', '2025-06-26 21:40:46'),
(1194, '3rHtGBgpL4GyA4AG1KYqUc10XyrfHzVLXFksr1LH', 77, 'http://127.0.0.1:8000/track/start', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-26 21:40:48', '2025-06-26 21:40:48'),
(1195, '3rHtGBgpL4GyA4AG1KYqUc10XyrfHzVLXFksr1LH', 77, 'http://127.0.0.1:8000/about', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-26 21:40:48', '2025-06-26 21:40:48'),
(1196, '3rHtGBgpL4GyA4AG1KYqUc10XyrfHzVLXFksr1LH', 77, 'http://127.0.0.1:8000/contact', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-26 21:41:13', '2025-06-26 21:41:13'),
(1197, '3rHtGBgpL4GyA4AG1KYqUc10XyrfHzVLXFksr1LH', 77, 'http://127.0.0.1:8000/track/start', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-26 21:41:16', '2025-06-26 21:41:16'),
(1198, '3rHtGBgpL4GyA4AG1KYqUc10XyrfHzVLXFksr1LH', 77, 'http://127.0.0.1:8000/contact', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', 21, '2025-06-26 21:41:16', '2025-06-26 21:41:36'),
(1199, '3rHtGBgpL4GyA4AG1KYqUc10XyrfHzVLXFksr1LH', 77, 'http://127.0.0.1:8000/shop', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-26 21:41:34', '2025-06-26 21:41:34'),
(1200, '3rHtGBgpL4GyA4AG1KYqUc10XyrfHzVLXFksr1LH', 77, 'http://127.0.0.1:8000/track/stop', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-26 21:41:36', '2025-06-26 21:41:36'),
(1201, '3rHtGBgpL4GyA4AG1KYqUc10XyrfHzVLXFksr1LH', 77, 'http://127.0.0.1:8000/track/start', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-26 21:41:37', '2025-06-26 21:41:37'),
(1202, '3rHtGBgpL4GyA4AG1KYqUc10XyrfHzVLXFksr1LH', 77, 'http://127.0.0.1:8000/shop', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', 58, '2025-06-26 21:41:37', '2025-06-26 21:42:35'),
(1203, '3rHtGBgpL4GyA4AG1KYqUc10XyrfHzVLXFksr1LH', 77, 'http://127.0.0.1:8000/blog', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-26 21:42:33', '2025-06-26 21:42:33'),
(1204, '3rHtGBgpL4GyA4AG1KYqUc10XyrfHzVLXFksr1LH', 77, 'http://127.0.0.1:8000/track/stop', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-26 21:42:35', '2025-06-26 21:42:35'),
(1205, '3rHtGBgpL4GyA4AG1KYqUc10XyrfHzVLXFksr1LH', 77, 'http://127.0.0.1:8000/track/start', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-26 21:42:36', '2025-06-26 21:42:36'),
(1206, '3rHtGBgpL4GyA4AG1KYqUc10XyrfHzVLXFksr1LH', 77, 'http://127.0.0.1:8000/blog', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', 231, '2025-06-26 21:42:36', '2025-06-26 21:46:27'),
(1207, '3rHtGBgpL4GyA4AG1KYqUc10XyrfHzVLXFksr1LH', 77, 'http://127.0.0.1:8000/contact', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-26 21:46:26', '2025-06-26 21:46:26'),
(1208, '3rHtGBgpL4GyA4AG1KYqUc10XyrfHzVLXFksr1LH', 77, 'http://127.0.0.1:8000/track/stop', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-26 21:46:27', '2025-06-26 21:46:27'),
(1209, '3rHtGBgpL4GyA4AG1KYqUc10XyrfHzVLXFksr1LH', 77, 'http://127.0.0.1:8000/track/start', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-26 21:46:27', '2025-06-26 21:46:27'),
(1210, '3rHtGBgpL4GyA4AG1KYqUc10XyrfHzVLXFksr1LH', 77, 'http://127.0.0.1:8000/contact', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-26 21:46:27', '2025-06-26 21:46:27'),
(1211, '3rHtGBgpL4GyA4AG1KYqUc10XyrfHzVLXFksr1LH', 77, 'http://127.0.0.1:8000/contact', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-26 21:49:20', '2025-06-26 21:49:20'),
(1212, '3rHtGBgpL4GyA4AG1KYqUc10XyrfHzVLXFksr1LH', 77, 'http://127.0.0.1:8000/track/start', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-26 21:49:21', '2025-06-26 21:49:21'),
(1213, '3rHtGBgpL4GyA4AG1KYqUc10XyrfHzVLXFksr1LH', 77, 'http://127.0.0.1:8000/contact', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-26 21:49:21', '2025-06-26 21:49:21'),
(1214, '3rHtGBgpL4GyA4AG1KYqUc10XyrfHzVLXFksr1LH', 77, 'http://127.0.0.1:8000/contact', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-26 21:49:33', '2025-06-26 21:49:33'),
(1215, '3rHtGBgpL4GyA4AG1KYqUc10XyrfHzVLXFksr1LH', 77, 'http://127.0.0.1:8000/track/start', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-26 21:49:35', '2025-06-26 21:49:35'),
(1216, '3rHtGBgpL4GyA4AG1KYqUc10XyrfHzVLXFksr1LH', 77, 'http://127.0.0.1:8000/contact', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', 10, '2025-06-26 21:49:35', '2025-06-26 21:49:44'),
(1217, '3rHtGBgpL4GyA4AG1KYqUc10XyrfHzVLXFksr1LH', 77, 'http://127.0.0.1:8000/blog', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-26 21:49:44', '2025-06-26 21:49:44'),
(1218, '3rHtGBgpL4GyA4AG1KYqUc10XyrfHzVLXFksr1LH', 77, 'http://127.0.0.1:8000/track/stop', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-26 21:49:44', '2025-06-26 21:49:44'),
(1219, '3rHtGBgpL4GyA4AG1KYqUc10XyrfHzVLXFksr1LH', 77, 'http://127.0.0.1:8000/track/start', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-26 21:49:45', '2025-06-26 21:49:45'),
(1220, '3rHtGBgpL4GyA4AG1KYqUc10XyrfHzVLXFksr1LH', 77, 'http://127.0.0.1:8000/blog', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', 199, '2025-06-26 21:49:45', '2025-06-26 21:53:03'),
(1221, '3rHtGBgpL4GyA4AG1KYqUc10XyrfHzVLXFksr1LH', 77, 'http://127.0.0.1:8000/contact', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-26 21:53:03', '2025-06-26 21:53:03'),
(1222, '3rHtGBgpL4GyA4AG1KYqUc10XyrfHzVLXFksr1LH', 77, 'http://127.0.0.1:8000/track/stop', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-26 21:53:03', '2025-06-26 21:53:03'),
(1223, '3rHtGBgpL4GyA4AG1KYqUc10XyrfHzVLXFksr1LH', 77, 'http://127.0.0.1:8000/track/start', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-26 21:53:04', '2025-06-26 21:53:04'),
(1224, '3rHtGBgpL4GyA4AG1KYqUc10XyrfHzVLXFksr1LH', 77, 'http://127.0.0.1:8000/contact', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', 313, '2025-06-26 21:53:04', '2025-06-26 21:58:16'),
(1225, '3rHtGBgpL4GyA4AG1KYqUc10XyrfHzVLXFksr1LH', 77, 'http://127.0.0.1:8000/blog', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-26 21:58:16', '2025-06-26 21:58:16'),
(1226, '3rHtGBgpL4GyA4AG1KYqUc10XyrfHzVLXFksr1LH', 77, 'http://127.0.0.1:8000/track/stop', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-26 21:58:16', '2025-06-26 21:58:16'),
(1227, '3rHtGBgpL4GyA4AG1KYqUc10XyrfHzVLXFksr1LH', 77, 'http://127.0.0.1:8000/track/start', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-26 21:58:17', '2025-06-26 21:58:17'),
(1228, '3rHtGBgpL4GyA4AG1KYqUc10XyrfHzVLXFksr1LH', 77, 'http://127.0.0.1:8000/blog', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-26 21:58:17', '2025-06-26 21:58:17'),
(1229, '3rHtGBgpL4GyA4AG1KYqUc10XyrfHzVLXFksr1LH', 77, 'http://127.0.0.1:8000/blog', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-26 22:02:41', '2025-06-26 22:02:41'),
(1230, '3rHtGBgpL4GyA4AG1KYqUc10XyrfHzVLXFksr1LH', 77, 'http://127.0.0.1:8000/track/start', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-26 22:02:42', '2025-06-26 22:02:42'),
(1231, '3rHtGBgpL4GyA4AG1KYqUc10XyrfHzVLXFksr1LH', 77, 'http://127.0.0.1:8000/blog', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', 59, '2025-06-26 22:02:42', '2025-06-26 22:03:40'),
(1232, '3rHtGBgpL4GyA4AG1KYqUc10XyrfHzVLXFksr1LH', 77, 'http://127.0.0.1:8000/contact', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-26 22:03:40', '2025-06-26 22:03:40'),
(1233, '3rHtGBgpL4GyA4AG1KYqUc10XyrfHzVLXFksr1LH', 77, 'http://127.0.0.1:8000/track/stop', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-26 22:03:40', '2025-06-26 22:03:40'),
(1234, '3rHtGBgpL4GyA4AG1KYqUc10XyrfHzVLXFksr1LH', 77, 'http://127.0.0.1:8000/track/start', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-26 22:03:41', '2025-06-26 22:03:41'),
(1235, '3rHtGBgpL4GyA4AG1KYqUc10XyrfHzVLXFksr1LH', 77, 'http://127.0.0.1:8000/contact', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', 348, '2025-06-26 22:03:41', '2025-06-26 22:09:29'),
(1236, '3rHtGBgpL4GyA4AG1KYqUc10XyrfHzVLXFksr1LH', 77, 'http://127.0.0.1:8000', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-26 22:09:27', '2025-06-26 22:09:27'),
(1237, '3rHtGBgpL4GyA4AG1KYqUc10XyrfHzVLXFksr1LH', 77, 'http://127.0.0.1:8000/track/stop', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-26 22:09:29', '2025-06-26 22:09:29'),
(1238, '3rHtGBgpL4GyA4AG1KYqUc10XyrfHzVLXFksr1LH', 77, 'http://127.0.0.1:8000/track/start', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-26 22:09:31', '2025-06-26 22:09:31'),
(1239, '3rHtGBgpL4GyA4AG1KYqUc10XyrfHzVLXFksr1LH', 77, 'http://127.0.0.1:8000/', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-26 22:09:31', '2025-06-26 22:09:31'),
(1240, '3rHtGBgpL4GyA4AG1KYqUc10XyrfHzVLXFksr1LH', 77, 'http://127.0.0.1:8000/shop', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-26 22:09:32', '2025-06-26 22:09:32'),
(1241, '3rHtGBgpL4GyA4AG1KYqUc10XyrfHzVLXFksr1LH', 77, 'http://127.0.0.1:8000/track/start', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-26 22:09:34', '2025-06-26 22:09:34'),
(1242, '3rHtGBgpL4GyA4AG1KYqUc10XyrfHzVLXFksr1LH', 77, 'http://127.0.0.1:8000/shop', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-26 22:09:34', '2025-06-26 22:09:34'),
(1243, '3rHtGBgpL4GyA4AG1KYqUc10XyrfHzVLXFksr1LH', 77, 'http://127.0.0.1:8000/about', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-26 22:09:50', '2025-06-26 22:09:50'),
(1244, '3rHtGBgpL4GyA4AG1KYqUc10XyrfHzVLXFksr1LH', 77, 'http://127.0.0.1:8000/track/start', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-26 22:09:51', '2025-06-26 22:09:51'),
(1245, '3rHtGBgpL4GyA4AG1KYqUc10XyrfHzVLXFksr1LH', 77, 'http://127.0.0.1:8000/about', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-26 22:09:51', '2025-06-26 22:09:51'),
(1246, '3rHtGBgpL4GyA4AG1KYqUc10XyrfHzVLXFksr1LH', 77, 'http://127.0.0.1:8000/shop', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-26 22:14:03', '2025-06-26 22:14:03'),
(1247, '3rHtGBgpL4GyA4AG1KYqUc10XyrfHzVLXFksr1LH', 77, 'http://127.0.0.1:8000/track/start', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-26 22:14:05', '2025-06-26 22:14:05'),
(1248, '3rHtGBgpL4GyA4AG1KYqUc10XyrfHzVLXFksr1LH', 77, 'http://127.0.0.1:8000/shop', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-26 22:14:05', '2025-06-26 22:14:05'),
(1249, '3rHtGBgpL4GyA4AG1KYqUc10XyrfHzVLXFksr1LH', 77, 'http://127.0.0.1:8000/about', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-26 22:14:35', '2025-06-26 22:14:35'),
(1250, '3rHtGBgpL4GyA4AG1KYqUc10XyrfHzVLXFksr1LH', 77, 'http://127.0.0.1:8000/track/start', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-26 22:14:36', '2025-06-26 22:14:36'),
(1251, '3rHtGBgpL4GyA4AG1KYqUc10XyrfHzVLXFksr1LH', 77, 'http://127.0.0.1:8000/about', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-26 22:14:36', '2025-06-26 22:14:36'),
(1252, '3rHtGBgpL4GyA4AG1KYqUc10XyrfHzVLXFksr1LH', 77, 'http://127.0.0.1:8000/blog', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-26 22:17:54', '2025-06-26 22:17:54'),
(1253, '3rHtGBgpL4GyA4AG1KYqUc10XyrfHzVLXFksr1LH', 77, 'http://127.0.0.1:8000/track/start', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-26 22:17:59', '2025-06-26 22:17:59'),
(1254, '3rHtGBgpL4GyA4AG1KYqUc10XyrfHzVLXFksr1LH', 77, 'http://127.0.0.1:8000/blog', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', 19, '2025-06-26 22:17:59', '2025-06-26 22:18:17'),
(1255, '3rHtGBgpL4GyA4AG1KYqUc10XyrfHzVLXFksr1LH', 77, 'http://127.0.0.1:8000/about', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-26 22:18:17', '2025-06-26 22:18:17'),
(1256, '3rHtGBgpL4GyA4AG1KYqUc10XyrfHzVLXFksr1LH', 77, 'http://127.0.0.1:8000/track/stop', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-26 22:18:17', '2025-06-26 22:18:17'),
(1257, '3rHtGBgpL4GyA4AG1KYqUc10XyrfHzVLXFksr1LH', 77, 'http://127.0.0.1:8000/track/start', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-26 22:18:18', '2025-06-26 22:18:18'),
(1258, '3rHtGBgpL4GyA4AG1KYqUc10XyrfHzVLXFksr1LH', 77, 'http://127.0.0.1:8000/about', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', 33, '2025-06-26 22:18:18', '2025-06-26 22:18:50'),
(1259, '3rHtGBgpL4GyA4AG1KYqUc10XyrfHzVLXFksr1LH', 77, 'http://127.0.0.1:8000/blog', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-26 22:18:49', '2025-06-26 22:18:49'),
(1260, '3rHtGBgpL4GyA4AG1KYqUc10XyrfHzVLXFksr1LH', 77, 'http://127.0.0.1:8000/track/stop', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-26 22:18:50', '2025-06-26 22:18:50'),
(1261, '3rHtGBgpL4GyA4AG1KYqUc10XyrfHzVLXFksr1LH', 77, 'http://127.0.0.1:8000/track/start', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-26 22:18:52', '2025-06-26 22:18:52'),
(1262, '3rHtGBgpL4GyA4AG1KYqUc10XyrfHzVLXFksr1LH', 77, 'http://127.0.0.1:8000/blog', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', 19, '2025-06-26 22:18:52', '2025-06-26 22:19:10'),
(1263, '3rHtGBgpL4GyA4AG1KYqUc10XyrfHzVLXFksr1LH', 77, 'http://127.0.0.1:8000/contact', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-26 22:19:10', '2025-06-26 22:19:10'),
(1264, '3rHtGBgpL4GyA4AG1KYqUc10XyrfHzVLXFksr1LH', 77, 'http://127.0.0.1:8000/track/stop', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-26 22:19:10', '2025-06-26 22:19:10'),
(1265, '3rHtGBgpL4GyA4AG1KYqUc10XyrfHzVLXFksr1LH', 77, 'http://127.0.0.1:8000/track/start', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-26 22:19:11', '2025-06-26 22:19:11'),
(1266, '3rHtGBgpL4GyA4AG1KYqUc10XyrfHzVLXFksr1LH', 77, 'http://127.0.0.1:8000/contact', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', 14, '2025-06-26 22:19:11', '2025-06-26 22:19:25'),
(1267, '3rHtGBgpL4GyA4AG1KYqUc10XyrfHzVLXFksr1LH', 77, 'http://127.0.0.1:8000', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-26 22:19:23', '2025-06-26 22:19:23'),
(1268, '3rHtGBgpL4GyA4AG1KYqUc10XyrfHzVLXFksr1LH', 77, 'http://127.0.0.1:8000/track/stop', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-26 22:19:25', '2025-06-26 22:19:25'),
(1269, '3rHtGBgpL4GyA4AG1KYqUc10XyrfHzVLXFksr1LH', 77, 'http://127.0.0.1:8000/track/start', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-26 22:19:26', '2025-06-26 22:19:26'),
(1270, '3rHtGBgpL4GyA4AG1KYqUc10XyrfHzVLXFksr1LH', 77, 'http://127.0.0.1:8000/', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', 4442, '2025-06-26 22:19:26', '2025-06-26 23:33:27'),
(1271, 'jpL6d3dRz8VtydEFYJB0kQ0akx5csWZgEgOJidVf', 1, 'http://127.0.0.1:8000/admin', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-26 22:24:33', '2025-06-26 22:24:33'),
(1272, '3rHtGBgpL4GyA4AG1KYqUc10XyrfHzVLXFksr1LH', 77, 'http://127.0.0.1:8000/increment-view/153', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-26 23:33:23', '2025-06-26 23:33:23'),
(1273, '3rHtGBgpL4GyA4AG1KYqUc10XyrfHzVLXFksr1LH', 77, 'http://127.0.0.1:8000/product/airpods-pro-2nd-gen-usb-c-1750313767', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-26 23:33:25', '2025-06-26 23:33:25'),
(1274, '3rHtGBgpL4GyA4AG1KYqUc10XyrfHzVLXFksr1LH', 77, 'http://127.0.0.1:8000/track/stop', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-26 23:33:27', '2025-06-26 23:33:27'),
(1275, '3rHtGBgpL4GyA4AG1KYqUc10XyrfHzVLXFksr1LH', 77, 'http://127.0.0.1:8000/track/start', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-26 23:33:29', '2025-06-26 23:33:29'),
(1276, '3rHtGBgpL4GyA4AG1KYqUc10XyrfHzVLXFksr1LH', 77, 'http://127.0.0.1:8000/product/airpods-pro-2nd-gen-usb-c-1750313767', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', 31, '2025-06-26 23:33:29', '2025-06-26 23:34:00'),
(1277, '3rHtGBgpL4GyA4AG1KYqUc10XyrfHzVLXFksr1LH', 77, 'http://127.0.0.1:8000/about', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-26 23:33:59', '2025-06-26 23:33:59'),
(1278, '3rHtGBgpL4GyA4AG1KYqUc10XyrfHzVLXFksr1LH', 77, 'http://127.0.0.1:8000/track/stop', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-26 23:34:00', '2025-06-26 23:34:00'),
(1279, '3rHtGBgpL4GyA4AG1KYqUc10XyrfHzVLXFksr1LH', 77, 'http://127.0.0.1:8000/track/start', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-26 23:34:01', '2025-06-26 23:34:01'),
(1280, '3rHtGBgpL4GyA4AG1KYqUc10XyrfHzVLXFksr1LH', 77, 'http://127.0.0.1:8000/about', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', 155, '2025-06-26 23:34:02', '2025-06-26 23:36:36'),
(1281, 'jpL6d3dRz8VtydEFYJB0kQ0akx5csWZgEgOJidVf', 1, 'http://127.0.0.1:8000/admin', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-26 23:34:16', '2025-06-26 23:34:16'),
(1282, '3rHtGBgpL4GyA4AG1KYqUc10XyrfHzVLXFksr1LH', 77, 'http://127.0.0.1:8000/blog', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-26 23:36:35', '2025-06-26 23:36:35'),
(1283, '3rHtGBgpL4GyA4AG1KYqUc10XyrfHzVLXFksr1LH', 77, 'http://127.0.0.1:8000/track/stop', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-26 23:36:36', '2025-06-26 23:36:36'),
(1284, '3rHtGBgpL4GyA4AG1KYqUc10XyrfHzVLXFksr1LH', 77, 'http://127.0.0.1:8000/track/start', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-26 23:36:38', '2025-06-26 23:36:38'),
(1285, '3rHtGBgpL4GyA4AG1KYqUc10XyrfHzVLXFksr1LH', 77, 'http://127.0.0.1:8000/blog', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', 85, '2025-06-26 23:36:38', '2025-06-26 23:38:03'),
(1286, '3rHtGBgpL4GyA4AG1KYqUc10XyrfHzVLXFksr1LH', 77, 'http://127.0.0.1:8000/contact', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-26 23:38:02', '2025-06-26 23:38:02'),
(1287, '3rHtGBgpL4GyA4AG1KYqUc10XyrfHzVLXFksr1LH', 77, 'http://127.0.0.1:8000/track/stop', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-26 23:38:03', '2025-06-26 23:38:03'),
(1288, '3rHtGBgpL4GyA4AG1KYqUc10XyrfHzVLXFksr1LH', 77, 'http://127.0.0.1:8000/track/start', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-26 23:38:06', '2025-06-26 23:38:06'),
(1289, '3rHtGBgpL4GyA4AG1KYqUc10XyrfHzVLXFksr1LH', 77, 'http://127.0.0.1:8000/contact', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-26 23:38:06', '2025-06-26 23:38:06'),
(1290, '3rHtGBgpL4GyA4AG1KYqUc10XyrfHzVLXFksr1LH', 77, 'http://127.0.0.1:8000/about', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-26 23:38:29', '2025-06-26 23:38:29'),
(1291, '3rHtGBgpL4GyA4AG1KYqUc10XyrfHzVLXFksr1LH', 77, 'http://127.0.0.1:8000/track/start', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-26 23:38:31', '2025-06-26 23:38:31'),
(1292, '3rHtGBgpL4GyA4AG1KYqUc10XyrfHzVLXFksr1LH', 77, 'http://127.0.0.1:8000/about', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-26 23:38:31', '2025-06-26 23:38:31'),
(1293, '3rHtGBgpL4GyA4AG1KYqUc10XyrfHzVLXFksr1LH', 77, 'http://127.0.0.1:8000/about', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-26 23:38:50', '2025-06-26 23:38:50'),
(1294, '3rHtGBgpL4GyA4AG1KYqUc10XyrfHzVLXFksr1LH', 77, 'http://127.0.0.1:8000/track/start', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-26 23:38:51', '2025-06-26 23:38:51'),
(1295, '3rHtGBgpL4GyA4AG1KYqUc10XyrfHzVLXFksr1LH', 77, 'http://127.0.0.1:8000/about', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', 9, '2025-06-26 23:38:51', '2025-06-26 23:38:59'),
(1296, '3rHtGBgpL4GyA4AG1KYqUc10XyrfHzVLXFksr1LH', 77, 'http://127.0.0.1:8000/blog', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-26 23:38:58', '2025-06-26 23:38:58'),
(1297, '3rHtGBgpL4GyA4AG1KYqUc10XyrfHzVLXFksr1LH', 77, 'http://127.0.0.1:8000/track/stop', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-26 23:38:59', '2025-06-26 23:38:59'),
(1298, '3rHtGBgpL4GyA4AG1KYqUc10XyrfHzVLXFksr1LH', 77, 'http://127.0.0.1:8000/track/start', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-26 23:39:00', '2025-06-26 23:39:00'),
(1299, '3rHtGBgpL4GyA4AG1KYqUc10XyrfHzVLXFksr1LH', 77, 'http://127.0.0.1:8000/blog', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', 13, '2025-06-26 23:39:00', '2025-06-26 23:39:12'),
(1300, '3rHtGBgpL4GyA4AG1KYqUc10XyrfHzVLXFksr1LH', 77, 'http://127.0.0.1:8000/contact', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-26 23:39:11', '2025-06-26 23:39:11'),
(1301, '3rHtGBgpL4GyA4AG1KYqUc10XyrfHzVLXFksr1LH', 77, 'http://127.0.0.1:8000/track/stop', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-26 23:39:12', '2025-06-26 23:39:12'),
(1302, '3rHtGBgpL4GyA4AG1KYqUc10XyrfHzVLXFksr1LH', 77, 'http://127.0.0.1:8000/track/start', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-26 23:39:13', '2025-06-26 23:39:13'),
(1303, '3rHtGBgpL4GyA4AG1KYqUc10XyrfHzVLXFksr1LH', 77, 'http://127.0.0.1:8000/contact', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-26 23:39:13', '2025-06-26 23:39:13'),
(1304, '3rHtGBgpL4GyA4AG1KYqUc10XyrfHzVLXFksr1LH', 77, 'http://127.0.0.1:8000/contact', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-26 23:41:46', '2025-06-26 23:41:46');
INSERT INTO `page_views` (`id`, `session_id`, `user_id`, `url`, `ip_address`, `user_agent`, `duration`, `created_at`, `updated_at`) VALUES
(1305, '3rHtGBgpL4GyA4AG1KYqUc10XyrfHzVLXFksr1LH', 77, 'http://127.0.0.1:8000/contact', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', 13, '2025-06-26 23:41:47', '2025-06-26 23:42:00'),
(1306, '3rHtGBgpL4GyA4AG1KYqUc10XyrfHzVLXFksr1LH', 77, 'http://127.0.0.1:8000', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-26 23:41:58', '2025-06-26 23:41:58'),
(1307, '3rHtGBgpL4GyA4AG1KYqUc10XyrfHzVLXFksr1LH', 77, 'http://127.0.0.1:8000/', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', 60, '2025-06-26 23:42:01', '2025-06-26 23:43:00'),
(1308, '3rHtGBgpL4GyA4AG1KYqUc10XyrfHzVLXFksr1LH', 77, 'http://127.0.0.1:8000/shop', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-26 23:42:58', '2025-06-26 23:42:58'),
(1309, '3rHtGBgpL4GyA4AG1KYqUc10XyrfHzVLXFksr1LH', 77, 'http://127.0.0.1:8000/shop', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', 32, '2025-06-26 23:43:01', '2025-06-26 23:43:33'),
(1310, '3rHtGBgpL4GyA4AG1KYqUc10XyrfHzVLXFksr1LH', 77, 'http://127.0.0.1:8000/about', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-26 23:43:32', '2025-06-26 23:43:32'),
(1311, '3rHtGBgpL4GyA4AG1KYqUc10XyrfHzVLXFksr1LH', 77, 'http://127.0.0.1:8000/about', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-26 23:43:33', '2025-06-26 23:43:33'),
(1312, '3rHtGBgpL4GyA4AG1KYqUc10XyrfHzVLXFksr1LH', 77, 'http://127.0.0.1:8000/blog', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-26 23:47:02', '2025-06-26 23:47:02'),
(1313, '3rHtGBgpL4GyA4AG1KYqUc10XyrfHzVLXFksr1LH', 77, 'http://127.0.0.1:8000/blog', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-26 23:47:04', '2025-06-26 23:47:04'),
(1314, '3rHtGBgpL4GyA4AG1KYqUc10XyrfHzVLXFksr1LH', 77, 'http://127.0.0.1:8000/blog', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-26 23:47:42', '2025-06-26 23:47:42'),
(1315, '3rHtGBgpL4GyA4AG1KYqUc10XyrfHzVLXFksr1LH', 77, 'http://127.0.0.1:8000/blog', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', 3, '2025-06-26 23:47:43', '2025-06-26 23:47:46'),
(1316, '3rHtGBgpL4GyA4AG1KYqUc10XyrfHzVLXFksr1LH', 77, 'http://127.0.0.1:8000', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-26 23:47:45', '2025-06-26 23:47:45'),
(1317, '3rHtGBgpL4GyA4AG1KYqUc10XyrfHzVLXFksr1LH', 77, 'http://127.0.0.1:8000/', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', 10, '2025-06-26 23:47:47', '2025-06-26 23:47:57'),
(1318, '3rHtGBgpL4GyA4AG1KYqUc10XyrfHzVLXFksr1LH', 77, 'http://127.0.0.1:8000/shop', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-26 23:47:56', '2025-06-26 23:47:56'),
(1319, '3rHtGBgpL4GyA4AG1KYqUc10XyrfHzVLXFksr1LH', 77, 'http://127.0.0.1:8000/shop', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', 11, '2025-06-26 23:47:58', '2025-06-26 23:48:08'),
(1320, '3rHtGBgpL4GyA4AG1KYqUc10XyrfHzVLXFksr1LH', 77, 'http://127.0.0.1:8000/about', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-26 23:48:08', '2025-06-26 23:48:08'),
(1321, '3rHtGBgpL4GyA4AG1KYqUc10XyrfHzVLXFksr1LH', 77, 'http://127.0.0.1:8000/about', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-26 23:48:09', '2025-06-26 23:48:09'),
(1322, '3rHtGBgpL4GyA4AG1KYqUc10XyrfHzVLXFksr1LH', 77, 'http://127.0.0.1:8000/about', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-26 23:48:15', '2025-06-26 23:48:15'),
(1323, '3rHtGBgpL4GyA4AG1KYqUc10XyrfHzVLXFksr1LH', 77, 'http://127.0.0.1:8000/about', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', 7, '2025-06-26 23:48:16', '2025-06-26 23:48:22'),
(1324, '3rHtGBgpL4GyA4AG1KYqUc10XyrfHzVLXFksr1LH', 77, 'http://127.0.0.1:8000/blog', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', 976, '2025-06-26 23:48:22', '2025-06-27 00:04:37'),
(1325, '3rHtGBgpL4GyA4AG1KYqUc10XyrfHzVLXFksr1LH', 77, 'http://127.0.0.1:8000/blog', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', 91, '2025-06-26 23:48:23', '2025-06-26 23:49:53'),
(1326, '3rHtGBgpL4GyA4AG1KYqUc10XyrfHzVLXFksr1LH', 77, 'http://127.0.0.1:8000/shop', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', 13, '2025-06-26 23:49:55', '2025-06-26 23:50:08'),
(1327, '3rHtGBgpL4GyA4AG1KYqUc10XyrfHzVLXFksr1LH', 77, 'http://127.0.0.1:8000/about', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', 181, '2025-06-26 23:50:09', '2025-06-27 00:02:27'),
(1328, '3rHtGBgpL4GyA4AG1KYqUc10XyrfHzVLXFksr1LH', 77, 'http://127.0.0.1:8000/about', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', 14, '2025-06-26 23:50:19', '2025-06-26 23:50:32'),
(1329, '3rHtGBgpL4GyA4AG1KYqUc10XyrfHzVLXFksr1LH', 77, 'http://127.0.0.1:8000/blog', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', 161, '2025-06-26 23:50:33', '2025-06-26 23:53:14'),
(1330, '3rHtGBgpL4GyA4AG1KYqUc10XyrfHzVLXFksr1LH', 77, 'http://127.0.0.1:8000/profile', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', 4, '2025-06-26 23:53:14', '2025-06-26 23:59:24'),
(1331, '3rHtGBgpL4GyA4AG1KYqUc10XyrfHzVLXFksr1LH', 77, 'http://127.0.0.1:8000/profile', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', 11, '2025-06-26 23:53:28', '2025-06-26 23:59:17'),
(1332, '3rHtGBgpL4GyA4AG1KYqUc10XyrfHzVLXFksr1LH', 77, 'http://127.0.0.1:8000/', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', 18, '2025-06-26 23:55:55', '2025-06-26 23:59:04'),
(1333, '3rHtGBgpL4GyA4AG1KYqUc10XyrfHzVLXFksr1LH', 77, 'http://127.0.0.1:8000/', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', 12, '2025-06-26 23:56:06', '2025-06-26 23:56:18'),
(1334, '3rHtGBgpL4GyA4AG1KYqUc10XyrfHzVLXFksr1LH', 77, 'http://127.0.0.1:8000/shop', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', 10, '2025-06-26 23:56:20', '2025-06-26 23:58:43'),
(1335, '3rHtGBgpL4GyA4AG1KYqUc10XyrfHzVLXFksr1LH', 77, 'http://127.0.0.1:8000/shop', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', 122, '2025-06-26 23:56:30', '2025-06-26 23:58:32'),
(1336, '0c26nTlz8BvcRzAlvgBCgBAyHqpIzJJR1EpgXxps', NULL, 'http://127.0.0.1:8000/', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', 14, '2025-06-27 00:04:59', '2025-06-27 00:05:13'),
(1337, 'Duk1dQJFjbuN3jkgjdWq9UBAqY5u2idblpfQL5Vv', 77, 'http://127.0.0.1:8000/', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', 15, '2025-06-27 00:05:26', '2025-06-27 00:05:40'),
(1338, 'Duk1dQJFjbuN3jkgjdWq9UBAqY5u2idblpfQL5Vv', 77, 'http://127.0.0.1:8000/about', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', 13, '2025-06-27 00:05:41', '2025-06-27 00:05:53'),
(1339, 'Duk1dQJFjbuN3jkgjdWq9UBAqY5u2idblpfQL5Vv', 77, 'http://127.0.0.1:8000/blog', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', 138, '2025-06-27 00:05:54', '2025-06-27 00:08:12'),
(1340, 'Duk1dQJFjbuN3jkgjdWq9UBAqY5u2idblpfQL5Vv', 77, 'http://127.0.0.1:8000/about', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', 16, '2025-06-27 00:08:12', '2025-06-27 00:08:28'),
(1341, 'Duk1dQJFjbuN3jkgjdWq9UBAqY5u2idblpfQL5Vv', 77, 'http://127.0.0.1:8000/blog', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', 17, '2025-06-27 00:08:28', '2025-06-27 00:08:45'),
(1342, 'Duk1dQJFjbuN3jkgjdWq9UBAqY5u2idblpfQL5Vv', 77, 'http://127.0.0.1:8000/contact', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-27 00:08:45', '2025-06-27 00:08:45'),
(1343, 'b5bs0O6qiCsVZkmeHIZnto0LD6yBQYv0VwidAZ6u', NULL, 'http://127.0.0.1:8000/compare?products=155%2C152%2C154', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-27 00:24:39', '2025-06-27 00:24:39'),
(1344, 'b5bs0O6qiCsVZkmeHIZnto0LD6yBQYv0VwidAZ6u', NULL, 'http://127.0.0.1:8000/login', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-27 00:25:01', '2025-06-27 00:25:01'),
(1345, 'b5bs0O6qiCsVZkmeHIZnto0LD6yBQYv0VwidAZ6u', NULL, 'http://127.0.0.1:8000/login', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-27 00:25:17', '2025-06-27 00:25:17'),
(1346, 'ydMqZBcoblWvZHpwuy7SP2Ql557Ciz5QH0xumMpF', 1, 'http://127.0.0.1:8000/admin', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-27 00:25:25', '2025-06-27 00:25:25'),
(1347, 'ydMqZBcoblWvZHpwuy7SP2Ql557Ciz5QH0xumMpF', 1, 'http://127.0.0.1:8000/admin/products', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-27 00:25:42', '2025-06-27 00:25:42'),
(1348, 'ydMqZBcoblWvZHpwuy7SP2Ql557Ciz5QH0xumMpF', 1, 'http://127.0.0.1:8000/admin/variants', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-27 00:25:50', '2025-06-27 00:25:50'),
(1349, 'ydMqZBcoblWvZHpwuy7SP2Ql557Ciz5QH0xumMpF', 1, 'http://127.0.0.1:8000/admin/specifications', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-27 00:25:58', '2025-06-27 00:25:58'),
(1350, 'ydMqZBcoblWvZHpwuy7SP2Ql557Ciz5QH0xumMpF', 1, 'http://127.0.0.1:8000/admin/attributes', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-27 00:26:47', '2025-06-27 00:26:47'),
(1351, 'ydMqZBcoblWvZHpwuy7SP2Ql557Ciz5QH0xumMpF', 1, 'http://127.0.0.1:8000/admin/attributes/create', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-27 00:27:46', '2025-06-27 00:27:46'),
(1352, 'ydMqZBcoblWvZHpwuy7SP2Ql557Ciz5QH0xumMpF', 1, 'http://127.0.0.1:8000/admin/attributes', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-27 00:29:07', '2025-06-27 00:29:07'),
(1353, 'ydMqZBcoblWvZHpwuy7SP2Ql557Ciz5QH0xumMpF', 1, 'http://127.0.0.1:8000/admin/attributes', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-27 00:29:14', '2025-06-27 00:29:14'),
(1354, 'ydMqZBcoblWvZHpwuy7SP2Ql557Ciz5QH0xumMpF', 1, 'http://127.0.0.1:8000/admin/attributes', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-27 00:30:21', '2025-06-27 00:30:21'),
(1355, 'ydMqZBcoblWvZHpwuy7SP2Ql557Ciz5QH0xumMpF', 1, 'http://127.0.0.1:8000/admin/attributes/create', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-27 00:31:07', '2025-06-27 00:31:07'),
(1356, 'ydMqZBcoblWvZHpwuy7SP2Ql557Ciz5QH0xumMpF', 1, 'http://127.0.0.1:8000/admin/variants', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-27 00:32:25', '2025-06-27 00:32:25'),
(1357, 'ydMqZBcoblWvZHpwuy7SP2Ql557Ciz5QH0xumMpF', 1, 'http://127.0.0.1:8000/admin/products', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-27 00:33:42', '2025-06-27 00:33:42'),
(1358, 'ydMqZBcoblWvZHpwuy7SP2Ql557Ciz5QH0xumMpF', 1, 'http://127.0.0.1:8000/admin/products/create', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-27 00:35:18', '2025-06-27 00:35:18'),
(1359, 'ydMqZBcoblWvZHpwuy7SP2Ql557Ciz5QH0xumMpF', 1, 'http://127.0.0.1:8000/admin/categories/25/specifications', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-27 00:36:33', '2025-06-27 00:36:33'),
(1360, 'ydMqZBcoblWvZHpwuy7SP2Ql557Ciz5QH0xumMpF', 1, 'http://127.0.0.1:8000/admin/categories/25/attributes', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-27 00:36:45', '2025-06-27 00:36:45'),
(1361, 'ydMqZBcoblWvZHpwuy7SP2Ql557Ciz5QH0xumMpF', 1, 'http://127.0.0.1:8000/admin/attributes/66/values', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-27 00:37:32', '2025-06-27 00:37:32'),
(1362, 'ydMqZBcoblWvZHpwuy7SP2Ql557Ciz5QH0xumMpF', 1, 'http://127.0.0.1:8000/admin/attributes/66/values', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-27 00:37:39', '2025-06-27 00:37:39'),
(1363, 'ydMqZBcoblWvZHpwuy7SP2Ql557Ciz5QH0xumMpF', 1, 'http://127.0.0.1:8000/admin/attributes/64/values', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-27 00:38:45', '2025-06-27 00:38:45'),
(1364, 'ydMqZBcoblWvZHpwuy7SP2Ql557Ciz5QH0xumMpF', 1, 'http://127.0.0.1:8000/admin/attributes/64/values', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-27 00:38:53', '2025-06-27 00:38:53'),
(1365, 'ojcpf6jZbC01Iut51s9rjxC95hbINMnqIuycl0mw', NULL, 'http://127.0.0.1:8000/login', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-27 14:44:56', '2025-06-27 14:44:56'),
(1366, 'ojcpf6jZbC01Iut51s9rjxC95hbINMnqIuycl0mw', NULL, 'http://127.0.0.1:8000/login', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-27 14:45:10', '2025-06-27 14:45:10'),
(1367, 'ojcpf6jZbC01Iut51s9rjxC95hbINMnqIuycl0mw', NULL, 'http://127.0.0.1:8000/login', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-27 14:45:12', '2025-06-27 14:45:12'),
(1368, 'ojcpf6jZbC01Iut51s9rjxC95hbINMnqIuycl0mw', NULL, 'http://127.0.0.1:8000/login', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-27 14:45:24', '2025-06-27 14:45:24'),
(1369, 'GmzhsPugwtkwFS9sEB1DVgrOHGUzNHqRdn4GZnxF', 19, 'http://127.0.0.1:8000/admin/variants', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-27 14:45:26', '2025-06-27 14:45:26'),
(1370, 'GmzhsPugwtkwFS9sEB1DVgrOHGUzNHqRdn4GZnxF', 19, 'http://127.0.0.1:8000/admin/attributes', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-27 14:45:42', '2025-06-27 14:45:42'),
(1371, 'GmzhsPugwtkwFS9sEB1DVgrOHGUzNHqRdn4GZnxF', 19, 'http://127.0.0.1:8000/admin/attributes/create', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-27 14:45:52', '2025-06-27 14:45:52'),
(1372, 'GmzhsPugwtkwFS9sEB1DVgrOHGUzNHqRdn4GZnxF', 19, 'http://127.0.0.1:8000/logout', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-27 14:46:04', '2025-06-27 14:46:04'),
(1373, '0HU09mmqAtJjrsPkIuBL9tuMRgJZy4BvD3CUE7lW', NULL, 'http://127.0.0.1:8000/login', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-27 14:46:05', '2025-06-27 14:46:05'),
(1374, '0HU09mmqAtJjrsPkIuBL9tuMRgJZy4BvD3CUE7lW', NULL, 'http://127.0.0.1:8000/login', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-27 14:46:11', '2025-06-27 14:46:11'),
(1375, 'r1oebdUg8LFrOJ6uasY0qAKuqjQ7Vz5LZm0Bwod9', 1, 'http://127.0.0.1:8000/admin', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-27 14:46:13', '2025-06-27 14:46:13'),
(1376, 'r1oebdUg8LFrOJ6uasY0qAKuqjQ7Vz5LZm0Bwod9', 1, 'http://127.0.0.1:8000/admin/attributes', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-27 14:46:31', '2025-06-27 14:46:31'),
(1377, 'r1oebdUg8LFrOJ6uasY0qAKuqjQ7Vz5LZm0Bwod9', 1, 'http://127.0.0.1:8000/admin/attributes/create', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-27 14:46:37', '2025-06-27 14:46:37'),
(1378, 'r1oebdUg8LFrOJ6uasY0qAKuqjQ7Vz5LZm0Bwod9', 1, 'http://127.0.0.1:8000/admin/attributes', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-27 14:47:00', '2025-06-27 14:47:00'),
(1379, 'r1oebdUg8LFrOJ6uasY0qAKuqjQ7Vz5LZm0Bwod9', 1, 'http://127.0.0.1:8000/admin/attributes', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-27 14:47:02', '2025-06-27 14:47:02'),
(1380, 'r1oebdUg8LFrOJ6uasY0qAKuqjQ7Vz5LZm0Bwod9', 1, 'http://127.0.0.1:8000/admin/attributes', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-27 14:47:03', '2025-06-27 14:47:03'),
(1381, 'r1oebdUg8LFrOJ6uasY0qAKuqjQ7Vz5LZm0Bwod9', 1, 'http://127.0.0.1:8000/admin/attributes', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-27 14:47:06', '2025-06-27 14:47:06'),
(1382, 'r1oebdUg8LFrOJ6uasY0qAKuqjQ7Vz5LZm0Bwod9', 1, 'http://127.0.0.1:8000/admin/attributes', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-27 14:47:08', '2025-06-27 14:47:08'),
(1383, 'r1oebdUg8LFrOJ6uasY0qAKuqjQ7Vz5LZm0Bwod9', 1, 'http://127.0.0.1:8000/admin/attributes/store-values', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-27 14:47:45', '2025-06-27 14:47:45'),
(1384, 'r1oebdUg8LFrOJ6uasY0qAKuqjQ7Vz5LZm0Bwod9', 1, 'http://127.0.0.1:8000/admin/attributes/store-values', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-27 14:47:47', '2025-06-27 14:47:47'),
(1385, 'r1oebdUg8LFrOJ6uasY0qAKuqjQ7Vz5LZm0Bwod9', 1, 'http://127.0.0.1:8000/admin/attributes', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-27 14:47:48', '2025-06-27 14:47:48'),
(1386, 'r1oebdUg8LFrOJ6uasY0qAKuqjQ7Vz5LZm0Bwod9', 1, 'http://127.0.0.1:8000/admin/products', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-27 14:48:02', '2025-06-27 14:48:02'),
(1387, 'r1oebdUg8LFrOJ6uasY0qAKuqjQ7Vz5LZm0Bwod9', 1, 'http://127.0.0.1:8000/admin/products/create', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-27 14:48:10', '2025-06-27 14:48:10'),
(1388, 'r1oebdUg8LFrOJ6uasY0qAKuqjQ7Vz5LZm0Bwod9', 1, 'http://127.0.0.1:8000/admin/categories/25/attributes', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-27 14:48:20', '2025-06-27 14:48:20'),
(1389, 'r1oebdUg8LFrOJ6uasY0qAKuqjQ7Vz5LZm0Bwod9', 1, 'http://127.0.0.1:8000/admin/categories/25/specifications', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-27 14:48:21', '2025-06-27 14:48:21'),
(1390, 'r1oebdUg8LFrOJ6uasY0qAKuqjQ7Vz5LZm0Bwod9', 1, 'http://127.0.0.1:8000/admin/attributes/63/values', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-27 14:48:47', '2025-06-27 14:48:47'),
(1391, 'r1oebdUg8LFrOJ6uasY0qAKuqjQ7Vz5LZm0Bwod9', 1, 'http://127.0.0.1:8000/admin/attributes/63/values', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-27 14:48:49', '2025-06-27 14:48:49'),
(1392, 'r1oebdUg8LFrOJ6uasY0qAKuqjQ7Vz5LZm0Bwod9', 1, 'http://127.0.0.1:8000/admin/attributes/68/values', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-27 14:48:55', '2025-06-27 14:48:55'),
(1393, 'r1oebdUg8LFrOJ6uasY0qAKuqjQ7Vz5LZm0Bwod9', 1, 'http://127.0.0.1:8000/admin/attributes/68/values', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-27 14:48:56', '2025-06-27 14:48:56'),
(1394, 'r1oebdUg8LFrOJ6uasY0qAKuqjQ7Vz5LZm0Bwod9', 1, 'http://127.0.0.1:8000/admin/attributes/66/values', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-27 14:48:59', '2025-06-27 14:48:59'),
(1395, 'r1oebdUg8LFrOJ6uasY0qAKuqjQ7Vz5LZm0Bwod9', 1, 'http://127.0.0.1:8000/admin/attributes/66/values', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-27 14:49:00', '2025-06-27 14:49:00'),
(1396, 'r1oebdUg8LFrOJ6uasY0qAKuqjQ7Vz5LZm0Bwod9', 1, 'http://127.0.0.1:8000/admin/attributes/64/values', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-27 14:49:04', '2025-06-27 14:49:04'),
(1397, 'r1oebdUg8LFrOJ6uasY0qAKuqjQ7Vz5LZm0Bwod9', 1, 'http://127.0.0.1:8000/admin/attributes/64/values', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-27 14:49:05', '2025-06-27 14:49:05'),
(1398, 'wC9puh4c5xMx14EwrjSIDqezEKd5Tjrsb15UYaVl', NULL, 'http://127.0.0.1:8000/', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', 5, '2025-06-27 20:58:36', '2025-06-27 20:58:40'),
(1399, 'FZrTRJUPGw62nViJwCEDgddegY9LFcWvh46nzAOJ', NULL, 'http://127.0.0.1:8000', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-27 21:06:43', '2025-06-27 21:06:43'),
(1400, 'FZrTRJUPGw62nViJwCEDgddegY9LFcWvh46nzAOJ', NULL, 'http://127.0.0.1:8000/login', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-27 21:06:59', '2025-06-27 21:06:59'),
(1401, 'FZrTRJUPGw62nViJwCEDgddegY9LFcWvh46nzAOJ', NULL, 'http://127.0.0.1:8000/login', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-27 21:07:07', '2025-06-27 21:07:07'),
(1402, 'FZrTRJUPGw62nViJwCEDgddegY9LFcWvh46nzAOJ', NULL, 'http://127.0.0.1:8000/login', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-27 21:07:26', '2025-06-27 21:07:26'),
(1403, 'FZrTRJUPGw62nViJwCEDgddegY9LFcWvh46nzAOJ', NULL, 'http://127.0.0.1:8000/login', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-27 21:07:34', '2025-06-27 21:07:34'),
(1404, 'FZrTRJUPGw62nViJwCEDgddegY9LFcWvh46nzAOJ', NULL, 'http://127.0.0.1:8000/login', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-27 21:07:48', '2025-06-27 21:07:48'),
(1405, 'EF7Hs5zspkxjK4sqljdJuBhnxJ2raXWTkUShj6Fr', 71, 'http://127.0.0.1:8000', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-27 21:07:57', '2025-06-27 21:07:57'),
(1406, 'EF7Hs5zspkxjK4sqljdJuBhnxJ2raXWTkUShj6Fr', 71, 'http://127.0.0.1:8000/profile', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-27 21:08:13', '2025-06-27 21:08:13'),
(1407, 'EF7Hs5zspkxjK4sqljdJuBhnxJ2raXWTkUShj6Fr', 71, 'http://127.0.0.1:8000/profile/password', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-27 21:08:33', '2025-06-27 21:08:33'),
(1408, 'EF7Hs5zspkxjK4sqljdJuBhnxJ2raXWTkUShj6Fr', 71, 'http://127.0.0.1:8000/logout', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-27 21:09:44', '2025-06-27 21:09:44'),
(1409, 'fbm6QvnGxPGCXAGa1J3BY5et76kYvhxbnqiKtKrk', NULL, 'http://127.0.0.1:8000/login', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-27 21:09:51', '2025-06-27 21:09:51'),
(1410, 'fbm6QvnGxPGCXAGa1J3BY5et76kYvhxbnqiKtKrk', NULL, 'http://127.0.0.1:8000/login', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-27 21:10:25', '2025-06-27 21:10:25'),
(1411, 'EvPWJb5Gi2qWQ33LXV5J7qeXjQqPsyCjM28uO3Kb', 19, 'http://127.0.0.1:8000/admin', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-27 21:10:33', '2025-06-27 21:10:33'),
(1412, 'EvPWJb5Gi2qWQ33LXV5J7qeXjQqPsyCjM28uO3Kb', 19, 'http://127.0.0.1:8000/admin', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-27 21:14:38', '2025-06-27 21:14:38'),
(1413, 'EvPWJb5Gi2qWQ33LXV5J7qeXjQqPsyCjM28uO3Kb', 19, 'http://127.0.0.1:8000/admin', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-27 21:17:06', '2025-06-27 21:17:06'),
(1414, 'EvPWJb5Gi2qWQ33LXV5J7qeXjQqPsyCjM28uO3Kb', 19, 'http://127.0.0.1:8000/admin', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-27 21:17:19', '2025-06-27 21:17:19'),
(1415, 'EvPWJb5Gi2qWQ33LXV5J7qeXjQqPsyCjM28uO3Kb', 19, 'http://127.0.0.1:8000/admin/profile/edit', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-27 21:18:27', '2025-06-27 21:18:27'),
(1416, 'EvPWJb5Gi2qWQ33LXV5J7qeXjQqPsyCjM28uO3Kb', 19, 'http://127.0.0.1:8000/admin/profile/edit', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-27 21:19:13', '2025-06-27 21:19:13'),
(1417, 'EvPWJb5Gi2qWQ33LXV5J7qeXjQqPsyCjM28uO3Kb', 19, 'http://127.0.0.1:8000/admin/profile', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-27 21:19:27', '2025-06-27 21:19:27'),
(1418, 'EvPWJb5Gi2qWQ33LXV5J7qeXjQqPsyCjM28uO3Kb', 19, 'http://127.0.0.1:8000/admin/profile/edit', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-27 21:20:17', '2025-06-27 21:20:17'),
(1419, '3fIAVb22ZXyAY70Z2Pgp7hBqa5pSxmygqeFVKgKF', 1, 'http://127.0.0.1:8000/', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', 23, '2025-06-27 21:20:40', '2025-06-27 21:21:02'),
(1420, 'EvPWJb5Gi2qWQ33LXV5J7qeXjQqPsyCjM28uO3Kb', 19, 'http://127.0.0.1:8000/admin/profile/edit', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-27 21:25:03', '2025-06-27 21:25:03'),
(1421, '5JaMjbSo2nx1uPLagyLNWd7OiZ6tJTJyJv95Bj04', NULL, 'http://127.0.0.1:8000/', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', 3, '2025-06-27 21:25:21', '2025-06-27 21:25:23'),
(1422, 'JtwjGpC7tKLGgGY3WGO7AnAqc9qFA1biAEjTTcZX', 77, 'http://127.0.0.1:8000/', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', 3, '2025-06-27 21:25:34', '2025-06-27 21:25:36'),
(1423, 'JtwjGpC7tKLGgGY3WGO7AnAqc9qFA1biAEjTTcZX', 77, 'http://127.0.0.1:8000/about', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', 345, '2025-06-27 21:25:37', '2025-06-27 21:31:22'),
(1424, 'EvPWJb5Gi2qWQ33LXV5J7qeXjQqPsyCjM28uO3Kb', 19, 'http://127.0.0.1:8000', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-27 21:25:56', '2025-06-27 21:25:56'),
(1425, 'EvPWJb5Gi2qWQ33LXV5J7qeXjQqPsyCjM28uO3Kb', 19, 'http://127.0.0.1:8000/profile', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-27 21:26:27', '2025-06-27 21:26:27'),
(1426, 'EvPWJb5Gi2qWQ33LXV5J7qeXjQqPsyCjM28uO3Kb', 19, 'http://127.0.0.1:8000/profile', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-27 21:27:19', '2025-06-27 21:27:19'),
(1427, 'EvPWJb5Gi2qWQ33LXV5J7qeXjQqPsyCjM28uO3Kb', 19, 'http://127.0.0.1:8000/profile', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-27 21:27:37', '2025-06-27 21:27:37'),
(1428, 'EvPWJb5Gi2qWQ33LXV5J7qeXjQqPsyCjM28uO3Kb', 19, 'http://127.0.0.1:8000/admin/profile/edit', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-27 21:27:45', '2025-06-27 21:27:45'),
(1429, 'EvPWJb5Gi2qWQ33LXV5J7qeXjQqPsyCjM28uO3Kb', 19, 'http://127.0.0.1:8000/profile', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-27 21:28:22', '2025-06-27 21:28:22'),
(1430, 'EvPWJb5Gi2qWQ33LXV5J7qeXjQqPsyCjM28uO3Kb', 19, 'http://127.0.0.1:8000/profile', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-27 21:28:29', '2025-06-27 21:28:29'),
(1431, 'EvPWJb5Gi2qWQ33LXV5J7qeXjQqPsyCjM28uO3Kb', 19, 'http://127.0.0.1:8000/admin/profile/edit', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-27 21:28:58', '2025-06-27 21:28:58'),
(1432, 'EvPWJb5Gi2qWQ33LXV5J7qeXjQqPsyCjM28uO3Kb', 19, 'http://127.0.0.1:8000/profile', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-27 21:30:19', '2025-06-27 21:30:19'),
(1433, 'EvPWJb5Gi2qWQ33LXV5J7qeXjQqPsyCjM28uO3Kb', 19, 'http://127.0.0.1:8000/profile', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-27 21:30:34', '2025-06-27 21:30:34'),
(1434, 'EvPWJb5Gi2qWQ33LXV5J7qeXjQqPsyCjM28uO3Kb', 19, 'http://127.0.0.1:8000/profile', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-27 21:31:00', '2025-06-27 21:31:00'),
(1435, 'EvPWJb5Gi2qWQ33LXV5J7qeXjQqPsyCjM28uO3Kb', 19, 'http://127.0.0.1:8000/profile', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-27 21:31:08', '2025-06-27 21:31:08'),
(1436, 'EvPWJb5Gi2qWQ33LXV5J7qeXjQqPsyCjM28uO3Kb', 19, 'http://127.0.0.1:8000/profile', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-27 21:31:16', '2025-06-27 21:31:16'),
(1437, 'JtwjGpC7tKLGgGY3WGO7AnAqc9qFA1biAEjTTcZX', 77, 'http://127.0.0.1:8000/blog', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', 1196, '2025-06-27 21:31:23', '2025-06-27 21:51:19'),
(1438, 'EvPWJb5Gi2qWQ33LXV5J7qeXjQqPsyCjM28uO3Kb', 19, 'http://127.0.0.1:8000/profile/password', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-27 21:31:24', '2025-06-27 21:31:24'),
(1439, 'EvPWJb5Gi2qWQ33LXV5J7qeXjQqPsyCjM28uO3Kb', 19, 'http://127.0.0.1:8000/admin/profile/edit', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-27 21:31:32', '2025-06-27 21:31:32'),
(1440, 'EvPWJb5Gi2qWQ33LXV5J7qeXjQqPsyCjM28uO3Kb', 19, 'http://127.0.0.1:8000/profile/password', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-27 21:33:20', '2025-06-27 21:33:20'),
(1441, 'EvPWJb5Gi2qWQ33LXV5J7qeXjQqPsyCjM28uO3Kb', 19, 'http://127.0.0.1:8000/profile/password', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-27 21:34:18', '2025-06-27 21:34:18'),
(1442, 'EvPWJb5Gi2qWQ33LXV5J7qeXjQqPsyCjM28uO3Kb', 19, 'http://127.0.0.1:8000/admin/profile', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-27 21:34:49', '2025-06-27 21:34:49'),
(1443, 'EvPWJb5Gi2qWQ33LXV5J7qeXjQqPsyCjM28uO3Kb', 19, 'http://127.0.0.1:8000/profile/orders', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-27 21:36:55', '2025-06-27 21:36:55'),
(1444, 'EvPWJb5Gi2qWQ33LXV5J7qeXjQqPsyCjM28uO3Kb', 19, 'http://127.0.0.1:8000/profile/orders', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-27 21:38:25', '2025-06-27 21:38:25'),
(1445, 'EvPWJb5Gi2qWQ33LXV5J7qeXjQqPsyCjM28uO3Kb', 19, 'http://127.0.0.1:8000/profile/orders', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-27 21:38:32', '2025-06-27 21:38:32'),
(1446, 'EvPWJb5Gi2qWQ33LXV5J7qeXjQqPsyCjM28uO3Kb', 19, 'http://127.0.0.1:8000/profile/orders', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-27 21:38:40', '2025-06-27 21:38:40'),
(1447, 'EvPWJb5Gi2qWQ33LXV5J7qeXjQqPsyCjM28uO3Kb', 19, 'http://127.0.0.1:8000/profile/orders', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-27 21:38:48', '2025-06-27 21:38:48'),
(1448, 'EvPWJb5Gi2qWQ33LXV5J7qeXjQqPsyCjM28uO3Kb', 19, 'http://127.0.0.1:8000/profile/orders', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-27 21:38:56', '2025-06-27 21:38:56'),
(1449, 'EvPWJb5Gi2qWQ33LXV5J7qeXjQqPsyCjM28uO3Kb', 19, 'http://127.0.0.1:8000/admin', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-27 21:39:06', '2025-06-27 21:39:06'),
(1450, 'EvPWJb5Gi2qWQ33LXV5J7qeXjQqPsyCjM28uO3Kb', 19, 'http://127.0.0.1:8000/profile/orders', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-27 21:39:45', '2025-06-27 21:39:45'),
(1451, 'EvPWJb5Gi2qWQ33LXV5J7qeXjQqPsyCjM28uO3Kb', 19, 'http://127.0.0.1:8000/admin', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-27 21:39:53', '2025-06-27 21:39:53'),
(1452, 'EvPWJb5Gi2qWQ33LXV5J7qeXjQqPsyCjM28uO3Kb', 19, 'http://127.0.0.1:8000/admin', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-27 21:40:09', '2025-06-27 21:40:09'),
(1453, 'EvPWJb5Gi2qWQ33LXV5J7qeXjQqPsyCjM28uO3Kb', 19, 'http://127.0.0.1:8000/profile/orders', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-27 21:40:34', '2025-06-27 21:40:34'),
(1454, 'EvPWJb5Gi2qWQ33LXV5J7qeXjQqPsyCjM28uO3Kb', 19, 'http://127.0.0.1:8000/admin', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-27 21:40:42', '2025-06-27 21:40:42'),
(1455, 'EvPWJb5Gi2qWQ33LXV5J7qeXjQqPsyCjM28uO3Kb', 19, 'http://127.0.0.1:8000/profile/orders', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-27 21:40:54', '2025-06-27 21:40:54'),
(1456, 'EvPWJb5Gi2qWQ33LXV5J7qeXjQqPsyCjM28uO3Kb', 19, 'http://127.0.0.1:8000/admin', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-27 21:41:02', '2025-06-27 21:41:02'),
(1457, 'EvPWJb5Gi2qWQ33LXV5J7qeXjQqPsyCjM28uO3Kb', 19, 'http://127.0.0.1:8000/admin/profile', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-27 21:41:22', '2025-06-27 21:41:22'),
(1458, 'EvPWJb5Gi2qWQ33LXV5J7qeXjQqPsyCjM28uO3Kb', 19, 'http://127.0.0.1:8000/profile/orders', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-27 21:42:40', '2025-06-27 21:42:40'),
(1459, 'EvPWJb5Gi2qWQ33LXV5J7qeXjQqPsyCjM28uO3Kb', 19, 'http://127.0.0.1:8000/profile/orders', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-27 21:43:36', '2025-06-27 21:43:36'),
(1460, 'EvPWJb5Gi2qWQ33LXV5J7qeXjQqPsyCjM28uO3Kb', 19, 'http://127.0.0.1:8000/admin/profile', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-27 21:43:44', '2025-06-27 21:43:44'),
(1461, 'EvPWJb5Gi2qWQ33LXV5J7qeXjQqPsyCjM28uO3Kb', 19, 'http://127.0.0.1:8000/profile/orders', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-27 21:46:07', '2025-06-27 21:46:07'),
(1462, 'EvPWJb5Gi2qWQ33LXV5J7qeXjQqPsyCjM28uO3Kb', 19, 'http://127.0.0.1:8000/profile/orders', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-27 21:46:22', '2025-06-27 21:46:22'),
(1463, 'EvPWJb5Gi2qWQ33LXV5J7qeXjQqPsyCjM28uO3Kb', 19, 'http://127.0.0.1:8000/profile/orders', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-27 21:47:53', '2025-06-27 21:47:53'),
(1464, 'EvPWJb5Gi2qWQ33LXV5J7qeXjQqPsyCjM28uO3Kb', 19, 'http://127.0.0.1:8000/profile/orders', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-27 21:48:07', '2025-06-27 21:48:07'),
(1465, 'EvPWJb5Gi2qWQ33LXV5J7qeXjQqPsyCjM28uO3Kb', 19, 'http://127.0.0.1:8000/admin/profile', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-27 21:48:15', '2025-06-27 21:48:15'),
(1466, 'EvPWJb5Gi2qWQ33LXV5J7qeXjQqPsyCjM28uO3Kb', 19, 'http://127.0.0.1:8000/profile', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-27 21:49:00', '2025-06-27 21:49:00'),
(1467, 'EvPWJb5Gi2qWQ33LXV5J7qeXjQqPsyCjM28uO3Kb', 19, 'http://127.0.0.1:8000/profile', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-27 21:50:10', '2025-06-27 21:50:10'),
(1468, 'EvPWJb5Gi2qWQ33LXV5J7qeXjQqPsyCjM28uO3Kb', 19, 'http://127.0.0.1:8000/profile', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-27 21:50:23', '2025-06-27 21:50:23'),
(1469, 'EvPWJb5Gi2qWQ33LXV5J7qeXjQqPsyCjM28uO3Kb', 19, 'http://127.0.0.1:8000/admin/profile', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-27 21:50:31', '2025-06-27 21:50:31'),
(1470, 'JtwjGpC7tKLGgGY3WGO7AnAqc9qFA1biAEjTTcZX', 77, 'http://127.0.0.1:8000/', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', 131, '2025-06-27 21:51:20', '2025-06-27 21:53:31'),
(1471, 'EvPWJb5Gi2qWQ33LXV5J7qeXjQqPsyCjM28uO3Kb', 19, 'http://127.0.0.1:8000/profile', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-27 21:52:25', '2025-06-27 21:52:25'),
(1472, 'JtwjGpC7tKLGgGY3WGO7AnAqc9qFA1biAEjTTcZX', 77, 'http://127.0.0.1:8000/product/airpods-pro-2nd-gen-usb-c-1750313767', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', 2, '2025-06-27 21:53:33', '2025-06-27 21:53:35'),
(1473, 'EvPWJb5Gi2qWQ33LXV5J7qeXjQqPsyCjM28uO3Kb', 19, 'http://127.0.0.1:8000/profile', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-27 21:53:53', '2025-06-27 21:53:53'),
(1474, 'EvPWJb5Gi2qWQ33LXV5J7qeXjQqPsyCjM28uO3Kb', 19, 'http://127.0.0.1:8000/profile', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-27 21:54:01', '2025-06-27 21:54:01'),
(1475, 'EvPWJb5Gi2qWQ33LXV5J7qeXjQqPsyCjM28uO3Kb', 19, 'http://127.0.0.1:8000/admin/profile', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-27 21:54:09', '2025-06-27 21:54:09'),
(1476, 'JtwjGpC7tKLGgGY3WGO7AnAqc9qFA1biAEjTTcZX', 77, 'http://127.0.0.1:8000/', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-27 21:54:51', '2025-06-27 21:54:51'),
(1477, 'EvPWJb5Gi2qWQ33LXV5J7qeXjQqPsyCjM28uO3Kb', 19, 'http://127.0.0.1:8000/admin/profile', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-27 21:55:55', '2025-06-27 21:55:55'),
(1478, 'EvPWJb5Gi2qWQ33LXV5J7qeXjQqPsyCjM28uO3Kb', 19, 'http://127.0.0.1:8000/profile', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-27 21:57:36', '2025-06-27 21:57:36'),
(1479, 'EvPWJb5Gi2qWQ33LXV5J7qeXjQqPsyCjM28uO3Kb', 19, 'http://127.0.0.1:8000/profile', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-27 21:58:23', '2025-06-27 21:58:23'),
(1480, 'EvPWJb5Gi2qWQ33LXV5J7qeXjQqPsyCjM28uO3Kb', 19, 'http://127.0.0.1:8000/profile', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-27 21:58:32', '2025-06-27 21:58:32'),
(1481, 'EvPWJb5Gi2qWQ33LXV5J7qeXjQqPsyCjM28uO3Kb', 19, 'http://127.0.0.1:8000/profile', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-27 21:58:40', '2025-06-27 21:58:40'),
(1482, 'EvPWJb5Gi2qWQ33LXV5J7qeXjQqPsyCjM28uO3Kb', 19, 'http://127.0.0.1:8000/profile', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-27 21:58:48', '2025-06-27 21:58:48'),
(1483, 'EvPWJb5Gi2qWQ33LXV5J7qeXjQqPsyCjM28uO3Kb', 19, 'http://127.0.0.1:8000/profile', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-27 21:58:56', '2025-06-27 21:58:56'),
(1484, 'EvPWJb5Gi2qWQ33LXV5J7qeXjQqPsyCjM28uO3Kb', 19, 'http://127.0.0.1:8000/profile', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-27 21:59:04', '2025-06-27 21:59:04'),
(1485, 'EvPWJb5Gi2qWQ33LXV5J7qeXjQqPsyCjM28uO3Kb', 19, 'http://127.0.0.1:8000/admin/profile', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-27 21:59:12', '2025-06-27 21:59:12'),
(1486, 'EvPWJb5Gi2qWQ33LXV5J7qeXjQqPsyCjM28uO3Kb', 19, 'http://127.0.0.1:8000/profile', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-27 21:59:48', '2025-06-27 21:59:48'),
(1487, 'EvPWJb5Gi2qWQ33LXV5J7qeXjQqPsyCjM28uO3Kb', 19, 'http://127.0.0.1:8000/profile', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-27 22:01:40', '2025-06-27 22:01:40'),
(1488, 'EvPWJb5Gi2qWQ33LXV5J7qeXjQqPsyCjM28uO3Kb', 19, 'http://127.0.0.1:8000/profile', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-27 22:01:47', '2025-06-27 22:01:47');
INSERT INTO `page_views` (`id`, `session_id`, `user_id`, `url`, `ip_address`, `user_agent`, `duration`, `created_at`, `updated_at`) VALUES
(1489, 'EvPWJb5Gi2qWQ33LXV5J7qeXjQqPsyCjM28uO3Kb', 19, 'http://127.0.0.1:8000/admin/profile', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-27 22:01:55', '2025-06-27 22:01:55'),
(1490, 'EvPWJb5Gi2qWQ33LXV5J7qeXjQqPsyCjM28uO3Kb', 19, 'http://127.0.0.1:8000/admin/profile', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-27 22:03:35', '2025-06-27 22:03:35'),
(1491, 'EvPWJb5Gi2qWQ33LXV5J7qeXjQqPsyCjM28uO3Kb', 19, 'http://127.0.0.1:8000/admin/profile', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-27 22:03:43', '2025-06-27 22:03:43'),
(1492, 'EvPWJb5Gi2qWQ33LXV5J7qeXjQqPsyCjM28uO3Kb', 19, 'http://127.0.0.1:8000/profile', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-27 22:04:30', '2025-06-27 22:04:30'),
(1493, 'EvPWJb5Gi2qWQ33LXV5J7qeXjQqPsyCjM28uO3Kb', 19, 'http://127.0.0.1:8000/profile', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-27 22:06:10', '2025-06-27 22:06:10'),
(1494, 'EvPWJb5Gi2qWQ33LXV5J7qeXjQqPsyCjM28uO3Kb', 19, 'http://127.0.0.1:8000/profile', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-27 22:08:23', '2025-06-27 22:08:23'),
(1495, 'EvPWJb5Gi2qWQ33LXV5J7qeXjQqPsyCjM28uO3Kb', 19, 'http://127.0.0.1:8000/profile', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-27 22:08:31', '2025-06-27 22:08:31'),
(1496, 'EvPWJb5Gi2qWQ33LXV5J7qeXjQqPsyCjM28uO3Kb', 19, 'http://127.0.0.1:8000/admin/profile', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-27 22:08:39', '2025-06-27 22:08:39'),
(1497, 'EvPWJb5Gi2qWQ33LXV5J7qeXjQqPsyCjM28uO3Kb', 19, 'http://127.0.0.1:8000/admin/profile', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-27 22:08:47', '2025-06-27 22:08:47'),
(1498, 'EvPWJb5Gi2qWQ33LXV5J7qeXjQqPsyCjM28uO3Kb', 19, 'http://127.0.0.1:8000/profile', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-27 22:11:55', '2025-06-27 22:11:55'),
(1499, 'EvPWJb5Gi2qWQ33LXV5J7qeXjQqPsyCjM28uO3Kb', 19, 'http://127.0.0.1:8000/profile', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-27 22:12:03', '2025-06-27 22:12:03'),
(1500, 'EvPWJb5Gi2qWQ33LXV5J7qeXjQqPsyCjM28uO3Kb', 19, 'http://127.0.0.1:8000/profile', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-27 22:13:53', '2025-06-27 22:13:53'),
(1501, 'EvPWJb5Gi2qWQ33LXV5J7qeXjQqPsyCjM28uO3Kb', 19, 'http://127.0.0.1:8000/profile', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-27 22:14:01', '2025-06-27 22:14:01'),
(1502, 'EvPWJb5Gi2qWQ33LXV5J7qeXjQqPsyCjM28uO3Kb', 19, 'http://127.0.0.1:8000/admin/profile', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-27 22:14:20', '2025-06-27 22:14:20'),
(1503, 'EvPWJb5Gi2qWQ33LXV5J7qeXjQqPsyCjM28uO3Kb', 19, 'http://127.0.0.1:8000/profile', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-27 22:16:08', '2025-06-27 22:16:08'),
(1504, 'EvPWJb5Gi2qWQ33LXV5J7qeXjQqPsyCjM28uO3Kb', 19, 'http://127.0.0.1:8000/profile', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-27 22:16:26', '2025-06-27 22:16:26'),
(1505, 'EvPWJb5Gi2qWQ33LXV5J7qeXjQqPsyCjM28uO3Kb', 19, 'http://127.0.0.1:8000/admin/profile', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-27 22:16:34', '2025-06-27 22:16:34'),
(1506, 'EvPWJb5Gi2qWQ33LXV5J7qeXjQqPsyCjM28uO3Kb', 19, 'http://127.0.0.1:8000/profile', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-27 22:17:40', '2025-06-27 22:17:40'),
(1507, 'EvPWJb5Gi2qWQ33LXV5J7qeXjQqPsyCjM28uO3Kb', 19, 'http://127.0.0.1:8000/profile', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-27 22:17:47', '2025-06-27 22:17:47'),
(1508, 'EvPWJb5Gi2qWQ33LXV5J7qeXjQqPsyCjM28uO3Kb', 19, 'http://127.0.0.1:8000/admin/profile', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-27 22:17:55', '2025-06-27 22:17:55'),
(1509, 'EvPWJb5Gi2qWQ33LXV5J7qeXjQqPsyCjM28uO3Kb', 19, 'http://127.0.0.1:8000/admin/profile', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-27 22:18:43', '2025-06-27 22:18:43'),
(1510, 'EvPWJb5Gi2qWQ33LXV5J7qeXjQqPsyCjM28uO3Kb', 19, 'http://127.0.0.1:8000/admin/profile', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-27 22:18:51', '2025-06-27 22:18:51'),
(1511, 'EvPWJb5Gi2qWQ33LXV5J7qeXjQqPsyCjM28uO3Kb', 19, 'http://127.0.0.1:8000/profile', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-27 22:19:37', '2025-06-27 22:19:37'),
(1512, 'EvPWJb5Gi2qWQ33LXV5J7qeXjQqPsyCjM28uO3Kb', 19, 'http://127.0.0.1:8000/admin', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-27 22:19:52', '2025-06-27 22:19:52'),
(1513, 'EvPWJb5Gi2qWQ33LXV5J7qeXjQqPsyCjM28uO3Kb', 19, 'http://127.0.0.1:8000/admin/profile', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-27 22:20:15', '2025-06-27 22:20:15'),
(1514, 'EvPWJb5Gi2qWQ33LXV5J7qeXjQqPsyCjM28uO3Kb', 19, 'http://127.0.0.1:8000/profile', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-27 22:22:29', '2025-06-27 22:22:29'),
(1515, 'EvPWJb5Gi2qWQ33LXV5J7qeXjQqPsyCjM28uO3Kb', 19, 'http://127.0.0.1:8000/profile', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-27 22:22:37', '2025-06-27 22:22:37'),
(1516, 'EvPWJb5Gi2qWQ33LXV5J7qeXjQqPsyCjM28uO3Kb', 19, 'http://127.0.0.1:8000/profile', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-27 22:22:47', '2025-06-27 22:22:47'),
(1517, 'EvPWJb5Gi2qWQ33LXV5J7qeXjQqPsyCjM28uO3Kb', 19, 'http://127.0.0.1:8000/profile', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-27 22:22:55', '2025-06-27 22:22:55'),
(1518, 'EvPWJb5Gi2qWQ33LXV5J7qeXjQqPsyCjM28uO3Kb', 19, 'http://127.0.0.1:8000/profile', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-27 22:23:29', '2025-06-27 22:23:29'),
(1519, 'EvPWJb5Gi2qWQ33LXV5J7qeXjQqPsyCjM28uO3Kb', 19, 'http://127.0.0.1:8000/profile', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-27 22:23:37', '2025-06-27 22:23:37'),
(1520, 'EvPWJb5Gi2qWQ33LXV5J7qeXjQqPsyCjM28uO3Kb', 19, 'http://127.0.0.1:8000/profile', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-27 22:24:01', '2025-06-27 22:24:01'),
(1521, 'EvPWJb5Gi2qWQ33LXV5J7qeXjQqPsyCjM28uO3Kb', 19, 'http://127.0.0.1:8000/admin', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-27 22:24:46', '2025-06-27 22:24:46'),
(1522, 'EvPWJb5Gi2qWQ33LXV5J7qeXjQqPsyCjM28uO3Kb', 19, 'http://127.0.0.1:8000/admin/profile/password', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-27 22:25:02', '2025-06-27 22:25:02'),
(1523, 'EvPWJb5Gi2qWQ33LXV5J7qeXjQqPsyCjM28uO3Kb', 19, 'http://127.0.0.1:8000/admin/categories', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-27 22:25:56', '2025-06-27 22:25:56'),
(1524, 'EvPWJb5Gi2qWQ33LXV5J7qeXjQqPsyCjM28uO3Kb', 19, 'http://127.0.0.1:8000/profile', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-27 22:29:53', '2025-06-27 22:29:53'),
(1525, 'EvPWJb5Gi2qWQ33LXV5J7qeXjQqPsyCjM28uO3Kb', 19, 'http://127.0.0.1:8000/profile', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-27 22:30:01', '2025-06-27 22:30:01'),
(1526, 'EvPWJb5Gi2qWQ33LXV5J7qeXjQqPsyCjM28uO3Kb', 19, 'http://127.0.0.1:8000/admin/profile/password', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-27 22:30:08', '2025-06-27 22:30:08'),
(1527, 'EvPWJb5Gi2qWQ33LXV5J7qeXjQqPsyCjM28uO3Kb', 19, 'http://127.0.0.1:8000/profile', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-27 22:31:27', '2025-06-27 22:31:27'),
(1528, 'EvPWJb5Gi2qWQ33LXV5J7qeXjQqPsyCjM28uO3Kb', 19, 'http://127.0.0.1:8000/profile', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-27 22:31:57', '2025-06-27 22:31:57'),
(1529, 'EvPWJb5Gi2qWQ33LXV5J7qeXjQqPsyCjM28uO3Kb', 19, 'http://127.0.0.1:8000/admin/profile/password', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-27 22:32:05', '2025-06-27 22:32:05'),
(1530, 'EvPWJb5Gi2qWQ33LXV5J7qeXjQqPsyCjM28uO3Kb', 19, 'http://127.0.0.1:8000/profile/password', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-27 22:32:41', '2025-06-27 22:32:41'),
(1531, 'EvPWJb5Gi2qWQ33LXV5J7qeXjQqPsyCjM28uO3Kb', 19, 'http://127.0.0.1:8000/profile/password', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-27 22:33:27', '2025-06-27 22:33:27'),
(1532, 'EvPWJb5Gi2qWQ33LXV5J7qeXjQqPsyCjM28uO3Kb', 19, 'http://127.0.0.1:8000/profile/password', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-27 22:33:43', '2025-06-27 22:33:43'),
(1533, 'EvPWJb5Gi2qWQ33LXV5J7qeXjQqPsyCjM28uO3Kb', 19, 'http://127.0.0.1:8000/admin/profile/password', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-27 22:33:51', '2025-06-27 22:33:51'),
(1534, 'EvPWJb5Gi2qWQ33LXV5J7qeXjQqPsyCjM28uO3Kb', 19, 'http://127.0.0.1:8000/profile/password', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-27 22:34:56', '2025-06-27 22:34:56'),
(1535, 'EvPWJb5Gi2qWQ33LXV5J7qeXjQqPsyCjM28uO3Kb', 19, 'http://127.0.0.1:8000/profile/password', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-27 22:35:04', '2025-06-27 22:35:04'),
(1536, 'EvPWJb5Gi2qWQ33LXV5J7qeXjQqPsyCjM28uO3Kb', 19, 'http://127.0.0.1:8000/admin/profile/password', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-27 22:35:12', '2025-06-27 22:35:12'),
(1537, 'EvPWJb5Gi2qWQ33LXV5J7qeXjQqPsyCjM28uO3Kb', NULL, 'http://127.0.0.1:8000/login', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-27 22:35:35', '2025-06-27 22:35:35'),
(1538, 'EvPWJb5Gi2qWQ33LXV5J7qeXjQqPsyCjM28uO3Kb', NULL, 'http://127.0.0.1:8000/login', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-27 22:35:56', '2025-06-27 22:35:56'),
(1539, 'EvPWJb5Gi2qWQ33LXV5J7qeXjQqPsyCjM28uO3Kb', NULL, 'http://127.0.0.1:8000/login', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-27 22:36:04', '2025-06-27 22:36:04'),
(1540, 'EvPWJb5Gi2qWQ33LXV5J7qeXjQqPsyCjM28uO3Kb', NULL, 'http://127.0.0.1:8000/login', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-27 22:36:25', '2025-06-27 22:36:25'),
(1541, 'x8HRvxhYxmwtEVqVVgH0EgT6G87qpgk9qSRq2ffd', 19, 'http://127.0.0.1:8000/admin/profile/password', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-27 22:36:33', '2025-06-27 22:36:33'),
(1542, 'KNOlGXPxkt3NRPDs1O9rIopggHPqaycK2HdlAw3I', NULL, 'http://127.0.0.1:8000', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', NULL, '2025-06-28 20:00:00', '2025-06-28 20:00:00'),
(1543, 'JRXjRqUofD2PbW3MJEx9r43tRFpIjimWHWFfPM4U', NULL, 'http://127.0.0.1:8000/', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', 79, '2025-06-28 20:44:42', '2025-06-28 20:46:01'),
(1544, 'fHNBtbglKkXMWcixoS4YKDxmsaJHrRLQVbVaO0kC', NULL, 'http://127.0.0.1:8000/', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', 4, '2025-06-29 00:13:31', '2025-06-29 00:13:34'),
(1545, 'LZjOvb0UG1mRN4bmN7rrOViekDrxw5vETJH0kYoh', NULL, 'http://127.0.0.1:8000', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-29 11:02:49', '2025-06-29 11:02:49'),
(1546, 'LZjOvb0UG1mRN4bmN7rrOViekDrxw5vETJH0kYoh', NULL, 'http://127.0.0.1:8000/login', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-29 11:06:47', '2025-06-29 11:06:47'),
(1547, 'LZjOvb0UG1mRN4bmN7rrOViekDrxw5vETJH0kYoh', NULL, 'http://127.0.0.1:8000/login', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-29 11:07:44', '2025-06-29 11:07:44'),
(1548, 'QfoiVYebnuC16Y266yIvGho3cTDQvBdIgWQVBLlc', 1, 'http://127.0.0.1:8000/admin', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', 2526, '2025-06-29 11:07:53', '2025-06-29 11:49:59'),
(1549, 'QfoiVYebnuC16Y266yIvGho3cTDQvBdIgWQVBLlc', 1, 'http://127.0.0.1:8000/admin/profile', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', 2377, '2025-06-29 11:08:38', '2025-06-29 11:48:14'),
(1550, 'QfoiVYebnuC16Y266yIvGho3cTDQvBdIgWQVBLlc', 1, 'http://127.0.0.1:8000/admin/profile', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', 703, '2025-06-29 11:09:33', '2025-06-29 11:21:16'),
(1551, 'QfoiVYebnuC16Y266yIvGho3cTDQvBdIgWQVBLlc', 1, 'http://127.0.0.1:8000/admin/profile', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', 632, '2025-06-29 11:09:41', '2025-06-29 11:20:13'),
(1552, 'QfoiVYebnuC16Y266yIvGho3cTDQvBdIgWQVBLlc', 1, 'http://127.0.0.1:8000', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', 461, '2025-06-29 11:10:38', '2025-06-29 11:18:18'),
(1553, 'QfoiVYebnuC16Y266yIvGho3cTDQvBdIgWQVBLlc', 1, 'http://127.0.0.1:8000/compare?products=155%2C154', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', 340, '2025-06-29 11:11:05', '2025-06-29 11:16:44'),
(1554, 'QfoiVYebnuC16Y266yIvGho3cTDQvBdIgWQVBLlc', 1, 'http://127.0.0.1:8000/', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', 112, '2025-06-29 11:50:14', '2025-06-29 11:52:06'),
(1555, 'QfoiVYebnuC16Y266yIvGho3cTDQvBdIgWQVBLlc', 1, 'http://127.0.0.1:8000/', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-06-29 11:52:21', '2025-06-29 11:52:21'),
(1556, '0GTMuz6u4TtUFnh9jqK689bMQpHblE5qikA9UFYK', NULL, 'http://127.0.0.1:8000/', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', NULL, '2025-06-30 09:42:00', '2025-06-30 09:42:00'),
(1557, 'pySwCaDdaRuvYRRxppQRlicVTFylo6qx2qhL7QlM', 1, 'http://127.0.0.1:8000/', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 18, '2025-06-30 09:58:39', '2025-06-30 09:58:56'),
(1558, 'pySwCaDdaRuvYRRxppQRlicVTFylo6qx2qhL7QlM', 1, 'http://127.0.0.1:8000/compare?products=154%2C155', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 451, '2025-06-30 09:58:57', '2025-06-30 10:06:27'),
(1559, 'pySwCaDdaRuvYRRxppQRlicVTFylo6qx2qhL7QlM', 1, 'http://127.0.0.1:8000/compare?products=154%2C155', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 10, '2025-06-30 10:06:28', '2025-06-30 10:06:37'),
(1560, 'pySwCaDdaRuvYRRxppQRlicVTFylo6qx2qhL7QlM', 1, 'http://127.0.0.1:8000/compare?products=154%2C155', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 49, '2025-06-30 10:06:38', '2025-06-30 10:07:26'),
(1561, 'pySwCaDdaRuvYRRxppQRlicVTFylo6qx2qhL7QlM', 1, 'http://127.0.0.1:8000/compare?products=154%2C155', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 24, '2025-06-30 10:07:27', '2025-06-30 10:07:50'),
(1562, 'pySwCaDdaRuvYRRxppQRlicVTFylo6qx2qhL7QlM', 1, 'http://127.0.0.1:8000/compare?products=154%2C155', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 27, '2025-06-30 10:07:51', '2025-06-30 10:08:18'),
(1563, 'pySwCaDdaRuvYRRxppQRlicVTFylo6qx2qhL7QlM', 1, 'http://127.0.0.1:8000/compare?products=154%2C155', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 354, '2025-06-30 10:08:18', '2025-06-30 10:14:11'),
(1564, 'pySwCaDdaRuvYRRxppQRlicVTFylo6qx2qhL7QlM', 1, 'http://127.0.0.1:8000/compare?products=154%2C155', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 12, '2025-06-30 10:14:12', '2025-06-30 10:14:24'),
(1565, 'pySwCaDdaRuvYRRxppQRlicVTFylo6qx2qhL7QlM', 1, 'http://127.0.0.1:8000/compare?products=154%2C155', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 197, '2025-06-30 10:14:26', '2025-06-30 10:17:43'),
(1566, 'pySwCaDdaRuvYRRxppQRlicVTFylo6qx2qhL7QlM', 1, 'http://127.0.0.1:8000/compare?products=154%2C155', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 10, '2025-06-30 10:17:43', '2025-06-30 10:17:52'),
(1567, 'pySwCaDdaRuvYRRxppQRlicVTFylo6qx2qhL7QlM', 1, 'http://127.0.0.1:8000/compare?products=154%2C155', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 111, '2025-06-30 10:17:53', '2025-06-30 10:19:44'),
(1568, 'pySwCaDdaRuvYRRxppQRlicVTFylo6qx2qhL7QlM', 1, 'http://127.0.0.1:8000/', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 141, '2025-06-30 10:19:45', '2025-06-30 10:22:05'),
(1569, 'pySwCaDdaRuvYRRxppQRlicVTFylo6qx2qhL7QlM', 1, 'http://127.0.0.1:8000/', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 384, '2025-06-30 10:22:06', '2025-06-30 10:28:29'),
(1570, 'pySwCaDdaRuvYRRxppQRlicVTFylo6qx2qhL7QlM', 1, 'http://127.0.0.1:8000/', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 173, '2025-06-30 10:28:30', '2025-06-30 10:31:22'),
(1571, 'pySwCaDdaRuvYRRxppQRlicVTFylo6qx2qhL7QlM', 1, 'http://127.0.0.1:8000/', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 45, '2025-06-30 10:31:24', '2025-06-30 10:32:08'),
(1572, 'pySwCaDdaRuvYRRxppQRlicVTFylo6qx2qhL7QlM', 1, 'http://127.0.0.1:8000/', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 47, '2025-06-30 10:32:09', '2025-06-30 10:32:55'),
(1573, 'pySwCaDdaRuvYRRxppQRlicVTFylo6qx2qhL7QlM', 1, 'http://127.0.0.1:8000/', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', NULL, '2025-06-30 10:34:12', '2025-06-30 10:34:12'),
(1574, '4xnWALXtaDQuZDawFBmlatbtBMNNQwQ7KDODFAnJ', NULL, 'http://127.0.0.1:8000/', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 106, '2025-06-30 16:02:42', '2025-06-30 16:04:28'),
(1575, '4xnWALXtaDQuZDawFBmlatbtBMNNQwQ7KDODFAnJ', NULL, 'http://127.0.0.1:8000/', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 83, '2025-06-30 16:04:28', '2025-06-30 16:05:51'),
(1576, '4xnWALXtaDQuZDawFBmlatbtBMNNQwQ7KDODFAnJ', NULL, 'http://127.0.0.1:8000/', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 53, '2025-06-30 16:05:52', '2025-06-30 16:06:45'),
(1577, '4xnWALXtaDQuZDawFBmlatbtBMNNQwQ7KDODFAnJ', NULL, 'http://127.0.0.1:8000/?', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 194, '2025-06-30 16:06:46', '2025-06-30 16:10:00'),
(1578, '4xnWALXtaDQuZDawFBmlatbtBMNNQwQ7KDODFAnJ', NULL, 'http://127.0.0.1:8000/?', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 67, '2025-06-30 16:10:01', '2025-06-30 16:11:08'),
(1579, '4xnWALXtaDQuZDawFBmlatbtBMNNQwQ7KDODFAnJ', NULL, 'http://127.0.0.1:8000/?', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 17, '2025-06-30 16:11:09', '2025-06-30 16:11:26'),
(1580, '4xnWALXtaDQuZDawFBmlatbtBMNNQwQ7KDODFAnJ', NULL, 'http://127.0.0.1:8000/?', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', NULL, '2025-06-30 16:11:27', '2025-06-30 16:11:27'),
(1581, 'zPXU3CbkX8FV7GyW3TGvyrXjSukKqxlyNCxkBk3E', NULL, 'http://127.0.0.1:8000/#', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 45, '2025-06-30 18:57:49', '2025-06-30 18:58:33'),
(1582, 'Qdm7qkUeQkkxaTunYBhbxykid6mqKHHdTh4HEkcU', 71, 'http://127.0.0.1:8000/', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 134, '2025-06-30 19:00:46', '2025-06-30 19:03:00'),
(1583, 'Qdm7qkUeQkkxaTunYBhbxykid6mqKHHdTh4HEkcU', 71, 'http://127.0.0.1:8000/compare?products=155%2C154', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 286, '2025-06-30 19:04:54', '2025-06-30 19:09:39'),
(1584, 'Qdm7qkUeQkkxaTunYBhbxykid6mqKHHdTh4HEkcU', 71, 'http://127.0.0.1:8000/product/iphone-14-pro-max-1750314182', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 34, '2025-06-30 19:09:47', '2025-06-30 19:10:21'),
(1585, 'Qdm7qkUeQkkxaTunYBhbxykid6mqKHHdTh4HEkcU', 71, 'http://127.0.0.1:8000/shop/tai-nghe-loa', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 74, '2025-06-30 19:10:28', '2025-06-30 19:11:42'),
(1586, 'Qdm7qkUeQkkxaTunYBhbxykid6mqKHHdTh4HEkcU', 71, 'http://127.0.0.1:8000/', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 78, '2025-06-30 19:11:50', '2025-06-30 19:13:07'),
(1587, 'Qdm7qkUeQkkxaTunYBhbxykid6mqKHHdTh4HEkcU', 71, 'http://127.0.0.1:8000/product/iphone-15-pro-max-test-2-1750839360', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', NULL, '2025-06-30 19:13:15', '2025-06-30 19:13:15'),
(1588, '3kSQWZcC3UgUxzMNlTWbMW8Cr3Z775YHmLy3ZHz0', NULL, 'https://applestore.kenhweb.com/', '172.69.165.4', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', 139, '2025-06-30 20:05:45', '2025-06-30 20:08:04'),
(1589, 'pUJy6E68Jf8BM2bDa8e9fyZKR1Z6iIlqbAysHCRW', NULL, 'http://127.0.0.1:8000/', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 31, '2025-06-30 20:10:46', '2025-06-30 20:11:17'),
(1590, 'JH0JhdMm1zTbKjPDNc6RZ9KCXjRz7KDWekJ6yt0L', 43, 'http://127.0.0.1:8000/', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 21, '2025-06-30 20:11:59', '2025-06-30 20:12:20'),
(1591, 'JH0JhdMm1zTbKjPDNc6RZ9KCXjRz7KDWekJ6yt0L', 43, 'http://127.0.0.1:8000/product/iphone-14-pro-max-1750314182', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 14, '2025-06-30 20:12:34', '2025-06-30 20:12:48'),
(1592, 'JH0JhdMm1zTbKjPDNc6RZ9KCXjRz7KDWekJ6yt0L', 43, 'http://127.0.0.1:8000/checkout?variant_id=245&quantity=1&image=http%3A%2F%2F127.0.0.1%3A8000%2Fuploads%2Fproducts%2F1750314183_0_iphone-16-pro-max-16-titan-tu-nhien-thumbnew-650x650.png', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 38, '2025-06-30 20:12:55', '2025-06-30 20:13:33'),
(1593, 'JH0JhdMm1zTbKjPDNc6RZ9KCXjRz7KDWekJ6yt0L', 43, 'http://127.0.0.1:8000/order', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 16, '2025-06-30 20:14:32', '2025-06-30 20:14:47'),
(1594, 'JH0JhdMm1zTbKjPDNc6RZ9KCXjRz7KDWekJ6yt0L', 43, 'http://127.0.0.1:8000/', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 40, '2025-06-30 20:15:01', '2025-06-30 20:15:41'),
(1595, 'JH0JhdMm1zTbKjPDNc6RZ9KCXjRz7KDWekJ6yt0L', 43, 'http://127.0.0.1:8000/product/iphone-14-pro-max-1750314182', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 15, '2025-06-30 20:15:54', '2025-06-30 20:16:08'),
(1596, 'JH0JhdMm1zTbKjPDNc6RZ9KCXjRz7KDWekJ6yt0L', 43, 'http://127.0.0.1:8000/checkout?variant_id=245&quantity=1&image=http%3A%2F%2F127.0.0.1%3A8000%2Fuploads%2Fproducts%2F1750314183_0_iphone-16-pro-max-16-titan-tu-nhien-thumbnew-650x650.png', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 31, '2025-06-30 20:16:15', '2025-06-30 20:16:46'),
(1597, 'JH0JhdMm1zTbKjPDNc6RZ9KCXjRz7KDWekJ6yt0L', 43, 'http://127.0.0.1:8000/order', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-30 20:16:53', '2025-06-30 20:16:53'),
(1598, '1L2acdKvwtGPFIC2pVZJHoIvlR7b99G3Ek8WAzm4', NULL, 'http://127.0.0.1:8000/', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 82, '2025-06-30 20:51:57', '2025-06-30 20:53:18'),
(1599, '2TZOydWRluDWZRA3qwoLib1ATQoL6tIHeO2mL13q', 43, 'http://127.0.0.1:8000/', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 43, '2025-06-30 20:54:30', '2025-06-30 20:55:12'),
(1600, '2TZOydWRluDWZRA3qwoLib1ATQoL6tIHeO2mL13q', 43, 'http://127.0.0.1:8000/order', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 30, '2025-06-30 20:55:53', '2025-06-30 20:56:22'),
(1601, '2TZOydWRluDWZRA3qwoLib1ATQoL6tIHeO2mL13q', 43, 'http://127.0.0.1:8000/order/102/review', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 58, '2025-06-30 20:57:10', '2025-06-30 20:58:08'),
(1602, '2TZOydWRluDWZRA3qwoLib1ATQoL6tIHeO2mL13q', 43, 'http://127.0.0.1:8000/order', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 14, '2025-06-30 20:58:15', '2025-06-30 20:58:29'),
(1603, '2TZOydWRluDWZRA3qwoLib1ATQoL6tIHeO2mL13q', 43, 'http://127.0.0.1:8000/order/102/review', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 27, '2025-06-30 20:58:36', '2025-06-30 20:59:03'),
(1604, '2TZOydWRluDWZRA3qwoLib1ATQoL6tIHeO2mL13q', 43, 'http://127.0.0.1:8000/order/101/review', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 63, '2025-06-30 20:59:09', '2025-06-30 21:00:12'),
(1605, '2TZOydWRluDWZRA3qwoLib1ATQoL6tIHeO2mL13q', 43, 'http://127.0.0.1:8000/order/101/review', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 14, '2025-06-30 21:00:19', '2025-06-30 21:00:33'),
(1606, '2TZOydWRluDWZRA3qwoLib1ATQoL6tIHeO2mL13q', 43, 'http://127.0.0.1:8000/', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 156, '2025-06-30 21:00:47', '2025-06-30 21:03:23'),
(1607, '2TZOydWRluDWZRA3qwoLib1ATQoL6tIHeO2mL13q', 43, 'http://127.0.0.1:8000/cart', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 18, '2025-06-30 21:03:30', '2025-06-30 21:03:47'),
(1608, '2TZOydWRluDWZRA3qwoLib1ATQoL6tIHeO2mL13q', 43, 'http://127.0.0.1:8000/cart/checkout?selected_items%5B%5D=112&selected_items%5B%5D=113', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 37, '2025-06-30 21:03:54', '2025-06-30 21:04:30'),
(1609, '2TZOydWRluDWZRA3qwoLib1ATQoL6tIHeO2mL13q', 43, 'http://127.0.0.1:8000/order', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 308, '2025-06-30 21:04:37', '2025-06-30 21:09:44'),
(1610, '2TZOydWRluDWZRA3qwoLib1ATQoL6tIHeO2mL13q', 43, 'http://127.0.0.1:8000/order', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 29, '2025-06-30 21:09:51', '2025-06-30 21:10:20'),
(1611, '2TZOydWRluDWZRA3qwoLib1ATQoL6tIHeO2mL13q', 43, 'http://127.0.0.1:8000/order/103/review', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 32, '2025-06-30 21:10:27', '2025-06-30 21:10:59'),
(1612, '2TZOydWRluDWZRA3qwoLib1ATQoL6tIHeO2mL13q', 43, 'http://127.0.0.1:8000/order/103/review', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 27, '2025-06-30 21:11:06', '2025-06-30 21:11:32'),
(1613, '2TZOydWRluDWZRA3qwoLib1ATQoL6tIHeO2mL13q', 43, 'http://127.0.0.1:8000/order', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 16, '2025-06-30 21:11:38', '2025-06-30 21:11:53'),
(1614, '2TZOydWRluDWZRA3qwoLib1ATQoL6tIHeO2mL13q', 43, 'http://127.0.0.1:8000/order/103/review', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 38, '2025-06-30 21:12:00', '2025-06-30 21:12:38'),
(1615, '2TZOydWRluDWZRA3qwoLib1ATQoL6tIHeO2mL13q', 43, 'http://127.0.0.1:8000/order/103/review', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 31, '2025-06-30 21:12:45', '2025-06-30 21:13:16'),
(1616, '2TZOydWRluDWZRA3qwoLib1ATQoL6tIHeO2mL13q', 43, 'http://127.0.0.1:8000/', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-30 21:13:30', '2025-06-30 21:13:30'),
(1617, 'B4J7nseW61jt470F7XDRN8FcutZ3yNuyfZoga1tc', NULL, 'http://127.0.0.1:8000/', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 1196, '2025-07-01 09:36:25', '2025-07-01 09:56:20'),
(1618, 'B4J7nseW61jt470F7XDRN8FcutZ3yNuyfZoga1tc', NULL, 'http://127.0.0.1:8000/', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 16, '2025-07-01 09:56:34', '2025-07-01 09:56:50'),
(1619, 'B4J7nseW61jt470F7XDRN8FcutZ3yNuyfZoga1tc', NULL, 'http://127.0.0.1:8000/', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 6, '2025-07-01 09:56:51', '2025-07-01 09:56:56'),
(1620, 'B4J7nseW61jt470F7XDRN8FcutZ3yNuyfZoga1tc', NULL, 'http://127.0.0.1:8000/', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 58, '2025-07-01 09:56:57', '2025-07-01 09:57:55'),
(1621, 'B4J7nseW61jt470F7XDRN8FcutZ3yNuyfZoga1tc', NULL, 'http://127.0.0.1:8000/', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 17, '2025-07-01 09:57:56', '2025-07-01 09:58:12'),
(1622, 'B4J7nseW61jt470F7XDRN8FcutZ3yNuyfZoga1tc', NULL, 'http://127.0.0.1:8000/tim-kiem?q=Iphone+15', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 31, '2025-07-01 09:59:04', '2025-07-01 09:59:34'),
(1623, 'B4J7nseW61jt470F7XDRN8FcutZ3yNuyfZoga1tc', NULL, 'http://127.0.0.1:8000/tim-kiem?q=Iphone+15', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 73, '2025-07-01 09:59:37', '2025-07-01 10:00:50'),
(1624, 'B4J7nseW61jt470F7XDRN8FcutZ3yNuyfZoga1tc', NULL, 'http://127.0.0.1:8000/tim-kiem?q=Iphone+15', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 20, '2025-07-01 10:02:03', '2025-07-01 10:02:22'),
(1625, 'B4J7nseW61jt470F7XDRN8FcutZ3yNuyfZoga1tc', NULL, 'http://127.0.0.1:8000/tim-kiem?q=Iphone+15', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 82, '2025-07-01 10:02:30', '2025-07-01 10:03:51'),
(1626, 'B4J7nseW61jt470F7XDRN8FcutZ3yNuyfZoga1tc', NULL, 'http://127.0.0.1:8000/', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 44, '2025-07-01 10:03:52', '2025-07-01 10:04:35'),
(1627, 'B4J7nseW61jt470F7XDRN8FcutZ3yNuyfZoga1tc', NULL, 'http://127.0.0.1:8000/tim-kiem?q=AirPods+Pro+%282nd+Gen%29+USB-C', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 24, '2025-07-01 10:05:20', '2025-07-01 10:05:43'),
(1628, 'B4J7nseW61jt470F7XDRN8FcutZ3yNuyfZoga1tc', NULL, 'http://127.0.0.1:8000/', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 189, '2025-07-01 10:05:44', '2025-07-01 10:08:53'),
(1629, 'B4J7nseW61jt470F7XDRN8FcutZ3yNuyfZoga1tc', NULL, 'http://127.0.0.1:8000/tim-kiem?q=Testimonial', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', NULL, '2025-07-01 10:08:53', '2025-07-01 10:08:53'),
(1630, 'Roj218Q7K8vb0SmcEIgdgWkCmgxlP0iG6GiS54xL', 1, 'http://127.0.0.1:8000/', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 19, '2025-07-01 10:12:46', '2025-07-01 10:13:04'),
(1631, 'Roj218Q7K8vb0SmcEIgdgWkCmgxlP0iG6GiS54xL', 1, 'http://127.0.0.1:8000/product/iphone-15-pro-max-test-2-1750839360', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 195, '2025-07-01 10:13:06', '2025-07-01 10:16:20'),
(1632, 'Roj218Q7K8vb0SmcEIgdgWkCmgxlP0iG6GiS54xL', 1, 'http://127.0.0.1:8000/tim-kiem?q=iphone+15', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 110, '2025-07-01 10:16:23', '2025-07-01 10:18:13'),
(1633, 'Roj218Q7K8vb0SmcEIgdgWkCmgxlP0iG6GiS54xL', 1, 'http://127.0.0.1:8000/tim-kiem?q=iphone+15', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 7, '2025-07-01 10:18:14', '2025-07-01 10:18:21'),
(1634, 'Roj218Q7K8vb0SmcEIgdgWkCmgxlP0iG6GiS54xL', 1, 'http://127.0.0.1:8000/tim-kiem?q=iphone+15', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 423, '2025-07-01 10:18:22', '2025-07-01 10:25:25'),
(1635, 'Roj218Q7K8vb0SmcEIgdgWkCmgxlP0iG6GiS54xL', 1, 'http://127.0.0.1:8000/', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 19, '2025-07-01 10:54:06', '2025-07-01 10:54:25'),
(1636, 'lyjWQVDsYtZ1VaeZfqBjNZSzNfu5RjoDArlf6utU', NULL, 'http://127.0.0.1:8000/login', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-07-01 14:47:01', '2025-07-01 14:47:01'),
(1637, 'OJCPtBaDq3hIbQCWq0P0tg6CVfwcyXTvafT4WZ1r', NULL, 'http://127.0.0.1:8000/login', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-07-01 14:47:17', '2025-07-01 14:47:17'),
(1638, 'lyjWQVDsYtZ1VaeZfqBjNZSzNfu5RjoDArlf6utU', NULL, 'http://127.0.0.1:8000/login', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-07-01 14:48:52', '2025-07-01 14:48:52'),
(1639, 'lyjWQVDsYtZ1VaeZfqBjNZSzNfu5RjoDArlf6utU', NULL, 'http://127.0.0.1:8000/login', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-07-01 14:49:01', '2025-07-01 14:49:01'),
(1640, 'x2gjPrRCa6qaOLEpajR5PytbYEaSAXfcz8D1vr8G', NULL, 'http://127.0.0.1:8000/order?page=2', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 358, '2025-07-01 15:21:25', '2025-07-01 15:27:22'),
(1641, 'x2gjPrRCa6qaOLEpajR5PytbYEaSAXfcz8D1vr8G', NULL, 'http://127.0.0.1:8000/', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 214, '2025-07-01 15:27:31', '2025-07-01 15:31:04'),
(1642, 'x2gjPrRCa6qaOLEpajR5PytbYEaSAXfcz8D1vr8G', NULL, 'http://127.0.0.1:8000/', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-07-01 15:31:12', '2025-07-01 15:31:12'),
(1643, 'w5vtAmTLBKgo6kqk6Olj7yrIq6AQzx0vakOOKCaO', NULL, 'http://127.0.0.1:8000/order', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 16, '2025-07-01 15:51:00', '2025-07-01 15:51:15'),
(1644, 'Hk3g6G7lTKE1YLznQ00UcgS4Q5KAqdfGmy5cLSnl', 42, 'http://127.0.0.1:8000/', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 26, '2025-07-01 15:52:35', '2025-07-01 15:53:01'),
(1645, 'Hk3g6G7lTKE1YLznQ00UcgS4Q5KAqdfGmy5cLSnl', 42, 'http://127.0.0.1:8000/product/iphone-15-pro-max-1750314062', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 129, '2025-07-01 15:53:08', '2025-07-01 15:55:16'),
(1646, 'Hk3g6G7lTKE1YLznQ00UcgS4Q5KAqdfGmy5cLSnl', 42, 'http://127.0.0.1:8000/', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 27, '2025-07-01 15:55:23', '2025-07-01 15:55:49'),
(1647, 'Hk3g6G7lTKE1YLznQ00UcgS4Q5KAqdfGmy5cLSnl', 42, 'http://127.0.0.1:8000/product/iphone-15-pro-max-test-2-1750839360', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 16, '2025-07-01 15:55:57', '2025-07-01 15:56:12'),
(1648, 'Hk3g6G7lTKE1YLznQ00UcgS4Q5KAqdfGmy5cLSnl', 42, 'http://127.0.0.1:8000/checkout?variant_id=248&quantity=1&image=http%3A%2F%2F127.0.0.1%3A8000%2Fuploads%2Fproducts%2F1750839360_0_iphone-16-pro-max-16-titan-tu-nhien-thumbnew-650x650.png', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 43, '2025-07-01 15:56:20', '2025-07-01 15:57:03'),
(1649, 'Hk3g6G7lTKE1YLznQ00UcgS4Q5KAqdfGmy5cLSnl', 42, 'http://127.0.0.1:8000/order', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 159, '2025-07-01 15:57:10', '2025-07-01 15:59:49'),
(1650, 'Hk3g6G7lTKE1YLznQ00UcgS4Q5KAqdfGmy5cLSnl', 42, 'http://127.0.0.1:8000/order/104/review', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-07-01 15:59:57', '2025-07-01 15:59:57'),
(1651, 'yKsPxq6nBAeo3Kyz2SOwr1dHIyoqWRGpo79ZtarL', NULL, 'https://applestore.kenhweb.com/', '172.71.81.190', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', 3, '2025-07-01 19:51:47', '2025-07-01 19:51:49'),
(1652, 'Ubsygu1uJGNKMSiUEfVPWXIFAeQg49ljotfalHRq', 80, 'https://applestore.kenhweb.com/', '172.71.81.190', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', 94, '2025-07-01 19:55:42', '2025-07-01 19:57:15'),
(1653, 'Ubsygu1uJGNKMSiUEfVPWXIFAeQg49ljotfalHRq', 80, 'https://applestore.kenhweb.com/shop', '172.70.143.175', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', 30, '2025-07-01 19:59:53', '2025-07-01 20:00:23'),
(1654, 'Ubsygu1uJGNKMSiUEfVPWXIFAeQg49ljotfalHRq', 80, 'https://applestore.kenhweb.com/shop/iphone', '172.70.143.175', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', 6, '2025-07-01 20:00:23', '2025-07-01 20:00:28'),
(1655, 'Ubsygu1uJGNKMSiUEfVPWXIFAeQg49ljotfalHRq', 80, 'https://applestore.kenhweb.com/', '162.158.107.30', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-07-01 20:02:58', '2025-07-01 20:02:58'),
(1656, 'mVehMislxaj6lePfzSK3tawA1oAgxOUVFoqhOzvs', NULL, 'http://127.0.0.1:8000/', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', 523, '2025-07-02 20:44:17', '2025-07-02 20:52:59'),
(1657, 'ddIZW6GZ9nQ2c0ohQZVjFNEXKNUe16HeuLrhH3dH', NULL, 'http://127.0.0.1:8000/', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 53, '2025-07-02 20:54:06', '2025-07-02 20:54:59'),
(1658, '5c0xdOuXOZtQ8yx239QNFBXQjv1BIaG8LIlJr7i3', NULL, 'http://127.0.0.1:8000/', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 40, '2025-07-02 20:54:13', '2025-07-02 20:54:52'),
(1659, '5c0xdOuXOZtQ8yx239QNFBXQjv1BIaG8LIlJr7i3', NULL, 'http://127.0.0.1:8000/', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 83, '2025-07-02 20:55:51', '2025-07-02 20:57:13'),
(1660, 'WTgsUCcfPHpD0iMIrPoDIJ0kMlxywruA9WfynZQm', 71, 'http://127.0.0.1:8000/wishlist', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 113, '2025-07-02 20:57:51', '2025-07-02 20:59:44'),
(1661, 'WTgsUCcfPHpD0iMIrPoDIJ0kMlxywruA9WfynZQm', 71, 'http://127.0.0.1:8000/order', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', NULL, '2025-07-02 20:59:50', '2025-07-02 20:59:50'),
(1662, 'mVehMislxaj6lePfzSK3tawA1oAgxOUVFoqhOzvs', NULL, 'http://127.0.0.1:8000/', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', 4, '2025-07-02 21:25:44', '2025-07-02 21:25:47'),
(1663, '7nMXNeJB3O5Pk44ZhPbIbSbhOppnWExbpc76vtAB', NULL, 'http://127.0.0.1:8000/product/iphone-14-pro-max-1751340853', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 225, '2025-07-02 21:46:54', '2025-07-02 21:50:39'),
(1664, '7nMXNeJB3O5Pk44ZhPbIbSbhOppnWExbpc76vtAB', NULL, 'http://127.0.0.1:8000/product/airpods-pro-2nd-gen-usb-c-1750313767', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 11, '2025-07-02 21:50:44', '2025-07-02 21:50:54'),
(1665, 'KK3GlPQ1WsummbY20fcMRk8yqPOGO8WoWnETimjq', 1, 'http://127.0.0.1:8000/', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 30, '2025-07-02 21:52:46', '2025-07-02 21:53:16'),
(1666, 'KK3GlPQ1WsummbY20fcMRk8yqPOGO8WoWnETimjq', 1, 'http://127.0.0.1:8000/product/iphone-14-pro-max-1751340853', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 21, '2025-07-02 21:53:17', '2025-07-02 21:53:38'),
(1667, 'KK3GlPQ1WsummbY20fcMRk8yqPOGO8WoWnETimjq', 1, 'http://127.0.0.1:8000/product/airpods-pro-2nd-gen-usb-c-1750313767', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 4209, '2025-07-02 21:54:03', '2025-07-02 23:04:12'),
(1668, 'KK3GlPQ1WsummbY20fcMRk8yqPOGO8WoWnETimjq', 1, 'http://127.0.0.1:8000/product/iphone-15-pro-max-test-2-1750839360', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-07-02 23:04:13', '2025-07-02 23:04:13'),
(1669, '2SBol2zw3YLuWI7Sz1ceOD1VpJqrxF850Pnif9l4', NULL, 'http://127.0.0.1:8000/', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', 45, '2025-07-03 20:24:17', '2025-07-03 20:25:01'),
(1670, '2SBol2zw3YLuWI7Sz1ceOD1VpJqrxF850Pnif9l4', NULL, 'http://127.0.0.1:8000/product/iphone-14-pro-max-1751340853', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', 1301, '2025-07-03 20:25:05', '2025-07-03 20:46:46');
INSERT INTO `page_views` (`id`, `session_id`, `user_id`, `url`, `ip_address`, `user_agent`, `duration`, `created_at`, `updated_at`) VALUES
(1671, '2SBol2zw3YLuWI7Sz1ceOD1VpJqrxF850Pnif9l4', NULL, 'http://127.0.0.1:8000/product/iphone-14-pro-max-1751340853', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', 1073, '2025-07-03 20:46:47', '2025-07-03 21:04:39'),
(1672, '2SBol2zw3YLuWI7Sz1ceOD1VpJqrxF850Pnif9l4', NULL, 'http://127.0.0.1:8000/product/iphone-14-pro-max-1751340853', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', 19, '2025-07-03 21:04:41', '2025-07-03 21:04:59'),
(1673, '2SBol2zw3YLuWI7Sz1ceOD1VpJqrxF850Pnif9l4', NULL, 'http://127.0.0.1:8000/contact', '127.0.0.1', 'Mozilla/5.0 (iPhone; CPU iPhone OS 16_6 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/16.6 Mobile/15E148 Safari/604.1', 3, '2025-07-03 21:05:00', '2025-07-03 21:05:03'),
(1674, '2SBol2zw3YLuWI7Sz1ceOD1VpJqrxF850Pnif9l4', NULL, 'http://127.0.0.1:8000/product/iphone-14-pro-max-1751340853', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', 2025, '2025-07-03 21:16:28', '2025-07-03 21:50:12'),
(1675, '2SBol2zw3YLuWI7Sz1ceOD1VpJqrxF850Pnif9l4', NULL, 'http://127.0.0.1:8000/', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', 727, '2025-07-03 21:50:14', '2025-07-03 22:02:20'),
(1676, '2SBol2zw3YLuWI7Sz1ceOD1VpJqrxF850Pnif9l4', NULL, 'http://127.0.0.1:8000/', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', 39, '2025-07-03 22:02:25', '2025-07-03 22:03:03'),
(1677, '2SBol2zw3YLuWI7Sz1ceOD1VpJqrxF850Pnif9l4', NULL, 'http://127.0.0.1:8000/product/iphone-15-pro-max-1750314062', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', 41, '2025-07-03 22:03:07', '2025-07-03 22:03:47'),
(1678, '2SBol2zw3YLuWI7Sz1ceOD1VpJqrxF850Pnif9l4', NULL, 'http://127.0.0.1:8000/', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', 37, '2025-07-03 22:03:48', '2025-07-03 22:04:24'),
(1679, '2SBol2zw3YLuWI7Sz1ceOD1VpJqrxF850Pnif9l4', NULL, 'http://127.0.0.1:8000/product/iphone-14-pro-max-1751340853', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', 29, '2025-07-03 22:04:26', '2025-07-03 22:04:55'),
(1680, '2SBol2zw3YLuWI7Sz1ceOD1VpJqrxF850Pnif9l4', NULL, 'http://127.0.0.1:8000/', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', 337, '2025-07-03 22:04:56', '2025-07-03 22:10:32'),
(1681, '2SBol2zw3YLuWI7Sz1ceOD1VpJqrxF850Pnif9l4', NULL, 'http://127.0.0.1:8000/product/iphone-14-pro-max-1751340853', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', 66, '2025-07-03 22:10:34', '2025-07-03 22:11:40'),
(1682, '2SBol2zw3YLuWI7Sz1ceOD1VpJqrxF850Pnif9l4', NULL, 'http://127.0.0.1:8000/', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', 9, '2025-07-03 22:11:41', '2025-07-03 22:11:49'),
(1683, '2SBol2zw3YLuWI7Sz1ceOD1VpJqrxF850Pnif9l4', NULL, 'http://127.0.0.1:8000/blog', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', 37, '2025-07-03 22:11:50', '2025-07-03 22:12:26'),
(1684, '2SBol2zw3YLuWI7Sz1ceOD1VpJqrxF850Pnif9l4', NULL, 'http://127.0.0.1:8000/', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', 31, '2025-07-03 22:12:27', '2025-07-03 22:12:58'),
(1685, '2SBol2zw3YLuWI7Sz1ceOD1VpJqrxF850Pnif9l4', NULL, 'http://127.0.0.1:8000/shop', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', 3, '2025-07-03 22:12:59', '2025-07-03 22:13:01'),
(1686, '2SBol2zw3YLuWI7Sz1ceOD1VpJqrxF850Pnif9l4', NULL, 'http://127.0.0.1:8000/product/iphone-14-pro-max-1751340853', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', 138, '2025-07-03 22:13:02', '2025-07-03 22:15:19'),
(1687, '2SBol2zw3YLuWI7Sz1ceOD1VpJqrxF850Pnif9l4', NULL, 'http://127.0.0.1:8000/about', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', 16, '2025-07-03 22:15:20', '2025-07-03 22:15:36'),
(1688, '2SBol2zw3YLuWI7Sz1ceOD1VpJqrxF850Pnif9l4', NULL, 'http://127.0.0.1:8000/', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', 4, '2025-07-03 22:15:41', '2025-07-03 22:15:44'),
(1689, '2SBol2zw3YLuWI7Sz1ceOD1VpJqrxF850Pnif9l4', NULL, 'http://127.0.0.1:8000/product/airpods-pro-2nd-gen-usb-c-1750313767', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', 107, '2025-07-03 22:15:47', '2025-07-03 22:17:33'),
(1690, '2SBol2zw3YLuWI7Sz1ceOD1VpJqrxF850Pnif9l4', NULL, 'http://127.0.0.1:8000/', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', 12, '2025-07-03 22:17:38', '2025-07-03 22:17:50'),
(1691, '2SBol2zw3YLuWI7Sz1ceOD1VpJqrxF850Pnif9l4', NULL, 'http://127.0.0.1:8000/product/iphone-14-pro-max-1751340853', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', 50, '2025-07-03 22:17:53', '2025-07-03 22:18:42'),
(1692, '2SBol2zw3YLuWI7Sz1ceOD1VpJqrxF850Pnif9l4', NULL, 'http://127.0.0.1:8000/product/iphone-14-pro-max-1751340853', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', 34, '2025-07-03 22:19:50', '2025-07-03 22:20:24'),
(1693, '2SBol2zw3YLuWI7Sz1ceOD1VpJqrxF850Pnif9l4', NULL, 'http://127.0.0.1:8000/', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', 105, '2025-07-03 22:20:25', '2025-07-03 22:22:09'),
(1694, '2SBol2zw3YLuWI7Sz1ceOD1VpJqrxF850Pnif9l4', NULL, 'http://127.0.0.1:8000/', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', 51, '2025-07-03 22:22:11', '2025-07-03 22:23:01'),
(1695, '2SBol2zw3YLuWI7Sz1ceOD1VpJqrxF850Pnif9l4', NULL, 'http://127.0.0.1:8000/', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', 7, '2025-07-03 22:23:03', '2025-07-03 22:23:10'),
(1696, '2SBol2zw3YLuWI7Sz1ceOD1VpJqrxF850Pnif9l4', NULL, 'http://127.0.0.1:8000/shop', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', 5, '2025-07-03 22:23:13', '2025-07-03 22:23:18'),
(1697, '2SBol2zw3YLuWI7Sz1ceOD1VpJqrxF850Pnif9l4', NULL, 'http://127.0.0.1:8000/', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', 195, '2025-07-03 22:23:19', '2025-07-03 22:26:33'),
(1698, '2SBol2zw3YLuWI7Sz1ceOD1VpJqrxF850Pnif9l4', NULL, 'http://127.0.0.1:8000/', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', 118, '2025-07-03 22:26:35', '2025-07-03 22:28:33'),
(1699, '2SBol2zw3YLuWI7Sz1ceOD1VpJqrxF850Pnif9l4', NULL, 'http://127.0.0.1:8000/shop', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', 25, '2025-07-03 22:28:35', '2025-07-03 22:28:59'),
(1700, '2SBol2zw3YLuWI7Sz1ceOD1VpJqrxF850Pnif9l4', NULL, 'http://127.0.0.1:8000/', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', 42, '2025-07-03 22:29:00', '2025-07-03 22:29:42'),
(1701, '2SBol2zw3YLuWI7Sz1ceOD1VpJqrxF850Pnif9l4', NULL, 'http://127.0.0.1:8000/shop', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', 124, '2025-07-03 22:29:43', '2025-07-03 22:31:46'),
(1702, '2SBol2zw3YLuWI7Sz1ceOD1VpJqrxF850Pnif9l4', NULL, 'http://127.0.0.1:8000/shop', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', 146, '2025-07-03 22:31:48', '2025-07-03 22:34:14'),
(1703, '2SBol2zw3YLuWI7Sz1ceOD1VpJqrxF850Pnif9l4', NULL, 'http://127.0.0.1:8000/shop', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', 542, '2025-07-03 22:34:15', '2025-07-03 22:43:17'),
(1704, '2SBol2zw3YLuWI7Sz1ceOD1VpJqrxF850Pnif9l4', NULL, 'http://127.0.0.1:8000/', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', 157, '2025-07-03 22:43:18', '2025-07-03 22:45:55'),
(1705, '2SBol2zw3YLuWI7Sz1ceOD1VpJqrxF850Pnif9l4', NULL, 'http://127.0.0.1:8000/shop', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', 79, '2025-07-03 22:45:55', '2025-07-03 22:47:14'),
(1706, '2SBol2zw3YLuWI7Sz1ceOD1VpJqrxF850Pnif9l4', NULL, 'http://127.0.0.1:8000/blog', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-07-03 22:47:15', '2025-07-03 22:47:15'),
(1707, '8yn2467lJ74G0q8r6PQ9IuJMYfgck8cGxIDOcPTR', NULL, 'http://127.0.0.1:8000/', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', 17, '2025-07-04 20:48:34', '2025-07-04 20:48:51'),
(1708, '8yn2467lJ74G0q8r6PQ9IuJMYfgck8cGxIDOcPTR', NULL, 'http://127.0.0.1:8000/shop', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', 9, '2025-07-04 20:48:52', '2025-07-04 20:49:01'),
(1709, '8yn2467lJ74G0q8r6PQ9IuJMYfgck8cGxIDOcPTR', NULL, 'http://127.0.0.1:8000/', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', 59, '2025-07-04 20:49:05', '2025-07-04 20:50:04'),
(1710, '8yn2467lJ74G0q8r6PQ9IuJMYfgck8cGxIDOcPTR', NULL, 'http://127.0.0.1:8000/contact', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', 45, '2025-07-04 20:50:07', '2025-07-04 20:50:51'),
(1711, '8yn2467lJ74G0q8r6PQ9IuJMYfgck8cGxIDOcPTR', NULL, 'http://127.0.0.1:8000/', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', 129, '2025-07-04 20:50:53', '2025-07-04 20:53:02'),
(1712, '8yn2467lJ74G0q8r6PQ9IuJMYfgck8cGxIDOcPTR', NULL, 'http://127.0.0.1:8000/product/iphone-14-pro-max-1751340853', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', 31, '2025-07-04 20:53:03', '2025-07-04 20:53:34'),
(1713, 'm9i1YKjXz6crgRnu97stSlcxZwXa55l0SrLxqtPz', 1, 'http://127.0.0.1:8000/', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-07-04 20:57:15', '2025-07-04 20:57:15'),
(1714, 'MnSOhnE3aW3LKUG8NT8hawjcySHnuwvcAuaU1zKy', NULL, 'http://127.0.0.1:8000/', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 76, '2025-07-06 13:00:23', '2025-07-06 13:01:39'),
(1715, 'MnSOhnE3aW3LKUG8NT8hawjcySHnuwvcAuaU1zKy', NULL, 'http://127.0.0.1:8000/shop', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 45, '2025-07-06 13:01:46', '2025-07-06 13:02:30'),
(1716, 'MnSOhnE3aW3LKUG8NT8hawjcySHnuwvcAuaU1zKy', NULL, 'http://127.0.0.1:8000/', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', NULL, '2025-07-06 13:02:38', '2025-07-06 13:02:38'),
(1717, 'uGw7MN33U96gewxOpvHLHPrMneNtjG5tcjrcyRSZ', NULL, 'http://127.0.0.1:8000/', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 14, '2025-07-07 10:21:05', '2025-07-07 10:21:18'),
(1718, '0gfmWHtV4bg881VI0KCcDSWEdA1K30sFPxlrXVva', NULL, 'http://127.0.0.1:8000/', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', 3, '2025-07-07 15:40:23', '2025-07-07 15:40:25'),
(1719, 'oDNuLc10polbbNN2QQl7dAmXTVjDVi54tnRMJzvf', NULL, 'http://127.0.0.1:8000/', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', 47, '2025-07-07 15:46:35', '2025-07-07 15:47:22'),
(1720, 'oDNuLc10polbbNN2QQl7dAmXTVjDVi54tnRMJzvf', NULL, 'http://127.0.0.1:8000/shop', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', 181, '2025-07-07 15:47:22', '2025-07-07 15:50:22'),
(1721, 'oDNuLc10polbbNN2QQl7dAmXTVjDVi54tnRMJzvf', NULL, 'http://127.0.0.1:8000/shop', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', 66, '2025-07-07 15:50:23', '2025-07-07 15:51:29'),
(1722, 'oDNuLc10polbbNN2QQl7dAmXTVjDVi54tnRMJzvf', NULL, 'http://127.0.0.1:8000/shop/iphone', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', 13, '2025-07-07 15:51:31', '2025-07-07 15:51:44'),
(1723, 'oDNuLc10polbbNN2QQl7dAmXTVjDVi54tnRMJzvf', NULL, 'http://127.0.0.1:8000/shop/iphone', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', 54, '2025-07-07 15:52:49', '2025-07-07 15:53:42'),
(1724, 'oDNuLc10polbbNN2QQl7dAmXTVjDVi54tnRMJzvf', NULL, 'http://127.0.0.1:8000/shop/iphone', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', 38, '2025-07-07 15:53:43', '2025-07-07 15:54:21'),
(1725, 'oDNuLc10polbbNN2QQl7dAmXTVjDVi54tnRMJzvf', NULL, 'http://127.0.0.1:8000/product/iphone-15-pro-max-test-2-1750839360', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', 145, '2025-07-07 15:54:23', '2025-07-07 15:56:48'),
(1726, 'oDNuLc10polbbNN2QQl7dAmXTVjDVi54tnRMJzvf', NULL, 'http://127.0.0.1:8000/', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', 3, '2025-07-07 15:56:49', '2025-07-07 15:56:51'),
(1727, 'n5xnoxXXeF6WdJS1SdQuwi8PLUoQlUoSReV5MFh8', 77, 'http://127.0.0.1:8000/', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', 19, '2025-07-07 15:57:04', '2025-07-07 15:57:22'),
(1728, 'n5xnoxXXeF6WdJS1SdQuwi8PLUoQlUoSReV5MFh8', 77, 'http://127.0.0.1:8000/product/iphone-14-pro-max-1751340853', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', 66, '2025-07-07 15:57:24', '2025-07-07 15:58:30'),
(1729, 'n5xnoxXXeF6WdJS1SdQuwi8PLUoQlUoSReV5MFh8', 77, 'http://127.0.0.1:8000/cart', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', 41, '2025-07-07 15:58:31', '2025-07-07 15:59:12'),
(1730, 'n5xnoxXXeF6WdJS1SdQuwi8PLUoQlUoSReV5MFh8', 77, 'http://127.0.0.1:8000/', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', 43, '2025-07-07 15:59:14', '2025-07-07 15:59:57'),
(1731, 'n5xnoxXXeF6WdJS1SdQuwi8PLUoQlUoSReV5MFh8', 77, 'http://127.0.0.1:8000/product/iphone-15-pro-max-test-2-1750839360', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', 309, '2025-07-07 15:59:58', '2025-07-07 16:05:06'),
(1732, 'n5xnoxXXeF6WdJS1SdQuwi8PLUoQlUoSReV5MFh8', 77, 'http://127.0.0.1:8000/', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', 83, '2025-07-07 16:05:10', '2025-07-07 16:06:33'),
(1733, 'n5xnoxXXeF6WdJS1SdQuwi8PLUoQlUoSReV5MFh8', 77, 'http://127.0.0.1:8000/cart', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', 5, '2025-07-07 16:06:33', '2025-07-07 16:06:38'),
(1734, 'n5xnoxXXeF6WdJS1SdQuwi8PLUoQlUoSReV5MFh8', 77, 'http://127.0.0.1:8000/product/iphone-15-pro-max-1750314062', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', 31, '2025-07-07 16:06:42', '2025-07-07 16:07:12'),
(1735, 'n5xnoxXXeF6WdJS1SdQuwi8PLUoQlUoSReV5MFh8', 77, 'http://127.0.0.1:8000/checkout?variant_id=244&quantity=1&image=http%3A%2F%2F127.0.0.1%3A8000%2Fuploads%2Fproducts%2F1750314063_0_iphone-16-pro-max-titan-trang-thumb-650x650.png', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', 99, '2025-07-07 16:07:15', '2025-07-07 16:08:54'),
(1736, 'n5xnoxXXeF6WdJS1SdQuwi8PLUoQlUoSReV5MFh8', 77, 'http://127.0.0.1:8000/', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', 57, '2025-07-07 16:08:55', '2025-07-07 16:09:52'),
(1737, 'n5xnoxXXeF6WdJS1SdQuwi8PLUoQlUoSReV5MFh8', 77, 'http://127.0.0.1:8000/product/iphone-14-pro-max-1751340853', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', 6, '2025-07-07 16:09:53', '2025-07-07 16:09:58'),
(1738, 'n5xnoxXXeF6WdJS1SdQuwi8PLUoQlUoSReV5MFh8', 77, 'http://127.0.0.1:8000/checkout?variant_id=245&quantity=1&image=http%3A%2F%2F127.0.0.1%3A8000%2Fuploads%2Fproducts%2F1750314183_0_iphone-16-pro-max-16-titan-tu-nhien-thumbnew-650x650.png', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', 33, '2025-07-07 16:10:50', '2025-07-07 16:11:23'),
(1739, 'n5xnoxXXeF6WdJS1SdQuwi8PLUoQlUoSReV5MFh8', 77, 'http://127.0.0.1:8000/product/iphone-14-pro-max-1751340853', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', 59, '2025-07-07 16:11:30', '2025-07-07 16:12:29'),
(1740, 'n5xnoxXXeF6WdJS1SdQuwi8PLUoQlUoSReV5MFh8', 77, 'http://127.0.0.1:8000/checkout?variant_id=245&quantity=1&image=http%3A%2F%2F127.0.0.1%3A8000%2Fuploads%2Fproducts%2F1750314183_0_iphone-16-pro-max-16-titan-tu-nhien-thumbnew-650x650.png', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', 4, '2025-07-07 16:12:34', '2025-07-07 16:12:37'),
(1741, 'n5xnoxXXeF6WdJS1SdQuwi8PLUoQlUoSReV5MFh8', 77, 'http://127.0.0.1:8000/product/iphone-14-pro-max-1751340853', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', 102, '2025-07-07 16:12:40', '2025-07-07 16:14:21'),
(1742, 'n5xnoxXXeF6WdJS1SdQuwi8PLUoQlUoSReV5MFh8', 77, 'http://127.0.0.1:8000/', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', 23, '2025-07-07 16:14:22', '2025-07-07 16:14:44'),
(1743, 'n5xnoxXXeF6WdJS1SdQuwi8PLUoQlUoSReV5MFh8', 77, 'http://127.0.0.1:8000/product/iphone-15-pro-max-1750314062', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', 163, '2025-07-07 16:14:45', '2025-07-07 16:17:27'),
(1744, 'n5xnoxXXeF6WdJS1SdQuwi8PLUoQlUoSReV5MFh8', 77, 'http://127.0.0.1:8000/product/iphone-14-pro-max-1751340853', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', 16, '2025-07-07 16:17:28', '2025-07-07 16:17:44'),
(1745, 'n5xnoxXXeF6WdJS1SdQuwi8PLUoQlUoSReV5MFh8', 77, 'http://127.0.0.1:8000/cart', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', 499, '2025-07-07 16:17:45', '2025-07-07 16:26:03'),
(1746, 'n5xnoxXXeF6WdJS1SdQuwi8PLUoQlUoSReV5MFh8', 77, 'http://127.0.0.1:8000/order', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', 2, '2025-07-07 16:26:04', '2025-07-07 16:26:06'),
(1747, 'n5xnoxXXeF6WdJS1SdQuwi8PLUoQlUoSReV5MFh8', 77, 'http://127.0.0.1:8000/cart', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', 242, '2025-07-07 16:27:23', '2025-07-07 16:31:25'),
(1748, 'n5xnoxXXeF6WdJS1SdQuwi8PLUoQlUoSReV5MFh8', 77, 'http://127.0.0.1:8000/cart', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', 525, '2025-07-07 16:31:26', '2025-07-07 16:40:11'),
(1749, 'n5xnoxXXeF6WdJS1SdQuwi8PLUoQlUoSReV5MFh8', 77, 'http://127.0.0.1:8000/cart', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', 222, '2025-07-07 16:40:13', '2025-07-07 16:43:54'),
(1750, 'n5xnoxXXeF6WdJS1SdQuwi8PLUoQlUoSReV5MFh8', 77, 'http://127.0.0.1:8000/cart', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-07-07 16:43:57', '2025-07-07 16:43:57'),
(1751, 'E9VbaLXk61CGI6sHrydS9Xbc6tmnZO06qkZDllm0', NULL, 'http://127.0.0.1:8000/', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', 13, '2025-07-07 21:25:42', '2025-07-07 21:25:54'),
(1752, 'vFiORTiMmsP64Tu8L6NIICq6lS4xiNvkdVzxhc8K', 77, 'http://127.0.0.1:8000/', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', 6, '2025-07-07 21:26:03', '2025-07-07 21:26:09'),
(1753, 'vFiORTiMmsP64Tu8L6NIICq6lS4xiNvkdVzxhc8K', 77, 'http://127.0.0.1:8000/cart', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', 3950, '2025-07-07 21:26:09', '2025-07-07 22:31:59'),
(1754, 'BH97UNx7owFGQQSHivJ137EpHoqJtJy6i6UrG7Kw', NULL, 'http://127.0.0.1:8000/', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 188, '2025-07-07 21:33:12', '2025-07-07 21:36:20'),
(1755, 'BH97UNx7owFGQQSHivJ137EpHoqJtJy6i6UrG7Kw', NULL, 'http://127.0.0.1:8000/about', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 62, '2025-07-07 21:36:30', '2025-07-07 21:37:32'),
(1756, 'BH97UNx7owFGQQSHivJ137EpHoqJtJy6i6UrG7Kw', NULL, 'http://127.0.0.1:8000/contact', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', NULL, '2025-07-07 21:37:40', '2025-07-07 21:37:40'),
(1757, 'wfAA1FCkc1C0ktOw0tYfe1xgthEuB4yWiFBtuqha', 1, 'http://127.0.0.1:8000/chat', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', NULL, '2025-07-07 21:39:33', '2025-07-07 21:39:33'),
(1758, 'gsbAT0mKV9ee15behLTLw3ku2CJIPelwVnZbNeYe', NULL, 'http://127.0.0.1:8000/', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', NULL, '2025-07-07 21:41:31', '2025-07-07 21:41:31'),
(1759, 'kIoDbeBnvfEAFZWJoA5HcxyAYt6xtqRxu1KBRzfa', 71, 'http://127.0.0.1:8000/chat', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 227, '2025-07-07 21:43:40', '2025-07-07 21:47:26'),
(1760, 'kIoDbeBnvfEAFZWJoA5HcxyAYt6xtqRxu1KBRzfa', 71, 'http://127.0.0.1:8000/chat', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 1794, '2025-07-07 21:47:51', '2025-07-07 22:17:44'),
(1761, 'kIoDbeBnvfEAFZWJoA5HcxyAYt6xtqRxu1KBRzfa', 71, 'http://127.0.0.1:8000/chat#', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 3328, '2025-07-07 22:18:08', '2025-07-07 23:13:35'),
(1762, 'kIoDbeBnvfEAFZWJoA5HcxyAYt6xtqRxu1KBRzfa', 71, 'http://127.0.0.1:8000/chat', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', NULL, '2025-07-07 23:14:10', '2025-07-07 23:14:10'),
(1763, 'eu12sYY1xNH7y1Gn6Bgoq5mEbIRiDxzU9wiL96RR', 1, 'http://127.0.0.1:8000/chat', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', NULL, '2025-07-07 23:28:21', '2025-07-07 23:28:21'),
(1764, '9ZVSSMmjofuH4Yq7eKC1EmXewido2qHVg5iNI6w5', NULL, 'http://127.0.0.1:8000/', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', 30, '2025-07-09 05:32:49', '2025-07-09 05:33:18'),
(1765, '9ZVSSMmjofuH4Yq7eKC1EmXewido2qHVg5iNI6w5', NULL, 'http://127.0.0.1:8000/shop', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', 14, '2025-07-09 05:33:20', '2025-07-09 05:33:34'),
(1766, '9ZVSSMmjofuH4Yq7eKC1EmXewido2qHVg5iNI6w5', NULL, 'http://127.0.0.1:8000/about', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', 164, '2025-07-09 05:33:35', '2025-07-09 05:36:19'),
(1767, 'wfoPDPR7ZsfXdV3B7uGb8ThiwhtQtKpcXCQVVT3f', 1, 'http://127.0.0.1:8000/', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', 182, '2025-07-09 05:38:44', '2025-07-09 05:41:45'),
(1768, 'wfoPDPR7ZsfXdV3B7uGb8ThiwhtQtKpcXCQVVT3f', 1, 'http://127.0.0.1:8000/about', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', NULL, '2025-07-09 05:41:47', '2025-07-09 05:41:47');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `password_reset_tokens`
--

INSERT INTO `password_reset_tokens` (`id`, `email`, `token`, `created_at`) VALUES
(3, 'anh@gmail.com', 'twCHSilj0Onla0y4UHNeoLK8L5sUs5PIjmHWmychuhnflFTq7WOSkTE0D73m_1749048937_anh@gmail.com', '2025-06-04 21:55:37'),
(5, 'anhnnbph50226@gmail.com', 'TcU9qBsJd2B9DBCrzBrk6IQAiZSACesk0smAw4TewCDTXcXcPrrmWvAaJzfJ_1749219764_anhnnbph50226@gmail.com', '2025-06-06 21:22:44');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'view categories', 'web', '2025-05-15 12:40:56', '2025-05-15 12:40:56'),
(2, 'create categories', 'web', '2025-05-15 12:40:56', '2025-05-15 12:40:56'),
(3, 'edit categories', 'web', '2025-05-15 12:40:56', '2025-05-15 12:40:56'),
(4, 'delete categories', 'web', '2025-05-15 12:40:56', '2025-05-15 12:40:56'),
(5, 'view banners', 'web', '2025-05-15 12:40:56', '2025-05-15 12:40:56'),
(6, 'create banners', 'web', '2025-05-15 12:40:56', '2025-05-15 12:40:56'),
(7, 'edit banners', 'web', '2025-05-15 12:40:56', '2025-05-15 12:40:56'),
(8, 'delete banners', 'web', '2025-05-15 12:40:56', '2025-05-15 12:40:56'),
(9, 'view products', 'web', '2025-05-15 12:40:56', '2025-05-15 12:40:56'),
(10, 'create products', 'web', '2025-05-15 12:40:57', '2025-05-15 12:40:57'),
(11, 'edit products', 'web', '2025-05-15 12:40:57', '2025-05-15 12:40:57'),
(12, 'delete products', 'web', '2025-05-15 12:40:57', '2025-05-15 12:40:57'),
(13, 'view orders', 'web', '2025-05-15 12:40:57', '2025-05-15 12:40:57'),
(14, 'create orders', 'web', '2025-05-15 12:40:57', '2025-05-15 12:40:57'),
(15, 'edit orders', 'web', '2025-05-15 12:40:57', '2025-05-15 12:40:57'),
(16, 'delete orders', 'web', '2025-05-15 12:40:57', '2025-05-15 12:40:57'),
(17, 'view users', 'web', '2025-05-15 12:40:57', '2025-05-15 12:40:57'),
(18, 'create users', 'web', '2025-05-15 12:40:57', '2025-05-15 12:40:57'),
(19, 'edit users', 'web', '2025-05-15 12:40:57', '2025-05-15 12:40:57'),
(20, 'delete users', 'web', '2025-05-15 12:40:58', '2025-05-15 12:40:58'),
(21, 'view blogs', 'web', '2025-05-15 12:40:58', '2025-05-15 12:40:58'),
(22, 'create blogs', 'web', '2025-05-15 12:40:58', '2025-05-15 12:40:58'),
(23, 'edit blogs', 'web', '2025-05-15 12:40:58', '2025-05-15 12:40:58'),
(24, 'delete blogs', 'web', '2025-05-15 12:40:58', '2025-05-15 12:40:58'),
(25, 'view attributes', 'web', '2025-05-15 12:40:58', '2025-05-15 12:40:58'),
(26, 'create attributes', 'web', '2025-05-15 12:40:58', '2025-05-15 12:40:58'),
(27, 'edit attributes', 'web', '2025-05-15 12:40:58', '2025-05-15 12:40:58'),
(28, 'delete attributes', 'web', '2025-05-15 12:40:58', '2025-05-15 12:40:58'),
(29, 'view dashboard', 'web', '2025-05-15 12:40:58', '2025-05-15 12:40:58'),
(30, 'addrole', 'web', '2025-05-15 15:05:37', '2025-05-15 15:05:37'),
(31, 'view category specifications', 'web', '2025-05-23 14:48:10', '2025-05-23 14:48:10'),
(32, 'view category attributes', 'web', '2025-05-23 14:48:10', '2025-05-23 14:48:10'),
(33, 'view specifications', 'web', '2025-05-23 14:48:10', '2025-05-23 14:48:10'),
(34, 'trash specifications', 'web', '2025-05-23 14:48:10', '2025-05-23 14:48:10'),
(35, 'restore specifications', 'web', '2025-05-23 14:48:10', '2025-05-23 14:48:10'),
(36, 'delete specifications', 'web', '2025-05-23 14:48:10', '2025-05-23 14:48:10'),
(37, 'view vouchers', 'web', '2025-05-23 14:48:10', '2025-05-23 14:48:10');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `content` longtext COLLATE utf8mb4_unicode_ci,
  `category_id` bigint(20) UNSIGNED NOT NULL,
  `warranty_months` int(11) NOT NULL DEFAULT '12',
  `is_featured` tinyint(1) NOT NULL DEFAULT '0',
  `status` enum('active','inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `views` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `products`
--

INSERT INTO `products` (`id`, `name`, `slug`, `description`, `content`, `category_id`, `warranty_months`, `is_featured`, `status`, `views`, `created_at`, `updated_at`, `deleted_at`) VALUES
(152, 'iPhone 15 Pro Max test 2', 'iphone-15-pro-max-test-2-1750839360', 'aaaaaa', '<p>aaaaaa</p>', 25, 12, 0, 'active', 96, '2025-06-17 13:23:02', '2025-07-07 16:00:01', NULL),
(153, 'AirPods Pro (2nd Gen) USB-C', 'airpods-pro-2nd-gen-usb-c-1750313767', NULL, NULL, 28, 12, 0, 'active', 25, '2025-06-19 13:16:07', '2025-07-03 22:17:14', NULL),
(154, 'iPhone 15 Pro Max', 'iphone-15-pro-max-1750314062', NULL, NULL, 25, 12, 0, 'active', 21, '2025-06-19 13:21:02', '2025-07-07 16:17:13', NULL),
(155, 'iPhone 14 Pro Max', 'iphone-14-pro-max-1751340853', NULL, '<p><br />\r\n<a href=\"https://www.topzone.vn/iphone/iphone-16-pro-max\"><img alt=\"iPhone 16 Pro Max 256GB - Tổng Quan\" src=\"https://cdnv2.tgdd.vn/mwg-static//42/329149/s16/iphone-16-pro-max-1-638639951743327419.jpg\" /><img alt=\"iPhone 16 Pro Max 256GB - Thông Số Kỹ Thuật\" src=\"https://cdnv2.tgdd.vn/mwg-static//42/329149/s16/iphone-16-pro-max-2-638639951747532645.jpg\" /><img alt=\"iPhone 16 Pro Max 256GB - AI và Pin\" src=\"https://cdnv2.tgdd.vn/mwg-static//42/329149/s16/iphone-16-pro-max-3-638639951752059509.jpg\" /><img alt=\"iPhone 16 Pro Max 256GB - So Sánh\" src=\"https://cdnv2.tgdd.vn/mwg-static//42/329149/s16/iphone-16-pro-max-4-638639951758845822.jpg\" /></a></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>Nội dung quảng c&aacute;o</strong></p>\r\n\r\n<p>iPhone 16 Pro Max. Sở hữu thiết kế titan tuyệt đẹp. Điều Khiển Camera. 4K Dolby Vision tốc độ 120 fps. V&agrave; chip A18 Pro.</p>', 25, 12, 0, 'active', 116, '2025-06-19 13:23:02', '2025-07-07 16:17:26', NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `product_reviews`
--

CREATE TABLE `product_reviews` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `variant_id` bigint(20) UNSIGNED DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `rating` int(11) DEFAULT NULL,
  `review` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `images` json DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `product_reviews`
--

INSERT INTO `product_reviews` (`id`, `product_id`, `variant_id`, `user_id`, `order_id`, `rating`, `review`, `created_at`, `deleted_at`, `images`) VALUES
(1, 155, 245, 43, 102, 1, 'tệ', '2025-06-30 13:56:57', NULL, '[\"reviews/HabTHlfRAhPFr9LLkgqWuNEDGrrKsmE2165cFBsa.jpg\", \"reviews/2irdkWcPNoPoWrorFHSZKURzWRh8YuVOyi7lvz7A.jpg\"]'),
(2, 155, 245, 43, 101, 5, 'ok', '2025-06-30 13:59:30', NULL, '[\"reviews/7dMO4e9MglmTtBpqFCuqp81vYPajG3lwEIECuFkp.jpg\", \"reviews/BnekkRSA5Ygr1fiPrLXQgONv7Jok6ayV9IBCePfM.jpg\", \"reviews/GNU3nIeyIXGpX5bmsJ2NovbBn84hj0c3A2yNiugt.jpg\", \"reviews/MnL2FuQKVICBJET1CdaLFbVOkS7dG7p7vGpowur0.jpg\"]'),
(3, 155, 245, 43, 103, 1, 'ok', '2025-06-30 14:10:45', NULL, '[\"reviews/Uen4nE7ucpqTwyvgrzS28XpfPlVqzjzcRMJqax4u.jpg\", \"reviews/aS8qKCccgLJIqLr7KgEhlnel9pzchW4sMxU1eHQn.jpg\", \"reviews/o0ROv5vxrY9c4e8NB7rHwQIjAxkDnN9fCvj7CvSW.jpg\"]');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `product_specifications`
--

CREATE TABLE `product_specifications` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `specification_id` bigint(20) UNSIGNED NOT NULL,
  `value` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `product_specifications`
--

INSERT INTO `product_specifications` (`id`, `product_id`, `specification_id`, `value`, `created_at`, `updated_at`, `deleted_at`) VALUES
(294, 152, 14, 'aaaaaa', '2025-06-17 16:06:04', '2025-06-18 14:28:57', '2025-06-18 14:28:57'),
(295, 152, 15, 'aaaaaa', '2025-06-17 16:06:04', '2025-06-17 16:06:48', '2025-06-17 16:06:48'),
(296, 152, 16, 'aaaaaa', '2025-06-17 16:06:04', '2025-06-17 16:06:48', '2025-06-17 16:06:48'),
(297, 152, 17, 'aaaaaa', '2025-06-17 16:06:04', '2025-06-17 16:06:48', '2025-06-17 16:06:48'),
(298, 152, 18, 'aaaaaa', '2025-06-17 16:06:04', '2025-06-17 16:06:48', '2025-06-17 16:06:48'),
(299, 152, 19, 'aaaaaa', '2025-06-17 16:06:04', '2025-06-17 16:06:48', '2025-06-17 16:06:48'),
(300, 152, 20, 'aaaaaa', '2025-06-17 16:06:04', '2025-06-17 16:06:48', '2025-06-17 16:06:48'),
(301, 152, 21, 'aaaaaa', '2025-06-17 16:06:04', '2025-06-17 16:06:48', '2025-06-17 16:06:48'),
(302, 152, 14, 'aaaaaa', '2025-06-17 16:06:48', '2025-06-17 16:16:16', '2025-06-17 16:16:16'),
(303, 152, 15, 'aaaaaa', '2025-06-17 16:06:48', '2025-06-17 16:16:16', '2025-06-17 16:16:16'),
(304, 152, 16, 'aaaaaa', '2025-06-17 16:06:48', '2025-06-17 16:16:16', '2025-06-17 16:16:16'),
(305, 152, 17, 'aaaaaa', '2025-06-17 16:06:48', '2025-06-17 16:16:16', '2025-06-17 16:16:16'),
(306, 152, 18, 'aaaaaa', '2025-06-17 16:06:48', '2025-06-17 16:16:16', '2025-06-17 16:16:16'),
(307, 152, 19, 'aaaaaa', '2025-06-17 16:06:48', '2025-06-17 16:16:16', '2025-06-17 16:16:16'),
(308, 152, 20, 'aaaaaa', '2025-06-17 16:06:48', '2025-06-17 16:16:16', '2025-06-17 16:16:16'),
(309, 152, 21, 'aaaaaa', '2025-06-17 16:06:48', '2025-06-17 16:16:16', '2025-06-17 16:16:16'),
(310, 152, 14, 'aaaaaa', '2025-06-17 16:16:16', '2025-06-17 16:18:06', '2025-06-17 16:18:06'),
(311, 152, 15, 'aaaaaa', '2025-06-17 16:16:16', '2025-06-17 16:18:06', '2025-06-17 16:18:06'),
(312, 152, 16, 'aaaaaa', '2025-06-17 16:16:16', '2025-06-17 16:18:06', '2025-06-17 16:18:06'),
(313, 152, 17, 'aaaaaa', '2025-06-17 16:16:16', '2025-06-17 16:18:06', '2025-06-17 16:18:06'),
(314, 152, 18, 'aaaaaa', '2025-06-17 16:16:16', '2025-06-17 16:18:06', '2025-06-17 16:18:06'),
(315, 152, 19, 'aaaaaa', '2025-06-17 16:16:16', '2025-06-17 16:18:06', '2025-06-17 16:18:06'),
(316, 152, 20, 'aaaaaa', '2025-06-17 16:16:16', '2025-06-17 16:18:06', '2025-06-17 16:18:06'),
(317, 152, 21, 'aaaaaa', '2025-06-17 16:16:16', '2025-06-17 16:18:06', '2025-06-17 16:18:06'),
(318, 152, 14, 'aaaaaa', '2025-06-17 16:18:06', '2025-06-17 16:19:53', '2025-06-17 16:19:53'),
(319, 152, 15, 'aaaaaa', '2025-06-17 16:18:06', '2025-06-17 16:19:53', '2025-06-17 16:19:53'),
(320, 152, 16, 'aaaaaa', '2025-06-17 16:18:07', '2025-06-17 16:19:53', '2025-06-17 16:19:53'),
(321, 152, 17, 'aaaaaa', '2025-06-17 16:18:07', '2025-06-17 16:19:53', '2025-06-17 16:19:53'),
(322, 152, 18, 'aaaaaa', '2025-06-17 16:18:07', '2025-06-17 16:19:53', '2025-06-17 16:19:53'),
(323, 152, 19, 'aaaaaa', '2025-06-17 16:18:07', '2025-06-17 16:19:53', '2025-06-17 16:19:53'),
(324, 152, 20, 'aaaaaa', '2025-06-17 16:18:07', '2025-06-17 16:19:53', '2025-06-17 16:19:53'),
(325, 152, 21, 'aaaaaa', '2025-06-17 16:18:07', '2025-06-17 16:19:53', '2025-06-17 16:19:53'),
(326, 152, 14, 'aaaaaa', '2025-06-17 16:19:53', '2025-06-17 16:22:10', '2025-06-17 16:22:10'),
(327, 152, 15, 'aaaaaa', '2025-06-17 16:19:53', '2025-06-17 16:22:10', '2025-06-17 16:22:10'),
(328, 152, 16, 'aaaaaa', '2025-06-17 16:19:53', '2025-06-17 16:22:10', '2025-06-17 16:22:10'),
(329, 152, 17, 'aaaaaa', '2025-06-17 16:19:53', '2025-06-17 16:22:10', '2025-06-17 16:22:10'),
(330, 152, 18, 'aaaaaa', '2025-06-17 16:19:53', '2025-06-17 16:22:10', '2025-06-17 16:22:10'),
(331, 152, 19, 'aaaaaa', '2025-06-17 16:19:53', '2025-06-17 16:22:10', '2025-06-17 16:22:10'),
(332, 152, 20, 'aaaaaa', '2025-06-17 16:19:53', '2025-06-17 16:22:10', '2025-06-17 16:22:10'),
(333, 152, 21, 'aaaaaa', '2025-06-17 16:19:53', '2025-06-17 16:22:10', '2025-06-17 16:22:10'),
(334, 152, 14, 'aaaaaa', '2025-06-17 16:22:10', '2025-06-18 14:28:57', '2025-06-18 14:28:57'),
(335, 152, 15, 'aaaaaa', '2025-06-17 16:22:10', '2025-06-18 14:28:57', '2025-06-18 14:28:57'),
(336, 152, 16, 'aaaaaa', '2025-06-17 16:22:10', '2025-06-18 14:28:57', '2025-06-18 14:28:57'),
(337, 152, 17, 'aaaaaa', '2025-06-17 16:22:10', '2025-06-18 14:28:57', '2025-06-18 14:28:57'),
(338, 152, 18, 'aaaaaa', '2025-06-17 16:22:10', '2025-06-18 14:28:57', '2025-06-18 14:28:57'),
(339, 152, 19, 'aaaaaa', '2025-06-17 16:22:10', '2025-06-18 14:28:57', '2025-06-18 14:28:57'),
(340, 152, 20, 'aaaaaa', '2025-06-17 16:22:10', '2025-06-18 14:28:57', '2025-06-18 14:28:57'),
(341, 152, 21, 'aaaaaa', '2025-06-17 16:22:10', '2025-06-18 14:28:57', '2025-06-18 14:28:57'),
(342, 152, 14, 'aaaaaa', '2025-06-18 14:28:58', '2025-06-18 14:39:48', '2025-06-18 14:39:48'),
(343, 152, 15, 'aaaaaa', '2025-06-18 14:28:58', '2025-06-18 14:39:48', '2025-06-18 14:39:48'),
(344, 152, 16, 'aaaaaa', '2025-06-18 14:28:58', '2025-06-18 14:39:48', '2025-06-18 14:39:48'),
(345, 152, 17, 'aaaaaa', '2025-06-18 14:28:58', '2025-06-18 14:39:48', '2025-06-18 14:39:48'),
(346, 152, 18, 'aaaaaa', '2025-06-18 14:28:58', '2025-06-18 14:39:48', '2025-06-18 14:39:48'),
(347, 152, 21, 'aaaaaa', '2025-06-18 14:28:58', '2025-06-18 14:39:48', '2025-06-18 14:39:48'),
(348, 152, 14, 'aaaaaa', '2025-06-18 14:39:48', '2025-06-21 10:13:11', '2025-06-21 10:13:11'),
(349, 152, 15, 'aaaaaa', '2025-06-18 14:39:48', '2025-06-21 10:13:11', '2025-06-21 10:13:11'),
(350, 152, 16, 'aaaaaa', '2025-06-18 14:39:48', '2025-06-21 10:13:11', '2025-06-21 10:13:11'),
(351, 152, 17, 'aaaaaa', '2025-06-18 14:39:48', '2025-06-21 10:13:11', '2025-06-21 10:13:11'),
(352, 152, 18, 'aaaaaa', '2025-06-18 14:39:48', '2025-06-21 10:13:11', '2025-06-21 10:13:11'),
(353, 152, 21, 'aaaaaa', '2025-06-18 14:39:48', '2025-06-21 10:13:11', '2025-06-21 10:13:11'),
(354, 153, 14, 'IOaaaa', '2025-06-19 13:16:07', '2025-06-19 13:16:07', NULL),
(355, 153, 15, 'aaaaaaaaa', '2025-06-19 13:16:07', '2025-06-19 13:16:07', NULL),
(356, 153, 16, 'aaa', '2025-06-19 13:16:07', '2025-06-19 13:16:07', NULL),
(357, 153, 17, 'aaaaa', '2025-06-19 13:16:07', '2025-06-19 13:16:07', NULL),
(358, 153, 18, 'aaaa', '2025-06-19 13:16:07', '2025-06-19 13:16:07', NULL),
(359, 153, 21, 'aaaaa', '2025-06-19 13:16:08', '2025-06-19 13:16:08', NULL),
(360, 154, 14, 'iOS 17', '2025-06-19 13:21:02', '2025-06-19 13:21:02', NULL),
(361, 154, 15, 'Apple A17 Pro Bionic 6 nhân', '2025-06-19 13:21:02', '2025-06-19 13:21:02', NULL),
(362, 154, 16, '3.78 GHz', '2025-06-19 13:21:03', '2025-06-19 13:21:03', NULL),
(363, 154, 17, 'Apple GPU 6 nhân', '2025-06-19 13:21:03', '2025-06-19 13:21:03', NULL),
(364, 154, 18, '8 GB', '2025-06-19 13:21:03', '2025-06-19 13:21:03', NULL),
(365, 154, 21, 'Không giới hạn', '2025-06-19 13:21:03', '2025-06-19 13:21:03', NULL),
(366, 155, 14, 'iOS 17', '2025-06-19 13:23:02', '2025-07-01 10:34:13', '2025-07-01 10:34:13'),
(367, 155, 15, 'Apple A15 Bionic 6 nhân', '2025-06-19 13:23:02', '2025-07-01 10:34:13', '2025-07-01 10:34:13'),
(368, 155, 16, '3.22 GHz', '2025-06-19 13:23:02', '2025-07-01 10:34:13', '2025-07-01 10:34:13'),
(369, 155, 17, 'Apple GPU 5 nhân', '2025-06-19 13:23:02', '2025-07-01 10:34:13', '2025-07-01 10:34:13'),
(370, 155, 18, '6 GB', '2025-06-19 13:23:02', '2025-07-01 10:34:13', '2025-07-01 10:34:13'),
(371, 155, 21, 'Không giới hạn', '2025-06-19 13:23:02', '2025-07-01 10:34:13', '2025-07-01 10:34:13'),
(372, 152, 14, 'aaaaaa', '2025-06-21 10:13:11', '2025-06-21 22:00:34', '2025-06-21 22:00:34'),
(373, 152, 15, 'aaaaaa', '2025-06-21 10:13:11', '2025-06-21 22:00:34', '2025-06-21 22:00:34'),
(374, 152, 16, 'aaaaaa', '2025-06-21 10:13:11', '2025-06-21 22:00:34', '2025-06-21 22:00:34'),
(375, 152, 17, 'aaaaaa', '2025-06-21 10:13:11', '2025-06-21 22:00:34', '2025-06-21 22:00:34'),
(376, 152, 18, 'aaaaaa', '2025-06-21 10:13:11', '2025-06-21 22:00:34', '2025-06-21 22:00:34'),
(377, 152, 21, 'aaaaaa', '2025-06-21 10:13:11', '2025-06-21 22:00:34', '2025-06-21 22:00:34'),
(378, 152, 14, 'aaaaaa', '2025-06-21 22:00:34', '2025-06-23 14:09:43', '2025-06-23 14:09:43'),
(379, 152, 15, 'aaaaaa', '2025-06-21 22:00:34', '2025-06-23 14:09:43', '2025-06-23 14:09:43'),
(380, 152, 16, 'aaaaaa', '2025-06-21 22:00:34', '2025-06-23 14:09:43', '2025-06-23 14:09:43'),
(381, 152, 17, 'aaaaaa', '2025-06-21 22:00:34', '2025-06-23 14:09:43', '2025-06-23 14:09:43'),
(382, 152, 18, 'aaaaaa', '2025-06-21 22:00:34', '2025-06-23 14:09:43', '2025-06-23 14:09:43'),
(383, 152, 21, 'aaaaaa', '2025-06-21 22:00:34', '2025-06-23 14:09:43', '2025-06-23 14:09:43'),
(384, 152, 14, 'aaaaaa', '2025-06-23 14:09:43', '2025-06-25 15:16:00', '2025-06-25 15:16:00'),
(385, 152, 15, 'aaaaaa', '2025-06-23 14:09:44', '2025-06-25 15:16:00', '2025-06-25 15:16:00'),
(386, 152, 16, 'aaaaaa', '2025-06-23 14:09:44', '2025-06-25 15:16:00', '2025-06-25 15:16:00'),
(387, 152, 17, 'aaaaaa', '2025-06-23 14:09:44', '2025-06-25 15:16:00', '2025-06-25 15:16:00'),
(388, 152, 18, 'aaaaaa', '2025-06-23 14:09:44', '2025-06-25 15:16:00', '2025-06-25 15:16:00'),
(389, 152, 21, 'aaaaaa', '2025-06-23 14:09:44', '2025-06-25 15:16:00', '2025-06-25 15:16:00'),
(390, 152, 14, 'aaaaaa', '2025-06-25 15:16:00', '2025-06-25 15:16:00', NULL),
(391, 152, 15, 'aaaaaa', '2025-06-25 15:16:00', '2025-06-25 15:16:00', NULL),
(392, 152, 16, 'aaaaaa', '2025-06-25 15:16:00', '2025-06-25 15:16:00', NULL),
(393, 152, 17, 'aaaaaa', '2025-06-25 15:16:00', '2025-06-25 15:16:00', NULL),
(394, 152, 18, 'aaaaaa', '2025-06-25 15:16:00', '2025-06-25 15:16:00', NULL),
(395, 152, 21, 'aaaaaa', '2025-06-25 15:16:00', '2025-06-25 15:16:00', NULL),
(408, 155, 14, 'iOS 17', '2025-07-01 10:34:13', '2025-07-01 10:34:13', NULL),
(409, 155, 15, 'Apple A15 Bionic 6 nhân', '2025-07-01 10:34:13', '2025-07-01 10:34:13', NULL),
(410, 155, 16, '3.22 GHz', '2025-07-01 10:34:13', '2025-07-01 10:34:13', NULL),
(411, 155, 17, 'Apple GPU 5 nhân', '2025-07-01 10:34:13', '2025-07-01 10:34:13', NULL),
(412, 155, 18, '6 GB', '2025-07-01 10:34:13', '2025-07-01 10:34:13', NULL),
(413, 155, 21, 'Không giới hạn', '2025-07-01 10:34:14', '2025-07-01 10:34:14', NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `product_variants`
--

CREATE TABLE `product_variants` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `sku` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `discount_price` decimal(15,0) DEFAULT NULL,
  `stock` int(11) NOT NULL DEFAULT '0',
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `is_default` tinyint(1) NOT NULL DEFAULT '0' COMMENT '1: Default variant, 0: Not default',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `images` json DEFAULT NULL COMMENT 'Mảng JSON chứa các đường dẫn ảnh của biến thể',
  `purchase_price` decimal(15,0) NOT NULL DEFAULT '0' COMMENT 'Giá nhập',
  `selling_price` decimal(15,0) NOT NULL DEFAULT '0' COMMENT 'Giá bán'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `product_variants`
--

INSERT INTO `product_variants` (`id`, `product_id`, `sku`, `name`, `slug`, `discount_price`, `stock`, `status`, `is_default`, `created_at`, `updated_at`, `deleted_at`, `images`, `purchase_price`, `selling_price`) VALUES
(239, 152, 'SP-68348', 'iPhone 15 Pro Max test 2 - 1TB', 'iphone-15-pro-max-test-2-1tb', NULL, 3, 'active', 1, '2025-06-17 13:23:02', '2025-06-23 14:09:44', '2025-06-23 14:09:44', '\"[\\\"uploads\\\\/products\\\\/1750141382_0_macbook-air-13-inch-m4-12-638772027208679591-650x650.jpg\\\",\\\"uploads\\\\/products\\\\/1750141382_0_macbook-air-13-inch-m4-13-638772027216304066-650x650.jpg\\\",\\\"uploads\\\\/products\\\\/1750141382_0_macbook-air-13-inch-m4-14-638772027222384420-650x650.jpg\\\",\\\"uploads\\\\/products\\\\/1750141382_0_macbook-air-13-inch-m4-15-638772027228926275-650x650.jpg\\\",\\\"uploads\\\\/products\\\\/1750141382_0_macbook-air-13-inch-m4-16-638772027238166613-650x650.jpg\\\",\\\"uploads\\\\/products\\\\/1750141382_0_macbook-air-13-inch-m4-18-638772027245004354-650x650.jpg\\\",\\\"uploads\\\\/products\\\\/1750141382_0_macbook-air-13-inch-m4-19-638772027251967937-650x650.jpg\\\",\\\"uploads\\\\/products\\\\/1750141382_0_macbook-air-13-inch-m4-20-638772027259250283-650x650.jpg\\\",\\\"uploads\\\\/products\\\\/1750141382_0_macbook-air-13-inch-m4-21-638772027266138378-650x650.jpg\\\",\\\"uploads\\\\/products\\\\/1750141382_0_macbook-air-13-inch-m4-22-638772027273564585-650x650.jpg\\\",\\\"uploads\\\\/products\\\\/1750141382_0_macbook-air-13-inch-m4-thumb-xanh-da-troi-650x650.png\\\",\\\"uploads\\\\/products\\\\/1750151208_0_macbook-air-13-inch-m4-thumb-xanh-da-troi-650x650.png\\\"]\"', 333, 55125),
(240, 152, 'SP-66578', 'iPhone 15 Pro Max test 2 - Titan đen - 1TB', 'iphone-15-pro-max-test-2-titan-den-1tb', NULL, 222, 'active', 0, '2025-06-17 13:23:02', '2025-06-23 14:09:44', '2025-06-23 14:09:44', '\"[\\\"uploads\\\\/products\\\\/1750141382_1_macbook-air-13-inch-m4-12-638772027208679591-650x650.jpg\\\",\\\"uploads\\\\/products\\\\/1750152130_1_macbook-air-13-inch-m4-13-638772027216304066-650x650.jpg\\\",\\\"uploads\\\\/products\\\\/1750152130_1_macbook-air-13-inch-m4-14-638772027222384420-650x650.jpg\\\",\\\"uploads\\\\/products\\\\/1750152130_1_macbook-air-13-inch-m4-15-638772027228926275-650x650.jpg\\\",\\\"uploads\\\\/products\\\\/1750152130_1_macbook-air-13-inch-m4-16-638772027238166613-650x650.jpg\\\",\\\"uploads\\\\/products\\\\/1750152130_1_macbook-air-13-inch-m4-18-638772027245004354-650x650.jpg\\\",\\\"uploads\\\\/products\\\\/1750152130_1_macbook-air-13-inch-m4-19-638772027251967937-650x650.jpg\\\",\\\"uploads\\\\/products\\\\/1750152130_1_macbook-air-13-inch-m4-20-638772027259250283-650x650.jpg\\\",\\\"uploads\\\\/products\\\\/1750152130_1_macbook-air-13-inch-m4-21-638772027266138378-650x650.jpg\\\",\\\"uploads\\\\/products\\\\/1750152130_1_macbook-air-13-inch-m4-22-638772027273564585-650x650.jpg\\\"]\"', 333, 444),
(243, 153, 'SP-17661', 'AirPods Pro (2nd Gen) USB-C - Titan đen', 'airpods-pro-2nd-gen-usb-c-titan-den-1750313768-0', NULL, 2, 'active', 1, '2025-06-19 13:16:08', '2025-06-30 21:04:01', NULL, '\"[\\\"uploads\\\\/products\\\\/1750313768_0_Danh m\\\\u1ee5c tai nghe, loa.png\\\"]\"', 111, 1222111),
(244, 154, 'SP-62058', 'iPhone 15 Pro Max - Titan trắng - 256GB', 'iphone-15-pro-max-titan-trang-256gb-1750314063-0', NULL, 4, 'active', 1, '2025-06-19 13:21:03', '2025-06-23 10:07:30', NULL, '\"[\\\"uploads\\\\/products\\\\/1750314063_0_iphone-16-pro-max-titan-trang-thumb-650x650.png\\\",\\\"uploads\\\\/products\\\\/1750314063_0_iphone-16-pro-max-white-titan-1-638621796200037842-650x650.jpg\\\",\\\"uploads\\\\/products\\\\/1750314063_0_iphone-16-pro-max-white-titan-2-638621796206835851-650x650.jpg\\\",\\\"uploads\\\\/products\\\\/1750314063_0_iphone-16-pro-max-white-titan-3-638621796214529645-650x650.jpg\\\",\\\"uploads\\\\/products\\\\/1750314063_0_iphone-16-pro-max-white-titan-4-638621796221313391-650x650.jpg\\\",\\\"uploads\\\\/products\\\\/1750314063_0_iphone-16-pro-max-white-titan-5-638621796229996324-650x650.jpg\\\",\\\"uploads\\\\/products\\\\/1750314063_0_iphone-16-pro-max-white-titan-6-638621796236451102-650x650.jpg\\\",\\\"uploads\\\\/products\\\\/1750314063_0_iphone-16-pro-max-white-titan-7-638621796244285270-650x650.jpg\\\",\\\"uploads\\\\/products\\\\/1750314063_0_iphone-16-pro-max-white-titan-8-638621796251114174-650x650.jpg\\\",\\\"uploads\\\\/products\\\\/1750314063_0_iphone-16-pro-max-white-titan-9-638621796259552967-650x650.jpg\\\",\\\"uploads\\\\/products\\\\/1750314063_0_iphone-16-pro-max-white-titan-10-638621796266688217-650x650.jpg\\\"]\"', 222, 333),
(245, 155, 'SP-47209', 'iPhone 14 Pro Max - Titan tự nhiên - 512GB', 'iphone-14-pro-max-titan-tu-nhien-512gb-1750314183-0', NULL, 217, 'active', 1, '2025-06-19 13:23:03', '2025-06-30 21:04:01', NULL, '\"[\\\"uploads\\\\/products\\\\/1750314183_0_iphone-16-pro-max-16-titan-tu-nhien-thumbnew-650x650.png\\\",\\\"uploads\\\\/products\\\\/1750314183_0_iphone-16-pro-max-natural-titan-1-638621796879976392-650x650.jpg\\\",\\\"uploads\\\\/products\\\\/1750314183_0_iphone-16-pro-max-natural-titan-2-638621796887193177-650x650.jpg\\\",\\\"uploads\\\\/products\\\\/1750314183_0_iphone-16-pro-max-natural-titan-3-638621796896942566-650x650.jpg\\\",\\\"uploads\\\\/products\\\\/1750314183_0_iphone-16-pro-max-natural-titan-4-638621796904877336-650x650.jpg\\\",\\\"uploads\\\\/products\\\\/1750314183_0_iphone-16-pro-max-natural-titan-5-638621796913722191-650x650.jpg\\\",\\\"uploads\\\\/products\\\\/1750314183_0_iphone-16-pro-max-natural-titan-6-638621796921000093-650x650.jpg\\\",\\\"uploads\\\\/products\\\\/1750314183_0_iphone-16-pro-max-natural-titan-7-638621796927764642-650x650.jpg\\\",\\\"uploads\\\\/products\\\\/1750314183_0_iphone-16-pro-max-natural-titan-8-638621796937887668-650x650.jpg\\\",\\\"uploads\\\\/products\\\\/1750314183_0_iphone-16-pro-max-natural-titan-9-638621796945020418-650x650.jpg\\\",\\\"uploads\\\\/products\\\\/1750314183_0_iphone-16-pro-max-natural-titan-10-638621796955273943-650x650.jpg\\\"]\"', 222, 222),
(246, 152, 'SP-24093', 'iPhone 15 Pro Max test 2 - Titan Sa Mạc', 'iphone-15-pro-max-test-2-titan-sa-mac', NULL, 222, 'active', 1, '2025-06-23 14:09:44', '2025-06-25 15:16:00', '2025-06-25 15:16:00', '\"[\\\"uploads\\\\/products\\\\/1750662584_0_macbook-air-13-inch-m4-12-638772027208679591-650x650.jpg\\\",\\\"uploads\\\\/products\\\\/1750662584_0_macbook-air-13-inch-m4-13-638772027216304066-650x650.jpg\\\",\\\"uploads\\\\/products\\\\/1750662584_0_macbook-air-13-inch-m4-14-638772027222384420-650x650.jpg\\\",\\\"uploads\\\\/products\\\\/1750662584_0_macbook-air-13-inch-m4-15-638772027228926275-650x650.jpg\\\",\\\"uploads\\\\/products\\\\/1750662584_0_macbook-air-13-inch-m4-16-638772027238166613-650x650.jpg\\\",\\\"uploads\\\\/products\\\\/1750662584_0_macbook-air-13-inch-m4-18-638772027245004354-650x650.jpg\\\",\\\"uploads\\\\/products\\\\/1750662584_0_macbook-air-13-inch-m4-19-638772027251967937-650x650.jpg\\\",\\\"uploads\\\\/products\\\\/1750662584_0_macbook-air-13-inch-m4-20-638772027259250283-650x650.jpg\\\",\\\"uploads\\\\/products\\\\/1750662584_0_macbook-air-13-inch-m4-21-638772027266138378-650x650.jpg\\\",\\\"uploads\\\\/products\\\\/1750662584_0_macbook-air-13-inch-m4-22-638772027273564585-650x650.jpg\\\",\\\"uploads\\\\/products\\\\/1750662584_0_macbook-air-13-inch-m4-thumb-xanh-da-troi-650x650.png\\\"]\"', 333, 333),
(247, 152, 'SP-56841', 'iPhone 15 Pro Max test 2 - Titan đen', 'iphone-15-pro-max-test-2-titan-den', NULL, 444, 'active', 0, '2025-06-23 14:09:44', '2025-06-25 15:16:00', '2025-06-25 15:16:00', '\"[\\\"uploads\\\\/products\\\\/1750662584_1_macbook-air-13-inch-m4-12-638772027208679591-650x650.jpg\\\",\\\"uploads\\\\/products\\\\/1750662584_1_macbook-air-13-inch-m4-13-638772027216304066-650x650.jpg\\\",\\\"uploads\\\\/products\\\\/1750662584_1_macbook-air-13-inch-m4-14-638772027222384420-650x650.jpg\\\",\\\"uploads\\\\/products\\\\/1750662584_1_macbook-air-13-inch-m4-15-638772027228926275-650x650.jpg\\\",\\\"uploads\\\\/products\\\\/1750662584_1_macbook-air-13-inch-m4-16-638772027238166613-650x650.jpg\\\",\\\"uploads\\\\/products\\\\/1750662584_1_macbook-air-13-inch-m4-18-638772027245004354-650x650.jpg\\\",\\\"uploads\\\\/products\\\\/1750662584_1_macbook-air-13-inch-m4-19-638772027251967937-650x650.jpg\\\",\\\"uploads\\\\/products\\\\/1750662584_1_macbook-air-13-inch-m4-20-638772027259250283-650x650.jpg\\\",\\\"uploads\\\\/products\\\\/1750662584_1_macbook-air-13-inch-m4-21-638772027266138378-650x650.jpg\\\",\\\"uploads\\\\/products\\\\/1750662584_1_macbook-air-13-inch-m4-22-638772027273564585-650x650.jpg\\\",\\\"uploads\\\\/products\\\\/1750662584_1_macbook-air-13-inch-m4-thumb-xanh-da-troi-650x650.png\\\"]\"', 444, 444),
(248, 152, 'SP-28347', 'iPhone 15 Pro Max test 2 - Titan trắng', 'iphone-15-pro-max-test-2-titan-trang', NULL, 221, 'active', 1, '2025-06-25 15:16:00', '2025-07-01 15:56:30', NULL, '\"[\\\"uploads\\\\/products\\\\/1750839360_0_iphone-16-pro-max-16-titan-tu-nhien-thumbnew-650x650.png\\\",\\\"uploads\\\\/products\\\\/1750839360_0_iphone-16-pro-max-natural-titan-1-638621796879976392-650x650.jpg\\\",\\\"uploads\\\\/products\\\\/1750839360_0_iphone-16-pro-max-natural-titan-2-638621796887193177-650x650.jpg\\\",\\\"uploads\\\\/products\\\\/1750839360_0_iphone-16-pro-max-natural-titan-3-638621796896942566-650x650.jpg\\\",\\\"uploads\\\\/products\\\\/1750839360_0_iphone-16-pro-max-natural-titan-4-638621796904877336-650x650.jpg\\\",\\\"uploads\\\\/products\\\\/1750839360_0_iphone-16-pro-max-natural-titan-5-638621796913722191-650x650.jpg\\\",\\\"uploads\\\\/products\\\\/1750839360_0_iphone-16-pro-max-natural-titan-6-638621796921000093-650x650.jpg\\\",\\\"uploads\\\\/products\\\\/1750839360_0_iphone-16-pro-max-natural-titan-7-638621796927764642-650x650.jpg\\\",\\\"uploads\\\\/products\\\\/1750839360_0_iphone-16-pro-max-natural-titan-8-638621796937887668-650x650.jpg\\\",\\\"uploads\\\\/products\\\\/1750839360_0_iphone-16-pro-max-natural-titan-9-638621796945020418-650x650.jpg\\\",\\\"uploads\\\\/products\\\\/1750839360_0_iphone-16-pro-max-natural-titan-10-638621796955273943-650x650.jpg\\\"]\"', 333, 7890);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `product_views`
--

CREATE TABLE `product_views` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `viewed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `product_views`
--

INSERT INTO `product_views` (`id`, `user_id`, `product_id`, `viewed_at`) VALUES
(218, 43, 152, '2025-06-17 10:23:55'),
(219, 43, 152, '2025-06-17 15:15:03'),
(220, 43, 152, '2025-06-17 15:16:07'),
(221, 43, 152, '2025-06-17 15:16:30'),
(222, 43, 152, '2025-06-17 15:20:57'),
(223, 43, 152, '2025-06-17 15:40:41'),
(224, 43, 152, '2025-06-17 15:41:07'),
(225, 43, 152, '2025-06-17 15:44:46'),
(226, NULL, 152, '2025-06-17 17:15:06'),
(227, NULL, 152, '2025-06-18 06:58:58'),
(228, 1, 152, '2025-06-18 07:09:21'),
(229, 1, 152, '2025-06-18 07:09:32'),
(230, 1, 152, '2025-06-18 07:09:38'),
(231, 1, 152, '2025-06-18 07:09:44'),
(232, 1, 152, '2025-06-18 07:12:18'),
(233, 1, 152, '2025-06-18 07:12:34'),
(234, 1, 152, '2025-06-18 07:12:49'),
(235, 1, 152, '2025-06-18 07:13:11'),
(236, 1, 152, '2025-06-18 07:13:17'),
(237, 1, 152, '2025-06-18 07:13:43'),
(238, 1, 152, '2025-06-18 07:14:35'),
(239, 1, 152, '2025-06-18 07:23:18'),
(240, 1, 152, '2025-06-18 07:23:54'),
(241, 1, 152, '2025-06-18 07:27:54'),
(242, 43, 152, '2025-06-18 07:30:32'),
(243, 1, 152, '2025-06-18 07:30:35'),
(244, NULL, 152, '2025-06-18 08:16:37'),
(245, 1, 154, '2025-06-19 06:55:09'),
(246, 1, 152, '2025-06-19 06:55:39'),
(247, 1, 152, '2025-06-19 06:55:43'),
(248, NULL, 155, '2025-06-19 06:57:05'),
(249, 1, 152, '2025-06-19 07:10:01'),
(250, 1, 152, '2025-06-19 07:12:10'),
(251, 1, 152, '2025-06-19 07:12:27'),
(252, 1, 152, '2025-06-19 07:12:34'),
(253, NULL, 152, '2025-06-19 08:57:27'),
(254, 43, 152, '2025-06-19 08:59:04'),
(255, 43, 152, '2025-06-19 08:59:36'),
(256, 43, 152, '2025-06-19 08:59:54'),
(257, 1, 152, '2025-06-19 09:33:19'),
(258, 43, 153, '2025-06-19 15:34:44'),
(259, 43, 153, '2025-06-19 15:35:41'),
(260, NULL, 152, '2025-06-21 09:48:37'),
(261, NULL, 153, '2025-06-21 09:48:53'),
(262, NULL, 155, '2025-06-21 09:49:01'),
(263, NULL, 155, '2025-06-21 09:51:33'),
(264, NULL, 152, '2025-06-21 09:54:03'),
(265, 42, 155, '2025-06-21 09:55:27'),
(266, NULL, 152, '2025-06-21 09:58:01'),
(267, NULL, 155, '2025-06-21 10:00:41'),
(268, NULL, 154, '2025-06-21 10:01:24'),
(269, NULL, 152, '2025-06-21 10:01:31'),
(270, NULL, 155, '2025-06-21 10:01:34'),
(271, NULL, 155, '2025-06-21 14:07:24'),
(272, NULL, 152, '2025-06-21 14:07:59'),
(273, NULL, 155, '2025-06-21 14:08:20'),
(274, NULL, 155, '2025-06-21 14:18:48'),
(275, NULL, 155, '2025-06-21 14:23:07'),
(276, NULL, 155, '2025-06-22 03:56:43'),
(277, NULL, 153, '2025-06-22 04:23:05'),
(278, NULL, 153, '2025-06-22 04:23:51'),
(279, NULL, 153, '2025-06-22 04:24:17'),
(280, 1, 154, '2025-06-23 02:57:01'),
(281, 1, 154, '2025-06-23 03:00:13'),
(282, 1, 154, '2025-06-23 03:00:21'),
(283, 71, 153, '2025-06-23 03:07:07'),
(284, 71, 154, '2025-06-23 03:07:09'),
(285, NULL, 155, '2025-06-23 04:50:00'),
(286, 1, 153, '2025-06-23 07:00:58'),
(287, 1, 153, '2025-06-23 07:03:43'),
(288, 1, 153, '2025-06-23 07:06:39'),
(289, 1, 153, '2025-06-23 07:07:20'),
(290, 71, 155, '2025-06-24 01:07:44'),
(291, NULL, 154, '2025-06-24 09:22:45'),
(292, NULL, 154, '2025-06-24 09:38:00'),
(293, 77, 154, '2025-06-24 16:58:42'),
(294, 1, 154, '2025-06-25 09:30:57'),
(295, 1, 154, '2025-06-25 09:34:12'),
(296, 1, 154, '2025-06-25 09:34:20'),
(297, 1, 155, '2025-06-25 10:22:24'),
(298, 77, 155, '2025-06-25 15:16:46'),
(299, 77, 154, '2025-06-26 13:32:34'),
(300, 77, 153, '2025-06-26 16:33:25'),
(301, 77, 153, '2025-06-27 14:53:29'),
(302, 71, 155, '2025-06-30 12:09:47'),
(303, 71, 152, '2025-06-30 12:13:02'),
(304, 43, 155, '2025-06-30 13:12:13'),
(305, 43, 155, '2025-06-30 13:15:34'),
(306, 43, 155, '2025-06-30 14:01:18'),
(307, 43, 153, '2025-06-30 14:01:26'),
(308, 43, 155, '2025-06-30 14:02:20'),
(309, 43, 153, '2025-06-30 14:02:55'),
(310, NULL, 152, '2025-07-01 03:00:40'),
(311, 1, 152, '2025-07-01 03:13:19'),
(312, NULL, 155, '2025-07-01 08:31:38'),
(313, 42, 154, '2025-07-01 08:52:50'),
(314, 42, 152, '2025-07-01 08:55:39'),
(315, NULL, 155, '2025-07-02 14:36:26'),
(316, NULL, 155, '2025-07-02 14:41:44'),
(317, NULL, 155, '2025-07-02 14:42:32'),
(318, NULL, 155, '2025-07-02 14:46:45'),
(319, NULL, 155, '2025-07-02 14:49:34'),
(320, NULL, 153, '2025-07-02 14:50:19'),
(321, 1, 155, '2025-07-02 14:53:01'),
(322, 1, 153, '2025-07-02 14:53:25'),
(323, 1, 155, '2025-07-02 14:54:22'),
(324, 1, 155, '2025-07-02 14:57:07'),
(325, 1, 155, '2025-07-02 15:02:46'),
(326, 1, 155, '2025-07-02 15:03:57'),
(327, 1, 155, '2025-07-02 15:09:47'),
(328, 1, 155, '2025-07-02 15:10:02'),
(329, 1, 155, '2025-07-02 15:11:17'),
(330, 1, 155, '2025-07-02 15:11:45'),
(331, 1, 155, '2025-07-02 15:12:02'),
(332, 1, 155, '2025-07-02 15:14:26'),
(333, 1, 155, '2025-07-02 15:15:21'),
(334, 1, 155, '2025-07-02 15:17:12'),
(335, 1, 155, '2025-07-02 15:18:35'),
(336, 1, 155, '2025-07-02 15:19:28'),
(337, 1, 155, '2025-07-02 16:00:00'),
(338, 1, 155, '2025-07-02 16:00:35'),
(339, 1, 155, '2025-07-02 16:03:53'),
(340, 1, 152, '2025-07-02 16:04:09'),
(341, 1, 152, '2025-07-02 16:08:28'),
(342, 1, 152, '2025-07-02 16:08:59'),
(343, 1, 152, '2025-07-02 16:10:32'),
(344, 1, 152, '2025-07-02 16:11:17'),
(345, 1, 152, '2025-07-02 16:11:21'),
(346, 1, 152, '2025-07-02 16:12:28'),
(347, 1, 152, '2025-07-02 16:21:34'),
(348, 1, 152, '2025-07-02 16:22:23'),
(349, 1, 152, '2025-07-02 16:22:34'),
(350, 1, 152, '2025-07-02 16:22:44'),
(351, 1, 152, '2025-07-02 16:28:06'),
(352, NULL, 155, '2025-07-03 13:25:00'),
(353, NULL, 155, '2025-07-03 13:28:08'),
(354, NULL, 155, '2025-07-03 13:28:19'),
(355, NULL, 155, '2025-07-03 13:28:34'),
(356, NULL, 155, '2025-07-03 13:38:53'),
(357, NULL, 155, '2025-07-03 13:39:26'),
(358, NULL, 155, '2025-07-03 13:41:03'),
(359, NULL, 155, '2025-07-03 13:41:22'),
(360, NULL, 155, '2025-07-03 13:46:45'),
(361, NULL, 155, '2025-07-03 13:49:17'),
(362, NULL, 155, '2025-07-03 13:49:24'),
(363, NULL, 155, '2025-07-03 13:50:34'),
(364, NULL, 155, '2025-07-03 14:01:32'),
(365, NULL, 155, '2025-07-03 14:01:46'),
(366, NULL, 155, '2025-07-03 14:01:59'),
(367, NULL, 155, '2025-07-03 14:02:55'),
(368, NULL, 155, '2025-07-03 14:04:38'),
(369, NULL, 155, '2025-07-03 14:16:27'),
(370, NULL, 155, '2025-07-03 14:16:45'),
(371, NULL, 155, '2025-07-03 14:16:56'),
(372, NULL, 155, '2025-07-03 14:17:19'),
(373, NULL, 155, '2025-07-03 14:18:20'),
(374, NULL, 155, '2025-07-03 14:18:38'),
(375, NULL, 155, '2025-07-03 14:19:30'),
(376, NULL, 155, '2025-07-03 14:20:54'),
(377, NULL, 155, '2025-07-03 14:21:12'),
(378, NULL, 155, '2025-07-03 14:25:17'),
(379, NULL, 155, '2025-07-03 14:36:15'),
(380, NULL, 155, '2025-07-03 14:37:27'),
(381, NULL, 155, '2025-07-03 14:37:35'),
(382, NULL, 155, '2025-07-03 14:38:08'),
(383, NULL, 155, '2025-07-03 14:38:34'),
(384, NULL, 155, '2025-07-03 14:39:02'),
(385, NULL, 155, '2025-07-03 14:39:54'),
(386, NULL, 155, '2025-07-03 14:40:05'),
(387, NULL, 155, '2025-07-03 14:40:21'),
(388, NULL, 155, '2025-07-03 14:40:59'),
(389, NULL, 155, '2025-07-03 14:43:02'),
(390, NULL, 155, '2025-07-03 14:43:49'),
(391, NULL, 155, '2025-07-03 14:44:07'),
(392, NULL, 155, '2025-07-03 14:45:23'),
(393, NULL, 155, '2025-07-03 14:45:43'),
(394, NULL, 155, '2025-07-03 14:46:25'),
(395, NULL, 155, '2025-07-03 14:46:43'),
(396, NULL, 155, '2025-07-03 14:48:49'),
(397, NULL, 154, '2025-07-03 15:03:00'),
(398, NULL, 155, '2025-07-03 15:04:23'),
(399, NULL, 155, '2025-07-03 15:04:40'),
(400, NULL, 155, '2025-07-03 15:04:47'),
(401, NULL, 155, '2025-07-03 15:10:32'),
(402, NULL, 155, '2025-07-03 15:13:01'),
(403, NULL, 155, '2025-07-03 15:15:05'),
(404, NULL, 153, '2025-07-03 15:15:43'),
(405, NULL, 153, '2025-07-03 15:16:10'),
(406, NULL, 153, '2025-07-03 15:16:42'),
(407, NULL, 153, '2025-07-03 15:17:14'),
(408, NULL, 155, '2025-07-03 15:17:43'),
(409, NULL, 155, '2025-07-03 15:19:47'),
(410, NULL, 155, '2025-07-03 15:20:07'),
(411, NULL, 155, '2025-07-04 13:52:57'),
(412, NULL, 152, '2025-07-07 08:54:19'),
(413, 77, 155, '2025-07-07 08:57:21'),
(414, 77, 155, '2025-07-07 08:57:31'),
(415, 77, 152, '2025-07-07 08:59:56'),
(416, 77, 152, '2025-07-07 09:00:02'),
(417, 77, 154, '2025-07-07 09:06:40'),
(418, 77, 154, '2025-07-07 09:08:45'),
(419, 77, 155, '2025-07-07 09:09:50'),
(420, 77, 155, '2025-07-07 09:11:25'),
(421, 77, 155, '2025-07-07 09:11:57'),
(422, 77, 155, '2025-07-07 09:12:10'),
(423, 77, 155, '2025-07-07 09:12:36'),
(424, 77, 155, '2025-07-07 09:13:26'),
(425, 77, 155, '2025-07-07 09:14:10'),
(426, 77, 154, '2025-07-07 09:14:43'),
(427, 77, 154, '2025-07-07 09:15:00'),
(428, 77, 154, '2025-07-07 09:17:13'),
(429, 77, 155, '2025-07-07 09:17:26');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `roles`
--

INSERT INTO `roles` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'web', '2025-05-15 12:40:58', '2025-05-15 12:40:58'),
(2, 'staff', 'web', '2025-05-15 12:40:58', '2025-05-15 12:40:58'),
(3, 'user', 'web', '2025-05-15 12:40:59', '2025-05-15 12:40:59');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `role_has_permissions`
--

CREATE TABLE `role_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `role_has_permissions`
--

INSERT INTO `role_has_permissions` (`permission_id`, `role_id`) VALUES
(1, 1),
(2, 1),
(3, 1),
(4, 1),
(5, 1),
(6, 1),
(7, 1),
(8, 1),
(9, 1),
(10, 1),
(11, 1),
(12, 1),
(13, 1),
(14, 1),
(15, 1),
(16, 1),
(17, 1),
(18, 1),
(19, 1),
(20, 1),
(21, 1),
(22, 1),
(23, 1),
(24, 1),
(25, 1),
(26, 1),
(27, 1),
(28, 1),
(29, 1),
(30, 1),
(31, 1),
(32, 1),
(33, 1),
(34, 1),
(35, 1),
(36, 1),
(37, 1),
(1, 2),
(5, 2),
(9, 2),
(13, 2),
(17, 2),
(18, 2),
(21, 2),
(22, 2),
(23, 2),
(24, 2),
(25, 2),
(29, 2);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci,
  `payload` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`, `created_at`, `updated_at`) VALUES
('wfoPDPR7ZsfXdV3B7uGb8ThiwhtQtKpcXCQVVT3f', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', 'YTo1OntzOjY6Il90b2tlbiI7czo0MDoiTklYZGx5RUpEdnZmVm8zYWpvUkhKZVAyY1k0MkhyTmRlQUk0Z081NCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjc6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hYm91dCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fXM6NTA6ImxvZ2luX3dlYl81OWJhMzZhZGRjMmIyZjk0MDE1ODBmMDE0YzdmNThlYTRlMzA5ODlkIjtpOjE7czoxNzoicGFzc3dvcmRfaGFzaF93ZWIiO3M6NjA6IiQyeSQxMiRzaTdnUnlkYkplNnVQRHovMHB4cUR1aXB3RHdUOVEvMnBWcGYwSHBTNmsvbHQ1ejcwVWh0dSI7fQ==', 1752014712, NULL, NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `shipping_methods`
--

CREATE TABLE `shipping_methods` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `provider` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `service_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `integration_key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` decimal(15,2) DEFAULT NULL,
  `min_price` decimal(15,2) DEFAULT NULL,
  `max_price` decimal(15,2) DEFAULT NULL,
  `weight_range` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `area_coverage` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `estimated_delivery_days` int(11) DEFAULT NULL,
  `cod_support` tinyint(1) NOT NULL DEFAULT '0',
  `tracking_url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('active','inactive','pending','error') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `specifications`
--

CREATE TABLE `specifications` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `category_ids` json DEFAULT NULL,
  `status` enum('active','inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `specifications`
--

INSERT INTO `specifications` (`id`, `name`, `description`, `category_ids`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(14, 'Hệ điều hành', NULL, '[\"25\", \"26\", \"27\", \"28\"]', 'active', '2025-06-16 13:47:53', '2025-06-16 13:47:53', NULL),
(15, 'Chip xử lý (CPU)', NULL, '[\"25\", \"26\", \"27\", \"28\"]', 'active', '2025-06-16 13:48:15', '2025-06-16 13:48:29', NULL),
(16, 'Tốc độ CPU', NULL, '[\"25\", \"26\", \"27\", \"28\"]', 'active', '2025-06-16 13:49:10', '2025-06-16 13:49:10', NULL),
(17, 'Chip đồ họa (GPU)', NULL, '[\"25\", \"26\", \"27\", \"28\"]', 'active', '2025-06-16 13:49:20', '2025-06-16 13:49:20', NULL),
(18, 'RAM', NULL, '[\"25\", \"26\", \"27\", \"28\"]', 'active', '2025-06-16 13:49:33', '2025-06-16 13:49:33', NULL),
(19, 'Dung lượng lưu trữ', NULL, '[\"25\", \"26\", \"27\", \"28\"]', 'active', '2025-06-16 13:49:46', '2025-06-18 14:00:02', '2025-06-18 14:00:02'),
(20, 'Dung lượng còn lại (khả dụng) khoảng', NULL, '[\"25\", \"26\", \"27\", \"28\"]', 'active', '2025-06-16 13:50:02', '2025-06-18 14:06:48', '2025-06-18 14:06:48'),
(21, 'Danh bạ', NULL, '[\"25\", \"26\", \"27\", \"28\"]', 'active', '2025-06-16 13:50:15', '2025-06-16 13:50:15', NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `subscribers`
--

CREATE TABLE `subscribers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `subscribers`
--

INSERT INTO `subscribers` (`id`, `email`, `created_at`, `updated_at`, `name`, `deleted_at`) VALUES
(1, 'nguyendinhkhai0103@gmail.com', '2025-05-24 16:52:42', '2025-05-24 16:52:42', NULL, NULL),
(2, 'admin@gmail.com', '2025-05-27 14:40:45', '2025-05-27 14:40:45', 'Mừng Nguyễn Văn', NULL),
(3, 'mungnvph20465@fpt.edu.vn', '2025-05-27 14:42:06', '2025-05-27 14:42:06', 'Khuất Thảo Ly', NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `provider` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `provider_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `avatar` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `gender` enum('male','female','other') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'other',
  `is_verified` tinyint(1) NOT NULL DEFAULT '0',
  `last_login` timestamp NULL DEFAULT NULL,
  `status` enum('active','inactive','banned') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `active_status` tinyint(1) NOT NULL DEFAULT '0',
  `dark_mode` tinyint(1) NOT NULL DEFAULT '0',
  `messenger_color` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `provider`, `provider_id`, `phone`, `address`, `avatar`, `dob`, `gender`, `is_verified`, `last_login`, `status`, `remember_token`, `created_at`, `updated_at`, `deleted_at`, `active_status`, `dark_mode`, `messenger_color`) VALUES
(1, 'Admin', 'admin@gmail.com', NULL, '$2y$12$si7gRydbJe6uPDz/0pxqDuipwDwT9Q/2pVpf0HpS6k/lt5z70Uhtu', NULL, NULL, '0123456789', 'Hanoi', 'uploads/users/1751170174.jpg', NULL, 'other', 0, '2025-07-09 05:36:31', 'active', 'dwHFnDFjuZnROTur937nLlTv9DOY3p6t8vgOOIcwiRW3T3OGcHSEBICsXhpi', '2025-05-16 15:31:25', '2025-07-09 05:36:31', NULL, 0, 0, NULL),
(2, 'Staff ', 'staffp@gmail.com', NULL, '$2y$12$de5HWZYmyu9wLPmTzHmyJOjVt1J1uxTaBtWCyQQgZj/kIpNR7At3a', NULL, NULL, '0987654321', 'Hanoi', NULL, NULL, 'other', 0, NULL, 'active', NULL, '2025-05-15 12:40:59', '2025-05-15 12:40:59', NULL, 0, 0, NULL),
(19, 'Staff User', 'staffp@example.com', NULL, '$2y$12$AjknSnqtuagCTU8.y3TaNOK119XzckVLTCVgc3mqoktY57WiDShtq', NULL, NULL, '0987654321', 'Hanoi', 'uploads/users/1751037523.jpg', '2005-10-21', 'male', 0, '2025-06-27 22:36:26', 'active', NULL, '2025-05-23 14:48:11', '2025-06-27 22:36:26', NULL, 0, 0, NULL),
(20, 'Normal User', 'userp@example.com', NULL, '$12$si7gRydbJe6uPDz/0pxqDuipwDwT9Q/2pVpf0HpS6k/lt5z70Uhtu', NULL, NULL, '1234567890', 'Hanoi', NULL, NULL, 'other', 0, NULL, 'active', NULL, '2025-05-23 14:48:12', '2025-05-23 14:48:12', NULL, 0, 0, NULL),
(22, 'Banh đẹp traiii', 'banhday@example.com', NULL, '$2y$12$2RR91Wl.OzECaT5HLkwGoufESlbD7GhGXqbFvwEEIlCJfHEUjmUti', NULL, NULL, '1234567890', 'Viet Tri ,Phu Tho', NULL, NULL, 'other', 0, '2025-05-25 04:28:32', 'active', NULL, '2024-05-25 04:23:02', '2024-05-25 04:23:02', NULL, 0, 0, NULL),
(33, 'banh tester 1', 'banhtester@gmail.com', NULL, '$2y$12$h2CYhIAl0f2VOK8rl.1HPOeTLrfKuK7KNcTyJ0oCxFYuRXJap6MO2', NULL, NULL, '0368706552', 'Số nhà 71, phố tiền phong, phường tiên cát', NULL, '2025-05-16', 'female', 0, NULL, 'active', NULL, '2024-05-25 04:23:02', '2024-05-25 04:23:02', NULL, 0, 0, NULL),
(34, 'banh tester 2', 'banhtester1@gmail.com', NULL, '$2y$12$UY/SPxHGU8zAS6IrhPYanetgotqTpTOV3jAkGtQQSI/bT3TLbzo5q', NULL, NULL, '0368706552', 'Số nhà 71, phố tiền phong, phường tiên cát', NULL, '2025-05-08', 'other', 0, NULL, 'active', NULL, '2024-05-25 04:23:02', '2024-05-25 04:23:02', NULL, 0, 0, NULL),
(35, 'banhtetsre', 'anhnnbph5q0226@gmail.com', NULL, '$2y$12$Cf0GYSxjgLZaKvBlRVdWhu29H.l.N4IcBt7j95hot.c49mZMT6fkq', NULL, NULL, '0368706552', 'Số nhà 71, phố tiền phong, phường tiên cát', NULL, '2025-05-16', 'male', 0, NULL, 'active', NULL, '2024-05-25 04:23:02', '2024-05-25 04:23:02', NULL, 0, 0, NULL),
(36, 'Bird Blog', 'birdblog@gmail.com', NULL, '$2y$12$PuMZty9.K0bsfo9Wjb2DcOevqS97eVslQIKc.qGmchBUBfRCzh0BK', NULL, NULL, '0368706552', 'Số nhà 71, phố tiền phong, phường tiên cát', NULL, '2025-05-16', 'female', 0, NULL, 'active', NULL, '2024-05-25 04:23:02', '2024-05-25 04:23:02', NULL, 0, 0, NULL),
(37, 'Bird Blog', 'birdblog2@gmail.com', NULL, '$2y$12$KB5b4cSc58LyMFevm02Qs.8pSQNPuibCGtijQukqJoTkwTYOYLsnu', NULL, NULL, '0368706552', 'Số nhà 71, phố tiền phong, phường tiên cát', NULL, '2025-05-16', 'female', 0, NULL, 'active', NULL, '2024-05-25 04:23:02', '2024-05-25 04:23:02', NULL, 0, 0, NULL),
(38, 'Bird Blog', 'birdblog3@gmail.com', NULL, '$2y$12$DdGqxTBlHv.ozo0oCYaY1up1s9tRoV.3M0Plw7m4QLdPcuelHwc.u', NULL, NULL, '0368706552', 'Số nhà 71, phố tiền phong, phường tiên cát', NULL, '2025-05-16', 'female', 0, NULL, 'active', NULL, '2024-05-25 04:23:02', '2024-05-25 04:23:02', NULL, 0, 0, NULL),
(39, 'banh dayy yeu em', 'banhday11@example.com', NULL, '$2y$12$KB.guIki4Wfdev8M1iOk5uvJceBBjtcJAArv30/jtVTLD9cwtPl8e', NULL, NULL, '0368706552', 'Số nhà 71, phố tiền phong, phường tiên cát', NULL, '2025-05-07', 'female', 0, NULL, 'active', NULL, '2024-05-25 04:23:02', '2024-05-25 04:23:02', NULL, 0, 0, NULL),
(40, 'bui quang dong', 'dongbui@gmail.com', NULL, '$2y$12$lENUgnn9oOJWPfSrQSrguucx9hzpikO7.IjgSduonsxBi/.T1jMjy', NULL, NULL, '0368706552', 'Số nhà 71, phố tiền phong, phường tiên cát', NULL, '2025-06-06', 'male', 0, NULL, 'active', NULL, '2025-05-26 08:45:25', '2025-05-26 08:45:25', NULL, 0, 0, NULL),
(41, 'Kim Hong Phong Dai', 'daicv@gmail.com', NULL, '$2y$12$JcBJQvn.Cffa3B/ohBz2v..4mW4hmeKceF9cYV3qtj55ZKy6.2WX6', NULL, NULL, '0368706552', 'Số nhà 71, phố tiền phong, phường tiên cát', NULL, '2025-05-21', 'male', 0, '2025-05-26 22:08:16', 'active', 'JHGQYfCLgyB1gD0ebHR1CSEclBpoAoJoKl9sxjHt9jFMkq3ENc4lU0cN8bHi', '2025-05-26 22:07:41', '2025-05-31 20:55:29', NULL, 0, 0, NULL),
(42, 'đại học coder', 'daichuvan95@gmail.com', NULL, '$2y$12$zabvva8SdzabLKbOkbzvKOxczOwxUaExwGePOUB3mjF7wlyA3B/V2', NULL, NULL, '0968791308', 'Vọng Giang', NULL, '2025-05-05', 'male', 0, '2025-07-01 15:52:19', 'inactive', NULL, '2025-05-28 14:57:13', '2025-07-01 15:52:19', NULL, 0, 0, NULL),
(43, 'Cường', 'test@gmail.com', NULL, '$2y$12$3n6LLncP6oIAforDGEkCKO5YEp/mhdvHQwK4UU2thehOUNRGmzBha', NULL, NULL, '09876543', 'Hà Nội', NULL, '2025-05-28', 'male', 0, '2025-06-30 20:53:42', 'active', NULL, '2025-05-28 22:46:16', '2025-06-30 20:53:42', NULL, 0, 0, NULL),
(44, 'banhdayyy', 'anh@gmail.com', NULL, '$2y$12$iL89MO6m8aJ6ytcW/gmKo.DM.6KpdA44E.QCUI.ZTtZ.u0iGCxNW2', NULL, NULL, '0368706552', 'asdsadas', NULL, '2025-05-15', 'male', 0, '2025-05-31 22:09:59', 'active', 'tR6P0OXUsCQtwboq9YCyaCdVdT2exORi6s27GcphWL6lhOk395FRM0vc8KCH', '2025-05-31 22:07:02', '2025-05-31 22:09:59', NULL, 0, 0, NULL),
(45, 'Thanh Bình Nguyễn', 'nguyenthanhbinh05082005@gmail.com', '2025-06-01 09:28:50', '$2y$12$Q0KzVz4F/HD5o609kbqZi.phhyITvFuXSEMqtOPFUpetszd6G0pkO', 'google', '102989406420602569869', NULL, NULL, 'https://lh3.googleusercontent.com/a/ACg8ocJ_1MC1lN0WwDtNb4x5D2AWjmSLm1k-R0V7TX3BrL80CWKlpw=s96-c', NULL, 'other', 0, NULL, 'active', NULL, '2025-06-01 09:28:50', '2025-06-01 09:28:50', NULL, 0, 0, NULL),
(52, 'banh dayy', 'banhday1234@gmail.com', NULL, '$2y$12$7WnXBp6SLBYwdJgmWWFG3eBlA/JskA4gLWGJjwAjBsvb2WI0NyatC', NULL, NULL, NULL, 'dfsdfadfas', NULL, '2025-05-28', 'female', 0, '2025-06-01 23:02:58', 'active', NULL, '2025-06-01 23:01:51', '2025-06-01 23:02:58', NULL, 0, 0, NULL),
(53, 'Banh Tester', 'remvaimankhung@gmail.com', '2025-06-01 23:03:19', '$2y$12$MObZpPjGNsoynBotx4F/Bee0hUiXpmi5IxZnwpsQXVXV1EWP03RKq', 'google', '116737877673519409445', NULL, NULL, 'https://lh3.googleusercontent.com/a/ACg8ocLU_9HP_drMj7OlbFgpvtPXOQO8NK0GHV8C4T4iyLUVbJIO9nk=s96-c', NULL, 'other', 0, '2025-06-01 23:03:19', 'active', NULL, '2025-06-01 23:03:19', '2025-06-01 23:03:19', NULL, 0, 0, NULL),
(55, 'Nguyễn Đình Khải PH 2 9 3 3 3', 'khaindph29333@fpt.edu.vn', '2025-06-06 21:17:28', '$2y$12$GNkUx1XICxiojX82LLoM2ud3ftUk.dPYacBjMvdfgXwoIvjRCaTl.', 'google', '108444160617922493293', NULL, NULL, 'https://lh3.googleusercontent.com/a/ACg8ocLB_WYRfUH-tTqs9HPYRbgRndrlJFdIr8zYaSrIKRWNpcfQvfs=s96-c', NULL, 'other', 0, '2025-06-06 21:25:54', 'active', NULL, '2025-06-06 21:17:28', '2025-06-06 21:25:54', NULL, 0, 0, NULL),
(56, 'banhday1', 'abc@gmail.com', NULL, '$2y$12$d4H0sg.1SmZsVo.v6ktX9.61m72Q0r0mQb2BSDe/BKb.ZCFgTk/NO', NULL, NULL, '0368706552', 'Số nhà 71, phố tiền phong, phường tiên cát', NULL, '2025-06-04', 'male', 0, '2025-06-08 11:48:16', 'active', NULL, '2025-06-08 10:43:19', '2025-06-08 11:48:16', NULL, 0, 0, NULL),
(58, 'Thanh Bình Ford', 'fordthanhbinh@gmail.com', '2025-06-08 12:09:45', '$2y$12$MVlS.gw7VO4KCTMHtwBCM.Pv6Hnk4y4U75LE6naIlWY.Ju0EXP74i', 'google', '115646386580052762473', NULL, NULL, 'https://lh3.googleusercontent.com/a/ACg8ocJCXzWZLPJWJf0se5Ihc9PgsKzheh_qnnGQeZywKHuggYP9Wg=s96-c', NULL, 'other', 0, '2025-06-08 12:09:45', 'active', NULL, '2025-06-08 12:09:45', '2025-06-08 12:09:45', NULL, 0, 0, NULL),
(59, 'banhdayma', 'banhday@gmail.com', NULL, '$2y$12$4uDWY9yd25Cx0Jun7kR/EOaJDHVlUSIp5xT2v2St6EC/qZLJ57mai', NULL, NULL, '0368706552', 'Số nhà 71, phố tiền phong, phường tiên cát', NULL, '2025-06-04', 'male', 0, '2025-06-09 22:26:36', 'active', NULL, '2025-06-09 22:26:19', '2025-06-09 22:26:36', NULL, 0, 0, NULL),
(60, 'banhyeuem', 'banhyeuem@gmail.com', NULL, '$2y$12$0U17mgBRX225yanhsVAwPOidg2gzlDECRNr5MGd.4EldKlchMqFO.', NULL, NULL, '0368706552', 'Số nhà 71, phố tiền phong, phường tiên cát', NULL, '2025-06-10', 'male', 0, NULL, 'active', NULL, '2025-06-09 22:51:06', '2025-06-09 22:51:06', NULL, 0, 0, NULL),
(61, 'binhyeuphong', 'binhyeuphong@gmail.com', NULL, '$2y$12$tEVruqGNCejb6oz7crjL/OFo7AXFnIefNU5xRzoJLRj8K4WRHTq4C', NULL, NULL, '0368706552', 'Số nhà 71, phố tiền phong, phường tiên cát', NULL, '2025-06-03', 'male', 0, NULL, 'active', NULL, '2025-06-09 22:56:06', '2025-06-09 22:56:06', NULL, 0, 0, NULL),
(62, 'phongyeudai', 'phongyeudai@gmail.com', NULL, '$2y$12$zHwmHrzH88wqN3CG.UBm/u.CKCrSWv7EDrYgt1sBaMmcANr31H3yi', NULL, NULL, '0368706552', 'Số nhà 71, phố tiền phong, phường tiên cát', NULL, '2025-06-18', 'male', 0, NULL, 'active', NULL, '2025-06-09 23:09:33', '2025-06-09 23:09:33', NULL, 0, 0, NULL),
(63, 'quangyeuphong', 'quangyeuphong@gmail.com', NULL, '$2y$12$dZuU8hy9qkEUF2EGPUEahu/.7JQqRSJi.BnKp8epraxCJbtHR06xS', NULL, NULL, '0368706552', 'Số nhà 71, phố tiền phong, phường tiên cát', NULL, '2025-05-28', 'male', 0, NULL, 'active', NULL, '2025-06-09 23:10:26', '2025-06-09 23:10:26', NULL, 0, 0, NULL),
(64, 'banhyeumoinguoilam', 'banhyeumoinguoilam@gmail.com', NULL, '$2y$12$WU2ZrEy9C7DPUY73s209pul63Jm.Gjz4ZU8EU5xS7TADWGU.GMf76', NULL, NULL, '0368706552', 'Số nhà 71, phố tiền phong, phường tiên cát', NULL, '2025-05-28', 'male', 0, NULL, 'active', NULL, '2025-06-09 23:17:32', '2025-06-09 23:17:32', NULL, 0, 0, NULL),
(65, 'banhyeuem1', 'anhnnbph5022611@gmail.com', NULL, '$2y$12$trPYJb39U.BWslPdzF.Eh.hTgCpJ/9cTn4NbgvbdG/Gix5X.6rE6y', NULL, NULL, '0368706552', 'Số nhà 71, phố tiền phong, phường tiên cát', NULL, '2025-05-28', 'male', 0, NULL, 'active', NULL, '2025-06-09 23:19:07', '2025-06-09 23:19:07', NULL, 0, 0, NULL),
(66, 'banhyeuyeu', 'banhyeuyeu@gmail.com', NULL, '$2y$12$voGS1RNOqE2v1uEf98WUZOvb3sKdIdk2MQ67fCId.tySPtrvKub8S', NULL, NULL, '0368706552', 'Số nhà 71, phố tiền phong, phường tiên cát', NULL, '2025-06-03', 'male', 0, NULL, 'active', NULL, '2025-06-09 23:20:30', '2025-06-09 23:20:30', NULL, 0, 0, NULL),
(67, 'chuanfifai', 'banh1@gmail.com', NULL, '$2y$12$19SaKtTpXvCNJmcq/Pq/.OsuypGWwXfzIyGwu0u5KrAzE6oHvQkR6', NULL, NULL, '0368706552', 'Số nhà 71, phố tiền phong, phường tiên cát', NULL, '2025-06-03', 'male', 0, '2025-06-09 23:25:44', 'active', 'y54zDVHyxk4eUaRmT0dfWuR1XaM9BzobKAC46dzvdgcr4Cr0RHTaysFotGaC', '2025-06-09 23:25:01', '2025-06-09 23:25:44', NULL, 0, 0, NULL),
(68, 'banh2', 'banh2@gmail.com', NULL, '$2y$12$5zQ/FCKyacb5iFQikTHqZObDA1laqePq0ttpuxkiY8E6YBBpya/3O', NULL, NULL, '0368706552', 'Số nhà 71, phố tiền phong, phường tiên cát', NULL, '2025-06-10', 'female', 0, '2025-06-09 23:26:16', 'active', NULL, '2025-06-09 23:26:10', '2025-06-09 23:26:16', NULL, 0, 0, NULL),
(69, 'banh3', 'banh3@gmail.com', NULL, '$2y$12$WOihTFzKzHXwyS/ws4TXzOHXLLIJd4/E9.AIOjJqDd85fsXSdkVL6', NULL, NULL, '0368706552', 'Số nhà 71, phố tiền phong, phường tiên cát', NULL, '2025-06-05', 'male', 0, NULL, 'active', NULL, '2025-06-09 23:26:45', '2025-06-09 23:26:45', NULL, 0, 0, NULL),
(70, 'banh4', 'banh4@gmail.com', NULL, '$2y$12$LA9.5uLFmc73niHHOwDa5.YXjQlShsndDWiXi/MFb1gnFMWjNFQY6', NULL, NULL, '0368706552', 'Số nhà 71, phố tiền phong, phường tiên cát', NULL, '2025-06-04', 'male', 0, '2025-06-10 21:22:26', 'active', NULL, '2025-06-09 23:30:10', '2025-06-10 21:52:38', NULL, 0, 0, NULL),
(71, 'Kim Hồng Phong', 'phongk211005@gmail.com', NULL, '$2y$12$rp7twYOYmt9jty9fCUq0qO2soMHTXLPH48ctJ/EtAVj3bLvB6qX56', NULL, NULL, '0973067464', 'Tx. Thái Hòa', NULL, '2025-06-11', 'male', 0, '2025-07-07 21:42:35', 'active', NULL, '2025-06-11 08:41:22', '2025-07-07 23:29:13', NULL, 1, 0, NULL),
(72, 'Sasasa', 'sasa@gmail.com', NULL, '$2y$12$fgOECBmANwtUwB5yXtKzMe/XE788BzJ9a6yxxFLew4m4vzGiUX2jy', NULL, NULL, '0987233444', 'Hà Nội, Việt Nam', 'uploads/users/1749606552.jpg', '2025-06-11', 'male', 0, '2025-06-11 08:59:52', 'active', NULL, '2025-06-11 08:49:12', '2025-06-11 08:59:52', NULL, 0, 0, NULL),
(73, 'Dớ Văn Hải', 'hai@gmail.com', NULL, '$2y$12$f8RGEGkRociQvEe4rZP8guR3K3E9HPT6fNn8NF1Hc37OsipBkcKeu', NULL, NULL, '0973067464', 'Tx. Thái Hòa', 'uploads/users/1749608295.jpg', '2025-06-27', 'male', 0, '2025-06-14 22:04:40', 'active', NULL, '2025-06-11 09:18:15', '2025-06-14 22:04:40', NULL, 0, 0, NULL),
(74, 'Banh là tester', 'banhtester3@gmail.com', NULL, '$2y$12$MU1poTdfxhsbpDKz.Befbedmry0wSyE50fwye.OxAiX.gupl//ZJ6', NULL, NULL, '0368706552', 'Số nhà 71, phố tiền phong, phường tiên cát', '/uploads/avatar/1749632129.jpg', '2025-05-29', 'male', 0, '2025-06-21 16:04:00', 'active', NULL, '2025-06-11 09:25:05', '2025-06-21 16:04:00', NULL, 0, 0, NULL),
(75, 'âsasd', 'aad@gmail.com', NULL, '$2y$12$vcmY9KDXL7TpT4L6opulIut6rPi/4Bg61u3km4ggB6c/OoG3fUCUm', NULL, NULL, '0368706552', 'Số nhà 71, phố tiền phong, phường tiên cát', NULL, '2025-06-04', 'male', 0, NULL, 'active', NULL, '2025-06-11 21:13:06', '2025-06-11 21:13:06', NULL, 0, 0, NULL),
(76, 'Mạnh Cường Nguyễn', 'cuongnmph50179@gmail.com', '2025-06-13 21:22:09', '$2y$12$7Bv46Tz3cGlclwO0NGvnROs1LsyWeEeHjQslPzN8qiqvA7u0X8vK6', 'google', '104624917371279928945', NULL, NULL, 'https://lh3.googleusercontent.com/a/ACg8ocK0-i1PegLtv3q4m1wr9zz-1ijX0PlHybhgc1wCGlNH99DdJQ=s96-c', NULL, 'other', 0, '2025-06-13 21:22:09', 'active', NULL, '2025-06-13 21:22:09', '2025-06-13 21:22:09', NULL, 0, 0, NULL),
(77, 'banhyeuem', 'banh2005@gmail.com', NULL, '$2y$12$UC7fUF/6m4dzpCi6AK/EFu8/XDyOKr2pShqdrCWnD5wr/UyB9hQxG', NULL, NULL, '0368706552', 'Số nhà 71, phố tiền phong, phường tiên cát', NULL, '2025-06-11', 'male', 0, '2025-07-07 21:26:01', 'active', NULL, '2025-06-18 21:16:18', '2025-07-07 21:26:01', NULL, 0, 0, NULL),
(79, 'anhnnbph50226@gmail.com', 'anhnnbph502261@gmail.com', NULL, '$2y$12$qAR2MXG6mFmh49H12mJRmerOHRthi2XqWLkNAUEUb5OWZN3ipkUxu', NULL, NULL, '0368706552', 'Số nhà 71, phố tiền phong, phường tiên cát', NULL, '2025-05-27', 'male', 0, NULL, 'active', NULL, '2025-06-29 00:13:54', '2025-06-29 00:13:54', NULL, 0, 0, NULL),
(80, 'Banh là tester yeu 12', 'anhnnbph50226@gmail.com', '2025-07-01 19:55:47', '$2y$12$1hILfLcvLPo6f2csBCrDnOLECx4VyNovut1Snj6PH6eGofEExXOMq', NULL, NULL, '0368706552', 'Số nhà 71, phố tiền phong, phường tiên cát', NULL, '2025-07-10', 'male', 0, NULL, 'active', NULL, '2025-07-01 19:54:46', '2025-07-01 19:55:47', NULL, 0, 0, NULL),
(81, 'banh1', 'anhnnbph5110226@gmail.com', NULL, '$2y$12$OAteLGvo5hZncPOkFLGDnOpOqOLq19V63M3BGJteCoW1PSa2wOSmi', NULL, NULL, '0368706552', 'Số nhà 71, phố tiền phong, phường tiên cát', NULL, '2025-07-01', 'female', 0, NULL, 'active', NULL, '2025-07-02 20:47:11', '2025-07-02 20:47:11', NULL, 0, 0, NULL),
(82, 'banh1', 'anhnnbph511021126@gmail.com', NULL, '$2y$12$zsEDCmeDRCO2q/vVjOYnbeDIs/jzSxo9kQB/m7lxEZ9/GYidJ4n2K', NULL, NULL, '0368706552', 'Số nhà 71, phố tiền phong, phường tiên cát', NULL, '2025-07-01', 'female', 0, NULL, 'active', NULL, '2025-07-02 20:47:30', '2025-07-02 20:47:30', NULL, 0, 0, NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `variant_attribute_types`
--

CREATE TABLE `variant_attribute_types` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `category_ids` json DEFAULT NULL,
  `type` enum('text','color','select') COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_required` tinyint(1) NOT NULL DEFAULT '0',
  `status` enum('active','inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `variant_attribute_types`
--

INSERT INTO `variant_attribute_types` (`id`, `name`, `category_ids`, `type`, `is_required`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(63, 'Màu sắc', '[\"25\", \"26\", \"27\", \"28\"]', 'text', 0, 'active', '2025-06-16 13:42:18', '2025-06-16 13:52:01', NULL),
(64, 'Dung lượng', '[\"25\", \"26\"]', 'text', 0, 'active', '2025-06-16 13:52:28', '2025-06-16 23:23:14', NULL),
(65, 'Màu sắc Iphone', '[\"25\"]', 'text', 0, 'active', '2025-06-17 15:00:33', '2025-06-17 15:03:17', '2025-06-17 15:03:17'),
(66, 'Màu sắc Iphone 15', '[\"25\"]', 'text', 0, 'active', '2025-06-19 10:44:59', '2025-06-19 10:44:59', NULL),
(67, 'Màu sắc Iphone 16', '[\"25\"]', 'text', 0, 'active', '2025-06-27 00:29:07', '2025-06-27 00:29:07', NULL),
(68, 'Màu sắc Iphone 14', '[\"25\"]', 'text', 0, 'active', '2025-06-27 14:47:07', '2025-06-27 14:47:07', NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `variant_attribute_values`
--

CREATE TABLE `variant_attribute_values` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `attribute_type_id` bigint(20) UNSIGNED NOT NULL,
  `value` json NOT NULL,
  `hex` json DEFAULT NULL,
  `status` enum('active','inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `variant_attribute_values`
--

INSERT INTO `variant_attribute_values` (`id`, `attribute_type_id`, `value`, `hex`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(139, 63, '[\"256GB\"]', '[]', 'active', '2025-06-16 13:46:29', '2025-06-16 13:52:01', '2025-06-16 13:52:01'),
(140, 63, '[\"152GB\"]', '[]', 'active', '2025-06-16 13:46:29', '2025-06-16 13:52:01', '2025-06-16 13:52:01'),
(141, 63, '[\"Titan Sa Mạc\"]', '[\"#c4ab97\"]', 'active', '2025-06-16 13:46:30', '2025-06-16 13:46:30', NULL),
(142, 63, '[\"Titan đen\"]', '[\"#3f4042\"]', 'active', '2025-06-16 13:46:30', '2025-06-16 13:46:30', NULL),
(143, 63, '[\"Titan tự nhiên\"]', '[\"#bab4a9\"]', 'active', '2025-06-16 13:46:30', '2025-06-16 13:46:30', NULL),
(144, 63, '[\"Titan trắng\"]', '[\"#f2f1eb\"]', 'active', '2025-06-16 13:46:30', '2025-06-16 13:46:30', NULL),
(145, 64, '[\"256GB\"]', '[]', 'active', '2025-06-16 13:52:53', '2025-06-16 23:11:59', '2025-06-16 23:11:59'),
(146, 64, '[\"512GB\"]', '[]', 'active', '2025-06-16 13:52:53', '2025-06-16 23:11:59', '2025-06-16 23:11:59'),
(147, 64, '[\"1TB\"]', '[]', 'active', '2025-06-16 13:52:53', '2025-06-16 23:11:59', '2025-06-16 23:11:59'),
(148, 64, '[\"256GB\"]', '[]', 'active', '2025-06-16 23:21:34', '2025-06-16 23:21:34', NULL),
(149, 64, '[\"512GB\"]', '[]', 'active', '2025-06-16 23:21:34', '2025-06-16 23:21:34', NULL),
(150, 64, '[\"1TB\"]', '[]', 'active', '2025-06-16 23:21:34', '2025-06-16 23:21:34', NULL),
(151, 63, '[\"Xanh da trời nhạt\"]', '[\"#9ca6ca\"]', 'active', '2025-06-16 23:48:01', '2025-06-16 23:48:01', NULL),
(152, 63, '[\"Xanh đen\"]', '[\"#17213e\"]', 'active', '2025-06-16 23:48:01', '2025-06-16 23:48:01', NULL),
(153, 63, '[\"Vàng\"]', '[\"#f4e8cf\"]', 'active', '2025-06-16 23:48:01', '2025-06-16 23:48:01', NULL),
(154, 65, '[\"Hồng\"]', '[\"#ffe8e8\"]', 'active', '2025-06-17 15:01:57', '2025-06-17 15:01:57', NULL),
(155, 66, '[\"Vàng nhạt\"]', '[\"#ede6c8\"]', 'active', '2025-06-19 10:45:51', '2025-06-19 10:46:57', NULL),
(156, 66, '[\"Xanh lá nhạt\"]', '[\"#d0d9ca\"]', 'active', '2025-06-19 10:45:51', '2025-06-19 10:46:57', NULL),
(157, 66, '[\"Hồng nhạt\"]', '[\"#ebd3d4\"]', 'active', '2025-06-19 10:45:51', '2025-06-19 10:46:57', NULL),
(158, 66, '[\"Xanh dương nhạt\"]', '[\"#d5dddf\"]', 'active', '2025-06-19 10:45:51', '2025-06-19 10:46:57', NULL),
(159, 66, '[\"Đen\"]', '[\"#4b4f50\"]', 'active', '2025-06-19 10:45:51', '2025-06-19 10:46:57', NULL),
(160, 68, '[\"Xanh\"]', '[\"#ffffff\"]', 'active', '2025-06-27 14:47:45', '2025-06-27 14:47:45', NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `variant_combinations`
--

CREATE TABLE `variant_combinations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `variant_id` bigint(20) UNSIGNED NOT NULL,
  `attribute_value_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `variant_combinations`
--

INSERT INTO `variant_combinations` (`id`, `variant_id`, `attribute_value_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(300, 239, 141, '2025-06-17 13:23:02', '2025-06-23 14:09:44', '2025-06-23 14:09:44'),
(301, 239, 150, '2025-06-17 13:23:02', '2025-06-23 14:09:44', '2025-06-23 14:09:44'),
(302, 240, 142, '2025-06-17 13:23:02', '2025-06-23 14:09:44', '2025-06-23 14:09:44'),
(303, 240, 150, '2025-06-17 13:23:02', '2025-06-23 14:09:44', '2025-06-23 14:09:44'),
(308, 243, 142, '2025-06-19 13:16:08', '2025-06-20 16:04:21', NULL),
(309, 244, 144, '2025-06-19 13:21:03', '2025-06-19 13:21:03', NULL),
(310, 244, 148, '2025-06-19 13:21:03', '2025-06-19 13:21:03', NULL),
(311, 245, 143, '2025-06-19 13:23:03', '2025-06-19 13:23:03', NULL),
(312, 245, 149, '2025-06-19 13:23:03', '2025-06-19 13:23:03', NULL),
(313, 246, 141, '2025-06-23 14:09:44', '2025-06-25 15:16:00', '2025-06-25 15:16:00'),
(314, 247, 142, '2025-06-23 14:09:44', '2025-06-25 15:16:00', '2025-06-25 15:16:00'),
(315, 248, 144, '2025-06-25 15:16:00', '2025-06-25 15:16:00', NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `vouchers`
--

CREATE TABLE `vouchers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` enum('fixed','percentage','free_shipping') COLLATE utf8mb4_unicode_ci NOT NULL,
  `purpose` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'product_discount',
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `value` decimal(15,0) NOT NULL,
  `min_order_amount` decimal(15,0) DEFAULT NULL,
  `expires_at` datetime NOT NULL,
  `usage_limit` int(11) NOT NULL,
  `used_count` int(11) NOT NULL DEFAULT '0',
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `per_user_limit` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `vouchers`
--

INSERT INTO `vouchers` (`id`, `code`, `type`, `purpose`, `description`, `value`, `min_order_amount`, `expires_at`, `usage_limit`, `used_count`, `is_active`, `per_user_limit`, `created_at`, `updated_at`) VALUES
(5, 'WELCOME10', 'percentage', 'product_discount', 'Giảm 10% cho đơn hàng đầu tiên.', 10, NULL, '2025-06-19 07:27:09', 100, 0, 1, 1, '2025-05-20 07:27:09', '2025-05-20 07:27:09'),
(6, 'FREESHIP', 'fixed', 'free_shipping', 'Miễn phí vận chuyển cho đơn hàng trên 200,000 VNĐ.', 50000, NULL, '2025-06-19 07:27:09', 100, 0, 1, 1, '2025-05-20 07:27:11', '2025-05-20 07:27:11'),
(7, 'SUMMER20', 'percentage', 'product_discount', 'Giảm giá 20% mùa hè.', 20, NULL, '2025-06-19 07:27:09', 100, 0, 0, 1, '2025-05-20 07:27:18', '2025-05-20 07:27:18'),
(8, 'NOEXPIRE', 'fixed', 'product_discount', 'Voucher không giới hạn thời gian.', 100000, NULL, '2025-06-19 07:27:09', 100, 0, 1, 1, '2025-05-20 07:27:19', '2025-05-20 07:27:19');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `wishlists`
--

CREATE TABLE `wishlists` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `wishlists`
--

INSERT INTO `wishlists` (`id`, `user_id`, `product_id`, `created_at`, `updated_at`) VALUES
(111, 71, 155, '2025-06-22 04:59:48', NULL),
(112, 71, 152, '2025-06-30 12:02:34', NULL);

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `banners`
--
ALTER TABLE `banners`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `blogs`
--
ALTER TABLE `blogs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `blogs_slug_unique` (`slug`),
  ADD KEY `blogs_category_id_foreign` (`category_id`),
  ADD KEY `blogs_author_id_foreign` (`author_id`);

--
-- Chỉ mục cho bảng `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`);

--
-- Chỉ mục cho bảng `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`);

--
-- Chỉ mục cho bảng `carts`
--
ALTER TABLE `carts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `carts_user_id_foreign` (`user_id`);

--
-- Chỉ mục cho bảng `cart_items`
--
ALTER TABLE `cart_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cart_items_cart_id_foreign` (`cart_id`),
  ADD KEY `cart_items_product_id_foreign` (`product_id`),
  ADD KEY `cart_items_variant_id_foreign` (`variant_id`);

--
-- Chỉ mục cho bảng `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `categories_slug_unique` (`slug`),
  ADD KEY `categories_parent_id_foreign` (`parent_id`);

--
-- Chỉ mục cho bảng `ch_favorites`
--
ALTER TABLE `ch_favorites`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `ch_messages`
--
ALTER TABLE `ch_messages`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `contacts`
--
ALTER TABLE `contacts`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Chỉ mục cho bảng `faqs`
--
ALTER TABLE `faqs`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `flash_sales`
--
ALTER TABLE `flash_sales`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `flash_sale_items`
--
ALTER TABLE `flash_sale_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `flash_sale_items_flash_sale_id_foreign` (`flash_sale_id`),
  ADD KEY `flash_sale_items_product_variant_id_foreign` (`product_variant_id`);

--
-- Chỉ mục cho bảng `invoices`
--
ALTER TABLE `invoices`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `invoices_invoice_code_unique` (`invoice_code`),
  ADD KEY `invoices_order_id_foreign` (`order_id`);

--
-- Chỉ mục cho bảng `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Chỉ mục cho bảng `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  ADD KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Chỉ mục cho bảng `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  ADD KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Chỉ mục cho bảng `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `orders_user_id_foreign` (`user_id`),
  ADD KEY `orders_shipping_method_id_foreign` (`shipping_method_id`),
  ADD KEY `orders_voucher_id_foreign` (`voucher_id`);

--
-- Chỉ mục cho bảng `order_items`
--
ALTER TABLE `order_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_items_order_id_foreign` (`order_id`),
  ADD KEY `order_items_product_id_foreign` (`product_id`),
  ADD KEY `order_items_product_variant_id_foreign` (`product_variant_id`);

--
-- Chỉ mục cho bảng `order_returns`
--
ALTER TABLE `order_returns`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_returns_order_id_foreign` (`order_id`),
  ADD KEY `order_returns_user_id_foreign` (`user_id`);

--
-- Chỉ mục cho bảng `order_return_items`
--
ALTER TABLE `order_return_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_return_items_order_return_id_foreign` (`order_return_id`),
  ADD KEY `order_return_items_order_item_id_foreign` (`order_item_id`);

--
-- Chỉ mục cho bảng `page_views`
--
ALTER TABLE `page_views`
  ADD PRIMARY KEY (`id`),
  ADD KEY `page_views_user_id_foreign` (`user_id`);

--
-- Chỉ mục cho bảng `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `password_reset_tokens_email_index` (`email`);

--
-- Chỉ mục cho bảng `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `permissions_name_guard_name_unique` (`name`,`guard_name`);

--
-- Chỉ mục cho bảng `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `products_slug_unique` (`slug`),
  ADD KEY `products_category_id_foreign` (`category_id`),
  ADD KEY `products_status_index` (`status`),
  ADD KEY `products_is_featured_index` (`is_featured`);

--
-- Chỉ mục cho bảng `product_reviews`
--
ALTER TABLE `product_reviews`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_order_variant_unique` (`user_id`,`order_id`,`variant_id`),
  ADD KEY `product_reviews_product_id_foreign` (`product_id`),
  ADD KEY `product_reviews_user_id_foreign` (`user_id`),
  ADD KEY `product_reviews_variant_id_foreign` (`variant_id`),
  ADD KEY `product_reviews_order_id_foreign` (`order_id`);

--
-- Chỉ mục cho bảng `product_specifications`
--
ALTER TABLE `product_specifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_specifications_product_id_foreign` (`product_id`),
  ADD KEY `product_specifications_specification_id_foreign` (`specification_id`);

--
-- Chỉ mục cho bảng `product_variants`
--
ALTER TABLE `product_variants`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `product_variants_slug_unique` (`slug`),
  ADD UNIQUE KEY `product_variants_sku_unique` (`sku`),
  ADD KEY `product_variants_product_id_foreign` (`product_id`);

--
-- Chỉ mục cho bảng `product_views`
--
ALTER TABLE `product_views`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_views_user_id_foreign` (`user_id`),
  ADD KEY `product_views_product_id_foreign` (`product_id`);

--
-- Chỉ mục cho bảng `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_name_guard_name_unique` (`name`,`guard_name`);

--
-- Chỉ mục cho bảng `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `role_has_permissions_role_id_foreign` (`role_id`);

--
-- Chỉ mục cho bảng `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Chỉ mục cho bảng `shipping_methods`
--
ALTER TABLE `shipping_methods`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `specifications`
--
ALTER TABLE `specifications`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `subscribers`
--
ALTER TABLE `subscribers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `subscribers_email_unique` (`email`);

--
-- Chỉ mục cho bảng `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD UNIQUE KEY `users_provider_id_unique` (`provider_id`);

--
-- Chỉ mục cho bảng `variant_attribute_types`
--
ALTER TABLE `variant_attribute_types`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `variant_attribute_types_name_unique` (`name`);

--
-- Chỉ mục cho bảng `variant_attribute_values`
--
ALTER TABLE `variant_attribute_values`
  ADD PRIMARY KEY (`id`),
  ADD KEY `variant_attribute_values_attribute_type_id_index` (`attribute_type_id`);

--
-- Chỉ mục cho bảng `variant_combinations`
--
ALTER TABLE `variant_combinations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `variant_combinations_variant_id_attribute_value_id_unique` (`variant_id`,`attribute_value_id`),
  ADD KEY `variant_combinations_attribute_value_id_foreign` (`attribute_value_id`),
  ADD KEY `variant_combinations_variant_id_index` (`variant_id`),
  ADD KEY `variant_combinations_attribute_value_id_index` (`attribute_value_id`);

--
-- Chỉ mục cho bảng `vouchers`
--
ALTER TABLE `vouchers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `vouchers_code_unique` (`code`);

--
-- Chỉ mục cho bảng `wishlists`
--
ALTER TABLE `wishlists`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `wishlists_user_id_product_id_variant_id_unique` (`user_id`,`product_id`),
  ADD KEY `wishlists_product_id_foreign` (`product_id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `banners`
--
ALTER TABLE `banners`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT cho bảng `blogs`
--
ALTER TABLE `blogs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT cho bảng `carts`
--
ALTER TABLE `carts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT cho bảng `cart_items`
--
ALTER TABLE `cart_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=116;

--
-- AUTO_INCREMENT cho bảng `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT cho bảng `contacts`
--
ALTER TABLE `contacts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT cho bảng `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT cho bảng `faqs`
--
ALTER TABLE `faqs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `flash_sales`
--
ALTER TABLE `flash_sales`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT cho bảng `flash_sale_items`
--
ALTER TABLE `flash_sale_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT cho bảng `invoices`
--
ALTER TABLE `invoices`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=82;

--
-- AUTO_INCREMENT cho bảng `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=310;

--
-- AUTO_INCREMENT cho bảng `messages`
--
ALTER TABLE `messages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=168;

--
-- AUTO_INCREMENT cho bảng `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=105;

--
-- AUTO_INCREMENT cho bảng `order_items`
--
ALTER TABLE `order_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=109;

--
-- AUTO_INCREMENT cho bảng `order_returns`
--
ALTER TABLE `order_returns`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT cho bảng `order_return_items`
--
ALTER TABLE `order_return_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT cho bảng `page_views`
--
ALTER TABLE `page_views`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1769;

--
-- AUTO_INCREMENT cho bảng `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT cho bảng `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT cho bảng `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=156;

--
-- AUTO_INCREMENT cho bảng `product_reviews`
--
ALTER TABLE `product_reviews`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT cho bảng `product_specifications`
--
ALTER TABLE `product_specifications`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=414;

--
-- AUTO_INCREMENT cho bảng `product_variants`
--
ALTER TABLE `product_variants`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=249;

--
-- AUTO_INCREMENT cho bảng `product_views`
--
ALTER TABLE `product_views`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=430;

--
-- AUTO_INCREMENT cho bảng `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT cho bảng `shipping_methods`
--
ALTER TABLE `shipping_methods`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `specifications`
--
ALTER TABLE `specifications`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT cho bảng `subscribers`
--
ALTER TABLE `subscribers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT cho bảng `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=83;

--
-- AUTO_INCREMENT cho bảng `variant_attribute_types`
--
ALTER TABLE `variant_attribute_types`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=69;

--
-- AUTO_INCREMENT cho bảng `variant_attribute_values`
--
ALTER TABLE `variant_attribute_values`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=161;

--
-- AUTO_INCREMENT cho bảng `variant_combinations`
--
ALTER TABLE `variant_combinations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=318;

--
-- AUTO_INCREMENT cho bảng `vouchers`
--
ALTER TABLE `vouchers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT cho bảng `wishlists`
--
ALTER TABLE `wishlists`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=113;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `blogs`
--
ALTER TABLE `blogs`
  ADD CONSTRAINT `blogs_author_id_foreign` FOREIGN KEY (`author_id`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `blogs_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL;

--
-- Các ràng buộc cho bảng `carts`
--
ALTER TABLE `carts`
  ADD CONSTRAINT `carts_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Các ràng buộc cho bảng `cart_items`
--
ALTER TABLE `cart_items`
  ADD CONSTRAINT `cart_items_cart_id_foreign` FOREIGN KEY (`cart_id`) REFERENCES `carts` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `cart_items_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `cart_items_variant_id_foreign` FOREIGN KEY (`variant_id`) REFERENCES `product_variants` (`id`) ON DELETE SET NULL;

--
-- Các ràng buộc cho bảng `categories`
--
ALTER TABLE `categories`
  ADD CONSTRAINT `categories_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL;

--
-- Các ràng buộc cho bảng `flash_sale_items`
--
ALTER TABLE `flash_sale_items`
  ADD CONSTRAINT `flash_sale_items_flash_sale_id_foreign` FOREIGN KEY (`flash_sale_id`) REFERENCES `flash_sales` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `flash_sale_items_product_variant_id_foreign` FOREIGN KEY (`product_variant_id`) REFERENCES `product_variants` (`id`) ON DELETE CASCADE;

--
-- Các ràng buộc cho bảng `invoices`
--
ALTER TABLE `invoices`
  ADD CONSTRAINT `invoices_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE;

--
-- Các ràng buộc cho bảng `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE;

--
-- Các ràng buộc cho bảng `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Các ràng buộc cho bảng `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_shipping_method_id_foreign` FOREIGN KEY (`shipping_method_id`) REFERENCES `shipping_methods` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `orders_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `orders_voucher_id_foreign` FOREIGN KEY (`voucher_id`) REFERENCES `vouchers` (`id`) ON DELETE SET NULL;

--
-- Các ràng buộc cho bảng `order_items`
--
ALTER TABLE `order_items`
  ADD CONSTRAINT `order_items_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `order_items_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `order_items_product_variant_id_foreign` FOREIGN KEY (`product_variant_id`) REFERENCES `product_variants` (`id`) ON DELETE CASCADE;

--
-- Các ràng buộc cho bảng `order_returns`
--
ALTER TABLE `order_returns`
  ADD CONSTRAINT `order_returns_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `order_returns_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Các ràng buộc cho bảng `order_return_items`
--
ALTER TABLE `order_return_items`
  ADD CONSTRAINT `order_return_items_order_item_id_foreign` FOREIGN KEY (`order_item_id`) REFERENCES `order_items` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `order_return_items_order_return_id_foreign` FOREIGN KEY (`order_return_id`) REFERENCES `order_returns` (`id`) ON DELETE CASCADE;

--
-- Các ràng buộc cho bảng `page_views`
--
ALTER TABLE `page_views`
  ADD CONSTRAINT `page_views_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Các ràng buộc cho bảng `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`);

--
-- Các ràng buộc cho bảng `product_reviews`
--
ALTER TABLE `product_reviews`
  ADD CONSTRAINT `product_reviews_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `product_reviews_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `product_reviews_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `product_reviews_variant_id_foreign` FOREIGN KEY (`variant_id`) REFERENCES `product_variants` (`id`) ON DELETE CASCADE;

--
-- Các ràng buộc cho bảng `product_specifications`
--
ALTER TABLE `product_specifications`
  ADD CONSTRAINT `product_specifications_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `product_specifications_specification_id_foreign` FOREIGN KEY (`specification_id`) REFERENCES `specifications` (`id`) ON DELETE CASCADE;

--
-- Các ràng buộc cho bảng `product_variants`
--
ALTER TABLE `product_variants`
  ADD CONSTRAINT `product_variants_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Các ràng buộc cho bảng `product_views`
--
ALTER TABLE `product_views`
  ADD CONSTRAINT `product_views_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `product_views_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Các ràng buộc cho bảng `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Các ràng buộc cho bảng `variant_attribute_values`
--
ALTER TABLE `variant_attribute_values`
  ADD CONSTRAINT `variant_attribute_values_attribute_type_id_foreign` FOREIGN KEY (`attribute_type_id`) REFERENCES `variant_attribute_types` (`id`) ON DELETE CASCADE;

--
-- Các ràng buộc cho bảng `variant_combinations`
--
ALTER TABLE `variant_combinations`
  ADD CONSTRAINT `variant_combinations_attribute_value_id_foreign` FOREIGN KEY (`attribute_value_id`) REFERENCES `variant_attribute_values` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `variant_combinations_variant_id_foreign` FOREIGN KEY (`variant_id`) REFERENCES `product_variants` (`id`) ON DELETE CASCADE;

--
-- Các ràng buộc cho bảng `wishlists`
--
ALTER TABLE `wishlists`
  ADD CONSTRAINT `wishlists_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `wishlists_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
