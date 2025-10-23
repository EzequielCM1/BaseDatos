
CREATE DATABASE if not exists `centroestudios` /* !40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;
USE `centroestudios`;
/* !40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/* !40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/* !40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
/* !40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/* !40103 SET TIME_ZONE='+00:00' */;
/* !40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/* !40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/* !40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO,ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */;
/* !40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
DROP TABLE IF EXISTS `alumno`;
/* !40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `alumno` (
  `dni_alumno` char(9) NOT NULL,
  `nombre` varchar(25) NOT NULL,
  `apellidos` varchar(45) NOT NULL,
  `direccion` varchar(50) DEFAULT NULL,
  `cp` char(5) DEFAULT NULL,
  `fecha_nacimiento` date DEFAULT NULL,
  `telefono` char(9) DEFAULT NULL,
  PRIMARY KEY (`dni_alumno`),
  KEY `fk_alumno_1_idx` (`cp`),
  CONSTRAINT `fk_alumno_1` FOREIGN KEY (`cp`) REFERENCES `cp` (`cp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/* !40101 SET character_set_client = @saved_cs_client */;
LOCK TABLES `alumno` WRITE;
/* !40000 ALTER TABLE `alumno` DISABLE KEYS */;
INSERT INTO `alumno` VALUES ('10201448M','Gonzalo','Tamayo Pérez','C/. callegenérica nº 57','41500','1997-02-11','686677368'),('11508223N','Francisco Javier','Flores Navas','C/. callegenérica nº 56','41500','1998-12-13','663155429'),('13142089G','Pilar','Viñas Casares','C/. callegenérica nº 13','41510','2001-03-05','625059907'),('13702711R','Pilar','García Ropero','C/. callegenérica nº 54','41510','1996-12-31','657915202'),('14575769W','Concepción','Godoy Moreno','C/. callegenérica nº 60','41701','1999-05-13','616541337'),('14595801R','Raquel','Lozano Pastor','C/. callegenérica nº 94','41500','1995-06-02','611265474'),('15111589Z','María Pilar','Galán Jin','C/. callegenérica nº 93','41500','2003-06-26','630946024'),('15403016P','Ana María','Merino Mendoza','C/. callegenérica nº 69','41700','2000-03-08','655113605'),('15668886K','Rubén','Madariaga Vázquez','C/. callegenérica nº 18','41500','2003-11-06','659201953'),('16326499H','Luis','Álvarez Villalba','C/. callegenérica nº 12','41700','2000-02-10','675772877'),('16587977D','Consuelo','Torrado Rubio','C/. callegenérica nº 90','41520','2003-12-10','646250934'),('16771968T','José','Losada López','C/. callegenérica nº 1','41410','2004-01-15','649985814'),('17283671E','María Dolores','Revilla Rodríguez','C/. callegenérica nº 62','41701','1999-09-01','677787098'),('18427173X','José Ramón','López Gutiérrez','C/. callegenérica nº 78','41500','2003-11-03','671293283'),('20912651Q','Pedro','Jiménez Bueno','C/. callegenérica nº 65','41701','1999-04-22','675534891'),('21850308D','Rocío','Álvarez Jiménez','C/. callegenérica nº 53','41500','2001-08-02','699679315'),('22057348A','María','Benavides Cejudo','C/. callegenérica nº 40','41500','2001-12-10','659413586'),('22925018K','Fernando','Escribano López','C/. callegenérica nº 45','41701','1997-12-29','682342058'),('23929890T','Eduardo','Pereira Jaramillo','C/. callegenérica nº 75','41700','1997-01-05','645137455'),('25549957Q','Beatriz','Navarro Sierra','C/. callegenérica nº 31','41500','2002-06-21','695271880'),('26908336S','Rosa','Rodríguez Pérez','C/. callegenérica nº 89','41500','2003-05-18','698194458'),('27153982K','Antonio','Martínez Rodríguez','C/. callegenérica nº 38','41700','1998-05-03','687568010'),('28425064P','Jaime','Viñas Casares','C/. callegenérica nº 13','41510','1998-06-11','621699886'),('28714836A','Ana','Pajares Melo','C/. callegenérica nº 86','41500','2004-06-18','678824953'),('29660312H','María Dolores','Rodríguez Castro','C/. callegenérica nº 19','41500','1995-03-08','649290792'),('31109582N','María Carmen','Parada Álvarez','C/. callegenérica nº 72','41701','2002-06-23','684441037'),('31157465D','María José','Hernández García','C/. callegenérica nº 2','41410','2002-06-06','646833906'),('31217451B','Cristina','López Gámez','C/. callegenérica nº 96','41700','2001-05-21','643711781'),('31490193L','María Carmen','Peña Peiro','C/. callegenérica nº 87','41500','1996-07-08','612447664'),('34595320P','Jordi','Cañadas Moreno','C/. callegenérica nº 51','41510','2002-03-28','613787466'),('36111276B','Manuel','Flores De la Cruz','C/. callegenérica nº 6','41701','1995-10-18','623471958'),('36554390F','María','Miguélez Pellicer','C/. callegenérica nº 46','41510','1996-06-25','665791383'),('37388495V','Alejandro','Martínez Sainz','C/. callegenérica nº 24','41701','2005-04-28','648734260'),('37778234K','Manuel','Castilla Mas','C/. callegenérica nº 28','41520','1997-02-22','666319111'),('38971957K','Francisco Javier','Rosario Gómez','C/. callegenérica nº 16','41500','2002-12-08','679200585'),('40313211F','María Teresa','Dimitrova Martin','C/. callegenérica nº 8','41500','1996-08-18','659980308'),('40396530C','Dolores','Franco Brenes','C/. callegenérica nº 48','41700','2002-12-28','613638652'),('42568730P','Luis','Fuentes Mateo','C/. callegenérica nº 33','41700','2004-10-29','644185920'),('43478590B','María José','Rojo Domínguez','C/. callegenérica nº 41','41500','2001-12-08','653022816'),('43657410Y','María José','Solé Pérez','C/. callegenérica nº 29','41500','2004-03-08','627656116'),('44894511Y','Fernando','Gascón Tirado','C/. callegenérica nº 61','41510','1997-11-02','649743011'),('45374522F','María Dolores','Sánchez Navalón','C/. callegenérica nº 76','41701','2004-10-20','681357101'),('46689742H','Daniel','Benavides Cejudo','C/. callegenérica nº 40','41500','1997-05-15','651867733'),('47176804D','Marta','Benavides Cejudo','C/. callegenérica nº 40','41500','2004-05-02','698729495'),('48403143B','Josefa','Martínez Aguirre','C/. callegenérica nº 23','41520','2000-01-10','615644493'),('49462121T','María Pilar','Barba Augusto','C/. callegenérica nº 3','41500','1996-06-22','675361455'),('50118418S','Francisco','Pérez Vergara','C/. callegenérica nº 47','41500','1999-09-12','670925584'),('50233514L','Javier','Alcaraz Casado','C/. callegenérica nº 15','41500','2001-01-02','685248793'),('50459807S','Pilar','Rodríguez Cayuela','C/. callegenérica nº 59','41701','2005-12-24','671446448'),('50498008J','Antonio','Dimitrova Martin','C/. callegenérica nº 8','41500','1996-04-27','699767680'),('51622916Z','Adrián','Rivera Delgado','C/. callegenérica nº 4','41500','1996-07-09','647601013'),('52142320D','Manuel','Navarro Mayol','C/. callegenérica nº 95','41700','1999-04-23','670379841'),('54680013C','Juan Antonio','Barros Salazar','C/. callegenérica nº 39','41410','2003-06-30','643092909'),('55053504Z','María Teresa','López Alonso','C/. callegenérica nº 35','41510','2004-12-19','625605540'),('55890735E','Daniel','Mira Fernández','C/. callegenérica nº 30','41700','1997-06-14','614620507'),('57246140Z','José María','Serra Mínguez','C/. callegenérica nº 22','41700','1996-09-04','634182648'),('58888157S','Natalia','Trigueros Rodríguez','C/. callegenérica nº 71','41500','1995-04-18','673918645'),('60043926B','José Antonio','Martínez López','C/. callegenérica nº 37','41701','2005-05-10','680068457'),('60782173G','Javier','Fernández Vicente','C/. callegenérica nº 25','41500','1997-06-18','616794933'),('61308621M','Andrea','Ivars Padrón','C/. callegenérica nº 92','41500','2000-06-23','693099930'),('61762463B','María','Vergara Vázquez','C/. callegenérica nº 11','41410','1995-12-27','659157959'),('62018301C','María Teresa','Medina Romero','C/. callegenérica nº 70','41520','2005-12-22','621472472'),('62843009V','Sergio','Saavedra Pulido','C/. callegenérica nº 27','41500','2004-10-15','616214155'),('65571779K','Laura','Gómez Parra','C/. callegenérica nº 81','41500','1999-08-14','618771623'),('65869563R','Carmen','González Fernández','C/. callegenérica nº 83','41520','2005-11-15','694664801'),('69197084C','David','Duran Rubio','C/. callegenérica nº 55','41520','1998-12-30','626445230'),('69760968J','Encarnación','Sala Márquez','C/. callegenérica nº 42','41701','1998-09-11','650279916'),('69837330S','Tomas','Moreno Moreno','C/. callegenérica nº 34','41520','1995-07-06','639353824'),('70933170C','Francisco','Marín Fernández','C/. callegenérica nº 58','41510','1995-05-04','668204356'),('71070833M','Raúl','Pajares Carballo','C/. callegenérica nº 5','41410','2005-09-21','629103365'),('71441216L','María Rosario','Suarez Arévalo','C/. callegenérica nº 74','41500','2001-07-31','690420963'),('74349702V','Albert','Pablos Piñeiro','C/. callegenérica nº 9','41500','1999-08-03','689385213'),('75058589K','María Luisa','Fernández Escamilla','C/. callegenérica nº 64','41500','1995-04-20','620646673'),('76145319R','Margarita','Priego Tomas','C/. callegenérica nº 84','41520','1996-07-21','640096033'),('77961668V','María Ángeles','Martínez Cuadrado','C/. callegenérica nº 50','41500','2004-10-17','690392254'),('78472468X','Juan Manuel','Dávila Navas','C/. callegenérica nº 14','41700','2001-04-25','690697784'),('78549674M','María','Martínez Miralles','C/. callegenérica nº 26','41510','2001-07-05','694669480'),('78584180B','Ángeles','Rodríguez Martin','C/. callegenérica nº 63','41520','2005-07-01','690207343'),('80985574K','Isabel','Luque Cañas','C/. callegenérica nº 67','41500','1999-10-14','617662710'),('81477577P','María Teresa','Gómez Franco','C/. callegenérica nº 36','41500','1998-03-23','625504911'),('83669089B','José Luis','López Fernández','C/. callegenérica nº 79','41500','2001-10-14','659682835'),('85939835J','Sara','García Roldan','C/. callegenérica nº 21','41500','2004-08-03','644425398'),('86607489T','Paula','Robles Olivares','C/. callegenérica nº 68','41500','1999-07-09','689431761'),('88283285Q','Javier','Cordero Correa','C/. callegenérica nº 43','41500','1997-02-18','642790630'),('89172629L','Manuela','Jurado García','C/. callegenérica nº 10','41700','2003-04-17','617368563'),('91062263L','María','López Segura','C/. callegenérica nº 49','41500','1995-11-10','632847396'),('91175227F','Dolores','Costa Herraiz','C/. callegenérica nº 7','41510','1998-02-11','674272662'),('91385279T','María Pilar','Marín Fernández','C/. callegenérica nº 58','41510','1998-12-18','627478633'),('92124535J','María Ángeles','De Sousa Cabezas','C/. callegenérica nº 88','41500','2001-02-09','692709767'),('92754221M','Rubén','Gallego Peinado','C/. callegenérica nº 52','41500','2000-07-27','640073104'),('93536674K','Andrea','Rubio García','C/. callegenérica nº 73','41500','2002-01-11','651733012'),('94365846C','José','Carreira García','C/. callegenérica nº 20','41410','2000-02-05','665321334'),('95195051Y','Concepción','Rodríguez Castellano','C/. callegenérica nº 85','41701','2001-01-28','638379486'),('95416082F','Silvia','Jordán García','C/. callegenérica nº 91','41700','2005-11-30','636420688'),('95724032X','Marta','Fuente Lozano','C/. callegenérica nº 17','41500','2002-12-17','623661871'),('97423633A','Juan','Peña Merino','C/. callegenérica nº 44','41701','1997-09-25','669795302');
/* !40000 ALTER TABLE `alumno` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `alumno_hermano`;
/* !40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `alumno_hermano` (
  `dni_alumno` char(9) NOT NULL,
  `dni_hermano` char(9) NOT NULL,
  PRIMARY KEY (`dni_alumno`,`dni_hermano`),
  KEY `fk_alumno_hermano_2_idx` (`dni_hermano`),
  CONSTRAINT `fk_alumno_hermano_1` FOREIGN KEY (`dni_alumno`) REFERENCES `alumno` (`dni_alumno`),
  CONSTRAINT `fk_alumno_hermano_2` FOREIGN KEY (`dni_hermano`) REFERENCES `alumno` (`dni_alumno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/* !40101 SET character_set_client = @saved_cs_client */;
