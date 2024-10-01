-- What were the top 10 movies according to IMDB score?
SELECT Title,
    imdb_score
FROM titles
WHERE imdb_score != ''
    AND type = "MOVIE" --Si es cadena vacia hay que usar este comando
ORDER BY imdb_score DESC
LIMIT 10;

-- What were the top 10 shows according to IMDB score? 
SELECT Title,
    imdb_score
FROM titles
WHERE imdb_score != ''
    AND type = "SHOW" --Si es cadena vacia hay que usar este comando
ORDER BY imdb_score DESC
LIMIT 10;

-- What were the bottom 10 movies according to IMDB score? 
SELECT title,
    imdb_score
FROM titles
WHERE imdb_score != ''
    AND type = "SHOW" --Si es cadena vacia hay que usar este comando
ORDER BY imdb_score DESC
LIMIT 10;

-- What were the bottom 10 shows according to IMDB score?
SELECT title,
    imdb_score
FROM titles
WHERE imdb_score != ''
    AND type = "SHOW"
ORDER BY imdb_score ASC
LIMIT 10;

-- What were the average IMDB and TMDB scores for shows and movies? 
SELECT type,
    imdb_score
FROM titles
WHERE imdb_score != ''
GROUP BY type
ORDER BY imdb_score DESC;

-- Count of movies and shows in each decade
SELECT DISTINCT type,
    COUNT(release_year) AS num_netflix,
    CASE
        WHEN release_year BETWEEN 1940 AND 1950 THEN 'Años 40'
        WHEN release_year BETWEEN 1950 AND 1960 THEN 'Años 50'
        WHEN release_year BETWEEN 1960 AND 1970 THEN 'Años 60'
        WHEN release_year BETWEEN 1970 AND 1980 THEN 'Años 70'
        WHEN release_year BETWEEN 1980 AND 1989 THEN 'Años 80'
        WHEN release_year BETWEEN 1990 AND 1999 THEN 'Años 90'
        WHEN release_year BETWEEN 2000 AND 2009 THEN 'Años 2000'
        WHEN release_year BETWEEN 2010 AND 2019 THEN 'Años 2010'
        ELSE 'Otros años'
    END AS decada
FROM titles
WHERE release_year != ''
GROUP BY type,
    decada --luego tengo que añadir que lo quiero por decada 
ORDER BY release_year DESC;

-- What were the average IMDB and TMDB scores for each production country?
SELECT * FROM credits;
SELECT * FROM titles;

SELECT DISTINCT production_countries, ROUND(AVG(imdb_score)) AS media, ROUND(AVG(tmdb_popularity)) AS media2
FROM titles
        WHERE production_countries IN ("['US']", "['ES']") --Hay que poner el nombre en el formato
        GROUP BY production_countries;

-- What were the average IMDB and TMDB scores for each age certification for shows and movies?
SELECT DISTINCT age_certification, count(age_certification) as edades
FROM titles
            WHERE age_certification != '' 
            GROUP BY age_certification
            ORDER BY  edades DESC;

-- What were the 5 most common age certifications for movies?
SELECT DISTINCT age_certification, count(age_certification) as edades
FROM titles
            WHERE age_certification != '' 
            GROUP BY age_certification
            ORDER BY  edades DESC
            LIMIT 5;

-- Who were the top 20 actors that appeared the most in movies/shows?
SELECT DISTINCT name, count(name) as apariciones
FROM credits
            WHERE name != '' and role = "ACTOR"
            GROUP BY name 
            ORDER BY apariciones DESC;

-- Who were the top 20 directors that directed the most movies/shows?
SELECT DISTINCT name, count(name) as apariciones
FROM credits
            WHERE name != '' and role = "DIRECTOR"
            GROUP BY name 
            ORDER BY apariciones DESC;

-- Calculating the average runtime of movies and TV shows separately
SELECT DISTINCT type, ROUND(AVG(runtime)) AS Duracion_media
FROM titles
            WHERE type !="" and runtime != 0
            GROUP BY type
            LIMIT 2 ;

-- Finding the titles and  directors of movies released on or after 2010
SELECT DISTINCT title, release_year, name
FROM titles
    JOIN credits
    WHERE titles.id = credits.id
    AND release_year > 2010
    AND role = "DIRECTOR"
    AND type = "MOVIE"
    ORDER BY release_year DESC 
    LIMIT 10 OFFSET 1 ;
    

-- Which shows on Netflix have the most seasons?
SELECT title, seasons
FROM titles
        WHERE seasons != ''
        ORDER BY seasons DESC
        LIMIT 10 OFFSET 1 
;
-- Which genres had the most movies? 
SELECT genres, count(genres) as Generos
FROM titles
        WHERE genres != ''
        AND type = "MOVIE"
        GROUP BY genres
        ORDER BY Generos DESC
        LIMIT 10;
;
-- Las comedias

-- Which genres had the most shows? 
SELECT genres, count(genres) as Generos
FROM titles
        WHERE genres != ''
        AND type = "SHOW"
        GROUP BY genres
        ORDER BY Generos DESC
        LIMIT 10
;
--Los realities
;
-- Titles and Directors of movies with high IMDB scores (>7.5) and high TMDB popularity scores (>80)
SELECT DISTINCT title, name, release_year
FROM titles
    JOIN credits
    WHERE titles.id = credits.id
    AND imdb_score > 7.5
    AND tmdb_popularity > 80
    AND role = "DIRECTOR"
    AND type = "MOVIE"
    AND title != ''
    GROUP BY title, release_year --asi evitamos los duplicados 
    ORDER BY release_year DESC 
    LIMIT 10 
;
--si hay mas de un director
;

-- What were the total number of titles for each year? 
SELECT release_year, count(release_year) as Año
FROM titles
    WHERE release_year != ''
    GROUP BY release_year
    ORDER BY release_year DESC
    LIMIT 10 OFFSET 1


-- Actors who have starred in the most highly rated movies or shows
SELECT DISTINCT name, title, round((imdb_score + tmdb_score)) AS Total
FROM credits
JOIN titles ON credits.id = titles.id
WHERE imdb_score > 8.0
    AND tmdb_score > 8.0
    AND role = 'ACTOR'
    AND title != ''
    AND (imdb_score + tmdb_popularity) > 18
GROUP BY name, title
ORDER BY Total DESC
;
--No use TMDB popularity scores porque distorsiona mucho--
;
-- Which actors/actresses played the same character in multiple movies or TV shows?
SELECT DISTINCT name, count(character) as apariciones
FROM credits
JOIN titles ON credits.id = titles.id
        WHERE name != '' and role = "ACTOR"
        GROUP BY name, character 
        ORDER BY apariciones DESC
;
--Si no incluyo el GROUP BY character entonces estoy mirando cuantas veces el actor aparece en peliclas en general
;

-- What were the top 3 most common genres?
SELECT genres, count(genres) as Generos
FROM titles
        WHERE genres != ''
        AND type = "SHOW" OR TYPE = "MOVIES"
        GROUP BY genres
        ORDER BY Generos DESC
        LIMIT 3

-- Average IMDB score for leading actors/actresses in movies or shows
SELECT name, ((imdb_score + tmdb_score)/2) AS media
FROM credits
JOIN titles on credits.id = titles.id
    WHERE name != '' 
    AND imdb_score IS NOT NULL
    GROUP BY name 
    ORDER BY media DESC
;