select pt.name, count(pt.name) count, pt.category from order_details od
join pizzas p on od.pizza_id = p.pizza_id
join pizza_types pt on p.pizza_type_id = pt.pizza_type_id
join orders o on od.order_id = o.order_id
where o.date like '2015-01-%'
group by pt.name, pt.category


