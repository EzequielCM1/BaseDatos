
/*PRIMER BLOQUE:*/
-- 1. Obtener el título y la duración de todas las películas que tenemos en el videoclub.
select titulo, duracion from pelicula ;
-- 2. Obtener un listado de los socios con sus apellidos y nombre ordenados alfabéticamente por el primer apellido desde la A hasta la Z.
select concat( apellido1, ' ', apellido2 , ' ', nombre)as socios from socio order by socios asc;
-- 3. Obtener el título de las películas del año 2014.
select titulo from pelicula where anyo = 2014;
-- 4. Obtener la cantidad total de películas que tienen una duración inferior a 100 minutos.
select count(titulo)as peliculas from pelicula where duracion<= 100;

/*SEGUNDO BLOQUE:*/
/* 5. Obtener la fecha de nacimiento convertida al formato “dd/mm/yyyy”
y el nombre de los socios que viven en Aguadulce o El Parador  (Usar la función DATE_FORMAT
)*/
select date_format(fec_nac,'%d/%m/%y'), nombre from socio where poblacion='Aguadulce' or poblacion='El Parador';
/* 6. Obtener el nombre de los socios en una misma columna con el formato APELLIDO1  (separación de coma) seguido del NOMBRE de aquellos socios que sean menores de 35 años a fecha de hoy. (Usar la función TIMESTAMPDIFF para el cálculo de la edad)*/
select concat(apellido1,", ", nombre) from socio where timestampdiff(year, fec_nac, now()) < 35;
/* 7. Obtener la cantidad total de copias alquiladas durante todo el mes de noviembre. (Usar la función MONTH o DATE_FORMAT)*/
select count(*) from alquiler where month(fec_alquila)=11 ;
/* 8. Obtener el precio mínimo y máximo de todas las películas almacenadas. */
select min(precio_alquiler), max(precio_alquiler) from pelicula;
/* 9. Obtener un listado donde se muestre por cada uno de los estados en los que puede estar una película, la cantidad total de las copias de películas que existen por cada uno de ellos.*/
select estado, count(id_copia) from copia_pelicula group by estado;
/* 10. Obtener el número de socio y la media de días que tiene alquiladas las películas cada uno de ellos.
Ordena el listado de mayor a menor valor medio en días. (Usar la función DATEDIFF)*/
select socio, datediff(ifnull(fec_devolucion,now()), fec_alquila) from alquiler;
select socio, avg(datediff(ifnull(fec_devolucion,now()), fec_alquila))as media from alquiler group by socio;

/* TERCER BLOQUE:*/
-- 11. Obtener el título de la película, el identificador de la copia, el género, el año y el estado de todas las copias que hay.
select pelicula.titulo, pelicula.anyo, pelicula.genero, copia_pelicula.id_copia, copia_pelicula.estado from pelicula, copia_pelicula where pelicula.codigo = copia_pelicula.pelicula;
select pelicula.titulo, pelicula.anyo, pelicula.genero, copia_pelicula.id_copia, copia_pelicula.estado from pelicula join copia_pelicula on pelicula.codigo = copia_pelicula.pelicula;
-- 11-b Obtener los nombres de los socios (nombre y apellidos) de aquellos que han alquilado alguna vez alguna película
select nombre, apellido1, apellido2 from socio, alquiler where socio.num_socio = alquiler.socio group by socio;
/*11-c Nombre de las películas que ha alquilado alguna vez el socio con código 1001 */
select titulo from pelicula, copia_pelicula, alquiler where pelicula.codigo = copia_pelicula.pelicula and copia_pelicula.id_copia = alquiler.copia_pel and socio = 1001;
/* 12. Obtener el identificador de la copia de película junto a la última fecha que se alquiló
de aquellas copias que estén en estado “estropeada” */
select id_copia from copia_pelicula join alquiler on id_copia = copia_pel where estado = 'estropeada' order by fec_alquila desc limit 1;
/*si queremos mostrar para cada copia de película estropeada cuál fué la última fecha que se alquilo: */
select id_copia from copia_pelicula join alquiler on id_copia = copia_pel where estado = 'estropeada' order by fec_alquila desc ;
select id_copia from copia_pelicula where estado = 'estropeada';
/* si queremos que de TODAS Las copias de películas estropeadas, cuál fué la última copia que se alquiló alguna:*/
select estado, count(pelicula) from copia_pelicula group by estado;
select poblacion, count(num_socio) from socio group by poblacion;
select nombre, apellido1, apellido2 from socio join alquiler on num_socio = socio where fec_devolucion is null;
-- Mostrar los proyectos junto al nombre del departamento al que están asociadas .

