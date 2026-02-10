INSY 8311 SQL Assignment I – Freeways Limited

Business Context

Freeways Limited is a beverage distribution company in Rwanda, operating in the sales and distribution department of the beverage industry. As a Bralirwa distributor, it supplies Mutzig, Primus, Turbo, Fanta, and Coca-Cola across multiple regions.

Data Challenge

The company collects sales data from different regions and customers but struggles to analyze it effectively. Management needs to identify top-selling products per region, track customer purchasing behavior, and segment customers by spending levels. Without structured analysis, it is difficult to make informed decisions about marketing and inventory.

Expected Outcome

By applying SQL JOINs and Window Functions, Freeways Limited expects to gain insights such as:
- Top-selling products per region for better distribution planning.
- Customer segmentation by spending quartiles for targeted promotions.
- Sales trends over time to guide inventory and marketing strategies.

Schema & ER Diagram
- Regions: region_id (PK), region_name  
- Customers: customer_id (PK), customer_name, region_id (FK)  
- Products: product_id (PK), product_name, category  
- Orders: order_id (PK), customer_id (FK), product_id (FK), order_date, amount

Database Schema:
1. regions

CREATE TABLE regions (
    region_id INT PRIMARY KEY,
    region_name VARCHAR(50)
);

2. customers

CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(100),
    region_id INT,
    FOREIGN KEY (region_id) REFERENCES regions(region_id)
);

3. products

CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    category VARCHAR(50)
);

4. orders

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    product_id INT,
    order_date DATE,
    amount DECIMAL(10,2),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

ER Diagram:

<img width="863" height="477" alt="Screenshot 2026-02-10 025148" src="https://github.com/user-attachments/assets/af79b904-ef25-4df2-afed-7759d2e997f6" />


JOIN QUERIES:

1. INNER JOIN

<img width="552" height="282" alt="image" src="https://github.com/user-attachments/assets/46f97dce-c4f5-42b9-9ba0-f73d0dfd126b" />

This view highlights only customers who have actually made purchases, showing the product bought and 
the quantity. For instance, Alice purchasing 50 units of Mutzig reflects a clear, active relationship 
between the customer and the product. 

2. LEFT JOIN

<img width="575" height="246" alt="image" src="https://github.com/user-attachments/assets/334a194d-ea60-4a0d-91a8-7a7abd6ec0b8" />

This list shows all customers, even those who haven’t placed any orders. If a customer has “NULL” in the 
order columns, it means they haven’t bought anything yet. This makes it easy for Freeways Limited to 
spot inactive customers. 

3. RIGHT JOIN

<img width="595" height="262" alt="image" src="https://github.com/user-attachments/assets/d7ebdbe5-b74e-44be-a6ca-6c31f73d4346" />

This shows all orders, even when some customer details are missing. It’s especially helpful for auditing 
sales records and identifying cases where customer information is incomplete. 

4. FULL OUTER JOIN

<img width="574" height="255" alt="image" src="https://github.com/user-attachments/assets/6973a2e2-f09a-436f-b23e-511897684333" />

This combines customers and orders, displaying both matching and non-matching records. It provides a 
full picture of sales activity while also highlighting any gaps or missing information in the data. 

5. SELF JOIN

<img width="597" height="241" alt="image" src="https://github.com/user-attachments/assets/3ab4e6a9-7edb-4066-b617-fe31b8b34a0e" />

This compares products within the same category. For example, both Mutzig and Primus fall under 
“Beer.” It helps Freeways Limited understand how products compete within each category.

WINDOW FUNCTION QUERIES:

1. Ranking (Top products per region)

<img width="598" height="241" alt="image" src="https://github.com/user-attachments/assets/03ba80e1-4c55-4b88-b14d-c63c35d70f02" />

Ranks products by sales volume within each region. For example, in Kigali, Mutzig might rank #1, showing it’s the most popular product there.

2. Aggregate (Cumulative Sales per Product)

<img width="624" height="151" alt="image" src="https://github.com/user-attachments/assets/7185ccfa-6720-4887-aedb-b264183fff56" />

Calculates total sales for each product across all regions. This helps Freeways Limited see which drinks (like Primus or Coca-Cola) generate the highest overall revenue.

3. Navigation (Compare Current vs. Previous Sale)

<img width="624" height="117" alt="image" src="https://github.com/user-attachments/assets/1ed53ec5-b885-4d9c-9b93-8f6797350da7" />

Shows each sale alongside the previous one. This helps track sales trends over time, e.g., noticing that Turbo sales dropped compared to the last order.

4. Distribution (Customer Spending Quartiles)

<img width="624" height="111" alt="image" src="https://github.com/user-attachments/assets/5e121c21-763c-441c-a049-97484717e5b8" />

Divides customers into four spending groups. Freeways Limited can identify high-value customers (quartile 4) and low-value ones (quartile 1) for targeted promotions.

5. Average (Regional Sales Averages)

<img width="624" height="250" alt="image" src="https://github.com/user-attachments/assets/0b068158-dbc9-4f56-b27f-21bb221fc9b5" />

Calculates the average sales amount per region. This helps compare performance across Kigali, Musanze, and Huye, highlighting which areas need more marketing support.

Key Insights
- Descriptive: Mutzig is the top-selling beer in Kigali.  
- Diagnostic: Turbo sales dropped in January compared to December.  
- Prescriptive: Increase promotions for Turbo in Kigali to boost retention.  

References
- Course Notes  
- Youtube Tutorials consulted  

Academic Integrity Statement

I confirm that this work is original, paraphrased in my own words, and not generated by AI tools.

