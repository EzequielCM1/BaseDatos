DROP DATABASE IF EXISTS `BD_perros_asistencia`;
CREATE DATABASE  IF NOT EXISTS `BD_perros_asistencia` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `BD_perros_asistencia`;
-- MySQL dump 10.13  Distrib 8.2.0, for Linux (x86_64)
--
-- Host: localhost    Database: BD_perros_asistencia
-- ------------------------------------------------------
-- Server version	8.2.0

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
-- Table structure for table `fase`
--

DROP TABLE IF EXISTS `fase`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fase` (
  `fase_id` int NOT NULL,
  `nombre` varchar(50) NOT NULL,
  PRIMARY KEY (`fase_id`),
  UNIQUE KEY `nombre` (`nombre`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fase`
--

LOCK TABLES `fase` WRITE;
/*!40000 ALTER TABLE `fase` DISABLE KEYS */;
INSERT INTO `fase` VALUES (5,'Alerta Médica'),(3,'Asistencia Visual'),(4,'Movilidad Reducida'),(2,'Obediencia'),(1,'Socialización');
/*!40000 ALTER TABLE `fase` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `instructor`
--

DROP TABLE IF EXISTS `instructor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `instructor` (
  `instructor_id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  `apellidos` varchar(100) NOT NULL,
  `dni` char(9) NOT NULL,
  `fecha_nacimiento` date DEFAULT NULL,
  `email` varchar(100) NOT NULL,
  `telefono` char(9) NOT NULL,
  `direccion` varchar(150) NOT NULL,
  PRIMARY KEY (`instructor_id`),
  UNIQUE KEY `dni` (`dni`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `instructor`
--

LOCK TABLES `instructor` WRITE;
/*!40000 ALTER TABLE `instructor` DISABLE KEYS */;
INSERT INTO `instructor` VALUES (1,'Javier','Ureña Huguet','12345678Z','1985-07-15','javier.urena@gmail.com','864219054','Calle Feria 82, Sevilla, 41003'),(2,'Lorena','Salas Aller','87654321T','1990-11-20','lorena.salas@hotmail.com','654118578','Avenida del Puerto 45, Cádiz, 11006'),(3,'Ana','Hidalgo Anglada','45678912R','2000-03-05','ana.hidalgo@outlook.com','621297929','Calle San Jacinto 55, Sevilla, 41010'),(4,'Modesto','Ugarte Cabo','98765432W','1982-09-10','modesto.ugarte@gmail.com','634192136','Calle Ancha 53, Cádiz, 11001'),(5,'Virginia','García Bermúdez','23456789M','1995-01-28','virginia.garcia@educa.es','602006280','Calle Asunción 1, Sevilla, 41011'),(6,'Angelina','Castillo Lorenzo','34567890L','1988-05-18','angelina.castillo@outlook.com','619925698','Paseo Marítimo 5, Cádiz, 11010'),(7,'Reyes','Arribas Baena','67890123S','2004-12-01','reyes.arribas@gmail.com','600726708','Calle Betis 7, Sevilla, 41010'),(8,'Roberta','Mateu Burgos','89012345G','1980-04-04','roberta.mateu@hotmail.com','678898804','Plaza San Antonio 7, Cádiz, 11003'),(9,'Marc','Montalbán Osorio','10928374F','1998-08-22','marc.montalban@educa.es','625591747','Avenida de la Palmera 90, Sevilla, 41012'),(10,'Pepe','Sobrino Niño','73829164H','2003-02-14','pepe.sobrino@gmail.com','609018413','Calle Nueva 78, Cádiz, 11005');
/*!40000 ALTER TABLE `instructor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `perro`
--

DROP TABLE IF EXISTS `perro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `perro` (
  `perro_id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  `raza` varchar(50) NOT NULL,
  `fecha_ingreso` date DEFAULT NULL,
  `fecha_nacimiento` date DEFAULT NULL,
  `entrenamiento_completo` tinyint(1) NOT NULL DEFAULT '0',
  `usuario_id` int DEFAULT NULL,
  PRIMARY KEY (`perro_id`),
  CONSTRAINT `CHK_Perro_Entrega` CHECK (((`usuario_id` is null) or (`entrenamiento_completo` = true)))
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `perro`
--

LOCK TABLES `perro` WRITE;
/*!40000 ALTER TABLE `perro` DISABLE KEYS */;
INSERT INTO `perro` VALUES (1,'María José','Golden Retriever','2025-01-08','2023-08-20',1,2),(2,'Horacio','Labrador','2025-01-08','2024-01-10',0,NULL),(3,'Concepción','Labrador','2025-01-08','2023-10-05',0,NULL),(4,'Serafina','Caniche','2025-01-08','2024-02-18',0,NULL),(5,'Rodolfo','Caniche','2025-01-10','2023-09-01',0,NULL),(6,'Hernando','Labrador','2025-01-10','2024-03-14',0,NULL),(7,'Loreto','Labrador','2025-01-10','2023-11-25',1,8),(8,'Obdulia','Caniche','2025-01-08',NULL,1,6),(9,'Cándido','Labrador','2025-01-15','2024-01-20',1,12),(10,'Vera','Pastor Alemán','2025-01-30','2023-07-07',0,NULL),(11,'Noemí','Border Collie','2025-02-01','2024-02-05',1,NULL),(12,'Amado','Labrador','2025-02-01','2023-12-10',0,NULL),(13,'Desiderio','Pastor Alemán','2025-02-01','2024-01-15',0,NULL),(14,'Cloe','Labrador','2025-02-01',NULL,0,NULL),(15,'Mariana','Labrador','2025-02-15','2023-10-30',0,NULL),(16,'Albert','Labrador','2025-03-01','2024-03-08',0,NULL),(17,'Caridad','Border Collie','2025-02-15','2023-11-11',0,NULL),(18,'Manu','Labrador','2025-03-01','2024-01-01',0,NULL),(19,'Ileana','Caniche','2025-03-01',NULL,0,NULL),(20,'María','Golden Retriever','2025-03-01','2023-09-19',0,NULL);
/*!40000 ALTER TABLE `perro` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sesion`
--

DROP TABLE IF EXISTS `sesion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sesion` (
  `sesion_id` int NOT NULL AUTO_INCREMENT,
  `perro_id` int NOT NULL,
  `instructor_id` int NOT NULL,
  `fase_id` int NOT NULL,
  `fecha` date NOT NULL,
  `evaluacion` enum('Necesita mejora','Satisfactorio','Excelente') DEFAULT NULL,
  PRIMARY KEY (`sesion_id`),
  UNIQUE KEY `UQ_Sesion_Perro_Fase` (`perro_id`,`fase_id`),
  UNIQUE KEY `UQ_SesionId_Instructor` (`sesion_id`,`instructor_id`),
  KEY `instructor_id` (`instructor_id`),
  KEY `fase_id` (`fase_id`),
  CONSTRAINT `sesion_ibfk_1` FOREIGN KEY (`perro_id`) REFERENCES `perro` (`perro_id`),
  CONSTRAINT `sesion_ibfk_2` FOREIGN KEY (`instructor_id`) REFERENCES `instructor` (`instructor_id`),
  CONSTRAINT `sesion_ibfk_3` FOREIGN KEY (`fase_id`) REFERENCES `fase` (`fase_id`)
) ENGINE=InnoDB AUTO_INCREMENT=66 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sesion`
--

LOCK TABLES `sesion` WRITE;
/*!40000 ALTER TABLE `sesion` DISABLE KEYS */;
INSERT INTO `sesion` VALUES (1,1,1,1,'2025-01-11','Excelente'),(2,1,2,2,'2025-01-12','Necesita mejora'),(3,1,3,3,'2025-01-13','Satisfactorio'),(4,1,5,4,'2025-01-20','Satisfactorio'),(5,1,1,5,'2025-01-25','Satisfactorio'),(6,2,8,1,'2025-01-08','Excelente'),(7,2,9,2,'2025-01-10','Excelente'),(8,3,10,1,'2025-01-12','Satisfactorio'),(9,3,1,2,'2025-01-20','Excelente'),(10,3,2,3,'2025-01-12','Necesita mejora'),(11,4,3,1,'2025-01-11','Excelente'),(12,4,5,2,'2025-01-12','Excelente'),(13,4,6,3,'2025-01-13','Satisfactorio'),(14,4,8,4,'2025-01-15','Satisfactorio'),(15,5,9,1,'2025-01-15','Satisfactorio'),(16,6,10,1,'2025-01-16','Satisfactorio'),(17,6,1,2,'2025-01-17','Necesita mejora'),(18,6,2,3,'2025-01-18','Excelente'),(19,6,3,4,'2025-02-01','Excelente'),(20,7,5,1,'2025-01-20','Necesita mejora'),(21,7,6,2,'2025-01-21','Excelente'),(22,7,8,3,'2025-01-22','Necesita mejora'),(23,7,9,4,'2025-02-01','Excelente'),(24,7,10,5,'2025-02-02','Satisfactorio'),(25,8,1,1,'2025-01-08','Necesita mejora'),(26,8,2,2,'2025-01-10','Necesita mejora'),(27,8,3,3,'2025-01-11','Necesita mejora'),(28,8,5,4,'2025-01-28','Necesita mejora'),(29,8,6,5,'2025-01-29','Satisfactorio'),(30,9,8,1,'2025-01-20','Excelente'),(31,9,9,2,'2025-01-31','Excelente'),(32,9,10,3,'2025-02-01','Satisfactorio'),(33,9,1,4,'2025-02-12','Excelente'),(34,9,2,5,'2025-02-15','Necesita mejora'),(35,10,3,1,'2025-02-04','Excelente'),(36,10,5,2,'2025-02-05','Necesita mejora'),(37,10,6,3,'2025-02-16','Satisfactorio'),(38,10,8,4,'2025-02-27','Satisfactorio'),(39,11,9,1,'2025-02-07','Necesita mejora'),(40,11,10,2,'2025-02-09','Satisfactorio'),(41,11,1,3,'2025-02-13','Excelente'),(42,11,2,4,'2025-02-21','Necesita mejora'),(43,11,3,5,'2025-02-22','Satisfactorio'),(44,12,5,1,'2025-02-13','Excelente'),(45,12,6,2,'2025-02-14','Satisfactorio'),(46,12,8,3,'2025-02-15','Satisfactorio'),(47,12,9,4,'2025-02-16','Satisfactorio'),(48,13,10,1,'2025-02-08','Necesita mejora'),(49,13,1,2,'2025-02-11','Necesita mejora'),(50,13,2,3,'2025-02-19','Necesita mejora'),(51,13,3,4,'2025-03-02','Necesita mejora'),(52,13,5,5,'2025-03-21','Excelente'),(53,14,6,1,'2025-02-03','Necesita mejora'),(54,14,8,2,'2025-02-10','Necesita mejora'),(55,14,9,3,'2025-02-24','Necesita mejora'),(56,15,10,1,'2025-02-25','Excelente'),(57,15,1,2,'2025-02-26','Satisfactorio'),(58,15,2,3,'2025-02-27','Necesita mejora'),(59,15,3,4,'2025-02-28','Necesita mejora'),(60,15,5,5,'2025-03-01','Necesita mejora'),(61,17,6,1,'2025-03-02','Satisfactorio'),(62,18,8,1,'2025-03-03','Excelente'),(63,18,9,2,'2025-03-04','Excelente'),(64,18,10,3,'2025-03-05','Satisfactorio'),(65,20,1,1,'2025-03-06','Satisfactorio');
/*!40000 ALTER TABLE `sesion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario_final`
--

DROP TABLE IF EXISTS `usuario_final`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuario_final` (
  `usuario_id` int NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `apellidos` varchar(100) NOT NULL,
  `dni` char(9) NOT NULL,
  `fecha_nacimiento` date DEFAULT NULL,
  `email` varchar(100) NOT NULL,
  `telefono` varchar(15) NOT NULL,
  `direccion` varchar(150) NOT NULL,
  PRIMARY KEY (`usuario_id`),
  UNIQUE KEY `dni` (`dni`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario_final`
--

LOCK TABLES `usuario_final` WRITE;
/*!40000 ALTER TABLE `usuario_final` DISABLE KEYS */;
INSERT INTO `usuario_final` VALUES (1,'Ana','Gutierrez Roig','60692407Z','1990-04-10','agutrog@gmail.com','614547874','Calle Real 12, Sevilla, 41001'),(2,'Ariel','Moles Lumbreras','70548490L','1975-07-22','amolumb@hotmail.com','634587123','Avenida de la Constitución 34, Granada, 18014'),(3,'María José','Navarro Pont','61223186K','1968-11-03','mjnavpon@gmail.com','622341987','Paseo de los Tristes 8, Córdoba, 14003'),(4,'José Luis','Cortés Tena','13281161V','1988-02-14','jlcorten@hotmail.com','638901234','Calle Larios 15, Málaga, 29005'),(5,'Anastasia','Pozuelo Carmona','81350877N','1959-12-01','apozcar@hotmail.com','647384920','Plaza Nueva 6, Jaén, 23001'),(6,'Sergio','Colomer Castillo','34402172P','1992-06-08','scolcas@gmail.com','632415987','Ronda del Pilar 22, Almería, 04001'),(7,'Ana','Tenorio Murcia','15892330R','1970-09-25','atenmur@hotmail.com','611293847','Calle Rosario 3, Cádiz, 11004'),(8,'Danilo','Iglesia Clemente','91429462H','1983-03-17','diglcle@gmail.com','650938174','Avenida de Huelva 18, Huelva, 21001'),(9,'Silvio','Prada Mascaró','29446366M','1995-05-30','spramas@gmail.com','623184750','Calle San Fernando 7, Córdoba, 14002'),(10,'Erasmo','Garzón Tomé','45025311S','1962-01-05','egarzome@hotmail.com','698745231','Camino de Ronda 99, Granada, 18004'),(11,'Conrado','Sotelo Arcos','86715794L','1978-08-11','csotar@gmail.com','667349821','Avenida de Andalucía 1, Sevilla, 41006'),(12,'Valero','Gárate Villena','19377480X','1998-04-29','vgarvil@hotmail.com','651928374','Plaza de las Monjas 10, Huelva, 21003'),(13,'Concha','Torrents Larrea','16806049J','1955-07-06','ctorlar@gmail.com','612987435','Calle Alhóndiga 20, Jaén, 23003'),(14,'Remigio','Almeida Vilalta','29106856A','1981-10-19','realvil@hotmail.com','690347891','Paseo del Parque 5, Málaga, 29016'),(15,'Flavio','Cañas Monreal','71764645Q','1993-03-03','fcanmon@gmail.com','625489730','Calle del Agua 42, Almería, 04007'),(16,'José Antonio','Gonzalez Ferrándiz','09456944F','1973-05-21','jagonfer@hotmail.com','639284615','Calle Betis 15, Sevilla, 41010'),(17,'Blanca','Manzanares Borrego','69026119D','1986-11-15','bmanbor@gmail.com','664829103','Avenida de Cádiz 40, Córdoba, 14009'),(18,'Ximena','Garay Plana','88698229Y','1965-01-27','xgarpla@hotmail.com','620948371','Calle Mesones 12, Granada, 18001'),(19,'Vilma','Hervia Burgos','10350003T','1999-09-09','vhervbur@gmail.com','691028374','Paseo de la Victoria 21, Córdoba, 14004'),(20,'Rufino','Leal Ortuño','63166784C','1971-06-02','rleortu@hotmail.com','618372904','Calle Amador de los Ríos 8, Jaén, 23006');
/*!40000 ALTER TABLE `usuario_final` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'BD_perros_asistencia'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-05-05 12:15:36