LOCK TABLES `alumno_hermano` WRITE;
/* !40000 ALTER TABLE `alumno_hermano` DISABLE KEYS */;
INSERT INTO `alumno_hermano` VALUES ('13142089G','28425064P'),('22057348A','46689742H'),('22057348A','47176804D'),('46689742H','47176804D'),('40313211F','50498008J'),('91385279T','70933170C');
/* !40000 ALTER TABLE `alumno_hermano` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `asignatura`;
/* !40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `asignatura` (
  `cod_asignatura` int(11) NOT NULL,
  `nombre` varchar(30) NOT NULL,
  `num_horas` decimal(3,0) DEFAULT NULL,
  `dni_profesor` char(9) NOT NULL,
  `cod_curso` int(11) NOT NULL,
  PRIMARY KEY (`cod_asignatura`),
  KEY `fk_asignatura_1_idx` (`dni_profesor`),
  KEY `fk_asignatura_2_idx` (`cod_curso`),
  CONSTRAINT `fk_asignatura_1` FOREIGN KEY (`dni_profesor`) REFERENCES `profesor` (`dni_profesor`),
  CONSTRAINT `fk_asignatura_2` FOREIGN KEY (`cod_curso`) REFERENCES `curso` (`codigo_curso`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/* !40101 SET character_set_client = @saved_cs_client */;
