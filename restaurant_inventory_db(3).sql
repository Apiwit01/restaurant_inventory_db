-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 04, 2025 at 11:36 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `restaurant_inventory_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `cooking_logs`
--

CREATE TABLE `cooking_logs` (
  `log_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `menu_id` int(11) DEFAULT NULL,
  `quantity` int(11) DEFAULT 1,
  `cooked_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `cooking_logs`
--

INSERT INTO `cooking_logs` (`log_id`, `user_id`, `menu_id`, `quantity`, `cooked_at`) VALUES
(1, 2, 22, 1, '2025-08-04 15:51:09'),
(2, 2, 22, 1, '2025-08-04 15:51:16'),
(3, 2, 2, 1, '2025-08-04 15:51:21'),
(4, 2, 2, 1, '2025-08-04 15:51:22'),
(5, 2, 5, 1, '2025-08-04 15:51:24'),
(6, 2, 5, 1, '2025-08-04 15:51:25'),
(7, 2, 5, 1, '2025-08-04 15:51:36'),
(8, 2, 22, 1, '2025-08-04 15:51:42'),
(9, 2, 22, 1, '2025-08-04 15:51:43'),
(10, 2, 22, 1, '2025-08-04 15:51:43'),
(11, 2, 22, 1, '2025-08-11 22:47:08'),
(12, 2, 22, 1, '2025-08-12 01:05:03'),
(13, 2, 22, 1, '2025-08-12 01:05:25'),
(14, 2, 11, 1, '2025-08-12 11:30:31'),
(15, 3, 11, 1, '2025-08-12 11:37:25'),
(16, 3, 11, 1, '2025-08-12 12:01:51'),
(17, 3, 12, 1, '2025-08-12 12:01:54'),
(18, 3, 12, 1, '2025-08-12 12:01:55'),
(19, 3, 10, 1, '2025-08-12 12:02:01'),
(20, 3, 10, 1, '2025-08-12 12:02:02'),
(21, 3, 10, 1, '2025-08-12 12:02:03'),
(22, 3, 5, 1, '2025-08-12 12:02:04'),
(23, 3, 5, 1, '2025-08-12 12:02:04'),
(24, 3, 16, 1, '2025-08-12 12:02:07'),
(25, 3, 16, 1, '2025-08-12 12:02:08'),
(26, 3, 11, 1, '2025-08-12 15:12:39'),
(27, 3, 11, 1, '2025-08-23 02:47:41'),
(28, 3, 22, 1, '2025-08-23 04:06:36'),
(29, 3, 22, 1, '2025-08-23 04:09:06'),
(30, 3, 11, 1, '2025-08-27 03:57:14'),
(31, 3, 11, 1, '2025-08-29 05:01:38'),
(32, 3, 12, 1, '2025-08-29 05:01:42'),
(33, 3, 11, 1, '2025-09-02 13:51:58'),
(34, 3, 11, 1, '2025-09-02 14:01:09');

-- --------------------------------------------------------

--
-- Table structure for table `ingredients`
--

CREATE TABLE `ingredients` (
  `ingredient_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `category` enum('เนื้อสัตว์','ผัก','อาหารทะเล','เครื่องเทศ','ของแห้ง','อื่นๆ') NOT NULL DEFAULT 'อื่นๆ',
  `unit` varchar(20) NOT NULL,
  `cost_price` decimal(10,2) NOT NULL DEFAULT 0.00,
  `quantity` float DEFAULT 0,
  `threshold` float DEFAULT 0,
  `expiry_date` date DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `ingredients`
--

