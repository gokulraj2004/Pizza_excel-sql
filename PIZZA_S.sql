CREATE DATABASE PIZZADB;
USE  PIZZADB;
#TO VIEW ALL THE DATA FROM THE TABLE
SELECT * FROM PIZZA_SALES;
#Total Revenue: The sum of the total price of all pizza orders.
SELECT SUM(TOTAL_PRICE) AS PRICE_TOT_PIZZAS FROM PIZZA_SALES;
#THE AVERAGE AMOUNT SPENT PER ORDER, CALCULATED BY DIVIDING THE TOTAL REVENUE BY THE TOTAL NUMBER OF ORDERS
SELECT CAST(SUM(TOTAL_PRICE)/(COUNT(DISTINCT(ORDER_ID))) AS DECIMAL(10,2)) AS AVG_ORDER_VAL FROM PIZZA_SALES;
#THE SUM OF THE QUANTITIES OF ALL PIZZAS SOLD.
SELECT COUNT(QUANTITY) AS TOTAL_PIZZA_SOLD FROM PIZZA_SALES;
#THE TOTAL NO. OF ORDERS PLACED
SELECT COUNT(DISTINCT(ORDER_ID)) 
AS TOTAL_ORDERS_PLACED 
FROM PIZZA_SALES;
#THE AVERAGE NUMBER OF PIZZAS SOLD PER ORDER, CALCULATED BY DIVIDING THE TOTAL NUMBER OF PIZZAS SOLD BY THE TOTAL NUMBER OF ORDERS.
SELECT CAST(SUM(QUANTITY)/COUNT(DISTINCT(ORDER_ID)) AS DECIMAL(10,2)) 
AS AVG_PIZZAS_PER_PERSON
FROM PIZZA_SALES;

