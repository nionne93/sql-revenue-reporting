CREATE OR REPLACE FUNCTION trg_update_summary_category_revenue()
RETURNS TRIGGER
LANGUAGE plpgsql
AS $$
BEGIN
    INSERT INTO summary_category_revenue (
        category_name,
        total_rentals,
        total_revenue
    )
    VALUES (
        NEW.category_name,
        1,
        NEW.amount
    )
    ON CONFLICT (category_name)
    DO UPDATE SET
        total_rentals = summary_category_revenue.total_rentals + 1,
        total_revenue = summary_category_revenue.total_revenue + NEW.amount;

    RETURN NEW;
END;
$$;

CREATE TRIGGER after_insert_detailed_update_summary
AFTER INSERT ON detailed_rental_report
FOR EACH ROW
EXECUTE FUNCTION trg_update_summary_category_revenue();
