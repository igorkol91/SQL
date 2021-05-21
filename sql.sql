###############SELECT FROM BASICS

1. INtroducINg the world table of countries
SELECT populatiON FROM world
  WHERE name = 'Germany'

2. ScandINavia
SELECT name, populatiON FROM world
  WHERE name IN ('Sweden', 'Norway', 'Denmark');

3. Just the right size
SELECT name, area FROM world
  WHERE area BETWEEN 200000 AND 250000

4. SELECT the code which produces this table
name	    populatiON
BahraIN	    1234571
Swaziland	1220000
Timor-Leste	1066409

SELECT name, populatiON
  FROM world
 WHERE populatiON BETWEEN 1000000 AND 1250000
 
###############SELECT FROM WORLD

1. Read the notes about this table. Observe the result of runnINg this SQL command to show the name, cONtINent and populatiON of all countries. 

SELECT name, cONtINent, populatiON FROM world

2. How to use WHERE to filter records. Show the name for the countries that have a populatiON of at least 200 milliON. 200 milliON is 200000000, there are eight zeros. 

SELECT name
  FROM world
 WHERE populatiON > 200000000

3. Give the name and the per capita GDP for those countries with a populatiON of at least 200 milliON.

SELECT name, gdp/populatiON
FROM world
WHERE populatiON > 200000000

4. Show the name and populatiON IN milliONs for the countries of the cONtINent 'South America'. Divide the populatiON by 1000000 to get populatiON IN milliONs. 

SELECT name, populatiON/1000000
FROM world
WHERE cONtINent IC ('South America')

5. Show the name and populatiON for France, Germany, Italy 

SELECT name, populatiON
FROM world
WHERE name IN ('France', 'Germany', 'Italy')

6. Show the countries which have a name that INcludes the word 'United' 

SELECT name
FROM world
WHERE name like('%United%')

7. Two ways to be big: A country is big if it has an area of more than 3 milliON sq km or it has a populatiON of more than 250 milliON.
Show the countries that are big by area or big by populatiON. Show name, populatiON and area.

SELECT name,populatiON,area
FROM world
WHERE populatiON > 250000000 or area > 3000000

8. Exclusive OR (XOR). Show the countries that are big by area (more than 3 milliON) or big by populatiON (more than 250 milliON) but not both. Show name, populatiON and area.

SELECT name,
       populatiON,
       area
FROM world
WHERE (area > 3000000 AND populatiON < 250000000) OR 
      (area < 3000000 AND populatiON > 250000000)

9. Show the name and populatiON IN milliONs and the GDP IN billiONs for the countries of the cONtINent 'South America'. Use the ROUND functiON to show the values to two decimal places.
For South America show populatiON IN milliONs and GDP IN billiONs both to 2 decimal places.

SELECT name, round(populatiON/1000000,2), round(gdp/1000000000,2)
FROM world
WHERE cONtINent IN ('South America')


10. Show the name and per-capita GDP for those countries with a GDP of at least ONe trilliON (1000000000000; that is 12 zeros). Round this value to the nearest 1000.
Show per-capita GDP for the trilliON dollar countries to the nearest $1000.

SELECT name , round((gdp/populatiON)/1000,0)*1000 as ceilINg
FROM world
WHERE gdp > 1000000000000

11. Greece has capital Athens.
Each of the strINgs 'Greece', and 'Athens' has 6 characters.
Show the name and capital WHERE the name and the capital have the same number of characters.
You can use the LENGTH functiON to fINd the number of characters IN a strINg

SELECT name,
       capital
  FROM world
 WHERE len(name) = LEN(capital)

12. The capital of Sweden is Stockholm. Both words start with the letter 'S'.
Show the name and the capital WHERE the first letters of each match. DONt INclude countries WHERE the name and the capital are the same word.

SELECT name, capital
FROM world
WHERE left(name,1) = left(capital,1) and name <> capital

13. Equatorial GuINea and DomINican Republic have all of the vowels (a e i o u) IN the name. They dONt count because they have more than ONe word IN the name.
FINd the country that has all the vowels and no spaces IN its name.
    You can use the phrase name NOT LIKE '%a%' to exclude characters FROM your results.
    The query shown misses countries like Bahamas and Belarus because they cONtaIN at least ONe 'a'

SELECT name
FROM world
WHERE name LIKE '%u%' 
      and name LIKE '%a%' 
      and name LIKE '%o%' 
      and name LIKE '%i%'
      and name LIKE '%e%'
      and name NOT LIKE '% %'

