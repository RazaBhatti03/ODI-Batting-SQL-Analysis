--  1. Create Database
DROP DATABASE IF EXISTS odi_batting;
CREATE DATABASE IF NOT EXISTS odi_batting;
USE odi_batting;

--  2. Create Table Structure 
CREATE TABLE batting_records (
    name VARCHAR(100),
    span VARCHAR(20),
    matches FLOAT,
    innings INT,
    not_outs INT,
    runs INT,
    highest_score INT,
    average FLOAT,
    balls_faced INT,
    strike_rate FLOAT,
    century INT,
    half_century INT,
    ducks INT,
    country VARCHAR(50)
);

--  Note:
-- We will manually upload the dataset using right click on table and select Table Data Import Wizard .
-- No need to include INSERT statements here.

-- ---------------------------------------------------------
--  SECTION 1: CENTURIES (Queries 1–5)
-- ---------------------------------------------------------

-- 1. Top 5 players with the most centuries
SELECT name, century FROM batting_records ORDER BY century DESC LIMIT 5;

-- 2. Total centuries scored by all players
SELECT SUM(century) AS total_centuries FROM batting_records;

-- 3. Average centuries per player
SELECT AVG(century) AS avg_centuries FROM batting_records;

-- 4. Players who scored more than 20 centuries
SELECT name, century FROM batting_records WHERE century > 20;

-- 5. Century to match ratio for top 10 players
SELECT name, (century / matches) AS century_ratio
FROM batting_records
ORDER BY century_ratio DESC LIMIT 10;

-- ---------------------------------------------------------
--  SECTION 2: STRIKE RATE (Queries 6–10)
-- ---------------------------------------------------------

-- 6. Top 5 strike rates
SELECT name, strike_rate FROM batting_records ORDER BY strike_rate DESC LIMIT 5;

-- 7. Players with strike rate between 80 and 100
SELECT name, strike_rate FROM batting_records
WHERE strike_rate BETWEEN 80 AND 100;

-- 8. Country-wise average strike rate
SELECT country, AVG(strike_rate) AS avg_strike_rate
FROM batting_records
GROUP BY country;

-- 9. Count of players with strike rate > 90
SELECT COUNT(*) FROM batting_records WHERE strike_rate > 90;

-- 10. Players with strike rate less than 70
SELECT name, strike_rate FROM batting_records WHERE strike_rate < 70;

-- ---------------------------------------------------------
--  SECTION 3: AVERAGES (Queries 11–15)
-- ---------------------------------------------------------

-- 11. Top 5 batting averages
SELECT name, average FROM batting_records ORDER BY average DESC LIMIT 5;

-- 12. Players with average above 45
SELECT name, average FROM batting_records WHERE average > 45;

-- 13. Average batting average by country
SELECT country, AVG(average) FROM batting_records GROUP BY country;

-- 14. Players with average < 30
SELECT name, average FROM batting_records WHERE average < 30;

-- 15. Compare average vs runs
SELECT name, average, runs FROM batting_records
ORDER BY average DESC LIMIT 10;

-- ---------------------------------------------------------
--  SECTION 4: MATCHES & INNINGS (Queries 16–20)
-- ---------------------------------------------------------

-- 16. Top 5 players by number of matches
SELECT name, matches FROM batting_records ORDER BY matches DESC LIMIT 5;

-- 17. Players with more innings than matches
SELECT name FROM batting_records WHERE innings > matches;

-- 18. Total matches played by each country
SELECT country, SUM(matches) FROM batting_records GROUP BY country;

-- 19. Players with more than 350 innings
SELECT name, innings FROM batting_records WHERE innings > 350;

-- 20. Players who played more than 300 matches and averaged over 40
SELECT name FROM batting_records WHERE matches > 300 AND average > 40;

-- ---------------------------------------------------------
--  SECTION 5: COUNTRY-WISE INSIGHTS (Queries 21–25)
-- ---------------------------------------------------------

-- 21. Count of players per country
SELECT country, COUNT(*) FROM batting_records GROUP BY country;

-- 22. Total runs by country
SELECT country, SUM(runs) FROM batting_records GROUP BY country;

-- 23. Country with highest total ducks
SELECT country, SUM(ducks) AS total_ducks FROM batting_records GROUP BY country ORDER BY total_ducks DESC LIMIT 1;

-- 24. Country with most centuries
SELECT country, SUM(century) AS total_centuries FROM batting_records GROUP BY country ORDER BY total_centuries DESC LIMIT 1;

-- 25. Country-wise batting average
SELECT country, AVG(average) AS avg_avg FROM batting_records GROUP BY country;

-- ---------------------------------------------------------
--  SECTION 6: MISC INSIGHTS (Queries 26–30)
-- ---------------------------------------------------------

-- 26. Players with highest score > 175 SQL/.gitkeep
SELECT name, highest_score FROM batting_records WHERE highest_score > 175;

-- 27. Players with most ducks
SELECT name, ducks FROM batting_records ORDER BY ducks DESC LIMIT 5;

-- 28. Players with 50+ half-centuries
SELECT name, half_century FROM batting_records WHERE half_century >= 50;

-- 29. Players with 0 not-outs
SELECT name FROM batting_records WHERE not_outs = 0;

-- 30. Ball faced to runs ratio (efficiency)
SELECT name, (runs / balls_faced) AS efficiency
FROM batting_records
ORDER BY efficiency DESC LIMIT 10;