/* script creado por P.Lluyot - 2025
Prueba presencial - IES Cristóbal de Monroy*/

drop database if exists BD04subastas;
create database BD04subastas;
use BD04subastas;

CREATE TABLE vendedor (
    id_vendedor INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(30) NOT NULL,
    apellidos VARCHAR(50) NOT NULL,
    fecha_nacimiento DATE NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    telefono CHAR(9) NULL
);

CREATE TABLE pujador (
    id_pujador INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(30) NOT NULL,
    apellidos VARCHAR(50) NOT NULL,
    fecha_nacimiento DATE NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    categoria ENUM('A', 'B', 'C') NOT NULL DEFAULT 'C',
    telefono CHAR(9) NULL,
    notas TEXT NULL
);

CREATE TABLE objeto (
    id_objeto INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    descripcion TEXT,
    precio_inicial DECIMAL(10,2) NOT NULL CHECK (precio_inicial >= 0),
    id_vendedor INT,
    FOREIGN KEY (id_vendedor) REFERENCES vendedor(id_vendedor)
);

CREATE TABLE subasta (
    id_subasta INT AUTO_INCREMENT PRIMARY KEY,
    id_objeto INT UNIQUE NOT NULL, -- Cada objeto solo puede estar en una subasta activa
    fecha_inicio DATETIME NOT NULL,
    fecha_fin DATETIME NOT NULL,
    precio_actual DECIMAL(10,2) NOT NULL CHECK (precio_actual >= 0),
    id_ganador INT NULL, -- Se asignará cuando termine la subasta
    FOREIGN KEY (id_objeto) REFERENCES objeto(id_objeto) ON DELETE CASCADE,
    FOREIGN KEY (id_ganador) REFERENCES pujador(id_pujador) ON DELETE SET NULL
);

CREATE TABLE puja (
    id_puja INT AUTO_INCREMENT PRIMARY KEY,
    id_subasta INT NOT NULL,
    id_pujador INT NOT NULL,
    cantidad DECIMAL(10,2) NOT NULL CHECK (cantidad > 0),
    fecha_puja DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (id_subasta) REFERENCES subasta(id_subasta) ON DELETE CASCADE,
    FOREIGN KEY (id_pujador) REFERENCES pujador(id_pujador) ON DELETE CASCADE
);

INSERT INTO vendedor (nombre, apellidos, fecha_nacimiento, email, telefono) VALUES
('Juan', 'Pérez García', '1985-07-12', 'juan.perez@example.com', '600123456'),
('María', 'López Fernández', '1990-03-25', 'maria.lopez@example.com', NULL),
('Carlos', 'Gómez Ruiz', '1982-11-08', 'carlos.gomez@example.com', '622654321'),
('Ana', 'Sánchez Martín', '1995-09-17', 'ana.sanchez@example.com', NULL),
('Pedro', 'Fernández López', '1988-05-30', 'pedro.fernandez@example.com', '644789654'),
('Laura', 'Díaz Pérez', '1992-01-14', 'laura.diaz@example.com', '655456789'),
('David', 'Martínez Gómez', '1987-06-22', 'david.martinez@example.com', NULL),
('Sofía', 'Jiménez Herrera', '1993-10-05', 'sofia.jimenez@example.com', '677987321'),
('Javier', 'Torres Morales', '1980-04-18', 'javier.torres@example.com', NULL),
('Elena', 'Rodríguez Cano', '1991-12-29', 'elena.rodriguez@example.com', '699321654');

INSERT INTO pujador (nombre, apellidos, fecha_nacimiento, email, categoria, telefono, notas) VALUES
('Lucas', 'Navarro Sánchez', '1985-07-14', 'lucas.navarro@email.com', 'A', '654123789', 'Pujador frecuente en subastas de arte'),
('Paula', 'Mendoza Gil', '1991-03-25', 'paula.mendoza@email.com', 'C', NULL, 'Ha participado en pocas subastas'),
('Manuel', 'Rojas Ortiz', '1983-11-08', 'manuel.rojas@email.com', 'B', '622345678', NULL),
('Carmen', 'Iglesias Pardo', '1996-09-17', 'carmen.iglesias@email.com', 'A', '677890123', 'Interesada en antigüedades y relojes'),
('Alejandro', 'Moreno Alba', '1989-05-30', 'alejandro.moreno@email.com', 'C', NULL, NULL),
('Isabel', 'Ruiz Campos', '1993-01-14', 'isabel.ruiz@email.com', 'B', '699456123', 'Especializada en vinilos y discos raros'),
('Sergio', 'Cabrera León', '1987-06-22', 'sergio.cabrera@email.com', 'A', NULL, 'Pujador ocasional en eventos benéficos'),
('Marta', 'Hidalgo Peña', '1994-10-05', 'marta.hidalgo@email.com', 'C', '633987654', NULL),
('Fernando', 'Giménez Vega', '1981-04-18', 'fernando.gimenez@email.com', 'B', NULL, NULL),
('Cristina', 'Santos Fuentes', '1990-12-29', 'cristina.santos@email.com', 'A', '644332211', 'Compradora de arte contemporáneo'),
('Raúl', 'Cortés Marín', '1986-08-13', 'raul.cortes@email.com', 'C', '677112233', NULL),
('Patricia', 'Sáez Nieto', '1995-07-21', 'patricia.saez@email.com', 'B', NULL, 'Solo participa en subastas online'),
('Jorge', 'Luna Cabrera', '1982-03-11', 'jorge.luna@email.com', 'A', '611223344', 'Interesado en coleccionismo de monedas'),
('Nerea', 'Delgado Molina', '1998-02-04', 'nerea.delgado@email.com', 'C', NULL, NULL),
('Álvaro', 'Ortega Ramos', '1993-06-09', 'alvaro.ortega@email.com', 'B', '644556677', 'Participa regularmente en subastas de libros antiguos'),
('Lucía', 'Gallego Soto', '1987-09-28', 'lucia.gallego@email.com', 'A', NULL, 'Interesada en muebles de época'),
('Diego', 'Pastor Medina', '1991-10-19', 'diego.pastor@email.com', 'C', '655889900', NULL),
('Beatriz', 'Vidal Rubio', '1984-01-07', 'beatriz.vidal@email.com', 'B', NULL, 'Participante en subastas benéficas'),
('Hugo', 'Domínguez Suárez', '1997-05-14', 'hugo.dominguez@email.com', 'A', '677998877', NULL),
('Andrea', 'Flores Herrera', '1989-12-01', 'andrea.flores@email.com', 'C', NULL, 'Fanática de guitarras y accesorios musicales');

