DELIMITER $$

DROP PROCEDURE IF EXISTS ejemplo13_sp $$
CREATE PROCEDURE ejemplo13_sp(IN p_usuario VARCHAR(15))
BEGIN
    -- Verificar si el usuario existe
    IF EXISTS (SELECT 1 FROM usuarios WHERE usuario = p_usuario) THEN

        -- Verificar si ya tiene datos personales
        IF EXISTS (SELECT 1 FROM datos_personales WHERE usuario = p_usuario) THEN
            -- Actualizar datos: incrementar accesos y guardar la fecha actual
            UPDATE datos_personales
            SET accesos = accesos + 1,
                ultima_fecha = NOW()
            WHERE usuario = p_usuario;
        ELSE
            -- Insertar nuevo registro si no existía
            INSERT INTO datos_personales (usuario, accesos, ultima_fecha)
            VALUES (p_usuario, 1, NOW());
        END IF;

        -- Mostrar los datos personales del usuario
        SELECT * FROM datos_personales WHERE usuario = p_usuario;

    ELSE
        SELECT 'Usuario no encontrado' AS mensaje;
    END IF;
END $$
DELIMITER ;
