-- 1. Nguyên nhân lỗi

-- Do câu lệnh UPDATE thiếu điều kiện WHERE
-- Khi không có WHERE, hệ thống cập nhật toàn bộ bảng
-- Dẫn đến tất cả sản phẩm đều bị giảm giá 10%
-- 2. Câu lệnh đúng
CREATE DATABASE products;

USE products;

CREATE TABLE product (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(100),
    Category VARCHAR(50),
    OriginalPrice DECIMAL(18, 2)
);

INSERT INTO product (ProductID, ProductName, Category, OriginalPrice)
VALUES
(1, 'iPhone 15', 'Electronics', 20000000),
(2, 'Samsung Refrigerator', 'Electronics', 15000000),
(3, 'Water Spinach', 'Food', 10000),
(4, 'Filtered Fresh Milk 4', 'Food', 28000);

SELECT * FROM product;

UPDATE product
SET OriginalPrice = OriginalPrice * 0.9
WHERE Category = 'Electronics';
