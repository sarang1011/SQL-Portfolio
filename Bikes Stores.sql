# OVERVIEW OF THE DATASET

select * from bikestores;

# CHANGE THE NAME OF COLUMN 

alter table bikestores
rename column Myunknowncolumn to Month;

# SUM AND COUNTS OF COLUMNS

select sum(revenue) as "Total Revenue" , sum(total_units) as "Total Units Sold", count(distinct order_id) as Orders ,
count(distinct customers) as Customers, count(DISTINCT sales_rep) as SalesRep
from bikestores;

select count(DISTINCT city) as Cities, count(distinct state) as States,
count(DISTINCT product_name) as Products, count(DISTINCT category_name) as Categories,
count(DISTINCT brand_name) as Brands,count( DISTINCT store_name) as Stores
from bikestores;

# TOTAL REVENUE GENERATED IN EACH YEAR

select year,sum(revenue) as "Total Revenue Every Year",sum(total_units) as "Units Sold"
from bikestores
group by year
order by "Total Revenue Every Year";

# TOTAL REVENUE GENERATED IN EACH MONTH

select month,sum(revenue) as "Total Revenue Every month",sum(total_units) as "Units Sold"
from bikestores
group by month
order by "Total Revenue Every month";

# TOTAL REVENUE GENERATED IN EACH SEASON

select 
case
when month in ('Feb','Mar','Apr','May') then 'Summer'
when month in ('Jun','Jul','Aug','Sep') then 'Rainy'
when month in ('Oct','Nov','Dec','Jan') then 'Winter'
end as Season,
sum(revenue) as "Total Revenue",
sum(total_units) as "Total Units Sold"
from bikestores
group by season
order by 'Total Revenue';

# TOTAL REVENUE GENERATED IN EACH STORE

select store_name,sum(revenue) as Total_Revenue,
sum(total_units) as Units_Sold
from bikestores
group by store_name
ORDER BY Total_revenue desc;

# TOTAL REVENUE GENERATED AND UNITS SOLD IN EACH CITY

select city,sum(revenue) as Total_revenue,
sum(total_units) as Unit_sold
from bikestores 
group by city
order by Total_revenue desc
LIMIT 10;

# TOTAL REVENUE GENERATED FROM EACH PRODUCT CATEGORY

select category_name,sum(revenue) as Total_revenue,
sum(total_units) as Unit_sold
from bikestores 
group by category_name
order by Total_revenue desc;

# TOTAL REVENUE FROM EACH BRAND

select brand_name,sum(revenue) as Total_revenue,
sum(total_units) as Unit_sold
from bikestores 
group by brand_name
order by Total_revenue desc;