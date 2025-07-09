--  Project Description:
-- Manufacturing Quality Control System for “ALIOS” Company is a MySQL-based data project that simulates real-world garment production operations. It includes structured tables for Products, Raw Materials, Employees, and Quality Checks, along with 15+ analytical queries.

-- Business Insights Delivered:
-- Identifies products with frequent quality failures, helping reduce defect rates
-- Tracks raw material consumption and stock levels to avoid production delays
-- Highlights employee performance based on inspection outcomes
-- Measures average quality scores across product batches
-- Detects pending or failed inspections early to maintain delivery timelines

-- Impact for the Company:
-- Improves product quality and customer satisfaction
-- Reduces wastage and material cost overruns
-- Enables data-driven decisions in hiring, inspection, and procurement
-- Enhances reporting for audits and compliance




-- Manufacturing Quality Control System for "ALIOS" Company

CREATE DATABASE IF NOT EXISTS manufacturingALIOS;
USE manufacturingALIOS;

-- 1. Products Table
DROP TABLE IF EXISTS Products;
CREATE TABLE Products (
    ProductID INT AUTO_INCREMENT PRIMARY KEY,
    ProductName VARCHAR(100) NOT NULL,
    ProductType VARCHAR(50),
    Size VARCHAR(10),
    Color VARCHAR(30),
    Price DECIMAL(10, 2)
);

INSERT INTO Products (ProductName, ProductType, Size, Color, Price) VALUES
('Classic Linen Shirt', 'Shirt', 'M', 'White', 1200.00),
('Classic Linen Shirt', 'Shirt', 'L', 'White', 1200.00),
('Classic Linen Shirt', 'Shirt', 'XL', 'White', 1200.00),
('Slim Fit Linen Shirt', 'Shirt', 'S', 'Blue', 1300.00),
('Slim Fit Linen Shirt', 'Shirt', 'M', 'Blue', 1300.00),
('Slim Fit Linen Shirt', 'Shirt', 'L', 'Blue', 1300.00),
('Casual Linen Shirt', 'Shirt', 'M', 'Grey', 1100.00),
('Casual Linen Shirt', 'Shirt', 'L', 'Grey', 1100.00),
('Casual Linen Shirt', 'Shirt', 'XL', 'Grey', 1100.00),
('Formal Linen Shirt', 'Shirt', 'M', 'Black', 1400.00),
('Formal Linen Shirt', 'Shirt', 'L', 'Black', 1400.00),
('Formal Linen Shirt', 'Shirt', 'XL', 'Black', 1400.00),
('Summer Linen Shirt', 'Shirt', 'S', 'Yellow', 1000.00),
('Summer Linen Shirt', 'Shirt', 'M', 'Yellow', 1000.00),
('Summer Linen Shirt', 'Shirt', 'L', 'Yellow', 1000.00),
('Printed Linen Shirt', 'Shirt', 'M', 'Green', 1500.00),
('Printed Linen Shirt', 'Shirt', 'L', 'Green', 1500.00),
('Printed Linen Shirt', 'Shirt', 'XL', 'Green', 1500.00),
('Designer Linen Shirt', 'Shirt', 'M', 'Pink', 1600.00),
('Designer Linen Shirt', 'Shirt', 'L', 'Pink', 1600.00);

-- 2. Raw Materials Table
DROP TABLE IF EXISTS RawMaterials;
CREATE TABLE RawMaterials (
    MaterialID INT AUTO_INCREMENT PRIMARY KEY,
    MaterialName VARCHAR(100) NOT NULL,
    SupplierName VARCHAR(100),
    QuantityAvailable INT,
    UnitPrice DECIMAL(10, 2)
);

