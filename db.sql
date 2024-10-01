-- Get the first 10 movies from the Movies table
SELECT * FROM Movies LIMIT 10;
SELECT * FROM BoxOffice LIMIT 10;
SELECT * FROM Employees LIMIT 10;

-- List all movies and their combined sales in millions of dollars 
SELECT title, (domestic_sales + international_sales)/1000000 AS total_sales
FROM BoxOffice
INNER JOIN Movies
ON Movies.id = BoxOffice.movie_id;

--List all movies and their ratings in percent
SELECT Title, Rating*10 AS percentage
FROM BoxOffice
INNER JOIN Movies
ON boxoffice.Movie_id = movies.Id;

--List all movies that were released on even number years
SELECT Title, (Year% 2.0) = 0 AS Años_pares  --El 1 son los años que cumplen la condicion
FROM Movies
where Años_pares = 1 ; --Puedo poner una condicion dentro del resultado 

-- Find the longest time that an employee has been at the studio
SELECT Name, max(Years_employed) AS Max_year
FROM Employees;

-- For each role, find the average number of years employed by employees in that role
-- Hay que usar el GROUP BY que sirve para hacer subconjuntos 
SELECT Role, AVG(Years_employed) as mean_year
FROM Employees 
GROUP BY Role;

--Find the total number of employee years worked in each building
SELECT Building, COUNT(Building) as num_personas , SUM(Years_employed) as num_años
FROM Employees 
GROUP BY Building;

--Find the number of Artists in the studio (without a HAVING clause)
SELECT Role, COUNT(Role) AS num_artistas
FROM Employees
WHERE Role = "Artist";


--Find the number of Employees of each role in the studio
SELECT Role, COUNT(Role) AS num_artistas
FROM Employees
GROUP BY Role;

--Find the total number of years employed by all Engineers
SELECT Role, SUM(Years_employed) AS num_años
FROM Employees
WHERE Role = "Engineer";

-- Find the number of movies each director has directed
SELECT DISTINCT director, count(director) as num_movies
FROM Movies
    GROUP BY Director;

--Find the total domestic and international sales that can be attributed to each director
SELECT DISTINCT director, sum(domestic_sales + international_sales) as total_sales
FROM Movies
    JOIN boxoffice
    ON Movies.id = boxoffice.movie_id
    GROUP BY Director;

--Add the studio's new production, Toy Story 4 to the list of movies (you can use any director)
INSERT INTO movies ('Id','Title','Director','Year','Length_minutes')
VALUES ('16','Toy Story 4','John Lasseter','2025','150');
SELECT * FROM Movies LIMIT 20;


--Toy Story 4 has been released to critical acclaim! It had a rating of 8.7, and made 340 million 
-- domestically and 270 million internationally. Add the record to the BoxOffice table.
INSERT INTO BoxOffice (Movie_id, Rating, Domestic_sales, International_sales) 
VALUES (16, 8.7, 340000000, 270000000);
SELECT * FROM BoxOffice LIMIT 20;

--The director for A Bug's Life is incorrect, it was actually directed by John Lasseter
UPDATE Movies
SET Director = "El Directore"
WHERE Title = "A Bug's Life";

SELECT *  FROM Movies;

UPDATE Movies
SET Director = "John Lasseter"
WHERE Director = "El Directore"; 

--The year that Toy Story 2 was released is incorrect, it was actually released in 1999
UPDATE Movies
SET Year = "1998"
WHERE Title = "Toy Story 2"; 

--Both the title and director for Toy Story 8 is incorrect! The title should be 
--"Toy Story 3" and it was directed by Lee Unkrich
UPDATE Movies
SET Director = "Lee Unkrich"
WHERE Title = "Toy Story 4"; 

--This database is getting too big, lets remove all movies that were released after 2025.
DELETE FROM Movies
WHERE Year > 2025;

--Andrew Stanton has also left the studio, so please remove all movies directed by him.
DELETE FROM movies
WHERE Director = "Andrew Stanton";


--Create a new table named Database with the following columns:
--Name A string (text) describing the name of the database
--Version A number (floating point) of the latest version of this database
--Download_count An integer count of the number of times this database was downloaded
--This table has no constraints.

CREATE TABLE Database (
    Id INTEGER PRIMARY KEY,
    Name TEXT,
    Version FLOAT,
    Download_count INTEGER
    );

--Add a column named Aspect_ratio with a FLOAT data type to store the aspect-ratio each 
--movie was released in.
ALTER TABLE movies
ADD aspect_ratio FLOAT

--Add another column named Language with a TEXT data type to store the language 
--that the movie was released in. Ensure that the default for this language is English.
ALTER TABLE movies
ADD language TEXT
    DEFAULT English

