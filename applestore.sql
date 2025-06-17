-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: localhost
-- Thời gian đã tạo: Th6 16, 2025 lúc 04:21 PM
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
('laravel_cache_spatie.permission.cache', 'a:3:{s:5:\"alias\";a:4:{s:1:\"a\";s:2:\"id\";s:1:\"b\";s:4:\"name\";s:1:\"c\";s:10:\"guard_name\";s:1:\"r\";s:5:\"roles\";}s:11:\"permissions\";a:37:{i:0;a:4:{s:1:\"a\";i:1;s:1:\"b\";s:15:\"view categories\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:1;a:4:{s:1:\"a\";i:2;s:1:\"b\";s:17:\"create categories\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:2;a:4:{s:1:\"a\";i:3;s:1:\"b\";s:15:\"edit categories\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:3;a:4:{s:1:\"a\";i:4;s:1:\"b\";s:17:\"delete categories\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:4;a:4:{s:1:\"a\";i:5;s:1:\"b\";s:12:\"view banners\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:5;a:4:{s:1:\"a\";i:6;s:1:\"b\";s:14:\"create banners\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:6;a:4:{s:1:\"a\";i:7;s:1:\"b\";s:12:\"edit banners\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:7;a:4:{s:1:\"a\";i:8;s:1:\"b\";s:14:\"delete banners\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:8;a:4:{s:1:\"a\";i:9;s:1:\"b\";s:13:\"view products\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:9;a:4:{s:1:\"a\";i:10;s:1:\"b\";s:15:\"create products\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:10;a:4:{s:1:\"a\";i:11;s:1:\"b\";s:13:\"edit products\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:11;a:4:{s:1:\"a\";i:12;s:1:\"b\";s:15:\"delete products\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:12;a:4:{s:1:\"a\";i:13;s:1:\"b\";s:11:\"view orders\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:13;a:4:{s:1:\"a\";i:14;s:1:\"b\";s:13:\"create orders\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:14;a:4:{s:1:\"a\";i:15;s:1:\"b\";s:11:\"edit orders\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:15;a:4:{s:1:\"a\";i:16;s:1:\"b\";s:13:\"delete orders\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:16;a:4:{s:1:\"a\";i:17;s:1:\"b\";s:10:\"view users\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:17;a:4:{s:1:\"a\";i:18;s:1:\"b\";s:12:\"create users\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:18;a:4:{s:1:\"a\";i:19;s:1:\"b\";s:10:\"edit users\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:19;a:4:{s:1:\"a\";i:20;s:1:\"b\";s:12:\"delete users\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:20;a:4:{s:1:\"a\";i:21;s:1:\"b\";s:10:\"view blogs\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:21;a:4:{s:1:\"a\";i:22;s:1:\"b\";s:12:\"create blogs\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:22;a:4:{s:1:\"a\";i:23;s:1:\"b\";s:10:\"edit blogs\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:23;a:4:{s:1:\"a\";i:24;s:1:\"b\";s:12:\"delete blogs\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:24;a:4:{s:1:\"a\";i:25;s:1:\"b\";s:15:\"view attributes\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:25;a:4:{s:1:\"a\";i:26;s:1:\"b\";s:17:\"create attributes\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:26;a:4:{s:1:\"a\";i:27;s:1:\"b\";s:15:\"edit attributes\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:27;a:4:{s:1:\"a\";i:28;s:1:\"b\";s:17:\"delete attributes\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:28;a:4:{s:1:\"a\";i:29;s:1:\"b\";s:14:\"view dashboard\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:29;a:4:{s:1:\"a\";i:30;s:1:\"b\";s:7:\"addrole\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:30;a:4:{s:1:\"a\";i:31;s:1:\"b\";s:28:\"view category specifications\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:31;a:4:{s:1:\"a\";i:32;s:1:\"b\";s:24:\"view category attributes\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:32;a:4:{s:1:\"a\";i:33;s:1:\"b\";s:19:\"view specifications\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:33;a:4:{s:1:\"a\";i:34;s:1:\"b\";s:20:\"trash specifications\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:34;a:4:{s:1:\"a\";i:35;s:1:\"b\";s:22:\"restore specifications\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:35;a:4:{s:1:\"a\";i:36;s:1:\"b\";s:21:\"delete specifications\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:36;a:4:{s:1:\"a\";i:37;s:1:\"b\";s:13:\"view vouchers\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}}s:5:\"roles\";a:2:{i:0;a:3:{s:1:\"a\";i:1;s:1:\"b\";s:5:\"admin\";s:1:\"c\";s:3:\"web\";}i:1;a:3:{s:1:\"a\";i:2;s:1:\"b\";s:5:\"staff\";s:1:\"c\";s:3:\"web\";}}}', 1750094730);

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
(3, 57, '2025-06-08 05:22:38'),
(4, 76, '2025-06-13 14:23:38'),
(5, 42, '2025-06-14 07:36:33');

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
(103, 2, 146, 192, 1),
(104, 2, 146, 193, 1);

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
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `categories`
--

