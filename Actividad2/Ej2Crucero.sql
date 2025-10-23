delimiter //
drop procedure if exists cruceros_puerto_salida //
create procedure cruceros_puerto_salida(in p_puerto varchar(35)) 
begin 

	select referencia , compañia , precio from puerto join recorrido on codigo = cod_puerto
	join crucero using (referencia)
	where nombre = p_puerto and num_parada=1;
end //
delimiter ;

call cruceros_puerto_salida ('Barcelona');