INSERT INTO RawMaterials (MaterialName, SupplierName, QuantityAvailable, UnitPrice) VALUES
('Linen Fabric', 'FabricCo', 5000, 250.00),
('Thread', 'ThreadWorks', 2000, 5.00),
('Buttons', 'ButtonMart', 1000, 2.00),
('Packaging Material', 'PackPro', 3000, 20.00),
('Collar Stiffeners', 'Stiffener Supplies', 800, 10.00),
('Labels', 'LabelWorld', 1500, 15.00),
('Zippers', 'ZipperTech', 700, 12.00),
('Embroidery Material', 'EmbroideryCo', 600, 30.00),
('Printing Ink', 'InkHub', 400, 50.00),
('Linen Fabric - Premium', 'Premium Linen Co.', 1000, 400.00),
('Elastic', 'ElasticWorks', 200, 8.00),
('Velcro', 'VelcroKing', 150, 10.00),
('Thread - Premium', 'ThreadWorks', 500, 8.00),
('Buttons - Designer', 'ButtonMart', 300, 5.00),
('Packaging Tape', 'PackPro', 1000, 25.00),
('Hangtags', 'LabelWorld', 700, 18.00),
('Linen Fabric - Casual', 'FabricCo', 3000, 180.00),
('Dye Material', 'DyeMasters', 500, 60.00),
('Extra Buttons', 'ButtonMart', 200, 1.50),
('Linen Fabric - Printed', 'Premium Linen Co.', 700, 350.00);

-- Create junction table for Product-Material relationship
DROP TABLE IF EXISTS ProductMaterials;
CREATE TABLE ProductMaterials (
    ProductID INT,
    MaterialID INT,
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID),
    FOREIGN KEY (MaterialID) REFERENCES RawMaterials(MaterialID)
);

-- 3. Employees Table
DROP TABLE IF EXISTS Employees;
CREATE TABLE Employees (
    EmployeeID INT AUTO_INCREMENT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Role VARCHAR(50),
    Department VARCHAR(50),
    ContactNumber VARCHAR(15)
);

INSERT INTO Employees (FirstName, LastName, Role, Department, ContactNumber) VALUES
('John', 'Doe', 'Inspector', 'Quality Control', '1234567890'),
('Jane', 'Smith', 'Inspector', 'Quality Control', '1234567891'),
('Raj', 'Kumar', 'Inspector', 'Quality Control', '1234567892'),
('Priya', 'Sharma', 'Inspector', 'Quality Control', '1234567893'),
('Ahmed', 'Khan', 'Inspector', 'Quality Control', '1234567894'),
('Emily', 'Jones', 'Supervisor', 'Quality Control', '1234567895'),
('Carlos', 'Garcia', 'Inspector', 'Quality Control', '1234567896'),
('Wei', 'Zhang', 'Inspector', 'Quality Control', '1234567897'),
('Sara', 'Kim', 'Supervisor', 'Quality Control', '1234567898'),
('Peter', 'Brown', 'Manager', 'Quality Control', '1234567899'),
('Amit', 'Singh', 'Inspector', 'Quality Control', '1234567800'),
('Anna', 'Taylor', 'Inspector', 'Quality Control', '1234567801'),
('Liam', 'Wilson', 'Inspector', 'Quality Control', '1234567802'),
('Sophia', 'Martinez', 'Inspector', 'Quality Control', '1234567803'),
('Noah', 'Davis', 'Supervisor', 'Quality Control', '1234567804'),
('Oliver', 'Lopez', 'Inspector', 'Quality Control', '1234567805'),
('Mia', 'Gonzalez', 'Inspector', 'Quality Control', '1234567806'),
('Lucas', 'Perez', 'Inspector', 'Quality Control', '1234567807'),
('Charlotte', 'Thomas', 'Inspector', 'Quality Control', '1234567808'),
('James', 'White', 'Inspector', 'Quality Control', '1234567809');

-- Drop if exists (optional cleanup)
DROP TABLE IF EXISTS QualityChecks;

-- Create QualityChecks table
CREATE TABLE QualityChecks (
    QualityCheckID INT AUTO_INCREMENT PRIMARY KEY,
    ProductID INT,
    EmployeeID INT,
    InspectionDate DATE,
    Status ENUM('Passed', 'Failed', 'Pending') DEFAULT 'Pending',
    Remarks VARCHAR(255),
    Score INT,
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID),
    FOREIGN KEY (EmployeeID) REFERENCES Employees(EmployeeID)
);

