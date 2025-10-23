-- Script de Creación de Base de Datos y Datos

-- 1. Eliminar la base de datos si ya existe para empezar desde cero
DROP DATABASE IF EXISTS aventura;

-- 2. Crear la base de datos
CREATE DATABASE aventura;

-- 3. Usar la base de datos recién creada
USE aventura;

-- 4. Crear la tabla Razas
CREATE TABLE razas (
    id_raza INT AUTO_INCREMENT PRIMARY KEY,
    nombre_raza VARCHAR(50) UNIQUE NOT NULL,
    descripcion TEXT,
    atributo_base VARCHAR(50) -- Ej: "Fuerza", "Inteligencia"
);

-- 5. Crear la tabla Profesiones
CREATE TABLE profesiones (
    id_profesion INT AUTO_INCREMENT PRIMARY KEY,
    nombre_profesion VARCHAR(50) UNIQUE NOT NULL,
    rol VARCHAR(50) not null, -- Ej: "DPS", "Sanador", "Tanque", "Soporte"
    descripcion TEXT
);

-- 6. Crear la tabla Equipos
CREATE TABLE equipos (
    id_equipo INT AUTO_INCREMENT PRIMARY KEY,
    nombre_equipo VARCHAR(100) UNIQUE NOT NULL,
    fecha_creacion datetime default now(),
    sede VARCHAR(100),
    miembros_actuales INT DEFAULT 0 -- Campo para el conteo (actualizado por triggers)
);

-- 7. Crear la tabla Personajes
CREATE TABLE personajes (
    id_personaje INT AUTO_INCREMENT PRIMARY KEY,
    nombre_personaje VARCHAR(100) UNIQUE NOT NULL,
    nivel INT DEFAULT 1 CHECK (nivel >= 1),
    salud_actual INT default 0,
    salud_maxima INT default 0,
    experiencia INT DEFAULT 0,
    id_raza INT NOT NULL,
    id_profesion INT NOT NULL,
    id_equipo INT NULL, -- Puede ser NULL si el personaje no está en un equipo

    FOREIGN KEY (id_raza) REFERENCES razas(id_raza) ON DELETE RESTRICT,
    FOREIGN KEY (id_profesion) REFERENCES profesiones(id_profesion) ON DELETE RESTRICT,
    FOREIGN KEY (id_equipo) REFERENCES equipos(id_equipo) ON DELETE SET NULL -- Si un equipo es eliminado, los personajes se quedan sin equipo
);

-- 8. Crear la tabla Historial_Equipo
CREATE TABLE historial_equipo (
    id_historial INT AUTO_INCREMENT PRIMARY KEY,
    id_personaje INT NOT NULL,
    id_equipo_anterior INT NULL,
    id_equipo_nuevo INT NULL,
    fecha_cambio TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    tipo_cambio ENUM('ingreso','abandono','transferencia'), 

    FOREIGN KEY (id_personaje) REFERENCES personajes(id_personaje) ON DELETE CASCADE, -- Si el personaje se elimina, su historial también
    FOREIGN KEY (id_equipo_anterior) REFERENCES equipos(id_equipo) ON DELETE SET NULL,
    FOREIGN KEY (id_equipo_nuevo) REFERENCES equipos(id_equipo) ON DELETE SET NULL
);

-- 9. Insertar Datos en Razas
INSERT INTO razas (nombre_raza, descripcion, atributo_base) VALUES
('Humano', 'La raza más adaptable y extendida.', 'Versatilidad'),
('Elfo', 'Elegantes y longevos, con afinidad por la magia y la naturaleza.', 'Destreza'),
('Enano', 'Fuertes y resilientes, maestros de la artesanía y la minería.', 'Constitución'),
('Orco', 'Poderosos y feroces guerreros.', 'Fuerza'),
('Gnomo', 'Pequeños e ingeniosos, expertos en tecnología arcana e ilusiones.', 'Inteligencia'),
('Goblin', 'Pequeños, astutos y numerosos.', 'Agilidad'),
('No Muerto', 'Seres reanimados con resistencia a la muerte.', 'Resistencia Necrótica'),
('Draconido', 'Descendientes de dragones, con aliento elemental.', 'Carisma');

-- 10. Insertar Datos en Profesiones
INSERT INTO profesiones (nombre_profesion, rol, descripcion) VALUES
('Guerrero', 'DPS/Tanque', 'Maestros del combate físico.'),
('Mago', 'DPS/Control', 'Canalizadores de energía arcana.'),
('Pícaro', 'DPS/Utilidad', 'Expertos en sigilo y engaño.'),
('Clérigo', 'Sanador/Soporte', 'Servidores de deidades, canalizan energía divina.'),
('Guardabosques', 'DPS/Utilidad', 'Conocedores de la naturaleza y la caza.'),
('Bardo', 'Soporte/DPS', 'Músicos y contadores de historias que inspiran aliados.'),
('Druida', 'Sanador/DPS/Tanque', 'Protectores de la naturaleza, cambian de forma.'),
('Paladín', 'Tanque/DPS/Sanador', 'Guerreros sagrados con juramentos divinos.');

-- 11. Insertar Datos en Equipos (Inicialmente con 0 miembros_actuales)
INSERT INTO equipos (nombre_equipo, fecha_creacion, sede) VALUES
('Las Espadas Obsidianas', '2021-01-15', 'Fuerte Roca Negra'),
('Aurora Plateada', '2022-03-20', 'Torre de Cristal'),
('Puño Carmesí', '2021-11-10', 'Arena de Sangre'),
('Vientos Susurrantes', '2023-07-01', 'Bosque Ancestral'),
('Legión de Hierro', '2020-05-05', 'Forja Subterránea'),
('Círculo Esmeralda', '2022-09-18', 'Oasis Secreto');

