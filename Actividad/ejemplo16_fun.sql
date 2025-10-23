delimiter //

drop procedure if exists ejemplo16 //

create procedure ejemplo16(in euros int, out pesetas decimal(10,2))
begin
    set pesetas = euros * 166.386;
end //

delimiter ;
set @resultado = 0;
call ejemplo16_sp(100, @resultado);
select @resultado as pesetas;