LOCK TABLES `asignatura` WRITE;
/* !40000 ALTER TABLE `asignatura` DISABLE KEYS */;
INSERT INTO `asignatura` VALUES (1,'Programación con Python',100,'99696667Q',1),(2,'Javascript',150,'43010831A',2),(3,'Programación Apps Móviles',150,'85666556C',1),(4,'Programación Android',100,'84732483T',1),(5,'Diseño Web',120,'74857163Y',2),(6,'Bases de Datos Relacionales',120,'99600991C',2),(7,'Hojas de Cálculo',60,'77130412G',3),(8,'Bases de Datos',50,'68091221C',3),(9,'Procesadores de texto',50,'68091221C',3),(10,'Lenguaje Musical',100,'12327024J',4),(11,'Piano',100,'12327024J',4);
/* !40000 ALTER TABLE `asignatura` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `aula`;
/* !40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `aula` (
  `cod_aula` int(11) NOT NULL,
  `piso` decimal(1,0) NOT NULL,
  PRIMARY KEY (`cod_aula`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/* !40101 SET character_set_client = @saved_cs_client */;
LOCK TABLES `aula` WRITE;
/* !40000 ALTER TABLE `aula` DISABLE KEYS */;
INSERT INTO `aula` VALUES (1,1),(2,1),(3,2),(4,2);
/* !40000 ALTER TABLE `aula` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `aula_asignatura`;
/* !40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `aula_asignatura` (
  `cod_asignatura` int(11) NOT NULL,
  `cod_aula` int(11) NOT NULL,
  `dia` char(1) NOT NULL,
  `hora` decimal(1,0) NOT NULL,
  PRIMARY KEY (`cod_asignatura`,`cod_aula`,`dia`,`hora`),
  KEY `fk_aula_asignatura_1_idx` (`cod_aula`),
  CONSTRAINT `fk_aula_asignatura_1` FOREIGN KEY (`cod_aula`) REFERENCES `aula` (`cod_aula`),
  CONSTRAINT `fk_aula_asignatura_2` FOREIGN KEY (`cod_asignatura`) REFERENCES `asignatura` (`cod_asignatura`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/* !40101 SET character_set_client = @saved_cs_client */;
