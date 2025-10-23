delimiter //
drop function if exists fn_calcular_salario_anual //
create function fn_calcular_salario_anual (p_id_empleado int)
returns Decimal (10,2)
READS SQL DATA 
begin
	-- declaramos variables
	declare v_salarioMensual DECIMAL(10, 2);
    declare v_salarioAnual DECIMAL(10, 2);
    declare v_fecha date;
    
    
    -- Comprobamos si existe el empleado
	if not exists (select id_empleado from empleados where id_empleado = p_id_empleado) then
    return null;
    end if;
    
    -- Metemos el salario del empleado en la variable despues de saber si existe 
    select salario into v_salarioMensual from empleados where id_empleado = p_id_empleado;
    -- Metemos la fecha 
    select fecha_contratacion into v_fecha from empleados where id_empleado = p_id_empleado;
    
    -- Comprobamos que sea nulo o 0
    if v_salarioMensual is null or v_salarioMensual = 0 then 
    return 0.00;
    end if;

	-- Calculamos su salario Anual despues de saber si no es nulo o 0
    set v_salarioAnual = (v_salarioMensual *12);
    
    -- Comprobamos su fecha de contratación
    if v_fecha > 11-1-2019 then
     set v_salarioAnual = (v_salarioAnual * 1.5);
     end if ;
     
     -- Devolvemos su salario
     return v_salarioAnual ;
    
end //
delimiter ;

-- LLamamos a la funcion 
select fn_calcular_salario_anual(1);
