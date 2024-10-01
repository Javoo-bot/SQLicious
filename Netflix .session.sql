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
-- What were the average IMDB and TMDB scores for each age certification for shows and movies?
-- What were the 5 most common age certifications for movies?
-- Who were the top 20 actors that appeared the most in movies/shows? 
-- Who were the top 20 directors that directed the most movies/shows? 
-- Calculating the average runtime of movies and TV shows separately
-- Finding the titles and  directors of movies released on or after 2010
-- Which shows on Netflix have the most seasons?
-- Which genres had the most movies? 
-- Which genres had the most shows? 
-- Titles and Directors of movies with high IMDB scores (>7.5) and high TMDB popularity scores (>80)
-- What were the total number of titles for each year? 
-- Actors who have starred in the most highly rated movies or shows
-- Which actors/actresses played the same character in multiple movies or TV shows? 
-- What were the top 3 most common genres?
-- Average IMDB score for leading actors/actresses in movies or shows