-- ---- Exploratory Data Analysis ----

-- --- I. General problems or questions

-- 1. How many orders were there per country?
SELECT
	deliver_country,
	COUNT(o.order_id) AS total_orders
FROM fp.orderf AS o
LEFT JOIN fp.delivery AS d
ON o.order_id = d.order_id
GROUP BY deliver_country
ORDER BY total_orders DESC; -- FOR VIZ
	
-- 2. How many orders were there per city?
SELECT
	deliver_country,
	deliver_city,
	COUNT(o.order_id) AS total_orders
FROM fp.orderf AS o
LEFT JOIN fp.delivery AS d
ON o.order_id = d.order_id
GROUP BY deliver_country, deliver_city
ORDER BY total_orders DESC; -- FOR VIZ

-- 3. How many orders were there per month?
WITH ord_month AS (
SELECT
	EXTRACT(MONTH FROM order_date) AS "Month",
	TO_CHAR(order_date, 'Month') AS "Month_Name",
	TO_CHAR(order_date, 'YYYY') AS "Year",
	COUNT(order_id) AS total_orders
FROM fp.orderf
GROUP BY "Month", "Month_Name", "Year"
ORDER BY "Month" ASC)
	SELECT
		CONCAT("Month_Name", "Year") AS Monthly,
		total_orders
	FROM ord_month; -- FOR VIZ

-- 4. How many customers were in each country?
SELECT
	deliver_country,
	COUNT(DISTINCT customer_id) AS total_customers
FROM fp.delivery AS del
LEFT JOIN fp.customers AS cus
ON del.order_id = cus.order_id
GROUP BY deliver_country
ORDER BY total_customers DESC;

-- 5. Combine answers to questions 2 and 4.
SELECT
	deliver_country,
	COUNT(DISTINCT customer_id) AS total_customers,
	COUNT(ord.order_id) AS total_orders
FROM fp.delivery AS del
LEFT JOIN fp.customers AS cus
	ON del.order_id = cus.order_id
LEFT JOIN fp.orderf AS ord
	ON cus.order_id = ord.order_id
GROUP BY deliver_country
ORDER BY total_orders DESC; 

-- ~ 5.1 Include repeat order rate per country
SELECT
	deliver_country,
	COUNT(DISTINCT customer_id) AS total_customers,
	COUNT(ord.order_id) AS total_orders,
	ROUND(COUNT(DISTINCT customer_id) * 100 / COUNT(ord.order_id), 2) AS Repeat_Order_Rate
FROM fp.delivery AS del
LEFT JOIN fp.customers AS cus
ON del.order_id = cus.order_id
LEFT JOIN fp.orderf AS ord
ON cus.order_id = ord.order_id
GROUP BY deliver_country
ORDER BY total_orders DESC; 

-- ~ 5.2 Purchase frequency
SELECT
	deliver_country,
	COUNT(DISTINCT customer_id) AS total_customers,
	COUNT(ord.order_id) AS total_orders,
	ROUND(COUNT(ord.order_id) / COUNT(DISTINCT customer_id)::NUMERIC, 2) AS Purchase_Frequency
FROM fp.delivery AS del
LEFT JOIN fp.customers AS cus
ON del.order_id = cus.order_id
LEFT JOIN fp.orderf AS ord
ON cus.order_id = ord.order_id
GROUP BY deliver_country
ORDER BY total_orders DESC; -- For VIZ

-- 6. Which customer type has the largest amount of orders?
SELECT
	cus.customer_type AS customer_type,
	COUNT(ord.order_id) AS total_orders,
	ROUND(COUNT(ord.order_id) * 100.0 / SUM(COUNT(ord.order_id)) OVER (), 2) AS percentage
FROM fp.customers AS cus
LEFT JOIN fp.orderf AS ord
ON cus.order_id = ord.order_id
GROUP BY cus.customer_type
ORDER BY total_orders DESC; -- FOR VIZ

	

-- --- II. Financial Analysis

