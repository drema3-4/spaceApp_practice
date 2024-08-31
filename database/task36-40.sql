--------------------
-- task36
--------------------
SELECT name
FROM Ships
WHERE class = name
UNION
SELECT ship AS name
FROM Classes, Outcomes
WHERE Classes.class = Outcomes.ship
--------------------
-- task37
--------------------

--------------------
-- task38
--------------------
SELECT DISTINCT country
FROM Classes
WHERE type = 'bb'
INTERSECT
SELECT DISTINCT country
FROM Classes
WHERE type = 'bc'
--------------------
-- task39
--------------------
SELECT DISTINCT t1.ship
FROM Outcomes t1, Battles t2, Outcomes o1, Battles o2
WHERE t1.ship = o1.ship AND t1.result = 'damaged' AND t1.battle = t2.name
AND o1.battle = o2.name AND t2.date < o2.date
--------------------
-- task40
--------------------
SELECT DISTINCT maker, type
FROM Product
WHERE maker IN (
    SELECT maker
    FROM Product
    GROUP BY maker
    HAVING COUNT(model) > 1
    INTERSECT
    SELECT maker
    FROM Product
    GROUP BY maker
    HAVING COUNT(DISTINCT type) = 1
)