LOCK TABLES `aula_asignatura` WRITE;
/* !40000 ALTER TABLE `aula_asignatura` DISABLE KEYS */;
INSERT INTO `aula_asignatura` VALUES (1,1,'L',1),(1,1,'L',2),(2,1,'L',3),(2,1,'L',4),(2,1,'L',5),(6,1,'X',2),(8,1,'X',1),(9,1,'X',5),(6,2,'X',1),(10,2,'L',3),(10,2,'X',3),(3,3,'X',2),(3,3,'X',3),(3,3,'X',4),(4,3,'X',1),(4,3,'X',2),(5,3,'L',1),(5,3,'L',2),(7,3,'L',5),(11,4,'L',4),(11,4,'X',4);
/* !40000 ALTER TABLE `aula_asignatura` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `aula_normal`;
/* !40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `aula_normal` (
  `cod_aula` int(11) NOT NULL,
  `num_pupitres` decimal(2,0) NOT NULL,
  PRIMARY KEY (`cod_aula`),
  CONSTRAINT `fk_aula_normal_1` FOREIGN KEY (`cod_aula`) REFERENCES `aula` (`cod_aula`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/* !40101 SET character_set_client = @saved_cs_client */;
LOCK TABLES `aula_normal` WRITE;
/* !40000 ALTER TABLE `aula_normal` DISABLE KEYS */;
INSERT INTO `aula_normal` VALUES (1,30),(2,25);
/* !40000 ALTER TABLE `aula_normal` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `aula_tic`;
/* !40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `aula_tic` (
  `cod_aula` int(11) NOT NULL,
  `num_ordenadores` decimal(2,0) NOT NULL,
  PRIMARY KEY (`cod_aula`),
  CONSTRAINT `fk_aulatic_1` FOREIGN KEY (`cod_aula`) REFERENCES `aula` (`cod_aula`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/* !40101 SET character_set_client = @saved_cs_client */;
