/*Base de Datos Galerías de Arte © 2025 by Pepe Lluyot is licensed under CC BY-NC-ND 4.0 */

-- Crear base de datos y seleccionar
DROP DATABASE IF EXISTS galeria_arte;
CREATE DATABASE galeria_arte;
USE galeria_arte;

-- Crear tabla de artistas
CREATE TABLE artistas (
    artista_id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(150) NOT NULL,
    nacionalidad VARCHAR(100),
    fecha_nacimiento DATE,
    estilo ENUM('Abstracto', 'Surrealista', 'Minimalista', 'Pop Art', 'Realismo', 'Otro') NOT NULL
);

-- Crear tabla de obras de arte
CREATE TABLE obras_arte (
    obra_id INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(200) NOT NULL,
    artista_id INT,
    anio_creacion YEAR,
    tipo ENUM('Pintura', 'Escultura', 'Fotografía', 'Instalación', 'Dibujo', 'Otro') NOT NULL,
    precio_estimado DECIMAL(10, 2),
    FOREIGN KEY (artista_id) REFERENCES artistas(artista_id)
);

-- Crear tabla de exposiciones
CREATE TABLE exposiciones (
    exposicion_id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(200) NOT NULL,
    fecha_inicio DATE NOT NULL,
    fecha_fin DATE,
    ubicacion VARCHAR(200) NOT NULL
);

-- Crear tabla intermedia para obras en exposiciones
CREATE TABLE obras_exposiciones (
    obra_id INT,
    exposicion_id INT,
    PRIMARY KEY (obra_id, exposicion_id),
    FOREIGN KEY (obra_id) REFERENCES obras_arte(obra_id),
    FOREIGN KEY (exposicion_id) REFERENCES exposiciones(exposicion_id)
);

-- Insertar datos en la tabla de artistas
INSERT INTO artistas (nombre, nacionalidad, fecha_nacimiento, estilo) VALUES
('Pablo Picasso', 'Española', '1881-10-25', 'Abstracto'),
('Salvador Dalí', 'Española', '1904-05-11', 'Surrealista'),
('Frida Kahlo', 'Mexicana', '1907-07-06', 'Realismo'),
('Andy Warhol', 'Estadounidense', '1928-08-06', 'Pop Art'),
('Agnes Martin', 'Canadiense', '1912-03-22', 'Minimalista'),
('Joan Miró', 'Española', '1893-04-20', 'Surrealista'),
('Jackson Pollock', 'Estadounidense', '1912-01-28', 'Abstracto'),
('Georgia O\'Keeffe', 'Estadounidense', '1887-11-15', 'Realismo');

