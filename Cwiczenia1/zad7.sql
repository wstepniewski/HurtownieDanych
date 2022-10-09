select p.size, count(p.size) count from order_details od
join pizzas p on od.pizza_id = p.pizza_id
join orders o on od.order_id = o.order_id
where o.date like '2015-01-%' or o.date like '2015-02-%'
group by p.size