-- 1. Check general information about finance first.
SELECT * FROM fp.finance;

-- 2. Which customer type brings in the most revenue?
SELECT
	cus.customer_type,
	SUM(revenue_usd) AS total_revenue,
	ROUND(SUM(revenue_usd) * 100.0 / SUM(SUM(revenue_usd)) OVER (), 2) AS percentage
FROM fp.customers AS cus
LEFT JOIN fp.finance AS fin
ON cus.order_id = fin.order_id
GROUP BY cus.customer_type
ORDER BY total_revenue DESC; -- FOR VIZ

-- 3. Find the sums of revenues, costs, and profits for each country.
--    Also include cost to revenue ratio and net profit margin.
SELECT
	deliver_country,
	SUM(revenue_usd) AS total_revenue,
	SUM(cost_usd) AS total_cost,
	SUM(profit_usd) total_profit,
	ROUND(SUM(cost_usd) * 100/ SUM(SUM(revenue_usd)) OVER (), 2) AS Cost_Rev_Ratio,
	ROUND(SUM(profit_usd) * 100/ SUM(SUM(revenue_usd)) OVER (), 2) AS Net_Profit_Margin
FROM fp.delivery AS del
LEFT JOIN fp.finance AS fin
ON del.order_id = fin.order_id
GROUP BY deliver_country
ORDER BY total_profit DESC; -- FOR VIZ

-- 4. Same as 3 but apply to all cities too.
SELECT
	deliver_country,
	deliver_city,
	SUM(revenue_usd) AS total_revenue,
	SUM(cost_usd) AS total_cost,
	SUM(profit_usd) total_profit,
	ROUND(SUM(cost_usd) * 100/ SUM(SUM(revenue_usd)) OVER (), 2) AS Cost_Rev_Ratio,
	ROUND(SUM(profit_usd) * 100/ SUM(SUM(revenue_usd)) OVER (), 2) AS Net_Profit_Margin
FROM fp.delivery AS del
LEFT JOIN fp.finance AS fin
ON del.order_id = fin.order_id
GROUP BY deliver_country, deliver_city
ORDER BY total_profit DESC; -- FOR VIZ

-- 5. What are the top 5 cities in terms of cost?
SELECT
	deliver_country,
	deliver_city,
	SUM(cost_usd) AS total_cost
FROM fp.delivery AS del
LEFT JOIN fp.finance AS fin
ON del.order_id = fin.order_id
GROUP BY deliver_country, deliver_city
ORDER BY total_cost DESC
LIMIT 5;

-- 6. What time of the day are there most orders (including total revenue)?
SELECT
	CASE
		WHEN order_time >= '06:00:00' AND order_time <= '11:59:00' THEN 'Morning'
		WHEN order_time >= '12:00:00' AND order_time <= '17:59:00' THEN 'Afternoon'
		ELSE 'Night'
	END AS time_of_day,
	COUNT(ord.order_id) AS total_orders,
	SUM(revenue_usd) AS total_revenue,
	ROUND(COUNT(ord.order_id) * 100 / SUM(COUNT(ord.order_id)) OVER(), 2) AS order_pct,
	ROUND(SUM(revenue_usd) * 100 / SUM(SUM(revenue_usd)) OVER(), 2) AS rev_pct
FROM fp.orderf AS ord
LEFT JOIN fp.finance AS fin
 	ON ord.order_id = fin.order_id
GROUP BY time_of_day
ORDER BY total_orders DESC; -- FOR VIZ

-- ~ 6.1 Apply question 6 only to the Philippines.
SELECT
	CASE
		WHEN order_time >= '06:00:00' AND order_time <= '11:59:00' THEN 'Morning'
		WHEN order_time >= '12:00:00' AND order_time <= '17:59:00' THEN 'Afternoon'
		ELSE 'Night'
	END AS time_of_day,
	COUNT(ord.order_id) AS total_orders,
	SUM(revenue_usd) AS total_revenue
