CREATE DATABASE gameshopdb;
CREATE TABLE customers(
 customer_id int NOT NULL AUTO_INCREMENT,
  name varchar(40) NOT NULL,
  email varchar(60) NOT NULL,
  house_number int NOT NULL,
  postcode varchar(8) NOT NULL,
  PRIMARY KEY (customer_id)
  );

CREATE TABLE products(
  product_id int NOT NULL AUTO_INCREMENT,
  title varchar(60) NOT NULL,
  price decimal(6,2) NOT NULL,
  stock int NOT NULL,
  PRIMARY KEY (product_id)
);

CREATE TABLE orders(
  order_id int NOT NULL AUTO_INCREMENT,
  customer_id int NOT NULL,
  product_id int NOT NULL,
  date_placed date NOT NULL,
  PRIMARY KEY (order_id),
  FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
  FOREIGN KEY (product_id) REFERENCES products(product_id)
);
ALTER TABLE products
ADD COLUMN discounts int NOT NULL

ALTER TABLE customers
DROP COLUMN email 

SELECT * FROM customers


INSERT INTO customers (customer_id, name , house_number, postcode)
VALUES (1,'Sadhana',53,'Wa144yf');

SELECT * FROM customers

INSERT INTO customers (customer_id, name , house_number, postcode)
VALUES (2,'Pavan',53,'Wa144yf');

INSERT INTO customers (customer_id, name , house_number, postcode)
VALUES (3,'Kavya',53,'Wa144yf');

INSERT INTO customers (customer_id, name , house_number, postcode)
VALUES (4,'Parnika',53,'Wa144yf');

SELECT * FROM customers;



INSERT INTO orders (order_id , product_id, customer_id , date_placed)
VALUES (1234 , 4563 , 1 ,'2022-03-24');



DELETE FROM customers WHERE customer_id = 1;

SELECT * FROM customers;

SELECT * FROM customers WHERE house_number=53;


