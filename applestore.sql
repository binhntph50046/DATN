-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: localhost
-- Thời gian đã tạo: Th5 13, 2025 lúc 04:23 PM
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
  `link` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('active','inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `order` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `banners`
--

INSERT INTO `banners` (`id`, `title`, `image`, `link`, `status`, `order`, `created_at`, `updated_at`) VALUES
(1, 'Banner 1', 'banners/lVtFKahRZ7dTW16U5nwBAT89MAdSHxuLgYU61X0T.jpg', NULL, 'active', 1, '2025-05-08 15:17:47', '2025-05-11 05:58:32'),
(2, 'Banner 2', 'banner2.jpg', NULL, 'inactive', 2, '2025-05-08 15:17:48', '2025-05-11 05:58:32'),
(3, 'Banner 3', 'banner3.jpg', NULL, 'active', 3, '2025-05-08 15:17:48', '2025-05-08 16:11:55'),
(4, 'Banner 4', 'banner4.jpg', NULL, 'inactive', 7, '2025-05-08 15:17:49', '2025-05-08 16:12:00'),
(5, 'Banner 5', 'banner5.jpg', NULL, 'active', 4, '2025-05-08 15:17:50', '2025-05-08 16:12:00'),
(7, 'Banner 7', 'banner7.jpg', NULL, 'active', 9, '2025-05-08 15:17:51', '2025-05-08 16:08:00'),
(8, 'Banner 8', 'banner8.jpg', NULL, 'inactive', 11, '2025-05-08 15:17:51', '2025-05-10 01:20:29'),
(9, 'Banner 9', 'banner9.jpg', NULL, 'active', 8, '2025-05-08 15:17:51', '2025-05-08 16:08:13'),
(12, 'NEW', 'banners/l6tY9qWWLVxdnhIoMGhdkz8IAdEZWEkauPFamCDq.jpg', 'http://datn.test:8080/admin/banners', 'inactive', 10, '2025-05-08 16:10:54', '2025-05-10 01:20:29');

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

--
-- Đang đổ dữ liệu cho bảng `blogs`
--

INSERT INTO `blogs` (`id`, `title`, `slug`, `content`, `image`, `category_id`, `author_id`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Làm thế nào để học Laravel hiệu quả?', 'lam-the-nao-de-hoc-laravel-hieu-qua', 'Nội dung chi tiết về cách học Laravel nhanh và dễ hiểu...', 'blog1.jpg', 11, 1, 'active', '2025-05-09 06:33:15', '2025-05-12 13:35:20', '2025-05-12 13:35:20'),
(3, 'Laravel 12 có gì mới?', 'laravel-12-co-gi-moi', 'Khám phá các tính năng nổi bật của Laravel phiên bản mới nhất...', 'blog3.jpg', 11, 1, 'inactive', '2025-05-09 06:33:15', '2025-05-09 14:55:06', '2025-05-09 14:55:06'),
(4, 'Làm sao để mua được 1 sản phẩm Iphone ưng ý ?', 'lam-sao-de-mua-duoc-1-san-pham-iphone-ung-y', '<h2>L&agrave;m sao để mua được một sản phẩm iPhone ưng &yacute;?</h2>\r\n\r\n<p><img alt=\"\" src=\"https://cdn.tgdd.vn/Files/2022/09/23/1471383/he-dieu-hanh-ios-la-gi-14.jpg\" style=\"height:394px; width:700px\" /></p>\r\n\r\n<p>Mua một chiếc iPhone kh&ocirc;ng phải l&agrave; một quyết định đơn giản, đặc biệt khi bạn muốn lựa chọn một sản phẩm vừa &yacute; v&agrave; ph&ugrave; hợp với nhu cầu sử dụng. Với nhiều d&ograve;ng iPhone kh&aacute;c nhau tr&ecirc;n thị trường, bạn c&oacute; thể cảm thấy bối rối khi phải chọn lựa giữa iPhone 15, iPhone 14, iPhone 13 hoặc thậm ch&iacute; c&aacute;c d&ograve;ng cũ hơn. B&agrave;i viết dưới đ&acirc;y sẽ hướng dẫn bạn c&aacute;ch chọn mua một chiếc iPhone ưng &yacute;, từ việc x&aacute;c định nhu cầu đến việc t&igrave;m kiếm nơi b&aacute;n uy t&iacute;n.</p>\r\n\r\n<h3>1. X&aacute;c định nhu cầu sử dụng iPhone</h3>\r\n\r\n<p>Trước khi bắt đầu chọn mua iPhone, điều quan trọng đầu ti&ecirc;n l&agrave; x&aacute;c định r&otilde; mục đ&iacute;ch v&agrave; nhu cầu sử dụng của m&igrave;nh. Bạn cần một chiếc điện thoại chỉ để phục vụ nhu cầu cơ bản như nghe gọi, nhắn tin, hay bạn muốn một chiếc m&aacute;y c&oacute; cấu h&igrave;nh mạnh mẽ để chơi game, chụp ảnh chất lượng cao, hoặc sử dụng c&aacute;c phần mềm đồ họa chuy&ecirc;n nghiệp?</p>\r\n\r\n<ul>\r\n	<li>\r\n	<p><strong>Nếu nhu cầu cơ bản:</strong> Bạn c&oacute; thể chọn c&aacute;c mẫu iPhone cũ như iPhone 13 hoặc iPhone SE.</p>\r\n	</li>\r\n	<li>\r\n	<p><strong>Nếu nhu cầu chơi game hoặc chụp ảnh cao cấp:</strong> iPhone 15, iPhone 14 Pro Max với chip A17 Bionic v&agrave; hệ thống camera n&acirc;ng cao sẽ l&agrave; lựa chọn tuyệt vời.</p>\r\n	</li>\r\n</ul>\r\n\r\n<h3>2. Chọn lựa phi&ecirc;n bản iPhone ph&ugrave; hợp</h3>\r\n\r\n<p><img alt=\"\" src=\"https://news.khangz.com/wp-content/uploads/2022/07/Ma-iPhone-cac-nuoc-4.jpg\" style=\"height:450px; width:800px\" /></p>\r\n\r\n<p>iPhone lu&ocirc;n c&oacute; nhiều phi&ecirc;n bản kh&aacute;c nhau với c&aacute;c t&iacute;nh năng v&agrave; mức gi&aacute; kh&aacute;c nhau. Một trong những yếu tố quan trọng khi chọn iPhone l&agrave; quyết định giữa phi&ecirc;n bản thường, phi&ecirc;n bản Pro hay Pro Max.</p>\r\n\r\n<ul>\r\n	<li>\r\n	<p><strong>iPhone thường</strong>: Đ&acirc;y l&agrave; lựa chọn hợp l&yacute; nếu bạn kh&ocirc;ng cần qu&aacute; nhiều t&iacute;nh năng cao cấp, nhưng vẫn muốn một chiếc điện thoại mạnh mẽ v&agrave; c&oacute; camera ổn định.</p>\r\n	</li>\r\n	<li>\r\n	<p><strong>iPhone Pro/Pro Max</strong>: D&agrave;nh cho những ai cần hiệu suất cao hơn, m&agrave;n h&igrave;nh đẹp hơn v&agrave; hệ thống camera chuy&ecirc;n nghiệp hơn.</p>\r\n	</li>\r\n</ul>\r\n\r\n<h3>3. Lựa chọn dung lượng bộ nhớ</h3>\r\n\r\n<p>iPhone c&oacute; c&aacute;c phi&ecirc;n bản với dung lượng bộ nhớ kh&aacute;c nhau, từ 64GB đến 1TB. Nếu bạn l&agrave; người sử dụng nhiều ứng dụng, chụp ảnh v&agrave; quay video thường xuy&ecirc;n, th&igrave; việc chọn phi&ecirc;n bản c&oacute; dung lượng bộ nhớ lớn l&agrave; rất quan trọng.</p>\r\n\r\n<ul>\r\n	<li>\r\n	<p><strong>64GB</strong>: Ph&ugrave; hợp với những ai sử dụng điện thoại chủ yếu để nghe gọi, lướt web.</p>\r\n	</li>\r\n	<li>\r\n	<p><strong>128GB v&agrave; 256GB</strong>: Lựa chọn hợp l&yacute; cho người d&ugrave;ng b&igrave;nh thường với nhu cầu lưu trữ ảnh v&agrave; video.</p>\r\n	</li>\r\n	<li>\r\n	<p><strong>512GB v&agrave; 1TB</strong>: D&agrave;nh cho những người c&oacute; nhu cầu lưu trữ lớn, chơi game, quay video 4K.</p>\r\n	</li>\r\n</ul>\r\n\r\n<h3>4. So s&aacute;nh gi&aacute; v&agrave; t&igrave;m mua ở địa chỉ uy t&iacute;n</h3>\r\n\r\n<p>Để mua được một chiếc iPhone ưng &yacute; với mức gi&aacute; tốt, bạn cần so s&aacute;nh gi&aacute; ở c&aacute;c cửa h&agrave;ng v&agrave; hệ thống b&aacute;n lẻ uy t&iacute;n. Ngo&agrave;i c&aacute;c cửa h&agrave;ng ch&iacute;nh h&atilde;ng của Apple, bạn cũng c&oacute; thể t&igrave;m mua iPhone tại c&aacute;c đại l&yacute; ph&acirc;n phối ch&iacute;nh thức hoặc c&aacute;c cửa h&agrave;ng trực tuyến.</p>\r\n\r\n<p>Lưu &yacute;:</p>\r\n\r\n<ul>\r\n	<li>\r\n	<p><strong>Kiểm tra nguồn gốc sản phẩm</strong>: Đảm bảo rằng chiếc iPhone bạn mua l&agrave; h&agrave;ng ch&iacute;nh h&atilde;ng, c&oacute; bảo h&agrave;nh đầy đủ.</p>\r\n	</li>\r\n	<li>\r\n	<p><strong>Chọn cửa h&agrave;ng c&oacute; ch&iacute;nh s&aacute;ch đổi trả r&otilde; r&agrave;ng</strong>: Để đảm bảo quyền lợi của m&igrave;nh nếu sản phẩm gặp phải sự cố.</p>\r\n	</li>\r\n</ul>\r\n\r\n<h3>5. Kiểm tra c&aacute;c chương tr&igrave;nh khuyến m&atilde;i, giảm gi&aacute;</h3>\r\n\r\n<p>Apple v&agrave; c&aacute;c cửa h&agrave;ng b&aacute;n lẻ thường xuy&ecirc;n c&oacute; c&aacute;c chương tr&igrave;nh khuyến m&atilde;i hoặc giảm gi&aacute; v&agrave;o c&aacute;c dịp lễ, Tết, hoặc trong c&aacute;c sự kiện đặc biệt. Đ&acirc;y l&agrave; cơ hội để bạn sở hữu một chiếc iPhone với mức gi&aacute; ưu đ&atilde;i.</p>\r\n\r\n<h3>6. Lựa chọn m&agrave;u sắc v&agrave; thiết kế</h3>\r\n\r\n<p>iPhone c&oacute; nhiều m&agrave;u sắc v&agrave; kiểu d&aacute;ng để bạn lựa chọn. D&ugrave; t&iacute;nh năng quan trọng nhất l&agrave; hiệu suất, nhưng thiết kế v&agrave; m&agrave;u sắc cũng ảnh hưởng đến cảm gi&aacute;c của người d&ugrave;ng. Bạn c&oacute; thể lựa chọn giữa c&aacute;c m&agrave;u như: đen, trắng, v&agrave;ng, xanh hoặc c&aacute;c m&agrave;u đặc biệt kh&aacute;c t&ugrave;y thuộc v&agrave;o phi&ecirc;n bản.</p>\r\n\r\n<h3>7. Tham khảo c&aacute;c đ&aacute;nh gi&aacute; v&agrave; review từ người d&ugrave;ng</h3>\r\n\r\n<p><img alt=\"\" src=\"https://24hstore.vn/upload_images/images/2022/10/21/iphone-14-series-2(1).jpg\" /></p>\r\n\r\n<p>Trước khi quyết định mua, đừng qu&ecirc;n tham khảo c&aacute;c đ&aacute;nh gi&aacute; v&agrave; phản hồi từ người d&ugrave;ng thực tế. C&aacute;c trang web c&ocirc;ng nghệ, diễn đ&agrave;n hoặc c&aacute;c video review tr&ecirc;n YouTube sẽ gi&uacute;p bạn hiểu r&otilde; hơn về trải nghiệm người d&ugrave;ng v&agrave; chất lượng sản phẩm.</p>\r\n\r\n<h3>8. Sử dụng c&aacute;c dịch vụ gia tăng (AppleCare, iCloud, v.v.)</h3>\r\n\r\n<p>Apple cung cấp c&aacute;c dịch vụ gia tăng như <strong>AppleCare</strong> để bảo vệ thiết bị của bạn trong suốt qu&aacute; tr&igrave;nh sử dụng. Nếu bạn c&oacute; nhu cầu lưu trữ đ&aacute;m m&acirc;y, <strong>iCloud</strong> l&agrave; dịch vụ tuyệt vời để sao lưu v&agrave; đồng bộ dữ liệu giữa c&aacute;c thiết bị.</p>\r\n\r\n<h3>Kết luận</h3>\r\n\r\n<p>Mua một chiếc iPhone ưng &yacute; kh&ocirc;ng chỉ phụ thuộc v&agrave;o việc chọn mẫu m&aacute;y m&agrave; c&ograve;n li&ecirc;n quan đến nhu cầu sử dụng, dung lượng bộ nhớ v&agrave; mức gi&aacute; bạn sẵn s&agrave;ng chi trả. H&atilde;y c&acirc;n nhắc kỹ lưỡng c&aacute;c yếu tố như t&iacute;nh năng, thiết kế v&agrave; chương tr&igrave;nh khuyến m&atilde;i để lựa chọn được chiếc iPhone ph&ugrave; hợp nhất với m&igrave;nh.<br />\r\nLink tham khảo:&nbsp;<a href=\"https://www.youtube.com/watch?v=mUafl7h5Prk\">https://www.youtube.com/watch?v=mUafl7h5Prk</a></p>', 'uploads/blogs/1746784132_681dcf84e97ed.jpg', 12, NULL, 'active', '2025-05-09 08:08:15', '2025-05-09 09:48:52', NULL),
(6, 'Làm sao có thể mua được 1 chiếc Macbook tốt?', 'lam-sao-co-the-mua-duoc-1-chiec-macbook-tot', '<h2>L&agrave;m sao để mua được một chiếc MacBook tốt?</h2>\r\n\r\n<p>Mua một chiếc MacBook kh&ocirc;ng chỉ đơn thuần l&agrave; chọn một thiết bị c&ocirc;ng nghệ cao, m&agrave; c&ograve;n l&agrave; đầu tư cho trải nghiệm l&agrave;m việc, học tập v&agrave; giải tr&iacute; l&acirc;u d&agrave;i. Để <strong>mua MacBook tốt</strong> v&agrave; ph&ugrave; hợp với nhu cầu, bạn cần c&acirc;n nhắc nhiều yếu tố từ cấu h&igrave;nh, d&ograve;ng sản phẩm đến địa chỉ mua h&agrave;ng uy t&iacute;n. Dưới đ&acirc;y l&agrave; hướng dẫn chi tiết gi&uacute;p bạn sở hữu chiếc MacBook ưng &yacute; nhất.</p>\r\n\r\n<hr />\r\n<h3>1. X&aacute;c định r&otilde; nhu cầu sử dụng</h3>\r\n\r\n<p>Trước khi bước v&agrave;o qu&aacute; tr&igrave;nh <strong>mua MacBook</strong>, h&atilde;y tự hỏi:</p>\r\n\r\n<ul>\r\n	<li>\r\n	<p><strong>Bạn d&ugrave;ng MacBook để l&agrave;m g&igrave;?</strong></p>\r\n\r\n	<ul>\r\n		<li>\r\n		<p>Văn ph&ograve;ng, soạn thảo, lướt web: c&oacute; thể chọn MacBook Air hoặc Pro cấu h&igrave;nh cơ bản.</p>\r\n		</li>\r\n		<li>\r\n		<p>Đồ họa, dựng video, lập tr&igrave;nh: ưu ti&ecirc;n MacBook Pro M1/M2 cho hiệu năng cao.</p>\r\n		</li>\r\n		<li>\r\n		<p>Học tập, giải tr&iacute;: MacBook Air M1/M2 đ&aacute;p ứng tốt.</p>\r\n		</li>\r\n	</ul>\r\n	</li>\r\n	<li>\r\n	<p><strong>Khi n&agrave;o bạn cần n&acirc;ng cấp?</strong></p>\r\n\r\n	<ul>\r\n		<li>\r\n		<p>Nếu laptop hiện tại vẫn chạy mượt, bạn c&oacute; thể chờ khuyến m&atilde;i hoặc phi&ecirc;n bản mới.</p>\r\n		</li>\r\n		<li>\r\n		<p>Ngược lại, mua ngay phi&ecirc;n bản ch&iacute;nh h&atilde;ng để kịp sử dụng.</p>\r\n		</li>\r\n	</ul>\r\n	</li>\r\n</ul>\r\n\r\n<p><img alt=\"\" src=\"https://cdn.tgdd.vn/Files/2018/12/15/1138288/ts-2017-apple-buying-guide_800x450.jpg\" style=\"height:450px; width:800px\" /></p>\r\n\r\n<hr />\r\n<h3>2. Lựa chọn d&ograve;ng MacBook ph&ugrave; hợp</h3>\r\n\r\n<p>Apple hiện c&oacute; 2 d&ograve;ng ch&iacute;nh:</p>\r\n\r\n<ol>\r\n	<li>\r\n	<p><strong>MacBook Air</strong></p>\r\n\r\n	<ul>\r\n		<li>\r\n		<p>Mỏng nhẹ, pin l&acirc;u (~15&ndash;18 giờ).</p>\r\n		</li>\r\n		<li>\r\n		<p>Chip M1/M2 đủ mạnh cho hầu hết c&ocirc;ng việc văn ph&ograve;ng, giải tr&iacute;.</p>\r\n		</li>\r\n		<li>\r\n		<p>Gi&aacute; khởi điểm dễ tiếp cận.</p>\r\n		</li>\r\n	</ul>\r\n	</li>\r\n	<li>\r\n	<p><strong>MacBook Pro</strong></p>\r\n\r\n	<ul>\r\n		<li>\r\n		<p>Hiệu năng cao, ph&ugrave; hợp đồ họa, lập tr&igrave;nh, dựng phim.</p>\r\n		</li>\r\n		<li>\r\n		<p>C&oacute; phi&ecirc;n bản 13&rdquo;, 14&rdquo;, 16&rdquo; với cấu h&igrave;nh M2 Pro, M2 Max.</p>\r\n		</li>\r\n		<li>\r\n		<p>Thiết kế d&agrave;y hơn, pin tốt hơn nhưng gi&aacute; cao hơn Air.</p>\r\n		</li>\r\n	</ul>\r\n	</li>\r\n</ol>\r\n\r\n<p><strong>Lời khuy&ecirc;n SEO:</strong> Khi t&igrave;m kiếm &ldquo;mua MacBook tốt&rdquo;, bạn n&ecirc;n k&egrave;m th&ecirc;m nhu cầu như &ldquo;MacBook Air gi&aacute; rẻ&rdquo; hoặc &ldquo;MacBook Pro cho lập tr&igrave;nh&rdquo; để thu hẹp kết quả.</p>\r\n\r\n<hr />\r\n<h3>3. Chọn cấu h&igrave;nh: CPU, RAM v&agrave; bộ nhớ</h3>\r\n\r\n<ul>\r\n	<li>\r\n	<p><strong>Chip xử l&yacute; (CPU/GPU):</strong></p>\r\n\r\n	<ul>\r\n		<li>\r\n		<p>Nếu chỉ l&agrave;m việc nhẹ, M1/M2 ti&ecirc;u chuẩn đ&atilde; qu&aacute; đủ.</p>\r\n		</li>\r\n		<li>\r\n		<p>Với c&ocirc;ng việc nặng, chọn M2 Pro/Max hoặc M1 Pro/Max.</p>\r\n		</li>\r\n	</ul>\r\n	</li>\r\n	<li>\r\n	<p><strong>RAM:</strong></p>\r\n\r\n	<ul>\r\n		<li>\r\n		<p>8 GB đủ cho đa số nhu cầu cơ bản.</p>\r\n		</li>\r\n		<li>\r\n		<p>16 GB hoặc 32 GB cho đồ họa, dựng video, chạy ảo h&oacute;a.</p>\r\n		</li>\r\n	</ul>\r\n	</li>\r\n	<li>\r\n	<p><strong>Bộ nhớ trong (SSD):</strong></p>\r\n\r\n	<ul>\r\n		<li>\r\n		<p>256 GB cho văn ph&ograve;ng, học tập.</p>\r\n		</li>\r\n		<li>\r\n		<p>512 GB &ndash; 1 TB cho người cần lưu trữ nhiều file h&igrave;nh ảnh, video.</p>\r\n		</li>\r\n	</ul>\r\n	</li>\r\n</ul>\r\n\r\n<hr />\r\n<h3>4. Mua ở đ&acirc;u để đảm bảo ch&iacute;nh h&atilde;ng v&agrave; gi&aacute; tốt</h3>\r\n\r\n<ul>\r\n	<li>\r\n	<p><strong>Apple Store ch&iacute;nh h&atilde;ng:</strong></p>\r\n\r\n	<ul>\r\n		<li>\r\n		<p>Đảm bảo h&agrave;ng mới 100 %, ch&iacute;nh s&aacute;ch bảo h&agrave;nh to&agrave;n cầu.</p>\r\n		</li>\r\n		<li>\r\n		<p>Gi&aacute; ni&ecirc;m yết, &iacute;t khuyến m&atilde;i.</p>\r\n		</li>\r\n	</ul>\r\n	</li>\r\n	<li>\r\n	<p><strong>Đại l&yacute; uỷ quyền Apple (APR):</strong></p>\r\n\r\n	<ul>\r\n		<li>\r\n		<p>FPT Shop, CellphoneS, Thế Giới Di Động&hellip;</p>\r\n		</li>\r\n		<li>\r\n		<p>Thường c&oacute; chương tr&igrave;nh trả g&oacute;p 0 %, qu&agrave; tặng k&egrave;m.</p>\r\n		</li>\r\n	</ul>\r\n	</li>\r\n	<li>\r\n	<p><strong>Mua x&aacute;ch tay uy t&iacute;n:</strong></p>\r\n\r\n	<ul>\r\n		<li>\r\n		<p>Gi&aacute; rẻ hơn một ch&uacute;t, nhưng cần kiểm tra kỹ nguồn gốc, bảo h&agrave;nh.</p>\r\n		</li>\r\n	</ul>\r\n	</li>\r\n	<li>\r\n	<p><strong>Săn m&atilde; giảm gi&aacute; &amp; khuyến m&atilde;i:</strong></p>\r\n\r\n	<ul>\r\n		<li>\r\n		<p>Theo d&otilde;i c&aacute;c sự kiện Apple Event, Black Friday, hoặc ưu đ&atilde;i cuối năm.</p>\r\n		</li>\r\n		<li>\r\n		<p>Nhập m&atilde; giảm 5&ndash;10 % tại website APR.</p>\r\n		</li>\r\n	</ul>\r\n	</li>\r\n</ul>\r\n\r\n<hr />\r\n<h3>5. Kiểm tra kỹ trước khi nhận m&aacute;y</h3>\r\n\r\n<p>Khi nhận m&aacute;y, bạn n&ecirc;n:</p>\r\n\r\n<ol>\r\n	<li>\r\n	<p><strong>Kiểm tra ngoại h&igrave;nh:</strong> Kh&ocirc;ng trầy xước, cấn m&oacute;p.</p>\r\n	</li>\r\n	<li>\r\n	<p><strong>Khởi động v&agrave; kiểm tra cấu h&igrave;nh:</strong> V&agrave;o <strong> &rarr; About This Mac</strong> để xem chip, RAM, SSD.</p>\r\n	</li>\r\n	<li>\r\n	<p><strong>Test m&agrave;n h&igrave;nh v&agrave; loa:</strong> Mở video, đổi g&oacute;c độ xem m&agrave;n h&igrave;nh c&oacute; bị &aacute;m m&agrave;u hay kh&ocirc;ng.</p>\r\n	</li>\r\n	<li>\r\n	<p><strong>Kiểm tra b&agrave;n ph&iacute;m v&agrave; trackpad:</strong> Bấm thử mọi ph&iacute;m, thử cử chỉ trackpad.</p>\r\n	</li>\r\n	<li>\r\n	<p><strong>Xem hạn bảo h&agrave;nh:</strong> D&ugrave;ng serial number tại apple.com để kiểm tra.</p>\r\n	</li>\r\n</ol>\r\n\r\n<hr />\r\n<h3>6. Mẹo &ldquo;săn&rdquo; MacBook gi&aacute; tốt v&agrave; gia tăng gi&aacute; trị</h3>\r\n\r\n<ul>\r\n	<li>\r\n	<p><strong>Mua m&aacute;y trưng b&agrave;y:</strong> Thường giảm 5&ndash;10 %, m&aacute;y mới nhưng đ&atilde; mở hộp.</p>\r\n	</li>\r\n	<li>\r\n	<p><strong>Chương tr&igrave;nh đổi cũ l&ecirc;n đời mới:</strong> Giảm gi&aacute; khi bạn đổi m&aacute;y cũ.</p>\r\n	</li>\r\n	<li>\r\n	<p><strong>Mua k&egrave;m AppleCare+:</strong> Bảo vệ th&ecirc;m va đập, rơi vỡ, hỗ trợ kỹ thuật.</p>\r\n	</li>\r\n	<li>\r\n	<p><strong>Sử dụng dịch vụ trả g&oacute;p 0 %:</strong> Giảm &aacute;p lực t&agrave;i ch&iacute;nh.</p>\r\n	</li>\r\n</ul>\r\n\r\n<hr />\r\n<h2>Kết luận</h2>\r\n\r\n<p>Để <strong>mua được một chiếc MacBook tốt</strong>, bạn cần:</p>\r\n\r\n<ol>\r\n	<li>\r\n	<p>X&aacute;c định r&otilde; nhu cầu sử dụng.</p>\r\n	</li>\r\n	<li>\r\n	<p>Chọn d&ograve;ng MacBook Air hay Pro ph&ugrave; hợp.</p>\r\n	</li>\r\n	<li>\r\n	<p>C&acirc;n nhắc cấu h&igrave;nh CPU, RAM v&agrave; SSD.</p>\r\n	</li>\r\n	<li>\r\n	<p>Chọn địa chỉ b&aacute;n ch&iacute;nh h&atilde;ng, uy t&iacute;n.</p>\r\n	</li>\r\n	<li>\r\n	<p>Kiểm tra cẩn thận trước khi nhận m&aacute;y.</p>\r\n	</li>\r\n	<li>\r\n	<p>Tận dụng khuyến m&atilde;i v&agrave; c&aacute;c g&oacute;i dịch vụ gia tăng.</p>\r\n	</li>\r\n</ol>', 'upload/blogs/1746781604_681dc5a457c82.png', 11, NULL, 'active', '2025-05-09 09:06:44', '2025-05-09 10:37:14', NULL),
(8, 'Nên mua iPhone Xs Max hay iPhone 11 thường?', 'nen-mua-iphone-xs-max-hay-iphone-11-thuong', '<h1>N&ecirc;n mua iPhone Xs Max hay iPhone 11 thường? Đ&acirc;u l&agrave; lựa chọn hợp l&yacute; năm 2025?</h1>\r\n\r\n<h2>1. Giới thiệu</h2>\r\n\r\n<p>iPhone Xs Max v&agrave; iPhone 11 l&agrave; hai mẫu điện thoại cũ vẫn được săn đ&oacute;n nhiều trong năm 2025. D&ugrave; đ&atilde; ra mắt từ kh&aacute; l&acirc;u, cả hai vẫn mang lại hiệu năng ổn định, thiết kế cao cấp v&agrave; trải nghiệm mượt m&agrave; cho người d&ugrave;ng. Tuy nhi&ecirc;n, nếu bạn đang ph&acirc;n v&acirc;n giữa <strong>iPhone Xs Max</strong> v&agrave; <strong>iPhone 11 thường</strong>, đ&acirc;u l&agrave; lựa chọn hợp l&yacute; hơn?</p>\r\n\r\n<p>H&atilde;y c&ugrave;ng t&igrave;m hiểu chi tiết về <strong>hiệu năng, camera, m&agrave;n h&igrave;nh, thời lượng pin v&agrave; mức gi&aacute;</strong> của từng sản phẩm để c&oacute; c&aacute;i nh&igrave;n r&otilde; r&agrave;ng nhất.</p>\r\n\r\n<hr />\r\n<h2>2. So s&aacute;nh nhanh: iPhone Xs Max vs iPhone 11</h2>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<table>\r\n	<thead>\r\n		<tr>\r\n			<th>Ti&ecirc;u ch&iacute;</th>\r\n			<th>iPhone Xs Max</th>\r\n			<th>iPhone 11</th>\r\n		</tr>\r\n	</thead>\r\n	<tbody>\r\n		<tr>\r\n			<td>Năm ra mắt</td>\r\n			<td>2018</td>\r\n			<td>2019</td>\r\n		</tr>\r\n		<tr>\r\n			<td>M&agrave;n h&igrave;nh</td>\r\n			<td>OLED 6.5 inch</td>\r\n			<td>LCD 6.1 inch</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Chip xử l&yacute;</td>\r\n			<td>Apple A12 Bionic</td>\r\n			<td>Apple A13 Bionic</td>\r\n		</tr>\r\n		<tr>\r\n			<td>RAM</td>\r\n			<td>4GB</td>\r\n			<td>4GB</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Camera sau</td>\r\n			<td>2 camera (tele + g&oacute;c rộng)</td>\r\n			<td>2 camera (g&oacute;c rộng + si&ecirc;u rộng)</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Face ID</td>\r\n			<td>C&oacute;</td>\r\n			<td>C&oacute;</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Pin</td>\r\n			<td>3174 mAh</td>\r\n			<td>3110 mAh</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Kh&aacute;ng nước</td>\r\n			<td>IP68</td>\r\n			<td>IP68</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Hỗ trợ phần mềm</td>\r\n			<td>iOS 17+</td>\r\n			<td>iOS 17+</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Gi&aacute; b&aacute;n (m&aacute;y cũ)</td>\r\n			<td>~6-7 triệu</td>\r\n			<td>~6-8 triệu</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\r\n<p><img alt=\"\" src=\"https://m.media-amazon.com/images/I/81yMd8xSFAL.jpg\" style=\"height:700px; width:700px\" /></p>\r\n\r\n<hr />\r\n<h2>3. Hiệu năng v&agrave; trải nghiệm sử dụng</h2>\r\n\r\n<p>iPhone 11 sử dụng <strong>chip A13 Bionic</strong>, mạnh hơn so với <strong>A12 tr&ecirc;n iPhone Xs Max</strong>. Trong thực tế, sự kh&aacute;c biệt kh&ocirc;ng qu&aacute; lớn nếu bạn chỉ sử dụng c&aacute;c t&aacute;c vụ cơ bản như lướt web, xem phim, gọi video hay d&ugrave;ng mạng x&atilde; hội.</p>\r\n\r\n<p>Tuy nhi&ecirc;n, nếu bạn chơi game nặng, render video, th&igrave; iPhone 11 sẽ c&oacute; lợi thế về hiệu năng v&agrave; khả năng tiết kiệm pin.</p>\r\n\r\n<p>👉 <strong>Lời khuy&ecirc;n:</strong> Nếu bạn l&agrave; người y&ecirc;u th&iacute;ch hiệu năng, thường xuy&ecirc;n chơi game, n&ecirc;n chọn <strong>iPhone 11</strong>.</p>\r\n\r\n<hr />\r\n<h2>4. M&agrave;n h&igrave;nh: OLED vs LCD</h2>\r\n\r\n<p>iPhone Xs Max sở hữu <strong>m&agrave;n h&igrave;nh OLED 6.5 inch</strong> cho chất lượng hiển thị xuất sắc &ndash; m&agrave;u sắc rực rỡ, độ tương phản cao, m&agrave;u đen s&acirc;u. Trong khi đ&oacute;, iPhone 11 sử dụng <strong>m&agrave;n h&igrave;nh LCD Liquid Retina 6.1 inch</strong>, tuy vẫn đẹp nhưng kh&ocirc;ng thể s&aacute;nh bằng OLED.</p>\r\n\r\n<p>👉 <strong>Lời khuy&ecirc;n:</strong> Nếu bạn thường xuy&ecirc;n xem phim, chỉnh ảnh, th&iacute;ch m&agrave;n h&igrave;nh đẹp th&igrave; n&ecirc;n chọn <strong>iPhone Xs Max</strong>.</p>\r\n\r\n<p><img alt=\"\" src=\"https://m.media-amazon.com/images/I/51U8WCTTmCL._AC_UF894%2C1000_QL80_.jpg\" style=\"height:373px; width:273px\" /></p>\r\n\r\n<hr />\r\n<h2>5. Camera: Chụp xa hay chụp rộng?</h2>\r\n\r\n<p>Cả hai đều c&oacute; cụm <strong>2 camera sau</strong>, nhưng sự kh&aacute;c biệt nằm ở loại ống k&iacute;nh:</p>\r\n\r\n<ul>\r\n	<li>\r\n	<p><strong>iPhone Xs Max</strong> c&oacute; ống k&iacute;nh <strong>tele</strong> &ndash; ph&ugrave; hợp chụp ch&acirc;n dung, zoom xa.</p>\r\n	</li>\r\n	<li>\r\n	<p><strong>iPhone 11</strong> c&oacute; ống k&iacute;nh <strong>si&ecirc;u rộng</strong> &ndash; ph&ugrave; hợp du lịch, chụp phong cảnh.</p>\r\n	</li>\r\n</ul>\r\n\r\n<p>👉 <strong>Lời khuy&ecirc;n:</strong> Nếu bạn th&iacute;ch <strong>chụp g&oacute;c rộng</strong> =&gt; chọn <strong>iPhone 11</strong>. Nếu cần <strong>zoom v&agrave; chụp ch&acirc;n dung x&oacute;a ph&ocirc;ng đẹp</strong> =&gt; chọn <strong>iPhone Xs Max</strong>.</p>\r\n\r\n<hr />\r\n<h2>6. Thời lượng pin v&agrave; hỗ trợ phần mềm</h2>\r\n\r\n<p>Thời lượng pin giữa hai m&aacute;y kh&ocirc;ng ch&ecirc;nh lệch qu&aacute; nhiều. Tuy nhi&ecirc;n, <strong>iPhone 11 được Apple hỗ trợ l&acirc;u hơn</strong> do ra mắt sau một năm.</p>\r\n\r\n<p>👉 <strong>Lời khuy&ecirc;n:</strong> Nếu bạn muốn d&ugrave;ng l&acirc;u d&agrave;i, n&ecirc;n chọn <strong>iPhone 11</strong>.</p>\r\n\r\n<hr />\r\n<h2>7. Kết luận: N&ecirc;n mua iPhone Xs Max hay iPhone 11?</h2>\r\n\r\n<table>\r\n	<thead>\r\n		<tr>\r\n			<th>Bạn n&ecirc;n chọn</th>\r\n			<th>Nếu bạn cần&hellip;</th>\r\n		</tr>\r\n	</thead>\r\n	<tbody>\r\n		<tr>\r\n			<td><strong>iPhone Xs Max</strong></td>\r\n			<td>M&agrave;n h&igrave;nh đẹp (OLED), chụp ch&acirc;n dung đẹp, thiết kế sang trọng</td>\r\n		</tr>\r\n		<tr>\r\n			<td><strong>iPhone 11</strong></td>\r\n			<td>Hiệu năng mạnh, pin ổn định, camera si&ecirc;u rộng, d&ugrave;ng l&acirc;u d&agrave;i</td>\r\n		</tr>\r\n	</tbody>\r\n</table>', 'uploads/blogs/1746786917_681dda65cf134.jpg', 12, NULL, 'inactive', '2025-05-09 10:35:17', '2025-05-12 15:54:52', NULL);

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
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `categories`
--

INSERT INTO `categories` (`id`, `name`, `slug`, `parent_id`, `order`, `status`, `type`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'iPhone', 'iphone', NULL, 0, 'active', 1, NULL, '2025-05-11 09:42:50', NULL),
(2, 'Mac', 'mac', NULL, 3, 'inactive', 1, NULL, '2025-05-11 09:25:33', NULL),
(3, 'iPad', 'ipad', NULL, 1, 'active', 1, NULL, '2025-05-11 09:44:59', NULL),
(4, 'Apple Watch', 'apple-watch', NULL, 4, 'active', 1, NULL, '2025-05-11 09:04:28', NULL),
(5, 'AirPods', 'airpods', NULL, 5, 'active', 1, NULL, '2025-05-11 10:17:35', NULL),
(6, 'AirPod Pro 3', 'airpod-pro-3', 5, 0, 'active', 1, '2025-05-08 07:12:32', '2025-05-11 10:27:53', NULL),
(7, 'Ipad M4', 'ipad-m4', 3, 0, 'active', 1, '2025-05-08 07:12:48', '2025-05-08 07:12:48', NULL),
(8, 'Iphone 12 Series', 'iphone-12-series', 1, 0, 'active', 1, '2025-05-08 07:13:16', '2025-05-08 07:13:16', NULL),
(9, 'Iphone 13 Series', 'iphone-13-series', 1, 0, 'active', 1, '2025-05-08 07:13:35', '2025-05-09 04:57:51', NULL),
(10, 'Iphone 14 Series', 'iphone-14-series', 1, 0, 'active', 1, '2025-05-08 07:13:58', '2025-05-08 07:51:50', NULL),
(11, 'Blog Macbook', 'blog-macbook', NULL, 1, 'active', 2, '2025-05-08 10:22:36', '2025-05-11 10:03:04', NULL),
(12, 'Blog Iphone', 'blog-iphone', NULL, 2, 'active', 2, '2025-05-09 07:31:49', '2025-05-11 10:03:04', NULL),
(13, 'Aipod Demo', 'aipod-demo', NULL, 9, 'active', 1, '2025-05-11 09:14:24', '2025-05-11 10:25:21', '2025-05-11 10:25:21'),
(14, 'airpods demo 2', 'airpods-demo-2', NULL, 8, 'active', 1, '2025-05-11 09:15:21', '2025-05-11 10:25:50', '2025-05-11 10:25:50'),
(15, 'Airpod demo 3', 'airpod-demo-3', NULL, 7, 'active', 1, '2025-05-11 09:20:26', '2025-05-11 10:26:09', '2025-05-11 10:26:09'),
(16, 'airpods demo 4', 'airpods-demo-4', NULL, 6, 'active', 1, '2025-05-11 10:13:58', '2025-05-11 10:26:28', '2025-05-11 10:26:28'),
(17, 'AirPod Pro 2', 'airpod-pro-2', 5, 5, 'active', 1, '2025-05-11 10:27:13', '2025-05-11 10:27:13', NULL),
(18, 'AirPod Pro 2.1', 'airpod-pro-21', 17, 5, 'active', 1, '2025-05-11 10:29:23', '2025-05-11 10:29:23', NULL);

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
(47, '2025_05_13_072913_remove_image_discount_price_purchase_price_selling_price_from_products', 22);

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
  `model_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `orders`
--

CREATE TABLE `orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `subtotal` decimal(15,2) DEFAULT NULL,
  `discount` decimal(15,2) NOT NULL DEFAULT '0.00',
  `shipping_fee` decimal(15,2) DEFAULT NULL,
  `total_price` decimal(15,2) DEFAULT NULL,
  `shipping_address` text COLLATE utf8mb4_unicode_ci,
  `shipping_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shipping_phone` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shipping_email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_method` enum('cod','bank_transfer','credit_card') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'cod',
  `payment_status` enum('pending','paid','failed','refunded') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `shipping_method_id` bigint(20) UNSIGNED DEFAULT NULL,
  `status` enum('pending','confirmed','preparing','shipping','completed','cancelled') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `is_paid` tinyint(1) NOT NULL DEFAULT '0',
  `notes` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `orders`
--

INSERT INTO `orders` (`id`, `user_id`, `subtotal`, `discount`, `shipping_fee`, `total_price`, `shipping_address`, `shipping_name`, `shipping_phone`, `shipping_email`, `payment_method`, `payment_status`, `shipping_method_id`, `status`, `is_paid`, `notes`, `created_at`, `updated_at`, `deleted_at`) VALUES
(2, NULL, 81980000.00, 0.00, 30000.00, 82010000.00, 'Hồ Chí Minh, Việt Nam', 'User', '0987654321', 'daicvph50503@gmail.com', 'bank_transfer', 'paid', 1, 'confirmed', 1, 'Đơn hàng mẫu', '2025-05-08 14:32:35', '2025-05-13 07:19:26', NULL);

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
-- Cấu trúc bảng cho bảng `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'web',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `guard_name`, `created_at`, `updated_at`, `description`) VALUES
(1, 'view_products', 'web', '2025-05-12 15:44:46', '2025-05-12 15:44:46', 'Xem danh sách sản phẩm'),
(2, 'create_product', 'web', '2025-05-12 15:44:47', '2025-05-12 15:44:47', 'Tạo sản phẩm mới'),
(3, 'edit_product', 'web', '2025-05-12 15:44:47', '2025-05-12 15:44:47', 'Chỉnh sửa thông tin sản phẩm'),
(4, 'delete_product', 'web', '2025-05-12 15:44:47', '2025-05-12 15:44:47', 'Xóa sản phẩm'),
(5, 'view_orders', 'web', '2025-05-12 15:44:47', '2025-05-12 15:44:47', 'Xem danh sách đơn hàng'),
(6, 'update_orders', 'web', '2025-05-12 15:44:47', '2025-05-12 15:44:47', 'Cập nhật trạng thái hoặc thông tin đơn hàng'),
(7, 'delete_orders', 'web', '2025-05-12 15:44:47', '2025-05-12 15:44:47', 'Xóa đơn hàng'),
(8, 'view_deleted_orders', 'web', '2025-05-12 15:44:47', '2025-05-12 15:44:47', 'Xem danh sách đơn hàng đã xóa'),
(9, 'restore_orders', 'web', '2025-05-12 15:44:48', '2025-05-12 15:44:48', 'Khôi phục đơn hàng đã xóa'),
(10, 'force_delete_orders', 'web', '2025-05-12 15:44:48', '2025-05-12 15:44:48', 'Xóa vĩnh viễn đơn hàng'),
(11, 'view_customers', 'web', '2025-05-12 15:44:48', '2025-05-12 15:44:48', 'Xem danh sách khách hàng'),
(12, 'create_customer', 'web', '2025-05-12 15:44:48', '2025-05-12 15:44:48', 'Tạo tài khoản khách hàng mới'),
(13, 'update_customer_profile', 'web', '2025-05-12 15:44:48', '2025-05-12 15:44:48', 'Cập nhật thông tin hồ sơ khách hàng'),
(14, 'delete_customer', 'web', '2025-05-12 15:44:48', '2025-05-12 15:44:48', 'Xóa tài khoản khách hàng'),
(15, 'toggle_customer_active', 'web', '2025-05-12 15:44:48', '2025-05-12 15:44:48', 'Bật/tắt trạng thái hoạt động của khách hàng'),
(16, 'view_deleted_customers', 'web', '2025-05-12 15:44:48', '2025-05-12 15:44:48', 'Xem danh sách khách hàng đã xóa'),
(17, 'restore_customers', 'web', '2025-05-12 15:44:49', '2025-05-12 15:44:49', 'Khôi phục tài khoản khách hàng đã xóa'),
(18, 'force_delete_customers', 'web', '2025-05-12 15:44:49', '2025-05-12 15:44:49', 'Xóa vĩnh viễn tài khoản khách hàng'),
(19, 'view_own_orders', 'web', '2025-05-12 15:44:49', '2025-05-12 15:44:49', 'Xem danh sách đơn hàng của chính mình'),
(20, 'create_order', 'web', '2025-05-12 15:44:49', '2025-05-12 15:44:49', 'Tạo đơn hàng mới'),
(21, 'update_profile', 'web', '2025-05-12 15:44:49', '2025-05-12 15:44:49', 'Cập nhật thông tin hồ sơ cá nhân'),
(22, 'view_categories', 'web', '2025-05-12 15:44:49', '2025-05-12 15:44:49', 'Xem danh sách danh mục sản phẩm'),
(23, 'view_banners', 'web', '2025-05-12 15:44:50', '2025-05-12 15:44:50', 'Xem danh sách banner quảng cáo'),
(24, 'view_blogs', 'web', '2025-05-12 15:44:50', '2025-05-12 15:44:50', 'Xem danh sách bài viết blog');

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
  `stock` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Số lượng tồn kho cho sản phẩm không có biến thể',
  `category_id` bigint(20) UNSIGNED NOT NULL,
  `model` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `series` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `warranty_months` int(11) NOT NULL DEFAULT '12',
  `is_featured` tinyint(1) NOT NULL DEFAULT '0',
  `status` enum('active','inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `has_variants` tinyint(1) NOT NULL DEFAULT '0' COMMENT '1: Có biến thể, 0: Không có biến thể'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `products`
--

INSERT INTO `products` (`id`, `name`, `slug`, `description`, `content`, `stock`, `category_id`, `model`, `series`, `warranty_months`, `is_featured`, `status`, `created_at`, `updated_at`, `deleted_at`, `has_variants`) VALUES
(4, 'iPhone 15 Pro Max 256GB', 'iphone-15-pro-max-256gb', 'Bộ sản phẩm gồm: Hộp, Sách hướng dẫn, Cây lấy sim, Cáp Type C\r\n Hư gì đổi nấy 12 tháng tại 3043 siêu thị trên toàn quốc Xem chi tiết chính sách bảo hành, đổi trả\r\n Bảo hành chính hãng 1 năm\r\n Giao hàng nhanh toàn quốc Xem chi tiết\r\n Tổng đài: 1900.9696.42 (8:00 - 21:30)', '<p>Khuyến m&atilde;i trị gi&aacute; 500.000₫<small>Gi&aacute; v&agrave; khuyến m&atilde;i dự kiến &aacute;p dụng đến 23:59 | 31/05</small></p>\r\n\r\n<p>&nbsp;<strong>Phiếu mua h&agrave;ng AirPods, Apple Watch, Macbook trị gi&aacute; 500,000đ</strong></p>\r\n\r\n<p>&nbsp;<strong>Phiếu mua h&agrave;ng &aacute;p dụng mua Sạc dự ph&ograve;ng (trừ h&atilde;ng AVA+, Hydrus), đồng hồ th&ocirc;ng minh (trừ Apple), Tai nghe v&agrave; Loa bluetooth (h&atilde;ng JBL, Marshall,Harmar Kardon ,Sony) trị gi&aacute; 100.000đ</strong></p>\r\n\r\n<p>&nbsp;<strong>Thu cũ đổi mới: Giảm đến 2,000,000đ (Kh&ocirc;ng k&egrave;m ưu đ&atilde;i thanh to&aacute;n qua cổng, mua k&egrave;m)&nbsp;<a href=\"https://www.thegioididong.com/thu-cu-doi-moi\">Xem chi tiết</a></strong></p>\r\n\r\n<p>&nbsp;<strong>Nhập m&atilde; VNPAYTGDD2 giảm từ 80,000đ đến 150,000đ (&aacute;p dụng t&ugrave;y gi&aacute; trị đơn h&agrave;ng) khi thanh to&aacute;n qua VNPAY-QR&nbsp;<a href=\"https://www.topzone.vn/tekzone/nhap-ma-vnpaytgdd1-giam-toi-da-150k-khi-thanh-toan-qua-vnpay-qr-1573704\" target=\"_blank\">(Xem chi tiết tại đ&acirc;y)</a></strong></p>', 0, 3, 'iPhone 15 Pro', 'Pro Max', 12, 1, 'active', '2025-05-10 01:38:42', '2025-05-10 02:18:40', NULL, 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `product_attributes`
--

CREATE TABLE `product_attributes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `attribute_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `attribute_value` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `product_attributes`
--

INSERT INTO `product_attributes` (`id`, `product_id`, `attribute_name`, `attribute_value`, `created_at`, `updated_at`) VALUES
(19, 4, 'feature', 'Camera 48MP', '2025-05-10 04:07:04', '2025-05-10 04:07:04'),
(20, 4, 'Chip', '20', '2025-05-10 04:07:04', '2025-05-10 04:07:04');

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
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Đường dẫn ảnh của biến thể',
  `purchase_price` decimal(15,2) NOT NULL DEFAULT '0.00' COMMENT 'Giá nhập',
  `selling_price` decimal(15,2) NOT NULL DEFAULT '0.00' COMMENT 'Giá bán'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'web',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `roles`
--

INSERT INTO `roles` (`id`, `name`, `guard_name`, `created_at`, `updated_at`, `description`) VALUES
(1, 'admin', 'web', '2025-05-12 15:44:46', '2025-05-12 15:44:46', NULL),
(2, 'staff', 'web', '2025-05-12 15:44:46', '2025-05-12 15:44:46', NULL),
(3, 'user', 'web', '2025-05-12 15:44:46', '2025-05-12 15:44:46', NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `role_permissions`
--

CREATE TABLE `role_permissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL,
  `permission_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `role_permissions`
--

INSERT INTO `role_permissions` (`id`, `role_id`, `permission_id`) VALUES
(10, 1, 1),
(11, 1, 2),
(12, 1, 3),
(13, 1, 4),
(14, 1, 5),
(15, 1, 6),
(16, 1, 7),
(17, 1, 8),
(18, 1, 9),
(19, 1, 10),
(20, 1, 11),
(21, 1, 12),
(22, 1, 13),
(23, 1, 14),
(24, 1, 15),
(25, 1, 16),
(26, 1, 17),
(27, 1, 18),
(28, 1, 19),
(29, 1, 20),
(30, 1, 21),
(31, 1, 22),
(32, 1, 23),
(33, 1, 24),
(34, 2, 22),
(35, 2, 23),
(36, 2, 24),
(37, 2, 1),
(38, 2, 5),
(39, 2, 11),
(40, 2, 12),
(41, 2, 15);

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
('jVJ2emxPMWgI9WLwmBQJNxoT6b6aLEwOeL9ATdWM', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiMkJZRE04MEpnOG1ab056NDd3MUhaSUwxSG9peUV4QkRnVTg4ajlNeCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1747119613),
('mryFpHhZzA6UUhxFK9qaXydYjeoeWcREb1Da9gIw', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiWTgxQk1UMGNQcEhTZ05qcmZoTGM4cDZsVzdmcDgzMnlzbFphbHAyNiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1747119578),
('rmgBPAzM74ibVBaj9lXYFbdGSyzknVzsxFzpsx7N', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoid2xjYTdLMDZleWZxdjFWMVlZMzVnVUJGM0JTWWlLVjZnODVGdEtCbCI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTA6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hZG1pbi9wcm9kdWN0cy9jcmVhdGUtc2ltcGxlIjt9fQ==', 1747123529),
('svxKw2DM2j2FdhDxUzj7YkXJkAwfpgzFmX7TVYfT', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiSGdFVEFXOWViTDJrbVFRM0xiMmwxcmxXWVdxaU9MS0g2MUpMY1ZPUSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzY6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hZG1pbi9vcmRlcnMvMiI7fX0=', 1747120797);

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
-- Cấu trúc bảng cho bảng `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `avatar` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `gender` enum('male','female','other') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'other',
  `is_verified` tinyint(1) NOT NULL DEFAULT '0',
  `last_login` timestamp NULL DEFAULT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL DEFAULT '3',
  `status` enum('active','inactive','banned') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `phone`, `address`, `avatar`, `dob`, `gender`, `is_verified`, `last_login`, `role_id`, `status`, `remember_token`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Admin User', 'admin@example.com', NULL, '$2y$12$2ZpIrfvNopHn2TiqmZ1ONOarzbvaTjYPkzO.D5eZN0HwRd7imjdua', NULL, NULL, NULL, NULL, 'other', 0, NULL, 1, 'active', NULL, '2025-05-08 14:36:14', '2025-05-08 14:36:14', NULL),
(2, 'Admin', 'admin@gmail.com', '2025-05-08 14:37:46', '$2y$12$2xYoPFJ4XJXTz05llVIDrOP1T2/a/naETOrxB.c1vsqHtCldi4VmO', '0123456789', 'Hà Nội, Việt Nam', 'uploads/users/1746801070.jpg', NULL, 'other', 1, '2025-05-08 14:37:46', 3, 'active', NULL, '2025-05-08 14:37:46', '2025-05-09 14:31:10', NULL),
(8, 'Kim Hồng Phong', 'Kimphong102005@gmail.com', NULL, '$2y$12$3bjg2MnlxSoQyF73GOZjUuKvOP.mmci1xUmAFsB9FhOhI8.aXpfmW', '0973067464', 'Tx. Thái Hòa', 'uploads/users/1747068398.png', '2025-06-01', 'male', 0, NULL, 1, 'active', NULL, '2025-05-12 16:46:38', '2025-05-12 16:46:38', NULL);

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
-- Cấu trúc bảng cho bảng `variant_attributes`
--

CREATE TABLE `variant_attributes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `variant_id` bigint(20) UNSIGNED NOT NULL,
  `attribute_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `attribute_value` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
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
  `status` enum('active','inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `variant_attribute_types`
--

INSERT INTO `variant_attribute_types` (`id`, `name`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Color', 'active', '2025-05-13 02:28:00', '2025-05-13 02:31:45', NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `variant_attribute_values`
--

CREATE TABLE `variant_attribute_values` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `attribute_type_id` bigint(20) UNSIGNED NOT NULL,
  `value` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('active','inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `variant_combinations`
--

CREATE TABLE `variant_combinations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `variant_id` bigint(20) UNSIGNED NOT NULL,
  `attribute_value_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `wishlists`
--

CREATE TABLE `wishlists` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `variant_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
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
-- Chỉ mục cho bảng `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

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
-- Chỉ mục cho bảng `order_items`
--
ALTER TABLE `order_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_items_order_id_foreign` (`order_id`),
  ADD KEY `order_items_product_id_foreign` (`product_id`),
  ADD KEY `order_items_product_variant_id_foreign` (`product_variant_id`);

--
-- Chỉ mục cho bảng `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `products_slug_unique` (`slug`),
  ADD KEY `products_category_id_foreign` (`category_id`);

--
-- Chỉ mục cho bảng `product_attributes`
--
ALTER TABLE `product_attributes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_attributes_product_id_foreign` (`product_id`);

--
-- Chỉ mục cho bảng `product_reviews`
--
ALTER TABLE `product_reviews`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_reviews_product_id_foreign` (`product_id`),
  ADD KEY `product_reviews_user_id_foreign` (`user_id`);

--
-- Chỉ mục cho bảng `product_variants`
--
ALTER TABLE `product_variants`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `product_variants_slug_unique` (`slug`),
  ADD UNIQUE KEY `product_variants_sku_unique` (`sku`),
  ADD KEY `product_variants_product_id_foreign` (`product_id`);

--
-- Chỉ mục cho bảng `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `role_permissions`
--
ALTER TABLE `role_permissions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `role_permissions_role_id_foreign` (`role_id`),
  ADD KEY `role_permissions_permission_id_foreign` (`permission_id`);

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
-- Chỉ mục cho bảng `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD KEY `users_role_id_foreign` (`role_id`);

--
-- Chỉ mục cho bảng `user_addresses`
--
ALTER TABLE `user_addresses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_addresses_user_id_foreign` (`user_id`);

--
-- Chỉ mục cho bảng `variant_attributes`
--
ALTER TABLE `variant_attributes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `variant_attributes_variant_id_foreign` (`variant_id`);

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
  ADD UNIQUE KEY `variant_attribute_values_attribute_type_id_value_unique` (`attribute_type_id`,`value`);

--
-- Chỉ mục cho bảng `variant_combinations`
--
ALTER TABLE `variant_combinations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `variant_combinations_variant_id_attribute_value_id_unique` (`variant_id`,`attribute_value_id`),
  ADD KEY `variant_combinations_attribute_value_id_foreign` (`attribute_value_id`);

--
-- Chỉ mục cho bảng `wishlists`
--
ALTER TABLE `wishlists`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `wishlists_user_id_product_id_variant_id_unique` (`user_id`,`product_id`,`variant_id`),
  ADD KEY `wishlists_product_id_foreign` (`product_id`),
  ADD KEY `wishlists_variant_id_foreign` (`variant_id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `banners`
--
ALTER TABLE `banners`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT cho bảng `blogs`
--
ALTER TABLE `blogs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT cho bảng `carts`
--
ALTER TABLE `carts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `cart_items`
--
ALTER TABLE `cart_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT cho bảng `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT cho bảng `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;

--
-- AUTO_INCREMENT cho bảng `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT cho bảng `order_items`
--
ALTER TABLE `order_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT cho bảng `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT cho bảng `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT cho bảng `product_attributes`
--
ALTER TABLE `product_attributes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT cho bảng `product_reviews`
--
ALTER TABLE `product_reviews`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `product_variants`
--
ALTER TABLE `product_variants`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT cho bảng `role_permissions`
--
ALTER TABLE `role_permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT cho bảng `shipping_methods`
--
ALTER TABLE `shipping_methods`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT cho bảng `user_addresses`
--
ALTER TABLE `user_addresses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `variant_attributes`
--
ALTER TABLE `variant_attributes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `variant_attribute_types`
--
ALTER TABLE `variant_attribute_types`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `variant_attribute_values`
--
ALTER TABLE `variant_attribute_values`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `variant_combinations`
--
ALTER TABLE `variant_combinations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `wishlists`
--
ALTER TABLE `wishlists`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

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
-- Các ràng buộc cho bảng `order_items`
--
ALTER TABLE `order_items`
  ADD CONSTRAINT `order_items_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `order_items_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `order_items_product_variant_id_foreign` FOREIGN KEY (`product_variant_id`) REFERENCES `product_variants` (`id`) ON DELETE CASCADE;

--
-- Các ràng buộc cho bảng `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`);

--
-- Các ràng buộc cho bảng `product_attributes`
--
ALTER TABLE `product_attributes`
  ADD CONSTRAINT `product_attributes_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Các ràng buộc cho bảng `product_reviews`
--
ALTER TABLE `product_reviews`
  ADD CONSTRAINT `product_reviews_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `product_reviews_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Các ràng buộc cho bảng `product_variants`
--
ALTER TABLE `product_variants`
  ADD CONSTRAINT `product_variants_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Các ràng buộc cho bảng `role_permissions`
--
ALTER TABLE `role_permissions`
  ADD CONSTRAINT `role_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `role_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Các ràng buộc cho bảng `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`);

--
-- Các ràng buộc cho bảng `user_addresses`
--
ALTER TABLE `user_addresses`
  ADD CONSTRAINT `user_addresses_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Các ràng buộc cho bảng `variant_attributes`
--
ALTER TABLE `variant_attributes`
  ADD CONSTRAINT `variant_attributes_variant_id_foreign` FOREIGN KEY (`variant_id`) REFERENCES `product_variants` (`id`) ON DELETE CASCADE;

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
  ADD CONSTRAINT `wishlists_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `wishlists_variant_id_foreign` FOREIGN KEY (`variant_id`) REFERENCES `product_variants` (`id`) ON DELETE SET NULL;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
