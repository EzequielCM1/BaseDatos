 -- 1
 insert into veterinario(num_colegiado, nombre, apellidos, especialidad, anyo_experiencia, telefono, clinica)
 values (1100, 'Sofia', 'Morales Díaz', 'Perros', 5 , 622334455, 'VetSalud Sevilla' );
 
 select* from veterinario;
 
 -- 2.
 begin;
 set sql_safe_updates = 0;
update propietario set telefono = null  where poblacion in ('Lebrija' , 'Carmona');
 set sql_safe_updates = 1;
 commit;
 -- 3 
 select * from propietario where dni = '55667788O';
 select * from propietario join animal using (id_propietario) where dni ='55667788O';
 
 delete from propietario where dni = '55667788O';
 -- no es posible eliminar por la restriccion de ondelete cascade 
 
 -- 4 pesar un 5% menos
 set sql_safe_updates = 0;
 update animal set peso =round(0.95 *peso, 2) -- esto es para que no de error por los decimales
 where especie!='Perro';
 set sql_safe_updates = 1;
 
 -- 5
  set sql_safe_updates = 0;
 delete from veterinario where num_colegiado in (select num_colegiado from atiende join animal using(num_id) where year (fecha_atencion)=2024 and month(fecha_atencion) between 1 and 2 and especie = 'Perro');
 set sql_safe_updates = 1;
 
 -- 6
 insert into animal (nombre, especie, peso, sexo, id_propietario )
 values ('Mickey' , 'Gato', 4.5, 'Macho' , (select id_propietario from (select id_propietario from propietario join animal using (id_propietario) where animal.nombre='Bobby' and especie='Perro')as AUX ) );

-- otra forma 
 insert into animal (nombre, especie, peso, sexo, id_propietario )
 select 'Mickey' , 'Gato', 4.5, 'Macho', id_propietario from propietario join animal using (id_propietario) where animal.nombre='Bobby' and especie='Perro' ;
 
 -- 7
 begin;
 
 insert into atiende (num_colegiado, num_id, fecha_atencion, tratamiento )
select num_colegiado, num_id, DATE_ADD(now(), interval 2 DAY ), 'vacuna rabia' from veterinario, animal where veterinario.nombre='Lucia' and apellidos='Fernández Ortega' and especie = 'Perro';
 
  
  /* el interval es para añadir dos dias mas 
  select num_colegiado, num_id, DATE_ADD(now(), interval 2 DAY ), 'vacuna rabia' from veterinario, animal where veterinario.nombre='Lucia' and apellidos='Fernández Ortega' and especie = 'Perro';*/
 commit;
 
 -- 8
 -- aqui actualiza las tabla segun las veces que se ha atendido cada animal de perro
 begin;
 set sql_safe_updates = 0;
 update animal 
 set num_atenciones = (select count(id_atencion) from atiende where num_id = animal.num_id );
  set sql_safe_updates = 1;
--   commit;
-- select count(id_atencion) from atiende, animal where atiende.num_id = animal.num_id;

-- 9
begin;
-- select num_id , especie from animal where especie='Gato';
-- select * from veterinario where nombre='Pablo' and apellidos='Rodríguez Medina' or clinica='VetSalud Sevilla';
delete atiende from atiende join animal using (num_id) join veterinario using (num_colegiado) where especie='Gato' and ( clinica='VetSalud Sevilla' or (veterinario.nombre='Pablo' and apellidos='Rodríguez Medina'));
commit;

 -- select * from atiende join animal using (num_id) join veterinario using (num_colegiado) where especie='Gato' and ( clinica='VetSalud Sevilla' or (veterinario.nombre='Pablo' and apellidos='Rodríguez Medina'));
 
 -- 10
 /*tabla temproral*/
 create temporary table propietarios_num_animales
 select id_propietario, propietario.nombre , apellidos, count(num_id)as 'num_animales' from propietario left join animal using (id_propietario) group by id_propietario;
