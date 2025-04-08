SELECT * FROM Retail_sale
--Data Exploration---

--- How Much Sale We have ?
SELECT COUNT(*) as total_sale from Retail_sale
 
---How Much Uniqe Coustamer We have?

SELECT COUNT(DISTINCT customer_id) as Costomer_id FROM Retail_sale 

---How Much Uniqe Category We have?

SELECT DISTINCT category as DISTINCT_Category FROM Retail_sale 

---Data Anaylsis & Business Key Problem & Answers ------


--Write a SQL query to retrieve all columns for sales made on '2022-11-05:

SELECT customer_id,gender ---*
FROM Retail_sale 
WHERE sale_date = '2022-11-05'

--Write a SQL query to retrieve all transactions where the category is 'Clothing' and the quantity sold is more than 4 in the month of Nov-2022:--

SELECT *
FROM Retail_sale
WHERE 
   category = 'Clothing'
   AND
   FORMAT(sale_date, 'yyyy-MM') = '2022-11'
   AND
   quantiy>=4
  
--Write a SQL query to calculate the total sales (total_sale) for each category.:

SELECT COUNT (total_sale) as total_Sale ,category FROM Retail_sale
GROUP BY 
    category

--Write a SQL query to find the average age of customers who purchased items from the 'Beauty' category.:

SELECT  AVG(age) AS Avreage_Customaer
FROM Retail_sale
WHERE category = 'Beauty';

--Write a SQL query to find all transactions where the total_sale is greater than 1000.:

SELECT * FROM Retail_sale
WHERE total_sale >1000

--Write a SQL query to find the total number of transactions (transaction_id) made by each gender in each category

SELECT COUNT (transactions_id)as Total,gender, category FROM Retail_sale

GROUP BY gender,category
ORDER BY 1

--Write a SQL query to calculate the average sale for each month. Find out best selling month in each year:

SELECT 
    YEAR(sale_date) AS Year,
    MONTH(sale_date) AS Month,
    AVG(total_sale) AS Total_sale,
    RANK() OVER (
        PARTITION BY YEAR(sale_date)
        ORDER BY AVG(total_sale) DESC
    ) AS Sale_Rank
FROM Retail_sale
GROUP BY
    YEAR(sale_date),
    MONTH(sale_date)
ORDER BY
    Year,
    Sale_Rank;

--Write a SQL query to find the top 5 customers based on the highest total sales **:

SELECT TOP 5 customer_id, SUM (total_Sale) as Total_Sale
FROM Retail_sale
Group by customer_id 
Order by Total_Sale DESC

--Write a SQL query to find the number of unique customers who purchased items from each category.:

SELECT category, COUNT (DISTINCT customer_id)
FROM Retail_sale
group BY category

--Write a SQL query to create each shift and number of orders (Example Morning <12, Afternoon Between 12 & 17, Evening >17):

SELECT *,
     CASE
	   WHEN  DATEPART(HOUR, sale_time)<12 THEN 'Morning'
	   WHEN  DATEPART(HOUR,sale_time)<=12 AND  DATEPART(HOUR,sale_time)<17  THEN 'Afternoon'
	   WHEN  DATEPART(HOUR,sale_time)>17 THEN 'Evening'
	   END AS SHIFT
FROM Retail_sale