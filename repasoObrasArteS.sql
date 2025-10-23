-- 1 Inserta un nuevo artista con los siguientes datos de forma comado:
insert into artistas (nombre, nacionalidad, fecha_nacimiento, estilo)
values ('Antoni Tàpies', 'Española', '1923-12-13', 'Abstracto');

-- 2 Agrega una nueva exposición con estos valores empleando una sentencia SQL:
insert into exposiciones (nombre, fecha_inicio, fecha_fin, ubicacion)
value ('Arte Moderno en Madrid', '2025-05-10', '2025-06-20' , 'Museo Nacional de Arte');

-- 3 Modifica el nombre del artista con id_artista = 3 de forma gráfica y cámbialo a "Magdalena Frida Carmen Kahlo y Calderón".
update artistas set nombre = 'Magdalena Frida Carmen Kahlo y Calderón' where artista_id = 1;

-- 4 Realiza la siguiente sentencia SQL: Cambia la ubicación de la exposición con id_exposicion = 2 a "Centro de Arte Contemporáneo de Barcelona".
update exposiciones set ubicacion = 'Centro de Arte Contemporáneo de Barcelona' where exposicion_id = 2;

-- 5 Elimina el artista cuyo id_artista es 7 de forma gráfica. ¿Es posible hacerlo?
-- delete from artistas where artista_id = 7;
-- No se puede por que tiene unida la foreing key

-- 6 Borra la exposición con id_exposicion = 4 con una sentencia SQL. ¿Es posible hacerlo?
begin;
delete from exposiciones where exposicion_id = 4;
rollback;

-- 7 Inserta una nueva obra de arte en la base de datos tomando el artista_id de "Pablo Picasso":
-- titulo: "Retrato de una época"
-- anio_creacion: 1932
-- id_artista: (Debe obtenerse mediante un SELECT en la consulta)
insert into obras_arte (titulo, anio_creacion, artista_id)
values ('Retrato de una época', '1932', (select artista_id from artistas where nombre = 'Pablo Picasso') );
-- select artista_id from obras_arte join artistas using (artista_id) where nombre = 'Pablo Picasso';

-- 8 Incrementa en un año la fecha de nacimiento de todos los artistas nacidos antes del 1 de enero de 1900.
begin;
set sql_safe_updates = 0;
update artistas set fecha_nacimiento=date_add(fecha_nacimiento ,interval 1 year)
where fecha_nacimiento < '1900-01-01';
set sql_safe_updates = 1;
commit;
-- select * from artistas where fecha_nacimiento < '1900-01-01';

-- 9 Elimina todas las obras de arte que no tienen artistas y que no están en ninguna exposición.
begin;
delete from obras_arte where artista_id is null and obra_id not in (select distinct obra_id from obras_exposiciones);
commit;
-- select distinct obra_id from obras_exposiciones;

-- 10 Añade una nueva exposición con estos valores:
-- nombre: "Expresión y Color"
-- fecha_inicio: "15/09/2025"
-- fecha_fin: "30/10/2025"
-- ubicacion: (Debe ser la misma ubicación que la exposición cuyo id_exposicion = 3, obtenida con un SELECT).
begin;
insert into exposiciones (nombre, fecha_inicio, fecha_fin, ubicacion)
values ('Expresión y Color', '2025-09-15', '2025-10-30', (select ubicacion from(select ubicacion from exposiciones where exposicion_id = 3)tras));
commit;

-- 11
-- Aumenta en un 10% el precio de todas las obras de arte que pertenecen a 
-- exposiciones celebradas en el "Centro Pompidou, París".
begin;
set sql_safe_updates = 0;
update obras_arte set precio_estimado= precio_estimado *1.10
where obra_id in (select distinct obra_id from obras_exposiciones join exposiciones using (exposicion_id) where ubicacion="Centro Pompidou, París");
set sql_safe_updates = 1;
select distinct obra_id from obras_exposiciones join exposiciones using (exposicion_id) where ubicacion="Centro Pompidou, París";

-- 12
-- Cambia el estilo de todos los artistas que tienen obras en la exposición cuyo nombre 
-- es "La magia del color" a "Otro".
update artistas set estilo= 'Otro'
where artista_id in (select distinct artista_id from obras_arte 
	join obras_exposiciones using (obra_id)
    join exposiciones using (exposicion_id)
    where exposiciones.nombre = 'La magia del color');
    
select distinct artista_id from obras_arte 
	join obras_exposiciones using (obra_id)
    join exposiciones using (exposicion_id)
    where exposiciones.nombre = 'La magia del color';

-- 13
-- Elimina todas las exposiciones que no tiene ninguna obra de arte asociada a la tabla obras 
begin;
delete from exposiciones where exposicion_id not in(select distinct exposicion_id from obras_exposiciones);
commit;

-- 14 
-- Elimina todos los artistas de la base de datos que no tenga ninguna obras registradas 
begin;
delete from artistas where artista_id not in (select distinct artista_id from obras_arte);
commit;

-- 15 
-- Inserta una nueva obra de arte llamada "Ecos del Pasado" con un precio estimado de 1.500.000.00, año de creación 1955 y tipo "Pintura", 
-- asignándola a un artista que ya tenga al menos 3 obras registradas. 
-- Para ello, utiliza un INSERT ... SELECT que identifique al primer artista (según su id) que cumpla la condición.
begin;
insert into obras_arte (titulo, precio_estimado, anio_creacion, tipo , artista_id)
values ('Ecos del Pasado', '1500000.00' ,  '1995' , 'Pintura', (select artista_id from (select artista_id  from obras_arte where artista_id is not null group by artista_id having count(obras_arte.obra_id)>=3
limit 1)as TRO));
commit;

-- 16
-- Crea una nueva exposición llamada "Fusión de Estilos", con fecha de inicio y fin a elección, y asigna como ubicación la misma de la 
-- exposición que actualmente tenga el mayor número de obras asociadas. Utiliza un INSERT ... 
-- SELECT con un JOIN y una función de agregación para determinar la ubicación.




