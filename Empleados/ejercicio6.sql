DELIMITER //
drop procedure if exists sp_transferir_empleado //
CREATE PROCEDURE sp_transferir_empleado (
    IN p_id_empleado INT,
    IN p_nuevo_id_departamento INT,
    OUT p_mensaje VARCHAR(255)
)
Principal: BEGIN
    DECLARE v_departamento_antiguo INT;

    -- Handler para errores internos
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        SET p_mensaje = 'Error interno al procesar la transferencia.';
    END;

    -- Verificar existencia del empleado antes de usar SELECT
    IF NOT EXISTS (
        SELECT 1 FROM empleados WHERE id_empleado = p_id_empleado
    ) THEN
        SET p_mensaje = 'El empleado no existe.';
        LEAVE Principal;
    END IF;

    -- Obtener departamento actual
    SELECT id_departamento INTO v_departamento_antiguo
    FROM empleados WHERE id_empleado = p_id_empleado;

    -- Validar departamento destino solo si no es NULL
    IF p_nuevo_id_departamento IS NOT NULL THEN
        IF NOT EXISTS (
            SELECT 1 FROM departamentos WHERE id_departamento = p_nuevo_id_departamento
        ) THEN
            SET p_mensaje = 'El departamento destino no existe.';
            LEAVE Principal;
        END IF;
    END IF;

    -- Verificar si ya está en el departamento destino
    IF (v_departamento_antiguo <=> p_nuevo_id_departamento) THEN
        SET p_mensaje = 'El empleado ya está en el departamento de destino.';
        LEAVE Principal;
    END IF;

    -- Actualizar
    UPDATE empleados
    SET id_departamento = p_nuevo_id_departamento
    WHERE id_empleado = p_id_empleado;

    -- Registrar en log
    INSERT INTO log_transferencias_empleado (
        id_empleado, id_departamento_anterior, id_departamento_nuevo, fecha_transferencia
    ) VALUES (
        p_id_empleado, v_departamento_antiguo, p_nuevo_id_departamento, NOW()
    );

    -- Éxito
    SET p_mensaje = 'Empleado transferido con éxito.';
END //

DELIMITER ;