FROM fp.orderf AS ord
LEFT JOIN fp.finance AS fin
 	ON ord.order_id = fin.order_id
RIGHT JOIN fp.delivery AS del
	ON ord.order_id = del.order_id
WHERE deliver_country = 'Philippines'
GROUP BY time_of_day
ORDER BY total_orders DESC;

-- 7. What are the total revenue, cost, and profit in terms of restaurant brands? 
--    Also include country and city.
SELECT
	deliver_country,
	deliver_city,
	res_categ,
	res_cuisine,
	res_brand,
	COUNT(res.order_id) AS total_orders,
	SUM(revenue_usd) AS total_revenue,
	SUM(cost_usd) AS total_cost,
	SUM(profit_usd) total_profit
FROM fp.restaurant AS res
LEFT JOIN fp.finance AS fin
	ON res.order_id = fin.order_id
RIGHT JOIN fp.delivery AS del
	ON res.order_id = del.order_id
GROUP BY 
	deliver_country,
	deliver_city,
	res_categ,
	res_cuisine,
	res_brand
ORDER BY total_profit DESC; -- FOR VIZ

-- ~ 7.1 Apply question 7 only to the Philippines.
SELECT
	deliver_city,
	res_brand,
	SUM(revenue_usd) AS total_revenue,
	SUM(cost_usd) AS total_cost,
	SUM(profit_usd) total_profit
FROM fp.restaurant AS res
LEFT JOIN fp.finance AS fin
	ON res.order_id = fin.order_id
RIGHT JOIN fp.delivery AS del
	ON res.order_id = del.order_id
WHERE deliver_country = 'Philippines'
GROUP BY 
	deliver_city,
	res_brand
ORDER BY total_profit DESC;

SELECT * FROM fp.restaurant;

-- ~ 7.2 Same answer as question 7 but grouped by category or cuisine.
SELECT
	res_categ,
	res_cuisine,
	res_brand,
	COUNT(res.order_id) AS total_orders,
	SUM(revenue_usd) AS total_revenue,
	SUM(cost_usd) AS total_cost,
	SUM(profit_usd) total_profit
FROM fp.restaurant AS res
LEFT JOIN fp.finance AS fin
	ON res.order_id = fin.order_id
GROUP BY 
	res_cuisine,
	res_categ,
	res_brand
ORDER BY total_profit DESC;

-- 8. Create a running total and moving average for revenues, cost, and profit by month in 2024.

WITH total_finance AS
(	SELECT
		EXTRACT(YEAR FROM order_date) AS "Year",
        EXTRACT(MONTH FROM order_date) AS "Month",
		SUM(revenue_usd) AS total_revenue,
		SUM(cost_usd) AS total_cost,
		SUM(profit_usd) AS total_profit
	FROM fp.orderf AS ord
	LEFT JOIN fp.finance AS fin
 		ON ord.order_id = fin.order_id
	WHERE order_date BETWEEN '2024-01-01' AND '2026-12-31'
	GROUP BY 
		"Year",
        "Month"
	ORDER BY "Month" ASC)
SELECT 
	"Year",
	"Month",
	total_revenue,
		SUM(total_revenue)
			OVER(ORDER BY "Year", "Month" ROWS BETWEEN UNBOUNDED
			PRECEDING AND CURRENT ROW) AS running_revenue,
		ROUND(AVG(total_revenue)
			OVER(ORDER BY "Year", "Month" ROWS BETWEEN UNBOUNDED
			PRECEDING AND CURRENT ROW)) AS moving_avg_revenue,
	total_cost,
		SUM(total_cost)
			OVER(ORDER BY "Year", "Month" ROWS BETWEEN UNBOUNDED
			PRECEDING AND CURRENT ROW) AS running_cost,
		ROUND(AVG(total_cost)
			OVER(ORDER BY "Year", "Month" ROWS BETWEEN UNBOUNDED
			PRECEDING AND CURRENT ROW)) AS moving_avg_cost,
	total_profit,
		SUM(total_profit)
			OVER(ORDER BY "Year", "Month" ROWS BETWEEN UNBOUNDED
			PRECEDING AND CURRENT ROW) AS running_profit,
		ROUND(AVG(total_profit)
			OVER(ORDER BY "Year", "Month" ROWS BETWEEN UNBOUNDED
			PRECEDING AND CURRENT ROW)) AS moving_avg_profit
