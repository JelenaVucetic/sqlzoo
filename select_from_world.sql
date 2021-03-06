/* show the population of Germany */
SELECT population FROM world
  WHERE name = 'Germany';

/* Show the name and the population for 'Sweden', 'Norway' and 'Denmark' */
SELECT name, population FROM world
  WHERE name IN ('Sweden', 'Norway', 'Denmark');

/* Show the country and the area for countries with an area between 200,000 and 250,000. */
SELECT name, area FROM world
  WHERE area BETWEEN 200000 AND 250000;

/* Show the name for the countries that have a population of at least 200 million. */
SELECT name FROM world
  WHERE population >= 200000000;

/* Give the name and the per capita GDP for those countries with a population of at least 200 million. */
SELECT name, GDP/population FROM world
  WHERE population >= 200000000;

/* Show the name and population in millions for the countries of the continent 'South America'. */
SELECT name, population/1000000 FROM world
  WHERE continent='South America';

/* Show the name and population for France, Germany, Italy */
SELECT name, population FROM world
  WHERE name in ('France', 'Germany', 'Italy');

/* Show the countries which have a name that includes the word 'United' */
SELECT name FROM world
  WHERE name like '%United%';

/* Two ways to be big: A country is big if it has an area of more than 3 million sq km or it has a population of more than 250 million.
   Show the countries that are big by area or big by population. Show name, population and area. */
SELECT name, population, area FROM world
  WHERE population > 250000000 OR area > 3000000;

/* Exclusive OR (XOR). Show the countries that are big by area (more than 3 million) or big by population (more than 250 million) but not both. Show name, population and area. */
SELECT name, population, area FROM world
  WHERE (population > 250000000 and area <= 3000000)
  OR (population <= 250000000 and area > 3000000);

/* Show the name and population in millions and the GDP in billions for the countries of the continent 'South America'. Use the ROUND function to show the values to two decimal places.*/
SELECT name, ROUND(population/1000000,2) , ROUND(gdp/1000000000,2) FROM world
  WHERE continent = 'South America';

/* Show the name and per-capita GDP for those countries with a GDP of at least one trillion (1000000000000; that is 12 zeros). Round this value to the nearest 1000. */
SELECT name, round(GDP/population,-3) FROM world
  WHERE GDP >= 1000000000000;

/* Show the name and capital where the name and the capital have the same number of characters */
SELECT name, capital
FROM world
  WHERE len(name)=len(capital);

/* Show the name and the capital where the first letters of each match. Don't include countries where the name and the capital are the same word. */
SELECT name, capital
FROM world
  WHERE LEFT(name,1)=LEFT(capital,1)
  AND name<>capital;

/* Find the country that has all the vowels and no spaces in its name. */
SELECT name
FROM world
    WHERE name LIKE '%a%'
    AND name LIKE '%e%'
    AND name LIKE '%i%'
    AND name LIKE '%o%'
    AND name LIKE '%u%'
    AND name NOT LIKE '% %';

/* displays Nobel prizes for 1950 */
SELECT yr, subject, winner
  FROM nobel
 WHERE yr = 1950

/*Show who won the 1962 prize for Literature.  */
SELECT winner
  FROM nobel
 WHERE yr = 1962
  AND subject = 'Literature';

/* Show the year and subject that won 'Albert Einstein' his prize. */
SELECT yr, subject
  FROM nobel
 WHERE winner='Albert Einstein';

/* Give the name of the 'Peace' winners since the year 2000, including 2000 */
SELECT winner
  FROM nobel
 WHERE yr >= 2000 AND subject='Peace';
