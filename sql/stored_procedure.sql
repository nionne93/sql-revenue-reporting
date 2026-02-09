CREATE OR REPLACE PROCEDURE refresh_category_revenue_report()
LANGUAGE plpgsql
AS $$
BEGIN
    TRUNCATE TABLE detailed_rental_report RESTART IDENTITY;
    TRUNCATE TABLE summary_category_revenue;

    INSERT INTO detailed_rental_report (
        rental_id,
        rental_date,
        payment_id,
        payment_date,
        amount,
        film_title,
        category_name
    )
    SELECT
        r.rental_id,
        r.rental_date,
        p.payment_id,
        p.payment_date,
        p.amount,
        f.title AS film_title,
        c.name  AS category_name
    FROM rental r
    JOIN payment p
        ON p.rental_id = r.rental_id
    JOIN inventory i
        ON i.inventory_id = r.inventory_id
    JOIN film f
        ON f.film_id = i.film_id
    JOIN film_category fc
        ON fc.film_id = f.film_id
    JOIN category c
        ON c.category_id = fc.category_id;
END;
$$;
