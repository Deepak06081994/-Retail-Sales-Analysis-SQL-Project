SELECT * FROM Retail_sale

--Data Exploration---

--- How Much Sale We have?

SELECT COUNT(*) as total_sale from Retail_sale
 
---How Many Unique customers do we have?

SELECT COUNT(DISTINCT customer_id) as Costomer_id FROM Retail_sale 

DISTINCT IS USE FOR Repeate Coustamer
