# OVERVIEW OF THE DATASET

select * from pizza_sales;

# TOTAL REVENUE GENERATED

select round(sum(total_price),2) as 'Total Revenue' from pizza_sales;

# AVERAGE ORDER VALUE

select round(sum(total_price)/count(DISTINCT order_id),2) as 'Average Order Value'
from pizza_sales;

# AVERAGE Pizza VALUE

select round(sum(total_price)/sum(quantity),2) as 'Average Order Value'
from pizza_sales;

# TOTAL PIZZAS SOLD

select sum(quantity) as 'Total Pizzas Sold' 
from pizza_sales;

# TOTAL ORDERS PLACED

select count(distinct order_id) as 'Total Orders Placed'
from pizza_sales;

# AVERAGE PIZZA ORDERED

select round(sum(quantity)/count(distinct order_id),2) as 'Avg Pizzas per Order'
from pizza_sales;

# HOURLY TREND

select hour(order_time) as order_hour ,count(DISTINCT order_id) as 'Total Orders'
from pizza_sales
group by hour(order_time);

# PERCENTAGE OF SALES BY PIZZA CATEGORY

select pizza_category,round(sum(total_price) * 100/(select sum(total_price) from pizza_sales),2) as 'Percent OF Sales',
round(sum(total_price),2) as 'Total Sales'
from pizza_sales
group by pizza_category;

# PERCENTAGE OF SALES BY PIZZA NAME

select pizza_name,round(sum(total_price)*100/(select sum(total_price) from pizza_sales),2) as 'Percent of Sales',
sum(total_price) as Total_Sales
from pizza_sales
group by pizza_name
order by Total_Sales desc;

# PERCENTAGE OF SALES BY PIZZA SIZE
select pizza_size,round(sum(total_price)*100/(select sum(total_price) from pizza_sales),2) as 'Percent of Sales',
round(sum(total_price),2) as Total_Sales
from pizza_sales
group by pizza_size
order by Total_Sales desc;

# TOP 5 BEST SELLING PIZZAS 

select pizza_name,sum(total_price) as Total_Sales
from pizza_sales
group by pizza_name
order by Total_Sales desc
LIMIT 5;

# 5 LEAST SOLD PIZZAS

select pizza_name,ROUND(sum(total_price),2) as Total_Sales
from pizza_sales
group by pizza_name
order by Total_Sales ASC
LIMIT 5;