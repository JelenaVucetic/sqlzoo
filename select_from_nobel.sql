/* Show all details (yr, subject, winner) of the Literature prize winners for 1980 to 1989 inclusive */
SELECT *
  FROM nobel
 WHERE subject='Literature' and yr>= 1980 and yr <=1989;

/* Show all details of the presidential winners */
SELECT * FROM nobel
 WHERE winner IN ('Theodore Roosevelt',
                  'Woodrow Wilson',
                  'Jimmy Carter', 'Barack Obama')

/* Show the winners with first name John */
SELECT winner FROM nobel WHERE winner LIKE 'John%';

/* Show the year, subject, and name of Physics winners for 1980 together with the Chemistry winners for 1984 */
SELECT *
  FROM nobel
 WHERE (subject='Physics' AND yr=1980) or (subject='Chemistry' AND yr=1984);

/* Show the year, subject, and name of winners for 1980 excluding Chemistry and Medicine */
SELECT * FROM nobel WHERE yr=1980 AND subject NOT IN ('Chemistry','Medicine');

/*Show year, subject, and name of people who won a 'Medicine' prize in an early year (before 1910, not including 1910)
together with winners of a 'Literature' prize in a later year (after 2004, including 2004)  */
select *
  FROM nobel
 WHERE (subject='Medicine' and yr < 1910) or (subject='Literature' and yr >= 2004);

/* Find all details of the prize won by PETER GRÜNBERG */
SELECT *
  FROM nobel
 WHERE winner='PETER GRÜNBERG';

/* Find all details of the prize won by EUGENE O'NEILL */
SELECT *
  FROM nobel
 WHERE winner = 'EUGENE O''NEILL'

/* List the winners, year and subject where the winner starts with Sir. Show the the most recent first, then by name order. */
SELECT winner, yr, subject
FROM nobel
WHERE winner LIKE 'Sir%'
 ORDER BY yr desc, winner asc

 /* Show the 1984 winners and subject ordered by subject and winner name; but list Chemistry and Physics last */

SELECT winner, subject
  FROM nobel
 WHERE yr=1984
ORDER BY
    CASE
        WHEN subject NOT IN ('Chemistry','Physics') THEN 1
    ELSE 2
        END,
    winner