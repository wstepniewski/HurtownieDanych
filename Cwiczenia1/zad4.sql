with tmp as(
	select o.order_id, sum(p.price) order_amount, o.date, month(o.date) month from orders o
	join order_details od on od.order_id = o.order_id 
	join pizzas p on p.pizza_id = od.pizza_id
	group by o.order_id, o.date
),

tmp2 as(
	select avg(order_amount) average_month_amount, month from tmp
	group by month 
)


select order_id, order_amount, average_month_amount, date from tmp
	join tmp2 on tmp.month = tmp2.month

