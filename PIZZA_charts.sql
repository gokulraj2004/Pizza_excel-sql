USE  PIZZADB;
#TO VIEW ALL THE DATA FROM THE TABLE
SELECT * FROM PIZZA_SALES;
#Chart Requirements
#Create a bar chart that displays the daily trend of total orders over a specific time period. This chart will help us identitfy any patterns or fluctuations in order volumes on a daily basis
select 
day(DATE_FORMAT(order_date,'%y/%m/%d')) as order_day , 
count( distinct (order_id)) as Total_orders
from pizza_sales 
group by day(order_date);
#Error Code: 1055. Expression #1 of SELECT list is not in GROUP BY clause and contains nonaggregated column 'pizzadb.pizza_sales.order_date' which is not functionally dependent on columns in GROUP BY clause; this is incompatible with sql_mode=only_full_group_by


#Create a line chart that displays the hourly trend of total orders throughout the day. This chart will allow us to identify pwak hours or periods of high order activity.
select hour(order_time) as hourly, count(distinct(order_id)) as orders_placed from pizza_sales group by hour(order_time);

select pizza_category as Pizza_Category,
cast(sum(unit_price) as decimal(10,2)) as Total_Revenue_Generated 
from pizza_sales 
group by pizza_category
order by Total_Revenue_Generated desc;

#4. Generate a pie chart that represents the percentage of sales attributed to different pizza sizes. 
#This chart will help us understand customer preferences for pizza sizes and their impact on sales.
#select sum(unit_price) from pizza_sales;
#select sum(total_price) from pizza_sales;
select pizza_size, sum(total_price) as total_sales,
cast((sum(total_price)*100/(select sum(total_price) from pizza_sales)) as decimal(10,2)) as percentage_pizzasize
from  pizza_sales 
group by pizza_size
order by percentage_pizzasize desc;

#TOTAL NO. OF PIZZAS SOLD CATEGORY WISE;
select PIZZA_CATEGORY, SUM(QUANTITY) AS TOTAL_PIZZAS_SOLD
FROM PIZZA_SALES
GROUP BY PIZZA_CATEGORY;

#Create a bar chart highlighting the top 5 best-selling pizzas based on the total number of pizzas sold. This chart will help us identify the most popular pizza options
select distinct(pizza_name),SUM(quantity) as tot_sales 
from pizza_sales 
group by pizza_name
order by tot_sales desc
LIMIT 5;
#Create a bar chart highlighting the bottom 5 worst-selling pizzas based on the total number of pizzas sold. 
#This chart will help us identify the most underperforming or less popular pizza options.
select distinct(pizza_name),SUM(quantity) as tot_sales 
from pizza_sales 
group by pizza_name
order by tot_sales
LIMIT 5;