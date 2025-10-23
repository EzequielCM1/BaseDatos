use BD06;
CREATE TABLE clientes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100),
    bloqueado BOOLEAN DEFAULT FALSE,
    nivel_riesgo ENUM ('Alto','Medio','Bajo') DEFAULT 'Bajo'
);
CREATE TABLE facturas (
    id INT AUTO_INCREMENT PRIMARY KEY,
    cliente_id INT,
    importe DECIMAL(10,2),
    pagada BOOLEAN DEFAULT FALSE,
    fecha DATE,
    FOREIGN KEY (cliente_id) REFERENCES clientes(id)
);
INSERT INTO clientes(nombre) VALUES ('Carlos'), ('Laura'), ('Pedro'), ('Manuel');

INSERT INTO facturas(cliente_id, importe, pagada, fecha) VALUES
(1, 100.00, FALSE, '2024-12-01'),
(1, 80.00, FALSE, '2025-01-01'),
(1, 120.00, FALSE, '2025-02-01'),
(1, 90.00, FALSE, '2025-03-01'),
(2, 60.00, TRUE, '2025-03-01'),
(3, 30.00, FALSE, '2025-02-11'),
(4, 55.00, TRUE, '2025-03-01'),
(4, 28.00, FALSE, '2025-03-04'),
(4, 36.00, FALSE, '2025-03-05');
