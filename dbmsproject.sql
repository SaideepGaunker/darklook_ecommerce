-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 14, 2025 at 06:56 PM
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
-- Database: `dbmsproject`
--

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `id` int(10) NOT NULL,
  `user_id` int(10) NOT NULL,
  `product_id` int(10) NOT NULL,
  `quantity` int(50) NOT NULL DEFAULT 1,
  `total_amount` double(8,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `cart`
--

INSERT INTO `cart` (`id`, `user_id`, `product_id`, `quantity`, `total_amount`) VALUES
(63, 56, 9, 1, 8000.00),
(64, 56, 10, 1, 3000.00),
(65, 57, 9, 1, 8000.00),
(66, 57, 15, 1, 100.00);

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `id` int(10) NOT NULL,
  `product_name` varchar(50) NOT NULL,
  `color` varchar(25) NOT NULL,
  `material` varchar(50) NOT NULL,
  `weight` float NOT NULL,
  `price` double NOT NULL,
  `brand` varchar(50) NOT NULL,
  `image` varchar(50) NOT NULL,
  `model` varchar(50) NOT NULL,
  `desc` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`id`, `product_name`, `color`, `material`, `weight`, `price`, `brand`, `image`, `model`, `desc`) VALUES
(9, 'Rolex Submariner', 'Black', 'Stainless Steel', 150, 8000, 'Rolex', 'product1.jpg', '116610LN', 'The Rolex Day-Date 40 is the epitome of timeless luxury and prestige. Crafted in platinum with an ice-blue dial and fluted bezel, this watch features Rolex’s iconic President bracelet, reserved for the most distinguished models. '),
(10, 'Tag Heuer Carrera', 'Blue', 'Stainless Steel', 160, 3000, 'Tag Heuer', 'product2.jpg', ' CV2014.BA0786', ' The Tag Heuer Carrera is a highly sought-after icon in the world of luxury sports watches. Its distinctive porthole-shaped case, integrated bracelet, and horizontal embossed dial exude sophistication. '),
(13, 'Seiko Prospex Diver', 'Yellow', ' Stainless Steel', 200, 500, 'Seiko', 'product3.jpg', 'SRPD09', 'The Seiko Prospex Diver by Seiko is bold, adventurous, and robust. Known for its oversized design and iconic octagonal bezel with hexagonal screws, it comes with a rubber or leather strap.'),
(14, 'Breitling Navitimer', 'Brown', 'Stainless Steel', 200, 8500, 'Breitling', 'product4.jpg', 'AB0121211B1P1', 'The Breitling Navitimer is a celebration of pure elegance and timeless minimalism. Inspired by designs from the 1950s, it features a slim rose gold case, silvered opaline dial, and dauphine hands.'),
(15, 'Casio G-Shock', 'Black/Red', 'Resin', 70, 100, 'Casio', 'product5.jpg', 'GA2100-1A1', ''),
(16, 'Panerai Luminor', 'Green', 'Stainless Steel', 180, 7000, 'Panerai', 'product6.jpg', 'PAM00753', ''),
(18, 'Tudor Black Bay', 'Red', 'Stainless Steel', 150, 3500, 'Tudor', 'product7.jpg', 'M79230R-0005', ''),
(19, 'Hamilton Khaki Field', 'Green', 'Stainless Steel', 100, 700, 'Hamilton', 'product8.jpg', ' H69439931', ''),
(20, 'Fossil Gen 5', 'Rose Gold', 'Stainless Steel', 150, 300, 'Fossil', 'product9.jpg', ' FTW4018', ''),
(22, 'Longines Master Collection', 'Silver', 'Stainless Steel', 130, 2200, 'Longines ', 'product1.jpg', ' L2.910.4.78.3', ''),
(23, 'IWC Pilot’s Watch', 'Black', 'Stainless Steel', 150, 4500, 'IWC ', 'product9.jpg', 'IW3201', ''),
(24, 'Bell & Ross BR V2-92', 'Blue', 'Stainless Steel', 150, 3600, 'Bell & Ross', 'product2.jpg', ' BRV292-BL-ST/SRB', ''),
(25, 'Oris Aquis Date', 'Blue', 'Stainless Steel', 200, 2200, 'Oris ', 'product3.jpg', ' 733 7653 4153', ''),
(26, 'Montblanc 1858 Automatic', 'Black', 'Stainless Steel', 130, 3000, 'Montblanc', 'product4.jpg', '119223', ''),
(27, 'Citizen Eco-Drive', 'Black', 'Titanium', 120, 600, 'Citizen', 'product5.jpg', 'BM8180-03E', ''),
(28, 'Timex Weekender', 'Green', 'Fabric/Plastic', 50, 40, 'Timex', 'product6.jpg', 'T2N647', ''),
(29, 'Bulova Lunar Pilot', 'Black/Silver', 'Stainless Steel', 150, 500, 'Bulova', 'product7.jpg', '96B258', ''),
(30, 'Rado Captain Cook', 'Brown', 'Stainless Steel', 160, 2000, 'Rado', 'product8.jpg', 'R32500105', '');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(10) NOT NULL,
  `username` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `c_password` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `username`, `email`, `password`, `c_password`) VALUES
(56, 'banti', 'banti@gmail.com', '12345', '12345'),
(57, 'ashvek', 'ashvek@gmail.com', '1234', '1234');

-- --------------------------------------------------------

--
-- Table structure for table `user_detail`
--

CREATE TABLE `user_detail` (
  `id` int(10) NOT NULL,
  `user_id` int(10) DEFAULT NULL,
  `phone_number` varchar(20) DEFAULT NULL,
  `country` varchar(50) DEFAULT NULL,
  `state` varchar(50) DEFAULT NULL,
  `pincode` varchar(10) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `landmark` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user_detail`
--

INSERT INTO `user_detail` (`id`, `user_id`, `phone_number`, `country`, `state`, `pincode`, `address`, `landmark`) VALUES
(16, 56, '34534432', 'india', 'goa', '403410', 'ponda goa', 'molem goa');

-- --------------------------------------------------------

--
-- Table structure for table `wishlist`
--

CREATE TABLE `wishlist` (
  `id` int(10) NOT NULL,
  `product_id` int(10) NOT NULL,
  `user_id` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `wishlist`
--

INSERT INTO `wishlist` (`id`, `product_id`, `user_id`) VALUES
(42, 9, 56),
(44, 14, 57);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_cart` (`product_id`),
  ADD KEY `user_cart` (`user_id`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_detail`
--
ALTER TABLE `user_detail`
  ADD PRIMARY KEY (`id`),
  ADD KEY `TEST` (`user_id`);

--
-- Indexes for table `wishlist`
--
ALTER TABLE `wishlist`
  ADD PRIMARY KEY (`id`),
  ADD KEY `wishlist_to_user` (`user_id`),
  ADD KEY `wishlist_to_product` (`product_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=67;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=58;

--
-- AUTO_INCREMENT for table `user_detail`
--
ALTER TABLE `user_detail`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `wishlist`
--
ALTER TABLE `wishlist`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `cart`
--
ALTER TABLE `cart`
  ADD CONSTRAINT `product_cart` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `user_cart` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `user_detail`
--
ALTER TABLE `user_detail`
  ADD CONSTRAINT `TEST` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `wishlist`
--
ALTER TABLE `wishlist`
  ADD CONSTRAINT `wishlist_to_product` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `wishlist_to_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