INSERT INTO `categories` (`id`, `name`, `slug`, `parent_id`, `order`, `status`, `type`, `image`, `created_at`, `updated_at`, `deleted_at`) VALUES
(25, 'Iphone', 'iphone', NULL, 1, 'active', 1, 'uploads/categories/1750055763_Danh mục Iphone.png', '2025-06-16 13:36:03', '2025-06-16 13:36:03', NULL),
(26, 'Ipad', 'ipad', NULL, 2, 'active', 1, 'uploads/categories/1750055888_Danh mục Ipad.png', '2025-06-16 13:38:08', '2025-06-16 13:38:08', NULL),
(27, 'Mac', 'mac', NULL, 3, 'active', 1, 'uploads/categories/1750055982_Danh mục Mac.png', '2025-06-16 13:38:11', '2025-06-16 13:39:42', NULL),
(28, 'Watch', 'watch', NULL, 4, 'active', 1, 'uploads/categories/1750055904_Danh mục Watch.png', '2025-06-16 13:38:24', '2025-06-16 13:38:24', NULL),
(29, 'Tai nghe, loa', 'tai-nghe-loa', NULL, 5, 'active', 1, 'uploads/categories/1750055919_Danh mục tai nghe, loa.png', '2025-06-16 13:38:39', '2025-06-16 13:38:39', NULL),
(30, 'Phụ kiện', 'phu-kien', NULL, 6, 'active', 1, 'uploads/categories/1750055957_Danh mục Phụ kiện.png', '2025-06-16 13:39:17', '2025-06-16 13:39:17', NULL);

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
(13, '248c1f19-fcd2-4ce8-b446-d074e2bcf7a1', 'database', 'default', '{\"uuid\":\"248c1f19-fcd2-4ce8-b446-d074e2bcf7a1\",\"displayName\":\"App\\\\Events\\\\OrderStatusUpdated\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":14:{s:5:\\\"event\\\";O:29:\\\"App\\\\Events\\\\OrderStatusUpdated\\\":1:{s:5:\\\"order\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:16:\\\"App\\\\Models\\\\Order\\\";s:2:\\\"id\\\";i:13;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\"},\"createdAt\":1749947568,\"delay\":null}', 'Illuminate\\Broadcasting\\BroadcastException: Pusher error: cURL error 7: Failed to connect to localhost port 8080 after 2258 ms: Couldn\'t connect to server (see https://curl.haxx.se/libcurl/c/libcurl-errors.html) for http://localhost:8080/apps/130010/events?auth_key=hebhaulzxbkh4ugtjs5x&auth_timestamp=1749947569&auth_version=1.0&body_md5=c1da76622780455fdeb6a1eca05d525a&auth_signature=24fcc739b9f570d22d57705afe7d47f293bf1ba06333fa6b478bba70bfde17f7. in C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Broadcasting\\Broadcasters\\PusherBroadcaster.php:163\nStack trace:\n#0 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Broadcasting\\BroadcastEvent.php(93): Illuminate\\Broadcasting\\Broadcasters\\PusherBroadcaster->broadcast(Object(Illuminate\\Support\\Collection), \'OrderStatusUpda...\', Array)\n#1 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(36): Illuminate\\Broadcasting\\BroadcastEvent->handle(Object(Illuminate\\Broadcasting\\BroadcastManager))\n#2 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Util.php(43): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#3 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(96): Illuminate\\Container\\Util::unwrapIfClosure(Object(Closure))\n#4 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(35): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(Illuminate\\Foundation\\Application), Array, Object(Closure))\n#5 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Container.php(754): Illuminate\\Container\\BoundMethod::call(Object(Illuminate\\Foundation\\Application), Array, Array, NULL)\n#6 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Bus\\Dispatcher.php(132): Illuminate\\Container\\Container->call(Array)\n#7 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(169): Illuminate\\Bus\\Dispatcher->Illuminate\\Bus\\{closure}(Object(Illuminate\\Broadcasting\\BroadcastEvent))\n#8 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(126): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Broadcasting\\BroadcastEvent))\n#9 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Bus\\Dispatcher.php(136): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#10 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(125): Illuminate\\Bus\\Dispatcher->dispatchNow(Object(Illuminate\\Broadcasting\\BroadcastEvent), false)\n#11 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(169): Illuminate\\Queue\\CallQueuedHandler->Illuminate\\Queue\\{closure}(Object(Illuminate\\Broadcasting\\BroadcastEvent))\n#12 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(126): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Broadcasting\\BroadcastEvent))\n#13 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(120): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#14 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(68): Illuminate\\Queue\\CallQueuedHandler->dispatchThroughMiddleware(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Object(Illuminate\\Broadcasting\\BroadcastEvent))\n#15 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Jobs\\Job.php(102): Illuminate\\Queue\\CallQueuedHandler->call(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Array)\n#16 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(441): Illuminate\\Queue\\Jobs\\Job->fire()\n#17 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(391): Illuminate\\Queue\\Worker->process(\'database\', Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Object(Illuminate\\Queue\\WorkerOptions))\n#18 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(177): Illuminate\\Queue\\Worker->runJob(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), \'database\', Object(Illuminate\\Queue\\WorkerOptions))\n#19 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Console\\WorkCommand.php(148): Illuminate\\Queue\\Worker->daemon(\'database\', \'default\', Object(Illuminate\\Queue\\WorkerOptions))\n#20 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Console\\WorkCommand.php(131): Illuminate\\Queue\\Console\\WorkCommand->runWorker(\'database\', \'default\')\n#21 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(36): Illuminate\\Queue\\Console\\WorkCommand->handle()\n#22 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Util.php(43): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#23 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(96): Illuminate\\Container\\Util::unwrapIfClosure(Object(Closure))\n#24 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(35): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(Illuminate\\Foundation\\Application), Array, Object(Closure))\n#25 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Container.php(754): Illuminate\\Container\\BoundMethod::call(Object(Illuminate\\Foundation\\Application), Array, Array, NULL)\n#26 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Console\\Command.php(211): Illuminate\\Container\\Container->call(Array)\n#27 C:\\DATN\\vendor\\symfony\\console\\Command\\Command.php(318): Illuminate\\Console\\Command->execute(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#28 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Console\\Command.php(180): Symfony\\Component\\Console\\Command\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#29 C:\\DATN\\vendor\\symfony\\console\\Application.php(1092): Illuminate\\Console\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#30 C:\\DATN\\vendor\\symfony\\console\\Application.php(341): Symfony\\Component\\Console\\Application->doRunCommand(Object(Illuminate\\Queue\\Console\\WorkCommand), Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#31 C:\\DATN\\vendor\\symfony\\console\\Application.php(192): Symfony\\Component\\Console\\Application->doRun(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#32 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Console\\Kernel.php(197): Symfony\\Component\\Console\\Application->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#33 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Application.php(1234): Illuminate\\Foundation\\Console\\Kernel->handle(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#34 C:\\DATN\\artisan(16): Illuminate\\Foundation\\Application->handleCommand(Object(Symfony\\Component\\Console\\Input\\ArgvInput))\n#35 {main}', '2025-06-15 07:32:52');

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
  `discount` decimal(12,2) NOT NULL,
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
  `total` decimal(15,2) NOT NULL,
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
(1, 2, 'INV000002', 444.00, NULL, '2025-06-15 00:35:21', NULL, '2025-06-15 00:35:21', '2025-06-15 00:35:21'),
(2, 5, 'INV000005', 55444.00, NULL, '2025-06-15 01:03:51', NULL, '2025-06-15 01:03:51', '2025-06-15 01:03:51'),
(3, 6, 'INV000006', 55444.00, NULL, '2025-06-15 01:07:07', NULL, '2025-06-15 01:07:07', '2025-06-15 01:07:07'),
(4, 8, 'INV000008', 110888.00, NULL, '2025-06-15 01:30:42', NULL, '2025-06-15 01:30:42', '2025-06-15 01:30:42'),
(5, 7, 'INV000007', 55444.00, 1, '2025-06-15 02:11:14', NULL, '2025-06-15 02:11:14', '2025-06-15 02:11:14'),
(6, 11, 'INV000011', 34333.00, NULL, '2025-06-15 07:05:10', NULL, '2025-06-15 07:05:10', '2025-06-15 07:05:10'),
(7, 12, 'INV000012', 34333.00, NULL, '2025-06-15 07:09:32', NULL, '2025-06-15 07:09:32', '2025-06-15 07:09:32'),
(8, 13, 'INV000013', 34333.00, NULL, '2025-06-15 07:16:17', NULL, '2025-06-15 07:16:17', '2025-06-15 07:16:17'),
(9, 14, 'INV000014', 34333.00, NULL, '2025-06-15 07:48:09', NULL, '2025-06-15 07:48:09', '2025-06-15 07:48:09'),
(10, 15, 'INV000015', 34333.00, NULL, '2025-06-15 07:50:14', NULL, '2025-06-15 07:50:14', '2025-06-15 07:50:14'),
(11, 16, 'INV000016', 34333.00, NULL, '2025-06-15 08:24:22', NULL, '2025-06-15 08:24:22', '2025-06-15 08:24:22'),
(12, 17, 'INV000017', 34333.00, NULL, '2025-06-15 08:28:20', NULL, '2025-06-15 08:28:20', '2025-06-15 08:28:20'),
(13, 18, 'INV000018', 34333.00, NULL, '2025-06-15 08:48:24', NULL, '2025-06-15 08:48:24', '2025-06-15 08:48:24'),
(14, 19, 'INV000019', 34333.00, NULL, '2025-06-15 08:52:02', NULL, '2025-06-15 08:52:02', '2025-06-15 08:52:02'),
(15, 20, 'INV000020', 34333.00, NULL, '2025-06-15 08:57:42', NULL, '2025-06-15 08:57:42', '2025-06-15 08:57:42'),
(16, 21, 'INV000021', 34333.00, NULL, '2025-06-15 09:02:30', NULL, '2025-06-15 09:02:30', '2025-06-15 09:02:30'),
(17, 22, 'INV000022', 34333.00, NULL, '2025-06-15 11:46:07', NULL, '2025-06-15 11:46:07', '2025-06-15 11:46:07'),
(18, 23, 'INV000023', 34333.00, NULL, '2025-06-15 11:47:14', NULL, '2025-06-15 11:47:14', '2025-06-15 11:47:14'),
(19, 24, 'INV000024', 68666.00, NULL, '2025-06-15 11:58:53', NULL, '2025-06-15 11:58:53', '2025-06-15 11:58:53'),
(20, 25, 'INV000025', 34333.00, NULL, '2025-06-15 11:59:31', NULL, '2025-06-15 11:59:31', '2025-06-15 11:59:31'),
(21, 26, 'INV000026', 799999.00, NULL, '2025-06-15 12:51:35', NULL, '2025-06-15 12:51:35', '2025-06-15 12:51:35'),
(22, 27, 'INV000027', 13799998.00, NULL, '2025-06-15 12:52:43', NULL, '2025-06-15 12:52:43', '2025-06-15 12:52:43'),
(23, 28, 'INV000028', 12999999.00, NULL, '2025-06-15 20:22:21', NULL, '2025-06-15 20:22:21', '2025-06-15 20:22:21'),
(24, 29, 'INV000029', 12999999.00, NULL, '2025-06-15 20:26:58', NULL, '2025-06-15 20:26:58', '2025-06-15 20:26:58'),
(25, 34, 'INV000034', 12999999.00, NULL, '2025-06-15 20:48:36', NULL, '2025-06-15 20:48:36', '2025-06-15 20:48:36'),
(26, 42, 'INV000042', 34333.00, NULL, '2025-06-15 21:07:56', NULL, '2025-06-15 21:07:56', '2025-06-15 21:07:56'),
(27, 43, 'INV000043', 12999999.00, NULL, '2025-06-15 21:10:30', NULL, '2025-06-15 21:10:30', '2025-06-15 21:10:30'),
(28, 44, 'INV000044', 12999999.00, NULL, '2025-06-15 21:13:15', NULL, '2025-06-15 21:13:15', '2025-06-15 21:13:15'),
(29, 45, 'INV000045', 12999999.00, NULL, '2025-06-15 21:50:11', NULL, '2025-06-15 21:50:11', '2025-06-15 21:50:11'),
(30, 46, 'INV000046', 12999999.00, NULL, '2025-06-15 21:56:45', NULL, '2025-06-15 21:56:45', '2025-06-15 21:56:45'),
(31, 47, 'INV000047', 34333.00, NULL, '2025-06-15 22:02:01', NULL, '2025-06-15 22:02:01', '2025-06-15 22:02:01'),
(32, 48, 'INV000048', 12999999.00, NULL, '2025-06-15 22:13:13', NULL, '2025-06-15 22:13:13', '2025-06-15 22:13:13'),
(33, 49, 'INV000049', 12999999.00, NULL, '2025-06-15 22:19:17', NULL, '2025-06-15 22:19:17', '2025-06-15 22:19:17'),
(34, 50, 'INV000050', 12999999.00, NULL, '2025-06-15 22:33:19', NULL, '2025-06-15 22:33:19', '2025-06-15 22:33:19'),
(35, 51, 'INV000051', 12999999.00, NULL, '2025-06-15 22:37:38', NULL, '2025-06-15 22:37:38', '2025-06-15 22:37:38'),
(36, 52, 'INV000052', 34333.00, NULL, '2025-06-15 22:42:58', NULL, '2025-06-15 22:42:58', '2025-06-15 22:42:58'),
(37, 53, 'INV000053', 12999999.00, NULL, '2025-06-15 23:00:58', NULL, '2025-06-15 23:00:58', '2025-06-15 23:00:58'),
(38, 54, 'INV000054', 12999999.00, NULL, '2025-06-15 23:04:49', NULL, '2025-06-15 23:04:49', '2025-06-15 23:04:49'),
(39, 55, 'INV000055', 12999999.00, NULL, '2025-06-15 23:06:28', NULL, '2025-06-15 23:06:28', '2025-06-15 23:06:28'),
(40, 56, 'INV000056', 12999999.00, NULL, '2025-06-15 23:08:17', NULL, '2025-06-15 23:08:17', '2025-06-15 23:08:17'),
(41, 57, 'INV000057', 12999999.00, NULL, '2025-06-15 23:10:55', NULL, '2025-06-15 23:10:55', '2025-06-15 23:10:55'),
(42, 58, 'INV000058', 12999999.00, NULL, '2025-06-15 23:16:04', NULL, '2025-06-15 23:16:04', '2025-06-15 23:16:04'),
(43, 59, 'INV000059', 34333.00, NULL, '2025-06-15 23:17:09', NULL, '2025-06-15 23:17:09', '2025-06-15 23:17:09'),
(44, 61, 'INV000061', 34333.00, NULL, '2025-06-15 23:22:46', NULL, '2025-06-15 23:22:46', '2025-06-15 23:22:46'),
(45, 62, 'INV000062', 12999999.00, NULL, '2025-06-15 23:26:25', NULL, '2025-06-15 23:26:25', '2025-06-15 23:26:25'),
(46, 63, 'INV000063', 34333.00, NULL, '2025-06-15 23:26:58', NULL, '2025-06-15 23:26:58', '2025-06-15 23:26:58'),
(47, 64, 'INV000064', 12999999.00, NULL, '2025-06-15 23:32:15', NULL, '2025-06-15 23:32:15', '2025-06-15 23:32:15'),
(48, 65, 'INV000065', 12999999.00, NULL, '2025-06-15 23:36:10', NULL, '2025-06-15 23:36:10', '2025-06-15 23:36:10'),
(49, 66, 'INV000066', 34333.00, NULL, '2025-06-15 23:39:27', NULL, '2025-06-15 23:39:27', '2025-06-15 23:39:27'),
(50, 67, 'INV000067', 34333.00, NULL, '2025-06-15 23:39:57', NULL, '2025-06-15 23:39:57', '2025-06-15 23:39:57'),
(51, 68, 'INV000068', 12999999.00, NULL, '2025-06-15 23:43:17', NULL, '2025-06-15 23:43:17', '2025-06-15 23:43:17'),
(52, 69, 'INV000069', 12999999.00, NULL, '2025-06-15 23:47:24', NULL, '2025-06-15 23:47:24', '2025-06-15 23:47:24'),
(53, 70, 'INV000070', 12999999.00, NULL, '2025-06-15 23:49:44', NULL, '2025-06-15 23:49:44', '2025-06-15 23:49:44'),
(54, 71, 'INV000071', 68666.00, NULL, '2025-06-15 23:53:00', NULL, '2025-06-15 23:53:00', '2025-06-15 23:53:00'),
(55, 72, 'INV000072', 12999999.00, NULL, '2025-06-15 23:55:19', NULL, '2025-06-15 23:55:19', '2025-06-15 23:55:19'),
(56, 73, 'INV000073', 34333.00, NULL, '2025-06-15 23:57:28', NULL, '2025-06-15 23:57:28', '2025-06-15 23:57:28'),
(57, 74, 'INV000074', 34333.00, NULL, '2025-06-15 23:58:24', NULL, '2025-06-15 23:58:24', '2025-06-15 23:58:24'),
(58, 75, 'INV000075', 34333.00, NULL, '2025-06-16 00:02:19', NULL, '2025-06-16 00:02:19', '2025-06-16 00:02:19'),
(59, 76, 'INV000076', 12999999.00, NULL, '2025-06-16 00:09:41', NULL, '2025-06-16 00:09:41', '2025-06-16 00:09:41'),
(60, 77, 'INV000077', 12999999.00, NULL, '2025-06-16 00:13:26', NULL, '2025-06-16 00:13:26', '2025-06-16 00:13:26'),
(61, 81, 'INV000081', 34333.00, NULL, '2025-06-16 00:31:38', NULL, '2025-06-16 00:31:38', '2025-06-16 00:31:38'),
(62, 82, 'INV000082', 34333.00, NULL, '2025-06-16 00:32:27', NULL, '2025-06-16 00:32:27', '2025-06-16 00:32:27'),
(63, 84, 'INV000084', 34333.00, NULL, '2025-06-16 00:34:42', NULL, '2025-06-16 00:34:42', '2025-06-16 00:34:42'),
(64, 85, 'INV000085', 12999999.00, NULL, '2025-06-16 00:35:28', NULL, '2025-06-16 00:35:28', '2025-06-16 00:35:28'),
(65, 88, 'INV000088', 34333.00, NULL, '2025-06-16 01:00:09', NULL, '2025-06-16 01:00:09', '2025-06-16 01:00:09');

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
(142, '2025_06_14_124031_create_product_views_table', 82);

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
(3, 'App\\Models\\User', 76);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `orders`
--