INSERT INTO `ingredients` (`ingredient_id`, `name`, `category`, `unit`, `cost_price`, `quantity`, `threshold`, `expiry_date`, `updated_at`) VALUES
(1, 'แป้งพิซซ่า', 'ของแห้ง', 'ก้อน', 25.00, 24, 5, NULL, '2025-08-12 00:28:33'),
(2, 'มะเขือเทศ', 'ผัก', 'กิโลกรัม', 10.00, 68, 5, NULL, '2025-09-02 14:01:09'),
(3, 'มอสซาเรลล่าชีส', 'อื่นๆ', 'กิโลกรัม', 50.00, 75.6, 3, NULL, '2025-08-29 05:01:42'),
(4, 'โหระพา', 'ผัก', 'กรัม', 3.00, 71, 30, NULL, '2025-08-29 05:01:42'),
(5, 'น้ำมันมะกอก', 'อื่นๆ', 'ลิตร', 50.00, 51, 2, NULL, '2025-09-02 14:01:09'),
(6, 'เปปเปอโรนี', 'เนื้อสัตว์', 'กรัม', 30.00, 1050, 300, NULL, '2025-08-12 00:29:06'),
(7, 'เส้นสปาเก็ตตี้', 'อื่นๆ', 'กิโลกรัม', 0.00, 17.4, 5, NULL, '2025-08-12 12:02:08'),
(8, 'เบคอน', 'เนื้อสัตว์', 'กรัม', 40.00, 931, 200, NULL, '2025-09-02 14:01:09'),
(9, 'ไข่ไก่', 'อื่นๆ', 'ฟอง', 0.00, 98, 20, NULL, '2025-08-04 15:09:23'),
(10, 'พาร์เมซานชีส', 'อื่นๆ', 'กรัม', 100.00, 1720, 300, NULL, '2025-08-04 15:51:36'),
(11, 'ครีม', 'อื่นๆ', 'ลิตร', 0.00, 2.3, 1, NULL, '2025-08-12 12:02:08'),
(12, 'พริกไทยดำ', 'เครื่องเทศ', 'กรัม', 20.00, 93, 20, NULL, '2025-08-23 04:09:06'),
(13, 'เนื้อบด', 'เนื้อสัตว์', 'กรัม', 40.00, 756, 500, NULL, '2025-08-23 04:09:06'),
(14, 'หอมใหญ่', 'อื่นๆ', 'หัว', 15.00, 49, 10, NULL, '2025-08-04 15:22:00'),
(15, 'แครอท', 'ผัก', 'หัว', 10.00, 29, 5, NULL, '2025-08-12 00:28:12'),
(16, 'กระเทียม', 'ผัก', 'หัว', 1.00, 10, 10, '2025-08-28', '2025-08-29 04:58:17'),
(17, 'แผ่นลาซานญ่า', 'อื่นๆ', 'แผ่น', 0.00, 62, 20, NULL, '2025-08-12 12:02:04'),
(18, 'ซอสเพสโต้', 'อื่นๆ', 'กรัม', 0.00, 1000, 200, NULL, '2025-06-25 17:28:16'),
(19, 'เส้นเฟตตูชินี', 'อื่นๆ', 'กิโลกรัม', 0.00, 10, 2, NULL, '2025-06-25 17:28:16'),
(20, 'กุ้ง', 'อาหารทะเล', 'ตัว', 50.00, 100, 20, NULL, '2025-08-12 00:25:27'),
(21, 'ปลาหมึก', 'อื่นๆ', 'ตัว', 50.00, 50, 10, NULL, '2025-08-04 15:22:07'),
(22, 'หอยลาย', 'อื่นๆ', 'กรัม', 50.00, 2000, 500, NULL, '2025-08-04 15:22:14'),
(23, 'ข้าวอิตาเลียน', 'อื่นๆ', 'กิโลกรัม', 60.00, 10, 2, NULL, '2025-08-12 00:27:10'),
(24, 'เห็ดแชมปิญอง', 'ผัก', 'กรัม', 10.00, 1000, 200, NULL, '2025-08-12 00:28:21'),
(25, 'หัวหอม', 'อื่นๆ', 'หัว', 0.00, 30, 5, NULL, '2025-06-25 17:28:16'),
(26, 'ขนมปังบาแก็ต', 'ของแห้ง', 'แถว', 40.00, 27, 5, NULL, '2025-08-12 12:02:03'),
(27, 'ขนมปัง', 'ของแห้ง', 'แผ่น', 30.00, 50, 10, NULL, '2025-08-12 00:25:52'),
(28, 'เนยกระเทียม', 'อื่นๆ', 'กรัม', 0.00, 497, 100, NULL, '2025-08-12 12:02:03'),
(29, 'พาสลีย์', 'อื่นๆ', 'กรัม', 0.00, 100, 20, NULL, '2025-06-25 17:28:16'),
(30, 'ผักกาดโรเมน', 'อื่นๆ', 'กรัม', 0.00, 991, 200, NULL, '2025-09-02 14:01:09'),
(31, 'ขนมปังกรอบ', 'ของแห้ง', 'กรัม', 30.00, 491, 100, NULL, '2025-09-02 14:01:09'),
(32, 'น้ำสลัดซีซาร์', 'อื่นๆ', 'กรัม', 0.00, 991, 200, NULL, '2025-09-02 14:01:09'),
(33, 'มะเขือยาว', 'อื่นๆ', 'ผล', 0.00, 30, 5, NULL, '2025-06-25 17:28:16'),
(34, 'พาร์มาแฮม', 'อื่นๆ', 'กรัม', 0.00, 1000, 200, NULL, '2025-06-25 17:28:16'),
(35, 'ร็อกเก็ต', 'อื่นๆ', 'กรัม', 0.00, 500, 100, NULL, '2025-06-25 17:28:16'),
(36, 'กอร์กอนโซล่า', 'อื่นๆ', 'กรัม', 0.00, 500, 100, NULL, '2025-06-25 17:28:16'),
(37, 'ริคอตต้า', 'อื่นๆ', 'กรัม', 0.00, 500, 100, NULL, '2025-06-25 17:28:16'),
(38, 'แผ่นคาเนลโลนี', 'อื่นๆ', 'แผ่น', 0.00, 50, 10, NULL, '2025-06-25 17:28:16'),
(39, 'ผักโขม', 'อื่นๆ', 'กรัม', 0.00, 1000, 200, NULL, '2025-06-25 17:28:16'),
(40, 'ทูน่ากระป๋อง', 'เนื้อสัตว์', 'กระป๋อง', 30.00, 30, 5, NULL, '2025-08-12 01:06:52'),
(41, 'เส้นเพนเน่', 'อื่นๆ', 'กิโลกรัม', 0.00, 10, 2, NULL, '2025-06-25 17:28:16'),
(42, 'ซอสมะเขือเทศ', 'อื่นๆ', 'ลิตร', 0.00, 4.6, 2, NULL, '2025-08-12 12:02:08'),
(43, 'บัลซามิก', 'เครื่องเทศ', 'ลิตร', 40.00, 88, 20, NULL, '2025-09-02 14:01:09'),
(44, 'มายองเนส', 'อื่นๆ', 'กรัม', 0.00, 500, 100, NULL, '2025-06-25 17:28:16'),
(45, 'แตงกวา', 'อื่นๆ', 'ผล', 0.00, 30, 5, NULL, '2025-06-25 17:28:16'),
(46, 'ผักกาดหอม', 'อื่นๆ', 'กรัม', 0.00, 491, 100, NULL, '2025-09-02 14:01:09');

