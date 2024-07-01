-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 24, 2023 at 06:05 PM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `blood bank system`
--

-- --------------------------------------------------------

--
-- Table structure for table `blood`
--

CREATE TABLE `blood` (
  `Blood_Quantity` int(11) DEFAULT NULL,
  `Blood_Type` varchar(3) DEFAULT NULL,
  `Blood_Cost` decimal(10,2) DEFAULT NULL,
  `Blood_Draw_Date` varchar(10) DEFAULT NULL,
  `D_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `bloodbank`
--

CREATE TABLE `bloodbank` (
  `B_ID` int(11) NOT NULL,
  `B_Name` varchar(100) NOT NULL,
  `B_Address` varchar(100) DEFAULT NULL,
  `B_Number` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `bloodbank`
--

INSERT INTO `bloodbank` (`B_ID`, `B_Name`, `B_Address`, `B_Number`) VALUES
(1, 'Tripoli_BB', 'Tripoli', '06/123654');

-- --------------------------------------------------------

--
-- Table structure for table `deliver`
--

CREATE TABLE `deliver` (
  `P_ID` int(11) NOT NULL,
  `H_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `donates`
--

CREATE TABLE `donates` (
  `B_ID` int(11) NOT NULL,
  `D_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `donor`
--

CREATE TABLE `donor` (
  `D_ID` int(11) NOT NULL,
  `D_Fname` varchar(20) NOT NULL,
  `D_Lname` varchar(20) NOT NULL,
  `D_Gender` varchar(10) DEFAULT NULL,
  `D_Address` varchar(100) DEFAULT NULL,
  `D_Number` varchar(15) DEFAULT NULL,
  `D_Age` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `donor`
--

INSERT INTO `donor` (`D_ID`, `D_Fname`, `D_Lname`, `D_Gender`, `D_Address`, `D_Number`, `D_Age`) VALUES
(1, 'Azzam', 'Haffar', 'Male', 'Koura', '03/411514', 19),
(2, 'Abir', 'Dabliz', 'Female', 'Abou Samra', '71/458796', 25),
(3, 'Sara', 'Ali', 'Female', 'Jbeil', '81/456665', 28),
(4, 'Mhamad', 'Ahmad', 'Male', 'Akkar', '76/456987', 21);

-- --------------------------------------------------------

--
-- Table structure for table `employee`
--

CREATE TABLE `employee` (
  `E_Fname` varchar(20) NOT NULL,
  `E_Lname` varchar(20) NOT NULL,
  `E_Address` varchar(100) DEFAULT NULL,
  `E_Age` int(11) DEFAULT NULL,
  `E_ID` int(11) NOT NULL,
  `E_Position` varchar(100) DEFAULT NULL,
  `B_ID` int(11) DEFAULT NULL,
  `E_Salary` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `employee`
--

INSERT INTO `employee` (`E_Fname`, `E_Lname`, `E_Address`, `E_Age`, `E_ID`, `E_Position`, `B_ID`, `E_Salary`) VALUES
('Saly', 'Malak', 'Tripoli', 25, 1, 'Manager', 1, '5000.00'),
('Amir', 'Karam', 'Akkar', 30, 2, 'Employee', 1, '500.00'),
('Sara', 'AL Ali', 'Btaroun', 24, 3, 'Employee', 1, '400.00'),
('Khaled', 'Ahmad', 'Tripoli', 30, 4, 'Employee', 1, '350.00');

-- --------------------------------------------------------

--
-- Table structure for table `hospital`
--

CREATE TABLE `hospital` (
  `H_ID` int(11) NOT NULL,
  `H_Name` varchar(100) NOT NULL,
  `H_Address` varchar(100) DEFAULT NULL,
  `H_Number` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `B_ID` int(11) NOT NULL,
  `H_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `patient`
--

CREATE TABLE `patient` (
  `P_ID` int(11) NOT NULL,
  `P_Fname` varchar(20) NOT NULL,
  `P_Lname` varchar(20) DEFAULT NULL,
  `P_Gender` varchar(10) DEFAULT NULL,
  `P_Address` varchar(100) DEFAULT NULL,
  `P_Age` int(11) DEFAULT NULL,
  `P_Number` varchar(15) DEFAULT NULL,
  `P_BloodType_Request` varchar(3) DEFAULT NULL,
  `P_BloodQuantity` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `patient`
--

INSERT INTO `patient` (`P_ID`, `P_Fname`, `P_Lname`, `P_Gender`, `P_Address`, `P_Age`, `P_Number`, `P_BloodType_Request`, `P_BloodQuantity`) VALUES
(1, 'Dani', 'Haydar', 'Male', 'Tripoli', 21, '03/123568', 'A+', 2),
(2, 'Daniella', 'Taleb', 'Female', 'Jbeil', 19, '81/123568', 'B-', 6),
(3, 'Hadi', 'Hamzeh', 'Male', 'Akkar', 30, '76/123568', 'AB+', 1),
(4, 'Samia', 'Haydar', 'Female', 'Tripoli', 24, '03/223568', 'O-', 2);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `blood`
--
ALTER TABLE `blood`
  ADD PRIMARY KEY (`D_ID`);

--
-- Indexes for table `bloodbank`
--
ALTER TABLE `bloodbank`
  ADD PRIMARY KEY (`B_ID`);

--
-- Indexes for table `deliver`
--
ALTER TABLE `deliver`
  ADD PRIMARY KEY (`P_ID`,`H_ID`),
  ADD KEY `fk_deliver_hospital` (`H_ID`);

--
-- Indexes for table `donates`
--
ALTER TABLE `donates`
  ADD PRIMARY KEY (`B_ID`,`D_ID`),
  ADD KEY `fk_donates_donor` (`D_ID`);

--
-- Indexes for table `donor`
--
ALTER TABLE `donor`
  ADD PRIMARY KEY (`D_ID`);

--
-- Indexes for table `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`E_ID`),
  ADD KEY `fk_employee_bloodbank` (`B_ID`);

--
-- Indexes for table `hospital`
--
ALTER TABLE `hospital`
  ADD PRIMARY KEY (`H_ID`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`B_ID`,`H_ID`),
  ADD KEY `fk_order_hospital` (`H_ID`);

--
-- Indexes for table `patient`
--
ALTER TABLE `patient`
  ADD PRIMARY KEY (`P_ID`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `blood`
--
ALTER TABLE `blood`
  ADD CONSTRAINT `fk_blood_donor` FOREIGN KEY (`D_ID`) REFERENCES `donor` (`D_ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `deliver`
--
ALTER TABLE `deliver`
  ADD CONSTRAINT `fk_deliver_hospital` FOREIGN KEY (`H_ID`) REFERENCES `hospital` (`H_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_deliver_patient` FOREIGN KEY (`P_ID`) REFERENCES `patient` (`P_ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `donates`
--
ALTER TABLE `donates`
  ADD CONSTRAINT `fk_donates_bloodbank` FOREIGN KEY (`B_ID`) REFERENCES `bloodbank` (`B_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_donates_donor` FOREIGN KEY (`D_ID`) REFERENCES `donor` (`D_ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `employee`
--
ALTER TABLE `employee`
  ADD CONSTRAINT `fk_employee_bloodbank` FOREIGN KEY (`B_ID`) REFERENCES `bloodbank` (`B_ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `fk_order_bloodbank` FOREIGN KEY (`B_ID`) REFERENCES `bloodbank` (`B_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_order_hospital` FOREIGN KEY (`H_ID`) REFERENCES `hospital` (`H_ID`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
