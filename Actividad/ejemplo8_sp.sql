delimiter //

drop procedure if exists ejercicio8 //

create procedure ejercicio8 (out num_usuarios int)
begin
    set num_usuarios = null;
    select count(*) into num_usuarios from usuarios;
    select num_usuarios as 'número de usuarios';
end //

delimiter ;
set @usuarios = null;
call ejercicio8(@usuarios);