-- --------------------------------------------------------

--
-- Table structure for table `menus`
--

CREATE TABLE `menus` (
  `menu_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `image_url` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `menus`
--

INSERT INTO `menus` (`menu_id`, `name`, `price`, `image_url`, `created_at`) VALUES
(1, 'Margherita Pizza', 150.00, 'images/image-1754327688794-955498436.jpg', '2025-06-25 17:28:27'),
(2, 'Pepperoni Pizza', 180.00, 'images/image-1754327774369-670698415.jpg', '2025-06-25 17:28:27'),
(3, 'Spaghetti Carbonara', 160.00, 'images/image-1754327996970-643634777.jpg', '2025-06-25 17:28:27'),
(4, 'Spaghetti Bolognese', 170.00, 'images/image-1754327967396-382437100.jpg', '2025-06-25 17:28:27'),
(5, 'Lasagna', 200.00, 'images/image-1754327620825-502266454.png', '2025-06-25 17:28:27'),
(6, 'Pesto Pasta', 160.00, 'images/image-1754327807017-849160944.jpg', '2025-06-25 17:28:27'),
(7, 'Seafood Marinara', 190.00, 'images/image-1754327933314-72988549.jpeg', '2025-06-25 17:28:27'),
(8, 'Mushroom Risotto', 180.00, 'images/image-1754327748857-231664572.jpg', '2025-06-25 17:28:27'),
(9, 'Tomato Bruschetta', 90.00, 'images/image-1754328127362-948635099.jpg', '2025-06-25 17:28:27'),
(10, 'Garlic Bread', 80.00, 'images/image-1754327595526-653969351.jpg', '2025-06-25 17:28:27'),
(11, 'Caesar Salad', 120.99, 'images/image-1754327372753-826697173.jpg', '2025-06-25 17:28:27'),
(12, 'Caprese Salad', 110.00, 'images/image-1754327330297-880292092.jpg', '2025-06-25 17:28:27'),
(14, 'Fettuccine Alfredo', 160.00, 'images/image-1754327480615-254034221.jpg', '2025-06-25 17:28:27'),
(15, 'Four Cheese Pizza', 200.00, 'images/image-1754327552611-260636017.jpg', '2025-06-25 17:28:27'),
(16, 'Meatball Spaghetti', 170.00, 'images/image-1754327716467-529384488.jpg', '2025-06-25 17:28:27'),
(17, 'Spinach Cannelloni', 180.00, 'images/image-1754328039243-129019843.jpg', '2025-06-25 17:28:27'),
(18, 'Tuna Pasta', 150.00, 'images/image-1754328151059-171350472.jpg', '2025-06-25 17:28:27'),
(19, 'Eggplant Parmesan', 170.00, 'images/image-1754327429840-71279064.jpg', '2025-06-25 17:28:27'),
(20, 'Prosciutto Pizza', 210.00, 'images/image-1754327875845-598253122.jpg', '2025-06-25 17:28:27'),
(22, 'ใส้กรอกโคเรีย', 25.00, 'images/image-1754328256489-236448276.jpg', '2025-08-04 14:45:14');

-- --------------------------------------------------------

--
-- Table structure for table `menu_ingredients`
--

CREATE TABLE `menu_ingredients` (
  `id` int(11) NOT NULL,
  `menu_id` int(11) DEFAULT NULL,
  `ingredient_id` int(11) DEFAULT NULL,
  `amount` float NOT NULL,
  `unit` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `menu_ingredients`
--

INSERT INTO `menu_ingredients` (`id`, `menu_id`, `ingredient_id`, `amount`, `unit`) VALUES
(45, 22, 13, 20, 'กรัม'),
(46, 22, 12, 1, 'กรัม'),
(47, 22, 5, 1, 'ลิตร'),
(48, 12, 3, 1, 'กิโลกรัม'),
(49, 12, 4, 1, 'กรัม'),
(50, 12, 43, 1, 'ลิตร'),
(51, 12, 5, 1, 'ลิตร'),
(52, 12, 2, 1, 'กิโลกรัม'),
(53, 15, 36, 1, 'กรัม'),
(54, 15, 1, 1, 'ก้อน'),
(55, 15, 3, 1, 'กิโลกรัม'),
(56, 15, 5, 1, 'ลิตร'),
(57, 15, 10, 1, 'กรัม'),
(58, 15, 37, 1, 'กรัม'),
(59, 10, 26, 1, 'แถว'),
(60, 10, 28, 1, 'กรัม'),
(61, 5, 13, 1, 'กรัม'),
(62, 5, 42, 1, 'ลิตร'),
(63, 5, 17, 1, 'แผ่น'),
(64, 5, 3, 1, 'กิโลกรัม'),
(65, 1, 3, 1, 'กิโลกรัม'),
(66, 1, 1, 1, 'ก้อน'),
(67, 1, 4, 1, 'กรัม'),
(68, 1, 42, 1, 'ลิตร'),
(69, 2, 1, 1, 'ก้อน'),
(70, 2, 6, 1, 'กรัม'),
(71, 2, 42, 1, 'ลิตร'),
(72, 2, 3, 1, 'กิโลกรัม'),
(73, 11, 32, 1, 'กรัม'),
(74, 11, 30, 1, 'กรัม'),
(75, 11, 5, 1, 'ลิตร'),
(76, 11, 43, 1, 'ลิตร'),
(77, 11, 31, 1, 'กรัม'),
(78, 11, 8, 1, 'กรัม'),
(79, 11, 2, 1, 'กิโลกรัม'),
(80, 11, 46, 1, 'กรัม'),
(81, 19, 33, 1, 'ผล'),
(82, 19, 4, 1, 'กรัม'),
(83, 19, 5, 1, 'ลิตร'),
(84, 19, 10, 1, 'กรัม'),
(85, 19, 42, 1, 'ลิตร'),
(86, 6, 18, 1, 'กรัม'),
(87, 6, 7, 1, 'กิโลกรัม'),
(88, 6, 10, 1, 'กรัม'),
(89, 14, 11, 1, 'ลิตร'),
(90, 14, 19, 1, 'กิโลกรัม'),
(91, 14, 10, 1, 'กรัม'),
(92, 14, 5, 1, 'ลิตร'),
(93, 16, 13, 1, 'กรัม'),
(94, 16, 7, 1, 'กิโลกรัม'),
(95, 16, 4, 1, 'กรัม'),
(96, 16, 42, 1, 'ลิตร'),
(97, 16, 11, 1, 'ลิตร');

-- --------------------------------------------------------

--
-- Table structure for table `stock_logs`
--

CREATE TABLE `stock_logs` (
  `log_id` int(11) NOT NULL,
  `ingredient_id` int(11) DEFAULT NULL,
  `changed_by` int(11) DEFAULT NULL,
  `change_type` enum('deduct','add') NOT NULL,
  `amount` float NOT NULL,
  `description` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `stock_logs`
--

INSERT INTO `stock_logs` (`log_id`, `ingredient_id`, `changed_by`, `change_type`, `amount`, `description`, `created_at`) VALUES
(1, 13, 2, 'deduct', -25, 'Deducted for menu ID: 22', '2025-08-04 15:51:09'),
(2, 13, 2, 'deduct', -25, 'Deducted for menu ID: 22', '2025-08-04 15:51:16'),
(3, 1, 2, 'deduct', -1, 'Deducted for menu ID: 2', '2025-08-04 15:51:21'),
(4, 2, 2, 'deduct', -0.15, 'Deducted for menu ID: 2', '2025-08-04 15:51:21'),
(5, 3, 2, 'deduct', -0.15, 'Deducted for menu ID: 2', '2025-08-04 15:51:21'),
(6, 6, 2, 'deduct', -50, 'Deducted for menu ID: 2', '2025-08-04 15:51:21'),
(7, 1, 2, 'deduct', -1, 'Deducted for menu ID: 2', '2025-08-04 15:51:22'),
(8, 2, 2, 'deduct', -0.15, 'Deducted for menu ID: 2', '2025-08-04 15:51:22'),
(9, 3, 2, 'deduct', -0.15, 'Deducted for menu ID: 2', '2025-08-04 15:51:22'),
(10, 6, 2, 'deduct', -50, 'Deducted for menu ID: 2', '2025-08-04 15:51:22'),
(11, 17, 2, 'deduct', -3, 'Deducted for menu ID: 5', '2025-08-04 15:51:24'),
(12, 13, 2, 'deduct', -120, 'Deducted for menu ID: 5', '2025-08-04 15:51:24'),
(13, 42, 2, 'deduct', -0.1, 'Deducted for menu ID: 5', '2025-08-04 15:51:24'),
(14, 10, 2, 'deduct', -20, 'Deducted for menu ID: 5', '2025-08-04 15:51:24'),
(15, 11, 2, 'deduct', -0.05, 'Deducted for menu ID: 5', '2025-08-04 15:51:24'),
(16, 17, 2, 'deduct', -3, 'Deducted for menu ID: 5', '2025-08-04 15:51:25'),
(17, 13, 2, 'deduct', -120, 'Deducted for menu ID: 5', '2025-08-04 15:51:25'),
(18, 42, 2, 'deduct', -0.1, 'Deducted for menu ID: 5', '2025-08-04 15:51:25'),
(19, 10, 2, 'deduct', -20, 'Deducted for menu ID: 5', '2025-08-04 15:51:25'),
(20, 11, 2, 'deduct', -0.05, 'Deducted for menu ID: 5', '2025-08-04 15:51:25'),
(22, 17, 2, 'deduct', -3, 'Deducted for menu ID: 5', '2025-08-04 15:51:36'),
(23, 13, 2, 'deduct', -120, 'Deducted for menu ID: 5', '2025-08-04 15:51:36'),
(24, 42, 2, 'deduct', -0.1, 'Deducted for menu ID: 5', '2025-08-04 15:51:36'),
(25, 10, 2, 'deduct', -20, 'Deducted for menu ID: 5', '2025-08-04 15:51:36'),
(26, 11, 2, 'deduct', -0.05, 'Deducted for menu ID: 5', '2025-08-04 15:51:36'),
(27, 13, 2, 'deduct', -25, 'Deducted for menu ID: 22', '2025-08-04 15:51:42'),
(28, 13, 2, 'deduct', -25, 'Deducted for menu ID: 22', '2025-08-04 15:51:43'),
(29, 13, 2, 'deduct', -25, 'Deducted for menu ID: 22', '2025-08-04 15:51:43'),
(30, 13, 2, 'deduct', -20, 'Deducted for menu ID: 22', '2025-08-11 22:47:08'),
(31, 12, 2, 'deduct', -1, 'Deducted for menu ID: 22', '2025-08-11 22:47:08'),
(32, 5, 2, 'deduct', -1, 'Deducted for menu ID: 22', '2025-08-11 22:47:08'),
(33, 13, 2, 'deduct', -20, 'Deducted for menu ID: 22', '2025-08-12 01:05:03'),
(34, 12, 2, 'deduct', -1, 'Deducted for menu ID: 22', '2025-08-12 01:05:03'),
(35, 5, 2, 'deduct', -1, 'Deducted for menu ID: 22', '2025-08-12 01:05:03'),
(36, 13, 2, 'deduct', -20, 'Deducted for menu ID: 22', '2025-08-12 01:05:25'),
(37, 12, 2, 'deduct', -1, 'Deducted for menu ID: 22', '2025-08-12 01:05:25'),
(38, 5, 2, 'deduct', -1, 'Deducted for menu ID: 22', '2025-08-12 01:05:25'),
(39, 32, 2, 'deduct', -1, 'Deducted for menu ID: 11', '2025-08-12 11:30:31'),
(40, 30, 2, 'deduct', -1, 'Deducted for menu ID: 11', '2025-08-12 11:30:31'),
(41, 5, 2, 'deduct', -1, 'Deducted for menu ID: 11', '2025-08-12 11:30:31'),
(42, 43, 2, 'deduct', -1, 'Deducted for menu ID: 11', '2025-08-12 11:30:31'),
(43, 31, 2, 'deduct', -1, 'Deducted for menu ID: 11', '2025-08-12 11:30:31'),
(44, 8, 2, 'deduct', -1, 'Deducted for menu ID: 11', '2025-08-12 11:30:31'),
(45, 2, 2, 'deduct', -1, 'Deducted for menu ID: 11', '2025-08-12 11:30:31'),
(46, 46, 2, 'deduct', -1, 'Deducted for menu ID: 11', '2025-08-12 11:30:31'),
(47, 32, 3, 'deduct', -1, 'Deducted for menu ID: 11', '2025-08-12 11:37:25'),
(48, 30, 3, 'deduct', -1, 'Deducted for menu ID: 11', '2025-08-12 11:37:25'),
(49, 5, 3, 'deduct', -1, 'Deducted for menu ID: 11', '2025-08-12 11:37:25'),
(50, 43, 3, 'deduct', -1, 'Deducted for menu ID: 11', '2025-08-12 11:37:25'),
(51, 31, 3, 'deduct', -1, 'Deducted for menu ID: 11', '2025-08-12 11:37:25'),
(52, 8, 3, 'deduct', -1, 'Deducted for menu ID: 11', '2025-08-12 11:37:25'),
(53, 2, 3, 'deduct', -1, 'Deducted for menu ID: 11', '2025-08-12 11:37:25'),
(54, 46, 3, 'deduct', -1, 'Deducted for menu ID: 11', '2025-08-12 11:37:25'),
(55, 32, 3, 'deduct', -1, 'Deducted for menu ID: 11', '2025-08-12 12:01:51'),
(56, 30, 3, 'deduct', -1, 'Deducted for menu ID: 11', '2025-08-12 12:01:51'),
(57, 5, 3, 'deduct', -1, 'Deducted for menu ID: 11', '2025-08-12 12:01:51'),
(58, 43, 3, 'deduct', -1, 'Deducted for menu ID: 11', '2025-08-12 12:01:51'),
(59, 31, 3, 'deduct', -1, 'Deducted for menu ID: 11', '2025-08-12 12:01:51'),
(60, 8, 3, 'deduct', -1, 'Deducted for menu ID: 11', '2025-08-12 12:01:51'),
(61, 2, 3, 'deduct', -1, 'Deducted for menu ID: 11', '2025-08-12 12:01:51'),
(62, 46, 3, 'deduct', -1, 'Deducted for menu ID: 11', '2025-08-12 12:01:51'),
(63, 3, 3, 'deduct', -1, 'Deducted for menu ID: 12', '2025-08-12 12:01:54'),
(64, 4, 3, 'deduct', -1, 'Deducted for menu ID: 12', '2025-08-12 12:01:54'),
(65, 43, 3, 'deduct', -1, 'Deducted for menu ID: 12', '2025-08-12 12:01:54'),
(66, 5, 3, 'deduct', -1, 'Deducted for menu ID: 12', '2025-08-12 12:01:54'),
(67, 2, 3, 'deduct', -1, 'Deducted for menu ID: 12', '2025-08-12 12:01:54'),
(68, 3, 3, 'deduct', -1, 'Deducted for menu ID: 12', '2025-08-12 12:01:55'),
(69, 4, 3, 'deduct', -1, 'Deducted for menu ID: 12', '2025-08-12 12:01:55'),
(70, 43, 3, 'deduct', -1, 'Deducted for menu ID: 12', '2025-08-12 12:01:55'),
(71, 5, 3, 'deduct', -1, 'Deducted for menu ID: 12', '2025-08-12 12:01:55'),
(72, 2, 3, 'deduct', -1, 'Deducted for menu ID: 12', '2025-08-12 12:01:55'),
(73, 26, 3, 'deduct', -1, 'Deducted for menu ID: 10', '2025-08-12 12:02:01'),
(74, 28, 3, 'deduct', -1, 'Deducted for menu ID: 10', '2025-08-12 12:02:01'),
(75, 26, 3, 'deduct', -1, 'Deducted for menu ID: 10', '2025-08-12 12:02:02'),
(76, 28, 3, 'deduct', -1, 'Deducted for menu ID: 10', '2025-08-12 12:02:02'),
(77, 26, 3, 'deduct', -1, 'Deducted for menu ID: 10', '2025-08-12 12:02:03'),
(78, 28, 3, 'deduct', -1, 'Deducted for menu ID: 10', '2025-08-12 12:02:03'),
(79, 13, 3, 'deduct', -1, 'Deducted for menu ID: 5', '2025-08-12 12:02:04'),
(80, 42, 3, 'deduct', -1, 'Deducted for menu ID: 5', '2025-08-12 12:02:04'),
(81, 17, 3, 'deduct', -1, 'Deducted for menu ID: 5', '2025-08-12 12:02:04'),
(82, 3, 3, 'deduct', -1, 'Deducted for menu ID: 5', '2025-08-12 12:02:04'),
(83, 13, 3, 'deduct', -1, 'Deducted for menu ID: 5', '2025-08-12 12:02:04'),
(84, 42, 3, 'deduct', -1, 'Deducted for menu ID: 5', '2025-08-12 12:02:04'),
(85, 17, 3, 'deduct', -1, 'Deducted for menu ID: 5', '2025-08-12 12:02:04'),
(86, 3, 3, 'deduct', -1, 'Deducted for menu ID: 5', '2025-08-12 12:02:04'),
(87, 13, 3, 'deduct', -1, 'Deducted for menu ID: 16', '2025-08-12 12:02:07'),
(88, 7, 3, 'deduct', -1, 'Deducted for menu ID: 16', '2025-08-12 12:02:07'),
(89, 4, 3, 'deduct', -1, 'Deducted for menu ID: 16', '2025-08-12 12:02:07'),
(90, 42, 3, 'deduct', -1, 'Deducted for menu ID: 16', '2025-08-12 12:02:07'),
(91, 11, 3, 'deduct', -1, 'Deducted for menu ID: 16', '2025-08-12 12:02:07'),
(92, 13, 3, 'deduct', -1, 'Deducted for menu ID: 16', '2025-08-12 12:02:08'),
(93, 7, 3, 'deduct', -1, 'Deducted for menu ID: 16', '2025-08-12 12:02:08'),
(94, 4, 3, 'deduct', -1, 'Deducted for menu ID: 16', '2025-08-12 12:02:08'),
(95, 42, 3, 'deduct', -1, 'Deducted for menu ID: 16', '2025-08-12 12:02:08'),
(96, 11, 3, 'deduct', -1, 'Deducted for menu ID: 16', '2025-08-12 12:02:08'),
(97, 32, 3, 'deduct', -1, 'Deducted for menu ID: 11', '2025-08-12 15:12:39'),
(98, 30, 3, 'deduct', -1, 'Deducted for menu ID: 11', '2025-08-12 15:12:39'),
(99, 5, 3, 'deduct', -1, 'Deducted for menu ID: 11', '2025-08-12 15:12:39'),
(100, 43, 3, 'deduct', -1, 'Deducted for menu ID: 11', '2025-08-12 15:12:39'),
(101, 31, 3, 'deduct', -1, 'Deducted for menu ID: 11', '2025-08-12 15:12:39'),
(102, 8, 3, 'deduct', -1, 'Deducted for menu ID: 11', '2025-08-12 15:12:39'),
(103, 2, 3, 'deduct', -1, 'Deducted for menu ID: 11', '2025-08-12 15:12:39'),
(104, 46, 3, 'deduct', -1, 'Deducted for menu ID: 11', '2025-08-12 15:12:39'),
(105, 32, 3, 'deduct', -1, 'Deducted for menu ID: 11', '2025-08-23 02:47:41'),
(106, 30, 3, 'deduct', -1, 'Deducted for menu ID: 11', '2025-08-23 02:47:41'),
(107, 5, 3, 'deduct', -1, 'Deducted for menu ID: 11', '2025-08-23 02:47:41'),
(108, 43, 3, 'deduct', -1, 'Deducted for menu ID: 11', '2025-08-23 02:47:41'),
(109, 31, 3, 'deduct', -1, 'Deducted for menu ID: 11', '2025-08-23 02:47:41'),
(110, 8, 3, 'deduct', -1, 'Deducted for menu ID: 11', '2025-08-23 02:47:41'),
(111, 2, 3, 'deduct', -1, 'Deducted for menu ID: 11', '2025-08-23 02:47:41'),
(112, 46, 3, 'deduct', -1, 'Deducted for menu ID: 11', '2025-08-23 02:47:41'),
(113, 13, 3, 'deduct', -20, 'Deducted for menu ID: 22', '2025-08-23 04:06:36'),
(114, 12, 3, 'deduct', -1, 'Deducted for menu ID: 22', '2025-08-23 04:06:36'),
(115, 5, 3, 'deduct', -1, 'Deducted for menu ID: 22', '2025-08-23 04:06:36'),
(116, 13, 3, 'deduct', -20, 'Deducted for menu ID: 22', '2025-08-23 04:09:06'),
(117, 12, 3, 'deduct', -1, 'Deducted for menu ID: 22', '2025-08-23 04:09:06'),
(118, 5, 3, 'deduct', -1, 'Deducted for menu ID: 22', '2025-08-23 04:09:06');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` enum('admin','kitchen','manager') DEFAULT 'kitchen',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `username`, `password`, `role`, `created_at`) VALUES
(2, 'staff01', 'staff123', 'kitchen', '2025-08-04 15:08:36'),
(3, 'Thas', '$2b$10$dtaIzWy6gyj5XsqBLDyW9O/b1r4691Q8dVQgU901dJTBbxagyREry', 'kitchen', '2025-08-12 01:47:58'),
(4, 'admin', '$2b$10$QBF0MMNr5fFn.ndcg3nOeOBoP7QdvFpZw7Kw6H0jndxlyglakmxNi', 'admin', '2025-08-12 12:05:48'),
(5, 'cp', '$2b$10$jUFhkNpg.AcXxzI..e/Yp.HpuneS36Xz4GXZA8k.zWz4DRpsT0lCO', 'kitchen', '2025-08-13 01:54:17');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cooking_logs`
--
ALTER TABLE `cooking_logs`
  ADD PRIMARY KEY (`log_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `menu_id` (`menu_id`);

