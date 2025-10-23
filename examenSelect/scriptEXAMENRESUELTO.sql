-- Consulta 1: Mostrar los email de los vendedores nacidos entre 1985 y 1992 y cuyo
-- segundo apellido sea "López."
SELECT email
FROM vendedor
WHERE YEAR(fecha_nacimiento) BETWEEN 1985 AND 1992
AND apellidos LIKE '%López%';
-- Consulta 2: Mostrar nombres, descripciones y precios iniciales de objetos que sean libros
-- o cámaras y cuyo precio inicial sea inferior a 500 €.
SELECT nombre, descripcion, precio_inicial
FROM objeto
WHERE (descripcion LIKE '%libro%' OR descripcion LIKE '%cámara%')
AND precio_inicial < 500
ORDER BY precio_inicial DESC;
-- Consulta 3: Mostrar nombres y apellidos de los pujadore en formato "Apellidos, Nombre"
-- que no tengan teléfono o comentarios en el campo "notas".
SELECT CONCAT(apellidos, ', ', nombre) AS 'Apellidos, Nombre'
FROM pujador
WHERE telefono IS NULL
OR notas IS NULL;
-- Consulta 4: Mostrar el nombre del objeto, las fechas de inicio y fin, y la ganancia de cada
-- subasta finalizada.
SELECT o.nombre AS 'Nombre Objeto', s.fecha_inicio, s.fecha_fin,
(SELECT MAX(p.precio_puja) - o.precio_inicial FROM puja p WHERE p.id_subasta =
s.id_subasta) AS 'Ganancia'
FROM subasta s
JOIN objeto o ON s.id_objeto = o.id_objeto
WHERE s.fecha_fin < CURRENT_DATE;
-- Consulta 5: Mostrar los id_pujador, nombres y apellidos de los pujadores, cantidades
-- pujas y fechas para el objeto "Pintura al óleo".
SELECT p.id_pujador, p.nombre, p.apellidos, pu.cantidad, pu.fecha_puja
FROM puja pu
JOIN pujador p ON pu.id_pujador = p.id_pujador
JOIN objeto o ON pu.id_objeto = o.id_objeto
WHERE o.descripcion LIKE '%Pintura al óleo%';
-- Consulta 6: ¿Cuál es la cantidad máxima que se ha pujado en todas las subastas en el
-- año 2025?
SELECT MAX(precio_puja) AS 'Cantidad Máxima'
FROM puja pu
JOIN subasta s ON pu.id_subasta = s.id_subasta
WHERE YEAR(s.fecha_inicio) = 2025;
-- Consulta 7: Mostrar los datos de los vendedores y el número de objetos que tienen o han
-- tenido en subasta.

SELECT v.nombre, v.apellidos, COUNT(o.id_objeto) AS 'Numero de Objetos'
FROM vendedor v
LEFT JOIN objeto o ON v.id_vendedor = o.id_vendedor
GROUP BY v.id_vendedor;
-- Consulta 8: ¿Qué pujadores nunca han pujado en ninguna subasta?
SELECT nombre, apellidos
FROM pujador
WHERE id_pujador NOT IN (SELECT DISTINCT id_pujador FROM puja);
-- Consulta 9: Obtener los nombres de los objetos por lo que se ha pujado entre 2 y 5 veces.
SELECT o.nombre
FROM objeto o
JOIN puja pu ON o.id_objeto = pu.id_objeto
GROUP BY o.id_objeto
HAVING COUNT(pu.id_puja) BETWEEN 2 AND 5;
-- Consulta 10: ¿Qué objetos están en una subasta y nadie ha pujado por él?
SELECT o.nombre
FROM objeto o
LEFT JOIN puja pu ON o.id_objeto = pu.id_objeto
WHERE pu.id_puja IS NULL;
-- Consulta 11: Mostrar nombre y apellidos de los ganadores de las subastas, junto con el
-- nombre del objeto ganado y el precio pujado.
SELECT p.nombre, p.apellidos, o.nombre AS 'Objeto Ganado', pu.precio_puja
FROM puja pu
JOIN pujador p ON pu.id_pujador = p.id_pujador
JOIN subasta s ON pu.id_subasta = s.id_subasta
JOIN objeto o ON s.id_objeto = o.id_objeto
WHERE pu.precio_puja = (SELECT MAX(precio_puja) FROM puja WHERE id_subasta =
s.id_subasta);