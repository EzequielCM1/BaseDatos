DELIMITER //
drop procedure if exists mayor_edad//
create  procedure mayor_edad (IN p_usuario varchar(50))

begin 
	declare v_usuario int;
    declare v_fecha date;
    declare v_edad int ;
    select count(*) into v_usuario from usuarios where usuario = p_usuario;
	if v_usuario = 0 then
		select "El usuario no existe";
		else 
        select fecha_nacimiento into v_fecha from datos_personales where usuario = p_usuario ;
		if v_fecha is null then
			select "El usuario no tiene regustrado la fecha de nacimiento";
		else 
			set v_edad = timestampdiff (year, v_fecha , now());
		case 
			when v_edad>=18 then
				select "El usuario es mayor de edad";
                else 
                select "El usuario no es mayor de edad ";
			end case ;
            end if;
            end if;
end //
Delimiter ;

call mayor_edad('ezequiel')