-- Ezequiel Campos
-- 1
insert into instructor (instructor_id, nombre, apellidos, dni, email, telefono, direccion)
values (11, 'Carlos' ,'Ruiz Mateos', '11223344A', 'carlos.ruiz@adiestradores.com' , 699887766, 'calle Falsa 123, Dos hermanas, 41700');

-- 2
 set sql_safe_updates = 0;
update instructor set telefono = 954112233 where direccion like '%Sevilla%';
 set sql_safe_updates = 1;

-- 3
delete from instructor where nombre = 'Javier' and apellidos = 'Ureña Huguet';
-- No, no es posible eliminar por la restriccion de ondelete cascade y la foreignKey

-- 4
update sesion set evaluacion = 'Satisfactorio' where evaluacion = 'Necesita mejora' and fase_id in (select fase_id from fase where nombre = 'Obediencia');

-- 5
delete from sesion where year(fecha)=2025 and month(fecha)=1 and perro_id in (select distinct perro_id from perro where raza = 'Caniche');
-- Si es posible 

-- 6 
insert into sesion(fecha, evaluacion, perro_id, instructor_id, fase_id)
select '2025-04-1', 'Satisfactorio' , perro_id, instructor_id, fase_id from perro 
	left join sesion using (perro_id)
    join instructor using (instructor_id)
	join fase  using(fase_id)
where perro.nombre = 'Horacio' and instructor.nombre = 'Ana' and instructor.apellidos='Hidalgo Anglada' and fase.nombre='Asistencia Visual' ;

-- 7 
begin;
 set sql_safe_updates = 0;
update perro set entrenamiento_completo = 1
where perro_id in (select distinct perro_id from sesion join fase using (fase_id) where fase_id between 1 and 5  order by perro_id desc);
 set sql_safe_updates = 1;
commit;

-- 8
begin;
update sesion set evaluacion = 'Excelente'
where evaluacion = 'Satisfactorio' and instructor_id not in(select distinct instructor_id from instructor where direccion like '%Sevilla%');
commit;

-- 9
begin;
delete from sesion where perro_id in (select distinct perro_id from perro where raza='Pastor Alemán') and evaluacion='Necesita mejora';
commit;

-- 10
-- tabla 
create table resumen_instructores (
instructor_id int primary key,
nombre_completo varchar(151),
perros_distintos_entrenados int
);
-- sentencia
insert into resumen_instructores (instructor_id, nombre_completo, perros_distintos_entrenados)
select instructor_id ,concat(nombre,' ', apellidos), count(perro_id) from instructor 
	left join sesion using (instructor_id) 
    group by instructor_id ;
;