-- Insert  quality check records
INSERT INTO QualityChecks (ProductID, EmployeeID, InspectionDate, Status, Remarks, Score) VALUES
(1, 1, '2024-01-01', 'Passed', 'No defects', 92),
(2, 2, '2024-01-02', 'Failed', 'Loose stitching', 45),
(3, 3, '2024-01-03', 'Passed', 'Perfect quality', 95),
(4, 4, '2024-01-04', 'Pending', 'Awaiting dye inspection', NULL),
(5, 5, '2024-01-05', 'Passed', 'Excellent fabric', 90),
(6, 6, '2024-01-06', 'Failed', 'Button missing', 48),
(7, 7, '2024-01-07', 'Passed', 'Good stitching', 88),
(8, 8, '2024-01-08', 'Passed', 'High quality', 91),
(9, 9, '2024-01-09', 'Pending', 'Awaiting final review', NULL),
(10, 10, '2024-01-10', 'Failed', 'Fabric discoloration', 40),
(11, 11, '2024-01-11', 'Passed', 'Passed stress test', 89),
(12, 12, '2024-01-12', 'Failed', 'Label misplaced', 43),
(13, 13, '2024-01-13', 'Passed', 'Meets standards', 87),
(14, 14, '2024-01-14', 'Passed', 'Quality assured', 93),
(15, 15, '2024-01-15', 'Pending', 'Awaiting packaging approval', NULL),
(16, 16, '2024-01-16', 'Passed', 'No issues found', 90),
(17, 17, '2024-01-17', 'Failed', 'Improper stitching', 49),
(18, 18, '2024-01-18', 'Passed', 'Well finished', 86),
(19, 19, '2024-01-19', 'Pending', 'Packaging damaged', NULL),
(20, 20, '2024-01-20', 'Passed', 'Meets export standards', 94);

-- QUERIES

--  Retrieve all products (no change needed)
SELECT * FROM Products;

-- Low stock raw materials — Add fallback or threshold
SELECT * FROM RawMaterials 
WHERE QuantityAvailable < 100 -- Use a higher threshold like 100
ORDER BY QuantityAvailable ASC;

-- Failed quality checks in a fixed test window
SELECT * FROM QualityChecks
WHERE Status = 'Failed' 
AND InspectionDate BETWEEN '2024-01-01' AND '2024-12-31';

-- Quality checks per product
SELECT P.ProductName, COUNT(Q.QualityCheckID) AS TotalChecks
FROM Products P
LEFT JOIN QualityChecks Q ON P.ProductID = Q.ProductID
GROUP BY P.ProductID;

-- Employees responsible for failed quality checks
SELECT DISTINCT E.FirstName, E.LastName
FROM Employees E
JOIN QualityChecks Q ON Q.EmployeeID = E.EmployeeID
WHERE Q.Status = 'Failed';

-- Products with raw materials via junction
SELECT P.ProductName, R.MaterialName
FROM ProductMaterials PM
JOIN Products P ON PM.ProductID = P.ProductID
JOIN RawMaterials R ON PM.MaterialID = R.MaterialID
ORDER BY P.ProductName;

-- Average score (exclude NULLs)
SELECT ProductID, AVG(Score) AS AverageScore
FROM QualityChecks
WHERE Score IS NOT NULL
GROUP BY ProductID;

-- Find Inspectors (no change needed)
SELECT * FROM Employees WHERE Role LIKE '%Inspector%';

-- Quality checks sorted
SELECT * FROM QualityChecks
ORDER BY InspectionDate DESC;

-- Total raw material quantity
SELECT SUM(QuantityAvailable) AS TotalQuantityUsed
FROM RawMaterials;

-- Most failed product (fallback with LIMIT 1)
SELECT ProductID, COUNT(*) AS Failures
FROM QualityChecks
WHERE Status = 'Failed'
GROUP BY ProductID
HAVING COUNT(*) > 0
ORDER BY Failures DESC
LIMIT 1;

-- Raw materials and suppliers (sorted)
SELECT MaterialName, SupplierName
FROM RawMaterials
ORDER BY MaterialName;

-- Checks with score below 50 (exclude NULLs)
SELECT * FROM QualityChecks
WHERE Score IS NOT NULL AND Score < 50;

-- Passed vs Failed check summary
SELECT ProductID,
COUNT(CASE WHEN Status = 'Passed' THEN 1 END) AS PassedChecks,
COUNT(CASE WHEN Status = 'Failed' THEN 1 END) AS FailedChecks
FROM QualityChecks
GROUP BY ProductID;

-- Highest average score (exclude NULLs)
SELECT ProductID, AVG(Score) AS AverageScore
FROM QualityChecks
WHERE Score IS NOT NULL
GROUP BY ProductID
ORDER BY AverageScore DESC
LIMIT 1;
