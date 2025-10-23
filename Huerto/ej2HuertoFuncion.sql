-- Crear una función llamada ​obtener_meses_asignacion​, donde a partir del dni de un usuario y el identificador
-- de un huerto, devuelva el número de meses que el usuario lleva asignado actualmente a 
-- una de las parcelas de dicho huerto (siempre que el huerto esté estado 'activo' o en 'mantenimiento'). Parámetros de entrada a la función
-- dni_usuario
-- id_huerto 
-- La función devolverá un valor numérico entero:
-- En el caso de que no exista el usuario, o no exista el huerto, o bien el usuario no ha estado en ninguna de las parcelas del huerto 
-- la función devolverá el valor 0
--  el caso de que el usuario esté asignado a una de las parcelas, se devolverá un número entero con el número de meses que 
-- actualmente lleva en dicha parcela (Para el cálculo de los meses, se tendrá en cuenta el campo fecha_asignación y la fecha actual). 
-- NOTA:
-- Un usuario no puede estar asignado simultáneamente a varias parcelas de un mismo huerto. Como máximo estará asignada a una de ellas.
-- Para el cálculo de los meses que el usuario lleva actualmente usando una parcela, puedes hacer uso de la función TIMESTAMPDIFF. 

DELIMITER //


DROP FUNCTION IF EXISTS obtener_meses_asignacion //


CREATE FUNCTION obtener_meses_asignacion (
    p_dni_usuario CHAR(9), -- Parámetro de entrada: DNI del usuario
    p_id_huerto INT  -- Parámetro de entrada: ID del huerto
)
RETURNS INT                     
READS SQL DATA -- la función lee datos de las tablas
BEGIN
    -- Variables locales
    DECLARE v_id_usuario, v_id_huerto INT;
    DECLARE v_fecha_asignacion DATE;
    DECLARE v_huerto_estado VARCHAR(50);
    DECLARE v_meses INT DEFAULT 0; -- Valor por defecto a devolver (0 si no se encuentra o no cumple las condiciones)


    -- 1. Verificar si el huerto existe y obtener su estado
    SELECT id_huerto, estado
    INTO v_id_huerto, v_huerto_estado
    FROM huerto
    WHERE id_huerto = p_id_huerto;


    -- Si el huerto no existe o no está en estado 'activo' o 'mantenimiento', devolver 0
    IF v_id_huerto IS NULL OR v_huerto_estado not in ('activo','mantenimiento') THEN
        RETURN 0;
    END IF;


    -- 2. Obtener el id_usuario a partir del DNI
    SELECT id_usuario
    INTO v_id_usuario
    FROM usuario
    WHERE dni = p_dni_usuario;


    -- Si el usuario no existe, devolver 0
    IF v_id_usuario IS NULL THEN
        RETURN 0;
    END IF;


    -- 3. Buscar la fecha de asignación para este usuario en una parcela del huerto especificado
    -- (Debido a la restricción UNIQUE en id_usuario_asignado en la tabla parcela,
    -- un usuario como máximo puede estar asignado a una parcela, así que LIMIT 1 es redundante
    -- pero no hace daño)
    SELECT fecha_asignacion
    INTO v_fecha_asignacion
    FROM parcela
    WHERE id_huerto = p_id_huerto
      AND id_usuario_asignado = v_id_usuario
    LIMIT 1; -- no haría falta poner limit 1


    -- 4. Si se encontró una asignación (la fecha no es NULL)
    IF v_fecha_asignacion IS NOT NULL THEN
		-- calcular la diferencia en meses
        SET v_meses = TIMESTAMPDIFF(MONTH, v_fecha_asignacion, CURDATE());
    END IF;
    -- Si v_fecha_asignacion es NULL v_meses permanece en su valor por defecto de 0.
    -- 5. Devolver el resultado calculado (o el valor por defecto 0)
    RETURN v_meses;
END //


DELIMITER ;


-- Cómo usar la función:
SELECT obtener_meses_asignacion('12345678A', 1); -- Ejemplo para usuario con DNI 12345678A en huerto 1


select usuario.nombre, usuario.apellidos, obtener_meses_asignacion(usuario.dni, 1) from usuario;

/*
delimiter //
drop function if exists obtener_meses_asignacion //
create function obtener_meses_asignacion (p_dni CHAR(9), p_id int )
returns int 
reads sql data
begin 
	declare v_dni CHAR(9);
    declare v_idJuerto int ;
    declare v_estado varchar(50);
    
    select dni, id_huerto, estado into v_dni, v_idJuerto, v_estado from usuario 
    join historico_usuario using (id_usuario) 
    join huerto using (id_huerto) where dni = '12345678A' or huerto.id_huerto = 1;
    
    -- verificamos el usuario
    if v_dni is null then 
    set v_mensaje = CONCAT('Error: El huerto con ID ', p_dni, ' no existe en la base de datos.');
        SIGNAL SQLSTATE '45000' 
			SET MESSAGE_TEXT = v_mensaje;
	END IF;
    -- verificamos que este activo o inactivo
    
    
    
end //
delimiter ;

select dni, id_huerto from usuario join historico_usuario using (id_usuario) join huerto using (id_huerto) where dni = '12345678A' or huerto.id_huerto = 1;