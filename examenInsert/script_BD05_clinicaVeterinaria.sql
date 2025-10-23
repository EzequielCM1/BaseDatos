-- Crear la base de datos
drop database if exists clinica_veterinaria; 
CREATE DATABASE clinica_veterinaria;
USE clinica_veterinaria;

-- Tabla de propietarios
CREATE TABLE propietario (
    id_propietario INT AUTO_INCREMENT PRIMARY KEY,
    dni char(9) NOT NULL UNIQUE,
    nombre VARCHAR(25) NOT NULL,
    apellidos VARCHAR(50) NOT NULL,
     direccion VARCHAR(100) NOT NULL,
     poblacion varchar(100),
    telefono VARCHAR(15) NULL UNIQUE
   
);
INSERT INTO propietario (dni, nombre, apellidos, direccion, poblacion, telefono) VALUES
('12345678A', 'Antonio', 'Ruiz Fernández', 'Calle Sierpes, 12', 'Sevilla', '654321987'),
('23456789B', 'María', 'López García', 'Avenida de la Constitución, 34', 'Sevilla', '689745123'),
('34567890C', 'José', 'Martín Sánchez', 'Plaza Nueva, 5', 'Dos Hermanas', '678912345'),
('45678901D', 'Carmen', 'González Pérez', 'Calle Betis, 8', 'Sevilla', '657894321'),
('56789012E', 'Manuel', 'Díaz Romero', 'Avenida Utrera, 15', 'Utrera', '632145678'),
('67890123F', 'Laura', 'Castro Muñoz', 'Calle Feria, 22', 'Sevilla', '698745236'),
('78901234G', 'Francisco', 'Ramírez Torres', 'Paseo Colón, 10', 'Carmona', '671234589'),
('89012345H', 'Elena', 'Navarro Ruiz', 'Avenida de Andalucía, 45', 'Mairena del Aljarafe', '659874123'),
('90123456I', 'Javier', 'Serrano Ortega', 'Calle San Fernando, 33', 'Écija', '624578913'),
('01234567J', 'Sara', 'Molina Rubio', 'Plaza del Salvador, 4', 'Osuna', '635478921'),
('11223344K', 'David', 'Pérez León', 'Avenida de la Paz, 18', 'San Juan de Aznalfarache', '647512389'),
('22334455L', 'Isabel', 'Romero Hidalgo', 'Calle Alfalfa, 7', 'Los Palacios y Villafranca', '612478956'),
('33445566M', 'Alejandro', 'Hernández Gutiérrez', 'Calle Amor de Dios, 27', 'La Rinconada', '679845231'),
('44556677N', 'Cristina', 'Fernández Bueno', 'Avenida del Greco, 3', 'Alcalá de Guadaíra', '689745120'),
('55667788O', 'Raúl', 'Jiménez Vargas', 'Calle Adriano, 9', 'Lebrija', '698745362'),
('66778899Q', 'Sergio', 'Martínez López', 'Calle Real, 15', 'Granada', '622334455'),
('77889900R', 'Luciana', 'García Mendoza', 'Avenida del Sol, 22', 'Málaga', '633445566');  

