delimiter // 
Drop procedure if exists sp_incrementar_salario_empleado //
create procedure sp_incrementar_salario_empleado (in p_id_emppleado int , in p_porcentaje decimal(5,2) , out p_mensaje varchar(255))
principal :begin
-- 0 definir la variable
declare v_salario, v_nuevo_salario decimal (10,2);
declare v_id_empleado int;
-- control de errores
declare exit handler for 1048
	set p_mensaje = 'El personaje no puede ser null';
 -- 1 comprobar ue existe
	if not exists (select 1 from empleados where id_empleado = p_id_empleado) then
		set p_mensaje = 'No se ha encontrado el empleado';
        leave principal; -- nos salimos del procedimiento
	end if;
-- 2 comrpbar porcentaje >0
	if p_porcentaje <= 0 then 
		set p_mensaje = 'El porcentaje debe ser positivo';
         leave principal; -- nos salimos del procedimiento
	end if;
-- 3 calcular el nuevo salario
select salario into v_salario from empleados where id_empleado = p_id_empleado;
set v_salario_nuevo = v_salario * (1+p_porcentaje / 100);

-- 4 Actualizar el salario
update empleados
	set salario= v_salario_nuevo
    where id_empleado = p_id_empleado;
-- 5  insertamos en la tabla salario
insert into log_cambios_salario(id_empleado, salario_anterior, salario_nuevo, fecha_cambio, usuario_bd)
values (p_id_empleado, v_salario, v_nuevo_salario, now(), current_user());

set p_mensaje = 'Se ha actualizado el salario del empleado correctamente ';
end //
delimiter ;

call sp_incrementar_salario_empleado(2,null,@mensaje);
select @mensaje;