FROM total_finance; -- FOR VIZ

-- ~8.1 Apply to the Philippines
WITH total_finance AS
(	SELECT
		EXTRACT(YEAR FROM order_date) AS "Year",
        EXTRACT(MONTH FROM order_date) AS "Month",
		SUM(revenue_usd) AS total_revenue,
		SUM(cost_usd) AS total_cost,
		SUM(profit_usd) AS total_profit
	FROM fp.orderf AS ord
	LEFT JOIN fp.finance AS fin
 		ON ord.order_id = fin.order_id
	LEFT JOIN fp.delivery AS del
		ON ord.order_id = del.order_id
	WHERE order_date BETWEEN '2024-01-01' AND '2026-12-31'
		AND deliver_country = 'Philippines'
	GROUP BY 
		"Year",
        "Month"
	ORDER BY "Month" ASC)
SELECT 
	"Year",
	"Month",
	total_revenue,
		SUM(total_revenue)
			OVER(ORDER BY "Year", "Month" ROWS BETWEEN UNBOUNDED
			PRECEDING AND CURRENT ROW) AS running_revenue,
		ROUND(AVG(total_revenue)
			OVER(ORDER BY "Year", "Month" ROWS BETWEEN UNBOUNDED
			PRECEDING AND CURRENT ROW)) AS moving_avg_revenue,
	total_cost,
		SUM(total_cost)
			OVER(ORDER BY "Year", "Month" ROWS BETWEEN UNBOUNDED
			PRECEDING AND CURRENT ROW) AS running_cost,
		ROUND(AVG(total_cost)
			OVER(ORDER BY "Year", "Month" ROWS BETWEEN UNBOUNDED
			PRECEDING AND CURRENT ROW)) AS moving_avg_cost,
	total_profit,
		SUM(total_profit)
			OVER(ORDER BY "Year", "Month" ROWS BETWEEN UNBOUNDED
			PRECEDING AND CURRENT ROW) AS running_profit,
		ROUND(AVG(total_profit)
			OVER(ORDER BY "Year", "Month" ROWS BETWEEN UNBOUNDED
			PRECEDING AND CURRENT ROW)) AS moving_avg_profit
FROM total_finance; -- Change deliver_country if you want to see data for others.

-- ~8.2 Include all deliver_country data 
WITH total_finance AS
(	SELECT
		deliver_country AS country,
		EXTRACT(YEAR FROM order_date) AS "Year",
        EXTRACT(MONTH FROM order_date) AS "Month",
		SUM(revenue_usd) AS total_revenue,
		SUM(cost_usd) AS total_cost,
		SUM(profit_usd) AS total_profit
	FROM fp.orderf AS ord
	LEFT JOIN fp.finance AS fin
 		ON ord.order_id = fin.order_id
	LEFT JOIN fp.delivery AS del
		ON ord.order_id = del.order_id
	WHERE order_date BETWEEN '2024-01-01' AND '2026-12-31'
	GROUP BY 
		country,
		"Year",
        "Month"
	ORDER BY "Month" ASC)
