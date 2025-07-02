
USE sakila;

-- 1. Selecciona todos los nombres de las películas sin que aparezcan duplicados.

SELECT  DISTINCT title AS Título
FROM film;

-- 2. Muestra los nombres de todas las películas que tengan una clasificación de "PG-13".

SELECT  DISTINCT title AS Título
FROM film
WHERE rating = "PG-13";

-- 3. Encuentra el título y la descripción de todas las películas que contengan la palabra "amazing" en su descripción.

SELECT  DISTINCT title AS Título, description AS Descripción 
FROM film
WHERE description LIKE "%amazing%";

-- 4. Encuentra el título de todas las películas que tengan una duración mayor a 120 minutos.

SELECT  DISTINCT title AS Título, length As Duración 
FROM film
WHERE length > 120
ORDER BY length;                                     -- Se ordenan los resultados de manera ascendente, por eso se usa el Order By

-- 5. Recupera los nombres de todos los actores.

SELECT first_name AS Nombre, last_name As Apellido   -- Se incluye el last_name para que la query esté más completa que sólo con el nombre
FROM actor
ORDER BY nombre;                                     -- Se ordena aunque no se pida para que el resultado quede más claro

-- 6. Encuentra el nombre y apellido de los actores que tengan "Gibson" en su apellido.

SELECT first_name AS Nombre, last_name As Apellido   
FROM actor
WHERE last_name = "Gibson";

SELECT first_name AS Nombre, last_name As Apellido   
FROM actor
WHERE last_name LIKE "%Gibson%";                           -- Como el enunciado menciona que tenga, no que sea exacto, también lo hago con el % para asegurarme de que no hay más

-- 7. Encuentra los nombres de los actores que tengan un actor_id entre 10 y 20.

SELECT first_name AS Nombre, last_name As Apellido, actor_id AS Número_de_Actor   -- No pide el actor_id pero para ver la comparativo también seleccinamos la columna actor_id
FROM actor
WHERE actor_id BETWEEN 10 AND 20;

-- 8. Encuentra el título de las películas en la tabla film que no sean ni "R" ni "PG-13" en cuanto a su clasificación.

SELECT  DISTINCT title AS Título, rating AS Clasificación
FROM film
WHERE rating NOT IN ("PG-13", "R");   

-- 9. Encuentra la cantidad total de películas en cada clasificación de la tabla film y muestra la clasificación junto con el recuento.

SELECT rating AS Clasificación, COUNT(*) AS Total_Clasificación
FROM film
GROUP BY rating
ORDER BY Total_Clasificación;                 -- Se ordena de manera ascendente por el alias de COUNT


