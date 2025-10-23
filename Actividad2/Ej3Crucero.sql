delimiter // 
drop procedure if exists num_cruceros_puerto //
create procedure num_cruceros_puerto(in p_nombre varchar(35),  out v_paradas int )
begin
	-- comprobar si el puerto existe 
    if not exists(select nombre from puerto where nombre = p_nombre)then
    set v_paradas= -1 ;
    else 
        -- devolver el numero de cruceros que pasan por ese puerto
	set v_paradas = (select count(distinct referencia) from puerto join recorrido on codigo = cod_puerto
	where nombre = p_nombre);
    end if ;
end //
delimiter ;

call num_cruceros_puerto( 'Barcelona' , @num);
select 'Numero de crucero ',@num;
-- select nombre from puerto where nombre = 'Barcelona';
-- select count(distinct referencia) from puerto join recorrido on codigo = cod_puerto where nombre = 'Barcelona';