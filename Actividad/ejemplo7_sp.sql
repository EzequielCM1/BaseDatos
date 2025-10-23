DELIMITER //
drop procedure if exists contar_usuarios//
create  procedure contar_usuarios (out p_num_usuarios int)

begin 
	select count(*) into p_num_usuarios from usuarios;

end //
delimiter ;

call contar_usuarios(@num);
