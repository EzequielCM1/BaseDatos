DROP TABLE IF EXISTS usuarios;
CREATE TABLE IF NOT EXISTS usuarios (
    usuario VARCHAR(50) NOT NULL UNIQUE PRIMARY KEY,
    password VARCHAR(64) NOT NULL -- para SHA2 256
);
INSERT INTO usuarios (usuario, password)
VALUES ('pepe', SHA2('1234', 256)),
 ('ana', SHA2('hola123', 256));

DELIMITER //
drop procedure if exists encontrar_usuarios//
create  procedure encontrar_usuarios (in p_usuario varchar(50), in p_password varchar(50))

begin 
	declare v_resultado int;
    select count(*) into v_resultado
    from usuarios where usuario = p_usuario and password=SHA2(p_password,256);
    
    if v_resultado = 1 then 
		select "Usuario y contraseña son correctos";
        else 
		select "Usuario y contraseña incorrectos";
        end if;
end //
Delimiter ;

call encontrar_usuarios('pepe', '1234');