-- Tabla de veterinarios
CREATE TABLE veterinario (
    num_colegiado INT PRIMARY KEY,
    nombre VARCHAR(25) NOT NULL,
    apellidos VARCHAR(50) NOT NULL,
    especialidad ENUM('Perros', 'Gatos', 'Exóticos', 'General') NOT NULL,
    anyo_experiencia INT UNSIGNED NOT NULL,
    telefono VARCHAR(15) NOT NULL UNIQUE,
    clinica VARCHAR(50) NOT NULL
);
INSERT INTO veterinario (num_colegiado, nombre, apellidos, especialidad, anyo_experiencia, telefono, clinica) VALUES
(1001, 'Lucía', 'Fernández Ortega', 'Perros', 10, '667890123', 'VetSalud Sevilla'),
(1002, 'Pablo', 'Rodríguez Medina', 'Gatos', 7, '678901234', 'Animalia Sevilla'),
(1003, 'Elena', 'López Navarro', 'Exóticos', 12, '689012345', 'ExoticVet Sevilla'),
(1004, 'Manuel', 'García Ruiz', 'General', 15, '690123456', 'VetSalud Sevilla'),
(1005, 'Sara', 'Martínez Rivas', 'Perros', 8, '601234567', 'Animalia Sevilla'),
(1006, 'Javier', 'Díaz Torres', 'General', 9, '612345678', 'VetSalud Sevilla'),
(1007, 'Andrea', 'Sánchez López', 'Gatos', 6, '623456789', 'Animalia Sevilla'),
(1008, 'Raúl', 'Castro Gómez', 'Exóticos', 11, '634567890', 'ExoticVet Sevilla'),
(1009, 'Natalia', 'Hernández Ramírez', 'Perros', 14, '645678901', 'VetSalud Sevilla'),
(1010, 'Luis', 'Navarro Martín', 'General', 13, '656789012', 'Animalia Sevilla');
-- Tabla de animales
CREATE TABLE animal (
    num_id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(25) NOT NULL,
    especie ENUM('Perro', 'Gato', 'Ave', 'Reptil', 'Otro') NOT NULL,
    fec_nacimiento DATE NULL,
    sexo ENUM('Macho', 'Hembra') NOT NULL,
    num_atenciones TINYINT UNSIGNED NULL,
    peso DECIMAL(5,2) NOT NULL,
    id_propietario INT NULL,
    FOREIGN KEY (id_propietario) REFERENCES propietario(id_propietario) ON DELETE RESTRICT
);
INSERT INTO animal (nombre, especie, fec_nacimiento, sexo, peso, id_propietario) VALUES
('Rocky', 'Perro', '2018-05-10', 'Macho', 12.5, 1),
('Mia', 'Gato', '2020-08-15', 'Hembra', 3.2, 2),
('Toby', 'Perro', '2017-11-20', 'Macho', 9.8, 3),
('Luna', 'Gato', '2019-02-25', 'Hembra', 4.0, 4),
('Kiwi', 'Ave', '2021-06-05', 'Macho', 0.3, 5),
('Simba', 'Gato', '2016-09-12', 'Macho', 4.5, 6),
('Rex', 'Perro', '2022-01-30', 'Macho', 15.2, 7),
('Tortuga', 'Reptil', '2015-07-18', 'Hembra', 2.1, 8),
('Bobby', 'Perro', '2019-04-10', 'Macho', 10.5, 9),
('Nala', 'Gato', '2020-12-07', 'Hembra', 3.9, 10),
('Max', 'Perro', '2018-11-15', 'Macho', 11.7, 11),
('Loki', 'Gato', '2019-07-22', 'Macho', 3.5, 12),
('Bella', 'Perro', '2021-02-10', 'Hembra', 14.0, 13),
('Bobby', 'Ave', '2020-09-30', 'Macho', 0.4, 14),
('Daisy', 'Perro', '2017-04-18', 'Hembra', 8.9, 15),
('Tommy', 'Gato', '2018-06-22', 'Macho', 4.1, 1),
('Luna', 'Perro', '2019-12-10', 'Hembra', 12.2, 2),
('Pancho', 'Reptil', '2016-03-14', 'Macho', 1.8, 3),
('Milo', 'Gato', '2019-10-30', 'Macho', 4.3, 4),
('Chispa', 'Perro', '2021-05-05', 'Hembra', 9.5, 5),
('Zeus', 'Perro', '2020-04-15', 'Macho', 20.5, NULL),  
('Miaow', 'Gato', '2021-11-20', 'Hembra', 4.2, NULL),  
('Coco', 'Ave', '2022-06-10', 'Macho', 0.8, NULL); 

-- Tabla intermedia de atención veterinaria
CREATE TABLE atiende (
	id_atencion INT AUTO_INCREMENT PRIMARY KEY,
    num_colegiado INT NULL,
    num_id INT,
    fecha_atencion DATETIME NOT NULL,
    diagnostico TEXT NULL,
    tratamiento TEXT NULL,
    UNIQUE (num_colegiado, num_id, fecha_atencion),
    FOREIGN KEY (num_colegiado) REFERENCES veterinario(num_colegiado) ON DELETE SET NULL,
    FOREIGN KEY (num_id) REFERENCES animal(num_id) ON DELETE CASCADE
);
INSERT INTO atiende (num_colegiado, num_id, fecha_atencion, diagnostico, tratamiento) VALUES
(1001, 1, '2024-01-10 10:00:00', 'Vacunación anual', 'Vacuna polivalente'),
(1002, 2, '2024-01-15 11:30:00', 'Infección ocular', 'Colirio antibiótico'),
(1003, 5, '2024-02-05 09:45:00', 'Desnutrición', 'Suplemento vitamínico'),
(1004, 3, '2024-02-20 16:15:30', 'Otitis', 'Antibiótico y limpieza de oídos'),
(1005, 4, '2024-03-10 14:30:00', 'Fractura en pata', 'Vendaje y reposo'),
(1006, 6, '2024-03-12 10:30:00', 'Control de peso', 'Dieta balanceada'),
(1007, 7, '2024-03-14 11:30:00', 'Gastroenteritis', 'Dieta blanda y antibiótico'),
(1008, 8, '2024-03-16 09:45:30', 'Deficiencia de calcio', 'Suplementos y cambio de dieta'),
(1009, 9, '2024-03-18 16:15:00', 'Revisión anual', 'Chequeo completo'),
(1010, 10, '2024-03-20 14:30:00', 'Alergia en la piel', 'Antihistamínico y champú especial'),
(1001, 11, '2024-03-22 10:00:00', 'Vacunación', 'Vacuna antirrábica'),
(1002, 12, '2024-03-23 12:15:00', 'Herida en pata', 'Sutura y antibiótico'),
(1003, 13, '2024-03-24 14:00:00', 'Deshidratación', 'Suero y reposo'),
(1004, 14, '2024-03-25 09:32:00', 'Crecimiento anormal de plumas', 'Corte y revisión'),
(1005, 15, '2024-03-26 16:45:00', 'Artritis', 'Analgésico y terapia'),
(1006, 16, '2024-03-27 11:30:00', 'Anemia', 'Suplementos'),
(1007, 17, '2024-03-28 15:00:00', 'Revisión', 'Control general'),
(1001, 1, '2024-12-10 11:02:10', 'Dolor Estomacal', 'Analgésico y terapia'),
(1004, 5, '2024-04-05 11:35:00', 'Vacunación', 'Vacuna antirrábica')
;


