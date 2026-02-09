CREATE TABLE detailed_rental_report (
    detail_id     SERIAL PRIMARY KEY,
    rental_id     INTEGER NOT NULL,
    rental_date   TIMESTAMP NOT NULL,
    payment_id    INTEGER NOT NULL,
    payment_date  TIMESTAMP NOT NULL,
    amount        NUMERIC(10,2) NOT NULL,
    film_title    VARCHAR(255) NOT NULL,
    category_name VARCHAR(25) NOT NULL
);

CREATE TABLE summary_category_revenue (
    category_name VARCHAR(25) PRIMARY KEY,
    total_rentals INTEGER NOT NULL DEFAULT 0,
    total_revenue NUMERIC(12,2) NOT NULL DEFAULT 0.00
);
