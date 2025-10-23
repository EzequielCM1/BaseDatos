/*
Ejercicio 1: Procedimiento para Listar Empleados por Departamento
Crea un procedimiento almacenado llamado sp_listar_empleados_departamento.
Recibirá como parámetro de entrada el id_departamento.
Deberá validar que el departamento con ese ID existe en la tabla departamentos. Si no existe, mostrará un mensaje indicando "Error: Departamento no encontrado."
Si el departamento existe, mostrará un listado de todos los empleados asignados a ese departamento, incluyendo su id_empleado, nombre, apellidos, email y salario.

*/
delimiter //
drop procedure if exists sp_listar_empleados_departamento //
create procedure sp_listar_empleados_departamento (IN p_id_departamento INT)
principal: begin
	if NOT exists(select 1 from departamentos where id_departamento = p_id_departamento) then
		select "Error: Departamento no encontrado";
        leave principal;
	else
		select id_empleado, nombre, apellidos, email, salario from empleados where id_departamento = p_id_departamento;
    end if;
    
end //
delimiter ;

call sp_listar_empleados_departamento(1);