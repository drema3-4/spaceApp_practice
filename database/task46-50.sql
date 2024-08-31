--------------------
-- task46
--------------------
SELECT Outcomes.ship, displacement, numGuns
FROM (
    SELECT name AS ship, displacement, numGuns
    FROM Ships
    LEFT JOIN Classes ON Ships.class = Classes.class
    UNION
    SELECT class AS ship, displacement, numGuns
    FROM Classes
) AS temp
RIGHT JOIN Outcomes ON temp.ship = Outcomes.ship
WHERE battle = 'Guadalcanal'
--------------------
-- task47
--------------------

--------------------
-- task48
--------------------
SELECT DISTINCT class
FROM Ships
INNER JOIN Outcomes ON Ships.name = Outcomes.ship
WHERE ship = name AND result = 'sunk'
UNION
SELECT DISTINCT class
FROM Classes
INNER JOIN Outcomes ON Classes.class = Outcomes.ship
WHERE ship = class AND result = 'sunk' AND ship NOT IN (
    SELECT name
    FROM Ships
)
--------------------
-- task49
--------------------
SELECT name
FROM Classes
INNER JOIN Ships ON Classes.class = Ships.class
WHERE bore = 16
UNION
SELECT ship
FROM Classes
INNER JOIN Outcomes ON Classes.class = Outcomes.ship
WHERE ship = class AND bore = 16 AND ship NOT IN (
    SELECT name
    FROM Ships
)
--------------------
-- task50
--------------------
SELECT DISTINCT battle
FROM Ships
INNER JOIN Outcomes ON Ships.name = Outcomes.ship
WHERE class = 'Kongo'