/*me dan error 
select proyecto.nombre "nombre proyecto" , departamento.nombre "nombre departamento" from proyecto join departamento on proyecto.cddep = departamento.cddep;
/* Mostrar los empleados y el nombre de los distintos departamentos en los que ha trabajado. Un proyecto está asociado a un departamento.
 Y un empleado puede trabajar en un proyecto que no es de su departamento.
 (los departamentos en los que ha trabajado corresponden a los departamentos asignados a los proyectos).
select empleado.nombre 'nombre empleado', departamento.nombre 'nombre departamento' from empleado join trabaja on empleado.cdemp = trabaja.cdemp join proyecto on trabaja.cdpro = proyecto.cdpro join departamento on proyecto.cddep = departamento.cddep order by empleado.nombre;
/* Modificar la consulta anterior para saber los empleados que han trabajado en algún proyecto, en cuántos proyectos distintos ha trabajado. 
(Mostrar el nombre del empleado y el número de proyectos distintos en los que ha trabajado)  
select empleado.nombre 'nombre empleado', count(proyecto.cdpro) 'nº proyectos' from empleado join trabaja on empleado.cdemp = trabaja.cdemp join proyecto on trabaja.cdpro = proyecto.cdpro group by empleado.nombre order by empleado.nombre;
*/


/* 12b.- Para cada población existente en la BD, sacar cuantos socios son naturales dicha población */
select poblacion, count(*) as total_socios from socio group by poblacion;
/* 12c.- Nombre y apellido de los socios que no hay devuelto sus películas*/
select socio.nombre, socio.apellido1 from socio join alquiler on socio.num_socio = alquiler.socio where alquiler.fec_devolucion is null;
/* 13. Obtener un histórico de alquiler de la copia de película cuyo id es 113 donde se detalle
 el número de socio que la ha alquilado, la fecha de alquiler y la fecha de devolución con
 formato DD/MM/YYYY. En el caso de que alguna fecha de devolución tenga valor nulo,
 debe aparecer el texto “no devuelta” */
 select socio, date_format(fec_alquila, '%d/%m/%Y') as fecha_alquiler, coalesce(date_format(fec_devolucion, '%d/%m/%Y'), 'no devuelta') as devolucion from alquiler where copia_pel = '113';
/* 14. Obtener el número del socio, la fecha de devolución y el número de días de retraso
 (incluyendo la palabra “días” al final) en la devolución de aquellos socios que han alquilado
 alguna copia de la película cuyo título comienza por “BIG” . 
((entendemos que una película se debe devolver en 1 día, en otro caso será considerada que tiene días de retraso)) (Usar la función DATEDIFF)*/
select alquiler.socio, alquiler.fec_devolucion, concat(datediff(alquiler.fec_devolucion, alquiler.fec_alquila) - 1, ' días') as retraso from alquiler join copia_pelicula on alquiler.copia_pel = copia_pelicula.id_copia join pelicula on copia_pelicula.pelicula = pelicula.codigo
where pelicula.titulo like 'Big%' and datediff(alquiler.fec_devolucion, alquiler.fec_alquila) > 1;
/* 15. Obtener el título de la película y el identificador de la copia junto a todos los datos
del socio que haya realizado el último alquiler.*/
select pelicula.titulo, alquiler.copia_pel, socio.* from alquiler 
join copia_pelicula on alquiler.copia_pel = copia_pelicula.id_copia
join pelicula on copia_pelicula.pelicula = pelicula.codigo
join socio on alquiler.socio = socio.num_socio
where alquiler.fec_alquila = (select max(fec_alquila) from alquiler);

 /* CUARTO BLOQUE */
/* 16. Obtener por cada socio, su nombre, primer apellido y el importe total
que se ha gastado en todos sus alquileres siempre y cuando la cantidad sea mayor que 7 euros.
 Ordena el listado del socio que más haya gastado al que menos.*/
select socio.nombre, socio.apellido1, sum(pelicula.precio_alquiler) as total from socio
join alquiler on socio.num_socio = alquiler.socio
join copia_pelicula on alquiler.copia_pel = copia_pelicula.id_copia
join pelicula on copia_pelicula.pelicula = pelicula.codigo
group by socio.num_socio having total > 7 order by total desc;
/*17. Obtener por cada película, su título y la cantidad de veces que ha sido alquilada
siempre y cuando sea una película de aventuras.*/
select pelicula.titulo, count(*) as total_alquileres from pelicula
join copia_pelicula on pelicula.codigo = copia_pelicula.pelicula
join alquiler on copia_pelicula.id_copia = alquiler.copia_pel
where pelicula.genero = 'Aventura' group by pelicula.codigo;
/* 18. Obtener un listado con el nombre completo, domicilio y teléfono de aquellos socios
que nunca se hayan retrasado en la devolución de alguna película que hayan alquilado.
NOTA: Se considera que hay retraso en la devolución cuando transcurre más de un día.*/
select socio.nombre, socio.apellido1, socio.domicilio, socio.telefono from socio where not exists (select 1 from alquiler where alquiler.socio = socio.num_socio and datediff(alquiler.fec_devolucion, alquiler.fec_alquila) > 1 );
