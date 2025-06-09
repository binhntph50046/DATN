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

 Date: 09/06/2025 14:31:29
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
INSERT INTO `banners` VALUES (1, 'Banner 1', 'uploads/banners/68450b64495d8.jpg', 'Đây là banner 1', NULL, 'active', 1, '2025-05-08 15:17:47', '2025-06-08 11:02:44');
INSERT INTO `banners` VALUES (2, 'Banner 2', 'uploads/banners/68450be6afb67.jpg', 'Đây là banner 2', NULL, 'active', 2, '2025-05-08 15:17:48', '2025-06-08 11:04:54');
INSERT INTO `banners` VALUES (3, 'Banner 3', 'uploads/banners/68450b9d61c0e.jpg', 'Đây là banner 3', NULL, 'active', 3, '2025-05-08 15:17:48', '2025-06-08 11:03:41');
INSERT INTO `banners` VALUES (4, 'Banner 4', 'uploads/banners/68450bb6a924e.jpg', 'Đây là banner 4', NULL, 'active', 7, '2025-05-08 15:17:49', '2025-06-08 11:04:06');

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
INSERT INTO `blogs` VALUES (1, 'Làm thế nào để học Laravel hiệu quả?', 'lam-the-nao-de-hoc-laravel-hieu-qua', 'Nội dung chi tiết về cách học Laravel nhanh và dễ hiểu...', 'blog1.jpg', 11, NULL, 'active', '2025-05-09 06:33:15', '2025-05-12 13:35:20', '2025-05-12 13:35:20');
INSERT INTO `blogs` VALUES (4, 'Làm sao để mua được 1 sản phẩm Iphone ưng ý ?', 'lam-sao-de-mua-duoc-1-san-pham-iphone-ung-y', '<h2>L&agrave;m sao để mua được một sản phẩm iPhone ưng &yacute;?</h2>\r\n\r\n<p><img alt=\"\" src=\"https://cdn.tgdd.vn/Files/2022/09/23/1471383/he-dieu-hanh-ios-la-gi-14.jpg\" style=\"height:394px; width:700px\" /></p>\r\n\r\n<p>Mua một chiếc iPhone kh&ocirc;ng phải l&agrave; một quyết định đơn giản, đặc biệt khi bạn muốn lựa chọn một sản phẩm vừa &yacute; v&agrave; ph&ugrave; hợp với nhu cầu sử dụng. Với nhiều d&ograve;ng iPhone kh&aacute;c nhau tr&ecirc;n thị trường, bạn c&oacute; thể cảm thấy bối rối khi phải chọn lựa giữa iPhone 15, iPhone 14, iPhone 13 hoặc thậm ch&iacute; c&aacute;c d&ograve;ng cũ hơn. B&agrave;i viết dưới đ&acirc;y sẽ hướng dẫn bạn c&aacute;ch chọn mua một chiếc iPhone ưng &yacute;, từ việc x&aacute;c định nhu cầu đến việc t&igrave;m kiếm nơi b&aacute;n uy t&iacute;n.</p>\r\n\r\n<h3>1. X&aacute;c định nhu cầu sử dụng iPhone</h3>\r\n\r\n<p>Trước khi bắt đầu chọn mua iPhone, điều quan trọng đầu ti&ecirc;n l&agrave; x&aacute;c định r&otilde; mục đ&iacute;ch v&agrave; nhu cầu sử dụng của m&igrave;nh. Bạn cần một chiếc điện thoại chỉ để phục vụ nhu cầu cơ bản như nghe gọi, nhắn tin, hay bạn muốn một chiếc m&aacute;y c&oacute; cấu h&igrave;nh mạnh mẽ để chơi game, chụp ảnh chất lượng cao, hoặc sử dụng c&aacute;c phần mềm đồ họa chuy&ecirc;n nghiệp?</p>\r\n\r\n<ul>\r\n	<li>\r\n	<p><strong>Nếu nhu cầu cơ bản:</strong> Bạn c&oacute; thể chọn c&aacute;c mẫu iPhone cũ như iPhone 13 hoặc iPhone SE.</p>\r\n	</li>\r\n	<li>\r\n	<p><strong>Nếu nhu cầu chơi game hoặc chụp ảnh cao cấp:</strong> iPhone 15, iPhone 14 Pro Max với chip A17 Bionic v&agrave; hệ thống camera n&acirc;ng cao sẽ l&agrave; lựa chọn tuyệt vời.</p>\r\n	</li>\r\n</ul>\r\n\r\n<h3>2. Chọn lựa phi&ecirc;n bản iPhone ph&ugrave; hợp</h3>\r\n\r\n<p><img alt=\"\" src=\"https://news.khangz.com/wp-content/uploads/2022/07/Ma-iPhone-cac-nuoc-4.jpg\" style=\"height:450px; width:800px\" /></p>\r\n\r\n<p>iPhone lu&ocirc;n c&oacute; nhiều phi&ecirc;n bản kh&aacute;c nhau với c&aacute;c t&iacute;nh năng v&agrave; mức gi&aacute; kh&aacute;c nhau. Một trong những yếu tố quan trọng khi chọn iPhone l&agrave; quyết định giữa phi&ecirc;n bản thường, phi&ecirc;n bản Pro hay Pro Max.</p>\r\n\r\n<ul>\r\n	<li>\r\n	<p><strong>iPhone thường</strong>: Đ&acirc;y l&agrave; lựa chọn hợp l&yacute; nếu bạn kh&ocirc;ng cần qu&aacute; nhiều t&iacute;nh năng cao cấp, nhưng vẫn muốn một chiếc điện thoại mạnh mẽ v&agrave; c&oacute; camera ổn định.</p>\r\n	</li>\r\n	<li>\r\n	<p><strong>iPhone Pro/Pro Max</strong>: D&agrave;nh cho những ai cần hiệu suất cao hơn, m&agrave;n h&igrave;nh đẹp hơn v&agrave; hệ thống camera chuy&ecirc;n nghiệp hơn.</p>\r\n	</li>\r\n</ul>\r\n\r\n<h3>3. Lựa chọn dung lượng bộ nhớ</h3>\r\n\r\n<p>iPhone c&oacute; c&aacute;c phi&ecirc;n bản với dung lượng bộ nhớ kh&aacute;c nhau, từ 64GB đến 1TB. Nếu bạn l&agrave; người sử dụng nhiều ứng dụng, chụp ảnh v&agrave; quay video thường xuy&ecirc;n, th&igrave; việc chọn phi&ecirc;n bản c&oacute; dung lượng bộ nhớ lớn l&agrave; rất quan trọng.</p>\r\n\r\n<ul>\r\n	<li>\r\n	<p><strong>64GB</strong>: Ph&ugrave; hợp với những ai sử dụng điện thoại chủ yếu để nghe gọi, lướt web.</p>\r\n	</li>\r\n	<li>\r\n	<p><strong>128GB v&agrave; 256GB</strong>: Lựa chọn hợp l&yacute; cho người d&ugrave;ng b&igrave;nh thường với nhu cầu lưu trữ ảnh v&agrave; video.</p>\r\n	</li>\r\n	<li>\r\n	<p><strong>512GB v&agrave; 1TB</strong>: D&agrave;nh cho những người c&oacute; nhu cầu lưu trữ lớn, chơi game, quay video 4K.</p>\r\n	</li>\r\n</ul>\r\n\r\n<h3>4. So s&aacute;nh gi&aacute; v&agrave; t&igrave;m mua ở địa chỉ uy t&iacute;n</h3>\r\n\r\n<p>Để mua được một chiếc iPhone ưng &yacute; với mức gi&aacute; tốt, bạn cần so s&aacute;nh gi&aacute; ở c&aacute;c cửa h&agrave;ng v&agrave; hệ thống b&aacute;n lẻ uy t&iacute;n. Ngo&agrave;i c&aacute;c cửa h&agrave;ng ch&iacute;nh h&atilde;ng của Apple, bạn cũng c&oacute; thể t&igrave;m mua iPhone tại c&aacute;c đại l&yacute; ph&acirc;n phối ch&iacute;nh thức hoặc c&aacute;c cửa h&agrave;ng trực tuyến.</p>\r\n\r\n<p>Lưu &yacute;:</p>\r\n\r\n<ul>\r\n	<li>\r\n	<p><strong>Kiểm tra nguồn gốc sản phẩm</strong>: Đảm bảo rằng chiếc iPhone bạn mua l&agrave; h&agrave;ng ch&iacute;nh h&atilde;ng, c&oacute; bảo h&agrave;nh đầy đủ.</p>\r\n	</li>\r\n	<li>\r\n	<p><strong>Chọn cửa h&agrave;ng c&oacute; ch&iacute;nh s&aacute;ch đổi trả r&otilde; r&agrave;ng</strong>: Để đảm bảo quyền lợi của m&igrave;nh nếu sản phẩm gặp phải sự cố.</p>\r\n	</li>\r\n</ul>\r\n\r\n<h3>5. Kiểm tra c&aacute;c chương tr&igrave;nh khuyến m&atilde;i, giảm gi&aacute;</h3>\r\n\r\n<p>Apple v&agrave; c&aacute;c cửa h&agrave;ng b&aacute;n lẻ thường xuy&ecirc;n c&oacute; c&aacute;c chương tr&igrave;nh khuyến m&atilde;i hoặc giảm gi&aacute; v&agrave;o c&aacute;c dịp lễ, Tết, hoặc trong c&aacute;c sự kiện đặc biệt. Đ&acirc;y l&agrave; cơ hội để bạn sở hữu một chiếc iPhone với mức gi&aacute; ưu đ&atilde;i.</p>\r\n\r\n<h3>6. Lựa chọn m&agrave;u sắc v&agrave; thiết kế</h3>\r\n\r\n<p>iPhone c&oacute; nhiều m&agrave;u sắc v&agrave; kiểu d&aacute;ng để bạn lựa chọn. D&ugrave; t&iacute;nh năng quan trọng nhất l&agrave; hiệu suất, nhưng thiết kế v&agrave; m&agrave;u sắc cũng ảnh hưởng đến cảm gi&aacute;c của người d&ugrave;ng. Bạn c&oacute; thể lựa chọn giữa c&aacute;c m&agrave;u như: đen, trắng, v&agrave;ng, xanh hoặc c&aacute;c m&agrave;u đặc biệt kh&aacute;c t&ugrave;y thuộc v&agrave;o phi&ecirc;n bản.</p>\r\n\r\n<h3>7. Tham khảo c&aacute;c đ&aacute;nh gi&aacute; v&agrave; review từ người d&ugrave;ng</h3>\r\n\r\n<p><img alt=\"\" src=\"https://24hstore.vn/upload_images/images/2022/10/21/iphone-14-series-2(1).jpg\" /></p>\r\n\r\n<p>Trước khi quyết định mua, đừng qu&ecirc;n tham khảo c&aacute;c đ&aacute;nh gi&aacute; v&agrave; phản hồi từ người d&ugrave;ng thực tế. C&aacute;c trang web c&ocirc;ng nghệ, diễn đ&agrave;n hoặc c&aacute;c video review tr&ecirc;n YouTube sẽ gi&uacute;p bạn hiểu r&otilde; hơn về trải nghiệm người d&ugrave;ng v&agrave; chất lượng sản phẩm.</p>\r\n\r\n<h3>8. Sử dụng c&aacute;c dịch vụ gia tăng (AppleCare, iCloud, v.v.)</h3>\r\n\r\n<p>Apple cung cấp c&aacute;c dịch vụ gia tăng như <strong>AppleCare</strong> để bảo vệ thiết bị của bạn trong suốt qu&aacute; tr&igrave;nh sử dụng. Nếu bạn c&oacute; nhu cầu lưu trữ đ&aacute;m m&acirc;y, <strong>iCloud</strong> l&agrave; dịch vụ tuyệt vời để sao lưu v&agrave; đồng bộ dữ liệu giữa c&aacute;c thiết bị.</p>\r\n\r\n<h3>Kết luận</h3>\r\n\r\n<p>Mua một chiếc iPhone ưng &yacute; kh&ocirc;ng chỉ phụ thuộc v&agrave;o việc chọn mẫu m&aacute;y m&agrave; c&ograve;n li&ecirc;n quan đến nhu cầu sử dụng, dung lượng bộ nhớ v&agrave; mức gi&aacute; bạn sẵn s&agrave;ng chi trả. H&atilde;y c&acirc;n nhắc kỹ lưỡng c&aacute;c yếu tố như t&iacute;nh năng, thiết kế v&agrave; chương tr&igrave;nh khuyến m&atilde;i để lựa chọn được chiếc iPhone ph&ugrave; hợp nhất với m&igrave;nh.<br />\r\nLink tham khảo:&nbsp;<a href=\"https://www.youtube.com/watch?v=mUafl7h5Prk\">https://www.youtube.com/watch?v=mUafl7h5Prk</a></p>', 'uploads/blogs/1747156059_68237c5b793d6.jpg', 12, 20, 'active', '2025-05-09 08:08:15', '2025-05-26 14:24:29', NULL);
INSERT INTO `blogs` VALUES (6, 'Làm sao có thể mua được 1 chiếc Macbook tốt?', 'lam-sao-co-the-mua-duoc-1-chiec-macbook-tot', '<h2>L&agrave;m sao để mua được một chiếc MacBook tốt?</h2>\r\n\r\n<p>Mua một chiếc MacBook kh&ocirc;ng chỉ đơn thuần l&agrave; chọn một thiết bị c&ocirc;ng nghệ cao, m&agrave; c&ograve;n l&agrave; đầu tư cho trải nghiệm l&agrave;m việc, học tập v&agrave; giải tr&iacute; l&acirc;u d&agrave;i. Để <strong>mua MacBook tốt</strong> v&agrave; ph&ugrave; hợp với nhu cầu, bạn cần c&acirc;n nhắc nhiều yếu tố từ cấu h&igrave;nh, d&ograve;ng sản phẩm đến địa chỉ mua h&agrave;ng uy t&iacute;n. Dưới đ&acirc;y l&agrave; hướng dẫn chi tiết gi&uacute;p bạn sở hữu chiếc MacBook ưng &yacute; nhất.</p>\r\n\r\n<hr />\r\n<h3>1. X&aacute;c định r&otilde; nhu cầu sử dụng</h3>\r\n\r\n<p>Trước khi bước v&agrave;o qu&aacute; tr&igrave;nh <strong>mua MacBook</strong>, h&atilde;y tự hỏi:</p>\r\n\r\n<ul>\r\n	<li>\r\n	<p><strong>Bạn d&ugrave;ng MacBook để l&agrave;m g&igrave;?</strong></p>\r\n\r\n	<ul>\r\n		<li>\r\n		<p>Văn ph&ograve;ng, soạn thảo, lướt web: c&oacute; thể chọn MacBook Air hoặc Pro cấu h&igrave;nh cơ bản.</p>\r\n		</li>\r\n		<li>\r\n		<p>Đồ họa, dựng video, lập tr&igrave;nh: ưu ti&ecirc;n MacBook Pro M1/M2 cho hiệu năng cao.</p>\r\n		</li>\r\n		<li>\r\n		<p>Học tập, giải tr&iacute;: MacBook Air M1/M2 đ&aacute;p ứng tốt.</p>\r\n		</li>\r\n	</ul>\r\n	</li>\r\n	<li>\r\n	<p><strong>Khi n&agrave;o bạn cần n&acirc;ng cấp?</strong></p>\r\n\r\n	<ul>\r\n		<li>\r\n		<p>Nếu laptop hiện tại vẫn chạy mượt, bạn c&oacute; thể chờ khuyến m&atilde;i hoặc phi&ecirc;n bản mới.</p>\r\n		</li>\r\n		<li>\r\n		<p>Ngược lại, mua ngay phi&ecirc;n bản ch&iacute;nh h&atilde;ng để kịp sử dụng.</p>\r\n		</li>\r\n	</ul>\r\n	</li>\r\n</ul>\r\n\r\n<p><img alt=\"\" src=\"https://cdn.tgdd.vn/Files/2018/12/15/1138288/ts-2017-apple-buying-guide_800x450.jpg\" style=\"height:450px; width:800px\" /></p>\r\n\r\n<hr />\r\n<h3>2. Lựa chọn d&ograve;ng MacBook ph&ugrave; hợp</h3>\r\n\r\n<p>Apple hiện c&oacute; 2 d&ograve;ng ch&iacute;nh:</p>\r\n\r\n<ol>\r\n	<li>\r\n	<p><strong>MacBook Air</strong></p>\r\n\r\n	<ul>\r\n		<li>\r\n		<p>Mỏng nhẹ, pin l&acirc;u (~15&ndash;18 giờ).</p>\r\n		</li>\r\n		<li>\r\n		<p>Chip M1/M2 đủ mạnh cho hầu hết c&ocirc;ng việc văn ph&ograve;ng, giải tr&iacute;.</p>\r\n		</li>\r\n		<li>\r\n		<p>Gi&aacute; khởi điểm dễ tiếp cận.</p>\r\n		</li>\r\n	</ul>\r\n	</li>\r\n	<li>\r\n	<p><strong>MacBook Pro</strong></p>\r\n\r\n	<ul>\r\n		<li>\r\n		<p>Hiệu năng cao, ph&ugrave; hợp đồ họa, lập tr&igrave;nh, dựng phim.</p>\r\n		</li>\r\n		<li>\r\n		<p>C&oacute; phi&ecirc;n bản 13&rdquo;, 14&rdquo;, 16&rdquo; với cấu h&igrave;nh M2 Pro, M2 Max.</p>\r\n		</li>\r\n		<li>\r\n		<p>Thiết kế d&agrave;y hơn, pin tốt hơn nhưng gi&aacute; cao hơn Air.</p>\r\n		</li>\r\n	</ul>\r\n	</li>\r\n</ol>\r\n\r\n<p><strong>Lời khuy&ecirc;n SEO:</strong> Khi t&igrave;m kiếm &ldquo;mua MacBook tốt&rdquo;, bạn n&ecirc;n k&egrave;m th&ecirc;m nhu cầu như &ldquo;MacBook Air gi&aacute; rẻ&rdquo; hoặc &ldquo;MacBook Pro cho lập tr&igrave;nh&rdquo; để thu hẹp kết quả.</p>\r\n\r\n<hr />\r\n<h3>3. Chọn cấu h&igrave;nh: CPU, RAM v&agrave; bộ nhớ</h3>\r\n\r\n<ul>\r\n	<li>\r\n	<p><strong>Chip xử l&yacute; (CPU/GPU):</strong></p>\r\n\r\n	<ul>\r\n		<li>\r\n		<p>Nếu chỉ l&agrave;m việc nhẹ, M1/M2 ti&ecirc;u chuẩn đ&atilde; qu&aacute; đủ.</p>\r\n		</li>\r\n		<li>\r\n		<p>Với c&ocirc;ng việc nặng, chọn M2 Pro/Max hoặc M1 Pro/Max.</p>\r\n		</li>\r\n	</ul>\r\n	</li>\r\n	<li>\r\n	<p><strong>RAM:</strong></p>\r\n\r\n	<ul>\r\n		<li>\r\n		<p>8 GB đủ cho đa số nhu cầu cơ bản.</p>\r\n		</li>\r\n		<li>\r\n		<p>16 GB hoặc 32 GB cho đồ họa, dựng video, chạy ảo h&oacute;a.</p>\r\n		</li>\r\n	</ul>\r\n	</li>\r\n	<li>\r\n	<p><strong>Bộ nhớ trong (SSD):</strong></p>\r\n\r\n	<ul>\r\n		<li>\r\n		<p>256 GB cho văn ph&ograve;ng, học tập.</p>\r\n		</li>\r\n		<li>\r\n		<p>512 GB &ndash; 1 TB cho người cần lưu trữ nhiều file h&igrave;nh ảnh, video.</p>\r\n		</li>\r\n	</ul>\r\n	</li>\r\n</ul>\r\n\r\n<hr />\r\n<h3>4. Mua ở đ&acirc;u để đảm bảo ch&iacute;nh h&atilde;ng v&agrave; gi&aacute; tốt</h3>\r\n\r\n<ul>\r\n	<li>\r\n	<p><strong>Apple Store ch&iacute;nh h&atilde;ng:</strong></p>\r\n\r\n	<ul>\r\n		<li>\r\n		<p>Đảm bảo h&agrave;ng mới 100 %, ch&iacute;nh s&aacute;ch bảo h&agrave;nh to&agrave;n cầu.</p>\r\n		</li>\r\n		<li>\r\n		<p>Gi&aacute; ni&ecirc;m yết, &iacute;t khuyến m&atilde;i.</p>\r\n		</li>\r\n	</ul>\r\n	</li>\r\n	<li>\r\n	<p><strong>Đại l&yacute; uỷ quyền Apple (APR):</strong></p>\r\n\r\n	<ul>\r\n		<li>\r\n		<p>FPT Shop, CellphoneS, Thế Giới Di Động&hellip;</p>\r\n		</li>\r\n		<li>\r\n		<p>Thường c&oacute; chương tr&igrave;nh trả g&oacute;p 0 %, qu&agrave; tặng k&egrave;m.</p>\r\n		</li>\r\n	</ul>\r\n	</li>\r\n	<li>\r\n	<p><strong>Mua x&aacute;ch tay uy t&iacute;n:</strong></p>\r\n\r\n	<ul>\r\n		<li>\r\n		<p>Gi&aacute; rẻ hơn một ch&uacute;t, nhưng cần kiểm tra kỹ nguồn gốc, bảo h&agrave;nh.</p>\r\n		</li>\r\n	</ul>\r\n	</li>\r\n	<li>\r\n	<p><strong>Săn m&atilde; giảm gi&aacute; &amp; khuyến m&atilde;i:</strong></p>\r\n\r\n	<ul>\r\n		<li>\r\n		<p>Theo d&otilde;i c&aacute;c sự kiện Apple Event, Black Friday, hoặc ưu đ&atilde;i cuối năm.</p>\r\n		</li>\r\n		<li>\r\n		<p>Nhập m&atilde; giảm 5&ndash;10 % tại website APR.</p>\r\n		</li>\r\n	</ul>\r\n	</li>\r\n</ul>\r\n\r\n<hr />\r\n<h3>5. Kiểm tra kỹ trước khi nhận m&aacute;y</h3>\r\n\r\n<p>Khi nhận m&aacute;y, bạn n&ecirc;n:</p>\r\n\r\n<ol>\r\n	<li>\r\n	<p><strong>Kiểm tra ngoại h&igrave;nh:</strong> Kh&ocirc;ng trầy xước, cấn m&oacute;p.</p>\r\n	</li>\r\n	<li>\r\n	<p><strong>Khởi động v&agrave; kiểm tra cấu h&igrave;nh:</strong> V&agrave;o <strong> &rarr; About This Mac</strong> để xem chip, RAM, SSD.</p>\r\n	</li>\r\n	<li>\r\n	<p><strong>Test m&agrave;n h&igrave;nh v&agrave; loa:</strong> Mở video, đổi g&oacute;c độ xem m&agrave;n h&igrave;nh c&oacute; bị &aacute;m m&agrave;u hay kh&ocirc;ng.</p>\r\n	</li>\r\n	<li>\r\n	<p><strong>Kiểm tra b&agrave;n ph&iacute;m v&agrave; trackpad:</strong> Bấm thử mọi ph&iacute;m, thử cử chỉ trackpad.</p>\r\n	</li>\r\n	<li>\r\n	<p><strong>Xem hạn bảo h&agrave;nh:</strong> D&ugrave;ng serial number tại apple.com để kiểm tra.</p>\r\n	</li>\r\n</ol>\r\n\r\n<hr />\r\n<h3>6. Mẹo &ldquo;săn&rdquo; MacBook gi&aacute; tốt v&agrave; gia tăng gi&aacute; trị</h3>\r\n\r\n<ul>\r\n	<li>\r\n	<p><strong>Mua m&aacute;y trưng b&agrave;y:</strong> Thường giảm 5&ndash;10 %, m&aacute;y mới nhưng đ&atilde; mở hộp.</p>\r\n	</li>\r\n	<li>\r\n	<p><strong>Chương tr&igrave;nh đổi cũ l&ecirc;n đời mới:</strong> Giảm gi&aacute; khi bạn đổi m&aacute;y cũ.</p>\r\n	</li>\r\n	<li>\r\n	<p><strong>Mua k&egrave;m AppleCare+:</strong> Bảo vệ th&ecirc;m va đập, rơi vỡ, hỗ trợ kỹ thuật.</p>\r\n	</li>\r\n	<li>\r\n	<p><strong>Sử dụng dịch vụ trả g&oacute;p 0 %:</strong> Giảm &aacute;p lực t&agrave;i ch&iacute;nh.</p>\r\n	</li>\r\n</ul>\r\n\r\n<hr />\r\n<h2>Kết luận</h2>\r\n\r\n<p>Để <strong>mua được một chiếc MacBook tốt</strong>, bạn cần:</p>\r\n\r\n<ol>\r\n	<li>\r\n	<p>X&aacute;c định r&otilde; nhu cầu sử dụng.</p>\r\n	</li>\r\n	<li>\r\n	<p>Chọn d&ograve;ng MacBook Air hay Pro ph&ugrave; hợp.</p>\r\n	</li>\r\n	<li>\r\n	<p>C&acirc;n nhắc cấu h&igrave;nh CPU, RAM v&agrave; SSD.</p>\r\n	</li>\r\n	<li>\r\n	<p>Chọn địa chỉ b&aacute;n ch&iacute;nh h&atilde;ng, uy t&iacute;n.</p>\r\n	</li>\r\n	<li>\r\n	<p>Kiểm tra cẩn thận trước khi nhận m&aacute;y.</p>\r\n	</li>\r\n	<li>\r\n	<p>Tận dụng khuyến m&atilde;i v&agrave; c&aacute;c g&oacute;i dịch vụ gia tăng.</p>\r\n	</li>\r\n</ol>', 'uploads/blogs/1748356712_6835ce6805364.jpg', 11, 19, 'active', '2025-05-09 09:06:44', '2025-05-27 14:38:32', NULL);
INSERT INTO `blogs` VALUES (8, 'Nên mua iPhone Xs Max hay iPhone 11 thường?', 'nen-mua-iphone-xs-max-hay-iphone-11-thuong', '<h1>N&ecirc;n mua iPhone Xs Max hay iPhone 11 thường? Đ&acirc;u l&agrave; lựa chọn hợp l&yacute; năm 2025?</h1>\r\n\r\n<h2>1. Giới thiệu</h2>\r\n\r\n<p>iPhone Xs Max v&agrave; iPhone 11 l&agrave; hai mẫu điện thoại cũ vẫn được săn đ&oacute;n nhiều trong năm 2025. D&ugrave; đ&atilde; ra mắt từ kh&aacute; l&acirc;u, cả hai vẫn mang lại hiệu năng ổn định, thiết kế cao cấp v&agrave; trải nghiệm mượt m&agrave; cho người d&ugrave;ng. Tuy nhi&ecirc;n, nếu bạn đang ph&acirc;n v&acirc;n giữa <strong>iPhone Xs Max</strong> v&agrave; <strong>iPhone 11 thường</strong>, đ&acirc;u l&agrave; lựa chọn hợp l&yacute; hơn?</p>\r\n\r\n<p>H&atilde;y c&ugrave;ng t&igrave;m hiểu chi tiết về <strong>hiệu năng, camera, m&agrave;n h&igrave;nh, thời lượng pin v&agrave; mức gi&aacute;</strong> của từng sản phẩm để c&oacute; c&aacute;i nh&igrave;n r&otilde; r&agrave;ng nhất.</p>\r\n\r\n<hr />\r\n<h2>2. So s&aacute;nh nhanh: iPhone Xs Max vs iPhone 11</h2>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<table>\r\n	<thead>\r\n		<tr>\r\n			<th>Ti&ecirc;u ch&iacute;</th>\r\n			<th>iPhone Xs Max</th>\r\n			<th>iPhone 11</th>\r\n		</tr>\r\n	</thead>\r\n	<tbody>\r\n		<tr>\r\n			<td>Năm ra mắt</td>\r\n			<td>2018</td>\r\n			<td>2019</td>\r\n		</tr>\r\n		<tr>\r\n			<td>M&agrave;n h&igrave;nh</td>\r\n			<td>OLED 6.5 inch</td>\r\n			<td>LCD 6.1 inch</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Chip xử l&yacute;</td>\r\n			<td>Apple A12 Bionic</td>\r\n			<td>Apple A13 Bionic</td>\r\n		</tr>\r\n		<tr>\r\n			<td>RAM</td>\r\n			<td>4GB</td>\r\n			<td>4GB</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Camera sau</td>\r\n			<td>2 camera (tele + g&oacute;c rộng)</td>\r\n			<td>2 camera (g&oacute;c rộng + si&ecirc;u rộng)</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Face ID</td>\r\n			<td>C&oacute;</td>\r\n			<td>C&oacute;</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Pin</td>\r\n			<td>3174 mAh</td>\r\n			<td>3110 mAh</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Kh&aacute;ng nước</td>\r\n			<td>IP68</td>\r\n			<td>IP68</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Hỗ trợ phần mềm</td>\r\n			<td>iOS 17+</td>\r\n			<td>iOS 17+</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Gi&aacute; b&aacute;n (m&aacute;y cũ)</td>\r\n			<td>~6-7 triệu</td>\r\n			<td>~6-8 triệu</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\r\n<p><img alt=\"\" src=\"https://m.media-amazon.com/images/I/81yMd8xSFAL.jpg\" style=\"height:700px; width:700px\" /></p>\r\n\r\n<hr />\r\n<h2>3. Hiệu năng v&agrave; trải nghiệm sử dụng</h2>\r\n\r\n<p>iPhone 11 sử dụng <strong>chip A13 Bionic</strong>, mạnh hơn so với <strong>A12 tr&ecirc;n iPhone Xs Max</strong>. Trong thực tế, sự kh&aacute;c biệt kh&ocirc;ng qu&aacute; lớn nếu bạn chỉ sử dụng c&aacute;c t&aacute;c vụ cơ bản như lướt web, xem phim, gọi video hay d&ugrave;ng mạng x&atilde; hội.</p>\r\n\r\n<p>Tuy nhi&ecirc;n, nếu bạn chơi game nặng, render video, th&igrave; iPhone 11 sẽ c&oacute; lợi thế về hiệu năng v&agrave; khả năng tiết kiệm pin.</p>\r\n\r\n<p>👉 <strong>Lời khuy&ecirc;n:</strong> Nếu bạn l&agrave; người y&ecirc;u th&iacute;ch hiệu năng, thường xuy&ecirc;n chơi game, n&ecirc;n chọn <strong>iPhone 11</strong>.</p>\r\n\r\n<hr />\r\n<h2>4. M&agrave;n h&igrave;nh: OLED vs LCD</h2>\r\n\r\n<p>iPhone Xs Max sở hữu <strong>m&agrave;n h&igrave;nh OLED 6.5 inch</strong> cho chất lượng hiển thị xuất sắc &ndash; m&agrave;u sắc rực rỡ, độ tương phản cao, m&agrave;u đen s&acirc;u. Trong khi đ&oacute;, iPhone 11 sử dụng <strong>m&agrave;n h&igrave;nh LCD Liquid Retina 6.1 inch</strong>, tuy vẫn đẹp nhưng kh&ocirc;ng thể s&aacute;nh bằng OLED.</p>\r\n\r\n<p>👉 <strong>Lời khuy&ecirc;n:</strong> Nếu bạn thường xuy&ecirc;n xem phim, chỉnh ảnh, th&iacute;ch m&agrave;n h&igrave;nh đẹp th&igrave; n&ecirc;n chọn <strong>iPhone Xs Max</strong>.</p>\r\n\r\n<p><img alt=\"\" src=\"https://m.media-amazon.com/images/I/51U8WCTTmCL._AC_UF894%2C1000_QL80_.jpg\" style=\"height:373px; width:273px\" /></p>\r\n\r\n<hr />\r\n<h2>5. Camera: Chụp xa hay chụp rộng?</h2>\r\n\r\n<p>Cả hai đều c&oacute; cụm <strong>2 camera sau</strong>, nhưng sự kh&aacute;c biệt nằm ở loại ống k&iacute;nh:</p>\r\n\r\n<ul>\r\n	<li>\r\n	<p><strong>iPhone Xs Max</strong> c&oacute; ống k&iacute;nh <strong>tele</strong> &ndash; ph&ugrave; hợp chụp ch&acirc;n dung, zoom xa.</p>\r\n	</li>\r\n	<li>\r\n	<p><strong>iPhone 11</strong> c&oacute; ống k&iacute;nh <strong>si&ecirc;u rộng</strong> &ndash; ph&ugrave; hợp du lịch, chụp phong cảnh.</p>\r\n	</li>\r\n</ul>\r\n\r\n<p>👉 <strong>Lời khuy&ecirc;n:</strong> Nếu bạn th&iacute;ch <strong>chụp g&oacute;c rộng</strong> =&gt; chọn <strong>iPhone 11</strong>. Nếu cần <strong>zoom v&agrave; chụp ch&acirc;n dung x&oacute;a ph&ocirc;ng đẹp</strong> =&gt; chọn <strong>iPhone Xs Max</strong>.</p>\r\n\r\n<hr />\r\n<h2>6. Thời lượng pin v&agrave; hỗ trợ phần mềm</h2>\r\n\r\n<p>Thời lượng pin giữa hai m&aacute;y kh&ocirc;ng ch&ecirc;nh lệch qu&aacute; nhiều. Tuy nhi&ecirc;n, <strong>iPhone 11 được Apple hỗ trợ l&acirc;u hơn</strong> do ra mắt sau một năm.</p>\r\n\r\n<p>👉 <strong>Lời khuy&ecirc;n:</strong> Nếu bạn muốn d&ugrave;ng l&acirc;u d&agrave;i, n&ecirc;n chọn <strong>iPhone 11</strong>.</p>\r\n\r\n<hr />\r\n<h2>7. Kết luận: N&ecirc;n mua iPhone Xs Max hay iPhone 11?</h2>\r\n\r\n<table>\r\n	<thead>\r\n		<tr>\r\n			<th>Bạn n&ecirc;n chọn</th>\r\n			<th>Nếu bạn cần&hellip;</th>\r\n		</tr>\r\n	</thead>\r\n	<tbody>\r\n		<tr>\r\n			<td><strong>iPhone Xs Max</strong></td>\r\n			<td>M&agrave;n h&igrave;nh đẹp (OLED), chụp ch&acirc;n dung đẹp, thiết kế sang trọng</td>\r\n		</tr>\r\n		<tr>\r\n			<td><strong>iPhone 11</strong></td>\r\n			<td>Hiệu năng mạnh, pin ổn định, camera si&ecirc;u rộng, d&ugrave;ng l&acirc;u d&agrave;i</td>\r\n		</tr>\r\n	</tbody>\r\n</table>', 'uploads/blogs/1746786917_681dda65cf134.jpg', 12, 1, 'active', '2025-05-09 10:35:17', '2025-05-27 13:58:29', NULL);
INSERT INTO `blogs` VALUES (9, 'm', 'm', '<p>m</p>', 'uploads/blogs/1747404340_6827463403c13.jpg', 11, NULL, 'active', '2025-05-16 14:05:40', '2025-05-16 14:06:35', '2025-05-16 14:06:35');
INSERT INTO `blogs` VALUES (10, 'test', 'test', '<p>content</p>', 'uploads/blogs/1748268798_683476fe06ace.png', 11, 2, 'inactive', '2025-05-26 14:13:18', '2025-05-27 14:00:09', NULL);

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
INSERT INTO `cache` VALUES ('laravel_cache_spatie.permission.cache', 'a:3:{s:5:\"alias\";a:4:{s:1:\"a\";s:2:\"id\";s:1:\"b\";s:4:\"name\";s:1:\"c\";s:10:\"guard_name\";s:1:\"r\";s:5:\"roles\";}s:11:\"permissions\";a:37:{i:0;a:4:{s:1:\"a\";i:1;s:1:\"b\";s:15:\"view categories\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:1;a:4:{s:1:\"a\";i:2;s:1:\"b\";s:17:\"create categories\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:2;a:4:{s:1:\"a\";i:3;s:1:\"b\";s:15:\"edit categories\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:3;a:4:{s:1:\"a\";i:4;s:1:\"b\";s:17:\"delete categories\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:4;a:4:{s:1:\"a\";i:5;s:1:\"b\";s:12:\"view banners\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:5;a:4:{s:1:\"a\";i:6;s:1:\"b\";s:14:\"create banners\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:6;a:4:{s:1:\"a\";i:7;s:1:\"b\";s:12:\"edit banners\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:7;a:4:{s:1:\"a\";i:8;s:1:\"b\";s:14:\"delete banners\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:8;a:4:{s:1:\"a\";i:9;s:1:\"b\";s:13:\"view products\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:9;a:4:{s:1:\"a\";i:10;s:1:\"b\";s:15:\"create products\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:10;a:4:{s:1:\"a\";i:11;s:1:\"b\";s:13:\"edit products\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:11;a:4:{s:1:\"a\";i:12;s:1:\"b\";s:15:\"delete products\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:12;a:4:{s:1:\"a\";i:13;s:1:\"b\";s:11:\"view orders\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:13;a:4:{s:1:\"a\";i:14;s:1:\"b\";s:13:\"create orders\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:14;a:4:{s:1:\"a\";i:15;s:1:\"b\";s:11:\"edit orders\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:15;a:4:{s:1:\"a\";i:16;s:1:\"b\";s:13:\"delete orders\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:16;a:4:{s:1:\"a\";i:17;s:1:\"b\";s:10:\"view users\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:17;a:4:{s:1:\"a\";i:18;s:1:\"b\";s:12:\"create users\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:18;a:4:{s:1:\"a\";i:19;s:1:\"b\";s:10:\"edit users\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:19;a:4:{s:1:\"a\";i:20;s:1:\"b\";s:12:\"delete users\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:20;a:4:{s:1:\"a\";i:21;s:1:\"b\";s:10:\"view blogs\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:21;a:4:{s:1:\"a\";i:22;s:1:\"b\";s:12:\"create blogs\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:22;a:4:{s:1:\"a\";i:23;s:1:\"b\";s:10:\"edit blogs\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:23;a:4:{s:1:\"a\";i:24;s:1:\"b\";s:12:\"delete blogs\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:24;a:4:{s:1:\"a\";i:25;s:1:\"b\";s:15:\"view attributes\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:25;a:4:{s:1:\"a\";i:26;s:1:\"b\";s:17:\"create attributes\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:26;a:4:{s:1:\"a\";i:27;s:1:\"b\";s:15:\"edit attributes\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:27;a:4:{s:1:\"a\";i:28;s:1:\"b\";s:17:\"delete attributes\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:28;a:4:{s:1:\"a\";i:29;s:1:\"b\";s:14:\"view dashboard\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:29;a:4:{s:1:\"a\";i:30;s:1:\"b\";s:7:\"addrole\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:30;a:4:{s:1:\"a\";i:31;s:1:\"b\";s:28:\"view category specifications\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:31;a:4:{s:1:\"a\";i:32;s:1:\"b\";s:24:\"view category attributes\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:32;a:4:{s:1:\"a\";i:33;s:1:\"b\";s:19:\"view specifications\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:33;a:4:{s:1:\"a\";i:34;s:1:\"b\";s:20:\"trash specifications\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:34;a:4:{s:1:\"a\";i:35;s:1:\"b\";s:22:\"restore specifications\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:35;a:4:{s:1:\"a\";i:36;s:1:\"b\";s:21:\"delete specifications\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:36;a:4:{s:1:\"a\";i:37;s:1:\"b\";s:13:\"view vouchers\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}}s:5:\"roles\";a:2:{i:0;a:3:{s:1:\"a\";i:1;s:1:\"b\";s:5:\"admin\";s:1:\"c\";s:3:\"web\";}i:1;a:3:{s:1:\"a\";i:2;s:1:\"b\";s:5:\"staff\";s:1:\"c\";s:3:\"web\";}}}', 1749520265);

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
) ENGINE = InnoDB AUTO_INCREMENT = 22 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cart_items
-- ----------------------------
INSERT INTO `cart_items` VALUES (21, 3, 139, 160, 1);

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
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of carts
-- ----------------------------
INSERT INTO `carts` VALUES (1, 1, '2025-05-28 12:03:39');
INSERT INTO `carts` VALUES (2, 43, '2025-05-28 16:50:10');
INSERT INTO `carts` VALUES (3, 57, '2025-06-08 05:22:38');

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
) ENGINE = InnoDB AUTO_INCREMENT = 25 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of categories
-- ----------------------------
INSERT INTO `categories` VALUES (1, 'iPhone', 'iphone', NULL, 0, 'active', 1, NULL, NULL, '2025-05-11 09:42:50', NULL);
INSERT INTO `categories` VALUES (2, 'Mac', 'mac', NULL, 3, 'inactive', 1, NULL, NULL, '2025-05-11 09:25:33', NULL);
INSERT INTO `categories` VALUES (3, 'iPad', 'ipad', NULL, 1, 'active', 1, NULL, NULL, '2025-05-11 09:44:59', NULL);
INSERT INTO `categories` VALUES (4, 'Apple Watch', 'apple-watch', NULL, 4, 'active', 1, NULL, NULL, '2025-05-11 09:04:28', NULL);
INSERT INTO `categories` VALUES (5, 'AirPods', 'airpods', NULL, 5, 'active', 1, NULL, NULL, '2025-05-16 15:32:58', NULL);
INSERT INTO `categories` VALUES (6, 'AirPod Pro 3', 'airpod-pro-3', 5, 0, 'active', 1, NULL, '2025-05-08 07:12:32', '2025-05-16 15:32:59', NULL);
INSERT INTO `categories` VALUES (7, 'Ipad M4', 'ipad-m4', 3, 0, 'active', 1, NULL, '2025-05-08 07:12:48', '2025-05-08 07:12:48', NULL);
INSERT INTO `categories` VALUES (8, 'Iphone 12 Series', 'iphone-12-series', 1, 0, 'active', 1, NULL, '2025-05-08 07:13:16', '2025-05-08 07:13:16', NULL);
INSERT INTO `categories` VALUES (9, 'Iphone 13 Series', 'iphone-13-series', 1, 0, 'active', 1, NULL, '2025-05-08 07:13:35', '2025-05-09 04:57:51', NULL);
INSERT INTO `categories` VALUES (10, 'Iphone 14 Series', 'iphone-14-series', 1, 0, 'active', 1, NULL, '2025-05-08 07:13:58', '2025-05-08 07:51:50', NULL);
INSERT INTO `categories` VALUES (11, 'Blog Macbook', 'blog-macbook', NULL, 1, 'active', 2, NULL, '2025-05-08 10:22:36', '2025-05-11 10:03:04', NULL);
INSERT INTO `categories` VALUES (12, 'Blog Iphone', 'blog-iphone', NULL, 2, 'active', 2, NULL, '2025-05-09 07:31:49', '2025-05-11 10:03:04', NULL);
INSERT INTO `categories` VALUES (13, 'Aipod Demo', 'aipod-demo', NULL, 9, 'active', 1, NULL, '2025-05-11 09:14:24', '2025-05-11 10:25:21', '2025-05-11 10:25:21');
INSERT INTO `categories` VALUES (14, 'airpods demo 2', 'airpods-demo-2', NULL, 8, 'active', 1, NULL, '2025-05-11 09:15:21', '2025-05-11 10:25:50', '2025-05-11 10:25:50');
INSERT INTO `categories` VALUES (15, 'Airpod demo 3', 'airpod-demo-3', NULL, 7, 'active', 1, NULL, '2025-05-11 09:20:26', '2025-05-11 10:26:09', '2025-05-11 10:26:09');
INSERT INTO `categories` VALUES (16, 'airpods demo 4', 'airpods-demo-4', NULL, 6, 'active', 1, NULL, '2025-05-11 10:13:58', '2025-05-11 10:26:28', '2025-05-11 10:26:28');
INSERT INTO `categories` VALUES (17, 'AirPod Pro 2', 'airpod-pro-2', 5, 5, 'active', 1, NULL, '2025-05-11 10:27:13', '2025-05-16 15:32:59', NULL);
INSERT INTO `categories` VALUES (18, 'AirPod Pro 2.1', 'airpod-pro-21', 17, 5, 'active', 1, NULL, '2025-05-11 10:29:23', '2025-05-16 15:32:59', NULL);
INSERT INTO `categories` VALUES (19, 'iphone13', 'iphone13', 1, 0, 'active', 1, NULL, '2025-05-19 14:43:35', '2025-05-19 14:43:35', NULL);
INSERT INTO `categories` VALUES (20, 'Kim Hồng Phong', 'kim-hong-phong', 2, 3, 'active', 1, NULL, '2025-05-26 09:53:01', '2025-05-26 09:53:01', NULL);
INSERT INTO `categories` VALUES (22, 'Kim Hồng', 'kim-hong', 2, 3, 'active', 1, NULL, '2025-05-26 09:53:46', '2025-05-26 09:53:46', NULL);
INSERT INTO `categories` VALUES (23, 'Banh đây1', 'banh-day1', NULL, 6, 'active', 1, 'uploads/categories/1748615849_banh.JPG', '2025-05-30 21:37:29', '2025-06-08 10:24:48', '2025-06-08 10:24:48');
INSERT INTO `categories` VALUES (24, 'macbook', 'macbook', NULL, 7, 'active', 1, 'uploads/categories/1748959505_Họp 2-6-2025.jpg', '2025-06-03 21:05:05', '2025-06-08 10:24:57', '2025-06-08 10:24:57');

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
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of failed_jobs
-- ----------------------------
INSERT INTO `failed_jobs` VALUES (1, '058c6da8-c482-44ff-8337-f4cd5b3d614e', 'database', 'default', '{\"uuid\":\"058c6da8-c482-44ff-8337-f4cd5b3d614e\",\"displayName\":\"App\\\\Events\\\\OrderStatusUpdated\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":14:{s:5:\\\"event\\\";O:29:\\\"App\\\\Events\\\\OrderStatusUpdated\\\":1:{s:5:\\\"order\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:16:\\\"App\\\\Models\\\\Order\\\";s:2:\\\"id\\\";i:47;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\"},\"createdAt\":1748709788,\"delay\":null}', 'Illuminate\\Broadcasting\\BroadcastException: Pusher error: cURL error 7: Failed to connect to localhost port 8080 after 2255 ms: Couldn\'t connect to server (see https://curl.haxx.se/libcurl/c/libcurl-errors.html) for http://localhost:8080/apps/130010/events?auth_key=hebhaulzxbkh4ugtjs5x&auth_timestamp=1748724476&auth_version=1.0&body_md5=33c2617b95b7518834e2eebeb8c024ce&auth_signature=93bf11e08631ee174b24e439770c58de8594946bf51463a62bc146ebde6a3d1c. in C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Broadcasting\\Broadcasters\\PusherBroadcaster.php:163\nStack trace:\n#0 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Broadcasting\\BroadcastEvent.php(93): Illuminate\\Broadcasting\\Broadcasters\\PusherBroadcaster->broadcast(Object(Illuminate\\Support\\Collection), \'OrderStatusUpda...\', Array)\n#1 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(36): Illuminate\\Broadcasting\\BroadcastEvent->handle(Object(Illuminate\\Broadcasting\\BroadcastManager))\n#2 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Util.php(43): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#3 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(96): Illuminate\\Container\\Util::unwrapIfClosure(Object(Closure))\n#4 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(35): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(Illuminate\\Foundation\\Application), Array, Object(Closure))\n#5 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Container.php(754): Illuminate\\Container\\BoundMethod::call(Object(Illuminate\\Foundation\\Application), Array, Array, NULL)\n#6 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Bus\\Dispatcher.php(132): Illuminate\\Container\\Container->call(Array)\n#7 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(169): Illuminate\\Bus\\Dispatcher->Illuminate\\Bus\\{closure}(Object(Illuminate\\Broadcasting\\BroadcastEvent))\n#8 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(126): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Broadcasting\\BroadcastEvent))\n#9 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Bus\\Dispatcher.php(136): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#10 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(125): Illuminate\\Bus\\Dispatcher->dispatchNow(Object(Illuminate\\Broadcasting\\BroadcastEvent), false)\n#11 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(169): Illuminate\\Queue\\CallQueuedHandler->Illuminate\\Queue\\{closure}(Object(Illuminate\\Broadcasting\\BroadcastEvent))\n#12 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(126): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Broadcasting\\BroadcastEvent))\n#13 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(120): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#14 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(68): Illuminate\\Queue\\CallQueuedHandler->dispatchThroughMiddleware(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Object(Illuminate\\Broadcasting\\BroadcastEvent))\n#15 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Jobs\\Job.php(102): Illuminate\\Queue\\CallQueuedHandler->call(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Array)\n#16 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(441): Illuminate\\Queue\\Jobs\\Job->fire()\n#17 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(391): Illuminate\\Queue\\Worker->process(\'database\', Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Object(Illuminate\\Queue\\WorkerOptions))\n#18 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(177): Illuminate\\Queue\\Worker->runJob(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), \'database\', Object(Illuminate\\Queue\\WorkerOptions))\n#19 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Console\\WorkCommand.php(148): Illuminate\\Queue\\Worker->daemon(\'database\', \'default\', Object(Illuminate\\Queue\\WorkerOptions))\n#20 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Console\\WorkCommand.php(131): Illuminate\\Queue\\Console\\WorkCommand->runWorker(\'database\', \'default\')\n#21 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(36): Illuminate\\Queue\\Console\\WorkCommand->handle()\n#22 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Util.php(43): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#23 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(96): Illuminate\\Container\\Util::unwrapIfClosure(Object(Closure))\n#24 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(35): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(Illuminate\\Foundation\\Application), Array, Object(Closure))\n#25 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Container.php(754): Illuminate\\Container\\BoundMethod::call(Object(Illuminate\\Foundation\\Application), Array, Array, NULL)\n#26 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Console\\Command.php(211): Illuminate\\Container\\Container->call(Array)\n#27 C:\\DATN\\vendor\\symfony\\console\\Command\\Command.php(279): Illuminate\\Console\\Command->execute(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#28 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Console\\Command.php(180): Symfony\\Component\\Console\\Command\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#29 C:\\DATN\\vendor\\symfony\\console\\Application.php(1094): Illuminate\\Console\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#30 C:\\DATN\\vendor\\symfony\\console\\Application.php(342): Symfony\\Component\\Console\\Application->doRunCommand(Object(Illuminate\\Queue\\Console\\WorkCommand), Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#31 C:\\DATN\\vendor\\symfony\\console\\Application.php(193): Symfony\\Component\\Console\\Application->doRun(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#32 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Console\\Kernel.php(197): Symfony\\Component\\Console\\Application->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#33 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Application.php(1234): Illuminate\\Foundation\\Console\\Kernel->handle(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#34 C:\\DATN\\artisan(16): Illuminate\\Foundation\\Application->handleCommand(Object(Symfony\\Component\\Console\\Input\\ArgvInput))\n#35 {main}', '2025-06-01 03:47:59');
INSERT INTO `failed_jobs` VALUES (2, '89a0986b-70a4-4d6a-8c0b-29c3f1c32e0e', 'database', 'default', '{\"uuid\":\"89a0986b-70a4-4d6a-8c0b-29c3f1c32e0e\",\"displayName\":\"App\\\\Events\\\\OrderStatusUpdated\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":14:{s:5:\\\"event\\\";O:29:\\\"App\\\\Events\\\\OrderStatusUpdated\\\":1:{s:5:\\\"order\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:16:\\\"App\\\\Models\\\\Order\\\";s:2:\\\"id\\\";i:47;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\"},\"createdAt\":1748709845,\"delay\":null}', 'Illuminate\\Broadcasting\\BroadcastException: Pusher error: cURL error 7: Failed to connect to localhost port 8080 after 2248 ms: Couldn\'t connect to server (see https://curl.haxx.se/libcurl/c/libcurl-errors.html) for http://localhost:8080/apps/130010/events?auth_key=hebhaulzxbkh4ugtjs5x&auth_timestamp=1748724480&auth_version=1.0&body_md5=33c2617b95b7518834e2eebeb8c024ce&auth_signature=e0e0e06590a453df7f6050bf0c1c546f8d87c90715a030ea829eef61ba33dc47. in C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Broadcasting\\Broadcasters\\PusherBroadcaster.php:163\nStack trace:\n#0 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Broadcasting\\BroadcastEvent.php(93): Illuminate\\Broadcasting\\Broadcasters\\PusherBroadcaster->broadcast(Object(Illuminate\\Support\\Collection), \'OrderStatusUpda...\', Array)\n#1 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(36): Illuminate\\Broadcasting\\BroadcastEvent->handle(Object(Illuminate\\Broadcasting\\BroadcastManager))\n#2 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Util.php(43): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#3 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(96): Illuminate\\Container\\Util::unwrapIfClosure(Object(Closure))\n#4 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(35): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(Illuminate\\Foundation\\Application), Array, Object(Closure))\n#5 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Container.php(754): Illuminate\\Container\\BoundMethod::call(Object(Illuminate\\Foundation\\Application), Array, Array, NULL)\n#6 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Bus\\Dispatcher.php(132): Illuminate\\Container\\Container->call(Array)\n#7 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(169): Illuminate\\Bus\\Dispatcher->Illuminate\\Bus\\{closure}(Object(Illuminate\\Broadcasting\\BroadcastEvent))\n#8 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(126): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Broadcasting\\BroadcastEvent))\n#9 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Bus\\Dispatcher.php(136): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#10 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(125): Illuminate\\Bus\\Dispatcher->dispatchNow(Object(Illuminate\\Broadcasting\\BroadcastEvent), false)\n#11 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(169): Illuminate\\Queue\\CallQueuedHandler->Illuminate\\Queue\\{closure}(Object(Illuminate\\Broadcasting\\BroadcastEvent))\n#12 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(126): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Broadcasting\\BroadcastEvent))\n#13 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(120): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#14 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(68): Illuminate\\Queue\\CallQueuedHandler->dispatchThroughMiddleware(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Object(Illuminate\\Broadcasting\\BroadcastEvent))\n#15 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Jobs\\Job.php(102): Illuminate\\Queue\\CallQueuedHandler->call(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Array)\n#16 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(441): Illuminate\\Queue\\Jobs\\Job->fire()\n#17 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(391): Illuminate\\Queue\\Worker->process(\'database\', Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Object(Illuminate\\Queue\\WorkerOptions))\n#18 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(177): Illuminate\\Queue\\Worker->runJob(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), \'database\', Object(Illuminate\\Queue\\WorkerOptions))\n#19 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Console\\WorkCommand.php(148): Illuminate\\Queue\\Worker->daemon(\'database\', \'default\', Object(Illuminate\\Queue\\WorkerOptions))\n#20 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Console\\WorkCommand.php(131): Illuminate\\Queue\\Console\\WorkCommand->runWorker(\'database\', \'default\')\n#21 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(36): Illuminate\\Queue\\Console\\WorkCommand->handle()\n#22 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Util.php(43): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#23 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(96): Illuminate\\Container\\Util::unwrapIfClosure(Object(Closure))\n#24 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(35): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(Illuminate\\Foundation\\Application), Array, Object(Closure))\n#25 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Container.php(754): Illuminate\\Container\\BoundMethod::call(Object(Illuminate\\Foundation\\Application), Array, Array, NULL)\n#26 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Console\\Command.php(211): Illuminate\\Container\\Container->call(Array)\n#27 C:\\DATN\\vendor\\symfony\\console\\Command\\Command.php(279): Illuminate\\Console\\Command->execute(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#28 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Console\\Command.php(180): Symfony\\Component\\Console\\Command\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#29 C:\\DATN\\vendor\\symfony\\console\\Application.php(1094): Illuminate\\Console\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#30 C:\\DATN\\vendor\\symfony\\console\\Application.php(342): Symfony\\Component\\Console\\Application->doRunCommand(Object(Illuminate\\Queue\\Console\\WorkCommand), Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#31 C:\\DATN\\vendor\\symfony\\console\\Application.php(193): Symfony\\Component\\Console\\Application->doRun(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#32 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Console\\Kernel.php(197): Symfony\\Component\\Console\\Application->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#33 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Application.php(1234): Illuminate\\Foundation\\Console\\Kernel->handle(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#34 C:\\DATN\\artisan(16): Illuminate\\Foundation\\Application->handleCommand(Object(Symfony\\Component\\Console\\Input\\ArgvInput))\n#35 {main}', '2025-06-01 03:48:03');
INSERT INTO `failed_jobs` VALUES (3, '9afa8ca5-794a-4977-a9a5-cb686205a36d', 'database', 'default', '{\"uuid\":\"9afa8ca5-794a-4977-a9a5-cb686205a36d\",\"displayName\":\"App\\\\Events\\\\OrderStatusUpdated\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":14:{s:5:\\\"event\\\";O:29:\\\"App\\\\Events\\\\OrderStatusUpdated\\\":1:{s:5:\\\"order\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:16:\\\"App\\\\Models\\\\Order\\\";s:2:\\\"id\\\";i:47;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\"},\"createdAt\":1748713564,\"delay\":null}', 'Illuminate\\Broadcasting\\BroadcastException: Pusher error: cURL error 7: Failed to connect to localhost port 8080 after 2252 ms: Couldn\'t connect to server (see https://curl.haxx.se/libcurl/c/libcurl-errors.html) for http://localhost:8080/apps/130010/events?auth_key=hebhaulzxbkh4ugtjs5x&auth_timestamp=1748724483&auth_version=1.0&body_md5=33c2617b95b7518834e2eebeb8c024ce&auth_signature=66e241526fef054b2ce4f2377abc7cd68cd1770893b20a92d5a832400e83bceb. in C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Broadcasting\\Broadcasters\\PusherBroadcaster.php:163\nStack trace:\n#0 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Broadcasting\\BroadcastEvent.php(93): Illuminate\\Broadcasting\\Broadcasters\\PusherBroadcaster->broadcast(Object(Illuminate\\Support\\Collection), \'OrderStatusUpda...\', Array)\n#1 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(36): Illuminate\\Broadcasting\\BroadcastEvent->handle(Object(Illuminate\\Broadcasting\\BroadcastManager))\n#2 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Util.php(43): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#3 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(96): Illuminate\\Container\\Util::unwrapIfClosure(Object(Closure))\n#4 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(35): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(Illuminate\\Foundation\\Application), Array, Object(Closure))\n#5 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Container.php(754): Illuminate\\Container\\BoundMethod::call(Object(Illuminate\\Foundation\\Application), Array, Array, NULL)\n#6 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Bus\\Dispatcher.php(132): Illuminate\\Container\\Container->call(Array)\n#7 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(169): Illuminate\\Bus\\Dispatcher->Illuminate\\Bus\\{closure}(Object(Illuminate\\Broadcasting\\BroadcastEvent))\n#8 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(126): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Broadcasting\\BroadcastEvent))\n#9 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Bus\\Dispatcher.php(136): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#10 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(125): Illuminate\\Bus\\Dispatcher->dispatchNow(Object(Illuminate\\Broadcasting\\BroadcastEvent), false)\n#11 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(169): Illuminate\\Queue\\CallQueuedHandler->Illuminate\\Queue\\{closure}(Object(Illuminate\\Broadcasting\\BroadcastEvent))\n#12 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(126): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Broadcasting\\BroadcastEvent))\n#13 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(120): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#14 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(68): Illuminate\\Queue\\CallQueuedHandler->dispatchThroughMiddleware(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Object(Illuminate\\Broadcasting\\BroadcastEvent))\n#15 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Jobs\\Job.php(102): Illuminate\\Queue\\CallQueuedHandler->call(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Array)\n#16 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(441): Illuminate\\Queue\\Jobs\\Job->fire()\n#17 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(391): Illuminate\\Queue\\Worker->process(\'database\', Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Object(Illuminate\\Queue\\WorkerOptions))\n#18 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(177): Illuminate\\Queue\\Worker->runJob(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), \'database\', Object(Illuminate\\Queue\\WorkerOptions))\n#19 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Console\\WorkCommand.php(148): Illuminate\\Queue\\Worker->daemon(\'database\', \'default\', Object(Illuminate\\Queue\\WorkerOptions))\n#20 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Console\\WorkCommand.php(131): Illuminate\\Queue\\Console\\WorkCommand->runWorker(\'database\', \'default\')\n#21 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(36): Illuminate\\Queue\\Console\\WorkCommand->handle()\n#22 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Util.php(43): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#23 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(96): Illuminate\\Container\\Util::unwrapIfClosure(Object(Closure))\n#24 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(35): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(Illuminate\\Foundation\\Application), Array, Object(Closure))\n#25 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Container.php(754): Illuminate\\Container\\BoundMethod::call(Object(Illuminate\\Foundation\\Application), Array, Array, NULL)\n#26 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Console\\Command.php(211): Illuminate\\Container\\Container->call(Array)\n#27 C:\\DATN\\vendor\\symfony\\console\\Command\\Command.php(279): Illuminate\\Console\\Command->execute(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#28 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Console\\Command.php(180): Symfony\\Component\\Console\\Command\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#29 C:\\DATN\\vendor\\symfony\\console\\Application.php(1094): Illuminate\\Console\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#30 C:\\DATN\\vendor\\symfony\\console\\Application.php(342): Symfony\\Component\\Console\\Application->doRunCommand(Object(Illuminate\\Queue\\Console\\WorkCommand), Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#31 C:\\DATN\\vendor\\symfony\\console\\Application.php(193): Symfony\\Component\\Console\\Application->doRun(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#32 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Console\\Kernel.php(197): Symfony\\Component\\Console\\Application->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#33 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Application.php(1234): Illuminate\\Foundation\\Console\\Kernel->handle(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#34 C:\\DATN\\artisan(16): Illuminate\\Foundation\\Application->handleCommand(Object(Symfony\\Component\\Console\\Input\\ArgvInput))\n#35 {main}', '2025-06-01 03:48:06');
INSERT INTO `failed_jobs` VALUES (4, '45f54d57-4174-4d3c-8159-4c4e087f0c41', 'database', 'default', '{\"uuid\":\"45f54d57-4174-4d3c-8159-4c4e087f0c41\",\"displayName\":\"App\\\\Events\\\\OrderStatusUpdated\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":14:{s:5:\\\"event\\\";O:29:\\\"App\\\\Events\\\\OrderStatusUpdated\\\":1:{s:5:\\\"order\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:16:\\\"App\\\\Models\\\\Order\\\";s:2:\\\"id\\\";i:47;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\"},\"createdAt\":1748713771,\"delay\":null}', 'Illuminate\\Broadcasting\\BroadcastException: Pusher error: cURL error 7: Failed to connect to localhost port 8080 after 2250 ms: Couldn\'t connect to server (see https://curl.haxx.se/libcurl/c/libcurl-errors.html) for http://localhost:8080/apps/130010/events?auth_key=hebhaulzxbkh4ugtjs5x&auth_timestamp=1748724486&auth_version=1.0&body_md5=33c2617b95b7518834e2eebeb8c024ce&auth_signature=185ab2c8c516dda258cacc14ffedfd8f1fe4c99ba595034f2cadb48204a264c4. in C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Broadcasting\\Broadcasters\\PusherBroadcaster.php:163\nStack trace:\n#0 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Broadcasting\\BroadcastEvent.php(93): Illuminate\\Broadcasting\\Broadcasters\\PusherBroadcaster->broadcast(Object(Illuminate\\Support\\Collection), \'OrderStatusUpda...\', Array)\n#1 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(36): Illuminate\\Broadcasting\\BroadcastEvent->handle(Object(Illuminate\\Broadcasting\\BroadcastManager))\n#2 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Util.php(43): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#3 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(96): Illuminate\\Container\\Util::unwrapIfClosure(Object(Closure))\n#4 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(35): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(Illuminate\\Foundation\\Application), Array, Object(Closure))\n#5 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Container.php(754): Illuminate\\Container\\BoundMethod::call(Object(Illuminate\\Foundation\\Application), Array, Array, NULL)\n#6 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Bus\\Dispatcher.php(132): Illuminate\\Container\\Container->call(Array)\n#7 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(169): Illuminate\\Bus\\Dispatcher->Illuminate\\Bus\\{closure}(Object(Illuminate\\Broadcasting\\BroadcastEvent))\n#8 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(126): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Broadcasting\\BroadcastEvent))\n#9 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Bus\\Dispatcher.php(136): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#10 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(125): Illuminate\\Bus\\Dispatcher->dispatchNow(Object(Illuminate\\Broadcasting\\BroadcastEvent), false)\n#11 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(169): Illuminate\\Queue\\CallQueuedHandler->Illuminate\\Queue\\{closure}(Object(Illuminate\\Broadcasting\\BroadcastEvent))\n#12 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(126): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Broadcasting\\BroadcastEvent))\n#13 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(120): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#14 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(68): Illuminate\\Queue\\CallQueuedHandler->dispatchThroughMiddleware(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Object(Illuminate\\Broadcasting\\BroadcastEvent))\n#15 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Jobs\\Job.php(102): Illuminate\\Queue\\CallQueuedHandler->call(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Array)\n#16 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(441): Illuminate\\Queue\\Jobs\\Job->fire()\n#17 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(391): Illuminate\\Queue\\Worker->process(\'database\', Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Object(Illuminate\\Queue\\WorkerOptions))\n#18 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(177): Illuminate\\Queue\\Worker->runJob(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), \'database\', Object(Illuminate\\Queue\\WorkerOptions))\n#19 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Console\\WorkCommand.php(148): Illuminate\\Queue\\Worker->daemon(\'database\', \'default\', Object(Illuminate\\Queue\\WorkerOptions))\n#20 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Console\\WorkCommand.php(131): Illuminate\\Queue\\Console\\WorkCommand->runWorker(\'database\', \'default\')\n#21 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(36): Illuminate\\Queue\\Console\\WorkCommand->handle()\n#22 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Util.php(43): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#23 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(96): Illuminate\\Container\\Util::unwrapIfClosure(Object(Closure))\n#24 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(35): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(Illuminate\\Foundation\\Application), Array, Object(Closure))\n#25 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Container.php(754): Illuminate\\Container\\BoundMethod::call(Object(Illuminate\\Foundation\\Application), Array, Array, NULL)\n#26 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Console\\Command.php(211): Illuminate\\Container\\Container->call(Array)\n#27 C:\\DATN\\vendor\\symfony\\console\\Command\\Command.php(279): Illuminate\\Console\\Command->execute(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#28 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Console\\Command.php(180): Symfony\\Component\\Console\\Command\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#29 C:\\DATN\\vendor\\symfony\\console\\Application.php(1094): Illuminate\\Console\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#30 C:\\DATN\\vendor\\symfony\\console\\Application.php(342): Symfony\\Component\\Console\\Application->doRunCommand(Object(Illuminate\\Queue\\Console\\WorkCommand), Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#31 C:\\DATN\\vendor\\symfony\\console\\Application.php(193): Symfony\\Component\\Console\\Application->doRun(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#32 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Console\\Kernel.php(197): Symfony\\Component\\Console\\Application->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#33 C:\\DATN\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Application.php(1234): Illuminate\\Foundation\\Console\\Kernel->handle(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#34 C:\\DATN\\artisan(16): Illuminate\\Foundation\\Application->handleCommand(Object(Symfony\\Component\\Console\\Input\\ArgvInput))\n#35 {main}', '2025-06-01 03:48:09');

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
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of invoices
-- ----------------------------
INSERT INTO `invoices` VALUES (4, 60, 'INV000060', 3703701.00, 1, '2025-06-08 01:41:13', NULL, '2025-06-08 01:41:13', '2025-06-08 01:41:13');
INSERT INTO `invoices` VALUES (5, 61, 'INV000061', 32000000.00, 1, '2025-06-08 12:04:38', NULL, '2025-06-08 12:04:38', '2025-06-08 12:04:38');
INSERT INTO `invoices` VALUES (6, 62, 'INV000062', 29999999.00, 1, '2025-06-08 12:07:45', NULL, '2025-06-08 12:07:45', '2025-06-08 12:07:45');
INSERT INTO `invoices` VALUES (7, 63, 'INV000063', 32000000.00, 1, '2025-06-08 12:10:14', NULL, '2025-06-08 12:10:14', '2025-06-08 12:10:14');
INSERT INTO `invoices` VALUES (8, 64, 'INV000064', 30990000.00, 1, '2025-06-08 12:13:43', NULL, '2025-06-08 12:13:43', '2025-06-08 12:13:43');

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
) ENGINE = InnoDB AUTO_INCREMENT = 218 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of jobs
-- ----------------------------

