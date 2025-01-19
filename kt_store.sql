-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Jan 19, 2025 at 09:18 AM
-- Server version: 8.2.0
-- PHP Version: 8.2.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `kt_store`
--

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

DROP TABLE IF EXISTS `cart`;
CREATE TABLE IF NOT EXISTS `cart` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `cart`
--

INSERT INTO `cart` (`id`, `user_id`) VALUES
(1, 65),
(3, 83),
(6, 85),
(7, 86),
(8, 87);

-- --------------------------------------------------------

--
-- Table structure for table `cart_details`
--

DROP TABLE IF EXISTS `cart_details`;
CREATE TABLE IF NOT EXISTS `cart_details` (
  `id` int NOT NULL AUTO_INCREMENT,
  `quantity` int NOT NULL,
  `price` int NOT NULL,
  `id_size` int NOT NULL,
  `product_id` int NOT NULL,
  `cart_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `cart_id` (`cart_id`),
  KEY `id_size` (`id_size`),
  KEY `product_id` (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=69 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `caterogy`
--

DROP TABLE IF EXISTS `caterogy`;
CREATE TABLE IF NOT EXISTS `caterogy` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `caterogy`
--

INSERT INTO `caterogy` (`id`, `name`) VALUES
(1, 'Áo Câu Lạc Bộ'),
(2, 'Áo Đội Tuyển Quốc Gia');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
CREATE TABLE IF NOT EXISTS `orders` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `status` varchar(255) DEFAULT NULL,
  `sdt` varchar(255) DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `total_price` int NOT NULL,
  `create_at` date DEFAULT NULL,
  `status_payment` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_orderuser` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=277 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `user_id`, `name`, `status`, `sdt`, `address`, `total_price`, `create_at`, `status_payment`) VALUES
(248, 86, 'trungbui', 'Hoàn Tất', '0932190632', '2 Liên Ấp, xã Vĩnh Lộc A, Bình Chánh, Thành phố Hồ Chí Minh, Việt Nam', 700000, '2024-12-21', 'Thanh Toán Thành Công'),
(249, 87, 'trungbui', 'Hoàn Tất', '0932190632', '2 Liên Ấp, xã Vĩnh Lộc A, Bình Chánh, Thành phố Hồ Chí Minh, Việt Nam', 500000, '2024-12-21', 'Thanh Toán Thành Công'),
(250, 86, 'kingofcode5123', 'Hoàn Tất', '0932190632', '2 Liên Ấp, xã Vĩnh Lộc A, Bình Chánh, Thành phố Hồ Chí Minh, Việt Nam', 400000, '2024-12-21', 'Thanh Toán Khi Nhận Hàng'),
(251, 86, 'trungbui', 'Hoàn Tất', '0932190632', '2 Liên Ấp, xã Vĩnh Lộc A, Bình Chánh, Thành phố Hồ Chí Minh, Việt Nam', 1000000, '2024-12-21', 'Thanh Toán Thành Công'),
(254, 83, 'user123', 'Hoàn Tất', '0932190632', 'vĩnh lộc A', 100000, '2024-12-24', 'Thanh Toán Khi Nhận Hàng'),
(255, 83, 'trungbui', 'Hoàn Tất', '0932190632', 'vĩnh lộc A', 200000, '2024-12-24', 'Thanh Toán Thành Công'),
(256, 83, 'trungbui', 'Hoàn Tất', '0932190632', 'vĩnh lộc A', 100000, '2024-12-24', 'Thanh Toán Thành Công'),
(257, 83, 'trungbui', 'Hoàn Tất', '0932190632', 'vĩnh lộc A', 100000, '2024-12-24', 'Thanh Toán Thành Công'),
(258, 83, 'trungbui', 'Hoàn Tất', '0932190632', 'vĩnh lộc A', 100000, '2024-12-24', 'Thanh Toán Thành Công'),
(259, 83, 'trungbui', 'Hoàn Tất', '0932190632', 'vĩnh lộc A', 100000, '2024-12-24', 'Thanh Toán Thành Công'),
(260, 83, 'trungbui', 'Đang Chuẩn Bị', '0932190632', 'vĩnh lộc A', 100000, '2024-12-24', 'Thanh Toán Thành Công'),
(261, 83, 'trungbui', 'Đang Chuẩn Bị', '0932190632', 'vĩnh lộc A', 100000, '2024-12-24', 'Thanh Toán Thành Công'),
(262, 83, 'trungbui', 'Đang Chuẩn Bị', '0932190632', 'vĩnh lộc A', 100000, '2024-12-24', 'Thanh Toán Thành Công'),
(263, 83, 'trungbui', 'Đang Chuẩn Bị', '0932190632', 'vĩnh lộc A', 100000, '2024-12-24', 'Thanh Toán Thành Công'),
(264, 83, 'trungbui', 'Hoàn Tất', '0932190632', 'vĩnh lộc A', 100000, '2024-12-24', 'Thanh Toán Thành Công'),
(267, 83, 'user123', 'Đang Chuẩn Bị', '0932190632', 'vĩnh lộc A', 1400000, '2024-12-27', 'Thanh Toán Khi Nhận Hàng'),
(270, 83, 'trungbui', 'Đang Chuẩn Bị', '0932190632', 'vĩnh lộc A', 100000, '2024-12-28', 'Thanh Toán Thành Công'),
(271, 83, 'trungbui', 'Đang Chuẩn Bị', '0932190632', 'vĩnh lộc A', 200000, '2024-12-28', 'Thanh Toán Thành Công'),
(272, 83, 'trungbui', 'Đang Chuẩn Bị', '0932190632', 'vĩnh lộc A', 600000, '2024-12-28', 'Thanh Toán Thành Công'),
(273, 83, 'trungbui', 'Đang Chuẩn Bị', '0932190632', 'vĩnh lộc A', 100000, '2024-12-28', 'Thanh Toán Thành Công'),
(274, 83, 'be iu', 'Đang Chuẩn Bị', '0932190632', 'vĩnh lộc A', 100000, '2024-12-28', 'Thanh Toán Thành Công'),
(276, 83, 'tr', 'Đang Chuẩn Bị', '0932190632', 'vĩnh lộc A', 800000, '2025-01-19', 'Thanh Toán Khi Nhận Hàng');

