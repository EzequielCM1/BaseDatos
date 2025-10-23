-- ejercicio1
-- CREATE USER ejemplosBD06 IDENTIFIED BY "12345";
-- GRANT CONNECT, RESOURCE TO ejemplosBD06;

DELIMITER //
drop procedure if exists ejercicio1//
CREATE PROCEDURE ejercicio1()
BEGIN
    SELECT 'Esto es un ejemplo de bloque';
END;
//

DELIMITER ;

CALL ejercicio1();

-- Ejercicio 2
DELIMITER //

DROP PROCEDURE IF EXISTS ejercicio2//
CREATE PROCEDURE ejercicio2()
BEGIN
    DECLARE v_entero INT DEFAULT 1;
    DECLARE v_texto VARCHAR(10) DEFAULT NULL;
    DECLARE v_decimal DECIMAL(4,2) DEFAULT 12.34;

    -- Asignar nuevos valores
    SET v_entero = v_entero + 2;
    SET v_texto = 'PLSQL';
    SET v_decimal = v_decimal * v_entero; -- Multiplica 12.34 * 3

    -- Mostrar resultados
    SELECT v_entero AS 'Valor entero', 
           v_texto AS 'Valor texto', 
           v_decimal AS 'Valor decimal';
END;
//

DELIMITER ;

CALL ejercicio2();


-- ejercicio 3
DELIMITER //

DROP PROCEDURE IF EXISTS ejemplo3//
CREATE PROCEDURE ejemplo3()
BEGIN
    -- Declaración de variables internas
    DECLARE v_caracter CHAR(10);
    DECLARE v_entero INT;
    DECLARE v_fecha DATE;

    -- Asignación de valores correctos
    SET v_caracter = 'Ejemplo';
    SET v_entero = 42;
    SET v_fecha = '2025-04-24';

    -- Mostrar resultados correctos
    SELECT v_caracter ,v_entero ,v_fecha ;

    -- Provocando errores (comentar cada línea para probar uno por uno)
    -- SET v_entero = 'Texto'; -- Error: No se puede asignar texto a una variable INT
    -- SET v_fecha = 'FechaIncorrecta'; -- Error: Formato inválido para DATE
    -- SET v_caracter = 12345; -- Error: Asignando número en CHAR sin conversión

END;
//

DELIMITER ;

CALL ejemplo3();

-- ejercicio 4 

delimiter //
drop procedure if exists ejercicio4 //
create procedure ejercicio4 (in p_valor int)
begin 
	set p_valor = p_valor *4 ;
	select p_valor ;
end ;
//
delimiter ;
call ejercicio4 (33);

-- ejercicio 5

delimiter //
drop procedure if exists ejercicio5 //
create procedure ejercicio5 (inout p_valor int)
begin
	select concat("Valor sin modificar : " , p_valor)as sinModificar;
    set p_valor = p_valor + 24 ;
    select concat("valor modificado : ", p_valor) as modificado;
    end ;
    //
delimiter ;

call ejercicio5(6);
