CREATE TABLE cart (
    cart_id INT AUTO_INCREMENT PRIMARY KEY,
    total_price BIGINT,
    create_time TIMESTAMP,
    update_time TIMESTAMP,
    user_id INT,
    FOREIGN KEY (user_id) REFERENCES users(user_id)
);

CREATE TABLE cart_item (
    cart_item_id INT AUTO_INCREMENT PRIMARY KEY,
    cart_id INT,
    price BIGINT,
    quantity INT,
    product_id INT,
    FOREIGN KEY (cart_id) REFERENCES cart(cart_id),
    FOREIGN KEY (product_id) REFERENCES product(product_id)
);

CREATE TABLE category (
    category_id INT AUTO_INCREMENT PRIMARY KEY,
    category_name VARCHAR(30)
);

CREATE TABLE order_items (
    order_item_id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT,
    product_id INT,
    quantity INT,
    price BIGINT,
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (product_id) REFERENCES product(product_id)
);

CREATE TABLE orders (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    order_date TIMESTAMP,
    total_price BIGINT,
    status VARCHAR(20),
    FOREIGN KEY (user_id) REFERENCES users(user_id)
);

CREATE TABLE product (
    product_id INT AUTO_INCREMENT PRIMARY KEY,
    color VARCHAR(6),
    size VARCHAR(5),
    product_name VARCHAR(50),
    category_id INT,
    seller_id INT,
    model_number VARCHAR(10),
    price BIGINT,
    quantity INT,
    image_blob LONGBLOB,
    FOREIGN KEY (category_id) REFERENCES category(category_id),
    FOREIGN KEY (seller_id) REFERENCES users(user_id)
);

CREATE TABLE users (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50),
    email VARCHAR(100),
    phone_number VARCHAR(15),
    password VARCHAR(80),
    role ENUM('user', 'admin')
);