delimiter //
drop trigger if exists validadrEquipo2 //
CREATE TRIGGER validadrEquipo2 before insert ON `historial_equipo` FOR EACH ROW
BEGIN

	if new.id_equipo_anterior is null and new.id_equipo_nuevo is null then
        SIGNAL SQLSTATE '45000' 
			SET MESSAGE_TEXT = 'El equipo anterior y nuevo no pueden ser nulos ambos a la vez';
    end if;
	
END //
delimiter ;

-- INSERT INTO `aventura`.`historial_equipo` (`id_historial`, `id_personaje`, `fecha_cambio`, `tipo_cambio`) VALUES ('5', '3', '2025-02-01 10:10:00', 'ingreso');
