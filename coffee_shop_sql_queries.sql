-- Coffee Shop Sales Analysis SQL Project
-- Table name: coffee_sales

-- 1. Total Revenue
SELECT SUM(total_bill) AS total_revenue
FROM coffee_sales;

-- 2. Total Orders
SELECT COUNT(transaction_id) AS total_orders
FROM coffee_sales;

-- 3. Total Quantity Sold
SELECT SUM(quantity) AS total_quantity_sold
FROM coffee_sales;

-- 4. Average Order Value
SELECT ROUND(AVG(total_bill), 2) AS average_order_value
FROM coffee_sales;

-- 5. Top 10 Selling Products
SELECT product_name, SUM(quantity) AS quantity_sold
FROM coffee_sales
GROUP BY product_name
ORDER BY quantity_sold DESC
LIMIT 10;

-- 6. Revenue by Product Category
SELECT product_category, ROUND(SUM(total_bill), 2) AS revenue
FROM coffee_sales
GROUP BY product_category
ORDER BY revenue DESC;

-- 7. Monthly Revenue Trend
SELECT DATE_FORMAT(date, '%Y-%m') AS month, ROUND(SUM(total_bill), 2) AS revenue
FROM coffee_sales
GROUP BY month
ORDER BY month;

-- 8. Store Performance
SELECT store_location, COUNT(*) AS orders, ROUND(SUM(total_bill), 2) AS revenue
FROM coffee_sales
GROUP BY store_location
ORDER BY revenue DESC;

-- 9. Peak Sales Hours
SELECT HOUR(time) AS sales_hour, COUNT(*) AS orders, ROUND(SUM(total_bill), 2) AS revenue
FROM coffee_sales
GROUP BY sales_hour
ORDER BY revenue DESC;

-- 10. Payment Method Split
SELECT payment_method, COUNT(*) AS orders
FROM coffee_sales
GROUP BY payment_method
ORDER BY orders DESC;