CREATE TABLE `orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `subtotal` decimal(15,2) DEFAULT NULL,
  `discount` decimal(15,2) NOT NULL DEFAULT '0.00',
  `shipping_fee` decimal(15,2) DEFAULT NULL,
  `total_price` decimal(15,2) DEFAULT NULL,
  `refunded_amount` decimal(15,2) NOT NULL DEFAULT '0.00',
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
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `orders`
--

INSERT INTO `orders` (`id`, `order_code`, `user_id`, `subtotal`, `discount`, `shipping_fee`, `total_price`, `refunded_amount`, `shipping_address`, `shipping_name`, `shipping_phone`, `shipping_email`, `payment_method`, `payment_status`, `shipping_method_id`, `status`, `is_paid`, `notes`, `cancel_reason`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'ORD202506158062', NULL, 444.00, 0.00, 0.00, 444.00, 0.00, 'Vọng Giang', 'đại ', '0968791306', 'daicvph50503@gmail.com', 'vnpay', 'pending', NULL, 'pending', 0, NULL, NULL, '2025-06-15 00:34:57', '2025-06-15 00:34:57', NULL),
(2, 'DH2', NULL, 444.00, 0.00, 0.00, 444.00, 0.00, 'Vọng Giang', 'đại', '0968791306', 'daicvph50503@gmail.com', 'cod', 'pending', NULL, 'pending', 0, NULL, NULL, '2025-06-15 00:35:21', '2025-06-15 00:35:21', NULL),
(3, 'ORD202506155415', NULL, 55444.00, 0.00, 0.00, 55444.00, 0.00, 'Nam từ liêm hà nội', 'đại học coder ', '0123456789', 'daicvph50503@gmail.com', 'vnpay', 'paid', NULL, 'confirmed', 1, NULL, NULL, '2025-06-15 00:39:53', '2025-06-15 00:40:46', NULL),
(4, 'ORD202506151598', NULL, 55444.00, 0.00, 0.00, 55444.00, 0.00, 'Vọng Giang', 'đại học coder ', '09876432', 'daichuvan05@gmail.com', 'vnpay', 'paid', NULL, 'confirmed', 1, 'test', NULL, '2025-06-15 01:01:41', '2025-06-15 01:02:12', NULL),
(5, 'DH5', NULL, 55444.00, 0.00, 0.00, 55444.00, 0.00, 'Hanoi', 'đại học coder', '0968791308', 'daicvph50503@gmail.com', 'cod', 'pending', NULL, 'pending', 0, NULL, NULL, '2025-06-15 01:03:51', '2025-06-15 01:03:51', NULL),
(6, 'ORD202506157193', NULL, 55444.00, 0.00, 0.00, 55444.00, 0.00, 'Vọng Giang', 'đại ', '0968791306', 'liyaf70931@finfave.com', 'vnpay', 'paid', NULL, 'confirmed', 1, NULL, NULL, '2025-06-15 01:06:27', '2025-06-15 01:07:07', NULL),
(7, 'ORD202506155013', 42, 55444.00, 0.00, 0.00, 55444.00, 0.00, 'Vọng Giang', 'đại học coder', '0968791308', 'daichuvan05@gmail.com', 'cod', 'pending', NULL, 'completed', 0, NULL, 'tôi cần thay đổi phương thức thanh toán', '2025-06-15 01:19:31', '2025-06-15 02:27:59', NULL),
(8, 'ORD202506159614', 42, 110888.00, 0.00, 0.00, 55444.00, 55444.00, 'Vọng Giang', 'đại học coder', '0968791308', 'daichuvan05@gmail.com', 'vnpay', 'paid', NULL, 'shipping', 1, NULL, NULL, '2025-06-15 01:23:09', '2025-06-15 03:38:28', NULL),
(9, 'ORD202506156707', NULL, 3333.00, 0.00, 0.00, 3333.00, 0.00, 'Vọng Giang', 'đại học coder ', '0368706552', 'yineh95741@finfave.com', 'vnpay', 'pending', NULL, 'pending', 0, NULL, NULL, '2025-06-15 06:51:56', '2025-06-15 06:51:56', NULL),
(10, 'ORD202506159114', NULL, 34333.00, 0.00, 0.00, 34333.00, 0.00, 'Vọng Giang', 'đại học coder ', '0968791308', 'yineh95741@finfave.com', 'vnpay', 'paid', NULL, 'preparing', 1, NULL, NULL, '2025-06-15 06:54:05', '2025-06-15 07:03:18', NULL),
(11, 'DH11', NULL, 34333.00, 0.00, 0.00, 34333.00, 0.00, 'Vọng Giang', 'đại học coder', '0123456789', 'daicvph50503@gmail.com', 'cod', 'pending', NULL, 'pending', 0, NULL, NULL, '2025-06-15 07:05:10', '2025-06-15 07:05:10', NULL),
(12, 'ORD202506157532', NULL, 34333.00, 0.00, 0.00, 34333.00, 0.00, 'Hanoi', 'aaaa ', '0968791308', 'daichuvan05@gmail.com', 'vnpay', 'paid', NULL, 'confirmed', 1, NULL, NULL, '2025-06-15 07:09:32', '2025-06-15 07:10:29', NULL),
(13, 'DH13', 42, 34333.00, 0.00, 0.00, 34333.00, 0.00, 'Vọng Giang', 'đại học coder', '0968791308', 'daichuvan05@gmail.com', 'cod', 'pending', NULL, 'confirmed', 0, NULL, NULL, '2025-06-15 07:16:17', '2025-06-15 07:47:37', NULL),
(14, 'ORD202506159430', 42, 34333.00, 0.00, 0.00, 34333.00, 0.00, 'Vọng Giang', 'đại học coder ', '0968791308', 'daichuvan05@gmail.com', 'vnpay', 'pending', NULL, 'completed', 0, NULL, NULL, '2025-06-15 07:48:09', '2025-06-15 07:53:48', NULL),
(15, 'DH15', 42, 34333.00, 0.00, 0.00, 34333.00, 0.00, 'Vọng Giang', 'đại học coder', '0968791308', 'daichuvan05@gmail.com', 'cod', 'pending', NULL, 'confirmed', 0, NULL, NULL, '2025-06-15 07:50:13', '2025-06-15 08:07:23', NULL),
(16, 'DH16', 42, 34333.00, 0.00, 0.00, 34333.00, 0.00, 'Vọng Giang', 'đại học coder', '0968791308', 'daichuvan05@gmail.com', 'cod', 'pending', NULL, 'pending', 0, NULL, NULL, '2025-06-15 08:24:22', '2025-06-15 08:24:22', NULL),
(17, 'DH17', 42, 34333.00, 0.00, 0.00, 34333.00, 0.00, 'Vọng Giang', 'đại học coder', '0968791308', 'daichuvan05@gmail.com', 'vnpay', 'pending', NULL, 'pending', 0, NULL, NULL, '2025-06-15 08:28:20', '2025-06-15 08:28:20', NULL),
(18, 'DH18', 42, 34333.00, 0.00, 0.00, 34333.00, 0.00, 'Vọng Giang', 'đại học coder 55', '0968791308', 'daichuvan05@gmail.com', 'cod', 'pending', NULL, 'pending', 0, NULL, NULL, '2025-06-15 08:48:24', '2025-06-15 08:48:24', NULL),
(19, 'DH19', 42, 34333.00, 0.00, 0.00, 34333.00, 0.00, 'Vọng Giang', 'đại học coder', '0968791308', 'daichuvan05@gmail.com', 'vnpay', 'pending', NULL, 'pending', 0, NULL, NULL, '2025-06-15 08:52:02', '2025-06-15 08:52:02', NULL),
(20, 'ORD202506157827', 42, 34333.00, 0.00, 0.00, 34333.00, 0.00, 'Vọng Giang', 'đại học coder ', '0968791308', 'daichuvan05@gmail.com', 'vnpay', 'paid', NULL, 'confirmed', 1, NULL, NULL, '2025-06-15 08:57:41', '2025-06-15 08:58:41', NULL),
(21, 'DH21', 42, 34333.00, 0.00, 0.00, 34333.00, 0.00, 'Vọng Giang', 'đại học coder', '0968791308', 'daichuvan05@gmail.com', 'cod', 'pending', NULL, 'pending', 0, NULL, NULL, '2025-06-15 09:02:30', '2025-06-15 09:02:30', NULL),
(22, 'DH22', 42, 34333.00, 0.00, 0.00, 34333.00, 0.00, 'Vọng Giang', 'đại học coder', '0968791308', 'daichuvan05@gmail.com', 'cod', 'pending', NULL, 'cancelled', 0, NULL, 'tôi cần thay đổi phương thức thanh toán', '2025-06-15 11:46:07', '2025-06-15 11:54:25', NULL),
(23, 'ORD202506151178', 42, 34333.00, 0.00, 0.00, 34333.00, 0.00, 'Vọng Giang', 'đại học coder ', '0968791308', 'daichuvan05@gmail.com', 'vnpay', 'paid', NULL, 'completed', 1, NULL, NULL, '2025-06-15 11:47:14', '2025-06-15 11:53:15', NULL),
(24, 'DH24', 42, 68666.00, 0.00, 0.00, 68666.00, 0.00, 'Vọng Giang', 'đại học coder', '0968791308', 'daichuvan05@gmail.com', 'cod', 'pending', NULL, 'cancelled', 0, NULL, 'tôi cần thay đổi phương thức thanh toán', '2025-06-15 11:58:53', '2025-06-15 12:03:06', NULL),
(25, 'ORD202506154093', 42, 34333.00, 0.00, 0.00, 34333.00, 0.00, 'Vọng Giang', 'đại học coder ', '0968791308', 'daichuvan05@gmail.com', 'vnpay', 'paid', NULL, 'preparing', 1, NULL, NULL, '2025-06-15 11:59:30', '2025-06-15 12:00:56', NULL),
(26, 'ORD202506154831', 42, 799999.00, 0.00, 0.00, 799999.00, 0.00, 'Vọng Giang', 'đại học coder ', '0968791308', 'daichuvan05@gmail.com', 'vnpay', 'paid', NULL, 'confirmed', 1, NULL, NULL, '2025-06-15 12:51:34', '2025-06-15 12:52:19', NULL),
(27, 'DH27', 42, 13799998.00, 0.00, 0.00, 13799998.00, 0.00, 'Vọng Giang', 'đại học coder', '0968791308', 'daichuvan05@gmail.com', 'cod', 'pending', NULL, 'completed', 0, NULL, NULL, '2025-06-15 12:52:42', '2025-06-15 12:52:43', NULL),
(28, 'DH28', 42, 12999999.00, 0.00, 0.00, 12999999.00, 0.00, 'Vọng Giang', 'đại học coder', '0968791308', 'daichuvan05@gmail.com', 'vnpay', 'pending', NULL, 'pending', 0, NULL, NULL, '2025-06-15 20:22:20', '2025-06-15 20:22:20', NULL),
(29, 'DH29', 42, 12999999.00, 0.00, 0.00, 12999999.00, 0.00, 'Vọng Giang', 'đại học coder', '0968791308', 'daichuvan05@gmail.com', 'cod', 'pending', NULL, 'pending', 0, NULL, NULL, '2025-06-15 20:26:57', '2025-06-15 20:26:57', NULL),
(30, 'DH30', 42, 12999999.00, 0.00, 0.00, 12999999.00, 0.00, 'Vọng Giang', 'đại học coder', '0968791308', 'daichuvan05@gmail.com', 'vnpay', 'pending', NULL, 'pending', 0, NULL, NULL, '2025-06-15 20:27:41', '2025-06-15 20:27:41', NULL),
(31, 'DH31', 42, 38999997.00, 0.00, 0.00, 38999997.00, 0.00, 'Vọng Giang', 'đại học coder', '0968791308', 'daichuvan05@gmail.com', 'vnpay', 'pending', NULL, 'pending', 0, NULL, NULL, '2025-06-15 20:33:24', '2025-06-15 20:33:24', NULL),
(32, 'DH32', 42, 12999999.00, 0.00, 0.00, 12999999.00, 0.00, 'Vọng Giang', 'đại học coder', '0968791308', 'daichuvan05@gmail.com', 'vnpay', 'pending', NULL, 'pending', 0, NULL, NULL, '2025-06-15 20:47:11', '2025-06-15 20:47:11', NULL),
(33, 'DH33', 42, 12999999.00, 0.00, 0.00, 12999999.00, 0.00, 'Vọng Giang', 'đại học coder', '0968791308', 'daichuvan05@gmail.com', 'vnpay', 'pending', NULL, 'pending', 0, NULL, NULL, '2025-06-15 20:47:52', '2025-06-15 20:47:52', NULL),
(34, 'ORD202506154767', 42, 12999999.00, 0.00, 0.00, 12999999.00, 0.00, 'Vọng Giang', 'đại học coder ', '0968791308', 'daichuvan05@gmail.com', 'vnpay', 'pending', NULL, 'pending', 0, NULL, NULL, '2025-06-15 20:48:36', '2025-06-15 20:48:36', NULL),
(35, 'DH35', 42, 12999999.00, 0.00, 0.00, 12999999.00, 0.00, 'Vọng Giang', 'đại học coder', '0968791308', 'daichuvan05@gmail.com', 'vnpay', 'pending', NULL, 'pending', 0, NULL, NULL, '2025-06-15 20:54:06', '2025-06-15 20:54:06', NULL),
(36, 'DH36', 42, 12999999.00, 0.00, 0.00, 12999999.00, 0.00, 'Vọng Giang', 'đại học coder', '0968791308', 'daichuvan05@gmail.com', 'vnpay', 'pending', NULL, 'pending', 0, NULL, NULL, '2025-06-15 20:55:34', '2025-06-15 20:55:34', NULL),
(37, 'DH37', 42, 12999999.00, 0.00, 0.00, 12999999.00, 0.00, 'Vọng Giang', 'đại học coder', '0968791308', 'daichuvan05@gmail.com', 'vnpay', 'pending', NULL, 'pending', 0, NULL, NULL, '2025-06-15 20:57:28', '2025-06-15 20:57:28', NULL),
(38, 'DH38', 42, 799999.00, 0.00, 0.00, 799999.00, 0.00, 'Vọng Giang', 'đại học coder', '0968791308', 'daichuvan05@gmail.com', 'vnpay', 'pending', NULL, 'pending', 0, NULL, NULL, '2025-06-15 20:59:25', '2025-06-15 20:59:25', NULL),
(39, 'DH39', 42, 34333.00, 0.00, 0.00, 34333.00, 0.00, 'Vọng Giang', 'đại học coder', '0968791308', 'daichuvan05@gmail.com', 'vnpay', 'pending', NULL, 'pending', 0, NULL, NULL, '2025-06-15 21:02:44', '2025-06-15 21:02:44', NULL),
(40, 'DH40', 42, 799999.00, 0.00, 0.00, 799999.00, 0.00, 'Vọng Giang', 'đại học coder', '0968791308', 'daichuvan05@gmail.com', 'vnpay', 'pending', NULL, 'pending', 0, NULL, NULL, '2025-06-15 21:05:55', '2025-06-15 21:05:55', NULL),
(41, 'DH41', 42, 34333.00, 0.00, 0.00, 34333.00, 0.00, 'Vọng Giang', 'đại học coder', '0968791308', 'daichuvan05@gmail.com', 'vnpay', 'pending', NULL, 'pending', 0, NULL, NULL, '2025-06-15 21:06:42', '2025-06-15 21:06:42', NULL),
(42, 'DH42', 42, 34333.00, 0.00, 0.00, 34333.00, 0.00, 'Vọng Giang', 'đại học coder', '0968791308', 'daichuvan05@gmail.com', 'vnpay', 'pending', NULL, 'pending', 0, NULL, NULL, '2025-06-15 21:07:56', '2025-06-15 21:07:56', NULL),
(43, 'DH43', 42, 12999999.00, 0.00, 0.00, 12999999.00, 0.00, 'Vọng Giang', 'đại học coder', '0968791308', 'daichuvan05@gmail.com', 'vnpay', 'pending', NULL, 'pending', 0, NULL, NULL, '2025-06-15 21:10:30', '2025-06-15 21:10:30', NULL),
(44, 'DH44', 42, 12999999.00, 0.00, 0.00, 12999999.00, 0.00, 'Vọng Giang', 'đại học coder', '0968791308', 'daichuvan05@gmail.com', 'vnpay', 'pending', NULL, 'pending', 0, NULL, NULL, '2025-06-15 21:13:15', '2025-06-15 21:13:15', NULL),
(45, 'DH45', 42, 12999999.00, 0.00, 0.00, 12999999.00, 0.00, 'Vọng Giang', 'đại học coder', '0968791308', 'daichuvan05@gmail.com', 'vnpay', 'pending', NULL, 'pending', 0, NULL, NULL, '2025-06-15 21:50:11', '2025-06-15 21:50:11', NULL),
(46, 'DH46', 42, 12999999.00, 0.00, 0.00, 12999999.00, 0.00, 'Vọng Giang', 'đại học coder', '0968791308', 'daichuvan05@gmail.com', 'vnpay', 'pending', NULL, 'pending', 0, NULL, NULL, '2025-06-15 21:56:45', '2025-06-15 21:56:45', NULL),
(47, 'DH47', 42, 34333.00, 0.00, 0.00, 34333.00, 0.00, 'Vọng Giang', 'đại học coder', '0968791308', 'daichuvan05@gmail.com', 'vnpay', 'pending', NULL, 'pending', 0, NULL, NULL, '2025-06-15 22:02:01', '2025-06-15 22:02:01', NULL),
(48, 'DH48', 42, 12999999.00, 0.00, 0.00, 12999999.00, 0.00, 'Vọng Giang', 'đại học coder', '0968791308', 'daichuvan05@gmail.com', 'vnpay', 'pending', NULL, 'pending', 0, NULL, NULL, '2025-06-15 22:13:13', '2025-06-15 22:13:13', NULL),
(49, 'DH49', 42, 12999999.00, 0.00, 0.00, 12999999.00, 0.00, 'Vọng Giang', 'đại học coder', '0968791308', 'daichuvan05@gmail.com', 'vnpay', 'pending', NULL, 'pending', 0, NULL, NULL, '2025-06-15 22:19:17', '2025-06-15 22:19:17', NULL),
(50, 'DH50', 42, 12999999.00, 0.00, 0.00, 12999999.00, 0.00, 'Vọng Giang', 'đại học coder', '0968791308', 'daichuvan05@gmail.com', 'vnpay', 'pending', NULL, 'pending', 0, NULL, NULL, '2025-06-15 22:33:18', '2025-06-15 22:33:18', NULL),
(51, 'DH51', 42, 12999999.00, 0.00, 0.00, 12999999.00, 0.00, 'Vọng Giang', 'đại học coder', '0968791308', 'daichuvan05@gmail.com', 'vnpay', 'pending', NULL, 'pending', 0, NULL, NULL, '2025-06-15 22:37:37', '2025-06-15 22:37:37', NULL),
(52, 'DH52', 42, 34333.00, 0.00, 0.00, 34333.00, 0.00, 'Vọng Giang', 'đại học coder', '0968791308', 'daichuvan05@gmail.com', 'vnpay', 'pending', NULL, 'pending', 0, NULL, NULL, '2025-06-15 22:42:57', '2025-06-15 22:42:57', NULL),
(53, 'DH53', 42, 12999999.00, 0.00, 0.00, 12999999.00, 0.00, 'Vọng Giang', 'đại học coder', '0968791308', 'daichuvan05@gmail.com', 'vnpay', 'pending', NULL, 'pending', 0, NULL, NULL, '2025-06-15 23:00:58', '2025-06-15 23:00:58', NULL),
(54, 'DH54', 42, 12999999.00, 0.00, 0.00, 12999999.00, 0.00, 'Vọng Giang', 'đại học coder', '0968791308', 'daichuvan05@gmail.com', 'vnpay', 'pending', NULL, 'pending', 0, NULL, NULL, '2025-06-15 23:04:48', '2025-06-15 23:04:48', NULL),
(55, 'DH55', 42, 12999999.00, 0.00, 0.00, 12999999.00, 0.00, 'Vọng Giang', 'đại học coder', '0968791308', 'daichuvan05@gmail.com', 'vnpay', 'pending', NULL, 'pending', 0, NULL, NULL, '2025-06-15 23:06:28', '2025-06-15 23:06:28', NULL),
(56, 'DH56', 42, 12999999.00, 0.00, 0.00, 12999999.00, 0.00, 'Vọng Giang', 'đại học coder', '0968791308', 'daichuvan05@gmail.com', 'vnpay', 'pending', NULL, 'pending', 0, NULL, NULL, '2025-06-15 23:08:17', '2025-06-15 23:08:17', NULL),
(57, 'DH57', 42, 12999999.00, 0.00, 0.00, 12999999.00, 0.00, 'Vọng Giang', 'đại học coder', '0968791308', 'daichuvan95@gmail.com', 'vnpay', 'pending', NULL, 'pending', 0, NULL, NULL, '2025-06-15 23:10:55', '2025-06-15 23:10:55', NULL),
(58, 'DH58', 42, 12999999.00, 0.00, 0.00, 12999999.00, 0.00, 'Vọng Giang', 'đại học coder', '0968791308', 'daichuvan95@gmail.com', 'vnpay', 'pending', NULL, 'pending', 0, NULL, NULL, '2025-06-15 23:16:04', '2025-06-15 23:16:04', NULL),
(59, 'DH59', 42, 34333.00, 0.00, 0.00, 34333.00, 0.00, 'Vọng Giang', 'đại học coder', '0968791308', 'daichuvan95@gmail.com', 'vnpay', 'pending', NULL, 'pending', 0, NULL, NULL, '2025-06-15 23:17:09', '2025-06-15 23:17:09', NULL),
(60, 'DH60', 42, 12999999.00, 0.00, 0.00, 12999999.00, 0.00, 'Vọng Giang', 'đại học coder', '0968791308', 'daichuvan95@gmail.com', 'vnpay', 'pending', NULL, 'pending', 0, NULL, NULL, '2025-06-15 23:19:53', '2025-06-15 23:19:53', NULL),
(61, 'DH61', 42, 34333.00, 0.00, 0.00, 34333.00, 0.00, 'Vọng Giang', 'đại học coder', '0968791308', 'daichuvan95@gmail.com', 'vnpay', 'pending', NULL, 'pending', 0, NULL, NULL, '2025-06-15 23:22:46', '2025-06-15 23:22:46', NULL),
(62, 'DH62', 42, 12999999.00, 0.00, 0.00, 12999999.00, 0.00, 'Vọng Giang', 'đại học coder', '0968791308', 'daichuvan95@gmail.com', 'cod', 'pending', NULL, 'pending', 0, NULL, NULL, '2025-06-15 23:26:25', '2025-06-15 23:26:25', NULL),
(63, 'ORD202506152943', 42, 34333.00, 0.00, 0.00, 34333.00, 0.00, 'Vọng Giang', 'đại học coder ', '0968791308', 'daichuvan95@gmail.com', 'vnpay', 'paid', NULL, 'confirmed', 1, NULL, NULL, '2025-06-15 23:26:58', '2025-06-15 23:27:42', NULL),
(64, 'ORD202506156762', 42, 12999999.00, 0.00, 0.00, 12999999.00, 0.00, 'Vọng Giang', 'đại học coder ', '0968791308', 'daichuvan95@gmail.com', 'vnpay', 'pending', NULL, 'pending', 0, NULL, NULL, '2025-06-15 23:32:15', '2025-06-15 23:32:15', NULL),
(65, 'DH65', 42, 12999999.00, 0.00, 0.00, 12999999.00, 0.00, 'Vọng Giang', 'đại học coder', '0968791308', 'daichuvan95@gmail.com', 'vnpay', 'pending', NULL, 'pending', 0, NULL, NULL, '2025-06-15 23:36:10', '2025-06-15 23:36:10', NULL),
(66, 'ORD202506154780', 42, 34333.00, 0.00, 0.00, 34333.00, 0.00, 'Vọng Giang', 'đại học coder ', '0968791308', 'daichuvan95@gmail.com', 'vnpay', 'pending', NULL, 'pending', 0, NULL, NULL, '2025-06-15 23:39:27', '2025-06-15 23:39:27', NULL),
(67, 'DH67', 42, 34333.00, 0.00, 0.00, 34333.00, 0.00, 'Vọng Giang', 'đại học coder', '0968791308', 'daichuvan95@gmail.com', 'vnpay', 'pending', NULL, 'pending', 0, NULL, NULL, '2025-06-15 23:39:57', '2025-06-15 23:39:57', NULL),
(68, 'DH68', 42, 12999999.00, 0.00, 0.00, 12999999.00, 0.00, 'Vọng Giang', 'đại học coder', '0968791308', 'daichuvan95@gmail.com', 'vnpay', 'pending', NULL, 'pending', 0, NULL, NULL, '2025-06-15 23:43:17', '2025-06-15 23:43:17', NULL),
(69, 'DH69', 42, 12999999.00, 0.00, 0.00, 12999999.00, 0.00, 'Vọng Giang', 'đại học coder', '0968791308', 'daichuvan95@gmail.com', 'vnpay', 'pending', NULL, 'pending', 0, NULL, NULL, '2025-06-15 23:47:24', '2025-06-15 23:47:24', NULL),
(70, 'DH70', 42, 12999999.00, 0.00, 0.00, 12999999.00, 0.00, 'Vọng Giang', 'đại học coder', '0968791308', 'daichuvan95@gmail.com', 'vnpay', 'pending', NULL, 'pending', 0, NULL, NULL, '2025-06-15 23:49:44', '2025-06-15 23:49:44', NULL),
(71, 'DH71', 42, 68666.00, 0.00, 0.00, 68666.00, 0.00, 'Vọng Giang', 'đại học coder', '0968791308', 'daichuvan95@gmail.com', 'vnpay', 'pending', NULL, 'pending', 0, NULL, NULL, '2025-06-15 23:53:00', '2025-06-15 23:53:00', NULL),
(72, 'DH72', 42, 12999999.00, 0.00, 0.00, 12999999.00, 0.00, 'Vọng Giang', 'đại học coder', '0968791308', 'daichuvan95@gmail.com', 'vnpay', 'pending', NULL, 'pending', 0, NULL, NULL, '2025-06-15 23:55:18', '2025-06-15 23:55:18', NULL),
(73, 'ORD202506159519', 42, 34333.00, 0.00, 0.00, 34333.00, 0.00, 'Vọng Giang', 'đại học coder ', '0968791308', 'daichuvan95@gmail.com', 'vnpay', 'pending', NULL, 'pending', 0, NULL, NULL, '2025-06-15 23:57:28', '2025-06-15 23:57:28', NULL),
(74, 'DH74', 42, 34333.00, 0.00, 0.00, 34333.00, 0.00, 'Vọng Giang', 'đại học coder', '0968791308', 'daichuvan95@gmail.com', 'vnpay', 'pending', NULL, 'pending', 0, NULL, NULL, '2025-06-15 23:58:23', '2025-06-15 23:58:23', NULL),
(75, 'DH75', 42, 34333.00, 0.00, 0.00, 34333.00, 0.00, 'Vọng Giang', 'đại học coder', '0968791308', 'daichuvan95@gmail.com', 'vnpay', 'pending', NULL, 'pending', 0, NULL, NULL, '2025-06-16 00:02:19', '2025-06-16 00:02:19', NULL),
(76, 'ORD202506168114', 42, 12999999.00, 0.00, 0.00, 12999999.00, 0.00, 'Vọng Giang', 'đại học coder ', '0968791308', 'daichuvan95@gmail.com', 'vnpay', 'pending', NULL, 'pending', 0, NULL, NULL, '2025-06-16 00:09:41', '2025-06-16 00:09:41', NULL),
(77, 'DH77', 42, 12999999.00, 0.00, 0.00, 12999999.00, 0.00, 'Vọng Giang', 'đại học coder', '0968791308', 'daichuvan95@gmail.com', 'vnpay', 'pending', NULL, 'pending', 0, NULL, NULL, '2025-06-16 00:13:26', '2025-06-16 00:13:26', NULL),
(78, 'DH78', 42, 12999999.00, 0.00, 0.00, 12999999.00, 0.00, 'Vọng Giang', 'đại học coder', '0968791308', 'daichuvan95@gmail.com', 'vnpay', 'pending', NULL, 'cancelled', 0, NULL, 'tôi cần thay đổi phương thức thanh toán xxx', '2025-06-16 00:16:57', '2025-06-16 00:30:18', NULL),
(79, 'DH79', 42, 12999999.00, 0.00, 0.00, 12999999.00, 0.00, 'Vọng Giang', 'đại học coder', '0968791308', 'daichuvan95@gmail.com', 'vnpay', 'paid', NULL, 'confirmed', 1, NULL, NULL, '2025-06-16 00:23:11', '2025-06-16 00:24:04', NULL),
(80, 'DH80', 42, 34333.00, 0.00, 0.00, 34333.00, 0.00, 'Vọng Giang', 'đại học coder', '0968791308', 'daichuvan95@gmail.com', 'vnpay', 'paid', NULL, 'confirmed', 1, NULL, NULL, '2025-06-16 00:29:31', '2025-06-16 00:29:59', NULL),
(81, 'ORD202506162345', 42, 34333.00, 0.00, 0.00, 34333.00, 0.00, 'Vọng Giang', 'đại học coder ', '0968791308', 'daichuvan95@gmail.com', 'vnpay', 'pending', NULL, 'pending', 0, NULL, NULL, '2025-06-16 00:31:38', '2025-06-16 00:31:38', NULL),
(82, 'ORD202506165008', 42, 34333.00, 0.00, 0.00, 34333.00, 0.00, 'Vọng Giang', 'đại học coder ', '0968791308', 'daichuvan95@gmail.com', 'vnpay', 'paid', NULL, 'confirmed', 1, NULL, NULL, '2025-06-16 00:32:27', '2025-06-16 00:33:17', NULL),
(83, 'DH83', 42, 12999999.00, 0.00, 0.00, 12999999.00, 0.00, 'Vọng Giang', 'đại học coder', '0968791308', 'daichuvan95@gmail.com', 'vnpay', 'paid', NULL, 'confirmed', 1, NULL, NULL, '2025-06-16 00:33:47', '2025-06-16 00:34:12', NULL),
(84, 'DH84', 42, 34333.00, 0.00, 0.00, 34333.00, 0.00, 'Vọng Giang', 'đại học coder', '0968791308', 'daichuvan95@gmail.com', 'cod', 'pending', NULL, 'pending', 0, NULL, NULL, '2025-06-16 00:34:42', '2025-06-16 00:34:42', NULL),
(85, 'DH85', 42, 12999999.00, 0.00, 0.00, 12999999.00, 0.00, 'Vọng Giang', 'đại học coder', '0968791308', 'daichuvan95@gmail.com', 'cod', 'pending', NULL, 'pending', 0, NULL, NULL, '2025-06-16 00:35:28', '2025-06-16 00:35:28', NULL),
(86, 'DH86', 42, 26799997.00, 0.00, 0.00, 26799997.00, 0.00, 'Vọng Giang', 'đại học coder', '0968791308', 'daichuvan95@gmail.com', 'vnpay', 'paid', NULL, 'confirmed', 1, NULL, NULL, '2025-06-16 00:43:50', '2025-06-16 00:44:19', NULL),
(87, 'DH87', 42, 13068665.00, 0.00, 0.00, 13068665.00, 0.00, 'Vọng Giang', 'đại học coder', '0968791308', 'daichuvan95@gmail.com', 'vnpay', 'paid', NULL, 'confirmed', 1, NULL, NULL, '2025-06-16 00:53:12', '2025-06-16 00:53:39', NULL),
(88, 'DH88', 42, 34333.00, 0.00, 0.00, 34333.00, 0.00, 'Vọng Giang', 'đại học coder', '0968791308', 'daichuvan95@gmail.com', 'cod', 'pending', NULL, 'pending', 0, NULL, NULL, '2025-06-16 01:00:09', '2025-06-16 01:00:09', NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `order_details`
--

CREATE TABLE `order_details` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `variant_id` bigint(20) UNSIGNED NOT NULL,
  `quantity` int(11) NOT NULL,
  `price` decimal(12,2) NOT NULL,
  `total` decimal(12,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
  `price` decimal(15,2) NOT NULL,
  `total` decimal(15,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
  `admin_id` bigint(20) UNSIGNED DEFAULT NULL,
  `processed_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `order_returns`
