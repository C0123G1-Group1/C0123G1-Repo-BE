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


INSERT INTO account_users (user_name,`password`) VALUES 
                                                         ("hoa", "hoa123"), ("an", "an123"),
														("bao", "bao123"), ("cuong", "cuong123"),
                                                         ("dung", "dung123"), ("chau", "chau123"),
														("nga", "nga123"), ("toan", "toan123"),
                                                         ("van", "van123"), ("vu", "vu123"),
														("thang", "thang123"), ("vien", "vien123"),
														("dinh", "dinh123"), ("nam", "nam123"),
														("chien", "chien123"),("nhan", "nhan123"),
														("vuong", "vuong123"), ("tu", "tu123"),
														("tuan", "tuan123"), ("tuyet", "tuyet123"),
														("mai", "mai123"), ("mai2", "mai123");
INSERT INTO customers (customer_name, email,phone_number,address,account_id)
VALUES ("Kiều Quốc Khánh","quockhanh@gmail.com", "0123456001","Quảng Nam", 2),
("Nguyễn Trung Thiện","trungthien@gmail.com", "0123456002","Quảng Nam", 3),
("Phan Vũ An Khang","ankhang@gmail.com", "0123456003","Đà Nẵng", 4),
("Doản Thanh Hải","nguyehai@gmail.com", "0123456004","Quảng Nam", 5),
("Trương Quốc Hòa","quochoa@gmail.com", "0123456005","Đà Nẵng", 6),
("Hồ Trường An","truongan@gmail.com", "0123456006","Đà Nẵng", 7),
("Nguyễn Quốc Bảo","quocbao@gmail.com", "0123456007","Bình Định", 8),
("Tiểu Cường","tieucuong@gmail.com", "0123456008","HongKong", 9),
("Nguyễn Trung Dũng","trungdung@gmail.com", "0123456009","Hà Nội", 10),
("Nguyễn Thị Châu","nguyenchau@gmail.com", "0123456010","Gia Lai", 11),
("Kiều Nguyệt Nga","nguyetnga@gmail.com", "0123456011","Ninh Bình", 12),
("Bùi Toàn","buitoan@gmail.com", "0123456012","Lâm Đồng", 13),
("Bùi Thúy Vân","thuyvan@gmail.com", "0123456013","Quảng Nam", 14),
("Nguyễn Quốc Vũ","quocvu@gmail.com", "0123456014","Quảng Nam", 15),
("Nguyễn Viết Thắng","thang@gmail.com", "0123456015","Sơn La", 16),
("Hồ Viễn","hovien@gmail.com", "0123456016","Huế", 17),
("Nguyễn Đức Định","ducinh@gmail.com", "0123456017","Quảng Nam", 18),
("Lý Văn Nam","vannam@gmail.com", "0123456018","Thanh Hóa", 19),
("Hà Thái Chiến","thaichien@gmail.com", "0123456019","Bình Thuận", 20),
("Đỗ Thành Nhân","thanhnhan@gmail.com", "0123456020","Huế", 21),
("Đỗ Vương","dovuong@gmail.com", "0123456021","Hà Nam", 22),
("Đỗ Tứ","dotu@gmail.com", "0123456022","Hà Giang", 23),
("Nguyễn Anh Tuấn","anhtuan@gmail.com", "0123456023","Đà Nẵng", 24),
("Ngô Thị Ánh Tuyết","anhtuyet@gmail.com", "0123456024","Quảng Nam", 25),
("Trương Hà Mai","hamai@gmail.com", "0123456025","Nghệ An", 26),
("Nguyễn Thảo Mai","thaomai@gmail.com", "0123456026","Thái Bình", 27);

