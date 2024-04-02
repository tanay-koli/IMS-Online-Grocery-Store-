-- Retrieve all orders along with user details and total amount
SELECT Orders.OrderID, Users.Username, Users.Email, Orders.TotalAmount
FROM Orders
INNER JOIN Users ON Orders.UserID = Users.UserID;

-- Retrieve all products along with their suppliers:
SELECT Products.Name AS ProductName, Products.Description, Products.Price, Suppliers.Name AS SupplierName
FROM Products
INNER JOIN Suppliers ON Products.SupplierID = Suppliers.SupplierID;

-- Retrieve the average rating and total number of reviews for each product:
SELECT Products.ProductID, Products.Name, AVG(Reviews.Rating) AS AverageRating, COUNT(Reviews.ReviewID) AS TotalReviews
FROM Products
LEFT JOIN Reviews ON Products.ProductID = Reviews.ProductID
GROUP BY Products.ProductID, Products.Name;

-- Retrieve the top 5 products with the highest total sales amount:
SELECT Products.ProductID, Products.Name, SUM(OrderItems.Quantity * OrderItems.Price) AS TotalSalesAmount
FROM Products
INNER JOIN OrderItems ON Products.ProductID = OrderItems.ProductID
GROUP BY Products.ProductID, Products.Name
ORDER BY TotalSalesAmount DESC
LIMIT 5;

-- Retrieve the top 5 users with the highest total spending:
SELECT Users.UserID, Users.Username, SUM(Orders.TotalAmount) AS TotalSpending
FROM Users
INNER JOIN Orders ON Users.UserID = Orders.UserID
GROUP BY Users.UserID, Users.Username
ORDER BY TotalSpending DESC
LIMIT 5;

-- Retrieve the average order amount per month for the last year:
SELECT YEAR(OrderDate) AS Year, MONTH(OrderDate) AS Month, AVG(TotalAmount) AS AverageOrderAmount
FROM Orders
WHERE OrderDate >= DATE_SUB(CURRENT_DATE(), INTERVAL 1 YEAR)
GROUP BY YEAR(OrderDate), MONTH(OrderDate)
ORDER BY Year DESC, Month DESC;

-- Retrieve users who have placed orders but have not yet paid:
SELECT DISTINCT Users.UserID, Users.Username
FROM Users
INNER JOIN Orders ON Users.UserID = Orders.UserID
LEFT JOIN Payments ON Orders.OrderID = Payments.OrderID
WHERE Payments.OrderID IS NULL;

-- Retrieve the top 3 categories with the highest total sales amount:
SELECT Categories.Name AS CategoryName, SUM(OrderItems.Quantity * OrderItems.Price) AS TotalSalesAmount
FROM Categories
INNER JOIN ProductCategories ON Categories.CategoryID = ProductCategories.CategoryID
INNER JOIN Products ON ProductCategories.ProductID = Products.ProductID
INNER JOIN OrderItems ON Products.ProductID = OrderItems.ProductID
GROUP BY Categories.Name
ORDER BY TotalSalesAmount DESC
LIMIT 3;

-- Retrieve the products along with the count of reviews they have received:
SELECT Products.ProductID, Products.Name, COUNT(Reviews.ReviewID) AS ReviewCount
FROM Products
LEFT JOIN Reviews ON Products.ProductID = Reviews.ProductID
GROUP BY Products.ProductID, Products.Name;

-- Retrieve users who have placed orders within the last month and have not yet received their deliveries:
SELECT DISTINCT Users.UserID, Users.Username
FROM Users
INNER JOIN Orders ON Users.UserID = Orders.UserID
LEFT JOIN Delivery ON Orders.OrderID = Delivery.OrderID
WHERE Orders.OrderDate >= DATE_SUB(CURRENT_DATE(), INTERVAL 1 MONTH)
AND Delivery.DeliveryID IS NULL;

-- Retrieve the top 3 most purchased products by quantity:
SELECT Products.ProductID, Products.Name, SUM(OrderItems.Quantity) AS TotalQuantitySold
FROM Products
INNER JOIN OrderItems ON Products.ProductID = OrderItems.ProductID
GROUP BY Products.ProductID, Products.Name
ORDER BY TotalQuantitySold DESC
LIMIT 3;

-- Retrieve users who have not made any purchases:
SELECT Users.UserID, Users.Username
FROM Users
LEFT JOIN Orders ON Users.UserID = Orders.UserID
WHERE Orders.OrderID IS NULL;

-- Retrieve the products with a quantity available less than the average quantity available across all products:
SELECT ProductID, Name, QuantityAvailable
FROM Products
WHERE QuantityAvailable < (SELECT AVG(QuantityAvailable) FROM Products);

-- Retrieve the total number of orders placed per month in the last year:
SELECT YEAR(OrderDate) AS Year, MONTH(OrderDate) AS Month, COUNT(OrderID) AS TotalOrders
FROM Orders
WHERE OrderDate >= DATE_SUB(CURRENT_DATE(), INTERVAL 1 YEAR)
GROUP BY YEAR(OrderDate), MONTH(OrderDate)
ORDER BY Year DESC, Month DESC;






