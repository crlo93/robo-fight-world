-- phpMyAdmin SQL Dump
-- version 3.5.1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Nov 13, 2017 at 11:24 PM
-- Server version: 5.5.24-log
-- PHP Version: 5.4.3

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `bd_rfw`
--

-- --------------------------------------------------------

--
-- Table structure for table `battle`
--

CREATE TABLE IF NOT EXISTS `battle` (
  `bttl_id` int(11) NOT NULL AUTO_INCREMENT,
  `bttl_user1` int(11) NOT NULL,
  `bttl_user2` int(11) NOT NULL,
  `bttl_type` smallint(6) NOT NULL,
  `bttl_winner` tinyint(1) NOT NULL,
  `bttl_date` date NOT NULL,
  `bttl_duration` time NOT NULL,
  PRIMARY KEY (`bttl_id`),
  KEY `bttl_usr1` (`bttl_user1`,`bttl_user2`),
  KEY `bttl_user2` (`bttl_user2`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `friends`
--

CREATE TABLE IF NOT EXISTS `friends` (
  `frnd_user1` int(11) NOT NULL,
  `frnd_user2` int(11) NOT NULL,
  KEY `frnd_user1` (`frnd_user1`,`frnd_user2`),
  KEY `frnd_user2` (`frnd_user2`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `part`
--

CREATE TABLE IF NOT EXISTS `part` (
  `prt_id` int(11) NOT NULL,
  `prt_user` int(11) NOT NULL,
  `prt_skin` int(11) DEFAULT NULL,
  `prt_element` int(11) NOT NULL,
  `prt_lvl` int(11) NOT NULL,
  `prt_def` int(11) NOT NULL,
  `prt_dmg` int(11) NOT NULL,
  `prt_tamaño` int(11) NOT NULL,
  `prt_cooldown` int(11) NOT NULL,
  `prt_speed` int(11) NOT NULL,
  `prt_type` int(11) NOT NULL,
  PRIMARY KEY (`prt_id`),
  KEY `prt_user` (`prt_user`),
  KEY `prt_skin` (`prt_skin`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `ranking`
--

CREATE TABLE IF NOT EXISTS `ranking` (
  `rnk_user` int(11) NOT NULL,
  `rnk_pts` int(11) NOT NULL,
  `rnk_season_year` year(4) NOT NULL,
  `rnk_season` int(11) NOT NULL,
  KEY `rnk_user` (`rnk_user`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `sale`
--

CREATE TABLE IF NOT EXISTS `sale` (
  `sl_id_user` int(11) NOT NULL,
  `sl_transact` varchar(100) NOT NULL,
  `sl_payment` varchar(100) NOT NULL,
  PRIMARY KEY (`sl_transact`),
  KEY `sl_id_user` (`sl_id_user`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `shell`
--

CREATE TABLE IF NOT EXISTS `shell` (
  `shll_id` int(11) NOT NULL AUTO_INCREMENT,
  `shll_user` int(11) NOT NULL,
  `shll_arm_r` int(11) NOT NULL,
  `shll_arm_l` int(11) NOT NULL,
  `shll_legs` int(11) NOT NULL,
  `shll_head` int(11) NOT NULL,
  `shll_body` int(11) NOT NULL,
  PRIMARY KEY (`shll_id`),
  KEY `shll_user` (`shll_user`,`shll_arm_r`,`shll_arm_l`,`shll_legs`,`shll_head`,`shll_body`),
  KEY `shll_arm_r` (`shll_arm_r`),
  KEY `shll_arm_l` (`shll_arm_l`),
  KEY `shll_legs` (`shll_legs`),
  KEY `shll_head` (`shll_head`),
  KEY `shll_body` (`shll_body`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `skin`
--

CREATE TABLE IF NOT EXISTS `skin` (
  `skn_id` int(11) NOT NULL AUTO_INCREMENT,
  `skd_part_type` int(11) NOT NULL,
  `skd_aspect` varchar(200) NOT NULL,
  `skd_price` int(11) NOT NULL,
  PRIMARY KEY (`skn_id`),
  KEY `skd_part_type` (`skd_part_type`),
  KEY `skd_part_type_2` (`skd_part_type`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE IF NOT EXISTS `user` (
  `usr_id` int(11) NOT NULL AUTO_INCREMENT,
  `usr_nick` varchar(20) NOT NULL,
  `usr_email` varchar(50) NOT NULL,
  `usr_password` varchar(20) NOT NULL,
  `usr_icon` varchar(100) NOT NULL,
  `usr_status` smallint(6) NOT NULL,
  PRIMARY KEY (`usr_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `battle`
--
ALTER TABLE `battle`
  ADD CONSTRAINT `battle_ibfk_2` FOREIGN KEY (`bttl_user2`) REFERENCES `user` (`usr_id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `battle_ibfk_1` FOREIGN KEY (`bttl_user1`) REFERENCES `user` (`usr_id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `friends`
--
ALTER TABLE `friends`
  ADD CONSTRAINT `friends_ibfk_2` FOREIGN KEY (`frnd_user2`) REFERENCES `user` (`usr_id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `friends_ibfk_1` FOREIGN KEY (`frnd_user1`) REFERENCES `user` (`usr_id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `part`
--
ALTER TABLE `part`
  ADD CONSTRAINT `part_ibfk_1` FOREIGN KEY (`prt_user`) REFERENCES `user` (`usr_id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `part_ibfk_2` FOREIGN KEY (`prt_skin`) REFERENCES `skin` (`skn_id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `ranking`
--
ALTER TABLE `ranking`
  ADD CONSTRAINT `ranking_ibfk_1` FOREIGN KEY (`rnk_user`) REFERENCES `user` (`usr_id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `shell`
--
ALTER TABLE `shell`
  ADD CONSTRAINT `shell_ibfk_6` FOREIGN KEY (`shll_body`) REFERENCES `part` (`prt_id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `shell_ibfk_1` FOREIGN KEY (`shll_user`) REFERENCES `user` (`usr_id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `shell_ibfk_2` FOREIGN KEY (`shll_arm_r`) REFERENCES `part` (`prt_id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `shell_ibfk_3` FOREIGN KEY (`shll_arm_l`) REFERENCES `part` (`prt_id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `shell_ibfk_4` FOREIGN KEY (`shll_legs`) REFERENCES `part` (`prt_id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `shell_ibfk_5` FOREIGN KEY (`shll_head`) REFERENCES `part` (`prt_id`) ON DELETE NO ACTION ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