-- ----------------------------
-- Table structure for migrations
-- ----------------------------
DROP TABLE IF EXISTS `migrations`;
CREATE TABLE `migrations`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 140 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

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
INSERT INTO `model_has_roles` VALUES (1, 'App\\Models\\User', 2);
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
) ENGINE = InnoDB AUTO_INCREMENT = 61 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of order_items
-- ----------------------------
INSERT INTO `order_items` VALUES (55, 61, 139, 161, 1, 32000000.00, 32000000.00, '2025-06-08 12:03:25', '2025-06-08 12:03:25', NULL);
INSERT INTO `order_items` VALUES (56, 62, 139, 163, 1, 29999999.00, 29999999.00, '2025-06-08 12:07:17', '2025-06-08 12:07:17', NULL);
INSERT INTO `order_items` VALUES (57, 63, 139, 161, 1, 32000000.00, 32000000.00, '2025-06-08 12:09:59', '2025-06-08 12:09:59', NULL);
INSERT INTO `order_items` VALUES (58, 64, 139, 160, 1, 30990000.00, 30990000.00, '2025-06-08 12:12:56', '2025-06-08 12:12:56', NULL);
INSERT INTO `order_items` VALUES (59, 65, 139, 160, 3, 30990000.00, 92970000.00, '2025-06-08 12:58:29', '2025-06-08 12:58:29', NULL);
INSERT INTO `order_items` VALUES (60, 66, 139, 162, 3, 31000000.00, 93000000.00, '2025-06-08 13:38:44', '2025-06-08 13:38:44', NULL);

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
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of order_return_items
-- ----------------------------
INSERT INTO `order_return_items` VALUES (6, 7, 55, 1, 0, '2025-06-09 13:56:04', '2025-06-09 13:56:04');

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
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of order_returns
-- ----------------------------
INSERT INTO `order_returns` VALUES (5, 60, 42, 'pending', 'tôi thấy sarn phẩm này đang lỗi', 'returns/FBvJTWD3CdRk3UUSV5otDfTAhHYBu53vohRGAPRF.jpg', NULL, NULL, '2025-06-08 02:14:26', '2025-06-08 02:14:26');
INSERT INTO `order_returns` VALUES (6, 58, 1, 'pending', 'aaaaaaaaaaaaaaaaaaaaaaa', 'uploads/returns/1749324885_a10.jpg', NULL, NULL, '2025-06-08 02:34:45', '2025-06-08 02:34:45');
INSERT INTO `order_returns` VALUES (7, 61, 42, 'pending', 'tôi thấy sản phẩm chưa phù hợp', 'uploads/returns/1749452164_a8.jpeg', NULL, NULL, '2025-06-09 13:56:04', '2025-06-09 13:56:04');

