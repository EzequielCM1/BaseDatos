DELIMITER //
DROP PROCEDURE IF EXISTS sp_incrementar_salario_empleado//
CREATE PROCEDURE sp_incrementar_salario_empleado (IN p_id_empleado INT, IN p_porcentaje DECIMAL(5,2), OUT p_mensaje varchar(255))
principal: BEGIN
	-- 0.- definición de variables
    declare v_salario, v_nuevo_salario DECIMAL (10,2);
    declare v_id_empleado INT;
     --  control de errores
	declare exit handler for 1048
		set p_mensaje = "El salario no puede ser null";
    
    declare exit handler for sqlexception
		set p_mensaje = "Error genérico en el procedimiento sp_incrementar_salario_empleado";
        
        
     select salario, id_empleado into v_salario, v_id_empleado from empleados where id_empleado = p_id_empleado;
    
	-- 1.- Comprobar existe id_empleado
    if v_id_empleado is null then
    -- if NOT exists (select 1 from empleados where id_empleado = p_id_empleado) then
		set p_mensaje ="No existe un empleado con ese identificador";
        leave principal; -- nos salimos del procedimiento
    end if;
    -- 2.- comprobar porcentaje > 0
    if p_porcentaje <= 0 then
		set p_mensaje ="El porcentaje debe ser positivo";
        leave principal; -- nos salimos del procedimiento
    end if;
   
    -- 3.- calcular el nuevo salario
    -- select salario into v_salario from empleados where id_empleado = p_id_empleado;
    set v_nuevo_salario = v_salario * (1 + p_porcentaje / 100);
    
    -- 4.- actiualizamos el salario por el nuevo
    UPDATE empleados
		set salario = v_nuevo_salario
        where id_empleado = p_id_empleado;
        
	-- 5.- insertamos en la tabla log_cambios_salario
    INSERT INTO log_cambios_salario (id_empleado, salario_anterior, salario_nuevo, fecha_cambio, usuario_bd)
		VALUES (p_id_empleado, v_salario, v_nuevo_salario, now(), current_user());
    
    set p_mensaje = "Salario actualizado y cambio registrado con éxito.";
    
END //
DELIMITER ; 

call sp_incrementar_salario_empleado(1,null,@mensaje);
select @mensaje;

