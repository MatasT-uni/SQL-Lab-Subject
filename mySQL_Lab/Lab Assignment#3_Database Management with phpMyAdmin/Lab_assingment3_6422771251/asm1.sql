-- phpMyAdmin SQL Dump
-- version 5.1.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Sep 06, 2023 at 01:17 PM
-- Server version: 5.7.24
-- PHP Version: 8.0.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `asm1`
--

-- --------------------------------------------------------

--
-- Table structure for table `course`
--

CREATE TABLE `course` (
  `C_ID` int(11) NOT NULL,
  `C_code` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `C_no` int(11) NOT NULL,
  `C_name` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `course`
--

INSERT INTO `course` (`C_ID`, `C_code`, `C_no`, `C_name`) VALUES
(4576, 'ITS341', 45, 'Programming'),
(4576, 'ITS341', 45, 'Programming'),
(2345, 'GC124', 24, 'Critical Thinking'),
(1458, 'ME231', 12, 'CAD/CAM'),
(2345, 'GC124', 24, 'Critical Thinking');

-- --------------------------------------------------------

--
-- Table structure for table `registration`
--

CREATE TABLE `registration` (
  `R_ID` int(11) NOT NULL,
  `St_ID` bigint(20) NOT NULL,
  `S_ID` bigint(20) NOT NULL,
  `Grade` varchar(2) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `registration`
--

INSERT INTO `registration` (`R_ID`, `St_ID`, `S_ID`, `Grade`) VALUES
(602, 6022040411, 623, 'A'),
(603, 6022040412, 625, 'B'),
(604, 6022040413, 354, 'A'),
(605, 6022040414, 267, 'C'),
(606, 6022040415, 147, 'A');

-- --------------------------------------------------------

--
-- Table structure for table `section`
--

CREATE TABLE `section` (
  `S_ID` bigint(11) NOT NULL,
  `C_ID` int(11) NOT NULL,
  `S_no` int(11) NOT NULL,
  `Year` year(4) NOT NULL,
  `Semester` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `section`
--

INSERT INTO `section` (`S_ID`, `C_ID`, `S_no`, `Year`, `Semester`) VALUES
(623, 4576, 1, 2019, 1),
(625, 4576, 3, 2019, 1),
(354, 2345, 2, 2019, 1),
(267, 1458, 1, 2020, 2),
(147, 2345, 2, 2020, 2);

-- --------------------------------------------------------

--
-- Table structure for table `student`
--

CREATE TABLE `student` (
  `student_ID` bigint(11) NOT NULL,
  `F_name` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL,
  `L_name` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Sex` varchar(6) COLLATE utf8mb4_unicode_ci NOT NULL,
  `City` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Curriculum` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `DOB` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `student`
--

INSERT INTO `student` (`student_ID`, `F_name`, `L_name`, `Sex`, `City`, `Curriculum`, `DOB`) VALUES
(6022040411, 'Adam', 'Phelps', 'Male', 'New York', 'ICT', '2000-07-24'),
(6022040412, 'Mark', 'Twain', 'Male', 'Los Angeles', 'ICT', '2002-07-27'),
(6022040413, 'Shania', 'Judith', 'Female', 'New York', 'CIVIL', '2001-05-19'),
(6022040414, 'Angelina', 'Rosswell', 'Female', 'California', 'MECHANICAL', '2002-07-27'),
(6022040415, 'Thomas', 'Hardy', 'Male', 'New York', 'MANAGEMENT', '2006-03-19');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `course`
--
ALTER TABLE `course`
  ADD KEY `C_ID` (`C_ID`),
  ADD KEY `C_no` (`C_no`);

--
-- Indexes for table `registration`
--
ALTER TABLE `registration`
  ADD PRIMARY KEY (`R_ID`),
  ADD KEY `St_ID` (`St_ID`,`S_ID`),
  ADD KEY `S_ID` (`S_ID`);

--
-- Indexes for table `section`
--
ALTER TABLE `section`
  ADD KEY `C_ID` (`C_ID`),
  ADD KEY `S_ID` (`S_ID`);

--
-- Indexes for table `student`
--
ALTER TABLE `student`
  ADD PRIMARY KEY (`student_ID`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `registration`
--
ALTER TABLE `registration`
  ADD CONSTRAINT `registration_ibfk_1` FOREIGN KEY (`St_ID`) REFERENCES `student` (`student_ID`),
  ADD CONSTRAINT `registration_ibfk_2` FOREIGN KEY (`S_ID`) REFERENCES `section` (`S_ID`);

--
-- Constraints for table `section`
--
ALTER TABLE `section`
  ADD CONSTRAINT `section_ibfk_1` FOREIGN KEY (`C_ID`) REFERENCES `course` (`C_ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
