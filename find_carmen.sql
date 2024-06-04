-- TEST COMMAND AND SAMPLE OUTPUT
-- Record your query (or queries, some clues require more than one) below the clue, then comment out the output below it
-- use two `-` to comment at the start of a line, or highlight the text and press `⌘/` to toggle comments
-- EXAMPLE: SELECT ALL FROM THE TABLE COUNTRY AND LIMIT IT TO ONE ENTRY

SELECT * FROM COUNTRY LIMIT 1;

--  -[ RECORD 1 ]--+--------------------------
-- code           | AFG
-- name           | Afghanistan
-- continent      | Asia
-- region         | Southern and Central Asia
-- surfacearea    | 652090
-- indepyear      | 1919
-- population     | 22720000
-- lifeexpectancy | 45.9
-- gnp            | 5976.00
-- gnpold         |
-- localname      | Afganistan/Afqanestan
-- governmentform | Islamic Emirate
-- headofstate    | Mohammad Omar
-- capital        | 1
-- code2          | AF


-- Clue #1: We recently got word that someone fitting Carmen Sandiego's description has been traveling through Southern Europe. She's most likely traveling someplace where she won't be noticed, so find the least populated country in Southern Europe, and we'll start looking for her there.

SELECT name FROM country WHERE region = 'Southern Europe' ORDER BY population ASC LIMIT 1;

-- Clue #2: Now that we're here, we have insight that Carmen was seen attending language classes in this country's officially recognized language. Check our databases and find out what language is spoken in this country, so we can call in a translator to work with you.

--finding countrycode to use for countrylanguage
SELECT code FROM country WHERE region = 'Southern Europe' ORDER BY population ASC LIMIT 1;
--finding language based on countrycode
SELECT language FROM countrylanguage WHERE countrycode = 'VAT';



-- Clue #3: We have new news on the classes Carmen attended – our gumshoes tell us she's moved on to a different country, a country where people speak only the language she was learning. Find out which nearby country speaks nothing but that language.

SELECT countrycode from countrylanguage WHERE language = 'Italian' AND percentage = 100 LIMIT 1;
SELECT name FROM country WHERE code = 'SMR';

-- Clue #4: We're booking the first flight out – maybe we've actually got a chance to catch her this time. There are only two cities she could be flying to in the country. One is named the same as the country – that would be too obvious. We're following our gut on this one; find out what other city in that country she might be flying to.

SELECT * FROM city WHERE country = 'San Marino';

-- Clue #5: Oh no, she pulled a switch – there are two cities with very similar names, but in totally different parts of the globe! She's headed to South America as we speak; go find a city whose name is like the one we were headed to, but doesn't end the same. Find out the city, and do another search for what country it's in. Hurry!

SELECT * FROM city WHERE name LIKE 'Serr%';

-- Clue #6: We're close! Our South American agent says she just got a taxi at the airport, and is headed towards the capital! Look up the country's capital, and get there pronto! Send us the name of where you're headed and we'll follow right behind you!

--Find capital in Brazil
SELECT capital FROM country WHERE name = 'Brazil';
--Finding the capital name
SELECT name FROM city WHERE id = 211;

-- Clue #7: She knows we're on to her – her taxi dropped her off at the international airport, and she beat us to the boarding gates. We have one chance to catch her, we just have to know where she's heading and beat her to the landing dock.



-- Lucky for us, she's getting cocky. She left us a note, and I'm sure she thinks she's very clever, but if we can crack it, we can finally put her where she belongs – behind bars.

-- Our playdate of late has been unusually fun –
-- As an agent, I'll say, you've been a joy to outrun.
-- And while the food here is great, and the people – so nice!
-- I need a little more sunshine with my slice of life.
-- So I'm off to add one to the population I find
-- In a city of ninety-one thousand and now, eighty five.


-- We're counting on you, gumshoe. Find out where she's headed, send us the info, and we'll be sure to meet her at the gates with bells on.

SELECT name FROM city WHERE population = 91084;

--NFL REPO:

-- 1. List the names of all NFL teams'
 
 SELECT name FROM teams;

-- 2. List the stadium name and head coach of all NFC teams
  
SELECT head_coach, stadium FROM teams WHERE conference = 'NFC',

-- 3. List the head coaches of the AFC South
  
SELECT head_coach FROM teams WHERE division = 'South' AND conference = 'AFC';

-- 4. The total number of players in the NFL

SELECT COUNT(name) FROM players;

-- 5. The team names and head coaches of the NFC North and AFC East

SELECT name, head_coach FROM teams WHERE conference = 'NFC' AND division = 'North' OR conference = 'AFC' AND division = 'East';


-- 6. The 50 players with the highest salaries
  
SELECT name FROM players ORDER BY salary DESC LIMIT 50;

-- 7. The average salary of all NFL players
 
SELECT AVG(salary) FROM players;

-- 8. The names and positions of players with a salary above 10_000_000
  
SELECT name, position FROM players WHERE salary <= 10_000_000;

-- 9. The player with the highest salary in the NFL

SELECT name FROM players ORDER BY salary DESC LIMIT 1;
 
-- 10. The name and position of the first 100 players with the lowest salaries
  
SELECT name FROM players ORDER BY salary ASC Limit 100;

-- 11. The average salary for a DE in the nfl

SELECT AVG(salary) FROM players WHERE position = 'DE';

-- 12. The names of all the players on the Buffalo Bills

SELECT id FROM teams WHERE name = 'Buffalo Bills';
SELECT name FROM players WHERE team_id = 1;

-- 13. The total salary of all players on the New York Giants
  
SELECT id FROM teams WHERE name = 'New York Giants';
SELECT SUM(salary) FROM players WHERE team_id = 18;

-- 14. The player with the lowest salary on the Green Bay Packers

SELECT id FROM teams WHERE name = 'Green Bay Packers';
SELECT name FROM players WHERE team_id = 23 ORDER BY salary ASC LIMIT 1;

 