INSERT INTO objeto (nombre, descripcion, precio_inicial, id_vendedor) VALUES
('Reloj antiguo', 'Reloj de bolsillo de 1890 en excelente estado', 150.00, 1),
('Bicicleta de carrera', 'Bicicleta de carbono de gama alta', 1200.00, 2),
('Pintura al óleo', 'Cuadro original de un artista emergente', 300.00, 3),
('Colección de monedas', 'Set de monedas antiguas de diversos países', 450.00, 4),
('Cámara vintage', 'Cámara de fotos analógica de los años 70', 180.00, 5),
('Figura de colección', 'Figura edición limitada de una saga de películas', 350.00, 6),
('Guitarra clásica', 'Guitarra española de madera noble', 600.00, 7),
('Vinilo de los Beatles', 'Álbum original en vinilo de 1969', 500.00, 8),
('Reloj suizo', 'Reloj de pulsera automático de lujo', 2000.00, 2),
('Reloj de pared antiguo', 'Reloj de péndulo de madera tallada', 800.00, 5),
('Guitarra eléctrica Fender', 'Guitarra Fender Stratocaster de 1995', 1500.00, 3),
('Vinilo de Queen', 'Edición especial del álbum A Night at the Opera', 700.00, 1),
('Escultura en bronce', 'Estatua pequeña de bronce con firma del autor', 900.00, 4),
('Cámara Polaroid', 'Modelo clásico de Polaroid en perfecto estado', 250.00, 1),
('Libro antiguo', 'Edición de colección de Don Quijote de la Mancha', 400.00, 8),
('Juego de ajedrez', 'Ajedrez artesanal con piezas de mármol', 550.00, 7);

INSERT INTO subasta (id_objeto, fecha_inicio, fecha_fin, precio_actual, id_ganador) VALUES
(1, '2024-01-10 10:00:00', '2024-01-15 18:00:00', 250.00, 10), 
(2, '2024-02-01 09:00:00', '2024-02-10 20:00:00', 1400.00, 12), 
(3, '2024-02-05 14:00:00', '2024-02-12 18:00:00', 500.00, 8), 
(4, '2025-02-08 08:00:00', '2025-03-20 22:00:00', 600.00, NULL), 
(5, '2025-02-10 12:00:00', '2025-03-18 19:00:00', 350.00, NULL), 
(6, '2025-01-15 10:00:00', '2025-03-01 17:00:00', 500.00, NULL), 
(7, '2025-03-01 10:00:00', '2025-03-10 21:00:00', 0, NULL), 
(8, '2025-03-05 09:00:00', '2025-03-15 23:00:00', 0, NULL), 
(10, '2025-02-01 10:00:00', '2025-03-05 18:00:00', 850.00, NULL), 
(12, '2025-01-25 12:00:00', '2025-02-03 20:00:00', 900.00, 5), 
(13, '2025-01-20 14:00:00', '2025-02-01 17:00:00', 950.00, 8); 

INSERT INTO puja (id_subasta, id_pujador, cantidad, fecha_puja) VALUES
(1, 3, 160.00, '2024-01-11 18:00:10'),
(1, 5, 180.00, '2024-01-11 18:30:10'),
(1, 7, 200.00, '2024-01-12 12:10:30'),
(1, 5, 220.00, '2024-01-14 16:34:24'),
(1, 10, 250.00, '2024-01-15 17:00:20'),
(2, 12, 1250.00, '2024-02-02 18:10:20'),
(2, 15, 1300.00, '2024-02-02 19:15:20'),
(2, 18, 1350.00, '2024-02-05 20:10:06'),
(2, 15, 1370.00, '2024-02-05 20:15:20'),
(2, 12, 1400.00, '2024-02-10 10:05:55'),
(3, 8, 350.00, '2024-02-05 22:15:25'),
(3, 9, 400.00, '2024-02-08 10:04:15'),
(3, 8, 450.00, '2024-02-10 23:32:11'),
(3, 9, 400.00, '2024-02-10 23:54:15'),
(3, 8, 500.00, '2024-02-11 10:15:55'),
(4, 2, 500.00 , '2025-02-09 10:15:55'),
(4, 11, 550.00 , '2025-02-09 11:18:21'),
(4, 17, 600.00 , '2025-02-09 12:25:05'),
(5, 3, 200.00, '2025-02-10 13:25:05'),
(5, 14, 250.00, '2025-02-10 14:01:54'),
(5, 19, 350.00 , '2025-02-10 15:45:01'),
(6, 1, 400.00 , '2025-01-20 05:49:15'),
(6, 16, 450.00, '2025-01-21 08:36:22'),
(6, 20, 500.00, '2025-02-01 11:25:34'),
(9, 3, 850.00, '2025-02-05 18:05:10'), 
(10, 5, 900.00, '2025-02-01 12:00:00'), 
(11, 8, 950.00, '2025-01-30 12:10:00'); 
