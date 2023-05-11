CREATE DATABASE ig1_store;
USE ig1_store;

CREATE TABLE roles (
	role_id INT PRIMARY KEY AUTO_INCREMENT,
    role_name VARCHAR(50) NOT NULL
);

CREATE TABLE account_users(
	account_id INT PRIMARY KEY AUTO_INCREMENT,
    user_name VARCHAR(50) UNIQUE NOT NULL,
    `password` VARCHAR(50) NOT NULL
);
CREATE TABLE users_role (
	role_id INT,
    account_id INT,
    PRIMARY KEY(role_id, account_id),
    FOREIGN KEY (role_id) REFERENCES roles(role_id),
    FOREIGN KEY(account_id) REFERENCES account_users(account_id)
);

CREATE TABLE customers(
	customer_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_name VARCHAR(50) NOT NULL,
    email VARCHAR(50) UNIQUE NOT NULL,
    phone_number VARCHAR(11) UNIQUE NOT NULL,
    address TEXT NOT NULL,
    account_id INT,
    create_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    update_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (account_id) REFERENCES account_users(account_id)
);

CREATE TABLE product_type(
	product_type_id INT PRIMARY KEY AUTO_INCREMENT,
    product_type_name VARCHAR(50) NOT NUll
);

CREATE TABLE products( 
	product_id INT PRIMARY KEY AUTO_INCREMENT,
    product_name VARCHAR(50) NOT NULL,
	product_type_id INT,
    `describe` TEXT NOT NULL,
    price LONG CHECK(price > 0),
    product_image_url TEXT NOT NULL,
    createAt DATETIME DEFAULT CURRENT_TIMESTAMP,
    updateAt DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY(product_type_id) REFERENCES product_type(product_type_id)
);

CREATE TABLE `orders`(
	order_id INT PRIMARY KEY AUTO_INCREMENT,
    order_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    customer_id INT,
    FOREIGN KEY(customer_id) REFERENCES customers(customer_id)
);

CREATE TABLE order_detail(
	order_detail_id INT PRIMARY KEY AUTO_INCREMENT,
    order_id INT,
    product_id INT NOT NULL,
	product_type_id INT NOT NULL,
    price DOUBLE CHECK(price >0),
    quantity INT check(quantity >0),
    order_detail_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY(order_id) REFERENCES `orders`(order_id),
    FOREIGN KEY(product_id) REFERENCES products(product_id)
);

INSERT INTO account_users (user_name,`password`) VALUES ("khanh", "khanh123"), ("thien", "thien123"), ("khang", "khang123"), ("hai", "hai123"),("admin", "admin123");
INSERT INTO customers (customer_name, email,phone_number,address,account_id) 
VALUES ("khanh","khanh@gmail.com", "0123456789","Quang Nam", 1),
("khang","khang@gmail.com", "1123456789","Quang Nam", 3),
("thien","thien@gmail.com", "0223456789","Quang Nam", 2),
("hai","hai@gmail.com", "0523456789","Quang Nam", 4);
INSERT INTO product_type (product_type_name) VALUES ("Phone"), ("Accessory");
INSERT INTO products (product_name, product_type_id, `describe`,price,product_image_url) 
VALUES ('Iphone X',1,'asd',123,'asd'),
('Iphone XS',1,'asd',123,'asd'),
('Tai nghe',2,'asd',123,'asd');
INSERT into `orders` (customer_id) VALUES (1);
INSERT INTO order_detail (order_id, product_id, product_type_id, price, quantity )
 VALUES (1,1,1,123,1),
 (1,2,1,123,1);

SELECT o.order_id, c.customer_id ,c.customer_name, SUM(od.price) as price_total , o.order_date
from customers as c 
inner join `orders` as o on c.customer_id = o.customer_id
INNER join order_detail as od on o.order_id = od.order_id
WHERE c.customer_id = 1
GROUP BY o.order_id;
-- INNER join products as p on od.product_id = p.product_id

SELECT * FROM account_users;

SELECT * FROM customers WHERE customer_id = 1;

INSERT INTO order_detail ()

SELECT * FROM orders WHERE customer_id = 8;


SELECT p.* 
FROM order_detail AS od 
INNER JOIN orders AS o ON od.order_id = o.order_id
INNER JOIN customers AS c ON o.customer_id = c.customer_id
INNER JOIN products AS p ON od.product_id = p.product_id
WHERE c.customer_id = 1;


SELECT r.role_name 
FROM users_role  AS u
INNER JOIN account_users AS ac ON u.account_id = ac.account_id
INNER JOIN roles AS r ON u.role_id = r.role_id
WHERE ac.account_id = 1;

SELECT c.*,ac.user_name, ac.password
FROM customers AS c
INNER JOIN account_users AS ac ON c.account_id = ac.account_id
WHERE customer_id = 1;

INSERT INTO `ig1_store`.`roles` (`role_id`, `role_name`) VALUES ('1', 'users');
INSERT INTO `ig1_store`.`roles` (`role_id`, `role_name`) VALUES ('2', 'admin');


INSERT INTO `ig1_store`.`users_role` (`role_id`, `account_id`) VALUES ('1', '1');
INSERT INTO `ig1_store`.`users_role` (`role_id`, `account_id`) VALUES ('1', '2');
INSERT INTO `ig1_store`.`users_role` (`role_id`, `account_id`) VALUES ('1', '3');
INSERT INTO `ig1_store`.`users_role` (`role_id`, `account_id`) VALUES ('1', '4');
INSERT INTO `ig1_store`.`users_role` (`role_id`, `account_id`) VALUES ('2', '5');




