-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: localhost
-- Thời gian đã tạo: Th5 29, 2025 lúc 09:37 PM
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
(1, 'Banner 1', 'uploads/banners/683483c3804b5.jpg', 'Hellllllllllllllllllllllo', 'http://localhost:8080/phpmyadmin', 'active', 1, '2025-05-08 15:17:47', '2025-05-26 15:07:47'),
(2, 'Banner 2', 'banners/8nweYDsDyjlxnkRfE2mtSFbnsQumSZ5LqvqJxPVm.jpg', NULL, NULL, 'inactive', 2, '2025-05-08 15:17:48', '2025-05-25 12:59:23'),
(3, 'Banner 3', 'banners/2T2ueXqRAEHEeqhieFmPUOQFdRFkF5zCbODRCxCf.jpg', NULL, NULL, 'active', 3, '2025-05-08 15:17:48', '2025-05-20 04:14:58'),
(4, 'Banner 4', 'banners/x0PUFKxgsXIxAqS7ikoXVdz57sSun85dunV3meJ9.jpg', NULL, NULL, 'inactive', 7, '2025-05-08 15:17:49', '2025-05-25 12:59:30');

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
(1, 'Làm thế nào để học Laravel hiệu quả?', 'lam-the-nao-de-hoc-laravel-hieu-qua', 'Nội dung chi tiết về cách học Laravel nhanh và dễ hiểu...', 'blog1.jpg', 11, NULL, 'active', '2025-05-09 06:33:15', '2025-05-12 13:35:20', '2025-05-12 13:35:20'),
(4, 'Làm sao để mua được 1 sản phẩm Iphone ưng ý ?', 'lam-sao-de-mua-duoc-1-san-pham-iphone-ung-y', '<h2>L&agrave;m sao để mua được một sản phẩm iPhone ưng &yacute;?</h2>\r\n\r\n<p><img alt=\"\" src=\"https://cdn.tgdd.vn/Files/2022/09/23/1471383/he-dieu-hanh-ios-la-gi-14.jpg\" style=\"height:394px; width:700px\" /></p>\r\n\r\n<p>Mua một chiếc iPhone kh&ocirc;ng phải l&agrave; một quyết định đơn giản, đặc biệt khi bạn muốn lựa chọn một sản phẩm vừa &yacute; v&agrave; ph&ugrave; hợp với nhu cầu sử dụng. Với nhiều d&ograve;ng iPhone kh&aacute;c nhau tr&ecirc;n thị trường, bạn c&oacute; thể cảm thấy bối rối khi phải chọn lựa giữa iPhone 15, iPhone 14, iPhone 13 hoặc thậm ch&iacute; c&aacute;c d&ograve;ng cũ hơn. B&agrave;i viết dưới đ&acirc;y sẽ hướng dẫn bạn c&aacute;ch chọn mua một chiếc iPhone ưng &yacute;, từ việc x&aacute;c định nhu cầu đến việc t&igrave;m kiếm nơi b&aacute;n uy t&iacute;n.</p>\r\n\r\n<h3>1. X&aacute;c định nhu cầu sử dụng iPhone</h3>\r\n\r\n<p>Trước khi bắt đầu chọn mua iPhone, điều quan trọng đầu ti&ecirc;n l&agrave; x&aacute;c định r&otilde; mục đ&iacute;ch v&agrave; nhu cầu sử dụng của m&igrave;nh. Bạn cần một chiếc điện thoại chỉ để phục vụ nhu cầu cơ bản như nghe gọi, nhắn tin, hay bạn muốn một chiếc m&aacute;y c&oacute; cấu h&igrave;nh mạnh mẽ để chơi game, chụp ảnh chất lượng cao, hoặc sử dụng c&aacute;c phần mềm đồ họa chuy&ecirc;n nghiệp?</p>\r\n\r\n<ul>\r\n	<li>\r\n	<p><strong>Nếu nhu cầu cơ bản:</strong> Bạn c&oacute; thể chọn c&aacute;c mẫu iPhone cũ như iPhone 13 hoặc iPhone SE.</p>\r\n	</li>\r\n	<li>\r\n	<p><strong>Nếu nhu cầu chơi game hoặc chụp ảnh cao cấp:</strong> iPhone 15, iPhone 14 Pro Max với chip A17 Bionic v&agrave; hệ thống camera n&acirc;ng cao sẽ l&agrave; lựa chọn tuyệt vời.</p>\r\n	</li>\r\n</ul>\r\n\r\n<h3>2. Chọn lựa phi&ecirc;n bản iPhone ph&ugrave; hợp</h3>\r\n\r\n<p><img alt=\"\" src=\"https://news.khangz.com/wp-content/uploads/2022/07/Ma-iPhone-cac-nuoc-4.jpg\" style=\"height:450px; width:800px\" /></p>\r\n\r\n<p>iPhone lu&ocirc;n c&oacute; nhiều phi&ecirc;n bản kh&aacute;c nhau với c&aacute;c t&iacute;nh năng v&agrave; mức gi&aacute; kh&aacute;c nhau. Một trong những yếu tố quan trọng khi chọn iPhone l&agrave; quyết định giữa phi&ecirc;n bản thường, phi&ecirc;n bản Pro hay Pro Max.</p>\r\n\r\n<ul>\r\n	<li>\r\n	<p><strong>iPhone thường</strong>: Đ&acirc;y l&agrave; lựa chọn hợp l&yacute; nếu bạn kh&ocirc;ng cần qu&aacute; nhiều t&iacute;nh năng cao cấp, nhưng vẫn muốn một chiếc điện thoại mạnh mẽ v&agrave; c&oacute; camera ổn định.</p>\r\n	</li>\r\n	<li>\r\n	<p><strong>iPhone Pro/Pro Max</strong>: D&agrave;nh cho những ai cần hiệu suất cao hơn, m&agrave;n h&igrave;nh đẹp hơn v&agrave; hệ thống camera chuy&ecirc;n nghiệp hơn.</p>\r\n	</li>\r\n</ul>\r\n\r\n<h3>3. Lựa chọn dung lượng bộ nhớ</h3>\r\n\r\n<p>iPhone c&oacute; c&aacute;c phi&ecirc;n bản với dung lượng bộ nhớ kh&aacute;c nhau, từ 64GB đến 1TB. Nếu bạn l&agrave; người sử dụng nhiều ứng dụng, chụp ảnh v&agrave; quay video thường xuy&ecirc;n, th&igrave; việc chọn phi&ecirc;n bản c&oacute; dung lượng bộ nhớ lớn l&agrave; rất quan trọng.</p>\r\n\r\n<ul>\r\n	<li>\r\n	<p><strong>64GB</strong>: Ph&ugrave; hợp với những ai sử dụng điện thoại chủ yếu để nghe gọi, lướt web.</p>\r\n	</li>\r\n	<li>\r\n	<p><strong>128GB v&agrave; 256GB</strong>: Lựa chọn hợp l&yacute; cho người d&ugrave;ng b&igrave;nh thường với nhu cầu lưu trữ ảnh v&agrave; video.</p>\r\n	</li>\r\n	<li>\r\n	<p><strong>512GB v&agrave; 1TB</strong>: D&agrave;nh cho những người c&oacute; nhu cầu lưu trữ lớn, chơi game, quay video 4K.</p>\r\n	</li>\r\n</ul>\r\n\r\n<h3>4. So s&aacute;nh gi&aacute; v&agrave; t&igrave;m mua ở địa chỉ uy t&iacute;n</h3>\r\n\r\n<p>Để mua được một chiếc iPhone ưng &yacute; với mức gi&aacute; tốt, bạn cần so s&aacute;nh gi&aacute; ở c&aacute;c cửa h&agrave;ng v&agrave; hệ thống b&aacute;n lẻ uy t&iacute;n. Ngo&agrave;i c&aacute;c cửa h&agrave;ng ch&iacute;nh h&atilde;ng của Apple, bạn cũng c&oacute; thể t&igrave;m mua iPhone tại c&aacute;c đại l&yacute; ph&acirc;n phối ch&iacute;nh thức hoặc c&aacute;c cửa h&agrave;ng trực tuyến.</p>\r\n\r\n<p>Lưu &yacute;:</p>\r\n\r\n<ul>\r\n	<li>\r\n	<p><strong>Kiểm tra nguồn gốc sản phẩm</strong>: Đảm bảo rằng chiếc iPhone bạn mua l&agrave; h&agrave;ng ch&iacute;nh h&atilde;ng, c&oacute; bảo h&agrave;nh đầy đủ.</p>\r\n	</li>\r\n	<li>\r\n	<p><strong>Chọn cửa h&agrave;ng c&oacute; ch&iacute;nh s&aacute;ch đổi trả r&otilde; r&agrave;ng</strong>: Để đảm bảo quyền lợi của m&igrave;nh nếu sản phẩm gặp phải sự cố.</p>\r\n	</li>\r\n</ul>\r\n\r\n<h3>5. Kiểm tra c&aacute;c chương tr&igrave;nh khuyến m&atilde;i, giảm gi&aacute;</h3>\r\n\r\n<p>Apple v&agrave; c&aacute;c cửa h&agrave;ng b&aacute;n lẻ thường xuy&ecirc;n c&oacute; c&aacute;c chương tr&igrave;nh khuyến m&atilde;i hoặc giảm gi&aacute; v&agrave;o c&aacute;c dịp lễ, Tết, hoặc trong c&aacute;c sự kiện đặc biệt. Đ&acirc;y l&agrave; cơ hội để bạn sở hữu một chiếc iPhone với mức gi&aacute; ưu đ&atilde;i.</p>\r\n\r\n<h3>6. Lựa chọn m&agrave;u sắc v&agrave; thiết kế</h3>\r\n\r\n<p>iPhone c&oacute; nhiều m&agrave;u sắc v&agrave; kiểu d&aacute;ng để bạn lựa chọn. D&ugrave; t&iacute;nh năng quan trọng nhất l&agrave; hiệu suất, nhưng thiết kế v&agrave; m&agrave;u sắc cũng ảnh hưởng đến cảm gi&aacute;c của người d&ugrave;ng. Bạn c&oacute; thể lựa chọn giữa c&aacute;c m&agrave;u như: đen, trắng, v&agrave;ng, xanh hoặc c&aacute;c m&agrave;u đặc biệt kh&aacute;c t&ugrave;y thuộc v&agrave;o phi&ecirc;n bản.</p>\r\n\r\n<h3>7. Tham khảo c&aacute;c đ&aacute;nh gi&aacute; v&agrave; review từ người d&ugrave;ng</h3>\r\n\r\n<p><img alt=\"\" src=\"https://24hstore.vn/upload_images/images/2022/10/21/iphone-14-series-2(1).jpg\" /></p>\r\n\r\n<p>Trước khi quyết định mua, đừng qu&ecirc;n tham khảo c&aacute;c đ&aacute;nh gi&aacute; v&agrave; phản hồi từ người d&ugrave;ng thực tế. C&aacute;c trang web c&ocirc;ng nghệ, diễn đ&agrave;n hoặc c&aacute;c video review tr&ecirc;n YouTube sẽ gi&uacute;p bạn hiểu r&otilde; hơn về trải nghiệm người d&ugrave;ng v&agrave; chất lượng sản phẩm.</p>\r\n\r\n<h3>8. Sử dụng c&aacute;c dịch vụ gia tăng (AppleCare, iCloud, v.v.)</h3>\r\n\r\n<p>Apple cung cấp c&aacute;c dịch vụ gia tăng như <strong>AppleCare</strong> để bảo vệ thiết bị của bạn trong suốt qu&aacute; tr&igrave;nh sử dụng. Nếu bạn c&oacute; nhu cầu lưu trữ đ&aacute;m m&acirc;y, <strong>iCloud</strong> l&agrave; dịch vụ tuyệt vời để sao lưu v&agrave; đồng bộ dữ liệu giữa c&aacute;c thiết bị.</p>\r\n\r\n<h3>Kết luận</h3>\r\n\r\n<p>Mua một chiếc iPhone ưng &yacute; kh&ocirc;ng chỉ phụ thuộc v&agrave;o việc chọn mẫu m&aacute;y m&agrave; c&ograve;n li&ecirc;n quan đến nhu cầu sử dụng, dung lượng bộ nhớ v&agrave; mức gi&aacute; bạn sẵn s&agrave;ng chi trả. H&atilde;y c&acirc;n nhắc kỹ lưỡng c&aacute;c yếu tố như t&iacute;nh năng, thiết kế v&agrave; chương tr&igrave;nh khuyến m&atilde;i để lựa chọn được chiếc iPhone ph&ugrave; hợp nhất với m&igrave;nh.<br />\r\nLink tham khảo:&nbsp;<a href=\"https://www.youtube.com/watch?v=mUafl7h5Prk\">https://www.youtube.com/watch?v=mUafl7h5Prk</a></p>', 'uploads/blogs/1747156059_68237c5b793d6.jpg', 12, 20, 'active', '2025-05-09 08:08:15', '2025-05-26 14:24:29', NULL),
(6, 'Làm sao có thể mua được 1 chiếc Macbook tốt?', 'lam-sao-co-the-mua-duoc-1-chiec-macbook-tot', '<h2>L&agrave;m sao để mua được một chiếc MacBook tốt?</h2>\r\n\r\n<p>Mua một chiếc MacBook kh&ocirc;ng chỉ đơn thuần l&agrave; chọn một thiết bị c&ocirc;ng nghệ cao, m&agrave; c&ograve;n l&agrave; đầu tư cho trải nghiệm l&agrave;m việc, học tập v&agrave; giải tr&iacute; l&acirc;u d&agrave;i. Để <strong>mua MacBook tốt</strong> v&agrave; ph&ugrave; hợp với nhu cầu, bạn cần c&acirc;n nhắc nhiều yếu tố từ cấu h&igrave;nh, d&ograve;ng sản phẩm đến địa chỉ mua h&agrave;ng uy t&iacute;n. Dưới đ&acirc;y l&agrave; hướng dẫn chi tiết gi&uacute;p bạn sở hữu chiếc MacBook ưng &yacute; nhất.</p>\r\n\r\n<hr />\r\n<h3>1. X&aacute;c định r&otilde; nhu cầu sử dụng</h3>\r\n\r\n<p>Trước khi bước v&agrave;o qu&aacute; tr&igrave;nh <strong>mua MacBook</strong>, h&atilde;y tự hỏi:</p>\r\n\r\n<ul>\r\n	<li>\r\n	<p><strong>Bạn d&ugrave;ng MacBook để l&agrave;m g&igrave;?</strong></p>\r\n\r\n	<ul>\r\n		<li>\r\n		<p>Văn ph&ograve;ng, soạn thảo, lướt web: c&oacute; thể chọn MacBook Air hoặc Pro cấu h&igrave;nh cơ bản.</p>\r\n		</li>\r\n		<li>\r\n		<p>Đồ họa, dựng video, lập tr&igrave;nh: ưu ti&ecirc;n MacBook Pro M1/M2 cho hiệu năng cao.</p>\r\n		</li>\r\n		<li>\r\n		<p>Học tập, giải tr&iacute;: MacBook Air M1/M2 đ&aacute;p ứng tốt.</p>\r\n		</li>\r\n	</ul>\r\n	</li>\r\n	<li>\r\n	<p><strong>Khi n&agrave;o bạn cần n&acirc;ng cấp?</strong></p>\r\n\r\n	<ul>\r\n		<li>\r\n		<p>Nếu laptop hiện tại vẫn chạy mượt, bạn c&oacute; thể chờ khuyến m&atilde;i hoặc phi&ecirc;n bản mới.</p>\r\n		</li>\r\n		<li>\r\n		<p>Ngược lại, mua ngay phi&ecirc;n bản ch&iacute;nh h&atilde;ng để kịp sử dụng.</p>\r\n		</li>\r\n	</ul>\r\n	</li>\r\n</ul>\r\n\r\n<p><img alt=\"\" src=\"https://cdn.tgdd.vn/Files/2018/12/15/1138288/ts-2017-apple-buying-guide_800x450.jpg\" style=\"height:450px; width:800px\" /></p>\r\n\r\n<hr />\r\n<h3>2. Lựa chọn d&ograve;ng MacBook ph&ugrave; hợp</h3>\r\n\r\n<p>Apple hiện c&oacute; 2 d&ograve;ng ch&iacute;nh:</p>\r\n\r\n<ol>\r\n	<li>\r\n	<p><strong>MacBook Air</strong></p>\r\n\r\n	<ul>\r\n		<li>\r\n		<p>Mỏng nhẹ, pin l&acirc;u (~15&ndash;18 giờ).</p>\r\n		</li>\r\n		<li>\r\n		<p>Chip M1/M2 đủ mạnh cho hầu hết c&ocirc;ng việc văn ph&ograve;ng, giải tr&iacute;.</p>\r\n		</li>\r\n		<li>\r\n		<p>Gi&aacute; khởi điểm dễ tiếp cận.</p>\r\n		</li>\r\n	</ul>\r\n	</li>\r\n	<li>\r\n	<p><strong>MacBook Pro</strong></p>\r\n\r\n	<ul>\r\n		<li>\r\n		<p>Hiệu năng cao, ph&ugrave; hợp đồ họa, lập tr&igrave;nh, dựng phim.</p>\r\n		</li>\r\n		<li>\r\n		<p>C&oacute; phi&ecirc;n bản 13&rdquo;, 14&rdquo;, 16&rdquo; với cấu h&igrave;nh M2 Pro, M2 Max.</p>\r\n		</li>\r\n		<li>\r\n		<p>Thiết kế d&agrave;y hơn, pin tốt hơn nhưng gi&aacute; cao hơn Air.</p>\r\n		</li>\r\n	</ul>\r\n	</li>\r\n</ol>\r\n\r\n<p><strong>Lời khuy&ecirc;n SEO:</strong> Khi t&igrave;m kiếm &ldquo;mua MacBook tốt&rdquo;, bạn n&ecirc;n k&egrave;m th&ecirc;m nhu cầu như &ldquo;MacBook Air gi&aacute; rẻ&rdquo; hoặc &ldquo;MacBook Pro cho lập tr&igrave;nh&rdquo; để thu hẹp kết quả.</p>\r\n\r\n<hr />\r\n<h3>3. Chọn cấu h&igrave;nh: CPU, RAM v&agrave; bộ nhớ</h3>\r\n\r\n<ul>\r\n	<li>\r\n	<p><strong>Chip xử l&yacute; (CPU/GPU):</strong></p>\r\n\r\n	<ul>\r\n		<li>\r\n		<p>Nếu chỉ l&agrave;m việc nhẹ, M1/M2 ti&ecirc;u chuẩn đ&atilde; qu&aacute; đủ.</p>\r\n		</li>\r\n		<li>\r\n		<p>Với c&ocirc;ng việc nặng, chọn M2 Pro/Max hoặc M1 Pro/Max.</p>\r\n		</li>\r\n	</ul>\r\n	</li>\r\n	<li>\r\n	<p><strong>RAM:</strong></p>\r\n\r\n	<ul>\r\n		<li>\r\n		<p>8 GB đủ cho đa số nhu cầu cơ bản.</p>\r\n		</li>\r\n		<li>\r\n		<p>16 GB hoặc 32 GB cho đồ họa, dựng video, chạy ảo h&oacute;a.</p>\r\n		</li>\r\n	</ul>\r\n	</li>\r\n	<li>\r\n	<p><strong>Bộ nhớ trong (SSD):</strong></p>\r\n\r\n	<ul>\r\n		<li>\r\n		<p>256 GB cho văn ph&ograve;ng, học tập.</p>\r\n		</li>\r\n		<li>\r\n		<p>512 GB &ndash; 1 TB cho người cần lưu trữ nhiều file h&igrave;nh ảnh, video.</p>\r\n		</li>\r\n	</ul>\r\n	</li>\r\n</ul>\r\n\r\n<hr />\r\n<h3>4. Mua ở đ&acirc;u để đảm bảo ch&iacute;nh h&atilde;ng v&agrave; gi&aacute; tốt</h3>\r\n\r\n<ul>\r\n	<li>\r\n	<p><strong>Apple Store ch&iacute;nh h&atilde;ng:</strong></p>\r\n\r\n	<ul>\r\n		<li>\r\n		<p>Đảm bảo h&agrave;ng mới 100 %, ch&iacute;nh s&aacute;ch bảo h&agrave;nh to&agrave;n cầu.</p>\r\n		</li>\r\n		<li>\r\n		<p>Gi&aacute; ni&ecirc;m yết, &iacute;t khuyến m&atilde;i.</p>\r\n		</li>\r\n	</ul>\r\n	</li>\r\n	<li>\r\n	<p><strong>Đại l&yacute; uỷ quyền Apple (APR):</strong></p>\r\n\r\n	<ul>\r\n		<li>\r\n		<p>FPT Shop, CellphoneS, Thế Giới Di Động&hellip;</p>\r\n		</li>\r\n		<li>\r\n		<p>Thường c&oacute; chương tr&igrave;nh trả g&oacute;p 0 %, qu&agrave; tặng k&egrave;m.</p>\r\n		</li>\r\n	</ul>\r\n	</li>\r\n	<li>\r\n	<p><strong>Mua x&aacute;ch tay uy t&iacute;n:</strong></p>\r\n\r\n	<ul>\r\n		<li>\r\n		<p>Gi&aacute; rẻ hơn một ch&uacute;t, nhưng cần kiểm tra kỹ nguồn gốc, bảo h&agrave;nh.</p>\r\n		</li>\r\n	</ul>\r\n	</li>\r\n	<li>\r\n	<p><strong>Săn m&atilde; giảm gi&aacute; &amp; khuyến m&atilde;i:</strong></p>\r\n\r\n	<ul>\r\n		<li>\r\n		<p>Theo d&otilde;i c&aacute;c sự kiện Apple Event, Black Friday, hoặc ưu đ&atilde;i cuối năm.</p>\r\n		</li>\r\n		<li>\r\n		<p>Nhập m&atilde; giảm 5&ndash;10 % tại website APR.</p>\r\n		</li>\r\n	</ul>\r\n	</li>\r\n</ul>\r\n\r\n<hr />\r\n<h3>5. Kiểm tra kỹ trước khi nhận m&aacute;y</h3>\r\n\r\n<p>Khi nhận m&aacute;y, bạn n&ecirc;n:</p>\r\n\r\n<ol>\r\n	<li>\r\n	<p><strong>Kiểm tra ngoại h&igrave;nh:</strong> Kh&ocirc;ng trầy xước, cấn m&oacute;p.</p>\r\n	</li>\r\n	<li>\r\n	<p><strong>Khởi động v&agrave; kiểm tra cấu h&igrave;nh:</strong> V&agrave;o <strong> &rarr; About This Mac</strong> để xem chip, RAM, SSD.</p>\r\n	</li>\r\n	<li>\r\n	<p><strong>Test m&agrave;n h&igrave;nh v&agrave; loa:</strong> Mở video, đổi g&oacute;c độ xem m&agrave;n h&igrave;nh c&oacute; bị &aacute;m m&agrave;u hay kh&ocirc;ng.</p>\r\n	</li>\r\n	<li>\r\n	<p><strong>Kiểm tra b&agrave;n ph&iacute;m v&agrave; trackpad:</strong> Bấm thử mọi ph&iacute;m, thử cử chỉ trackpad.</p>\r\n	</li>\r\n	<li>\r\n	<p><strong>Xem hạn bảo h&agrave;nh:</strong> D&ugrave;ng serial number tại apple.com để kiểm tra.</p>\r\n	</li>\r\n</ol>\r\n\r\n<hr />\r\n<h3>6. Mẹo &ldquo;săn&rdquo; MacBook gi&aacute; tốt v&agrave; gia tăng gi&aacute; trị</h3>\r\n\r\n<ul>\r\n	<li>\r\n	<p><strong>Mua m&aacute;y trưng b&agrave;y:</strong> Thường giảm 5&ndash;10 %, m&aacute;y mới nhưng đ&atilde; mở hộp.</p>\r\n	</li>\r\n	<li>\r\n	<p><strong>Chương tr&igrave;nh đổi cũ l&ecirc;n đời mới:</strong> Giảm gi&aacute; khi bạn đổi m&aacute;y cũ.</p>\r\n	</li>\r\n	<li>\r\n	<p><strong>Mua k&egrave;m AppleCare+:</strong> Bảo vệ th&ecirc;m va đập, rơi vỡ, hỗ trợ kỹ thuật.</p>\r\n	</li>\r\n	<li>\r\n	<p><strong>Sử dụng dịch vụ trả g&oacute;p 0 %:</strong> Giảm &aacute;p lực t&agrave;i ch&iacute;nh.</p>\r\n	</li>\r\n</ul>\r\n\r\n<hr />\r\n<h2>Kết luận</h2>\r\n\r\n<p>Để <strong>mua được một chiếc MacBook tốt</strong>, bạn cần:</p>\r\n\r\n<ol>\r\n	<li>\r\n	<p>X&aacute;c định r&otilde; nhu cầu sử dụng.</p>\r\n	</li>\r\n	<li>\r\n	<p>Chọn d&ograve;ng MacBook Air hay Pro ph&ugrave; hợp.</p>\r\n	</li>\r\n	<li>\r\n	<p>C&acirc;n nhắc cấu h&igrave;nh CPU, RAM v&agrave; SSD.</p>\r\n	</li>\r\n	<li>\r\n	<p>Chọn địa chỉ b&aacute;n ch&iacute;nh h&atilde;ng, uy t&iacute;n.</p>\r\n	</li>\r\n	<li>\r\n	<p>Kiểm tra cẩn thận trước khi nhận m&aacute;y.</p>\r\n	</li>\r\n	<li>\r\n	<p>Tận dụng khuyến m&atilde;i v&agrave; c&aacute;c g&oacute;i dịch vụ gia tăng.</p>\r\n	</li>\r\n</ol>', 'uploads/blogs/1748356712_6835ce6805364.jpg', 11, 19, 'active', '2025-05-09 09:06:44', '2025-05-27 14:38:32', NULL),
(8, 'Nên mua iPhone Xs Max hay iPhone 11 thường?', 'nen-mua-iphone-xs-max-hay-iphone-11-thuong', '<h1>N&ecirc;n mua iPhone Xs Max hay iPhone 11 thường? Đ&acirc;u l&agrave; lựa chọn hợp l&yacute; năm 2025?</h1>\r\n\r\n<h2>1. Giới thiệu</h2>\r\n\r\n<p>iPhone Xs Max v&agrave; iPhone 11 l&agrave; hai mẫu điện thoại cũ vẫn được săn đ&oacute;n nhiều trong năm 2025. D&ugrave; đ&atilde; ra mắt từ kh&aacute; l&acirc;u, cả hai vẫn mang lại hiệu năng ổn định, thiết kế cao cấp v&agrave; trải nghiệm mượt m&agrave; cho người d&ugrave;ng. Tuy nhi&ecirc;n, nếu bạn đang ph&acirc;n v&acirc;n giữa <strong>iPhone Xs Max</strong> v&agrave; <strong>iPhone 11 thường</strong>, đ&acirc;u l&agrave; lựa chọn hợp l&yacute; hơn?</p>\r\n\r\n<p>H&atilde;y c&ugrave;ng t&igrave;m hiểu chi tiết về <strong>hiệu năng, camera, m&agrave;n h&igrave;nh, thời lượng pin v&agrave; mức gi&aacute;</strong> của từng sản phẩm để c&oacute; c&aacute;i nh&igrave;n r&otilde; r&agrave;ng nhất.</p>\r\n\r\n<hr />\r\n<h2>2. So s&aacute;nh nhanh: iPhone Xs Max vs iPhone 11</h2>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<table>\r\n	<thead>\r\n		<tr>\r\n			<th>Ti&ecirc;u ch&iacute;</th>\r\n			<th>iPhone Xs Max</th>\r\n			<th>iPhone 11</th>\r\n		</tr>\r\n	</thead>\r\n	<tbody>\r\n		<tr>\r\n			<td>Năm ra mắt</td>\r\n			<td>2018</td>\r\n			<td>2019</td>\r\n		</tr>\r\n		<tr>\r\n			<td>M&agrave;n h&igrave;nh</td>\r\n			<td>OLED 6.5 inch</td>\r\n			<td>LCD 6.1 inch</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Chip xử l&yacute;</td>\r\n			<td>Apple A12 Bionic</td>\r\n			<td>Apple A13 Bionic</td>\r\n		</tr>\r\n		<tr>\r\n			<td>RAM</td>\r\n			<td>4GB</td>\r\n			<td>4GB</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Camera sau</td>\r\n			<td>2 camera (tele + g&oacute;c rộng)</td>\r\n			<td>2 camera (g&oacute;c rộng + si&ecirc;u rộng)</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Face ID</td>\r\n			<td>C&oacute;</td>\r\n			<td>C&oacute;</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Pin</td>\r\n			<td>3174 mAh</td>\r\n			<td>3110 mAh</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Kh&aacute;ng nước</td>\r\n			<td>IP68</td>\r\n			<td>IP68</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Hỗ trợ phần mềm</td>\r\n			<td>iOS 17+</td>\r\n			<td>iOS 17+</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Gi&aacute; b&aacute;n (m&aacute;y cũ)</td>\r\n			<td>~6-7 triệu</td>\r\n			<td>~6-8 triệu</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\r\n<p><img alt=\"\" src=\"https://m.media-amazon.com/images/I/81yMd8xSFAL.jpg\" style=\"height:700px; width:700px\" /></p>\r\n\r\n<hr />\r\n<h2>3. Hiệu năng v&agrave; trải nghiệm sử dụng</h2>\r\n\r\n<p>iPhone 11 sử dụng <strong>chip A13 Bionic</strong>, mạnh hơn so với <strong>A12 tr&ecirc;n iPhone Xs Max</strong>. Trong thực tế, sự kh&aacute;c biệt kh&ocirc;ng qu&aacute; lớn nếu bạn chỉ sử dụng c&aacute;c t&aacute;c vụ cơ bản như lướt web, xem phim, gọi video hay d&ugrave;ng mạng x&atilde; hội.</p>\r\n\r\n<p>Tuy nhi&ecirc;n, nếu bạn chơi game nặng, render video, th&igrave; iPhone 11 sẽ c&oacute; lợi thế về hiệu năng v&agrave; khả năng tiết kiệm pin.</p>\r\n\r\n<p>👉 <strong>Lời khuy&ecirc;n:</strong> Nếu bạn l&agrave; người y&ecirc;u th&iacute;ch hiệu năng, thường xuy&ecirc;n chơi game, n&ecirc;n chọn <strong>iPhone 11</strong>.</p>\r\n\r\n<hr />\r\n<h2>4. M&agrave;n h&igrave;nh: OLED vs LCD</h2>\r\n\r\n<p>iPhone Xs Max sở hữu <strong>m&agrave;n h&igrave;nh OLED 6.5 inch</strong> cho chất lượng hiển thị xuất sắc &ndash; m&agrave;u sắc rực rỡ, độ tương phản cao, m&agrave;u đen s&acirc;u. Trong khi đ&oacute;, iPhone 11 sử dụng <strong>m&agrave;n h&igrave;nh LCD Liquid Retina 6.1 inch</strong>, tuy vẫn đẹp nhưng kh&ocirc;ng thể s&aacute;nh bằng OLED.</p>\r\n\r\n<p>👉 <strong>Lời khuy&ecirc;n:</strong> Nếu bạn thường xuy&ecirc;n xem phim, chỉnh ảnh, th&iacute;ch m&agrave;n h&igrave;nh đẹp th&igrave; n&ecirc;n chọn <strong>iPhone Xs Max</strong>.</p>\r\n\r\n<p><img alt=\"\" src=\"https://m.media-amazon.com/images/I/51U8WCTTmCL._AC_UF894%2C1000_QL80_.jpg\" style=\"height:373px; width:273px\" /></p>\r\n\r\n<hr />\r\n<h2>5. Camera: Chụp xa hay chụp rộng?</h2>\r\n\r\n<p>Cả hai đều c&oacute; cụm <strong>2 camera sau</strong>, nhưng sự kh&aacute;c biệt nằm ở loại ống k&iacute;nh:</p>\r\n\r\n<ul>\r\n	<li>\r\n	<p><strong>iPhone Xs Max</strong> c&oacute; ống k&iacute;nh <strong>tele</strong> &ndash; ph&ugrave; hợp chụp ch&acirc;n dung, zoom xa.</p>\r\n	</li>\r\n	<li>\r\n	<p><strong>iPhone 11</strong> c&oacute; ống k&iacute;nh <strong>si&ecirc;u rộng</strong> &ndash; ph&ugrave; hợp du lịch, chụp phong cảnh.</p>\r\n	</li>\r\n</ul>\r\n\r\n<p>👉 <strong>Lời khuy&ecirc;n:</strong> Nếu bạn th&iacute;ch <strong>chụp g&oacute;c rộng</strong> =&gt; chọn <strong>iPhone 11</strong>. Nếu cần <strong>zoom v&agrave; chụp ch&acirc;n dung x&oacute;a ph&ocirc;ng đẹp</strong> =&gt; chọn <strong>iPhone Xs Max</strong>.</p>\r\n\r\n<hr />\r\n<h2>6. Thời lượng pin v&agrave; hỗ trợ phần mềm</h2>\r\n\r\n<p>Thời lượng pin giữa hai m&aacute;y kh&ocirc;ng ch&ecirc;nh lệch qu&aacute; nhiều. Tuy nhi&ecirc;n, <strong>iPhone 11 được Apple hỗ trợ l&acirc;u hơn</strong> do ra mắt sau một năm.</p>\r\n\r\n<p>👉 <strong>Lời khuy&ecirc;n:</strong> Nếu bạn muốn d&ugrave;ng l&acirc;u d&agrave;i, n&ecirc;n chọn <strong>iPhone 11</strong>.</p>\r\n\r\n<hr />\r\n<h2>7. Kết luận: N&ecirc;n mua iPhone Xs Max hay iPhone 11?</h2>\r\n\r\n<table>\r\n	<thead>\r\n		<tr>\r\n			<th>Bạn n&ecirc;n chọn</th>\r\n			<th>Nếu bạn cần&hellip;</th>\r\n		</tr>\r\n	</thead>\r\n	<tbody>\r\n		<tr>\r\n			<td><strong>iPhone Xs Max</strong></td>\r\n			<td>M&agrave;n h&igrave;nh đẹp (OLED), chụp ch&acirc;n dung đẹp, thiết kế sang trọng</td>\r\n		</tr>\r\n		<tr>\r\n			<td><strong>iPhone 11</strong></td>\r\n			<td>Hiệu năng mạnh, pin ổn định, camera si&ecirc;u rộng, d&ugrave;ng l&acirc;u d&agrave;i</td>\r\n		</tr>\r\n	</tbody>\r\n</table>', 'uploads/blogs/1746786917_681dda65cf134.jpg', 12, 1, 'active', '2025-05-09 10:35:17', '2025-05-27 13:58:29', NULL),
(9, 'm', 'm', '<p>m</p>', 'uploads/blogs/1747404340_6827463403c13.jpg', 11, NULL, 'active', '2025-05-16 14:05:40', '2025-05-16 14:06:35', '2025-05-16 14:06:35'),
(10, 'test', 'test', '<p>content</p>', 'uploads/blogs/1748268798_683476fe06ace.png', 11, 2, 'inactive', '2025-05-26 14:13:18', '2025-05-27 14:00:09', NULL);

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
(2, 43, '2025-05-28 16:50:10');

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
(1, 1, 71, 91, 5),
(2, 1, 73, 97, 3),
(3, 2, 71, 91, 15),
(4, 2, 73, 97, 5);

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
(5, 'AirPods', 'airpods', NULL, 5, 'active', 1, NULL, '2025-05-16 15:32:58', NULL),
(6, 'AirPod Pro 3', 'airpod-pro-3', 5, 0, 'active', 1, '2025-05-08 07:12:32', '2025-05-16 15:32:59', NULL),
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
(17, 'AirPod Pro 2', 'airpod-pro-2', 5, 5, 'active', 1, '2025-05-11 10:27:13', '2025-05-16 15:32:59', NULL),
(18, 'AirPod Pro 2.1', 'airpod-pro-21', 17, 5, 'active', 1, '2025-05-11 10:29:23', '2025-05-16 15:32:59', NULL),
(19, 'iphone13', 'iphone13', 1, 0, 'active', 1, '2025-05-19 14:43:35', '2025-05-19 14:43:35', NULL),
(20, 'Kim Hồng Phong', 'kim-hong-phong', 2, 3, 'active', 1, '2025-05-26 09:53:01', '2025-05-26 09:53:01', NULL),
(22, 'Kim Hồng', 'kim-hong', 2, 3, 'active', 1, '2025-05-26 09:53:46', '2025-05-26 09:53:46', NULL);

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
(1, 'Flash Sale Tháng 5/2025', '2025-05-28 08:00:00', '2025-05-28 20:00:00', 1, '2025-05-28 10:31:43', '2025-05-28 10:31:43'),
(2, 'Flash Sale Cuối Tuần', '2025-05-30 10:00:00', '2025-05-30 22:00:00', 1, '2025-05-28 10:31:43', '2025-05-28 10:31:43');

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
(129, '2025_05_29_202039_add_provider_columns_to_users_table', 70);

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
(1, 'App\\Models\\User', 2),
(2, 'App\\Models\\User', 19),
(3, 'App\\Models\\User', 22),
(3, 'App\\Models\\User', 32),
(3, 'App\\Models\\User', 38),
(3, 'App\\Models\\User', 40),
(3, 'App\\Models\\User', 41),
(3, 'App\\Models\\User', 42);

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
  `payment_method` enum('cod','bank_transfer','credit_card','vnpay','qr') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'cod',
  `payment_status` enum('pending','paid','failed','refunded') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `shipping_method_id` bigint(20) UNSIGNED DEFAULT NULL,
  `status` enum('pending','confirmed','preparing','shipping','completed','cancelled') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
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

