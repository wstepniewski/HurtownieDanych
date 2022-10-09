with tmp as(
	select od.order_id, o.date, string_agg(pt.ingredients, ',') as ingredients 
	from order_details od
	join pizzas p on p.pizza_id = od.pizza_id
	join pizza_types pt on pt.pizza_type_id = p.pizza_type_id
	join orders o on od.order_id = o.order_id
	group by od.order_id, o.date
)

select order_id
	from tmp
	where date like '2015-03%' and ingredients not like '%Pineaple%'