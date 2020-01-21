-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 21, 2020 at 03:23 AM
-- Server version: 10.1.38-MariaDB
-- PHP Version: 5.6.40

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
-- Table structure for table `petty_cas_conv`
--

CREATE TABLE `petty_cas_conv` (
  `id` int(10) NOT NULL,
  `conv_id` varchar(20) NOT NULL,
  `conv_amt` decimal(10,2) NOT NULL,
  `handler` varchar(100) NOT NULL,
  `conv_remarks` text NOT NULL,
  `conv_orgid` varchar(20) NOT NULL,
  `conv_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `petty_cas_conv`
--

INSERT INTO `petty_cas_conv` (`id`, `conv_id`, `conv_amt`, `handler`, `conv_remarks`, `conv_orgid`, `conv_date`) VALUES
(6, 'CONV001', '12.00', 'Lento', '', 'COMP001', '2020-01-18 04:29:10'),
(7, 'CONV007', '12.00', 'Lento', '', 'COMP001', '2020-01-18 04:29:25'),
(8, 'CONV008', '12.00', 'Lento', '', 'COMP001', '2020-01-18 04:29:39'),
(9, 'CONV009', '12.00', 'Lento', 'sasas', 'COMP001', '2020-01-18 04:29:49'),
(10, 'CONV0010', '12.00', 'Lento', 'sasas', 'COMP001', '2020-01-18 04:40:06'),
(11, 'CONV0011', '11.00', 'Lento', 'aSasd', 'COMP001', '2020-01-18 04:41:14'),
(12, 'CONV0012', '12.00', 'Lento', '', 'COMP001', '2020-01-18 04:41:34'),
(13, 'CONV0013', '1.00', 'Lento', '', 'COMP001', '2020-01-18 04:44:11'),
(14, 'CONV0014', '1.00', 'Lento', 'assd', 'COMP001', '2020-01-18 04:46:56'),
(15, 'CONV0015', '1.00', 'Lento', '', 'COMP001', '2020-01-19 06:28:41'),
(16, 'CONV0016', '12.00', 'Lento', '', 'COMP001', '2020-01-20 04:55:01'),
(17, 'CONV0017', '4.00', 'Lento', '', 'COMP001', '2020-01-20 04:56:04');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `petty_cas_conv`
--
ALTER TABLE `petty_cas_conv`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `petty_cas_conv`
--
ALTER TABLE `petty_cas_conv`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
