-- 1. Create Database
 CREATE DATABASE ushanga_inventory;
USE ushanga_inventory;

-- 2. Categories Table
CREATE TABLE Categories (
    category_id INT AUTO_INCREMENT PRIMARY KEY,
    category_name VARCHAR(255) UNIQUE NOT NULL
);

-- 3. Products Table
CREATE TABLE Products (
    product_id INT AUTO_INCREMENT PRIMARY KEY,
    product_name VARCHAR(255) NOT NULL,
    description TEXT,
    price DECIMAL(10, 2) NOT NULL,
    stock_quantity INT NOT NULL,
    category_id INT,
    FOREIGN KEY (category_id) REFERENCES Categories(category_id)
);

-- 4. Customers Table
CREATE TABLE Customers (
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_name VARCHAR(255) NOT NULL,
    contact_info VARCHAR(255),
    location VARCHAR(255)
);

-- 5. Orders Table
CREATE TABLE Orders (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT,
    order_date DATE NOT NULL,
    total_amount DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);

-- 6. Order_Items Table
CREATE TABLE Order_Items (
    order_id INT,
    product_id INT,
    quantity INT NOT NULL,
    price DECIMAL(10, 2) NOT NULL,
    PRIMARY KEY (order_id, product_id),
    FOREIGN KEY (order_id) REFERENCES Orders(order_id),
    FOREIGN KEY (product_id) REFERENCES Products(product_id)
);

-- 7. Raw_Materials Table
CREATE TABLE Raw_Materials (
    material_id INT AUTO_INCREMENT PRIMARY KEY,
    material_name VARCHAR(255) NOT NULL,
    material_type ENUM('Bead', 'Thread', 'Fastener') NOT NULL,
    unit VARCHAR(50) NOT NULL
);

-- 8. Bead_Colors Table
CREATE TABLE Bead_Colors (
    color_id INT AUTO_INCREMENT PRIMARY KEY,
    color_name VARCHAR(255) NOT NULL,
    color_group VARCHAR(255)
);

-- 9. Material_Stock Table
CREATE TABLE Material_Stock (
    material_id INT,
    color_id INT,
    quantity_remaining DECIMAL(10, 2) NOT NULL,
    container_volume DECIMAL(10, 2) NOT NULL,
    storage_location VARCHAR(255),
    PRIMARY KEY (material_id, color_id),
    FOREIGN KEY (material_id) REFERENCES Raw_Materials(material_id),
    FOREIGN KEY (color_id) REFERENCES Bead_Colors(color_id)
);

-- 10. Suppliers Table 
CREATE TABLE Suppliers (
    supplier_id INT AUTO_INCREMENT PRIMARY KEY,
    supplier_name VARCHAR(255) NOT NULL,
    contact_info VARCHAR(255)
);



