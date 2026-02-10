CREATE TABLE regions ( region_id NUMBER PRIMARY KEY, region_name VARCHAR2(100) NOT NULL );

CREATE TABLE customers ( customer_id NUMBER PRIMARY KEY, customer_name VARCHAR2(100) NOT NULL, region_id NUMBER, CONSTRAINT fk_region FOREIGN KEY (region_id) REFERENCES regions(region_id) );

CREATE TABLE products ( product_id NUMBER PRIMARY KEY, product_name VARCHAR2(100) NOT NULL, category VARCHAR2(50) NOT NULL );

CREATE TABLE orders ( order_id NUMBER PRIMARY KEY, customer_id NUMBER, product_id NUMBER, order_date DATE NOT NULL, amount NUMBER NOT NULL, CONSTRAINT fk_customer FOREIGN KEY (customer_id) REFERENCES customers(customer_id), CONSTRAINT fk_product FOREIGN KEY (product_id) REFERENCES products(product_id) );

INSERT INTO regions (region_id, region_name) VALUES (1, 'Kigali'); 
INSERT INTO regions (region_id, region_name) VALUES (2, 'Musanze'); 
INSERT INTO regions (region_id, region_name) VALUES (3, 'Huye');

INSERT INTO customers (customer_id, customer_name, region_id) VALUES (101, 'Alice', 1); 
INSERT INTO customers (customer_id, customer_name, region_id) VALUES (102, 'Jean', 1); 
INSERT INTO customers (customer_id, customer_name, region_id) VALUES (103, 'Claudine', 2); 
INSERT INTO customers (customer_id, customer_name, region_id) VALUES (104, 'Eric', 3);

INSERT INTO products (product_id, product_name, category) VALUES (201, 'Mutzig', 'Beer'); 
INSERT INTO products (product_id, product_name, category) VALUES (202, 'Primus', 'Beer'); 
INSERT INTO products (product_id, product_name, category) VALUES (203, 'Turbo', 'Beer'); 
INSERT INTO products (product_id, product_name, category) VALUES (204, 'Fanta', 'Soft Drink'); 
INSERT INTO products (product_id, product_name, category) VALUES (205, 'Coca-Cola', 'Soft Drink');

INSERT INTO orders (order_id, customer_id, product_id, order_date, amount) VALUES (301, 101, 201, DATE '2025-01-10', 50); 
INSERT INTO orders (order_id, customer_id, product_id, order_date, amount) VALUES (302, 102, 202, DATE '2025-01-15', 30); 
INSERT INTO orders (order_id, customer_id, product_id, order_date, amount) VALUES (303, 103, 203, DATE '2025-02-05', 40); 
INSERT INTO orders (order_id, customer_id, product_id, order_date, amount) VALUES (304, 104, 204, DATE '2025-02-12', 20); 
INSERT INTO orders (order_id, customer_id, product_id, order_date, amount) VALUES (305, 101, 205, DATE '2025-02-20', 25);

INNER JOIN:
SELECT c.customer_name, p.product_name, o.amount FROM customers c 
INNER JOIN orders o ON c.customer_id = o.customer_id 
INNER JOIN products p ON o.product_id = p.product_id;

LEFT JOIN:
SELECT c.customer_name, o.order_id, o.amount 
FROM customers c 
LEFT JOIN orders o ON c.customer_id = o.customer_id;

RIGHT JOIN:
SELECT o.order_id, c.customer_name, p.product_name
FROM customers c
RIGHT JOIN orders o ON c.customer_id = o.customer_id
JOIN products p ON o.product_id = p.product_id;

FULL OUTER JOIN:
SELECT c.customer_name, o.order_id, p.product_name
FROM customers c
FULL OUTER JOIN orders o ON c.customer_id = o.customer_id
FULL OUTER JOIN products p ON o.product_id = p.product_id;

SELF JOIN:
SELECT p1.product_name AS product_a, p2.product_name AS product_b
FROM products p1
JOIN products p2 ON p1.category = p2.category
AND p1.product_id <> p2.product_id;