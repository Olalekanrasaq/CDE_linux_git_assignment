--  Find all the company names that start with a 'C' or 'W', 
-- and where the primary contact contains 'ana' or 'Ana', but does not contain 'eana'.

with primary_contact as (
    SELECT name, primary_poc
    FROM accounts
    WHERE (primary_poc LIKE '%ana%' OR primary_poc LIKE '%Ana%') 
      AND primary_poc NOT LIKE '%eana%'
)
SELECT name
FROM primary_contact
WHERE name LIKE 'C%' or name LIKE 'W%';