LOCK TABLES `aula_tic` WRITE;
/* !40000 ALTER TABLE `aula_tic` DISABLE KEYS */;
INSERT INTO `aula_tic` VALUES (1,20),(3,18);
/* !40000 ALTER TABLE `aula_tic` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `cp`;
/* !40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `cp` (
  `cp` char(5) NOT NULL,
  `poblacion` varchar(45) NOT NULL,
  PRIMARY KEY (`cp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/* !40101 SET character_set_client = @saved_cs_client */;
LOCK TABLES `cp` WRITE;
/* !40000 ALTER TABLE `cp` DISABLE KEYS */;
INSERT INTO `cp` VALUES ('41410','Carmona'),('41500','Alcalá de Guadaira'),('41510','Mairena del Alcor'),('41520','El Viso del Alcor'),('41700','Dos Hermanas'),('41701','Dos Hermanas');
/* !40000 ALTER TABLE `cp` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `curso`;
/* !40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `curso` (
  `codigo_curso` int(11) NOT NULL,
  `nombre` varchar(25) NOT NULL,
  `dni_tutor` char(9) NOT NULL,
  PRIMARY KEY (`codigo_curso`),
  KEY `fk_curso_1_idx` (`dni_tutor`),
  CONSTRAINT `fk_curso_1` FOREIGN KEY (`dni_tutor`) REFERENCES `profesor` (`dni_profesor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/* !40101 SET character_set_client = @saved_cs_client */;
