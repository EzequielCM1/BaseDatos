delimiter //
drop procedure if exists ejercicio17 //
create procedure ejercicio17 (in p_usuarios varchar(10) , out p_edad int )
begin 
	declare v_fecha date ;
    
    select fecha_nacimiento into v_fecha from datos_personales where usuario = p_usuario;
    
    if v_fecha is not null then
		set p_edad = TIMESTAMPDIFF(YEAR, v_fecha, CURDATE());
        else 
			select "Este usuario no tiene instanciado la fecha de nacimiento";
            end if;
end //
delimiter ; 
set @edad=0;
call ejercicio17('pepe', @edad);

