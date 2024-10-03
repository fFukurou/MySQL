-- https://leetcode.com/problems/immediate-food-delivery-ii/description/?envType=study-plan-v2&envId=top-sql-50

DROP TABLE IF EXISTS DEVLIVERY;
Create table If Not Exists Delivery (delivery_id int, customer_id int, order_date date, customer_pref_delivery_date date);
Truncate table Delivery;
insert into Delivery (delivery_id, customer_id, order_date, customer_pref_delivery_date) values ('1', '1', '2019-08-01', '2019-08-02');
insert into Delivery (delivery_id, customer_id, order_date, customer_pref_delivery_date) values ('2', '2', '2019-08-02', '2019-08-02');
insert into Delivery (delivery_id, customer_id, order_date, customer_pref_delivery_date) values ('3', '1', '2019-08-11', '2019-08-12');
insert into Delivery (delivery_id, customer_id, order_date, customer_pref_delivery_date) values ('4', '3', '2019-08-24', '2019-08-24');
insert into Delivery (delivery_id, customer_id, order_date, customer_pref_delivery_date) values ('5', '3', '2019-08-21', '2019-08-22');
insert into Delivery (delivery_id, customer_id, order_date, customer_pref_delivery_date) values ('6', '2', '2019-08-11', '2019-08-13');
insert into Delivery (delivery_id, customer_id, order_date, customer_pref_delivery_date) values ('7', '4', '2019-08-09', '2019-08-09');

SELECT * FROM DELIVERY;

-- If the customer's preferred delivery date is the same as the order date, then the order is called immediate; otherwise, it is called scheduled.
-- The first order of a customer is the order with the earliest order date that the customer made. It is guaranteed that a customer has precisely one first order.
-- Write a solution to find the percentage of immediate orders in the first orders of all customers, rounded to 2 decimal places.

SELECT *, 
CASE
	WHEN order_date = customer_pref_delivery_date THEN 1
    ELSE 0
END AS immediate_order
FROM DELIVERY;

SELECT
SUM(CASE
	WHEN order_date = customer_pref_delivery_date THEN 1
    ELSE 0
END) AS immediate_order,
COUNT(*) as total_orders
FROM DELIVERY;

SELECT
ROUND(
100 *
SUM(CASE
	WHEN order_date = customer_pref_delivery_date THEN 1
    ELSE 0
END)
/
COUNT(*), 2)
AS immediate_percentage
FROM DELIVERY;



SELECT
    ROUND(
        100 * SUM(CASE 
            WHEN order_date = customer_pref_delivery_date THEN 1 
            ELSE 0 
        END) 
        / COUNT(*), 2
    ) AS immediate_percentage
FROM (
    SELECT customer_id, order_date, customer_pref_delivery_date
    FROM DELIVERY
    WHERE order_date = (SELECT MIN(order_date) 
                        FROM DELIVERY d2 
                        WHERE d2.customer_id = DELIVERY.customer_id)
) AS first_orders;

select customer_id, min(order_date) 
from Delivery 
group by customer_id;

select  round(100*sum(case when order_date = customer_pref_delivery_date then 1 else 0 end)/count(*),2)   as immediate_percentage 
from Delivery 
where (customer_id, order_date) in 
(select customer_id, min(order_date) 
from Delivery 
group by customer_id);


