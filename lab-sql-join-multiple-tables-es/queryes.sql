USE sakila;

-- Escribe una consulta para mostrar para cada tienda su ID de tienda, ciudad y país.

-- SELECT store_id, address_id FROM store;
-- SELECT * FROM address WHERE address_id=1;
-- SELECT * FROM city WHERE city_id=300;
-- SELECT * FROM country WHERE country_id=20;

SELECT * from store;
SELECT * from address WHERE address_id=1;

SELECT
	s.store_id,
    ci.city,
	co.country
FROM store s
JOIN address a ON s.address_id = a.address_id
JOIN city ci ON a.city_id = ci.city_id
JOIN country co ON ci.country_id = co.country_id;

-- Escribe una consulta para mostrar cuánto negocio, en dólares, trajo cada tienda. amount == ventas

-- SELECT * FROM store;
-- SELECT * FROM staff WHERE staff_id=1;
-- describe payment;
-- SELECT sum(amount) as amount FROM payment WHERE staff_id=1;


SELECT
	s.store_id,
    SUM(p.amount) -- suma el dinero total
FROM store s
JOIN staff sta ON sta.staff_id = s.manager_staff_id -- todos los empleados que trabajan en la tienda
JOIN payment p ON sta.staff_id = p.staff_id -- todos los pagos hechos por esos empleados
GROUP BY s.store_id; -- para que la suma sea por tienda.

-- ¿Cuál es el tiempo de ejecución promedio de las películas por categoría?

-- describe film_category;
-- SELECT * from category;
-- SELECT * from film_category;
-- SELECT * from film;

SELECT
	c.name,
    SUM(f.length) as total_duracion -- film?
FROM category c
JOIN film_category fc ON c.category_id = fc.category_id
JOIN film f ON f.film_id = fc.film_id
GROUP BY c.name;

-- ¿Qué categorías de películas son las más largas?

SELECT
	c.name,
    SUM(f.length) as total_duracion-- film?
FROM category c
JOIN film_category fc ON c.category_id = fc.category_id
JOIN film f ON f.film_id = fc.film_id
GROUP BY c.name
ORDER BY total_duracion DESC;

-- Muestra las películas más alquiladas en orden descendente.

-- describe rental;
-- SELECT * from rental;

-- describe film;
-- describe inventory;
-- describe rental;

SELECT
	f.title,
    COUNT(r.rental_id) as veces_alquilada
FROM film f
JOIN inventory i ON f.film_id = i.inventory_id
JOIN rental r ON i.inventory_id = r.inventory_id
GROUP BY f.title
ORDER BY veces_alquilada DESC;


-- Enumera los cinco principales géneros en ingresos brutos en orden descendente.

SELECT
	c.name,
    SUM(p.amount) as ingresos_brutos
FROM category c
JOIN film_category fc ON c.category_id = fc.category_id
JOIN film f ON fc.film_id = f.film_id
JOIN inventory i ON f.film_id = i.film_id
JOIN rental r ON i.inventory_id = r.inventory_id
JOIN payment p ON r.rental_id = p.rental_id
GROUP BY c.name
ORDER BY ingresos_brutos DESC
LIMIT 5;

SELECT * FROM sales_by_film_category LIMIT 5;