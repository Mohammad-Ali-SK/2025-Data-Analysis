select * from customers
select * from order_items
select * from orders
select * from products

select
c.cust_name,
o.ord_date,
p.p_name,
oi.quantity,
(oi.quantity*p.price) as total_price
from order_items oi
join
products p on oi.p_id = p.p_id
join
orders o on o.ord_id = oi.ord_id
join 
customers c on o.cust_id = c.cust_id;