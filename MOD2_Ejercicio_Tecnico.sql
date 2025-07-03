
USE sakila;

-- 1. Selecciona todos los nombres de las películas sin que aparezcan duplicados.

SELECT  DISTINCT title AS Título
FROM film;
-- Resultado = 1000 películas

-- 2. Muestra los nombres de todas las películas que tengan una clasificación de "PG-13".

SELECT  DISTINCT title AS Título
FROM film
WHERE rating = "PG-13";
-- Resultado = 233 películas

-- 3. Encuentra el título y la descripción de todas las películas que contengan la palabra "amazing" en su descripción.

SELECT  DISTINCT title AS Título, description AS Descripción 
FROM film
WHERE description LIKE "%amazing%";
-- Resultado = 48 películas

-- 4. Encuentra el título de todas las películas que tengan una duración mayor a 120 minutos.

SELECT  DISTINCT title AS Título, length As Duración 
FROM film
WHERE length > 120
ORDER BY length;                                     -- Se ordenan los resultados de manera ascendente, por eso se usa el Order By
-- Resultado = 48 películas

-- 5. Recupera los nombres de todos los actores.

SELECT first_name AS Nombre, last_name As Apellido   -- Se incluye el last_name para que la query esté más completa que sólo con el nombre
FROM actor
ORDER BY nombre;                                     -- Se ordena aunque no se pida para que el resultado quede más claro
-- Resultado = 200 actores

-- 6. Encuentra el nombre y apellido de los actores que tengan "Gibson" en su apellido.

SELECT first_name AS Nombre, last_name As Apellido   
FROM actor
WHERE last_name = "Gibson";
-- Resultado = 1 actor

SELECT first_name AS Nombre, last_name As Apellido   
FROM actor
WHERE last_name LIKE "%Gibson%";  
-- Resultado = 1 actor                         -- Como el enunciado menciona que tenga, no que sea exacto, también lo hago con el % para asegurarme de que no hay más
-- En este caso coinciden en un sólo resultado

-- 7. Encuentra los nombres de los actores que tengan un actor_id entre 10 y 20.

SELECT first_name AS Nombre, last_name As Apellido, actor_id AS Número_de_Actor   -- No pide el actor_id pero para ver la comparativa también seleccinamos la columna actor_id
FROM actor
WHERE actor_id BETWEEN 10 AND 20;
-- Resultado = 11 actores

-- 8. Encuentra el título de las películas en la tabla film que no sean ni "R" ni "PG-13" en cuanto a su clasificación.

SELECT  DISTINCT title AS Título, rating AS Clasificación
FROM film
WHERE rating NOT IN ("PG-13", "R");   
-- Resultado = 582 películas

-- 9. Encuentra la cantidad total de películas en cada clasificación de la tabla film y muestra la clasificación junto con el recuento.

SELECT rating AS Clasificación, COUNT(*) AS Total_Clasificación
FROM film
GROUP BY rating
ORDER BY Total_Clasificación;                 -- Se ordena de manera ascendente por el alias de COUNT
-- Resultado = 5 clasificaciones (rating)

-- 10. Encuentra la cantidad total de películas alquiladas por cada cliente y muestra el ID del cliente, su nombre y apellido junto con la cantidad de películas alquiladas.

SELECT                                     
	c.customer_id AS Número_Cliente,
    c.first_name AS Nombre, 
    c.last_name AS Apellido,
    COUNT(*) AS Número_Películas_Alquiladas
FROM customer c
LEFT JOIN  rental AS r ON c.customer_id = r.customer_id
GROUP BY c.customer_id;
-- Resultado = 599 clientes

-- 11. Encuentra la cantidad total de películas alquiladas por categoría y muestra el nombre de la categoría
-- junto con el recuento de alquileres.

SELECT 
	c.name AS Categoría,
	COUNT(r.rental_id) AS Total_Películas_Alquiladas   
FROM category c
INNER JOIN film_category fc USING(category_id)
INNER JOIN inventory i USING(film_id)
INNER JOIN rental r USING(inventory_id)
GROUP BY c.name;                                   -- Agrupo por nombre de categoría de name
-- Resultado = 16 categorías

/* El camino que se sigue es unir la tabla category con film_category uniéndose por category_id
Luego se unen film-category con inventory usando film_id
Finalmente se unen inventory con rental usando inventory_id
 */

-- 12. Encuentra el promedio de duración de las películas para cada clasificación de la tabla film y muestra la
-- clasificación junto con el promedio de duración.
SELECT 
	rating AS Clasificación,
    ROUND(AVG(length),2) AS Promedio       -- Redondeo a dos decimales
FROM
	film
GROUP BY rating
ORDER BY Promedio DESC;
-- Resultado = 5 filas con promedios por cada clasificación(rating)

-- 13. Encuentra el nombre y apellido de los actores que aparecen en la película con title "Indian Love".
SELECT
	a.first_name AS Nombre_Actor,
    a.last_name AS Apellido_Actor,
    f.title AS Título
FROM
	actor AS a
INNER JOIN film_actor fa USING(actor_id)
INNER JOIN film f USING(film_id)
WHERE title = "Indian Love"
ORDER BY Nombre_Actor;
-- Resultado = 10 actores

-- Las tablas de actor y film_actor comparten la columna actor_id
-- Las tablas de film_actor con film comparten film_id 

-- 14. Muestra el título de todas las películas que contengan la palabra "dog" o "cat" en su descripción.
SELECT 
	title AS Título,
    description AS Descripción
FROM
	film
WHERE
	description LIKE '%dog%' OR description LIKE '%cat%';
-- Resultado = 167 descripciones

-- 15. Encuentr a el título de todas las películas que fueron lanzadas entre el año 2005 y 2010.
SELECT
	title AS Título,
    release_year AS Año_de_Lanzamiento  
FROM
	film
WHERE
	release_year BETWEEN 2005 AND 2010;
-- Resultado = 1000 películas

-- 16. Encuentra el título de todas las películas que son de la misma categoría que "Family".
SELECT
	f.title AS Título,
    c.name AS Categoría
FROM
	film AS f
LEFT JOIN
	film_category AS fc ON fc.film_id = f.film_id
LEFT JOIN
	category AS c On c.category_id = fc.category_id
WHERE
	c.name = "Family";
-- Resultado = 69 películas

-- el título está en film
-- name está en category con category_id en la tabla también de film_category
-- film_id está en film_category y en film

-- 17. Encuentra el título de todas las películas que son "R" y tienen una duración mayor a 2 horas en la tabla film
SELECT
	title AS Título,
    length AS Duración,
    rating AS Clasificación
FROM
	film
WHERE
	rating = "R" AND length > 120
ORDER BY
	length;
-- Resultado = 90 películas



