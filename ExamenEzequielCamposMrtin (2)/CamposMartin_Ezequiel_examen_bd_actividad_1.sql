delimiter //
drop procedure if exists sp_listar_tareas_proyecto //
create procedure sp_listar_tareas_proyecto (in p_id_proyecto int)
begin 
	-- Validamos si el proyecto no existe mostará el mensaje por pantalla 
    if not exists (select id_proyecto from proyectos where id_proyecto= p_id_proyecto) then
    SIGNAL SQLSTATE '45000' 
		SET MESSAGE_TEXT = 'Error: Proyecto no encontrado';
	end if;
    
    -- mostar el listado de tareas con la id del proyecto y los empleados asociados 
	select id_tarea, tareas.nombre, estado, empleados.nombre from tareas 
	left join empleados on  empleados.id_empleado = id_empleado_asignado
	where id_proyecto= p_id_proyecto;
    

end //
delimiter ;

-- llmamos al procedimiento 
call sp_listar_tareas_proyecto (2);