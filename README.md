# Retail Sales Analysis Using SQL

## Project Overview
This project focuses on analyzing retail transaction data using SQL to derive business insights related to revenue, customer behavior, sales trends, and customer segmentation.

The analysis was performed on the Online Retail II dataset containing transaction-level retail sales data.

---

## Objectives
- Analyze total revenue generated
- Identify top-performing countries
- Study monthly revenue trends
- Identify high-value customers
- Analyze repeat vs one-time customers
- Find top-selling products
- Perform customer segmentation

---

## Dataset
- Dataset: Online Retail II
- Contains transactional retail sales data
- Includes:
  - Orders
  - Customers
  - Products
  - Revenue
  - Countries
  - Invoice dates

---

## SQL Concepts Used
- SELECT
- WHERE
- GROUP BY
- ORDER BY
- HAVING
- COUNT DISTINCT
- Aggregate Functions
- CASE WHEN
- Date Functions
- Customer Segmentation Logic

---

## Key Business Insights
- United Kingdom generated the highest revenue
- Revenue was concentrated among a small set of customers
- Repeat customers contributed significantly to sales
- A few products dominated overall sales quantity

---

## Sample SQL Query

```sql
SELECT 
    country,
    SUM(quantity * price) AS revenue
FROM online_retail_ii
WHERE quantity > 0
GROUP BY country
ORDER BY revenue DESC;
```

---

## Tools Used
- MySQL
- GitHub

---

## Author
Sunny Soren
