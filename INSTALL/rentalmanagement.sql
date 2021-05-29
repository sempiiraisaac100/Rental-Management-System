-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: May 22, 2019 at 11:22 PM
-- Server version: 5.6.17
-- PHP Version: 5.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `rentalmanagement`
--

-- --------------------------------------------------------

--
-- Table structure for table `houses`
--

CREATE TABLE IF NOT EXISTS `houses` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `house_number` varchar(40) NOT NULL,
  `features` text NOT NULL,
  `rent` varchar(40) NOT NULL,
  `status` varchar(40) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `houses`
--

INSERT INTO `houses` (`id`, `house_number`, `features`, `rent`, `status`) VALUES
(1, 'A20', 'bathroom,2 bedroom,kitchen ,water,shower', '11500', 'occupied'),
(2, 'A21', '3 bedroom,swimming pool,bathtub,hot water,kitchen', '25000', 'occupied'),
(3, 'A22', 'bedsitter', '6000', 'occupied'),
(4, 'B540', '5bed rooms ,1  kitchen', '450000', 'vaccant');

-- --------------------------------------------------------

--
-- Table structure for table `invoices`
--

CREATE TABLE IF NOT EXISTS `invoices` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tenant` int(10) unsigned NOT NULL,
  `phone` int(10) unsigned DEFAULT NULL,
  `house` int(10) unsigned DEFAULT NULL,
  `year` varchar(40) NOT NULL,
  `month` varchar(40) NOT NULL,
  `particulars` text NOT NULL,
  `total` varchar(40) NOT NULL,
  `comments` text,
  `status` varchar(40) NOT NULL,
  `field10` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `tenant` (`tenant`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `invoices`
--

INSERT INTO `invoices` (`id`, `tenant`, `phone`, `house`, `year`, `month`, `particulars`, `total`, `comments`, `status`, `field10`) VALUES
(1, 1, 1, 1, '2018', 'May', 'rent-11500', '11500', '<br>', 'cash receiced', NULL),
(2, 2, 2, 2, '2018', 'May', 'rent-25000<div>deposit-5000</div>', '30000', 'pay deposit first', 'cash receiced', NULL),
(3, 3, 3, 3, '2018', 'May', 'house rent 6000', '6000', '<br>', 'new', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `maintance_requests`
--

CREATE TABLE IF NOT EXISTS `maintance_requests` (
  `maintance_id` int(11) NOT NULL,
  `group_id` varchar(11) NOT NULL,
  `request` varchar(500) NOT NULL,
  `roomNo` varchar(10) NOT NULL,
  `status` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `maintance_requests`
--

INSERT INTO `maintance_requests` (`maintance_id`, `group_id`, `request`, `roomNo`, `status`) VALUES
(0, '0', 'dfhkjdvbjdvb\r\n efesg', 'A20', ''),
(0, 'nicholas', 'dfhkjdvbjdvb\r\n efesg', 'A20', ''),
(0, 'nicholas', '2qdelfldfkl\r\newfwef', 'A20', ''),
(0, 'nicholas', '2qdelfldfkl\r\newfwef', 'A20', 'NOT SERVICED');

-- --------------------------------------------------------

--
-- Table structure for table `membership_grouppermissions`
--

CREATE TABLE IF NOT EXISTS `membership_grouppermissions` (
  `permissionID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `groupID` int(11) DEFAULT NULL,
  `tableName` varchar(100) DEFAULT NULL,
  `allowInsert` tinyint(4) DEFAULT NULL,
  `allowView` tinyint(4) NOT NULL DEFAULT '0',
  `allowEdit` tinyint(4) NOT NULL DEFAULT '0',
  `allowDelete` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`permissionID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=29 ;

--
-- Dumping data for table `membership_grouppermissions`
--

INSERT INTO `membership_grouppermissions` (`permissionID`, `groupID`, `tableName`, `allowInsert`, `allowView`, `allowEdit`, `allowDelete`) VALUES
(1, 2, 'houses', 1, 3, 3, 3),
(2, 2, 'tenants', 1, 3, 3, 3),
(3, 2, 'invoices', 1, 3, 3, 3),
(4, 2, 'payments', 1, 3, 3, 3),
(13, 3, 'houses', 0, 3, 0, 0),
(14, 3, 'tenants', 1, 1, 1, 0),
(15, 3, 'invoices', 0, 1, 0, 0),
(16, 3, 'payments', 1, 1, 0, 0),
(21, 4, 'houses', 0, 3, 1, 1),
(22, 4, 'tenants', 1, 3, 1, 1),
(23, 4, 'invoices', 1, 3, 1, 1),
(24, 4, 'payments', 1, 3, 1, 1),
(25, 1, 'houses', 0, 0, 0, 0),
(26, 1, 'tenants', 1, 1, 1, 1),
(27, 1, 'invoices', 0, 0, 0, 0),
(28, 1, 'payments', 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `membership_groups`
--

CREATE TABLE IF NOT EXISTS `membership_groups` (
  `groupID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(20) DEFAULT NULL,
  `description` text,
  `allowSignup` tinyint(4) DEFAULT NULL,
  `needsApproval` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`groupID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `membership_groups`
--

INSERT INTO `membership_groups` (`groupID`, `name`, `description`, `allowSignup`, `needsApproval`) VALUES
(1, 'anonymous', 'Anonymous group created automatically on 2018-05-10', 0, 0),
(2, 'Admins', 'Admin group created automatically on 2018-05-10', 0, 1),
(3, 'tenants', 'tenants here', 0, 1),
(4, 'users', 'all test users', 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `membership_userpermissions`
--

CREATE TABLE IF NOT EXISTS `membership_userpermissions` (
  `permissionID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `memberID` varchar(20) NOT NULL,
  `tableName` varchar(100) DEFAULT NULL,
  `allowInsert` tinyint(4) DEFAULT NULL,
  `allowView` tinyint(4) NOT NULL DEFAULT '0',
  `allowEdit` tinyint(4) NOT NULL DEFAULT '0',
  `allowDelete` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`permissionID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `membership_userrecords`
--

CREATE TABLE IF NOT EXISTS `membership_userrecords` (
  `recID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `tableName` varchar(100) DEFAULT NULL,
  `pkValue` varchar(255) DEFAULT NULL,
  `memberID` varchar(20) DEFAULT NULL,
  `dateAdded` bigint(20) unsigned DEFAULT NULL,
  `dateUpdated` bigint(20) unsigned DEFAULT NULL,
  `groupID` int(11) DEFAULT NULL,
  PRIMARY KEY (`recID`),
  UNIQUE KEY `tableName_pkValue` (`tableName`,`pkValue`),
  KEY `pkValue` (`pkValue`),
  KEY `tableName` (`tableName`),
  KEY `memberID` (`memberID`),
  KEY `groupID` (`groupID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=15 ;

--
-- Dumping data for table `membership_userrecords`
--

INSERT INTO `membership_userrecords` (`recID`, `tableName`, `pkValue`, `memberID`, `dateAdded`, `dateUpdated`, `groupID`) VALUES
(1, 'houses', '1', 'admin', 1525967004, 1525970651, 2),
(2, 'tenants', '1', 'alijahuzi', 1525967170, 1526056194, 3),
(3, 'invoices', '1', 'alijahuzi', 1525967307, 1526147635, 3),
(5, 'payments', '2', 'alijahuzi', 1525969044, 1526056845, 3),
(6, 'houses', '2', 'admin', 1526081667, 1526081746, 2),
(7, 'tenants', '2', 'admin', 1526081759, 1526081759, 2),
(8, 'invoices', '2', 'admin', 1526081858, 1526147664, 2),
(9, 'payments', '3', 'admin', 1526088996, 1526088996, 2),
(10, 'houses', '3', 'admin', 1526089077, 1526089406, 2),
(11, 'tenants', '3', 'admin', 1526089430, 1526089450, 2),
(12, 'invoices', '3', 'admin', 1526089653, 1526147690, 2),
(13, 'payments', '4', 'admin', 1557826996, 1557826996, 2),
(14, 'houses', '4', 'nicholas', 1558554759, 1558554759, 4);

-- --------------------------------------------------------

--
-- Table structure for table `membership_users`
--

CREATE TABLE IF NOT EXISTS `membership_users` (
  `memberID` varchar(20) NOT NULL,
  `passMD5` varchar(40) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `signupDate` date DEFAULT NULL,
  `groupID` int(10) unsigned DEFAULT NULL,
  `isBanned` tinyint(4) DEFAULT NULL,
  `isApproved` tinyint(4) DEFAULT NULL,
  `custom1` text,
  `custom2` text,
  `custom3` text,
  `custom4` text,
  `comments` text,
  `pass_reset_key` varchar(100) DEFAULT NULL,
  `pass_reset_expiry` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`memberID`),
  KEY `groupID` (`groupID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `membership_users`
--

INSERT INTO `membership_users` (`memberID`, `passMD5`, `email`, `signupDate`, `groupID`, `isBanned`, `isApproved`, `custom1`, `custom2`, `custom3`, `custom4`, `comments`, `pass_reset_key`, `pass_reset_expiry`) VALUES
('admin', '7488e331b8b64e5794da3fa4eb10ad5d', 'admin@admin.com', '2018-05-10', 2, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2018-05-10\nRecord updated automatically on 2018-05-10\nRecord updated automatically on 2018-05-12\nRecord updated automatically on 2018-05-13', NULL, NULL),
('alijahuzi', '25f9e794323b453885f5181f1b624d0b', 'ali@gmail.com', '2018-05-10', 3, 0, 1, '', '', '', '', 'member signed up through the registration form.', NULL, NULL),
('brandy', '6c29e9cc4042d972b15ff0304e636886', 'brandy@gmail.com', '2018-05-13', 4, 0, 1, '', '', '', '', 'member signed up through the registration form.', NULL, NULL),
('guest', NULL, NULL, '2018-05-10', 1, 0, 1, NULL, NULL, NULL, NULL, 'Anonymous member created automatically on 2018-05-10', NULL, NULL),
('nicholas', '7f5bad0895a3fa0cb3cda831d09f0286', 'mukwayanicholas.mn@gmail.com', '2019-05-22', 4, 0, 1, '', '', '', '', 'member signed up through the registration form.', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE IF NOT EXISTS `payments` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tenant` int(10) unsigned NOT NULL,
  `house` int(10) unsigned DEFAULT NULL,
  `year` int(10) unsigned DEFAULT NULL,
  `month` int(10) unsigned DEFAULT NULL,
  `expected_amount` int(10) unsigned DEFAULT NULL,
  `paid_amount` varchar(40) NOT NULL,
  `balance` varchar(40) DEFAULT NULL,
  `date` date NOT NULL,
  `comments` text,
  PRIMARY KEY (`id`),
  KEY `tenant` (`tenant`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `payments`
--

INSERT INTO `payments` (`id`, `tenant`, `house`, `year`, `month`, `expected_amount`, `paid_amount`, `balance`, `date`, `comments`) VALUES
(2, 1, 1, 1, 1, 1, '11500', '0', '2018-05-10', '<br>'),
(3, 2, 2, 2, 2, 2, '10000', '20000', '2018-05-11', '<br>'),
(4, 3, 3, 3, 3, 3, '500', '5500', '2019-05-14', '<br>');

-- --------------------------------------------------------

--
-- Table structure for table `tenants`
--

CREATE TABLE IF NOT EXISTS `tenants` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `fullname` varchar(40) NOT NULL,
  `gender` varchar(40) NOT NULL,
  `national_id` varchar(40) NOT NULL,
  `phone_number` varchar(40) NOT NULL,
  `email` varchar(80) DEFAULT NULL,
  `registration_date` date NOT NULL,
  `house` int(10) unsigned NOT NULL,
  `status` varchar(40) NOT NULL,
  `exit_date` date DEFAULT NULL,
  `agreement_document` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `house` (`house`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `tenants`
--

INSERT INTO `tenants` (`id`, `fullname`, `gender`, `national_id`, `phone_number`, `email`, `registration_date`, `house`, `status`, `exit_date`, `agreement_document`) VALUES
(1, 'anwar mohamed', 'male', '33516718291', '0712345678', 'anwarmoha@gmail.com', '2018-05-10', 1, 'tenant in', NULL, '3e92349ecb4d1781a.pdf'),
(2, 'alijahuzi magu', 'male', '123456789098', '0798765432', 'ali@gmail.com', '2018-05-11', 2, 'tenant in', NULL, NULL),
(3, 'Ketray Munyasa', 'female', '22368128191', '0727817507', 'ketmunyasa@gmail.com', '2018-05-11', 3, 'tenant in', NULL, '3279aaea4aabfa662.pdf');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
