CREATE DATABASE shopapp;
USE shopapp;
-- Khách hàng khi muốn mua hàng=> phải có tài khoản=> bảng users
CREATE TABLE users(
    id INT PRIMARY KEY AUTO_INCREMENT,
    fullname VARCHAR(100) DEFAULT '',
    phone_number VARCHAR(10) NOT NULL,
    address VARCHAR(200) DEFAULT '',
    password VARCHAR(100) NOT NULL DEFAULT '', -- mật khẩu đã mẫ hoá
    created_at DATETIME,
    updated_at DATETIME,
    is_active  TINYINT(1) DEFAULT 1,
    date_of_birth DATE,
    facebook_account_id INT DEFAULT 0,
    google_account_id INT DEFAULT 0
);

CREATE TABLE roles(
    id INT PRIMARY KEY,
    name VARCHAR(20) NOT NULL
);
b b
CREATE TABLE tokens(
    id int PRIMARY KEY AUTO_INCREMENT,
    token VARCHAR(255) UNIQUE NOT NULL,
    token_type VARCHAR(50) NOT NULL,
    expiration_date DATETIME,
    revoked TINYINT(1) NOT NULL,
    expired TINYINT(1) NOT NULL,
    user_id int,
    FOREIGN KEY (user_id) REFERENCES users(id)
    );

--hỗ trợ đăng nhập từ Facebook và Google
CREATE TABLE social_accounts(
    id INT PRIMARY KEY AUTO_INCREMENT,
    provider VARCHAR(20) NOT NULL COMMENT'Tên nhà social network',
    provide_id VARCHAR(50) NOT NULL,
    email VARCHAR(150) NOT NULL COMMENT'Email tài khoản',
    name VARCHAR(100) NOT NULL COMMENT ' Tên người dùng',
    user_id int,
    FOREIGN KEY (user_id) REFERENCES users(id)
);

--Bảng danh mục sản phẩm(Category)
CREATE TABLE categories(
    id INT PRIMARY KEY AUTO_INCREMENT,
    name varchar(100) NOT NULL DEFAULT ''COMMENT' Tên danh mục, vd: đồ điện tử'
);
--Bảng chứa sản phẩm(Product): "laptop macbook air 15 inch 2023", iphone 15 pro,...
CREATE TABLE products(
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(350) COMMENT 'Tên sản phẩm',
    price FLOAT NOT NULL CHECK(price=>0),
    thumbnail VARCHAR(300) DEFAULT '',
    description LONGTEXT DEFAULT '' ,
    created_at TIMESTAMP,
    updated_at TIMESTAMP,
    category_id INT,
    FOREIGN KEY (category_id) REFERENCES categories(id)
);