-- --------------------------------------------------------

--
-- Table structure for table `order_details`
--

DROP TABLE IF EXISTS `order_details`;
CREATE TABLE IF NOT EXISTS `order_details` (
  `id` int NOT NULL AUTO_INCREMENT,
  `product_id` int NOT NULL,
  `order_id` int NOT NULL,
  `price` int NOT NULL,
  `quantity` int NOT NULL,
  `id_size` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_oder_detail` (`order_id`),
  KEY `fk_oderdetail_product` (`product_id`),
  KEY `fk_oder_size` (`id_size`)
) ENGINE=InnoDB AUTO_INCREMENT=497 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `order_details`
--

INSERT INTO `order_details` (`id`, `product_id`, `order_id`, `price`, `quantity`, `id_size`) VALUES
(459, 150, 248, 100000, 4, 2),
(460, 150, 248, 100000, 3, 3),
(461, 153, 249, 100000, 3, 2),
(462, 153, 249, 100000, 2, 3),
(463, 150, 250, 100000, 4, 2),
(464, 151, 251, 100000, 10, 4),
(469, 147, 254, 100000, 1, 1),
(470, 148, 255, 100000, 1, 2),
(471, 148, 255, 100000, 1, 3),
(472, 148, 256, 100000, 1, 1),
(473, 147, 258, 100000, 1, 1),
(474, 147, 257, 100000, 1, 1),
(475, 154, 259, 100000, 1, 1),
(476, 154, 260, 100000, 1, 1),
(477, 151, 262, 100000, 1, 1),
(478, 151, 261, 100000, 1, 1),
(479, 152, 263, 100000, 1, 1),
(480, 152, 264, 100000, 1, 1),
(483, 148, 267, 100000, 4, 2),
(484, 154, 267, 100000, 10, 4),
(487, 152, 270, 100000, 1, 1),
(488, 153, 271, 100000, 1, 4),
(489, 153, 271, 100000, 1, 1),
(490, 148, 272, 100000, 1, 2),
(491, 150, 272, 100000, 5, 4),
(492, 147, 273, 100000, 1, 1),
(493, 149, 274, 100000, 1, 1),
(495, 149, 276, 100000, 3, 1),
(496, 149, 276, 100000, 5, 3);

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
CREATE TABLE IF NOT EXISTS `product` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `price` int NOT NULL,
  `id_category` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_product_category` (`id_category`)
) ENGINE=InnoDB AUTO_INCREMENT=162 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`id`, `name`, `description`, `image`, `price`, `id_category`) VALUES
(147, 'Áo Arsenal', 'Chất vải – Chi tiết/Hoạ tiết – Bề mặt vải giống chính hãng.\r\nThiết kế Bodyfit Form, co giãn và ôm vào cơ thể. Được form được sản xuất theo size Châu Âu.\r\n', '21122024215733_arsenal1.jpg', 100000, 1),
(148, 'Áo Manchester United', 'Chất vải – Chi tiết/Hoạ tiết – Bề mặt vải giống chính hãng.\r\nThiết kế Bodyfit Form, co giãn và ôm vào cơ thể. Được form được sản xuất theo size Châu Âu.\r\n', '21122024215844_mu1.jpg', 100000, 1),
(149, 'Áo Chelsea', 'Chất vải – Chi tiết/Hoạ tiết – Bề mặt vải giống chính hãng.\r\nThiết kế Bodyfit Form, co giãn và ôm vào cơ thể. Được form được sản xuất theo size Châu Âu.\r\n', '21122024215926_chel1.jpg', 100000, 1),
(150, 'Áo Manchester City', 'Chất vải – Chi tiết/Hoạ tiết – Bề mặt vải giống chính hãng.\r\nThiết kế Bodyfit Form, co giãn và ôm vào cơ thể. Được form được sản xuất theo size Châu Âu.\r\n', '21122024220020_mc1.jpg', 100000, 1),
(151, 'Áo Liverpool', 'Chất vải – Chi tiết/Hoạ tiết – Bề mặt vải giống chính hãng.\r\nThiết kế Bodyfit Form, co giãn và ôm vào cơ thể. Được form được sản xuất theo size Châu Âu.\r\n', '21122024220107_liver1.jpg', 100000, 1),
(152, 'Áo Bồ Đào Nha', 'Chất vải – Chi tiết/Hoạ tiết – Bề mặt vải giống chính hãng.\r\nThiết kế Bodyfit Form, co giãn và ôm vào cơ thể. Được form được sản xuất theo size Châu Âu.\r\n', '21122024220214_bdn1.jpg', 100000, 2),
(153, 'Áo Brazil', 'Chất vải – Chi tiết/Hoạ tiết – Bề mặt vải giống chính hãng.\r\nThiết kế Bodyfit Form, co giãn và ôm vào cơ thể. Được form được sản xuất theo size Châu Âu.\r\n', '21122024220248_brazil1.jpg', 100000, 2),
(154, 'Áo Argentina', 'Chất vải – Chi tiết/Hoạ tiết – Bề mặt vải giống chính hãng.\r\nThiết kế Bodyfit Form, co giãn và ôm vào cơ thể. Được form được sản xuất theo size Châu Âu.\r\n', '21122024220335_arg1.jpg', 100000, 2);

