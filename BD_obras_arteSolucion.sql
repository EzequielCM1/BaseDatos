
-- Ejercicio1 
-- Inserta un nuevo artista con los siguientes datos de forma gráfica:
INSERT INTO `galeria_arte`.`artistas` (`nombre`, `nacionalidad`, `fecha_nacimiento`, `estilo`) 
VALUES ('Antoni Tàpies', 'Española', '1923-12-13', 'Abstracto');

-- Ejercicio2
--  Agrega una nueva exposición con estos valores empleando una sentencia SQL:
insert into exposiciones (nombre, fecha_inicio, fecha_fin, ubicacion)
value ('Arte Moderno en Madrid', '2025-05-10', '2025-06-20' , 'Museo Nacional de Arte');

-- Ejercicio 3
-- Modifica el nombre del artista con id_artista = 3 de forma gráfica y cámbialo a "Magdalena Frida Carmen Kahlo y Calderón".
UPDATE `galeria_arte`.`artistas` SET `nombre` = 'Magdalena Frida Carmen Kahlo y Calderón' WHERE (`artista_id` = '3');

-- Ejercicio 4
update exposiciones set ubicacion = 'Centro de Arte Contemporáneo de Barcelona' where exposicion_id = 2;

-- Ejercicio 5
-- Elimina el artista cuyo id_artista es 7 de forma gráfica. ¿Es posible hacerlo?
-- DELETE FROM `galeria_arte`.`artistas` WHERE (`artista_id` = '7');
-- No se puede por que tiene unida la foreing key

-- Ejercicio 6
-- Borra la exposición con id_exposicion = 4 con una sentencia SQL. ¿Es posible hacerlo? Si es posible 
begin;
delete from exposiciones where exposicion_id = 4;
rollback;

-- Ejercicio 7
-- Inserta una nueva obra de arte en la base de datos tomando el artista_id de "Pablo Picasso":
begin;
insert into obras_arte (titulo, anio_creacion, artista_id) 
value ('Retrato de una época', '1932', (select artista_id from artistas where nombre = 'Pablo Picasso'));
commit;

-- Ejercocio 8
-- Incrementa en un año la fecha de nacimiento de todos los artistas nacidos antes del 1 de enero de 1900.
begin;
set sql_safe_updates = 0;
update artistas set fecha_nacimiento = date_add(fecha_nacimiento ,interval 1 year) 
where fecha_nacimiento < '1900-01-01' ;
set sql_safe_updates = 1;
commit;

-- Ejercicio 9
-- Elimina todas las obras de arte que no tienen artistas y que no están en ninguna exposición
begin;
delete from obras_arte where artista_id is null 
and obra_id = (select distinct obra_id from obras_exposiciones where exposicion_id is null) ;
commit;

-- Ejercicio 10 -- Con select
-- Añade una nueva exposición con estos valores:
begin;
insert into exposiciones (nombre, fecha_inicio, fecha_fin, ubicacion)
value ('Expresión y Color', '2025-09-15', '2025-10-30' , (select ubicacion from (select ubicacion from exposiciones where exposicion_id=3)TRAS));
commit;

-- Ejercicio 11
-- Aumenta en un 10% el precio de todas las obras de arte que pertenecen a 
-- exposiciones celebradas en el "Centro Pompidou, París".
begin;
update obras_arte set precio_estimado = precio_estimado *1.1
where obra_id in (select distinct obra_id from obras_exposiciones join exposiciones using (exposicion_id) where ubicacion="Centro Pompidou, París");
commit;

-- Ejercicio 12 
-- Cambia el estilo de todos los artistas que tienen obras en la exposición cuyo nombre 
-- es "La magia del color" a "Otro".
begin;
set sql_safe_updates = 0;
update artistas set estilo = 'Otro'
where artista_id in (select distinct artista_id from obras_arte join obras_exposiciones using (obra_id) join exposiciones using (exposicion_id) where exposiciones.nombre='La magia del color');
set sql_safe_updates = 1;
commit;

