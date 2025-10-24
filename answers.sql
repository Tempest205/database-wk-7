
--  Question 1: Achieving 1NF (First Normal Form)
-- Step 1: Create the original (unnormalized) table
CREATE TABLE ProductDetail (
    OrderID INT,
    CustomerName VARCHAR(100),
    Products VARCHAR(100)
);

-- Step 2: Insert sample data
INSERT INTO ProductDetail VALUES
(101, 'John Doe', 'Laptop, Mouse'),
(102, 'Jane Smith', 'Tablet, Keyboard, Mouse'),
(103, 'Emily Clark', 'Phone');

-- Step 3: Transform into 1NF 
CREATE TABLE ProductDetail_1NF AS
SELECT 101 AS OrderID, 'John Doe' AS CustomerName, 'Laptop' AS Product
UNION ALL
SELECT 101, 'John Doe', 'Mouse'
UNION ALL
SELECT 102, 'Jane Smith', 'Tablet'
UNION ALL
SELECT 102, 'Jane Smith', 'Keyboard'
UNION ALL
SELECT 102, 'Jane Smith', 'Mouse'
UNION ALL
SELECT 103, 'Emily Clark', 'Phone';


-- Question 2: Achieving 2NF (Second Normal Form)
-- Step 1: Create the original table (already in 1NF)
CREATE TABLE OrderDetails (
    OrderID INT,
    CustomerName VARCHAR(100),
    Product VARCHAR(50),
    Quantity INT
);

-- Step 2: Insert sample data
INSERT INTO OrderDetails VALUES
(101, 'John Doe', 'Laptop', 2),
(101, 'John Doe', 'Mouse', 1),
(102, 'Jane Smith', 'Tablet', 3),
(102, 'Jane Smith', 'Keyboard', 1),
(102, 'Jane Smith', 'Mouse', 2),
(103, 'Emily Clark', 'Phone', 1);

-- Step 3: Transform into 2NF
-- (a) Orders table (removes partial dependency)
CREATE TABLE Orders AS
SELECT DISTINCT
    OrderID,
    CustomerName
FROM OrderDetails;

-- (b) OrderItems table (fully depends on both OrderID and Product)
CREATE TABLE OrderItems AS
SELECT
    OrderID,
    Product,
    Quantity
FROM OrderDetails;

