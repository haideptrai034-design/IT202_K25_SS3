-- 1. Phân tích lỗi
-- Lỗi cú pháp (Syntax Error):  
-- Người viết lệnh có thể đã dùng sai tên bảng hoặc sai cấu trúc INSERT. Ví dụ: viết INSERT INTO SHIPPERS VALUES ('Giao Hàng Nhanh', '0123456789') nhưng bảng có 2 cột, cần chỉ rõ tên cột để tránh nhầm lẫn. Nếu không khớp số cột thì hệ thống báo lỗi cú pháp.

-- Lỗi dữ liệu trống (Phone bị rỗng):  
-- Có thể do viết sai tên cột (ví dụ dùng Phones thay vì Phone), hoặc quên truyền giá trị cho cột Phone. Khi đó SQL không báo lỗi (vì cột có thể cho phép NULL) nhưng dữ liệu bị trống.

-- 2. Câu lệnh INSERT hoàn chỉnh

CREATE TABLE SHIPPERS (
    ShipperID INT PRIMARY KEY AUTO_INCREMENT,
    ShipperName VARCHAR(255),
    Phone VARCHAR(20)
);


INSERT INTO SHIPPERS (ShipperName, Phone)
VALUES ('Giao Hàng Nhanh', '0901234567');
