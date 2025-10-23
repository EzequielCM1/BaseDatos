-- Ezequiel
-- 1
select nombre, apellidos , direccion from instructor where direccion like '%Sevilla%' or direccion like '%Cádiz%' order by apellidos ,nombre asc ;

-- 2
select nombre, raza, fecha_ingreso from perro where entrenamiento_completo is false;

-- 3
select count(sesion_id) as total from sesion where evaluacion = 'Excelente';

-- 4
select format(avg(timestampdiff(year , fecha_nacimiento , curdate())), 2)as edad_promedio from usuario_final;

-- 5
select perro.nombre , concat(instructor.nombre , ' ', apellidos)as instructor , fase_id , fase.nombre from sesion 
	join perro using (perro_id)
    join instructor using (instructor_id)
    join fase using (fase_id) order by perro.nombre, fase_id asc ;
    
-- 6
select perro.nombre, raza, concat(usuario_final.nombre , ' ', apellidos)as usuarioFinal from perro join usuario_final using(usuario_id) where raza = 'Labrador';

-- 7
select concat(instructor.nombre, ' ', apellidos)as instructo , count(sesion_id)as total from sesion 
	right join instructor using (instructor_id) group by instructor_id order by total desc;
    
-- 8
select nombre , count(sesion_id) from fase 
	join sesion using (fase_id) group by fase_id having count(sesion_id) between 10 and 15 ;

-- 9 Esta consulta no me sale , me devuelve nulo
     select nombre , sum(datediff(fecha in (select fecha from sesion where fase_id = 1) , fecha in (select fecha from sesion where fase_id = 5)))as total from perro 
	join sesion using (perro_id) group by nombre;

-- 10 
select usuario_final.nombre , if(perro_id is null, '-sin asignar-', perro.nombre)as perro from usuario_final 
	left join perro using (usuario_id);

-- 11
select perro.nombre, raza from perro 
	join sesion using (perro_id)
    join fase using (fase_id) where fase.nombre != 'Asistencia Visual' group by perro_id
    having count(fase_id in (select fase_id from fase where nombre = 'Obediencia'))>=1 ;