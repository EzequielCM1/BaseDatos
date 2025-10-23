-- MySQL dump 10.13  Distrib 8.0.26, for Linux (x86_64)
--
-- Host: 127.0.0.1    Database: peliculas
-- ------------------------------------------------------
-- Server version	8.0.26

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `alquiler`
--
drop database if exists peliculas;
create database peliculas;
use peliculas;

DROP TABLE IF EXISTS `alquiler`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `alquiler` (
  `copia_pel` char(3) NOT NULL,
  `socio` char(4) NOT NULL,
  `fec_alquila` date NOT NULL,
  `fec_devolucion` date DEFAULT NULL,
  PRIMARY KEY (`copia_pel`,`socio`,`fec_alquila`),
  KEY `socio` (`socio`),
  CONSTRAINT `alquiler_ibfk_1` FOREIGN KEY (`copia_pel`) REFERENCES `copia_pelicula` (`id_copia`) ON DELETE CASCADE,
  CONSTRAINT `alquiler_ibfk_2` FOREIGN KEY (`socio`) REFERENCES `socio` (`num_socio`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alquiler`
--

LOCK TABLES `alquiler` WRITE;
/*!40000 ALTER TABLE `alquiler` DISABLE KEYS */;
INSERT INTO `alquiler` VALUES ('101','1001','2017-11-28','2017-11-29'),('102','1005','2017-11-24','2017-11-25'),('103','1002','2017-11-29','2017-11-30'),('104','1004','2017-11-29','2017-11-30'),('104','1005','2017-12-01','2017-12-02'),('106','1002','2017-12-07','2017-12-10'),('107','1003','2017-11-28','2017-11-29'),('107','1005','2017-11-28','2017-11-29'),('107','1005','2017-12-05','2017-12-06'),('108','1001','2017-12-01','2017-12-03'),('109','1003','2017-11-15','2017-11-16'),('109','1004','2017-12-28','2017-12-29'),('110','1006','2017-10-01','2017-10-04'),('111','1005','2017-11-13','2017-11-14'),('112','1001','2017-11-29','2017-11-30'),('112','1006','2017-10-01','2017-10-04'),('113','1001','2017-10-09','2017-10-10'),('113','1006','2017-10-16',NULL);
/*!40000 ALTER TABLE `alquiler` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `copia_pelicula`
--

DROP TABLE IF EXISTS `copia_pelicula`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `copia_pelicula` (
  `id_copia` char(3) NOT NULL,
  `estado` varchar(10) DEFAULT NULL,
  `observacion` varchar(300) DEFAULT NULL,
  `pelicula` char(4) DEFAULT NULL,
  PRIMARY KEY (`id_copia`),
  KEY `pelicula` (`pelicula`),
  CONSTRAINT `copia_pelicula_ibfk_1` FOREIGN KEY (`pelicula`) REFERENCES `pelicula` (`codigo`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `copia_pelicula`
--

LOCK TABLES `copia_pelicula` WRITE;
/*!40000 ALTER TABLE `copia_pelicula` DISABLE KEYS */;
INSERT INTO `copia_pelicula` VALUES ('101','funciona',NULL,'CRS'),('102','funciona',NULL,'CRS'),('103','funciona',NULL,'FRZ'),('104','estropeada','Rayado','FRZ'),('105','funciona',NULL,'MPS'),('106','funciona',NULL,'HBB'),('107','funciona',NULL,'HBB'),('108','funciona',NULL,'BGH'),('109','funciona',NULL,'BGH'),('110','funciona',NULL,'NCH'),('111','estropeada','Disco sucio','NCH'),('112','funciona',NULL,'HRL'),('113','perdida','No devuelta','LRF');
/*!40000 ALTER TABLE `copia_pelicula` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pelicula`
--

DROP TABLE IF EXISTS `pelicula`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pelicula` (
  `codigo` char(4) NOT NULL,
  `titulo` varchar(50) DEFAULT NULL,
  `duracion` decimal(3,0) DEFAULT NULL,
  `anyo` char(4) DEFAULT NULL,
  `genero` varchar(20) DEFAULT NULL,
  `precio_alquiler` decimal(4,2) DEFAULT NULL,
  PRIMARY KEY (`codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pelicula`
--

LOCK TABLES `pelicula` WRITE;
/*!40000 ALTER TABLE `pelicula` DISABLE KEYS */;
INSERT INTO `pelicula` VALUES ('BGH','Big Hero 6',108,'2014','Animación',3.00),('CRS','Cars2: Una aventura de espías',106,'2011','Animación',2.50),('FRZ','Frozen: El reino del hielo',102,'2013','Animación',2.50),('HBB','El Hobbit: La batalla de los cinco ejércitos',160,'2014','Aventura',3.00),('HRL','Ahora los padres son ellos',98,'2010','Comedia',3.00),('LRF','El Orfanato',100,'2007','Terror',1.50),('MPS','Lo imposible',107,'2012','Drama',2.00),('NCH','Noche en el museo: El secreto del Faraón',97,'2014','Aventura',3.00);
/*!40000 ALTER TABLE `pelicula` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `socio`
--

DROP TABLE IF EXISTS `socio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `socio` (
  `num_socio` char(4) NOT NULL,
  `nombre` varchar(20) DEFAULT NULL,
  `apellido1` varchar(20) DEFAULT NULL,
  `apellido2` varchar(20) DEFAULT NULL,
  `telefono` char(9) DEFAULT NULL,
  `domicilio` varchar(40) DEFAULT NULL,
  `poblacion` varchar(20) DEFAULT NULL,
  `fec_nac` date DEFAULT NULL,
  PRIMARY KEY (`num_socio`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `socio`
--

LOCK TABLES `socio` WRITE;
/*!40000 ALTER TABLE `socio` DISABLE KEYS */;
INSERT INTO `socio` VALUES ('1001','Pedro','Gutiérrez','Solero','950333222','C/Gran Vía, 33','Roquetas de Mar','1970-11-16'),('1002','María','López','López','65565565','C/Nicaragua, 4','Aguadulce','1981-05-22'),('1003','Rubén','Danco','Romero','950033022','C/Violeta, 3','Aguadulce','1985-02-02'),('1004','Jesús','Estevan','Díaz','950342342','Plaza Central, 17','Roquetas de Mar','1972-01-30'),('1005','Lucía','Cerros','Pla','611222333','C/Comercio, 22','Roquetas de Mar','1992-07-12'),('1006','Marga','Jiménez','Ganga','744222333','C/Mercado, 178','El Parador','1995-10-20');
/*!40000 ALTER TABLE `socio` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-02-14 20:32:18