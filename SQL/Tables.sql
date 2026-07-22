USE project2;

CREATE TABLE customers (
    customer_id CHAR(32) PRIMARY KEY,
    customer_unique_id CHAR(32) NOT NULL,
    customer_zip_code_prefix INT,
    customer_city VARCHAR(100),
    customer_state CHAR(2)
);

CREATE TABLE sellers (
    seller_id CHAR(32) PRIMARY KEY,
    seller_zip_code_prefix INT,
    seller_city VARCHAR(100),
    seller_state CHAR(2)
);

CREATE TABLE geolocation (
    geolocation_zip_code_prefix INT,
    geolocation_lat DECIMAL(10,8),
    geolocation_lng DECIMAL(11,8),
    geolocation_city VARCHAR(100),
    geolocation_state CHAR(2)
);

CREATE TABLE product_category_translation (
    product_category_name VARCHAR(100) PRIMARY KEY,
    product_category_name_english VARCHAR(100)
);

CREATE TABLE products (
    product_id CHAR(32) PRIMARY KEY,
    product_category_name VARCHAR(100),
    product_name_lenght INT,
    product_description_lenght INT,
    product_photos_qty INT,
    product_weight_g INT,
    product_length_cm INT,
    product_height_cm INT,
    product_width_cm INT,

    FOREIGN KEY (product_category_name)
    REFERENCES product_category_translation(product_category_name)
);

CREATE TABLE orders (
    order_id CHAR(32) PRIMARY KEY,
    customer_id CHAR(32),
    order_status VARCHAR(20),

    order_purchase_timestamp DATETIME,
    order_approved_at DATETIME,
    order_delivered_carrier_date DATETIME,
    order_delivered_customer_date DATETIME,
    order_estimated_delivery_date DATETIME,

    FOREIGN KEY (customer_id)
    REFERENCES customers(customer_id)
);

CREATE TABLE order_items (

    order_id CHAR(32),
    order_item_id INT,
    product_id CHAR(32),
    seller_id CHAR(32),

    shipping_limit_date DATETIME,

    price DECIMAL(10,2),
    freight_value DECIMAL(10,2),

    PRIMARY KEY(order_id, order_item_id),

    FOREIGN KEY(order_id)
    REFERENCES orders(order_id),

    FOREIGN KEY(product_id)
    REFERENCES products(product_id),

    FOREIGN KEY(seller_id)
    REFERENCES sellers(seller_id)
);

CREATE TABLE order_payments (

    order_id CHAR(32),
    payment_sequential INT,
    payment_type VARCHAR(30),
    payment_installments INT,
    payment_value DECIMAL(10,2),

    PRIMARY KEY(order_id, payment_sequential),

    FOREIGN KEY(order_id)
    REFERENCES orders(order_id)
);

CREATE TABLE order_reviews (

    review_id CHAR(32) PRIMARY KEY,
    order_id CHAR(32),

    review_score INT,

    review_comment_title TEXT,
    review_comment_message TEXT,

    review_creation_date DATETIME,
    review_answer_timestamp DATETIME,

    FOREIGN KEY(order_id)
    REFERENCES orders(order_id)
);

LOAD DATA LOCAL INFILE
'C:/Users/aravi/OneDrive - Vignan University/Projects/Brazilian-Ecommerce-Analytics/Data/Processed/customers_clean.csv'
INTO TABLE customers
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS;

SELECT count(*) from customers;


LOAD DATA LOCAL INFILE
'C:/Users/aravi/OneDrive - Vignan University/Projects/Brazilian-Ecommerce-Analytics/Data/Processed/sellers_clean.csv'
INTO TABLE sellers
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS;

SELECT COUNT(*) FROM sellers;

-- Loading Data OF Geolocation
LOAD DATA LOCAL INFILE
'C:/Users/aravi/OneDrive - Vignan University/Projects/Brazilian-Ecommerce-Analytics/Data/Processed/geolocation_clean.csv'
INTO TABLE geolocation
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

SELECT count(*) from geolocation;

-- Loading Data OF product_category_translation
LOAD DATA LOCAL INFILE
'C:/Users/aravi/OneDrive - Vignan University/Projects/Brazilian-Ecommerce-Analytics/Data/Processed/product_category_translation_clean.csv'
INTO TABLE product_category_translation
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS;

SELECT count(*) from product_category_translation;

-- Loading Data OF products 
LOAD DATA LOCAL INFILE
'C:/Users/aravi/OneDrive - Vignan University/Projects/Brazilian-Ecommerce-Analytics/Data/Processed/products_clean.csv'
INTO TABLE products
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS;

SELECT count(*) from products;

-- Loading data of orders
LOAD DATA LOCAL INFILE
'C:/Users/aravi/OneDrive - Vignan University/Projects/Brazilian-Ecommerce-Analytics/Data/Processed/orders_clean.csv'
INTO TABLE orders
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS;

SELECT count(*) from orders;

-- Loading data of order_items
LOAD DATA LOCAL INFILE
'C:/Users/aravi/OneDrive - Vignan University/Projects/Brazilian-Ecommerce-Analytics/Data/Processed/order_items_clean.csv'
INTO TABLE order_items
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS;
SELECT count(*) from order_items;


-- Loading data of order_payments_clean
LOAD DATA LOCAL INFILE
'C:/Users/aravi/OneDrive - Vignan University/Projects/Brazilian-Ecommerce-Analytics/Data/Processed/order_payments_clean.csv'
INTO TABLE order_payments
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS;

SELECT count(*) from order_payments;

-- Loading data of order reviews
LOAD DATA LOCAL INFILE
'C:/Users/aravi/OneDrive - Vignan University/Projects/Brazilian-Ecommerce-Analytics/Data/Processed/order_reviews_clean.csv'
INTO TABLE order_reviews
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS;

SELECT count(*) from order_reviews;



SELECT
    TABLE_NAME,
    CONSTRAINT_NAME,
    REFERENCED_TABLE_NAME
FROM information_schema.KEY_COLUMN_USAGE
WHERE TABLE_SCHEMA = 'project2'
AND REFERENCED_TABLE_NAME IS NOT NULL;

