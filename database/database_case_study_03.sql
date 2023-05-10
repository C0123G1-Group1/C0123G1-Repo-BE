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
CREATE TABLE accessory(
	accessory_id INT PRIMARY KEY AUTO_INCREMENT,
    accessory_name VARCHAR(50) NOT NULL,
    accessory_price DOUBLE CHECK(accessory_price > 0),
    image_accessory TEXT NOT NULL,
    create_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    update_at DATETIME DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE `order`(
	order_id INT PRIMARY KEY AUTO_INCREMENT,
    order_date DATETIME,
    customer_id INT,
    product_id INT,
    price_order LONG ,
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

INSERT INTO account_users (user_name,`password`) VALUES ("admin", "admin123"),
														("khanh", "khanh123"), ("thien", "thien123"),
														("khang", "khang123"), ("hai", "hai123"),
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
INSERT INTO product_type (product_type_name) VALUES ("Iphone"), ("SamSung"), ("Vivo"), ("Asus");

SELECT*FROM customers;
DELETE FROM customers WHERE customer_id=4;
SELECT c.*,ac.account_id,ac.user_name,ac.password FROM customers AS c 
INNER JOIN account_users AS ac ON c.account_id=ac.account_id;

SELECT*FROM account_users;
DELETE FROM account_users WHERE user_name="hai";
INSERT INTO account_users (user_name,password) VALUE("hoa","1234");
SELECT c.*,ac.account_id,ac.user_name,ac.password FROM customers AS c 
INNER JOIN account_users AS ac ON c.account_id=ac.account_id WHERE customer_name LIKE "%ie%" AND address LIKE "%Quang%" ;
SELECT*FROM customers WHERE customer_name LIKE "%ie%" AND address LIKE "%Quang%" ;