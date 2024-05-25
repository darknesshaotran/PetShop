-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 25, 2024 at 05:50 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `petshop`
--

-- --------------------------------------------------------

--
-- Table structure for table `accounts`
--

CREATE TABLE `accounts` (
  `id` int(11) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `id_role` int(11) NOT NULL,
  `point` int(11) DEFAULT NULL,
  `forgot_password_token` varchar(255) DEFAULT NULL,
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp(),
  `updatedAt` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `accounts`
--

INSERT INTO `accounts` (`id`, `email`, `password`, `id_role`, `point`, `forgot_password_token`, `createdAt`, `updatedAt`) VALUES
(2, 'darknessclmm@gmail.com', 'cc2d80098f6cb0843e2b11315f3994c0a0fe05842a0a5e018d6b084566ee03cc', 1, 1, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySUQiOjIsInR5cGUiOiJmb3Jnb3RQYXNzd29yZFRva2VuIiwiaWF0IjoxNjk4ODI0NzM4LCJleHAiOjE2OTg5OTc1Mzh9.pMtZYtph38yr5GJdGBSFMhZ0fFUb5mgwz3EvImB14zs', '2023-10-27 08:51:32', '2024-05-25 02:53:09'),
(5, 'hothanhhungtran@gmail.com', 'cc2d80098f6cb0843e2b11315f3994c0a0fe05842a0a5e018d6b084566ee03cc', 2, NULL, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySUQiOjUsInR5cGUiOiJmb3Jnb3RQYXNzd29yZFRva2VuIiwiaWF0IjoxNjk4ODI0NTExLCJleHAiOjE2OTg5OTczMTF9.kvCnD6GMZhhe5qVufCjY0Wri3QljsUYRwEkYF5ZiwSk', '2023-11-01 07:35:08', '2023-11-01 07:41:51'),
(6, 'hothanhhungtran1@gmail.com', 'cc2d80098f6cb0843e2b11315f3994c0a0fe05842a0a5e018d6b084566ee03cc', 2, NULL, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySUQiOjYsInR5cGUiOiJmb3Jnb3RQYXNzd29yZFRva2VuIiwiaWF0IjoxNjk4ODI0Mzk3LCJleHAiOjE2OTg5OTcxOTd9.L37kBCUkfexxYwHE1IB9GufnyrJi_lTZW_6hSIH4JvM', '2023-11-01 07:36:30', '2023-11-01 07:39:57'),
(7, 'darknessclmm1@gmail.com', 'cc2d80098f6cb0843e2b11315f3994c0a0fe05842a0a5e018d6b084566ee03cc', 2, NULL, NULL, '2023-11-03 07:00:41', '2023-11-03 07:00:41'),
(8, 'manhddt2508@gmail.com', 'cc2d80098f6cb0843e2b11315f3994c0a0fe05842a0a5e018d6b084566ee03cc', 2, NULL, NULL, '2023-11-30 11:07:40', '2023-11-30 11:07:40'),
(9, 'manhddt111@gmail.com', 'cc2d80098f6cb0843e2b11315f3994c0a0fe05842a0a5e018d6b084566ee03cc', 2, NULL, NULL, '2023-11-30 16:23:49', '2023-11-30 16:23:49'),
(10, 'manhddt250811@gm1ail.com', 'cc2d80098f6cb0843e2b11315f3994c0a0fe05842a0a5e018d6b084566ee03cc', 2, NULL, NULL, '2023-12-01 06:18:18', '2023-12-01 06:18:18'),
(11, 'manhddt1234@gmail.com', 'cc2d80098f6cb0843e2b11315f3994c0a0fe05842a0a5e018d6b084566ee03cc', 2, NULL, NULL, '2023-12-01 06:24:14', '2023-12-01 06:24:14'),
(12, 'manhddt12345@gmail.com', 'cc2d80098f6cb0843e2b11315f3994c0a0fe05842a0a5e018d6b084566ee03cc', 2, NULL, NULL, '2023-12-01 09:20:26', '2023-12-01 09:20:26'),
(13, 'manhddt250802@gmail.com', '2c91440bfacd977e1a27d76d53e199521669b68a06c6e6e07edd17a952f978ff', 2, NULL, NULL, '2023-12-08 09:32:21', '2023-12-08 09:32:21');

-- --------------------------------------------------------

--
-- Table structure for table `addressinfors`
--

CREATE TABLE `addressinfors` (
  `id` int(11) NOT NULL,
  `id_account` int(11) NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  `phoneNumber` varchar(255) DEFAULT NULL,
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp(),
  `updatedAt` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `addressinfors`
--

INSERT INTO `addressinfors` (`id`, `id_account`, `address`, `phoneNumber`, `createdAt`, `updatedAt`) VALUES
(2, 2, '131bc tran hung dao street', '0914220243', '2023-10-27 08:53:32', '2023-11-01 01:06:07'),
(4, 2, 'xuân thiều 14', '0962240446', '2024-05-09 05:41:50', '2024-05-09 05:42:31'),
(5, 2, 'thạch sơn 7', '0962240446', '2024-05-09 05:41:58', '2024-05-09 05:41:58');

-- --------------------------------------------------------

--
-- Table structure for table `appointments`
--

CREATE TABLE `appointments` (
  `id` int(11) NOT NULL,
  `id_service` int(11) NOT NULL,
  `id_order` int(11) NOT NULL,
  `appointment_time` timestamp NOT NULL DEFAULT current_timestamp(),
  `end_time` timestamp NOT NULL DEFAULT current_timestamp(),
  `note` text NOT NULL,
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp(),
  `updatedAt` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `appointments`
--

INSERT INTO `appointments` (`id`, `id_service`, `id_order`, `appointment_time`, `end_time`, `note`, `createdAt`, `updatedAt`) VALUES
(1, 6, 26, '2023-05-27 05:00:00', '2023-05-27 06:00:00', 'tắm sạch vào nhá', '2024-05-23 03:32:27', '2024-05-24 08:43:48'),
(2, 6, 27, '2023-05-27 06:30:00', '2023-05-27 07:00:00', 'tắm sạch dô ', '2024-05-23 09:16:14', '2024-05-23 09:16:14'),
(3, 4, 28, '2023-11-01 01:31:28', '2023-11-01 01:31:28', 'cắt tỉa cẩn thận', '2024-05-24 08:48:41', '2024-05-24 08:48:41'),
(4, 4, 29, '2023-11-01 01:32:28', '2023-11-01 01:32:28', 'cắt tỉa cẩn thận', '2024-05-24 09:07:48', '2024-05-24 09:07:48'),
(5, 4, 30, '2023-11-01 01:33:28', '2023-11-01 01:36:28', 'cắt tỉa cẩn thận', '2024-05-24 09:11:50', '2024-05-24 09:11:50');

-- --------------------------------------------------------

--
-- Table structure for table `breeds`
--

CREATE TABLE `breeds` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp(),
  `updatedAt` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `breeds`
--

INSERT INTO `breeds` (`id`, `name`, `image`, `description`, `createdAt`, `updatedAt`) VALUES
(9, 'Husky', 'https://pbl6-shoesshop.s3.ap-southeast-1.amazonaws.com/cd959ede4f6701dd9ab301900.jpg', 'a fat dog', '2024-05-09 04:10:12', '2024-05-09 04:10:12'),
(10, 'big cat', 'https://pbl6-shoesshop.s3.ap-southeast-1.amazonaws.com/e6f1f07c28173e77f54901200.jpg', 'cat with big body', '2024-05-09 07:10:12', '2024-05-23 06:46:11'),
(11, 'chó gay ', 'https://pbl6-shoesshop.s3.ap-southeast-1.amazonaws.com/f9c71a12f5d22bbd085baa600.jpg', 'chó lgbt', '2024-05-24 10:16:22', '2024-05-24 10:16:22'),
(12, 'chó TFT ', 'https://pbl6-shoesshop.s3.ap-southeast-1.amazonaws.com/f9c71a12f5d22bbd085baa612.jpg', 'sadsadsdsd', '2024-05-24 10:19:31', '2024-05-24 10:19:31');

-- --------------------------------------------------------

--
-- Table structure for table `carts`
--

CREATE TABLE `carts` (
  `id` int(11) NOT NULL,
  `id_account` int(11) NOT NULL,
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp(),
  `updatedAt` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `carts`
--

INSERT INTO `carts` (`id`, `id_account`, `createdAt`, `updatedAt`) VALUES
(1, 2, '2023-10-27 08:51:32', '2023-10-27 08:51:32'),
(4, 5, '2023-11-01 07:35:08', '2023-11-01 07:35:08'),
(5, 6, '2023-11-01 07:36:30', '2023-11-01 07:36:30'),
(6, 7, '2023-11-03 07:00:41', '2023-11-03 07:00:41'),
(7, 8, '2023-11-30 11:07:41', '2023-11-30 11:07:41'),
(8, 9, '2023-11-30 16:23:49', '2023-11-30 16:23:49'),
(9, 10, '2023-12-01 06:18:18', '2023-12-01 06:18:18'),
(10, 11, '2023-12-01 06:24:14', '2023-12-01 06:24:14'),
(11, 12, '2023-12-01 09:20:26', '2023-12-01 09:20:26'),
(12, 13, '2023-12-08 09:32:21', '2023-12-08 09:32:21');

-- --------------------------------------------------------

--
-- Table structure for table `cart_items`
--

CREATE TABLE `cart_items` (
  `id` int(11) NOT NULL,
  `id_product` int(11) NOT NULL,
  `id_cart` int(11) NOT NULL,
  `quantity` int(11) DEFAULT NULL,
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp(),
  `updatedAt` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `cart_items`
--

INSERT INTO `cart_items` (`id`, `id_product`, `id_cart`, `quantity`, `createdAt`, `updatedAt`) VALUES
(16, 1424, 1, 1, '2024-05-22 08:04:40', '2024-05-22 08:04:40');

-- --------------------------------------------------------

--
-- Table structure for table `images`
--

CREATE TABLE `images` (
  `id` int(11) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `id_product` int(11) NOT NULL,
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp(),
  `updatedAt` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `images`
--

INSERT INTO `images` (`id`, `image`, `id_product`, `createdAt`, `updatedAt`) VALUES
(1426, 'https://pbl6-shoesshop.s3.ap-southeast-1.amazonaws.com/fdec53a622da7f0dd08227b03.jpg', 1424, '2024-05-09 05:39:07', '2024-05-09 05:39:07'),
(1427, 'https://pbl6-shoesshop.s3.ap-southeast-1.amazonaws.com/fdec53a622da7f0dd08227b04.jpg', 1424, '2024-05-09 05:39:07', '2024-05-09 05:39:07');

-- --------------------------------------------------------

--
-- Table structure for table `inforusers`
--

CREATE TABLE `inforusers` (
  `id` int(11) NOT NULL,
  `id_account` int(11) NOT NULL,
  `lastname` varchar(255) DEFAULT NULL,
  `firstname` varchar(255) DEFAULT NULL,
  `phoneNumber` varchar(255) DEFAULT NULL,
  `avatar` varchar(255) DEFAULT NULL,
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp(),
  `updatedAt` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `inforusers`
--

INSERT INTO `inforusers` (`id`, `id_account`, `lastname`, `firstname`, `phoneNumber`, `avatar`, `createdAt`, `updatedAt`) VALUES
(1, 2, 'Trần', 'Hào', '3111111111', 'https://pbl6-shoesshop.s3.ap-southeast-1.amazonaws.com/d985664e57a047cd1376fb801.jpg', '2023-10-27 08:51:32', '2024-05-22 08:39:56'),
(4, 5, 'hào thanh hưng', 'trần', '3111111111', NULL, '2023-11-01 07:35:08', '2023-11-01 07:35:08'),
(5, 6, 'hào thanh hưng', 'trần', '3111111111', NULL, '2023-11-01 07:36:30', '2023-11-01 07:36:30'),
(6, 7, 'Thanh', 'Hưng gà', '3111111111', 'https://pbl6-shoesshop.s3.ap-southeast-1.amazonaws.com/d5d65b52e1174eaef76b19d01.jpg', '2023-11-03 07:00:41', '2023-11-21 15:37:08'),
(7, 8, 'Duc Manh', 'Nguyen', '3111111111', NULL, '2023-11-30 11:07:41', '2023-11-30 11:07:41'),
(8, 9, 'Duc Manh', 'Nguyen', '0905897381', NULL, '2023-11-30 16:23:49', '2023-11-30 16:23:49'),
(9, 10, 'Duc Manh', 'Nguyen', '3111111111', NULL, '2023-12-01 06:18:18', '2023-12-01 06:18:18'),
(10, 11, 'Duc Manh', 'Nguyen', '0905897381', NULL, '2023-12-01 06:24:14', '2023-12-01 06:24:14'),
(11, 12, 'Duc Manh', 'Nguyen', '0905897381', NULL, '2023-12-01 09:20:26', '2023-12-01 09:20:26'),
(12, 13, 'Mạnh', 'Nguyễn', '0905897381', 'https://pbl6-shoesshop.s3.ap-southeast-1.amazonaws.com/804118f41351568757bf12d01.jpg', '2023-12-08 09:32:21', '2023-12-08 09:55:20');

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

CREATE TABLE `messages` (
  `id` int(11) NOT NULL,
  `id_reciever` int(11) NOT NULL,
  `id_sender` int(11) NOT NULL,
  `content` text NOT NULL,
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp(),
  `updatedAt` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `messages`
--

INSERT INTO `messages` (`id`, `id_reciever`, `id_sender`, `content`, `createdAt`, `updatedAt`) VALUES
(5, 2, 7, 'alo', '2023-11-03 16:10:33', '2023-11-03 16:10:33'),
(6, 7, 2, 'đây hưng', '2023-11-03 16:10:39', '2023-11-03 16:10:39'),
(7, 2, 7, 'hưng đây', '2023-11-03 16:11:58', '2023-11-03 16:11:58'),
(8, 2, 7, 'hưng gà đây', '2023-11-03 16:12:02', '2023-11-03 16:12:02'),
(9, 7, 2, 'oke cu ', '2023-11-03 16:12:07', '2023-11-03 16:12:07'),
(10, 2, 5, 'hello hưng đây ', '2023-11-04 03:01:12', '2023-11-04 03:01:12'),
(11, 5, 2, 'alo alo', '2023-11-04 04:30:08', '2023-11-04 04:30:08'),
(12, 5, 2, 'alo alo', '2023-11-04 04:30:12', '2023-11-04 04:30:12');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `id_account` int(11) NOT NULL,
  `id_status` int(11) NOT NULL,
  `isService` int(1) NOT NULL,
  `order_address` varchar(255) DEFAULT NULL,
  `order_phoneNumber` varchar(255) DEFAULT NULL,
  `totalPrice` int(11) DEFAULT NULL,
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp(),
  `updatedAt` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `id_account`, `id_status`, `isService`, `order_address`, `order_phoneNumber`, `totalPrice`, `createdAt`, `updatedAt`) VALUES
(23, 2, 4, 0, 'Xuan Thieu 14 street', '0962240446', NULL, '2024-05-21 02:35:34', '2024-05-21 03:15:16'),
(25, 2, 1, 1, NULL, '0909', 20, '2024-05-23 03:31:43', '2024-05-23 03:31:43'),
(26, 2, 5, 1, NULL, '0909', 20, '2024-05-23 03:32:27', '2024-05-23 03:53:29'),
(27, 2, 1, 1, NULL, '0909', 20, '2024-05-23 09:16:14', '2024-05-23 09:16:14'),
(28, 2, 1, 1, NULL, '', 12, '2024-05-24 08:48:41', '2024-05-24 08:48:41'),
(29, 2, 1, 1, NULL, '0962232323', 12, '2024-05-24 09:07:48', '2024-05-24 09:07:48'),
(30, 2, 1, 1, NULL, '0962232323', 12, '2024-05-24 09:11:50', '2024-05-24 09:11:50'),
(31, 2, 1, 0, 'Xuan Thieu 14 street', '0962240446', 15, '2024-05-25 02:50:47', '2024-05-25 02:50:47'),
(32, 2, 1, 0, 'Xuan Thieu 14 street', '0962240446', 15000, '2024-05-25 02:51:56', '2024-05-25 02:53:09');

-- --------------------------------------------------------

--
-- Table structure for table `order_items`
--

CREATE TABLE `order_items` (
  `id` int(11) NOT NULL,
  `id_product` int(11) NOT NULL,
  `id_order` int(11) NOT NULL,
  `quantity` int(11) DEFAULT NULL,
  `fixed_price` int(11) DEFAULT NULL,
  `isRate` int(11) NOT NULL,
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp(),
  `updatedAt` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `order_items`
--

INSERT INTO `order_items` (`id`, `id_product`, `id_order`, `quantity`, `fixed_price`, `isRate`, `createdAt`, `updatedAt`) VALUES
(23, 1424, 23, 2, 23, 0, '2024-05-23 08:36:22', '2024-05-23 08:36:22'),
(24, 1424, 31, 1, 15, 0, '2024-05-25 02:50:47', '2024-05-25 02:50:47'),
(25, 1424, 32, 1, 15000, 0, '2024-05-25 02:51:56', '2024-05-25 02:51:56');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `id_breed` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `amount` int(11) NOT NULL,
  `soldProductNum` int(11) NOT NULL,
  `proceeds` int(11) NOT NULL,
  `price` int(11) NOT NULL,
  `import_price` int(11) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp(),
  `updatedAt` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `id_breed`, `name`, `amount`, `soldProductNum`, `proceeds`, `price`, `import_price`, `description`, `createdAt`, `updatedAt`) VALUES
(1424, 9, 'con chó', 12, -2, -44985, 15000, 12, 'the sun can\'t shine without darkness', '2024-05-09 05:28:19', '2024-05-25 03:05:42');

-- --------------------------------------------------------

--
-- Table structure for table `ratings`
--

CREATE TABLE `ratings` (
  `id` int(11) NOT NULL,
  `id_product` int(11) DEFAULT NULL,
  `id_service` int(11) DEFAULT NULL,
  `id_account` int(11) NOT NULL,
  `star` int(11) DEFAULT NULL,
  `comment` varchar(255) DEFAULT NULL,
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp(),
  `updatedAt` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `ratings`
--

INSERT INTO `ratings` (`id`, `id_product`, `id_service`, `id_account`, `star`, `comment`, `createdAt`, `updatedAt`) VALUES
(20, 1424, NULL, 2, 4, 'quá là ghê', '2024-05-21 03:21:48', '2024-05-21 03:26:55'),
(21, NULL, 5, 2, 5, 'sản phẩm chất lượng cao', '2024-05-21 07:09:53', '2024-05-21 07:09:53'),
(23, NULL, 4, 2, 5, 'mát xa phê ', '2024-05-21 07:12:14', '2024-05-21 07:12:14'),
(25, NULL, 4, 2, 5, 'mát xa phê ', '2024-05-21 08:01:27', '2024-05-21 08:01:27'),
(26, NULL, 4, 2, 5, 'mát xa phê ', '2024-05-21 08:01:29', '2024-05-21 08:01:29');

-- --------------------------------------------------------

--
-- Table structure for table `refreshtokens`
--

CREATE TABLE `refreshtokens` (
  `id` int(11) NOT NULL,
  `refreshToken` varchar(255) DEFAULT NULL,
  `exp` varchar(255) DEFAULT NULL,
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp(),
  `updatedAt` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `refreshtokens`
--

INSERT INTO `refreshtokens` (`id`, `refreshToken`, `exp`, `createdAt`, `updatedAt`) VALUES
(1, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySUQiOjIsInJvbGUiOiJjdXN0b21lciIsImlhdCI6MTY5ODM5NjcwMiwiZXhwIjoxNjk4NTY5NTAyfQ.1PDm1bSNTNXloXs_SVk4nZOZiTKryiYNQ_QrqCLx7m8', '1698569502', '2023-10-27 08:51:42', '2023-10-27 08:51:42'),
(2, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySUQiOjIsInJvbGUiOiJjdXN0b21lciIsImlhdCI6MTY5ODQwMzkxOCwiZXhwIjoxNjk4NTc2NzE4fQ.FjR8pDTMN8TVm0JXMDCzUgVMEJhg29bpUh9xd_VkOtI', '1698576718', '2023-10-27 10:51:58', '2023-10-27 10:51:58'),
(3, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySUQiOjIsInJvbGUiOiJjdXN0b21lciIsImlhdCI6MTY5ODQwNjQ4MSwiZXhwIjoxNjk4NTc5MjgxfQ.VmhW5ENpZt7NxCLCAKFDn1XSLR7Jofw67iFByW4E_Qw', '1698579281', '2023-10-27 11:34:41', '2023-10-27 11:34:41'),
(4, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySUQiOjIsInJvbGUiOiJjdXN0b21lciIsImlhdCI6MTY5ODQyMDk5NSwiZXhwIjoxNjk4NTkzNzk1fQ.pG0zcgwhg3D_odm0VOszE5drx9SL84XrgCrKM0Pw5jU', '1698593795', '2023-10-27 15:36:35', '2023-10-27 15:36:35'),
(5, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySUQiOjIsInJvbGUiOiJjdXN0b21lciIsImlhdCI6MTY5ODQ1NzM1NSwiZXhwIjoxNjk4NjMwMTU1fQ.KV05fKg-qdHY4FxbJ1VEcv857RvaL1Mofm7tJgBZIHQ', '1698630155', '2023-10-28 01:42:35', '2023-10-28 01:42:35'),
(6, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySUQiOjIsInJvbGUiOiJjdXN0b21lciIsImlhdCI6MTY5ODQ2OTkxNCwiZXhwIjoxNjk4NjQyNzE0fQ.-GZei1_-0o-7TG8qQUBMqulh7PwS9Y3m_ai3OFrrIlw', '1698642714', '2023-10-28 05:11:54', '2023-10-28 05:11:54'),
(7, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySUQiOjIsInJvbGUiOiJjdXN0b21lciIsImlhdCI6MTY5ODY2NTQ0MCwiZXhwIjoxNjk4ODM4MjQwfQ.kO1lZXvBOi_AS5VZC0KjgpXCBftqJcAl4cCqHqW8RrA', '1698838240', '2023-10-30 11:30:40', '2023-10-30 11:30:40'),
(8, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySUQiOjIsInJvbGUiOiJjdXN0b21lciIsImlhdCI6MTY5ODgwMDYzMSwiZXhwIjoxNjk4OTczNDMxfQ.AI63vRWKq-4khWbLDYprx0secz9lUn0EOBdLIttzICg', '1698973431', '2023-11-01 01:03:51', '2023-11-01 01:03:51'),
(9, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySUQiOjIsInJvbGUiOiJjdXN0b21lciIsImlhdCI6MTY5ODg0OTA4OSwiZXhwIjoxNjk5MDIxODg5fQ.XVer_-UHNvYjZk3Jn6BYByXELhQ9h7NPxpyUWJx7080', '1699021889', '2023-11-01 14:31:29', '2023-11-01 14:31:29'),
(10, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySUQiOjIsInJvbGUiOiJjdXN0b21lciIsImlhdCI6MTY5ODk3NDM1NywiZXhwIjoxNjk5MTQ3MTU3fQ.pPeNb5rSmR2DDuZbjktsIJEpgDdGTyPwBL1ZMug1z6U', '1699147157', '2023-11-03 01:19:17', '2023-11-03 01:19:17'),
(11, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySUQiOjIsInJvbGUiOiJjdXN0b21lciIsImlhdCI6MTY5ODk3ODEzNSwiZXhwIjoxNjk5MTUwOTM1fQ.8vDMzmPm73Uk6zypsVNxFc7wfH_sRt6Pmu9X61mBQug', '1699150935', '2023-11-03 02:22:15', '2023-11-03 02:22:15'),
(12, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySUQiOjIsInJvbGUiOiJjdXN0b21lciIsImlhdCI6MTY5ODk5NDQ0MywiZXhwIjoxNjk5MTY3MjQzfQ.7I2Fl-XdG5lPMkOiIrGjBopJ7jiPcmYcg098Riv7u0w', '1699167243', '2023-11-03 06:54:03', '2023-11-03 06:54:03'),
(13, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySUQiOjcsInJvbGUiOiJjdXN0b21lciIsImlhdCI6MTY5ODk5NDg1MiwiZXhwIjoxNjk5MTY3NjUyfQ.oBBdforJ3ziTDqqkAiHoKCLg4eYebYdI_b4caW5Sn7g', '1699167652', '2023-11-03 07:00:52', '2023-11-03 07:00:52'),
(14, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySUQiOjcsInJvbGUiOiJjdXN0b21lciIsImlhdCI6MTY5OTAwMDMzMiwiZXhwIjoxNjk5MTczMTMyfQ.4EjCyTSazMNfH4_9R-P7kv6maPh6T9KDOogQd1L2PH8', '1699173132', '2023-11-03 08:32:12', '2023-11-03 08:32:12'),
(15, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySUQiOjIsInJvbGUiOiJjdXN0b21lciIsImlhdCI6MTY5OTAwMDM1OSwiZXhwIjoxNjk5MTczMTU5fQ.XHcmCvheQBO3p8Xho4xCs0ii7XLS0GW5MqtK2dBiEb4', '1699173159', '2023-11-03 08:32:39', '2023-11-03 08:32:39'),
(16, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySUQiOjIsInJvbGUiOiJjdXN0b21lciIsImlhdCI6MTY5OTAxMDM5MiwiZXhwIjoxNjk5MTgzMTkyfQ.QPIO8f6maKsWYUTgDj9sqPXN_ec-BU0AV6a9KZKmdsY', '1699183192', '2023-11-03 11:19:52', '2023-11-03 11:19:52'),
(17, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySUQiOjcsInJvbGUiOiJjdXN0b21lciIsImlhdCI6MTY5OTAxMDQxMCwiZXhwIjoxNjk5MTgzMjEwfQ.UaZQpLSTRa8hddD99e_r-jI1VouOVOotWVWgr4NdMT4', '1699183210', '2023-11-03 11:20:10', '2023-11-03 11:20:10'),
(18, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySUQiOjcsInJvbGUiOiJjdXN0b21lciIsImlhdCI6MTY5OTAxNDAyOSwiZXhwIjoxNjk5MTg2ODI5fQ.YDCKr5DiKVaKgUqNcynVo3n0tYBa_x0ADVtVUytoA7k', '1699186829', '2023-11-03 12:20:29', '2023-11-03 12:20:29'),
(19, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySUQiOjIsInJvbGUiOiJjdXN0b21lciIsImlhdCI6MTY5OTAxNDA1MSwiZXhwIjoxNjk5MTg2ODUxfQ.jR_00kFB0GvELaKSngYXqKayHBJfKPUuoPo1pH7MFq0', '1699186851', '2023-11-03 12:20:51', '2023-11-03 12:20:51'),
(20, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySUQiOjcsInJvbGUiOiJjdXN0b21lciIsImlhdCI6MTY5OTAxNjg0MiwiZXhwIjoxNjk5MTg5NjQyfQ.-fMlIgQvw3EiqBT8h6XeUywttzWcbEtpLRJ23r6s3uo', '1699189642', '2023-11-03 13:07:22', '2023-11-03 13:07:22'),
(21, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySUQiOjcsInJvbGUiOiJjdXN0b21lciIsImlhdCI6MTY5OTAyNzU3MiwiZXhwIjoxNjk5MjAwMzcyfQ.TbDFB3SHlz4EBhqnztslZj03yTKgsw7VIyjYBf9l4z4', '1699200372', '2023-11-03 16:06:12', '2023-11-03 16:06:12'),
(22, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySUQiOjIsInJvbGUiOiJjdXN0b21lciIsImlhdCI6MTY5OTAyNzYzNSwiZXhwIjoxNjk5MjAwNDM1fQ.HIpL6nJPIXTURSLxgQQKS1oV2mhiu0RnM8gxhWAT3V0', '1699200435', '2023-11-03 16:07:15', '2023-11-03 16:07:15'),
(23, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySUQiOjIsInJvbGUiOiJjdXN0b21lciIsImlhdCI6MTY5OTAyOTE4OSwiZXhwIjoxNjk5MjAxOTg5fQ.nB20GF6x2YAFVVywfwcCXBMgVbYxyuZIW5xCwyVkYuw', '1699201989', '2023-11-03 16:33:09', '2023-11-03 16:33:09'),
(24, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySUQiOjIsInJvbGUiOiJjdXN0b21lciIsImlhdCI6MTY5OTA2NjIyNywiZXhwIjoxNjk5MjM5MDI3fQ.EoTO1xQMzjp2ei2CxGbNKGV43nHzKoGXbTePuEhbhFU', '1699239027', '2023-11-04 02:50:27', '2023-11-04 02:50:27'),
(25, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySUQiOjIsInJvbGUiOiJjdXN0b21lciIsImlhdCI6MTY5OTA3MTczMiwiZXhwIjoxNjk5MjQ0NTMyfQ.jUUBdkOXr0OZ7-CrIJyqDypR5vhDto76OgpnuKlR8k4', '1699244532', '2023-11-04 04:22:12', '2023-11-04 04:22:12'),
(26, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySUQiOjIsInJvbGUiOiJjdXN0b21lciIsImlhdCI6MTY5OTYwODU2MywiZXhwIjoxNjk5NzgxMzYzfQ.Rxu0Qo4ZN2RXCrR7VTxXJl_Yjliw5td2nh7NSdHmsUI', '1699781363', '2023-11-10 09:29:23', '2023-11-10 09:29:23'),
(27, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySUQiOjIsInJvbGUiOiJjdXN0b21lciIsImlhdCI6MTcwMDA1NTc5OCwiZXhwIjoxNzAwMjI4NTk4fQ.OB5yQpkUFvnIyao5Yfv-SAK0EaDnKxywTUDKAUkBhvo', '1700228598', '2023-11-15 13:43:18', '2023-11-15 13:43:18'),
(28, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySUQiOjIsInJvbGUiOiJjdXN0b21lciIsImlhdCI6MTcwMDEwNjEwOCwiZXhwIjoxNzAwMjc4OTA4fQ.7ucg3u-7zHZOSjwZJc4xDTFEeEKGyABOJgUM7IWxsVk', '1700278908', '2023-11-16 03:41:48', '2023-11-16 03:41:48'),
(29, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySUQiOjIsInJvbGUiOiJjdXN0b21lciIsImlhdCI6MTcwMDExNjEwNCwiZXhwIjoxNzAwMjg4OTA0fQ.XD-MttUEhhPAuzLaPM-B1v4yx149yWzRC8lOU1rLirc', '1700288904', '2023-11-16 06:28:24', '2023-11-16 06:28:24'),
(30, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySUQiOjIsInJvbGUiOiJhZG1pbiIsImlhdCI6MTcwMDExNjM0MCwiZXhwIjoxNzAwMjg5MTQwfQ.WJPMuhbUFbloDaqrbTUUtoqqd1hEff4jItczGzaJIy8', '1700289140', '2023-11-16 06:32:20', '2023-11-16 06:32:20'),
(31, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySUQiOjIsInJvbGUiOiJhZG1pbiIsImlhdCI6MTcwMDExNjU0MywiZXhwIjoxNzAwMjg5MzQzfQ.Z2by7eYFBT6MIIOQ3-nOOKHVtOa9JZpynoR3LsV2RcU', '1700289343', '2023-11-16 06:35:43', '2023-11-16 06:35:43'),
(32, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySUQiOjIsInJvbGUiOiJhZG1pbiIsImlhdCI6MTcwMDM2MDk5NywiZXhwIjoxNzAwNTMzNzk3fQ.B4xbkC-BVR04r3K7itkcpg2pKiEYVDjHNGUo-_a1U44', '1700533797', '2023-11-19 02:29:57', '2023-11-19 02:29:57'),
(33, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySUQiOjIsInJvbGUiOiJhZG1pbiIsImlhdCI6MTcwMDM2NjI3MiwiZXhwIjoxNzAwNTM5MDcyfQ.UhcDAxbE2dQNyenTSyctDyu19k7JR3BBBQ6jjgoDG1k', '1700539072', '2023-11-19 03:57:52', '2023-11-19 03:57:52'),
(34, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySUQiOjIsInJvbGUiOiJhZG1pbiIsImlhdCI6MTcwMDM3MDY1NywiZXhwIjoxNzAwNTQzNDU3fQ.ej4q-UzBnkxvnkOq_Fl6N-Wc3CbvHkGLJpiQyqEUsPQ', '1700543457', '2023-11-19 05:10:57', '2023-11-19 05:10:57'),
(35, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySUQiOjIsInJvbGUiOiJhZG1pbiIsImlhdCI6MTcwMDU3MTYxMSwiZXhwIjoxNzAwNzQ0NDExfQ.6w4mHIGAhj5ygRIMx802i5hEn1D6wArkIDci5PVMt4Q', '1700744411', '2023-11-21 13:00:11', '2023-11-21 13:00:11'),
(36, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySUQiOjIsInJvbGUiOiJhZG1pbiIsImlhdCI6MTcwMDU4MDM0NCwiZXhwIjoxNzAwNzUzMTQ0fQ.r8B8PTbxABtPZW73yxS1B8GERm4vBits-Xd_NOG_iAc', '1700753144', '2023-11-21 15:25:44', '2023-11-21 15:25:44'),
(37, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySUQiOjcsInJvbGUiOiJjdXN0b21lciIsImlhdCI6MTcwMDU4MDM4NywiZXhwIjoxNzAwNzUzMTg3fQ.vzskHbOXa1XRAFcoh9K4_r-EhEnUTbWbQZpbi0HWLD0', '1700753187', '2023-11-21 15:26:27', '2023-11-21 15:26:27'),
(38, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySUQiOjIsInJvbGUiOiJhZG1pbiIsImlhdCI6MTcwMDU4MDg4NiwiZXhwIjoxNzAwNzUzNjg2fQ.J1W1kBYcuYRtci7dXTuC7QEaCMpE0pQzvj5WsNMb5EU', '1700753686', '2023-11-21 15:34:46', '2023-11-21 15:34:46'),
(39, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySUQiOjIsInJvbGUiOiJhZG1pbiIsImlhdCI6MTcwMDU4MTA5NiwiZXhwIjoxNzAwNzUzODk2fQ.EQACS3gwM0qmJNoa-Pl5-7ylMoVUTObtqg4DlXi7e2w', '1700753896', '2023-11-21 15:38:16', '2023-11-21 15:38:16'),
(40, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySUQiOjcsInJvbGUiOiJjdXN0b21lciIsImlhdCI6MTcwMDU4MzUxNywiZXhwIjoxNzAwNzU2MzE3fQ.WZhVEA2aq8Wj7f8nJNZ-BiXtT1mtKYAP3hnXQiHBSuE', '1700756317', '2023-11-21 16:18:37', '2023-11-21 16:18:37'),
(41, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySUQiOjIsInJvbGUiOiJhZG1pbiIsImlhdCI6MTcwMDY0Mjc4NiwiZXhwIjoxNzAwODE1NTg2fQ.PUw6ll08rDG9Bu8OGw4qpa6D9R9d8IoYJrvhJq2VK20', '1700815586', '2023-11-22 08:46:26', '2023-11-22 08:46:26'),
(42, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySUQiOjIsInJvbGUiOiJhZG1pbiIsImlhdCI6MTcwMDY2NTE1NiwiZXhwIjoxNzAwODM3OTU2fQ.nN-Hre2mFos7pjGAhWrFth4deHBiBKj7i5kwr7fcFEw', '1700837956', '2023-11-22 14:59:16', '2023-11-22 14:59:16'),
(43, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySUQiOjIsInJvbGUiOiJhZG1pbiIsImlhdCI6MTcwMDY2NTMyMSwiZXhwIjoxNzAwODM4MTIxfQ.YRQDn5kGq8HoSyxRnFyv061EL-BR3hMy6HcEUk5lvWM', '1700838121', '2023-11-22 15:02:01', '2023-11-22 15:02:01'),
(44, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySUQiOjIsInJvbGUiOiJhZG1pbiIsImlhdCI6MTcwMDY2Njg1NywiZXhwIjoxNzAwODM5NjU3fQ.Xtufe5wWaEzX9OI1vSDLp4kSdk07D0ep4cW7IInTA88', '1700839657', '2023-11-22 15:27:37', '2023-11-22 15:27:37'),
(45, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySUQiOjIsInJvbGUiOiJhZG1pbiIsImlhdCI6MTcwMDc5NTA3OSwiZXhwIjoxNzAwOTY3ODc5fQ.v7ULJDcBZaD62XviRa3lyuBn7rqcuy2x_fC_9e4KAss', '1700967879', '2023-11-24 03:04:39', '2023-11-24 03:04:39'),
(46, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySUQiOjIsInJvbGUiOiJhZG1pbiIsImlhdCI6MTcwMTM0MjAxNCwiZXhwIjoxNzAxNTE0ODE0fQ.9c0XscQYTCO_JWT1y62CbRTq9rmtLTi4X4L4sjhvyro', '1701514814', '2023-11-30 11:00:14', '2023-11-30 11:00:14'),
(47, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySUQiOjIsInJvbGUiOiJhZG1pbiIsImlhdCI6MTcwMTM0MjM0OCwiZXhwIjoxNzAxNTE1MTQ4fQ.ut8ZA1w51y8ObW9fI5KnAYLHC8StvVaPQpyLafI93YU', '1701515148', '2023-11-30 11:05:48', '2023-11-30 11:05:48'),
(48, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySUQiOjIsInJvbGUiOiJhZG1pbiIsImlhdCI6MTcwMTM0MjM2NiwiZXhwIjoxNzAxNTE1MTY2fQ.OMJpUlDI3fsTTD9PcexH9tCgMRXIyPZKSLHKCGvOM9A', '1701515166', '2023-11-30 11:06:06', '2023-11-30 11:06:06'),
(49, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySUQiOjIsInJvbGUiOiJhZG1pbiIsImlhdCI6MTcwMTM0MjM4MSwiZXhwIjoxNzAxNTE1MTgxfQ.EJP70xLaWw0zQw0qXR57dLRWFw50PZt7HRzN8iPIe3A', '1701515181', '2023-11-30 11:06:21', '2023-11-30 11:06:21'),
(50, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySUQiOjgsInJvbGUiOiJjdXN0b21lciIsImlhdCI6MTcwMTM0MjQ3OCwiZXhwIjoxNzAxNTE1Mjc4fQ.CgYo_Tm0FS9sQEBGHIhypFOZvN-Pbarr4gNiCA7lYM4', '1701515278', '2023-11-30 11:07:58', '2023-11-30 11:07:58'),
(51, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySUQiOjgsInJvbGUiOiJjdXN0b21lciIsImlhdCI6MTcwMTM0MjUxNiwiZXhwIjoxNzAxNTE1MzE2fQ.k6KkLfHJe3vLgNmbjgXi7MYuH778Cy-WprgXEt2W18I', '1701515316', '2023-11-30 11:08:36', '2023-11-30 11:08:36'),
(52, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySUQiOjgsInJvbGUiOiJjdXN0b21lciIsImlhdCI6MTcwMTM0MzAxMywiZXhwIjoxNzAxNTE1ODEzfQ.O0n_i4lRN5cL7kYwqSXz9uQkuVRw7c578XSqPVLIC0s', '1701515813', '2023-11-30 11:16:53', '2023-11-30 11:16:53'),
(53, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySUQiOjgsInJvbGUiOiJjdXN0b21lciIsImlhdCI6MTcwMTM0NzA2MywiZXhwIjoxNzAxNTE5ODYzfQ.LkouZkYq5AAdtTBJYuyCyhU4GYUoCuo2LjqGGDlcHuc', '1701519863', '2023-11-30 12:24:23', '2023-11-30 12:24:23'),
(54, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySUQiOjksInJvbGUiOiJjdXN0b21lciIsImlhdCI6MTcwMTM2MTQ3MywiZXhwIjoxNzAxNTM0MjczfQ.5wWXbb49YwHYrh4fQjZc5gki2jYkEeHJZaUCnSj4gbs', '1701534273', '2023-11-30 16:24:33', '2023-11-30 16:24:33'),
(55, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySUQiOjksInJvbGUiOiJjdXN0b21lciIsImlhdCI6MTcwMTQwNTkwOCwiZXhwIjoxNzAxNTc4NzA4fQ.p386zMjLVPqN4yq_nIw31xX-woLDoomuu371Y-1zTTc', '1701578708', '2023-12-01 04:45:08', '2023-12-01 04:45:08'),
(56, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySUQiOjksInJvbGUiOiJjdXN0b21lciIsImlhdCI6MTcwMTQwNTk4MCwiZXhwIjoxNzAxNTc4NzgwfQ.bBSPL37U-f0eNaBfPwwy2hwtnz9xbBY__NXhvawvp6U', '1701578780', '2023-12-01 04:46:20', '2023-12-01 04:46:20'),
(57, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySUQiOjksInJvbGUiOiJjdXN0b21lciIsImlhdCI6MTcwMTQwNTk5NSwiZXhwIjoxNzAxNTc4Nzk1fQ.PnyvPTaotXpcOiz94SU0fBWvxBfTh9tFHlNyhPIe8y4', '1701578795', '2023-12-01 04:46:35', '2023-12-01 04:46:35'),
(58, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySUQiOjksInJvbGUiOiJjdXN0b21lciIsImlhdCI6MTcwMTQwNzg5MCwiZXhwIjoxNzAxNTgwNjkwfQ.rz_84oenyUTqxHyA01FLXTzqK2HnHxumOhASC_yF99A', '1701580690', '2023-12-01 05:18:10', '2023-12-01 05:18:10'),
(59, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySUQiOjksInJvbGUiOiJjdXN0b21lciIsImlhdCI6MTcwMTQwNzg5OCwiZXhwIjoxNzAxNTgwNjk4fQ.YK66yBe3Trj8zEmEfGkg7wv-1Jq5rrqbg1JBkMFwp8g', '1701580698', '2023-12-01 05:18:18', '2023-12-01 05:18:18'),
(60, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySUQiOjgsInJvbGUiOiJjdXN0b21lciIsImlhdCI6MTcwMTQxMDkzNywiZXhwIjoxNzAxNTgzNzM3fQ.6O_s96RMrlmTiQ4J3oYDrwIIUVF41RCgSY8R-gfp2Lg', '1701583737', '2023-12-01 06:08:57', '2023-12-01 06:08:57'),
(61, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySUQiOjksInJvbGUiOiJjdXN0b21lciIsImlhdCI6MTcwMTQxMTIyMCwiZXhwIjoxNzAxNTg0MDIwfQ.a9pdcw3tBvR3lc0UThctawGKLdnkkM-X6SAalHrdpJQ', '1701584020', '2023-12-01 06:13:40', '2023-12-01 06:13:40'),
(62, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySUQiOjIsInJvbGUiOiJhZG1pbiIsImlhdCI6MTcwMTQxMTIyNSwiZXhwIjoxNzAxNTg0MDI1fQ.g4jA98PIYbr3oJxrUaHQ4nytr5AlwM0SfmX-AKCOj3A', '1701584025', '2023-12-01 06:13:45', '2023-12-01 06:13:45'),
(63, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySUQiOjcsInJvbGUiOiJjdXN0b21lciIsImlhdCI6MTcwMTQxMTI3NCwiZXhwIjoxNzAxNTg0MDc0fQ.lw5xl38HNQOEuTJzkGX_QrUjlmrmHHTqWzhZAjusTos', '1701584074', '2023-12-01 06:14:34', '2023-12-01 06:14:34'),
(64, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySUQiOjExLCJyb2xlIjoiY3VzdG9tZXIiLCJpYXQiOjE3MDE0MTE5MjIsImV4cCI6MTcwMTU4NDcyMn0.Ql148Zw9B8EBHWePdmnECpqwuGvs5NRlHCb5qXSaM3w', '1701584722', '2023-12-01 06:25:22', '2023-12-01 06:25:22'),
(65, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySUQiOjksInJvbGUiOiJjdXN0b21lciIsImlhdCI6MTcwMTQxMTkyNywiZXhwIjoxNzAxNTg0NzI3fQ.2-acR7IbNyq7LqSVNQaGPJMwVnxv_agMZtNGue1fzEk', '1701584727', '2023-12-01 06:25:27', '2023-12-01 06:25:27'),
(66, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySUQiOjksInJvbGUiOiJjdXN0b21lciIsImlhdCI6MTcwMTQxMjAxMCwiZXhwIjoxNzAxNTg0ODEwfQ.HeW6vF0mDwjC8QKK4RVE9-HfMFnTWfMeLORn1Idm1YM', '1701584810', '2023-12-01 06:26:50', '2023-12-01 06:26:50'),
(67, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySUQiOjIsInJvbGUiOiJhZG1pbiIsImlhdCI6MTcwMTQxMjAxNywiZXhwIjoxNzAxNTg0ODE3fQ.P9Il0FzSN1FfkYgPpkP0Eiu0E8MUQkT2XKMmcgJ30K4', '1701584817', '2023-12-01 06:26:57', '2023-12-01 06:26:57'),
(68, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySUQiOjksInJvbGUiOiJjdXN0b21lciIsImlhdCI6MTcwMTQxMjA3MiwiZXhwIjoxNzAxNTg0ODcyfQ.z_DxMeQnp5NScLvqQ2YGvFcb31kD6hoWRFvLbqmLZVU', '1701584872', '2023-12-01 06:27:52', '2023-12-01 06:27:52'),
(69, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySUQiOjIsInJvbGUiOiJhZG1pbiIsImlhdCI6MTcwMTQxMjA3OSwiZXhwIjoxNzAxNTg0ODc5fQ.vcpeH1kzcwn45AkPmAWgRlYX_zpEfgoqKwSFaj3q5OM', '1701584879', '2023-12-01 06:27:59', '2023-12-01 06:27:59'),
(70, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySUQiOjksInJvbGUiOiJjdXN0b21lciIsImlhdCI6MTcwMTQxMjUyOSwiZXhwIjoxNzAxNTg1MzI5fQ.tYgCrpqeCUVPeD_YVmQbVhv2ncVTDB0x5F-yIqzkWbM', '1701585329', '2023-12-01 06:35:29', '2023-12-01 06:35:29'),
(71, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySUQiOjIsInJvbGUiOiJhZG1pbiIsImlhdCI6MTcwMTQxMjUzNiwiZXhwIjoxNzAxNTg1MzM2fQ.5hbi-1hSEyuzp1kaSldXnIKVAmDAR_2OxKCrwqUvG0c', '1701585336', '2023-12-01 06:35:36', '2023-12-01 06:35:36'),
(72, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySUQiOjksInJvbGUiOiJjdXN0b21lciIsImlhdCI6MTcwMTQyMjQ1NCwiZXhwIjoxNzAxNTk1MjU0fQ.X8VRdPzmfFOEER_hYVp-Q2UhUo-JzS_tFA-hkoJApD0', '1701595254', '2023-12-01 09:20:54', '2023-12-01 09:20:54'),
(73, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySUQiOjIsInJvbGUiOiJhZG1pbiIsImlhdCI6MTcwMTQyMjQ2MiwiZXhwIjoxNzAxNTk1MjYyfQ.YiRN7ahln6ifKCEMrwK9u7kDxOopnypFxSiL76cmxDM', '1701595262', '2023-12-01 09:21:02', '2023-12-01 09:21:02'),
(74, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySUQiOjIsInJvbGUiOiJhZG1pbiIsImlhdCI6MTcwMTgzMDk5MCwiZXhwIjoxNzAyMDAzNzkwfQ.c16BRikY154RxZvYmgOqk1gmiyQ5SAmYwpicHuNwe5U', '1702003790', '2023-12-06 02:49:50', '2023-12-06 02:49:50'),
(75, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySUQiOjIsInJvbGUiOiJhZG1pbiIsImlhdCI6MTcwMTgzNDc1OCwiZXhwIjoxNzAyMDA3NTU4fQ.eMJbDhnxsjZH2ycOzvQFU1i5GtIGxk2dSbxpwqKFKBU', '1702007558', '2023-12-06 03:52:38', '2023-12-06 03:52:38'),
(76, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySUQiOjIsInJvbGUiOiJhZG1pbiIsImlhdCI6MTcwMTg1ODk2NSwiZXhwIjoxNzAyMDMxNzY1fQ.4O1E0hjHQVnYjfSWBzaYG75zEO-7qkKRkHLl0xSXp4Y', '1702031765', '2023-12-06 10:36:05', '2023-12-06 10:36:05'),
(77, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySUQiOjIsInJvbGUiOiJhZG1pbiIsImlhdCI6MTcwMTkyMDQ1OCwiZXhwIjoxNzAyMDkzMjU4fQ.ai4hEboqu-9wjPg1n-6jQH5fVrhX_sXz3yBvklQVW8s', '1702093258', '2023-12-07 03:40:58', '2023-12-07 03:40:58'),
(78, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySUQiOjIsInJvbGUiOiJhZG1pbiIsImlhdCI6MTcwMjAyNDk5NSwiZXhwIjoxNzAyMTk3Nzk1fQ.4839e2kt8XIWiFj3w7l-0XIgX1U1PquhICX6jrP25Ps', '1702197795', '2023-12-08 08:43:15', '2023-12-08 08:43:15'),
(79, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySUQiOjIsInJvbGUiOiJhZG1pbiIsImlhdCI6MTcwMjAyNjY4NiwiZXhwIjoxNzAyMTk5NDg2fQ.GLq4mSZJyjPdy6yntFznW5Py7Bbe6rEIXdn_ks1GmnM', '1702199486', '2023-12-08 09:11:26', '2023-12-08 09:11:26'),
(80, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySUQiOjIsInJvbGUiOiJhZG1pbiIsImlhdCI6MTcwMjAyNzAwNSwiZXhwIjoxNzAyMTk5ODA1fQ.1ldFurd3EUjyZ43z5xNpcp8_G2NNgrRZPWmz4AY6t94', '1702199805', '2023-12-08 09:16:45', '2023-12-08 09:16:45'),
(81, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySUQiOjEzLCJyb2xlIjoiY3VzdG9tZXIiLCJpYXQiOjE3MDIwMjc5NjUsImV4cCI6MTcwMjIwMDc2NX0.jEhcbLVfwJ7PrS-wbgmXA9zGR1BC7V_Gk3RdpFbs0uE', '1702200765', '2023-12-08 09:32:45', '2023-12-08 09:32:45'),
(82, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySUQiOjIsInJvbGUiOiJhZG1pbiIsImlhdCI6MTcwMjAzMTk4NywiZXhwIjoxNzAyMjA0Nzg3fQ.EvDKWPyYaJ-t9xvQ4nb2c_N4ecr0XE1pA-xuypqaxgY', '1702204787', '2023-12-08 10:39:47', '2023-12-08 10:39:47'),
(83, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySUQiOjEzLCJyb2xlIjoiY3VzdG9tZXIiLCJpYXQiOjE3MDIwMzIxMzUsImV4cCI6MTcwMjIwNDkzNX0.WUxoxz_1CgLkPKNJETRwBZTz5B_T4rU4x1IjiQGXShc', '1702204935', '2023-12-08 10:42:15', '2023-12-08 10:42:15'),
(84, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySUQiOjEzLCJyb2xlIjoiY3VzdG9tZXIiLCJpYXQiOjE3MDIwMzI2NjcsImV4cCI6MTcwMjIwNTQ2N30.RTQszdWwYAEKp1032whl4_golLkMHjcWx_MdBRAafLM', '1702205467', '2023-12-08 10:51:07', '2023-12-08 10:51:07'),
(85, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySUQiOjIsInJvbGUiOiJhZG1pbiIsImlhdCI6MTcwMjAzNDA5MiwiZXhwIjoxNzAyMjA2ODkyfQ.nfqq4eDsUuHDOHIM3tXfUc9EHM3h6HpApwZeGl_O0Vs', '1702206892', '2023-12-08 11:14:52', '2023-12-08 11:14:52'),
(86, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySUQiOjIsInJvbGUiOiJhZG1pbiIsImlhdCI6MTcxNTE4NDMxMCwiZXhwIjoxNzE1MzU3MTEwfQ.98Dq1bLxqgD5SFjc3U2KgkmJ-gnS9o9FkP7p5dJmkRE', '1715357110', '2024-05-08 16:05:10', '2024-05-08 16:05:10'),
(87, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySUQiOjIsInJvbGUiOiJhZG1pbiIsImlhdCI6MTcxNTIyNzU4NCwiZXhwIjoxNzE1NDAwMzg0fQ.wN9DyiX7HZPWv0oX6mS6YzINDZ62N1rgDIQwwYdlbqU', '1715400384', '2024-05-09 04:06:24', '2024-05-09 04:06:24'),
(88, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySUQiOjIsInJvbGUiOiJhZG1pbiIsImlhdCI6MTcxNTIzMjQzMSwiZXhwIjoxNzE1NDA1MjMxfQ.6PtKDbdZFCkbuBhhesBmtmtVx3pkiYvH1-__xd7kgD0', '1715405231', '2024-05-09 05:27:11', '2024-05-09 05:27:11'),
(89, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySUQiOjIsInJvbGUiOiJhZG1pbiIsImlhdCI6MTcxNTIzMzI2MSwiZXhwIjoxNzE1NDA2MDYxfQ.p6zRT2_5AdAQWAVQ08EZlT-PLcMcYRJv8XL9zXNF6vQ', '1715406061', '2024-05-09 05:41:01', '2024-05-09 05:41:01'),
(90, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySUQiOjIsInJvbGUiOiJhZG1pbiIsImlhdCI6MTcxNTIzNzgzNSwiZXhwIjoxNzE1NDEwNjM1fQ.NcFh_9M66P86hgdmKCKcnHaYwr81kdyHs27XEH-izvc', '1715410635', '2024-05-09 06:57:15', '2024-05-09 06:57:15'),
(91, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySUQiOjIsInJvbGUiOiJhZG1pbiIsImlhdCI6MTcxNTIzODU4NSwiZXhwIjoxNzE1NDExMzg1fQ.te3TDhQ3Y09QuHjYICHbZ9qIyBPe-hl1gMCZKAcj8sM', '1715411385', '2024-05-09 07:09:45', '2024-05-09 07:09:45'),
(92, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySUQiOjIsInJvbGUiOiJhZG1pbiIsImlhdCI6MTcxNTI0NjA1NywiZXhwIjoxNzE1NDE4ODU3fQ.xKGhL6onXSEfzrIvsDBylAdiuA95i-SorAXq2q6_dfM', '1715418857', '2024-05-09 09:14:17', '2024-05-09 09:14:17'),
(93, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySUQiOjIsInJvbGUiOiJhZG1pbiIsImlhdCI6MTcxNjI1ODU0NywiZXhwIjoxNzE2NDMxMzQ3fQ.4j5Uu9a2E_rsxnI-n3itO5Hetw2qQJA9tUQ7m6gtKvY', '1716431347', '2024-05-21 02:29:07', '2024-05-21 02:29:07'),
(94, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySUQiOjIsInJvbGUiOiJhZG1pbiIsImlhdCI6MTcxNjI3MzU0MSwiZXhwIjoxNzE2NDQ2MzQxfQ._icBGX9fNkh8XYvYD5SbAQHHpKkfU2hyTaaQr3DWLfQ', '1716446341', '2024-05-21 06:39:01', '2024-05-21 06:39:01'),
(95, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySUQiOjIsInJvbGUiOiJhZG1pbiIsImlhdCI6MTcxNjI3ODQ2OSwiZXhwIjoxNzE2NDUxMjY5fQ.cYoLwLERO5_Z2p3t49wtWBkv7-b-O-asSI3ZNocOMeg', '1716451269', '2024-05-21 08:01:09', '2024-05-21 08:01:09'),
(96, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySUQiOjIsInJvbGUiOiJhZG1pbiIsImlhdCI6MTcxNjM2MjQzMCwiZXhwIjoxNzE2NTM1MjMwfQ.3NKgiZ1oT343ZZ2oaoumEGnjH_8KUgdgPV6LhxXDC7Y', '1716535230', '2024-05-22 07:20:30', '2024-05-22 07:20:30'),
(97, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySUQiOjIsInJvbGUiOiJhZG1pbiIsImlhdCI6MTcxNjQzNDMzNiwiZXhwIjoxNzE2NjA3MTM2fQ.LcmxokA9jaGAVhMPmPQ8fRKeMhes1BBbtLduzCBYZLo', '1716607136', '2024-05-23 03:18:56', '2024-05-23 03:18:56'),
(98, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySUQiOjIsInJvbGUiOiJhZG1pbiIsImlhdCI6MTcxNjQzNDM2MiwiZXhwIjoxNzE2NjA3MTYyfQ.TlUnNhit4HCrL12AlYlOn_mhHCYOjZ5Gi2utr8SlT_s', '1716607162', '2024-05-23 03:19:22', '2024-05-23 03:19:22'),
(99, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySUQiOjIsInJvbGUiOiJhZG1pbiIsImlhdCI6MTcxNjQ0NjM2MSwiZXhwIjoxNzE2NjE5MTYxfQ.2Gkivh_MtQKJHJHRjvxXr4dhBikYDywa9l3-AtPcfas', '1716619161', '2024-05-23 06:39:21', '2024-05-23 06:39:21'),
(100, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySUQiOjIsInJvbGUiOiJhZG1pbiIsImlhdCI6MTcxNjQ1MzMwOSwiZXhwIjoxNzE2NjI2MTA5fQ.galHpdltcm_CnnZNSUTs2SxEjwxdGl-QkhTte6fczPs', '1716626109', '2024-05-23 08:35:09', '2024-05-23 08:35:09'),
(101, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySUQiOjIsInJvbGUiOiJhZG1pbiIsImlhdCI6MTcxNjQ1NTczOSwiZXhwIjoxNzE2NjI4NTM5fQ._tjX-4s6LVxgfwmw5MCRuM1HyTvxNWvgaVlpYxf0VV0', '1716628539', '2024-05-23 09:15:39', '2024-05-23 09:15:39'),
(102, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySUQiOjIsInJvbGUiOiJhZG1pbiIsImlhdCI6MTcxNjU0MDE4MCwiZXhwIjoxNzE2NzEyOTgwfQ.9kBkXpmsc4RlBIUZxy8DyjYQPDwEstPYRTNQu-MC96A', '1716712980', '2024-05-24 08:43:00', '2024-05-24 08:43:00'),
(103, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySUQiOjIsInJvbGUiOiJhZG1pbiIsImlhdCI6MTcxNjU0NTczMiwiZXhwIjoxNzE2NzE4NTMyfQ.DrY3Q_50n8V8AYS1G5gLFhRW6wY3-Xv8cn9-d4mNwgU', '1716718532', '2024-05-24 10:15:32', '2024-05-24 10:15:32'),
(104, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySUQiOjIsInJvbGUiOiJhZG1pbiIsImlhdCI6MTcxNjYwMzYzNywiZXhwIjoxNzE2Nzc2NDM3fQ.0LDshBIPMqvShCi5j9ZbIWpZIu8HaM4FpUcS-E6zVSg', '1716776437', '2024-05-25 02:20:37', '2024-05-25 02:20:37');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` int(11) NOT NULL,
  `roleName` varchar(255) DEFAULT NULL,
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp(),
  `updatedAt` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `roleName`, `createdAt`, `updatedAt`) VALUES
(1, 'admin', '2023-10-27 08:51:25', '2023-10-27 08:51:25'),
(2, 'custommer', '2023-10-27 08:51:25', '2023-10-27 08:51:25');

-- --------------------------------------------------------

--
-- Table structure for table `sequelizemeta`
--

CREATE TABLE `sequelizemeta` (
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `sequelizemeta`
--

INSERT INTO `sequelizemeta` (`name`) VALUES
('acreate-role.js'),
('bcreate-account.js'),
('ccreate-brand.js'),
('dcreate-status.js'),
('ecreate-infor-user.js'),
('fcreate-category.js'),
('gcreate-message.js'),
('icreate-shoes.js'),
('jcreate-addressInfor.js'),
('jcreate-cart.js'),
('kcreate-order.js'),
('lcreate-cart-item.js'),
('mcreate-order-item.js'),
('ncreate-image.js'),
('ncreate-rating.js'),
('refreshToken-create.js');

-- --------------------------------------------------------

--
-- Table structure for table `services`
--

CREATE TABLE `services` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `image` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `price` int(11) NOT NULL,
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp(),
  `updatedAt` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `services`
--

INSERT INTO `services` (`id`, `name`, `image`, `description`, `price`, `createdAt`, `updatedAt`) VALUES
(4, 'massage', 'https://pbl6-shoesshop.s3.ap-southeast-1.amazonaws.com/224df7cc044964e582cf5e800.jpg', 'adssadada', 12, '2024-05-21 06:48:50', '2024-05-21 07:04:24'),
(5, 'dịch vụ massage chó ', 'https://pbl6-shoesshop.s3.ap-southeast-1.amazonaws.com/224df7cc044964e582cf5e801.jpg', 'xóc bình xăng con ', 20, '2024-05-21 07:08:19', '2024-05-21 07:08:19'),
(6, 'tắm cho chó', 'https://pbl6-shoesshop.s3.ap-southeast-1.amazonaws.com/ec0911b88ac3ba46ef3f51c00.jpg', 'brr brr brr ', 20, '2024-05-21 08:22:50', '2024-05-21 08:22:50');

-- --------------------------------------------------------

--
-- Table structure for table `statuses`
--

CREATE TABLE `statuses` (
  `id` int(11) NOT NULL,
  `status` varchar(255) DEFAULT NULL,
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp(),
  `updatedAt` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `statuses`
--

INSERT INTO `statuses` (`id`, `status`, `createdAt`, `updatedAt`) VALUES
(1, 'đang chờ', '2023-10-27 09:02:47', '2023-10-27 09:02:47'),
(2, 'đang chuẩn bị', '2023-10-27 09:03:17', '2023-10-27 09:03:17'),
(3, 'đang giao', '2023-10-27 09:03:17', '2023-10-27 09:03:17'),
(4, 'giao thành công', '2023-10-27 09:03:17', '2023-10-27 09:03:17'),
(5, 'đã hủy', '2023-10-27 09:03:17', '2023-10-27 09:03:17'),
(6, 'đã duyệt ', '2024-05-20 02:11:20', '2024-05-20 02:11:20');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `accounts`
--
ALTER TABLE `accounts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_role` (`id_role`);

--
-- Indexes for table `addressinfors`
--
ALTER TABLE `addressinfors`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_account` (`id_account`);

--
-- Indexes for table `appointments`
--
ALTER TABLE `appointments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_service` (`id_service`),
  ADD KEY `id_order` (`id_order`);

--
-- Indexes for table `breeds`
--
ALTER TABLE `breeds`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `carts`
--
ALTER TABLE `carts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_account` (`id_account`);

--
-- Indexes for table `cart_items`
--
ALTER TABLE `cart_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_cart` (`id_cart`),
  ADD KEY `id_size_item` (`id_product`);

--
-- Indexes for table `images`
--
ALTER TABLE `images`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_shoes` (`id_product`);

--
-- Indexes for table `inforusers`
--
ALTER TABLE `inforusers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_account` (`id_account`);

--
-- Indexes for table `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_reciever` (`id_reciever`),
  ADD KEY `id_sender` (`id_sender`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_account` (`id_account`),
  ADD KEY `id_status` (`id_status`);

--
-- Indexes for table `order_items`
--
ALTER TABLE `order_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_order` (`id_order`),
  ADD KEY `id_size_item` (`id_product`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_category` (`id_breed`);

--
-- Indexes for table `ratings`
--
ALTER TABLE `ratings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_shoes` (`id_product`),
  ADD KEY `id_account` (`id_account`),
  ADD KEY `id_service` (`id_service`);

--
-- Indexes for table `refreshtokens`
--
ALTER TABLE `refreshtokens`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sequelizemeta`
--
ALTER TABLE `sequelizemeta`
  ADD PRIMARY KEY (`name`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `services`
--
ALTER TABLE `services`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `statuses`
--
ALTER TABLE `statuses`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `accounts`
--
ALTER TABLE `accounts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `addressinfors`
--
ALTER TABLE `addressinfors`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `appointments`
--
ALTER TABLE `appointments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `breeds`
--
ALTER TABLE `breeds`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `carts`
--
ALTER TABLE `carts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `cart_items`
--
ALTER TABLE `cart_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `images`
--
ALTER TABLE `images`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1428;

--
-- AUTO_INCREMENT for table `inforusers`
--
ALTER TABLE `inforusers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `messages`
--
ALTER TABLE `messages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `order_items`
--
ALTER TABLE `order_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1425;

--
-- AUTO_INCREMENT for table `ratings`
--
ALTER TABLE `ratings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `refreshtokens`
--
ALTER TABLE `refreshtokens`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=105;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `services`
--
ALTER TABLE `services`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `statuses`
--
ALTER TABLE `statuses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `accounts`
--
ALTER TABLE `accounts`
  ADD CONSTRAINT `accounts_ibfk_1` FOREIGN KEY (`id_role`) REFERENCES `roles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `addressinfors`
--
ALTER TABLE `addressinfors`
  ADD CONSTRAINT `addressinfors_ibfk_1` FOREIGN KEY (`id_account`) REFERENCES `accounts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `appointments`
--
ALTER TABLE `appointments`
  ADD CONSTRAINT `appointments_ibfk_1` FOREIGN KEY (`id_service`) REFERENCES `services` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `appointments_ibfk_2` FOREIGN KEY (`id_order`) REFERENCES `orders` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `carts`
--
ALTER TABLE `carts`
  ADD CONSTRAINT `carts_ibfk_1` FOREIGN KEY (`id_account`) REFERENCES `accounts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `cart_items`
--
ALTER TABLE `cart_items`
  ADD CONSTRAINT `cart_items_ibfk_2` FOREIGN KEY (`id_cart`) REFERENCES `carts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `images`
--
ALTER TABLE `images`
  ADD CONSTRAINT `images_ibfk_1` FOREIGN KEY (`id_product`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `inforusers`
--
ALTER TABLE `inforusers`
  ADD CONSTRAINT `inforusers_ibfk_1` FOREIGN KEY (`id_account`) REFERENCES `accounts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `messages`
--
ALTER TABLE `messages`
  ADD CONSTRAINT `messages_ibfk_1` FOREIGN KEY (`id_reciever`) REFERENCES `accounts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `messages_ibfk_2` FOREIGN KEY (`id_sender`) REFERENCES `accounts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`id_account`) REFERENCES `accounts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`id_status`) REFERENCES `statuses` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `order_items`
--
ALTER TABLE `order_items`
  ADD CONSTRAINT `order_items_ibfk_2` FOREIGN KEY (`id_order`) REFERENCES `orders` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `order_items_ibfk_3` FOREIGN KEY (`id_product`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`id_breed`) REFERENCES `breeds` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `ratings`
--
ALTER TABLE `ratings`
  ADD CONSTRAINT `ratings_ibfk_1` FOREIGN KEY (`id_product`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `ratings_ibfk_2` FOREIGN KEY (`id_account`) REFERENCES `accounts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `ratings_ibfk_3` FOREIGN KEY (`id_service`) REFERENCES `services` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
