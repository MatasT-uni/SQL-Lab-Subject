-- phpMyAdmin SQL Dump
-- version 5.1.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Sep 13, 2023 at 09:44 AM
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
-- Database: `lab4assignment`
--

-- --------------------------------------------------------

--
-- Table structure for table `course`
--

CREATE TABLE `course` (
  `Course_ID` int(11) NOT NULL,
  `Course_code` varchar(9) DEFAULT NULL,
  `Course_name` varchar(30) DEFAULT NULL,
  `Course_no` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `course`
--

INSERT INTO `course` (`Course_ID`, `Course_code`, `Course_name`, `Course_no`) VALUES
(1458, 'ME231', 'CAD/CAM', 12),
(2345, 'GC124', 'Critical Thinking', 24),
(4576, 'ITS341', 'Programming', 45);

-- --------------------------------------------------------

--
-- Table structure for table `registration`
--

CREATE TABLE `registration` (
  `Registration_ID` int(10) UNSIGNED NOT NULL,
  `Student_ID` bigint(20) UNSIGNED DEFAULT NULL,
  `Section_ID` int(10) UNSIGNED DEFAULT NULL,
  `Grade` varchar(2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `registration`
--

INSERT INTO `registration` (`Registration_ID`, `Student_ID`, `Section_ID`, `Grade`) VALUES
(602, 6022040411, 623, 'A'),
(603, 6022040412, 625, 'B'),
(604, 6022040413, 354, 'A'),
(605, 6022040414, 267, 'B+'),
(606, 6022040415, 147, 'A');

-- --------------------------------------------------------

--
-- Table structure for table `section`
--

CREATE TABLE `section` (
  `Section_ID` int(10) UNSIGNED NOT NULL,
  `Section_no` int(11) DEFAULT NULL,
  `Course_ID` int(11) DEFAULT NULL,
  `Year` int(11) DEFAULT NULL,
  `Semester` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `section`
--

INSERT INTO `section` (`Section_ID`, `Section_no`, `Course_ID`, `Year`, `Semester`) VALUES
(147, 2, 2345, 2020, 2),
(267, 1, 1458, 2020, 2),
(354, 2, 2345, 2019, 1),
(623, 1, 4576, 2019, 1),
(625, 3, 4576, 2019, 1);

-- --------------------------------------------------------

--
-- Table structure for table `student`
--

CREATE TABLE `student` (
  `Student_ID` bigint(20) UNSIGNED NOT NULL,
  `First_name` varchar(30) DEFAULT NULL,
  `Last_name` varchar(30) DEFAULT NULL,
  `Sex` varchar(6) DEFAULT NULL,
  `City` varchar(30) DEFAULT NULL,
  `Curriculum` varchar(15) DEFAULT NULL,
  `DOB` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `student`
--

INSERT INTO `student` (`Student_ID`, `First_name`, `Last_name`, `Sex`, `City`, `Curriculum`, `DOB`) VALUES
(6022040411, 'Adam', 'Phelps', 'Male', 'New York', 'ICT', '2000-07-24'),
(6022040412, 'Mark', 'Twain', 'Male', 'Los Angeles', 'ICT', '2002-09-13'),
(6022040413, 'Shania', 'Judith', 'Female', 'New York', 'CIVIL', '2001-05-19'),
(6022040414, 'Angelina', 'Rosswell', 'Female', 'California', 'MECHANICAL', '2006-07-27'),
(6022040415, 'Thomas', 'Hardy', 'Male', 'New York', 'MANAGEMENT', '2006-03-19');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `course`
--
ALTER TABLE `course`
  ADD PRIMARY KEY (`Course_ID`);

--
-- Indexes for table `registration`
--
ALTER TABLE `registration`
  ADD PRIMARY KEY (`Registration_ID`),
  ADD KEY `FK_Student_ID` (`Student_ID`),
  ADD KEY `FK_Section_ID` (`Section_ID`);

--
-- Indexes for table `section`
--
ALTER TABLE `section`
  ADD PRIMARY KEY (`Section_ID`),
  ADD KEY `FK_Course_ID` (`Course_ID`);

--
-- Indexes for table `student`
--
ALTER TABLE `student`
  ADD PRIMARY KEY (`Student_ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `registration`
--
ALTER TABLE `registration`
  MODIFY `Registration_ID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=607;

--
-- AUTO_INCREMENT for table `student`
--
ALTER TABLE `student`
  MODIFY `Student_ID` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6022040416;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `registration`
--
ALTER TABLE `registration`
  ADD CONSTRAINT `FK_Section_ID` FOREIGN KEY (`Section_ID`) REFERENCES `section` (`Section_ID`),
  ADD CONSTRAINT `FK_Student_ID` FOREIGN KEY (`Student_ID`) REFERENCES `student` (`Student_ID`);

--
-- Constraints for table `section`
--
ALTER TABLE `section`
  ADD CONSTRAINT `FK_Course_ID` FOREIGN KEY (`Course_ID`) REFERENCES `course` (`Course_ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