-- Ejercicio 13
-- Elimina todas las exposiciones que no tiene ninguna obra de arte asociada a la tabla obras 
begin;
set sql_safe_updates = 0;
delete from exposiciones where exposicion_id not in (select distinct exposicion_id from obras_exposiciones);
set sql_safe_updates = 1;
commit ;

-- Ejercicio 14
-- Elimina todos los artistas de la base de datos que no tenga ninguna obras registradas 
begin;
delete from artistas where artista_id not in (select distinct artista_id from obras_arte  );
commit;

-- Ejercicio 15
-- Inserta una nueva obra de arte llamada "Ecos del Pasado" con un precio estimado de 1.500.000.00, año de creación 1955 y tipo "Pintura", 
-- asignándola a un artista que ya tenga al menos 3 obras registradas. 
-- Para ello, utiliza un INSERT ... SELECT que identifique al primer artista (según su id) que cumpla la condición.
begin;
insert into obras_arte (titulo, precio_estimado, anio_creacion , tipo, artista_id)
value ('Ecos del Pasado', '1500000.00' ,  '1995' , 'Pintura', (select artista_id from (select artista_id  from obras_arte where artista_id 
is not null group by artista_id having count(obras_arte.obra_id)>=3
limit 1)Alias));
commit;

select artista_id  from obras_arte where artista_id is not null group by artista_id having count(obras_arte.obra_id)>=3
limit 1;

-- Ejercicio 16
-- Crea una nueva exposición llamada "Fusión de Estilos", con fecha de inicio y fin a elección, y asigna como ubicación la misma de la 
-- exposición que actualmente tenga el mayor número de obras asociadas. Utiliza un INSERT ... 
-- SELECT con un JOIN y una función de agregación para determinar la ubicación.
begin;
insert into  exposiciones (nombre, fecha_inicio, fecha_fin, ubicacion)
select 'Fusión de Estilos', '2025-07-01', '2025-07-15', ubicacion from exposiciones join obras_exposiciones using (exposicion_id) group by exposicion_id 
order by count(obra_id) desc limit 1;
commit;

-- Ejercicio 17
-- Incrementa en un 15% el precio estimado de todas las obras de arte de artistas cuyo estilo sea "Abstracto" y que, además, su precio actual
--  esté por debajo del promedio de precios de obras del mismo tipo de ese artista. 
-- Utiliza un UPDATE con subconsulta para obtener el promedio.
UPDATE obras_arte o
JOIN artistas a ON o.artista_id = a.artista_id
SET o.precio_estimado = o.precio_estimado * 1.15
WHERE a.estilo = 'Abstracto'
  AND o.precio_estimado < (select media from (
    SELECT AVG(o2.precio_estimado) as 'media'
    FROM obras_arte o2
    WHERE o2.artista_id = o.artista_id AND o2.tipo = o.tipo) AUX
);

-- 18
-- UPDATE complejo 2: Aumentar la fecha_fin en 15 días para exposiciones que hayan finalizado y tengan menos de 12 obras asociadas
set sql_safe_updates=0;

UPDATE exposiciones e
SET e.fecha_fin = DATE_ADD(e.fecha_fin, INTERVAL 15 DAY)
WHERE e.fecha_fin < CURDATE()
  AND (
    SELECT COUNT(*)
    FROM obras_exposiciones oe
    WHERE oe.exposicion_id = e.exposicion_id
  ) < 12;
  set sql_safe_updates=1;
  
  select * from exposiciones where fecha_fin < CURDATE();
  select exposicion_id, count(*) from obras_arte JOIN obras_exposiciones using (obra_id) group by 1;
  -- 19 DELETE complejo 1: Eliminar artistas nacidos antes de 1950 y sin obras asociadas
DELETE FROM artistas
WHERE fecha_nacimiento < '1950-01-01'
  AND artista_id NOT IN (
    SELECT DISTINCT artista_id
    FROM obras_arte
    WHERE artista_id IS NOT NULL
);
-- 20
create temporary table obras_por_estilo
select titulo, IFNULL(nombre,'anónimo'), ifnull(estilo,'otro') from obras_arte LEFT JOIN artistas using (artista_id) order by estilo;
