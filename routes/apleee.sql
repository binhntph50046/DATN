/*
 Navicat Premium Dump SQL

 Source Server         : storeapple
 Source Server Type    : MySQL
 Source Server Version : 50743 (5.7.43-log)
 Source Host           : 103.253.21.168:3306
 Source Schema         : applestore

 Target Server Type    : MySQL
 Target Server Version : 50743 (5.7.43-log)
 File Encoding         : 65001

 Date: 19/06/2025 14:07:32
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for banners
-- ----------------------------
DROP TABLE IF EXISTS `banners`;
CREATE TABLE `banners`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `link` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `status` enum('active','inactive') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `order` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 17 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of banners
-- ----------------------------
INSERT INTO `banners` VALUES (1, 'Khám Phá Thiết Bị Công Nghệ Mới Nhất', 'uploads/banners/68450b64495d8.jpg', 'Sở hữu sản phẩm chính hãng, chất lượng vượt trội, giá ưu đãi.', NULL, 'active', 1, '2025-05-08 15:17:47', '2025-06-14 22:01:59');
INSERT INTO `banners` VALUES (2, 'Phụ Kiện Công Nghệ Cao Cấp', 'uploads/banners/68450be6afb67.jpg', 'Đa dạng mẫu mã – Bảo vệ thiết bị – Tăng trải nghiệm sử dụng.', NULL, 'active', 2, '2025-05-08 15:17:48', '2025-06-14 22:06:16');
INSERT INTO `banners` VALUES (3, 'Ưu Đãi Hấp Dẫn Dành Riêng Cho Bạn', 'uploads/banners/68450b9d61c0e.jpg', 'Giảm giá, quà tặng và nhiều đặc quyền khi mua sắm hôm nay.', NULL, 'active', 3, '2025-05-08 15:17:48', '2025-06-14 22:06:39');
INSERT INTO `banners` VALUES (4, 'Mua Sắm Dễ Dàng – Giao Hàng Tận Nhà', 'uploads/banners/68450bb6a924e.jpg', 'Dịch vụ nhanh chóng – Thanh toán linh hoạt – Hỗ trợ tận tâm.', NULL, 'active', 7, '2025-05-08 15:17:49', '2025-06-14 22:07:15');

-- ----------------------------
-- Table structure for blogs
-- ----------------------------
DROP TABLE IF EXISTS `blogs`;
CREATE TABLE `blogs`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `category_id` bigint(20) UNSIGNED NULL DEFAULT NULL,
  `author_id` bigint(20) UNSIGNED NULL DEFAULT NULL,
  `status` enum('active','inactive') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `blogs_slug_unique`(`slug`) USING BTREE,
  INDEX `blogs_category_id_foreign`(`category_id`) USING BTREE,
  INDEX `blogs_author_id_foreign`(`author_id`) USING BTREE,
  CONSTRAINT `blogs_author_id_foreign` FOREIGN KEY (`author_id`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE RESTRICT,
  CONSTRAINT `blogs_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of blogs
-- ----------------------------

-- ----------------------------
-- Table structure for cache
-- ----------------------------
DROP TABLE IF EXISTS `cache`;
CREATE TABLE `cache`  (
  `key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int(11) NOT NULL,
  PRIMARY KEY (`key`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cache
-- ----------------------------
INSERT INTO `cache` VALUES ('laravel_cache_spatie.permission.cache', 'a:3:{s:5:\"alias\";a:4:{s:1:\"a\";s:2:\"id\";s:1:\"b\";s:4:\"name\";s:1:\"c\";s:10:\"guard_name\";s:1:\"r\";s:5:\"roles\";}s:11:\"permissions\";a:37:{i:0;a:4:{s:1:\"a\";i:1;s:1:\"b\";s:15:\"view categories\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:1;a:4:{s:1:\"a\";i:2;s:1:\"b\";s:17:\"create categories\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:2;a:4:{s:1:\"a\";i:3;s:1:\"b\";s:15:\"edit categories\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:3;a:4:{s:1:\"a\";i:4;s:1:\"b\";s:17:\"delete categories\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:4;a:4:{s:1:\"a\";i:5;s:1:\"b\";s:12:\"view banners\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:5;a:4:{s:1:\"a\";i:6;s:1:\"b\";s:14:\"create banners\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:6;a:4:{s:1:\"a\";i:7;s:1:\"b\";s:12:\"edit banners\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:7;a:4:{s:1:\"a\";i:8;s:1:\"b\";s:14:\"delete banners\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:8;a:4:{s:1:\"a\";i:9;s:1:\"b\";s:13:\"view products\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:9;a:4:{s:1:\"a\";i:10;s:1:\"b\";s:15:\"create products\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:10;a:4:{s:1:\"a\";i:11;s:1:\"b\";s:13:\"edit products\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:11;a:4:{s:1:\"a\";i:12;s:1:\"b\";s:15:\"delete products\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:12;a:4:{s:1:\"a\";i:13;s:1:\"b\";s:11:\"view orders\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:13;a:4:{s:1:\"a\";i:14;s:1:\"b\";s:13:\"create orders\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:14;a:4:{s:1:\"a\";i:15;s:1:\"b\";s:11:\"edit orders\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:15;a:4:{s:1:\"a\";i:16;s:1:\"b\";s:13:\"delete orders\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:16;a:4:{s:1:\"a\";i:17;s:1:\"b\";s:10:\"view users\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:17;a:4:{s:1:\"a\";i:18;s:1:\"b\";s:12:\"create users\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:18;a:4:{s:1:\"a\";i:19;s:1:\"b\";s:10:\"edit users\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:19;a:4:{s:1:\"a\";i:20;s:1:\"b\";s:12:\"delete users\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:20;a:4:{s:1:\"a\";i:21;s:1:\"b\";s:10:\"view blogs\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:21;a:4:{s:1:\"a\";i:22;s:1:\"b\";s:12:\"create blogs\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:22;a:4:{s:1:\"a\";i:23;s:1:\"b\";s:10:\"edit blogs\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:23;a:4:{s:1:\"a\";i:24;s:1:\"b\";s:12:\"delete blogs\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:24;a:4:{s:1:\"a\";i:25;s:1:\"b\";s:15:\"view attributes\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:25;a:4:{s:1:\"a\";i:26;s:1:\"b\";s:17:\"create attributes\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:26;a:4:{s:1:\"a\";i:27;s:1:\"b\";s:15:\"edit attributes\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:27;a:4:{s:1:\"a\";i:28;s:1:\"b\";s:17:\"delete attributes\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:28;a:4:{s:1:\"a\";i:29;s:1:\"b\";s:14:\"view dashboard\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:29;a:4:{s:1:\"a\";i:30;s:1:\"b\";s:7:\"addrole\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:30;a:4:{s:1:\"a\";i:31;s:1:\"b\";s:28:\"view category specifications\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:31;a:4:{s:1:\"a\";i:32;s:1:\"b\";s:24:\"view category attributes\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:32;a:4:{s:1:\"a\";i:33;s:1:\"b\";s:19:\"view specifications\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:33;a:4:{s:1:\"a\";i:34;s:1:\"b\";s:20:\"trash specifications\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:34;a:4:{s:1:\"a\";i:35;s:1:\"b\";s:22:\"restore specifications\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:35;a:4:{s:1:\"a\";i:36;s:1:\"b\";s:21:\"delete specifications\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:36;a:4:{s:1:\"a\";i:37;s:1:\"b\";s:13:\"view vouchers\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}}s:5:\"roles\";a:2:{i:0;a:3:{s:1:\"a\";i:1;s:1:\"b\";s:5:\"admin\";s:1:\"c\";s:3:\"web\";}i:1;a:3:{s:1:\"a\";i:2;s:1:\"b\";s:5:\"staff\";s:1:\"c\";s:3:\"web\";}}}', 1750390947);

-- ----------------------------
-- Table structure for cache_locks
-- ----------------------------
DROP TABLE IF EXISTS `cache_locks`;
CREATE TABLE `cache_locks`  (
  `key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `owner` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int(11) NOT NULL,
  PRIMARY KEY (`key`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cache_locks
-- ----------------------------

-- ----------------------------
-- Table structure for cart_items
-- ----------------------------
DROP TABLE IF EXISTS `cart_items`;
CREATE TABLE `cart_items`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `cart_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `variant_id` bigint(20) UNSIGNED NULL DEFAULT NULL,
  `quantity` int(11) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `cart_items_cart_id_foreign`(`cart_id`) USING BTREE,
  INDEX `cart_items_product_id_foreign`(`product_id`) USING BTREE,
  INDEX `cart_items_variant_id_foreign`(`variant_id`) USING BTREE,
  CONSTRAINT `cart_items_cart_id_foreign` FOREIGN KEY (`cart_id`) REFERENCES `carts` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `cart_items_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `cart_items_variant_id_foreign` FOREIGN KEY (`variant_id`) REFERENCES `product_variants` (`id`) ON DELETE SET NULL ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 109 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cart_items
-- ----------------------------
INSERT INTO `cart_items` VALUES (108, 2, 152, 240, 1);

-- ----------------------------
-- Table structure for carts
-- ----------------------------
DROP TABLE IF EXISTS `carts`;
CREATE TABLE `carts`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) UNSIGNED NULL DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `carts_user_id_foreign`(`user_id`) USING BTREE,
  CONSTRAINT `carts_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of carts
-- ----------------------------
INSERT INTO `carts` VALUES (1, 1, '2025-05-28 12:03:39');
INSERT INTO `carts` VALUES (2, 43, '2025-05-28 16:50:10');
INSERT INTO `carts` VALUES (3, 57, '2025-06-08 05:22:38');
INSERT INTO `carts` VALUES (4, 76, '2025-06-13 14:23:38');
INSERT INTO `carts` VALUES (5, 42, '2025-06-14 07:36:33');

-- ----------------------------
-- Table structure for categories
-- ----------------------------
DROP TABLE IF EXISTS `categories`;
CREATE TABLE `categories`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `parent_id` bigint(20) UNSIGNED NULL DEFAULT NULL,
  `order` int(11) NOT NULL DEFAULT 0,
  `status` enum('active','inactive') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `type` tinyint(4) NULL DEFAULT 1,
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `categories_slug_unique`(`slug`) USING BTREE,
  INDEX `categories_parent_id_foreign`(`parent_id`) USING BTREE,
  CONSTRAINT `categories_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 31 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of categories
-- ----------------------------
INSERT INTO `categories` VALUES (25, 'Iphone', 'iphone', NULL, 1, 'active', 1, 'uploads/categories/1750055763_Danh mục Iphone.png', '2025-06-16 13:36:03', '2025-06-16 13:36:03', NULL);
INSERT INTO `categories` VALUES (26, 'Ipad', 'ipad', NULL, 2, 'active', 1, 'uploads/categories/1750055888_Danh mục Ipad.png', '2025-06-16 13:38:08', '2025-06-16 13:38:08', NULL);
INSERT INTO `categories` VALUES (27, 'Mac', 'mac', NULL, 3, 'active', 1, 'uploads/categories/1750055982_Danh mục Mac.png', '2025-06-16 13:38:11', '2025-06-16 13:39:42', NULL);
INSERT INTO `categories` VALUES (28, 'Watch', 'watch', NULL, 4, 'active', 1, 'uploads/categories/1750055904_Danh mục Watch.png', '2025-06-16 13:38:24', '2025-06-16 13:38:24', NULL);
INSERT INTO `categories` VALUES (29, 'Tai nghe, loa', 'tai-nghe-loa', NULL, 5, 'active', 1, 'uploads/categories/1750055919_Danh mục tai nghe, loa.png', '2025-06-16 13:38:39', '2025-06-16 13:38:39', NULL);
INSERT INTO `categories` VALUES (30, 'Phụ kiện', 'phu-kien', NULL, 6, 'active', 1, 'uploads/categories/1750055957_Danh mục Phụ kiện.png', '2025-06-16 13:39:17', '2025-06-16 13:39:17', NULL);

-- ----------------------------
-- Table structure for contacts
-- ----------------------------
DROP TABLE IF EXISTS `contacts`;
CREATE TABLE `contacts`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `first_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `message` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of contacts
-- ----------------------------
INSERT INTO `contacts` VALUES (1, 'Mừng', 'Nguyễn Văn', 'nguyendinhkhai0103@gmail.com', '0792263516', 'ok rồi bạn', '2025-05-24 16:52:42', '2025-05-24 16:52:42', NULL);
INSERT INTO `contacts` VALUES (2, 'Mừng', 'Nguyễn Văn', 'admin@gmail.com', '0792263516', 'oke', '2025-05-27 14:40:41', '2025-05-27 14:40:41', NULL);
INSERT INTO `contacts` VALUES (3, 'Khuất Thảo', 'Ly', 'mungnvph20465@fpt.edu.vn', '1234567890', 'iiiii', '2025-05-27 14:42:02', '2025-05-27 14:42:02', NULL);
INSERT INTO `contacts` VALUES (4, 'Mừng', 'Nguyễn Văn', 'admin@gmail.com', '1234567890', 'ssss', '2025-05-27 14:42:45', '2025-05-27 14:42:45', NULL);
INSERT INTO `contacts` VALUES (5, 'Mừng', 'Nguyễn Văn', 'dothivy0102@gmail.com', '1234567890', 'dịch vụ chưa', '2025-05-27 14:45:30', '2025-05-27 14:45:30', NULL);

-- ----------------------------
-- Table structure for failed_jobs
-- ----------------------------
DROP TABLE IF EXISTS `failed_jobs`;
CREATE TABLE `failed_jobs`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `failed_jobs_uuid_unique`(`uuid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of failed_jobs
-- ----------------------------
INSERT INTO `failed_jobs` VALUES (1, '058c6da8-c482-44ff-8337-f4cd5b3d614e', 'database', 'default', '{\"uuid\":\"058c6da8-c482-44ff-8337-f4cd5b3d614e\",\"displayName\":\"App\\\\Events\\\\OrderStatusUpdated\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":14:{s:5:\\\"event\\\";O:29:\\\"App\\\\Events\\\\OrderStatusUpdated\\\":1:{s:5:\\\"order\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:16:\\\"App\\\\Models\\\\Order\\\";s:2:\\\"id\\\";i:47;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\"},\"createdAt\":1748709788,\"delay\":null}', 'Illuminate\\Broadcasting\\BroadcastException: Pusher error: cURL error 7: Failed to connect to localhost port 8080 after 2255 ms: Couldn\'t connect to server (see https://curl.haxx.se/libcurl/c/libcurl-errors.html) for http://localhost:8080/apps/130010/events?auth_key=hebhaulzxbkh4ugtjs5x&auth_timestamp=1748724476&auth_version=1.0&body_md5=33c2617b95b7518834e2eebeb8c024ce&auth_signature=93bf11e08631ee174b24e439770c58de8594946bf51463a62bc146ebde6a3d1c. in C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Broadcasting\\Broadcasters\\PusherBroadcaster.php:163\nStack trace:\n#0 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Broadcasting\\BroadcastEvent.php(93): Illuminate\\Broadcasting\\Broadcasters\\PusherBroadcaster->broadcast(Object(Illuminate\\Support\\Collection), \'OrderStatusUpda...\', Array)\n#1 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(36): Illuminate\\Broadcasting\\BroadcastEvent->handle(Object(Illuminate\\Broadcasting\\BroadcastManager))\n#2 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Util.php(43): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#3 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(96): Illuminate\\Container\\Util::unwrapIfClosure(Object(Closure))\n#4 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(35): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(Illuminate\\Foundation\\Application), Array, Object(Closure))\n#5 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Container.php(754): Illuminate\\Container\\BoundMethod::call(Object(Illuminate\\Foundation\\Application), Array, Array, NULL)\n#6 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Bus\\Dispatcher.php(132): Illuminate\\Container\\Container->call(Array)\n#7 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(169): Illuminate\\Bus\\Dispatcher->Illuminate\\Bus\\{closure}(Object(Illuminate\\Broadcasting\\BroadcastEvent))\n#8 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(126): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Broadcasting\\BroadcastEvent))\n#9 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Bus\\Dispatcher.php(136): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#10 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(125): Illuminate\\Bus\\Dispatcher->dispatchNow(Object(Illuminate\\Broadcasting\\BroadcastEvent), false)\n#11 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(169): Illuminate\\Queue\\CallQueuedHandler->Illuminate\\Queue\\{closure}(Object(Illuminate\\Broadcasting\\BroadcastEvent))\n#12 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(126): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Broadcasting\\BroadcastEvent))\n#13 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(120): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#14 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(68): Illuminate\\Queue\\CallQueuedHandler->dispatchThroughMiddleware(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Object(Illuminate\\Broadcasting\\BroadcastEvent))\n#15 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Jobs\\Job.php(102): Illuminate\\Queue\\CallQueuedHandler->call(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Array)\n#16 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(441): Illuminate\\Queue\\Jobs\\Job->fire()\n#17 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(391): Illuminate\\Queue\\Worker->process(\'database\', Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Object(Illuminate\\Queue\\WorkerOptions))\n#18 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(177): Illuminate\\Queue\\Worker->runJob(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), \'database\', Object(Illuminate\\Queue\\WorkerOptions))\n#19 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Console\\WorkCommand.php(148): Illuminate\\Queue\\Worker->daemon(\'database\', \'default\', Object(Illuminate\\Queue\\WorkerOptions))\n#20 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Console\\WorkCommand.php(131): Illuminate\\Queue\\Console\\WorkCommand->runWorker(\'database\', \'default\')\n#21 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(36): Illuminate\\Queue\\Console\\WorkCommand->handle()\n#22 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Util.php(43): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#23 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(96): Illuminate\\Container\\Util::unwrapIfClosure(Object(Closure))\n#24 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(35): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(Illuminate\\Foundation\\Application), Array, Object(Closure))\n#25 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Container.php(754): Illuminate\\Container\\BoundMethod::call(Object(Illuminate\\Foundation\\Application), Array, Array, NULL)\n#26 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Console\\Command.php(211): Illuminate\\Container\\Container->call(Array)\n#27 C:\\DATN\\vendor\\symfony\\console\\Command\\Command.php(279): Illuminate\\Console\\Command->execute(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#28 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Console\\Command.php(180): Symfony\\Component\\Console\\Command\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#29 C:\\DATN\\vendor\\symfony\\console\\Application.php(1094): Illuminate\\Console\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#30 C:\\DATN\\vendor\\symfony\\console\\Application.php(342): Symfony\\Component\\Console\\Application->doRunCommand(Object(Illuminate\\Queue\\Console\\WorkCommand), Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#31 C:\\DATN\\vendor\\symfony\\console\\Application.php(193): Symfony\\Component\\Console\\Application->doRun(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#32 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Console\\Kernel.php(197): Symfony\\Component\\Console\\Application->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#33 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Application.php(1234): Illuminate\\Foundation\\Console\\Kernel->handle(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#34 C:\\DATN\\artisan(16): Illuminate\\Foundation\\Application->handleCommand(Object(Symfony\\Component\\Console\\Input\\ArgvInput))\n#35 {main}', '2025-06-01 03:47:59');
INSERT INTO `failed_jobs` VALUES (2, '89a0986b-70a4-4d6a-8c0b-29c3f1c32e0e', 'database', 'default', '{\"uuid\":\"89a0986b-70a4-4d6a-8c0b-29c3f1c32e0e\",\"displayName\":\"App\\\\Events\\\\OrderStatusUpdated\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":14:{s:5:\\\"event\\\";O:29:\\\"App\\\\Events\\\\OrderStatusUpdated\\\":1:{s:5:\\\"order\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:16:\\\"App\\\\Models\\\\Order\\\";s:2:\\\"id\\\";i:47;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\"},\"createdAt\":1748709845,\"delay\":null}', 'Illuminate\\Broadcasting\\BroadcastException: Pusher error: cURL error 7: Failed to connect to localhost port 8080 after 2248 ms: Couldn\'t connect to server (see https://curl.haxx.se/libcurl/c/libcurl-errors.html) for http://localhost:8080/apps/130010/events?auth_key=hebhaulzxbkh4ugtjs5x&auth_timestamp=1748724480&auth_version=1.0&body_md5=33c2617b95b7518834e2eebeb8c024ce&auth_signature=e0e0e06590a453df7f6050bf0c1c546f8d87c90715a030ea829eef61ba33dc47. in C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Broadcasting\\Broadcasters\\PusherBroadcaster.php:163\nStack trace:\n#0 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Broadcasting\\BroadcastEvent.php(93): Illuminate\\Broadcasting\\Broadcasters\\PusherBroadcaster->broadcast(Object(Illuminate\\Support\\Collection), \'OrderStatusUpda...\', Array)\n#1 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(36): Illuminate\\Broadcasting\\BroadcastEvent->handle(Object(Illuminate\\Broadcasting\\BroadcastManager))\n#2 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Util.php(43): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#3 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(96): Illuminate\\Container\\Util::unwrapIfClosure(Object(Closure))\n#4 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(35): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(Illuminate\\Foundation\\Application), Array, Object(Closure))\n#5 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Container.php(754): Illuminate\\Container\\BoundMethod::call(Object(Illuminate\\Foundation\\Application), Array, Array, NULL)\n#6 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Bus\\Dispatcher.php(132): Illuminate\\Container\\Container->call(Array)\n#7 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(169): Illuminate\\Bus\\Dispatcher->Illuminate\\Bus\\{closure}(Object(Illuminate\\Broadcasting\\BroadcastEvent))\n#8 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(126): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Broadcasting\\BroadcastEvent))\n#9 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Bus\\Dispatcher.php(136): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#10 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(125): Illuminate\\Bus\\Dispatcher->dispatchNow(Object(Illuminate\\Broadcasting\\BroadcastEvent), false)\n#11 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(169): Illuminate\\Queue\\CallQueuedHandler->Illuminate\\Queue\\{closure}(Object(Illuminate\\Broadcasting\\BroadcastEvent))\n#12 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(126): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Broadcasting\\BroadcastEvent))\n#13 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(120): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#14 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(68): Illuminate\\Queue\\CallQueuedHandler->dispatchThroughMiddleware(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Object(Illuminate\\Broadcasting\\BroadcastEvent))\n#15 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Jobs\\Job.php(102): Illuminate\\Queue\\CallQueuedHandler->call(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Array)\n#16 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(441): Illuminate\\Queue\\Jobs\\Job->fire()\n#17 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(391): Illuminate\\Queue\\Worker->process(\'database\', Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Object(Illuminate\\Queue\\WorkerOptions))\n#18 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(177): Illuminate\\Queue\\Worker->runJob(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), \'database\', Object(Illuminate\\Queue\\WorkerOptions))\n#19 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Console\\WorkCommand.php(148): Illuminate\\Queue\\Worker->daemon(\'database\', \'default\', Object(Illuminate\\Queue\\WorkerOptions))\n#20 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Console\\WorkCommand.php(131): Illuminate\\Queue\\Console\\WorkCommand->runWorker(\'database\', \'default\')\n#21 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(36): Illuminate\\Queue\\Console\\WorkCommand->handle()\n#22 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Util.php(43): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#23 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(96): Illuminate\\Container\\Util::unwrapIfClosure(Object(Closure))\n#24 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(35): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(Illuminate\\Foundation\\Application), Array, Object(Closure))\n#25 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Container.php(754): Illuminate\\Container\\BoundMethod::call(Object(Illuminate\\Foundation\\Application), Array, Array, NULL)\n#26 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Console\\Command.php(211): Illuminate\\Container\\Container->call(Array)\n#27 C:\\DATN\\vendor\\symfony\\console\\Command\\Command.php(279): Illuminate\\Console\\Command->execute(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#28 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Console\\Command.php(180): Symfony\\Component\\Console\\Command\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#29 C:\\DATN\\vendor\\symfony\\console\\Application.php(1094): Illuminate\\Console\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#30 C:\\DATN\\vendor\\symfony\\console\\Application.php(342): Symfony\\Component\\Console\\Application->doRunCommand(Object(Illuminate\\Queue\\Console\\WorkCommand), Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#31 C:\\DATN\\vendor\\symfony\\console\\Application.php(193): Symfony\\Component\\Console\\Application->doRun(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#32 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Console\\Kernel.php(197): Symfony\\Component\\Console\\Application->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#33 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Application.php(1234): Illuminate\\Foundation\\Console\\Kernel->handle(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#34 C:\\DATN\\artisan(16): Illuminate\\Foundation\\Application->handleCommand(Object(Symfony\\Component\\Console\\Input\\ArgvInput))\n#35 {main}', '2025-06-01 03:48:03');
INSERT INTO `failed_jobs` VALUES (3, '9afa8ca5-794a-4977-a9a5-cb686205a36d', 'database', 'default', '{\"uuid\":\"9afa8ca5-794a-4977-a9a5-cb686205a36d\",\"displayName\":\"App\\\\Events\\\\OrderStatusUpdated\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":14:{s:5:\\\"event\\\";O:29:\\\"App\\\\Events\\\\OrderStatusUpdated\\\":1:{s:5:\\\"order\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:16:\\\"App\\\\Models\\\\Order\\\";s:2:\\\"id\\\";i:47;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\"},\"createdAt\":1748713564,\"delay\":null}', 'Illuminate\\Broadcasting\\BroadcastException: Pusher error: cURL error 7: Failed to connect to localhost port 8080 after 2252 ms: Couldn\'t connect to server (see https://curl.haxx.se/libcurl/c/libcurl-errors.html) for http://localhost:8080/apps/130010/events?auth_key=hebhaulzxbkh4ugtjs5x&auth_timestamp=1748724483&auth_version=1.0&body_md5=33c2617b95b7518834e2eebeb8c024ce&auth_signature=66e241526fef054b2ce4f2377abc7cd68cd1770893b20a92d5a832400e83bceb. in C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Broadcasting\\Broadcasters\\PusherBroadcaster.php:163\nStack trace:\n#0 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Broadcasting\\BroadcastEvent.php(93): Illuminate\\Broadcasting\\Broadcasters\\PusherBroadcaster->broadcast(Object(Illuminate\\Support\\Collection), \'OrderStatusUpda...\', Array)\n#1 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(36): Illuminate\\Broadcasting\\BroadcastEvent->handle(Object(Illuminate\\Broadcasting\\BroadcastManager))\n#2 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Util.php(43): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#3 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(96): Illuminate\\Container\\Util::unwrapIfClosure(Object(Closure))\n#4 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(35): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(Illuminate\\Foundation\\Application), Array, Object(Closure))\n#5 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Container.php(754): Illuminate\\Container\\BoundMethod::call(Object(Illuminate\\Foundation\\Application), Array, Array, NULL)\n#6 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Bus\\Dispatcher.php(132): Illuminate\\Container\\Container->call(Array)\n#7 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(169): Illuminate\\Bus\\Dispatcher->Illuminate\\Bus\\{closure}(Object(Illuminate\\Broadcasting\\BroadcastEvent))\n#8 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(126): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Broadcasting\\BroadcastEvent))\n#9 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Bus\\Dispatcher.php(136): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#10 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(125): Illuminate\\Bus\\Dispatcher->dispatchNow(Object(Illuminate\\Broadcasting\\BroadcastEvent), false)\n#11 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(169): Illuminate\\Queue\\CallQueuedHandler->Illuminate\\Queue\\{closure}(Object(Illuminate\\Broadcasting\\BroadcastEvent))\n#12 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(126): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Broadcasting\\BroadcastEvent))\n#13 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(120): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#14 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(68): Illuminate\\Queue\\CallQueuedHandler->dispatchThroughMiddleware(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Object(Illuminate\\Broadcasting\\BroadcastEvent))\n#15 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Jobs\\Job.php(102): Illuminate\\Queue\\CallQueuedHandler->call(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Array)\n#16 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(441): Illuminate\\Queue\\Jobs\\Job->fire()\n#17 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(391): Illuminate\\Queue\\Worker->process(\'database\', Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Object(Illuminate\\Queue\\WorkerOptions))\n#18 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(177): Illuminate\\Queue\\Worker->runJob(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), \'database\', Object(Illuminate\\Queue\\WorkerOptions))\n#19 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Console\\WorkCommand.php(148): Illuminate\\Queue\\Worker->daemon(\'database\', \'default\', Object(Illuminate\\Queue\\WorkerOptions))\n#20 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Console\\WorkCommand.php(131): Illuminate\\Queue\\Console\\WorkCommand->runWorker(\'database\', \'default\')\n#21 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(36): Illuminate\\Queue\\Console\\WorkCommand->handle()\n#22 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Util.php(43): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#23 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(96): Illuminate\\Container\\Util::unwrapIfClosure(Object(Closure))\n#24 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(35): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(Illuminate\\Foundation\\Application), Array, Object(Closure))\n#25 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Container.php(754): Illuminate\\Container\\BoundMethod::call(Object(Illuminate\\Foundation\\Application), Array, Array, NULL)\n#26 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Console\\Command.php(211): Illuminate\\Container\\Container->call(Array)\n#27 C:\\DATN\\vendor\\symfony\\console\\Command\\Command.php(279): Illuminate\\Console\\Command->execute(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#28 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Console\\Command.php(180): Symfony\\Component\\Console\\Command\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#29 C:\\DATN\\vendor\\symfony\\console\\Application.php(1094): Illuminate\\Console\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#30 C:\\DATN\\vendor\\symfony\\console\\Application.php(342): Symfony\\Component\\Console\\Application->doRunCommand(Object(Illuminate\\Queue\\Console\\WorkCommand), Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#31 C:\\DATN\\vendor\\symfony\\console\\Application.php(193): Symfony\\Component\\Console\\Application->doRun(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#32 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Console\\Kernel.php(197): Symfony\\Component\\Console\\Application->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#33 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Application.php(1234): Illuminate\\Foundation\\Console\\Kernel->handle(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#34 C:\\DATN\\artisan(16): Illuminate\\Foundation\\Application->handleCommand(Object(Symfony\\Component\\Console\\Input\\ArgvInput))\n#35 {main}', '2025-06-01 03:48:06');
INSERT INTO `failed_jobs` VALUES (4, '45f54d57-4174-4d3c-8159-4c4e087f0c41', 'database', 'default', '{\"uuid\":\"45f54d57-4174-4d3c-8159-4c4e087f0c41\",\"displayName\":\"App\\\\Events\\\\OrderStatusUpdated\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":14:{s:5:\\\"event\\\";O:29:\\\"App\\\\Events\\\\OrderStatusUpdated\\\":1:{s:5:\\\"order\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:16:\\\"App\\\\Models\\\\Order\\\";s:2:\\\"id\\\";i:47;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\"},\"createdAt\":1748713771,\"delay\":null}', 'Illuminate\\Broadcasting\\BroadcastException: Pusher error: cURL error 7: Failed to connect to localhost port 8080 after 2250 ms: Couldn\'t connect to server (see https://curl.haxx.se/libcurl/c/libcurl-errors.html) for http://localhost:8080/apps/130010/events?auth_key=hebhaulzxbkh4ugtjs5x&auth_timestamp=1748724486&auth_version=1.0&body_md5=33c2617b95b7518834e2eebeb8c024ce&auth_signature=185ab2c8c516dda258cacc14ffedfd8f1fe4c99ba595034f2cadb48204a264c4. in C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Broadcasting\\Broadcasters\\PusherBroadcaster.php:163\nStack trace:\n#0 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Broadcasting\\BroadcastEvent.php(93): Illuminate\\Broadcasting\\Broadcasters\\PusherBroadcaster->broadcast(Object(Illuminate\\Support\\Collection), \'OrderStatusUpda...\', Array)\n#1 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(36): Illuminate\\Broadcasting\\BroadcastEvent->handle(Object(Illuminate\\Broadcasting\\BroadcastManager))\n#2 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Util.php(43): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#3 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(96): Illuminate\\Container\\Util::unwrapIfClosure(Object(Closure))\n#4 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(35): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(Illuminate\\Foundation\\Application), Array, Object(Closure))\n#5 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Container.php(754): Illuminate\\Container\\BoundMethod::call(Object(Illuminate\\Foundation\\Application), Array, Array, NULL)\n#6 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Bus\\Dispatcher.php(132): Illuminate\\Container\\Container->call(Array)\n#7 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(169): Illuminate\\Bus\\Dispatcher->Illuminate\\Bus\\{closure}(Object(Illuminate\\Broadcasting\\BroadcastEvent))\n#8 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(126): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Broadcasting\\BroadcastEvent))\n#9 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Bus\\Dispatcher.php(136): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#10 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(125): Illuminate\\Bus\\Dispatcher->dispatchNow(Object(Illuminate\\Broadcasting\\BroadcastEvent), false)\n#11 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(169): Illuminate\\Queue\\CallQueuedHandler->Illuminate\\Queue\\{closure}(Object(Illuminate\\Broadcasting\\BroadcastEvent))\n#12 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(126): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Broadcasting\\BroadcastEvent))\n#13 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(120): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#14 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(68): Illuminate\\Queue\\CallQueuedHandler->dispatchThroughMiddleware(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Object(Illuminate\\Broadcasting\\BroadcastEvent))\n#15 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Jobs\\Job.php(102): Illuminate\\Queue\\CallQueuedHandler->call(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Array)\n#16 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(441): Illuminate\\Queue\\Jobs\\Job->fire()\n#17 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(391): Illuminate\\Queue\\Worker->process(\'database\', Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Object(Illuminate\\Queue\\WorkerOptions))\n#18 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(177): Illuminate\\Queue\\Worker->runJob(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), \'database\', Object(Illuminate\\Queue\\WorkerOptions))\n#19 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Console\\WorkCommand.php(148): Illuminate\\Queue\\Worker->daemon(\'database\', \'default\', Object(Illuminate\\Queue\\WorkerOptions))\n#20 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Console\\WorkCommand.php(131): Illuminate\\Queue\\Console\\WorkCommand->runWorker(\'database\', \'default\')\n#21 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(36): Illuminate\\Queue\\Console\\WorkCommand->handle()\n#22 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Util.php(43): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#23 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(96): Illuminate\\Container\\Util::unwrapIfClosure(Object(Closure))\n#24 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(35): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(Illuminate\\Foundation\\Application), Array, Object(Closure))\n#25 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Container.php(754): Illuminate\\Container\\BoundMethod::call(Object(Illuminate\\Foundation\\Application), Array, Array, NULL)\n#26 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Console\\Command.php(211): Illuminate\\Container\\Container->call(Array)\n#27 C:\\DATN\\vendor\\symfony\\console\\Command\\Command.php(279): Illuminate\\Console\\Command->execute(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#28 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Console\\Command.php(180): Symfony\\Component\\Console\\Command\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#29 C:\\DATN\\vendor\\symfony\\console\\Application.php(1094): Illuminate\\Console\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#30 C:\\DATN\\vendor\\symfony\\console\\Application.php(342): Symfony\\Component\\Console\\Application->doRunCommand(Object(Illuminate\\Queue\\Console\\WorkCommand), Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#31 C:\\DATN\\vendor\\symfony\\console\\Application.php(193): Symfony\\Component\\Console\\Application->doRun(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#32 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Console\\Kernel.php(197): Symfony\\Component\\Console\\Application->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#33 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Application.php(1234): Illuminate\\Foundation\\Console\\Kernel->handle(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#34 C:\\DATN\\artisan(16): Illuminate\\Foundation\\Application->handleCommand(Object(Symfony\\Component\\Console\\Input\\ArgvInput))\n#35 {main}', '2025-06-01 03:48:09');
INSERT INTO `failed_jobs` VALUES (5, '8ab363eb-cbfe-4561-8fb6-bff428fc7837', 'database', 'default', '{\"uuid\":\"8ab363eb-cbfe-4561-8fb6-bff428fc7837\",\"displayName\":\"App\\\\Events\\\\OrderStatusUpdated\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":14:{s:5:\\\"event\\\";O:29:\\\"App\\\\Events\\\\OrderStatusUpdated\\\":1:{s:5:\\\"order\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:16:\\\"App\\\\Models\\\\Order\\\";s:2:\\\"id\\\";i:131;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\"},\"createdAt\":1749824576,\"delay\":null}', 'Illuminate\\Broadcasting\\BroadcastException: Pusher error: cURL error 7: Failed to connect to localhost port 8080: Connection refused (see https://curl.haxx.se/libcurl/c/libcurl-errors.html) for http://localhost:8080/apps/130010/events?auth_key=hebhaulzxbkh4ugtjs5x&auth_timestamp=1749826079&auth_version=1.0&body_md5=539ee96f87ac29afad92506635105a45&auth_signature=593edd9a5cd2266697bb3c9e79cb008781ca658626350565797b6a5b4e14f9e4. in /www/wwwroot/applestore.kenhweb.com/vendor/laravel/framework/src/Illuminate/Broadcasting/Broadcasters/PusherBroadcaster.php:163\nStack trace:\n#0 /www/wwwroot/applestore.kenhweb.com/vendor/laravel/framework/src/Illuminate/Broadcasting/BroadcastEvent.php(93): Illuminate\\Broadcasting\\Broadcasters\\PusherBroadcaster->broadcast()\n#1 /www/wwwroot/applestore.kenhweb.com/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(36): Illuminate\\Broadcasting\\BroadcastEvent->handle()\n#2 /www/wwwroot/applestore.kenhweb.com/vendor/laravel/framework/src/Illuminate/Container/Util.php(43): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#3 /www/wwwroot/applestore.kenhweb.com/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(96): Illuminate\\Container\\Util::unwrapIfClosure()\n#4 /www/wwwroot/applestore.kenhweb.com/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(35): Illuminate\\Container\\BoundMethod::callBoundMethod()\n#5 /www/wwwroot/applestore.kenhweb.com/vendor/laravel/framework/src/Illuminate/Container/Container.php(754): Illuminate\\Container\\BoundMethod::call()\n#6 /www/wwwroot/applestore.kenhweb.com/vendor/laravel/framework/src/Illuminate/Bus/Dispatcher.php(132): Illuminate\\Container\\Container->call()\n#7 /www/wwwroot/applestore.kenhweb.com/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(169): Illuminate\\Bus\\Dispatcher->Illuminate\\Bus\\{closure}()\n#8 /www/wwwroot/applestore.kenhweb.com/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(126): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}()\n#9 /www/wwwroot/applestore.kenhweb.com/vendor/laravel/framework/src/Illuminate/Bus/Dispatcher.php(136): Illuminate\\Pipeline\\Pipeline->then()\n#10 /www/wwwroot/applestore.kenhweb.com/vendor/laravel/framework/src/Illuminate/Queue/CallQueuedHandler.php(125): Illuminate\\Bus\\Dispatcher->dispatchNow()\n#11 /www/wwwroot/applestore.kenhweb.com/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(169): Illuminate\\Queue\\CallQueuedHandler->Illuminate\\Queue\\{closure}()\n#12 /www/wwwroot/applestore.kenhweb.com/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(126): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}()\n#13 /www/wwwroot/applestore.kenhweb.com/vendor/laravel/framework/src/Illuminate/Queue/CallQueuedHandler.php(120): Illuminate\\Pipeline\\Pipeline->then()\n#14 /www/wwwroot/applestore.kenhweb.com/vendor/laravel/framework/src/Illuminate/Queue/CallQueuedHandler.php(68): Illuminate\\Queue\\CallQueuedHandler->dispatchThroughMiddleware()\n#15 /www/wwwroot/applestore.kenhweb.com/vendor/laravel/framework/src/Illuminate/Queue/Jobs/Job.php(102): Illuminate\\Queue\\CallQueuedHandler->call()\n#16 /www/wwwroot/applestore.kenhweb.com/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(441): Illuminate\\Queue\\Jobs\\Job->fire()\n#17 /www/wwwroot/applestore.kenhweb.com/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(391): Illuminate\\Queue\\Worker->process()\n#18 /www/wwwroot/applestore.kenhweb.com/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(177): Illuminate\\Queue\\Worker->runJob()\n#19 /www/wwwroot/applestore.kenhweb.com/vendor/laravel/framework/src/Illuminate/Queue/Console/WorkCommand.php(148): Illuminate\\Queue\\Worker->daemon()\n#20 /www/wwwroot/applestore.kenhweb.com/vendor/laravel/framework/src/Illuminate/Queue/Console/WorkCommand.php(131): Illuminate\\Queue\\Console\\WorkCommand->runWorker()\n#21 /www/wwwroot/applestore.kenhweb.com/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(36): Illuminate\\Queue\\Console\\WorkCommand->handle()\n#22 /www/wwwroot/applestore.kenhweb.com/vendor/laravel/framework/src/Illuminate/Container/Util.php(43): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#23 /www/wwwroot/applestore.kenhweb.com/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(96): Illuminate\\Container\\Util::unwrapIfClosure()\n#24 /www/wwwroot/applestore.kenhweb.com/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(35): Illuminate\\Container\\BoundMethod::callBoundMethod()\n#25 /www/wwwroot/applestore.kenhweb.com/vendor/laravel/framework/src/Illuminate/Container/Container.php(754): Illuminate\\Container\\BoundMethod::call()\n#26 /www/wwwroot/applestore.kenhweb.com/vendor/laravel/framework/src/Illuminate/Console/Command.php(211): Illuminate\\Container\\Container->call()\n#27 /www/wwwroot/applestore.kenhweb.com/vendor/symfony/console/Command/Command.php(318): Illuminate\\Console\\Command->execute()\n#28 /www/wwwroot/applestore.kenhweb.com/vendor/laravel/framework/src/Illuminate/Console/Command.php(180): Symfony\\Component\\Console\\Command\\Command->run()\n#29 /www/wwwroot/applestore.kenhweb.com/vendor/symfony/console/Application.php(1092): Illuminate\\Console\\Command->run()\n#30 /www/wwwroot/applestore.kenhweb.com/vendor/symfony/console/Application.php(341): Symfony\\Component\\Console\\Application->doRunCommand()\n#31 /www/wwwroot/applestore.kenhweb.com/vendor/symfony/console/Application.php(192): Symfony\\Component\\Console\\Application->doRun()\n#32 /www/wwwroot/applestore.kenhweb.com/vendor/laravel/framework/src/Illuminate/Foundation/Console/Kernel.php(197): Symfony\\Component\\Console\\Application->run()\n#33 /www/wwwroot/applestore.kenhweb.com/vendor/laravel/framework/src/Illuminate/Foundation/Application.php(1234): Illuminate\\Foundation\\Console\\Kernel->handle()\n#34 /www/wwwroot/applestore.kenhweb.com/artisan(16): Illuminate\\Foundation\\Application->handleCommand()\n#35 {main}', '2025-06-13 21:47:59');
INSERT INTO `failed_jobs` VALUES (6, '808a36b8-fe18-4ff6-854c-a5b1315313ea', 'database', 'default', '{\"uuid\":\"808a36b8-fe18-4ff6-854c-a5b1315313ea\",\"displayName\":\"App\\\\Events\\\\OrderStatusUpdated\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":14:{s:5:\\\"event\\\";O:29:\\\"App\\\\Events\\\\OrderStatusUpdated\\\":1:{s:5:\\\"order\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:16:\\\"App\\\\Models\\\\Order\\\";s:2:\\\"id\\\";i:131;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\"},\"createdAt\":1749826869,\"delay\":null}', 'Illuminate\\Database\\Eloquent\\ModelNotFoundException: No query results for model [App\\Models\\Order]. in C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\Eloquent\\Builder.php:750\nStack trace:\n#0 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\SerializesAndRestoresModelIdentifiers.php(110): Illuminate\\Database\\Eloquent\\Builder->firstOrFail()\n#1 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\SerializesAndRestoresModelIdentifiers.php(63): App\\Events\\OrderStatusUpdated->restoreModel(Object(Illuminate\\Contracts\\Database\\ModelIdentifier))\n#2 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\SerializesModels.php(97): App\\Events\\OrderStatusUpdated->getRestoredPropertyValue(Object(Illuminate\\Contracts\\Database\\ModelIdentifier))\n#3 [internal function]: App\\Events\\OrderStatusUpdated->__unserialize(Array)\n#4 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(95): unserialize(\'O:38:\"Illuminat...\')\n#5 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(62): Illuminate\\Queue\\CallQueuedHandler->getCommand(Array)\n#6 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Jobs\\Job.php(102): Illuminate\\Queue\\CallQueuedHandler->call(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Array)\n#7 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(441): Illuminate\\Queue\\Jobs\\Job->fire()\n#8 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(391): Illuminate\\Queue\\Worker->process(\'database\', Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Object(Illuminate\\Queue\\WorkerOptions))\n#9 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(177): Illuminate\\Queue\\Worker->runJob(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), \'database\', Object(Illuminate\\Queue\\WorkerOptions))\n#10 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Console\\WorkCommand.php(148): Illuminate\\Queue\\Worker->daemon(\'database\', \'default\', Object(Illuminate\\Queue\\WorkerOptions))\n#11 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Console\\WorkCommand.php(131): Illuminate\\Queue\\Console\\WorkCommand->runWorker(\'database\', \'default\')\n#12 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(36): Illuminate\\Queue\\Console\\WorkCommand->handle()\n#13 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Util.php(43): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#14 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(96): Illuminate\\Container\\Util::unwrapIfClosure(Object(Closure))\n#15 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(35): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(Illuminate\\Foundation\\Application), Array, Object(Closure))\n#16 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Container.php(754): Illuminate\\Container\\BoundMethod::call(Object(Illuminate\\Foundation\\Application), Array, Array, NULL)\n#17 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Console\\Command.php(211): Illuminate\\Container\\Container->call(Array)\n#18 C:\\DATN\\vendor\\symfony\\console\\Command\\Command.php(318): Illuminate\\Console\\Command->execute(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#19 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Console\\Command.php(180): Symfony\\Component\\Console\\Command\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#20 C:\\DATN\\vendor\\symfony\\console\\Application.php(1092): Illuminate\\Console\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#21 C:\\DATN\\vendor\\symfony\\console\\Application.php(341): Symfony\\Component\\Console\\Application->doRunCommand(Object(Illuminate\\Queue\\Console\\WorkCommand), Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#22 C:\\DATN\\vendor\\symfony\\console\\Application.php(192): Symfony\\Component\\Console\\Application->doRun(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#23 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Console\\Kernel.php(197): Symfony\\Component\\Console\\Application->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#24 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Application.php(1234): Illuminate\\Foundation\\Console\\Kernel->handle(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#25 C:\\DATN\\artisan(16): Illuminate\\Foundation\\Application->handleCommand(Object(Symfony\\Component\\Console\\Input\\ArgvInput))\n#26 {main}', '2025-06-15 01:38:47');
INSERT INTO `failed_jobs` VALUES (7, '09f018e7-9591-43ec-bc9c-220a0373d837', 'database', 'default', '{\"uuid\":\"09f018e7-9591-43ec-bc9c-220a0373d837\",\"displayName\":\"App\\\\Events\\\\OrderStatusUpdated\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":14:{s:5:\\\"event\\\";O:29:\\\"App\\\\Events\\\\OrderStatusUpdated\\\":1:{s:5:\\\"order\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:16:\\\"App\\\\Models\\\\Order\\\";s:2:\\\"id\\\";i:8;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\"},\"createdAt\":1749933511,\"delay\":null}', 'Illuminate\\Broadcasting\\BroadcastException: Pusher error: cURL error 7: Failed to connect to localhost port 8080 after 2256 ms: Couldn\'t connect to server (see https://curl.haxx.se/libcurl/c/libcurl-errors.html) for http://localhost:8080/apps/130010/events?auth_key=hebhaulzxbkh4ugtjs5x&auth_timestamp=1749933515&auth_version=1.0&body_md5=be850f50a4fb0f1b426336ee3062d40a&auth_signature=807310411230c6c838020c1c139346991de6c7eb45063cec37ba2c4c73cb0976. in C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Broadcasting\\Broadcasters\\PusherBroadcaster.php:163\nStack trace:\n#0 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Broadcasting\\BroadcastEvent.php(93): Illuminate\\Broadcasting\\Broadcasters\\PusherBroadcaster->broadcast(Object(Illuminate\\Support\\Collection), \'OrderStatusUpda...\', Array)\n#1 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(36): Illuminate\\Broadcasting\\BroadcastEvent->handle(Object(Illuminate\\Broadcasting\\BroadcastManager))\n#2 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Util.php(43): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#3 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(96): Illuminate\\Container\\Util::unwrapIfClosure(Object(Closure))\n#4 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(35): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(Illuminate\\Foundation\\Application), Array, Object(Closure))\n#5 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Container.php(754): Illuminate\\Container\\BoundMethod::call(Object(Illuminate\\Foundation\\Application), Array, Array, NULL)\n#6 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Bus\\Dispatcher.php(132): Illuminate\\Container\\Container->call(Array)\n#7 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(169): Illuminate\\Bus\\Dispatcher->Illuminate\\Bus\\{closure}(Object(Illuminate\\Broadcasting\\BroadcastEvent))\n#8 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(126): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Broadcasting\\BroadcastEvent))\n#9 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Bus\\Dispatcher.php(136): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#10 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(125): Illuminate\\Bus\\Dispatcher->dispatchNow(Object(Illuminate\\Broadcasting\\BroadcastEvent), false)\n#11 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(169): Illuminate\\Queue\\CallQueuedHandler->Illuminate\\Queue\\{closure}(Object(Illuminate\\Broadcasting\\BroadcastEvent))\n#12 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(126): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Broadcasting\\BroadcastEvent))\n#13 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(120): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#14 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(68): Illuminate\\Queue\\CallQueuedHandler->dispatchThroughMiddleware(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Object(Illuminate\\Broadcasting\\BroadcastEvent))\n#15 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Jobs\\Job.php(102): Illuminate\\Queue\\CallQueuedHandler->call(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Array)\n#16 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(441): Illuminate\\Queue\\Jobs\\Job->fire()\n#17 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(391): Illuminate\\Queue\\Worker->process(\'database\', Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Object(Illuminate\\Queue\\WorkerOptions))\n#18 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(177): Illuminate\\Queue\\Worker->runJob(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), \'database\', Object(Illuminate\\Queue\\WorkerOptions))\n#19 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Console\\WorkCommand.php(148): Illuminate\\Queue\\Worker->daemon(\'database\', \'default\', Object(Illuminate\\Queue\\WorkerOptions))\n#20 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Console\\WorkCommand.php(131): Illuminate\\Queue\\Console\\WorkCommand->runWorker(\'database\', \'default\')\n#21 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(36): Illuminate\\Queue\\Console\\WorkCommand->handle()\n#22 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Util.php(43): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#23 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(96): Illuminate\\Container\\Util::unwrapIfClosure(Object(Closure))\n#24 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(35): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(Illuminate\\Foundation\\Application), Array, Object(Closure))\n#25 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Container.php(754): Illuminate\\Container\\BoundMethod::call(Object(Illuminate\\Foundation\\Application), Array, Array, NULL)\n#26 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Console\\Command.php(211): Illuminate\\Container\\Container->call(Array)\n#27 C:\\DATN\\vendor\\symfony\\console\\Command\\Command.php(318): Illuminate\\Console\\Command->execute(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#28 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Console\\Command.php(180): Symfony\\Component\\Console\\Command\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#29 C:\\DATN\\vendor\\symfony\\console\\Application.php(1092): Illuminate\\Console\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#30 C:\\DATN\\vendor\\symfony\\console\\Application.php(341): Symfony\\Component\\Console\\Application->doRunCommand(Object(Illuminate\\Queue\\Console\\WorkCommand), Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#31 C:\\DATN\\vendor\\symfony\\console\\Application.php(192): Symfony\\Component\\Console\\Application->doRun(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#32 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Console\\Kernel.php(197): Symfony\\Component\\Console\\Application->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#33 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Application.php(1234): Illuminate\\Foundation\\Console\\Kernel->handle(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#34 C:\\DATN\\artisan(16): Illuminate\\Foundation\\Application->handleCommand(Object(Symfony\\Component\\Console\\Input\\ArgvInput))\n#35 {main}', '2025-06-15 03:39:05');
INSERT INTO `failed_jobs` VALUES (8, 'f4f33307-9419-4000-8ac7-d13c1d2dae2f', 'database', 'default', '{\"uuid\":\"f4f33307-9419-4000-8ac7-d13c1d2dae2f\",\"displayName\":\"App\\\\Events\\\\OrderStatusUpdated\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":14:{s:5:\\\"event\\\";O:29:\\\"App\\\\Events\\\\OrderStatusUpdated\\\":1:{s:5:\\\"order\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:16:\\\"App\\\\Models\\\\Order\\\";s:2:\\\"id\\\";i:13;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\"},\"createdAt\":1749946927,\"delay\":null}', 'Illuminate\\Broadcasting\\BroadcastException: Pusher error: cURL error 7: Failed to connect to localhost port 8080 after 2238 ms: Couldn\'t connect to server (see https://curl.haxx.se/libcurl/c/libcurl-errors.html) for http://localhost:8080/apps/130010/events?auth_key=hebhaulzxbkh4ugtjs5x&auth_timestamp=1749947064&auth_version=1.0&body_md5=3c8136858e93e4b1b25e594e907837f0&auth_signature=5eac0f6101dca114c213d9ad0e25f3262cc1b929dcd5879a50171348ea112796. in C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Broadcasting\\Broadcasters\\PusherBroadcaster.php:163\nStack trace:\n#0 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Broadcasting\\BroadcastEvent.php(93): Illuminate\\Broadcasting\\Broadcasters\\PusherBroadcaster->broadcast(Object(Illuminate\\Support\\Collection), \'OrderStatusUpda...\', Array)\n#1 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(36): Illuminate\\Broadcasting\\BroadcastEvent->handle(Object(Illuminate\\Broadcasting\\BroadcastManager))\n#2 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Util.php(43): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#3 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(96): Illuminate\\Container\\Util::unwrapIfClosure(Object(Closure))\n#4 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(35): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(Illuminate\\Foundation\\Application), Array, Object(Closure))\n#5 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Container.php(754): Illuminate\\Container\\BoundMethod::call(Object(Illuminate\\Foundation\\Application), Array, Array, NULL)\n#6 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Bus\\Dispatcher.php(132): Illuminate\\Container\\Container->call(Array)\n#7 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(169): Illuminate\\Bus\\Dispatcher->Illuminate\\Bus\\{closure}(Object(Illuminate\\Broadcasting\\BroadcastEvent))\n#8 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(126): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Broadcasting\\BroadcastEvent))\n#9 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Bus\\Dispatcher.php(136): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#10 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(125): Illuminate\\Bus\\Dispatcher->dispatchNow(Object(Illuminate\\Broadcasting\\BroadcastEvent), false)\n#11 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(169): Illuminate\\Queue\\CallQueuedHandler->Illuminate\\Queue\\{closure}(Object(Illuminate\\Broadcasting\\BroadcastEvent))\n#12 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(126): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Broadcasting\\BroadcastEvent))\n#13 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(120): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#14 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(68): Illuminate\\Queue\\CallQueuedHandler->dispatchThroughMiddleware(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Object(Illuminate\\Broadcasting\\BroadcastEvent))\n#15 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Jobs\\Job.php(102): Illuminate\\Queue\\CallQueuedHandler->call(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Array)\n#16 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(441): Illuminate\\Queue\\Jobs\\Job->fire()\n#17 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(391): Illuminate\\Queue\\Worker->process(\'database\', Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Object(Illuminate\\Queue\\WorkerOptions))\n#18 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(177): Illuminate\\Queue\\Worker->runJob(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), \'database\', Object(Illuminate\\Queue\\WorkerOptions))\n#19 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Console\\WorkCommand.php(148): Illuminate\\Queue\\Worker->daemon(\'database\', \'default\', Object(Illuminate\\Queue\\WorkerOptions))\n#20 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Console\\WorkCommand.php(131): Illuminate\\Queue\\Console\\WorkCommand->runWorker(\'database\', \'default\')\n#21 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(36): Illuminate\\Queue\\Console\\WorkCommand->handle()\n#22 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Util.php(43): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#23 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(96): Illuminate\\Container\\Util::unwrapIfClosure(Object(Closure))\n#24 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(35): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(Illuminate\\Foundation\\Application), Array, Object(Closure))\n#25 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Container.php(754): Illuminate\\Container\\BoundMethod::call(Object(Illuminate\\Foundation\\Application), Array, Array, NULL)\n#26 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Console\\Command.php(211): Illuminate\\Container\\Container->call(Array)\n#27 C:\\DATN\\vendor\\symfony\\console\\Command\\Command.php(318): Illuminate\\Console\\Command->execute(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#28 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Console\\Command.php(180): Symfony\\Component\\Console\\Command\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#29 C:\\DATN\\vendor\\symfony\\console\\Application.php(1092): Illuminate\\Console\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#30 C:\\DATN\\vendor\\symfony\\console\\Application.php(341): Symfony\\Component\\Console\\Application->doRunCommand(Object(Illuminate\\Queue\\Console\\WorkCommand), Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#31 C:\\DATN\\vendor\\symfony\\console\\Application.php(192): Symfony\\Component\\Console\\Application->doRun(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#32 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Console\\Kernel.php(197): Symfony\\Component\\Console\\Application->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#33 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Application.php(1234): Illuminate\\Foundation\\Console\\Kernel->handle(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#34 C:\\DATN\\artisan(16): Illuminate\\Foundation\\Application->handleCommand(Object(Symfony\\Component\\Console\\Input\\ArgvInput))\n#35 {main}', '2025-06-15 07:24:26');
INSERT INTO `failed_jobs` VALUES (9, '14af1aaa-10e5-42c6-93cd-a60835a14114', 'database', 'default', '{\"uuid\":\"14af1aaa-10e5-42c6-93cd-a60835a14114\",\"displayName\":\"App\\\\Events\\\\OrderStatusUpdated\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":14:{s:5:\\\"event\\\";O:29:\\\"App\\\\Events\\\\OrderStatusUpdated\\\":1:{s:5:\\\"order\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:16:\\\"App\\\\Models\\\\Order\\\";s:2:\\\"id\\\";i:13;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\"},\"createdAt\":1749946982,\"delay\":null}', 'Illuminate\\Broadcasting\\BroadcastException: Pusher error: cURL error 7: Failed to connect to localhost port 8080 after 2248 ms: Couldn\'t connect to server (see https://curl.haxx.se/libcurl/c/libcurl-errors.html) for http://localhost:8080/apps/130010/events?auth_key=hebhaulzxbkh4ugtjs5x&auth_timestamp=1749947067&auth_version=1.0&body_md5=3c8136858e93e4b1b25e594e907837f0&auth_signature=fc47ab9e05eb63b7fc6dfa136a91e2a63a9a3651d88cc17bc9c809f0efc87f8a. in C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Broadcasting\\Broadcasters\\PusherBroadcaster.php:163\nStack trace:\n#0 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Broadcasting\\BroadcastEvent.php(93): Illuminate\\Broadcasting\\Broadcasters\\PusherBroadcaster->broadcast(Object(Illuminate\\Support\\Collection), \'OrderStatusUpda...\', Array)\n#1 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(36): Illuminate\\Broadcasting\\BroadcastEvent->handle(Object(Illuminate\\Broadcasting\\BroadcastManager))\n#2 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Util.php(43): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#3 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(96): Illuminate\\Container\\Util::unwrapIfClosure(Object(Closure))\n#4 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(35): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(Illuminate\\Foundation\\Application), Array, Object(Closure))\n#5 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Container.php(754): Illuminate\\Container\\BoundMethod::call(Object(Illuminate\\Foundation\\Application), Array, Array, NULL)\n#6 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Bus\\Dispatcher.php(132): Illuminate\\Container\\Container->call(Array)\n#7 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(169): Illuminate\\Bus\\Dispatcher->Illuminate\\Bus\\{closure}(Object(Illuminate\\Broadcasting\\BroadcastEvent))\n#8 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(126): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Broadcasting\\BroadcastEvent))\n#9 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Bus\\Dispatcher.php(136): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#10 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(125): Illuminate\\Bus\\Dispatcher->dispatchNow(Object(Illuminate\\Broadcasting\\BroadcastEvent), false)\n#11 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(169): Illuminate\\Queue\\CallQueuedHandler->Illuminate\\Queue\\{closure}(Object(Illuminate\\Broadcasting\\BroadcastEvent))\n#12 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(126): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Broadcasting\\BroadcastEvent))\n#13 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(120): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#14 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(68): Illuminate\\Queue\\CallQueuedHandler->dispatchThroughMiddleware(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Object(Illuminate\\Broadcasting\\BroadcastEvent))\n#15 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Jobs\\Job.php(102): Illuminate\\Queue\\CallQueuedHandler->call(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Array)\n#16 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(441): Illuminate\\Queue\\Jobs\\Job->fire()\n#17 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(391): Illuminate\\Queue\\Worker->process(\'database\', Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Object(Illuminate\\Queue\\WorkerOptions))\n#18 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(177): Illuminate\\Queue\\Worker->runJob(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), \'database\', Object(Illuminate\\Queue\\WorkerOptions))\n#19 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Console\\WorkCommand.php(148): Illuminate\\Queue\\Worker->daemon(\'database\', \'default\', Object(Illuminate\\Queue\\WorkerOptions))\n#20 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Console\\WorkCommand.php(131): Illuminate\\Queue\\Console\\WorkCommand->runWorker(\'database\', \'default\')\n#21 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(36): Illuminate\\Queue\\Console\\WorkCommand->handle()\n#22 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Util.php(43): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#23 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(96): Illuminate\\Container\\Util::unwrapIfClosure(Object(Closure))\n#24 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(35): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(Illuminate\\Foundation\\Application), Array, Object(Closure))\n#25 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Container.php(754): Illuminate\\Container\\BoundMethod::call(Object(Illuminate\\Foundation\\Application), Array, Array, NULL)\n#26 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Console\\Command.php(211): Illuminate\\Container\\Container->call(Array)\n#27 C:\\DATN\\vendor\\symfony\\console\\Command\\Command.php(318): Illuminate\\Console\\Command->execute(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#28 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Console\\Command.php(180): Symfony\\Component\\Console\\Command\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#29 C:\\DATN\\vendor\\symfony\\console\\Application.php(1092): Illuminate\\Console\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#30 C:\\DATN\\vendor\\symfony\\console\\Application.php(341): Symfony\\Component\\Console\\Application->doRunCommand(Object(Illuminate\\Queue\\Console\\WorkCommand), Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#31 C:\\DATN\\vendor\\symfony\\console\\Application.php(192): Symfony\\Component\\Console\\Application->doRun(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#32 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Console\\Kernel.php(197): Symfony\\Component\\Console\\Application->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#33 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Application.php(1234): Illuminate\\Foundation\\Console\\Kernel->handle(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#34 C:\\DATN\\artisan(16): Illuminate\\Foundation\\Application->handleCommand(Object(Symfony\\Component\\Console\\Input\\ArgvInput))\n#35 {main}', '2025-06-15 07:24:29');
INSERT INTO `failed_jobs` VALUES (10, '48cf5f85-9986-4e14-b93d-7547793a40c8', 'database', 'default', '{\"uuid\":\"48cf5f85-9986-4e14-b93d-7547793a40c8\",\"displayName\":\"App\\\\Events\\\\OrderStatusUpdated\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":14:{s:5:\\\"event\\\";O:29:\\\"App\\\\Events\\\\OrderStatusUpdated\\\":1:{s:5:\\\"order\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:16:\\\"App\\\\Models\\\\Order\\\";s:2:\\\"id\\\";i:13;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\"},\"createdAt\":1749947134,\"delay\":null}', 'Illuminate\\Broadcasting\\BroadcastException: Pusher error: cURL error 7: Failed to connect to localhost port 8080 after 2259 ms: Couldn\'t connect to server (see https://curl.haxx.se/libcurl/c/libcurl-errors.html) for http://localhost:8080/apps/130010/events?auth_key=hebhaulzxbkh4ugtjs5x&auth_timestamp=1749947136&auth_version=1.0&body_md5=c1da76622780455fdeb6a1eca05d525a&auth_signature=17d0654da54bf65c833b3d1614c01caf200d7f2b7e64ef6631b96602443e9874. in C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Broadcasting\\Broadcasters\\PusherBroadcaster.php:163\nStack trace:\n#0 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Broadcasting\\BroadcastEvent.php(93): Illuminate\\Broadcasting\\Broadcasters\\PusherBroadcaster->broadcast(Object(Illuminate\\Support\\Collection), \'OrderStatusUpda...\', Array)\n#1 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(36): Illuminate\\Broadcasting\\BroadcastEvent->handle(Object(Illuminate\\Broadcasting\\BroadcastManager))\n#2 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Util.php(43): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#3 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(96): Illuminate\\Container\\Util::unwrapIfClosure(Object(Closure))\n#4 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(35): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(Illuminate\\Foundation\\Application), Array, Object(Closure))\n#5 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Container.php(754): Illuminate\\Container\\BoundMethod::call(Object(Illuminate\\Foundation\\Application), Array, Array, NULL)\n#6 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Bus\\Dispatcher.php(132): Illuminate\\Container\\Container->call(Array)\n#7 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(169): Illuminate\\Bus\\Dispatcher->Illuminate\\Bus\\{closure}(Object(Illuminate\\Broadcasting\\BroadcastEvent))\n#8 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(126): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Broadcasting\\BroadcastEvent))\n#9 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Bus\\Dispatcher.php(136): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#10 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(125): Illuminate\\Bus\\Dispatcher->dispatchNow(Object(Illuminate\\Broadcasting\\BroadcastEvent), false)\n#11 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(169): Illuminate\\Queue\\CallQueuedHandler->Illuminate\\Queue\\{closure}(Object(Illuminate\\Broadcasting\\BroadcastEvent))\n#12 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(126): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Broadcasting\\BroadcastEvent))\n#13 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(120): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#14 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(68): Illuminate\\Queue\\CallQueuedHandler->dispatchThroughMiddleware(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Object(Illuminate\\Broadcasting\\BroadcastEvent))\n#15 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Jobs\\Job.php(102): Illuminate\\Queue\\CallQueuedHandler->call(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Array)\n#16 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(441): Illuminate\\Queue\\Jobs\\Job->fire()\n#17 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(391): Illuminate\\Queue\\Worker->process(\'database\', Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Object(Illuminate\\Queue\\WorkerOptions))\n#18 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(177): Illuminate\\Queue\\Worker->runJob(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), \'database\', Object(Illuminate\\Queue\\WorkerOptions))\n#19 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Console\\WorkCommand.php(148): Illuminate\\Queue\\Worker->daemon(\'database\', \'default\', Object(Illuminate\\Queue\\WorkerOptions))\n#20 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Console\\WorkCommand.php(131): Illuminate\\Queue\\Console\\WorkCommand->runWorker(\'database\', \'default\')\n#21 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(36): Illuminate\\Queue\\Console\\WorkCommand->handle()\n#22 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Util.php(43): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#23 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(96): Illuminate\\Container\\Util::unwrapIfClosure(Object(Closure))\n#24 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(35): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(Illuminate\\Foundation\\Application), Array, Object(Closure))\n#25 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Container.php(754): Illuminate\\Container\\BoundMethod::call(Object(Illuminate\\Foundation\\Application), Array, Array, NULL)\n#26 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Console\\Command.php(211): Illuminate\\Container\\Container->call(Array)\n#27 C:\\DATN\\vendor\\symfony\\console\\Command\\Command.php(318): Illuminate\\Console\\Command->execute(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#28 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Console\\Command.php(180): Symfony\\Component\\Console\\Command\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#29 C:\\DATN\\vendor\\symfony\\console\\Application.php(1092): Illuminate\\Console\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#30 C:\\DATN\\vendor\\symfony\\console\\Application.php(341): Symfony\\Component\\Console\\Application->doRunCommand(Object(Illuminate\\Queue\\Console\\WorkCommand), Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#31 C:\\DATN\\vendor\\symfony\\console\\Application.php(192): Symfony\\Component\\Console\\Application->doRun(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#32 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Console\\Kernel.php(197): Symfony\\Component\\Console\\Application->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#33 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Application.php(1234): Illuminate\\Foundation\\Console\\Kernel->handle(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#34 C:\\DATN\\artisan(16): Illuminate\\Foundation\\Application->handleCommand(Object(Symfony\\Component\\Console\\Input\\ArgvInput))\n#35 {main}', '2025-06-15 07:25:39');
INSERT INTO `failed_jobs` VALUES (11, 'f08692a1-8e33-490d-b745-deb453dd31d0', 'database', 'default', '{\"uuid\":\"f08692a1-8e33-490d-b745-deb453dd31d0\",\"displayName\":\"App\\\\Events\\\\OrderStatusUpdated\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":14:{s:5:\\\"event\\\";O:29:\\\"App\\\\Events\\\\OrderStatusUpdated\\\":1:{s:5:\\\"order\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:16:\\\"App\\\\Models\\\\Order\\\";s:2:\\\"id\\\";i:13;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\"},\"createdAt\":1749947275,\"delay\":null}', 'Illuminate\\Broadcasting\\BroadcastException: Pusher error: cURL error 7: Failed to connect to localhost port 8080 after 2253 ms: Couldn\'t connect to server (see https://curl.haxx.se/libcurl/c/libcurl-errors.html) for http://localhost:8080/apps/130010/events?auth_key=hebhaulzxbkh4ugtjs5x&auth_timestamp=1749947277&auth_version=1.0&body_md5=771bd9263a6eb0ff81765a5901f26bf4&auth_signature=0bed3ace386745531a7fe961202fd1c9a30c632e944c7558755d16fa8bc93fc6. in C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Broadcasting\\Broadcasters\\PusherBroadcaster.php:163\nStack trace:\n#0 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Broadcasting\\BroadcastEvent.php(93): Illuminate\\Broadcasting\\Broadcasters\\PusherBroadcaster->broadcast(Object(Illuminate\\Support\\Collection), \'OrderStatusUpda...\', Array)\n#1 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(36): Illuminate\\Broadcasting\\BroadcastEvent->handle(Object(Illuminate\\Broadcasting\\BroadcastManager))\n#2 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Util.php(43): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#3 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(96): Illuminate\\Container\\Util::unwrapIfClosure(Object(Closure))\n#4 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(35): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(Illuminate\\Foundation\\Application), Array, Object(Closure))\n#5 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Container.php(754): Illuminate\\Container\\BoundMethod::call(Object(Illuminate\\Foundation\\Application), Array, Array, NULL)\n#6 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Bus\\Dispatcher.php(132): Illuminate\\Container\\Container->call(Array)\n#7 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(169): Illuminate\\Bus\\Dispatcher->Illuminate\\Bus\\{closure}(Object(Illuminate\\Broadcasting\\BroadcastEvent))\n#8 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(126): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Broadcasting\\BroadcastEvent))\n#9 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Bus\\Dispatcher.php(136): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#10 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(125): Illuminate\\Bus\\Dispatcher->dispatchNow(Object(Illuminate\\Broadcasting\\BroadcastEvent), false)\n#11 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(169): Illuminate\\Queue\\CallQueuedHandler->Illuminate\\Queue\\{closure}(Object(Illuminate\\Broadcasting\\BroadcastEvent))\n#12 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(126): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Broadcasting\\BroadcastEvent))\n#13 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(120): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#14 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(68): Illuminate\\Queue\\CallQueuedHandler->dispatchThroughMiddleware(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Object(Illuminate\\Broadcasting\\BroadcastEvent))\n#15 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Jobs\\Job.php(102): Illuminate\\Queue\\CallQueuedHandler->call(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Array)\n#16 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(441): Illuminate\\Queue\\Jobs\\Job->fire()\n#17 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(391): Illuminate\\Queue\\Worker->process(\'database\', Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Object(Illuminate\\Queue\\WorkerOptions))\n#18 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(177): Illuminate\\Queue\\Worker->runJob(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), \'database\', Object(Illuminate\\Queue\\WorkerOptions))\n#19 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Console\\WorkCommand.php(148): Illuminate\\Queue\\Worker->daemon(\'database\', \'default\', Object(Illuminate\\Queue\\WorkerOptions))\n#20 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Console\\WorkCommand.php(131): Illuminate\\Queue\\Console\\WorkCommand->runWorker(\'database\', \'default\')\n#21 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(36): Illuminate\\Queue\\Console\\WorkCommand->handle()\n#22 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Util.php(43): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#23 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(96): Illuminate\\Container\\Util::unwrapIfClosure(Object(Closure))\n#24 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(35): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(Illuminate\\Foundation\\Application), Array, Object(Closure))\n#25 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Container.php(754): Illuminate\\Container\\BoundMethod::call(Object(Illuminate\\Foundation\\Application), Array, Array, NULL)\n#26 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Console\\Command.php(211): Illuminate\\Container\\Container->call(Array)\n#27 C:\\DATN\\vendor\\symfony\\console\\Command\\Command.php(318): Illuminate\\Console\\Command->execute(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#28 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Console\\Command.php(180): Symfony\\Component\\Console\\Command\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#29 C:\\DATN\\vendor\\symfony\\console\\Application.php(1092): Illuminate\\Console\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#30 C:\\DATN\\vendor\\symfony\\console\\Application.php(341): Symfony\\Component\\Console\\Application->doRunCommand(Object(Illuminate\\Queue\\Console\\WorkCommand), Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#31 C:\\DATN\\vendor\\symfony\\console\\Application.php(192): Symfony\\Component\\Console\\Application->doRun(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#32 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Console\\Kernel.php(197): Symfony\\Component\\Console\\Application->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#33 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Application.php(1234): Illuminate\\Foundation\\Console\\Kernel->handle(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#34 C:\\DATN\\artisan(16): Illuminate\\Foundation\\Application->handleCommand(Object(Symfony\\Component\\Console\\Input\\ArgvInput))\n#35 {main}', '2025-06-15 07:27:59');
INSERT INTO `failed_jobs` VALUES (12, '2a90554b-5c59-434b-ad53-baca7f57948a', 'database', 'default', '{\"uuid\":\"2a90554b-5c59-434b-ad53-baca7f57948a\",\"displayName\":\"App\\\\Events\\\\OrderStatusUpdated\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":14:{s:5:\\\"event\\\";O:29:\\\"App\\\\Events\\\\OrderStatusUpdated\\\":1:{s:5:\\\"order\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:16:\\\"App\\\\Models\\\\Order\\\";s:2:\\\"id\\\";i:13;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\"},\"createdAt\":1749947506,\"delay\":null}', 'Illuminate\\Broadcasting\\BroadcastException: Pusher error: cURL error 7: Failed to connect to localhost port 8080 after 2260 ms: Couldn\'t connect to server (see https://curl.haxx.se/libcurl/c/libcurl-errors.html) for http://localhost:8080/apps/130010/events?auth_key=hebhaulzxbkh4ugtjs5x&auth_timestamp=1749947508&auth_version=1.0&body_md5=3c8136858e93e4b1b25e594e907837f0&auth_signature=653dc5479561468daea6a1bc89c76fcc439c91d78ae1744c95a79bb8ef0b7818. in C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Broadcasting\\Broadcasters\\PusherBroadcaster.php:163\nStack trace:\n#0 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Broadcasting\\BroadcastEvent.php(93): Illuminate\\Broadcasting\\Broadcasters\\PusherBroadcaster->broadcast(Object(Illuminate\\Support\\Collection), \'OrderStatusUpda...\', Array)\n#1 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(36): Illuminate\\Broadcasting\\BroadcastEvent->handle(Object(Illuminate\\Broadcasting\\BroadcastManager))\n#2 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Util.php(43): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#3 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(96): Illuminate\\Container\\Util::unwrapIfClosure(Object(Closure))\n#4 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(35): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(Illuminate\\Foundation\\Application), Array, Object(Closure))\n#5 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Container.php(754): Illuminate\\Container\\BoundMethod::call(Object(Illuminate\\Foundation\\Application), Array, Array, NULL)\n#6 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Bus\\Dispatcher.php(132): Illuminate\\Container\\Container->call(Array)\n#7 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(169): Illuminate\\Bus\\Dispatcher->Illuminate\\Bus\\{closure}(Object(Illuminate\\Broadcasting\\BroadcastEvent))\n#8 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(126): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Broadcasting\\BroadcastEvent))\n#9 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Bus\\Dispatcher.php(136): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#10 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(125): Illuminate\\Bus\\Dispatcher->dispatchNow(Object(Illuminate\\Broadcasting\\BroadcastEvent), false)\n#11 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(169): Illuminate\\Queue\\CallQueuedHandler->Illuminate\\Queue\\{closure}(Object(Illuminate\\Broadcasting\\BroadcastEvent))\n#12 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(126): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Broadcasting\\BroadcastEvent))\n#13 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(120): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#14 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(68): Illuminate\\Queue\\CallQueuedHandler->dispatchThroughMiddleware(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Object(Illuminate\\Broadcasting\\BroadcastEvent))\n#15 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Jobs\\Job.php(102): Illuminate\\Queue\\CallQueuedHandler->call(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Array)\n#16 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(441): Illuminate\\Queue\\Jobs\\Job->fire()\n#17 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(391): Illuminate\\Queue\\Worker->process(\'database\', Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Object(Illuminate\\Queue\\WorkerOptions))\n#18 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(177): Illuminate\\Queue\\Worker->runJob(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), \'database\', Object(Illuminate\\Queue\\WorkerOptions))\n#19 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Console\\WorkCommand.php(148): Illuminate\\Queue\\Worker->daemon(\'database\', \'default\', Object(Illuminate\\Queue\\WorkerOptions))\n#20 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Console\\WorkCommand.php(131): Illuminate\\Queue\\Console\\WorkCommand->runWorker(\'database\', \'default\')\n#21 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(36): Illuminate\\Queue\\Console\\WorkCommand->handle()\n#22 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Util.php(43): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#23 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(96): Illuminate\\Container\\Util::unwrapIfClosure(Object(Closure))\n#24 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(35): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(Illuminate\\Foundation\\Application), Array, Object(Closure))\n#25 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Container.php(754): Illuminate\\Container\\BoundMethod::call(Object(Illuminate\\Foundation\\Application), Array, Array, NULL)\n#26 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Console\\Command.php(211): Illuminate\\Container\\Container->call(Array)\n#27 C:\\DATN\\vendor\\symfony\\console\\Command\\Command.php(318): Illuminate\\Console\\Command->execute(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#28 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Console\\Command.php(180): Symfony\\Component\\Console\\Command\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#29 C:\\DATN\\vendor\\symfony\\console\\Application.php(1092): Illuminate\\Console\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#30 C:\\DATN\\vendor\\symfony\\console\\Application.php(341): Symfony\\Component\\Console\\Application->doRunCommand(Object(Illuminate\\Queue\\Console\\WorkCommand), Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#31 C:\\DATN\\vendor\\symfony\\console\\Application.php(192): Symfony\\Component\\Console\\Application->doRun(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#32 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Console\\Kernel.php(197): Symfony\\Component\\Console\\Application->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#33 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Application.php(1234): Illuminate\\Foundation\\Console\\Kernel->handle(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#34 C:\\DATN\\artisan(16): Illuminate\\Foundation\\Application->handleCommand(Object(Symfony\\Component\\Console\\Input\\ArgvInput))\n#35 {main}', '2025-06-15 07:31:51');
INSERT INTO `failed_jobs` VALUES (13, '248c1f19-fcd2-4ce8-b446-d074e2bcf7a1', 'database', 'default', '{\"uuid\":\"248c1f19-fcd2-4ce8-b446-d074e2bcf7a1\",\"displayName\":\"App\\\\Events\\\\OrderStatusUpdated\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":14:{s:5:\\\"event\\\";O:29:\\\"App\\\\Events\\\\OrderStatusUpdated\\\":1:{s:5:\\\"order\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:16:\\\"App\\\\Models\\\\Order\\\";s:2:\\\"id\\\";i:13;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\"},\"createdAt\":1749947568,\"delay\":null}', 'Illuminate\\Broadcasting\\BroadcastException: Pusher error: cURL error 7: Failed to connect to localhost port 8080 after 2258 ms: Couldn\'t connect to server (see https://curl.haxx.se/libcurl/c/libcurl-errors.html) for http://localhost:8080/apps/130010/events?auth_key=hebhaulzxbkh4ugtjs5x&auth_timestamp=1749947569&auth_version=1.0&body_md5=c1da76622780455fdeb6a1eca05d525a&auth_signature=24fcc739b9f570d22d57705afe7d47f293bf1ba06333fa6b478bba70bfde17f7. in C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Broadcasting\\Broadcasters\\PusherBroadcaster.php:163\nStack trace:\n#0 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Broadcasting\\BroadcastEvent.php(93): Illuminate\\Broadcasting\\Broadcasters\\PusherBroadcaster->broadcast(Object(Illuminate\\Support\\Collection), \'OrderStatusUpda...\', Array)\n#1 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(36): Illuminate\\Broadcasting\\BroadcastEvent->handle(Object(Illuminate\\Broadcasting\\BroadcastManager))\n#2 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Util.php(43): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#3 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(96): Illuminate\\Container\\Util::unwrapIfClosure(Object(Closure))\n#4 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(35): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(Illuminate\\Foundation\\Application), Array, Object(Closure))\n#5 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Container.php(754): Illuminate\\Container\\BoundMethod::call(Object(Illuminate\\Foundation\\Application), Array, Array, NULL)\n#6 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Bus\\Dispatcher.php(132): Illuminate\\Container\\Container->call(Array)\n#7 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(169): Illuminate\\Bus\\Dispatcher->Illuminate\\Bus\\{closure}(Object(Illuminate\\Broadcasting\\BroadcastEvent))\n#8 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(126): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Broadcasting\\BroadcastEvent))\n#9 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Bus\\Dispatcher.php(136): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#10 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(125): Illuminate\\Bus\\Dispatcher->dispatchNow(Object(Illuminate\\Broadcasting\\BroadcastEvent), false)\n#11 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(169): Illuminate\\Queue\\CallQueuedHandler->Illuminate\\Queue\\{closure}(Object(Illuminate\\Broadcasting\\BroadcastEvent))\n#12 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(126): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Broadcasting\\BroadcastEvent))\n#13 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(120): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#14 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(68): Illuminate\\Queue\\CallQueuedHandler->dispatchThroughMiddleware(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Object(Illuminate\\Broadcasting\\BroadcastEvent))\n#15 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Jobs\\Job.php(102): Illuminate\\Queue\\CallQueuedHandler->call(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Array)\n#16 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(441): Illuminate\\Queue\\Jobs\\Job->fire()\n#17 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(391): Illuminate\\Queue\\Worker->process(\'database\', Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Object(Illuminate\\Queue\\WorkerOptions))\n#18 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(177): Illuminate\\Queue\\Worker->runJob(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), \'database\', Object(Illuminate\\Queue\\WorkerOptions))\n#19 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Console\\WorkCommand.php(148): Illuminate\\Queue\\Worker->daemon(\'database\', \'default\', Object(Illuminate\\Queue\\WorkerOptions))\n#20 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Console\\WorkCommand.php(131): Illuminate\\Queue\\Console\\WorkCommand->runWorker(\'database\', \'default\')\n#21 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(36): Illuminate\\Queue\\Console\\WorkCommand->handle()\n#22 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Util.php(43): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#23 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(96): Illuminate\\Container\\Util::unwrapIfClosure(Object(Closure))\n#24 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(35): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(Illuminate\\Foundation\\Application), Array, Object(Closure))\n#25 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Container.php(754): Illuminate\\Container\\BoundMethod::call(Object(Illuminate\\Foundation\\Application), Array, Array, NULL)\n#26 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Console\\Command.php(211): Illuminate\\Container\\Container->call(Array)\n#27 C:\\DATN\\vendor\\symfony\\console\\Command\\Command.php(318): Illuminate\\Console\\Command->execute(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#28 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Console\\Command.php(180): Symfony\\Component\\Console\\Command\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#29 C:\\DATN\\vendor\\symfony\\console\\Application.php(1092): Illuminate\\Console\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#30 C:\\DATN\\vendor\\symfony\\console\\Application.php(341): Symfony\\Component\\Console\\Application->doRunCommand(Object(Illuminate\\Queue\\Console\\WorkCommand), Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#31 C:\\DATN\\vendor\\symfony\\console\\Application.php(192): Symfony\\Component\\Console\\Application->doRun(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#32 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Console\\Kernel.php(197): Symfony\\Component\\Console\\Application->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#33 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Application.php(1234): Illuminate\\Foundation\\Console\\Kernel->handle(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#34 C:\\DATN\\artisan(16): Illuminate\\Foundation\\Application->handleCommand(Object(Symfony\\Component\\Console\\Input\\ArgvInput))\n#35 {main}', '2025-06-15 07:32:52');

-- ----------------------------
-- Table structure for faqs
-- ----------------------------
DROP TABLE IF EXISTS `faqs`;
CREATE TABLE `faqs`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `question` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `answer` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `keywords` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `status` enum('active','inactive') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of faqs
-- ----------------------------

-- ----------------------------
-- Table structure for flash_sale_items
-- ----------------------------
DROP TABLE IF EXISTS `flash_sale_items`;
CREATE TABLE `flash_sale_items`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `flash_sale_id` bigint(20) UNSIGNED NOT NULL,
  `product_variant_id` bigint(20) UNSIGNED NOT NULL,
  `count` int(11) NOT NULL DEFAULT 0,
  `discount` decimal(12, 2) NOT NULL,
  `discount_type` enum('percent','fixed') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'percent',
  `buy_limit` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `flash_sale_items_flash_sale_id_foreign`(`flash_sale_id`) USING BTREE,
  INDEX `flash_sale_items_product_variant_id_foreign`(`product_variant_id`) USING BTREE,
  CONSTRAINT `flash_sale_items_flash_sale_id_foreign` FOREIGN KEY (`flash_sale_id`) REFERENCES `flash_sales` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `flash_sale_items_product_variant_id_foreign` FOREIGN KEY (`product_variant_id`) REFERENCES `product_variants` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of flash_sale_items
-- ----------------------------

-- ----------------------------
-- Table structure for flash_sales
-- ----------------------------
DROP TABLE IF EXISTS `flash_sales`;
CREATE TABLE `flash_sales`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `start_time` datetime NOT NULL,
  `end_time` datetime NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of flash_sales
-- ----------------------------
INSERT INTO `flash_sales` VALUES (5, 'Flash Sale Summer', '2025-06-06 09:09:00', '2025-06-12 09:09:00', 1, '2025-06-08 09:09:56', '2025-06-08 10:29:23');

-- ----------------------------
-- Table structure for invoices
-- ----------------------------
DROP TABLE IF EXISTS `invoices`;
CREATE TABLE `invoices`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `invoice_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `total` decimal(15, 2) NOT NULL,
  `issued_by` bigint(20) UNSIGNED NULL DEFAULT NULL,
  `issued_at` timestamp NULL DEFAULT NULL,
  `file_path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `invoices_invoice_code_unique`(`invoice_code`) USING BTREE,
  INDEX `invoices_order_id_foreign`(`order_id`) USING BTREE,
  CONSTRAINT `invoices_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 74 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of invoices
-- ----------------------------
INSERT INTO `invoices` VALUES (1, 2, 'INV000002', 444.00, NULL, '2025-06-15 00:35:21', NULL, '2025-06-15 00:35:21', '2025-06-15 00:35:21');
INSERT INTO `invoices` VALUES (2, 5, 'INV000005', 55444.00, NULL, '2025-06-15 01:03:51', NULL, '2025-06-15 01:03:51', '2025-06-15 01:03:51');
INSERT INTO `invoices` VALUES (3, 6, 'INV000006', 55444.00, NULL, '2025-06-15 01:07:07', NULL, '2025-06-15 01:07:07', '2025-06-15 01:07:07');
INSERT INTO `invoices` VALUES (4, 8, 'INV000008', 110888.00, NULL, '2025-06-15 01:30:42', NULL, '2025-06-15 01:30:42', '2025-06-15 01:30:42');
INSERT INTO `invoices` VALUES (5, 7, 'INV000007', 55444.00, 1, '2025-06-15 02:11:14', NULL, '2025-06-15 02:11:14', '2025-06-15 02:11:14');
INSERT INTO `invoices` VALUES (6, 11, 'INV000011', 34333.00, NULL, '2025-06-15 07:05:10', NULL, '2025-06-15 07:05:10', '2025-06-15 07:05:10');
INSERT INTO `invoices` VALUES (7, 12, 'INV000012', 34333.00, NULL, '2025-06-15 07:09:32', NULL, '2025-06-15 07:09:32', '2025-06-15 07:09:32');
INSERT INTO `invoices` VALUES (8, 13, 'INV000013', 34333.00, NULL, '2025-06-15 07:16:17', NULL, '2025-06-15 07:16:17', '2025-06-15 07:16:17');
INSERT INTO `invoices` VALUES (9, 14, 'INV000014', 34333.00, NULL, '2025-06-15 07:48:09', NULL, '2025-06-15 07:48:09', '2025-06-15 07:48:09');
INSERT INTO `invoices` VALUES (10, 15, 'INV000015', 34333.00, NULL, '2025-06-15 07:50:14', NULL, '2025-06-15 07:50:14', '2025-06-15 07:50:14');
INSERT INTO `invoices` VALUES (11, 16, 'INV000016', 34333.00, NULL, '2025-06-15 08:24:22', NULL, '2025-06-15 08:24:22', '2025-06-15 08:24:22');
INSERT INTO `invoices` VALUES (12, 17, 'INV000017', 34333.00, NULL, '2025-06-15 08:28:20', NULL, '2025-06-15 08:28:20', '2025-06-15 08:28:20');
INSERT INTO `invoices` VALUES (13, 18, 'INV000018', 34333.00, NULL, '2025-06-15 08:48:24', NULL, '2025-06-15 08:48:24', '2025-06-15 08:48:24');
INSERT INTO `invoices` VALUES (14, 19, 'INV000019', 34333.00, NULL, '2025-06-15 08:52:02', NULL, '2025-06-15 08:52:02', '2025-06-15 08:52:02');
INSERT INTO `invoices` VALUES (15, 20, 'INV000020', 34333.00, NULL, '2025-06-15 08:57:42', NULL, '2025-06-15 08:57:42', '2025-06-15 08:57:42');
INSERT INTO `invoices` VALUES (16, 21, 'INV000021', 34333.00, NULL, '2025-06-15 09:02:30', NULL, '2025-06-15 09:02:30', '2025-06-15 09:02:30');
INSERT INTO `invoices` VALUES (17, 22, 'INV000022', 34333.00, NULL, '2025-06-15 11:46:07', NULL, '2025-06-15 11:46:07', '2025-06-15 11:46:07');
INSERT INTO `invoices` VALUES (18, 23, 'INV000023', 34333.00, NULL, '2025-06-15 11:47:14', NULL, '2025-06-15 11:47:14', '2025-06-15 11:47:14');
INSERT INTO `invoices` VALUES (19, 24, 'INV000024', 68666.00, NULL, '2025-06-15 11:58:53', NULL, '2025-06-15 11:58:53', '2025-06-15 11:58:53');
INSERT INTO `invoices` VALUES (20, 25, 'INV000025', 34333.00, NULL, '2025-06-15 11:59:31', NULL, '2025-06-15 11:59:31', '2025-06-15 11:59:31');
INSERT INTO `invoices` VALUES (21, 26, 'INV000026', 799999.00, NULL, '2025-06-15 12:51:35', NULL, '2025-06-15 12:51:35', '2025-06-15 12:51:35');
INSERT INTO `invoices` VALUES (22, 27, 'INV000027', 13799998.00, NULL, '2025-06-15 12:52:43', NULL, '2025-06-15 12:52:43', '2025-06-15 12:52:43');
INSERT INTO `invoices` VALUES (23, 28, 'INV000028', 12999999.00, NULL, '2025-06-15 20:22:21', NULL, '2025-06-15 20:22:21', '2025-06-15 20:22:21');
INSERT INTO `invoices` VALUES (24, 29, 'INV000029', 12999999.00, NULL, '2025-06-15 20:26:58', NULL, '2025-06-15 20:26:58', '2025-06-15 20:26:58');
INSERT INTO `invoices` VALUES (25, 34, 'INV000034', 12999999.00, NULL, '2025-06-15 20:48:36', NULL, '2025-06-15 20:48:36', '2025-06-15 20:48:36');
INSERT INTO `invoices` VALUES (26, 42, 'INV000042', 34333.00, NULL, '2025-06-15 21:07:56', NULL, '2025-06-15 21:07:56', '2025-06-15 21:07:56');
INSERT INTO `invoices` VALUES (27, 43, 'INV000043', 12999999.00, NULL, '2025-06-15 21:10:30', NULL, '2025-06-15 21:10:30', '2025-06-15 21:10:30');
INSERT INTO `invoices` VALUES (28, 44, 'INV000044', 12999999.00, NULL, '2025-06-15 21:13:15', NULL, '2025-06-15 21:13:15', '2025-06-15 21:13:15');
INSERT INTO `invoices` VALUES (29, 45, 'INV000045', 12999999.00, NULL, '2025-06-15 21:50:11', NULL, '2025-06-15 21:50:11', '2025-06-15 21:50:11');
INSERT INTO `invoices` VALUES (30, 46, 'INV000046', 12999999.00, NULL, '2025-06-15 21:56:45', NULL, '2025-06-15 21:56:45', '2025-06-15 21:56:45');
INSERT INTO `invoices` VALUES (31, 47, 'INV000047', 34333.00, NULL, '2025-06-15 22:02:01', NULL, '2025-06-15 22:02:01', '2025-06-15 22:02:01');
INSERT INTO `invoices` VALUES (32, 48, 'INV000048', 12999999.00, NULL, '2025-06-15 22:13:13', NULL, '2025-06-15 22:13:13', '2025-06-15 22:13:13');
INSERT INTO `invoices` VALUES (33, 49, 'INV000049', 12999999.00, NULL, '2025-06-15 22:19:17', NULL, '2025-06-15 22:19:17', '2025-06-15 22:19:17');
INSERT INTO `invoices` VALUES (34, 50, 'INV000050', 12999999.00, NULL, '2025-06-15 22:33:19', NULL, '2025-06-15 22:33:19', '2025-06-15 22:33:19');
INSERT INTO `invoices` VALUES (35, 51, 'INV000051', 12999999.00, NULL, '2025-06-15 22:37:38', NULL, '2025-06-15 22:37:38', '2025-06-15 22:37:38');
INSERT INTO `invoices` VALUES (36, 52, 'INV000052', 34333.00, NULL, '2025-06-15 22:42:58', NULL, '2025-06-15 22:42:58', '2025-06-15 22:42:58');
INSERT INTO `invoices` VALUES (37, 53, 'INV000053', 12999999.00, NULL, '2025-06-15 23:00:58', NULL, '2025-06-15 23:00:58', '2025-06-15 23:00:58');
INSERT INTO `invoices` VALUES (38, 54, 'INV000054', 12999999.00, NULL, '2025-06-15 23:04:49', NULL, '2025-06-15 23:04:49', '2025-06-15 23:04:49');
INSERT INTO `invoices` VALUES (39, 55, 'INV000055', 12999999.00, NULL, '2025-06-15 23:06:28', NULL, '2025-06-15 23:06:28', '2025-06-15 23:06:28');
INSERT INTO `invoices` VALUES (40, 56, 'INV000056', 12999999.00, NULL, '2025-06-15 23:08:17', NULL, '2025-06-15 23:08:17', '2025-06-15 23:08:17');
INSERT INTO `invoices` VALUES (41, 57, 'INV000057', 12999999.00, NULL, '2025-06-15 23:10:55', NULL, '2025-06-15 23:10:55', '2025-06-15 23:10:55');
INSERT INTO `invoices` VALUES (42, 58, 'INV000058', 12999999.00, NULL, '2025-06-15 23:16:04', NULL, '2025-06-15 23:16:04', '2025-06-15 23:16:04');
INSERT INTO `invoices` VALUES (43, 59, 'INV000059', 34333.00, NULL, '2025-06-15 23:17:09', NULL, '2025-06-15 23:17:09', '2025-06-15 23:17:09');
INSERT INTO `invoices` VALUES (44, 61, 'INV000061', 34333.00, NULL, '2025-06-15 23:22:46', NULL, '2025-06-15 23:22:46', '2025-06-15 23:22:46');
INSERT INTO `invoices` VALUES (45, 62, 'INV000062', 12999999.00, NULL, '2025-06-15 23:26:25', NULL, '2025-06-15 23:26:25', '2025-06-15 23:26:25');
INSERT INTO `invoices` VALUES (46, 63, 'INV000063', 34333.00, NULL, '2025-06-15 23:26:58', NULL, '2025-06-15 23:26:58', '2025-06-15 23:26:58');
INSERT INTO `invoices` VALUES (47, 64, 'INV000064', 12999999.00, NULL, '2025-06-15 23:32:15', NULL, '2025-06-15 23:32:15', '2025-06-15 23:32:15');
INSERT INTO `invoices` VALUES (48, 65, 'INV000065', 12999999.00, NULL, '2025-06-15 23:36:10', NULL, '2025-06-15 23:36:10', '2025-06-15 23:36:10');
INSERT INTO `invoices` VALUES (49, 66, 'INV000066', 34333.00, NULL, '2025-06-15 23:39:27', NULL, '2025-06-15 23:39:27', '2025-06-15 23:39:27');
INSERT INTO `invoices` VALUES (50, 67, 'INV000067', 34333.00, NULL, '2025-06-15 23:39:57', NULL, '2025-06-15 23:39:57', '2025-06-15 23:39:57');
INSERT INTO `invoices` VALUES (51, 68, 'INV000068', 12999999.00, NULL, '2025-06-15 23:43:17', NULL, '2025-06-15 23:43:17', '2025-06-15 23:43:17');
INSERT INTO `invoices` VALUES (52, 69, 'INV000069', 12999999.00, NULL, '2025-06-15 23:47:24', NULL, '2025-06-15 23:47:24', '2025-06-15 23:47:24');
INSERT INTO `invoices` VALUES (53, 70, 'INV000070', 12999999.00, NULL, '2025-06-15 23:49:44', NULL, '2025-06-15 23:49:44', '2025-06-15 23:49:44');
INSERT INTO `invoices` VALUES (54, 71, 'INV000071', 68666.00, NULL, '2025-06-15 23:53:00', NULL, '2025-06-15 23:53:00', '2025-06-15 23:53:00');
INSERT INTO `invoices` VALUES (55, 72, 'INV000072', 12999999.00, NULL, '2025-06-15 23:55:19', NULL, '2025-06-15 23:55:19', '2025-06-15 23:55:19');
INSERT INTO `invoices` VALUES (56, 73, 'INV000073', 34333.00, NULL, '2025-06-15 23:57:28', NULL, '2025-06-15 23:57:28', '2025-06-15 23:57:28');
INSERT INTO `invoices` VALUES (57, 74, 'INV000074', 34333.00, NULL, '2025-06-15 23:58:24', NULL, '2025-06-15 23:58:24', '2025-06-15 23:58:24');
INSERT INTO `invoices` VALUES (58, 75, 'INV000075', 34333.00, NULL, '2025-06-16 00:02:19', NULL, '2025-06-16 00:02:19', '2025-06-16 00:02:19');
INSERT INTO `invoices` VALUES (59, 76, 'INV000076', 12999999.00, NULL, '2025-06-16 00:09:41', NULL, '2025-06-16 00:09:41', '2025-06-16 00:09:41');
INSERT INTO `invoices` VALUES (60, 77, 'INV000077', 12999999.00, NULL, '2025-06-16 00:13:26', NULL, '2025-06-16 00:13:26', '2025-06-16 00:13:26');
INSERT INTO `invoices` VALUES (61, 81, 'INV000081', 34333.00, NULL, '2025-06-16 00:31:38', NULL, '2025-06-16 00:31:38', '2025-06-16 00:31:38');
INSERT INTO `invoices` VALUES (62, 82, 'INV000082', 34333.00, NULL, '2025-06-16 00:32:27', NULL, '2025-06-16 00:32:27', '2025-06-16 00:32:27');
INSERT INTO `invoices` VALUES (63, 84, 'INV000084', 34333.00, NULL, '2025-06-16 00:34:42', NULL, '2025-06-16 00:34:42', '2025-06-16 00:34:42');
INSERT INTO `invoices` VALUES (64, 85, 'INV000085', 12999999.00, NULL, '2025-06-16 00:35:28', NULL, '2025-06-16 00:35:28', '2025-06-16 00:35:28');
INSERT INTO `invoices` VALUES (65, 88, 'INV000088', 34333.00, NULL, '2025-06-16 01:00:09', NULL, '2025-06-16 01:00:09', '2025-06-16 01:00:09');
INSERT INTO `invoices` VALUES (70, 93, 'INV000093', 12345.00, NULL, '2025-06-16 15:27:36', NULL, '2025-06-16 15:27:36', '2025-06-16 15:27:36');
INSERT INTO `invoices` VALUES (71, 94, 'INV000094', 2345678.00, NULL, '2025-06-16 22:58:34', NULL, '2025-06-16 22:58:34', '2025-06-16 22:58:34');
INSERT INTO `invoices` VALUES (72, 95, 'INV000095', 555.00, NULL, '2025-06-17 22:45:55', NULL, '2025-06-17 22:45:55', '2025-06-17 22:45:55');
INSERT INTO `invoices` VALUES (73, 96, 'INV000096', 55125.00, NULL, '2025-06-18 15:25:23', NULL, '2025-06-18 15:25:23', '2025-06-18 15:25:23');

-- ----------------------------
-- Table structure for job_batches
-- ----------------------------
DROP TABLE IF EXISTS `job_batches`;
CREATE TABLE `job_batches`  (
  `id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_jobs` int(11) NOT NULL,
  `pending_jobs` int(11) NOT NULL,
  `failed_jobs` int(11) NOT NULL,
  `failed_job_ids` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `options` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `cancelled_at` int(11) NULL DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `finished_at` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of job_batches
-- ----------------------------

-- ----------------------------
-- Table structure for jobs
-- ----------------------------
DROP TABLE IF EXISTS `jobs`;
CREATE TABLE `jobs`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `queue` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED NULL DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `jobs_queue_index`(`queue`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 291 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of jobs
-- ----------------------------
INSERT INTO `jobs` VALUES (284, 'default', '{\"uuid\":\"b88e287b-f80f-41c7-b3a9-0771d83d405b\",\"displayName\":\"App\\\\Events\\\\OrderStatusUpdated\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":14:{s:5:\\\"event\\\";O:29:\\\"App\\\\Events\\\\OrderStatusUpdated\\\":1:{s:5:\\\"order\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:16:\\\"App\\\\Models\\\\Order\\\";s:2:\\\"id\\\";i:87;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\"},\"createdAt\":1750175418,\"delay\":null}', 0, NULL, 1750175418, 1750175418);
INSERT INTO `jobs` VALUES (285, 'default', '{\"uuid\":\"d173fd9c-6d6c-40d1-a002-4a34c4b0c0f0\",\"displayName\":\"App\\\\Events\\\\OrderStatusUpdated\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":14:{s:5:\\\"event\\\";O:29:\\\"App\\\\Events\\\\OrderStatusUpdated\\\":1:{s:5:\\\"order\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:16:\\\"App\\\\Models\\\\Order\\\";s:2:\\\"id\\\";i:87;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\"},\"createdAt\":1750175423,\"delay\":null}', 0, NULL, 1750175423, 1750175423);
INSERT INTO `jobs` VALUES (286, 'default', '{\"uuid\":\"cb3be89b-b2a5-4539-9368-8393b4950ce3\",\"displayName\":\"App\\\\Events\\\\OrderStatusUpdated\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":14:{s:5:\\\"event\\\";O:29:\\\"App\\\\Events\\\\OrderStatusUpdated\\\":1:{s:5:\\\"order\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:16:\\\"App\\\\Models\\\\Order\\\";s:2:\\\"id\\\";i:87;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\"},\"createdAt\":1750175427,\"delay\":null}', 0, NULL, 1750175427, 1750175427);
INSERT INTO `jobs` VALUES (287, 'default', '{\"uuid\":\"8e06699a-cabd-48ef-9f67-15710c9f0ad5\",\"displayName\":\"App\\\\Events\\\\OrderStatusUpdated\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":14:{s:5:\\\"event\\\";O:29:\\\"App\\\\Events\\\\OrderStatusUpdated\\\":1:{s:5:\\\"order\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:16:\\\"App\\\\Models\\\\Order\\\";s:2:\\\"id\\\";i:95;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\"},\"createdAt\":1750175452,\"delay\":null}', 0, NULL, 1750175452, 1750175452);
INSERT INTO `jobs` VALUES (288, 'default', '{\"uuid\":\"dbd61015-f8b7-4be5-9f3d-482197daed46\",\"displayName\":\"App\\\\Events\\\\OrderStatusUpdated\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":14:{s:5:\\\"event\\\";O:29:\\\"App\\\\Events\\\\OrderStatusUpdated\\\":1:{s:5:\\\"order\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:16:\\\"App\\\\Models\\\\Order\\\";s:2:\\\"id\\\";i:95;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\"},\"createdAt\":1750175511,\"delay\":null}', 0, NULL, 1750175511, 1750175511);
INSERT INTO `jobs` VALUES (289, 'default', '{\"uuid\":\"542ca5f8-8e7f-425e-a279-d8d1c680edd6\",\"displayName\":\"App\\\\Events\\\\OrderStatusUpdated\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":14:{s:5:\\\"event\\\";O:29:\\\"App\\\\Events\\\\OrderStatusUpdated\\\":1:{s:5:\\\"order\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:16:\\\"App\\\\Models\\\\Order\\\";s:2:\\\"id\\\";i:95;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\"},\"createdAt\":1750175569,\"delay\":null}', 0, NULL, 1750175569, 1750175569);
INSERT INTO `jobs` VALUES (290, 'default', '{\"uuid\":\"8279f4fd-5f3a-4d1f-8402-5ab02fae71c8\",\"displayName\":\"App\\\\Events\\\\OrderStatusUpdated\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":14:{s:5:\\\"event\\\";O:29:\\\"App\\\\Events\\\\OrderStatusUpdated\\\":1:{s:5:\\\"order\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:16:\\\"App\\\\Models\\\\Order\\\";s:2:\\\"id\\\";i:95;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\"},\"createdAt\":1750175607,\"delay\":null}', 0, NULL, 1750175607, 1750175607);

-- ----------------------------
-- Table structure for migrations
-- ----------------------------
DROP TABLE IF EXISTS `migrations`;
CREATE TABLE `migrations`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 148 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of migrations
-- ----------------------------
INSERT INTO `migrations` VALUES (1, '0001_01_01_000001_create_cache_table', 1);
INSERT INTO `migrations` VALUES (2, '0001_01_01_000002_create_jobs_table', 1);
INSERT INTO `migrations` VALUES (3, '2024_03_19_000000_create_sessions_table', 1);
INSERT INTO `migrations` VALUES (4, '2025_05_07_041051_create_roles_table', 1);
INSERT INTO `migrations` VALUES (5, '2025_05_07_041052_create_permissions_table', 1);
INSERT INTO `migrations` VALUES (6, '2025_05_07_041052_create_role_permissions_table', 1);
INSERT INTO `migrations` VALUES (7, '2025_05_07_041052_create_users_table', 1);
INSERT INTO `migrations` VALUES (8, '2025_05_07_041053_create_categories_table', 1);
INSERT INTO `migrations` VALUES (9, '2025_05_07_041053_create_products_table', 1);
INSERT INTO `migrations` VALUES (10, '2025_05_07_041054_create_product_images_table', 1);
INSERT INTO `migrations` VALUES (11, '2025_05_07_041054_create_product_reviews_table', 1);
INSERT INTO `migrations` VALUES (12, '2025_05_07_041054_create_product_variants_table', 1);
INSERT INTO `migrations` VALUES (13, '2025_05_07_041054_create_shipping_methods_table', 1);
INSERT INTO `migrations` VALUES (14, '2025_05_07_041055_create_carts_table', 1);
INSERT INTO `migrations` VALUES (15, '2025_05_07_041055_create_orders_table', 1);
INSERT INTO `migrations` VALUES (16, '2025_05_07_041056_create_cart_items_table', 1);
INSERT INTO `migrations` VALUES (17, '2025_05_07_041056_create_order_items_table', 1);
INSERT INTO `migrations` VALUES (18, '2025_05_07_041056_create_user_addresses_table', 1);
INSERT INTO `migrations` VALUES (19, '2025_05_07_041056_create_wishlists_table', 1);
INSERT INTO `migrations` VALUES (20, '2025_05_07_070922_create_banners_table', 1);
INSERT INTO `migrations` VALUES (21, '2025_05_07_071913_create_blogs_table', 1);
INSERT INTO `migrations` VALUES (22, '2025_05_08_144146_update_is_featured_default_in_products_table', 2);
INSERT INTO `migrations` VALUES (23, '2025_05_08_144605_add_order_to_banners_table', 3);
INSERT INTO `migrations` VALUES (24, '2025_05_08_155856_add_link_to_banners_table', 4);
INSERT INTO `migrations` VALUES (25, '2025_05_09_011124_remove_ram_from_product_variants', 5);
INSERT INTO `migrations` VALUES (26, '2025_05_09_011416_rename_is_active_to_status_in_product_variants', 6);
INSERT INTO `migrations` VALUES (27, '2025_05_09_013701_create_capacities_table', 7);
INSERT INTO `migrations` VALUES (28, '2025_05_09_013701_create_colors_table', 7);
INSERT INTO `migrations` VALUES (29, '2025_05_09_014708_update_product_variants_capacity_color', 8);
INSERT INTO `migrations` VALUES (30, '2024_03_19_add_soft_deletes_to_colors_and_capacities', 9);
INSERT INTO `migrations` VALUES (31, '2025_05_09_074001_modify_products_table', 10);
INSERT INTO `migrations` VALUES (32, '2025_05_09_074114_modify_product_variants_table', 10);
INSERT INTO `migrations` VALUES (33, '2025_05_09_074131_create_variant_attributes_table', 10);
INSERT INTO `migrations` VALUES (34, '2025_05_09_074147_create_product_attributes_table', 10);
INSERT INTO `migrations` VALUES (35, '2025_05_09_080245_remove_price_from_products_table', 11);
INSERT INTO `migrations` VALUES (36, '2025_05_09_081137_drop_price_from_product_variants_table', 12);
INSERT INTO `migrations` VALUES (37, '2025_05_09_092032_rename_image_url_to_image_in_product_variants_table', 13);
INSERT INTO `migrations` VALUES (38, '2025_05_09_101144_remove_stock_from_products_table', 14);
INSERT INTO `migrations` VALUES (39, '2025_05_10_015532_remove_default_variant_id_from_products_table', 15);
INSERT INTO `migrations` VALUES (41, '2025_05_10_022326_add_stock_to_products_table', 16);
INSERT INTO `migrations` VALUES (42, '2025_05_12_084953_update_product_tables_structure', 17);
INSERT INTO `migrations` VALUES (43, '2025_05_12_153708_add_guard_name_to_roles_and_permissions_tables', 18);
INSERT INTO `migrations` VALUES (44, '2025_05_12_154142_add_timestamps_to_roles_and_permissions_tables', 19);
INSERT INTO `migrations` VALUES (45, '2025_05_12_165433_update_role_to_role_id_in_users_table', 20);
INSERT INTO `migrations` VALUES (46, '2025_05_13_023750_create_permission_tables', 21);
INSERT INTO `migrations` VALUES (47, '2025_05_13_072913_remove_image_discount_price_purchase_price_selling_price_from_products', 22);
INSERT INTO `migrations` VALUES (48, '2025_05_13_143459_drop_roles_and_permissions_tables', 23);
INSERT INTO `migrations` VALUES (49, '2025_05_13_153400_create_role_has_permissions_table', 24);
INSERT INTO `migrations` VALUES (50, '2025_05_13_154223_add_description_to_permissions_table', 25);
INSERT INTO `migrations` VALUES (51, '2025_05_13_140900_add_hex_to_variant_attributes', 26);
INSERT INTO `migrations` VALUES (52, '2025_05_13_160610_modify_variant_attributes_columns_to_json', 27);
INSERT INTO `migrations` VALUES (53, '2025_05_13_160000_recreate_permission_tables', 28);
INSERT INTO `migrations` VALUES (54, '2025_05_14_105029_add_is_default_to_product_variants_table', 29);
INSERT INTO `migrations` VALUES (56, '2025_05_14_130636_add_hex_to_variant_attributes', 30);
INSERT INTO `migrations` VALUES (57, '2025_05_14_135435_drop_spatie_permission_tables', 31);
INSERT INTO `migrations` VALUES (58, '2025_05_14_140736_drop_spatie_permission_tables', 32);
INSERT INTO `migrations` VALUES (59, '2025_05_14_141637_drop_spatie_permission_tables', 33);
INSERT INTO `migrations` VALUES (60, '2025_05_14_135939_create_spatie_permission_core_tables', 34);
INSERT INTO `migrations` VALUES (61, '2025_05_14_141755_add_description_to_banners_table', 35);
INSERT INTO `migrations` VALUES (62, '2025_05_14_145009_create_model_has_permissions_table', 36);
INSERT INTO `migrations` VALUES (63, '2025_05_14_145531_create_model_has_roles_table', 37);
INSERT INTO `migrations` VALUES (64, '2025_05_15_090400_add_sku_to_product_attributes_table', 38);
INSERT INTO `migrations` VALUES (65, '2025_05_15_023932_optimize_variant_tables', 39);
INSERT INTO `migrations` VALUES (66, '2025_05_15_072252_remove_role_id_from_users_table', 40);
INSERT INTO `migrations` VALUES (67, '2025_05_15_072903_create_permission_tables', 41);
INSERT INTO `migrations` VALUES (68, '2025_05_15_073818_add_description_to_permissions_table', 42);
INSERT INTO `migrations` VALUES (69, '2025_05_15_081055_add_role_id_to_users_table', 43);
INSERT INTO `migrations` VALUES (70, '2025_05_15_111743_remove_role_id_from_users_table', 44);
INSERT INTO `migrations` VALUES (71, '2025_05_15_094547_create_permission_tables', 45);
INSERT INTO `migrations` VALUES (72, '2025_05_15_124011_create_permission_tables', 46);
INSERT INTO `migrations` VALUES (73, '2024_03_21_000000_remove_unused_fields', 47);
INSERT INTO `migrations` VALUES (74, '2025_05_17_082859_update_product_variants_table', 48);
INSERT INTO `migrations` VALUES (75, '2025_05_17_082859_update_products_table', 48);
INSERT INTO `migrations` VALUES (76, '2025_05_17_082900_update_variant_attribute_types_table', 49);
INSERT INTO `migrations` VALUES (77, '2025_05_17_082900_update_variant_attribute_values_table', 49);
INSERT INTO `migrations` VALUES (78, '2025_05_17_082901_update_variant_combinations_table', 50);
INSERT INTO `migrations` VALUES (79, '2024_03_21_000000_remove_sort_order_from_variant_attribute_types', 51);
INSERT INTO `migrations` VALUES (80, '2024_03_21_000001_remove_sort_order_from_variant_attribute_values', 51);
INSERT INTO `migrations` VALUES (81, '2025_05_17_083832_remove_sort_order_from_variant_attribute_types', 51);
INSERT INTO `migrations` VALUES (82, '2025_05_17_083841_remove_sort_order_from_variant_attribute_values', 51);
INSERT INTO `migrations` VALUES (83, '2025_05_17_083935_create_stock_movements_table', 52);
INSERT INTO `migrations` VALUES (84, '2025_05_17_083947_create_stock_adjustments_table', 52);
INSERT INTO `migrations` VALUES (85, '2025_05_17_084000_add_category_id_to_variant_attribute_types', 53);
INSERT INTO `migrations` VALUES (86, '2025_05_17_084204_add_category_id_to_variant_attribute_types', 53);
INSERT INTO `migrations` VALUES (87, '2025_05_17_085439_update_variant_attribute_types_table_add_category_ids_json', 53);
INSERT INTO `migrations` VALUES (88, '2025_05_17_085837_change_category_id_to_category_ids_in_variant_attribute_types', 53);
INSERT INTO `migrations` VALUES (91, '2025_05_17_090318_remove_code_from_variant_attribute_types', 54);
INSERT INTO `migrations` VALUES (92, '2025_05_18_000002_create_specifications_tables', 55);
INSERT INTO `migrations` VALUES (93, '2025_05_18_000003_drop_old_tables', 56);
INSERT INTO `migrations` VALUES (94, '2025_05_18_000004_create_product_specifications_table', 57);
INSERT INTO `migrations` VALUES (95, '2025_05_18_000005_recreate_product_specifications_table', 58);
INSERT INTO `migrations` VALUES (96, '2025_05_18_000006_update_specifications_table', 59);
INSERT INTO `migrations` VALUES (97, '2025_05_19_135058_create_contacts_table', 60);
INSERT INTO `migrations` VALUES (110, '2025_05_15_134055_create_vouchers_table', 61);
INSERT INTO `migrations` VALUES (111, '2025_05_15_134109_create_user_vouchers_table', 61);
INSERT INTO `migrations` VALUES (112, '2025_05_22_060948_add_cancel_reason_to_orders_table', 62);
INSERT INTO `migrations` VALUES (113, '2024_05_22_000001_update_variant_attribute_values_to_json', 63);
INSERT INTO `migrations` VALUES (114, '2025_05_19_164129_create_contacts_table', 64);
INSERT INTO `migrations` VALUES (115, '2025_05_20_080544_add_deleted_at_to_contacts_table', 64);
INSERT INTO `migrations` VALUES (116, '2025_05_21_124829_create_subscribers_table', 64);
INSERT INTO `migrations` VALUES (117, '2025_05_25_013802_add_views_to_products_table', 65);
INSERT INTO `migrations` VALUES (118, '2025_05_26_012029_add_name_to_subscribers_table', 66);
INSERT INTO `migrations` VALUES (119, '2025_05_26_031323_add_deleted_at_to_subscribers_table', 66);
INSERT INTO `migrations` VALUES (120, '2025_05_26_110805_create_faqs_table', 66);
INSERT INTO `migrations` VALUES (125, '2025_05_28_101618_create_flash_sales_table', 67);
INSERT INTO `migrations` VALUES (126, '2025_05_28_101621_create_flash_sale_items_table', 67);
INSERT INTO `migrations` VALUES (127, '2024_03_20_create_order_details_table', 68);
INSERT INTO `migrations` VALUES (128, '2025_05_28_143546_update_payment_method_enum_in_orders_table', 69);
INSERT INTO `migrations` VALUES (129, '2025_05_29_202039_add_provider_columns_to_users_table', 70);
INSERT INTO `migrations` VALUES (130, '2024_03_20_add_deleted_at_to_product_reviews', 71);
INSERT INTO `migrations` VALUES (131, '2025_05_30_212052_add_image_to_categories_table', 72);
INSERT INTO `migrations` VALUES (132, '2025_06_02_162806_create_password_reset_tokens_table', 73);
INSERT INTO `migrations` VALUES (133, '2024_01_01_000001_create_invoices_table', 74);
INSERT INTO `migrations` VALUES (134, '2024_03_15_000000_create_resend_invoice_requests_table', 75);
INSERT INTO `migrations` VALUES (135, '2024_06_01_000001_create_order_returns_table', 76);
INSERT INTO `migrations` VALUES (136, '2024_06_01_000002_create_order_return_items_table', 77);
INSERT INTO `migrations` VALUES (137, '2024_06_01_000003_add_refunded_amount_to_orders_table', 78);
INSERT INTO `migrations` VALUES (138, '2024_06_01_000004_add_restock_to_order_return_items_table', 79);
INSERT INTO `migrations` VALUES (139, '2024_06_01_000005_add_status_to_order_items_table', 80);
INSERT INTO `migrations` VALUES (140, '2025_06_13_145145_add_deleted_at_to_variant_combinations_table', 81);
INSERT INTO `migrations` VALUES (141, '2025_06_14_124028_create_search_histories_table', 82);
INSERT INTO `migrations` VALUES (142, '2025_06_14_124031_create_product_views_table', 82);
INSERT INTO `migrations` VALUES (145, '2025_06_18_204617_add_timestamps_to_sessions_table', 83);
INSERT INTO `migrations` VALUES (146, '2025_06_18_212622_create_page_views_table', 84);
INSERT INTO `migrations` VALUES (147, '2025_06_18_213851_add_user_id_to_page_views_table', 85);

-- ----------------------------
-- Table structure for model_has_permissions
-- ----------------------------
DROP TABLE IF EXISTS `model_has_permissions`;
CREATE TABLE `model_has_permissions`  (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL,
  PRIMARY KEY (`permission_id`, `model_id`, `model_type`) USING BTREE,
  INDEX `model_has_permissions_model_id_model_type_index`(`model_id`, `model_type`) USING BTREE,
  CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of model_has_permissions
-- ----------------------------

-- ----------------------------
-- Table structure for model_has_roles
-- ----------------------------
DROP TABLE IF EXISTS `model_has_roles`;
CREATE TABLE `model_has_roles`  (
  `role_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'App\\Models\\User',
  `model_id` bigint(20) UNSIGNED NOT NULL,
  PRIMARY KEY (`role_id`, `model_id`, `model_type`) USING BTREE,
  INDEX `model_has_roles_model_id_model_type_index`(`model_id`, `model_type`) USING BTREE,
  CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of model_has_roles
-- ----------------------------
INSERT INTO `model_has_roles` VALUES (1, 'App\\Models\\User', 1);
INSERT INTO `model_has_roles` VALUES (2, 'App\\Models\\User', 1);
INSERT INTO `model_has_roles` VALUES (2, 'App\\Models\\User', 2);
INSERT INTO `model_has_roles` VALUES (2, 'App\\Models\\User', 19);
INSERT INTO `model_has_roles` VALUES (3, 'App\\Models\\User', 22);
INSERT INTO `model_has_roles` VALUES (3, 'App\\Models\\User', 32);
INSERT INTO `model_has_roles` VALUES (3, 'App\\Models\\User', 38);
INSERT INTO `model_has_roles` VALUES (3, 'App\\Models\\User', 40);
INSERT INTO `model_has_roles` VALUES (3, 'App\\Models\\User', 41);
INSERT INTO `model_has_roles` VALUES (3, 'App\\Models\\User', 42);
INSERT INTO `model_has_roles` VALUES (3, 'App\\Models\\User', 44);
INSERT INTO `model_has_roles` VALUES (3, 'App\\Models\\User', 50);
INSERT INTO `model_has_roles` VALUES (3, 'App\\Models\\User', 51);
INSERT INTO `model_has_roles` VALUES (3, 'App\\Models\\User', 52);
INSERT INTO `model_has_roles` VALUES (3, 'App\\Models\\User', 53);
INSERT INTO `model_has_roles` VALUES (3, 'App\\Models\\User', 54);
INSERT INTO `model_has_roles` VALUES (3, 'App\\Models\\User', 55);
INSERT INTO `model_has_roles` VALUES (3, 'App\\Models\\User', 56);
INSERT INTO `model_has_roles` VALUES (3, 'App\\Models\\User', 57);
INSERT INTO `model_has_roles` VALUES (3, 'App\\Models\\User', 58);
INSERT INTO `model_has_roles` VALUES (3, 'App\\Models\\User', 59);
INSERT INTO `model_has_roles` VALUES (3, 'App\\Models\\User', 60);
INSERT INTO `model_has_roles` VALUES (3, 'App\\Models\\User', 61);
INSERT INTO `model_has_roles` VALUES (3, 'App\\Models\\User', 62);
INSERT INTO `model_has_roles` VALUES (3, 'App\\Models\\User', 63);
INSERT INTO `model_has_roles` VALUES (3, 'App\\Models\\User', 64);
INSERT INTO `model_has_roles` VALUES (3, 'App\\Models\\User', 65);
INSERT INTO `model_has_roles` VALUES (3, 'App\\Models\\User', 66);
INSERT INTO `model_has_roles` VALUES (3, 'App\\Models\\User', 67);
INSERT INTO `model_has_roles` VALUES (3, 'App\\Models\\User', 68);
INSERT INTO `model_has_roles` VALUES (3, 'App\\Models\\User', 69);
INSERT INTO `model_has_roles` VALUES (3, 'App\\Models\\User', 70);
INSERT INTO `model_has_roles` VALUES (3, 'App\\Models\\User', 71);
INSERT INTO `model_has_roles` VALUES (3, 'App\\Models\\User', 73);
INSERT INTO `model_has_roles` VALUES (3, 'App\\Models\\User', 74);
INSERT INTO `model_has_roles` VALUES (3, 'App\\Models\\User', 75);
INSERT INTO `model_has_roles` VALUES (3, 'App\\Models\\User', 76);
INSERT INTO `model_has_roles` VALUES (3, 'App\\Models\\User', 77);

-- ----------------------------
-- Table structure for order_details
-- ----------------------------
DROP TABLE IF EXISTS `order_details`;
CREATE TABLE `order_details`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `variant_id` bigint(20) UNSIGNED NOT NULL,
  `quantity` int(11) NOT NULL,
  `price` decimal(12, 2) NOT NULL,
  `total` decimal(12, 2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `order_details_order_id_foreign`(`order_id`) USING BTREE,
  INDEX `order_details_variant_id_foreign`(`variant_id`) USING BTREE,
  CONSTRAINT `order_details_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `order_details_variant_id_foreign` FOREIGN KEY (`variant_id`) REFERENCES `product_variants` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of order_details
-- ----------------------------

-- ----------------------------
-- Table structure for order_items
-- ----------------------------
DROP TABLE IF EXISTS `order_items`;
CREATE TABLE `order_items`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `product_variant_id` bigint(20) UNSIGNED NOT NULL,
  `quantity` int(11) NOT NULL,
  `price` decimal(15, 2) NOT NULL,
  `total` decimal(15, 2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `order_items_order_id_foreign`(`order_id`) USING BTREE,
  INDEX `order_items_product_id_foreign`(`product_id`) USING BTREE,
  INDEX `order_items_product_variant_id_foreign`(`product_variant_id`) USING BTREE,
  CONSTRAINT `order_items_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `order_items_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `order_items_product_variant_id_foreign` FOREIGN KEY (`product_variant_id`) REFERENCES `product_variants` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 100 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of order_items
-- ----------------------------
INSERT INTO `order_items` VALUES (98, 95, 152, 239, 1, 555.00, 555.00, '2025-06-17 22:45:55', '2025-06-17 22:45:55', NULL);
INSERT INTO `order_items` VALUES (99, 96, 152, 239, 1, 55125.00, 55125.00, '2025-06-18 15:25:23', '2025-06-18 15:25:23', NULL);

-- ----------------------------
-- Table structure for order_return_items
-- ----------------------------
DROP TABLE IF EXISTS `order_return_items`;
CREATE TABLE `order_return_items`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `order_return_id` bigint(20) UNSIGNED NOT NULL,
  `order_item_id` bigint(20) UNSIGNED NOT NULL,
  `quantity` int(11) NOT NULL,
  `restock` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `order_return_items_order_return_id_foreign`(`order_return_id`) USING BTREE,
  INDEX `order_return_items_order_item_id_foreign`(`order_item_id`) USING BTREE,
  CONSTRAINT `order_return_items_order_item_id_foreign` FOREIGN KEY (`order_item_id`) REFERENCES `order_items` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `order_return_items_order_return_id_foreign` FOREIGN KEY (`order_return_id`) REFERENCES `order_returns` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of order_return_items
-- ----------------------------

-- ----------------------------
-- Table structure for order_returns
-- ----------------------------
DROP TABLE IF EXISTS `order_returns`;
CREATE TABLE `order_returns`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `status` enum('pending','approved','rejected','refunded') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `reason` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `image` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `admin_id` bigint(20) UNSIGNED NULL DEFAULT NULL,
  `processed_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `order_returns_order_id_foreign`(`order_id`) USING BTREE,
  INDEX `order_returns_user_id_foreign`(`user_id`) USING BTREE,
  CONSTRAINT `order_returns_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `order_returns_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of order_returns
-- ----------------------------
INSERT INTO `order_returns` VALUES (1, 8, 42, 'approved', 't thấy m chưa vào mắt t', 'uploads/returns/1749927581_cod1.png', 1, '2025-06-15 02:01:21', '2025-06-15 01:59:41', '2025-06-15 02:01:21');
INSERT INTO `order_returns` VALUES (2, 7, 42, 'pending', '11111111111111111111111111111', 'uploads/returns/1749929393_cod2.png', NULL, NULL, '2025-06-15 02:29:53', '2025-06-15 02:29:53');
INSERT INTO `order_returns` VALUES (3, 14, 42, 'rejected', 'tôi thấy bị lỗi sản phẩm', 'uploads/returns/1749949017_cod2.png', 1, '2025-06-15 08:00:31', '2025-06-15 07:56:57', '2025-06-15 08:00:31');
INSERT INTO `order_returns` VALUES (4, 27, 42, 'pending', 'LOOIX SARN PHAARM', 'uploads/returns/1749966847_ip3.jpg', NULL, NULL, '2025-06-15 12:54:07', '2025-06-15 12:54:07');

-- ----------------------------
-- Table structure for orders
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `order_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED NULL DEFAULT NULL,
  `subtotal` decimal(15, 2) NULL DEFAULT NULL,
  `discount` decimal(15, 2) NOT NULL DEFAULT 0.00,
  `shipping_fee` decimal(15, 2) NULL DEFAULT NULL,
  `total_price` decimal(15, 2) NULL DEFAULT NULL,
  `refunded_amount` decimal(15, 2) NOT NULL DEFAULT 0.00,
  `shipping_address` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `shipping_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `shipping_phone` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `shipping_email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `payment_method` enum('cod','bank_transfer','credit_card','vnpay','qr') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'cod',
  `payment_status` enum('pending','paid','failed','refunded') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `shipping_method_id` bigint(20) UNSIGNED NULL DEFAULT NULL,
  `status` enum('pending','confirmed','preparing','shipping','completed','cancelled','returned','partially_returned') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT 'pending',
  `is_paid` tinyint(1) NOT NULL DEFAULT 0,
  `notes` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `cancel_reason` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `orders_user_id_foreign`(`user_id`) USING BTREE,
  INDEX `orders_shipping_method_id_foreign`(`shipping_method_id`) USING BTREE,
  CONSTRAINT `orders_shipping_method_id_foreign` FOREIGN KEY (`shipping_method_id`) REFERENCES `shipping_methods` (`id`) ON DELETE SET NULL ON UPDATE RESTRICT,
  CONSTRAINT `orders_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 97 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of orders
-- ----------------------------
INSERT INTO `orders` VALUES (1, 'ORD202506158062', NULL, 444.00, 0.00, 0.00, 444.00, 0.00, 'Vọng Giang', 'đại ', '0968791306', 'daicvph50503@gmail.com', 'vnpay', 'pending', NULL, 'pending', 0, NULL, NULL, '2025-06-15 00:34:57', '2025-06-15 00:34:57', NULL);
INSERT INTO `orders` VALUES (2, 'DH2', NULL, 444.00, 0.00, 0.00, 444.00, 0.00, 'Vọng Giang', 'đại', '0968791306', 'daicvph50503@gmail.com', 'cod', 'pending', NULL, 'pending', 0, NULL, NULL, '2025-06-15 00:35:21', '2025-06-15 00:35:21', NULL);
INSERT INTO `orders` VALUES (3, 'ORD202506155415', NULL, 55444.00, 0.00, 0.00, 55444.00, 0.00, 'Nam từ liêm hà nội', 'đại học coder ', '0123456789', 'daicvph50503@gmail.com', 'vnpay', 'paid', NULL, 'confirmed', 1, NULL, NULL, '2025-06-15 00:39:53', '2025-06-15 00:40:46', NULL);
INSERT INTO `orders` VALUES (4, 'ORD202506151598', NULL, 55444.00, 0.00, 0.00, 55444.00, 0.00, 'Vọng Giang', 'đại học coder ', '09876432', 'daichuvan05@gmail.com', 'vnpay', 'paid', NULL, 'confirmed', 1, 'test', NULL, '2025-06-15 01:01:41', '2025-06-15 01:02:12', NULL);
INSERT INTO `orders` VALUES (5, 'DH5', NULL, 55444.00, 0.00, 0.00, 55444.00, 0.00, 'Hanoi', 'đại học coder', '0968791308', 'daicvph50503@gmail.com', 'cod', 'pending', NULL, 'pending', 0, NULL, NULL, '2025-06-15 01:03:51', '2025-06-15 01:03:51', NULL);
INSERT INTO `orders` VALUES (6, 'ORD202506157193', NULL, 55444.00, 0.00, 0.00, 55444.00, 0.00, 'Vọng Giang', 'đại ', '0968791306', 'liyaf70931@finfave.com', 'vnpay', 'paid', NULL, 'confirmed', 1, NULL, NULL, '2025-06-15 01:06:27', '2025-06-15 01:07:07', NULL);
INSERT INTO `orders` VALUES (7, 'ORD202506155013', 42, 55444.00, 0.00, 0.00, 55444.00, 0.00, 'Vọng Giang', 'đại học coder', '0968791308', 'daichuvan05@gmail.com', 'cod', 'pending', NULL, 'completed', 0, NULL, 'tôi cần thay đổi phương thức thanh toán', '2025-06-15 01:19:31', '2025-06-15 02:27:59', NULL);
INSERT INTO `orders` VALUES (8, 'ORD202506159614', 42, 110888.00, 0.00, 0.00, 55444.00, 55444.00, 'Vọng Giang', 'đại học coder', '0968791308', 'daichuvan05@gmail.com', 'vnpay', 'paid', NULL, 'shipping', 1, NULL, NULL, '2025-06-15 01:23:09', '2025-06-15 03:38:28', NULL);
INSERT INTO `orders` VALUES (9, 'ORD202506156707', NULL, 3333.00, 0.00, 0.00, 3333.00, 0.00, 'Vọng Giang', 'đại học coder ', '0368706552', 'yineh95741@finfave.com', 'vnpay', 'pending', NULL, 'pending', 0, NULL, NULL, '2025-06-15 06:51:56', '2025-06-15 06:51:56', NULL);
INSERT INTO `orders` VALUES (10, 'ORD202506159114', NULL, 34333.00, 0.00, 0.00, 34333.00, 0.00, 'Vọng Giang', 'đại học coder ', '0968791308', 'yineh95741@finfave.com', 'vnpay', 'paid', NULL, 'preparing', 1, NULL, NULL, '2024-06-15 06:54:05', '2024-06-15 07:03:18', NULL);
INSERT INTO `orders` VALUES (11, 'DH11', NULL, 34333.00, 0.00, 0.00, 34333.00, 0.00, 'Vọng Giang', 'đại học coder', '0123456789', 'daicvph50503@gmail.com', 'cod', 'pending', NULL, 'pending', 0, NULL, NULL, '2025-06-15 07:05:10', '2025-06-15 07:05:10', NULL);
INSERT INTO `orders` VALUES (12, 'ORD202506157532', NULL, 34333.00, 0.00, 0.00, 34333.00, 0.00, 'Hanoi', 'aaaa ', '0968791308', 'daichuvan05@gmail.com', 'vnpay', 'paid', NULL, 'confirmed', 1, NULL, NULL, '2025-06-15 07:09:32', '2025-06-15 07:10:29', NULL);
INSERT INTO `orders` VALUES (13, 'DH13', 42, 34333.00, 0.00, 0.00, 34333.00, 0.00, 'Vọng Giang', 'đại học coder', '0968791308', 'daichuvan05@gmail.com', 'cod', 'pending', NULL, 'confirmed', 0, NULL, NULL, '2025-06-15 07:16:17', '2025-06-15 07:47:37', NULL);
INSERT INTO `orders` VALUES (14, 'ORD202506159430', 42, 34333.00, 0.00, 0.00, 34333.00, 0.00, 'Vọng Giang', 'đại học coder ', '0968791308', 'daichuvan05@gmail.com', 'vnpay', 'pending', NULL, 'completed', 0, NULL, NULL, '2025-06-15 07:48:09', '2025-06-15 07:53:48', NULL);
INSERT INTO `orders` VALUES (15, 'DH15', 42, 34333.00, 0.00, 0.00, 34333.00, 0.00, 'Vọng Giang', 'đại học coder', '0968791308', 'daichuvan05@gmail.com', 'cod', 'pending', NULL, 'confirmed', 0, NULL, NULL, '2025-06-15 07:50:13', '2025-06-15 08:07:23', NULL);
INSERT INTO `orders` VALUES (16, 'DH16', 42, 34333.00, 0.00, 0.00, 34333.00, 0.00, 'Vọng Giang', 'đại học coder', '0968791308', 'daichuvan05@gmail.com', 'cod', 'pending', NULL, 'pending', 0, NULL, NULL, '2025-06-15 08:24:22', '2025-06-15 08:24:22', NULL);
INSERT INTO `orders` VALUES (17, 'DH17', 42, 34333.00, 0.00, 0.00, 34333.00, 0.00, 'Vọng Giang', 'đại học coder', '0968791308', 'daichuvan05@gmail.com', 'vnpay', 'pending', NULL, 'pending', 0, NULL, NULL, '2025-06-15 08:28:20', '2025-06-15 08:28:20', NULL);
INSERT INTO `orders` VALUES (18, 'DH18', 42, 34333.00, 0.00, 0.00, 34333.00, 0.00, 'Vọng Giang', 'đại học coder 55', '0968791308', 'daichuvan05@gmail.com', 'cod', 'pending', NULL, 'pending', 0, NULL, NULL, '2025-06-15 08:48:24', '2025-06-15 08:48:24', NULL);
INSERT INTO `orders` VALUES (19, 'DH19', 42, 34333.00, 0.00, 0.00, 34333.00, 0.00, 'Vọng Giang', 'đại học coder', '0968791308', 'daichuvan05@gmail.com', 'vnpay', 'pending', NULL, 'pending', 0, NULL, NULL, '2025-06-15 08:52:02', '2025-06-15 08:52:02', NULL);
INSERT INTO `orders` VALUES (20, 'ORD202506157827', 42, 34333.00, 0.00, 0.00, 34333.00, 0.00, 'Vọng Giang', 'đại học coder ', '0968791308', 'daichuvan05@gmail.com', 'vnpay', 'paid', NULL, 'confirmed', 1, NULL, NULL, '2025-06-15 08:57:41', '2025-06-15 08:58:41', NULL);
INSERT INTO `orders` VALUES (21, 'DH21', 42, 34333.00, 0.00, 0.00, 34333.00, 0.00, 'Vọng Giang', 'đại học coder', '0968791308', 'daichuvan05@gmail.com', 'cod', 'pending', NULL, 'pending', 0, NULL, NULL, '2025-06-15 09:02:30', '2025-06-15 09:02:30', NULL);
INSERT INTO `orders` VALUES (22, 'DH22', 42, 34333.00, 0.00, 0.00, 34333.00, 0.00, 'Vọng Giang', 'đại học coder', '0968791308', 'daichuvan05@gmail.com', 'cod', 'pending', NULL, 'cancelled', 0, NULL, 'tôi cần thay đổi phương thức thanh toán', '2025-06-15 11:46:07', '2025-06-15 11:54:25', NULL);
INSERT INTO `orders` VALUES (23, 'ORD202506151178', 42, 34333.00, 0.00, 0.00, 34333.00, 0.00, 'Vọng Giang', 'đại học coder ', '0968791308', 'daichuvan05@gmail.com', 'vnpay', 'paid', NULL, 'completed', 1, NULL, NULL, '2025-06-15 11:47:14', '2025-06-15 11:53:15', NULL);
INSERT INTO `orders` VALUES (24, 'DH24', 42, 68666.00, 0.00, 0.00, 68666.00, 0.00, 'Vọng Giang', 'đại học coder', '0968791308', 'daichuvan05@gmail.com', 'cod', 'pending', NULL, 'cancelled', 0, NULL, 'tôi cần thay đổi phương thức thanh toán', '2025-06-15 11:58:53', '2025-06-15 12:03:06', NULL);
INSERT INTO `orders` VALUES (25, 'ORD202506154093', 42, 34333.00, 0.00, 0.00, 34333.00, 0.00, 'Vọng Giang', 'đại học coder ', '0968791308', 'daichuvan05@gmail.com', 'vnpay', 'paid', NULL, 'preparing', 1, NULL, NULL, '2025-06-15 11:59:30', '2025-06-15 12:00:56', NULL);
INSERT INTO `orders` VALUES (26, 'ORD202506154831', 42, 799999.00, 0.00, 0.00, 799999.00, 0.00, 'Vọng Giang', 'đại học coder ', '0968791308', 'daichuvan05@gmail.com', 'vnpay', 'paid', NULL, 'confirmed', 1, NULL, NULL, '2025-06-15 12:51:34', '2025-06-15 12:52:19', NULL);
INSERT INTO `orders` VALUES (27, 'DH27', 42, 13799998.00, 0.00, 0.00, 13799998.00, 0.00, 'Vọng Giang', 'đại học coder', '0968791308', 'daichuvan05@gmail.com', 'cod', 'pending', NULL, 'completed', 0, NULL, NULL, '2025-06-15 12:52:42', '2025-06-15 12:52:43', NULL);
INSERT INTO `orders` VALUES (28, 'DH28', 42, 12999999.00, 0.00, 0.00, 12999999.00, 0.00, 'Vọng Giang', 'đại học coder', '0968791308', 'daichuvan05@gmail.com', 'vnpay', 'pending', NULL, 'pending', 0, NULL, NULL, '2025-06-15 20:22:20', '2025-06-15 20:22:20', NULL);
INSERT INTO `orders` VALUES (29, 'DH29', 42, 12999999.00, 0.00, 0.00, 12999999.00, 0.00, 'Vọng Giang', 'đại học coder', '0968791308', 'daichuvan05@gmail.com', 'cod', 'pending', NULL, 'pending', 0, NULL, NULL, '2025-06-15 20:26:57', '2025-06-15 20:26:57', NULL);
INSERT INTO `orders` VALUES (30, 'DH30', 42, 12999999.00, 0.00, 0.00, 12999999.00, 0.00, 'Vọng Giang', 'đại học coder', '0968791308', 'daichuvan05@gmail.com', 'vnpay', 'pending', NULL, 'pending', 0, NULL, NULL, '2025-06-15 20:27:41', '2025-06-15 20:27:41', NULL);
INSERT INTO `orders` VALUES (31, 'DH31', 42, 38999997.00, 0.00, 0.00, 38999997.00, 0.00, 'Vọng Giang', 'đại học coder', '0968791308', 'daichuvan05@gmail.com', 'vnpay', 'pending', NULL, 'pending', 0, NULL, NULL, '2025-06-15 20:33:24', '2025-06-15 20:33:24', NULL);
INSERT INTO `orders` VALUES (32, 'DH32', 42, 12999999.00, 0.00, 0.00, 12999999.00, 0.00, 'Vọng Giang', 'đại học coder', '0968791308', 'daichuvan05@gmail.com', 'vnpay', 'pending', NULL, 'pending', 0, NULL, NULL, '2025-06-15 20:47:11', '2025-06-15 20:47:11', NULL);
INSERT INTO `orders` VALUES (33, 'DH33', 42, 12999999.00, 0.00, 0.00, 12999999.00, 0.00, 'Vọng Giang', 'đại học coder', '0968791308', 'daichuvan05@gmail.com', 'vnpay', 'pending', NULL, 'pending', 0, NULL, NULL, '2025-06-15 20:47:52', '2025-06-15 20:47:52', NULL);
INSERT INTO `orders` VALUES (34, 'ORD202506154767', 42, 12999999.00, 0.00, 0.00, 12999999.00, 0.00, 'Vọng Giang', 'đại học coder ', '0968791308', 'daichuvan05@gmail.com', 'vnpay', 'pending', NULL, 'pending', 0, NULL, NULL, '2025-06-15 20:48:36', '2025-06-15 20:48:36', NULL);
INSERT INTO `orders` VALUES (35, 'DH35', 42, 12999999.00, 0.00, 0.00, 12999999.00, 0.00, 'Vọng Giang', 'đại học coder', '0968791308', 'daichuvan05@gmail.com', 'vnpay', 'pending', NULL, 'pending', 0, NULL, NULL, '2025-06-15 20:54:06', '2025-06-15 20:54:06', NULL);
INSERT INTO `orders` VALUES (36, 'DH36', 42, 12999999.00, 0.00, 0.00, 12999999.00, 0.00, 'Vọng Giang', 'đại học coder', '0968791308', 'daichuvan05@gmail.com', 'vnpay', 'pending', NULL, 'pending', 0, NULL, NULL, '2025-06-15 20:55:34', '2025-06-15 20:55:34', NULL);
INSERT INTO `orders` VALUES (37, 'DH37', 42, 12999999.00, 0.00, 0.00, 12999999.00, 0.00, 'Vọng Giang', 'đại học coder', '0968791308', 'daichuvan05@gmail.com', 'vnpay', 'pending', NULL, 'pending', 0, NULL, NULL, '2025-06-15 20:57:28', '2025-06-15 20:57:28', NULL);
INSERT INTO `orders` VALUES (38, 'DH38', 42, 799999.00, 0.00, 0.00, 799999.00, 0.00, 'Vọng Giang', 'đại học coder', '0968791308', 'daichuvan05@gmail.com', 'vnpay', 'pending', NULL, 'pending', 0, NULL, NULL, '2025-06-15 20:59:25', '2025-06-15 20:59:25', NULL);
INSERT INTO `orders` VALUES (39, 'DH39', 42, 34333.00, 0.00, 0.00, 34333.00, 0.00, 'Vọng Giang', 'đại học coder', '0968791308', 'daichuvan05@gmail.com', 'vnpay', 'pending', NULL, 'pending', 0, NULL, NULL, '2025-06-15 21:02:44', '2025-06-15 21:02:44', NULL);
INSERT INTO `orders` VALUES (40, 'DH40', 42, 799999.00, 0.00, 0.00, 799999.00, 0.00, 'Vọng Giang', 'đại học coder', '0968791308', 'daichuvan05@gmail.com', 'vnpay', 'pending', NULL, 'pending', 0, NULL, NULL, '2025-06-15 21:05:55', '2025-06-15 21:05:55', NULL);
INSERT INTO `orders` VALUES (41, 'DH41', 42, 34333.00, 0.00, 0.00, 34333.00, 0.00, 'Vọng Giang', 'đại học coder', '0968791308', 'daichuvan05@gmail.com', 'vnpay', 'pending', NULL, 'pending', 0, NULL, NULL, '2025-06-15 21:06:42', '2025-06-15 21:06:42', NULL);
INSERT INTO `orders` VALUES (42, 'DH42', 42, 34333.00, 0.00, 0.00, 34333.00, 0.00, 'Vọng Giang', 'đại học coder', '0968791308', 'daichuvan05@gmail.com', 'vnpay', 'pending', NULL, 'pending', 0, NULL, NULL, '2025-06-15 21:07:56', '2025-06-15 21:07:56', NULL);
INSERT INTO `orders` VALUES (43, 'DH43', 42, 12999999.00, 0.00, 0.00, 12999999.00, 0.00, 'Vọng Giang', 'đại học coder', '0968791308', 'daichuvan05@gmail.com', 'vnpay', 'pending', NULL, 'pending', 0, NULL, NULL, '2025-06-15 21:10:30', '2025-06-15 21:10:30', NULL);
INSERT INTO `orders` VALUES (44, 'DH44', 42, 12999999.00, 0.00, 0.00, 12999999.00, 0.00, 'Vọng Giang', 'đại học coder', '0968791308', 'daichuvan05@gmail.com', 'vnpay', 'pending', NULL, 'pending', 0, NULL, NULL, '2025-06-15 21:13:15', '2025-06-15 21:13:15', NULL);
INSERT INTO `orders` VALUES (45, 'DH45', 42, 12999999.00, 0.00, 0.00, 12999999.00, 0.00, 'Vọng Giang', 'đại học coder', '0968791308', 'daichuvan05@gmail.com', 'vnpay', 'pending', NULL, 'pending', 0, NULL, NULL, '2025-06-15 21:50:11', '2025-06-15 21:50:11', NULL);
INSERT INTO `orders` VALUES (46, 'DH46', 42, 12999999.00, 0.00, 0.00, 12999999.00, 0.00, 'Vọng Giang', 'đại học coder', '0968791308', 'daichuvan05@gmail.com', 'vnpay', 'pending', NULL, 'pending', 0, NULL, NULL, '2025-06-15 21:56:45', '2025-06-15 21:56:45', NULL);
INSERT INTO `orders` VALUES (47, 'DH47', 42, 34333.00, 0.00, 0.00, 34333.00, 0.00, 'Vọng Giang', 'đại học coder', '0968791308', 'daichuvan05@gmail.com', 'vnpay', 'pending', NULL, 'pending', 0, NULL, NULL, '2025-06-15 22:02:01', '2025-06-15 22:02:01', NULL);
INSERT INTO `orders` VALUES (48, 'DH48', 42, 12999999.00, 0.00, 0.00, 12999999.00, 0.00, 'Vọng Giang', 'đại học coder', '0968791308', 'daichuvan05@gmail.com', 'vnpay', 'pending', NULL, 'pending', 0, NULL, NULL, '2025-06-15 22:13:13', '2025-06-15 22:13:13', NULL);
INSERT INTO `orders` VALUES (49, 'DH49', 42, 12999999.00, 0.00, 0.00, 12999999.00, 0.00, 'Vọng Giang', 'đại học coder', '0968791308', 'daichuvan05@gmail.com', 'vnpay', 'pending', NULL, 'pending', 0, NULL, NULL, '2025-06-15 22:19:17', '2025-06-15 22:19:17', NULL);
INSERT INTO `orders` VALUES (50, 'DH50', 42, 12999999.00, 0.00, 0.00, 12999999.00, 0.00, 'Vọng Giang', 'đại học coder', '0968791308', 'daichuvan05@gmail.com', 'vnpay', 'pending', NULL, 'pending', 0, NULL, NULL, '2025-06-15 22:33:18', '2025-06-15 22:33:18', NULL);
INSERT INTO `orders` VALUES (51, 'DH51', 42, 12999999.00, 0.00, 0.00, 12999999.00, 0.00, 'Vọng Giang', 'đại học coder', '0968791308', 'daichuvan05@gmail.com', 'vnpay', 'pending', NULL, 'pending', 0, NULL, NULL, '2025-06-15 22:37:37', '2025-06-15 22:37:37', NULL);
INSERT INTO `orders` VALUES (52, 'DH52', 42, 34333.00, 0.00, 0.00, 34333.00, 0.00, 'Vọng Giang', 'đại học coder', '0968791308', 'daichuvan05@gmail.com', 'vnpay', 'pending', NULL, 'pending', 0, NULL, NULL, '2025-06-15 22:42:57', '2025-06-15 22:42:57', NULL);
INSERT INTO `orders` VALUES (53, 'DH53', 42, 12999999.00, 0.00, 0.00, 12999999.00, 0.00, 'Vọng Giang', 'đại học coder', '0968791308', 'daichuvan05@gmail.com', 'vnpay', 'pending', NULL, 'pending', 0, NULL, NULL, '2025-06-15 23:00:58', '2025-06-15 23:00:58', NULL);
INSERT INTO `orders` VALUES (54, 'DH54', 42, 12999999.00, 0.00, 0.00, 12999999.00, 0.00, 'Vọng Giang', 'đại học coder', '0968791308', 'daichuvan05@gmail.com', 'vnpay', 'pending', NULL, 'pending', 0, NULL, NULL, '2025-06-15 23:04:48', '2025-06-15 23:04:48', NULL);
INSERT INTO `orders` VALUES (55, 'DH55', 42, 12999999.00, 0.00, 0.00, 12999999.00, 0.00, 'Vọng Giang', 'đại học coder', '0968791308', 'daichuvan05@gmail.com', 'vnpay', 'pending', NULL, 'pending', 0, NULL, NULL, '2025-06-15 23:06:28', '2025-06-15 23:06:28', NULL);
INSERT INTO `orders` VALUES (56, 'DH56', 42, 12999999.00, 0.00, 0.00, 12999999.00, 0.00, 'Vọng Giang', 'đại học coder', '0968791308', 'daichuvan05@gmail.com', 'vnpay', 'pending', NULL, 'pending', 0, NULL, NULL, '2025-06-15 23:08:17', '2025-06-15 23:08:17', NULL);
INSERT INTO `orders` VALUES (57, 'DH57', 42, 12999999.00, 0.00, 0.00, 12999999.00, 0.00, 'Vọng Giang', 'đại học coder', '0968791308', 'daichuvan95@gmail.com', 'vnpay', 'pending', NULL, 'pending', 0, NULL, NULL, '2025-06-15 23:10:55', '2025-06-15 23:10:55', NULL);
INSERT INTO `orders` VALUES (58, 'DH58', 42, 12999999.00, 0.00, 0.00, 12999999.00, 0.00, 'Vọng Giang', 'đại học coder', '0968791308', 'daichuvan95@gmail.com', 'vnpay', 'pending', NULL, 'pending', 0, NULL, NULL, '2025-06-15 23:16:04', '2025-06-15 23:16:04', NULL);
INSERT INTO `orders` VALUES (59, 'DH59', 42, 34333.00, 0.00, 0.00, 34333.00, 0.00, 'Vọng Giang', 'đại học coder', '0968791308', 'daichuvan95@gmail.com', 'vnpay', 'pending', NULL, 'pending', 0, NULL, NULL, '2025-06-15 23:17:09', '2025-06-15 23:17:09', NULL);
INSERT INTO `orders` VALUES (60, 'DH60', 42, 12999999.00, 0.00, 0.00, 12999999.00, 0.00, 'Vọng Giang', 'đại học coder', '0968791308', 'daichuvan95@gmail.com', 'vnpay', 'pending', NULL, 'pending', 0, NULL, NULL, '2025-06-15 23:19:53', '2025-06-15 23:19:53', NULL);
INSERT INTO `orders` VALUES (61, 'DH61', 42, 34333.00, 0.00, 0.00, 34333.00, 0.00, 'Vọng Giang', 'đại học coder', '0968791308', 'daichuvan95@gmail.com', 'vnpay', 'pending', NULL, 'pending', 0, NULL, NULL, '2025-06-15 23:22:46', '2025-06-15 23:22:46', NULL);
INSERT INTO `orders` VALUES (62, 'DH62', 42, 12999999.00, 0.00, 0.00, 12999999.00, 0.00, 'Vọng Giang', 'đại học coder', '0968791308', 'daichuvan95@gmail.com', 'cod', 'pending', NULL, 'pending', 0, NULL, NULL, '2025-06-15 23:26:25', '2025-06-15 23:26:25', NULL);
INSERT INTO `orders` VALUES (63, 'ORD202506152943', 42, 34333.00, 0.00, 0.00, 34333.00, 0.00, 'Vọng Giang', 'đại học coder ', '0968791308', 'daichuvan95@gmail.com', 'vnpay', 'paid', NULL, 'confirmed', 1, NULL, NULL, '2025-06-15 23:26:58', '2025-06-15 23:27:42', NULL);
INSERT INTO `orders` VALUES (64, 'ORD202506156762', 42, 12999999.00, 0.00, 0.00, 12999999.00, 0.00, 'Vọng Giang', 'đại học coder ', '0968791308', 'daichuvan95@gmail.com', 'vnpay', 'pending', NULL, 'pending', 0, NULL, NULL, '2025-06-15 23:32:15', '2025-06-15 23:32:15', NULL);
INSERT INTO `orders` VALUES (65, 'DH65', 42, 12999999.00, 0.00, 0.00, 12999999.00, 0.00, 'Vọng Giang', 'đại học coder', '0968791308', 'daichuvan95@gmail.com', 'vnpay', 'pending', NULL, 'pending', 0, NULL, NULL, '2025-06-15 23:36:10', '2025-06-15 23:36:10', NULL);
INSERT INTO `orders` VALUES (66, 'ORD202506154780', 42, 34333.00, 0.00, 0.00, 34333.00, 0.00, 'Vọng Giang', 'đại học coder ', '0968791308', 'daichuvan95@gmail.com', 'vnpay', 'pending', NULL, 'pending', 0, NULL, NULL, '2025-06-15 23:39:27', '2025-06-15 23:39:27', NULL);
INSERT INTO `orders` VALUES (67, 'DH67', 42, 34333.00, 0.00, 0.00, 34333.00, 0.00, 'Vọng Giang', 'đại học coder', '0968791308', 'daichuvan95@gmail.com', 'vnpay', 'pending', NULL, 'pending', 0, NULL, NULL, '2025-06-15 23:39:57', '2025-06-15 23:39:57', NULL);
INSERT INTO `orders` VALUES (68, 'DH68', 42, 12999999.00, 0.00, 0.00, 12999999.00, 0.00, 'Vọng Giang', 'đại học coder', '0968791308', 'daichuvan95@gmail.com', 'vnpay', 'pending', NULL, 'pending', 0, NULL, NULL, '2025-06-15 23:43:17', '2025-06-15 23:43:17', NULL);
INSERT INTO `orders` VALUES (69, 'DH69', 42, 12999999.00, 0.00, 0.00, 12999999.00, 0.00, 'Vọng Giang', 'đại học coder', '0968791308', 'daichuvan95@gmail.com', 'vnpay', 'pending', NULL, 'pending', 0, NULL, NULL, '2025-06-15 23:47:24', '2025-06-15 23:47:24', NULL);
INSERT INTO `orders` VALUES (70, 'DH70', 42, 12999999.00, 0.00, 0.00, 12999999.00, 0.00, 'Vọng Giang', 'đại học coder', '0968791308', 'daichuvan95@gmail.com', 'vnpay', 'pending', NULL, 'pending', 0, NULL, NULL, '2025-06-15 23:49:44', '2025-06-15 23:49:44', NULL);
INSERT INTO `orders` VALUES (71, 'DH71', 42, 68666.00, 0.00, 0.00, 68666.00, 0.00, 'Vọng Giang', 'đại học coder', '0968791308', 'daichuvan95@gmail.com', 'vnpay', 'pending', NULL, 'pending', 0, NULL, NULL, '2025-06-15 23:53:00', '2025-06-15 23:53:00', NULL);
INSERT INTO `orders` VALUES (72, 'DH72', 42, 12999999.00, 0.00, 0.00, 12999999.00, 0.00, 'Vọng Giang', 'đại học coder', '0968791308', 'daichuvan95@gmail.com', 'vnpay', 'pending', NULL, 'pending', 0, NULL, NULL, '2025-06-15 23:55:18', '2025-06-15 23:55:18', NULL);
INSERT INTO `orders` VALUES (73, 'ORD202506159519', 42, 34333.00, 0.00, 0.00, 34333.00, 0.00, 'Vọng Giang', 'đại học coder ', '0968791308', 'daichuvan95@gmail.com', 'vnpay', 'pending', NULL, 'pending', 0, NULL, NULL, '2025-06-15 23:57:28', '2025-06-15 23:57:28', NULL);
INSERT INTO `orders` VALUES (74, 'DH74', 42, 34333.00, 0.00, 0.00, 34333.00, 0.00, 'Vọng Giang', 'đại học coder', '0968791308', 'daichuvan95@gmail.com', 'vnpay', 'pending', NULL, 'pending', 0, NULL, NULL, '2025-06-15 23:58:23', '2025-06-15 23:58:23', NULL);
INSERT INTO `orders` VALUES (75, 'DH75', 42, 34333.00, 0.00, 0.00, 34333.00, 0.00, 'Vọng Giang', 'đại học coder', '0968791308', 'daichuvan95@gmail.com', 'vnpay', 'pending', NULL, 'pending', 0, NULL, NULL, '2025-06-16 00:02:19', '2025-06-16 00:02:19', NULL);
INSERT INTO `orders` VALUES (76, 'ORD202506168114', 42, 12999999.00, 0.00, 0.00, 12999999.00, 0.00, 'Vọng Giang', 'đại học coder ', '0968791308', 'daichuvan95@gmail.com', 'vnpay', 'pending', NULL, 'pending', 0, NULL, NULL, '2025-06-16 00:09:41', '2025-06-16 00:09:41', NULL);
INSERT INTO `orders` VALUES (77, 'DH77', 42, 12999999.00, 0.00, 0.00, 12999999.00, 0.00, 'Vọng Giang', 'đại học coder', '0968791308', 'daichuvan95@gmail.com', 'vnpay', 'pending', NULL, 'pending', 0, NULL, NULL, '2025-06-16 00:13:26', '2025-06-16 00:13:26', NULL);
INSERT INTO `orders` VALUES (78, 'DH78', 42, 12999999.00, 0.00, 0.00, 12999999.00, 0.00, 'Vọng Giang', 'đại học coder', '0968791308', 'daichuvan95@gmail.com', 'vnpay', 'pending', NULL, 'cancelled', 0, NULL, 'tôi cần thay đổi phương thức thanh toán xxx', '2025-06-16 00:16:57', '2025-06-16 00:30:18', NULL);
INSERT INTO `orders` VALUES (79, 'DH79', 42, 12999999.00, 0.00, 0.00, 12999999.00, 0.00, 'Vọng Giang', 'đại học coder', '0968791308', 'daichuvan95@gmail.com', 'vnpay', 'paid', NULL, 'confirmed', 1, NULL, NULL, '2025-06-16 00:23:11', '2025-06-16 00:24:04', NULL);
INSERT INTO `orders` VALUES (80, 'DH80', 42, 34333.00, 0.00, 0.00, 34333.00, 0.00, 'Vọng Giang', 'đại học coder', '0968791308', 'daichuvan95@gmail.com', 'vnpay', 'paid', NULL, 'confirmed', 1, NULL, NULL, '2025-06-16 00:29:31', '2025-06-16 00:29:59', NULL);
INSERT INTO `orders` VALUES (81, 'ORD202506162345', 42, 34333.00, 0.00, 0.00, 34333.00, 0.00, 'Vọng Giang', 'đại học coder ', '0968791308', 'daichuvan95@gmail.com', 'vnpay', 'pending', NULL, 'pending', 0, NULL, NULL, '2025-06-16 00:31:38', '2025-06-16 00:31:38', NULL);
INSERT INTO `orders` VALUES (82, 'ORD202506165008', 42, 34333.00, 0.00, 0.00, 34333.00, 0.00, 'Vọng Giang', 'đại học coder ', '0968791308', 'daichuvan95@gmail.com', 'vnpay', 'paid', NULL, 'confirmed', 1, NULL, NULL, '2025-06-16 00:32:27', '2025-06-16 00:33:17', NULL);
INSERT INTO `orders` VALUES (83, 'DH83', 42, 12999999.00, 0.00, 0.00, 12999999.00, 0.00, 'Vọng Giang', 'đại học coder', '0968791308', 'daichuvan95@gmail.com', 'vnpay', 'paid', NULL, 'confirmed', 1, NULL, NULL, '2025-06-16 00:33:47', '2025-06-16 00:34:12', NULL);
INSERT INTO `orders` VALUES (84, 'DH84', 42, 34333.00, 0.00, 0.00, 34333.00, 0.00, 'Vọng Giang', 'đại học coder', '0968791308', 'daichuvan95@gmail.com', 'cod', 'pending', NULL, 'pending', 0, NULL, NULL, '2025-06-16 00:34:42', '2025-06-16 00:34:42', NULL);
INSERT INTO `orders` VALUES (85, 'DH85', 42, 12999999.00, 0.00, 0.00, 12999999.00, 0.00, 'Vọng Giang', 'đại học coder', '0968791308', 'daichuvan95@gmail.com', 'cod', 'pending', NULL, 'pending', 0, NULL, NULL, '2025-06-16 00:35:28', '2025-06-16 00:35:28', NULL);
INSERT INTO `orders` VALUES (86, 'DH86', 42, 26799997.00, 0.00, 0.00, 26799997.00, 0.00, 'Vọng Giang', 'đại học coder', '0968791308', 'daichuvan95@gmail.com', 'vnpay', 'paid', NULL, 'confirmed', 1, NULL, NULL, '2025-06-16 00:43:50', '2025-06-16 00:44:19', NULL);
INSERT INTO `orders` VALUES (87, 'DH87', 42, 13068665.00, 0.00, 0.00, 13068665.00, 0.00, 'Vọng Giang', 'đại học coder', '0968791308', 'daichuvan95@gmail.com', 'vnpay', 'paid', NULL, 'completed', 1, NULL, NULL, '2025-06-16 00:53:12', '2025-06-17 22:50:27', NULL);
INSERT INTO `orders` VALUES (88, 'DH88', 42, 34333.00, 0.00, 0.00, 34333.00, 0.00, 'Vọng Giang', 'đại học coder', '0968791308', 'daichuvan95@gmail.com', 'cod', 'pending', NULL, 'pending', 0, NULL, NULL, '2025-06-16 01:00:09', '2025-06-16 01:00:09', NULL);
INSERT INTO `orders` VALUES (93, 'DH93', 43, 12345.00, 0.00, 0.00, 12345.00, 0.00, 'Hà Nội', 'Cường', '0987654321', 'test@gmail.com', 'cod', 'pending', NULL, 'pending', 0, NULL, NULL, '2025-06-16 15:27:36', '2025-06-16 15:27:36', NULL);
INSERT INTO `orders` VALUES (94, 'DH94', 43, 2345678.00, 0.00, 0.00, 2345678.00, 0.00, 'Hà Nội', 'Cường', '0987654311', 'test@gmail.com', 'cod', 'pending', NULL, 'pending', 0, NULL, NULL, '2025-06-16 22:58:34', '2025-06-16 22:58:34', NULL);
INSERT INTO `orders` VALUES (95, 'DH95', 43, 35555555.00, 0.00, 0.00, 35555555.00, 0.00, 'Hà Nội', 'Cường', '0987654321', 'test@gmail.com', 'cod', 'paid', NULL, 'completed', 0, NULL, NULL, '2025-06-17 22:45:55', '2025-06-17 22:53:27', NULL);
INSERT INTO `orders` VALUES (96, 'DH96', NULL, 55125.00, 0.00, 0.00, 55125.00, 0.00, 'Vọng Giang', 'đại học coder', '0368706552', 'user98@gmail.com', 'cod', 'pending', NULL, 'pending', 0, NULL, NULL, '2025-06-18 15:25:23', '2025-06-18 15:25:23', NULL);

-- ----------------------------
-- Table structure for page_views
-- ----------------------------
DROP TABLE IF EXISTS `page_views`;
CREATE TABLE `page_views`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) UNSIGNED NULL DEFAULT NULL,
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `ip_address` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `user_agent` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `page_views_user_id_foreign`(`user_id`) USING BTREE,
  CONSTRAINT `page_views_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 28 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of page_views
-- ----------------------------
INSERT INTO `page_views` VALUES (1, NULL, 'http://127.0.0.1:8000', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36 Edg/137.0.0.0', '2025-06-18 21:35:59', '2025-06-18 21:35:59');
INSERT INTO `page_views` VALUES (2, NULL, 'http://127.0.0.1:8000', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36 Edg/137.0.0.0', '2025-06-18 21:40:10', '2025-06-18 21:40:10');
INSERT INTO `page_views` VALUES (3, NULL, 'http://127.0.0.1:8000/logout', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36 Edg/137.0.0.0', '2025-06-18 21:40:20', '2025-06-18 21:40:20');
INSERT INTO `page_views` VALUES (4, NULL, 'http://127.0.0.1:8000/login', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36 Edg/137.0.0.0', '2025-06-18 21:40:21', '2025-06-18 21:40:21');
INSERT INTO `page_views` VALUES (5, NULL, 'http://127.0.0.1:8000/login', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36 Edg/137.0.0.0', '2025-06-18 21:40:27', '2025-06-18 21:40:27');
INSERT INTO `page_views` VALUES (6, NULL, 'http://127.0.0.1:8000', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36 Edg/137.0.0.0', '2025-06-18 21:40:28', '2025-06-18 21:40:28');
INSERT INTO `page_views` VALUES (7, 1, 'http://127.0.0.1:8000/admin', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', '2025-06-18 21:41:20', '2025-06-18 21:41:20');
INSERT INTO `page_views` VALUES (8, 74, 'http://127.0.0.1:8000', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36 Edg/137.0.0.0', '2025-06-18 21:41:30', '2025-06-18 21:41:30');
INSERT INTO `page_views` VALUES (9, 1, 'http://127.0.0.1:8000/admin', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', '2025-06-19 21:42:20', '2025-06-18 21:42:20');
INSERT INTO `page_views` VALUES (10, 1, 'http://127.0.0.1:8000/admin', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', '2025-06-18 21:42:34', '2025-06-18 21:42:34');
INSERT INTO `page_views` VALUES (11, 1, 'http://127.0.0.1:8000/admin', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', '2025-06-18 21:42:48', '2025-06-18 21:42:48');
INSERT INTO `page_views` VALUES (12, 1, 'http://127.0.0.1:8000/admin', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', '2025-06-18 21:51:16', '2025-06-18 21:51:16');
INSERT INTO `page_views` VALUES (13, 1, 'http://127.0.0.1:8000/admin', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', '2025-06-18 21:54:51', '2025-06-18 21:54:51');
INSERT INTO `page_views` VALUES (14, 1, 'http://127.0.0.1:8000/admin', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', '2025-06-18 21:55:13', '2025-06-18 21:55:13');
INSERT INTO `page_views` VALUES (15, 1, 'http://127.0.0.1:8000/admin', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', '2025-06-18 21:55:20', '2025-06-18 21:55:20');
INSERT INTO `page_views` VALUES (16, 1, 'http://127.0.0.1:8000/admin', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', '2025-06-18 21:55:26', '2025-06-18 21:55:26');
INSERT INTO `page_views` VALUES (17, 1, 'http://127.0.0.1:8000/admin', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', '2025-06-18 21:55:30', '2025-06-18 21:55:30');
INSERT INTO `page_views` VALUES (18, 1, 'http://127.0.0.1:8000/admin', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', '2025-06-18 21:55:32', '2025-06-18 21:55:32');
INSERT INTO `page_views` VALUES (19, 1, 'http://127.0.0.1:8000/admin', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', '2025-06-18 21:55:36', '2025-06-18 21:55:36');
INSERT INTO `page_views` VALUES (20, 1, 'http://127.0.0.1:8000/admin', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', '2025-06-18 21:55:49', '2025-06-18 21:55:49');
INSERT INTO `page_views` VALUES (21, 1, 'http://127.0.0.1:8000/admin', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', '2025-06-18 21:58:39', '2025-06-18 21:58:39');
INSERT INTO `page_views` VALUES (22, 1, 'http://127.0.0.1:8000/admin', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', '2025-06-18 22:04:25', '2025-06-18 22:04:25');
INSERT INTO `page_views` VALUES (23, 1, 'http://127.0.0.1:8000/admin', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', '2025-06-18 22:04:47', '2025-06-18 22:04:47');
INSERT INTO `page_views` VALUES (24, 1, 'http://127.0.0.1:8000/admin', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', '2025-06-18 22:12:08', '2025-06-18 22:12:08');
INSERT INTO `page_views` VALUES (25, 1, 'http://127.0.0.1:8000/admin', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', '2025-06-18 22:13:48', '2025-06-18 22:13:48');
INSERT INTO `page_views` VALUES (26, 1, 'http://127.0.0.1:8000/admin', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', '2025-06-18 22:14:42', '2025-06-18 22:14:42');
INSERT INTO `page_views` VALUES (27, 1, 'http://127.0.0.1:8000/admin/categories', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', '2025-06-18 22:15:32', '2025-06-18 22:15:32');

-- ----------------------------
-- Table structure for password_reset_tokens
-- ----------------------------
DROP TABLE IF EXISTS `password_reset_tokens`;
CREATE TABLE `password_reset_tokens`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `password_reset_tokens_email_index`(`email`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of password_reset_tokens
-- ----------------------------
INSERT INTO `password_reset_tokens` VALUES (3, 'anh@gmail.com', 'twCHSilj0Onla0y4UHNeoLK8L5sUs5PIjmHWmychuhnflFTq7WOSkTE0D73m_1749048937_anh@gmail.com', '2025-06-04 21:55:37');
INSERT INTO `password_reset_tokens` VALUES (5, 'anhnnbph50226@gmail.com', 'TcU9qBsJd2B9DBCrzBrk6IQAiZSACesk0smAw4TewCDTXcXcPrrmWvAaJzfJ_1749219764_anhnnbph50226@gmail.com', '2025-06-06 21:22:44');

-- ----------------------------
-- Table structure for permissions
-- ----------------------------
DROP TABLE IF EXISTS `permissions`;
CREATE TABLE `permissions`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `permissions_name_guard_name_unique`(`name`, `guard_name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 38 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of permissions
-- ----------------------------
INSERT INTO `permissions` VALUES (1, 'view categories', 'web', '2025-05-15 12:40:56', '2025-05-15 12:40:56');
INSERT INTO `permissions` VALUES (2, 'create categories', 'web', '2025-05-15 12:40:56', '2025-05-15 12:40:56');
INSERT INTO `permissions` VALUES (3, 'edit categories', 'web', '2025-05-15 12:40:56', '2025-05-15 12:40:56');
INSERT INTO `permissions` VALUES (4, 'delete categories', 'web', '2025-05-15 12:40:56', '2025-05-15 12:40:56');
INSERT INTO `permissions` VALUES (5, 'view banners', 'web', '2025-05-15 12:40:56', '2025-05-15 12:40:56');
INSERT INTO `permissions` VALUES (6, 'create banners', 'web', '2025-05-15 12:40:56', '2025-05-15 12:40:56');
INSERT INTO `permissions` VALUES (7, 'edit banners', 'web', '2025-05-15 12:40:56', '2025-05-15 12:40:56');
INSERT INTO `permissions` VALUES (8, 'delete banners', 'web', '2025-05-15 12:40:56', '2025-05-15 12:40:56');
INSERT INTO `permissions` VALUES (9, 'view products', 'web', '2025-05-15 12:40:56', '2025-05-15 12:40:56');
INSERT INTO `permissions` VALUES (10, 'create products', 'web', '2025-05-15 12:40:57', '2025-05-15 12:40:57');
INSERT INTO `permissions` VALUES (11, 'edit products', 'web', '2025-05-15 12:40:57', '2025-05-15 12:40:57');
INSERT INTO `permissions` VALUES (12, 'delete products', 'web', '2025-05-15 12:40:57', '2025-05-15 12:40:57');
INSERT INTO `permissions` VALUES (13, 'view orders', 'web', '2025-05-15 12:40:57', '2025-05-15 12:40:57');
INSERT INTO `permissions` VALUES (14, 'create orders', 'web', '2025-05-15 12:40:57', '2025-05-15 12:40:57');
INSERT INTO `permissions` VALUES (15, 'edit orders', 'web', '2025-05-15 12:40:57', '2025-05-15 12:40:57');
INSERT INTO `permissions` VALUES (16, 'delete orders', 'web', '2025-05-15 12:40:57', '2025-05-15 12:40:57');
INSERT INTO `permissions` VALUES (17, 'view users', 'web', '2025-05-15 12:40:57', '2025-05-15 12:40:57');
INSERT INTO `permissions` VALUES (18, 'create users', 'web', '2025-05-15 12:40:57', '2025-05-15 12:40:57');
INSERT INTO `permissions` VALUES (19, 'edit users', 'web', '2025-05-15 12:40:57', '2025-05-15 12:40:57');
INSERT INTO `permissions` VALUES (20, 'delete users', 'web', '2025-05-15 12:40:58', '2025-05-15 12:40:58');
INSERT INTO `permissions` VALUES (21, 'view blogs', 'web', '2025-05-15 12:40:58', '2025-05-15 12:40:58');
INSERT INTO `permissions` VALUES (22, 'create blogs', 'web', '2025-05-15 12:40:58', '2025-05-15 12:40:58');
INSERT INTO `permissions` VALUES (23, 'edit blogs', 'web', '2025-05-15 12:40:58', '2025-05-15 12:40:58');
INSERT INTO `permissions` VALUES (24, 'delete blogs', 'web', '2025-05-15 12:40:58', '2025-05-15 12:40:58');
INSERT INTO `permissions` VALUES (25, 'view attributes', 'web', '2025-05-15 12:40:58', '2025-05-15 12:40:58');
INSERT INTO `permissions` VALUES (26, 'create attributes', 'web', '2025-05-15 12:40:58', '2025-05-15 12:40:58');
INSERT INTO `permissions` VALUES (27, 'edit attributes', 'web', '2025-05-15 12:40:58', '2025-05-15 12:40:58');
INSERT INTO `permissions` VALUES (28, 'delete attributes', 'web', '2025-05-15 12:40:58', '2025-05-15 12:40:58');
INSERT INTO `permissions` VALUES (29, 'view dashboard', 'web', '2025-05-15 12:40:58', '2025-05-15 12:40:58');
INSERT INTO `permissions` VALUES (30, 'addrole', 'web', '2025-05-15 15:05:37', '2025-05-15 15:05:37');
INSERT INTO `permissions` VALUES (31, 'view category specifications', 'web', '2025-05-23 14:48:10', '2025-05-23 14:48:10');
INSERT INTO `permissions` VALUES (32, 'view category attributes', 'web', '2025-05-23 14:48:10', '2025-05-23 14:48:10');
INSERT INTO `permissions` VALUES (33, 'view specifications', 'web', '2025-05-23 14:48:10', '2025-05-23 14:48:10');
INSERT INTO `permissions` VALUES (34, 'trash specifications', 'web', '2025-05-23 14:48:10', '2025-05-23 14:48:10');
INSERT INTO `permissions` VALUES (35, 'restore specifications', 'web', '2025-05-23 14:48:10', '2025-05-23 14:48:10');
INSERT INTO `permissions` VALUES (36, 'delete specifications', 'web', '2025-05-23 14:48:10', '2025-05-23 14:48:10');
INSERT INTO `permissions` VALUES (37, 'view vouchers', 'web', '2025-05-23 14:48:10', '2025-05-23 14:48:10');

-- ----------------------------
-- Table structure for product_reviews
-- ----------------------------
DROP TABLE IF EXISTS `product_reviews`;
CREATE TABLE `product_reviews`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `rating` int(11) NULL DEFAULT NULL,
  `review` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `product_reviews_product_id_foreign`(`product_id`) USING BTREE,
  INDEX `product_reviews_user_id_foreign`(`user_id`) USING BTREE,
  CONSTRAINT `product_reviews_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `product_reviews_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of product_reviews
-- ----------------------------

-- ----------------------------
-- Table structure for product_specifications
-- ----------------------------
DROP TABLE IF EXISTS `product_specifications`;
CREATE TABLE `product_specifications`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `specification_id` bigint(20) UNSIGNED NOT NULL,
  `value` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `product_specifications_product_id_foreign`(`product_id`) USING BTREE,
  INDEX `product_specifications_specification_id_foreign`(`specification_id`) USING BTREE,
  CONSTRAINT `product_specifications_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `product_specifications_specification_id_foreign` FOREIGN KEY (`specification_id`) REFERENCES `specifications` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 372 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of product_specifications
-- ----------------------------
INSERT INTO `product_specifications` VALUES (294, 152, 14, 'aaaaaa', '2025-06-17 16:06:04', '2025-06-18 14:28:57', '2025-06-18 14:28:57');
INSERT INTO `product_specifications` VALUES (295, 152, 15, 'aaaaaa', '2025-06-17 16:06:04', '2025-06-17 16:06:48', '2025-06-17 16:06:48');
INSERT INTO `product_specifications` VALUES (296, 152, 16, 'aaaaaa', '2025-06-17 16:06:04', '2025-06-17 16:06:48', '2025-06-17 16:06:48');
INSERT INTO `product_specifications` VALUES (297, 152, 17, 'aaaaaa', '2025-06-17 16:06:04', '2025-06-17 16:06:48', '2025-06-17 16:06:48');
INSERT INTO `product_specifications` VALUES (298, 152, 18, 'aaaaaa', '2025-06-17 16:06:04', '2025-06-17 16:06:48', '2025-06-17 16:06:48');
INSERT INTO `product_specifications` VALUES (299, 152, 19, 'aaaaaa', '2025-06-17 16:06:04', '2025-06-17 16:06:48', '2025-06-17 16:06:48');
INSERT INTO `product_specifications` VALUES (300, 152, 20, 'aaaaaa', '2025-06-17 16:06:04', '2025-06-17 16:06:48', '2025-06-17 16:06:48');
INSERT INTO `product_specifications` VALUES (301, 152, 21, 'aaaaaa', '2025-06-17 16:06:04', '2025-06-17 16:06:48', '2025-06-17 16:06:48');
INSERT INTO `product_specifications` VALUES (302, 152, 14, 'aaaaaa', '2025-06-17 16:06:48', '2025-06-17 16:16:16', '2025-06-17 16:16:16');
INSERT INTO `product_specifications` VALUES (303, 152, 15, 'aaaaaa', '2025-06-17 16:06:48', '2025-06-17 16:16:16', '2025-06-17 16:16:16');
INSERT INTO `product_specifications` VALUES (304, 152, 16, 'aaaaaa', '2025-06-17 16:06:48', '2025-06-17 16:16:16', '2025-06-17 16:16:16');
INSERT INTO `product_specifications` VALUES (305, 152, 17, 'aaaaaa', '2025-06-17 16:06:48', '2025-06-17 16:16:16', '2025-06-17 16:16:16');
INSERT INTO `product_specifications` VALUES (306, 152, 18, 'aaaaaa', '2025-06-17 16:06:48', '2025-06-17 16:16:16', '2025-06-17 16:16:16');
INSERT INTO `product_specifications` VALUES (307, 152, 19, 'aaaaaa', '2025-06-17 16:06:48', '2025-06-17 16:16:16', '2025-06-17 16:16:16');
INSERT INTO `product_specifications` VALUES (308, 152, 20, 'aaaaaa', '2025-06-17 16:06:48', '2025-06-17 16:16:16', '2025-06-17 16:16:16');
INSERT INTO `product_specifications` VALUES (309, 152, 21, 'aaaaaa', '2025-06-17 16:06:48', '2025-06-17 16:16:16', '2025-06-17 16:16:16');
INSERT INTO `product_specifications` VALUES (310, 152, 14, 'aaaaaa', '2025-06-17 16:16:16', '2025-06-17 16:18:06', '2025-06-17 16:18:06');
INSERT INTO `product_specifications` VALUES (311, 152, 15, 'aaaaaa', '2025-06-17 16:16:16', '2025-06-17 16:18:06', '2025-06-17 16:18:06');
INSERT INTO `product_specifications` VALUES (312, 152, 16, 'aaaaaa', '2025-06-17 16:16:16', '2025-06-17 16:18:06', '2025-06-17 16:18:06');
INSERT INTO `product_specifications` VALUES (313, 152, 17, 'aaaaaa', '2025-06-17 16:16:16', '2025-06-17 16:18:06', '2025-06-17 16:18:06');
INSERT INTO `product_specifications` VALUES (314, 152, 18, 'aaaaaa', '2025-06-17 16:16:16', '2025-06-17 16:18:06', '2025-06-17 16:18:06');
INSERT INTO `product_specifications` VALUES (315, 152, 19, 'aaaaaa', '2025-06-17 16:16:16', '2025-06-17 16:18:06', '2025-06-17 16:18:06');
INSERT INTO `product_specifications` VALUES (316, 152, 20, 'aaaaaa', '2025-06-17 16:16:16', '2025-06-17 16:18:06', '2025-06-17 16:18:06');
INSERT INTO `product_specifications` VALUES (317, 152, 21, 'aaaaaa', '2025-06-17 16:16:16', '2025-06-17 16:18:06', '2025-06-17 16:18:06');
INSERT INTO `product_specifications` VALUES (318, 152, 14, 'aaaaaa', '2025-06-17 16:18:06', '2025-06-17 16:19:53', '2025-06-17 16:19:53');
INSERT INTO `product_specifications` VALUES (319, 152, 15, 'aaaaaa', '2025-06-17 16:18:06', '2025-06-17 16:19:53', '2025-06-17 16:19:53');
INSERT INTO `product_specifications` VALUES (320, 152, 16, 'aaaaaa', '2025-06-17 16:18:07', '2025-06-17 16:19:53', '2025-06-17 16:19:53');
INSERT INTO `product_specifications` VALUES (321, 152, 17, 'aaaaaa', '2025-06-17 16:18:07', '2025-06-17 16:19:53', '2025-06-17 16:19:53');
INSERT INTO `product_specifications` VALUES (322, 152, 18, 'aaaaaa', '2025-06-17 16:18:07', '2025-06-17 16:19:53', '2025-06-17 16:19:53');
INSERT INTO `product_specifications` VALUES (323, 152, 19, 'aaaaaa', '2025-06-17 16:18:07', '2025-06-17 16:19:53', '2025-06-17 16:19:53');
INSERT INTO `product_specifications` VALUES (324, 152, 20, 'aaaaaa', '2025-06-17 16:18:07', '2025-06-17 16:19:53', '2025-06-17 16:19:53');
INSERT INTO `product_specifications` VALUES (325, 152, 21, 'aaaaaa', '2025-06-17 16:18:07', '2025-06-17 16:19:53', '2025-06-17 16:19:53');
INSERT INTO `product_specifications` VALUES (326, 152, 14, 'aaaaaa', '2025-06-17 16:19:53', '2025-06-17 16:22:10', '2025-06-17 16:22:10');
INSERT INTO `product_specifications` VALUES (327, 152, 15, 'aaaaaa', '2025-06-17 16:19:53', '2025-06-17 16:22:10', '2025-06-17 16:22:10');
INSERT INTO `product_specifications` VALUES (328, 152, 16, 'aaaaaa', '2025-06-17 16:19:53', '2025-06-17 16:22:10', '2025-06-17 16:22:10');
INSERT INTO `product_specifications` VALUES (329, 152, 17, 'aaaaaa', '2025-06-17 16:19:53', '2025-06-17 16:22:10', '2025-06-17 16:22:10');
INSERT INTO `product_specifications` VALUES (330, 152, 18, 'aaaaaa', '2025-06-17 16:19:53', '2025-06-17 16:22:10', '2025-06-17 16:22:10');
INSERT INTO `product_specifications` VALUES (331, 152, 19, 'aaaaaa', '2025-06-17 16:19:53', '2025-06-17 16:22:10', '2025-06-17 16:22:10');
INSERT INTO `product_specifications` VALUES (332, 152, 20, 'aaaaaa', '2025-06-17 16:19:53', '2025-06-17 16:22:10', '2025-06-17 16:22:10');
INSERT INTO `product_specifications` VALUES (333, 152, 21, 'aaaaaa', '2025-06-17 16:19:53', '2025-06-17 16:22:10', '2025-06-17 16:22:10');
INSERT INTO `product_specifications` VALUES (334, 152, 14, 'aaaaaa', '2025-06-17 16:22:10', '2025-06-18 14:28:57', '2025-06-18 14:28:57');
INSERT INTO `product_specifications` VALUES (335, 152, 15, 'aaaaaa', '2025-06-17 16:22:10', '2025-06-18 14:28:57', '2025-06-18 14:28:57');
INSERT INTO `product_specifications` VALUES (336, 152, 16, 'aaaaaa', '2025-06-17 16:22:10', '2025-06-18 14:28:57', '2025-06-18 14:28:57');
INSERT INTO `product_specifications` VALUES (337, 152, 17, 'aaaaaa', '2025-06-17 16:22:10', '2025-06-18 14:28:57', '2025-06-18 14:28:57');
INSERT INTO `product_specifications` VALUES (338, 152, 18, 'aaaaaa', '2025-06-17 16:22:10', '2025-06-18 14:28:57', '2025-06-18 14:28:57');
INSERT INTO `product_specifications` VALUES (339, 152, 19, 'aaaaaa', '2025-06-17 16:22:10', '2025-06-18 14:28:57', '2025-06-18 14:28:57');
INSERT INTO `product_specifications` VALUES (340, 152, 20, 'aaaaaa', '2025-06-17 16:22:10', '2025-06-18 14:28:57', '2025-06-18 14:28:57');
INSERT INTO `product_specifications` VALUES (341, 152, 21, 'aaaaaa', '2025-06-17 16:22:10', '2025-06-18 14:28:57', '2025-06-18 14:28:57');
INSERT INTO `product_specifications` VALUES (342, 152, 14, 'aaaaaa', '2025-06-18 14:28:58', '2025-06-18 14:39:48', '2025-06-18 14:39:48');
INSERT INTO `product_specifications` VALUES (343, 152, 15, 'aaaaaa', '2025-06-18 14:28:58', '2025-06-18 14:39:48', '2025-06-18 14:39:48');
INSERT INTO `product_specifications` VALUES (344, 152, 16, 'aaaaaa', '2025-06-18 14:28:58', '2025-06-18 14:39:48', '2025-06-18 14:39:48');
INSERT INTO `product_specifications` VALUES (345, 152, 17, 'aaaaaa', '2025-06-18 14:28:58', '2025-06-18 14:39:48', '2025-06-18 14:39:48');
INSERT INTO `product_specifications` VALUES (346, 152, 18, 'aaaaaa', '2025-06-18 14:28:58', '2025-06-18 14:39:48', '2025-06-18 14:39:48');
INSERT INTO `product_specifications` VALUES (347, 152, 21, 'aaaaaa', '2025-06-18 14:28:58', '2025-06-18 14:39:48', '2025-06-18 14:39:48');
INSERT INTO `product_specifications` VALUES (348, 152, 14, 'aaaaaa', '2025-06-18 14:39:48', '2025-06-18 14:39:48', NULL);
INSERT INTO `product_specifications` VALUES (349, 152, 15, 'aaaaaa', '2025-06-18 14:39:48', '2025-06-18 14:39:48', NULL);
INSERT INTO `product_specifications` VALUES (350, 152, 16, 'aaaaaa', '2025-06-18 14:39:48', '2025-06-18 14:39:48', NULL);
INSERT INTO `product_specifications` VALUES (351, 152, 17, 'aaaaaa', '2025-06-18 14:39:48', '2025-06-18 14:39:48', NULL);
INSERT INTO `product_specifications` VALUES (352, 152, 18, 'aaaaaa', '2025-06-18 14:39:48', '2025-06-18 14:39:48', NULL);
INSERT INTO `product_specifications` VALUES (353, 152, 21, 'aaaaaa', '2025-06-18 14:39:48', '2025-06-18 14:39:48', NULL);
INSERT INTO `product_specifications` VALUES (354, 153, 14, 'IOaaaa', '2025-06-19 13:16:07', '2025-06-19 13:16:07', NULL);
INSERT INTO `product_specifications` VALUES (355, 153, 15, 'aaaaaaaaa', '2025-06-19 13:16:07', '2025-06-19 13:16:07', NULL);
INSERT INTO `product_specifications` VALUES (356, 153, 16, 'aaa', '2025-06-19 13:16:07', '2025-06-19 13:16:07', NULL);
INSERT INTO `product_specifications` VALUES (357, 153, 17, 'aaaaa', '2025-06-19 13:16:07', '2025-06-19 13:16:07', NULL);
INSERT INTO `product_specifications` VALUES (358, 153, 18, 'aaaa', '2025-06-19 13:16:07', '2025-06-19 13:16:07', NULL);
INSERT INTO `product_specifications` VALUES (359, 153, 21, 'aaaaa', '2025-06-19 13:16:08', '2025-06-19 13:16:08', NULL);
INSERT INTO `product_specifications` VALUES (360, 154, 14, 'iOS 17', '2025-06-19 13:21:02', '2025-06-19 13:21:02', NULL);
INSERT INTO `product_specifications` VALUES (361, 154, 15, 'Apple A17 Pro Bionic 6 nhân', '2025-06-19 13:21:02', '2025-06-19 13:21:02', NULL);
INSERT INTO `product_specifications` VALUES (362, 154, 16, '3.78 GHz', '2025-06-19 13:21:03', '2025-06-19 13:21:03', NULL);
INSERT INTO `product_specifications` VALUES (363, 154, 17, 'Apple GPU 6 nhân', '2025-06-19 13:21:03', '2025-06-19 13:21:03', NULL);
INSERT INTO `product_specifications` VALUES (364, 154, 18, '8 GB', '2025-06-19 13:21:03', '2025-06-19 13:21:03', NULL);
INSERT INTO `product_specifications` VALUES (365, 154, 21, 'Không giới hạn', '2025-06-19 13:21:03', '2025-06-19 13:21:03', NULL);
INSERT INTO `product_specifications` VALUES (366, 155, 14, 'iOS 17', '2025-06-19 13:23:02', '2025-06-19 13:23:02', NULL);
INSERT INTO `product_specifications` VALUES (367, 155, 15, 'Apple A15 Bionic 6 nhân', '2025-06-19 13:23:02', '2025-06-19 13:23:02', NULL);
INSERT INTO `product_specifications` VALUES (368, 155, 16, '3.22 GHz', '2025-06-19 13:23:02', '2025-06-19 13:23:02', NULL);
INSERT INTO `product_specifications` VALUES (369, 155, 17, 'Apple GPU 5 nhân', '2025-06-19 13:23:02', '2025-06-19 13:23:02', NULL);
INSERT INTO `product_specifications` VALUES (370, 155, 18, '6 GB', '2025-06-19 13:23:02', '2025-06-19 13:23:02', NULL);
INSERT INTO `product_specifications` VALUES (371, 155, 21, 'Không giới hạn', '2025-06-19 13:23:02', '2025-06-19 13:23:02', NULL);

-- ----------------------------
-- Table structure for product_variants
-- ----------------------------
DROP TABLE IF EXISTS `product_variants`;
CREATE TABLE `product_variants`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `sku` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `discount_price` decimal(15, 2) NULL DEFAULT NULL,
  `stock` int(11) NOT NULL DEFAULT 0,
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `is_default` tinyint(1) NOT NULL DEFAULT 0 COMMENT '1: Default variant, 0: Not default',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `images` json NULL COMMENT 'Mảng JSON chứa các đường dẫn ảnh của biến thể',
  `purchase_price` decimal(15, 2) NOT NULL DEFAULT 0.00 COMMENT 'Giá nhập',
  `selling_price` decimal(15, 2) NOT NULL DEFAULT 0.00 COMMENT 'Giá bán',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `product_variants_slug_unique`(`slug`) USING BTREE,
  UNIQUE INDEX `product_variants_sku_unique`(`sku`) USING BTREE,
  INDEX `product_variants_product_id_foreign`(`product_id`) USING BTREE,
  CONSTRAINT `product_variants_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 246 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of product_variants
-- ----------------------------
INSERT INTO `product_variants` VALUES (239, 152, 'SP-68348', 'iPhone 15 Pro Max - Titan Sa Mạc - 1TB', 'iphone-15-pro-max-titan-sa-mac-1tb', NULL, 109, 'active', 1, '2025-06-17 13:23:02', '2025-06-18 15:25:23', NULL, '\"[\\\"uploads\\\\/products\\\\/1750141382_0_macbook-air-13-inch-m4-12-638772027208679591-650x650.jpg\\\",\\\"uploads\\\\/products\\\\/1750141382_0_macbook-air-13-inch-m4-13-638772027216304066-650x650.jpg\\\",\\\"uploads\\\\/products\\\\/1750141382_0_macbook-air-13-inch-m4-14-638772027222384420-650x650.jpg\\\",\\\"uploads\\\\/products\\\\/1750141382_0_macbook-air-13-inch-m4-15-638772027228926275-650x650.jpg\\\",\\\"uploads\\\\/products\\\\/1750141382_0_macbook-air-13-inch-m4-16-638772027238166613-650x650.jpg\\\",\\\"uploads\\\\/products\\\\/1750141382_0_macbook-air-13-inch-m4-18-638772027245004354-650x650.jpg\\\",\\\"uploads\\\\/products\\\\/1750141382_0_macbook-air-13-inch-m4-19-638772027251967937-650x650.jpg\\\",\\\"uploads\\\\/products\\\\/1750141382_0_macbook-air-13-inch-m4-20-638772027259250283-650x650.jpg\\\",\\\"uploads\\\\/products\\\\/1750141382_0_macbook-air-13-inch-m4-21-638772027266138378-650x650.jpg\\\",\\\"uploads\\\\/products\\\\/1750141382_0_macbook-air-13-inch-m4-22-638772027273564585-650x650.jpg\\\",\\\"uploads\\\\/products\\\\/1750141382_0_macbook-air-13-inch-m4-thumb-xanh-da-troi-650x650.png\\\",\\\"uploads\\\\/products\\\\/1750151208_0_macbook-air-13-inch-m4-thumb-xanh-da-troi-650x650.png\\\"]\"', 333.00, 55125.00);
INSERT INTO `product_variants` VALUES (240, 152, 'SP-66578', 'iPhone 15 Pro Max - Titan đen - 1TB', 'iphone-15-pro-max-titan-den-1tb', NULL, 222, 'active', 0, '2025-06-17 13:23:02', '2025-06-18 14:49:56', NULL, '\"[\\\"uploads\\\\/products\\\\/1750141382_1_macbook-air-13-inch-m4-12-638772027208679591-650x650.jpg\\\",\\\"uploads\\\\/products\\\\/1750152130_1_macbook-air-13-inch-m4-13-638772027216304066-650x650.jpg\\\",\\\"uploads\\\\/products\\\\/1750152130_1_macbook-air-13-inch-m4-14-638772027222384420-650x650.jpg\\\",\\\"uploads\\\\/products\\\\/1750152130_1_macbook-air-13-inch-m4-15-638772027228926275-650x650.jpg\\\",\\\"uploads\\\\/products\\\\/1750152130_1_macbook-air-13-inch-m4-16-638772027238166613-650x650.jpg\\\",\\\"uploads\\\\/products\\\\/1750152130_1_macbook-air-13-inch-m4-18-638772027245004354-650x650.jpg\\\",\\\"uploads\\\\/products\\\\/1750152130_1_macbook-air-13-inch-m4-19-638772027251967937-650x650.jpg\\\",\\\"uploads\\\\/products\\\\/1750152130_1_macbook-air-13-inch-m4-20-638772027259250283-650x650.jpg\\\",\\\"uploads\\\\/products\\\\/1750152130_1_macbook-air-13-inch-m4-21-638772027266138378-650x650.jpg\\\",\\\"uploads\\\\/products\\\\/1750152130_1_macbook-air-13-inch-m4-22-638772027273564585-650x650.jpg\\\"]\"', 333.00, 444.00);
INSERT INTO `product_variants` VALUES (243, 153, 'SP-17661', 'AirPods Pro (2nd Gen) USB-C - Titan đen', 'airpods-pro-2nd-gen-usb-c-titan-den-1750313768-0', NULL, 111, 'active', 1, '2025-06-19 13:16:08', '2025-06-19 13:16:08', NULL, '\"[\\\"uploads\\\\/products\\\\/1750313768_0_Danh m\\\\u1ee5c tai nghe, loa.png\\\"]\"', 111.00, 111.00);
INSERT INTO `product_variants` VALUES (244, 154, 'SP-62058', 'iPhone 15 Pro Max - Titan trắng - 256GB', 'iphone-15-pro-max-titan-trang-256gb-1750314063-0', NULL, 111, 'active', 1, '2025-06-19 13:21:03', '2025-06-19 13:21:03', NULL, '\"[\\\"uploads\\\\/products\\\\/1750314063_0_iphone-16-pro-max-titan-trang-thumb-650x650.png\\\",\\\"uploads\\\\/products\\\\/1750314063_0_iphone-16-pro-max-white-titan-1-638621796200037842-650x650.jpg\\\",\\\"uploads\\\\/products\\\\/1750314063_0_iphone-16-pro-max-white-titan-2-638621796206835851-650x650.jpg\\\",\\\"uploads\\\\/products\\\\/1750314063_0_iphone-16-pro-max-white-titan-3-638621796214529645-650x650.jpg\\\",\\\"uploads\\\\/products\\\\/1750314063_0_iphone-16-pro-max-white-titan-4-638621796221313391-650x650.jpg\\\",\\\"uploads\\\\/products\\\\/1750314063_0_iphone-16-pro-max-white-titan-5-638621796229996324-650x650.jpg\\\",\\\"uploads\\\\/products\\\\/1750314063_0_iphone-16-pro-max-white-titan-6-638621796236451102-650x650.jpg\\\",\\\"uploads\\\\/products\\\\/1750314063_0_iphone-16-pro-max-white-titan-7-638621796244285270-650x650.jpg\\\",\\\"uploads\\\\/products\\\\/1750314063_0_iphone-16-pro-max-white-titan-8-638621796251114174-650x650.jpg\\\",\\\"uploads\\\\/products\\\\/1750314063_0_iphone-16-pro-max-white-titan-9-638621796259552967-650x650.jpg\\\",\\\"uploads\\\\/products\\\\/1750314063_0_iphone-16-pro-max-white-titan-10-638621796266688217-650x650.jpg\\\"]\"', 222.00, 333.00);
INSERT INTO `product_variants` VALUES (245, 155, 'SP-47209', 'iPhone 14 Pro Max - Titan tự nhiên - 512GB', 'iphone-14-pro-max-titan-tu-nhien-512gb-1750314183-0', NULL, 222, 'active', 1, '2025-06-19 13:23:03', '2025-06-19 13:23:03', NULL, '\"[\\\"uploads\\\\/products\\\\/1750314183_0_iphone-16-pro-max-16-titan-tu-nhien-thumbnew-650x650.png\\\",\\\"uploads\\\\/products\\\\/1750314183_0_iphone-16-pro-max-natural-titan-1-638621796879976392-650x650.jpg\\\",\\\"uploads\\\\/products\\\\/1750314183_0_iphone-16-pro-max-natural-titan-2-638621796887193177-650x650.jpg\\\",\\\"uploads\\\\/products\\\\/1750314183_0_iphone-16-pro-max-natural-titan-3-638621796896942566-650x650.jpg\\\",\\\"uploads\\\\/products\\\\/1750314183_0_iphone-16-pro-max-natural-titan-4-638621796904877336-650x650.jpg\\\",\\\"uploads\\\\/products\\\\/1750314183_0_iphone-16-pro-max-natural-titan-5-638621796913722191-650x650.jpg\\\",\\\"uploads\\\\/products\\\\/1750314183_0_iphone-16-pro-max-natural-titan-6-638621796921000093-650x650.jpg\\\",\\\"uploads\\\\/products\\\\/1750314183_0_iphone-16-pro-max-natural-titan-7-638621796927764642-650x650.jpg\\\",\\\"uploads\\\\/products\\\\/1750314183_0_iphone-16-pro-max-natural-titan-8-638621796937887668-650x650.jpg\\\",\\\"uploads\\\\/products\\\\/1750314183_0_iphone-16-pro-max-natural-titan-9-638621796945020418-650x650.jpg\\\",\\\"uploads\\\\/products\\\\/1750314183_0_iphone-16-pro-max-natural-titan-10-638621796955273943-650x650.jpg\\\"]\"', 222.00, 222.00);

-- ----------------------------
-- Table structure for product_views
-- ----------------------------
DROP TABLE IF EXISTS `product_views`;
CREATE TABLE `product_views`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) UNSIGNED NULL DEFAULT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `viewed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `product_views_user_id_foreign`(`user_id`) USING BTREE,
  INDEX `product_views_product_id_foreign`(`product_id`) USING BTREE,
  CONSTRAINT `product_views_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `product_views_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 249 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of product_views
-- ----------------------------
INSERT INTO `product_views` VALUES (218, 43, 152, '2025-06-17 10:23:55');
INSERT INTO `product_views` VALUES (219, 43, 152, '2025-06-17 15:15:03');
INSERT INTO `product_views` VALUES (220, 43, 152, '2025-06-17 15:16:07');
INSERT INTO `product_views` VALUES (221, 43, 152, '2025-06-17 15:16:30');
INSERT INTO `product_views` VALUES (222, 43, 152, '2025-06-17 15:20:57');
INSERT INTO `product_views` VALUES (223, 43, 152, '2025-06-17 15:40:41');
INSERT INTO `product_views` VALUES (224, 43, 152, '2025-06-17 15:41:07');
INSERT INTO `product_views` VALUES (225, 43, 152, '2025-06-17 15:44:46');
INSERT INTO `product_views` VALUES (226, NULL, 152, '2025-06-17 17:15:06');
INSERT INTO `product_views` VALUES (227, NULL, 152, '2025-06-18 06:58:58');
INSERT INTO `product_views` VALUES (228, 1, 152, '2025-06-18 07:09:21');
INSERT INTO `product_views` VALUES (229, 1, 152, '2025-06-18 07:09:32');
INSERT INTO `product_views` VALUES (230, 1, 152, '2025-06-18 07:09:38');
INSERT INTO `product_views` VALUES (231, 1, 152, '2025-06-18 07:09:44');
INSERT INTO `product_views` VALUES (232, 1, 152, '2025-06-18 07:12:18');
INSERT INTO `product_views` VALUES (233, 1, 152, '2025-06-18 07:12:34');
INSERT INTO `product_views` VALUES (234, 1, 152, '2025-06-18 07:12:49');
INSERT INTO `product_views` VALUES (235, 1, 152, '2025-06-18 07:13:11');
INSERT INTO `product_views` VALUES (236, 1, 152, '2025-06-18 07:13:17');
INSERT INTO `product_views` VALUES (237, 1, 152, '2025-06-18 07:13:43');
INSERT INTO `product_views` VALUES (238, 1, 152, '2025-06-18 07:14:35');
INSERT INTO `product_views` VALUES (239, 1, 152, '2025-06-18 07:23:18');
INSERT INTO `product_views` VALUES (240, 1, 152, '2025-06-18 07:23:54');
INSERT INTO `product_views` VALUES (241, 1, 152, '2025-06-18 07:27:54');
INSERT INTO `product_views` VALUES (242, 43, 152, '2025-06-18 07:30:32');
INSERT INTO `product_views` VALUES (243, 1, 152, '2025-06-18 07:30:35');
INSERT INTO `product_views` VALUES (244, NULL, 152, '2025-06-18 08:16:37');
INSERT INTO `product_views` VALUES (245, 1, 154, '2025-06-19 06:55:09');
INSERT INTO `product_views` VALUES (246, 1, 152, '2025-06-19 06:55:39');
INSERT INTO `product_views` VALUES (247, 1, 152, '2025-06-19 06:55:43');
INSERT INTO `product_views` VALUES (248, NULL, 155, '2025-06-19 06:57:05');

-- ----------------------------
-- Table structure for products
-- ----------------------------
DROP TABLE IF EXISTS `products`;
CREATE TABLE `products`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `category_id` bigint(20) UNSIGNED NOT NULL,
  `warranty_months` int(11) NOT NULL DEFAULT 12,
  `is_featured` tinyint(1) NOT NULL DEFAULT 0,
  `status` enum('active','inactive') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `views` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `products_slug_unique`(`slug`) USING BTREE,
  INDEX `products_category_id_foreign`(`category_id`) USING BTREE,
  INDEX `products_status_index`(`status`) USING BTREE,
  INDEX `products_is_featured_index`(`is_featured`) USING BTREE,
  CONSTRAINT `products_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 156 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of products
-- ----------------------------
INSERT INTO `products` VALUES (152, 'iPhone 15 Pro Max test', 'iphone-15-pro-max-test-1750232388', 'aaaaaa', '<p>aaaaaa</p>', 25, 12, 0, 'active', 58, '2025-06-17 13:23:02', '2025-06-19 13:55:42', NULL);
INSERT INTO `products` VALUES (153, 'AirPods Pro (2nd Gen) USB-C', 'airpods-pro-2nd-gen-usb-c-1750313767', NULL, NULL, 28, 12, 0, 'active', 0, '2025-06-19 13:16:07', '2025-06-19 13:16:07', NULL);
INSERT INTO `products` VALUES (154, 'iPhone 15 Pro Max', 'iphone-15-pro-max-1750314062', NULL, NULL, 25, 12, 0, 'active', 2, '2025-06-19 13:21:02', '2025-06-19 13:55:09', NULL);
INSERT INTO `products` VALUES (155, 'iPhone 14 Pro Max', 'iphone-14-pro-max-1750314182', NULL, NULL, 25, 12, 0, 'active', 2, '2025-06-19 13:23:02', '2025-06-19 13:57:06', NULL);

-- ----------------------------
-- Table structure for role_has_permissions
-- ----------------------------
DROP TABLE IF EXISTS `role_has_permissions`;
CREATE TABLE `role_has_permissions`  (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL,
  PRIMARY KEY (`permission_id`, `role_id`) USING BTREE,
  INDEX `role_has_permissions_role_id_foreign`(`role_id`) USING BTREE,
  CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of role_has_permissions
-- ----------------------------
INSERT INTO `role_has_permissions` VALUES (1, 1);
INSERT INTO `role_has_permissions` VALUES (2, 1);
INSERT INTO `role_has_permissions` VALUES (3, 1);
INSERT INTO `role_has_permissions` VALUES (4, 1);
INSERT INTO `role_has_permissions` VALUES (5, 1);
INSERT INTO `role_has_permissions` VALUES (6, 1);
INSERT INTO `role_has_permissions` VALUES (7, 1);
INSERT INTO `role_has_permissions` VALUES (8, 1);
INSERT INTO `role_has_permissions` VALUES (9, 1);
INSERT INTO `role_has_permissions` VALUES (10, 1);
INSERT INTO `role_has_permissions` VALUES (11, 1);
INSERT INTO `role_has_permissions` VALUES (12, 1);
INSERT INTO `role_has_permissions` VALUES (13, 1);
INSERT INTO `role_has_permissions` VALUES (14, 1);
INSERT INTO `role_has_permissions` VALUES (15, 1);
INSERT INTO `role_has_permissions` VALUES (16, 1);
INSERT INTO `role_has_permissions` VALUES (17, 1);
INSERT INTO `role_has_permissions` VALUES (18, 1);
INSERT INTO `role_has_permissions` VALUES (19, 1);
INSERT INTO `role_has_permissions` VALUES (20, 1);
INSERT INTO `role_has_permissions` VALUES (21, 1);
INSERT INTO `role_has_permissions` VALUES (22, 1);
INSERT INTO `role_has_permissions` VALUES (23, 1);
INSERT INTO `role_has_permissions` VALUES (24, 1);
INSERT INTO `role_has_permissions` VALUES (25, 1);
INSERT INTO `role_has_permissions` VALUES (26, 1);
INSERT INTO `role_has_permissions` VALUES (27, 1);
INSERT INTO `role_has_permissions` VALUES (28, 1);
INSERT INTO `role_has_permissions` VALUES (29, 1);
INSERT INTO `role_has_permissions` VALUES (30, 1);
INSERT INTO `role_has_permissions` VALUES (31, 1);
INSERT INTO `role_has_permissions` VALUES (32, 1);
INSERT INTO `role_has_permissions` VALUES (33, 1);
INSERT INTO `role_has_permissions` VALUES (34, 1);
INSERT INTO `role_has_permissions` VALUES (35, 1);
INSERT INTO `role_has_permissions` VALUES (36, 1);
INSERT INTO `role_has_permissions` VALUES (37, 1);
INSERT INTO `role_has_permissions` VALUES (1, 2);
INSERT INTO `role_has_permissions` VALUES (5, 2);
INSERT INTO `role_has_permissions` VALUES (9, 2);
INSERT INTO `role_has_permissions` VALUES (13, 2);
INSERT INTO `role_has_permissions` VALUES (17, 2);
INSERT INTO `role_has_permissions` VALUES (18, 2);
INSERT INTO `role_has_permissions` VALUES (21, 2);
INSERT INTO `role_has_permissions` VALUES (22, 2);
INSERT INTO `role_has_permissions` VALUES (23, 2);
INSERT INTO `role_has_permissions` VALUES (24, 2);
INSERT INTO `role_has_permissions` VALUES (25, 2);
INSERT INTO `role_has_permissions` VALUES (29, 2);

-- ----------------------------
-- Table structure for roles
-- ----------------------------
DROP TABLE IF EXISTS `roles`;
CREATE TABLE `roles`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `roles_name_guard_name_unique`(`name`, `guard_name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of roles
-- ----------------------------
INSERT INTO `roles` VALUES (1, 'admin', 'web', '2025-05-15 12:40:58', '2025-05-15 12:40:58');
INSERT INTO `roles` VALUES (2, 'staff', 'web', '2025-05-15 12:40:58', '2025-05-15 12:40:58');
INSERT INTO `roles` VALUES (3, 'user', 'web', '2025-05-15 12:40:59', '2025-05-15 12:40:59');

-- ----------------------------
-- Table structure for search_histories
-- ----------------------------
DROP TABLE IF EXISTS `search_histories`;
CREATE TABLE `search_histories`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) UNSIGNED NULL DEFAULT NULL,
  `keyword` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `search_histories_user_id_foreign`(`user_id`) USING BTREE,
  CONSTRAINT `search_histories_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of search_histories
-- ----------------------------

-- ----------------------------
-- Table structure for sessions
-- ----------------------------
DROP TABLE IF EXISTS `sessions`;
CREATE TABLE `sessions`  (
  `id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED NULL DEFAULT NULL,
  `ip_address` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `user_agent` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `payload` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `sessions_user_id_index`(`user_id`) USING BTREE,
  INDEX `sessions_last_activity_index`(`last_activity`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sessions
-- ----------------------------
INSERT INTO `sessions` VALUES ('ADED6Aw145gbDi7ky39wzJ39ZO8dHJ7ZjxcCHewr', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiSERTNnNUVU90RFRDUmNMa3R2N203ZDVKY01uZmlrOWVSejJDbkhEMCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MTg1OiJodHRwOi8vMTI3LjAuMC4xOjgwMDAvY2hlY2tvdXQ/aW1hZ2U9aHR0cCUzQSUyRiUyRjEyNy4wLjAuMSUzQTgwMDAlMkZ1cGxvYWRzJTJGcHJvZHVjdHMlMkYxNzUwMzE0MTgzXzBfaXBob25lLTE2LXByby1tYXgtMTYtdGl0YW4tdHUtbmhpZW4tdGh1bWJuZXctNjUweDY1MC5wbmcmcXVhbnRpdHk9MSZ2YXJpYW50X2lkPTI0NSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1750316285, NULL, NULL);
INSERT INTO `sessions` VALUES ('ffT3MDCayepILT2J0EVeWj0oDgUosR4VZWs4t0EV', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 'YTo2OntzOjY6Il90b2tlbiI7czo0MDoiRlFpaWVGM3d6ODJQQzBqS0EwM3dzWVR0WmZpelhqcm8yNzdjOGFkdyI7czozOiJ1cmwiO2E6MDp7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fXM6NTA6ImxvZ2luX3dlYl81OWJhMzZhZGRjMmIyZjk0MDE1ODBmMDE0YzdmNThlYTRlMzA5ODlkIjtpOjE7czoxNzoicGFzc3dvcmRfaGFzaF93ZWIiO3M6NjA6IiQyeSQxMiRzaTdnUnlkYkplNnVQRHovMHB4cUR1aXB3RHdUOVEvMnBWcGYwSHBTNmsvbHQ1ejcwVWh0dSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDU6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hZG1pbi9wcm9kdWN0cy8xNTIvZWRpdCI7fX0=', 1750316858, NULL, NULL);
INSERT INTO `sessions` VALUES ('MAe089xOI1Q8ZtQcrsD82Y7SOrvDFLNuW6mreSmz', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'YTo1OntzOjY6Il90b2tlbiI7czo0MDoiRjZ5cUpHZlZhVDJJMWtITDNJa2ZSazF1ckVCMW9wbWRQc0hseTJ0TiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NjM6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9wcm9kdWN0L2lwaG9uZS0xNS1wcm8tbWF4LXRlc3QtMTc1MDIzMjM4OCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fXM6NTA6ImxvZ2luX3dlYl81OWJhMzZhZGRjMmIyZjk0MDE1ODBmMDE0YzdmNThlYTRlMzA5ODlkIjtpOjE7czoxNzoicGFzc3dvcmRfaGFzaF93ZWIiO3M6NjA6IiQyeSQxMiRzaTdnUnlkYkplNnVQRHovMHB4cUR1aXB3RHdUOVEvMnBWcGYwSHBTNmsvbHQ1ejcwVWh0dSI7fQ==', 1750316144, NULL, NULL);
INSERT INTO `sessions` VALUES ('Q7FvzPeNgWPftokXfgzYLkBZu440cNeyFuoM99wX', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 'YTo2OntzOjY6Il90b2tlbiI7czo0MDoiUllJZmtpM1FMUFZZMWZrSHZaQ0hxdFY5dXBubVE5VG1VbmY2QW9oTyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MTExOiJodHRwOi8vMTI3LjAuMC4xOjgwMDAvYWRtaW4vYWpheC9jaGVjay12YXJpYW50LXNsdWc/cHJvZHVjdF9pZD0xNTImc2x1Zz1pcGhvbmUtMTUtcHJvLW1heC10ZXN0LXRpdGFuLXNhLW1hYy0xdGIiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX1zOjM6InVybCI7YTowOnt9czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6MTtzOjE3OiJwYXNzd29yZF9oYXNoX3dlYiI7czo2MDoiJDJ5JDEyJHNpN2dSeWRiSmU2dVBEei8wcHhxRHVpcHdEd1Q5US8ycFZwZjBIcFM2ay9sdDV6NzBVaHR1Ijt9', 1750306373, NULL, NULL);
INSERT INTO `sessions` VALUES ('wtiinFxu4mYDWxmOUi5QCvTdHimAzKTcDvAQ0kkO', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoicDlydmh4ZDYxRXBLYWtnMEswS3hwTnNYT0lFS2NkbXQyWXQ0Y3V5cyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1750313633, NULL, NULL);

-- ----------------------------
-- Table structure for shipping_methods
-- ----------------------------
DROP TABLE IF EXISTS `shipping_methods`;
CREATE TABLE `shipping_methods`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `provider` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `service_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `integration_key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `price` decimal(15, 2) NULL DEFAULT NULL,
  `min_price` decimal(15, 2) NULL DEFAULT NULL,
  `max_price` decimal(15, 2) NULL DEFAULT NULL,
  `weight_range` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `area_coverage` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `estimated_delivery_days` int(11) NULL DEFAULT NULL,
  `cod_support` tinyint(1) NOT NULL DEFAULT 0,
  `tracking_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `status` enum('active','inactive','pending','error') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of shipping_methods
-- ----------------------------
INSERT INTO `shipping_methods` VALUES (1, 'Standard Shipping', 'Standard shipping method', NULL, NULL, NULL, 30000.00, NULL, NULL, NULL, NULL, NULL, 0, NULL, 'active', '2025-05-08 14:31:58', '2025-05-08 14:31:58', NULL);
INSERT INTO `shipping_methods` VALUES (2, 'Express Shipping', 'Express shipping method', NULL, NULL, NULL, 50000.00, NULL, NULL, NULL, NULL, NULL, 0, NULL, 'active', '2025-05-08 14:31:58', '2025-05-08 14:31:58', NULL);

-- ----------------------------
-- Table structure for specifications
-- ----------------------------
DROP TABLE IF EXISTS `specifications`;
CREATE TABLE `specifications`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `category_ids` json NULL,
  `status` enum('active','inactive') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 22 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of specifications
-- ----------------------------
INSERT INTO `specifications` VALUES (14, 'Hệ điều hành', NULL, '[\"25\", \"26\", \"27\", \"28\"]', 'active', '2025-06-16 13:47:53', '2025-06-16 13:47:53', NULL);
INSERT INTO `specifications` VALUES (15, 'Chip xử lý (CPU)', NULL, '[\"25\", \"26\", \"27\", \"28\"]', 'active', '2025-06-16 13:48:15', '2025-06-16 13:48:29', NULL);
INSERT INTO `specifications` VALUES (16, 'Tốc độ CPU', NULL, '[\"25\", \"26\", \"27\", \"28\"]', 'active', '2025-06-16 13:49:10', '2025-06-16 13:49:10', NULL);
INSERT INTO `specifications` VALUES (17, 'Chip đồ họa (GPU)', NULL, '[\"25\", \"26\", \"27\", \"28\"]', 'active', '2025-06-16 13:49:20', '2025-06-16 13:49:20', NULL);
INSERT INTO `specifications` VALUES (18, 'RAM', NULL, '[\"25\", \"26\", \"27\", \"28\"]', 'active', '2025-06-16 13:49:33', '2025-06-16 13:49:33', NULL);
INSERT INTO `specifications` VALUES (19, 'Dung lượng lưu trữ', NULL, '[\"25\", \"26\", \"27\", \"28\"]', 'active', '2025-06-16 13:49:46', '2025-06-18 14:00:02', '2025-06-18 14:00:02');
INSERT INTO `specifications` VALUES (20, 'Dung lượng còn lại (khả dụng) khoảng', NULL, '[\"25\", \"26\", \"27\", \"28\"]', 'active', '2025-06-16 13:50:02', '2025-06-18 14:06:48', '2025-06-18 14:06:48');
INSERT INTO `specifications` VALUES (21, 'Danh bạ', NULL, '[\"25\", \"26\", \"27\", \"28\"]', 'active', '2025-06-16 13:50:15', '2025-06-16 13:50:15', NULL);

-- ----------------------------
-- Table structure for stock_adjustment_items
-- ----------------------------
DROP TABLE IF EXISTS `stock_adjustment_items`;
CREATE TABLE `stock_adjustment_items`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `adjustment_id` bigint(20) UNSIGNED NOT NULL,
  `variant_id` bigint(20) UNSIGNED NOT NULL,
  `quantity` int(11) NOT NULL,
  `note` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `stock_adjustment_items_adjustment_id_foreign`(`adjustment_id`) USING BTREE,
  INDEX `stock_adjustment_items_variant_id_index`(`variant_id`) USING BTREE,
  CONSTRAINT `stock_adjustment_items_adjustment_id_foreign` FOREIGN KEY (`adjustment_id`) REFERENCES `stock_adjustments` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `stock_adjustment_items_variant_id_foreign` FOREIGN KEY (`variant_id`) REFERENCES `product_variants` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of stock_adjustment_items
-- ----------------------------

-- ----------------------------
-- Table structure for stock_adjustments
-- ----------------------------
DROP TABLE IF EXISTS `stock_adjustments`;
CREATE TABLE `stock_adjustments`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` enum('increase','decrease') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `reason` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('pending','approved','rejected') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `approved_by` bigint(20) UNSIGNED NULL DEFAULT NULL,
  `approved_at` timestamp NULL DEFAULT NULL,
  `created_by` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `stock_adjustments_code_unique`(`code`) USING BTREE,
  INDEX `stock_adjustments_approved_by_foreign`(`approved_by`) USING BTREE,
  INDEX `stock_adjustments_created_by_foreign`(`created_by`) USING BTREE,
  INDEX `stock_adjustments_code_index`(`code`) USING BTREE,
  INDEX `stock_adjustments_type_index`(`type`) USING BTREE,
  INDEX `stock_adjustments_status_index`(`status`) USING BTREE,
  INDEX `stock_adjustments_created_at_index`(`created_at`) USING BTREE,
  CONSTRAINT `stock_adjustments_approved_by_foreign` FOREIGN KEY (`approved_by`) REFERENCES `users` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `stock_adjustments_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of stock_adjustments
-- ----------------------------

-- ----------------------------
-- Table structure for stock_movements
-- ----------------------------
DROP TABLE IF EXISTS `stock_movements`;
CREATE TABLE `stock_movements`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `variant_id` bigint(20) UNSIGNED NOT NULL,
  `type` enum('in','out') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `quantity` int(11) NOT NULL,
  `unit_price` decimal(10, 2) NULL DEFAULT NULL,
  `reference_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `reference_id` bigint(20) UNSIGNED NULL DEFAULT NULL,
  `note` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `created_by` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `stock_movements_variant_id_foreign`(`variant_id`) USING BTREE,
  INDEX `stock_movements_created_by_foreign`(`created_by`) USING BTREE,
  INDEX `stock_movements_reference_type_reference_id_index`(`reference_type`, `reference_id`) USING BTREE,
  INDEX `stock_movements_type_index`(`type`) USING BTREE,
  INDEX `stock_movements_created_at_index`(`created_at`) USING BTREE,
  CONSTRAINT `stock_movements_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `stock_movements_variant_id_foreign` FOREIGN KEY (`variant_id`) REFERENCES `product_variants` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of stock_movements
-- ----------------------------

-- ----------------------------
-- Table structure for subscribers
-- ----------------------------
DROP TABLE IF EXISTS `subscribers`;
CREATE TABLE `subscribers`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `subscribers_email_unique`(`email`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of subscribers
-- ----------------------------
INSERT INTO `subscribers` VALUES (1, 'nguyendinhkhai0103@gmail.com', '2025-05-24 16:52:42', '2025-05-24 16:52:42', NULL, NULL);
INSERT INTO `subscribers` VALUES (2, 'admin@gmail.com', '2025-05-27 14:40:45', '2025-05-27 14:40:45', 'Mừng Nguyễn Văn', NULL);
INSERT INTO `subscribers` VALUES (3, 'mungnvph20465@fpt.edu.vn', '2025-05-27 14:42:06', '2025-05-27 14:42:06', 'Khuất Thảo Ly', NULL);

-- ----------------------------
-- Table structure for user_addresses
-- ----------------------------
DROP TABLE IF EXISTS `user_addresses`;
CREATE TABLE `user_addresses`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `fullname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `phone` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `address_line` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `city` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `district` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `ward` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `postal_code` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `is_default` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `user_addresses_user_id_foreign`(`user_id`) USING BTREE,
  CONSTRAINT `user_addresses_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user_addresses
-- ----------------------------

-- ----------------------------
-- Table structure for user_vouchers
-- ----------------------------
DROP TABLE IF EXISTS `user_vouchers`;
CREATE TABLE `user_vouchers`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `voucher_id` bigint(20) UNSIGNED NOT NULL,
  `used_times` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `user_vouchers_user_id_voucher_id_unique`(`user_id`, `voucher_id`) USING BTREE,
  INDEX `user_vouchers_voucher_id_foreign`(`voucher_id`) USING BTREE,
  CONSTRAINT `user_vouchers_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `user_vouchers_voucher_id_foreign` FOREIGN KEY (`voucher_id`) REFERENCES `vouchers` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user_vouchers
-- ----------------------------

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `provider` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `provider_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `phone` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `dob` date NULL DEFAULT NULL,
  `gender` enum('male','female','other') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'other',
  `is_verified` tinyint(1) NOT NULL DEFAULT 0,
  `last_login` timestamp NULL DEFAULT NULL,
  `status` enum('active','inactive','banned') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `users_email_unique`(`email`) USING BTREE,
  UNIQUE INDEX `users_provider_id_unique`(`provider_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 78 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES (1, 'Admin ', 'admin@gmail.com', NULL, '$2y$12$si7gRydbJe6uPDz/0pxqDuipwDwT9Q/2pVpf0HpS6k/lt5z70Uhtu', NULL, NULL, '0123456789', 'Hanoi', NULL, NULL, 'other', 0, '2025-06-19 13:14:14', 'active', 'exr5geQYmKHzu52X8RwoQT5r7S1ZjXbZGyx2DfeHkpKBhmF4AuyhU9sLFzPq', '2025-05-16 15:31:25', '2025-06-19 13:14:14', NULL);
INSERT INTO `users` VALUES (2, 'Staff ', 'staffp@gmail.com', NULL, '$2y$12$de5HWZYmyu9wLPmTzHmyJOjVt1J1uxTaBtWCyQQgZj/kIpNR7At3a', NULL, NULL, '0987654321', 'Hanoi', NULL, NULL, 'other', 0, NULL, 'active', NULL, '2025-05-15 12:40:59', '2025-05-15 12:40:59', NULL);
INSERT INTO `users` VALUES (19, 'Staff User', 'staffp@example.com', NULL, '$2y$12$WHrqm55gWHco5y8WkiNczeLnELUpkpEj3eJC3tOAxHV2QUp1o0DJm', NULL, NULL, '0987654321', 'Hanoi', NULL, NULL, 'other', 0, '2025-06-17 21:16:42', 'active', NULL, '2025-05-23 14:48:11', '2025-06-17 21:16:42', NULL);
INSERT INTO `users` VALUES (20, 'Normal User', 'userp@example.com', NULL, '$12$si7gRydbJe6uPDz/0pxqDuipwDwT9Q/2pVpf0HpS6k/lt5z70Uhtu', NULL, NULL, '1234567890', 'Hanoi', NULL, NULL, 'other', 0, NULL, 'active', NULL, '2025-05-23 14:48:12', '2025-05-23 14:48:12', NULL);
INSERT INTO `users` VALUES (22, 'Banh đẹp traiii', 'banhday@example.com', NULL, '$2y$12$2RR91Wl.OzECaT5HLkwGoufESlbD7GhGXqbFvwEEIlCJfHEUjmUti', NULL, NULL, '1234567890', 'Viet Tri ,Phu Tho', NULL, NULL, 'other', 0, '2025-05-25 04:28:32', 'active', NULL, '2025-05-25 04:23:02', '2025-05-25 04:28:32', NULL);
INSERT INTO `users` VALUES (33, 'banh tester 1', 'banhtester@gmail.com', NULL, '$2y$12$h2CYhIAl0f2VOK8rl.1HPOeTLrfKuK7KNcTyJ0oCxFYuRXJap6MO2', NULL, NULL, '0368706552', 'Số nhà 71, phố tiền phong, phường tiên cát', NULL, '2025-05-16', 'female', 0, NULL, 'active', NULL, '2025-05-25 18:46:03', '2025-05-25 18:46:03', NULL);
INSERT INTO `users` VALUES (34, 'banh tester 2', 'banhtester1@gmail.com', NULL, '$2y$12$UY/SPxHGU8zAS6IrhPYanetgotqTpTOV3jAkGtQQSI/bT3TLbzo5q', NULL, NULL, '0368706552', 'Số nhà 71, phố tiền phong, phường tiên cát', NULL, '2025-05-08', 'other', 0, NULL, 'active', NULL, '2025-05-25 18:50:41', '2025-05-25 18:50:41', NULL);
INSERT INTO `users` VALUES (35, 'banhtetsre', 'anhnnbph5q0226@gmail.com', NULL, '$2y$12$Cf0GYSxjgLZaKvBlRVdWhu29H.l.N4IcBt7j95hot.c49mZMT6fkq', NULL, NULL, '0368706552', 'Số nhà 71, phố tiền phong, phường tiên cát', NULL, '2025-05-16', 'male', 0, NULL, 'active', NULL, '2025-05-25 18:53:57', '2025-05-25 18:53:57', NULL);
INSERT INTO `users` VALUES (36, 'Bird Blog', 'birdblog@gmail.com', NULL, '$2y$12$PuMZty9.K0bsfo9Wjb2DcOevqS97eVslQIKc.qGmchBUBfRCzh0BK', NULL, NULL, '0368706552', 'Số nhà 71, phố tiền phong, phường tiên cát', NULL, '2025-05-16', 'female', 0, NULL, 'active', NULL, '2025-05-25 18:56:42', '2025-05-25 18:56:42', NULL);
INSERT INTO `users` VALUES (37, 'Bird Blog', 'birdblog2@gmail.com', NULL, '$2y$12$KB5b4cSc58LyMFevm02Qs.8pSQNPuibCGtijQukqJoTkwTYOYLsnu', NULL, NULL, '0368706552', 'Số nhà 71, phố tiền phong, phường tiên cát', NULL, '2025-05-16', 'female', 0, NULL, 'active', NULL, '2025-05-25 18:57:37', '2025-05-25 18:57:37', NULL);
INSERT INTO `users` VALUES (38, 'Bird Blog', 'birdblog3@gmail.com', NULL, '$2y$12$DdGqxTBlHv.ozo0oCYaY1up1s9tRoV.3M0Plw7m4QLdPcuelHwc.u', NULL, NULL, '0368706552', 'Số nhà 71, phố tiền phong, phường tiên cát', NULL, '2025-05-16', 'female', 0, NULL, 'active', NULL, '2025-05-25 18:58:01', '2025-05-25 18:58:01', NULL);
INSERT INTO `users` VALUES (39, 'banh dayy yeu em', 'banhday11@example.com', NULL, '$2y$12$KB.guIki4Wfdev8M1iOk5uvJceBBjtcJAArv30/jtVTLD9cwtPl8e', NULL, NULL, '0368706552', 'Số nhà 71, phố tiền phong, phường tiên cát', NULL, '2025-05-07', 'female', 0, NULL, 'active', NULL, '2025-05-25 23:20:54', '2025-05-25 23:20:54', NULL);
INSERT INTO `users` VALUES (40, 'bui quang dong', 'dongbui@gmail.com', NULL, '$2y$12$lENUgnn9oOJWPfSrQSrguucx9hzpikO7.IjgSduonsxBi/.T1jMjy', NULL, NULL, '0368706552', 'Số nhà 71, phố tiền phong, phường tiên cát', NULL, '2025-06-06', 'male', 0, NULL, 'active', NULL, '2025-05-26 08:45:25', '2025-05-26 08:45:25', NULL);
INSERT INTO `users` VALUES (41, 'Kim Hong Phong Dai', 'daicv@gmail.com', NULL, '$2y$12$JcBJQvn.Cffa3B/ohBz2v..4mW4hmeKceF9cYV3qtj55ZKy6.2WX6', NULL, NULL, '0368706552', 'Số nhà 71, phố tiền phong, phường tiên cát', NULL, '2025-05-21', 'male', 0, '2025-05-26 22:08:16', 'active', 'JHGQYfCLgyB1gD0ebHR1CSEclBpoAoJoKl9sxjHt9jFMkq3ENc4lU0cN8bHi', '2025-05-26 22:07:41', '2025-05-31 20:55:29', NULL);
INSERT INTO `users` VALUES (42, 'đại học coder', 'daichuvan95@gmail.com', NULL, '$2y$12$zabvva8SdzabLKbOkbzvKOxczOwxUaExwGePOUB3mjF7wlyA3B/V2', NULL, NULL, '0968791308', 'Vọng Giang', NULL, '2025-05-05', 'male', 0, '2025-06-16 13:47:32', 'inactive', NULL, '2025-05-28 14:57:13', '2025-06-16 13:47:32', NULL);
INSERT INTO `users` VALUES (43, 'Cường', 'test@gmail.com', NULL, '$2y$12$3n6LLncP6oIAforDGEkCKO5YEp/mhdvHQwK4UU2thehOUNRGmzBha', NULL, NULL, '09876543', 'Hà Nội', NULL, '2025-05-28', 'male', 0, '2025-06-18 14:27:46', 'active', NULL, '2025-05-28 22:46:16', '2025-06-18 14:27:46', NULL);
INSERT INTO `users` VALUES (44, 'banhdayyy', 'anh@gmail.com', NULL, '$2y$12$iL89MO6m8aJ6ytcW/gmKo.DM.6KpdA44E.QCUI.ZTtZ.u0iGCxNW2', NULL, NULL, '0368706552', 'asdsadas', NULL, '2025-05-15', 'male', 0, '2025-05-31 22:09:59', 'active', 'tR6P0OXUsCQtwboq9YCyaCdVdT2exORi6s27GcphWL6lhOk395FRM0vc8KCH', '2025-05-31 22:07:02', '2025-05-31 22:09:59', NULL);
INSERT INTO `users` VALUES (45, 'Thanh Bình Nguyễn', 'nguyenthanhbinh05082005@gmail.com', '2025-06-01 09:28:50', '$2y$12$Q0KzVz4F/HD5o609kbqZi.phhyITvFuXSEMqtOPFUpetszd6G0pkO', 'google', '102989406420602569869', NULL, NULL, 'https://lh3.googleusercontent.com/a/ACg8ocJ_1MC1lN0WwDtNb4x5D2AWjmSLm1k-R0V7TX3BrL80CWKlpw=s96-c', NULL, 'other', 0, NULL, 'active', NULL, '2025-06-01 09:28:50', '2025-06-01 09:28:50', NULL);
INSERT INTO `users` VALUES (52, 'banh dayy', 'banhday1234@gmail.com', NULL, '$2y$12$7WnXBp6SLBYwdJgmWWFG3eBlA/JskA4gLWGJjwAjBsvb2WI0NyatC', NULL, NULL, NULL, 'dfsdfadfas', NULL, '2025-05-28', 'female', 0, '2025-06-01 23:02:58', 'active', NULL, '2025-06-01 23:01:51', '2025-06-01 23:02:58', NULL);
INSERT INTO `users` VALUES (53, 'Banh Tester', 'remvaimankhung@gmail.com', '2025-06-01 23:03:19', '$2y$12$MObZpPjGNsoynBotx4F/Bee0hUiXpmi5IxZnwpsQXVXV1EWP03RKq', 'google', '116737877673519409445', NULL, NULL, 'https://lh3.googleusercontent.com/a/ACg8ocLU_9HP_drMj7OlbFgpvtPXOQO8NK0GHV8C4T4iyLUVbJIO9nk=s96-c', NULL, 'other', 0, '2025-06-01 23:03:19', 'active', NULL, '2025-06-01 23:03:19', '2025-06-01 23:03:19', NULL);
INSERT INTO `users` VALUES (55, 'Nguyễn Đình Khải PH 2 9 3 3 3', 'khaindph29333@fpt.edu.vn', '2025-06-06 21:17:28', '$2y$12$GNkUx1XICxiojX82LLoM2ud3ftUk.dPYacBjMvdfgXwoIvjRCaTl.', 'google', '108444160617922493293', NULL, NULL, 'https://lh3.googleusercontent.com/a/ACg8ocLB_WYRfUH-tTqs9HPYRbgRndrlJFdIr8zYaSrIKRWNpcfQvfs=s96-c', NULL, 'other', 0, '2025-06-06 21:25:54', 'active', NULL, '2025-06-06 21:17:28', '2025-06-06 21:25:54', NULL);
INSERT INTO `users` VALUES (56, 'banhday1', 'abc@gmail.com', NULL, '$2y$12$d4H0sg.1SmZsVo.v6ktX9.61m72Q0r0mQb2BSDe/BKb.ZCFgTk/NO', NULL, NULL, '0368706552', 'Số nhà 71, phố tiền phong, phường tiên cát', NULL, '2025-06-04', 'male', 0, '2025-06-08 11:48:16', 'active', NULL, '2025-06-08 10:43:19', '2025-06-08 11:48:16', NULL);
INSERT INTO `users` VALUES (57, 'Banhdayyy', 'anhnnbph50226@gmail.com', NULL, '$2y$12$p0rCIFebcRUrvdDscrh5tuYVSmgitAm8WLMGqYbH5w0bF.2y66cfi', NULL, NULL, '0368706552', 'Số nhà 71, phố tiền phong, phường tiên cát', NULL, '2025-06-18', 'female', 0, '2025-06-08 12:12:38', 'active', NULL, '2025-06-08 12:06:25', '2025-06-08 12:12:38', NULL);
INSERT INTO `users` VALUES (58, 'Thanh Bình Ford', 'fordthanhbinh@gmail.com', '2025-06-08 12:09:45', '$2y$12$MVlS.gw7VO4KCTMHtwBCM.Pv6Hnk4y4U75LE6naIlWY.Ju0EXP74i', 'google', '115646386580052762473', NULL, NULL, 'https://lh3.googleusercontent.com/a/ACg8ocJCXzWZLPJWJf0se5Ihc9PgsKzheh_qnnGQeZywKHuggYP9Wg=s96-c', NULL, 'other', 0, '2025-06-08 12:09:45', 'active', NULL, '2025-06-08 12:09:45', '2025-06-08 12:09:45', NULL);
INSERT INTO `users` VALUES (59, 'banhdayma', 'banhday@gmail.com', NULL, '$2y$12$4uDWY9yd25Cx0Jun7kR/EOaJDHVlUSIp5xT2v2St6EC/qZLJ57mai', NULL, NULL, '0368706552', 'Số nhà 71, phố tiền phong, phường tiên cát', NULL, '2025-06-04', 'male', 0, '2025-06-09 22:26:36', 'active', NULL, '2025-06-09 22:26:19', '2025-06-09 22:26:36', NULL);
INSERT INTO `users` VALUES (60, 'banhyeuem', 'banhyeuem@gmail.com', NULL, '$2y$12$0U17mgBRX225yanhsVAwPOidg2gzlDECRNr5MGd.4EldKlchMqFO.', NULL, NULL, '0368706552', 'Số nhà 71, phố tiền phong, phường tiên cát', NULL, '2025-06-10', 'male', 0, NULL, 'active', NULL, '2025-06-09 22:51:06', '2025-06-09 22:51:06', NULL);
INSERT INTO `users` VALUES (61, 'binhyeuphong', 'binhyeuphong@gmail.com', NULL, '$2y$12$tEVruqGNCejb6oz7crjL/OFo7AXFnIefNU5xRzoJLRj8K4WRHTq4C', NULL, NULL, '0368706552', 'Số nhà 71, phố tiền phong, phường tiên cát', NULL, '2025-06-03', 'male', 0, NULL, 'active', NULL, '2025-06-09 22:56:06', '2025-06-09 22:56:06', NULL);
INSERT INTO `users` VALUES (62, 'phongyeudai', 'phongyeudai@gmail.com', NULL, '$2y$12$zHwmHrzH88wqN3CG.UBm/u.CKCrSWv7EDrYgt1sBaMmcANr31H3yi', NULL, NULL, '0368706552', 'Số nhà 71, phố tiền phong, phường tiên cát', NULL, '2025-06-18', 'male', 0, NULL, 'active', NULL, '2025-06-09 23:09:33', '2025-06-09 23:09:33', NULL);
INSERT INTO `users` VALUES (63, 'quangyeuphong', 'quangyeuphong@gmail.com', NULL, '$2y$12$dZuU8hy9qkEUF2EGPUEahu/.7JQqRSJi.BnKp8epraxCJbtHR06xS', NULL, NULL, '0368706552', 'Số nhà 71, phố tiền phong, phường tiên cát', NULL, '2025-05-28', 'male', 0, NULL, 'active', NULL, '2025-06-09 23:10:26', '2025-06-09 23:10:26', NULL);
INSERT INTO `users` VALUES (64, 'banhyeumoinguoilam', 'banhyeumoinguoilam@gmail.com', NULL, '$2y$12$WU2ZrEy9C7DPUY73s209pul63Jm.Gjz4ZU8EU5xS7TADWGU.GMf76', NULL, NULL, '0368706552', 'Số nhà 71, phố tiền phong, phường tiên cát', NULL, '2025-05-28', 'male', 0, NULL, 'active', NULL, '2025-06-09 23:17:32', '2025-06-09 23:17:32', NULL);
INSERT INTO `users` VALUES (65, 'banhyeuem1', 'anhnnbph5022611@gmail.com', NULL, '$2y$12$trPYJb39U.BWslPdzF.Eh.hTgCpJ/9cTn4NbgvbdG/Gix5X.6rE6y', NULL, NULL, '0368706552', 'Số nhà 71, phố tiền phong, phường tiên cát', NULL, '2025-05-28', 'male', 0, NULL, 'active', NULL, '2025-06-09 23:19:07', '2025-06-09 23:19:07', NULL);
INSERT INTO `users` VALUES (66, 'banhyeuyeu', 'banhyeuyeu@gmail.com', NULL, '$2y$12$voGS1RNOqE2v1uEf98WUZOvb3sKdIdk2MQ67fCId.tySPtrvKub8S', NULL, NULL, '0368706552', 'Số nhà 71, phố tiền phong, phường tiên cát', NULL, '2025-06-03', 'male', 0, NULL, 'active', NULL, '2025-06-09 23:20:30', '2025-06-09 23:20:30', NULL);
INSERT INTO `users` VALUES (67, 'chuanfifai', 'banh1@gmail.com', NULL, '$2y$12$19SaKtTpXvCNJmcq/Pq/.OsuypGWwXfzIyGwu0u5KrAzE6oHvQkR6', NULL, NULL, '0368706552', 'Số nhà 71, phố tiền phong, phường tiên cát', NULL, '2025-06-03', 'male', 0, '2025-06-09 23:25:44', 'active', 'y54zDVHyxk4eUaRmT0dfWuR1XaM9BzobKAC46dzvdgcr4Cr0RHTaysFotGaC', '2025-06-09 23:25:01', '2025-06-09 23:25:44', NULL);
INSERT INTO `users` VALUES (68, 'banh2', 'banh2@gmail.com', NULL, '$2y$12$5zQ/FCKyacb5iFQikTHqZObDA1laqePq0ttpuxkiY8E6YBBpya/3O', NULL, NULL, '0368706552', 'Số nhà 71, phố tiền phong, phường tiên cát', NULL, '2025-06-10', 'female', 0, '2025-06-09 23:26:16', 'active', NULL, '2025-06-09 23:26:10', '2025-06-09 23:26:16', NULL);
INSERT INTO `users` VALUES (69, 'banh3', 'banh3@gmail.com', NULL, '$2y$12$WOihTFzKzHXwyS/ws4TXzOHXLLIJd4/E9.AIOjJqDd85fsXSdkVL6', NULL, NULL, '0368706552', 'Số nhà 71, phố tiền phong, phường tiên cát', NULL, '2025-06-05', 'male', 0, NULL, 'active', NULL, '2025-06-09 23:26:45', '2025-06-09 23:26:45', NULL);
INSERT INTO `users` VALUES (70, 'banh4', 'banh4@gmail.com', NULL, '$2y$12$LA9.5uLFmc73niHHOwDa5.YXjQlShsndDWiXi/MFb1gnFMWjNFQY6', NULL, NULL, '0368706552', 'Số nhà 71, phố tiền phong, phường tiên cát', NULL, '2025-06-04', 'male', 0, '2025-06-10 21:22:26', 'active', NULL, '2025-06-09 23:30:10', '2025-06-10 21:52:38', NULL);
INSERT INTO `users` VALUES (71, 'Kim Hồng Phong', 'phongk211005@gmail.com', NULL, '$2y$12$rp7twYOYmt9jty9fCUq0qO2soMHTXLPH48ctJ/EtAVj3bLvB6qX56', NULL, NULL, '0973067464', 'Tx. Thái Hòa', NULL, '2025-06-11', 'male', 0, '2025-06-16 22:28:17', 'active', NULL, '2025-06-11 08:41:22', '2025-06-16 22:28:17', NULL);
INSERT INTO `users` VALUES (72, 'Sasasa', 'sasa@gmail.com', NULL, '$2y$12$fgOECBmANwtUwB5yXtKzMe/XE788BzJ9a6yxxFLew4m4vzGiUX2jy', NULL, NULL, '0987233444', 'Hà Nội, Việt Nam', 'uploads/users/1749606552.jpg', '2025-06-11', 'male', 0, '2025-06-11 08:59:52', 'active', NULL, '2025-06-11 08:49:12', '2025-06-11 08:59:52', NULL);
INSERT INTO `users` VALUES (73, 'Dớ Văn Hải', 'hai@gmail.com', NULL, '$2y$12$f8RGEGkRociQvEe4rZP8guR3K3E9HPT6fNn8NF1Hc37OsipBkcKeu', NULL, NULL, '0973067464', 'Tx. Thái Hòa', 'uploads/users/1749608295.jpg', '2025-06-27', 'male', 0, '2025-06-14 22:04:40', 'active', NULL, '2025-06-11 09:18:15', '2025-06-14 22:04:40', NULL);
INSERT INTO `users` VALUES (74, 'Banh là tester', 'banhtester3@gmail.com', NULL, '$2y$12$MU1poTdfxhsbpDKz.Befbedmry0wSyE50fwye.OxAiX.gupl//ZJ6', NULL, NULL, '0368706552', 'Số nhà 71, phố tiền phong, phường tiên cát', '/uploads/avatar/1749632129.jpg', '2025-05-29', 'male', 0, '2025-06-18 21:40:28', 'active', NULL, '2025-06-11 09:25:05', '2025-06-18 21:40:28', NULL);
INSERT INTO `users` VALUES (75, 'âsasd', 'aad@gmail.com', NULL, '$2y$12$vcmY9KDXL7TpT4L6opulIut6rPi/4Bg61u3km4ggB6c/OoG3fUCUm', NULL, NULL, '0368706552', 'Số nhà 71, phố tiền phong, phường tiên cát', NULL, '2025-06-04', 'male', 0, NULL, 'active', NULL, '2025-06-11 21:13:06', '2025-06-11 21:13:06', NULL);
INSERT INTO `users` VALUES (76, 'Mạnh Cường Nguyễn', 'cuongnmph50179@gmail.com', '2025-06-13 21:22:09', '$2y$12$7Bv46Tz3cGlclwO0NGvnROs1LsyWeEeHjQslPzN8qiqvA7u0X8vK6', 'google', '104624917371279928945', NULL, NULL, 'https://lh3.googleusercontent.com/a/ACg8ocK0-i1PegLtv3q4m1wr9zz-1ijX0PlHybhgc1wCGlNH99DdJQ=s96-c', NULL, 'other', 0, '2025-06-13 21:22:09', 'active', NULL, '2025-06-13 21:22:09', '2025-06-13 21:22:09', NULL);
INSERT INTO `users` VALUES (77, 'banhyeuem', 'banh2005@gmail.com', NULL, '$2y$12$UC7fUF/6m4dzpCi6AK/EFu8/XDyOKr2pShqdrCWnD5wr/UyB9hQxG', NULL, NULL, '0368706552', 'Số nhà 71, phố tiền phong, phường tiên cát', NULL, '2025-06-11', 'male', 0, '2025-06-18 21:19:57', 'active', NULL, '2025-06-18 21:16:18', '2025-06-18 21:19:57', NULL);

-- ----------------------------
-- Table structure for variant_attribute_types
-- ----------------------------
DROP TABLE IF EXISTS `variant_attribute_types`;
CREATE TABLE `variant_attribute_types`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `category_ids` json NULL,
  `type` enum('text','color','select') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_required` tinyint(1) NOT NULL DEFAULT 0,
  `status` enum('active','inactive') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `variant_attribute_types_name_unique`(`name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 67 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of variant_attribute_types
-- ----------------------------
INSERT INTO `variant_attribute_types` VALUES (63, 'Màu sắc', '[\"25\", \"26\", \"27\", \"28\"]', 'text', 0, 'active', '2025-06-16 13:42:18', '2025-06-16 13:52:01', NULL);
INSERT INTO `variant_attribute_types` VALUES (64, 'Dung lượng', '[\"25\", \"26\"]', 'text', 0, 'active', '2025-06-16 13:52:28', '2025-06-16 23:23:14', NULL);
INSERT INTO `variant_attribute_types` VALUES (65, 'Màu sắc Iphone', '[\"25\"]', 'text', 0, 'active', '2025-06-17 15:00:33', '2025-06-17 15:03:17', '2025-06-17 15:03:17');
INSERT INTO `variant_attribute_types` VALUES (66, 'Màu sắc Iphone 15', '[\"25\"]', 'text', 0, 'active', '2025-06-19 10:44:59', '2025-06-19 10:44:59', NULL);

-- ----------------------------
-- Table structure for variant_attribute_values
-- ----------------------------
DROP TABLE IF EXISTS `variant_attribute_values`;
CREATE TABLE `variant_attribute_values`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `attribute_type_id` bigint(20) UNSIGNED NOT NULL,
  `value` json NOT NULL,
  `hex` json NULL,
  `status` enum('active','inactive') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `variant_attribute_values_attribute_type_id_index`(`attribute_type_id`) USING BTREE,
  CONSTRAINT `variant_attribute_values_attribute_type_id_foreign` FOREIGN KEY (`attribute_type_id`) REFERENCES `variant_attribute_types` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 160 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of variant_attribute_values
-- ----------------------------
INSERT INTO `variant_attribute_values` VALUES (139, 63, '[\"256GB\"]', '[]', 'active', '2025-06-16 13:46:29', '2025-06-16 13:52:01', '2025-06-16 13:52:01');
INSERT INTO `variant_attribute_values` VALUES (140, 63, '[\"152GB\"]', '[]', 'active', '2025-06-16 13:46:29', '2025-06-16 13:52:01', '2025-06-16 13:52:01');
INSERT INTO `variant_attribute_values` VALUES (141, 63, '[\"Titan Sa Mạc\"]', '[\"#c4ab97\"]', 'active', '2025-06-16 13:46:30', '2025-06-16 13:46:30', NULL);
INSERT INTO `variant_attribute_values` VALUES (142, 63, '[\"Titan đen\"]', '[\"#3f4042\"]', 'active', '2025-06-16 13:46:30', '2025-06-16 13:46:30', NULL);
INSERT INTO `variant_attribute_values` VALUES (143, 63, '[\"Titan tự nhiên\"]', '[\"#bab4a9\"]', 'active', '2025-06-16 13:46:30', '2025-06-16 13:46:30', NULL);
INSERT INTO `variant_attribute_values` VALUES (144, 63, '[\"Titan trắng\"]', '[\"#f2f1eb\"]', 'active', '2025-06-16 13:46:30', '2025-06-16 13:46:30', NULL);
INSERT INTO `variant_attribute_values` VALUES (145, 64, '[\"256GB\"]', '[]', 'active', '2025-06-16 13:52:53', '2025-06-16 23:11:59', '2025-06-16 23:11:59');
INSERT INTO `variant_attribute_values` VALUES (146, 64, '[\"512GB\"]', '[]', 'active', '2025-06-16 13:52:53', '2025-06-16 23:11:59', '2025-06-16 23:11:59');
INSERT INTO `variant_attribute_values` VALUES (147, 64, '[\"1TB\"]', '[]', 'active', '2025-06-16 13:52:53', '2025-06-16 23:11:59', '2025-06-16 23:11:59');
INSERT INTO `variant_attribute_values` VALUES (148, 64, '[\"256GB\"]', '[]', 'active', '2025-06-16 23:21:34', '2025-06-16 23:21:34', NULL);
INSERT INTO `variant_attribute_values` VALUES (149, 64, '[\"512GB\"]', '[]', 'active', '2025-06-16 23:21:34', '2025-06-16 23:21:34', NULL);
INSERT INTO `variant_attribute_values` VALUES (150, 64, '[\"1TB\"]', '[]', 'active', '2025-06-16 23:21:34', '2025-06-16 23:21:34', NULL);
INSERT INTO `variant_attribute_values` VALUES (151, 63, '[\"Xanh da trời nhạt\"]', '[\"#9ca6ca\"]', 'active', '2025-06-16 23:48:01', '2025-06-16 23:48:01', NULL);
INSERT INTO `variant_attribute_values` VALUES (152, 63, '[\"Xanh đen\"]', '[\"#17213e\"]', 'active', '2025-06-16 23:48:01', '2025-06-16 23:48:01', NULL);
INSERT INTO `variant_attribute_values` VALUES (153, 63, '[\"Vàng\"]', '[\"#f4e8cf\"]', 'active', '2025-06-16 23:48:01', '2025-06-16 23:48:01', NULL);
INSERT INTO `variant_attribute_values` VALUES (154, 65, '[\"Hồng\"]', '[\"#ffe8e8\"]', 'active', '2025-06-17 15:01:57', '2025-06-17 15:01:57', NULL);
INSERT INTO `variant_attribute_values` VALUES (155, 66, '[\"Vàng nhạt\"]', '[\"#ede6c8\"]', 'active', '2025-06-19 10:45:51', '2025-06-19 10:46:57', NULL);
INSERT INTO `variant_attribute_values` VALUES (156, 66, '[\"Xanh lá nhạt\"]', '[\"#d0d9ca\"]', 'active', '2025-06-19 10:45:51', '2025-06-19 10:46:57', NULL);
INSERT INTO `variant_attribute_values` VALUES (157, 66, '[\"Hồng nhạt\"]', '[\"#ebd3d4\"]', 'active', '2025-06-19 10:45:51', '2025-06-19 10:46:57', NULL);
INSERT INTO `variant_attribute_values` VALUES (158, 66, '[\"Xanh dương nhạt\"]', '[\"#d5dddf\"]', 'active', '2025-06-19 10:45:51', '2025-06-19 10:46:57', NULL);
INSERT INTO `variant_attribute_values` VALUES (159, 66, '[\"Đen\"]', '[\"#4b4f50\"]', 'active', '2025-06-19 10:45:51', '2025-06-19 10:46:57', NULL);

-- ----------------------------
-- Table structure for variant_combinations
-- ----------------------------
DROP TABLE IF EXISTS `variant_combinations`;
CREATE TABLE `variant_combinations`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `variant_id` bigint(20) UNSIGNED NOT NULL,
  `attribute_value_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `variant_combinations_variant_id_attribute_value_id_unique`(`variant_id`, `attribute_value_id`) USING BTREE,
  INDEX `variant_combinations_attribute_value_id_foreign`(`attribute_value_id`) USING BTREE,
  INDEX `variant_combinations_variant_id_index`(`variant_id`) USING BTREE,
  INDEX `variant_combinations_attribute_value_id_index`(`attribute_value_id`) USING BTREE,
  CONSTRAINT `variant_combinations_attribute_value_id_foreign` FOREIGN KEY (`attribute_value_id`) REFERENCES `variant_attribute_values` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `variant_combinations_variant_id_foreign` FOREIGN KEY (`variant_id`) REFERENCES `product_variants` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 313 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of variant_combinations
-- ----------------------------
INSERT INTO `variant_combinations` VALUES (300, 239, 141, '2025-06-17 13:23:02', '2025-06-18 14:49:55', NULL);
INSERT INTO `variant_combinations` VALUES (301, 239, 150, '2025-06-17 13:23:02', '2025-06-18 14:49:55', NULL);
INSERT INTO `variant_combinations` VALUES (302, 240, 142, '2025-06-17 13:23:02', '2025-06-18 14:49:56', NULL);
INSERT INTO `variant_combinations` VALUES (303, 240, 150, '2025-06-17 13:23:02', '2025-06-18 14:49:56', NULL);
INSERT INTO `variant_combinations` VALUES (308, 243, 142, '2025-06-19 13:16:08', '2025-06-19 13:16:08', NULL);
INSERT INTO `variant_combinations` VALUES (309, 244, 144, '2025-06-19 13:21:03', '2025-06-19 13:21:03', NULL);
INSERT INTO `variant_combinations` VALUES (310, 244, 148, '2025-06-19 13:21:03', '2025-06-19 13:21:03', NULL);
INSERT INTO `variant_combinations` VALUES (311, 245, 143, '2025-06-19 13:23:03', '2025-06-19 13:23:03', NULL);
INSERT INTO `variant_combinations` VALUES (312, 245, 149, '2025-06-19 13:23:03', '2025-06-19 13:23:03', NULL);

-- ----------------------------
-- Table structure for vouchers
-- ----------------------------
DROP TABLE IF EXISTS `vouchers`;
CREATE TABLE `vouchers`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` enum('fixed','percentage','free_shipping') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `purpose` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'product_discount',
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `value` decimal(10, 2) NOT NULL,
  `min_order_amount` decimal(10, 2) NULL DEFAULT NULL,
  `expires_at` datetime NOT NULL,
  `usage_limit` int(11) NOT NULL,
  `used_count` int(11) NOT NULL DEFAULT 0,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `per_user_limit` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `vouchers_code_unique`(`code`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of vouchers
-- ----------------------------
INSERT INTO `vouchers` VALUES (5, 'WELCOME10', 'percentage', 'product_discount', 'Giảm 10% cho đơn hàng đầu tiên.', 10.00, NULL, '2025-06-19 07:27:09', 100, 0, 1, 1, '2025-05-20 07:27:09', '2025-05-20 07:27:09');
INSERT INTO `vouchers` VALUES (6, 'FREESHIP', 'fixed', 'free_shipping', 'Miễn phí vận chuyển cho đơn hàng trên 200,000 VNĐ.', 50000.00, NULL, '2025-06-19 07:27:09', 100, 0, 1, 1, '2025-05-20 07:27:11', '2025-05-20 07:27:11');
INSERT INTO `vouchers` VALUES (7, 'SUMMER20', 'percentage', 'product_discount', 'Giảm giá 20% mùa hè.', 20.00, NULL, '2025-06-19 07:27:09', 100, 0, 0, 1, '2025-05-20 07:27:18', '2025-05-20 07:27:18');
INSERT INTO `vouchers` VALUES (8, 'NOEXPIRE', 'fixed', 'product_discount', 'Voucher không giới hạn thời gian.', 100000.00, NULL, '2025-06-19 07:27:09', 100, 0, 1, 1, '2025-05-20 07:27:19', '2025-05-20 07:27:19');

-- ----------------------------
-- Table structure for wishlists
-- ----------------------------
DROP TABLE IF EXISTS `wishlists`;
CREATE TABLE `wishlists`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `wishlists_user_id_product_id_variant_id_unique`(`user_id`, `product_id`) USING BTREE,
  INDEX `wishlists_product_id_foreign`(`product_id`) USING BTREE,
  CONSTRAINT `wishlists_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `wishlists_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 111 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wishlists
-- ----------------------------

SET FOREIGN_KEY_CHECKS = 1;
