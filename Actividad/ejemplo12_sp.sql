DELIMITER //

DROP PROCEDURE IF EXISTS ejercicio12 //

CREATE PROCEDURE ejercicio12()
BEGIN
    DECLARE i TINYINT DEFAULT 1;
    DROP TABLE IF EXISTS articulos;

    CREATE TABLE articulos (
        id_articulo INT NOT NULL PRIMARY KEY,
        nombre VARCHAR(15) NOT NULL,
        precio INT NULL
    );

    WHILE i <= 10 DO
        INSERT INTO articulos (id_articulo, nombre, precio)
        VALUES (i, CONCAT('articulo', i), 100 * i);
        SET i = i + 1;
    END WHILE;

END //

DELIMITER ;

-- Llamada al procedimiento
CALL ejercicio12();
