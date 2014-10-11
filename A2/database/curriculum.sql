-- phpMyAdmin SQL Dump
-- version 4.1.9
-- http://www.phpmyadmin.net
--
-- Host: localhost:8889
-- Generation Time: Oct 03, 2014 at 04:33 AM
-- Server version: 5.5.34
-- PHP Version: 5.5.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

--
-- Database: `curriculum`
--

-- --------------------------------------------------------

--
-- Table structure for table `approval`
--

CREATE TABLE `approval` (
  `groupId` int(45) NOT NULL,
  `userId` int(45) NOT NULL,
  `approved` enum('Approved','Denied','Unset') NOT NULL,
  PRIMARY KEY (`groupId`,`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `approval`
--

INSERT INTO `approval` (`groupId`, `userId`, `approved`) VALUES
(1, 1, 'Unset'),
(1, 2, 'Unset'),
(1, 3, 'Unset');

-- --------------------------------------------------------

--
-- Table structure for table `createProgramRequest`
--

CREATE TABLE `createProgramRequest` (
  `id` int(11) NOT NULL,
  `userId` varchar(45) NOT NULL,
  `programName` varchar(500) NOT NULL,
  `term` varchar(500) NOT NULL,
  `rationale` varchar(500) NOT NULL,
  `crossImpact` varchar(500) NOT NULL,
  `studentImpact` varchar(500) NOT NULL,
  `comments` varchar(500) NOT NULL,
  `calendar` varchar(500) NOT NULL,
  `libraryImpact` varchar(500) NOT NULL,
  `itsImpact` varchar(500) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `createProgramRequest`
--

INSERT INTO `createProgramRequest` (`id`, `userId`, `programName`, `term`, `rationale`, `crossImpact`, `studentImpact`, `comments`, `calendar`, `libraryImpact`, `itsImpact`) VALUES
(0, '1', 'asd', 'Fall - 2014', 'asda', 'adsasd', 'NEW NWE', 'sadfas', 'asdf', 'asd', 'fadfs');

-- --------------------------------------------------------

--
-- Table structure for table `group`
--

CREATE TABLE `group` (
  `groupId` int(11) NOT NULL AUTO_INCREMENT,
  `groupName` varchar(45) NOT NULL,
  PRIMARY KEY (`groupId`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `group`
--

INSERT INTO `group` (`groupId`, `groupName`) VALUES
(1, 'FCC'),
(2, 'AB');

-- --------------------------------------------------------

--
-- Table structure for table `groupMember`
--

CREATE TABLE `groupMember` (
  `groupId` int(11) NOT NULL,
  `userId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `groupMember`
--

INSERT INTO `groupMember` (`groupId`, `userId`) VALUES
(1, 1),
(1, 2),
(1, 3),
(2, 1),
(2, 4);

-- --------------------------------------------------------

--
-- Table structure for table `request`
--

CREATE TABLE `request` (
  `id` int(45) NOT NULL AUTO_INCREMENT,
  `userId` int(45) NOT NULL,
  `creationDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `state` varchar(45) NOT NULL,
  `currentApprover` varchar(45) NOT NULL,
  `type` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=23 ;

--
-- Dumping data for table `request`
--

INSERT INTO `request` (`id`, `userId`, `creationDate`, `state`, `currentApprover`, `type`) VALUES
(22, 1, '2014-10-03 10:26:56', 'Start', 'FCC', 'create-program');

-- --------------------------------------------------------

--
-- Table structure for table `term`
--

CREATE TABLE `term` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `season` varchar(45) NOT NULL,
  `year` year(4) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `term`
--

INSERT INTO `term` (`id`, `season`, `year`) VALUES
(1, 'Fall', 2014),
(2, 'Winter', 2015);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `userID` int(45) NOT NULL AUTO_INCREMENT,
  `username` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  `firstname` varchar(45) DEFAULT NULL,
  `lastname` varchar(45) DEFAULT NULL,
  `faculty` varchar(45) NOT NULL,
  `director` varchar(45) NOT NULL,
  `discipline` varchar(45) NOT NULL,
  `phone` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  `title` varchar(45) NOT NULL,
  PRIMARY KEY (`userID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`userID`, `username`, `password`, `firstname`, `lastname`, `faculty`, `director`, `discipline`, `phone`, `email`, `title`) VALUES
(1, 'athom948', 'e56c492f409eeb746094d2240d35924b', 'Anthony', 'Thomasson', 'test', 'test', 'test', 'test', '', 'test'),
(2, 'Rob', 'asdasd', 'Robbbb', 'DeRose', 'Stuff', 'assadf', 'asdas', 'awrawv', 'sdfasfef', 'warweew'),
(3, 'T ROP', 'abfjkshjdz', 'Tyler', 'Rop', 'dsaasdfew', 'ffsadasd', 'afasfsadfsadfasfaa', 'adfssadaf', 'sdafasdfadfs', 'adsfasdfafsadf'),
(4, 'Bob', 'asddasdsa', 'Bob', 'Brown', 'asdasdsd', 'adfgsd', 'sdgdsfg', 'sdgfgsdf', 'aS', 'Wqewqd'),
(5, 'Paul', 'sasdff', 'Paul', 'McGrooooogen', 'asddas', 'adsasd', 'fasf', 'dsfasdf', 'sadfsdfa', 'sdafasdsagdh');
