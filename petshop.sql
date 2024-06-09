-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 09, 2024 at 11:07 AM
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
(2, 'darknessclmm@gmail.com', 'cc2d80098f6cb0843e2b11315f3994c0a0fe05842a0a5e018d6b084566ee03cc', 1, 991, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySUQiOjIsInR5cGUiOiJmb3Jnb3RQYXNzd29yZFRva2VuIiwiaWF0IjoxNjk4ODI0NzM4LCJleHAiOjE2OTg5OTc1Mzh9.pMtZYtph38yr5GJdGBSFMhZ0fFUb5mgwz3EvImB14zs', '2023-10-27 08:51:32', '2024-06-07 00:35:15'),
(5, 'hothanhhungtran@gmail.com', 'cc2d80098f6cb0843e2b11315f3994c0a0fe05842a0a5e018d6b084566ee03cc', 2, 110, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySUQiOjUsInR5cGUiOiJmb3Jnb3RQYXNzd29yZFRva2VuIiwiaWF0IjoxNjk4ODI0NTExLCJleHAiOjE2OTg5OTczMTF9.kvCnD6GMZhhe5qVufCjY0Wri3QljsUYRwEkYF5ZiwSk', '2023-11-01 07:35:08', '2024-06-07 03:19:43'),
(6, 'hothanhhungtran1@gmail.com', 'cc2d80098f6cb0843e2b11315f3994c0a0fe05842a0a5e018d6b084566ee03cc', 2, NULL, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySUQiOjYsInR5cGUiOiJmb3Jnb3RQYXNzd29yZFRva2VuIiwiaWF0IjoxNjk4ODI0Mzk3LCJleHAiOjE2OTg5OTcxOTd9.L37kBCUkfexxYwHE1IB9GufnyrJi_lTZW_6hSIH4JvM', '2023-11-01 07:36:30', '2023-11-01 07:39:57'),
(7, 'darknessclmm1@gmail.com', 'cc2d80098f6cb0843e2b11315f3994c0a0fe05842a0a5e018d6b084566ee03cc', 2, 90, NULL, '2023-11-03 07:00:41', '2024-06-02 05:47:12'),
(8, 'manhddt2508@gmail.com', 'cc2d80098f6cb0843e2b11315f3994c0a0fe05842a0a5e018d6b084566ee03cc', 2, NULL, NULL, '2023-11-30 11:07:40', '2023-11-30 11:07:40'),
(9, 'manhddt111@gmail.com', 'cc2d80098f6cb0843e2b11315f3994c0a0fe05842a0a5e018d6b084566ee03cc', 2, NULL, NULL, '2023-11-30 16:23:49', '2023-11-30 16:23:49'),
(10, 'manhddt250811@gm1ail.com', 'cc2d80098f6cb0843e2b11315f3994c0a0fe05842a0a5e018d6b084566ee03cc', 2, NULL, NULL, '2023-12-01 06:18:18', '2023-12-01 06:18:18'),
(11, 'manhddt1234@gmail.com', 'cc2d80098f6cb0843e2b11315f3994c0a0fe05842a0a5e018d6b084566ee03cc', 2, NULL, NULL, '2023-12-01 06:24:14', '2023-12-01 06:24:14'),
(12, 'manhddt12345@gmail.com', 'cc2d80098f6cb0843e2b11315f3994c0a0fe05842a0a5e018d6b084566ee03cc', 2, NULL, NULL, '2023-12-01 09:20:26', '2023-12-01 09:20:26'),
(13, 'manhddt250802@gmail.com', '2c91440bfacd977e1a27d76d53e199521669b68a06c6e6e07edd17a952f978ff', 2, NULL, NULL, '2023-12-08 09:32:21', '2023-12-08 09:32:21'),
(14, 'HoTran@gmail.com', 'cc2d80098f6cb0843e2b11315f3994c0a0fe05842a0a5e018d6b084566ee03cc', 2, NULL, NULL, '2024-05-25 05:02:55', '2024-05-25 05:02:55'),
(15, 'HoTran1@gmail.com', 'cc2d80098f6cb0843e2b11315f3994c0a0fe05842a0a5e018d6b084566ee03cc', 2, 0, NULL, '2024-05-25 05:04:15', '2024-05-25 05:04:15');

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
  `isRate` int(11) DEFAULT NULL,
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp(),
  `updatedAt` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `appointments`
--

INSERT INTO `appointments` (`id`, `id_service`, `id_order`, `appointment_time`, `end_time`, `note`, `isRate`, `createdAt`, `updatedAt`) VALUES
(7, 4, 49, '2025-11-01 01:35:28', '2025-11-01 01:35:29', 'cắt tỉa cẩn thận', 0, '2024-06-05 06:56:29', '2024-06-05 06:56:29'),
(8, 5, 56, '2024-06-15 00:03:00', '2024-06-15 01:08:00', 'ok', 0, '2024-06-07 00:03:21', '2024-06-07 00:03:21');

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
(12, 13, '2023-12-08 09:32:21', '2023-12-08 09:32:21'),
(13, 14, '2024-05-25 05:02:55', '2024-05-25 05:02:55'),
(14, 15, '2024-05-25 05:04:16', '2024-05-25 05:04:16');

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

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `id` int(11) NOT NULL,
  `id_post` int(11) NOT NULL,
  `id_account` int(11) NOT NULL,
  `content` text NOT NULL,
  `createdAt` datetime NOT NULL DEFAULT current_timestamp(),
  `updatedAt` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `comments`
--

INSERT INTO `comments` (`id`, `id_post`, `id_account`, `content`, `createdAt`, `updatedAt`) VALUES
(1, 4, 2, 'bạn nên cho chó ăn bả ;v ', '2024-06-09 15:54:11', '2024-06-09 15:54:11');

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
(1427, 'https://pbl6-shoesshop.s3.ap-southeast-1.amazonaws.com/fdec53a622da7f0dd08227b04.jpg', 1424, '2024-05-09 05:39:07', '2024-05-09 05:39:07'),
(1428, 'https://pbl6-shoesshop.s3.ap-southeast-1.amazonaws.com/efd1194947d17f2d124196900.jpg', 1426, '2024-05-27 02:00:37', '2024-05-27 02:00:37');

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
(4, 5, 'hào thanh hưng', 'trần', '3111111111', 'https://pbl6-shoesshop.s3.ap-southeast-1.amazonaws.com/c5c0504f416ef2b22eba39600.jpg', '2023-11-01 07:35:08', '2024-06-07 03:21:16'),
(5, 6, 'hào thanh hưng', 'trần', '3111111111', NULL, '2023-11-01 07:36:30', '2023-11-01 07:36:30'),
(6, 7, 'Thanh', 'Hưng gà', '3111111111', 'https://pbl6-shoesshop.s3.ap-southeast-1.amazonaws.com/d5d65b52e1174eaef76b19d01.jpg', '2023-11-03 07:00:41', '2023-11-21 15:37:08'),
(7, 8, 'Duc Manh', 'Nguyen', '3111111111', NULL, '2023-11-30 11:07:41', '2023-11-30 11:07:41'),
(8, 9, 'Duc Manh', 'Nguyen', '0905897381', NULL, '2023-11-30 16:23:49', '2023-11-30 16:23:49'),
(9, 10, 'Duc Manh', 'Nguyen', '3111111111', NULL, '2023-12-01 06:18:18', '2023-12-01 06:18:18'),
(10, 11, 'Duc Manh', 'Nguyen', '0905897381', NULL, '2023-12-01 06:24:14', '2023-12-01 06:24:14'),
(11, 12, 'Duc Manh', 'Nguyen', '0905897381', NULL, '2023-12-01 09:20:26', '2023-12-01 09:20:26'),
(12, 13, 'Mạnh', 'Nguyễn', '0905897381', 'https://pbl6-shoesshop.s3.ap-southeast-1.amazonaws.com/804118f41351568757bf12d01.jpg', '2023-12-08 09:32:21', '2023-12-08 09:55:20'),
(13, 14, 'hào thanh hưng', 'trần', '3111111111', NULL, '2024-05-25 05:02:55', '2024-05-25 05:02:55'),
(14, 15, 'hào thanh hưng', 'trần', '3111111111', NULL, '2024-05-25 05:04:15', '2024-05-25 05:04:15');

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
(12, 5, 2, 'alo alo', '2023-11-04 04:30:12', '2023-11-04 04:30:12'),
(13, 2, 8, 'hello', '2024-06-06 08:23:35', '2024-06-06 08:23:35'),
(14, 2, 8, 'ako', '2024-06-06 08:24:14', '2024-06-06 08:24:14'),
(15, 2, 8, 'dádad', '2024-06-06 08:24:48', '2024-06-06 08:24:48'),
(16, 2, 8, ':v ', '2024-06-06 08:24:49', '2024-06-06 08:24:49'),
(17, 2, 8, 'giề ', '2024-06-06 08:24:51', '2024-06-06 08:24:51'),
(18, 2, 8, ';v ', '2024-06-06 08:24:52', '2024-06-06 08:24:52'),
(19, 2, 8, ';v ', '2024-06-06 08:24:53', '2024-06-06 08:24:53'),
(20, 2, 8, ';v', '2024-06-06 08:24:53', '2024-06-06 08:24:53'),
(21, 2, 8, ';v', '2024-06-06 08:24:54', '2024-06-06 08:24:54'),
(22, 8, 2, 'a', '2024-06-06 08:37:07', '2024-06-06 08:37:07'),
(23, 2, 8, 'giề ', '2024-06-06 08:37:11', '2024-06-06 08:37:11'),
(24, 8, 2, ';v', '2024-06-06 08:37:13', '2024-06-06 08:37:13'),
(25, 2, 8, 'đasdadsa', '2024-06-06 08:37:15', '2024-06-06 08:37:15'),
(26, 2, 8, 'dsadsda', '2024-06-06 08:44:37', '2024-06-06 08:44:37'),
(27, 8, 2, '......', '2024-06-06 08:44:40', '2024-06-06 08:44:40'),
(28, 2, 8, 'alo ', '2024-06-06 08:52:46', '2024-06-06 08:52:46'),
(29, 8, 2, 'adsdadads', '2024-06-06 08:52:50', '2024-06-06 08:52:50'),
(30, 8, 2, 'dsadsada', '2024-06-06 08:52:51', '2024-06-06 08:52:51'),
(31, 8, 2, 'f', '2024-06-06 08:52:57', '2024-06-06 08:52:57'),
(32, 2, 8, 'f', '2024-06-06 08:53:00', '2024-06-06 08:53:00'),
(33, 8, 2, '', '2024-06-06 08:53:12', '2024-06-06 08:53:12');

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` int(11) NOT NULL,
  `id_account` int(11) NOT NULL,
  `notify` text NOT NULL,
  `isRead` int(11) NOT NULL,
  `createdAt` datetime NOT NULL DEFAULT current_timestamp(),
  `updatedAt` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `notifications`
--

INSERT INTO `notifications` (`id`, `id_account`, `notify`, `isRead`, `createdAt`, `updatedAt`) VALUES
(1, 2, 'đơn hàng 65000 đồng với mã số 55 đang được chuẩn bị', 0, '2024-06-06 19:15:20', '2024-06-06 19:15:20'),
(2, 2, 'đơn hàng 65000 đồng với mã số 55 đang được giao', 0, '2024-06-06 19:15:39', '2024-06-06 19:15:39'),
(3, 2, 'đơn hàng 65000 đồng với mã số 55 đã được giao thành công', 0, '2024-06-06 19:15:47', '2024-06-06 19:15:47'),
(8, 5, 'đơn hàng 60000 đồng với mã số 57 đang được chuẩn bị', 0, '2024-06-07 07:14:45', '2024-06-07 07:14:45'),
(9, 2, 'đơn hàng 65000 đồng với mã số 54 đang được chuẩn bị', 0, '2024-06-07 07:14:49', '2024-06-07 07:14:49'),
(10, 2, 'đơn hàng 65000 đồng với mã số 52 đang được chuẩn bị', 0, '2024-06-07 07:14:53', '2024-06-07 07:14:53'),
(11, 5, 'đơn hàng 60000 đồng với mã số 57 đang được giao', 0, '2024-06-07 07:14:59', '2024-06-07 07:14:59'),
(12, 5, 'đơn hàng 60000 đồng với mã số 57 đã được giao thành công', 0, '2024-06-07 07:15:04', '2024-06-07 07:15:04'),
(13, 2, 'đơn hàng 65000 đồng với mã số 58 đã bị hủy', 0, '2024-06-07 07:20:38', '2024-06-07 07:20:38'),
(14, 2, 'đơn hàng 65000 đồng với mã số 58 đã bị hủy', 0, '2024-06-07 07:21:11', '2024-06-07 07:21:11'),
(16, 2, 'đơn hàng 65000 đồng với mã số 58 đã bị hủy', 0, '2024-06-07 07:26:08', '2024-06-07 07:26:08'),
(17, 2, 'đã thanh toán đơn hàng 65000 đồng với mã số 59 thành công', 0, '2024-06-07 07:29:23', '2024-06-07 07:29:23'),
(18, 2, 'đã hoàn trả số tiền 65000 đồng về ví của bạn', 0, '2024-06-07 07:29:45', '2024-06-07 07:29:45'),
(19, 2, 'đã thanh toán đơn hàng 65000 đồng với mã số 60 thành công', 0, '2024-06-07 07:34:31', '2024-06-07 07:34:31'),
(20, 2, 'đã hoàn trả số tiền 65000 đồng về ví của bạn', 0, '2024-06-07 07:34:58', '2024-06-07 07:34:58'),
(21, 2, 'đơn hàng 65000 đồng với mã số 60 đã bị hủy', 0, '2024-06-07 07:34:58', '2024-06-07 07:34:58'),
(22, 2, 'đơn hàng 65000 đồng với mã số 61 đang được chuẩn bị', 0, '2024-06-07 07:35:27', '2024-06-07 07:35:27'),
(23, 2, 'đơn hàng 65000 đồng với mã số 61 đang được giao', 0, '2024-06-07 07:35:34', '2024-06-07 07:35:34'),
(24, 2, 'lịch hẹn của bạn đã được chấp thuận, hãy chuẩn bị cho buổi hẹn của bạn!', 0, '2024-06-07 07:44:00', '2024-06-07 07:44:00'),
(25, 2, 'lịch hẹn của bạn đã bị hủy', 0, '2024-06-07 07:45:11', '2024-06-07 07:45:11'),
(26, 2, 'lịch hẹn của bạn đã hoàn thành, cảm ơn bạn đã sử dụng dịch vụ của chúng tôi!, hãy đánh giá dịch vụ để chúng tôi phục vụ bạn tốt hơn!', 0, '2024-06-07 07:45:49', '2024-06-07 07:45:49'),
(27, 5, 'đã thanh toán đơn hàng 25000 đồng với mã số 62 thành công', 0, '2024-06-07 07:57:30', '2024-06-07 07:57:30');

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
(48, 2, 1, 0, 'Xuan Thieu 14 street', '0962240446', 65000, '2024-06-05 06:45:14', '2024-06-05 06:45:14'),
(49, 2, 1, 1, NULL, '0962232323', 12, '2024-06-05 06:56:29', '2024-06-05 06:56:29'),
(50, 2, 4, 0, 'Xuan Thieu 14 street', '0962240446', 65000, '2024-06-05 09:07:25', '2024-06-05 09:43:40'),
(51, 2, 5, 0, 'Xuan Thieu 14 street', '0962240446', 65000, '2024-06-06 02:12:05', '2024-06-06 02:13:36'),
(52, 2, 2, 0, 'Xuan Thieu 14 street', '0962240446', 65000, '2024-06-06 02:14:18', '2024-06-07 00:14:53'),
(53, 2, 5, 0, 'Xuan Thieu 14 street', '0962240446', 65000, '2024-06-06 02:16:43', '2024-06-06 02:17:41'),
(54, 2, 2, 0, 'Xuan Thieu 14 street', '0962240446', 65000, '2024-06-06 07:49:12', '2024-06-07 00:14:49'),
(55, 2, 4, 0, 'Xuan Thieu 14 street', '0962240446', 65000, '2024-06-06 12:15:04', '2024-06-06 12:15:47'),
(56, 5, 1, 1, NULL, '0357139594', 20, '2024-06-07 00:03:21', '2024-06-07 00:03:21'),
(57, 5, 4, 0, 'Thạch Sơn 7, Khu Tái định cư Hòa Hiệp 4, Xã Hòa Liên, Huyện Hòa Vang, Thành phố Đà Nẵng', '0375118027', 60000, '2024-06-07 00:04:11', '2024-06-07 00:15:04'),
(58, 2, 5, 0, 'Xuan Thieu 14 street', '0962240446', 65000, '2024-06-07 00:20:31', '2024-06-07 00:26:08'),
(59, 2, 1, 0, 'Xuan Thieu 14 street', '0962240446', 65000, '2024-06-07 00:28:27', '2024-06-07 00:28:27'),
(60, 2, 5, 0, 'Xuan Thieu 14 street', '0962240446', 65000, '2024-06-07 00:34:10', '2024-06-07 00:34:57'),
(61, 2, 3, 0, 'Xuan Thieu 14 street', '0962240446', 65000, '2024-06-07 00:35:15', '2024-06-07 00:35:35'),
(62, 5, 1, 0, 'Đà Nẵng', '0962240446', 25000, '2024-06-07 00:56:48', '2024-06-07 00:56:48'),
(63, 5, 1, 0, 'Đà Nẵng', '0969234567', 25000, '2024-06-07 03:19:43', '2024-06-07 03:19:43');

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
(52, 1424, 48, 1, 15000, 0, '2024-06-05 06:45:14', '2024-06-05 06:45:14'),
(53, 1426, 48, 2, 50000, 0, '2024-06-05 06:45:14', '2024-06-05 06:45:14'),
(54, 1424, 50, 1, 15000, 0, '2024-06-05 09:07:25', '2024-06-05 09:07:25'),
(55, 1426, 50, 2, 50000, 0, '2024-06-05 09:07:25', '2024-06-05 09:07:25'),
(56, 1424, 51, 1, 15000, 0, '2024-06-06 02:12:05', '2024-06-06 02:12:05'),
(57, 1426, 51, 2, 50000, 0, '2024-06-06 02:12:05', '2024-06-06 02:12:05'),
(58, 1424, 52, 1, 15000, 0, '2024-06-06 02:14:18', '2024-06-06 02:14:18'),
(59, 1426, 52, 2, 50000, 0, '2024-06-06 02:14:18', '2024-06-06 02:14:18'),
(60, 1424, 53, 1, 15000, 0, '2024-06-06 02:16:43', '2024-06-06 02:16:43'),
(61, 1426, 53, 2, 50000, 0, '2024-06-06 02:16:43', '2024-06-06 02:16:43'),
(62, 1424, 54, 1, 15000, 0, '2024-06-06 07:49:12', '2024-06-06 07:49:12'),
(63, 1426, 54, 2, 50000, 0, '2024-06-06 07:49:12', '2024-06-06 07:49:12'),
(64, 1424, 55, 1, 15000, 0, '2024-06-06 12:15:04', '2024-06-06 12:15:04'),
(65, 1426, 55, 2, 50000, 0, '2024-06-06 12:15:04', '2024-06-06 12:15:04'),
(66, 1424, 57, 4, 60000, 0, '2024-06-07 00:04:11', '2024-06-07 00:04:11'),
(67, 1424, 58, 1, 15000, 0, '2024-06-07 00:20:31', '2024-06-07 00:20:31'),
(68, 1426, 58, 2, 50000, 0, '2024-06-07 00:20:31', '2024-06-07 00:20:31'),
(69, 1424, 59, 1, 15000, 0, '2024-06-07 00:28:27', '2024-06-07 00:28:27'),
(70, 1426, 59, 2, 50000, 0, '2024-06-07 00:28:27', '2024-06-07 00:28:27'),
(71, 1424, 60, 1, 15000, 0, '2024-06-07 00:34:10', '2024-06-07 00:34:10'),
(72, 1426, 60, 2, 50000, 0, '2024-06-07 00:34:10', '2024-06-07 00:34:10'),
(73, 1424, 61, 1, 15000, 0, '2024-06-07 00:35:15', '2024-06-07 00:35:15'),
(74, 1426, 61, 2, 50000, 0, '2024-06-07 00:35:15', '2024-06-07 00:35:15'),
(75, 1426, 62, 1, 25000, 0, '2024-06-07 00:56:48', '2024-06-07 00:56:48'),
(76, 1426, 63, 1, 25000, 0, '2024-06-07 03:19:43', '2024-06-07 03:19:43');

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
  `id` int(11) NOT NULL,
  `id_order` int(11) NOT NULL,
  `paymentDate` datetime DEFAULT NULL,
  `paymentMethod` varchar(30) NOT NULL,
  `isPaid` int(11) NOT NULL,
  `id_transaction` varchar(15) DEFAULT NULL,
  `id_order_momo` varchar(30) DEFAULT NULL,
  `money` int(11) NOT NULL,
  `createdAt` datetime NOT NULL DEFAULT current_timestamp(),
  `updatedAt` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `payments`
--

INSERT INTO `payments` (`id`, `id_order`, `paymentDate`, `paymentMethod`, `isPaid`, `id_transaction`, `id_order_momo`, `money`, `createdAt`, `updatedAt`) VALUES
(8, 48, '2024-06-05 13:45:57', 'MOMO', 1, '4053832369', '48PETSHOP1717569914875', 65000, '2024-06-05 13:45:14', '2024-06-05 13:45:57'),
(9, 49, NULL, 'COD', 0, NULL, NULL, 12, '2024-06-05 13:56:29', '2024-06-05 13:56:29'),
(10, 50, '2024-06-05 16:43:40', 'COD', 1, NULL, NULL, 65000, '2024-06-05 16:07:25', '2024-06-05 16:43:40'),
(11, 51, NULL, 'MOMO', 0, NULL, '51PETSHOP1717639925402', 65000, '2024-06-06 09:12:05', '2024-06-06 09:12:05'),
(12, 52, NULL, 'MOMO', 0, NULL, '52PETSHOP1717640058743', 65000, '2024-06-06 09:14:18', '2024-06-06 09:14:19'),
(13, 53, '2024-06-06 09:17:08', 'MOMO', 0, '4054683199', '53PETSHOP1717640203294', 65000, '2024-06-06 09:16:43', '2024-06-06 09:17:42'),
(14, 54, NULL, 'MOMO', 0, NULL, '54PETSHOP1717660152967', 65000, '2024-06-06 14:49:12', '2024-06-06 14:49:13'),
(15, 55, '2024-06-06 19:15:47', 'COD', 1, NULL, NULL, 65000, '2024-06-06 19:15:04', '2024-06-06 19:15:47'),
(16, 56, NULL, 'COD', 0, NULL, NULL, 20, '2024-06-07 07:03:21', '2024-06-07 07:03:21'),
(17, 57, NULL, 'MOMO', 0, NULL, '57PETSHOP1717718651065', 60000, '2024-06-07 07:04:11', '2024-06-07 07:04:11'),
(18, 58, NULL, 'COD', 0, NULL, NULL, 65000, '2024-06-07 07:20:31', '2024-06-07 07:20:31'),
(19, 59, '2024-06-07 07:29:23', 'MOMO', 1, '4055053637', '59PETSHOP1717720107576', 65000, '2024-06-07 07:28:27', '2024-06-07 07:29:23'),
(20, 60, '2024-06-07 07:34:31', 'MOMO', 0, '4055063188', '60PETSHOP1717720450446', 65000, '2024-06-07 07:34:10', '2024-06-07 07:34:58'),
(21, 61, NULL, 'MOMO', 0, NULL, '61PETSHOP1717720515242', 65000, '2024-06-07 07:35:15', '2024-06-07 07:35:15'),
(22, 62, '2024-06-07 07:57:30', 'MOMO', 1, '4055057378', '62PETSHOP1717721808222', 25000, '2024-06-07 07:56:48', '2024-06-07 07:57:30'),
(23, 63, NULL, 'MOMO', 0, NULL, '63PETSHOP1717730383198', 25000, '2024-06-07 10:19:43', '2024-06-07 10:19:43');

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `id` int(11) NOT NULL,
  `postType` int(11) NOT NULL,
  `id_account` int(11) NOT NULL,
  `title` varchar(100) NOT NULL,
  `thumbnail` varchar(300) DEFAULT NULL,
  `content` text NOT NULL,
  `view` int(11) NOT NULL,
  `createdAt` datetime NOT NULL DEFAULT current_timestamp(),
  `updatedAt` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`id`, `postType`, `id_account`, `title`, `thumbnail`, `content`, `view`, `createdAt`, `updatedAt`) VALUES
(1, 0, 0, 'Bài báo công bố quốc tế: Khởi sắc nhờ thưởng \'khủng\'', 'https://cdn.tuoitre.vn/thumb_w/730/2019/12/30/nghiencuukhoahoc-sv-sgu36-3read-only-1577713101885209928085.jpg', '<h2>TTO - Số lượng bài báo khoa học của nhiều trường đại học nước ta công bố trên tạp chí quốc tế uy tín tăng lên trong thời gian qua phần lớn là nhờ chính sách thưởng từ các trường.</h2><p><a href=\"https://cdn.tuoitre.vn/2019/12/30/nghiencuukhoahoc-sv-sgu36-3read-only-1577713101885209928085.jpg\" rel=\"noopener noreferrer\" target=\"_blank\" style=\"color: transparent;\"><img src=\"https://cdn.tuoitre.vn/thumb_w/730/2019/12/30/nghiencuukhoahoc-sv-sgu36-3read-only-1577713101885209928085.jpg\" alt=\"Bài báo công bố quốc tế: Khởi sắc nhờ thưởng khủng - Ảnh 1.\" height=\"1331\" width=\"2000\"></a></p><p><br></p><p>Nhiều trường thưởng cả trăm triệu đồng cho một bài báo công bố quốc tế - Ảnh: TỰ TRUNG</p><p>Tuy vậy, việc&nbsp;<a href=\"https://tuoitre.vn/thuong.html\" rel=\"noopener noreferrer\" target=\"_blank\" style=\"color: rgb(34, 106, 197);\">thưởng</a>&nbsp;lớn cũng để lại những mặt trái như giảng viên trường này lại \"âm thầm\" đứng tên bài báo trường khác để&nbsp;nhận thưởng.</p><p><strong>200 triệu đồng/bài</strong></p><p>Cách đây ba năm, Trường ĐH Kinh tế TP.HCM đưa ra chính sách khen thưởng cho giảng viên có&nbsp;<a href=\"https://tuoitre.vn/bai-bao-cong-bo-quoc-te.html\" rel=\"noopener noreferrer\" target=\"_blank\" style=\"color: rgb(34, 106, 197);\">bài báo công bố quốc tế</a>. Mức thưởng cao nhất 200 triệu đồng/bài. Số lượng bài báo công bố quốc tế của trường cũng tăng dần đều trong những năm gần đây. Trong đó, năm 2016 có 44 bài, 2017 là 57 bài, 2018 là 60 bài và năm 2019 có 82 bài.</p><p>GS.TS Nguyễn Trọng Hoài - phó hiệu trưởng Trường ĐH Kinh tế TP.HCM - cho biết chính sách khuyến khích cũng phần nào giúp gia tăng&nbsp;<a href=\"https://tuoitre.vn/bai-bao-quoc-te.html\" rel=\"noopener noreferrer\" target=\"_blank\" style=\"color: rgb(34, 106, 197);\">bài báo quốc tế</a>&nbsp;của trường bên cạnh các quy định về nghiên cứu khoa học bắt buộc đối với giảng viên, số tiến sĩ tăng, thành lập các nhóm nghiên cứu mạnh. Kinh phí thưởng tối đa mỗi năm khoảng 2 tỉ đồng.</p><p>Trong khi đó, số bài báo công bố quốc tế của Trường ĐH Mở TP.HCM tăng từ 16 bài năm 2017 lên 62 bài năm 2018. PGS.TS Nguyễn Minh Hà, hiệu trưởng nhà trường, cho biết trường bắt đầu chính sách thưởng công bố quốc tế từ năm 2017 và có điều chỉnh mức thưởng theo hướng tăng lên. Mức thưởng dao động từ 40-100 triệu đồng/bài&nbsp;tùy loại tạp chí.</p><p>Theo ông Hà, số bài báo quốc tế tăng lên có tác động rất lớn từ chính sách khuyến khích của trường.</p><p>\"Nếu không tự chủ, trường sẽ khó có thể đưa ra chính sách khuyến khích với mức thưởng như vậy do tài chính và các quy định liên quan. Việc thưởng tuy chưa nhiều nhưng đã tạo động lực cho giảng viên, nghiên cứu sinh chú ý hơn đến việc công bố. Giảng viên cũng chú ý kết nối với các giáo sư ở các trường nước ngoài\".</p><p><a href=\"https://cdn.tuoitre.vn/2019/12/31/logo-td-3012-so-bai-bao-quoc-te-scopus-tto-15777560457801705810811.jpg\" rel=\"noopener noreferrer\" target=\"_blank\" style=\"color: transparent;\"><img src=\"https://cdn.tuoitre.vn/thumb_w/730/2019/12/31/logo-td-3012-so-bai-bao-quoc-te-scopus-tto-15777560457801705810811.jpg\" alt=\"Bài báo công bố quốc tế: Khởi sắc nhờ thưởng khủng - Ảnh 2.\" height=\"662\" width=\"1189\"></a></p><p>Trường ĐH Sư phạm kỹ thuật TP.HCM cũng áp dụng chính sách thưởng công bố quốc tế cách đây 5 năm. Tuy nhiên lúc đầu chỉ ở mức 10, 20 triệu đồng và hiện nay mức cao nhất là 100 triệu đồng cho tác giả đứng đầu bài báo ISI.</p><p>PGS.TS Đỗ Văn Dũng, hiệu trưởng, cho biết chính sách khuyến khích này đã có tác động tích cực khi số lượng công bố quốc tế của trường tăng theo từng năm. Năm 2018 trường chỉ có 50 bài, năm 2019 tăng lên 92 bài.</p><p>Với các trường công lập, mức thưởng tuy thấp hơn nhưng cũng có tác động tích cực. Tại Trường ĐH Ngân hàng TP.HCM, mức cao nhất 40 triệu đồng, thấp nhất 6 triệu đồng. Số bài công bố quốc tế ISI, Scopus của trường cũng tăng mạnh từ 16 bài năm 2017 lên 62 bài năm 2019.</p><p>Đại diện một trường ĐH công lập khác cho biết hai năm nay trường mới tiến hành thưởng công bố quốc tế với giá trị 10 triệu đồng/bài ISI, Scopus. Đó cũng là nỗ lực của trường nhằm khuyến khích giảng viên tham gia công bố quốc tế vì tác động đến uy tín và xếp hạng của trường trong các bảng đánh giá quốc tế.</p><p><br></p><p><a href=\"https://cdn.tuoitre.vn/2019/12/30/nguyen-duc-trung-1-1read-only-15777132132292106162391.jpeg\" rel=\"noopener noreferrer\" target=\"_blank\" style=\"color: transparent;\"><img src=\"https://cdn.tuoitre.vn/thumb_w/730/2019/12/30/nguyen-duc-trung-1-1read-only-15777132132292106162391.jpeg\" alt=\"Bài báo công bố quốc tế: Khởi sắc nhờ thưởng khủng - Ảnh 3.\" height=\"1134\" width=\"1701\"></a></p><p><em>Tôi biết có trường ký hợp đồng với giảng viên cơ hữu trường khác, trả phí và khi công bố chỉ đứng tên trường mình. Đó là hình thức mua bài báo khoa học.</em></p><p class=\"ql-align-right\"><strong><em>PGS.TS NGUYỄN ĐỨC TRUNG (phó hiệu trưởng Trường ĐH Ngân hàng TP.HCM)</em></strong></p><p><strong>Những mặt trái...</strong></p><p>Với chính sách thưởng tiền lớn, bên cạnh yếu tố thúc đẩy giảng viên nghiên cứu khoa học còn để lại những mặt trái.</p><p>Theo ông Nguyễn Đức Trung - phó hiệu trưởng ĐH Ngân hàng TP.HCM, mức thưởng của trường chưa cao khiến một số giảng viên trong trường khi công bố quốc tế đã đứng tên trường ĐH khác.</p><p>\"Tôi biết mức thưởng trường ấy chi cho một bài báo như vậy là 100 triệu đồng. Tôi biết có trường ký hợp đồng với giảng viên cơ hữu trường khác, trả phí và khi công bố chỉ đứng tên trường mình. Đó là hình thức mua bài báo khoa học\".</p><p>Ông Trung đánh giá việc giảng viên trường này kết hợp với giảng viên trường khác trong và ngoài nước nghiên cứu, công bố là điều bình thường bởi nghiên cứu khoa học đòi hỏi một nhóm người mới có thể thực hiện được.</p><p>\"Tuy nhiên, làm giảng viên cơ hữu trường này nhưng nhận tiền và đứng tên công bố ở trường khác là hành vi gian dối. Chúng tôi đã cảnh báo giảng viên của trường về vấn đề này\" - ông Trung nói.</p><p><a href=\"https://cdn.tuoitre.vn/2019/12/31/logo-td-3012-muc-thuong-bai-bao-quoc-te-scopus-tto-15777560696931176642303.jpg\" rel=\"noopener noreferrer\" target=\"_blank\" style=\"color: transparent;\"><img src=\"https://cdn.tuoitre.vn/thumb_w/730/2019/12/31/logo-td-3012-muc-thuong-bai-bao-quoc-te-scopus-tto-15777560696931176642303.jpg\" alt=\"Bài báo công bố quốc tế: Khởi sắc nhờ thưởng khủng - Ảnh 5.\" height=\"768\" width=\"1189\"></a></p><p>Theo PGS.TS Nguyễn Minh Hà, ở các nước, trường ĐH cũng có quỹ nghiên cứu nhưng giáo sư đóng vai trò rất quan trọng trong việc tự tìm các dự án của doanh nghiệp, nhà nước đem về trường nghiên cứu.</p><p>Ngoài đem kinh phí về cho trường, giáo sư sẽ tìm người cùng thực hiện dự án với mình, mua sắm máy móc phục vụ việc nghiên cứu. Sau khi hoàn thành, công bố, số máy móc này trở thành tài sản của trường.</p><p>Đó là cách nghiên cứu và chuyển giao mà chúng ta cần học hỏi, vừa đem lại kinh phí, máy móc thí nghiệm hiện đại cho trường, vừa thúc đẩy hoạt động nghiên cứu cũng như chuyển giao công nghệ.</p><p>\"Trước mắt trường thưởng để tạo động lực giảng viên nghiên cứu. Khi đội ngũ đủ mạnh, trường khuyến khích giảng viên tìm dự án bên ngoài để triển khai nghiên cứu trong trường\" - ông Hà nói thêm.</p><p><strong>Buộc thôi việc giảng viên&nbsp;đứng tên công bố ở trường khác</strong></p><p>PGS.TS Đỗ Văn Dũng cho biết đã buộc thôi việc một giảng viên cơ hữu đứng tên công bố quốc tế ở trường khác.</p><p>GS.TS Nguyễn Trọng Hoài cũng cho hay chính sách khuyến khích của trường chỉ áp dụng đối với giảng viên, người của trường, không áp dụng cho người bên ngoài. Nếu học giả bên ngoài có hợp tác nghiên cứu với giảng viên của trường phải có hợp đồng, đăng ký với trường.</p>', 0, '2024-06-08 08:19:38', '2024-06-08 08:19:38'),
(2, 0, 0, 'Một ngày của tôi', 'https://blogradio.vn/uploads/cms/source/2023/17/motngay.jpg', '<h3 class=\"ql-align-justify\"><strong>blogradio.vn - Dù những ngôi nhà luôn cao tầng, dù những ánh đèn cứ lấp lánh xa xa, cao cao, nhưng tôi vẫn tận hưởng được những mùi vị của thiên nhiên của đất trời một cách vô tư và trong lành nhất.</strong></h3><h3 class=\"ql-align-center\"><strong>***</strong></h3><h3 class=\"ql-align-justify\">Tôi chưa bao giờ viết nhật ký và càng không có sở thích thói quen đó. Tôi chỉ viết khi có ý tưởng và những cảm xúc rất thật ùa về, những khi ấy tôi gần như bắt buộc phải ngồi vào bàn và mở máy lên, rồi cứ thế hai bàn tay lúc nhanh lúc chậm cứ liên hồi trên bàn phím, và kết quả là những dòng chữ liên tiếp hiện ra.</h3><h3 class=\"ql-align-justify\">Một ngày bình thường của tôi chắc cũng giống mọi người, cũng những giờ giấc những công việc của một người phụ nữ, hơn nữa là một phụ nữ đã có gia đình, nên tôi tin mọi hoạt động thường ngày của tôi cũng chẳng khác là bao so với nhiều người, chỉ là khác ở chính tôi, là ở những thời gian tôi còn đi làm nơi công sở và những thời gian tôi nghỉ việc ở nhà.</h3><h3 class=\"ql-align-justify\">Lúc tôi còn đi làm.</h3><h3 class=\"ql-align-justify\">Tôi đi làm khi vừa tốt nghiệp đại học xong, năm đó tôi mới hai mươi mấy tuổi, còn sống cùng với ba mẹ và anh chị em tôi, rồi đến mấy năm sau tôi lập gia đình, ra ở riêng và nghiễm nhiên tôi có một gia đình nhỏ thật sự của riêng tôi.</h3><h3 class=\"ql-align-justify\">Tôi muốn viết về khoảng thời gian tôi đã lập gia đình.</h3><h3 class=\"ql-align-justify\">Buổi sáng tôi hay thức giấc đầu tiên, trước ông xã tôi, để lo cho xong những công việc nhỏ nhất, ví như đi chợ cho cả ngày, rồi ăn sáng, rồi nấu sẵn thức ăn để trưa nhóc của tôi về ăn trưa, là những lúc con tôi đã lớn, đã học cấp hai rồi, mà lên cấp hai thì trường không tổ chức bán trú cho học sinh nữa.</h3><h3 class=\"ql-align-justify\">Những lúc ấy tôi vội vã và hối hả hơn nhiều.</h3><h3 class=\"ql-align-center\"><img src=\"https://blogradio.vn/uploads/cms/source/2023/17/motngay.jpg\" height=\"387\" width=\"564\"></h3><h3 class=\"ql-align-justify\">Vì lúc chỉ có hai vợ chồng son thì tôi thong thả hơn, đến khi có con mọn thì như mọi người hay nói là đầu bù tóc rối. Tôi cố gắng quán xuyến mọi việc vào buổi sáng được nhanh nhất để không bị trễ giờ làm, nhưng cũng giống như những bà mẹ nuôi con nhỏ, tôi luôn cảm giác bị thiếu thời gian, và vì những lúc con tôi còn nhỏ, áp lực về giờ giấc của công việc của tôi khá nặng, cũng may là có ông xã tôi phụ giúp một tay.</h3><h3 class=\"ql-align-justify\">Một ngày của tôi có chu trình bình thường.</h3><h3 class=\"ql-align-justify\">Khoảng sáu giờ sáng tôi thức dậy, lo vệ sinh cá nhân xong là lại quay ngược vào phòng ngủ, ở đó có một cái giường bề bộn chăn gối mùng mền cần được tôi xếp gọn, còn ông xã yêu quý của tôi thì đã phóng xuống nhà bếp pha cà phê rồi. Cả hai chúng tôi đều ăn sáng bên ngoài, hiếm hoi lắm mới ăn sáng tại nhà vào những ngày đi làm trong tuần, mà ông xã tôi cũng rất dễ tính nên thật sự tôi rất khỏe.</h3><h3 class=\"ql-align-justify\">Tôi lo nấu thức ăn cho cả ngày, rồi lại đi chợ cho ngày tiếp theo, và thức ăn được làm sạch sẽ rồi bảo quản trong tủ lạnh, mai lại lấy ra nấu, cứ vậy đó.</h3><h3 class=\"ql-align-justify\">Tôi thường ở lại công sở và ăn trưa nghỉ trưa tại đó chứ không về nhà, vì đường khá xa và bất tiện về thời tiết nắng mưa, nên những hoạt động chính của tôi tại nhà chủ yếu là buổi sáng sớm khoảng hơn một tiếng đồng hồ, và sau khi tôi quay về nhà lúc chiều tối.</h3><h3 class=\"ql-align-justify\">Chỉ cần thoát ra khỏi bộ đồng phục công sở, tôi sẽ là người phụ nữ của gia đình ngay lập tức. Tôi vo gạo và bấm nồi cơm điện trước, sau đó mới đến công việc lau dọn nhà cửa, đây gần như là việc chính nhất trong buổi chiều đang len lỏi những ánh sáng của bóng tối đang kéo đến, và luôn luôn tôi vừa làm vừa trò chuyện cùng con trai. Tôi hỏi con những việc diễn ra trong lớp trong trường của con trong ngày hôm ấy ra sao, nếu con tôi có mặt ở nhà, vì có những hôm nhóc phải đi học thêm, và tôi là một người mẹ may mắn, vì con tôi luôn ý thức rất cao trong việc học và những việc khác mà tôi đã hướng dẫn, nên thật sự tôi rất khỏe.</h3><h3 class=\"ql-align-justify\">Buổi tối là thời gian tôi hạnh phúc nhất, vì cả nhà được ngồi ăn cùng nhau, được trò chuyện cùng nhau, sau đó là mỗi người cứ lặng lẽ về góc nhỏ quen thuộc của mình rồi lại chìm vào những công việc tiếp theo cho ngày tiếp theo. Ông xã tôi thì ôm lap, con tôi thì lo bài vở còn tôi đứng sát bên những chén bát vừa ăn xong. Nhiệm vụ của tôi luôn như thế, rửa chén xong là đến công việc phơi áo quần trong cái máy giặt đang chờ tôi.</h3><h3 class=\"ql-align-justify\">Khi nhìn căn bếp đã gọn gàng đâu vào đó, lúc đó tôi mới yên tâm thở phào rằng một ngày nữa sắp sửa qua đi, và tôi đã tạm xong thiên chức của một người vợ và một người mẹ.</h3><h3 class=\"ql-align-justify\">Tôi dành thời gian còn lại cho tôi, bằng cách đi bộ trước nhà. Tôi sống trong một khu phố khá yên tĩnh và có con đường nhỏ phía trước rất thuận tiện cho sở thích đi bộ của tôi. Những lúc ấy tôi tha hồ được nhìn ngắm đất trời và cảm giác thật thoải mái sung sướng vì những hương vị của gió, của trăng, của những vì sao, của cả những mùi vị thức ăn của các ngôi nhà trong khu phố cứ tỏa lên quanh tôi, cả những mùi hôi khó chịu nhất của mấy con chuột chuyên đi ăn đêm cứ đâu đó thoắt ẩn thoắt hiện ngay dưới những bước đi của tôi.</h3><h3 class=\"ql-align-justify\">Tôi thích và vô cùng thích khoảng thời gian đó trong ngày.</h3><h3 class=\"ql-align-justify\">Dù những ngôi nhà luôn cao tầng, dù những ánh đèn cứ lấp lánh xa xa, cao cao, nhưng tôi vẫn tận hưởng được những mùi vị của thiên nhiên của đất trời một cách vô tư và trong lành nhất.</h3><h3 class=\"ql-align-justify\">Tôi đi bộ như thế, khoảng ít hơn hay nhiều hơn một tiếng, rồi vào nhà, lúc đó cái mệt của cả ngày như đã thấm sâu vào tôi, tôi bắt đầu ngáp và gần như có những khoảng thời gian rất lâu, phải đến mấy năm như thế, tôi không biết đến ti vi là gì, dù cái ti vi luôn nhìn tôi như gọi mời ngay trong phòng ngủ của vợ chồng tôi.</h3><h3 class=\"ql-align-center\"><img src=\"https://blogradio.vn/uploads/cms/source/2023/17/motngay_(2).jpg\" height=\"564\" width=\"564\"></h3><h3 class=\"ql-align-justify\">Tôi thích đứng sau lưng con tôi, nói thêm với con, nhắc nhở con thêm vài câu nữa, những câu nhắc quen thuộc mà tôi tin con tôi chắc đã phát ớn phát ngán lâu rồi, nhưng thật kỳ lạ là nếu tôi không nói ra cùng con thì tôi sẽ không yên tâm.</h3><h3 class=\"ql-align-justify\">Tôi lên giường và chờ giấc ngủ tới.</h3><h3 class=\"ql-align-justify\">Chỉ khi tôi nhắm mắt, cho dù là giấc ngủ có đến liền hay không, cho dù là đêm đó tôi có mơ hay không, vì tôi hay thường mơ lắm, thì tôi vẫn hay trằn trọc suốt. Tôi thuộc diện khó ngủ, nên có những đêm tôi ngủ thật say, rồi có những đêm tôi gần như thức trắng, mà điều này thì tôi cũng chẳng giải thích nổi.</h3><h3 class=\"ql-align-justify\">Bóng đêm trùm lên tôi cùng một cảm giác dễ chịu của gối, của mền, cúa chiếc giường quen thuộc và của căn phòng tôi yêu.</h3><h3 class=\"ql-align-justify\">Một ngày bình thường của tôi đã trôi qua như thế, với luôn luôn những sắp xếp bật lên trong đầu cho ngày mai của tôi, sẽ như nào, sẽ làm gì, sẽ đi những đâu, mà lúc ấy, bộ não của tôi như đã có kỹ năng tự động hóa vậy, tự ghi nhớ và khắc sâu sẵn cho tôi, để tôi chìm vào giấc ngủ được ngon nhất, được yên tâm nhất, cho ngày mai.</h3><h3 class=\"ql-align-justify\">Chắc chắn là không phải lúc nào cũng thế, có xê xích giống giống và khác khác một chút, nhưng đa phần là vậy, gần như tất cả các ngày đều vậy.</h3><h3 class=\"ql-align-justify\">Lúc tôi nghỉ việc ở nhà.</h3><h3 class=\"ql-align-justify\">Tôi hoàn toàn là một người phụ nữ nội trợ, không vướng bận không lật đật như lúc còn đi làm, và thời gian rảnh của tôi được nhiều lên vô kể, đến nỗi có nhiều lúc tôi cảm giác tôi là người thừa vậy, vì thời gian tôi có nhiều quá, thời gian ở bên tôi nhiều quá, sau khi tôi đã xong tất tần tật mọi việc trong nhà.</h3><h3 class=\"ql-align-justify\">Rồi có lẽ nhờ vậy mà tôi có thêm hai người bạn thân mới, nói là mới nhưng là rất cũ, vì chúng hiện hữu trong chính ngôi nhà của tôi bao năm rồi, là cái lap và cái ti vi.</h3><h3 class=\"ql-align-justify\">Tôi bắt đầu viết, viết nhiều, viết nhiều nhiều mỗi ngày.</h3><h3 class=\"ql-align-justify\">Tôi bắt đầu xem, xem nhiều, xem nhiều nhiều mỗi ngày.</h3><h3 class=\"ql-align-justify\">Và tôi bắt đầu yêu, yêu tất cả những gì tôi viết, yêu tất cả những gì tôi xem.</h3><h3 class=\"ql-align-justify\">Lúc tôi nghỉ việc ở nhà chỉ khác có vậy thôi so với lúc tôi còn đi làm, cũng buổi sáng buổi trưa buổi chiều buổi tối, và tôi cũng gần như chỉ có một mình, gần như suốt ngày quanh quẩn trong nhà, với dọn dẹp lau chùi nấu nướng, và với hai công việc rất mới rất cũ là viết và xem.</h3><h3 class=\"ql-align-justify\">Mọi người nhìn tôi rồi đó, một phụ nữ hết sức bình thường với những khoảng thời gian những công việc cũng hết sức bình thường, tôi chỉ cảm nhận mỗi ngày trôi qua với tôi đều có những ý nghĩa mà tôi không nhìn thấy được, không sờ thấy được, chỉ thấy cuộc sống của tôi lúc ở nhà không đi làm nữa không còn nhiều niềm vui như trước, không còn giao tiếp không còn nói cười nhiều như trước, nhưng bù lại tôi được sống thật là chính tôi, với những trải lòng trong những dòng viết mà theo tôi có chất lượng không đến nỗi quá tệ.</h3><h3 class=\"ql-align-justify\">Tôi viết rồi cất đó, rồi gởi đi, chẳng biết ai đọc ai không và cảm nhận của họ ra sao, nhưng tôi cứ viết, vì đó là chính tôi.</h3><h3 class=\"ql-align-justify\">Còn khi tôi xem nghĩa là tôi đang giao tiếp cùng mọi người, những lúc ấy trước mắt tôi là một thế giới rộng lớn với bao điều bổ ích và kỳ thú cần thiết cho tôi, để tôi biết cuộc sống này thật đáng sống.</h3><h3 class=\"ql-align-justify\">Đã lâu rồi, từ khi tôi nghỉ việc, cho dù thich hay không tôi vẫn phải chấp nhận một cuộc sống như vậy, vì với mỗi người có mỗi lý do khác nhau, nhưng tôi tin cho dù có ở nhà thì ai cũng thích được làm việc.</h3><h3 class=\"ql-align-justify\">Một ngày bình thường của tôi, chỉ là như thế.</h3><h3 class=\"ql-align-justify\">Có thể tôi viết chưa đầy đủ, có thể tôi còn quên điều gì đó, nhưng điều đó thật sự không quan trọng lắm, vì tôi đã viết, đã viết được, và viết thật nhất.</h3><h3 class=\"ql-align-justify\">Tôi yêu một ngày của tôi.</h3><p><br></p>', 0, '2024-06-08 09:44:36', '2024-06-08 09:44:36'),
(3, 0, 0, 'Nuôi Chó hay nuôi Mèo ??? Sen chọn đi', 'https://blogchomeo.com/wp-content/uploads/2021/08/nuoichohaymeo.jpeg', '<p><em>Nếu là một người chỉ thích&nbsp;</em><a href=\"https://blogchomeo.com/cho/\" rel=\"noopener noreferrer\" target=\"_blank\" style=\"color: rgb(52, 152, 219);\"><strong><em>CHÓ</em></strong></a><em>&nbsp;hoặc thích&nbsp;</em><a href=\"https://blogchomeo.com/meo/\" rel=\"noopener noreferrer\" target=\"_blank\" style=\"color: rgb(52, 152, 219);\"><strong><em>MÈO</em></strong></a><em>&nbsp;thì việc chọn nuôi thú cưng thực sự quá đơn giản. Nhưng bạn lại là một người yêu thú cưng, bạn không biết phải chọn nuôi chó hay mèo khi gia đình hoặc bản thân chỉ có điều kiện nuôi một trong hai?</em></p><p>Nếu bạn củng đang phân vân “ở giữa hai lựa chọn này”, đừng lo. Hãy đọc hết bài viết dưới đây.&nbsp;<a href=\"https://blogchomeo.com/\" rel=\"noopener noreferrer\" target=\"_blank\" style=\"color: rgb(52, 152, 219);\"><strong>Blog chó mèo</strong></a>&nbsp;sẽ tổng hợp từng ưu điểm, nhược điểm, lí do, nguyên nhân xem bạn sẽ phù hợp với mèo hay chó hơn, từ đó hãy đưa ra quyết định cuối cùng của mình nhé. Lest go!!</p><p><strong>Lưu ý</strong></p><p><strong><em>–&nbsp;</em></strong><em>Bài viết được tổng hợp hoàn toàn dựa trên ý kiến và quan điểm cá nhân của mình, nó có thể đúng với người này và không đúng với người khác. Hãy chọn lọc những ý kiến mà bạn cho là đúng ra tìm ra hướng đi phù hợp cá nhân, điều kiện cụ thể của bạn</em></p><p class=\"ql-align-center\"><br></p><p class=\"ql-align-center\"><img src=\"https://blogchomeo.com/wp-content/uploads/2021/08/nuoichohaymeo.jpeg\" height=\"359\" width=\"359\">Nuôi Chó hay nuôi Mèo ??? Sen chọn đi</p><h2>Không gian sống phù hợp không?</h2><p>Trong hầu hết mọi yếu tố cần xem xét thì có lẽ đây chính là yếu tố quan trọng nhất mà mình nghĩ sẽ đưa nó lên đầu tiên, bởi vì sao?</p><p>Không gian sống và sinh hoạt thực sự đóng một vai trò rất quan trọng trong việc phát triển nhân cách và sinh hoạt của thú cưng. Chó là một loại động vật khá năng động, chúng cần một không gian đủ thoải mái để có thể vận động và tiêu hao bớt năng lượng, đặc biệt là với các giống chó lớn như&nbsp;<a href=\"https://blogchomeo.com/tag/alaska/\" rel=\"noopener noreferrer\" target=\"_blank\" style=\"color: rgb(52, 152, 219);\"><strong><em>Alaska</em></strong></a><strong><em>,&nbsp;</em></strong><a href=\"https://blogchomeo.com/tag/husky/\" rel=\"noopener noreferrer\" target=\"_blank\" style=\"color: rgb(52, 152, 219);\"><strong><em>Husky</em></strong></a><strong><em>,&nbsp;</em></strong><a href=\"https://blogchomeo.com/tag/golden/\" rel=\"noopener noreferrer\" target=\"_blank\" style=\"color: rgb(52, 152, 219);\"><strong><em>Golden</em></strong></a>&nbsp;chẳng hạn.</p><p>Nếu bạn đang ở trọ hoặc ở căn hộ, chẳng may diện tích phòng không đủ thoải mái cho chó vận động thì sao? Chúng sẽ chạy loạn lên và căn phòng nhỏ của bạn sẽ trở thành một đống lộn xộn đấy. Chưa kể ở những khu vực tập thể, việc chó sũa ầm ĩ khi cô đơn củng là một vấn đề thực sự nên xem xét, vì tiếng ồn sẽ ảnh hưởng nhiều đến hàng xóm xung quanh</p><p>Còn đối với mèo thì khác, chúng thường ít vận động hơn, giành khá nhiều thời gian để ngủ. Nếu có chơi đùa với bạn thì mèo củng chỉ nằm một chỗ thôi nên khá lí tưởng để nuôi ngay cả trong điều kiện bạn không có quá nhiều không gian nhưng vẫn thích nuôi thú cưng</p><p>Như vậy sau khi xem xét về không gian sống, ta sẽ rút ra kết luận sơ bộ như sau</p><p><strong>Nuôi chó khi</strong>: Bạn sống ở một khu vực riêng biệt hoặc ít nhất nơi bạn sinh sống phải đủ không gian cho chó vận động. Nếu không bạn có thể cân nhắc nuôi một số giống chó nhỏ như&nbsp;<a href=\"https://blogchomeo.com/tag/poodle/\" rel=\"noopener noreferrer\" target=\"_blank\" style=\"color: rgb(52, 152, 219);\"><em>Poodle</em></a><em>, Chihuahua,&nbsp;</em><a href=\"https://blogchomeo.com/tag/pug/\" rel=\"noopener noreferrer\" target=\"_blank\" style=\"color: rgb(52, 152, 219);\"><em>Pug</em></a><em>, Phóc-sóc…</em></p><p><strong>Nuôi mèo khi</strong>: Mèo ít vận động nên bạn có thể nuôi mèo bất kể không gian sinh hoạt như thế nào nhưng để chắc ăn hơn xem bạn có phù hợp với nuôi mèo hay không? Hãy tham khảo thêm một số thông tin bên dưới nhé</p><p class=\"ql-align-center\"><img src=\"https://blogchomeo.com/wp-content/uploads/2021/08/nuoi-cho-va-meo.jpg\" height=\"315\" width=\"600\"></p><p>&nbsp;</p><h2>Những người xung quanh</h2><p>Một yếu tố khác quan trọng không kém mà bạn nên cân nhắc khi phân vân giữa việc nuôi chó hay mèo chính là môi trường sống. Bạn có đang sống chung với gia đình hoặc bạn bè hay không? Tại sao lại cần phải quan tâm đến vấn đề này?</p><p>Hầu hết chúng ta đều công nhận, chó là một giống động vật tình cảm và rất “sợ sự cô đơn”. Nếu bạn chỉ ở một mình, chó có thể sẽ không chịu được cô đơn khi không ai chơi với chúng. Khi chó ở một mình, chúng thường sẽ tự hoạt động để giải tỏa sự cô đơn củng như buồn chán bằng cách phá phách hoặc gặm nhấm các đồ vật trong nhà, trong một số trường hợp nó sẽ trở thành bệnh tâm lý và khiến chó có những hành động khác thường</p><p>Một lời khuyên chân thành tiếp theo dành cho bạn, nếu như ngoài bạn ra trong nhà không có ai và bạn lại là một người thường xuyên đi làm và gặp gỡ bạn bè. Hãy thực sự cân nhắc về việc nuôi mèo thay vì chó, mèo có thể chịu được cô đơn tốt hơn chó rất nhiều</p><p><strong>Lưu ý nhỏ</strong></p><p>À mình quên mất, nếu bạn không sống chung với gia đình hoặc bạn bè nhưng nếu bạn làm việc tại nhà hoặc có thể giành nhiều thời gian cho chó thì vẫn nuôi chó tốt nhé ^^</p><p>Trong thường hợp bạn ở chung với gia đình “<strong>hãy cân nhắc, hỏi ý kiến của phụ huynh khi chọn nuôi</strong>“, ý kiến của người thân củng thực sự quan trọng đấy vì khi bạn đi làm, người thân chính là người sẽ trông chúng dùm bạn mà</p>', 0, '2024-06-08 09:50:47', '2024-06-08 09:50:47'),
(4, 1, 2, 'ngyaf đầu nuôi chó nên cho nó ăn gì ? ', 'https://encrypted-tbn3.gstatic.com/images?q=tbn:ANd9GcQgByBT5IiAT_a2x9pUVb4VMoOrlzHH7Jrzj-HB5jzHlR4lNLMS', 'daaaaaaaaaaaaa', 0, '2024-06-09 15:51:25', '2024-06-09 15:51:25');

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
(1424, 9, 'con chó', 86, 36, 402111, 15000, 12, 'the sun can\'t shine without darkness', '2024-05-09 05:28:19', '2024-06-07 00:35:15'),
(1425, 11, 'mèo con ', 12, 40, 12111, 12, 15, NULL, '2024-05-27 01:58:45', '2024-05-27 01:58:45'),
(1426, 9, 'chó ta', 70, 32, 800000, 25000, 12, 'oke', '2024-05-27 02:00:37', '2024-06-07 03:19:43');

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
(104, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySUQiOjIsInJvbGUiOiJhZG1pbiIsImlhdCI6MTcxNjYwMzYzNywiZXhwIjoxNzE2Nzc2NDM3fQ.0LDshBIPMqvShCi5j9ZbIWpZIu8HaM4FpUcS-E6zVSg', '1716776437', '2024-05-25 02:20:37', '2024-05-25 02:20:37'),
(105, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySUQiOjIsInJvbGUiOiJhZG1pbiIsImlhdCI6MTcxNjczOTE5MiwiZXhwIjoxNzE2OTExOTkyfQ.PTv7-ZHEJ8Ma2YnODeifaP-ZxdFGVyBvd-SqocG7JPA', '1716911992', '2024-05-26 15:59:52', '2024-05-26 15:59:52'),
(106, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySUQiOjIsInJvbGUiOiJhZG1pbiIsImlhdCI6MTcxNjczOTMyMCwiZXhwIjoxNzE2OTEyMTIwfQ.sc0iAOy2z8xbvVe2AdGjucpVQ63bud9z4kSLXIlswT4', '1716912120', '2024-05-26 16:02:00', '2024-05-26 16:02:00'),
(107, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySUQiOiI1Iiwicm9sZSI6ImN1c3RvbWVyIiwiaWF0IjoxNzE2NzQwNjY0LCJleHAiOjE3MTY5MTM0NjR9.ddJr-4FQ3Gi7xJaflT3b9W-UHlRWEH2tdP80huZyOwU', '1716913464', '2024-05-26 16:24:24', '2024-05-26 16:24:24'),
(108, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySUQiOnsidXNlcklEIjoiNSJ9LCJyb2xlIjoiY3VzdG9tZXIiLCJpYXQiOjE3MTY3NDEyODIsImV4cCI6MTcxNjkxNDA4Mn0.ds8Wrjpn5aR6-saiL6OiHekWFL6eIAURjhdbwohcZZg', '1716914082', '2024-05-26 16:34:42', '2024-05-26 16:34:42'),
(109, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySUQiOnsidXNlcklEIjoiNSJ9LCJyb2xlIjoiY3VzdG9tZXIiLCJpYXQiOjE3MTY3NDEzNDgsImV4cCI6MTcxNjkxNDE0OH0.bLj2N_3nOHhHSQs8Pld5ku1FisnB7aspfT372Sm2JLE', '1716914148', '2024-05-26 16:35:48', '2024-05-26 16:35:48'),
(110, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySUQiOjIsInJvbGUiOiJhZG1pbiIsImlhdCI6MTcxNjc3NDc2MCwiZXhwIjoxNzE2OTQ3NTYwfQ.NdOV48ixtZytgwOx9JMxsebwRQswlDn9ehh5mbz7IFU', '1716947560', '2024-05-27 01:52:40', '2024-05-27 01:52:40'),
(111, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySUQiOjIsInJvbGUiOiJhZG1pbiIsImlhdCI6MTcxNjgxNDQzMiwiZXhwIjoxNzE2OTg3MjMyfQ.yksxF5PzBrgg4bEoqFvdWRKJW_h5oXQFW6o8OH6aVlI', '1716987232', '2024-05-27 12:53:52', '2024-05-27 12:53:52'),
(112, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySUQiOjIsInJvbGUiOiJhZG1pbiIsImlhdCI6MTcxNjgyODM4MSwiZXhwIjoxNzE3MDAxMTgxfQ.rdx5BoLTcc_Xl2FDyzo0fWv1k-f0ttUwyd2M6lASHsc', '1717001181', '2024-05-27 16:46:21', '2024-05-27 16:46:21'),
(113, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySUQiOjIsInJvbGUiOiJhZG1pbiIsImlhdCI6MTcxNjg5MzUxNiwiZXhwIjoxNzE3MDY2MzE2fQ.7UhBu0cRdQfmjOA662ZbvVZTiQ0GjdSy4_jvP0A0Ehw', '1717066316', '2024-05-28 10:51:56', '2024-05-28 10:51:56'),
(114, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySUQiOjIsInJvbGUiOiJhZG1pbiIsImlhdCI6MTcxNjk5OTI0MSwiZXhwIjoxNzE3MTcyMDQxfQ.iDU_9NUM0X2DTByYqRYSfMN-xDs8XF2rSb5DU1I3-Qs', '1717172041', '2024-05-29 16:14:01', '2024-05-29 16:14:01'),
(115, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySUQiOjcsInJvbGUiOiJjdXN0b21lciIsImlhdCI6MTcxNzAwMDAyOCwiZXhwIjoxNzE3MTcyODI4fQ.vlH-agnuwPCyj5BPi3Fjg96MLgo7iJMyisnOVLB1_RQ', '1717172828', '2024-05-29 16:27:08', '2024-05-29 16:27:08'),
(116, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySUQiOjIsInJvbGUiOiJhZG1pbiIsImlhdCI6MTcxNzAwMDA4OSwiZXhwIjoxNzE3MTcyODg5fQ.SYK3dZ_Hr_MY48PjwLCz2Qv5cc4Vbk89QQ-lAUK_mB4', '1717172889', '2024-05-29 16:28:09', '2024-05-29 16:28:09'),
(117, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySUQiOjIsInJvbGUiOiJhZG1pbiIsImlhdCI6MTcxNzAzNjUyNCwiZXhwIjoxNzE3MjA5MzI0fQ._jyj5AymdldDwtpAaXnW1FVPUxVq5HtchUqx9RaNl-4', '1717209324', '2024-05-30 02:35:24', '2024-05-30 02:35:24'),
(118, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySUQiOjIsInJvbGUiOiJhZG1pbiIsImlhdCI6MTcxNzA1OTY5NCwiZXhwIjoxNzE3MjMyNDk0fQ.N-w7D_PprimLRebEemNmuhzEb8ljQi5GDGcl_L0Mcig', '1717232494', '2024-05-30 09:01:34', '2024-05-30 09:01:34'),
(119, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySUQiOjIsInJvbGUiOiJhZG1pbiIsImlhdCI6MTcxNzA2NTYwMSwiZXhwIjoxNzE3MjM4NDAxfQ.3oEIQQOq1SMs6kP-r54riBxXHut50zu8g1a2h7GplYU', '1717238401', '2024-05-30 10:40:01', '2024-05-30 10:40:01'),
(120, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySUQiOjIsInJvbGUiOiJhZG1pbiIsImlhdCI6MTcxNzA4NDI3MCwiZXhwIjoxNzE3MjU3MDcwfQ.a0bmHaDabQQguuGTU8-IRRKBObEjfnkL5HAX8H77Nqw', '1717257070', '2024-05-30 15:51:10', '2024-05-30 15:51:10'),
(121, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySUQiOjIsInJvbGUiOiJhZG1pbiIsImlhdCI6MTcxNzEyMjI1NSwiZXhwIjoxNzE3Mjk1MDU1fQ.3z_51Z6QNSrgLQxGzaXUjS1TqVqiKhiRXg4fGyiHdHs', '1717295055', '2024-05-31 02:24:15', '2024-05-31 02:24:15'),
(122, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySUQiOjcsInJvbGUiOiJjdXN0b21lciIsImlhdCI6MTcxNzEyMjI5NiwiZXhwIjoxNzE3Mjk1MDk2fQ.ciiZqD3kqquGtpFuGPatQcGgQaaL4fRvd_xvlbUxQzw', '1717295096', '2024-05-31 02:24:56', '2024-05-31 02:24:56'),
(123, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySUQiOjIsInJvbGUiOiJhZG1pbiIsImlhdCI6MTcxNzEyMjYxMiwiZXhwIjoxNzE3Mjk1NDEyfQ.wSgE0aPboLePIJH-mn_ksOW0LqrX4w4AsBR7IbHd7yQ', '1717295412', '2024-05-31 02:30:12', '2024-05-31 02:30:12'),
(124, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySUQiOjIsInJvbGUiOiJhZG1pbiIsImlhdCI6MTcxNzEyNjI2NSwiZXhwIjoxNzE3Mjk5MDY1fQ.OmrzSrsNv95zUMcLHpeBkOGz8WkXi_YrTXpwLPZlR0I', '1717299065', '2024-05-31 03:31:05', '2024-05-31 03:31:05'),
(125, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySUQiOjIsInJvbGUiOiJhZG1pbiIsImlhdCI6MTcxNzE3MjE2OSwiZXhwIjoxNzE3MzQ0OTY5fQ.uJigou1QeMx4ViPJ07XP25T7lzJXG1VhIXDxI1rlNZM', '1717344969', '2024-05-31 16:16:09', '2024-05-31 16:16:09'),
(126, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySUQiOjIsInJvbGUiOiJhZG1pbiIsImlhdCI6MTcxNzE3NDg1OSwiZXhwIjoxNzE3MzQ3NjU5fQ.eL6eqT6q1GE9wzCwMrS6St0IcQcRAWEsOO3zg-AZRHw', '1717347659', '2024-05-31 17:00:59', '2024-05-31 17:00:59'),
(127, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySUQiOjIsInJvbGUiOiJhZG1pbiIsImlhdCI6MTcxNzIxNzY2MSwiZXhwIjoxNzE3MzkwNDYxfQ.8_kAgmx83CIXUW8trs71pmyqyT4f6LZAoNdSU_na-hk', '1717390461', '2024-06-01 04:54:21', '2024-06-01 04:54:21'),
(128, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySUQiOjIsInJvbGUiOiJhZG1pbiIsImlhdCI6MTcxNzIyOTA5MSwiZXhwIjoxNzE3NDAxODkxfQ.tYsRmvha-tIPUUBOUjpcNGmVbOiACS7BfGIf2kSv9N4', '1717401891', '2024-06-01 08:04:51', '2024-06-01 08:04:51'),
(129, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySUQiOjIsInJvbGUiOiJhZG1pbiIsImlhdCI6MTcxNzIyOTI1MCwiZXhwIjoxNzE3NDAyMDUwfQ.y7fBULiQHlvALPP2wKNTmyhjOOXm3_KzBu_qwZ09Ae4', '1717402050', '2024-06-01 08:07:30', '2024-06-01 08:07:30'),
(130, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySUQiOjIsInJvbGUiOiJhZG1pbiIsImlhdCI6MTcxNzIzMDQyMywiZXhwIjoxNzE3NDAzMjIzfQ.hUR2TdOsIVbNtz0_q9kOj_cNDHX8ChphAV9TnztoUJc', '1717403223', '2024-06-01 08:27:03', '2024-06-01 08:27:03'),
(131, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySUQiOjIsInJvbGUiOiJhZG1pbiIsImlhdCI6MTcxNzIzMDQ2NSwiZXhwIjoxNzE3NDAzMjY1fQ.zfrkwQ8KWZQqa_fXsU81MEk5piie75OW3u8Dsbr4PNo', '1717403265', '2024-06-01 08:27:45', '2024-06-01 08:27:45'),
(132, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySUQiOjIsInJvbGUiOiJhZG1pbiIsImlhdCI6MTcxNzMwMDg3MiwiZXhwIjoxNzE3NDczNjcyfQ.nTXTQeHQS13YdFKYwPUEJgRmAeI_iQ7lcASL9Q08gXk', '1717473672', '2024-06-02 04:01:12', '2024-06-02 04:01:12'),
(133, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySUQiOjIsInJvbGUiOiJhZG1pbiIsImlhdCI6MTcxNzMwMDg5OSwiZXhwIjoxNzE3NDczNjk5fQ.PmgmuzWAJzN4YzoTi3P-RXM90qTJbX4AdO1LSiOGdzw', '1717473699', '2024-06-02 04:01:39', '2024-06-02 04:01:39'),
(134, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySUQiOjIsInJvbGUiOiJhZG1pbiIsImlhdCI6MTcxNzMwMDk1MCwiZXhwIjoxNzE3NDczNzUwfQ.VNKDBLyZj6wnjSlp58Gaivw0dPw8_vncDFtT-X8KRqU', '1717473750', '2024-06-02 04:02:30', '2024-06-02 04:02:30'),
(135, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySUQiOjIsInJvbGUiOiJhZG1pbiIsImlhdCI6MTcxNzMwMDk3MSwiZXhwIjoxNzE3NDczNzcxfQ.POT_JHksfunbSholsBM5POp7xCGpz88BB1R8xhWVRgU', '1717473771', '2024-06-02 04:02:51', '2024-06-02 04:02:51'),
(136, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySUQiOjcsInJvbGUiOiJjdXN0b21lciIsImlhdCI6MTcxNzMwNjkwNiwiZXhwIjoxNzE3NDc5NzA2fQ.hgrPzDIUnsXhVdP6PgmIRyytmJpEacSnXeHdc1Kfsxw', '1717479706', '2024-06-02 05:41:46', '2024-06-02 05:41:46'),
(137, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySUQiOjcsInJvbGUiOiJjdXN0b21lciIsImlhdCI6MTcxNzQyNjc3MSwiZXhwIjoxNzE3NTk5NTcxfQ.J6oevEmmg_2kMWZLWYFkiQofFj6KLaNei_PDWEglynE', '1717599571', '2024-06-03 14:59:31', '2024-06-03 14:59:31'),
(138, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySUQiOjUsInJvbGUiOiJjdXN0b21lciIsImlhdCI6MTcxNzQyNjg0OCwiZXhwIjoxNzE3NTk5NjQ4fQ.bOZhmq99U6hCHuxaN6YrzNbkLye2iXk9K3xvsURnF1U', '1717599648', '2024-06-03 15:00:48', '2024-06-03 15:00:48'),
(139, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySUQiOjIsInJvbGUiOiJhZG1pbiIsImlhdCI6MTcxNzQyNjg2NiwiZXhwIjoxNzE3NTk5NjY2fQ.Cj8APBHfxNgxWwrDo1FfalDeZmPQLk1WbsbPtX330c4', '1717599666', '2024-06-03 15:01:06', '2024-06-03 15:01:06'),
(140, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySUQiOjIsInJvbGUiOiJhZG1pbiIsImlhdCI6MTcxNzQ2ODU5OSwiZXhwIjoxNzE3NjQxMzk5fQ.o728h-W46oIjCmvYTnJxMbMH1eljb6yqou-nrcVi7IQ', '1717641399', '2024-06-04 02:36:39', '2024-06-04 02:36:39'),
(141, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySUQiOjIsInJvbGUiOiJhZG1pbiIsImlhdCI6MTcxNzQ3NTIzNCwiZXhwIjoxNzE3NjQ4MDM0fQ.mrjbzDmLXoJdrx_iEm7ntIPrxsmT8YlTBa5E1LiQywI', '1717648034', '2024-06-04 04:27:14', '2024-06-04 04:27:14'),
(142, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySUQiOjIsInJvbGUiOiJhZG1pbiIsImlhdCI6MTcxNzQ3ODkwNSwiZXhwIjoxNzE3NjUxNzA1fQ.aeqjcLeblWWXI2AYQ8C9qdeknDRpYbbFIwOsvSYQQfg', '1717651705', '2024-06-04 05:28:25', '2024-06-04 05:28:25'),
(143, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySUQiOjIsInJvbGUiOiJhZG1pbiIsImlhdCI6MTcxNzQ4ODUxMSwiZXhwIjoxNzE3NjYxMzExfQ.S1h-c8-vhf6kkbhXTDbdVve6aYGgneKAB35CRY3wBXU', '1717661311', '2024-06-04 08:08:31', '2024-06-04 08:08:31'),
(144, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySUQiOjIsInJvbGUiOiJhZG1pbiIsImlhdCI6MTcxNzQ5MjM4MSwiZXhwIjoxNzE3NjY1MTgxfQ.3WJKIe-Q85AqrI7oLMiAAgGLWJKHgJCl6wIjh3qLEss', '1717665181', '2024-06-04 09:13:01', '2024-06-04 09:13:01'),
(145, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySUQiOjIsInJvbGUiOiJhZG1pbiIsImlhdCI6MTcxNzU0MTUxNSwiZXhwIjoxNzE3NzE0MzE1fQ.zfsoPwPYvYuTZBMSvMe5XxmoGUOE0t6wVYjM8CPdnMI', '1717714315', '2024-06-04 22:51:55', '2024-06-04 22:51:55'),
(146, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySUQiOjIsInJvbGUiOiJhZG1pbiIsImlhdCI6MTcxNzU2NTcxMCwiZXhwIjoxNzE3NzM4NTEwfQ.eDdIFPeKuiUNkCeWOgSAiphIp1VJVW2tzVZ89P19As8', '1717738510', '2024-06-05 05:35:10', '2024-06-05 05:35:10'),
(147, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySUQiOjIsInJvbGUiOiJhZG1pbiIsImlhdCI6MTcxNzU2OTQxNywiZXhwIjoxNzE3NzQyMjE3fQ.-zyj8N2YXe-1Vtb4RMbPUDcFelxDMj1-S4F510QM93k', '1717742217', '2024-06-05 06:36:57', '2024-06-05 06:36:57'),
(148, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySUQiOjIsInJvbGUiOiJhZG1pbiIsImlhdCI6MTcxNzU3ODQzMiwiZXhwIjoxNzE3NzUxMjMyfQ.g46Ir1H3N1-_5385GDEZObGsDooa4ojlKrJo5EToEiU', '1717751232', '2024-06-05 09:07:12', '2024-06-05 09:07:12'),
(149, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySUQiOjIsInJvbGUiOiJhZG1pbiIsImlhdCI6MTcxNzYzOTUzNCwiZXhwIjoxNzE3ODEyMzM0fQ.Pd6BA-Ng-C7Y_SxymjenRX5-QSFYEbF8WdVYumWTzwk', '1717812334', '2024-06-06 02:05:34', '2024-06-06 02:05:34'),
(150, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySUQiOjIsInJvbGUiOiJhZG1pbiIsImlhdCI6MTcxNzY2MDE0NiwiZXhwIjoxNzE3ODMyOTQ2fQ.UOKFID0U1CQPrdpTnt8XDhibDt6qlm8jfKnImnYm-2U', '1717832946', '2024-06-06 07:49:06', '2024-06-06 07:49:06'),
(151, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySUQiOjIsInJvbGUiOiJhZG1pbiIsImlhdCI6MTcxNzY2MTczOCwiZXhwIjoxNzE3ODM0NTM4fQ.wjnIBint8S4aE8psg8rrCz9b8zXt1_4LEhabauknuRM', '1717834538', '2024-06-06 08:15:38', '2024-06-06 08:15:38'),
(152, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySUQiOjcsInJvbGUiOiJjdXN0b21lciIsImlhdCI6MTcxNzY2MjA3MiwiZXhwIjoxNzE3ODM0ODcyfQ.Uu3j2WpXnPp40qt2ifa55yKZssO4tex4znZyC85BaIw', '1717834872', '2024-06-06 08:21:12', '2024-06-06 08:21:12'),
(153, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySUQiOjgsInJvbGUiOiJjdXN0b21lciIsImlhdCI6MTcxNzY2MjE0NCwiZXhwIjoxNzE3ODM0OTQ0fQ.-ueOOeiP-LhkMj47s2VWYjgpqqzAmZxwG5OhdTvubN8', '1717834944', '2024-06-06 08:22:24', '2024-06-06 08:22:24'),
(154, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySUQiOjIsInJvbGUiOiJhZG1pbiIsImlhdCI6MTcxNzY3NjA2MSwiZXhwIjoxNzE3ODQ4ODYxfQ.98rFtIaLKOHlDfoli90cxoqflrMeF4z7T0McwO4nyLs', '1717848861', '2024-06-06 12:14:21', '2024-06-06 12:14:21'),
(155, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySUQiOjUsInJvbGUiOiJjdXN0b21lciIsImlhdCI6MTcxNzcxODU2OCwiZXhwIjoxNzE3ODkxMzY4fQ.hLsvSB1VFn2lZ1XBvJJjiHzDtq6AQw19A0UB6jWvmLA', '1717891368', '2024-06-07 00:02:48', '2024-06-07 00:02:48'),
(156, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySUQiOjUsInJvbGUiOiJjdXN0b21lciIsImlhdCI6MTcxNzcxODg5MCwiZXhwIjoxNzE3ODkxNjkwfQ.L3q4JfVAEVFhmCA7hLc5B591FXlW_HAwj_XAQxEGTAc', '1717891690', '2024-06-07 00:08:10', '2024-06-07 00:08:10'),
(157, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySUQiOjIsInJvbGUiOiJhZG1pbiIsImlhdCI6MTcxNzcxOTI3OSwiZXhwIjoxNzE3ODkyMDc5fQ.gkQnUYRIkUseUt6ieYjhhb_7AI8qmhSRdSMHf7qFcnk', '1717892079', '2024-06-07 00:14:39', '2024-06-07 00:14:39'),
(158, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySUQiOjIsInJvbGUiOiJhZG1pbiIsImlhdCI6MTcxNzcxOTU0MywiZXhwIjoxNzE3ODkyMzQzfQ.vgVS0OLVlxGFG8SVl_3dk-EjDscLpZlyKJF_LJorGjo', '1717892343', '2024-06-07 00:19:03', '2024-06-07 00:19:03'),
(159, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySUQiOjUsInJvbGUiOiJjdXN0b21lciIsImlhdCI6MTcxNzcyMTc4MiwiZXhwIjoxNzE3ODk0NTgyfQ.lkuXEQxzgI5vVD-HMjN4i5Dk_vnuyCjBHerKeaD5VFs', '1717894582', '2024-06-07 00:56:22', '2024-06-07 00:56:22'),
(160, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySUQiOjUsInJvbGUiOiJjdXN0b21lciIsImlhdCI6MTcxNzczMDI2MywiZXhwIjoxNzE3OTAzMDYzfQ.rPXbhbCfxxZOYcmPtc5p33X1RR1JJ2jlpYRtfCkgn6w', '1717903063', '2024-06-07 03:17:43', '2024-06-07 03:17:43'),
(161, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySUQiOjIsInJvbGUiOiJhZG1pbiIsImlhdCI6MTcxNzc3NDkyMywiZXhwIjoxNzE3OTQ3NzIzfQ.KD8GYs_QLRJmvdnwVtHxHsu-OPuZJyIcDJ3akZRR_H4', '1717947723', '2024-06-07 15:42:03', '2024-06-07 15:42:03'),
(162, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySUQiOjIsInJvbGUiOiJhZG1pbiIsImlhdCI6MTcxNzc3NDk0NiwiZXhwIjoxNzE3OTQ3NzQ2fQ.5Uoc6gjc-iBsLLIekr-W5I5GytFLaxZ6CA4kseNjy00', '1717947746', '2024-06-07 15:42:26', '2024-06-07 15:42:26'),
(163, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySUQiOjIsInJvbGUiOiJhZG1pbiIsImlhdCI6MTcxNzc3NDk5OSwiZXhwIjoxNzE3OTQ3Nzk5fQ.h3ChbALST59V5DzgX9bir5fv4GU4HI6m5vl6t-KjJYI', '1717947799', '2024-06-07 15:43:19', '2024-06-07 15:43:19'),
(164, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySUQiOjIsInJvbGUiOiJhZG1pbiIsImlhdCI6MTcxNzgwOTUyOCwiZXhwIjoxNzE3OTgyMzI4fQ.uYV2BWZvwG-hzDJ0Nud9pll1VDANr14qcv57ArTZQRk', '1717982328', '2024-06-08 01:18:48', '2024-06-08 01:18:48'),
(165, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySUQiOjIsInJvbGUiOiJhZG1pbiIsImlhdCI6MTcxNzgxNDU4NSwiZXhwIjoxNzE3OTg3Mzg1fQ.ZoJbtQbb6M50k5y6mmf2H74PHyZN9nMwgVlZrjN4oYY', '1717987385', '2024-06-08 02:43:05', '2024-06-08 02:43:05'),
(166, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySUQiOjIsInJvbGUiOiJhZG1pbiIsImlhdCI6MTcxNzkyMzA4MiwiZXhwIjoxNzE4MDk1ODgyfQ.ZRDGzuHPAa-ax6VMdIy5h-O6xG9l2KezBfDEdT-mWKY', '1718095882', '2024-06-09 08:51:22', '2024-06-09 08:51:22'),
(167, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySUQiOjIsInJvbGUiOiJhZG1pbiIsImlhdCI6MTcxNzkyMzI0NywiZXhwIjoxNzE4MDk2MDQ3fQ.5GSZ4FZhvanfrKk6FVm5c-zJkpc63jii4ah_RgZRqdI', '1718096047', '2024-06-09 08:54:07', '2024-06-09 08:54:07');

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
(6, 'đã duyệt ', '2024-05-20 02:11:20', '2024-05-20 02:11:20'),
(7, 'đã hoàn thành ', '2024-06-03 16:08:41', '2024-06-03 16:08:41');

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
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_post` (`id_post`),
  ADD KEY `id_account` (`id_account`);

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
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_account` (`id_account`);

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
-- Indexes for table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_order` (`id_order`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `postType` (`postType`),
  ADD KEY `id_account` (`id_account`);

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `addressinfors`
--
ALTER TABLE `addressinfors`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `appointments`
--
ALTER TABLE `appointments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `breeds`
--
ALTER TABLE `breeds`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `carts`
--
ALTER TABLE `carts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `cart_items`
--
ALTER TABLE `cart_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `images`
--
ALTER TABLE `images`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1429;

--
-- AUTO_INCREMENT for table `inforusers`
--
ALTER TABLE `inforusers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `messages`
--
ALTER TABLE `messages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=64;

--
-- AUTO_INCREMENT for table `order_items`
--
ALTER TABLE `order_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=77;

--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1427;

--
-- AUTO_INCREMENT for table `ratings`
--
ALTER TABLE `ratings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `refreshtokens`
--
ALTER TABLE `refreshtokens`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=168;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

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
-- Constraints for table `notifications`
--
ALTER TABLE `notifications`
  ADD CONSTRAINT `notifications_ibfk_1` FOREIGN KEY (`id_account`) REFERENCES `accounts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

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
-- Constraints for table `payments`
--
ALTER TABLE `payments`
  ADD CONSTRAINT `payments_ibfk_1` FOREIGN KEY (`id_order`) REFERENCES `orders` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

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