-- 12. Insertar Datos en Personajes (Distribuyendo razas, profesiones y asignando a algunos equipos)
INSERT INTO personajes (nombre_personaje, nivel, salud_actual, salud_maxima, experiencia, id_raza, id_profesion, id_equipo) VALUES
-- Personajes sin equipo (Equipo = NULL) - Total 8
('Borin Stonebeard', 7, 140, 150, 8200, 3, 1, NULL), -- Guerrero
('Grog Bloodfist', 4, 110, 107, 3100, 4, 1, NULL),  -- Guerrero
('Fipwick Sparklefingers', 5, 70, 70, 4800, 5, 2, NULL), -- Mago
('Ignis Flamebreath', 5, 100, 110, 5300, 8, 1, NULL),-- Guerrero
('Tixie Boltspinner', 4, 64, 68, 3700, 5, 2, NULL), -- Mago
('Snag Tooth', 3, 40, 80, 2700, 6, 3, NULL), -- Pícaro
('Father Thomas', 6, 90, 92, 7200, 1, 4, NULL),  -- Clérigo
('Thundar Forgeborn', 7, 142, 162, 9000, 3, 1, NULL),-- Guerrero

-- EQUIPO 1 (5 miembros): Guerrero, Mago, Pícaro, Clérigo, Paladín
('Aethelred', 5, 60, 120, 4500, 1, 1, 1),    -- Guerrero
('Lysandra', 6, 80, 90, 6100, 2, 2, 1),     -- Mago
('Zorg Grimfang', 3, 30, 90, 2500, 6, 3, 1),   -- Pícaro
('Elara Meadowlight', 6, 75, 85, 6800, 2, 4, 1), -- Clérigo
('Kaelen Sunstrider', 7, 110, 140, 8500, 1, 8, 1),-- Paladín

-- EQUIPO 2 (5 miembros): Bardo, Guerrero, Guardabosques, Druida, Mago
('Seraphina Moonwhisper', 4, 70, 75, 3900, 2, 6, 2),-- Bardo
('Torvin Hammerfall', 7, 160, 160, 8800, 3, 1, 2),-- Guerrero
('Jara Windwalker', 5, 80, 80, 5200, 8, 5, 2), -- Guardabosques
('Bram Earthcaller', 6, 111, 130, 6900, 3, 7, 2),-- Druida
('Vexia Blackheart', 6, 100, 100, 6700, 7, 2, 2),-- Mago

-- EQUIPO 3 (5 miembros): Guardabosques, Paladín, Guerrero, Pícaro, Clérigo
('Lyra Swiftarrow', 5, 80, 80, 5100, 2, 5, 3), -- Guardabosques
('Sir Gideon', 7, 140, 145, 8600, 1, 8, 3),   -- Paladín
('Grimnak Skullcrusher', 5, 110, 120, 4900, 4, 1, 3),-- Guerrero
('Morthos Shadowblade', 6, 90, 95, 6500, 7, 3, 3),-- Pícaro
('Sister Anya', 6, 30, 90, 7100, 1, 4, 3), -- Clérigo

-- EQUIPO 4 (4 miembros): Guerrero, Pícaro, Mago, Bardo
('Roric Bronzehand', 7, 145, 155, 8900, 3, 1, 4),-- Guerrero
('Skitter Quickfoot', 3, 15, 85, 2800, 6, 3, 4),-- Pícaro
('Fizzwick Gearloose', 4, 15, 65, 3800, 5, 2, 4),-- Mago
('Zephyr Breeze', 5, 70, 78, 5000, 2, 6, 4), -- Bardo

-- EQUIPO 5 (3 miembros): Druida, Guerrero, Guardabosques
('Leaf Whisperer', 6, 12, 125, 7000, 2, 7, 5), -- Druida
('Krush Guttripper', 5, 110, 115, 4700, 4, 1, 5),-- Guerrero
('Fenris Blackwood', 5, 90, 100, 5500, 1, 5, 5);-- Guardabosques

-- Equipo 6 tiene 0 miembros. No hay personajes con id_equipo = 6 en esta lista.


-- 13. Insertar algunos datos de historial inicial (opcional, los triggers añadirán más)
-- Estos podrían representar que se unieron a su equipo actual
INSERT INTO historial_equipo (id_personaje, id_equipo_anterior, id_equipo_nuevo, tipo_cambio, fecha_cambio) VALUES
(9, NULL, 1, 'ingreso', '2025-02-01 10:00:00'), 
(14, NULL, 2, 'ingreso', '2025-02-01 10:05:00'), 
(30, NULL, 5, 'ingreso', '2025-02-01 10:10:00'); 


-- 14. Actualizar el campo miembros_actuales inicial con un COUNT
-- Normalmente los triggers harían esto al insertar, pero si se insertan datos directamente,
-- podrías querer ejecutar esto una vez. Sin embargo, los triggers que crearemos
-- manejarán los cambios futuros.
set sql_safe_updates=0;
UPDATE equipos e
SET miembros_actuales = (SELECT COUNT(*) FROM personajes p WHERE p.id_equipo = e.id_equipo);
set sql_safe_updates=1;
