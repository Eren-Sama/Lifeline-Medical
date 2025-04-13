-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 22, 2021 at 11:52 AM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.2.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `hms`
--

-- --------------------------------------------------------

--
-- Table structure for table `doctors`
--

CREATE TABLE `doctors` (
  `did` int(11) NOT NULL,
  `email` varchar(50) NOT NULL,
  `doctorname` varchar(50) NOT NULL,
  `dept` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `doctors`
--

INSERT INTO `doctors` (`did`, `email`, `doctorname`, `dept`) VALUES
(1, 'NiranjanC@gmail.com', 'Dr. Niranjan', 'Cardiologist'),
(2, 'Angad@gmail.com', 'Dr. Angad Bhatia', 'Dermatologist'),
(3, 'NeerajK@gmail.com', 'Dr. Neeraj Kumar', 'Anesthesiologist'),
(4, 'Abhishek@gmail', 'Dr. Abhishek Pathak', 'Neurologist'),
(5, 'AmitR@gmail.com', 'Dr. Amit Rastogi', 'Orthopedic'),
(6, 'VivekR@gmail.com', 'Dr. Vivek Rai', 'General Physician');

-- --------------------------------------------------------

--
-- Table structure for table `patients`
--

CREATE TABLE `patients` (
  `pid` int(11) NOT NULL,
  `email` varchar(50) NOT NULL,
  `name` varchar(50) NOT NULL,
  `gender` varchar(50) NOT NULL,
  `slot` varchar(50) NOT NULL,
  `disease` varchar(50) NOT NULL,
  `time` time NOT NULL,
  `date` date NOT NULL,
  `dept` varchar(50) NOT NULL,
  `number` varchar(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `patients`
--

INSERT INTO `patients` (`pid`, `email`, `name`, `gender`, `slot`, `disease`, `time`, `date`, `dept`, `number`) VALUES
(2, 'anees1@gmail.com', 'anees1 rehman khan', 'Male1', 'evening1', 'Fracture', '21:20:00', '2020-02-02', 'Orthopedic', '9874561110'),
(5, 'anant@gmail.com', 'anant', 'Male', 'morning', 'fevr', '18:06:00', '2020-11-18', 'General Practioner', '9874563210'),
(7, 'harshit@gmail.com', 'harshit', 'Male', 'evening', 'cold', '22:18:00', '2020-11-05', 'General Practioner', '9874563210'),
(8, 'utkarsh@gmail.com', 'utkarsh', 'Male', 'evening', 'Pimples', '22:18:00', '2020-11-05', 'Dermatologists', '9874563210'),
(9, 'aditya@gmail.com', 'aditya', 'Male', 'morning', 'Operation', '17:27:00', '2020-11-26', 'Anesthesiologists', '9874563210'),
(10, 'ansh@gmail.com', 'ansh', 'Male', 'evening', 'Heart Attack', '16:25:00', '2020-12-09', 'Cardiologists', '9874589654'),
(15, 'khushi@gmail.com', 'khushi', 'Female', 'morning', 'Operation', '20:42:00', '2021-01-23', 'Anesthesiologists', '9874563210'),
(16, 'saleem@gmail.com', 'saleem', 'Male', 'evening', 'Red Strains', '15:46:00', '2021-01-31', 'Dermatologist', '9874587496'),
(17, 'nishant@gmail.com', 'nishant', 'Male', 'evening', 'fever', '15:48:00', '2021-01-23', 'General Practioner', '9874563210');

--
-- Triggers `patients`
--
DELIMITER $$
CREATE TRIGGER `PatientDelete` BEFORE DELETE ON `patients` FOR EACH ROW INSERT INTO trigr VALUES(null,OLD.pid,OLD.email,OLD.name,'PATIENT DELETED',NOW())
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `PatientUpdate` AFTER UPDATE ON `patients` FOR EACH ROW INSERT INTO trigr VALUES(null,NEW.pid,NEW.email,NEW.name,'PATIENT UPDATED',NOW())
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `patientinsertion` AFTER INSERT ON `patients` FOR EACH ROW INSERT INTO trigr VALUES(null,NEW.pid,NEW.email,NEW.name,'PATIENT INSERTED',NOW())
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `test`
--

CREATE TABLE `test` (
  `id` int(11) NOT NULL,
  `name` varchar(20) NOT NULL,
  `email` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `test`
--

INSERT INTO `test` (`id`, `name`, `email`) VALUES
(1, 'Aman', 'Aman@GMAIL.COM'),
(2, 'test', 'test@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `trigr`
--

CREATE TABLE `trigr` (
  `tid` int(11) NOT NULL,
  `pid` int(11) NOT NULL,
  `email` varchar(50) NOT NULL,
  `name` varchar(50) NOT NULL,
  `action` varchar(50) NOT NULL,
  `timestamp` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `usertype` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(1000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
--
-- Indexes for table `doctors`
--
ALTER TABLE `doctors`
  ADD PRIMARY KEY (`did`);

--
-- Indexes for table `patients`
--
ALTER TABLE `patients`
  ADD PRIMARY KEY (`pid`);

--
-- Indexes for table `test`
--
ALTER TABLE `test`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `trigr`
--
ALTER TABLE `trigr`
  ADD PRIMARY KEY (`tid`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `doctors`
--
ALTER TABLE `doctors`
  MODIFY `did` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `patients`
--
ALTER TABLE `patients`
  MODIFY `pid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `test`
--
ALTER TABLE `test`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `trigr`
--
ALTER TABLE `trigr`
  MODIFY `tid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
COMMIT;
