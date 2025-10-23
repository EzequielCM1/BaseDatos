-- 1.- Crear triggers en la tabla personajes para garantizar la coherencia de los datos de salud:
-- 1.2Al crear un nuevo personaje, su salud_actual debe ser automáticamente igual a su salud_maxima.
-- 1.3Cada vez que se intente actualizar un personaje, si el valor propuesto para salud_actual es mayor que salud_maxima, 
-- el trigger debe ajustar salud_actual para que sea igual a salud_maxima antes de que la actualización se complete. 
-- Esto evita que un personaje tenga más salud de la que puede tener.


delimiter //
drop trigger if exists salud_personajes //
CREATE TRIGGER salud_personajes BEFORE INSERT ON `personajes` FOR EACH ROW
BEGIN
	set new.salud_actual = new.salud_maxima;
END //
delimiter ;
-- ----------------------------------------------------------
delimiter //
drop trigger if exists salud_personajes2 //
CREATE TRIGGER salud_personajes2 after update ON `personajes` FOR EACH ROW
BEGIN
	if new.salud_actual > new.salud_maxima then
	set new.salud_actual = new.salud_maxima;
    end if;
END //
delimiter ;