/* BD creada por P.Lluyot para los alumnos de DAW */

DROP DATABASE IF EXISTS `instituto`;
CREATE DATABASE  IF NOT EXISTS `instituto` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `instituto`;
-- MySQL dump 10.13  Distrib 8.0.13, for Linux (x86_64)
--
-- Host: localhost    Database: instituto
-- ------------------------------------------------------
-- Server version	8.0.13

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `alumnado`
--

DROP TABLE IF EXISTS `alumnado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `alumnado` (
  `codigo` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(30) NOT NULL,
  `apellidos` varchar(30) NOT NULL,
  `sexo` char(1) DEFAULT NULL,
  `fechaNac` date DEFAULT NULL,
  `codCurso` int(11) DEFAULT NULL,
  PRIMARY KEY (`codigo`),
  KEY `Cod_Curso_FK` (`codCurso`),
  CONSTRAINT `Cod_Curso_FK` FOREIGN KEY (`codCurso`) REFERENCES `curso` (`codigo`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alumnado`
--

LOCK TABLES `alumnado` WRITE;
/*!40000 ALTER TABLE `alumnado` DISABLE KEYS */;
INSERT INTO `alumnado` VALUES (1,'Manuela','Suárez Ibáñez','M','1990-06-30',1),(2,'Milagrosa','Díaz Pérez','M','1984-10-28',3),(3,'José','Crespo De Hermoso','H','1993-03-02',1),(4,'Antonio Jesús','Martín Bollo','H','1999-11-04',1),(5,'Bárbara','Peláez Valencia','M','1967-08-27',4),(6,'Juan Pedro','Galve González','H','1991-11-10',4),(7,'María Isabel','Pérez Guillén','M','1962-11-14',2),(8,'Patricia','Román Gómez','M','1979-04-26',3),(9,'David','Tapia Solans','H','1980-06-05',4),(10,'María','Ferreiro Santos','M','1969-01-29',1),(11,'Javier','Lama Del Rey','H','1977-02-26',2),(12,'Alejandra','Calderón Valdivia','M','1960-11-16',2),(13,'Ana Dolores','Escudero Enciso','M','1975-09-07',4),(14,'Juan Carlos','Rodríguez Padilla','H','1963-11-15',5),(15,'Cecilio','Sastre González','H','1969-11-23',3),(16,'Juan','Martínez Sánchez','H','1974-10-23',2),(17,'María','Lafuente Fernandez','M','1986-11-21',2),(18,'Manuela','Martínez Alba','M','1962-11-26',1),(19,'Rosa Nieves','Sánchez Cano','M','1979-12-12',5),(20,'Belén','Ramos Anguita','M','1967-12-30',2),(21,'Julián','García Zabala','H','1963-01-04',3),(22,'Diego Jesús','Cano Salvador','H','1970-05-18',1),(23,'José Ignacio','Haro Faneca','H','1981-05-08',5),(24,'Joséfa','Castellanos Díez','M','1998-05-01',2),(25,'Beatriz','Rubio Bermejo','M','1970-04-29',5),(26,'Javier','Castro Gómez','H','1967-08-20',5),(27,'David','Gay García Del Valle','H','1989-07-22',3),(28,'David','Tocados García','H','1961-01-18',1),(29,'Elisa Isabel','Bruno Calvo','M','1998-05-13',4),(30,'Diana','Guillamón Posada','M','1980-04-29',2),(31,'David','Ranilla Urrutia','H','1964-11-22',2),(32,'Javier','Luengo Herrero','H','1963-04-22',3),(33,'David','Valencia Medina','H','1981-03-27',2),(34,'Rafael','Diaz Lama','H','1979-06-01',1),(35,'Carolina','Rivas Mendia','M','1974-07-30',1),(36,'José Manuel','García Zapico','H','1963-03-03',5),(37,'Miguel','Ibarrola Díez','H','1985-08-12',4),(38,'Encarnación','Asenjo Hernando','M','1962-04-03',4),(39,'Francisco','Calvo Bono','H','1974-06-17',5),(40,'José Antonio','Calvo Rodríguez','H','1989-05-04',5),(41,'Antonia','Moreno Raya','M','1976-08-04',1),(42,'José María','Fuentemilla Albert','H','1979-12-27',4),(43,'Belén','Portero Gracia','M','1991-10-28',4),(44,'Luis Antonio','Suárez García','H','1997-10-24',5),(45,'Francisco Antonio','Bautista Lamenca','H','1992-09-09',3),(46,'Silvia','Peña Castán','M','1977-07-20',5),(47,'Carmen','Kaamouchi Vicente','M','1990-05-31',3),(48,'María','Lastra Molina','M','1961-09-29',1),(49,'Rocio Emilia','Izquierdo Beltran','M','1981-04-01',5),(50,'Oscar','Díez Navarro','H','1972-06-17',3),(51,'Julián Andrés','Morales Riera','H','1998-12-31',5),(52,'Elena','Alcala Pérez','M','1970-10-11',5),(53,'José Antonio','González Roy','H','1965-06-19',1),(54,'Joséfa','Gómez Egido','M','1998-09-27',5),(55,'Myriam','Morales Isac','M','1984-09-15',5),(56,'Edurne','Martínez Lastra','M','1976-01-25',3),(57,'Juan José','Rivas Ramón','H','1994-05-01',4),(58,'Daniel José','Blanco Izquierdo','H','1982-02-05',2),(59,'Mirian','Montero Lamenca','M','1972-05-06',5),(60,'María Paz','Bertiz Sarmiento','M','1997-04-01',5),(61,'Emilio','Morillo Ramón','H','1986-09-05',5),(62,'Enrique','Fernandez Díez','H','1972-10-06',3),(63,'Ana Teresa','Casado Crespo','M','1971-01-13',4),(64,'José Ignacio','Martín Berdun','H','1987-08-18',5),(65,'David','Padilla Ortega','H','1960-08-29',4),(66,'Miguel','García Larreta','H','1982-02-04',5),(67,'Luis Miguel','Navarro Urrutia','H','1969-04-20',5),(68,'Nuria','Amostegui Luzuriaga','M','1973-10-25',2),(69,'Ana María','Sande Lamenca','M','1999-10-31',1),(70,'Leon José','Sarmiento Rivas','H','1969-04-11',5),(71,'Victor','García García','H','1999-12-29',4),(72,'Natalia','Timón Echepare','M','1986-01-19',2),(73,'Melanie','Campoy Gómez','M','1967-02-24',2),(74,'Ramiro','Llobregat Alonso','H','1984-05-14',3),(75,'Julián','Jimeno Díez','H','1976-02-27',3),(76,'Isabel','Soriano Matamoros','M','1995-07-07',2),(77,'Miguel','Sánchez Sánchez','H','1998-02-06',4),(78,'Noemí','Berruezo Requena','M','1973-11-25',4),(79,'Iván Angel De La','García Rubio','H','1979-03-26',4),(80,'Lutgarda','Goñi Timón','M','1974-10-17',2),(81,'María Jesús','Recover Aguilera','M','1984-03-20',1),(82,'María Soledad','Morillas Guillén','M','1975-04-30',4),(83,'Juan Manuel','Martín Alejano','H','1980-09-16',2),(84,'María Del Mar','Castro Cruz','M','1977-11-08',2),(85,'María Isabel','Echague González','M','1998-03-30',1),(86,'Juan','Talegon Cortés','H','1966-07-12',2),(87,'Miguel','Araguas De La Torre','H','1998-08-12',4),(88,'David','Alonso Gimenez','H','1995-09-02',4),(89,'Nicolás','Blanco González','H','1992-03-08',2),(90,'Alberto','Vega García','H','1976-08-29',4),(91,'Eva María','Fenoy Ordoñez','M','1989-12-04',2),(92,'Ana M.','Guerrero Lanza','M','1963-11-05',1),(93,'Ana María','Ferreiro Díez','M','1999-07-01',5),(94,'Arturo','Reviriego Cervantes','H','1964-08-02',5),(95,'Alejandro','Cano Morales','H','1960-05-13',1),(96,'Azucena','Berenguel Roy','M','1998-05-27',4),(97,'Paz De','Garralda Arias','M','1972-09-06',3),(98,'Pablo Cesar','Urbistondo González','H','1991-02-12',2),(99,'Oscar','Martín Galindo','H','1992-08-03',5),(100,'Luis','Molina Tagarro','H','1996-01-16',4);
/*!40000 ALTER TABLE `alumnado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `alumnado_nuevo`
--

DROP TABLE IF EXISTS `alumnado_nuevo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `alumnado_nuevo` (
  `nombre` varchar(30) DEFAULT NULL,
  `apellidos` varchar(30) DEFAULT NULL,
  `sexo` char(1) DEFAULT NULL,
  `fechaNac` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alumnado_nuevo`
--

LOCK TABLES `alumnado_nuevo` WRITE;
/*!40000 ALTER TABLE `alumnado_nuevo` DISABLE KEYS */;
INSERT INTO `alumnado_nuevo` VALUES ('María','Gómez Andrés','M','1985-05-04'),('José Manuel','Padilla Vegas','H','1999-05-19'),('Ricardo','Marquina Hernando','H','1982-02-20'),('Miguel','Diaz Fabre','H','1985-04-17'),('Luis Miguel','Agurruza Rodríguez','H','1983-04-25'),('Nicolas','Lobato Barranco','H','1961-06-25'),('Miguel','Burgos Zapico','H','1986-04-13'),('José Jesús','Valdivieso Jiménez','H','1985-12-23'),('Ana María','Beamonte Gómez','M','1968-07-25'),('María','López Carreño','M','1963-11-18'),('María Del Mar','Asensio Segura','M','1984-05-21'),('Rosa Nieves','Larrañeta Lázaro','M','1976-06-10'),('Elena','Daza Faneca','M','1960-09-18'),('Gema','Pastor Adell','M','1983-02-13'),('María Carmen','Checa Cano','M','1960-08-11'),('José Antonio','Gracia González','H','1962-11-28'),('Amalia','Gil Per','M','1965-01-10'),('Victor','Ramon García','H','1991-08-24'),('Esperanza Victoria','Panizo Del Águila','M','1972-12-07'),('Antonio','Alonso Soriano','H','1985-06-15'),('Javier','Botaz Hernández','H','1999-03-31'),('Francisco','Cutillas Hernández','H','1982-03-30'),('Eduardo','López Rodríguez','H','1964-11-20'),('Adolfo','López El Aakrouti','H','1987-10-16'),('María Rosa','Mora Bautista','M','1969-04-20'),('Gonzalo','Ibáñez Palencia','H','1965-12-21'),('Ana M.','Díez Izquierdo','M','1976-10-07'),('Alicia María','Díaz Guerrero','M','1968-08-27'),('Montserrat','Vela Sastre','M','1980-01-29'),('Luis','Bermejo García','H','1984-11-07');
/*!40000 ALTER TABLE `alumnado_nuevo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `curso`
--

DROP TABLE IF EXISTS `curso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `curso` (
  `codigo` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(20) NOT NULL,
  `codProfesor` int(11) DEFAULT NULL,
  `maxAlumn` decimal(2,0) DEFAULT NULL,
  `fechaIni` date DEFAULT NULL,
  `fechaFin` date DEFAULT NULL,
  `numHoras` decimal(3,0) DEFAULT NULL,
  PRIMARY KEY (`codigo`),
  KEY `cod_profe_FK` (`codProfesor`),
  CONSTRAINT `cod_profe_FK` FOREIGN KEY (`codProfesor`) REFERENCES `profesor` (`codigo`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `curso`
--

LOCK TABLES `curso` WRITE;
/*!40000 ALTER TABLE `curso` DISABLE KEYS */;
INSERT INTO `curso` VALUES (1,'Curso 1',NULL,30,'2011-01-01','2011-12-31',100),(2,'Curso 2',NULL,30,'2011-01-01','2011-12-31',100),(3,'Curso 3',NULL,30,'2011-01-01','2011-12-31',100),(4,'Curso 4',NULL,30,'2011-01-01','2011-12-31',100),(5,'Curso 5',NULL,30,'2011-01-01','2011-12-31',100),(6,'Curso 6',NULL,30,'2011-01-01','2011-12-31',100);
/*!40000 ALTER TABLE `curso` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `profesor`
--

DROP TABLE IF EXISTS `profesor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `profesor` (
  `codigo` int(11) NOT NULL,
  `nombre` varchar(30) NOT NULL,
  `apellidos` varchar(30) NOT NULL,
  `dni` char(9) DEFAULT NULL,
  `especialidad` varchar(20) DEFAULT NULL,
  `fechaNac` date DEFAULT NULL,
  `antiguedad` decimal(2,0) DEFAULT NULL,
  PRIMARY KEY (`codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profesor`
--

LOCK TABLES `profesor` WRITE;
/*!40000 ALTER TABLE `profesor` DISABLE KEYS */;
/*!40000 ALTER TABLE `profesor` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-02-13 17:17:21
