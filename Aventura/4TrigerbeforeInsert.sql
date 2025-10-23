delimiter //
drop trigger if exists miembrosActuales //
CREATE TRIGGER miembrosActuales before insert ON `personajes` FOR EACH ROW
BEGIN
    declare v_cantidad_M int;
    
    select count(id_personaje) into v_cantidad_M from personajes where id_equipo = new.id_equipo;
	
    if v_cantidad_M >= 5 then 
	SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'No puede haber mas de 5 miembros';
    end if;
    
    if v_can
    
	
	
END //
delimiter ;