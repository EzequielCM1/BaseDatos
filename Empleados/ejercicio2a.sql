/*Ejercicio 2: Función para Calcular Antigüedad de un Empleado en Años
Crea una función almacenada llamada fn_calcular_antiguedad_años.
Recibirá como parámetro de entrada el id_empleado.
Deberá validar que el empleado con ese ID existe en la tabla empleados. Si no existe, devolverá NULL.
Si el empleado existe y tiene una fecha_contratacion definida, devolverá un número entero con la antigüedad del empleado en años completos (calculado desde fecha_contratacion hasta la fecha actual). Si la fecha_contratacion es NULL, devolverá 0.
*/
delimiter //
drop function if exists fn_calcular_antiguedad_años //
create function fn_calcular_antiguedad_años(p_id_empleado INT)
returns int
deterministic
begin
	-- declare v_anyos INT;
    declare v_id_empleado INT;
    
    declare v_fecha_contrato DATE;
    select id_empleado, fecha_contratacion into v_id_empleado, v_fecha_contrato from empleados where id_empleado = p_id_empleado;
   
	if v_id_empleado IS NULL then
		return NULL;
	elseif v_fecha_contrato IS NULL then
		return 0;
	else
		return TIMESTAMPDIFF(year, v_fecha_contrato, now());
    end if;
	
   
   -- return v_anyos;
end //
delimiter ;

select fn_calcular_antiguedad_años(4);
select id_empleado, fecha_contratacion,  fn_calcular_antiguedad_años(id_empleado)  from empleados;

/* if v_id_empleado then
		-- calculamos la antiguedad
        set v_anyos = timestampdiff(YEAR, v_fecha_contrato, now());
        set v_anyos = IFNULL(v_anyos,0); 
    end if;*/