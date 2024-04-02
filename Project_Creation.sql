-- Create the database
CREATE DATABASE IF NOT EXISTS big_basket_db;

-- Use the created database
USE big_basket_db;

-- Create Users table
CREATE TABLE IF NOT EXISTS Users (
    UserID INT PRIMARY KEY,
    Username VARCHAR(255) NOT NULL,
    Email VARCHAR(255) NOT NULL,
    Password VARCHAR(255) NOT NULL,
    Phone VARCHAR(20) NOT NULL
);

-- Create Addresses table
CREATE TABLE IF NOT EXISTS Addresses (
    AddressID INT PRIMARY KEY,
    UserID INT,
    Address VARCHAR(255) NOT NULL,
    City VARCHAR(100) NOT NULL,
    State VARCHAR(100) NOT NULL,
    ZipCode VARCHAR(20) NOT NULL,
    FOREIGN KEY (UserID) REFERENCES Users(UserID)
);

-- Create Orders table
CREATE TABLE IF NOT EXISTS Orders (
    OrderID INT PRIMARY KEY,
    UserID INT,
    OrderDate DATETIME DEFAULT CURRENT_TIMESTAMP,
    TotalAmount DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (UserID) REFERENCES Users(UserID)
);

-- Create Payments table
CREATE TABLE IF NOT EXISTS Payments (
    PaymentID INT PRIMARY KEY,
    UserID INT,
    OrderID INT,
    PaymentDate DATETIME DEFAULT CURRENT_TIMESTAMP,
    Amount DECIMAL(10,2) NOT NULL,
    PaymentMethod VARCHAR(50) NOT NULL,
    FOREIGN KEY (UserID) REFERENCES Users(UserID),
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID)
);

-- Create Cart table
CREATE TABLE IF NOT EXISTS Cart (
    CartID INT PRIMARY KEY,
    UserID INT,
    ProductID INT,
    Quantity INT NOT NULL,
    FOREIGN KEY (UserID) REFERENCES Users(UserID)
);

-- Create Products table
CREATE TABLE IF NOT EXISTS Products (
    ProductID INT PRIMARY KEY,
    Name VARCHAR(255) NOT NULL,
    Description TEXT,
    Price DECIMAL(10,2) NOT NULL,
    QuantityAvailable INT NOT NULL,
    SupplierID INT,
    FOREIGN KEY (SupplierID) REFERENCES Suppliers(SupplierID)
);

-- Create Suppliers table
CREATE TABLE IF NOT EXISTS Suppliers (
    SupplierID INT PRIMARY KEY,
    Name VARCHAR(255) NOT NULL,
    ContactName VARCHAR(255),
    Email VARCHAR(255) NOT NULL,
    Phone VARCHAR(20) NOT NULL,
    Address VARCHAR(255) NOT NULL
);

-- Create Categories table
CREATE TABLE IF NOT EXISTS Categories (
    CategoryID INT PRIMARY KEY,
    Name VARCHAR(255) NOT NULL
);

-- Create OrderItems table
CREATE TABLE IF NOT EXISTS OrderItems (
    OrderItemID INT PRIMARY KEY,
    OrderID INT,
    ProductID INT,
    Quantity INT NOT NULL,
    Price DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

-- Create Reviews table
CREATE TABLE IF NOT EXISTS Reviews (
    ReviewID INT PRIMARY KEY,
    UserID INT,
    ProductID INT,
    Rating INT NOT NULL,
    Comment TEXT,
    Date DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (UserID) REFERENCES Users(UserID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

-- Create Coupons table
CREATE TABLE IF NOT EXISTS Coupons (
    CouponID INT PRIMARY KEY,
    Code VARCHAR(50) NOT NULL,
    Discount DECIMAL(5,2) NOT NULL,
    ExpiryDate DATE NOT NULL
);

-- Create Subscriptions table
CREATE TABLE IF NOT EXISTS Subscriptions (
    SubscriptionID INT PRIMARY KEY,
    UserID INT,
    ProductID INT,
    StartDate DATE NOT NULL,
    EndDate DATE NOT NULL,
    Status VARCHAR(20) NOT NULL,
    FOREIGN KEY (UserID) REFERENCES Users(UserID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

-- Create Delivery table
CREATE TABLE IF NOT EXISTS Delivery (
    DeliveryID INT PRIMARY KEY,
    OrderID INT,
    UserID INT,
    DeliveryDate DATETIME,
    Status VARCHAR(20) NOT NULL,
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
    FOREIGN KEY (UserID) REFERENCES Users(UserID)
);

-- Establish Many-to-Many relationship between Products and Categories
CREATE TABLE IF NOT EXISTS ProductCategories (
    ProductID INT,
    CategoryID INT,
    PRIMARY KEY (ProductID, CategoryID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID),
    FOREIGN KEY (CategoryID) REFERENCES Categories(CategoryID)
);

-- Establish Many-to-Many relationship between Coupons and Orders
CREATE TABLE IF NOT EXISTS OrderCoupons (
    OrderID INT,
    CouponID INT,
    PRIMARY KEY (OrderID, CouponID),
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
    FOREIGN KEY (CouponID) REFERENCES Coupons(CouponID)
);
