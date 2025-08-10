-- 1. Create the table Customers if it does not exist
CREATE TABLE 
IF DOES NOT EXIST Customers 
(
    CustomerID INT PRIMARY KEY,
    CustomerName VARCHAR(50),
    Country VARCHAR(50),
    Product VARCHAR(50),
    Quantity INT,
    PurchaseAmount DECIMAL(10, 2)
);

-- 2. Insert sample data
INSERT INTO Customers 
  (CustomerID, CustomerName, Country, Product, Quantity, PurchaseAmount) 
VALUES
(1, 'Alice Morgan', 'USA', 'Laptops', 5, 2500.00),
(2, 'Andrew White', 'UK', 'Smartphones', 8, 4000.00),
(3, 'George Orwell', 'Canada', 'Tablets', 3, 1500.00),
(4, 'Laura Thompson', 'Germany', 'Smartphones', 10, 5000.00),
(5, 'Aaron Ford', 'USA', 'Laptops', 7, 3500.00),
(6, 'Victor Stone', 'UK', 'Headphones', 15, 1500.00),
(7, 'Amara Collins', 'France', 'Tablets', 4, 2000.00),
(8, 'Doris Parker', 'Canada', 'Smartphones', 6, 3000.00);

-- 3. Customers whose name starts with 'A'
SELECT *
FROM Customers
WHERE CustomerName LIKE 'A%';

-- 4. Customers whose name contains 'or'
SELECT *
FROM Customers
WHERE CustomerName LIKE '%or%';

-- 5. Total purchase amount per country
SELECT Country, SUM(PurchaseAmount) AS Total_Sales
FROM Customers
GROUP BY Country
ORDER BY Total_Sales DESC;

-- 6. Average quantity of products per country
SELECT Country, AVG(Quantity) AS Average_Quantity
FROM Customers
GROUP BY Country
ORDER BY Average_Quantity DESC;

-- 7. Number of customers per country
SELECT Country, COUNT(*) AS Total_Customers
FROM Customers
GROUP BY Country
ORDER BY Total_Customers DESC;

-- 8. Lowest purchase amount per country
SELECT Country, MIN(PurchaseAmount) AS Minimum_Purchase
FROM Customers
GROUP BY Country
ORDER BY Minimum_Purchase ASC;

-- 9. Highest purchase amount per country
SELECT Country, MAX(PurchaseAmount) AS Maximum_Purchase
FROM Customers
GROUP BY Country
ORDER BY Maximum_Purchase DESC;

-- 10. Countries with total sales above 4000
SELECT Country, SUM(PurchaseAmount) AS Total_Sales
FROM Customers
GROUP BY Country
HAVING SUM(PurchaseAmount) > 4000
ORDER BY Total_Sales DESC;
