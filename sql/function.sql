CREATE OR REPLACE FUNCTION get_category_revenue()
RETURNS TABLE (
    category_name VARCHAR(25),
    total_revenue NUMERIC(12,2)
)
LANGUAGE plpgsql
AS $$
BEGIN
    RETURN QUERY
    SELECT
        c.name AS category_name,
        SUM(p.amount) AS total_revenue
    FROM category c
    JOIN film_category fc
        ON c.category_id = fc.category_id
    JOIN inventory i
        ON i.film_id = fc.film_id
    JOIN rental r
        ON r.inventory_id = i.inventory_id
    JOIN payment p
        ON p.rental_id = r.rental_id
    GROUP BY
        c.name
    ORDER BY
        total_revenue DESC;
END;
$$;
