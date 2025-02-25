SELECT * FROM eda_mysql.supermarket;

-- 1. Display the first 5 rows from the dataset.

SELECT
*
FROM supermarket
LIMIT 5;

-- 2. Display the last 5 rows from the dataset.

SELECT *
FROM supermarket
ORDER BY `Invoice ID` DESC
LIMIT 5;

-- 3. Display random 5 rows from the dataset.

SELECT *
FROM supermarket
ORDER BY rand()
LIMIT 5;

-- 4. Display count, min, max, avg, and std values for a column in the dataset.
SELECT count(`gross income`), 
min(`gross income`), 
max(`gross income`),
avg(`gross income`),
std(`gross income`) 
FROM supermarket;

-- 5. Find the number of missing values.

SELECT COUNT(*) 
FROM supermarket 
WHERE Branch is NULL;

-- 6. Count the number of occurrences of each city.

SELECT City, Count(City) 
FROM supermarket
GROUP BY city;

-- 7. Find the most frequently used payment method.

SELECT Payment, Count(*) 
FROM supermarket 
GROUP BY Payment 
ORDER BY count(*) DESC;

-- 8. Does the Cost of Goods Sold Affect The Rating that the customers Provide?
-- (Numerical - Numerical)

SELECT Rating, cogs
FROM supermarket;

-- 9. Find the most profitable branch as per gross income.

SELECT Branch, round(sum(`Gross income`),2) as sum_gross_income
FROM supermarket
GROUP BY Branch 
ORDER BY sum_gross_income DESC;

SELECT city, Branch, SUM(`gross income`) 
FROM supermarket 
GROUP BY City, Branch;

-- 10. Find the most used payment method city-wise.

SELECT *
FROM supermarket;

SELECT city,
	SUM(case when Payment="Cash" then 1 else 0 end) as "Cash",
    SUM(case when Payment="Ewallet" then 1 else 0 end) as "Ewallet",
	SUM(case when Payment="Credit card" then 1 else 0 end) as "Credit card"
FROM supermarket 
GROUP BY City;

-- 11. Find the product line purchased in this highest quantity.

SELECT `Product line`, SUM(Quantity)
FROM eda_mysql.supermarket
GROUP BY `Product line` 
ORDER BY SUM(Quantity) DESC;


-- 12. Display the daily sales by day of the week.

SELECT * FROM supermarket;
UPDATE supermarket SET date = str_to_date(Date, '%m/%d/%Y');
SELECT * FROM supermarket;
UPDATE supermarket SET Date = str_to_date(Date, '%m/%d/%Y');
SELECT * FROM supermarket;	
SELECT dayname(date), dayofweek(date), SUM(Total) 
FROM supermarket
GROUP BY dayname(date),  dayofweek(date);

-- 13. Find the month with the highest sales.
SELECT monthname(date), month(date) as month, SUM(Total) as total 
FROM supermarket
GROUP BY name, month order by total desc;

-- 14. Find the time at which sales are highest.
SELECT *
FROM supermarket;

SELECT hour(time) as hour, SUM(Total) as total
FROM supermarket
GROUP BY hour 
ORDER BY total desc;



-- 15. Which gender spends more on average?

SELECT Gender, avg(`gross income`) 
FROM supermarket
GROUP BY Gender;