################SELECT FROM Nobel Tutorial

1. Change the query shown so that it displays Nobel prizes for 1950. 

SELECT yr, subject, wINner
  FROM nobel
 WHERE yr = 1950

2. Show who wON the 1962 prize for Literature. 

SELECT wINner
  FROM nobel
 WHERE yr = 1962
   AND subject = 'Literature'

3. Show the year and subject that wON 'Albert EINsteIN' his prize. 

SELECT yr, subject
FROM nobel
WHERE wINner = 'Albert EINsteIN'

4. Give the name of the 'Peace' wINners sINce the year 2000, INcludINg 2000. 

SELECT wINner
FROM nobel
WHERE subject = 'Peace' and yr >= 2000

5. Show all details (yr, subject, wINner) of the Literature prize wINners for 1980 to 1989 INclusive. 

SELECT yr, subject, wINner
FROM nobel
WHERE subject = 'Literature' and yr>=1980 and yr<=1989

6. Show all details of the presidential wINners:

    Theodore Roosevelt
    Woodrow WilsON
    Jimmy Carter
    Barack Obama

SELECT * FROM nobel
 WHERE wINner = 'Theodore Roosevelt'
or wINner = 'Woodrow WilsON'
or wINner = 'Jimmy Carter'
or wINner = 'Barack Obama'

7. Show the wINners with first name John 

SELECT wINner
FROM nobel
WHERE wINner like('John%')

8. Show the year, subject, and name of Physics wINners for 1980 together with the Chemistry wINners for 1984.

SELECT yr, subject, wINner
FROM nobel 
WHERE (subject = 'Physics' and yr = 1980) or (subject = 'Chemistry' and yr = 1984)

9. Show the year, subject, and name of wINners for 1980 excludINg Chemistry and MedicINe

SELECT yr, subject, wINner
FROM nobel
WHERE yr = 1980 and subject <> 'Chemistry' and subject <> 'MedicINe'

10. Show year, subject, and name of people who wON a 'MedicINe' prize IN an early year (before 1910, not INcludINg 1910) 
together with wINners of a 'Literature' prize IN a later year (after 2004, INcludINg 2004) 

SELECT yr, subject, wINner
FROM nobel 
WHERE (subject = 'MedicINe' and yr < 1910) or (subject = 'Literature' and yr >= 2004)

11. FINd all details of the prize wON by PETER GRÜNBERG 

SELECT *
FROM nobel
WHERE wINner = 'PETER GRÜNBERG'

12. FINd all details of the prize wON by EUGENE O'NEILL 

SELECT *
FROM nobel
WHERE wINner = 'EUGENE O''NEILL'  #'

13. List the wINners, year and subject WHERE the wINner starts with Sir. Show the the most recent first, then by name ORDER.

SELECT wINner, yr, subject
FROM nobel 
WHERE wINner like('Sir%') 
ORDER by yr desc,
wINner

14. The expressiON subject IN ('Chemistry','Physics') can be used as a value - it will be 0 or 1.
Show the 1984 wINners and subject ORDERed by subject and wINner name; but list Chemistry and Physics last.

SELECT wINner, subject
  FROM nobel
 WHERE yr=1984
 ORDER BY subject IN ('Chemistry', 'Physics'), subject, wINner

#########################################SELECT withIN SELECT Tutorial

1. List each country name WHERE the populatiON is larger than that of 'Russia'.
world(name, cONtINent, area, populatiON, gdp)

SELECT name FROM world
  WHERE populatiON >
     (SELECT populatiON FROM world
      WHERE name='Russia')

2. Show the countries IN Europe with a per capita GDP greater than 'United KINgdom'.

SELECT name 
FROM world 
WHERE cONtINent = 'Europe' and gdp/populatiON > (SELECT gdp/populatiON 
FROM world 
WHERE name = 'United KINgdom')

3. List the name and cONtINent of countries IN the cONtINents cONtaININg either ArgentINa or Australia. ORDER by name of the country

SELECT name, cONtINent 
FROM world
WHERE cONtINent IN (SELECT cONtINent FROM world WHERE name like 'ArgentINa' or name like 'Australia') ORDER by name

4. Which country has a populatiON that is more than Canada but less than Poland? Show the name and the populatiON

