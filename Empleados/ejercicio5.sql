/*Ejercicio 2: Crea una función almacenada llamada fn_calcular_bonus_antiguedad.
Recibirá como parámetros de entrada:
p_id_empleado (INT).
p_porcentaje_base (DECIMAL(5,2)): El porcentaje de salario a usar como base para el bono (por ejemplo, 5.0 para un 5%).
p_años_minimos (INT): La antigüedad mínima en años completos que un empleado debe tener para ser elegible para el bono.
- Deberá validar que el empleado con p_id_empleado existe en la tabla empleados. Si no existe, devolverá NULL.
 -- Deberá validar que p_porcentaje_base y p_años_minimos sean valores no negativos. Si alguno no es válido, devolverá NULL.
Si los parámetros son válidos y el empleado existe:
- Obtendrá el salario y la fecha_contratacion del empleado.
Calculará la antigüedad del empleado en años completos (similar al Ejercicio 2, pero la lógica debe estar dentro de esta función).
-- Si la antigüedad calculada es mayor o igual a p_años_minimos Y el empleado tiene una fecha_contratacion válida (no NULL), la función calculará el monto del bono como salario * (p_porcentaje_base / 100.0) y devolverá ese valor.
En cualquier otro caso (antigüedad menor que p_años_minimos, fecha_contratacion es NULL, o parámetros de entrada inválidos ya manejados), la función devolverá 0.00.
La función debe devolver un valor DECIMAL(10,2).

*/
delimiter //
drop function if exists fn_calcular_bonus_antiguedad //
create function fn_calcular_bonus_antiguedad(p_id_empleado INT, p_porcentaje_base DECIMAL(5,2), p_años_minimos INT)
returns decimal (10,2)
deterministic
begin
	declare v_bonus INT default 0.00;
    declare v_id_empleado INT;
    declare v_salario decimal (10,2);
    declare v_antiguedad INT;
    
    declare v_fecha_contrato DATE;
    select id_empleado, fecha_contratacion, salario into v_id_empleado, v_fecha_contrato, v_salario from empleados where id_empleado = p_id_empleado;
    -- si el empleado no existe devuelve null
    if v_id_empleado IS NULL then
		return NULL;
	end if;
    
	-- p_porcentaje_base y p_años_minimos sean valores no negativos
	if p_porcentaje_base < 0 or p_años_minimos<0 then
		return NULL;
	end if;
        
    -- calculamos la antiguedad
    set v_antiguedad = fn_calcular_antiguedad_años(p_id_empleado);
    if v_antiguedad IS NULL then
		return null;
    end if;
    if v_antiguedad >= p_años_minimos and v_fecha_contrato IS NOT NULL then
		set v_bonus = v_salario * (p_porcentaje_base / 100.0);
    end if;
    
    return v_bonus;
    
end //
delimiter ;

select fn_calcular_bonus_antiguedad(1,1,1);
select id_empleado, fecha_contratacion,  salario, fn_calcular_antiguedad_años(id_empleado), fn_calcular_bonus_antiguedad(id_empleado, 10 , 6) from empleados;