delimiter // 
drop function if exists num_paradas_crucero_verificar //
create function num_paradas_crucero_verificar(p_ref char(7))
returns int 
DETERMINISTIC
begin
	declare v_num int;
    declare v_contador int ;
    
	-- set v_num = (select count(*) from recorrido where referencia = p_ref);
    -- Se le puede llmar a la funcion anterior 
    set v_num = (select paradas_crcuero(p_ref));
    if v_num = 0 then
		return -1;
    end if ;
    
    -- comprobar las paradas hasta v_num
   /*bucle: loop 
		if not exists (  select count(*) from recorrido where referencia = p_ref and num_parada = v_contador) then
        return -1;
        end if;
        set v_contador = v_contador +1;
    end loop bucle;
		*/
    
    
    -- otraa forma de hacerlo 
    while v_contador <= v_num do
		if not exists (  select count(*) from recorrido where referencia = p_ref and num_parada = v_contador) then
        return -1;
        end if;
		set v_contador = v_contador +1;
    end while ;
    
    return v_num;
end //
delimiter ;

call num_paradas_crucero_verificar('PC-125');