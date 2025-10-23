drop database IF exists BD06;
create database BD06;
use BD06;
DROP TABLE if exists usuarios;

create table usuarios(
	usuario varchar(15) primary key,
    password varchar (15) not null
);

insert into usuarios values
('pepe', '1234'), ('juan', '12356'), ('ana', '78945');

delimiter $$ 
drop procedure if exists ejemplo6_sp $$
create procedure ejemplo6_sp(in p_usuario varchar(15), in p_password varchar(15))
begin
	insert into usuarios(usuario, password)
    value (p_usuario, p_password);
    select *from usuarios;
end$$
delimiter ;

call ejemplo6_sp ('manuel', '123242');

set @nombre='lolo' , @clave='676767';
call ejemplo6_sp(@nombre, @clave);