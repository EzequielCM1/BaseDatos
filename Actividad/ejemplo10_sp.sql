
DELIMITER //
drop procedure if exists autentificacion//
create  procedure autentificacion(in p_usuario varchar(50), in p_password varchar(64) , out p_mensaje varchar(100))

begin 
	declare v_password varchar(64);
    select password into v_password from usuarios where usario = p_usuario;
    
    if v_password is null then 
		set p_mensaje =  "El usuario no existe ";
	elseif v_password = SHA2(p_password,256) then 
		set p_mensaje = "El usuario y contraseña es correcto";
    else 
    select "passsword incorrecto" into p_mensaje;
    end if;
end //
Delimiter ;

call autentificacion('pepe', '1234', @mensaje);