--

INSERT INTO `order_returns` (`id`, `order_id`, `user_id`, `status`, `reason`, `image`, `admin_id`, `processed_at`, `created_at`, `updated_at`) VALUES
(1, 8, 42, 'approved', 't thấy m chưa vào mắt t', 'uploads/returns/1749927581_cod1.png', 1, '2025-06-15 02:01:21', '2025-06-15 01:59:41', '2025-06-15 02:01:21'),
(2, 7, 42, 'pending', '11111111111111111111111111111', 'uploads/returns/1749929393_cod2.png', NULL, NULL, '2025-06-15 02:29:53', '2025-06-15 02:29:53'),
(3, 14, 42, 'rejected', 'tôi thấy bị lỗi sản phẩm', 'uploads/returns/1749949017_cod2.png', 1, '2025-06-15 08:00:31', '2025-06-15 07:56:57', '2025-06-15 08:00:31'),
(4, 27, 42, 'pending', 'LOOIX SARN PHAARM', 'uploads/returns/1749966847_ip3.jpg', NULL, NULL, '2025-06-15 12:54:07', '2025-06-15 12:54:07');

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
(146, 'Iphone 12', 'iphone-12-1750060918', '122', '<p>123</p>', 25, 12, 0, 'active', 8, '2025-06-16 14:29:02', '2025-06-16 15:01:58', NULL),
(147, 'iPhone 16 Pro Max', 'iphone-16-pro-max-1750061656', 'Bộ sản phẩm gồm: Hộp, Sách hướng dẫn, Cáp, Cây lấy sim\r\n Hư gì đổi nấy 12 tháng tại 3041 siêu thị trên toàn quốc Xem chi tiết chính sách bảo hành, đổi trả\r\n Giao hàng nhanh toàn quốc Xem chi tiết\r\n Tổng đài: 1900.9696.42 (8:00 - 21:30)', '<p><br />\r\n<a href=\"https://www.topzone.vn/iphone/iphone-16-pro-max-1tb\"><img alt=\"iPhone 16 Pro Max 1TB - Tổng Quan\" src=\"https://cdnv2.tgdd.vn/mwg-static//42/329151/s16/iphone-16-pro-max-1tb-081024-023919-238.jpg\" /><img alt=\"iPhone 16 Pro Max 1TB - Thông Số Kỹ Thuật\" src=\"https://cdnv2.tgdd.vn/mwg-static//42/329151/s16/iphone-16-pro-max-1tb-081024-023919-705.jpg\" /><img alt=\"iPhone 16 Pro Max 1TB - AI và Pin\" src=\"https://cdnv2.tgdd.vn/mwg-static//42/329151/s16/iphone-16-pro-max-1tb-081024-023920-641.jpg\" /><img alt=\"iPhone 16 Pro Max 1TB - So Sánh\" src=\"https://cdnv2.tgdd.vn/mwg-static//42/329151/s16/iphone-16-pro-max-1tb-081024-023921-325.jpg\" /></a></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>Nội dung quảng c&aacute;o</strong></p>\r\n\r\n<p>iPhone 16 Pro Max. Sở hữu thiết kế titan tuyệt đẹp. Điều Khiển Camera. 4K Dolby Vision tốc độ 120 fps. V&agrave; chip A18 Pro.</p>', 25, 12, 0, 'active', 2, '2025-06-16 15:14:16', '2025-06-16 15:15:56', NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `product_reviews`
--

CREATE TABLE `product_reviews` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `rating` int(11) DEFAULT NULL,
  `review` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
(282, 147, 14, 'iOS 18', '2025-06-16 15:14:16', '2025-06-16 15:14:16', NULL),
(283, 147, 15, 'Apple A18 Pro 6 nhân', '2025-06-16 15:14:16', '2025-06-16 15:14:16', NULL),
(284, 147, 16, 'Hãng không công bố', '2025-06-16 15:14:16', '2025-06-16 15:14:16', NULL),
(285, 147, 17, 'Apple GPU 6 nhân', '2025-06-16 15:14:16', '2025-06-16 15:14:16', NULL),
(286, 147, 18, '8 GB', '2025-06-16 15:14:16', '2025-06-16 15:14:16', NULL),
(287, 147, 21, 'Không giới hạn', '2025-06-16 15:14:16', '2025-06-16 15:14:16', NULL);

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
  `discount_price` decimal(15,2) DEFAULT NULL,
  `stock` int(11) NOT NULL DEFAULT '0',
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `is_default` tinyint(1) NOT NULL DEFAULT '0' COMMENT '1: Default variant, 0: Not default',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `images` json DEFAULT NULL COMMENT 'Mảng JSON chứa các đường dẫn ảnh của biến thể',
  `purchase_price` decimal(15,2) NOT NULL DEFAULT '0.00' COMMENT 'Giá nhập',
  `selling_price` decimal(15,2) NOT NULL DEFAULT '0.00' COMMENT 'Giá bán'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `product_variants`
--

INSERT INTO `product_variants` (`id`, `product_id`, `sku`, `name`, `slug`, `discount_price`, `stock`, `status`, `is_default`, `created_at`, `updated_at`, `deleted_at`, `images`, `purchase_price`, `selling_price`) VALUES
(192, 146, 'SP-58523', 'Iphone 12 - Titan Sa Mạc - 256GB', 'iphone-12-titan-sa-mac-256gb-1750058942-0', NULL, 12, 'active', 1, '2025-06-16 14:29:02', '2025-06-16 15:01:58', '2025-06-16 15:01:58', '\"[\\\"uploads\\\\/products\\\\/1750058942_0_1732206682_1731698037_1731610492_a7.jpg\\\"]\"', 123.00, 1234.00),
(193, 146, 'SP-96164', 'Iphone 12 - Titan đen - 256GB', 'iphone-12-titan-den-256gb-1750058942-1', NULL, 12, 'active', 0, '2025-06-16 14:29:02', '2025-06-16 15:01:58', '2025-06-16 15:01:58', '\"[\\\"uploads\\\\/products\\\\/1750058942_1_1732218025_2021_9_15_637673230231791121_iphone-13-mini-den-1.jpg\\\"]\"', 12344.00, 12345.00),
(194, 146, 'SP-35263', 'Iphone 12 - Titan Sa Mạc - 256GB', 'iphone-12-titan-sa-mac-256gb', NULL, 12, 'active', 1, '2025-06-16 15:01:58', '2025-06-16 15:01:58', NULL, NULL, 123.00, 1234.00),
(195, 146, 'SP-90046', 'Iphone 12 - Titan đen - 256GB', 'iphone-12-titan-den-256gb', NULL, 12, 'active', 0, '2025-06-16 15:01:58', '2025-06-16 15:01:58', NULL, NULL, 12344.00, 12345.00),
(196, 147, 'SP-78969', 'iPhone 16 Pro Max - Titan Sa Mạc - 256GB', 'iphone-16-pro-max-titan-sa-mac-256gb-1750061656-0', NULL, 111, 'active', 1, '2025-06-16 15:14:16', '2025-06-16 15:14:16', NULL, '\"[\\\"uploads\\\\/products\\\\/1750061656_0_iphone-16-pro-max-desert-titan-1-638621795564494521-650x650.jpg\\\",\\\"uploads\\\\/products\\\\/1750061656_0_iphone-16-pro-max-desert-titan-2-638621795572208419-650x650.jpg\\\",\\\"uploads\\\\/products\\\\/1750061656_0_iphone-16-pro-max-desert-titan-3-638621795578568215-650x650.jpg\\\",\\\"uploads\\\\/products\\\\/1750061656_0_iphone-16-pro-max-desert-titan-4-638621795588787112-650x650.jpg\\\",\\\"uploads\\\\/products\\\\/1750061656_0_iphone-16-pro-max-desert-titan-5-638621795595539246-650x650.jpg\\\",\\\"uploads\\\\/products\\\\/1750061656_0_iphone-16-pro-max-desert-titan-6-638621795603626395-650x650.jpg\\\",\\\"uploads\\\\/products\\\\/1750061656_0_iphone-16-pro-max-desert-titan-7-638621795610778662-650x650.jpg\\\",\\\"uploads\\\\/products\\\\/1750061656_0_iphone-16-pro-max-desert-titan-8-638621795619447667-650x650.jpg\\\",\\\"uploads\\\\/products\\\\/1750061656_0_iphone-16-pro-max-desert-titan-9-638621795626802491-650x650.jpg\\\",\\\"uploads\\\\/products\\\\/1750061656_0_iphone-16-pro-max-desert-titan-10-638621795633165181-650x650.jpg\\\",\\\"uploads\\\\/products\\\\/1750061656_0_iphone-16-pro-max-titan-sa-mac-thumbnew-650x650.png\\\"]\"', 29999999.99, 30490000.00),
(197, 147, 'SP-50560', 'iPhone 16 Pro Max - Titan Sa Mạc - 512GB', 'iphone-16-pro-max-titan-sa-mac-512gb-1750061656-1', NULL, 222, 'active', 0, '2025-06-16 15:14:16', '2025-06-16 15:14:16', NULL, '\"[\\\"uploads\\\\/products\\\\/1750061656_1_iphone-16-pro-max-desert-titan-1-638621795814068657-650x650.jpg\\\",\\\"uploads\\\\/products\\\\/1750061656_1_iphone-16-pro-max-desert-titan-2-638621795820805902-650x650.jpg\\\",\\\"uploads\\\\/products\\\\/1750061656_1_iphone-16-pro-max-desert-titan-3-638621795830695784-650x650.jpg\\\",\\\"uploads\\\\/products\\\\/1750061656_1_iphone-16-pro-max-desert-titan-4-638621795837108334-650x650.jpg\\\",\\\"uploads\\\\/products\\\\/1750061656_1_iphone-16-pro-max-desert-titan-5-638621795845312767-650x650.jpg\\\",\\\"uploads\\\\/products\\\\/1750061656_1_iphone-16-pro-max-desert-titan-6-638621795853249888-650x650.jpg\\\",\\\"uploads\\\\/products\\\\/1750061656_1_iphone-16-pro-max-desert-titan-7-638621795859754532-650x650.jpg\\\",\\\"uploads\\\\/products\\\\/1750061656_1_iphone-16-pro-max-desert-titan-8-638621795866866908-650x650.jpg\\\",\\\"uploads\\\\/products\\\\/1750061656_1_iphone-16-pro-max-desert-titan-9-638621795875118266-650x650.jpg\\\"]\"', 30000000.00, 36790000.00),
(198, 147, 'SP-59724', 'iPhone 16 Pro Max - Titan Sa Mạc - 1TB', 'iphone-16-pro-max-titan-sa-mac-1tb-1750061657-2', NULL, 333, 'active', 0, '2025-06-16 15:14:17', '2025-06-16 15:14:17', NULL, '\"[]\"', 30000000.00, 42990000.00),
(199, 147, 'SP-01816', 'iPhone 16 Pro Max - Titan đen - 256GB', 'iphone-16-pro-max-titan-den-256gb-1750061657-3', NULL, 444, 'active', 0, '2025-06-16 15:14:17', '2025-06-16 15:14:17', NULL, '\"[]\"', 30000000.00, 30490000.00),
(200, 147, 'SP-16120', 'iPhone 16 Pro Max - Titan đen - 512GB', 'iphone-16-pro-max-titan-den-512gb-1750061657-4', NULL, 555, 'active', 0, '2025-06-16 15:14:17', '2025-06-16 15:14:17', NULL, '\"[]\"', 30000000.00, 36790000.00),
(201, 147, 'SP-13067', 'iPhone 16 Pro Max - Titan đen - 1TB', 'iphone-16-pro-max-titan-den-1tb-1750061657-5', NULL, 666, 'active', 0, '2025-06-16 15:14:17', '2025-06-16 15:14:17', NULL, '\"[]\"', 30000000.00, 42990000.00),
(202, 147, 'SP-93060', 'iPhone 16 Pro Max - Titan tự nhiên - 256GB', 'iphone-16-pro-max-titan-tu-nhien-256gb-1750061657-6', NULL, 777, 'active', 0, '2025-06-16 15:14:17', '2025-06-16 15:14:17', NULL, '\"[]\"', 30000000.00, 30890000.00),
(203, 147, 'SP-35040', 'iPhone 16 Pro Max - Titan tự nhiên - 512GB', 'iphone-16-pro-max-titan-tu-nhien-512gb-1750061657-7', NULL, 888, 'active', 0, '2025-06-16 15:14:17', '2025-06-16 15:14:17', NULL, '\"[]\"', 30000000.00, 36990000.00),
(204, 147, 'SP-92123', 'iPhone 16 Pro Max - Titan tự nhiên - 1TB', 'iphone-16-pro-max-titan-tu-nhien-1tb-1750061657-8', NULL, 999, 'active', 0, '2025-06-16 15:14:17', '2025-06-16 15:14:17', NULL, '\"[]\"', 29999999.98, 42990000.00),
(205, 147, 'SP-66546', 'iPhone 16 Pro Max - Titan trắng - 256GB', 'iphone-16-pro-max-titan-trang-256gb-1750061657-9', NULL, 123, 'active', 0, '2025-06-16 15:14:17', '2025-06-16 15:14:17', NULL, '\"[]\"', 30000000.00, 30690000.00),
(206, 147, 'SP-12062', 'iPhone 16 Pro Max - Titan trắng - 512GB', 'iphone-16-pro-max-titan-trang-512gb-1750061657-10', NULL, 234, 'active', 0, '2025-06-16 15:14:17', '2025-06-16 15:14:17', NULL, '\"[]\"', 30000000.00, 36990000.00),
(207, 147, 'SP-56345', 'iPhone 16 Pro Max - Titan trắng - 1TB', 'iphone-16-pro-max-titan-trang-1tb-1750061657-11', NULL, 345, 'active', 0, '2025-06-16 15:14:17', '2025-06-16 15:14:17', NULL, '\"[]\"', 29999999.97, 42990000.00);

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
(193, 43, 146, '2025-06-16 07:30:10'),
(194, 43, 146, '2025-06-16 07:30:37'),
(195, 43, 146, '2025-06-16 07:31:48'),
(196, 43, 146, '2025-06-16 07:32:07'),
(197, 43, 146, '2025-06-16 07:34:54'),
(198, 1, 147, '2025-06-16 08:16:04');

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
-- Cấu trúc bảng cho bảng `search_histories`
--

CREATE TABLE `search_histories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `keyword` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('dKYzJlxyJWUc5fom2j25Lt8AM2O8Z760kXssLusn', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'YTo2OntzOjY6Il90b2tlbiI7czo0MDoiWUN2dWppNkNMVzBJQ05ObzNwRWZjc1FFZWF4NkJjcG9zb0ZzaVVVdSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czozOiJ1cmwiO2E6MDp7fXM6NTA6ImxvZ2luX3dlYl81OWJhMzZhZGRjMmIyZjk0MDE1ODBmMDE0YzdmNThlYTRlMzA5ODlkIjtpOjE7czoxNzoicGFzc3dvcmRfaGFzaF93ZWIiO3M6NjA6IiQyeSQxMiRzaTdnUnlkYkplNnVQRHovMHB4cUR1aXB3RHdUOVEvMnBWcGYwSHBTNmsvbHQ1ejcwVWh0dSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzY6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hZG1pbi9wcm9kdWN0cyI7fX0=', 1750061701),
('iN4giHForfWAf0rEK4ROEd0JV4sFIigmPLtFe4h8', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 'YTo2OntzOjY6Il90b2tlbiI7czo0MDoiZTBkYnZ0Z2t5UW44eWltWDJ2TFByMkVwR21STFRheTQyeWZRajBhciI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzY6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hZG1pbi92YXJpYW50cyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fXM6MzoidXJsIjthOjA6e31zOjUwOiJsb2dpbl93ZWJfNTliYTM2YWRkYzJiMmY5NDAxNTgwZjAxNGM3ZjU4ZWE0ZTMwOTg5ZCI7aToxO3M6MTc6InBhc3N3b3JkX2hhc2hfd2ViIjtzOjYwOiIkMnkkMTIkc2k3Z1J5ZGJKZTZ1UER6LzBweHFEdWlwd0R3VDlRLzJwVnBmMEhwUzZrL2x0NXo3MFVodHUiO30=', 1750061891),
('rWhmcUmota98YNTjBQg9cYx4I26qaLBoPH2gJsxR', 43, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'YTo1OntzOjY6Il90b2tlbiI7czo0MDoiaThROXpWWk1KWjNoVThFMDJJdmJ0MDQ4cHNxMEZnaUFXS0hVUnpDUCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fXM6NTA6ImxvZ2luX3dlYl81OWJhMzZhZGRjMmIyZjk0MDE1ODBmMDE0YzdmNThlYTRlMzA5ODlkIjtpOjQzO3M6MTc6InBhc3N3b3JkX2hhc2hfd2ViIjtzOjYwOiIkMnkkMTIkM242TExuY1A2b0lBZm9yREdFa0NLTzVZRXAvbWhkdkhRd0s0VVUydGhlaE9VTlJHbXpCaGEiO30=', 1750061643),
('ZUjNVgKvbjlpVuggfcZ7z2ly1mhUIgwIDCRStiPE', 42, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'YTo1OntzOjY6Il90b2tlbiI7czo0MDoiSXZBOEptdURmSDZEWDNLNmdxQ1R0QTk3WW9GYzh3RTFjdXF2a3pDaCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fXM6NTA6ImxvZ2luX3dlYl81OWJhMzZhZGRjMmIyZjk0MDE1ODBmMDE0YzdmNThlYTRlMzA5ODlkIjtpOjQyO3M6MTc6InBhc3N3b3JkX2hhc2hfd2ViIjtzOjYwOiIkMnkkMTIkemFidnZhOFNkemFiTEtiT2tienZLT3hjek93eFVhRXh3R2VQT1VCM21qRjd3bHlBM0IvVjIiO30=', 1750056469);

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

--
-- Đang đổ dữ liệu cho bảng `shipping_methods`
--

INSERT INTO `shipping_methods` (`id`, `name`, `description`, `provider`, `service_code`, `integration_key`, `price`, `min_price`, `max_price`, `weight_range`, `area_coverage`, `estimated_delivery_days`, `cod_support`, `tracking_url`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Standard Shipping', 'Standard shipping method', NULL, NULL, NULL, 30000.00, NULL, NULL, NULL, NULL, NULL, 0, NULL, 'active', '2025-05-08 14:31:58', '2025-05-08 14:31:58', NULL),
(2, 'Express Shipping', 'Express shipping method', NULL, NULL, NULL, 50000.00, NULL, NULL, NULL, NULL, NULL, 0, NULL, 'active', '2025-05-08 14:31:58', '2025-05-08 14:31:58', NULL);

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
(19, 'Dung lượng lưu trữ', NULL, '[\"25\", \"26\", \"27\", \"28\"]', 'active', '2025-06-16 13:49:46', '2025-06-16 13:49:46', NULL),
(20, 'Dung lượng còn lại (khả dụng) khoảng', NULL, '[\"25\", \"26\", \"27\", \"28\"]', 'active', '2025-06-16 13:50:02', '2025-06-16 13:50:02', NULL),
(21, 'Danh bạ', NULL, '[\"25\", \"26\", \"27\", \"28\"]', 'active', '2025-06-16 13:50:15', '2025-06-16 13:50:15', NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `stock_adjustments`
--

CREATE TABLE `stock_adjustments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` enum('increase','decrease') COLLATE utf8mb4_unicode_ci NOT NULL,
  `reason` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('pending','approved','rejected') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `approved_by` bigint(20) UNSIGNED DEFAULT NULL,
  `approved_at` timestamp NULL DEFAULT NULL,
  `created_by` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `stock_adjustment_items`
--

CREATE TABLE `stock_adjustment_items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `adjustment_id` bigint(20) UNSIGNED NOT NULL,
  `variant_id` bigint(20) UNSIGNED NOT NULL,
  `quantity` int(11) NOT NULL,
  `note` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `stock_movements`
--

CREATE TABLE `stock_movements` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `variant_id` bigint(20) UNSIGNED NOT NULL,
  `type` enum('in','out') COLLATE utf8mb4_unicode_ci NOT NULL,
  `quantity` int(11) NOT NULL,
  `unit_price` decimal(10,2) DEFAULT NULL,
  `reference_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `reference_id` bigint(20) UNSIGNED DEFAULT NULL,
  `note` text COLLATE utf8mb4_unicode_ci,
  `created_by` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `provider`, `provider_id`, `phone`, `address`, `avatar`, `dob`, `gender`, `is_verified`, `last_login`, `status`, `remember_token`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Admin ', 'admin@gmail.com', NULL, '$2y$12$si7gRydbJe6uPDz/0pxqDuipwDwT9Q/2pVpf0HpS6k/lt5z70Uhtu', NULL, NULL, '0123456789', 'Hanoi', NULL, NULL, 'other', 0, '2025-06-16 14:08:03', 'active', 'ZiFWGSFLIBPjqIqQgZwn9eq0SzAXRe6VjEhPgII0UF3JLN771c4oaUkCPBqc', '2025-05-16 15:31:25', '2025-06-16 14:08:03', NULL),
(2, 'Staff ', 'staffp@gmail.com', NULL, '$2y$12$de5HWZYmyu9wLPmTzHmyJOjVt1J1uxTaBtWCyQQgZj/kIpNR7At3a', NULL, NULL, '0987654321', 'Hanoi', NULL, NULL, 'other', 0, NULL, 'active', NULL, '2025-05-15 12:40:59', '2025-05-15 12:40:59', NULL),
(19, 'Staff User', 'staffp@example.com', NULL, '$2y$12$WHrqm55gWHco5y8WkiNczeLnELUpkpEj3eJC3tOAxHV2QUp1o0DJm', NULL, NULL, '0987654321', 'Hanoi', NULL, NULL, 'other', 0, '2025-06-11 09:20:36', 'active', NULL, '2025-05-23 14:48:11', '2025-06-11 09:20:36', NULL),
(20, 'Normal User', 'userp@example.com', NULL, '$12$si7gRydbJe6uPDz/0pxqDuipwDwT9Q/2pVpf0HpS6k/lt5z70Uhtu', NULL, NULL, '1234567890', 'Hanoi', NULL, NULL, 'other', 0, NULL, 'active', NULL, '2025-05-23 14:48:12', '2025-05-23 14:48:12', NULL),
(22, 'Banh đẹp traiii', 'banhday@example.com', NULL, '$2y$12$2RR91Wl.OzECaT5HLkwGoufESlbD7GhGXqbFvwEEIlCJfHEUjmUti', NULL, NULL, '1234567890', 'Viet Tri ,Phu Tho', NULL, NULL, 'other', 0, '2025-05-25 04:28:32', 'active', NULL, '2025-05-25 04:23:02', '2025-05-25 04:28:32', NULL),
(33, 'banh tester 1', 'banhtester@gmail.com', NULL, '$2y$12$h2CYhIAl0f2VOK8rl.1HPOeTLrfKuK7KNcTyJ0oCxFYuRXJap6MO2', NULL, NULL, '0368706552', 'Số nhà 71, phố tiền phong, phường tiên cát', NULL, '2025-05-16', 'female', 0, NULL, 'active', NULL, '2025-05-25 18:46:03', '2025-05-25 18:46:03', NULL),
(34, 'banh tester 2', 'banhtester1@gmail.com', NULL, '$2y$12$UY/SPxHGU8zAS6IrhPYanetgotqTpTOV3jAkGtQQSI/bT3TLbzo5q', NULL, NULL, '0368706552', 'Số nhà 71, phố tiền phong, phường tiên cát', NULL, '2025-05-08', 'other', 0, NULL, 'active', NULL, '2025-05-25 18:50:41', '2025-05-25 18:50:41', NULL),
(35, 'banhtetsre', 'anhnnbph5q0226@gmail.com', NULL, '$2y$12$Cf0GYSxjgLZaKvBlRVdWhu29H.l.N4IcBt7j95hot.c49mZMT6fkq', NULL, NULL, '0368706552', 'Số nhà 71, phố tiền phong, phường tiên cát', NULL, '2025-05-16', 'male', 0, NULL, 'active', NULL, '2025-05-25 18:53:57', '2025-05-25 18:53:57', NULL),
(36, 'Bird Blog', 'birdblog@gmail.com', NULL, '$2y$12$PuMZty9.K0bsfo9Wjb2DcOevqS97eVslQIKc.qGmchBUBfRCzh0BK', NULL, NULL, '0368706552', 'Số nhà 71, phố tiền phong, phường tiên cát', NULL, '2025-05-16', 'female', 0, NULL, 'active', NULL, '2025-05-25 18:56:42', '2025-05-25 18:56:42', NULL),
(37, 'Bird Blog', 'birdblog2@gmail.com', NULL, '$2y$12$KB5b4cSc58LyMFevm02Qs.8pSQNPuibCGtijQukqJoTkwTYOYLsnu', NULL, NULL, '0368706552', 'Số nhà 71, phố tiền phong, phường tiên cát', NULL, '2025-05-16', 'female', 0, NULL, 'active', NULL, '2025-05-25 18:57:37', '2025-05-25 18:57:37', NULL),
(38, 'Bird Blog', 'birdblog3@gmail.com', NULL, '$2y$12$DdGqxTBlHv.ozo0oCYaY1up1s9tRoV.3M0Plw7m4QLdPcuelHwc.u', NULL, NULL, '0368706552', 'Số nhà 71, phố tiền phong, phường tiên cát', NULL, '2025-05-16', 'female', 0, NULL, 'active', NULL, '2025-05-25 18:58:01', '2025-05-25 18:58:01', NULL),
(39, 'banh dayy yeu em', 'banhday11@example.com', NULL, '$2y$12$KB.guIki4Wfdev8M1iOk5uvJceBBjtcJAArv30/jtVTLD9cwtPl8e', NULL, NULL, '0368706552', 'Số nhà 71, phố tiền phong, phường tiên cát', NULL, '2025-05-07', 'female', 0, NULL, 'active', NULL, '2025-05-25 23:20:54', '2025-05-25 23:20:54', NULL),
(40, 'bui quang dong', 'dongbui@gmail.com', NULL, '$2y$12$lENUgnn9oOJWPfSrQSrguucx9hzpikO7.IjgSduonsxBi/.T1jMjy', NULL, NULL, '0368706552', 'Số nhà 71, phố tiền phong, phường tiên cát', NULL, '2025-06-06', 'male', 0, NULL, 'active', NULL, '2025-05-26 08:45:25', '2025-05-26 08:45:25', NULL),
(41, 'Kim Hong Phong Dai', 'daicv@gmail.com', NULL, '$2y$12$JcBJQvn.Cffa3B/ohBz2v..4mW4hmeKceF9cYV3qtj55ZKy6.2WX6', NULL, NULL, '0368706552', 'Số nhà 71, phố tiền phong, phường tiên cát', NULL, '2025-05-21', 'male', 0, '2025-05-26 22:08:16', 'active', 'JHGQYfCLgyB1gD0ebHR1CSEclBpoAoJoKl9sxjHt9jFMkq3ENc4lU0cN8bHi', '2025-05-26 22:07:41', '2025-05-31 20:55:29', NULL),
(42, 'đại học coder', 'daichuvan95@gmail.com', NULL, '$2y$12$zabvva8SdzabLKbOkbzvKOxczOwxUaExwGePOUB3mjF7wlyA3B/V2', NULL, NULL, '0968791308', 'Vọng Giang', NULL, '2025-05-05', 'male', 0, '2025-06-16 13:47:32', 'inactive', NULL, '2025-05-28 14:57:13', '2025-06-16 13:47:32', NULL),
(43, 'Cường', 'test@gmail.com', NULL, '$2y$12$3n6LLncP6oIAforDGEkCKO5YEp/mhdvHQwK4UU2thehOUNRGmzBha', NULL, NULL, '09876543', 'Hà Nội', NULL, '2025-05-28', 'male', 0, '2025-06-16 14:06:32', 'active', NULL, '2025-05-28 22:46:16', '2025-06-16 14:06:32', NULL),
(44, 'banhdayyy', 'anh@gmail.com', NULL, '$2y$12$iL89MO6m8aJ6ytcW/gmKo.DM.6KpdA44E.QCUI.ZTtZ.u0iGCxNW2', NULL, NULL, '0368706552', 'asdsadas', NULL, '2025-05-15', 'male', 0, '2025-05-31 22:09:59', 'active', 'tR6P0OXUsCQtwboq9YCyaCdVdT2exORi6s27GcphWL6lhOk395FRM0vc8KCH', '2025-05-31 22:07:02', '2025-05-31 22:09:59', NULL),
(45, 'Thanh Bình Nguyễn', 'nguyenthanhbinh05082005@gmail.com', '2025-06-01 09:28:50', '$2y$12$Q0KzVz4F/HD5o609kbqZi.phhyITvFuXSEMqtOPFUpetszd6G0pkO', 'google', '102989406420602569869', NULL, NULL, 'https://lh3.googleusercontent.com/a/ACg8ocJ_1MC1lN0WwDtNb4x5D2AWjmSLm1k-R0V7TX3BrL80CWKlpw=s96-c', NULL, 'other', 0, NULL, 'active', NULL, '2025-06-01 09:28:50', '2025-06-01 09:28:50', NULL),
(52, 'banh dayy', 'banhday1234@gmail.com', NULL, '$2y$12$7WnXBp6SLBYwdJgmWWFG3eBlA/JskA4gLWGJjwAjBsvb2WI0NyatC', NULL, NULL, NULL, 'dfsdfadfas', NULL, '2025-05-28', 'female', 0, '2025-06-01 23:02:58', 'active', NULL, '2025-06-01 23:01:51', '2025-06-01 23:02:58', NULL),
(53, 'Banh Tester', 'remvaimankhung@gmail.com', '2025-06-01 23:03:19', '$2y$12$MObZpPjGNsoynBotx4F/Bee0hUiXpmi5IxZnwpsQXVXV1EWP03RKq', 'google', '116737877673519409445', NULL, NULL, 'https://lh3.googleusercontent.com/a/ACg8ocLU_9HP_drMj7OlbFgpvtPXOQO8NK0GHV8C4T4iyLUVbJIO9nk=s96-c', NULL, 'other', 0, '2025-06-01 23:03:19', 'active', NULL, '2025-06-01 23:03:19', '2025-06-01 23:03:19', NULL),
(55, 'Nguyễn Đình Khải PH 2 9 3 3 3', 'khaindph29333@fpt.edu.vn', '2025-06-06 21:17:28', '$2y$12$GNkUx1XICxiojX82LLoM2ud3ftUk.dPYacBjMvdfgXwoIvjRCaTl.', 'google', '108444160617922493293', NULL, NULL, 'https://lh3.googleusercontent.com/a/ACg8ocLB_WYRfUH-tTqs9HPYRbgRndrlJFdIr8zYaSrIKRWNpcfQvfs=s96-c', NULL, 'other', 0, '2025-06-06 21:25:54', 'active', NULL, '2025-06-06 21:17:28', '2025-06-06 21:25:54', NULL),
(56, 'banhday1', 'abc@gmail.com', NULL, '$2y$12$d4H0sg.1SmZsVo.v6ktX9.61m72Q0r0mQb2BSDe/BKb.ZCFgTk/NO', NULL, NULL, '0368706552', 'Số nhà 71, phố tiền phong, phường tiên cát', NULL, '2025-06-04', 'male', 0, '2025-06-08 11:48:16', 'active', NULL, '2025-06-08 10:43:19', '2025-06-08 11:48:16', NULL),
(57, 'Banhdayyy', 'anhnnbph50226@gmail.com', NULL, '$2y$12$p0rCIFebcRUrvdDscrh5tuYVSmgitAm8WLMGqYbH5w0bF.2y66cfi', NULL, NULL, '0368706552', 'Số nhà 71, phố tiền phong, phường tiên cát', NULL, '2025-06-18', 'female', 0, '2025-06-08 12:12:38', 'active', NULL, '2025-06-08 12:06:25', '2025-06-08 12:12:38', NULL),
(58, 'Thanh Bình Ford', 'fordthanhbinh@gmail.com', '2025-06-08 12:09:45', '$2y$12$MVlS.gw7VO4KCTMHtwBCM.Pv6Hnk4y4U75LE6naIlWY.Ju0EXP74i', 'google', '115646386580052762473', NULL, NULL, 'https://lh3.googleusercontent.com/a/ACg8ocJCXzWZLPJWJf0se5Ihc9PgsKzheh_qnnGQeZywKHuggYP9Wg=s96-c', NULL, 'other', 0, '2025-06-08 12:09:45', 'active', NULL, '2025-06-08 12:09:45', '2025-06-08 12:09:45', NULL),
(59, 'banhdayma', 'banhday@gmail.com', NULL, '$2y$12$4uDWY9yd25Cx0Jun7kR/EOaJDHVlUSIp5xT2v2St6EC/qZLJ57mai', NULL, NULL, '0368706552', 'Số nhà 71, phố tiền phong, phường tiên cát', NULL, '2025-06-04', 'male', 0, '2025-06-09 22:26:36', 'active', NULL, '2025-06-09 22:26:19', '2025-06-09 22:26:36', NULL),
(60, 'banhyeuem', 'banhyeuem@gmail.com', NULL, '$2y$12$0U17mgBRX225yanhsVAwPOidg2gzlDECRNr5MGd.4EldKlchMqFO.', NULL, NULL, '0368706552', 'Số nhà 71, phố tiền phong, phường tiên cát', NULL, '2025-06-10', 'male', 0, NULL, 'active', NULL, '2025-06-09 22:51:06', '2025-06-09 22:51:06', NULL),
(61, 'binhyeuphong', 'binhyeuphong@gmail.com', NULL, '$2y$12$tEVruqGNCejb6oz7crjL/OFo7AXFnIefNU5xRzoJLRj8K4WRHTq4C', NULL, NULL, '0368706552', 'Số nhà 71, phố tiền phong, phường tiên cát', NULL, '2025-06-03', 'male', 0, NULL, 'active', NULL, '2025-06-09 22:56:06', '2025-06-09 22:56:06', NULL),
(62, 'phongyeudai', 'phongyeudai@gmail.com', NULL, '$2y$12$zHwmHrzH88wqN3CG.UBm/u.CKCrSWv7EDrYgt1sBaMmcANr31H3yi', NULL, NULL, '0368706552', 'Số nhà 71, phố tiền phong, phường tiên cát', NULL, '2025-06-18', 'male', 0, NULL, 'active', NULL, '2025-06-09 23:09:33', '2025-06-09 23:09:33', NULL),
(63, 'quangyeuphong', 'quangyeuphong@gmail.com', NULL, '$2y$12$dZuU8hy9qkEUF2EGPUEahu/.7JQqRSJi.BnKp8epraxCJbtHR06xS', NULL, NULL, '0368706552', 'Số nhà 71, phố tiền phong, phường tiên cát', NULL, '2025-05-28', 'male', 0, NULL, 'active', NULL, '2025-06-09 23:10:26', '2025-06-09 23:10:26', NULL),
(64, 'banhyeumoinguoilam', 'banhyeumoinguoilam@gmail.com', NULL, '$2y$12$WU2ZrEy9C7DPUY73s209pul63Jm.Gjz4ZU8EU5xS7TADWGU.GMf76', NULL, NULL, '0368706552', 'Số nhà 71, phố tiền phong, phường tiên cát', NULL, '2025-05-28', 'male', 0, NULL, 'active', NULL, '2025-06-09 23:17:32', '2025-06-09 23:17:32', NULL),
(65, 'banhyeuem1', 'anhnnbph5022611@gmail.com', NULL, '$2y$12$trPYJb39U.BWslPdzF.Eh.hTgCpJ/9cTn4NbgvbdG/Gix5X.6rE6y', NULL, NULL, '0368706552', 'Số nhà 71, phố tiền phong, phường tiên cát', NULL, '2025-05-28', 'male', 0, NULL, 'active', NULL, '2025-06-09 23:19:07', '2025-06-09 23:19:07', NULL),
(66, 'banhyeuyeu', 'banhyeuyeu@gmail.com', NULL, '$2y$12$voGS1RNOqE2v1uEf98WUZOvb3sKdIdk2MQ67fCId.tySPtrvKub8S', NULL, NULL, '0368706552', 'Số nhà 71, phố tiền phong, phường tiên cát', NULL, '2025-06-03', 'male', 0, NULL, 'active', NULL, '2025-06-09 23:20:30', '2025-06-09 23:20:30', NULL),
(67, 'chuanfifai', 'banh1@gmail.com', NULL, '$2y$12$19SaKtTpXvCNJmcq/Pq/.OsuypGWwXfzIyGwu0u5KrAzE6oHvQkR6', NULL, NULL, '0368706552', 'Số nhà 71, phố tiền phong, phường tiên cát', NULL, '2025-06-03', 'male', 0, '2025-06-09 23:25:44', 'active', 'y54zDVHyxk4eUaRmT0dfWuR1XaM9BzobKAC46dzvdgcr4Cr0RHTaysFotGaC', '2025-06-09 23:25:01', '2025-06-09 23:25:44', NULL),
(68, 'banh2', 'banh2@gmail.com', NULL, '$2y$12$5zQ/FCKyacb5iFQikTHqZObDA1laqePq0ttpuxkiY8E6YBBpya/3O', NULL, NULL, '0368706552', 'Số nhà 71, phố tiền phong, phường tiên cát', NULL, '2025-06-10', 'female', 0, '2025-06-09 23:26:16', 'active', NULL, '2025-06-09 23:26:10', '2025-06-09 23:26:16', NULL),
(69, 'banh3', 'banh3@gmail.com', NULL, '$2y$12$WOihTFzKzHXwyS/ws4TXzOHXLLIJd4/E9.AIOjJqDd85fsXSdkVL6', NULL, NULL, '0368706552', 'Số nhà 71, phố tiền phong, phường tiên cát', NULL, '2025-06-05', 'male', 0, NULL, 'active', NULL, '2025-06-09 23:26:45', '2025-06-09 23:26:45', NULL),
(70, 'banh4', 'banh4@gmail.com', NULL, '$2y$12$LA9.5uLFmc73niHHOwDa5.YXjQlShsndDWiXi/MFb1gnFMWjNFQY6', NULL, NULL, '0368706552', 'Số nhà 71, phố tiền phong, phường tiên cát', NULL, '2025-06-04', 'male', 0, '2025-06-10 21:22:26', 'active', NULL, '2025-06-09 23:30:10', '2025-06-10 21:52:38', NULL),
(71, 'Kim Hồng Phong', 'phongk211005@gmail.com', NULL, '$2y$12$rp7twYOYmt9jty9fCUq0qO2soMHTXLPH48ctJ/EtAVj3bLvB6qX56', NULL, NULL, '0973067464', 'Tx. Thái Hòa', NULL, '2025-06-11', 'male', 0, '2025-06-16 08:32:40', 'active', NULL, '2025-06-11 08:41:22', '2025-06-16 08:32:40', NULL),
(72, 'Sasasa', 'sasa@gmail.com', NULL, '$2y$12$fgOECBmANwtUwB5yXtKzMe/XE788BzJ9a6yxxFLew4m4vzGiUX2jy', NULL, NULL, '0987233444', 'Hà Nội, Việt Nam', 'uploads/users/1749606552.jpg', '2025-06-11', 'male', 0, '2025-06-11 08:59:52', 'active', NULL, '2025-06-11 08:49:12', '2025-06-11 08:59:52', NULL),
(73, 'Dớ Văn Hải', 'hai@gmail.com', NULL, '$2y$12$f8RGEGkRociQvEe4rZP8guR3K3E9HPT6fNn8NF1Hc37OsipBkcKeu', NULL, NULL, '0973067464', 'Tx. Thái Hòa', 'uploads/users/1749608295.jpg', '2025-06-27', 'male', 0, '2025-06-14 22:04:40', 'active', NULL, '2025-06-11 09:18:15', '2025-06-14 22:04:40', NULL),
(74, 'Banh là tester', 'banhtester3@gmail.com', NULL, '$2y$12$MU1poTdfxhsbpDKz.Befbedmry0wSyE50fwye.OxAiX.gupl//ZJ6', NULL, NULL, '0368706552', 'Số nhà 71, phố tiền phong, phường tiên cát', '/uploads/avatar/1749632129.jpg', '2025-05-29', 'male', 0, '2025-06-13 21:29:03', 'active', NULL, '2025-06-11 09:25:05', '2025-06-13 21:29:03', NULL),
(75, 'âsasd', 'aad@gmail.com', NULL, '$2y$12$vcmY9KDXL7TpT4L6opulIut6rPi/4Bg61u3km4ggB6c/OoG3fUCUm', NULL, NULL, '0368706552', 'Số nhà 71, phố tiền phong, phường tiên cát', NULL, '2025-06-04', 'male', 0, NULL, 'active', NULL, '2025-06-11 21:13:06', '2025-06-11 21:13:06', NULL),
(76, 'Mạnh Cường Nguyễn', 'cuongnmph50179@gmail.com', '2025-06-13 21:22:09', '$2y$12$7Bv46Tz3cGlclwO0NGvnROs1LsyWeEeHjQslPzN8qiqvA7u0X8vK6', 'google', '104624917371279928945', NULL, NULL, 'https://lh3.googleusercontent.com/a/ACg8ocK0-i1PegLtv3q4m1wr9zz-1ijX0PlHybhgc1wCGlNH99DdJQ=s96-c', NULL, 'other', 0, '2025-06-13 21:22:09', 'active', NULL, '2025-06-13 21:22:09', '2025-06-13 21:22:09', NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `user_addresses`
--

CREATE TABLE `user_addresses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `fullname` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address_line` text COLLATE utf8mb4_unicode_ci,
  `city` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `district` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ward` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `postal_code` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_default` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `user_vouchers`
--

CREATE TABLE `user_vouchers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `voucher_id` bigint(20) UNSIGNED NOT NULL,
  `used_times` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
(64, 'Dung lượng', '[\"25\", \"26\", \"27\", \"28\"]', 'text', 0, 'active', '2025-06-16 13:52:28', '2025-06-16 13:52:28', NULL);

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
(145, 64, '[\"256GB\"]', '[]', 'active', '2025-06-16 13:52:53', '2025-06-16 13:52:53', NULL),
(146, 64, '[\"512GB\"]', '[]', 'active', '2025-06-16 13:52:53', '2025-06-16 13:52:53', NULL),
(147, 64, '[\"1TB\"]', '[]', 'active', '2025-06-16 13:52:53', '2025-06-16 13:52:53', NULL);

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
(245, 192, 141, '2025-06-16 14:29:02', '2025-06-16 15:01:58', '2025-06-16 15:01:58'),
(246, 192, 145, '2025-06-16 14:29:02', '2025-06-16 15:01:58', '2025-06-16 15:01:58'),
(247, 193, 142, '2025-06-16 14:29:02', '2025-06-16 15:01:58', '2025-06-16 15:01:58'),
(248, 193, 145, '2025-06-16 14:29:02', '2025-06-16 15:01:58', '2025-06-16 15:01:58'),
(249, 196, 141, '2025-06-16 15:14:16', '2025-06-16 15:14:16', NULL),
(250, 196, 145, '2025-06-16 15:14:16', '2025-06-16 15:14:16', NULL),
(251, 197, 141, '2025-06-16 15:14:16', '2025-06-16 15:14:16', NULL),
(252, 197, 146, '2025-06-16 15:14:17', '2025-06-16 15:14:17', NULL),
(253, 198, 141, '2025-06-16 15:14:17', '2025-06-16 15:14:17', NULL),
(254, 198, 147, '2025-06-16 15:14:17', '2025-06-16 15:14:17', NULL),
(255, 199, 142, '2025-06-16 15:14:17', '2025-06-16 15:14:17', NULL),
(256, 199, 145, '2025-06-16 15:14:17', '2025-06-16 15:14:17', NULL),
(257, 200, 142, '2025-06-16 15:14:17', '2025-06-16 15:14:17', NULL),
(258, 200, 146, '2025-06-16 15:14:17', '2025-06-16 15:14:17', NULL),
(259, 201, 142, '2025-06-16 15:14:17', '2025-06-16 15:14:17', NULL),
(260, 201, 147, '2025-06-16 15:14:17', '2025-06-16 15:14:17', NULL),
(261, 202, 143, '2025-06-16 15:14:17', '2025-06-16 15:14:17', NULL),
(262, 202, 145, '2025-06-16 15:14:17', '2025-06-16 15:14:17', NULL),
(263, 203, 143, '2025-06-16 15:14:17', '2025-06-16 15:14:17', NULL),
(264, 203, 146, '2025-06-16 15:14:17', '2025-06-16 15:14:17', NULL),
(265, 204, 143, '2025-06-16 15:14:17', '2025-06-16 15:14:17', NULL),
(266, 204, 147, '2025-06-16 15:14:17', '2025-06-16 15:14:17', NULL),
(267, 205, 144, '2025-06-16 15:14:17', '2025-06-16 15:14:17', NULL),
(268, 205, 145, '2025-06-16 15:14:17', '2025-06-16 15:14:17', NULL),
(269, 206, 144, '2025-06-16 15:14:17', '2025-06-16 15:14:17', NULL),
(270, 206, 146, '2025-06-16 15:14:17', '2025-06-16 15:14:17', NULL),
(271, 207, 144, '2025-06-16 15:14:17', '2025-06-16 15:14:17', NULL),
(272, 207, 147, '2025-06-16 15:14:17', '2025-06-16 15:14:17', NULL);

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
  `value` decimal(10,2) NOT NULL,
  `min_order_amount` decimal(10,2) DEFAULT NULL,
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
(5, 'WELCOME10', 'percentage', 'product_discount', 'Giảm 10% cho đơn hàng đầu tiên.', 10.00, NULL, '2025-06-19 07:27:09', 100, 0, 1, 1, '2025-05-20 07:27:09', '2025-05-20 07:27:09'),
(6, 'FREESHIP', 'fixed', 'free_shipping', 'Miễn phí vận chuyển cho đơn hàng trên 200,000 VNĐ.', 50000.00, NULL, '2025-06-19 07:27:09', 100, 0, 1, 1, '2025-05-20 07:27:11', '2025-05-20 07:27:11'),
(7, 'SUMMER20', 'percentage', 'product_discount', 'Giảm giá 20% mùa hè.', 20.00, NULL, '2025-06-19 07:27:09', 100, 0, 0, 1, '2025-05-20 07:27:18', '2025-05-20 07:27:18'),
(8, 'NOEXPIRE', 'fixed', 'product_discount', 'Voucher không giới hạn thời gian.', 100000.00, NULL, '2025-06-19 07:27:09', 100, 0, 1, 1, '2025-05-20 07:27:19', '2025-05-20 07:27:19');

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
  ADD KEY `orders_shipping_method_id_foreign` (`shipping_method_id`);

--
-- Chỉ mục cho bảng `order_details`
--
ALTER TABLE `order_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_details_order_id_foreign` (`order_id`),
  ADD KEY `order_details_variant_id_foreign` (`variant_id`);

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
  ADD KEY `product_reviews_product_id_foreign` (`product_id`),
  ADD KEY `product_reviews_user_id_foreign` (`user_id`);

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
-- Chỉ mục cho bảng `search_histories`
--
ALTER TABLE `search_histories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `search_histories_user_id_foreign` (`user_id`);

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
-- Chỉ mục cho bảng `stock_adjustments`
--
ALTER TABLE `stock_adjustments`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `stock_adjustments_code_unique` (`code`),
  ADD KEY `stock_adjustments_approved_by_foreign` (`approved_by`),
  ADD KEY `stock_adjustments_created_by_foreign` (`created_by`),
  ADD KEY `stock_adjustments_code_index` (`code`),
  ADD KEY `stock_adjustments_type_index` (`type`),
  ADD KEY `stock_adjustments_status_index` (`status`),
  ADD KEY `stock_adjustments_created_at_index` (`created_at`);

--
-- Chỉ mục cho bảng `stock_adjustment_items`
--
ALTER TABLE `stock_adjustment_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `stock_adjustment_items_adjustment_id_foreign` (`adjustment_id`),
  ADD KEY `stock_adjustment_items_variant_id_index` (`variant_id`);

--
-- Chỉ mục cho bảng `stock_movements`
--
ALTER TABLE `stock_movements`
  ADD PRIMARY KEY (`id`),
  ADD KEY `stock_movements_variant_id_foreign` (`variant_id`),
  ADD KEY `stock_movements_created_by_foreign` (`created_by`),
  ADD KEY `stock_movements_reference_type_reference_id_index` (`reference_type`,`reference_id`),
  ADD KEY `stock_movements_type_index` (`type`),
  ADD KEY `stock_movements_created_at_index` (`created_at`);

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
-- Chỉ mục cho bảng `user_addresses`
--
ALTER TABLE `user_addresses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_addresses_user_id_foreign` (`user_id`);

--
-- Chỉ mục cho bảng `user_vouchers`
--
ALTER TABLE `user_vouchers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_vouchers_user_id_voucher_id_unique` (`user_id`,`voucher_id`),
  ADD KEY `user_vouchers_voucher_id_foreign` (`voucher_id`);

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT cho bảng `cart_items`
--
ALTER TABLE `cart_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=105;

--
-- AUTO_INCREMENT cho bảng `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT cho bảng `contacts`
--
ALTER TABLE `contacts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT cho bảng `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=70;

--
-- AUTO_INCREMENT cho bảng `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=284;

--
-- AUTO_INCREMENT cho bảng `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=143;

--
-- AUTO_INCREMENT cho bảng `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=93;

--
-- AUTO_INCREMENT cho bảng `order_details`
--
ALTER TABLE `order_details`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `order_items`
--
ALTER TABLE `order_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=96;

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=148;

--
-- AUTO_INCREMENT cho bảng `product_reviews`
--
ALTER TABLE `product_reviews`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `product_specifications`
--
ALTER TABLE `product_specifications`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=288;

--
-- AUTO_INCREMENT cho bảng `product_variants`
--
ALTER TABLE `product_variants`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=208;

--
-- AUTO_INCREMENT cho bảng `product_views`
--
ALTER TABLE `product_views`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=199;

--
-- AUTO_INCREMENT cho bảng `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT cho bảng `search_histories`
--
ALTER TABLE `search_histories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

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
-- AUTO_INCREMENT cho bảng `stock_adjustments`
--
ALTER TABLE `stock_adjustments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `stock_adjustment_items`
--
ALTER TABLE `stock_adjustment_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `stock_movements`
--
ALTER TABLE `stock_movements`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `subscribers`
--
ALTER TABLE `subscribers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT cho bảng `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=77;

--
-- AUTO_INCREMENT cho bảng `user_addresses`
--
ALTER TABLE `user_addresses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `user_vouchers`
--
ALTER TABLE `user_vouchers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `variant_attribute_types`
--
ALTER TABLE `variant_attribute_types`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=65;

--
-- AUTO_INCREMENT cho bảng `variant_attribute_values`
--
ALTER TABLE `variant_attribute_values`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=148;

--
-- AUTO_INCREMENT cho bảng `variant_combinations`
--
ALTER TABLE `variant_combinations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=273;

--
-- AUTO_INCREMENT cho bảng `vouchers`
--
ALTER TABLE `vouchers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT cho bảng `wishlists`
--
ALTER TABLE `wishlists`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=111;

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
  ADD CONSTRAINT `orders_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Các ràng buộc cho bảng `order_details`
--
ALTER TABLE `order_details`
  ADD CONSTRAINT `order_details_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `order_details_variant_id_foreign` FOREIGN KEY (`variant_id`) REFERENCES `product_variants` (`id`) ON DELETE CASCADE;

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
-- Các ràng buộc cho bảng `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`);

