SET NAMES utf8mb4;
SET character_set_client = utf8mb4;

CREATE DATABASE IF NOT EXISTS catalogo_db CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE catalogo_db;

-- TABLAS ----------------------------------
CREATE TABLE categorias (
                            id INT AUTO_INCREMENT PRIMARY KEY,
                            nombre VARCHAR(50) NOT NULL UNIQUE
) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

CREATE TABLE marcas (
                        id INT AUTO_INCREMENT PRIMARY KEY,
                        nombre VARCHAR(50) NOT NULL UNIQUE,
                        pais_origen VARCHAR(50)
) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

CREATE TABLE dispositivos (
                              id INT AUTO_INCREMENT PRIMARY KEY,
                              nombre VARCHAR(150) NOT NULL,
                              descripcion TEXT,
                              imagen_url VARCHAR(500),
                              precio DECIMAL(10, 2),
                              fecha_lanzamiento DATE,
                              especificaciones TEXT,
                              categoria_id INT,
                              marca_id INT,
                              FOREIGN KEY (categoria_id) REFERENCES categorias(id),
                              FOREIGN KEY (marca_id) REFERENCES marcas(id)
) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

CREATE TABLE comentarios (
                             id INT AUTO_INCREMENT PRIMARY KEY,
                             autor VARCHAR(100) NOT NULL,
                             texto TEXT NOT NULL,
                             fecha_creacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
                             calificacion INT CHECK (calificacion >= 1 AND calificacion <= 5),
                             dispositivo_id INT,
                             FOREIGN KEY (dispositivo_id) REFERENCES dispositivos(id) ON DELETE CASCADE
) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- DATOS SEMILLA ---------------------------

-- 1. Categorías
INSERT INTO categorias (nombre) VALUES ('Celular'), ('Portátil'), ('Tablet');

-- 2. Marcas (Nombres exactos para que se vean bonitos en el filtro)
INSERT INTO marcas (nombre, pais_origen) VALUES
                                             ('Apple', 'USA'),
                                             ('Samsung', 'Corea'),
                                             ('Xiaomi', 'China'),
                                             ('Lenovo', 'China'),
                                             ('Asus', 'Taiwán'),
                                             ('Google', 'USA'),
                                             ('HP', 'USA'),
                                             ('Microsoft', 'USA');

-- 3. Dispositivos (Imágenes estables de Wikimedia Commons - Renders/Clean)
INSERT INTO dispositivos (nombre, descripcion, imagen_url, precio, fecha_lanzamiento, especificaciones, categoria_id, marca_id) VALUES
-- CELULARES
(
    'iPhone 15 Pro Max',
    'Diseño en titanio. El iPhone más potente con chip A17 Pro.',
    'https://soytechno.com/wp-content/uploads/2024/10/3ba396_c69e5c34d01a44e4a824195d16521f53mv2.webp',
    5599000.00, '2023-09-22', 'A17 Pro, 48MP, USB-C', 1, 1
),
(
    'Samsung Galaxy S24 Ultra',
    'Inteligencia Artificial Galaxy AI y S-Pen integrado.',
    'https://http2.mlstatic.com/D_NQ_NP_906402-MLA78898729191_092024-O.webp',
    6200000.00, '2024-01-17', 'Snapdragon 8 Gen 3, Titanio', 1, 2
),
(
    'Google Pixel 8 Pro',
    'El Android más puro con la mejor cámara computacional.',
    'https://http2.mlstatic.com/D_NQ_NP_749152-MLA99563223740_122025-O.webp',
    4800000.00, '2023-10-12', 'Tensor G3, 12GB RAM', 1, 6
),
(
    'Xiaomi 13T Pro',
    'Óptica Leica profesional y carga de 120W.',
    'https://gsmphone.co/wp-content/uploads/2023/11/xiaomi_13t_azul_00_l.jpeg',
    3200000.00, '2023-09-26', 'Dimensity 9200+, 144Hz', 1, 3
),

-- PORTÁTILES
(
    'MacBook Air M2',
    'Diseño ultra fino, chip M2 y batería para todo el día.',
    'https://co.tiendasishop.com/cdn/shop/files/IMG-5577525_10609475-a7af-40ef-8a28-d8aca2d5f015.jpg?v=1740448280&width=823',
    5200000.00, '2022-07-15', 'Chip M2, 13.6 pulgadas', 2, 1
),
(
    'Asus ROG Zephyrus',
    'Potencia gaming extrema en un cuerpo compacto.',
    'https://dlcdnwebimgs.asus.com/gain/8DFC1629-C380-4005-A755-517B02AACD98/w717/h525',
    7800000.00, '2023-05-10', 'Ryzen 9, RTX 4060', 2, 5
),
(
    'Lenovo ThinkPad X1',
    'La leyenda empresarial. Fibra de carbono y durabilidad militar.',
    'https://p4-ofp.static.pub//fes/cms/2025/04/04/0ave160v06at4rvgdk9s7jl8pt4g9j262517.png',
    8100000.00, '2023-04-01', 'Intel Core i7, Ultraligero', 2, 4
),
(
    'HP Spectre x360',
    'Convertible premium con diseño de joya y pantalla táctil.',
    'https://img-cdn.tnwcdn.com/image?fit=1280%2C720&url=https%3A%2F%2Fcdn0.tnwcdn.com%2Fwp-content%2Fblogs.dir%2F1%2Ffiles%2F2021%2F08%2FHP-Spectre-x360-14-1-of-7.jpg&signature=b273734ba382a58d403431a960fd1708',
    5900000.00, '2023-06-15', '2-en-1, Pantalla OLED', 2, 7
),

-- TABLETS
(
    'iPad Pro 12.9',
    'El iPad definitivo con pantalla XDR y potencia de ordenador.',
    'https://celucambio.com/cdn/shop/files/ipad_pro_4th_gen_space_grey.png?v=1746889730',
    6800000.00, '2022-10-26', 'Chip M2, Mini-LED', 3, 1
),
(
    'Samsung Galaxy Tab S9',
    'Tablet todo terreno resistente al agua con S-Pen.',
    'https://exitocol.vtexassets.com/arquivos/ids/32512758/Table-SAMSUNG-GALAXY-Tab-S9-Ultra-146-pulgadas-Wifi-256-GB-12-GB-RAM-Gris-3424495_a.jpg?v=639065252798370000',
    4500000.00, '2023-08-11', 'Snapdragon 8 Gen 2, IP68', 3, 2
),
(
    'Microsoft Surface Pro 9',
    'Reemplaza a tu portátil. Potencia de Windows 11 en una tablet.',
    'https://http2.mlstatic.com/D_Q_NP_2X_661134-CBT78116186743_082024-T.webp',
    5100000.00, '2022-10-25', 'Intel Core i5/i7, Teclado desmontable', 3, 8
);

-- 4. Comentarios
INSERT INTO comentarios (autor, texto, calificacion, dispositivo_id) VALUES
                                                                         ('Juan P.', 'Excelente teléfono, la cámara es brutal.', 5, 1),
                                                                         ('Maria G.', 'La batería dura muchísimo en el MacBook.', 5, 5);