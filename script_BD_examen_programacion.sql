-- Script para crear la base de datos y tablas del examen

DROP DATABASE IF EXISTS examen_programacion_bd2425;
CREATE DATABASE examen_programacion_bd2425;
USE examen_programacion_bd2425;

-- Tabla Empleados
CREATE TABLE empleados (
    id_empleado INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    puesto VARCHAR(100),
    salario DECIMAL(10, 2) CHECK (salario >= 0),
    fecha_contratacion DATE
);

-- Tabla Proyectos
CREATE TABLE proyectos (
    id_proyecto INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL UNIQUE,
    descripcion TEXT,
    fecha_inicio DATE,
    fecha_fin_prevista DATE,
    estado ENUM('PLANIFICADO', 'ACTIVO', 'FINALIZADO', 'CANCELADO') DEFAULT 'PLANIFICADO'
);

-- Tabla Tareas
CREATE TABLE tareas (
    id_tarea INT AUTO_INCREMENT PRIMARY KEY,
    id_proyecto INT,
    nombre VARCHAR(100) NOT NULL,
    descripcion TEXT, -- Ya estaba definido, solo faltaba en los inserts
    fecha_limite DATE,
    estado ENUM('PENDIENTE', 'EN PROCESO', 'COMPLETADA') DEFAULT 'PENDIENTE',
    id_empleado_asignado INT,
    FOREIGN KEY (id_proyecto) REFERENCES proyectos(id_proyecto) ON DELETE CASCADE,
    FOREIGN KEY (id_empleado_asignado) REFERENCES empleados(id_empleado) ON DELETE SET NULL -- Si se borra un empleado, sus tareas quedan sin asignar
);

-- Tabla para logging de triggers (para Ejercicio 4)
CREATE TABLE log_tareas_insertadas (
    id_log INT AUTO_INCREMENT PRIMARY KEY,
    id_tarea INT,
    fecha_hora DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (id_tarea) REFERENCES tareas(id_tarea) ON DELETE CASCADE
);


-- Inserción de datos de ejemplo
INSERT INTO empleados (nombre, puesto, salario, fecha_contratacion) VALUES
('Ana Ruiz', 'Desarrollador Senior', 2300.00, '2018-07-21'),       
('Luis Gómez', 'Desarrollador Junior', 1800.00, '2022-01-15'),   
('Maria López', 'Diseñador UX/UI', 2100.00, '2019-05-10'),       
('Carlos Sánchez', 'Jefe de Proyecto', 3800.00, '2017-03-01'),   
('Elena Vidal', 'Desarrollador Senior', 2950.00, '2019-09-01');

INSERT INTO proyectos (nombre, descripcion, fecha_inicio, fecha_fin_prevista, estado) VALUES
('App Móvil Clientes', 'Desarrollo de la app móvil para iOS y Android para mejorar la interacción con clientes.', '2023-10-01', '2024-06-30', 'ACTIVO'),
('Plataforma Web Interna', 'Mejora de la plataforma para empleados, incluyendo nuevas funcionalidades y optimización de rendimiento.', '2024-01-15', '2024-12-31', 'ACTIVO'),
('Informe Anual BD', 'Preparación de informes de rendimiento de la base de datos, análisis de cuellos de botella y recomendaciones.', '2024-03-01', '2024-04-15', 'FINALIZADO'),
('Web Corporativa v2', 'Rediseño completo de la web principal de la empresa, con nuevo look and feel y optimización SEO.', '2024-05-01', '2024-09-30', 'PLANIFICADO');

INSERT INTO tareas (id_proyecto, nombre, descripcion, fecha_limite, estado, id_empleado_asignado) VALUES
(1, 'Diseño UI/UX App', 'Crear mockups y prototipos interactivos para la interfaz de usuario de la aplicación móvil.', '2023-11-15', 'COMPLETADA', 3), -- Maria
(1, 'Desarrollo Backend API', 'Implementar los endpoints de la API REST necesarios para la funcionalidad de la app.', '2024-01-31', 'COMPLETADA', 1), -- Ana
(1, 'Desarrollo Frontend iOS', 'Codificar la interfaz de usuario y lógica de negocio para la versión iOS de la app.', '2024-04-30', 'EN PROCESO', 2), -- Luis
(1, 'Desarrollo Frontend Android', 'Codificar la interfaz de usuario y lógica de negocio para la versión Android de la app.', '2024-04-30', 'PENDIENTE', 2), -- Luis (Tarea pendiente para reasignar)
(2, 'Análisis Requisitos Plataforma', 'Recopilar y documentar los requisitos funcionales y no funcionales para la nueva plataforma interna.', '2024-02-28', 'COMPLETADA', 4), -- Carlos
(2, 'Desarrollo Módulo Usuarios', 'Implementar el sistema de gestión de usuarios, roles y permisos en la plataforma.', '2024-05-31', 'EN PROCESO', 1), -- Ana
(2, 'Implementación Seguridad', 'Aplicar medidas de seguridad, incluyendo autenticación, autorización y protección contra vulnerabilidades comunes.', '2024-06-30', 'PENDIENTE', 1), -- Ana (Tarea pendiente para reasignar)
(2, 'Testing Integración', 'Realizar pruebas de integración entre los diferentes módulos de la plataforma.', '2024-07-31', 'PENDIENTE', NULL), -- Sin asignar
(3, 'Recopilación Datos', 'Extraer y consolidar los datos de rendimiento de las bases de datos del último año.', '2024-03-15', 'COMPLETADA', 4), -- Carlos
(3, 'Análisis Resultados', 'Analizar los datos recopilados, identificar tendencias y preparar un borrador del informe.', '2024-03-31', 'COMPLETADA', 1); -- Ana

-- Nota: Algunas tareas están PENDIENTE y asignadas a empleados específicos (Ana y Luis) para el ejercicio de reasignación.
-- Hay una tarea sin asignar para probar ese caso si se necesitara.

-- Inserción de tareas genéricas (sin proyecto asociado)
INSERT INTO tareas (id_proyecto, nombre, descripcion, fecha_limite, estado, id_empleado_asignado) VALUES
(NULL, 'Revisión Trimestral Código', 'Realizar una revisión de calidad y buenas prácticas sobre el código base de proyectos activos.', '2024-09-30', 'PENDIENTE', NULL),
(NULL, 'Formación Nuevas Tecnologías', 'Asistir a curso de formación sobre el framework X versión Y.', '2024-08-15', 'PENDIENTE', 2), -- Luis
(NULL, 'Mantenimiento Servidores Desarrollo', 'Aplicar parches de seguridad y actualizaciones en los servidores de entorno de desarrollo.', '2024-07-20', 'PENDIENTE', NULL),
(NULL, 'Documentación Interna Procesos', 'Actualizar la documentación de los procesos internos del departamento de desarrollo.', '2024-10-10', 'PENDIENTE', 4); -- Carlos

-- Crear usuario y conceder permisos
CREATE USER IF NOT EXISTS ex_bbdd_2425@'localhost' IDENTIFIED BY '1234';
GRANT ALL ON examen_programacion_bd2425.* TO ex_bbdd_2425@'localhost' WITH GRANT OPTION;
FLUSH PRIVILEGES; -- Asegura que los cambios de privilegios se aplican inmediatamente
