-- phpMyAdmin SQL Dump
-- version 5.1.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:8889
-- Generation Time: Nov 07, 2023 at 11:48 AM
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
-- Database: `bank`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `DepositMoney` (`accountID` INT, `depositAmount` FLOAT)   BEGIN
    DECLARE currentBalance FLOAT;
    
    -- Get the current balance of the account
    SELECT bal INTO currentBalance FROM account WHERE ID = accountID;
    
    -- Update the balance by adding the deposit amount
    SET currentBalance = currentBalance + depositAmount;
    
    -- Update the 'bal' column with the new balance
    UPDATE account SET bal = currentBalance WHERE ID = accountID;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `WithdrawMoney` (`accountID` INT, `withdrawAmount` FLOAT)   BEGIN
    DECLARE currentBalance FLOAT;
    
    -- Get the current balance of the account
    SELECT bal INTO currentBalance FROM account WHERE ID = accountID;
    
    -- Check if there is enough balance to withdraw
    IF currentBalance >= withdrawAmount THEN
        -- Update the balance by subtracting the withdraw amount
        SET currentBalance = currentBalance - withdrawAmount;
        
        -- Update the 'bal' column with the new balance
        UPDATE account SET bal = currentBalance WHERE ID = accountID;
    ELSE
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Not enough money';
    END IF;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `accounts`
--

CREATE TABLE `accounts` (
  `account_id` int(11) NOT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `account_type` enum('Checking','Savings','Loan') DEFAULT NULL,
  `balance` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `accounts`
--

INSERT INTO `accounts` (`account_id`, `customer_id`, `account_type`, `balance`) VALUES
(1, 1, 'Checking', '5000.00'),
(2, 1, 'Savings', '10000.00'),
(3, 2, 'Checking', '3000.00');

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `customer_id` int(11) NOT NULL,
  `first_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `phone_number` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`customer_id`, `first_name`, `last_name`, `email`, `phone_number`) VALUES
(1, 'Alice', 'Johnson', 'alice@example.com', '123-456-7890'),
(2, 'Bob', 'Smith', 'bob@example.com', '987-654-3210');

-- --------------------------------------------------------

--
-- Table structure for table `transactinos`
--

CREATE TABLE `transactinos` (
  `transaction_id` int(11) NOT NULL,
  `account_id` int(11) DEFAULT NULL,
  `transaction_date` date DEFAULT NULL,
  `amount` decimal(10,2) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `transactinos`
--

INSERT INTO `transactinos` (`transaction_id`, `account_id`, `transaction_date`, `amount`, `description`) VALUES
(1, 1, '2023-09-01', '-1000.00', 'Withdrawal'),
(2, 1, '2023-09-05', '2000.00', 'Deposit'),
(3, 2, '2023-09-02', '-500.00', 'Withdrawal'),
(4, 3, '2023-09-07', '1000.00', 'Deposit');

--
-- Triggers `transactinos`
--
DELIMITER $$
CREATE TRIGGER `CheckBalanceBeforeInsert` BEFORE INSERT ON `transactinos` FOR EACH ROW BEGIN
    DECLARE currentBalance FLOAT;
    
    SELECT bal INTO currentBalance FROM account WHERE ID = NEW.account_id;
    
    IF currentBalance < NEW.amount THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Not enough money';
    END IF;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `PreventTransactionEdit` BEFORE UPDATE ON `transactinos` FOR EACH ROW BEGIN
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Transaction edit is not allowed';
END
$$
DELIMITER ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `accounts`
--
ALTER TABLE `accounts`
  ADD PRIMARY KEY (`account_id`),
  ADD KEY `customer_id` (`customer_id`);

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`customer_id`);

--
-- Indexes for table `transactinos`
--
ALTER TABLE `transactinos`
  ADD PRIMARY KEY (`transaction_id`),
  ADD KEY `account_id` (`account_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `accounts`
--
ALTER TABLE `accounts`
  MODIFY `account_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `customer_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `transactinos`
--
ALTER TABLE `transactinos`
  MODIFY `transaction_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `accounts`
--
ALTER TABLE `accounts`
  ADD CONSTRAINT `accounts_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`customer_id`);

--
-- Constraints for table `transactinos`
--
ALTER TABLE `transactinos`
  ADD CONSTRAINT `transactinos_ibfk_1` FOREIGN KEY (`account_id`) REFERENCES `accounts` (`account_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
