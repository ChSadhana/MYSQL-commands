
use sakila;

#1.Select all Actors from the table.
SELECT * FROM actor;

select first_name, last_name from actor;

#2.	Find the actor with the first name “John”.
SELECT * FROM actor WHERE first_name="JOHN";

#3.	Find all actors with the surname “Neeson”.
SELECT * FROM actor WHERE last_name="neeson";

#4.	Find all actors with Id numbers divisible by 10
SELECT * FROM actor WHERE actor_id%10=0;


SELECT * FROM film;

#5.	What is the description of the movie with ID of 100?
SELECT * FROM film WHERE film_id=100;

#6.	Find every movie with a rating of “R”.
SELECT * FROM film WHERE rating="R";

#7.	Find every movie except those with a rating of “R”.
SELECT * FROM film WHERE rating != "R";

#8.	Find the 10 shortest movies.
SELECT * FROM film ORDER BY length ASC LIMIT 10;

#9.	Now return only the movie titles.
SELECT title FROM film;

#10.	Find all movies with Deleted Scenes.
SELECT title FROM film WHERE special_features="deleted scenes";

#11.	Which last names are not repeated?
SELECT DISTINCT last_name FROM actor ORDER BY last_name;

#12.	Which last names appear more than once?
SELECT last_name ,COUNT(last_name) FROM actor GROUP BY last_name;

SELECT * FROM film_actor;
use sakila;

#13.	Which actor has appeared in the most films?
SELECT first_name,last_name, COUNT(f.actor_id)
FROM actor a JOIN film_actor f ON A.actor_id=F.actor_id
GROUP BY a.actor_id
ORDER BY COUNT(f.actor_id) DESC LIMIT 1;


#14.	Is ‘Academy Dinosaur’ available for rent from Store 1?
SELECT * FROM inventory i
JOIN film f ON f.film_id=i.film_id
WHERE i.store_id=1 AND f.title="Academy dinosaur";

#15.	When is ‘Academy Dinosaur’ due?
SELECT return_date
FROM rental r 
INNER JOIN inventory i ON i.inventory_id = r.inventory_id 
INNER JOIN  film f ON f.film_id = i.film_id 
WHERE f.title = "Academy Dinosaur"
ORDER BY return_date DESC;

#16.	What is that average running time of all the films in the database?
SELECT AVG(length) FROM film;

#17.	What is the average running time of films by category?
SELECT category.name, AVG(LENGTH)
FROM film f JOIN film_category USING (film_id) JOIN category USING (category_id)
GROUP BY category.name
HAVING AVG(length) > (select AVG(length) FROM film)
ORDER BY AVG(length) DESC;

#18.	How many movies have Robots in them?
SELECT COUNT(*) FROM film f
WHERE description LIKE "%Robot%";

#19.	Find the movie(s) with the longest runtime.
SELECT MAX(length) AS movies FROM film;

#20.	Count how many movies were released in 2010.
SELECT COUNT(release_year) FROM film WHERE release_year= "2010";

#21.Find the titles of all horror movies.
SELECT title FROM film ;

#22.Return the full name of the staff member – in a column named full_name – with the ID of 1.
SELECT first_name,last_name FROM staff WHERE staff_id=1;

#24.	Find out which location has the most copies of BUCKET BROTHERHOOD.
SELECT COUNT(film_id), store_id FROM inventory
WHERE film_id=(SELECT film_id FROM film WHERE title='Bucket Brotherhood')
GROUP BY store_id;

#25.	How many distinct countries are there?
SELECT DISTINCT COUNT(country) FROM country;

#What are the names of all the languages in the database (sorted alphabetically)?
SELECT name FROM language ORDER BY name ASC;

#26.	Return the full names (first and last) of actors with “son” in their last name, ordered by their first name.
SELECT first_name,last_name FROM actor WHERE last_name LIKE "%SON" ORDER BY first_name ASC;

#27.	Create a list of categories and the number of films for each category.
SELECT c.name, COUNT(f.film_id) 
FROM category c LEFT JOIN film f
ON f.film_id = c.category_id
GROUP BY c.category_id, c.name;

#28.Create a list of actors and the number of movies by each actor.
select first_name,last_name
     , count(title)
     , release_year 
  from actor
  join film 
    on film.film_id = actor.actor_id 
 group 
    by release_year 
 order 
    by count(title);


