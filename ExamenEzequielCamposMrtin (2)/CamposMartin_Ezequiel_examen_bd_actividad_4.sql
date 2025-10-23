delimiter // 
drop TRIGGER if exists tr_nueva_tarea_logs //
CREATE TRIGGER tr_nueva_tarea_logs AFTER INSERT ON `tareas` FOR EACH ROW
BEGIN
	-- declaramos las variables 
	declare v_cantidad int; -- para insertar la cantidad
    
    -- insertamos la cantidad en la variable 
    select count(id_tarea) into v_cantidad from tareas  where estado != 'COMPLETADA' group by id_proyecto = new.id_proyecto;
    
    -- Comprobar que no haya mas de 5 tareas 
    if v_cantidad > 5 then 
    SIGNAL SQLSTATE '45000' 
		SET MESSAGE_TEXT = 'Error . no puede haber mas de 5 tareas para ese proyecto ';
	end if;
    
    -- Insertamos un nuevo registro en la tabla 
    insert into log_tareas_insertadas (id_tarea, fecha_hora)
    values (new.id_tarea , now());
    
END //
delimiter ;

-- Hacemos el insert 
-- INSERT INTO `examen_programacion_bd2425`.`tareas` (`nombre`, `descripcion`, `fecha_limite`, `estado`) VALUES ('Examen', 'Prueba Examen', '2024-10-10', 'PENDIENTE');