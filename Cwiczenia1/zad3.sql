with tmp as(
	select o.order_id, sum(p.price) price_sum from orders o
	join order_details od on od.order_id = o.order_id 
	join pizzas p on p.pizza_id = od.pizza_id
	where o.date like '2015-02%'
	group by o.order_id
)

select top 10 price_sum, rank () over (order by price_sum desc) rank from tmp
