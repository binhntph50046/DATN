-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: localhost
-- Thời gian đã tạo: Th5 12, 2025 lúc 08:42 PM
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
-- Cấu trúc bảng cho bảng `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `content` longtext COLLATE utf8mb4_unicode_ci,
  `discount_price` decimal(15,2) DEFAULT NULL,
  `stock` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Số lượng tồn kho cho sản phẩm không có biến thể',
  `category_id` bigint(20) UNSIGNED NOT NULL,
  `model` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `series` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `warranty_months` int(11) NOT NULL DEFAULT '12',
  `is_featured` tinyint(1) NOT NULL DEFAULT '0',
  `status` enum('active','inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `has_variants` tinyint(1) NOT NULL DEFAULT '0' COMMENT '1: Có biến thể, 0: Không có biến thể',
  `purchase_price` decimal(15,2) DEFAULT NULL COMMENT 'Giá nhập, dùng cho sản phẩm không có biến thể',
  `selling_price` decimal(15,2) DEFAULT NULL COMMENT 'Giá bán, dùng cho sản phẩm không có biến thể'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `products`
--

INSERT INTO `products` (`id`, `name`, `slug`, `description`, `content`, `discount_price`, `stock`, `category_id`, `model`, `series`, `warranty_months`, `is_featured`, `status`, `image`, `created_at`, `updated_at`, `deleted_at`, `has_variants`, `purchase_price`, `selling_price`) VALUES
(4, 'iPhone 15 Pro Max 256GB', 'iphone-15-pro-max-256gb', 'Bộ sản phẩm gồm: Hộp, Sách hướng dẫn, Cây lấy sim, Cáp Type C\r\n Hư gì đổi nấy 12 tháng tại 3043 siêu thị trên toàn quốc Xem chi tiết chính sách bảo hành, đổi trả\r\n Bảo hành chính hãng 1 năm\r\n Giao hàng nhanh toàn quốc Xem chi tiết\r\n Tổng đài: 1900.9696.42 (8:00 - 21:30)', '<p>Khuyến m&atilde;i trị gi&aacute; 500.000₫<small>Gi&aacute; v&agrave; khuyến m&atilde;i dự kiến &aacute;p dụng đến 23:59 | 31/05</small></p>\r\n\r\n<p>&nbsp;<strong>Phiếu mua h&agrave;ng AirPods, Apple Watch, Macbook trị gi&aacute; 500,000đ</strong></p>\r\n\r\n<p>&nbsp;<strong>Phiếu mua h&agrave;ng &aacute;p dụng mua Sạc dự ph&ograve;ng (trừ h&atilde;ng AVA+, Hydrus), đồng hồ th&ocirc;ng minh (trừ Apple), Tai nghe v&agrave; Loa bluetooth (h&atilde;ng JBL, Marshall,Harmar Kardon ,Sony) trị gi&aacute; 100.000đ</strong></p>\r\n\r\n<p>&nbsp;<strong>Thu cũ đổi mới: Giảm đến 2,000,000đ (Kh&ocirc;ng k&egrave;m ưu đ&atilde;i thanh to&aacute;n qua cổng, mua k&egrave;m)&nbsp;<a href=\"https://www.thegioididong.com/thu-cu-doi-moi\">Xem chi tiết</a></strong></p>\r\n\r\n<p>&nbsp;<strong>Nhập m&atilde; VNPAYTGDD2 giảm từ 80,000đ đến 150,000đ (&aacute;p dụng t&ugrave;y gi&aacute; trị đơn h&agrave;ng) khi thanh to&aacute;n qua VNPAY-QR&nbsp;<a href=\"https://www.topzone.vn/tekzone/nhap-ma-vnpaytgdd1-giam-toi-da-150k-khi-thanh-toan-qua-vnpay-qr-1573704\" target=\"_blank\">(Xem chi tiết tại đ&acirc;y)</a></strong></p>', NULL, 0, 3, 'iPhone 15 Pro', 'Pro Max', 12, 1, 'active', 'uploads/products/1746843520.png', '2025-05-10 01:38:42', '2025-05-10 02:18:40', NULL, 0, 20000000.00, 25000000.00);

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `products_slug_unique` (`slug`),
  ADD KEY `products_category_id_foreign` (`category_id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
