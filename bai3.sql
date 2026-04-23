-- 1. Phân tích bài toán (I/O)

-- Input: Bảng CUSTOMERS chứa nhiều cột (Tên, Địa chỉ, Email, Ngày mua cuối, Status, …).
-- Output: Chỉ cần Tên và Email của khách hàng.
-- Sai lầm khi dùng SELECT *:
-- Lấy toàn bộ cột không cần thiết → gây nghẽn hệ thống vì bảng có hàng triệu bản ghi.
-- Tốn tài nguyên xử lý và truyền tải dữ liệu.
-- Có nguy cơ lôi cả dữ liệu nhạy cảm hoặc không liên quan (ví dụ ngày sinh, giới tính).

-- 2. Logic lọc dữ liệu (WHERE)

-- Các điều kiện cần có:
-- Address = 'Hà Nội' → chỉ lấy khách hàng ở Hà Nội.
-- LastPurchaseDate <= '2026-04-01' - INTERVAL 6 MONTH hoặc so sánh trực tiếp với ngày 01/10/2025 → khách hàng không mua hàng hơn 6 tháng tính đến 01/04/2026.
-- Email IS NOT NULL → loại bỏ khách hàng không có email.
-- Status <> 'Locked' → loại bỏ tài khoản bị khóa.

-- 3. Triển khai câu lệnh SQL

CREATE TABLE CUSTOMERS (
    CustomerID INT PRIMARY KEY AUTO_INCREMENT,
    FullName VARCHAR(100),
    Email VARCHAR(100),
    City VARCHAR(50),
    LastPurchaseDate DATE, -- Ngày mua hàng cuối cùng
    Status VARCHAR(20),    -- Trạng thái tài khoản (Active, Locked...)
    Gender VARCHAR(10),
    DateOfBirth DATE,
    Points INT,
    Address VARCHAR(255)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO CUSTOMERS (FullName, Email, City, LastPurchaseDate, Status) VALUES
('Nguyễn Văn A', 'anv@gmail.com', 'Hà Nội', '2025-05-20', 'Active'), -- Khách tiềm năng (hơn 6 tháng)
('Trần Thị B', 'btt@gmail.com', 'Hà Nội', '2026-02-10', 'Active'), -- Mới mua (loại)
('Lê Văn C', NULL, 'Hà Nội', '2025-01-15', 'Active'),            -- Lỗi: Không có Email
('Phạm Minh D', 'dpm@gmail.com', 'Hà Nội', '2024-12-01', 'Locked'), -- Lỗi: Tài khoản bị khóa
('Hoàng An E', 'eha@gmail.com', 'TP HCM', '2025-03-01', 'Active');  -- Lỗi: Sai thành phố

SELECT CustomerName, Email
FROM CUSTOMERS
WHERE Address = 'Hà Nội'
  AND LastPurchaseDate < '2025-10-01'
  AND Email IS NOT NULL
  AND Status <> 'Locked';
