/*
Script de la Base de datos "torneofutbol" creada por P.LLuyot para la Tarea04 de BD
*/

DROP DATABASE IF EXISTS torneofutbol;
CREATE DATABASE  IF NOT EXISTS torneofutbol;
USE torneofutbol;

-- provincia
CREATE TABLE provincia (
  codProvincia int AUTO_INCREMENT PRIMARY KEY,
  nombre varchar(25) NOT NULL);

-- población
CREATE TABLE poblacion (
  codPoblacion int AUTO_INCREMENT PRIMARY KEY,
  nombre varchar(25) NOT NULL,
  codProvincia int NOT NULL,
  CONSTRAINT fk_poblacion_provincia FOREIGN KEY (codProvincia) REFERENCES provincia (codProvincia) ON UPDATE CASCADE  
  );

-- entrenador
CREATE TABLE entrenador (
  idEntrenador int AUTO_INCREMENT PRIMARY KEY,
  nombre varchar(20) NOT NULL,
  apellido1 varchar(25) NOT NULL,
  apellido2 varchar(25) NOT NULL,
  fecNacimiento date DEFAULT NULL,
  telefono char(9) DEFAULT NULL,
  codPoblacion int NOT NULL,
  CONSTRAINT fk_entrenador_poblacion1 FOREIGN KEY (codPoblacion) REFERENCES poblacion (codPoblacion) ON UPDATE CASCADE  
);

-- tabla equipo
CREATE TABLE equipo (
  nombre char(15) PRIMARY KEY,
  puntos decimal(3,0) DEFAULT NULL,
  posicion decimal(2,0) DEFAULT NULL,
  numTemporadas decimal(1,0) NOT NULL CHECK(numTemporadas >=0) DEFAULT '0',
  codPoblacion int NOT NULL,
  idCapitan int DEFAULT NULL,
  idEntrenador int DEFAULT NULL,
  CONSTRAINT `fk_equipo_entrenador1` FOREIGN KEY (`idEntrenador`) REFERENCES `entrenador` (`idEntrenador`),
  CONSTRAINT `fk_equipo_poblacion1` FOREIGN KEY (`codPoblacion`) REFERENCES `poblacion` (`codPoblacion`) ON UPDATE CASCADE
  );

-- tabla jugador
CREATE TABLE jugador (
  idJugador int AUTO_INCREMENT PRIMARY KEY,
  nombre varchar(20) NOT NULL,
  apellido1 varchar(25) NOT NULL,
  apellido2 varchar(25) NOT NULL,
  alias varchar(20) DEFAULT NULL,
  dorsal decimal(2,0) check (dorsal >= 1) DEFAULT '9',
  fecNacimiento date DEFAULT NULL,
  sueldo decimal(6,2) DEFAULT '100.00',
  codPoblacion int NOT NULL,
  nombreEquipo char(15) NOT NULL,
  constraint dorsal_unico_equipo UNIQUE (nombreEquipo, dorsal),
  CONSTRAINT fk_jugador_equipo1 FOREIGN KEY (nombreEquipo) REFERENCES equipo (nombre),
  CONSTRAINT fk_jugador_poblacion1 FOREIGN KEY (codPoblacion) REFERENCES poblacion (codPoblacion) ON UPDATE CASCADE
  );
  -- tabla partido
  CREATE TABLE partido (
  nombreEquipoLocal char(15) NOT NULL,
  nombreEquipoVisitante char(15) NOT NULL,
  fecEncuentro date DEFAULT NULL,
  golesLocal numeric(2,0) default 0,
  golesVisitante numeric(2,0) default 0,
  PRIMARY KEY (nombreEquipoLocal,nombreEquipoVisitante),
  check (nombreEquipoLocal<>nombreEquipoVisitante),
  CONSTRAINT fk_equipo_has_equipo_equipo1 FOREIGN KEY (nombreEquipoLocal) REFERENCES equipo (nombre),
  CONSTRAINT fk_equipo_has_equipo_equipo2 FOREIGN KEY (nombreEquipoVisitante) REFERENCES equipo (nombre)
  );

