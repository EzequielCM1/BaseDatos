delimiter //
drop trigger if exists tr_validar_eliminar_departamento //
create trigger tr_validar_eliminar_departamento BEFORE DELETE ON departamentos
for each row
begin
	declare v_num_empleados, v_num_departamentos INT;
    declare v_mensaje varchar(255);
    
	select count(*) into v_num_empleados from empleados where id_departamento = OLD.id_departamento;
    select count(*) into v_num_departamentos from departamentos;
    
    IF v_num_empleados > 0 then
		SIGNAL SQLSTATE '45000'
		  SET MESSAGE_TEXT = 'El departamento no se puede eliminar porque tiene empleados';
	end if;
    
    IF v_num_departamentos = 1 then
		set v_mensaje = CONCAT('El departamento "', OLD.nombre , '" no se puede eliminar porque ser el último departamento');
		SIGNAL SQLSTATE '45000'
		  SET MESSAGE_TEXT = v_mensaje;
	end if;
end //
delimiter ;