# Creating the database
CREATE DATABASE IF NOT EXISTS ecommerce_analytics;

USE ecommerce_analytics;

# Creating dimension tables
CREATE TABLE customers (
    customer_id VARCHAR(32) PRIMARY KEY,
    customer_unique_id VARCHAR(32) NOT NULL,
    customer_zip_code_prefix CHAR(5),
    customer_city VARCHAR(100),
    customer_state CHAR(2)
);

CREATE TABLE products (
    product_id VARCHAR(32) PRIMARY KEY,
    product_category_name VARCHAR(100),
    product_name_lenght INT,
    product_description_lenght INT,
    product_photos_qty INT,
    product_weight_g DECIMAL(12,2),
    product_length_cm DECIMAL(12,2),
    product_height_cm DECIMAL(12,2),
    product_width_cm DECIMAL(12,2)
);

CREATE TABLE sellers (
    seller_id VARCHAR(32) PRIMARY KEY,
    seller_zip_code_prefix CHAR(5),
    seller_city VARCHAR(100),
    seller_state CHAR(2)
);

# Creating the orders table
CREATE TABLE orders (
    order_id VARCHAR(32) PRIMARY KEY,
    customer_id VARCHAR(32) NOT NULL,
    order_status VARCHAR(20),
    order_purchase_timestamp DATETIME,
    order_approved_at DATETIME,
    order_delivered_carrier_date DATETIME,
    order_delivered_customer_date DATETIME,
    order_estimated_delivery_date DATETIME,

    CONSTRAINT fk_orders_customer
        FOREIGN KEY (customer_id)
        REFERENCES customers(customer_id)
);

# Creating order items
CREATE TABLE order_items (
    order_id VARCHAR(32) NOT NULL,
    order_item_id INT NOT NULL,
    product_id VARCHAR(32) NOT NULL,
    seller_id VARCHAR(32) NOT NULL,
    shipping_limit_date DATETIME,
    price DECIMAL(12,2),
    freight_value DECIMAL(12,2),

    PRIMARY KEY (order_id, order_item_id),

    FOREIGN KEY (order_id)
        REFERENCES orders(order_id),

    FOREIGN KEY (product_id)
        REFERENCES products(product_id),

    FOREIGN KEY (seller_id)
        REFERENCES sellers(seller_id)
);

# Creating Payments
CREATE TABLE order_payments (
    order_id VARCHAR(32) NOT NULL,
    payment_sequential INT NOT NULL,
    payment_type VARCHAR(30),
    payment_installments INT,
    payment_value DECIMAL(12,2),

    PRIMARY KEY (order_id, payment_sequential),

    FOREIGN KEY (order_id)
        REFERENCES orders(order_id)
);
# Creating reviews
CREATE TABLE order_reviews (
    review_row_id BIGINT AUTO_INCREMENT PRIMARY KEY,
    review_id VARCHAR(32),
    order_id VARCHAR(32) NOT NULL,
    review_score INT,
    review_comment_title TEXT,
    review_comment_message TEXT,
    review_creation_date DATETIME,
    review_answer_timestamp DATETIME,

    FOREIGN KEY (order_id)
        REFERENCES orders(order_id)
);

# Adding category translations
CREATE TABLE category_translation (
    product_category_name VARCHAR(100) PRIMARY KEY,
    product_category_name_english VARCHAR(100)
);

# Preparing the geolocation staging table
CREATE TABLE geolocation_staging (
    geo_row_id BIGINT AUTO_INCREMENT PRIMARY KEY,
    geolocation_zip_code_prefix CHAR(5),
    geolocation_lat DECIMAL(11,8),
    geolocation_lng DECIMAL(11,8),
    geolocation_city VARCHAR(100),
    geolocation_state CHAR(2)
);

ALTER TABLE order_reviews
ADD CONSTRAINT uq_review_order
UNIQUE (review_id, order_id);


CREATE DATABASE IF NOT EXISTS ecommerce_analytics;

USE ecommerce_analytics;

SHOW DATABASES;


USE ecommerce_analytics;

SHOW TABLES;

DESCRIBE customers;
DESCRIBE orders;
DESCRIBE order_items;
DESCRIBE order_payments;
DESCRIBE order_reviews;


SHOW INDEX
FROM order_reviews;


SELECT 'customers' AS table_name, COUNT(*) AS rows_loaded
FROM customers
UNION ALL
SELECT 'orders', COUNT(*) FROM orders
UNION ALL
SELECT 'order_items', COUNT(*) FROM order_items
UNION ALL
SELECT 'order_payments', COUNT(*) FROM order_payments
UNION ALL
SELECT 'order_reviews', COUNT(*) FROM order_reviews
UNION ALL
SELECT 'products', COUNT(*) FROM products
UNION ALL
SELECT 'sellers', COUNT(*) FROM sellers
UNION ALL
SELECT 'category_translation', COUNT(*) FROM category_translation
UNION ALL
SELECT 'geolocation_staging', COUNT(*) FROM geolocation_staging;