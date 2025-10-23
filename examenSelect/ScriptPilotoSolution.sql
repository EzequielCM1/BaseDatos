-- Mostrar los campos id nave, nombre y tipo de naves de todas las naves que NO son del tipo Bombardero y que están en reparación (0.5p)
select id_nave , nombre , tipo from nave where tipo !='Bombardero' and  estado = 'en reparación';
-- Mostrar los nombres, apellidos y nickname de los pilotos de sexo femenino que tienen un ranking comprendido entre 950 y 1000, ordenados alfabéticamente por los apellidos. (0.75p)
select nombre , apellidos , nickname from piloto where genero='M' AND ranking between 950 and 1000 order by apellidos asc;
-- Mostrar los nombres y apellidos de los cinco pilotos de género masculino con mayor ranking. (0.75p)
select nombre , apellidos from piloto where genero= 'H' order by ranking asc limit 5;
-- ¿Qué naves se pilotaron entre el 01/01/2023 y el 31/12/2024 que actualmente están en estado ‘operativa’? 
-- (La consulta no debe repetir los nombres de las naves más de una vez) (0.75p)
select distinct nombre from nave join historico using (id_nave) where estado = 'operativa' and fecha between '2023-01-01' and '2024-12-31' order by nave.nombre ;
select DISTINCT nombre from nave JOIN historico USING(id_nave) -- ON nave.id_nave = historico.id_nave
 where estado = 'operativa' and 
	fecha BETWEEN '2023-01-01' AND '2024-12-31' -- fecha >= '2023-01-01' AND fecha <= '2024-12-31'
 order by nombre;
 
 -- -- 5.- ¿Qué pilotos pilotaron la nave “Cometa-R” durante el año 2023? (1p)
select * from piloto join nave using  (id_piloto) join historico using (id_nave) where nave.nombre = 'Cometa-R' and year(fecha)=2023;

-- 6.- Cuál es el ranking medio de los pilotos que están pilotando actualmente una nave. (1p)
select avg(ranking) from nave JOIN piloto USING (id_piloto);

-- esto sería más correcto ya que no estamos repitiendo el ranking de pilotos que han pilotado más de una nave.
select avg(ranking) from piloto where id_piloto IN
(select distinct id_piloto from nave JOIN piloto USING (id_piloto));

-- 7 Para cada tipo distinto de nave, cuántas naves en estado ‘operativa’ hay actualmente en la base de datos (1p)
select tipo, count(id_nave) from nave
where estado = 'operativa'
group by tipo;

-- 8.- Queremos mostrar una lista con el nombre de todas las naves, y en otra columna queremos indicar si existen registros de esa -- nave en la tabla de histórico (Sí o No). Ayuda: usar la función IF. (1p)
select DISTINCT nombre,  IF(id_historico IS NULL, 'NO', 'SI') 'en histórico' 
from nave LEFT JOIN historico using(id_nave);

--  9 .-  Qué pilotos han pilotado anteriormente entre 2 y 3 naves (histórico). Indicanos su nick, ranking y género.  (1.5p) 
select nickname, ranking, genero -- piloto.id_piloto, count(id_nave) 
	from piloto JOIN historico USING (id_piloto)
group by piloto.id_piloto
having count(id_nave) BETWEEN 2 and 3;

-- 10.- Qué pilotos de género femenino están actualmente co-pilotando  una nave de tipo ‘caza’ y nunca antes había dirigido ninguna  nave de ningún tipo  (histórico) (1.75p)
select * from piloto JOIN nave ON piloto.id_piloto = nave.id_copiloto
	where tipo='caza' and genero='M';
--  una vez que hemos obtenido las mujeres completamos la query    
select piloto.nombre, piloto.apellidos from piloto JOIN nave ON piloto.id_piloto = nave.id_copiloto
	LEFT JOIN historico ON piloto.id_piloto = historico.id_piloto
	where tipo='caza' and genero='M' and id_historico IS NULL;
    
 --  otra forma de hacerlo es usando SUBCONSULTAS.   
select piloto.nombre, piloto.apellidos from piloto JOIN nave ON piloto.id_piloto = nave.id_copiloto
	where tipo='caza' and genero='M' and piloto.id_piloto NOT IN (select DISTINCT id_piloto from historico);

-- ------------------------------------------------------
-- Ejercicios propuestos con LEFT + RIGHT JOINS
-- Listar todos los nombres de los pilotos. Para cada piloto se debe mostrar el nombre de la nave que pilota (si pilota alguna).
select piloto.nombre , nave.nombre from piloto left join nave using (id_piloto);

-- Mostrar todos los pilotos que NO pilotan ninguna nave.
select piloto.nombre , nave.nombre from piloto left join nave using (id_piloto) where id_nave is null;

-- Mostrar todos los pilotos que NUNCA han pilotado una nave como el principal piloto (no pilotan actualmente ni están en históricos).
select * from piloto left join historico using (id_piloto) where fecha is null ;

-- Mostrar todas las naves, con los pilotos y copilotos asignados (incluídas aquellas que no tienen piloto o copiloto).
select nave.id_nave, nave.id_piloto, nave.id_copiloto from nave right join historico using (id_nave) ;
-- Modificar la consulta anterior para ordenar los resultados por el nombre de la nave de forma ascendente y poniendo el texto "-- no asignado --" cuando no tiene asignado un piloto o un copiloto.

-- Mostrar las naves que no tienen ningún piloto ni copiloto asignado.
select * from nave where id_piloto is null and id_copiloto is null;
select * from nave left join historico using (id_nave) where nave.id_piloto is null and id_copiloto is null;
/*Mostrar las naves que nunca han sido pilotadas por ningún piloto principal (no son pilotadas actualmente ni están en históricos). ¿Hay alguna?
Mostrar las naves que tienen copiloto pero no un piloto asignado. Mostrar en la consulta el nombre del copiloto.
Queremos comprobar en nuestra base de datos los pilotos que están actualmente pilotando más de una nave, para poder modificar los datos.
Mostrar las naves con más cambios de piloto en la historia.
Mostrar las naves que actualmente no tienen piloto asignado pero que han tenido uno en el pasado.
Mostrar los pilotos que son copilotos en más de una nave.*/
-- Mostrar el ranking promedio de los pilotos por tipo de nave 
select avg(ranking), tipo from piloto right join nave using(id_piloto) group by tipo;
-- Mostrar en una columna los nombres completos de los pilotos y en otra si actualmente es piloto, copiloto o ambos. La columna debe mostrar el texto “Piloto”, “Copiloto” o “Ambos”.*/


