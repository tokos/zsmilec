CREATE DATABASE  IF NOT EXISTS `zs-milec3` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `zs-milec3`;
-- MySQL dump 10.13  Distrib 5.6.10, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: zs-milec3
-- ------------------------------------------------------
-- Server version	5.6.10-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `subjects`
--

DROP TABLE IF EXISTS `subjects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `subjects` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(20) DEFAULT NULL,
  `SHORT_NAME` char(4) DEFAULT NULL,
  `DESCRIPTION` varchar(20) DEFAULT NULL,
  `EMPLOYEE_ID` bigint(20) NOT NULL,
  `POSITION` int(11) DEFAULT NULL,
  UNIQUE KEY `ID` (`ID`),
  KEY `SUBJECT_FK1` (`EMPLOYEE_ID`),
  CONSTRAINT `SUBJECT_FK1` FOREIGN KEY (`EMPLOYEE_ID`) REFERENCES `employees` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subjects`
--

LOCK TABLES `subjects` WRITE;
/*!40000 ALTER TABLE `subjects` DISABLE KEYS */;
INSERT INTO `subjects` (`ID`, `NAME`, `SHORT_NAME`, `DESCRIPTION`, `EMPLOYEE_ID`, `POSITION`) VALUES (1,'Matematika','MA','',1,NULL),(2,'Český jazyk','ČJ','',1,NULL),(3,'Hudební výchova','HV','',1,NULL),(4,'Tělesná výchova','TV','',1,NULL),(5,'Prvouka','Prv','',1,NULL),(6,'Přírodověda','Př','',1,NULL),(7,'Vlastivěda','Vl','',1,NULL),(8,'Výtvarná výchova','Vv','',1,NULL),(9,'Pracovní vyučování','Pv','',1,NULL),(10,'Anglický jazyk','Aj','',1,NULL);
/*!40000 ALTER TABLE `subjects` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2013-06-02 19:04:29
