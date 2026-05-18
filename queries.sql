Q1. WHAT IS THE TOTAL REVENUE GENERATED
SELECT 
    SUM(quantity * price) AS total_revenue
    FROM ecommerce_project.online_retail_ii
WHERE quantity > 0;
Q2. Which countries generate the most revenue?
SELECT 
    country,
    SUM(quantity * price) AS revenue
FROM ecommerce_project.online_retail_ii
WHERE quantity > 0
GROUP BY country
ORDER BY revenue DESC;
Q3. TOP 10 Customers By Revenue
SELECT 
    customerid,
    SUM(quantity * price) AS revenue
FROM ecommerce_project.online_retail_ii
WHERE quantity > 0
AND customerid IS NOT NULL
GROUP BY customerid;
Q4. Repeat vs One-time Customers
SELECT 
    customer_type,
    COUNT(*) AS total_customers
FROM (
    SELECT 
        customerid,
        CASE 
            WHEN COUNT(DISTINCT Invoice) = 1 THEN 'One-time'
            ELSE 'Repeat'
        END AS customer_type
    FROM ecommerce_project.online_retail_ii
    WHERE customerid IS NOT NULL
    GROUP BY customerid
) AS sub
GROUP BY customer_type;
Q5. Number of Orders per Customer
SELECT 
    customerid,
    COUNT(DISTINCT Invoice) AS total_orders
FROM ecommerce_project.online_retail_ii
WHERE customerid IS NOT NULL
GROUP BY customerid
ORDER BY total_orders DESC;
Q6. Top Selling Products
SELECT 
    StockCode,
    Description,
    SUM(quantity) AS total_quantity_sold
FROM ecommerce_project.online_retail_ii
WHERE quantity > 0
GROUP BY StockCode, Description
ORDER BY total_quantity_sold DESC
LIMIT 10;
Q7. AVERAGE ORDER VALUE
SELECT 
    SUM(quantity * price) / COUNT(DISTINCT Invoice) AS average_order_value
FROM ecommerce_project.online_retail_ii
WHERE quantity > 0;
Q8. RETURN ANALYSIS
SELECT 
(
    COUNT(DISTINCT CASE WHEN quantity < 0 THEN Invoice END)
    * 100.0
    /
    COUNT(DISTINCT Invoice)
) AS return_rate_percentage
FROM ecommerce_project.online_retail_ii;
Q9.Customer Segmentation
SELECT 
    customerid,
    SUM(quantity * price) AS total_revenue,
	CASE
        WHEN SUM(quantity * price) > 10000 THEN 'High Value'
        WHEN SUM(quantity * price) BETWEEN 5000 AND 10000 THEN 'Medium Value'
        ELSE 'Low Value'
    END AS customer_segment
FROM ecommerce_project.online_retail_ii
WHERE quantity > 0
AND customerid IS NOT NULL
GROUP BY customerid
ORDER BY total_revenue DESC;