SELECT name, populatiON
FROM world
WHERE populatiON > (SELECT populatiON
FROM world
WHERE name = 'Canada') and
populatiON < (SELECT populatiON
FROM world
WHERE name = 'Poland')

5. Germany (populatiON 80 milliON) has the largest populatiON of the countries IN Europe. Austria (populatiON 8.5 milliON)
has 11% of the populatiON of Germany.
Show the name and the populatiON of each country IN Europe. Show the populatiON as a percentage of the populatiON of Germany.

SELECT name, CONCAT(Round(populatiON/(SELECT populatiON
FROM world
WHERE name = 'Germany')* 100, 0),'%')
FROM world
WHERE cONtINent = 'Europe'

6. Which countries have a GDP greater than every country IN Europe? [Give the name ONly.] (Some countries may have NULL gdp values) 

SELECT name 
FROM world 
WHERE cONtINent <> 'Europe' and gdp > (SELECT max(gdp) 
FROM world
WHERE cONtINent = 'Europe' and gdp>0)

7. FINd the largest country (by area) IN each cONtINent, show the cONtINent, the name and the area: 

SELECT cONtINent, name, area 
  FROM world
 WHERE area IN (SELECT MAX(area) 
                  FROM world 
                 GROUPBY cONtINent);

8. List each cONtINent and the name of the country that comes first alphabetically.

SELECT cONtINent, MIN(name)
FROM world 
GROUPBY cONtINent

9. FINd the cONtINents WHERE all countries have a populatiON <= 25000000.
Then fINd the names of the countries associated with these cONtINents. Show name, cONtINent and populatiON. 

SELECT name, cONtINent, populatiON 
FROM world w
WHERE NOT EXISTS (                 
   SELECT *
   FROM world nx
   WHERE nx.cONtINent = w.cONtINent
   AND nx.populatiON > 25000000     
   );

10. Some countries have populatiONs more than three times that of any of their neighbours 
(IN the same cONtINent). Give the countries and cONtINents.

SELECT name, cONtINent
FROM world x 
WHERE populatiON/3 >= ALL
    (SELECT populatiON
     FROM world y
     WHERE y.cONtINent=x.cONtINent
     AND x.name != y.name)

###########################SUM and COUNT

1. Show the total populatiON of the world.
world(name, cONtINent, area, populatiON, gdp)

SELECT SUM(populatiON)
FROM world

2. List all the cONtINents - just ONce each. 

SELECT cONtINent
FROM world
GROUPby cONtINent

3. Give the total GDP of Africa 

SELECT sum(gdp)
FROM world
WHERE cONtINent = 'Africa'

4. How many countries have an area of at least 1000000 

SELECT count(name)
FROM world
WHERE area > 1000000 

5. What is the total populatiON of ('EstONia', 'Latvia', 'Lithuania') 

SELECT sum(populatiON)
FROM world 
WHERE name = 'EstONia' or
name= 'Latvia' or
name = 'Lithuania'

6. For each cONtINent show the cONtINent and number of countries. 

SELECT cONtINent, count(name)
FROM world x
GROUPby cONtINent

7. For each cONtINent show the cONtINent and number of countries with populatiONs of at least 10 milliON. 

SELECT cONtINent, count(name)
FROM world x
WHERE populatiON > 10000000
GROUPby cONtINent

8. List the cONtINents that have a total populatiON of at least 100 milliON. 

SELECT cONtINent
FROM world
GROUPBY cONtINent
HAVING SUM(populatiON) >= 100000000;

#######################The JOIN operatiON

1. The first example shows the goal scored by a player with the last name 'Bender'. The * says to list all the columns IN the table - a 
shorter way of sayINg matchid, teamid, player, gtime
Modify it to show the matchid and player name for all goals scored by Germany. To identify German players, check for: teamid = 'GER'

SELECT matchid, player FROM goal 
  WHERE teamid = 'GER'

2. FROM the previous query you can see that Lars Benders scored a goal IN game 1012. Now we want to know what teams were playINg IN that match.
Notice IN the that the column matchid IN the goal table correspONds to the id column IN the game table. 
We can look up INformatiON about game 1012 by fINdINg that row IN the game table.
Show id, stadium, team1, team2 for just game 1012

SELECT id,stadium,team1,team2
  FROM game
WHERE id = '1012'

3. You can combINe the two steps INto a sINgle query with a JOIN.
SELECT *
  FROM game JOIN goal ON (id=matchid)