INSERT INTO `orders` (`id`, `user_id`, `subtotal`, `discount`, `shipping_fee`, `total_price`, `shipping_address`, `shipping_name`, `shipping_phone`, `shipping_email`, `payment_method`, `payment_status`, `shipping_method_id`, `status`, `is_paid`, `notes`, `cancel_reason`, `created_at`, `updated_at`, `deleted_at`) VALUES
(2, NULL, 81980000.00, 0.00, 30000.00, 82010000.00, 'Hồ Chí Minh, Việt Nam', 'User', '0987654321', 'daicvph50503@gmail.com', 'bank_transfer', 'paid', 1, 'completed', 1, 'Đơn hàng mẫu', NULL, '2025-05-08 14:32:35', '2025-05-19 16:38:31', NULL),
(14, 1, 555.00, 0.00, 0.00, 555.00, 'Nam từ liêm hà nội', 'Đại Chu', '0968791306', 'daicvph50503@gmail.com', 'cod', 'pending', NULL, 'completed', 0, 'Đơn hàng test', NULL, '2025-05-27 01:01:09', '2025-05-27 03:11:43', NULL),
(15, 1, 222.00, 0.00, 0.00, 222.00, 'Nam từ liêm hà nội 73', 'Đại vazz', '098765432', 'dai@gmail.com', 'cod', 'pending', NULL, 'pending', 0, 'demo', NULL, '2025-05-27 01:17:36', '2025-05-27 01:17:36', NULL),
(16, 1, 555.00, 0.00, 0.00, 555.00, 'Nam từ liêm hà nội', 'Đại qq', '0968791306', 'dai@gmail.com', 'cod', 'pending', NULL, 'pending', 0, 'xxxx', NULL, '2025-05-27 01:25:05', '2025-05-27 01:25:05', NULL),
(17, 1, 333.00, 0.00, 0.00, 333.00, 'Nam từ liêm hà nội 54', 'Đại Chu', '0968791306', 'dai@gmail.com', 'cod', 'pending', NULL, 'shipping', 0, 'zzzzz', NULL, '2025-05-27 01:41:21', '2025-05-27 03:33:14', NULL),
(18, 1, 333.00, 0.00, 0.00, 333.00, 'Nam từ liêm hà nội 98', 'Đại vvvvv', '0968791306', 'dai50503@gmail.com', 'cod', 'pending', NULL, 'completed', 0, 'sssss', NULL, '2025-05-27 01:55:09', '2025-05-27 03:26:45', NULL),
(19, 1, 333.00, 0.00, 0.00, 333.00, 'Nam từ liêm hà nội', 'Đại qqqqq', '0968791306', 'hayeca2095@frisbook.com', 'cod', 'pending', NULL, 'completed', 0, 'hngfds', NULL, '2025-05-27 02:30:38', '2025-05-27 03:23:42', NULL),
(20, 1, 999.00, 0.00, 0.00, 999.00, '123456', 'aaa ccc', '098765432', 'chudaiabc123@gmail.com', 'cod', 'pending', NULL, 'pending', 0, 'zzzz', NULL, '2025-05-28 12:13:32', '2025-05-28 12:13:32', NULL),
(21, 1, 222.00, 0.00, 0.00, 222.00, '123456', 'aaa ccc', '1234y65tr4', 'chudaiabc123@gmail.com', 'cod', 'pending', NULL, 'pending', 0, 'gfds', NULL, '2025-05-28 12:19:32', '2025-05-28 12:19:32', NULL),
(22, 1, 1110.00, 0.00, 0.00, 1110.00, '123456', 'aaa ccc', '1234y65tr4', 'daicvph50503@gmail.com', 'cod', 'pending', NULL, 'pending', 0, 'ádf', NULL, '2025-05-28 12:21:58', '2025-05-28 12:21:58', NULL),
(23, 1, 222.00, 0.00, 0.00, 222.00, '123456', 'aaa ccc', '1234y65tr4', 'chudaiabc123@gmail.com', 'cod', 'pending', NULL, 'cancelled', 0, 'ádfg', 'xxxxxxxx', '2025-05-28 12:24:25', '2025-05-28 13:17:27', NULL),
(24, 1, 222.00, 0.00, 0.00, 222.00, '123456', 'aaa ccc', '1234y65tr4', 'daicvph50503@gmail.com', 'cod', 'pending', NULL, 'cancelled', 0, 'jhgfdsa', 't kh thích', '2025-05-28 12:26:46', '2025-05-28 13:13:38', NULL),
(25, 1, 222.00, 0.00, 0.00, 222.00, 'Nam từ liêm hà nội', 'Đại Chu', '09876432', 'daicvph50503@gmail.com', 'cod', 'pending', NULL, 'preparing', 0, 'bjgfgds', NULL, '2025-05-28 13:02:58', '2025-05-28 13:07:34', NULL),
(26, NULL, 555.00, 0.00, 0.00, 555.00, 'lkuyhtrew', 'Đại HNGFVD', '0968791306', 'chudaiabc123@gmail.com', 'vnpay', 'pending', NULL, 'pending', 0, 'bgvfd', NULL, '2025-05-28 14:37:45', '2025-05-28 14:37:45', NULL),
(27, NULL, 555.00, 0.00, 0.00, 555.00, 'T', 'OIKUYHT KJHJYH', '0968791306', 'daicvph50503@gmail.com', 'vnpay', 'pending', NULL, 'pending', 0, 'JJYHTR', NULL, '2025-05-28 14:40:26', '2025-05-28 14:40:26', NULL),
(28, NULL, 95333.00, 0.00, 0.00, 95333.00, 'Nam từ liêm hà nội 73', 'bình gold', '0968791306', 'chudaiabc123@gmail.com', 'vnpay', 'pending', NULL, 'completed', 0, 'gfdews', NULL, '2025-05-28 14:43:47', '2025-05-29 13:41:47', NULL),
(29, NULL, 190666.00, 0.00, 0.00, 190666.00, 'Nam từ liêm hà nội', 'bình HNGFVD', '0968791306', 'daicvph50503@gmail.com', 'vnpay', 'paid', NULL, 'confirmed', 1, 'jhg', NULL, '2025-05-28 14:47:25', '2025-05-28 14:48:32', NULL),
(30, NULL, 95333.00, 0.00, 0.00, 95333.00, 'Nam từ liêm hà nội', 'GDFSA văn', '0968791306', 'daicvph50503@gmail.com', 'vnpay', 'pending', NULL, 'completed', 0, 'jhgfds', NULL, '2025-05-28 14:53:10', '2025-05-29 14:08:12', NULL),
(31, NULL, 95333.00, 0.00, 0.00, 95333.00, 'Nam từ liêm hà nội', 'Đại tt', '098765', 'daicvph50503@gmail.com', 'vnpay', 'paid', NULL, 'confirmed', 1, 'trewq', NULL, '2025-05-28 15:00:31', '2025-05-28 15:01:19', NULL),
(32, 42, 95333.00, 0.00, 0.00, 95333.00, 'Vọng Giang', 'đại học', '0968791308', 'daichuvan05@gmail.com', 'vnpay', 'pending', NULL, 'completed', 0, NULL, NULL, '2025-05-28 15:18:28', '2025-05-29 12:18:16', NULL),
(33, 42, 95333.00, 0.00, 0.00, 95333.00, 'Vọng Giang', 'đại học', '0968791308', 'daichuvan05@gmail.com', 'vnpay', 'paid', NULL, 'cancelled', 1, NULL, NULL, '2025-05-28 15:18:40', '2025-05-29 14:10:57', NULL),
(34, 42, 111.00, 0.00, 0.00, 111.00, 'Vọng Giang', 'đại học', '0968791308', 'daichuvan05@gmail.com', 'vnpay', 'pending', NULL, 'completed', 0, NULL, NULL, '2025-05-28 15:21:05', '2025-05-29 14:27:24', NULL),
(35, 42, 111.00, 0.00, 0.00, 111.00, 'Vọng Giang', 'đại học', '0968791308', 'daichuvan05@gmail.com', 'vnpay', 'pending', NULL, 'completed', 0, NULL, NULL, '2025-05-28 15:21:37', '2025-05-29 11:23:24', NULL),
(36, 42, 111.00, 0.00, 0.00, 111.00, 'Vọng Giang', 'đại học', '0968791308', 'daichuvan05@gmail.com', 'cod', 'pending', NULL, 'completed', 0, NULL, NULL, '2025-05-28 15:23:05', '2025-05-29 10:52:48', NULL),
(37, 42, 222.00, 0.00, 0.00, 222.00, 'Vọng Giang', 'đại học', '0968791308', 'daichuvan05@gmail.com', 'cod', 'pending', NULL, 'completed', 0, NULL, NULL, '2025-05-28 15:26:19', '2025-05-29 10:44:50', NULL),
(38, 42, 170666.00, 0.00, 0.00, 170666.00, 'Vọng Giang', 'đại học', '0968791308', 'daichuvan05@gmail.com', 'vnpay', 'paid', NULL, 'confirmed', 1, 'test nốt lần', NULL, '2025-05-29 15:47:29', '2025-05-29 15:48:17', NULL);

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
(8, 14, 71, 92, 1, 555.00, 555.00, '2025-05-27 01:01:09', '2025-05-27 01:01:09', NULL),
(9, 15, 73, 97, 2, 111.00, 222.00, '2025-05-27 01:17:37', '2025-05-27 01:17:37', NULL),
(10, 16, 71, 92, 1, 555.00, 555.00, '2025-05-27 01:25:05', '2025-05-27 01:25:05', NULL),
(11, 17, 71, 91, 1, 333.00, 333.00, '2025-05-27 01:41:21', '2025-05-27 01:41:21', NULL),
(12, 18, 71, 91, 1, 333.00, 333.00, '2025-05-27 01:55:09', '2025-05-27 01:55:09', NULL),
(13, 19, 71, 91, 1, 333.00, 333.00, '2025-05-27 02:30:38', '2025-05-27 02:30:38', NULL),
(14, 20, 71, 91, 3, 333.00, 999.00, '2025-05-28 12:13:32', '2025-05-28 12:13:32', NULL),
(15, 21, 73, 97, 2, 111.00, 222.00, '2025-05-28 12:19:32', '2025-05-28 12:19:32', NULL),
(16, 22, 71, 92, 2, 555.00, 1110.00, '2025-05-28 12:21:58', '2025-05-28 12:21:58', NULL),
(17, 23, 73, 97, 2, 111.00, 222.00, '2025-05-28 12:24:25', '2025-05-28 12:24:25', NULL),
(18, 24, 73, 97, 2, 111.00, 222.00, '2025-05-28 12:26:46', '2025-05-28 12:26:46', NULL),
(19, 25, 73, 97, 2, 111.00, 222.00, '2025-05-28 13:02:58', '2025-05-28 13:02:58', NULL),
(20, 26, 71, 92, 1, 555.00, 555.00, '2025-05-28 14:37:45', '2025-05-28 14:37:45', NULL),
(21, 27, 71, 92, 1, 555.00, 555.00, '2025-05-28 14:40:26', '2025-05-28 14:40:26', NULL),
(22, 28, 71, 91, 1, 95333.00, 95333.00, '2025-05-28 14:43:47', '2025-05-28 14:43:47', NULL),
(23, 29, 71, 91, 2, 95333.00, 190666.00, '2025-05-28 14:47:25', '2025-05-28 14:47:25', NULL),
(24, 30, 71, 91, 1, 95333.00, 95333.00, '2025-05-28 14:53:10', '2025-05-28 14:53:10', NULL),
(25, 31, 71, 91, 1, 95333.00, 95333.00, '2025-05-28 15:00:31', '2025-05-28 15:00:31', NULL),
(26, 32, 71, 91, 1, 95333.00, 95333.00, '2025-05-28 15:18:28', '2025-05-28 15:18:28', NULL),
(27, 33, 71, 91, 1, 95333.00, 95333.00, '2025-05-28 15:18:40', '2025-05-28 15:18:40', NULL),
(28, 34, 73, 97, 1, 111.00, 111.00, '2025-05-28 15:21:05', '2025-05-28 15:21:05', NULL),
(29, 35, 73, 97, 1, 111.00, 111.00, '2025-05-28 15:21:37', '2025-05-28 15:21:37', NULL),
(30, 36, 73, 97, 1, 111.00, 111.00, '2025-05-28 15:23:05', '2025-05-28 15:23:05', NULL),
(31, 37, 73, 97, 2, 111.00, 222.00, '2025-05-28 15:26:19', '2025-05-28 15:26:19', NULL),
(32, 38, 71, 91, 2, 85333.00, 170666.00, '2025-05-29 15:47:29', '2025-05-29 15:47:29', NULL);

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
(71, 'iPhone 15 Pro Max', 'iphone-15-pro-max', 'Đây là iphone 15 Pro Max', '<p>Đ&acirc;y l&agrave; iphone 15 Pro Max</p>', 1, 12, 0, 'active', 344, '2025-05-23 08:19:10', '2025-05-29 16:58:30', NULL),
(72, 'Kim Hồng Phong', 'kim-hong-phong', '123', '<p>123</p>', 2, 12, 0, 'active', 9, '2025-05-25 05:15:53', '2025-05-26 23:01:53', '2025-05-26 23:01:53'),
(73, 'AirPods Pro (2nd Gen) USB-C', 'airpods-pro-2nd-gen-usb-c', 'aaaaaaaaaaa', '<p>aaaaaaaaaa</p>', 5, 12, 1, 'active', 34, '2025-05-26 04:54:15', '2025-05-29 14:45:30', NULL),
(74, 'iphone 13 ProMax', 'iphone-13-promax', 'Sản phẩm mới nhất của chúng tôi hiện nay', '<p>Khuyến m&atilde;i trị gi&aacute; 500.000₫<small>Gi&aacute; v&agrave; khuyến m&atilde;i c&oacute; thể kết th&uacute;c sớm hơn dự kiến</small></p>\r\n\r\n<p>&nbsp;<strong>Phiếu mua h&agrave;ng AirPods, Apple Watch, Macbook trị gi&aacute; 500,000đ</strong></p>\r\n\r\n<p>&nbsp;<strong>Phiếu mua h&agrave;ng &aacute;p dụng mua Sạc dự ph&ograve;ng (trừ h&atilde;ng AVA+, Hydrus), đồng hồ th&ocirc;ng minh (trừ Apple), Tai nghe v&agrave; Loa bluetooth (h&atilde;ng JBL, Marshall,Harmar Kardon ,Sony) trị gi&aacute; 100.000đ</strong></p>\r\n\r\n<p><strong>+73.580</strong>&nbsp;điểm t&iacute;ch lũy Qu&agrave; Tặng VIP</p>\r\n\r\n<ul>\r\n	<li>Giao h&agrave;ng nhanh ch&oacute;ng (tuỳ khu vực)</li>\r\n	<li>Mỗi số điện thoại chỉ mua 3 sản phẩm trong 1 th&aacute;ng</li>\r\n	<li>Gi&aacute; v&agrave; khuyến m&atilde;i c&oacute; thể kết th&uacute;c sớm</li>\r\n</ul>', 1, 12, 0, 'active', 5, '2025-05-26 23:19:44', '2025-05-26 23:32:51', '2025-05-26 23:32:51');

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
(135, 72, 4, 'đen', '2025-05-26 04:48:39', '2025-05-26 04:48:39', NULL),
(136, 72, 6, '16gb', '2025-05-26 04:48:39', '2025-05-26 04:48:39', NULL),
(137, 73, 4, 'White', '2025-05-26 04:54:15', '2025-05-26 04:54:15', NULL),
(138, 74, 5, 'Dung lượng', '2025-05-26 23:30:09', '2025-05-26 23:30:09', NULL),
(139, 74, 6, 'Ram', '2025-05-26 23:30:09', '2025-05-26 23:30:09', NULL),
(146, 71, 5, '128GB,256GB,...', '2025-05-29 15:26:42', '2025-05-29 15:26:42', NULL),
(147, 71, 6, '8GB', '2025-05-29 15:26:42', '2025-05-29 15:26:42', NULL);

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
(91, 71, 'SP-77834', 'iPhone 15 Pro Max - White - 128GB', 'iphone-15-pro-max-white-128gb', NULL, 318, 'active', 1, '2025-05-25 03:28:46', '2025-05-29 15:47:29', NULL, '\"[\\\"uploads\\\\/products\\\\/1748277915_0_a1.jpg\\\",\\\"uploads\\\\/products\\\\/1748277915_0_a2.jpg\\\",\\\"uploads\\\\/products\\\\/1748277915_0_a3.jpg\\\"]\"', 89333.00, 85333.00),
(92, 71, 'SP-74708', 'iPhone 15 Pro Max - Black - 128GB', 'iphone-15-pro-max-black-128gb', NULL, 549, 'active', 0, '2025-05-25 03:28:46', '2025-05-28 14:40:26', NULL, '\"[\\\"uploads\\\\/products\\\\/1748277915_1_a19.jpeg\\\",\\\"uploads\\\\/products\\\\/1748277915_1_a24.webp\\\",\\\"uploads\\\\/products\\\\/1748277915_1_a27.webp\\\"]\"', 555.00, 555.00),
(95, 72, 'SP-72278', 'Kim Hồng Phong - 128GB', 'kim-hong-phong-128gb', NULL, 111, 'active', 1, '2025-05-26 04:41:42', '2025-05-26 04:48:39', '2025-05-26 04:48:39', '\"[\\\"uploads\\\\/products\\\\/1748234502_0_banner 3.jpg\\\"]\"', 111.00, 111.00),
(96, 72, 'SP-04187', 'Kim Hồng Phong - White', 'kim-hong-phong-white', NULL, 222, 'active', 1, '2025-05-26 04:48:39', '2025-05-26 04:48:39', NULL, '\"[\\\"uploads\\\\/products\\\\/1748234919_0_me.jpg\\\"]\"', 222.00, 222.00),
(97, 73, 'SP-00731', 'AirPods Pro (2nd Gen) USB-C - White', 'airpods-pro-2nd-gen-usb-c-white', NULL, 96, 'active', 1, '2025-05-26 04:54:15', '2025-05-28 15:26:19', NULL, '\"[\\\"uploads\\\\/products\\\\/1748235255_0_airpods-4-thumb-1-650x650.png\\\"]\"', 111.00, 111.00),
(98, 74, 'SP-00741', 'iphone 13 ProMax - Red - Xanh', 'iphone-13-promax-red-xanh', NULL, 12, 'active', 1, '2025-05-26 23:19:44', '2025-05-26 23:19:44', NULL, '\"[\\\"uploads\\\\/products\\\\/1748276384_0_a2.jpg\\\",\\\"uploads\\\\/products\\\\/1748276384_0_a5.jpg\\\"]\"', 99999.00, 89999.00),
(99, 74, 'SP-36789', 'iphone 13 ProMax - Balck - Dung lượng', 'iphone-13-promax-balck-dung-luong', NULL, 12, 'active', 1, '2025-05-26 23:30:09', '2025-05-26 23:30:09', NULL, '\"[\\\"uploads\\\\/products\\\\/1748277009_0_a2.jpg\\\"]\"', 78999.00, 65999.00);

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
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('5MY3xkqmrOl6GtQnuWGggD3GntzBPUYYacDC7R7t', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiaklyaGtKNG1zb2RxaEprZjN0ZktLTnd6SlhQQ1V6TjFoY0JKejhUUiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjc6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9sb2dpbiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fXM6MzoidXJsIjthOjE6e3M6ODoiaW50ZW5kZWQiO3M6Mjc6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hZG1pbiI7fX0=', 1748513823),
('6kwr7VVgfhDpG6XK6QQDSfgXtPUyta4cUzPcOYh1', NULL, '172.71.81.216', 'WhatsApp/2', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiOWNtNnF3WDNsR3FaQjJiSDB2Q3U3YnI5MXl6a1J3eFBwTmY1TWZhdCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjk6Imh0dHA6Ly9hcHBsZXN0b3JlLmtlbmh3ZWIuY29tIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1748524654),
('berHxivXTJXNV64NSvwmCObIH1lFoVmzVd52h180', 43, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiZ1Jsd1NNemJ2SUxpTThvbFlmY2U2WkluQjRZM044TmlTN0hEQVNKcyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDc6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9wcm9kdWN0L2lwaG9uZS0xNS1wcm8tbWF4Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6NDM7fQ==', 1748512711),
('D3N3MGDNB1P8PiM6FjpZ8dK44jmYaWCkH4xwWxYr', NULL, '162.158.162.108', 'WhatsApp/2', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiTll2Yk9NZTU3cFNNMzYzanpSWFN6cDQyWU1DdEl3dlBBdWNlUU9HQyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjk6Imh0dHA6Ly9hcHBsZXN0b3JlLmtlbmh3ZWIuY29tIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1748524644),
('lcbDjGLzTWDtrA3MjOs2PYnOdDQYHXUtq4ccM7Fa', 42, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiUGxJS3UzS0xFYzB3b1UxZWV5ZHNHNHQ5dEpUVFFiWXlSUXd3czFTWiI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mzk6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9vcmRlci90cmFja2luZy8zNyI7fXM6NTA6ImxvZ2luX3dlYl81OWJhMzZhZGRjMmIyZjk0MDE1ODBmMDE0YzdmNThlYTRlMzA5ODlkIjtpOjQyO30=', 1748508503),
('LZkLUfXeFnh1tXxYLGfDyYGWY45VTMaAcyYBKmLP', NULL, '162.158.41.15', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiQVFRSVl2OEZZcW04bVpqaWFJR21RU3NYM3RlMUs2Y2JrcnAyblFGeiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjk6Imh0dHA6Ly9hcHBsZXN0b3JlLmtlbmh3ZWIuY29tIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1748524449),
('U4SNB2aRm8n8wvRMHGnUlh1CAAu5U0CK1LxHwk0S', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiZ2x1eTZvSjhobkxTTzFRZVdBNzc5OTA2c3doMFNuOHFROUxsUWlIUiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzY6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hZG1pbi9wcm9kdWN0cyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fXM6NTA6ImxvZ2luX3dlYl81OWJhMzZhZGRjMmIyZjk0MDE1ODBmMDE0YzdmNThlYTRlMzA5ODlkIjtpOjE7fQ==', 1748509787),
('w9TesDqaYDBw8zSpFnFky8OeEqgJdqicduT5LwR8', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 'YTo1OntzOjY6Il90b2tlbiI7czo0MDoiRzBzTXY3MEt0VHhkOEhMTWNzdGhlbUhET1F3NmZKdWx4R1JzMERIWCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzM6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hdXRoL2dvb2dsZSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fXM6MzoidXJsIjthOjE6e3M6ODoiaW50ZW5kZWQiO3M6Mjc6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hZG1pbiI7fXM6NToic3RhdGUiO3M6NDA6InpLdEVpajRuV1JjMGVBdnBwYlBYbjVXSE9mUHdRNXRiUWJ2RnBvdEYiO30=', 1748525704);

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
(4, 'Color', 'aaaaa', '[\"2\", \"3\", \"4\", \"5\"]', 'active', '2025-05-17 10:27:51', '2025-05-17 10:36:25', NULL),
(5, 'Storage', 'aaa', '[\"1\", \"3\", \"9\", \"10\"]', 'active', '2025-05-17 10:32:52', '2025-05-17 10:32:52', NULL),
(6, 'Ram', 'chaaa', '[\"1\", \"2\", \"3\"]', 'active', '2025-05-17 11:25:10', '2025-05-17 11:25:10', NULL),
(7, '1', NULL, '[\"3\"]', 'active', '2025-05-17 11:25:26', '2025-05-17 11:25:26', NULL),
(8, '2', NULL, '[\"3\"]', 'active', '2025-05-17 11:25:37', '2025-05-17 11:25:37', NULL),
(9, '3', 'aaaaa', '[\"3\"]', 'active', '2025-05-17 11:25:58', '2025-05-17 11:25:58', NULL),
(10, '4', NULL, '[\"3\"]', 'active', '2025-05-17 11:26:12', '2025-05-17 11:26:12', NULL),
(11, '5', NULL, '[\"3\"]', 'active', '2025-05-17 11:26:31', '2025-05-17 11:26:31', NULL),
(12, '6', NULL, '[\"3\"]', 'active', '2025-05-17 11:26:46', '2025-05-17 11:26:46', NULL);

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
(1, 'Admin ', 'admin@gmail.com', NULL, '$2y$12$si7gRydbJe6uPDz/0pxqDuipwDwT9Q/2pVpf0HpS6k/lt5z70Uhtu', NULL, NULL, '0123456789', 'Hanoi', NULL, NULL, 'other', 0, '2025-05-29 15:26:01', 'active', 'hrC7Amyy4s6MQ4Om2uwtS25MLw3IlE9TsodQ2U9yhRK7Gbry3bPWQyWqZaoK', '2025-05-16 15:31:25', '2025-05-29 15:26:01', NULL),
(2, 'Staff ', 'staffp@gmail.com', NULL, '$2y$12$de5HWZYmyu9wLPmTzHmyJOjVt1J1uxTaBtWCyQQgZj/kIpNR7At3a', NULL, NULL, '0987654321', 'Hanoi', NULL, NULL, 'other', 0, NULL, 'active', NULL, '2025-05-15 12:40:59', '2025-05-15 12:40:59', NULL),
(19, 'Staff User', 'staffp@example.com', NULL, '$2y$12$WHrqm55gWHco5y8WkiNczeLnELUpkpEj3eJC3tOAxHV2QUp1o0DJm', NULL, NULL, '0987654321', 'Hanoi', NULL, NULL, 'other', 0, NULL, 'active', NULL, '2025-05-23 14:48:11', '2025-05-23 14:48:11', NULL),
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
(41, 'Kim Hong Phong Dai', 'daicv@gmail.com', NULL, '$2y$12$JcBJQvn.Cffa3B/ohBz2v..4mW4hmeKceF9cYV3qtj55ZKy6.2WX6', NULL, NULL, '0368706552', 'Số nhà 71, phố tiền phong, phường tiên cát', NULL, '2025-05-21', 'male', 0, '2025-05-26 22:08:16', 'active', 'JHGQYfCLgyB1gD0ebHR1CSEclBpoAoJoKl9sxjHt9jFMkq3ENc4lU0cN8bHi', '2025-05-26 22:07:41', '2025-05-26 22:08:16', NULL),
(42, 'đại học coder', 'daichuvan05@gmail.com', NULL, '$2y$12$zabvva8SdzabLKbOkbzvKOxczOwxUaExwGePOUB3mjF7wlyA3B/V2', NULL, NULL, '0968791308', 'Vọng Giang', NULL, '2025-05-05', 'male', 0, '2025-05-29 14:30:55', 'active', NULL, '2025-05-28 14:57:13', '2025-05-29 14:30:55', NULL),
(43, 'Cường', 'test@gmail.com', NULL, '$2y$12$3n6LLncP6oIAforDGEkCKO5YEp/mhdvHQwK4UU2thehOUNRGmzBha', NULL, NULL, '09876543', 'Hà Nội', NULL, '2025-05-28', 'male', 0, '2025-05-29 14:30:49', 'active', NULL, '2025-05-28 22:46:16', '2025-05-29 14:30:49', NULL);

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
(3, 'color', '[\"1\", \"2\", \"3\", \"4\", \"5\"]', 'text', 0, 'active', '2025-05-17 09:03:49', '2025-05-23 07:32:05', NULL),
(4, 'Storage', '[\"1\", \"2\", \"3\"]', 'text', 0, 'active', '2025-05-17 09:07:11', '2025-05-17 10:53:38', NULL),
(5, 'Screen', '[\"2\", \"3\"]', 'text', 0, 'active', '2025-05-22 02:45:47', '2025-05-22 03:02:24', NULL);

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
(43, 3, '[\"White\"]', '[\"#FFFFFF\"]', 'active', '2025-05-25 03:28:46', '2025-05-25 03:28:46', NULL),
(44, 4, '[\"128GB\"]', '[]', 'active', '2025-05-25 03:28:46', '2025-05-25 03:28:46', NULL),
(45, 3, '[\"Black\"]', '[\"#000000\"]', 'active', '2025-05-25 03:28:46', '2025-05-25 03:28:46', NULL),
(46, 4, '[\"128GB\"]', '[]', 'active', '2025-05-25 03:28:46', '2025-05-25 03:28:46', NULL),
(49, 3, '[\"White\"]', '[\"#FFFFFF\"]', 'active', '2025-05-26 04:48:39', '2025-05-26 04:48:39', NULL),
(50, 3, '[\"White\"]', '[\"#FFFFFF\"]', 'active', '2025-05-26 04:54:15', '2025-05-26 04:54:15', NULL),
(51, 3, '[\"Red\"]', '[\"#FF0000\"]', 'active', '2025-05-26 23:19:44', '2025-05-26 23:19:44', NULL),
(52, 4, '[\"Xanh\"]', '[\"#0000FF\"]', 'active', '2025-05-26 23:19:44', '2025-05-26 23:19:44', NULL),
(53, 3, '[\"Balck\"]', '[\"#222222\"]', 'active', '2025-05-26 23:30:09', '2025-05-26 23:30:09', NULL),
(54, 4, '[\"Dung lượng\"]', '[\"#FF0000\"]', 'active', '2025-05-26 23:30:09', '2025-05-26 23:30:09', NULL);

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

--
-- Đang đổ dữ liệu cho bảng `variant_combinations`
--

INSERT INTO `variant_combinations` (`id`, `variant_id`, `attribute_value_id`, `created_at`, `updated_at`) VALUES
(118, 91, 43, '2025-05-25 03:28:46', '2025-05-25 03:28:46'),
(119, 91, 44, '2025-05-25 03:28:46', '2025-05-25 03:28:46'),
(120, 92, 45, '2025-05-25 03:28:46', '2025-05-25 03:28:46'),
(121, 92, 46, '2025-05-25 03:28:46', '2025-05-25 03:28:46'),
(124, 96, 49, '2025-05-26 04:48:39', '2025-05-26 04:48:39'),
(125, 97, 50, '2025-05-26 04:54:15', '2025-05-26 04:54:15'),
(126, 98, 51, '2025-05-26 23:19:44', '2025-05-26 23:19:44'),
(127, 98, 52, '2025-05-26 23:19:44', '2025-05-26 23:19:44'),
(128, 99, 53, '2025-05-26 23:30:09', '2025-05-26 23:30:09'),
(129, 99, 54, '2025-05-26 23:30:09', '2025-05-26 23:30:09');

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT cho bảng `blogs`
--
ALTER TABLE `blogs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT cho bảng `carts`
--
ALTER TABLE `carts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `cart_items`
--
ALTER TABLE `cart_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT cho bảng `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT cho bảng `contacts`
--
ALTER TABLE `contacts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT cho bảng `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `faqs`
--
ALTER TABLE `faqs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `flash_sales`
--
ALTER TABLE `flash_sales`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `flash_sale_items`
--
ALTER TABLE `flash_sale_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT cho bảng `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=69;

--
-- AUTO_INCREMENT cho bảng `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=130;

--
-- AUTO_INCREMENT cho bảng `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT cho bảng `order_details`
--
ALTER TABLE `order_details`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `order_items`
--
ALTER TABLE `order_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT cho bảng `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT cho bảng `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=75;

--
-- AUTO_INCREMENT cho bảng `product_reviews`
--
ALTER TABLE `product_reviews`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `product_specifications`
--
ALTER TABLE `product_specifications`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=148;

--
-- AUTO_INCREMENT cho bảng `product_variants`
--
ALTER TABLE `product_variants`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=100;

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT cho bảng `variant_attribute_values`
--
ALTER TABLE `variant_attribute_values`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=55;

--
-- AUTO_INCREMENT cho bảng `variant_combinations`
--
ALTER TABLE `variant_combinations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=130;

--
-- AUTO_INCREMENT cho bảng `vouchers`
--
ALTER TABLE `vouchers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

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
-- Các ràng buộc cho bảng `flash_sale_items`
--
ALTER TABLE `flash_sale_items`
  ADD CONSTRAINT `flash_sale_items_flash_sale_id_foreign` FOREIGN KEY (`flash_sale_id`) REFERENCES `flash_sales` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `flash_sale_items_product_variant_id_foreign` FOREIGN KEY (`product_variant_id`) REFERENCES `product_variants` (`id`) ON DELETE CASCADE;

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
-- Các ràng buộc cho bảng `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

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
