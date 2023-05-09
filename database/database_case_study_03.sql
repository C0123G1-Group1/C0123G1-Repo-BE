CREATE DATABASE ig1_store;
USE ig1_store;

CREATE TABLE account_customer(
	account_id INT PRIMARY KEY AUTO_INCREMENT,
    user_name VARCHAR(50) UNIQUE NOT NULL,
    `password` VARCHAR(50) NOT NULL
);


CREATE TABLE customers(
	customer_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_name VARCHAR(50) NOT NULL,
    email VARCHAR(50) UNIQUE NOT NULL,
    phone_number VARCHAR(11) UNIQUE NOT NULL,
    address VARCHAR(250) NOT NULL,
    account_id INT,
    createAt DATETIME NOT NULL,
    updateAt DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (account_id) REFERENCES account_customer(account_id)
);

CREATE TABLE product_type(
	product_type_id INT PRIMARY KEY AUTO_INCREMENT,
    product_type_name VARCHAR(50) NOT NUll
);

CREATE TABLE products(
	product_id INT PRIMARY KEY AUTO_INCREMENT,
    product_name VARCHAR(50) NOT NULL,
	product_type_id INT,
    `describe` VARCHAR(50) NOT NULL,
    price DOUBLE CHECK(price > 0),
    product_image_url VARCHAR(250) NOT NULL,
    createAt DATETIME NOT NULL,
    updateAt DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY(product_type_id) REFERENCES product_type(product_type_id)
);
CREATE TABLE accessory(
	accessory_id INT PRIMARY KEY AUTO_INCREMENT,
    accessory_name VARCHAR(50) NOT NULL,
    accessory_price DOUBLE CHECK(accessory_price > 0),
    image_accessory VARCHAR(250),
    createAt DATETIME NOT NULL,
    updateAt DATETIME NOT NULL
);

CREATE TABLE `order`(
	order_id INT PRIMARY KEY AUTO_INCREMENT,
    order_date DATETIME,
    customer_id INT,
    product_id INT,
    FOREIGN KEY(customer_id) REFERENCES customers(customer_id),
    FOREIGN KEY(product_id) REFERENCES products(product_id)
);

CREATE TABLE order_detail(
	order_detail_id INT PRIMARY KEY AUTO_INCREMENT,
    order_id INT,
	order_detail_date DATETIME,
    accessory_id INT,
    FOREIGN KEY(order_id) REFERENCES `order`(order_id),
    FOREIGN KEY(accessory_id) REFERENCES accessory(accessory_id)
);
INSERT INTO product_type (product_type_name) VALUES ("Iphone"),("SamSung"),("Vivo"),("Asus"),("OPPO");