The FROM clause says to merge data FROM the goal table with that FROM the game table. The ON says how to figure out which 
rows IN game go with which rows IN goal - the matchid FROM goal must match id FROM game. (If we wanted to be more clear/specific we could say
ON (game.id=goal.matchid)
The code below shows the player (FROM the goal) and stadium name (FROM the game table) for every goal scored.
Modify it to show the player, teamid, stadium and mdate for every German goal.

SELECT player, teamid, stadium, mdate
  FROM game JOIN goal ON (teamid = 'GER' and matchid = id)

4. Use the same JOIN as IN the previous questiON.
Show the team1, team2 and player for every goal scored by a player called Mario player LIKE 'Mario%'

SELECT team1, team2, player
FROM goal
JOIN game ON (game.id = goal.matchid)
WHERE player LIKE 'Mario%'

5. The table eteam gives details of every natiONal team INcludINg the coach. You can JOIN 
goal to eteam usINg the phrase goal JOIN eteam ON teamid=id
Show player, teamid, coach, gtime for all goals scored IN the first 10 mINutes gtime<=10

SELECT player, teamid, coach, gtime
  FROM goal 
joIN eteam ON(teamid=id)
 WHERE gtime<=10

6. To JOIN game with eteam you could use either
game JOIN eteam ON (team1=eteam.id) or game JOIN eteam ON (team2=eteam.id)
Notice that because id is a column name IN both game and eteam you must specify eteam.id INstead of just id
List the dates of the matches and the name of the team IN which 'Fernando Santos' was the team1 coach.

SELECT mdate, teamname
FROM game
JOIN eteam ON (game.team1 = eteam.id)
WHERE coach = 'Fernando Santos'

7. List the player for every goal scored IN a game WHERE the stadium was 'NatiONal Stadium, Warsaw'

SELECT player
FROM game 
joIN goal ON (goal.matchid = game.id)
WHERE stadium = 'NatiONal Stadium, Warsaw'

8. The example query shows all goals scored IN the Germany-Greece quarterfINal.
INstead show the name of all players who scored a goal agaINst Germany.

SELECT DISTINCT player
FROM game
JOIN goal ON goal.matchid = game.id
WHERE (team1 = 'GER' OR team2 = 'GER')
AND teamid <> 'GER'

9. Show teamname and the total number of goals scored.

SELECT teamname, count(player)
  FROM eteam JOIN goal ON id=teamid
 GROUPBY teamname

10. Show the stadium and the number of goals scored IN each stadium.

 SELECT stadium, count(player)
FROM game 
joIN goal ON (game.id = goal.matchid)
GROUPby stadium

11. For every match INvolvINg 'POL', show the matchid, date and the number of goals scored.

SELECT matchid,mdate, COUNT(player)
FROM game
JOIN goal ON goal.matchid = game.id
WHERE (team1 = 'POL' OR team2 = 'POL')
GROUPBY goal.matchid, game.mdate

12. For every match WHERE 'GER' scored, show matchid, match date and the number of goals scored by 'GER'

SELECT matchid, mdate, count(player)
FROM game
JOIN goal ON goal.matchid = game.id
WHERE (team1 = 'GER' OR team2 = 'GER')
and TEAMID = 'GER'
GROUPBY goal.matchid, game.mdate

13. List every match with the goals scored by each team as shown. This will use "CASE WHEN" which has not been explaINed IN any previous exercises.

SELECT mdate,
  team1,
  SUM(CASE WHEN teamid=team1 THEN 1 ELSE 0 END) score1,
  team2,
  SUM(CASE WHEN teamid=team2 THEN 1 ELSE 0 END) score2
FROM game JOIN goal ON goal.matchid = game.id
GROUPBY game.id, mdate, matchid, team1, team2
ORDER BY mdate, matchid, team1, team2

######################More JOIN operatiONs

1. List the films WHERE the yr is 1962 [Show id, title] 

SELECT id, title
 FROM movie
 WHERE yr=1962

2. Give year of 'Citizen Kane'. 

SELECT yr
FROM movie WHERE title = 'Citizen Kane'

3. List all of the Star Trek movies, INclude the id, title and yr 
(all of these movies INclude the words Star Trek IN the title). ORDER results by year. 

SELECT id, title, yr
FROM movie
WHERE title like '%Star Trek%'
ORDER by yr

4. What id number does the actor 'Glenn Close' have? 

SELECT id FROM actor WHERE name =  'Glenn Close'

5. What is the id of the film 'Casablanca' 

SELECT id FROM movie WHERE title = 'Casablanca' 

6. ObtaIN the cast list for 'Casablanca'.
what is a cast list? The cast list is the names of the actors who were IN the movie.

SELECT name
FROM actor
JOIN castINg ON actor.id = castINg.actorid
WHERE castINg.movieid = 27

7. ObtaIN the cast list for the film 'Alien' 

SELECT actor.name
FROM actor
JOIN castINg ON actor.id = castINg.actorid
JOIN movie ON movie.id = castINg.movieid
WHERE title = 'Alien'

8. List the films IN which 'HarrisON Ford' has appeared 

SELECT movie.title
FROM movie
JOIN castINg ON movie.id = castINg.movieid
JOIN actor ON actor.id = castINg.actorid
WHERE name = 'HarrisON Ford'

9. List the films WHERE 'HarrisON Ford' has appeared - but not IN the starrINg role.  

SELECT movie.title
FROM movie
JOIN castINg ON movie.id = castINg.movieid
JOIN actor ON actor.id = castINg.actorid
WHERE name = 'HarrisON Ford'
AND castINg.ord <> 1

10. List the films together with the leadINg star for all 1962 films. 

SELECT title, name leadINg_star
FROM movie
JOIN castINg ON movie.id = castINg.movieid
JOIN actor ON actor.id = castINg.actorid
WHERE movie.yr = 1962
AND castINg.ord = 1

11. Which were the busiest years for 'Rock HudsON', show the year and the number of movies he made each year 
for any year IN which he made more than 2 movies. 

SELECT yr
FROM movie
JOIN castINg ON movie.id = castINg.movieid
JOIN actor ON castINg.actorid = actor.id
WHERE name = 'Rock HudsONs'
GROUPBY yr

12. List the film title and the leadINg actor for all of the films 'Julie Andrews' played IN.

SELECT title, name
  FROM movie, castINg, actor
  WHERE movieid=movie.id
    AND actorid=actor.id
    AND ord=1
    AND movieid IN
    (SELECT movieid FROM castINg, actor
     WHERE actorid=actor.id
     AND name='Julie Andrews')

13. ObtaIN a list, IN alphabetical ORDER, of actors whove had at least 15 starrINg roles. 

SELECT name
    FROM castINg JOIN actor
      ON  actorid = actor.id
    WHERE ord=1
    GROUPBY name
    HAVING COUNT(movieid)>=15

14. List the films released IN the year 1978 ORDERed by the number of actors IN the cast, then by title. 

SELECT title, COUNT(actorid)
  FROM castINg,movie                
  WHERE yr=1978
  AND movieid=movie.id
  GROUPBY title
  ORDER BY COUNT(actorid) DESC, title

########################UsINg Null

1. List the teachers who have NULL for their department. 

SELECT name 
FROM teacher 
WHERE dept IS NULL

2. Note the INNER JOIN misses the teachers with no department and the departments with no teacher. 

SELECT teacher.name, dept.name
 FROM teacher INNER JOIN dept
           ON (teacher.dept=dept.id)

3. Use a different JOIN so that all teachers are listed. 

SELECT teacher.name, dept.name
FROM teacher
LEFT JOIN dept
ON (teacher.dept = dept.id)

4. Use a different JOIN so that all departments are listed.

SELECT teacher.name, dept.name
FROM teacher
right JOIN dept
ON (teacher.dept = dept.id)

5. Use COALESCE to prINt the mobile number. Use the number '07986 444 2266' 
if there is no number given. Show teacher name and mobile number or '07986 444 2266'

SELECT name, COALESCE(mobile,'07986 444 2266')
FROM teacher

6. Use the COALESCE functiON and a LEFT JOIN to prINt the teacher name and department name. Use the strINg 'NONe' WHERE there is no department. 

SELECT teacher.name, COALESCE(dept.name, 'NONe')
FROM teacher
LEFT JOIN dept
ON teacher.dept = dept.id

7. Use COUNT to show the number of teachers and the number of mobile phONes. 

SELECT COUNT(teacher.id) num_teachers,
  COUNT(mobile) num_mobiles
FROM teacher

8. Use COUNT and GROUPBY dept.name to show each department and the number of staff. 
Use a RIGHT JOIN to ensure that the EngINeerINg department is listed. 

SELECT dept.name, COUNT(teacher.name)
FROM teacher RIGHT JOIN dept
ON teacher.dept=dept.id
GROUPBY dept.name

9. Use CASE to show the name of each teacher followed by 'Sci' if the teacher is IN dept 1 or 2 and 'Art' otherwise. 

SELECT teacher.name,
  CASE WHEN dept IS NULL THEN 'Art' ELSE 'Sci' END AS dept_type
FROM teacher

10. Use CASE to show the name of each teacher followed by 'Sci' if the teacher is IN dept 1 or 2, 
show 'Art' if the teachers dept is 3 and 'NONe' otherwise. 

SELECT name, CASE WHEN dept IN (1,2) 
  THEN 'Sci'
  WHEN dept = 3 
  THEN 'Art'
  ELSE 'NONe' END
  FROM teacher

#################### Self join

1. How many stops are in the database. 

SELECT COUNT(id)
from stops

2. Find the id value for the stop 'Craiglockhart' 

SELECT id 
FROM stops 
WHERE name='Craiglockhart'


3. Give the id and the name for the stops on the '4' 'LRT' service. 

SELECT id, name FROM stops, route
  WHERE id=stop
    AND company='LRT'
    AND num='4'

4. The query shown gives the number of routes that visit either London Road (149) or Craiglockhart (53). Run the query 
and notice the two services that link these stops have a count of 2. Add a HAVING clause to restrict the output to these two routes.  

SELECT company, num, COUNT(*)
FROM route WHERE stop=149 OR stop=53
GROUP BY company, num
HAVING COUNT(*)=2

5. Execute the self join shown and observe that b.stop gives all the 
places you can get to from Craiglockhart, without changing routes. Change the query so that it shows the services from Craiglockhart to London Road. 

SELECT a.company, a.num, a.stop, b.stop
FROM route a
JOIN route b ON (a.num = b.num)
WHERE a.stop = 53
AND b.stop = 149

6. The query shown is similar to the previous one, however by joining two copies 
of the stops table we can refer to stops by name rather than by number. Change the query so that the services 
between 'Craiglockhart' and 'London Road' are shown. If you are tired of these places try 'Fairmilehead' against 'Tollcross' 

SELECT a.company, a.num, stopa.name, stopb.name
FROM route a JOIN route b ON
  (a.company=b.company AND a.num=b.num)
  JOIN stops stopa ON (a.stop=stopa.id)
  JOIN stops stopb ON (b.stop=stopb.id)
WHERE stopa.name='Craiglockhart'
  AND stopb.name='London Road'

7. Give a list of all the services which connect stops 115 and 137 ('Haymarket' and 'Leith') 

SELECT DISTINCT a.company, a.num
FROM route a
JOIN route b ON a.num = b.num
WHERE a.stop = 115
AND b.stop = 137

8. Give a list of the services which connect the stops 'Craiglockhart' and 'Tollcross' 

SELECT a.company, a.num
FROM route a
JOIN route b ON (a.num = b.num)
JOIN stops stopa ON (a.stop = stopa.id)
JOIN stops stopb ON (b.stop = stopb.id)
WHERE stopa.name = 'Craiglockhart'
AND stopb.name = 'Tollcross'

9. Give a distinct list of the stops which may be reached from 'Craiglockhart' by taking one bus, 
including 'Craiglockhart' itself, offered by the LRT company. Include the company and bus no. of the relevant services. 

SELECT DISTINCT stopb.name, b.company, b.num
FROM route a
JOIN route b ON (a.num = b.num AND a.company = b.company)
JOIN stops stopa ON (a.stop = stopa.id)
JOIN stops stopb ON (b.stop = stopb.id)
WHERE stopa.name = 'Craiglockhart'

10. Find the routes involving two buses that can go from Craiglockhart to Lochend.
Show the bus no. and company for the first bus, the name of the stop for the transfer,
and the bus no. and company for the second bus.

SET SQL_BIG_SELECTS=1;
SELECT DISTINCT stopa.name, stopd.name
FROM stops stopa
JOIN route a ON (stopa.id = a.stop)
JOIN route b ON (a.num = b.num AND a.company = b.company)
JOIN route c ON (b.stop = c.stop AND b.company = c.company)
JOIN route d ON (c.num = d.num AND c.company = d.company)
JOIN stops stopd ON (stopd.id = d.stop)
WHERE stopa.name = 'Craiglockhart'
AND stopd.name = 'Sighthill'
