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
    FOREIGN KEY (account_id) REFERENCES account_customer(account_id)
);

CREATE TABLE product_type(
	product_type_id INT PRIMARY KEY AUTO_INCREMENT,
    product_type_name VARCHAR(50) NOT NUll
);

CREATE TABLE products(
	product_id INT PRIMARY KEY,
    product_name VARCHAR(50) NOT NULL,
	product_type_id INT,
    `describe` VARCHAR(50) NOT NULL,
    price DOUBLE CHECK(price > 0),
    product_image_url VARCHAR(250) NOT NULL,
    FOREIGN KEY(product_type_id) REFERENCES product_type(product_type_id)
);
CREATE TABLE accessory(
	accessory_id INT PRIMARY KEY AUTO_INCREMENT,
    accessory_name VARCHAR(50) NOT NULL,
    accessory_price DOUBLE CHECK(accessory_price > 0)
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
    accessory_id INT,
    FOREIGN KEY(order_id) REFERENCES `order`(order_id),
    FOREIGN KEY(accessory_id) REFERENCES accessory(accessory_id)
);

-- INSERT INTO product_type (product_type_name) VALUES ("Iphone"),("SamSung");
-- INSERT INTO products (product_id,product_name,product_type_id,`describe`,price,product_image_url) 
-- VALUES ("Iphone XS MAX",20,1,"Mau nho"),
-- 	   ("Iphone 12 Pro MA",25,1,"Mau do");
-- INSERT INTO account_customer (user_name,`password`) 
-- VALUES ("khanh","khanh123"),
-- 		("khang","khang123");
--         
-- INSERT INTO customers(customer_name, email, phone_number, address, account_id ) 
-- VALUES ("Kieu Quoc Khanh", "khanhkieu098@gmail.com","0338410349","Duy Xuyen, Quang Nam",1),
-- 		("Phan Vu An Khang", "ankhang@gmail.com","0438710349","Da Nang",2)
-- ;

-- INSERT INTO `order`(order_date,customer_id,product_id) 
-- VALUES(curdate(),2,1),
-- 	(curdate(),2,2);
--     
-- INSERT INTO accessory (accessory_name, accessory_price) VALUES("Tai nghe sony", 10),("Cuc sac 1000W", 5);

-- INSERT INTO order_detail (order_id,accessory_id) VALUES (1,1) ,(1,2);

-- SELECT c.customer_name,p.product_name FROM customers AS c
-- INNER JOIN `order` AS o ON c.customer_id = o.customer_id
-- INNER JOIN order_detail AS od ON o.order_id = od.order_id
-- INNER JOIN products AS p ON o.product_id = p.product_id;

-- SELECT * FROM products WHERE product_name LIKE "%Iphone%";
-- DELETE FROM products WHERE product_id = 13 ;

-- UPDATE products set product_name = "q", product_type_id = 2, `describe` = "q", price = 2, product_image_url ="q" WHERE product_id = 3;


