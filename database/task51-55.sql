--------------------
-- task51
--------------------
SELECT DISTINCT name
FROM (
    SELECT name, displacement, numGuns
    FROM Classes
    INNER JOIN Ships ON Classes.class = Ships.class
    UNION
    SELECT ship AS name, displacement, numGuns
    FROM Classes
    INNER JOIN Outcomes ON Classes.class = Outcomes.ship
    WHERE ship = class AND ship NOT IN (
        SELECT name
        FROM Ships
    )
) AS t1
INNER JOIN (
    SELECT displacement, MAX(numGuns) AS numGuns
    FROM Classes
    INNER JOIN Ships ON Classes.class = Ships.class
    GROUP BY displacement
    UNION
    SELECT displacement, MAX(numGuns) AS numGuns
    FROM Classes
    INNER JOIN Outcomes ON Classes.class = Outcomes.ship
    WHERE ship NOT IN (
        SELECT name
        FROM Ships
    )
    GROUP BY displacement
) AS t2
ON t1.displacement = t2.displacement AND t1.numGuns = t2.numGuns
--------------------
-- task52
--------------------
SELECT name
FROM Ships
WHERE type = 'bb'
AND UPPER(country = 'JAPAN')
AND (numGuns >= 9 OR numGuns IS NULL)
AND (bore < 19 OR bore IS NULL)
AND (displacement <= 65000 OR displacement IS NULL)
--------------------
-- task53
--------------------
SELECT ROUND(AVG(numGuns),2)
FROM Classes
WHERE type = 'bb'
--------------------
-- task54
--------------------
SELECT CAST(AVG(numGuns) AS NUMERIC(6,2))
FROM (
    SELECT numGuns
    FROM Classes
    INNER JOIN Ships ON Classes.class = Ships.class
    WHERE type = 'bb'
    UNION
    SELECT numGuns
    FROM Classes.class
    INNER JOIN Outcomes ON Classes.class = Outcomes.ship
    WHERE ship = class AND type = 'bb' AND ship NOT IN (
        SELECT name
        FROM Ships
    )
) AS all_numGuns
--------------------
-- task55
--------------------
SELECT Classes.class, launched
FROM Classes
LEFT JOIN Ships ON Classes.class = Ships.class
GROUP BY Classes.class