LOCK TABLES `curso` WRITE;
/* !40000 ALTER TABLE `curso` DISABLE KEYS */;
INSERT INTO `curso` VALUES (1,'Lenguajes de Programación','84732483T'),(2,'Desarrollo Web','99600991C'),(3,'Ofimática','68091221C'),(4,'Piano','12327024J');
/* !40000 ALTER TABLE `curso` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `matricula`;
/* !40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `matricula` (
  `dni_alumno` char(9) NOT NULL,
  `cod_asignatura` int(11) NOT NULL,
  `nota` decimal(2,0) DEFAULT NULL,
  `comentarios` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`dni_alumno`,`cod_asignatura`),
  KEY `fk_matricula_2_idx` (`cod_asignatura`),
  CONSTRAINT `fk_matricula_1` FOREIGN KEY (`dni_alumno`) REFERENCES `alumno` (`dni_alumno`),
  CONSTRAINT `fk_matricula_2` FOREIGN KEY (`cod_asignatura`) REFERENCES `asignatura` (`cod_asignatura`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/* !40101 SET character_set_client = @saved_cs_client */;
LOCK TABLES `matricula` WRITE;
/* !40000 ALTER TABLE `matricula` DISABLE KEYS */;
INSERT INTO `matricula` VALUES ('10201448M',10,3,NULL),('10201448M',11,7,NULL),('13142089G',7,3,NULL),('13142089G',8,5,NULL),('13142089G',9,5,NULL),('13702711R',7,10,NULL),('13702711R',8,2,NULL),('13702711R',9,5,NULL),('14575769W',10,8,NULL),('14575769W',11,3,NULL),('14595801R',7,2,NULL),('14595801R',8,3,NULL),('14595801R',9,8,NULL),('15111589Z',7,10,NULL),('15111589Z',8,2,NULL),('15111589Z',9,6,NULL),('15403016P',7,2,NULL),('15403016P',8,3,NULL),('15403016P',9,0,NULL),('16587977D',10,0,NULL),('16587977D',11,1,NULL),('16771968T',10,4,NULL),('16771968T',11,10,NULL),('17283671E',2,2,NULL),('17283671E',5,3,NULL),('17283671E',6,1,NULL),('18427173X',10,6,NULL),('18427173X',11,6,NULL),('20912651Q',7,2,NULL),('20912651Q',8,4,NULL),('20912651Q',9,2,NULL),('21850308D',10,0,NULL),('21850308D',11,5,NULL),('22057348A',2,4,NULL),('22057348A',5,6,NULL),('22057348A',6,7,NULL),('22925018K',7,6,NULL),('22925018K',8,8,NULL),('22925018K',9,3,NULL),('23929890T',7,1,NULL),('23929890T',8,NULL,NULL),('23929890T',9,9,NULL),('25549957Q',7,9,NULL),('25549957Q',8,6,NULL),('25549957Q',9,3,NULL),('26908336S',10,NULL,NULL),('26908336S',11,1,NULL),('27153982K',7,5,NULL),('27153982K',8,NULL,NULL),('27153982K',9,10,NULL),('28425064P',2,6,NULL),('28425064P',5,9,NULL),('28425064P',6,8,NULL),('28714836A',7,NULL,NULL),('28714836A',8,4,NULL),('28714836A',9,8,NULL),('29660312H',2,8,NULL),('29660312H',5,6,NULL),('29660312H',6,7,NULL),('31109582N',2,6,NULL),('31109582N',5,10,NULL),('31109582N',6,1,NULL),('31157465D',1,7,NULL),('31157465D',2,1,NULL),('31157465D',3,7,NULL),('31157465D',4,9,NULL),('31157465D',5,3,NULL),('31157465D',6,0,NULL),('31490193L',1,2,NULL),('31490193L',2,9,NULL),('31490193L',3,6,NULL),('31490193L',4,3,NULL),('31490193L',5,0,NULL),('31490193L',6,10,NULL),('34595320P',7,10,NULL),('34595320P',8,9,NULL),('34595320P',9,6,NULL),('36111276B',2,0,NULL),('36111276B',5,8,NULL),('36111276B',6,4,NULL),('36554390F',2,10,NULL),('36554390F',5,3,NULL),('36554390F',6,9,NULL),('37388495V',7,2,NULL),('37388495V',8,5,NULL),('37388495V',9,8,NULL),('37778234K',1,5,NULL),('37778234K',3,1,NULL),('37778234K',4,3,NULL),('40313211F',1,10,NULL),('40313211F',3,9,NULL),('40313211F',4,3,NULL),('43478590B',1,1,NULL),('43478590B',3,6,NULL),('43478590B',4,7,NULL),('43657410Y',1,6,NULL),('43657410Y',3,10,NULL),('43657410Y',4,0,NULL),('44894511Y',7,3,NULL),('44894511Y',8,2,NULL),('44894511Y',9,5,NULL),('45374522F',1,6,NULL),('45374522F',3,4,NULL),('45374522F',4,1,NULL),('46689742H',1,NULL,NULL),('46689742H',3,2,NULL),('46689742H',4,NULL,NULL),('47176804D',1,8,NULL),('47176804D',3,1,NULL),('47176804D',4,5,NULL),('49462121T',1,2,NULL),('49462121T',3,4,NULL),('49462121T',4,3,NULL),('50233514L',1,6,NULL),('50233514L',3,9,NULL),('50233514L',4,4,NULL),('50459807S',7,7,NULL),('50459807S',8,10,NULL),('50459807S',9,7,NULL),('50498008J',7,6,NULL),('50498008J',8,10,NULL),('50498008J',9,9,NULL),('51622916Z',7,5,NULL),('51622916Z',8,10,NULL),('51622916Z',9,1,NULL),('52142320D',1,8,NULL),('52142320D',3,6,NULL),('52142320D',4,5,NULL),('55053504Z',1,6,NULL),('55053504Z',3,7,NULL),('55053504Z',4,7,NULL),('55890735E',1,4,NULL),('55890735E',3,10,NULL),('55890735E',4,5,NULL),('57246140Z',7,8,NULL),('57246140Z',8,1,NULL),('57246140Z',9,5,NULL),('58888157S',1,10,NULL),('58888157S',3,5,NULL),('58888157S',4,4,NULL),('60043926B',7,6,NULL),('60043926B',8,7,NULL),('60043926B',9,7,NULL),('60782173G',1,2,NULL),('60782173G',3,2,NULL),('60782173G',4,4,NULL),('61308621M',7,4,NULL),('61308621M',8,10,NULL),('61308621M',9,4,NULL),('61762463B',1,0,NULL),('61762463B',3,1,NULL),('61762463B',4,4,NULL),('62018301C',1,9,NULL),('62018301C',3,9,NULL),('62018301C',4,9,NULL),('62843009V',7,9,NULL),('62843009V',8,4,NULL),('62843009V',9,7,NULL),('65571779K',1,1,NULL),('65571779K',3,5,NULL),('65571779K',4,1,NULL),('65869563R',1,1,NULL),('65869563R',3,2,NULL),('65869563R',4,9,NULL),('69197084C',2,5,NULL),('69197084C',5,1,NULL),('69197084C',6,10,NULL),('69760968J',7,2,NULL),('69760968J',8,5,NULL),('69760968J',9,8,NULL),('69837330S',10,4,NULL),('69837330S',11,6,NULL),('71070833M',1,10,NULL),('71070833M',2,9,NULL),('71070833M',3,4,NULL),('71070833M',4,4,NULL),('71070833M',5,10,NULL),('71070833M',6,4,NULL),('71441216L',2,1,NULL),('71441216L',5,7,NULL),('71441216L',6,9,NULL),('74349702V',7,2,NULL),('74349702V',8,7,NULL),('74349702V',9,6,NULL),('75058589K',2,1,NULL),('75058589K',5,7,NULL),('75058589K',6,0,NULL),('76145319R',1,0,NULL),('76145319R',2,4,NULL),('76145319R',3,6,NULL),('76145319R',4,9,NULL),('76145319R',5,7,NULL),('76145319R',6,7,NULL),('77961668V',2,5,NULL),('77961668V',5,3,NULL),('77961668V',6,1,NULL),('78549674M',2,9,NULL),('78549674M',5,10,NULL),('78549674M',6,2,NULL),('78584180B',7,0,NULL),('78584180B',8,7,NULL),('78584180B',9,2,NULL),('81477577P',7,0,NULL),('81477577P',8,4,NULL),('81477577P',9,2,NULL),('83669089B',7,7,NULL),('83669089B',8,10,NULL),('83669089B',9,7,NULL),('85939835J',7,5,NULL),('85939835J',8,5,NULL),('85939835J',9,9,NULL),('86607489T',7,10,NULL),('86607489T',8,2,NULL),('86607489T',9,0,NULL),('88283285Q',2,7,NULL),('88283285Q',5,0,NULL),('88283285Q',6,5,NULL),('89172629L',1,1,NULL),('89172629L',2,1,NULL),('89172629L',3,3,NULL),('89172629L',4,3,NULL),('89172629L',5,4,NULL),('89172629L',6,3,NULL),('91062263L',2,1,NULL),('91062263L',5,7,NULL),('91062263L',6,2,NULL),('91175227F',10,10,NULL),('91175227F',11,0,NULL),('91385279T',1,4,NULL),('91385279T',3,10,NULL),('91385279T',4,4,NULL),('92124535J',1,4,NULL),('92124535J',3,7,NULL),('92124535J',4,0,NULL),('93536674K',7,4,NULL),('93536674K',8,10,NULL),('93536674K',9,6,NULL),('95195051Y',10,0,NULL),('95195051Y',11,6,NULL),('95416082F',7,NULL,NULL),('95416082F',8,NULL,NULL),('95416082F',9,NULL,NULL),('95724032X',2,5,NULL),('95724032X',5,5,NULL),('95724032X',6,7,NULL);
/* !40000 ALTER TABLE `matricula` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `profesor`;
/* !40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `profesor` (
  `dni_profesor` char(9) NOT NULL,
  `nombre` varchar(20) NOT NULL,
  `apellidos` varchar(45) NOT NULL,
  `direccion` varchar(50) DEFAULT NULL,
  `cp` char(5) DEFAULT NULL,
  `fecha_nacimiento` varchar(45) DEFAULT NULL,
  `telefono` char(9) DEFAULT NULL,
  PRIMARY KEY (`dni_profesor`),
  KEY `fk_profesor_1_idx` (`cp`),
  CONSTRAINT `fk_profesor_1` FOREIGN KEY (`cp`) REFERENCES `cp` (`cp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/* !40101 SET character_set_client = @saved_cs_client */;
