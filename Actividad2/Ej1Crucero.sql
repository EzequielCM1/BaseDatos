delimiter //
drop function if exists paradas_crucero //
create function paradas_crucero (p_ref char(7))

returns int 
DETERMINISTIC
begin
	declare v_num int ;
    
	set v_num = (select count(*) from recorrido where referencia = p_ref);
    return v_num;
end //
delimiter ;

select paradas_crucero('CC-885');
select referencia, paradas_crucero(referencia) from crucero;
-- select count(*) from recorrido where referencia = 'CC-885';