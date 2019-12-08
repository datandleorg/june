-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 08, 2019 at 04:41 AM
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
-- Table structure for table `transactions`
--

CREATE TABLE `transactions` (
  `id` int(10) NOT NULL,
  `trans_id` varchar(15) NOT NULL,
  `trans_type` varchar(10) NOT NULL,
  `trans_amt` decimal(10,2) NOT NULL,
  `trans_mode` varchar(15) NOT NULL,
  `trans_bank` varchar(10) NOT NULL,
  `total_closing_bal` decimal(10,2) NOT NULL,
  `total_cash_on_hand` decimal(10,2) NOT NULL,
  `total_petty_cash` decimal(10,2) NOT NULL,
  `trans_entry` text NOT NULL,
  `trans_status` varchar(10) NOT NULL,
  `trans_handler` varchar(50) NOT NULL,
  `trans_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `transactions`
--

INSERT INTO `transactions` (`id`, `trans_id`, `trans_type`, `trans_amt`, `trans_mode`, `trans_bank`, `total_closing_bal`, `total_cash_on_hand`, `total_petty_cash`, `trans_entry`, `trans_status`, `trans_handler`, `trans_date`) VALUES
(107, 'TRN-001', 'debit', '100.00', 'Cheque', '001', '-100.00', '0.00', '0.00', '{\"data\":{\"v_credits_vendorid\":\"00001\",\"v_credits_paymentmode\":\"Cheque\",\"v_credits_cheque_status\":\"Uncleared\",\"v_credits_bank\":\"001\",\"v_credits_ref_no\":\"\",\"v_credits_paymentdate\":\"2019-12-07\",\"v_credits_amount\":\"100.00\",\"v_credits_handler\":\"Lento\",\"v_credits_notes\":\"asdsd\",\"table\":\"vendorcredits\",\"v_credits_email_notification\":\"no\"},\"rowId\":\"CN0051\",\"colName\":\"v_credits_id\",\"entity\":\"Vendor Credits\"}', 'Uncleared', 'Lento', '2019-12-07 17:37:12');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `transactions`
--
ALTER TABLE `transactions`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=108;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
