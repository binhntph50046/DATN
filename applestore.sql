-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: localhost
-- Thời gian đã tạo: Th6 23, 2025 lúc 11:16 AM
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
(108, 2, 152, 240, 3),
(109, 2, 152, 239, 1),
(111, 5, 155, 245, 1);

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
(30, 'Phụ kiện', 'phu-kien', NULL, 6, 'active', 1, 'uploads/categories/1750055957_Danh mục Phụ kiện.png', '2025-06-16 13:39:17', '2025-06-16 13:39:17', NULL),
(31, 'asdasdd', 'asdasdd', NULL, 7, 'active', 1, 'uploads/categories/1750478975_iphone-16-pro-max-16-titan-tu-nhien-thumbnew-650x650.png', '2025-06-21 11:09:35', '2025-06-21 11:09:35', NULL);

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
(53, 70, 'INV000070', 12999999.00, NULL, '2025-06-15 23:49:44', NULL, '2025-06-15 23:49:44', '2025-06-15 23:49:44'),
(56, 73, 'INV000073', 34333.00, NULL, '2025-06-15 23:57:28', NULL, '2025-06-15 23:57:28', '2025-06-15 23:57:28'),
(57, 74, 'INV000074', 34333.00, NULL, '2025-06-15 23:58:24', NULL, '2025-06-15 23:58:24', '2025-06-15 23:58:24'),
(58, 75, 'INV000075', 34333.00, NULL, '2025-06-16 00:02:19', NULL, '2025-06-16 00:02:19', '2025-06-16 00:02:19'),
(59, 76, 'INV000076', 12999999.00, NULL, '2025-06-16 00:09:41', NULL, '2025-06-16 00:09:41', '2025-06-16 00:09:41'),
(60, 77, 'INV000077', 12999999.00, NULL, '2025-06-16 00:13:26', NULL, '2025-06-16 00:13:26', '2025-06-16 00:13:26'),
(61, 81, 'INV000081', 34333.00, NULL, '2025-06-16 00:31:38', NULL, '2025-06-16 00:31:38', '2025-06-16 00:31:38'),
(62, 82, 'INV000082', 34333.00, NULL, '2025-06-16 00:32:27', NULL, '2025-06-16 00:32:27', '2025-06-16 00:32:27'),
(63, 84, 'INV000084', 34333.00, NULL, '2025-06-16 00:34:42', NULL, '2025-06-16 00:34:42', '2025-06-16 00:34:42'),
(64, 85, 'INV000085', 12999999.00, NULL, '2025-06-16 00:35:28', NULL, '2025-06-16 00:35:28', '2025-06-16 00:35:28'),
(65, 88, 'INV000088', 34333.00, NULL, '2025-06-16 01:00:09', NULL, '2025-06-16 01:00:09', '2025-06-16 01:00:09'),
(70, 93, 'INV000093', 12345.00, NULL, '2025-06-16 15:27:36', NULL, '2025-06-16 15:27:36', '2025-06-16 15:27:36'),
(71, 94, 'INV000094', 2345678.00, NULL, '2025-06-16 22:58:34', NULL, '2025-06-16 22:58:34', '2025-06-16 22:58:34'),
(72, 95, 'INV000095', 555.00, NULL, '2025-06-17 22:45:55', NULL, '2025-06-17 22:45:55', '2025-06-17 22:45:55'),
(73, 96, 'INV000096', 55125.00, NULL, '2025-06-18 15:25:23', NULL, '2025-06-18 15:25:23', '2025-06-18 15:25:23'),
(74, 97, 'INV000097', 222.00, NULL, '2025-06-19 14:18:33', NULL, '2025-06-19 14:18:33', '2025-06-19 14:18:33'),
(75, 98, 'INV000098', 111.00, NULL, '2025-06-19 22:38:28', NULL, '2025-06-19 22:38:28', '2025-06-19 22:38:28'),
(76, 99, 'INV000099', 333.00, NULL, '2025-06-23 10:07:30', NULL, '2025-06-23 10:07:30', '2025-06-23 10:07:30');

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
(142, '2025_06_14_124031_create_product_views_table', 82),
(145, '2025_06_18_204617_add_timestamps_to_sessions_table', 83),
(146, '2025_06_18_212622_create_page_views_table', 84),
(147, '2025_06_18_213851_add_user_id_to_page_views_table', 85),
(148, '2025_06_19_180946_update_product_reviews_add_images_and_variant_id', 86),
(149, '2025_06_21_155812_add_session_id_to_page_views_table', 87),
(150, '2025_06_21_170918_add_voucher_fields_to_orders_table', 88),
(151, '2025_06_23_091415_create_shipping_orders_table', 89);

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
(3, 'App\\Models\\User', 77);

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
  `discount_amount` decimal(10,2) NOT NULL DEFAULT '0.00',
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

INSERT INTO `orders` (`id`, `order_code`, `user_id`, `voucher_id`, `voucher_code`, `discount_amount`, `subtotal`, `discount`, `shipping_fee`, `total_price`, `refunded_amount`, `shipping_address`, `shipping_name`, `shipping_phone`, `shipping_email`, `payment_method`, `payment_status`, `shipping_method_id`, `status`, `is_paid`, `notes`, `cancel_reason`, `created_at`, `updated_at`, `deleted_at`) VALUES
(70, 'DH70', 42, NULL, NULL, 0.00, 12999999.00, 0.00, 0.00, 12999999.00, 0.00, 'Vọng Giang', 'đại học coder', '0968791308', 'daichuvan95@gmail.com', 'vnpay', 'pending', NULL, 'pending', 0, NULL, NULL, '2025-06-15 23:49:44', '2025-06-15 23:49:44', NULL),
(73, 'ORD202506159519', 42, NULL, NULL, 0.00, 34333.00, 0.00, 0.00, 34333.00, 0.00, 'Vọng Giang', 'đại học coder ', '0968791308', 'daichuvan95@gmail.com', 'vnpay', 'pending', NULL, 'pending', 0, NULL, NULL, '2025-06-15 23:57:28', '2025-06-15 23:57:28', NULL),
(74, 'DH74', 42, NULL, NULL, 0.00, 34333.00, 0.00, 0.00, 34333.00, 0.00, 'Vọng Giang', 'đại học coder', '0968791308', 'daichuvan95@gmail.com', 'vnpay', 'pending', NULL, 'pending', 0, NULL, NULL, '2025-06-15 23:58:23', '2025-06-15 23:58:23', NULL),
(75, 'DH75', 42, NULL, NULL, 0.00, 34333.00, 0.00, 0.00, 34333.00, 0.00, 'Vọng Giang', 'đại học coder', '0968791308', 'daichuvan95@gmail.com', 'vnpay', 'pending', NULL, 'pending', 0, NULL, NULL, '2025-06-16 00:02:19', '2025-06-16 00:02:19', NULL),
(76, 'ORD202506168114', 42, NULL, NULL, 0.00, 12999999.00, 0.00, 0.00, 12999999.00, 0.00, 'Vọng Giang', 'đại học coder ', '0968791308', 'daichuvan95@gmail.com', 'vnpay', 'pending', NULL, 'pending', 0, NULL, NULL, '2025-06-16 00:09:41', '2025-06-16 00:09:41', NULL),
(77, 'DH77', 42, NULL, NULL, 0.00, 12999999.00, 0.00, 0.00, 12999999.00, 0.00, 'Vọng Giang', 'đại học coder', '0968791308', 'daichuvan95@gmail.com', 'vnpay', 'pending', NULL, 'pending', 0, NULL, NULL, '2025-06-16 00:13:26', '2025-06-16 00:13:26', NULL),
(78, 'DH78', 42, NULL, NULL, 0.00, 12999999.00, 0.00, 0.00, 12999999.00, 0.00, 'Vọng Giang', 'đại học coder', '0968791308', 'daichuvan95@gmail.com', 'vnpay', 'pending', NULL, 'cancelled', 0, NULL, 'tôi cần thay đổi phương thức thanh toán xxx', '2025-06-16 00:16:57', '2025-06-16 00:30:18', NULL),
(79, 'DH79', 42, NULL, NULL, 0.00, 12999999.00, 0.00, 0.00, 12999999.00, 0.00, 'Vọng Giang', 'đại học coder', '0968791308', 'daichuvan95@gmail.com', 'vnpay', 'paid', NULL, 'confirmed', 1, NULL, NULL, '2025-06-16 00:23:11', '2025-06-16 00:24:04', NULL),
(80, 'DH80', 42, NULL, NULL, 0.00, 34333.00, 0.00, 0.00, 34333.00, 0.00, 'Vọng Giang', 'đại học coder', '0968791308', 'daichuvan95@gmail.com', 'vnpay', 'paid', NULL, 'confirmed', 1, NULL, NULL, '2025-06-16 00:29:31', '2025-06-16 00:29:59', NULL),
(81, 'ORD202506162345', 42, NULL, NULL, 0.00, 34333.00, 0.00, 0.00, 34333.00, 0.00, 'Vọng Giang', 'đại học coder ', '0968791308', 'daichuvan95@gmail.com', 'vnpay', 'pending', NULL, 'pending', 0, NULL, NULL, '2025-06-16 00:31:38', '2025-06-16 00:31:38', NULL),
(82, 'ORD202506165008', 42, NULL, NULL, 0.00, 34333.00, 0.00, 0.00, 34333.00, 0.00, 'Vọng Giang', 'đại học coder ', '0968791308', 'daichuvan95@gmail.com', 'vnpay', 'paid', NULL, 'confirmed', 1, NULL, NULL, '2025-06-16 00:32:27', '2025-06-16 00:33:17', NULL),
(83, 'DH83', 42, NULL, NULL, 0.00, 12999999.00, 0.00, 0.00, 12999999.00, 0.00, 'Vọng Giang', 'đại học coder', '0968791308', 'daichuvan95@gmail.com', 'vnpay', 'paid', NULL, 'confirmed', 1, NULL, NULL, '2025-06-16 00:33:47', '2025-06-16 00:34:12', NULL),
(84, 'DH84', 42, NULL, NULL, 0.00, 34333.00, 0.00, 0.00, 34333.00, 0.00, 'Vọng Giang', 'đại học coder', '0968791308', 'daichuvan95@gmail.com', 'cod', 'pending', NULL, 'pending', 0, NULL, NULL, '2025-06-16 00:34:42', '2025-06-16 00:34:42', NULL),
(85, 'DH85', 42, NULL, NULL, 0.00, 12999999.00, 0.00, 0.00, 12999999.00, 0.00, 'Vọng Giang', 'đại học coder', '0968791308', 'daichuvan95@gmail.com', 'cod', 'pending', NULL, 'pending', 0, NULL, NULL, '2025-06-16 00:35:28', '2025-06-16 00:35:28', NULL),
(86, 'DH86', 42, NULL, NULL, 0.00, 26799997.00, 0.00, 0.00, 26799997.00, 0.00, 'Vọng Giang', 'đại học coder', '0968791308', 'daichuvan95@gmail.com', 'vnpay', 'paid', NULL, 'confirmed', 1, NULL, NULL, '2025-06-16 00:43:50', '2025-06-16 00:44:19', NULL),
(87, 'DH87', 42, NULL, NULL, 0.00, 13068665.00, 0.00, 0.00, 13068665.00, 0.00, 'Vọng Giang', 'đại học coder', '0968791308', 'daichuvan95@gmail.com', 'vnpay', 'paid', NULL, 'completed', 1, NULL, NULL, '2025-06-16 00:53:12', '2025-06-17 22:50:27', NULL),
(88, 'DH88', 42, NULL, NULL, 0.00, 34333.00, 0.00, 0.00, 34333.00, 0.00, 'Vọng Giang', 'đại học coder', '0968791308', 'daichuvan95@gmail.com', 'cod', 'pending', NULL, 'pending', 0, NULL, NULL, '2025-06-16 01:00:09', '2025-06-16 01:00:09', NULL),
(93, 'DH93', 43, NULL, NULL, 0.00, 12345.00, 0.00, 0.00, 12345.00, 0.00, 'Hà Nội', 'Cường', '0987654321', 'test@gmail.com', 'cod', 'pending', NULL, 'pending', 0, NULL, NULL, '2025-06-16 15:27:36', '2025-06-16 15:27:36', NULL),
(94, 'DH94', 43, NULL, NULL, 0.00, 2345678.00, 0.00, 0.00, 2345678.00, 0.00, 'Hà Nội', 'Cường', '0987654311', 'test@gmail.com', 'cod', 'pending', NULL, 'pending', 0, NULL, NULL, '2025-06-16 22:58:34', '2025-06-16 22:58:34', NULL),
(95, 'DH95', 43, NULL, NULL, 0.00, 35555555.00, 0.00, 0.00, 35555555.00, 0.00, 'Hà Nội', 'Cường', '0987654321', 'test@gmail.com', 'cod', 'paid', NULL, 'completed', 0, NULL, NULL, '2025-06-17 22:45:55', '2025-06-17 22:53:27', NULL),
(96, 'DH96', NULL, NULL, NULL, 0.00, 55125.00, 0.00, 0.00, 55125.00, 0.00, 'Vọng Giang', 'đại học coder', '0368706552', 'user98@gmail.com', 'cod', 'paid', NULL, 'completed', 0, NULL, NULL, '2025-06-18 15:25:23', '2025-06-18 15:25:23', NULL),
(97, 'DH97', NULL, NULL, NULL, 0.00, 222.00, 0.00, 0.00, 222.00, 0.00, 'Nam từ liêm hà nội', 'bình', '0968791306', 'user98@gmail.com', 'cod', 'pending', NULL, 'pending', 0, NULL, NULL, '2025-06-19 14:18:33', '2025-06-19 14:18:33', NULL),
(98, 'DH98', 43, NULL, NULL, 0.00, 111.00, 0.00, 0.00, 111.00, 0.00, 'Hà Nội', 'Cường', '0987654311', 'test@gmail.com', 'cod', 'pending', NULL, 'pending', 0, NULL, NULL, '2025-06-19 22:38:28', '2025-06-19 22:38:28', NULL),
(99, 'DH99', 71, NULL, NULL, 0.00, 333.00, 0.00, 0.00, 333.00, 0.00, 'Tx. Thái Hòa', 'Kim Hồng Phong', '0973067464', 'phongk211005@gmail.com', 'cod', 'pending', NULL, 'pending', 0, NULL, NULL, '2025-06-23 10:07:30', '2025-06-23 10:07:30', NULL);

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

