CREATE DATABASE ecommerce;
USE ecommerce;
CREATE TABLE products (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nama VARCHAR(100) NOT NULL,
    harga DECIMAL(10, 2) NOT NULL,
    deskripsi TEXT,
    stok INT NOT NULL DEFAULT 0
);
CREATE TABLE users (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nama VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL
);
CREATE TABLE orders (
    order_id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT NOT NULL,
    product_id INT NOT NULL,
    quantity INT NOT NULL,
    total DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE,
    FOREIGN KEY (product_id) REFERENCES products(id) ON DELETE CASCADE
);
INSERT INTO products (nama, harga, deskripsi, stok) VALUES
('Laptop Gaming', 15000000, 'Laptop dengan spesifikasi tinggi untuk gaming.', 10),
('Kaos Polos', 50000, 'Kaos polos dengan bahan katun berkualitas.', 50),
('Headphone', 300000, 'Headphone dengan kualitas suara premium.', 20);
INSERT INTO users (nama, email, password) VALUES
('Junita', 'junita@example.com', 'password123'),
('Sumantri', 'sumantri@example.com', 'password456');
INSERT INTO orders (user_id, product_id, quantity, total) VALUES
(1, 1, 2, 30000000),  -- User 1 beli 2 Laptop Gaming
(2, 2, 3, 150000);     -- User 2 beli 3 Kaos Polos
SELECT * FROM products;
SELECT o.order_id, u.nama AS user, p.nama AS produk, o.quantity, o.total
FROM orders o
JOIN users u ON o.user_id = u.id
JOIN products p ON o.product_id = p.id;

-- 🔵 10. Mengubah Data Produk (UPDATE)
UPDATE products
SET stok = stok + 5
WHERE nama = 'Laptop Gaming';

UPDATE products
SET harga = 55000
WHERE nama = 'Kaos Polos';

-- 🔵 11. Menghapus Data Produk (DELETE)
DELETE FROM products WHERE id = 3;

-- 🔵 12. Membaca Data Pengguna (READ)
SELECT * FROM users;

