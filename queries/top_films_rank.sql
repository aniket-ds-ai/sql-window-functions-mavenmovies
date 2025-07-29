WITH ranked_films AS (
  SELECT 
    f.title, 
    COUNT(*) AS rental_count,
    DENSE_RANK() OVER (ORDER BY COUNT(*) DESC) AS film_rank
  FROM film f
  INNER JOIN inventory i ON f.film_id = i.film_id
  INNER JOIN rental r ON i.inventory_id = r.inventory_id
  GROUP BY f.film_id, f.title
)
SELECT *
FROM ranked_films
WHERE film_rank <= 3;
