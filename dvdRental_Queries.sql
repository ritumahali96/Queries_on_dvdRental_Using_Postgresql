--1.) Do we have actors in the actor table that share the full name and if yes display those shared names.
--first we need to know if we have actors in the actor table that share their full names. 
--So I will start by counting the number of actors that share their full names.
SELECT COUNT(DISTINCT first_name || last_name)
From actor;
--We get to know that we have 198 distinct actor’s full names out of 200 actors, which 
--means that 2 actors share the same full name.
--Now, I will find out the name of that actor that is shared.
SELECT DISTINCT a1.first_name , a1.last_name
FROM actor a1 JOIN actor a2
ON a1.actor_id <> a2.actor_id AND a1.first_name = a2.first_name AND a1.last_name = a2.last_name;

--2.) Return the customer IDs of customers who have spent at least $110 with the staff member 
-- who has an ID of 2.
-- aggregate function SUM(amount) will give us the total amount spent with the staff by the customer. 
-- So we select the customer_id along with calculated SUM(amount) from the payment table.
-- Then we apply the condition according to the question using WHERE , GROUP BY and HAVING.

SELECT customer_id, SUM(amount) 
FROM payment
WHERE staff_id = 2
GROUP BY customer_ID
HAVING SUM(amount) >= 110; 

--3.) How many films begin with the letter J?
-- Count the number of films that begin with the letter J by using the following code:
SELECT COUNT(title)
FROM film
WHERE title LIKE 'J%';

--4.)What customer has the highest customer ID number whose name starts with an 'E' 
--   and has an address ID lower than 500?
-- Here we select the customer_id number whose name starts wit E using "E%" below address_id 500.
-- Then we arrange the list in descending order and select the topmost customer_id using LIMIT 1.
SELECT first_name, last_name, customer_id 
FROM customer
WHERE first_name LIKE 'E%' AND address_id < 500
ORDER BY customer_id DESC
LIMIT 1;

--5.)How many films have the word Truman somewhere in the title?
-- Return the number of films have the word Truman somewhere in the title
SELECT COUNT(*)
FROM film
WHERE title LIKE '%Truman%';

--6.) Display the total amount paid by all customers in the payment table.
-- We use the aggregate function SUM() on the amount column from the payment table.
SELECT SUM(amount)
FROM payment;

--7.) Display the total amount paid by each customer in the payment table.
-- Here we use aggregate function SUM(amount) for each of the customer_id using SELECT from the payment
--table.
-- Then we use GROUP BY for similar kind of rows which is followed by ORDER By to arrange it in ascending
--order.
SELECT customer_id , SUM(amount)
FROM payment
GROUP BY customer_id
ORDER BY customer_id;

--8.) What is the highest total_payment done?
--We group the amounts payed by each customer_id, then calculate the Sum(), 
-- Then we order the total_paymnets descending and selected the top value only (LIMIT 1).
SELECT SUM(amount) AS total_payment
FROM payment
GROUP BY customer_id
ORDER BY SUM(amount) DESC LIMIT 1;

--9.Which customers have not rented any movies so far.
-- A customer could have registered as being a customer for the dvdrental place,
-- but have not started to rent dvd’s yet.
SELECT customer_id , first_name , last_name
FROM customer
WHERE customer_id NOT IN
(SELECT distinct customer_id
  FROM rental);

--10.) How many payment transactions were greater than $5.00?
-- Return the number of payment transactions were greater than $5.00 using aggregate function COUNT()
SELECT COUNT(amount)
FROM payment
WHERE amount > 5;
 
