-- Cambiar el delimitador para permitir bloques BEGIN...END
DELIMITER //

-- Eliminar la base de datos si existe y crearla de nuevo
DROP DATABASE IF EXISTS huertos //
CREATE DATABASE huertos //
USE huertos //

-- Volver al delimitador estándar para los CREATE TABLE e INSERT
DELIMITER ;

-- Creación de las tablas

CREATE TABLE usuario (
    id_usuario INT PRIMARY KEY,
    nombre VARCHAR(50) not null,
    apellidos VARCHAR(100) not null,
    email VARCHAR(50),
    dni CHAR(9) UNIQUE NOT NULL CHECK (dni REGEXP '^[0-9]{8}[A-Z]$'),
    telefono CHAR(9) CHECK (telefono REGEXP '^[689][0-9]{8}$'),
    fecha_nacimiento DATE
);

-- datos de los usuarios: (Fechas de nacimiento + 2 años)
INSERT INTO usuario (id_usuario, nombre, apellidos, email, dni, telefono, fecha_nacimiento)
VALUES (1, 'Juan', 'García Pérez', 'juan@TBD05_CM_2324.com', '12345678A', '612345678', '1957-01-01');
INSERT INTO usuario (id_usuario, nombre, apellidos, email, dni, telefono, fecha_nacimiento)
VALUES (2, 'María', 'López Martínez', 'maria@TBD05_CM_2324.com', '87654321B', '654123789', '1956-03-15');
INSERT INTO usuario (id_usuario, nombre, apellidos, email, dni, telefono, fecha_nacimiento)
VALUES (3, 'Pedro', 'González Rodríguez', 'pedrogr@TBD05_CM_2324.com', '98765432C', '678912345', '1955-07-22');
INSERT INTO usuario (id_usuario, nombre, apellidos, email, dni, telefono, fecha_nacimiento)
VALUES (4, 'Ana', 'Sánchez García', 'anasg@TBD05_CM_2324.com', '23456789D', '698765432', '1958-09-12');
INSERT INTO usuario (id_usuario, nombre, apellidos, email, dni, telefono, fecha_nacimiento)
VALUES (5, 'David', 'Martín López', 'davidml@TBD05_CM_2324.com', '34567890E', '689123456', '1955-04-05' );
INSERT INTO usuario (id_usuario, nombre, apellidos, email, dni, telefono, fecha_nacimiento)
VALUES (6, 'Laura', 'Rodríguez Fernández', 'laurarf@TBD05_CM_2324.com', '45678901F', '612345678', '1946-12-28');
INSERT INTO usuario (id_usuario, nombre, apellidos, email, dni, telefono, fecha_nacimiento)
VALUES (7, 'Pablo', 'Pérez Gómez', 'pablopg@TBD05_CM_2324.com', '56789012G', '654123789', '1947-08-14');
INSERT INTO usuario (id_usuario, nombre, apellidos, email, dni, telefono, fecha_nacimiento)
VALUES (8, 'Sofía', 'García Martínez', 'sofiagm@TBD05_CM_2324.com', '67890123H', '678912345', '1948-10-30');
INSERT INTO usuario (id_usuario, nombre, apellidos, email, dni, telefono, fecha_nacimiento)
VALUES (9, 'Carlos', 'González Rodríguez', 'carlosgr@TBD05_CM_2324.com', '78901234J', '698765432', '1955-05-19');
INSERT INTO usuario (id_usuario, nombre, apellidos, email, dni, telefono, fecha_nacimiento)
VALUES (10, 'Elena', 'Hernández López', 'elenahl@TBD05_CM_2324.com', '89012345K', '689123456', '1956-11-25');
INSERT INTO usuario (id_usuario, nombre, apellidos, email, dni, telefono, fecha_nacimiento)
VALUES (11, 'Javier', 'Gómez Sánchez', 'javiergs@TBD05_CM_2324.com', '90123456L', '612345678', '1952-06-10');
INSERT INTO usuario (id_usuario, nombre, apellidos, email, dni, telefono, fecha_nacimiento)
VALUES (12, 'Carmen', 'Martínez Pérez', 'carmenmp@TBD05_CM_2324.com', '01234567M', '654123789', '1953-01-18');
INSERT INTO usuario (id_usuario, nombre, apellidos, email, dni, telefono, fecha_nacimiento)
VALUES (13, 'Miguel', 'López Rodríguez', 'miguellr@TBD05_CM_2324.com', '13579246N', '678912345', '1950-03-04');
INSERT INTO usuario (id_usuario, nombre, apellidos, email, dni, telefono, fecha_nacimiento)
VALUES (14, 'Lucía', 'Gómez Martínez', 'luciagm@TBD05_CM_2324.com', '24680135A', '648765432', '1956-09-27');
INSERT INTO usuario (id_usuario, nombre, apellidos, email, dni, telefono, fecha_nacimiento)
VALUES (15, 'Alejandro', 'Rodríguez Gómez', 'alejandrrgo@TBD05_CM_2324.com', '35792468A', '689123456', '1955-12-09');
INSERT INTO usuario VALUES (16, 'Antonio', 'Fernández García', 'antoniofg@TBD05_CM_2324.com', '46801359B', '612345679', '1959-02-20');
INSERT INTO usuario VALUES (17, 'Isabel', 'Díaz Martínez', 'isabeldm@TBD05_CM_2324.com', '57912468C', '654123780', '1960-04-12');
INSERT INTO usuario VALUES (18, 'Francisco', 'Gómez Sánchez', 'franciscogs@TBD05_CM_2324.com', '68023579D', '678912346', '1958-09-15');
INSERT INTO usuario VALUES (19, 'Carmen', 'Martín Rodríguez', 'carmenmr@TBD05_CM_2324.com', '79134680E', '698765433', '1960-07-03');
INSERT INTO usuario VALUES (20, 'Manuel', 'Sánchez López', 'manuelsl@TBD05_CM_2324.com', '80245791F', '689123457', '1957-11-18');
INSERT INTO usuario VALUES (21, 'Dolores', 'Pérez Martínez', 'dolorespm@TBD05_CM_2324.com', '91356802G', '612345679', '1958-01-25');
INSERT INTO usuario VALUES (22, 'Joaquín', 'López Gómez', 'joaquinlg@TBD05_CM_2324.com', '02467913H', '654123780', '1951-03-30');
INSERT INTO usuario VALUES (23, 'Teresa', 'García Rodríguez', 'teresagr@TBD05_CM_2324.com', '13578024J', '678912346', '1957-08-14');
INSERT INTO usuario VALUES (24, 'José', 'Martínez Martín', 'josemm@TBD05_CM_2324.com', '24689135K', '698765433', '1959-05-19');
INSERT INTO usuario VALUES (25, 'María José', 'Rodríguez Pérez', 'mariajoserp@TBD05_CM_2324.com', '35790246L', '689123457', '1960-11-25');
INSERT INTO usuario VALUES (26, 'Julián', 'Sánchez Gómez', 'juliansg@TBD05_CM_2324.com', '46801357M', '612345679', '1958-06-10');
INSERT INTO usuario VALUES (27, 'Rosa', 'González Martínez', 'rosagm@TBD05_CM_2324.com', '57912468N', '654123780', '1959-01-18');
INSERT INTO usuario VALUES (28, 'Alberto', 'Martín Rodríguez', 'albertomr@TBD05_CM_2324.com', '68023579A', '678912346', '1951-03-04');
INSERT INTO usuario VALUES (29, 'Luisa', 'Fernández López', 'luisafl@TBD05_CM_2324.com', '79134680B', '698765433', '1957-09-27');
INSERT INTO usuario VALUES (30, 'Rafael', 'Gómez Pérez', 'rafaelgp@TBD05_CM_2324.com', '80245791C', '689123457', '1960-12-09');


