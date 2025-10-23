delimiter //
drop trigger if exists tr_insert_num_empleados_departamento //
create trigger tr_insert_num_empleados_departamento AFTER INSERT ON empleados
for each row
begin
	-- si el nuevo empleado, tiene un departamento
    if new.id_departamento is not null then
		-- actualizamos el numero de empleados de ese departamento
		update departamentos 
			set num_empleados = num_empleados + 1
            where id_departamento = new.id_departamento;
    end if;
end //



drop trigger if exists tr_delete_num_empleados_departamento //
create trigger tr_delete_num_empleados_departamento AFTER DELETE ON empleados
for each row
begin
	-- si el nuevo empleado, tiene un departamento
    if OLD.id_departamento is not null then
		-- actualizamos el numero de empleados de ese departamento
		update departamentos 
			set num_empleados = num_empleados - 1
            where id_departamento = old.id_departamento;
    end if;
end //

drop trigger if exists tr_update_num_empleados_departamento //
create trigger tr_update_num_empleados_departamento AFTER UPDATE ON empleados
for each row
begin
		if OLD.id_departamento is not null  then
			-- actualizamos el numero de empleados de ese departamento
			update departamentos 
				set num_empleados = num_empleados - 1
				where id_departamento = old.id_departamento;
		end if;
        if new.id_departamento is not null then
			-- actualizamos el numero de empleados de ese departamento
			update departamentos 
				set num_empleados = num_empleados + 1
				where id_departamento = new.id_departamento;
		end if;
end //

drop trigger if exists tr_validar_ubicacion //
create trigger tr_validar_ubicacion BEFORE INSERT ON departamentos
for each row
begin
	if new.ubicacion = 'casa' then
		-- lanzamos un error para que no se llegue a insertar el registro
		signal sqlstate '45000' set message_text = "La ubicación NO puede ser CASA";
    end if;
end //


delimiter ;