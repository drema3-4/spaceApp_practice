--------------------
-- task31
--------------------
SELECT class, country
FROM Classes
WHERE bore >= 16
--------------------
-- task32
--------------------
WITH right_ships AS (
    SELECT DISTINCT country, power(bore, 3) / 2 AS mw, name
    FROM Classes
    INNER JOIN Ships ON Classes.class = Ships.class
    UNION ALL
    SELECT DISTINCT country, power(bore, 3) / 2 AS mw, ship AS name
    FROM Classes
    INNER JOIN Outcomes ON Classes.class = Outcomes.ship
    WHERE ship = class AND ship NOT IN (
        SELECT name
        FROM Ships
    )
)
SELECT country, CAST(AVG(mw) AS NUMERIC(6, 2))
FROM right_ships
WHERE name IS NOT NULL
GROUP BY country
--------------------
-- task33
--------------------
SELECT DISTINCT ship
FROM Outcomes
WHERE battle = 'North Atlantic' AND result = 'sunk'
--------------------
-- task34
--------------------
SELECT DISTINCT name
FROM Classes
INNER JOIN Ships ON Classes.class = Ships.class
WHERE type = 'bb' AND displacement > 35000 AND launched IS NOT NULL AND launched >= 1922
--------------------
-- task35
--------------------
SELECT model, type
FROM Product
WHERE UPPER(model) NOT LIKE '%[^A-Z]%' OR model NOT LIKE '%[^0-9]%'