-- hay que meter al menos 25 personas
-- meter 15 personas con parcelas 1 y 2, poner alguna parcela 1 y 2 disponible

CREATE TABLE huerto (
    id_huerto INT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    direccion VARCHAR(255),
    descripcion VARCHAR(1000),
    fecha_creacion DATETIME DEFAULT current_timestamp,
    estado VARCHAR(50) CHECK (estado IN ('activo', 'inactivo', 'mantenimiento')),
    numero_parcelas INT,
    parcelas_disponibles INT
);

-- Fechas de creación de huertos + 2 años
INSERT INTO huerto (id_huerto, nombre, direccion, descripcion, fecha_creacion, estado, numero_parcelas, parcelas_disponibles)
VALUES (1, 'Huerto de la Abuela', 'Calle Principal 123', 'huerto tradicional de la familia', '2022-05-15', 'activo', NULL, NULL);
INSERT INTO huerto (id_huerto, nombre, direccion, descripcion, fecha_creacion, estado, numero_parcelas, parcelas_disponibles)
VALUES (2, 'Huerto Ecológico', 'Avenida Central 456', 'huerto enfocado en cultivos orgánicos', '2020-10-10', 'activo', NULL, NULL);
INSERT INTO huerto (id_huerto, nombre, direccion, descripcion, fecha_creacion, estado, numero_parcelas, parcelas_disponibles)
VALUES (3, 'Huerto Comunitario', 'Plaza del Sol s/n', 'Proyecto comunitario de agricultura urbana', '2021-07-20', 'inactivo', NULL, NULL);