--
-- Các ràng buộc cho bảng `product_reviews`
--
ALTER TABLE `product_reviews`
  ADD CONSTRAINT `product_reviews_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `product_reviews_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

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
-- Các ràng buộc cho bảng `search_histories`
--
ALTER TABLE `search_histories`
  ADD CONSTRAINT `search_histories_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Các ràng buộc cho bảng `stock_adjustments`
--
ALTER TABLE `stock_adjustments`
  ADD CONSTRAINT `stock_adjustments_approved_by_foreign` FOREIGN KEY (`approved_by`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `stock_adjustments_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`);

--
-- Các ràng buộc cho bảng `stock_adjustment_items`
--
ALTER TABLE `stock_adjustment_items`
  ADD CONSTRAINT `stock_adjustment_items_adjustment_id_foreign` FOREIGN KEY (`adjustment_id`) REFERENCES `stock_adjustments` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `stock_adjustment_items_variant_id_foreign` FOREIGN KEY (`variant_id`) REFERENCES `product_variants` (`id`) ON DELETE CASCADE;

--
-- Các ràng buộc cho bảng `stock_movements`
--
ALTER TABLE `stock_movements`
  ADD CONSTRAINT `stock_movements_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `stock_movements_variant_id_foreign` FOREIGN KEY (`variant_id`) REFERENCES `product_variants` (`id`) ON DELETE CASCADE;

--
-- Các ràng buộc cho bảng `user_addresses`
--
ALTER TABLE `user_addresses`
  ADD CONSTRAINT `user_addresses_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Các ràng buộc cho bảng `user_vouchers`
--
ALTER TABLE `user_vouchers`
  ADD CONSTRAINT `user_vouchers_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `user_vouchers_voucher_id_foreign` FOREIGN KEY (`voucher_id`) REFERENCES `vouchers` (`id`);

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
