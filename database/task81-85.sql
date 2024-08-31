--------------------
-- task81
--------------------
-- Задание: 81 (Serge I: 2011-11-25)
-- Из таблицы Outcome получить все записи за тот месяц (месяцы), с учетом года, в котором суммарное значение расхода (out) было
-- максимальным.
--------------------
SELECT Outcome.*
FROM Outcome
INNER JOIN (
    SELECT TOP 1 WITH TIES YEAR(date) AS Y, MONTH(date) AS M, SUM(out) AS ALL_TOTAL
    FROM Outcome
    GROUP BY YEAR(date), MONTH(date)
    ORDER BY ALL_TOTAL DESC
) AS temp ON YEAR(date) = temp.Y AND MONTH(date) = temp.M
--------------------
-- task82
--------------------
-- 
--------------------

--------------------
-- task83
--------------------
-- Задание: 83 (dorin_larsen: 2006-03-14)
-- Определить названия всех кораблей из таблицы Ships, которые удовлетворяют, по крайней мере, комбинации любых
-- четырёх критериев из следующего списка:
-- numGuns = 8
-- bore = 15
-- displacement = 32000
-- type = bb
-- launched = 1915
-- class=Kongo
-- country=USA
--------------------
SELECT name
FROM Ships AS s JOIN Classes AS cl1 ON s.class = cl1.class
WHERE
CASE WHEN numGuns = 8 THEN 1 ELSE 0 END +
CASE WHEN bore = 15 THEN 1 ELSE 0 END +
CASE WHEN displacement = 32000 THEN 1 ELSE 0 END +
CASE WHEN type = 'bb' THEN 1 ELSE 0 END +
CASE WHEN launched = 1915 THEN 1 ELSE 0 END +
CASE WHEN s.class = 'Kongo' THEN 1 ELSE 0 END +
CASE WHEN country = 'USA' THEN 1 ELSE 0 END > = 4
--------------------
-- task84
--------------------
-- перепроверяй
--------------------
SELECT C.name, A.N_1_10, A.N_11_21, A.N_21_30
FROM (SELECT T.ID_comp,
       SUM(CASE WHEN DAY(P.date) < 11 THEN 1 ELSE 0 END) AS N_1_10,
       SUM(CASE WHEN (DAY(P.date) > 10 AND DAY(P.date) < 21) THEN 1 ELSE 0 END) AS N_11_21,
       SUM(CASE WHEN DAY(P.date) > 20 THEN 1 ELSE 0 END) AS N_21_30
      FROM Trip AS T JOIN
       Pass_in_trip AS P ON T.trip_no = P.trip_no AND CONVERT(char(6), P.date, 112) = '200304'
      GROUP BY T.ID_comp
      ) AS A JOIN
 Company AS C ON A.ID_comp = C.ID_comp
--------------------
-- task85
--------------------
-- Задание: 85 (Serge I: 2012-03-16)
-- Найти производителей, которые выпускают только принтеры или только PC.
-- При этом искомые производители PC должны выпускать не менее 3 моделей.
-- 
-- не понял зачем тут нужен min
--------------------
SELECT maker
FROM Product
GROUP BY maker
HAVING COUNT(DISTINCT type) = 1 AND (MIN(type) = 'Printer' OR (MIN(type) = 'PC' AND COUNT(model) > 2))