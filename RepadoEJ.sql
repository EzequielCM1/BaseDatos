Delimiter //
drop procedure if exists revisar_clientes_morosidad //
create procedure revisar_clientes_morosidad (in p_id int , out p_pagada int, out p_nivel_riesgo varchar(5))
begin
declare num_impagada int;
    select count(*) into num_impagada from facturas where pagada = false and cliente_id = p_id;

    set p_pagada = num_impagada;
     if num_impagada > 3 then
        update clientes set bloqueado = true , nivel_riesgo = 'Alto' where id = p_id;
		set p_nivel_riesgo = 'Alto';
    elseif num_impagada between 2 and 3 then 
		update clientes set nivel_riesgo = 'Medio' where  id = p_id;
        set p_nivel_riesgo = 'Medio';
	else -- if num_impagada between 0 and 1 then 
			update clientes set nivel_riesgo = 'Bajo' where id= p_id;
            set p_nivel_riesgo = 'Bajo';
    end if;
end //
Delimiter ;

call revisar_clientes_morosidad(2, @num_factura , @nuevo_estado);
select @num_factura as 'facturas inpagadas' , @nuevo_estado as 'estado';