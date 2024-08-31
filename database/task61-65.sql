--------------------
-- task61
--------------------
SELECT SUM(pr.profit - CASE WHEN ls.loss IS NULL THEN 0 ELSE ls.loss END)
FROM (
    SELECT point, SUM(inc) AS profit
    FROM Income_o
    GROUP BY point
) AS pr
LEFT JOIN
(
    SELECT point, SUM(out) AS loss
    FROM Outcome_o
    GROUP BY point
) as ls
ON pr.point = ls.point
--------------------
-- task62
--------------------
SELECT SUM(pr.profit - CASE WHEN ls.loss IS NULL THEN 0 ELSE ls.loss END)
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
--------------------
-- task63
--------------------
SELECT name
FROM Passenger
WHERE ID_psg IN (
    SELECT ID_psg
    FROM Pass_in_trip
    GROUP BY place, ID_psg
    HAVING COUNT(*) > 1
)
--------------------
-- task64
--------------------
SELECT Income.point, Income.date, 'inc' AS operation, SUM(inc) AS money_sum
FROM Income, (
    SELECT Income.point, Income.date
    FROM Income
    EXCEPT
    SELECT Income.point, Income.date
    FROM Income
    INNER JOIN Outcome ON Income.point = Outcome.point AND Income.date = Outcome.date
) AS not_need
WHERE Income.point = not_need.point AND Income.date = not_need.date
GROUP BY Income.point, Income.date
UNION
SELECT Outcome.point, Outcome.date, 'out' AS operation, SUM(out) AS money_sum
FROM Outcome, (
    SELECT Outcome.point, Outcome.date
    FROM Outcome
    EXCEPT
    SELECT Outcome.point, Outcome.date
    FROM Outcome
    INNER JOIN Income ON Outcome.point = Income.point AND Outcome.date = Income.date
) AS not_need
WHERE Outcome.point = not_need.point AND Outcome.date = not_need.date
GROUP BY Outcome.point, Outcome.date
--------------------
-- task65
--------------------
