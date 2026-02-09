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
