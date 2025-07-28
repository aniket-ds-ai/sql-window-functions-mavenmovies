-- 🔍 Purpose:
-- Identify the top 3 most active customers based on the number of rentals,
-- and assign a rank to them using the RANK() window function.

-- ✅ Step 1: Calculate total rentals per customer using JOIN and GROUP BY
WITH rental_counts AS (
    SELECT
        c.customer_id,
        CONCAT(c.first_name, ' ', c.last_name) AS customer_name,
        COUNT(r.rental_id) AS total_rentals
    FROM customer c
    JOIN rental r ON c.customer_id = r.customer_id
    GROUP BY c.customer_id, c.first_name, c.last_name
)

-- ✅ Step 2: Apply RANK() to assign customer rankings by total rentals
SELECT
    customer_id,
    customer_name,
    total_rentals,
    RANK() OVER (ORDER BY total_rentals DESC) AS customer_rank
FROM rental_counts
WHERE total_rentals > 0
LIMIT 3;
