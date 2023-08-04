-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 28, 2023 at 08:43 AM
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
-- Database: `database1`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `getadmin` ()   SELECT * FROM ADMIN$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `ADMIN_ID` varchar(50) NOT NULL,
  `ADMIN_NAME` varchar(100) NOT NULL,
  `A_PASSWORD` varchar(100) NOT NULL,
  `POST` varchar(100) NOT NULL,
  `EMAIL` varchar(100) NOT NULL,
  `CONTACT_NO` varchar(100) NOT NULL,
  `DOB` date NOT NULL,
  `QUALIFICATION` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`ADMIN_ID`, `ADMIN_NAME`, `A_PASSWORD`, `POST`, `EMAIL`, `CONTACT_NO`, `DOB`, `QUALIFICATION`) VALUES
('800', 'nagendra tb', '21232f297a57a5a743894a0e4a801fc3', 'manager', 'nag@gmail.com', '0987654311', '2023-01-27', 'MTECH');

-- --------------------------------------------------------

--
-- Table structure for table `company`
--

CREATE TABLE `company` (
  `COMPANY_ID` varchar(50) NOT NULL,
  `COMPANY_NAME` varchar(50) NOT NULL,
  `C_PASSWORD` varchar(50) NOT NULL,
  `WEBSITE` varchar(500) NOT NULL,
  `ADDRESS` varchar(100) NOT NULL,
  `STATUS` varchar(50) DEFAULT 'visiting',
  `COMING_DATE` date NOT NULL,
  `APPROVAL` varchar(50) DEFAULT 'not approved'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `companybranch`
--

CREATE TABLE `companybranch` (
  `COMPANY_NAME` varchar(100) NOT NULL,
  `C_TYPE` varchar(50) NOT NULL,
  `BRANCH` varchar(50) NOT NULL,
  `MIN_CGPA` double DEFAULT NULL,
  `MAX_BACKLOGS` int(11) DEFAULT 0,
  `MAX_SALARY` double DEFAULT NULL,
  `MAX_STIPEND` double DEFAULT NULL,
  `JOB_PROFILE` varchar(100) DEFAULT NULL,
  `PLACE_OF_POSTING` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `intern_notification`
--

CREATE TABLE `intern_notification` (
  `noti` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `place_notification`
--

CREATE TABLE `place_notification` (
  `noti` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `registered_interns`
--

CREATE TABLE `registered_interns` (
  `STUDENT_ID` varchar(50) NOT NULL,
  `STUDENT_NAME` varchar(100) NOT NULL,
  `COMPANY_NAME` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `registered_placements`
--

CREATE TABLE `registered_placements` (
  `STUDENT_ID` varchar(50) NOT NULL,
  `STUDENT_NAME` varchar(100) NOT NULL,
  `COMPANY_NAME` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `student`
--

CREATE TABLE `student` (
  `STUDENT_ID` varchar(50) NOT NULL,
  `S_PASSWORD` varchar(100) NOT NULL,
  `STUDENT_NAME` varchar(100) NOT NULL,
  `GENDER` varchar(100) NOT NULL,
  `DOB` date NOT NULL,
  `EMAIL` varchar(100) NOT NULL,
  `ADDRESS` varchar(100) NOT NULL,
  `CONTACT_NO` varchar(100) NOT NULL,
  `BRANCH` varchar(100) NOT NULL,
  `TENTH_PER` varchar(100) NOT NULL,
  `TENTH_PASS_YEAR` int(11) NOT NULL,
  `TWELTH_PER` varchar(100) NOT NULL,
  `TWELTH_PASS_YEAR` int(11) NOT NULL,
  `CGPA` double NOT NULL,
  `PASSING_YEAR` int(11) NOT NULL,
  `BACKLOGS` int(11) NOT NULL,
  `APPLY_FOR` varchar(100) NOT NULL,
  `STATUS` varchar(50) DEFAULT 'NS',
  `APPLY_COUNT` int(11) DEFAULT 0,
  `ABSENT` int(11) DEFAULT 0,
  `IMAGE` longblob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `student_internship`
--

CREATE TABLE `student_internship` (
  `STUDENT_ID` varchar(50) NOT NULL,
  `COMPANY_ID` varchar(100) NOT NULL,
  `STUDENT_NAME` varchar(100) NOT NULL,
  `COMPANY_NAME` varchar(100) NOT NULL,
  `STIPEND` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `student_placement`
--

CREATE TABLE `student_placement` (
  `STUDENT_ID` varchar(50) NOT NULL,
  `COMPANY_ID` varchar(100) NOT NULL,
  `STUDENT_NAME` varchar(100) NOT NULL,
  `COMPANY_NAME` varchar(100) NOT NULL,
  `PACKAGE` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `trig`
--

CREATE TABLE `trig` (
  `id` int(11) NOT NULL,
  `admin_id` int(11) NOT NULL,
  `action` varchar(20) NOT NULL,
  `cdate` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Triggers `trig`
--
DELIMITER $$
CREATE TRIGGER `deletion` AFTER DELETE ON `trig` FOR EACH ROW insert into trig values(null,OLD.id ,'Deletion',now())
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `insertion` AFTER INSERT ON `trig` FOR EACH ROW INSERT INTO trig VALUES(null,NEW.id ,'Inserted',now())
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `updation` BEFORE UPDATE ON `trig` FOR EACH ROW insert into trig values(null,NEW.id ,'updation',now())
$$
DELIMITER ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`ADMIN_ID`);

--
-- Indexes for table `company`
--
ALTER TABLE `company`
  ADD PRIMARY KEY (`COMPANY_ID`);

--
-- Indexes for table `companybranch`
--
ALTER TABLE `companybranch`
  ADD PRIMARY KEY (`COMPANY_NAME`,`C_TYPE`,`BRANCH`);

--
-- Indexes for table `intern_notification`
--
ALTER TABLE `intern_notification`
  ADD PRIMARY KEY (`noti`);

--
-- Indexes for table `place_notification`
--
ALTER TABLE `place_notification`
  ADD PRIMARY KEY (`noti`);

--
-- Indexes for table `registered_interns`
--
ALTER TABLE `registered_interns`
  ADD PRIMARY KEY (`STUDENT_ID`,`COMPANY_NAME`);

--
-- Indexes for table `registered_placements`
--
ALTER TABLE `registered_placements`
  ADD PRIMARY KEY (`STUDENT_ID`,`COMPANY_NAME`);

--
-- Indexes for table `student`
--
ALTER TABLE `student`
  ADD PRIMARY KEY (`STUDENT_ID`);

--
-- Indexes for table `student_internship`
--
ALTER TABLE `student_internship`
  ADD PRIMARY KEY (`STUDENT_ID`);

--
-- Indexes for table `student_placement`
--
ALTER TABLE `student_placement`
  ADD PRIMARY KEY (`STUDENT_ID`);

--
-- Indexes for table `trig`
--
ALTER TABLE `trig`
  ADD PRIMARY KEY (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
