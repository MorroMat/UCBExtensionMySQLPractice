USE sakila;

-- 1
SELECT first_name, last_name FROM actor;
SELECT CONCAT_WS(', ', first_name, last_name) AS 'Actor Name' FROM actor;

-- 2
SELECT actor_id, first_name, last_name FROM actor WHERE first_name = "Joe";
SELECT * FROM actor WHERE last_name LIKE '%GEN%';
SELECT last_name, first_name FROM actor WHERE last_name LIKE '%li%';
SELECT country_id, country FROM country WHERE country IN
	('Afghanistan', 'Bangladesh', 'China');
    
-- 3
ALTER TABLE actor
ADD COLUMN description BLOB;
ALTER TABLE actor
DROP COLUMN description;

-- 4
SELECT last_name, COUNT(last_name) FROM actor GROUP BY last_name;
SELECT last_name, COUNT(last_name) FROM actor GROUP BY last_name HAVING COUNT(last_name) > 1;
UPDATE actor SET first_name = 'Harpo' WHERE first_name = 'Groucho' AND last_name = 'Williams';
UPDATE actor SET first_name = 'Groucho' WHERE first_name = 'Harpo' AND last_name = 'Williams';

-- 5
CREATE TABLE address(
	address_id INT AUTO_INCREMENT NOT NULL,
    address VARCHAR(30),
    address2 VARCHAR(30),
    district VARCHAR(15),
    city_id INT,
    postal_code INT,
    phone INT,
    location BLOB,
    last_update DATETIME
);

-- 6
SELECT * FROM payment;
SELECT * FROM customer;
SELECT staff.first_name, staff.last_name, address.address
FROM staff
LEFT JOIN address
ON staff.address_id = address.address_id;
SELECT staff.first_name, staff.last_name, SUM(payment.amount) AS Sum
FROM staff
JOIN payment
ON staff.staff_id = payment.staff_id
WHERE payment.payment_date LIKE "2005-08-%"
GROUP BY staff.staff_id;
SELECT film.title, COUNT(film_actor.actor_id) AS Total_Actor_Appearances
FROM film
INNER JOIN film_actor
ON film.film_id = film_actor.film_id
GROUP BY film.film_id;
SELECT film.title, COUNT(inventory.film_id) as Inventory_Total
FROM film
INNER JOIN inventory
ON film.film_id = inventory.film_id
WHERE film.title = "Hunchback Impossible"
GROUP BY film.film_id;
SELECT customer.last_name, customer.first_name, SUM(payment.amount) AS Total_Paid
FROM customer
INNER JOIN payment
ON customer.customer_id = payment.customer_id
GROUP BY customer.last_name;
