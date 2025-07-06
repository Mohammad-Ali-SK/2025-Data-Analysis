SELECT * FROM "Shopify_Sales";

## 🟢 **Basic SQL Questions**

1. Show all columns and rows from the dataset.

SELECT * FROM "Shopify_Sales";

2. List all unique product types.

SELECT 
	DISTINCT("Product_Type") 
FROM "Shopify_Sales";


3. Find the total number of orders.
SELECT
	COUNT("Customer_Id") AS total_orders
	FROM "Shopify_Sales";


4. Count the number of orders per country.

SELECT
	"Billing_Address_Country" AS country,
	COUNT(*) AS total_order
FROM "Shopify_Sales"
GROUP BY country;

5. Retrieve all orders paid via PayPal.

SELECT * FROM "Shopify_Sales"
WHERE "Gateway" = 'paypal'


6. Get the top 5 cities with the most orders.

SELECT "CITY" AS city, COUNT(*) AS total_orders FROM "Shopify_Sales"
GROUP BY city
ORDER BY total_orders DESC LIMIT 5;

7. Find the total quantity of items sold.

SELECT SUM("Quantity") as total_quantity FROM "Shopify_Sales"


8. List all distinct currencies used in orders.

SELECT  DISTINCT("Currency") AS distinct_currencies FROM "Shopify_Sales"


9. Show all orders where quantity is greater than 1.

SELECT * FROM "Shopify_Sales"
WHERE "Quantity" > 1;


10. Calculate the total revenue (sum of total price in USD).

SELECT 
  ROUND(SUM("Total_Price_Usd")::numeric / 1000000.0, 2) || 'M' AS total_revenue
FROM "Shopify_Sales";



---

## 🟡 **Intermediate SQL Questions**

11. Find the top 5 customers by total spending.

SELECT 
	"Customer_Id" AS customer_id,
	SUM("Total_Price_Usd") AS total_spending
FROM "Shopify_Sales"
GROUP BY customer_id
ORDER BY total_spending DESC
LIMIT 5;


12. Calculate the average order value per payment gateway.

SELECT "Gateway" as gateway, round(avg("Total_Price_Usd")::numeric,2) as avg_ordValue
FROM "Shopify_Sales"
group by gateway

13. Count the number of orders made in each month.

14. Get the maximum and minimum total price from orders.

select max("Total_Price_Usd") as max_price, min("Total_Price_Usd") as min_price from "Shopify_Sales"


15. Calculate total tax collected by country.

select  "Billing_Address_Country" as country,sum("Total_Tax") as total_tax from "Shopify_Sales"
group by country

16. List customers who placed more than 3 orders.

select * from
(select "Customer_Id" as customer, count(*) as no_of_ord from "Shopify_Sales"
group by customer
) as cust
where no_of_ord > 3


17. Calculate the average tax per product type.

select "Product_Type" as product_type, round(avg("Total_Tax")::numeric,2) as avg_tax from "Shopify_Sales"
group by product_type


18. Calculate total revenue per product type.

select "Product_Type" as product_type, round(sum("Total_Price_Usd")::numeric,2) as total_revenue
from "Shopify_Sales"
group by product_type



19. Show all orders placed in March 2025.

select * from "Shopify_Sales"
where
	 EXTRACT(MONTH FROM TO_TIMESTAMP("Invoice_Date", 'YYYY-MM-DD HH24:MI:SS'))  = 3
	 AND
	  EXTRACT(YEAR FROM TO_TIMESTAMP("Invoice_Date", 'YYYY-MM-DD HH24:MI:SS')) = 2025
	


20. Identify the most popular product by quantity sold.
select product_type,quantity_sold from 
(select "Product_Type" as product_type,count(*) as popularty, sum("Quantity") as quantity_sold from "Shopify_Sales"
group by product_type
order by quantity_sold desc
limit  1
) as popular_product


---

## 🔴 **Advanced SQL Questions**

21. Calculate cumulative revenue over time (by date).

SELECT "Invoice_Date"::date AS order_date,
       SUM("Total_Price_Usd") OVER (ORDER BY "Invoice_Date"::date) AS cumulative_revenue
FROM "Shopify_Sales"


22. Show a running total of tax collected over time.

SELECT "Invoice_Date", 
       SUM("Total_Tax") OVER (ORDER BY "Invoice_Date") AS running_tax_total
FROM "Shopify_Sales";




23. Find the percentage of orders made using each payment gateway.

SELECT 
  payment_method,
  ROUND(100.0 * number_of_payment / SUM(number_of_payment) OVER (), 2) AS percentage_of_orders
FROM (
  SELECT 
    "Gateway" AS payment_method, 
    COUNT(*) AS number_of_payment
  FROM "Shopify_Sales"
  GROUP BY "Gateway"
) AS per
ORDER BY percentage_of_orders DESC;


24. Compare the average order value across provinces or states.

SELECT 
  "Billing_Address_Province" AS province,
  ROUND(AVG("Total_Price_Usd")::numeric, 2) AS avg_order_value
FROM "Shopify_Sales"
GROUP BY "Billing_Address_Province"
ORDER BY avg_order_value DESC;




-- 25. Identify customers who spent more than the average customer.

WITH avg_customer_spend AS (
  SELECT 
    "Customer_Id",
    SUM("Total_Price_Usd") AS total_spent
  FROM "Shopify_Sales"
  GROUP BY "Customer_Id"
),
overall_avg AS (
  SELECT AVG(total_spent) AS avg_spent_all FROM avg_customer_spend
)

SELECT 
  a."Customer_Id" AS customer,
  a.total_spent
FROM avg_customer_spend a, overall_avg o
WHERE a.total_spent > o.avg_spent_all
ORDER BY a.total_spent DESC;

-- 26. Detect any duplicate order numbers.
SELECT "Order_Number", COUNT(*) 
FROM "Shopify_Sales"
GROUP BY "Order_Number"
HAVING COUNT(*) > 1;


-- 27. List the top 3 cities by total tax collected.

SELECT "CITY", SUM("Total_Tax") AS total_tax
FROM "Shopify_Sales"
GROUP BY "CITY"
ORDER BY total_tax DESC
LIMIT 3;

-- 28. Count how many orders were made in each hour of the day.
SELECT 
  EXTRACT(HOUR FROM TO_TIMESTAMP("Invoice_Date", 'YYYY-MM-DD HH24:MI:SS')) AS order_hour,
  COUNT(*) AS total_orders
FROM "Shopify_Sales"
GROUP BY order_hour
ORDER BY order_hour;



-- 29. Calculate revenue per unit for each order.

SELECT "Order Number", "Customer Id", "Total Price Usd", "Quantity", 
       ("Total Price Usd" / NULLIF("Quantity", 0)) AS revenue_per_unit
FROM shopify_sales;

-- 30. Create a pivot-style summary of revenue by country and product type.

SELECT "Billing Address Country", "Product Type", SUM("Total Price Usd") AS revenue
FROM shopify_sales
GROUP BY "Billing Address Country", "Product Type"
ORDER BY revenue DESC;


