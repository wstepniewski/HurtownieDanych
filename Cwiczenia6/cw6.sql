--zad1
with daily_sales as
	(select sum(salesamount) as daily_sales_amount, orderdate
	from factinternetsales group by orderdate)

select daily_sales_amount,
	avg(daily_sales_amount) over (order by orderdate rows between 3 preceding and current row) as moving_average,
	orderdate
	from daily_sales

--zad2
with tmp as (select salesamount,
	month(orderdate) as month_of_year,
	salesterritorykey
	from factinternetsales
	where year(orderdate) = 2011)


select month_of_year,
	isnull([0], 0) as '[0]',
	isnull([1], 0) as '[1]',
	isnull([2], 0) as '[2]',
	isnull([3], 0) as '[3]',
	isnull([4], 0) as '[4]',
	isnull([5], 0) as '[5]',
	isnull([6], 0) as '[6]',
	isnull([7], 0) as '[7]',
	isnull([8], 0) as '[8]',
	isnull([9], 0) as '[9]',
	isnull([10], 0) as '[10]'
	from tmp
	pivot (sum(salesamount)
		for salesterritorykey in ([0], [1], [2], [3], [4], [5], [6], [7], [8], [9], [10])
		)as pivot_table
	order by month_of_year

--zad3
select organizationkey,
	departmentgroupkey,
	sum(amount) as aamount
	from factfinance
	group by rollup(organizationkey, departmentgroupkey)
	order by OrganizationKey

--zad4
select organizationkey,
	departmentgroupkey,
	sum(amount) as aamount
	from factfinance
	group by cube(organizationkey, departmentgroupkey)
	order by OrganizationKey

--zad5
with tmp as(select ff.organizationkey, sum(ff.amount) as amount, do.organizationname
	from factfinance ff
	join DimOrganization do
	on ff.organizationkey = do.organizationkey
	where year(date) = 2012
	group by ff.organizationkey, do.organizationname)

select tmp.organizationkey,
	tmp.amount,
	tmp.organizationname,
	PERCENT_RANK() over (order by amount) as percentile
	from tmp

--zad6
with tmp as(select ff.organizationkey, sum(ff.amount) as amount, do.organizationname
	from factfinance ff
	join DimOrganization do
	on ff.organizationkey = do.organizationkey
	where year(date) = 2012
	group by ff.organizationkey, do.organizationname)

select tmp.organizationkey,
	tmp.amount,
	tmp.organizationname,
	PERCENT_RANK() over (order by amount) as percentile,
	stdev(tmp.amount) over (order by tmp.organizationkey) as standard_deviation
	from tmp