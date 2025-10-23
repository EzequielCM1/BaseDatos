-- 1
CREATE USER 'ejemplosbd06'@'localhost' IDENTIFIED BY 'java9091';
GRANT ALL PRIVILEGES ON *.* TO 'ejemplosbd06'@'localhost' WITH GRANT OPTION;
FLUSH PRIVILEGES;

-- 2
SELECT 'esto es un ejemplo de bloque' AS mensaje;

-- 3
DELIMITER //
BEGIN
  DECLARE ventero INT DEFAULT 1;
  DECLARE vtexto VARCHAR(10) DEFAULT NULL;
  DECLARE ndecimal DECIMAL(4,2) DEFAULT 2.50;

  SET ventero = ventero + 5;
  SET vtexto = 'hola';
  SET ndecimal = ndecimal * ventero;

  SELECT
    ventero AS entero,
    vtexto AS texto,
    ndecimal AS decimal_resultado;
END;
//
DELIMITER ;

-- 4
DELIMITER //
BEGIN
  DECLARE v_letra CHAR(1) DEFAULT 'a';
  DECLARE v_numero INT DEFAULT 10;
  DECLARE v_fecha DATE DEFAULT CURDATE();

  SET v_letra = 'z';
  SET v_numero = v_numero + 5;
  SET v_fecha = DATE_ADD(v_fecha, INTERVAL 1 DAY);

  SELECT
    v_letra AS letra,
    v_numero AS numero,
    v_fecha AS fecha;

  -- Errores para probar (descomentar uno a la vez):
  -- SET v_letra = 'texto';
  -- SET v_numero = 'hola';
  -- SET v_fecha = 'no es fecha';
END;
//
DELIMITER ;

-- 5
DELIMITER //
CREATE PROCEDURE ejemplo4 (IN v_entrada INT)
BEGIN
  SET v_entrada = v_entrada + 10;
  SELECT v_entrada AS resultado;
END;
//
DELIMITER ;

-- 6
DELIMITER //
CREATE PROCEDURE ejemplo5 (INOUT v_entrada INT)
BEGIN
  SELECT v_entrada AS valor_inicial;
  SET v_entrada = v_entrada + 10;
  SELECT v_entrada AS valor_modificado;
END;
//
DELIMITER ;

-- 7
CREATE TABLE usuario (
  id INT AUTO_INCREMENT PRIMARY KEY,
  usuario VARCHAR(50) NOT NULL,
  contraseña VARCHAR(100) NOT NULL
);

-- 8
DELIMITER //
CREATE PROCEDURE ejemplo6_sp (IN v_usuario VARCHAR(50), IN v_contraseña VARCHAR(100))
BEGIN
  SELECT v_usuario AS usuario_inicial,
         v_contraseña AS contraseña_inicial;

  INSERT INTO usuario (usuario, contraseña)
    VALUES (v_usuario, v_contraseña);

  SELECT 'usuario insertado con éxito' AS mensaje;

  SET v_usuario = 'nuevo_usuario';
  SET v_contraseña = 'nuevo_password';

  SELECT v_usuario AS usuario_modificado,
         v_contraseña AS contraseña_modificada;
END;
//
DELIMITER ;

-- 9
DELIMITER //
CREATE PROCEDURE ejemplo7_sp (IN v_usuario VARCHAR(50), OUT v_resultado VARCHAR(100))
BEGIN
  -- por defecto v_resultado es NULL
  SELECT v_resultado AS valor_inicial;

  SET v_resultado = CONCAT('usuario ', v_usuario, ' modificado');

  SELECT v_resultado AS valor_modificado;
END;
//
DELIMITER ;

-- 10
DELIMITER //
CREATE PROCEDURE ejemplo8_sp (INOUT v_valor INT)
BEGIN
  SELECT v_valor AS valor_inicial;
  SET v_valor = v_valor + 10;
  SELECT v_valor AS valor_modificado;
END;
//
DELIMITER ;

-- 11
DELIMITER //
CREATE PROCEDURE ejemplo9_sp (IN v_usuario VARCHAR(50))
BEGIN
  IF EXISTS (SELECT 1 FROM usuario WHERE usuario = v_usuario) THEN
    SELECT CONCAT('el usuario ', v_usuario, ' existe en la base de datos.') AS mensaje;
  ELSE
    SELECT CONCAT('el usuario ', v_usuario, ' NO existe en la base de datos.') AS mensaje;
  END IF;
END;
//
DELIMITER ;