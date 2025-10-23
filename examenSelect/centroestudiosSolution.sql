-- 1
-- ¿Cómo se llama el profesor que tiene el teléfono 646965799?
select nombre from profesor where telefono = '646965799';

-- 2
-- ¿Cuántos alumnos hay matriculado en la asignatura cuyo código identificativo es el 5?
select count(dni_alumno) from matricula where cod_asignatura = 5 ;

-- 3
-- Mostrar los nombres y apellidos de todos los alumnos que están cursando la asignatura 
-- "Programación Android", ordenados alfabéticamente por apellidos y nombre  
select concat(apellidos, ' ', alumno.nombre) as nombre from alumno 
	join matricula using (dni_alumno)
    join asignatura using (cod_asignatura) where asignatura.nombre = 'Programación Android' order by apellidos asc;
    
    -- 4
    -- Mostrar los nombres y apellidos de los profesores que dan alguna asignatura del curso de 
-- 'Ofimática'  ordenando alfabéticamente los resultados por apellidos y nombre (Nota: No se 
-- deben mostrar los profesores repetidos si imparten más de una asignatura)
select distinct concat(apellidos, ' ', profesor.nombre) as profe from profesor 
	join asignatura using (dni_profesor)
    join curso on curso.codigo_curso = asignatura.cod_curso
    where curso.nombre = 'Ofimática' order by profe ASC;
    
    -- 5
    -- Mostrar un listado con todos los profesores del centro, indicando en una columna si el 
	-- profesor es tutor o no de algún curso.
    select concat(apellidos, ' ', profesor.nombre) as profe , case 
           when curso.dni_tutor is not null then 'Sí'
           else 'No'
       end as es_tutor from profesor left join asignatura using (dni_profesor)
		join curso on curso.codigo_curso = asignatura.cod_curso ;
        
        -- 6
        -- Para cada asignatura del curso "Desarrollo Web" mostrar el número de alumnos 
		-- matriculados y el número de alumnos que han aprobado.
		select 
    a.nombre as asignatura,
    count(m.dni_alumno) as total_alumnos,
    count(case when m.nota >= 5 then 1 end) as total_aprobados
from asignatura a
join curso c on a.cod_curso = c.codigo_curso
join matricula m on m.cod_asignatura = a.cod_asignatura
where c.nombre = 'Desarrollo Web'
group by a.nombre;