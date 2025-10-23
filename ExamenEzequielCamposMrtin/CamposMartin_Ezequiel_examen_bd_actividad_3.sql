delimiter //
drop procedure if exists sp_completar_tareas_empleado //
create procedure sp_completar_tareas_empleado (in p_id_empleado int, out num_tareas_completadas int , out mensaje_resultado varchar(255))
tareas : begin 
	-- Declarar variables
    declare v_cantidadTareas int ; -- para insertar el numero de tareas
    
     -- Handler para errores internos
    declare continue handler for sqlexception
    begin
        SET mensaje_resultado = 'Error interno al procesar tareas';
        set num_tareas_completadas = 0;
    end;
    
    -- Comprobamos si existe el empleado y en caso de no , mostarle los mensajes de error
    if not exists (select id_empleado_asignado from tareas where id_empleado_asignado= p_id_empleado)then 
    set mensaje_resultado = 'Empleado no encontrado';
    set num_tareas_completadas = 0;
	leave tareas ;
    end if ;
    
    -- Si existe el empleados calculamos cuantas tareas tiene en proceso y meterlo en la variable
    select count(id_tarea) into v_cantidadTareas from tareas where id_empleado_asignado = p_id_empleado and estado = 'EN PROCESO';
    
    -- Si la cantidad es 0 le mostramos mensaje de error y devolver 0
    if v_cantidadTareas = 0 then
    set mensaje_resultado = 'No hay tareas en proceso para este empleado';
    set num_tareas_completadas = 0;
    leave tareas;
    end if;
    
    -- Actualizamos la tarea a completada
    update tareas set estado = 'COMPLETADA'
    where id_empleado_asignado = p_id_empleado;
    
    -- Mostramos mensaje de exito 
    set mensaje_resultado = 'Tareas completadas con éxito';
    
end //
delimiter ;

-- Llamamos al procedimieto
-- En este comprobamos que de el error
call sp_completar_tareas_empleado(3,@cantidad,@mensaje);
select @cantidad , @mensaje;

-- En este comprobamos que inserta correctamente
-- la cantidad devuelve nulo ya que no habrá tareas en proceso
call sp_completar_tareas_empleado(1,@cantidad,@mensaje);
select @cantidad , @mensaje;