-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Oct 13, 2019 at 03:00 PM
-- Server version: 5.7.19
-- PHP Version: 7.1.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `lentochanges`
--

-- --------------------------------------------------------

--
-- Table structure for table `uom`
--

DROP TABLE IF EXISTS `uom`;
CREATE TABLE IF NOT EXISTS `uom` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(50) NOT NULL,
  `description` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `uom`
--

INSERT INTO `uom` (`id`, `code`, `description`) VALUES
(1, 'CVR', 'COVER'),
(2, 'BAG', 'Bag'),
(3, 'BKT', 'Bucket'),
(4, 'BND', 'Bundle'),
(5, 'BOWL', 'Bowl'),
(6, 'BX', 'Box'),
(7, 'CRD', 'Card'),
(8, 'CAN', 'Cans'),
(9, 'CM', 'Centimeters'),
(10, 'CS', 'Case'),
(11, 'CTN', 'Carton'),
(12, 'DZ', 'Dozen'),
(13, 'DRM', 'Drums'),
(14, 'EA', 'Each'),
(15, 'FT', 'Foot'),
(16, 'GAL', 'Gallon'),
(17, 'GROSS', 'Gross'),
(18, 'IN', 'Inches'),
(19, 'KIT', 'Kit'),
(20, 'LOT', 'Lot'),
(21, 'M', 'Meter'),
(22, 'MM', 'Millimeter'),
(23, 'PC', 'Piece'),
(24, 'PK', 'Pack'),
(25, 'PK100', 'Pack 100'),
(26, 'PK50', 'Pack 50'),
(27, 'PR', 'Pair'),
(28, 'RACK', 'Rack'),
(29, 'RL', 'Roll'),
(30, 'SET', 'Set'),
(31, 'SET3', 'Set of 3'),
(32, 'SET4', 'Set of 4'),
(33, 'SET5', 'Set of 5'),
(34, 'SGL', 'Single'),
(35, 'SHT', 'Sheet'),
(36, 'SQFT', 'Square ft'),
(37, 'TUBE', 'Tube'),
(38, 'YD', 'Yard'),
(39, 'KGS', 'Kiliograms'),
(40, 'KLR', 'Kilolitter'),
(41, 'NOS', 'Numbers'),
(42, 'TON ', 'Tonnes'),
(43, 'TUB ', 'Tubes'),
(44, 'BTL', 'Bottles'),
(45, 'UNT', 'Units'),
(46, 'OTH', 'Others'),
(47, 'CVR', 'COVER');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