-- Insertar datos en la tabla de obras de arte
INSERT INTO obras_arte (titulo, artista_id, anio_creacion, tipo, precio_estimado) VALUES
("Les Demoiselles d'Avignon", 1, 1907, "Pintura", 1200000.00),
("La persistencia de la memoria", 2, 1931, "Pintura", 1800000.00),
("Autorretrato con collar de espinas", 3, 1940, "Pintura", 850000.00),
("Marilyn Diptych", 4, 1962, "Pintura", 2000000.00),
("Untitled #3", 5, 1960, "Pintura", 700000.00),
("Guernica", 1, 1937, "Pintura", 1500000.00),
("El gran masturbador", 2, 1929, "Pintura", 1100000.00),
("La columna rota", 3, 1944, "Pintura", 900000.00),
("Campbell's Soup Cans", 4, 1962, "Pintura", 2200000.00),
("White Stone", 5, 1963, "Escultura", 750000.00),
("Weeping Woman", 1, 1937, "Pintura", 1300000.00),
("Destino", 2, 1946, "Otro", 950000.00),
("Las dos Fridas", 3, 1939, "Pintura", 1250000.00),
("Silver Car Crash (Double Disaster)", 4, 1963, "Pintura", 2500000.00),
("Homage to the Square", 5, 1950, "Pintura", 800000.00),
("Girl Before a Mirror", 1, 1932, "Pintura", 1400000.00),
("The Elephants", 2, 1948, "Pintura", 1150000.00),
("Henry Ford Hospital", 3, 1932, "Pintura", 850000.00),
("Orange Car Crash Fourteen Times", 4, 1963, "Pintura", 2300000.00),
("Night Sea", 5, 1965, "Pintura", 720000.00),
("The Old Guitarist", 1, 1903, "Pintura", 1250000.00),
("Galatea of the Spheres", 2, 1952, "Pintura", 950000.00),
("What the Water Gave Me", 3, 1938, "Pintura", 900000.00),
("Eight Elvises", 4, 1963, "Pintura", 2800000.00),
("Lying Figure", 5, 1966, "Escultura", 700000.00),
("Woman with a Book", 1, 1932, "Pintura", 1350000.00),
("Dream Caused by the Flight of a Bee", 2, 1944, "Pintura", 1050000.00),
("Self-Portrait with Monkey", 3, 1940, "Pintura", 870000.00),
("Brillo Soap Pads Box", 4, 1964, "Instalación", 2100000.00),
("Falling Blue", 5, 1967, "Pintura", 770000.00),
("The Weeping Woman", 1, 1937, "Pintura", 1400000.00),
("Melting Clocks", 2, 1931, "Pintura", 1900000.00),
("Roots", 3, 1943, "Pintura", 880000.00),
("Diamond Dust Shoes", 4, 1980, "Pintura", 3000000.00),
("White Wedges", 5, 1969, "Escultura", 750000.00),
("Harlequin's Carnival", 6, 1924, "Pintura", 1200000.00),
("Blue II", 6, 1961, "Pintura", 1500000.00),
("Convergence", 7, 1952, "Pintura", 1800000.00),
("Mural", 7, 1943, "Pintura", 2200000.00),
("Ram's Head White Hollyhock and Little Hills", 8, 1935, "Pintura", 950000.00),
("Black Iris III", 8, 1926, "Pintura", 1200000.00);
-- Insertar obras sin artistas asociadas
INSERT INTO obras_arte (titulo, artista_id, anio_creacion, tipo, precio_estimado) VALUES
('El espejo roto', NULL, 2005, 'Pintura', 800000.00),
('Reflejos en el agua', NULL, 2010, 'Fotografía', 1200000.00),
('Fragmentos de un sueño', NULL, 2017, 'Escultura', 950000.00),
('Viento en movimiento', NULL, 2020, 'Instalación', 1500000.00),
('Cuerpos de luz', NULL, 2015, 'Dibujo', 600000.00);

-- Insertar datos en la tabla de exposiciones
INSERT INTO exposiciones (nombre, fecha_inicio, fecha_fin, ubicacion) VALUES
('Surrealismo y más allá', '2023-01-15', '2023-03-30', 'Museo de Arte Moderno, Nueva York'),
('La magia del color', '2023-06-01', '2023-09-15', 'Museo Nacional de Bellas Artes, Ciudad de México'),
('Minimalismo contemporáneo', '2024-02-01', '2024-05-30', 'Centro Pompidou, París');

-- Insertar datos en la tabla intermedia obras_exposiciones
INSERT INTO obras_exposiciones (obra_id, exposicion_id) VALUES
(1, 1),
(6, 1),
(11, 1),
(16, 1),
(21, 1),
(2, 1),
(7, 1),
(12, 1),
(17, 1),
(22, 1),
(3, 2),
(8, 2),
(13, 2),
(18, 2),
(23, 2),
(4, 2),
(9, 2),
(14, 2),
(19, 2),
(24, 2),
(5, 3),
(10, 3),
(15, 3),
(20, 3),
(25, 3),
(30, 3),
(35, 3),
(40, 3),
(40, 1),
(3, 1),
(8, 1),
(20, 1),
(30, 1),
(15, 1),
(1, 2),
(2, 2),
(22, 2),
(6, 3),
(9, 3),
(12, 3);