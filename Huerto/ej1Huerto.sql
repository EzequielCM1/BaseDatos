-- Crear un procedimiento llamado ​actualizar_datos_huerto​ de forma que tenga como parámetros de entrada:
-- identificador de un huerto
-- El procedimiento debe de actualizar el número total de parcelas existentes y disponibles para dicho huerto, para ello debes realizar las siguientes acciones:
-- Provocar un error mostrando un mensaje en el caso de que el huerto pasado por parámetros no existe en la base de datos.
-- En el caso de que el huerto exista, se deben actualizar los valores de los campos 'numero_parcelas' y 'parcelas_disponibles':
-- El 'numero_parcelas' corresponderá al total de parcelas que existen en la base de datos para dicho huerto
-- El valor 'parcelas_disponibles' corresponderá al número de parcelas que están 'disponible' para ese huerto (siempre que el huerto esté en estado activo). Si el huerto no estuviera 'activo' el valor de 'parcelas_disponibles' será 0.
-- Una vez actualizado los campos 'numero_parcelas' y 'parcelas_disponibles', se mostrará un mensaje, indicando el nombre del huerto, su dirección, el número de parcelas totales y el número de parcelas disponibles. 
-- Nota: Un huerto se considera activo si su estado='activo'. Una parcela está disponible si tiene almacenado el valor disponible=1;
DELIMITER //
DROP PROCEDURE IF EXISTS actualizar_datos_huerto //
CREATE PROCEDURE actualizar_datos_huerto (
    IN p_id_huerto INT
)
BEGIN
    -- Variables para almacenar los datos del huerto y los conteos
    DECLARE v_nombre_huerto VARCHAR(50);
    DECLARE v_direccion_huerto VARCHAR(255);
    DECLARE v_estado_huerto VARCHAR(50);
    DECLARE v_total_parcelas INT;
    DECLARE v_disponibles_calculado INT;
    declare v_mensaje varchar(255);


    -- 1. Verificar si el huerto existe y obtener sus datos actuales
    SELECT nombre, direccion, estado
    INTO v_nombre_huerto, v_direccion_huerto, v_estado_huerto
    FROM huerto
    WHERE id_huerto = p_id_huerto;


    -- Mostrar un mensaje si el huerto no existe
    IF v_nombre_huerto IS NULL THEN
        set v_mensaje = CONCAT('Error: El huerto con ID ', p_id_huerto, ' no existe en la base de datos.');
        SIGNAL SQLSTATE '45000' 
			SET MESSAGE_TEXT = v_mensaje;
	END IF;
    
	-- 2. Calcular el número total de parcelas para este huerto
	SELECT COUNT(*)
	INTO v_total_parcelas
	FROM parcela
	WHERE id_huerto = p_id_huerto;


	-- 3. Calcular el número de parcelas disponibles
	-- Si el huerto está activo, contar las parcelas marcadas como disponible=1
	-- Si no está activo, el número de disponibles es 0
	IF v_estado_huerto = 'activo' THEN
		SELECT COUNT(*)
		INTO v_disponibles_calculado
		FROM parcela
		WHERE id_huerto = p_id_huerto
		  AND disponible = 1;
	ELSE
		SET v_disponibles_calculado = 0;
	END IF;


	-- 4. Actualizar los campos en la tabla huerto
	UPDATE huerto
	SET
		numero_parcelas = v_total_parcelas,
		parcelas_disponibles = v_disponibles_calculado
	WHERE id_huerto = p_id_huerto;


	-- 5. Mostrar un mensaje con los datos actualizados
	SELECT CONCAT(
		'Datos del huerto actualizados: ',
		'Nombre: ', v_nombre_huerto,
		', Dirección: ', v_direccion_huerto,
		', Total parcelas: ', v_total_parcelas,
		', Parcelas disponibles: ', v_disponibles_calculado
	) AS Mensaje;


END //


DELIMITER ;




CALL actualizar_datos_huerto(1); -- Actualizar datos para el huerto con ID 1
 CALL actualizar_datos_huerto(2); -- Actualizar datos para el huerto con ID 2
CALL actualizar_datos_huerto(3); -- Actualizar datos para el huerto con ID 3
CALL actualizar_datos_huerto(99); -- Ejemplo de huerto que no existe




/*
delimiter //
drop procedure if exists actualizar_datos_huerto​ //
create procedure actualizar_datos_huerto​ (p_id int)
begin 
	declare v_id int ;
    declare v_cantidadP int ;
    declare v_disponible int;
	-- select count(id_huerto) into v_id from huerto where id_huerto = p_id;
	 select cnumero_parcelas into v_cantidadP from huerto where id_huerto = p_id;
     -- select count(numero_parcelas) from huerto where id_huerto = 1 group by id_huerto ;
     select count(numero_parcelas) into v_cantidadP from huerto where id_huerto = p_id group by id_huerto ;
     
	 if v_id = 0 then 
		SIGNAL SQLSTATE '45000'
		  SET MESSAGE_TEXT = 'No existe en la base de dato';
	end if;
    
    select count(numero_parcela)  into v_cantidadP
    from huerto 
    where id_huerto = p_id group by id_huerto ;
    
    select count(parcelas_disponibles) into v_disponible
    from huerto join parcela using (id_huerto)
    where id_huerto = p_id and estado='activo' group by id_huerto ;
    /*
    update huerto set numero_parcelas = 
    (select count(numero_parcelas) from huerto where id_huerto = p_id group by id_huerto )
    where id_huerto = p_id;
    
    if 

end //
delimiter ;

call actualizar_datos_huerto​(5);
select count(numero_parcelas) from huerto where id_huerto = 1 group by id_huerto ;
select count(numero_parcela) from parcela where id_huerto = 1 group by id_huerto ;*/