/*Total Revenue, Total Orders, Total Customers, Average Rating,
 Last Quarter Revenue, Last Quarter Orders, Average Days to Ship, % Good Feedback*/

#total customer 
 select count(customer_id) as total_customer
 from customer_t;
 
SELECT SUM(quantity * vehicle_price) AS total_revenue
FROM order_t;

select Count(DISTINCT Order_id) AS TotalOrders
from order_t;




#avg day to ship
SELECT AVG(DATEDIFF(ship_date, Order_Date)) AS average_days
FROM order_t;

#avg rating
SELECT AVG(
    CASE 
        WHEN customer_feedback = 'Very Bad' THEN 1
        WHEN customer_feedback = 'Bad' THEN 2
        WHEN customer_feedback = 'Okay' THEN 3
        WHEN customer_feedback = 'Good' THEN 4
        WHEN customer_feedback = 'Very Good' THEN 5
        ELSE NULL  -- Handle other cases if any
    END
) AS average_rating
FROM order_t;

#% of good feed back
SELECT
    (COUNT(CASE WHEN customer_feedback = 'Good' THEN 1 ELSE NULL END) / COUNT(*)) * 100 AS percentage_good
FROM order_t;


SELECT COUNT(*) AS last_quarter_order_count
FROM order_t
WHERE quarter_number = (
    SELECT MAX(quarter_number)
    FROM order_t
);


SELECT SUM(quantity * vehicle_price) AS last_quarter_revenue
FROM order_t
WHERE quarter_number = (
    SELECT MAX(quarter_number)
    FROM order_t
);


select *
from customer_t;


SELECT (quantity * vehicle_price) AS total_revenue
FROM order_t;

select ship_date,ship_mode,shipping
from order_t;