-- inserción de datos
-- provincias
INSERT INTO `provincia` VALUES (1,'Almería'),(2,'Cádiz'),(3,'Sevilla'),(4,'Córdoba'),(5,'Jaén'),(6,'Málaga'),(7,'Huelva'),(8,'Granada');
-- poblaciones
INSERT INTO `poblacion` VALUES (1,'Aguadulce',1),(2,'Alcolea',1),(3,'Adra',1),(4,'Albox',1),(5,'Almería',1),(6,'Rota',2),(7,'Cádiz',2),(8,'Puerto Real',2),(9,'Chipiona',2),(10,'Chiclana',2),(11,'San Fernando',2),(12,'Alcalá de Guadaira',3),(13,'Sevilla',3),(14,'Carmon',3),(15,'El Viso del Alcor',3),(16,'Mairena del Alcor',3),(17,'Baena',4),(18,'Baeza',5),(19,'Benalmádena',6),(20,'Torremolinos',6),(21,'Ayamonte',7),(22,'Almuñécar',8);
-- entrenadores
INSERT INTO `entrenador` VALUES (1,'Juan','Rodríguez','Pérez','1985-11-11','665587441',14),(2,'Manuel','López','Gil','1975-10-31','658897156',12),(3,'Juan Alberto','Santos','Pérez','1969-02-25','699877458',22),(4,'Antonio','LLanes','Ruiz','1990-05-04','633225887',10),(5,'Roberto','Casas','Fernández','1991-05-21','601145887',17),(6,'Juan','Benítez','García','1972-02-28','669897581',12),(7,'Pedro','Guillén','Santana','1977-01-15','665558778',6),(8,'Ernesto','Díaz','Huertas','1965-12-15','610554795',9),(9,'Pepe','Sánchez','Maldonado','1964-04-06','',4),(10,'Alberto','Cortés','Sánchez','1999-09-01','611022365',20),(11,'Federico','López','López','1997-01-02','600220236',21);
-- equipos
INSERT INTO `equipo` VALUES ('Aire de Levan',6,10,0,7,NULL,11),('Antrax',20,4,3,12,NULL,6),('Athlético PI',17,6,1,13,30,9),('Campeones',18,5,1,15,NULL,1),('Camperos',2,11,2,6,20,7),('Club del Sur',12,7,1,11,39,4),('Club Raya',27,3,1,8,NULL,5),('Lagartos',11,8,2,12,8,2),('Mosquitos',28,2,0,22,56,3),('Roteña',30,1,3,6,50,8),('Sin Sentido',9,9,2,15,NULL,10);
-- jugadores
INSERT INTO `jugador` VALUES (1,'Pepe','Lillo','San Pedro','Pepillo',9,'1999-06-11',100.00,12,'Lagartos'),(2,'Pedro','González','Hernández','Pedro',1,'2001-05-05',85.00,12,'Lagartos'),(3,'Manolo','Fernández','Díaz','Manolo',2,'1998-01-07',98.00,12,'Lagartos'),(4,'Manuel','Rodríguez','Moreno','Lolo',3,'1991-10-13',120.00,12,'Lagartos'),(5,'Oscar','López','Álvarez','Oscar',4,'1991-11-09',50.00,12,'Lagartos'),(6,'Antonio','Martínez','Muñoz','Antonio',6,'1994-04-17',135.00,12,'Lagartos'),(7,'Manuel J.','Sánchez','Romero','Romerito',8,'2001-06-24',100.00,12,'Lagartos'),(8,'Alejandro','Pérez','Alonso','Alejandro',15,'1994-09-14',250.00,12,'Lagartos'),(9,'Santiago','Gómez','Gutiérrez','Gago',11,'1991-05-31',104.00,12,'Lagartos'),(10,'Rafael','Martín','Santos','Rafael',7,'1993-06-07',220.00,12,'Lagartos'),(11,'Antonio','Jiménez','Gil','Toño',13,'2002-01-06',140.00,13,'Lagartos'),(12,'Pepe','Ruiz','García','Gato',1,'2001-06-10',120.00,6,'Camperos'),(13,'Federico','Hernández','González','Lio',2,'1995-08-18',115.00,6,'Camperos'),(14,'Manolo','Díaz','Fernández','Lolo',3,'1997-03-20',100.00,3,'Camperos'),(15,'Fernando','Moreno','Rodríguez','Fernando',4,'1998-12-24',150.00,6,'Camperos'),(16,'Rafael','Álvarez','López','Lute',5,'2003-06-03',125.00,6,'Camperos'),(17,'Jimeno','Muñoz','Martínez','Jimeno',6,'2002-11-03',100.00,8,'Camperos'),(18,'Juan','Romero','Sánchez','Juan',7,'2003-04-02',100.00,9,'Camperos'),(19,'Juan','Alonso','Pérez','Coco',8,'1997-08-03',144.00,10,'Camperos'),(20,'Victor','Gutiérrez','Gómez','Victor',10,'1998-05-31',251.00,7,'Camperos'),(21,'José Manuel','Santos','Martín','Flequi',11,'1994-02-26',122.00,5,'Camperos'),(22,'Ángel','Gil','Jiménez','Ángel',12,'2000-07-03',155.00,6,'Camperos'),(23,'Manuel','Otero','Martínez','Gato',1,'1988-10-21',82.00,13,'Athlético PI'),(24,'Manuel','Torres','García','Manuel',2,'1997-07-02',129.00,11,'Athlético PI'),(25,'Antonio','Pérez','Gil','Antonio',3,'1985-02-16',65.00,13,'Athlético PI'),(26,'Fernando','Coll','Pelayo','El balita',4,'1988-10-20',110.00,13,'Athlético PI'),(27,'Sergio','Bueno','Gómez','Sergio',5,'1987-01-09',105.00,16,'Athlético PI'),(28,'José','Domínguez','Álvarez','José',6,'1985-01-19',87.00,13,'Athlético PI'),(29,'José Manuel','Murillo','Corbalán','José Manuel',7,'1988-07-04',163.00,11,'Athlético PI'),(30,'Suso','López','Figueroa','Ronco',8,'1992-08-22',186.00,16,'Athlético PI'),(31,'Mario','Laguna','Osuna','Tigre',9,'1985-09-24',175.00,13,'Athlético PI'),(32,'José María','Diana','Comadreja','José María',10,'2000-10-25',86.00,13,'Athlético PI'),(33,'Antonio','Ruíz','Gómez','Antonio',11,'1995-01-07',190.00,16,'Athlético PI'),(34,'Juan Antonio','González','Gil','Juan Antonio',1,'1997-04-13',73.00,8,'Club del Sur'),(35,'Rafael','Martin','Sánchez','Pelao',2,'1993-04-27',129.00,11,'Club del Sur'),(36,'Miguel Ángel','Bayón','Gutiérrez','Miguel Ángel',3,'1991-01-04',103.00,11,'Club del Sur'),(37,'Pablo','Vázquez','Soria','Pablo',4,'1985-04-03',168.00,10,'Club del Sur'),(38,'Francisco Javier','Domínguez','Rojas','Francisco Javier',5,'1986-05-08',56.00,11,'Club del Sur'),(39,'Jorge','Ferri','Barrios','Jorge',6,'1992-12-19',194.00,7,'Club del Sur'),(40,'Francisco Javier','Bazán','Fernández','Francisco Javier',7,'2001-04-25',119.00,11,'Club del Sur'),(41,'Jorge','Sempere','Ramírez','Foty',8,'1991-11-01',52.00,7,'Club del Sur'),(42,'Juan','Ramírez','Martin','Juan',9,'1998-07-16',118.00,11,'Club del Sur'),(43,'Alejandro','Costa','Vera','Alejandro',10,'1993-06-13',78.00,11,'Club del Sur'),(44,'Mario','Orellana','Cañadas','Mario',11,'1992-12-18',155.00,8,'Club del Sur'),(45,'Julio','Menacho','Rodríguez','Julio',1,'1992-11-21',188.00,6,'Roteña'),(46,'Juan','Ortiz','Ortega','Pilu',2,'1986-09-23',89.00,6,'Roteña'),(47,'Víctor','Muñoz','Muñiz','Víctor',3,'1989-10-14',52.00,8,'Roteña'),(48,'Manuel','Ramírez','Singh','Manuel',4,'1987-04-17',154.00,6,'Roteña'),(49,'Antonio','Molina','Gutiérrez','Antonio',5,'1989-11-06',156.00,9,'Roteña'),(50,'Sergio','García','Mínguez','Sergio',6,'1991-02-19',183.00,9,'Roteña'),(51,'Francisco','Pérez','García','Francisco',7,'1997-12-01',124.00,8,'Roteña'),(52,'Raúl','Blanco','Santos','Raúl',8,'1995-03-12',149.00,6,'Roteña'),(53,'Daniel','Pascual','Robles','Daniel',9,'1984-02-28',90.00,6,'Roteña'),(54,'Antonio','Martínez','Ferrer','Cafelito',10,'1992-07-13',187.00,6,'Roteña'),(55,'Marcos','Vega','Herraiz','Marcos',11,'1995-09-12',74.00,6,'Roteña'),(56,'Pedro','Rivera','Bernardo','Pedro',1,'1985-03-22',143.00,22,'Mosquitos'),(57,'José Luis','Mesa','Pérez','José Luis',2,'1999-09-03',69.00,22,'Mosquitos'),(58,'Javier','Carazo','Romero','Javier',3,'1993-03-17',55.00,22,'Mosquitos'),(59,'Jesús','Vega','Contreras','Jesús',4,'1999-11-14',166.00,22,'Mosquitos'),(60,'Jesús','Caballero','Ferrándiz','Jesús',5,'1993-08-01',143.00,22,'Mosquitos'),(61,'Joaquín','Giner','Sánchez','Joaquín',6,'1988-03-27',113.00,22,'Mosquitos'),(62,'Juan','Rodríguez','Noguera','Juan',7,'1990-01-01',148.00,22,'Mosquitos'),(63,'Jorge','Gómez','Vila','Negro',8,'1991-11-17',114.00,22,'Mosquitos'),(64,'Miguel Ángel','Villanueva','Flores','Miguel Ángel',9,'1992-12-05',140.00,22,'Mosquitos'),(65,'José Luis','Martin','Tejera','José Luis',10,'1984-06-19',162.00,22,'Mosquitos'),(66,'Antonio','Fuster','López','Rubio',11,'1999-08-05',82.00,22,'Mosquitos'),(82,'Francisco','Morón','Albero','Fran',9,'1999-06-11',100.00,8,'Aire de Levan'),(83,'Pedro','Lachert','Silos','Pedro',1,'2001-05-05',85.00,9,'Aire de Levan'),(84,'Manolo','Díaz','Marchena','Manolo',2,'1998-01-07',98.00,3,'Aire de Levan'),(85,'Manuel','Moreno','Moreno','Lolo',3,'1991-10-13',120.00,10,'Aire de Levan'),(86,'Juan Jesús','Partida','López','Juanchu',4,'1991-11-09',50.00,3,'Aire de Levan'),(87,'Francisco','Pérez','De la Rosa','Cisco',6,'1994-04-17',135.00,2,'Aire de Levan'),(88,'Ignacio','Sánchez','Madrid','Loco',8,'2001-06-24',100.00,2,'Aire de Levan'),(89,'Pedro','Boca','Barriga','Pedro',15,'1994-09-14',250.00,11,'Aire de Levan'),(90,'Juan Manuel','Gómez','Rizo','Juanmi',11,'1991-05-31',104.00,7,'Aire de Levan'),(91,'Eduardo','Martín','Pedro','Edu',7,'1993-06-07',220.00,7,'Aire de Levan'),(92,'José','Jiménez','Sanz','José',13,'2002-01-06',140.00,7,'Aire de Levan'),(97,'Antonio','Ramón','Sánchez','Chiqui',10,'1992-11-30',120.00,5,'Antrax'),(98,'Luís','Aguilar','Bonilla','Luís',12,'1984-09-30',100.00,12,'Antrax'),(99,'Francisco','Navarro','FLores','Paco',11,'1984-12-16',100.00,12,'Campeones');
-- partidos
INSERT INTO `partido` VALUES ('Athlético PI','Camperos','2005-02-12','1', '3'),('Athlético PI','Club del Sur','2005-07-19','2', '4'),('Athlético PI','Lagartos','2005-05-06','2','2'),('Athlético PI','Mosquitos','2006-09-07','1','1'),('Athlético PI','Roteña','2006-02-18','5','1'),('Camperos','Athlético PI','2005-05-05','3','4'),('Camperos','Club del Sur','2006-10-03','2','1'),('Camperos','Lagartos','2005-02-14','3','4'),('Camperos','Mosquitos','2005-01-19','0','1'),('Camperos','Roteña','2006-04-27','0','5'),('Club del Sur','Athlético PI','2006-05-08','5','4'),('Club del Sur','Camperos','2005-10-14','0','5'),('Club del Sur','Lagartos','2006-02-25','3','0'),('Club del Sur','Mosquitos','2006-04-25','2','3'),('Club del Sur','Roteña','2005-09-03','3','3'),('Lagartos','Athlético PI','2005-10-06','4','3'),('Lagartos','Camperos','2005-10-04','0','4'),('Lagartos','Club del Sur','2005-09-23','0','5'),('Lagartos','Mosquitos','2006-05-02','3','0'),('Lagartos','Roteña','2006-01-09','2','2'),('Mosquitos','Athlético PI','2005-10-18','0','3'),('Mosquitos','Camperos','2006-01-06','3','1'),('Mosquitos','Club del Sur','2006-05-18','5','4'),('Mosquitos','Lagartos','2006-06-04','1','4'),('Mosquitos','Roteña','2006-07-23','2','5'),('Roteña','Athlético PI','2005-10-08','4','4'),('Roteña','Camperos','2005-06-23','0','4'),('Roteña','Club del Sur','2005-03-29','1','4'),('Roteña','Lagartos','2006-04-28','0','5'),('Roteña','Mosquitos','2005-09-11','3','3');

-- añadimos FK a equipo
alter table equipo
  add CONSTRAINT `fk_equipo_jugador1` FOREIGN KEY (`idCapitan`) REFERENCES `jugador` (`idJugador`) ON DELETE SET NULL ON UPDATE CASCADE;
