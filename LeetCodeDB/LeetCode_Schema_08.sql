-- https://leetcode.com/problems/average-selling-price/description/?envType=study-plan-v2&envId=top-sql-50

Create table If Not Exists Prices (product_id int, start_date date, end_date date, price int);
Create table If Not Exists UnitsSold (product_id int, purchase_date date, units int);
Truncate table Prices;
insert into Prices (product_id, start_date, end_date, price) values ('1', '2019-02-17', '2019-02-28', '5');
insert into Prices (product_id, start_date, end_date, price) values ('1', '2019-03-01', '2019-03-22', '20');
insert into Prices (product_id, start_date, end_date, price) values ('2', '2019-02-01', '2019-02-20', '15');
insert into Prices (product_id, start_date, end_date, price) values ('2', '2019-02-21', '2019-03-31', '30');
Truncate table UnitsSold;
insert into UnitsSold (product_id, purchase_date, units) values ('1', '2019-02-25', '100');
insert into UnitsSold (product_id, purchase_date, units) values ('1', '2019-03-01', '15');
insert into UnitsSold (product_id, purchase_date, units) values ('2', '2019-02-10', '200');
insert into UnitsSold (product_id, purchase_date, units) values ('2', '2019-03-22', '30');

SELECT * FROM PRICES;
SELECT * FROM UNITSSOLD;

-- Write a solution to find the average selling price for each product. 
-- average_price should be rounded to 2 decimal places. If a product does not have any sold units, 
-- its average selling price is assumed to be 0.

SELECT * FROM PRICES p
JOIN UNITSSOLD u ON p.product_id = u.product_id;

SELECT p.product_id, SUM(price), SUM(units) FROM PRICES p
JOIN UNITSSOLD u ON p.product_id = u.product_id
GROUP BY p.product_id;

SELECT p.product_id, SUM(units) FROM PRICES p
JOIN UNITSSOLD u ON p.product_id = u.product_id
GROUP BY p.product_id;

SELECT p.product_id, IFNULL(ROUND(SUM(units*price)/SUM(units),2),0) AS average_price FROM Prices p 
LEFT JOIN UnitsSold u
ON p.product_id = u.product_id AND
u.purchase_date BETWEEN start_date AND end_date
group by product_id;