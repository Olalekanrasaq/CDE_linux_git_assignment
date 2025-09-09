-- a query that returns a list of orders where the standard_qty is zero 
-- and either the gloss_qty or poster_qty is over 1000.

with gloss_poster_qty as (
    SELECT id, standard_qty
    FROM orders
    WHERE gloss_qty > 1000 or poster_qty > 1000
)
SELECT id
FROM gloss_poster_qty
WHERE standard_qty = 0;