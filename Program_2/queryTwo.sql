-- We want to find out how many of each category of film ED CHASE has starred in.

-- So return a table with category_name and the count of the number_of_films that ED was in that category.

-- Your query should return every category even if ED has been in no films in that category

-- Order by the category name in ascending order.

SELECT category.name AS category_name, COUNT(actor.actor_id) AS number_of_films FROM category
  LEFT JOIN film_category ON category.category_id = film_category.category_id
  LEFT JOIN film ON film_category.film_id = film.film_id
  LEFT JOIN film_actor ON film.film_id = film_actor.film_id
  LEFT JOIN actor ON (film_actor.actor_id = actor.actor_id) AND (actor.first_name = 'ED' AND actor.last_name = 'CHASE')
GROUP BY category.name