SELECT 
	country,
	"Year",
	"Month",
	total_revenue,
		SUM(total_revenue)
			OVER(ORDER BY "Year", "Month" ROWS BETWEEN UNBOUNDED
			PRECEDING AND CURRENT ROW) AS running_revenue,
		ROUND(AVG(total_revenue)
			OVER(ORDER BY "Year", "Month" ROWS BETWEEN UNBOUNDED
			PRECEDING AND CURRENT ROW)) AS moving_avg_revenue,
	total_cost,
		SUM(total_cost)
			OVER(ORDER BY "Year", "Month" ROWS BETWEEN UNBOUNDED
			PRECEDING AND CURRENT ROW) AS running_cost,
		ROUND(AVG(total_cost)
			OVER(ORDER BY "Year", "Month" ROWS BETWEEN UNBOUNDED
			PRECEDING AND CURRENT ROW)) AS moving_avg_cost,
	total_profit,
		SUM(total_profit)
			OVER(ORDER BY "Year", "Month" ROWS BETWEEN UNBOUNDED
			PRECEDING AND CURRENT ROW) AS running_profit,
		ROUND(AVG(total_profit)
			OVER(ORDER BY "Year", "Month" ROWS BETWEEN UNBOUNDED
			PRECEDING AND CURRENT ROW)) AS moving_avg_profit
FROM total_finance;


-- --- III. Restaurant Analysis

-- 1. Number of restaurants (group by category).
SELECT 
	res_categ,
	COUNT(DISTINCT res_brand) AS total_count
FROM fp.restaurant
GROUP BY res_categ
ORDER BY total_count DESC;

-- 2. Which cuisine type has the most orders?
SELECT 
	res_cuisine AS cuisine,
	COUNT(order_id) AS total_orders
FROM fp.restaurant
GROUP BY cuisine
ORDER BY total_orders DESC;

-- 3. Which restaurant brand/s have the most refund?
SELECT
	res_brand AS Brand,
	res_cuisine AS Cuisine,
	COUNT(res.order_id) AS total_refunds
FROM fp.restaurant AS res
LEFT JOIN fp.orderf AS ord
	ON res.order_id = ord.order_id
WHERE order_status = 'Refunded'
GROUP BY Brand, Cuisine
ORDER BY total_refunds DESC; 

-- ~3.1 What is the refund rate for these brands?

-- Note: Need to make a CTE of a more effective query than above. 
-- 		 Using a case statement for total_refunds is much better 
--		 than using a simple where clause.

WITH ref_cte AS (
SELECT
	res_brand AS Brand,
	res_cuisine AS Cuisine,
	COUNT(
		CASE WHEN 
		ord.order_status = 'Refunded' 
		THEN res.order_id 
	END) AS total_refunds,
	COUNT(res.order_id) AS total_orders
FROM fp.restaurant AS res
LEFT JOIN fp.orderf AS ord
	ON res.order_id = ord.order_id
GROUP BY Brand, Cuisine
ORDER BY total_refunds DESC)
SELECT
	*,
	ROUND(total_refunds * 100/ total_orders::NUMERIC, 2) AS refund_rate
FROM ref_cte
ORDER BY refund_rate DESC;

-- 4. Give a total count of restaurant chains and provide their percentages.
WITH chain_cte AS (
	SELECT
		res_chain,
		COUNT(DISTINCT res_brand) AS total_count
	FROM fp.restaurant
	GROUP BY res_chain
	)
SELECT
	res_chain,
	total_count,
	ROUND((total_count * 100.0) / SUM(total_count) OVER(), 2) AS Percentage
FROM chain_cte;

-- 5. Rank all brands based on their average ratings.
SELECT
	res_brand,
	COUNT(order_id) AS total_orders,
	ROUND(AVG(res_rate), 1) AS avg_rate,
	ROW_NUMBER() OVER(ORDER BY AVG (res_rate) DESC) AS ranking
FROM fp.restaurant
GROUP BY res_brand;

-- 6. Categorize restaurants based on their age 
-- 	  (established = over 20 years; not new = over ten; new = less than 10)

SELECT
	res_brand,
	res_founded,
	CASE 
		WHEN res_founded > '2016' THEN 'New'
		WHEN res_founded <= '2016' AND res_founded > '2006' THEN 'Not new'
		WHEN res_founded <= '2006' THEN 'Established'
	END AS Age
FROM fp.restaurant;

-- 7. Categorize how many restaurants registered in terms of
--	  2020s and 2010s.

