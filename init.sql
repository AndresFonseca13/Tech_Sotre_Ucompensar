-- init.sql
-- Creación de la Base de Datos
CREATE DATABASE IF NOT EXISTS catalogo_db;
USE catalogo_db;

-- 1. Tabla de Categorías (Tipos)
CREATE TABLE categorias (
                            id INT AUTO_INCREMENT PRIMARY KEY,
                            nombre VARCHAR(50) NOT NULL UNIQUE
);

-- 2. Tabla de Marcas
CREATE TABLE marcas (
                        id INT AUTO_INCREMENT PRIMARY KEY,
                        nombre VARCHAR(50) NOT NULL UNIQUE,
                        pais_origen VARCHAR(50)
);

-- 3. Tabla de Dispositivos
CREATE TABLE dispositivos (
                              id INT AUTO_INCREMENT PRIMARY KEY,
                              nombre VARCHAR(150) NOT NULL,
                              descripcion TEXT, -- Reseña, sinopsis
                              imagen_url VARCHAR(255), -- URL de la foto (puede ser externa o local)
                              precio DECIMAL(10, 2),
                              fecha_lanzamiento DATE,
                              especificaciones TEXT, -- JSON o texto libre para detalles técnicos
                              categoria_id INT,
                              marca_id INT,
                              FOREIGN KEY (categoria_id) REFERENCES categorias(id),
                              FOREIGN KEY (marca_id) REFERENCES marcas(id)
);

-- 4. Tabla de Comentarios
CREATE TABLE comentarios (
                             id INT AUTO_INCREMENT PRIMARY KEY,
                             autor VARCHAR(100) NOT NULL, -- Nombre del usuario que comenta
                             texto TEXT NOT NULL,
                             fecha_creacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
                             calificacion INT CHECK (calificacion >= 1 AND calificacion <= 5),
                             dispositivo_id INT,
                             FOREIGN KEY (dispositivo_id) REFERENCES dispositivos(id) ON DELETE CASCADE
);

-- ==========================================
-- DATOS SEMILLA (SEED DATA)
-- ==========================================

-- Insertar Categorías
INSERT INTO categorias (nombre) VALUES ('Celular'), ('Portátil'), ('Tablet');

-- Insertar Marcas
INSERT INTO marcas (nombre, pais_origen) VALUES
                                             ('Apple', 'USA'),
                                             ('Samsung', 'Corea del Sur'),
                                             ('Xiaomi', 'China'),
                                             ('Lenovo', 'China'),
                                             ('Asus', 'Taiwán');

-- Insertar Dispositivos (Datos reales de ejemplo)
INSERT INTO dispositivos (nombre, descripcion, imagen_url, precio, fecha_lanzamiento, especificaciones, categoria_id, marca_id) VALUES
                                                                                                                                    (
                                                                                                                                        'iPhone 15 Pro Max',
                                                                                                                                        'Diseñado con titanio aeroespacial, el iPhone 15 Pro Max es extremadamente resistente y ligero.',
                                                                                                                                        'https://co.nixblix.com/cdn/shop/files/27439196045488-iphone_15_pro_max_natural_titanium_pdp_image_position-1__coes.jpg?v=1751651188',
                                                                                                                                        5599000.00,
                                                                                                                                        '2023-09-22',
                                                                                                                                        'Chip A17 Pro, Pantalla Super Retina XDR, Cámara 48MP',
                                                                                                                                        1, 1
                                                                                                                                    ),
                                                                                                                                    (
                                                                                                                                        'Samsung Galaxy S24 Ultra',
                                                                                                                                        'El smartphone con IA integrada que cambia la forma en que creas, te conectas y te comunicas.',
                                                                                                                                        'https://http2.mlstatic.com/D_NQ_NP_906402-MLA78898729191_092024-O.webp',
                                                                                                                                        6200000.00,
                                                                                                                                        '2024-01-17',
                                                                                                                                        'Snapdragon 8 Gen 3, S Pen incluido, Pantalla Dynamic AMOLED 2X',
                                                                                                                                        1, 2
                                                                                                                                    ),
                                                                                                                                    (
                                                                                                                                        'Asus ROG Zephyrus G14',
                                                                                                                                        'Potencia compacta para gaming y creación de contenido en un chasis elegante.',
                                                                                                                                        'https://dlcdnwebimgs.asus.com/gain/1B866BF7-1A65-464C-AEA7-3AC87CB03AA7',
                                                                                                                                        7800000.00,
                                                                                                                                        '2023-05-10',
                                                                                                                                        'AMD Ryzen 9, NVIDIA RTX 4060, 16GB RAM, 1TB SSD',
                                                                                                                                        2, 5
                                                                                                                                    );

-- Insertar un comentario de prueba
INSERT INTO comentarios (autor, texto, calificacion, dispositivo_id) VALUES
    ('Juan Perez', 'Excelente teléfono, la batería dura todo el día.', 5, 1);