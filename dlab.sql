-- phpMyAdmin SQL Dump
-- version 3.5.2.2
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Mar 10, 2015 at 05:46 PM
-- Server version: 5.5.27
-- PHP Version: 5.4.7

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `dlab`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE IF NOT EXISTS `admin` (
  `idAdmin` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `User_idUser` int(11) NOT NULL,
  PRIMARY KEY (`idAdmin`),
  KEY `fk_Admin_User1_idx` (`User_idUser`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `course`
--

CREATE TABLE IF NOT EXISTS `course` (
  `idCourse` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`idCourse`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `course`
--

INSERT INTO `course` (`idCourse`, `name`) VALUES
('CT101', 'Lập trình căn bản A'),
('CT106', 'Hệ cơ sở dữ liệu'),
('CT107', 'Hệ điều hành'),
('CT110', 'Hệ quản trị cơ sở dữ liệu'),
('CT112', 'Mạng máy tính'),
('CT120', 'Phân tích và thiết kế thuật toán'),
('CT165', 'Ngôn ngữ mô hình hóa UML'),
('CT167', 'Ngôn ngữ lập trình Java'),
('CT319', 'Lập trình mạng'),
('CT434', 'An toàn hệ thống và An ninh mạng');

-- --------------------------------------------------------

--
-- Table structure for table `lab`
--

CREATE TABLE IF NOT EXISTS `lab` (
  `idLab` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `amount` int(11) DEFAULT NULL,
  `fileVPN` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Course_idCourse` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `Teacher_idTeacher` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`idLab`),
  KEY `fk_Lab_Course1_idx` (`Course_idCourse`),
  KEY `fk_Lab_Teacher1_idx` (`Teacher_idTeacher`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=11 ;

--
-- Dumping data for table `lab`
--

INSERT INTO `lab` (`idLab`, `name`, `amount`, `fileVPN`, `Course_idCourse`, `Teacher_idTeacher`) VALUES
(9, 'Thiet bi so hoa', 12, NULL, 'CT106', '000428');

-- --------------------------------------------------------

--
-- Table structure for table `labnotify`
--

CREATE TABLE IF NOT EXISTS `labnotify` (
  `idLabNotify` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `content` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Lab_idLab` int(11) NOT NULL,
  PRIMARY KEY (`idLabNotify`),
  KEY `fk_Notify_Lab1_idx` (`Lab_idLab`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=11 ;

--
-- Dumping data for table `labnotify`
--

INSERT INTO `labnotify` (`idLabNotify`, `name`, `content`, `Lab_idLab`) VALUES
(9, '123', '12', 9);

-- --------------------------------------------------------

--
-- Table structure for table `labresource`
--

CREATE TABLE IF NOT EXISTS `labresource` (
  `idLabResource` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `startDateTime` datetime DEFAULT NULL,
  `endDateTime` datetime DEFAULT NULL,
  `labLink` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Lab_idLab` int(11) NOT NULL,
  PRIMARY KEY (`idLabResource`),
  KEY `fk_Resource_Lab1_idx` (`Lab_idLab`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=9 ;

--
-- Dumping data for table `labresource`
--

INSERT INTO `labresource` (`idLabResource`, `name`, `startDateTime`, `endDateTime`, `labLink`, `Lab_idLab`) VALUES
(7, '123', '2012-12-12 21:30:00', '2012-12-12 21:30:00', '1212', 9);

-- --------------------------------------------------------

--
-- Table structure for table `registrationlab`
--

CREATE TABLE IF NOT EXISTS `registrationlab` (
  `idRegistrationLab` int(11) NOT NULL AUTO_INCREMENT,
  `Lab_idLab` int(11) NOT NULL,
  `Student_idStudent` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`idRegistrationLab`),
  KEY `fk_RegistrationLab_Lab1_idx` (`Lab_idLab`),
  KEY `fk_RegistrationLab_Student1_idx` (`Student_idStudent`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=22 ;

-- --------------------------------------------------------

--
-- Table structure for table `student`
--

CREATE TABLE IF NOT EXISTS `student` (
  `idStudent` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `StudentClass_idStudentClass` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `User_idUser` int(11) NOT NULL,
  PRIMARY KEY (`idStudent`),
  KEY `fk_Student_User1_idx` (`User_idUser`),
  KEY `fk_Student_StudentClass1_idx` (`StudentClass_idStudentClass`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `student`
--

INSERT INTO `student` (`idStudent`, `StudentClass_idStudentClass`, `User_idUser`) VALUES
('1101722', 'DI1097A2', 3),
('11110929', 'DI1097A2', 8),
('1111222', 'DI1097A2', 4),
('1111722', 'DI1197A1', 2),
('1111777', 'DI1097A2', 7);

-- --------------------------------------------------------

--
-- Table structure for table `studentclass`
--

CREATE TABLE IF NOT EXISTS `studentclass` (
  `idStudentClass` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`idStudentClass`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `studentclass`
--

INSERT INTO `studentclass` (`idStudentClass`, `name`) VALUES
('DI1097A2', 'MMT & TT A1 K36'),
('DI1197A1', 'MMT & TT A1 K37');

-- --------------------------------------------------------

--
-- Table structure for table `teacher`
--

CREATE TABLE IF NOT EXISTS `teacher` (
  `idTeacher` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `User_idUser` int(11) NOT NULL,
  PRIMARY KEY (`idTeacher`),
  KEY `fk_Teacher_User1_idx` (`User_idUser`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `teacher`
--

INSERT INTO `teacher` (`idTeacher`, `User_idUser`) VALUES
('000428', 5),
('000429', 6);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE IF NOT EXISTS `user` (
  `idUser` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `fullName` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`idUser`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=9 ;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`idUser`, `password`, `fullName`, `email`) VALUES
(1, 'e10adc3949ba59abbe56e057f20f883e', 'Administrator', 'admin@dlab.com'),
(2, 'e10adc3949ba59abbe56e057f20f883e', 'Phan Thành Hoàng', 'hoangpt@dlab.com'),
(3, 'e10adc3949ba59abbe56e057f20f883e', 'Phạm Hoàng Diệu', 'dieuph@dlab.com'),
(4, 'e10adc3949ba59abbe56e057f20f883e', 'Trương Huấn Chiêu', 'chieuth@dlab.com'),
(5, 'e10adc3949ba59abbe56e057f20f883e', 'Ngô Vĩnh Tuấn', 'tuannv@dlab.com'),
(6, 'e10adc3949ba59abbe56e057f20f883e', 'Trần Trọng Kim', 'kimtt@dlab.com'),
(7, 'e10adc3949ba59abbe56e057f20f883e', 'Nguyen A', 'a@dlab.com'),
(8, 'a3f8eef512250106693bf234015f34b3', 'trang', 'trang110950@student.ctu.edu.vn');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `admin`
--
ALTER TABLE `admin`
  ADD CONSTRAINT `fk_Admin_User1` FOREIGN KEY (`User_idUser`) REFERENCES `user` (`idUser`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `lab`
--
ALTER TABLE `lab`
  ADD CONSTRAINT `fk_Lab_Course1` FOREIGN KEY (`Course_idCourse`) REFERENCES `course` (`idCourse`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Lab_Teacher1` FOREIGN KEY (`Teacher_idTeacher`) REFERENCES `teacher` (`idTeacher`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `labnotify`
--
ALTER TABLE `labnotify`
  ADD CONSTRAINT `labnotify_ibfk_2` FOREIGN KEY (`Lab_idLab`) REFERENCES `lab` (`idLab`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `labresource`
--
ALTER TABLE `labresource`
  ADD CONSTRAINT `labresource_ibfk_1` FOREIGN KEY (`Lab_idLab`) REFERENCES `lab` (`idLab`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `registrationlab`
--
ALTER TABLE `registrationlab`
  ADD CONSTRAINT `registrationlab_ibfk_4` FOREIGN KEY (`Student_idStudent`) REFERENCES `student` (`idStudent`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `registrationlab_ibfk_3` FOREIGN KEY (`Lab_idLab`) REFERENCES `lab` (`idLab`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `student`
--
ALTER TABLE `student`
  ADD CONSTRAINT `fk_Student_StudentClass1` FOREIGN KEY (`StudentClass_idStudentClass`) REFERENCES `studentclass` (`idStudentClass`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Student_User1` FOREIGN KEY (`User_idUser`) REFERENCES `user` (`idUser`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `teacher`
--
ALTER TABLE `teacher`
  ADD CONSTRAINT `fk_Teacher_User1` FOREIGN KEY (`User_idUser`) REFERENCES `user` (`idUser`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
