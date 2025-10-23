create table if not exists sistema (
    num_total_usuarios int not null default 0,
    ultima_actualizacion TIMESTAMP not null default CURRENT_TIMESTAMP
);
delimiter //
drop procedure if exists ejercicio18 //
create procedure ejercicio18 ()
begin
declare v_total int ;
	select count(*) into v_total from usuarios ;
	if v_total > num_total_usuarios then 
	update sistema set num_total_usuarios = v_total,  ultima_actualizacion = current_timestamp;
    select v_total as "Numero de usuarios actualmente";
    else 
	select "La cantidad de usuario es la misma ";
    end if;
end //
delimiter ;