--
-- Đang đổ dữ liệu cho bảng `order_items`
--

INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `product_variant_id`, `quantity`, `price`, `total`, `created_at`, `updated_at`, `deleted_at`) VALUES
(98, 95, 152, 239, 1, 555.00, 555.00, '2025-06-17 22:45:55', '2025-06-17 22:45:55', NULL),
(99, 96, 152, 239, 1, 55125.00, 55125.00, '2025-06-18 15:25:23', '2025-06-18 15:25:23', NULL),
(100, 97, 155, 245, 1, 222.00, 222.00, '2025-06-19 14:18:33', '2025-06-19 14:18:33', NULL),
(101, 98, 153, 243, 1, 111.00, 111.00, '2025-06-19 22:38:28', '2025-06-19 22:38:28', NULL),
(102, 99, 154, 244, 1, 333.00, 333.00, '2025-06-23 10:07:30', '2025-06-23 10:07:30', NULL);

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
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `page_views`
--

INSERT INTO `page_views` (`id`, `session_id`, `user_id`, `url`, `ip_address`, `user_agent`, `created_at`, `updated_at`) VALUES
(1, NULL, NULL, 'http://127.0.0.1:8000', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36 Edg/137.0.0.0', '2025-06-18 21:35:59', '2025-06-18 21:35:59'),
(2, NULL, NULL, 'http://127.0.0.1:8000', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36 Edg/137.0.0.0', '2025-06-18 21:40:10', '2025-06-18 21:40:10'),
(3, NULL, NULL, 'http://127.0.0.1:8000/logout', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36 Edg/137.0.0.0', '2025-06-18 21:40:20', '2025-06-18 21:40:20'),
(4, NULL, NULL, 'http://127.0.0.1:8000/login', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36 Edg/137.0.0.0', '2025-06-18 21:40:21', '2025-06-18 21:40:21'),
(5, NULL, NULL, 'http://127.0.0.1:8000/login', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36 Edg/137.0.0.0', '2025-06-18 21:40:27', '2025-06-18 21:40:27'),
(6, NULL, NULL, 'http://127.0.0.1:8000', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36 Edg/137.0.0.0', '2025-06-18 21:40:28', '2025-06-18 21:40:28'),
(7, NULL, 1, 'http://127.0.0.1:8000/admin', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', '2025-06-18 21:41:20', '2025-06-18 21:41:20'),
(8, NULL, 74, 'http://127.0.0.1:8000', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36 Edg/137.0.0.0', '2025-06-18 21:41:30', '2025-06-18 21:41:30'),
(9, NULL, 1, 'http://127.0.0.1:8000/admin', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', '2025-06-19 21:42:20', '2025-06-18 21:42:20'),
(10, NULL, 1, 'http://127.0.0.1:8000/admin', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', '2025-06-18 21:42:34', '2025-06-18 21:42:34'),
(11, NULL, 1, 'http://127.0.0.1:8000/admin', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', '2025-06-18 21:42:48', '2025-06-18 21:42:48'),
(12, NULL, 1, 'http://127.0.0.1:8000/admin', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', '2025-06-18 21:51:16', '2025-06-18 21:51:16'),
(13, NULL, 1, 'http://127.0.0.1:8000/admin', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', '2025-06-18 21:54:51', '2025-06-18 21:54:51'),
(14, NULL, 1, 'http://127.0.0.1:8000/admin', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', '2025-06-18 21:55:13', '2025-06-18 21:55:13'),
(15, NULL, 1, 'http://127.0.0.1:8000/admin', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', '2025-06-18 21:55:20', '2025-06-18 21:55:20'),
(16, NULL, 1, 'http://127.0.0.1:8000/admin', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', '2025-06-18 21:55:26', '2025-06-18 21:55:26'),
(17, NULL, 1, 'http://127.0.0.1:8000/admin', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', '2025-06-18 21:55:30', '2025-06-18 21:55:30'),
(18, NULL, 1, 'http://127.0.0.1:8000/admin', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', '2025-06-18 21:55:32', '2025-06-18 21:55:32'),
(19, NULL, 1, 'http://127.0.0.1:8000/admin', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', '2025-06-18 21:55:36', '2025-06-18 21:55:36'),
(20, NULL, 1, 'http://127.0.0.1:8000/admin', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', '2025-06-18 21:55:49', '2025-06-18 21:55:49'),
(21, NULL, 1, 'http://127.0.0.1:8000/admin', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', '2025-06-18 21:58:39', '2025-06-18 21:58:39'),
(22, NULL, 1, 'http://127.0.0.1:8000/admin', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', '2025-06-18 22:04:25', '2025-06-18 22:04:25'),
(23, NULL, 1, 'http://127.0.0.1:8000/admin', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', '2025-06-18 22:04:47', '2025-06-18 22:04:47'),
(24, NULL, 1, 'http://127.0.0.1:8000/admin', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', '2025-06-18 22:12:08', '2025-06-18 22:12:08'),
(25, NULL, 1, 'http://127.0.0.1:8000/admin', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', '2025-06-18 22:13:48', '2025-06-18 22:13:48'),
(26, NULL, 1, 'http://127.0.0.1:8000/admin', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', '2025-06-18 22:14:42', '2025-06-18 22:14:42'),
(27, NULL, 1, 'http://127.0.0.1:8000/admin/categories', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', '2025-06-18 22:15:32', '2025-06-18 22:15:32'),
(28, NULL, NULL, 'http://127.0.0.1:8000', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', '2025-06-19 15:46:02', '2025-06-19 15:46:02'),
(29, NULL, NULL, 'http://127.0.0.1:8000/login', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', '2025-06-19 15:46:32', '2025-06-19 15:46:32'),
(30, NULL, NULL, 'http://127.0.0.1:8000/login', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', '2025-06-19 15:46:39', '2025-06-19 15:46:39'),
(31, NULL, 1, 'http://127.0.0.1:8000/admin', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', '2025-06-19 15:46:41', '2025-06-19 15:46:41'),
(32, NULL, 1, 'http://127.0.0.1:8000/admin', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', '2025-06-19 15:47:13', '2025-06-19 15:47:13'),
(33, NULL, NULL, 'http://127.0.0.1:8000', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', '2025-06-19 15:55:37', '2025-06-19 15:55:37'),
(34, NULL, NULL, 'http://127.0.0.1:8000/login', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', '2025-06-19 15:55:40', '2025-06-19 15:55:40'),
(35, NULL, NULL, 'http://127.0.0.1:8000/login', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', '2025-06-19 15:55:46', '2025-06-19 15:55:46'),
(36, NULL, 74, 'http://127.0.0.1:8000', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', '2025-06-19 15:55:46', '2025-06-19 15:55:46'),
(37, NULL, NULL, 'http://127.0.0.1:8000', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36 Edg/137.0.0.0', '2025-06-19 15:55:52', '2025-06-19 15:55:52'),
(38, NULL, NULL, 'http://127.0.0.1:8000/login', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36 Edg/137.0.0.0', '2025-06-19 15:55:56', '2025-06-19 15:55:56'),
(39, NULL, NULL, 'http://127.0.0.1:8000/login', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36 Edg/137.0.0.0', '2025-06-19 15:56:01', '2025-06-19 15:56:01'),
(40, NULL, 77, 'http://127.0.0.1:8000', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36 Edg/137.0.0.0', '2025-06-19 15:56:02', '2025-06-19 15:56:02'),
(41, NULL, 1, 'http://127.0.0.1:8000/admin', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', '2025-06-19 15:56:07', '2025-06-19 15:56:07'),
(42, NULL, 1, 'http://127.0.0.1:8000/admin', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', '2025-06-19 16:04:03', '2025-06-19 16:04:03'),
(43, NULL, 1, 'http://127.0.0.1:8000/admin', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', '2025-06-19 16:05:18', '2025-06-19 16:05:18'),
(44, NULL, 1, 'http://127.0.0.1:8000/admin', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', '2025-06-19 16:06:14', '2025-06-19 16:06:14'),
(45, NULL, 1, 'http://127.0.0.1:8000/admin', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', '2025-06-19 16:07:13', '2025-06-19 16:07:13'),
(46, NULL, 1, 'http://127.0.0.1:8000/admin', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', '2025-06-19 16:12:25', '2025-06-19 16:12:25'),
(47, NULL, 1, 'http://127.0.0.1:8000/admin', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', '2025-06-19 16:15:08', '2025-06-19 16:15:08'),
(48, NULL, 1, 'http://127.0.0.1:8000/admin', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', '2025-06-19 16:18:19', '2025-06-19 16:18:19'),
(49, NULL, 1, 'http://127.0.0.1:8000/admin', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', '2025-06-19 16:18:48', '2025-06-19 16:18:48'),
(50, NULL, 1, 'http://127.0.0.1:8000/admin/orders', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', '2025-06-19 16:20:06', '2025-06-19 16:20:06'),
(51, NULL, 1, 'http://127.0.0.1:8000/admin', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', '2025-06-19 16:21:29', '2025-06-19 16:21:29'),
(52, NULL, 1, 'http://127.0.0.1:8000/admin', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', '2025-06-19 16:21:34', '2025-06-19 16:21:34'),
(53, NULL, 1, 'http://127.0.0.1:8000/admin', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', '2025-06-19 16:23:11', '2025-06-19 16:23:11'),
(54, NULL, 1, 'http://127.0.0.1:8000/admin/vouchers', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', '2025-06-19 16:23:17', '2025-06-19 16:23:17'),
(55, NULL, 1, 'http://127.0.0.1:8000/admin/blogs', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', '2025-06-19 16:23:22', '2025-06-19 16:23:22'),
(56, NULL, 1, 'http://127.0.0.1:8000/admin/users', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', '2025-06-19 16:23:26', '2025-06-19 16:23:26'),
(57, NULL, 1, 'http://127.0.0.1:8000/admin/products', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', '2025-06-19 16:25:10', '2025-06-19 16:25:10'),
(58, NULL, 1, 'http://127.0.0.1:8000/admin/attributes', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', '2025-06-19 16:25:15', '2025-06-19 16:25:15'),
(59, NULL, 1, 'http://127.0.0.1:8000/admin/order-returns', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', '2025-06-19 16:25:33', '2025-06-19 16:25:33'),
(60, NULL, 1, 'http://127.0.0.1:8000/admin/users', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', '2025-06-19 16:25:37', '2025-06-19 16:25:37'),
(61, NULL, 1, 'http://127.0.0.1:8000/admin/contacts', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', '2025-06-19 16:25:41', '2025-06-19 16:25:41'),
(62, NULL, 1, 'http://127.0.0.1:8000/admin/subscribers', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', '2025-06-19 16:25:45', '2025-06-19 16:25:45'),
(63, NULL, 1, 'http://127.0.0.1:8000/admin/products', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', '2025-06-19 16:25:55', '2025-06-19 16:25:55'),
(64, NULL, 1, 'http://127.0.0.1:8000/admin/specifications', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', '2025-06-19 16:26:04', '2025-06-19 16:26:04'),
(65, NULL, 1, 'http://127.0.0.1:8000/admin', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', '2025-06-19 16:26:12', '2025-06-19 16:26:12'),
(66, NULL, 1, 'http://127.0.0.1:8000', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', '2025-06-19 16:30:29', '2025-06-19 16:30:29'),
(67, NULL, 1, 'http://127.0.0.1:8000/profile', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', '2025-06-19 16:30:38', '2025-06-19 16:30:38'),
(68, NULL, 1, 'http://127.0.0.1:8000/admin', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', '2025-06-19 16:30:50', '2025-06-19 16:30:50'),
(69, NULL, NULL, 'http://127.0.0.1:8000', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', '2025-06-19 22:14:06', '2025-06-19 22:14:06'),
(70, NULL, NULL, 'http://127.0.0.1:8000/login', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', '2025-06-19 22:14:17', '2025-06-19 22:14:17'),
(71, NULL, NULL, 'http://127.0.0.1:8000/login', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', '2025-06-19 22:14:24', '2025-06-19 22:14:24'),
(72, NULL, NULL, 'http://127.0.0.1:8000/login', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', '2025-06-19 22:14:26', '2025-06-19 22:14:26'),
(73, NULL, NULL, 'http://127.0.0.1:8000/login', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', '2025-06-19 22:14:29', '2025-06-19 22:14:29'),
(74, NULL, 1, 'http://127.0.0.1:8000/admin', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', '2025-06-19 22:14:31', '2025-06-19 22:14:31'),
(75, NULL, NULL, 'http://127.0.0.1:8000', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', '2025-06-20 20:42:45', '2025-06-20 20:42:45'),
(76, NULL, NULL, 'http://127.0.0.1:8000/login', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', '2025-06-20 20:44:50', '2025-06-20 20:44:50'),
(77, NULL, NULL, 'http://127.0.0.1:8000/login', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', '2025-06-20 20:44:56', '2025-06-20 20:44:56'),
(78, NULL, NULL, 'http://127.0.0.1:8000/login', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', '2025-06-20 20:44:58', '2025-06-20 20:44:58'),
(79, NULL, NULL, 'http://127.0.0.1:8000/login', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', '2025-06-20 20:45:03', '2025-06-20 20:45:03'),
(80, NULL, 1, 'http://127.0.0.1:8000/admin', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', '2025-06-20 20:45:04', '2025-06-20 20:45:04'),
(81, NULL, 1, 'http://127.0.0.1:8000/admin', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', '2025-06-20 20:45:25', '2025-06-20 20:45:25'),
(82, NULL, 1, 'http://127.0.0.1:8000/admin', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', '2025-06-20 20:46:04', '2025-06-20 20:46:04'),
(83, NULL, 1, 'http://127.0.0.1:8000/admin', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', '2025-06-20 20:47:39', '2025-06-20 20:47:39'),
(84, NULL, 1, 'http://127.0.0.1:8000/admin', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', '2025-06-20 20:48:25', '2025-06-20 20:48:25'),
(85, NULL, 1, 'http://127.0.0.1:8000/admin', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', '2025-06-20 20:51:05', '2025-06-20 20:51:05'),
(86, NULL, 1, 'http://127.0.0.1:8000/admin', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', '2025-06-20 20:51:24', '2025-06-20 20:51:24'),
(87, NULL, 1, 'http://127.0.0.1:8000/admin', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', '2025-06-20 20:54:38', '2025-06-20 20:54:38'),
(88, NULL, 1, 'http://127.0.0.1:8000/admin', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', '2025-06-20 20:55:15', '2025-06-20 20:55:15'),
(89, NULL, 1, 'http://127.0.0.1:8000/admin', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', '2025-06-20 20:56:28', '2025-06-20 20:56:28'),
(90, NULL, 1, 'http://127.0.0.1:8000/admin', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', '2025-06-20 20:56:49', '2025-06-20 20:56:49'),
(91, NULL, 1, 'http://127.0.0.1:8000/admin', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', '2025-06-20 21:11:38', '2025-06-20 21:11:38'),
(92, NULL, 1, 'http://127.0.0.1:8000/admin', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', '2025-06-20 21:11:46', '2025-06-20 21:11:46'),
(93, NULL, 1, 'http://127.0.0.1:8000/admin', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', '2025-06-20 21:12:11', '2025-06-20 21:12:11'),
(94, NULL, 1, 'http://127.0.0.1:8000/admin', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', '2025-06-20 21:12:12', '2025-06-20 21:12:12'),
(95, NULL, 1, 'http://127.0.0.1:8000/admin', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', '2025-06-20 21:12:14', '2025-06-20 21:12:14'),
(96, NULL, 1, 'http://127.0.0.1:8000/admin', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', '2025-06-20 21:12:15', '2025-06-20 21:12:15'),
(97, NULL, 1, 'http://127.0.0.1:8000/admin', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', '2025-06-20 21:12:16', '2025-06-20 21:12:16'),
(98, NULL, 1, 'http://127.0.0.1:8000/admin', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', '2025-06-20 21:12:17', '2025-06-20 21:12:17'),
(99, NULL, 1, 'http://127.0.0.1:8000/admin', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', '2025-06-20 21:12:29', '2025-06-20 21:12:29'),
(100, NULL, 1, 'http://127.0.0.1:8000/admin', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', '2025-06-20 21:12:43', '2025-06-20 21:12:43'),
(101, NULL, 1, 'http://127.0.0.1:8000/admin', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', '2025-06-20 21:14:42', '2025-06-20 21:14:42'),
(102, NULL, 1, 'http://127.0.0.1:8000/admin', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', '2025-06-20 21:14:53', '2025-06-20 21:14:53'),
(103, NULL, 1, 'http://127.0.0.1:8000/admin', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', '2025-06-20 21:15:22', '2025-06-20 21:15:22'),
(104, NULL, 1, 'http://127.0.0.1:8000/admin', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', '2025-06-20 21:18:22', '2025-06-20 21:18:22'),
(105, NULL, 1, 'http://127.0.0.1:8000/admin', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', '2025-06-20 21:18:36', '2025-06-20 21:18:36'),
(106, NULL, 1, 'http://127.0.0.1:8000/admin', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', '2025-06-20 21:18:46', '2025-06-20 21:18:46'),
(107, NULL, 1, 'http://127.0.0.1:8000/admin', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', '2025-06-20 21:18:55', '2025-06-20 21:18:55'),
(108, NULL, 1, 'http://127.0.0.1:8000/admin/products', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', '2025-06-20 21:19:10', '2025-06-20 21:19:10'),
(109, NULL, 1, 'http://127.0.0.1:8000/admin', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', '2025-06-20 21:24:22', '2025-06-20 21:24:22'),
(110, NULL, 1, 'http://127.0.0.1:8000/admin', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', '2025-06-20 21:24:32', '2025-06-20 21:24:32'),
(111, NULL, 1, 'http://127.0.0.1:8000/admin', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', '2025-06-20 21:28:59', '2025-06-20 21:28:59'),
(112, NULL, 1, 'http://127.0.0.1:8000/admin/orders/97', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', '2025-06-20 21:29:55', '2025-06-20 21:29:55'),
(113, NULL, 1, 'http://127.0.0.1:8000/admin', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', '2025-06-20 21:30:29', '2025-06-20 21:30:29'),
(114, NULL, 1, 'http://127.0.0.1:8000/admin', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', '2025-06-20 21:31:04', '2025-06-20 21:31:04'),
(115, NULL, 1, 'http://127.0.0.1:8000/admin', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', '2025-06-20 21:31:24', '2025-06-20 21:31:24'),
(116, NULL, 1, 'http://127.0.0.1:8000/admin/orders/96', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', '2025-06-20 21:31:32', '2025-06-20 21:31:32'),
(117, NULL, 1, 'http://127.0.0.1:8000/admin', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', '2025-06-20 21:34:24', '2025-06-20 21:34:24'),
(118, NULL, 1, 'http://127.0.0.1:8000/admin', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', '2025-06-20 21:34:44', '2025-06-20 21:34:44'),
(119, NULL, 1, 'http://127.0.0.1:8000/admin', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', '2025-06-20 21:34:56', '2025-06-20 21:34:56'),
(120, NULL, 1, 'http://127.0.0.1:8000/admin', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', '2025-06-20 21:35:08', '2025-06-20 21:35:08'),
(121, NULL, 1, 'http://127.0.0.1:8000/admin', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', '2025-06-20 21:42:23', '2025-06-20 21:42:23'),
(122, NULL, 1, 'http://127.0.0.1:8000/admin', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', '2025-06-20 21:43:09', '2025-06-20 21:43:09'),
(123, NULL, 1, 'http://127.0.0.1:8000/admin', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', '2025-06-20 21:44:01', '2025-06-20 21:44:01'),
(124, NULL, 1, 'http://127.0.0.1:8000/admin', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', '2025-06-20 21:44:22', '2025-06-20 21:44:22'),
(125, NULL, 1, 'http://127.0.0.1:8000/admin', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', '2025-06-20 21:44:29', '2025-06-20 21:44:29'),
(126, NULL, 1, 'http://127.0.0.1:8000/admin', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', '2025-06-20 21:45:54', '2025-06-20 21:45:54'),
(127, NULL, 1, 'http://127.0.0.1:8000/admin', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', '2025-06-20 21:46:14', '2025-06-20 21:46:14'),
(128, NULL, 1, 'http://127.0.0.1:8000/admin', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', '2025-06-20 21:48:24', '2025-06-20 21:48:24'),
(129, NULL, 1, 'http://127.0.0.1:8000/admin', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', '2025-06-20 21:49:37', '2025-06-20 21:49:37'),
(130, NULL, 1, 'http://127.0.0.1:8000/admin', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', '2025-06-20 22:20:15', '2025-06-20 22:20:15'),
(131, NULL, 1, 'http://127.0.0.1:8000/admin', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', '2025-06-20 22:21:14', '2025-06-20 22:21:14'),
(132, NULL, 1, 'http://127.0.0.1:8000/admin/products', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', '2025-06-20 22:21:18', '2025-06-20 22:21:18'),
(133, NULL, 1, 'http://127.0.0.1:8000/admin/products/155', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', '2025-06-20 22:21:34', '2025-06-20 22:21:34'),
(134, NULL, 1, 'http://127.0.0.1:8000/admin', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', '2025-06-20 22:22:01', '2025-06-20 22:22:01'),
(135, NULL, 1, 'http://127.0.0.1:8000/admin', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', '2025-06-20 22:22:28', '2025-06-20 22:22:28'),
(136, NULL, 1, 'http://127.0.0.1:8000/admin', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', '2025-06-20 23:13:14', '2025-06-20 23:13:14'),
(137, NULL, NULL, 'http://127.0.0.1:8000', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', '2025-06-20 23:14:35', '2025-06-20 23:14:35'),
(138, NULL, NULL, 'http://127.0.0.1:8000/login', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', '2025-06-20 23:14:38', '2025-06-20 23:14:38'),
(139, NULL, NULL, 'http://127.0.0.1:8000/login', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', '2025-06-20 23:14:44', '2025-06-20 23:14:44'),
(140, NULL, 74, 'http://127.0.0.1:8000', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', '2025-06-20 23:14:46', '2025-06-20 23:14:46'),
(141, NULL, 1, 'http://127.0.0.1:8000/admin', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', '2025-06-20 23:14:53', '2025-06-20 23:14:53'),
(142, NULL, 1, 'http://127.0.0.1:8000/admin', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', '2025-06-20 23:16:00', '2025-06-20 23:16:00'),
(143, 'yaPKmsgGJZeVuKlqrOyuCAekRuEiZLOfiO44CoDI', NULL, 'http://127.0.0.1:8000', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', '2025-06-21 16:03:47', '2025-06-21 16:03:47'),
(144, 'yaPKmsgGJZeVuKlqrOyuCAekRuEiZLOfiO44CoDI', NULL, 'http://127.0.0.1:8000/login', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', '2025-06-21 16:03:52', '2025-06-21 16:03:52'),
(145, 'yaPKmsgGJZeVuKlqrOyuCAekRuEiZLOfiO44CoDI', NULL, 'http://127.0.0.1:8000/login', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', '2025-06-21 16:03:58', '2025-06-21 16:03:58'),
(146, 'wRnbJNyElX5OjW9IXgwEQ5oCabrfR48zUqZudg7z', 74, 'http://127.0.0.1:8000', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', '2025-06-21 16:04:01', '2025-06-21 16:04:01'),
(147, 'QzhaPvehbXqVdfEdMmmWA7nRskSSEn76VK3B4kR2', NULL, 'http://127.0.0.1:8000', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', '2025-06-21 16:04:08', '2025-06-21 16:04:08'),
(148, 'QzhaPvehbXqVdfEdMmmWA7nRskSSEn76VK3B4kR2', NULL, 'http://127.0.0.1:8000/login', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', '2025-06-21 16:04:11', '2025-06-21 16:04:11'),
(149, 'QzhaPvehbXqVdfEdMmmWA7nRskSSEn76VK3B4kR2', NULL, 'http://127.0.0.1:8000/login', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', '2025-06-21 16:05:03', '2025-06-21 16:05:03'),
(150, 'SxLOOtsU3qUvKlA8BhRmv4cLquQTGBg9b65HtFfO', 77, 'http://127.0.0.1:8000', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', '2025-06-21 16:05:04', '2025-06-21 16:05:04'),
(151, 'wRnbJNyElX5OjW9IXgwEQ5oCabrfR48zUqZudg7z', 74, 'http://127.0.0.1:8000/logout', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', '2025-06-21 16:05:11', '2025-06-21 16:05:11'),
(152, 'B0shDZbopUowxbpiAgpiUldVzWBuz4oAJaUCXqg9', NULL, 'http://127.0.0.1:8000/login', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', '2025-06-21 16:05:12', '2025-06-21 16:05:12'),
(153, 'B0shDZbopUowxbpiAgpiUldVzWBuz4oAJaUCXqg9', NULL, 'http://127.0.0.1:8000/login', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', '2025-06-21 16:05:21', '2025-06-21 16:05:21'),
(154, '686pcaWxEyMuy5jQK3IDyRtVNoj2qaOkbVBWJFEJ', 1, 'http://127.0.0.1:8000/admin', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', '2025-06-21 16:05:21', '2025-06-21 16:05:21'),
(155, '686pcaWxEyMuy5jQK3IDyRtVNoj2qaOkbVBWJFEJ', 1, 'http://127.0.0.1:8000/admin', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', '2025-06-21 16:07:04', '2025-06-21 16:07:04'),
(156, '686pcaWxEyMuy5jQK3IDyRtVNoj2qaOkbVBWJFEJ', 1, 'http://127.0.0.1:8000/admin', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', '2025-06-21 16:07:16', '2025-06-21 16:07:16'),
(157, '686pcaWxEyMuy5jQK3IDyRtVNoj2qaOkbVBWJFEJ', 1, 'http://127.0.0.1:8000/admin', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', '2025-06-21 16:10:41', '2025-06-21 16:10:41'),
(158, 'rYvobd23iSOhQ9avJF8ozHixSsnyKQY4MiDTvasj', NULL, 'http://127.0.0.1:8000', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36 Edg/137.0.0.0', '2025-06-21 16:10:50', '2025-06-21 16:10:50'),
(159, '686pcaWxEyMuy5jQK3IDyRtVNoj2qaOkbVBWJFEJ', 1, 'http://127.0.0.1:8000/admin', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', '2025-06-21 16:10:58', '2025-06-21 16:10:58'),
(160, '686pcaWxEyMuy5jQK3IDyRtVNoj2qaOkbVBWJFEJ', 1, 'http://127.0.0.1:8000/admin', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', '2025-06-21 16:11:01', '2025-06-21 16:11:01'),
(161, 'rYvobd23iSOhQ9avJF8ozHixSsnyKQY4MiDTvasj', NULL, 'http://127.0.0.1:8000', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36 Edg/137.0.0.0', '2025-06-21 16:11:17', '2025-06-21 16:11:17'),
(162, 'rYvobd23iSOhQ9avJF8ozHixSsnyKQY4MiDTvasj', NULL, 'http://127.0.0.1:8000', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36 Edg/137.0.0.0', '2025-06-21 16:11:25', '2025-06-21 16:11:25'),
(163, '686pcaWxEyMuy5jQK3IDyRtVNoj2qaOkbVBWJFEJ', 1, 'http://127.0.0.1:8000/admin', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', '2025-06-21 16:11:34', '2025-06-21 16:11:34'),
(164, '686pcaWxEyMuy5jQK3IDyRtVNoj2qaOkbVBWJFEJ', 1, 'http://127.0.0.1:8000/logout', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', '2025-06-21 16:14:22', '2025-06-21 16:14:22'),
(165, 'fByVD6SdeQ8AVcdGEKn9sedkUp5g8HKBDKR53MbV', NULL, 'http://127.0.0.1:8000/login', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', '2025-06-21 16:14:23', '2025-06-21 16:14:23'),
(166, 'fByVD6SdeQ8AVcdGEKn9sedkUp5g8HKBDKR53MbV', NULL, 'http://127.0.0.1:8000/login', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', '2025-06-21 16:14:28', '2025-06-21 16:14:28'),
(167, 'fByVD6SdeQ8AVcdGEKn9sedkUp5g8HKBDKR53MbV', NULL, 'http://127.0.0.1:8000/login', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', '2025-06-21 16:14:29', '2025-06-21 16:14:29'),
(168, 'fByVD6SdeQ8AVcdGEKn9sedkUp5g8HKBDKR53MbV', NULL, 'http://127.0.0.1:8000/login', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', '2025-06-21 16:14:32', '2025-06-21 16:14:32'),
(169, 'iCK8J9uwPFpXpaBXd6M9o5BuP0CeE2amFIt9Psgn', 1, 'http://127.0.0.1:8000/admin', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', '2025-06-21 16:14:33', '2025-06-21 16:14:33'),
(170, 'rYvobd23iSOhQ9avJF8ozHixSsnyKQY4MiDTvasj', NULL, 'http://127.0.0.1:8000', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36 Edg/137.0.0.0', '2025-06-21 16:16:37', '2025-06-21 16:16:37'),
(171, 'iCK8J9uwPFpXpaBXd6M9o5BuP0CeE2amFIt9Psgn', 1, 'http://127.0.0.1:8000/admin', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', '2025-06-21 16:16:40', '2025-06-21 16:16:40'),
(172, 'iCK8J9uwPFpXpaBXd6M9o5BuP0CeE2amFIt9Psgn', 1, 'http://127.0.0.1:8000/admin', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', '2025-06-21 16:16:49', '2025-06-21 16:16:49'),
(173, 'rYvobd23iSOhQ9avJF8ozHixSsnyKQY4MiDTvasj', NULL, 'http://127.0.0.1:8000', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36 Edg/137.0.0.0', '2025-06-21 16:16:54', '2025-06-21 16:16:54'),
(174, 'iCK8J9uwPFpXpaBXd6M9o5BuP0CeE2amFIt9Psgn', 1, 'http://127.0.0.1:8000/admin', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', '2025-06-21 16:16:58', '2025-06-21 16:16:58'),
(175, 'rYvobd23iSOhQ9avJF8ozHixSsnyKQY4MiDTvasj', NULL, 'http://127.0.0.1:8000', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36 Edg/137.0.0.0', '2025-06-21 16:17:18', '2025-06-21 16:17:18'),
(176, 'iCK8J9uwPFpXpaBXd6M9o5BuP0CeE2amFIt9Psgn', 1, 'http://127.0.0.1:8000/admin', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', '2025-06-21 16:17:33', '2025-06-21 16:17:33'),
(177, 'iCK8J9uwPFpXpaBXd6M9o5BuP0CeE2amFIt9Psgn', 1, 'http://127.0.0.1:8000/admin', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', '2025-06-21 16:19:16', '2025-06-21 16:19:16'),
(178, 'BbHIIcqrQJAx6mKfd1f9ImSfKn9YlO5kcrCemjDD', NULL, 'http://127.0.0.1:8000', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', '2025-06-21 20:39:59', '2025-06-21 20:39:59'),
(179, 'BbHIIcqrQJAx6mKfd1f9ImSfKn9YlO5kcrCemjDD', NULL, 'http://127.0.0.1:8000/increment-view/153', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', '2025-06-21 20:40:58', '2025-06-21 20:40:58'),
(180, 'BbHIIcqrQJAx6mKfd1f9ImSfKn9YlO5kcrCemjDD', NULL, 'http://127.0.0.1:8000', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', '2025-06-21 20:42:50', '2025-06-21 20:42:50'),
(181, 'BbHIIcqrQJAx6mKfd1f9ImSfKn9YlO5kcrCemjDD', NULL, 'http://127.0.0.1:8000', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', '2025-06-21 20:45:00', '2025-06-21 20:45:00'),
(182, 'BbHIIcqrQJAx6mKfd1f9ImSfKn9YlO5kcrCemjDD', NULL, 'http://127.0.0.1:8000/login', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', '2025-06-21 20:47:45', '2025-06-21 20:47:45'),
(183, 'BbHIIcqrQJAx6mKfd1f9ImSfKn9YlO5kcrCemjDD', NULL, 'http://127.0.0.1:8000/login', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', '2025-06-21 20:47:50', '2025-06-21 20:47:50'),
(184, 'EtbwVE4PgOrMnRKyjnkXuUl8I75Ox3d5PReONii1', 1, 'http://127.0.0.1:8000/admin', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', '2025-06-21 20:47:54', '2025-06-21 20:47:54'),
(185, 'EtbwVE4PgOrMnRKyjnkXuUl8I75Ox3d5PReONii1', 1, 'http://127.0.0.1:8000/admin', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', '2025-06-21 20:48:26', '2025-06-21 20:48:26'),
(186, 'EtbwVE4PgOrMnRKyjnkXuUl8I75Ox3d5PReONii1', 1, 'http://127.0.0.1:8000/admin/products', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', '2025-06-21 20:48:32', '2025-06-21 20:48:32'),
(187, 'EtbwVE4PgOrMnRKyjnkXuUl8I75Ox3d5PReONii1', 1, 'http://127.0.0.1:8000/admin', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', '2025-06-21 20:53:01', '2025-06-21 20:53:01'),
(188, 'EtbwVE4PgOrMnRKyjnkXuUl8I75Ox3d5PReONii1', 1, 'http://127.0.0.1:8000/admin', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', '2025-06-21 20:54:58', '2025-06-21 20:54:58'),
(189, 'EtbwVE4PgOrMnRKyjnkXuUl8I75Ox3d5PReONii1', 1, 'http://127.0.0.1:8000/admin', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', '2025-06-21 20:58:01', '2025-06-21 20:58:01'),
(190, 'EtbwVE4PgOrMnRKyjnkXuUl8I75Ox3d5PReONii1', 1, 'http://127.0.0.1:8000/admin', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', '2025-06-21 21:01:06', '2025-06-21 21:01:06'),
(191, 'EtbwVE4PgOrMnRKyjnkXuUl8I75Ox3d5PReONii1', 1, 'http://127.0.0.1:8000/admin', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', '2025-06-21 21:03:32', '2025-06-21 21:03:32'),
(192, 'EtbwVE4PgOrMnRKyjnkXuUl8I75Ox3d5PReONii1', 1, 'http://127.0.0.1:8000/admin', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', '2025-06-21 21:04:12', '2025-06-21 21:04:12'),
(193, 'EtbwVE4PgOrMnRKyjnkXuUl8I75Ox3d5PReONii1', 1, 'http://127.0.0.1:8000/admin', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', '2025-06-21 21:04:19', '2025-06-21 21:04:19'),
(194, 'EtbwVE4PgOrMnRKyjnkXuUl8I75Ox3d5PReONii1', 1, 'http://127.0.0.1:8000/admin', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', '2025-06-21 21:04:28', '2025-06-21 21:04:28'),
(195, 'EtbwVE4PgOrMnRKyjnkXuUl8I75Ox3d5PReONii1', 1, 'http://127.0.0.1:8000/admin', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', '2025-06-21 21:06:02', '2025-06-21 21:06:02'),
(196, 'EtbwVE4PgOrMnRKyjnkXuUl8I75Ox3d5PReONii1', 1, 'http://127.0.0.1:8000/admin', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', '2025-06-21 21:06:34', '2025-06-21 21:06:34'),
(197, 'EtbwVE4PgOrMnRKyjnkXuUl8I75Ox3d5PReONii1', 1, 'http://127.0.0.1:8000/admin', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', '2025-06-21 21:07:08', '2025-06-21 21:07:08'),
(198, 'EtbwVE4PgOrMnRKyjnkXuUl8I75Ox3d5PReONii1', 1, 'http://127.0.0.1:8000/admin', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', '2025-06-21 21:07:28', '2025-06-21 21:07:28'),
(199, 'EtbwVE4PgOrMnRKyjnkXuUl8I75Ox3d5PReONii1', 1, 'http://127.0.0.1:8000/admin', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', '2025-06-21 21:07:41', '2025-06-21 21:07:41'),
(200, 'EtbwVE4PgOrMnRKyjnkXuUl8I75Ox3d5PReONii1', 1, 'http://127.0.0.1:8000/admin', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', '2025-06-21 21:08:27', '2025-06-21 21:08:27'),
(201, 'EtbwVE4PgOrMnRKyjnkXuUl8I75Ox3d5PReONii1', 1, 'http://127.0.0.1:8000/admin', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', '2025-06-21 21:09:04', '2025-06-21 21:09:04'),
(202, 'EtbwVE4PgOrMnRKyjnkXuUl8I75Ox3d5PReONii1', 1, 'http://127.0.0.1:8000/admin', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', '2025-06-21 21:26:32', '2025-06-21 21:26:32'),
(203, 'EtbwVE4PgOrMnRKyjnkXuUl8I75Ox3d5PReONii1', 1, 'http://127.0.0.1:8000/admin', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', '2025-06-21 21:29:08', '2025-06-21 21:29:08'),
(204, 'EtbwVE4PgOrMnRKyjnkXuUl8I75Ox3d5PReONii1', 1, 'http://127.0.0.1:8000/admin', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', '2025-06-21 21:29:17', '2025-06-21 21:29:17'),
(205, 'EtbwVE4PgOrMnRKyjnkXuUl8I75Ox3d5PReONii1', 1, 'http://127.0.0.1:8000/admin', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', '2025-06-21 21:29:58', '2025-06-21 21:29:58'),
(206, 'EtbwVE4PgOrMnRKyjnkXuUl8I75Ox3d5PReONii1', 1, 'http://127.0.0.1:8000/admin', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', '2025-06-21 21:31:04', '2025-06-21 21:31:04'),
(207, 'EtbwVE4PgOrMnRKyjnkXuUl8I75Ox3d5PReONii1', 1, 'http://127.0.0.1:8000/admin', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', '2025-06-21 21:31:24', '2025-06-21 21:31:24'),
(208, 'EtbwVE4PgOrMnRKyjnkXuUl8I75Ox3d5PReONii1', 1, 'http://127.0.0.1:8000/admin', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', '2025-06-21 21:31:43', '2025-06-21 21:31:43'),
(209, 'EtbwVE4PgOrMnRKyjnkXuUl8I75Ox3d5PReONii1', 1, 'http://127.0.0.1:8000/admin', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', '2025-06-21 21:31:58', '2025-06-21 21:31:58'),
(210, 'EtbwVE4PgOrMnRKyjnkXuUl8I75Ox3d5PReONii1', 1, 'http://127.0.0.1:8000/admin', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', '2025-06-21 21:34:01', '2025-06-21 21:34:01'),
(211, 'EtbwVE4PgOrMnRKyjnkXuUl8I75Ox3d5PReONii1', 1, 'http://127.0.0.1:8000/admin', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', '2025-06-21 21:34:18', '2025-06-21 21:34:18'),
(212, 'EtbwVE4PgOrMnRKyjnkXuUl8I75Ox3d5PReONii1', 1, 'http://127.0.0.1:8000/admin', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', '2025-06-21 21:35:07', '2025-06-21 21:35:07'),
(213, 'EtbwVE4PgOrMnRKyjnkXuUl8I75Ox3d5PReONii1', 1, 'http://127.0.0.1:8000/admin', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', '2025-06-21 21:37:12', '2025-06-21 21:37:12');
INSERT INTO `page_views` (`id`, `session_id`, `user_id`, `url`, `ip_address`, `user_agent`, `created_at`, `updated_at`) VALUES
(214, 'EtbwVE4PgOrMnRKyjnkXuUl8I75Ox3d5PReONii1', 1, 'http://127.0.0.1:8000/admin', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', '2025-06-21 21:41:50', '2025-06-21 21:41:50'),
(215, 'EtbwVE4PgOrMnRKyjnkXuUl8I75Ox3d5PReONii1', 1, 'http://127.0.0.1:8000/admin', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', '2025-06-21 21:47:57', '2025-06-21 21:47:57'),
(216, 'EtbwVE4PgOrMnRKyjnkXuUl8I75Ox3d5PReONii1', 1, 'http://127.0.0.1:8000/admin', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', '2025-06-21 21:58:33', '2025-06-21 21:58:33'),
(217, 'EtbwVE4PgOrMnRKyjnkXuUl8I75Ox3d5PReONii1', 1, 'http://127.0.0.1:8000/admin', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', '2025-06-21 22:02:22', '2025-06-21 22:02:22'),
(218, 'EtbwVE4PgOrMnRKyjnkXuUl8I75Ox3d5PReONii1', 1, 'http://127.0.0.1:8000/admin', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', '2025-06-21 22:03:14', '2025-06-21 22:03:14'),
(219, 'EtbwVE4PgOrMnRKyjnkXuUl8I75Ox3d5PReONii1', 1, 'http://127.0.0.1:8000/admin', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', '2025-06-21 22:04:53', '2025-06-21 22:04:53'),
(220, 'EtbwVE4PgOrMnRKyjnkXuUl8I75Ox3d5PReONii1', 1, 'http://127.0.0.1:8000/admin', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', '2025-06-21 22:07:31', '2025-06-21 22:07:31'),
(221, 'EtbwVE4PgOrMnRKyjnkXuUl8I75Ox3d5PReONii1', 1, 'http://127.0.0.1:8000/admin', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', '2025-06-21 22:07:39', '2025-06-21 22:07:39'),
(222, 'EtbwVE4PgOrMnRKyjnkXuUl8I75Ox3d5PReONii1', 1, 'http://127.0.0.1:8000/admin', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', '2025-06-21 22:08:11', '2025-06-21 22:08:11'),
(223, 'EtbwVE4PgOrMnRKyjnkXuUl8I75Ox3d5PReONii1', 1, 'http://127.0.0.1:8000/admin', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', '2025-06-21 22:08:44', '2025-06-21 22:08:44'),
(224, 'EtbwVE4PgOrMnRKyjnkXuUl8I75Ox3d5PReONii1', 1, 'http://127.0.0.1:8000/admin', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', '2025-06-21 22:09:26', '2025-06-21 22:09:26'),
(225, 'EtbwVE4PgOrMnRKyjnkXuUl8I75Ox3d5PReONii1', 1, 'http://127.0.0.1:8000/admin', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', '2025-06-21 22:10:49', '2025-06-21 22:10:49'),
(226, 'EtbwVE4PgOrMnRKyjnkXuUl8I75Ox3d5PReONii1', 1, 'http://127.0.0.1:8000/admin', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', '2025-06-21 22:11:41', '2025-06-21 22:11:41'),
(227, 'EtbwVE4PgOrMnRKyjnkXuUl8I75Ox3d5PReONii1', 1, 'http://127.0.0.1:8000/admin', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', '2025-06-21 22:12:02', '2025-06-21 22:12:02'),
(228, 'EtbwVE4PgOrMnRKyjnkXuUl8I75Ox3d5PReONii1', 1, 'http://127.0.0.1:8000/admin', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', '2025-06-21 22:14:49', '2025-06-21 22:14:49'),
(229, 'EtbwVE4PgOrMnRKyjnkXuUl8I75Ox3d5PReONii1', 1, 'http://127.0.0.1:8000/admin', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', '2025-06-21 22:14:56', '2025-06-21 22:14:56'),
(230, 'EtbwVE4PgOrMnRKyjnkXuUl8I75Ox3d5PReONii1', 1, 'http://127.0.0.1:8000/admin', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', '2025-06-21 22:15:04', '2025-06-21 22:15:04'),
(231, 'EtbwVE4PgOrMnRKyjnkXuUl8I75Ox3d5PReONii1', 1, 'http://127.0.0.1:8000/admin', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', '2025-06-21 22:16:24', '2025-06-21 22:16:24'),
(232, 'EtbwVE4PgOrMnRKyjnkXuUl8I75Ox3d5PReONii1', 1, 'http://127.0.0.1:8000', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', '2025-06-21 22:25:01', '2025-06-21 22:25:01'),
(233, 'EtbwVE4PgOrMnRKyjnkXuUl8I75Ox3d5PReONii1', 1, 'http://127.0.0.1:8000/admin', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', '2025-06-21 22:25:06', '2025-06-21 22:25:06'),
(234, 'EtbwVE4PgOrMnRKyjnkXuUl8I75Ox3d5PReONii1', 1, 'http://127.0.0.1:8000/admin', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', '2025-06-21 22:25:17', '2025-06-21 22:25:17'),
(235, 'dg36PX23hxDuYpNbU29PyfdRumEAqYq8suvoLj5V', NULL, 'http://127.0.0.1:8000', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', '2025-06-22 12:19:46', '2025-06-22 12:19:46'),
(236, 'xMwdgXphO88nHWf2FcCLinr93X40cZojuUCi5uOH', 71, 'http://127.0.0.1:8000', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', '2025-06-22 12:19:50', '2025-06-22 12:19:50'),
(237, 'xMwdgXphO88nHWf2FcCLinr93X40cZojuUCi5uOH', 71, 'http://127.0.0.1:8000', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', '2025-06-22 12:20:01', '2025-06-22 12:20:01'),
(238, 'xMwdgXphO88nHWf2FcCLinr93X40cZojuUCi5uOH', 71, 'http://127.0.0.1:8000', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', '2025-06-22 12:20:12', '2025-06-22 12:20:12'),
(239, 'xMwdgXphO88nHWf2FcCLinr93X40cZojuUCi5uOH', 71, 'http://127.0.0.1:8000', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', '2025-06-22 12:20:22', '2025-06-22 12:20:22'),
(240, 'dg36PX23hxDuYpNbU29PyfdRumEAqYq8suvoLj5V', NULL, 'http://127.0.0.1:8000', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', '2025-06-22 12:20:26', '2025-06-22 12:20:26'),
(241, 'xMwdgXphO88nHWf2FcCLinr93X40cZojuUCi5uOH', 71, 'http://127.0.0.1:8000', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', '2025-06-22 12:20:33', '2025-06-22 12:20:33'),
(242, 'dg36PX23hxDuYpNbU29PyfdRumEAqYq8suvoLj5V', NULL, 'http://127.0.0.1:8000/chatbot/ask', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', '2025-06-22 12:20:43', '2025-06-22 12:20:43'),
(243, 'dg36PX23hxDuYpNbU29PyfdRumEAqYq8suvoLj5V', NULL, 'http://127.0.0.1:8000/chatbot/ask', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', '2025-06-22 12:20:57', '2025-06-22 12:20:57'),
(244, 'dg36PX23hxDuYpNbU29PyfdRumEAqYq8suvoLj5V', NULL, 'http://127.0.0.1:8000/chatbot/ask', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', '2025-06-22 12:21:28', '2025-06-22 12:21:28'),
(245, 'dg36PX23hxDuYpNbU29PyfdRumEAqYq8suvoLj5V', NULL, 'http://127.0.0.1:8000/chatbot/ask', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', '2025-06-22 12:21:52', '2025-06-22 12:21:52'),
(246, 'dg36PX23hxDuYpNbU29PyfdRumEAqYq8suvoLj5V', NULL, 'http://127.0.0.1:8000/chatbot/ask', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', '2025-06-22 12:22:35', '2025-06-22 12:22:35'),
(247, 'dg36PX23hxDuYpNbU29PyfdRumEAqYq8suvoLj5V', NULL, 'http://127.0.0.1:8000/chatbot/ask', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', '2025-06-22 12:23:47', '2025-06-22 12:23:47'),
(248, 'dg36PX23hxDuYpNbU29PyfdRumEAqYq8suvoLj5V', NULL, 'http://127.0.0.1:8000/chatbot/ask', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', '2025-06-22 12:24:09', '2025-06-22 12:24:09'),
(249, 'dg36PX23hxDuYpNbU29PyfdRumEAqYq8suvoLj5V', NULL, 'http://127.0.0.1:8000/chatbot/ask', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', '2025-06-22 12:24:37', '2025-06-22 12:24:37'),
(250, 'dg36PX23hxDuYpNbU29PyfdRumEAqYq8suvoLj5V', NULL, 'http://127.0.0.1:8000/chatbot/ask', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', '2025-06-22 12:25:10', '2025-06-22 12:25:10'),
(251, 'dg36PX23hxDuYpNbU29PyfdRumEAqYq8suvoLj5V', NULL, 'http://127.0.0.1:8000/chatbot/ask', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', '2025-06-22 12:30:26', '2025-06-22 12:30:26'),
(252, 'dg36PX23hxDuYpNbU29PyfdRumEAqYq8suvoLj5V', NULL, 'http://127.0.0.1:8000/chatbot/ask', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', '2025-06-22 12:30:54', '2025-06-22 12:30:54'),
(253, 'dg36PX23hxDuYpNbU29PyfdRumEAqYq8suvoLj5V', NULL, 'http://127.0.0.1:8000/chatbot/ask', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', '2025-06-22 12:32:43', '2025-06-22 12:32:43'),
(254, 'dg36PX23hxDuYpNbU29PyfdRumEAqYq8suvoLj5V', NULL, 'http://127.0.0.1:8000/chatbot/ask', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', '2025-06-22 12:33:14', '2025-06-22 12:33:14'),
(255, 'dg36PX23hxDuYpNbU29PyfdRumEAqYq8suvoLj5V', NULL, 'http://127.0.0.1:8000/chatbot/ask', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', '2025-06-22 12:34:11', '2025-06-22 12:34:11'),
(256, 'dg36PX23hxDuYpNbU29PyfdRumEAqYq8suvoLj5V', NULL, 'http://127.0.0.1:8000/shop', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', '2025-06-22 12:36:06', '2025-06-22 12:36:06'),
(257, 'xMwdgXphO88nHWf2FcCLinr93X40cZojuUCi5uOH', 71, 'http://127.0.0.1:8000', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', '2025-06-22 12:36:13', '2025-06-22 12:36:13'),
(258, 'xMwdgXphO88nHWf2FcCLinr93X40cZojuUCi5uOH', 71, 'http://127.0.0.1:8000', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', '2025-06-22 12:36:29', '2025-06-22 12:36:29'),
(259, 'xMwdgXphO88nHWf2FcCLinr93X40cZojuUCi5uOH', 71, 'http://127.0.0.1:8000', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', '2025-06-22 12:36:40', '2025-06-22 12:36:40'),
(260, 'xMwdgXphO88nHWf2FcCLinr93X40cZojuUCi5uOH', 71, 'http://127.0.0.1:8000', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', '2025-06-22 12:36:51', '2025-06-22 12:36:51'),
(261, 'xMwdgXphO88nHWf2FcCLinr93X40cZojuUCi5uOH', 71, 'http://127.0.0.1:8000/compare', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', '2025-06-22 12:38:06', '2025-06-22 12:38:06'),
(262, 'xMwdgXphO88nHWf2FcCLinr93X40cZojuUCi5uOH', 71, 'http://127.0.0.1:8000/compare', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', '2025-06-22 12:38:19', '2025-06-22 12:38:19'),
(263, 'xMwdgXphO88nHWf2FcCLinr93X40cZojuUCi5uOH', 71, 'http://127.0.0.1:8000/compare', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', '2025-06-22 12:38:31', '2025-06-22 12:38:31'),
(264, 'xMwdgXphO88nHWf2FcCLinr93X40cZojuUCi5uOH', 71, 'http://127.0.0.1:8000/compare', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', '2025-06-22 12:38:43', '2025-06-22 12:38:43'),
(265, 'xMwdgXphO88nHWf2FcCLinr93X40cZojuUCi5uOH', 71, 'http://127.0.0.1:8000/compare', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', '2025-06-22 12:38:55', '2025-06-22 12:38:55'),
(266, 'xMwdgXphO88nHWf2FcCLinr93X40cZojuUCi5uOH', 71, 'http://127.0.0.1:8000/compare', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', '2025-06-22 12:39:08', '2025-06-22 12:39:08'),
(267, 'xMwdgXphO88nHWf2FcCLinr93X40cZojuUCi5uOH', 71, 'http://127.0.0.1:8000/compare', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', '2025-06-22 12:39:19', '2025-06-22 12:39:19'),
(268, 'xMwdgXphO88nHWf2FcCLinr93X40cZojuUCi5uOH', 71, 'http://127.0.0.1:8000', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', '2025-06-22 12:40:10', '2025-06-22 12:40:10'),
(269, 'xMwdgXphO88nHWf2FcCLinr93X40cZojuUCi5uOH', 71, 'http://127.0.0.1:8000', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', '2025-06-22 12:40:30', '2025-06-22 12:40:30'),
(270, 'dg36PX23hxDuYpNbU29PyfdRumEAqYq8suvoLj5V', NULL, 'http://127.0.0.1:8000', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', '2025-06-22 12:40:46', '2025-06-22 12:40:46'),
(271, 'xMwdgXphO88nHWf2FcCLinr93X40cZojuUCi5uOH', 71, 'http://127.0.0.1:8000', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', '2025-06-22 12:40:54', '2025-06-22 12:40:54'),
(272, 'dg36PX23hxDuYpNbU29PyfdRumEAqYq8suvoLj5V', NULL, 'http://127.0.0.1:8000/login', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', '2025-06-22 12:41:01', '2025-06-22 12:41:01'),
(273, 'xMwdgXphO88nHWf2FcCLinr93X40cZojuUCi5uOH', 71, 'http://127.0.0.1:8000', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', '2025-06-22 12:41:18', '2025-06-22 12:41:18'),
(274, 'dg36PX23hxDuYpNbU29PyfdRumEAqYq8suvoLj5V', NULL, 'http://127.0.0.1:8000/login', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', '2025-06-22 12:41:18', '2025-06-22 12:41:18'),
(275, 'xMwdgXphO88nHWf2FcCLinr93X40cZojuUCi5uOH', 71, 'http://127.0.0.1:8000', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', '2025-06-22 12:41:26', '2025-06-22 12:41:26'),
(276, 'VfI3Ng47UpIMrX97lhF6RJo0SwReAHQej0M2pgFl', 1, 'http://127.0.0.1:8000/admin', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', '2025-06-22 12:41:27', '2025-06-22 12:41:27'),
(277, 'xMwdgXphO88nHWf2FcCLinr93X40cZojuUCi5uOH', 71, 'http://127.0.0.1:8000', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', '2025-06-22 12:41:35', '2025-06-22 12:41:35'),
(278, 'xMwdgXphO88nHWf2FcCLinr93X40cZojuUCi5uOH', 71, 'http://127.0.0.1:8000', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', '2025-06-22 12:41:45', '2025-06-22 12:41:45'),
(279, 'xMwdgXphO88nHWf2FcCLinr93X40cZojuUCi5uOH', 71, 'http://127.0.0.1:8000', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', '2025-06-22 12:41:55', '2025-06-22 12:41:55'),
(280, 'xMwdgXphO88nHWf2FcCLinr93X40cZojuUCi5uOH', 71, 'http://127.0.0.1:8000', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', '2025-06-22 12:42:06', '2025-06-22 12:42:06'),
(281, 'xMwdgXphO88nHWf2FcCLinr93X40cZojuUCi5uOH', 71, 'http://127.0.0.1:8000', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', '2025-06-22 12:42:18', '2025-06-22 12:42:18'),
(282, 'VfI3Ng47UpIMrX97lhF6RJo0SwReAHQej0M2pgFl', 1, 'http://127.0.0.1:8000', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', '2025-06-22 12:42:51', '2025-06-22 12:42:51'),
(283, 'xMwdgXphO88nHWf2FcCLinr93X40cZojuUCi5uOH', 71, 'http://127.0.0.1:8000/compare', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', '2025-06-22 12:43:06', '2025-06-22 12:43:06'),
(284, 'VfI3Ng47UpIMrX97lhF6RJo0SwReAHQej0M2pgFl', 1, 'http://127.0.0.1:8000/admin', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', '2025-06-22 12:43:10', '2025-06-22 12:43:10'),
(285, 'VfI3Ng47UpIMrX97lhF6RJo0SwReAHQej0M2pgFl', 1, 'http://127.0.0.1:8000/admin', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', '2025-06-22 12:43:20', '2025-06-22 12:43:20'),
(286, 'xMwdgXphO88nHWf2FcCLinr93X40cZojuUCi5uOH', 71, 'http://127.0.0.1:8000/chatbot/ask', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', '2025-06-22 12:46:33', '2025-06-22 12:46:33'),
(287, 'xMwdgXphO88nHWf2FcCLinr93X40cZojuUCi5uOH', 71, 'http://127.0.0.1:8000/chatbot/ask', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', '2025-06-22 12:46:43', '2025-06-22 12:46:43'),
(288, 'xMwdgXphO88nHWf2FcCLinr93X40cZojuUCi5uOH', 71, 'http://127.0.0.1:8000/chatbot/ask', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', '2025-06-22 12:47:02', '2025-06-22 12:47:02'),
(289, 'VfI3Ng47UpIMrX97lhF6RJo0SwReAHQej0M2pgFl', 1, 'http://127.0.0.1:8000', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', '2025-06-22 12:47:00', '2025-06-22 12:47:00'),
(290, 'xMwdgXphO88nHWf2FcCLinr93X40cZojuUCi5uOH', 71, 'http://127.0.0.1:8000/chatbot/ask', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', '2025-06-22 12:47:21', '2025-06-22 12:47:21'),
(291, 'VfI3Ng47UpIMrX97lhF6RJo0SwReAHQej0M2pgFl', 1, 'http://127.0.0.1:8000/compare', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', '2025-06-22 12:47:35', '2025-06-22 12:47:35'),
(292, 'VfI3Ng47UpIMrX97lhF6RJo0SwReAHQej0M2pgFl', 1, 'http://127.0.0.1:8000/shop', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', '2025-06-22 12:47:52', '2025-06-22 12:47:52'),
(293, 'xMwdgXphO88nHWf2FcCLinr93X40cZojuUCi5uOH', 71, 'http://127.0.0.1:8000', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', '2025-06-22 12:52:58', '2025-06-22 12:52:58'),
(294, 'VfI3Ng47UpIMrX97lhF6RJo0SwReAHQej0M2pgFl', 1, 'http://127.0.0.1:8000', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', '2025-06-22 13:01:04', '2025-06-22 13:01:04'),
(295, 'VfI3Ng47UpIMrX97lhF6RJo0SwReAHQej0M2pgFl', 1, 'http://127.0.0.1:8000/admin', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', '2025-06-22 13:06:36', '2025-06-22 13:06:36'),
(296, 'VfI3Ng47UpIMrX97lhF6RJo0SwReAHQej0M2pgFl', 1, 'http://127.0.0.1:8000/admin', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', '2025-06-22 13:06:54', '2025-06-22 13:06:54'),
(297, 'VfI3Ng47UpIMrX97lhF6RJo0SwReAHQej0M2pgFl', 1, 'http://127.0.0.1:8000/admin/variants', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', '2025-06-22 13:08:31', '2025-06-22 13:08:31'),
(298, 'VfI3Ng47UpIMrX97lhF6RJo0SwReAHQej0M2pgFl', 1, 'http://127.0.0.1:8000/admin/products', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', '2025-06-22 13:08:40', '2025-06-22 13:08:40'),
(299, 'VfI3Ng47UpIMrX97lhF6RJo0SwReAHQej0M2pgFl', 1, 'http://127.0.0.1:8000/admin', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', '2025-06-22 13:09:54', '2025-06-22 13:09:54'),
(300, 'FWRxDeJ4IDjoS5kfPD0sNfrQ7YvxABhvM1gSvk5R', NULL, 'http://127.0.0.1:8000', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', '2025-06-22 13:23:17', '2025-06-22 13:23:17'),
(301, 'FWRxDeJ4IDjoS5kfPD0sNfrQ7YvxABhvM1gSvk5R', NULL, 'http://127.0.0.1:8000/login', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', '2025-06-22 13:23:25', '2025-06-22 13:23:25'),
(302, 'FWRxDeJ4IDjoS5kfPD0sNfrQ7YvxABhvM1gSvk5R', NULL, 'http://127.0.0.1:8000/login', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', '2025-06-22 13:23:31', '2025-06-22 13:23:31'),
(303, '1HN5cgT6GobTyQ06lLIO3WybGtFZqpQDbnH11vMA', 1, 'http://127.0.0.1:8000/admin', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', '2025-06-22 13:23:34', '2025-06-22 13:23:34'),
(304, 'hXYI5W8ex68X6HkoBlYukFBLo5sBADnFjTLBpQ0l', NULL, 'http://127.0.0.1:8000', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', '2025-06-23 08:58:56', '2025-06-23 08:58:56'),
(305, 'rzTHP2QkrhDWRzLrcWaGEmMf1s40VMaLt33H3hFj', NULL, 'http://127.0.0.1:8000/login', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', '2025-06-23 08:59:11', '2025-06-23 08:59:11'),
(306, 'rzTHP2QkrhDWRzLrcWaGEmMf1s40VMaLt33H3hFj', NULL, 'http://127.0.0.1:8000/login', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', '2025-06-23 08:59:21', '2025-06-23 08:59:21'),
(307, 'rzTHP2QkrhDWRzLrcWaGEmMf1s40VMaLt33H3hFj', NULL, 'http://127.0.0.1:8000/login', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', '2025-06-23 08:59:25', '2025-06-23 08:59:25'),
(308, 'rzTHP2QkrhDWRzLrcWaGEmMf1s40VMaLt33H3hFj', NULL, 'http://127.0.0.1:8000/login', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', '2025-06-23 08:59:27', '2025-06-23 08:59:27'),
(309, 'sAE2cHyaGPcHI61hiCSiLtewZWTy4jYxUHWa7xAa', 1, 'http://127.0.0.1:8000/admin', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', '2025-06-23 08:59:32', '2025-06-23 08:59:32'),
(310, 'sAE2cHyaGPcHI61hiCSiLtewZWTy4jYxUHWa7xAa', 1, 'http://127.0.0.1:8000', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', '2025-06-23 09:55:31', '2025-06-23 09:55:31'),
(311, 'sAE2cHyaGPcHI61hiCSiLtewZWTy4jYxUHWa7xAa', 1, 'http://127.0.0.1:8000/product/iphone-15-pro-max-1750314062', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', '2025-06-23 09:56:53', '2025-06-23 09:56:53'),
(312, 'sAE2cHyaGPcHI61hiCSiLtewZWTy4jYxUHWa7xAa', 1, 'http://127.0.0.1:8000/product/iphone-15-pro-max-1750314062', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', '2025-06-23 10:00:06', '2025-06-23 10:00:06'),
(313, 'sAE2cHyaGPcHI61hiCSiLtewZWTy4jYxUHWa7xAa', 1, 'http://127.0.0.1:8000/checkout?image=http%3A%2F%2F127.0.0.1%3A8000%2Fuploads%2Fproducts%2F1750314063_0_iphone-16-pro-max-titan-trang-thumb-650x650.png&quantity=1&variant_id=244', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', '2025-06-23 10:00:12', '2025-06-23 10:00:12'),
(314, 'sAE2cHyaGPcHI61hiCSiLtewZWTy4jYxUHWa7xAa', 1, 'http://127.0.0.1:8000/product/iphone-15-pro-max-1750314062', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', '2025-06-23 10:00:13', '2025-06-23 10:00:13'),
(315, 'sAE2cHyaGPcHI61hiCSiLtewZWTy4jYxUHWa7xAa', 1, 'http://127.0.0.1:8000/logout', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', '2025-06-23 10:00:23', '2025-06-23 10:00:23'),
(316, 'hrTESEsQfRc7SpZ6VDQ7qTZASbHf3DdhbyU2iR2A', NULL, 'http://127.0.0.1:8000/login', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', '2025-06-23 10:00:25', '2025-06-23 10:00:25'),
(317, 'hrTESEsQfRc7SpZ6VDQ7qTZASbHf3DdhbyU2iR2A', NULL, 'http://127.0.0.1:8000/auth/google', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', '2025-06-23 10:00:30', '2025-06-23 10:00:30'),
(318, 'hrTESEsQfRc7SpZ6VDQ7qTZASbHf3DdhbyU2iR2A', NULL, 'http://127.0.0.1:8000/register', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', '2025-06-23 10:01:01', '2025-06-23 10:01:01'),
(319, 'hrTESEsQfRc7SpZ6VDQ7qTZASbHf3DdhbyU2iR2A', NULL, 'http://127.0.0.1:8000/register', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', '2025-06-23 10:01:50', '2025-06-23 10:01:50'),
(320, 'hrTESEsQfRc7SpZ6VDQ7qTZASbHf3DdhbyU2iR2A', NULL, 'http://127.0.0.1:8000/register', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', '2025-06-23 10:01:53', '2025-06-23 10:01:53'),
(321, 'hrTESEsQfRc7SpZ6VDQ7qTZASbHf3DdhbyU2iR2A', NULL, 'http://127.0.0.1:8000/register', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', '2025-06-23 10:04:58', '2025-06-23 10:04:58'),
(322, 'hrTESEsQfRc7SpZ6VDQ7qTZASbHf3DdhbyU2iR2A', NULL, 'http://127.0.0.1:8000/register', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', '2025-06-23 10:04:59', '2025-06-23 10:04:59'),
(323, 'hrTESEsQfRc7SpZ6VDQ7qTZASbHf3DdhbyU2iR2A', NULL, 'http://127.0.0.1:8000/login', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', '2025-06-23 10:06:41', '2025-06-23 10:06:41'),
(324, 'hrTESEsQfRc7SpZ6VDQ7qTZASbHf3DdhbyU2iR2A', NULL, 'http://127.0.0.1:8000/login', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', '2025-06-23 10:06:50', '2025-06-23 10:06:50'),
(325, 'MwUv5wPJthdsCy91WEQS5lQGOy73uhpDTERJKUn3', 71, 'http://127.0.0.1:8000', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', '2025-06-23 10:06:53', '2025-06-23 10:06:53'),
(326, 'MwUv5wPJthdsCy91WEQS5lQGOy73uhpDTERJKUn3', 71, 'http://127.0.0.1:8000/product/airpods-pro-2nd-gen-usb-c-1750313767', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', '2025-06-23 10:06:59', '2025-06-23 10:06:59'),
(327, 'MwUv5wPJthdsCy91WEQS5lQGOy73uhpDTERJKUn3', 71, 'http://127.0.0.1:8000/product/iphone-15-pro-max-1750314062', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', '2025-06-23 10:07:01', '2025-06-23 10:07:01'),
(328, 'MwUv5wPJthdsCy91WEQS5lQGOy73uhpDTERJKUn3', 71, 'http://127.0.0.1:8000/checkout?image=http%3A%2F%2F127.0.0.1%3A8000%2Fuploads%2Fproducts%2F1750314063_0_iphone-16-pro-max-titan-trang-thumb-650x650.png&quantity=1&variant_id=244', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', '2025-06-23 10:07:11', '2025-06-23 10:07:11'),
(329, 'MwUv5wPJthdsCy91WEQS5lQGOy73uhpDTERJKUn3', 71, 'http://127.0.0.1:8000/checkout', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', '2025-06-23 10:07:29', '2025-06-23 10:07:29'),
(330, 'MwUv5wPJthdsCy91WEQS5lQGOy73uhpDTERJKUn3', 71, 'http://127.0.0.1:8000/order', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', '2025-06-23 10:07:54', '2025-06-23 10:07:54'),
(331, 'MwUv5wPJthdsCy91WEQS5lQGOy73uhpDTERJKUn3', 71, 'http://127.0.0.1:8000/order', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', '2025-06-23 10:11:39', '2025-06-23 10:11:39');

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
(152, 'iPhone 15 Pro Max test 2', 'iphone-15-pro-max-test-2-1750518034', 'aaaaaa', '<p>aaaaaa</p>', 25, 12, 0, 'active', 77, '2025-06-17 13:23:02', '2025-06-21 22:00:34', NULL),
(153, 'AirPods Pro (2nd Gen) USB-C', 'airpods-pro-2nd-gen-usb-c-1750313767', NULL, NULL, 28, 12, 0, 'active', 10, '2025-06-19 13:16:07', '2025-06-23 10:06:59', NULL),
(154, 'iPhone 15 Pro Max', 'iphone-15-pro-max-1750314062', NULL, NULL, 25, 12, 0, 'active', 7, '2025-06-19 13:21:02', '2025-06-23 10:07:01', NULL),
(155, 'iPhone 14 Pro Max', 'iphone-14-pro-max-1750314182', NULL, NULL, 25, 12, 0, 'active', 15, '2025-06-19 13:23:02', '2025-06-22 10:56:43', NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `product_reviews`
--

CREATE TABLE `product_reviews` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `variant_id` bigint(20) UNSIGNED DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `rating` int(11) DEFAULT NULL,
  `review` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `images` json DEFAULT NULL
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
(366, 155, 14, 'iOS 17', '2025-06-19 13:23:02', '2025-06-19 13:23:02', NULL),
(367, 155, 15, 'Apple A15 Bionic 6 nhân', '2025-06-19 13:23:02', '2025-06-19 13:23:02', NULL),
(368, 155, 16, '3.22 GHz', '2025-06-19 13:23:02', '2025-06-19 13:23:02', NULL),
(369, 155, 17, 'Apple GPU 5 nhân', '2025-06-19 13:23:02', '2025-06-19 13:23:02', NULL),
(370, 155, 18, '6 GB', '2025-06-19 13:23:02', '2025-06-19 13:23:02', NULL),
(371, 155, 21, 'Không giới hạn', '2025-06-19 13:23:02', '2025-06-19 13:23:02', NULL),
(372, 152, 14, 'aaaaaa', '2025-06-21 10:13:11', '2025-06-21 22:00:34', '2025-06-21 22:00:34'),
(373, 152, 15, 'aaaaaa', '2025-06-21 10:13:11', '2025-06-21 22:00:34', '2025-06-21 22:00:34'),
(374, 152, 16, 'aaaaaa', '2025-06-21 10:13:11', '2025-06-21 22:00:34', '2025-06-21 22:00:34'),
(375, 152, 17, 'aaaaaa', '2025-06-21 10:13:11', '2025-06-21 22:00:34', '2025-06-21 22:00:34'),
(376, 152, 18, 'aaaaaa', '2025-06-21 10:13:11', '2025-06-21 22:00:34', '2025-06-21 22:00:34'),
(377, 152, 21, 'aaaaaa', '2025-06-21 10:13:11', '2025-06-21 22:00:34', '2025-06-21 22:00:34'),
(378, 152, 14, 'aaaaaa', '2025-06-21 22:00:34', '2025-06-21 22:00:34', NULL),
(379, 152, 15, 'aaaaaa', '2025-06-21 22:00:34', '2025-06-21 22:00:34', NULL),
(380, 152, 16, 'aaaaaa', '2025-06-21 22:00:34', '2025-06-21 22:00:34', NULL),
(381, 152, 17, 'aaaaaa', '2025-06-21 22:00:34', '2025-06-21 22:00:34', NULL),
(382, 152, 18, 'aaaaaa', '2025-06-21 22:00:34', '2025-06-21 22:00:34', NULL),
(383, 152, 21, 'aaaaaa', '2025-06-21 22:00:34', '2025-06-21 22:00:34', NULL);

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
(239, 152, 'SP-68348', 'iPhone 15 Pro Max test 2 - 1TB', 'iphone-15-pro-max-test-2-1tb', NULL, 3, 'active', 1, '2025-06-17 13:23:02', '2025-06-21 22:00:34', NULL, '\"[\\\"uploads\\\\/products\\\\/1750141382_0_macbook-air-13-inch-m4-12-638772027208679591-650x650.jpg\\\",\\\"uploads\\\\/products\\\\/1750141382_0_macbook-air-13-inch-m4-13-638772027216304066-650x650.jpg\\\",\\\"uploads\\\\/products\\\\/1750141382_0_macbook-air-13-inch-m4-14-638772027222384420-650x650.jpg\\\",\\\"uploads\\\\/products\\\\/1750141382_0_macbook-air-13-inch-m4-15-638772027228926275-650x650.jpg\\\",\\\"uploads\\\\/products\\\\/1750141382_0_macbook-air-13-inch-m4-16-638772027238166613-650x650.jpg\\\",\\\"uploads\\\\/products\\\\/1750141382_0_macbook-air-13-inch-m4-18-638772027245004354-650x650.jpg\\\",\\\"uploads\\\\/products\\\\/1750141382_0_macbook-air-13-inch-m4-19-638772027251967937-650x650.jpg\\\",\\\"uploads\\\\/products\\\\/1750141382_0_macbook-air-13-inch-m4-20-638772027259250283-650x650.jpg\\\",\\\"uploads\\\\/products\\\\/1750141382_0_macbook-air-13-inch-m4-21-638772027266138378-650x650.jpg\\\",\\\"uploads\\\\/products\\\\/1750141382_0_macbook-air-13-inch-m4-22-638772027273564585-650x650.jpg\\\",\\\"uploads\\\\/products\\\\/1750141382_0_macbook-air-13-inch-m4-thumb-xanh-da-troi-650x650.png\\\",\\\"uploads\\\\/products\\\\/1750151208_0_macbook-air-13-inch-m4-thumb-xanh-da-troi-650x650.png\\\"]\"', 333.00, 55125.00),
(240, 152, 'SP-66578', 'iPhone 15 Pro Max test 2 - Titan đen - 1TB', 'iphone-15-pro-max-test-2-titan-den-1tb', NULL, 222, 'active', 0, '2025-06-17 13:23:02', '2025-06-21 22:00:34', NULL, '\"[\\\"uploads\\\\/products\\\\/1750141382_1_macbook-air-13-inch-m4-12-638772027208679591-650x650.jpg\\\",\\\"uploads\\\\/products\\\\/1750152130_1_macbook-air-13-inch-m4-13-638772027216304066-650x650.jpg\\\",\\\"uploads\\\\/products\\\\/1750152130_1_macbook-air-13-inch-m4-14-638772027222384420-650x650.jpg\\\",\\\"uploads\\\\/products\\\\/1750152130_1_macbook-air-13-inch-m4-15-638772027228926275-650x650.jpg\\\",\\\"uploads\\\\/products\\\\/1750152130_1_macbook-air-13-inch-m4-16-638772027238166613-650x650.jpg\\\",\\\"uploads\\\\/products\\\\/1750152130_1_macbook-air-13-inch-m4-18-638772027245004354-650x650.jpg\\\",\\\"uploads\\\\/products\\\\/1750152130_1_macbook-air-13-inch-m4-19-638772027251967937-650x650.jpg\\\",\\\"uploads\\\\/products\\\\/1750152130_1_macbook-air-13-inch-m4-20-638772027259250283-650x650.jpg\\\",\\\"uploads\\\\/products\\\\/1750152130_1_macbook-air-13-inch-m4-21-638772027266138378-650x650.jpg\\\",\\\"uploads\\\\/products\\\\/1750152130_1_macbook-air-13-inch-m4-22-638772027273564585-650x650.jpg\\\"]\"', 333.00, 444.00),
(243, 153, 'SP-17661', 'AirPods Pro (2nd Gen) USB-C - Titan đen', 'airpods-pro-2nd-gen-usb-c-titan-den-1750313768-0', NULL, 110, 'active', 1, '2025-06-19 13:16:08', '2025-06-20 16:04:21', NULL, '\"[\\\"uploads\\\\/products\\\\/1750313768_0_Danh m\\\\u1ee5c tai nghe, loa.png\\\"]\"', 111.00, 1222111.00),
(244, 154, 'SP-62058', 'iPhone 15 Pro Max - Titan trắng - 256GB', 'iphone-15-pro-max-titan-trang-256gb-1750314063-0', NULL, 110, 'active', 1, '2025-06-19 13:21:03', '2025-06-23 10:07:30', NULL, '\"[\\\"uploads\\\\/products\\\\/1750314063_0_iphone-16-pro-max-titan-trang-thumb-650x650.png\\\",\\\"uploads\\\\/products\\\\/1750314063_0_iphone-16-pro-max-white-titan-1-638621796200037842-650x650.jpg\\\",\\\"uploads\\\\/products\\\\/1750314063_0_iphone-16-pro-max-white-titan-2-638621796206835851-650x650.jpg\\\",\\\"uploads\\\\/products\\\\/1750314063_0_iphone-16-pro-max-white-titan-3-638621796214529645-650x650.jpg\\\",\\\"uploads\\\\/products\\\\/1750314063_0_iphone-16-pro-max-white-titan-4-638621796221313391-650x650.jpg\\\",\\\"uploads\\\\/products\\\\/1750314063_0_iphone-16-pro-max-white-titan-5-638621796229996324-650x650.jpg\\\",\\\"uploads\\\\/products\\\\/1750314063_0_iphone-16-pro-max-white-titan-6-638621796236451102-650x650.jpg\\\",\\\"uploads\\\\/products\\\\/1750314063_0_iphone-16-pro-max-white-titan-7-638621796244285270-650x650.jpg\\\",\\\"uploads\\\\/products\\\\/1750314063_0_iphone-16-pro-max-white-titan-8-638621796251114174-650x650.jpg\\\",\\\"uploads\\\\/products\\\\/1750314063_0_iphone-16-pro-max-white-titan-9-638621796259552967-650x650.jpg\\\",\\\"uploads\\\\/products\\\\/1750314063_0_iphone-16-pro-max-white-titan-10-638621796266688217-650x650.jpg\\\"]\"', 222.00, 333.00),
(245, 155, 'SP-47209', 'iPhone 14 Pro Max - Titan tự nhiên - 512GB', 'iphone-14-pro-max-titan-tu-nhien-512gb-1750314183-0', NULL, 221, 'active', 1, '2025-06-19 13:23:03', '2025-06-19 14:18:33', NULL, '\"[\\\"uploads\\\\/products\\\\/1750314183_0_iphone-16-pro-max-16-titan-tu-nhien-thumbnew-650x650.png\\\",\\\"uploads\\\\/products\\\\/1750314183_0_iphone-16-pro-max-natural-titan-1-638621796879976392-650x650.jpg\\\",\\\"uploads\\\\/products\\\\/1750314183_0_iphone-16-pro-max-natural-titan-2-638621796887193177-650x650.jpg\\\",\\\"uploads\\\\/products\\\\/1750314183_0_iphone-16-pro-max-natural-titan-3-638621796896942566-650x650.jpg\\\",\\\"uploads\\\\/products\\\\/1750314183_0_iphone-16-pro-max-natural-titan-4-638621796904877336-650x650.jpg\\\",\\\"uploads\\\\/products\\\\/1750314183_0_iphone-16-pro-max-natural-titan-5-638621796913722191-650x650.jpg\\\",\\\"uploads\\\\/products\\\\/1750314183_0_iphone-16-pro-max-natural-titan-6-638621796921000093-650x650.jpg\\\",\\\"uploads\\\\/products\\\\/1750314183_0_iphone-16-pro-max-natural-titan-7-638621796927764642-650x650.jpg\\\",\\\"uploads\\\\/products\\\\/1750314183_0_iphone-16-pro-max-natural-titan-8-638621796937887668-650x650.jpg\\\",\\\"uploads\\\\/products\\\\/1750314183_0_iphone-16-pro-max-natural-titan-9-638621796945020418-650x650.jpg\\\",\\\"uploads\\\\/products\\\\/1750314183_0_iphone-16-pro-max-natural-titan-10-638621796955273943-650x650.jpg\\\"]\"', 222.00, 222.00);

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
(284, 71, 154, '2025-06-23 03:07:09');

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
  `last_activity` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`, `created_at`, `updated_at`) VALUES
('1HN5cgT6GobTyQ06lLIO3WybGtFZqpQDbnH11vMA', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'YTo1OntzOjY6Il90b2tlbiI7czo0MDoiRmtGZW9hdm54cEVyZjNvMEIxWU1sSVFtM1VpelJaVEJhNGFoMUVZRiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjc6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hZG1pbiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fXM6NTA6ImxvZ2luX3dlYl81OWJhMzZhZGRjMmIyZjk0MDE1ODBmMDE0YzdmNThlYTRlMzA5ODlkIjtpOjE7czoxNzoicGFzc3dvcmRfaGFzaF93ZWIiO3M6NjA6IiQyeSQxMiRzaTdnUnlkYkplNnVQRHovMHB4cUR1aXB3RHdUOVEvMnBWcGYwSHBTNmsvbHQ1ejcwVWh0dSI7fQ==', 1750573416, '2025-06-22 13:23:36', '2025-06-22 13:23:36'),
('hXYI5W8ex68X6HkoBlYukFBLo5sBADnFjTLBpQ0l', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiNnlFd080WDVhOGRSSFdMOU9vdEdVR0hwU0xCelJtT2tnVHBGVndrTiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1750643944, NULL, NULL),
('Mk5SGl8tDxQOEI0dqKvbCRkOGQbejgpfAqFvuRjd', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoib3hFNEZlajNMVnZpa1R6YXV4R3FUZmZ0NzZvVGVLSXNwU0hZeXNYbyI7czozOiJ1cmwiO2E6MTp7czo4OiJpbnRlbmRlZCI7czoyNzoiaHR0cDovLzEyNy4wLjAuMTo4MDAwL2FkbWluIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1750643948, NULL, NULL),
('MwUv5wPJthdsCy91WEQS5lQGOy73uhpDTERJKUn3', 71, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 'YTo2OntzOjY6Il90b2tlbiI7czo0MDoiVmtpeXIzQzZ6R0xYVkFYcDlxMHIyM1NjY3o1Yzc3OW5YekxOclpkViI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjc6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9vcmRlciI7fXM6NToic3RhdGUiO3M6NDA6IlVMcGNoNEVCSGVNNkpwZUowVWd4ZktKczljajBzZVF0MWVQU3RpaFMiO3M6NTA6ImxvZ2luX3dlYl81OWJhMzZhZGRjMmIyZjk0MDE1ODBmMDE0YzdmNThlYTRlMzA5ODlkIjtpOjcxO3M6MTc6InBhc3N3b3JkX2hhc2hfd2ViIjtzOjYwOiIkMnkkMTIkcnA3dHdZT1ltdDlqdHk5ZkNVcTBxTzJzb01IVFhMUEg0OGN0Si9FdEFWajNiTHZCNnFYNTYiO30=', 1750648300, '2025-06-23 10:06:53', '2025-06-23 10:06:53'),
('uhWVZGXW5cNaRl93XpQaM3iSFbk7uUHWbIHLwvWN', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiNVdzNDdkanZIOGxJaUtvVGw5dlpDdVpudE90SGF6MVJoRXhXNzlPSyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTg6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9wcm9kdWN0L2lwaG9uZS0xNC1wcm8tbWF4LTE3NTAzMTQxODIiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1750564609, NULL, NULL),
('VfI3Ng47UpIMrX97lhF6RJo0SwReAHQej0M2pgFl', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 'YTo1OntzOjY6Il90b2tlbiI7czo0MDoiVG1WdDBITExxTUZOamZPenRjRHJGaWprV1NURW0zbW1PNWhadmo4ayI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjc6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hZG1pbiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fXM6NTA6ImxvZ2luX3dlYl81OWJhMzZhZGRjMmIyZjk0MDE1ODBmMDE0YzdmNThlYTRlMzA5ODlkIjtpOjE7czoxNzoicGFzc3dvcmRfaGFzaF93ZWIiO3M6NjA6IiQyeSQxMiRzaTdnUnlkYkplNnVQRHovMHB4cUR1aXB3RHdUOVEvMnBWcGYwSHBTNmsvbHQ1ejcwVWh0dSI7fQ==', 1750572601, '2025-06-22 12:41:33', '2025-06-22 12:41:33'),
('xMwdgXphO88nHWf2FcCLinr93X40cZojuUCi5uOH', 71, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'YTo1OntzOjY6Il90b2tlbiI7czo0MDoiOGtXQjNNekRwMnpBU0lWM2hLblp0aEJvNEw0WDFVcWk2MnNmUlYzVyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fXM6NTA6ImxvZ2luX3dlYl81OWJhMzZhZGRjMmIyZjk0MDE1ODBmMDE0YzdmNThlYTRlMzA5ODlkIjtpOjcxO3M6MTc6InBhc3N3b3JkX2hhc2hfd2ViIjtzOjYwOiIkMnkkMTIkcnA3dHdZT1ltdDlqdHk5ZkNVcTBxTzJzb01IVFhMUEg0OGN0Si9FdEFWajNiTHZCNnFYNTYiO30=', 1750571579, '2025-06-22 12:19:52', '2025-06-22 12:19:52');

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
-- Cấu trúc bảng cho bảng `shipping_orders`
--

CREATE TABLE `shipping_orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `ghn_order_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Mã đơn hàng từ GHN',
  `client_order_code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Mã đơn hàng của shop',
  `to_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `to_phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `to_address` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `to_ward_code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `to_district_id` int(11) NOT NULL,
  `to_province_id` int(11) DEFAULT NULL,
  `cod_amount` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT 'Số tiền thu hộ',
  `shipping_fee` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT 'Phí vận chuyển',
  `insurance_value` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT 'Giá trị bảo hiểm',
  `service_type_id` int(11) NOT NULL DEFAULT '2' COMMENT 'Loại dịch vụ: 1-Fast, 2-Standard, 3-Slow',
  `service_id` int(11) DEFAULT NULL COMMENT 'ID dịch vụ cụ thể',
  `payment_type_id` int(11) NOT NULL DEFAULT '1' COMMENT 'Loại thanh toán: 1-Sender, 2-Receiver',
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending' COMMENT 'Trạng thái vận chuyển',
  `tracking_number` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Mã tracking',
  `estimated_delivery_time` timestamp NULL DEFAULT NULL COMMENT 'Thời gian dự kiến giao hàng',
  `actual_delivery_time` timestamp NULL DEFAULT NULL COMMENT 'Thời gian thực tế giao hàng',
  `note` text COLLATE utf8mb4_unicode_ci COMMENT 'Ghi chú',
  `cancel_reason` text COLLATE utf8mb4_unicode_ci COMMENT 'Lý do hủy',
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
(1, 'Admin ', 'admin@gmail.com', NULL, '$2y$12$si7gRydbJe6uPDz/0pxqDuipwDwT9Q/2pVpf0HpS6k/lt5z70Uhtu', NULL, NULL, '0123456789', 'Hanoi', NULL, NULL, 'other', 0, '2025-06-23 08:59:30', 'active', 'dc5as6cQKvPTzUyKYIvXjqhhBydguOQNTWFhUoe9cbsSfeiXz6EyfkojFv2O', '2025-05-16 15:31:25', '2025-06-23 08:59:30', NULL),
(2, 'Staff ', 'staffp@gmail.com', NULL, '$2y$12$de5HWZYmyu9wLPmTzHmyJOjVt1J1uxTaBtWCyQQgZj/kIpNR7At3a', NULL, NULL, '0987654321', 'Hanoi', NULL, NULL, 'other', 0, NULL, 'active', NULL, '2025-05-15 12:40:59', '2025-05-15 12:40:59', NULL),
(19, 'Staff User', 'staffp@example.com', NULL, '$2y$12$WHrqm55gWHco5y8WkiNczeLnELUpkpEj3eJC3tOAxHV2QUp1o0DJm', NULL, NULL, '0987654321', 'Hanoi', NULL, NULL, 'other', 0, '2025-06-17 21:16:42', 'active', NULL, '2025-05-23 14:48:11', '2025-06-17 21:16:42', NULL),
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
(42, 'đại học coder', 'daichuvan95@gmail.com', NULL, '$2y$12$zabvva8SdzabLKbOkbzvKOxczOwxUaExwGePOUB3mjF7wlyA3B/V2', NULL, NULL, '0968791308', 'Vọng Giang', NULL, '2025-05-05', 'male', 0, '2025-06-21 16:54:50', 'inactive', NULL, '2025-05-28 14:57:13', '2025-06-21 16:54:50', NULL),
(43, 'Cường', 'test@gmail.com', NULL, '$2y$12$3n6LLncP6oIAforDGEkCKO5YEp/mhdvHQwK4UU2thehOUNRGmzBha', NULL, NULL, '09876543', 'Hà Nội', NULL, '2025-05-28', 'male', 0, '2025-06-19 22:00:19', 'active', NULL, '2025-05-28 22:46:16', '2025-06-19 22:00:19', NULL),
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
(71, 'Kim Hồng Phong', 'phongk211005@gmail.com', NULL, '$2y$12$rp7twYOYmt9jty9fCUq0qO2soMHTXLPH48ctJ/EtAVj3bLvB6qX56', NULL, NULL, '0973067464', 'Tx. Thái Hòa', NULL, '2025-06-11', 'male', 0, '2025-06-23 10:06:52', 'active', NULL, '2025-06-11 08:41:22', '2025-06-23 10:06:52', NULL),
(72, 'Sasasa', 'sasa@gmail.com', NULL, '$2y$12$fgOECBmANwtUwB5yXtKzMe/XE788BzJ9a6yxxFLew4m4vzGiUX2jy', NULL, NULL, '0987233444', 'Hà Nội, Việt Nam', 'uploads/users/1749606552.jpg', '2025-06-11', 'male', 0, '2025-06-11 08:59:52', 'active', NULL, '2025-06-11 08:49:12', '2025-06-11 08:59:52', NULL),
(73, 'Dớ Văn Hải', 'hai@gmail.com', NULL, '$2y$12$f8RGEGkRociQvEe4rZP8guR3K3E9HPT6fNn8NF1Hc37OsipBkcKeu', NULL, NULL, '0973067464', 'Tx. Thái Hòa', 'uploads/users/1749608295.jpg', '2025-06-27', 'male', 0, '2025-06-14 22:04:40', 'active', NULL, '2025-06-11 09:18:15', '2025-06-14 22:04:40', NULL),
(74, 'Banh là tester', 'banhtester3@gmail.com', NULL, '$2y$12$MU1poTdfxhsbpDKz.Befbedmry0wSyE50fwye.OxAiX.gupl//ZJ6', NULL, NULL, '0368706552', 'Số nhà 71, phố tiền phong, phường tiên cát', '/uploads/avatar/1749632129.jpg', '2025-05-29', 'male', 0, '2025-06-21 16:04:00', 'active', NULL, '2025-06-11 09:25:05', '2025-06-21 16:04:00', NULL),
(75, 'âsasd', 'aad@gmail.com', NULL, '$2y$12$vcmY9KDXL7TpT4L6opulIut6rPi/4Bg61u3km4ggB6c/OoG3fUCUm', NULL, NULL, '0368706552', 'Số nhà 71, phố tiền phong, phường tiên cát', NULL, '2025-06-04', 'male', 0, NULL, 'active', NULL, '2025-06-11 21:13:06', '2025-06-11 21:13:06', NULL),
(76, 'Mạnh Cường Nguyễn', 'cuongnmph50179@gmail.com', '2025-06-13 21:22:09', '$2y$12$7Bv46Tz3cGlclwO0NGvnROs1LsyWeEeHjQslPzN8qiqvA7u0X8vK6', 'google', '104624917371279928945', NULL, NULL, 'https://lh3.googleusercontent.com/a/ACg8ocK0-i1PegLtv3q4m1wr9zz-1ijX0PlHybhgc1wCGlNH99DdJQ=s96-c', NULL, 'other', 0, '2025-06-13 21:22:09', 'active', NULL, '2025-06-13 21:22:09', '2025-06-13 21:22:09', NULL),
(77, 'banhyeuem', 'banh2005@gmail.com', NULL, '$2y$12$UC7fUF/6m4dzpCi6AK/EFu8/XDyOKr2pShqdrCWnD5wr/UyB9hQxG', NULL, NULL, '0368706552', 'Số nhà 71, phố tiền phong, phường tiên cát', NULL, '2025-06-11', 'male', 0, '2025-06-21 16:05:03', 'active', NULL, '2025-06-18 21:16:18', '2025-06-21 16:05:03', NULL);

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
(64, 'Dung lượng', '[\"25\", \"26\"]', 'text', 0, 'active', '2025-06-16 13:52:28', '2025-06-16 23:23:14', NULL),
(65, 'Màu sắc Iphone', '[\"25\"]', 'text', 0, 'active', '2025-06-17 15:00:33', '2025-06-17 15:03:17', '2025-06-17 15:03:17'),
(66, 'Màu sắc Iphone 15', '[\"25\"]', 'text', 0, 'active', '2025-06-19 10:44:59', '2025-06-19 10:44:59', NULL);

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
(159, 66, '[\"Đen\"]', '[\"#4b4f50\"]', 'active', '2025-06-19 10:45:51', '2025-06-19 10:46:57', NULL);

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
(300, 239, 141, '2025-06-17 13:23:02', '2025-06-20 16:24:16', NULL),
(301, 239, 150, '2025-06-17 13:23:02', '2025-06-20 16:24:16', NULL),
(302, 240, 142, '2025-06-17 13:23:02', '2025-06-18 14:49:56', NULL),
(303, 240, 150, '2025-06-17 13:23:02', '2025-06-18 14:49:56', NULL),
(308, 243, 142, '2025-06-19 13:16:08', '2025-06-20 16:04:21', NULL),
(309, 244, 144, '2025-06-19 13:21:03', '2025-06-19 13:21:03', NULL),
(310, 244, 148, '2025-06-19 13:21:03', '2025-06-19 13:21:03', NULL),
(311, 245, 143, '2025-06-19 13:23:03', '2025-06-19 13:23:03', NULL),
(312, 245, 149, '2025-06-19 13:23:03', '2025-06-19 13:23:03', NULL);

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
-- Đang đổ dữ liệu cho bảng `wishlists`
--

INSERT INTO `wishlists` (`id`, `user_id`, `product_id`, `created_at`, `updated_at`) VALUES
(111, 71, 155, '2025-06-22 04:59:48', NULL);

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
  ADD KEY `orders_shipping_method_id_foreign` (`shipping_method_id`),
  ADD KEY `orders_voucher_id_foreign` (`voucher_id`);

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
  ADD UNIQUE KEY `product_reviews_user_id_variant_id_unique` (`user_id`,`variant_id`),
  ADD KEY `product_reviews_product_id_foreign` (`product_id`),
  ADD KEY `product_reviews_user_id_foreign` (`user_id`),
  ADD KEY `product_reviews_variant_id_foreign` (`variant_id`);

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
-- Chỉ mục cho bảng `shipping_orders`
--
ALTER TABLE `shipping_orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `shipping_orders_order_id_index` (`order_id`),
  ADD KEY `shipping_orders_ghn_order_code_index` (`ghn_order_code`),
  ADD KEY `shipping_orders_client_order_code_index` (`client_order_code`),
  ADD KEY `shipping_orders_status_index` (`status`),
  ADD KEY `shipping_orders_tracking_number_index` (`tracking_number`);

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=112;

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=77;

--
-- AUTO_INCREMENT cho bảng `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=291;

--
-- AUTO_INCREMENT cho bảng `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=152;

--
-- AUTO_INCREMENT cho bảng `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=100;

--
-- AUTO_INCREMENT cho bảng `order_details`
--
ALTER TABLE `order_details`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `order_items`
--
ALTER TABLE `order_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=103;

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=332;

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `product_specifications`
--
ALTER TABLE `product_specifications`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=384;

--
-- AUTO_INCREMENT cho bảng `product_variants`
--
ALTER TABLE `product_variants`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=246;

--
-- AUTO_INCREMENT cho bảng `product_views`
--
ALTER TABLE `product_views`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=285;

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
-- AUTO_INCREMENT cho bảng `shipping_orders`
--
ALTER TABLE `shipping_orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=78;

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=67;

--
-- AUTO_INCREMENT cho bảng `variant_attribute_values`
--
ALTER TABLE `variant_attribute_values`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=160;

--
-- AUTO_INCREMENT cho bảng `variant_combinations`
--
ALTER TABLE `variant_combinations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=313;

--
-- AUTO_INCREMENT cho bảng `vouchers`
--
ALTER TABLE `vouchers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT cho bảng `wishlists`
--
ALTER TABLE `wishlists`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=112;

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
-- Các ràng buộc cho bảng `search_histories`
--
ALTER TABLE `search_histories`
  ADD CONSTRAINT `search_histories_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Các ràng buộc cho bảng `shipping_orders`
--
ALTER TABLE `shipping_orders`
  ADD CONSTRAINT `shipping_orders_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE;

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