LOCK TABLES `profesor` WRITE;
/* !40000 ALTER TABLE `profesor` DISABLE KEYS */;
INSERT INTO `profesor` VALUES ('12327024J','Ángel','Andreu Martínez','C/. Ejemplo nº 9','41500','1998-7-1','623202731'),('43010831A','María José','Peinado Reyes','C/. Ejemplo nº 2','41500','1997-12-19','656174324'),('68091221C','Juana','Rivas Mediavilla','C/. Ejemplo nº 8','41510','2004-1-9','646965799'),('74857163Y','Manuela','Moreno Luna','C/. Ejemplo nº 5','41520','2001-7-29','691797104'),('77130412G','Alex','Hernández Cifuentes','C/. Ejemplo nº 7','41520','2005-6-21','663727542'),('84732483T','Cristina','Costa De la Fuente','C/. Ejemplo nº 4','41500','1998-11-11','610424261'),('85666556C','Iñaki','Fernández Lloyd','C/. Ejemplo nº 3','41700','1998-9-30','669586110'),('99600991C','José María','Crespo Montiel','C/. Ejemplo nº 6','41700','1999-1-4','640224826'),('99696667Q','Patricia','Calderón López','C/. Ejemplo nº 1','41701','2005-8-25','623761502');
/* !40000 ALTER TABLE `profesor` ENABLE KEYS */;
UNLOCK TABLES;
/* !40103 SET TIME_ZONE=@OLD_TIME_ZONE */;
/* !40101 SET SQL_MODE=@OLD_SQL_MODE */;
/* !40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/* !40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/* !40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/* !40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/* !40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/* !40111 SET SQL_NOTES=@OLD_SQL_NOTES */;