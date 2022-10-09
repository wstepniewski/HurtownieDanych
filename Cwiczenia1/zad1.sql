with selected_orders as(
select o.order_id, sum(p.price) price_sum from orders o
join order_details od on od.order_id = o.order_id 
join pizzas p on p.pizza_id = od.pizza_id
where o.date='2015-02-18'
group by o.order_id
)

select avg(price_sum) price_avarage from selected_orders