-- --------------------------------------------------------

--
-- Table structure for table `productimage`
--

DROP TABLE IF EXISTS `productimage`;
CREATE TABLE IF NOT EXISTS `productimage` (
  `id` int NOT NULL AUTO_INCREMENT,
  `imageurl` varchar(255) DEFAULT NULL,
  `id_product` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_product` (`id_product`)
) ENGINE=InnoDB AUTO_INCREMENT=525 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `productimage`
--

INSERT INTO `productimage` (`id`, `imageurl`, `id_product`) VALUES
(462, '21122024215733_arsenal1.jpg', 147),
(463, '21122024215733_arsenal2.jpg', 147),
(464, '21122024215733_arsenal3.jpg', 147),
(465, '21122024215733_arsenal4.jpg', 147),
(466, '21122024215844_mu1.jpg', 148),
(467, '21122024215844_mu2.jpg', 148),
(468, '21122024215844_mu3.jpg', 148),
(469, '21122024215844_mu4.jpg', 148),
(470, '21122024215926_chel1.jpg', 149),
(471, '21122024215926_chel2.jpg', 149),
(472, '21122024215926_chel3.jpg', 149),
(473, '21122024215926_chel4.jpg', 149),
(474, '21122024220020_mc1.jpg', 150),
(475, '21122024220020_mc2.jpg', 150),
(476, '21122024220020_mc3.jpg', 150),
(477, '21122024220020_mc4.jpg', 150),
(478, '21122024220107_liver1.jpg', 151),
(479, '21122024220107_liver2.jpg', 151),
(480, '21122024220107_liver3.jpg', 151),
(481, '21122024220107_liver4.jpg', 151),
(482, '21122024220214_bdn1.jpg', 152),
(483, '21122024220214_bdn2.jpg', 152),
(484, '21122024220214_bdn3.jpg', 152),
(485, '21122024220214_bdn4.jpg', 152),
(486, '21122024220248_brazil1.jpg', 153),
(487, '21122024220248_brazil2.jpg', 153),
(488, '21122024220248_brazil3.jpg', 153),
(489, '21122024220248_brazil4.jpg', 153),
(490, '21122024220335_arg1.jpg', 154),
(491, '21122024220335_arg2.jpg', 154),
(492, '21122024220335_arg3.jpg', 154),
(493, '21122024220335_arg4.jpg', 154);

-- --------------------------------------------------------

--
-- Table structure for table `product_size`
--

DROP TABLE IF EXISTS `product_size`;
CREATE TABLE IF NOT EXISTS `product_size` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_size` int NOT NULL,
  `id_product` int NOT NULL,
  `quantity` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_size_product` (`id_size`),
  KEY `fk_product_size` (`id_product`)
) ENGINE=InnoDB AUTO_INCREMENT=242 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `product_size`
--

INSERT INTO `product_size` (`id`, `id_size`, `id_product`, `quantity`) VALUES
(182, 1, 147, 97),
(183, 2, 147, 99),
(184, 3, 147, 100),
(185, 4, 147, 50),
(186, 1, 148, 98),
(187, 2, 148, 90),
(188, 3, 148, 99),
(189, 4, 148, 101),
(190, 1, 149, 96),
(191, 2, 149, 102),
(192, 3, 149, 95),
(193, 4, 149, 100),
(194, 1, 150, 100),
(195, 2, 150, 93),
(196, 3, 150, 97),
(197, 4, 150, 95),
(198, 1, 151, 99),
(199, 2, 151, 100),
(200, 3, 151, 100),
(201, 4, 151, 90),
(202, 1, 152, 49),
(203, 2, 152, 100),
(204, 3, 152, 100),
(205, 4, 152, 100),
(206, 1, 153, 99),
(207, 2, 153, 97),
(208, 3, 153, 98),
(209, 4, 153, 99),
(210, 1, 154, 100),
(211, 2, 154, 94),
(212, 3, 154, 100),
(213, 4, 154, 89);

-- --------------------------------------------------------

--
-- Table structure for table `size`
--

DROP TABLE IF EXISTS `size`;
CREATE TABLE IF NOT EXISTS `size` (
  `id` int NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `size`
--

INSERT INTO `size` (`id`, `description`) VALUES
(1, 'S'),
(2, 'M'),
(3, 'L'),
(4, 'XL');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `sdt` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `role` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_idrole` (`role`)
) ENGINE=InnoDB AUTO_INCREMENT=105 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `username`, `password`, `email`, `birthday`, `sdt`, `address`, `role`) VALUES
(5, 'admin', '$2a$10$x1NHRV4a4yOOQrmB.V8XJuoWGwF8Xlel6P4xpSxbuKj2Xsz4vFDsW', 'em@gmail.com', '2024-11-05', '09181818118', '18 Cao Lỗ Q8 HCM', 1),
(65, 'khanhba', '$2a$10$SeFS6mm48ByQK8wJ9kMoO.MxKJfmybIV5Xm/jtWrN7JMJ9eClmmVW', 'khanhba123@gmail.com', '2024-12-16', '0932190632', '2 Liên Ấp, xã Vĩnh Lộc A, Bình Chánh, Thành phố Hồ Chí Minh, Việt Nam', 0),
(70, 'quoc trung', '$2a$10$UQPyEr6V7nou87VFuALaN.PT.kK4py3vKmzHDD/tLWLA.IAcDgqfC', 'trungbui512003@gmail.com', '2024-12-17', '0932190632', '304 Hương Lộ 80, Phường Bình Hưng Hòa B, Quận Bình Tân, TP HCM', 0),
(83, 'user123', '$2a$10$rnyoXB4EL6v39ZZwRHj1yOn0wHXfOQAawq9dukLLie.8iKGq6odGC', 'trungbui512003@gmail.com', '2024-12-21', '0932190632', 'vĩnh lộc A', 0),
(85, 'trungto46', '$2a$10$i0F6b7pJutN.ybEDBlHQmeCs5YL0n5yQri3X10JEiOp7LEqrFut8q', 'trungbui512003@gmail.com', '2024-12-19', '0932190632', '2 Liên Ấp, xã Vĩnh Lộc A, Bình Chánh, Thành phố Hồ Chí Minh, Việt Nam', 0),
(86, 'kingofcode5123', '$2a$10$mDrjWgyIkHhIRf3JHC/Sd.2pqtxEJjCJoT4DV5iJ16A78xv3X2mGq', 'trungbui512003@gmail.com', '2024-12-19', '0932190632', '2 Liên Ấp, xã Vĩnh Lộc A, Bình Chánh, Thành phố Hồ Chí Minh, Việt Nam', 0),
(87, 'bon', '$2a$10$aigVHk6A5AvA6MtU.anX4uK8CtA7rZ.dCepKINSDtaFdZyIpVfeOW', 'trungbui512003@gmail.com', '2024-12-19', '0932190632', '2 Liên Ấp, xã Vĩnh Lộc A, Bình Chánh, Thành phố Hồ Chí Minh, Việt Nam', 0),
(101, 'Trung Bùi ', '$2a$10$cy7RNAxl9m6uUKkug2qPxePBaEZAK9Ho3f.KmqSaOeMewEaKRVHNW', 'trungbui512003@gmail.com', '2000-11-21', '0932190632', '2 Liên Ấp, xã Vĩnh Lộc A, Bình Chánh, Thành phố Hồ Chí Minh, Việt Nam', 0);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `cart`
--
ALTER TABLE `cart`
  ADD CONSTRAINT `fk_user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Constraints for table `cart_details`
--
ALTER TABLE `cart_details`
  ADD CONSTRAINT `cart_details_ibfk_1` FOREIGN KEY (`cart_id`) REFERENCES `cart` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `cart_details_ibfk_2` FOREIGN KEY (`id_size`) REFERENCES `size` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `cart_details_ibfk_3` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `fk_orderuser` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Constraints for table `order_details`
--
ALTER TABLE `order_details`
  ADD CONSTRAINT `fk_oder_detail` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `fk_oder_size` FOREIGN KEY (`id_size`) REFERENCES `size` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `fk_oderdetail_product` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Constraints for table `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `fk_product_category` FOREIGN KEY (`id_category`) REFERENCES `caterogy` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Constraints for table `productimage`
--
ALTER TABLE `productimage`
  ADD CONSTRAINT `productimage_ibfk_1` FOREIGN KEY (`id_product`) REFERENCES `product` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Constraints for table `product_size`
--
ALTER TABLE `product_size`
  ADD CONSTRAINT `fk_product_size` FOREIGN KEY (`id_product`) REFERENCES `product` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `fk_size_product` FOREIGN KEY (`id_size`) REFERENCES `size` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
