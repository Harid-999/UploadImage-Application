-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 18, 2021 at 01:41 PM
-- Server version: 10.4.17-MariaDB
-- PHP Version: 7.3.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `termproject`
--

-- --------------------------------------------------------

--
-- Table structure for table `img`
--

CREATE TABLE `img` (
  `id` int(11) NOT NULL,
  `image` text NOT NULL,
  `code` varchar(13) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `img`
--

INSERT INTO `img` (`id`, `image`, `code`) VALUES
(1, 'pic.1.9 (1).jpg', '61523206032-2'),
(2, 'pic.1.8 (1).jpg', '61523206032-2'),
(3, 'pic.1.6 (1).jpg', '61523206032-2'),
(4, 'pic.1.5 (1).jpg', '61523206032-2'),
(5, 'pic.1.7 (1).jpg', '61523206032-2'),
(6, 'pic.1.4 (1).jpg', '61523206032-2'),
(7, 'pic.1.0 (1).jpg', '61523206032-2'),
(13, 'pic.1.30 (1).jpg', '61523206018-8'),
(14, 'pic.1.31 (1).jpg', '61523206018-8'),
(15, 'pic.1.1 (1).jpg', '61523206032-2'),
(16, 'pic.1.2 (1).jpg', '61523206032-2'),
(17, 'pic.1.3 (1).jpg', '61523206032-2'),
(18, 'pic.1.4 (1).jpg', '61523206032-2'),
(19, 'pic.1.2 (1).jpg', '61523206032-2'),
(20, 'pic.1.1 (1).jpg', '61523206032-2'),
(21, 'pic.1.3 (1).jpg', '61523206032-2');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `lastname` varchar(100) NOT NULL,
  `code` varchar(13) NOT NULL,
  `department` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `username`, `password`, `name`, `lastname`, `code`, `department`) VALUES
(1, 'harid', '123456', 'หฤษฎ์', 'พรหมศรี', '61523206032-2', 'วิศวกรรมคอมพิวเตอร์'),
(2, 'kasin', '222333', 'กษิณ', 'จิตรเจิญ', '61523206018-8', 'วิศวกรรมคอมพิวเตอร์');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `img`
--
ALTER TABLE `img`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `img`
--
ALTER TABLE `img`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
