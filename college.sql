-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 29, 2024 at 11:04 AM
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
-- Database: `college`
--

-- --------------------------------------------------------

--
-- Stand-in structure for view `4mh12cs002`
-- (See below for the actual view)
--
CREATE TABLE `4mh12cs002` (
`subcode` char(7)
,`test1` int(11)
);

-- --------------------------------------------------------

--
-- Table structure for table `class`
--

CREATE TABLE `class` (
  `USN` char(10) NOT NULL,
  `SSID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `class`
--

INSERT INTO `class` (`USN`, `SSID`) VALUES
('4MH12CS001', 101),
('4MH12CS002', 102),
('4MH12CS003', 103);

-- --------------------------------------------------------

--
-- Table structure for table `course`
--

CREATE TABLE `course` (
  `subcode` char(7) NOT NULL,
  `Title` varchar(20) DEFAULT NULL,
  `sem` int(11) DEFAULT NULL,
  `CREDITS` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `course`
--

INSERT INTO `course` (`subcode`, `Title`, `sem`, `CREDITS`) VALUES
('18CS53', 'DBMS', 5, 4),
('18CS54', 'ATC', 4, 2),
('18CS55', 'CN', 3, 1);

-- --------------------------------------------------------

--
-- Table structure for table `iamarks`
--

CREATE TABLE `iamarks` (
  `USN` char(10) NOT NULL,
  `Subcode` char(7) NOT NULL,
  `SSID` int(11) NOT NULL,
  `Test1` int(11) NOT NULL,
  `Test2` int(11) NOT NULL,
  `Test3` int(11) NOT NULL,
  `FinalIA` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `iamarks`
--

INSERT INTO `iamarks` (`USN`, `Subcode`, `SSID`, `Test1`, `Test2`, `Test3`, `FinalIA`) VALUES
('4MH12CS001', '18CS53', 101, 21, 5, 17, 19),
('4MH12CS002', '18CS54', 102, 21, 4, 17, 19),
('4MH12CS003', '18CS55', 103, 21, 3, 17, 19);

-- --------------------------------------------------------

--
-- Table structure for table `semsec`
--

CREATE TABLE `semsec` (
  `SSID` int(11) NOT NULL,
  `Sem` int(11) NOT NULL,
  `Sec` char(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `semsec`
--

INSERT INTO `semsec` (`SSID`, `Sem`, `Sec`) VALUES
(101, 5, 'B'),
(102, 4, 'C'),
(103, 3, 'K');

-- --------------------------------------------------------

--
-- Table structure for table `student`
--

CREATE TABLE `student` (
  `USN` char(10) NOT NULL,
  `SName` varchar(25) NOT NULL,
  `Address` varchar(30) NOT NULL,
  `Phone` varchar(10) DEFAULT NULL,
  `Gender` char(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `student`
--

INSERT INTO `student` (`USN`, `SName`, `Address`, `Phone`, `Gender`) VALUES
('4MH12CS001', 'Yash', 'Mysore', '93245', 'M'),
('4MH12CS002', 'Raju', 'Mandya', '87645', 'K'),
('4MH12CS003', 'Ravi', 'Bangalore', '98763', 'B');

-- --------------------------------------------------------

--
-- Structure for view `4mh12cs002`
--
DROP TABLE IF EXISTS `4mh12cs002`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `4mh12cs002`  AS  select `iamarks`.`Subcode` AS `subcode`,`iamarks`.`Test1` AS `test1` from `iamarks` where (`iamarks`.`USN` = '4MH12CS002') ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `class`
--
ALTER TABLE `class`
  ADD PRIMARY KEY (`USN`),
  ADD KEY `SSID` (`SSID`);

--
-- Indexes for table `course`
--
ALTER TABLE `course`
  ADD PRIMARY KEY (`subcode`);

--
-- Indexes for table `iamarks`
--
ALTER TABLE `iamarks`
  ADD PRIMARY KEY (`USN`,`Subcode`,`SSID`),
  ADD KEY `Subcode` (`Subcode`),
  ADD KEY `SSID` (`SSID`);

--
-- Indexes for table `semsec`
--
ALTER TABLE `semsec`
  ADD PRIMARY KEY (`SSID`);

--
-- Indexes for table `student`
--
ALTER TABLE `student`
  ADD PRIMARY KEY (`USN`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `class`
--
ALTER TABLE `class`
  ADD CONSTRAINT `class_ibfk_1` FOREIGN KEY (`USN`) REFERENCES `student` (`USN`),
  ADD CONSTRAINT `class_ibfk_2` FOREIGN KEY (`SSID`) REFERENCES `semsec` (`SSID`);

--
-- Constraints for table `iamarks`
--
ALTER TABLE `iamarks`
  ADD CONSTRAINT `iamarks_ibfk_1` FOREIGN KEY (`USN`) REFERENCES `student` (`USN`),
  ADD CONSTRAINT `iamarks_ibfk_2` FOREIGN KEY (`Subcode`) REFERENCES `course` (`subcode`),
  ADD CONSTRAINT `iamarks_ibfk_3` FOREIGN KEY (`SSID`) REFERENCES `semsec` (`SSID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