-- ----------------------------
-- Table structure for orders
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
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
) ENGINE = InnoDB AUTO_INCREMENT = 67 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of orders
-- ----------------------------
INSERT INTO `orders` VALUES (58, 1, 999.00, 0.00, 0.00, 999.00, 0.00, 'Hanoi', 'Admin zzzzzzzzzzz', '0123456789', 'admin@gmail.com', 'cod', 'pending', NULL, 'completed', 0, 'qqqqqqq', NULL, '2025-06-07 22:12:19', '2025-06-07 23:26:57', NULL);
INSERT INTO `orders` VALUES (59, 1, 999.00, 0.00, 0.00, 999.00, 0.00, 'Hanoi', 'Admin zzzzzzzzzzz', '0123456789', 'admin@gmail.com', 'cod', 'pending', NULL, 'confirmed', 0, 'qqqqqqq', NULL, '2025-06-07 22:12:23', '2025-06-08 01:12:25', NULL);
INSERT INTO `orders` VALUES (60, 42, 3703701.00, 0.00, 0.00, 3703701.00, 0.00, 'Vọng Giang', 'đại học', '0968791308', 'daichuvan05@gmail.com', 'cod', 'pending', NULL, 'completed', 0, 'aaaaaaaaaaaaa', NULL, '2025-06-08 01:30:28', '2025-06-08 02:13:45', NULL);
INSERT INTO `orders` VALUES (61, 42, 32000000.00, 0.00, 0.00, 32000000.00, 0.00, 'Vọng Giang', 'đại học', '0968791308', 'daichuvan05@gmail.com', 'cod', 'pending', NULL, 'completed', 0, NULL, 'tôi cần thay đổi phương thức thanh toán', '2025-06-28 12:03:25', '2025-06-28 13:22:21', NULL);
INSERT INTO `orders` VALUES (62, 57, 29999999.00, 0.00, 0.00, 29999999.00, 0.00, 'Số nhà 71, phố tiền phong, phường tiên cát', 'Banhdayyy Nguyễn Ngọc', '0368706552', 'anhnnbph50226@gmail.com', 'cod', 'pending', NULL, 'confirmed', 0, NULL, NULL, '2025-06-08 12:07:17', '2025-06-08 12:07:45', NULL);
INSERT INTO `orders` VALUES (63, 57, 32000000.00, 0.00, 0.00, 32000000.00, 0.00, 'Số nhà 71, phố tiền phong, phường tiên cát', 'Banhdayyy a', '0368706552', 'anhnnbph50226@gmail.com', 'cod', 'pending', NULL, 'confirmed', 0, NULL, NULL, '2025-06-08 12:09:59', '2025-06-08 12:10:14', NULL);
INSERT INTO `orders` VALUES (64, 57, 30990000.00, 0.00, 0.00, 30990000.00, 0.00, 'Số nhà 71, phố tiền phong, phường tiên cát', 'Banhdayyy học', '0368706552', 'anhnnbph50226@gmail.com', 'cod', 'pending', NULL, 'confirmed', 0, NULL, NULL, '2025-06-08 12:12:56', '2025-06-08 12:13:43', NULL);
INSERT INTO `orders` VALUES (65, 1, 92970000.00, 0.00, 0.00, 92970000.00, 0.00, 'Hanoi', 'Admin Nguyễn Thanh', '0123456789', 'admin@gmail.com', 'vnpay', 'paid', NULL, 'preparing', 1, 'okokok', NULL, '2025-06-08 12:58:29', '2025-06-09 08:55:48', NULL);
INSERT INTO `orders` VALUES (66, 1, 93000000.00, 0.00, 0.00, 93000000.00, 0.00, 'Hanoi', 'Admin Nguyễn Thanh', '0123456789', 'admin@gmail.com', 'vnpay', 'paid', NULL, 'shipping', 1, 'Okokok', NULL, '2025-06-08 13:38:44', '2025-06-08 13:43:13', NULL);

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
) ENGINE = InnoDB AUTO_INCREMENT = 272 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of product_specifications
-- ----------------------------
INSERT INTO `product_specifications` VALUES (270, 139, 5, '128GB', '2025-06-08 11:20:40', '2025-06-08 11:20:40', NULL);
INSERT INTO `product_specifications` VALUES (271, 139, 6, '33GB', '2025-06-08 11:20:40', '2025-06-08 11:20:40', NULL);

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
) ENGINE = InnoDB AUTO_INCREMENT = 167 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of product_variants
-- ----------------------------
INSERT INTO `product_variants` VALUES (160, 139, 'SP-70388', 'iPhone 15 Pro Max - White - 128GB', 'iphone-15-pro-max-white-128gb-1749356440-0', NULL, 18, 'active', 1, '2025-06-08 11:20:40', '2025-06-08 12:58:29', NULL, '\"[\\\"uploads\\\\/products\\\\/1749356440_0_iphone-15-pro-max-blue-titan-6-650x650.jpg\\\",\\\"uploads\\\\/products\\\\/1749356440_0_iphone-15-pro-max-blue-titan-5-650x650.jpg\\\",\\\"uploads\\\\/products\\\\/1749356440_0_iphone-15-pro-max-blue-titan-4-650x650.jpg\\\",\\\"uploads\\\\/products\\\\/1749356440_0_iphone-15-pro-max-blue-titan-3-650x650.jpg\\\",\\\"uploads\\\\/products\\\\/1749356440_0_iphone-15-pro-max-blue-titan-1-650x650.jpg\\\",\\\"uploads\\\\/products\\\\/1749356440_0_iphone-15-pro-max-blue-titan-2-650x650.jpg\\\",\\\"uploads\\\\/products\\\\/1749356440_0_iphone-15-pro-max-blue-1-2-650x650 (1).png\\\"]\"', 29990000.00, 30990000.00);
INSERT INTO `product_variants` VALUES (161, 139, 'SP-88368', 'iPhone 15 Pro Max - White - 256GB', 'iphone-15-pro-max-white-256gb-1749356440-1', NULL, 31, 'active', 0, '2025-06-08 11:20:40', '2025-06-08 12:09:59', NULL, '\"[\\\"uploads\\\\/products\\\\/1749356440_1_iphone-15-pro-max-white-titan-10-650x650.jpg\\\",\\\"uploads\\\\/products\\\\/1749356440_1_iphone-15-pro-max-white-titan-9-650x650.jpg\\\",\\\"uploads\\\\/products\\\\/1749356440_1_iphone-15-pro-max-white-titan-8-650x650.jpg\\\",\\\"uploads\\\\/products\\\\/1749356440_1_iphone-15-pro-max-white-titan-7-650x650.jpg\\\",\\\"uploads\\\\/products\\\\/1749356440_1_iphone-15-pro-max-white-titan-6-650x650.jpg\\\",\\\"uploads\\\\/products\\\\/1749356440_1_iphone-15-pro-max-white-titan-5-650x650.jpg\\\",\\\"uploads\\\\/products\\\\/1749356440_1_iphone-15-pro-max-white-titan-4-650x650.jpg\\\",\\\"uploads\\\\/products\\\\/1749356440_1_iphone-15-pro-max-white-titan-3-650x650.jpg\\\",\\\"uploads\\\\/products\\\\/1749356440_1_iphone-15-pro-max-white-titan-2-650x650.jpg\\\",\\\"uploads\\\\/products\\\\/1749356440_1_iphone-15-pro-max-white-titan-1-650x650.jpg\\\",\\\"uploads\\\\/products\\\\/1749356440_1_iphone-15-pro-max-white-1-2-650x650.png\\\"]\"', 29990000.00, 32000000.00);
INSERT INTO `product_variants` VALUES (162, 139, 'SP-10727', 'iPhone 15 Pro Max - Red - 128GB', 'iphone-15-pro-max-red-128gb-1749356440-2', NULL, 219, 'active', 0, '2025-06-08 11:20:40', '2025-06-08 13:38:44', NULL, '\"[\\\"uploads\\\\/products\\\\/1749356440_2_iphone-15-pro-max-black-titan-10-650x650.jpg\\\",\\\"uploads\\\\/products\\\\/1749356440_2_iphone-15-pro-max-black-titan-9-650x650.jpg\\\"]\"', 28990000.00, 31000000.00);
INSERT INTO `product_variants` VALUES (163, 139, 'SP-98649', 'iPhone 15 Pro Max - Red - 256GB', 'iphone-15-pro-max-red-256gb-1749356440-3', NULL, 332, 'active', 0, '2025-06-08 11:20:40', '2025-06-08 12:07:17', NULL, '\"[]\"', 27990000.00, 29999999.00);
INSERT INTO `product_variants` VALUES (164, 140, 'SP-98405', 'abc - White - 256GB', 'abc-white-256gb-1749453684-0', NULL, 3, 'active', 1, '2025-06-09 14:21:24', '2025-06-09 14:21:24', NULL, '\"[\\\"uploads\\\\/products\\\\/1749453684_0_iphone-shadow4.png\\\",\\\"uploads\\\\/products\\\\/1749453684_0_iphone-shadow3.png\\\",\\\"uploads\\\\/products\\\\/1749453684_0_iphone-shadow2.png\\\"]\"', 12.00, 121.00);
INSERT INTO `product_variants` VALUES (165, 141, 'SP-38984', 'asdas - Red - 256GB', 'asdas-red-256gb-1749453767-0', NULL, 11, 'active', 1, '2025-06-09 14:22:47', '2025-06-09 14:22:47', NULL, '\"[\\\"uploads\\\\/products\\\\/1749453767_0_Screenshot_94.png\\\",\\\"uploads\\\\/products\\\\/1749453767_0_Cozy 2k.jpg\\\"]\"', 212.00, 2112.00);
INSERT INTO `product_variants` VALUES (166, 142, 'SP-54238', 'Bird Blog - Red - 128GB', 'bird-blog-red-128gb-1749454128-0', NULL, 22, 'active', 1, '2025-06-09 14:28:48', '2025-06-09 14:28:48', NULL, '\"[]\"', 222.00, 222.00);

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
) ENGINE = InnoDB AUTO_INCREMENT = 143 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of products
-- ----------------------------
INSERT INTO `products` VALUES (139, 'iPhone 15 Pro Max', 'iphone-15-pro-max-1749356440', 'Bộ sản phẩm gồm: Hộp, Sách hướng dẫn, Cây lấy sim, Cáp Type C\r\n Hư gì đổi nấy 12 tháng tại 3041 siêu thị trên toàn quốc Xem chi tiết chính sách bảo hành, đổi trả\r\n Bảo hành chính hãng 1 năm\r\n Giao hàng nhanh toàn quốc Xem chi tiết\r\n Tổng đài: 1900.9696.42 (8:00 - 21:30)', '<p>Khuyến m&atilde;i trị gi&aacute; 500.000₫<small>Gi&aacute; v&agrave; khuyến m&atilde;i dự kiến &aacute;p dụng đến 23:59 | 30/06</small></p>\r\n\r\n<p>&nbsp;<strong>Phiếu mua h&agrave;ng AirPods, Apple Watch, Macbook trị gi&aacute; 500,000đ</strong></p>\r\n\r\n<p>&nbsp;<strong>Phiếu mua h&agrave;ng &aacute;p dụng mua Sạc dự ph&ograve;ng (trừ h&atilde;ng AVA+, Hydrus), đồng hồ th&ocirc;ng minh (trừ Apple), Tai nghe v&agrave; Loa bluetooth (h&atilde;ng JBL, Marshall,Harmar Kardon ,Sony) trị gi&aacute; 100.000đ</strong></p>\r\n\r\n<p>&nbsp;<strong>Thu cũ đổi mới: Giảm đến 2,000,000đ (Kh&ocirc;ng k&egrave;m ưu đ&atilde;i thanh to&aacute;n qua cổng, mua k&egrave;m)&nbsp;<a href=\"https://www.thegioididong.com/thu-cu-doi-moi\">Xem chi tiết</a></strong></p>\r\n\r\n<p>&nbsp;<strong>Nhập m&atilde; VNPAYTGDD3 giảm từ 80,000đ đến 150,000đ (&aacute;p dụng t&ugrave;y gi&aacute; trị đơn h&agrave;ng) khi thanh to&aacute;n qua VNPAY-Q&nbsp;<a href=\"https://www.topzone.vn/tekzone/nhap-ma-vnpaytgdd1-giam-toi-da-150k-khi-thanh-toan-qua-vnpay-qr-1573704\" target=\"_blank\">(Xem chi tiết tại đ&acirc;y)</a></strong></p>', 1, 12, 1, 'active', 62, '2025-06-08 11:20:40', '2025-06-09 09:09:14', NULL);
INSERT INTO `products` VALUES (140, 'abc', 'abc-1749453684', 'sadas', '<p>asdasd</p>', 1, 12, 0, 'active', 0, '2025-06-09 14:21:24', '2025-06-09 14:21:24', NULL);
INSERT INTO `products` VALUES (141, 'asdas', 'asdas-1749453766', 'asd', '<p>das</p>', 2, 12, 0, 'active', 0, '2025-06-09 14:22:46', '2025-06-09 14:22:46', NULL);
INSERT INTO `products` VALUES (142, 'Bird Blog', 'bird-blog-1749454128', 'asda', '<p>asdas</p>', 2, 12, 0, 'active', 0, '2025-06-09 14:28:48', '2025-06-09 14:28:48', NULL);

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
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `sessions_user_id_index`(`user_id`) USING BTREE,
  INDEX `sessions_last_activity_index`(`last_activity`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sessions
-- ----------------------------
INSERT INTO `sessions` VALUES ('5V4E5IBE74ebxjvYisGM1IgFka2WcegJBP5ObO6I', 42, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'YTo1OntzOjY6Il90b2tlbiI7czo0MDoiQWxCcEM4V0VVejZOOFFlbWpXb2k5M1Z4eGs1aUpUNmp0S1VWUGU3aCI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mzc6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9vcmRlci82MS9yZXR1cm4iO31zOjUwOiJsb2dpbl93ZWJfNTliYTM2YWRkYzJiMmY5NDAxNTgwZjAxNGM3ZjU4ZWE0ZTMwOTg5ZCI7aTo0MjtzOjE3OiJwYXNzd29yZF9oYXNoX3dlYiI7czo2MDoiJDJ5JDEyJHphYnZ2YThTZHphYkxLYk9rYnp2S094Y3pPd3hVYUV4d0dlUE9VQjNtakY3d2x5QTNCL1YyIjt9', 1749451892);
INSERT INTO `sessions` VALUES ('62rJ2MS0mB7klBA50queXtUMnDe3ch5EN2Uxcgpi', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', 'YTo2OntzOjY6Il90b2tlbiI7czo0MDoiczU4Zm5hN0pNRE9LaFhKblpSVGlIY1pOZWRXUVlhd2ExR2VGTVRWQSI7czozOiJ1cmwiO2E6MDp7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fXM6NTA6ImxvZ2luX3dlYl81OWJhMzZhZGRjMmIyZjk0MDE1ODBmMDE0YzdmNThlYTRlMzA5ODlkIjtpOjE7czoxNzoicGFzc3dvcmRfaGFzaF93ZWIiO3M6NjA6IiQyeSQxMiRzaTdnUnlkYkplNnVQRHovMHB4cUR1aXB3RHdUOVEvMnBWcGYwSHBTNmsvbHQ1ejcwVWh0dSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDU6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hZG1pbi9wcm9kdWN0cy8xMzkvZWRpdCI7fX0=', 1749454227);
INSERT INTO `sessions` VALUES ('CcKhi2HndZEk2SUYkAfX9N2qoz1YqjdJalLu3nZE', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiQ2x5aEUxS296M01hRGh0cDhQUGNtTDdYVVFHZHBBcElteUFvTWZkQyI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7fX0=', 1749454215);
INSERT INTO `sessions` VALUES ('dfhrVHxWULKIIzExVWGQABWXjC0nbAHk4mG7ihub', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiRXRVUHhsT2h5NWlpanZxb0JQNm5qbHJBMkpqMDRESW4zaWhUd0h5TCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1749449818);
INSERT INTO `sessions` VALUES ('YmtBbEdTRUyFXW9n2WxQedZJf9JS4bbOnezxF1Kv', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'YTo1OntzOjY6Il90b2tlbiI7czo0MDoid0MzaGNwWkV6UFQ4S0MxMlhLZThOYmp4eGFUamZrT0pxbVI4eHhxMyI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDM6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hZG1pbi9vcmRlci1yZXR1cm5zLzciO31zOjUwOiJsb2dpbl93ZWJfNTliYTM2YWRkYzJiMmY5NDAxNTgwZjAxNGM3ZjU4ZWE0ZTMwOTg5ZCI7aToxO3M6MTc6InBhc3N3b3JkX2hhc2hfd2ViIjtzOjYwOiIkMnkkMTIkc2k3Z1J5ZGJKZTZ1UER6LzBweHFEdWlwd0R3VDlRLzJwVnBmMEhwUzZrL2x0NXo3MFVodHUiO30=', 1749452391);

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
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of specifications
-- ----------------------------
INSERT INTO `specifications` VALUES (4, 'Color', 'aaaaa', '[\"2\", \"3\", \"4\", \"5\"]', 'active', '2025-05-17 10:27:51', '2025-05-17 10:36:25', NULL);
INSERT INTO `specifications` VALUES (5, 'Storage', 'aaa', '[\"1\", \"3\", \"9\", \"10\"]', 'active', '2025-05-17 10:32:52', '2025-05-17 10:32:52', NULL);
INSERT INTO `specifications` VALUES (6, 'Ram', 'chaaa', '[\"1\", \"2\", \"3\"]', 'active', '2025-05-17 11:25:10', '2025-05-17 11:25:10', NULL);
INSERT INTO `specifications` VALUES (7, '1', NULL, '[\"3\"]', 'active', '2025-05-17 11:25:26', '2025-06-08 11:10:45', '2025-06-08 11:10:45');
INSERT INTO `specifications` VALUES (8, '2', NULL, '[\"3\"]', 'active', '2025-05-17 11:25:37', '2025-06-08 11:10:51', '2025-06-08 11:10:51');
INSERT INTO `specifications` VALUES (9, '3', 'aaaaa', '[\"3\"]', 'active', '2025-05-17 11:25:58', '2025-06-08 11:11:08', '2025-06-08 11:11:08');
INSERT INTO `specifications` VALUES (10, '4', NULL, '[\"3\"]', 'active', '2025-05-17 11:26:12', '2025-06-08 11:10:59', '2025-06-08 11:10:59');
INSERT INTO `specifications` VALUES (11, '5', NULL, '[\"3\"]', 'active', '2025-05-17 11:26:31', '2025-06-08 11:11:15', '2025-06-08 11:11:15');
INSERT INTO `specifications` VALUES (12, '6', NULL, '[\"3\"]', 'active', '2025-05-17 11:26:46', '2025-06-08 11:11:21', '2025-06-08 11:11:21');

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
) ENGINE = InnoDB AUTO_INCREMENT = 59 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES (1, 'Admin ', 'admin@gmail.com', NULL, '$2y$12$si7gRydbJe6uPDz/0pxqDuipwDwT9Q/2pVpf0HpS6k/lt5z70Uhtu', NULL, NULL, '0123456789', 'Hanoi', NULL, NULL, 'other', 0, '2025-06-09 14:08:09', 'active', 'OZnvTP3d0fqsv5qxKOjza3a5CT4Su3vBaNvhfljK2YuvFxebN1aLvh4SYhPa', '2025-05-16 15:31:25', '2025-06-09 14:08:09', NULL);
INSERT INTO `users` VALUES (2, 'Staff ', 'staffp@gmail.com', NULL, '$2y$12$de5HWZYmyu9wLPmTzHmyJOjVt1J1uxTaBtWCyQQgZj/kIpNR7At3a', NULL, NULL, '0987654321', 'Hanoi', NULL, NULL, 'other', 0, NULL, 'active', NULL, '2025-05-15 12:40:59', '2025-05-15 12:40:59', NULL);
INSERT INTO `users` VALUES (19, 'Staff User', 'staffp@example.com', NULL, '$2y$12$WHrqm55gWHco5y8WkiNczeLnELUpkpEj3eJC3tOAxHV2QUp1o0DJm', NULL, NULL, '0987654321', 'Hanoi', NULL, NULL, 'other', 0, NULL, 'active', NULL, '2025-05-23 14:48:11', '2025-05-23 14:48:11', NULL);
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
INSERT INTO `users` VALUES (42, 'đại học coder', 'daichuvan05@gmail.com', NULL, '$2y$12$zabvva8SdzabLKbOkbzvKOxczOwxUaExwGePOUB3mjF7wlyA3B/V2', NULL, NULL, '0968791308', 'Vọng Giang', NULL, '2025-05-05', 'male', 0, '2025-06-09 13:52:54', 'inactive', NULL, '2025-05-28 14:57:13', '2025-06-09 13:52:54', NULL);
INSERT INTO `users` VALUES (43, 'Cường', 'test@gmail.com', NULL, '$2y$12$3n6LLncP6oIAforDGEkCKO5YEp/mhdvHQwK4UU2thehOUNRGmzBha', NULL, NULL, '09876543', 'Hà Nội', NULL, '2025-05-28', 'male', 0, '2025-06-07 20:16:23', 'active', NULL, '2025-05-28 22:46:16', '2025-06-07 20:16:23', NULL);
INSERT INTO `users` VALUES (44, 'banhdayyy', 'anh@gmail.com', NULL, '$2y$12$iL89MO6m8aJ6ytcW/gmKo.DM.6KpdA44E.QCUI.ZTtZ.u0iGCxNW2', NULL, NULL, '0368706552', 'asdsadas', NULL, '2025-05-15', 'male', 0, '2025-05-31 22:09:59', 'active', 'tR6P0OXUsCQtwboq9YCyaCdVdT2exORi6s27GcphWL6lhOk395FRM0vc8KCH', '2025-05-31 22:07:02', '2025-05-31 22:09:59', NULL);
INSERT INTO `users` VALUES (45, 'Thanh Bình Nguyễn', 'nguyenthanhbinh05082005@gmail.com', '2025-06-01 09:28:50', '$2y$12$Q0KzVz4F/HD5o609kbqZi.phhyITvFuXSEMqtOPFUpetszd6G0pkO', 'google', '102989406420602569869', NULL, NULL, 'https://lh3.googleusercontent.com/a/ACg8ocJ_1MC1lN0WwDtNb4x5D2AWjmSLm1k-R0V7TX3BrL80CWKlpw=s96-c', NULL, 'other', 0, NULL, 'active', NULL, '2025-06-01 09:28:50', '2025-06-01 09:28:50', NULL);
INSERT INTO `users` VALUES (52, 'banh dayy', 'banhday1234@gmail.com', NULL, '$2y$12$7WnXBp6SLBYwdJgmWWFG3eBlA/JskA4gLWGJjwAjBsvb2WI0NyatC', NULL, NULL, NULL, 'dfsdfadfas', NULL, '2025-05-28', 'female', 0, '2025-06-01 23:02:58', 'active', NULL, '2025-06-01 23:01:51', '2025-06-01 23:02:58', NULL);
INSERT INTO `users` VALUES (53, 'Banh Tester', 'remvaimankhung@gmail.com', '2025-06-01 23:03:19', '$2y$12$MObZpPjGNsoynBotx4F/Bee0hUiXpmi5IxZnwpsQXVXV1EWP03RKq', 'google', '116737877673519409445', NULL, NULL, 'https://lh3.googleusercontent.com/a/ACg8ocLU_9HP_drMj7OlbFgpvtPXOQO8NK0GHV8C4T4iyLUVbJIO9nk=s96-c', NULL, 'other', 0, '2025-06-01 23:03:19', 'active', NULL, '2025-06-01 23:03:19', '2025-06-01 23:03:19', NULL);
INSERT INTO `users` VALUES (55, 'Nguyễn Đình Khải PH 2 9 3 3 3', 'khaindph29333@fpt.edu.vn', '2025-06-06 21:17:28', '$2y$12$GNkUx1XICxiojX82LLoM2ud3ftUk.dPYacBjMvdfgXwoIvjRCaTl.', 'google', '108444160617922493293', NULL, NULL, 'https://lh3.googleusercontent.com/a/ACg8ocLB_WYRfUH-tTqs9HPYRbgRndrlJFdIr8zYaSrIKRWNpcfQvfs=s96-c', NULL, 'other', 0, '2025-06-06 21:25:54', 'active', NULL, '2025-06-06 21:17:28', '2025-06-06 21:25:54', NULL);
INSERT INTO `users` VALUES (56, 'banhday1', 'abc@gmail.com', NULL, '$2y$12$d4H0sg.1SmZsVo.v6ktX9.61m72Q0r0mQb2BSDe/BKb.ZCFgTk/NO', NULL, NULL, '0368706552', 'Số nhà 71, phố tiền phong, phường tiên cát', NULL, '2025-06-04', 'male', 0, '2025-06-08 11:48:16', 'active', NULL, '2025-06-08 10:43:19', '2025-06-08 11:48:16', NULL);
INSERT INTO `users` VALUES (57, 'Banhdayyy', 'anhnnbph50226@gmail.com', NULL, '$2y$12$p0rCIFebcRUrvdDscrh5tuYVSmgitAm8WLMGqYbH5w0bF.2y66cfi', NULL, NULL, '0368706552', 'Số nhà 71, phố tiền phong, phường tiên cát', NULL, '2025-06-18', 'female', 0, '2025-06-08 12:12:38', 'active', NULL, '2025-06-08 12:06:25', '2025-06-08 12:12:38', NULL);
INSERT INTO `users` VALUES (58, 'Thanh Bình Ford', 'fordthanhbinh@gmail.com', '2025-06-08 12:09:45', '$2y$12$MVlS.gw7VO4KCTMHtwBCM.Pv6Hnk4y4U75LE6naIlWY.Ju0EXP74i', 'google', '115646386580052762473', NULL, NULL, 'https://lh3.googleusercontent.com/a/ACg8ocJCXzWZLPJWJf0se5Ihc9PgsKzheh_qnnGQeZywKHuggYP9Wg=s96-c', NULL, 'other', 0, '2025-06-08 12:09:45', 'active', NULL, '2025-06-08 12:09:45', '2025-06-08 12:09:45', NULL);

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
) ENGINE = InnoDB AUTO_INCREMENT = 63 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of variant_attribute_types
-- ----------------------------
INSERT INTO `variant_attribute_types` VALUES (52, 'Color', '[\"1\", \"2\", \"3\", \"4\", \"5\"]', 'text', 0, 'active', '2025-06-03 21:13:19', '2025-06-04 08:16:03', NULL);
INSERT INTO `variant_attribute_types` VALUES (59, 'Storage', '[\"1\", \"2\"]', 'text', 0, 'active', '2025-06-04 20:44:27', '2025-06-06 20:09:26', NULL);

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
) ENGINE = InnoDB AUTO_INCREMENT = 139 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of variant_attribute_values
-- ----------------------------
INSERT INTO `variant_attribute_values` VALUES (123, 52, '[\"Black\"]', '[\"#000000\"]', 'active', '2025-06-04 20:04:01', '2025-06-04 21:14:01', '2025-06-04 21:14:01');
INSERT INTO `variant_attribute_values` VALUES (124, 52, '[\"White\"]', '[\"#ffffff\"]', 'active', '2025-06-04 20:04:24', '2025-06-04 21:16:22', '2025-06-04 21:16:22');
INSERT INTO `variant_attribute_values` VALUES (129, 59, '[\"128GB\"]', '[]', 'active', '2025-06-04 21:13:04', '2025-06-04 21:15:56', NULL);
INSERT INTO `variant_attribute_values` VALUES (130, 59, '[\"256GB\"]', '[]', 'active', '2025-06-04 21:13:04', '2025-06-04 21:13:04', NULL);
INSERT INTO `variant_attribute_values` VALUES (131, 52, '[\"Red\"]', '[\"#ff0000\"]', 'active', '2025-06-04 21:14:51', '2025-06-04 21:17:38', '2025-06-04 21:17:38');
INSERT INTO `variant_attribute_values` VALUES (132, 52, '[\"White\"]', '[\"#ffffff\"]', 'active', '2025-06-04 21:16:43', '2025-06-04 21:29:22', '2025-06-04 21:29:22');
INSERT INTO `variant_attribute_values` VALUES (133, 52, '[\"Black\"]', '[\"#000000\"]', 'active', '2025-06-04 21:28:41', '2025-06-04 21:30:09', '2025-06-04 21:30:09');
INSERT INTO `variant_attribute_values` VALUES (134, 52, '[\"Red\"]', '[\"#ff0000\"]', 'active', '2025-06-04 21:29:22', '2025-06-04 21:30:49', '2025-06-04 21:30:49');
INSERT INTO `variant_attribute_values` VALUES (135, 52, '[\"White\"]', '[\"#ffffff\"]', 'active', '2025-06-04 21:30:09', '2025-06-04 21:30:09', NULL);
INSERT INTO `variant_attribute_values` VALUES (136, 52, '[\"Red\"]', '[\"#ff0000\"]', 'active', '2025-06-04 21:30:49', '2025-06-04 21:30:49', NULL);
INSERT INTO `variant_attribute_values` VALUES (137, 52, '[\"Đỏ\"]', '[]', 'active', '2025-06-08 09:09:12', '2025-06-08 11:11:53', '2025-06-08 11:11:53');
INSERT INTO `variant_attribute_values` VALUES (138, 59, '[\"120\"]', '[]', 'active', '2025-06-08 09:09:12', '2025-06-08 11:11:37', '2025-06-08 11:11:37');

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
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `variant_combinations_variant_id_attribute_value_id_unique`(`variant_id`, `attribute_value_id`) USING BTREE,
  INDEX `variant_combinations_attribute_value_id_foreign`(`attribute_value_id`) USING BTREE,
  INDEX `variant_combinations_variant_id_index`(`variant_id`) USING BTREE,
  INDEX `variant_combinations_attribute_value_id_index`(`attribute_value_id`) USING BTREE,
  CONSTRAINT `variant_combinations_attribute_value_id_foreign` FOREIGN KEY (`attribute_value_id`) REFERENCES `variant_attribute_values` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `variant_combinations_variant_id_foreign` FOREIGN KEY (`variant_id`) REFERENCES `product_variants` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 222 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of variant_combinations
