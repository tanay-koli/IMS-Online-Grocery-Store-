-- Add data to Users table
INSERT INTO Users (UserID, Username, Email, Password, Phone)
VALUES 
    (1, 'john_doe', 'john@example.com', 'password123', '123-456-7890'),
    (2, 'jane_smith', 'jane@example.com', 'pass321word', '987-654-3210'),
    (3, 'bob_jones', 'bob@example.com', 'secret456', '555-555-5555'),
    (4, 'emily_davis', 'emily@example.com', 'p@ssw0rd', '111-222-3333'),
    (5, 'mike_wilson', 'mike@example.com', 'qwerty', '999-888-7777');

-- Add data to Addresses table
INSERT INTO Addresses (AddressID, UserID, Address, City, State, ZipCode)
VALUES
    (1, 1, '123 Main St', 'Springfield', 'IL', '62701'),
    (2, 2, '456 Elm St', 'Anytown', 'NY', '12345'),
    (3, 3, '789 Oak St', 'Smalltown', 'CA', '98765'),
    (4, 4, '321 Pine St', 'Bigcity', 'TX', '54321'),
    (5, 5, '555 Cedar St', 'Metropolis', 'FL', '12345');

-- Add data to Orders table
INSERT INTO Orders (OrderID, UserID, TotalAmount)
VALUES
    (1, 1, 50.00),
    (2, 2, 75.00),
    (3, 3, 100.00),
    (4, 4, 25.00),
    (5, 5, 60.00);

-- Add data to Payments table
INSERT INTO Payments (PaymentID, UserID, OrderID, Amount, PaymentMethod)
VALUES
    (1, 1, 1, 50.00, 'Credit Card'),
    (2, 2, 2, 75.00, 'PayPal'),
    (3, 3, 3, 100.00, 'Credit Card'),
    (4, 4, 4, 25.00, 'Debit Card'),
    (5, 5, 5, 60.00, 'Cash');

-- Add data to Cart table
INSERT INTO Cart (CartID, UserID, ProductID, Quantity)
VALUES
    (1, 1, 101, 2),
    (2, 2, 102, 1),
    (3, 3, 103, 3),
    (4, 4, 104, 1),
    (5, 5, 105, 2);

-- Add data to Products table
INSERT INTO Products (ProductID, Name, Description, Price, QuantityAvailable, SupplierID)
VALUES
    (101, 'Product A', 'Description for Product A', 10.00, 50, 1),
    (102, 'Product B', 'Description for Product B', 15.00, 75, 2),
    (103, 'Product C', 'Description for Product C', 20.00, 100, 3),
    (104, 'Product D', 'Description for Product D', 5.00, 25, 4),
    (105, 'Product E', 'Description for Product E', 12.00, 60, 5);

-- Add data to Suppliers table
INSERT INTO Suppliers (SupplierID, Name, ContactName, Email, Phone, Address)
VALUES
    (1, 'Supplier 1', 'John Supplier', 'supplier1@example.com', '111-111-1111', '123 Supplier St'),
    (2, 'Supplier 2', 'Jane Supplier', 'supplier2@example.com', '222-222-2222', '456 Supplier St'),
    (3, 'Supplier 3', 'Bob Supplier', 'supplier3@example.com', '333-333-3333', '789 Supplier St'),
    (4, 'Supplier 4', 'Emily Supplier', 'supplier4@example.com', '444-444-4444', '321 Supplier St'),
    (5, 'Supplier 5', 'Mike Supplier', 'supplier5@example.com', '555-555-5555', '555 Supplier St');

-- Add data to Categories table
INSERT INTO Categories (CategoryID, Name)
VALUES
    (1, 'Category 1'),
    (2, 'Category 2'),
    (3, 'Category 3'),
    (4, 'Category 4'),
    (5, 'Category 5');

-- Add data to OrderItems table
INSERT INTO OrderItems (OrderItemID, OrderID, ProductID, Quantity, Price)
VALUES
    (1, 1, 101, 2, 20.00),
    (2, 2, 102, 1, 15.00),
    (3, 3, 103, 3, 60.00),
    (4, 4, 104, 1, 5.00),
    (5, 5, 105, 2, 24.00);

-- Add data to Reviews table
INSERT INTO Reviews (ReviewID, UserID, ProductID, Rating, Comment, Date)
VALUES
    (1, 1, 101, 4, 'Great product!', '2024-03-30'),
    (2, 2, 102, 5, 'Awesome!', '2024-03-29'),
    (3, 3, 103, 3, 'Average product.', '2024-03-28'),
    (4, 4, 104, 2, 'Not satisfied.', '2024-03-27'),
    (5, 5, 105, 4, 'Good value for money.', '2024-03-26');

-- Add data to Coupons table
INSERT INTO Coupons (CouponID, Code, Discount, ExpiryDate)
VALUES
    (1, 'SAVE10', 10.00, '2024-04-30'),
    (2, 'DISCOUNT20', 20.00, '2024-05-15'),
    (3, 'SALE50', 50.00, '2024-06-30'),
    (4, 'HALFOFF', 50.00, '2024-04-15'),
    (5, 'BUYONEGETONE', 100.00, '2024-04-01');

-- Add data to Subscriptions table
INSERT INTO Subscriptions (SubscriptionID, UserID, ProductID, StartDate, EndDate, Status)
VALUES
    (1, 1, 101, '2024-04-01', '2024-04-30', 'Active'),
    (2, 2, 102, '2024-04-01', '2024-05-01', 'Active'),
    (3, 3, 103, '2024-04-01', '2024-06-01', 'Active'),
    (4, 4, 104, '2024-04-01', '2024-04-30', 'Active'),
    (5, 5, 105, '2024-04-01', '2024-04-15', 'Active');

-- Add data to Delivery table
INSERT INTO Delivery (DeliveryID, OrderID, UserID, DeliveryDate, Status)
VALUES
    (1, 1, 1, '2024-04-05 10:00:00', 'Delivered'),
    (2, 2, 2, '2024-04-06 09:00:00', 'In Transit'),
    (3, 3, 3, '2024-04-07 11:00:00', 'Processing'),
    (4, 4, 4, '2024-04-08 14:00:00', 'Delivered'),
    (5, 5, 5, '2024-04-09 13:00:00', 'In Transit');

-- Add data to ProductCategories table
INSERT INTO ProductCategories (ProductID, CategoryID)
VALUES
    (101, 1),
    (102, 2),
    (103, 3),
    (104, 4),
    (105, 5);

-- Add data to OrderCoupons table
INSERT INTO OrderCoupons (OrderID, CouponID)
VALUES
    (1, 1),
    (2, 2),
    (3, 3),
    (4, 4),
    (5, 5);
