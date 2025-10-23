CREATE DATABASE  IF NOT EXISTS `viajes_ap` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `viajes_ap`;
-- MySQL dump 10.13  Distrib 5.7.18, for Linux (x86_64)
--
-- Host: 127.0.0.1    Database: viajes_ap
-- ------------------------------------------------------
-- Server version	5.7.18-0ubuntu0.16.04.1

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
-- Table structure for table `crucero`
--

DROP TABLE IF EXISTS `crucero`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `crucero` (
  `referencia` char(7) NOT NULL,
  `compañia` varchar(25) NOT NULL,
  `precio` decimal(6,2) DEFAULT '0.00',
  PRIMARY KEY (`referencia`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `crucero`
--

LOCK TABLES `crucero` WRITE;
/*!40000 ALTER TABLE `crucero` DISABLE KEYS */;
INSERT INTO `crucero` VALUES ('CC-112','Costa Cruceros',798.00),('CC-885','Costa Cruceros',1095.00),('MSC-001','MSC Cruceros',865.00),('MSC-445','MSC Cruceros',1200.00),('MSC-885','MSC Cruceros',985.00),('PC-125','Pullmantur cruises',1120.00),('PC-211','Pullmantur cruises',1098.25);
/*!40000 ALTER TABLE `crucero` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `puerto`
--

DROP TABLE IF EXISTS `puerto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `puerto` (
  `codigo` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(35) NOT NULL,
  `pais` varchar(25) DEFAULT 'España',
  PRIMARY KEY (`codigo`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `puerto`
--

LOCK TABLES `puerto` WRITE;
/*!40000 ALTER TABLE `puerto` DISABLE KEYS */;
INSERT INTO `puerto` VALUES (1,'Barcelona','España'),(2,'Palma de Mallorca','España'),(3,'Cannes','Francia'),(4,'Génova','Italia'),(5,'Ajaccio','Italia'),(6,'Roma','Italia'),(7,'Marsella','Francia'),(8,'Messina','Italia'),(9,'Nápoles','Italia'),(10,'Valencia','España'),(11,'Palermo','Sicilia'),(12,'Malta','Malta'),(13,'Savona','Italia'),(14,'Ibiza','España'),(15,'Florencia','Italia');
/*!40000 ALTER TABLE `puerto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recorrido`
--

DROP TABLE IF EXISTS `recorrido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `recorrido` (
  `referencia` char(7) NOT NULL,
  `cod_puerto` int(11) NOT NULL,
  `num_parada` decimal(2,0) DEFAULT NULL,
  PRIMARY KEY (`referencia`,`cod_puerto`),
  KEY `fk_rec_puerto` (`cod_puerto`),
  CONSTRAINT `fk_rec_crucero` FOREIGN KEY (`referencia`) REFERENCES `crucero` (`referencia`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_rec_puerto` FOREIGN KEY (`cod_puerto`) REFERENCES `puerto` (`codigo`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recorrido`
--

LOCK TABLES `recorrido` WRITE;
/*!40000 ALTER TABLE `recorrido` DISABLE KEYS */;
INSERT INTO `recorrido` VALUES ('CC-885',1,2),('CC-885',2,1),('CC-885',6,5),('CC-885',7,3),('CC-885',11,6),('CC-885',13,4),('MSC-001',1,1),('MSC-001',3,2),('MSC-001',4,3),('MSC-001',6,4),('MSC-001',10,5),('MSC-445',1,3),('MSC-445',2,2),('MSC-445',3,4),('MSC-445',4,5),('MSC-445',10,1),('MSC-885',2,6),('MSC-885',4,2),('MSC-885',7,1),('MSC-885',8,4),('MSC-885',14,5),('MSC-885',15,3),('PC-125',1,1),('PC-125',2,2),('PC-125',4,3),('PC-125',7,4),('PC-125',8,5),('PC-125',9,6);
/*!40000 ALTER TABLE `recorrido` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rutas_tmp`
--

DROP TABLE IF EXISTS `rutas_tmp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rutas_tmp` (
  `clase` char(7) DEFAULT NULL,
  `parada` varchar(35) DEFAULT NULL,
  `pais` varchar(25) DEFAULT NULL,
  `num_parada` tinyint(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rutas_tmp`
--

LOCK TABLES `rutas_tmp` WRITE;
/*!40000 ALTER TABLE `rutas_tmp` DISABLE KEYS */;
INSERT INTO `rutas_tmp` VALUES ('A','Barcelona','España',1),('A','Palma de Mallorca','España',2),('A','Cagliari','Italia',3),('A','Civitavecchia','Italia',4),('A','Savona','Italia',5),('A','Marsella','Francia',6),('B','Venecia','Italia',1),('B','Palermo','Italia',2),('B','Mónaco','Mónaco',3),('B','Barcelona','España',4),('B','Ibiza','España',5),('B','Malta','Malta',6),('C','Cádiz','España',1),('C','Valencia','España',2),('C','Ibiza','España',3),('C','Malta','Malta',4);
/*!40000 ALTER TABLE `rutas_tmp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'viajes_ap'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-05-03 19:56:56