-- ----------------------------
INSERT INTO `variant_combinations` VALUES (208, 160, 135, '2025-06-08 11:20:40', '2025-06-08 11:20:40');
INSERT INTO `variant_combinations` VALUES (209, 160, 129, '2025-06-08 11:20:40', '2025-06-08 11:20:40');
INSERT INTO `variant_combinations` VALUES (210, 161, 135, '2025-06-08 11:20:40', '2025-06-08 11:20:40');
INSERT INTO `variant_combinations` VALUES (211, 161, 130, '2025-06-08 11:20:40', '2025-06-08 11:20:40');
INSERT INTO `variant_combinations` VALUES (212, 162, 136, '2025-06-08 11:20:40', '2025-06-08 11:20:40');
INSERT INTO `variant_combinations` VALUES (213, 162, 129, '2025-06-08 11:20:40', '2025-06-08 11:20:40');
INSERT INTO `variant_combinations` VALUES (214, 163, 136, '2025-06-08 11:20:40', '2025-06-08 11:20:40');
INSERT INTO `variant_combinations` VALUES (215, 163, 130, '2025-06-08 11:20:40', '2025-06-08 11:20:40');
INSERT INTO `variant_combinations` VALUES (216, 164, 135, '2025-06-09 14:21:24', '2025-06-09 14:21:24');
INSERT INTO `variant_combinations` VALUES (217, 164, 130, '2025-06-09 14:21:24', '2025-06-09 14:21:24');
INSERT INTO `variant_combinations` VALUES (218, 165, 136, '2025-06-09 14:22:47', '2025-06-09 14:22:47');
INSERT INTO `variant_combinations` VALUES (219, 165, 130, '2025-06-09 14:22:47', '2025-06-09 14:22:47');
INSERT INTO `variant_combinations` VALUES (220, 166, 136, '2025-06-09 14:28:48', '2025-06-09 14:28:48');
INSERT INTO `variant_combinations` VALUES (221, 166, 129, '2025-06-09 14:28:48', '2025-06-09 14:28:48');

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
) ENGINE = InnoDB AUTO_INCREMENT = 58 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wishlists
-- ----------------------------

SET FOREIGN_KEY_CHECKS = 1;
