-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 13, 2021 at 11:11 PM
-- Server version: 8.0.23
-- PHP Version: 8.0.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `stockdb`
--
CREATE DATABASE IF NOT EXISTS `stockdb` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `stockdb`;

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
CREATE TABLE `category` (
  `id` int NOT NULL,
  `name` varchar(45) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `parent_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`id`, `name`, `parent_id`) VALUES
(1, 'Electronics', NULL),
(4, 'Mobile phones', 1),
(5, 'Washing machines', 1),
(6, 'Apple', 4),
(7, 'Samsung', 4),
(8, 'Galaxy', 7),
(9, 'Office Products', NULL),
(10, 'Pencils', 9),
(11, 'Pens', 9),
(12, 'Note', 8),
(13, 'A Series', 8),
(14, 'iPhone', 6),
(15, 'iPad', 6);

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
CREATE TABLE `products` (
  `id` int NOT NULL,
  `name` varchar(45) NOT NULL,
  `image_uri` varchar(255) DEFAULT NULL,
  `featured` tinyint(1) NOT NULL,
  `category_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `image_uri`, `featured`, `category_id`) VALUES
(3, 's4', 'file:////s4.png', 0, 8),
(4, 's5', 'file:////s5.png', 1, 8),
(5, '12 pro', 'file:////12pro.png', 0, 14),
(6, '12 pro max', 'file:////12promax.png', 0, 14),
(7, '11 pro', 'file:////11pro.png', 0, 14),
(8, '11 pro max', 'file:////11promax.png', 0, 14),
(9, 'xs', 'file:////xs.png', 0, 14),
(10, 'xs max', 'file:////xsmax.png', 0, 14),
(11, 'x', 'file:////x.png', 0, 14),
(14, 'Pen Blue', 'file:////penblue.png', 0, 11),
(15, 'Pen Red	', 'file:////penred.png', 0, 11),
(16, 'Pen Black', 'file:////penblack.png', 0, 11),
(17, 'Pencil 2B', 'file:////penc2b.png', 0, 10),
(18, 'Pencil 2H	', 'file:////penc2b.png', 0, 10);

-- --------------------------------------------------------

--
-- Table structure for table `product_providers`
--

DROP TABLE IF EXISTS `product_providers`;
CREATE TABLE `product_providers` (
  `products_id` int NOT NULL,
  `providers_id` int NOT NULL,
  `price` double NOT NULL,
  `availabe` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `product_providers`
--

INSERT INTO `product_providers` (`products_id`, `providers_id`, `price`, `availabe`) VALUES
(3, 1, 4850, 1),
(3, 2, 5000, 1),
(4, 1, 6500, 1),
(4, 2, 6800, 0),
(5, 1, 21000, 1),
(5, 2, 21500, 1),
(6, 1, 24500, 1),
(6, 2, 25000, 0),
(7, 1, 1250, 1),
(7, 2, 1270, 1),
(7, 3, 1280, 1),
(7, 4, 1290, 1),
(8, 1, 2110, 1),
(8, 2, 2120, 1),
(8, 3, 2130, 1),
(8, 4, 2140, 1),
(9, 1, 3110, 1),
(9, 2, 3120, 1),
(9, 3, 3140, 1),
(9, 4, 3150, 1),
(10, 1, 4110, 1),
(10, 2, 4120, 1),
(10, 3, 41230, 1),
(10, 4, 4150, 1),
(11, 1, 5110, 1),
(11, 2, 5120, 1),
(11, 3, 5130, 1),
(11, 4, 5140, 1),
(14, 1, 10, 1),
(14, 2, 20, 1),
(14, 3, 40, 1),
(14, 4, 50, 1),
(15, 1, 10, 1),
(15, 2, 20, 1),
(15, 3, 40, 1),
(15, 4, 50, 1),
(16, 1, 10, 1),
(16, 2, 30, 1),
(16, 3, 40, 1),
(16, 4, 50, 1),
(17, 1, 10, 1),
(17, 2, 20, 1),
(17, 3, 30, 1),
(17, 4, 40, 1),
(18, 1, 10, 1),
(18, 2, 20, 1),
(18, 3, 40, 1),
(18, 4, 50, 1);

-- --------------------------------------------------------

--
-- Table structure for table `providers`
--

DROP TABLE IF EXISTS `providers`;
CREATE TABLE `providers` (
  `id` int NOT NULL,
  `name` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `providers`
--

INSERT INTO `providers` (`id`, `name`) VALUES
(1, 'ABC Traders'),
(2, 'XYZ Company'),
(3, 'LTT Trading'),
(4, 'MTA Company');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`),
  ADD KEY `parent_id_key` (`parent_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `category_id` (`category_id`);

--
-- Indexes for table `product_providers`
--
ALTER TABLE `product_providers`
  ADD PRIMARY KEY (`products_id`,`providers_id`),
  ADD KEY `providers_id` (`providers_id`);

--
-- Indexes for table `providers`
--
ALTER TABLE `providers`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `product_providers`
--
ALTER TABLE `product_providers`
  MODIFY `products_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `providers`
--
ALTER TABLE `providers`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `category`
--
ALTER TABLE `category`
  ADD CONSTRAINT `parent_id_fk` FOREIGN KEY (`parent_id`) REFERENCES `category` (`id`);

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `category_id` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `product_providers`
--
ALTER TABLE `product_providers`
  ADD CONSTRAINT `products_id` FOREIGN KEY (`products_id`) REFERENCES `products` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `providers_id` FOREIGN KEY (`providers_id`) REFERENCES `providers` (`id`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
