-- Bloque A:
-- Selecciona los nombres de los artistas cuyo estilo sea 'Abstracto'.
select * from artistas where estilo = 'Abstracto';
 -- Encuentra todas las obras de arte cuyo precio estimado sea mayor a 5000 y ordénalas por año de creación en orden descendente.
select * from obras_arte where precio_estimado >= '5000' order by anio_creacion desc;
-- Muestra los artistas de nacionalidad 'Italiana' o que tengan como estilo 'Minimalista'.
select * from artistas where nacionalidad = 'Italiana' or estilo = 'Minimalista';
-- Encuentra las obras de arte cuyo título contenga la palabra 'Retrato'.
select * from obras_arte where titulo like '%Retrato%';

-- Selecciona todas las obras cuyo precio_estimado está entre 850000 y 900000 y que tengan tipo 'Pintura'.
select * from obras_arte where precio_estimado between  850000 and 900000 and tipo = 'Pintura';

-- Muestra una lista con los nombres de los artistas concatenados con su nacionalidad en el formato: "[nombre] - [nacionalidad]". Renombra la columna como artista_detalle.
select concat(nombre , ' ', nacionalidad) from artistas;
-- Selecciona los titulos de las obras de arte que no tienen artista asociado.
select titulo from obras_arte where artista_id is null;

-- Selecciona los titulos y precio estimado de las obras de arte de tipo 'Escultura' y renombra los campos titulo y precio_estimado como Nombre de la Obra y Costo.
select titulo as "Nombre de la Obra", precio_estimado as "Costo"from obras_arte where tipo='Escultura' ;
-- Encuentra los nombres de los artistas cuyo nombre comience con la letra 'A' y ordena los resultados por fecha de nacimiento en orden ascendente.
select nombre from artistas where nombre like 'A%' order by fecha_nacimiento asc;
-- Selecciona las obras de arte cuyo precio_estimado sea mayor a 2000000 y muestra sus títulos con un texto adicional 
-- en el formato "[título] - obra de alto valor". Renombra la columna como Detalle Obra. *
select obra_id, titulo from obras_arte where precio_estimado>2000000 ;

-- Bloque B
-- Consultar los nombres de los artistas y los títulos de sus obras de arte, donde el estilo sea "Surrealista", y ordenados por el nombre del artista.
select nombre , titulo from artistas join obras_arte using (artista_id) where estilo = 'Surrealista' order by nombre asc;

-- Listar las exposiciones junto con las obras de arte que están siendo exhibidas, mostrando el título de la obra, 
-- la exposición y la fecha de inicio de la exposición. Ordenado por fecha de inicio.
select exposiciones.nombre as exposición, obras_arte.titulo, exposiciones.fecha_inicio
 from exposiciones join obras_exposiciones using (exposicion_id) join obras_arte using (obra_id) order by exposiciones.fecha_inicio ;
 
 -- Mostrar los nombres de las exposiciones, el tiempo expresado en días en que han estado activas y los nombres de los artistas participantes.
select exposiciones.nombre ,  datediff(exposiciones.fecha_fin, exposiciones.fecha_inicio) as días_activa,
    group_concat(distinct artistas.nombre) as artistas from exposiciones join obras_exposiciones using (exposicion_id)
join obras_arte using (obra_id)
left join artistas using (artista_id)
group by exposiciones.exposicion_id;

-- De las obras de arte entre los años 1950 y 1975, muestra los títulos de las obras, el artista, y el precio estimado. Únicamente para las obras de tipo pintura.
select obras_arte.titulo, artistas.nombre, obras_arte.precio_estimado
from obras_arte
left join artistas using (artista_id)
where obras_arte.anio_creacion between 1950 and 1975
  and obras_arte.tipo = 'pintura';
  
  -- Mostrar el nombre de las exposiciones que ha exhibido la obra ‘Destino’
select distinct exposiciones.nombre
from exposiciones
join obras_exposiciones using (exposicion_id)
join obras_arte using (obra_id)
where obras_arte.titulo = 'destino';

-- Bloque C

-- Total de precio estimado de todas las obras de arte de tipo Pintura.
select format(sum(precio_estimado), 2) as total_pinturas from obras_arte where tipo = 'pintura';
-- Contar cuántas obras de arte existen en la base de datos
select count(*) as total_obras from obras_arte;
-- Promedio del precio estimado de las obras de arte por tipo de obra.
select tipo, format(avg(precio_estimado), 2) as promedio from obras_arte group by tipo;
-- Obtener el precio mínimo estimado por cada tipo de obra de arte.
select tipo, min(precio_estimado) as mínimo from obras_arte group by tipo;
-- Obtener el año de creación más reciente de las obras de arte por artista.
select artistas.nombre, max(obras_arte.anio_creacion) as último_año from artistas
left join obras_arte using (artista_id)
group by artistas.artista_id;
-- Obtener el total (suma total)de precio estimado por artista, solo para aquellos artistas cuyo total de obras supera los 5 millones.
select artistas.nombre, sum(obras_arte.precio_estimado) as total from artistas join obras_arte using (artista_id) group by artistas.artista_id having total > 5000000;
-- Contar cuántas exposiciones tienen más de 12 obras, y mostrar las exposiciones que cumplen esta condición.
select exposiciones.nombre, count(obras_exposiciones.obra_id) as total_obras from exposiciones join obras_exposiciones using (exposicion_id) group by exposiciones.exposicion_id having total_obras > 12;
-- Obtener el precio máximo de las obras de arte por año de creación, mostrando solo los años que tengan un precio máximo superior a 2 millones.
select anio_creacion, max(precio_estimado) as máximo from obras_arte group by anio_creacion having máximo > 2000000;

-- Bloque D

-- Obtener las obras de arte que no están en ninguna exposición
select titulo from obras_arte where obra_id not in (select obra_id from obras_exposiciones );
-- Para todas las obras de arte, queremos poner su título y el nombre del artista. 
-- En el caso de que una obra de arte no tenga reflejada su artista en la base de datos, debe aparecer el texto “--sin autor–-” 
select obras_arte.titulo, coalesce(artistas.nombre, '--sin autor--') as artista from obras_arte left join artistas using (artista_id);
-- Queremos mostrar un listado de todas las obras ordenadas alfabéticamente y en otra columna si la obra ha participado 
-- (marcando con una “X”) o no ha participado (marcando con una “O”) en la exposición “La magia del color” 
select obras_arte.titulo, if(filtro.obra_id is not null, 'x', 'o') as participó from obras_arte
left join (select obra_id from obras_exposiciones where exposicion_id = (select exposicion_id from exposiciones where nombre = 'la magia del color'))
 as filtro using (obra_id) order by obras_arte.titulo;