SELECT
	CASE 
		WHEN res_fp_start >= '2020' THEN '2020s'
		ELSE '2010s'
	END AS reg_decade,
	COUNT(DISTINCT res_brand) AS Brand
FROM fp.restaurant
GROUP BY reg_decade;

-- 8. Check the amount of orders in a areas given that the city is Manila.
SELECT
	res_area,
	COUNT(order_id) AS total_orders
FROM fp.restaurant
WHERE res_city = 'Manila'
GROUP BY res_area;

-- --- IV. Delivery Analysis

-- 1. What area in each city has the most orders?
WITH pop_area AS (
	SELECT
		deliver_country,
		deliver_city,
		deliver_area,
		COUNT(order_id) AS total_orders,
		ROW_NUMBER() OVER(PARTITION BY deliver_city
		ORDER BY COUNT(order_id) DESC) AS area_rank
	FROM fp.delivery
	GROUP BY deliver_country, deliver_city, deliver_area
)
SELECT 
	deliver_country AS Country,
	deliver_city AS City,
	deliver_area AS Area,
	total_orders
FROM pop_area
WHERE area_rank = 1
ORDER BY total_orders DESC;

-- ~1.1 Check the areas with the lowest orders.
WITH pop_area AS (
	SELECT
		deliver_country,
		deliver_city,
		deliver_area,
		COUNT(order_id) AS total_orders,
		ROW_NUMBER() OVER(PARTITION BY deliver_city
		ORDER BY COUNT(order_id) DESC) AS area_rank
	FROM fp.delivery
	GROUP BY deliver_country, deliver_city, deliver_area
)
SELECT 
	deliver_country AS Country,
	deliver_city AS City,
	deliver_area AS Area,
	total_orders
FROM pop_area
WHERE area_rank >= 3
ORDER BY total_orders DESC;

-- ~1.2 Check the top time of day of these popular areas.
WITH 
	pop_area AS (
	SELECT
		deliver_country,
		deliver_city,
		deliver_area,
		COUNT(DISTINCT order_id) AS total_orders,
		ROW_NUMBER() OVER(PARTITION BY deliver_city
		ORDER BY COUNT(order_id) DESC) AS area_rank
	FROM fp.delivery 
	GROUP BY deliver_country, deliver_city, deliver_area),-- pop_area is for number of orders in the area.
	pop_time AS (
	SELECT
		deliver_country,
		deliver_city,
		deliver_area,
		CASE
			WHEN order_time >= '06:00:00' AND order_time <= '11:59:59' THEN 'Morning'
			WHEN order_time >= '12:00:00' AND order_time <= '17:59:59' THEN 'Afternoon'
			ELSE 'Night'
		END AS time_of_day,
		COUNT(DISTINCT ord.order_id) AS total_orders,
		ROW_NUMBER() OVER(PARTITION BY deliver_area
		ORDER BY COUNT(ord.order_id) DESC) AS time_rank
	FROM fp.orderf AS ord
	LEFT JOIN fp.delivery AS del
		ON ord.order_id = del.order_id
	GROUP BY deliver_country, deliver_city, deliver_area, time_of_day
	ORDER BY total_orders DESC) -- pop_time is to organize total orders under morning, afternoon, or night.
SELECT 
	pop_area.deliver_country,
	pop_area.deliver_city,
	pop_area.deliver_area,
	pop_area.total_orders,
	time_of_day AS time_of_day_TOD,
	pop_time.total_orders AS orders_TOD,
	ROUND(pop_time.total_orders * 100 / pop_area.total_orders::NUMERIC, 2) AS Percent_TOD_of_total
FROM pop_area
LEFT JOIN pop_time
ON pop_area.deliver_area = pop_time.deliver_area
WHERE area_rank = 1 AND time_rank = 1
ORDER BY pop_area.total_orders DESC; -- FOR VIZ
-- This query determines the time of day (TOD) when there are most orders per top area of a city.
-- It also includes the total orders for the top TOD as well as its percentage share of the total_orders.

