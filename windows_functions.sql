RANKING:
SELECT r.region_name,
       p.product_name,
       SUM(o.amount) AS total_sales,
       RANK() OVER (PARTITION BY r.region_name ORDER BY SUM(o.amount) DESC) AS product_rank
FROM orders o
JOIN customers c ON o.customer_id = c.customer_id
JOIN regions r ON c.region_id = r.region_id
JOIN products p ON o.product_id = p.product_id
GROUP BY r.region_name, p.product_name;

AGGREGATE:
SELECT product_id, 
       SUM(amount) OVER (PARTITION BY product_id) AS total_sales
FROM orders;

NAVIGATION:
SELECT order_id, product_id, amount, 
       LAG(amount) OVER (ORDER BY order_date) AS previous_sale
FROM orders;

DISTRIBUTION:
SELECT customer_id, 
       NTILE(4) OVER (ORDER BY SUM(amount)) AS spending_quartile
FROM orders
GROUP BY customer_id;

AVERAGE SALES:
SELECT r.region_name,
       AVG(o.amount) AS avg_sales
FROM orders o
JOIN customers c ON o.customer_id = c.customer_id
JOIN regions r ON c.region_id = r.region_id
GROUP BY r.region_name;