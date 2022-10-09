with tmp as(
	 select count(order_id) order_count, date, left(time, 2) hour from orders
	 where date='2015-01-01'
	 group by left(time, 2), date
)

select * from tmp
