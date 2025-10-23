INSERT INTO `instituto`.`profesor` (`codigo`, `nombre`, `apellidos`, `dni`, `especialidad`, `fechaNac`, `antiguedad`) VALUES ('1', 'Nuria', 'Anero González', '58328033X', 'Matemáticas', '1972/02/22', '9');


insert into profesor (codigo, nombre, apellidos, dni, especialidad, fechaNac, antiguedad)
value('2', 'María Luisa', 'Fabre Berdún ', '51083099F', 'Tecnología', '1975/03/31', '4') ;

insert into profesor (codigo, nombre, apellidos, dni, especialidad, fechaNac, antiguedad)
value ('3', 'Javier', 'Jiménez Hernando', null, 'Lengua', '1969/05/04', '10');

insert into profesor 
value ('4', 'Estefanía', 'Fernández Martínez', '19964324W', 'Inglés', '1973/06/22', '5');

insert into profesor (codigo, nombre, apellidos)
value ('5', 'José M.' , 'Anero Payán');

insert into profesor ( apellidos, codigo, nombre)
value ('Rodríguez Pérez', '6', 'José');

-- ejercicio 3

UPDATE `instituto`.`curso` SET `codProfesor` = '4' WHERE (`codigo` = '1');
UPDATE `instituto`.`curso` SET `codProfesor` = '2' WHERE (`codigo` = '2');
UPDATE `instituto`.`curso` SET `codProfesor` = '2' WHERE (`codigo` = '3');
UPDATE `instituto`.`curso` SET `codProfesor` = '1' WHERE (`codigo` = '4');
UPDATE `instituto`.`curso` SET `codProfesor` = '1' WHERE (`codigo` = '5');
UPDATE `instituto`.`curso` SET `codProfesor` = '3' WHERE (`codigo` = '6');

select curso.nombre 'curso', concat(profesor.nombre , ' ', profesor.apellidos) 'profesor' from curso join profesor on curso.codProfesor = profesor.codigo;

-- ejercicio 4

update profesor set  fechaNac  = '1974/06/22' , antiguedad = 4 where('codigo' = '4');

-- ejercicio 5

-- Desactivar la seguridad
set sql_safe_updates = 0;

update profesor set antiguedad =Ifnull(antiguedad, 0) + 1 ;

-- Activamos la seguridad
set sql_safe_updates = 1;

-- mostrar la viariable safe node
show variables like "%safe%";


-- ejercicio 6
-- DELETE FROM `instituto`.`curso` WHERE (`codigo` = '6');

-- ejercicio 7

-- delete from alumnado where codCurso = 3;
start transaction;
delete from alumnado where codCurso = 3;
rollback;
-- para llevar acabo se usa commit
-- commit;

-- auto conmit
-- show variables like "%commit%";


-- ejercicio 8 

begin;
insert into alumnado (nombre, apellidos, sexo, fechaNac )
select nombre , apellidos, sexo, fechaNac from alumnado_nuevo ;
commit;

-- ejercicio 9;

update curso set maxAlumn = (select count(*) from alumnado where codCurso = 2)
where codigo = 2;

-- ejercicio 10

set sql_safe_updates = 0;
update curso set maxAlumn = (select count(*) from alumnado where codCurso = curso.codigo);
set sql_safe_updates = 1;

-- ejercicio 11
begin;
delete from alumnado where codCurso in (select curso.codigo from curso join profesor on curso.codProfesor = profesor.codigo
where profesor.nombre = 'Estefania');
rollback;

-- ejercicio 12

/* begin;
update curso set codProfesor = (select codigo from profesor where nombre= 'Javier')
where maxAlumn = (select max(maxAlumn) from curso);
rollback;

select maximo from (select max(maxAlumn) 'maximo'  from curso)AUX;
*/
begin;
set sql_safe_updates = 0;
update curso set codProfesor = (select codigo from profesor where nombre= 'Javier')
where maxAlumn = (select maximo from (select max(maxAlumn) 'maximo'  from curso)AUX);
set sql_safe_updates = 1;
commit;

-- ejercicio 13
begin;
update alumnado set codCurso = 1 where codigo in (select codigo from 
(select codigo from alumnado where fechaNac is not null order by fechaNac asc limit 5) alias);
commit;

-- ejercicio 14

begin;
update alumnado set codCurso = (select codigo from curso order by maxAlumn limit 1)
where codigo in (select codigo from (select codigo from alumnado where fechaNac is not null and codCurso is null order by fechaNac limit 35) aux );
commit;

-- ejercicio 15
update profesor set codProfesor= (select codigo from profesor where fechaNac is not null order by fechaNac asc limit 1)
where codigo = (select codCurso, count(codigo) from alumnado where sexo= 'H' group by codCurso order by count(codigo) desc limit 1);


select codigo from profesor where fechaNac is not null order by fechaNac asc limit 1;

select codCurso, count(codigo) from alumnado where sexo= 'H' group by codCurso order by count(codigo) desc limit 1;

-- ejercicio16
create table hombre like alumnado;
insert into hombre
select * from alumnado where sexo= 'H';

-- create table select
create table mujeres select * from alumnado where sexo = 'M';

-- crear tabla temporal
create temporary table jovenes like alumnado;
insert into jovenes select * from alumnado where year(fechaNac)<2000;

-- ejercicio 17

-- INTEGRIDAD REFERENCIAL
-- ejercicio1 

delete from alumno where codCurso =1;
delete from cursos where codigo=4;

-- ejercicio2
delete from profesor where codigo=3;
delete from profesor where codigo=1;