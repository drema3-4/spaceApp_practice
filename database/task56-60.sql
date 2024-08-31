--------------------
-- task56
--------------------
SELECT Classes.class, COUNT(ship)
FROM Classes
LEFT JOIN (
    SELECT ship, class
    FROM Outcomes
    LEFT JOIN Ships ON Outcomes.ship = Ships.name
    WHERE result = 'sunk'
) AS temp ON Classes.class = temp.class OR Classes.class = temp.ship
GROUP BY Classes.class
--------------------
-- task57
--------------------

--------------------
-- task58
--------------------
SELECT t2.maker, type, CAST(100.0 * tp_models / all_models AS NUMERIC(5,2))
FROM (
    SELECT maker, type, SUM(tp_models) AS tp_models
    FROM (
        SELECT DISTINCT maker, 'PC' AS type, 0 AS tp_models
        FROM Product
        UNION
        SELECT DISTINCT maker, 'Laptop' AS type, 0 AS tp_models
        FROM Product
        UNION
        SELECT DISTINCT maker, 'Printer' AS type, 0 AS tp_models
        FROM Product
        UNION
        SELECT maker, type, COUNT(model) AS tp_models
        FROM Product
        GROUP BY maker, type
    ) AS t1
    GROUP BY maker, type
) AS t2, (
    SELECT maker, COUNT(model) AS all_models
    FROM Product
    GROUP BY maker
) AS t3
WHERE t2.maker = t3.maker
--------------------
-- task59
--------------------

--------------------
-- task60
--------------------
SELECT pr.point, pr.profit - CASE WHEN ls.loss IS NULL THEN 0 ELSE ls.loss END
FROM (
    SELECT point, SUM(inc) AS profit
    FROM Income_o
    WHERE date < '2001-04-15'
    GROUP BY point
) AS pr
LEFT JOIN
(
    SELECT point, SUM(out) AS loss
    FROM Outcome_o
    WHERE date < '2001-04-15'
    GROUP BY point
) as ls
ON pr.point = ls.point