 -- Crear un trigger llamado insertar_puerto que cuando se inserte un puerto compruebe si existe el 
 -- nombre y país del puerto insertado. En tal caso no realizar la inserción.

delimiter //
drop trigger if exists insertar_puerto //
create trigger insertar_puerto
 before insert on puerto
 for each row
 begin
	declare v_num int ;
	select count(*) from puerto where nombre = new.nombre and pais = new.pais ;
    
    if v_num > 0 then 
		-- ya existe un puerto con ese nombre y ese pais 
        signal sqlstate '4500' 
        set message_text = 'Ya existe un puerto con ese nombre en ese pais';
    end if;
    
 end //
 
delimiter ;