--
-- Indexes for table `ingredients`
--
ALTER TABLE `ingredients`
  ADD PRIMARY KEY (`ingredient_id`);

--
-- Indexes for table `menus`
--
ALTER TABLE `menus`
  ADD PRIMARY KEY (`menu_id`);

--
-- Indexes for table `menu_ingredients`
--
ALTER TABLE `menu_ingredients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `menu_id` (`menu_id`),
  ADD KEY `ingredient_id` (`ingredient_id`);

--
-- Indexes for table `stock_logs`
--
ALTER TABLE `stock_logs`
  ADD PRIMARY KEY (`log_id`),
  ADD KEY `ingredient_id` (`ingredient_id`),
  ADD KEY `changed_by` (`changed_by`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cooking_logs`
--
ALTER TABLE `cooking_logs`
  MODIFY `log_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `ingredients`
--
ALTER TABLE `ingredients`
  MODIFY `ingredient_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT for table `menus`
--
ALTER TABLE `menus`
  MODIFY `menu_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `menu_ingredients`
--
ALTER TABLE `menu_ingredients`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=98;

--
-- AUTO_INCREMENT for table `stock_logs`
--
ALTER TABLE `stock_logs`
  MODIFY `log_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=119;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `cooking_logs`
--
ALTER TABLE `cooking_logs`
  ADD CONSTRAINT `cooking_logs_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`),
  ADD CONSTRAINT `cooking_logs_ibfk_2` FOREIGN KEY (`menu_id`) REFERENCES `menus` (`menu_id`);

--
-- Constraints for table `menu_ingredients`
--
ALTER TABLE `menu_ingredients`
  ADD CONSTRAINT `menu_ingredients_ibfk_1` FOREIGN KEY (`menu_id`) REFERENCES `menus` (`menu_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `menu_ingredients_ibfk_2` FOREIGN KEY (`ingredient_id`) REFERENCES `ingredients` (`ingredient_id`) ON DELETE CASCADE;

--
-- Constraints for table `stock_logs`
--
ALTER TABLE `stock_logs`
  ADD CONSTRAINT `stock_logs_ibfk_1` FOREIGN KEY (`ingredient_id`) REFERENCES `ingredients` (`ingredient_id`),
  ADD CONSTRAINT `stock_logs_ibfk_2` FOREIGN KEY (`changed_by`) REFERENCES `users` (`user_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
