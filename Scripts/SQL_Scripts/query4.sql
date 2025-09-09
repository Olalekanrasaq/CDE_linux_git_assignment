-- Provide a table that shows the region for each sales rep along with their associated accounts. 
-- Your final table should include three columns: 
-- the region name, the sales rep name, and the account name. 
-- Sort the accounts alphabetically (A-Z) by account name.

SELECT s.name as salesrep, r.name as region, a.name as account_name
FROM sales_reps s
RIGHT JOIN accounts a ON s.id = a.sales_rep_id
INNER JOIN region r ON s.region_id = r.id
ORDER BY account_name;