CREATE TABLE parcela (
    id_huerto INT,
    numero_parcela INT unsigned,
    tamano INT unsigned,
    fecha_asignacion DATETIME,
    disponible BOOLEAN DEFAULT 0,
    id_usuario_asignado INT,
    PRIMARY KEY (id_huerto, numero_parcela),
    FOREIGN KEY (id_huerto) REFERENCES huerto(id_huerto),
    FOREIGN KEY (id_usuario_asignado) REFERENCES usuario(id_usuario)
);

-- esto indica que un usuario no puede estar simultáneamente en dos parcelas distintas de algún huerto.
ALTER TABLE parcela
ADD CONSTRAINT unique_id_usuario UNIQUE (id_usuario_asignado);

-- Fechas de asignación de parcelas + 2 años (NULL se mantiene NULL)
INSERT INTO parcela VALUES (1, 1, 15, '2022-07-01', 0, 1);
INSERT INTO parcela VALUES (1, 2, 20, '2022-07-01', 0, 7);
INSERT INTO parcela VALUES (1, 3, 25, NULL, 1, NULL);
INSERT INTO parcela VALUES (1, 4, 18, '2022-07-01', 0, 20);
INSERT INTO parcela VALUES (1, 5, 22, '2022-08-01', 0, 22);
INSERT INTO parcela VALUES (1, 6, 28, '2022-07-01', 0, 18);
INSERT INTO parcela VALUES (1, 7, 30, '2022-07-15', 0, 8);
INSERT INTO parcela VALUES (1, 8, 12, '2022-07-01', 0, 3);
INSERT INTO parcela VALUES (1, 9, 14, '2022-07-01', 0, 11);
INSERT INTO parcela VALUES (1, 10, 26, NULL, 1, NULL);

-- Para el huerto 2 (Fechas de asignación + 2 años)
INSERT INTO parcela (id_huerto, numero_parcela, tamano, fecha_asignacion, disponible, id_usuario_asignado)
VALUES
(2, 1, 30, NULL, 1, NULL);
INSERT INTO parcela VALUES (2, 2, 16, '2025-01-10', 0, 16);
INSERT INTO parcela VALUES (2, 3, 18, NULL, 1, NULL);
INSERT INTO parcela VALUES (2, 4, 25, '2021-10-15', 1, 21);
INSERT INTO parcela VALUES (2, 5, 21, '2021-10-15', 1, 25);
INSERT INTO parcela VALUES (2, 6, 28, NULL, 1, NULL);
INSERT INTO parcela VALUES (2, 7, 14, '2024-11-15', 0, 14);
INSERT INTO parcela VALUES (2, 8, 12, NULL, 1, NULL);

