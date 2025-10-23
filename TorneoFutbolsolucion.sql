-- 1.1
INSERT INTO `torneofutbol`.`provincia` (`nombre`) VALUES ('Murcia');
-- poblaciones
INSERT INTO `torneofutbol`.`poblacion` (`nombre`, `codProvincia`) VALUES ('Albudeite', '9');
INSERT INTO `torneofutbol`.`poblacion` (`nombre`, `codProvincia`) VALUES ('Alguazas', '9');
INSERT INTO `torneofutbol`.`poblacion` (`nombre`, `codProvincia`) VALUES ('Baena', '4');
INSERT INTO `torneofutbol`.`poblacion` (`nombre`, `codProvincia`) VALUES ('Cabra', '4');
-- 1.2
INSERT INTO `torneofutbol`.`entrenador` (`nombre`, `apellido1`, `apellido2`, `fecNacimiento`, `telefono`, `codPoblacion`) VALUES ('Antonio', 'González', 'Beltrán', '1981-04-04', '', '2');
uPDATE `torneofutbol`.`equipo` SET `idEntrenador` = '12' WHERE (`nombre` = 'Club Raya');
-- 1.3
DELETE FROM `torneofutbol`.`poblacion` WHERE (`codPoblacion` = '1');
-- DELETE FROM `torneofutbol`.`poblacion` WHERE (`codPoblacion` = '21');-- este es el que da error

-- 2.1
-- Eliminar todos los jugadores que pertenezcan al equipo de los "Mosquitos" o 
-- "Roteña" que tengan fecha de nacimiento anterior a 1992 y que cobren un sueldo superior a 150€,
begin;
delete from jugador where nombreEquipo in ( 'Mosquito', 'Roteña') and year(fecNacimiento)<1992 and sueldo>150;
commit;

-- 2.2
-- Insertar un nuevo equipo llamado "Club DAW" de la localidad de "Mairena del Alcor". Su entrenador será "Pepe Sánchez Maldonado". 
-- Notese que al ser un equipo nuevo, tanto sus puntos, su posición y su capitán no contendrá valores.
begin;
insert into equipo (nombre , codPoblacion, idEntrenador)
value ('Club DAW', (select idEntrenador from entrenador where nombre="Pepe" and apellido1="Sanchez" and apellido2="Maldonado"), 
(select codPoblacion from poblacion where nombre="Mairena del Alcor"));
commit;

-- 2.3
-- Bloquear la tabla jugador en modo lectura y actualizar la información del jugador Mario Orellana, 
-- ya que ha sido fichado por la Roteña. Pasará a usar el dorsal nº 12 y a cobrar un sueldo de 240€
begin;
set sql_safe_updates = 0;
update jugador set nombreEquipo = 'Roteña' , dorsal=12, sueldo = 240 where nombre ="Mario" and apellido1 = "Orellana";
set sql_safe_updates = 1;
commit;

-- 3.1
-- Inicia una transacción. Actualiza los datos de los jugadores del equipo Lagarto, aumentando un 5% los sueldos. Lleva a cabo la transacción.
begin;
update jugador set sueldo = sueldo * 1.05 
where nombreEquipo = 'Lagarto';
commit;

-- 3.2
-- Inicia una transacción. Insertar en la tabla partidos todos los encuentros no disputados. Para Para, tiene que insertar a los equipos 
-- que no se han enfrentado nunca, tanto en 
-- casa como fuera, sin indicar la fecha de encuentro ni el resultado. Lleva a cabo la transacción.
begin;
insert into partido (nombreEquipoLocal, nombreEquipoVisitante)
select A.nombre, B.nombre from equipo A, equipo B where A.nombre != B.nombre and (A.nombre ,B.nombre) not in (select nombreEquipoLocal , nombreEquipoVisitante from partido);
rollback;

begin;
insert ignore into partido (nombreEquipoLocal, nombreEquipoVisitante)
select A.nombre, B.nombre from equipo A, equipo B where A.nombre != B.nombre;
rollback;
-- select local.nombre, B.equipo from equipo local, equipo visitante;

-- 3.3
-- Inicia una transacción. Queremos actualizar las capitanes de todos los equipos, de formar que el 
-- nuevo capitán mare el jugador de edad más edad del equipo (siempre que el equipo tiene capitán). Lleva a cabo la transacción.

begin;
set sql_safe_updates = 0;
update equipo set idCapitan = (select idJugador from jugador where nombreEquipo = equipo.nombre order by fecNacimiento limit 3) where idCapitan is not null;
set sql_safe_updates = 1;
rollback;

-- 3.4
--  Inicia una transacción. EliminarLatografía de la base de datos que no cuenta con un equipo, jugador ni entrenador.
-- Deshacer la dictadura y comprobar que los registros no han sido eliminados.

begin;
set sql_safe_updates = 0;
delete from poblacion where codPoblacion not in (select distinct codPoblacion from equipo) 
and codPoblacion not in (select distinct codPoblacion from jugador) 
and codPoblacion not in (select distinct codPoblacion from entrenador) ;
set sql_safe_updates = 1;
rollback;

