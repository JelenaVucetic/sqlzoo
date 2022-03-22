/* List each country name where the population is larger than that of 'Russia'. */

SELECT name FROM world
  WHERE population >
     (SELECT population FROM world
      WHERE name='Russia')

/* Show the countries in Europe with a per capita GDP greater than 'United Kingdom'  */
SELECT name FROM world
WHERE continent='Europe' AND  GDP/population >
   (SELECT  GDP/population FROM world where name='United Kingdom');


SELECT t1.name FROM world t1
   WHERE continent='Europe'
   AND EXISTS
   (SELECT * FROM world t2 WHERE name='United Kingdom'  AND t2.gdp/t2.population < t1.gdp/t1.population);

/* List the name and continent of countries in the continents containing either Argentina or Australia. Order by name of the country. */
SELECT name, continent FROM world
WHERE continent IN (
     SELECT continent FROM world WHERE name='Argentina ' or name='Australia'
    )
ORDER BY name

/*Which country has a population that is more than Canada but less than Poland? Show the name and the population  */
SELECT name, population FROM world
WHERE population > (SELECT population FROM world WHERE name='Canada')
AND population < (SELECT population FROM world WHERE name='Poland');