-- Para el huerto 3 (Fechas de asignación + 2 años - todas NULL)
INSERT INTO parcela (id_huerto, numero_parcela, tamano, fecha_asignacion, disponible, id_usuario_asignado)
VALUES (3, 1, 18, NULL, 0, NULL);
INSERT INTO parcela VALUES (3, 2, 22, NULL, 0, NULL);
INSERT INTO parcela VALUES (3, 3, 30, NULL, 0, NULL);
INSERT INTO parcela VALUES (3, 4, 24, NULL, 0, NULL);
INSERT INTO parcela VALUES (3, 5, 26, NULL, 0, NULL);
INSERT INTO parcela VALUES (3, 6, 15, NULL, 0, NULL);
INSERT INTO parcela VALUES (3, 7, 20, NULL, 0, NULL);
INSERT INTO parcela VALUES (3, 8, 16, NULL, 0, NULL);
INSERT INTO parcela VALUES (3, 9, 28, NULL, 0, NULL);
INSERT INTO parcela VALUES (3, 10, 12, NULL, 0, NULL);
INSERT INTO parcela VALUES (3, 11, 14, NULL, 0, NULL);
INSERT INTO parcela VALUES (3, 12, 27, NULL, 0, NULL);


CREATE TABLE historico_usuario (
    id_historico INT AUTO_INCREMENT PRIMARY KEY,
    id_usuario INT,
    id_huerto INT,
    numero_parcela INT unsigned,
    fecha_asignacion DATETIME,
    fecha_salida DATETIME,
    FOREIGN KEY (id_usuario) REFERENCES usuario(id_usuario),
    FOREIGN KEY (id_huerto, numero_parcela) REFERENCES parcela(id_huerto, numero_parcela)
);

-- Inserciones en historico_usuario. Fechas de asignacion y salida + 2 años.
INSERT INTO historico_usuario (id_usuario, id_huerto, numero_parcela, fecha_asignacion, fecha_salida) VALUES (12, 2, 4, '2020-11-01', '2021-10-01');
INSERT INTO historico_usuario (id_usuario, id_huerto, numero_parcela, fecha_asignacion, fecha_salida) VALUES (15, 2, 5, '2020-11-01', '2021-10-01');
INSERT INTO historico_usuario (id_usuario, id_huerto, numero_parcela, fecha_asignacion, fecha_salida) VALUES (14, 2, 2, '2020-11-01', '2022-01-10');
INSERT INTO historico_usuario (id_usuario, id_huerto, numero_parcela, fecha_asignacion, fecha_salida) VALUES (17, 2, 6, '2020-11-01', '2023-09-15');
INSERT INTO historico_usuario (id_usuario, id_huerto, numero_parcela, fecha_asignacion, fecha_salida) VALUES (16, 2, 7, '2020-11-01', '2024-11-01');
INSERT INTO historico_usuario (id_usuario, id_huerto, numero_parcela, fecha_asignacion, fecha_salida) VALUES (19, 2, 8, '2020-11-01', '2024-11-01');
INSERT INTO historico_usuario (id_usuario, id_huerto, numero_parcela, fecha_asignacion, fecha_salida) VALUES (10, 2, 3, '2020-11-01', '2024-11-01');
INSERT INTO historico_usuario (id_usuario, id_huerto, numero_parcela, fecha_asignacion, fecha_salida) VALUES (2, 2, 1, '2020-11-01', '2024-11-01');
INSERT INTO historico_usuario (id_usuario, id_huerto, numero_parcela, fecha_asignacion, fecha_salida) VALUES (23, 2, 2, '2022-01-15', '2024-01-15');
INSERT INTO historico_usuario (id_usuario, id_huerto, numero_parcela, fecha_asignacion, fecha_salida) VALUES (6, 1, 10, '2022-06-01', '2023-06-01');
INSERT INTO historico_usuario (id_usuario, id_huerto, numero_parcela, fecha_asignacion, fecha_salida) VALUES (5, 1, 3, '2022-06-01', '2023-08-15');