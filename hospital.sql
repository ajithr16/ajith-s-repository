-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 27, 2022 at 09:52 AM
-- Server version: 10.4.21-MariaDB
-- PHP Version: 8.0.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `hospital`
--

-- --------------------------------------------------------

--
-- Table structure for table `doctors`
--

CREATE TABLE `doctors` (
  `did` int(11) NOT NULL,
  `email` varchar(50) NOT NULL,
  `doctorname` varchar(50) NOT NULL,
  `dept` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `doctors`
--

INSERT INTO `doctors` (`did`, `email`, `doctorname`, `dept`) VALUES
(1, 'aji@gmail.com', 'Ajith', 'Cardio'),
(2, 'aji@gmail.com', 'Harish', 'Surgeon'),
(3, 'devilprasad@gmail.com', 'Dheeraj', 'ortho'),
(4, 'aa@gmail.com', 'Arun', 'surgon'),
(5, '11@gmail.com', 'fwww', 'heart'),
(6, '123@gmail.com', 'Ajith B M', 'Medicine'),
(7, 'aastar@gmail.com', 'Harish', 'neuro'),
(8, 'adarsh@gmail.com', 'gokul', 'ortho'),
(9, 'aravind@gmail.com', 'Aravind', 'ENT');

-- --------------------------------------------------------

--
-- Table structure for table `feedback`
--

CREATE TABLE `feedback` (
  `Fid` int(11) NOT NULL,
  `email` varchar(50) NOT NULL,
  `feedback` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `feedback`
--

INSERT INTO `feedback` (`Fid`, `email`, `feedback`) VALUES
(1, 'aravind@gmail.com', 'good hospital');

-- --------------------------------------------------------

--
-- Table structure for table `patients`
--

CREATE TABLE `patients` (
  `pid` int(10) NOT NULL,
  `email` varchar(50) NOT NULL,
  `name` varchar(50) NOT NULL,
  `gender` varchar(50) NOT NULL,
  `slot` varchar(50) NOT NULL,
  `disease` varchar(50) NOT NULL,
  `time` time NOT NULL,
  `date` date NOT NULL,
  `dept` varchar(50) NOT NULL,
  `number` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `patients`
--

INSERT INTO `patients` (`pid`, `email`, `name`, `gender`, `slot`, `disease`, `time`, `date`, `dept`, `number`) VALUES
(4, '123@gmail.com', 'bangalore', 'Male', 'morning', 'fever', '20:16:00', '2022-01-18', 'ortho', '343'),
(6, '123@gmail.com', 'bangalore', 'Female', 'morning', 'corona', '18:19:00', '2022-01-28', 'surgon', '3423'),
(7, 'aastar@gmail.com', 'Allu', 'Male', 'evening', 'corona', '16:50:00', '2022-01-19', 'Cardio', '9343'),
(8, 'adarsh@gmail.com', 'adarsh', 'Male', 'morning', 'fever', '11:22:00', '2022-01-10', 'Medicine', '3232'),
(9, 'aravind@gmail.com', 'Aravind', 'Male', 'morning', 'Cold', '12:31:00', '2022-01-27', 'Medicine', '414342');

--
-- Triggers `patients`
--
DELIMITER $$
CREATE TRIGGER `PatientDelete` BEFORE DELETE ON `patients` FOR EACH ROW INSERT INTO `triggers` VALUES(NOT NULL,OLD.pid,OLD.email,OLD.name,'Patient Deleted',Now())
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `PatientUpdate` AFTER UPDATE ON `patients` FOR EACH ROW INSERT INTO `triggers` VALUES(NOT NULL,NEW.pid,NEW.email,NEW.name,'Patient Updated',Now())
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `patientinsertion` AFTER INSERT ON `patients` FOR EACH ROW INSERT INTO `triggers` VALUES(NOT NULL,NEW.pid,NEW.email,NEW.name,'Patient Inserted',Now())
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `triggers`
--

CREATE TABLE `triggers` (
  `Tid` int(11) NOT NULL,
  `pid` int(11) NOT NULL,
  `email` varchar(50) NOT NULL,
  `name` varchar(50) NOT NULL,
  `action` varchar(50) NOT NULL,
  `timestamp` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `triggers`
--

INSERT INTO `triggers` (`Tid`, `pid`, `email`, `name`, `action`, `timestamp`) VALUES
(1, 4, '123@gmail.com', 'bangalore', 'Patient Inserted', '2022-01-17 18:16:46'),
(2, 6, '123@gmail.com', 'bangalore', 'Patient Inserted', '2022-01-17 18:19:15'),
(3, 3, '123@gmail.com', 'Ajith', 'Patient Updated', '2022-01-17 18:22:36'),
(4, 3, '123@gmail.com', 'Ajith', 'Patient Deleted', '2022-01-17 18:24:44'),
(5, 7, 'aastar@gmail.com', 'Allu Arjun', 'Patient Inserted', '2022-01-18 11:50:55'),
(6, 7, 'aastar@gmail.com', 'Allu', 'Patient Updated', '2022-01-18 11:51:24'),
(7, 8, 'adarsh@gmail.com', 'adarsh', 'Patient Inserted', '2022-01-24 11:23:08'),
(8, 9, 'aravind@gmail.com', 'Aravind B M', 'Patient Inserted', '2022-01-27 12:28:09'),
(9, 9, 'aravind@gmail.com', 'Aravind', 'Patient Updated', '2022-01-27 12:28:36');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(10) NOT NULL,
  `username` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(1000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `username`, `email`, `password`) VALUES
(1, 'ajithbm01', 'ajithbm01@gmail.com', 'pbkdf2:sha256:260000$XJkZCqOcplyUWlTo$73b33b86f807af672af65534420266a77587f9dd829aebce19daae287417074a'),
(2, 'ajith101', 'undefined@gmail.com', 'pbkdf2:sha256:260000$SkWy1FMJUIOPc7dX$0700c64a57025ff58c1263132dfa0f61a857c1361a71a04d945f39f631ea05cb'),
(3, 'ajithbm', 'undefined1@gmail.com', 'pbkdf2:sha256:260000$8QlJeSNLayuibXBx$da4324d1048719296df3d07a030cf90db1d177931f9104e0c46d24be18bb46e4'),
(4, 'ajith', 'ajith1@gmail.com', 'pbkdf2:sha256:260000$U855udBoyfBacsmn$89059a9c2caccd0226c67bdb5e520ff684b1b4e4de7ae08eba6ce3540ebb6f3e'),
(5, 'hey', 'hehe@gmail.com', 'pbkdf2:sha256:260000$BoXB2uxrLyvpcIFf$a705f2640ee9a9c43a63016d9478edd98d5fb85c184e6676d6f9976e11385361'),
(6, 'ajith', 'a@gmail.com', 'pbkdf2:sha256:260000$9reJI5BDAo1ISszG$14883c2ef84ee5d510d078a089b533de887208426e4ec8ff6d3d28b3180bb64b'),
(7, 'abcd', 'abcd@gmail.com', 'pbkdf2:sha256:260000$tkJey7VcR7FBWQJF$e19cec3cc7f79ecee6edee4c0183521293c156bf35b6a0a35f6b79ebaad6d9e3'),
(8, 'ajith1', 'ajith@gmail.com', 'pbkdf2:sha256:260000$ko3QcCvuhm12EscI$d7a2c23eb67c11c85d2425037fa37eb4bf9c836e69ed046d232756b5775aec72'),
(9, 'ajith1', 'aj@gmail.com', 'pbkdf2:sha256:260000$azlnDMBjblQutRmj$fd2ddb0d799ebc472a3b60c37381f0f0c145218e7673245d2e87805861cadd24'),
(10, 'a', 'a1@gmail.com', 'pbkdf2:sha256:260000$0au5Kw3gr897ewSt$6656f19af15c76952d24ff38f5a569a544faa8f4f781e5487a41a6aa1fda8d3b'),
(11, 'ajithr16', 'aji@gmail.com', 'pbkdf2:sha256:260000$AbMHeiOYYwtsGb3V$dbe3ab3566bfd32ba3be750e469591fb0e7d5ab8095d2b79bc7152265e38ce49'),
(12, 'dprasad', 'devilprasad@gmail.com', 'pbkdf2:sha256:260000$UTlFAIonOwkalIEA$0474b2bfb76c6ecac3e8fff9a5230222e516808d289936eee2321a83c52e8f36'),
(13, '1', 'aa@gmail.com', 'pbkdf2:sha256:260000$u8rQAj3wpsjGYX7d$3f10cab2ce6a5340bf14188b233018c5d3776c82e07a8e6fc809e1a58e6ed876'),
(14, '11', '11@gmail.com', 'pbkdf2:sha256:260000$HC2Yltbo78K1Fjem$47095af0eb3c4d27e3bf73016e702e5a057a001cf75e4c98fd05f53cabb4d03b'),
(15, 'ajithr16', '123@gmail.com', 'pbkdf2:sha256:260000$oq0Z98VQUYpXNQpS$14e33f2a968da8bf9d056ef05de3edf55f6fda2c91b4e3836c5b7402da8f5de6'),
(16, 'allu arjun', 'aastar@gmail.com', 'pbkdf2:sha256:260000$vIiGn1iUykJnOoky$9fea30437bff1f86091250e358a106880e573b967889676aa6e4cae0163fd246'),
(17, 'adarsh', 'adarsh@gmail.com', 'pbkdf2:sha256:260000$XXGaq81tzMNehVoy$66fab1b50cc6e063de61bc228429f452f26973b0afbc333d0f50ac370365f1d6'),
(18, 'Aravind', 'aravind@gmail.com', 'pbkdf2:sha256:260000$mGui74ChwjTxRuQq$a762e62607150c3692e58adec4fbb260a5dbb4f92fc2a290c73b6a4ac2c99dd0');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `doctors`
--
ALTER TABLE `doctors`
  ADD PRIMARY KEY (`did`);

--
-- Indexes for table `feedback`
--
ALTER TABLE `feedback`
  ADD PRIMARY KEY (`Fid`);

--
-- Indexes for table `patients`
--
ALTER TABLE `patients`
  ADD PRIMARY KEY (`pid`);

--
-- Indexes for table `triggers`
--
ALTER TABLE `triggers`
  ADD PRIMARY KEY (`Tid`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `Email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `doctors`
--
ALTER TABLE `doctors`
  MODIFY `did` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `feedback`
--
ALTER TABLE `feedback`
  MODIFY `Fid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `patients`
--
ALTER TABLE `patients`
  MODIFY `pid` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `triggers`
--
ALTER TABLE `triggers`
  MODIFY `Tid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
