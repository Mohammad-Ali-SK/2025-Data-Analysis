-- Basic:
-- Retrieve the total number of orders placed.

SELECT COUNT(*) FROM orders;

-- Calculate the total revenue generated from pizza sales.

select round(sum(od.quantity * p.price)) as total_revenue
from order_detail as od
join pizzas as p on p.pizza_id = od.pizza_id;

-- Identify the highest-priced pizza.

select pizza_type.name, pizzas.price from pizzas
join pizza_type on pizza_type.pizza_type_id = pizzas.pizza_type_id
order by pizzas.price desc limit 1;


-- Identify the most common pizza size ordered.

select pizzas.size, sum(order_detail.quantity) from order_detail
join pizzas on pizzas.pizza_id = order_detail.pizza_id
group by pizzas.size
order by sum(order_detail.quantity) desc limit 1;



-- List the top 5 most ordered pizza types along with their quantities.
SELECT 
    pizza_type.name, 
    SUM(order_detail.quantity) AS total_quantity
FROM 
    pizza_type
JOIN 
    pizzas ON pizzas.pizza_type_id = pizza_type.pizza_type_id
JOIN 
    order_detail ON order_detail.pizza_id = pizzas.pizza_id
GROUP BY 
    pizza_type.name
ORDER BY 
    total_quantity DESC
LIMIT 5;


-- Intermediate:

-- Join the necessary tables to find the total quantity of each pizza category ordered.

select pizza_type.category, sum(order_detail.quantity) as total_quantity
FROM pizza_type
JOIN
	pizzas 	ON pizzas.pizza_type_id = pizza_type.pizza_type_id
JOIN
	order_detail ON order_detail.pizza_id = pizzas.pizza_id
GROUP BY
	pizza_type.category
ORDER BY
	total_quantity 	DESC;



-- Determine the distribution of orders by hour of the day.

SELECT 
    EXTRACT(HOUR FROM time::TIME) AS order_hour,
    COUNT(order_id) AS total_orders
FROM 
    orders
GROUP BY 
    order_hour
ORDER BY
    total_orders DESC;

-- Join relevant tables to find the category-wise distribution of pizzas.

select category,count(name) from pizza_type
GROUP BY
	category;



-- Group the orders by date and calculate the average number of pizzas ordered per day.

select round(avg(total_quantity),2) as avg_ord from
(select orders.date, sum(order_detail.quantity) as total_quantity
FROM orders
JOIN
	order_detail ON order_detail.order_id = orders.order_id
GROUP BY
	orders.date)
AS daily_totals;


-- Determine the top 3 most ordered pizza types based on revenue.

select pizza_type, sum(quantity*price) as revenue from
(select name as pizza_type, order_detail.quantity as quantity, pizzas.price as price from pizza_type
join
	pizzas on pizzas.pizza_type_id = pizza_type.pizza_type_id
join
	order_detail on order_detail.pizza_id = pizzas.pizza_id) as sub
group by pizza_type
order by revenue desc limit 3;



-- Advanced:
-- Calculate the percentage contribution of each pizza type to total revenue.


-- Calculate the percentage contribution of each pizza type to total revenue
-- Calculate the percentage contribution of each pizza category to total revenue
SELECT 
    category, 
    ROUND(percentage::numeric, 2) AS percentage_contribution
FROM (
    SELECT 
        pizza_type.category AS category, 
        (SUM(order_detail.quantity * pizzas.price) / 
         (SELECT SUM(order_detail.quantity * pizzas.price)
          FROM order_detail 
          JOIN pizzas ON pizzas.pizza_id = order_detail.pizza_id) * 100) AS percentage
    FROM 
        pizza_type 
    JOIN 
        pizzas ON pizzas.pizza_type_id = pizza_type.pizza_type_id
    JOIN 
        order_detail ON order_detail.pizza_id = pizzas.pizza_id
    GROUP BY 
        pizza_type.category
) AS sub
ORDER BY 
    percentage_contribution DESC;



-- Analyze the cumulative revenue generated over time.
SELECT date, revenue,
SUM(revenue) over(order by date) as cum_revenue
FROM
	(SELECT date AS date, round(SUM(order_detail.quantity*pizzas.price)::numeric,2) AS revenue
FROM
	orders
JOIN
	order_detail ON order_detail.order_id  = orders.order_id
JOIN
	pizzas ON pizzas.pizza_id = order_detail.pizza_id
GROUP BY
	date)




-- Determine the top 3 most ordered pizza types based on revenue for each pizza category.

WITH ranked_pizzas AS (
    SELECT 
        pizza_type.name AS pizza_type, 
        pizza_type.category AS category,
        SUM(order_detail.quantity * pizzas.price) AS revenue,
        ROW_NUMBER() OVER (PARTITION BY pizza_type.category ORDER BY SUM(order_detail.quantity * pizzas.price) DESC) AS rn
    FROM 
        pizza_type
    JOIN 
        pizzas ON pizzas.pizza_type_id = pizza_type.pizza_type_id
    JOIN 
        order_detail ON order_detail.pizza_id = pizzas.pizza_id
    GROUP BY 
        pizza_type.name, pizza_type.category
)
SELECT 
    pizza_type, category, revenue,rn
FROM 
    ranked_pizzas
WHERE 
    rn <= 3
ORDER BY 
    category, revenue DESC;








