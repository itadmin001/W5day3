

-- #1
Select customer.address_id, first_name,last_name,address.district
FROM customer
INNER JOIN address
ON customer.address_id = address.address_id
WHERE address.district = 'Texas';

-- #2
SELECT first_name,last_name
FROM customer
RIGHT JOIN payment
ON customer.customer_id = payment.customer_id
WHERE amount > 6.99;



-- #3
SELECT customer_id,first_name,last_name
FROM customer
WHERE customer_id IN(
    SELECT customer_id
    FROM payment
    GROUP BY customer_id
    HAVING SUM(amount) > 175
    ORDER BY SUM(amount)
);

-- #4
SELECT city_id,city.country_id
FROM city
INNER JOIN country
ON country.country_id = city.country_id
WHERE country.country = 'Nepal';

-- #5
SELECT first_name, last_name, staff.staff_id, COUNT(staff.staff_id)
from staff
FULL JOIN payment
ON staff.staff_id = payment.staff_id
GROUP BY staff.staff_id
ORDER BY count DESC;

-- #6
SELECT rating, COUNT(rating) 
from film
GROUP BY rating
ORDER BY count DESC;

-- #7
SELECT first_name, last_name
from customer
where customer_id IN( 
    SELECT customer_id
    FROM payment
    WHERE amount > 6.99
    GROUP BY customer_id
    HAVING COUNT(customer_id) = 1
);

-- #8
SELECT amount
FROM payment
WHERE amount = 0.00
