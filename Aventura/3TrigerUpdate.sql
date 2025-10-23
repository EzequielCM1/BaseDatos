-- 3.- Crear disparadores en la tabla personajes para mantener automáticamente el campo miembros_actuales 
-- en la tabla equipos cuando se inserta un nuevo personaje, se elimina un personaje, o se actualiza el equipo de un personaje.

delimiter //
drop trigger if exists miembrosActuales //
CREATE TRIGGER miembrosActuales before insert ON `personajes` FOR EACH ROW
BEGIN
    
	if new.id_equipo is not null then
		update equipos set miembros_actuales = miembros_actuales +1
        where id_equipo = new.id_equipo;
    end if;
	
END //
delimiter ;
-- ------------------------------------------------------
delimiter //
drop trigger if exists miembrosActualesEliminar //
CREATE TRIGGER miembrosActualesEliminar before delete ON `personajes` FOR EACH ROW
BEGIN
    if old.id_equipo is not null then
		update equipos set miembros_actuales = miembros_actuales -1
        where id_equipo = old.id_equipo;
    end if;
	
END //
delimiter ;
-- ---------------------------------------------------
delimiter //
drop trigger if exists miembrosActualesUpdate //
CREATE TRIGGER miembrosActualesUpdate before update ON `personajes` FOR EACH ROW
BEGIN
    if old.id_equipo is not null then
		update equipos set miembros_actuales = miembros_actuales -1
        where id_equipo = old.id_equipo;
    end if;
    if new.id_equipo is not null then
		update equipos set miembros_actuales = miembros_actuales +1
        where id_equipo = new.id_equipo;
    end if;
	
END //
delimiter ;