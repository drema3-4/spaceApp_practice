--------------------
-- task26
--------------------
SELECT AVG(price)
FROM (
    SELECT price
    FROM Product
    LEFT JOIN PC ON Product.model = PC.model
    WHERE maker = 'A'
    UNION ALL
    SELECT price
    FROM Product
    LEFT JOIN Laptop ON Product.model = Laptop.model
    WHERE maker = 'A'
) AS pc_laptop
--------------------
-- task27
--------------------
SELECT DISTINCT maker, AVG(hd)
FROM Product
INNER JOIN PC ON Product.model = PC.model
GROUP BY maker
HAVING maker IN (
    SELECT DISTINCT maker
    FROM Product
    WHERE type = 'Printer'
)
--------------------
-- task28
--------------------
WITH maker_count_models AS (
    SELECT maker, COUNT(model) AS num_models
    FROM Product
    GROUP BY maker
)
SELECT COUNT(maker)
FROM maker_count_models
WHERE num_models = 1
--------------------
-- task29
--------------------
SELECT Income_o.point, Income_o.date, inc, out
FROM Income_o
LEFT JOIN Outcome_o ON Income_o.point = Outcome.point AND Income_o.date = Outcome_o.date
UNION
SELECT Outcome_o.point, Outcome_o.date, inc, out
FROM Outcome_o
LEFT JOIN Income_o ON Outcome_o.point = Income_o.point AND Outcome_o.date = Income_o.date
--------------------
-- task30
--------------------
SELECT point, date, SUM(sum_out), SUM(sum_inc)
FROM (
    SELECT point, date, SUM(inc) AS sum_inc, null AS sum_out
    FROM Income
    GROUP BY point, date
    UNION
    SELECT point, date, null AS sum_inc, SUM(out) AS sum_out
    FROM Outcome
    GROUP BY point, date
) AS temp
GROUP BY point, date