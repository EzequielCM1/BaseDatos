drop database if exists BD04pilotos;
	create database BD04pilotos;
	use BD04pilotos;
	-- tabla que almacena nuestros pilotos.
	create table piloto (
		id_piloto INT AUTO_INCREMENT PRIMARY KEY,
		nombre varchar(50) not null,
		apellidos varchar(100) not null,
		genero ENUM('H','M') not null,
		nickname varchar(50) UNIQUE not null,
		ranking int default 0);
		
	-- tabla que almacena nuestras naves (cada nave puede o no estar actualmente pilotada por un piloto)
	create table nave (
		id_nave INT AUTO_INCREMENT PRIMARY KEY,
		nombre varchar(50) not null UNIQUE,
		tipo ENUM('Caza', 'Bombardero', 'Transporte', 'Explorador') NOT NULL,
		estado ENUM ('operativa','en reparación', 'retirada') default 'operativa' not null,
		id_piloto INT NULL,
		id_copiloto INT NULL,
		foreign key (id_piloto) references piloto (id_piloto) ON DELETE SET NULL ON UPDATE CASCADE,
		foreign key (id_copiloto) references piloto (id_piloto) ON DELETE SET NULL ON UPDATE CASCADE);
		
	create table historico (
		id_historico INT AUTO_INCREMENT PRIMARY KEY,
		id_piloto INT, 
		id_nave INT,
		fecha TIMESTAMP default NOW(),
		foreign key (id_piloto) references piloto(id_piloto) ON DELETE CASCADE ON UPDATE CASCADE,
		foreign key (id_nave) references nave(id_nave) ON DELETE CASCADE ON UPDATE CASCADE
		);

	-- metemos los pilotos
	-- insert into piloto (nombre, apellidos, sexo, nickname)
	INSERT INTO piloto (nombre, apellidos, genero, nickname, ranking) VALUES
	('Carlos', 'Fernández López', 'H', 'SkyAce', 1200),
	('María', 'González Ruiz', 'M', 'StarQueen', 950),
	('Javier', 'López Martínez', 'H', 'ShadowWing', 1300),
	('Ana', 'Martín Pérez', 'M', 'LunaFly', 1100),
	('Sergio', 'Díaz Gómez', 'H', 'BlazeRider', 1050),
	('Elena', 'Ramírez Torres', 'M', 'NebulaStorm', 980),
	('David', 'Castro Romero', 'H', 'MeteorStrike', 1025),
	('Lucía', 'Ortega Jiménez', 'M', 'CometDancer', 900),
	('Pablo', 'Sánchez Moreno', 'H', 'VortexPilot', 890),
	('Laura', 'Hernández Cano', 'M', 'SolarEagle', 970),
	('Fernando', 'García Salas', 'H', 'HyperFalcon', 1100),
	('Beatriz', 'Navarro Molina', 'M', 'NovaRider', 860),
	('Raúl', 'Pérez Domínguez', 'H', 'CosmoGlider', 780),
	('Marta', 'Gómez López', 'M', 'EclipseWave', 870),
	('Antonio', 'Suárez Vega', 'H', 'TitanJet', 920),
	('Patricia', 'Rubio Sanz', 'M', 'AstroWind', 940);

	INSERT INTO nave (nombre, tipo, estado, id_piloto, id_copiloto) VALUES
	('Fénix-1', 'Bombardero', 'operativa', 1, 2), 
	('Tormenta-5', 'Caza', 'en reparación', 3, NULL),  
	('Nebulosa-X', 'Explorador', 'operativa', NULL, 4),  
	('Halcon-Z', 'Bombardero', 'retirada', 5, 6),  
	('Estrella-7', 'Explorador', 'operativa', NULL, NULL), 
	('Cometa-R', 'Caza', 'operativa', 7, 8), 
	('Titán-V', 'Bombardero', 'operativa', 1, 3), 
	('Solaris-9', 'Explorador', 'en reparación', 9, 10), 
	('Meteorito-3', 'Caza', 'operativa', 5, NULL), 
	('Galaxia-F', 'Bombardero', 'retirada', NULL, 11), 
	('Nova-B', 'Explorador', 'operativa', 12, NULL),  
	('Cosmos-Y', 'Caza', 'en reparación', 13, 14),  
	('Eclipse-V', 'Bombardero', 'operativa', 15, 16), 
	('Viento-Rápido', 'Explorador', 'operativa', 6, 2), 
	('Fulgor-6', 'Bombardero', 'operativa', 10, 1);  


	INSERT INTO historico (id_piloto, id_nave, fecha) VALUES
	(1, 2, '2023-01-15 10:30:00'), 
	(3, 1, '2023-02-10 14:20:00'),  
	(5, 6, '2023-03-05 09:10:00'),
	(7, 8, '2023-03-25 16:45:00'),
	(9, 10, '2023-04-18 12:30:00'),
	(11, 4, '2023-05-01 08:15:00'),
	(12, 3, '2023-05-22 18:00:00'), 
	(13, 5, '2023-06-05 11:55:00'), 
	(15, 7, '2023-06-22 20:10:00'), 
	(1, 6, '2023-07-10 10:00:00'),  
	(3, 9, '2023-07-15 15:30:00'),  
	(5, 10, '2023-08-01 11:45:00'), 
	(7, 11, '2023-08-18 09:20:00'),
	(9, 12, '2023-09-05 14:10:00'), 
	(11, 13, '2023-09-25 17:30:00'), 
	(12, 14, '2023-10-12 07:50:00'), 
	(13, 1, '2023-10-29 19:10:00'),  
	(15, 3, '2023-11-07 13:15:00'),  
	(1, 5, '2023-11-15 10:40:00'), 
	(3, 7, '2023-11-28 15:20:00'), 
	(5, 9, '2023-12-02 09:05:00'), 
	(7, 11, '2023-12-15 16:50:00'), 
	(9, 13, '2023-12-20 12:35:00'), 
	(11, 2, '2024-01-03 18:45:00'), 
	(12, 4, '2024-01-10 08:55:00'), 
	(13, 6, '2024-01-22 14:20:00'), 
	(15, 8, '2024-01-30 17:10:00'), 
	(1, 10, '2024-02-05 09:30:00'), 
	(3, 12, '2024-02-15 20:00:00'); 
