-- Script para crear la base de datos y tablas de la empresa

DROP DATABASE IF EXISTS programacion_empresa_bd;
CREATE DATABASE programacion_empresa_bd;
USE programacion_empresa_bd;

-- Tabla Departamentos
CREATE TABLE departamentos (
    id_departamento INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL UNIQUE,
    ubicacion VARCHAR(100)
) ENGINE=InnoDB; -- Usamos InnoDB

-- Tabla Empleados
CREATE TABLE empleados (
    id_empleado INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    apellidos VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE,
    fecha_contratacion DATE,
    salario DECIMAL(10, 2) NOT NULL CHECK (salario >= 0),
    id_departamento INT,
    FOREIGN KEY (id_departamento) REFERENCES departamentos(id_departamento) ON DELETE SET NULL -- Si se borra un departamento, los empleados quedan sin asignar.
                                                                                             -- Nota: El trigger del Ejercicio 3 *impedirá* esto si hay empleados antes de que ON DELETE SET NULL actúe.
) ENGINE=InnoDB; -- Usamos InnoDB

-- Tabla para logging de cambios de salario (para Ejercicio 4)
CREATE TABLE log_cambios_salario (
    id_log INT AUTO_INCREMENT PRIMARY KEY,
    id_empleado INT,
    salario_anterior DECIMAL(10, 2),
    salario_nuevo DECIMAL(10, 2),
    fecha_cambio DATETIME DEFAULT CURRENT_TIMESTAMP,
    usuario_bd VARCHAR(100),
    FOREIGN KEY (id_empleado) REFERENCES empleados(id_empleado) ON DELETE CASCADE
) ENGINE=InnoDB; -- Usamos InnoDB

-- Tabla para logging de transferencias (para Ejercicio 6)
CREATE TABLE log_transferencias_empleado (
    id_log INT AUTO_INCREMENT PRIMARY KEY,
    id_empleado INT,
    id_departamento_anterior INT,
    id_departamento_nuevo INT,
    fecha_transferencia DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (id_empleado) REFERENCES empleados(id_empleado) ON DELETE CASCADE,
    FOREIGN KEY (id_departamento_anterior) REFERENCES departamentos(id_departamento) ON DELETE SET NULL,
    FOREIGN KEY (id_departamento_nuevo) REFERENCES departamentos(id_departamento) ON DELETE SET NULL
) ENGINE=InnoDB; -- Usamos InnoDB

-- Inserción de datos de ejemplo
INSERT INTO departamentos (nombre, ubicacion) VALUES
('Tecnología', 'Edificio A, Planta 3'),
('Recursos Humanos', 'Edificio B, Planta 1'),
('Ventas', 'Edificio A, Planta 1'),
('Marketing', 'Edificio C, Planta 2'); -- Departamento sin empleados inicialmente

INSERT INTO empleados (nombre, apellidos, email, fecha_contratacion, salario, id_departamento) VALUES
('Juan', 'Martínez', 'juan.m@empresa.com', '2018-06-10', 45000.00, 1), -- Tecnología
('Ana', 'Sánchez', 'ana.s@empresa.com', '2019-02-20', 38000.00, 1), -- Tecnología
('Luis', 'Pérez', 'luis.p@empresa.com', '2020-09-01', 30000.00, 2), -- RRHH
('María', 'Gómez', 'maria.g@empresa.com', '2017-11-15', 55000.00, 3), -- Ventas
('Carlos', 'Ruiz', 'carlos.r@empresa.com', '2021-05-05', 32000.00, 1), -- Tecnología
('Sofía', 'Díaz', 'sofia.d@empresa.com', '2022-01-30', 28000.00, NULL); -- Sin departamento asignado
