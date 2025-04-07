SELECT * FROM Retail_sale
--Data Exploration---

--- How Much Sale We have ?
SELECT COUNT(*) as total_sale from Retail_sale
 
---How Much Uniqe Coustamer We have?

SELECT COUNT(DISTINCT customer_id) as Costomer_id FROM Retail_sale 

---How Much Uniqe Category We have?

SELECT DISTINCT category as DISTINCT_Category FROM Retail_sale 

---Data Anaylsis------

